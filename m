Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1563DFD9E34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 04:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADTHSpRp+uv+dVOZtQkY5yAvdQXOfCFG4kzF4oSxP9Q=; b=te9xXyTlH3VVxzYi3BWpnomquH
	UbntA88LlfzBbZdgW15JRSvEdv3Vm+2oAQzpb/1tdLJSVVokfNBI25XMNrmSaCjaAzuPkh5SKCpMH
	VJRlD8MVefSn5t4GyYyYz4nP3Kn8wojga/kZ05XDCS6vkwi8/U3DdFtTnlw5VqHThzZgbmTh+YTaJ
	VCCiqhpySmfXh52FjZf36HhOje+Tg7FQMTRp9RurG2iSjt9eVOHmBUhgTQEJ933XF6+GNdCCvM+id
	ZU/JCCQ7Z3qAQJjTWfcf8KC91bVjishsint7s0+pcdi0rFFEFADgtyeqKm4fX700GW+NX6vZum8Ho
	XDRV+acg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpRr-00000007eiO-10tl;
	Fri, 27 Feb 2026 04:27:31 +0000
Received: from mail-norwayeastazon11023118.outbound.protection.outlook.com ([40.107.159.118] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvpRg-00000007ee1-48Vd;
	Fri, 27 Feb 2026 04:27:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJhZawAboBcAsiA0WfrbyX1fTn26AwyulAPuk0AvitEooowWCjyqzmK160GcFldFba9AqfxOxT2kdhWe6qoSyYmL+7rcS5Eey+PvQTeGQk9cfgB6MaicS6MIqvUTNh2frTO4JaGjypO3rfsflzZdMoPxbzsWvj3YlhkQM025ILORGi0Sj1w/9QX1WNuqIs2dcxbHfA81PN+zjxGXMvgyy7jp9J+bjRU+b2n+lsQTe70HU9mjZZ6LGU0o2jcr6CqS/AuDuQOFM+rScVDRRDXetAXeHVB/oyq2yjtjk9ibh0KNWPyTA6nAwDNMJ5rOT2aO5h7lc8lAhoJJsCCkZ8nE6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADTHSpRp+uv+dVOZtQkY5yAvdQXOfCFG4kzF4oSxP9Q=;
 b=mKXxtPbL1Q63ojyga17MO7bo/DyZue1KGNsdKLvW7JcVIT9D5BiI0f1mBaS9qcPTA21csOQAbtuoG2dvr8JErcCX6DUFCax2E/TinRyrqFrzWkWi282amtd1j53aM37k9ooUc0KEBR1OtOg104ZfGBHT9uJZAAhOVhB++ZbKws1yb5wlG83Cd15WGtpDocbA6DHoF6OxIQlx//G0dJHFGHh6Deu59k+hHybEtQhu90AKwHCuu1ThxTX6xmUKFnvu1gzZCaLa8twfHWQCTK48S6Py05xIx+ph0WhLCVKjTI2nCLOvmzCV0N31hcjJRRFZGnnAZ002eYT5w8p9ElVNsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADTHSpRp+uv+dVOZtQkY5yAvdQXOfCFG4kzF4oSxP9Q=;
 b=w0Vk45hW3MzwmZ+6C2TsVmnmAFZzBSzlxPNcb6u+8cQ60FYpEvvcS2z5XIKl6oephoNQbOofnTfrs7WYNujgXC5f2mbpeagjHg4knLlckINxgKLKj7XIWVFAo7YQpr97EOXl5Pm6RRLNIByanG7Mdmt4oIJ1v1x+7qRr2YmTfRaNsbDrAOFp4d/P03nhL0fe1vyMSvMrclKSksjbK3YseBg3LlApQo4EQTB/wRAPwAprLRMsOrJBcMN7Z6WJAe7QPtKdf36MBMdnZnqTGJMeyN+qFEXmZ/Xh7Yib9VD67BwZoTpOfc7e+uXuIBTLuaGEyLeWm1IDfFCuLpO2V0nYOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS2PR08MB8574.eurprd08.prod.outlook.com (2603:10a6:20b:55d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Fri, 27 Feb
 2026 04:26:49 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%4]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 04:26:49 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH RESEND v3 2/2] ARM: dts: airoha: en7523: add reset-controller support
Date: Fri, 27 Feb 2026 07:26:30 +0300
Message-ID: <20260227042630.3090808-3-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227042630.3090808-1-mikhail.kshevetskiy@iopsys.eu>
References: <20260227042630.3090808-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::13) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS2PR08MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: d446facc-8b5f-4cb3-5552-08de75b86d00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: RMO2E14sUL1GRHdzdwAgSbfPLuaDiEmgr7zQuMIpxFFY24Gf/6XT2Mp3P8AqRdtlujv9Esstre7gOVM7Mb6ZOcRA0WFuIcfTPazqqDBY3L5cLe0WQVwwXsyBBH1pwmQZRE2ZL4svyqV25SQkpg60BVmuoam+Uwdv7qyaR5K8QNSlKZte/skxr8pXtWKieuDF6O39f2+AM797LxHxedKeAoPgoEk+Z+D/nKu7xWSapOI3Wl2LNBj7tOMIrB/IMbQEZRvClMEzvoeYvpveHt7DA48l2myiWeUvbTE3Srs0nSxoHtZQuREQ/QakkE3qzLpDmlq8ccUOH3cAClN4AxffWyXJVb9XY8yxPIeKJW215CoFeE6ibbJqBpbzVnnivgzwdpmeNt4Nv29xOghkKDoTAEfboOBIRJnFmtlbU8iVfq4pwOUzyOlKqt7rz5gsvNJAzPFE6rOg2xiVmULHkbQBvXpZ/Dw/97e330WrfLvHO5UGls6xDQEmcjLQziBa5Wstcltf7N/cT80o+CHI09H4vR1KtKZuBFxlAQrQveIeZpqBindfaVKeOBqjk0MRRT15xks0kvZqs10LYB9HM4z4/q6XEoaZOTaUTMZcifjMVTysFWSI3VKZV3NuVmVgvrhTaUQMt1diM724nhgy7zmTpMMQLMfPGOrsuFC+nvN/e3HCbGzloE8ARU7awsgsZuQbukbgQl66twNghge5S2l//td1P/pIjJ8d2ni6u0cTNBJyE0977STfiMXx/N4yJCNYd656kqqXVs3cyuoWsBu3Nmv7/3OioOq1Qn2E3riv7Gc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A0MJguO95h3zed4eBj0R0GF1XK/vtFdXYE87K8f28JRsEGc6GXxqD699NHRc?=
 =?us-ascii?Q?5KOtx8+tAl8yfnhB/QECXIl/LDE4+0KOnllYZJkmF0HCCUqxEmnh1LjWOstI?=
 =?us-ascii?Q?LkVIOtt7UYCtJD+It/dmGCXun7pd1ahwSM5YiscSPtxD4QRuZfuLNHiZjjqt?=
 =?us-ascii?Q?4AVVK71tgIhXgAHza2v2yOjRqs6NuAW1N27KvXrYQh1oHTVUUR+m1R35m68K?=
 =?us-ascii?Q?Uv64L3M8B8z5YnYXoWzdspPwWlNOsbb7of3o/b5SFNXS3A0+WpJuiEEzZlRU?=
 =?us-ascii?Q?jVSe0MoM0XISDKZxtrWVuJXTBRxMlZO4izlrjfQfm9VFbpT4HzjrV6X1sfrq?=
 =?us-ascii?Q?/0zkPHBDl2xQuXeoXEGKBMIhZWzfu2HAA85FTdRjHauLeVSv+1e+oi3QXSsb?=
 =?us-ascii?Q?adTH6EHvxWw4PfXwiepqCufRmOc4KlndmP3h+fTCw19b8rqxF3SHxc+PjqIV?=
 =?us-ascii?Q?CwioRxEV5Ih2oCJHT27DELJRe4FNkdF9mPzAdHp68JBLfCPWAWhTYp7KVr9i?=
 =?us-ascii?Q?rdhOl5xLJcgyzWO5kfm3vu2YEsF517tdLZn5h8N8nMEvDNMokTyW0FXd8s+f?=
 =?us-ascii?Q?yI04RQKndnHgrBjiTzFaayAiVPVT8h4yruby/UeXQ8Q/Y43ExvGkalmuU4zx?=
 =?us-ascii?Q?Lvp/kdyzDNleY3uIeihWS2YXsvSW8Dfk+IuzbRJnPOc/MQH6yKM375Chq+hW?=
 =?us-ascii?Q?AINYDZdFwWlwhJRX46Zb1l79m7Q9iyKqhAzcgrRbgnUUfQavAzI5LyGgyP8W?=
 =?us-ascii?Q?lF5GXKTZZe6avl0nWlenldSqE9UWOACoOp32CEA+dSuTvODwjlVLTwHY6aPQ?=
 =?us-ascii?Q?DgjiLxHiVb0hG+w6u2Y9ct221Qu+ie3DZbZsj2xEYniPvMDqbpE9VnXAasMS?=
 =?us-ascii?Q?IIPzsAkYY0RKh03h5IthV1YZRAB8l1/GP0U1Iccethfq+uH9csJNFdBOg+CM?=
 =?us-ascii?Q?FWuhRZhKN4Q2i8mmNMD/qH/5U7xA3PtseUuip4E1ZgyiU482U9cYrqzxlwio?=
 =?us-ascii?Q?+0BMCGMy64i4yLa0r/tLpQkZ71CMR+Mfv31W3EjAsrGEHqbHTajrKTijT1eB?=
 =?us-ascii?Q?lWARvy7ajFvyGePWVexCB2Yz9Egrbg5RB6MBIBbj7AU/YC2UAYfR49hO0yX8?=
 =?us-ascii?Q?b9Cv8BZjoVbN+iGcedsR2M9kVR2XwYlfwrF57wjJ12+OFJjyUqd8SSSEfK1p?=
 =?us-ascii?Q?/itsyof9I8Fc8lp/kJZTe9H5M/82MP/d7vWQAKOyr4HTnUA2I4v2YLSwQEnd?=
 =?us-ascii?Q?QZuY420bcTZYlL7yJBQ6+UM/FhzSv8g112d5PjnyZNRVw7N0U9ylXe1b98uy?=
 =?us-ascii?Q?9hJcJkepTEJLK7nxJ09DvriWqdXcDoEMuDm1QGsdRpqUAx/h4jkTgg8dIEwD?=
 =?us-ascii?Q?u8WK6X7Thp1eaw0s6Sf8L3jzt8UUuSKFmTDQTd6nQYwoYLem1jruifrc5x55?=
 =?us-ascii?Q?rhSs7oYIPZqNLvUwx71exhmy2ErcY6RdRuQGxO5HuOa7V/5cZ7tzcRPDAGwP?=
 =?us-ascii?Q?5e2MFuuIzJXO1WGqZMGqhccciq+FbtupV1YQ1ndb/z/p73l9BQBXEOAqr6E/?=
 =?us-ascii?Q?CQFmW1CQwmLfx+5Sd7pU1EiPcOBau5uJYW5rlMGSYRRiMYFMx3QuZOejuWsX?=
 =?us-ascii?Q?s2WBx32LiRYTnLdvKEJ3mwbS6gpwVhUygoEj9E5inAiSMtZEcbEliJV+BR4X?=
 =?us-ascii?Q?ko23iN21gll1hFT9yG7oE8318nj6XOPIjTXhLwyOMdX8vcnvPocyvG/PDQBs?=
 =?us-ascii?Q?rtHZbfVCXFQ89jvW1qEGhTD3nNj9JyY=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: d446facc-8b5f-4cb3-5552-08de75b86d00
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 04:26:49.8258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ji8JF/KnPy3W9Tqy5jHyGMmqj8D5yteSLnDtYHgvau2UlOGMcE7g35vz1csnAJPNo1gz1znAzTTnmYw46oPoEqlo9DyPzbhDNeL8L8qLe7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8574
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_202721_025374_D85BD635 
X-CRM114-Status: UNSURE (   9.80  )
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

This patch updates EN7523 dtsi to reflect the reset-controller
support for EN7523 SoC.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm/boot/dts/airoha/en7523.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/airoha/en7523.dtsi b/arch/arm/boot/dts/airoha/en7523.dtsi
index 31191b8d1430..115cc44093ab 100644
--- a/arch/arm/boot/dts/airoha/en7523.dtsi
+++ b/arch/arm/boot/dts/airoha/en7523.dtsi
@@ -4,6 +4,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/clock/en7523-clk.h>
+#include <dt-bindings/reset/airoha,en7523-reset.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -91,6 +92,7 @@ scu: system-controller@1fa20000 {
 		reg = <0x1fa20000 0x400>,
 		      <0x1fb00000 0x1000>;
 		#clock-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 	gic: interrupt-controller@9000000 {
-- 
2.51.0


