Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7C1C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 08:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4ezkbR7PDS9TMoPTn+QPbo+C1HfywmnDzGxcCIVA1E=; b=AGa9w94s/6eyWbZ5YM9ZfuQy9l
	QHydqt2fkA/EcISjuaMBRelGw7TGdl89WdFsxyR7RXjEl1OPmZJsHVoiFvCf4MySI/mWbX8tqeiQE
	1Cig9OCGzVfG2aU4Iog1qC8DwoW7EpZ3pMt/WbaGv1SRMtzq1uzST/Qp+gK5y7TKDZLZEN6URFlx3
	nSqLdlM5qIMrJNSXLEyt0OD8nennRM9aEa4PbRWmPtMz5FkcRzw94eiwyf7By9wEhyvxn2Yz59W91
	pbrn2TlkckHwsBNQbAmEI454vNQ9uvm2QSXGsse3cbzaUXS9aVNYX5w9KyywbY5WxR8Go8wFXDWnb
	Oj36X/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyzi-000000050v3-2fGC;
	Tue, 24 Jun 2025 08:27:06 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTyYQ-00000004xAg-41pf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:58:56 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250624075848euoutp02daf5238265d5fae5a7445e3d9f151931~L65pKtVDE1300113001euoutp029
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 07:58:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250624075848euoutp02daf5238265d5fae5a7445e3d9f151931~L65pKtVDE1300113001euoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750751928;
	bh=y4ezkbR7PDS9TMoPTn+QPbo+C1HfywmnDzGxcCIVA1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mT9p1Sp26cUx6K5nplYYZmYGB4FMcPPl9u6+VCsHOSD196slnMS++HLW6/APXECS3
	 uYWjwxM+pSAZkzvdE+gn5/wjh3B1gjez6DbbvwQiR8GcVCH+48ohaVop6myXW8PyAE
	 IJr7kKiHthRX2OzQXtw8HPZjQ+MTE76ft5VvWIvI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250624075847eucas1p2db6e908f78aa603bdf6aec38b653e9af~L65oyHT-r0882308823eucas1p2N;
	Tue, 24 Jun 2025 07:58:47 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250624075846eusmtip15b3b3e53371028a9ef3fb5ed7461df69~L65n2jQHD0986509865eusmtip1Y;
	Tue, 24 Jun 2025 07:58:46 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: linux.amoon@gmail.com
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org,
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, lukasz.luba@arm.com,
	m.majewski2@samsung.com, rafael@kernel.org, rui.zhang@intel.com
Subject: Re: [RRC v1 2/3] thermal/drivers/exynos: Handle temperature
 threshold interrupts and clear corresponding IRQs
Date: Tue, 24 Jun 2025 09:58:15 +0200
Message-ID: <20250624075815.132207-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CANAwSgQ=G1yJXOg1LdeEf-J56epyNiohCSdNYUvs2AHNv90Hkg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250624075847eucas1p2db6e908f78aa603bdf6aec38b653e9af
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250624075847eucas1p2db6e908f78aa603bdf6aec38b653e9af
X-EPHeader: CA
X-CMS-RootMailID: 20250624075847eucas1p2db6e908f78aa603bdf6aec38b653e9af
References: <CANAwSgQ=G1yJXOg1LdeEf-J56epyNiohCSdNYUvs2AHNv90Hkg@mail.gmail.com>
	<CGME20250624075847eucas1p2db6e908f78aa603bdf6aec38b653e9af@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_005855_588255_4064BBC4 
X-CRM114-Status: GOOD (  32.06  )
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

> I tried to configure this, referring to the comment in the driver
>         /*
>          * Clear the interrupts.  Please note that the documentation for
>          * Exynos3250, Exynos4412, Exynos5250 and Exynos5260 incorrectly
>          * states that INTCLEAR register has a different placing of bits
>          * responsible for FALL IRQs than INTSTAT register.  Exynos5420
>          * and Exynos5440 documentation is correct (Exynos4210 doesn't
>          * support FALL IRQs at all).
>          */
>
> By the way, I don't see Exynos5433 and Exynos7 support
> INTSTAT and INTCLEAR registers. We are using TMU_REG_INTPEND
>  to read and update the same register.
>
>         if (data->soc == SOC_ARCH_EXYNOS5260) {
>                 tmu_intstat = EXYNOS5260_TMU_REG_INTSTAT;
>                 tmu_intclear = EXYNOS5260_TMU_REG_INTCLEAR;
>         } else if (data->soc == SOC_ARCH_EXYNOS7) {
>                 tmu_intstat = EXYNOS7_TMU_REG_INTPEND;
>                 tmu_intclear = EXYNOS7_TMU_REG_INTPEND;
>         } else if (data->soc == SOC_ARCH_EXYNOS5433) {
>                 tmu_intstat = EXYNOS5433_TMU_REG_INTPEND;
>                 tmu_intclear = EXYNOS5433_TMU_REG_INTPEND;
>         } else {
>                 tmu_intstat = EXYNOS_TMU_REG_INTSTAT;
>                 tmu_intclear = EXYNOS_TMU_REG_INTCLEAR;
>         }

My understanding of this comment and the situation in general is like
this:

1. On 5420, whenever there is edge interrupt, no matter if rise or fall,
   a bit gets set to 1 inside INTSTAT, and we clear it by setting the
   same bit to 1 inside INTCLEAR. The current code does not rely on the
   concrete bit index, it will just check the temperature after the
   interrupt.
2. On 4210, there is no falling edge interrupts (so
   exynos4210_tmu_set_low_temp is empty, we enable polling in DT etc).
   This is what the "Exynos4210 doesn't support FALL IRQs at all" means.
   However, rising edge interrupts work exactly the same as on 5420:
   a bit gets set to 1 inside INTSTAT, and we clear it by setting the
   same bit to 1 inside INTCLEAR.
3. On 3250, 4412, 5250, 5260, it again works the same way as 5420.
   However, somebody had a copy of documentation that was incorrect: it
   said that bit indices does not match somehow, which is not true.
4. On 5433 and 7, it one more time works the same way as 5420, with a
   single change: a bit gets set to 1 inside INTPEND, and we clear it
   by setting it to 1 inside the same INTPEND.

So, all we need to do to support existing SoCs is to read the 1 bit from
one register, and set the bit with the same index in another register
(which on some SoCs is the same register). We could interpret the index
to see what kind of interrupt is this, but we read the temperature to
get similar information.

So in the end, is it helpful to interpret the INTSTAT bit index, only to
reset the exact same index inside INTCLEAR? I guess it could be valuable
if we also used the information about which interrupt it is and somehow
used it elsewhere (which could actually help with some issues), but that
is another thing to do.

> If you have details on how INTSTAT and INTCLEAR are used
> particularly regarding the update bits, please share them.
> Specifically, I'm interested in how bits [7:0] correspond to rising edge
> interrupts and bits [23:16] to falling edge interrupts
> I feel it's the same as Exynos54222.

Regarding concrete indices on 5433:
- the 0th bit corresponds to RISE0,
- the 1st bit corresponds to RISE1,
- ...
- the 7th bit corresponds to RISE7,
- the 16th bit corresponds to FALL0,
- the 17th bit corresponds to FALL1,
- ...
- the 23th bit corresponds to FALL7.

That is probably because this SoC supports more interrupts than others.
Though do note that currently, we only use part of them (one RISE, one
FALL if supported, and another RISE for critical temperature (one
supporting hardware thermal tripping if possible)). Also note that the
indices in INTSTAT/INTCLEAR/INTPEND match the ones in INTEN, though I
have not checked thoroughly if that is true for all the SoCs.

Thank you,
Mateusz Majewski

