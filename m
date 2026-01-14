Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA34D31A23
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SoyAobvtAA9UQIKcVjt4/vpR3BEv5id0iFKUdJTluTk=; b=VxHihlxLInWMyTmWv7XssV3+9F
	HiSvfqyjB9pfpv9o82pqPcP+QKsRdwM8AWCLEBEVoU4BWVMDOGLaYDtDxJnBFCbW5n9w4eysr54Z/
	8rn4vIpl682YuD1gkBfztXTt2k/NSgasn5kkd7tOZiavDb8teBLsBLG1gjnZSvW4coe40/kg9Nbrp
	Hj6IjJu2jYyxbTILWdLnilHbitUryVa09Uflliaw6Fy1OhXuUUghR9jE5nfMMjXjFXS/cmEHi46hX
	TNzNlAM1KPRljvJjucPaDonGIJzslorL+IE1j0szZN3RqRyKUTdMbcoGizFlrlHJ6NyWEyWkzw0wx
	xDtMFWvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvpE-00000008FSQ-0Ss7;
	Wed, 14 Jan 2026 08:01:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvp6-00000008FK0-35tR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:01:50 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoyAobvtAA9UQIKcVjt4/vpR3BEv5id0iFKUdJTluTk=;
	b=kFqoqabHpDV3T9wPA9bmEv8kDqQYgyBf/ZZfxqDBpt+1iIEV/ozQJr3tRvH2CdmuUPEtmn
	OVZtQ50rFQDY8XWV0AjmFsYSPR6iwKjL19NrTeS1RvFEyJh6cQiGgiM7bZTE5Frq9LMdny
	Jq7q7MzaEsO/BHoFqPtjbFPhh89yzhV5ybYXZyHy8xlNG9OAUT3biLb1AppNWp+bNg/N3V
	Acvvvd3BW2iv7bb+kbuY7/lT1aQwwpCGoI5OgbxXScoV5Rp4sC8FQkvUxeSx1Nc9NnX74A
	k4j7Ae+6q126t8Yqf1PKJ3fWPB2BBYH8w9b49fiT3ilHr1YzbD2cqHIWJFVbgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SoyAobvtAA9UQIKcVjt4/vpR3BEv5id0iFKUdJTluTk=;
	b=uZ3P/KnyGuUf0Nz8DcxWhm7MR3FURfwdGnxivNhb+GuDV1TNbVTSIOATNT/FHtFN44972t
	YczMt0bOwRA1ATAQ==
Date: Wed, 14 Jan 2026 09:01:40 +0100
Subject: [PATCH 08/15] MIPS: vdso: Explicitly include asm/vdso/vdso.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-8-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=696;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=89K8mUiVvMvCZCKWls9fZ44jvFGy0m8pQ8qbm4twTa8=;
 b=FSiu8UiGSl/Aaf2eVHxCWSFtrEdYyGw5+eoDFFvTdy8XTx/6gLGZt62GT7CmMMb0UEm6+GLmY
 7hN9XerTfMXCXKMzaGcSXECibAYr028LLgbUS0JbuJ5Xbboxu6aqhEx
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_000148_917474_853E8FBC 
X-CRM114-Status: UNSURE (   7.97  )
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

The usage of __VDSO_PAGES requires asm/vdso/vdso.h. Currently this header
is included transitively, but that transitive inclusion is about to go
away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/kernel/vdso.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index de096777172f..2fa4df3e46e4 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -21,6 +21,7 @@
 #include <asm/mips-cps.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
 

-- 
2.52.0


