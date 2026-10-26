Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8CF606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 15:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h8FjSdhT;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lfvq+ASi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dAFgr5GFVCUFPSyhlg3DUaZpfnARnQey3lMyxNdSf/I=; b=h8FjSdhTBLgimf
	CWdkz5/W954mZcTRXc/SFDPldfhOInJxVeBdHEFLbGCTh6kFRe1Ya9Y0b6gyT+K0dV36pyIxsha6V
	l5ZZGt9DuIwsPMoXlUnog0HWcMGlhhfVz+ztcVuIiPpiAFdzb36btyEqL+KVcuwxl4RM0xbE+8LWi
	1xlBRJ4SjfNNKY7l5XE6tJnDSGz0Z+PEncejx7EL0mAz0DAWrncMFKUlDUNwY6Uacv/E3fp9z+bmd
	N4+n3Xq5qDTbCzNmPbyYHoW4tQ62LIWv2EusR/8yWQqdBj0fAWNUhq93nsR1YrNPZXYd/LEqX3w0n
	q/oY8up7yTHYR3576JMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMb6-00000002l5M-14QB;
	Mon, 26 Oct 2026 15:26:52 +0000
Received: from out-102.mta0.migadu.com ([2001:41d0:1004:224b::66] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMb3-00000002l4M-3Z2c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 15:26:51 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Gpfg/CtXJGh5QbnPt7iVXc/Il3CyiL4OHB1+vx17vOU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793028407; v=1; x=1793633207;
 b=lfvq+ASiumxv1EPzTQfGbflJ5htPolqDQumFs20FyCg5RYvXBgDs4KRLcmAI9kRLsgulaSNb
 i36nGDemw02DdXpl7Tcs4S53ofD0IlYjpRnUmu32/BkKvGiWGXpqBdosR3BLHgNUpai5oIIkFGV
 qlz1fuO37/fI1/eesQp8H6Ms=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8be23b0417c64883;
	Mon, 26 Oct 2026 15:26:47 +0000
X-Mizu-Trace-ID: 8be23b0417c64883
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] KVM: arm64: vgic-v4: Don't allocate vPEs for a GICv2 VM
Date: Mon, 26 Oct 2026 15:26:38 +0000
Message-ID: <20261026152639.3926498-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026152639.3926498-1-fuad.tabba@linux.dev>
References: <20261026152639.3926498-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_082650_038116_3753E43E 
X-CRM114-Status: GOOD (  10.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

KVM can run a GICv2 VM on a GICv4.0 host whose CPU interface supports
legacy operation. Such a VM has no LPIs and never uses vPEs, so
vgic_supports_direct_irqs() is false for it and kvm_vgic_dist_destroy()
never tears them down. However, userspace can still create an ITS for
it. Once the vgic is initialised, vgic_its_create() calls
vgic_v4_init(), which allocates the vPEs and requests a doorbell IRQ for
each vCPU. They're then never freed, and each doorbell handler stays
registered with a vCPU that's freed with the VM.

Only allocate vPEs for a GICv3 VM.

Fixes: 74fe55dc9ab77 ("KVM: arm/arm64: GICv4: Add init/teardown of the per-VM vPE irq domain")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-v4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index ed236f083f0d7..a01de4de608a6 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -248,7 +248,7 @@ int vgic_v4_init(struct kvm *kvm)
 
 	lockdep_assert_held(&kvm->arch.config_lock);
 
-	if (!kvm_vgic_global_state.has_gicv4)
+	if (!kvm_vgic_global_state.has_gicv4 || dist->vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
 		return 0; /* Nothing to see here... move along. */
 
 	if (dist->its_vm.vpes)
-- 
2.47.3


