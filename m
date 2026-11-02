Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02138606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sVBJ6duh;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=N3l60SDP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ua1DOoDM2ycibNdB6MjyfXMQfwPGZxy1wTaNHdPExSE=; b=sVBJ6duhfVjGbEOjzM9iUemKxY
	nsac/U0EpPR3JlM97jfKhaIagO7JiZyh9e4Xyp1xCKHWvCLtnW4qHhVlGZZDdS3sT0cQXyZkGFp1X
	DBUnoYGNn0ptVCguEg+xvXT7g0vQHmKTCVbeLvmPBM0IydgA8jAevrFz8a7m0uiRcLKpb49ImyYkR
	8VRfxn8+5SMllEzUChf2nydshUBMY1Q3WGQZRz8Tz/jZ2JRRRPK6fFWNU57TPA2RWYLX7FaeKKXpd
	MGeK2eD/v9lyUXwex7VyOGNvdYL/EJN/ETW77CYVVUCH2Tk2LSwo3+u4PQdz7BVXIyXmz4wGPmlGK
	R6afR1AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsn1-0000000Gjel-3ng9;
	Mon, 02 Nov 2026 14:13:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsmy-0000000GjdU-28jP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:13:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43EB31691;
	Mon,  2 Nov 2026 06:13:26 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.58.9])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A554D3F59E;
	Mon,  2 Nov 2026 06:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793628809; bh=c0J8oAMjRRRr84vzXcxPgHvZvqambP7No/QhePqrRBE=;
	h=From:To:Cc:Subject:Date:From;
	b=N3l60SDPbFfZ/rOuZxoYhJ8tcOkCD9sP+8uYKl4eoZq/cgrmQrEnoisz5nMtdJLuD
	 qWSdXM9gtzbElbowMGwonb6XxZqM4kWzYJXehgEmhhYeY30TR0+NZkpilaJfrOo8Bi
	 7jmItYOE9907P8VlBdZFksu/Z3QQYoEXRV8ARkH8=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH 00/11] KVM: arm64: CCA: Prepare Realm memory management
Date: Mon,  2 Nov 2026 14:12:51 +0000
Message-ID: <20261102141304.126883-1-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_061332_637609_22086EBD 
X-CRM114-Status: GOOD (  11.24  )
X-Spam-Score: -4.4 (----)
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

This series adds the memory plumbing for CCA building on the basic
plumbing[1] that has just been merged.

These patches add the internal realm VM state and RMM feature checks,
prepare realm stage-2 setup and teardown, and provide RTT mapping and
invalidation helpers. Realm memslots are now contrained to the lower
half of the IPA space, because faults treat the protected and shared
halves as aliasing. The final patch then connects these helpers to the
KVM stage-2 MMU operations.

There's also an integration branch[2] that builds on this series and
includes the realm descriptor creation, REC entry/exit, activation and
the new uAPI. This series by itself is also available as a git
branch[3]. However the new code isn't generally active without the full
integration branch.

[1] https://lore.kernel.org/all/20261007073537.2454351-1-suzuki.poulose@arm.com/
[2] https://gitlab.arm.com/linux-arm/linux-cca
    branch: cca-host-mm/v1/integration
[3] https://gitlab.arm.com/linux-arm/linux-cca
    branch: cca-host-mm/v1/mm

Steven Price (7):
  KVM: arm64: CCA: Reserve the RMM mode
  KVM: arm64: CCA: Check for RMI support at KVM init
  KVM: arm64: CCA: Check for LPA2 support and SHA-256
  KVM: arm64: CCA: Add basic infrastructure for creating a realm
  KVM: arm64: CCA: Tear down RTTs
  KVM: arm64: CCA: Add Realm RTT mapping and invalidation helpers
  KVM: arm64: CCA: Support runtime faulting of memory

Suzuki K Poulose (4):
  KVM: arm64: CCA: Introduce Realms
  KVM: arm64: Handle attributes in stage2_unmap_range
  KVM: arm64: CCA: Prevent memslot modifications after Realm creation
  KVM: arm64: CCA: Add Realm stage-2 MMU operations

 arch/arm64/include/asm/kvm_emulate.h   |  29 +
 arch/arm64/include/asm/kvm_host.h      |  62 +-
 arch/arm64/include/asm/kvm_rmi.h       | 109 ++++
 arch/arm64/include/asm/virt.h          |   1 +
 arch/arm64/kvm/Kconfig                 |   1 +
 arch/arm64/kvm/Makefile                |   2 +-
 arch/arm64/kvm/arm.c                   |  33 +-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |   2 +-
 arch/arm64/kvm/hyp/nvhe/switch.c       |   4 +-
 arch/arm64/kvm/hyp/nvhe/timer-sr.c     |   2 +-
 arch/arm64/kvm/mmu.c                   | 242 +++++--
 arch/arm64/kvm/rmi.c                   | 852 +++++++++++++++++++++++++
 12 files changed, 1275 insertions(+), 64 deletions(-)
 create mode 100644 arch/arm64/include/asm/kvm_rmi.h
 create mode 100644 arch/arm64/kvm/rmi.c

-- 
2.43.0


