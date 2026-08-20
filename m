Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170D2C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Cc:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKjctGTKSeimZz+ayxj/67jzJZRQbzOFHgN+XAbIeT4=; b=VyHp313SeUZR7CdpwFPo+yOkPX
	wqrARzFfYvqMaJ2NDK/QAG4q45tM/nZ6EE1QKDCR8HZiS3DI/j2jcAaWZiBKmFM/fYc9G1bNu/JkQ
	1XYuxALDMGni16xm/i0+KESzkHYplElv0xtlEHDku4N5gO8aBxOF+xVJF1SXtGjUNH1iQOUpzTOui
	pYu5cWYcfriMMoQqqipgAWIrD51i0eKLxpCSRkww+ga6rY1UDFAMu8b/prDAeYAL7H69mDZ2PgLjC
	Omcp2nDhyiZdzefbuOLfNPD6qHSKJvNnGpdHhGWTQCLyKX7CoMDqnvfRMtZjHlwmMPuFh8NWy3jEP
	zJDfIeAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4v3-0000000Bpu1-3jft;
	Thu, 20 Aug 2026 15:43:05 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4v1-0000000Bpt6-23u5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:43:05 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=gGhTibPX1j8/15w+CjCbsV+JHHYjPFWSU6vqegyJDNUD55qlS8GVRniQMRbcek/Yov/IYK5bid0/pLzS/r25qmJ8ZynQRRsx7inP8v1Gpp4xyuvMuMcL0Tts1vFoVQKDY4mCGgFezl3xenMKkACrvjFbATxE5pfJcuq6RvM1N1GSi263nccl6ERi4HFDtw8Y1eQTPB7sdLZZ2WnBn6XMr44SiTdBkOHUYXGMsvLf9YfdfnsgOHrpASfxccVKuMIFpjXK3eYLEp40TMpVWjrebcwEq6x4CbTgy5Mh16C06+KTvhlkb49Lf+rs7/EpE0pFYzlnEDjnZap+NfAtHJxJBA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKjctGTKSeimZz+ayxj/67jzJZRQbzOFHgN+XAbIeT4=;
 b=RUG3r/Zkn+xwDeF8oJZhGZyyHPNa9C6OSauhgCNmpM+/x9PqHeJJ0uQD1J6lyeeufOIJZpEQkYoth8p4AHTTyoc01jO78OC0pRSaelHjn/BN8+pJEuoH6jsQTBDChgYAHo6VkDFms2BEANK1u8v4i9YmKbwLO5D/yureL5OAdFfVmo6USebXSQ73CUTomTqG2nufzhtEZF2jjQ2L0+7amWqRvUhvmTz6y+k2ObJwr9KX3QllKOUlPhUGvgNqBzn/Y5Ejy6U7YHwjt8d457WRO4EYX+gyBYznmhgrUUBvbWtxENzxYFeIWUS/oSA2IynHQ+aSkVEnGYSOkrcpf7nXyQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKjctGTKSeimZz+ayxj/67jzJZRQbzOFHgN+XAbIeT4=;
 b=X2NFQlXxA3KQRa3R+Bmy5TrLcGxkQ7Ne7Yenumd+DGEMsbnPdayuPyDndSnxNzlRpAQhsaRwZEwXNWosvprHQMwj0ZULbm2BRK3+TiVDYv+0Whf5tLYFi11CSvgu4j7Wj8w+XGwzIGQ2+4Ob6SNr+R+otyaPOjDqUwFuIiSWetU=
Received: from AS4PR10CA0008.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::10)
 by DB4PR08MB7958.eurprd08.prod.outlook.com (2603:10a6:10:38f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 15:42:52 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::70) by AS4PR10CA0008.outlook.office365.com
 (2603:10a6:20b:5dc::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.10 via Frontend Transport; Thu,
 20 Aug 2026 15:42:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Thu, 20 Aug 2026 15:42:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSJhrHcGXlqzbPj/es43bUBKRIJcsNDNfpK6zopn9ZmQArNIKMj3iDklEu5giuSBFamW/dpqv2aRSw8oTZx5hYtcaimxxZ2SsVpq6B0EomPW8dvnyuspRQkB04vH+toGsHIe2XGFgk/mm+Ft9ivMZe4GM4vAG8QINzJ2RkmAuY8DvShNHev4+/hoAnHd21CDIqvwqhC+9PsqJI+RMVa1UI+14/nGjAN2A3hpdIIeJZGHeNacDGKilflM1zrhENbtAA4dtEnWBcqp53v9s7bEc+qpHp3KFrj3+jAkJO4YhmeZ466WL+xhXJMIyzKcRIf1aEz4U9DWxZUhWckriMMYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKjctGTKSeimZz+ayxj/67jzJZRQbzOFHgN+XAbIeT4=;
 b=BP83fnAaeBFaA0U+tIRWmXtoXxmEntjL0jsapWZoVL/Q2SBgcosbysjq66Bxbe7YqB+BoU9ubupC5y5a/x+wlRXGEtyRJZLVu3pgtjJYv4YxOCpvaQSPVqtqtC144VHvemDjVJQJzYDqnSHhmBLtB1P0n5B/q1Jn3UkidVgKZ4GLNJx61yl+UIOdLQEUdDrp34U42XYA8UM+CYBk6e5pbwB3h14ARFoZWkShTs/xhr5ipPVGVQ7mCRVJvdD1gzIKShXM7jgg12ZN9Qc5Mi0W4vsuHC47+j7654PSwXa+rLVTKTUoM5BixWHE419AZyFCcCtETzZHbUCU3KitGZl9uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKjctGTKSeimZz+ayxj/67jzJZRQbzOFHgN+XAbIeT4=;
 b=X2NFQlXxA3KQRa3R+Bmy5TrLcGxkQ7Ne7Yenumd+DGEMsbnPdayuPyDndSnxNzlRpAQhsaRwZEwXNWosvprHQMwj0ZULbm2BRK3+TiVDYv+0Whf5tLYFi11CSvgu4j7Wj8w+XGwzIGQ2+4Ob6SNr+R+otyaPOjDqUwFuIiSWetU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by GV2PR08MB8392.eurprd08.prod.outlook.com (2603:10a6:150:b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 15:42:18 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0315.016; Thu, 20 Aug 2026
 15:42:18 +0000
Message-ID: <630beb10-66fb-4d9e-9b86-df406ef585a9@arm.com>
Date: Thu, 20 Aug 2026 16:42:16 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Shuah Khan <shuah@kernel.org>, Andrey Konovalov <andreyknvl@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>, Yeoreum Yun
 <yeoreum.yun@arm.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 4/4] selftest/arm64: Add MTE test config fragment
To: Mark Brown <broonie@kernel.org>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-5-usama.anjum@arm.com>
 <3c469ee4-cc64-4d79-8e78-deeff30c59a6@sirena.org.uk>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <3c469ee4-cc64-4d79-8e78-deeff30c59a6@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0676.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::14) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI1PR08MB3421:EE_|GV2PR08MB8392:EE_|DU6PEPF0000B61B:EE_|DB4PR08MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 261fecfa-a81d-49a6-84e6-08defed1b20e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|4143699003|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original: 9ymCm6SvL6XHosJUbtrBnaAyWkcfxxhsEzPzj5tr5gQL5tDyIQy4iRCoyBmPpKMd9AA3ed0NOzmyQSDZJ5w+nwBxUeO+z6cNFKD1aiyosSoQHtLYlbesX25qVo1hnCuJEl8I8P9CLri0NAyddSASxLZLZqORp1gJlz6KrW9zwqMI41ntXTN68Raf1YvdNvG3T7A5BpkJPR1QqCNDmG6T5AVyFDSQCPRlfPMj1oFDe0hvYQcfcPWoSj34p+s1liUL/aXZFfNHus6e3DdB0j8FcDFfQyz1UV3MVWMUuwLVzX6RTE3u0Hs9BJ7C6ddSBrXCnQzhmLfybek2TL/5RHrLosjCb2Tl8ZpFSieOreHILI+H/SGmlpOi6xAhmOgr3ucgin2C5EhWpjew84UqwPhkpLd8yBhxomirXdRCGfsVoCAWzv5uppfgGRxjRaW2y0GR1NPe4pCPAgk9GGJHIekTQcNSvLWFZnMWX/O2M1Gyu1I09dkRXHT1gPs4XaE+E39RzxY6DntCBD8S5dPU20Pdd5tht1LFzhdLL3/XPFWeKItu6H80q5CX13uk99/Hr9oX6pRUZxGIKhH5TOvicE7BBHv3ltCqO6N+azAKBUB5ZbSS8JWjKgF/uuReUEmi1qfUzoBu//d/yp0Ifi9ypqfqp7LZhC3qQnFUYBU6B9ekODQ=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: QK7VTAep9Wc7F5i90PRXQ/Dra8nXe8YmVKJBWJNF/Xj8Q+xOBMGGz1P+WN1znQbU9zxKcA/Uss1LIOaz8VRCCKF1P4+NZGnNKKXaARqsRC5my8JF17Zj/5TrMihFo8cmUPE65bjR5hcE+rIROZ1mPO7bOQkgmDdD8wp9C3q7Y6pn4glQMnxVd7oo6cz9PpmULF4fv1cECQ27DQaadtsMSw+fOhi2WDdc4rXGn94l9Twy5Pqle9Aisr1j/fJ+cHG83/z34wCbb8ZsOujL5WqtTHkprIzYoag+FrFK7G/kK+UdagA6XjNeVAFUJuYLQ123eHj3azALLAv3ssEQvNNGww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8392
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 802afc13-dc6d-490d-9501-08defed19dac
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|23010399003|376014|82310400026|1800799024|36860700016|6133799003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VyzneqkIrz5hdX/m4JMPUYOMPfEqEhA69cuhlc/+GyIj5Q+Ep++rxogkbh5osMl8cNDbW6gA9uToAo6+UxbOF8NvRLz7swGD1caJx142zk3x0eSGo/7P+TlS0KNSVIcOXLolQrU1eDN7fblMHBkbpF/JW8MjWuuM3vrheafhDbv4uAzPvhhUJzH4g0ehag3nCVZ+nG7TXSe+eBGnNhJrm7xfqWJjN4JyOjVf5ukDayZFNlL27HYvW2fTIvycpuPpFX5qbLMYyLb9EJPU/4icwN6rqQWOoyr3LAv9xXrWUmYbPoNF7LyITo/Vn+AupuQ+JHmjIcBHZb5QBQSb6V8WtKCypBwwSIdC9kFEkd93beC8HaEe+24UQg3aDNXbFEMGquU6VyWrHd7EmDk+hQCajwccsysasoXKSEW41/cP8l7BtUfaBafsvKhv1tfv5QdzCkpYkqWZyee9UAJseFK1kLWeVFXOgoRoCzCSoigcrNUuJWyoH03yLjkQozjLubrrQFMnxuOw0IiVpDPuwhwN9/JDzRSeYb01/OQuRl2gkYDOJj6vduFYXN54G7v9Nnez4s9+yNT7azs8FP08wEVkxlL9tfRxNIs8F+Qn9/1tYT473PmbUhE5E4JbnjOBgZdfxhGTF1+bYko5SFu4aPDPeQT7sEFop7JJ/9aqHjzUAbYgTpSuQ8TnhI8bOMecLlnSIkW/U3heOeG3QlhE+cHx8A==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(23010399003)(376014)(82310400026)(1800799024)(36860700016)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1XVlMDjJDCimYV9nLldDPEyIZd0d9ZBRbL1e+BSqTL/Yrlnf0hCeW/XzUkZSezty0G5AJvY49lDusreYF7stscQyQj2K9mjpauzjfVn+AIVDZ+wu4DX4SMZsZ2tvrE6oaOyeuLSn0E6tiieL/WZoNGDxciOL6DhjsU7ftcvcnjJKK06k5bx3OXV+RCIVBK1WlEXnbSAqUEjURq/PIuC/pdm+PSEueJKD9FzTMSAuNEhkT2oa/1JGoJUIGH9JUMqZcvoM0f+EQ2GJRFnU2PV828hAEsWg2htjHlPc1QORWyn3RX3wNTvLh3jA9EdgbSuhTdRZJ7iqeHOPEZtbi2kbnJhRO/w52DMKOfFdu9h5mf9IqdbqDGQ/NuKK7HylyjG25PYjRJhcfqmcz0JufhYH8DEuEX0NVftCDIlnJUHKeKy+mA0xNReC9YmuZODJgMSv
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 15:42:52.1079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 261fecfa-a81d-49a6-84e6-08defed1b20e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_084303_593388_F95A251B 
X-CRM114-Status: UNSURE (   9.32  )
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

On 20/08/2026 4:38 pm, Mark Brown wrote:
> On Thu, Aug 20, 2026 at 04:33:26PM +0100, Muhammad Usama Anjum wrote:
>> The arm64 selftest collection has no Kconfig fragment, so kernels built
>> with the selftest requirements are not guaranteed to provide the support
>> used by the MTE tests.
> 
>>  tools/testing/selftests/arm64/mte/config | 8 ++++++++
> 
> Is tooling going to pick this up or should this be at the arm64/ level?

Yes, it will be picked up. The top-level kselftest-merge target recursively
finds every file named config under tools/testing/selftests, so
arm64/mte/config is included.

-- 
Thanks,
Usama


