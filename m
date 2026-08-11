Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD654C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 20:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OvNAr9Lgf36KCWSOvkbkg/HFww2daCBUTIh+sBR2P4U=; b=Yxrvf255qbEg3XoLhqFd9zbGTg
	V4tVrSZ5hczArBWKe7hJj47aNyb1NqyauuJA9W6mar586ivbMTMPVbDyTzUkxpyxdRk+PefkgMkGM
	oOoSn1RIQQvJ6x3z1TRlr/xIbLLarp0I3xkQEwt8NnsK6T5e1GJNDZzy5edfQDIGAPYJ9tg9Ag/Sa
	X/sWN8HdnAOWb+x26Zr+JYpHB169k7BD+CgFWBoPYLjgOI9iecSW2Q694pekg/iLtOB4ufyaj2gHE
	aebmsU8TYvLnWEeaXECUb9wneZkIe1gk1NzuFcb18yvM6YIJvFLUpp2ctNfEEk6qthtYOQcbq8rTv
	+4r3lugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtsuw-0000000EuPw-2fSo;
	Tue, 11 Aug 2026 20:17:46 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtsut-0000000EuP8-0DHg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 20:17:44 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1786479459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OvNAr9Lgf36KCWSOvkbkg/HFww2daCBUTIh+sBR2P4U=;
	b=QpOiOYAK93eoX1joUGvSC/oFNENqYkEePKK9HJoho93XKmWa2u4StufcOkb/bc1z7dxnaN
	6V0t4X+zAVrRzyKhllZXS6y88QVWeDBsfgQUUexnPDRMMOpgRsYiklgPVekIXFvZMWm9pu
	qKpLQ1JmXEQBTIglVc/IBEQgxrFgD/E=
Date: Tue, 11 Aug 2026 22:17:35 +0200
Subject: [PATCH] arm64: Add override for WFxT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-idreg-override-wfxt-v1-1-1c71228d0719@cyberchaos.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5FMBRG4VeRPT5N2hIRryIGh/5lGyC7bol4d
 8XwG6x1UoAwApXJSYKNA09jhPkl1Pb/sYNiF01W21wXxkQKOjVtEGEHtftjUY3N09S7zOnMUyx
 ngefjvVb157A2A9rlWdF13R8QyA93AAAA
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
X-CRM114-CacheID: sfid-20260811_131743_254138_F7AC7B2A 
X-CRM114-Status: GOOD (  10.83  )
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


