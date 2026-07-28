Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2160C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 09:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1FQ6XY6OnCluEfdUGQoQsL55sNffGf4ZpkxJ+3OD6uM=; b=lCzCe4maaiG0RlVVHMylliJv/r
	pHdoMJ3W9rgv5DrwFxxb6bdiDomtJaoR4CpkQkmoAQGtFH72MF52RWywqvT5UvmooiigLgk3BM0uD
	PETegE+2wIrmCk/Ut6RYnrYzyUpxzFfC0Vx6KvAPfT0gt5IOVW5oneHxhu5Hjcqvm7/68h8dQfEYp
	cxplcyh+u9HP2WtE5R7dgr7Svz4C2orhk8/j3HBYPougoqRB1rVdNcr2s/qa5Y5vViMYYPeSiHA1/
	TB6gCyT1u/1Hji991z0IwUb3vaorRfnpetQ2MKHMu2H6VImnztXUrXyyGQ4Bm7aa/hivDogtGnojT
	ElBIsHpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodvW-00000004mQS-49Da;
	Tue, 28 Jul 2026 09:16:42 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wodvT-00000004mOo-1zjp;
	Tue, 28 Jul 2026 09:16:41 +0000
X-UUID: 03d400e08a6511f1aa26b74ffac11d73-20260728
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5bd4b022-18e4-4a7d-a0f2-95c29fe412ff,IP:0,U
	RL:0,TC:0,Content:79,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:79
X-CID-META: VersionHash:e7bac3a,CLOUDID:a5780a3e90f84f7614d65cefa1221d63,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:3|15|50,E
	DM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 03d400e08a6511f1aa26b74ffac11d73-20260728
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1481726761; Tue, 28 Jul 2026 17:16:28 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Caesar Wang <wxt@rock-chips.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Linmao Li <lilinmao@kylinos.cn>
Subject: [PATCH 0/2] mailbox: rockchip: fix the pclk lifetime
Date: Tue, 28 Jul 2026 17:16:21 +0800
Message-Id: <20260728091623.3691198-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_021639_824065_52D2D3A7 
X-CRM114-Status: UNSURE (   7.45  )
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

The Rockchip mailbox driver enables its peripheral clock in probe() and
never disables it: neither on the failure paths that follow, nor when the
device is unbound, since the driver has no remove callback.

Patch 1 fixes that with devm_clk_get_enabled(). It stands on its own and
is the only one relevant for stable.

Patch 2 is a follow-up cleanup. The pclk pointer is only used in probe(),
so it can be made local and dropped from the driver data. This mirrors
commit 6b0eadf69bd1 ("mailbox: exynos: drop unneeded runtime pointer
(pclk)").

Compile-tested on linux-next with CONFIG_ROCKCHIP_MBOX=y; both patches
build cleanly with W=1. Not tested on hardware.

Linmao Li (2):
  mailbox: rockchip: disable pclk on probe failure and unbind
  mailbox: rockchip: drop unneeded runtime pointer (pclk)

 drivers/mailbox/rockchip-mailbox.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)


base-commit: c5e32e86ca02b003f86e095d379b38148999293d
-- 
2.25.1


