Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909A0CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 10:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o9+5bOwh2yKW9DEC6vO21D4JgyN05uIUR4AeRU+G0wI=; b=t+YqeXAn0iAozY+tA+Mx2luuJ+
	zN/5bgMXuyqQ9x3fALKXq3VuesloDfoyoEup7EZKgjQwU8DUSjSITOxOKWG775atDLWz7tl7cNkWb
	WJPKA/jeYIacxf10AiwpTGAaOaXnNIhgtoc4KFtSfRq3Miv47dsQm4BPCxgqluw174NTV0MOcYWfB
	nvD+fa7AkvdpxK4Xq3cScuV/QKNxJ6c4TeL1z39dDZjmS4ylG19MevrdLA8TL7LtdDBOmNYiWgh9W
	yd0ZmFgywNHMpWUY8Dg4J9Z6b2sWXb+U74ISZ0tzZW+artFx0Lx5yFCCjLRgHpWky5NsbfLnQl2dZ
	O94YV8sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1imc-00000007sa2-1mMr;
	Thu, 25 Sep 2025 10:01:02 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1imU-00000007sTx-3T5v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 10:00:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTf5q+Ej8kwkXXg9W/SiOIRSStuHtvuhjrpoEoIW/GVl2uOW8irIXWKkPjkgynmWOvUe8X1zWU4zA5RCl7ov3RdP0ilAKmzjooKSvUKMsbthpOgQk7qVQ/Zq2OtWF2fNlONuzST/UNMeEXPjAKOoCbU1mSb7VxWxk0TE/WGqSNrDl76UgzLL4MSDgHyVV15l2EbEHeXkpe/R0tgOtKabP6znaInfblqLicyJHcPNNPqybcI7YE0BCoODa0FqVtDZNZn8KRFnFVf0STwP4U2s3B4Q/WzzcamRVOwqvE6UtONSoABjrhp95Lyj74kdGUha4Xl+hBvCsxgHWYlUC17K0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o9+5bOwh2yKW9DEC6vO21D4JgyN05uIUR4AeRU+G0wI=;
 b=Q+4rGETclD/WV8kh8oLUZDe8MWEDTxzIgjDs2qFD1+kp/we8vkkUrGKxzZNhSy1fP0BQlq0SSiIrWcGJmpOZ3P8AQFU+gxHYOutNoq2IRddK4jXKK13dXiD7KnL1dcrlOuooY/aWGjpHWTZ51ULL2xZvesBV8ljr/Df7ownxB5R8mKQaRqhsOIIr0kNJU1llo69RJV+5KUWK3Tt1YGbAmI6yiKdKVgpQw4IOMJuWLGu6+c5/yvNvE93oIo46d+Pw//rmNRkiVhUE1FI1qluMN1iEMJ0P4+5++cX5VQ0duc6HSdZcC+NqvpiWILfPkK7VOEPgo3LkfxY8xCCBOIFazg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9+5bOwh2yKW9DEC6vO21D4JgyN05uIUR4AeRU+G0wI=;
 b=gcovHR58f1x3AGs37uW0sdxJmNWWX/xXmGMMwkCWSDSZFaqTdnWm5jUKOHPSagsfMKhaied1tAVk/bY1J6Jq2lZzLWgTx9ttzSU7Xa2pbu5fItSmOVGxkDxbrDSgykwbXhS6oHeQ4oWD90oIAYjSo7je6ZliMPtsckpoqj4RXBWmgRqiopHmZRo6iBtsUUZ2o91xtGGI3c4M54znkKAF8s6TkZU3ZitScW2/kwEH6f544pYbxeYHGEdxT4cLTlC/2CLDN5PA+IWNj/WK6IZjtFWtI845n+5xneM5avURiKv6/XYGSqxzjE792o1qrxH2noh1xlWXfdSxP+wVzCVAJw==
Received: from AM0PR01CA0155.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::24) by VI0P195MB2739.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:2c4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 25 Sep
 2025 10:00:46 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:208:aa:cafe::4b) by AM0PR01CA0155.outlook.office365.com
 (2603:10a6:208:aa::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Thu,
 25 Sep 2025 10:00:49 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 25 Sep 2025 10:00:45 +0000
Received: from phytec.de (172.25.0.51) by Postix.phytec.de (172.25.0.11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 25 Sep
 2025 12:00:45 +0200
From: Wadim Egorov <w.egorov@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <aradhya.bhatia@linux.dev>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>
Subject: [PATCH v2 1/3] arm64: dts: ti: k3-am62: Add support for AM625 OLDI IO Control
Date: Thu, 25 Sep 2025 12:00:36 +0200
Message-ID: <20250925100038.3008298-1-w.egorov@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B3:EE_|VI0P195MB2739:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cce071b-0fc8-405e-60f1-08ddfc1a655a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9DTwhTDD6LuM+9ZG2YwwBMDtuPx/mcEhij/XgZp6+7JzKY2cue78a7ERxU9a?=
 =?us-ascii?Q?wmlbDgTD7ngRGg2D3d93YZMaq6cuJVkGF5D7GGc1Hc8jG52mRNUXvlkGnU15?=
 =?us-ascii?Q?BZrUcvIaCIrk4WpmekIChH+Frc9cyEIblmPnFzsH4o+G/UWxBEXF/NSD3zjk?=
 =?us-ascii?Q?RMce1NIZoRBofPUG+cL/maQXPXGpHTUpkEusR4a5Ir3j3ppZubXffBfa/iof?=
 =?us-ascii?Q?KRknhsemN+j+U2J3icknApUu2zoL7ExWQoZ3gE5xi9NwSUbz3+jVYblv67KX?=
 =?us-ascii?Q?9b9f1USI2flr3z+OX56yiHE9Usqk0KeWgpWRo9SDNlHMZnRhHJlNFHefPFCK?=
 =?us-ascii?Q?JkkXZakinrhCvu1F9yPnwme3vD3dtNYZOB+du4mXZYifD0fnBoErOLnd/Xq+?=
 =?us-ascii?Q?3A+U0djZM8LR4MTNR2VQyn54K284VIj0yv6Bl9SpSS0X/ExnffJ/kbLhfimC?=
 =?us-ascii?Q?jbAs4Y1P7SunDaRtPCtEaXJ2rBXT7+dE3cEOr/Qhq6ecVq+vUtUtSBjqaI1H?=
 =?us-ascii?Q?D8JJFzhcTZrdt6vGYwbo6mJcGFcnm08rpJDXeaQFCwjKOrHdKlClo/Y0mfHp?=
 =?us-ascii?Q?A/dBSWhR5tqHUXBsn9OVF2E0yQbMUhGR7X1hP5cmMIaFbXgxATw/U470gLKy?=
 =?us-ascii?Q?nS1NEtiOUB1Z+jkQqYirijiXkHQ7msZva2XyypDCxun17XYsZWv9B5W3LeJx?=
 =?us-ascii?Q?aVa2cpFYJeTKSswrQJcdgUAjCZ7jaN1aN1JfCbvUFSZLw8KCMuFGy5TATNDs?=
 =?us-ascii?Q?nTT0KBz5XT/AdiG0h/SUGG6uWAuOGZVBRo4gBg7oqp4J1T3KeVUmsLJBuq/Z?=
 =?us-ascii?Q?ql3hWtjrqlP+dms/tuiOo+M1An3Jetdb3UhwRmhVJ8tl5odO3/sIGT+S54pU?=
 =?us-ascii?Q?u3Tbqibkn07Y7F8YPe7hYZ93eWAO9j9BJiEC0lVBerHg3N6kyEmOJ3K8wJSy?=
 =?us-ascii?Q?yqVtJn6gSQieZsw1CF31ZWAmluMQP/2PtaHWifDTQbTpNS/jGYekzaSGZ+ip?=
 =?us-ascii?Q?akyLZczYDj9N3TICrlKXUQESydbLkoipf7DE9qZNqPI2GD/RMhRjmf4mc4OS?=
 =?us-ascii?Q?LcpG1mvBZA+WMNjtFnML+jH6DMGGL2bCBKeAT6uZ/s9iqu9g9lPDhCD/Tjoy?=
 =?us-ascii?Q?nnFIpC2ON/QxQXbqdA7lid4UJbx0hQ3Jfng00CD5HVJDEb08VRBtUKgAdDj1?=
 =?us-ascii?Q?8BP+w+FQLyGAikVGla+dBkxyw7zlaZ5Z46uUwSkdhnvqR53cs+sGweC9s2nq?=
 =?us-ascii?Q?dPOkYJJ1IB5DmAqKXdL7lymrF2mBKr4a+YVkUXmv7EkFh1gQPLoxzkN5j4ef?=
 =?us-ascii?Q?Y40HAJv3gHywfWF2X71aLRShroshmGEubq4MKQLJ5jfZKCl2JmMFXWdQtP2N?=
 =?us-ascii?Q?azQAF4sLge83EyV8okZz9d6NmuFKxe9ZG872RDcx0U1YPqAMIvSAhh/bJOrB?=
 =?us-ascii?Q?rAJd+zTnC2vXhqGgltVSdEA3KfL53HkBM8jwp/YN3EyFE/gxrX10/lKgOBxo?=
 =?us-ascii?Q?AiNb94LlsHN3Q2YXimpBW7xZ8GmXPYz4nUbRxorFb2lXMfZQoL0m228xIo6y?=
 =?us-ascii?Q?wGJW7Zgv+fChR31gCe0=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:00:45.5819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cce071b-0fc8-405e-60f1-08ddfc1a655a
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB2739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_030054_866131_3CDBABAE 
X-CRM114-Status: UNSURE (   9.38  )
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

From: Aradhya Bhatia <a-bhatia1@ti.com>

Add TI DSS OLDI-IO control registers for AM625 DSS. This is a region of
12 32bit registers found in the TI AM625 CTRL_MMR0 register space[0].
They are used to control the characteristics of the OLDI DATA/CLK IO as
needed by the DSS display controller node.

[0]: https://www.ti.com/lit/pdf/spruiv7

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
---
v2: No changes
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index 120ba8f9dd0e..ffa485545a5f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -76,6 +76,11 @@ audio_refclk1: clock-controller@82e4 {
 			assigned-clock-parents = <&k3_clks 157 18>;
 			#clock-cells = <0>;
 		};
+
+		dss_oldi_io_ctrl: oldi-io-controller@8600 {
+			compatible = "ti,am625-dss-oldi-io-ctrl", "syscon";
+			reg = <0x8600 0x200>;
+		};
 	};
 
 	dmss: bus@48000000 {
-- 
2.48.1


