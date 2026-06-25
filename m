Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B23CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zG+ncOED8kJvI4v12/W3LY0+BgurY5fCH2pouNtIlDQ=; b=tcOhDSQ44W91ZJBSrGi1Ro1Dor
	6Cp0YVbiojwu/ZE7mxSzVVJSBZAJe6dHFjDemVAu6YKzNjS1Am9ncAiHmSl8NnjXSNiiM9aZCnuj2
	e8uN4pq9rb1TxpnWNSt8J3Y0umBPD9h0WXlTjTFUvfE5pbx2HegZ+hYsQdaTXO2ks2uf8q2ikvBBZ
	t3x8ZNWv2U37Yx9++Wqfp+cBGJAeE7azSVXdXfybR4UdIaH4cOKQwDDCfgiJTTC+kdbkwUiDEZXiX
	UYPIQp7jD73g2tRMqunGIZFb8nTEOhPI3Q7NJuW0xXhUT2DA8Q+prsr0GEapNJNsH9BfsZvjgZLKE
	XzCkKDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgdy-00000008vmO-0HPz;
	Thu, 25 Jun 2026 09:45:10 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgds-00000008vkC-4AIB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:45:06 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-37c6cd1ac98so1725102a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 02:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380704; x=1782985504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zG+ncOED8kJvI4v12/W3LY0+BgurY5fCH2pouNtIlDQ=;
        b=Jcn1r25iU66FNyvFvonqwRkVrH9IyuGja/ekRnm9NR8W42etZ2/VOYw8xCjxiUDR5M
         EJeumPqymQskXv9iSvIVfz79hk5qLefOFI5g+Jc/HO3EVJEikmICTlUW5+EiQgWrBN9P
         pVs8L+oBZLFbhx5aueyfpCupS7NmC5EesDqPML8E10eVhdn+js9DHnrxB0jd6WNsgZ7c
         BBedbxYXY4DbcxSKEBSVIpnXtWRxWTIpB7z9Bt04YtRwR/066eLy/zf5ptubcUo6PnRY
         5jcu3Z//HhOIu2ygljHh2gFURHEBUMeJyjQmRH2ncfoUGGweW4dD54HIKCqVnai01cCk
         ttdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380704; x=1782985504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zG+ncOED8kJvI4v12/W3LY0+BgurY5fCH2pouNtIlDQ=;
        b=pa9PhGemFO9nQpJBAPpbti6OHdPiuOD6Kd2BVc5fM2mQjs8Gq+PCW7tqNQGW6KQluo
         zu8Nwf0LGSa9C8msvl75Ci5UmShE1jau9YTyrG1vKVXov+5sqZk1gbDELZ8N6gNQI6X4
         Jxu1Li9YH/kTWzc/uVJLqBhbAeNF/II/v7kBFl/MvikXb7DfXutmJLxlXoGsJvNXfhKi
         x1mgPXF1afBKyvMFtc1vNIGyg7okmBlNTQCRoJPe9yc7XO8fVXqOwEO2/Dk+46HxIpqh
         JpvmMEi0SU1TxsyORvtAXJ3g+LD6cIwnekCjgezbiYoeqA+JL9+TN7ovfi2sF8o40ONL
         p3tg==
X-Forwarded-Encrypted: i=1; AHgh+RpNOIgZmg3Xg5FZ5l4qE8ntIXZ6JUDGjD5DXegzjgY4XtjrWDfwjZb3XdZw+C76MFFDqRTm1Gb8P0qus39yVAKC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7/A6+1zbAbrAPYgdlv+frSq3YFf5ob4PZPCGqt3pgEPnad+mh
	892IIPkqMD7GSxqLlvhh6QiM2NUYHN0noVxvCQH+4qdk/VoSPbz996xV
X-Gm-Gg: AfdE7ckWkNEVEeEN3ZaTsyB1OkVn0fWVJiT1sQe2ULXYkjtyBbOPL58BG4uRi/byPQ3
	Ysw2w0sWuWCGpe5uiCumWR39Hy/UA/F/v8fZjOmZDZAWSYxSj5G8stQMEcSXK+N3sObekmJE7pk
	nucrVP2COyMPuBushkajhqZvM3k53TvZz8b2eVj+ui4PnPCiP78iMuujWofj+zFueIdjIc90BL8
	F/vTcXqnZ5V53Um3iix9qjQIJYD/T/OsgzEv6VU7N1znH9yY4pFFNFpWz0a0TpmFcMeyYY8oLl8
	xiMJIzq+FRjT3cngjBlghXVOyHNgDxT7rRAN2G7XHRgeskfWQrzcdVUFI5CLFBWiEMVR8Qi3YZn
	Zw0GLFc6oRVWM5+N1dlyFHsL9rp9ckWzOcLTrqcmnxIkO4D+e46aCg54dnyUgbHsEdFdpN/fIIL
	Hc3Ed33nn59HsZLLC+u+jZj/1+o04nGeQDtzAjbEdm3MTcxBZyy+uK4E4aZsaGP70J5EkbdVbV7
	Q==
X-Received: by 2002:a17:902:fc4b:b0:2c7:e318:1d86 with SMTP id d9443c01a7336-2c7fc6545f7mr18443535ad.1.1782380704007;
        Thu, 25 Jun 2026 02:45:04 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8c26sm16614995ad.1.2026.06.25.02.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:45:03 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v5 2/7] drm/verisilicon: add register-level macros for DC8000
Date: Thu, 25 Jun 2026 17:44:44 +0800
Message-ID: <20260625094449.708386-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625094449.708386-1-a0987203069@gmail.com>
References: <20260625094449.708386-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_024505_056852_FABF36EF 
X-CRM114-Status: GOOD (  11.20  )
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

Add register-level constants needed by the forthcoming DC8000 (DCUltraLite)
hardware ops:

  VSDC_DISP_IRQ_VSYNC(n) in vs_crtc_regs.h: bit mask for per-output
  VSYNC interrupt bits in DISP_IRQ_STA (0x147C) / DISP_IRQ_EN (0x1480),
  which are the IRQ registers used by DCUltraLite in place of the DC8200
  TOP_IRQ_ACK / TOP_IRQ_EN registers.

  VSDC_FB_CONFIG_ENABLE (bit 0), VSDC_FB_CONFIG_VALID (bit 3) and
  VSDC_FB_CONFIG_RESET (bit 4) in vs_primary_plane_regs.h: control bits
  in the FB_CONFIG register used by DCUltraLite for framebuffer enable
  and per-frame commit handshake.

No behaviour change for existing DC8200 platforms.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
Reviewed-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h          | 1 +
 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
index c7930e817635..d4da22b08cd5 100644
--- a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
@@ -54,6 +54,7 @@
 #define VSDC_DISP_GAMMA_DATA(n)			(0x1460 + 0x4 * (n))
 
 #define VSDC_DISP_IRQ_STA			0x147C
+#define VSDC_DISP_IRQ_VSYNC(n)			BIT(n)
 
 #define VSDC_DISP_IRQ_EN			0x1480
 
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
index cbb125c46b39..67d4b00f294e 100644
--- a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
@@ -16,6 +16,9 @@
 #define VSDC_FB_STRIDE(n)			(0x1408 + 0x4 * (n))
 
 #define VSDC_FB_CONFIG(n)			(0x1518 + 0x4 * (n))
+#define VSDC_FB_CONFIG_ENABLE			BIT(0)
+#define VSDC_FB_CONFIG_VALID			BIT(3)
+#define VSDC_FB_CONFIG_RESET			BIT(4)
 #define VSDC_FB_CONFIG_CLEAR_EN			BIT(8)
 #define VSDC_FB_CONFIG_ROT_MASK			GENMASK(13, 11)
 #define VSDC_FB_CONFIG_ROT(v)			((v) << 11)
-- 
2.43.0


