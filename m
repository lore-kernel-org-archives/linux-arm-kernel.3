Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453B0C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 15:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfY3sFECrRvA0x5/1ydNOClZDBjtfdYzVMbbNQgs9Ok=; b=qvsMJKSpbOQuW+syDWk/5WF1jo
	avKRrD7Vzhz4oVmEbuUdpDa4LjdpaJ6AgHV281H74PljhX+jMiKCojaJI6U/rOthTItj/q2s0rxus
	bSxZdl0HOlF/5q2vnSinObcSSFQvuMH47RDNwOMxAyKcj/dR2gy/F2eZfv0hztYT66ZLwnkx++clB
	fBGj3eyX4/1nVx9Fa4YUEjRvtMtkCkQ76JDLx0817mRdTWGvIOJKlJQDSC/jogGP3NF/FJ6DR2+M7
	i5SkSEV8j6SK/r/D56AzPNWDAYaLakLCNqsgqdtysjZvjM9TzZp8dGX0pyNmnLo05Wv/ps7b5CoMw
	+ZoHocZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebj0-00000005QU9-3uW6;
	Wed, 23 Jul 2025 15:49:47 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uebSm-00000005OLU-26Zw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 15:33:01 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wJkBWhEfnuLBC6mROlo+X8Zgref+0N9RCOjARgOZz4bfwVFXblyn/CNaLSw07EYfKmyCQuPm9dSIAsWnxtyObEzcHDgP2FAytWsV38icdiRLkyOjZNSiKdG8ejGqSh7JIZHEWdye7r9JvgguupArGMWDNTEUFbuecczKdSue8l033DZp8cTI7d6uYrkZHarmI23Bsz4ldQyFyVVoBnWDUCTHPKAGCMcRYRIOJbdvZy6zRFhEiVBu/c0HU0mIJxCInOHKs1sckFX1+Jp2W6palM1PNSsScMXxYFTI5TkfZCfphDbbkQhi7IQz3Of1ne3GWqO5ypgsEjBXK+CwnXVK0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfY3sFECrRvA0x5/1ydNOClZDBjtfdYzVMbbNQgs9Ok=;
 b=Lf+1nnE5MGwCTYptV+PiteO6PWSLURMoM51d3Dl7Vrw6ittU3wjmP3fz6an/9gItklflj58lXFe+cGqhj8j/cUGF7jub8tSd8jDekTgOBViiPw5Ka7lmxBU5i/bmMgHPq6GBd63sFEdVOGRhQ4qYvdjwZa8yVtmEP1+YOCxVE2moTtwTppVXxywKtva8FWD9lY4uq7cYB+KDWBSE5zQrBg60XTmLWKjH3+LVPYBWfIXaNAJ08lUNOjhp6RBR4V+Yw/lKGZ5OXvj+JRIeHlNhiEdFl5ZxE7jBVLMoiv84JZhyGm4CkCMyOWaUib3+VKmbXrRGhuXmeB/D4E2XIy9p2Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=nvidia.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfY3sFECrRvA0x5/1ydNOClZDBjtfdYzVMbbNQgs9Ok=;
 b=LPfz1FlA6qx6Dm92rb0FJncEXtWj0M+bqYe0xmMB7BfIhh+rMCilR2vGwaeOdY/u0EHuHMPvJ6E1bMp081Geed3ggvVjhmzLXaoMuDTHO3FPrMAHtV27pJnwgLIObRogluVaUBo/tdZo704+ATjJd9JhqG68BZ93LU1xQs/H2Rw=
Received: from DUZPR01CA0233.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::17) by AS8PR08MB9693.eurprd08.prod.outlook.com
 (2603:10a6:20b:617::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 15:32:53 +0000
Received: from DU2PEPF0001E9BF.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::3e) by DUZPR01CA0233.outlook.office365.com
 (2603:10a6:10:4b4::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 15:32:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9BF.mail.protection.outlook.com (10.167.8.68) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20 via
 Frontend Transport; Wed, 23 Jul 2025 15:32:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8SlGdq8uEm0ZAc7Bl2jzc6KCs9j0+KKuUMHWhmP18rVgt1YuYA25dyZ4NZRYletwR0auJuRmBdgvJgVimCFHMghTT2FxOU+dyLX6Mw4T3xS8lPiDre2yYpuzJh3auji8E8xodt1+71TXmI9sDisqyMD8vngJH/bOk9nRN94iept/J/9TRSk1mt5dXyMZ7oeSK5rNgNlVZCq3nmws0hOGFA+2CHlzJeReKjJlSYPsdpQDrW8G3wWLdxQcfn+IRluYA9U3iCQxCpK0kLydquwh//YndT/sg3uyw2yDtrKB+kZ4yWcUEE6loK018NBUxJ3FvGxDagMFDKbw4Xv9CEk2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfY3sFECrRvA0x5/1ydNOClZDBjtfdYzVMbbNQgs9Ok=;
 b=T1I/mBRjuKBNHqQbVY6H/Xjt2UWPACu0dC4bgdLKbDAdwMeIF9QszjaZPs+ZSKucEfu2XCCCIX11L1xIPiNl38o1DUMsdqWqi4U6/fMmhPpn6et4u+vsHrT3iUu6AZbZLbcjCLjy7ScyJldza/YZENJueE6y9SN8B7Amh5LvX60fmlcEmxQh2iaQi+0PiWlFhGzgd/usYuhH6ASdUpKNoYbjxqboTTe6kIg4UnlYBvADut6AfRF6eBckzSGRv8QTc2Ynabjb+lpmmmK9Cgn/uege1h0vWNa5/44iCNErkjaeWtXNw26IpBSmZoQCfjJPQWDnUYBRSYTM95jvmwVjUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfY3sFECrRvA0x5/1ydNOClZDBjtfdYzVMbbNQgs9Ok=;
 b=LPfz1FlA6qx6Dm92rb0FJncEXtWj0M+bqYe0xmMB7BfIhh+rMCilR2vGwaeOdY/u0EHuHMPvJ6E1bMp081Geed3ggvVjhmzLXaoMuDTHO3FPrMAHtV27pJnwgLIObRogluVaUBo/tdZo704+ATjJd9JhqG68BZ93LU1xQs/H2Rw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS2PR08MB9786.eurprd08.prod.outlook.com (2603:10a6:20b:605::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 15:32:20 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 15:32:19 +0000
Message-ID: <4afab284-5169-4837-8317-3ad216108261@arm.com>
Date: Wed, 23 Jul 2025 21:02:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/7] mm: Introduce FPB_RESPECT_WRITE for PTE batching
 infrastructure
To: Zi Yan <ziy@nvidia.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com
References: <20250718090244.21092-1-dev.jain@arm.com>
 <20250718090244.21092-5-dev.jain@arm.com>
 <6963114B-A7F2-49AA-83CA-CC4EE284714F@nvidia.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <6963114B-A7F2-49AA-83CA-CC4EE284714F@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB7120:EE_|AS2PR08MB9786:EE_|DU2PEPF0001E9BF:EE_|AS8PR08MB9693:EE_
X-MS-Office365-Filtering-Correlation-Id: 99886a30-e701-427b-63fb-08ddc9fe308b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?WVhhVWJJa0dvUWhmSkhzT01Zd3BRWmFBamdwbFphS1VmU21aR1luaVRUM2g2?=
 =?utf-8?B?VDg1enJjWU9RdW45cWlTSXpOZEZpUmlRY3dxU0V4dHp0dVpMb09ROGxGUTdx?=
 =?utf-8?B?Y0dqUFdEREdIZFBvQlQ2RXFFc3BpOUEybGhrVjZlMU9tRk9aeTI4M2Jray91?=
 =?utf-8?B?cFlzdlVqNE5xdkxPd2J1M3cwTktpMko5eG4ySlVLQXpqSWYrMTR6T2hRYUdG?=
 =?utf-8?B?YzR1R21vQkw3NmFpL3ZZSVYyeWcwZlJVeUEwZTV0RWI4bmlMelZoVHhFWVEz?=
 =?utf-8?B?TVUyNDR5OWpkTDFuSlhLZTZ4M2l0OFV5RVcrZzF4RkQyWDF2Wi8yWGpocTdz?=
 =?utf-8?B?ME9MRFJBRGxOK0M1T1ZwalhQc1ZVbm8vR0lWQ0Nnd2dHVENoL3JZSy92d3Er?=
 =?utf-8?B?bCt4MVdIYlNmTE5GY3lIbURCUkdCK3h6ZG9ZWktoMEU5UHM1UHRYNCs1WThL?=
 =?utf-8?B?NlpnRk9QYjdGZlV1K3FXWlZaRUFpM1JWalhYcllyTGxyVVB0YVN6THFsemJ5?=
 =?utf-8?B?Wkx6RzN3ZUZtT2o4N21JbUJ6T1BWb25IY25oaFp3ejZKZlhKdGFCVjZ4eVBs?=
 =?utf-8?B?SHk2UTB0V2d2SE40UmVyYTJOZkloQkpwQjQ4ay8rb2xGTFUrZ3VPa2hJc0lB?=
 =?utf-8?B?VWxFL1orTWI4bzFMSVVYY0hodGFTaG5VR2FEekRsVzMweCs4dGRHUi96UjZV?=
 =?utf-8?B?bWg0VmlNL3hMZEFRY0FpaWRMUWJjZkdyOEFOdEI3aklYSU8vdU5uQnRJT2lt?=
 =?utf-8?B?cXBUcllPVEdOVXRxT2hKRU9XaGRWVTRuUVlMUkFRTU5wU2RQZ3pQZWpDQ25T?=
 =?utf-8?B?UWtXNnd2NW4wTk0xTG41bm9Ya1lOUlVLaXlYRjd1QU5FL2t1T09kRlo4YStn?=
 =?utf-8?B?cGk4RWFQNDVveDBlWmw3SndxRmo1aVJ2ZDR4RXpRYUtVNUxHQ25SK21OL1Nm?=
 =?utf-8?B?aHZkNE10TEJUN0txeW5aU1UrWmkwOHV2Z1J3SDFnaUNrZlRidWxnQ3psTVQr?=
 =?utf-8?B?SURLcGwxT3pXanJsYkJFN2xXVWN2ckFGSWFRbFNuMHg2cmJBYzRsQlZDR0lW?=
 =?utf-8?B?aVN6TmFiQUtydVoycGJsWW9IWW0zUXBjNzI0MGxYcElQUFJtK0ZGMXFzNDcw?=
 =?utf-8?B?bzczZlRSclpwTGVaaksySVp3TFRJZWh4OVd5ZFFUMWgvc2c4d0plNlhFQkV1?=
 =?utf-8?B?aVFMUjJoMTJ5cVFGc3NrN2hIN2l4TXlCY0czVFI3dndGeEtLT3RSaC9UeHg3?=
 =?utf-8?B?dDhGY1dKTjBHRk04WUZHSHQ1SFZERkdGbFp2RkU4TVdWeVpwVi8vMkpyeW9s?=
 =?utf-8?B?UjJ0UW1BWVJaaXVZdmcwcTA4NzdNNXFDeHZRU3NYSGlNM29KWUkvYUxWMlox?=
 =?utf-8?B?czZ3aHN6ZnRtYXd6NDFJZ09LMWU0anovbUhzTWx3cEdYTDhTTml2Mk5NRTVY?=
 =?utf-8?B?cnFra2hYSnNrMjNld3VsUkg0QUozdUcyanhZMnRhSTlRalhnR21EdUtMRWVU?=
 =?utf-8?B?d2EzU0tRMERSZkxsNWdpTDJuSFlSOXZnVURPczEvOFIvc2gwbVZ5R25QQjRK?=
 =?utf-8?B?SUlUaEYzMVVwb01wK0xJR2JYVHNXYmUrTk0ra083dlMzbWJrTHh3T3NxY09I?=
 =?utf-8?B?aysvM0ZZOUJ0eE1rb2RnTStYNGxxK0RhNTFOTndXZitnZEFhdjlrQk8zK2NI?=
 =?utf-8?B?elhPalZGdVdnVi9rUGxZeGh6THUzVFJLOFNZbDQxZzJJYVp0R0RRVkMvZ1p4?=
 =?utf-8?B?Y1FmU2pqS2x3clBJQzV6b2llWkJhaEtpWVNPbnk5dTkxQzJ4RGtXTy9zeXor?=
 =?utf-8?B?aEhGT2cvU3pWR1VrMXpkakZ6RUloMmovb1lhZnJxbS81TEJxdGpDYm1FeW8v?=
 =?utf-8?B?Q1c4QXAyNzVrbkJzMTNhMWllYW4wbDBBR2RWWElhQWxrWFFtWUJlTFJGby9K?=
 =?utf-8?Q?nDAmDoercMA=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9786
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9434d310-eb1a-464e-2872-08ddc9fe1c49
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|36860700013|376014|1800799024|82310400026|7416014|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bjNjd3B2M09henE3MTFpSVhmc3F0S0xNd0NBRmcrc2hSLzV0SU52SzdlMkEy?=
 =?utf-8?B?OFNyaWpnaG9UeUFibDc4V2xEb3puYVZPcVpCUVprZTNWbHRZUUVuNU1yOTBp?=
 =?utf-8?B?QUk5TEV1Y0pZSFRmY3kwR3FaZEtTSGhKS1k0dm1DOHhIVk03OFN5UkdmYnNL?=
 =?utf-8?B?NWpjRWp4Z0kyL1lnL2tTcnpnZkVubHBGL0sxZ0s4NnBlSzJnT3dWSzZadXNY?=
 =?utf-8?B?K1k3M2kzbXFTMkZOeEtYaW5wNnByZ1c2SnozY2VvYzEwdUdxNjRkNkc2SW9t?=
 =?utf-8?B?MFVTbnhFTWFuTC9hYnhTT3l5b0VNb0phL1lIOGpDcU1zMmt2YjdxTzdmdXZP?=
 =?utf-8?B?WWczYVJkOHF6dVhTNTRQNHdvcUdUenpRck8vV0g5UmVMZnI0bVJGaWkzZ09H?=
 =?utf-8?B?VlBKZG4xZWc5TkE1TU5PRVROdk4yMFVzeUovWGxWQlJtaVNJU1l3N3UzYUo0?=
 =?utf-8?B?ZjJJSjVEb2lCWGJvZEhQUGxZd2I4WWZiRlkraFNwWS9ZdmlzVnBsaFpwV2Ja?=
 =?utf-8?B?UE1DbStzc3JWeXBaUnIvcDhrcUY3RGlvNDd3eENIVUNkSklkMFlvRnhSRkw0?=
 =?utf-8?B?S1RpVUNuNkNPSEROMHhmU2NOWXFVUHNidTlVZGZ0K3B4TU5yWmlqRE1CVllR?=
 =?utf-8?B?cW5xbnBpRTFZUituMEhjb01FZ0NmMzNCK3BvSE1jdVdDNzk3WVpOTG51VjFh?=
 =?utf-8?B?QUh4SWJPNmJhbXhKNGtVelNHMk5CUDBJWnNpbGhyTk9yZzBOdXM5TnZiVFFh?=
 =?utf-8?B?VnhGbWdTSFJ6Rjc0SWhhRlZxV2g5a1NxZE1HYlI3djdOejJlK21kUXFuTm9q?=
 =?utf-8?B?dTR1enIrQ0dJazZWTkZHKy83M3J2bThvdkVBdE9POWx1b3dPaUdXOGdubFJn?=
 =?utf-8?B?VWdtSU1Kc0VpbkNYOHlZbFYxZ1dHQ1YrRGFWa3liQzlyTnl2bURlWFEwZFpO?=
 =?utf-8?B?NERtamVsZlM0U010RW0vcUFMVTVJUVA3NDJudWZtUGErektINlNwYXpxdHRJ?=
 =?utf-8?B?M3I3Tkh6NmpBZ3dDUFp1NExNOWxSZXRWaHBBVkhCbFgvQmZoa1ZWb04ydU5h?=
 =?utf-8?B?V212YUxRcWlZdFYyTnU3Q2RXTUk0eGhXZDNwTlU4dkdLU0REb1FIbTdUdVlZ?=
 =?utf-8?B?TzNJYTBoNVhOaEN0ZzFnNFA4KzNPSGJZTDd6RWZQZndYUjRnQzNIeWlCaTA4?=
 =?utf-8?B?bEtDdVd6bjFuTys0Qyt0TEF2VWFtclk1Wm9mb3RvZmhPTkYvZkZlbFJmWC9n?=
 =?utf-8?B?T1l3L29mZjRkN1plelRvYVk3WlFmN1dvdklhL3hnb0NrYkZ3UFNnN0Jtdmtu?=
 =?utf-8?B?M05TNjhteE84Y2JUODFuNkFzNTI3NkQ1RDZlbUZBVXJOTmZERklSZytUdTl3?=
 =?utf-8?B?cnp0L1FUckR3S3BEYkNDdjlzbXhWUDBiLzFocm9RMDRKdEh4S1RWS0VmeXdi?=
 =?utf-8?B?MHMyUCtUM0prOWVsWERlRDlqUHZSVXU4T2xORE51aHhtek83UTZCSVl4NXpP?=
 =?utf-8?B?TWtxdTkrenNYbVJ6bGZBV1l5aDhzbHRCajhZR2N5eDBCT0wwVUNDVm9UT1NJ?=
 =?utf-8?B?b3dhU3cwc1FtZWxRVkFtMGxOWHRId2lPWHNzWUxaYjVnbkhOektrMGg0ZlNl?=
 =?utf-8?B?UEM0SzVEVktULzc1YzZRNWpRd2UrNDFSYnVLZDZEU2hBYW9jM3J4czEycnpl?=
 =?utf-8?B?ZUp1KzlDWkVvNjc2bk8xWCt1OE9QUno1dmlTeVZmNytzUUNDUXBidkdmSEhN?=
 =?utf-8?B?Witsc0IzZmhPOVpjaVMrbWkxWDNtL1d4RmY2UVdsUTRlSGdreU9QZmlOejdw?=
 =?utf-8?B?KzJ5S1ZocDlPVEd0citvNVBUR2pZOFgraDBVeTR2cmRMUzlyUFJPUWF4aTNW?=
 =?utf-8?B?Ky9aNytJb2E5L05Ea2lOenJPNkdiK1VnOFFnT0VJbTRldXhhSzdyYlRRNkZK?=
 =?utf-8?B?cHYrZmRmTWJUUTZiN0FJbU1ySHpicHZRVExqMHJXeWh3eEJLME5HUDFKVmZK?=
 =?utf-8?B?d1JiaVg1citKMGQwbVRXZ016Tmh1ejJReUcvcUtIU2VQN25nUnhwZ3drZW14?=
 =?utf-8?Q?u7Yjhd?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(376014)(1800799024)(82310400026)(7416014)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 15:32:52.8773
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99886a30-e701-427b-63fb-08ddc9fe308b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9BF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9693
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_083300_695399_D37F1A0E 
X-CRM114-Status: GOOD (  15.76  )
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


On 23/07/25 8:58 pm, Zi Yan wrote:
> On 18 Jul 2025, at 5:02, Dev Jain wrote:
>
>> Patch 6 optimizes mprotect() by batch clearing the ptes, masking in the new
> “Patch 6” might not make sense when reading it in the git log. Something like
> below might be better:

Andrew has fixed that for me :)

>
> mprotect() will be optimized by batch clearing the ptes, masking in the new
> protections, and batch setting the ptes in an upcoming commit.
>
> No need to repin for this one.
>
>> protections, and batch setting the ptes. Suppose that the first pte
>> of the batch is writable - with the current implementation of
>> folio_pte_batch(), it is not guaranteed that the other ptes in the batch
>> are already writable too, so we may incorrectly end up setting the
>> writable bit on all ptes via modify_prot_commit_ptes().
>>
>> Therefore, introduce FPB_RESPECT_WRITE so that all ptes in the batch
>> are writable or not.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/internal.h | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
> LGTM. Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks.

>
> Best Regards,
> Yan, Zi

