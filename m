Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEDEE81BD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 15:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2ZH+1InPOkhPV4isG/wM71yGay/lZvL2jsoHve5S/Y=; b=mMTMtJT/IETeMwPKFAdjdrk9YR
	47N6OLjS8YuuHWs7V3lJ65gt52XbvhrDV8itpw522SgNwxHsp7jMl//riM3ZyCPvixtPzFW8db6Tw
	TPU4E4zrdVgkA8jJTZADptlWD15+E6OdBFFKuq32yLq1VCGS5NUsLlb1Twka7W95NHCJjtb5IQ15U
	2ViZApABm93kADu5MNngBKecJZPTS7nwyRUeDIOHDFjT7uigrfKHMh0VXDQF50njMlZxtZyHD0XlM
	3zWfn0d5AB5uYhBJYwZp0P1LFjZi0oXs1GGA/O89CG+1NOkhtwhfq2WtseQiny4eZ1Pf5Ldbc1w95
	wwuHxcHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSlK-0000000FZaf-0JyV;
	Mon, 09 Feb 2026 15:01:18 +0000
Received: from mail-northeuropeazon11010067.outbound.protection.outlook.com ([52.101.84.67] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSlF-0000000FZX7-2BOQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 15:01:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IBYdNz4iupYBUdANLPQzOLIlZoymqwJpq2V7CQ0KoGK5bu6Faoa1BHFv2L8Mx5HaZsA6M/0ly69yKk0vh0YO0hsbBz9i1dIIanIPQMyYrq9o+F/dIXr7AvT9BxvvBNXltrEPleY/uahTY9KvIyjFyvs8PznGjg5PCdU9oVUnOFQ9w/VICFVnZ+gwkbVLTqM+9MKiyBM1pl/5dEWrK20MK85/Y2sAu3ZUSLfhBtEfGfyhb39h6kzAY+K2vYjR1jQjjKj1iEnWL08qQt3pY8WlVnKWCipjAyANY4KmX9t89H/ARK4ytt7J3qgDWNfD5DD2OS2uN070EZlp9R1y0Tz3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r2ZH+1InPOkhPV4isG/wM71yGay/lZvL2jsoHve5S/Y=;
 b=y+SV80U7Zs2GASjNw1XMymUPe88WIFou8ncSWGq1Z9j8Rf+wQtpc92EkblouBJy+LAwmj5WJ5kTXlb90x3ZXnMgKvMKNyPpP+m4rGoVgFZCe5tV0AkhaLPmLzrRoWyaIQ2hxQfqw4UjDjoGJCbAdO405UUeeHfnmKrNuX/mQklm8684ARE9+JggCTFVhdvIxYxPIKk42STw8TOpwHfbOvs+a68VVIhdwm3jSPBqljZnl1v9LPanU7ISBUzvnBInggOUIMrSZ3KjY6tVUxXtWtI3uU6NUX/+gE526z8bdjVzLy2UXiFlVWut046c6/CK0zIGBS7vMkWKgS62PSEtwCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r2ZH+1InPOkhPV4isG/wM71yGay/lZvL2jsoHve5S/Y=;
 b=M6GX6kiyHDQDY8+Q0Raax95FgIj5hruXhXCFkKYqNlHcgC0XfYDw5UJXgeUN1Mq8/HlqYLcs0ernXi5XG91wRavuT2M1rZIeswuO9UPMqxwQQ8vpQ/Zqf7rEQ2WP49JwZ2+EEEyCf/sXBQYg8jBUbK0SyxulSBQjTxMPzk23+cDD0u63t9bG4paVmN5BeYYZS8EGl7BLPDnU6dwdmI7oLtG1RuHaAF+Zex4P5r5IET8gp5toywIs/bjsU+EGb1oQQ42qpWr4mWzDANpLBIQKDqCoxryQfCh3Z/SPudUHDEd3jFVIkh+OmUtVTL9q/ikY1Rn8iKE59PqJkpQxyC1I/Q==
Received: from DUZPR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::14) by PAWPR10MB7343.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:2ee::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 15:01:09 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::11) by DUZPR01CA0012.outlook.office365.com
 (2603:10a6:10:3c3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 15:01:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 15:01:08 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:02:49 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:01:08 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 9 Feb 2026 15:59:37 +0100
Subject: [PATCH 7/7] arm64: dts: st: enable all RISAB instances on the
 stm32mp235f-dk board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260209-stm32_risab-v1-7-ef0b2b6a7e0a@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F4:EE_|PAWPR10MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea6912f-2964-4758-15da-08de67ec0ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MExmRjFhRmxjTzczL0NqcFNRRHRLeGViVDg2T3ZoUmZScHB1akVEZGtOY2Z6?=
 =?utf-8?B?aTlwUDIzb3krZ1hZcGl5blhidTA4Q2hnNHdZbEdDUFNWWmx0WkFzZERQMVFT?=
 =?utf-8?B?dndMQit4M201UGtPekIwd3pRcjVSVk13RzNYMXhwYmVGb2JuMFFYb0pQVGQz?=
 =?utf-8?B?S3dVRFd0dUo1OUttL0xSVS9Lc0c4VHdXM3NkZ3lzSW5MSmRkamtVWU9nODMr?=
 =?utf-8?B?YXE3Q3FJR3k5UnBBeHpxVy9BREhFRUMvNncvZVBncnVVYjRYSy9QeFBZbWNv?=
 =?utf-8?B?aVEveHRNc3ZqS3oyTXZQaHo4YjNhTHowclkwd053akxrSC8zZlg2eklYYzBt?=
 =?utf-8?B?S085N0t3QnZYN0o2YkdYSFR3RWtNRW80NDJmZitpbDJzdGNWMW9QUC84U2lO?=
 =?utf-8?B?RE1kcnhwMiswRWxSNDVTKzI4Smdyb1ovNmNycW42SDRib3RLRjMwSit2bjZN?=
 =?utf-8?B?ZDhpbFRVd20xazk2dVpWd1podGRnNzRqM0szRmxiU3FlNktRZFpCQXlQTEtI?=
 =?utf-8?B?RVpZdU14aG9lYkxSQVBRZ29kU3hZSk1pRzc4TW12ZTIvTmc2bnZSZlM5TWQ4?=
 =?utf-8?B?SkFWenRWUU1BOU1MYXNDOWx1UFNWV2FQM2ovNFc5dElXN0ZrT3kvWGl0eUp2?=
 =?utf-8?B?WHBRUW9sRDFrYkZucEhaellZOHA0TU5sQkdoNS8vZVBLOVFYRExuQ1Vudkc3?=
 =?utf-8?B?YWdxR3E1Mi9mcDR2ZWRMMTVTZlRFdlJ3WWxmSzJZYk5FWjNzQlB2bUlBY1Ur?=
 =?utf-8?B?YkY2eThDRjI0a1JqYzBPY3N2V25pWXBQb3VHREE1V1lBQlVBVGNjdHVpMHhI?=
 =?utf-8?B?SGcxSUszaklOUUtVeThjTFI1ZnFqRjZ4L3R4TUJ2eStPR09NcnVObzFYcDlz?=
 =?utf-8?B?d0w1SkIrK29PUU96WUs2RUg3cDFseUlRaCtiOW4rMml6NHYzNFR1b251aXVX?=
 =?utf-8?B?RzdtUk56UGhaYlFaejNDUmpMZnNiUHhUQVR5WC9VT3NMTGh4OXBOZzhmbVFa?=
 =?utf-8?B?ek5EQTFvOWJHNWJRdlV1V2lmanhqeGNhNnZOK2ttTUp0Y3ByQkE0QWIreUJu?=
 =?utf-8?B?REJjRVlOMDMyQWluaHBxQlpTKzlndE5OY1dwNW5JblNiVFVMMVBvWE5CV3FC?=
 =?utf-8?B?ZWtNK3RDRUdJd3VEMXZEUXk2QzhIK3E3dFZNS2RBdUJuT3phK0xJNmZrVEJF?=
 =?utf-8?B?VFljYzhXcS9UZGVCMmJMcWlpdVVnaUdhaHFBT2E1VkxVbHlSZ3EzTEZ3WWR4?=
 =?utf-8?B?amk5S1c5YnJtZ2lFdytyU3BVTTVJNUxqWlBISjBuSVlqZ2VKU3JNL1hxcVpX?=
 =?utf-8?B?TU1tWWV2dmhkSkhiSmRjMUw3eVZOSHFJOU1SdzdVdVNEWExZMi9jbkNOVEs2?=
 =?utf-8?B?SmpaYWZQNmp5NmIreEZpKzhSdUlFUDNNYzZTK3dBSk1PSXl5Uk0xeUxUeUs4?=
 =?utf-8?B?aFR5R0hzc2R1S2hFZzh1SVJMVnJQYlVVK3o0ODA3bDV5SzZmZXA0V1BTbXcx?=
 =?utf-8?B?ZDA5d1JxNnQyT3JyVzVtOEFzcFg5RHNWdCsvSHZ2djM5cEdrRmp4SVBWNWZm?=
 =?utf-8?B?Q3I0THRUaGNFUFR6aGNwRmVraG5IdEVOOUU5MUpYOEVuMU1icFhGWmhpN0xE?=
 =?utf-8?B?UnlzcFUwYUJVMFNFVFhyTFpQVWNkVXJ2azZPanVYUGx6SnF2Rms0aXpZdCtW?=
 =?utf-8?B?QmtQd0FPRGtNbXZpRStWY00xV2t6MlVOVTBraHhTcTJOOUIyS2pONkR6Q2Nx?=
 =?utf-8?B?Znd6SFBaeElHcENLVGRoNXVhZUN1VEYyZ2FldUFZazlKSjhsUGhjMHk4cStw?=
 =?utf-8?B?cEtlMStDRDE2SDloUTc3blRkTmxlcDJNUjlEZlRqWnJUUmlZdmJvc2lLb3BY?=
 =?utf-8?B?L0R1V1BvSTQxbWpOdEh3bk9aODlBY0FrOFFKQ2dVSUFPZmNiSXpKakZWaTgv?=
 =?utf-8?B?M1lhb3FQcitQR1pGa3V3MjhXbExVUGtFNE8vUWpXdGU5QllabWJQN0NUeEFN?=
 =?utf-8?B?UjhsakY2SkVmeWdIa1RtT3kxUncrK3ltU1FhRnlJUDNOblpWTGlvdVBsa3Qx?=
 =?utf-8?B?Nk40Q2JaOEpMS0tNK0V5R0M3L0dTamI5Sk0waU5PN1BwallMWmM3V1UvVzY1?=
 =?utf-8?B?UE1jQXl5MDEzcEhRNVAzOURwNS9MM1ZDWEJlSFNWRE02TnYvdWgwNlNpRExo?=
 =?utf-8?B?ODI5NGlzWjJNWGwxMEp6ek1UMyttTHZBQTBtS2hmWTFDRFhML3FiTWtUbTZN?=
 =?utf-8?B?T2N1czRyYVJOcjlRZHo0ZHc4OFV3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8Dwr80HdurO/G8+yg6Yq6uRgWdvVDlmKnLcBJye4lUwXinrDILN9BHnHv7QuCCbtqlUY0CwuGsBolvghV3ZIO2264GUwVrbeTIt9X2tmzqVoDIrABMoqUlU72RMt/pZeh76NBit25t2uzL2bQ8efRjGyeQpzQXnfLDofRZVOC+8Ga+pB0Dcnzl3dKhfeGcHB1flGcl86N8NREc2kGyVdygRhVUXXSpkxKQ5+GpHqPDnelV1tZeDsknNyEaqNwpHp2YeXrZpcFC5TOIZI7CCDoV0ldynejsriMmsm46xpt09B1FbFHq8a7IDaJO3MUezCMt1gBJgOmgf7JmFvE+nfPYkn1wjEnPkWu7KOhJzxmLeWrt3a5i6wi71Zwlip8Xz5MEUPJLCEiQXq1txaqSYn77uRFIYI0In/jjNXBfesvj9P4wVsQUaLvqTFOSO1d3RX
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:01:08.7736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea6912f-2964-4758-15da-08de67ec0ea5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7343
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_070113_761658_98128543 
X-CRM114-Status: UNSURE (   6.72  )
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
on the stm32mp235f-dk board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index c3e688068223..b76549b9f64b 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -100,6 +100,30 @@ phy1_eth1: ethernet-phy@1 {
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
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;

-- 
2.43.0


