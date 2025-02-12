Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3971FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 18:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=80Y8KO9mnS4HUlrApjmMLmIi+qSdZ6BT/KhSJ/xkMCw=; b=LdVnSFMVAksfyGA3uJtMUCchJb
	SABz3bX4SFH8kdNEpUhac/9rlxX1KrP7LoYEkpKYI3eJm73ZyJfRoD/rB7QTbz7LVaJ5Bw78VZYVu
	FRRPeM20jzXTGNYIgEQ2lN+ncFb6pU7r+JYuSmKcX+T8aZ7HjocJigdlB23C+mCm/YUDGXYaJ8rka
	QvIOTBRSgo+RQdEd5gXLxGaQM+njpD8rbX16VpUTdI4WfqCA/w+fsa7tPGJCus9VV2FbIpQDJVeWy
	Fgjj4TJJHNAd8c96w2dRO+jtwzW/Gk0P7Lp9cHFhzna1GMBSDRtf01hkfjHumTckXRFuvaK4oW796
	ulrrSDKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHSO-00000008TLk-1xLh;
	Wed, 12 Feb 2025 18:27:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHQy-00000008TDn-2Iku
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 18:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 67AB55C3A58;
	Wed, 12 Feb 2025 18:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D47C4CEDF;
	Wed, 12 Feb 2025 18:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739384763;
	bh=4cuh+Su6YOW/JDAtjxMJGrPPdb0h5qJVydq5yC+hOnc=;
	h=From:To:Cc:Subject:Date:From;
	b=rUM2Y6a9St+E2+MsrkLwReQO7EJfa4V+1Xz24l7jOuKvph0CvFUikBigRzjNqEze2
	 H+hQlxZJRc+kuEWGGxAmQIDne0xHqyv0PkR1GsesxRbykwahkaZdMBSc4CcTLZCLuI
	 p4c8qD24n29JzHS1ECVLNZ47GJ9bcbcrxReMbpVWsnSFUaiMVpUJu3ephA7qlqfyRD
	 /TsrIAhsbhARRdnzVbWAtm7B73Cp6kKV0UibE40wWh1GOWBL1SXBIS2nEnQMYhKEeu
	 vhn0pQkpoqQ7imWGkhdK6QkVcDeKdgFBldFK1P0JDiM4g9KC+1xFy3tF/P+tpUMFxs
	 lCqnEZI+xSF4A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tiHQv-003RQt-Et;
	Wed, 12 Feb 2025 18:26:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Alexander Potapenko <glider@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 0/2] KVM: arm64: Assorted vgic fixes for 6.14
Date: Wed, 12 Feb 2025 18:25:56 +0000
Message-Id: <20250212182558.2865232-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, glider@google.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_102604_669582_61C5B7FF 
X-CRM114-Status: UNSURE (   9.50  )
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

Alexander, while fuzzing KVM/arm64, found an annoying set of problems,
all stemming from the fact that the vgic can be initialised or
destroyed in parallel with the rest of the guest still being live.

Yes, this is annoying.

This second version takes a different approach at the problem,
plugging the glaring hole we have between vgic creation and private
interrupt allocation.

Although this is more invasive, I'm more confident about this one than
the initial version I posted a week ago.

Alex, I'd very much appreciate your testing on this.

Marc Zyngier (2):
  KVM: arm64: timer: Drop warning on failed interrupt signalling
  KVM: arm64: vgic: Hoist SGI/PPI alloc from vgic_init() to
    kvm_create_vgic()

 arch/arm64/kvm/arch_timer.c     | 16 ++++---
 arch/arm64/kvm/vgic/vgic-init.c | 74 ++++++++++++++++-----------------
 2 files changed, 44 insertions(+), 46 deletions(-)

-- 
2.39.2


