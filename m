Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87750C5DF7A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=56J/rXajLQ4rVaSbAPGRry+bue2Gns5hR+Y/dZZwHCw=; b=1VqxHZwCWn1QZeAWTGfXNm0CKV
	OvjhG3HkJGAi1ci7VnuHhNTS2E0Usbsbd0321ZHCxzD+yqk71TQ4USvpCsG9Niknx3dNOincomzwB
	xud9dP+LBnbggFRm/6bQNjtVkTU4zZqErkVNHe8/Hq1iQtenVbgk1zGsqLLa623/oUbZwYxjn4A6k
	c9uJ85erKx/UhEHoXhfnm4wpDghLmpK5jEITS7vSvf9z8Um2xD95UYdHzYWBN6xnG6tgiBuC/RcPo
	SSL91d9S+i4yu8LtQpTJ08y8wn0EnaUd+OIKYALSyk6kE8zrzQfDueMfCLk00zpheUy4CmoX638Vk
	jbkWOeig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvue6-00000005w1w-1042;
	Mon, 17 Aug 2026 10:32:46 +0000
Received: from out-247.mta0.migadu.com ([2001:41d0:1004:224b::f7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvue4-00000005w0H-0YEf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:32:45 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=z4EwF+2nV6LNFiwYHiCvrW4hUIU64iI/tXAhjD2lNDA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786962762; v=1; x=1787567562;
 b=DpHbinOouCJSN6ZYW3beYVCTQdQz7pjlqQps/hWYeCP9v3lAvD/u2qJ3kL3Tr4XeV0nd1J+W
 I+cMCo6BJHaNLItlxPAe4IYNXxM/XU5yV3ATq62EeSug5eyZ9Fle6LhdEcu4vqdqNeQX/s4v2bN
 mKN+LHmBMlrmVCuzHwKPYKzQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.lan (37.156.72.212)
	by smtp.migadu.com with ESMTPS id 7c0f32848ff2a96c;
	Mon, 17 Aug 2026 10:32:42 +0000
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>
Subject: [PATCH v2 2/4] KVM: arm64: Reject the GICv5 CPU interface hypercalls under pKVM
Date: Mon, 17 Aug 2026 11:32:26 +0100
Message-Id: <20260817103228.1203140-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260817103228.1203140-1-fuad.tabba@linux.dev>
References: <20260817103228.1203140-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_033244_313248_D816285A 
X-CRM114-Status: UNSURE (   7.95  )
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

__vgic_v5_save_apr() and __vgic_v5_restore_vmcr_apr() remain callable
after pKVM finalises. pKVM never registers a GICv5 vgic, so neither has
a valid caller in protected mode, and on a GICv3 machine both reach a
register that is UNDEFINED at EL2 and panic the hypervisor.

Reject both when protected mode is enabled.

Fixes: af325e87af5da ("KVM: arm64: gic-v5: Add vgic-v5 save/restore hyp interface")
Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index d3df96ed8ba42..a9afd350b1fb3 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -695,6 +695,9 @@ static void handle___vgic_v5_save_apr(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct vgic_v5_cpu_if *, cpu_if, host_ctxt, 1);
 
+	if (unlikely(is_protected_kvm_enabled()))
+		return;
+
 	__vgic_v5_save_apr(kern_hyp_va(cpu_if));
 }
 
@@ -702,6 +705,9 @@ static void handle___vgic_v5_restore_vmcr_apr(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct vgic_v5_cpu_if *, cpu_if, host_ctxt, 1);
 
+	if (unlikely(is_protected_kvm_enabled()))
+		return;
+
 	__vgic_v5_restore_vmcr_apr(kern_hyp_va(cpu_if));
 }
 
-- 
2.39.5


