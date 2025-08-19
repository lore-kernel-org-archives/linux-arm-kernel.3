Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1DBCA0EF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCrSI/5l0BXky7ygaJO0nnEAoj1y+QoRh+iorwK/S9g=; b=ejCKqsiZo7ftoNDjwOCIoTKCVt
	G1KmEhVggpCU3ABDRoUB07+MctNVGPnnlGMIIJ3pPG1LmYQ0tNQRS2BN8n4arMsOXpFXfG4QjjUCI
	qmZxkmDi+ZXWCzE5VDkCDtxyXaA72n9haIJe9Uvb+I2AYmRnMighSr/EwxPM2TLLUUV35DKKUFJ9V
	frgGGODjT/hPWAus8tdFNU2zQDDFLA7eJ8raOfK6mlOS0xYfYrX+B2rXn3pUq7IEHC27EYWB1u7qt
	U4AXIdAXJWYNUB7Sn+o1WXFUhSq6vqe83ENdfSLX7QlaPX5F2A7wZ6UGa3nv4afZODWouIgpnmRa9
	y1QwBiow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpv-0000000BCWb-0efK;
	Tue, 19 Aug 2025 18:13:31 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMDY-0000000AZLB-1K1d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:17:38 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250819131732euoutp01a241434a90744fdc4f1f0a5e944fd386~dLX7cb2N12073820738euoutp01n
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 13:17:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250819131732euoutp01a241434a90744fdc4f1f0a5e944fd386~dLX7cb2N12073820738euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755609452;
	bh=CCrSI/5l0BXky7ygaJO0nnEAoj1y+QoRh+iorwK/S9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aewAol5lYAJ8eG7/zvbkSEFrBbSbgMx3xnQ335/aTnRditX8ZZA+zrbCF6hOnorT8
	 a8LcF/h45ia6VDAlz6KOQDCrhJwuj8hSUUqrM0otLdAppM7fTV6fS6mx9V45NS2JKV
	 +UdoCaiT0ncEBjgP1L5Pt/BMC4SKD9sbGLodbF74=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250819131732eucas1p26bd491e9b6b747a4857905bfd50420a9~dLX63YhkO2802028020eucas1p2H;
	Tue, 19 Aug 2025 13:17:32 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250819131730eusmtip128fc54e219f6ff267b532cbfe63a317a~dLX5zXH3-0466004660eusmtip1F;
	Tue, 19 Aug 2025 13:17:30 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: linux.amoon@gmail.com
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org,
	justinstitt@google.com, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	llvm@lists.linux.dev, lukasz.luba@arm.com, m.majewski2@samsung.com,
	morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	rafael@kernel.org, rui.zhang@intel.com
Subject: Re: [PATCH v7 6/7] thermal/drivers/exynos: Handle temperature
 threshold IRQs with SoC-specific mapping
Date: Tue, 19 Aug 2025 15:17:04 +0200
Message-ID: <20250819131704.19780-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813131007.343402-7-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250819131732eucas1p26bd491e9b6b747a4857905bfd50420a9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250819131732eucas1p26bd491e9b6b747a4857905bfd50420a9
X-EPHeader: CA
X-CMS-RootMailID: 20250819131732eucas1p26bd491e9b6b747a4857905bfd50420a9
References: <20250813131007.343402-7-linux.amoon@gmail.com>
	<CGME20250819131732eucas1p26bd491e9b6b747a4857905bfd50420a9@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061736_616738_3330C796 
X-CRM114-Status: GOOD (  15.65  )
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

Hello :)

> +/* Map Rise and Falling edges for IRQ Clean */
> +struct tmu_irq_map {
> +	u32 fall[3];
> +	u32 rise[3];
> +};

Hmm, we can probably get away with less interrupts. We actually only
enable one fall interrupt in tmu_set_low_temp and one rise interrupt in
tmu_set_high_temp.

Regarding tmu_set_crit_temp, on SoCs that have hardware thermal tripping
there is nothing to clear. On others we will reboot immediately anyway,
though maybe there is nothing wrong with clearing the interrupt
beforehand? Regardless of this, there is only a rise critical
temperature interrupt, we never set a matching fall interrupt.

Maybe it would also be good to add a bool to this struct containing
information about whether a fall interrupt is in use, and reuse
the same logic for 4210?

(Nitpick: I am not a native speaker of English, but I think "clean" and
"clear" have slightly different meanings, and the rest of the code
consistently uses "clear", so it would be worthwhile to also use "clear"
here.)

> +	/* Set SoC-specific interrupt bit mappings */
> +	switch (data->soc) {
> +	case SOC_ARCH_EXYNOS3250:
> +	case SOC_ARCH_EXYNOS4412:
> +	case SOC_ARCH_EXYNOS5250:
> +	case SOC_ARCH_EXYNOS5260:
> +		irq_map.fall[2] = BIT(20);
> +		irq_map.fall[1] = BIT(16);
> +		irq_map.fall[0] = BIT(12);
> +		irq_map.rise[2] = BIT(8);
> +		irq_map.rise[1] = BIT(4);
> +		irq_map.rise[0] = BIT(0);
> +		break;
> +	case SOC_ARCH_EXYNOS5420:
> +	case SOC_ARCH_EXYNOS5420_TRIMINFO:
> +		irq_map.fall[2] = BIT(24);
> +		irq_map.fall[1] = BIT(20);
> +		irq_map.fall[0] = BIT(16);
> +		irq_map.rise[2] = BIT(8);
> +		irq_map.rise[1] = BIT(4);
> +		irq_map.rise[0] = BIT(0);
> +		break;
> +	case SOC_ARCH_EXYNOS5433:
> +	case SOC_ARCH_EXYNOS7:
> +		irq_map.fall[2] = BIT(23);
> +		irq_map.fall[1] = BIT(17);
> +		irq_map.fall[0] = BIT(16);
> +		irq_map.rise[2] = BIT(7);
> +		irq_map.rise[1] = BIT(1);
> +		irq_map.rise[0] = BIT(0);
> +		break;
> +	default:
> +		pr_warn("exynos-tmu: Unknown SoC type %d, using fallback IRQ mapping\n", soc);
> +		break;

Maybe put irq_map inside exynos_tmu_data? exynos_map_dt_data has a
switch block that is quite similar, in that it also matches on the SoC
type. This way also there is no need to have a fallback.

Kind regards,
Mateusz Majewski

