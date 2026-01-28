Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B765D35699
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93zs4bIGQjJ2eAJOoDnsMxPVORSrFYYCc5PKWJTbXFs=; b=yuLLBCSzoYVyLKK/qbUR+P9C/q
	spjg5/lUIB9FbOMbuyzSwhpPf5ByAWmjx2l9YSvXvuy2t/1cYSAn3yUM/U/DCnPQSQQ/ST9nP3a7V
	NCAQgt4oboH5hg5mwfb2Vqhp5Y0xtoPwii6YWc+G0KAekfBeY6seRIpRwhg0PFoziS3LU9ORuuWt/
	vQGbFtRzUtvgYIKFZcfSGZkLPALFuaFnJf0+cNU4cqv9InblWI/ik2GpGrXVeUd0QfBtV44Hwibm4
	RReqzDtPoUPXzYxGodXRPypZXW9pw2uRJWjxMpcyQQF6hLPytpsfLvgtKP+CDcA3+ElTYQ+TH9N+z
	lun641gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2Ff-0000000FmSM-3kp4;
	Wed, 28 Jan 2026 09:54:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2Fe-0000000FmR0-1ga0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:54:19 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4806f9e61f9so2028285e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 01:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769594056; x=1770198856; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=93zs4bIGQjJ2eAJOoDnsMxPVORSrFYYCc5PKWJTbXFs=;
        b=RgsaOsUAHVlL/FXIw2JYqjZxLIQkCxFOdMzvt/Raot2wEE9TMPXiGmwMi6cgW43uxo
         ZVYLf8FWeuBCLzGJDg2vy2EbG04C13C49PWg8B7qQpCjoR78uV8AVVfuyXPS51Yy7OCC
         j0AHVU42i98jMfjIOTGu5Z1bHwqCdWJjXzvhEfDeiITj14wkCtwgO2N5XNOUIevuVwIi
         OqoDkLfoiXs0II/OAXPyt9U9uY7mKKCsS9ezod+G0ShD/KmLQiy/h8HhCJ8JRY+XrzhG
         8k78h4R7RTEmrXg4DjRf8hpAmnMBR0npKsgCGw8+UNQekK5KqK2Mf6qauT/xDus3xYbj
         Rwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594056; x=1770198856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93zs4bIGQjJ2eAJOoDnsMxPVORSrFYYCc5PKWJTbXFs=;
        b=C9k51JSPEtNVLKF4kl/vg7y53Q0m7kXRWkLZdnAYx4zPWbSCdrvfuG5BzT5vCiIjdk
         nbimtZCyWWHR5PpskB+gwG5cENfaSQsRRdVPQoASO6+Oa6FqWVExVhPHp3dqLyiz4FhB
         Xgl9BK2h6DegJ4n6t1+VraYuThCH8wTVNOFOJm6KDsTf9PYrdeMBepQtuckVS00OZnSu
         ZJ6jS6NYTQvzEIJSWDy3TB2K+LETcUqYiMBzvVxDsuQ02umxSoymoytsDXhENDTkpRUG
         /y4W/6tMEKTdDoqepTRpqsfK//tP3VO7ov1ibVqODFLaSkbdgsWO0nb63HZbzaKCvDsW
         /zow==
X-Forwarded-Encrypted: i=1; AJvYcCXG3RTp9yeMx8Oc2ZJKDLDdA4pgjcQWXRDtUObBpnXLNVEKmkTDO84wpsLYeO4XogXgjvgw2SQlIDq+kYvjusaT@lists.infradead.org
X-Gm-Message-State: AOJu0YxK+uPWs5KsJZ6VbRdAxIl4U2FAVHOQKavLuCTkKxyyG1Y2kazW
	z1iu6f3gKxDxTXW3GCNN03yy1Z9GEhYbDvLFb9uCuBdtVeDBbRdBYT66TXJpmFGJbH8=
X-Gm-Gg: AZuq6aIaXdGkA+nqDSh9PINdCwJGWT6/zE/uveGzWFXTz0RPHmD/r//cJtfR98kwxk1
	hskf2MoszEtqqAMA3iOZYa4ZwE4h2UvtT6jnNf6jkMfLszP8AEAQbbbz5ujuMUtGmmt5mss8F2f
	H/oRUmuFxv9PEaUEBoduB3jWAhFBnRIyOQsuKP0KY5L+yW/lcBtRu6EIjh9MAfrZ4LHixKS1FtT
	XJn79FOy5lc90KgImtDmINWCCmdu+LvaVzauOPrS7vz15MsH5UcbNxKyt48S6+A7leMcSbdfHAh
	xcZV7RgRVDVQN2nP0cH7keyeuPWVQqUUKMVkVkjycyP1euTQv1KTFdh34keGVxNRo6zbwt6rTPM
	sbylLfJ0haqParB1yQ2iL1ADlJ09U+8Sr8zxKsrDPJLbK6sO/LBnnsW7Y+wnF69FTI22pZLe9Tq
	eCqUB7GpMtk0hmIW5Y
X-Received: by 2002:a05:600c:1d8c:b0:47b:deb9:f8a with SMTP id 5b1f17b1804b1-48069c7c4eemr58122425e9.30.1769594056369;
        Wed, 28 Jan 2026 01:54:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354114sm5903050f8f.42.2026.01.28.01.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:54:15 -0800 (PST)
Date: Wed, 28 Jan 2026 12:54:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linaro-s32@linaro.org
Subject: [PATCH v5 3/3] dts: s32g: Add GPR syscon region
Message-ID: <1fbfa51de753039f132edc2554c41667e00c0176.1769592679.git.dan.carpenter@linaro.org>
References: <cover.1769592679.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769592679.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_015418_461837_F223F7B0 
X-CRM114-Status: GOOD (  10.24  )
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


