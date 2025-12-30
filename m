Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A03E94121
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 07:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=in4GJONd74GWeqIRrh+mhY9mjCdUEPtCPJkNmmK3dx0=; b=UD47GRBnqVXTgdjXrx8PUjliG6
	v/aWG1t9Is+8o7kVJL1D/Xq5spohbNRbeBHGc8lYds6CyUWDxEaAbNYc/axgaNqhW5KWQzg30XGHO
	Sn3Pco759PvCKakdGep5+a7topas9S5vNWdJxO+yzFiWZ1cSilk8zkqPYGGkWIGqvFBJWEicK2FUZ
	xiKFbmanNRJ9/hBA9VoHZur9vSakPolUX0aSHaijhMKW/yraJQRTnZVgIss1nhglaJQirwOraobnS
	DFJf8qT8ufNYvFbb2KKdZsAjwxT4HQw4Hi1uoZJ28Si1cvsGej51jrilb0gEfZqEQrDQ2rjtOL5hM
	x1RcY8jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTst-00000004Unt-0opq;
	Tue, 30 Dec 2025 07:11:11 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsj-00000004Ujp-3F4U;
	Tue, 30 Dec 2025 07:11:05 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767078658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=in4GJONd74GWeqIRrh+mhY9mjCdUEPtCPJkNmmK3dx0=;
	b=KSl10LEqr/doF+o6gyht4lon1lkLhhl3VQsI+FN0oKGdKZF81JQ5TBLhx8JjAXdfPtV/iC
	qIQe9SLAbZ7u78i6vU13HOwGTDtESkeTZE01qFQM/HbaFGg/QsJzJERHuFUimNX4nkMhkH
	yWppjl9wXwW6jxEHQyRdsV9sS2QxGboN3U8wFHP6++KaAmqYR00boru3w76lvro2+hoLCb
	ZLzouH0vqWsz2fC5HFVMzJ4+/EPnaRabQCoY/jDNl1AINSAxIXq7OusWq1H94ZNeCz8XB9
	vszHjs5fTseOyn4Rys6OQmcNtDkmzumuvKscR3XDy1PIKs+CnOovd4QAms5RsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767078658;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=in4GJONd74GWeqIRrh+mhY9mjCdUEPtCPJkNmmK3dx0=;
	b=JFVEiJ44d+GfnQqgHc3+1EeDwJ029+GMLn+V4OaWKdUlKfzQnoPJNnxhE3f66VRRbCjYMn
	osfYUe6Js6nm+MAg==
Date: Tue, 30 Dec 2025 08:10:56 +0100
Subject: [PATCH 1/5] ARC: uapi: Stop leaking CONFIG_ARC_HAS_SWAPE reference
 to userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-headers_install-config-leak-v1-1-efba5c58073d@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767078657; l=1530;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=h1MsBNdSKkOd89IIdtn656mx/NIGmUDhFE20RygCuoU=;
 b=t2Rp3UhE6erZ0JNQ1XxNhg5jEn4P9iBsZ/09JRJ2bo2X/yGCssXYNY4IStsp+xa0U7RwYhsBQ
 ySdxSZoNqX0DTmDu2Y1foVt+pYmJn89SmQTeVL3L0ryhJvptgl6oKap
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_231102_123900_D20A8FA6 
X-CRM114-Status: GOOD (  10.05  )
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
exception in headers_install.sh can also be removed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arc/include/uapi/asm/swab.h | 2 +-
 scripts/headers_install.sh       | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arc/include/uapi/asm/swab.h b/arch/arc/include/uapi/asm/swab.h
index 8d1f1ef44ba7..b2cede1b74b9 100644
--- a/arch/arc/include/uapi/asm/swab.h
+++ b/arch/arc/include/uapi/asm/swab.h
@@ -20,7 +20,7 @@
 #include <linux/types.h>
 
 /* Native single cycle endian swap insn */
-#ifdef CONFIG_ARC_HAS_SWAPE
+#if defined(__KERNEL__) && defined(CONFIG_ARC_HAS_SWAPE)
 
 #define __arch_swab32(x)		\
 ({					\
diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 0e4e939efc94..727f7f82c2c7 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -70,7 +70,6 @@ configs=$(sed -e '
 #
 # The format is <file-name>:<CONFIG-option> in each line.
 config_leak_ignores="
-arch/arc/include/uapi/asm/swab.h:CONFIG_ARC_HAS_SWAPE
 arch/arm/include/uapi/asm/ptrace.h:CONFIG_CPU_ENDIAN_BE8
 arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO
 arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_SUPPORT

-- 
2.52.0


