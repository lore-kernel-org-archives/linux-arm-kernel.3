Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A835ACD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 02:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kSewyVdrq5Z8GYr/rDJoeSXs5aNZIEnD4cWp+G2/tF8=; b=CYFRE53DrNQo207nkQ0X+ZCj+/
	RN0UqU0r4bUijXx9qayPwVoMbaADgV3vnmTAswtKSrUTZKAldyaV2iSGGsGjWzdPtuRbKr33MdNia
	tG/ArmQF4WFI4ZmwDC+930oyom9TU9Kkxv935kFTTeD9LunhuSPv+lwpFN8086SGl8wqkI3LgGxc0
	Q58onm83BIQh/Iig92jd6wnbqkKO3mYgtnBhphTCuACA01KD9odBiIo/MYDSjHxijRktR43UD5d46
	6e85WrAI5q7T0WnZjVscacJJvPWvBasO/RJkeazu/ypEmgIjor49Q3ZT+fRfrm3AOkcrg5PRsRJIu
	u77QzZag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8H8-00000003hIL-16K0;
	Sun, 21 Jun 2026 02:51:10 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wb8H5-00000003hGn-1jWY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 02:51:08 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gjbS325vsz9tQr;
	Sun, 21 Jun 2026 04:50:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kSewyVdrq5Z8GYr/rDJoeSXs5aNZIEnD4cWp+G2/tF8=;
	b=TEpLUK3nfD/QD9EAX4MjZabWcP3GEACdRIm5f9F8DiaxtfAYQBIb0ILayNGLBmto/9CPQq
	eckqhADRhAkqB67MWbZPnNFL5uNC4+GHm3Y+CYXPhKb9LI2olUXeeOubyWFzDRiW6mPnSb
	uOG9i/YUha/oW8XShNIbzyLsGYmyeEA9ZpbsEaVEbaJaqD0FByLPFyaXw2SU3yDYIC4Xds
	qj1/pRE81hnobdpfRnUOUkRdClZBa0WIwSJZcWbiiIxZm5HgGBWPxRLfzNWbiy33o5ES4P
	Lvni1hL7rujd+RvWf7BhFx5N/dnmv2cwkFqaY8FbaYKE/zm4DwPIYx5E/QfrSw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782010257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kSewyVdrq5Z8GYr/rDJoeSXs5aNZIEnD4cWp+G2/tF8=;
	b=AXeibP7dFiyq6WkCd9SOkrtu1OgQFBteCICEsSfJz+00zDHmFdjgBraPKW6x0N007M/DKx
	JNeWNiSFQXwF1sj0EM9TIeTJFOM027PrDu84iHdsN/7gFm6ghrFti8nQkhRhf5GBdBNU9R
	NfFxLK8XNq297WFLR4oYxyZ+2xXFNETPe4424yF24y1U3TgELXe83pyiThop5FpgzWnymm
	fURnb5kyoBtRYzzNDoM/lzIPMyPeBUZ/6SwXUTPQOLwxyiPOB7jBrjjtjWqTEVkKSSoqXx
	cGTdsomu6RjsZPVpJ3N45SNcPGV10F5sadtoZ/hxK5TsFIvU/uXjUSVOYyXrwQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/9] arm64: dts: renesas: r8a774a1: Add soc: label to soc node
Date: Sun, 21 Jun 2026 04:50:21 +0200
Message-ID: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a9cff52d3331e015f21
X-MBO-RS-META: gkbhokzjgongtik374dd5xwnmpyrmonp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_195107_637192_3EDB19E8 
X-CRM114-Status: GOOD (  10.07  )
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

Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
which already has that soc: label. The soc: label is useful in U-Boot
where it is used in U-Boot extras DT fragments.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 36675f5bcdeaf..e66d86db6e6c4 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -262,7 +262,7 @@ scif_clk: scif {
 		clock-frequency = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
 		bootph-all;
 
-- 
2.53.0


