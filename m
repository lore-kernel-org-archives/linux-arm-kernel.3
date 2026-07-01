Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A961DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 13:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDxdav4fX4qV6W/U+HIcjUz3W0TwsXcKCemC+r5VK2E=; b=rTO0/Vf9Djqc+fleD5eQgzHERW
	bD7p1CjxX6J+04jXV+POOTCi/lHfnraMgcaxS3qImT66Fc6SXVHtxH3vSHGyyMy2Mic+UdqLOhAVQ
	hvwH4A6n735rshqCa1ddSXES8ua5jxh4oFT3DJq5XU4LxBPjLXn2oFU2Gl2mU5S3Teklc6m6rV99y
	F6iHsf8bnnJ6WCb5utZgwVUVPPW7GQP/eI+5wa1cYHsN1OU8fdoFbTIHsStAi1ADXVOrjgOtnRXAI
	9c0jDXzUvWidWLUAT1D3xv2bVuxjwHqasJfrhd1O+s6IY5GHaYKRjPkZ/XnuLj2vKszQXA8hrd8vr
	FeYMe4dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weujU-000000028s5-19F3;
	Wed, 01 Jul 2026 13:12:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weujS-000000028nv-3HBj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 13:12:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nDxdav4fX4qV6W/U+HIcjUz3W0TwsXcKCemC+r5VK2E=; b=qGRT8vuOqwA8cVvSPvysKdNwRT
	2xZIKo23p1+n1HkyfANmqthOhKCSye/R19Wu18jEmbAoHL3jg09QW6dpIZ4c0CZsBhSdglQUt+juZ
	Y3auChufTMMWeYULjz2qo+fnkP5hoCIXeX4nckX7zubBHlsycEStQZFmnm/bh88F8svAU/dtmXfqJ
	oaVKPlt/dC7P14mbdk5goqukQk2QZI04CQleZPnWHKoKrIHCdoIRBB8Fc9pwi3kyV3TFXYKYyP6YK
	FTRvSk8zctZoCSuTLb+XJRCgqn55MzRhlIe4IWpApGk8uWpA+mVNmpDgNaqPg2AqoNVge+9M/7kGf
	/tRg/4PQ==;
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weujP-00000002oQn-1NLV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 13:12:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byUkgx44qGL1nY/oveJtaWDAxeTvproAdbHhd++CRA+45uIrRXlgcxp2OVRVzoQitJ9/mbF0Ikdb/cO1lKovB9fue4cw5h5fVW4jQz+W5SQUNkf3MjfChoGfjNnFqQG38vp5NEwm50OLSmT3AQbd9B3sjIPn1S4+q1/zOBpclGNHcPQK/hKHmLKbh+9RCEQuJ2quClmOhrhol2xF+sG4KpxWlFIf00ybDpx0FkDL9POEaaZPv6k45NVRHZkBajFuLuSi9MO9pdJ4voSN/WH0ws7KYjegjIUfU0NVB9SXrz8dj+6aY0+4K5bosnZGyp3ys5dcFuVwedKNMzmeAG0Ffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDxdav4fX4qV6W/U+HIcjUz3W0TwsXcKCemC+r5VK2E=;
 b=cyZkVSv2vkoI7LIVL542mD7EsCVw24RsxU0LhnGOfTrhV75bAB7yExB+onh72vJOGe+XYQEGERd/MXakYp+3a27NET9qzT2GqltngSpE6fKUgI4hGeB8o27r4vtnnEZsLiuftDUJJRAgqG0SHYSw+tXRDSxYBRj0S5NG9gSYo7dF+Jk4EO8gToR3NGRALr8nAK6U2fzl7FH0zXeu2JP4pyi1pYOrw4AY24B3Vvnv/spG26KfDVQaSq7xgfSeEcRLodehxHh5ozk0/9U4SJ+2yLHPGQ/AngrSCP9io9jyJNflOfL2XbKBzE/3djLmmlar+gwLvnVqsv7f4szOMKvJnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDxdav4fX4qV6W/U+HIcjUz3W0TwsXcKCemC+r5VK2E=;
 b=ib8UXtBTBLy1mz3c1A7byRsH5JW+rdsr/+ihnZDW53MEUkFylULSExCVbyq2Z0ySmfs/0mfTqeBX6N5Ok0P438f+dK/Dy1wagNXO3mPd75ItsNY7qv6xbaIrE9bjsbZV7YbEsjSbnCTkW1tAMqaY0z8Tc+YqneBVYV85HuLxc9zqzVQygK98gS45wf/sXE8Vu0FkkxZJZhARHKm27QRsPVYyzvW/XA5hgd00YLRCSl0QPVXpzcBMp05hR3w/N6NzOXgj+aIL7cK5hPxXzZwUhMk9HRnHXe+oYmGERCxy0tTLiatSTZdhW1Is+J8QoKHZ6cCHTLoEUCX8PRihHZoJ6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by AM0PR04MB6996.eurprd04.prod.outlook.com
 (2603:10a6:208:18b::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 1 Jul 2026
 13:11:55 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0159.018; Wed, 1 Jul 2026
 13:11:54 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 4/5] arm64: dts: ls208xa: describe the Lynx 10G SerDes blocks
Date: Wed,  1 Jul 2026 16:11:36 +0300
Message-Id: <20260701131137.940145-5-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701131137.940145-1-ioana.ciornei@nxp.com>
References: <20260701131137.940145-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM9P192CA0022.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::27) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|AM0PR04MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 6758832f-7494-4a66-3aeb-08ded77252b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: tpo+U78JHY60mFXfBRl96keSnFler3jsX5wA3OgwgupKpT0506JFCSfTcGZ7C5UnHnb1NVFkbFZ7eMyS+om2zYOwbZjEkYF12powSAxfs1Hbh2eMVNW6zQAnTtyrE/eFarSW9kISQHSL9nr+6vogZrPytOI4MZZwrYRmCflsAGOql3OjV+LOZpYkMlHSYkNoFI/mesZdCrcus7jbpL7w+BN2olSOtP22YsR+nqY7xP1ml1/dUwEg/K+rF2TAGt31zlxj4NLbyMM95kcWl24g0D5mX1V6XRCxSarTeb+6uT662TQfen1eHh110B3AbmSLYXUnBO3NJSpFD67pOxrMuVk6HOBVy2MHXPGApovk37r8YVdZvxKbfNmBHLRIpu/dPs68K+JZ/zUd9zhVS2o2DZ8NUsqsPqzJUypcRgIea8vIBGb9IoK33cQUQeoenyvZJmuleW2afKnEUmkMF9C+GOJhkbxW1hwvnYDFFTaAvXYqWdnaiYzKnRorwTeuuMl/jxKOWjcbkclXVrrHruTcOYgj88hyrbu37tl47eM7pjhkMvnL3/B7DKT4WWFUqcwiLPZpdclqRAn7UU5Y6EwljME1IMawGT80DkqCISj4NzpwLPYyRwZ0ltNxFzMFQb1qe7p9fHaDEPMhhLZGINwnaJL3IJ9uBiZCfbJ810f0Btw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FMHiTn+eq1NGnlFELLBLrF/wZLAb4G9/wf8wh0aWTEvsUrwBIJk9RAB/3uXE?=
 =?us-ascii?Q?M4QKulJtPNuqtRJdonEYcjBFa7VuuBOJ3pbtu5t49yYEnNLvD/lJONMM0kWJ?=
 =?us-ascii?Q?B5sFm1a68H2blRaCpmnP4jVr2SJ0GRbECcRd+eiN0m/3Ei22nhKqAvyAXTVV?=
 =?us-ascii?Q?rmcPmWTzrHOQXOpqXs7QXr+qpIXw/bNSTgn5vJiAphFmk7HbmPasRM2bMTn5?=
 =?us-ascii?Q?x2Fs5+Q+YbIGa+C0r5P8g4M66NuKgxBSpX8XAsqKbhHPRhasjOYj5+i0dMeT?=
 =?us-ascii?Q?jl9DZzayM2lUZvbVbDjL3CDdzq+UKSAvLnW5uP315gYn7hcBO7mWFhHKexN2?=
 =?us-ascii?Q?degJXYfypfDFp3zStzXhMzdSXyB6DBOh90MkdmBJKRkzB8ZLAc+bB8oYVnGP?=
 =?us-ascii?Q?c/JSWYNe/21POIg2xzwh4OjA4H5MU98TmNSUgfFJT72P3kDHqlWuMz7qgjHf?=
 =?us-ascii?Q?HQsOBWNRKWE9mVhYIJRejUr/nHKa97iyd7A/r7JE17P7hFrp2bYdSZi+wGL0?=
 =?us-ascii?Q?/oBKFIOygANwHosZ3Ek2xS/n4onNYBPjsMEJ4Ucsul7Jo2p5nRflOAO3jBmB?=
 =?us-ascii?Q?23N+p4O8QGcDe5MdZ8CFAW27X9g0xuyP9sJaWqLdJf4hBWrmlQAuxi1W7qq5?=
 =?us-ascii?Q?fStU4ga+Mg3V6yUY6uZIKinr0wi3JrNB2clxrO7rFGQu3aqdGYS6/Puu0FK9?=
 =?us-ascii?Q?ShiwNd1P60CowE2Wuu3i9TU0we/6bFyrUtnc6ymGtP2+07HJaUxbMLLS/UhM?=
 =?us-ascii?Q?SFmzlM/7rFB49bsUiQH0VDJD0pYQb7wKCKIvlAcdXwCOQ8G6A2TXCvJJLaWN?=
 =?us-ascii?Q?ErmmGj+N/hO7dMSSaEb6Dv89a4Zfc1HSRR6Wm4SoIP9LDVkZ/vvkGoYn4W/U?=
 =?us-ascii?Q?9a/nRfBEqWmkfc1+4qk7Xs8T6IFeJ6xJLkatalBGCy7U++DTkoxJaojVzL2u?=
 =?us-ascii?Q?OA7nRBEJCuTIk8hM7FqHn/dMPtNKEwkEO3Pqjqp1Tx8WvNjc+55y7kQEXvaP?=
 =?us-ascii?Q?QNGrQdmcieDaV0be/knlydV0SHAwFbn6DVvE2JSVGNHqfPMdXsi9YfwMhXZX?=
 =?us-ascii?Q?SC2yf5BIv/q7rqpV3eJLIwKdTFxVF2hnb0GkHeIhQ599gRWWz8Cmuh3Lrf56?=
 =?us-ascii?Q?ybknhqf0uOPC6/L7bF0H52enUT/3JBNssXXUMfDe6RUotNM3LNwUPIMFthfa?=
 =?us-ascii?Q?S9srzEAw/XQpU8+s9iLMICzdsWyQLodSJ9z9Qpm6PIQr8po3m+Q26DjWKaO/?=
 =?us-ascii?Q?nIGwUQeYKWLcQCPy8/ceuwophAPV2mo1UUee0qjfPPcflerP1/CK8F5Bs0AO?=
 =?us-ascii?Q?AGfz2nu1Yw2j2CnPkgFPng6NtK1/MVIBnk9xA/1owN0muQ2ryVWC4Oe2gzZF?=
 =?us-ascii?Q?WorUuV/Qn9gia73zupUkbD/IFIZElwPNv1rv7lHFmVcUtTK4EJcSTxmWDWyn?=
 =?us-ascii?Q?97nmKkJWxZDpvJmPsfqx4rnz3lUTmBjzBxmVE+vDEudjk77Mr869lDNYbl2C?=
 =?us-ascii?Q?baHnKM8cVDF7RFm1wYRaBQih8Bn6uLi9Sw8pkgrMgVClgaT/prTkk+kZ0f0z?=
 =?us-ascii?Q?3nXSeaIpk0lfu0h/IUucoxELte7iViEHbaGbwHOsDH7asSvEYgPjv9pB5MH7?=
 =?us-ascii?Q?7gP4uGboBynsmdNJ3hOhuq0NyowDssRrbrpOXgG9s+qMJvQ1+DoLmf8YhQs+?=
 =?us-ascii?Q?9gqXifoCep/Rd+PfJJqJns4DjapRexE3jkogbiOIRWFaHoNtLWiAvdTa75P3?=
 =?us-ascii?Q?TC/5jZJV3g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6758832f-7494-4a66-3aeb-08ded77252b3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 13:11:54.7881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIK36fo5yqRSxJw3XzuZulRBVusontosxEHRqtuhZZaEXJ+N8wFZuc56Y3yNTe7SJ+JQgsM/gBUUZdkefWdW9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6996
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_141159_476105_BC5DD629 
X-CRM114-Status: GOOD (  11.10  )
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

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Describe the two Lynx 10G SerDes blocks and their associated lanes found
on the LS208xA SoC. The nodes are left disabled at the SoC level; board
DTs will enable them once there are consumers.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v2:
- Change the size of the region to 0x2000
---
 .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 6073e426774a..cc1a64e63ed5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -280,6 +280,104 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
 		};
 
+		serdes1: phy@1ea0000 {
+			compatible = "fsl,ls2088a-serdes1";
+			reg = <0x00 0x1ea0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes1_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_e: phy@4 {
+				reg = <4>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_f: phy@5 {
+				reg = <5>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_g: phy@6 {
+				reg = <6>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_h: phy@7 {
+				reg = <7>;
+				#phy-cells = <0>;
+			};
+		};
+
+		serdes2: phy@1eb0000 {
+			compatible = "fsl,ls2088a-serdes2";
+			reg = <0x00 0x1eb0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes2_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_e: phy@4 {
+				reg = <4>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_f: phy@5 {
+				reg = <5>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_g: phy@6 {
+				reg = <6>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_h: phy@7 {
+				reg = <7>;
+				#phy-cells = <0>;
+			};
+		};
+
 		isc: syscon@1f70000 {
 			compatible = "fsl,ls2080a-isc", "syscon";
 			reg = <0x0 0x1f70000 0x0 0x10000>;
-- 
2.25.1


