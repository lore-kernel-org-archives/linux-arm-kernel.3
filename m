Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400E3C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 12:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CT9OzqLKGP3slmO04oTd4+ZqOpXmjF3nDMw40m4fEEI=; b=z19IBqV9fvW8HuuXUsp+gEMI/s
	LmUPpdaJ/X0po/cSh0k8UE8oZBv+w6EA+JPp+BKpT9EUJH12qcInjCMf1lQDNbg+JaHzssfipDkKz
	g8VbKCnW7Vsgu2UJzN0ZzNT/uQXfwa0AuL94UcveOt8rCxnMaLuWOwapZNc2mjhIq9oZgCpMi3bNt
	PukigUjesPsbGiVQbjdE3g+eOpp/GO4DSLqeTpjz+TM7ZdwXE6JDIa7f6istM7HYJmWqCDSNUKncx
	SbG6sEpE2nsUX55AJuIwfOuFQ+AUMve5mO0FEwEmeGyIKMYzkl7nUlUOeW72F4IQ5ryr3iLJCfjt6
	AIT5OUIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uObD7-000000044QY-1YIE;
	Mon, 09 Jun 2025 12:02:41 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uObA3-0000000441S-2W58
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 11:59:33 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 559BxQQ1782641;
	Mon, 9 Jun 2025 06:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749470366;
	bh=CT9OzqLKGP3slmO04oTd4+ZqOpXmjF3nDMw40m4fEEI=;
	h=From:To:CC:Subject:Date;
	b=tW3C2TkU8OHhNymxqYVkfkYyjo/sg4nwiGEI2rTWt9vMMb1iWjWcdxeeo3fLQzdyC
	 G5bj9WwvPOfkZ8AYwpn63yE52ScLae7RTJPZr5aKnH7HHdZfu7CsEnwQLsF6KFLYWG
	 ezx0JarxACRJi+7mezAL3QzTbVPnc/GizcGa6PLE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 559BxQ4x060736
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 9 Jun 2025 06:59:26 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 06:59:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 06:59:26 -0500
Received: from hp-z2-tower.dhcp.ti.com (hp-z2-tower.dhcp.ti.com [172.24.227.4])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 559BxM2w1361878;
	Mon, 9 Jun 2025 06:59:22 -0500
From: Hrushikesh Salunke <h-salunke@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <s-vadapalli@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <h-salunke@ti.com>, <danishanwar@ti.com>, <srk@ti.com>
Subject: [PATCH] arm64: dts: ti: k3-am69-sk: Add idle-states for remaining SERDES instances
Date: Mon, 9 Jun 2025 17:29:21 +0530
Message-ID: <20250609115921.2380611-1-h-salunke@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_045931_803451_5DE3F9A3 
X-CRM114-Status: UNSURE (   9.31  )
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

In AM69 SoC there are 4 instances of the 4 lane SERDES. So in
"serdes_ln_ctrl" node there are total 16 entries in "mux-reg-mask"
property. But "idle-states" is defined only for the lanes of first two
SERDES instances. For completeness, set the "idle-states" of lanes of
remaining SERDES instances to a default value of "unused".

Signed-off-by: Hrushikesh Salunke <h-salunke@ti.com>
---
This patch is based on commit
475c850a7fdd  Add linux-next specific files for 20250606

 arch/arm64/boot/dts/ti/k3-am69-sk.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am69-sk.dts b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
index f28375629739..dcd7eb079766 100644
--- a/arch/arm64/boot/dts/ti/k3-am69-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am69-sk.dts
@@ -1295,7 +1295,11 @@ &serdes_ln_ctrl {
 	idle-states = <J784S4_SERDES0_LANE0_PCIE1_LANE0>, <J784S4_SERDES0_LANE1_PCIE1_LANE1>,
 		      <J784S4_SERDES0_LANE2_PCIE3_LANE0>, <J784S4_SERDES0_LANE3_USB>,
 			<J784S4_SERDES1_LANE0_PCIE0_LANE0>, <J784S4_SERDES1_LANE1_PCIE0_LANE1>,
-			<J784S4_SERDES1_LANE2_PCIE0_LANE2>, <J784S4_SERDES1_LANE3_PCIE0_LANE3>;
+			<J784S4_SERDES1_LANE2_PCIE0_LANE2>, <J784S4_SERDES1_LANE3_PCIE0_LANE3>,
+			<J784S4_SERDES2_LANE0_IP2_UNUSED>, <J784S4_SERDES2_LANE1_IP2_UNUSED>,
+			<J784S4_SERDES2_LANE2_IP3_UNUSED>, <J784S4_SERDES2_LANE3_IP3_UNUSED>,
+			<J784S4_SERDES4_LANE0_IP3_UNUSED>, <J784S4_SERDES4_LANE1_IP3_UNUSED>,
+			<J784S4_SERDES4_LANE2_IP3_UNUSED>, <J784S4_SERDES4_LANE3_IP4_UNUSED>;
 };
 
 &serdes_wiz0 {
-- 
2.34.1


