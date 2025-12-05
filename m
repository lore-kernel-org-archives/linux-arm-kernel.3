Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20F8D2F7C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kflcTIcn6Z2Pj3q1mTfzyTKaqvxNQy721iGmJs36sdk=; b=xp2TrBJqjr/mSqI0idjjqfJTyW
	RiPL1Xf25vCsrJU2tmuJ79dqRpN6fPRsf/nTT2g9RN4QC6/v1TQIXJX/rL6tK1cq1JPUQSZyiyBmb
	wNGhSuwo70UgpJwfiRAl84R2OPvB7618tMPofDMQp+55RsVMdKQANSZFvhe3yYzGJWUYTMUJbjf3N
	7FtAnv0InJnahmzMnjhD/swJ/DAaJEGOVd+Zn+IQ920QWiJqGjPN8N2+qp/jaKv5pvNy3zjDOFfyR
	BMQlPt80nxp952aMOHLHCEzy5gv3XnB6/NS3x2GpKFpkRwHc2pYtBfnLbSUmPZHV2uq6CTwBcfJL8
	/3mmlAwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSCe-00000009Ig7-2meg;
	Fri, 05 Dec 2025 09:34:16 +0000
Received: from mail-westeuropeazon11020072.outbound.protection.outlook.com ([52.101.69.72] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSCZ-00000009Icv-0GPF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 09:34:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoXzhbCM1EO7XdeztPMd/jfTB6uuxb3jclNLX3E8OBWHmxlaCUNDjlKf1pgokMN1kK9+Gd8EqojHb5t65dMoOLY56tN28zO5mVBWOwazqO25rC8Qp/M2f/4VCSy27SvBx5Hx9MRF1vO6HJqyjIXr0o0EbhyORfEjO5VYuhgLVzfVde8WW80nC6EvKUnG9CBkl2473Ho1RdhqQoxqmE1gRfyQ+selpqoYoTfPXo228LTms1kgyiAwGqJNeQEBaIamcAQ437MNmc9yLs4daUYwwavnnhQnWt8iHH6PEYH41MskT7CerH0HQXsGyTgJcYv9iM+03ZF0KMCKDIQdGXcpww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kflcTIcn6Z2Pj3q1mTfzyTKaqvxNQy721iGmJs36sdk=;
 b=ZNXzTkw7tpu1BQJ63YBGB/w4tBXe8gn6GwMh67VD+PJxseLpCpCL6ft5w3Aj1/qUyBXMtrP0PWQR6298twonNknTY3Qhjss2QyTYQ/02BQel3iRb9B4ZsvWLLGLnnViG4femzsMJgH6EC28oSuxMBM4Md59RhfpJBWWM2dRUwbK2+XI5Mij5SilAGvGJ06HQzQ8ZbkBKpTPpC+GQHaFHgZ/UhQ2IEPfoD4IanYUO9RiyLXwkVf3I42+LGbM7GLxPf2/ZqrwqFcSq66xo+ppF3D+kufOEI6Y+gRyk1kpHTwwCT63lwRhDZhz+AF/bnpeisOUWVBz9fuZi6ICaRFBXWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=nxp.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kflcTIcn6Z2Pj3q1mTfzyTKaqvxNQy721iGmJs36sdk=;
 b=XaDASccHfpZQgnpit3/SGhK98xhVFNvLYAL/EuqoqB8wzh96ZiJvHckVEC9bdY7X7LiMClOKOvN4NFIcW0jMN2q+JusJwaM3D3+QL/GKLtp1gEyisefumzx9yZte9TED/brZzgYSjDP2Ohv+l7Y0jM/c2wbry3x9W3nzxy7pWpPjV+D5vaLHGaUi/NncIlpfI6A+ZfQhPgJSenbsXRUfTBG9Zf1elvH31SgGhU7YuCW2Lwq97U+oTY/PNuG26i8ocidGWCdfRg6Vd2HMSN++pUpJFP84AKhIPUqPr6Qc2i3DH5T/eOQycuwLC55mrK01yhXYB7m8iFjA6W0RLRczig==
Received: from DU7P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::14)
 by AS4P195MB1813.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:51c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 09:34:02 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::2a) by DU7P191CA0023.outlook.office365.com
 (2603:10a6:10:54e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.12 via Frontend Transport; Fri,
 5 Dec 2025 09:34:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 09:34:01 +0000
Received: from llp-moog.phytec.de (172.25.32.61) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 5 Dec
 2025 10:34:00 +0100
From: Yannic Moog <y.moog@phytec.de>
Date: Fri, 5 Dec 2025 10:33:25 +0100
Subject: [PATCH v2 1/4] arm64: dts: imx8mp-phyboard-pollux: add fan-supply
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251205-imx8mp-dts-additions-v2-1-d4db54fbadd0@phytec.de>
References: <20251205-imx8mp-dts-additions-v2-0-d4db54fbadd0@phytec.de>
In-Reply-To: <20251205-imx8mp-dts-additions-v2-0-d4db54fbadd0@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <upstream@lists.phytec.de>, <devicetree@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Frank Li <Frank.Li@nxp.com>, Yannic Moog
	<y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764927240; l=877;
 i=y.moog@phytec.de; s=20250509; h=from:subject:message-id;
 bh=bdECJ280vuh1oQQW4Zpm/JPK3/dkGfX59D+5J0WSVeo=;
 b=5cmji05hgHXA8cZCe6HbQcR3q44dvMstNrF87wt9CCn7xM3U9xB0C3VdbquEQ5QNl+fyjTqaj
 JKA0CrSD18gD9oxtYMsoh8gdpZpoM54umMJA9soYl0KNSdqZgj4r6f0
X-Developer-Key: i=y.moog@phytec.de; a=ed25519;
 pk=rpKoEJ4E7nD9qsrU/rfKVwMTWNWYaTBylZuJUXUiFr8=
X-Originating-IP: [172.25.32.61]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|AS4P195MB1813:EE_
X-MS-Office365-Filtering-Correlation-Id: 66caa3f7-a739-4afd-8958-08de33e16cc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlNmQmptVE9aUE1FUGp2NkltLyt4M1pTRzJQd01MYk9UTkhSWWZ1dFJ2L1Rn?=
 =?utf-8?B?MnQzSVFnUDE3YytHcnVDSUhxb1lseTcvbzRjZ2pXTzMzMnUycUtCaEdzd2Nh?=
 =?utf-8?B?UFdiSVBGMDlORU55ZWlNanBGQTFNdXhibThDYjNac1k1QnJBcDJjdk8wdHJT?=
 =?utf-8?B?bkkwTzlXTzlHWkdUQmVWQVFSS0JINE9CMnY5MHV2TEUxcUJ2UGpqWmNnV2ZG?=
 =?utf-8?B?VVpXNFBpSUdFcE1pTzBvb0xLZFVyZkttaHZBSUc2cloxZGNxazFQQlZFZVdh?=
 =?utf-8?B?QURPbzViSWtCbFFjNnhuNEpUZi9Qem1McUY5czZwVVV6clJQdkNvd1NvVG03?=
 =?utf-8?B?VkVUOU0rbGJNQWp1dm1uVVdqa0pjNStqVGV4TC9rSys0NG1jZWthNjZxakdN?=
 =?utf-8?B?ck9UVFpaWXVpejlHcjRSeXdPSVZGK01Ia2YrWU9ISmFTK0RvY2xzWGg2czh4?=
 =?utf-8?B?SzQ5N1NMOHFwQ2VBKzh6bW50TkYvV2lmOHhHY2xXOEdGajh6Snc5R3FZWnp6?=
 =?utf-8?B?cmNZUEs4WE5URTVjc0ZwbjVVMENPcVhLeXJwbVhLdFdzcmJoQXJGQVlJaDM1?=
 =?utf-8?B?NnFJYXpUOUFZNTBiaGVkV1RsN0ZCSUNtc1o4V29iRHJmSDhnSXpnYjJ2Y3FC?=
 =?utf-8?B?QUhjQlZYdHBOMzNpN3JZajRjZDRWVzAxMTM5ZStQcEVhQWlJUlZzOFZuMHpT?=
 =?utf-8?B?Y2Ftdkllbzc3Ykw1bVNhZ2tPNG1uTWNWKzNjV050M01mQ3RPKzBscnZ2ekFj?=
 =?utf-8?B?RDFXNWFVUlBKV005eTdtckxoaXNOb204U2ZwdTQ2aFY3OGc3RjVDRW4rZFZt?=
 =?utf-8?B?MU0xUWJCWHpWVHhyOGN6R05qMHpZV0tWRmJ6aUdsSWhmWnhSZHBSWHc2bDRl?=
 =?utf-8?B?VU1ZeXoreFJBRXArM3FMQThZM090NDFXaTVxWkFVaXhoNjREOFJ2NC91ZFdq?=
 =?utf-8?B?eitGUkRIZ2RHYis2WEdXSGZKOWcweU12MklsaGFYNFhEYU95UWNHZE9uQVl6?=
 =?utf-8?B?K1hPTUk5VXdReG0rQVJMdkpEaUc0eiswZlF0SVFhL1hXWjBzZmJWMEJhSTZU?=
 =?utf-8?B?RlFHRENmSzdUSTZjaDh4TFVwanBnY2t5K056Y3pNUjk4Y0ttOFdVRy9yNml3?=
 =?utf-8?B?NkhMdGlLeXNwZ0E3TTMwSjFXV3dQUlNPK3RnOFo4REt4MVU1WGJVS1YxSmNW?=
 =?utf-8?B?TitBYUFKN3hTVVNWWXljQ05LZkNrRE9FRTVhM3h1d1BPamk5Y0FkZGtNSUJv?=
 =?utf-8?B?azJoZ1c0TitwV3YrZDJ2YmlCdlBuWGFybHZhbVhCRXNGeEg5MVNzY1lBeE8v?=
 =?utf-8?B?WDBNZ25mSm53OW11d2pGNGZMeEtHMHN0UGZLaXdwTEVFejUzdW1JU3YwMlVv?=
 =?utf-8?B?a2gzaWt4TXo1UXp5YjJ4QUdoSEVmQkVyNUg5VHZxYmFyN2gvQmhIeTI4SG9E?=
 =?utf-8?B?NlJINXNIby94a29Cdm8wWHpwNFNzMm1TcHMyZXpBSVV4d1pNQjRGOFFSWmFH?=
 =?utf-8?B?VytDcEpTdXFHTFM4L0x5N29TZ3d2U1hFQ2xaR25WOUtERGlzdDhEU09VM3BX?=
 =?utf-8?B?RU0rQzRFb3dweVhDQ2VNRytEcE1KWnY5a2EyUHRtZjNic0JLYUhGVk1CYzZG?=
 =?utf-8?B?N29ZQ0RaWE9MUHFVTXlqSDdZZ3RXVzd3bURtNFlhRFBySFArWE5BRU1IVDd3?=
 =?utf-8?B?dUlMUkVodG01YWJHOVlMcU8vUllPMTdQVDZPSGsrVS9BSHRnWFAzNWJpdXd1?=
 =?utf-8?B?dlZncE16TENSQnBkUGFUU1MzY0ttc09sekVuUjErL0hmdk9FQ3FlY1lveVI2?=
 =?utf-8?B?YnlpZmI0M1VVYTNEQWZaZlJBcERkQkprbmE5N1hlMVEzenlhSHdlWWlwNzVL?=
 =?utf-8?B?cmlsbGxoS1FrRGxJenJCM1VMSjA4SEErZS8waWhnUjYrY0w2Z1hEVmhZMTc2?=
 =?utf-8?B?S1RDaXFUaUgyL2cvaHZJOVhFUnFDbnJNTXI2OTF4UU5FUnZ4c25tSlllU2x0?=
 =?utf-8?B?aVZ4WlpGZFlGQjkzbnVvZFZwYkU3YTF3Z0wwYUh4ZHdvRm9jV1NkQkZJNENY?=
 =?utf-8?B?WEZRTWFCSXF6T0RobElCdEdjcVlOVVIwMnJVRTY4c0dYa1VXT2R4V0ZOL2ZI?=
 =?utf-8?Q?UJBU=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 09:34:01.7746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66caa3f7-a739-4afd-8958-08de33e16cc1
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P195MB1813
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_013411_307911_81B72387 
X-CRM114-Status: UNSURE (   6.81  )
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

Add 5v regulator to gpio fan node.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 9687b4ded8f4c98fe68bcbeedcb5ea03434e27a3..6203e39bc01be476f16f5ac80b6365bce150ae37 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -31,6 +31,7 @@ fan0: fan {
 		compatible = "gpio-fan";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_fan>;
+		fan-supply = <&reg_vcc_5v_sw>;
 		gpio-fan,speed-map = <0     0
 				      13000 1>;
 		gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;

-- 
2.43.0


