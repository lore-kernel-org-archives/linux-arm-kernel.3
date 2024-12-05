Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85756E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i83+XyCVE1KwnX0mSRiSVl27kUFWH+OoIaPZSuRFm2k=; b=Zi1IECh6IUwOhpKA/EWlhLwnEB
	uGvX/roo635vzCpVdXfiQzoBtAHHYI2xiyqC9u5kz5ddCwcEoLyttk6rFVCNPn7+TGpfR/7ybbKHk
	wYzQnEka40e+Ns/7SbW3Wab2i2VtW7NplPiOSYoriPFnvLiLfkE93nsrssrcu8UFazDFWOi0+wdcE
	RzQLKOGHYmH4fT/l704FTIR+ZZtgUbyxO3a5qkMxNkukUKBan0JmUZYLnatwYqvaHstgztSTJfv8y
	PA+WDPifI9Z3lmUm1NFBPS2+lgTIIHL30bvcminpbZsdMkya38mPtD6lMnUkWR5asgyutchqVQcnq
	3dC/C0tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAjC-0000000FteX-3wPQ;
	Thu, 05 Dec 2024 12:13:06 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAYH-0000000Frhe-1BNM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 12:01:50 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5C1kSR1943306
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Dec 2024 06:01:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733400106;
	bh=i83+XyCVE1KwnX0mSRiSVl27kUFWH+OoIaPZSuRFm2k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XoG1bTkJ1yyBSGqWEFgrHrXy4odDQ/jWXsM0kZN7Uo1BLgYLT6XF+0NSpvh2ThM/C
	 23mhuGG3HDjtpSzqHBR67dA0hqGd4ga2I+8HrSyRvhvWBfjz+OaUBL8HaWTjg3cX+k
	 2uhoXkm3KpWoSsGnTRjLyErYKbthj6Bf63qBnr3U=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5C1kHQ107982
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Dec 2024 06:01:46 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Dec 2024 06:01:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Dec 2024 06:01:45 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5C1Zp9018608;
	Thu, 5 Dec 2024 06:01:42 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Subject: [PATCH v2 2/2] arm64: dts: ti: k3-am62x-sk-common: Support SoC wakeup using USB1 wakeup
Date: Thu, 5 Dec 2024 17:31:29 +0530
Message-ID: <20241205120134.754664-3-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205120134.754664-1-s-vadapalli@ti.com>
References: <20241205120134.754664-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_040149_362166_C959D524 
X-CRM114-Status: GOOD (  11.40  )
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

After the SoC has entered the Deep Sleep mode, USB1 can be used to wakeup
the SoC based on USB events triggered by USB devices. This requires that
the pin corresponding to the Type-A connector remains pulled up even after
the SoC has entered the Deep Sleep mode. Hence, enable Deep Sleep pullup /
pulldown selection for the USB1_DRVVBUS pin and set its Deep Sleep state to
PULL_UP.

Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---
v1:
https://lore.kernel.org/r/20241112115650.988943-3-s-vadapalli@ti.com
Changes since v1:
- Rebased on next-20241204.

 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
index 6957b3e44c82..8b6316454639 100644
--- a/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi
@@ -256,7 +256,7 @@ AM62X_IOPAD(0x12c, PIN_OUTPUT, 0) /* (AD19/V15) RGMII1_TX_CTL */
 
 	main_usb1_pins_default: main-usb1-default-pins {
 		pinctrl-single,pins = <
-			AM62X_IOPAD(0x0258, PIN_OUTPUT, 0) /* (F18/E16) USB1_DRVVBUS */
+			AM62X_IOPAD(0x0258, PIN_OUTPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (F18/E16) USB1_DRVVBUS */
 		>;
 	};
 
-- 
2.43.0


