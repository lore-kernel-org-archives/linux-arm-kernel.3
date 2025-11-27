Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404F2CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bVJsV0IZN7AMHtKwkvGiufK0/YGgSj2wgLY89TnZF1E=; b=0z2TwMiukgnj6uZ6L/k1WiOdw7
	FTb9lMWVqmojVZLZ+AjsqGBb8J1fogWsxpdLrDddbnKJMO+mUWP44i+bdA9onZVCEJX9vyfmUfqYm
	k0jTJxR06HKDseiQ5kK+tpRtBCwdy+yHFRG+7jtLEqSFB0wzpgYkLtbycgwkAnOon9UAKy5Fw+udp
	kxYlUNowa/RE0LcBRrDzruVT9U5jF3QIqME1b8OCS975xQp1svz/UcbQWNqxsznKwqqodpVL2LTo7
	o1idz6jaP7bS1BncR+7iJPIcWFdNegjsBUKsI2k3vreyf31nk3I1LOSIQpX1g1uNeaRxmYmBpC+qP
	XsFidY9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb6P-0000000GYRB-3NfZ;
	Thu, 27 Nov 2025 12:28:01 +0000
Received: from mail-westeuropeazon11020119.outbound.protection.outlook.com ([52.101.69.119] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb6F-0000000GYOO-3o7H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:27:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8L6oPR0O04+mZI1NWv+HviA3YNxAdrBN1yu7BJeNoX3z+EtUZPYq9iJn6Ok2Xi8rQ1ZPoVNjnbl7XzMxslVwesdEqLx5llTc3gmgG/e5QJP3RSuUQbs5rWlof5Vhg7qIPrZGvYVHQwAY9UqKJHrgBpO8f7HpLwgqqHhGzVzO7JLQRv6dreHO7GXqnFYD6RW6GBqbL9P+APUhGMatlUdlEbSUS+C0SjPBaEvyd1/HrS1vXroQc49GfHBojfWu/R3zLE4/eQMnJLZYzDqSe/Uj29CC6k14TvrzwlAlwFBILQIc/400ab+IUOCw1uN7uvKjZlB6OJRWLfC9GCVCUgDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVJsV0IZN7AMHtKwkvGiufK0/YGgSj2wgLY89TnZF1E=;
 b=PA95B6SuVe1oLbIH0sKqkdkHKzLl70iD0pdl83dDKX2xeVXF5VXDyQG+jJashXOc2um5I8Dw2VIq0Q21rb86asLHPRyQ9y3ZMkmr0xaC0ITPkYPSMPCozUDdRpdkwtdBlcjv6KEYQXGmpcz8dxlBaiE5KmFPramUqBsV7l+AZh0R5fRXc/vcx1yN3PmqszUYCbTUaw77YzUfAipkmUG9vn1Q6WS14nyoc9hi6FyHaYfnL3DqbFW0d3PPUwqTtk0adBF6BoeZF4H5aOAtp7BVkbLt5/lGd9trEeRxQbNu3LC1Wd6x7JUvftsGP44KrdpWd6MtwAeN5BfWF3l4RUtaOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVJsV0IZN7AMHtKwkvGiufK0/YGgSj2wgLY89TnZF1E=;
 b=PzeyOkHmWDc27p0Qk1SebawtgAfrOTgTgN2Eed0RZaRdimtme/giHmbCz3fHpsOhaf8Nka2/y6lm2bPXFoqUB5u9eipXNEH+NdUKTYXWkODzIt5XLHOhT0j+Rzg37KrGKKg5G9CZLSqwOfuqDeJuBivQoDOG3PfkUfm++Fk08s9GwKQyaWrecC/dz1I6QlMrGrCTXACk58T39Q+Gb3ATTWhtxqBFCVJLGV5hmuf/uKZpfpnSQZWgB0eRFDbMyCwW8vn1oVRiLG9fXF+C1osxwr0ctI024UKO5s6KTM6ZFn/6jk6bQeWnF4232chBhk0+VJsaO3xUidLAAFKRjSZpeQ==
Received: from AS4P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::19)
 by PAVP195MB2210.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:2fe::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 27 Nov
 2025 12:27:44 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::92) by AS4P250CA0029.outlook.office365.com
 (2603:10a6:20b:5e3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Thu,
 27 Nov 2025 12:27:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Thu, 27 Nov 2025 12:27:43 +0000
Received: from phytec.de (172.25.0.51) by Postix.phytec.de (172.25.0.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 27 Nov
 2025 13:27:43 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <ggiordano@phytec.com>,
	<d.schultz@phytec.de>, <rogerq@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH v2 1/3] arm64: dts: ti: k3-am642-phyboard-electra-peb-c-010: Fix icssg-prueth schema warning
Date: Thu, 27 Nov 2025 13:27:31 +0100
Message-ID: <20251127122733.2523367-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AC:EE_|PAVP195MB2210:EE_
X-MS-Office365-Filtering-Correlation-Id: d50be2e1-4673-4f58-65c3-08de2db05d8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ekP8PCIrHQvWJNtwySalYwjcudZqHqUtS/8UImqQbFwsrciMO9JldBMDa5Uc?=
 =?us-ascii?Q?py8mvpgVyEHui+Nlcg/Tf0Q50xaPGy1zI5cjzL4dPUASoXoqklioSQGWOvLs?=
 =?us-ascii?Q?y+uSJNU9+t0MdYkrlDI/hDFF9bUeAhQKJb01wkQML2fP/5fB3ON7ReXRp3LA?=
 =?us-ascii?Q?wZ37BUYu/hG4ZMOzOftXPUzTVRQIbAjUA/12XWaXi5TYcwAkbVA36SmOVSuS?=
 =?us-ascii?Q?Eaif2HMma6JKuC/kzYUgTDgP7iQAcStLgAxIPF4Ws64LhDhotrKUhj1nt9SZ?=
 =?us-ascii?Q?US5oxKuY18i3/A9xbKdA6AAffrj1c6bVDm3453Vq3UpsIHmNDDTkaw11AyLI?=
 =?us-ascii?Q?v19aAEF1CxBWxVh3aA1UtyTGQP7wytGtrnqOcnDKPbdwOUycQ076pCoCytpz?=
 =?us-ascii?Q?9rvxLMCdSt1LCn/XtdVo2M51GFQDDkbjuDPCaL5nso1NHpCdE2HXupXwxoF8?=
 =?us-ascii?Q?kof6i7g44UhhNML9eFBJbhboahEg8B6rD8EqOWbVPmd4wh/EHOgk1T+FkeD7?=
 =?us-ascii?Q?6L7aKVCTHdDs3bOJ3WLN+Z+/YklFGKqZlKnw5fiY3GC994a2iw9jkju/jahe?=
 =?us-ascii?Q?y+xaGfr7eUyhk4Eu6Z8AC+YNtH36Vt1zcqnd++55FJK+N+gdd4eGD7VD7gJo?=
 =?us-ascii?Q?1Kxd6m6tiJ7VsVAlBKpu6LDb9Z+WLF+SZqEFmWnmcZQ2Vv9PxH8wtntzIyGG?=
 =?us-ascii?Q?KQlf5tgfB5b+DOpRI+wllT32CHPsooBsV4Y5RRNYoeUNvWY2CJcZK1/wgpe3?=
 =?us-ascii?Q?MweiRJgP50Spl0mpPvbtokFj0wdss5zBRwXwBvS0XnD6xooysGx39LFhwRDb?=
 =?us-ascii?Q?xcmQtZZHqGuZXcXG7t0c9Lt1r7aCPYL2z84lvKlrvFHyX/nljGUWrNpF79gO?=
 =?us-ascii?Q?kIRdBwBHeW8c3+MbH6RyzajLcaJAvp27Q8+wTmuubaBFCRagsImmeyYlFpt/?=
 =?us-ascii?Q?5yqv6cgrdsoXYaBjoKxN6h2q+bLoUa1vj2WvJ1fKyCqtUBsiIDfBc5OmWInP?=
 =?us-ascii?Q?F8jc/7YJKvo7AjD6MoMZXStSH0ZSbt6BJl0c3jkx1X7Y1nVa0920N4Iku7wL?=
 =?us-ascii?Q?2EtiLINVk6KcowJzGi9hB4blflfQNDOrP1H+5dO2BKEYZWFf/hdNjv30dyC+?=
 =?us-ascii?Q?gboJbSpxBNBuPYrlTU5ydfSHSnpxnD2LUnxtEngrJjsxRlix1wkXCyxYLXyO?=
 =?us-ascii?Q?FkysiyGPSQ/mz8s5FCsTN95uoX3wrJwDigXoaZD//XThduo3d16d0KjWfTpE?=
 =?us-ascii?Q?2VXoeYRWyBFyQr/+4cKA2E+fa5HtcsBRbRtk/peDdLgGk129n3ZIkIprNMGz?=
 =?us-ascii?Q?C//ctfH75ZARImI1ewyJGKT8LjlbpPUVyfOx71QLt7SxXw1y2vtSpC2KuPug?=
 =?us-ascii?Q?c+o1bLpCc/ADJhcw1z0JTapN4N47Xln8idJCJdvWVzTBiCDqs7T+MHvCXhQL?=
 =?us-ascii?Q?MjnHRra32Jv/2LYja9tHLakyThC0KyLbRbWLjR2Dw9er+e7f0FrZ+apEj79U?=
 =?us-ascii?Q?JnOA6lJyXIIRZ3KZY2SSPaDAwj10cNDw1cmIzZk+VUM4r2KHytYg1Q+wcAXo?=
 =?us-ascii?Q?FGURibEaL1aN2dPwdgM=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 12:27:43.9937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d50be2e1-4673-4f58-65c3-08de2db05d8f
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP195MB2210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_042752_299059_66195C4C 
X-CRM114-Status: UNSURE (   8.74  )
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

Reduce length of dma-names and dmas properties for icssg1-ethernet
node to comply with ti,icssg-prueth schema constraints. The previous
entries exceeded the allowed count and triggered dtschema warnings
during validation.

Fixes: e53fbf955ea7 ("arm64: dts: ti: k3-am642-phyboard-electra: Add PEB-C-010 Overlay")
Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
v2: Add Fixes tag
---
 .../boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso   | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso
index 7fc73cfacadb..1176a52d560b 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-peb-c-010.dtso
@@ -30,13 +30,10 @@ icssg1-ethernet {
 				<&main_pktdma 0xc206 15>, /* egress slice 1 */
 				<&main_pktdma 0xc207 15>, /* egress slice 1 */
 				<&main_pktdma 0x4200 15>, /* ingress slice 0 */
-				<&main_pktdma 0x4201 15>, /* ingress slice 1 */
-				<&main_pktdma 0x4202 0>, /* mgmnt rsp slice 0 */
-				<&main_pktdma 0x4203 0>; /* mgmnt rsp slice 1 */
+				<&main_pktdma 0x4201 15>; /* ingress slice 1 */
 		dma-names = "tx0-0", "tx0-1", "tx0-2", "tx0-3",
 					"tx1-0", "tx1-1", "tx1-2", "tx1-3",
-					"rx0", "rx1",
-					"rxmgm0", "rxmgm1";
+					"rx0", "rx1";
 
 		firmware-name = "ti-pruss/am65x-sr2-pru0-prueth-fw.elf",
 				"ti-pruss/am65x-sr2-rtu0-prueth-fw.elf",
-- 
2.48.1


