Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41038C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 05:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e1gzbKQ5W8TsSlAR2NJvnPpyJD/XJunargVbzrDXq+I=; b=J6jda/U3aXUzx9vwncM8GykYZB
	q//RuwP7oddMN5VBn3h+fxlgYsqCkbrkslYHVrbZDSbafGQfUvnn/haCj2bsNUFC95nIof47unx/t
	ZN5lOlkJy4oxatT5An/0+53889XmH7vjDevQm4AIvIYWLIb/WZmQBlSwpDtAp0we91ZK2lfjVIVnY
	DZ6JJSE8d68jSy0uvz3HBm4ip5ZAHgVtvaqtmLk1Nqe4Srj+RKJgndxQ1XXWgbAyYUZSqdPZJeHa/
	M60R6BjqvQDhVy7the0mQkaaJP6uVBRstHCHBrbsJndabAERkmrpeWhkNzoqrQ2I9VXEXft31iLCy
	gHNVWntA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCX1v-0000000EE9b-2umd;
	Wed, 07 May 2025 05:09:15 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCWzx-0000000EE2Y-0kwC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 05:07:14 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 547576SC1275461
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 00:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746594426;
	bh=e1gzbKQ5W8TsSlAR2NJvnPpyJD/XJunargVbzrDXq+I=;
	h=From:To:CC:Subject:Date;
	b=Gy3v3vkj65LSNGtV+UzbDlwPTsPRHhXQwAaNzjOUxF8oMLMLYxWb3aXZOxY9xXAOJ
	 FuZAIksmEo4/11+a18Wgghwy1KjLcz0ivnndvY+lvBhsBc75ZwMpnzkUvhCWfdoIeO
	 qz/jxZU7DGAVYAzL1KmLlj1fK8NjTylF2MlbBz/U=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 547576D6023522
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 00:07:06 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 00:07:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 00:07:06 -0500
Received: from prasanth-server.dhcp.ti.com (prasanth-server.dhcp.ti.com [172.24.227.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 547572KY114274;
	Wed, 7 May 2025 00:07:03 -0500
From: Prasanth Babu Mantena <p-mantena@ti.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <nm@ti.com>, <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>
Subject: [PATCH v2] arm64: dts: ti: k3-j721e-common-proc-board: Enable OSPI1 on J721E
Date: Wed, 7 May 2025 10:37:01 +0530
Message-ID: <20250507050701.3007209-1-p-mantena@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_220713_263238_C74DD9A8 
X-CRM114-Status: UNSURE (   9.77  )
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

J721E SoM has MT25QU512AB Serial NOR flash connected to
OSPI1 controller. Enable ospi1 node in device tree.

Fixes: cb27354b38f3b ("arm64: dts: ti: k3-j721e: Add DT nodes for few peripherials")
Signed-off-by: Prasanth Babu Mantena <p-mantena@ti.com>
---
Test log : https://gist.github.com/PrasanthBabuMantena/9dda540dce88282117de7e0e945e24ca
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
index e3d0ef6913b2..45311438315f 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
+++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
@@ -573,6 +573,7 @@ &usb1 {
 &ospi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
+	status = "okay";
 
 	flash@0 {
 		compatible = "jedec,spi-nor";
-- 
2.34.1


