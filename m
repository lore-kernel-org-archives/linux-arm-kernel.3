Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A023BCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjK6OpIk8kyuSL5lFjeicimOy3JEve15WbehlqoxKGY=; b=lKVtKHTsgdPGSwXHOU96Kqh6dn
	cR1PNlXlvujSz93aUx4RfEaUpNnbdqeO/1GcwBgPOj41sEAv+Ka67XVrH101d6/Y5KslcVyX8hGwH
	qjajCpMyfA42k/NZmNG8/9O6SerAMkuNvRZTR4uZrBlPfxK51lYaji1pS5uNjyh8RmfUVfyVqZhyi
	FaffbB0eyDciXOxpYIVWEQe64UjLMECzn9J4zUt+24ghIg0/XLayyfknO4CieP6giqJfOQWM2r7KX
	KRJOs9UNDl4R7BflaEEScxQrdWBC1kqNba0bp+j5oUUjJ5vi7sqsEDpj5F2/IFVzTBXERrhkFwQvl
	nt23th7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urISV-0000000G2uM-15Fn;
	Wed, 27 Aug 2025 15:53:11 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFkm-0000000FVDj-3NtN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 12:59:53 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45a1b00f23eso40075425e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 05:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756299591; x=1756904391; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjK6OpIk8kyuSL5lFjeicimOy3JEve15WbehlqoxKGY=;
        b=Y5ZbTRAE8traCINaxaOS/JmsAk2qRTF8bD1NL+u7Y8DyBJDQ7rlvUqJ/BO7GsjQjbW
         le1wlzzNxDU41CpKzXUGKmsrWGrdWI96IJi6eE34X8guW7RXMgFo2+T1lAtZp+D6npI8
         OWfaBt0N5RT7JVqCVVOfseqx+0tjBArDm1+TjmQ9ot6/2p9mf2g34o1zj96ooRv7O72i
         5mMim3gjQYgu+kg8SM3XxH9n+W5ae7vRo5gDf/UAv7RPUwACm0VT8W3Z9jXKYVd8DZJJ
         6gkZsC7ZDo36yCckNfcrqPKl+zG1x8oLhBwC1BWrgjEUmM+v3a7zOtGBoRbEzFylpgqo
         Gqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756299591; x=1756904391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjK6OpIk8kyuSL5lFjeicimOy3JEve15WbehlqoxKGY=;
        b=bXDfvcbT8AuF+4fYi7Nn5rYhhF1dcqDbXCVs4/FkV3XkO5cvWwBn0zg7G/JsdD2qC3
         BQwusJTo9cRQiHjZfLaKRR9F5jq0lXmsetinvugQckwTwBKSPmHJUYSLMmmvxosIXrEl
         B7FxFiDYV/JTfA9X7iahpI+peBGTKfgcS1vfrFHpPkyoruS3FahHIGEg6v3Uus8xRE9h
         Z5C2vSf/d5Xg2cy6GuSsX+y7mkto9j6XRMCb2Uq/RZv/0m8Tlwnm3GGBH9lBQ5ZC6Dyh
         jbRR0AyFlFIS998/uHUCyT/VFVRiET1fRzNeUw5F32KFWitckH9J7H65cX7J4QR99cV3
         muqw==
X-Gm-Message-State: AOJu0YwJ5f1CDKwQ2BnknTH9COJmyrSnxO7apNQ/TANRFX0k9Skeokej
	Nrk8AsizSD7lzizrleVgQK3sMM10Qr4mGKsc67yCnAZUAz+MyVAMQQc6yTakUpj0238=
X-Gm-Gg: ASbGncvNyOLV3SIR4wVU1lFCGu6VqhnIt9T+btoo0X+hSG9BkV9RgjWD8JzqzGKNJUN
	wsPOYyFdVPtYXOWkIIwlF67SU1PR/6n5Qs3biKpJuLL0c6AxAo3HdNXrun6luZhSJr7OSVCIxYf
	ibxJyf7ZduvZS8IcYz/x7CdikO+lsj9jzWoEu9oQf1W+qVX58+h8D2bqv7eoNFw5hyrYSpf4SFL
	dxw28v6RIQ5ZApnnyY+zgakGpeBhHwMJZuSHhY6MBNu+Q9boJEp1Z29GXxZNg0U8Dvagz2K3Hyi
	tdeTyir1UdykwB2yjZYFvAAvy41FCJjijx2PAJL5QV698ynSH9HMdN5WfyWuoitmfe9lJBlEE2w
	3JmjshzF0SRQ9eBgvd7NTn3uflCmriKw6k6zj8zn0UnT07DDfoCw4naikjrlYjSQTIej2uJkBPg
	zIQPgN///tbctE
X-Google-Smtp-Source: AGHT+IHPwrsF3Jtd95IZMfDq3CXcF1TLGO6gNbOm6NJUOa4ZfiI/Wp4VmFA1B9k12eMcZCO8op0PEw==
X-Received: by 2002:a05:600c:4689:b0:458:bc3f:6a72 with SMTP id 5b1f17b1804b1-45b517954femr168350295e9.4.1756299590870;
        Wed, 27 Aug 2025 05:59:50 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cc890b178bsm3272069f8f.52.2025.08.27.05.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:59:50 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 27 Aug 2025 12:59:47 +0000
Subject: [PATCH v2 2/3] arm64: dts: exynos: gs101: add CPU clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-acpm-dvfs-dt-v2-2-e1d2890d12b4@linaro.org>
References: <20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org>
In-Reply-To: <20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756299588; l=2740;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=uoqgJ3OhNeN6asyWKYrHarA0VMYib5B/PdW+OT7cv0M=;
 b=vnVVuPmKG+UU58DxmUVjQUGxPgldzUS4A/j/jb9225yIdT/j7J7EUC0BGjTM1lU6pntynAPaO
 KdDzTE4di3OCQQZG6n3zIstYLljRQ4YZMRzjMl2OPkxhUs7ftmOMYdd
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_055952_850663_611519BC 
X-CRM114-Status: UNSURE (   9.41  )
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

Add the GS101 CPU clocks exposed through the ACPM protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index f00754692bbac39fd828ebd4ef7c269f746f2522..746b7d8ecdc90fd746015b8322924bac66c6e363 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -72,6 +72,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0000>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -82,6 +83,7 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0100>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -92,6 +94,7 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0200>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -102,6 +105,7 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0300>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -112,6 +116,7 @@ cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0400>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL1>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -122,6 +127,7 @@ cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0500>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL1>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -132,6 +138,7 @@ cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1";
 			reg = <0x0600>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -142,6 +149,7 @@ cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1";
 			reg = <0x0700>;
+			clocks = <&acpm_ipc CLK_ACPM_DVFS_CPUCL2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;

-- 
2.51.0.261.g7ce5a0a67e-goog


