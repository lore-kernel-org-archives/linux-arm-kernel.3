Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692CDD31A19
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 07:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aig1PLerlTshO4U9aCkB6AyEJOyKwJW4ZrYV/oqt+Zo=; b=hd/VQiusPyoLRY8EXgS8Au8f3m
	CcxSPC5Qs+50pcXjH+M5xotEuhmFbwjqYONxB7Zp/poS3U3PjMGQrM8dD/fwWZf+lxkt64ySZowaQ
	t69fOLB4gqiydCT12rXNN0xozN/GM7S9Qwz0wsaRrmLq9bjyr33obubNrf3lGrTPfriDqPMS50kqP
	vUra6UKQz17ma6mw9tDdCz6sPcvUIcD6irVM5FzpL2nE3y3abIOzevSzuzxyWZW2lDBqCHEoaerDq
	9k3SsjM9nRE6kkZbQbZAjfFa/CRa4ZzGX13PtKCk9B8kA/j4fuwEQ0AdQX63HrPqnUouDpQP47BG3
	GLqlQuzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIu-00000008CId-3ABO;
	Wed, 14 Jan 2026 07:28:32 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvIo-00000008CBX-1sSI;
	Wed, 14 Jan 2026 07:28:28 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768375703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aig1PLerlTshO4U9aCkB6AyEJOyKwJW4ZrYV/oqt+Zo=;
	b=gaXlW5zA/MYXd6NbKuezEsmax7N92NNr4JWvZvwHId5OISIAYn8uD46FhMFrA9rhwh2PRT
	EU0b26GySHVzPsAzOYDbM/keTxzpVFwGiiun2TuBUg0SjiaXLmaSw4FrRiQOQQ9XMbJWPP
	H2U0UVpJJaO8U29C2enDwnR/UMAAVPLvLhgDXm4BCz/Wm8CvPydD5Uz1rPKaScpvPLSzZQ
	rgzesRbic6oQ6uN+Kg/qW5KULzgEACr+K8gTep6zyB8EfKJ4cD/jfpsV22tvs/Ghi949iy
	qP1+gYIKJIv8w9mfjwbEjWjCxH+yuA+6vENEqyRliyuWEZqmJlNFMlp8zP0fxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768375703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aig1PLerlTshO4U9aCkB6AyEJOyKwJW4ZrYV/oqt+Zo=;
	b=+CvknTftYYD7GsBliqMP9VsegNPf4yvMf3lA0DILNaZeqSNhWWacnQesZmGXC/a3+kji+5
	9N/szH70sgpJCXCQ==
Date: Wed, 14 Jan 2026 08:28:16 +0100
Subject: [PATCH v3 4/5] x86/uapi: Stop leaking kconfig references to
 userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-headers_install-config-leak-v3-4-c14cde735a79@linutronix.de>
References: <20260114-headers_install-config-leak-v3-0-c14cde735a79@linutronix.de>
In-Reply-To: <20260114-headers_install-config-leak-v3-0-c14cde735a79@linutronix.de>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768375700; l=1708;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1ntrFEOo6yMiRT1zeHWBcYc625HQZOv1NUT0dl13IAY=;
 b=unZ0CyXvkfkoMgqz27osbmzz+sWFiYYt2jt4IQ0m90dr/ZexgmllmyMRDCycdCQ5buZiUfe11
 jvv3AV3A6BDC47vBKjbr1LRDnU26RzSjl1j0vpNZO74hj4Hi4fc7GQm
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_232826_619667_051D7CBC 
X-CRM114-Status: GOOD (  11.37  )
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

UAPI headers are not supposed to leak references to kconfig symbols.
These won't be set when building userspace. Hide the kconfig reference
behind 'if defined(__KERNEL__)', so it will be stripped by
headers_install.sh. The result for userspace will be the same, but the
exceptions in headers_install.sh can also be removed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

---
There is no point in exposing AT_VECTOR_SIZE_ARCH in the UAPI in any
case and I have another series in the works to get rid of it completely.
---
 arch/x86/include/uapi/asm/auxvec.h | 2 +-
 scripts/headers_install.sh         | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/include/uapi/asm/auxvec.h b/arch/x86/include/uapi/asm/auxvec.h
index 6beb55bbefa4..bdde9e18f94e 100644
--- a/arch/x86/include/uapi/asm/auxvec.h
+++ b/arch/x86/include/uapi/asm/auxvec.h
@@ -11,7 +11,7 @@
 #define AT_SYSINFO_EHDR		33
 
 /* entries in ARCH_DLINFO: */
-#if defined(CONFIG_IA32_EMULATION) || !defined(CONFIG_X86_64)
+#if defined(__KERNEL__) && (defined(CONFIG_IA32_EMULATION) || !defined(CONFIG_X86_64))
 # define AT_VECTOR_SIZE_ARCH 3
 #else /* else it's non-compat x86-64 */
 # define AT_VECTOR_SIZE_ARCH 2
diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 613f400a67d1..1301ba68d772 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -70,8 +70,6 @@ configs=$(sed -e '
 #
 # The format is <file-name>:<CONFIG-option> in each line.
 config_leak_ignores="
-arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION
-arch/x86/include/uapi/asm/auxvec.h:CONFIG_X86_64
 "
 
 for c in $configs

-- 
2.52.0


