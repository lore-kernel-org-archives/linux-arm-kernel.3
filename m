Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD62ACCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 12:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9PifE+9cLSGmXGJxL0dL++rv6yb8nO0jVdJXEqqD3+Y=; b=xBKMjnDvt350zY/fSMSxeUqAxQ
	yzcgzzCUUi57SMYa2vyEvdAXL6YdgMsJoQHRFNbIkjq05crmhYEvUzq812je/IFZd9cjcvvusUoC+
	5ENCBEe4QDNnfXExYiTfqeUNdCJR5oJWneZGWpnMzFYsOdhhb7/S+xbvX8cp08f8xABBIVe3tzWhS
	lloTTUy36sDqRX9lsuNgYcG9u51q0yPdtrRFSOrNREt06/MuAOyQonTOE/PxylmhP+uoicGJvfUql
	umzt/sOmmt6zKkK4xkm62CZhDRlVeD3pftaWh1WOKw1a6liqpUILotdijkA7E7RyfCZNn3+2qVvJK
	pCdmhasg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZRt-00000005GAd-0fRh;
	Tue, 30 Sep 2025 12:27:17 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZRr-00000005G9l-0B74
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 12:27:16 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-36bf096b092so82079591fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759235233; x=1759840033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9PifE+9cLSGmXGJxL0dL++rv6yb8nO0jVdJXEqqD3+Y=;
        b=egbKCSDKKmPd6g54bUU6GDkBVswkdfyTwcA/BDMgsyM9VDChel1KNuBJ3TIB6b4WlX
         i82+E1b3W3e8BvJmPPTVZ0kSNAqF7y0uJXrxr+YXBlIOUQsGdsL2ZUswvVbEWTkgVjlU
         5YI+99vC3eoE3GAOsvEoUQ7AQj0TTHN1VOgtBhDz02JtmJoMSr8JCqAuX3+cPK1hjuIx
         74RXUczLLx/BGN2xfZYildsH7KwAeAAY83A3YhdlOqfvnrCrUjNtWgyDtWIsIVUEF0ku
         t++V+qUkpaF/HMOkgF/AkR4i3LM01L5m/z/66s8aHEOZLLhN1zIyezwnRpNJZF+cQgVS
         0sGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235233; x=1759840033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PifE+9cLSGmXGJxL0dL++rv6yb8nO0jVdJXEqqD3+Y=;
        b=UNyPfemo89EPJ6m4EiLOfNc6iNr0NtVLaiJ4N85mjTj+iWn93hdwxO/IXckTtaWLYt
         6DL4Pu5JzSpNhPxHzcCU+3FF8sQbH5ro0RHdQkEocRKJomicJVnjjVmKREtuYfVX1/aM
         suplTyoVxl0Fp1jAvRggJ1jR17Lp2YA3PwpUql4oWk72hRG9+QzceT6PnAWvfeQvg92t
         SFcU8KYqcr2R8J+8Rfw/4hbH6fwWBtmdCyiPqad2z4RTKhinZ3hz7m0WIzYj+pl82dyD
         DInbWYidkt35YltfRggObGgLhBYpGxssv7p77LbXTOWaA3wh2bX26rVZHdgNxvZe7XBo
         WhXA==
X-Gm-Message-State: AOJu0YxCBCsyNqGERtVKALLNfy2VCuRB3VLn8ftGYIpkzvU2LJJ8AvYU
	cRrtycca8SAuUu8RvZGscjqD+pkCe46NAQyvuh69oYWuAnz9HKUPMGEnkmqzSGMMOHA=
X-Gm-Gg: ASbGnctsQhq4oipdKKaSZN6xD8+M5HN1qTkuoervsavUOYAv1avqlHGPOm7hfxcNZUX
	p0LYIkMg4i5A1DvqBfJtI72yLWR5B/MrkpRpMaOFnpDwa1tT2VQbHEw5GseRoRvWVhExvUwe+gg
	kpeb3Nlwe8nrS/6z6EaBIGyr/PwMy1LERw4kAFhWYnZ51pVVTXCW9T7qhJq9Z/+og/2w3+xNldB
	NrtepENJ15Hwrl5mEOD18GKwqs6qX5PSJ6/Z1XDzDgk7mApzixbUPUuWbLALplt30x+nxTDYIUk
	HI1WdXQvHvYLPgPuldI42rFn3Nqo4bZs5IyakatCWoUTh0C0uUlVsqM+vHpdqvLi5nz/YliBaBE
	nKFexq4j0g46GUlQVX7HDi5/NCM97vZYhL0lHNDIOr+jBeANS3jip14j0h/UpCMQmrsGEB7AtW3
	7Vy7ROTlMqCDaE
X-Google-Smtp-Source: AGHT+IERiOd9+z5r+jP1QcnJC76rX1P6/lyRtpeEVgBBVdHsD9dVqsrOGCxd7qgav2HbKXaf1lAR9w==
X-Received: by 2002:a05:6512:3d1d:b0:57a:311:3234 with SMTP id 2adb3069b0e04-582d462e235mr6637707e87.55.1759235232989;
        Tue, 30 Sep 2025 05:27:12 -0700 (PDT)
Received: from Fecusia.lan (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58834e08273sm1416568e87.28.2025.09.30.05.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:27:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: configs: u8500: Set NFC_SHDLC as built-in
Date: Tue, 30 Sep 2025 14:27:09 +0200
Message-ID: <20250930122709.28987-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_052715_097084_11D28605 
X-CRM114-Status: GOOD (  12.05  )
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

From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

The CONFIG_NFC_SHDLC=m setting in u8500_defconfig causes a Kconfig
warning because the NFC_SHDLC symbol does not support being built
as a module.

Change the selection from 'm' to 'y' to build the driver in-kernel.

Fixes: 344cad0660ea0 ("ARM: configs: Update U8500 defconfig")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC tree folks: please apply this patch directly.
---
 arch/arm/configs/u8500_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 0f55815eecb3..9c8dc6dd5fe3 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -40,7 +40,7 @@ CONFIG_MAC80211_LEDS=y
 CONFIG_CAIF=y
 CONFIG_NFC=m
 CONFIG_NFC_HCI=m
-CONFIG_NFC_SHDLC=m
+CONFIG_NFC_SHDLC=y
 CONFIG_NFC_PN544_I2C=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-- 
2.51.0


