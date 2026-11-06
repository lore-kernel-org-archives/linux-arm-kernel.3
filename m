Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B64E606D80D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KaVa/Y7s;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=WDiuIdwm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pPs+LFjQd4/vwzx0cx5k8n7Xns8+xDNlOq6HRQ/nnB8=; b=KaVa/Y7skzF6fq
	0Sm4b52iO6zC9aTKbEdsR6E+WrmxdeU5DJBOE9N8EfN96Lj9jNSCLkiYgoPK7WHK5RUf9T8XaEbmR
	rVFwJLLlW15HByRwZmv2KveqzsJn+TSTyG+GoOfQycUuL9tZwohabXpuF5zYuR5XX+XReXfmNHhuN
	6q9MD9+bK9HW6T8/ru//beH4uIQyOtNZvgcuQ4q7cqQeIVf57T4is/qdJ1xxCPBWibc5PdiCwY4Rh
	1NJgP5h1X2pnyVMlI1/aX/gNz38tdoP61fwIt2vpC3RplmmZhrlSfCMWPs/rNZKAz3WFhqNTBkkN+
	9nOcRlQeg/yCVuYcoNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTm-0000000C0bJ-0l8F;
	Fri, 06 Nov 2026 10:47:30 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHTc-0000000C0D3-0Fxj;
	Fri, 06 Nov 2026 10:47:24 +0000
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07O1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:13 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07O1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962034;
	bh=pPs+LFjQd4/vwzx0cx5k8n7Xns8+xDNlOq6HRQ/nnB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WDiuIdwm8UFous+4e6je7OsE/8ufj1XtOgyvdnUxhllJALqtuVpEksTgZHay5aGN2
	 OSUw31Y4Evz4a9e98UBjvLW2OBd38tJ2O2r6cA+qKRwc50nhkulAKp0Gczk+44weBF
	 7rfLXx9GIzn+uaIW0S+fA31LeNfKiUyl4zfxnncc=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 09/10] arm64: dts: amlogic: meson-s4: add the AO CEC controller
Date: Fri,  6 Nov 2026 11:46:58 +0100
Message-ID: <20261106104659.54656-10-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_024720_390893_A06795C6 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Add the AO_CEC_A controller and its pin group.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 155997649dc3..dd51e786d29d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -747,6 +747,14 @@ mux {
 					};
 				};
 
+				ao_cec_a_pins: ao-cec-a {
+					mux {
+						groups = "ao_cec_a";
+						function = "ao_cec_a";
+						bias-disable;
+					};
+				};
+
 			};
 
 			gpio_intc: interrupt-controller@4080 {
@@ -970,6 +978,22 @@ sec_ao: ao-secure@10220 {
 				amlogic,has-chip-id;
 			};
 
+			cec_a: cec@44000 {
+				compatible = "amlogic,meson-gx-ao-cec";
+				reg = <0x0 0x44000 0x0 0x14>;
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clkc_periphs CLKID_CECA_32K_CLKOUT>;
+				clock-names = "core";
+				assigned-clocks = <&clkc_periphs CLKID_CECA_32K_DIV>,
+						  <&clkc_periphs CLKID_CECA_32K_SEL_PRE>,
+						  <&clkc_periphs CLKID_CECA_32K_SEL>;
+				assigned-clock-parents = <0>,
+							 <&clkc_periphs CLKID_CECA_32K_DIV>,
+							 <&clkc_periphs CLKID_CECA_32K_SEL_PRE>;
+				assigned-clock-rates = <32768>, <0>, <0>;
+				status = "disabled";
+			};
+
 			ir: ir@84040 {
 				compatible = "amlogic,meson-s4-ir";
 				reg = <0x0 0x84040 0x0 0x30>;
-- 
2.56.0


