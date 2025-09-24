Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF18CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVqkCRaMXNKzpuB5REQUDEUQfJMrsFYNkn+7shJjr5E=; b=l9b8nx+otHer8o4Hagy6j85Vta
	lSvjLmSw4OKOmWWkCo550d+pQCpft/7G+LssxdMnwUPBs6OsLa0wi0tPguyWosy5AP9jJAVO+L4/h
	a8uANB7vhz/+YemdQW1WdNYg6ZjnlKkF98zUOcEvsJmyXbIN8pIAeK0M3K+PNrJBmCullur2XCG45
	7wPWYAKddYoQ+mSYC9fp2i5yNhyyCPx4qhu6s9jIQ4vGfFYIFM6UuJhlQc6PQHPVNfxm0IbDl3Ee5
	snQXyBCUoPmXll4i60+wMMizZF67gdkhLWoSW8LJ3YpfKaQG0mlXAVRbixnRUphY0+Uo0Ic22WYSA
	g1d34wJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RDM-000000018Lx-2p7M;
	Wed, 24 Sep 2025 15:15:28 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RDG-000000018Ho-1yPV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:15:23 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso7046028f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758726920; x=1759331720; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVqkCRaMXNKzpuB5REQUDEUQfJMrsFYNkn+7shJjr5E=;
        b=hpjI4fyAGGAv4sf1HDUdYSdqgpLcJPtIEC7QXBJ6zQvIBoxMsVHIwZeHCdB9ksm3jb
         +nYF/AcHhw1ZTCfR+9MedIEenXPnFQvMMqG+DCZqzl9XP5D99df904v3kk0L7EIG0gir
         ZAB+ha4dAhsFXiB2j8Ia8PNWdsHjbKMPW4UjuIpUEynMYU1TqiEkvwyFAzpjTKvIH+6s
         y0dKwR7BgTqtxMnpzQh1N0FQw2p0yJuDXxhFsRZmfO5N/kdoQuNYL6jUNPeDGth8h+/9
         +K3oP642cyZI9C2SHtgVfTJNFWPAyLWrs2YcW0QlzxBzRm//U99F8Ptt3ckX6FFyc7dY
         ITHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726920; x=1759331720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVqkCRaMXNKzpuB5REQUDEUQfJMrsFYNkn+7shJjr5E=;
        b=j9TaLuSSds2epdRfzyUKR78GT1WD2feVe2BAy2IGF86XRU1CgVr9OzOatcIe0xcbeL
         w/V1cRwK0yGpmJ9RspoGY2BpuKDdOg2F6DHyn8uE7exMYLpFIa/EP18jZaDdZS/a6yri
         YGfJJGqJrj+M6w/TinD+z1D0HAc72S32Le9d6DRhESwEJAJrMYpYrtudHLNPlen4rPkq
         rAsaJVxQTYidw7TmeTX5kAJxMc6bZwgWw9rdQ7BLrUehfwVIY8DWXKkTZsmlf7RL07Pe
         2Kda1dkIO/m1I2eTosvS0G/DVU2Veik/YyJ88TBpUoBxlAA8ccqKdRSm2k/S9UoHW9Q3
         N7AQ==
X-Gm-Message-State: AOJu0YxvBmaC7my8IUT0nRzo91qclSDCtrMCk6cBFrZxcNoAhonqGYbe
	G/V5DSFy9TJX4pr/oneA2iNCCYBT+KbUHqcnu4yCuMPVgf1tUmvS68iX6yji2MJHea4=
X-Gm-Gg: ASbGncv3fbBSWFq+mvjE5i6i6b7ixYHDLHLJkwcYFj4HFeVK+92ue3MY2ZKukHL4o0K
	fJKD8b0yVrjj2Ml3rL+5/VKg3i6Koa/C2cYPzcqJ+/B/tvEIGJcBOTKhdkiJOzVMES6ZbigmKT1
	qK2IxZLE714WzNn3JBFmV5q1KRuDGJEYigZzWiJTxQfuCT54YMbR9xGW+KjxKZhwnlMHgMe4TAA
	0AW96KXSQqiCSm2QAol2JtdActITbkuykV4ygTWDX+3sr5VTH3ePkwkX/gg4JndGNA6y0HEnZQ5
	iMfeafXAW4h4Z/nS83hZd0PbRvNRmbI/uNIV5/bgYfX0Yhr6QJd6udh4EeR0mDrSrw+zoWQfdQE
	YMkyLdMAlH/lR+iOGYAI8ruVae971PeU+OgvB5zjmOtp1eUs92oV7UemWD2D+0heNbIn94d47jO
	4=
X-Google-Smtp-Source: AGHT+IFUBokS/crC/e1tyzLRdorHGylPcO9/aHYJEu0osDuR4f/t84N4YYsDuJGzyT1nQBhllDuZwQ==
X-Received: by 2002:a05:6000:4202:b0:3ec:ce37:3a6d with SMTP id ffacd0b85a97d-40e4cb6e228mr379725f8f.47.1758726920506;
        Wed, 24 Sep 2025 08:15:20 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a996bf1sm36541855e9.1.2025.09.24.08.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:15:19 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 24 Sep 2025 15:14:41 +0000
Subject: [PATCH v4 1/3] arm64: dts: exynos: gs101: add #clock-cells to the
 ACPM protocol node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-acpm-dvfs-dt-v4-1-3106d49e03f5@linaro.org>
References: <20250924-acpm-dvfs-dt-v4-0-3106d49e03f5@linaro.org>
In-Reply-To: <20250924-acpm-dvfs-dt-v4-0-3106d49e03f5@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726918; l=984;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=JmsEgZMHNR2hZ1IS9otwlJdT37DqVFuKcq466eHfWkM=;
 b=In9O47CfMkMqpQRFT0EdPf6ZFFTRjGsFERp5FOQXNztXjs5m7eOB+4DwpP5+7wmzH4t124xRS
 d0YD7QdbCAJAnxjbbNk8gD0ezAWG0lxXstJGjc/g0YGXRMyewTbLF9z
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_081522_530716_3AE0CAEA 
X-CRM114-Status: GOOD (  10.62  )
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

Make the ACPM node a clock provider by adding the mandatory
"#clock-cells" property, which allows devices to reference
its clock outputs.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 31c99526470d0bb946d498f7546e70c84ed4845b..f88d45a368af7ef88e8cdc84b3a81a63a753832c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -202,6 +202,7 @@ ext_200m: clock-2 {
 	firmware {
 		acpm_ipc: power-management {
 			compatible = "google,gs101-acpm-ipc";
+			#clock-cells = <1>;
 			mboxes = <&ap2apm_mailbox>;
 			shmem = <&apm_sram>;
 		};

-- 
2.51.0.536.g15c5d4f767-goog


