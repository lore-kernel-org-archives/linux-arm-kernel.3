Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A0ECDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 14:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wOfkdJxswNNw2pIbisTFSNukr53i0Qpeu0PJzEGLdQE=; b=JVVpQFS3ryFfCfHIjQvAWM606x
	vnvfjsn1bZDp5rjX6xczobglLzBvvR2ALeBFF8nfhbWCWt62qLgrs+G+geZETFvm0eq+weEQ441hS
	hH0GjpnRGkP14izvjjUqQib6NhsTQDpv9H3m9WCZtpWgtnLycNQ8we0IogGezdSxrePTOTMTOroMn
	6Og72k0oGIATHVMCnitqMsx+pHzFaWHWeiTU4luGNOCSeYvahxaTD/aOnc0ojrcfJ3VS+XRho95bT
	facYphNWtiv+ZyxvChOTG8XDw8bEO4T5DVSECtom3M+P4PuXJCbFtCB8r76rHbk2z6MJJq1nky/do
	C8KMj//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc24E-00000006Qtl-2pMV;
	Tue, 23 Jun 2026 14:25:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc24C-00000006QsT-2zZ0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 14:25:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3618F1A25;
	Tue, 23 Jun 2026 07:25:24 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA1DC3F632;
	Tue, 23 Jun 2026 07:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782224728; bh=LBWa5Jp4DhEhEVDG8ihtH0XxusDpbA3AA6OlXqWyKho=;
	h=From:To:Cc:Subject:Date:From;
	b=SJmQEgLH5U9RQdbJYCkovfhbzDasHaRE9FsbntJMNcwgvQCky5e7VUgq1d+hPK2HZ
	 3NcVyZNGijG/IQEMwZeUwdEYyuh4fzVraPbgTZDvYI7w3G+4YsijwVpDbVgYOEfn3T
	 w5QAYDNzAIp/QSFqwjk8GogU3EXv+bjMc2wBKDFE=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH 0/3] KVM: arm64: nv: Shadow ptdump fixes
Date: Tue, 23 Jun 2026 15:24:40 +0100
Message-ID: <20260623142443.648972-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_072532_880215_A2A21C26 
X-CRM114-Status: UNSURE (   9.71  )
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

Hi,

This series fixes two bugs regarding the shadow ptdump debugfs files.
It is based on kvmarm/fixes + [1] ("KVM: arm64: Reassign nested_mmus
array behind mmu_lock").

The first is a UAF. A nested mmu can still be accessed when the debugfs
file is being closed, after the nested mmus are freed. I can observe
this by turning on CONFIG_KASAN and closing the file after the VM is
destroyed. To fix this, mmu access is avoided in the .release()
callback.

The second is sleeping in atomic context, found by Itaru [2] (thanks).
Originally the code creates a debugfs file whenever a context gets bound
to an s2 mmu instance, and deletes it when it gets unbound. Problem is
the bind/unbind is done with the mmu_lock held, and debugfs file
creation and deletion can sleep. This is observable by using
CONFIG_DEBUG_ATOMIC_SLEEP. The new approach is just have one debugfs
file for each s2 mmu instance, and show their state + information when
requested, which can be invalid, or VTCR + VTTBR + whether s2 enabled +
ptdump.

The fixes are tested with CONFIG_PROVE_LOCKING,
CONFIG_DEBUG_ATOMIC_SLEEP, and CONFIG_KASAN.

Thanks!
Wei-Lin Chang

[1]: https://lore.kernel.org/kvmarm/aiKIVVeIr1aAB1yp@v4bel/
[2]: https://lore.kernel.org/kvmarm/aiuF0KSvvv-ZozI1@sm-arm-grace07/

Wei-Lin Chang (3):
  KVM: arm64: nv: Print nested mmu info in kvm_ptdump_guest_show()
  KVM: arm64: ptdump: Store both mmu and kvm pointers in
    kvm_ptdump_guest_state
  KVM: arm64: nv: Move to per nested mmu ptdump files

 arch/arm64/kvm/nested.c | 16 +++++++++++-----
 arch/arm64/kvm/ptdump.c | 29 +++++++++++++++++++----------
 2 files changed, 30 insertions(+), 15 deletions(-)

-- 
2.43.0


