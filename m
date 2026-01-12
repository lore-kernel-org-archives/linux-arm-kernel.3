Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684AED25043
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aig1PLerlTshO4U9aCkB6AyEJOyKwJW4ZrYV/oqt+Zo=; b=pDn4ClBlkBedAmbxBLh+tBooWE
	+mZAARwWWbI4hxn2enqZz730iSbI8P/n6j15OJbO3uIlqZ95+hqfbMKZz9LtNdCP+gCPLv2SCSaI5
	aemQL6Uhtz0UZIYHksbkIfJ4/8dyiOKiYCAGC4R0AAthSRgI2SC1uJ0++WKmQip6Nq5zVPNCg2Kh1
	HWrvY6U3G1EvKWohncoLFxt9lyoHENonqb2+NYsnv6EKi6TcYoFu94lKnG1fSabitzLw2V4FHhLf6
	xCYpLT22znueNRMMZUN/pqoA/Tm+yAxBxogy5cGuo3GZZtQkyeTPF7VCvFLsdxIPcxxXoj+vMmLFA
	u6Y1xUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCp3-00000004wOa-2wXo;
	Mon, 12 Jan 2026 07:58:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCox-00000004wJG-46I9;
	Mon, 12 Jan 2026 07:58:41 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768204716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aig1PLerlTshO4U9aCkB6AyEJOyKwJW4ZrYV/oqt+Zo=;
	b=VYAB18Exhf/aADuuaE9DD/hU/x0uJLEMjUJslnMRp0fqnfzAJZBxsfwlkYR+dIX9y9z2kW
	EmReRBL83bqkEN6HR3F0m/l3StUFl59Sq9/keBFXbCvC8VMEQX2bfxbFyK03HapA88LE2r
	mkqCYTG3faLkc1QWFdP/MpyDSxqk6BrwO8EWN5LdJ4VFnLbggsLyLELVxTOSBxajXmlWLn
	l6iyx0Q+vqfNRuplpsqeR1ZXLXNf1l8lOyWXMlT3LZSupVlXXx2n/UPmeRxZchp6EB56pk
	08wJ2kuOA5+fDu676bieLe/GP+5VcFssnD2QJSkwA0A92HxTf1C0GxhUQaX6EQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768204716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Aig1PLerlTshO4U9aCkB6AyEJOyKwJW4ZrYV/oqt+Zo=;
	b=i2k0uB0uFaluyzydjAKPuMXujYsywjPPFzfDzTvwEe8nRBvKSdxxxxxatUJYO72tEbkq9Y
	PBV5yQUdWIEzHCDA==
Date: Mon, 12 Jan 2026 08:58:32 +0100
Subject: [PATCH v2 4/5] x86/uapi: Stop leaking kconfig references to
 userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260112-headers_install-config-leak-v2-4-4d8084444603@linutronix.de>
References: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
In-Reply-To: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768204713; l=1708;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1ntrFEOo6yMiRT1zeHWBcYc625HQZOv1NUT0dl13IAY=;
 b=4grI2sMTGP7DFiQwLDvxNL2mBz1BsBGNLpD2/jJVu4OMV0rC1rF40fA9mIJCt+4wqJPZHWeLf
 0FFlKc6ssrmB/feRGqNaDQ5JhOHt+RR776B81Q0Mzb7t3S93NGQyEnh
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_235840_153323_6CDA8DAA 
X-CRM114-Status: GOOD (  11.69  )
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


