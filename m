Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20E2CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 05:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0iPmr2FZaFpGbv5xE0HK6353ex2Wmyxrb+8vBjR4oM=; b=L1VRCoVCKiRBW5CtuaR24uQGEd
	sVhPKcsOomwLvuXIDYxpIrLxLSwxdRRUdPvrwwTxwkP/YPRAUHASDjPTqfATtjKBg6LGVPwhyd4sz
	27AiKHfIuCkmbhaAivL9uZHuDsHKOZFxmiM5JNm/Tzqvqt/sOotS/ugGpuPNeWDZYhQ//hR3GbG73
	FMH2au15t7HIaAuZFC7yhmPH/+zxSkLC7FzhQ/J1YFvKFhaIEUV+QC8pK61UbD2fqqTeeBg8VS+Ge
	tXXCnWzdQUyGt7Gnjj/SF/jv8xVzkBPp75fxM4QSV+qiQnJNLP0KF2z/gByP5Xgh8LHthBZUK3Vpy
	OyS6NxHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDNB-00000000F2U-2eY7;
	Tue, 19 May 2026 05:52:09 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPDN7-00000000F0w-43fm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 05:52:07 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8354461da74so1322805b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 22:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779169925; x=1779774725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0iPmr2FZaFpGbv5xE0HK6353ex2Wmyxrb+8vBjR4oM=;
        b=lvJ4/ng1wzy+1+hW8PnujCr0JQeKyl8nkIbLhWWJgS7AG9Ocxh8wFW53cDu07GLq3U
         2eFyuunDWDzfwa+ch186d78pUm15BSO5XWDQ+L8NgRhCtDloUvYzya1YHDgxpGmybFy0
         CAoBxSIRW2NvM89h08rGOsOq42dhkwsGIDhtvjenW3gQ7xaV+SEYsAwCjndePxTi+oxs
         am21NhpBbohS7DnJOTA51QXeyHAiE9uPTKn3FyGGg8fwRGNniBCw6AxeDT2mRfuDGEZ0
         IefQhJ7WOv7QZ/nnG2SgE/sShFjC9LNS1+ISoMTkU9ZhRdFnl7MmPwTlK5R0tIUroGNf
         fPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779169925; x=1779774725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f0iPmr2FZaFpGbv5xE0HK6353ex2Wmyxrb+8vBjR4oM=;
        b=UXodZ0Qoqvxpf5GDM1q6hyHAVNCQH4j4TrjFSvOPiU/aI+8xTk2hod6aGTvQ6ekPEV
         eNT4+sBFaERgWxoKTnLen//SOfJPz7ymUH1n1BsAieZ2JZ6APDAggodX6N08Ab4is0xM
         jraCyXZnA9nq1hQ3ZhscnUR5kTlw/H3BeGr2+J8IS/oTIUNUetP3wRy+k6D99WX+wHlG
         XjkGzMKZeUdM2Auta392pfdP+A6zSZijMSs4gHLH0v8hjeXWGNkA3nkljaPtl8UgMHa4
         PFA8U3UjStFNnSvAgJ1C01FOJVTm+SH8/nqntAbMqPNYLY3WVIcTH5YzshwtGqm8OZMi
         V7iQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RmqWetpp0EtQopoTRCAlUiSL3s1hGNal+3gMdOVMoNle6gU0K6IzvsvXz4rSQC+jvmb5VvARYnAwbYp33XW0x@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0xl/Jzu8lfdw3bJjQqWxF4inaQANW5oMoorpC7ukGvCFojgva
	VbAPnFPJ939dsgCUU1K7LSHlULNfVfqnjSwRDxiR8QX0ZIXAEh7rKE5M
X-Gm-Gg: Acq92OEAwPvA6YOp3P0v0bCfTqsUojAcZGyvtRhXTvh9Wr2EetN5tpke2lDKpogwluv
	U/naMIvWtsQa8W46EC8hMib2GX/unqFeIJ2ZoqeaokCz9nL1wY9n2txBjWhIT6OSrYxa+20UY9l
	VYS2XwHESfZOTZV71fNSKKVPIufIgB/rAzbG3uK1ETg954bC1YiHfDk4wRPAVGcAfRRb5Hiu+Tc
	oHR0ZDgy5EaLf5/SAycHn6h0ZgSLuD+/QBBjxMgom9PYzgrUPtI4PcPbM8k0yxxX6VWbM8JTMpG
	e7vQvsghHMe6ahaYNVUvI50WNiEj1tLSgZqy1jPPm4qDwWot3A7XsDNiFHtszl2nkdder9JUdpE
	O4ac88ktGD2PhsDiKczVT/4z/9k8YvO70E33leELSbthzmAp98I+CJ+VlEPYjwlfSFFuJ3eDb+o
	xWjLjLSBck8BF7tZuzpyHkbD2pUcE/JeTGUAiPklc2eOOBF9qOuogRWQ1eA0w/OIdpVepVrNd71
	Ef76e7sLsJu
X-Received: by 2002:a05:6a00:2d0d:b0:83e:cc87:58f4 with SMTP id d2e1a72fcca58-83f339b425amr15909280b3a.0.1779169925063;
        Mon, 18 May 2026 22:52:05 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f8b9c2ea5sm2641252b3a.13.2026.05.18.22.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 22:52:04 -0700 (PDT)
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
Subject: [PATCH v2 2/4] drm/verisilicon: add model ID constants and DCU Lite chip identity
Date: Tue, 19 May 2026 13:51:07 +0800
Message-ID: <20260519055114.1886525-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519055114.1886525-1-a0987203069@gmail.com>
References: <20260519055114.1886525-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_225206_013042_3C4BDA33 
X-CRM114-Status: GOOD (  17.33  )
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

Introduce symbolic constants VSDC_MODEL_DC8200 and VSDC_MODEL_DCU_LITE
to replace magic numbers in the hardware database and probe path.

Register the DCU Lite chip identity (model 0x0, revision 0x5560,
customer_id 0x305) in vs_chip_identities[], making the existing
vs_fill_chip_identity() path able to recognise Nuvoton MA35D1 hardware
purely through register reads.

Also add three register-level macros for forthcoming DCU Lite support:
- VSDC_DISP_IRQ_VSYNC(n) in vs_crtc_regs.h, for per-output VSYNC IRQ
  bits used by the DCU Lite IRQ enable/status registers.
- VSDC_FB_CONFIG_ENABLE, VSDC_FB_CONFIG_VALID and VSDC_FB_CONFIG_RESET
  in vs_primary_plane_regs.h, for the framebuffer enable and
  commit-cycle bits used by the DCU Lite plane update path.

No behaviour change for existing DC8200 platforms.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h       |  1 +
 drivers/gpu/drm/verisilicon/vs_hwdb.c            | 16 ++++++++++++----
 drivers/gpu/drm/verisilicon/vs_hwdb.h            |  3 +++
 .../gpu/drm/verisilicon/vs_primary_plane_regs.h  |  3 +++
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
index c7930e817635..d4da22b08cd5 100644
--- a/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
+++ b/drivers/gpu/drm/verisilicon/vs_crtc_regs.h
@@ -54,6 +54,7 @@
 #define VSDC_DISP_GAMMA_DATA(n)			(0x1460 + 0x4 * (n))
 
 #define VSDC_DISP_IRQ_STA			0x147C
+#define VSDC_DISP_IRQ_VSYNC(n)			BIT(n)
 
 #define VSDC_DISP_IRQ_EN			0x1480
 
diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.c b/drivers/gpu/drm/verisilicon/vs_hwdb.c
index 09336af0900a..a25c4b16181d 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.c
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.c
@@ -90,7 +90,7 @@ static const struct vs_formats vs_formats_with_yuv444 = {
 
 static struct vs_chip_identity vs_chip_identities[] = {
 	{
-		.model = 0x8200,
+		.model = VSDC_MODEL_DC8200,
 		.revision = 0x5720,
 		.customer_id = ~0U,
 
@@ -98,7 +98,7 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.formats = &vs_formats_no_yuv444,
 	},
 	{
-		.model = 0x8200,
+		.model = VSDC_MODEL_DC8200,
 		.revision = 0x5721,
 		.customer_id = 0x30B,
 
@@ -106,7 +106,7 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.formats = &vs_formats_no_yuv444,
 	},
 	{
-		.model = 0x8200,
+		.model = VSDC_MODEL_DC8200,
 		.revision = 0x5720,
 		.customer_id = 0x310,
 
@@ -114,13 +114,21 @@ static struct vs_chip_identity vs_chip_identities[] = {
 		.formats = &vs_formats_with_yuv444,
 	},
 	{
-		.model = 0x8200,
+		.model = VSDC_MODEL_DC8200,
 		.revision = 0x5720,
 		.customer_id = 0x311,
 
 		.display_count = 2,
 		.formats = &vs_formats_no_yuv444,
 	},
+	{
+		.model = VSDC_MODEL_DCU_LITE,
+		.revision = 0x5560,
+		.customer_id = 0x305,
+
+		.display_count = 1,
+		.formats = &vs_formats_no_yuv444,
+	},
 };
 
 int vs_fill_chip_identity(struct regmap *regs,
diff --git a/drivers/gpu/drm/verisilicon/vs_hwdb.h b/drivers/gpu/drm/verisilicon/vs_hwdb.h
index 92192e4fa086..cca126bd2da5 100644
--- a/drivers/gpu/drm/verisilicon/vs_hwdb.h
+++ b/drivers/gpu/drm/verisilicon/vs_hwdb.h
@@ -9,6 +9,9 @@
 #include <linux/regmap.h>
 #include <linux/types.h>
 
+#define VSDC_MODEL_DC8200 0x8200
+#define VSDC_MODEL_DCU_LITE 0x0
+
 struct vs_formats {
 	const u32 *array;
 	unsigned int num;
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


