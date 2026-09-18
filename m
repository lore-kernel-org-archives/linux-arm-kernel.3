Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98733C982D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 03:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1MvCbfjotTiPMU9xzuQx8OmetQMTdloo3vQR2iBJfs=; b=ePFU3u6irz6Vw4MM0XNXqZuv6m
	x1VnxBXXy5wtt5QGMjW+6n8RL5XoZ0tXEvmIE3gTHeKXAHJ1azOBflkvq0DOF1A/42/JTxlYVPP4k
	qeoo4GVRiTyjKNebSk81sCoR9/t4AB9aLBnKPvGML2I7zhXOVEMnF994SAp71ax8geqnBb3jrh64v
	rHZucmkadQL4OPq5xOnRwA94sIPDqjzY91afjGahDoR+UBO4Xnn/0YSZqXri8Ono6+5Ek6qfLGz1P
	IkuM2P3kX/rtklgg/69U9QtCsBVMF0tkhUu9BaoK2V8BTKYNT6OQlLDSq60kZaFvzQcO+z0VCNwJU
	Ps7Ynwbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OrE-0000000DM28-2dQ5;
	Fri, 18 Sep 2026 03:01:48 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Or8-0000000DLzX-1G1L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 03:01:43 +0000
Received: by mail-pz2-x0c.google.com with SMTP id 41be03b00d2f7-cc5256c2a4bso112077a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 20:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789700501; x=1790305301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d1MvCbfjotTiPMU9xzuQx8OmetQMTdloo3vQR2iBJfs=;
        b=IBDiJozF9oVD3E7pkFY5gmB6XPIlyENnB8+Fr+Om9hcX8ll9JC6CJbtmnuRHPmYl7O
         UsOvKgSatb4d6ojG3VZaLUxefw8ZW07wJNsEXxtf2VEtdVyEP2Bq5ngge4bb2vZKb7LI
         HAQq5tWL8A9ep3gevfUozQhH6onKyUicbXnrlh2yGMNCzQqTgzAK8ntERU72gBhBNert
         SL9+ibUhP7iEXQIkywnChw13jvB2geSFMzzNRwT4LulR82uoG6KLHrBy7IWjXIzx1Wl6
         NAXDp7UrT4aZdQS+53T5cUn9DKaiCYczXmm3yuHcaxikeLsbG9U7JhtnkA+6xicmO1Sx
         DCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789700501; x=1790305301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d1MvCbfjotTiPMU9xzuQx8OmetQMTdloo3vQR2iBJfs=;
        b=VfkFdHs0oKUCnmPkgMn+cO+Jzx1lIxH2eiMAC6Bt4BKES4U1vlTD5GUXSUZx+sUGr5
         qoIr6sgYbKLjk7EwUp5QFn+ut4qFlt80XvmPq/WT5uxLHQkHjC0MdMq8pK03NjbZ5ozR
         UVViXtUnNUuuk2NOlR7OdZf7fK+m9EibTDGVnbr3oSCxffjfsdxCpSAZtEHZziGh/Khr
         ZuuAUD6/BIGRRW4z6cjBdyYlnUiuPbpBZnr9VuchXaBKcsDLGt9pHeSvlG/rS3OKnX7z
         f0XmXWOdvBvoCQXrOep0+quzZLJqobVfcmtfNY2l9g1IMERyQ1UDjSpLbFAbpzWExiXX
         MKMA==
X-Forwarded-Encrypted: i=1; AKwUvBxV3J2l0iNjHElxHvmONsiW6+WdE46OUBrPgIDrKrDNLHciijr7TNhRN+pIkkLG/6mcbsjJYaJUMokYyRne5ETj@lists.infradead.org
X-Gm-Message-State: AFuF++mGePBnR8V4TpV2YKLTz/SC+2N0XnaeREb1/jwZYsUlZxzIj1nO
	4ENy2NjpP7ekzaqJJTbpxoApJaQR0cgg1o+K3gjMJSxMA/qm1xuCxig+
X-Gm-Gg: AYBFou0CjU794jBlfvpCNz1ODmuQ3GITHmTyznQbtPJlmGCsVQliYPjO62JjstBjV6p
	Fk30oTHmg4B7+dy9rUcAtE+WJfbFbIYfrKioNJa47sDiSQczWBW7ClzQUVgPKfkBWuNjrSRIgb2
	zsiNnZI75emxjr2/sxyAYhJQI9EhJ5q4CFBZKVxbPSu388xQsLF5FNbH794gYvS2bjIeSLYCFPV
	L/PxDGD5xNo6S3LgCS50FBv36aj0udNaZrXV/n3Ol2WgMDjYBLGWjX7HDbHvdlz/VRHb1b+r9mO
	T8gPN6twfFANiDmyNOPMIAAVrm2jf+wo3LBHLNbfgZ0gnOP399TlHikukvhFkH/oL8FwKm29plv
	Rheb3zb80bdysDjTO9EF9zMPBEMmDUy6GifmryS9SpX1mctErXs+Vp80OM+sTBzVymikkZGlb5Z
	7GiX7cuVh3GZGd39xCx4nULWKyg4IBOZQwwcHUB8D10FlxdaWx2m8J+tgCSBDdV8IDQWHpFzHTo
	Dejvl1/o8zUUOj5HFR1F36mqRYo8+ZW07nBX/lgJk3LMOeMAncajjDXNw3XWiI=
X-Received: by 2002:a17:90b:17c1:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-39e54e3f526mr2301890a91.20.1789700501279;
        Thu, 17 Sep 2026 20:01:41 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e362e9402sm7969141a91.15.2026.09.17.20.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:01:40 -0700 (PDT)
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
Subject: [PATCH v7 2/7] drm/verisilicon: add register-level macros for DC8000
Date: Fri, 18 Sep 2026 11:01:20 +0800
Message-ID: <20260918030125.315978-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918030125.315978-1-a0987203069@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_200142_362702_5D2BBB0F 
X-CRM114-Status: GOOD (  11.07  )
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
index c7930e817635c..d4da22b08cd5c 100644
--- a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
@@ -54,6 +54,7 @@
 #define VSDC_DISP_GAMMA_DATA(n)			(0x1460 + 0x4 * (n))
 
 #define VSDC_DISP_IRQ_STA			0x147C
+#define VSDC_DISP_IRQ_VSYNC(n)			BIT(n)
 
 #define VSDC_DISP_IRQ_EN			0x1480
 
diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h b/drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h
index cbb125c46b390..67d4b00f294e2 100644
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


