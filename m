Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371E6CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 11:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4aLM17aUH7GWbLr4Ba8AhRL9yXc7ouny2cE8vrnnVfQ=; b=pycBPZ65EbP/xEeM0yTFBb23mN
	eyJkjOmEM9dVgjWohljUAKg78oza/g5Mv2VCOG2MTjPwj4YKvDMJk3fUTVu8RqAf6gVvRvZ9JeF9e
	Fq48+xvIPbqxvQ+L27fP4Kue0l0NFpQalK7sFNsVx+fZH2MEcT5A7BddOa1jw7SKgBnSMk4lTQ7RE
	2Rg3zDQxNxfUMxtogHT+74wjL8DP7nMKMX28UsR6hGZUejJwtTjEmt42pGZ/anhnEYEGTgEAlAEhB
	Bb/KUn7MrbQIQijvpU2Dvga26oxG5PP304TriWS1htoBFcc8GHQIclxUKSU8aARa8iMG70H4DmvMm
	iQ2jMIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8H6i-0000000D35N-14z1;
	Mon, 13 Oct 2025 11:52:52 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8H6f-0000000D351-2yBj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 11:52:50 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59DBqi3l813850;
	Mon, 13 Oct 2025 06:52:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760356364;
	bh=4aLM17aUH7GWbLr4Ba8AhRL9yXc7ouny2cE8vrnnVfQ=;
	h=From:To:CC:Subject:Date;
	b=OEU6fTeweMMaCQu+ND4oUiFvtbHebEQjazHFOhn4sXPotcwRdbltf8u0B6C+daE2G
	 8HfWkWpJ8c4x5Fl2cdRK/7KsczZAACScQBy0AHH1/eJVQAi/dLJU/YZ60bBGMzGPKH
	 LrGB+nbDtkieu9FHwg8y8mSLGfkDTOtuvC4CU/dU=
Received: from DFLE210.ent.ti.com (dfle210.ent.ti.com [10.64.6.68])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59DBqi4e3157528
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Oct 2025 06:52:44 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Oct
 2025 06:52:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Oct 2025 06:52:44 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.233.117])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59DBqeYe1998445;
	Mon, 13 Oct 2025 06:52:41 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <s-adivi@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am642-evm: Add DMA support for tscadc
Date: Mon, 13 Oct 2025 17:22:25 +0530
Message-ID: <20251013115225.3668641-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_045249_833686_205E4B48 
X-CRM114-Status: UNSURE (   8.96  )
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

Add dma support for tscadc0

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am642-evm.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index 85dcff1049360..52bdf7102192c 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -608,6 +608,9 @@ &tscadc0 {
 	/* ADC is reserved for R5 usage */
 	status = "reserved";
 
+	dmas = <&main_bcdma 0 0x440f 0>, <&main_bcdma 0 0x4410 0>;
+	dma-names = "fifo0", "fifo1";
+
 	adc {
 		ti,adc-channels = <0 1 2 3 4 5 6 7>;
 	};
-- 
2.34.1


