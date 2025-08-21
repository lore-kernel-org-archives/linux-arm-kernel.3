Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3B1CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 13:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cqZj81I2CiiZ0Kzalw4lV9uG5vvjnDT/qAPEKbzCHA=; b=WopMZYQkE4gHqq/DDPMQuS5Rm3
	8YHBB6mjNTqRrJmM1k5eYT+oR7UddJ6pVJLvsVOQfWr4dgVk5ARGcKO0FUSXiBir/odCX7nw/9c3Z
	17dOZ4RrewFO8daYhcbn+NZMszF3dWw7Eq4xXUC0BFBv7Tm4/pu/N9w7ntHfAJ4H5fVaRaUrX6rxX
	PIc6icgoXkmRim36lR3iYqEeQpLZ3H8KKzZctmQOXuyebbvoL6T6C4Or3I3hLcBJzp7UpFs+HESDd
	P78fT6a3A1lNhh+aF89sapf96BG7wD9aA3vgsOniO2lzGmldco7f7eIUSIRDYeHOC9ZBWdPMzDCVx
	XGhNUWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5SV-0000000H4ld-3XFM;
	Thu, 21 Aug 2025 13:36:03 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2yR-0000000Gfz8-0xiR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 10:56:52 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-afcb7a3ee3cso125577266b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 03:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755773810; x=1756378610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cqZj81I2CiiZ0Kzalw4lV9uG5vvjnDT/qAPEKbzCHA=;
        b=X0pnPIlK2mnNSQFPHDoTVZYzvRzCoTjrPCyF4lnfOcEjN7u3xf2YDMo6G9fKA1RdZ5
         8xHk1Rj9CuaYibpS3Z/mQ1I0iIYQlCg3qKTzbSPH7z1xG/vGHkA6RgSAq8nIAfsJOfBX
         GHaltwMd/rOIiVQ4q3C2pqsOQXS3gNsj3kEQojumtASHekf+ktDurQNLSh8zeeo/Imyu
         o2L1ul9WDj1kbQIhMhURHJoa28BnLmh+ErUHGXNh51HXf8Q8iQHK71B5tPGQbzG4yGUC
         6ZGv+v6GebSEEUCF5rnI4VUWDc0MB5zMNR3a62Gvo2fPhIhUGir/YZg7XMXx1YAFuvz+
         HJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755773810; x=1756378610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6cqZj81I2CiiZ0Kzalw4lV9uG5vvjnDT/qAPEKbzCHA=;
        b=rNFbb8stxPWVFOruwlIXkzgffV/quiVWOhP4ofKxHudDEQ4ojHVNrF3IkTmBXfht7r
         mlLz3BHMl+aYTghzGfkyLLCh4Agz5UH9n7UQuZux8Xaaxz0A/0OK4eQevJlGvGBgfyun
         gkG/C8G+NcLQzenHlPrGnHATY1GrVLvfPy6k3+gpnSrES9Ez7+QSrV5+XJ3kXB6YsZcI
         s9oxklTPKSP1RpQ0+s6ZBKP/UcHdSW+689QdbqWcAeKrwjHKmu15HO51+2hxS4BZhYB0
         IaU2GUyjzafkGa4hYGosJRmm02Pl2iTz4yMJ5bAV6078kPZh97BFwdXIti5Lp3cL8o7p
         rp0g==
X-Forwarded-Encrypted: i=1; AJvYcCU2Nz3YgwUxTL8vjOQGpYH3xQAuwiMnkhapR3c6ox8EhvA3Owf5EYwylP2hYrnRIG+xQ70M1yBUBx5UsFgRkmsT@lists.infradead.org
X-Gm-Message-State: AOJu0YyFqFCLBtnbdd0Y+WCD1YlSm1ppGHb3wM+i3aYkKjmP2kvV1kx9
	dm/6H8OxK5MnIBvKeenC33FUYgRL7unWwA3DmJ47PnzCvgf3ZshJ+Uu8
X-Gm-Gg: ASbGncsNIDRhr2yEu6g5vs9v5XA+BcIMmTPRyEwuBVt1J50HYmrX10BVKvmahURWxCb
	nnfzbOuj6bLs40GSm03730297U3R5Hz2HvD4LvNiK5tpvAvvGkD3oz1CFPX8u8b1MSIkiQgBsVP
	UvuzLOU3fpVv3NCTEY5WJdTt9oNfX+7P33a/0itGArLqCRpgsVeOwbscJG6LfL3JnWSGgi78MLK
	dnb6Dk5Qh1bK06zFa7RGVhT6eeQ00W5DG2OI8rknxb3AdM6Ch2k5n//rS3ukl5hQxe6CLNOdvb4
	w5PYS1uDTLscuFJX/ibXEyHTPDdCjodVt8kUFzSZ0NE9wga012d+kWykEEzu7WW9weoDMjsjpr1
	DPBa5elcKgFmMhRaLfHsi0CPFFq8tXUgjkiUvE+s3ML27qMOaLTlH0I7wR8gO9Gs=
X-Google-Smtp-Source: AGHT+IGiQ6nnY2TbUKJoHVKQI8O3PuXhA0dGXV3weWAMnEObF/hJ5WdKCmczbq2+Q1oqR6D9+xs5aQ==
X-Received: by 2002:a17:907:3dac:b0:af9:84f4:6242 with SMTP id a640c23a62f3a-afe07c19686mr167470166b.47.1755773809529;
        Thu, 21 Aug 2025 03:56:49 -0700 (PDT)
Received: from DESKTOP-TTOGB9M.localdomain ([92.120.5.3])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-afded4790bbsm373602866b.56.2025.08.21.03.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 03:56:49 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Date: Thu, 21 Aug 2025 13:56:32 +0300
Message-ID: <20250821105634.1893-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
References: <20250821105634.1893-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_035651_268380_ACE52864 
X-CRM114-Status: GOOD (  15.71  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

AIPS5 is actually AIPSTZ5 as it offers some security-related
configurations. Since these configurations need to be applied before
accessing any of the peripherals on the bus, it's better to make AIPSTZ5
be their parent instead of keeping AIPS5 and adding a child node for
AIPSTZ5. Also, because of the security configurations, the address space
of the bus has to be changed to that of the configuration registers.

Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
missing 'power-domains' property. The domain needs to be powered on before
attempting to configure the security-related registers.

The DT node name is not changed to avoid potential issues with DTs in
which this node is referenced.

Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index bb24dba7338e..b62bb821cf61 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1396,12 +1396,14 @@ eqos: ethernet@30bf0000 {
 			};
 		};
 
-		aips5: bus@30c00000 {
-			compatible = "fsl,aips-bus", "simple-bus";
-			reg = <0x30c00000 0x400000>;
+		aips5: bus@30df0000 {
+			compatible = "fsl,imx8mp-aipstz";
+			reg = <0x30df0000 0x10000>;
+			power-domains = <&pgc_audio>;
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges;
+			#access-controller-cells = <3>;
+			ranges = <0x30c00000 0x30c00000 0x400000>;
 
 			spba-bus@30c00000 {
 				compatible = "fsl,spba-bus", "simple-bus";
-- 
2.34.1


