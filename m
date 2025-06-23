Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA7CC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 22:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqzZg5e1hIYv13sYSzB/fo45kd8EP1nSKW8Hcq//YuE=; b=Xrmm/X20bpPYUFEa5dLFd6lNIq
	bB9BI8KFkhXmaqTGUNhOhHvrlw8pvCy0mRsfPhOX7T4x/dtOnrJ3XHDgg9UBYJ0pYZUYR9OUdhSR2
	5EHcVNShk/kSvGWaxY6xj+s8iR1EbxMoZL8jnVPVbpFlSv42wfUreDo9fa4+MNdyh4m5UvQXvcRe1
	6Nzz54kx8/ibju5VklZsgfWe2Ndq+xRAVfp3+kXGklNAXK+diS4wMeei24loDMMtrdWzR6jgJIc8+
	e8dRcR1i0CkKpHq3An0OJWmGADo/HVS5fSqaeHoW3gc4YSaR30sFNIuzxd8HswcHWRO5j4yCFZO17
	MSEdowBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTpDT-0000000446G-2QCp;
	Mon, 23 Jun 2025 22:00:39 +0000
Received: from mail-bn7nam10on2072a.outbound.protection.outlook.com ([2a01:111:f403:2009::72a] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTkyN-00000003Yjf-07lf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 17:28:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIjoDyTH3RNQ9voDtIabF86qAwl5ep6xLPnWP7GQXEdqm37gk2oS9y9ZXrTlX58o76aFdiujP4LWBZe/nPH34Mg2VXwwI9Xtvo8/WAR9KoQOBTXwHDO4HHLMJlAO83ju4OXdD47m4R77EbuLB3EzOCK4EwudAA8lSu/rulbA+etIOerW8DB+TtTWZISDdu/upfUbFA1y7MXmQhPwftq7vjUb1qZHRAnVnRUAVWA1RRLx9jH+UgtVcWVWQlIoZnDHmpo1Riw3rVqhWpMHlwNl+tDt19c5i7U3ZFvk73J2Pjc9qZBxBViZkwx86/OhmqInVQpRqoMykgPKq5c5QlELSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqzZg5e1hIYv13sYSzB/fo45kd8EP1nSKW8Hcq//YuE=;
 b=ysA2KEsJccWeVPVzvrOAL/eVbLJ+6N9MUKIT6teRAq3qmeh9R4vH3gjn4G6vz/ZiNtc9K7TzL2nrSMD82W4PB8Ejs9NEsl4rS1SlfG52NR4aohiLXwA6mbcjgBdYHRdRyJx9OEDOaoB1BBOyNyy1BU+xf8qPGR5AHAqnYzUV7xmYsj5CUjPa+tqG4UJ6PA1+eqJNUQSIxS9QAo2zPJmJScmwsuYwf893h8b2vs0w/hK3RkaTz7zV8XSl1eBKg1dFXjisTlBJr2AmKGzNaXUzzGoES15dUwYBA3cdkwb6bnRda7chv40TIdq1MXQJQoYfdHRDQ1TnhTngOx9G7Z+W/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqzZg5e1hIYv13sYSzB/fo45kd8EP1nSKW8Hcq//YuE=;
 b=tZOz3Frv1ZY7frHq5/zTB9aHDUaFRFWVVeVr98B0sIDwKS4FySdu3XH3E1Ukl8igWGKSA2xOZ+NFaczzlsDqBeptvpZpU5W9BnKuhsm5weN33D2/KJhmyb6HpDX1o534KGikh9+LJC/RQBUszFqBr8m+EgCHALebQwl4O+x5hZZ1pQ2nhWjPv85SwddBfOwKewR18VghAbslEj3TSUHa1zhY5nY3vQBN0j6107sioqxMjY3dgk7Rf6jGmyFrDhcSOSZvnRXF0Vej0Bt63BztwpeUs0bYGMjqdSZXk2CeZ5vaKyj7witk/qaMX+mtyazMLIYzD0TU809malK4xeJo7Q==
Received: from BN9PR03CA0118.namprd03.prod.outlook.com (2603:10b6:408:fd::33)
 by IA3PR18MB6141.namprd18.prod.outlook.com (2603:10b6:208:51e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Mon, 23 Jun
 2025 17:28:43 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::2d) by BN9PR03CA0118.outlook.office365.com
 (2603:10b6:408:fd::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 17:28:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 17:28:41 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Mon, 23 Jun 2025 10:28:17 -0700
Subject: [PATCH v3 6/7] arm64: defconfig: enable the Axiado family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-6-b3e66a7491f5@axiado.com>
References: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
In-Reply-To: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jan Kotas <jank@cadence.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Jan Kotas <jank@cadence.com>, 
 Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=639; i=hshah@axiado.com;
 h=from:subject:message-id; bh=dD851C2qbCuUc3fY8Woza9zWla9efu8cvVzsW+vxNuk=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoWY67/xwNf0QbKiW4qTCSx1+jwRD3LC2lw6QAK
 ScdloJfWyGJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaFmOuwAKCRDxWHMRoTLV
 +739DACKSGHXhbw3b0+JiSsbFmb2VFoxWXXCkFt+EoBLHIZMcBua09wWqnf8ciT73Yxei27J3Iu
 tZwJE71pfRfjH2+O/+sLu6p10K6V0yDq+5Ez6qBC2nErAmOUgfmjwtNgHo6Z9TJKoo+lgKc7mrW
 47UszQawGEVosclkTa1dIllN8+Ahc9TfJ5VZK6tIOCaKmwo0ZCGMLQAECiAPpQAdq8q83Er3acL
 EICeLWadQMLiMovDHa5CSuj24gBsS1jt0Sj1K5GoaPAigyO1ui9mxeuLNlImrZ+q9L3XJ4jyCA1
 01RIUDWMOBjW6dpucW2bb9Wq3An4LQC8xTvGfkFk6CkiGtGQtYT1jAjs4pZQUnq+oC/L6w8+2Uw
 O9u8kWMzXjpi6bo07Gj6eDHEWE7EZvHpIf/zPtlgucNoG/jVXukuuidmzEKYjM8cAv2kwJgOx11
 uIgohvq7cFoIvu2TAq2wyuibiqk9h7dMYK+yW6MAfAnFvqAXPKGkEYupsyhgX8a3shuj8=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|IA3PR18MB6141:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c78ef3-c0e1-4153-5289-08ddb27b66c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dnNYZDQrN2ZyckdDYkkvc0ZGUWlkL3QzTFlSUEJydTVxTVlQT2J3Ujh1WmVD?=
 =?utf-8?B?cmdGU2Y0RkVuRUtJMDdBZzh4UnJDU3FUUU44U0VaZ3FhQ0t1QUVzeVVvcHlM?=
 =?utf-8?B?RWR5OXkzQnBlS2xqTGZtTmNpMitLNnN3R0ZpNW02eHFaVzB3akNBdzZDeHkx?=
 =?utf-8?B?ZkVmVGRXSi8yb2QvRExMcDBsQ3lLNTBCWU14U0ZXRmFkekdWdTBVa2NucUZ5?=
 =?utf-8?B?anA4eDVsYVJETUgwaXZvZXVxcThIdEJ3RGRrWGNJeFhVYkNxSTBrMHJxOTlp?=
 =?utf-8?B?b0NDR1JlcFFSdktMRDBKU0JVbm1Ob3ZPR0lDZTFqYklqeTlBVUJYbHZ2ODkr?=
 =?utf-8?B?L2NyWUhXL2RjdkZoM0x1RVUyTlF3bTROSWFnZTBZM2wzbE85VW03djRSS05U?=
 =?utf-8?B?NXNMR1IrNmNUNzE3WTlBZVVIbHcwTjV0SjQ3RmxhTWlhbnQ1U1RoanhuOW51?=
 =?utf-8?B?d1F0azlIOHpkZjl6U0FGWlJXVEdZeXEweThocXNPcTRNZE8wZVZnMG9UNTlO?=
 =?utf-8?B?OHJhOXNaMXBUdWhUeW5CcUVJYjNrc2xiNHF6aTdNSTVORW9aYlJ1SXdCbENw?=
 =?utf-8?B?RC9uQkZPZCtpYzl6YWZ1TVIvQ1BtdFRBNzFCZmNRcHdDUHhJZjZBZUJVNVZj?=
 =?utf-8?B?b25vUFNCRTRnc3pWMFBZZGhOUldaemJjTlRZc1Q0VmFweFNjWEMreFRWcys5?=
 =?utf-8?B?V0RMUEQyUVNIeVpPRjlFaXliQUJRSlhMeXdaR1JvZWVyeTVQdGMyRks3NVpo?=
 =?utf-8?B?WGtabjF4b2lDRWVjeWluY2xQL3p6SWdwRlR3OWVjYzJieitXeDJTek4yd3J4?=
 =?utf-8?B?R0lib2I5NkhkNFBWSTNEeFZMZjBvY3R5K0t3OGRpUDE5SnlFVDFzSzh6QWx5?=
 =?utf-8?B?QjNvc0JKSG1EQnV5TGNrVHhvL2lBdEpHeURqWDY2OVZTUTdBaWduZDBYeEts?=
 =?utf-8?B?bmRvb3dVQ3Fiamk5a2FWaTRsU2hWdkk5ZWo5SEx4OHhRVU9hclV5QlhvODlh?=
 =?utf-8?B?MjJhSDc5c01vZmxxaGlMYllrNmdXY280V3krcWlIcHlQTStGR1AwY1I3d2oy?=
 =?utf-8?B?Y1E2empKRFY2ckgrWGRDcW50dEJNRkFIUXdvNWlkSHBKUUlQdHJxSGJpNS9r?=
 =?utf-8?B?a1V0NTVJek9vOEFFeGZ3WkVTYmpUaVkxRmdDb3dsdmFhaEtHbUowZ2UxdGtS?=
 =?utf-8?B?dDEzMUdJWVFUSm45OWFOdVlaVkR3TjZ0d3NTcGZXR0QzK0dTdjk3N3hkcStn?=
 =?utf-8?B?bkZyZng4ZEEzc1V4TTVrTEx6OVFkYVJRQ1FqYnlNOHVwa0ROWG1FVEdyN3lX?=
 =?utf-8?B?WlN6Tys0SU5DZXNhM0UvcEtJU0hNRUY4cXVVZVhBTjAzdHhJSmprR2ZKVkpU?=
 =?utf-8?B?ZWZJVzBEVkxGN1RSQ01vMmsrb1dYVHNqRVVkMk9hTE0rNCtrMU5Wblk4a0hR?=
 =?utf-8?B?Y2pYV3RmSkExZHY5V0UyOXRvZHNUdkVDRG1oZEJGdlFzL0JLT3d0QzBjK2lo?=
 =?utf-8?B?czhkSTJuUVFuM0gwTXk2TmcxaEQ4RjBRRitmbGplekt0d2Z5elJNdkc1SEM4?=
 =?utf-8?B?MlZoRnF1OHRML2JUOVhyemJFNk16bUs5MlRJbEx0Y2VDcWVZMFFHbTUydS9y?=
 =?utf-8?B?ZkpoRTNTTGxUQTdwek9ZclV4MFl6a3M5TG1qMDVYTkRWYWxMMlJCN3EvOFdM?=
 =?utf-8?B?U2hxQkF3aDZUUmdRTFZ6TWNEM0hlZ2c2Rkd5bGx6Tzk3bjNaSzUxc21qczFN?=
 =?utf-8?B?c3NhVTZlcXg0d3hGSmhUamRSWFlXTmtyeHROMTd2RHRKR1FJdnA5WCt1Q2JL?=
 =?utf-8?B?WGtNL3NtZXc4VU5GTmNvOThMNWl2R2JzNnNwS3pyQkluYUQrYXhrZFZsM1ZH?=
 =?utf-8?B?YXRibTkxZkRlYmJ3dlNCbmcvWlhNbm5YL2xBZXpwSFRIUFFwd3hwYUxCek1H?=
 =?utf-8?B?S21MVS9RSTRidUY1cWFoUytSUTluN1QrclRBSDA0S1BqaGQxb3h0bXpOK004?=
 =?utf-8?B?bUVqWTJXaXZXZFVIYmNqN1NlUWdBQTlBT01iSit3bXpoeFhiSXdseml5NUR1?=
 =?utf-8?Q?FOC2i1?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 17:28:41.9229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c78ef3-c0e1-4153-5289-08ddb27b66c0
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR18MB6141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_102847_070879_82877789 
X-CRM114-Status: UNSURE (   7.99  )
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

Enable the Axiado SoC family in the arm64 defconfig.

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91b79770639d3eb15beb3ee48ef77..96268ade08aff844ad833c18397932a059db5499 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -38,6 +38,7 @@ CONFIG_ARCH_AIROHA=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_APPLE=y
+CONFIG_ARCH_AXIADO=y
 CONFIG_ARCH_BCM=y
 CONFIG_ARCH_BCM2835=y
 CONFIG_ARCH_BCM_IPROC=y

-- 
2.25.1


