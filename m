Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C350C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 22:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csK+TxlNwuyVouIbzQNjNZY+df/jqdZq/HmfKuxiiTo=; b=wzGzggtjHlzdSIs0i5ytswJ8/5
	RO/P1LgNuTbOTDuHsQksqiS7srNZB8/qRpDNPIMsKz9nH3gYA3nzH4Ydy9Q6nFk5SqMgTQkYRV6b0
	6jwi5OnJJitujaY2MyM1uIaFsHXQjO9JGJd597xiNScQ0y3DfhLNTLJcAaGiDCl+tuDbLRbcF4pyR
	5G+0JTcFXsA0NGOsamVl8eGUFiCMOyCDlFjldWecjrT6/9YnHqwQHZahnVT5OhIP9W1PlGFJcgHPG
	ZScIkC7NbAMxmDllPhlzMLyRclwKSSN7GOKJTgkOvecO5J9zXSp4S+Hprk6u6WAq1oYoZoa2J3xKK
	Pp7tzKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thcGc-00000001ehg-11J9;
	Mon, 10 Feb 2025 22:28:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thc4B-00000001cT8-0Lt1
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 22:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=csK+TxlNwuyVouIbzQNjNZY+df/jqdZq/HmfKuxiiTo=; b=MVnqATMk7E4ufIc8GF1OfNoHWv
	vQHKKXyWXe6q6t2TZRfuTBvDdXAWVR3SeqaN/gfHLWjEDMCIzGs46+PSDcf/tKAl3HZ28QAInBR0c
	ZbNIEul9xuisZsEHl4VX/laOdVmihcpIdZVa7imrxroAR3xuxGTz161JC0ZCG9NUCUn4+P/zdig6G
	wF6W3wDVx4I4ysmeELrump3vUsP0pqxTQDcWwLkhw/GZy27R77cjSu7UXpgehwndgyB0ElPRTPNZW
	yaY3ixZWLl9vl+7WZh4pmJ3viqP/6qfII+Vyp2Fb6DPaj0ObPMB4JL8dg69JJOXeXcxD0X/SxHF58
	xlj7x6bQ==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thc46-00000000JUD-0jGd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 22:15:45 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMFVtX121121
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 16:15:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739225731;
	bh=csK+TxlNwuyVouIbzQNjNZY+df/jqdZq/HmfKuxiiTo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=idJMETfmuE/GeG6KXF69qTXQCDIK2WETGYfo3s8IPjvt2JA+yT1CraT3qewRLFxDU
	 vdQ4difxOBttZRL0RjrDnu0qCdpRkOwf3ZIikUobqgKNiMqdGskix7PPPG8ReH+5fB
	 bcSzug0cUypTTa/ysIuSRMgw16dPtRtZqSkVt0fk=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMFVC9016609
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 16:15:31 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 16:15:30 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 16:15:30 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AMFUZB112628;
	Mon, 10 Feb 2025 16:15:30 -0600
From: Judith Mendez <jm@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Andrew Davis
	<afd@ti.com>,
        Hari Nagalla <hnagalla@ti.com>, Judith Mendez <jm@ti.com>
Subject: [PATCH v5 09/10] arm64: dts: ti: k3-am62a7-sk: Reserve main_rti4 for C7x DSP
Date: Mon, 10 Feb 2025 16:15:29 -0600
Message-ID: <20250210221530.1234009-10-jm@ti.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250210221530.1234009-1-jm@ti.com>
References: <20250210221530.1234009-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_221542_631662_703E038B 
X-CRM114-Status: GOOD (  10.73  )
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

From: Hari Nagalla <hnagalla@ti.com>

The main rti4 watchdog timer is used by the C7x DSP, so reserve the
timer in the linux device tree.

Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v4:
- No change
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index 11390a8742453..07f21abd03c12 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -826,3 +826,8 @@ &c7x_0 {
 			<&c7x_0_memory_region>;
 	status = "okay";
 };
+
+/* main_rti4 is used by C7x DSP */
+&main_rti4 {
+	status = "reserved";
+};
-- 
2.48.0


