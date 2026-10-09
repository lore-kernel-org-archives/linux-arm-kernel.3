Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AF6CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 22:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j0A+67eyowptW5OGtgzBH8AToqpHa5EOXuvjZ4sJXXM=; b=YzQquTrSK82PxZAM6vyx+VwGNP
	ASldJTRTB1P/WeAmOl0G+hnWJazK9bALf3B22S/mPI8EtpyWkR7NrfvaW6vUZkjAODFT+5H1gdG85
	dwKufu6Sxx0n8DORa11vbZ5K5xY4+vqRGBDfcmIVGjjnBbjpD3Rc//nfdezI1KyKplMKToOAy0D5D
	v8Jy1BwVvl1z1EM5C7IbbHh9l/OEeOs0+XVQxXB2Gw8XxB8CprL+MHgiumjn7HFD0j1/ZNrrSoYB3
	jXGmWigecGIpn5xYp1EfBCY5cGUcWQm+Dru2kOLRrRD7U3Jd+Kkf3vHnuqm61vC4lGIepJTlMe0Jb
	hvJUolYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIz3-00000007HZ6-0Kpi;
	Fri, 09 Oct 2026 22:22:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyx-00000007HTE-27gT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 22:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=j0A+67eyowptW5OGtgzBH8AToqpHa5EOXuvjZ4sJXXM=; b=EobTsTqFCLhlrV8jAZL0qsdfKW
	zJS/HZDm8VvVDaTT0J34BjV3YhKKE0h+Xnpce4vYxIZP1PEzEzcWwcNshkE2jiSIOOVx4XScLi1uo
	M4pfgDK79mwncWGnXxsWANvnVMMD3LEarXgYN2rb6m+pongattR4u6TtPbtTjVZRsFOnzKF0ciOc6
	AkdEa2V8Oa98+qXvHbbUUoxVd66+vQ57SDCaM3QDGY7btVadtH09LGm95HOqdaViIEejiFCvVefep
	1CUWjYqsRlrxr+MGfvQhze1gP5EpwsziVC9BpVNC8egjvp681uGKloF+WoGSOfxO+p7VRZ+UXE8XJ
	rPPdeUzQ==;
Received: from chamillionaire.breakpoint.cc ([2a0a:51c0:0:237:300::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFIyt-0000000BgOI-02Xp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 22:22:26 +0000
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025; t=1791584523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j0A+67eyowptW5OGtgzBH8AToqpHa5EOXuvjZ4sJXXM=;
	b=HTYgnby4D0zs9J1xVffz+/DS8eZGFGSkvumleRD9lAoPdf0GeC4Ex4USvdrDJGu1qUnyf5
	i1QoozwAW0F9Agix9+vuQcfoHSLK3AKPcESuyctk3RfR2SeNL/pxxscGrOW3W02PrcN5HV
	IsR94Ell5k3SYWxMPeQOxkNNqdUu+CpeIgGAAvnL2y09q35pYsT+iClOFiuM6/QdPM5vg9
	itgnr4UsNGLdTCqbBUPbkVTAOSVpOGqweBDMgXHRkBqn4fnIU32/7dMkKgM7zC99kNr6h6
	aerxfJpKrYFvm1TCQMNgMRdIOR2yS6LRTAfZXpg3ymHcBqPVVjc34iWboHeRcw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025e; t=1791584523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j0A+67eyowptW5OGtgzBH8AToqpHa5EOXuvjZ4sJXXM=;
	b=eWiQGJG22XhPmp2bnEBRQR2zvA8wQXq2v+BCDofol0Ehme5nd5tTEOKhBh+Ptiv3EKjbLK
	+q79781MCjQS+CBw==
To: linux-arm-kernel@lists.infradead.org
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 03/11] ARM: BUG: Move the section right after the opcode
Date: Sat, 10 Oct 2026 00:21:10 +0200
Message-ID: <20261010-arm_warning-v1-3-ddf4be42ae0d@breakpoint.cc>
In-Reply-To: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
References: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_232223_407608_5FFCDCAE 
X-CRM114-Status: GOOD (  11.92  )
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

Move the references to the opcode right after the opcode. This requires
to push the section __bug_table first and keep it open. The .rodata.str
section will nest into it but this is not a problem.
This simplifies the splitting later on.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 arch/arm/include/asm/bug.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/bug.h b/arch/arm/include/asm/bug.h
index 4c01e360ccfe0..1bb215367eed2 100644
--- a/arch/arm/include/asm/bug.h
+++ b/arch/arm/include/asm/bug.h
@@ -30,13 +30,13 @@
 #define __BUG__LINE(__file, __line, __value)			\
 	1: ;							\
 	BUG_ENCODING();						\
+	.pushsection __bug_table,"aw";				\
+	.align 2;						\
+	.word 1b;						\
 	.pushsection .rodata.str, "aMS", %progbits, 1;		\
 	2: .asciz  __file;					\
 	.popsection;						\
-	.pushsection __bug_table,"aw";				\
-	.align 2;						\
 	3:							\
-	.word 1b;						\
 	.word 2b;						\
 	.hword __line;						\
 	.hword 0;						\

--=20
2.55.0


