Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D95F1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGYN4ff5lKOeQEcqe/g4bGLpQfsoz5UlJMjakVJzeFk=; b=PV9Orb5g4dsDdbLH3RjBiaoyMY
	o5v+KcIZ9a5O7pNwuPOioiy0h3rnaXZpkeHFip831wgzhCyOjNmSc5ZFuWfInUCFadtQozWXUAPQg
	3hsnTz41mCHZHX0dSiBz9LaZe27h4DxLZbzcn2AY+tl1hHLBbD1IidRLSwF0Jyub00BhiGZO7KULK
	2nWV5IkJBk21APZ8m6NbAAunY2660vpfe9Az7o+aNity6aR9eAQGWsYga0TnAVfQg6iwlvKtTaAqx
	N5tlawL9UQPdwzV3+EVoT9dImxOiHcQNTDQ2yGbSnIWzHrOWEnH3MaUMmlYfsj/cbjNaWVrAIAcE6
	IpuRCC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhCY-00000005i7z-1ZDG;
	Fri, 20 Dec 2024 17:54:14 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOh6F-00000005gf9-25Ac
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 17:47:45 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734716862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hGYN4ff5lKOeQEcqe/g4bGLpQfsoz5UlJMjakVJzeFk=;
	b=uwZHwo6eNmwA7kya9O3GI4iA8IAlCQOOukqHJWYAa6K+3KfgKuyLtLRUdLGbgYLGanUzaG
	aiphp82LdodS2mLsk2Qd9S8NkKkNc7zYbJQWSAoDC79FCQ2TVVIRV5OIttrftP1FBeqZDa
	6IUXwn4Hb6xFgFf/8go5mtCepamkeQx9TkDntwXDQgKAulbhkUkQj3PXHkwwmZ9Hf0u67Z
	0g/xa6CTwr9llsRQB6nMxgDy1/HIdMpza0zROTWUw/FMPRUVc2tXhUr3RJwqFESFfyylVI
	5HgNyGrnKikqy/1+dKob9mxnWUMaNYGcI3Jh5VIV5If1VteNtKXQEs4KOjZG0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734716862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hGYN4ff5lKOeQEcqe/g4bGLpQfsoz5UlJMjakVJzeFk=;
	b=n2Rwu/VTOnU8F7k6F/wKH79A9noqoGu1s3Du9ttx9cs1WIJBbPRrLJWHfLUsFdg8QywFjQ
	nb1x3jg1ZWpWT5Ag==
To: linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Gomez <da.gomez@samsung.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 16/28] ARM: module: Use RCU in all users of __module_text_address().
Date: Fri, 20 Dec 2024 18:41:30 +0100
Message-ID: <20241220174731.514432-17-bigeasy@linutronix.de>
In-Reply-To: <20241220174731.514432-1-bigeasy@linutronix.de>
References: <20241220174731.514432-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_094743_674733_20F00574 
X-CRM114-Status: UNSURE (   8.71  )
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

__module_text_address() can be invoked within a RCU section, there is no
requirement to have preemption disabled.

Replace the preempt_disable() section around __module_text_address()
with RCU.

Cc: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm/kernel/module-plts.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm/kernel/module-plts.c b/arch/arm/kernel/module-plts.c
index da2ee8d6ef1a7..354ce16d83cb5 100644
--- a/arch/arm/kernel/module-plts.c
+++ b/arch/arm/kernel/module-plts.c
@@ -285,11 +285,9 @@ bool in_module_plt(unsigned long loc)
 	struct module *mod;
 	bool ret;
=20
-	preempt_disable();
+	guard(rcu)();
 	mod =3D __module_text_address(loc);
 	ret =3D mod && (loc - (u32)mod->arch.core.plt_ent < mod->arch.core.plt_co=
unt * PLT_ENT_SIZE ||
 		      loc - (u32)mod->arch.init.plt_ent < mod->arch.init.plt_count * PLT=
_ENT_SIZE);
-	preempt_enable();
-
 	return ret;
 }
--=20
2.45.2


