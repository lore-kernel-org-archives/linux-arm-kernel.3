Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A56AFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 07:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1WuKOsdH/zAgho/qFcGrmJsFZaYaI/4fEv0cItggHo=; b=i+O4KHbtMJiphb4yPYEjGlNRdN
	6a5RVXY7CICLn0qXiLfoK8fCZWnxjp176X2FaO1mTHv9x7mg459Q0vB/acFkuPBLk3j75id00T9hu
	MY11B3V4nyCZ7SEjdhCKjBmMSruu2ZYRAVSt8TldISnnIs3zmHBK9poSErDvUTW2HYB+/OaQdd2WK
	LK2cgiZm1GJX8gmigvHIcN6kumhyBqqHli8Zaenn+a6/c4UgkSii8qZnWqOSBS2Fz094qiKy64PVQ
	+Ah6kb3kxuxJVnB0bWD0ojWGn5Xf/dzjAGBujjtUbass2lcXKZTzL0m+qJ75EfUUdHsDWeTnLAq07
	ADt/6/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGWzn-0000000E8u1-2dN1;
	Sat, 25 Apr 2026 07:00:07 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGWzd-0000000E8lF-2DGS;
	Sat, 25 Apr 2026 06:59:59 +0000
X-UUID: 5c11cf7a407411f1aa26b74ffac11d73-20260425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:700b046f-a4fe-40ed-b688-e789afee0875,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:3f8a7e80e46a0360510c7e23c4deab8f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|898,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5c11cf7a407411f1aa26b74ffac11d73-20260425
X-User: aichao@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 589308069; Sat, 25 Apr 2026 14:59:53 +0800
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
Subject: [PATCH 05/35] fbdev: atafb: Use safer strscpy() instead of strcpy()
Date: Sat, 25 Apr 2026 14:58:56 +0800
Message-Id: <20260425065926.1091168-6-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260425065926.1091168-1-aichao@kylinos.cn>
References: <20260425065926.1091168-1-aichao@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_235958_266439_0B81723A 
X-CRM114-Status: GOOD (  10.51  )
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
 drivers/video/fbdev/atafb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index b8ed1c537293..5f2d50919718 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -555,7 +555,7 @@ static int tt_encode_fix(struct fb_fix_screeninfo *fix, struct atafb_par *par)
 {
 	int mode;
 
-	strcpy(fix->id, "Atari Builtin");
+	strscpy(fix->id, "Atari Builtin");
 	fix->smem_start = phys_screen_base;
 	fix->smem_len = screen_len;
 	fix->type = FB_TYPE_INTERLEAVED_PLANES;
@@ -851,7 +851,7 @@ static inline int hxx_prescale(struct falcon_hw *hw)
 static int falcon_encode_fix(struct fb_fix_screeninfo *fix,
 			     struct atafb_par *par)
 {
-	strcpy(fix->id, "Atari Builtin");
+	strscpy(fix->id, "Atari Builtin");
 	fix->smem_start = phys_screen_base;
 	fix->smem_len = screen_len;
 	fix->type = FB_TYPE_INTERLEAVED_PLANES;
@@ -1770,7 +1770,7 @@ static int stste_encode_fix(struct fb_fix_screeninfo *fix,
 {
 	int mode;
 
-	strcpy(fix->id, "Atari Builtin");
+	strscpy(fix->id, "Atari Builtin");
 	fix->smem_start = phys_screen_base;
 	fix->smem_len = screen_len;
 	fix->type = FB_TYPE_INTERLEAVED_PLANES;
@@ -2069,7 +2069,7 @@ static void st_ovsc_switch(void)
 
 static int ext_encode_fix(struct fb_fix_screeninfo *fix, struct atafb_par *par)
 {
-	strcpy(fix->id, "Unknown Extern");
+	strscpy(fix->id, "Unknown Extern");
 	fix->smem_start = external_addr;
 	fix->smem_len = PAGE_ALIGN(external_len);
 	if (external_depth == 1) {
@@ -3100,7 +3100,7 @@ static int __init atafb_probe(struct platform_device *pdev)
 	}
 #endif /* ATAFB_EXT */
 
-//	strcpy(fb_info.mode->name, "Atari Builtin ");
+//	strscpy(fb_info.mode->name, "Atari Builtin ");
 	fb_info.fbops = &atafb_ops;
 	// try to set default (detected; requested) var
 	do_fb_set_var(&atafb_predefined[default_par - 1], 1);
-- 
2.34.1


