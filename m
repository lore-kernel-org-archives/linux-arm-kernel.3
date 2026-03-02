Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4A9EA4E27
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oa/3u/2QbS2B349jK9M2HGL5BJUxCXegVotlwQUex+8=; b=qQBo/eZDzrAg7bAN2O3tn31tvy
	LPR5cxbLuNMZLABwtgnkcJNah3FF3ZOZGDpUmveAqwSmprxVRiIyTw69HqmJV1wxJT7EaxlRfT4x+
	y18eDEkZSrdgyawYLlwKUPIJAy6VoXT9RfmzySLs7q9YKHfSk6i12BVF1q7d2ym8G0maSDcYc5KVj
	SusLpA/JPZsdDkMwlw5omgE8it6w+1Shw0bygIrNfdAkTNIGjqkt2H4eLR3c0FPAI9uMXEwo6R5oU
	ERgq5NrC6mZePw11jK0BNKC+p2T/y/YbrAJRNHMnHK7hYr2nRGrq8qkpYD9PuRHQ4I31ybyQgjBPH
	yX29hM5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5Ja-0000000DNMI-1bkb;
	Mon, 02 Mar 2026 15:36:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5JY-0000000DNKQ-386N
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 15:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=oa/3u/2QbS2B349jK9M2HGL5BJUxCXegVotlwQUex+8=; b=KZomgF4ayvRa4ZpIH/dr3qq5Ku
	onCeTPLHOwdNc0DnN/U/JeeoDdjOZG1WzdLxhw9oEMjT7bf7herckRLVB4YsA/MycIL7QoIJpZpGW
	Qbdl1BOz0Gizq8SpLhHerZnW4E9GqowS2C7pA9paZSFBF6ykHKjPK65F5CsnMYhngBkUbRfPfqZuT
	JyFy2l1wIlh2+bUSD9v5ptiLZFkRbxMcsEASDOSwJAavpX2OZmWimJ1c38aGF7PELVDSZJBQI143v
	/1jb0o5I/GRm1m7dDptHdDBGeZxd2/atV6quNGWGVkbMgtAuJjQ4ePyW49neL4oQafrtdclEddKNb
	hKSYJtyQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5JV-00000000SRu-47Yt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:36:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 906FC43FD9;
	Mon,  2 Mar 2026 15:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3EAC4AF0D;
	Mon,  2 Mar 2026 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772465764;
	bh=z/p2kAng0Y5oRilaQCks0dh5WQLuleduc50nf40KO6Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YHiUS7wSLoHxSX4GSlEChP6haEzq9nrYlDDDbes9RRgMy5jutsaPJtocJ6m+CWOo5
	 S7L3lvsxEvz/ViMWRTKOIhA9gh9Uj5r4SIeYGlT+mx9iNYHH6t7qY5D5Y6SAWtaa2v
	 05NdAK/svFGTUNNMuESEwtVmC3kLJ5P6W/RuL+uah8Jfw3O3YH30idKxOJZjmXUqU9
	 cXE4IJlOUGXHL/o9VnFQIeTWe09k8peXTPiF2bO+IAyexKh98WHNTfqF9S+iCIJY1R
	 GOaAB//+NGnpu3qFl9EoPILdYCMsk3E17vCVlHdrXvB0naQMwK0STkUvwHt7GbMv+s
	 D14RAcLsZTX9A==
Received: by wens.tw (Postfix, from userid 1000)
	id 320EB60003; Mon, 02 Mar 2026 23:36:02 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: sun55i-t527: avaota-a1: Add SPI NAND
Date: Mon,  2 Mar 2026 23:35:58 +0800
Message-ID: <20260302153559.3199783-4-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302153559.3199783-1-wens@kernel.org>
References: <20260302153559.3199783-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_153606_198643_2208785E 
X-CRM114-Status: GOOD (  10.81  )
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

The Avaota A1 board has a SPI NAND chip connected to spi0 on the PJ
pins with support for QSPI.

Enable spi0 and add a device node for the SPI NAND chip.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts  | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
index 7c24121de88f..474354fbfcec 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts
@@ -403,6 +403,21 @@ &rtc {
 	assigned-clock-rates = <32768>;
 };
 
+&spi0  {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pj_pins>, <&spi0_cs0_pj_pin>,
+		    <&spi0_hold_pj_pin>, <&spi0_wp_pj_pin>;
+	status = "okay";
+
+	nand@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.47.3


