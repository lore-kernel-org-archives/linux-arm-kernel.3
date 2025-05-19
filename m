Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974CCC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwQInU0BL1914wpsZlAYnKCHkRSUkFmFPhaLTIKOJvw=; b=XGehfOHklcaWBBE491boNItTX8
	Vnm8T/9ieqm29E6ekSOvkBCT8C4XxDGw0kdj3K4FZxcYV6b/lh9LR6Nl/87SsQ4uruHQYPr2e37Nn
	4D0peovMd6nelxJcu8N0MKf+xVNkQYzIomDhM5k5YE1BEO4RicaIGUUELsYNhhRmnJr4k13EtEGPl
	CHQZ4u2hSvo45esBkadTiboDnPMGF84X+k/C0l7R4VfkqpEuJojg2A4yBM+FysQLKrGWbwaPncp94
	xs+dwDRC9tLvtj0EE6q06Dr1G2iZ5MZUApHlrXN/2X20s6WhnS46yNu1ovp9OuANMAKVUD5UCy+9G
	TOo5U2zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29R-00000009XXA-20T4;
	Mon, 19 May 2025 15:11:37 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1LW-00000009QaW-3OgX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:20:04 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e7b943bcf0cso1390435276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 07:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747664402; x=1748269202; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VwQInU0BL1914wpsZlAYnKCHkRSUkFmFPhaLTIKOJvw=;
        b=TJqKKAMkRRKFiIDyT0ZMJR+/1H3iz5wUWBKIsHRSG8D/+epBNY4WiAVhuOgaq4U7aL
         bYcxz4y4t/l/gSfyrB70Xqtr6KtftfdocibMgr3CgO72YkYYt3NLWQSuJAtS1yGeEfEg
         0nn5v3GJqHaaYBiBGeu378Z76NLRlV8zOJ3EST+GPmcqZuP0+e6w8JLoAO+6K0Z7VNyp
         dr4VxlA0SrNo5TcTbF0iAdDf5Q/CjZ6x0n4ohuKnNnyClcIc36cey8zQKcxIcRG3NvST
         LJA5F7oaNWPPU63+P5hFUUXK0UdL+n2OqJoEQAPr+eJxdsDGqiGskokfv345ol2Abzn8
         iqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747664402; x=1748269202;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwQInU0BL1914wpsZlAYnKCHkRSUkFmFPhaLTIKOJvw=;
        b=W0QtGArpSiTLY8hrVgaFXB5jI3LYhzyEYwIOoSHaJ2ZSbJ6fUSleGxQIXsT6uznzee
         6EuHN0zRhBVI5nTzlY/s8K679WxJLU6bsTMfrARmqFEl9rY0YMvQL1wFLlW89UwwQCVU
         CivkcFdRK50piLxBSo9aIqoP227EFXEy2ELZLwj7GP6U8gaRRSyEvVbSR3AhlgBcL+K/
         fanyBhCSeZ3Tun1oBJIvkkTDzCyVqTX56N3IhDxpPlzNsARH4el7bYMroXMBYRyjTVDo
         vV0P8+jn2EGTbjT3FaJH880nd0juRnZoNgYDbLEiLGZsE1F5P3AOOfu6fbSk5Gh8z9O1
         VgtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRjdRK0vkdxmyUMbMlmYUrsnFL1ZkE1tBxoQHg0/2Tb5djZuzXY04shChBl3YAZ4rHWUNigEqtD3n+8Txqt/NY@lists.infradead.org
X-Gm-Message-State: AOJu0YwYUPy/YsK4jWtW10anDlU5zawh/Q7i2/lLi88lCgfUGb+IKIRE
	ikdi8ChKnKolw2hU5ARCYkDV3XlW4hEM8jcC2WemKIp9Empupj+71qUy95qqmM27N50C4Gi5OB3
	T9fS0UNThXMyusbPFRAzxW+oTgrf8ki0bzXLbRQcckA==
X-Gm-Gg: ASbGncu800tYU4JwjBZbZQDZ5VCZpd2lLA7tS184b0I9UrkwbyndxDuCx8SmDmBEFZk
	u4+IolMrhO4gWiiH+rqqDu6IrsCGgO1PNvInVZrJmFc0TLBs3ygnWUSxPzGPXF4PBj2D1dKjZfe
	io0o1Rj90Q8OZuS1e4FpWWRVg8plgy0tfDrg==
X-Google-Smtp-Source: AGHT+IGVX5yoYnItadKdZEWYQJ/USDnrDlwuwkIIEH6RYqaUPWRWklz3ss+nUUlHYUuwh48nx0lmjtA1sqsNK6i35fA=
X-Received: by 2002:a05:6902:140c:b0:e7b:5a74:f6d7 with SMTP id
 3f1490d57ef6-e7b6d715875mr16156878276.46.1747664401556; Mon, 19 May 2025
 07:20:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250318230042.3138542-1-sbellary@baylibre.com> <20250318230042.3138542-3-sbellary@baylibre.com>
In-Reply-To: <20250318230042.3138542-3-sbellary@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 16:19:25 +0200
X-Gm-Features: AX0GCFuLITcWApASOkr6vaKuGc_781MXCq425ewvVNK_o0ULs7kwJTkxaVmgo8s
Message-ID: <CAPDyKFq-0XEgw2SX_4JoGXnrCF+S_HYjEw8cG_RX+usWTEFg5A@mail.gmail.com>
Subject: Re: [PATCH 2/4] pmdomain: ti: Fix STANDBY handling of PER power domain
To: Sukrut Bellary <sbellary@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>, 
	Rob Herring <robh@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Bajjuri Praneeth <praneeth@ti.com>, Raghavendra Vignesh <vigneshr@ti.com>, Bin Liu <b-liu@ti.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_072002_861769_2B35C160 
X-CRM114-Status: GOOD (  18.09  )
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

On Wed, 19 Mar 2025 at 00:00, Sukrut Bellary <sbellary@baylibre.com> wrote:
>
> Per AM335x TRM[1](section 8.1.4.3 Power mode), in case of STANDBY,
> PER domain should be ON. So, fix the PER power domain handling on standby.
>
> [1] https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf
>
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/ti/omap_prm.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/ti/omap_prm.c b/drivers/pmdomain/ti/omap_prm.c
> index b8ceb3c2b81c..7e36e675a8c6 100644
> --- a/drivers/pmdomain/ti/omap_prm.c
> +++ b/drivers/pmdomain/ti/omap_prm.c
> @@ -18,7 +18,9 @@
>  #include <linux/pm_domain.h>
>  #include <linux/reset-controller.h>
>  #include <linux/delay.h>
> -
> +#if IS_ENABLED(CONFIG_SUSPEND)
> +#include <linux/suspend.h>
> +#endif
>  #include <linux/platform_data/ti-prm.h>
>
>  enum omap_prm_domain_mode {
> @@ -88,6 +90,7 @@ struct omap_reset_data {
>  #define OMAP_PRM_HAS_RSTST     BIT(1)
>  #define OMAP_PRM_HAS_NO_CLKDM  BIT(2)
>  #define OMAP_PRM_RET_WHEN_IDLE BIT(3)
> +#define OMAP_PRM_ON_WHEN_STANDBY       BIT(4)
>
>  #define OMAP_PRM_HAS_RESETS    (OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_HAS_RSTST)
>
> @@ -404,7 +407,8 @@ static const struct omap_prm_data am3_prm_data[] = {
>                 .name = "per", .base = 0x44e00c00,
>                 .pwrstctrl = 0xc, .pwrstst = 0x8, .dmap = &omap_prm_noinact,
>                 .rstctrl = 0x0, .rstmap = am3_per_rst_map,
> -               .flags = OMAP_PRM_HAS_RSTCTRL, .clkdm_name = "pruss_ocp"
> +               .flags = OMAP_PRM_HAS_RSTCTRL | OMAP_PRM_ON_WHEN_STANDBY,
> +               .clkdm_name = "pruss_ocp",
>         },
>         {
>                 .name = "wkup", .base = 0x44e00d00,
> --
> 2.34.1
>

