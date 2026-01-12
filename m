Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACF9C9EC94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/mVNh0N4oZBNRtG/tnUEWsskBYzPAI0h1SdKQuAkes=; b=F7LqddaYqm3Mj0aqWiMQVl24dG
	HtDDimAlJZCC1kBksJDPLUaiZe/8Mx9jXx4gkfoTqnLdl4NQvnCQSlylJJTkJvXpUiZz7IIMJ6kWj
	qlBFk2GAZn2l1Yg6kdrAVvSvyQwRXWPQW1LKm2/Rv8sj7dAhbqu6z3+3ZhmINay6AvBqIZQ5u7iDu
	Z3X8/NZRy2Wgs39vjsRszS4Er7lWXaq31KPEEJjutn5naA/Smdr1MFVfkD35AHo9LKncHHWZ3JN2I
	/gPCSIvorPTz+z7OUcE6HKuvVU4ZF98duDtK7JXgFL93vGqe3h8OGvO7AT+gZru2n41OS3BBLSavh
	O94J5vYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIjH-00000005VM0-18xz;
	Mon, 12 Jan 2026 14:17:11 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIjE-00000005VJu-3fBz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:17:10 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-432d28870ddso2247102f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 06:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768227427; x=1768832227; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/mVNh0N4oZBNRtG/tnUEWsskBYzPAI0h1SdKQuAkes=;
        b=nSfeh21IawWeBTlddaRNHXbs9aILZ7oOr0P551jK/B18ReCmRoSU6tzuZZpX80pAta
         O4/9Nq/ONt7fSZ1TPu6klkhtZ1bqyI261CoP103w57wZ7EaznAUEQPldg9BDJSNxTT4R
         NTCATaDRe7p83nzUMEoatPOwECItjM2l3hQ8PQ+2Px6f0LYHLAWPfibg03rL0Qs8XV4O
         hv8EYTb3hlz3jIsDvC2t5uAghpH+L7FFhW3z2Mut6oKgZIVCjyWqsd+egFnDcwPTPniZ
         skzWtTrC/TFm2F1ngq8ftPJIFHZvbR2L3FlBPoBMkzBVVfuxKshWihfxG6AawDWMN0R3
         miMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227427; x=1768832227;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c/mVNh0N4oZBNRtG/tnUEWsskBYzPAI0h1SdKQuAkes=;
        b=ciSiCVcunnQEeKnjPyZSn0WlQyP8tqEyLMIsk+LFL9GMeFlIgJ0iw3qs8PMvn34pgL
         7h6dSNVSrYvFsc8EJKEbt4xOtvSUO552IpFur8rU+Sa3xyxVDHFUNvHeS2GpI5YtrN8u
         S5N/88GFfeh5luHjyShO94iBgQVKbG8o8IbKPKKqLAR9RaHWvFPTIMiVLYasY6WcyO9O
         9wVY8Vha4XWOs8BvMEjZKFrqNZQHyT9KvNJe+GZ3UoBx+BN+Z7gAv5Rsqpbyh4wKN063
         iFGZTY/8vZ/HnqUxH6ug5WN2S/mpVFVOwUR1LkaN4VB5TZuvib5lwnOZP7G5iPZZ4Rav
         lEwQ==
X-Gm-Message-State: AOJu0YzjKhdGTzE86/c7ERsyIK9egOGsFCzgQZNj17pcYQKgl7tKVjS9
	M+bX+Lh/yTw9GTuz4HLXLIJv90z9C+1hT8zc/eUkv9iyhqXqTO2fdl4B9eRZ3Nz8IE0=
X-Gm-Gg: AY/fxX481Z4btSyhi5Xrxjkx/k/M0OA1nanTfztrO8zf3ueOhUcn6V/C/MBCKHY8MZR
	7OjbYyICvUxgJVVFpzfULRfavRm7pn5cBnfm6bnTeIFAlBQEbPTk0ft0gV3pR0VMXmUsIiQotv3
	PULR+RubY5/oPlOLaJXM0LASXOYRzs2I4oMVAfGyXr16Fe0fkEHOcihJTmHHSAVCV96CB4j649L
	Kk20HDEAuLXkEl+ckdOAb3E6HT35+3POqSgCLKZQRbNHeQCM6RIZjK4C0L96J/jKNHHnWPbop2c
	4iSSnK0ddHo3Qs6ng+31YlJdvirNBPZEcqJhpWr2vL/0vxMkYw11Hsc7gA/1IT5K0Bus/pWiPHG
	Ibydg9GPxveryBDGjTRpnxRERjWNB9gFeu420b28yI1CiLVYNe54nypqL767p4u7SASzvA80sqz
	6M7+bnJttZeT462UC8R9lyBJVNjBrv/zecwVQ3AX7j1flA
X-Google-Smtp-Source: AGHT+IFrBsfMSiMplrBBPh8qUuCeoTdCdDPt+sDIa3dty/7II6lHCVnL5PdVVGI/DhJcYTKl05dvUw==
X-Received: by 2002:a05:6000:4301:b0:432:84f9:8bf9 with SMTP id ffacd0b85a97d-432c37758b2mr23151513f8f.57.1768227426762;
        Mon, 12 Jan 2026 06:17:06 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:4c43:39e0:348c:a72e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa07sm38705096f8f.25.2026.01.12.06.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:17:05 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 12 Jan 2026 14:16:52 +0000
Subject: [PATCH v2 5/5] arm64: dts: exynos: gs101: add cmu_dpu and
 sysreg_dpu dt nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-dpu-clocks-v2-5-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
In-Reply-To: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=TtRpDGPGpy/+0HSyLMeQr2ov6Bl/3yzopI+7aSfxFj4=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZQJZjFN48vVWqUbIG+U37VQZOf/9gT4bcSvlq
 ckKiGZyCbWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWUCWQAKCRDO6LjWAjRy
 unirD/9Mha/fVtxUz74hDxmJSz/VqEgTSj/OJ6u+J9+JdyV7Lwqml+TGaesgzpsxtV+HfQRXJng
 j5Bfpj09IUytDIAVBnHUAEJE4GzXIR5Ce1GeTZhMYiSlgbW3ExrY2ZSAAEeN27s4dJJ2Y2g7OLG
 lJFI5Kv3l89I+rdxPa9i8seWQ+2dn3ziS06ifh+oqjJXqmO+kBCzbPE8YC81N9eRmUWA8LM3lLr
 lkleHD0VSpZEbevHvBb0p2K52mKQDvdZpF4kc8PFfwERWOADsNKerb5sNcufkq/LIUJo6UimYrj
 sl2P7RJneHmHdsiGVoZQxhpWLyVdPjE8oYyyKafk0Ofwgi4obHTVUbxQCV+zWdGLBNxCAhMAanT
 7QKVKmr6tnUzMPeeJ4Dx3Xd2sSNsURfMd3sEijJYXlqFAOwKoopcEVYb24wu3B338kAAi6FOw6f
 imcF9mKH4EmMS1897VNponb7JxFult2xk18Pv5LxmwrKATezwrj3QbfAOuOthqgWkwEA58FZIpY
 hNoUn4786K4qIpQUQylpNL+ZeysvOnXduehZMwVoqgRfMnaLUcXhTnOzl0z8Fh1MOnoKTalJjOy
 aUiZkmgIDx2pTssa36zCiT9H7H4rFck+aWfMcuZvpprPfPwSRWm8I7W3MXAmv+hZssWH3pJsKuO
 hfnOg+XpwVdfS+g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_061708_937253_85BE570C 
X-CRM114-Status: GOOD (  10.49  )
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

Enable the cmu_dpu clock management unit. It feeds some of the display
IPs. Additionally add the sysreg_dpu node which contains the
BUSCOMPONENT_DRCG_EN and MEMCLK registers required by cmu_dpu to enable
dynamic root clock gating of bus components.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 48f3819590cf8c05d6bd7241cfed8720149c7db4..d085f9fb0f62ac2f57b104c20880e64d885d0bee 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1815,6 +1815,23 @@ pinctrl_gsacore: pinctrl@17a80000 {
 			status = "disabled";
 		};
 
+		cmu_dpu: clock-controller@1c000000 {
+			compatible = "google,gs101-cmu-dpu";
+			reg = <0x1c000000 0x10000>;
+			#clock-cells = <1>;
+
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_DPU_BUS>;
+			clock-names = "oscclk", "bus";
+			samsung,sysreg = <&sysreg_dpu>;
+		};
+
+		sysreg_dpu: syscon@1c020000 {
+			compatible = "google,gs101-dpu-sysreg", "syscon";
+			reg = <0x1c020000 0x10000>;
+			clocks = <&cmu_dpu CLK_GOUT_DPU_SYSREG_DPU_PCLK>;
+		};
+
 		cmu_top: clock-controller@1e080000 {
 			compatible = "google,gs101-cmu-top";
 			reg = <0x1e080000 0x10000>;

-- 
2.52.0.457.g6b5491de43-goog


