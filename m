Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C92C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 13:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m79J0HkRILX18o9YHg3zwFo1BQ7buYBrq3hUc2UmA0Y=; b=tIk3Do0fV49ZMQUhMKU1R9FWdN
	nwjjmfq+itoEcJ5TCqOH0FAoy8cdyuwTsvBTrwX66I9wEuZ90oyAFmXJ9kUUk1OArZEeM2h75dF6A
	r/B7DO7QW9gBJcQgIpdiVwBFKT83RfaN7BircvDNh2Oi8x6NjjstTObBw6sGlnN6st6jpaNTrUWYM
	oeUenB4cfXwN3PdorFLmXU72f0MlvBh238ip8bByGYMDTHJJLkG28VSn7KO1ppR6dP/XMeu6gQI7D
	BBnandY0I1bv8pI7gh1sFuRfWa2eW7TvPbJX92C9SqP2YSAzxZm0ejcF4gw3JFes81hLWl1xiURWE
	cR5ZZeug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsdM-0000000AGNh-1VSI;
	Wed, 18 Jun 2025 13:15:20 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrLB-0000000A1e9-2G6P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 11:52:31 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250618115220euoutp01558f2b6d78cb2b4d5a3c95d433a16633~KIN117Uz82466024660euoutp01l
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 11:52:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250618115220euoutp01558f2b6d78cb2b4d5a3c95d433a16633~KIN117Uz82466024660euoutp01l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750247540;
	bh=m79J0HkRILX18o9YHg3zwFo1BQ7buYBrq3hUc2UmA0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Llo+EfXzP1oOgMXB4bWM18AUmwsFEtwyMYVLGKRTfVpf1E13mpK5MD3seMzN4ImiC
	 3UER7TFNfBcA1ghElrDeQIj5A+udaRkJnHoh1Iys8bco0T0CQ4OBeCmlFB/zjoPcJB
	 dSLPq592DzDWzpMEF5NjhjnIi7MxtFSQJes5gzF4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250618115220eucas1p2b9d37e8cdd1997fa010f51cecdea5e4f~KIN1bTnxw1996919969eucas1p2k;
	Wed, 18 Jun 2025 11:52:20 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250618115219eusmtip18897b4f23ab32963bdf77ba1539d4e47~KIN01wgHH0059000590eusmtip1T;
	Wed, 18 Jun 2025 11:52:19 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: linux.amoon@gmail.com
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org,
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org,
	rui.zhang@intel.com, Mateusz Majewski <m.majewski2@samsung.com>
Subject: Re: [RRC v1 2/3] thermal/drivers/exynos: Handle temperature
 threshold interrupts and clear corresponding IRQs
Date: Wed, 18 Jun 2025 13:52:11 +0200
Message-ID: <20250618115211.2239335-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616163831.8138-3-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250618115220eucas1p2b9d37e8cdd1997fa010f51cecdea5e4f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618115220eucas1p2b9d37e8cdd1997fa010f51cecdea5e4f
X-EPHeader: CA
X-CMS-RootMailID: 20250618115220eucas1p2b9d37e8cdd1997fa010f51cecdea5e4f
References: <20250616163831.8138-3-linux.amoon@gmail.com>
	<CGME20250618115220eucas1p2b9d37e8cdd1997fa010f51cecdea5e4f@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_045230_133424_47E898C2 
X-CRM114-Status: GOOD (  11.10  )
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

> +#define INTSTAT_FALL2	BIT(24)
> +#define INTSTAT_FALL1	BIT(20)
> +#define INTSTAT_FALL0	BIT(16)
> +#define INTSTAT_RISE2	BIT(8)
> +#define INTSTAT_RISE1	BIT(4)
> +#define INTSTAT_RISE0	BIT(0)
> +
> +#define INTCLEAR_FALL2	BIT(24)
> +#define INTCLEAR_FALL1	BIT(20)
> +#define INTCLEAR_FALL0	BIT(16)
> +#define INTCLEAR_RISE2	BIT(8)
> +#define INTCLEAR_RISE1	BIT(4)
> +#define INTCLEAR_RISE0	BIT(0)

> +	/* Map INTSTAT bits to INTCLEAR bits */
> +	if (val_irq & INTSTAT_FALL2)
> +		clearirq |= INTCLEAR_FALL2;
> +	else if (val_irq & INTSTAT_FALL1)
> +		clearirq |= INTCLEAR_FALL1;
> +	else if (val_irq & INTSTAT_FALL0)
> +		clearirq |= INTCLEAR_FALL0;
> +	else if (val_irq & INTSTAT_RISE2)
> +		clearirq |= INTCLEAR_RISE2;
> +	else if (val_irq & INTSTAT_RISE1)
> +		clearirq |= INTCLEAR_RISE1;
> +	else if (val_irq & INTSTAT_RISE0)
> +		clearirq |= INTCLEAR_RISE0;

This implies that only these 6 bits are used. Is this true for all SoCs
supported by this driver? My understanding is that Exynos 5433 in particular
uses bits 7:0 for rise interrupts and 23:16 for fall interrupts. When I tested
this patch (both alone and the whole series) on 5433 by running some CPU load,
the interrupt seemed to not fire consistently:
/sys/class/thermal/cooling_device1/cur_state would never go above 1 (which is
consistent with the interrupt firing once, not getting cleared and never firing
again; without this patch, it consistently went up to 6) and I got a quick
reboot every time.

Thank you,
Mateusz Majewski

