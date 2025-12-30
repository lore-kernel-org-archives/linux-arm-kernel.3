Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5D6E94120
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 07:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8y8y0Vihpsa7kuidmjsGKlmg3PpJ4ZCRAtbsIsvEA4=; b=D5cjmsnazDUdcHaVaHGP2hpJmV
	mgJNfe9kVqS4HR2TDPBP+8T+Mx7i5ue+Rc/KkEOQO2iqzzDr6rGRMmcfL+UJVcvQtDCpljF0Wyn7Y
	bGj8vD8QcMvqCOUxTjPghJv8gm8QQ11Js6oKWvwTygQ8q7BW7/zieGl4iKaVE8aLDDKkAS/h4w1w8
	MRYRzd8ZUZVLzzJTx+Ni1j+654DPkDfoj9cabAO81argLuJ1po+KCarHFK119cTlj2eqvVSsYzBck
	eSpQXw3ZDkWGYPndSVGYka8Z1gMiMap3xSVckibNeUP/g9eARrswlAJM0H07fPwktJsNhkTCtOVdk
	oBXnGY9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTst-00000004UoR-32Gs;
	Tue, 30 Dec 2025 07:11:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsj-00000004Ujn-3GFB;
	Tue, 30 Dec 2025 07:11:05 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767078658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j8y8y0Vihpsa7kuidmjsGKlmg3PpJ4ZCRAtbsIsvEA4=;
	b=EPru/JBdop90f20HwDMYpSDZfSu7RVm5ZonqWojoxnwP0ttp730pwGhgu+dcN2QcLVGnbo
	R1xPksWm/cDo8tOxhAzfTemulMqdtxAUiBnTeh/sgtOjFdbOnGdoafIFG8G1XWGOTUbnuV
	PvsiL59O3N5vAanT5C8+mFKWWiBSckzkZvPaZL4jwQvR4/dTsb8cJxHGMo33N8gIz3IGQB
	Y+6pGztPk3G/1Y/ek3HXKk9EPrHNR8vqsM/0Jps2yy42l3fYxQEUennmR5Bk4kB9BMhvYb
	Oby8T8BN8jGtTZKGcQcCvkdL5fkzFOfcaLa+Thgc8OZunk54ld/vJWUyx5R48w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767078658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j8y8y0Vihpsa7kuidmjsGKlmg3PpJ4ZCRAtbsIsvEA4=;
	b=CH3rtd9E772ePoMaKS1UNf/jOc7XYb1l2Rk95sRGGqKZAlJR3w34KPDweNubhBMDgyL4ld
	4z38lK3DT3eCFEBg==
Date: Tue, 30 Dec 2025 08:10:57 +0100
Subject: [PATCH 2/5] ARM: uapi: Stop leaking CONFIG_CPU_ENDIAN_BE8
 reference to userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-headers_install-config-leak-v1-2-efba5c58073d@linutronix.de>
References: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
In-Reply-To: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767078657; l=1602;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=dlMzPHrReQ/pbAK9lXDYAAj3fJdbnf/meKB9Kt356Y8=;
 b=VfzyRNZ1kLHgDwyWyW6WGerkr2OPyUdHI92dxkNl9b8iSqPsOW9iadOCl6gKfQ3SCWmNwnWce
 BIxUeFaUYPOBS6RhRUr7D1L8LgIRkGJoyigr3HSPh05xywhCVZgb5ac
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_231102_123243_F49F0E32 
X-CRM114-Status: GOOD (  10.49  )
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
headers_install.sh, the same way other kconfig references in this file
are handled. The result for userspace will be the same, but the
exception in headers_install.sh can also be removed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/uapi/asm/ptrace.h | 2 +-
 scripts/headers_install.sh         | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/include/uapi/asm/ptrace.h b/arch/arm/include/uapi/asm/ptrace.h
index 8896c23ccba7..fe656da1701b 100644
--- a/arch/arm/include/uapi/asm/ptrace.h
+++ b/arch/arm/include/uapi/asm/ptrace.h
@@ -105,7 +105,7 @@
 /*
  * Default endianness state
  */
-#ifdef CONFIG_CPU_ENDIAN_BE8
+#if defined(__KERNEL__) && defined(CONFIG_CPU_ENDIAN_BE8)
 #define PSR_ENDSTATE	PSR_E_BIT
 #else
 #define PSR_ENDSTATE	0
diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 727f7f82c2c7..4f03521f4026 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -70,7 +70,6 @@ configs=$(sed -e '
 #
 # The format is <file-name>:<CONFIG-option> in each line.
 config_leak_ignores="
-arch/arm/include/uapi/asm/ptrace.h:CONFIG_CPU_ENDIAN_BE8
 arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO
 arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT
 arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION

-- 
2.52.0


