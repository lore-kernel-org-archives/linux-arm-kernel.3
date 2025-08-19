Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2D7CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2R8D30km/KSA0O4LJJjN/QUo92gPxApdF/JdH5YvZSM=; b=ZyoZhBAwJI1weMmAExWgJ67gP0
	uo9KNi2GehCPlzvBOiHxI2f+D0LF2SOmqr9eH3GZrIWAAboc/jcA6TlJE+/INmBPxjQcV/nWL7oqQ
	xycQlMLAjuiC1M/xa0MKioq/IAXR9XX6LvcoCQps5+c/Wu1126Ih4e0uu2DEZqs9GkjIOouHUzIkY
	KMBOhIBwj7tpeWLRhmGGzUsP3piGgyrvdsYOue/QPStvJSedFQ0fTiCGBQUdo7j8KAcUc99Fc72mc
	lPC5xJbg8Ct23MrtA2YI3BUCxxVh2gDdAolcjzsYYEjhvVKdzcb/mWDrZjqXn+cpZtsfKNsxdQgvN
	JMl8Vy1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNfa-0000000Anqr-0Ktm;
	Tue, 19 Aug 2025 14:50:38 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLAf-0000000AO6Z-0Mle
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 12:10:34 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3b9a342e8ffso3648570f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 05:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755605431; x=1756210231; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2R8D30km/KSA0O4LJJjN/QUo92gPxApdF/JdH5YvZSM=;
        b=tfRk47CPyKOwGllsQAjPa/CShoIYaqsD6JexYW8DgvTV2ptMBNN+Yn67m1T9mJKzWx
         k4EPSpuLl2U2pTSi48JHG53djEXPgC23Inz5PVqSmuc36i8a424k8530fJjrAYvR5CjI
         6n6EVNzce/0EK16tdeSXRQ3cwn9ywEp+n/lOvCza3gEnXW2T+oNFCT0vqS7hRDuPC7dX
         I2sYDjfmIjU264ob0dr9ZuVTF1VIej9iv6M5e9WEd7ldi64qPglFAJp7a/CSlbJAQBmz
         wD67iqAGr037PiTIkATGG7iYNUFl0SDBU3DszdaVRrwCSFNs17AjI4IE3lVRJtSDUbbQ
         i1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605431; x=1756210231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2R8D30km/KSA0O4LJJjN/QUo92gPxApdF/JdH5YvZSM=;
        b=M/MZ+lRav+sSZRvF2tcdm3YovJWvhWZTZPJ1Z0TXEjJSfxmJFT35FvkKNOBotXTdBG
         HCKzmTwacii2QcErE3Wgk8AxWQVwTVAADOC4KUtcDPdrSLZ4QbVUFnyEEpGgicGqkfXk
         vLUHmzTpR7UcP9iaXLsJVNkSSlihgXOaA5IiQQEsl1ViIVmDMalo+aiZdqjrhMyy8zu/
         6uWdpcXC63SjAJ0JQrinL9P20T3OBiNlVaImFFmcCh0iqyAFJwjsZe7PnoUFYhG1ENBr
         4MPupOxbHilEO/lb03eDNbneeG3IrKq/AelD2LyFgtWAwp8SLWyYnZ2bFCRO7eZOnJT0
         LS6A==
X-Gm-Message-State: AOJu0YzEXSdu6y32QPlvRYYgu00JyqgaNiKcOvnzewT+Krn9shvS8Viq
	IzWhZ5Cu8npCd6UpsxvEN8zc+hn71buDb+8CXQsVfI4sIxvvHFsyGf/P1zRNDJwb3Wo=
X-Gm-Gg: ASbGncsVHkfpf/hTuJvOhxwJUvVd+djj1tpm73tcC473u6sQGFPAl4gvNaR06cJgWE7
	nN15y1FYq8y9sK2mfGI2JjfwgHgvxleNc0G94oRayobxzGs2QmfXO7nj4Ci5BhNPLDUBDJib1Ke
	pVcK11S6eQFLjEJkeZUBIossIOKsO0UmP+1iJz8sOXR9kyfBhZHP/nEfk1QehF98n/lG0yxxQaQ
	x1dv+z4ZD5tgw/weRv4VxP50OMGz1PRRyqQyZgtHIN+vDSqhuTvY+uP9V09mldKnPikpEP8W5mK
	zHnjW45WlXUJwJgnoIjQh0Wvt1pIuy0xTsm4qr81cpmVNH8SH8zjibH3+Pdp23sUwJRmABOFMfQ
	aVzOpIdB3OHOSvYLvkg2ICoHDRUP1MenMTXiRUVMLXELhMWfHFy0GiPyqnoJKsHhJVof1Ii7WUC
	CwgA==
X-Google-Smtp-Source: AGHT+IFppDDMa2VTL2CIGZHM9gzBH35t1wQZSmplPnzJjHi59FMlVUz9oCZUMUh1Ng+uHKmRdhHOVw==
X-Received: by 2002:a5d:5d0a:0:b0:3b7:8acf:1887 with SMTP id ffacd0b85a97d-3c1333b5d05mr1714373f8f.13.1755605431436;
        Tue, 19 Aug 2025 05:10:31 -0700 (PDT)
Received: from ta2.c.googlers.com (245.92.187.35.bc.googleusercontent.com. [35.187.92.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43b9asm3464410f8f.24.2025.08.19.05.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:10:30 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 19 Aug 2025 12:10:21 +0000
Subject: [PATCH 2/3] arm64: dts: exynos: gs101: add CPU clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-acpm-dvfs-dt-v1-2-4e38b95408c4@linaro.org>
References: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
In-Reply-To: <20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755605429; l=2818;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=nqRaXwOYUnbNG0j2pkHNtlxp7R1a7PqyphjeUytPpmQ=;
 b=pFUBFj/DVmeY+1QROIBAVpK6j8hChOM2KVuU6gLsrewVj4sNAL6TBghVOuWhfLXWLQ2nbVtIP
 K8YHpySm5NaC08vEfS1NamJQbC18pPnsZa5Tc0q0R/snEt9EkN0plWQ
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_051033_130016_D4F24A61 
X-CRM114-Status: GOOD (  10.29  )
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

The GS101 CPU clocks are exposed through the ACPM protocol. Add them.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d010b8ffc4e09562519d6796691fe573c68b7ac7..42926f8bde8889ec99ecf9fc551629a0453e788f 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -72,6 +72,7 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0000>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -82,6 +83,7 @@ cpu1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0100>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -92,6 +94,7 @@ cpu2: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0200>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -102,6 +105,7 @@ cpu3: cpu@300 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0300>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL0>;
 			enable-method = "psci";
 			cpu-idle-states = <&ananke_cpu_sleep>;
 			capacity-dmips-mhz = <250>;
@@ -112,6 +116,7 @@ cpu4: cpu@400 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0400>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL1>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -122,6 +127,7 @@ cpu5: cpu@500 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a76";
 			reg = <0x0500>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL1>;
 			enable-method = "psci";
 			cpu-idle-states = <&enyo_cpu_sleep>;
 			capacity-dmips-mhz = <620>;
@@ -132,6 +138,7 @@ cpu6: cpu@600 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1";
 			reg = <0x0600>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;
@@ -142,6 +149,7 @@ cpu7: cpu@700 {
 			device_type = "cpu";
 			compatible = "arm,cortex-x1";
 			reg = <0x0700>;
+			clocks = <&acpm_dvfs_clocks CLK_ACPM_DVFS_CPUCL2>;
 			enable-method = "psci";
 			cpu-idle-states = <&hera_cpu_sleep>;
 			capacity-dmips-mhz = <1024>;

-- 
2.51.0.rc1.167.g924127e9c0-goog


