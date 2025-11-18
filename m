Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FEEBCED63B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 13:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/NH+ihGTI+pHubvmXFI57IU6F78/DwM75gJfoYXgOw=; b=WbzkGTTpmBQxn8i7GLjP+lz759
	dTQ5ZtbfMu8s/bsTfzvMs05i445iCxcvpYPXtZBRQGwdk3sYAGLt7/sZSkMOTvfonCtLfSBFcywJR
	JIfnVQ2KtkysNA0WNmxkNxGDbClFhsz2lXHjccY+TSSNDGxkp5lOi9SgI0plYnEfWYPBdVUQ+WJdc
	XOH7msOhxgoIPyLoWJvlxK8DLMW2jNa2mtoXKPoNpje9vetmo4v2p8MwRfjo+yhne5HF38+AeRelE
	+u4ZkIS/lj0q0F2GNf++PLqYZsjGWq374Cj3NIppvHFqPdtOfhT88nEfBGWS9lripar0yQWAanMoL
	6xkj4XbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMCZ-00000000Vd0-1RnY;
	Tue, 18 Nov 2025 13:56:59 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLMC0-00000000V4f-2EvS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:56:26 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so2780304f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 05:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474183; x=1764078983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/NH+ihGTI+pHubvmXFI57IU6F78/DwM75gJfoYXgOw=;
        b=M43k3uLNav/SaP7Yx4N8bU6G+mAi8jlFT72mRI/n9iJ8WA2CVTZ3b5/OuRRtJjnnYk
         ha548NarslHBSvDadVPxmW/yrW9vdcupZdtzj5sb49PWdR2qAViRNJjCyJ7bPZeemKd6
         Y23cbZwihvNM32vElqtjLkcqOy8e7doV6JtJ9LLZf22YlTsgx0yHDc5yrJg2ecfBwcc6
         jk3X4BNdb0r9qi/yc3j0QItS0VMjlMOJE578JFPGuntDSUOHWsQQe2eIpOfuN3HISiiH
         cP2/uAQ/B8OP42wkioK7qW50QVAVBH4y+xA3iyuTYocTK1f1tJ49oujOYeFz3TTvMgOZ
         yVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474183; x=1764078983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A/NH+ihGTI+pHubvmXFI57IU6F78/DwM75gJfoYXgOw=;
        b=Jq/+B47FvNu1T8b82jtdoIo7BOXPoTYuw0kyTIp30EL2DIk/8jMIQ3gfoMWgPIcfUF
         Bk3YqUpByIVSODyRFcDFZTHzwvvJCh+vq1PzI+0sNAG7ETxUu4WoOzTt3U3vJoK/k+GL
         AGBMGh/W+mfQ55MrUwTVzLJDRYzcbde3vDEheID/PC6QRkEa0tm9F///lxIB8ner+McI
         BlKfcHKmJmH4IbVBIdMjd8ntK2E/5QB86Wde/mh6OsCIryxrFSqfdoFDC/Nq5zcZBDDX
         sqOHJhO0er9/4aHfh86HMyAdMHsO+xkPGkGMUh+13XlibmxxFwLf2jTa7enFu6ghyR86
         TCsg==
X-Forwarded-Encrypted: i=1; AJvYcCVzYkJ/Gn5cE1GObdehM3lXaVDMCvZwyMDTQRtONoiy2ykWK06Ox5qbOHYyPIx+ye2JX/Q6AzHan26CCQ8dcX7J@lists.infradead.org
X-Gm-Message-State: AOJu0YwYRcIMcCjM8oMHlj56i73/FmUtBOPI0YYvCcf10WS16nZ6ZUqb
	yB/wU7trZRZRQ1LZ1W7FZpy+NgrrOmsVdkzd17OYsLDOKUfiaZQKWvuimDwYBQz+UL8=
X-Gm-Gg: ASbGncuWelrzpG2CEnjLlLLT8DvRD/oNXAHTeU+SJOLZdd/wdAZl7FyA3GV0A6Um1Hm
	BqNDoUkam3SKkHTZhrbSR4Ba2WmpFst0PLM5sQnv1qJto2O/+i70m9qNYWwEHZqh8gwHJbFnBHH
	JsJx64qZQgHK017XC07JhJ9926joMTUDFuwvWTzK3FMpCw110fmhMW9GA7L9vEGny7nfraO4Zt5
	oBM467uRfEasKvPr0dY0eyz706QczaIDyEzecefQ27CVqPmkf8gSsG7MbkTbSp2QySKmsXEM7rF
	9GE2QNd2hS6gCs0ouVR28/bzg3RBpIrwPH9HfukgMWfj7hgec0ZK7/WI/X2tkUPjLAxev1P8X4c
	oX9SFaXY/eWSWpxgBaCXCNNqWYVDPQFuDc/E6YDwEA6Lum2NZEm4RWiMECYyHHAvVFRJI5fwvZb
	yILMj+kYo4/8dLJk9quf5DLJhekEGr9k0BBZCt5he336yVGqS7LtIa9BKNcPQ4zz2J+LjydDSR8
	zraSQ==
X-Google-Smtp-Source: AGHT+IHMTuoXSa5b/I85TLgO75MjoFjkVVohZVJUHjTj4z9Z02iCD1czvc9CTvoOMfIKnhdLi+Ctxg==
X-Received: by 2002:a05:6000:644:b0:42b:3e20:f1b2 with SMTP id ffacd0b85a97d-42b593246d6mr13598497f8f.4.1763474182903;
        Tue, 18 Nov 2025 05:56:22 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:22 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 18 Nov 2025 13:56:14 +0000
Subject: [PATCH v2 7/7] arm64: dts: exynos: gs101: add OTP node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-gs101-chipid-v2-7-e9f1e7460e35@linaro.org>
References: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
In-Reply-To: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=968;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=bpikWqcBMsiIMl/jbWq2QmBbah7xAa4FAfmzSq15MIU=;
 b=sGizZvDLkNesCQsmcBtCebaKnu3wBtFVyhLh+rpTbGIRZoAB8h0gn5q//8UvrhTXEduaucJCA
 N2W+Mx34ojOCfvhbdAC7Lo9YW+xVqqJ32Y5MBNgEch+eIaSOLRmNfoE
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_055624_624380_6EABB193 
X-CRM114-Status: UNSURE (   8.56  )
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

Add the OTP controller node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..4be983d4e291b3afe3530fbea0163f70c1a74671 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -571,6 +571,13 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		efuse@10000000 {
+			compatible = "google,gs101-otp";
+			reg = <0x10000000 0xf084>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
+			interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
 		cmu_misc: clock-controller@10010000 {
 			compatible = "google,gs101-cmu-misc";
 			reg = <0x10010000 0x10000>;

-- 
2.52.0.rc1.455.g30608eb744-goog


