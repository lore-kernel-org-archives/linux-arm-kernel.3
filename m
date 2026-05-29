Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFEDCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KIHsSApk6kpDUVJxzRZqO9dpY8FfkxUF/l4px39fU+o=; b=CkStBnsZeAdmrtf4EaKnAbe9jb
	gKNrQRJ1TrhauSBiY+AsZmSt4AXW9PHb0Fli7O3NMZA6oQt/ZFXz8BwGLwR5vYrdbc2aDxRw0EUlt
	lL/bMBFCn/FG+3VR3xhOhXLL4+CWKEshrbT74g6ngTex52jUfmBpmHoGMwKs7CrlUoB1ONY13bMK+
	bgEKc/r9PdcGAgTQIDwvqz7W/H0YT/8KbzRB7/iV3TqS/b01tKdfBe8C0bAeskSso779R8ZjvfoQ6
	UBP5WlvDubF/IEfMqY+UxKlIPJ3h9pzkml5a+4LdkuO5+BLLSdcdbvnswPAd9IdNUyVe+jpgAOlhS
	uPhS/rwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuqz-00000007EQf-09XC;
	Fri, 29 May 2026 10:54:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuqx-00000007EQT-1QC5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:54:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C61896012A;
	Fri, 29 May 2026 10:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CAFD1F00893;
	Fri, 29 May 2026 10:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780052050;
	bh=KIHsSApk6kpDUVJxzRZqO9dpY8FfkxUF/l4px39fU+o=;
	h=From:To:Cc:Subject:Date;
	b=m1mQG6jhOXDhTzI4B8SmFplAzzrbvWY4M9n0NthbuUmH7BaBkkvIn3iMJEsssoavo
	 o5JtyScp/w5Nf+eigpIDFF6aN/0/xb0/17NoLOffJMlakKNnisG6M9Su45Hl6uib/d
	 z8kvST01etrOqrFX54/Ni4E0XtUZWsYKN8Yd4Kx5f/yxYonxlqr6Dmeew0oEOKWUuR
	 JOVlczv9cX3wxZkKzCjNGMz3G6FfPZ5q4ZiyloHN1BA5qUvcVQkapMCUueRaOayYKQ
	 ejlOS/U7og1/hsUYrZUcXSJ8N7Gm9QrgiT0TOeokBRjXFn2iWYf5VG9dUigWXegU9D
	 4MDUT3FO80Q/A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wSuqu-00000007NGX-1CoU;
	Fri, 29 May 2026 10:54:08 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Mark Brown <broonie@kernel.org>,
	Qiang Ma <maqianga@uniontech.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [GIT PULL] KVM/arm64 fixes for 7.1, take #4
Date: Fri, 29 May 2026 11:54:05 +0100
Message-ID: <20260529105405.1839362-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, broonie@kernel.org, maqianga@uniontech.com, vdonnefort@google.com, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
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

This is hopefully the last round of fixes for 7.1 on the KVM/arm64
front.

We have yet another batch of fixes for the newly introduced tracing
code (memory leaks), a fix for a config symbol misspelled in the
source code (therefore being permanently disabled), a fix for an
embarrassing bug in the PMU emulation (write any value as long as it
is zero), and an SVE sanitisation bug in nested virt resulting in a
guest being able to access more than it really should.

I've purposely refrained from adding another lot of fixes for more
benign issues since His Majesty has announced he'd be picky about
that. Fear not, they'll be in the 7.2 pull request.

Please pull,

	M.

The following changes since commit 1702da76e017ae0fbe1a92b07bc332972c293e89:

  KVM: arm64: Fix nVHE/pKVM hyp tracing error on invalid desc (2026-05-20 08:08:37 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-7.1-4

for you to fetch changes up to 83726330748981372bde86ed5411d7b306612991:

  KVM: arm64: Correctly cap ZCR_EL2 provided by a guest hypervisor (2026-05-29 10:04:00 +0100)

----------------------------------------------------------------
KVM/arm64 fixes for 7.1, take #4

- Restore CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC to its former glory by
  making sure the config symbol is correctly spelled out in the code

- Don't reset the AArch32 view of the PMU counters to zero when the
  guest is writing to them

- Fix an assorted collection of memory leaks in the newly added tracing
  code

- Fix the capping of ZCR_EL2 which could be used in an unsanitised way
  by an L2 guest

----------------------------------------------------------------
Mark Brown (1):
      KVM: arm64: Correctly cap ZCR_EL2 provided by a guest hypervisor

Qiang Ma (1):
      KVM: arm64: PMU: Preserve AArch32 counter low bits

Vincent Donnefort (4):
      KVM: arm64: Fix CONFIG_PKVM_DISABLE_STAGE2_ON_PANIC
      KVM: arm64: Fix meta-page unsharing in pKVM hyp tracing
      KVM: arm64: Fix rollback in hyp_trace_buffer_share_hyp()
      KVM: arm64: Fix memory leak in hyp_trace_unload()

 arch/arm64/include/asm/kvm_host.h       |  2 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h | 16 ++++++++++------
 arch/arm64/kvm/hyp/nvhe/host.S          |  2 +-
 arch/arm64/kvm/hyp_trace.c              |  9 ++++++---
 arch/arm64/kvm/nested.c                 |  5 +++++
 arch/arm64/kvm/pmu-emul.c               |  4 ++--
 arch/arm64/kvm/sys_regs.c               | 11 +++--------
 7 files changed, 28 insertions(+), 21 deletions(-)

