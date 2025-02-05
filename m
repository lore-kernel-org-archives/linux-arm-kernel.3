Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A577FC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 18:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91ShiD7uo+IWo9yqW8YxhlAmABdbZ6uPN62jmpFDzqo=; b=yUPX5SnLZxzqXi2WVKRnVr1qSI
	CKdFoGHmV3wSsbBwmAmHcfm73nced9WT9dJhgG6/VpT7v2cpawdKpqHiVyMDMgnPMMKB0Es+1rvno
	2apI37BTLTLgqo5B5f8qeU5UnVc2S+iTMn7t1QCjjLh3gBxhgcGuNXI0KM+kyarlikYdrcdPAwac2
	l6kRVDP3PXCMrJk67wvfrB0TuoIAuVodYT4vLV4sZDMpYPYSPXkqShA9IMUvDPZATkzj0ihaJpbVn
	ojDxJ8mWAjMh8tkLX54uX1lE3TAPXnAbOYkGbNnPpfxTqsZqQYcJtDLoqFetofzPazMgaavzRsRoR
	26jy6B8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjja-00000004BgR-1bLo;
	Wed, 05 Feb 2025 18:02:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiZz-000000040vm-0mnS
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Feb 2025 16:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=91ShiD7uo+IWo9yqW8YxhlAmABdbZ6uPN62jmpFDzqo=; b=A4IkzRFr86rVAXt6vRNqyvd7kh
	cpMM1fKQMTVoUD29MzfFJWTQVBWn+kKSxdA6ac/kiWxMJ540zuH299X8Vu3R/pYGyCDl3OKttViKw
	o8FoAZeltaGPiAVgBuyHOHOu4FCYAk1VAkiL99v898Ssvu6vNNsLZRMCkBSLcZKp1zzTDRi8u9JDT
	9q2PH75VgtFV5gUYQ7D8BsSXK+zkZOOWlRFnDOZ4w7eimb1wfgptyDMubKjq0U7Zg5yNEXaPFIiYP
	AR7eTUxK0nZxwuCMT1H2p3+/VLUE1/uTn3sdWl8Yqm7faIAJu5o0r5HnB6cmGntrvxUtcJTHQ3s/q
	cYI0w6tA==;
Received: from mail.netcube.li ([173.249.15.149])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiZw-0000000GiKI-1XIh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 16:48:46 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=91ShiD7uo+IWo9yqW8YxhlAmABdbZ6uPN62jmpFDzqo=;
	b=VpX4hX8S6P57g9El7v9PI0IvxjRam6zKyHmQ5dssIYuS2hEb992vQJoYyn4vVZTkqr2mMq10N8czZdlJAyGZ/KdcdEx/JV611JGcVTZiIJH884GyZ74HEuEqjNw9YUCIOkMWZKHJ1AXeGNQKIpOyXiN7OA8X+vdpbs3q1WE2fbY=
Received: from lukas-hpz440workstation.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Wed, 5 Feb 2025 17:48:12 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/4] ARM: dts: sunxi: add uart1_pe pinctrl for sun8i-v3s
Date: Wed,  5 Feb 2025 17:47:12 +0100
Message-Id: <20250205164716.2509650-4-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205164716.2509650-1-lukas.schmid@netcube.li>
References: <20250205164716.2509650-1-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_164844_524000_D85335F8 
X-CRM114-Status: UNSURE (   9.24  )
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

Added the uart1_pe_pins pinctrl for use by the NetCube Systems Kumquat
board

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index 9e13c2aa8911..f909b1d4dbca 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -416,6 +416,12 @@ uart0_pb_pins: uart0-pb-pins {
 				function = "uart0";
 			};
 
+			/omit-if-no-ref/
+			uart1_pe_pins: uart1-pe-pins {
+				pins = "PE21", "PE22";
+				function = "uart1";
+			};
+
 			uart2_pins: uart2-pins {
 				pins = "PB0", "PB1";
 				function = "uart2";
-- 
2.39.5



