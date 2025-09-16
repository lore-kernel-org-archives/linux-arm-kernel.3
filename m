Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B26ACAC59B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 16:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=W1zu4x4fa5rvVrKhE+/ECo02MeVuSwO/q/d1on1UR7Q=; b=REhkdMOE/Pf6ok
	4iqE3vijHRo/Ld9af9nVvxkQX2jytx84hyPbAo+vZJyM9dlFRdCF04X9McYfbl4MzUT07uP6NrfDK
	lG2hvrgiOmfYsWPK8kH5eCQYJmtsy6xspOMJoKnQ4fz4dxmwocRNbno60zanMvdChXSDILmZmAkf7
	fZ3uJSpwio7M14kn9Zp7jph6sFoLV9cuGYXvQlWVR/FXa/uF5LqEpjaXLI29cnvnO4xegrdWbojq5
	v7pR6fSAqeLLfC/qbBVcMs+3P3Zf7rJC2GHeLRpvtcXPPi6nQWS15RazNCNGZfEajTKTcxVhhqbly
	4w30hVYziTcmBmO/SQlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYcU-00000008ThB-0wJO;
	Tue, 16 Sep 2025 16:33:30 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyYcM-00000008Tah-1EWO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 16:33:23 +0000
Message-ID: <20250916163252.354989948@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1758040400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=W1zu4x4fa5rvVrKhE+/ECo02MeVuSwO/q/d1on1UR7Q=;
	b=DrvgrNFTGKmj1+43NZd+59JIHNOiW1+82xk29dQVGLRESoUBR427aucz0yd06GAO3ZXTsJ
	eU1LF2RodVVnrqxgxb+ojC6o0Spr5OQPrmUX81VtyKrcjbcu3MvDyY6CET6AU1FiRnOjGQ
	gggVYH+wPfA6u4HcUJwelw7Nho73XXrTRQfLwWrdu8ySB6rlCfhk/3xQzq6qfedP2AmJqk
	qm6MzFyTfWdB9+/4pGAeP9hN5siip8u1dFcMwnFE3hWsK60oZLHpsB3xZzMr48q/Q3/mRm
	Cgdk0L33jkVzqfhm2CqTT8ELZcXFn8JmWRYqwzIBMiQJJKPIgCwiNsdavmz7Rw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1758040400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=W1zu4x4fa5rvVrKhE+/ECo02MeVuSwO/q/d1on1UR7Q=;
	b=DyLDMbzcLtTlwrEoG8vlXwT6jPbP+53jHDPa6qdnCJa8xkn/9bwrAuXgUVftBZAoFY0j+B
	f4sxKunptF6qF8BA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Nathan Chancellor <nathan@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 x86@kernel.org
Subject: [patch V2 6/6] select: Convert to scoped masked user access
References: <20250916163004.674341701@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Sep 2025 18:33:19 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_093322_484789_977C853E 
X-CRM114-Status: GOOD (  11.24  )
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

From: Thomas Gleixner <tglx@linutronix.de>

Replace the open coded implementation with the scoped masked user access
mechanism.

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org
---
 fs/select.c |   14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)
---
--- a/fs/select.c
+++ b/fs/select.c
@@ -776,18 +776,12 @@ static inline int get_sigset_argpack(str
 {
 	// the path is hot enough for overhead of copy_from_user() to matter
 	if (from) {
-		if (can_do_masked_user_access())
-			from = masked_user_access_begin(from);
-		else if (!user_read_access_begin(from, sizeof(*from)))
-			return -EFAULT;
-		unsafe_get_user(to->p, &from->p, Efault);
-		unsafe_get_user(to->size, &from->size, Efault);
-		user_read_access_end();
+		scoped_masked_user_rw_access(from, return -EFAULT, {
+			scoped_get_user(to->p, &from->p);
+			scoped_get_user(to->size, &from->size);
+		});
 	}
 	return 0;
-Efault:
-	user_read_access_end();
-	return -EFAULT;
 }
 
 SYSCALL_DEFINE6(pselect6, int, n, fd_set __user *, inp, fd_set __user *, outp,


