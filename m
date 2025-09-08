Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2788DCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USBrv5EHEUsjzK+ezZaEzKEkFuiYZYhIWSYji8XWS/Q=; b=bf/SWuh+5jCt3fxH+ghkE7r2+2
	sdbZTjF2s46yRnPpyM8LTIeL8ruwzSe3gUVTEoAinnv97z/5TGlgJ//Oo1s++wl1GRkhUlo7Oh71B
	fSUUvb+Oq17msui4tacZQDlpOidVcnQT21J5YUBg617SH/Hs69of78O9pThBggy1cbd/2ChVdNdIJ
	4sIxiKV0Z+cCRxui4Qt+vnWawU3YvDuERxJYHi4nqs/YUReNxlzAQ1nOeGdEz8WgntIXKXAhIC+dw
	TfBN1S1fz3rtTQCAb1/dUGelvI1y5S8yRI5FL4m89baWcI65L7+bNYJ4EfXFNxU2rh563wUW/3Cr+
	j3nIL4SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsEd-00000004sw5-2N8j;
	Tue, 09 Sep 2025 06:53:47 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvlee-000000033B4-3fQZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 23:52:14 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588Nq8eB157299;
	Mon, 8 Sep 2025 18:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757375528;
	bh=USBrv5EHEUsjzK+ezZaEzKEkFuiYZYhIWSYji8XWS/Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=a9PVXZAukI+9i+PCbeKbfmZfYXG0E0dfTqMueu4IWQEKgZS/g4dWABm0TeuMg4Jfz
	 ZLZ0KNXzdaI+I7VFmjy+dX4+FDE7BN7hRN8nFOUU486Vo+RflKR64nHOQ32tn3nSo1
	 PNJqBCSMJEWnPS3mBkR1AamiPb1mlGW4Q3gAMsMk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588Nq8uF2742941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 18:52:08 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 18:52:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 18:52:07 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588Nq7WX1677746;
	Mon, 8 Sep 2025 18:52:07 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Moteen Shah <m-shah@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Andrew
 Davis <afd@ti.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/2] arm64: dts: ti: k3-am62p: Update eMMC HS400 STRB value
Date: Mon, 8 Sep 2025 18:52:07 -0500
Message-ID: <20250908235207.473628-3-jm@ti.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908235207.473628-1-jm@ti.com>
References: <20250908235207.473628-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_165212_958379_B776D1F1 
X-CRM114-Status: GOOD (  11.27  )
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
index 020bd121a6a3..908cc0760e7d 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
@@ -77,6 +77,6 @@ &main_gpio1 {
 
 &sdhci0 {
 	mmc-hs400-1_8v;
-	ti,strobe-sel = <0x77>;
+	ti,strobe-sel = <0x66>;
 	ti,otap-del-sel-hs400 = <0x5>;
 };
-- 
2.51.0


