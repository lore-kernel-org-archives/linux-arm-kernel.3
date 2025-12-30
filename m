Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25EBE94116
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 07:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T4/bNZrUYTbxYxNrc58e0uJZN6c9cRUxViZqrgTyrx0=; b=Aj02jb/hUlfXlwlUO1+NmflwRj
	EKZDHjjYXv68aPnmdk79ehMdlRk6j4Kcq2nftAILhGpG0oo853qlYPzPrOSYwbreMVdheV0+1rzg8
	XKQYkTgCv9A3HE563VxmQHal+PC5ZdeGA1ghrK4xfNjiGh6oggK0JyTPghJ5VXxut8PIG6PrSPBn6
	6h2TXKv0QhGVZad/TVOURvVEMp6yoxDeQ2yVoBqgzE4xm8qC7z1SD9uV51UbzreSBRO5hOHuFiHiI
	Vlv22WLVKJZXzrg6YAXy6dhg2rmr2GD8juqEcCvEBj00B3+ARpn/zSlRr8fk2EQ6eg778RW4pYx4F
	CKP4Yucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsu-00000004Upn-3Od1;
	Tue, 30 Dec 2025 07:11:12 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsj-00000004Ujs-3EvL;
	Tue, 30 Dec 2025 07:11:06 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767078659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4/bNZrUYTbxYxNrc58e0uJZN6c9cRUxViZqrgTyrx0=;
	b=hsuVNeIsqG+mp9hett6W8DjHHiEpQ6s2Ho/Td0fRW71oUG+rYuSSfZq91hgaFgiRczjp1Y
	voLAxW0UmoN/kotLkDRkcu9gJigMuTvHLkiscMLnSYSp8TXVs80qz8YQ2E4BiDFtRnHzOD
	Ek7BWrFUUU7O++M33LyONfs/PfD2djwH2pzAZBpP/Ln+CWczbbw67udib1WdYy3bJw8mry
	kDKLpaRqKTiO7e2g78DigGcWrlsKexkeaWI5+o7LSLQdp+WCwhZcoMVDiezUaQfYjlIKBY
	ZC/5yoDj6LS5TYIByw4ZARygb+8eIVEcnQY8RrHoKtukzxIoOJ8Bc3N8STTrtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767078659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4/bNZrUYTbxYxNrc58e0uJZN6c9cRUxViZqrgTyrx0=;
	b=GIVvWqOacv2Vx/tzMallrDWHecJqxqWGHuyDaSQdA8bQDAnAoIA7/AA86aAHaGJtIRhjfv
	b4WxnNlqFsCRA4CA==
Date: Tue, 30 Dec 2025 08:10:58 +0100
Subject: [PATCH 3/5] nios2: uapi: Stop leaking
 CONFIG_NIOS2_CI_SWAB_{NO,SUPPORT} references to userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-headers_install-config-leak-v1-3-efba5c58073d@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767078657; l=1689;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=n9zn4K/Hu7Fta3297AtI35P1y+fLlUk+UIK90uLO2Gk=;
 b=z57bRP/lyKdng7CDc9KNssbRyXisTA525qNWfLIqSqxCBd+OiPFi0tHkwlZuZAWi578OPYPSe
 nCI2sAmmFr0CkBFmwSGAUWfzScu3QlmGj83lokWClpqSYYYBRUD58aX
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_231102_122605_A0FE788B 
X-CRM114-Status: GOOD (  10.41  )
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
behind 'ifdef __KERNEL__', so it will be stripped by
headers_install.sh. The result for userspace will be the same, but the
exceptions in headers_install.sh can also be removed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/nios2/include/uapi/asm/swab.h | 2 ++
 scripts/headers_install.sh         | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/nios2/include/uapi/asm/swab.h b/arch/nios2/include/uapi/asm/swab.h
index 9750547a5f82..bbfa9bd10b2f 100644
--- a/arch/nios2/include/uapi/asm/swab.h
+++ b/arch/nios2/include/uapi/asm/swab.h
@@ -14,6 +14,7 @@
 #include <linux/types.h>
 #include <asm-generic/swab.h>
 
+#ifdef __KERNEL__
 #ifdef CONFIG_NIOS2_CI_SWAB_SUPPORT
 #ifdef __GNUC__
 
@@ -34,5 +35,6 @@ static inline __attribute__((const)) __u32 __arch_swab32(__u32 x)
 
 #endif /* __GNUC__ */
 #endif /* CONFIG_NIOS2_CI_SWAB_SUPPORT */
+#endif /* __KERNEL__ */
 
 #endif /* _ASM_NIOS2_SWAB_H */
diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 4f03521f4026..613f400a67d1 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -70,8 +70,6 @@ configs=$(sed -e '
 #
 # The format is <file-name>:<CONFIG-option> in each line.
 config_leak_ignores="
-arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO
-arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT
 arch/x86/include/uapi/asm/auxvec.h:CONFIG_IA32_EMULATION
 arch/x86/include/uapi/asm/auxvec.h:CONFIG_X86_64
 "

-- 
2.52.0


