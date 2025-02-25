Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FADDC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 01:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiZFDEoMMUeQmVYehoWgRQ2XvY7Zgjn8HI/dvzzcXBQ=; b=WrhqELOIXYuzrDLZ4tIq42+Y8L
	fnZSCxF77h1iGtfjL3w7zFQUaPp3ISgvx/AAcY5rTL9Yi+EVN/ufjql2kdQD5jNxlH11MIyJiJcQ2
	0M4KSyz3KRQmQEzCxL6Qfujn9IDU3tSaSVHYnvXq7tCzkL+RC3X20E8vWYw3oRR3x12rcUIuO1yvL
	d9TIObFqMu0+JFDrwsKhRBVIvP7eZu/F/IfoCY2Pk71X/+tj8YTKP4p/6Y7mtnvAVvZ4oCQfAj6Yv
	zaPB3ryEJc5CVka5QnOnRWBND1ApgYz0DqM/3FRLCVML1ecwzUN5j9FhXhwGkaLYS1fNpEv4Yiam6
	feyEj9kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmjxw-0000000FiwP-0Ku6;
	Tue, 25 Feb 2025 01:42:32 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmjwP-0000000FigJ-2Cvx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 01:40:59 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-307325f2436so49246681fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740447653; x=1741052453; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiZFDEoMMUeQmVYehoWgRQ2XvY7Zgjn8HI/dvzzcXBQ=;
        b=ZwVJMwDlSyZlIslV1eubc+R+ho7E50rwwSLc7TlP7iGqyUWomQPHvXFDY9KR8RmErd
         jFbR/G8ftWYTOVC3dKpdUzkRT5GjRqrF0z/WS6r0wiAa0Lsu6AL23TUBBddT+OshTpEI
         9yWDM8NrcE6xzt1txV80jn2XTOIeWjLE6MP5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740447653; x=1741052453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiZFDEoMMUeQmVYehoWgRQ2XvY7Zgjn8HI/dvzzcXBQ=;
        b=RcWTN+PF7LaPb4+degdxS6Pb9S40xaKztojpABJs5CdXnEpsm7aQhCX4S4afrKqHH4
         PYKEMJ0/0vIYuoKQJZcVXS2at6BcTm2eOd756Y23v0r2ECkCn7Tqwr3HY6qZcjpDnHMR
         Rh16odtaJgyGnQrg4xPbfZu9I2/ddZuxtU/k8e3+rzaAcjToIRdSdF7UCaWWgAxUxmc9
         Dsj40IUHqR3zj9jVsUczzux8oQjhgQDMxc9Lku8BFTd+WaFX5zPgjmm0wu7NfHycqBgE
         ztH2JRspGyFZ6/5kZ+Pmi+SjNHOkASVWv/ZasgR036SkGtrP2NkX/FRGvc7D1OgqwOGp
         OkFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBlwGqo+aJVpbPTKovaDHIFyBb65BofzlLF6w6sfsnj5Xz9hFKcoF0qxRsy+pnvSeGO0AQDPd9fWHbzyBNqN7T@lists.infradead.org
X-Gm-Message-State: AOJu0YzsKx242nkDdJDbaBAoDmEoOlWmzqifT+0SDzOb9s0MufxOaizN
	CHhJgq34eYMDZN1ziVsUpVnVH61Pybao3NTMAjBJRhluIl/uhY+zQSpvSvORDu61aGqMdDARiB+
	lLSky
X-Gm-Gg: ASbGncvBi0XObejxl9lON6+iG/QpePi4ghU6FmvKCR+1Vv9lA6F458truv6GBLPN3M+
	xwZDk4BfoBj8WVzGr9I22EPAVjnS5QZq5yyO5DIpbuBdYjzlKEI1J+Jw89p57hgINbdkagTrnBi
	qJnVl0V86XXfTYQHyPgKSulYJXteZIOUHrHpIfkPj+o72Yomc/QBnY1y34pk9vTaOma0zG6iuGt
	kxvgHh7/3C9zL/cDxDeBl2LlGYNjo6p+mQlDwyv/IMhLRjTDJhFFDHuyW2mKEWyZRrbfzv3+RAr
	fjmoMZI4XHppRtbq8Gg9hxjex4yxmI726oytprdT7u9kWRe8f1jLR5POAxGBRm5fGw==
X-Google-Smtp-Source: AGHT+IHdPnrianv0unYlnnwWiQWjUfarm4ouwFftgSY2ca96Sv6aiaSKuoQC8OFj2GZmwB6vu+6KTw==
X-Received: by 2002:a2e:9b97:0:b0:308:db61:34cf with SMTP id 38308e7fff4ca-30a59899cafmr46215591fa.14.1740447653301;
        Mon, 24 Feb 2025 17:40:53 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30a81ae81ebsm807861fa.94.2025.02.24.17.40.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 17:40:52 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54838cd334cso4015284e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:40:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX9vgWWmfjkbpGQ/X8DEtBBDyqtCPGD89Lh3gVEGuUtVGc4szjcl0ViZFLM3UJqtYSOWlZw9Px5Ao1lK4V9m/XB@lists.infradead.org
X-Received: by 2002:a05:6512:1591:b0:545:102f:8788 with SMTP id
 2adb3069b0e04-54838ee917cmr5921345e87.19.1740447651791; Mon, 24 Feb 2025
 17:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20250224081325.96724-1-damon.ding@rock-chips.com> <20250224081325.96724-4-damon.ding@rock-chips.com>
In-Reply-To: <20250224081325.96724-4-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Feb 2025 17:40:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UJb=-TsXS3bgv-rgiON5-4icGgh81gYEJuA=ieDaBT+Q@mail.gmail.com>
X-Gm-Features: AWEUYZnEpuNKLIwyvEJM2DgjUifuLCeYu_2BU0vlX35x8eRwRX1_fUCYojEGI6Y
Message-ID: <CAD=FV=UJb=-TsXS3bgv-rgiON5-4icGgh81gYEJuA=ieDaBT+Q@mail.gmail.com>
Subject: Re: [PATCH v7 03/15] drm/bridge: analogix_dp: Add irq flag
 IRQF_NO_AUTOEN instead of calling disable_irq()
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	dmitry.baryshkov@linaro.org, sebastian.reichel@collabora.com, 
	cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com, 
	l.stach@pengutronix.de, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_174057_595763_1818A9F6 
X-CRM114-Status: GOOD (  12.59  )
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

Hi,

On Mon, Feb 24, 2025 at 12:14=E2=80=AFAM Damon Ding <damon.ding@rock-chips.=
com> wrote:
>
> The IRQF_NO_AUTOEN can be used for the drivers that don't want
> interrupts to be enabled automatically via devm_request_threaded_irq().
> Using this flag can provide be more robust compared to the way of
> calling disable_irq() after devm_request_threaded_irq() without the
> IRQF_NO_AUTOEN flag.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Suggested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

