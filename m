Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010BEC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 04:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M/e6dBMomDzA+OPvRajUARC3maAaTpwenAd7WEVsP1w=; b=1C9ess8Ompk/Ms1ilnKhiKkl91
	FeXajYPEQjTCo7D1KvGJJ8nuR4dsELMqiQ8gBjqLV0/ceLdgbQHr/xCHLtJfP9i7DRkWVU19oKYKS
	qlPsHSfpbFU2p5ht+8zNMWNVzCZS17KKLhHTIspa5pqRbk/e8UodOvtW1NSIKEYYF8UDuf9KygVT8
	aq2loKT6ZwY4s/S43sQ2xArVft8tI8/GcqdtiyVJEoTr6C7ouZEU/e2FC9HQj6wJmP9Hh19h9YjjJ
	BXGEYWMX58KJ0bhOe5K1fISaQGIODZBlGCs27z4ZNaq2j9bK1cgeDYan+z8kw/49C+2IJtG0A+/5h
	HRWKW7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1io-00000003MlX-15p3;
	Mon, 16 Jun 2025 04:45:26 +0000
Received: from mail-dm6nam10on2071b.outbound.protection.outlook.com ([2a01:111:f403:2413::71b] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1Vl-00000003Lqh-2esA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 04:31:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PB5sLYPiMPx4zQqY2DN7bIrzwKy3N1wu4R1p2s2NyyzhKNnaM5qDbWAa8y0uhr/eyNfy/Vt5bVHm4X1C0WPDxnTfX0WnUIqj3P87VsSfjQvMKkFt/hQ7573ysBrK/3QZ23DnFKTdRszPx6OR25bHcvUAHfYRdrzsnOdL6IwE1BHDSymhKpkJWYJxCgYGrM8k0Yx4rylULrKvFAY3c131NAgTU7b+5q+xFpofOLp4DB7h5H0zT2zmXee1fELMv7fbTjBE+udoxHa2piThwduypnA/i5BJIdJepyST2/RNYLKEiy8RGJ5HtNvuyGB0sn7zutv40k5j+40i+avIGONKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/e6dBMomDzA+OPvRajUARC3maAaTpwenAd7WEVsP1w=;
 b=H8jXhE63oIuUp+cR0MWRObfK4EFsE2Q/Ugj4q4JB9cXJXPZ839CqyUk3BR6DQEaEAojN629dHcOfDjkg7Vo3lZzwVrV7y1l/YWd9ew2LHjseNAlpnU6l05uLLqFnBXjHI9HBZM0RL4s+lffgtXKT1S7J8wkze1oxh2EIeVPo9G5wUs9/NZekVv3UMX9Qe1in2RATBSon0D3m2y3xwatK788B6w/JKQ37ylup5QIs72slFI/1TRACDid2Vpe63UVUHUnohooTRHcjYIl4waTzvGSqav6QoBOIC7gnIClnY7ChbTxrJpcp0L+atOPtMeAks17mL19dMGCQrj+MZylIcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M/e6dBMomDzA+OPvRajUARC3maAaTpwenAd7WEVsP1w=;
 b=gbAMH1zPzFMrVmwo5R+g9bAV6u1bNR8iQdODTlOv3/Vw2qTylHChzYejfDC5okAOVbhS5CXWGChkCygpBNcBM/bCRZrGRhIPf/gZVB4/buhrbheB8Qa5PwH73e8IOPtjofJj1oOWn3KjZ+T5OWtnTPIkPfsC5hPJw9ibpRGNPpDpPMIaNPnnt9XXORE9rel16RfIqdgrWEZ5gmZoaKIl6L44cNPSaW3bkDP9jd4mPKlfGJPp2JNKFI0ED2dOimshp0sMZx3HPBw96BS9KBMn2RnbHZKNfjgipuXbnne3mBh3Fxfn9sJ34OPlqin2bI47tzwmSiUFEVUQ+n9Sq3PJkw==
Received: from MW4PR03CA0063.namprd03.prod.outlook.com (2603:10b6:303:b6::8)
 by PH0PR18MB4656.namprd18.prod.outlook.com (2603:10b6:510:c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 04:31:53 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:303:b6:cafe::29) by MW4PR03CA0063.outlook.office365.com
 (2603:10b6:303:b6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Mon,
 16 Jun 2025 04:31:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194; helo=[127.0.0.1];
Received: from [127.0.0.1] (50.233.182.194) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 16 Jun 2025 04:31:52 +0000
From: Harshit Shah <hshah@axiado.com>
Date: Sun, 15 Jun 2025 21:31:39 -0700
Subject: [PATCH v2 6/6] MAINTAINERS: Add entry for AXIADO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-6-341502d38618@axiado.com>
References: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
In-Reply-To: <20250615-axiado-ax3000-soc-and-evaluation-board-support-v2-0-341502d38618@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 soc@lists.linux.dev, Harshit Shah <hshah@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=833; i=hshah@axiado.com;
 h=from:subject:message-id; bh=KshauV0Ltf+cmlkwHT/6QLg4kHHEmWooSrGJxOuEkO0=;
 b=owEB7QES/pANAwAKAfFYcxGhMtX7AcsmYgBoT54yksR62DuLnXNEOI2sY465LkxMu+71h8sIk
 BcJ9q8VJ6GJAbMEAAEKAB0WIQRO3pC/7SkLS2viWOvxWHMRoTLV+wUCaE+eMgAKCRDxWHMRoTLV
 +7VTDACNh/iN4bBw+nhfx0gLrOAijl4NMFO8y0Y9n+6KRQv0dLWUaViC1d/w3NEbjWFV7P938/w
 z1fkJs3fz1CKyrsubZbol5dfeT5Nt9VQP/zJBmJK65XN+dL5TiM37O4XEtnJLmEAVdExUq0aQ9M
 NnOydy9lQTZwt14s1QOKxehuYBF+l/l6cETh4rfl4xCUai5jY3vhhyn8wZhzGJYtPQ9Dx8tjRw2
 VZ3Rsk56OgwrH6Op+zXoYUREOgI67aAooUyDo5NakmcG00/P1M12pm8M3siGI2w+9rV3N+TBEBG
 K7mwDJ4HSRSDu5h4WBfSH6sY7nWETt+7RlwRndNdCOYcvc4BlM2yiIHGhzxybLviuEoMUt51Jgw
 7vA42R2UxxJmgV0ccEegnHvjzoMgmIeFCP1eQZ2R/+a2gaVX7Riavhm7FplN47aQcEN/SS4XjDb
 WhYfLR2PWNMmZwzsZi7/nSyQROdp9iLPyamPxcGiLNZJTjPsh5yVXRERQSsahS8NW0P8Y=
X-Developer-Key: i=hshah@axiado.com; a=openpgp;
 fpr=4EDE90BFED290B4B6BE258EBF1587311A132D5FB
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|PH0PR18MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba3b9b4-c7e8-4f74-a5f0-08ddac8eb7d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjAxc29VNU9Kb3JnT2hPZDJnaXNrZUpWTjRRV1FIZDhsUW1LOGZ2Nm1SSkdw?=
 =?utf-8?B?VEdTWUFEcXplc3Q4TkdoTWRXcjg1Rk00SmlMOFAwT05WVnRhUmMyUndJcW9J?=
 =?utf-8?B?NHZma3IvL1RZYmt3d3JHbStXSGR1TEtENWUrMVVUdzBTeDA5N0JjK3M1WUJ6?=
 =?utf-8?B?MERqRE1BRmxHVWlJSzQ2djUvWG9EbDVJREV0TTI2N0hUa0REd3cvUlV6NUJr?=
 =?utf-8?B?aW5OQlBXZ2hkNExrRVhycHdycjZUbGs0TUdzQjlIQ25jUmlNdXVDV1FqSGdJ?=
 =?utf-8?B?c3RRb2l2OUV6UFJNR01NbXRXMXpBaU1LR3NHOFN6eVc5QjE1MlpjcnVIeHNy?=
 =?utf-8?B?VzBhSFNtdXpFUDBtaDFVSVNFalRubTRRa1J2V212czBheUd6dXVPR1VZcXR5?=
 =?utf-8?B?L1d5Y05Ga0Qra1RjbnNHcnlJZjlmbGptWlpLRnROK3dGMjkyUGVFVUF0QWVW?=
 =?utf-8?B?blpIQ05xSy9pb3lmYWpUdE96YUNkWDFGeWp1eUdYcmFodGQ2NS84V0tSOExj?=
 =?utf-8?B?WjJsc3NUakNFVkxSNUx2M1hlaGhQb05rMWhQNDFCRWNqTEJ3MWVtWFAyMGhC?=
 =?utf-8?B?bmRMQzZGRzVqa1NNQjExOUlNa2tpOHkvdHlGTXdGT3dtaS9PcHFpU08xbDRG?=
 =?utf-8?B?VUkyMzh0ZUo5cENlNHZKVGJ4UzVUakhSNHljcVA2U2lFR3BEUExOc2QrZUNz?=
 =?utf-8?B?RlNvNDdQaEtLMWxYSTF1VFRJU2ExOFczM3ZnR1FuOXJPM3N1aTZYN2ZXMmFn?=
 =?utf-8?B?bU13MWhvZXZNbWFPaGJmMUorZTBGczl6RUV2S3N6UlVURGdTWjNNNU1tYkE0?=
 =?utf-8?B?REVQSENodE9FaEhwMUVFcmZRQ3FiYTdKSC9tbE1wWkNxcEwvK0ZYVTJhTkgz?=
 =?utf-8?B?OGpYL0dnejZlZmVRZ2pHK0F1WVhzQXg3VFVxbEVmcXlJQ2xFdWxVQlRpalNQ?=
 =?utf-8?B?bk9ULytXVlR0ZXNocFZZUWdZNDNVcU13TENnMTVicUo5VWhjRzlEVkkxUUhm?=
 =?utf-8?B?aGhDK2xwMTR4cUN1bzN2ODQ5dU12c3I4aGswQTdIZG1uYWh1ak9TU3AvYU5J?=
 =?utf-8?B?UVFBN3dKamNqZVJsMlFhRDA1bFNxTEgrVTBNUWdWSFdPWDh0ZENmSDFLRDg2?=
 =?utf-8?B?Q2ZEc0x0elB4MHU3ZVNHSHN5a0M5aWU5VGI3d3V4UzZyVHJvUmhwUzZkVjY5?=
 =?utf-8?B?TEsrUGxzQkNGZlprUHdWUThpcG4wWGNmWTEvM3U4Rlhra2phWFVYRGh2VGEv?=
 =?utf-8?B?UC84blZFbVRIbW14K0puUVk0c2hwSE1hN1dNVG9RZEVoTG5JZkFTYUxBb21U?=
 =?utf-8?B?TEtXc1FVcTJHWlRMYnhnWlphbTBvWEEyNzNLengwdlZqSC9neDB4bHVIZWpN?=
 =?utf-8?B?dHFrQWdSL0ZlOVBMeEkwZEE4Z3U5dnV1Uk5TazZGbHdQS1g1bldrWmt4ZGdz?=
 =?utf-8?B?VTNKK1BkbCtnR0tPbkVQWnp0c2lZVmhxUVhDOWVyYUxwYWkxYVIwTTlNRUZ6?=
 =?utf-8?B?djdjZ2xVV3ZTbU43anI2SUt6N3I5b3dCSXU1SlVtaXpCdnVYempIZXYwQndF?=
 =?utf-8?B?ME5kaloxTThpZjlMRThCbkMraVJmUFNEQ1BXVWN2TTJtOHJ0NmliVGRJTEdW?=
 =?utf-8?B?SjVaSUt4NlhZakV5d0RqQWIydW1MRVpFWkhuakk0ZEpWVjVuY3VuUktaTTdo?=
 =?utf-8?B?ckJkTk96TmpBTUNKVkdSR3ZQb0E3VU9BVG9hQ29mL0JhQzNkc1NpZ0VCdHV6?=
 =?utf-8?B?cFdTUzVKUHNDNkpTcEs1Si8xVzVYTlltNHRRMHh5WEZORytTK3NHOHhMR0VI?=
 =?utf-8?B?WWJZa0s4QlNUYWhIZmZLVGhsb1diV3p3aHdRV0xIRlRvOEVGdlRZREZnMHY5?=
 =?utf-8?B?UmtUa0hlUEJZUVRHS3BzVHAwWGdReUZabGYyWXFuYnNYWWNCdlZlU1ZNVnFj?=
 =?utf-8?B?Mm9VQUcrQ2dQaHhnS01ZVUhWbFBDTmttMGRMV21udWhwYmlHMGRQNEJXcWNo?=
 =?utf-8?B?amd1V3JCNk1vbjlMNWpLV1BVWThkTVRiczRQK211cTJFNHYzM1RETlYwOFhF?=
 =?utf-8?Q?F+7uW7?=
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:[127.0.0.1];PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 04:31:52.5196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba3b9b4-c7e8-4f74-a5f0-08ddac8eb7d0
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[[127.0.0.1]]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR18MB4656
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_213157_677445_67EAECA4 
X-CRM114-Status: UNSURE (   8.43  )
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

Add entry for AXIADO maintainer and files

Signed-off-by: Harshit Shah <hshah@axiado.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c1d245bf7b84f8a78b811e0c9c5a3edc09edc22..1118827b8bdf7774e51c0ca9dc33c13257173f2a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2414,6 +2414,14 @@ F:	arch/arm/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/
 N:	aspeed
 
+ARM/AXIADO ARCHITECTURE
+M:	Harshit Shah <hshah@axiado.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/axiado/
+F:	arch/arm64/boot/dts/axiado/
+N:	axiado
+
 ARM/AXM LSI SOC
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.25.1


