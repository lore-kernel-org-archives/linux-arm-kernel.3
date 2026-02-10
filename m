Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1266EA3F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 10:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b900Vxve9wbfmmIxtS8m7DUUVQ1UwzklLLApW8VguJI=; b=Fw72GR06N+fRsnAtlC64CiCury
	6n7fy79HsR4bmyv1M2VyIOYomlPZH8VwNy54BTh2GE8+SI4NiHrwLC6h32NlpeIk58Z2Cj7dwDenf
	S4j8KzowOYRjKRzOsS+TIYeT+Y1wcSq5CDJzseTYijpn0yhJu24iJ44vkbX6M/4C1+NQK+Rktm/gE
	fNSLw0Hou6uQewVp04ITm2NTvV85LNxYaqxNQ5tkkesaaDdn9Yav81G2DuFdJ0suk22pwicLIIhEw
	YAnycyKH4W/X/Sxsm6h9N5W3MU8zOHvc2IhCGXUKLkDbBnjldt/3fAvCvQB9yVB3LuS2+RdaWo2bH
	du9tST9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkbJ-0000000Gnu7-3dPM;
	Tue, 10 Feb 2026 10:04:09 +0000
Received: from mail-westeuropeazon11010013.outbound.protection.outlook.com ([52.101.69.13] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkbD-0000000Gnom-1zDQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 10:04:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGKuA5USNrpuzNbP2x1FYWbn8r3la6UQyqbGiJYwZimR3LjUJYg9GF61T7NIyLjRsKQljxJsKMzQ2iPjo4y3JixjyxI/+qbEP+57Pbfc8rsDFeheSP8jGQ5+tEI3t8a+5gPqZBHcs7rkpkiVbR1TkUNgP99H05z+2GjJq0VMjHWSoul51llfA+w3G9nvOzjZI2mD4cK7VYqS+GuJGIfZbW3QacO/Am/zXaMRU+AncvVfErKwNBzRUrqAiGXLQt5KaPB+ExFo4wASigp/symJHrBRvKon6WZWOY9G6GK/YfxYj5lfJzzKz5fPyFl+ZlQeKT/+RAB+2gW9aPxdob7+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b900Vxve9wbfmmIxtS8m7DUUVQ1UwzklLLApW8VguJI=;
 b=KN/5n+weJoN9o+hkM+sNAhgyvaaX8fd9VjXeFAx2vPipriF+9oPQsmfncfQgoUvRv0Ns12mra+q3Lt4tzQfTedBCi6tWhjHOOwYRBt2SgKFglEs3ZS4VSyK1vfD7DQgtWdm48VfFDEP4/UnrnmdYb3+VsyOoTDOoeB5y6LhrrHgW1at45vQmu36jWuuVVGuSDMVoDnz40sYJDDCwfIrXvL3ZRee5kLvz0iwAwIGQ74yRkiaQJPRKE/yidIUVeQ961BN9G/wZ4TLEo8XT+XKcj8HdK8O4NoLWOzVRAut4A7qMlF/qnjuWuSKiebq07G3E3frYNozozAFI8Cu3ZejxtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b900Vxve9wbfmmIxtS8m7DUUVQ1UwzklLLApW8VguJI=;
 b=oxWeyA41SWdaIoTUsB98j3WhQXxOR/STWmbuBYzmKmrxy1D0zCziRBpNKnlOAiuZI2rsUlmXtdIcPDrj9EvyHIlcebpV9X3N5H4TYN9M0as7rYQHF1drkjghQP/P7xbhwOP1S/HNN37PdoVCjZyhXh5BDCBcIz45MChhEpACSJIJwSLQZYoUF9HjF7qYYUY96Dzt8jqqe+HDFS/5mVchx9e7OisAyYrwl/AkxgBwEs4/8+Lsxjf75WSxPHP+IplQOXUh5niL8cTrPkoGGB8g+AFDV3rlQtb/no47fsSWMzEqMKRHocU61tRdMKDtdR+2FYqzR/LJR2JUdsrRQtBdnQ==
Received: from CWLP265CA0397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d6::6)
 by PAXPR10MB7925.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:24b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 10:03:58 +0000
Received: from AMS1EPF00000046.eurprd04.prod.outlook.com
 (2603:10a6:400:1d6:cafe::9b) by CWLP265CA0397.outlook.office365.com
 (2603:10a6:400:1d6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.20 via Frontend Transport; Tue,
 10 Feb 2026 10:03:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000046.mail.protection.outlook.com (10.167.16.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 10:03:57 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:05:47 +0100
Received: from localhost (10.130.75.212) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:03:56 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 10 Feb 2026 11:04:00 +0100
Subject: [PATCH v2 7/9] arm64: dts: st: enable display support on
 stm32mp235f-dk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260210-display-v2-7-0592bd514958@foss.st.com>
References: <20260210-display-v2-0-0592bd514958@foss.st.com>
In-Reply-To: <20260210-display-v2-0-0592bd514958@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
CC: Philippe Cornu <philippe.cornu@foss.st.com>, Yannick Fertre
	<yannick.fertre@foss.st.com>, =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?=
	<rgallaispou@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.75.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000046:EE_|PAXPR10MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 311a0fcb-2056-4f05-549f-08de688bb4e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3UxaFlkeHphdUNBeWtIaUoyRFpkRGg3TmFnT1Y5RmR4WTFCNGc4SkNYVnF4?=
 =?utf-8?B?UTc4Z1E3MkVtZEdmaTRRSTZsampZQUxndXEwdU1wS0tCZzhlQXdQRGhJUXhU?=
 =?utf-8?B?M2lWVjdLVHd3NHI2ZXZtRUtjM25lWlkvZWVEdXhTYk9qeU52U295ZWpJV3NI?=
 =?utf-8?B?TkVrQ3BTU01pZjRBWmRRem1CalRaNCtUNno2NkYyQS8rbmt4UnFjSVVrZnBH?=
 =?utf-8?B?T09OLzFvNUtrb1daU3d4MWlGdXA3UEhwNkl3QlhUY0ZOTllmOC9uelIvWThL?=
 =?utf-8?B?Yjh2dEZqUWFmcHhYSHQ0QjVjUDV0Um5TQWhDUkYxUVNSOFBjRXJsNTVoRjNx?=
 =?utf-8?B?Z2RUSFNsbi9kVTFYQUJnUmZlUllnUW1tZGdFSllKOE9abXVjb0ZjWGJnSkIv?=
 =?utf-8?B?TDlJWHdBWFl3dElzaGh1K1p3VEVFOXdHMTQ5UDY1bXlwN2xOSXZtV0NnVEpz?=
 =?utf-8?B?Z0lDcFZTeFljUHZic1BxakNsbDREMEs2Zk9vb0JaSGc1TkpFWXJkY1BQbzdq?=
 =?utf-8?B?WE91SkZYSVFHcTdTNDNxUjRtN0VxZWxDSGh2dmpVbldKcFNkdFI1NVFzUzY0?=
 =?utf-8?B?WFBhOFloMHpTb0JTcnlqU0NrNzlZUFVlRFd6eUtZcU5lY1VjVVIvTjY5bDl5?=
 =?utf-8?B?MDhzd2t0S0JFN2ZzYmlISjZzdy9SSzBYWlZQdmYzcTA3WkQ2ZlhNQmVURkJX?=
 =?utf-8?B?MVZPdEVCKzd6dERReW9ickdHbStMN0xCblJOcnBsR3ZENkJzenU0YlpSSjcx?=
 =?utf-8?B?QUZGSkxHdGVwMlRsMDZXb1hSZXo0TDl0MGJKRmpGdUxCR2RYVk8rUEYwM2ZX?=
 =?utf-8?B?eWdjZWhLQWVETWJoTGw1enVqWmVjaHFLRTZtTHk1QkxwWXVaTWNEbi8xVmZ1?=
 =?utf-8?B?bzhKSXpYMTMrSzFQNlFIT09iekxIQnhTUUpKQ01XR1h1NjJ3NTRwTk9SNis1?=
 =?utf-8?B?VUxPdUNyMEpjd2Q0bDJmMU02Zi9XQ0IwbnJocjBqSy9MVmxTNW42L2MrZkQz?=
 =?utf-8?B?elYvQTFmRDJOU1BYOWNkK1d0ZmV4VytMSjJoUHM3WXNSS3RhV1Y4Ty84cm90?=
 =?utf-8?B?R2FUQ1hyMlorVzhqUktQOEkxeW0weFNPVkRuTmt0MU50UkJqdHNaSWJVaE82?=
 =?utf-8?B?U0poekE2Zk1PNkhqc3hnSncrSzR0dTVNK0lENnlwTGRKVTQzWXVZV1grNW9N?=
 =?utf-8?B?cVkxMy9vdEQwUnVEaU15YW9KbnRPNGVOOFN6NU03SURxL2traFAwK2pmL1dZ?=
 =?utf-8?B?T3Y1ZXBzNkNzSWZkK0gyWHVab01HYURwbjZSQmlrVHArODZLeWgzdWgyRHBT?=
 =?utf-8?B?WmtPdnhtdnlnTkUrUjVPRm5lM2FSM0pIV3lLVEYwTWhXblhtNWUrMEVtb2dj?=
 =?utf-8?B?VVFnS2o0djBVaDRpY1NjNWFzaXhSQ2xpcjVBc2dFWFcxRy9MTWp4bFFDcGhD?=
 =?utf-8?B?Qm9JVlJxK1RadWJvRHJUeW04cSt1cThrY3AwRUI3TUZ0S0lPTFVDaitCY2ov?=
 =?utf-8?B?K2JEcmltcytjdTB2Q3RvVHVvNWNKY1NDTW1RMkFFMHpuZ25qekFjMDhPbHlR?=
 =?utf-8?B?K2tQeldBOTRyVUlVOHR4MXBRWk1NU08wUkxReFRlN1o2VWtSV2xwSkw5SjdN?=
 =?utf-8?B?ZFhhTENJTG1mQWQ4TnMxdnJueU53S3hhNDdpU24xRVptclBXN3BYOUFxN2sx?=
 =?utf-8?B?NW1qUFpZODlBeGVBYWFhdmVMSlpUQnE2VUxBODRQN2gxNkNrVUk2TG5ocWNQ?=
 =?utf-8?B?alFUWGVyUWRQT3M1RlM4YnBRdzdIblk3Y2VmMm9VU0QwTDNmdHJ6T1g4Q2VU?=
 =?utf-8?B?SitCKzJjMUpLYjhydmJYaE54ZGE5VGUrejFGREFrWHJWQlNES3FIWmdGNkRT?=
 =?utf-8?B?ZEJ6NEUwblN5OUhEazNZNGVyNWN4WFhsaFVZWVVwTFpFd0tzcUt1WW1SV2xk?=
 =?utf-8?B?dmo4UTlaUlR0UFdmUlI2UEU1NEhyaUlEUGk3Vy9jalk0bDU4NC9YM3p4dElp?=
 =?utf-8?B?NXVkRllpVjZ6b2d3OGFXQ25JTWxrdmJxOXVoL0hiTXc3OEJndG9IYkdSaXQx?=
 =?utf-8?B?RDBzNktqT2doWDNKekVFdm40eVdIUkdkMkdpRUErc00zd3o3ZDM3VnZwR0Ex?=
 =?utf-8?B?MHFJdVpFcmhNdE5sbVJ5Ry90SHVaYjlPYmVKVkZuejZMWjlXd2dWS2ZMTGUw?=
 =?utf-8?B?RDV5ajhFd2g2VDB1eTZKOEJLZXA1MUNKRFJiR3o0RGc2SEUzdHNpYXYrL250?=
 =?utf-8?B?YlJHOFhxemZQb1d6L2cxb3VLN2ZnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: r/6fAambDw58GhTtCepLvQamzod+c8S8nwrRIfxOy8Bgw5zLfbNpOP+6uHfSYYrGMIPIQ5i+ZeB/fsJ3W+S4DRqrWlA2vKfgAXsreaAH7BqnFXmRQsWQNpibrRPyr5XCcTuDzfJss2jnw3A/ULPneY0nmf0IEQ4u2d1fTOY6H+TCYST3pRa//5PHiHO3mjaLO3fTZqGdVP95w7cQIlwNNf0tkEyuItsz3H1pWB7MMgY5RMcHF9Il9NbLYj84pJ08tF8TYffasxe8p59zYUIzMvACUjtbgrViY2HLpotBsxb24t9CD55XLEl+vLbYmkFvXhuya3KqcWzCX/GLV07dTQWgUHhHJKfILzP7Mg5HZ3iE1R24OzIysfeiZluu+miOjD+kUGOl016tGko+7PFXHxKcURCox4jedTdDsrq8p8C5sM6yunyGRAt/1NhbDFy+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:03:57.7255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 311a0fcb-2056-4f05-549f-08de688bb4e8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB7925
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_020403_545235_86D749A1 
X-CRM114-Status: UNSURE (   8.57  )
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

Enable the following IPs on stm32mp235f-dk in order to get display:
   * LTDC
   * LVDS
   * WSVGA LVDS panel (1024x600)
   * Panel LVDS backlight as GPIO backlight
   * ILI2511 i2c touchscreen

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts | 89 +++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index 0c7874885381da73b9274078f3efb9f0b042504f..3581892f827cfc43c93050110d438628301c5c99 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -60,6 +60,42 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
 
+	panel_lvds: display {
+		compatible = "edt,etml0700z9ndha", "panel-lvds";
+		enable-gpios = <&gpioi 4 GPIO_ACTIVE_HIGH>;
+		backlight = <&panel_lvds_backlight>;
+		power-supply = <&scmi_v3v3>;
+		width-mm = <156>;
+		height-mm = <92>;
+		data-mapping = "vesa-24";
+		status = "okay";
+
+		panel-timing {
+			clock-frequency = <54000000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <150>;
+			hback-porch = <150>;
+			hsync-len = <21>;
+			vfront-porch = <24>;
+			vback-porch = <24>;
+			vsync-len = <21>;
+		};
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds_out0>;
+			};
+		};
+	};
+
+	panel_lvds_backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&gpioi 4 GPIO_ACTIVE_HIGH>;
+		default-on;
+		status = "okay";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -100,6 +136,59 @@ phy1_eth1: ethernet-phy@1 {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_b>;
+	pinctrl-1 = <&i2c2_sleep_pins_b>;
+	i2c-scl-rising-time-ns = <108>;
+	i2c-scl-falling-time-ns = <12>;
+	clock-frequency = <400000>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	ili2511: ili2511@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		interrupt-parent = <&gpioi>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpioi 0 GPIO_ACTIVE_LOW>;
+		status = "okay";
+	};
+};
+
+&ltdc {
+	status = "okay";
+	port {
+		ltdc_ep0_out: endpoint {
+			remote-endpoint = <&lvds_in>;
+		};
+	};
+};
+
+&lvds {
+	status = "okay";
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			lvds_in: endpoint {
+				remote-endpoint = <&ltdc_ep0_out>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			lvds_out0: endpoint {
+				remote-endpoint = <&lvds_panel_in>;
+			};
+		};
+	};
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;

-- 
2.43.0


