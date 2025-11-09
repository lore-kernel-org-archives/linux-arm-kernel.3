Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FBACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDjOjDIz5VHcqiysXmUPDIM5lWdyRlIEV41FdukDaj0=; b=LEkkVPcdtXCAW65rC71x6eQ3jA
	mtD+IO1tG3/fUCpiQ+FC84kPIgpp+V0kKJRrSFlX3mIEW2RtCer5ROq+p5ZM6sRdZ9mij+rp1gpaI
	Hr6yyT5lM8+hx4KkAtzLS6D0xq830AhMGR4oE3agQ6CGWHIpi/vAXbpkj6juOHfopPTt6f3RUrfpT
	EWEQV0xCfgVNSYiBMihqvg7JX2iiMCpcizoi6I75ylmtkabZ3Aln2StQ2w6K1qOkLWJBPY0J5bxsO
	RtM5RM2kvnf19xAZW59FCSJkLfmfed8oOY6MMqPnWDVrUMm32sW1LTRnk422kCi9Tijm6Gbk6jll8
	6pEHK6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI92t-00000004DnQ-1aIZ;
	Sun, 09 Nov 2025 17:17:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91s-00000004CEt-0Eiz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E797A444B1;
	Sun,  9 Nov 2025 17:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C287EC4CEF8;
	Sun,  9 Nov 2025 17:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708599;
	bh=oSBIMloc8H591LJEnbKibdMezp20+CUZWrhZ4NkCxts=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GEuyR9z+W0YvXdcXwiJTeMwta3kMTLi/LmOa9JeF7AI6tHlcIjwXcqAd8MBVmtPPh
	 q3Lohw/KQflxCkuRgMp8bhDIxNEWT31Kcha0cUYkr91pKjtYf/YvOa24OZOgUoxSjO
	 IuaHjXP8lJdtlYPcRQSS/iwoptXxkOltL9FNzy7R5qYUo+HigVGfUNLE8eb2NJIgxB
	 0UbgNPFCT4DO1L31hFBDkKGHilNQmoig2CJrWx5SPM0qbLCXndRL1DrFDimpVZKFWS
	 YrYDKXWagwd2vExf1gVgPp6dzDMb/hpWLxRdmXKEE2yWKvGIC339knPgq2DneFG7fq
	 reb9Rtm+TMuXg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91p-00000003exw-3oXS;
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
Subject: [PATCH v2 39/45] KVM: arm64: selftests: vgic_irq: Change configuration before enabling interrupt
Date: Sun,  9 Nov 2025 17:16:13 +0000
Message-ID: <20251109171619.1507205-40-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_091640_166355_47AEB094 
X-CRM114-Status: GOOD (  12.90  )
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

The architecture is pretty clear that changing the configuration of
an enable interrupt is not OK. It doesn't really matter here, but
doing the right thing is not more expensive.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index a77562b2976ae..a8919ef3cea2e 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -473,12 +473,12 @@ static void guest_code(struct test_args *args)
 
 	gic_init(GIC_V3, 1);
 
-	for (i = 0; i < nr_irqs; i++)
-		gic_irq_enable(i);
-
 	for (i = MIN_SPI; i < nr_irqs; i++)
 		gic_irq_set_config(i, !level_sensitive);
 
+	for (i = 0; i < nr_irqs; i++)
+		gic_irq_enable(i);
+
 	gic_set_eoi_split(args->eoi_split);
 
 	reset_priorities(args);
-- 
2.47.3


