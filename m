Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB2AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 16:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/uDL7mpXA7Sv9tT7Cl7m0DyMSsfK75Dg0P4J001tRT0=; b=punJGUW5v2SyY/8B5BauVLv8PY
	/bnA93trN60ySo9hk/QGSXrygQDMgCabOe8yAluNBaYCKZ180v45dq0bi/v+CQsrY1WEvVk9FYH+t
	WbCrQ4/mYl7OyPmxQtPDkI1P1rZYtXwCO8IHlvhU+aeqzTdsa28CQLkxqnzfNnCvdes1HbmcqYPfj
	J67yDEmAW6KORp8IFeaPXnXq0Sdv2RdfBWLBgPhIEkHkSLxoJ0R9GZt81iSq90RIPI+GAPyAJDOjA
	PH1A05J/TPRZrNFlb6gWNPmA9MbJmIuesltxB5BzZyXlfeKgnVUz1kR1W9PYP/xTvmXLNk0xa3143
	OYFkX78g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4Tu-00000006oJc-2Jk9;
	Thu, 06 Feb 2025 16:11:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg48P-00000006kzU-2kYP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:49:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4ACEA5C6452;
	Thu,  6 Feb 2025 15:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5741C4CEE6;
	Thu,  6 Feb 2025 15:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738856984;
	bh=PiAJmk/+rhSy611nT7kwN3d7mOQKY+zFOQfapGlrhW0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kw0aGGmR1PfFstL+vOOc+1zpeDQSMSe3uV+95H+W9KPhritjD6buvClM7jXnh5Snt
	 SyF7x4Qs6b5keXG0kQ9yUMAnBBhcxgI8JbZ/yZ9wC+zADuzNnr33n5qNfFxyiLraM/
	 jAsJb4L4uYj/MKvf0F/zWIcjkJ9Qjiw0Q4mqesnF+Pheim1uGDiPEbSk8dEytD7cMr
	 U1cTEunVMzuRA8jKHPaeRivd/1Q7jNK4BMTQa0kgtRYV8+7CW4hWutpyG11nMxuZ0a
	 tJCFfxKFiQ7TwWKz+1gfd1mCQgv471jAr2uU1q9jKAZ3hYpDTDH6GmJXjt17M0tywx
	 E/9CCfWODw2IQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tg48N-001BOX-2k;
	Thu, 06 Feb 2025 15:49:43 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 16/16] KVM: arm64: nv: Fail KVM init if asking for NV without GICv3
Date: Thu,  6 Feb 2025 15:49:25 +0000
Message-Id: <20250206154925.1109065-17-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250206154925.1109065-1-maz@kernel.org>
References: <20250206154925.1109065-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_074945_765524_5FAF8A02 
X-CRM114-Status: GOOD (  10.31  )
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

Although there is nothing in NV that is fundamentally incompatible
with the lack of GICv3, there is no HW implementation without one,
at least on the virtual side (yes, even fruits have some form of
vGICv3).

We therefore make the decision to require GICv3, which will only
affect models such as QEMU. Booting with a GICv2 or something
even more exotic while asking for NV will result in KVM being
disabled.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 6063131f84426..fa429b3fd4ac2 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2308,6 +2308,13 @@ static int __init init_subsystems(void)
 		goto out;
 	}
 
+	if (kvm_mode == KVM_MODE_NV &&
+	   !(vgic_present && kvm_vgic_global_state.type == VGIC_V3)) {
+		kvm_err("NV support requires GICv3, giving up\n");
+		err = -EINVAL;
+		goto out;
+	}
+
 	/*
 	 * Init HYP architected timer support
 	 */
-- 
2.39.2


