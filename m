Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97BCC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yZnTmXXPPJ43/SdX9l5xjKLxTpAA3+OeMalQ6WpsFjI=; b=f4IWT+j6H31tM7n81OxMImpX7h
	zUtVo3riD9EWOjHNs+BpqXdV4Fn6yz88878UzuZLl56I8rOc793CyODoOBrQwOl51GE8lFJdR2Tek
	vM9oA6sJZ49j6hFB8soWp3w44MY2JtXmCOFKhurN654WAedkI2LxgSR5EHH8l/uJqPOMjwOPDwx9N
	Cujix/D3m0xVvHcrps12KhUOONU+1BDCY6H2odwPwcI52JeUY5aFWtHJrrDaUBrxxD8gRHejnlVRk
	VghNvKff4xtKpgmNkT3G0EulG0zl1aJ0oFGMABIB4nhOJdYmJ/CM43SByAocw6thPTg6GyIVworRW
	ajF1gYkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKFh-000000038l5-2xDN;
	Fri, 09 May 2025 09:42:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIqc-00000002siv-3SGj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 08:12:48 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746778365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yZnTmXXPPJ43/SdX9l5xjKLxTpAA3+OeMalQ6WpsFjI=;
	b=ERcFm0/BEKXFR1FrPIyCwD8GdKDiCufdUM7t2JzMveVgQGBrg57Xw6Ovdgb4fiEVp857wa
	k3gZq7uNbBjMtK6b7sMHyw6Dc51XKAJF46h7EkjuWztwlErpe6uI16icJXn7rJFS1T/pvW
	3QRFn3YEWG8W2DwpU18FvEU84QJ8AeQlIXuUFttchkF9MXK19Om3j2/8RcJsZOXsPFMM92
	NL0GNBI/f032z7g7Q8rBV3QJVq5ku5ruLW0gnIt3LeX4jFaXJLP0R5Hw0PHWMvaVCQ363P
	xJ/CLZ7CVNNXJa2Meb/mBULDF4RS/Ejcxf1Ggjqj+tWwLCFyoNwPECVGnSIbrQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746778365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yZnTmXXPPJ43/SdX9l5xjKLxTpAA3+OeMalQ6WpsFjI=;
	b=+cYstsyfZZFfEwLc1Ompdly32t1bqmyEMxr6S8moOUP7Ibr3dr774sVtaonECzeQ6oe6fa
	br3hXiinqj5ZVdCA==
To: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de,
	Nam Cao <namcao@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 17/22] arm64: mm: Add page fault trace points
Date: Fri,  9 May 2025 10:12:16 +0200
Message-Id: <f891fe7b845d47aac4cbda8c8b562dc2eaffd86b.1746776116.git.namcao@linutronix.de>
In-Reply-To: <cover.1746776116.git.namcao@linutronix.de>
References: <cover.1746776116.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_011247_003514_076D1E58 
X-CRM114-Status: GOOD (  10.14  )
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

Add page fault trace points, which are useful to implement RV monitor which
watches page faults.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/mm/fault.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index ec0a337891dd..55094030e377 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -44,6 +44,9 @@
 #include <asm/tlbflush.h>
 #include <asm/traps.h>
=20
+#define CREATE_TRACE_POINTS
+#include <trace/events/exceptions.h>
+
 struct fault_info {
 	int	(*fn)(unsigned long far, unsigned long esr,
 		      struct pt_regs *regs);
@@ -559,6 +562,11 @@ static int __kprobes do_page_fault(unsigned long far, =
unsigned long esr,
 	if (kprobe_page_fault(regs, esr))
 		return 0;
=20
+	if (user_mode(regs))
+		trace_page_fault_user(addr, regs, esr);
+	else
+		trace_page_fault_kernel(addr, regs, esr);
+
 	/*
 	 * If we're in an interrupt or have no user context, we must not take
 	 * the fault.
--=20
2.39.5


