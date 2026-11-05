Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB08606D820
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nBlWRDA/;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bkbXfAYz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Zth+ioNeco6Y26/nGtuUwgodoU7stROkCOLzqhbMwj8=; b=nBlWRDA/X9bN9Q
	j6nRCd0+6MePDXrMIQrcs63XCU1/hRAhaNzp0OB87m3Ok6CN2vrfDO3ZDxzQc/jLBivYIeMl6qUD2
	BMaRu5KWX80V+fMyoqr4zmJEVs42FZqGPZ0F2tF2DFuZe7b7IN3ZK25Dq+yd/7/IimtgnqTyQh7dA
	fXKNe2IHq24sKegoPgJIUVKHMJm6H+qFcfufSYz5SCAHiNMbkLVhK5ybSOREk9hYhNiijbVZO23ll
	T02uW8zLgUEQxcJ1+D9bVrYluNHtPS77EAAH8gKymzOd5/DIdurRAalxLpsGVHzqZ7SorTbQItNRV
	VabPbJZc0CkSWIxv29iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvDT-00000008Xns-0fpB;
	Thu, 05 Nov 2026 11:01:11 +0000
Received: from out-119.mta0.migadu.com ([2001:41d0:1004:224b::77] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOvDM-00000008Xho-3oct
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 11:01:06 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=etVrSQDuUpX2EwqNodnkS74XlA/kEpDepAAYv3ksNZ0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793876462; v=1; x=1794481262;
 b=bkbXfAYzV5yJpZWt0hYSc5BCd/jJ1UJOzPAfuYCIm9gOLGemof5NbmkoLWEfULSDiYg8qqQ2
 ES+eFkpjeK0cQ+m0M5LUeufY2I+2gHNigXmfJntkxIji9JNGA/SnbR4CnG47ICmt1SaFkvW9LIe
 TwLIuyz53DGOrTapy7aH4Hz0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 82aeebc9bf92e3fc;
	Thu, 05 Nov 2026 11:01:02 +0000
X-Mizu-Trace-ID: 82aeebc9bf92e3fc
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Yuchao Zhang <ndaugoing@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] KVM: arm64: vgic-v3: Don't save pending tables with LPIs disabled
Date: Thu,  5 Nov 2026 11:00:49 +0000
Message-ID: <20261105110050.1244525-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110050.1244525-1-fuad.tabba@linux.dev>
References: <20261105110050.1244525-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_030105_168734_65B94D07 
X-CRM114-Status: GOOD (  13.28  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES writes each LPI's pending state
into its redistributor's pending table, clearing the bit of an LPI that
isn't pending. However, once a redistributor has LPIs disabled and RWP
reads 0, "there are no further accesses by the GIC to the LPI Pending
table" (IHI 0069H.b, 5.1.2) until enabling LPIs reads it. A bit the
guest sets there is cleared by the next save, which QEMU runs whenever
it stops the VM, and the guest never takes the LPI.

Skip the LPIs of a redistributor with LPIs disabled, and document it.
On GICv4.1 this drops the state of a forwarded vLPI there, which the
disable is allowed to lose: "There is no guarantee that clearing
GICR_CTLR.EnableLPIs causes the LPI Pending table to be updated in
memory" (5.1.2).

Fixes: 280771252c1ba ("KVM: arm64: vgic-v3: KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/devices/arm-vgic-v3.rst | 1 +
 arch/arm64/kvm/vgic/vgic-v3.c                  | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/devices/arm-vgic-v3.rst b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
index 5395ee66fc324..c878d3f728858 100644
--- a/Documentation/virt/kvm/devices/arm-vgic-v3.rst
+++ b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
@@ -308,6 +308,7 @@ Groups:
       save all LPI pending bits into guest RAM pending tables.
 
       The first kB of the pending table is not altered by this operation.
+      Neither is the pending table of a redistributor with LPIs disabled.
 
   Errors:
 
diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
index 65b77fb35be37..9bbf11ddba92e 100644
--- a/arch/arm64/kvm/vgic/vgic-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-v3.c
@@ -625,7 +625,9 @@ int vgic_v3_save_pending_tables(struct kvm *kvm)
 			continue;
 
 		vcpu = irq->target_vcpu;
-		if (!vcpu)
+
+		/* While LPIs are disabled, the pending table is the guest's. */
+		if (!vcpu || !vgic_lpis_enabled(vcpu))
 			goto put_irq;
 
 		pendbase = GICR_PENDBASER_ADDRESS(vcpu->arch.vgic_cpu.pendbaser);
-- 
2.47.3


