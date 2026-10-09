Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15630CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kpO1tCG5HIv/cqzOAWJivVcwy5OOomh9LxwQpEYV4mI=; b=qLjV3AEDpken8VQNkhMe97GGGh
	uREBi5JYsLxhABQn/sFmhKzLgpiObGv+WSI7+SvxVLFBPsZfftEE1BIUHdvpE8xIE84cjf+Oat6DL
	dq0KmlwJFc0Zqg2USG21dR1JPS0/eQqQzakOVVNCRwsxwolz/XiUiO2XKVubVKYLfyfAWKVFKhohP
	T3rF2cgAWa50d0Fpd5Nky3HX6kvZK5XE+1ecJDSBY11DUFCjv9NXSjJhvkTpXyLhuN2LzuMPpgAit
	pLXVMfb9Wl+7cLQRv0NjQC0+2lWNFjkyrLEnM88pVUuXAfaWZZupegSRrWQxh3sBLv9A+lnvtvqgM
	8PlIk8wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFM1-00000006yd2-045J;
	Fri, 09 Oct 2026 18:30:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLt-00000006yXA-1mnk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 18:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kpO1tCG5HIv/cqzOAWJivVcwy5OOomh9LxwQpEYV4mI=; b=V7zJTYbCUquRu0trI0yG7rgkS4
	WW4csn4g84yFpV+ZElH6hQUetGZPGw/UjZjl7vtsX1Iili+7L0UHjHCvo1x2KGqOFBOYECqu2HWp2
	Zx/3FQbpqTfEawO1aLnnSnBuP9ohthNitY6vsQz3udIyY5JRU4vZzKddOWzPwnKNFS4fnHVP7ju8P
	FmjDkQUJMNtT7ejjHhEMNvX4FRw0EaO8xlAUFR22Poo+CS1uJ79U8LiIPqQNzvtxT9EwGMrNrHcUy
	ajNn2iiBBRP/C3+CUp2qOWCd1L8o8ZWsBvjAJ2+etBHszCxnyvlwEbMN1aw0/8TAW8Gh6zkCMi6Y4
	2wYThLCQ==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFFLq-0000000BWo8-2MLO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 18:29:52 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a17baef589so1173095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 11:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570589; x=1792175389; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kpO1tCG5HIv/cqzOAWJivVcwy5OOomh9LxwQpEYV4mI=;
        b=angCjFwtSw/QTiXaN9HDZv04VBEJcWvX2ue7lpyc3rbcZ0rbBZg7B2ZtqrYvk2bBa+
         f5zjb9y1JogDl0XAE7XeJ2Yni0k0D/8maevcLAGDFw5qDqmddyPFjMi7veDVnAPyuwYJ
         JVM1k5gbWfhQqPREZr8OrZe95C7F6lDtijTGoLY3YayB1U95aPXn4w0vOH/s9QLK+QVH
         sK/vnIrSccgnqrVr2K53981qPEwbGNRRvyilj5Ldk01FBRWb+aoZUzLiC9wA/navYx59
         /g3+KF+Yqej8PPfy4+jgLISWe6CKvqAe9sPdf3rW56JqccU4IWzEe4yxjzYYWCLIohXs
         auew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570589; x=1792175389;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpO1tCG5HIv/cqzOAWJivVcwy5OOomh9LxwQpEYV4mI=;
        b=Y/Wd8A8iCnyRlGxc+EWyWl/XPLDpYQbs9ODnfeK0xbbSkCgqgw0Bj/l06rPpy4nAvx
         feVD0PmgAL1P9vEI7+5QJFnGBbFIkf7r2pbDZc8SeJ5RSaCSRRa4yuOBeD8C/tKmcNYC
         BThQwKdU1pfTlNx2MDgTCSrP3f+WmevklSBoxr4tAK7Ksti1qFKrkHmBin/PNZxWqaQV
         zvCwPJwMqKRSM57CZkvrA6VwFfQqcS9qYV/hIjxjpXOTSuZus5yGbE7rFa1/Mf39Mz38
         yXrhJcStIGyhXFargJF8nKvk8qEIQVHsjuGJyIOWy0jPuqzF20ES4JeAJE14RTBkknkg
         jBXA==
X-Forwarded-Encrypted: i=1; AKwUvByG08pK7SGVew+iECj2Gg6AZ91ptvP7XU32vkLSzs3cRFYlzASGzcIdvXXRg8dyFVPJ55NdruDv5zhH14Hmmws5@lists.infradead.org
X-Gm-Message-State: AFuF++lFWGlc2Z9hPzunrJx1ucKZj4GoYywif4e+eOO7ImvqaCDaOQpH
	lq33llcPcyy3EgKZCIMr/nO0sfuIIlZEYJg880ib7az8njZZiVqgADhI8HavdZBmII8=
X-Gm-Gg: AYBFou2tRfRpDa9AcZ+Smcaz/J36IkVpOj56e3RtQ8hZxltQc6dOvhg/WQ1hsIz1i3t
	LnXE3KimVkLpSgcKTsMM7+k3rAHjDq2hnqM/8d1lfqWkgbHcnhlF6GhEYkrchAcwSEObxbR2Gxx
	VYQaNYHloisq6uZHGXhYu0olCpzeXy42QhpIUQwWL2ERwxXVUgGIUMygXXljdTT7V0aZ6fkTCGi
	6h4dE5PzgsYb5Flhf5cA2DXVbGrR9tbvFIzhXKoitJ8EIdUqaXDsL+tr13eTSdm1YgxSBJbr1MG
	lsgIOBfIVzxMDRR3+UnQ+3x0D/GPNQTeYQ24CtUEriAvSQwAOvFeq7PpE74EN1JudMyRzXKBJ45
	zZ8hM/AhofRUOEmm9Rg+mNfsOuBAagKZwAtQnmEiUd6sKl/pFKCoDv50zbPtfkXKCC08hIQhymb
	j8BhkwqX3TS5k/WvqjawiW5o+PMVwOgNiuJGutVVjzrf/apai9HIq18knsKG86oPPabPafafPaI
	Jf9K4PEQ+VRj/gDHA==
X-Received: by 2002:a05:600c:609a:b0:4a1:717b:7976 with SMTP id 5b1f17b1804b1-4a18e4b15e5mr55128945e9.35.1791570589461;
        Fri, 09 Oct 2026 11:29:49 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm114582245e9.9.2026.10.09.11.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:49 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 10/11] clk: realtek: Add RTD1625-ISO clock
 controller driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20261002074331.3066919-11-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-11-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057525.266328.2342228871690409432.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2619; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=809ruaTMybxoBOwSxW5LNdKvnaeznfCg43/YlBzIRDs=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaalPH3NE2e0yVH3ywbj/cU+LJf2Wv+Lbl9w5tQLk
 95SgX19HaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjIq16GP7zHCkMuaij6vE4R
 b+Ccd8/F7X+5hcDml62ex02ePJoewMjwT33THh+p0KV5z6X4exWsLCetKYj4Unk0aG+CsF1j3Bo
 eRgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_192950_700037_DDEBE263 
X-CRM114-Status: GOOD (  18.93  )
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

> Add support for the ISO (Isolation) domain clock controller on the Realtek
> RTD1625 SoC. This controller manages clocks in the always-on power domain,
> ensuring essential services remain functional even when the main system
> power is gated.
> 
> Because the reset controller shares the same register space with this ISO
> clock controller, this driver also acts as the parent device and registers
> the reset controller as an auxiliary device on the auxiliary bus.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
>
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 52d5d1b18104..e8d9017098d3 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -9,3 +9,4 @@ clk-rtk-y += freq_table.o
>  
>  clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) += clk-pll-mmc.o
>  obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-crt.o
> +obj-$(CONFIG_CLK_RTD1625) += clk-rtd1625-iso.o
> diff --git a/drivers/clk/realtek/clk-rtd1625-iso.c b/drivers/clk/realtek/clk-rtd1625-iso.c
> new file mode 100644
> index 000000000000..cd520c6e1259
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-iso.c
> @@ -0,0 +1,140 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <dt-bindings/clock/realtek,rtd1625-clk.h>
> +#include <linux/array_size.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include "clk-regmap-gate.h"
> +
> +#define RTD1625_ISO_CLK_MAX	19
> +#define RTD1625_ISO_S_CLK_MAX	5
> +
> +static RTK_CLK_REGMAP_GATE(clk_en_usb_p4, "clk_sys", 0, 0x8c, 0, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_usb_p3, "clk_sys", 0, 0x8c, 1, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc_cec0, "clk_en_misc", 0, 0x8c, 2, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_cbusrx_sys, "clk_sys", 0, 0x8c, 3, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_cbustx_sys, "clk_sys", 0, 0x8c, 4, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_cbus_sys, "clk_sys", 0, 0x8c, 5, 0);
> +static RTK_CLK_REGMAP_GATE(clk_en_cbus_osc, "osc27m", 0, 0x8c, 6, 0);

You are requesting your input by global here. This is wrong.
DT names are stable, internal CCF are not. You should not rely on this.

Either give it a name in your bindings and use fw_name or use index

Same applies to the other controller

-- 
Jerome


