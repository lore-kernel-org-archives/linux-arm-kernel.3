Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A6EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 06:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCP5wX50ZPJSIbPo78DniGK7SxiDEu6J15Xy0lcbUzo=; b=4aH+IobC566+3RPc2Dr82IpZKK
	iII028JCOKeEszvbLp4PJaNHQaLYqCX3AI80kcxzPbWGirPREFrKOS/Wfu2DtDkEVKcWpgJtUxfLA
	dHmXulWw782MbjhfwGxtcm7TsJdxHghPpZhoe2G/vI3khwHb8CmNfbEXPnL4poIXzceCvc1AoS/Et
	ZDS+UThwQRg73vQTDzd9E6dNWjpgK5j01XvfOaBye2xcXlT+JwBeoABtG4Vrh8bPGGbkDIl/chGbo
	wg5rRmEn/AYjusrn+66VNS3r9RhgaX85tsp2/egvKKtfgQ/Xj3Ns9nhDquYBZ/pUSEsIJ/SCgOkm8
	1qp4LKYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qRc-0000000D3WR-2kb4;
	Thu, 24 Apr 2025 06:52:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pyf-0000000Cycb-0BV8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:22:30 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so13098325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 23:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475748; x=1746080548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCP5wX50ZPJSIbPo78DniGK7SxiDEu6J15Xy0lcbUzo=;
        b=hIDguQjGWFSUWtzq7H7qXO0BtUb/A3pEmOarNpfvXH+5CpQlnv55U33bsjS3+drbu3
         ViLBcEO7Dn8J6bpI+iXNUC260uQsSCswWAc+pTPUFveU1bo5d7dhqxSiqrmFDmeLM4U2
         KMXL3tun5gJ1xybV2K8Moue5T9H6iwD8ukGaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475748; x=1746080548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCP5wX50ZPJSIbPo78DniGK7SxiDEu6J15Xy0lcbUzo=;
        b=FuSUSKhFwo5a6pRA2z43P2aDlMLXFLEj0jxBAkHhuXT5RHyCDHPO1/hOj4BtCRoeZt
         lNLpJE7xsQ+mB8clPyQtpgCRVleLmhoS9FEC/475h2dOXP6Dnf98txLwJN/pEydQiZ9b
         kPMxZnZ3M3xBUIMIYGAJukT/W2/iTc/usrJqsgt9yaRatePQ9nb482zOj1UFQWnL9hSr
         PaxTsH7OM1grbYcLCro+tIP5elXcUM/htQiB6BgC0ON4tx8sDclK5ewOOdGmvfkCWMNA
         +xWyvTKJTCKFe0DFSveuhoVvMnfLFKPfv9+lX7fU2yu6lo8znS5OqEPN5kJwogEb5Bgt
         8bGg==
X-Forwarded-Encrypted: i=1; AJvYcCWxVbFBb5nMnZdwbFpH/397pmXbSlsRp3EPQjSLYShXi66RW6yKH4T9CrxRY5oTMQKK0CD/G2Hwq7DGyfTAF87p@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsknzd11Qqo+s0pVHyUG0z2nrbqxiW/Ovq7PGxVDmI/byNGWwc
	iUknuujLJX0dgpVFDgyKKIkHoQEZiT3dK3AF7b7Ns1K+CoYHhrdxAYFsZ1e56Po=
X-Gm-Gg: ASbGncuH4Fo8LaOOQOuJjuAqlDdawA8k18Hde7ALmmcg5yQPZHOzDVxd65rLDzAVMm2
	F+qKiRyqgjLDRISN0cAOeVAAeufc5XHxRiBk15/b+7P79ujhiooSmnj+lrV17rVuRhi7GxjyECe
	rzx3gNigjgsRVHvU5GMPllxWNdnGvBnaPXr1mXMvvTpKKaaqJ28qDJUV+ll9Z95E9Kfn+mqEP4F
	u2NGAZLg3MO7LzYk4NzaMC3GrjrRk5LXNDjc36hOAGRghEyrRTtrO9AEf+LlL/dWwFjEdolqExn
	vJnP63E3H293cc7n0S62loFf3lpRufuwulhiToMfZR71IaXEbSkw4mHe+k1m2JAnFWc9S67M4jD
	GJMZV
X-Google-Smtp-Source: AGHT+IFoHdGVBD8O1Hzz0CKgZ9opqhMg+ND/xcdm2+qcZWev45QsNCVd+jDdCasqwcizMo62oEm1gA==
X-Received: by 2002:a7b:ce14:0:b0:43b:baf7:76e4 with SMTP id 5b1f17b1804b1-4409c453b1fmr7692385e9.1.1745475747768;
        Wed, 23 Apr 2025 23:22:27 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 15/19] arm64: dts: imx8mp-aristainetos3a-som-v1: don't replicate clk properties
Date: Thu, 24 Apr 2025 08:21:45 +0200
Message-ID: <20250424062154.2999219-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_232229_084114_1A6C9F1A 
X-CRM114-Status: GOOD (  10.38  )
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

The clocks and clock-names properties are already defined in the same
way in the clock-controller@30380000 node found in imx8mp.dtsi.
This also helps avoid the need to replicate further changes in case of
any updates to the DT bindings for these two properties.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 .../boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi      | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
index 231e480acfd4..6c6c6f180785 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
@@ -151,10 +151,6 @@ &A53_3 {
 };
 
 &clk {
-	clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-		 <&clk_ext3>, <&clk_ext4>;
-	clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-		      "clk_ext3", "clk_ext4";
 	assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 			  <&clk IMX8MP_CLK_A53_CORE>,
 			  <&clk IMX8MP_CLK_NOC>,
-- 
2.43.0


