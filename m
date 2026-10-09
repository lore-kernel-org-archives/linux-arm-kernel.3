Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1572ECA9EBB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 22:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lfeL84iE/+CBuH3WTMxah8k0Y3jZf6XO4Z8+JTFy/TM=; b=LkCGPxiMjShY7ZA7BTa0kfXLsl
	tOdT2A3U3oFlbFDCZSJLgCj2vXbJj8KVPReqif12YzQ9mlmvwsUQqNkOwhlo0wc3s9JuBJLEVX3AF
	wZYDqr8XCmWyzzZFjuRuNxON2VTQfkFp5rQIHQ3R7A7OGbCYb8yBhuuns4ZubfmblA/rys4OntR56
	Gghxqzqokie9JgXl56v2UztGLR3wPivVZNdgmmZrUKNpJJ5Ri6R6JjNToNl7RkKqYNmlff6XBfkgD
	C77/DaCwK/u/PltIuaUplLgw+6RRN0FQUeZGaz7/eXCSScMfBb+mR43gokcydu4agnWWZNO4gPt69
	REybULcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyx-00000007HU6-3Q6V;
	Fri, 09 Oct 2026 22:22:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyw-00000007HSc-0ei2
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 22:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lfeL84iE/+CBuH3WTMxah8k0Y3jZf6XO4Z8+JTFy/TM=; b=dVLRsgiCrUot+eayBvV9ogyCMC
	wPXQpUlRyWUvaUYgsQeUUMnYUDihfZHBgwkMRXCq+Xu7nVFGhg+glYTlAlzhtLnCXK7158U8R6TKZ
	cUXxhT4ChgQfVSRWa2slslq1sZF9WeiHslA8NKPmDNrb4ksHobeVAyrC6TdfRrGMUM8dSE5fDmABN
	YkZy7Ic8y0FoSO2y8asO2wzMiP/qOAeteME7JrehacacQKF3KrhCJTRcO75IILqCjFykKnEq8FI65
	NehQKRDIAI4baBvhkAUq6qBZC2qMuXTzMb2c/D5SsbjsJprfsfnle/gOEcWvYhTf658L+8FrfIymM
	oDZt9xyg==;
Received: from chamillionaire.breakpoint.cc ([2a0a:51c0:0:237:300::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFIys-0000000BgOO-42rS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 22:22:24 +0000
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025; t=1791584524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lfeL84iE/+CBuH3WTMxah8k0Y3jZf6XO4Z8+JTFy/TM=;
	b=W94yyaEM+vNtp85T1qKdnhPPPLSN7BYCkDW+TKOYvJ9Ohfn1NhWvCVs88VNezOVEiSxl60
	75jAniOr1WhhUIJ8fzuC7m/x+e50bcVZwWSVMqyT9Z8pIBmg++r6ORsUeJLViyjub5HB+S
	VKrwK6fUgKFTsMEg5WVB3lNagvno2ytho2xUaH4OpyeL6ojY9CCFPqxiFr+Dndn0N6+rVG
	womdxSmBtzkrYFbt76r1r3IvSNqGzoNikBWd6miBWuTSnMwekc/hcVedtGWnxEPeaFbYDk
	04eoT+G0WqnwyocxjYVXDK+b3iM9fXrBXfxxO+9vDCBA8zJ5wkaj+8tljrDncw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025e; t=1791584524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lfeL84iE/+CBuH3WTMxah8k0Y3jZf6XO4Z8+JTFy/TM=;
	b=Oiv8nqVPi3Q1lI8wTBA0Mungf4zNU7UmDf+9ofkfybAqZcgT+pVbe6P74ZosX5YXOjSB0S
	TwKPALtF/AkcTfBQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 09/11] ARM: traps: Move the BUG handling from die() to do_undefinstr()
Date: Sat, 10 Oct 2026 00:21:16 +0200
Message-ID: <20261010-arm_warning-v1-9-ddf4be42ae0d@breakpoint.cc>
In-Reply-To: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
References: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_232223_365981_C6139F35 
X-CRM114-Status: GOOD (  15.09  )
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

The BUG() macro uses an opcode which is treated as an invalid opcode by
the ARM core. There is no dedicated handling for this. Instead, should
the core step onto an invalid opcode then the do_undefinstr() will
eventually end in die(). At this point, the kernel will crash and stop
invoking opcodes.

Move the BUG handling earlier to do_undefinstr() in the kernel block.
This allows a different handling if a BUG-entry is found.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 arch/arm/kernel/traps.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index afbd2ebe5c39d..1353bf24da53f 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -355,14 +355,10 @@ static void oops_end(unsigned long flags, struct pt_r=
egs *regs, int signr)
  */
 void die(const char *str, struct pt_regs *regs, int err)
 {
-	enum bug_trap_type bug_type =3D BUG_TRAP_TYPE_NONE;
-	unsigned long flags =3D oops_begin();
+	unsigned long flags;
 	int sig =3D SIGSEGV;
=20
-	if (!user_mode(regs))
-		bug_type =3D report_bug(regs->ARM_pc, regs);
-	if (bug_type !=3D BUG_TRAP_TYPE_NONE)
-		str =3D "Oops - BUG";
+	flags =3D oops_begin();
=20
 	if (__die(str, err, regs))
 		sig =3D 0;
@@ -442,6 +438,26 @@ int call_undef_hook(struct pt_regs *regs, unsigned int=
 instr)
 	return fn ? fn(regs, instr) : 1;
 }
=20
+static int handle_bug_opcode(unsigned int instr, struct pt_regs *regs)
+{
+	enum bug_trap_type bug_type;
+	unsigned long flags;
+	int sig =3D SIGSEGV;
+
+	if (instr !=3D BUG_INSTR_VALUE)
+		return 0;
+
+	bug_type =3D report_bug(regs->ARM_pc, regs);
+	if (bug_type =3D=3D BUG_TRAP_TYPE_NONE)
+		return 0;
+
+	flags =3D oops_begin();
+	if (__die("Oops - BUG", 0, regs))
+		sig =3D 0;
+	oops_end(flags, regs, sig);
+	return 1;
+}
+
 asmlinkage void do_undefinstr(struct pt_regs *regs)
 {
 	unsigned int instr;
@@ -461,6 +477,10 @@ asmlinkage void do_undefinstr(struct pt_regs *regs)
 		} else
 #endif
 			instr =3D __mem_to_opcode_arm(*(u32 *) pc);
+
+		if (handle_bug_opcode(instr, regs))
+			return;
+
 	} else if (thumb_mode(regs)) {
 		if (get_user(instr, (u16 __user *)pc))
 			goto die_sig;

--=20
2.55.0


