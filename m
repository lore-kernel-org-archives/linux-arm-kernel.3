Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570B4CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 10:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bbWOCrOlOLq73gmBvLtHHZxDfL8VgWPqc674i1zrM4I=; b=WVk9mrm9G9nFSL6LhKvdHBdQ9R
	XrO5/GBeTGQ5qAB853FBh2jEb7OIkXg1cDY0IszllnPrhWpjeFPk/YtO4AnKAtoiIn+HrGbZeUGtt
	ovXkcgR4Ka+xEqsh7xEuSqf0y/5n0nQZmLLXwCC0/GASE/bRI3LBXUkXQ5QK2myIBVbrQZBFYpn4C
	hkDQHFXhB8oUmHqT1yrKXNKuA6HNSpeMVKHGFKyDfHPwFJ2XjEFB8aC3NHQlre1r8BJBSDEBlB2zE
	sSVXXGpCBG6zWBhhNH1qOlWBrpoQdQNMe4CJCve1GyP0IYcbHGSy1VwxgO7qVO9CWBgGqwYrHSC9Z
	BB5kF0Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV5ky-0000000GbTx-0t9E;
	Thu, 04 Jun 2026 10:57:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV5kv-0000000GbTX-1Awt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 10:56:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04A2A3297;
	Thu,  4 Jun 2026 03:56:49 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E81C3F7D8;
	Thu,  4 Jun 2026 03:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780570613; bh=HCb3/WN6zMkp5n1Xqjc3nuxOHCSxZwt8K49OZDMiCIA=;
	h=From:To:Cc:Subject:Date:From;
	b=cwkU4DuR1Xf9pTsO+KsjwTqpBSJNLyykOzxaNWidfAVine3a5YT9t9NtDEBikQ97g
	 vVMI43M3UwG8DhdlDq52TeQS4BUXrX+uUQNzkYoa+xRflSvUhvvgkvSm73f3ygEw/V
	 mh2a3AP6ndhtYcXHjid6OCeKdDB2oUzt72hMfDNU=
From: Joey Gouly <joey.gouly@arm.com>
To: kvmarm@lists.linux.dev
Cc: joey.gouly@arm.com,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1] KVM: arm64: Restore POR_EL0 access to host EL0
Date: Thu,  4 Jun 2026 11:54:34 +0100
Message-Id: <20260604105434.2297268-1-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_035657_402753_B1782272 
X-CRM114-Status: UNSURE (   9.18  )
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

CPTR_EL2.E0POE was being cleared in __deactivate_cptr_traps_vhe(), which meant
that any accesses to POR_EL0 from host EL0 would trap and be reported to
userspace as an Illegal instruction. This would happen after running any VM,
regardless if it used POE or not.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Link: https://sashiko.dev/#/patchset/20260602155430.2088142-1-maz@kernel.org?part=1
---

Tested by (paraphrased):

	$ ./read_por_el0
	$ ./lkvm run -f kvm-unit-tests/timer.flat
	$ ./read_por_el0 # This gets "Illegal instruction"

Also ran the above flow in a nested VM.

 arch/arm64/kvm/hyp/include/hyp/switch.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 320cd45d49c5..e9b36a3b27bb 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -181,6 +181,8 @@ static inline void __deactivate_cptr_traps_vhe(struct kvm_vcpu *vcpu)
 		val |= CPACR_EL1_ZEN;
 	if (cpus_have_final_cap(ARM64_SME))
 		val |= CPACR_EL1_SMEN;
+	if (cpus_have_final_cap(ARM64_HAS_S1POE))
+		val |= CPACR_EL1_E0POE;
 
 	write_sysreg(val, cpacr_el1);
 }
-- 
2.25.1


