Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35371FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 07:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYu9o+7VrmH1rNOBG/h+zqWK1u+dGDFkWIV9Agamq2k=; b=2KDhGcp9dT6kJ7LM8oYxlycVPX
	G53Q1FjzfG29KfH8r603UyIIG3c1GWMgFDPbod48ikCQxpUVTFFDwfu4PQ63r0MNVSEy1d46HpPoC
	qbK0X3ydsRQY51CSWDhikpAmHH9WRITpItS4VQS7ew1/RXW1V8GxoK6GH5pEq0aoTMoDK5A9TMFi8
	ERmzseThNS9fSA8liQQccBXlNJsFBJ2dIH0iMXO3ksrwk/fAKQXCzaJqyHuJzqlARd85daAFMOdyA
	xfrCXbAo9C1zLfu47+RvvrxD2GKOE+LmkL2SgZ9npL54OcuNNBgJFuz+oTuwni9E6k6Gw4o/5XZ3k
	Lsyps14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGWzb-0000000E8mg-3Mtr;
	Sat, 25 Apr 2026 06:59:55 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGWzZ-0000000E8lF-1S1l;
	Sat, 25 Apr 2026 06:59:54 +0000
X-UUID: 581dfc9a407411f1aa26b74ffac11d73-20260425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:293a675c-0837-4505-b3f7-b02a8e0aa797,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:3425f2eda19b92ffc288353dc79b7b29,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|898,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 581dfc9a407411f1aa26b74ffac11d73-20260425
X-User: aichao@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 33038705; Sat, 25 Apr 2026 14:59:46 +0800
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
Subject: [PATCH 02/35] fbdev: i810: Use safer strscpy() instead of strcpy()
Date: Sat, 25 Apr 2026 14:58:53 +0800
Message-Id: <20260425065926.1091168-3-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260425065926.1091168-1-aichao@kylinos.cn>
References: <20260425065926.1091168-1-aichao@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_235953_727342_F5F193E8 
X-CRM114-Status: UNSURE (   9.00  )
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
 drivers/video/fbdev/i810/i810-i2c.c  | 2 +-
 drivers/video/fbdev/i810/i810_main.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/i810/i810-i2c.c b/drivers/video/fbdev/i810/i810-i2c.c
index 7db17d0d8a8c..6141e9d2fff4 100644
--- a/drivers/video/fbdev/i810/i810-i2c.c
+++ b/drivers/video/fbdev/i810/i810-i2c.c
@@ -91,7 +91,7 @@ static int i810_setup_i2c_bus(struct i810fb_i2c_chan *chan, const char *name)
 {
         int rc;
 
-        strcpy(chan->adapter.name, name);
+	strscpy(chan->adapter.name, name);
         chan->adapter.owner             = THIS_MODULE;
         chan->adapter.algo_data         = &chan->algo;
         chan->adapter.dev.parent        = &chan->par->dev->dev;
diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/i810/i810_main.c
index 10b914a24114..0499058a3ea8 100644
--- a/drivers/video/fbdev/i810/i810_main.c
+++ b/drivers/video/fbdev/i810/i810_main.c
@@ -1091,7 +1091,7 @@ static int encode_fix(struct fb_fix_screeninfo *fix, struct fb_info *info)
 
     	memset(fix, 0, sizeof(struct fb_fix_screeninfo));
 
-    	strcpy(fix->id, "I810");
+	strscpy(fix->id, "I810");
 	mutex_lock(&info->mm_lock);
     	fix->smem_start = par->fb.physical;
     	fix->smem_len = par->fb.size;
-- 
2.34.1


