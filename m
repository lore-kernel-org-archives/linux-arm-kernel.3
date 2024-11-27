Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E51D609CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n8tPLdRNtitxi7egZ5Ra7rA+g+0R8ZWkvr8NNT9k5cE=; b=AgW7T9H16a1pDDoYBsPBWib0AT
	svpm8A1DSLPW9wjs5zoJUNvq/JdSE7huxHIP7lOzFBq/pJPZgkANto2HI9gcHpBd2Yxk14nW5fTU1
	IkfeqH0piHLK9NhQ/ZwLBRQS8vCC4Tld50mzWHE6ylHgNCXgNrwfztQJCYurbanEuS9+kJFkW2cT7
	9rZi88d5maX3akxx3reIv3XwqROw1JrRf4eCOcGX7Fn7vcD7jnvUXq9SwF/D8IUti6q7O8nwrmCxF
	lTL3MSRt9Ll95pXkI9bIqFEbrC8GwlJdY2bkV9W336c2dYCVWLcVBwrpy9PW3meoI6kEtosAjyb91
	ag6DvUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFDU-0000000Cpno-42sV;
	Wed, 27 Nov 2024 10:24:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFCT-0000000Cpdh-2f2L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:23:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1BDE150C;
	Wed, 27 Nov 2024 02:23:39 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 29FE93F66E;
	Wed, 27 Nov 2024 02:23:09 -0800 (PST)
From: Luca Fancellu <luca.fancellu@arm.com>
To: mark.rutland@arm.com,
	andre.przywara@arm.com
Cc: linux-arm-kernel@lists.infradead.org
Subject: [boot-wrapper v5] aarch64: Start Xen on Armv8-R at EL2
Date: Wed, 27 Nov 2024 10:23:00 +0000
Message-Id: <20241127102300.2822848-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_022313_714419_39B96151 
X-CRM114-Status: GOOD (  13.50  )
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

When bootwrapper is compiled with Xen support and it is started
at EL2 on Armv8-R AArch64, keep the current EL and jump to the
Xen image using the SPSR_KERNEL as spsr_el2 value.

The only available boot method on Armv8-R AArch64 when starting
Xen is spin table at the moment, reflect this in the build
configuration.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v5 changes:
 - Don't allow AArch64-r + Xen + PSCI from the build system, update the commit
   message.
v4 changes:
 - no changes
---
 Makefile.am         | 1 +
 arch/aarch64/boot.S | 2 +-
 configure.ac        | 5 +++++
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Makefile.am b/Makefile.am
index aecda694fd6c..a8d5c1b96822 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -127,6 +127,7 @@ XEN_CHOSEN	:= xen,xen-bootargs = \"$(XEN_CMDLINE)\";		\
 			compatible = \"xen,linux-zimage\", \"xen,multiboot-module\"; \
 			reg = <0x0 $(DOM0_OFFSET) 0x0 $(KERNEL_SIZE)>;	\
 		   };
+DEFINES		+= -DXEN
 endif
 
 if INITRD
diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
index 565397823cb4..3fcc63bf2437 100644
--- a/arch/aarch64/boot.S
+++ b/arch/aarch64/boot.S
@@ -100,7 +100,7 @@ ASM_FUNC(jump_kernel)
 	mov	x1, x21
 	mov	x2, x22
 	mov	x3, x23
-#if defined(BOOTWRAPPER_64R)
+#if defined(BOOTWRAPPER_64R) && !defined(XEN)
 	// On Armv8-R Linux needs to be booted at EL1
 	mov	x4, #SPSR_KERNEL_EL1
 #else
diff --git a/configure.ac b/configure.ac
index a433c89bd2ae..a16bc25508f3 100644
--- a/configure.ac
+++ b/configure.ac
@@ -115,6 +115,11 @@ AS_IF([test "x$USE_PSCI" != "xyes" -a "x$KERNEL_ES" = "x32"],
 	[AC_MSG_ERROR([With an AArch32 kernel, boot method must be PSCI.])]
 )
 
+# Don't allow PSCI + Xen + aarch64-r
+AS_IF([test "x$USE_PSCI" = "xyes" -a "x$USE_ARCH" = "xaarch64-r" -a "x$X_IMAGE" != "x"],
+	[AC_MSG_ERROR([With aarch64-r and Xen, PSCI must be disabled.])]
+)
+
 # Allow a user to pass --with-initrd
 AC_ARG_WITH([initrd],
 	AS_HELP_STRING([--with-initrd], [embed an initrd in the kernel image]),
-- 
2.34.1


