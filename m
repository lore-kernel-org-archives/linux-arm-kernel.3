Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386EAC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 19:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCkLKZy59p7aSSwyfXTPaoOl48Jr0ljTw2NZSx5GJk8=; b=SAs8eVFiPaUOF6l2MNLi4cnsVt
	cYya/oUZM4QeBGEiVk5Zel5HhWQZQDhECzbJ7V6hI5sZhfr4UVNSKLin9QwaKXMPpT8/scH5tTfRf
	SMtbvM0Wzp9XacwjtoG/ngF+25BQeyXWnp7KBBaPN0qHME5QX96hzsZsghh0kvQ9oOubeJEjWZe6m
	N39lTdqlXRboIIGCFxjgr0aoeO0ba0i5xC0qmZNxZlKYkL/al05FWIx6FH/arOXlSzAoTbKF32UYi
	2nbXApSL4zA6hsw2LFiUWQrfm3QQGqrs4YglR65q2fEn5S8ItZ8ISFysrWzxBzk4rL8oiYlOjcSt9
	4egwbwrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x966C-00000006Oaq-3USw;
	Tue, 22 Sep 2026 19:24:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x966A-00000006OZg-2J98
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 19:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790105053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BCkLKZy59p7aSSwyfXTPaoOl48Jr0ljTw2NZSx5GJk8=;
	b=VbDuAbtHA3EXWnZA2HJv7Sw0wHC4bAdpPz5x1GbKmk/JeRYm0XYwoNz1C1epLnwNw4yTnb
	vqLAmqvMllORJkF5Puf5S34VN/mX7Knx7/TWcDcW1x52M7ssdqP7u0v5oUJxxflgSj7n8/
	XlXhbU/4TAHAOTCrTm1c2sL1fMuUjCQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-442-IW0o-oMYNpOyqGDeiDJV9Q-1; Tue,
 22 Sep 2026 15:24:06 -0400
X-MC-Unique: IW0o-oMYNpOyqGDeiDJV9Q-1
X-Mimecast-MFC-AGG-ID: IW0o-oMYNpOyqGDeiDJV9Q_1790105041
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1BC1E1956050;
	Tue, 22 Sep 2026 19:24:01 +0000 (UTC)
Received: from wsxc.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CA19B30001B9;
	Tue, 22 Sep 2026 19:23:47 +0000 (UTC)
From: Ricardo Robaina <rrobaina@redhat.com>
To: audit@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	bpf@vger.kernel.org
Cc: paul@paul-moore.com,
	eparis@redhat.com,
	sgrubb@redhat.com,
	oleg@redhat.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	linmag7@gmail.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	guoren@kernel.org,
	monstr@monstr.eu,
	tsbogend@alpha.franken.de,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	davem@davemloft.net,
	andreas@gaisler.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	tglx@kernel.org,
	peterz@infradead.org,
	luto@kernel.org,
	Ricardo Robaina <rrobaina@redhat.com>
Subject: [PATCH v3 09/14] parisc: pass pt_regs to audit_syscall_entry()
Date: Tue, 22 Sep 2026 16:20:01 -0300
Message-ID: <385724169e030185dc9e0deefb52457ba5581090.1790088067.git.rrobaina@redhat.com>
In-Reply-To: <cover.1790088067.git.rrobaina@redhat.com>
References: <cover.1790088067.git.rrobaina@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: moGsaBsHjamI4tcKrz56uWww6rVSTEwJuN2n3vsgUTY_1790105041
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_122414_657832_C5E189F5 
X-CRM114-Status: GOOD (  11.59  )
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

audit_syscall_entry() now takes a pointer to pt_regs and extracts
the syscall arguments itself via syscall_get_arguments(). Drop the
individual argument registers from the call and pass regs instead.

Per-argument compat masking is now handled in syscall_get_arguments()
(see the preceding patch), so it is dropped here; the syscall number
still needs masking for compat tasks and is left in place.

Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
---
 arch/parisc/kernel/ptrace.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/parisc/kernel/ptrace.c b/arch/parisc/kernel/ptrace.c
index 1d9e210702e1..4e62d6bd6466 100644
--- a/arch/parisc/kernel/ptrace.c
+++ b/arch/parisc/kernel/ptrace.c
@@ -359,15 +359,10 @@ long do_syscall_trace_enter(struct pt_regs *regs)
 
 #ifdef CONFIG_64BIT
 	if (!is_compat_task())
-		audit_syscall_entry(regs->gr[20], regs->gr[26], regs->gr[25],
-				    regs->gr[24], regs->gr[23]);
+		audit_syscall_entry_regs(regs->gr[20], regs);
 	else
 #endif
-		audit_syscall_entry(regs->gr[20] & 0xffffffff,
-			regs->gr[26] & 0xffffffff,
-			regs->gr[25] & 0xffffffff,
-			regs->gr[24] & 0xffffffff,
-			regs->gr[23] & 0xffffffff);
+		audit_syscall_entry_regs(regs->gr[20] & 0xffffffff, regs);
 
 	/*
 	 * Sign extend the syscall number to 64bit since it may have been
-- 
2.55.0


