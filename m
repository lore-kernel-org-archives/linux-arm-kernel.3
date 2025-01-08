Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE50E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 09:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llMQUR+wwEgcNFKsWw7SwALRhRZ8Hk9MwBUMNVtb2mw=; b=GwbTP/mxGVPUtGbkz4jXbTO/Ks
	37aKpxXIYHHBvo/QjiwcjaG5RDa9x+CXMscEl3OXw9dyRIaEWP8Ue49KXBQLQRwQGQYnYbD9EvNK+
	6xthEMucxy6ejEtsWPxmFd+rm6y/o8mvUeqQAbhKZIk+r9piOOkYZoVGXrxhNCc5+VS9IPrgoPM0J
	wTC73X186XZLCgQAtZjmYwxk0oQIqZcpGj5yMUYnNPtz2cASjfE+k6ZrkSfSWRULeAGaNl6lJQVPb
	MhL8H72Kz6ElooEXNO++QnyzRhP9HF3X/FEh98K13Gpx70L4dy0vl4Fo8643vIEWQXn68udDzf82a
	lKcZuaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS1c-00000007g3m-2wUU;
	Wed, 08 Jan 2025 09:06:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS0Q-00000007fek-1HMS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 08 Jan 2025 09:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=llMQUR+wwEgcNFKsWw7SwALRhRZ8Hk9MwBUMNVtb2mw=; b=AVOJQIbRDTaJWZ1jpeOfNOgGuv
	lQeYLEnz91kLue9Tz39VE0ezlvDI+lsvUmk3LCYbxLw0CIzxYHS//jhjjqM6unDndDK/SNO8jf/q5
	lefr2qvIWhMbfgs6Yc8r9qeq0/nuNUJnAhnnHr817fh/QugbBj7NZKdW7zMU+3JKgt7Nwz+UNBLk8
	jCSDgFWpPftpSrJ1+I90VaRD8AqDuzsEvvf4Ye7/Q0rfGFxlWF45e/1abNDJrBpl0/EeUq338UXkf
	MaxBwKfVhrTd5+ttauewwtFCFkFwV9tnDFBJgq6rjPPgKiU7JGxgIOWBaP44ePx78Oac2qFvST/wy
	8AQQC+eA==;
Received: from galois.linutronix.de ([193.142.43.55])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVS0J-0000000ESa2-2e9Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 09:05:37 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736327120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=llMQUR+wwEgcNFKsWw7SwALRhRZ8Hk9MwBUMNVtb2mw=;
	b=aHWOD9UvZeeU8Ir7Qavbls53FEG2Xe8Gv1/qATtpio2CaQM5AhaNUBpylTtnLd4e5z5i3B
	HP/18AHWf0FN5MToKXBVSURD//SomAAqYKHnzWsfYGFSA58Zbo13m+Dk/Z6yezFdRxTBDG
	mNoalLKtcvXr6vKRycAQuaJY5FkU29U4phi4/tqu9jgwSc0aYAN2GOopOPUJT6GbBbceaE
	RL/NRUfSDZtGLNyQUvf3qiE6BGvhaW0wpOE0Xb46rnxRZjtsGbf4V0c2bWQpKZvUjmxR4+
	jBZma0KTgNcHf2OSfxJZEBO606z1g588NXeCsjuL9+duzhcrcuZjowT8eas25Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736327120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=llMQUR+wwEgcNFKsWw7SwALRhRZ8Hk9MwBUMNVtb2mw=;
	b=03lSaS47ru0spuAwkaF2+tUNIqOm2UkglqnqHkgXkSl+watQnRd0jZv1xntHJBYnM8rGBe
	ckU7+LKwwcQXw9CQ==
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
Subject: [PATCH v3 16/28] ARM: module: Use RCU in all users of __module_text_address().
Date: Wed,  8 Jan 2025 10:04:45 +0100
Message-ID: <20250108090457.512198-17-bigeasy@linutronix.de>
In-Reply-To: <20250108090457.512198-1-bigeasy@linutronix.de>
References: <20250108090457.512198-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_090531_957739_46F6B30E 
X-CRM114-Status: UNSURE (   9.23  )
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
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
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
2.47.1


