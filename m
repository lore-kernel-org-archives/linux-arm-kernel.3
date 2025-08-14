Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E09CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 04:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPXgL5JA1NadViWzO3at4LaILf4SB9CfhgF57NmFOj0=; b=0jgxsRuVIZWiu8L/jTYGwvBKjr
	dgF7x/Z8kNcAeiyiU1pc7cr1EE3PCl4d69KcPrB2/qFQ2jz4U6VdWx7C1VWPE7YfzMQasPjIzvXJz
	XhcxgBi0wwpOUjK6XjDBt/0ZFTj46DvpnZPOYYf3+wlUwaOM3Gy3oGMXyjdP16MnWNhAZIrBPVnDP
	xfGtdvTjdrcDPlEdKWqdBId7g5otfCfFdgrdRxJjkHYRWwdoIMMV6cpRAstoEgIbFfhacOkpxiULE
	F5rriVFtJFaD9shHvGjmMcZ503ophJhihKnEdLbBFkLjxDG1YIgOATGqorJRnDciKxVHdcEdsJwmW
	6gym61Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umP9i-0000000FiPO-3tQg;
	Thu, 14 Aug 2025 04:01:34 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umP4O-0000000Fhe8-1Vjs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 03:56:05 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55ce526627dso495230e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 20:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755143762; x=1755748562; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPXgL5JA1NadViWzO3at4LaILf4SB9CfhgF57NmFOj0=;
        b=QuMBIZR3OnXDDvqpXw7hUTMW7tuWeyPAxM17FL+EnKonjms6cZVS5yLiYxEXq4yc4f
         dH7cAaCS3QkTb/5la38QI0gW21cOQKjJHHc0U/IDMLAEGpdzaOHjOwVqzFXUNG25uW/4
         SxEngRnQJCUuiSYqt1S3Qp8O7QM2uLsDnjfes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755143762; x=1755748562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPXgL5JA1NadViWzO3at4LaILf4SB9CfhgF57NmFOj0=;
        b=SAfiqbacyPH2IsTumftlQGZQnFdL1s6wU8tJZVpkWhKC7uhG5nHfaI5L+h8nYZqKN+
         8234HJhL2pNcf5nOaQr8Ba73d7DxVyk7U5G8LpNBXGd8lfz/uVBo/BAlmrmphCLF/7aG
         Jqarn2E7E0xfz2gQae9e83/LbstEEAo+x+/mj+WxBlYCJbILedXrNRH4ETbdQwbnMF4t
         KYvMbuEtEn6y4d7w5dzve1JMferR0tMPkHwx7qb2AibnoLz7qpBbKiG39I5LsHqsNvnO
         VaEIlQxQz7ZMGBME08DtHDLY3g5mCP7GjlRumtmjxUOd4ZhuD0bK+UpqvzyxtHpIJEhi
         PMIg==
X-Forwarded-Encrypted: i=1; AJvYcCUxqrCZwldrMzcAnMuQY72ly5mgJk1NoNZWBh7MdApP7EM+ZvEJpRzYkbvn9+Hw+BNM45TfUXGUKJG23KUxbSS3@lists.infradead.org
X-Gm-Message-State: AOJu0YyfDwgqUFQZzLT+UYcUA5yW1n1OLqIO4vrzsB0ze8YTMMke2h1K
	rN24QCtkGU33Ig5cMKBghpEvxA8v1EAlieBy3nZmtZe00tXw44Jx0A6SugXGEDjmSdvGn1MkQLb
	8N2xguRwQqYPQToWGwr+ceCd3Pkduazw2kV9cuqg2
X-Gm-Gg: ASbGnctNgw7+aCM9JqtVeXfWMLkcUsk842GyuwMYIBM3W2tQszoYm7pLp9gx/1mxV1W
	nkrdEZZHMNCI/G9ajb7ILiabo8iqBz1dk/tNIMGK16skh/X9xIXRFduiKhC8jj1fvBaQqskKlD4
	aUxx5KveoG4zVWBqd07Aol3i2NdUQcks8Zwi5uDRutUL/rDLebWsRD+59Qco0OZxeDAPQ1u59IE
	rhY6Gj/ciKdi8D+kVoD0esK128N5cdV8Wtc6kt644lCaQ==
X-Google-Smtp-Source: AGHT+IHQMv69+04AP9otNVcxhwI8uWKlLmUkdvXFQ1PCUQkCenB9LDrLy/Vl+cHfeBSUvo7zV0jpH3UAnLNxpErRIuE=
X-Received: by 2002:a05:6512:4406:b0:553:2868:6355 with SMTP id
 2adb3069b0e04-55ce4ffa5f7mr485589e87.18.1755143762579; Wed, 13 Aug 2025
 20:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org> <20250812-pinctrl-gpio-pinfuncs-v4-5-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-5-bb3906c55e64@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 14 Aug 2025 11:55:50 +0800
X-Gm-Features: Ac12FXwQl-cvQ51JsCsvzfEY1EzqeHLXUhAtiyz4lnmgFYbrRneNtPbyaTw1wc8
Message-ID: <CAGXv+5GE4eUjMhewRm9oa+GbJWt8tMC0RXvT0R5FEfVOAsJ3fQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/15] pinctrl: mediatek: moore: replace struct
 function_desc with struct pinfunction
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_205604_400294_A2BAEDFD 
X-CRM114-Status: GOOD (  13.04  )
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

On Tue, Aug 12, 2025 at 8:36=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct function_desc is a wrapper around struct pinfunction with an
> additional void *data pointer. This driver doesn't use the data pointer.
> We're also working towards reducing the usage of struct function_desc in
> pinctrl drivers - they should only be created by pinmux core and
> accessed by drivers using pinmux_generic_get_function(). Replace the
> struct function_desc objects in this driver with smaller struct
> pinfunction instances.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

