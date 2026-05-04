Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFCCCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 11:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eIoXQIVw/Vuj4jbZ/QrXIRnsUY3etOFhZ4gnsuho/XY=; b=3Cx4q/xoRqol2zib2hcIZ0Hreu
	G0QwVaVu++aPJXk09bpLA2hxxhBjN+Ru+ocZXzqvQUVfAOESBb9tZDcXJht90FKCfRoqPHoY/jxmD
	dstFYOZlK5I3KMh3N+xcutSZPRcUTV3whTFUqomuZSHYYXxkDTos5WtOduGTV5PhBPkKb9W5IonSx
	pWOZbJflz1moXcZfb2KApIDiJDc/CvC9zdDh7fcCSAhauKLkm2CY5ELzFEL4BxgusTVPHj3J5W5S3
	haeQ7PgP+CcqK42NyJhnBadh2/kUrUTi3bc7bBxCtaY+kHck4CIMb8ARqxvljj1v6OysmM0Om9ZhL
	Ee+SQZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrFu-0000000D16B-1RJF;
	Mon, 04 May 2026 11:14:30 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJrFq-0000000D14B-1UbS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 11:14:28 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8d4f78fc9f6so436097185a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 04:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777893264; x=1778498064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eIoXQIVw/Vuj4jbZ/QrXIRnsUY3etOFhZ4gnsuho/XY=;
        b=jfezJUbOj5MZom7zde98uv0DWDihqkzrngMZu3kG5j5FMPPWpEs1A8X36v6xnUNjaE
         of1HtQ3+ZsEqpzCmPBfC8uMyuIonOzkTM2Ih2VqUe36ayoB7ptMM32AIWTw2gpCPZVrr
         8vdgRNy9NHnmn9jpvEYETf06B1pbM9CUcvttiocvSwpzBT63RVPEEQqynJe4hp8Ga0x9
         VwKeYwdEOrRukgVDU4MkDlBXEWjQs9Os2c4zS2DxEDA9+owW61EIxgJIqrUM2kxprYrF
         rCGWNSU4r7E8dcGs38yBogNfzFsFQYgNpsVJBhDPTdufvWEom53DcCesiyeFgEKbtyea
         HJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777893264; x=1778498064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eIoXQIVw/Vuj4jbZ/QrXIRnsUY3etOFhZ4gnsuho/XY=;
        b=j0m2gs6YX7VDxHFk9a9l0H3wY6QSR3Z3ZdGemTWm/gbeF2G+Y7Pie5WI6mLAmnF/jW
         OETYjI2Nbx7krLQ1fOfoO07xM2wyGaAFiAozMLPXvtBxP611nyjppykkqFLvLCR6h/SG
         Abe7nVZX52vRO70usXAE7bElsem8Md/2D2JWCK4ZvqQYaVkDOS6ZYhVbldQB8jq8pfH6
         D18fNX8gA9VvCcRudeK0adyaGmjTOUHfUWKud+T5wVhBkGaPcstesuRizt7ZPVwkIRus
         1hKOxKuaCKnaTgp9lzQIx+/ryHN0361YFYc2NSy5kD5XqVNXp83z9TCy74NDeP0sj2dl
         g3tA==
X-Forwarded-Encrypted: i=1; AFNElJ+SFmi8igM2JicVmcQVec6pA/69w+PFTU1d0qJL/hByHlrJIj0Z73ITDnTbUipDdrZrnb0KlgU+V0L1wfPt8qqd@lists.infradead.org
X-Gm-Message-State: AOJu0YwPCylGX076WWhs1LsHZ+ma/kuw8rXoqeJtrH0mIKNklyKe3FTU
	ULM3PrCxl5EtCx4kben6stSQG6VQeUxBeX4JQnYlCC5W+9+8caU6XG6V
X-Gm-Gg: AeBDieuCqpyBng5FpYP4gfxGe6Y1FtDxIoGIBTZfDQkewQYY17LgxH5lPcrpTUTGDG8
	eE+5rKZLtLpXGajGsc9xUtnDLgJwwefOwgL/39kjqzR9E9XAO3xqzP6N7TGwi5wyV1SoNsJ6mZo
	A4BC005O1OsSmv31NAx2CYdmJhXaJF63Z+mHwqB1WnUwjf8cwB30e274b3Q83398Y7Oq5f1dsZu
	vZMs2uRisIFI8By9NAD68imsnt6UH0XobyRnDLcLGd5hyVeE0pk2Lm2wWd6i8bupvoAVSorphz0
	lt+T3Ma3KQcsJcGtdsz71OfidIujdmPeRzUQOmfWqAFGyM9KoakLqZ0rHxMSW7tr7rPUONxFG55
	tfPwaslWXpojc9FMoj/lXAPsuMQRw4gCsh9eIRlTfWDWsLGsbokJk5EeKo12K7nBMw9z+HHimAN
	ubT70B0RoEo+oJraZrVwEe74xDbHibkZsoKpVIbP88go/cq+YjbQo0qF8CkiCHXd1WP0NReiDP2
	JQk/Q==
X-Received: by 2002:a05:620a:230b:10b0:902:df55:8ee1 with SMTP id af79cd13be357-902df558f8bmr29755685a.8.1777893264457;
        Mon, 04 May 2026 04:14:24 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:b95a:c81a:e3b:6e2c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9027c2baea8sm214559385a.45.2026.05.04.04.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 04:14:24 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: neil.armstrong@linaro.org
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: media: meson: fix typo in codec files
Date: Mon,  4 May 2026 07:12:19 -0400
Message-Id: <20260504111219.7797-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_041426_772298_A7184721 
X-CRM114-Status: GOOD (  11.62  )
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

Fix spelling mistake: substracted -> subtracted

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/media/meson/vdec/codec_h264.c   | 2 +-
 drivers/staging/media/meson/vdec/codec_mpeg12.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
index 89e0f8624e5b..a6074de15118 100644
--- a/drivers/staging/media/meson/vdec/codec_h264.c
+++ b/drivers/staging/media/meson/vdec/codec_h264.c
@@ -16,7 +16,7 @@
 #define SIZE_SEI	(8 * SZ_1K)
 
 /*
- * Offset added by the firmware which must be substracted
+ * Offset added by the firmware which must be subtracted
  * from the workspace phyaddr
  */
 #define WORKSPACE_BUF_OFFSET	0x1000000
diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
index 76e9ca7191ab..ab4374e3b2ef 100644
--- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
+++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
@@ -12,7 +12,7 @@
 #include "vdec_helpers.h"
 
 #define SIZE_WORKSPACE		SZ_128K
-/* Offset substracted by the firmware from the workspace paddr */
+/* Offset subtracted by the firmware from the workspace paddr */
 #define WORKSPACE_OFFSET	(5 * SZ_1K)
 
 /* map firmware registers to known MPEG1/2 functions */
-- 
2.34.1


