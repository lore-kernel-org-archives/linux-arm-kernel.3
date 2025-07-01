Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FC0C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 15:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6lZg6qLGnaMeo1I6DktmZSdgMTzwSEWGtIYEEY97yJY=; b=dedaMueI5BlHNxSwIADZM35wm/
	7CiE+9H2pDIcBAmv5l4dc/zCcMIAlys0EkE+fBEf48X5c2kCInek2s9oOI9dLr4aNeY9EkFDXfDQx
	DMqVH5NI1UEFoB/xE4BCEJEzmSvtAreqwPbH6sBTC5u6K1I3+cPe8IA9Rx9d0mqBlavvqa5nyN09v
	g3Ybxv0n1mCGI3D/VXgEBJ6hEdeBTp4vsoBSlwsp6hErdEv8x0JRqAKdm68S/AGnKqkiQULkGIJEy
	kMPnBRVYhYYQSPOuPdrmA7ZEbBiu7JidRPlaODcFtk9HAg8dZs5+n6xnXezYNf0IJjR1yqrNj7MYF
	GNKhzxYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWd2O-00000005uVY-2OBS;
	Tue, 01 Jul 2025 15:36:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbTU-00000005bf0-21Jb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 13:56:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C009626BA;
	Tue,  1 Jul 2025 06:56:24 -0700 (PDT)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED95F3F58B;
	Tue,  1 Jul 2025 06:56:38 -0700 (PDT)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Oleg Nesterov <oleg@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/23] ARM: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
Date: Tue,  1 Jul 2025 14:55:58 +0100
Message-Id: <20250701135616.29630-6-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701135616.29630-1-Dave.Martin@arm.com>
References: <20250701135616.29630-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_065640_562221_13584B04 
X-CRM114-Status: GOOD (  13.52  )
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

Instead of having the core code guess the note name for each regset,
use USER_REGSET_NOTE_TYPE() to pick the correct name from elf.h.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/kernel/ptrace.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index c421a899fc84..7951b2c06fec 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -677,7 +677,7 @@ enum arm_regset {
 
 static const struct user_regset arm_regsets[] = {
 	[REGSET_GPR] = {
-		.core_note_type = NT_PRSTATUS,
+		USER_REGSET_NOTE_TYPE(PRSTATUS),
 		.n = ELF_NGREG,
 		.size = sizeof(u32),
 		.align = sizeof(u32),
@@ -689,7 +689,7 @@ static const struct user_regset arm_regsets[] = {
 		 * For the FPA regs in fpstate, the real fields are a mixture
 		 * of sizes, so pretend that the registers are word-sized:
 		 */
-		.core_note_type = NT_PRFPREG,
+		USER_REGSET_NOTE_TYPE(PRFPREG),
 		.n = sizeof(struct user_fp) / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
@@ -702,7 +702,7 @@ static const struct user_regset arm_regsets[] = {
 		 * Pretend that the VFP regs are word-sized, since the FPSCR is
 		 * a single word dangling at the end of struct user_vfp:
 		 */
-		.core_note_type = NT_ARM_VFP,
+		USER_REGSET_NOTE_TYPE(ARM_VFP),
 		.n = ARM_VFPREGS_SIZE / sizeof(u32),
 		.size = sizeof(u32),
 		.align = sizeof(u32),
-- 
2.34.1


