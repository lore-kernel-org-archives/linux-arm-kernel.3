Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD6CD2AB39
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WuLe4B9Yxl7fGAOhoGDgJ4H9aWstcn4mmPppsJaFprE=; b=huL+2ZRLbdiSFQVnbK8XFxeVrq
	wHxCIOPxiMonRQY3Wgx9q6wRPTFMLdSygWql+lTQvQ/8vKlMVfmzwM8wFU4vJtLDOxPuAvXxnyL0b
	AX7NLkjhph7N54/o9LwxjxK+DSp+0Vt9anKWNumHNYXkHgUk8eXPOYMf7Kyn8KTa/U7NeF4H/hljB
	95IvlYP8+L1PEZVuakVZjz4ZWFSy/k8r6ZCk9LClDLFJ4xueIAAbnT/kDcepS5i+Z30SbjV0a7PQv
	3CskdK2m9ZtR5FCkUFu9tNlPkcGNHqKJhCsopsIyBLGj9LpLy5CTbV1DXAiidx8b6tk+D4wL/FD1j
	7OAVSq+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5lUA-0000000EQX3-178F;
	Tue, 29 Oct 2024 12:38:10 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kw5-0000000EKM4-14FX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:02:58 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-72070d341e5so2053417b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 05:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730203376; x=1730808176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuLe4B9Yxl7fGAOhoGDgJ4H9aWstcn4mmPppsJaFprE=;
        b=nQQySp1B8KewONYQQEyfEbipekIYm7XCjzd0jkhuOS0BnnZ54MgZXYbS/GAMqmLLo5
         BgKng5GHdHXLRp9ml+UA9jlp4G9LBcbJanxRJQgfzefzlfLbn/Y4LaeEutwJNElCnmTR
         kYtmLEgYhILoNNV4utI902pin5M1NuvfC6z9Gtv2KLusCbqAwPW9fGzAo0h/z8b0FCSX
         F9qwoeAr7Vrv/xq3gZqVjEZNIDpdHSPqitUo11/7kLJ1kyFlgRrIbJ1bkan5zwYu3+4l
         w9yp//gzKGxYLhsPMRLtTRmDrGRy2hGKa0+K491Ov3FgAXwrYaqxd0M+yW236U73RCjt
         JbgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730203376; x=1730808176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuLe4B9Yxl7fGAOhoGDgJ4H9aWstcn4mmPppsJaFprE=;
        b=Vz00a0bimMA6lUIE6gjWy9biLs30UT2QpHtSuQK7Ko0vFuL1SFbtniCj94zu5dOwMw
         ++9CCRSjjuIh83OucUomuBMHKPAdQzdW7TelBgrKYWZTq2i57VOPP6cll7cmbUmd9up8
         92P3YPbvTdpMF52CAoO70MO66gDWGZNfLGX106emxmnGQwEnkEiOzoVmNiUzB/1R90v+
         FH5XKveUGJohnb7XPS110yS9pQyMCZhGhx2WLfp9fg4KntnCpwca+Cv+Qi95b1Xj6Z+h
         3ATHwSPiJEbiQEBYciX6ZJ9Fw0HHw/WWC3QkU9zzcqu3LkaBCR/m1sExYFPvgavPuVaP
         uHrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL9EVprI+oC2QxBT4WtQdhNWYqeUO+yL5656gApiPhlKgB9jaJyb7HUgAgXjjhukCRJ7P1v2nnGQfO1SGZXiLq@lists.infradead.org
X-Gm-Message-State: AOJu0YyS9ElOC2JxUCalUhFjQCRTcfQqUNBCVOBkfIjLtdetgm6ViSug
	bfjIChAuonntoyrOGh4zTeQ5Rgrauc3jPurcwr4Ue/Usa+9MqBOq1D3mKA==
X-Google-Smtp-Source: AGHT+IGbiEdJV3ydS0kSLnafJ9ewMOqHsVNosLuolIBvEY4inEwZ5wIYaFPuZwSU7Tw9iUcPvg13Dg==
X-Received: by 2002:a05:6a00:230b:b0:71e:4cff:2654 with SMTP id d2e1a72fcca58-72062f86088mr17177530b3a.6.1730203375835;
        Tue, 29 Oct 2024 05:02:55 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:c7e4:1ef3:7ef7:5ae0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0b7d2sm7428830b3a.114.2024.10.29.05.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 05:02:55 -0700 (PDT)
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
Subject: [PATCH v2 3/3] ARM: dts: imx6sl: Provide a more specific lcdif compatible
Date: Tue, 29 Oct 2024 09:02:36 -0300
Message-Id: <20241029120236.299040-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029120236.299040-1-festevam@gmail.com>
References: <20241029120236.299040-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_050257_326269_DB3AC11E 
X-CRM114-Status: GOOD (  12.23  )
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
Changes since v1:
- Add 3 entries for keeping DT compatibility. (Ahmad, Andreas).

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
index 85fe2a4ab97a..e6fd47814665 100644
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


