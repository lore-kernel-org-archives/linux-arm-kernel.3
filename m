Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD76C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 12:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtKFI70vqNjYLe7XjAp0V0B8UZZFpuIExlA3OQYSr8Q=; b=Gej8xmguuWNBJpY0URopKpewSN
	UQHHaZ0VkGXwYOZqmal7Ej57cfpiwsSig6TQKrMdyJbpDyPAdxiblevybllTUbA+g7fitM02pC5kW
	0MXHMFUvFTwR+ByDBmiyv3H9HwQixbngS1JcEO2Lfq1YbOu5Y9mX2EyGZ9Zqq1I1yeAb7HS2i79Hf
	IS8+WxMxUVisWIQduCQZzK/bSbt3dBLRKTsfcCrlagHqKGxiszprp84Fg/lfwo1hUVXxmFPsPzzlJ
	5aXvtj4sREsah1SFswGGBUd0iZyfJmhkGATg3XCQTLB3K5da0CBrhpjp+gYrP6P6JJWxP6Ig5yqs4
	KntJlmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7vbD-0000000E1Cb-3tY8;
	Thu, 24 Apr 2025 12:22:39 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tmD-0000000DfaW-0IHz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:54 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-223fb0f619dso8698035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490352; x=1746095152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtKFI70vqNjYLe7XjAp0V0B8UZZFpuIExlA3OQYSr8Q=;
        b=FwwWGpD9Q0qSgOYeDOfwifOB0xhfhV2nCCxKlRp3+ectm1Ik50/8iMJu7Jus27Mkqt
         1T4ebwksx0arY1gtyFDzCqvjqUJeFUQSv83ufduRkxn0zZtY7OcdM8JAtpy28eMCo0LJ
         Y8EUJklegnUgaCR1l1VTmi7eE+Ao0tk3wOTu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490352; x=1746095152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtKFI70vqNjYLe7XjAp0V0B8UZZFpuIExlA3OQYSr8Q=;
        b=MDm7ryEwhTn5l1VSI+VuP2W/Ly+NWY8TAhbYWJ3Me15Taz0liXQvPduHfnIH1PYp0h
         4NlfBIwX+O4skphUsmjZ/0uJLUQApj46sYaHysiyZTakmwKL3eoVZR8egBbayeZpFTB0
         iXYb86N/zQ0XqU6FknGEpFQsAx0uQjYDBTfca5TSkmdQvh/xrQ/sbMi9K/iaZ83LUlNn
         vebbbGp7vj7SogaqD+u84wBPm8aH4jRShZMf1LRA/2l80qRqyC9y9PmnuDMCP6R+iopk
         Md7CnCDbveDxi6bJfIRlklbkqVg81TRsaw2ul02SPYZbCsNTkvGNSQFxsoYlIcOhpMI3
         c6nA==
X-Forwarded-Encrypted: i=1; AJvYcCU6C/ycLXqCZ682ia3nS7X5JD6wCiEm1TjdAw1OEGpNs6ReplIxs6sIEC7/xy3Iz4NE2Vs/S3HpcJLlZHg5iMNR@lists.infradead.org
X-Gm-Message-State: AOJu0YwKWZAkOQUShbSpfhaslAtQPKMZ40CFV1MsU7n9uWIsQTsFJCY+
	eVdLp3x//mcIWzNo8gtQ52bAravbhKWyCqfajf/+Ou++LGIAePqyPwybj7hg2g==
X-Gm-Gg: ASbGncviFYLtIcEfniO+CrT+MGOIkYfc/FGG387eGu16PsF9lPgrWvocG1pmymBWDwE
	mxwm0ngrjv36hl9EtKBLCZnJ2KwMN4cBdUqg8ymTIVOeuayKB4eqSyznHsc5PD3T2wbuHtGLCGu
	EghuA6fqW6f+xliASKwSaZYTTfsWNKztBQBvhvPMBHyy6no7pSIPzXMN2AUCuqCYAccSfyT0b9M
	l4j/07hR4cZsVtW45c3VNmB/ZB6SMvCJGJ1JQTFZMGmKLeuRi+h14GWmW7BhoM5f9hEQ1cjvoAs
	qyl/Uj0Emcrltozj8E3pKkeWWB74lwkWz64VR3V7BvGZ0lwcMG1ix6rJcQ==
X-Google-Smtp-Source: AGHT+IGm/ZrqIrNFBVlNQkQXFmEbsCxSPSPhkPOsiViZpp856F8SPbm8k/eEXqIbJDBfdIBpftEJlg==
X-Received: by 2002:a17:902:d48a:b0:221:78a1:27fb with SMTP id d9443c01a7336-22db3bd1a15mr27098975ad.11.1745490351983;
        Thu, 24 Apr 2025 03:25:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:51 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/13] arm64: dts: mediatek: mt8173: Reserve memory for audio frontend
Date: Thu, 24 Apr 2025 18:25:04 +0800
Message-ID: <20250424102509.1083185-11-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_032553_104135_AAD73050 
X-CRM114-Status: GOOD (  14.50  )
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

Some MediaTek platforms already reserve a small block of memory for the
audio frontend. These platforms reserve it at a fixed address, though it
is unclear if that is due to hardware access restrictions or simply
compacting the reserved memory blocks together.

Reserve the same size of memory on the MT8173 as well, to align with the
other platforms. This also helps with memory starvation as these devices
commonly end up in low memory conditions.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 6d1d8877b43f..122a57c3780b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -318,6 +318,14 @@ reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+
+		afe_dma_mem: audio-dma-pool {
+			compatible = "shared-dma-pool";
+			size = <0 0x100000>;
+			alignment = <0 0x10>;
+			no-map;
+		};
+
 		vpu_dma_reserved: vpu-dma-mem@b7000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xb7000000 0 0x500000>;
@@ -887,6 +895,7 @@ afe: audio-controller@11220000  {
 					  <&topckgen CLK_TOP_AUD_2_SEL>;
 			assigned-clock-parents = <&topckgen CLK_TOP_APLL1>,
 						 <&topckgen CLK_TOP_APLL2>;
+			memory-region = <&afe_dma_mem>;
 		};
 
 		mmc0: mmc@11230000 {
-- 
2.49.0.805.g082f7c87e0-goog


