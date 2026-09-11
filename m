Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561BBC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 17:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OvNAr9Lgf36KCWSOvkbkg/HFww2daCBUTIh+sBR2P4U=; b=YnqJLrM31W3wZBweVQpx2GloZJ
	qanWCAz/WyTBfwy8mEgtc3LZJ3LDbD2GogZNce147zRxscdM9NCDhcRqy5y/ml0zCRZ3os02kbu5L
	hkKTBJpivR3BKA1axE1yMxLNN2uFQUbEFOpQYitf45qJMcoeA3FpD/aaBBBsJ94XRZdKMvrRtMkqP
	jh/w4NPwuuL/RbfXiSLeWhv0MzaZqubZG+7wi47KJsMOZnvBCrrkxBV54+CEFpodSDvOS8TCo1TZI
	+3xWHQlpBkysYhQOVqaHNy7rAS2i7+92pyrO8ydIn25JRoXJKiRQdnD6/J39QaNLWh/lv7ch4ongC
	LkDMZ62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54dq-0000000HIAw-0UHV;
	Fri, 11 Sep 2026 17:02:22 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54dm-0000000HIA7-3TAB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 17:02:20 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1789146136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OvNAr9Lgf36KCWSOvkbkg/HFww2daCBUTIh+sBR2P4U=;
	b=K1g13/KK5UI8evEeIQXEUSuMs02USPPzMIudRpiaZJi4NkU7J/oMGlIADehtdMtmkKfvg5
	ib+crH1GsP1U4Lj8LhRxfTOxUOk8hMlBIP0gyG0jaQaF0C4aWNWFFzB/WbbKo5wRvCE3AL
	c69F38j5muCCl26A3VmS3oBCcA+s0xM=
Date: Fri, 11 Sep 2026 19:02:10 +0200
Subject: [PATCH RESEND] arm64: Add override for WFxT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-idreg-override-wfxt-v1-1-7917636741f3@cyberchaos.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32OMQ+CMBCF/wq52Zq2EEAnB1kddDQM0l6hDtRcs
 UII/92Cu3nT9/LuvZvBI1n0cExmIAzWW9dHELsEVPfoW2RWRwbJZc5LISIStswFJLIa2ceMA2t
 knqZGZ5pnBuLli9DYcWu9w7W6VZcz1D/fv5snqmGtXJOd9YOjaZsPYsv/XQqCRalCSFlqXojDS
 U0NUnzV+b3GAPWyLF9oolAm1QAAAA==
X-Change-ID: 20260811-idreg-override-wfxt-b2633fd4d04f
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev, 
 Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_100219_035112_53079245 
X-CRM114-Status: GOOD (  10.88  )
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

Add an override for WFxT support within ID_AA64ISAR2_EL1 to allow
it to be disabled using the new arm64.nowfxt command line parameter.

This accompanies the idle=nop param introduced in a previous patch
series [1] in dealing with misbehaving WFI and WFIT instructions on
Apple Silicon SoCs, and eases debugging of other quirky WFxT
implementations.

Link[1]: https://lore.kernel.org/all/20260804-arm64-idle-param-v3-1-d10f8159062b@cyberchaos.dev/
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/kernel/pi/idreg-override.c           | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cb5251242311..6a35623e4a17 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -587,6 +587,9 @@ Kernel parameters
 	arm64.nosve	[ARM64] Unconditionally disable Scalable Vector
 			Extension support
 
+	arm64.nowfxt    [ARM64] Unconditionally disable Wait For Event with
+			Timeout and Wait For Interrupt with Timeout support
+
 	ataflop=	[HW,M68k]
 
 	atarimouse=	[HW,MOUSE] Atari Mouse
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index 274bc72ba98d..acaf56234973 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -186,6 +186,7 @@ static const struct ftr_set_desc isar2 __prel64_initconst = {
 	.name		= "id_aa64isar2",
 	.override	= &id_aa64isar2_override,
 	.fields		= {
+		FIELD("wfxt", ID_AA64ISAR2_EL1_WFxT_SHIFT, NULL),
 		FIELD("gpa3", ID_AA64ISAR2_EL1_GPA3_SHIFT, NULL),
 		FIELD("apa3", ID_AA64ISAR2_EL1_APA3_SHIFT, NULL),
 		FIELD("mops", ID_AA64ISAR2_EL1_MOPS_SHIFT, NULL),
@@ -254,6 +255,7 @@ static const struct {
 	  "id_aa64isar1.api=0 id_aa64isar1.apa=0 "
 	  "id_aa64isar2.gpa3=0 id_aa64isar2.apa3=0"	   },
 	{ "arm64.nomops",		"id_aa64isar2.mops=0" },
+	{ "arm64.nowfxt",		"id_aa64isar2.wfxt=0" },
 	{ "arm64.nomte",		"id_aa64pfr1.mte=0" },
 	{ "nokaslr",			"arm64_sw.nokaslr=1" },
 	{ "rodata=off",			"arm64_sw.rodataoff=1" },

---
base-commit: 5e6de6a2b522f659defacb1551d0465ba6ce13cf
change-id: 20260811-idreg-override-wfxt-b2633fd4d04f

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>


