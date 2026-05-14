Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F80CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9fm8OjDakj3wm8FHoPAz9QnbfYJEtGv/K1EWte5dtk=; b=Rq6Vtykn6GoHatupibQtJEzt3g
	+HAtZkRA2apoxXRbcdafRgX1Dizsokg30MxLJ8OXVB4wRSG6ccHka3HM89zoI+otEnKNM1NSZUePG
	ISLu4pJ2dTJVk6t1+J4rG0exS3DdwFJGP40IQ7Z57wKfi4CEdI7tXR0EKSvnU5drrCclD6hnAg6LS
	VRruuQrATbSN6qtdi8+Bog/0A87M474+9846Hr8KngqA8313ncmh93zCc46JUMcX3+KACG8OLa29q
	TojTKlByn/LMvaSrSptpgSjZgpTLfomDi3NCA0h8PdDhQM/OBJjBm42i2Qq0zwtbgWlWpjKsuJ21B
	5h84eLKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT42-000000059nQ-3fAb;
	Thu, 14 May 2026 10:13:10 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNT3y-000000059j7-3Dvs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:13:07 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82f8b60e485so3845273b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778753586; x=1779358386; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9fm8OjDakj3wm8FHoPAz9QnbfYJEtGv/K1EWte5dtk=;
        b=iFDUmJvTgrTA2QPjM4qyqEdi4a90b/jI1rdS72JCwYSz1W4PXMxNGJXDune+UASIFy
         y6A7Lr1+f5Prz/D5lxvzgPxgsShINXwleWewEvHOFt7DZO3qS3hEaJxNBa5ZGWmH9xV2
         Iv/bk+dnIuHbx3g5OA3l9iZsx2WqFYIwGvKz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753586; x=1779358386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z9fm8OjDakj3wm8FHoPAz9QnbfYJEtGv/K1EWte5dtk=;
        b=rV7P/5usu/eKm0famBSVKWvDraqt+pGvnBrsgegEdNKKp+/vZb0t749/NmnVvoCWEd
         UzQ2TqdDTR90idyeK4gHP+GomyAV+7d3dVnJB2v6873otVEn5KfQ3+gInd/QvlF0HfF3
         jK/JDXMqeTS4YUsjRy6as3NxUaA2EsLPAErm6ZvDT1W9khCbAEkxi0YHLV5GegKhcuAM
         qH6VDQIKqEpdcy+YeVF+DEXqrYDX4XUcZ023l6iPBC1RG7OF9yxRDJE2L8cpXWljzHgG
         cBHL5XKBvOCsAK9DDrxvNcRV7oWaQUAD7HNaHyn9x6YjI22BZ5VxmiFJs+cc4qwOrMdu
         DAVQ==
X-Forwarded-Encrypted: i=1; AFNElJ+v3I73ZB+OVWTBc+2ZS2vv+KISOvvOKCE4RFzH+D7rRGoXX9/6LRHeDU200KE3CT1sgKnaVOQ6GwaJTyKas2M3@lists.infradead.org
X-Gm-Message-State: AOJu0YzFK1kw/eLTHzZuEa81GTNy4ccJntjFZd5HWuRLO4IoEZMBwuir
	MYf9UYNYfL9MdPdqdsyJnxmwldChZ63zMTsKIo6jMf8oiMnsfD9pE2co5T6JWgwm4w==
X-Gm-Gg: Acq92OERqnxQKRt2/NRgsmyemkU3nmtjUQbsQQtnp5SNWqqcfv6sqPA1aumiGT/aaUk
	fiEH1dmR6QFg1YKXQy9rw+wcJO5XoPEjZiJ3OwldNUYYbZPMP3KqP18J5i/vXhKiBuFwiS4b1Ce
	Q6jAt/irMR+4SnyzomeowFfm678IeibVt0JgLLYHmzNlicJU0WOlLyaMzcZzGmP2SQH089GAg4O
	y43uxmht8ehHsh1qzbCmtZEkYQVAvjuu/puvA5GHXriV9upVBNZs147yF/bHCnHTN9/a6IjeV+9
	KIW4hJTlVWPta9j94ppg3cq5tfGzB2k0lrO/ar+ddIq7PXcR3NEtAy4xCRc3TsR6JKTf2di8QCf
	PulZ9m9lSZVmt9dSEx6pFIuam8MAhqcBQx/S4cRnsQWN1LeE+h7hBXq1Uyo4r69Y196E6PNN0gk
	c2V42EWBOOTYMATPMx+OTg2Lc7WnSp3t4djIBNC9EO5KyiRMeHgfw3UnsUmiSFgBlBQVBD6abbI
	xCsWKgD
X-Received: by 2002:a05:6a00:e11:b0:81e:f1c3:89df with SMTP id d2e1a72fcca58-83f0431542fmr7743449b3a.50.1778753585633;
        Thu, 14 May 2026 03:13:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3a91:2f7b:b635:8285])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664212sm2898427b3a.2.2026.05.14.03.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:13:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: mediatek: mt8192-asurada: Fix SPI-NOR flash compatible
Date: Thu, 14 May 2026 18:12:49 +0800
Message-ID: <20260514101254.2749300-2-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260514101254.2749300-1-wenst@chromium.org>
References: <20260514101254.2749300-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_031306_810568_4A298B83 
X-CRM114-Status: GOOD (  13.00  )
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

For JEDEC compatible SPI NOR chips, there should be a single generic
"jedec,spi-nor" compatible.

Drop the model-specific compatible from the flash node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 84b89b317890..3c8b4c2f6f23 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -631,7 +631,7 @@ &nor_flash {
 	assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D6_D8>;
 
 	flash@0 {
-		compatible = "winbond,w25q64jwm", "jedec,spi-nor";
+		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <52000000>;
 		spi-rx-bus-width = <2>;
-- 
2.54.0.563.g4f69b47b94-goog


