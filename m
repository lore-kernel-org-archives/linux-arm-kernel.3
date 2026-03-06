Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D0CF513F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 04:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=+tRCLx1RcwGxf5Y2F3c26DMNubwbwjg17R25hyEILeQ=; b=HB/I3eDAqLPiSATiLC/ILe9kd8
	iLU08D/7oPPv/QgkVjd5MHAkHknoY42aydt4WgAlZxWD4iHDGJUL0BcuSnWvk89IGskvA8xfa0cbP
	jSfvZjB1YQdp3S+J37O4SJBKAL5CWtpNbQQUoOeQYeK9ZC3wzNzJS9P/wNAaxYNyqsz7NJGfZT6+P
	0OgGm6UJ7fLapKANl7UzMUExMjuEisWnS0GDSxOTHY3RoJJQyCcbfUx9TpbHVIednQQbLK7fUMpxA
	Sqguizhm93tPsWHEIh9/7Ci483lPsp+MH0v3G43wXoAFvq2U9heNPP7rb338YKQOz7/VhyHgZRvrl
	RVcRIc5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyMab-00000002zs4-1wHK;
	Fri, 06 Mar 2026 04:15:01 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyMaV-00000002zou-3Y4b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 04:15:00 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260306041446epoutp01ade695cba1c655cb489cd2ac7c51c4b1~aJV1P4vvm2889128891epoutp01i
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 04:14:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260306041446epoutp01ade695cba1c655cb489cd2ac7c51c4b1~aJV1P4vvm2889128891epoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1772770486;
	bh=+tRCLx1RcwGxf5Y2F3c26DMNubwbwjg17R25hyEILeQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=QB5fnevlgNbMjZgfQ80vgaoWYKpli/0/9pLsfEhCb56QRSY5fXmyXDMtz7ZSmSUDG
	 1YV80XuVQdkNoD4OAWwEooGTCOTdlMrqNeUDpO8FfAmPxlC2PPu4DqBAcvwv+C2lct
	 YtpnKaD/gzf/81wZM5dBPoXOk0LzITUZdC0hqItg=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260306041445epcas5p28765e3c27445bfc69a732be8b3b0c745~aJV0Y8wYd2508125081epcas5p2I;
	Fri,  6 Mar 2026 04:14:45 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.41.42]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4fRtN50VLPz2SSKg; Fri,  6 Mar
	2026 04:14:45 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20260306041444epcas5p49a7e0fa0dc2f2eca16a083c848b0c8fb~aJV0KmYPF2830428304epcas5p4P;
	Fri,  6 Mar 2026 04:14:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.97.243.203]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260306041442epsmtip2aec03f43ac9aaa7bbb3b6a2d05998c9e~aJVyGUIF32817928179epsmtip2H;
	Fri,  6 Mar 2026 04:14:42 +0000 (GMT)
From: Maninder Singh <maninder1.s@samsung.com>
To: linux@armlinux.org.uk, mark.rutland@arm.com, luto@kernel.org,
	geert@linux-m68k.org, schuster.simon@siemens-energy.com,
	andreas@gaisler.com, brauner@kernel.org, keithpac@amazon.com,
	linusw@kernel.org, ardb@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Maninder Singh <maninder1.s@samsung.com>
Subject: [PATCH 1/1] arm: add try_get_task_stack() for __get_wchan
Date: Fri,  6 Mar 2026 09:44:32 +0530
Message-Id: <20260306041432.1026421-1-maninder1.s@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260306041444epcas5p49a7e0fa0dc2f2eca16a083c848b0c8fb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20260306041444epcas5p49a7e0fa0dc2f2eca16a083c848b0c8fb
References: <CGME20260306041444epcas5p49a7e0fa0dc2f2eca16a083c848b0c8fb@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_201457_339014_129B8C5C 
X-CRM114-Status: GOOD (  17.30  )
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

As per help menu of "THREAD_INFO_IN_TASK", try_get_task_stack()
is needed for get_wchan.
For ARM it was missed while enabling THREAD_INFO_IN_TASK.
Adding try_get_task_stack() for ARM as well.

Fixes: 18ed1c01a7dd ("ARM: smp: Enable THREAD_INFO_IN_TASK")
Signed-off-by: Maninder Singh <maninder1.s@samsung.com>
---
 arch/arm/kernel/process.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm/kernel/process.c b/arch/arm/kernel/process.c
index d7aa95225c70..1a84ceb9f7d0 100644
--- a/arch/arm/kernel/process.c
+++ b/arch/arm/kernel/process.c
@@ -280,23 +280,31 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 unsigned long __get_wchan(struct task_struct *p)
 {
 	struct stackframe frame;
-	unsigned long stack_page;
+	unsigned long stack_page, ret = 0;
 	int count = 0;
 
+	stack_page = (unsigned long)try_get_task_stack(p);
+	if (!stack_page)
+		return 0;
+
 	frame.fp = thread_saved_fp(p);
 	frame.sp = thread_saved_sp(p);
 	frame.lr = 0;			/* recovered from the stack */
 	frame.pc = thread_saved_pc(p);
-	stack_page = (unsigned long)task_stack_page(p);
 	do {
 		if (frame.sp < stack_page ||
 		    frame.sp >= stack_page + THREAD_SIZE ||
 		    unwind_frame(&frame) < 0)
-			return 0;
-		if (!in_sched_functions(frame.pc))
-			return frame.pc;
+			goto out;
+		if (!in_sched_functions(frame.pc)) {
+			ret = frame.pc;
+			goto out;
+		}
 	} while (count ++ < 16);
-	return 0;
+
+out:
+	put_task_stack(p);
+	return ret;
 }
 
 #ifdef CONFIG_MMU
-- 
2.34.1


