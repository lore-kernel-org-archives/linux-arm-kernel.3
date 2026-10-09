Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C00CA9EC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 22:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHhOoeXiCbUjaUYRjNWTwcI9zO3PjvbPdsrI0WjZOFM=; b=II0MF/q0nBnjDteMkS8Nb+UYr7
	hApWikZ/uEW9q0himrKo370yNYyTb0G6hbUwMAn82tfR4ugE6q7QgHbMOiXIJB9w37NYdnvc+t04V
	Kj0kRtf5hqQRrk2aApJ4Z3bnNfOrpfHk4Q8SGraS+TPZyNQ5FDrhtlg0eMZ5ZDROiu4bOzN8t+cng
	IS9RmeAYRF2JgWeIzqu8f4qiT2gJEX+o42cYbYRt77/YtLb8Azirse+8P+KtkTPvPVtD38GK2tR03
	7/4YZ9dACLDki60sgaNCWYa2dCwzqJEoFGyreqpGvshtw/9dWPoLiWhLAX6JWYlEuMZ+p5hNKDBkI
	JJFIzEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyx-00000007HTi-2ZQP;
	Fri, 09 Oct 2026 22:22:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyw-00000007HSd-0jK0
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 09 Oct 2026 22:22:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GHhOoeXiCbUjaUYRjNWTwcI9zO3PjvbPdsrI0WjZOFM=; b=WCZQQeyGzJVLoCvom3V1YNmN95
	9YtXje6UnMoOb/j1sRN3DAsdoVEYVsbIeljAzC7t4p79ou8h0VYWipOJjFlYe97KTcJ67gggFh5iv
	q3jlyjernrrCZ9qYZrRYqSoG8F6abRyIzm2fmeUqNoYNTIVnuC+DGyVZplnL05LEqKLlCqXYL28P+
	3prna5Tl/4fhYe39kffo7FCRthWNfmj+JATQqVSbF+flWq/zRhVs14mKx3vIbITaH7I9z5lHMCDlm
	vqYw+03HrfHKbq/3Wa3eIqvSLIK5Gm+blXUoUfyLjUUcILxQ+C4mMo4cGfKoMSfcn/jgYJM0zAX/l
	0g7mRqbw==;
Received: from chamillionaire.breakpoint.cc ([2a0a:51c0:0:237:300::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFIyt-0000000BgOJ-0HNh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 22:22:24 +0000
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025; t=1791584523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GHhOoeXiCbUjaUYRjNWTwcI9zO3PjvbPdsrI0WjZOFM=;
	b=cO4eyyN5NADtlbUSNXMeVX84kVR/8HF2CVOtBbxZC28auVYP4TMWVunn6scEGFxmh9GJVb
	r8dUEmE99LxeZVHs2p6N57QlPiyir6CGKWpp0pLgyAPZXIvaGHqYZk9qONm7yB2dwDh6ho
	/dTe1Akl1sfImcX3irhDbvk7a3naCxGpbQ/4o5sJs+ETIFpfK5Y4g2qDunS0xWywyM45oP
	jwSiMSarL16XeVjEUE79taI9yyMQWe+jUp4AqYeXtkIcVxKNUMGdU849W7YcFPAtUzHn4B
	g3RLAicLb6Rm9VfBlkc+NcwA+OodQMJrTTYDW7RtbW9dNcHpS1Ms/+TmxwV3qg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025e; t=1791584523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GHhOoeXiCbUjaUYRjNWTwcI9zO3PjvbPdsrI0WjZOFM=;
	b=U1PqGC1gXV5f18ShVhK3ecJjGECGOje+dju7WhYUSJWqdpUnRQdkILTnKGcnhlSVz+B6fq
	WvouRjyoQyojGKDg==
To: linux-arm-kernel@lists.infradead.org
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 05/11] ARM: BUG: Move __bug_table creation to __BUG_ENTRY_GENERIC() macro
Date: Sat, 10 Oct 2026 00:21:12 +0200
Message-ID: <20261010-arm_warning-v1-5-ddf4be42ae0d@breakpoint.cc>
In-Reply-To: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
References: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_232223_379842_BEA7DE77 
X-CRM114-Status: GOOD (  12.25  )
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

Move the creation of the __bug_table section into a custom macro
__BUG_ENTRY_GENERIC() and make it depend on CONFIG_GENERIC_BUG.
This is preparatory work to make the creation of BUG-opcode and the
additional tables depend on CONFIG_GENERIC_BUG instead
CONFIG_DEBUG_BUGVERBOSE.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 arch/arm/include/asm/bug.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/bug.h b/arch/arm/include/asm/bug.h
index 18dc13a0509f6..172e6a84541cb 100644
--- a/arch/arm/include/asm/bug.h
+++ b/arch/arm/include/asm/bug.h
@@ -35,9 +35,8 @@
 	.word 2b;						\
 	.hword __line;						\
=20
-#define __BUG__LINE(__file, __line, __value)			\
-	1: ;							\
-	BUG_ENCODING();						\
+#ifdef CONFIG_GENERIC_BUG
+#define __BUG_ENTRY_GENERIC(__file, __line, __value)		\
 	.pushsection __bug_table,"aw";				\
 	.align 2;						\
 	.word 1b;						\
@@ -45,6 +44,15 @@
 	.hword 0;						\
 	.popsection;
=20
+#else
+#define __BUG_ENTRY_GENERIC(__file, __line, __value)
+#endif
+
+#define __BUG__LINE(__file, __line, __value)			\
+	1: ;							\
+	BUG_ENCODING();						\
+	__BUG_ENTRY_GENERIC(__file, __line, __value);
+
 /*
  * The extra indirection is to ensure that the __FILE__ string comes throu=
gh
  * OK. Many version of gcc do not support the asm %c parameter which would=
 be

--=20
2.55.0


