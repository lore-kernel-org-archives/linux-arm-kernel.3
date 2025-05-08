Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA427C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fa0rbAPkxM+3rgikO9chYrJm2BqUTBPYcxaMPdZBIw=; b=dBjT+RjOyU8anEa8dvGxFRCGRC
	vrlQW0Rwol0uXV8LSkBNOk0TO7ItKozUSV7QzaHpdQHb9yt+XGhya/onaWhnp6lf65VQF/II4v6xp
	pCzsAVWxEFmRlhF5QeKudLitzc51jbDwUkyl12ut6xBExgIC7vrXvgpqKkFZXD8vlWpMhyhUAdDR0
	GP/i4tnWa6R6QsqxVcF3XWUoBGjgAyDpIfcN86kzprFPmb2gEshqFykAtFPEkFaAvq8baSuzDU3sQ
	LQKz4cLH9G8K30d47ur4ZxlF1SZSb/F3C/Eyv2x5bbIexbTkt9Z0TCoiFTSNlfIMNPD37i7oEfeRu
	fCnQxrFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vY-00000001MlD-3MgZ;
	Thu, 08 May 2025 17:20:56 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3YU-00000001CL4-2HrL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 15:53:03 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 548FqhVb1135258
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 10:52:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746719563;
	bh=+fa0rbAPkxM+3rgikO9chYrJm2BqUTBPYcxaMPdZBIw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Jk/1x/YIg+KSypoZa1GDhASf5ZffI0LjuOOVx9xBF1uV+3NpZxe7kJgVKKy20COA+
	 66tXHU8LnwvTpb0J0HwxSF8ziFYce236jMHQ6wbhgPmJ3grGUzuXdiCv1C9+c7UYAi
	 UokoF1b6oWmr7+VmGCVSibOCnv3c6WIgOQjHCNFo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 548Fqhsg019875
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 May 2025 10:52:43 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 May 2025 10:52:43 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 May 2025 10:52:43 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 548Fq2oM050794;
	Thu, 8 May 2025 10:52:39 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <jai.luthra@linux.dev>, <linux-kernel@vger.kernel.org>,
        <y-abhilashchandra@ti.com>
Subject: [PATCH v2 2/4] arm64: dts: ti: j722s-evm: Add MUX to control CSI2RX
Date: Thu, 8 May 2025 21:21:32 +0530
Message-ID: <20250508155134.2026300-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
References: <20250508155134.2026300-1-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_085302_625798_C39D922B 
X-CRM114-Status: UNSURE (   8.93  )
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

J722S EVM has the CSI2RX routed to a MIPI CSI connector and to 22-pin RPi
camera connector through an analog mux with GPIO control, model that so
that an overlay can control the mux state according to connected cameras.

Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j722s-evm.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
index 0f18fe710929..43256c71a19c 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-j722s-evm.dts
@@ -266,6 +266,20 @@ transceiver2: can-phy2 {
 		max-bitrate = <5000000>;
 		standby-gpios = <&exp1 17 GPIO_ACTIVE_HIGH>;
 	};
+
+	csi01_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-state-cells = <1>;
+		mux-gpios = <&exp1 6 GPIO_ACTIVE_HIGH>;
+		idle-state = <0>;
+	};
+
+	csi23_mux: mux-controller-1 {
+		compatible = "gpio-mux";
+		#mux-state-cells = <1>;
+		mux-gpios = <&exp1 7 GPIO_ACTIVE_HIGH>;
+		idle-state = <0>;
+	};
 };
 
 &main_pmx0 {
-- 
2.34.1


