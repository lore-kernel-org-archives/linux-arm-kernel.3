Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6531CF9C77
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFfNYn3ElLTDTcclVfws5KTR19Ks6alQiPYvUXY5TwI=; b=0abbFotkWta64g6Ycbvk4ko5LS
	M2pugCmSozqe5aHb1bPXmqLOJindxivDRea4io6587LPwspdDWZAHK1Ck2rWyobUqHri08sHx0RM/
	xzCILvags+I9SIm4l3iKVcP378tLUoCz4rpmGzqsV86V0lcQhQ/ns0gpfL+qhIOKv18p2h8giYT9c
	g8TbWicxnXmWuYls4v757MljOH30DnOUjjg4I+YtAKdtzA9KXSZJLPE7zw0zMpEu+hudfeVF5nY77
	hIQlAWl9gFAcIU7h4gY3i8gXmmKs7E1HQJhxYm6zieHE25PHaLwmzk/iefg9S5IQsKRWdypWrd87d
	jqUWreRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Ql-000000076y8-3wWP;
	Thu, 20 Nov 2025 17:26:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q3-000000075dR-2wkV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 969D1443FE;
	Thu, 20 Nov 2025 17:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D8DC4CEF1;
	Thu, 20 Nov 2025 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659567;
	bh=p0S8x4v+kegTRAO2UPFjLUYT0DFokqnzouqr+mlsYFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=evHYaDrHcmm/d4dBZ3lm7c3He6KtePkWodGbf6Nh9thv15uxcC6NwsPUTKIuGGzFM
	 Zt5a605aXqpmzc7aPAPneeLKZJzYbiEndwXMKzInB7MRxcKBA038JWIyUaCuCJiiyb
	 bV6dvRjfbhgvfdp8wAT33hp91ubpPHBBwkbwbTOua/MsLnfgBkWjGZp7yVkNFOcMBl
	 lXZhbiDGE2TLimVZDBGmoU0FlljHsVwh4aSH+71qAGrBMMekryvaN4yN6OCAhAUCb7
	 G8nkzrzsPpsrm0dEZ+BWQ02XeINQhUAGYcvTZ9bcjqTmopMXthsfRvNtYWqiPfQkAe
	 Qb6ubPu8EJmTQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Q1-00000006y6g-2mSA;
	Thu, 20 Nov 2025 17:26:05 +0000
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
Subject: [PATCH v4 46/49] KVM: arm64: selftests: vgic_irq: Perform EOImode==1 deactivation in ack order
Date: Thu, 20 Nov 2025 17:25:36 +0000
Message-ID: <20251120172540.2267180-47-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_092607_853290_1932A170 
X-CRM114-Status: GOOD (  12.69  )
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

When EOImode==1, perform the deactivation in the order of activation,
just to make things a bit worse for KVM. Yes, I'm nasty.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index 9d4761f1a3204..72f7bb0d201e5 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -400,8 +400,18 @@ static void test_inject_preemption(struct test_args *args,
 			continue;
 
 		gic_set_eoi(intid);
-		if (args->eoi_split)
-			gic_set_dir(intid);
+	}
+
+	if (args->eoi_split) {
+		for (i = 0; i < num; i++) {
+			intid = i + first_intid;
+
+			if (exclude && test_bit(i, exclude))
+				continue;
+
+			if (args->eoi_split)
+				gic_set_dir(intid);
+		}
 	}
 
 	local_irq_enable();
-- 
2.47.3


