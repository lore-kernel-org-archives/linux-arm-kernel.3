Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4767CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EX7UqeJJ5hCX5u57djLaBUlrvV6XamGau5ztkSfqIN4=; b=o/IqwYP6InkM4rpTwG+i2yDIZO
	muvC1RP9WSPRUgufI7dKLFuGve72mU/Xerb63TsrqKiM6TNrMqh9pP2c9ptElGYeknnUHXZW/vUH/
	a357BNM+3yuIPif6XVkoaldK8eo9g6s1SLj+e9wHf2t/rbYid2c4kQhOcZFgasrCExIChy5u2IDUO
	ptN8Dz+xOH+L3AkvICoB4WdE6ERNKgblCr5pgARR4/xwuq1XD8K5h33Kx5xs6PoF99303y8PnfBGm
	zNmnYYSzEt0fSs4iIgGUFt7C4uo9m2wsRQBJ/fEg1zCn8lbf35wycJjRAT7Xe/NiqDu0A5aMG3LeB
	EeYkvELA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI92b-00000004DFi-452q;
	Sun, 09 Nov 2025 17:17:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91r-00000004CKk-438W
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C8D360055;
	Sun,  9 Nov 2025 17:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD62C4CEFB;
	Sun,  9 Nov 2025 17:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708599;
	bh=Y2YjeqWLlbOpUJdMaswzmZChqewck/ZmHDILc7SWEwA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=on/FfC/5iuinafoBjgBCmiGRg73s4UnnwGG6EG8FaovQnlhs0lLL4OgXHjvMVCqwS
	 sPidGoIXvhz4NHpcCWULw6uPBezDdhOv/lmYvCVAyRwNgeKrDVdF7rsNnB8WWrT78w
	 ehpdn/iEn7bQ6I1Wp1LkzJ9NtintNXixkAZ86YtJIAczpUHzeTQYIneeJ5M6LWNPr9
	 MqxVf9eVCJe1tzhBPLVcQR5JKfeLwI7maIdC0m5wYcID2QKG7JrelE6crlmOki4rFO
	 f8b8qQx4xYq/pPnJUSm7YUgwG/FMIycZaiJnxQLbNCrh/gVB1iR4x9BlqJ40vkkWqf
	 Nd9Tj/sYbsNTA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91p-00000003exw-0O4D;
	Sun, 09 Nov 2025 17:16:37 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v2 37/45] KVM: arm64: selftests: gic_v3: Disable Group-0 interrupts by default
Date: Sun,  9 Nov 2025 17:16:11 +0000
Message-ID: <20251109171619.1507205-38-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
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

Make sure G0 is disabled at the point of initialising the GIC.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/lib/arm64/gic_v3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/arm64/gic_v3.c b/tools/testing/selftests/kvm/lib/arm64/gic_v3.c
index 3e4e1a6a4f7c3..5b0fd95c6b48a 100644
--- a/tools/testing/selftests/kvm/lib/arm64/gic_v3.c
+++ b/tools/testing/selftests/kvm/lib/arm64/gic_v3.c
@@ -342,6 +342,8 @@ static void gicv3_cpu_init(unsigned int cpu)
 	/* Set a default priority threshold */
 	write_sysreg_s(ICC_PMR_DEF_PRIO, SYS_ICC_PMR_EL1);
 
+	/* Disable Group-0 interrupts */
+	write_sysreg_s(ICC_IGRPEN0_EL1_MASK, SYS_ICC_IGRPEN1_EL1);
 	/* Enable non-secure Group-1 interrupts */
 	write_sysreg_s(ICC_IGRPEN1_EL1_MASK, SYS_ICC_IGRPEN1_EL1);
 }
-- 
2.47.3


