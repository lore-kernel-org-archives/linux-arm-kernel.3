Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391F2D3F09E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 05:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNKXP9GpRqv+eSR2XeMEVjl61X03fT0QbLuz4FZVIqk=; b=y6EdHctL6fqx+rs1yruPGY/5ZN
	vZtenGdPcM6wgjU50Y4z5vewK108Dr/o9UsH9//t/al4MIOMIF6RJdt/Mrnjz+5F/zCuppw3sm8d5
	dd5dnu4uS77fEES9sOyNZ6zE5KQZ3bCmc10t5BFm4TtfH0O0qc/F1yJV/SDgMw/xoJUH4+vggdizg
	2SY+UDwg4SjMBjS1GuxrkM65XmXg8Srxf0t5olWCZoRJT2D1BZ173tYDN7nPLimhB8awNK2Y2zkL+
	vj+1zdJkVHCKwvBamNNbLAB0BU6bKyTYbMM3wvO6o/fwiIs2v1cmd6g/fSZBMsMVEMWTReiIWjbJ1
	FzKnH1yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKpz-0000000HI4o-1604;
	Thu, 29 Jan 2026 05:45:03 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlKpx-0000000HI48-21S5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 05:45:02 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-81f47610542so319539b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 21:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769665500; x=1770270300; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNKXP9GpRqv+eSR2XeMEVjl61X03fT0QbLuz4FZVIqk=;
        b=nMqglZC6qSr/cbT9J9d0SKR65kWA1RoV+4Dcu09M5w3LgHwAFp/w3F+4hvYPR6sM1K
         zJ1Cd5ktcGbOPcsJNWIKJthujWsWPAGHSMKjoST/roOxMjYgBYPc1IyJaNARODA0B4rL
         H/z+OH2up/a6lL84C4Pn8YYbdnSYI+uypWEUtmrW+p5SlrOX7jzPYQJBUqvrxlTDUVOy
         Cv0WPqES4AdUny82zClMWhu/30ta3eaxZgLfP5HtSke2CEp040RsVMJB/LL79fcaKgjY
         D0AoCTJmzXWeFqTAhipBQcXRIVMdA7XXBbrHjmLKmggYeZ7V2ZyqnZ3WKNN6IYQ+a2gj
         EeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769665500; x=1770270300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CNKXP9GpRqv+eSR2XeMEVjl61X03fT0QbLuz4FZVIqk=;
        b=f/kJaQi3wn6s4lRBT8Wg94CzEXP0tbXH+IpcWkppdLzKOKfWGpFN1oYqMFdLKBFTkf
         B0B3cxAMDtt+4NcLHYA9iyhUWr0rYpwwc87nH5AgRr2vH2nl4iddXWHuVfAVy0yJeU5N
         ZeQJUpg6eEwc9yKS5tjeTM6wDI7w/InOS7KvM7IG/V5FYZi869jQk4KnDzVPcpAyMoN4
         UWstcBX/CcmtbO9c1Eor/yftEz6ZP4ExFCG2pKgyZqDNTgETlvzImJKgXWyB3KrU2qAx
         g+4Y4Xv8dCuEp7uq9GaTy6pZPAtou6ogbR39a+yOywgV2mBaP528CuiNF9OoF0I/WHgP
         GzoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzQ/WBUmRbUWmfkrskr0Y1wj6fZeAPTfwcGuDIfuLgPPIr9kFx1jNzaAJXm2QgVMrdNgcH37f9Xg2g3WWkTty4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy3xslrv30oBuhbn/lRRSer6Fjqxtldq+3WdP66pDAt7+/xooq
	H+j4CYIUPz6hszaUUvgjOWAe42OY+gS3O0DJKn7GV90XgOGxAbPuADIm
X-Gm-Gg: AZuq6aLKwim0b0U/pHRRTmkfoMaLeaEHRu+4+fUApYtZNFCHDtfemA2rbDWhW3SSGLo
	z46y81M91My+jJ3rnohc5Px0ZFc8q/n7ox54FKvp678B1fPysos6xKHZ+HVH3s0UCxz8gcgZg6d
	IzVoYc3CeE8rNl2AwTjxB9uTgpEuGgBedKTPWpZ8azmZcbCnJrClPQPS8OntTB52J117klrg+dU
	DTxvJeaMFhEsmRqm9TCK+1VTryeVHnH5TMWQG4C/s8Y+cnU5ezwVD4Ury+mivNnHDNn6tKA6qHq
	YDOW3fDHdQI04moWIh6unREn3c07u32xs2guL+g9FxbHLyCA508587ZZ5lZTtoZGznk0U0SLBaP
	KwbIvZzkCZcd+QSrKlSppGjL0+vi3SnEV+nQDMxDziatk7VrK72FilM7nTN78QNb0DzKHb3YzBw
	Yx6qJOAOes46r6ATFHtWt8dLKq1VKeyOBY72HtwodrAhm9MSKiPfkAyRHVbkbBsGzkNGbFcg/S
X-Received: by 2002:a05:6a00:4b05:b0:81b:ab6f:2974 with SMTP id d2e1a72fcca58-8236914c661mr6509292b3a.9.1769665500190;
        Wed, 28 Jan 2026 21:45:00 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c227c2sm4108364b3a.53.2026.01.28.21.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 21:44:59 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v10 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Thu, 29 Jan 2026 13:44:44 +0800
Message-ID: <20260129054445.416242-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129054445.416242-1-a0987203069@gmail.com>
References: <20260129054445.416242-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_214501_529380_215FC484 
X-CRM114-Status: UNSURE (   9.53  )
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

Add GMAC nodes for our MA35D1 development boards:
two RGMII interfaces for SOM board, and one RGMII
and one RMII interface for IoT board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 25 +++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 24 ++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 44 +++++++++++++++++++
 3 files changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..78534d613486 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial13 = &uart13;
 		serial14 = &uart14;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -126,3 +128,26 @@ &uart14 {
 	pinctrl-0 = <&pinctrl_uart14>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+	phy-handle = <&eth_phy0>;
+};
+
+&mdio0 {
+	eth_phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&gmac1 {
+	status = "okay";
+	phy-mode = "rmii";
+	phy-handle = <&eth_phy1>;
+};
+
+&mdio1 {
+	eth_phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..a029b660e8dc 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial14 = &uart14;
 		serial16 = &uart16;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -129,3 +131,25 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+	phy-handle = <&eth_phy0>;
+};
+
+&mdio0 {
+	eth_phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&gmac1 {
+	status = "okay";
+	phy-handle = <&eth_phy1>;
+};
+
+&mdio1 {
+	eth_phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..a39c3640b322 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,49 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		gmac0: ethernet@40120000 {
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = <0x0 0x40120000 0x0 0x10000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 0>;
+			resets = <&sys MA35D1_RESET_GMAC0>;
+			reset-names = "stmmaceth";
+
+			phy-mode = "rgmii-id";
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		gmac1: ethernet@40130000 {
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = <0x0 0x40130000 0x0 0x10000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 1>;
+			resets = <&sys MA35D1_RESET_GMAC1>;
+			reset-names = "stmmaceth";
+
+			phy-mode = "rgmii-id";
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
 	};
 };
-- 
2.43.0


