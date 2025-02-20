Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1CAC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y+3soSVCYAuRBJUKPnHhYTtwJmf6pTxAK2DqaA+2v2c=; b=fQGeRSaGEGUqd4DpEx2mPusH1+
	uOy1TLuAAnuDskqoP6T95/Qn+gm3ku5WSe5jsSDq1L3V+lrkNnn7Z0DNwVN+5iygMUs1DwnIfgAjN
	F8om4LwYnTzN7myGWKDJCAXbIwRaxMIXn0h3JRsyDyodjZfGlA7ELHnho5I/iGwqTj1/OJ/CuJPCK
	hYRQC3rtF2cXTExFwxF24+EFyAMZdvekA4X/HCXLQUBAxFHbHNlg9TJog6mwxbjyTcfxZU9HSwyLJ
	wx40ux7aj1tTQHsZRowCuPz83N3IFdEkT6fE0sFNeAO6kv9AgYS1laDxevem3xSSTuQbX1fyQkqps
	fkl5BK/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6R9-000000010ni-3ERj;
	Thu, 20 Feb 2025 13:17:55 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6Do-00000000woj-1yFI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 13:04:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21c2f1b610dso23652075ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 05:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740056647; x=1740661447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y+3soSVCYAuRBJUKPnHhYTtwJmf6pTxAK2DqaA+2v2c=;
        b=hx7r3I3BzFQJdE/HvcV1OSxlyc6LoYyCaV5eQXF2thc3091exxJAgBp2ZoFg2oRLG0
         3OzaX3xsdAAMcCsmujiktsQWbhYC+3Zznw8vbWxJpVq/YN/FtU/u4SU14jOY1TA/adw7
         zeWAHfdK1o4kd9eGPZ+EwwKRThpor0ljlCBNUf/ZRAQO01rgqwElVvoksRb4/THFW5Oc
         xnI2ucE8nqcCLzJFSgAFEpLGJpaaEemU1mlxMcI1RIpXkydf3QqNnPPlpuTnHggM4Bom
         Az6kKxvE0FJ/B+XxEse0MqIghhe1O6Mw8Nl1qBXA7QRlnG9i3GQ3Z96+9FxFq/jD+lf4
         f3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056647; x=1740661447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y+3soSVCYAuRBJUKPnHhYTtwJmf6pTxAK2DqaA+2v2c=;
        b=Wwl6m7MHxoQQZi9Pl4Yfde9JSPkACoiSJQi4K2BZuOumJZyZ7ko8cuBzhcnNGu/nSp
         ftzH95RIv5P5IWa0WIJErTGoOkKKeI0MKnEH0+c3ucACJtATpXRZOVzxG+AZL5laQtHf
         jBSPYOCTJD8v09CZOmsqB5zozXVlr/ImLsha8lnrAwBRDv1BtnaM95hXkiKatQTdopAT
         g5wyAZwsM9fNitAMDYyU87uMPsCUVJeew7X8qwHSOUE/FSTnt3QiQ+1fYnCi1tExYvVh
         ozG0BnISCh5JFzc9sjPyaK4bPFcpxMUzv/9/631h3ZwjVNJ5yqt3iLBvlWaSeA5zlldn
         /ooA==
X-Forwarded-Encrypted: i=1; AJvYcCXE6lwgMbt2vAlDczdtotdR9DkqcPEOGNTIvTQkwZ62a/HEMgX2sPVlccfwqOtD6VpoXUIe/vEDa5lxWz8+kWyV@lists.infradead.org
X-Gm-Message-State: AOJu0YxJAaSPWVoSa7YUVPBUCUyPb4+3lRA60HkClcV+3kE3fB84UeH2
	2dWmRy9j2I8DneZaU7F5rhPShyNw4WVqZwmzCCGddMMoFzGedcYL
X-Gm-Gg: ASbGncv4x/SMmxjWAS68L4b1xmUfCtKYMImlhE8kd0PoGjseguTTu8g/euCWrmaO7+1
	AKjfH+tNRHYo1lM1QUAYfe23TKP6PC/UDMg5GwAfFD/OPQ2XMcppoOJmj2BJ1UbkiWnwCOB6HQa
	Zku0fo2ZxWp53CZrCMafLAN+4QeIjdFoXhoPfvixZULLbde2Lge6OQCrA5NLwjCUiUdP2VQBzt/
	bD2h6o3ETv53okXNvEKFQnENRCJ1lU1sjBxv50f6JV1+iqFnX+mmYAaF/kcISU1VCRxmDk4BFaZ
	KPtkAu1huqdkuvW4qqGFzYm1B1t3CQ==
X-Google-Smtp-Source: AGHT+IGw9OEm8SoiJIbzYvzhoiOS9vLNOCY9vd2Z4Tmta8NM4PUADLO7vJbTIJwDirGm3pkUctatBA==
X-Received: by 2002:a05:6a00:14c2:b0:732:5954:a815 with SMTP id d2e1a72fcca58-732618f1fa8mr33765480b3a.22.1740056647430;
        Thu, 20 Feb 2025 05:04:07 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:9a27:2e77:89d4:5724])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7326dba6585sm9508105b3a.14.2025.02.20.05.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 05:04:06 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: imx31: Use nand-controller as node name
Date: Thu, 20 Feb 2025 10:03:45 -0300
Message-Id: <20250220130345.2375204-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_050408_508736_5C2DEF6F 
X-CRM114-Status: GOOD (  11.99  )
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

According to mxc-nand.yaml, the correct node name must be
'nand-controller'.

Change it accordingly to fix the following dt-schema warning:

$nodename:0: 'nand@b8000000' does not match '^nand-controller(@.*)?'

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx31.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx31.dtsi b/arch/arm/boot/dts/nxp/imx/imx31.dtsi
index 00006c90d9a7..813a81558c40 100644
--- a/arch/arm/boot/dts/nxp/imx/imx31.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx31.dtsi
@@ -340,7 +340,7 @@ emi@b8000000 { /* External Memory Interface */
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			nfc: nand@b8000000 {
+			nfc: nand-controller@b8000000 {
 				compatible = "fsl,imx31-nand", "fsl,imx27-nand";
 				reg = <0xb8000000 0x1000>;
 				interrupts = <33>;
-- 
2.34.1


