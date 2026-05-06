Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36780CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5aruqJormRQgGCzAxAOE3fIF+szdta3jPmCIroWWAI=; b=w+bKAsbpTvqaaKDZtt4Uk58xgu
	1g9yXgWcs5nShV08CkwevPMjUx9xTc7Z2igcaPuc5rgqF34WiFAm5gCozNGWNERCzf63tYDDiETPy
	KhS3GX9tJYeBVDkOA0xSKsm5ilVfl2fGOSwVMJU4AdDJrxWtAwR3y+xw/4BRI245Wx97dCPfmP5lb
	BGTZHJYhXzTZA6S0Anzk21dq+ATzVroymVgatq7r8NevEigf+JoiQVpFxaZFemVdohZoHBqbQQ82P
	950Hmq8G3e8KtYd52EjHqwS95Yo08PHS6Hg7r2ukdqly892+7oSvqejT6wS0Q/qA0HHB81umM0AcL
	idlw1Bfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYGH-00000000Ilk-2Fvo;
	Wed, 06 May 2026 09:09:45 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYGF-00000000Ikz-40qn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:09:44 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=g6NOo22Lx38aJFtqUonuzESgkvsyZxwWYK/66Els0evBtfgqAk2XyZw9iyJR2e6tDy2AW4Wlv9I27f4w8cLpCjxB9fx7GxOAfWvbFqZecCJXfkE0yJLoV0cpU9iJatOfBvu8JPSrWsmTt7ilWw5//O4CSPayc5HH1hXXFs/V+nLVnpNV/TK8wk4ty2cSAhng59XFKeTlX/xpLmTi402XZesGMSscch2fWzYY1DrjO2EQne/mtY6pz5oIteSDL+lbNNNOTh3w9fMykc59M3krv1hdQvSBZ2BxCRVKhBTDYWIUgbZo0VNCWfuHu/1ZV/KnJRJGOgPPJFetLmnUkbuRtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5aruqJormRQgGCzAxAOE3fIF+szdta3jPmCIroWWAI=;
 b=bp7p5cTMG+0DvkVrABvFMlydD7IMMvaxQRxXu9e2olougjGPSHWLzKvZYAs3qNrDFjh31iUhlOTl4x19snTiCcF0AiUu3Ixhsl4OmtS3x6x62oZA/2b0hlvwkeSnqwlRZpQ89IGaVZ+G+pYI+U+iFeO3/7IF7qg1epp5O1Il40KzhkN2RWjblXXVmUUpBnKsh46kHdKea12I6KtdI5t1LOPvBCn0BiXywxR9rla9TmQOfd2b1CaWk+K+zSOxeoODo3cGx1NZUzQYhly7RaTjWdW3obQ52M4WFUUMq+9C5k0PfQIruF3QyL11QijFiv5c4EyeTCHCk0ZFZTm5FYm38g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5aruqJormRQgGCzAxAOE3fIF+szdta3jPmCIroWWAI=;
 b=YCUjR+xtbDEHIIC3jjsGMQyOQ7BeDyHmLw65rRiy7x6oXvRzG1uUlrbaTitFcHAH0M3nkLi3mQRp3t0AzyG3n8JgwYqZdBJmOS4hueUGZ1zl8tC9XesP5qjuAFh80ePGrEtsgW/o2jEogsyG+Uyh38p2UOs9OyyzyUoSXRmbGR0=
Received: from CWLP265CA0472.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::13)
 by AM7PR08MB5527.eurprd08.prod.outlook.com (2603:10a6:20b:de::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:09:35 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:400:1d4:cafe::a9) by CWLP265CA0472.outlook.office365.com
 (2603:10a6:400:1d4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 09:09:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Wed, 6 May 2026 09:09:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1t7ZXgAKtjqr76jhCWr25vb4ohPWXE1OIWaoYOxpP/9BZfCktXHU9VpDRgT0OtW6DGePUGotiFSk3nGTKrMl15Qmp1p/EZUbSmgnA1otypGu3Dh5rEkjjomZLsR7EV4jvYc+NdvIlJKZikDQK+/6FFg3EMhUpHYDDI6pnpAsHIJwkrDerh/kiptSvq2/BiCONQp8jiiFdEWaTrx3oA+LkDfiEUGkbHiaQzSdLKIOll+guwFrbjF/xzqhK7E1TUpsuId/I5vXWgppiLPVsnPKzAhS5eHHHDR4er1zTYPZ4HhlNb4DUi69NqSHGyinEfWApQd8YKhh8EXaP4eJx1B3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5aruqJormRQgGCzAxAOE3fIF+szdta3jPmCIroWWAI=;
 b=wYcbayXuvxwIS46tUud5IH+08ViuMIucHJURxex4wlBivVldynXyTCpdjstjSA5NZoGuZdYovaau+pIrZPJiuuPJXbYjBn3PTr5jZdeSu2wAm1n/atFWHcraOB5CR1de8wAhDQuMaV902ZcA1QG2GPcfCrhDT5sZCbY0J19fJDhAtKVbzXFhBjkpkX+cJc4wmWwNUk2SiHyX1N+hz/Zz1uItZ3LgZb/X1+De99/rtqR2E3q9BhCrx4kVzmGDc1LLbIM/F5LSP4+cWVua3RTHsuSIguYuWblhv6JNDfl3wNzKtaMvYl01qB43O4tx5mB2LmgvR//EOax/nJCKMiqaUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5aruqJormRQgGCzAxAOE3fIF+szdta3jPmCIroWWAI=;
 b=YCUjR+xtbDEHIIC3jjsGMQyOQ7BeDyHmLw65rRiy7x6oXvRzG1uUlrbaTitFcHAH0M3nkLi3mQRp3t0AzyG3n8JgwYqZdBJmOS4hueUGZ1zl8tC9XesP5qjuAFh80ePGrEtsgW/o2jEogsyG+Uyh38p2UOs9OyyzyUoSXRmbGR0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com (2603:10a6:10:644::21)
 by PA6PR08MB10781.eurprd08.prod.outlook.com (2603:10a6:102:3d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 09:08:31 +0000
Received: from DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f]) by DU4PR08MB11769.eurprd08.prod.outlook.com
 ([fe80::d424:cd62:81a8:490f%3]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:08:31 +0000
Message-ID: <741aa6b6-5544-408c-b97f-dddd53774d3c@arm.com>
Date: Wed, 6 May 2026 10:08:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/27] coresight: Grab per-CPU source device during
 AUX setup
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Jie Gan <jie.gan@oss.qualcomm.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20260501-arm_coresight_path_power_management_improvement-v11-0-fc7fb9d5af1c@arm.com>
 <20260501-arm_coresight_path_power_management_improvement-v11-9-fc7fb9d5af1c@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260501-arm_coresight_path_power_management_improvement-v11-9-fc7fb9d5af1c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0062.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::13) To DU4PR08MB11769.eurprd08.prod.outlook.com
 (2603:10a6:10:644::21)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU4PR08MB11769:EE_|PA6PR08MB10781:EE_|AMS0EPF0000019C:EE_|AM7PR08MB5527:EE_
X-MS-Office365-Filtering-Correlation-Id: b129f218-b269-42ea-76b3-08deab4f31b7
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: PNACVd5FrxG5noW5JtN6bRiAXchkFaiN5aUuCS9bObjBQMEcgq4gIsblEarewFPgB/CwWdShl7efXBOTLyoO9AgwTtSdHjkKZmlJEIUwzfRBq88jUKb5oQPZDtRIV158yJk9MKUWvptavn6nsGeldTV5IGt9OIwFjkZIgiyHq1SO5b3nvqkHGsopXqYm2+OtuVQiEY9M65Ixjaivf5ZBifX6HIcjDTHTyua2hpi5o6dHDLFQTCM85UEpp5pTDf6sl/qncOpO2U2h+OPeX4Tx0NTSuRWpevKReNgdNh0/tHdh5BwTPsjNsjPNUWBGK0Z+oHAcdjexiLJMxwnbRVl9VODlJGqEmAcE4ogla/J2Bo79UnMRHT3W2XgEeJaD5AtagMOSmentLt4xAE9pGInrogsB8qrFZMMHDGv8g94t0GDBKLg0g/e6FDO+wXkrIWH8rN3Yaaew8vAf/eJV902MIGCkKxTcAs0ItrzTHpecU55GXqJ0oTNOE2mys5JHDeKd6+uL73/0Un1Rcdm/YN32yF33xagyNiZb1VROaQDxUgIz18HR6Lt3p/F2bOsrNFienEMNbWI+UmRi0JDbG8PcUnFag7kpASkDdnnWAZjVQ+dmT/Uv7SlUp7y9AKzocE7TZNDqNPIOfZPlGs+FC6pDenPoVfjnb8uw/7c4oI8QU0I23jHhs3AoYUGLeNQfP/B0U3vCaB7TIyTUC8akVGdnDo+5TnAjx8lRdBTABu2mmMA=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11769.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: iQAqHRAXnYmUrKDtRwlGw7DNqEeuUof+qOw8VvqE1/cnG6fqfWl1Lj/JAmBVbhzkWfXl2KJDToqouzvZRplvwZm0ymqUeQH84Rw3fFS1/tfPpJYopHm5c2cu4NYboPIauGDRkVNrNYXkEnj3bmEOS6MPZEKTNEhubyR+SjrkTg9o911hgUMwyjQeHHv+lMLhafNAtEbwx7akCDK38cDrwyk9DuAQVxfejr7gKQq2irQueKy5SUlMkX+QuPXr+dLp81ILwBmEROVHaK4TA0uIkVKsLSLazz3hnKAnwAIWFGl2fT7T3j+Z+YEVa/qgvwczt34TIAQq2LvyMkY/loTvbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10781
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 202f942d-e9fc-4b5f-2451-08deab4f0b24
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|14060799003|1800799024|35042699022|36860700016|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: uh7S5tnSu2xc7c/xrrQXcixd2x0Jm1RAMWKm1/nZc9EHYvV98lf/OXT9Ywboyo/zN9d/f6K1W+BpaWq1TNe9a9Wjs+3CwwKH+NPzEka7F2PmBUODCaH6j5Z59np+LQlzcaDv9s9ijbydmCF++QfcWS1AZurN1H3ljnOFxtkYB0TkZyaor2JLJRKma6Fqks1y0yssfL6ih0LEyZBuKSq5IO1HnODyxJcU4FPLJJ3k2GtIvCz6B1SQkY8J0RqGQCEUtTrTQwZ+nYiY6KhwTaGAVbAbAOdejC5XdjKx9O5DvCY0fziQnkBbGlHfdvBnnTX8BBPWoFwi0+ny6WdSYfqPdIxDJ5gphMQg6WHQilWz56fsrZn4xmN2Ior+yduclyR11ppuMKOVXiKsFzEsQWwJ9CJx2PgaqVOCkOIN+Exy/v+pPD5snaaSY8YTq8IUDtPXRgti3jrB6gzrAXAqc4hLv8kOLPk5yJmhOCIb1GnhWptlbZaJjG7atVErvPi4PyxYWxuwfIVX2ueKwiOJuSnKlJN6/J2iw80fWpGb4IsEvsZQIJwNc7SJhUHgP71qDqPj7D4sVO/3btV+HUAF2KFJZhb5IzPGEtM6lkdGlIPcg7UJM/+YaEobU+WNFAIu+0ndurjNB90ISFETU/odxIdTaj7x8Hce0pYG9XDBY87DprIXuIRLSAmz7C0cvTgI7/7EOwzan3k9TRIVYCTKnoRjUyMLPrplPP+fvVDcYGQ6WtsRA+L0qpd/eEcRZJyJHbQdl6937dfM9WDB4MgQ8drZxg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(14060799003)(1800799024)(35042699022)(36860700016)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fvkFMP0R0K0TofiQ8IaIYN4Ef68VXT3merTFMbH/TN7PE8cJ7iw61Kisq97DKwx7U1gcxdxHVUXMjlveVrzUTWValJZz1rRoP15F5DanbutZRO+sfNDwYGwwqDkBOf2PJ6jH347eQw2fp4YDCB/ecr1uqkPU0wGA4+eRzcP/HysRYPtte8y6ogMFdEBG3Zshr86iDV3gJWdOUyBt4N32IZSgoZNx6KlQ+E33lLjaolZR2qXxXs3Tfc7VMQccrLU3gvx82YbkyGcdXyRYtTF2POkLzvsCeLIniS3Nmhedn6nUfbAReHpUxraEwqYLRFYCy2+uqvxlsn1PFqA2C7RIsW4NoC/6zFH4dEQ/L50PU2ZSXfxsMRG9mt0J7XCWI27wd50yg1adWnVx2hYNw2WJkW9RwkajGuAojmpPBnm26afo+S4/+48TDqV+J5fpLbDS
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:09:35.7054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b129f218-b269-42ea-76b3-08deab4f31b7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5527
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_020944_150093_7E350F91 
X-CRM114-Status: GOOD (  28.51  )
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

On 01/05/2026 17:47, Leo Yan wrote:
> etm_setup_aux() may access a per-CPU source device while ETM module is
> being unloaded, leading to a potential use-after-free.
> 
> Therefore, this commit takes references to the device, which is
> sufficient to prevent the csdev from being released. This ensures that
> csdev can be safely accessed.
> 
> Refactor the perf path build code into etm_event_build_path(), making
> it easier to use the coresight_{get|put}_percpu_source_ref() pairs.
> Update the comments accordingly to reflect the new flow.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-core.c     |  29 ++++-
>   drivers/hwtracing/coresight/coresight-etm-perf.c | 157 +++++++++++++----------
>   drivers/hwtracing/coresight/coresight-priv.h     |   3 +-
>   3 files changed, 120 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index 6da15f2ef9dc9770e7aa79cc94a7ed3d2f3ad871..b01e63fbbb4b990d4f5ec61c8fa4da63dd59a4b9 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -109,13 +109,38 @@ static void coresight_clear_percpu_source(struct coresight_device *csdev)
>   	per_cpu(csdev_source, csdev->cpu) = NULL;
>   }
>   
> -struct coresight_device *coresight_get_percpu_source(int cpu)
> +struct coresight_device *coresight_get_percpu_source_ref(int cpu)
>   {
> +	struct coresight_device *csdev;
> +
>   	if (WARN_ON(cpu < 0))
>   		return NULL;
>   
>   	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
> -	return per_cpu(csdev_source, cpu);
> +
> +	csdev = per_cpu(csdev_source, cpu);
> +	if (!csdev)
> +		return NULL;
> +
> +	/* Make sure csdev is safe to access */

It may be worth adding a comment here :

	/*
	 * Holding a reference to the csdev->dev ensures that the
	 * coresight_device is live for the caller. The path building
	 * logic can safely either build a path to the sink or fail
	 * if the device is being unregistered (if there was a race).
	 * The caller can skip the "source" device, if no path could
	 * be built.
	 */


Suzuki


> +	get_device(&csdev->dev);
> +
> +	return csdev;
> +}


> +
> +void coresight_put_percpu_source_ref(struct coresight_device *csdev)
> +{
> +	if (!csdev || !coresight_is_percpu_source(csdev))
> +		return;
> +
> +	guard(raw_spinlock_irqsave)(&coresight_dev_lock);
> +
> +	/*
> +	 * When the device's refcount reaches zero, coresight_device_release()
> +	 * is invoked. This is safe even in atomic context, as the release
> +	 * function does not sleep.
> +	 */
> +	put_device(&csdev->dev);
>   }
>   
>   struct coresight_device *coresight_get_source(struct coresight_path *path)
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index d3b13ef130439fd501f88395d0de9dd21b84b827..9950ad481f29eed3bfac8fe4ae3a593b53830617 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -338,6 +338,85 @@ static struct coresight_path *etm_event_get_ctxt_path(struct etm_ctxt *ctxt)
>   	return path;
>   }
>   
> +static struct coresight_path *
> +etm_event_build_path(struct perf_event *event, int cpu,
> +		     struct coresight_device *user_sink,
> +		     struct coresight_device *match_sink)
> +{
> +	struct coresight_path *path = NULL;
> +	struct coresight_device *source, *sink;
> +
> +	source = coresight_get_percpu_source_ref(cpu);
> +
> +	/*
> +	 * If there is no ETM associated with this CPU or ever we try to trace
> +	 * on this CPU, we handle it accordingly.
> +	 */
> +	if (!source)
> +		return NULL;
> +
> +	/*
> +	 * If AUX pause feature is enabled but the ETM driver does not
> +	 * support the operations, skip for this source.
> +	 */
> +	if (event->attr.aux_start_paused &&
> +	    (!source_ops(source)->pause_perf ||
> +	     !source_ops(source)->resume_perf)) {
> +		dev_err_once(&source->dev, "AUX pause is not supported.\n");
> +		goto out;
> +	}
> +
> +	/* If sink has been specified by user, directly use it */
> +	if (user_sink) {
> +		sink = user_sink;
> +	} else {
> +		/*
> +		 * No sink provided - look for a default sink for all the ETMs,
> +		 * where this event can be scheduled.
> +		 *
> +		 * We allocate the sink specific buffers only once for this
> +		 * event. If the ETMs have different default sink devices, we
> +		 * can only use a single "type" of sink as the event can carry
> +		 * only one sink specific buffer. Thus we have to make sure
> +		 * that the sinks are of the same type and driven by the same
> +		 * driver, as the one we allocate the buffer for. We don't
> +		 * trace on a CPU if the sink is not compatible.
> +		 */
> +
> +		/* Find the default sink for this ETM */
> +		sink = coresight_find_default_sink(source);
> +		if (!sink)
> +			goto out;
> +
> +		/* Check if this sink compatible with the last sink */
> +		if (match_sink && !sinks_compatible(match_sink, sink))
> +			goto out;
> +	}
> +
> +	/*
> +	 * Building a path doesn't enable it, it simply builds a
> +	 * list of devices from source to sink that can be
> +	 * referenced later when the path is actually needed.
> +	 */
> +	path = coresight_build_path(source, sink);
> +	if (IS_ERR(path))
> +		goto out;
> +
> +	/* ensure we can allocate a trace ID for this CPU */
> +	coresight_path_assign_trace_id(path, CS_MODE_PERF);
> +	if (!IS_VALID_CS_TRACE_ID(path->trace_id)) {
> +		coresight_release_path(path);
> +		path = NULL;
> +		goto out;
> +	}
> +
> +	coresight_trace_id_perf_start(&sink->perf_sink_id_map);
> +
> +out:
> +	coresight_put_percpu_source_ref(source);
> +	return IS_ERR_OR_NULL(path) ? NULL : path;
> +}
> +
>   static void *etm_setup_aux(struct perf_event *event, void **pages,
>   			   int nr_pages, bool overwrite)
>   {
> @@ -345,7 +424,7 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   	int cpu = event->cpu;
>   	cpumask_t *mask;
>   	struct coresight_device *sink = NULL;
> -	struct coresight_device *user_sink = NULL, *last_sink = NULL;
> +	struct coresight_device *user_sink = NULL;
>   	struct etm_event_data *event_data = NULL;
>   
>   	event_data = alloc_event_data(cpu);
> @@ -377,80 +456,26 @@ static void *etm_setup_aux(struct perf_event *event, void **pages,
>   	 */
>   	for_each_cpu(cpu, mask) {
>   		struct coresight_path *path;
> -		struct coresight_device *csdev;
>   
> -		csdev = coresight_get_percpu_source(cpu);
> -		/*
> -		 * If there is no ETM associated with this CPU clear it from
> -		 * the mask and continue with the rest. If ever we try to trace
> -		 * on this CPU, we handle it accordingly.
> -		 */
> -		if (!csdev) {
> +		path = etm_event_build_path(event, cpu, user_sink, sink);
> +		if (!path) {
> +			/*
> +			 * Failed to create a path for the CPU, clear it from
> +			 * the mask and continue to next one.
> +			 */
>   			cpumask_clear_cpu(cpu, mask);
>   			continue;
>   		}
>   
> -		/*
> -		 * If AUX pause feature is enabled but the ETM driver does not
> -		 * support the operations, clear this CPU from the mask and
> -		 * continue to next one.
> -		 */
> -		if (event->attr.aux_start_paused &&
> -		    (!source_ops(csdev)->pause_perf || !source_ops(csdev)->resume_perf)) {
> -			dev_err_once(&csdev->dev, "AUX pause is not supported.\n");
> -			cpumask_clear_cpu(cpu, mask);
> -			continue;
> -		}
>   
>   		/*
> -		 * No sink provided - look for a default sink for all the ETMs,
> -		 * where this event can be scheduled.
> -		 * We allocate the sink specific buffers only once for this
> -		 * event. If the ETMs have different default sink devices, we
> -		 * can only use a single "type" of sink as the event can carry
> -		 * only one sink specific buffer. Thus we have to make sure
> -		 * that the sinks are of the same type and driven by the same
> -		 * driver, as the one we allocate the buffer for. As such
> -		 * we choose the first sink and check if the remaining ETMs
> -		 * have a compatible default sink. We don't trace on a CPU
> -		 * if the sink is not compatible.
> -		 */
> -		if (!user_sink) {
> -			/* Find the default sink for this ETM */
> -			sink = coresight_find_default_sink(csdev);
> -			if (!sink) {
> -				cpumask_clear_cpu(cpu, mask);
> -				continue;
> -			}
> -
> -			/* Check if this sink compatible with the last sink */
> -			if (last_sink && !sinks_compatible(last_sink, sink)) {
> -				cpumask_clear_cpu(cpu, mask);
> -				continue;
> -			}
> -			last_sink = sink;
> -		}
> -
> -		/*
> -		 * Building a path doesn't enable it, it simply builds a
> -		 * list of devices from source to sink that can be
> -		 * referenced later when the path is actually needed.
> +		 * The first found sink is saved here and passed to
> +		 * etm_event_build_path() to check whether the remaining ETMs
> +		 * have a compatible default sink.
>   		 */
> -		path = coresight_build_path(csdev, sink);
> -		if (IS_ERR(path)) {
> -			cpumask_clear_cpu(cpu, mask);
> -			continue;
> -		}
> -
> -		/* ensure we can allocate a trace ID for this CPU */
> -		coresight_path_assign_trace_id(path, CS_MODE_PERF);
> -		if (!IS_VALID_CS_TRACE_ID(path->trace_id)) {
> -			cpumask_clear_cpu(cpu, mask);
> -			coresight_release_path(path);
> -			continue;
> -		}
> +		if (!user_sink && !sink)
> +			sink = coresight_get_sink(path);
>   
> -		coresight_trace_id_perf_start(&sink->perf_sink_id_map);
>   		*etm_event_cpu_path_ptr(event_data, cpu) = path;
>   	}
>   
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 7ce79fa36232bb1b0af768423777bab27cacee95..a1aab67e23db7fdea5139100312b3eb7cd31df51 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -249,7 +249,8 @@ void coresight_add_helper(struct coresight_device *csdev,
>   void coresight_set_percpu_sink(int cpu, struct coresight_device *csdev);
>   struct coresight_device *coresight_get_percpu_sink(int cpu);
>   struct coresight_device *coresight_get_source(struct coresight_path *path);
> -struct coresight_device *coresight_get_percpu_source(int cpu);
> +struct coresight_device *coresight_get_percpu_source_ref(int cpu);
> +void coresight_put_percpu_source_ref(struct coresight_device *csdev);
>   void coresight_disable_source(struct coresight_device *csdev, void *data);
>   void coresight_pause_source(struct coresight_device *csdev);
>   int coresight_resume_source(struct coresight_device *csdev);
> 


