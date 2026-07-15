Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B69C44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 16:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Cc:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fwky7dU2ZLGfcQTZTie9pJXkcdEnlkwiiYLZBD9aaJg=; b=0kLLLuCvMlNKEiZs0iTQSkYbTn
	/Ix3g0jrCaHB11ORVGF0vZED8S1hiMlHcpaNDVWGEP6UtPcy2XAtEPu/Ji5F10eebWXrduVamYb2W
	DlcI0z0ABmIu92jrCAciKXr2wVHGbT7tRgbCR7VTS+RJ84MMm9O674PNj+ONgfF/C9emfJfumzzet
	R627FznxlbZXSp/DRoidUS5v7KXNbAGVWMnpU2Ugkc37tNSn4N5quy5eHjOMlpCtR0WkQvZKlRLRD
	DRWoYJeeqaZ1GwU6FPJ3u9BGHxl9+dLAmPx40Z79O0ZlR6VpJdrz/eeU3iG4xzixo0er8doDgOwm3
	QU1kG+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2IA-0000000FQh4-2WxE;
	Wed, 15 Jul 2026 16:17:02 +0000
Received: from mail-francecentralazon11013064.outbound.protection.outlook.com ([40.107.162.64] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk2I7-0000000FQfb-1JvZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 16:17:01 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DoiBJW+/RdCKft7zj+vLsWfq+pHdRMLMLWb61xePkkEBwDHWS6HGc6OnDMdhjcYzCCht3eqnxnJ001m2ZiD9NDqOCSxmopb9r4Wwf47duioYqO/ZhKg2tC0BH4TaSXmUkF0+1h3TEZf3V+2FAXw7XKO4D+wx406awwbxF7CJYqh8Vgb/d0NxcVgP+H8QNvv2WW/FoW8f9wDquMTl+8dInqmw9DCxDq2z5TYaXnnKaDW+Y01pQWBs/tc86ZjFNVO4eCR3KCzvULCdfa2/dxAKKLobsXiaoqraM4j+GOhabu+93699rq8nXaGYDwqlPXzd9lQK9DOwU/NBGAOMqBA3cg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fwky7dU2ZLGfcQTZTie9pJXkcdEnlkwiiYLZBD9aaJg=;
 b=QK8sYLbRRSgNV5rbA76MF7avz0DZ12kJ4xtmyWz3jVRmgQ/vCMemHCBV2NxctrCxSr4S5aASdyl9V5kL4SW6zbgzrAV6kUyzA0o3xUn8N7LZdua4hb62eA9IAg4AyUI2yvZgWQM1Z3K9rEvbpui32/YGjY4xmlzu0rAHpfGitku5nYRx7b+b7wNtBqwUFCGvuTRSBmr1dBi4/FCTfUVwnP93N3ukI7xM1xOI+OQIc5CzuzZCv3ORkp+LsMntpgGi7i+HyVkExV4YgvH0h2xV+fzQr3rmTTAfd9NdQyYhjEMg4BsxGhscCJov+riE9X2Nk49uq5VuX53iQdUoxfvf5A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fwky7dU2ZLGfcQTZTie9pJXkcdEnlkwiiYLZBD9aaJg=;
 b=g7vAGzIx5Cn8R+L5Dc9nRobs+deF360TNhkHy7gdZuk2lW18EL2zVidOYVsASq5xhBZIlRHVnp+NGnts69ULOQ074qOVJtCSSgfOCuO1bnUT8kQcYjsrjreZP/oSP/k0qCuVJoNwvleCLlXgjWmCGDxGt6Dv0doNcN3uaKCYpu8=
Received: from AM9P250CA0028.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::33)
 by DU5PR08MB10658.eurprd08.prod.outlook.com (2603:10a6:10:523::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 16:16:50 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::5a) by AM9P250CA0028.outlook.office365.com
 (2603:10a6:20b:21c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.11 via Frontend Transport; Wed,
 15 Jul 2026 16:16:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9
 via Frontend Transport; Wed, 15 Jul 2026 16:16:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+a/EOSk0oVPruoUQo9rNd2eU9D7wFUZjwwUGlpQ6A1eRQg65pHtZINri+PRG25cGCJT/tO6ZT/daTpnJJCcPnAsNA+IMbpv/mhpk2DmWzs3H6Z+Sa6SjOz7MA2SYyh9OVKldiGPYRSBjI95lbY9HybyYqvQeZpL1s//YBW12DY8mI3lzUKQaO6bQSzwFza9PRg4Htflr/FpUvgPLXlA2iWutulmpeOpkZs1QBBRq+2iKt+1HOe+XHACx6wR/blVZ4cWnEL7uKXHUzny51vfTl0EqwDYqsXOe4RIOG4+/lLhllJjYo7PhbuRNHvyzlyZ59Jx69tUAsE4Q+2RXVmdJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fwky7dU2ZLGfcQTZTie9pJXkcdEnlkwiiYLZBD9aaJg=;
 b=kZAHXSy0E8zG9xN91oj+R67IRLToTAKkmwWTE7lVw+kK3HV/FkX6A7imlVhOhW3EQkS+10Tp2EaiW+o8J7NMMUkCLk9tGWMQ8D4qhg7F5ugCZheT8ndw1zoHnkNUbdLAU1RDjrxwNAwN8j21mtYwh708ndZVuYYzr1QJ1q2v4ip3rCuNGnURMj+Rr4kpdru7GsXQFP2flvqriU+44nWbHK7QOoGPDL14ipXUORVTLjVGum3j+v3/irjqLOpTRONtP1XcFp2iLlJe4AO7iHa58gpwwLQvq6ELXlPW29wr1VqNG2WsP80D/FJC0TD4MngoeQNGn8WSFRQsmBBaVZB+Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fwky7dU2ZLGfcQTZTie9pJXkcdEnlkwiiYLZBD9aaJg=;
 b=g7vAGzIx5Cn8R+L5Dc9nRobs+deF360TNhkHy7gdZuk2lW18EL2zVidOYVsASq5xhBZIlRHVnp+NGnts69ULOQ074qOVJtCSSgfOCuO1bnUT8kQcYjsrjreZP/oSP/k0qCuVJoNwvleCLlXgjWmCGDxGt6Dv0doNcN3uaKCYpu8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by GVXPR08MB7800.eurprd08.prod.outlook.com (2603:10a6:150:2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 16:15:38 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 16:15:38 +0000
Message-ID: <6110202c-057b-4701-8c04-1a76ee7bb9ab@arm.com>
Date: Wed, 15 Jul 2026 17:15:36 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>
Subject: Re: mm: opaque hardware page-table entry handles
To: "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Pedro Falcato <pfalcato@suse.de>, Ryan Roberts <ryan.roberts@arm.com>,
 Lorenzo Stoakes <ljs@kernel.org>
References: <74182e50-b54f-4d2d-a27f-3a59a538d6bc@arm.com>
 <31d36023-d728-4eee-90f8-158c7066f565@kernel.org>
 <e22407d8-4509-4a53-9ba4-491b9d5c5ef7@arm.com>
 <4bfeb697-9c1f-4316-96bb-9bfd66f959df@kernel.org>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@arm.com>
In-Reply-To: <4bfeb697-9c1f-4316-96bb-9bfd66f959df@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0097.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::12) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI1PR08MB3421:EE_|GVXPR08MB7800:EE_|AMS1EPF00000041:EE_|DU5PR08MB10658:EE_
X-MS-Office365-Filtering-Correlation-Id: 70638194-68dc-43e8-1a06-08dee28c799c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|4143699003|3023799007|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: gtYpi9ooM4OjX8kTq40qPmSvVQ9JjQ9+JJPAJDdSteghwdthNoQOvYfZWX+HVZSAkcCWrmFBFb5eQLm6F4S+4lyclfeBDzo9+0msYQSqGdtSNbQbnPBtNXDbO49hyO3tUfYXYnlqU/jTsHcQUwVCemDFdqJtnHX1/NJ8sZp+UmUv9EK8IdL5F/1TFpuIBYTXwFSb0hK5zreMAFytWgmbbyG2SkOSyuBUvIdb/hAE72IASSH3YaKztm3Pjof9fxV9eP0mRTR3IBTqIsQMYK6pZTGPgD7vYCxczbCP8mxVD/sWgkS8xpccnbNzrL3JvFdsnM0kY0MZ56iqOY/5ApFr8EzxojKeF6j5fHo8JJnMbMupV+nUjt6aQm6H6wHHx6Kiib7gt7ArOF0iNn5Xj04HabEvxnrNR3Dt07UW934lvqHbgsgFvDVkCA3b6qrjkkPMe5fXI7dR32p1MfWNiXgA1qHIA5UrdkodBJKBZos/OdWCmlDHkLIwNmCaAmF3GnAoXTdE6bevYuOUMWQPjEAZ/ZgQ4zA8vtH0Ys1jQunfeS5RiksdNXetWO8UUyg24srAP5EMlztN+CXd1skUD9toirMFGFIihRss/wHS66Y297cfCL+Y/q5PrnxGmSvm7efTnbdRu77+qumGiG1CMkc71CmNXcijSeoojw2cv+QuPtY=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(4143699003)(3023799007)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: cWWYVhzrHQ08d4QLVrQ6A4M63+Rr+BVUQdXRqvIHdGP7FjPRL0/Nt76IwnM+q0HODpEItb5X62Y79Si4MCjOG7eSg90RObk6T6LnYLFvAVk23tEj07JR97ketyZaPiW6D1MFjyWkFb9kXV7Kr97/ejB1SoAdsuZUomexcgWCyZBaQys7hdjpL2YN8lXgzz5faDdQtvU013InavgeD1931OHy99vRjQCG68hL4By/x/GKZHvcvMZP7NkbzlaJ2W5n9YGONZPPgNQo3ELExgYmG26NGuW83OLz/aL8+4fTG0z85dHiZEZw7UEui3g4aO4NpdpU11OXJd1OpTRNaU8/rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7800
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bdebe999-872d-42d7-611a-08dee28c4ecb
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|14060799003|1800799024|35042699022|82310400026|7416014|36860700016|376014|13003099007|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003|4143699003|3023799007;
X-Microsoft-Antispam-Message-Info: ad2BskIu5TgRj29kv8GI7s3WRr3+JbHYXPj6+LO6iNgm8af9iq+MMLjwDpr6PsTBdPmXBn4DrYvqUVzLqNGXof3SRQrSG0IhrplormMVEzD4J5UiQMwODySz1NukiImLWAysWZM5D44gjk71etADn+RYZ80ajegrC6abMcgw4bpV1599y7A7lDIMcg/iaw+OUGr1pGZ34i/Gf0n6UKayUTfJchSvMNAXZwGwdaLFXvz5OL3lj1etB9l+XZmf92+qltN2dFeTeDa8+H9dDhkCujJzWsTljToqyBWNtEsKpV4QmgMkmnjtAuzjj7RQl60SRIu3r9vpLi6sBf95MfpXnAAPwph/WAGLZNV34VzGE4DTzIVYpMa0/lhrH9k5vNxheVHGEyyf5b9RR8Sb544V4QH9kdNsqoxFtyIvm/mQbAaMAAnICQNRoaboq3VooIrnMqhDahEzNGhC00fxDZWL7TU4rhXTN731q+KLw/5eSEdGxMxWgfIHUdM9kA6accuNtAJhb+fGf/EEjRd7TMuH6WgfaRLg4M2oTlY/Q8/Ad5Qavy8QufKxTGRzfhAlhLSJKs4N1Fgo1V54lOwK5KkmD4i8wlSv6pJfkFU52/qIpI8TRXMCU0hsqBJ78nJAuQt2+L9RhfKd9++amPEYI3AVY4gTb7Au2xnQF+r/UTQ54bX8FkaP3k1azuvgwubVQ9kTtanXuGqcgJKuYwbZXlduvg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(14060799003)(1800799024)(35042699022)(82310400026)(7416014)(36860700016)(376014)(13003099007)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(4143699003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ih4RVPnbBAO3g4PmXAKD01UEuLSVFMQYm8w6bv7IJmIG34lyKq1bo35qKe6Fd+5DXeJiMaKsGfuhOv3VhUZnSfp8v/cz/qaDUWgWC9nwYPrqsqQ3C0kWNFDmZYOMZkrY6F+YWnTZqpTBmwj0ORUsOE8DEsaZzAYQeLWdLEidpS0SOHvRfKHwX4+Z2ZfXV36z5acsHyaj2wh7vk1ELYyZJL/ga8zie3mIIUYLIUb7zjXZ/7a/6k3In3yVxp67baFt1fOIVfqTuWWWaryQvx2DKRChA4I73LWMmysriAELomnDV79bGqThdCND1YKUtcpWTz0efjlZfMp9rUgDHgs3nsae14dzcoh8hZYZop5c6MNVUT0rGuZGgFMgjkjwhoZVI6hhKfilIsVQmJkk/N3Dl3c3TdjdNBdcLDN7yXG72OPeCB+okCj0jzGEhu3C25zI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 16:16:49.5710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70638194-68dc-43e8-1a06-08dee28c799c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10658
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_091659_679015_727C3BF2 
X-CRM114-Status: GOOD (  28.90  )
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

Hi,

[Moved some already involved people to To. So they can help with the plan
details mentioned below.]

On 07/07/2026 2:17 pm, David Hildenbrand (Arm) wrote:
> [...]
> 
>>>
>>> typedef struct {
>>> 	pte_t __pte;
>>> } hw_pte_t;
>>>
>>> And then simply use
>>>
>>> hw_pte_t *hptep;
>> Make sense. So you have suggested to just hide put pte_t inside a structure
>> instead of complex structure of pointer. I've tried to implement and it reduces
>> churn enormously.
> 
> Right. And for most architectures we can probable leave both types be the same
> under the hood.
> 
> So we'd only have to convert common code first, and can then e.g., look into
> making architectures that care about the difference (e.g., arm64) actually have
> it be two separate types.
It makes a lot of sense.

Let's even divide the series into more parts as there are several places where
conversion is controversial. (Xi Yan had mentioned one example earlier in this
thread.) Most of those controversial conversions are pmd related. I propose
that we convert pte_t first, then pmd_t and others. It'll keep the number of
patches manageable and easier to review. 

I think wider agreement for this approach will be very helpful before I post the
actual code.

> 
> Just an idea to further reduce the churn and limit it only to core code (because
> I saw some very ugly stuff in some arch code that would make such a conversion
> harder).
> 
> [...]
> 
>>> Why do we need this and what would we use it for?
>> The idea was that there should be two different functions to read value. Let's
>> leave this out of the first initial series. It is complicating the original
>> proposal.
> 
> Right, let's leave that out for now. I'm currently working with Levi on an
> approach that tries to avoid the overhead due to READ_ONCE with folded page
> tables. [1]
So you are referring to page folding improvements. I also stumbled upon those
while doing a dirty implementation.

> 
> We're still struggling with some bits, but looks like we can make it fly and
> have it be fairly robust.
> 
> With that, maybe there is no reason left to have separate pXXp_get() vs.
> pXXp_get_once(). TBD :)
Yeah, I was reviewing that series earlier today. I've not looked deeply, but it
seems there are still a lot of cases where (mostly) pmd is getting dereferenced
directly. To complete the conversion, direct dereferences need to be converted
into an API. I've been thinking if there should be a dereference macro or we
must always use pmdp_get() even though it ensures ordering. It may add excessive 
ordering in some functions if pmdp_get() is getting called multiple times. But
storing its output in a tmp variable would solve this. 

Do you agree with converting all direct dereferences into pXXp_get()?

> 
> [1] https://lore.kernel.org/all/08ecabe9-0664-4aea-82fb-f9cb1739f762@kernel.org/
> 
> [...]
> 
>>>
>>> I'm still not sure about the _once() really, and if we need that right now. We
>>> survived without is so far, why do we need it now?
>> The idea is to convert all current pXXp_get() to pXXp_get_once() and convert raw
>> dereference to pXXp_get(). Let's keep this idea separate for the other work. Let's
>> discuss it later sometime again later.
> 
> Sounds good.

I've tried to do conversions already. Converting by call hierarchy wise is very
difficult and error prune.

Converting component by component (such as page walk, huge page) is also difficult
as code is tangled. Some helper which is getting used in one component is also used
in another component.

I see the following way forward:
* Add the new type
* Identify which functions need explicitly pointer to a stack variable. These
  must not be converted. These variables must be renamed to a common name. For
  pte_t pointers on stack some functions already use ptentp, which is unique name
  if we look at generic code. So ptentp would be used for all such variables.
* One commit per controversial change would be done at this point. We need new
  separate function for stack types. Also we can do more renaming to a name which
  will not be converted.
* Run Coccinelle script directory-by-directory which would ignore converting any
  ptentp (and similarly for other types). Coccinelle doesn't converts in some case
  (pte_t *a. *b) which can be done by hand at this point.
* Update any remaining functions

-- 
Thanks,
Usama


