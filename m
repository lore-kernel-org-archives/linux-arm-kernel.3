Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D945ACCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXU0lA92EHkEs0FtjULZEXbKOVq9qDFg6rNlzzGZSxo=; b=MDXjvIAb/5uWb25ZLZ26w9QyUO
	yirON2XNcTYosqbqUFIuDGQVt91K6N0bxXY9doZDDLN4F1wVhIA4Mc7thrDHG006kfZ8W2c8mY+xM
	3BO8Xr88nVbLuQLYsCzLFE5nCk/2Uex4LBVTY7+/ISMxbj4FA4Ggq7+WetyQZYkNp5Ke+QBJhoM6C
	X+J7tlHJesu7ki/4riuKo8IdobYzehuW8PdEGFIakgcFUkUFV3BMXfcPiUUM9LB53IoIDputNOoSH
	jSvYSn+G4v0wwUYwjMUsHS7ixZUS4+SURh5PaZdxhk9/v3RGXlMZH2bQvR2bL/660zU9TL/qFg93Z
	4bopY8rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKS0-00000009vr4-46Cz;
	Fri, 24 Oct 2025 16:15:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKRy-00000009vpr-2qVa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 16:15:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1761322534; x=1792858534;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Ye+1OgDsV3hofhysTu3llBemLnj0SYcczHdcxdTpuJU=;
  b=UCDGU+KHJptdxQHD7xmykTxpbFWihzN6JvDCBAvdGkG35IQBrgkhW7sw
   jsuNlK9wPHAjZaIVpmdInY3V2yaB6mb+dEHYbV58XSG6hiLeF+4V86q5g
   xQ4kS93kwc7qv036lURZdyxPKc7QsGn71V0w3kVRAGoAx+xQ2TrHmgE/T
   VQkD/y5AIyWtLc5W5os1WOeEr3rS9E2a4YY2aaIAdN4qRlbAt83p94eea
   ZIDuXWf0ZHJsxQiN9AUIeryRQC+e4GW3Fz9cXQSEzPqrIMZs43B2GjSJv
   knKwxyK2+LygkzW9Z5bz45WW20FLIUl43ID5+OH6KfeC9yA6yoojCEn9p
   w==;
X-CSE-ConnectionGUID: 1/m7iX3mTEmbXSXQqSy26w==
X-CSE-MsgGUID: M9e7ECHyRE6DkUixFINKjQ==
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; 
   d="scan'208";a="279593465"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 09:15:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.27; Fri, 24 Oct 2025 09:15:07 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 24 Oct 2025 09:15:04 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 24 Oct 2025 18:14:52 +0200
Subject: [PATCH 1/2] drm/atmel-hlcdc: fix memory leak from the
 atomic_destroy_state callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251024-lcd_fixes_mainlining-v1-1-79b615130dc3@microchip.com>
References: <20251024-lcd_fixes_mainlining-v1-0-79b615130dc3@microchip.com>
In-Reply-To: <20251024-lcd_fixes_mainlining-v1-0-79b615130dc3@microchip.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1844;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=Ye+1OgDsV3hofhysTu3llBemLnj0SYcczHdcxdTpuJU=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBo+6YFiiXMWk3mplc/BGCijj5ax86wdqhksaGuW
 hNxRaTn8C2JAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaPumBQAKCRA+OeYT93tk
 LY4VD/44mHe4MCTiNN4c0wLHjPbI3rXL5n3qpsTZhc2sAir3RBPvtbK/RubX4KiPl06OpcTv/R4
 4sJALsnk6LPhaRFRxSRvDfMeaPVerxfznYzXuVPKSqBc9x9ckuGGSsIyFTemOFr5IbNE5oo6ur5
 /u2T3IjfFUGlXm+/y41EDK/LgS6n+A/5qTJLM7Qc/FwCksPTuTe5m+nZD3jvKPAv1kU5BE80/u5
 eBavcrrwqShVBzlyg4vjzA5fTA4L9tMuH5tFLZLz60KApobeHgu5ERqwIqb9RWW0FWoQP3VGOXn
 xiyWSCxYkVCkxyKbU+i/zCl19KBzpn1joN5bJjFTXbzMkwFfwUt4wsl+lUQxQeuAXRS+xn88mKT
 +GnSADkh1zlVwGXHZTFBLIyUOFGFV6ehD8dgyHs1bf+mz9Vm9AGqczxLtPinyYZgOhGlWCcndyJ
 SYIW+uxdZC275mz18pId54qp4T0YbLMudSHD0yAKHJ97zzk7gPDfgdPp/wy/sg5JC4OcwxlyWCw
 u65a2sdwWWxnR6sfnjPwoYUK0mFrLt2PvorOamQwMlmNTaH9eQQi8Z6g9s5rd4zrcgQY8NHiiqY
 /AGHlCZ2PfzkE0hWzDUFPoDkRRC8J6nboyy8DeP7MIo09ic6eQO+xbHeyOXTbR7aj8UVxteBs29
 cp+Pd9cUOivBfaw==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_091534_728686_612BDCEF 
X-CRM114-Status: GOOD (  11.05  )
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

After several commits, the slab memory increases. Some drm_crtc_commit
objects are not freed. The atomic_destroy_state callback only put the
framebuffer. Use the __drm_atomic_helper_plane_destroy_state() function
to put all the objects that are no longer needed.

It has been seen after hours of usage of a graphics application or using
kmemleak:

unreferenced object 0xc63a6580 (size 64):
  comm "egt_basic", pid 171, jiffies 4294940784
  hex dump (first 32 bytes):
    40 50 34 c5 01 00 00 00 ff ff ff ff 8c 65 3a c6  @P4..........e:.
    8c 65 3a c6 ff ff ff ff 98 65 3a c6 98 65 3a c6  .e:......e:..e:.
  backtrace (crc c25aa925):
    kmemleak_alloc+0x34/0x3c
    __kmalloc_cache_noprof+0x150/0x1a4
    drm_atomic_helper_setup_commit+0x1e8/0x7bc
    drm_atomic_helper_commit+0x3c/0x15c
    drm_atomic_commit+0xc0/0xf4
    drm_atomic_helper_set_config+0x84/0xb8
    drm_mode_setcrtc+0x32c/0x810
    drm_ioctl+0x20c/0x488
    sys_ioctl+0x14c/0xc20
    ret_fast_syscall+0x0/0x54

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 38f60befd7d759a52d66211c2e7d49c9be235ad4..0e38587b868d5b5375fcaa5c0508e8e5690d8ff8 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -1215,8 +1215,7 @@ static void atmel_hlcdc_plane_atomic_destroy_state(struct drm_plane *p,
 			      state->dscrs[i]->self);
 	}
 
-	if (s->fb)
-		drm_framebuffer_put(s->fb);
+	__drm_atomic_helper_plane_destroy_state(s);
 
 	kfree(state);
 }

-- 
2.51.0


