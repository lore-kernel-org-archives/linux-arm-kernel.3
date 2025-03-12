Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE28C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dadpUZC9V5c7MYnunblVKwFOdnOlHudqlcLRPnjOYeA=; b=maPec2xzN/AKXc8HcOfZek3sq/
	qX7EWM6s5pTUe2/Xt5FAnAwslv9zVEeGaAlKUPMzs0mNiKOp7jhefrs7FRddBTAGXC2zbAn5uLUiz
	kJMGkxDvuG68yXxp566oUEj6jFSIHmB/PqObzICSLg0TIeOx7Oc3pIFwZM/LFiGh+sxFnI4ZPfaph
	afgoD4qQ9FT95O7qGtQJmPWf+W7byMqJnLgtt6PePaxejnKG6WHaaq9c/Vgot/8lROD7f5LXpXciH
	2+j6Fr1HAesNz8kdEfi+oNc/PigYbLGEqMucY/wtKxealA5yAVL8G4M/1zP+sR0LV00+97ak9+usC
	iKDzPXNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsL43-00000008NxE-3X2f;
	Wed, 12 Mar 2025 12:19:59 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKDJ-00000008FQD-0ywQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:25:30 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6ef9b8b4f13so60003127b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778728; x=1742383528; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dadpUZC9V5c7MYnunblVKwFOdnOlHudqlcLRPnjOYeA=;
        b=H2pnEBYe7DVOcLG7dZpvI97VwjWWuJrlPfaQenP6tJTw5UnSWcbO2YeHmcQT5Ww0KN
         tWO43kYXXG0ZaykcTpKTD9G0kuyOOVQcC8zcplgE1KVOEQJzO08x4f20GUYbv0xtz4LF
         Yeay4MYBxooxh+b1+vxF34qKl51W9qCglL2WtKPd103dHCXkjzdfOFUrv1J3gu/c6RjG
         A7aZc21btInXwB6xLsZ06KOHfNcaPYlsXTErIttRqPOEPp9Qf0I3ltch6XGTU/Gyuu4l
         VyleefEqTbYOxYttQmm56ciiGWcSPWRD5EWEpbZwROiqplSe5CDqu6yP7MOHC/8Ta7+y
         TTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778728; x=1742383528;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dadpUZC9V5c7MYnunblVKwFOdnOlHudqlcLRPnjOYeA=;
        b=gUWf7kuHZPHTzjOeBYkFUBfPRx+jElOjkhI5Bc3pl/CulcvB8SFHwr48DTymS5P87U
         yXTJnt201fdoExuYlKBcI5QKZiIiCZSjen4kP6A7B9HP05mgybhi+f1NR1wwy0aq5QLr
         yI9BbTuksR9zsDr3nspSaX1mkgVn2rt2tw5FuBWAfjByDfKW8WpeK6uhEUzp6UJIXnKn
         Tp5IvM6kWdU2UqtDsJ7a9S6/hMyiv/d+bfkXkStvDAH1HoiXgYeqEjPcMw+543/pdUJa
         pcjz5jVBD2MOutpT3Bc4UTi/e/gE8bnUZocnbVYY6lLNrMtkQeZ4UoWzUkyQKiOp5tp3
         3yDg==
X-Forwarded-Encrypted: i=1; AJvYcCVBpgH80UQWtC0lMkrX70SfeVbQAgpdKbesBJsfvsZyIm4fpwGxzi/hOIlU3Y2K7joXCyTC2YIHRjwLsYDtLHuI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/Rne6rWWmH91tDzrwGDIrBujY8cVFbyy3l9BFGkeFfhB7vGqn
	yOhow8lql/fjyQzSv5j5gO6F/NMn2WAk5XUr1vSBOvZNrl4To50DqPTUo5iM8VXwsrNBzVMZU/k
	ckX/1Bp5gZzKe5LtcU9bQfmyS+J3wiUNT+4wKMQ==
X-Gm-Gg: ASbGnctFXN7+T982YoHTgW7lu6unDcnG8Uxcd/1LCRdykgvyp1rtnPBe+Clz4IcXVd3
	KJz5/8CFryulfg7X0KYzzYIAgN+o3AzhrfWj/H/nRrHfSh5LlVz50Oe30is9/ZwwDEPkQkEZLu2
	w6wS+e+VdTfr0oRfcuSga9jXpOhh0=
X-Google-Smtp-Source: AGHT+IEkegzJ/XAYlghTUeG+wVwA3ds93Wxe6yvoeV0jHqydpXmTqXQvt4bDvlouPz1OikUEEzcCwOPsAA9n/cL6aTA=
X-Received: by 2002:a05:690c:3802:b0:6fb:4c11:61cf with SMTP id
 00721157ae682-6febf2e67e6mr312924957b3.19.1741778728184; Wed, 12 Mar 2025
 04:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250309055348.9299-1-ziyao@disroot.org> <20250309055348.9299-2-ziyao@disroot.org>
In-Reply-To: <20250309055348.9299-2-ziyao@disroot.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:24:52 +0100
X-Gm-Features: AQ5f1JoG4yNR3eqoseTNZhzIg7tVbmXvgNO4DfacKMnpZftoLIoMXOX2r6zD6_U
Message-ID: <CAPDyKFp2UzcxfFz=8sREkj3x4DvfkfxU3utc0+e+uPS78Tn-+g@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: mmc: rockchip-dw-mshc: Add compatible
 string for RK3528
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shresth Prasad <shresthprasad7@gmail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Detlev Casanova <detlev.casanova@collabora.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Chukun Pan <amadeus@jmu.edu.cn>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_042529_273396_B947EFF4 
X-CRM114-Status: GOOD (  13.52  )
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

On Sun, 9 Mar 2025 at 06:54, Yao Zi <ziyao@disroot.org> wrote:
>
> Add RK3528 compatible string for SD/SDIO interface.
>
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> index 06df1269f247..ea0feb733e32 100644
> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> @@ -38,6 +38,7 @@ properties:
>                - rockchip,rk3328-dw-mshc
>                - rockchip,rk3368-dw-mshc
>                - rockchip,rk3399-dw-mshc
> +              - rockchip,rk3528-dw-mshc
>                - rockchip,rk3568-dw-mshc
>                - rockchip,rk3588-dw-mshc
>                - rockchip,rv1108-dw-mshc
> --
> 2.48.1
>

