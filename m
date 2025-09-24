Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0449ACAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yH8er2WLBKFy2pvhJtg/nSPNfqLqFULuGIksUuRQwfc=; b=i72ihZbVHlopAbiNgHKs03LAJP
	rit24/uf4G+Mg9LjBSir6wrrFgT9KKv+yesoIX2PMJFXmWQO+xdFVKA6665RdS0qRivWjNxB3PEZf
	rcm2S2IukB78/Kp212duFF58vaK02ymXYGyQ+d0kGffRobrcSJd60/4pPDHLaMDtauQy2QrZfgOD1
	kxQJRyRZ/h8DJP2FBdc8jc+fDFZRyJtfXgVZS7nzNcrRoMAV3p/mRtnuKArBHHJ97J54EEv6FQpdx
	8xd6aDLIIvQPsN21/uq39ZsiReT8FO28Y3Mdfwe3D9YKjL9n2/4e3+5jvcD0mjo/c+cF7uTvK60VR
	Vnf6TsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RDM-000000018ML-42L5;
	Wed, 24 Sep 2025 15:15:28 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RDH-000000018I6-1cmJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:15:24 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so3207957f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758726921; x=1759331721; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yH8er2WLBKFy2pvhJtg/nSPNfqLqFULuGIksUuRQwfc=;
        b=qwAjKVq0ltyAM9P1UrGa+5lzvWtxpegs5oGNqAQ5TirVEO/ZDvXau+180nfH2hH0JM
         4JD1NFUMm0vMEzUvwTAhkGJj3z6elH3I/9R4CZ1Pdu+2e3Hd5FpfinH7YmCRlGPTx1oL
         XTXKlE/Rs0SJCDLpkdDubx5PQTZzCeW11jHa5bhzlJ0B0u4Jq7h2SwY36F5qngutdbVV
         OxCrebbInz91pFSy/tCMGqN4/U5BlxojjxIJYndKIN1GVP4Kc/4NVzZwhQ6Nywlyrsfk
         wChUNk3soC5XFNYJrKP1CUioZ3z83GFau5xNeThMw40+P6Cdu3gRFYiYelsrEiJGDK1b
         AE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726921; x=1759331721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yH8er2WLBKFy2pvhJtg/nSPNfqLqFULuGIksUuRQwfc=;
        b=U0JCVna9im7CJ7dLz8X2CcUwBiPN5Z4goaQg6/qaW7S2WbwQv7b1qzSimEoFAatu+7
         M+qQf31jGmZ3zpIx2yNLbLlYx89F/e5hK0BEFLnSR4g2qEskiyxw9Pn07+J5eNUPQ3/B
         eMZMdEej3vjLMolGJzN48SajYFijl5sNo2vOqjMKlEPqZ52yBn751qliac520AKt76N9
         c3f+hGUb4TPLjMstjOhK8jIqMhoggT/9Noo4rKu3R3mRCjZsodibRkdjLfjms31h75rA
         eoZXrZNrCHlKG7PPnAhQGbPQQI9zAfKF30vsUhxbbSZlmjcUJbVmBGuP+yLpK0cQHD9g
         p2PA==
X-Gm-Message-State: AOJu0YwVGbDguBZDJxU6sJqtzlB1EwuJq71nnBQAZmOP/p5yjQmGD8UY
	HxEqn5nzlMad7iDbSJqlStA3SX4ga6wItDNYMAGqQWOxbIrZNlOidxP+eNvSekzfBjE=
X-Gm-Gg: ASbGnctziKFozlHSm63XqvhuEux1OxMuwym2rwHzUm9AsW6g/wno+Wp6z/Q7kj/rxWm
	57J6N1/P46w7M6czyrUaiC9/hpt9DkG+cERdMt+RYL28u+2pcbilz/xklqSIoPQR5WeSj4zvKuq
	U5D1Jsog2Y3ukqfQuhJ1jbwr0FlINl+HyCajlmOhLhxM39pkpdUu/QVjTKP1A4qHTvD5hHV/xn2
	xA3RUkm5tr7Ejm7JOcaSwF2ovB1BWs76Ukp6INKPax0oyAM3W4aw59ZGTdFLqnApigyAeMq/KUt
	2ZxMn0hYok+eWz1SIEij6C8LgZdP0FswTqk6wxBkssnPwxMOF4ZzqsdvWp5nfCCLXjnf8sA+rgU
	lvRBEmdcOovGYL6VqQBsDKkEn9pfwnuXDoAWfIk6gCH8Q7p8Na1oFJLkB0tWtCvuGp4gUsm2mU5
	A=
X-Google-Smtp-Source: AGHT+IGgDCS8ayniuFNQT5/k9DeS1jl9iWus2UZI/q9DVCjLLBthhuyhs6xf+tcMVx3nO1q2hjSHog==
X-Received: by 2002:a05:6000:1884:b0:402:a740:1edd with SMTP id ffacd0b85a97d-40e4ba3a51dmr315711f8f.39.1758726921493;
        Wed, 24 Sep 2025 08:15:21 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a996bf1sm36541855e9.1.2025.09.24.08.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:15:20 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 24 Sep 2025 15:14:42 +0000
Subject: [PATCH v4 2/3] arm64: dts: exynos: gs101: add CPU clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-acpm-dvfs-dt-v4-2-3106d49e03f5@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726918; l=3181;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=fbP+TlGg3NLAStwFGbaJsLnhS+YJCTLqAERnvsIlpbU=;
 b=jyG1osPC3rtt7uF+ad2Qp5/Or0/SPA2xOcoNoupHjypQ2VNpx8eT81G/wEh2mhALZVnNSsyJy
 50+W5DUMM9RDHBOJrxr2gCo10bcNTUDZHNDByUXpXYqFLmrF+p/kXCo
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_081523_455825_3B499590 
X-CRM114-Status: UNSURE (   9.87  )
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
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org> # on gs101-oriole
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index f88d45a368af7ef88e8cdc84b3a81a63a753832c..7326801c9ebf270496997839185594c3c1776577 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -7,6 +7,7 @@
  */
 
 #include <dt-bindings/clock/google,gs101.h>
+#include <dt-bindings/clock/google,gs101-acpm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/soc/samsung,exynos-usi.h>
@@ -72,6 +73,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0000>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -82,6 +84,7 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0100>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -92,6 +95,7 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0200>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -102,6 +106,7 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0300>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -112,6 +117,7 @@ cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0400>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -122,6 +128,7 @@ cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0500>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL1>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -132,6 +139,7 @@ cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1";
 			reg = <0x0600>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -142,6 +150,7 @@ cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1";
 			reg = <0x0700>;
+			clocks = <&acpm_ipc GS101_CLK_ACPM_DVFS_CPUCL2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;

-- 
2.51.0.536.g15c5d4f767-goog


