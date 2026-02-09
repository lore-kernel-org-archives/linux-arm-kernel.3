Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC19E81BD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=47+ONjsoN5DBXWAxqxRGIi3sBX85pIgWPLUDR9isXMs=; b=T02dSdQATPkVGe+vSPx8K424YB
	JVofLyMW9Vt2Vy/fuuTeLN5NoHz7YQ+EMch66C+X4Kclonk4tNAFd6az9gonROfWPhj0NY0qrtuFT
	EopNaV07BC8AuDyMA5fCViMimiJ5XhDzT8vWMd9af5hutyB7QNYedZtJh8qrS6Jy/CazJJzigCiEW
	MBTWswYP1b7tRx5pLrr3AHPZiA7X0NmPITiYYsjWd849OZhorQ3ykI/JI73VN5loymQuO5XPRmAbs
	uaLS4gAl9OIR0fE6O9ix2IkFNYCkRePlA9ljj1vbA5HL6JNt3uvo06QNjTUquBdmTgiGZgFYCb3vE
	4EecOnbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSl7-0000000FZTV-2kGX;
	Mon, 09 Feb 2026 15:01:05 +0000
Received: from mail-norwayeastazon11013067.outbound.protection.outlook.com ([40.107.159.67] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSkz-0000000FZPl-3lEL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 15:01:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yhq321vDUM4jJBCMiRQmmsYm3C8MA6cXLXgQnbZGMjg+cHG8nXKMtFWq5952Fnp5119tvVfjnjcDkNBUxmzwPCSFjYm33ahsvfxXJlarWPWvVTNkOngZh5mruDmO+XJC2QXx3hh+Jd+9q0sdynnKzL3OyBSGZ8m9J2WWN/XQn63qeME1kOApRM2rbHAwgMioM18yYGxfDP/BLrhHg9sTrrEmXie9IrRfQhILFGTGdvKc/Al3bLK9DeQxKSKntrwW3qepL1PKfF47ezcknIa4hDpvw/gwqj+2He/Awu3JGZie07taoFOnTgkN51LslJM8ruNXzxiIjFULmxf5ssP3zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47+ONjsoN5DBXWAxqxRGIi3sBX85pIgWPLUDR9isXMs=;
 b=vXBAhHePmHT24oSQSCT+pgpomxKX+hHuRdQt2lOUOytAxxZnsgvkuwlEtTJ/I5oT9/bZk/WohHcPWUzyvS0uXY6S2xpeD2b1QCGOmwq4UwXWXDjipBDMip0mdPuKgtObKjSuBL+hbAUPXJlSCHfsaKyqmh4iOfHOklmSjjh3frb9QXSID2ZqnCkZQFO0T+6tgwrLgMGn8CK1V0Ml1dHD66/7pDoOQExf61M4m09RY2/n3mbbLEDFmZtYQ1TMmou/aqx5Ro9Y7jEbfzBGdgXdBKTTyCv2nXHKgHdlAKVkOdDsXgTVJEVI9SSsWx5/CIFHOC7EwGLLBVluNfJNzC2e4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47+ONjsoN5DBXWAxqxRGIi3sBX85pIgWPLUDR9isXMs=;
 b=YwZdmVqo4Z/YUba0xrEf9ajx5LcD3wwGWhBBd9u5FWtcJ/1qnDp7Ip03k9kir8ut/vIYcr0jGPKbpKxm57heqpcuteOTa27iF3pMUftuPQUQpbg3l1yH/aUcm0jVW6VlD88POWELhDSvGYwQtLQVWHWE1zTZpQDohZf7ypmObOH7MBECWJVYqxGaF7qRdVW2X7o4jg0VAQ1T600LLc4XO2gKvyXoHGCS/qUqkHUcl3H4209nrQuNdSryyqPSLfpAM/FIGIMGwuzwzyICoC0baNS1xLCINGgRULovUxRYMMlGicfRbe841HU0eprhPiLTexz0hGtw8MM/IK7ETyElKA==
Received: from DU6P191CA0017.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::28)
 by PAWPR10MB7152.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 15:00:50 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:540:cafe::90) by DU6P191CA0017.outlook.office365.com
 (2603:10a6:10:540::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 15:00:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 15:00:48 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:02:28 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:00:46 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 9 Feb 2026 15:59:35 +0100
Subject: [PATCH 5/7] arm64: dts: st: enable all RISAB instances on the
 stm32mp257f-ev1 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260209-stm32_risab-v1-5-ef0b2b6a7e0a@foss.st.com>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
In-Reply-To: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F2:EE_|PAWPR10MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cda8d90-f23d-4224-51f4-08de67ec028b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0VOTFBVTHptbGRVTkhzQUtrZ0c0M2xiaWQ2WUJia2I1cHpmdFlWZ3lscm9w?=
 =?utf-8?B?MUZxcExrQXFhUkhaNFNxQWxkU1BMUlRlVnVhV1F0ZjZDNUJFb1h4eGRBalRz?=
 =?utf-8?B?aXRrRXNVaU9QNC9iUVNQK1BaZXJLRXdUTWZqWjhRaGJTTjFUb3FOdlZnL21p?=
 =?utf-8?B?VXdnZS9mWU9pL1VnRWErWTNTOUg5NUZmdEhQZ1R4eWhTbDVUOTVnZlRiZUk5?=
 =?utf-8?B?aU03N2MrSmdhUWZrYUd1SHhIUWo5K0FiVUhuNmJwelBpK1RjdS9aVUJmT054?=
 =?utf-8?B?aTdLR002R2tMaWlWY2k4ZFhLdWJrb0tab1ZSQzI1TVRnbnhRc2RWRDNTN0I2?=
 =?utf-8?B?OU4yTlNwOWFncGM0NndGNy93VDY5TnNBOGJSYmpYc2dkVDZrT3JsT3V3WVNk?=
 =?utf-8?B?enpjT25iamM2c2IrUDhLd005cXdrOVd5NmJSRlIzdjlXbEF3S0tVQm5Nb2NM?=
 =?utf-8?B?bUM3TEEyOVozMzlMeHFkZXpRaW81M2N0VjFGVDVidlpRbGkxaGdUcDEvd3Nj?=
 =?utf-8?B?RmlESGUxOThOT3R1YnpZRTBmVm0rRmNhTlNlbllXK05lakNkLzhsQmpZVzdY?=
 =?utf-8?B?VEJJd2h4cVhIRG9BaklyMzNMSktJWEpNbkRMMTA5cTdXNWZZanA5OVBLdCth?=
 =?utf-8?B?c09NdDhSRTQ1dnVWOGNqOERneHE4RWJzYnBydXZTd3JNaStCaXZ4NUUwTUth?=
 =?utf-8?B?SElaNlRUSlMwSVZkZzFCU2kyNnh0ZnNHcEFIWnFCeGQrUmpBa0ZhZHlUditU?=
 =?utf-8?B?aGFleTdGUjJVR0J5a3I4SVlvZWdPeFBIMDNRdEU2YS9ESGxpNm5Mem1NdTRF?=
 =?utf-8?B?Ym1LTnBvY0lLb0Raem5RdG9GUGRtdXdoNEZyMkF6bWdwRDUzOUl4RndGZ1py?=
 =?utf-8?B?N2VLRGNjcFdxQWswN3FRRCtrOE1sZWN4ZWNrSzNPY3VSeXV0QVZvNVY5dUR0?=
 =?utf-8?B?cnY0VlZZWktVVjNLMDJka1M1eTR5aTdhaGdnQmxWVnlGNlpzKzhzeW5YMG5C?=
 =?utf-8?B?UXVucXRPK3Y4eno1UHBWZ2huMUFKamdBRDJNd2pUUStjYkliVUJMbUNOQVly?=
 =?utf-8?B?Y1REeU1aMkw4Rm5ZdWxLK2NQclJzUk5lN1k3eVhyb0dyMUtuS0l3RmJuTjVz?=
 =?utf-8?B?b1ZJTWphUHYzekdNQ01wczYzRjRkSmhPbHN1M3pjMk9Qc0tGYjhjaHVScWZW?=
 =?utf-8?B?ajVxbkdYU21WbWlSc1M3RG1tU3VQdU04amlLTzBHSitJeHEvVDBVc3hudWVw?=
 =?utf-8?B?Z2E3UGtaeUlJS1pFVVRFLzMraUtaeHdFaTFnc0VLMCtoRyszOTZkajE0Q3dR?=
 =?utf-8?B?MG1LaWNEbituZHU1ZFhBckk0eW44ZDczbysvOGVpVElib0s4dEV3NWpGdG0y?=
 =?utf-8?B?ZlFhZ1ZRRTFQaWdrTjNqcDQ4R00zMnlleS92Y05XMUZZV1o3YVplYkYzZnQz?=
 =?utf-8?B?SzYvZll4bnY1NnRJZEIrY1hPSzVNOTVTSllvRmZ1ZjVzaHZjUmZkSXVKdXk1?=
 =?utf-8?B?SXRBUWtjL203UitiUjdvMzNjeTdLZ2FYUFFwd0J2dUswZTN5KzRGVGhwZmt3?=
 =?utf-8?B?dU81QUY3N1RZYVBMT3pYL0lnb0hNQnZmR2ZIdDBJWk95b01Wb282S2tiY3dw?=
 =?utf-8?B?bGdKdVRYRVBQWDdHK2wvam43RmdQVFhpSi9ONHNPc2s5aFQ1S0w2S1hNTE5W?=
 =?utf-8?B?SVBCLzZXdmkrY0JsYVNhTHhrZjY2QTg4Vng1WEZZU1RENG9yRUkrakhpWjR6?=
 =?utf-8?B?cmVhUnd1MHUwY2FWd0Rob0lxRlh6TXV1UEs1c1JqQXVock1LZkV1Vm82Rm9j?=
 =?utf-8?B?Y0JBTnlCTENSNDZFcE0yU0VUemM4REpUM1lJeklMOEM4bmRuYzk3M3VDclQy?=
 =?utf-8?B?MmswazVGVGpSN1prRE12NUppcUp3TFVkOHZWL2JHNFJrV0Q2b3BnV2tPUnhr?=
 =?utf-8?B?bEFjUEJPR3RHZXdRb3NOUUtCbmN5Q3h3TWVtYjVieWFaWkVObnJQNlY5Q0V4?=
 =?utf-8?B?L2dFZ013bko0cmlxT3JsN2JuQ21kRzNkSlN1b3YwMlYzZnBSbjUrK3YwczVp?=
 =?utf-8?B?QU0zVldKeTBod2lrREpIcFNkU2ZNSXJyZkVRU1ZsQzZFYjZ6RmpvYjdKQnN6?=
 =?utf-8?B?RXp6T05yYXZCNm9hQlhPcU1HdTRna1EvTmwwWkNKTDFucW5qZTl3UzNENkZO?=
 =?utf-8?B?UU53U3ljTlBwNHZCbVBqODhNQjRWWngvQ3drTDMyZ1UxZlErYVJ1WVdaVnZw?=
 =?utf-8?B?L0hsdlZxY2oreXZVK1dEdkJYSmxBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: j+4fWNYsspO0mbdthdQ6cV9K454nPcxz4bWjpxJ4U7jZQuMcRwZOohKf6g8W0VF4yUxZvUAcUKqWpJGCVdwU6QlgGUzcV2Wi+dbmDUEGO7cNC0H+f8/OiP/oc2SyVIDlasYrMD9dMAQWJ1YyNJtK6HDhiw4hTai7eNt7oaYOwdlOoRJ44Zjh3kOX4jl4yr9bztyq1BS186uJG/Ne6Z1vlqxyCOtPGXi7fLmdFcdHDi+gOVLU0c30TzQrkYAeCB5PulCHd9SBodkPInt65852aspukhuxWflru5/0apimL2cRlaSBKBatW/b3xIlyLJHD0PqG28xf6lKM5NfAquZ1AAH2m0K/IUhj8kfPoFh5/2ZSkTEL4qg72fAk+CkGoH2Wbqg7JTXagKe1uoPO8+wM5C6+QP9vhDeBqHmjbxQhkVLjSrNRo6wQK8kbB4SqvYUq
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:00:48.4656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cda8d90-f23d-4224-51f4-08de67ec028b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_070100_063150_8A91B56E 
X-CRM114-Status: UNSURE (   7.09  )
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

To be able to dump the RISAB configurations, enable all RISAB instances
on the stm32mp257f-ev1 board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index bb6d6393d2e4..973acea6d248 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -352,6 +352,30 @@ pcie@0,0 {
 	};
 };
 
+&risab1 {
+	status = "okay";
+};
+
+&risab2 {
+	status = "okay";
+};
+
+&risab3 {
+	status = "okay";
+};
+
+&risab4 {
+	status = "okay";
+};
+
+&risab5 {
+	status = "okay";
+};
+
+&risab6 {
+	status = "okay";
+};
+
 &rtc {
 	status = "okay";
 };

-- 
2.43.0


