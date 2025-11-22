Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C876ACFC52A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 12:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agytxIOh6c1vmJxDJRglH/KtRhiBeDpTW45qVV5XBeE=; b=LxncC/TrIDxPreMyZnOohs4BCn
	Cayc0D5Hy8ZNjZMZ2+k4IjhtL43dDWU6mgihw4ZNIiqSzBytxohyFXxYrMtfA0uqmRnSO9dAfXrOL
	lT/3xSSru0P5ZeECG6ZVFanGZC9/U4aO17MQquxqAZNnxB2WurLO0REX0wcyfAP4NlGSGy2bRE29e
	pTS1S/acvxGgLqyRgJ6Wb+d054udItVV46imIw38YOq9APTT9b6YsI9lB08ix2RQJWFOTzK9WRXkP
	yTkIdRyf4q1tcekZJdROAGV5q2Lyyuc1K6i9F1CiF+b/Dr9vZPAAUAUEnneSDdqRRslaikWkspaBA
	pG3etYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMmMU-00000009XBJ-0YOC;
	Sat, 22 Nov 2025 12:05:06 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMmMR-00000009XAp-1O5X
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 12:05:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9hRc6JwyJrOsCDUTY3e51ocs2WWekXaFO2KjJ0EDKfczIFgXqJwPKHUoAEix76spD5dnsmP86RBWWB+Ao4gaUR1fYuU7yF/8qJIyAhmAPOyVhBQ+QTY5BySWG+SGe+ZWGJY4Zv+ndrvVD572fiZA7Eqq51MKtwaQyuO2ffEM+5+ue/fqoXBhvZGItk9AEUBD+tOQaWy7OVpbA1my4uCvnU/Yrlxg9mdCnIy37nHQRjjDoL8T1Pnxlq3al+cvIgQ6DNKiKetbOM0iqKrd24jDdxP07JbtE5OxlzfTyE4A2XkOx2FbiOT1d/E1CtksaIGkpFzN6pWiftYqxGOY+QMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agytxIOh6c1vmJxDJRglH/KtRhiBeDpTW45qVV5XBeE=;
 b=w9BW7lJ0rsVEzZLdTBWcPNafS/57fS4+b8vUbJ4+RCSI0moQIrSl6Otr2JQARqRhpENl6ttZfkbBoYXAzOxBdeKabVnmvqJVEN72qoCJXgjiRhfpiqkBCoT6ksNNwfgqbXhsa8XCHO4G1Yzb/8LS8xXKmcHgDWdbMTZ7XaWvyr20Z58l0X5qcPdbVZyQPGrqCMvHeUKGVkvbas4kvqkP7FbDwZLJreaH8XFA8BHeom1k8VCybah0QpYiTpZYnWSPxT1hGE6EwXVJq6PoS9Egw8WKAH3kseV0EMAajjXlKSwE/74oIBo5e3Cj4WWay5/9aaZdTg6ze32knvY24gnzJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agytxIOh6c1vmJxDJRglH/KtRhiBeDpTW45qVV5XBeE=;
 b=Ly13kPU7fB7SP/c+I87lMePsp/4vzo1Crm5ytyUblpuujedn7cpKqqM+DIlJFUJsU2EiYJJADLmHdZGuX66pNiK1XNkwtIisZ2/vHYEN+47sr8497THl6aDLAByd2xjmpQt+meYEEQ9PBvzBi/fC3KNayzziFwlqWdMUtA+cER7gHJcxPiH8bj5G3o7msWgTLU1U1gyVrbsMRUUdzhb1Jk/Vzo9evWpUMeBFKVWBoDb+Hb8/7C94oTcqbRpe1rCyvByA/462i96auEvATVB39i0dOP5eY/J036zoBW1IRG4JPNGdWfCcGu0qCDWBovBI697zCkAC4KgIPbegjSScLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY1PR12MB9676.namprd12.prod.outlook.com (2603:10b6:930:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.14; Sat, 22 Nov
 2025 12:04:58 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 12:04:58 +0000
Message-ID: <9ab7f5c8-a2fd-497b-a32e-4def84e0be26@nvidia.com>
Date: Sat, 22 Nov 2025 23:04:54 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory: restrict __GFP_ZEROTAGS to HW tagging
 architectures
To: Catalin Marinas <catalin.marinas@arm.com>,
 "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>
Cc: Jan Polensky <japo@linux.ibm.com>, akpm@linux-foundation.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, will@kernel.org
References: <20251031170133.280742-1-catalin.marinas@arm.com>
 <20251109003613.1461433-1-japo@linux.ibm.com>
 <690ce196-58cb-4252-ab72-967e1e1574cf@gmail.com>
 <aRG05VS-IIxV2y_C@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <fbca7868-6f68-4b98-a2f2-e39eb46b7f12@gmail.com> <aRIEkLw7BofLjOWs@arm.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <aRIEkLw7BofLjOWs@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0056.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::33) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY1PR12MB9676:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c00c393-d6bc-4cfb-6a55-08de29bf5b40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDExQ3ptdGxMQnloMllRdlV4cTIvcVVmNGs0ZWphdWZWOXgrVnJZbzFhdXVZ?=
 =?utf-8?B?RmZ1VGtZeE43NGhBT3RRYng2TTZ2ZVNzaVVlUzJKay9KalpWMTluRG1teDlt?=
 =?utf-8?B?eEpuTUF4eXJUVkRwZkF0Z1hWKzQrL0JTVlZJNnExU1duSHVFM1dqcHpkbG0v?=
 =?utf-8?B?czM4dEg5aDZ6eWZQSzlCby81V1p4Tk5YZERTa1BTUGJySHlFOG1vMkN3ckda?=
 =?utf-8?B?ekZjaVYzb1Y4S2RLa2tKd2FXZWRkTks1UGxoVUFzdlhxMjdlZGc1TWV0UzBo?=
 =?utf-8?B?N1pUdVZFd3Z1SWZWcWVVZW5wbHEzTWdvTGVtN0t6dmM3M2E3TXk2VUpjNVZw?=
 =?utf-8?B?MzkwaU52eFRUcDMxam9CbDZ0S2hVMlduaTVneVdpM21jTkdEZmxKL01rQWdP?=
 =?utf-8?B?aWl5MDRITUdTZjNLdkJQU1FzY2VNczRjTUY5dVV0eW8vbHBjSzYzVldRRVBH?=
 =?utf-8?B?LzlSOUtDbkJIWlVDZlN2bHNlOHFqTVhDcG0yY2VMZWVhdk9QUk9wM1lYcWJB?=
 =?utf-8?B?L04wd0JiSXFobmRiZ1dLb3VTNzk0YTlvb0psYzFXTmJjM1pRUW12eU83VTF1?=
 =?utf-8?B?V2hSMlViU05oNHRGS3NXTlQ2M3JSYnBuQmZZaXVlSXBPWVJnc08xUS9JaXhR?=
 =?utf-8?B?QTU4SlhIOGpFU1ZZcEtXR3N1UEp0VFVSaHJPZlE5dDZVTStmc3k5emlPRith?=
 =?utf-8?B?UVNFeTltRlgzODBTR01qSEpERkJrL3VNRmNPaGNsdVlnMmZpelRJSVhXYkwy?=
 =?utf-8?B?TEwrTjRxSlBXQ0VSK0JpVURHTzFhWHFrVThuT2tFMS9rNmpHUVltdlVWNUVR?=
 =?utf-8?B?WlMyYnFBNEkyUUZiMmV0ejBaM1NZN002N2U2UDl2by9VK1IxTTNFdnVMb201?=
 =?utf-8?B?by9Zc0RFUndyVTJLWUlHb1A2WDFQNGtBUUJxNE5WclJkWWFmeHA4ZXl0eVpX?=
 =?utf-8?B?cHBUamdValhhUVdtblA5OFJZa1FoSzEzYlhxYi82VElsallUR1BuRFpyMzhJ?=
 =?utf-8?B?TFRUOFEvU05DQmlDVkc5cUVwVnRjR3lobGVWellmSFFQQkNTNkhzQWxET2FU?=
 =?utf-8?B?Rkt6UUg2R1VZSVBxRXZMRXg4VTNMOWFUUVZodjlWK3FEdjJGM0NjZUorK2dp?=
 =?utf-8?B?d3A4L05VZnRBUEtBU25JcTZVMyt2VzlUTDkyOHQ2WE5DWHJqMGtIQzdDZ1Fa?=
 =?utf-8?B?Ry9hNkJaQ2twWW5wMmliVGdlNkh5b092QUExbEx3WjNjZUxCWkpGdzNCaytT?=
 =?utf-8?B?SFVubWJLSUFmQncwN0ZFcE8rMGhocEFYbVltZ1VWRTVJakZ3YVMvTDZiQUYv?=
 =?utf-8?B?Uys1TzZGYTR6U25zV0hwMkhsd1FXRFZET0JDYS9kOERvM3c3YXlNeEZ3NURq?=
 =?utf-8?B?dGFxcTM0cVFuVUNLaDRFUkh4NEp2Q3ZubythY2lSVG1ML3NqT21UZUZvcGtC?=
 =?utf-8?B?dTRFRjFFVzR3MHRKWCtiWHdObmhaNUpVNFNFQTZISmtMNUphcmh6cDNHNWtQ?=
 =?utf-8?B?UFRObnlzQzk1VXM4S0VDdk5iMlg1cnVmMlJCaUhqc0ZCQVNGY3NxczRocUFi?=
 =?utf-8?B?b3J6NVUrWXVVWkczRUM1alJLb1c0U3hpaGZySVVpODdWMmFrZXF6MGxGb1BY?=
 =?utf-8?B?blZzME0yU0F6Mk9NeWRsdXJTMHJGcXdXRkNhcGlWWjdxSmtJcm9aYXVBYU1s?=
 =?utf-8?B?enVwMVZHL1U2NWxSUXl5WGJ4VzkvYUNjU3BzZzZTTlA1T3orWm5CUXROeDh3?=
 =?utf-8?B?dVE1RHNaWkhrVmZOMmM5bmZFbFpWSVE4MkNTOTdpcGpzck00SzU0MHFDWFZl?=
 =?utf-8?B?blgxSmlsc29DL0x5VlBUWW9tczRRQ3BrZGx4WWJRaFZIc1JtazlHdjF1enZo?=
 =?utf-8?B?MzJ1cTlkdnBIN0tJRC9BUWdpTUgyU3RMOFg2eG1HUVRzdENxRWtjeDN3TytJ?=
 =?utf-8?B?cytTa2FXNFJCb1VIampDTFd5WnBpbXptRTBpMTM3SVFZZURzbUIxMTFzWnJV?=
 =?utf-8?B?N2d1SFkyNUlBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjBrZkYwdHZrS3NwbFZvNFNJMXhZSmhlM1QzYzRhOW1VRHVUQVVQeGFWdEwr?=
 =?utf-8?B?NmZGa1RCMHpYMG9aYlpPalBKU1IxcEZ0ZXoyZFVSMnkxanhUb0pYWjdiUCtV?=
 =?utf-8?B?VTlwVjV0VFpNVnl5eEdyc2JlWFg5aGpaaFlzYmwybHYzOHFaMmJiMHAvNXVh?=
 =?utf-8?B?ejJuYW9VUnN0TVUvcDQwWktpTFhMOFhMeGxnUVNMRXB0VitGVXhxbDN5MGFF?=
 =?utf-8?B?OVJRQnA2ODVXRmtBVFJpZDVxVGNlYVRLMTFQVFRDYkJZa0xhUm1RWFV4em8w?=
 =?utf-8?B?b01IUkRRazNYQWtiVFc3VlE5N2V4TTREbnlIQVU0NkdWckxpTVZvSWtMSmNp?=
 =?utf-8?B?U0JDUWJlVjhqZ0lhYmN6bldjM0pVT21MMC9XRzdRNHo0NTJ0bFVXMUNjeDZi?=
 =?utf-8?B?ZHFRdXQxSno2cVQxWHpnVjM5dmEzZnNBZDdDMmxRaTZNRDlGcEgzQjU2RStJ?=
 =?utf-8?B?V3BvWE1UNkxXM01xVFhjVzZ5cHdxN3VKV3c0aHl4RFgzYm96V2FLSmFBeUNm?=
 =?utf-8?B?TGhyRmoxbmJlZUN1bllWMFBrU1ZITnoyMFZYSE5peER1QlVwVkowb3Q5S2F5?=
 =?utf-8?B?WEovMDdpd2lFNTFEdCtuSTZ5TTBXUDJzQ3NsTTlVL05mYXdDWkIvMXAwUVM0?=
 =?utf-8?B?MEpWYTZWUzhXOWUyOW5WTGN2cU4vc0JLb081QWxURVoxYVdQMENRbkx0Ukd5?=
 =?utf-8?B?b29tUFJ1T1NQMFFDZmpRMmJ2bkE4Vk5CK0JqOUpKMy9wL012aDZVaTN6OWV0?=
 =?utf-8?B?YUoyYTlacms3S05TN0lhZlNiTTU4bHgxbTRYQWRhMmFNaENRRExuMEdTQmZS?=
 =?utf-8?B?L280NnY2MGxjVERKZDZ1cEp0OENDQndSTHgycE02Vit2a3FyUS9tQnpXRHVr?=
 =?utf-8?B?eWR5TG80eExoL0VjMzJqZEYwV0Q5ZU1nYndCM0lDbXlPV2hmZjUvSWk5U0cv?=
 =?utf-8?B?ekFVQXNUZjQxL0xEV2NOQUluUmI3cndtMzNKMkl3b2JYeGZQRWdmeCtCYjFa?=
 =?utf-8?B?U1hUbkZOOU0yemVRaHFVeEp3eHlueTFnN1dFQXpIa082dU52VlBTcUkxMHhT?=
 =?utf-8?B?VGdaV1FvdFpDOTZpa2ZvODJnU2NEM3Zyaks5OGIwaklXZzYzT2F6MW5mbUd4?=
 =?utf-8?B?eEpacTdjQkF3ZkJvOWhhMU5nM0p2TGtTYllubGFpcUYwZ09kY3A2ZStobDFj?=
 =?utf-8?B?bnVhTHdsWlJ4QWJqcFE1MGcwNHNYaDA3QUdqNEsyUFdRckpCRUhmbXJwRkE5?=
 =?utf-8?B?T2Z2VmphOVJRL291VGJ6ZGsreWZXOWhxdDhhK3hFM3ZkL1JvMlQ1cDRDR01L?=
 =?utf-8?B?OTlqVUl4NFhqdkZpYWZhdlBwdUlobjBOMkwybmxvOUliU1RQVjRNNVJGZ1hZ?=
 =?utf-8?B?KzdZcGN6akxoREtuWHhqODJIYTVBMlhVSkFrclpsZWd0c2RhOVFLT0Zyc3FG?=
 =?utf-8?B?aEVzanIwaFU5QTRoSzRlNXp0aHRNOGxoRkZrSzlpUy90VTdhdGZJbFFxcm8r?=
 =?utf-8?B?Z1lmRWlXTEg1SUpQTGFDVlYzazJhc21ROGNhOWtETE1CSzUzR1U1ZEVNaVZH?=
 =?utf-8?B?a0FuVVE0c0RqVVBTWlVyeDE5YzdteVpjbDNwa01zQmZwc3BmVHhCcXpjQno3?=
 =?utf-8?B?aGRyUWIyWnBPZTZ1NUFJcHJtRFc1ZjdsbTd4SFhtbmtDaTZGZkE1K1V4R2xo?=
 =?utf-8?B?LzVxOU1rL0pCaS91V3dlSVdEYWc0S2tqdFlWaTdtWnplQVFmVnl2cTZ4eFdi?=
 =?utf-8?B?ZFVmbmxzdC91M1p2Rm9veTBNMDdyQXdBYm8vTmMraEZ3NU80Vm5VOXhjMTZu?=
 =?utf-8?B?cUNwc1RqMUJjZmxCVjRlK3VTVE5aR1BFS0ZockFmTTVJUXJ6Mmk5cDV1SnVB?=
 =?utf-8?B?WVZ1QUxzbVludkxMNkpYZklqR0R6NkRlaTJsSzZCWmRGSHBIUEFSK0tPdVNH?=
 =?utf-8?B?RUVCcUJZOHJkNDhxMXVzTHB2U0t6MzJMTUM1U2t4cExHejFwZWpYdGo1T1Y1?=
 =?utf-8?B?Ly82MnpDdjh6K1M2dmgyT3JRK0xmUDlqN2kxdEIzMDRlRjliVEtzTS9GY2Iw?=
 =?utf-8?B?OWc3OEFORDRESEdoQkxwOUhoVHlyNU5KZEY0WWFNNTlLQktFZUlDWkVwYXE0?=
 =?utf-8?B?VGNUOTVvdzNUZmdreUdwS1VrZzV0dFlVa0xPOHoyZXJXanJxamNiTDlwUWli?=
 =?utf-8?Q?WusPfMuN0iwa/b4KhhkXsdIumX/lp8tNdv9PdDopp7k2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c00c393-d6bc-4cfb-6a55-08de29bf5b40
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 12:04:58.0918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpvo68nV8DNEuXmL/F5qELRLHLw0Hg+gfviKG3/b9qtM6vrV1ySMGPi1S6+98LRdqZRLxMPvgA7URauKcShqqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9676
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_040503_771472_E7CB9DF8 
X-CRM114-Status: GOOD (  28.62  )
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

On 11/11/25 02:28, Catalin Marinas wrote:
> On Mon, Nov 10, 2025 at 10:53:33AM +0100, David Hildenbrand (Red Hat) wrote:
>> On 10.11.25 10:48, Jan Polensky wrote:
>>> On Mon, Nov 10, 2025 at 10:09:31AM +0100, David Hildenbrand (Red Hat) wrote:
>>>> On 09.11.25 01:36, Jan Polensky wrote:
>>>>> The previous change added __GFP_ZEROTAGS when allocating the huge zero
>>>>> folio to ensure tag initialization for arm64 with MTE enabled. However,
>>>>> on s390 this flag is unnecessary and triggers a regression
>>>>> (observed as a crash during repeated 'dnf makecache').
> [...]
>>>> I think the problem is that post_alloc_hook() does
>>>>
>>>> if (zero_tags) {
>>>> 	/* Initialize both memory and memory tags. */
>>>> 	for (i = 0; i != 1 << order; ++i)
>>>> 		tag_clear_highpage(page + i);
>>>>
>>>> 	/* Take note that memory was initialized by the loop above. */
>>>> 	init = false;
>>>> }
>>>>
>>>> And tag_clear_highpage() is a NOP on other architectures.
> 
> Hmm, another thing I missed. Sorry about this.
> 
>>> Which works by the way for our arch (s390).
>>>
>>>   include/linux/gfp_types.h | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/include/linux/gfp_types.h b/include/linux/gfp_types.h
>>> index 65db9349f905..c12d8a601bb3 100644
>>> --- a/include/linux/gfp_types.h
>>> +++ b/include/linux/gfp_types.h
>>> @@ -85,7 +85,11 @@ enum {
>>>   #define ___GFP_HARDWALL        BIT(___GFP_HARDWALL_BIT)
>>>   #define ___GFP_THISNODE        BIT(___GFP_THISNODE_BIT)
>>>   #define ___GFP_ACCOUNT     BIT(___GFP_ACCOUNT_BIT)
>>> +#ifdef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
>>>   #define ___GFP_ZEROTAGS        BIT(___GFP_ZEROTAGS_BIT)
>>> +#else
>>> +#define ___GFP_ZEROTAGS        0
>>> +#endif
>>>   #ifdef CONFIG_KASAN_HW_TAGS
>>>   #define ___GFP_SKIP_ZERO   BIT(___GFP_SKIP_ZERO_BIT)
>>>   #define ___GFP_SKIP_KASAN  BIT(___GFP_SKIP_KASAN_BIT)
>>>
>>> This solution would be sufficient from my side, and I would appreciate a
>>> quick application if there are no objections.
>>
>> As raised, to be sure that __HAVE_ARCH_TAG_CLEAR_HIGHPAGE is always seen
>> early in that file, it should likely become a CONFIG_ thing.
> 
> I'm fine with either option above but I'll throw one more in the mix:
> 
> --------------------8<--------------------------------
> diff --git a/arch/arm64/include/asm/page.h b/arch/arm64/include/asm/page.h
> index 2312e6ee595f..dcff91533590 100644
> --- a/arch/arm64/include/asm/page.h
> +++ b/arch/arm64/include/asm/page.h
> @@ -33,6 +33,7 @@ struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
>  						unsigned long vaddr);
>  #define vma_alloc_zeroed_movable_folio vma_alloc_zeroed_movable_folio
>  
> +bool arch_has_tag_clear_highpage(void);
>  void tag_clear_highpage(struct page *to);
>  #define __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
>  
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 125dfa6c613b..318d091db843 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -967,18 +967,13 @@ struct folio *vma_alloc_zeroed_movable_folio(struct vm_area_struct *vma,
>  	return vma_alloc_folio(flags, 0, vma, vaddr);
>  }
>  
> +bool arch_has_tag_clear_highpage(void)
> +{
> +	return system_supports_mte();
> +}
> +
>  void tag_clear_highpage(struct page *page)
>  {
> -	/*
> -	 * Check if MTE is supported and fall back to clear_highpage().
> -	 * get_huge_zero_folio() unconditionally passes __GFP_ZEROTAGS and
> -	 * post_alloc_hook() will invoke tag_clear_highpage().
> -	 */
> -	if (!system_supports_mte()) {
> -		clear_highpage(page);
> -		return;
> -	}
> -
>  	/* Newly allocated page, shouldn't have been tagged yet */
>  	WARN_ON_ONCE(!try_page_mte_tagging(page));
>  	mte_zero_clear_page_tags(page_address(page));
> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
> index 105cc4c00cc3..7aa56179ccef 100644
> --- a/include/linux/highmem.h
> +++ b/include/linux/highmem.h
> @@ -251,6 +251,11 @@ static inline void clear_highpage_kasan_tagged(struct page *page)
>  
>  #ifndef __HAVE_ARCH_TAG_CLEAR_HIGHPAGE
>  
> +static inline bool arch_has_tag_clear_highpage(void)
> +{
> +	return false;
> +}
> +
>  static inline void tag_clear_highpage(struct page *page)
>  {
>  }
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index e4efda1158b2..5ab15431bc06 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1798,7 +1798,8 @@ inline void post_alloc_hook(struct page *page, unsigned int order,
>  {
>  	bool init = !want_init_on_free() && want_init_on_alloc(gfp_flags) &&
>  			!should_skip_init(gfp_flags);
> -	bool zero_tags = init && (gfp_flags & __GFP_ZEROTAGS);
> +	bool zero_tags = init && (gfp_flags & __GFP_ZEROTAGS) &&
> +		arch_has_tag_clear_highpage();
>  	int i;
>  
>  	set_page_private(page, 0);
> --------------------8<--------------------------------
> 
> Reasoning: with MTE on arm64, you can't have kasan-tagged pages in the
> kernel which are also exposed to user because the tags are shared (same
> physical location). The 'zero_tags' initialisation in post_alloc_hook()
> makes sense for this behaviour. With virtual tagging (briefly announced
> in [1], full specs not public yet), both the user and the kernel can
> have their own tags - more like KASAN_SW_TAGS but without the compiler
> instrumentation. The kernel won't be able to zero the tags for the user
> since they are in virtual space. It can, however, continue to use Kasan
> tags even if the pages are mapped in user space. In this case, I'd
> rather use the kernel_init_pages() call further down in
> post_alloc_hook() than replicating it in tag_clear_highpage(). When we
> get to upstreaming virtual tagging (informally vMTE, sometime next
> year), I'd like to have a kernel image that supports both, so the
> decision on whether to call tag_clear_highpage() will need to be
> dynamic.
> 
> [1] https://developer.arm.com/community/arm-community-blogs/b/architectures-and-processors-blog/posts/future-architecture-technologies-poe2-and-vmte
> 

I've run into the issue where due to init being set to false if zero_tags was set,
the system does not clear the zero_folio. I just spent a lot of time debugging it :)

Catalin, were you going to send out this patch as a fix to be included in mm-unstable?
I've for now reverted your __GFP_ZEROTAGS change to get_huge_zero_folio() for my testing

I am on the current mm-new branch.

Balbir




