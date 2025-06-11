Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F1D8C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 20:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vC1OKgEBJoRW7BFW+L4Zt1ElSjkPpnAUqp4+kNf6zo8=; b=o0OE4hPLkRqEN+Qb9gmdK0ZQ2p
	rE9rWgaPecv+fcAFSUjVBZpWLcz66TzkbHTUJZcTqQlgJ+WqrpDEXds8Fsn3YMLRQQ1X+VgbLO6Hd
	UzS+Oi3g+J2fIY9BTgP7q5uFiblyXiBsTwG7y/Wcp5LUMhBSAus9mZwrLKjdK0aM3PafUUYc1Wkjg
	GcYdskCo6onisDzLt6SpgJHjuZFH9vKB6ZJ4/0l9sy5jyMwHiBCqNj5udo7OA1NB0fcslbpPEbWbP
	BFe1FOA0r23mX/GgD/9P90XrJpQyI/4sRWLDILKi3WXkeBVdSlRyY7oNO0Bl8QohbBi81rZj0RjoA
	D6c9407Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRrS-0000000B8mZ-2BTd;
	Wed, 11 Jun 2025 20:15:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPP6o-0000000AhSJ-0SBM;
	Wed, 11 Jun 2025 17:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=vC1OKgEBJoRW7BFW+L4Zt1ElSjkPpnAUqp4+kNf6zo8=; b=HvX85PM15z6YFkheNy4GKh8dtd
	uU9QLVF7bLJM4Y/hQbvD/iEBGEb1vF0yidImNH2mMXfT02YEHeaHWzUJNZXudyo0ga5e7d+08eeCW
	Die6D1RjDy5piSZRXsmx5aZf6MeTIGF1qLmea3VzS2B45Ene8vnC3595M3vdSId+QsCcXbJPsm2Cu
	83RgUq+5sBwvWsqxtXbsQf4lFyUmT0ygPi8Qfor3z305FIMiSGSsLYhqnJytRXdO+bZpXEYCHTbrC
	/iAZE5sBDkGfQi6Bo/Iudea9mMnwX6z0LyeVzhQiknci5hQz2fbRWYjh8+P/M5JIi1LfAbfBxtfsh
	CCQad8qQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPP6i-00000002Sdn-3ItI;
	Wed, 11 Jun 2025 17:19:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A9234A98C;
	Wed, 11 Jun 2025 17:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79FCDC4AF11;
	Wed, 11 Jun 2025 17:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749662357;
	bh=5BRFtk/5jIDcMryMPGQHwW1SEx1AjjpWVEcTh5JdPRs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kHEhbUTbWHTXgzS4y41F+NU0MWhImYmITpERxoZeXWPw7X9P7+9UVSGxNL3KOvf32
	 nGUIKSSEKjyhaXRVtT61ty25FbysRDjS0ky4Sv7dM73bs9/GzIvplb/4yzjRBkTeAs
	 v2+b7EU6TrYx0Hw7rasm9gEEdkto6ya8Nbl7i29SrVtw7Bh57BvUhoDvwHMxDxdw7W
	 tE3aKZjojxSlNtOK5Csld1ZtaZMzlO0UJ5GNZ3P+2vePoTKBAJStUTYAhsdEdWSYwR
	 j9De8JEsMBL5f/CBcVWmxrbU1xYUFdGVo/i7mdJ4F7X9lrGa5emgwlMSh6dgbFSBHm
	 bZ+N9QsYtwWJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF95C71136;
	Wed, 11 Jun 2025 17:19:17 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 11 Jun 2025 19:06:55 +0200
Subject: [PATCH v8 10/13] arm64: dts: rockchip: add the vip node to px30
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v8-10-9d9cbc4b524d@collabora.com>
References: <20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mehdi Djait <mehdi.djait@bootlin.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749661609; l=1272;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=bPZJ1Uc+vxwNAO8V6hB3CEnLbtHLJAdH+/IeDgKwqBQ=;
 b=1oJE74w7wfWv8TIbKq5jSGURt1mmmZ8CapD2dPoKC1xG1eaMTmCyTkt8NeIIPUsnY2SyZO0A1
 L6Y7XCGsKiGB/8um7QRNs0gWw2KNlc27DZW2lVj/QRTI6hzw2XhOXPN
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_181925_247360_E470E28A 
X-CRM114-Status: UNSURE (   9.99  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Mehdi Djait <mehdi.djait@bootlin.com>

Add the device tree node for the PX30 Video Input Processor (VIP).

Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
[added cosmetic changes]
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index feabdadfa440..7b890620a6a0 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -1288,6 +1288,18 @@ isp_mmu: iommu@ff4a8000 {
 		#iommu-cells = <0>;
 	};
 
+	cif: video-capture@ff490000 {
+		compatible = "rockchip,px30-vip";
+		reg = <0x0 0xff490000 0x0 0x200>;
+		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru ACLK_CIF>, <&cru HCLK_CIF>, <&cru PCLK_CIF>;
+		clock-names = "aclk", "hclk", "pclk";
+		power-domains = <&power PX30_PD_VI>;
+		resets = <&cru SRST_CIF_A>, <&cru SRST_CIF_H>, <&cru SRST_CIF_PCLKIN>;
+		reset-names = "axi", "ahb", "pclkin";
+		status = "disabled";
+	};
+
 	qos_gmac: qos@ff518000 {
 		compatible = "rockchip,px30-qos", "syscon";
 		reg = <0x0 0xff518000 0x0 0x20>;

-- 
2.39.5



