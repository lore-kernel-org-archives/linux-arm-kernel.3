Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD96C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aDR3CtqhE27ogRtvnd2/+ItfqSFXFURCEDa5p6mq048=; b=k7yvYQXC7mBMy5txy+LJiJ/2lU
	y9jhqRHKpdR2PrKnLDp6hv2NaPXjBjq1ql2/+jIB/GC1rjAhHVw9Ge/liIAR3WDaUAeCYJz1BPE3v
	S3Y0FI0ea6cbZGhTGOpFS99ii+Zf4H8w2ri1NQSdU/HAOWaCE0052AdUfhJiH82JTjxpiUDrkSGKR
	cbRL5RT6UHsdb1taCnjkU8tK1r6dWHyU2jau9sAflZipQ2O/DKa0MJX90V90YRP1tzzl5LtvON1tc
	/xqC3pyrx/Jq9boT5PK2ocMgdFTNN5Uj0+H5gmobzZttUtqvjkPU0nbPUh9zpIRJe9D5DZLjseD2a
	Epy2g+YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Br-0000000H3Pr-0FFX;
	Fri, 11 Sep 2026 15:29:23 +0000
Received: from out-208.mta0.migadu.com ([2001:41d0:1004:224b::d0] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x53Bm-0000000H3Nn-2lvK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:29:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=peYt46gEnplFq6VAGkOGT5G4FCVR4PjJCVV/CvQlqiQ=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789140556; v=1; x=1789745356;
 b=X9BUDtwMo5RuqpPHiLXsntdkaPtrn4dznM0BxpF7FvQuWgBV5CnM81YxXX9CdLArTJTvsVdX
 Ui62sfms6CYNn1+RK8FQDIf5HUazc4Vd3dVWzfzUQD6/OX5zwOME5tJUdNrCmDyVySPgaUoKB/s
 2Ee7xwEaNvMwc0V1RGchUYCCCVW5MCLbcBnBiBwROv4ApgqUlEml45ns5Xp7TqGya66GQPz9Dy6
 erSANy+E281zijLeztY0LDsM1koHHrxbbP6kXXYCwOMOpcLnaxYYWTtdKirkhhW5TewT3Q8u5FP
 hrtq4mzYDQFhbc4yp1544A48mQCpFj3HFoxPRrkJq3SNw==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4a6b1134c34ec148;
	Fri, 11 Sep 2026 15:29:16 +0000
X-Mizu-Trace-ID: 4a6b1134c34ec148
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Ricardo Pardini <ricardo@pardini.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH] arm64: dts: rockchip: Fix i2c6 clock-frequency on NanoPC-T6
Date: Fri, 11 Sep 2026 17:28:33 +0200
Message-ID: <20260911152911.2088363-1-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_082919_394685_D857934D 
X-CRM114-Status: UNSURE (   9.43  )
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

The i2c6 bus needs to run at 200kHz, because at the default frequency of
100kHz it may fail to find the RTC resulting in warnings/errors like

  rtc-hym8563 6-0051: no valid clock/calendar values available
  rtc-hym8563 6-0051: hctosys: unable to read the hardware clock

But only sometimes. This should not happen when there is a battery backing
the RTC, yet it does ... sometimes.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
index 4d97afbc33bf..ff4f766ce0df 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
@@ -455,6 +455,8 @@ regulator-state-mem {
 };
 
 &i2c6 {
+	clock-frequency = <200000>;
+
 	status = "okay";
 
 	usbc0: usb-typec@22 {
-- 
2.55.0


