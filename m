Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9B8CFC28A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 15:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ms7drADWOhp5FF+YlrwB/RQPKWikgg0c4Q91oo4VjTE=; b=hxVDMPzrzGF6BX2F4t56cfDf2Q
	25wtZkM43P2w7KuLVj79LuxHoYb94hb2v0uCHFa99j2AB/wpBmGObZF7dwgVDCPTsoQEDD2921rRA
	qvFKMmSpv3wbd77+VUXTUhYHdCB8UZszJiLvjnUOuuDsqurZjfE5VyluIlIkfi739j7r3UOZB5tOj
	NLb4gyndJGoKaVgwaxNZfhttSnFSzZjhtMBGBLoioXgOHz5ylgedWDukpI5FIvxdH/Wk6J5k3BSa6
	MZdw60xUNvACcN19fz/ZH9/d7/ysP0Y4aTlG8G9GldhvLmPsEwPaTgLeaAPawWQ2guj2Bxo76hy/E
	IG+kitZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSj3-00000008Zcu-2K0G;
	Fri, 21 Nov 2025 15:07:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSix-00000008ZZ5-41ZL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 15:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763737619; x=1795273619;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=H4lz9IzPucH+8/psNxpuZMlk/rvyrt76Wj+dwW/qyMk=;
  b=j3SbsQJTfrppk3fFLIyrAFLVC6qvn1LCZMrjHHk7svuHx60bSPF6RGTY
   xGoVTjyB8HijIBLiZXCwLncfLAlRR1JLYIKuGXqL5V7NwQjcT307W88w1
   jkOkdkRbs2sM5SgYzbod/dkqolLY6y8oL6GY3q3Gm/wRXheZwQUzFBDHE
   29zuqPkB9GQ00ZGsre2OiPQaj6kYgpR0AtPoJrnscN/Lz334bgZqldApW
   RLMDVVW8DinaNAAz6ZZFUSlTRwKmYFsfMiecRexGvM91KASOrMX1uLbyt
   sW2QQZQqJnMed3mCCr5sVCJwO7oscNe2xk1nVnG/PFP/CdH8OtRop5Hx5
   Q==;
X-CSE-ConnectionGUID: ZsY1rJHWSEWAtJuR27K+Sw==
X-CSE-MsgGUID: FAbZxFmwRbawMQ6bpWHzsA==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="280874265"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 08:06:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 21 Nov 2025 08:06:36 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 08:06:33 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 21 Nov 2025 16:04:38 +0100
Subject: [PATCH 6/8] drm/atmel-hlcdc: use drmm_crtc_alloc_with_planes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-lcd_cleanup_mainline-v1-6-2587e6fe4d67@microchip.com>
References: <20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com>
In-Reply-To: <20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ludovic Desroches
	<ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=H4lz9IzPucH+8/psNxpuZMlk/rvyrt76Wj+dwW/qyMk=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpIH/WvQ+yKU/V0bCvhBe3QkiKGab/zxKSO67yQ
 V2J4Nrv9HSJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaSB/1gAKCRA+OeYT93tk
 LXvLEACMR3bqdjvPH6YVQa6f9eIZI3LVryIGJh4oyiS12BRH7kz0saV4kiMJnupWYgf3nTomHrh
 HAcjC4DVLNpxXVbcAIWzA3NkzyF+/csAMT80dDc9dW62SXTzS5leuZuxVQlR+zUNqEpHJstSDkO
 Fnn4uNR6CkW0DFa015qMR9S5VyOqF2iY8oMYpNgl/H+vxeG1v0oS/5ERHR6IHnZPsvLCQNOfpUF
 JzmtVDqbpevkm/+trp+c6MTxEz0jzIObXPVyZB4M1Yz99Bi3TEhgC63hdnwB7/EmASzoOsFyMU9
 9h4F8qQDIHgYGkQVFJMGfcgvByTW8Wgo50pXQIMEB8BXnfd54NnZXee6iKnPPvTBsIZckeYLPhs
 YEuP/tvVmHDaTRdBZib6l6rr/RTNvMZi495cAvLfe7n0bDgpetCq46mfrhjEFUoRACmXvlRh0hk
 QKOOzK8EohrpJpiJpBsOsemQdlcXLb/H4rmKzMFRGQnlQkF/sZm0XijEbXaO8AlQUBfWBnh0CMh
 2MJYUVfsQ4safYE3saagxy1ppn7864Zsg/9F3p2ovYXeraEC7+ZNNBqpB2GlPlGw6Gx/+QkG1Nd
 k/t8yizkSZp376OmP3HGuxNNFrrc1HWzVFEPN+f5iDYjunPMTtpD+TCfz2OdYW2tET4n32viH+C
 VFbZTapwgb4FlEw==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_070700_020869_F3B3B2E1 
X-CRM114-Status: GOOD (  14.94  )
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

Use drmm_crtc_alloc_with_planes() to simplify the code. As we no longer
have to take care about cleanup, we can get rid of
atmel_hlcdc_crtc_destroy().

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 32 +++++---------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index e0efc7309b1b256520eff29462431476f8589255..b075f291847f9eb91e07b7844382871f38ed5f81 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -509,14 +509,6 @@ static const struct drm_crtc_helper_funcs lcdc_crtc_helper_funcs = {
 	.atomic_disable = atmel_hlcdc_crtc_atomic_disable,
 };
 
-static void atmel_hlcdc_crtc_destroy(struct drm_crtc *c)
-{
-	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
-
-	drm_crtc_cleanup(c);
-	kfree(crtc);
-}
-
 static void atmel_hlcdc_crtc_finish_page_flip(struct atmel_hlcdc_crtc *crtc)
 {
 	struct drm_device *dev = crtc->base.dev;
@@ -607,7 +599,6 @@ static void atmel_hlcdc_crtc_disable_vblank(struct drm_crtc *c)
 static const struct drm_crtc_funcs atmel_hlcdc_crtc_funcs = {
 	.page_flip = drm_atomic_helper_page_flip,
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = atmel_hlcdc_crtc_destroy,
 	.reset = atmel_hlcdc_crtc_reset,
 	.atomic_duplicate_state =  atmel_hlcdc_crtc_duplicate_state,
 	.atomic_destroy_state = atmel_hlcdc_crtc_destroy_state,
@@ -620,15 +611,8 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
 	struct atmel_hlcdc_plane *primary = NULL, *cursor = NULL;
 	struct atmel_hlcdc_dc *dc = dev->dev_private;
 	struct atmel_hlcdc_crtc *crtc;
-	int ret;
 	int i;
 
-	crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
-	if (!crtc)
-		return -ENOMEM;
-
-	crtc->dc = dc;
-
 	for (i = 0; i < ATMEL_HLCDC_MAX_LAYERS; i++) {
 		if (!dc->layers[i])
 			continue;
@@ -646,13 +630,13 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
 			break;
 		}
 	}
+	crtc = drmm_crtc_alloc_with_planes(dev, struct atmel_hlcdc_crtc, base,
+					   &primary->base, &cursor->base, &atmel_hlcdc_crtc_funcs,
+					   NULL);
+	if (IS_ERR(crtc))
+		return PTR_ERR(crtc);
 
-	ret = drm_crtc_init_with_planes(dev, &crtc->base, &primary->base,
-					&cursor->base, &atmel_hlcdc_crtc_funcs,
-					NULL);
-	if (ret < 0)
-		goto fail;
-
+	crtc->dc = dc;
 	crtc->id = drm_crtc_index(&crtc->base);
 
 	for (i = 0; i < ATMEL_HLCDC_MAX_LAYERS; i++) {
@@ -674,8 +658,4 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
 	dc->crtc = &crtc->base;
 
 	return 0;
-
-fail:
-	atmel_hlcdc_crtc_destroy(&crtc->base);
-	return ret;
 }

-- 
2.51.0


