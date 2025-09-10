Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E872CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 02:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P2Wv28uVFgIwY4UQs+1c5TBH2NyPkzg92eGQhJ0dgfI=; b=15MeBpoAPIH7WcvROcPoq95k9/
	9MuO8JjPxUljCh3lNm5GiFFH2T1r6I7V2w0ekKxzWGZ+XkChbACCfZT9xeK830iN1IZewddPD7tI+
	W1irTXLp+j//BjK0paEiRPaBy+IsanMh3mVBbiPRfQ+8FjR6FnZ2SDP4Z4Z40i41bKecLrP3XUvuk
	n08hSg1Gcf5tYO50SpfyPc6T/WDxrSJ8bJZIdc/3jrpyRXazA/1Ar8cq2dJkmYCOpX8qdXPfQMDzb
	rVDdyROS/O/lEWySBzeqAKaL+HE+v+7OP6AbLcUJoak8uo6ebYlLYYj6o5gk0i6MRenJ1N7Jb8qlg
	H3eQIs8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwADZ-0000000BaLI-2Vo6;
	Wed, 10 Sep 2025 02:05:53 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwADW-0000000BaJH-2hKY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 02:05:51 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-24c863e852aso56567425ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 19:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757469950; x=1758074750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2Wv28uVFgIwY4UQs+1c5TBH2NyPkzg92eGQhJ0dgfI=;
        b=O3zsu1yFDtRkqivW9gvf+2mLbzthBHzeqGWccIL7zbQ+ZdXwo8clRh5zRaOzSkF0DX
         WRnENKXpyC1IgDuhhNxkRZnA95yXhHWmW25l4yO6RHwlyoEUyNoRB2SWU7+akaX3GWNc
         d4lAxLrLpvKxoOUUb14ecXDwDtZToMRPP94a2oflfJKIQGkxmMZCu4if4TIj1I/YRCAn
         2MBfIQFiMc6wCoqgeR1ULCX8/+dOpkyn7r8sQu82PgMO2fkGVbVQV54akg9poefaIl7d
         oIut9BH0397Xm/D8YZp4n3K9Ja/s1qs+VXrf0+naZdy6E4EMcuXFKRBSXli101W1hPbB
         mxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757469950; x=1758074750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2Wv28uVFgIwY4UQs+1c5TBH2NyPkzg92eGQhJ0dgfI=;
        b=CLCSb4wSRdI4dImK56TkVD55A8+XzgPoHMHdFXs5kSJyG3koibQz936hmWCXuJgoeB
         FtnEIYsbV/ZUTsyV8hXBkVGuVByLcko2XPrOGJ4BA6vBP7aYD/+rYm2u+FDsaaPp5hQB
         1WaU0lVqztAz+spNKuaT6PE3L6+V/5CdGFR0R6kpI0IVCO2V5IumvmRNQh6aS1QOMwH2
         rEVJf/gx2DcC4FqHoXPAa9rrUH4NJW4hXeiCaypejb5kNG/4y49Cnk9XiZSYrcu4ltQK
         V6Iu7Es7XyOjAr8KUQSaylD74Yx85DPAnw+PLoFIlF9KPPRvaUyylUHcgrRBFoq4edut
         NpsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU46nulYaqGrI/S/svGlC9JF5/bQPcOpjk8KXCNM7WwxRbLNVjHeK2iR3tUBj9sTCaBY3Py7lqUTO80ltrD4+z@lists.infradead.org
X-Gm-Message-State: AOJu0YyNRnxj9zzBPPVqmYmOtS6z4fFp5o8hHEhWsPz6/Bzjlz5C6bSe
	VE3roLxR2Qgf6YHc73sNdsZxKIo3Rtwq5ZrVCfz2vJ//usQt/eA6TrHt
X-Gm-Gg: ASbGncsffSvxwQas+6quFm5HWUSdizUvU4h3YRjsgXt2fvFhjerm7EB72xrWaI8+flf
	uiChiCy7bDdLMYZwzF+213K16m79izlrsI9JYE0WJ7h8cITCO67w7JCcWxCKzWs5I9c8wJ5r5Mq
	km/G2PsK1Se02PK8hUOJWU+XXxMvnbXEVdMQiytLNf+tbIY/TFrFuJFyyOT8PpVxYdMTCGZsQfL
	AW/19ElpJQ33LF4JP2OmaXX+6O5aFyUCMtpRXwhF2DAtcfXhffBXw4dQuXXkcZMJPaEj4v5F5+h
	lpQtjLXn3+JocqvmTnbZE9ILedbyPLXkfeU2dI70QwNKkaBw0DrDUD8QJgseIbUgeGowIeoCQVD
	cJE4sKRxT9UtQlclGlkWas35yqGiMpgqIBDaOwLOQPLLCVno=
X-Google-Smtp-Source: AGHT+IEVBLAzfDT4V42Ob7mMhF4hEh69hyk11soKUt396GyM7UHe/sGizvdubIBtjiwfPR/vW1jErg==
X-Received: by 2002:a17:903:b90:b0:24c:d6f7:2788 with SMTP id d9443c01a7336-251741866e3mr168780505ad.57.1757469949993;
        Tue, 09 Sep 2025 19:05:49 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:58b2:c9cb:20c8:e698])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a27422bb7sm10607735ad.30.2025.09.09.19.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:05:49 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RESEND v4 3/3] ARM: dts: imx6sl: Provide a more specific lcdif compatible
Date: Tue,  9 Sep 2025 23:05:25 -0300
Message-Id: <20250910020525.342590-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910020525.342590-1-festevam@gmail.com>
References: <20250910020525.342590-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_190550_684302_D135BD52 
X-CRM114-Status: GOOD (  11.26  )
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

The LCDIF IP on i.MX6SL and i.MX6SLL is compatible with i.MX6SX.

Provide a more specific "fsl,imx6sx-lcdif" compatible and still keep
"fsl,imx28-lcdif" for DT compatibility.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 7381fb7f8912..074c48b04519 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -776,7 +776,8 @@ epdc: epdc@20f4000 {
 			};
 
 			lcdif: lcdif@20f8000 {
-				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 8c5ca4f9b87f..745f3640e114 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -657,7 +657,8 @@ pxp: pxp@20f0000 {
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


