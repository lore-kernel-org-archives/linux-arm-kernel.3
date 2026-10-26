Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5280606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mRYpMAKu;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GGcSxjh1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=R+uyHs9ywIaM0i/9cYv3M9HNaFEltPzXJeKYyT3HeLQ=; b=mRYpMAKu/YnAXA
	R5gmEfTPPHGhJMMkkH7cmjcaKRZh+RKLKx0qXhnVPLde3UCaA7CNR5tDxh8/tu9Vb7GrSEZCz4RtM
	JCEwF6+dpDFDlwqHqbmQO+bqW0F5ktd0AZsMPzvYHiJNxFrS8ekCwx0QIs1cEdOwo4NxelIX9V76g
	mYPkWL8H7gTCiVjvAa3yVseSPefDu3loEvC9jxWe6dVb2KZfSu1QUGxhuJaKjIdQATAxCFFEiWVl6
	4Mqincj53Xu08UdChl3bFYS6FSklnyxGCqAR5DAvPNoMqu3NeJzs1BL111FihHSQZG3pBBpA+x6Ue
	QELnFF8q5d3ncItFUYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMbC-00000002l7M-2xX0;
	Mon, 26 Oct 2026 15:26:58 +0000
Received: from out-105.mta0.migadu.com ([2001:41d0:1004:224b::69] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMb9-00000002l5x-0O1H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 15:26:56 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=HeX2/geBxz2dlu9U8tei1sYnbTS6/PpznfxzSmtORYY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793028413; v=1; x=1793633213;
 b=GGcSxjh1UC0cDCLlNJtR4af/Jfdu7XvwZolqns7vXAfIesqqt7TVSd7HO4oPf/+limgiRxdw
 DV0LNNzoxOi0BKQIM5w8+YSY284Gd3P5rFgj1nJFGGaXexmKRrjsNgRg/j8w9T9DVJeSk8kT8XY
 BkuAX/k18vmb9DWM3QRsX2pY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 069beff3eddbe141;
	Mon, 26 Oct 2026 15:26:53 +0000
X-Mizu-Trace-ID: 069beff3eddbe141
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
Subject: [PATCH 2/2] KVM: arm64: vgic-v4: Don't allocate vPEs when userspace clears nASSGIcap
Date: Mon, 26 Oct 2026 15:26:39 +0000
Message-ID: <20261026152639.3926498-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026152639.3926498-1-fuad.tabba@linux.dev>
References: <20261026152639.3926498-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_082655_276539_09BC43A9 
X-CRM114-Status: GOOD (  10.28  )
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

Since commit c652887a92887 ("KVM: arm64: vgic-v3: Allow userspace to
write GICD_TYPER2.nASSGIcap"), userspace can disable vPE allocation for
a VM on a GICv4.1 host with vSGIs by clearing nASSGIcap before the vgic
is initialised. vgic_init() then skips vgic_v4_init(), and
kvm_vgic_dist_destroy() skips vgic_v4_teardown(). vgic_its_create()
still calls vgic_v4_init() for an ITS created after the vgic is
initialised, though, and vgic_v4_init() allocates the vPEs and requests
a doorbell IRQ for each vCPU. Destroying the VM leaks them, and leaves
each doorbell handler registered with a vCPU that's about to be freed.

Rather than gate on vgic_supports_direct_irqs(), which reads has_its
before vgic_its_create() sets it, check for a cleared nASSGIcap in
vgic_v4_init().

Fixes: c652887a92887 ("KVM: arm64: vgic-v3: Allow userspace to write GICD_TYPER2.nASSGIcap")
Cc: stable@vger.kernel.org
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/vgic/vgic-v4.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v4.c b/arch/arm64/kvm/vgic/vgic-v4.c
index a01de4de608a6..12a57921f6af3 100644
--- a/arch/arm64/kvm/vgic/vgic-v4.c
+++ b/arch/arm64/kvm/vgic/vgic-v4.c
@@ -251,6 +251,10 @@ int vgic_v4_init(struct kvm *kvm)
 	if (!kvm_vgic_global_state.has_gicv4 || dist->vgic_model != KVM_DEV_TYPE_ARM_VGIC_V3)
 		return 0; /* Nothing to see here... move along. */
 
+	/* Userspace disabled vPE allocation by clearing nASSGIcap */
+	if (system_supports_direct_sgis() && !vgic_supports_direct_sgis(kvm))
+		return 0;
+
 	if (dist->its_vm.vpes)
 		return 0;
 
-- 
2.47.3


