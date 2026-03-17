Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78410FEDA03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bTIujiPcBUQ9rAyvhKv5zYfnSXEHk/vBl/4OAZBC5s0=; b=SL2Lb+ZPi1uKxG+ffiJzFujxmJ
	imCGhIBAZMWqz9iKHEwocHXZRqKTStCepvvdZiaFGx7mO8TwpX9oV6acSAj1RoJeEinafRNvSY+9z
	I1ujhh2Gj0LdAmF/B6HGdLqEcSl+RUg5p9kdzEl0EogJvAiL+E/Psd7Nc8t3A5x00pWroRKM3ZZiq
	ulxdaeO0VFC2ymA0fqbnEEwYryemrFbzHZVhjWM1g37huaVOq/2oXeS3+r2hV74FJgq6ElFwwxV7p
	AyarPTMsLCpLmn2RPFsvI9zE9pejO68LWCUHVmKD9lKTpBDB2qmDDlPhJxwoNLQY/60TjBiqKFN42
	Np+IZMNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Z8d-000000073Ph-1EtD;
	Tue, 17 Mar 2026 18:27:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Z8a-000000073PC-27vZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:27:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C01FC1477;
	Tue, 17 Mar 2026 11:27:18 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 417BB3F7BD;
	Tue, 17 Mar 2026 11:27:23 -0700 (PDT)
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 0/2] KVM: arm64: nv: Expose shadow page tables in debugfs
Date: Tue, 17 Mar 2026 18:26:36 +0000
Message-ID: <20260317182638.1592507-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_112728_592429_5B77840E 
X-CRM114-Status: UNSURE (   7.04  )
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

This is v2 of exposing shadow page tables in debugfs, there are a few
small improvements, please see below.

Changes in v2:
 - move debugfs_nv_dentry also behind CONFIG_PTDUMP_STAGE2_DEBUGFS
 - use a macro to define the file names of shadow ptdumps, also
   explicitly spell out the string to get its maximum size
 - add Reviewed-by tag from Sebastian (thanks!)
 - Link to v1: https://lore.kernel.org/kvmarm/20260308231829.864983-1-weilin.chang@arm.com/

Wei-Lin Chang (2):
  KVM: arm64: ptdump: Make KVM ptdump code s2 mmu aware
  KVM: arm64: nv: Expose shadow page tables in debugfs

 arch/arm64/include/asm/kvm_host.h |  9 +++++
 arch/arm64/include/asm/kvm_mmu.h  |  4 +++
 arch/arm64/kvm/nested.c           |  6 +++-
 arch/arm64/kvm/ptdump.c           | 60 ++++++++++++++++++++++---------
 4 files changed, 62 insertions(+), 17 deletions(-)

-- 
2.43.0


