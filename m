Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A9BD3A696
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 19:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYKmKtE2fVCas74ElHJ9fhZLrtmW93dELAHBPhCA8b0=; b=PNedMqk8pDy6nozkZR/9F5G19b
	nTZmkUgZt1pg11HT373Piq1xjcUqL1JOouraJ0BPVjVZWw5k7a8sP1VCt5LD9MkidXZGx7h7/32D1
	gnP1veze0Yz0CJyIDPzQe4xTtvw6UxMOswsgn5nsdh7s2hBVWWd3AOco5eqp1pjgMQ5KGwnRRSToE
	lLr8VQ4eXe1NGkxhHKGC7/MVAxJn5lIoQuZmiR7HQ0VTcg3pLBj2ucVqMFn42w53C9Yk+3C9eusfa
	u7bT4Abn5gCSgT02Hk6OTha3w68CYint0dgjp0aTG92jAbqerAJQgRm5ATU2dbtX+bryDE17Uzwqp
	weBuHq4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rmn-0000000FeRa-1a4Z;
	Tue, 29 Oct 2024 19:21:49 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ri3-0000000Fdfw-40Ju
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 19:16:57 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-656d8b346d2so3968507a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 12:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730229415; x=1730834215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYKmKtE2fVCas74ElHJ9fhZLrtmW93dELAHBPhCA8b0=;
        b=lxflkdyWdhnL/DGAquIfxWHxwWc3yG4snckGuBxI+FHuXGsYgzGcCE2Tu2HfECoj5L
         FdxJThmOo9+szL/wdM7Dh5gU6+S47aMt4spDsbzwWephHgouPDz5XBd/qxy9738Qkp8S
         G8mY1heEh2jDuhms24NyWh49D+LhuwPP0WttEg2CCZY0aluNe8b5CNE8U3qcMqZbj7oT
         gZuIKJswhyIMcO4XI2MjIe2ceR3mSy74YScFRrr9p5eEDiGjmDyg6Nho7IQSvYZFhON0
         AuWvyIBvbA9euyHfqUot8gnLsb4EjfOivEe7DWLcJDxupxHQmU/FElpPpY03cqlHhN85
         NSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730229415; x=1730834215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYKmKtE2fVCas74ElHJ9fhZLrtmW93dELAHBPhCA8b0=;
        b=WHF9ZCGGrxfDMdhxdohyYnS2lpnORVy6MAjFwQai8d5nzRHzYS7IslwxnVMspkZoFP
         NtqflSCVHxVbg0tYuGprQHK/f2vl81LgwWRZxUVuCvoJAQresT4+GAs6TvmLaUU+qVWo
         P4SX0dFWyq+PBoWnrY40iFl/ztueqgdr464KmoPGDIgD9bMFe8KZTDiQlCqlhJQVsPmR
         /Nsy6RZyXDhTQvZ2GcurofP+Yoc/ORxmLTOxsT3JOCRTvYEO6nes896uOyHue3i4775g
         TMhHUr+nhlgfEZTvma1mtq91CQDIVJeCbIY9fNguhCeAS7ebf8wrZBVUxmv/aR7SsucJ
         OsBw==
X-Forwarded-Encrypted: i=1; AJvYcCWqiO0MgjzmCFyYrBlOMADSSrK4Q4vX0ccO+4nZzzoTNVysdyy6lAkMVdfCg8Y/bTJwOjuTlVfb/HozrQ7bVUPD@lists.infradead.org
X-Gm-Message-State: AOJu0YxAt10Ye3EyvQILi20+7eqSZCQFIracWArYztBNBvzX5I0jGZ7i
	ZKpyuUevMm/U87DldzyS1/yfXqHdWvnzJJwCnix6wILzQYAVBG4k
X-Google-Smtp-Source: AGHT+IFTWq5E2+C67K9DtUnmc5ZutA88kE0YA5e/SigUzJXK7DIsERXz99OcPpiFqA+Gv4FpUe17bA==
X-Received: by 2002:a05:6a21:58b:b0:1d9:762a:98ba with SMTP id adf61e73a8af0-1d9a83c9c31mr17108740637.16.1730229415320;
        Tue, 29 Oct 2024 12:16:55 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:190a:1425:254d:1e7a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8661061sm7842346a12.17.2024.10.29.12.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:16:54 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	andreas@kemnade.info,
	kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3 3/3] ARM: dts: imx6sl: Provide a more specific lcdif compatible
Date: Tue, 29 Oct 2024 16:16:40 -0300
Message-Id: <20241029191640.379315-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029191640.379315-1-festevam@gmail.com>
References: <20241029191640.379315-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_121656_018454_E7703F02 
X-CRM114-Status: GOOD (  11.55  )
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

The LCDIF IP on i.MX6SL and i.MX6SLL is compatible with i.MX6SX.

Provide a more specific "fsl,imx6sx-lcdif" compatible and still keep
"fsl,imx28-lcdif" for DT compatibility.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- None.

 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 6aa61235e39e..840e19b2ca0f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -773,7 +773,8 @@ epdc: epdc@20f4000 {
 			};
 
 			lcdif: lcdif@20f8000 {
-				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 85fe2a4ab97a..eff83f5e5535 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -648,7 +648,8 @@ pxp: pxp@20f0000 {
 			};
 
 			lcdif: lcd-controller@20f8000 {
-				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
-- 
2.34.1


