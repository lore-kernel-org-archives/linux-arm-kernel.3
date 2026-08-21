Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BD7C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 15:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=tQroH0ggT7X9djBRc7Rqng5kiw3n5+kAx7ZQ9PN7kHw=; b=Tg5rurrjffGcR1RSXnK0xeOi24
	TuHtVZnvWu27Kmmru1yQ0okh8L/OXf/QmsgRAO6mZQ9ja5fgaEcIaBueUdCx6UxMUYv/JSWfzeYps
	HyFD2uOm4dAp5Z/sTlAcYCiPghW19nZgRw/K/cggC51XZaAUHuNrEvGMXgelDpWFhqaOFU/IFLERj
	n8TU8ileZ+7NQeui8JFDh3fK+GV3Wg7xHNaQ/TdPcWYSo70KA9iXIZZm+ogpPuqH3qxQtms2+ZRGk
	6cwOPnMVG9IJ7/TTJbJtZrfIaWTeQommwYfU7GQ668fj7IBR4QUN7sZvtUqxSITvdHMi9p81HOAFW
	KpsSN0cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxR2e-0000000Dein-3XU7;
	Fri, 21 Aug 2026 15:20:25 +0000
Received: from mail-northeuropeazon11010068.outbound.protection.outlook.com ([52.101.84.68] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxR2b-0000000DeiP-0y9n
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 15:20:22 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Orpiq6TwgjUtaFbrXIp4Ra4frlFtlkYsNpVkJdxk5s3CYueMcwn2PauTKArqwm0mNMCjR0O3fRwmNUlLmqD18SGZY7fLykuvvyetiEK7P/pBO3Ip9OdaE+Cc+6sfeeHZr3Zz5OprY6DD9YvVI8Z+ed6iUsuqIYXPGGz8PceZH3d/EueqNT8my+E1V//JpahRTM79veE2Y1rORAk6Kwoqcnt+WWVNg9PBIpqEfJ+jJ0uYsf+u8t4H6cuQJcWPloeJI1GC6BXuVsFxOQbtfelNyKs4yfc1yOHT1SvDZrZ2aBaWbS8NnMNHlPdZ4JHx/l3YryMdQAf5PQHrZhEJ6vMydg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQroH0ggT7X9djBRc7Rqng5kiw3n5+kAx7ZQ9PN7kHw=;
 b=VUu0erdrUPVIPXrX0LJXT3y1ORQfP5WzIRgA8HPJGMqbyK4q5k6P+SA4tpvNJLSmeFNdxgf/t69CudYqdzyFbeiLtF2Zi/ZyuQG8j9eioham+hns9EiiB4gYsk6yrQox5sOwJwmdmVrDxW98THxzIXhPHofHs6BmPE9YHX1wT10F3w6gs7GzdLmsRUgwqm9Ibgxsv2HngRiI5QXsZM/nnt0/zkyDgC6Oa5rFzTIOmSvqQmmkLyOSt2datgDqCNvT5K3kEJYME7v4mSvB+Jh0H2lhhYzWxJzrZSNY+/J3Ln9X2QD8qA7Dcktm5hMlMzhxvKGeIjVGxJ91X5UoKze0TQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQroH0ggT7X9djBRc7Rqng5kiw3n5+kAx7ZQ9PN7kHw=;
 b=i4WM/z+24Zc1syrWthwGanrhHjO9B1+MLiOsKuLZwRfxRa3RkXJ4444uKyJplNFBDzpb+FMUL58PyUKW7qraXYBI7NTLRRhbMrtqIQ3mGRul0zNPxXdaTjvQrqrNGPNMHsDPqoyEamXoVyYzNzgC5EQZoQgV/sY62Jnfqb3HPrU=
Received: from AS9PR06CA0516.eurprd06.prod.outlook.com (2603:10a6:20b:49d::10)
 by DB9PR08MB6569.eurprd08.prod.outlook.com (2603:10a6:10:261::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 15:20:15 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:20b:49d:cafe::3c) by AS9PR06CA0516.outlook.office365.com
 (2603:10a6:20b:49d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 15:20:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3 via
 Frontend Transport; Fri, 21 Aug 2026 15:20:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPfOVBTuyuYVJqWcH4T3G1WYLyU86w3DCc7eOnnkgzHPGZJFNYwrrx2mlQpJ+sjwCg7XYPvLpdYtom3E0IVVuOe9IRTg0lREWE5/wMLvKlXAgf81qNr3knMirmxB9Vta05rOwJV0RZKkTtucvwQ4M3GVkzdmf6aNdOj4oahS23dEX6L9ryzAsvnWAb+ilCCOecuP2D8wb7L70c7VoTXvg24BY5farlAyWhjuB9Ylxld565CoSOjmZwi3mGDYtaG06upn55lmzct7V1MwdNpY8xP9jZgCMzVB/MJ4c/0ZccKMsEy3ZPthtbt0E09U3gl+coL/BG814s/KYW24IfmFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQroH0ggT7X9djBRc7Rqng5kiw3n5+kAx7ZQ9PN7kHw=;
 b=P/9Jl43BgTX1lOyLd8FfB2SRQ1ttFCgUKsRa65VE1C3dUSAo0wQvhYrMRzI4tOqCPObEhlVcun/m1PreI3EeCaftBZ5b71BPYCNKJOIudLHQSXZBAZBpdr4gCxWlueLbYt93ZYh+u7DD69EfUjMzZCwU9o7wPWgHIZbyeUXaog29fDISqui+2LJhk3hjDumWAfziehnEopeMbxy3Zr9ccFDUDZgb5jxpk3hrmUG3WCLg8crjEPLwGajW0rT+C7vnb7ut9LYR7ddAuQIwY2Jyrgx2p9Et+T5zpcw+zGtZc5bOUbYKtCgTjwYy15CGHv6+8RChUmkG2M8uR/nbGpi2nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQroH0ggT7X9djBRc7Rqng5kiw3n5+kAx7ZQ9PN7kHw=;
 b=i4WM/z+24Zc1syrWthwGanrhHjO9B1+MLiOsKuLZwRfxRa3RkXJ4444uKyJplNFBDzpb+FMUL58PyUKW7qraXYBI7NTLRRhbMrtqIQ3mGRul0zNPxXdaTjvQrqrNGPNMHsDPqoyEamXoVyYzNzgC5EQZoQgV/sY62Jnfqb3HPrU=
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com (2603:10a6:10:3d1::9)
 by PA4PR08MB5920.eurprd08.prod.outlook.com (2603:10a6:102:ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 15:19:42 +0000
Received: from DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90]) by DB9PR08MB8651.eurprd08.prod.outlook.com
 ([fe80::8fb8:7cf9:49c4:6f90%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 15:19:42 +0000
From: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
To: Cristian Marussi <Cristian.Marussi@arm.com>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, "d-gole@ti.com"
	<d-gole@ti.com>, "david@kernel.org" <david@kernel.org>, Elif Topuz
	<Elif.Topuz@arm.com>, "etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, "james.quinlan@broadcom.com"
	<james.quinlan@broadcom.com>, "jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>, "kernel-team@meta.com"
	<kernel-team@meta.com>, "leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>, "peng.fan@oss.nxp.com"
	<peng.fan@oss.nxp.com>, Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>, Souvik Chakravarty
	<Souvik.Chakravarty@arm.com>, "sudeep.holla@kernel.org"
	<sudeep.holla@kernel.org>, "usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v10 07/24] firmware: arm_scmi: Add support to parse SHMTIs
 areas
Thread-Topic: [PATCH v10 07/24] firmware: arm_scmi: Add support to parse
 SHMTIs areas
Thread-Index: AQHdMYB9zdLT2k2kpE+bB3Nn6IAzLw==
Date: Fri, 21 Aug 2026 15:19:42 +0000
Message-ID: <55CF80E4-F6AF-4164-86C4-35968FC132FF@contoso.com>
In-Reply-To: <<20260815232604.3730754-8-cristian.marussi@arm.com>>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DB9PR08MB8651:EE_|PA4PR08MB5920:EE_|DU6PEPF00009526:EE_|DB9PR08MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 355d554c-896f-452d-7506-08deff97b387
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|18002099003|22082099003|56012099006|38070700021|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info-Original: RqEMfEqmNaTB/vUlBYi4lG0OPoQAtwEnDt350zDzeN+Q+knFb5FfSwovmh+3HNTF73Za3cExu3dzwCp+vPIGcTOsBcv36fLPA7mCmLn3VWAe+aUSXZjZ2OpB7m7zLXKHX/UbDeRPkPGpUNEoCUcruCPonOTp2u51lQgFYFWFnOgjcIi+i6qRshOrJL0i5vG5hjTtVy79Lj1XDonD3I3gXNy9HOrPnkADkCJV+NfBYbf09dx6WxixGAQgkOn/6wOcLPmuNk6EOE/jTgK0vM7sbmSIfQv+kCDCXoiPdcw2AmHH15ZDTSxlMU/Vpj8ShT9NGAXG/WmFKQKu2YP7SYpaBej9smDOkB3n+R2jMpgUsfA1JrBifcsOALkVPxqmsaj+fFyTBogV6i37eIOmc58BZ++7Bm4BYittitck72vOhaG0fRH6MIbBbLKl2uBgUM4JFk5TBOPuGGt2NeP4aDcXgMpVRNymg+bbjPDyglFIfErJ2TDQkXHBwd1taHij9dpl9iVr3HUwQfyMffndhoftaWgOf/Gf2leZ7dhWdsgzgovafxCTX510qrIeC0R8IMDtAE7GK8AIqBhLD8+UpxhajQAWjy21Cb2n0EGpizSBizDkGv05Pf0k+VEEG/OEmyNoEy37DmvxahAJ6Vu5f3DLzQSxV0bVKYtJhsCqUF27YX20kopXlGUAdHH4lgnrpdlPRlFEahDyJlG8J1R24yIZLAV3QRu5yWK4mSRUbMg4SnI=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB8651.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099006)(38070700021)(11063799006)(10067099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <06EB71DCB338CD4F911E7FC2E4FCB1CD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: h/OZsyT224foWXVItYisoz9AWDJrWouGcwDB2I5EivE2wHgKWQzR5HMtb4n5d/m93OELXs6t+lD0D2ZDeyy7Q977aSfCccZGZVdbUh40xlB18fcKEb6+nL6rqBkEAKOdkWcPxbWDaBtMDRlscdg74WDX/AtFSxrizHaL9IiURnYhcQU9SIycP9aH8gJi60yJ0QktzfmdAwjiN/00tB6knuQrSAmCcKaatjP5envcea6YMoTPklB/YNveDqRlYmeOjALw5Iz35hWz5v+vE41KzLMiNBufVdoUt7I5lxZL3T+leoXnWJvxgsnTfQhiv4fuDckeA2ojDObq2fK8OXjuZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5920
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 68788b29-e73a-4ad2-a8b8-08deff97a021
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|1800799024|14060799003|23010399003|82310400026|36860700016|376014|7416014|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VNgdMXIf/aCNIgVPuJXPNesNK9BU8g5AWkXexVnevdOj4rqijFDYnAIX/A4IBLdu5l3jCyIEHtBKD/t59EykQpxccmTlbykWgS4Xp3PNUoIy4aTzAlSbBKNbbE1p25uVPWAkdT1j6gBubCQIXw4+PeiN+H53ULmH7CpAAgLLO/btz8x1CrZ9fhiSnnVzPotXro7vwXzEZHdv75mbz8JsxmV0IxP17iM5q4nuNe8WJrA4DDNVlfj9loLIhyllODdXapWUm8U09uSpnZpaAefnm525g6yw2OFCLP7YQ01EhFzSFsCm/in9rEkcwMOqYEf6ai6uB6fJHSmgpZrO70Dk/Zyxi1+FcfeVs9k8wFxIq+/2TNy1rPhttDW3JokkCPsrtKugoJPOVhWXmp5B1W4dEhDNAuqm/jWMuUkSGrB5HvsYviHRKYiWgK8nqr4sTuEj4/CwUu59Rp8kyZIdtFDbD1IRWvnowKFhrOuIWiVLRKVwDnHvERCDODG67YVsAzAoV+GOENppfBaaVtCaH318b3VC13QfGyAZJKvU+ssC/kHWgojToosD+SHWIUQRvqwOJ4py1N1S2WQvcV3TwwnNpmJOsIJwaWK2PHsXiuoJ7S3Sr6kI7TJHw7jukzTovxQVeAp6lgbgYlFMsGxEDtmNNsXUI8ijBhMs8JRq9GCjv6WTjGjtutnHKcd3pivZ08Ar90Pn8CAI/+Kyg7wZgQwQwg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(14060799003)(23010399003)(82310400026)(36860700016)(376014)(7416014)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ICEzmHDA1kHgt2hwuPKrvgYnhuEzn9B0WFsN9CL5+8HaKHrRu4Ebxr4tGnO/5eyMPFyG52AQiZkuKylOiCna4DbXVXcsgPQRqFdaCe+e6xbFtlSS07bwNwmUWTkYRxuYQ+9UWyGwVm8GJJGOj/PW61qEtUqy6s051ZqCXtI9DD5OPQsO2Q4vfhZ2rmhzYCGdtvISc4xAZJucaXaJ9Wwe9QIN9t2CquQmMXjAKPXVNwPSQUbpQ/3xiHpbnrmT9T/Cf/XclsNIWbIpwRdpZOrLAZYyEdweMHx9Z58MpRwOsCtfnp26jomsNHYsAUYnuUVwhJcvh7qwa3w4gsNMxfqlZC8j0gBTnYsKllEdgFdq8i9lDCSJRaExelOWBQdnNWXgb+bBJzRg7s3j+k2PzfI7C1sSMDrpHMXO0Bgouh6FkNIJ9nqmjXq83TCysDiSAoTf
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 15:20:14.9322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 355d554c-896f-452d-7506-08deff97b387
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_082021_277893_0D71599C 
X-CRM114-Status: UNSURE (   7.25  )
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

SGkgQ3Jpc3RpYW4sDQoNClRoZSBVVUlEIHBvaW50ZXIgY29weSBhbmQgbm9uemVybyBpbml0aWFs
IGNhcGFjaXR5IGFyZSBmaXhlZCBpbiBWMTAuDQpUd28gcmVsYXRlZCBsaWZldGltZSBhbmQgb3Zl
cmZsb3cgaXNzdWVzIGFwcGVhciB0byByZW1haW4uDQoNCkluIHNjbWlfdGVsZW1ldHJ5X3V1aWRz
X3VwZGF0ZSgpLCBib3RoOg0KDQogICAgICAgIHRpLT51dWlkc19sZW4gKiAyDQoNCmFuZCB0aGUg
Zm9sbG93aW5nOg0KDQogICAgICAgIHRpLT51dWlkc19sZW4gKj0gMjsNCg0KY2FuIHdyYXAgYmVm
b3JlIHRoZSBhbGxvY2F0aW9uIG9yIHN0b3JlZCBjYXBhY2l0eSBpcyB1cGRhdGVkLiBUaGUgaW5p
dGlhbA0KdGktPm51bV9zaG10aSAqIDIgY2FsY3VsYXRpb24gaGFzIHRoZSBzYW1lIGlzc3VlLiBQ
bGVhc2UgdXNlIGNoZWNrZWQNCm11bHRpcGxpY2F0aW9uIGFuZCByZWplY3QgYW4gdW5yZXByZXNl
bnRhYmxlIGNhcGFjaXR5Lg0KDQpUaGVyZSBpcyBhbHNvIHN0aWxsIGEgcmFjZSBiZXR3ZWVuIHNj
bWlfdGVsZW1ldHJ5X2xpbmVfZ2V0KCkgYW5kDQpzY21pX3RlbGVtZXRyeV9saW5lX3B1dCgpLg0K
DQpsaW5lX2dldCgpIGxvYWRzIHRoZSBYQXJyYXkgZW50cnkgdW5kZXIgbGluZXNfbXR4LCByZWxl
YXNlcyB0aGUgbXV0ZXgsIGFuZA0Kb25seSB0aGVuIGluY3JlbWVudHMgdGhlIHJlZmNvdW50LiBs
aW5lX3B1dCgpIGRlY3JlbWVudHMgdGhlIHJlZmNvdW50IGJlZm9yZQ0KdGFraW5nIGxpbmVzX210
eCB0byBlcmFzZSB0aGUgZW50cnkuIEEgY29uY3VycmVudCBwdXQgY2FuIHRoZXJlZm9yZSByZWFj
aA0KemVybyBhZnRlciB0aGUgbG9va3VwIGJ1dCBiZWZvcmUgdGhlIGluY3JlbWVudCwgYW5kIHRo
ZW4gZXJhc2UgYW5kIGZyZWUgdGhlDQpvYmplY3QuDQoNClBsZWFzZSBpbmNyZW1lbnQgdGhlIHJl
ZmVyZW5jZSB3aGlsZSBwcm90ZWN0ZWQgYnkgdGhlIHNhbWUgbGlmZXRpbWUgbG9jaywNCm9yIHVz
ZSByZWZjb3VudF9pbmNfbm90X3plcm8oKSB3aXRoIGFuIGFwcHJvcHJpYXRlIFhBcnJheS9SQ1Ug
c2NoZW1lLiBUaGUNCnplcm8gdHJhbnNpdGlvbiwgZXJhc2UsIGFuZCBmcmVlIG11c3QgYWxzbyBi
ZSBjb29yZGluYXRlZCB3aXRoIGxvb2t1cC4NCg0KVGhhbmtzLA0KRmF5w6dhbA0KDQo=

