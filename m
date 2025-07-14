Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9E0C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 12:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlTsA3L4PJU4TS/YxIvTo417z+a3DZDe1k5va34FFvQ=; b=0h63geW2E85i3R7Ow3M+ROMaIF
	WwtD6OnoMh3On6EkAQs3LKLa/zQBmFHGiQ3VOuUMegD+7LyWZQbP7lanDFYQGCCy7HwkeYkBbmhMF
	kYmn5gISVWBssA0UgG9znRqU8DhDCY82CL+sktnOIy7s3oPX/M4ly3xaa8i90XKHR824ujfCJgpL5
	1q7wYXde475ukOxgGw7AYrx6H+1imiNkat6oIVcFNx73YhU08D3bnqKssQX0AcqAwV3QA+z0QKnqw
	dvJcP1z4kIElPd9n90PNN55wbfMaxVtam5nCRXva34+KeH2vzecnX31Nh5zd2Pwl3GFsIHNtTFpH1
	tDf/cY8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubI36-000000028NZ-3R94;
	Mon, 14 Jul 2025 12:12:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHm7-000000024rO-36LG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 11:55:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F0246141F;
	Mon, 14 Jul 2025 11:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97EFC4CEF7;
	Mon, 14 Jul 2025 11:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752494114;
	bh=VhFheOHSkHxcC8PFeBMrTsiY11oDDOR0N2HXFI7KxNw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UdA8KyOZS0Cr4uv4TlwM0YlGmYDb2Re6tPr5WTgUmc0YhX4tNBbCQAtbmv+846HLD
	 +o16W2f3PFF7vn0JdP+l10DBYX7JI62GVzUh/JYT2J0fc8mY2gCUXZtTaoVwJK6Bby
	 4zyqSC/PNoCafEJ+f0sVXS1BnJ2MqpWF5xbD9zhOVKxokIv+8xcG+KgLCbsTFStSnk
	 70lJ7kYpK5+lZUCVja1UW9yYkxuw/sbiIKWfcVCyGgi6smaWujrJ2Rhq8t6LlC2tA4
	 Ms8oNw9pi9Rz06YEJQsF+Z3j+FZUo1aNqInxaLCLBKVtKs+razbxhpYuUeuRox/2HL
	 oRsBZyi9x4eSg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1ubHm4-00FVUo-Pr;
	Mon, 14 Jul 2025 12:55:12 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 1/5] arm64: sysreg: Add THE/ASID2 controls to TCR2_ELx
Date: Mon, 14 Jul 2025 12:54:59 +0100
Message-Id: <20250714115503.3334242-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250714115503.3334242-1-maz@kernel.org>
References: <20250714115503.3334242-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
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

FEAT_THE and FEAT_ASID2 add new controls to the TCR2_ELx registers.

Add them to the register descriptions.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8a8cf68742986..40d916a6e78aa 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4150,7 +4150,13 @@ Mapping	TCR_EL1
 EndSysreg
 
 Sysreg	TCR2_EL1	3	0	2	0	3
-Res0	63:16
+Res0	63:22
+Field	21	FNGNA1
+Field	20	FNGNA0
+Res0	19	
+Field	18	FNG1
+Field	17	FNG0
+Field	16	A2
 Field	15	DisCH1
 Field	14	DisCH0
 Res0	13:12
@@ -4174,7 +4180,10 @@ Mapping	TCR2_EL1
 EndSysreg
 
 Sysreg	TCR2_EL2	3	4	2	0	3
-Res0	63:16
+Res0	63:19
+Field	18	FNG1
+Field	17	FNG0
+Field	16	A2
 Field	15	DisCH1
 Field	14	DisCH0
 Field	13	AMEC1
-- 
2.39.2


