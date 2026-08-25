Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD483C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 12:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Cc:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CJxr107urhR95h2zmkGZUDCGPKHrk9OlgpOCluStOvs=; b=BxkUNGXa2e6OrTqp/rsWWiSZ1x
	lcqpplo3qFyK5DLOHjCy0CSOXjj+O4pVuei6CXMHIJgc8pI7tIPngFkeriB06UpzyN/LKd4JQ/Dwp
	CYgW6uqOKXA5hpWL+6vgsnyh/PRIiXbUrcZCWvug95KPUN8npwUe2s8Hl8qfSs1d0/RTvm7bnwoTf
	J7QkSu15VVgjFDZ1OJoDUOJ8zs4u2fSqFoPODYvpO0HZ0ctpYlvQMciu711NVGditywHMGZV0AQtk
	gJaGrr0GB5uqFUYynPKBl3Nz54zJPHYlNJ6ZlMhbUojdgHOgjYCxgEBJLmC2AwMrnOksgPx/Ok2XR
	vsOzibfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypx8-00000000jHk-2b7I;
	Tue, 25 Aug 2026 12:08:30 +0000
Received: from mail-northeuropeazon11010013.outbound.protection.outlook.com ([52.101.84.13] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypx5-00000000jHG-0s6P
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 12:08:29 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iPll+5QmD7M3F2JLCLhHwAyTOGwRZ8I1eTRrFdkZ5Bb1I1u+ovC3aNQXa88vVd8GFz7/EjAXvPjcAWLSxo53MINz9TeuKoLYwYerPB2pTwHNLf8Mk3qItQE9itAVyu+a2UWJacm28aNcUxeFAglV1XKMEoEEaCvq5FLZqT1ZpUoDuz+XYnQBp56EG/drFfwnPYZJc9PSMWm+qTs3DrO/s1TkxIC2hgjyVTUJoIc6GlvEvePDP6FVRXVyjNO6iMcEKu5yGEx92NxBx0JrYgCyy1HS2dpss5hvWQvRrV6CMpKvVlvlzQ8zJ48GrauOruHU8YgfwNJrzsC/3DgYP+ixsA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJxr107urhR95h2zmkGZUDCGPKHrk9OlgpOCluStOvs=;
 b=AOvCi9w0LE+LDFUQJsO9ey7uG5/dbfyqqNipq+bA16nav/wjszQoGwmDQzLun+KE2aJAgHaBq/e5oT5gpkiXaQWnG740pVyRTIVCxo7m4S72F1RELf3ejud3gqYsvyh18hzVvLcM6OMoxcSfKqkoHZJ2wUZ/gCei05MHqnnZxM4jwY0t6djpYi1fTnhkR78U1b9Dg0LFfAE+8eoqF9c5PNCceWlhrKmTBkJK92hnx0ZAeNrD1cb7ofnvTFMp6hs9eVjhMF/p+lOJfsShJyaN+TV0MY5OhaRNVc7V7Ly+wXigHkUl91UVAoS88TmfK/glHUXaCt4g8hSBh4HryeonVA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJxr107urhR95h2zmkGZUDCGPKHrk9OlgpOCluStOvs=;
 b=ifxzPsqlt3fcGyZbfo6rtXeIznLo7tpioB1IaPtAuAtaDYESUhfh3YjicdnXgGXj/27vgoL6y39J401Kwd4hJwZ4/6v68LNE+eVTXrF6YYDKOUU7gcMhHqoP4ui5hCX/n5UtHgykonvZ/q9BLgBwYvoROInqkTfekwzJBHcGk8g=
Received: from DB8PR06CA0051.eurprd06.prod.outlook.com (2603:10a6:10:120::25)
 by FRWPR08MB11614.eurprd08.prod.outlook.com (2603:10a6:d10:1b0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 12:08:17 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::38) by DB8PR06CA0051.outlook.office365.com
 (2603:10a6:10:120::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 12:08:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Tue, 25 Aug 2026 12:08:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JekVKClUGNhVkLqhYY90jrEgmhpe0EDtY5z4v01LWa4rvZIRjchUvRshRziyhbftk0Qc08D0LFGwx+irOKQd+diDlJDWHCZKCmmbb3PqnGaMyCavtXKHPtDdwCH04KDyX6wXohMkpkyfcP0BsK2XfFJcRu2kNwNCrk1Z0hybsmAX/aJ5E54MHaHhzUZoES4mtcv65iT/wIh7YfU8DuygJ8CvFI1u0J2A2H1YkqNCjzOlooGakib8eAzoDxITwEAQ1LppXFhrdnY4jvKb9FUrOqmL38wdBqcg4tKWBgv1CKlLmVr8ofAY7eOkaEFB0hZPk73x9t7IzP8pIaCijx3QdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJxr107urhR95h2zmkGZUDCGPKHrk9OlgpOCluStOvs=;
 b=GEzegFb5DjQ2GZOZK16Bxnms9f8u4vBJ+kRVF6gPwSeh2Yb91zMv1YEo/GMrKCT0v19E+MP+0uP8bOLY2U2h9MXGoWUZeRUdvcrxzkfV8FuXamPUZMdkKXfsZz9NOzJP8rKYRBVFIp+J0WbUtRMDKEHrkwovpalpJEZWQbgy/YKvXThsBK/FGtWviYfjDY7BACq+UI7lekXSOmpJB60z5bFyhavAjR8VYpbH0NLtdKRJIFnv7n0OdXLqSwOYsspQ3i5V++qT4rRrdRnNfbojhjq5it0zZfFEtMGuDzBcjjcx4x4C8RZ5UMXfnx/w2clgYq4FCSHWH/H5LUlkF4R7+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CJxr107urhR95h2zmkGZUDCGPKHrk9OlgpOCluStOvs=;
 b=ifxzPsqlt3fcGyZbfo6rtXeIznLo7tpioB1IaPtAuAtaDYESUhfh3YjicdnXgGXj/27vgoL6y39J401Kwd4hJwZ4/6v68LNE+eVTXrF6YYDKOUU7gcMhHqoP4ui5hCX/n5UtHgykonvZ/q9BLgBwYvoROInqkTfekwzJBHcGk8g=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com (2603:10a6:803:80::16)
 by PR3PR08MB5657.eurprd08.prod.outlook.com (2603:10a6:102:87::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 12:07:43 +0000
Received: from VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4]) by VI1PR08MB3421.eurprd08.prod.outlook.com
 ([fe80::e079:6bd:fbe0:89b4%3]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 12:07:42 +0000
Message-ID: <98e9ac67-7df3-4c0a-8814-37e196d94020@arm.com>
Date: Tue, 25 Aug 2026 13:07:41 +0100
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:BPF [GENERAL] (Safe Dynamic Programs and Tools)"
 <bpf@vger.kernel.org>,
 "open list:MEMORY MANAGEMENT - CORE" <linux-mm@kvack.org>
Subject: Re: [PATCH 4/7] maccess: Use a scoped guard for page faults
To: "David Hildenbrand (Arm)" <david@kernel.org>
References: <20260824160523.3907021-1-usama.anjum@arm.com>
 <20260824160523.3907021-5-usama.anjum@arm.com>
 <79daa73b-0d34-4e84-8450-56f90bc700d4@kernel.org>
From: Muhammad Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <79daa73b-0d34-4e84-8450-56f90bc700d4@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO0P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::9) To VI1PR08MB3421.eurprd08.prod.outlook.com
 (2603:10a6:803:80::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI1PR08MB3421:EE_|PR3PR08MB5657:EE_|DB5PEPF00014B98:EE_|FRWPR08MB11614:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c365563-0253-4063-185b-08df02a18bba
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|1800799024|7416014|366016|376014|56012099006|10067099003|3023799007|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info-Original: Fl6F7jlnhyV5ZtWQtFxUBDrRXyya+l3sY9bS8tS1atDEJMyj6KqsYWPaA5aK8P6saeWLak8CZFfTjHMU2P6LDpYAh5jlEwHbPeshI2u0TF8nxS70wz7JhXZ2mK6BAvp5EkJdGZXdGQGfjIRE407KQtjRV8QNC+DSC8z23MQoDef4Ij5KibmFpydMMLQwCscnHwMjYawjDZK0MvamRRPEX4/ef8iEuT56mOFcq37fXEQ3UEToaxcjeD/72aFBwl51cnMBqzO61kyNfAiIIt4HfzRE/idY/ZlFNxsJaqvmyVl3J1IplzTMzHSyQ6QeCi4KpuQr8qWC5cVdky/QhNo7pqV//QvCFDcVRMiuNxLprmz8D+Cw1QkCOt3TjxlLqLpOUYiHmq0qxyfNMhmjDlRBGQVe5FV/kILp783U3BMo9xRskbteiOpAYqDf3aVlW14ARcXYZ4qTcLHuvP5v5vFh2wft5dOVceQ5pWZ5j8tMUJA9f3AG/x4yEEUOSu+4N/+44X3V87/3JzCIs1bY32U5Kc1RuAvA5Gui5zqTifH2smD/1Fc5GbSau0NzHWn83u37DdrTWYze8eAlhjNWcs+OmgyS9/FJmiaqqPf+F7Ev26K0jKGXn+GJGgHj+OZzcI0ARL2yJCyx/kaYkpJfi/gVKGbgolZT7os0c5uQw0rtgHk=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(366016)(376014)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: OKZvUrzGjQJi42GYKbHdS33jUCIzTZPZCd82Nwj3ZgO1PF2QmOWLdTGgsj1Q95Ko/rH/XZBI6Qul7MGg4QFHCnRKjd9alOPsnybcxI3jtDrAI+mvbgH87w1gaSU2GPlFxKc0dO1inQUc1uNUI/iQUu65Go3atJkfj/2XaiFxgjUEqlSjOzN7nQVRVjnEh223iDx8LRy8RCpmzwVPD0dM8K9zHxm4Xpgb99M/kihW12A5Qe690PnNYkUWnfdDhZXfut0FXeW1NILLyMP5YLWiAwkSMTwkZse01al+/S084KmAOt1Zt8+y/nTbUvBk5UNzwUDeKapkmon/qXQOLik8AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5657
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7f9c7558-ef8c-4396-9cc0-08df02a17771
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|36860700016|14060799003|82310400026|35042699022|1800799024|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 0MhHkPephN2hNRL8phRv/3HTm0J7USN5+k+1HDDMI51lapOpv0kk8tKbKphpvXy1WI2CmWYKGlj+dJJL6Sr+lfuYeYAolvdupOG4i397u5SM3xCdidfEs76QZED6K2X2BctWuOqmpVx/ekcU7E4Mkg+mCRKCxsk0Q4anxgzYi+fN91BQoKit0YLk7rGQ6e5wDIJLzo2xbqO1phJvE+JsJamlLKYRUnXzGuzYwkd8yDGp/WWHjPbQdIwXVOHi1VVcqy8jwhXw4OHRh1Ws2i2a+7eKUwoPNOpBYip1M064hBCW188x1nP6GTLMJjIB/RLebL3+Bc9eid+mWIGsxKL0Rh8UWoJu5kUtxWBZb3ZnAIj7gL4cQNoWGTeBUr04C6cKKlqGzRONrewTZbxJPGFsp/Q5vnIxHxMwfvMAoIYQokxc4+TB30tFNIfbhdYsT6tNEE4LE9LkBq+M/OYzG1tB5U020mKlMUjHedPutgRv6J4w/a8q218k48nRDwtYvPYee1PRGNwt1EdNuKRDmyEWkITo1l/Ev7VkK4Tt270zUOhsuVEKyzzUvW1seDpt7G5IhRpn094nmpXdWBa60vsdBiEXgIKwpz2Yo5dJPLYw9QGO0nktKXEeNXe8UDOgYQXXuTnKXEYCFMKZia3KZklEbRYyA/uA18G3qrUXNyY7mlqOWtWyARhsRXPbjOii/TmkZVSrGnyQ6M0sveXoUXq3vQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(36860700016)(14060799003)(82310400026)(35042699022)(1800799024)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2Rc5IdJPdMAYMTydTgGWN8FAzdTO/ZyLGh7Tq3GIUfqqq2mEuVRg28QWMtX7sYleaPH9iM5+6agKUQXrQh7otUV/VsoTyxYIR1zzewGdJpdOyALbODxPpyM9D3AelaQHLmA6BX1N1mJ6ZH+zoYv1IcRSwKci4Cy2BxyX3KmcD+VawOFa1pyLuxARpwqWeyAlzqr7AJO0OwFB6IkDQJyYDqBDjKrzr3hRR6W7aT9TbRznOLFWZl8EZXhXds4eQtuiaB+ptUS7pWgjlbPYWOwFsYR2S12WMoyM6Li8S8ibwnTt+kXt6jP7J0hdyYXFZbodeofhyM4q3Ki4Ja/b8XK1ESt4yJR9FPe2YQ8jdp18+5kWXciOOMoaGN1kCfNQjN98b4uFYKT73ZN0t5e4NPskSCjtbcea8fndqUWMGINrerwjcpVTkV3cpF10B3e2u219
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 12:08:16.6063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c365563-0253-4063-185b-08df02a18bba
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR08MB11614
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_050827_425459_19061C94 
X-CRM114-Status: GOOD (  15.48  )
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

On 25/08/2026 11:36 am, David Hildenbrand (Arm) wrote:
> On 8/24/26 18:04, Muhammad Usama Anjum wrote:
>> Kernel nofault copy and string paths open-code page-fault disable and
>> enable around label-based loops, duplicating cleanup on success and
>> failure.
>>
>> Use a page-fault scope guard instead. Leaving the scope now re-enables
>> page faults on both paths without separate cleanup at the fault label.
>>
>> No functional change.
>>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
>> ---
>>  mm/maccess.c | 53 +++++++++++++++++++++++++---------------------------
>>  1 file changed, 25 insertions(+), 28 deletions(-)
>>
>> diff --git a/mm/maccess.c b/mm/maccess.c
>> index c59a0e092d24a..f695ceefe6fcc 100644
>> --- a/mm/maccess.c
>> +++ b/mm/maccess.c
>> @@ -38,18 +38,17 @@ long copy_from_kernel_nofault(void *dst, const void *src, size_t size)
>>  	if (!size)
>>  		return 0;
>>  
>> -	pagefault_disable();
>> -	if (!(align & 7))
>> -		copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
>> -	if (!(align & 3))
>> -		copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
>> -	if (!(align & 1))
>> -		copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
>> -	copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
>> -	pagefault_enable();
>> +	scoped_guard(pagefault) {
>> +		if (!(align & 7))
>> +			copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
>> +		if (!(align & 3))
>> +			copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
>> +		if (!(align & 1))
>> +			copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
>> +		copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
>> +	}
> 
> While I understand what pagefault_disable+pagefault_enable does, it is
> completely unclear what scoped_guard(pagefault) does.
> 
> Should this be scoped_guard(disabled_pagefaults) or sth like that?
> 

The `pagefault` guard is already defined in `include/linux/uaccess.h`:

  DEFINE_LOCK_GUARD_0(pagefault, pagefault_disable(), pagefault_enable())

Most users use `guard(pagefault)()`, which calls `pagefault_disable()`
in the start and `pagefault_enable()` when the enclosing scope is left.
In case of guard, the scope ends at function exit. scopped_guard() on the
other hand defines the scope with {} (probably called code block).

Use of scoped_guard makes patch 5/7 straightforward:
`scoped_guard(__kernel_nofault_bare)` is nested inside the pagefault
scope.

-- 
Thanks,
Usama

