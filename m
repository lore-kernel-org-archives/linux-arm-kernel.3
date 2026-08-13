Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96A0C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 17:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoUr+H27+L/TVykPAPX1fThxJpoZ/Q7OPCOqzzA9raI=; b=bpThWqDmkBhqwzy1Wz//T9psaC
	QjqewgjEmEsr/IIXk0wanNeIHDynKnVegmZj3/5Eog9/Ew3bw6hms3xA6JDpCKO8Xol4K91SsvK96
	AFOTeucprsLWeZFr+YcMXGUdffBbXYJC0Yl368zTs+hH3FXi6bpxxDLMIrrxERtBUMy0mjGLaeXs/
	F6G+w4hmJh/XiuEh+iZ8YygH6r4DzkJypTaeSf6wBtotvalgbqBLpfbDJ5+ucYzIb/hyP9CQvW3IW
	H8ebEwnqdXO8lks78L2kw6P0VqLM2qCoqggWHicFmtq0Crb4/PpVdXQhZJwSk50ozXPUW/YX32usL
	lgCsXuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYrZ-00000001ECS-26Kg;
	Thu, 13 Aug 2026 17:05:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuYrW-00000001EAB-44z6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 17:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786640700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RoUr+H27+L/TVykPAPX1fThxJpoZ/Q7OPCOqzzA9raI=;
	b=NaezAINWSosQ3UcIz55SSlk27BUa8IwYDkHOrEgY/3o74h6NVgBX3buoPhIKoH2/ZJZSCh
	+Q/iXx1Sb3eCKw9Q0ZEfPt63W4b0z4f5hxZZiWfrdZpk3boktvKQIOzljrMgYQwY8V00k1
	e/SXEb6Qo8QArU1/Ze6u63d64voQGKM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-118-IN5bJnN_OxCEbFxwlktk6Q-1; Thu,
 13 Aug 2026 13:04:55 -0400
X-MC-Unique: IN5bJnN_OxCEbFxwlktk6Q-1
X-Mimecast-MFC-AGG-ID: IN5bJnN_OxCEbFxwlktk6Q_1786640690
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 164D9195604C;
	Thu, 13 Aug 2026 17:04:49 +0000 (UTC)
Received: from wsxc.redhat.com (unknown [10.96.134.24])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 31DA8195608A;
	Thu, 13 Aug 2026 17:04:35 +0000 (UTC)
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
Subject: [PATCH 05/13] csky: pass all six syscall args to audit_syscall_entry()
Date: Thu, 13 Aug 2026 14:02:55 -0300
Message-ID: <0b18395deee1e30aaa53e4cc402f93e6e273a9ad.1786626275.git.rrobaina@redhat.com>
In-Reply-To: <cover.1786626275.git.rrobaina@redhat.com>
References: <cover.1786626275.git.rrobaina@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: H9Sf4YDhcS-RhGfY5TJiQK6kKzVqoDVYHFo9f3ol_U4_1786640690
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_100503_087575_68953235 
X-CRM114-Status: UNSURE (   9.29  )
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

Update the audit_syscall_entry() call to forward the 5th and 6th
syscall arguments (a4, a5) now that the audit core logs all six.

Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
---
 arch/csky/kernel/ptrace.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/csky/kernel/ptrace.c b/arch/csky/kernel/ptrace.c
index 6bb685a2646b..562eaf23be82 100644
--- a/arch/csky/kernel/ptrace.c
+++ b/arch/csky/kernel/ptrace.c
@@ -329,7 +329,8 @@ asmlinkage int syscall_trace_enter(struct pt_regs *regs)
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, syscall_get_nr(current, regs));
 
-	audit_syscall_entry(regs_syscallid(regs), regs->a0, regs->a1, regs->a2, regs->a3);
+	audit_syscall_entry(regs_syscallid(regs), regs->a0, regs->a1,
+			    regs->a2, regs->a3, regs->a4, regs->a5);
 	return 0;
 }
 
-- 
2.55.0


