Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C45E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxBfAidCZEpZfBvPJ7kpXgJ70sPB6hVOSGyHqW1x/Zo=; b=0O3UimS6mWE2CmKChdCPNAeK3H
	fJrioUMzkN5MGYjgS0F7hjdlzUgNmzBRFiq9DPtTVbGOAqQpjquYR9YVNUuCLF9ZWOysjBqUq0lDv
	Ca+2loVsY9Zx7EjXn2/JkErbejCm0x9rtXcdT54HQ5irYre/sUXd4MQVR24EWafKnY+rnFQiIK7+K
	Qj7byaw+g+CEuxZ8niKsKw9gmDXVXuIJAg9PrIkpberF1inWtXdAqmpUXRLZqHIyCubWuS8qm7SoY
	7EsIWAQI3uO9BhuvGeqlszSgSPoTSqOjTPmBUDEZvov4vsk/VBiwXaB5erX9uigjStgcmB8ftL0Fx
	PP0r15Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVs-0000000Fpr0-2rl0;
	Thu, 05 Dec 2024 11:59:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Rj-0000000Fcvh-2t38
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Dec 2024 10:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VxBfAidCZEpZfBvPJ7kpXgJ70sPB6hVOSGyHqW1x/Zo=; b=biwuR2z3PRCJQMSvEFSZqlGxOT
	Z5fxK5EMOuT7DBt1x+Fhrobecu92dehYcY34xNfEQa/S50rP06H2OyqFw+q3UoEuJor/3nown826W
	FmQ8yve+NG061SlFDKZ/ByPJxdmxdcnHXgbE+nLJCnKNJa6MLN4mjRe+0Y2RH1gr1nUi9kDjOGYX2
	a//IkLzBo7HvTsKzw1pxZxsv0nCkV2EMqVFSoFZgJ4kLnbv1O3b+xX2l9GoiBA/SfwEGxuCPnWGkh
	Oyr8HrFJ+TAceCPh0Rpi4w7VUjI3AYWjaAaa2c8fDe49xEN8SQ+ggP3T6OQyL7lnH5uiLdx+MrxzI
	ZmvkfROw==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Rg-00000002pmW-2IkK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 10:50:58 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5AonFC1747659
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 5 Dec 2024 04:50:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733395849;
	bh=VxBfAidCZEpZfBvPJ7kpXgJ70sPB6hVOSGyHqW1x/Zo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Kcg7KMJb6dL89WRcBzF7/wTLAV7RkjSYi91u7pbT22PV+Ca0s2rfI0p3DgjL7d1I2
	 LIYb6jXGII054DjUgydrwGX7hEQHIUK1g1mUVuEPEzJK88oaKsiDQRFKN3yEEaq3a3
	 vvvSHUdm6WUu5Wh8GGcT/mGeFTKacbBvctX9fqEA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5Aonnf022871;
	Thu, 5 Dec 2024 04:50:49 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Dec 2024 04:50:49 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Dec 2024 04:50:49 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5AofJr110686;
	Thu, 5 Dec 2024 04:50:46 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v4 1/4] arm64: dts: ti: Makefile: Fix typo "k3-j7200-evm-pcie1-ep.dtbo"
Date: Thu, 5 Dec 2024 16:20:33 +0530
Message-ID: <20241205105041.749576-2-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205105041.749576-1-s-vadapalli@ti.com>
References: <20241205105041.749576-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_105056_802462_405E5E7F 
X-CRM114-Status: GOOD (  11.43  )
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

The list of "dtbs" should contain the resultant "dtb" formed by applying
the "dtbo" overlay on the base "dtb", rather than the "dtbo" itself.

Hence, change "k3-j7200-evm-pcie1-ep.dtbo" to "k3-j7200-evm-pcie1-ep.dtb"
in the list of "dtbs".

Fixes: f43ec89bbc83 ("arm64: dts: ti: k3-j7200-evm: Add overlay for PCIE1 Endpoint Mode")
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

This patch has been newly introduced in this series.

 arch/arm64/boot/dts/ti/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index f71360f14f23..379bfa4425d4 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -230,7 +230,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am642-tqma64xxl-mbax4xxl-wlan.dtb \
 	k3-am68-sk-base-board-csi2-dual-imx219.dtb \
 	k3-am69-sk-csi2-dual-imx219.dtb \
-	k3-j7200-evm-pcie1-ep.dtbo \
+	k3-j7200-evm-pcie1-ep.dtb \
 	k3-j721e-common-proc-board-infotainment.dtb \
 	k3-j721e-evm-pcie0-ep.dtb \
 	k3-j721e-sk-csi2-dual-imx219.dtb \
-- 
2.43.0


