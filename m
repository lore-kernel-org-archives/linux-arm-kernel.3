Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A603CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 10:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uthr87S+8rYD57D6miFenj8u6buv33RZdJm7P8ou0G8=; b=WOaodZSktBbCtTHUVDleIPb1Q4
	DPh3oQMJvf0s9twpZ+d06w8saIjGsDlr3VmW64qk6AZSUIcpMc0RjeIM5sROeIruNmllwTCHm7OLn
	AnZgrYGEZ2kY3WY6iD/atO8CBBKpoPrY6cGVBOzTdMKG0L/Yp3akfoJNY7TDeGi41/NlI2vser+H+
	5k7W2h7aR6ibIz2CkFIsNsEH4VlaF5gePuHzdyZ+UQA82H25SYJj0LOGOMB9SeoX+n/OSBRMUCW+D
	JclLS0p/ukgSVmdMqnR5oVb9hPoE4H+mZdFPK5dvmELRmv/8RSQ//0ctdlyioxVsGlu2p2V+Fyzuo
	JsWas2Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXvR-00000002TnR-1Flv;
	Fri, 19 Sep 2025 10:01:09 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzXvL-00000002Tlj-0h6N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 10:01:08 +0000
X-UUID: 85917df4953f11f0b29709d653e92f7d-20250919
X-CID-CACHE: Type:Local,Time:202509191758+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:7680da81-f567-4274-9f9e-e0aa43f6b56c,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:cb849cfafc49cff983d0e003fa13afb6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|50,EDM:5,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 85917df4953f11f0b29709d653e92f7d-20250919
X-User: pengcan@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <pengcan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 325077837; Fri, 19 Sep 2025 18:00:50 +0800
From: Can Peng <pengcan@kylinos.cn>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Can Peng <pengcan@kylinos.cn>
Subject: [PATCH 1/1] arm/syscalls: mark syscall invocation as likely in invoke_syscall
Date: Fri, 19 Sep 2025 18:00:42 +0800
Message-Id: <20250919100042.497861-1-pengcan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_030103_539504_778172BC 
X-CRM114-Status: GOOD (  10.78  )
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

The invoke_syscall() function is overwhelmingly called for
valid system call entries. Annotate the main path with likely()
to help the compiler generate better branch prediction hints,
reducing CPU pipeline stalls due to mispredictions.

This is a micro-optimization targeting syscall-heavy workloads.

Signed-off-by: Can Peng <pengcan@kylinos.cn>
---
 arch/arm64/kernel/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index c442fcec6b9e..aba7ca6bca2d 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -43,7 +43,7 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
 
 	add_random_kstack_offset();
 
-	if (scno < sc_nr) {
+	if (likely(scno < sc_nr)) {
 		syscall_fn_t syscall_fn;
 		syscall_fn = syscall_table[array_index_nospec(scno, sc_nr)];
 		ret = __invoke_syscall(regs, syscall_fn);
-- 
2.25.1


