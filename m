Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E62BCFA45F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J3smhQx2K2n9mAGJ2/sVtY1rBPZPgykalQxV0Rdjhbw=; b=HMqC43TZlcfer+f7mdzRa6qINO
	LGmrJ+fUb8cbZ0wy49Ga8tDPfj6mGawHOZGe6jZ3XiJI/rAepmudRuhq95uW3aBjKPpVwnZg7BsYS
	fdtSRo7RRuZ6AVGZN6QMik4VUb9/mcgx0enHj9Ey8LppOUVblsLia6ki/Yk5UL5airbAymbPHl4vp
	AJDSZtg+hCWPQDRilf3DAfw3wJUpaH8y/5CNwhPH/xSy6gzQT5/R7RKyTtVMSW9ZYB6cLLfaYOn24
	dsrs71C4XOI+/LQMvMS2v9oGEBDxORp32yW07e9ftmC7BjmP7tIWgJfBF2h6z/S9022A6gqxS1kiq
	T61uDDKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3h7A-0000000FhcW-3F2t;
	Wed, 23 Oct 2024 19:33:52 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gab-0000000Fbr4-3bCj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 19:00:15 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71e953f4e7cso105050b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 12:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729710012; x=1730314812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J3smhQx2K2n9mAGJ2/sVtY1rBPZPgykalQxV0Rdjhbw=;
        b=QPxnk1s9o6IXqwrohfZJ1EqWDW2lKez6x4z1UQH5sOCZFkrqpizzCgo5IgB2fxxGt9
         fULFwBi5kPqTqVCrx3/rPYCxhxPTKwgU6GtMZ4cUxxK4k4eWn1gi5djLsWlhu0dt29Au
         jHsOaxtmZp3o4EAA/dVE1BQK9TBXGpptUvj8inAeXlAY6uqz7OE6IJ8NNzkNIU1vON6V
         XznaadpZ7ecU6zBtZBpzpKUQ40uPNAVS47khgckb3zgSgZe9BkvzcvxD5xVRgtaNVqWh
         /5jl7gvcAYlnzppo69ZSkMgvdg24LLRG9GUKgBr+LEZb+xuHchnC9HZ/Yn3nmbigknXU
         3hQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729710012; x=1730314812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3smhQx2K2n9mAGJ2/sVtY1rBPZPgykalQxV0Rdjhbw=;
        b=rJI4j2yT6chyKSw5CopYyc/Qptz7IqThjsm5vF2nmr/6QgfV9E/GMu26gMN1pvZfUN
         Qc4hqIZtwhwM6fPpUh4qKuXeO3pHFmf4UI0YvS32CTFTE2wMn/TI1YPJshwDbL0FyeQE
         FxXK4FOdUQJbY7wa1r5PNMCFAtnqNT7ErcYpJ1SIcH+gEb+1yj8FcZYEROUqThbCMQgv
         cTj8jYZadWUQKG6vw0/iMCGh8jpjBVUwySJ5fLiLGB1+mDCAYG+8m41E/0b++YQZ4D2k
         Q4e7/fVH/m7+mjRiQswNbA05tjGtrdIIsoiYiU1jr3MRPfXQnrerHnfIp4XJdaUloYlz
         Jfng==
X-Gm-Message-State: AOJu0Yxnn7LMLojNmN6OtvWMYEFb17txvXJCrduXirPDy9D9UiuNnJSG
	BroN6Zb/i7x8Yg8x2xeIwi6wiTp82FJBoaDMdT+UxgYtGZEr8SBSAZp5QA==
X-Google-Smtp-Source: AGHT+IG+ltqDjtjEpQ1SU72hV+W1Jsd+q7lfK7P1134SjJP4RzXfRsSRUiNCovEcNQmmGpk8/7Wr+A==
X-Received: by 2002:a05:6a00:2302:b0:70d:2a88:a483 with SMTP id d2e1a72fcca58-72030999937mr4839132b3a.0.1729710012352;
        Wed, 23 Oct 2024 12:00:12 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13336e6sm6698289b3a.75.2024.10.23.12.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 12:00:11 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: imx6sl/sll: Add the "fsl,imx6dl-gpt" fallback
Date: Wed, 23 Oct 2024 16:00:02 -0300
Message-Id: <20241023190002.1183938-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_120013_922704_DEBC512A 
X-CRM114-Status: GOOD (  12.40  )
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

From: Fabio Estevam <festevam@denx.de>

Per fsl,imxgpt.yaml, the i.MX6SL GPT compatible should be described as:

compatible = "fsl,imx6sl-gpt", "fsl,imx6dl-gpt";

Do as suggested to fix the following dt-schema warnings:

timer@2098000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sl-gpt'] is too short
	'fsl,imx1-gpt' was expected
	'fsl,imx21-gpt' was expected
	'fsl,imx27-gpt' was expected
	'fsl,imx31-gpt' was expected
	'fsl,imx6sl-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', 'fsl,imx51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
	'fsl,imx6dl-gpt' was expected
	'fsl,imx6sl-gpt' is not one of ['fsl,imx6ul-gpt', 'fsl,imx7d-gpt']

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 6aa61235e39e..96f3c6b9e485 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -378,7 +378,7 @@ pwm4: pwm@208c000 {
 			};
 
 			gpt: timer@2098000 {
-				compatible = "fsl,imx6sl-gpt";
+				compatible = "fsl,imx6sl-gpt", "fsl,imx6dl-gpt";
 				reg = <0x02098000 0x4000>;
 				interrupts = <0 55 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_GPT>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 85fe2a4ab97a..5cab9bf577c1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -358,7 +358,7 @@ pwm4: pwm@208c000 {
 			};
 
 			gpt1: timer@2098000 {
-				compatible = "fsl,imx6sl-gpt";
+				compatible = "fsl,imx6sl-gpt", "fsl,imx6dl-gpt";
 				reg = <0x02098000 0x4000>;
 				interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_GPT_BUS>,
-- 
2.34.1


