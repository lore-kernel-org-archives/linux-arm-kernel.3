Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA9ED10395
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MwUq4cTmpZZJm/Ew4nsYLGj6tDmdX0bQ0mxzwix+iU0=; b=U5PWOLzI3KRnRsh5x815kCBoDO
	293Gi1yNS6BkByWvxTMxGDvcVislNPuNR8kU67JZyhSqDw4cAP9mny94ZQSBf9V06fRRu09vxse21
	Oep44IjsQwrTqoiV2mh9MzpbzZs0Yd1l2bHLl3kCGY5hQ0z2ujj5PySOhR6taq2RDEZkGyyiW19aL
	mfi6RVKjoF+cGjB+XhVIr5E0FJWNejpWPMzlGyBOGGlaLNH77/Qhngurea6fzhqumUP4mg68xJEvs
	ddKJ6PflBxRlLScVHw/qM496lmwFEvNBcTFc37lv6oiJ4Z+SQk3RIYBhJo5FeL7xs8EVbsVFjnc8T
	7KZcu9WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOB8t-0000000EdRe-35P9;
	Wed, 26 Nov 2025 08:44:51 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOB8o-0000000EdPS-0PwF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 08:44:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGgWxsjUtDK/qmp0MAN1MPsoXTVwHmqGhbskZ/x13x5Ve/wfN0kET6ui1NJB3LEmVAp5yNuEY5Zt2zkd4kfPRtQfSNzMUhPC48o8VereMBKhDgofJiD1GLCjrmNjBa4BR0hyCtZX+DBhx3Ru9qw41jpj+AM53bKQ9EFf63kPMYsgJI6EhxW9P+lmMLokIT5gisq/ENAGft5iC8FWzApeQduDL2/ilwcvQ6IFNLQioFE0ALS806P51E1EC0rX7sWh4YCtZ7oM65xkcaxmAvfSAnZnq4Yhv8CnKY5ZlMwsk3wcV/2fcrpK4c5b1W7zBLhoc95UUK//w6IIcNz8CXYLaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwUq4cTmpZZJm/Ew4nsYLGj6tDmdX0bQ0mxzwix+iU0=;
 b=MKg3adoIA2qrUQx+hSG1PLxmpwkyW2SzMtSnZI2xWzoUSGLQYQXuwhjnPpz7QPgM3RYgnDzs6lMgzw5/zi6nWCNnefz/z/HS51QKFJyUU6QIK7Map/CRuWjU/Wb/8mN/cMONf1+rpdifuwq5uVK2rs+KCVmK2Rls+ww4HhEvKqd+OABtNPW1OUdXnJpgz+PoNx4/0YVAB+fHiYT/vyRpBZje5Td+ufl1WMZh6Y6kmw5e3wEroLOd+g0G5pdP7lVcfyUwW7FUDtelEGZKgCxd+CPU5GS0ddacrHOe2+mznCHlPkEhrLTMWx4hTVSj66uJwXr/bN5dc3A1wLBJaknO6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MwUq4cTmpZZJm/Ew4nsYLGj6tDmdX0bQ0mxzwix+iU0=;
 b=j9jY6SDn+DNKbneft5nqaACmlt9P6tYktJMUcN/8oPppVwhL9r7Y9kxhWuf1EbfE1wzQgj1bHJgw/hi4pg7f7Kjt6zT4l1ngMKXeoU+wmJHFCG2aUxaX5YQD2YmcKSl2tU+aPBSz4v0rCScP6q+A5AgzGIhmxIlloxUcF/mCAlnKYUXWtGwuaGpB01lWbK5PEGFriyPq79VSc9eqClbNp9VGxO5oE6kS8ZmyQi3kcpiqBd/BhFHn/wTKYc6++6DrmYaGBkbGUEOkpkCb75MSpAJJguDA+SvTZ4vhcuz9OCzFYyGV1XxwInToiibiDnuv3hCeJZzvaWZ8bqViqHD0SQ==
Received: from CWLP123CA0211.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::23)
 by GV1P195MB1617.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:60::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 08:44:37 +0000
Received: from AMS0EPF000001A4.eurprd05.prod.outlook.com
 (2603:10a6:400:19d:cafe::f3) by CWLP123CA0211.outlook.office365.com
 (2603:10a6:400:19d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Wed,
 26 Nov 2025 08:44:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001A4.mail.protection.outlook.com (10.167.16.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Wed, 26 Nov 2025 08:44:36 +0000
Received: from phytec.de (172.25.0.51) by Postix.phytec.de (172.25.0.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 26 Nov
 2025 09:44:34 +0100
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH 3/3] arm64: dts: ti: k3-am62-lp-sk-nand: Rename pinctrls to fix schema warnings
Date: Wed, 26 Nov 2025 09:44:03 +0100
Message-ID: <20251126084403.24146-3-w.egorov@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126084403.24146-1-w.egorov@phytec.de>
References: <20251126084403.24146-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A4:EE_|GV1P195MB1617:EE_
X-MS-Office365-Filtering-Correlation-Id: c26a2b1a-3d3f-4cbe-76ab-08de2cc807ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5qFE26il2CL6+76U669JhMm6SM27frUZKv1QKrOWPmujgcXdBw5H6ETUNq6W?=
 =?us-ascii?Q?6rDZZF04bzPBd5RZR/j3DhfVjUyvHetIIFSK4zuVlim/7gHiSqhjn6vz90uE?=
 =?us-ascii?Q?W4oPheEfHPWcqyzggTkK7s35qdg20QjxTzekppegmyf/K4YRadikPDtgWTVy?=
 =?us-ascii?Q?HzRDBev/i82GMWc9HILLj92ka4z4JeMCOAbYby4tfeFHWz/pENaACi9WvNmS?=
 =?us-ascii?Q?CRgbP3IodkUdLUWzoS3Ux1a/PBgoOw3NmtqURfiZrS21+pp6DjLBDk8CQE/r?=
 =?us-ascii?Q?TzGWn928SXQAD3HOyqZVF8ZkHc56ss7U5E7I3g/hvji72ev3BOUAx93ty9Js?=
 =?us-ascii?Q?UkKpWp/Yn6irgtahqle4vznhyQa+Y/30ipHVrq4/Jv5yXSHT7xfcz0Gbb97z?=
 =?us-ascii?Q?MLKSg+DAs23AfLitAVQopxFvIIF95RZdJuaknh2ylpDGte1SPmiR5l9FZxGI?=
 =?us-ascii?Q?7oeRqu7WQ8P250pnoQPswdo6N2ddXxOv4F5oHnzIkLiNaRIGoh4E2MDLUi/p?=
 =?us-ascii?Q?8kNExNIzMQjfUZ3v5mwrL1nzVGeIvnZs80x8+4neSeoucug/wL7eSlqFxfrT?=
 =?us-ascii?Q?68bobf9TO+vVbVQ9K3gFgrcNvuCnZI0nR8ZcPs9gEzL2B/iLwNzBTOpMMXKB?=
 =?us-ascii?Q?Kmp/ylIz2rZz1jfhcmqdL6b6q9xRf1oqpIJL+lrRoBI83bZU8geuvMzvEEMb?=
 =?us-ascii?Q?vi8qU38WtAklPOvgwxQxsuiVaVuGIQ/ogktantv9adwwhSVKwbnToBcpkCfX?=
 =?us-ascii?Q?yRXO3szpFZKLnk1wraZSSxuEAheMi2YtoA0hm3gYYuO/VF7PTt8H0Q24qs9X?=
 =?us-ascii?Q?UQk67itr/RSIYGun5vVNhct+IM9Sg2OsrSD4S0oDtS44X2zDOqHQjhE+AfYi?=
 =?us-ascii?Q?cBhq2JzH4hbKOl0Br59p4cx30bDEtdywrd3IkCRsor86HVqlK46oUhj5Pf7v?=
 =?us-ascii?Q?N/2/AjXd+/lIBgYrDI/qhg6MA2nvm9AZwIL1fwsur/xsniR+72dxP/VNQ33F?=
 =?us-ascii?Q?82nC7Q0HsbFw6S7KdRjKvwVn+WPQuy13nH+iLRViaHe2lxrlMck1DpGF7W/9?=
 =?us-ascii?Q?IllHL1mt+sMXelc2zy8m5VleSWS3DR5caMJ/21ufjMlaDucRmrLKZ0JiIOSi?=
 =?us-ascii?Q?xfHpGz8mAkrdBEm+BzCCgq7hFb0zh/9Jp3ZBMKYzjLKQclFgIPbZ+tOflYJ2?=
 =?us-ascii?Q?qhtvOJyqBGZpBD42INrq/UByQywaioNI2iiXzhsbog/RZ4XI5XZQ4iiKfaHx?=
 =?us-ascii?Q?+WKC0jaHtCHY9bmsIqy2oudCYYxXJ7VnaEQFabGfaa6CpSUBUixFRWU7BctB?=
 =?us-ascii?Q?W+5zh6MRZGw4LifnLe3pMM/1+obTBE37qJe5At9k6fWx9v6xMvP+l5eM17Uf?=
 =?us-ascii?Q?OfRQ91rNUVYWdAodcLGtDjgm6Kel0dIAyOEV3Q60dFvWD//CDvDhbH+PrWtQ?=
 =?us-ascii?Q?Q6biwZfFaxypXovzpGlYcpnenxdSxP2SNGkPlwOPmlArSuJ55fdUmtj/8QCO?=
 =?us-ascii?Q?BX0IpSoDs/pkdvN0a73xAsr1PcfgscpyXUd7jl7eDfK+AEa+1WhDcRUjLeur?=
 =?us-ascii?Q?rsg5pAPQHZG4f8xs5vs=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 08:44:36.6675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c26a2b1a-3d3f-4cbe-76ab-08de2cc807ad
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB1617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_004446_137106_B9EE12DA 
X-CRM114-Status: GOOD (  10.49  )
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

Rename pinctrl nodes to comply with naming conventions required by
pinctrl-single schema.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtso | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtso b/arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtso
index 173ac60723b6..b4daa674eaa1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtso
+++ b/arch/arm64/boot/dts/ti/k3-am62-lp-sk-nand.dtso
@@ -14,7 +14,7 @@ &mcasp1 {
 };
 
 &main_pmx0 {
-	gpmc0_pins_default: gpmc0-pins-default {
+	gpmc0_pins_default: gpmc0-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x003c, PIN_INPUT, 0) /* (K19) GPMC0_AD0 */
 			AM62X_IOPAD(0x0040, PIN_INPUT, 0) /* (L19) GPMC0_AD1 */
-- 
2.48.1


