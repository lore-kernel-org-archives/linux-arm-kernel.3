Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E129CEE34D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 19:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvEa0jnc5aqBUZoWbfiQtt/7FtL9NO49WZyr4JCqvhE=; b=QWeYewPEg7spO7MV5Q1SFLkhp6
	wS9Na4AjEZeIjRRarH8Segr0ngnvAu8PBGfyCw8SPnDdjjo/dRkMKwNKDzjwbQyHf8wttmMQ/SuRK
	pbmlYJ4539ZLqJbR15zLLFkekFmovkExQuqwFTOqlCoNUp46eHtAqe40bF6qsP884SSA5+OcvBfNf
	w8/9zfV74yNoODo5uO2Gpk6fjvIyVusSfSQ99NGmrgpAp5VX5QtAePQh3C3herwnzSfuQ+j0BYeLO
	w5xVelgUL6E4w8gHz/8lZvCUzB0Ys3HlPsIfUOvTeObi6W3m+BFL4hkOWjiw/zvuE8eFtjyDtRxtG
	qoPdy86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLRHm-0000000110P-0LVb;
	Tue, 18 Nov 2025 19:22:43 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLRHi-00000001100-0apY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 19:22:41 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso2439213b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 11:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763493757; x=1764098557; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gvEa0jnc5aqBUZoWbfiQtt/7FtL9NO49WZyr4JCqvhE=;
        b=cusGRyjlK+VLDLT5s/1Y+PU12xy0e3XAmumH+Wm2A2pV8aWSbdoovgrGW1w3/QbTsZ
         IYIHPZC22mFufgIWCqo8QISCYWvNzNuZQlPo/mq/d3J3FSLH+t2jXRArlZHFv+OnFPfk
         XuDFLu/NVwZdpA275V6mhR2k+dxhDsq2OnUbuckGFEKOFzuU29ruhSiDMzzves+4hoFH
         fM+s5rNLKn8mBOlsUVSrOO4dsPJxsHqi+L8BQildRcED7fbewwJbYGI+4qiIQhc7Hxhm
         Yuc6QTDnuvT3mZk4G0qmNRjzT3qcAINfoK5MvGzI2eOeG9cg+izTtOa2f6u/AjZEEmX3
         /4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763493757; x=1764098557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvEa0jnc5aqBUZoWbfiQtt/7FtL9NO49WZyr4JCqvhE=;
        b=Sd08YkXg/u2D9O3hS+pQzMi9Nd8cl0iLPnlHCHROeTGIt3Ee5fpqNhFpswoIoQIa4c
         HFJAeohTjftuCPz/pUKQO9yzo6RFnWaiU7YpX4exJ7ajPYLcMV/2EfOKPQp1i28w+lOm
         fJNhgxXelTbvFqkolfEr9Puuq9Y+a7luxYXM9dyE9JnXPWzzEKdDEGKZeLcg/rl2pPS4
         yCSDvFaqE5oduX7VT9kY/cTFtB8tGIfPD8cTqYimv1jIDuVzrCEPsNb5ziEQ2Bq5bncp
         1uE0vUlcDbanMb6kXpX8I8//fYnRjBZa8gIg0jPGl/o15Wy4TwIURvYWVZbhhmOojE3R
         suDA==
X-Forwarded-Encrypted: i=1; AJvYcCUelUVah5m7XCkyahTIyYe3m91I1e0it7iGcWm99TEyn1xm2siYPyVEQWp2t2cBJJu1CGkkSoVUCouFPzTuy49X@lists.infradead.org
X-Gm-Message-State: AOJu0YwVpEGoXnW6BmsyLGjBF0jALQO5u1xb/9af1v4VOygUyi6WvBuF
	7dDGXaEPt1V77az7N7vro6RX0W1r+AtCuo9AHdWxyy8w7kxv1285AaAo
X-Gm-Gg: ASbGnctmu6wA3FFu857D9kmtsxmaqRlkrTS00jIEukzZLtqYJL4BPIfQEFQs8zeeWkd
	tmgYit5SfyfjuD6HA8pZSHglfrf5PNQPSfXXmo/nj7XLOU5IVOAUXGV4RIG25OZQUnKRFzr13PU
	uUwF9+jH0+F4GKRiB6y5nqgWrxNKO2YxhsPh4CNlUok6c/25Paoc5JpyF36/JKTvMqGlArGkpCs
	gi8QQmCutAfr+kgFXg/F19iuxnduHHzUWptbWFz23O4I54g6JxEwixmTm4pfQtAvAsKOMCToCff
	VHIs2x/vs0ca8guWbFxWL/7S2ZmSepXbi2cS3xG8ZxkRyhWxAx9iMWMNSEymKlYOUjLnMlDWxlb
	XF6BqRuo85zvroPehBs9jEIm7rcEX9H8i1e+pIBfWssruD/FCLqylR2MWJ0eP7pw5iQfzkPyLV2
	yukXY5g0tPMr4nTx1OxnRmDbT0Nq/m7dd8G0LVJvgFTsxQ9zi6yanYH6bViAPzIRlotqpQP7NiH
	g==
X-Google-Smtp-Source: AGHT+IELEZhYWlXzd98KtP04N9FRevtbbB+qIzdu2jhq6XqeRQcPW3sY3BwS8IiZhjDpaOtgcw6rPw==
X-Received: by 2002:a05:7022:43a6:b0:11a:49bd:be28 with SMTP id a92af1059eb24-11b40e846demr7788674c88.4.1763493756655;
        Tue, 18 Nov 2025 11:22:36 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a011:6b85:c55d:d1f5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b06088625sm64635016c88.8.2025.11.18.11.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 11:22:36 -0800 (PST)
Date: Tue, 18 Nov 2025 11:22:32 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/11] Input: ilitek_ts_i2c: fix warning with gpio
 controllers that sleep
Message-ID: <rifyic7w2zyjupbmzwcewcslryqiyexxdvbgcuxtkw3trmtulw@y4otarfyvgm7>
References: <20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com>
 <20251117-imx8mp-hb-iiot-v3-4-bf1a4cf5fa8e@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-imx8mp-hb-iiot-v3-4-bf1a4cf5fa8e@solid-run.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_112238_186207_3085355A 
X-CRM114-Status: GOOD (  21.84  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Josua,

On Mon, Nov 17, 2025 at 01:28:46PM +0100, Josua Mayer wrote:
> The ilitek touchscreen driver uses the non-sleeping gpiod_set_value
> function for reset.
> 
> Switch to using gpiod_set_value_cansleep() when controlling reset_gpio to
> support GPIO providers that may sleep, such as I2C GPIO expanders.
> 
> This fixes noisy complaints in kernel log for gpio providers that do
> sleep.
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  drivers/input/touchscreen/ilitek_ts_i2c.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
> index 0dd632724a003..8c5a54b336816 100644
> --- a/drivers/input/touchscreen/ilitek_ts_i2c.c
> +++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
> @@ -396,9 +396,9 @@ static const struct ilitek_protocol_map ptl_func_map[] = {
>  static void ilitek_reset(struct ilitek_ts_data *ts, int delay)
>  {
>  	if (ts->reset_gpio) {
> -		gpiod_set_value(ts->reset_gpio, 1);
> +		gpiod_set_value_cansleep(ts->reset_gpio, 1);
>  		mdelay(10);

This (and below) should be usleep_range/msleep/fsleep.

> -		gpiod_set_value(ts->reset_gpio, 0);
> +		gpiod_set_value_cansleep(ts->reset_gpio, 0);
>  		mdelay(delay);
>  	}
>  }
> 

Thanks.

-- 
Dmitry

