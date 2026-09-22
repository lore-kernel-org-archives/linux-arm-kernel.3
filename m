Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9982C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NL16rk0vLAf1LCmTnxVIbSec1SWALoohuykTOq26AVM=; b=cyixzT5EV4NZcpwhKVNg/nysTJ
	aC+RDeABlyx7cxuj8NXXd1mI5q29pvvJrl4UkeVLPt+18KqMIf3GPrP/PCuOewUc7e9KrMuBYL9J/
	BvR6jPiTUvkZPQBJ4kSe3QBa4g/1hGxn1QD+Kst1PeFplPxCMaToJ/J852iOdFqNxaCj3V4aRfSLo
	VRud1heEBkhS7kUMpMzUHBTzD1b6OkswaPAC8Xid2v6PF91DI33J0foqf9eoLuMpkrURXgHfEeqUF
	dOEOTRWxYp8FMEgYOnXU2YfxxAUZptm/aJNL7tpNYb23jLsJ8fVzOXxYCVDqTO/GigrWg6OeSQWdp
	Ez63qqYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vXn-00000004cZF-3yno;
	Tue, 22 Sep 2026 08:08:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vXl-00000004cYB-2EZ2;
	Tue, 22 Sep 2026 08:08:02 +0000
X-UUID: b52a79d2b65c11f1acbe4559397dec65-20260922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=NL16rk0vLAf1LCmTnxVIbSec1SWALoohuykTOq26AVM=;
	b=D3j2pnWNRdNOvCJ39NrS4rfOA1N5PZwWGoqXmeEbHW8w2WLw6WIWpuP8b9rUUQcKCJOq/wC9F+ymlKpMtPI4VDJz2wDSwX0N2JZrUBIyKCcqDA9jol0kg2ZQ4VJFK1jc8QXWLpPrEixKr+kL2P62o05nJQzJsA34QWOSI6HSXtc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:e2bb1deb-3f34-4f06-aa42-ea1104b10e78,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:81bf687c-2058-4298-90ad-1156c3f1dffd,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b52a79d2b65c11f1acbe4559397dec65-20260922
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <yenchia.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1966417923; Tue, 22 Sep 2026 01:07:51 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 22 Sep 2026 16:07:49 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 22 Sep 2026 16:07:49 +0800
From: Yenchia Chen <yenchia.chen@mediatek.com>
To: Russell King <linux@armlinux.org.uk>
CC: Yenchia Chen <yenchia.chen@mediatek.com>, Huang-Sen Lin
	<eddy.lin@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] ARM: entry: word-align the syscall table
Date: Tue, 22 Sep 2026 16:07:38 +0800
Message-ID: <20260922080744.798430-1-yenchia.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_010801_580640_F10D0062 
X-CRM114-Status: GOOD (  10.21  )
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

On ARM, ENTRY is .align 0 and nothing else aligns the table.
It is layout-dependent and left to chance that unrelated code
(e.g. CONFIG_TRACE_IRQFLAGS fast path in entry-common.S) can shift
the table on or off a word boundary since Thumb-2 has 2-byte instructions.
The syscall dispatch loads the handler with

        ldr pc, [tbl, scno, lsl #2]

which requires the table base to be word-aligned. Observed on our
platform, the first syscall loads pc from an unaligned address
and takes a fatal alignment exception:

        Alignment trap: not handling instruction f858f02a at [<c0100208>]
        Unhandled fault: alignment exception (0x001) at 0xc01002ba
        Internal error: : 1 [#1] PREEMPT SMP THUMB2

Align the table in syscall_table_start so it is always word-aligned
regardless of THUMB2 layout.

Signed-off-by: Yenchia Chen <yenchia.chen@mediatek.com>
Signed-off-by: Huang-Sen Lin <eddy.lin@mediatek.com>
---
 arch/arm/kernel/entry-common.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 88336a1292bb..831a40461cdf 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -321,6 +321,7 @@ __sys_trace_return:
 	.macro	syscall_table_start, sym
 	.equ	__sys_nr, 0
 	.type	\sym, #object
+	.align	2
 ENTRY(\sym)
 	.endm
 
-- 
2.45.2


