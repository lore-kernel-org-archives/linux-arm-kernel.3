Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348B3FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 07:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=08PBZTmgvs+SWLksMBkzPihFbS4T+p80oSROpZWS858=; b=N4czBZ4xVS0U7T/SFx5hVZPOWE
	i69lFGM53KPobZkBPcbcsonE7q5HbIqPpq2k7YH4ipcDJC6CM4FI+j/Hhc7jhWYdiugsWdd2lus+9
	Hb9ZGLdHWwDz3/SNyNsd9JO+q6/uX8i94mKH0Azpatkknh5SWXcJKf6qv3dfBp1pzE4oPoRMkC5RI
	qUvWwARhbF/o+0r3ap/bjb3wmY6JrcEsn0AbYKTWd66G9jN03ES8wDghrtubrTA9isHfKlJhwYkrm
	6NaAqFTT+logSHaAc5ASpNUbjlXOse5ldGMIDQ0DOleSRBkFQDhChzh5+qnzrk3/jkcLgnFOK2w1Y
	sZ1E9vVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGX0D-0000000E9Pu-0R2S;
	Sat, 25 Apr 2026 07:00:33 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGWzy-0000000E925-3Fpf;
	Sat, 25 Apr 2026 07:00:20 +0000
X-UUID: 668c1dfc407411f1aa26b74ffac11d73-20260425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:bc96a1ab-d4c4-46fe-bc7c-334a1172fbd2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:1d8d2749795928838fe3a6f3082f81f0,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|898,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 668c1dfc407411f1aa26b74ffac11d73-20260425
X-User: aichao@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 467916009; Sat, 25 Apr 2026 15:00:10 +0800
From: Ai Chao <aichao@kylinos.cn>
To: deller@gmx.de,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux@armlinux.org.uk,
	dilinger@queued.net,
	adaplas@gmail.com,
	James.Bottomley@HansenPartnership.com,
	FlorianSchandinat@gmx.de,
	alchark@gmail.com,
	krzk@kernel.org,
	kees@kernel.org,
	rene@exactco.de,
	tzimmermann@suse.de,
	rongqianfeng@vivo.com,
	thorsten.blum@linux.dev,
	chelsyratnawat2001@gmail.com,
	soci@c64.rulez.org,
	gregkh@linuxfoundation.org,
	daniel@thingy.jp,
	linmq006@gmail.com,
	fourier.thomas@gmail.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-geode@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH 12/35] fbdev: arkfb: Use safer strscpy() instead of strcpy()
Date: Sat, 25 Apr 2026 14:59:03 +0800
Message-Id: <20260425065926.1091168-13-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260425065926.1091168-1-aichao@kylinos.cn>
References: <20260425065926.1091168-1-aichao@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_000019_829908_26ED80D2 
X-CRM114-Status: UNSURE (   9.29  )
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

Use a safer function strscpy() instead of strcpy() for copying to arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 drivers/video/fbdev/arkfb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index 866c1165704e..a05900f0e691 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -1025,7 +1025,7 @@ static int ark_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	info->screen_size = (1 << (regval >> 6)) << 20;
 	info->fix.smem_len = info->screen_size;
 
-	strcpy(info->fix.id, "ARK 2000PV");
+	strscpy(info->fix.id, "ARK 2000PV");
 	info->fix.mmio_start = 0;
 	info->fix.mmio_len = 0;
 	info->fix.type = FB_TYPE_PACKED_PIXELS;
-- 
2.34.1


