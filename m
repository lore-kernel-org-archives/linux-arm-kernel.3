Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0887CAC5BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 06:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEPhkkigx6uuKXqydRqGUBvWn+iveSU+r9XNSCxFjFM=; b=3ZFzU4OF6+MJm68NztNW69MDnB
	t84SYpcJfUEea5Y2OifsPgJnhiML3UYy26uveqIBRrncFq826vsPBMvXdWm2kCMaZWxdX68DTDyR8
	qHKCi8Ye2wypj4G824dr8Yh59cz/L2n2th4pQwt40fcwOeUzMzJcS+XLjFDBIgUSL25JsuOc1pHgk
	18vKvuC+3Cf4iDs/RebGpblqsA68eqL0AgUCqGJ+qdIhSfEK84GwVS44HSh8frfOnsS2H1rGHDPzT
	mFOcqp7qEkq+HFxVg+qvszYOIuSSN5cq+mw1EHXkmqSVf7SdPw7Vrr6ZgDsp167f3hRmFL2cVXtYU
	Z11TD1Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3U9u-00000004OPS-1J3n;
	Tue, 30 Sep 2025 06:48:22 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3U9k-00000004OKv-15tz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 06:48:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEH/DLGXkvyvs5GlFsotSCfPnoD3oZPdTO1bqEFFuHKnsAB0okMRPmJ36uTkYs3kO25jNmz2UX9LqmEl87/1ynO+KWh3suKNYcTNQT4yqUqSGK4st8VscgLkb37/J8sc+wyDoYpM42dtnW8d/I7+9FeZv88E8HCgm8b8xRGS+DaHlLYUrr8yNvqj6Kq9/hPyM2ki27BlKmxImrDLEGe52P4R/j3m+QSvbjSa5o86LeqxT4Hn/GotcXCNsnstZEecDbokJsbdzkaoeoS4ZyEVsPK4uDFDWIQVgV2oDu0mzL7hLrRR8+QAAbQvNw05OLZsXVmxdLspPlzkC7ZkXXs27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEPhkkigx6uuKXqydRqGUBvWn+iveSU+r9XNSCxFjFM=;
 b=qA9plYRQQOShvNQLkv54lz2UUSilPb4ZmJ0sJpsDYSQ0jCGzCjWZhyAN7GKW/A19Z+p9o+/AShFL0/gJDBPvWdueZjMJBtL9Jw3rS4TDGsg85c/iq1BVvoTLFvzRANqGCt0jk77eGCIYDOUKOzmXbNIWCZ8RnWQGgugJLRurvD3/Loxt7bBh30QTLeuaw7eqdL9bFkryCaW3LoyfQZdQbjDCP5XjCkZ8moj8UIeMgSBfGdb/8I1Q7gw+vm+Pb3MgQ0OUHqZTunLHuZ/+QOV045PUyz1KbHbHNVOOG+J+sw/liLMwNmLGgKqIDXuaw3WhdZ1cUN40oPdvZX0EvFv1BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hEPhkkigx6uuKXqydRqGUBvWn+iveSU+r9XNSCxFjFM=;
 b=DThGNsF1SmyCQR5+WpskhlOeVwQXs0wdlx9PZlTPT76JUu7YsjkTT5RM+VeIYYPUb6Qm6hKA/wB9ECoYb+P1ryTQOrzAZ/ZUzfRpLrNh3cEMpbcyHkCbdM2OWgjWGcfWpjXV+iDEmrfKF1KTZ7NVyp43eKdCl+3eoCNk6+JXjnyN7aPob9HFFx7keXlYEmhR+WfqlhwBXRBGkJng4YCgdqy8AII1UQBa0kbD47YNF7anYMmQpTbgdleV1ld9WbHHPZdr3X7gtCfovN1/uCkhmGfioMVXldGhvTh29MhJDadG+Bej5B85nUeHniMHEuqqjD//gKkbx6t3MJcmHbRXvg==
Received: from AM8P189CA0021.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::26)
 by AS8P195MB1880.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:541::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 06:48:04 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:20b:218:cafe::59) by AM8P189CA0021.outlook.office365.com
 (2603:10a6:20b:218::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.16 via Frontend Transport; Tue,
 30 Sep 2025 06:48:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 06:48:04 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 30 Sep
 2025 08:48:03 +0200
From: Jan Remmet <j.remmet@phytec.de>
Date: Tue, 30 Sep 2025 08:47:45 +0200
Subject: [PATCH 2/6] arm64: dts: imx8mm-phyboard-polis: move mipi bridge to
 som
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-2-d5d03ccbfca1@phytec.de>
References: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-d5d03ccbfca1@phytec.de>
In-Reply-To: <20250930-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-d5d03ccbfca1@phytec.de>
To: Teresa Remmet <t.remmet@phytec.de>, Janine Hagemann
	<j.hagemann@phytec.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Jan Remmet <j.remmet@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.39.81]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A0:EE_|AS8P195MB1880:EE_
X-MS-Office365-Filtering-Correlation-Id: f0ee8241-55b0-4428-3b79-08ddffed4e70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|30052699003|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjRFNEZpeGMrT1NpZU5WZCswK1ozeVZZRVJuNTI0SytxdzRSaVFvTzhUdnBw?=
 =?utf-8?B?L0x4WEVhUGFlNmFxcUVDb1ZEUkJEeXQraFNnRVJqU25mTGdwTU5WbmU0anBY?=
 =?utf-8?B?S0l0S21SdUE2WGt4aVo0Ynphak5xUjBpbkdzUW8yK1l0RG16elF0R2lNQWhi?=
 =?utf-8?B?TTBOdHNrNTk5OERIVFJEWU1PUkNPZEIrR1ppbUt3K1hlVFdJL1BqZUd0UXJx?=
 =?utf-8?B?NjZXWEhmOTRwUytMS2RSR1c5SjhBS2ZIUzQxU2lqMFhUWloyeUx0OURGMklU?=
 =?utf-8?B?YlU0ZEl0K1lLWnhnOVpvN1l5RWwreGZIVXlBYnBrSmwyUzVVU282ZmlzSUNu?=
 =?utf-8?B?aDFwR1c2ZENhUysxT0dKRUVmS3NnbzFLK1dNb0srWnpuVEN4dlhSa0llYVZr?=
 =?utf-8?B?MmxxdGhrcnVMMTZvTzYrengzazh1T3RBalZ3cXhneTBrM3liTlFpVUVSSU5m?=
 =?utf-8?B?dzlBWXhMdGQxKzZmdHI3VzJwOWpMZXdRbW9GQkhZV0xmaEJRcG9RcDh0cGFh?=
 =?utf-8?B?Q0VCOEZRVExic0RUcFNqMnNWN2ZvTEFMbkdPTUtWOHVNUzZiYk1TVnlBVWNG?=
 =?utf-8?B?eDZ2cSt2NTRRNi9laWZEZ0tMOEREeE1PZnovOUhRdGJIWUdYSjJuY3lxQW90?=
 =?utf-8?B?cVpwOGw3WFRMUklMRzZsbjNKU0tROUpTb1pmdE5IaHZCV2VZUEgrSmgwa3I1?=
 =?utf-8?B?eCtISXhzeW5WSmV1YlZ0aURwczM0cGgraTJaUndlaVY0Qk5XNllGVzIwR29C?=
 =?utf-8?B?cUQyQjRsUDZmaHFBdFVEMW5KbXRWNWNaK0pCMVV0THRPOGkzVU53cTNrdzd5?=
 =?utf-8?B?cHIvQXdLWjlyenpJQTlrZFlqYU5SNUxEbkNCellPL3h2Rjk3ZVB0U253d0dn?=
 =?utf-8?B?NDlmQTZ1cWRwUE15ZGNwYmRBYVc2RiswRzZraFB5by9sL2RNNkV5Ri8rZXlN?=
 =?utf-8?B?MG03cTR3SUo0dFIzL3hkS0JSVjdkcFQzYlFCaE9ha1BzdzF5WlJGQW5oY3M0?=
 =?utf-8?B?VUJjVTFoTnhocmRlM3U3ZmJ6SjVjd0ZObG42MXhHYTZCSGV5TXVyNG12TG5T?=
 =?utf-8?B?NE9oWHh1d3psc29SMkxVSS93ZFJwRHBjaitnN1BFemRzekY2SEk5RUIydlhU?=
 =?utf-8?B?TEt6N2NwVWo0SHFKY0VPWVpvWThVZHVkR21JZUtLeHllNE5sbG9kNlI3eVJ5?=
 =?utf-8?B?THdHaHZYL29yTnJzMi9KUVNxTWtUVE00WHdPTHFHNTVYV25wSWQ2b3EyYUJ3?=
 =?utf-8?B?clBtdTZLdWl2RFNGemR5aVpqbi9wMkltdUx6WkNSWWRmSm84LzZuNHovSkpU?=
 =?utf-8?B?U004eTh2YnNpY0M2am1TSVF5ZCtoaHcySDIrMDg1Sjlha3MrU0pxbTk1V0pT?=
 =?utf-8?B?cUZuZ1JMUkdvejlGZUV0NDZScEtqVndsaFpDUUpxVEc3cWlhYjlMSDVHVEtH?=
 =?utf-8?B?L1RsQjExZDB6c0hEK1VLbHdaYnlNUlBnVnJSaHA5TWRWZnhPMzh6UDJaUEo3?=
 =?utf-8?B?SG1uRUk4RVJ6MVhkNzlIWnZTMEdtVDIzOHdIWnZ5bThPT0RPMFUzenZZMHBR?=
 =?utf-8?B?V1FITTNUYWNEYlpvcEpwV3VyZXgzRVVIK3FtMjVaNTJKV3BvZnBMN0FsSUdB?=
 =?utf-8?B?RG9JWEtnaVJ5RVVTM0FjWHp0Z2VyTWxpQ0RPQjEwdUF3M09FUzcrd3RRb003?=
 =?utf-8?B?dUNtd0xneG1hZUVKQ2NZR0RMd2NBMW5UeVBXUERjb0dIYUlDU093Y3FCQ2JC?=
 =?utf-8?B?TGFwVmYveEJNeE5KbE1XRFRxU2NjWnBtOTd4TlFUL2pSOWtWM01BeWR2UW9M?=
 =?utf-8?B?SlFjNjN5czdndFBKdkdmcGVFQUR5OUlNZkxhRDl6V0xJQzVDWUQwazBSUVRY?=
 =?utf-8?B?Mk9ucjFhdys3MCtZMXZUVk5rOXlQaTRMUDE0QmVBT1J2RTM2bW4yUlhLampX?=
 =?utf-8?B?Y2U2RStrTEE3WDlYdmR2U1ZUYU9hL1dLOFhxS2gwMkFrOGNVbEMza0U0aVcv?=
 =?utf-8?B?ZkdDZllQSDc3WW9HbUlheTNwOTU4R1hUZHljRUdxMUtXYWVsK2ZmY3I5blhF?=
 =?utf-8?B?dHZucEZiVy84OFMydHY0b3FOOWYyd1pxQmFDUGtJempBRkJKRmZmaXluTDBx?=
 =?utf-8?Q?jpJs=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 06:48:04.4395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ee8241-55b0-4428-3b79-08ddffed4e70
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB1880
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_234812_436192_D01BA7B2 
X-CRM114-Status: GOOD (  10.72  )
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

sn65dsi83 is mounted on som. Add the static configuration there.
So it can be used by other boards too.
Use mipi_dsi_out from imx8mm.dtsi directly.

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso | 40 ++++------------------
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     | 25 ++++++++++++++
 2 files changed, 31 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
index 5955d48e19ad0035038ea4ad7838b3e09d10b2ec..5d4f6a9c348b57ee903c7b74f8c8e2b318060945 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
@@ -81,6 +81,12 @@ dailink_master: simple-audio-card,codec {
 	};
 };
 
+&bridge_out {
+	remote-endpoint = <&panel_in>;
+	ti,lvds-vod-swing-clock-microvolt = <200000 600000>;
+	ti,lvds-vod-swing-data-microvolt = <200000 600000>;
+};
+
 &i2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio";
@@ -128,19 +134,7 @@ &lcdif {
 };
 
 &mipi_dsi {
-	samsung,esc-clock-frequency = <10000000>;
 	status = "okay";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		port@1 {
-			reg = <1>;
-			dsi_out: endpoint {
-				remote-endpoint = <&bridge_in>;
-			};
-		};
-	};
 };
 
 &pwm4 {
@@ -168,28 +162,6 @@ &sai5 {
 
 &sn65dsi83 {
 	status = "okay";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-			bridge_in: endpoint {
-				remote-endpoint = <&dsi_out>;
-				data-lanes = <1 2 3 4>;
-			};
-		};
-
-		port@2 {
-			reg = <2>;
-			bridge_out: endpoint {
-				remote-endpoint = <&panel_in>;
-				ti,lvds-vod-swing-clock-microvolt = <200000 600000>;
-				ti,lvds-vod-swing-data-microvolt = <200000 600000>;
-			};
-		};
-	};
 };
 
 &iomuxc {
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
index 1c472e9012c3ad3445fc0b17e0393a9c0e243329..e7f9fe7ecd8cf147a6b47b2036d71073008da390 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phycore-som.dtsi
@@ -287,6 +287,23 @@ sn65dsi83: bridge@2d {
 		reg = <0x2d>;
 		vcc-supply = <&reg_vdd_1v8>;
 		status = "disabled";
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				bridge_in: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+					data-lanes = <1 2 3 4>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				bridge_out: endpoint {};
+			};
+		};
 	};
 
 	/* EEPROM */
@@ -304,6 +321,14 @@ rv3028: rtc@52 {
 	};
 };
 
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&bridge_in>;
+};
+
 /* eMMC */
 &usdhc3 {
 	assigned-clocks = <&clk IMX8MM_CLK_USDHC3_ROOT>;

-- 
2.43.0


