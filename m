Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4BEC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 22:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncoRs41lRHgHUmK4It/C41pPHXqjvn/8eqzWfObsejQ=; b=C/36s2gssJZTjNiMDetRzJZ20q
	MGibG0DlO676eNuGCHoYpNi6r3mHG/HxCK29SrH6fqU84uZJWL2VU2uqrrdJXIXZI3nT/Lr4hBIl2
	VV2UxzuO11q7FPjr3PXHM9j4akj3BXVopIGDvU5/oPYMGUVZjNCLGZNrZ4H0PdXc/v+043oWaQgKZ
	wzpiEbT+P/v6/MxJSPQlfGKTEVIVKfZwKaBiKF+Pdmmd2oVig9nbcovZ+ZPRhVfEWiFdRaX3mecBj
	efkm7Se946MqZngRvgqfG7+bLaY/k6xBIaJFEdvzXCm3sAjcgmBWMDgJKRnrlcvOuMWRGDfI5O6p9
	epptCCag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KYT-0000000Ce4j-1htw;
	Thu, 17 Sep 2026 22:26:09 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7KYQ-0000000Ce2o-26Vo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 22:26:07 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e66390995so609535e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789683965; x=1790288765; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ncoRs41lRHgHUmK4It/C41pPHXqjvn/8eqzWfObsejQ=;
        b=LMiIRuyPn69ACZjcm5iU6dJDC1Po8sAqbnNjHuxV/asrCil6kEU1MWfdolOfdKrOTm
         KxcQmcGMUCxtTM1X1CmgHFcmjKBIQSo6kpSyOo9JOdwskL/VB9xz81Fus2UKvy1Za406
         7BqmbYn4UPkpprI8gp2aFU6byF9i/0iS/A9UZYLHSzZQoiAsis8e5Wd/7BnXdMpORLav
         NiaR4k0PZpldU87MNVJIsN0INJwP7i+WO7/hBN2q5Ad2cfAPPI1hnrvimDj0FdKlm9m7
         8tOngPQefiIbdLe4UXH1ncX02X4XhsVq/3+REGQDs9uNTMnCUaOjpg4DDwHKnMO+eewz
         nl7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789683965; x=1790288765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ncoRs41lRHgHUmK4It/C41pPHXqjvn/8eqzWfObsejQ=;
        b=gVjzzEZgyXrklzYbF7OM86gPb/9npoUt5wYIw7p/2v/mTG5qlMZtUKMlPyUQXeQpwW
         WVctbq3aM5vpRDK2QfTmh8j+1H5MZdCbIpRfkes9XtGSZkqrCDG9/IGjHTss0dpZIaq7
         aVj6OSEoMYA0T35ls/7UzO6fiBM/fxyGOu5w5lJYiUKxO2JQ22ztRf2AI63STbNjpL63
         oPVu+q1xie5Ae5wkHVDKIzQ5nwxHB3o87/XXgIO+AlANDc6ud1EnQNWDgt/k9k0oknBV
         nVu17/H+J7QYu/fT2qsxu0nNgeZ78XBivSubNWZihR7dRqn6dsX08ZzrriDndP8sd0B/
         2nqw==
X-Forwarded-Encrypted: i=1; AKwUvBysWx9EPCq7k+vZCqc6pUlw2n9huu/k9gf0goVumy4FJbr1nuEZKBXzasv90JfTdKHuDvm01Q2wYF3mZ6ihqIwy@lists.infradead.org
X-Gm-Message-State: AFuF++ki43vNdMydlf8zywPh88zNK8ZOBPBZG/GT6tg285+zeKOz8OIS
	f8jM1cqrE3u6O7DuxzS50f4YBYtyaxUMOCM8PU03gDTeIlOMqzlffWSa
X-Gm-Gg: AYBFou10WuyIuokHU0ipvXtzabTOHhzTGXDOftMSDCqoxH0YC6Y6sIQrGZ+mFXhu8Nh
	FQqUbuBqqxiImGtbkweGlDTXYtaso8Zf7QI+bZq9cW5HY3faMr4ZmW3XcmvIZ03T0VYfs+jR3Il
	h778pK0ToQDkxa+3U5avJJj4o6IAHwGCD4mqsZRHy2SpCjaB1R9x0Deb1GZvuppQpR71ndrycmo
	8FFJK2dyZ4U1D3/KvgXqDnkI1t9cqywFgeLwCKnYImR9HMRGOVIsKzYGV3K7oJWwpCC47Bj4tMK
	b3/hXiEIaBkJV6k5ZUZwWzS5MyTf+zRFDIdQyxEdNMXqpektdCb+gLENXAeOg+NzcMjUQ2ejFhH
	yEAVvGO26Mt0ssKHTxbXpzuDL+bRt7RqDeIB4gLknQa/FhQMVoivboShXIXm7V0DmmIFPGl7Aor
	Q8n/pQQFRpEVjJpQT14vJ0gxh1/knnFP+awsv8NuAqfEds4HtjMaCW1Yme4z8vQYIICR+HdApJk
	m9mN6lL3aZvwZh3T/OqJ+P/CT9IRX3hxLY/sC4dt+eJczEEs1vUIPmxLcT19TUluVcD1+dX7qxx
	Zbf/L96ApgGhxCB3wg22wA==
X-Received: by 2002:a05:600c:1993:b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49fc56dbc54mr3747155e9.3.1789683964859;
        Thu, 17 Sep 2026 15:26:04 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56aab7csm5583835e9.1.2026.09.17.15.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:26:04 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v3 3/3] arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay
Date: Fri, 18 Sep 2026 00:25:45 +0200
Message-ID: <827798e569775b16aae6c65ff08e3cfbb2324e0c.1789683864.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789683864.git.stefano.r@variscite.com>
References: <cover.1789683864.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_152606_561510_15ED4D1E 
X-CRM114-Status: GOOD (  12.06  )
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

The Ethernet PHY reset signal also controls the regulators supplying
VDDA2P5 and VDD1P0, so releasing reset restores the PHY's 2.5 V and
1.0 V analog supplies.

The existing 100 ms reset deassertion delay is not sufficient for
reliable PHY detection. The TI DP83867 requires 200 ms of stabilization
after power-up before MDIO register access.

Increase the reset deassertion delay to 200 ms to ensure reliable PHY
detection across repeated boots.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index cb7998616a87..c5f0e22f549b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -123,7 +123,7 @@ ethphy0: ethernet-phy@0 {
 			reg = <0>;
 			reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
-			reset-deassert-us = <100000>;
+			reset-deassert-us = <200000>;
 			vddio-supply = <&reg_phy_vddio>;
 		};
 	};
-- 
2.47.3


