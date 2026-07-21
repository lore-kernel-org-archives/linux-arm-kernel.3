Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33779C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JoSpYNH320RJAnts2pP5+Q3/u6oQENLYblI1/yJFWS4=; b=WQLNT4m/EeKWREEoa3t+K9AVp1
	zxwKgxTT3v61d9p0Hq6/RjtSBERxGNQplKF98N8buWLGvI67Ji/HrWU7ielZeK2ua6alfRJ344y0f
	jUClQ1Z7gI+zM2eSYQNAcWJuF/se+ARay3zSGU4TKHUtm5FHf2Vgv/J+HiIm/QvN8O1JqXoKX2N2G
	P8PyVzSdEVZ3i+kwIdVsR56KhgWsHer/E4GJnkzD1vHFhxDcXiYWTU6GZYDgCC5vs2B6sOVm2lmY4
	zBe3QOKpzx81/1oadAojH8imtCW9sC1n9+fke4i7OK658Ht3/U7NN+V4LrF9jUE3y27XzGmmFRZMr
	y+k3/V7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDDw-00000009sXg-3k2d;
	Tue, 21 Jul 2026 16:21:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDDv-00000009sX8-31KI
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Jul 2026 16:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=JoSpYNH320RJAnts2pP5+Q3/u6oQENLYblI1/yJFWS4=; b=lMUF05FmLxYKnGP9xTDB3i4UjL
	sjvZfKcCFxg9OLxv55Bzw09dFj9iJxdbEbMGZ4rEpk0ysipukiWDHeSEYSThu/HFbAD9WkKbp6oXe
	yHZW+hLHh8PfF7hjfsgeFrtl/FjmIOGqwb9Bh6qf2LmKdv14ZMzGMQ3Q86Hdnt0gZaQzVrOvsvcqV
	qISDb4ZaB93cL/ZF/3YMXYPb2MyhYyUyu2nC+U+TAhimoHglza1J/ja9WI2IPb+tEDXKxmw5qm0yJ
	gd9nGQ+OnNnatbQb4M/Pu509SUPlaAM/xl5fh3IihbgQTtRznHptscL2NdZTcnUrLzssXkGp6L2v8
	YZ7sbq2w==;
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmDDs-000000007Tt-2n5A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 16:21:38 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784650592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JoSpYNH320RJAnts2pP5+Q3/u6oQENLYblI1/yJFWS4=;
	b=krhs0h0yLC3Ie0R0Zf6VGGryPmFh9clqMEO5lAAo0l3Lnb9I11mLsRJsotld+n4SKWnmuR
	iPxXWv3V8QwDupZdWwx+LE+O1e/HYPTk61yDM+0r1VH9Rxs2CDSAIdKI49aiNOgYI7LKBs
	PRyUy+XJYmyapZqa2QBg2rAyra6wxsY=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] KVM: arm64: Sync SCTLR_EL1 when injecting an exception into a pVM
Date: Tue, 21 Jul 2026 17:16:24 +0100
Message-Id: <20260721161624.3983041-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_172136_808960_16D1B5DA 
X-CRM114-Status: GOOD (  10.93  )
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

When pKVM injects a synchronous exception into a protected guest,
enter_exception64() reads SCTLR_EL1 to set the new PSTATE's PAN and
SSBS bits. pKVM refreshes VBAR_EL1 from the live value before injecting
but not SCTLR_EL1, which is untrapped for protected guests, so a guest
that updates it and then traps takes the exception with stale PAN/SSBS.

Sync SCTLR_EL1 alongside VBAR_EL1.

Fixes: 798eb5978700 ("KVM: arm64: Sync protected guest VBAR_EL1 on injecting an undef exception")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
Changes since v1 [1]:
 - Rebased onto v7.2-rc4; no functional change.

[1] https://lore.kernel.org/all/20260612102347.914994-1-tabba@google.com/

 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index b1411fb541397..8758c68017765 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -257,10 +257,11 @@ static void inject_sync64(struct kvm_vcpu *vcpu, u64 esr)
 	*vcpu_cpsr(vcpu) = read_sysreg_el2(SYS_SPSR);
 
 	/*
-	 * Make sure we have the latest update to VBAR_EL1, as pKVM
-	 * handles traps very early, before sysregs are resync'ed
+	 * Sync VBAR_EL1 and SCTLR_EL1, both read by enter_exception64(),
+	 * as pKVM handles traps before sysregs are resync'ed.
 	 */
 	__vcpu_assign_sys_reg(vcpu, VBAR_EL1, read_sysreg_el1(SYS_VBAR));
+	__vcpu_assign_sys_reg(vcpu, SCTLR_EL1, read_sysreg_el1(SYS_SCTLR));
 
 	kvm_pend_exception(vcpu, EXCEPT_AA64_EL1_SYNC);
 

base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.39.5


