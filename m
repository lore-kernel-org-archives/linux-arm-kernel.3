Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48579CA9EBB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 22:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vAjgS54JWtJTwGoOkT2INhrSwoTolZUyU+qx4a1V+E=; b=mEGT3l9xtaMjZRAVrlsjwLQkXZ
	I12CFD6TXuadtuWece5RyYZZCjOtcuer75sn0RxVeo1ongp5384i4GCcdO6aPuEXLiTXtUzBFhu2N
	3UtzOIeHqljQBERFFGG+R7g+Oi/CPIEFRtiyujuZDx1VPnyBPFb+1oqfwgUWoYr4c0ynaHytKjyBw
	gNAW3U79NnqScEq71q3Q4UbBBBHnry9gwviOHFkoCoARpeGYVuW99+kk0gAU1zjeTktE3Sd2qM4aj
	PGaoZlCzWrNNP/15rvATwFx11xb9X/T2g4hak6/O3n1jZkGSQmmQQcP0MOwu8VDp/KvllY8r4gun3
	Ico7YZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIz3-00000007HZT-0xwI;
	Fri, 09 Oct 2026 22:22:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyx-00000007HTF-2BM7
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 22:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1vAjgS54JWtJTwGoOkT2INhrSwoTolZUyU+qx4a1V+E=; b=PvHNz+wapduaunACxNfgiBuKFv
	Rq/wMdBMPptPMARUN+7mzlDmao5ehAEvAqSE2yGFMyqKf3PIbdgAzWYiqkdip2c5Pnqs2WCH3nl7u
	C6NVRILzJFhtdcj7RTQGu4zf8cF+HGn4ylog00p8tMGtCCke+j2JlTf95lyEzAoibIV698WnviBg8
	UTXFzGOIg2DQCzZlyPTBjeZqeUfQQydsXx3aO8IEbd9SRqq/eO5OVN9Z3seSjViJSVoW67BhahKBp
	fFe1sfASeDYPNguMOmAJLr0jGkcgJ5HBXlv8jak0Kjt6RQKe6EeI1XKs9CWG4CiH9xnXLwcaiAnDV
	LHaH44AA==;
Received: from chamillionaire.breakpoint.cc ([91.216.245.30])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFIyt-0000000BgOP-1ZVO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 22:22:26 +0000
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025; t=1791584524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vAjgS54JWtJTwGoOkT2INhrSwoTolZUyU+qx4a1V+E=;
	b=gORNQpLPyhhkhiXAptT8fxSl1YCmQbfcWBWrSZ5SZb5CR4Mh/UH0E0tvEljS9hUXC2ucbv
	uu5ZBlpu85UMwCH7RCdwF5Lqk2Q3OjcPJ5lYAUSX0yyqgfl3fIvC8AYxTYta7talAEN1Lv
	4bLZSJsVLyRz9PBjrI4P0sRLT8JY7iVcxn/kksxUFMzSL4FkGPgSNB0QEpSGCbSimZxdSU
	FAny2Lpii4XsJLnwC/DJ7xKMYpPiUEbAurnRzjle8b+M2E31CITMBmBivfkydJdIoWWq+4
	nGh2NKxTWXn09k7ILrDWaVgUSFvPvkH4zAVvukbI08YnJr+DSQpIAJUaW6V9ng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025e; t=1791584524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1vAjgS54JWtJTwGoOkT2INhrSwoTolZUyU+qx4a1V+E=;
	b=NctvPWI0PjIioxmUYqYxbor1DXIKiB+c+59qxdQyEcbCSwMUpqmV10EBDMxLXECw7X5Ads
	8cyT6t3DYpdhWfAA==
To: linux-arm-kernel@lists.infradead.org
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 10/11] ARM: traps: Add handling for warnings to handle_bug_opcode()
Date: Sat, 10 Oct 2026 00:21:17 +0200
Message-ID: <20261010-arm_warning-v1-10-ddf4be42ae0d@breakpoint.cc>
In-Reply-To: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
References: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_232223_520902_3A6079E0 
X-CRM114-Status: GOOD (  12.65  )
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

Should a WARNing be encoded with a BUG opcode then it is needed to
forwarded the PC so the CPU can continue after the invalid opcode.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 arch/arm/kernel/traps.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index 1353bf24da53f..12833307f9064 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -451,6 +451,14 @@ static int handle_bug_opcode(unsigned int instr, struc=
t pt_regs *regs)
 	if (bug_type =3D=3D BUG_TRAP_TYPE_NONE)
 		return 0;
=20
+	if (bug_type =3D=3D BUG_TRAP_TYPE_WARN) {
+		if (IS_ENABLED(CONFIG_THUMB2_KERNEL))
+			regs->ARM_pc +=3D 2;
+		else
+			regs->ARM_pc +=3D 4;
+		return 1;
+	}
+
 	flags =3D oops_begin();
 	if (__die("Oops - BUG", 0, regs))
 		sig =3D 0;

--=20
2.55.0


