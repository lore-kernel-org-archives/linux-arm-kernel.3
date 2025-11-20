Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDA5CF8856
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 13:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rqbCRwLVsNscBBxZnTO/PnT32DqxwyuxhxzUHdQcc7E=; b=1vluSmizX/CnJIP3U1zSrEAA61
	qaLIWCDlk7RBESPEU2/9ScMexUV4prifsk/cTfv1Vnwdl553Njhd+6kIqGDu7y27FsU6o42vyu2CD
	GmlBhfQFb89s4KDSIslNexUvTEHQVgfb2eJcAHoPkluDgHY176ygh4yIRmE8Z3Xx9mrQBTYJY81hx
	atn7OSYbAyuc1qT5Ur2Zn2mh6mcNeFcrBneS46JjGWsys2AhSmpxf3FVlnG5qw1elXXZBPFUrUq44
	VOppU+Yz3SdGrJ+B6Q+DthvvxQrr4VXgYT5i4c/KGry0/dFpfC8kD7BClbyBjXtWW1a4v5+zPsD3f
	pt1vWcOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4lz-00000006jXe-18cR;
	Thu, 20 Nov 2025 13:32:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4lp-00000006jUH-0vI4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 13:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C5314436D;
	Thu, 20 Nov 2025 13:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CB0C4CEF1;
	Thu, 20 Nov 2025 13:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763645540;
	bh=weqSIwlp3xIIHPIv7fkV+2kNuL/A0SzWqeYwqZ5jLi8=;
	h=From:To:Cc:Subject:Date:From;
	b=dwZgB7CvdEkFocHnkkkxHfssM84KVXbUrqRzwJB1NVp/V/keQLLD+LHdAgN/KNlz3
	 B0k9IWy4v7v5ERWdMvWaEu2c+lzN5HOTzOeaA+spGcFcO8rb7hN6MJZ6UMH89ovZHo
	 /cLmv51TPJXDLk3nf5RaMYchzMFeIfKTWYLz4iNMOAJKXWSNyyZd3RkKfv4N0nHnHV
	 4DlsnoQJZ80fBTTgYFds4dFcLqcc7V/esF0p+cuwrz4lUQdMY98YFWcH4lfVUhApwX
	 OWRALzFH6j7CraDI7+yPYM7t7QhWSQjn3TquzZJZcWbT1fRU57Rgtx+UpeYdgP0ip4
	 6PC4eDdRAaLZA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM4ll-00000006tUG-2khI;
	Thu, 20 Nov 2025 13:32:17 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 0/5] KVM: arm64: Add support for FEAT_IDST
Date: Thu, 20 Nov 2025 13:31:57 +0000
Message-ID: <20251120133202.2037803-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_053221_279956_6BBDBC4C 
X-CRM114-Status: GOOD (  12.60  )
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

FEAT_IDST appeared in ARMv8.4, and allows ID registers to be trapped
if they are not implemented. This only concerns 3 registers (GMID_EL1,
CCSIDR2_EL1 and SMIDR_EL1), which are part of features that may not be
exposed to the guest even if present on the host.

For these registers, the HW should report them with EC=0x18, even if
the feature isn't implemented.

Add support for this feature by handling these registers in a specific
way and implementing GMID_EL1 support in the process. A very basic
selftest checks that these registers behave as expected.

Marc Zyngier (5):
  KVM: arm64: Add routing/handling for GMID_EL1
  KVM: arm64: Force trap of GMID_EL1 when the guest doesn't have MTE
  KVM: arm64: Add a generic synchronous exception injection primitive
  KVM: arm64: Report optional ID register traps with a 0x18 syndrome
  KVM: arm64: selftests: Add a test for FEAT_IDST

 arch/arm64/include/asm/kvm_emulate.h          |   1 +
 arch/arm64/kvm/emulate-nested.c               |   8 ++
 arch/arm64/kvm/inject_fault.c                 |  10 +-
 arch/arm64/kvm/sys_regs.c                     |  17 ++-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/arm64/idreg-idst.c  | 117 ++++++++++++++++++
 6 files changed, 149 insertions(+), 5 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/arm64/idreg-idst.c

-- 
2.47.3


