Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E044EC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 12:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tkF2DYghDX+VQfWwEAkZ56brYwDEfPo9ZbyXaVQNw8w=; b=FUjq+/ZIvSyMcRWmg9iJtggHuW
	CqKfWzZ4B5LJN86xJU1tTR3LK3t/lQvfRyNuDoOFpufDcUdgNh9uuQoDvcK43Gc+OFWeJzX1TPMTO
	6w9RwDF+RGMvYHO+A0vMljRAi8/96zXaTNBFBnWsLp3WAQxgm3tdrUVLOcL8zMVjNl/fCD5AqlWiA
	Q8zXxolgOTqYIASDlBNV0+g3mx2bFgLP3rEST2fgA910oPgoKEDj0b/OWOhbBLZLrMT5WgQx0ghBA
	HKk7H6gGk9L79a2GuBwC4qjTEWG6Kl7ZbcjQaFIu9gApqxiY981ATqWEbio3ESvDKsUnkAZZxfLT/
	lguA98jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lJ8-00000000BQF-1NZl;
	Mon, 07 Apr 2025 12:10:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1l0a-000000005lb-1wEs;
	Mon, 07 Apr 2025 11:51:21 +0000
X-UUID: 9ccf83c813a611f083f2a1c9db70dae0-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tkF2DYghDX+VQfWwEAkZ56brYwDEfPo9ZbyXaVQNw8w=;
	b=dkDo2ljr/sjlsjNlGfkK7xnllS11m7EAELVbxF48MOdpRgeY5+FB9Tr3LWl50hEl09m6Tpr1kBlybpkQskkhlue4E/XCDUnM6izu49IRQx4vahYZxZwz3ZYBm8eTN782/aTlXF8IRD5Msts73jgYOYZpiRWWWPrEz2rXGy7xFcc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:6f29a8f9-4d42-49cf-bbf6-77a520ff60b6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:d91046c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9ccf83c813a611f083f2a1c9db70dae0-20250407
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 255631010; Mon, 07 Apr 2025 04:51:16 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 19:51:13 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 19:51:13 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Miklos Szeredi <miklos@szeredi.hu>, <eperezma@redhat.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <virtualization@lists.linux.dev>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <benliang.zhao@mediatek.com>,
	<bin.zhang@mediatek.com>, Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: [RESEND] virtiofs: add filesystem context source name check
Date: Mon, 7 Apr 2025 19:50:49 +0800
Message-ID: <20250407115111.25535-1-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_045120_499350_481585D1 
X-CRM114-Status: GOOD (  11.21  )
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

In certain scenarios, for example, during fuzz testing, the source
name may be NULL, which could lead to a kernel panic. Therefore, an
extra check for the source name should be added.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 fs/fuse/virtio_fs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 2c7b24cb67ad..53c2626e90e7 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -1669,6 +1669,9 @@ static int virtio_fs_get_tree(struct fs_context *fsc)
 	unsigned int virtqueue_size;
 	int err = -EIO;
 
+	if (!fsc->source)
+		return invalf(fsc, "No source specified");
+
 	/* This gets a reference on virtio_fs object. This ptr gets installed
 	 * in fc->iq->priv. Once fuse_conn is going away, it calls ->put()
 	 * to drop the reference to this object.
-- 
2.46.0


