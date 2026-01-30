Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D56E6BF0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 13:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7iqxSFKMNDlzFewoVPAW0lYx5PILeCQdoigY8yMUaRo=; b=vIOK34YAtTwZY1vqVjySmroevH
	dsuDMvdJ0hKqJULk6i/krUXX0tBuYTM2MmaZNi2OTc8iVNCKmZHh9Zhhe4eVGykZb6dHNH1SZLeF/
	WOdsgus6m+1V7WuQcljU+h/J6T7mt6DWWXH/19E7o2b51drjwt1VvRqIbovL2JOuhlXW2Au77915l
	9b4tJTz0QOt0kcpNNgdZ21M3Wyb/EK5z71gVdMcV6p0QmOjRoiZBeqgQFlwsRUDgbeiXbj/j26V9p
	aWwDqM8MkdoYpGJoP0jQiEBRtHibu0lAVGSxqSR4Uky1x9+IioHNZZAKLWThofxPnfUFJEaZeoc2C
	+0miIOIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloPo-00000001WM3-1x4c;
	Fri, 30 Jan 2026 13:20:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vloPl-00000001WKs-3ovs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 13:19:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so15562075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 05:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769779196; x=1770383996; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7iqxSFKMNDlzFewoVPAW0lYx5PILeCQdoigY8yMUaRo=;
        b=ESUTSHs67sU/jBo2WzWGdJG7ud9t7qufwwQFbk15qDlgObBXncCE17Gxuq3Fun4A4s
         0C47PbFmhtEpiPOPbQgOESGFQXpXBNaIVdIb7CMFhE5e6iO3yriMoiGDLGRRQGBAD+xO
         BNnzQp/uqaj4agDhDl//BcghMHg5leHkloiimdF2PaRD2qNZfh8/Y6c0VBGzcwfDfDwP
         7nK/13ddUgFjfjOpjgXX6ZxO85tnkwA7RpH9f/8pYd6aJv/sFIg5d/uii3rO5Inl6prI
         xD9bVVQUnKsEIuU56VEvXfqF5nJ2aDW4jh3EaMGivMdeb46Tu53CGt+Vrd0DcvgiDzeE
         H/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779196; x=1770383996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iqxSFKMNDlzFewoVPAW0lYx5PILeCQdoigY8yMUaRo=;
        b=WESAgUj+AoxG62E+BVHs9ykc6EmrPHTjZ/beGk+gCHj0rs9Kfy7flB/ac6WxOczqzK
         HMsTesBNQeNb/7JNzD8M8vrgzyClEfI+qrJZDQlL35opSXlFW7wcC6Cx7xY2WFH69Yan
         Ka4G7Xgl2J/yotl5niBH9UgjyJ6hYSgpZtmf7Bbr2/nAo0U++fL498yuFnJFWpFS7WUa
         mhprRyXEK50j9mLh78XuiYbGRPj1Rs3n+LGTUsBxTyJkuxBpZRrcZq3ajoB/OOPFh+f4
         SGidCyYECek+BdWfzsmvEMIrk70Unc65+KlndwRHLXnMSOSdGfu9Sd9vgN0H/FM4775P
         NijQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn3a/xRKjyfOHrCxOAr0GiNufcKJcxk5b3CKrVvHzBT8S/BQsaN7S+pKHlMbUckFgpnsJ/ovZ0xUtO0102wbtz@lists.infradead.org
X-Gm-Message-State: AOJu0YxNsDJlK3gVPWVaT+jHt+qNLN97LQD/c+LEWoZCoSxXjXKFTad9
	T1kArZPIi2AsRlOLqwvmuLTN8EU9iLQolKheR9LB9yM1OVWnIQvXr+UJMf5o2qu3X+c=
X-Gm-Gg: AZuq6aI2Ecnv8PwKB7aVQDr1WV4Uoc9UHY3EIpCp+H008prodyb2WoYkCF7ILwx8DIK
	eumhOIms/mkrs1zmBDHdpsAxaA5u5eYNuF/9V7mswwcchiXX0eBuXJBUGGpgZxqxhoLleFTAJxJ
	E7u44LwduDkl3t8TMSJslWU/e3rT8zXeWF749yT+0m1z+pg1YEk41O2cVSV1o2akjAXzm5otCYx
	DZvCYB125TNaiD4/yGVGCG4xLiPFknLAHG737ylTStW6Lsh9dnUjWB/Vl/b6JpYRfBbO34pOgl7
	v42aBgYfeOelwUgqDoy5tYfzxEnhdi1s1nbxPglUSCXUYzplXEZ2Eh1cGJKoaieB4bUuoSiTE2w
	y0i1Wd5t4mcuHfEK3CDnst9jknZpYg+DhIExehE6yLIWekQXjrVp4lwajik915sVh4JY3Hg65P4
	pNq9kJ2F3XWd0mQs7w
X-Received: by 2002:a05:600c:1f8e:b0:480:1e8f:d15f with SMTP id 5b1f17b1804b1-482db447b14mr34825915e9.2.1769779196189;
        Fri, 30 Jan 2026 05:19:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132303fsm22863188f8f.36.2026.01.30.05.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:19:55 -0800 (PST)
Date: Fri, 30 Jan 2026 16:19:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, netdev@vger.kernel.org
Subject: [PATCH v6 3/3] dts: s32g: Add GPR syscon region
Message-ID: <0e922537c02d1c47734142090f98eb78e921ed34.1769764941.git.dan.carpenter@linaro.org>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769764941.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_051957_964577_E0DF3B66 
X-CRM114-Status: GOOD (  10.23  )
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

Add the GPR syscon region for the s32 chipset.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v6: no change
v5: no change
v4: no change
v3: no change
v2: Remove #address-cells and #size-cells

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 6 ++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..b954952d962b 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -325,6 +325,11 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g2-gpr", "syscon";
+			reg = <0x4007c000 0x3000>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -731,6 +736,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..be03db737384 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -383,6 +383,11 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g3-gpr", "syscon";
+			reg = <0x4007c000 0x3000>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -808,6 +813,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
-- 
2.51.0


