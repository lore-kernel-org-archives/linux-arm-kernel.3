Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45FBCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0oadEFhyKw8xNX02oSrKVOwP9QjJ5m1LgbJY0yE+Oo=; b=SJt0FURq/tjPuBBZPT+tEDgWoO
	Bl7m04Dq0EBBpvohntm33zd//xJnX1QTFv+PFjgNF5Pdjj5wDjnyTdswsQZMOsJIzZY5qoYmNcImY
	O+zGHxrP9mjNz02XSIOlgrJ7UiSZFhZV5YX8b4jg+r03MUpQcjYLdeKAEQhVk+5p7F3UBOk46caL/
	VP8ldbUa6VbCrsymy1wKCVA33j2KT1I8H5PyKc8YRDS1xXz1TrW3I++/SvFVrOT4P3uDxaS6azDgF
	ZurmfjnwrLLB+tpnINIso22CjblVe42tC9nbtIQ6mds6ZFUNVKK9uSN4R+4oEFgjq6+PJJF09Whdu
	tp12+N8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlej-000000033Dt-2mYM;
	Mon, 08 Sep 2025 23:52:17 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvfp5-00000001G0p-2PqX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 17:38:36 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588HcVCY3916323;
	Mon, 8 Sep 2025 12:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757353111;
	bh=P0oadEFhyKw8xNX02oSrKVOwP9QjJ5m1LgbJY0yE+Oo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yqMzfXgSQL6Y7ytZL5GytIt2q/pn8UtZfYV4IfkkSod4FR4sFf1ESDpC1JCfTY0wS
	 hxPJ/tYXSC0ts85MoX28Vv5vAMRtNCkgxFl+TYg+P/Fal+HqQ3Mx+b0ijrno3ELU6r
	 sfm6N82qg+D5H/yeU+gw37ycdEl9W6P2jG2c3kFk=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588HcVZW2565880
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 12:38:31 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 12:38:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 12:38:31 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588HcVVp1281123;
	Mon, 8 Sep 2025 12:38:31 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Moteen Shah <m-shah@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] arm64: dts: ti: k3-am62p: Update eMMC HS400 STRB value
Date: Mon, 8 Sep 2025 12:38:31 -0500
Message-ID: <20250908173831.269039-3-jm@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908173831.269039-1-jm@ti.com>
References: <20250908173831.269039-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_103835_656178_39E27F77 
X-CRM114-Status: GOOD (  11.39  )
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

STRB setting for eMMC HS400 have been updated in device datasheet [0],
so update for am62p in k3-am62p-main.

[0] https://www.ti.com/lit/gpn/am62p
Signed-off-by: Judith Mendez <jm@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
index 90afe21e972b..a1ce2fc8d947 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
@@ -34,7 +34,7 @@ usb1: usb@31100000 {
 
 	sdhci0: mmc@fa10000 {
 		mmc-hs400-1_8v;
-		ti,strobe-sel = <0x77>;
+		ti,strobe-sel = <0x66>;
 		ti,otap-del-sel-hs400 = <0x5>;
 	};
 };
-- 
2.51.0


