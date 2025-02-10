Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F78C021A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 00:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4Sl4j7z0914oZOToKd009OuMMVWZTH/qa7XeAPVimQ=; b=AmmAuyTODImWvF+alM/D2aOG0C
	P1fkCRZm7iibvnhGLqYUd6dbK33FV7lUlYXL30zd8pFtm9wfH2flla9/oGsvuIyN71ChjkWSpIkMA
	M7LOxFptLeFZH/Xfalt1BEzHLY4swzJ+mIF+BqTvXnjokmT4ZXwF0uWvp77r6NmdXochmgbmXZdVY
	hyoZnP1sChP7OORJm1Nk0TRja9qHKHdYakXeiVnbXtwPokyTBvGyA5IK7gJ7EtaKE8KsiTT097rpr
	/QVXmqrpZRHsh4BVwGrbBvSf8cBo7nhjX+gxEEN39VcNSBD8FgQPm6roIJiU4BLooNW2sVHw6MUYM
	VpwqkRBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thdra-00000001w3e-07nr;
	Tue, 11 Feb 2025 00:10:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcRX-00000001gtg-3W6G;
	Mon, 10 Feb 2025 22:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=q4Sl4j7z0914oZOToKd009OuMMVWZTH/qa7XeAPVimQ=; b=kvS9DqP0zmqax3SyP00Sw9GS2I
	Uo92gP0M8UPaXdSmzgrjGYHXuHLC7a7E22ruRMd4I3dNFyLRg09s9ftUfW0lDHTjmT/ktg4kmNpx/
	emplAT2M8ajyOp/GopbDtr6sWPYg1BOhsLjPTGShkdOlN5WP5ncNz3ZrAs7xD2RvGOLPmfCb0BOYg
	UXhekBo46Y+DG8hCkL4YPqX65yZ6qTb/rD9Vcr09W2nKEqbI8mjWaacEymLr9jVaN8fL19jmpkP67
	Wg1i2gOhxExEUZM6m4wNr8lpW3ItlgTbsOkWZ+mmtuTN9LMJgIQPaRJ7+yk9jSjYWK4qzHUwE1y8w
	OJc47Lzw==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcRS-00000000Kaq-37Ax;
	Mon, 10 Feb 2025 22:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=q4Sl4j7z0914oZOToKd009OuMMVWZTH/qa7XeAPVimQ=; b=vz9QGDTtxm2pH7WNpUnco3aKFP
	45VuVhIFJxmM0zxWcaqz4tKnYriuvIPUDywQhhgA0NnMnq7m4oceeOlA7DDh7CK3hVLoyfpSvjbaN
	h2a2sneibS79NieSwNjnn2WvL4uGzdDKARkCGauHTNWwVXnS/Lj+JrLnQ2gORBcPLXbQl/qoLV9xK
	c/ymuiEIaan5fgFoPD9OTjCvNn074oBaZgdpatcjEpIvA5o2VgF9JizZl5EnTeaFrmhY9Z+b/YAJC
	K/ywni3cBV8CQYjPVl8q7hd74Z8+eGxhSuXvYgTsqMN6sW+IKIlZo2uTO5tTa93yUdtbyT1db2tw3
	whJ8sCrg==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1thcKe-0008Cw-Ei; Mon, 10 Feb 2025 23:32:48 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	detlev.casanova@collabora.com,
	sebastian.reichel@collabora.com
Subject: [PATCH v2 6/6] arm64: dts: rockchip: add rk3576 otp node
Date: Mon, 10 Feb 2025 23:32:19 +0100
Message-ID: <20250210223219.1193346-14-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210223219.1193346-1-heiko@sntech.de>
References: <20250210223219.1193346-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_223950_987481_B5ABBD5C 
X-CRM114-Status: GOOD (  10.89  )
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

This adds the otp node to the rk3576 soc devicetree including the
individual fields we know about.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3576.dtsi | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
index 4dde954043ef..29b47799849a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
@@ -1260,6 +1260,45 @@ sdhci: mmc@2a330000 {
 			status = "disabled";
 		};
 
+		otp: otp@2a580000 {
+			compatible = "rockchip,rk3576-otp";
+			reg = <0x0 0x2a580000 0x0 0x400>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cru CLK_OTPC_NS>, <&cru PCLK_OTPC_NS>,
+				 <&cru CLK_OTP_PHY_G>;
+			clock-names = "otp", "apb_pclk", "phy";
+			resets = <&cru SRST_OTPC_NS>, <&cru SRST_P_OTPC_NS>;
+			reset-names = "otp", "apb";
+
+			/* Data cells */
+			cpu_code: cpu-code@2 {
+				reg = <0x02 0x2>;
+			};
+			otp_cpu_version: cpu-version@5 {
+				reg = <0x05 0x1>;
+				bits = <3 3>;
+			};
+			otp_id: id@a {
+				reg = <0x0a 0x10>;
+			};
+			cpub_leakage: cpub-leakage@1e {
+				reg = <0x1e 0x1>;
+			};
+			cpul_leakage: cpul-leakage@1f {
+				reg = <0x1f 0x1>;
+			};
+			npu_leakage: npu-leakage@20 {
+				reg = <0x20 0x1>;
+			};
+			gpu_leakage: gpu-leakage@21 {
+				reg = <0x21 0x1>;
+			};
+			log_leakage: log-leakage@22 {
+				reg = <0x22 0x1>;
+			};
+		};
+
 		gic: interrupt-controller@2a701000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0x2a701000 0 0x10000>,
-- 
2.47.2


