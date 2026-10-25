Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94575606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 20:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kqJj3sdU;
	dkim=pass (4096-bit key, unprotected) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=ph6/xYnr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=v5wUyzr+DyPRm9u7hQz3ABD0SUSnHt3iQOyUP/pLhMk=; b=kqJj3sdUSos8sORnf+gx3Debdo
	ivUTsm7QFCYQ3RqdA45KAVjFwtzxzxp/bDCIZLuMx5vu712oPsmEU9xXnkQ8rOQLdHGAaifPWsdEt
	rG7pdq2qbLnjZtlEznM4+SJcat6tRsPrdCLiNLWTHhVw5waZJ20lgd8kH4BCjeEofgRvIEwQc6z8x
	C2HdOZJL9pCg9aGvlNpOqlyepMFjOsapA9eWiO8ZhsIH4nj6VHhkHX+gRZd26I2DJZV3aVGHhrcvn
	C6c6kCs7kLq8q4np1I2CS0bzaX22TnNeWtcDL2wk5iJmztBdsf3t3KcsTq7iA9BcNmBD8ZvbjqrGs
	HjKq7iSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL5EU-00000001Res-1U9p;
	Sun, 25 Oct 2026 20:54:22 +0000
Received: from mailgate01.uberspace.is ([95.143.172.20])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL5ER-00000001Rdz-4By5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 20:54:21 +0000
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 13B9461070
	for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 21:54:09 +0100 (CET)
Received: (qmail 25742 invoked by uid 990); 25 Oct 2026 20:54:08 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Sun, 25 Oct 2026 21:54:08 +0100
From: Leonard Lausen <leonard@lausen.nl>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Leonard Lausen <leonard@lausen.nl>
Subject: [PATCH] arm64: dts: rockchip: Enable Wi-Fi on the NanoPi M5
Date: Sun, 25 Oct 2026 20:52:48 +0000
Message-ID: <20261025205339.14539-2-leonard@lausen.nl>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.999799) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.099799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=vZp7WOiFDniDGGPVB44BCfmjNLNKpcugqLlTg39BwmY=;
	b=ph6/xYnrrUxOCAl6qoRBXpbH0JRaj0GL9p69gDqEDI9uZ2+N1Pk/Qp5rXwxKv75BLb+K+wUfHc
	ttxdkc4ak71hq6vAdf1xp2R5T08BgrX0glv4CeV2jb0t2f1lm0I/4fmvP02wSc+OUdkucDW0gA6H
	HeopSLDqOk+IAHX1IOT6ODedzzQ4dc3sjSIWHAjIbsgeoewnx41tbkTAICtBp2kNXM9zxBad2wxT
	WV9Yvbpji2KSfrWcug4sTc65mEMra8Q7IunNLTpGfZ5UERBkqA05eGOYN6IPp3V16DFzc1x7uUtU
	aknRUf8TkdpoowDJgmysVGbkJBIpKRCtFF7n8FHdRK7bg/tMKRa8wysHhJGRxKvLDo5cOYbwvXQM
	kQUbewTE4MwAgvHSV2IVgfuhUAr5iOtq6T3TxJKAka1zVxb+sYkfaBhKbxL0yO43CNbkMk3vj6Kb
	HAOnPJNwHwUjKTSoaHr2nhrNhoebOp2YQE1631GDhGgR96vLPLYlzEBPd0m6WB8pfcSQpWkxjUvf
	duJcssmbBWWECTPTKSLqXikRAq02ksLD3LxW5eVbQmSTvJAqxY54rFBOXTGXzuMIYyh54sXk1owu
	3Bz07OAOrwyK9ldMTmLyrCnmFB8XxbNkfsay/z6O4mxqN1P/SBifh5BVBPJU55SjjtEhobB1EtvB
	k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_135420_205517_FB5DA7E0 
X-CRM114-Status: GOOD (  10.78  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The NanoPi M5 has an M.2 E-key slot for SDIO Wi-Fi modules such as the
RTL8822CS-based AC200. The SDIO controller is disabled and the module's
power sequence is not described, preventing the card from enumerating.

Enable the controller in four-bit SDR104 mode and connect its 3.3 V card
and 1.8 V I/O supplies. Describe the active-low reset on GPIO1_C2, the
200 ms power-on delay used by the vendor device tree, and the external
32.768 kHz clock from the HYM8563 RTC. Keep the card powered during
suspend as required by the rtw88 SDIO driver.

Signed-off-by: Leonard Lausen <leonard@lausen.nl>
---
 .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
index 3a305408fa16c..bfa18de1ae1af 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
@@ -23,6 +23,7 @@ aliases {
 		ethernet0 = &gmac0;
 		ethernet1 = &gmac1;
 		mmc0 = &sdmmc;
+		mmc1 = &sdio;
 	};
 
 	chosen {
@@ -212,6 +213,16 @@ vcc_3v3_s0: regulator-vcc-3v3-s0 {
 		vin-supply = <&vcc_3v3_s3>;
 	};
 
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		clocks = <&hym8563>;
+		clock-names = "ext_clock";
+		pinctrl-0 = <&wifi_reg_on_h>;
+		pinctrl-names = "default";
+		post-power-on-delay-ms = <200>;
+		reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		pinctrl-names = "default";
@@ -855,6 +866,12 @@ pcie0_perstn: pcie0-perstn {
 		};
 	};
 
+	sdio-pwrseq {
+		wifi_reg_on_h: wifi-reg-on-h {
+			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	sdmmc {
 		sdmmc0_pwren_h: sdmmc0-pwren-h {
 			rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO &pcfg_pull_up>;
@@ -890,6 +907,23 @@ &saradc {
 	status = "okay";
 };
 
+&sdio {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	no-mmc;
+	no-sd;
+	non-removable;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vcc_1v8_s3>;
+
+	status = "okay";
+};
+
 &sdmmc {
 	bus-width = <4>;
 	cap-sd-highspeed;
-- 
2.47.3


