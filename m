Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C4ECD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/iIPV76ncWnsnB02XWy8X2SRWE7hBDpjqKEtTw+A0Q=; b=bmxCzfZzU+9CRfSissWPqejlR8
	V2c+1qHMiXzcDupAiTMApIEWEzNDS5X500iMy3SSQZ+K+uF/D5GeJ5SToJU4jAZhRrkc9p2t7WMM8
	WMeseZuZamV1VF/NeYmsXCBSojLgK6MCZVESlVYuKE19i+umE+d1Or6yk1GcgpSFh9Fgtt1CdjOhl
	BGPZX4hH6tnRJCZxHe68ll7FFQEk7R+ODxESyAiEJHhqI6lHqGf+d5aO0c7hv/LGLQANWDRVVazPN
	xeFdysi7zTQhQIhK/dZgZplfSKI0nmkAysHYOHLhQrifgOCHWXjCTeEp0CAMX4fsh1+VrdQngAi/+
	q5tt7LXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGY-0000000F0MN-0Pjf;
	Wed, 03 Jun 2026 12:00:10 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGU-0000000F0Io-1V7N
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:00:07 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso122305955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488004; x=1781092804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n/iIPV76ncWnsnB02XWy8X2SRWE7hBDpjqKEtTw+A0Q=;
        b=Q8yR1yC2yl0OSx1egTO4AYjUXuETj/+TYHho1hO1bGr6VkHUD4k5sRrJhoLNbVncSs
         J2BUpACsfsZY93usrhGYmGoLzpGJ3ylKvJc8JoJZ+u7SWkgrlhQ1NOMlIbl9+3phTcn1
         RgFZY+kJcyyybgTGSOTk2tb7kpB7L20oFZkLjPyF3rqxhQzNaLDat/YL5btVjIQpxcxG
         vl//7xT3TxUpnuiS24BMw+VSoc0uMXCit7WwiLn0F/FOPFHhFXeSamCt39/DGr0Uex/a
         a3+SP2U8H8z0OmROF75vhWlPAOTv3W5qi07jqLx2KcFo2pRauvKWCZzZsHlKYGEAr/F4
         04NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488004; x=1781092804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n/iIPV76ncWnsnB02XWy8X2SRWE7hBDpjqKEtTw+A0Q=;
        b=VVGh1p0d8sboS8YmXwOjGPFylf/nnxDFhg08bbSCQibh14+ADg2MSJ6O7Y4QFVyPbY
         yeCZNQbfi/FVAe22Sw6+zrvQHPclBzIPFVfZtX0J6DP/NRwQ2iK2ccOJLUaqKNe6mS5K
         b4ko21jkSoBAMwO71DDcMolnqGHeleQgDRxyZXt95UG1BURaIbsWs+bg/2wvOSDQvEKS
         L2skdfhKcLTXDpAkpND6Vf5ECezzbsxZsv7w7PozKt/g1SdpeKy2l5Ed8AKOrgauJ6Ty
         AN1RkL2kXCfFvGdozgT2F7mxqXBnOda+eiup2Mg+UjcYo4gBjW2IHaqUxjZ3y2RPezWA
         /IJQ==
X-Forwarded-Encrypted: i=1; AFNElJ//Gzib6RJjYT86Yio84H9AQ7wy7WMNqNxHb6fIwWFfYlFGuzMt4fp2oHMksOF/vqf47m2oexeQSUO67E1apu0H@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6RAyTo8RVoFqHofHRnl14yWS65pt83yQwP40tHu9XQQNeOQ8W
	gk9y/C/0UJv8FCBgIyvhg2VBiiitrjdVBcK92ff7+4SfAkKOg13W9Kaz
X-Gm-Gg: Acq92OFZIPBIqKeW5sdgNcSkzsseCNc7wuz/zhPtxWpNZck7CuTu3hjDSzsxbuPuNVo
	yrp0hUUvnYRlzDMrWy0+6slLgZVJzehg35Va0hRV2sQewpb3ZGFN58vawdlWqVIRvN67UXmvWPx
	xOePOTVlq82UHwaWW0KjzW64eMOMx1HO6hUeOrADtkzwFZzSxsJ7AuRmcOgFmZregHrnPIUNG3G
	PCxzzYO8G7TefGwCDbH1RqHnM9+bYlVpV3ab+FzsC134YU0CyExJGrFaXhNwF+c4Sbgq+9Cju5F
	IV05Ad9xGPprTy2x6edllyP5hGd52IAejKMJMwhz4p7nTa5Ji0CGM31Tbcmq68tx/8zLNmVag77
	VSGlaxuMfUt+/c/QpbE8ErKux098Wn40VuZ5UeVjnJ0F97EldL9yr0Bs1NN2T2WwfeH/kfhlcRy
	KU4J30NTB0Tvbbx8gfYP9uapQpDHUZBllYn28S0damiolypPTvEi7vKstPZ/dHdu8Io63Q9lZDa
	ERB70i25nTtihq5Sh8jR5tGdS9aRxbE0om1lTqbXNOG+x62
X-Received: by 2002:a05:600c:8184:b0:490:b5a0:ccfe with SMTP id 5b1f17b1804b1-490b610797cmr46813405e9.31.1780488004248;
        Wed, 03 Jun 2026 05:00:04 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:03 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 04/12] arm64: dts: imx8mp-var-som-symphony: add external RTC
Date: Wed,  3 Jun 2026 13:55:42 +0200
Message-ID: <e6d7ce3ec53b1a4fca1a6f6f7473e9c75c04f30d.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_050006_429910_348D3D12 
X-CRM114-Status: GOOD (  10.74  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add the DS1337 RTC on the Symphony carrier board and disable the internal
SNVS RTC.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 935bc71b6ee1..8f8c76993fb5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -139,12 +139,21 @@ st33ktpm2xi2c: tpm@2e {
 		label = "tpm";
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
+
+	rtc@68 {
+		compatible = "dallas,ds1337";
+		reg = <0x68>;
+	};
 };
 
 &snvs_pwrkey {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
-- 
2.47.3


