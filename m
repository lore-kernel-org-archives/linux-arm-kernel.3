Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DE9CD5BAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1ZTWmcfWcBrA6asMVKYTryHIgkiaWDb98CfxFaa4OIE=; b=zrzfdTdb06pagfwtZ2TvRWTdiR
	VaQ49FlCn9CviK0T8P0oatNUxwK5IO4Yh5A/7DKX8U5ym6OckXbd+VrMX5A3wKR2qvyz3XNxkqRCM
	sFpRJUt0ZjCVpX2/X1trAs/k+t3Gr2VkoIuVnUCPiIcS+yVOxVELlL7zegToWrZHyvjVAOCeDYUqw
	CwUeydpIiNoGdOIK7P1wmLcO0c+H3KivOQH6t2e8zBXVVnqF531w0NFSpjiCXaIkPIDtUDPWve2iF
	M0gAvuB46rUZGSiah6NeHENpebiBXmpw1GtRIgpiNbmal0JiI8YBzUldCPDLEWfeiyGDrKdIIIwUW
	KOVM1JkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbJG-00000003n8T-2qCr;
	Wed, 20 May 2026 07:25:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbJC-00000003n7p-2Xut
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:25:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 40B3541B41;
	Wed, 20 May 2026 07:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2242A1F000E9;
	Wed, 20 May 2026 07:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779261938;
	bh=1ZTWmcfWcBrA6asMVKYTryHIgkiaWDb98CfxFaa4OIE=;
	h=From:To:Cc:Subject:Date;
	b=SS9dAaIqeG7mtcm2GEXgu+qdkW6PkS0MxthmRj1KgDVKu74fkj4Tc7Nt0vrt/ZzT3
	 vvvQTV30s3BqNNNGlQocs2ApQK3Y0oXiv4EnRU6mBqksH/NGCODbkCTBwqm6ZgC781
	 iNYXVcO9+EUwwB6Y5GYHyEjSss4Ob4a3elHlCTTZgkIoInJ53ytYObSrntu54WUTS6
	 IuN//gDrTcxV+98ceFu5+4kqzvrcl7ijB2OEj7Br5Hr8DQyoDYj7pSVtRfZveeQZJI
	 zVt8YTiQoYZ9L68ma7SBKG1tIeaGsdxBZEBO/PqDv34rG++aVQWnwFibcM00uqcwdl
	 /7lhB+AaaXoxw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPbJ9-00000004Foi-3hWZ;
	Wed, 20 May 2026 07:25:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Michael Bommarito <michael.bommarito@gmail.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Will Deacon <will@kernel.org>,
	Yuan Yao <yaoyuan@linux.alibaba.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Subject: [GIT PULL] KVM/arm64 fixes for 7.1, take #3
Date: Wed, 20 May 2026 08:25:18 +0100
Message-ID: <20260520072518.504865-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: pbonzini@redhat.com, michael.bommarito@gmail.com, vdonnefort@google.com, will@kernel.org, yaoyuan@linux.alibaba.com, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_002538_665727_ACE28005 
X-CRM114-Status: GOOD (  10.11  )
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

Here's the next set of KVM/arm64 fixes for 7.1. Continuing the trend,
we have two AI-fuelled fixes, both of which are stable candidates.
Additionally, a minor tidying-up of the hypervisor tracing descriptor
validation.

Please pull,

	M.

The following changes since commit effc0a39b8e0f30670fe24f51e44329d4324e566:

  KVM: arm64: Pre-check vcpu memcache for host->guest donate (2026-05-07 14:12:42 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-7.1-3

for you to fetch changes up to 1702da76e017ae0fbe1a92b07bc332972c293e89:

  KVM: arm64: Fix nVHE/pKVM hyp tracing error on invalid desc (2026-05-20 08:08:37 +0100)

----------------------------------------------------------------
KVM/arm64 fixes for 7.1, take #3

- Fix ITS EventID sanitisation when restoring an interrupt translation
  table.

- Fix PPI memory leak when failing to initialise a vcpu.

- Correctly return an error when the validation of a hypervisor trace
  descriptor fails, and limit this validation to protected mode only.

----------------------------------------------------------------
Michael Bommarito (2):
      KVM: arm64: vgic-its: Reject restored DTE with out-of-range num_eventid_bits
      KVM: arm64: vgic: Free private_irqs when init fails after allocation

Vincent Donnefort (1):
      KVM: arm64: Fix nVHE/pKVM hyp tracing error on invalid desc

 arch/arm64/kvm/arm.c            | 4 +++-
 arch/arm64/kvm/hyp/nvhe/trace.c | 9 +++++++--
 arch/arm64/kvm/vgic/vgic-its.c  | 4 ++++
 3 files changed, 14 insertions(+), 3 deletions(-)

