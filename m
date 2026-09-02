Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91DDC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 14:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIvLvNjfFpHlzvcj5ekjg7l2b7htCeRUTqEEz8CXAmk=; b=Q0VNgOKCLRISDw8lbXWpVoWuPJ
	MzAeOfeOQAAxFONVt+0RRHLh5ZP5cQfbX44KdSGyZui2pWB4W/L8uGfAmARkWMk9czIq0A2mYoIjM
	w9FEjfNseI74EPtWbm0I2zw+I3dsNBMMcamxGI/vNUnKGdVs+wiuj1JI1r7PY7NuLC95PlbRn7tYj
	PrgQIT0iBpVkZDeV0QhDMJ6VhgLZIxNOyefkifEiHC+hQIQHxb6pp2u4u+mhVC1AiVpRhTxeviafV
	p3+9fVhYu2fHTIO9j/P8vBB/X+GOALfPF0Iw/efRLhG/5KwOOX8SqRqasBE95pgjbnC1dvm7Yq1YJ
	cRHUgZ/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mD4-0000000EzFf-0EWO;
	Wed, 02 Sep 2026 14:45:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1mD1-0000000EzDM-1NVq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 14:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788360302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bIvLvNjfFpHlzvcj5ekjg7l2b7htCeRUTqEEz8CXAmk=;
	b=UbaIPE4BplAxL0KZDXBBIQ4UUxtaIZ+EpT5J8vGD1A4ojRmP5MPrYUnSzCQPRCFYgSmJGw
	nE4j8Vi8wmRBjTFlsoIxmpDTqhFHIZpxcAouGD9MvihyRlwuy1ODBHtowxaOWFvXg9aJNJ
	WYkknQkWSs5atZv0GHE99WUHwoZReiU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-510--6trhLijN-alxn-pagj6FA-1; Wed,
 02 Sep 2026 10:44:59 -0400
X-MC-Unique: -6trhLijN-alxn-pagj6FA-1
X-Mimecast-MFC-AGG-ID: -6trhLijN-alxn-pagj6FA_1788360294
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4EB50192DD59;
	Wed,  2 Sep 2026 14:44:53 +0000 (UTC)
Received: from wsxc.redhat.com (unknown [10.96.134.11])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CF44E1800644;
	Wed,  2 Sep 2026 14:44:39 +0000 (UTC)
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
Subject: [PATCH v2 03/13] arm: pass pt_regs to audit_syscall_entry()
Date: Wed,  2 Sep 2026 11:43:36 -0300
Message-ID: <cae4a0a79178cf7d1b661c10ee2fa038fc6ebdea.1788351089.git.rrobaina@redhat.com>
In-Reply-To: <cover.1788351089.git.rrobaina@redhat.com>
References: <cover.1788351089.git.rrobaina@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: TIaAtCtYbe9oI2jk424Ib9WzwU5KcRayMIwXUyhS1Vc_1788360294
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_074503_441197_4530374B 
X-CRM114-Status: GOOD (  10.67  )
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

Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
---
 arch/arm/kernel/ptrace.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
index ed7a2a87a670..e103ec2661cd 100644
--- a/arch/arm/kernel/ptrace.c
+++ b/arch/arm/kernel/ptrace.c
@@ -868,8 +868,7 @@ asmlinkage int syscall_trace_enter(struct pt_regs *regs)
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, scno);
 
-	audit_syscall_entry(scno, regs->ARM_r0, regs->ARM_r1, regs->ARM_r2,
-			    regs->ARM_r3);
+	audit_syscall_entry(scno, regs);
 
 	return scno;
 }
-- 
2.55.0


