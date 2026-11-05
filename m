Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD1B606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xyLwQaaU;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HFsM9btJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ITFZfqTf6HLA8M80Gc6oqzXf0FVpiSw0NR/yGEmW2ls=; b=xyLwQaaUuSl3T0DI3aqqH7YUnK
	/h8IUPdIgJpYUuA31NbcnDP+z+xmrDpdGkUKqB0wh6Sx35Y7ip5aOiv3vbQJnRziRDJt6HcMk8Mra
	h11ZKyNpWWjDrOFE0NUKCFjLz8aYzSPWzoJPhWtQubqMcqA27N0HzY25wI3hcjbwIawKkO9WJmjCQ
	UwXcC/MhNgd/2Ssy1pNkTUJ4m9BeAtRpF5yHHNq/L2diW8gk7SkgiXUr0sBgU4yZcxdpssAVZg83y
	ucWqdJ7lrvVyX7mnWuWzcSXSt9dt06OuDsK0keqZUmWSmdQRYAjvRi4H6yuK0+z9sH5noX0i/u0DM
	hPop8J3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx9Q-000000093mk-0bF6;
	Thu, 05 Nov 2026 13:05:08 +0000
Received: from out-240.mta0.migadu.com ([2001:41d0:1004:224b::f0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOx9N-000000093jg-1lNg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:05:07 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=VlBWOdFHmpR7E9vPrR5lo8vubxtfca2eYX+pam8dCPQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793883902; v=1; x=1794488702;
 b=HFsM9btJSZh+DLSRYYLitmHagNdX7biaaek7UWRnOPkCgInRmHw+2dkZF5PZU7FzNrWv3Bdt
 dZV4DtRbP3s6UNPoCPXt4hwgA9QR8nkEHE+FHmivWRhzmKLLIMBjFDzjwhygazHGclLX4ZDbNYu
 cph3cBQ50ZooTaHJqOWymteU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 73a9a296ef247332;
	Thu, 05 Nov 2026 13:05:01 +0000
X-Mizu-Trace-ID: 73a9a296ef247332
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
	Vincent Donnefort <vdonnefort@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] KVM: arm64: Support SVE in protected VMs
Date: Thu,  5 Nov 2026 13:04:52 +0000
Message-ID: <20261105130456.1617185-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_050505_598575_47626FC7 
X-CRM114-Status: GOOD (  10.70  )
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

This series adds SVE support for protected VMs. EL2 allocates a
protected vCPU's SVE state from its own heap rather than pinning the
host's buffer, so the host never sees the guest's vector registers. It
then advertises ID_AA64ZFR0_EL1 to protected VMs, and routes the SVE
trap to the lazy FP switch. The first patch is a small tidy-up of the
pKVM FP sync code that saves a guest's SVE state.

v2 of the pKVM selftests series [1] will add a selftest for this.

Based on Linux 7.4-rc1 (6628e7d4c6b25).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261104084842.132944-1-fuad.tabba@linux.dev/

Fuad Tabba (4):
  KVM: arm64: Remove redundant kern_hyp_va() calls from the pKVM FP sync
  KVM: arm64: Allocate a protected vCPU's SVE state at EL2
  KVM: arm64: Advertise ID_AA64ZFR0_EL1 to protected VMs
  KVM: arm64: Allow protected VMs to use SVE

 Documentation/virt/kvm/arm/pkvm.rst |  6 ++---
 arch/arm64/include/asm/kvm_hyp.h    |  2 ++
 arch/arm64/include/asm/kvm_pkvm.h   |  1 +
 arch/arm64/kvm/arm.c                |  1 +
 arch/arm64/kvm/hyp/nvhe/hyp-main.c  |  4 +--
 arch/arm64/kvm/hyp/nvhe/pkvm.c      | 41 +++++++++++++++++++----------
 arch/arm64/kvm/hyp/nvhe/switch.c    |  1 +
 arch/arm64/kvm/hyp/nvhe/sys_regs.c  | 22 ++++++++++++++--
 arch/arm64/kvm/reset.c              |  2 ++
 9 files changed, 59 insertions(+), 21 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.47.3


