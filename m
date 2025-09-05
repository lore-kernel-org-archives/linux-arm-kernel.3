Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84302CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvy4ABtAopbpacYZeTigpVnife8xFc0KLtur08dDo2Q=; b=pxmPX0CXkvGTxtxV353kVehSqR
	3dVfiUQNyOjpRDhjv+J9sKpXDFGcxKjHA8OvRRIBcCkdC4vIRxMjG0CY94HYHlYud0xN9USnhbpmp
	gJN5WmobNgtqfHsGFO5dwzbJU+jdQTO2WrY3gcbCs5UJVexyso2BEPWdGGaDpKRjZCVshJ5ueCZ8K
	3ePZ80fZ8PSVqm/JwgvP/41pCY3cCsj2SbsRQ1bJ8zjnp3V4CVjBZUFkMTj4+k0xklg5q9ffTCPHH
	l+qbwjEhI/j3ONOTv4L2YjoGlEeIh9MxgAYAIWJf8qc9DIQyjliJstmZXfVAh+UYoJt0dCUohTxem
	FyyxCCiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMtU-0000000GNRC-1WRX;
	Fri, 05 Sep 2025 03:13:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMdh-0000000GIPe-1giC;
	Fri, 05 Sep 2025 02:57:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uvy4ABtAopbpacYZeTigpVnife8xFc0KLtur08dDo2Q=; b=XmlvKLf5FZ0IKNZjUhSM4hDEAp
	KAbbohr333JXt130n54bsIpHc1+tGIxJrs1h9k8SRQa7yWYhCRkl1QxpN3DgGR4ptBgLs/ZhDvEea
	fTEe/AV+vgDBYd92qygVaQtFe76jzYGz78Uq07b8Kwv+U/Vtkaf2+hNeP/9gWN4srIBCeqwEhEGeR
	73NizKiJSt/vIBfKCmCTqgIle18sbHfKsh+GclMx/M0Bozxd+MZtztmaBoDGeNpTDQSikxyp407E3
	Ml7S53hLglinJzKrwntpvFlAOMHUseUvjkCBqwLQuaXKsUnDTfA2XLBvXR/G1vYWoS+EH+RZPAhFF
	5Lm/aluA==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMde-00000004SXC-2EXA;
	Fri, 05 Sep 2025 02:57:24 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-32326e20aadso1836678a91.2;
        Thu, 04 Sep 2025 19:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757041041; x=1757645841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvy4ABtAopbpacYZeTigpVnife8xFc0KLtur08dDo2Q=;
        b=LIatAmm0cNqvTkfd7xKfL8GNL9RPUtcJNAw72WGTsVu9Vwd/5wJ5NXlhHEMG52rswW
         yyzYM2w9Do+9NqtvvagpMWBVD6cjnBdnBsJseLE7g43Wc8j3W+M0xNUM1g96OFPS/MF3
         58oh76H6H/BhMh0gMZkfBQnfVYOuV/JPEV8gi7ZV1tDB16s3cVuIFeJSHgJxo3t2mx8P
         aRmv9Oy238aa8jZ91z8+PdWrs8j5FqrqMSRHEKpgBowD740i/m/sePjL6IMeaWT5f8Ki
         lPIU5YfEb65YynjJc+5JHPXjLR6zBHmEbOC9FI0lZ0jDe/R+USkyekgho/DtZDLLi/2K
         S/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757041041; x=1757645841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uvy4ABtAopbpacYZeTigpVnife8xFc0KLtur08dDo2Q=;
        b=o6pfnkMVI3e7kyxb0uAnlcNrYNhBXdLp/4NfR9TY8kTAWuOp3w6Y+1sbfm8OQX9WVp
         bIbyHO8RJkgOHg6J3thR2+dQ7wbsXqgczq2OGCmcjCNV/HBeknmYawATBvv5YZqakgUY
         +3vWAtl2jbhYgY2AZJMID6NvN6bkrXWPJARxzoyKlGgx3P5FJW4QedVSlQNLK3BbPJV6
         wh2oMg3M7SurwJ9dSaetyiOYNLWRkEQHH6up5LDfNn9nYTuE1UlDfOdQbTVrM812/CBs
         9xLKop5nhP/KD4V1ORQuseVO5PCT8NovuiWEKCkrLcO1LNUgeGDwxsm0KRLOLkQzJm9c
         4ViQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIJiiwbEYhFkl+muS7S59mmKpcrB2iYYgSKIueqLpMawV2jLaNSt3gxjojFumFZp/aFn1CNQsakqzXmCrPU3mD@lists.infradead.org, AJvYcCXgA4S9ngv+FffUs2TcKSRPiXwYcVJw9aQ2dcCE5iiyLQ+uL7Y0g1OjQ2r9FmeHn39PMVXXGLvSvmfIqjUMbrY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyutcAmUriE+fVwJqx9/UhimniZcm9cY4Ehzsy/2lrGE+2zlpbo
	CTU78LHzeeVKrD5N4RAyXWIIknZrhb+5YsvYMLVGrPkj2ACDM0xC3PBY
X-Gm-Gg: ASbGncvTy4SNrJr6l1HZAa+5uys8kskPiff5vnzD8pKGYZhGabOreIrqwc5sTieEJCs
	Men7IcfJ+vugdi5gtrkTsp18Y0DqOflGPvnJ6X8nQgyPJ+105Xl1oXihDmHhfBYJds8Zk45a04v
	2Jt32mI9jY1SlLLhleftlJbT/nNJHL4ESnNFzTgGc+q9R3iR6pwUhnU7E3JWY0M5c2Ngn0wix3e
	f152J5Fb9/CcBV9HYlPoht0eR6UGhkiYxSVQ7Rxq1TOJlNO8qcNRXCvGnt1G8lldlbbPI2xq2kl
	0mR1bbeMOwU8zHgh/4Gh+I+re/TqUNSTTgdrwIwE+0VYFNESacD5hyW/Krw+rgBUK1Z/33YMeoa
	XkeYhntovIDk=
X-Google-Smtp-Source: AGHT+IEiluV/7pSFUxZt7TPIrj6CV/ImWEQeYgPKO2eLTDMwSsAtaVcas/jhZsOVhMfNixsNGg7TvQ==
X-Received: by 2002:a17:90b:518f:b0:32b:a76d:4c56 with SMTP id 98e67ed59e1d1-32ba76d4e23mr3808565a91.31.1757041040628;
        Thu, 04 Sep 2025 19:57:20 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e1c8e07bsm9428588a91.4.2025.09.04.19.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:57:20 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v2 5/8] arm64: dts: rockchip: Add display subsystem for RK3368
Date: Fri,  5 Sep 2025 10:56:29 +0800
Message-Id: <20250905025632.222422-6-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250905025632.222422-1-cn.liweihao@gmail.com>
References: <20250905025632.222422-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_035722_749751_4CA8B8F1 
X-CRM114-Status: UNSURE (   9.43  )
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

Add vop and display-subsystem nodes to RK3368's device tree.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3368.dtsi | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 73618df7a..9761dfc88 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -140,6 +140,12 @@ cpu_b3: cpu@103 {
 		};
 	};
 
+	display_subsystem: display-subsystem {
+		compatible = "rockchip,display-subsystem";
+		ports = <&vop_out>;
+		status = "disabled";
+	};
+
 	arm-pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
@@ -847,6 +853,25 @@ isp_mmu: iommu@ff914000 {
 		status = "disabled";
 	};
 
+	vop: vop@ff930000 {
+		compatible = "rockchip,rk3368-vop";
+		reg = <0x0 0xff930000 0x0 0x2fc>, <0x0 0xff931000 0x0 0x400>;
+		interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+		assigned-clocks = <&cru ACLK_VOP>, <&cru HCLK_VOP>;
+		assigned-clock-rates = <400000000>, <200000000>;
+		clocks = <&cru ACLK_VOP>, <&cru DCLK_VOP>, <&cru HCLK_VOP>;
+		clock-names = "aclk_vop", "dclk_vop", "hclk_vop";
+		iommus = <&vop_mmu>;
+		resets = <&cru SRST_LCDC0_AXI>, <&cru SRST_LCDC0_AHB>, <&cru SRST_LCDC0_DCLK>;
+		reset-names = "axi", "ahb", "dclk";
+		status = "disabled";
+
+		vop_out: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
 	vop_mmu: iommu@ff930300 {
 		compatible = "rockchip,iommu";
 		reg = <0x0 0xff930300 0x0 0x100>;
-- 
2.39.5


