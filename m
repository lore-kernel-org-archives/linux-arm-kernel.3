Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E90E4CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 22:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Cc:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLyc+MoK/bDLLLOOhxKxst6nPC7LW45/XklJtfSNEKE=; b=jA8dQ3J5FdFzu4ukJaYwLBSr6+
	JxY/LA9yBsP3bj+dsikZWeAhXZdMieqNwBFLBK7K2Ug9ZpsimhLY8rMeIrfK1/g/NNwDwALw0IS9c
	SIOJgU1gdzT75ARbdqsYVNNRFD70HyBCxua3ve4rKmQ4Y06AHtiu/WyF1CxDoCj3xtxJqLBqWCNIK
	4rmKYGkDYNVISu03yHh+esYa5n0+T86kC1ru52VnXlVU3EKhXCmi9HDRsPsJgC4FPf78ybBfgQhcm
	M3B7kZe2NbNJLrMHI+wxsf41mpEDq7kxn0Uur6fWAw7CO0FrdUsvrp/IdaHAFHfPAJNkDc/9PI9Ay
	z7yTIF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcWH7-00000008PJl-14hO;
	Wed, 24 Jun 2026 22:40:53 +0000
Received: from mail-francecentralazon11013057.outbound.protection.outlook.com ([40.107.162.57] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcWH3-00000008PJ5-1Q0O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 22:40:51 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=op/vPxsXC8sAOTEzPQfBgX/eBF1ENdyNmFaQ5k/N7p2UlzyI/YK+rvH9AsHfcjwENaIobKnEBDGHIo+i3AjUHw522E65aXAoVP3CKN2rGbquXBAZ4MqY4oOhgVv09ST9zNxQJVDoJ4H+iod0cQ3A4SXSr9AJKFqfOnrDup6paiZEAE/4j706Q3df35wro4RI/cZxzxKG/IWzWoxYglqcue12LgdcwklQhDhAIQxq+VDkDknHX48jAzPk/V43B/TrmA0T/fMyZ6sO3PlPKjF6+p0XufgnyPaMl33sULcZgpF2HePEnaBdaXFZ9vl5gAb+kxI2rrUcow5dKvIRz1nbfw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLyc+MoK/bDLLLOOhxKxst6nPC7LW45/XklJtfSNEKE=;
 b=iVKb80DXQ5q4cRA53w3uFU4LnF2eAtFgYM3iyK5FWBtTfNeEblEu/iVjFxWBseeoglXJsWC+124zUb+z/D3M/4uO9Gp0oTt1j2CnvDgZlhfCYdvLtQ7GoE0D+hphJhvNc96GMRO/DCfBD6+ZqQDvAK0jFkXq6O0fR4EGKFHFQppfxfLdJvucJh35WxCLSI16pydO06dLFlLJ/fRf3YwTJgA8sk8LqtLikx8CZfYaEGF0GWrOD2MBL2paXwvgVXboUenNGRKeztjypG/anepwOMIWs5Gpwt84Jq/5DN1ywoVQJqSeDHx4JlKtsgyBquHbMY8b0gcPmfe1mqpMm//hiw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLyc+MoK/bDLLLOOhxKxst6nPC7LW45/XklJtfSNEKE=;
 b=rt+ie1q9wHsg1slwUeP8x1Per7GysBsfWEg28/8ehwdulmt5cI8Xf8h6kq1iGXUoytC0j5wV2WSNB5bREuDnOj1Kor5q2YdbKCkyxv16pRpovcEi3TsPgTnMdTY/b+zvP1vd3n8rVIl1gf1sqdam4oRMCufocZgD1epoV6UCEAo=
Received: from CWLP123CA0085.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5b::25)
 by AM0PR08MB5331.eurprd08.prod.outlook.com (2603:10a6:208:187::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 22:40:40 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:401:5b:cafe::67) by CWLP123CA0085.outlook.office365.com
 (2603:10a6:401:5b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Wed,
 24 Jun 2026 22:40:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.0 via
 Frontend Transport; Wed, 24 Jun 2026 22:40:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wm6+O++yjDbh7alkdkXYmBtwxMKSnxd3zut4uI7MrOnm+tye1y8l4u/glKNODA8FgUnYfzFctAkRP/3ZSz8dg+dDq/xbNR3I9M8v5vq6bERDjWnypM2s7PUOjSsrvRXvhi/FFXyORx+fMLj2zXiBbm3vvyDoMksLNZWso+FZ2ofWD2ezcgNcRiKRjEnYc8aSfT6dfw/GuimzpXU2DaXs2JMeGT4KYDn6xork3R4qW0VvllcaZvj0dggCiE5z7Yru3FrNMU07LPznw/AjtMhysvxgQYMVRCKOTrnh7ZHRpFbyZVVhWlEr3PWM/4ysSduqMvwMroVNTXbmYXeNgsPCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLyc+MoK/bDLLLOOhxKxst6nPC7LW45/XklJtfSNEKE=;
 b=RQ66qrFlYnwyWZDT5WJ+BGUrEOmBI6mRZ9BE5rA5Te+KzXh9RJs3KDog2dQVHNooOuFW23y3mzOnUkfKNpE95hue3iDODcqNDL9+Raggh8sbyIFjI8Ds3IxKrIcjSwCaNLFMxvikLs/NWP0dCBNikDxrK/KOWYIi0u24Nr9gi06csrEV0H0GanWLN0CtMro+sXj53VL871OaYdjrYzEYnYExhx8kq4Hm6wZdZKaokcew7KShP/qq1DCMTdFtge9y9p7fCzStN3qYpXwC8grX3Xjtz00xFXp1hLot5hcRodNy87Xi5xl8RlOU+VZSq7BxWMwRBVKSuBaNf4W+L2BiWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLyc+MoK/bDLLLOOhxKxst6nPC7LW45/XklJtfSNEKE=;
 b=rt+ie1q9wHsg1slwUeP8x1Per7GysBsfWEg28/8ehwdulmt5cI8Xf8h6kq1iGXUoytC0j5wV2WSNB5bREuDnOj1Kor5q2YdbKCkyxv16pRpovcEi3TsPgTnMdTY/b+zvP1vd3n8rVIl1gf1sqdam4oRMCufocZgD1epoV6UCEAo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3414.eurprd08.prod.outlook.com (2603:10a6:20b:49::10)
 by AS8PR08MB6647.eurprd08.prod.outlook.com (2603:10a6:20b:38e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 22:39:37 +0000
Received: from AM6PR08MB3414.eurprd08.prod.outlook.com
 ([fe80::dde8:bf0b:1dc:2a2]) by AM6PR08MB3414.eurprd08.prod.outlook.com
 ([fe80::dde8:bf0b:1dc:2a2%6]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 22:39:36 +0000
Message-ID: <34e57d86-8cd9-46f5-a5b1-8c8b1e40e2a8@arm.com>
Date: Wed, 24 Jun 2026 23:39:35 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: mm: opaque hardware page-table entry handles
To: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <ljs@kernel.org>, David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>
References: <74182e50-b54f-4d2d-a27f-3a59a538d6bc@arm.com>
 <DJHEF8MWTZSC.3KMTACZH7KWP@nvidia.com>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <DJHEF8MWTZSC.3KMTACZH7KWP@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0019.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::10) To AM6PR08MB3414.eurprd08.prod.outlook.com
 (2603:10a6:20b:49::10)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3414:EE_|AS8PR08MB6647:EE_|AM4PEPF00025F95:EE_|AM0PR08MB5331:EE_
X-MS-Office365-Filtering-Correlation-Id: cd35cfb1-880e-47c0-be0c-08ded2419e08
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|921020|22082099003|18002099003|11063799006|4143699003|5023799004|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info-Original: LVskdUhvdQx70IXRonivdrP7fGDkvaGupki8RdvC3YG/DLinLPEWvEUUWcvtz9efs21GF679OH9c3LoU65CItM8rIMrh3JzedbwC/jySUCSQphWOYFFjtsSpbA972jidb5dJ82wjVYFkM51YuieOzan5Uq62sR+NQRidtQ5g6QkrtGUOgmqn92vC6S+j2PIHo8GNjelGEfp9zQYy9E2OA7fNrLpgKnJeadraY49zJ+keynSFKw7NNnVQBtPQfYUHGFXOmlYh7R1802blXBvuSe//hnJjXNYAXhmITSvct6zo40TisSwUEkSaQ1y8tzc5/a8a1CYKaUt5SoeTObpysGqFwWe6D+O6qsjCvq7a/1TdFBFL6BBEY6ozCxQgT0Zg4Sf+qP1wmO3DVFExY16/sbrp89tWWL2z1DPhRfUZ3VkfYOowyZmIVTy5dH2F4oXFicxpQsgfwcmvFK/ygFhPE19ra7YYSGlN1xVLufxrHStLTJqoUYcWyYV0nWmV75742iJhgIk1lJH1j+nVt/ygP7DECtX13nxgrpfiaj1k6Z/3t3pl3PWtHyhpf900dOSBQJWi6F0N1n8OA/sVXOREzFI3hQIDnvuQS63q0ffg2SxSd1JcXbXHo8MGtAfmM/o/UIjBaDPTn+VbRkq4gsDw4ENcPlwV5t/cm8FTMRs3wEObd2hSXzfEZ/YAH4GIoWke4fdf4qsyqLLa5eW8m3NSfg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3414.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(921020)(22082099003)(18002099003)(11063799006)(4143699003)(5023799004)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: AqTtFHhg1OFjJhaj2rtEKfTsj2Ca3eAhEhzEAHIaEj0vB5pUwwgt1lYVhQdhvkVKhkSjNxDrnNspyMp4d0GVeFBRqh9ZHhfzDBZEUn3yp/pHpJqjwtA4tQ5KTRYa5FjgAAvMTFZ3Uu271jXZem+AHmYrz2YVrTWhyc4zhqzDCsY3DebkWZzLDaSKmaVN82HfEqox2HNZNk1GVFHLERskTGlaaUbuUdjR+U9EB6gj3xTfZKMiVK3RTMXqHsw2BpwRxNcpNuIYz25IVL4492dJViiRjdTadk7HpSjSISNs1dNgt66CqfXcDvSwM3BAADn1htLY6/kqAlo7hzt9fFu/5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6647
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b1ba5dd6-5839-4472-54fa-08ded241782e
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|82310400026|1800799024|7416014|376014|23010399003|36860700016|14060799003|18002099003|22082099003|5023799004|4143699003|11063799006|56012099006|6133799003|921020;
X-Microsoft-Antispam-Message-Info: t7SQQ79kxX1ereuI6YyN9RKA4J6A8/P1vxkK4hW8UrGjwYXATJF/wOImueQpG8petlp0I8WqqaSbCBZNr/rRPhOG1Izg3xsj9mWApErulgQMSj8w7tYozfmlbHFEm2MUi99mhHSgMfT4EDXYCG7m1OupceIY4UxqwlgijbstSGlLY1XneQIuIUoo62HaxnTUBRTlgjUM6TX5ytjAPTPQWoH1bMv9dGyVEoM6VLERKMyFUxco1ydAFtDNzyU5JuvFKM8BR1MbknTzIWdhrUyu+L65qgtukDhBWIrG2M0SOCg349INgjnQBMCyWKUJS2SqeYrf6aDRsXhOBaL2++vpXiXgvxkj70xLpu11Objij4h7rFgCjutILsm4j6xK4Hz1fd+5cYpc7tsp6Ix7aL0bBvFE/fKClKE4UJxWYYwqZCPdUSEGxjz3N2w0tLtmqHMmnhLXswBpadwOIrrdZV3tI/3avLubvUOVMzWpQ+7er7RDWDtiH0T6j1skszXuewN3zDOyLTBZzuD6SYhQvB1MLga5mqG7lqea6AHJFnt5V9LRE/miS7qzpYJeBWcgnbIYYLd25fK8R0fBT+sPROJlBr1Yi9zhSilDwPrB3nK887ZoJlJ65VZ5yYP7dYT29+iW1hTPnv/u6v4j1Z/Rox8EWdv69TIlNNTSMKuv44Q/VqajSRHP0plEqDRw+EI/tLvHm8opsQnrSPPd+P5+pUzClQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(7416014)(376014)(23010399003)(36860700016)(14060799003)(18002099003)(22082099003)(5023799004)(4143699003)(11063799006)(56012099006)(6133799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VHFbiv0LMwAPUvirWrKeZiDEGMCZk3FLpXRCXylHkd5y3VgHNjOMJwlktYOMt52eQCPNM5jUfQxFFD2SGwrJspLn1dLOzm6gcgx+uHvFP7x0eBYO6IqqIV4AoLXrTEr76U/BikwHj38cwHB4kUjlkirPJIWQamRZ3yNkBMkuOrtQacqcTzs1tQjBNhdlnLB9wlLKN82uweNsmOcxdUD1d6sF258/guYTfYQF7vxEws6EmGKxfr0UK9HxBRx3yN21E2cBa9ZTdSceCdP0AOmdaEXDtj/T6TGaXcd78mLJhWGaiIAAgGilAXHf16mYJGb9GSTjMe+HNHeBR5xjP1zRnicZ1cpk6Hq6WoNotd9Q4T4zz8QysQ1+APMawfkvi7Qt/iNvzTl2VItkOS3j1Ey81uSZ7mU1myCHd1VeK/AiCyKGKfNDsWRj99+SpTW05Xhw
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 22:40:39.8298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd35cfb1-880e-47c0-be0c-08ded2419e08
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_154049_585377_072913C3 
X-CRM114-Status: GOOD (  34.20  )
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

On 24/06/2026 4:52 pm, Zi Yan wrote:
> On Wed Jun 24, 2026 at 10:09 AM EDT, Usama Anjum wrote:
>> Hi all,
>>
>> This is a direction-check with the wider community before spending time on the
>> development. This picks up the idea that was raised and broadly agreed in the
>> earlier thread (Ryan Roberts, Lorenzo Stoakes, David Hildenbrand) [1].
>>
>> The problem
>> -----------
>> Core MM code reaches page-table entries by raw pointer dereference (pte_t *,
>> pmd_t *, *pud, ...) in places, implicitly assuming a single, uniform
>> representation. Sprinkling getters wouldn't solve the problem entirely. The
>> problem is one level up: the *pointer type* itself is overloaded. At each level
>> there are really three distinct things:
>>
>>   1. a page-table entry value (pte_t, pmd_t, ...)
>>   2. a pointer to an entry value, e.g. a pXX_t on the stack
>>   3. a pointer to a live entry in the hardware page table
> 
> This sounds good to me, but can you clarify the situation below?
> 
> A live entry means the entry can be accessed by hardware when the code
> is manipulating it? 
I think live is wrong world to chose here. Its a mistake on my end. (3) means
the pointer points into real page-table memory and that table is complete,
whether or not it's linked in yet. A withdrawn-but-not-yet-installed table is
still a hardware table and can be represented by hw_pXXp type.


> What type should we use if we are pre-populating
> PTEs in a PMD page before we establish the PMD page as a HW page table?
> In __split_huge_pmd_locked(), we do that. A PMD page is first withdrawn
> and filled with after-split PTEs, pmd_populate() and pte_offset_map()
> are used for this not-yet-HW page table. Later, pmd_populate() is used> to make this page table visible to HW. Should we have two versions of
> pmd_populate() and pte_offset_map()? Since the first pmd_populate()
> would accept pmd_t*, but the second one would accept hw_pmdp, if we are
> pedantic. Of course, we can be flexible here to use pmd_populate()
> accpeting hw_pmdp for both, since the PMD page table we are modifying
> is going to be visible to HW soon. But I think we should have clear
> definitions for where these types are used and document them well.
This is exactly the example that causes the confusion. Following the definition
above, the pmd is on the stack while the PTEs are being prepared, and the PTE
table is complete — so the pmd pointer should be pmd_t * and the PTE table
hw_ptep. I'd keep the two APIs distinct rather than overloading hw_pmdp for
both: that's what enforces the rule that no stack pointer reaches a
table-writing API, and what lets the *_stack path drop the synchronization.

(One thing I still need to chase: there are cases where we convert between pmd
and pte. I need to understand how often that happens — if it's common, a
hw_ptep could get converted into a pmd and bring the confusion back, and if we
have to account for that, definition (3) may need to change.)

> 
> You probably can ask LLMs to check these ambiguous/vague uses throughout
> the code base.
> 
>>
>> Today (2) and (3) share the same type - pte_t *, pmd_t *, and so on. Nothing
>> distinguishes a pointer into a live table from a pointer to a stack copy.
>>
>> A pointer to an on-stack entry value and a pointer to a live hardware entry have
>> the same type, so the compiler cannot distinguish them. Passing the stack
>> pointer to an arch helper that expects a hardware-entry pointer compiles fine,
>> but is wrong - a bug class the type system makes invisible. It also blocks
>> evolution: an arch helper may need to read beyond the addressed entry (e.g.
>> adjacent or contiguous entries), which only makes sense for a real page-table
>> pointer, not a stack copy.
>>
>> The idea
>> --------
>> Give (3) its own opaque type that cannot be dereferenced:
>>
>>     /* opaque handle to a HW page-table entry; not dereferenceable */
>>     typedef struct {
>> 	pte_t *ptr;
>>     } hw_ptep;
>>
>> With this:
>>
>>   - a stack value can no longer masquerade as a hardware table entry,
>>   - a hardware handle can no longer be raw-dereferenced,
>>   - cases that genuinely operate on a value can be refactored to pass the value
>>     and let the caller, which knows whether it holds a handle or a stack copy,
>>     read it once.
>>
>> The overload becomes a compile-time type error instead of a silent runtime bug,
>> and converting the tree forces every such site to be made explicit. This gives
>> us a framework where the architecture can completely virtualize the pgtable if
>> it likes; and the compiler can enforce that higher level code can't accidentally
>> work around it.
>>
>> It is opt-in by architectures and incremental. The generic definition is
>> just an alias, so arches that do not care build unchanged:
>>
>>     typedef pte_t *hw_ptep;
>>
>> An arch flips to the strong struct type when it is ready, and only then does
>> it get the stronger checking. This lets the conversion land gradually.
>>
>> Beyond fixing the latent bug class, this abstraction is an enabler for upcoming
>> features that need tighter control over how page tables are accessed and
>> manipulated.
>>
>> Getter flavours
>> ---------------
>> While converting, it is useful to have two accessor flavours at each level:
>>
>>   - pXXp_get(hw_ptep)        plain C dereference (compiler may optimize)
>>   - pXXp_get_once(hw_ptep)   single-copy-atomic, not torn, elided or
>>                              duplicated by the compiler
>>
>> Keeping them distinct simplifies the conversion and avoids re-introducing the
>> class of lockless-read bugs seen on 32-bit.
>>
>> Example conversion
>> ------------------
>> Most of the conversion is mechanical.
>>
>>   -static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>>   -		pte_t *ptep, pte_t pte, unsigned int nr)
>>   +static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>>   +		hw_ptep ptep, pte_t pte, unsigned int nr)
>>    {
>>    	page_table_check_ptes_set(mm, addr, ptep, pte, nr);
>>    	for (;;) {
>>    		set_pte(ptep, pte);
>>    		if (--nr == 0)
>>    			break;
>>   -		ptep++;
>>   +		ptep = hw_pte_next(ptep);
>>    		pte = pte_next_pfn(pte);
>>    	}
>>    }
>>
>> The bulk of work is this kind of rote substitution. The genuine work is the
>> handful of sites that turn out to be operating on a stack copy rather than a
>> live entry - those are exactly the ones the new type forces us to surface and 
>> fix.
>>
>> Estimated churn:
>> ----------------
>> Half way through the prototyping converting only PTE and PMD levels:
>>   77 files changed, +1801 / -1425
>>   ~57 files reference the new types
>>
>> So the line count will grow once PUD/P4D/PGD and the remaining call sites are
>> converted; expect meaningfully more churn than the numbers above.
>>
>> Introduce the type as an alias, convert one helper family per patch, and flip
>> an arch to the strong type last - with non-opted arches building unchanged at
>> every step.
>>
>> Open questions
>> --------------
>>   - Is the type-safety + future-feature enablement worth the churn?
>>   - Naming: hw_ptep/hw_pmdp vs something else?
>>   - Should all five levels be converted before merging anything, or is a staged
>>     PTE-and-PMD then landing others acceptable?
>>   - Do we want the two getter flavours (pXXp_get / pXXp_get_once) at every
>>     level?
>>
>> [1] https://lore.kernel.org/all/a063f6c5-2785-4a9f-8079-25edb3e54cef@arm.com
>>
>> Thanks,
>> Usama
> 
> 
> 
> 

--
Thanks,
Usama


