Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC3AC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 10:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGtrKyD6HQnqKdFDtzSPzvJ8KhK1vb1Mo6i8fNxKpto=; b=RMlVqMH0vwiDrZ+rJSS4B3yi4K
	+tqJi72doxy3iYcbQsFgJXfl7dPdGkfL9Z3qJxvsVJxGX1PQmf/bXnhFz6yb2pkfeLuOLgCSmYrUw
	fANNocA85NSx5QgbM46zUAmniZ0JmDCrWwUdKM53rWcjaOC5sLYMcWXclm1qhmiYgWUbwjnYBKZx7
	ALnqdfWstiaO7I4+P/jpAUiD4t5m9MTdU/DfrVju4RpG1fvP1jxLZ0MtDaRnB4cm6hK67/4kU5tDH
	zVZM9MvnR2WSzz5xoC4khtEi3AYFM9rYupyYmbGQpRx4aD3ta1vECq+juNt+UPs3z0YVcXinZkp/y
	CyHjZObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujb6p-0000000ErSX-3TDO;
	Wed, 06 Aug 2025 10:10:59 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujb4L-0000000ErBL-24dA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 10:08:27 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ODZr8mSd1y1MciDtu7K5K7C+qGqykUlxS6VXuNBaNBpEddWFutVOBlE1UhLo2DjGqFak3hN3aKx22QBGO4L4I2olEwC1ypOfSuf8TyquO0/xoeLHnDcgUjLZmyyMZuOJGPWqZUye33iGScCl3aORNm7tom8KX4p3IttyNiX5+cfbIoLR4jdpjS4iuFoCyxmhXvsSJFJkGhUQbB1w9HELC2JWuLGYmDBmRwKek+vSV+KeLERz2KULef/GtmuywHq/FUQ6eOCC/4/a4HjWBteziTZK6E7x2tPFEqUs12AzOidDCNZfS4wVVw2FHq6dq/XEXnZXDLmzs9C9KzhDxE4dJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGtrKyD6HQnqKdFDtzSPzvJ8KhK1vb1Mo6i8fNxKpto=;
 b=XM1vMThsKUik6jHLMOdhdCayw7dZ/ZQ+tOK7O02IfP8HbMQklDEgEbckJpAsBLQqeVzFJj6ih71+qMHElf9309kd3L1XFNrxPcL5UW3Guf2SKXJGx8TS5Di6K2kSRSY2DMcgvLU4ZgAtJ05Dv8HEOiZdph9NUVdeuS+iiCUKnvlsdno7IZpmK/tDFxP5F1ttXQFB6CW5uM2tQK0lz5SdWFvBgOP44bQuYP9sDuuEYzbaeqrq4+oRfROaFfjiLy3tiADzjutSBUYvFAPAkz3KCG+yJHXl+dkEciRMUDazwsRfclFI3oFHj7W2f0XZzD9qkQN/T/QR25M4Kp3nCc/E8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGtrKyD6HQnqKdFDtzSPzvJ8KhK1vb1Mo6i8fNxKpto=;
 b=bHZWiwCLBgN7yX2kzNGtHo4ILgL8ZN6EGuogE/ek7aUCynT2KxhxlFuenxPW0eT0GBf7CREsNTWZ7DYpCB5/z1d1/ipsWdAmuomJKHPmx+bpmt+psQ6CVHHxJxGY8Tqf4wt9Q1exofLot+Z53L4UVWWVfPy2jCkbakWgbF93AM4=
Received: from AS4P190CA0055.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:656::19)
 by GV2PR08MB8725.eurprd08.prod.outlook.com (2603:10a6:150:b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 10:08:17 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:20b:656:cafe::c6) by AS4P190CA0055.outlook.office365.com
 (2603:10a6:20b:656::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Wed,
 6 Aug 2025 10:08:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Wed, 6 Aug 2025 10:08:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vw9clIHKussQbblIh5YYCD6EEIPALPJ+WqnYwjac7jw7Hs94uTmkUK5Ayky5gELvdODQx532eVfh1raKo+EGrfUzBl9Md+pdKMv0+gsWCPmxokI3J9O6LTwpqu3u9in5pb1zAa34r0rvte1rnzuJFyns2NYjMJuZ+CLlOcpAfOM8w/cnHOc9jdKY2h4Cbd24bnJ5lsk4UISi1ZL7Q+WkriVcQA8gRhDRb8EMq8wMA7+L0cqx1O60zX0OsQ5jAkOcpl8RhTMpejNPnK2KEIzJsnye0e+aPdFvByGWPzrlegH0Xy16FrmrOuFcbjuSNucv4ZIvpjc58eHvLXkh+4R7rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGtrKyD6HQnqKdFDtzSPzvJ8KhK1vb1Mo6i8fNxKpto=;
 b=MSNAqYYzv42l//MQVmahgfqyV0x8zqMKufh/Lt8lJ/JKaJ6wzedyGDPEaTgZO1CC4G6UloOL6JzVucbKLthw5AC27jhHD1VeUL0xBmwTzgwVPT1FKI6x5soTYeFbRZbYG2S1DFdxxVRIoF8X9/6ZYVUqG//7wqSd3wtAromNOLbAUi66by+BXWN3xh2URUaShVLPsbzGPVxHR1LpEIE3l02ZJUmKqvyMXh0FzXe7/nD83HWeGzFqnbaCa1eMtAsMM7PXDJ04UR+tMv0CT/6N3edbxCoeXe9lze2ECQklY2N6ppM1jQKRfBcZplSz4CEHOm0aBELV+Cy89V9baxpQQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGtrKyD6HQnqKdFDtzSPzvJ8KhK1vb1Mo6i8fNxKpto=;
 b=bHZWiwCLBgN7yX2kzNGtHo4ILgL8ZN6EGuogE/ek7aUCynT2KxhxlFuenxPW0eT0GBf7CREsNTWZ7DYpCB5/z1d1/ipsWdAmuomJKHPmx+bpmt+psQ6CVHHxJxGY8Tqf4wt9Q1exofLot+Z53L4UVWWVfPy2jCkbakWgbF93AM4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GVXPR08MB11182.eurprd08.prod.outlook.com (2603:10a6:150:1f7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 10:07:43 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 10:07:43 +0000
Message-ID: <8c0411e9-3e15-4c00-9f27-977f1754cb09@arm.com>
Date: Wed, 6 Aug 2025 15:37:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] mm: Optimize mprotect() by PTE batching
From: Dev Jain <dev.jain@arm.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 ryan.roberts@arm.com, willy@infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
 Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250718090244.21092-1-dev.jain@arm.com>
 <20250718090244.21092-7-dev.jain@arm.com>
 <7567c594-7588-49e0-8b09-2a591181b24d@redhat.com>
 <9552ddff-d778-4934-9349-37c7237cbb78@lucifer.local>
 <54ee1971-d91a-4fe6-90b8-16212c8568d1@redhat.com>
 <0d52d680-f3d3-454f-8c12-602f650469ab@arm.com>
 <9cbe9c6a-0013-4239-9347-bf5d43021fe3@lucifer.local>
 <1b3d4799-2a57-4f16-973b-82fc7b438862@arm.com>
Content-Language: en-US
In-Reply-To: <1b3d4799-2a57-4f16-973b-82fc7b438862@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::18) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB7120:EE_|GVXPR08MB11182:EE_|AM2PEPF0001C713:EE_|GV2PR08MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d38ee70-2c5b-42f9-b2bb-08ddd4d128d6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?VWZlQjYvZHFtV0UrT1pwdzdiSWNoSzhwa1oxbDhGWWRmeElBekVJYUlaOGRx?=
 =?utf-8?B?MW8vNlRLOFFFWnp1VTA1b0c1UklZbDJNMzlBd29iT3BiK2tIWjhOOGxFTEg0?=
 =?utf-8?B?QWFhdzFWdi92L0lmUUZiUndqbXFnNVNWOU1ZV01NaW90VHdoZ3VNUi91aGtK?=
 =?utf-8?B?cURpc2JaOG51MUNFWkRHZ05vaHRBcGJreGRPZVBaTmJneDZXL1lQb002Y252?=
 =?utf-8?B?dHd3RVdIempzb1dLdm16UWQ1YmYvNjZ5dGIzTGhkRlg0YUdwYU9pb2E2U3M4?=
 =?utf-8?B?bnNuOU02QmJzdERNOVp3R2cyTUhnQTZNcVJJcVovSGZwbW8wZTNvRkRFb0V1?=
 =?utf-8?B?cGs3c3B3SXBPdlgzWFNYWXJHbFFJRWFOWVFzMWd6U2RDTllOYlphcjk2dGlr?=
 =?utf-8?B?cTh3VUZlT2FSWmd0eGFJeml5ZGYyRW8wRFMvTFR0akhKWGZGY2hHSjZyYkx4?=
 =?utf-8?B?Ui8wNkFMYm1TNlhoTzcvQTlPUzk0NXBsSjhFWUNoQXU4akFTMm0yYjZWNXhp?=
 =?utf-8?B?SlcrSDRtbkVsOTdKeVIyaDVCbTdmTmREMld2THY1Y3dGVXBUd0FLdU9VQTM5?=
 =?utf-8?B?UjloUnlKc1l1UTE3T0dQWkVoVG1xMnl2NFNSTGFXcWdiYmFkd0hrZ09xaVgy?=
 =?utf-8?B?VHQ4cFF4ejU0RGFaWTRJMHZPNHpLWkpFY0cvb2tTaVZLT2VrT3RjalRNNGli?=
 =?utf-8?B?bG12TENsMmFmRFJXcEJZbjE0c1hMRTg0YkgrRm10WmNtT0JCOHAvL2hRanpq?=
 =?utf-8?B?M1B2VDJkTVg2SnNYOFlIbVhudHpGRTB3citJNUFVY1A5ckc4OHlEQnBHcnpZ?=
 =?utf-8?B?TVpGZFJtU200M3E2NmJqWDR6YmJrbm1DYitZd3JWWkgxb2dVM1Z4bDk0VDJQ?=
 =?utf-8?B?TCtVTHd6ZjRtdnBDSVVSbzFCV2JVK29WYUlmMUxZZWJEYlFFRE9PWEF4MmNR?=
 =?utf-8?B?NFVpQTJ1WThQMXRZWFVKam51cFhJdXJvcHdHeDdxZHZ3V3VvY3RuOU1KWGZr?=
 =?utf-8?B?RDNuSFdZZEJFUloyRzVYWHpuTnY4VkI1cTRLeG01S1JZOHFGRkVOMWVja3Vy?=
 =?utf-8?B?dGRaQXZHRGd5OU9weTF6ZTlIU1crY0l4ZTBoYzkwUUFkZ293NGxuUWdncjZa?=
 =?utf-8?B?NnF6ZzJxMlA4bEc2RWZUbnVGdUxaQ0VFQkRtVktsNFJ3amFYdjR4Rm9zTERM?=
 =?utf-8?B?WDdmWjQ5Y0ZBN0NlSmNZb1lJbW9UVWhHdVdaVjd5ckN6WDFmaU9hMVhuYVVR?=
 =?utf-8?B?SlNwZzFJL0lhTVhzVS9WL09wdWNCY2VoL1RHNXlIcjRSRkY0MFRSRHk2czZ0?=
 =?utf-8?B?dkg0bVZXVnBQbWJsek40Y0w5MGZmcEtZL0sxS1ExOGw3QURJZkRHaDhxMnFi?=
 =?utf-8?B?d0JiQVdheTExNFM4MFBSNWtJOW9JS0ZhaG9MNzFMREdhOUtEc0RQWVh1dktM?=
 =?utf-8?B?K1pEb09LS3dJdnBPNWliaEx5bk1nOUh4TGRLRzltaUNxVzBWOUdiLzkxdFFP?=
 =?utf-8?B?d2s5djZjTGsxWExCczJNdCtrbkU1ckZ6R1hFcUlHMXBHOEtXODgxOUZzOWhk?=
 =?utf-8?B?SkQvY3VVUTVHMDlLUUgwWmE5aWN4VWlEempaYXEzV2xhU0MwTkE4ZGI5cXdD?=
 =?utf-8?B?KzNCMUNIQlFnRnY5bi9tYnBTMUxaTEU0a1J3N3IwSVhxOVZtWjBTNUt3anZt?=
 =?utf-8?B?RWpoNDhlbW5SVkxpZEMyOXA3d05XdFk4UloxR1cyM0FkV2RCaTdOMjhiQnFn?=
 =?utf-8?B?MFlpY0FVZGZ6WHkxbmk5Y3J1QWNaWE14UTR1b2xhRFo0OCtaU2Y4U0hlWDZp?=
 =?utf-8?B?aVlJdHBHaHpJTnpudEFkMm5qR2xsZkxGUFRIa0kyc3pSYnFrSTNaY3VBRVFF?=
 =?utf-8?B?aDdYRTMwK0pBWHpBT0NrRlErUmp1VFptb1FHV0JUTjlid2hNcWphUXZjSDNH?=
 =?utf-8?Q?A5SU62jYp8s=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11182
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6af13a4a-718d-4831-e82d-08ddd4d11549
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1NuM0lBdXMzTjk2dnZ0eE1ISG4wWWkwSHNQMHI5aVk1ZGQ2dllTMi9BMVZR?=
 =?utf-8?B?cHhDZlAwK3lKTWJORWhZVUpaUlZnTk1lUXNKNWZaSm9OYmIwMEpQTEZ4VHhH?=
 =?utf-8?B?emdpWCtGaUtobUtqZDY0aGpFcGVIdWpDVENjTVZZTVNrMkZOUitPTDNRME03?=
 =?utf-8?B?QW9yZnFscGpNMjBFVWlKcS9uaDZSaFFqTlhGVlgydllDelpEenMzTThYVU1F?=
 =?utf-8?B?L0dTOGRLaUZMV2V3dlVxM2p1U1VmV3c3Tmp1SUJWS1BnS3lvdUxMYVgwc1RB?=
 =?utf-8?B?VTRxRjBDT21zaHZEVmdlSXRrQU0yZjBCQ05JQ0RTYk5LNStGRnA1VEx2b1dt?=
 =?utf-8?B?Uk54Zk5COE5RdEpDa2taTEJaSjdVT0pZeXBZbFZacHZxUUtmZ1V4QUpjTzlM?=
 =?utf-8?B?Vkl4N0FZOWlySDRKZ1prbEwwSGNMdUdaQmhjMnBKQzc4RnpSaVhWNitURFNz?=
 =?utf-8?B?Wm5SS1prcVFBYnZLU2NzQW94NnJid1FYMC96amtsY01COEdiWC82OXJESUUz?=
 =?utf-8?B?WUlsL3lkRHBEWnFDb1ZZLzBoYmFodnZ4YUoyTVRBV012bVJPZnJ3YWVrdTIv?=
 =?utf-8?B?dU5LdVZkZGs1S3NCKy82YXhhOFJmL1hQeWR1Uzc2WWxLQW9ydVlNdmVOK1Y5?=
 =?utf-8?B?dXB6WDRQb04yRGpLY0hTVHh6L2t5WVhucnBpUFRjOUMyMzMvZkR4TmFlbnN2?=
 =?utf-8?B?SXdnVUtYRXU2YVhmMUZzbDVVY0IzREtVUThjV3pheUIxSGlCRmdnZVJtalpp?=
 =?utf-8?B?T201UGN6WUpuSWhHYk5BWFVRL2ZWY2cwZzFWa21LdXAxZXRwTklwKy9pS0lv?=
 =?utf-8?B?UDRQMmVKSFVKdTMySVNqVGt1Tm5OcGpzanN5d2JhWkFJbFZtTHFUSUtoZ1hJ?=
 =?utf-8?B?TTNjei83YmNjYktDSk5OVFpzczMvNWQ0REVBVnljNnRsWjlzRWo4WU8yQWN5?=
 =?utf-8?B?V2QyVDdpSWE3cWpqRzlZU05Pd2g4bWJCUC9ERGVmRWNQckNONVN0bDUrMUFT?=
 =?utf-8?B?N0JVR1pFNzh6TXNnUVpKRFVKUmdVdHBqUWZ6OEFFZ1pxZ2I3Tk9QSzVhM0cr?=
 =?utf-8?B?ZVhJbFNBYXdHdEwyVnFhSFdlMkdHQkFyS0NoMURFNm5Sai96UDc1T1ZrQ3pR?=
 =?utf-8?B?TjRDanovRGo5OWhFTXVxR2hwQ3FQdTZlWkp5Z09KWXZTK2x0MzBQY21pYkUr?=
 =?utf-8?B?c05lR3V0eVdXbjRyV3dvb3ZJbmtkK04yaFRZWi9wN3RyclFDL0MvTEF2cjJn?=
 =?utf-8?B?TVhUbzVjRnRic1BxOVpneXl0cHkrdDljM2RXQ2krcEJNdkJoM25sdWJwVlpB?=
 =?utf-8?B?Uk9VWFo3RERGTUZHWnlNNzhqYXF3eUJtdkF6dDJLOG5LcFM2Q0tXc3h6QUp3?=
 =?utf-8?B?WWVLdUlPcHdyVzhrVHppZmJXd0o0VGJ6ckZobEFtWXUwOTdSRjYrOGxNNFNn?=
 =?utf-8?B?aTV3cVAvYUVtRkcwV2VIV2NTL0lmelliWWt6OUNSWDVNUG1IcWJPRzlPekF1?=
 =?utf-8?B?OTBRY09hNjRFcHRwM0ZRVDlDZmNKcEpxSEJaenhVekJ1OWVERkUydE1Ba3Jp?=
 =?utf-8?B?S3NCV3JhZWJYZFBpaFFEWHB3UjJjcVRYMzJGVW9MYUhyejluaWVmZHpPd3Bz?=
 =?utf-8?B?TG1LS1R3K0FqYW5nYVhDMnl2MVBCa0dKNHRtMDFNZU9ZbFR3ZW9vSXl4OFVD?=
 =?utf-8?B?SUJvcThCb213RXFGUGM0djdyVHUvN1lyWm1wOFBiekFjdTdVL1RnVmtZOXFR?=
 =?utf-8?B?RUJjT2x2dldqS25kL3p0elVsb2JraXNPdG56RHZBc1E1TjFsd2daek9QWDRr?=
 =?utf-8?B?TW5ycTJSeUFvQnVNTWtIWlBncCsrNlptSGF4UzduVUMwc0FpL3NzNytOcXM5?=
 =?utf-8?B?K0ZZNUNEZUtqN2FraCtmbXNrOWd2aFR0SFM1dHZpamc5c0lReHN3clVpZXlQ?=
 =?utf-8?B?aGxUMUZHWVB5N0o3Vjd1cGppMDMxdEhlSWovSStoSHA0b2VsYWhhYXA1RWFR?=
 =?utf-8?B?TjJpLzlkUDZSc3hob0ZmUzhzUHI5YUFib2NNY1JZRTNPTGp6dnV2d1BHUkhR?=
 =?utf-8?Q?g28v2K?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(35042699022)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 10:08:15.3991
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d38ee70-2c5b-42f9-b2bb-08ddd4d128d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_030825_537859_F803F501 
X-CRM114-Status: UNSURE (   4.39  )
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

No idea why Thunderbird decides to send an HTML email whenever

I copy code into it. Will fix this for future once and for all.



