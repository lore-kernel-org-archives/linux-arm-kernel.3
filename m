Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C202C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 14:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZXYQlywBGjxUCQ5Y1L04Uo3ant2KBX+A6aBOQRIOrE=; b=jEbPPq36V8rlsOpG67Ai9Jfwcv
	NiCKODjreSxxtfNqBo91pEI91UPBmtkJdSmcprZ31zgL8LtSQ2jY5FMwUxxded+udaeNoTLYQDRZm
	TTX4/gV4GcBfKz5uzb5Kkykm0otXapkrmPXkkLGRVZDC2pB3ftWCr+2NRwNU7bt5dT+LT3rDN1j/K
	KY0cf9DIasoyYZ4xXUVg4xFXdBmPl0Vta7e9W61lG2UvWu6A8ETeH5MA7KvsXqMjPjzt2Lqjd7L6C
	67v/84Tp7af1gY78nH1wBnb3lhwM8y0lnI5TJtqPjtp3Z5aTgnPhOtGWF8K2iLOfNxZdGMShmhXpy
	H6DSRdEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twiRA-00000003LQk-44x3;
	Mon, 24 Mar 2025 14:05:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twiIn-00000003K6y-3hBS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 13:57:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso32937505e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 06:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1742824636; x=1743429436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZXYQlywBGjxUCQ5Y1L04Uo3ant2KBX+A6aBOQRIOrE=;
        b=V2u5XMmEIWIObO8Q8isbM+m2rBv1mSHMEqL1iYkw/+57yf8a/69aHqVbBSF2DF68+H
         Ovi3MbI4bvAI5PeTHFDPZi984yV9Tyi8gct7008eYqmMoKiaNslL7nOU6HnYiIyjNgOV
         UjJAtFg7yCfJr7vLXza4WzG4DKhO8xTNgWjjhHt+asm6YOpQeFD+ZFUo4663ErsQMccX
         cGji925r98a4OWlsJfx5xy7jMKhWtCtMP3TZeRg5zUz+itka+I3Tm8hjt3rdcNAdl2ZV
         Hnt+7RNPlGkDXyqJPcIrWz95ODGKQmMK/rT3PQGj3m/oGtk48yLlZmdK3nr7AmrasHbv
         G7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824636; x=1743429436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZXYQlywBGjxUCQ5Y1L04Uo3ant2KBX+A6aBOQRIOrE=;
        b=QXz2blhqzS+9c87/h7gb1UHRFmKHIHzGnE7vztIZFmWO+D+qLlz3xVX2C6hjA2rQXu
         pld/XDgAyMzsF6fbXq6VcHEPH+MaeIiEjDUd63BF313gC7H2ebzjKvvlpfv8O9jkjC4R
         F01jB69HpnpGUmy0Rs/Wxn44EHpcVFch6NWuh7OTnShYOS+2c8maxvmcfHoIhj9Bjcze
         LwkRVlmvIlgi6MzR+Ko9IKUFLxT2Oq4eXZ8SVUurtmoP+j7VyOW4atR1EBTi9RDZtLMR
         8p61V961F9r/aS16ehayzlOqC51SwJtHrxYMs2HS2qA9nEgKgjHzRNUO9b9jxNFvW1ey
         JNaw==
X-Forwarded-Encrypted: i=1; AJvYcCVl8liCn+SIglsURU09kpNqWXx1a5wtn7GdDeDvd6AgApHRQLqU7+2K2yZ5V6pXksjM3EQbT1JURlMIm17IDu/w@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0CzUjXa/53I/hsDNkUsTvJJb1dx3Z+T5xWSjEqXqfP523m4Xb
	wUh4OXFP1kQ9QP91cOoloT4V5IzYhQioE7mTu1ymZiDDeAfsSF97bemkSVLddjg=
X-Gm-Gg: ASbGncsfw7LaW5yAUx2GaHiorodjUcOgRP3YuhfE9OW2SwLMajSwOnoIh2sQRxwGmr0
	+fgLg/8kxo8LXaHl9qVB3oM/5XL875MV4ueIpUpPoK/z+Oa9wQA0PtgM6ce2aZdV0CCAP2HvByG
	fsemamsDwO+/MpY4LeTbV+SJuTn8fCZxSGt27LOUIvsMXfSlaFovUHGsyWXQZpGrlMNBn42ZBlL
	fBsVH03mSTM6yPE1oHqUgadsDzsyf7EZuuX8oRJ4z0arN0BF4+4P2+5T79MVeXGVOvCRSGfu33b
	a+bxuF+xX3zOoJzZjrx7eghojM3s5Wz3NE6NHFB007z0ZJoexMfLUt73IjOlnKbEfpZgbL1rSQ=
	=
X-Google-Smtp-Source: AGHT+IHDKpLBvO3q5uFPvr/70DmnnwzOfgKjpHIucZu6pM8ksgy7yC5qAGJIQYpLCs15vezBXQWNUw==
X-Received: by 2002:a05:6000:210b:b0:390:df02:47f0 with SMTP id ffacd0b85a97d-3997f9336fdmr7677171f8f.42.1742824636553;
        Mon, 24 Mar 2025 06:57:16 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbcfaasm120146525e9.35.2025.03.24.06.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:57:16 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 4/4] arm64: defconfig: Enable RZ/G3S thermal
Date: Mon, 24 Mar 2025 15:57:01 +0200
Message-ID: <20250324135701.179827-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_065717_918134_50BD815E 
X-CRM114-Status: UNSURE (   8.65  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the CONFIG_RZG3S_THERMAL flag for the RZ/G3S SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- collected tags

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..79e566f0d47f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -715,6 +715,7 @@ CONFIG_ROCKCHIP_THERMAL=m
 CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_RZG2L_THERMAL=y
+CONFIG_RZG3S_THERMAL=m
 CONFIG_ARMADA_THERMAL=y
 CONFIG_MTK_THERMAL=m
 CONFIG_MTK_LVTS_THERMAL=m
-- 
2.43.0


