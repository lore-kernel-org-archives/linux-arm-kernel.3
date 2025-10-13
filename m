Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E35CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 20:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M7w5z8KxrRxyU7p3Mrl1kYbxlm0NVCr4pzkwG2LaXuU=; b=YFpQEcdfsb9cdjV7UY/pZ2DXLx
	2Dbsbat6GWrflHwMk+J4Kjie2RAJsYDLEeTPoP0B5vFS6T52WX0wCYlYQOTSGMGgaAUsFWMDHvaKr
	S6g+BfEEZHZ7ulYTGnnzWdkNCn5SQjIdd0H9u/eU5FLuIklte+kQweM7DsccmydqCgF7vd4r013F4
	c94OgqhXazRWTcQoD9goFtz6Cfakq+V/RjvObJ3tOgEG0Dh/0X2ax/Y1+wqD2Y/pS0HZ1tFmT4aKM
	mHOVdPxvdwKaOYGTy//7Oi3MFlLOmRzPYmOo+jIWqfk2WElVAU/pbuta/FfoSa4rfyp3i71Gd8AcG
	W+7OkQ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWS-0000000ETvt-2mS9;
	Mon, 13 Oct 2025 20:52:00 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8PWP-0000000ETr7-2SN6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 20:51:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-46e6674caa5so23881805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 13:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760388716; x=1760993516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7w5z8KxrRxyU7p3Mrl1kYbxlm0NVCr4pzkwG2LaXuU=;
        b=MCbekgSdJ8Dt/Zac2nLTCwZI+drE69Z1deEbyTa3L5DWVwAo/OKREQDGDvh4ALP2Vv
         jdn0/FFzQGXbnzFUZTzd8KdRupaQo02kscarX6evPHg4nutHAlwjbHpW7izTlaDDoZ4F
         ArdCaSMvQnlLPHxFJh9yAe0VKhlMw2ArYvjvclJA+ahsTikw/x7avQeKvCt9Y9o/W6y+
         94QrRQn4u0wAheIEhqeLouAq2VBi9OaQk0ONVJL5vbci8CfVlKL9WGgIFgks2B7iXFF5
         iU3gByGj4Wn5r74pAhJIwAhVOQPWp5CW0gFlfd/XQ3WY89N6l+UKgz/UYrLOyKXQrJKP
         d26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388716; x=1760993516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7w5z8KxrRxyU7p3Mrl1kYbxlm0NVCr4pzkwG2LaXuU=;
        b=C7k3WVngmUWQjTyb+e+BGNKNuCh5TprOIVdOhLdmnsbVCTDYdCx8MYm/D9RIGMrvSL
         kBU01fcsJqLcjivz/uhgA2gcoualGbAIG1ZVu5ILxy2drP3Vpir5OnOwI85yrmH78iZ1
         uNbNn0WmSORj4AH/UAbY4sWJ4x2JKZFjbOsUJtvHI/03iEFRyCL1ELttm7ydLXi2RT8f
         p79jUxtgNVPZL8R/j50O7Jb+9iAvxf3wMh2+yH5h/BpvA3ihUoQBoyodgKrFoHpp5Quf
         VwaW8j40Kb0AOAQyP8miIAjvCe1lWzTcthAFMlkAniwBi+QzHRsJe/2wa8M78SSTxk26
         ZWzA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ4vyYOL6kTb2PJ6ygUkJm/ZVz2ydtIzi0HWTG4cI27HWSrAQDjpVRaBH3RsP0Z/noxuj+N7hJY6nWRti7aAzg@lists.infradead.org
X-Gm-Message-State: AOJu0YzzusDsUGX+Nc63O5gxYdJMVTEmc2jFjsgmlFAuBC7AHlwOIFeR
	JnRVxeHP10pkFVMYBgCjal/PTP7fjgy3lHSDq8XvAz7c1+Vh3wkqwZiIE81r+zX1ecM=
X-Gm-Gg: ASbGnctkXaOLkvPHbtU/b4P/RL9/rydLhe4aBnmjRsCd+BVTFyVc6M0HoZAZfcuYox4
	DplKnjfaTyx1MOBRN8NmvHKXXl5jS3g3WT1PA3IwXHhETnysNLFSZU/KWzZLh1Oc7x+WjmY6zCP
	fsAsP0eYR0FxLeAmhImqGRjm55mhRUHimndf9rsTbiMvc49Ljoj42FdIbohu5h1gk4UaNADuLhz
	KOCXzpgwEITnEhYo3a0W0xWXbViW+hTCWCiNEjrwMquxQw3DZcgGksM7GHf9OemNFwXrLrw19Pj
	XI2FP5jxiSbvfxulPN+dFL5o8olhZw7qXI7bqhe5FXa6+OfnoSL18ffaz804Bu/0pj9+LqYaRLO
	qrA6GflEDDTOvaCZlwXeRsssmYOoMXTQdmbHjJUVneb8Tjon2/lOT/KADgkxEY9pbk5FEzxIjvV
	Sp64ArD/xylYjSUe6GCuZ0
X-Google-Smtp-Source: AGHT+IHcHlsKIP0Mk9NE5Y6ACBtaLFx5panG+gS1uzovpItpvweBLReojSWXTXiwTmSFJ7De3j4OaQ==
X-Received: by 2002:a05:600c:6818:b0:46e:477a:f3e3 with SMTP id 5b1f17b1804b1-46fa9ed23d5mr150899755e9.18.1760388715740;
        Mon, 13 Oct 2025 13:51:55 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.67.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3e3206sm133512615e9.4.2025.10.13.13.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:51:54 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 13 Oct 2025 21:51:35 +0100
Subject: [PATCH 6/9] arm64: dts: exynos: gs101: add samsung,sysreg property
 to CMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-automatic-clocks-v1-6-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
In-Reply-To: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2189;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=O+8J39i2fHZkYMM2LMOQ9vzlXl+k0rDoBKMRFPbNLG8=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBo7WZZW/9QdYl4D6XrvzwE3Pa4aJol6NrersUlA
 HXzgH4jpB2JAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaO1mWQAKCRDO6LjWAjRy
 ukgZD/9kwT19MKy+p7eaGNRAwMNSOiSh+XuiA8fQBjI0j0ckmMuJuBB3tL/5JpMUlKDR4dd2vNg
 SUYYa/N5NN7pWeV5koBdKdAjmIjfNytW6SSALKtKjeDuLxKjcr5NJN6XioAQ3pqcoRbRWTW++bF
 HSxN7TJWnCha6Njg/rvVBkfTFXPvL0dF3uWea2qi3A71tFm65b92N8BF1VvnRmq2stngDCd/hXw
 bdThIvIaaqRpNKCq9aeuo3+/cn1sRRPjeMEKPaWPbAkG1fMCIwGR6+1VTPTqYyD55iMZ+7ES8Vc
 mvXta9JBOMWZC3ydgN4sted76rj+AiL/3Kozxg+EdlpYjYkd4OQvwkvaobUJGJTvo8O9eRQnaOo
 iea/ItZBMzymDxnOPN+JcjdWLA3rpB3IvXThEusH7wAiBNxRO6OeRw2xQlnCSDBTF4lofT0BiE8
 Px5dl322X6DxFnwfTbueBc4LNmtS4bXFN3qhwGqvTfWqbpjxeja24RwVZPqhtRQpp4yi76/mTjz
 uKbc4XUOu+3FKxYs1hiTBrBx6fC74htKy/dKicPtZ0KMQNuygVOLDf5WnSMXGyfrQlCu9EOVDzf
 OBiu3vTIX/gBJyzBWYk1ChyGv6VRuMM6Pj35wR1mwNeE7AbB+aXbkjaQKnk3Wlw8oSGqwtBsVtu
 Mchat1WP8FScMxA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_135157_824198_7EB62653 
X-CRM114-Status: GOOD (  10.24  )
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

Each CMU (with the exception of cmu_top) should have a phandle to its
simarlarly named sysreg controller.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index ab66c055e0ac157f89a0e034f15bbe84e20a7e82..c54468ddbb02b170ec79d56ba2460f2ffb0dc40d 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -293,6 +293,7 @@ cmu_misc: clock-controller@10010000 {
 			clocks = <&cmu_top CLK_DOUT_CMU_MISC_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
 			clock-names = "bus", "sss";
+			samsung,sysreg = <&sysreg_misc>;
 		};
 
 		sysreg_misc: syscon@10030000 {
@@ -377,6 +378,7 @@ cmu_peric0: clock-controller@10800000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric0>;
 		};
 
 		sysreg_peric0: syscon@10820000 {
@@ -923,6 +925,7 @@ cmu_peric1: clock-controller@10c00000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric1>;
 		};
 
 		sysreg_peric1: syscon@10c20000 {
@@ -1281,6 +1284,7 @@ cmu_hsi0: clock-controller@11000000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI0_USBDPDBG>;
 			clock-names = "oscclk", "bus", "dpgtc", "usb31drd",
 				      "usbdpdbg";
+			samsung,sysreg = <&sysreg_hsi0>;
 		};
 
 		sysreg_hsi0: syscon@11020000 {
@@ -1352,6 +1356,7 @@ cmu_hsi2: clock-controller@14400000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI2_UFS_EMBD>,
 				 <&cmu_top CLK_DOUT_CMU_HSI2_MMC_CARD>;
 			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
+			samsung,sysreg = <&sysreg_hsi2>;
 		};
 
 		sysreg_hsi2: syscon@14420000 {
@@ -1412,6 +1417,7 @@ cmu_apm: clock-controller@17400000 {
 
 			clocks = <&ext_24_5m>;
 			clock-names = "oscclk";
+			samsung,sysreg = <&sysreg_apm>;
 		};
 
 		sysreg_apm: syscon@17420000 {

-- 
2.51.0.760.g7b8bcc2412-goog


