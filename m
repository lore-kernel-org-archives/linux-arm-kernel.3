Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50723C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 19:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4g6Pqq5n7M/gwYtRIbDe68QQcgDz6vnWXZj4Z/2+yek=; b=UFB32xxkIqGu5HgM67bavLmmHD
	HgDow/Aiw4/FWYWS+cHx4sAupOvLkYwgJq7+qY9DrFMg8+xIm9UbzJUhfSV6n+4F1q37qIKYb4LtF
	DKqq/624uDLJqYQnn/JLW7+PvvuOXvqIbDnbUIa0rnbijza2yU0SgVbCupwXXKnNEsggUdpMM0QO8
	URppQ26bxJ44kAVRd+/rwxsnW+Y6MmJXFRsAtAd2cIjP63kOjYcrFKGVJ7bheYxVqs6+oBJ7sXjH8
	mKnxzp5ySrIC3qiRJOwipBBNxdXkeuQsjXt9VmT/nqriRTPlJW7lh5o8RA7TbR6pCaSRLhjOo7wJ/
	MNAGBdqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x965u-00000006OTT-1h2O;
	Tue, 22 Sep 2026 19:23:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x965s-00000006ORs-1TjY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 19:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790105035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4g6Pqq5n7M/gwYtRIbDe68QQcgDz6vnWXZj4Z/2+yek=;
	b=SR2IK3jHJOS1fKN6SIVfYAF851xgCTNvu4OyYu3H5BXf7qp1BlJ8gaI0BYJA3PsU+NhglO
	eHkkBgIS6fA415+l3DaMJNsJ4X+XDrvtTBuDCOzxDbPXJbGZakv5OG/VBkTP9E9qNBwsq3
	V0NHWm6jsWjG0RBmFNoHAtA9C7XKTHI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-345-WgDPjhSqNVm4ukglLylNhQ-1; Tue,
 22 Sep 2026 15:23:50 -0400
X-MC-Unique: WgDPjhSqNVm4ukglLylNhQ-1
X-Mimecast-MFC-AGG-ID: WgDPjhSqNVm4ukglLylNhQ_1790105026
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E3BAE1955E87;
	Tue, 22 Sep 2026 19:23:45 +0000 (UTC)
Received: from wsxc.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E03C63000223;
	Tue, 22 Sep 2026 19:23:26 +0000 (UTC)
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
Subject: [PATCH v3 08/14] parisc: mask compat syscall arguments in syscall_get_arguments()
Date: Tue, 22 Sep 2026 16:20:00 -0300
Message-ID: <65f32a82d590b11984723fa6f26ff96175679f9a.1790088067.git.rrobaina@redhat.com>
In-Reply-To: <cover.1790088067.git.rrobaina@redhat.com>
References: <cover.1790088067.git.rrobaina@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: Tzi0tZsBNQuRn3piCSu6d4iZ2vGfpYdfGKwglo23K30_1790105026
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_122356_466169_22AD1DD3 
X-CRM114-Status: GOOD (  12.55  )
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

A 32-bit compat task may leave garbage in the upper 32 bits of the
argument registers. Mask it off in syscall_get_arguments() so that
in-kernel consumers such as seccomp and audit observe the same values
the syscall actually used.

This previously happened for audit in the parisc do_syscall_trace_enter()
compat path; do it in the helper so all callers benefit and to prepare
for passing pt_regs to audit_syscall_entry().

Signed-off-by: Ricardo Robaina <rrobaina@redhat.com>
---
 arch/parisc/include/asm/syscall.h | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/include/asm/syscall.h b/arch/parisc/include/asm/syscall.h
index c11222798ab2..9d10fada3b48 100644
--- a/arch/parisc/include/asm/syscall.h
+++ b/arch/parisc/include/asm/syscall.h
@@ -28,12 +28,18 @@ static inline void syscall_get_arguments(struct task_struct *tsk,
 					 struct pt_regs *regs,
 					 unsigned long *args)
 {
-	args[5] = regs->gr[21];
-	args[4] = regs->gr[22];
-	args[3] = regs->gr[23];
-	args[2] = regs->gr[24];
-	args[1] = regs->gr[25];
-	args[0] = regs->gr[26];
+	unsigned long mask = -1UL;
+
+	/* Mask off garbage in the upper 32 bits for compat tasks. */
+	if (__is_compat_task(tsk))
+		mask = 0xffffffff;
+
+	args[5] = regs->gr[21] & mask;
+	args[4] = regs->gr[22] & mask;
+	args[3] = regs->gr[23] & mask;
+	args[2] = regs->gr[24] & mask;
+	args[1] = regs->gr[25] & mask;
+	args[0] = regs->gr[26] & mask;
 }
 
 static inline void syscall_set_arguments(struct task_struct *tsk,
-- 
2.55.0


