Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA19CC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 12:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+UQEszhhyx5orvv0upRMEVuQLmNZT576sheEcGpELI=; b=GbMLh2Wgt2WchmFHv7WXVlzJBW
	4K7TIqwEXUOqRUhkjBvPiCBvUncUW/CiH18o2nR6KQUSIm8r4iuoqSqXGm8YLA9fbkEzXcXCcA+ca
	NRDpvhNg4YGbDTMdhqBp04y2RFJiEeqc7gc7XnpkC8nniM82Cz73/xeA91Laqbq6DHyOd06Do9QR/
	nTGJRTO5gkLUXIR40V0ahhW8yEkBZtLiGSmJ8tHt0lC1+KRkpaxSBAQQWfKD98XSMsTeWWtew+h9T
	6/oIx7A5w2GIjon9C+HhGMHSCk04Zua3mS7wp5KtB4YAotgztydMWRJtJ2R1B5aywkFvybjWYi1nB
	69jlkF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jiM-00000009bcC-33xG;
	Tue, 29 Apr 2025 12:05:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jeZ-00000009ayu-3zmE
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Apr 2025 12:01:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=X+UQEszhhyx5orvv0upRMEVuQLmNZT576sheEcGpELI=; b=FuFN9ZImazHZM11lNzr6VnpkLr
	M2pLC8tDuvrs27QwhGWDClz1or6LDnVl4tNTQU5Zve4bPwQ2Tt38OgfHa3NVCuELc8cLUttIwxFj+
	JxQmOcOVvIVfEEP8w13ZV5/Mm41v48hMd34kr4xVS32MzFMx7YnxfKgp4XJ/0Q+HAKfEy4v7luNW7
	rFHMLC/sleJrzODesz43tUKLTCYDXbrC2DLpPwpPDVs1DKnBBeKukgzmjqyepiTV1Eny2o3vXlwC7
	H4Acs9YswlWbmwxN83ExHlLFZcNo+xKlXoEXWLvh3YKa5Hcyild7SnD8uIHd7yLsSXkI5ZinnKIWG
	0rqZsoOg==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9jeX-0000000DIzw-0uas
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 12:01:34 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745928092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+UQEszhhyx5orvv0upRMEVuQLmNZT576sheEcGpELI=;
	b=QHhQ6j3XQ35uW8lM33Iri+d2d7ashP9AZfInkXLmBkcmolpxLsgshSSRdu0sjmu4D2n1bA
	DsLANVQw3M6JA3uTBLT5VuTJMgBvuJTB+rI5u8oPBNxqejbuRSNSuTIl58R3FYosL0Za1Z
	XSS/CB3sxRcLNdxjTjn1wkLI0Hlt5w1i+mga8fdj3oCt+mux9e8mOU6jfdfltz0van4cOc
	oUaEtxiwEdB/Ss5cLOapl+wCXGyg6ImemEsA13KGsmGWR/z/nLEj7D0+9UdSZjvKl7okJK
	ncZmTw7kziulvaIkgiHpScerBaVZtWkFKW5BrIXFnT2kQxscWdfNX+rhSnorzA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745928092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+UQEszhhyx5orvv0upRMEVuQLmNZT576sheEcGpELI=;
	b=Pc1ZqgS7RXqWFqgNkCZldc3Fl/mcM1w++M4/HQGbduyBb4aLMt8nkfS5VPJ+/UBolG7beC
	gXeTGFsWu+D32oDA==
To: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de,
	Nam Cao <namcao@linutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 17/23] arm64: mm: Add page fault trace points
Date: Tue, 29 Apr 2025 14:01:02 +0200
Message-Id: <554038c996662282df8a9d0482ef06f8d44fccc5.1745926331.git.namcao@linutronix.de>
In-Reply-To: <cover.1745926331.git.namcao@linutronix.de>
References: <cover.1745926331.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_130133_367461_BC1576B3 
X-CRM114-Status: UNSURE (   9.71  )
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
index ef63651099a9..e3f096b0dffd 100644
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


