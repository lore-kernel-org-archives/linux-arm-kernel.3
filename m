Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B0FF01829
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 11:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dAJIwCvydNPxe6jBrh679IfZbgHSGD7N4LB+8+AD8jw=; b=gRpG/P3CPZhuZVdIq08LE6QgR5
	Q3kjqXnBvO7hMaeSflyKzoGvbFCc26WJzBioHCbMoiayAOJ3nfAcQBP5sOe1N7xdTvH+5LJguYBvM
	YvB9wBFMa3k1vWHENFX0raUpRgEs5Pabnq7AUsp8eAz2heA/7ZLjWAnOenbWMiIq59Q8mNOscerAY
	iI5Xia56NXuiDxO8Kob9ddLN0xf8nIIKh1yK4tKPQHzMCQpJhLqNbMsBcTHQxfWqtzPU8CRr1hr8b
	EUO1321pnPbdbbQwnqtOXfLMwOmjYwRZ8lJNcnC+nAw0e6GwjNqwN1pryHggdJ4XgqdMASpZCpLLu
	v4QRnfIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTGj-00000003YiF-3KO1;
	Fri, 06 Mar 2026 11:22:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyTGi-00000003Yi9-3IWl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 11:22:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E0A0960130;
	Fri,  6 Mar 2026 11:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3E6C2BC87;
	Fri,  6 Mar 2026 11:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772796175;
	bh=bTskKNStNZifhhf7Tm8WvVPQQAa5+bxG9ESJPyn5mQI=;
	h=From:To:Cc:Subject:Date:From;
	b=YsOHJERdSCgr/siqbeGLtLQLlYFc+kcKrqWx1ETjGioq/he5BInajVEYHeR+7SpMW
	 7MOGKqrK/i0oICg760+T/DQjgZlFfWcAehXhFC3ExpDnMn3P1SQu1NFoQz/kEWlHD1
	 48YHWHn8U/qlTLN1Mt92fIDogPULBuJzw6Es9DEzhLSKBAWArnXCLae2CZPtR0kDnw
	 /aJdFpPyV2sGjnzGj6Y50onvLT+bz89yM9oU5n2ZpYD1c/nMKpfhYZZ+nNHWqDeZGC
	 a34xyxwfWah5y0DuBK7BJrEmsQOy/lOGJBAcNhh+hJmQ/1aQKv/GRVPvQjinwX9CIM
	 Gxf1om+j7m+1A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vyTGf-0000000GoNa-2HP8;
	Fri, 06 Mar 2026 11:22:53 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <tabba@google.com>,
	Quentin Perret <qperret@google.com>,
	Yuan Yao <yaoyuan@linux.alibaba.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [GIT PULL] KVM/arm64 fixes for 7.0, take #2
Date: Fri,  6 Mar 2026 11:22:31 +0000
Message-ID: <20260306112231.3201502-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, tabba@google.com, qperret@google.com, yaoyuan@linux.alibaba.com, zenghui.yu@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Paolo,

Here's the second set of fixes for 7.0. The only interesting fix is
one affecting pKVM and preventing the host from making forward
progress when a memblock is not page-aligned.

The rest is a bunch of low-severity fixes affecting the page-table
code, some of which Fuad has promised to start cleaning up!

Please pull,

	M.

The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-7.0-2

for you to fetch changes up to 3599c714c08c324f0fcfa392bfb857c92c575400:

  KVM: arm64: Remove the redundant ISB in __kvm_at_s1e2() (2026-03-06 10:42:21 +0000)

----------------------------------------------------------------
KVM/arm64 fixes for 7.0, take #2

- Fix a couple of low-severity bugs in our S2 fault handling path,
  affecting the recently introduced LS64 handling and the even more
  esoteric handling of hwpoison in a nested context

- Address yet another syzkaller finding in the vgic initialisation,
  were we would end-up destroying an uninitialised vgic, with nasty
  consequences

- Address an annoying case of pKVM failing to boot when some of the
  memblock regions that the host is faulting in are not page-aligned

- Inject some sanity in the NV stage-2 walker by checking the limits
  against the advertised PA size, and correctly report the resulting
  faults

- Drop an unnecessary ISB when emulating an EL2 S1 address translation

----------------------------------------------------------------
Fuad Tabba (2):
      KVM: arm64: Fix page leak in user_mem_abort() on atomic fault
      KVM: arm64: Fix vma_shift staleness on nested hwpoison path

Marc Zyngier (2):
      KVM: arm64: Eagerly init vgic dist/redist on vgic creation
      KVM: arm64: pkvm: Fallback to level-3 mapping on host stage-2 fault

Zenghui Yu (Huawei) (4):
      KVM: arm64: nv: Check S2 limits based on implemented PA size
      KVM: arm64: nv: Report addrsz fault at level 0 with a bad VTTBR.BADDR
      KVM: arm64: nv: Inject a SEA if failed to read the descriptor
      KVM: arm64: Remove the redundant ISB in __kvm_at_s1e2()

 arch/arm64/kvm/at.c                   |  2 --
 arch/arm64/kvm/hyp/nvhe/mem_protect.c |  2 +-
 arch/arm64/kvm/mmu.c                  | 14 +++++++++-----
 arch/arm64/kvm/nested.c               | 27 ++++++++++++++++-----------
 arch/arm64/kvm/vgic/vgic-init.c       | 32 ++++++++++++++++----------------
 5 files changed, 42 insertions(+), 35 deletions(-)

