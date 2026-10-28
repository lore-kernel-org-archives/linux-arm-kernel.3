Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFB660A2604
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 10:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v3lvPDqW;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xhoU8ZFY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EEYPoRpJNmhk9PNugIQXadp8K0qikeOnykwdRW9fgMk=; b=v3lvPDqW6cyY4SAvhjCHkq7flP
	vZrn1X6vbK09mITGTx54hMc65Lcml8o+xyl5N85uRhfR6Q6sIsBc9q7f914FVyrtS+yxFuPWncdwB
	oS4fba0zueCn+00DIJHlehArNjWixnMiJfMVcEf8WFL5a41lszYfk6eWkT0xLJe+PVLnNLtOMsriw
	osmaHf8dgWuULXLy83aww8GiNP3WKLCRoqZogQnSqHvOAqhTJxrZre+GVJRisubL5gz/Lhb4Qq3R0
	8UjbGOS4S9uoRwgIlkqX+u2L/px9q3I8zPQ6GcWA6DohleNnx6RAMmVnSoYKH1Znw3VCHYjL1X9Iz
	+5s2LF+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0ew-00000006jWK-0sXZ;
	Wed, 28 Oct 2026 10:13:30 +0000
Received: from out-199.mta0.migadu.com ([2001:41d0:1004:224b::c7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM0et-00000006jVK-37aM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 10:13:29 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=WsoTtYrcTmftLlSUVDE5tQ5r3ngHtWvcYWFlA1bqtiE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793182404; v=1; x=1793787204;
 b=xhoU8ZFYL7qAO+by2nhcdjjpx7w0I2wluDfLubrEI2yjfm2BabPfl7Wm8s1D3Ibzx9V3pH+t
 tpp1ONSwyy3HGhU1QgkHOCO6Rpq1MVs0lTgMS4Mp9IW5TqqwPvWFdY2TbgQRHfyuJe2h29gGXGA
 n1tMLKjzVmFPsoGZKj+ZLqcc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 81b2b9d47a24842f;
	Wed, 28 Oct 2026 10:13:24 +0000
X-Mizu-Trace-ID: 81b2b9d47a24842f
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
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] KVM: arm64: vgic-v4: Don't allocate vPEs that a VM can't use
Date: Wed, 28 Oct 2026 10:13:16 +0000
Message-ID: <20261028101318.2170928-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_031328_250382_5D3ABF7E 
X-CRM114-Status: GOOD (  11.30  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Changes since v1 [1]:
  - Gate vgic_v4_init() on vgic_supports_vpes(), split out of
    vgic_supports_direct_msis(), instead of open coding the nASSGIcap
    check. (Oliver)
  - Use vgic_is_v3() for the GICv2 check, in vgic_supports_vpes(). (Oliver)

Two fixes for vgic_its_create() allocating vPEs for a VM that never
uses them. Nothing frees them when the VM is destroyed, and each
doorbell handler stays registered with a freed vCPU.

The first is for a GICv2 VM, which KVM can run on a GICv4.0 host whose
CPU interface supports legacy operation. The second is for a GICv3 VM
whose VMM cleared nASSGIcap on a GICv4.1 host with vSGIs.

The second patch also moves the first one's GICv3 check into
vgic_supports_vpes(). I kept them separate because the first can be
backported on its own to stable kernels that predate nASSGIcap, which
is also why it open codes the check: vgic_is_v3() only exists since
7.1. The end state is what Oliver asked for.

Tested on AEM FVP, with has-gicv4.1=0 for the GICv2 case and =1 for the
other. With my reproducer (clear nASSGIcap for the second case,
initialise the vgic, create an ITS, destroy the VM), the kernel without
the fix leaves four "vcpu" doorbells in /proc/interrupts in each case,
and the fixed one doesn't leave any.

Based on Linux 7.3-rc3 (fd73f4a665989).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261026152639.3926498-1-fuad.tabba@linux.dev/

Fuad Tabba (2):
  KVM: arm64: vgic-v4: Don't allocate vPEs for a GICv2 VM
  KVM: arm64: vgic-v4: Don't allocate vPEs when userspace clears
    nASSGIcap

 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 9 +++++++--
 arch/arm64/kvm/vgic/vgic-v4.c      | 2 +-
 arch/arm64/kvm/vgic/vgic.h         | 1 +
 3 files changed, 9 insertions(+), 3 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.47.3


