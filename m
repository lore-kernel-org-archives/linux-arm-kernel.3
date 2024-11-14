Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8513D68B06
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 13:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g1maFW3D9GOwu9dAR7TbQfAVQgIK91AX96tevGcIMIU=; b=booPz9rMzPtKWOUcKkeHn+M4yG
	epMwQzHhHQjC/M/+iiQ1S+61AlBalOH9pqvuDWHjCvWXJz9l/OrBrM2eAvG8gR2J/DHdTm7sfNOBf
	MxdoB4EPIBz1vgeCue3t6uw04PRmuZ9JXiAHtrD5kAQLdiDxoiLFScSXev9uFWFNKDkd0Gyi2PHPU
	OtSuUd5KMgHvcx9c0nR8KZhdXvtbJJ+X9WHgQ0192c7A/khAdpJOJhUXLkty/jkDydxiYoWpwXdzF
	31TP43UIe/mdpPxlcXuWh/ZZ6g6EEXbPV9/2JpxFjPBhXJf/T6vi6F8YCw+vQwtsLFGwLaeuFIxBZ
	41aHhO1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZUU-00000009zdr-3jjG;
	Thu, 14 Nov 2024 13:02:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBZSe-00000009zOp-3eN4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 13:00:38 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1tBZSb-0005Tf-6B; Thu, 14 Nov 2024 14:00:33 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: linux@armlinux.org.uk,
	m.felsch@pengutronix.de
Cc: kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: gen-mach-types: don't include absolute filename
Date: Thu, 14 Nov 2024 14:00:18 +0100
Message-Id: <20241114130021.2802803-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_050036_926683_A94F1DAE 
X-CRM114-Status: GOOD (  10.00  )
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

Don't include the abosulte filename into the generated mach-types.h
header and instead make use of arm64 note. The motivation for this
change is Yocto emitting a build warning:

| File /usr/src/debug/linux-raspberrypi/6.11.7/arch/arm/include/generated/asm/mach-types.h in package linux-raspberrypi-src contains reference to TMPDIR [buildpaths]

So this change brings us one step closer to make the build result
reproducible independent of the build path.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm/tools/gen-mach-types | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/tools/gen-mach-types b/arch/arm/tools/gen-mach-types
index cbe1c33bb871..fdc4805b9d98 100644
--- a/arch/arm/tools/gen-mach-types
+++ b/arch/arm/tools/gen-mach-types
@@ -24,8 +24,7 @@ NF == 3 {
 
 END	{
 	  printf("/*\n");
-	  printf(" * This was automagically generated from %s!\n", FILENAME);
-	  printf(" * Do NOT edit\n");
+	  printf(" * Generated file - do not edit\n");
 	  printf(" */\n\n");
 	  printf("#ifndef __ASM_ARM_MACH_TYPE_H\n");
 	  printf("#define __ASM_ARM_MACH_TYPE_H\n\n");
-- 
2.39.5


