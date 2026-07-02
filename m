Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883F0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g5kQpHF1ScJKcmqA356iXRPEORmUpwJQqKtBuIMk5xw=; b=ZUck2EL7wmYxY2ofy7kvhfId+r
	vWXHL5W09uNb8UA5M4tn0Xy80bpW6zeNceeUUXMyYk4NjItBU6tYcxWyxBoJ2oM3qPtG5yn6QtnP6
	bClDGPO8C4XzDBkE90/9F+dW99ebCvcYAgoul9n3Y+RCcay9sKm/5aO2EOgk1l/hQcIqu/abgv7y7
	GgvKJMaHaIp1QnDiDV8qsMYSV0RzOJagTxXaabWHthpldYjFf9csUXMJoHgx6oEvyr/kvhjW17vdI
	jt9XYRZbZYx8G/1kZdx+WFH+EyPgl/EF5zY+lmbt7YkVUUGjq16rxKgTlC+fYLzY/DXhdUNauO+gT
	eyVNI36w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCvx-00000003tdJ-0kL1;
	Thu, 02 Jul 2026 08:38:09 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCvt-00000003tbj-3ek3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:38:08 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-847921eed4aso1577492b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 01:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782981485; x=1783586285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5kQpHF1ScJKcmqA356iXRPEORmUpwJQqKtBuIMk5xw=;
        b=ee3nH2n7dmtMWbIMMUdVpfXpSS23r8lp/KSh711m/3AaQDpkioBshilkZcGGIw5Et2
         fSUMJ08PzivBAeTCimEfj4N3cTBs1o3/zvWjlWgGY5KH3gGACnFs64tGjZSBydtxJjAu
         QFVFkN6vycxZzmSD88chJPNfxby8Lv8E6RWdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981485; x=1783586285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5kQpHF1ScJKcmqA356iXRPEORmUpwJQqKtBuIMk5xw=;
        b=Dkpt+27tlg5VDhZ7saNzkn/DfXZ9zJcb4Mguqk2p8ciLxt5GYMOr630YREISb/Y1Mr
         loOC2gHpWnO8nL/11ENtYYc/WuNpMYtjrYvgPqr+yPoDqKepWeJoJV83PPOriV7wDsBu
         nCKfjvMjVJoibdlV0vAUt/r9kU+D9Xu0j2NND/RWcmW3NfrdXyUyiXF14CWx3CgGtyI6
         LiVka50aec4ONCW6xR/BI1XpuXpLqSCfyGDdwY/tuJHm3E5JO3zqt3GCb9sgUG0G4u0t
         P6jh7/HvjdXMGccoT0tTk70h4lmL5zepv/2QcdskIjAYOA4yGGJZHtQfoSY7gz14Y2Se
         0Zlg==
X-Forwarded-Encrypted: i=1; AHgh+Rq2O80oO9cIdmWTN7mjehmwy0zpwV3NVGoKCJwHtKHg3rlYEzyXxxAidyfmjPY85iCmR6SLZ+GQxM40zZeev5Fi@lists.infradead.org
X-Gm-Message-State: AOJu0YztHBjkYsXjEnDVG1XyWQrd88Mx91m6PO3RO3Ga0br1EFmGyWTO
	U3yaDp9wKQhsT+tn7nNLOZdBeURkj/TClOu1K+SX7yMEZoArsdrSSd/0I/X/QC1qKA==
X-Gm-Gg: AfdE7clV7QAf5XNOCzHd/Y1VIZWjK+XvMPZFoS3hihkM11orUu5YvWsMN2wEImmiiWp
	WE/gsZiinUQLf4TTMMKw8MBNkyLywVumkHjTTJ/jkA5J4wD3THXVXk7wCTDXf8CIdPC1JUQwdSH
	ubqH3tNc34XkJdWGpRvUwCNZIXdSVJ7ZTTXcYVNTAxKvL2Umt5xm+2svlUNZfoxVPyoDvW2sbsX
	PvpsHTaW11CJ76MYUYdLZNpXrM6L1Pa4a/N30H76iyqNyoKuI7UvwlW1nV0/azgeLzy/r0hsCjr
	d7Hjmz/CmHNAPpLMlxJ7Lu1VRQiotwz9ehQYvsHpObC+nU84+JnrMQQwlG1vubNPEBTBArdV8tH
	UbWMtIBVcG4SIIMMI8e4Na8kUb8ajUS6RKCobOVG4VuKgv1ENBAVFzDsOcry5m4n9Y7xBFtWVZS
	FYAc6avghVc6KfudpgDgbsdeYf+2smJ6uGKGd8JiPKRtYfa6aP3iRtttVoYC1ZvPX2Z5F1lQ==
X-Received: by 2002:a05:6a00:9298:b0:845:cd11:37e8 with SMTP id d2e1a72fcca58-847c5034e00mr4105619b3a.24.1782981484770;
        Thu, 02 Jul 2026 01:38:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7869:7870:7da3:7288])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dc1afsm1045521b3a.6.2026.07.02.01.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:38:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add supply for SPI NOR flash
Date: Thu,  2 Jul 2026 16:37:58 +0800
Message-ID: <20260702083800.578581-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_013805_909481_07546231 
X-CRM114-Status: GOOD (  11.39  )
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

The SPI NOR flash is powered the "always on" 1.8V LDO regulated power
rail.

Add the supply for the SPI NOR flash.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 4cb23595d17b..f382f90c48f5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -645,6 +645,7 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <52000000>;
+		vcc-supply = <&pp1800_ldo_z1>;
 	};
 };
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


