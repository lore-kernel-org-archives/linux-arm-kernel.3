Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F902C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9b/fhEwmBPxpFcptPOeQ0kZ30PMWIDMPcXHfa9JyTQU=; b=AaC5JUbY5E1iCzvtBC3Kn4JOgr
	s0qkjLROSva6biNDolXW8iQG+pPippB3UHuNDHaoijDvOfKuNQ2nTvN+IpV1yGTltxp8iH45PqiX9
	8Ezz7FZhTa3KaXySWJVy35BjE9BTnPGVFM8yMxwua/AHr1EuNnKGKy0RMC2wuPXAXeLvq25Xf1aw3
	x6IBfk0Nfw+DIvOSnw/Ng+FHKJmefKGGhPyWv5vyyYRKM2gRYZcMaGskkldvQiw0KfLq8l/K7ZhiB
	vi16EpRm2iO2avLe/qhPoNxWLwiRFAbwqPA/OOUOV3I6s/WRNzTSqYe/5u7zhxsqveyRYJRmJ9M15
	am9ayQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DjY-0000000BdaZ-47uh;
	Thu, 17 Sep 2026 15:09:09 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DjU-0000000BdXG-0V1S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:09:05 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e66390995so5428795e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657742; x=1790262542; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9b/fhEwmBPxpFcptPOeQ0kZ30PMWIDMPcXHfa9JyTQU=;
        b=UzIpCOd7G5Fg3TrWhc7KtO6F+fuQbvaIwoNwH52ogFryVU6zt/Z/XHHCpTtE0C/n6+
         hxgFo0Eb6fyxEJBFMux/WNUpI5Vw1uJxUEgwcCMxY4sRvG7c1o0uqbxXmEe/AUC6pZqP
         cobXH9DtVHyZSFq5aqdUCWC3f91u3xTMmKjR1AlOwjRNnVMJoIwuKbKNjDzUdc37SqnA
         03+wEKvg5/rBfIG5MRDM2wzP10e1kIhjjwjmapRTNurw2GM1SGckq6O8xrJgX4EYvPDn
         SNLgUgMoyLpXkPCYRGCIkuTId6DIIYnYnMJvs4teFKfFJxVQkx12AJ5/6H2mnXPibi1C
         rQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657742; x=1790262542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9b/fhEwmBPxpFcptPOeQ0kZ30PMWIDMPcXHfa9JyTQU=;
        b=y8Iymp2kis1iJwsUtJjJSlxgoWR4xgVip2dXn/PgNCMDJhelwh9xNA6INmtHeu72tG
         VZiRgUvwhdhSYx3VVY7zho7czRjuLqoStI9VgUrQeS19yDWh+NPmCAKhmQWodPHiwALN
         ZFPl/qnoBMwLTusSfAD69Wp/7HzZ8L2xUHyA92GS86daX8RtVcPcCz1foUJInCnmgtqJ
         mpUGwHi75BYYWJ09vqU1PUsuAixvUtZUKXq+87q3hwQLlRg8fF3565jBrycWqMtmO5p7
         DKjAwOHpDHs6tZ4IaZ0+OIPaSHef91Q1dolCeFr4pSaBtJHQFUu1plfySeuAZhmF9nTb
         ppeA==
X-Forwarded-Encrypted: i=1; AKwUvBxnyC9Mjo4fvdXwgp/TFe4ny8bmg4pflVwlgf9+rt/eWaAQh1V3o8sS5IrQSUXr0WxeqHnrOQfcZ5UZG4Rg7Rz9@lists.infradead.org
X-Gm-Message-State: AFuF++kUtCRrPFhZsnOsUNJVL+n1/5auxf7NXO6zXPnAY+gt7VyOtoVN
	gvPul8quZsOPimeXLryq2Tn4HUsONcAJ7CSnLe9BinqpOoitXwNYfBNI
X-Gm-Gg: AYBFou3eqhk4wdTp1wQ1U3D5ZztCL1CwLSFdi1B6VqGeu9BOYM/opsBAjOSg+48gXdK
	ZVKOeLU2lAVphV5DIY0JooOCJH2mq8Nx+V/edLEPzpxsFS+UB3mzoqZC03+PrS7pC4H7ivTnTK3
	wIbdU0a2x7kkD4yl2rLJ8GnNDdoAxyZR0PuLgHVfGvpJFwjVfZQyXoGnTqC4FhTP8m7iGv5PqQq
	OmTrduf/g42WiYbt17Dhxs3beKAoqoRs2RFRhnrX6DyccW+qbkOWNwDbwU1NMls1spoZ5CLW1VJ
	GuLC2ge+dLDe9u3yXQ5S9xWsegnFvsrngf4+TXGbN395qERPKkpWy3IK+vYoHttUBN4U9zMRxm5
	iehz7FOBqQewlEm8nbxQIMQvqcGQnD/VCyT1fk9xpnVQgdiPSEElmUZEwIEGJB1xqOat4zGE4J1
	MdgaFY8yPBLY9vwV3ALxm0kZVj4kLnWeSxGaEtpPW9Cf8cMWzjF4PA4lPY6MpYmUUoIofhhDj3a
	6xdCDgki6gmu7aJKr4aUOnSMDMS7IVhtD1OgbEPLsj4b9AdqwK3aOMUPtpxJYOb28Iv2yC17bFE
	/HZUf91fF+6sYuFA5mj+LQ==
X-Received: by 2002:a05:600c:314a:b0:49d:16f1:94a5 with SMTP id 5b1f17b1804b1-49eb732b59emr86524435e9.25.1789657742060;
        Thu, 17 Sep 2026 08:09:02 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm82531345e9.1.2026.09.17.08.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:09:01 -0700 (PDT)
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
Subject: [PATCH v1 3/3] arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay
Date: Thu, 17 Sep 2026 17:08:45 +0200
Message-ID: <197308a77fb4310a3615bbef084b25fb1874c753.1789657399.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789657399.git.stefano.r@variscite.com>
References: <cover.1789657399.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_080904_186497_E64CA939 
X-CRM114-Status: GOOD (  12.22  )
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
 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index 9fc0f7e551ca..fcd937d8d29a 100644
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


