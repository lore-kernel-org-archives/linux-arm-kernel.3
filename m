Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29830C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 02:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Osz1/jocrFEzgFhLEIhFRrb4kDNRJq8rHtYsDHvteoI=; b=C6uiMX+yDKyFzT7y2C0t1pdGIL
	98s1o0Gw8OO+rym+lTC+znicglB30/fzU0Oe9nnU/yGFtg64qwg6JBfueBCNWg1I/m0A0qbn86Mfq
	SmgU+VACcvNUGyDF5Q7uHlqJLsOZf8FHkplSQxrl8EBFrK0g8+41ERX1SKC7ChHI3/zlkkQS9Fyga
	0jWsIE5Z8dtsftSlGet+rML5zpS+o1mjoQYVPEV2DotVuGMRe8YejwniY+9gKlBFHHSkw6qI454ZC
	vDzznnYsbgyxPgy62qdsvqH2qbSuECz2Ikc1OrRfsbCmy7PEbqe/4t3QjZwVJ38/vB3SOJHqQmfpV
	pGggUF9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thg4T-00000002HX0-3Non;
	Tue, 11 Feb 2025 02:32:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thg34-00000002HMZ-0TDg;
	Tue, 11 Feb 2025 02:30:55 +0000
X-UUID: 3444a9fce82011ef9048ed6ed365623b-20250210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Osz1/jocrFEzgFhLEIhFRrb4kDNRJq8rHtYsDHvteoI=;
	b=FNLzOXu0WbQTQjobIbyftOeYx/uzzERhGi1LNLmDYnZqEx0eeDKTsxmkeFe0nWljHrREa9x27uup4RBJUQemwTO33cuG/63webiu6PQIF7sNY1IxmMgutdeenTUG9DKcHxACiWsUsmLjiqhdi7ZCIKx/d3QXHC0mDXWf2tNsoF8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:1b6c68a0-7129-49fd-ae13-eb8f0a145b5f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:76f5249c-f55b-41e7-a712-ffbe7a973280,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 3444a9fce82011ef9048ed6ed365623b-20250210
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <bo.ye@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 287322901; Mon, 10 Feb 2025 19:30:48 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 11 Feb 2025 10:30:45 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 11 Feb 2025 10:30:45 +0800
From: Bo Ye <bo.ye@mediatek.com>
To: Thomas Gleixner <tglx@linutronix.de>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <dicken.ding@mediatek.com>, <hanks.chen@mediatek.com>,
	<xiujuan.tan@mediatek.co>, Bosser Ye <bo.ye@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] genirq: clear IRQS_PENDING in irq descriptor
Date: Tue, 11 Feb 2025 10:30:39 +0800
Message-ID: <20250211023040.180330-1-bo.ye@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_183054_162008_24BE956E 
X-CRM114-Status: GOOD (  16.48  )
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

From: Bosser Ye <bo.ye@mediatek.com>

In the kernel-6.6 IRQ subsystem, there is a case of IRQ retrigger:
Due to the possibility of electrical signal glitches causing false interrupts for edge-triggered type IRQs,
it is necessary to clear any potential false interrupts or re-triggered interrupt signals from the interrupt
source between disabling and enabling the edge-triggered IRQ.

When the module using this IRQ may disable the IRQ as needed and then If the disabled IRQ is triggered, the IRQ
subsystem will set the istate of the corresponding IRQ descriptor to pending. After the module using this
IRQ completes other tasks, it clears the pending state on the GIC using irq_set_irqchip_state(). However,
the pending state in the IRQ descriptor's istate is not cleared, which leads to the module receiving the IRQ
again after enabling it, even though the interrupt source has not triggered, because the IRQ subsystem
retriggers the interrupt based on the pending state in the IRQ descriptor.

[ 1015.093550] [T300432] ccci_fsm: CPU: 3 PID: 432 Comm: ccci_fsm Tainted: P        W  OE      6.6.30-android15-8-o-g3d1adaff8937-4k #1 4e6ae6c76d81ac612e982b5e84c39c55b332fb77
...
[ 1015.093609] [T300432] ccci_fsm: Call trace:
[ 1015.093628] [T300432] ccci_fsm:  dump_backtrace+0xec/0x138
[ 1015.093668] [T300432] ccci_fsm:  show_stack+0x18/0x28
[ 1015.093697] [T300432] ccci_fsm:  dump_stack_lvl+0x50/0x6c
[ 1015.093728] [T300432] ccci_fsm:  dump_stack+0x18/0x24
[ 1015.093747] [T300432] ccci_fsm:  gic_retrigger+0x74/0x7c
[ 1015.093764] [T300432] ccci_fsm:  check_irq_resend+0x8c/0x16c
[ 1015.093777] [T300432] ccci_fsm:  irq_startup+0x2ec/0x360
[ 1015.093788] [T300432] ccci_fsm:  enable_irq+0x84/0xf4
[ 1015.093798] [T300432] ccci_fsm:  wdt_enable_irq+0x2c/0xec [ccci_md_all 029335d5c64293385f41211c1eb232e631274782]
[ 1015.094263] [T300432] ccci_fsm:  md_cd_start+0x34c/0x510 [ccci_md_all 029335d5c64293385f41211c1eb232e631274782]
[ 1015.094707] [T300432] ccci_fsm:  ccci_md_start+0x38/0x48 [ccci_md_all 029335d5c64293385f41211c1eb232e631274782]
[ 1015.095150] [T300432] ccci_fsm:  fsm_routine_start+0x448/0x1ed8 [ccci_md_all 029335d5c64293385f41211c1eb232e631274782]
[ 1015.095593] [T300432] ccci_fsm:  fsm_main_thread+0x20c/0xa78 [ccci_md_all 029335d5c64293385f41211c1eb232e631274782]
[ 1015.096035] [T300432] ccci_fsm:  kthread+0x110/0x1b8
[ 1015.096049] [T300432] ccci_fsm:  ret_from_fork+0x10/0x20
...
[ 1015.096067] [    C0] swapper/0: HWIRQ 107 handle_fasteoi_irq[714] set desc->istates to IRQS_PENDING // CPU execute IRQ's ISR

Solution: the corresponding upstream patch modifies the irq_set_irqchip_state(...) in the IRQ subsystem.
The purpose is to clear the pending state in the IRQ descriptor's istate when successfully clearing the
corresponding IRQ on the GIC.

Test: Stress tests have verified that the patch is effective and does not cause any side effects.

Signed-off-by: Bosser Ye <bo.ye@mediatek.com>
---
 kernel/irq/manage.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 8a936c1ffad3..ad1cefb2e5aa 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -2893,8 +2893,11 @@ int irq_set_irqchip_state(unsigned int irq, enum irqchip_irq_state which,
 #endif
 	} while (data);
 
-	if (data)
+	if (data) {
 		err = chip->irq_set_irqchip_state(data, which, val);
+		if (!err && which == IRQCHIP_STATE_PENDING && !val)
+			desc->istate &= ~IRQS_PENDING;
+	}
 
 out_unlock:
 	irq_put_desc_busunlock(desc, flags);
-- 
2.17.0


