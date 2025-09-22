Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055DFCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 23:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D7YeKGUpeyC+O1EKgPlMMGeJr1Cs60qa/J0QfYMgWnM=; b=pqzCDi3Nhq/wQ+hmZImA+xKOSq
	HxEhSpeYc7JQddam8IyojVaLS7sS/LLNQVNvz3TzAkj5kGdq5rlz/wv2h46WCDJguQ4iQ2zMfpfbO
	SNDTN7ekXdpT+agbb0teAwD9CmGaUTCjO5yfu3HknHbvETqGgw38ANIl00YeDP9SJ/Zxnk2uZ4lwc
	NlkgLR4rmTsOA74XVm/K3pzeXpb+ZcYnkC2+lXulzHCNrjav//5ENyZ9xWNGXrxh5mq0DxvWeHQyM
	78d1PC45VKIOgRMpD9pKs/RjUBAkiJw8gHXFJEVLF6h1o5zt30ylr91Wq2qwRXC3MElCoWOhcHBaa
	hjZXn2yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pWA-0000000BgrI-1MAH;
	Mon, 22 Sep 2025 23:00:22 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.144.207])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0pW6-0000000Bgqi-2mNE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 23:00:20 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 67120C0005E6;
	Mon, 22 Sep 2025 16:00:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 67120C0005E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1758582015;
	bh=rUoj4tYcG/6wEz/Vqkhc/ccNirLpMOCICMtWHCPHTqg=;
	h=From:To:Cc:Subject:Date:From;
	b=lJwABXWv2xWER7S5TxKSXrT+QQmAKt63jFB50zTfrwpYhrhFQiHuycpyYTkGynmI2
	 bRhe5LAO4S6nPYqK87Sy02+EnZDDSMEptHJ20hHSoV2WYpYLofp0EQzPOhlm7xTPdg
	 UtqqS312sqhy/sgUUNyz2O7eukIGucIxOky0tapI=
Received: from stbirv-lnx-1.igp.broadcom.net (stbirv-lnx-1.igp.broadcom.net [10.67.48.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 0E0FD18000530;
	Mon, 22 Sep 2025 16:00:15 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	sashal@kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SUB-ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH stable 6.6] ARM: bcm: Select ARM_GIC_V3 for ARCH_BRCMSTB
Date: Mon, 22 Sep 2025 16:00:12 -0700
Message-Id: <20250922230012.1373936-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_160018_805316_13966065 
X-CRM114-Status: GOOD (  10.13  )
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

commit 2b28fe75c7dbe7ec322e706eed4622964409e21d upstream

A number of recent Broadcom STB SoCs utilize a GIC-600 interrupt
controller thus requiring the use of the GICv3 driver.

Link: https://lore.kernel.org/r/20240726233414.2305526-1-florian.fainelli@broadcom.com
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
While technically not a bug fix, this allows me to properly build test
6.6 on additional platforms within our test rack. Thanks!

 arch/arm/mach-bcm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
index 8789d93a7c04..c705bec1410c 100644
--- a/arch/arm/mach-bcm/Kconfig
+++ b/arch/arm/mach-bcm/Kconfig
@@ -186,6 +186,7 @@ config ARCH_BRCMSTB
 	select ARCH_HAS_RESET_CONTROLLER
 	select ARM_AMBA
 	select ARM_GIC
+	select ARM_GIC_V3
 	select ARM_ERRATA_798181 if SMP
 	select HAVE_ARM_ARCH_TIMER
 	select ZONE_DMA if ARM_LPAE
-- 
2.34.1


