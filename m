Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC58AC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Cc:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pa8377VIsDcoMT/DxRd0LwZtLD1/nnGjd9SlG/EIhoI=; b=D2KXu5wj6W359xTeUSKCujmjAH
	2jkENYAsfMc4qT9GT9Kq/rA7nJu4wJ8gEJ6ccmWql6CH/KGZ6TC1MPl5eVf9pqLmI8CX6aEsCtP1R
	1cd+vSbkuKDy6segcMof46tDcI72YAPbox2PhQd79+1Jg4gRxAZKHI39HrgWlYPHo5xZ+juLJzndi
	8+0b87iyNTOqHnC+bT/QeIYvE+MlhbCJNBHgjNHcmWCH7emtns3G9hf+0aJb/AmMxYZ5Z2OBS8N3V
	Rum76HlrKLV2d70AC749oHZipPRR9UqmwAKCEuTPmukQvI+JvWs1ZXwQ1Oo8zcy5EjFRI3N9H1iw8
	ezXlX62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMx9-0000000D8Tz-1B4r;
	Fri, 21 Aug 2026 10:58:27 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMx6-0000000D8Tb-236y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 10:58:25 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=RXSe62tk4kWuUkCIcXC2DgndErDJr0PVCXyNP20nAVLq7o5WTPX9IQdtICz5p2uojx+aQ4agJzllnaC2sXZ2EaW3EDF2AKXIzbIvCL6at0nYmE4jopjOD3lPDb70cBDEboN2VsVK4KGThDxfM7oDGVFbBr+uhpIiZkN3qaO/dprAVutYCU0cNj/xL9s2ZyMGvmSj2Neyc5hW5fbbIBQX7y+MjMxp6cat9bbnyLZ48rkaHmqEKPB9RydlIxY5NtVuhyTveiJQ5+4aclc/cQi2BvioEUP5mR34Vw1IPa7gGEasFELdnA/eKw1wBg0+Jda39e80KliKxD8/k26BM4pQoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pa8377VIsDcoMT/DxRd0LwZtLD1/nnGjd9SlG/EIhoI=;
 b=CZzRCwnh1rxqNuUHJgyTB0QBzKqs9SiVj+6WBDNhtxD2dRlVVv+e3O2QZGV7ELla5Jgr3AkYMrtNu+pwSKNvYNqvU9NH50062D775Xfzr9nMGOxXx+UPucCY2JrvXDCcvwGbi2i9cpq/Kikl+7PTySiu8vpIHO0RdKI0p6ahuSr8gFCz3nj66kOBYUuYfECUrxtp6ebl22pejXDKMCqYMz1vOcZHBubJvrnEvI+LKesYMuW54XuQlqfJPwbKOvm5jwif/Zjj4V4M/gooheg75RDP6wjs1WBSC7KiZ1+tyBNHecXVHLM3XzkJMEgy7b+BNvvyABeEy0GSvl5vBuVjlQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pa8377VIsDcoMT/DxRd0LwZtLD1/nnGjd9SlG/EIhoI=;
 b=edcNqVVzUn2LkcHPvDxhirSpFee29DmZH57+iQrk7z/2cohtOW4bPkQOzV3+ltudlAGefYrUP0Ix4iALOr+zvT843+4TePs+cFe3VBXKOgdA92XtV4Hwb42QfOJQaXpLE7YaVrSpoXHXbyBjRyjnclyVX0qCeZASJDrnExqQZ3Y=
Received: from AM8P189CA0013.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::18)
 by AM8PR08MB5825.eurprd08.prod.outlook.com (2603:10a6:20b:1d6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.9; Fri, 21 Aug
 2026 10:58:17 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:20b:218:cafe::a6) by AM8P189CA0013.outlook.office365.com
 (2603:10a6:20b:218::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 10:58:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 10:58:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cve+7WmyNE6Siog15gLB/jchNCZQA5eYyli1+cJk0jhF+n1ncSgPpMkBGN3cAE3glO85uuF/HYETpdgCKuxUcBU1lMydIo8GK5ocPYJYr9CY/Aox4JWC+I1m5p+G+R+XEW+hV4Burf9TvfVsckpbkyiwLxQtzNjY5Kf3ae5A9eOGXc4oyDRQBlkUr3T0AWHnBLItfgpYxIJwEvuI8SfSUL86oZ9YsqAzb6ydKV7ol2Ay71xPPJGsiQMnETvSBML3JH6d6vnjuoCnzQ3GuEugXNeN/JELZk5JNBqoUIPJmLBvVJYRA++eEQT7ycqYaLjgHtuwJOsjKov6EFAeH5eYGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pa8377VIsDcoMT/DxRd0LwZtLD1/nnGjd9SlG/EIhoI=;
 b=yoNgJrZzmVXFni27A4lGPLurAq0ciXCPUjGJIIAJqLq6a6YNhbWkP+86EJUdUUHy/vTXx9KOSjtDt409RDh79ytD5YyUGoU0QeidKp2olNw74yRE1KkBXBGJSK7WJ397dSYVEjYjt30sjf1ws9jNOw30b6/pIKX2QkaZtAlI2dTQqPN9oGKgVdmz4U+vjVUu30N9uVZE7UJsaAi58BraCbiH5YaPKna1iFBnOGcwm6rq95y3an+pT4s5rm7HrpGbYqDa3ForyRdolou8a1DPXNQvpIBRrDMx5Lw1Dad8mzawVcTMRGNKcxyPEaLVkzOc85SRl15YPNkF8EUtRnNBOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pa8377VIsDcoMT/DxRd0LwZtLD1/nnGjd9SlG/EIhoI=;
 b=edcNqVVzUn2LkcHPvDxhirSpFee29DmZH57+iQrk7z/2cohtOW4bPkQOzV3+ltudlAGefYrUP0Ix4iALOr+zvT843+4TePs+cFe3VBXKOgdA92XtV4Hwb42QfOJQaXpLE7YaVrSpoXHXbyBjRyjnclyVX0qCeZASJDrnExqQZ3Y=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3410.eurprd08.prod.outlook.com (2603:10a6:208:df::33)
 by DBBPR08MB5977.eurprd08.prod.outlook.com (2603:10a6:10:209::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 10:57:44 +0000
Received: from AM0PR08MB3410.eurprd08.prod.outlook.com
 ([fe80::b6cc:973e:a807:c3d3]) by AM0PR08MB3410.eurprd08.prod.outlook.com
 ([fe80::b6cc:973e:a807:c3d3%6]) with mapi id 15.21.0339.007; Fri, 21 Aug 2026
 10:57:44 +0000
Message-ID: <a003db17-5f80-4e90-a366-f6b72e8a2533@arm.com>
Date: Fri, 21 Aug 2026 11:57:43 +0100
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
Subject: Re: [PATCH 2/4] selftest/arm64: Treat KSM merge_across_nodes as
 optional
To: Mark Brown <broonie@kernel.org>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
 <20260820153331.2448875-3-usama.anjum@arm.com>
 <0ae60fab-49e3-4a8c-a007-a6439ae10991@sirena.org.uk>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@arm.com>
In-Reply-To: <0ae60fab-49e3-4a8c-a007-a6439ae10991@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0337.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::18) To AM0PR08MB3410.eurprd08.prod.outlook.com
 (2603:10a6:208:df::33)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3410:EE_|DBBPR08MB5977:EE_|AM4PEPF00027A65:EE_|AM8PR08MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: 81b6afec-e7f6-4b06-565e-08deff731adb
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|56012099006|10067099003|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: qp+/p88p64H2zO/BIAf+ciTK2OC/Esi355DrEjS7Q1KNygiRCP4kewIvSe9d/i4D6m8yQ4/+2QB0oEQFNoCcuwFok3kGrXIZKcoscwt5xOeGGFWw7O7AMnAlpwqnAo/3rzEtXFnLXMjvfN6fLo+69p+eZ3Nz/OhLEgEoZRONTgx2ip2sshg3ucUHf166eu/3atVqaqpu6EsXUhNHxnMWJKXpU/m5bNLj0oT8gfqJpECroyxCVy5eM0z2o3Y6RgLxRm2L5PAMAZBhG00bij9ZRMHq3/Z+UEzM080YdEQMgLkR3j0YWwMOV4HpQbyETDmdnEfiC0nGWV97BZwzxS3xD/aoj3wlKr0QfCjx1UcZaiUUi1b6y6M1jw6AKNCSJjT4vE/YHzwqoRD98F+JIllPQOyoa0KFs/AMmZextxhBPkA39YqeQ/C4/0x05JZmLbe0T3OIVQh0eLE1h8FrgDTA4QqeHIyQSJbqHUF+KeGFR0hWhQaCqWTzfQ8cOv2zTVwWUAkM3oTRO04nbPBNx4MM3hScKU8cUwJxy7YUiL1IIg4bWtfBuUTkFYglcxiaw5EtUjiZ4Okwcg0s5kQa/caVwSFa316eK/csVvL7TV6ykz3cC1G/HsGF83+GWgKlaHgQ2RuBhCRy2K1fjmLFEM7lh8t2/z3HBOtx0klOt/IcVRI=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3410.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: I9cfGRB85TKYGjTaYxazk35BjDKmj0+LaNoXrrTwrAMmHrWDI0VBUTFRf3QwB1Mt6672Db/DqO8BGNHDg/BRHF7xZczlSMiFX7HcP7KsJ3hUpVocCJS4p4U6mDS9txuJEOtN05ilonHoMRqX/ZbHjI/huVDMs+J/TSbzaG1ls/15pXdTxPCNauVGfUCK7ByEnAWnmsoXUL5g64Gkpb02t5azanoiZUjbeFSwDHZNodaLCil0PbWPY+M7taf9UIoaiuUkzFDljofqsd8O/GtbQ9AkIgGXghGFnpacZsh27PUqMVWivD8ZBDlmdcnJdLia31pGAIVMBdOqlDG0qTlm8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5977
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b8ef69e9-47ba-476b-5296-08deff730758
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|35042699022|14060799003|11063799006|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vLCHsAkE0O4fHdvwqcj6saueRY00Lh618LsiMZ0r7Zxs+lM9lYBcFouax4m7PlD1KLb+ID16xFr6riSbjpWAkhi6069oEgqxoIBycN7SBJGBcRQikGKAGNzYkb5i+KFpa+8qg5Rftg+9N76d3HOA5EApSxJz+64g3I9RrL7vVtEIBWL1kWH053E84r8c5qreO6SZUlW2Am19o6Sp7v/UWCardyIP8SL+WLqARLfSNGJ+VeroPsCAFcDWGxXDvgqCl/cep7//iNrqUeqOLI4pb1zVqdy99BGbzazBodEXoyXuY7bjrYcqMkZWB+epBXXKJ1k/UUmVsaQNfvUKiYsDnH3vqvJEa4lks8fX5U16msHjMzpZ9aIhr+c1dJF/0hyJp1D2V0ghFgtfRnKszYlfmSetRQ+bZq3pp7AYWZY1kFFKqyLwjuk4cnp4oyzAAnmum0MJwKq6pKTxcVW3s96X0n/O34ADP8xao/aGejeMjpPbu4Q43bkLTXwtpnHPfmjEE0snDKOVDuwXrK8DgIXQcefgMn++nv9YC8vjUNS28wqc5tk9vvMqJB+h0xSjO2rdivkotQpNQmvX/s+z9GS77D/R7vMC4obVP/P2qCXf2hou17SQhFbITmIrqYVbOgXmwRMx4kRMpxVK3slW5OO9Lqra4kdR4L8yPBnPmpbteAQl9oYYkPCbyNrWwN94UyCgM+nbBKEDgoF49AQEvq++BQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(35042699022)(14060799003)(11063799006)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: o6d7E3zGAjwa9wgNReCGEZP6zbclU+MFj2ZdVd8qNXJ+GtK2LTjrm5brUVbJpKfJJuLbJ/wSzWImB1r7jQ/X3tG2RMhAHRsLFINf5GvVktxJOCIyGOo8iuPFIO6oREGmsewapKxwPthrvCMp7wUHi+2mtS6T+bS0iIupaK5TtzkZ5lZLpHjH37Gv1ACB6p8Yi4bEOyC/4iXLrAzfDYd96u2GmmdGeZxWMukZxE6fVxa3iEYgYyA9yVIkW9eBI4BS/vox42To13Vg6Imv9zzni52FY86HH1oW9pC/+HnJU1/qw1+tks0dyjLx7vGAAaTdy5MhmgRMIFk8boaxsQLO2p4KVORKmoz/cg5fZmAnK9Q09mz4shV/BaxYk+EgNS4jAhdepG55bG7Vb9zX1Q8SXyRT/8mTgR5LTgR+6p4tmh+94xpFTICIP/2ktVgnwr28
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 10:58:16.9182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b6afec-e7f6-4b06-565e-08deff731adb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5825
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_035824_558105_A8781B7B 
X-CRM114-Status: GOOD (  12.15  )
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

On 20/08/2026 5:09 pm, Mark Brown wrote:
> On Thu, Aug 20, 2026 at 04:33:24PM +0100, Muhammad Usama Anjum wrote:
>> The MTE KSM test unconditionally saves, enables and restores the
>> merge_across_nodes sysfs attribute. The kernel only creates this
>> attribute when CONFIG_NUMA=y. A non-NUMA kernel consequently prints the
>> following message three times even though all KSM subtests pass:
> 
>>  static void mte_ksm_setup(void)
>>  {
>> -	ksm_sysfs[0] = read_sysfs(PATH_KSM "merge_across_nodes");
>> -	write_sysfs(PATH_KSM "merge_across_nodes", 1);
>> +	has_merge_across_nodes = !access(PATH_KSM "merge_across_nodes", F_OK);
> 
> Don't we need the file to be readable and writable, not just extant?

Correct, I'll fix it.

> Looking quickly at the test I'm actually not spotting where it checks
> that it's running as root which I think it needs in general.

I'll add check for that as well.

-- 
Thanks,
Usama

