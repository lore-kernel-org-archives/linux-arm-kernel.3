Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A08106286B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 11:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tqpPz9P0T3i29nFtjm5Cg8H+Ilq/OTzWCRX5bsan7QQ=; b=jSWN50RVbt1z4cunG/oUDu2S6E
	TSfJ4NJ0WQrb9PEtlhQSHaTlgw0zeAHEohGawQxNNaNa7fEKX+1z/xvzMJyoOdSP8cY4WMLJcUKHp
	5MdVvd9Qnu8VXX1rerWIrrv5amQLw0bCQomJKQ20YP3Ha0vswCOPCxLgJttJUpV6yFezA4vbiDMfE
	DzHIu7/WfYgTUAgazw0ui+NR7Dg/Jz93FlaCxX7YdJeItCab9uMGkSYUqGTN1O0OvfkjKWR6KdLtu
	+aKBZaqWU3oR7y33czwpOGTGoIc4zPbdLFvNanj3fBEuI5NWN3eyJ0HUngGWa14nUZTw4lCVV6gxy
	EC2iUt9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0I9k-0000000BWOJ-3vfK;
	Wed, 11 Mar 2026 11:55:16 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0I9i-0000000BWNU-12tu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 11:55:15 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3598cab697eso579852a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 04:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773230113; x=1773834913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tqpPz9P0T3i29nFtjm5Cg8H+Ilq/OTzWCRX5bsan7QQ=;
        b=I6TTUPIkBZ4SzmopmehwWOPMMD1ZV3tZ2yQupbYDe7CTgx6IsUb5uvjry5eI2TwLsp
         DSS6y5VFi64rG18Ebxsw80xHVXkqVn+TM3vR5uYoz3KTw48QDMEXTYgrfE6c0vlYR2Qz
         FKIYHx+Qo04EbRJLDjbj8Pt2GNiJn6rqOYtG2I3018HLnupMPVTKrhdBO18B7+JA24yp
         12eFsaS+RztHlXQnrN54XLP8JHO2pbFRGHdMLRmZhENGsG+szdj0fjGjBVaHlLPL7Mkl
         jYymKjisKiqvZN1SzCddUNOokhmh8A1oFIsWvF5myZZv3sf+pqKU4c+qvlywJHnAaKoS
         JWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773230113; x=1773834913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tqpPz9P0T3i29nFtjm5Cg8H+Ilq/OTzWCRX5bsan7QQ=;
        b=kRS00GyW/3anN4G1F09IkI/zn3eL08aWNViQCqu87/tSStYJYOgRp9k52VzdfeFhYb
         ysLlxoEcxRd8I41Dyn5/QbUGu4kO0LXvUsaQT/icAPHexyx/qplpOIyhvVurvk2zEGiw
         SLYArlMjF/m+p0Mk+0pgDNyr5YCsbytWZwMHrRx4B7eRONfzLz83YosFLuxyTcMsAXyW
         X0JIHfJuwEwNbxZ5SSCN8wc+TwljwSsqQcAj2TaRXNIMUc0TPUGs4LONTpoNxZM0KHss
         D1KjKXyl5dKBFiUekvv/T0WouOVHYEPqaWKzZS8BDhE1bKFbPLMspKKLT78M/XiWR1Vc
         Cm+A==
X-Forwarded-Encrypted: i=1; AJvYcCVr/U9JIVLAQvxU5++UW/X7v8Op122SmUNyf1Opxq4z2DqIirXkoWfLMAdglBXdMfZt8XsuS7q7983KTmq+mrHl@lists.infradead.org
X-Gm-Message-State: AOJu0YzDNv816nu4zgmffekFVRS8e5eJ3LTw5WnEyzbiLJurgoozGm2B
	D9cT44xe8g8mZr8kxvjEPxnd+iECBGvzXG7xC00UJR0P9X3cKKL4I9gc
X-Gm-Gg: ATEYQzzbKdWssXGNaESGmK65ppD9i1gTZluvZ5JCTCcFAhgGCLe1eoKNXIZKTsj9Hef
	P5E577Sgz7Eip+aQsKXyw7BcJvgXGvv+AAoYhYII2P2T+OzvmHEGiswy9GHLcwmtaums0qw3+7E
	rATth+ulQFrappUmB9y7d4Rh4RBdeRKpd9yDg7r6FYtpfetRGp6QZS1pFcjiWs+jkhj2NQj60pi
	d4YOsFiqMz0McgJCvcsxZkkarDQomItdDjgS0oN8UPDK8Gfy+QUt1X9fv4whVTzmUeSm9919A/q
	kJyRs+py4CwCLGP/KKfecwdmLgITfNaBtdgM4STMEIECjca4Lajk3Ipadz1ACtJLnN5GKdpYgNh
	ANtkg0SUIVj1zyneldK9CmzF+WABhcG4FSB3oeUd/yXyfxq8px6KqHgXYqtmFD9Q5HEOpa8Tb7f
	krKqoJlj2otRtKBH3bCkeZoOz1yLxJ/TU=
X-Received: by 2002:a17:90b:2e52:b0:359:f5f4:7740 with SMTP id 98e67ed59e1d1-35a02830179mr1816790a91.17.1773230112844;
        Wed, 11 Mar 2026 04:55:12 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359f01004f7sm5731790a91.0.2026.03.11.04.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 04:55:12 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v1] arm64: dts: rockchip: Enable PCIe CLKREQ# for RK3588 on Rock 5b-5bp-5t series
Date: Wed, 11 Mar 2026 17:24:30 +0530
Message-ID: <20260311115502.7353-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_045514_312725_9B3F6C82 
X-CRM114-Status: GOOD (  13.57  )
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

Add supports-clkreq and the corresponding pinmux configurations for PCIe
ASPM L1 substates on the Rock 5B, 5B+, and 5T.
The supports-clkreq flag informs the PCIe controller that the hardware
routing for the CLKREQ# sideband signal is present. This enables support
for PCIe ASPM (Active State Power Management) L1 substates, allowing for
better power efficiency.

Cc: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index b3e76ad2d869..668b19c05f7e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -468,7 +468,8 @@ map1 {
 
 &pcie2x1l0 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_0_rst>;
+	pinctrl-0 = <&pcie2_0_rst>, <&pcie30x1m1_0_clkreqn>;
+	supports-clkreq;
 	reset-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie2x1l0>;
 	status = "okay";
@@ -476,7 +477,8 @@ &pcie2x1l0 {
 
 &pcie2x1l2 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_2_rst>;
+	pinctrl-0 = <&pcie2_2_rst>, <&pcie20x1m0_clkreqn>;
+	supports-clkreq;
 	reset-gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie2x1l2>;
 	status = "okay";
@@ -488,7 +490,8 @@ &pcie30phy {
 
 &pcie3x4 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie3_rst>;
+	pinctrl-0 = <&pcie3_rst>, <&pcie30x4m1_clkreqn>;
+	supports-clkreq;
 	reset-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&vcc3v3_pcie30>;
 	status = "okay";

base-commit: b29fb8829bff243512bb8c8908fd39406f9fd4c3
-- 
2.50.1


