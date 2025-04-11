Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B4EC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 08:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NOYt58RiGC5bUv1bOmPvQCAdmWARYOFCeTU9PYsfNYU=; b=Mj622nhCIYoeKO2gcWd1Gg4zru
	+/RvO9PJuZ0udo7hCxT07JAXF9uMaBn3tin455GLFdE0KYsVVtbpMbRl/NoyUnE0LgyvyQlHItsf5
	6ERfVKz2hJU7S96w028+RixDny/jZFOT8eBja+mKWs13I1oDUAXp7sITHlG1FUYXcfXCyahaKUNw+
	8OlV3TT7PDUY0irpNFSOvZ089iC6Hz+xI4daoSLcLvZhP8smnrAm6x7QdyiGJhcZCx0JsBG1Vfozq
	4Pr9KbQOfLYt6m8wvNMRBuA4sBf4xvOEskS1AJi0lNsuEDTPUKWwdgo/0y2nEFiUQbF52cdK9wzZu
	WuQV9u6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39lQ-0000000D1Fg-2BOQ;
	Fri, 11 Apr 2025 08:29:28 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39io-0000000D0e0-45N6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 08:26:48 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53B8QfTb1392056
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 03:26:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744360001;
	bh=NOYt58RiGC5bUv1bOmPvQCAdmWARYOFCeTU9PYsfNYU=;
	h=From:To:CC:Subject:Date;
	b=I2foo0S77yekuSJn0jX2huJaWMI2RXsz5BDQyqN9NwHPO+wTLfn9E7K7mjEYLUOPK
	 nMGSP4rhQQoaCj8ybfDs2kkxgrO+xgELpGjcW9wMeTB7YmL0Cl0dpd+u2e16fm9wpM
	 bO3ib3QLUTp6pPEPc/FfnEkslJEUuatW+sRPEdYQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53B8QfN4039979
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 03:26:41 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 03:26:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 03:26:41 -0500
Received: from a-dutta.dhcp.ti.com (a-dutta.dhcp.ti.com [172.24.227.92])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53B8QcGl124342;
	Fri, 11 Apr 2025 03:26:38 -0500
From: Anurag Dutta <a-dutta@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <u-kumar1@ti.com>, <vaishnav.a@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: dts: ti: k3-j721e-common-proc-board: Add bootph-all to HBMC nodes
Date: Fri, 11 Apr 2025 13:56:37 +0530
Message-ID: <20250411082637.2271746-1-a-dutta@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_012647_058446_C60A8A5F 
X-CRM114-Status: UNSURE (   8.69  )
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

Add bootph-all to HBMC controller and hyperflash nodes for successful
hyperflash boot on j721e-evm.

Signed-off-by: Anurag Dutta <a-dutta@ti.com>
---

Test logs : https://gist.github.com/anuragdutta731/90a492589557c2ec2881e1de50a62006

 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index 4421852161dd..9ada749f16ba 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -570,6 +570,13 @@ &usb1 {
 	maximum-speed = "high-speed";
 };
 
+&hbmc {
+	bootph-all;
+	flash@0,0 {
+		bootph-all;
+	};
+};
+
 &ospi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
-- 
2.34.1


