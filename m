Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023CBC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 21:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eu97JSnDOZJQo0mlrfz4ghF9+QTKmQpDVJVrWRRDCys=; b=Zb6lcFbIv0wI0zWVMXyvRvSn9D
	FA/iIWxmNPBbyzHUxuPPIdQ6oKjlSsfxH9SvhPq1yo1VyLrAx7YbdQB7Gbz3MsTvs29k3eXjks4sR
	KN00R5TYCR9zoDFXkHfUrgeG9K91gdouGrrY3vrwOA0bQb9ngAHKcAOa9tJnDjHDc1nGAsPmlhxor
	JOWcFtKQV13HKMrvZQy6J03fWI4cHLT640ObVhYj+cBB7L53tVLgexa2l0wY11tImscU5Gp6LmJFt
	vaSvy/+ciP9EvnO+LI77OgeUwlY4X0Hg49y+GYTIvb+JDFK8y2IQyY2p6xrMeyWbEOrydL/xocd8G
	Lk3uUHRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpw3x-00000009Jfu-0N5g;
	Wed, 05 Mar 2025 21:13:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvKi-00000009D7q-14T7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 20:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Eu97JSnDOZJQo0mlrfz4ghF9+QTKmQpDVJVrWRRDCys=; b=epJH1PCQxv++04loviEcWyf2rx
	UgufLg69plxCtgV4wLiGy0virNkulgQ0B3JcjQtlLTefgzbDLDhpVNOQzK1U+VIZhiAqVqS8ag7lT
	nUuLatuvK6+AW32bqfgMkDbMbYsx8sr4k8jDmBHa9/T5KRHFghDa+7kMzKmDJDeAscXiFUzgTejkh
	JZQO0UAAz+HEN2rDOugtvUcKGjDO9PyBg0pHB0Lpf0AELFFJ5a56wN5lCU04INpf+fbvOOZhhJJOl
	T1MyH/3tVEyLe4L3E3vf5oPmOxhNmsfidr1egwC4IXL7xOdfCkJPpDGP4E5/C7PqfgudTLOFHwAST
	B/jW+JcA==;
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvKf-00000006ATJ-1o51
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 20:27:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741206426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eu97JSnDOZJQo0mlrfz4ghF9+QTKmQpDVJVrWRRDCys=;
	b=staJyUtpLCEx7kJi16tJfAHUtcyOmDxGTUvIXlMrWOUIiWFmfTavmSyPxYFlKl4FnLg3Yb
	7BmKhgqn3CYnQscytyAzDSX+PTXQJPQHL37KRTy6h+olXlaZZCOvHLBxmJBB8+ii7YBF6F
	ISZdqI3kRlGY0RGBQpfLQ+pG5fjDQ1Q=
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
	Janne Grunau <j@jannau.net>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH v3 04/14] KVM: arm64: Always support SW_INCR PMU event
Date: Wed,  5 Mar 2025 12:26:31 -0800
Message-Id: <20250305202641.428114-5-oliver.upton@linux.dev>
In-Reply-To: <20250305202641.428114-1-oliver.upton@linux.dev>
References: <20250305202641.428114-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_202709_502125_C6317AE7 
X-CRM114-Status: UNSURE (   8.59  )
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


