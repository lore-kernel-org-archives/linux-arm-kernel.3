Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14468606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yO6x6Zwt;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=U0BJUmhX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gb5sZs9kXKkHxMOBK0QCN7nKSbVD+3tuMPiUXhvbYWs=; b=yO6x6Zwt0AZNgvuEIVHzwfNbUk
	FWg7+fWH+cUDWP2D84D4HWiL+jgrlC12+sjzCVp7HGG8D/aqXmIECkYgRTN+zlcTZUQSI+gEodInh
	J9DttPucRQbizjK3Jb4W4pZqetWrTbFoNuzZkFg2LXyr4hnQlUcPRzStEHdTjcnRKEwmULUBqfgUx
	cJTTz+N0CRJStPy9ozC1g1GnHeZpMAEq55QUZlDw++lUwJEyrISnNMAiEO/xdhpAXfz8b9noMW6RG
	LD4X6R57ZDF+BuEbqFm2BLgnhXofBaNpz2D0j1y5w9zE7e2epjJG9kQJCQSRACcM0X75rB8h6dh4O
	7YqbLTOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcHn-0000000402a-20n7;
	Tue, 27 Oct 2026 08:11:59 +0000
Received: from out-38.mta1.migadu.com ([95.215.58.38] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcHj-0000000400o-2xOe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 08:11:57 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=uPm1bCuVoiN/lEjit+HbKmRBz2Yja0dVUN8FPqoeyWI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793088712; v=1; x=1793693512;
 b=U0BJUmhX6RzNk2/1qkmWnQdb3QryqZz51xgBbvnMpozZvRbiaxWB2hkdQ53sMVYEDPg7u+Cg
 YqMPfztZI0Y8rZdq9z+651ka5O8LUIvsiXN3dfQe5V4FBJlC2sv1ty+cL9uBOmba9HluKY/CZ7B
 MmXHxSp6221CY4ky4tZmTbHE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 45e916e20e21a3dd;
	Tue, 27 Oct 2026 08:11:52 +0000
X-Mizu-Trace-ID: 45e916e20e21a3dd
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	Oculytic <oculytic@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 0/3] KVM: arm64: Fix PMU handling in pKVM
Date: Tue, 27 Oct 2026 08:11:44 +0000
Message-ID: <20261027081147.498183-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_011155_963354_FA21C0BF 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Two fixes and a hardening patch for PMU handling in pKVM, as one series
[1].

The first is Vincent's rework of his HPMN fix. It supersedes his earlier
posting [2]. Rather than read nr_event_counters through a different
accessor, the host now copies the hypervisor's kvm_host_data before it's
deprivileged, so host_data_ptr() returns what was set up at init.
Otherwise, HPMN is 0 and a non-protected guest's event counters don't
count.

The second is the non-protected half of Oliver's patch from 2024 [3]. It
passes the host's PMU events to the hyp vCPU of a non-protected guest,
whose counters otherwise all read 0.

The third covers the protected half. It stops the host's counters while
a protected guest runs, so the host can't count the guest's cycles and
events. Side channels are outside pKVM's threat model, so it carries no
Fixes: tag.

Based on kvmarm/next (dd0bc00e3e920).

Cheers,
/fuad

[1] https://lore.kernel.org/all/86bj8kzix4.wl-maz@kernel.org/
[2] https://lore.kernel.org/all/20261023092007.3918848-1-vdonnefort@google.com/
[3] https://lore.kernel.org/all/20240305184840.636212-2-oliver.upton@linux.dev/

Fuad Tabba (1):
  KVM: arm64: Disable host PMU counters for protected guests

Oliver Upton (1):
  KVM: arm64: Pass the PMU events to the hyp vCPU of non-protected
    guests

Vincent Donnefort (1):
  KVM: arm64: Synchronise kvm_host_data before host deprivileging

 arch/arm64/include/asm/kvm_host.h  |  1 +
 arch/arm64/kvm/debug.c             |  4 +++-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
 arch/arm64/kvm/hyp/nvhe/switch.c   | 24 ++++++++++++++++++++++++
 arch/arm64/kvm/pkvm.c              |  6 ++++++
 5 files changed, 45 insertions(+), 1 deletion(-)


base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
-- 
2.47.3


