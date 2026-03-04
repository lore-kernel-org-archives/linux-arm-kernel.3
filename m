Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0520AEDA69A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 07:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJIJ4haN/w6vuaqusVIG8WNni7LxRg4LJbwm81SsxRs=; b=sl28OUMmwYIDExVc8BbST8Yhu4
	PqRV7Cnqu7pIJTpgZfPeJiQK7shtvCEzjL+sMw0MLyCZFhHzk+djimWX99KGIjJb86p84aRS87scW
	GqLUfZXUSIFCPfJd46X6m8Jac7IYVEiLY9oylZR96tLMV12g9RgUe2KGsItkSmQldCauP8t8NVfDN
	BNzhZZxwQmBp5RrEy5Lo6VJiL7D06P+pojuY+ovx4PUJtYLhNellyI0SVKgIiHnTfaCCRXbaPjkca
	9nP36qP07OwN62Z8LE9mUSBov8ioz4ZwgO0hfG6LTS28l4dGggMnxK7sdI+cP8sW5g1oxk8ot7AI5
	84uRne8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgz2-0000000GePU-0cHV;
	Wed, 04 Mar 2026 07:49:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgyw-0000000GeFY-06t8
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 07:49:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kJIJ4haN/w6vuaqusVIG8WNni7LxRg4LJbwm81SsxRs=; b=SBw9TqtZbNVq1YmXzVMfxN0r9G
	5Dge5BBgzBNoQyXWOfP7yQy71f6JgBv/XO24+YArOnl8pRBXCuMEzhzmmdPR5KlGaogFXOrycMOB1
	kZHshrwynR/kMQ3Sp1g4UPqcvGzjbz3QuN12VH7NslR3/llhe3khNsLE8daR+3yOt/V1E7Y3nqBnV
	JaCsucOZEyXQwRibkw7EGOoge8efSfh02aXlYfTl3dLS7d/nXoasHGItByxdXSxfDEj+H3exEIB47
	OZ3S7EEQOZEs54YPSmyXL0bbH1vhvK99IgENqzF8i6iJolDZTw6B/TlYUZWUVnlMGBAUNqwbZfDk8
	in4wX4BA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgys-000000042YV-2KQx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 07:49:20 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772610557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJIJ4haN/w6vuaqusVIG8WNni7LxRg4LJbwm81SsxRs=;
	b=FgrMGw+0tDqATS7VwFn8jniFPxJsB1ys8YQGHcvAHXkxmFMvYo6Su3Bt0V4VMk2Y4kVrdM
	dLSWl2sXdEhJkfN+thXnqeDTJO9tF3Q+GFZkArXzG58ZAELVAd5ePAS0t/05yJv32pQJtr
	X249I8HKclhJSXnQ9SSOLoszCvitctXN39T2GrOGypkuf4Twrv2AJvUId15eRl0ml5NYun
	q0lgkc05M41XY33v3Q7EwwlIs7TVNNc6/stetmzcpT6OFhls/hNTXsaSLJLPGH8iS6Z5QJ
	G7xyia40qtFY2IO09BkRWCrWuSP+lMCV/J9Bpw7bAWCsMzAK0gPM2ZNxiomtiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772610557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJIJ4haN/w6vuaqusVIG8WNni7LxRg4LJbwm81SsxRs=;
	b=oCmPdg4PYMuRU28zbCRjZi00Kgg7Vz/AMlJi7v/8L4i0VKJBR7Gvw83sDhM3TFAxcPROYG
	1swfM4HYiuR6GOBQ==
Date: Wed, 04 Mar 2026 08:49:08 +0100
Subject: [PATCH v6 11/14] sparc64: vdso2c: Drop sym_vvar_start handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-vdso-sparc64-generic-2-v6-11-d8eb3b0e1410@linutronix.de>
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, 
 Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772610551; l=1941;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=lAm54urt5GeKbrhjyma6H2Eqz4yOWeFSr0NbX7+a7M8=;
 b=vKnzLJwiTGLossMMdtO2qf7gplf5mOJDMBQibefKfyvuPYaMi9b+gqFaCGXGXyYlvq2XHuYd+
 udeFTC0sjXUBWp7AIwh8IXBxRQmiYo8pDDgSjJjmpHs3cgPsp+ki3wf
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_074918_919823_E7ED8ACA 
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

After the adoption of the generic vDSO library this symbol does not exist.

The alignment invariant is now guaranteed by the generic code.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/vdso.h | 2 --
 arch/sparc/vdso/vdso2c.c      | 6 ------
 arch/sparc/vdso/vdso2c.h      | 4 ----
 3 files changed, 12 deletions(-)

diff --git a/arch/sparc/include/asm/vdso.h b/arch/sparc/include/asm/vdso.h
index 59e79d35cd73..f08562d10215 100644
--- a/arch/sparc/include/asm/vdso.h
+++ b/arch/sparc/include/asm/vdso.h
@@ -8,8 +8,6 @@
 struct vdso_image {
 	void *data;
 	unsigned long size;   /* Always a multiple of PAGE_SIZE */
-
-	long sym_vvar_start;  /* Negative offset to the vvar area */
 };
 
 #ifdef CONFIG_SPARC64
diff --git a/arch/sparc/vdso/vdso2c.c b/arch/sparc/vdso/vdso2c.c
index b97af5ec9f35..70b14a436fe2 100644
--- a/arch/sparc/vdso/vdso2c.c
+++ b/arch/sparc/vdso/vdso2c.c
@@ -58,18 +58,12 @@
 
 const char *outfilename;
 
-/* Symbols that we need in vdso2c. */
-enum {
-	sym_vvar_start,
-};
-
 struct vdso_sym {
 	const char *name;
 	int export;
 };
 
 struct vdso_sym required_syms[] = {
-	[sym_vvar_start] = {"vvar_start", 1},
 };
 
 __attribute__((format(printf, 1, 2))) __attribute__((noreturn))
diff --git a/arch/sparc/vdso/vdso2c.h b/arch/sparc/vdso/vdso2c.h
index 60d69acc748f..ba0794659eb5 100644
--- a/arch/sparc/vdso/vdso2c.h
+++ b/arch/sparc/vdso/vdso2c.h
@@ -104,10 +104,6 @@ static void BITSFUNC(go)(void *raw_addr, size_t raw_len,
 		}
 	}
 
-	/* Validate mapping addresses. */
-	if (syms[sym_vvar_start] % 8192)
-		fail("vvar_begin must be a multiple of 8192\n");
-
 	if (!name) {
 		fwrite(stripped_addr, stripped_len, 1, outfile);
 		return;

-- 
2.53.0


