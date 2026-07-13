Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44420C44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XGD1udeeLySjuRpVfJ/v+jq6I8kxIY1T8PFHbdXiRnU=; b=wEb0MTCcZH6smlpiKoiNJEanix
	nqMOYrh1K71amHR/epQ9BW8q2oCId0wipFOT+3waG6nSfr4QqOQtiNBiqJvuO08S4jXQZIYn00Gd6
	NCz2sRLPgrPrJi+8WXT0JGwiJjQqNalUuCfanuqnv6hSauETTFl4XLh3uPg8av6RnwZE+lQJvWNQ1
	1QmMWUox4SUmFMA8Z36ADfOPYlZb9+VuLLG4vf0ibk+9M13xKzFPR0CmvvNP0TxFFZFSsJiSB8BhJ
	/bXG4UVxkqsWEfUu4/+EPjB+LenNVUzK74Mey9CVcwEbaIfzrJOAoYRtSBNaar7x4hjgUp8uZBNHL
	DjGYlQ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI4W-00000009foo-1vzE;
	Mon, 13 Jul 2026 14:55:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjI47-00000009fTd-28D3
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 14:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XGD1udeeLySjuRpVfJ/v+jq6I8kxIY1T8PFHbdXiRnU=; b=mvYDWaCIeGBfbzwfDOD3g0Kmnu
	VSzecYjE3Z4I3cN/xZzE1PAIYmtUsNTJUIGQvKOdl+XRxb05tjD0EMl52OugOwvpWF+5tWFE7hfiG
	lgP1IQhObi0RsS39IrtgClqCUDeL/VvK0kI7U7j+4GoCJ0UtLUSFZTNsT/olRpmKRfCNMUcJtAQPP
	Fm1Lce81zO5RprHI1kBlSEAkwtq82nztq6YR6MqXP2To6e5o7kUI4KcDAdjzVQXMmAmE7sBfsFHc3
	YtCslzFFqAU+Q2+tsyeyOQC+Irday4E6o/4/oTC3taMTPgwbJ+iVK5uYVe+yP1DJyEa2R74kec9Jx
	S+F97Tjw==;
Received: from mail.fris.de ([116.203.77.234])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjI43-0000000Bjux-01Kh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 14:55:26 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1783954518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XGD1udeeLySjuRpVfJ/v+jq6I8kxIY1T8PFHbdXiRnU=;
	b=lZfY5KeEKoMKm+cYODOfvY2ifUEkYid7GRvxHJt8VMnmANsd8L27AlIRcLYCa66khtCUkh
	qoSMi0XjGoclkdRXu5NM58jUAvsd8PNym7gipxzS4QFnlYv8lRWwCB1T1pNvGQBRJHG8Qo
	VGaTrUNILWoL8Op4Yh6dLChWMPnyOT7G1HRXqnEzYdl5HEIqRB44r2vORB9OQzKzc/Sfyf
	EagMfr7qJqLnZDytLyeG+Gu4CmwEe6hD7dVOydZKZHteeZ7+VIa7+sgvS1lVEhhp9XdIu4
	hnMCfViPxC6TYpY/Iit8QQtjsj3jDCooyGoYsC++ViDBG8N31kAa+zLZnFMRBQ==
Date: Mon, 13 Jul 2026 16:53:46 +0200
Subject: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-10-b8266d93514b@kontron.de>
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
In-Reply-To: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Pankaj Gupta <pankaj.gupta@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=d5GCeuaUDxb0XmrK6obvF5ioCBnvWAlVOzfPbhm5HFo=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JISvkT9Ajp7zzUUenF6/ckPFzrpxm0sacdbNbMha/f+3+N
 Eus2sOko5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCLxXxj+Ck09FZlUyq+Zry7d
 fM1s3ku5CgalLo+oSgbdaItflcGXGRm2TGnfcsf8qfqFEOUcK19Tc3fF0J9GG++GN8ulqJ1tsOU
 DAA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_155523_245604_921CA899 
X-CRM114-Status: UNSURE (   8.88  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Add the ELE firmware API node and pass its handle to the OCOTP
driver. This allows us to gain read/write access to the OTP fuses.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index c79b1df339db..c1da4b52c878 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -24,6 +24,15 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	firmware {
+		hsm0: secure-enclave {
+			compatible = "fsl,imx93-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			memory-region = <&ele_memory>;
+		};
+	};
+
 	reg_usdhc2_vcc: regulator-usdhc2-vcc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -57,6 +66,19 @@ regulator-state-disk {
 			regulator-off-in-suspend;
 		};
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_memory: ele-memory {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x40000000>;
+			size = <0 0x100000>;
+			no-map;
+		};
+	};
 };
 
 &flexcan1 { /* OSM-S CAN_A */
@@ -253,6 +275,10 @@ &lpuart7 { /* OSM-S UART_A */
 	pinctrl-0 = <&pinctrl_lpuart7>;
 };
 
+&ocotp {
+	secure-enclave = <&hsm0>;
+};
+
 &tpm3 { /* OSM-S PWM_0 */
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_tpm3>;

-- 
2.55.0


