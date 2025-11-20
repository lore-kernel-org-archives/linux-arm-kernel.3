Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B40CF9C73
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyUe5SLWZ5nQUckTs2w0jWXggRzYCb7m5V6AlO4JSgk=; b=s7G4A4iJGB9F2EB6W8ggbthy27
	jutEASFXeEESmpwS4inpBqx6OCph6JM4GAGMHhqjCQ/vw9PhxJlaCl3JU65jr2SgDV1qylwF9xOMq
	tqGiRmOFjw7cyysjKU+HNGqt6fHr7hoUjkl6VsuM22EDSROO4d4kSL4QiduOybAXS7JBaOgJfowBf
	RE4+Nt/bgprmS+bqXwnyPjeEJnMlv86P/l2r0EEMgX5rCa6BIC/S8HEif1uPriIFxMPzVAgMq9c1X
	ptAq8kHh6fjL/HRWk6+qSTe7YJSRP20i60LYPjauabnlKr14cIAi3629T94pigSQDSD+dlAxUOmsI
	wfvgDtZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Px-000000075co-2XBk;
	Thu, 20 Nov 2025 17:26:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Ps-000000075Y6-2ktq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:25:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D93A44221;
	Thu, 20 Nov 2025 17:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB448C116C6;
	Thu, 20 Nov 2025 17:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659555;
	bh=k4X+SvMugMHhrjX6NQq/vIrlSTaNkooCR283WJN59gs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WFe5qtmIB6iZmy4rPe4CmVG9smUvAoshAWBEt8t4AIFgy5FTsoMtt0EqAZmFem/2k
	 lzq7Z/FeMvyIoq86S1Fn26vumBuu6gz21xiy/+JrGwQ5sfxvVwVnIU3B0V5UTLh6ke
	 +39wUxLyGi6nWiPcp4z2aM3/CxGsU879FV4dgq+K3FQBQTDiQBVYrISKozBcLbPbtZ
	 PPVKABStkkWB+lqtB8WImLou/fTKpmqVQh5QMiC1PRFwvDZqhMJjBA5HFDn7fDPXcB
	 kXTVIv8WT4jP58s+U+Vgm4ccIOwGcRgtvjICzppHOpE/X+X5XOi3xZcWD4nbUMlR3Y
	 MMUpd6Qxm3lGA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Pq-00000006y6g-02qS;
	Thu, 20 Nov 2025 17:25:54 +0000
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
Subject: [PATCH v4 01/49] irqchip/gic: Add missing GICH_HCR control bits
Date: Thu, 20 Nov 2025 17:24:51 +0000
Message-ID: <20251120172540.2267180-2-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20251120_092556_777963_7B6F162C 
X-CRM114-Status: UNSURE (   8.98  )
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

The GICH_HCR description is missing a bunch of control bits that
control the maintenance interrupt. Add them.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/irqchip/arm-gic.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/irqchip/arm-gic.h b/include/linux/irqchip/arm-gic.h
index 2223f95079ce8..d45fa19f9e470 100644
--- a/include/linux/irqchip/arm-gic.h
+++ b/include/linux/irqchip/arm-gic.h
@@ -86,7 +86,13 @@
 
 #define GICH_HCR_EN			(1 << 0)
 #define GICH_HCR_UIE			(1 << 1)
+#define GICH_HCR_LRENPIE		(1 << 2)
 #define GICH_HCR_NPIE			(1 << 3)
+#define GICH_HCR_VGrp0EIE		(1 << 4)
+#define GICH_HCR_VGrp0DIE		(1 << 5)
+#define GICH_HCR_VGrp1EIE		(1 << 6)
+#define GICH_HCR_VGrp1DIE		(1 << 7)
+#define GICH_HCR_EOICOUNT		GENMASK(31, 27)
 
 #define GICH_LR_VIRTUALID		(0x3ff << 0)
 #define GICH_LR_PHYSID_CPUID_SHIFT	(10)
-- 
2.47.3


