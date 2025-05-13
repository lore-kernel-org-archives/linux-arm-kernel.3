Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31937C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 22:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39lmcsKNJPXEA7+bGUZpLxZ0LoiPG+o0H7csu9OoDfk=; b=VfQdv5vR4iubhbXyOObosb1lxb
	x+mgeme2LKNdLAd8FdsFQkVLN1sV49+vGNq5hFPGhKU6vI/hH8W0Eki1iohRlgavD9mOd4aU9M62f
	IzDwTA9lVjbO4M6cY8slJxzrVZz1zWLQnrv1bToWCGXZ+FfwntMskqVbGiuTIJYoG3Y2VgArIIGaV
	lledZ4nSYXXm8RpUZzYKE8P2uHIf1WzuZWS3DWPQO7n0Y2DMdD6+cmkyn88MtfT7KffSEoEKrR2ta
	AIsitWWpIkDEab18pWHnwVe82PBzLNfIKYoov3qx0ih9KK74IN321i4T4NdvaD3VtZUA6KAwDjIry
	V0fzdKqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExnS-0000000DdKe-0qRv;
	Tue, 13 May 2025 22:08:22 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uExf9-0000000DcOn-0Jf2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 21:59:48 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54DLxa6P2965927;
	Tue, 13 May 2025 16:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747173576;
	bh=39lmcsKNJPXEA7+bGUZpLxZ0LoiPG+o0H7csu9OoDfk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nYtAph87BWKzTCTR45M7HmYjRXK7Fcu4RzAjf/3lYKHEPvrTZTFhb4U+8ti+WhEmx
	 vNKKbdRgSEohZoQBYBIrQXzwTEXI4DBv4N+UvP7hHWn94aP/THV8eMIrdXA+tdWL7q
	 elw22JHpp8SkcpbopVbtJr2DiOeOg4AqnBGKi9qw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54DLxZhQ1005886
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 13 May 2025 16:59:35 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 16:59:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 16:59:35 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54DLxYdF111031;
	Tue, 13 May 2025 16:59:34 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Santosh
 Shilimkar <ssantosh@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Bin Liu <b-liu@ti.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>,
        Andrew Davis <afd@ti.com>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 4/7] DONOTMERGE: arm64: dts: ti: k3-am64-main: Add PRU UART nodes
Date: Tue, 13 May 2025 16:59:31 -0500
Message-ID: <20250513215934.933807-5-jm@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513215934.933807-1-jm@ti.com>
References: <20250513215934.933807-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_145947_210347_D4A6ECCE 
X-CRM114-Status: UNSURE (   9.75  )
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

There is one PRU UART module in each PRU_ICSSG for am64 SoC.

Add a PRU UART child node in each ICSSG node in am64 main voltage
domain .dtsi file for am64x device.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
index c7e5da37486a..5ba7b8a8dbcf 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
@@ -1280,6 +1280,15 @@ icssg0_iepclk_mux: iepclk-mux@30 {
 			};
 		};
 
+		icssg0_uart: serial@28000 {
+			compatible = "ti,pruss-uart";
+			reg = <0x28000 0x40>;
+			clocks = <&k3_clks 81 19>;
+			interrupt-parent = <&icssg0_intc>;
+			interrupts = <6 7 7>;
+			status = "disabled";
+		};
+
 		icssg0_iep0: iep@2e000 {
 			compatible = "ti,am654-icss-iep";
 			reg = <0x2e000 0x1000>;
@@ -1459,6 +1468,15 @@ icssg1_iepclk_mux: iepclk-mux@30 {
 			};
 		};
 
+		icssg1_uart: serial@28000 {
+			compatible = "ti,pruss-uart";
+			reg = <0x28000 0x40>;
+			clocks = <&k3_clks 82 19>;
+			interrupt-parent = <&icssg1_intc>;
+			interrupts = <6 7 7>;
+			status = "disabled";
+		};
+
 		icssg1_iep0: iep@2e000 {
 			compatible = "ti,am654-icss-iep";
 			reg = <0x2e000 0x1000>;
-- 
2.49.0


