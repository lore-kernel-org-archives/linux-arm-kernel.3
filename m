Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19974E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6t03VSo/NkHlsh+FX0CoPxMU4wWbqRd5I1nezIlvOp4=; b=d1UpiEYrdz9dWyknXIH0fittZq
	sC0oG1WmRIXExHgBiN7KqI2Jtb4ZFQmJOekP3zMpTfW1KvGWUiFJoRQ+gkDFxjE4V3ZoE4+7nRmcz
	CUI5GjKAmF3q1WkOyEHh+j8JcTY83i8dfe58EqO8qLWGeAjUbtSINkinYI1UQ+PoyAxU8y6wFFm5d
	Q6MMsme7AXsrl3bKNbRYEf/LLIBJCIOkZoIEsFxSKGgKC+5M9jgXl6G4orREbQs9LGEIbmSbW3mJm
	bvlLZw1WCyYUU/xuvsLAA831Nu++qUiabJ5rumsWRkf1wJT1g2moI2CUsrUCVQCO7eyFJPhNC883e
	OYwdB3Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM20H-00000003GOI-3O1c;
	Fri, 13 Dec 2024 09:30:33 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1zD-00000003GHR-3ObS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:29:28 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-8019338c2b2so1158398a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 01:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734082166; x=1734686966; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6t03VSo/NkHlsh+FX0CoPxMU4wWbqRd5I1nezIlvOp4=;
        b=RyO1qThkOyBnRtyQsZE5QvKU+qQIbMsZ+zunuGC/VhV02yrbdwjxgjH0HD2JSfinCc
         dRbECbC380eZXmCfn5v56Km7JkHppGvlxPxXX9ozT/sHXPvHnwIUxctnhauLSEIkLwtT
         0sUo9w0fwBWunHpRXBl+KV6XbR21q6TsaWTs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734082166; x=1734686966;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6t03VSo/NkHlsh+FX0CoPxMU4wWbqRd5I1nezIlvOp4=;
        b=ho9oMgeANkYeklAteeEx64V7lgA9Bbs+RkE+yUY4Aysdk+KbRBcqzzCmygXcRyyPz0
         MqnpWJ9CdMFf6no4esxwCFXAI/hhxJgwrTIekOMdCFZx01QgECKrgDmow1ib953b0ye5
         2VODxH+bKxTm2b8DNqiqdBbSt91c5FolOjd7TpIaScdzy34pEPqDXay0UOHcY2IGr+mD
         qaM8GiRn+9vPLecRvgFWpTdddc6N3trSNqlwCwm5uCLfxsfT7HnXwi8vuSYds4eShETI
         R7HDZYAx9Er4Wmianw/Wg1MJDVtk4VHWJqGmzSYImHGcJGD2XLJ6vxcyR2Z5LWh4aIfa
         tRlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUct2QOoWwvwwSkp8l5JL6+ILKVgAg1dkcy+qyc5YoJ0keVgSe4mHQ78MgdF8VADGBXCa+UnfKv3AbgzbbZl32z@lists.infradead.org
X-Gm-Message-State: AOJu0YzEGBGOgnkqnS/I9u9JoAWM4iqZAjsqnGboGOCBDEAcZo8NAlNN
	fp5sEeTA4sv+QaW7v+PsWs95N7Z9g1Ql8pdIReHMmbW5CzUJPi2rIvJ7+XeKlQ==
X-Gm-Gg: ASbGncs5MNdWtrEG3i0x7k71bxfNgG5zCdrqbwVwISH0LGUby/eB8TaK8wRPjcRaL0G
	IewV5rwnoR8qEmVhGSSzm/R8BuTobM3WuQ7RLrYTqxz1IJbj9dra3u8J+vS7Tm0ht/hUBNTxYSS
	G2bb0pS9Z7JeWBxdBPq8/57UnSGk7lpyODwYGFkP9JxER0I84qU9kuEn+pcGOo2RgREqLVf5hFu
	rhUGD716bhzZkokRSEHQqpLbnBUBiyezktmupPYyRwzDvPBe7cpW9dUew+ofwzRvajIuHnf6Mfq
	/6x6XcqZoQMHGfCC/34+FH1XK+BoKgEsIHzFPEUjBaiQE68=
X-Google-Smtp-Source: AGHT+IFVvckKPZkGAO6T5Pb8DWTggJU8BHRz85vU+mCYNsL0QexjIl0XaTItdT0xzRVlKw/f7tvSpw==
X-Received: by 2002:a17:90b:3b52:b0:2ee:9cd2:a589 with SMTP id 98e67ed59e1d1-2f28fd6b4b1mr3333710a91.20.1734082166620;
        Fri, 13 Dec 2024 01:29:26 -0800 (PST)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142e0ac42sm2733070a91.36.2024.12.13.01.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 01:29:26 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 13 Dec 2024 09:29:22 +0000
Subject: [PATCH] arm64: dts: mediatek: mt8188: Add GPU speed bin NVMEM
 cells
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-speedbin-v1-1-a0053ead9477@chromium.org>
X-B4-Tracking: v=1; b=H4sIAHH+W2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0Nj3eKC1NSUpMw83TRjY8tkIzMTi7Q0AyWg8oKi1LTMCrBR0bG1tQD
 317s+WgAAAA==
X-Change-ID: 20241213-speedbin-f339c2648ff0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_012927_839863_15C644EA 
X-CRM114-Status: GOOD (  10.43  )
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

On the MT8188, the chip is binned for different GPU voltages at the
highest OPPs. The binning value is stored in the efuse.

Add the NVMEM cell, and tie it to the GPU.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index cd27966d2e3c05833f11294cfa8f6a984d4e0dbc..0e865f5083b475c6e33cf6a0ce51d2b615af7850 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1752,6 +1752,11 @@ efuse: efuse@11f20000 {
 			lvts_efuse_data1: lvts1-calib@1ac {
 				reg = <0x1ac 0x40>;
 			};
+
+			gpu_speedbin: gpu-speedbin@581 {
+				reg = <0x581 0x1>;
+				bits = <0 3>;
+			};
 		};
 
 		gpu: gpu@13000000 {
@@ -1763,6 +1768,8 @@ gpu: gpu@13000000 {
 				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
 				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "job", "mmu", "gpu";
+			nvmem-cells = <&gpu_speedbin>;
+			nvmem-cell-names = "speed-bin";
 			operating-points-v2 = <&gpu_opp_table>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
 					<&spm MT8188_POWER_DOMAIN_MFG3>,

---
base-commit: 1488143f901e04e132722cb093613e8d019a4ec6
change-id: 20241213-speedbin-f339c2648ff0

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


