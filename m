Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67933C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKHE75yrZ9C1KCUyhPKYIHEh7LJhrNDPfIhpMcjSA64=; b=FiHJw98DYOUrn63aeVrXvGChhR
	HqAE70Ha/PxXnk4IGlvlUXt4mGWrdByd/xjzrX/kcJ5vHapIagvDEfxqlDBsW0gMerXXKNOgFZdP4
	hNZxPI9dtRIFseb6hqJ93KP7oOcTDSSA/KleldvUDPzy+lpFqcPo4OUKX4YMsj08FZ8Jea9PbelaP
	SIeZvXkmfjrU10eFi62mRkbjgkkGaKF7vb7W2iXvD5MwHmGx789CSsp35+I/Gr1QEj/Z4mu2vSoDb
	qImyguC5257/FESOZFXRujz3193DYix5vjJiyYzZdbPE9qRplUhZK3Cq0cFnwbSqagApc0+2ziD+O
	UcSgMuEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPLB-0000000G7wQ-3rTT;
	Mon, 24 Aug 2026 07:43:34 +0000
Received: from out-204.mta1.migadu.com ([2001:41d0:203:375::cc] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPKp-0000000G7Mr-089C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:43:32 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=0njPdbaKLdmcvhV4JMlTlxwDuJcfUS+uR9TLYY7nzIc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787557388; v=1; x=1788162188;
 b=JJAdsQy+YavOzIDLH65HB/iZm0vza4sNVTZIQ8N1RP0GjcSD7shL3/kJfU/e7rwJ4jYURSsI
 3OBPJmbLhzIcBUKzzwV2eBORQ5CUPuM4yWqPbpklc2/KteiczFnsvIGoIusHaDZYLrHwnT/BVkQ
 0ScXddug5zKf31ayZjvgWx1g=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.local (2a01:4b00:ad36:1d00:3a05:25ff:fe33:35a9)
	by smtp.migadu.com with ESMTPS id 599f795f6d738f63;
	Mon, 24 Aug 2026 07:43:08 +0000
X-Mizu-Trace-ID: 599f795f6d738f63
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Eric Auger <eauger@redhat.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Sebastian Ene <sebastianene@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] KVM: arm64: vgic-v4: Restore nr_vpes before freeing the vPE resources
Date: Mon, 24 Aug 2026 08:42:45 +0100
Message-Id: <20260824074245.710955-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260824074245.710955-1-fuad.tabba@linux.dev>
References: <20260824074245.710955-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004311_235847_383EFD18 
X-CRM114-Status: GOOD (  10.58  )
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

vgic_v4_init() truncates its_vm.nr_vpes to the failing index to bound
vgic_v4_teardown()'s free_irq() loop, but its_free_vcpu_irqs() reads
the same field: the vPE irqs and the v4.1 SGI domains at or above that
index are never freed, each one leaking a vpe_id and an LPI pending
table.

Restore the count from online_vcpus before that call. This depends on
the previous patch: a failed vgic_init() keeps admitting vCPUs, so
without that patch's teardown the vPE array outlives the failure while
online_vcpus grows past the size it was allocated with.

Fixes: bdb2d2ccac65 ("KVM: arm/arm64: GICv4: Add doorbell interrupt handling")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260820130616.1A7241F000E9@smtp.kernel.org/
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-v4.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index ed236f083f0d7..30e1de3fc7d9d 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -333,6 +333,9 @@ void vgic_v4_teardown(struct kvm *kvm)
 		free_irq(irq, vcpu);
 	}
 
+	/* Make sure we free all VM-wide, per-CPU resources */
+	its_vm->nr_vpes = atomic_read(&kvm->online_vcpus);
+
 	its_free_vcpu_irqs(its_vm);
 	kfree(its_vm->vpes);
 	its_vm->nr_vpes = 0;
-- 
2.39.5


