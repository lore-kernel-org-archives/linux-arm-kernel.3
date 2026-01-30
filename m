Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE2BE6BF3B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 20:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vyShTBAvT7/nddGD2A/ZSH0OoPuj0AQCqUrdY7p3qA=; b=f49Yz4ElH66dCKdqGnTYOsPW7j
	/YdoUGWp9P9mVrxIKSBqkViTNNGko/Sx7xi+1VBCkLdWPM+/SoDU+g8QmZFdMceXSWKqbTxunDWGK
	5IIZN/wvqYt6vTqc5LG0enO5hZX6SeoyHLgfAwiGRC7PQ4YltFzI2RrOtBUgnG3g1v3yuMZ4mHMHm
	rJg2DJP3JAm+EhL9/icsLW64KCf5XJ7oO7FhnaRSuYMp8HPgaZa3LA01f7p6pi5sPsysbARDQlBpX
	dhp6BiVnwFAQ7wQWr2Mx+rF50CuEbmYmIuaKJzVHIfMQT8WlMY1dCvIqpjggvlVX2+MQuR5NWknic
	6Ccxaywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvaW-00000001y6p-2DVk;
	Fri, 30 Jan 2026 20:59:32 +0000
Received: from mail-westeuropeazon11023141.outbound.protection.outlook.com ([52.101.72.141] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvaT-00000001y4C-2uCF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 20:59:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6eNq3EwIwf4+UBXPs+1ocU0Wjlb6cAdFSXKITMC2L8dZR/Tp9M1Sob64dtsRwyUjMCEZp5uuha6gP7vQF8SuYoPGUODUPmy4kMKqo0jX4NEa61Up2pKKz7qkWUINPlYSxy/hX+FH3B53UxKmK4iDlEKLbsW3SNi0zwlJ85FY/d1DTb3nl1aoSsLC9Tr69a8SoAN9qImIsmf1VLYgSE0m1oY/86a/7iri125xHFHuDEkJuz0WBH6KIEicWlMhK65iW4vWfXG7UEOkDu1tNjteERe6gWS6GCTP6Yu5QY/UwrBfx+SiU+rx/1DSjtJ77Mity4XKHxIgldn3Oy3lpuweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vyShTBAvT7/nddGD2A/ZSH0OoPuj0AQCqUrdY7p3qA=;
 b=Kn9biK2DexEtEq6A8cQB5sBwW09msT0pTqgao6Fv8Iaj2RomuHqswr+P8/wwUFnkLAlU1bgiS0po7Rnf8H4J+PedQEbiogwEuGLDLVI5CqnBeooVfedHk/3PEubrDAsrFYqonYbWGbKTmplASd8QHOSzyGD8aH3XnxmEdiyijUoTJuDMD8x6UtCi8Y9m6tHWcabyVRVEyaFSJ+/eWTo9gnOu02Tve0rPCl/UWkpcyGGAQISBuu/NeVSNuaNkuRTW0lw2TAtalG2KJqSB+9nv5B3JVFIwnUZY9AlrD2ci3izlWX1qEgRu1RpRKdvbcKFHLeklxwDKK4aXMSdCtqUwIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=gmail.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vyShTBAvT7/nddGD2A/ZSH0OoPuj0AQCqUrdY7p3qA=;
 b=CgGaf3zC/8sDYsK0GkM+ICXfhFVPnBZW4gf9WCfGe5i1j+JQdnihFDLKgwyU9lKNxeu7DnIYQdOptglL31C5+3ojBeu5V2zQnfXzvkbI8hAkR4kielHhFKXTn2Ox2okjH8NbVjjB3hLB8RbtasYngLqPi+uFoW4sx07hIe7/clCg/Lud8cIk3fwswz6SoXQeff1PMlkYnfSWBskk/nkhIdsrqDBf8N9D6q3aGfDQ5SG6p/nt584xSuvjw2OSH0XAfpr+MgcuMNnk5XTxRtPWFRFu3UprB2i5/DSWaQ0MV3y3RXQoi6KSIm4qnQFxBXlDD+36aoI1kS76hUbuE4PD3g==
Received: from DU7P189CA0029.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::29)
 by GV1P195MB2615.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:1f5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 20:59:22 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::c9) by DU7P189CA0029.outlook.office365.com
 (2603:10a6:10:552::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 20:59:22 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 30 Jan 2026 20:59:22 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 30 Jan
 2026 21:59:18 +0100
From: Dominik Haller <d.haller@phytec.de>
To: <adrien.grassein@gmail.com>, <jernej.skrabec@gmail.com>, <onas@kwiboo.se>,
	<Laurent.pinchart@ideasonboard.com>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <robh@kernel.org>, Nishanth Menon <nm@ti.com>,
	"Vignesh Raghavendra" <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/6] arm64: dts: ti: k3-am68-phycore-som: Add DSI->LVDS bridge
Date: Fri, 30 Jan 2026 12:58:12 -0800
Message-ID: <20260130205820.83189-3-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130205820.83189-1-d.haller@phytec.de>
References: <20260130205820.83189-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E7:EE_|GV1P195MB2615:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae02287-385d-4b86-1e7d-08de604271a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7zNReQrEGOUfqz4VsxAJr+lP/qDKawju2Cx2Cjbny/rns7Mk1i477V0/K1Oh?=
 =?us-ascii?Q?ncE0nMYoAqtLr40zxxCIgRni4hAoKrI118MCOFII8yBssgbxnzX5QKdfUs2X?=
 =?us-ascii?Q?XztDUhNee9TAorKFHhGLGRDwOejZ2HYU4j9QaoH8bLO7Dqzu//Fb5p4MJu/Z?=
 =?us-ascii?Q?FR+AZ1C2SsrsA1txBHx7FSLJWunZ4GvkOd2jVipiD94mdJB09DESaErdqArF?=
 =?us-ascii?Q?zz6R8HzSZWtsoAHI0SeYla74qJ5nfTtaW5umOJCTmCjfghpNdtCtyxWbmJVJ?=
 =?us-ascii?Q?bCOYiWB7U8MCPw+sfrnf0GcLvfqA3hbdSNfsCCvaTrSRHFiMsLsjX2UhjPcf?=
 =?us-ascii?Q?OSlQR5C7zUHscDCosa3UXwAR/yaAeVRbkX32lJq7WnEVZ4Af3hE0kHPm1LCx?=
 =?us-ascii?Q?H9KlxBx5utKCojS6s+DjdlgIhxDNi3zXg2hdzuMgZPPTca7bY8XoiA15db6I?=
 =?us-ascii?Q?PW/HqrS5qHmsSj7ee5U2f3/OS8pt+2Ejo04ecSDGHI1MFV7D0sgNtfVOV/NY?=
 =?us-ascii?Q?gXo1mOQyAlWeXRE2M2Tlzsh0qAxeidHRC4Drtx5D5IRw/z6/9c+tC0pFqwD/?=
 =?us-ascii?Q?qEUU9iBKIE9/smWeoZ+IfShke+a55IMqWXsAq6M+NLt3nlG58nL2vE96DxIL?=
 =?us-ascii?Q?kTm5iJ+vz3uUehxVXa9X5ZFV26fsJQDLVQP5nVS0yrMJTRaBd/aBTYXzIAQA?=
 =?us-ascii?Q?UnL3BJqnM9hEVAoTvTGxNQ+fJWV7FdFLGpXOneD3TJ9aWAuHVw8vvW8YMXG2?=
 =?us-ascii?Q?05mA4OLQ9JFmzb4xDJ3WEEKdkMAQGfTYqbSAhVAO6W4WWh2UdM6I724bdkcp?=
 =?us-ascii?Q?47HH5gk/q3LUQA1Nftsch3eO+E1U+h78ST27HuvEl1cFxZThjylxSrfCp36T?=
 =?us-ascii?Q?VBDu9x4sHVuqC2Vn40+hpgvaCEOCdJXWI1uC43LQkPipjquyENMdBtcAWB2+?=
 =?us-ascii?Q?yfviNCKdZJIVWN1U/k2VoqZYdArACuDgSgmYNkBa6H2Ivi4MwpdjscGFlucJ?=
 =?us-ascii?Q?93x1jvLPiq6wX8fsJtmoK5Iz8wRSpifHg0GcI/CfcHnW2ghbxs4vVRBFwQum?=
 =?us-ascii?Q?rf6feCNMene6/4vPG6dwm05bUa4ECQcGUbonh128FB6rS4d+FT3GPkhy/RC3?=
 =?us-ascii?Q?FLLUXzLYYzRJTgRP9pigmoT16/IiXx99VsRTlATPcnD03zEI7saeaSu4kOim?=
 =?us-ascii?Q?5Mbl66JlJnHgJliogVyovc3UjIYbrueO+w2Mf4MfFD8p3+LcHl/x/cWMWdBl?=
 =?us-ascii?Q?kpDliFUU19sjEFj6nkAkN/O1vZeL9+7I2cZ9Jt1P5wtIw6bQTE6xm79ijDkX?=
 =?us-ascii?Q?NkIftg8WvKM/j8kfcGv92RWY0hHdQPykOATqYYmx2XfP8RBfpGhSx6Nl8+VZ?=
 =?us-ascii?Q?7C+7palCW1fMr8GnOgQqdnzEHbV9wQbIeUM6fa0uwFfi2jnUjBXfOc9AVKM4?=
 =?us-ascii?Q?1CKwMxQ1ja6bbopDurn7iTcvKLXDA7X9qMnRWDW1vKlaLyGRbYgsymr9RrQ7?=
 =?us-ascii?Q?AeQMG2rwal2buRDkKleOD/n7e2Jzfneb10ru2l7d98HueKSBAnXl5LkXO/9g?=
 =?us-ascii?Q?X7PdfwIzF+V897tV+wUf8lu7tzTRqo2HlGA9v2gUOYoVXShBNQpLHdQOMhNv?=
 =?us-ascii?Q?Ys/cqORN6Oijt2bcyxSTjB+NCYTa+dDY3bMMDGmYuKyvofi4YPohXWpRwMs0?=
 =?us-ascii?Q?2lAw5+FhV9S21jRTf0d6sg1t0jw=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dLl7gBOK19MHiE0ElSQRkVrzxyYdoq16zXlLBVCd6jXukleeuvuLXWDi1W6fHEH1qVg6RuR3DnE1b0tyHwGU1kT1/ZDPAiFGaihpWHqLcGfRI1AqFZXtWQl5Ldk1Um1eNpMyBYD8RItlPY3ExtLlwox1ibaEvkbKkoBBtJ8aKAiwTHsmxqmB4p6zsOXPTO1rGfdOhKkuPj5BCWqhQv+DkAjM/2/x4rtdBpwaHJbpMYURf6vFVLAmNoBVpzUast5tuvrBJivWGRnMfWblyrTJ8u1YgM3zsLj7EbXtkVciVLqKOermx1IbleJ02rsrsFK/i0yZD5Whpb/VlEEW+1LmETY+UvF8uDgdCv2Ey+Onw6LMSukovjk/PfTQaYsUJmiBZ7kXa89BcM0CkuNBc4zmvL3knT4JW014JRR5OlApU3lV/pLoQjCZnm0nS96zgtmW
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 20:59:22.3302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae02287-385d-4b86-1e7d-08de604271a6
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB2615
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_125929_743575_C75DC0AE 
X-CRM114-Status: GOOD (  10.12  )
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

Add the TI SN65DSI83 MIPI-DSI->LVDS bridge that can be populated on the
phyCORE-AM68x/TDA4x.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
index 0ff511028f81..ab87767419fe 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
@@ -151,6 +151,12 @@ J721S2_WKUP_IOPAD(0x09c, PIN_INPUT_PULLUP, 0) /* (H27) WKUP_I2C0_SDA */
 		>;
 		bootph-all;
 	};
+
+	wkup_sn65dsi83_pins_default: wkup-sn65dsi83-default-pins {
+		pinctrl-single,pins = <
+			J721S2_WKUP_IOPAD(0x084, PIN_OUTPUT, 7) /* (F25) WKUP_GPIO0_11 */
+		>;
+	};
 };
 
 &main_cpsw {
@@ -183,6 +189,17 @@ &main_i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&main_i2c0_pins_default>;
 
+	sn65dsi83: bridge@2d {
+		compatible = "ti,sn65dsi83";
+		reg = <0x2d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&wkup_sn65dsi83_pins_default>;
+		enable-gpios = <&wkup_gpio0 11 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&bucka4>;
+		/* enabled in panel overlay */
+		status = "disabled";
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp102";
 		reg = <0x48>;
-- 
2.43.0


