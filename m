Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57960CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 09:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ls6BhycMR0MQRWTct/mgvvWpOHnBz+eWKJ5OIFsE9Og=; b=3GdLy0Qa/ukXXP7afp+0Vl3UUn
	LxtEkL/maEnRWc92HYd12OsZ8XlmYeMrLzN07JNKVJcY/EIadNlb9oZd66td/NPeQAW1zAGZQwQmG
	U6W7H3Czm2D5kF8Jn9hyQq2GxJtYVqcBvZpeHSj+3e71DO/RAvQWQUSw3aw4RrNd/iyWDp06Fo+KJ
	2MiwO+ma+NhAfxW2kueAyU25mjz8/Almq0cJY4nH+zcd/BMH1MHJ9qbYR25TAKqD3vqglmhdHjMVx
	aIFo84R/5j+8vEFYHInnsNU06xp7lPb46t6XvvTnbD2AdzHsqDXAO6Kn9xQg8phuAXxEi7RlHiHF6
	It4XQ1kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvRs-0000000FmgK-12nf;
	Mon, 17 Nov 2025 09:23:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKvRq-0000000Fmep-0r8C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 09:22:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CE156024C;
	Mon, 17 Nov 2025 09:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E49C4AF66;
	Mon, 17 Nov 2025 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763370941;
	bh=pOniaDpg1ssIIVZiNyGjODYWvRzJsYp/OU7Z8zQYRTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=boymVtrN4mxIXbc5wLw+2GucZh67VyH9jdb724NQG65eSANlhXIdJNp6gXgZPVyer
	 NJVeCqVMVLW+utF7hoyBddCdacvmR9t9qSuD+PkHBudNP7UD8/CGEqirC1D23s7gOr
	 A5C8ch203yZ47EdQHNuwiqvb7uyea/3r94vseaGQw+wXmfda3B8KSDTb+6CJUKLcZR
	 8QTbryIF4WAFkxsEOa8PES9VwUFXCdlgIzg9U9NME8DkyEfIMbDHQqyPAo+2tuSoxB
	 6HydtULHckTVnTAc73sI2rndypTvOZyHMLZ31bg2xlyntZ7eeggQPLH4UwNjgun+Jk
	 xgxDFZRCaJ5tw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vKvKl-00000005lB2-2jTl;
	Mon, 17 Nov 2025 09:15:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 5/5] KVM: arm64: GICv3: Force exit to sync ICH_HCR_EL2.En
Date: Mon, 17 Nov 2025 09:15:27 +0000
Message-ID: <20251117091527.1119213-6-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251117091527.1119213-1-maz@kernel.org>
References: <20251117091527.1119213-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
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

FEAT_NV2 is pretty terrible for anything that tries to enforce immediate
effects, and writing to ICH_HCR_EL2 in the hope to disable a maintenance
interrupt is vain. This only hits memory, and the guest hasn't cleared
anything -- the MI will fire.

For example, running the vgic_irq test under NV results in about 800
maintenance interrupts being actually handled by the L1 guest,
when none were expected.

As a cheap workaround, read back ICH_MISR_EL2 after writing 0 to
ICH_HCR_EL2. This is very cheap on real HW, and causes a trap to
the host in NV, giving it the opportunity to retire the pending
MI. With this, the above test tuns to completion without any MI
being actually handled.

Yes, this is really poor...

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vgic-v3-sr.c      | 7 +++++++
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 6 ++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index 99342c13e1794..f503cf01ac82c 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -244,6 +244,13 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
 	}
 
 	write_gicreg(0, ICH_HCR_EL2);
+
+	/*
+	 * Hack alert: On NV, this results in a trap so that the above
+	 * write actually takes effect...
+	 */
+	isb();
+	read_gicreg(ICH_MISR_EL2);
 }
 
 void __vgic_v3_restore_state(struct vgic_v3_cpu_if *cpu_if)
diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index 40f7a37e0685c..d6797632157a0 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -94,8 +94,10 @@ static int lr_map_idx_to_shadow_idx(struct shadow_if *shadow_if, int idx)
  *
  * - because most of the ICH_*_EL2 registers live in the VNCR page, the
  *   quality of emulation is poor: L1 can setup the vgic so that an MI would
- *   immediately fire, and not observe anything until the next exit. Trying
- *   to read ICH_MISR_EL2 would do the trick, for example.
+ *   immediately fire, and not observe anything until the next exit.
+ *   Similarly, a pending MI is not immediately disabled by clearing
+ *   ICH_HCR_EL2.En. Trying to read ICH_MISR_EL2 would do the trick, for
+ *   example.
  *
  * System register emulation:
  *
-- 
2.47.3


