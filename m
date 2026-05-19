Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C89CD5BA3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qm/E9Pt3R9ewZAoete6Li0nhFA1nu4Af4vuT4CJZHgY=; b=mMfZsFRLq1Dem2O2xQHDeHHhMH
	FVKiqm+Cs5YtdbKb0kPFpfTbGKjU++cJe3xXn89DP+b7J2Zaqecjmsp6ASW4L5eSvkc1TSVYgHhnT
	WuQgFxJ3wyTVyFEjMnghdS4ZSyY9nj6vkOy7vrI5zp4s+WGD9sUWwH1PVXHO/YuRlQqmxrVGACoD4
	mi03HiWbGI5b5j9RyrzbIrJ5LrWlLQWYxanzhRKpag99nibDaM1JmhOgTukxVYnf/Z5ydzoHysA0a
	LHltzsNmLMoHgJSsFf5WHdi5UfP9Nux6OSZQyQUuK/A66iz41DEgFO/3x+L8TxNfoznwoOq1yLWmf
	h35zcY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGL2-00000000o17-3xQ3;
	Tue, 19 May 2026 09:02:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGKx-00000000nyU-2OTR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779181323; x=1810717323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rhtk3UHiok35VYYKD9BOmc0uxi7SU8cweGiDLJAn7QA=;
  b=WenCjfy1rB6QcwOHQFLKf55MoRJDXCDNL8YXiZ/MvWGe4n4UjmfcfToQ
   Y3UWTwq0y1k6UoujVPn1a76zrjUar3zTyMKYuRnHuGwGv3CNGGsniGsPc
   7I3oZtlEMCp/pc+kM3tqY1HkR6LB9jRdhTgpNgPMUaHagTERUWxFENIHd
   DCxr/C5U+czKHJRHiN2SyEr9MIbDatexm/II2x1HV2wrTV+igM17HuUgP
   gyGGIctEAUX8XpHvvAeGBLbf0WJzZKN2r+01zaNlVPzbF9RryTIaitzUk
   HrEY+T/D2/xPWHA9XtMVRRHxkSNLbJ2i4Bq1/NkUE7CxlaM8gnAvw+WkZ
   A==;
X-CSE-ConnectionGUID: b7vQNrk0SQqFRm/UpQcq5g==
X-CSE-MsgGUID: mUtGWRVxSuePW+9W86cFUQ==
X-IronPort-AV: E=Sophos;i="6.23,243,1770620400"; 
   d="scan'208";a="224955533"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 May 2026 02:02:00 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 19 May 2026 02:02:00 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 19 May 2026 02:01:56 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <manikandan.m@microchip.com>
Subject: [PATCH 1/8] drm: atmel-hlcdc: Fix off-by-one in vertical back porch setting
Date: Tue, 19 May 2026 14:31:28 +0530
Message-ID: <20260519090135.1188405-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260519090135.1188405-1-manikandan.m@microchip.com>
References: <20260519090135.1188405-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020203_668181_E4D1FA05 
X-CRM114-Status: GOOD (  10.60  )
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

The vertical back porch field in ATMEL_HLCDC_CFG(2) was programmed
without subtracting 1, unlike the other timing parameters which follow
the controller’s (value - 1) encoding requirement.
This results in an off-by-one error in the vertical back porch timing.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index 9dbac2def333..7932d666e9ec 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -115,7 +115,7 @@ static void atmel_hlcdc_crtc_mode_set_nofb(struct drm_crtc *c)
 		     (vm.hsync_len - 1) | ((vm.vsync_len - 1) << 16));
 
 	regmap_write(regmap, ATMEL_HLCDC_CFG(2),
-		     (vm.vfront_porch - 1) | (vm.vback_porch << 16));
+		     (vm.vfront_porch - 1) | ((vm.vback_porch - 1) << 16));
 
 	regmap_write(regmap, ATMEL_HLCDC_CFG(3),
 		     (vm.hfront_porch - 1) | ((vm.hback_porch - 1) << 16));
-- 
2.25.1


