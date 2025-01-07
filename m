Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F56E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 10:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbZfbhz7iEzPycXJ2CVFWfaIcALTm8Fom6fe6QVaJ3Y=; b=25NIe/UM77jm8inkIawHL86Gnd
	pT71AWD16LCJmA6bu0YMiw3avmCfnERsEZLNR1ACCjrod27dc5Slc37zf23v5DsXcaQwmidS9nU9S
	dD0Q9Zi8K8CeJREzDUCitytoDaP+/wp9Lma25VB9A8FG/oG0O/HZxxyPATZGvoS3y9wZ7dX456SeJ
	h6+ADaPWONuYTWUoKXy02OwoBdtIFg+BBOmxJSoy/zVawr5+zhzlmdpiP1c+rnPLGvXuYx1MBWDY3
	Xszn59+NZuoXauLoZ0Y9/Y8bFB1an6CSb4OUjvh9s5ZAKIArsH0TLQuoyP21FlcLY7M2cg/kyGy7v
	VoFgNS5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6xo-00000004OMq-2Ol6;
	Tue, 07 Jan 2025 10:37:32 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV6wM-00000004Nr4-2dAQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 10:36:07 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53e3778bffdso16978283e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 02:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736246160; x=1736850960; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EbZfbhz7iEzPycXJ2CVFWfaIcALTm8Fom6fe6QVaJ3Y=;
        b=ePSEwu3ys7mYNzEv7VS+X9eHfSq6TAEynuP3BzomNrS29otsYkKr6LVwomgZxTp5Po
         UX0GOOyH+Zo5SWJHgNtUlDhhbOEpfN6DeLxtq26dHOaFQK1iC4u+pMrhREe6DKWPgvb1
         d4RYRXbz1rL7iZ42lCbSgGC/625Cv+d75sqvoDsPs/nKNSZj9YDhm5jkndVyIsYY84RL
         KGAtHb1yN3K7iFuSd8iAa3mrVSGD2UsB532+BqdheL+dCo9/V55W5sD444R00aPSxik9
         k0/m7inr8Zy+G9WSAjSEDyRjCxDD6ABNXYiBa7vbmfSaW3tHdP+oQOTnrbZf8VkB3uMZ
         qlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736246160; x=1736850960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbZfbhz7iEzPycXJ2CVFWfaIcALTm8Fom6fe6QVaJ3Y=;
        b=MrGabAnBNLat7cst+GQ8c8x1lNlRov7Tu4IXIBJGHuRmdKyrVjLLcMxWPR3gIEP9Fe
         pvnWUpNBl6CqScQGY5rB0cCa9+19mlb66O8Mk1pIvEU7ihXgtQ/pdKfyLpVXf/RgPNGL
         ueMQLDT/U4XsfgnhUvxo364/cKD0OWfD6Q2iLmdkAmYgkOk3QYhkYiB8AiR8LULnXC6W
         0fbcywZVU9w50XN+G5GkMQa9WJFwBeEBTGd9+Pd9WgH0NBzHXgWdobDBbMPfizvXXPEl
         1hFrr//XdKjMzlrFby/yW/y1A2Kfs/70OMuX88TJV0kB1Mac1mA6212WmzrF8fJLuuIx
         vpAA==
X-Forwarded-Encrypted: i=1; AJvYcCVhLeWxfe4Tpof7xh0W41Qwesf+0/O/rqmB81l3we5sFIPMwOa1++YhJbNBxMWmI0evpBjXP/4utQATfRQwCvW/@lists.infradead.org
X-Gm-Message-State: AOJu0YxWtiArDUhaJzZuDl3N6Of/oYM+7uqXNS3MI7djYHYEtGgRaMg4
	dd4cFO+LIWbqqx4ktYQWC/ulSQiXv/UByPQyKiPZbKb9zyxl71Sj0I79coPK/kJGL2hk8vfcDUF
	eC5An0pFqat/qMYJiB6kHWi03GEY=
X-Gm-Gg: ASbGncs0w4Iuo3S8fu+FZh8Luu2EcY3Fr16dehfUVbLdk78cx9vGPJQ/yJbyjCWDSDU
	8hdMG8441Kh3BdWU5d8skWo6ywBlfagttqhkXPUG8SHuyEVg2TqRc+QtaDjmmzGqjCEnIEQ==
X-Google-Smtp-Source: AGHT+IH/zgB5AIW8SXe9fLjt6csgYHV150OAiMaYUNGL55jIFK9HyFHffxA0F1up0XAC1lvyFU3qoTZjri7PgMpYmPM=
X-Received: by 2002:a05:6512:104c:b0:540:1fec:f321 with SMTP id
 2adb3069b0e04-5422958243bmr18443941e87.41.1736246160170; Tue, 07 Jan 2025
 02:36:00 -0800 (PST)
MIME-Version: 1.0
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com> <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
In-Reply-To: <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 7 Jan 2025 07:35:48 -0300
X-Gm-Features: AbW1kvbqKfp_hBVMEYDDaHbQzJ92mQ9GQWt0UJSLPvbJH41ssSImPCn2Z_2AU3U
Message-ID: <CAOMZO5CasQDRu=U7zUxzuFVBHyREZ7oyG8+SJjg2BF58B9G3wg@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: samsung,mipi-dsim: Add imx7d specific compatible
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_023603_698877_FA263AEC 
X-CRM114-Status: GOOD (  16.66  )
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

Hi Alexander,

On Tue, Jan 7, 2025 at 6:50=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> This add a imx7(d) specific compatible which is compatible to imx8mm.
> This silences the dtbs_check warning:
> arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: dsi@30760000: compatible: 'oneO=
f' conditional failed, one must be fixed:
>  ['fsl,imx7d-mipi-dsim', 'fsl,imx8mm-mipi-dsim'] is too long

The warning here is about using fsl,imx8mm-mipi-dsim.

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/samsung,mip=
i-dsim.yaml b/Documentation/devicetree/bindings/display/bridge/samsung,mipi=
-dsim.yaml
> index 4ed7a799ba26b..e43fec5609417 100644
> --- a/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.=
yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/samsung,mipi-dsim.=
yaml
> @@ -27,7 +27,9 @@ properties:
>            - fsl,imx8mm-mipi-dsim
>            - fsl,imx8mp-mipi-dsim
>        - items:
> -          - const: fsl,imx8mn-mipi-dsim
> +          - enum:
> +              - fsl,imx7d-mipi-dsim
> +              - fsl,imx8mn-mipi-dsim

But you added a fallback to fsl,imx8mn-mipi-dsim, so this does not look rig=
ht.

I have already sent the following fix to address this issue:

https://lore.kernel.org/all/20241217131431.1464983-1-festevam@gmail.com/T/

