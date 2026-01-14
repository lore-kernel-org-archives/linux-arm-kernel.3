Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E762D31A25
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2g3QVbHrWMxbltOpJFbYJDEOEW8Rpv5rFE4qRg3bpXo=; b=VCJuEO7ZbJQhoOXFiEqLWzxGTz
	NLqeZFEuPpUvtSp24DqOO7ZomSd1Lr9S408zwaJ8rULonu7A+rP+D1+0VFPcloW1mdG8s03Vo/kV/
	WPN9FhRWvGZwhzDECUj9zk7+taKFsYk+NZ2TllhEOdNXw2HM9zNpsi2P5HVK82+1OKq3Dvc9D4OYz
	doxPVNuUd8Qtd2OEiTCw/2Y+Sz+VlSH6GPgqTtrbBW45H3EJbOcfX9NfFoSG18TuNMVnpbwpPqHra
	fRKlGZbbIK0QV2P+U96dPIqeduDows8EXVtenNioIDQ+Sj1lPU9HQcJaNdlBmJDnU/oHZcffOpr1P
	uVdTgubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvpF-00000008FUQ-3x3h;
	Wed, 14 Jan 2026 08:01:57 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvp7-00000008FKK-2DGC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:01:51 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2g3QVbHrWMxbltOpJFbYJDEOEW8Rpv5rFE4qRg3bpXo=;
	b=pJFUzWW05k5+SSg3f6116KzG9PtFSdPOXjYr/Y7ZNCV3dg2pqVk0Kh5F+WEGurOMxEvGLE
	e8WYlK46AjuQ1yAo4BHqfJ7OBebZp9MdZHX/jDMy6KeCFNsxRRgpaPLB5+rXbS+BVb9BbV
	MdHbtBPXSJK6/lrYeASQ+abCoQtNAKK3tHtoIvyNXqHLJIhPgkdoxHW7gsd6MbPwBPk7/I
	A9/vclGzyQH7p0C7So8wjn6VhQZDZQSlkSeHaDhxa3PVylvsORCST058MJx0LkJiKLlUSx
	jXp/no7CybdXDtdCD4+m5u6u7nyLj+SYsl4j4+SUUX/anoXGPOcxt9lfEZaYGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2g3QVbHrWMxbltOpJFbYJDEOEW8Rpv5rFE4qRg3bpXo=;
	b=zIgedRcNd3q11NN2zkOnafQCoSRyD8+2dkrpNSIdUlN8QrHNXHEcE4bTlFmXGrUE5jATc9
	9KB/8Yf/M60VhQBQ==
Date: Wed, 14 Jan 2026 09:01:41 +0100
Subject: [PATCH 09/15] random: vDSO: Add explicit includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-9-803b80ee97b4@linutronix.de>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
In-Reply-To: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=796;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Ko7rOXN2f5vKh19n3ut994p4BW56m9dv4kY+PIvm7Yk=;
 b=PbIRfpWFNk9BAu4/xZnM8LVqwnYh83cMAfcRW7ldaxC8YUzNBltZ6iiaNDxvKbJrUjBSDRKG8
 VF9TendS0JWAdSkvD00Kqbs3zGzzNt5ZkyIFAgLOrROICTue30rPSrW
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_000149_707693_01C0ADE0 
X-CRM114-Status: UNSURE (   7.63  )
X-CRM114-Notice: Please train this message.
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

Various used symbols are only visible through transitive includes.
These transitive includes are about to go away.

Explicitly include the necessary headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/getrandom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 440f8a6203a6..7e29005aa208 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -7,8 +7,11 @@
 #include <linux/minmax.h>
 #include <vdso/datapage.h>
 #include <vdso/getrandom.h>
+#include <vdso/limits.h>
 #include <vdso/unaligned.h>
+#include <asm/barrier.h>
 #include <asm/vdso/getrandom.h>
+#include <uapi/linux/errno.h>
 #include <uapi/linux/mman.h>
 #include <uapi/linux/random.h>
 

-- 
2.52.0


