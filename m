Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F53ACA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EH84awB0hQAV7qsuekViMKwHSfbM3fDnPKPyuSR3p2s=; b=MFs5M5pF24IMNNCbOGvNpvTBeU
	+935+EEeN9JeFOyjJOumZ/3Bq/YNJd8mrHggRdmaIyAHAIENxMSMU550Ob2zkm1ffvNVUDLSe/q2q
	DyMggJgDU4LkzgJO1n/AHbZRS7yGiVgO5S7x3D8kfytGNwNi5y9mNxnuZGLW+SezmqVt5pHhy0D3a
	TZBzwMtqIeoH7HCHG8KMoW7Mao452jmx3kzHlV8nm1+cQod20/LuXupr0tI71GQ83LjKrGfLS2tP2
	fbzhdL05+/ZMcKAiW3tR+LD2riTwusnCViP+OOwyhYJpJ/EiRR8Sp4xCoTPs5J2CmGKp+ixjzZ3kq
	bmABCf0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ6f-0000000HDxN-2mSi;
	Tue, 02 Sep 2025 12:27:25 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utN0B-0000000GGoU-0WXM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:08:32 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 582989on2494778;
	Tue, 2 Sep 2025 04:08:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756804090;
	bh=EH84awB0hQAV7qsuekViMKwHSfbM3fDnPKPyuSR3p2s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CM3E6cN5Fu7FzkXQDDHHo7qSp3l+L4xb9j/ZL0QOfsVolWILwfRCwKmBe1n9ahxiG
	 QUOuIwN5MWMwSA6/oZ1f7kNP8q7tHIg4vGQtY3jYOWim6jdudxlJBX7jOZC3vxtByG
	 fGWXdENgHrJ+1O8OT3cfQl7NuPuBjDfDxnjm4GDk=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 582989Wu2171850
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 2 Sep 2025 04:08:09 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 2
 Sep 2025 04:08:09 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 2 Sep 2025 04:08:09 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 582989Qq1061812;
	Tue, 2 Sep 2025 04:08:09 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 58298894020897;
	Tue, 2 Sep 2025 04:08:08 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu
 Poirier <mathieu.poirier@linaro.org>,
        Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Nishanth Menon <nm@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>,
        Mengyuan Lou <mengyuanlou@net-swift.com>,
        MD
 Danish Anwar <danishanwar@ti.com>, Xin Guo <guoxin09@huawei.com>,
        Lei Wei
	<quic_leiwei@quicinc.com>, Lee Trager <lee@trager.us>,
        Michael Ellerman
	<mpe@ellerman.id.au>, Fan Gong <gongfan1@huawei.com>,
        Lorenzo Bianconi
	<lorenzo@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lukas
 Bulwahn <lukas.bulwahn@redhat.com>,
        Parthiban Veerasooran
	<Parthiban.Veerasooran@microchip.com>,
        Suman Anna <s-anna@ti.com>
CC: Tero Kristo <kristo@kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        Roger Quadros
	<rogerq@kernel.org>
Subject: [PATCH net-next v2 8/8] arch: arm64: dts: k3-am64*: Add rpmsg-eth node
Date: Tue, 2 Sep 2025 14:37:46 +0530
Message-ID: <20250902090746.3221225-9-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902090746.3221225-1-danishanwar@ti.com>
References: <20250902090746.3221225-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_020831_353230_FED0C291 
X-CRM114-Status: GOOD (  12.14  )
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

Add rpmsg-eth node to main_r5fss0_core0. This node describes the memory
region to be used for rpmsg ethernet communication. The commit adds
below changes,

- Adding new reserved memory region main_r5fss0_core0_memory_region_shm
- Adding rpmsg-eth node to main_r5fss0_core0 with memory-region as
  main_r5fss0_core0_memory_region_shm

Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642-evm.dts | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index e01866372293..1e5ee9ac9966 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -61,7 +61,13 @@ main_r5fss0_core0_dma_memory_region: r5f-dma-memory@a0000000 {
 
 		main_r5fss0_core0_memory_region: r5f-memory@a0100000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0xa0100000 0x00 0xf00000>;
+			reg = <0x00 0xa0100000 0x00 0x300000>;
+			no-map;
+		};
+
+		main_r5fss0_core0_memory_region_shm: r5f-shm-memory@a0400000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0xa0400000 0x00 0xc00000>;
 			no-map;
 		};
 
@@ -768,6 +774,9 @@ &main_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
 	memory-region = <&main_r5fss0_core0_dma_memory_region>,
 			<&main_r5fss0_core0_memory_region>;
+	rpmsg-eth {
+		memory-region = <&main_r5fss0_core0_memory_region_shm>;
+	};
 };
 
 &main_r5fss0_core1 {
-- 
2.34.1


