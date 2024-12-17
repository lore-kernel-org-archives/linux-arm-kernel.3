Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A24EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 21:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YE2j3A4NxVRVl2GQB2DLusxN7V/Z1D1qyrpkRyZqAjs=; b=St2uqj2/0IMMUsqa2VYQg4WHzU
	6tmGhub+3Fpo5cBpJIvxBSIsVwJhgfvptqnNNp0d9QAmdsoR46vs7o8mkBRFkUdYF8XJHjN6Mk2C5
	/8dsxsvnj6INkpkET1DIrgQMDL1o4VOclRNLJKAKv6aAEBXfg+Sv2XL07yzREW4dT9vzaTDB0L5JB
	k2T+iXgU5b2wbaNGEBWW2TnjaS8ODDKcAAC4BVWBtzs93X8TVutakdvHWfUpB9nWj1/blR5dSZ5sm
	SnuEkX1PaVZL33MjnpmoAyP3TC67SfWM/fJoDZSwt8RC7MbdvvIbhWURujGd4GwQfcUD8XcGeyPGm
	Rr18aqlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNf7d-0000000Erru-0125;
	Tue, 17 Dec 2024 21:28:53 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNf0J-0000000EqUd-351e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 21:21:21 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734470476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YE2j3A4NxVRVl2GQB2DLusxN7V/Z1D1qyrpkRyZqAjs=;
	b=VUCz9OE/AV2KcJ4J/cF5KXrOcr3hPjieyyL33kZUsPDz3yA0S+1ZyfYmkt57QMq55xiumt
	2F+dSum7cm/lECcbmlUGO6V3W5MyrylY4OZ19GHhM8/0JzSCzI8rnwAvzElEsh7+UzTBfw
	U3AvPtw0WbCp9WJejotPzL1AE5lyWyc=
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
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH 06/18] KVM: arm64: Always support SW_INCR PMU event
Date: Tue, 17 Dec 2024 13:20:36 -0800
Message-Id: <20241217212048.3709204-7-oliver.upton@linux.dev>
In-Reply-To: <20241217212048.3709204-1-oliver.upton@linux.dev>
References: <20241217212048.3709204-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_132119_914582_C5B43E3A 
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

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/pmu-emul.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 809d65b912e8..7f20da32266e 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -875,6 +875,8 @@ static u64 compute_pmceid0(struct arm_pmu *pmu)
 {
 	u64 val = __compute_pmceid(pmu, 0);
 
+	/* always support SW_INCR */
+	val |= BIT(ARMV8_PMUV3_PERFCTR_SW_INCR);
 	/* always support CHAIN */
 	val |= BIT(ARMV8_PMUV3_PERFCTR_CHAIN);
 	return val;
-- 
2.39.5


