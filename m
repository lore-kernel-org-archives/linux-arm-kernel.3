Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F233FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 07:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbNeJpqZRhm9gK/c0rZYYY2EAJIOTwS2W4r0oOgKBY8=; b=Tn96SyY1kCDXq60z1Hmhv0h4x8
	/mLD6EwETagQMBcYQF6iHFG4mvYRXUWCfG2qcwh+EgMFb8rjb839j01eKhayYrMSdngud5ZaIzjI3
	aFIulcaF6GwoinRxEx07nk4H3iEe5eyZIDidCpPYWg5HHvpCDq0/hRKIlR6K7E5B1KuvAC8E/QD7G
	55vrIPLH0zic0MC8UUkgM85FlzWsJ7xHIfeP8CIAj7T8kWB2XcuBSscdTCn2zyRdvFuSGhzmZXQhi
	Sshjoo82lQdU8moxijwZH9mlVmsvVuBldARSIAw5E2ZUhKM18szVrg4uRgTvpzDpPD8h+X8ad81vZ
	8mdBSP8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGWzW-0000000E8km-0c48;
	Sat, 25 Apr 2026 06:59:50 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGWzS-0000000E8ja-24AM;
	Sat, 25 Apr 2026 06:59:47 +0000
X-UUID: 549674b2407411f1aa26b74ffac11d73-20260425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:810e43dc-ea30-4cf2-8878-d40099abd163,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3da8c7107d9290cc6c015d2d1491a4c0,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|898,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 549674b2407411f1aa26b74ffac11d73-20260425
X-User: aichao@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1225850773; Sat, 25 Apr 2026 14:59:40 +0800
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
Subject: [PATCH 01/35] fbdev: matroxfb: Use safer strscpy() instead of strcpy()
Date: Sat, 25 Apr 2026 14:58:52 +0800
Message-Id: <20260425065926.1091168-2-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260425065926.1091168-1-aichao@kylinos.cn>
References: <20260425065926.1091168-1-aichao@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_235946_857237_AE5A229E 
X-CRM114-Status: UNSURE (   9.57  )
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
 drivers/video/fbdev/matrox/matroxfb_base.c  | 6 +++---
 drivers/video/fbdev/matrox/matroxfb_crtc2.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/matrox/matroxfb_base.c b/drivers/video/fbdev/matrox/matroxfb_base.c
index e1a4bc7c2318..bd786543478c 100644
--- a/drivers/video/fbdev/matrox/matroxfb_base.c
+++ b/drivers/video/fbdev/matrox/matroxfb_base.c
@@ -709,7 +709,7 @@ static void matroxfb_init_fix(struct matrox_fb_info *minfo)
 	struct fb_fix_screeninfo *fix = &minfo->fbcon.fix;
 	DBG(__func__)
 
-	strcpy(fix->id,"MATROX");
+	strscpy(fix->id, "MATROX");
 
 	fix->xpanstep = 8;	/* 8 for 8bpp, 4 for 16bpp, 2 for 32bpp */
 	fix->ypanstep = 1;
@@ -1091,8 +1091,8 @@ static int matroxfb_ioctl(struct fb_info *info,
 				struct v4l2_capability r;
 
 				memset(&r, 0, sizeof(r));
-				strcpy(r.driver, "matroxfb");
-				strcpy(r.card, "Matrox");
+				strscpy(r.driver, "matroxfb");
+				strscpy(r.card, "Matrox");
 				sprintf(r.bus_info, "PCI:%s", pci_name(minfo->pcidev));
 				r.version = KERNEL_VERSION(1,0,0);
 				r.capabilities = V4L2_CAP_VIDEO_OUTPUT;
diff --git a/drivers/video/fbdev/matrox/matroxfb_crtc2.c b/drivers/video/fbdev/matrox/matroxfb_crtc2.c
index 8de882b09a24..c20dd06c5fcd 100644
--- a/drivers/video/fbdev/matrox/matroxfb_crtc2.c
+++ b/drivers/video/fbdev/matrox/matroxfb_crtc2.c
@@ -299,7 +299,7 @@ static void matroxfb_dh_init_fix(struct matroxfb_dh_fb_info *m2info)
 {
 	struct fb_fix_screeninfo *fix = &m2info->fbcon.fix;
 
-	strcpy(fix->id, "MATROX DH");
+	strscpy(fix->id, "MATROX DH");
 
 	fix->smem_start = m2info->video.base;
 	fix->smem_len = m2info->video.len_usable;
-- 
2.34.1


