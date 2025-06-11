Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58335C71147
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8JgMjv0pwAHapW4EogV1O7mqk0e5zuGrlTLIbO85pk=; b=d30ctJcqBNQSSv/TEIrK8NybOR
	uNbsDLDPZW9KiC7QlOOJMCvMzUC4cDPvZx3t7YfGn8Lc4/JsBUOEZO87G0BoXibBDZKjWtuOjMZ4D
	8NsFbXJNGItbm1v/RqoK+qa/ElDPatZpKDW7a9Ycx82qZzeAAi5+8OFXLMUDgcXcZdrzZASVTN/4e
	i7mOIzXsCaneC0e4AOl+lk+RbjBpb/db5FGvW40dzsrwhLdrizxbZM/DwiqAESFEPfzVtLaT3TVWh
	bbukxPDQgsI6kBWtn2RqeIJGUlbkI01KGygtCsyiiuJmaQKzkDVDZhOZ73yJQr14/3O+lDbcu0dI1
	wTm2cRPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRW5-0000000B0kA-3UPW;
	Wed, 11 Jun 2025 19:53:45 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMCW-0000000A49O-3OwU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 14:13:14 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=SyVixff6RzMfTT+jtsw9ijCtU35ht5u+ggMhk5tBw4lI4E4V4gt0H4VfGT0PYAoB1qA9O2wImiMhZFv4/jv4cponJbBMcIN0Fo2YidEV+ihDATg70E5jr5lJxI6uM1/Ntr5XPkKwWKyZoJijpGxFdGVE5Yt1H7T2onXb+Z3EwgIJb8zDSmrOcsXK1iqNLP+XzmRDyhez3BrhOEfCnf7wSyQR+IFhRKpwGibisyc4KzEWuqNre1/SPLYW33GqZJdV1cV/sioSlDIimD2zDQOPOMkymqraNAsPIptxp7X88djdI4vT/J92ingcGwYxFaw9gP3VCH30kc6v7XBE8a6vgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8JgMjv0pwAHapW4EogV1O7mqk0e5zuGrlTLIbO85pk=;
 b=XKqa3WQnI8NcoFpZqxl/wX43EiCFO6RamiTGs2Vv0f95vfvIq0qTNYT26dwz02Z1Jx9VN1MPYDldUdd3WZnWWjBHqck+E7PM2kp690FtiqhpFbUWt4PPi+9ftgg20EIZBn90uiKgCRXNzM4xt1cI16T9YUunyb8reIy+q/hmbVaiEsq0ZAglqU9uiUr9x2T0T9n12dxFieQj4TJ+68NUWd3uQ2yd/3zqCjwMtqF4ShdoxVOxD3Poz5lFTPhxbK1xce8CAqDBbpAvs8I8gLjVACCL1Y6WWiq2XVcbK47lssgLb5vzkoEOvH3e5usX+hwONQmIXeTQh2q52Lr06aEEIw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8JgMjv0pwAHapW4EogV1O7mqk0e5zuGrlTLIbO85pk=;
 b=eVGsgcaZGhI1SFEREGtsuKHpuTQQRMeZJcwfhVMbgxO/OKeFLoaqIkGNYqPNBSjZjbo+8UZ8uUJ+1d4UTpTI8nFdKWfhL3OYqqw6OYO2yuApvo//ipgsf3/mwBenMDJZk1dVr5SXOgtq/7RC9uzgWwoMDVCnfSdpRJRKUX/QgaE=
Received: from AM4PR0302CA0020.eurprd03.prod.outlook.com (2603:10a6:205:2::33)
 by GVXPR08MB10519.eurprd08.prod.outlook.com (2603:10a6:150:152::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 14:13:06 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:205:2:cafe::17) by AM4PR0302CA0020.outlook.office365.com
 (2603:10a6:205:2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Wed,
 11 Jun 2025 14:13:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 14:13:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpSY6aYJqFUyisizTw0ePpm/hPTeChBorUNbbr+J6AtAHMpqEEOlQoo9OiXybMnPV46LsDaq6IIfi/pWRURvmFRXtt/216XLH4Qm/8FiL5qbaaafGqs3JxVv0u2XcsZAaaOc/9CfqOrP0iDyfh6wyXL+NBnpJkDjPCVo0pxQWyJra76hmBCRz9WS1WFBU13ig5ZjGfqhD79ko5tYDpTKJJXu6Aou5pIqYETtmw61NMmdu31+eA69y24X78IaInz8YRzQCjTHnRbNzHhDdirtpZAFQFa3ngBUiRsTdbvcbDbgIgwsfYjJpbgp/ad877IauQKwm8PosFgGwZy3U+JcIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8JgMjv0pwAHapW4EogV1O7mqk0e5zuGrlTLIbO85pk=;
 b=SZXEECfn8cvL67INpoVq72cQrIrAXvSO/ZpJt3T+4TM1S+YHZLRoX/9AEl0MQSexbPLiYl7z4clAL1D/D99/h6UNJCx+7WhUi/3p7+LPTTEMqMTgu7fKw3hQkaAr8ANOSMVPLLKgNiccMlANNQ+Er4b+kVN1z2EwP6KOkbInKQnTWdSMZPRGqsvzlFU/CH66+pX0/caCJrA1JejoVdYGIt1elZADbQ5eKpcDFz5VReUAGsMOSrBleaQPAais+IY4xrKaAvjoMvM0wvfn0SmHKAn7mR8u3ZWQ6V4Jvz9hTerCZwR/R4mSL8czGOeflXO8S9cCIrY5o66nmL2YDcpXsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8JgMjv0pwAHapW4EogV1O7mqk0e5zuGrlTLIbO85pk=;
 b=eVGsgcaZGhI1SFEREGtsuKHpuTQQRMeZJcwfhVMbgxO/OKeFLoaqIkGNYqPNBSjZjbo+8UZ8uUJ+1d4UTpTI8nFdKWfhL3OYqqw6OYO2yuApvo//ipgsf3/mwBenMDJZk1dVr5SXOgtq/7RC9uzgWwoMDVCnfSdpRJRKUX/QgaE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by DU0PR08MB9678.eurprd08.prod.outlook.com
 (2603:10a6:10:446::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 11 Jun
 2025 14:12:33 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 14:12:33 +0000
Date: Wed, 11 Jun 2025 15:12:30 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, frederic@kernel.org,
	hardevsinh.palaniya@siliconsignals.io, samuel.holland@sifive.com,
	palmer@rivosinc.com, charlie@rivosinc.com,
	thiago.bauermann@linaro.org, bgray@linux.ibm.com,
	tglx@linutronix.de, puranjay@kernel.org, david@redhat.com,
	yang@os.amperecomputing.com, mbenes@suse.cz,
	joel.granados@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/7] kselftest/arm64/mte: preparation for mte store
 only test
Message-ID: <aEmOzrU3bZEbLcWK@e129823.arm.com>
References: <20250611094802.929332-1-yeoreum.yun@arm.com>
 <20250611094802.929332-7-yeoreum.yun@arm.com>
 <87931a27-36e4-4c6f-b97c-206493ec3da0@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87931a27-36e4-4c6f-b97c-206493ec3da0@sirena.org.uk>
X-ClientProxiedBy: LO4P302CA0026.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::18) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|DU0PR08MB9678:EE_|AMS1EPF00000048:EE_|GVXPR08MB10519:EE_
X-MS-Office365-Filtering-Correlation-Id: ece94315-e638-4851-2697-08dda8f215ae
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?omcfSE84xGRTqABojm8/UVLgn2uk5BFOmK2sg9MD/seAYiDIxyVGYDMJ/Yon?=
 =?us-ascii?Q?Qu8R4ClS8g40GXLNQDQ0+CEku5PptvKKr2lXlUUllpkl7vwMtxxrWTMTtvT7?=
 =?us-ascii?Q?zf2ggk/PGTu83pCDt3sEj/9vdWu1c540MX5Rf6gh9xSJr6MnSDZL/1U+Sc2/?=
 =?us-ascii?Q?b1Ac1uiT0/5nVOUVkPf75W67VLHUtMI5A0jEDDLgvplHK/LhctMh9qc5A45C?=
 =?us-ascii?Q?phNXvCBVyNbUx9bbvB/ZwyRzC1GOJtqbcV3r+K10ih5S/mrgVO35xV47mffK?=
 =?us-ascii?Q?dXecwu00Q+d2cP5lihMWe3y51k+dte4WDqEj+q6gI9oARRPCPKEHYK2ohiAq?=
 =?us-ascii?Q?MfXR60dJJpG7/mto4N7U0f8oX7nAI4Gm8xLEPvBuLv+eB7RKl8auinlrkXax?=
 =?us-ascii?Q?o3nKrQKY5W0telCVXIv8hBkwIy7MsE72HjGM4CxEgHLQYhX8h1E3nZWPtY4n?=
 =?us-ascii?Q?zsT1le4CeCbbjfoHS1O24frmTI8Ay1/aTPUCkdFGHvnmDkNjo3a5iXbTTczj?=
 =?us-ascii?Q?fp/bRwKm5GaXGO6Wh0awTwhNRCmXgQjiq/XTl/ZCCjxucETGm0fFDBz4VtTX?=
 =?us-ascii?Q?RypWyXzqk1oTqakqpaQFUrKkeFNb1F+iFkMO4ARUvBJ03anbaHssZ6IKLbCz?=
 =?us-ascii?Q?JyFUjf4XQRsuEiVVnGS76LjvDqC+aS3H/4PcVewfUnUcvcX+1mhqlul6Jts+?=
 =?us-ascii?Q?YkhG6RqKnEGHo0X08d3o7XWShg+9lP6SaLVnXwwWiE6qrcBu/UNBXxlhjU0R?=
 =?us-ascii?Q?awJPuK0Sz6GDmLlvJQs6WuerpYsAx2DYdmo+Aml0F1IhZA9CF/HCkKdaSU68?=
 =?us-ascii?Q?mLXGTGVtRyZFM16yluuPROhlxN8ruNaXWIUUPeHX4uuMh61qc7XIwGIorBqK?=
 =?us-ascii?Q?zAMrB5rGGh1gEFopKvgjPw/6wzDK/WoTNNDIwiqiaah2d8qdKYKdy/+ovOwo?=
 =?us-ascii?Q?9ZvVqquOEbBENHiuwybD3AmhdXwPY4DskF/2lw22oU7A28iJy0AceIb3RpOq?=
 =?us-ascii?Q?sL6xIo7x44kmk8mWvMj9YvXetsJ/vV6DI+ldimlOordI1M7B4lQD6EIjrzXY?=
 =?us-ascii?Q?R7rclS50DRYpYFzqKvOgTa1g7yAdqHeq3PbwgzM1haWScLugI+6nsfjRLLrw?=
 =?us-ascii?Q?ON/ZeO2PZbbSqD2AXuV4D4XXkXnF4GidoMCGTzsgztV4cbqqmNtGAWS4gkam?=
 =?us-ascii?Q?rBL2oLl1JhPbYJphLrVLCE6grf/vrWpnmiyzalTi30TYJhBPyslzZLLvrJGD?=
 =?us-ascii?Q?1roCFJg6zvuf5n5e9oHWXm/m8TMSTTG2rCUDaMf3o2c7WilWfs0djgHldyfl?=
 =?us-ascii?Q?Y4xgn8u8+vwy2vIH/xXlE4B/kPhut+ohHZfYvt7YuHlW3sO64uLAu31/CsAZ?=
 =?us-ascii?Q?EIac7XQ8+u31XAovMklTMSQpuxCY6xT6SABxaikHjYZcByyI2Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9678
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2f850ab6-a401-44c6-3de0-08dda8f2023f
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|82310400026|35042699022|1800799024|36860700013|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xWyTNsUANSbecMnEeEKMRb/f0jxmf2lY7iiVwyZnZPemmXMs2qabnEhAf87P?=
 =?us-ascii?Q?rhafRqMQUWXbRSFaoM4rGMQpsFoy01mubHiIoY92QbMHqvhkmfjCHqWk5FUw?=
 =?us-ascii?Q?gtqvqVjPZrkFKAgv32tUxaNETLkLxfDRJcqoQL0EDKBO+pakURur9Td1Khuf?=
 =?us-ascii?Q?DxUdxvLkYBd3VEVhjPSUPpnI1VMKNjDVUPokxv7XnirdA+xDFaBF/krG69Yk?=
 =?us-ascii?Q?J02MuLffLBAQ6WTj3TetlXLhudeIHw4zTy9MeviVQ8Bwz4Z8nH+/gpFIX0m8?=
 =?us-ascii?Q?PzeQzhsAbv1TbqY304Ffg0VCIT4MjzUspArvJz4lM93iu+b4zah62AgtmJyK?=
 =?us-ascii?Q?vBA4b0VnaNbZymtYAKCz28K6IgWlY++OgQOd2but4MfheMQ8rqbhWiMFcT8z?=
 =?us-ascii?Q?X29RaH/L0rI8iini5la+upTedsWSiLyKat9qMixT5BN9/hkRhwQgKXIwooV0?=
 =?us-ascii?Q?1Q7DBYQoJ7mlFa/P+ykSi/fzvzcLMYABa03H6d+gHrJV9OZiopeOG5Ze7WNu?=
 =?us-ascii?Q?I4yZOaM9MbtDl4FsAdyw8ut1Z9dhBV6HB/tl/x7VM+Ff9VPNiWSM49W8TYiY?=
 =?us-ascii?Q?EcBvCzQc5Pp5fPEZQUxdk0WsGOs+9JMMq9hfYaPTX1PNTdhyO+zVbNpRkvCt?=
 =?us-ascii?Q?hgPyDES6iy71QsnG/9eFiuqtWmYPKSiFeVJkNit70dLhUUbkWbyQ7IW1ZfHm?=
 =?us-ascii?Q?Or55DOwgC9bn3LPzT1l6XYfLeFkhdDR55uF18Bvtv0ZU1C4jsjLruHDFxje2?=
 =?us-ascii?Q?9b2xegCSY3julzTkPwmqz7ut/CGxBQFAJdPUG2WAlkGbT8mRiVTJGPoqJLAA?=
 =?us-ascii?Q?asXWnVkVBDgMjFoGMdDDLQ6MVioyXBCWgZfOgr6QQXoODdez/flfx689mODY?=
 =?us-ascii?Q?oJYoGOmLWTlfgR236CHMgPUz/rg9hhvN/ZrqKvbsnOBYvCuW/RnbjyBmDFU9?=
 =?us-ascii?Q?ap7Rx2tk8km7YDjdbKDcybGZ2Z5K/60aTqM5QauLcXJcB4dQ8x0Km2tl6eSV?=
 =?us-ascii?Q?K4fwaBhQsQNbXbTbxemvzPB8ch508FJ0O5tyl2Pyl/aN9QiLdHR90eHyKUix?=
 =?us-ascii?Q?e1il1fYyorIX+A6+jcpC6mN39dW854BVwAboboCR9fHTlc5+SRHzSNeJvwRU?=
 =?us-ascii?Q?gTq31ZL8yEga4Zy1oQZvelDOHEtR+0uz4GfEBCgEronDr9dx54i8TBuYU7XI?=
 =?us-ascii?Q?rv5QP1oovZdn0e7IqvM1DbU/BtGo6fGWQrUGTnikMalNfddpeYcbxupIyEIB?=
 =?us-ascii?Q?Fq73FqWBxRfGtNtOQ9Ipxa55diksZ29IFh/6gkBE5UZ+3lUKRE8w1CkesoyF?=
 =?us-ascii?Q?NXEmmbP7gElqwXY5jm8uCHRdWvHrKMiNw4Q6K+aU0MTtuY9a57YE48T3s2wB?=
 =?us-ascii?Q?adPoVbM7X9gFbxsRRGrHLU58+i7wQiGriuWdqVol+y/yQfvIv22cItrxGIab?=
 =?us-ascii?Q?4ubvDhV/ETtjeP15aPvlDHXENa6fQRD3UFVcSUwnFRLS8PgFauYnyBot+SJ4?=
 =?us-ascii?Q?nUbDw91yQC9Fzff4Br/utSKdiO/3lcrlyMGy?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(35042699022)(1800799024)(36860700013)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 14:13:05.4769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ece94315-e638-4851-2697-08dda8f215ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_071312_850892_BF2D2EE8 
X-CRM114-Status: GOOD (  14.28  )
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

Hi Mark,

> On Wed, Jun 11, 2025 at 10:48:01AM +0100, Yeoreum Yun wrote:
> > Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
> > check fault on store operation only.
> >
> > This patch is preparation for testing FEAT_MTE_STORE_ONLY
> > It shouldn't change test result.
>
> Not verified that that's the case but from inspection:
>
> Reviewed-by: Mark Brown <broonie@kernel.org>

Thanks ;)

> > -	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG);
> > +	mte_switch_mode(mode, MTE_ALLOW_NON_ZERO_TAG, false);
> >  	item = ARRAY_SIZE(sizes);
>
> I was going to say on the other series that the boolean flags are kind
> of awkward from a readability point of view, but equally it doesn't feel
> worth it to make these arguments enums so I'll just mention it but it's
> fine either way.

Thanks. later I'll use enum first.

--
Sincerely,
Yeoreum Yun

