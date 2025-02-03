Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0098C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 18:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eu97JSnDOZJQo0mlrfz4ghF9+QTKmQpDVJVrWRRDCys=; b=04hHeh2D1dfkJuVvQvJofJPPYl
	lKX41iHer7iYlC95AAnIxAw97BILvUxWfBycUu4bzFLQ8WrT15YgdMP9d46NWlgzGmFPjjeu6zy+H
	A67fe9CIoPSrlZaLnEGqIVB6UHtr4EaCGCjXknvRiQeLatn7zTJM1xP0+647M93AlYMrvap0tdHOJ
	RiUO6+Fh2Lofa9ARgrFUxITO7ZsNYDTW3p7+JLscRSjNrtYkQc5bpzcNMyvVRlvnYoSPR2K+mUGia
	X9YtkWY9UEtiXvrf9LnxJ5axG9Re6IByQNKIDCnJy6buF4IDE+Vug/1llg7SHUDBL5ORL7wiadphJ
	yltDc5Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1QB-0000000GIxD-114V;
	Mon, 03 Feb 2025 18:43:47 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf1Eo-0000000GGt5-2GKR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 18:32:03 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738607520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eu97JSnDOZJQo0mlrfz4ghF9+QTKmQpDVJVrWRRDCys=;
	b=YgdNDFMwn/zsm7qQvUEG2ic6Nf1RTxd/ybFWcIhx/8dkfgjW25RwXPyXf4vr8u64OCowzn
	bcnjbRgJu3opxBddpvgae/5QNyzJQWQkb8NuwdtOxp+OCQ8IH0+K4Q/V6TgZspY4iXiJS5
	DLHuFM5tul8Kzz8KX/q4wc00lfiZsKM=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mingwei Zhang <mizhang@google.com>,
	Colton Lewis <coltonlewis@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>,
	Janne Grunau <j@jannau.net>
Subject: [PATCH v2 05/14] KVM: arm64: Always support SW_INCR PMU event
Date: Mon,  3 Feb 2025 10:31:02 -0800
Message-Id: <20250203183111.191519-6-oliver.upton@linux.dev>
In-Reply-To: <20250203183111.191519-1-oliver.upton@linux.dev>
References: <20250203183111.191519-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_103202_713483_CB08E523 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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

Support for SW_INCR is unconditional, as KVM traps accesses to
PMSWINC_EL0 and emulates the intended event increment. While it is
expected that ~all PMUv3 implementations already advertise this event,
non-PMUv3 hardware may not.

Tested-by: Janne Grunau <j@jannau.net>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 104672a0c5a2..62349b670cf9 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -856,6 +856,8 @@ static u64 compute_pmceid0(struct arm_pmu *pmu)
 {
 	u64 val = __compute_pmceid(pmu, 0);
 
+	/* always support SW_INCR */
+	val |= BIT(ARMV8_PMUV3_PERFCTR_SW_INCR);
 	/* always support CHAIN */
 	val |= BIT(ARMV8_PMUV3_PERFCTR_CHAIN);
 	return val;
-- 
2.39.5


