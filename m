Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC4EC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6H8LOkGci6FIIJ9I0QZoRD/0L7b+7w0EP0Xmj9dsXFs=; b=QUtRXfKQwvyl2VLpfvMFyJ79Z9
	/f4t1xPMlR8CRwHlJ0yZQLcGkDQG16SbYEevxuiqmQzP+mtOH3RS90Ykc4rUqK+ceMLwDMg6M5ZCH
	/HoglHdCuGrPt/4eYCsHMP1NaOL7opJnSq73fI3m4Ig0jPpljr4NQGea0/fi2Z2kJ24v2E5MaLOBB
	xMbmK3JkclrA50U/wYyVpVlWV158rAlclyRSKKmPySmJvmv9OwOVMCBRB6ciSgrhEivd5YO6Mobur
	qz+fIMWWgOQNejjkkJpjFUmC66QqCQIuzjhvVblrMOuYqTdUZwLkEEFT08x7pKPce1aaKiETJsba1
	+7RFy2Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCMF3-0000000Cs28-0kjU;
	Tue, 06 May 2025 17:38:05 +0000
Received: from mail-db8eur05on2070c.outbound.protection.outlook.com ([2a01:111:f403:2614::70c] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCITP-0000000C9SS-3jaH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:36:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJcIa4H7NwUxYJDyNgKEiY6dUNKtnP1wSYQ38Dv95vc8A5Rlpua4kJR3cJy/jTVyaIV7sdr+mBre6iSn/daAaccrefBmL/+31DT7QGS3QrUwrkU1Dj6Rr6SYWb2JpOPCOO1fIreBmUHjDNG3hBPvdI3+crx+U3q+lqjZHZgLXYZe/MjGLx/xpZ57HIjn+jto4yJeiB6rAQMqIR6D73xA0Pu+HJGTCjLh9vZyyutXmaRKjygp5kB189Qg7gDeuF3GB/rV243xFVPlU2AiOC9cuMf/V+u60V1Qc6uBwH/bNEGjJxvF5cifcfNg6DZNrqYbIU62dvU4EsS6Xf3ERlb5dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6H8LOkGci6FIIJ9I0QZoRD/0L7b+7w0EP0Xmj9dsXFs=;
 b=Bx9U3JMX9LIZGbe+n7Wd6Tmuw5lVJY/mW7JhJKhuKl5aSLecGZL0TSXF8SK2JZmf4/vbVFIIKP1zIHQVuFvUuuUHpy/bGGqmTzz0NkGnviw++rBDGAGRF1ax6yT+Ni11KHxnoMlsnAIEIQUkhnSYkjqRTkDpMGASdcoY/TXRHwhF+d4DoHlcQQBeG0c4WIqtZZ/hO5Oj0851Q+TcUbFv5dPmc11EZ+KnYl0o7BnGHpQGmvI9zA0XMenOzObav34EBSpqAPF9beg3jrJWOlkWFEYxj3npFVEOwTir3f+QnZV0NUN5tZ5dXYhHEDujRZAwthcmJSXYC5pfkDQpP7XPOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.de; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine header.from=phytec.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6H8LOkGci6FIIJ9I0QZoRD/0L7b+7w0EP0Xmj9dsXFs=;
 b=h1qK/ktbLFP04Xawa3iDte6gdP15Akqx4iTAUh7jjLKzHYT8vmmYWLwcQEAopfjtvhwNRLUp/5uJUduQXfsLGFXmgQAZHV9SANuyhVYj2fMH01DxTdXvFV06ZcdLnbU1+EO4xZDI9fdG/meddB8B1j1ZPKVmPFa/L7ztEqhY5v4JQ5dvC8ja4br+hlu0XGK9KrvH2j3QQwseIAqBNWf1seEDiC6KZKf/OQTVT/71bMXkyPM4z3WhR7ksBzR6WIoslAPxeeicpLI1WoFcpXCcP+6UOl6a8JR/LjXGlX3BoT3Is/ae4N9Quu2gSo4g/c4vhaAXGksCdZ89TbIDkH0xjw==
Received: from AM0PR10CA0048.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::28)
 by DB8P195MB0469.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:158::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 13:36:34 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:150:cafe::2a) by AM0PR10CA0048.outlook.office365.com
 (2603:10a6:20b:150::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.33 via Frontend Transport; Tue,
 6 May 2025 13:36:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 13:36:34 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 15:36:31 +0200
Received: from ls-radium.phytec (172.25.39.17) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 6 May
 2025 15:36:29 +0200
From: Daniel Schultz <d.schultz@phytec.de>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, <w.egorov@phytec.de>, Daniel Schultz
	<d.schultz@phytec.de>
Subject: [PATCH v2 3/4] arm64: dts: ti: k3-am62a-phycore-som: Reserve main_rti4 for C7x DSP
Date: Tue, 6 May 2025 06:36:03 -0700
Message-ID: <20250506133604.294920-4-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506133604.294920-1-d.schultz@phytec.de>
References: <20250506133604.294920-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|DB8P195MB0469:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b4ef94-007f-43f1-3448-08dd8ca304bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8nWZVd/5qxxW25YjAb4tl176TMXRwBXWZvx1rjTKbXMA4agLkGqMnlbRfNMX?=
 =?us-ascii?Q?+00UyM85FjtueE2UFleWqhIrK0WZLAg9xLfoVSXXWhvVeAzsP5jdxt5bP9Vx?=
 =?us-ascii?Q?L0Po/IBfc5UyB2C9QEu77qfVJ2Tkgej2p9PJKIZ0d1y6Em24Qm3NqBOPYcG7?=
 =?us-ascii?Q?/3MTwe6HoUCBVd6bcf4Uzl7X+poq++xbaVR35jGFJNMY1mR0uqiJAiCcdpOb?=
 =?us-ascii?Q?R3/FwhkUxI+RUOX3WPcNSm4xhPdyCzMVapcFxe/NK8AsuhebDzQ0Df5eqH8h?=
 =?us-ascii?Q?goDbMYU8PhNzd4LAoxXfp2eNw/3JWf03WgXtpTzBUi29a1TzuRtX06cGVPyd?=
 =?us-ascii?Q?WtnYcY3zIlkLfXVyd3VLC4+PwQA655MjPmmoI3ZIclsmD7LeuZCUpLMqYdAs?=
 =?us-ascii?Q?QbGeUmgq4ZyVYlzm6eIioRCfeDesEa9VDJgxA7dFdauUbUZ5AiBNUcZpni1l?=
 =?us-ascii?Q?h6f6kUZeunpfvxsesuuvvK872EpTVvfPkN/I3o2aErkamIu+weFVb7rCE/KZ?=
 =?us-ascii?Q?1IUwQ8ikZbWzUK7hSJBeQ0kSuiUFxvGhtwTABTw95W4f137iOSiKEkAJdiCq?=
 =?us-ascii?Q?c5P9yiaY01KlbWn0HeMdWPA9VjJbmyWgP+aYlOkcX32R81XU29Llh6BXjde1?=
 =?us-ascii?Q?BegIDj8SmJ/gfFcmgsKRzPPddupzGYOYxWTmWyx2w9cT6DTft4TYENDXKg0j?=
 =?us-ascii?Q?xchrRb4q/P1NswGoTqCvE81nFgFVW4cGVC59U+d5wyzzQbmyuI2V6d/PyIOW?=
 =?us-ascii?Q?Gv6e3X2Bf7kyfSJPbYXPa0Vbfxx2JFddYfdCkMQrdttnZx7ozxA8oVtaR0xt?=
 =?us-ascii?Q?ZrAKFbOnw9UoygvVB48mx/DeiBv3uBuZ3klnnVyx/hdCUUaRAnkf5z/p9gjI?=
 =?us-ascii?Q?ZUT6+FpG0HdF69YjcA91k1VxVje6hO84N1xJIsQF0pB+Z+ILUfAUzn8ybKeI?=
 =?us-ascii?Q?JgKRYO+3jfhz+mNLcVX5qkqnlYSINR6q4Lj0ya61OOG6wGEvpm/iAPHYX0Pr?=
 =?us-ascii?Q?gVxbt7YxTKKpeGMcvQlLSFGCSs/p/C0G365f8IT7xAKfuKte5YDaonbHRNc6?=
 =?us-ascii?Q?YvjyzWGCXw7eDjBfB1b8CBakoD0XB0cHqkJooz6qu+PpPZCmp0nQsSBZWElK?=
 =?us-ascii?Q?fvBxi5bIb/0+ekgf8NU9VaaEPZhiVUGzXXw4SjJeJbIEHtg3UIt2Def7j31J?=
 =?us-ascii?Q?kouw+uxnnDbGhDTcdg0HwrHr9Vxq5yctjAYiwpW8etI1BgTnhDHuCB0GpUlo?=
 =?us-ascii?Q?SXo7F1GZhsODwQEdUr832zhL4tlQ0EKJtOjViSjlfE8ouc6J7MQpS+gjwqa5?=
 =?us-ascii?Q?zGgm1LD2aN1tr+BwCMan8yQO0j58k/Zs+J8ZIFLj4TpfmLw6M3x/Z8plEkR0?=
 =?us-ascii?Q?OnLriZB7dvFoV5gizIYuG1tuZVy0vlOscxhSjrL5LmWbaQhOCLCt0vH22cnI?=
 =?us-ascii?Q?he98WTq/zEUoqFiB5SJgtyanatpvLSbIFht+SIAVjx/cN9wDLxfFPl8oWoMa?=
 =?us-ascii?Q?g8cIWQpmgmh9v6IBEwJEfEtLLZic06m7toNW?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:36:34.3159
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b4ef94-007f-43f1-3448-08dd8ca304bf
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P195MB0469
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_063639_952319_731986CF 
X-CRM114-Status: UNSURE (   9.61  )
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

The main rti4 watchdog timer is used by the C7x DSP, so reserve the
timer in the linux device tree.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
index 049aa358e796..7fa0060af4e8 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-phycore-som.dtsi
@@ -379,6 +379,11 @@ &main_pktdma {
 	bootph-all;
 };
 
+/* main_rti4 is used by C7x DSP */
+&main_rti4 {
+	status = "reserved";
+};
+
 &mcu_r5fss0 {
 	status = "okay";
 };
-- 
2.25.1


