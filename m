Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F17CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 08:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gO0U6MzhuRChdzQf7y1bYxEqbwv1eEZdyzPgmDuzFrk=; b=I9+aH3u5c/3H5n8e5iB0gdpnpC
	KjgYPkrq+UJM8ALdf1gE/N5zcj6VK87f6COnX5+0lYzee2HCx47D3BVgaBno7/6QRvLP4Guk5hLE6
	IQWm31tiLUbps4FIeCndez92k+yaESpdCCdvYETwrcPTPCqjjTGp8n/5tZJQEBKbUJQlY1VfLY86W
	sFpEQhEvQ1sBOUw0jCf9Md4WKwRG4BZG49tcWTil8FbQBlUqgK4rsK/rrqu0e9bzEUpe+Y68XZ+Vy
	yM9WDBzJkZYxPhJkF4mkOwAEqGnbqybEqnyjwbo92sg1fZba5xwFEfRhJ4+tuCdsFPduEd3xIxoFK
	rfoHhbKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v62ol-00000001VW3-2bQV;
	Tue, 07 Oct 2025 08:13:07 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v62oi-00000001VSm-1V8Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 08:13:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hba33jArrB+Fo/1YZx1gIVk6qKBK40sWSW28WfQgfsZjetGWG/3ltzsUx1WNw51gX2GgmriYe03iEPOb5xWPjUlGx/sVm/f8Hv+CVvb7jTfh1oMnvRQWv7dNoFWUlELmZyCnZbVSm5Ho0Il+dnwRPcy7vbAvfk+iakj68gcD9B8OyfSBB/MyEKJus9CRt8Ki10tkNy61JXDRivFnXk92k0DpUgQywJGtWatsAet+DXMJV6O0crLwoXen8PNgDGjNlgoEU+lRqal4M0P/cC14O6ABcg+q6CAjci9X1Wi//kW0E84J24iCZxuFhZ3n51oClnA7vkbkIEPs+IsWOYGtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gO0U6MzhuRChdzQf7y1bYxEqbwv1eEZdyzPgmDuzFrk=;
 b=spdtx4ku60OK8vd47G1J/J0TuVvdqZpd6pWu5LFrGpLBADDBWl0iKih6bWajDDl9wuFrU9CyR1Sph9Nohmk8To7Sk6zGYrAC+EyNwVXMhVJIWyF6j0NC5XQUFRy5f60u36OBtw7JhfzI3t8QEjnO6AWiAEgQmNR9JJ1kaIzlPCnB1Mnyk2Ni1dj9Zn/kh12L2RTWIDcn0sOlqxKPeOtpRy6CTcXo3E/Ts6Rqsv39ybIYDgJ1PVGMS/3c8JVRpUB0BxFJrY0OleGtqKSjbKpA9Fbg4Ide1jx4kHvCzZj+b54Ut6dR2AsHzUEwaxORy57YqyTcr5v/zsh4DHPDqwRnNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gO0U6MzhuRChdzQf7y1bYxEqbwv1eEZdyzPgmDuzFrk=;
 b=SU+WVzE6hOMezI8iU5h1oeWL87jFKZc0/IsVjyWEAWKx6IgHDbKsDMrFJQLxHy9YCHBzYmain/U/LD3tYnmjNg8/CumyoJBKJ8SgByWTN6s4Fy26SdYwgKNauJDjqR60D6NQhauQKMPGbwdAS+ikaKusWzFbaZn0fZI+yZ3Ghlv8HqiSg7djf7ckrF46AkE90s1wjoKPc0NflTD/UUH2v1W83kDODjkszcHp6NFKf7HBc7yvabyPBLuK8snW9y9/2XRZYRCDNb3dEb4O18SGG7r0z2B1oMLVgRSpEEk9GQVnsWycvbrnGHQKDzXdfgJYqPquY4n7KlMR1FWtdoaCkQ==
Received: from DUZP191CA0012.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::6) by
 AM9P195MB1188.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:3a6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.20; Tue, 7 Oct 2025 08:12:56 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::40) by DUZP191CA0012.outlook.office365.com
 (2603:10a6:10:4f9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Tue,
 7 Oct 2025 08:12:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Tue, 7 Oct 2025 08:12:56 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Oct
 2025 10:12:46 +0200
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 7 Oct 2025 10:12:31 +0200
Subject: [PATCH v2 6/6] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Fix
 audio codec reset pin ctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-6-7e5de62c79bf@phytec.de>
References: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-0-7e5de62c79bf@phytec.de>
In-Reply-To: <20251007-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-0-7e5de62c79bf@phytec.de>
To: Teresa Remmet <t.remmet@phytec.de>, Janine Hagemann
	<j.hagemann@phytec.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.39.81]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EE:EE_|AM9P195MB1188:EE_
X-MS-Office365-Filtering-Correlation-Id: 42e66a6a-25f8-41c0-1a09-08de05795247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDZ4akFRS04ydkxJbHhRMUtpc1lSR282S1pnc3VseXA0OEFEem03NkFmZVFn?=
 =?utf-8?B?THJIQWJrTHFERXBQTGtFUlRCTnppMGtZQTJxeGRxZWRUMVlvS1RCSVBndjUw?=
 =?utf-8?B?RHBneTkvZzdnaStuNzlRZzVzYW1WYW10YllkbTRJUVQ5VVM5Y0tEYVhOOUxy?=
 =?utf-8?B?SXpNamhJU1Fpd00zdTVkc3VqRlRkRGhJa0JmYkxTUnFhZnVxcDN5Q1ZSdFhH?=
 =?utf-8?B?bFNaRkJYM0ZCbkw4UUVUY1JGZVZORmpKZjZ0TDB2SWVZMXdmekk2alBWRHd6?=
 =?utf-8?B?Ry91YVM1NDlBeHdkZlZxckY3bFZ1S1dsc2tOZmVkM0srUWhwRGFhcGFvVnQv?=
 =?utf-8?B?UXRqOUw1K2t2d2huTXN4bzM0ZzdtMDhKdFJ4VTlmSllvWnFnbWlOMWViU1o2?=
 =?utf-8?B?blI4OWFQM2RBdnRVWEdmQnJpNlorZzI4WWxJdzhrVFNYYXFCWVpTOGhMbzU1?=
 =?utf-8?B?bXNab05ESm9CYy84NzVUN09nMVNFT2ZBWlBNdUtwS1FjTWhNRDRlRnpkakVB?=
 =?utf-8?B?NXo2SUxaT3M1MUZxc29qeUpvRG42NVZQL2k0a0ovUENDNldiTzdYTkNJZjhO?=
 =?utf-8?B?TDQ5S2c3U2k0aFNjSHpxbXdYZDRxem9IdlFQUHZSYk9Rc1I5aGd0allsblpO?=
 =?utf-8?B?OHJuKzk5dFo4WkVlcVdzOFpqd2wwbGNwVmFYR3VkUFVhK01UTWtVUUxtTzlp?=
 =?utf-8?B?aDlJN0N3Q2E1SUdSOFBLL3puS0dtMXdIN2V5MURDdWloNGUzSGdrT2VsYW1Y?=
 =?utf-8?B?Z1dEaVFmZ0thYlkvOTBOc1R6NFNYV1c5dlBhSityWG45aHdkLzduem5pSHQ2?=
 =?utf-8?B?YTVzamR1R3VkdVFzYUYyelVZUGNIalFZS0tCUlhkdGRyOU5jZE0rK2MxS1Ev?=
 =?utf-8?B?ZUNrSldjUTlVRWlNeWQrMUpFRFMrM1BQMkNaMlRla2hIbHovdzE0WW1GUk9x?=
 =?utf-8?B?Y29SbnlCRUdVVithZkNPMjJuUXJLakZWd2tWL0dYL3FQdkdaRkhKRlJqamJn?=
 =?utf-8?B?aWx5SHNlZDliOEo5WmZ4QkVkVW5sOEMwd0hMUXZNL04zc0FqT0huR0FJNkNu?=
 =?utf-8?B?VFRLV1BIaDg3U1ZLTmhqbU1yOUxvLzlJWFZvdnJwZVk2b1M3ZHVpQlQ3cGg2?=
 =?utf-8?B?SVNpKzZweGdhR2RiZEtCMEx3ZC8vRGVBUzdkMVNscGJUaHlHQ2QvT0pSZDQy?=
 =?utf-8?B?c2VvSkNRemlLaGkreldpVXM4cTFPb2Q3QlNGOVgzVzFlN0NTVHkyOUhjVnFC?=
 =?utf-8?B?eE1zczFjVG0xdkV1VzRMQXlMNnFqN0hiaU1MMzNVSlgvZVVLS2NxNTBkazhw?=
 =?utf-8?B?dEdXNTR5OGZFUDRUeWV0UFVLamV5NXZwMEdQSVFMWUhabVhzbmxHZkJrUzRU?=
 =?utf-8?B?VzdLZHJRUHI5eVVCazlMVkg5b2FnVzBOblRtWUxFNU95YVZ0TWZZUHRid2hC?=
 =?utf-8?B?RDlyMUJUdXo3K1NUUC94dGQvakdJOFZTVEZjakJYZ0JCeExTVXk5cWgyRXZU?=
 =?utf-8?B?bW94OHJkbDN4ck9OcnZRTmtqWWpxOGhlTUJnMW01MEU3MFQ3S293a3pCdDA3?=
 =?utf-8?B?SlFFZ1ZXejlnb204OFhiSE1vUUFRYnJTeFVIQVpIbFZMdDQ1a21hNnhmbnlR?=
 =?utf-8?B?K3VvRDFHajdNL1JWODlvbnBJWHRRYnNqVCtST2pYZGdkdFovRjM1bkcrUXpt?=
 =?utf-8?B?K1hMNmNhZlp4ZmNHRFlud0JDemlUdnBNWGNQUnA4OCtKWXZIT0xqc21SZXR4?=
 =?utf-8?B?QWNqd2M5Mmt4bDhFMHV1cHp1bmJncWtVVi9rY1R0VW5TNm45QU1JSWNKeVJl?=
 =?utf-8?B?eCsvWXkxeXJsKzBieGU5NWR6NHQzQmt0V000QTlBZC9PVVhDanU5Y1dPM01K?=
 =?utf-8?B?YzgwaUd3aDlFblpHbGhNMmhBdVo4aytlb0hwQVA2TUQ3ZnJPZUJHUlVqdUNt?=
 =?utf-8?B?WndNY2Q1cG9FeGRhalExWktVMWZ4ak9FNE1ueVY4V2xJRmd6azIvRndFdERG?=
 =?utf-8?B?aktpeUs0UHBxb21kclBDRzljZ3U1VE1vaFNuU3pBVldCeGlwaWVOSDVTbE05?=
 =?utf-8?B?c2NUc3ozVGlSQWtubCtOVzNieFJEL0M5YmlHK210YndGcU13aDFnaHhUWGd3?=
 =?utf-8?Q?UmGU=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 08:12:56.2045
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e66a6a-25f8-41c0-1a09-08de05795247
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P195MB1188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_011304_412551_7553861F 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Teresa Remmet <t.remmet@phytec.de>

Enable internal pull up of the active low audio codec reset pin.
Otherwise the audio codec does not reset properly and is not working.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtsi
index 3d4ffeecb8dd8e6f7a68eeafba761534fae9deb4..bd1f255e15ea95b6f59e2c7bd762d6a6a2b4ab76 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtsi
@@ -182,7 +182,7 @@ MX8MM_IOMUXC_SAI5_RXD3_SAI5_TX_DATA0    0xd6
 
 	pinctrl_tlv320: tlv320grp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28       0x16
+			MX8MM_IOMUXC_SAI3_RXFS_GPIO4_IO28       0x116
 			MX8MM_IOMUXC_SAI5_RXC_GPIO3_IO20        0x16
 		>;
 	};

-- 
2.43.0


