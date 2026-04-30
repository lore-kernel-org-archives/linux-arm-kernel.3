Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D737FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 01:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kr2cTDfHGDksP3jgY+WcfLwMoeO5l4D3sr8mkWZf5zI=; b=mNvZEnkl0v1NdFzCfsAyG3jL5m
	1HXjKHQmCMhig3Vu2rDuj7djwaRBHUw2CX+Ev87iILM4Ct5MPfcd8zjVFWNpVRvjMuuzfTHIHzh1y
	/noago0LUT+W764CDflgCvso0R77Afva9u9y+e4z8I47wVe296l/44wspqihq1aBbAMLZ0jYuWPtf
	Kip8NcOXkLhQyRyJIpj4PtWr4CyYYz39R+Q6/ON2NLAg4WZDmuq5FYk4Qg1Ikhx8yDlIZSCkWu4Ys
	NqaD1dvzYTbKeJkxjei8C1FTSciCWlVzE/qiLxoPOxGuMsf+y84wc2CPmju+PDrdInZuu+SFernNL
	uMBZNEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGeb-00000004P4i-3SHY;
	Thu, 30 Apr 2026 01:57:25 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIGeI-00000004OpP-3Xkr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 01:57:08 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-44509921fbcso211763f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 18:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777514225; x=1778119025; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kr2cTDfHGDksP3jgY+WcfLwMoeO5l4D3sr8mkWZf5zI=;
        b=U9OxJSRpOScWBOzQuyoqZBalxbTwW91HWAIi4nKKijO5bz0BaqIpajpYqG5mFIQCIM
         nNNJnJp4JGslkYUxg73P5RfgUJbv3Q6OssIoe5TActT1ThIGMoyXDH5FbmL2v9d32993
         QLcOggoI4mpwJ3ayCvooTO4nnXVP2WYU6ZxNanKA6UKHAF31gRDXzOVqPkQD/wbZ8Nnp
         cxsCHz0brEStNZ7ig95hTBkr6UK4SDXKai7lKvWgU0LKuDD8NTSeVQ9XSC1t6mx1DHkl
         2Jh7Ey8mKmweY8nGWz2C/aCa/2ZcaZhAIFvZ8JFYGKELr3PF/aoGkVUma75TfygH2NtQ
         7Fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777514225; x=1778119025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kr2cTDfHGDksP3jgY+WcfLwMoeO5l4D3sr8mkWZf5zI=;
        b=AUch4y3HdXCk1HlTkiVgs0JwFu3wEFYEjChB7kOcJ5HehD9B0cQ5XUCR2j46Qtafyd
         qYit4elE/uEs/TCTHoX0I3dWAQlXv2tor8mDdOMPPwgv+1SQtAgjY95v/qYx7S21ZiYx
         as2cI/kTNib+Mf+17p21TiHFX1hy0eeyq4aHDbNj1wBV90YH7GTob9FR/hiUXLxryVc9
         WmFEQXnjsw57KiwWy6/OMSnxKHTHEL39fKVlz5zyq4HrK8Bpx7uRhu7W+sSK5dy+YqiP
         0EK0h4lzEYU7xA91hz5VterzpKhUvU72hZkb7f2GrJbD9ZDcpSLrDOzJ/z+YF/VmyOQO
         aJ2w==
X-Forwarded-Encrypted: i=1; AFNElJ+sTrU943sulCCDyj387TXuMEKq9dmfqMdDBJJhyUMymp2WCfMtxUlxgP9b/n95Ha9buZ5bLIy9av8JOu1ICsPQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw6FRWIocEJnTqeHuUgwNK9/8nvOgfdha+zwIUFEnuyjHi7Tqc
	3Fu0fWH7pt0WKZ62L5LyIr+PZl/sIT+oFkvHUfFsoPatLKYB2KFbxb/0xcIBnOaflkAdwUXSPLj
	TBRzPLeA=
X-Gm-Gg: AeBDietfbHke/RnmRIJdgKZES1VgQeazrYr567/cA21oKR7CCGfjRCekk8f0lQJdcOG
	t3lEknDTu0rVsBhkVkOD7R3KDQUWeIBQYumSNP/w4jXRuTFGpZZ3Gf5w5jQvu+HKaP5YMrUABxD
	xni4QXoGoVj41idFwVMKmAsnozLUGXxlHlPpKhYqSmbiZaZtazSlAask0VjDeX0eThl2IKdGEgA
	cF6dmuPpHMJcoVBtIQgpKdztLo+a42LI0/xYdThof8WhoVXy5HBxIMCBtnqXfTUtiFL5dOkNwmp
	gEjjK9p2EpbFGFUZ8SkaACQZwvmDdNd6rfo2z6L4Y/JtCJyE52f5G6AA/66KS8MNI5vuruPVezz
	AZx1aI/heKUzqvenlbMBzDFfm+STpAvoQ6VNmd0di+03HyT5rwa3Wocl0Q3432H59wZSMpCEvK+
	ygSBau062ceYwm5ouJhnL68qeWucWAASwqvY2jHUQQCx3IO7OGnsQOcJi1Y+o6o2ishdzk30J2S
	neyyebiOXRNE4IjfPM1MiGKqW4=
X-Received: by 2002:a05:6000:1867:b0:43e:a9ba:b194 with SMTP id ffacd0b85a97d-4493f1307b6mr1254377f8f.34.1777514224614;
        Wed, 29 Apr 2026 18:57:04 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b76e5bf2sm9915013f8f.27.2026.04.29.18.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 18:57:04 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 30 Apr 2026 02:56:56 +0100
Subject: [PATCH v3 6/6] arm64: dts: exynos850: add PMU interrupt generation
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-exynos850-cpuhotplug-v3-6-fd6251d02a17@linaro.org>
References: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
In-Reply-To: <20260430-exynos850-cpuhotplug-v3-0-fd6251d02a17@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_185706_910092_9E9332BD 
X-CRM114-Status: GOOD (  10.21  )
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

Add pmu_intr_gen node for Exynos850. This hw block is required
for different power management routines like CPU hotplug and
different sleep and idle states.
Also reference this node from main PMU node.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 3881f573ec08..04662b1c5458 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -214,6 +214,7 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
+			google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
 
 			poweroff: syscon-poweroff {
 				compatible = "syscon-poweroff";
@@ -231,6 +232,11 @@ reboot: syscon-reboot {
 			};
 		};
 
+		pmu_intr_gen: syscon@11870000 {
+			compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
+			reg = <0x11870000 0x10000>;
+		};
+
 		watchdog_cl0: watchdog@10050000 {
 			compatible = "samsung,exynos850-wdt";
 			reg = <0x10050000 0x100>;

-- 
2.51.0


