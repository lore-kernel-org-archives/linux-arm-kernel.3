Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE8DCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 03:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rNtnHFH/1NisuY8nccM0/QffB5pWi6qHcDXaQBJZF18=; b=Auur2wzk5glrxf7iWckwaGCau5
	FTdhyPshXZZqWBzIS5/lLvZVGg+FYT4fE1Cl49Bl344hlkRiDy5FocjsHqjA1j4UTFEOJRgQtHYkh
	I2tfKLbCtRtnJqeY7XEtjgaoCGHFsQeoEyKulj7Huy9gWYCjKtUyMi0kbhcvqQMh1yJvfZptU8Gtz
	qVDTbI2QhYcQzTqPQUsIxMF+aliYqPpLDcu0GWFIviHJ6lDbNOmRLGecZ5VQ8ulRWfnUbpIAdrcqo
	EXFVNX1u6wiFVFYToOLfzifzLVQhe1mA6kmWtYPvrIHjd1FVlDu/0bokA3bnCP9DEoqXPlvYRc5t1
	tBwZja1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzRsY-00000001kLG-2GcS;
	Fri, 19 Sep 2025 03:33:46 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzRsV-00000001kKd-2sD1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 03:33:45 +0000
X-UUID: 6a81237e950911f0b29709d653e92f7d-20250919
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:dec5a508-240c-4c0a-ad30-88249f5b3bae,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:1dbd459edc4a7cb8f4dadc86968a2d0d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|50,EDM:5,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6a81237e950911f0b29709d653e92f7d-20250919
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <liqiang01@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 723830363; Fri, 19 Sep 2025 11:33:32 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 0BF80E009009;
	Fri, 19 Sep 2025 11:33:32 +0800 (CST)
X-ns-mid: postfix-68CCCF0A-47649798
Received: from localhost.localdomain (unknown [10.42.20.41])
	by mail.kylinos.cn (NSMail) with ESMTPA id 2371AE009008;
	Fri, 19 Sep 2025 11:33:29 +0800 (CST)
From: Li Qiang <liqiang01@kylinos.cn>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Li Qiang <liqiang01@kylinos.cn>
Subject: [PATCH] arm64: add unlikely hint to MTE async fault check in el0_svc_common
Date: Fri, 19 Sep 2025 11:33:27 +0800
Message-Id: <20250919033327.1942730-1-liqiang01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_203344_064973_DE3A0CB6 
X-CRM114-Status: GOOD (  10.91  )
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

Add unlikely() hint to the _TIF_MTE_ASYNC_FAULT flag check in
el0_svc_common() since asynchronous MTE faults are expected to be
rare occurrences during normal system call execution.

This optimization helps the compiler to improve instruction caching
and branch prediction for the common case where no asynchronous
MTE faults are pending, while maintaining correct behavior for
the exceptional case where such faults need to be handled prior
to system call execution.

Signed-off-by: Li Qiang <liqiang01@kylinos.cn>
---
 arch/arm64/kernel/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index c442fcec6b9e..7eb13f4c87da 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -96,7 +96,7 @@ static void el0_svc_common(struct pt_regs *regs, int sc=
no, int sc_nr,
 	 * (Similarly for HVC and SMC elsewhere.)
 	 */
=20
-	if (flags & _TIF_MTE_ASYNC_FAULT) {
+	if (unlikely(flags & _TIF_MTE_ASYNC_FAULT)) {
 		/*
 		 * Process the asynchronous tag check fault before the actual
 		 * syscall. do_notify_resume() will send a signal to userspace
--=20
2.25.1


