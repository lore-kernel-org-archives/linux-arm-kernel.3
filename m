Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB0DC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 22:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIRBbaOEjVw+z1s6TRr7Y2JzFyyPMWjFFvzVpnYEfa4=; b=0Mlhg5ITK3aKAL5SvEscR7sZnq
	+lRtF6VKi/WFwQT2p3ivQNcDvCs6rf0oa6AFluLO5n87qnAgi2CsJbGlLMPEKu5OtbfZbdY7MaS+C
	l5mbNCCHSyy0pShtUGhe6VhONMg4B7zQXU8TSLYl0ru/UX7/qzw9jSoXY/JgaxGQyyGOcWpYXY5/p
	919wXbZzHwiVZPiP8uP8u/UhvsToxlb9fmJ1ThjKNNjZzD8JNc8LyhaCwLjUv/a7zQsNS2TAfPG9U
	0DpJZjXXwmWsTcWgXUB99dyDeDnbdRgfjFmBb6dkMPVqvFyK8TJR4uzp1Yvvzp/8g4sU7gg25N/1l
	9tmr0IgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL86m-000000022bX-33vz;
	Fri, 30 May 2025 22:21:48 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL82X-000000021YD-3Sfl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 22:17:26 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6fad4e6d949so5386806d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 15:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643444; x=1749248244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIRBbaOEjVw+z1s6TRr7Y2JzFyyPMWjFFvzVpnYEfa4=;
        b=BYx+uacceXRjZZ9gFFAOrQbC+gFApzysk0NSdOossCBhAOY/AvLdH1dfTBLg1/nLai
         PSDJOOOnLnS7v6n4L/lnh6iu4+4Vg7jglQEyTK8fgLcSCD5xUykriIkqKdhZ2jgO2RPd
         0S+bw+I34btoAsuX+nOZdqVJIs2ctyHdXg3ElSgr/dqBWhLFs9y+eXZE5dWO9ouzglPl
         O0pvvuk6qnCDHzvGGl4jBR1a0iKZ26pLnP1yu4C1+3Z615RKQYhw4HQZvdzIPvHRbmsF
         oBc+3lOU3etv+gcus9KIbcd2lm2wft/1U/uA7+ozOvoy7jCrNmxoTU7j/8TeffMLsySb
         a27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643444; x=1749248244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIRBbaOEjVw+z1s6TRr7Y2JzFyyPMWjFFvzVpnYEfa4=;
        b=wSTT7VXJapYf4KSi36mn9tY1Phck7EjUcarz0KMn8seKbXLw0mBnN3qnfHcqeMJa82
         Z8ic8twlff2xJ3kluxxq3u8i375aTFbLNpqHpWKkESckV1e24Fca+Gg3PgwpjP/68MsY
         Ke+eqSJcHSb/I1K+QmoPv5K4xko692QMZPmTJbhyQluBr3YPHl4dtgyD6d52oFm3Qz+g
         PS/f3gat62cDIf2bKds4g409FaUUP5G3QjQy/Uf4r/vJWIn2GXr5rAS/I3RszPCYky69
         X9lFqQCW+HC1EG2hwgdQRl5ziMqPGpNeeHkQnPsqvqbSTcnBqLvEiqypagEfv1IArFly
         ndvQ==
X-Gm-Message-State: AOJu0YyaSnehcxWY097hpRqOUr5Vf/nlsbdskUgH6Bzik2tsRQkbV5Dn
	k2nHM9qKuA9FkkzGFzc5nphA3urooCoSYVEW9+ugpEiivJDX/AAJ5pcWjgJDSQ==
X-Gm-Gg: ASbGnctry/bo5rMtZ9iut+iLkxlSXHrJIegXFkg0W5gMQ0S28j9Ge9nLW5uHoztFKdJ
	MXg74JgA7dV5Yw/vex7kqphBlFfSg7sd1J1a6jgwNaC0HTCwYGGEXb1mL4wBh2RbHTX/v3+OEM/
	w2BUN3UD0fGPKfp9hx809o0QcdQOggD3NndH5c/eHrHXumNude+CNhLYCZlZdkSwvw1+xMUmAo3
	3qQykwGtGalPJYNNVRutSBKuZCuR5Mxvs477mWkTalmwiklDv4yAbHJmTOkteJodYD2pvULUaGI
	Jd5nikOdPx3IgwhkpZu4TyYS0fyZsoS2AAyj56wupgdIDbh5UdwK+dEIRSHsyoTdbn9LafeCvVu
	xdH05RJbLfe0SC+qLRUx8jAXSIw==
X-Google-Smtp-Source: AGHT+IHNIFceukgWG6Du13MXecS6a6ABaNhOzxuX3ppo7fgyDaEE/c/wlZh8kZOiyTHQ1Fg33/RQ8w==
X-Received: by 2002:a05:6214:2461:b0:6fa:ce87:230c with SMTP id 6a1803df08f44-6fad913ac01mr2942996d6.25.1748643444226;
        Fri, 30 May 2025 15:17:24 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d0cesm29986866d6.35.2025.05.30.15.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:17:23 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
Date: Fri, 30 May 2025 17:17:08 -0500
Message-ID: <20250530221713.54804-2-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250530221713.54804-1-aford173@gmail.com>
References: <20250530221713.54804-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_151725_864569_AABDF050 
X-CRM114-Status: GOOD (  10.49  )
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

From: Marco Felsch <m.felsch@pengutronix.de>

The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
VPUMIX power-domain nor their module clocks since the power and reset
handling is done by the VPUMIX blkctrl driver.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 948b88cf5e9d..1bf15c502280 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -876,24 +876,17 @@ pgc_mediamix: power-domain@10 {
 
 					pgc_vpu_g1: power-domain@11 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_G1>;
-						clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
 					};
 
 					pgc_vpu_g2: power-domain@12 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_G2>;
-						clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
-
 					};
 
 					pgc_vpu_vc8000e: power-domain@13 {
 						#power-domain-cells = <0>;
-						power-domains = <&pgc_vpumix>;
 						reg = <IMX8MP_POWER_DOMAIN_VPU_VC8000E>;
-						clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 					};
 
 					pgc_hdmimix: power-domain@14 {
-- 
2.48.1


