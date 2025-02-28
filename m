Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BC8C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 06:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VqJ9ZmHuoztS9YRcb8WNF6K+ELpVTBpxmuX4DHyQ0+A=; b=gxYjDftus92GOZjNdeYFIXxpjZ
	Vbh0tWY4Z9G2q64aORr9AghCX419AzUoOTKTv+N4swRCrzNR7RFmHZ1fSvVSVZlR5lI4pbDTqSsJD
	QWiammkLqpdg6FOVPaZ6pXYNlPXVZQ1oCOqJKSbhqcJVhHl0C7gh11PrbIDPwPgeNOlr2pY18jmAy
	3SQpDimGpUWyRFSWgLT6i7UH1m9mUX0g27zTqCW0lc9yGXI0MkLQ4v1nGSJn3OVfjxTOBV13AVZH9
	eIz/sNZG77uA3wXlYX9i4/BiOoq9NU++Lq/MBFg04NsW27wT7Hu8L7PHlp/sxy0Z40ZzEsieZhFKi
	oF6Dw+QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnuCH-00000009uF8-0qWN;
	Fri, 28 Feb 2025 06:50:09 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnu3P-00000009t3h-05dH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 06:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1740724858; bh=VqJ9ZmHuoztS9YRcb8WNF6K+ELpVTBpxmuX4DHyQ0+A=;
 b=OYUVt1RHyHDTgC31OMt9p1E066owuR0Pq1yLMbQST6cmeG1txBG+U17TZA/UPO6QkS7LjTV6t
 QQE/7wnLH8OYO2dApiMvFNWpwUi63wugxJE24W/XSXDNS4FRo7HBpkfmLACIzPPIOWLJgg9e8uS
 fkXzDet2FqvuBiZmRM7hkHZ/sy3ryWuDIA/HEMYA5rE+VsYu+JAOMw0rKkNFqG74tsLwK9XCgsW
 uwEofBZXq7P5DXzgAKkF6H/ujyxU0NIwnw6NKvR6BLtH2wqukJ5IhHc2S101AtggjLkuoDpheXc
 gMhDasICVU6Tz0eeq3byHp5V7bxjH+2XnPH63zYIaV8Q==
X-Forward-Email-ID: 67c15a76bcf1d1bd23db0205
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 5/7] arm64: dts: rockchip: Add uart0 pinctrl to Radxa E20C
Date: Fri, 28 Feb 2025 06:40:11 +0000
Message-ID: <20250228064024.3200000-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250228064024.3200000-1-jonas@kwiboo.se>
References: <20250228064024.3200000-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_224059_281637_8F23136F 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

Radxa E20C route UART0 M0 pins (GPIO4_C7 and GPIO4_D0) to the onboard
CH340B for debug console use.

Add pinctrl for UART0 M0 pins used for serial console.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index dcc0b2584bbc..b9a66c6a1dfb 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -68,5 +68,7 @@ &saradc {
 };
 
 &uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0m0_xfer>;
 	status = "okay";
 };
-- 
2.48.1


