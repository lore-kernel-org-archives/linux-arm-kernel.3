Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B58ED778B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ktep4IrJI2KzcGp/PLx44OZZSHBYIUKnW740M2Wdb1k=; b=PQUn16xQXN/gG2ZPaUH31nngeO
	j0+n2M3WjFOl1TJ5FfdODkYZ0JnhHcL8p63YZIlb8w9jjgNXKGMpiHUWdbMjUvr3+z1jMet5Vxjm4
	E1sKzBA6VCVqjC1vbg008NHUIHtkHiIvuNC9aKRX7b6fswoKSCI3QN9oKdi+OpnIQy8G+MLabXf8Y
	3wbic43VEr+AkInEtAVIfMWYfChdreVHM2StcQ7E6nRGxS5vYuK8Kn7J0S+xGUpY9E2aMSLfLDilr
	rwpuMkQFSuoBHETXUn30CuzEo1U3WryBBt1iut/oObj3hXgMRfSJn4CWFCG++LWLZlgHcA+tp28ZI
	1XlUot9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMeI-00000009O2Q-0KBx;
	Fri, 23 Jan 2026 19:16:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMeD-00000009O0r-2GDc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:16:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A945600C4;
	Fri, 23 Jan 2026 19:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF69C19423;
	Fri, 23 Jan 2026 19:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769195802;
	bh=IUD3nTPA9qQNHBqt4olcYwi3n/JoCOTBd4pADTKpWb4=;
	h=From:To:Cc:Subject:Date:From;
	b=Y25Zu1cL9t4B9XYzyz7O9EcnPR9g4B2TFROwn+TmDIAilw/JLu6ALrrDJmOIwahRh
	 2AIeG0jruLZdkryWduaLuR0Jh7ekHMfiOE2JMLaX91ZI0X5yZBI/9ZgPEiC+hEcf84
	 J3k7l9VDMTaU1HGcyJRAL7AcEaD6SA6v5y+WS57GPxTKy1wjfPbPIYoV01IEzCjpv0
	 ZlQ4QsA+Bf7PuYWjhdvJwb8OTX4znkStitXUdoNtzEqtc7b23VHikDfSSrbgVC3k5g
	 8D6k27kbxuEsOEWZIHZnOzkmup1+4kacregSheXi6LxFEnsWG67uRvSQ6fYZN0j3wy
	 v0BJRe7Z+Uftw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vjMe8-00000005A2V-2Lq2;
	Fri, 23 Jan 2026 19:16:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v2 0/5] ... and FWB for all
Date: Fri, 23 Jan 2026 19:16:32 +0000
Message-ID: <20260123191637.715429-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, will@kernel.org, qperret@google.com, tabba@google.com, alexandru.elisei@arm.com
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

[Yes, I have since learned that FWB doesn't always mean "Force Write
 Back". I'm not judging.]

This is v2 for this small series teaching pKVM about the benefits
(haha) of using FWB on the host S2 page-tables.

* From v1 [1]:

  - Dropped the stage2_pte_cacheable() hack after both Will and Alex
    made the valid point that I can't read

  - Killed stage2_has_fwb() altogether

  - Collected RBs and TBs, thanks to Joey and Fuad!

[1] https://lore.kernel.org/r/20260119105651.255693-1-maz@kernel.org

Marc Zyngier (5):
  arm64: Add MT_S2{,_FWB}_AS_S1 encodings
  KVM: arm64: Add KVM_PGTABLE_S2_AS_S1 flag
  KVM: arm64: Switch pKVM host S2 over to KVM_PGTABLE_S2_AS_S1
  KVM: arm64: Kill KVM_PGTABLE_S2_NOFWB
  KVM: arm64: Simplify PAGE_S2_MEMATTR

 arch/arm64/include/asm/kvm_pgtable.h  |  7 +++----
 arch/arm64/include/asm/memory.h       | 11 ++++++++---
 arch/arm64/include/asm/pgtable-prot.h |  4 ++--
 arch/arm64/kvm/hyp/nvhe/mem_protect.c |  4 +++-
 arch/arm64/kvm/hyp/pgtable.c          | 26 ++++++++++++++------------
 5 files changed, 30 insertions(+), 22 deletions(-)

-- 
2.47.3


