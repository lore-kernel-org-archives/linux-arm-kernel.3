Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4E3C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 12:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gh3QUyiOPP/PspLDIgE2PK/QvR0dyXvPHAT6Rp95d8c=; b=dPq+aStB4VZ6/Ac/nIglAd40Q4
	XKfhJ+3dtsaVcvJ6my/CiOcYUl7MkxvKFJV+R9IqhTwzCKBMnkd356At1hYU9R0g/+AqSnh27SobG
	9UnZz/191pAmEJENnjULNcOpK9ha2foJlYLvCPzZ4TYtqJFPf0m4VA/ygiUquDzhU94ia2hCtyvPm
	IR9aG6Js3sO9dFsZHgakZqZEW/yBx4oGDMzrZElgiFn9RJSlrQufm99yLVKpHSBc2wViEqc26eAlj
	ZnVltF4L4BiJehxD3MPKabr60/vv80ytcUbcs3z+on6roMxTHcXauU5e9dAm/m19br4GnMaS+whgA
	jhzi+r7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttQLa-0000000GJRE-0w5O;
	Sat, 15 Mar 2025 12:10:34 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttQJt-0000000GJI1-1eOg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Mar 2025 12:08:50 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2255003f4c6so51187385ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Mar 2025 05:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742040528; x=1742645328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gh3QUyiOPP/PspLDIgE2PK/QvR0dyXvPHAT6Rp95d8c=;
        b=VGfKtrFySI0HSGowxnoPG3MzkISH2jwfPMv7Oy8FR/y7+I2sTJzgyrc9QCK3LOGIsr
         m5yzYTPL43YuooqpdCjgQTgGbf/2Rvn3mq3seJnEIRotAmzGVa+H1K3xslBWPwWnEqaX
         +75L4rPma94a+IF+xHCd3apQ8NWxqj2FEl0yLgFYS29EnO46To5+dDqONHK2KkaQ/WUM
         K4u+XDnS30t2BdgPHD7loO4OAufqumqSl8RgtFqTx82YiclO/uOuM3LX/Mv7qdkcWRsd
         9zcQmII4cXP1s4djPI8r7Xwbkygb4p2oFTEF25b4a6onOqyzmpPWgTRcSZmtFI2dSLAu
         7Ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742040528; x=1742645328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gh3QUyiOPP/PspLDIgE2PK/QvR0dyXvPHAT6Rp95d8c=;
        b=MtCYZLvKVXgGl3Kp4kC6kDpndyfB+n+JbXTjXwqZru6DMPjzY0IPDXUIYD8tP0eqKW
         j2nqqjeFt0CCqv7eggV18DhNC+lxjOOwHHzPaVv1W0ZrNxuyINKiEtaa6hsK1SC2YdCi
         vsvVgReBTx5IbG3fP4SwzZxWlfvBKI2S2ok3J/IRVXWkoEqBRWR8hqBEOLeNmukBr85U
         h9gg1si9gUCYxvz0YL0A8Pm4ICSvJFmTdUrHYaOA45ZhmXu9jGBjqs26jUGDs4j7+D/U
         ybtIcN/D9lTKWv6FuC7DdXL9PvlNbHKcgo+MaRoaU9lsoKOqb1LCtZpPc0tOCarBuPa6
         Z7iA==
X-Forwarded-Encrypted: i=1; AJvYcCXobIfTVY34ZY6hxk0p4BKi8Q5R3uHOIoh2iCG2oY+CM8YK7YpGb6CReIYYoCOeo2jgpb/qlXsq5NHij0AkAM4P@lists.infradead.org
X-Gm-Message-State: AOJu0YzWlmeA/x0pXT/njJBaBE41KbctQrpvFzClXNNtqCKLHyU6jl8F
	TSuPa7Vr3AVAQK5+MKbhZp4MRxVnpfUnV9f+ljmunmBFNpLZYAut
X-Gm-Gg: ASbGncvcWipzkApvatBv3GMdTLU9lht73JaLx+Usv25HPe38OcVx7kqmtMTYpoO+hZ4
	zHifgbNBoqmNMdetyY8ah/NCeoRxE+HsegMP4tR5XYcwQqDm6wd+UpjbTP+k0Zj4G1QkMqmO6jw
	Mk4vm96F6GHkc4bJpleqFPTs0+f+YUEm1tdV2XkBAy5j5nqnWSKiVGv4e6xY4+bmxtnurz2q+b/
	dmRb6gAb9btezyRcK5NzWugndQcFOjVZGFQS1/wkiziSCVfSjfzKNGA4SheGjUbl7CskO6aoBDB
	j9DKVvutOWaAMyT4oIBSBNgMwNRKnv+p+lL698/Dw/QnqdOvW0W9n+2xHZY=
X-Google-Smtp-Source: AGHT+IF0eKUU5b7C4gS520TnleAFf5PI5qABtaudJMqtzsfOMNPKTlZNANfAMzNeFK4EP5joNbXczg==
X-Received: by 2002:aa7:88ca:0:b0:736:39d4:ccf6 with SMTP id d2e1a72fcca58-73722391515mr8708599b3a.8.1742040527945;
        Sat, 15 Mar 2025 05:08:47 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:bb6a:1a3e:36e4:cce7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737116944ddsm4325435b3a.123.2025.03.15.05.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 05:08:47 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: imx51-digi-connectcore-som: Fix MMX7455 compatible
Date: Sat, 15 Mar 2025 09:08:41 -0300
Message-Id: <20250315120841.1836214-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_050849_431851_0F764D47 
X-CRM114-Status: GOOD (  11.72  )
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

According to fsl,mma7455.yaml, the correct compatible string is
"fsl,mma7455".

Change it accordingly to fix the following dt-schema warning:

failed to match any schema with compatible: ['fsl,mma7455l']

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi
index dc72a2d14960..1980f751f161 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx51-digi-connectcore-som.dtsi
@@ -165,7 +165,7 @@ &i2c2 {
 	mma7455l@1d {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_mma7455l>;
-		compatible = "fsl,mma7455l";
+		compatible = "fsl,mma7455";
 		reg = <0x1d>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <7 IRQ_TYPE_LEVEL_HIGH>, <6 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1


