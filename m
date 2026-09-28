Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8860ACA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PfIILtbkqzHnfWchrCJP5wmaB7yCBAKrI10/fN0niXY=; b=LUFD+KXereyoH9ew852MgNTiVA
	toVuqmo4EYikgdSrgHekukDScBTzSHgKhWTgmEqdiH0nfOno0pz06zRwZKoXJc+I92QLH81raFIwZ
	kwqEGXfXBwaZJpxJ+WSfvBkZ5Wadymz9lt5gR2oMy7IgMywR+uq2MVYXKn1F+YsvTUm8gstJeRs5K
	aq8msoLdtrRu4pelD1x8VrWibFUOsnGXLlAveFfXBChBjNR2JqwOxHCHL7bj8H8RuHQ86Rl8BSmXa
	dEPJC/VTfuWunoyvxdNXy7GtSgpHqYsvCb3z4duZmjYcZD3Ksc0a4SAZkA8qtIaQ81h4IljCab4Zk
	PmSrbyxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDEe-00000000tSc-0Dt8;
	Mon, 28 Sep 2026 15:25:44 +0000
Received: from out-63.mta1.migadu.com ([2001:41d0:203:375::3f] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDEb-00000000tR4-0bgY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:25:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=UsrrMKeoU6FyB7ktPMuLLTHGrlKvgJcUMP9CZWK2MkQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790609139; v=1; x=1791213939;
 b=nYt5ziIv/3E20y3DRnAM19W1Yns0ZSvwjweI4mhJwzoz+yuzHfSfNw8FeqnCdt9hupruQpSh
 TTWfbJgMJfP9J5F/cI8RLuIs6TKRdCQH3lKxCe9zib9GpYBYM2xRUGJRjdgkZLkWyHbrpGDzaED
 vXmxoA0NZNdmOqXFkaIxTd0A=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1db0060865db2ffe;
	Mon, 28 Sep 2026 15:25:17 +0000
X-Mizu-Trace-ID: 1db0060865db2ffe
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/10] KVM: arm64: nv: Don't WARN on an invalid VTCR_EL2
Date: Mon, 28 Sep 2026 16:24:59 +0100
Message-Id: <20260928152507.2116110-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928152507.2116110-1-fuad.tabba@linux.dev>
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_082541_325464_821AF899 
X-CRM114-Status: GOOD (  10.99  )
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

Before walking an L1 guest's stage-2 tables, KVM checks the starting
level in VTCR_EL2.SL0 and the IPA size from T0SZ against the granule
and PA size, and sets a stage-2 level 0 Translation fault when either
is invalid. The check also WARNs, so an L1 guest that programs an
invalid VTCR_EL2 triggers the WARN on every walk.

Drop the WARN.

Fixes: 61e30b9eef7ff ("KVM: arm64: nv: Implement nested Stage-2 page table walk logic")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 3c4fc566eafc6..98c1f8c193319 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -279,7 +279,7 @@ static int walk_nested_s2_pgd(struct kvm_vcpu *vcpu, phys_addr_t ipa,
 		return -EFAULT;
 
 	ret = check_base_s2_limits(vcpu, wi, level, input_size, stride);
-	if (WARN_ON(ret)) {
+	if (ret) {
 		out->esr = compute_fsc(0, ESR_ELx_FSC_FAULT);
 		return ret;
 	}
-- 
2.39.5


