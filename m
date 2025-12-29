Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AB0D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 14:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puThyK3zA4CcndHOvIZCGH6RxjnQrNKfmjAmzy5CtnA=; b=ics9/Pu+GmMvPHHpJRslhn51lF
	evcnWU/KueBMcUt6kbg0xfPNEAB9Auldrsxu27B+HOX3/BLCkMftKg80bkdXbHaGLBsKZjwxIEijo
	p/2aP3SydlLi3F2HfGKDlnN8VoqdUxlHsc/QDJPyWHoqUvCbVoljpep0TnB0P6PM3AsmReGsjhi96
	CCfAM2kyAPvOUvmArX+PQnNuDnd8C+fUTjN9zNEJ5ngAC6Xa48EP/F9HnX8QRy0mUo/UfybAR+q4S
	eVeAImjlNDj4gfODJzHHoJo8ZYjWLp0NiCWJa6BTUV1oTWl4S+zcvzLFCPUoEU1yFD17W7Z7P6ueT
	EoUsYEQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEZk-00000003ngC-1x7z;
	Mon, 29 Dec 2025 14:50:26 +0000
Received: from mail-northcentralusazon11010059.outbound.protection.outlook.com ([52.101.193.59] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEZZ-00000003nd5-1xGW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 14:50:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhsQ/oQPlsbI42SEViMboer4AlNwUg0BclkCkrer7+FwxcyBbZIesMVj4fhpL0K1ePUFYhk6mMeZz2o4ourXzIsnYC8u3tT2K/y/5dBeK2drCnRDPt97fkUZFBJhoZrt316sX906+LoywZfb/wp8Sg1bEix+BSB/aSsB/vFQvoWUqPm19WhSOSiIESx6ZT8vF9D1WUSgFtIxQEFCC0apcHVAd5oF/3urCwJU0WvLlh4h+RCHZNTPRJrva+vTEkkczGib5jXCgnorwxTeM3Rw0w7a8pQ0eq6rFEyVEPA/Ya0fDlLq+/7N2aPB/L2cmE9r2yGyJGdqJvOze0SGv68wiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puThyK3zA4CcndHOvIZCGH6RxjnQrNKfmjAmzy5CtnA=;
 b=K9JenpNqHrr2AorcsW4+Kt7I+g/P7cJFw8jeJxcIZc+fWCHuRte00EP3hcHm4tj12qvYuww3SbJV8P45xRL6wZxJahA4A/RNsUBBzKoP9XzqiVfXF9BsXRpjYqFQaKaLAYCcJYES6BV7sKspVnrHUOluvNx3O6ihsIpHEmeQWCDzNJUa1ZogrXbPqcc8EdYPdH7M7nJYNKSlE9i4/GMaoUgDF/XuCMyIfjhWf5i/DvmqoEeeB59ls8ls+vE/H4m7EpI3oLIlWapygu3PMvKcy4zJyP3FyMbaoUQ5DmFVo/3Yx/Q1qQLbiy37OWkUvo4sC9tC42YRPefrmlBWX3nr2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puThyK3zA4CcndHOvIZCGH6RxjnQrNKfmjAmzy5CtnA=;
 b=IGJ2pnmppP7NHoTcNmCZrcySHzlDYkOzGXmepVEGoOEnIlRFnGu7PAcSjef+ORc58BvY/1hF1IJa0OYPhcY0mdL/fuH/5HK3fKRHSe3KQ5TAu4gddo73mMvqKuzQRQo/GlKW6VhLhpqjn1vsM6WSwwCljfVnVA+YqN7JFTxppiqEYizDYrMhhyid6sRcs51atCgpF1F65JUQ9o6ZJHJvaPZM3EWjOIfSSeSAV8MQXpIAyJ9WZ70qxZuCJHUIKo468ftmuVAG9kdl6aDqq7QMpGGmObN1R9I+gASr1i+qG0LKnuXEoNOIrUv6DrOMjZCUNPaOVWHkj/i3Do0EWp5f2Q==
Received: from CH2PR20CA0003.namprd20.prod.outlook.com (2603:10b6:610:58::13)
 by LV8PR22MB5749.namprd22.prod.outlook.com (2603:10b6:408:263::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 14:50:07 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::19) by CH2PR20CA0003.outlook.office365.com
 (2603:10b6:610:58::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 14:50:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 14:50:07 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id E5540E8F49;
	Mon, 29 Dec 2025 16:50:02 +0200 (EET)
From: Nandor Han <nandor.han@gehealthcare.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	nandor.han@gehealthcare.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] watchdog: imx2_wdt: Allow to continue in low power mode
Date: Mon, 29 Dec 2025 16:49:59 +0200
Message-Id: <20251229145000.421426-2-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251229145000.421426-1-nandor.han@gehealthcare.com>
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|LV8PR22MB5749:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e4e293b6-5d38-4863-cb63-08de46e98f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e8SHh0ZfvCYv6gnkd3C3pYw8DIemFnOr/vQG43aCt6ET+BdlcFYROigJtLzO?=
 =?us-ascii?Q?IiIoALNIE1qmpfRBlMqivuJHQxBVnxXqFbCIxRkWeriYJ8XqJxo2uBh/GVeg?=
 =?us-ascii?Q?QViD6/3PwLQTAUMRMI3PCeieHBLbPqrrUrfsEs06D0syNPLAq4WFF5rZCEVL?=
 =?us-ascii?Q?HFWPQ3D735s5vjN3spsQnY3t5nZhBpnUsUfwwSOYQ7TlWKnQYavwcUGZj7Wr?=
 =?us-ascii?Q?1I7cBZaoJeTzoOfp89ddL+VHS34NtWHqoPtS4aSIdMH6xTOJsTVz+6ux2bo5?=
 =?us-ascii?Q?DaZ25LsCg/P+C0kJ0hG0u9AQuVLQE/7+pnkPWFynkRkElunEHsdGRMMaEwze?=
 =?us-ascii?Q?yQNIfg+gxYgnuYcgpEqFkssBUEs2uw/r66vJNqYgU+fX/vOG6H6e39GsSdut?=
 =?us-ascii?Q?u7ve8fdj8+xzsOwkHnOznisxnzhTiUBk7rMznYqG3hQ5i1/XNRGlO7pFO4LV?=
 =?us-ascii?Q?vaxfxhcfbb3d59GYAkygM/4z+irg42bnfZelSCJ9yLg7mWK/g53tBcBhaCBj?=
 =?us-ascii?Q?hjSIHQf+0Ra5r40uHI7e6oroJxqeWhDP3HPbTWyn0qqo7F8tZFuCko+kduAs?=
 =?us-ascii?Q?EEirkt8JH5V+4esFOgaKxWuqVV90De2RdaWAtOTyilHtL8kDNC9HKoFPWWhf?=
 =?us-ascii?Q?sSKpG0SVuec8KltMerp16acEZnJDmMqs5NAMGjbkL/EHA+TCipOKqjXlZdaz?=
 =?us-ascii?Q?VeQgtnNJd4fY8zCDjVRo7yAsHzgZF4cQso1hhf/gqbFtfmERrx33cDw2Mt4y?=
 =?us-ascii?Q?/Tq1a1+Sq1Fgom6KGUyP5ieUx5l6LHpWqbjiwvgxD3i/gtdn7F3gW6hPPGa3?=
 =?us-ascii?Q?uCOxgWGNwnPEgsanvlea4kJgnrEJZmmoothlqQJpB4PYy71H/3gz/+55GDsY?=
 =?us-ascii?Q?kXiUwWu4LqcIXUG4SdIRNRgUMhDm5rA2c3YaJE35Elx3Kd1OG+JC35E2NPEb?=
 =?us-ascii?Q?Te0ksI5k8pyA9kd46E1G2XDpS2SVWeh8ivyBnHN+8E53ZzFCexy9unosfp+N?=
 =?us-ascii?Q?VQHNPJW+50OzbgKexLCUW6IwlFWa0m4cuPRMNHVMMw8DKD0iEhlF1AUuFZrY?=
 =?us-ascii?Q?doV5G29c6NTWOIKpR/yfcTmyoR6IjHFOdRj/9jqbWGpHEwFQLwe3t99OpbHX?=
 =?us-ascii?Q?cG7SSx3rdyARPlZ1caJR97sBsinrr19lCOSFI+Cta7sdj/jeov3PduLIKHTy?=
 =?us-ascii?Q?+b47m9deP1OuvUYdKWcSLO2/Ral/GcE3CziETztyU5z0jPc5zf8pJ2uSuRnc?=
 =?us-ascii?Q?Cnyh4pVhhIwnX8GYX9CGbV1cit8ity6gMsZVU7gHE5SzLcKoTpH8/M8FI+/q?=
 =?us-ascii?Q?HO2Bd37SvdhoPaeXhC2jB4mbwEad5HIlyrxqV/QHbyula5Yx9wjZnyG4ZfqO?=
 =?us-ascii?Q?VWhCcx2tWe2snmROcWsAxdYa5q/Vrs6HY5T5gZ5xHyA9lzFX17Dal0eQt8t9?=
 =?us-ascii?Q?YARzJAxRljKQPA7W2Ni9X5iErsk8e1Ky6bL5FcjLTvOhaId+d/UXGKB0Wbhz?=
 =?us-ascii?Q?NmHI0EfpqAQ5gMvu74wUk6vZ1KZCqKJ2hU/cfgONSZtL4sfzdCwmcj+a9yBn?=
 =?us-ascii?Q?+M80ReB+3c1w2fyZ9cc=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 14:50:07.3898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e293b6-5d38-4863-cb63-08de46e98f1a
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5749
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_065013_507169_C69ED0A5 
X-CRM114-Status: GOOD (  13.42  )
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

By default, the driver suspends the watchdog in low power modes (STOP
and DOZE). In some situations this is not desired.

Add the possibility to configure the continuation of the watchdog timer
in the above mentioned low power modes.

Note:
Please be advised that the difference between the variable name and the
device tree option has been intentionally selected to uphold the
prevailing driver functionality. This ensures that the watchdog remains
suspended by default in low power mode, while also facilitating a clear
and intelligible device tree option name.

Signed-off-by: Nandor Han <nandor.han@gehealthcare.com>
---
 drivers/watchdog/imx2_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index 4b3a192ee3e8..6e837cfc3c5a 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -71,6 +71,7 @@ struct imx2_wdt_device {
 	struct watchdog_device wdog;
 	const struct imx2_wdt_data *data;
 	bool ext_reset;
+	bool wdt_suspend_in_low_power;
 	bool clk_is_on;
 	bool no_ping;
 	bool sleep_wait;
@@ -135,7 +136,8 @@ static inline void imx2_wdt_setup(struct watchdog_device *wdog)
 	regmap_read(wdev->regmap, IMX2_WDT_WCR, &val);
 
 	/* Suspend timer in low power mode, write once-only */
-	val |= IMX2_WDT_WCR_WDZST;
+	if (wdev->wdt_suspend_in_low_power)
+		val |= IMX2_WDT_WCR_WDZST;
 	/* Suspend timer in low power WAIT mode, write once-only */
 	if (wdev->sleep_wait)
 		val |= IMX2_WDT_WCR_WDW;
@@ -326,6 +328,9 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
 	wdev->ext_reset = of_property_read_bool(dev->of_node,
 						"fsl,ext-reset-output");
 
+	wdev->wdt_suspend_in_low_power = !of_property_read_bool(dev->of_node,
+						"fsl,wdt-continue-in-low-power");
+
 	if (of_property_read_bool(dev->of_node, "fsl,suspend-in-wait")) {
 		if (!wdev->data->wdw_supported) {
 			dev_err(dev, "suspend-in-wait not supported\n");
-- 
2.39.5


