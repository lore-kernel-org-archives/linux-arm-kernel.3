Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B52ACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 19:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gacBwfWTKcgjQcO0gdGshUooCsAPU+CoMskbVUWweZo=; b=yN2yij6XIEJNFasnXsoPBrvo3M
	JlPQKUldx4XdpJVTODkzzZR2WXSAL5gSr8g4LlcFRAFb57tAe9VHrpiz/LZ+KENP/SLv82dySTCGB
	c5OCHBTWERiMzrv7TbF/ikKTJhodaWtudYpFKoXodkmvWid9MRvgGJY3S3Ri5zSd0J0Y1mhRqTQr4
	BKVCJoPchRYPW0dz5ipO+QZSIPEdM+/waZB7z945biR8qOa1q3DM/eDsVHUOCJiRwyINob7ntfMTY
	F8eTQN4a94jUYqsb6ehZNyIeJdTOvWoJM5eAvL64IbaY4PVBOKlxsGAUd+1PegI8IGsjfnO7o/CiZ
	cvZm66sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1Ml-00000007RhJ-1NUt;
	Thu, 23 Oct 2025 19:52:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC1Mi-00000007RdH-45Wj;
	Thu, 23 Oct 2025 19:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gacBwfWTKcgjQcO0gdGshUooCsAPU+CoMskbVUWweZo=; b=ZJxo5Nxd/kd0e5UUT91YfTmeqe
	N0CgPiG/t7V1EMWJxXehy2JjYPSi7+VN+JtHV1iXul7w5c7GWRhkrWNYw5xxX7mkilFU6GFbAAHLB
	b+5tHtc46+o3MQ6vAv43H9xGxqMEJildY0nw8sDdDhDMiQrh0Uom1n6CDZ4nEG92/hafd7NMMMS0P
	SYGxWlzhr1y8wbU3ai1JiYLUGTcW1ZP3gtmh+2kwSeGBQeYWwLQ7o3Z3NZ96DFdrS/7NDCmXPXOUI
	RR1FytuTgIgTJseAn+SLvNtaf6R1m78p2PpAQ5hcCu53LVh572TOZ0HaP9c8YobvNMtJ4N38j/5Hu
	mq1v+4ZA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0V0-00000001gPw-3Tlo;
	Thu, 23 Oct 2025 18:57:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761249156; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VcyPy4Bav5XBRMuJwuVfXrS7rWxpP2Nv2aRhGOFw/blf+P8e5vNrjLrLW+Fiumn3fzDPV+W+B9sW5cKeGxQWWriLwG2CmD1Owj6xfNnLKfx6hd75GkX9nurHjiNa557kNiOr35/7nNjJGNWWHb0A9fVWHgA0wQlqjJXfUB1eCAs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761249156; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gacBwfWTKcgjQcO0gdGshUooCsAPU+CoMskbVUWweZo=; 
	b=J5625+6oUf6Bxdxgt8sg1wIDbDjcFF3LwX4oJv5vGldN+S0sY+UfPpiRlstpaj7GgfwxnjsIaXSyc+XLA+l6+EX+AWIly3ejsGzN6UFTpT07HqFUy12PpYN1MaJ+p0YidfGc6zy9ugsEthAmEG6DH5XcY4C9zqm8RXwXfWMzVMk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761249156;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=gacBwfWTKcgjQcO0gdGshUooCsAPU+CoMskbVUWweZo=;
	b=ZSz8t0zvSnRhRpZaAvu+eIRNTsO04/fK/wMw/EhoQnKXclBDECTnmDBBOJsGyZY4
	DaGw8dZkO/BnbNeOzeV7Rg0tEhY0Xu0nBrlzh0WljjMP/4fjIsrqQUqdHgalkouZLHA
	bjsTRCpYeWcBTv8iOZk03Fm/YjVG+7jsnQG+J4jY=
Received: by mx.zohomail.com with SMTPS id 1761249155845262.54753612291915;
	Thu, 23 Oct 2025 12:52:35 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Oct 2025 21:49:41 +0200
Subject: [PATCH v3 23/24] scsi: ufs: mediatek: Remove ret local from
 link_startup_notify
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-mt8196-ufs-v3-23-0f04b4a795ff@collabora.com>
References: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
In-Reply-To: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 kernel@collabora.com, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_195723_392631_58A51C74 
X-CRM114-Status: GOOD (  11.69  )
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

Remove the "ret" local variable from ufs_mtk_link_startup_notify, as
it's pointless; in all cases it is assigned, it is returned right after
without being read first.

Rework the code to just return directly, and get rid of the default
branch while at it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 5f5ebaf61ae0..932d1fdfdc65 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1487,21 +1487,15 @@ static void ufs_mtk_post_link(struct ufs_hba *hba)
 static int ufs_mtk_link_startup_notify(struct ufs_hba *hba,
 				       enum ufs_notify_change_status stage)
 {
-	int ret = 0;
-
 	switch (stage) {
 	case PRE_CHANGE:
-		ret = ufs_mtk_pre_link(hba);
-		break;
+		return ufs_mtk_pre_link(hba);
 	case POST_CHANGE:
 		ufs_mtk_post_link(hba);
-		break;
-	default:
-		ret = -EINVAL;
-		break;
+		return 0;
 	}
 
-	return ret;
+	return -EINVAL;
 }
 
 static int ufs_mtk_device_reset(struct ufs_hba *hba)

-- 
2.51.1.dirty


