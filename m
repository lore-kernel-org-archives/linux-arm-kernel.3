Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648F8C54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qXGLNKvg3Y7rTiwH1N2hMztt+amwnRIwV/2Puqb3q6k=; b=S/Tb9+luuiUOECwYwosjoICOt/
	YXJ4Mpk/53GDnribald5V0IhqDlqDRNhs8E6yT4G71tZXiXKiFTGo5Sj5V+8EnAFaf7rRjrQMtS3x
	B/0/6mnpcj0Nn+h21CFsVkM8vZbXLrG+5HXdWP8Obrb6f+6vXaGqIcXXCqm7AN0hpclc5WEhkAV3K
	rwGmtEr685ozGd2BTELTeY6V+Rp24htXKkANB1akqeen90y2qeKeZHEPQXJ/9UUQs9tfw0/yn+lxW
	2RGIMlnaHZIZz6lHrRcPrOLYuPnaywkIOD18ejjwN59CHL8SFw3OhRbZJnnwaLiIRq6qdrdoUIZFC
	sHUrDLig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITdI-000000047uO-3Vio;
	Fri, 23 May 2025 14:44:25 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISmc-000000041HY-1g3w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:49:59 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54NDnrqK2123631;
	Fri, 23 May 2025 08:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748008193;
	bh=qXGLNKvg3Y7rTiwH1N2hMztt+amwnRIwV/2Puqb3q6k=;
	h=From:To:CC:Subject:Date;
	b=s/HZkIQA+X9YHWObr2bMvqNPZZOr6D8MMlC8YJhTWI8mMBLYBuuP6mBMoeUPJDgXV
	 zVuFkVz2Ld7N1hOPjCg8aSu1QhuQA8XEZ64XfigAxFopzVBehskpm0+s/B6q/FgGmF
	 7Yd57JTvBBy9jrdvF30xlfOklIhO95X8XFdPcXp8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54NDnqX6099872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 23 May 2025 08:49:53 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 23
 May 2025 08:49:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 23 May 2025 08:49:52 -0500
Received: from a0507176-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (a0507176-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.68.154])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54NDnmoa102762;
	Fri, 23 May 2025 08:49:49 -0500
From: Gokul Praveen <g-praveen@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <g-praveen@ti.com>, <u-kumar1@ti.com>, <n-francis@ti.com>
Subject: [PATCH] arm64: dts: ti: Modify J784S4 SoC SERDES lane controller register length
Date: Fri, 23 May 2025 19:19:46 +0530
Message-ID: <20250523134946.144461-1-g-praveen@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064958_483890_F96B6E29 
X-CRM114-Status: GOOD (  10.16  )
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

Modify the J784S4 SoC SERDES lane controller register length from 0x30 to 0x50 
to enable SERDES4 registers.

'Fixes:9cc161a4509c2("arm64: dts: ti: Refactor J784s4 SoC files to a common
file")'
Signed-off-by: Gokul Praveen <g-praveen@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
index 1944616ab357..1fc0a11c5ab4 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-main-common.dtsi
@@ -77,7 +77,7 @@ pcie1_ctrl: pcie1-ctrl@4074 {
 
 		serdes_ln_ctrl: mux-controller@4080 {
 			compatible = "reg-mux";
-			reg = <0x00004080 0x30>;
+			reg = <0x00004080 0x50>;
 			#mux-control-cells = <1>;
 			mux-reg-masks = <0x0 0x3>, <0x4 0x3>, /* SERDES0 lane0/1 select */
 					<0x8 0x3>, <0xc 0x3>, /* SERDES0 lane2/3 select */
-- 
2.34.1


