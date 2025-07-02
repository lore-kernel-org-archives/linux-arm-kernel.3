Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34623C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 15:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nKEdEMJWdlImGnnE1vH7Eyt1vl6sW+8J4a2rsI8w0nc=; b=ZDejVIQ+nQBVNpc77G6PKayDCS
	25ep2M+qoxGxfy5Z2lsxw962feo25JtVpjxE2QVYPkQZByfWX1tHRJdRIPSw5B0oRjlwi4RgC4tDl
	k0fUaJ1d7wTOXmomdP/0yOi/jVAJa5MBrmx0Jr7W/Vg+E+d5gMmU5ErU7Ynvc/BakDyjUEMTcxfyd
	bxWLG63nj8cmtXlHQ53KmW5fkxfUZElGD9WjqObva65Cd02RPDlfsSTq9HPNmS1CDwWg38vBOswuS
	dDWDDz25b6bBsAQufpS1dKnPq7O43sgh97gA0IgeTVybmouhI3W5Q/V73STscgQeVYGXVNV1nHcsx
	xfPy5lPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzrm-00000008sL4-1xoZ;
	Wed, 02 Jul 2025 15:59:22 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyyc-00000008iuP-0pGa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 15:02:23 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Zx8NfdZOc+vTtYpNGfmy6MetIOjwdO4jrLITpq++Vm2GsW05gjWzQAXEeDUlAOWnlhDjHcmRRtmEAoWliz7+zQNLt/1vUwhHPLPO4Hdn+uTEPEpFNegAHq8PQCVAL/R6pGvMf0bnSzTx8+Ci36j/trwfWsPAGcf9L4ztKc2yqefwbIuQEo8fOoUQlVW1copmIWmm6WhPbN1QgEqY4C3dnXRWsQp1E7Cp4zUb7xQuAq/tDgizwjU7K/ITJtNmErmZdt4VcfcbRgB7TYQI7hN56465RFtMYLbghPeaF8PBRgN0J0+GrZO1CNRtSo1jhtZZjBxhF4MGzvI56N79FR/qXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKEdEMJWdlImGnnE1vH7Eyt1vl6sW+8J4a2rsI8w0nc=;
 b=tXGiuWF/l/A0oRjRqx5g+HHrEJdRIpR72HsHAf7WKdU9GR49dvOoYkAl4T/2e1VKNUq+Q99HRN3x0hd1rmlbkfjJMr2TCfCaeM9ZyNWJefdhxQ5trcbY8MOxqiQmaPxArjiqbITa19XDV10lUBrsXiL8HFXDuCpmWrIdwJ2vO2mPpN3zs5DpoJg2S1cu7j+bvure8QlrDUSJTp0Oh6bLLAP/VA/db8Mw6UJi8c6oG+uILxrX7Y2dyrEodWyxiM30pd3Mxe9G01BMdasOpnQIbiaJBN7uZAn2yfapDjwhjXtKLJczTu8302/iR+DbmQ2reLfqXCYaMdygvpGyc/1yUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKEdEMJWdlImGnnE1vH7Eyt1vl6sW+8J4a2rsI8w0nc=;
 b=SMR48f0P4BOlaT7lCqXf5gENatJto7+2MQv7UviYBYybePVUi6vW75DDwSY+FvpI7FIOEfT+bLYByNCXhvmUev6XQVpGeB3CGtu9D/GbcM69CfeizC8e7gVf99C/vYIqKevyZsBevZdVKljR0BnE6i55pn/7svSGz1GQJQZwjV8=
Received: from DU2PR04CA0161.eurprd04.prod.outlook.com (2603:10a6:10:2b0::16)
 by PAXPR08MB6688.eurprd08.prod.outlook.com (2603:10a6:102:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 15:02:15 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::39) by DU2PR04CA0161.outlook.office365.com
 (2603:10a6:10:2b0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 15:02:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Wed, 2 Jul 2025 15:02:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NV7qeAEmRV4ACJMQtMrPeum+Dd6jii1xpxWOOT3pi1Go/lpw2fHQ+PPu/Czvlmzh9YGK29Lk9eQxr3Ey5MCWvyzUFhsdu+QUPc5T1f+zJa/AQHZhI1UjViHluArZnNSf9M1sHvNwSiMzHPdZ3tMgOTgKftHgJodMWW5dtRf2RV8u2syLofYBlvs4lsRQ6Y1fs6M4/54zGsr8buQRMK5soOoYFN8OD45N45nSz5wAlY0WTUKjzYQmbsRvE2FByWxcpI2W/KGc/4FyUugUOLEzMyu1oL/Ke+JpBFYAa17b3Bt9UqA8XTWtIqkrjUReXjrF+t7REax6iya8RuysXzjB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKEdEMJWdlImGnnE1vH7Eyt1vl6sW+8J4a2rsI8w0nc=;
 b=UrgdTCb8eWMfdZljTaTIwTGN5QfZyGeBDb58PDIcFGN8kFWt6RPMffhCySCt5VDkUXjLDNTNV28nO1h8zBsU9sH3Wc8yMdTWaODeETgIJDuy/KNSS0dGFeXM2mPUlcr4000ICt0MhSlBLuW5mkMwyBuCezqzZblaR6I8oh9p1Hf9ZWNTXJH+EhfEYyIJWO2WST4SUBkDoimOlLYvSbhv9VPaJmJmsqWB1sL97Lj68oLO98b7SMZn99XvqoEtoOKqXbE1Xxz21yr3v2yPUwcMxl/UIIK/zW26aPHycH1NBdJUgP41iOKGQ6sqw/0jHvy4Lpovd3VE4s00XK40QZr7fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKEdEMJWdlImGnnE1vH7Eyt1vl6sW+8J4a2rsI8w0nc=;
 b=SMR48f0P4BOlaT7lCqXf5gENatJto7+2MQv7UviYBYybePVUi6vW75DDwSY+FvpI7FIOEfT+bLYByNCXhvmUev6XQVpGeB3CGtu9D/GbcM69CfeizC8e7gVf99C/vYIqKevyZsBevZdVKljR0BnE6i55pn/7svSGz1GQJQZwjV8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DBBPR08MB6060.eurprd08.prod.outlook.com (2603:10a6:10:20a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Wed, 2 Jul
 2025 15:01:41 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 15:01:41 +0000
Message-ID: <b5b5d823-068f-45d0-90ef-4fa804a84bdd@arm.com>
Date: Wed, 2 Jul 2025 20:31:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] mm: Optimize mprotect() for MM_CP_PROT_NUMA by
 batch-skipping PTEs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-2-dev.jain@arm.com>
 <f7f12499-7b73-4209-a92e-91e04ffb0fdb@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <f7f12499-7b73-4209-a92e-91e04ffb0fdb@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::29) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB7120:EE_|DBBPR08MB6060:EE_|DB1PEPF000509FC:EE_|PAXPR08MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: cb971e1e-3107-4f65-3e16-08ddb9796d95
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?MFFvYVJIbnVwS01ON2I0ejFGWFRhdDJGK08zV3ZxQ2xpWVBFVnhxaUJTL29R?=
 =?utf-8?B?R2VMY2laKzVDWXZHL1NGRUk3VWNzbTd0RW5hQTY2dlFIeHdmMG1BMmZGVm80?=
 =?utf-8?B?Q0hzbUNRMXBxNUxHMUNzVEJLS0Raa2lrYi91Tm4rcXBmUTZ4VEpSem5DdGtD?=
 =?utf-8?B?c1BGbDV0eXNmeTFlSzFaUXF3enpIUm5rUWVwYmdNeXFBK3hzNk9JNkNzdWNn?=
 =?utf-8?B?cTZackJlb2NkbU92K1J0T1o0bEMxZmloSWNWT2JWL3BpODJCbDJSOHFwc2xY?=
 =?utf-8?B?WENJcStlenloMWpoS3lDNUp2c1ZBcUg0ZjhMOWFTamNrZ3dRMVhaOVVBdFpD?=
 =?utf-8?B?aCtiM1RHTmJxVUE1US9aT1pJT1JLMVBvRzNtWFBRK2pPSjUwL2RaMkRzcklv?=
 =?utf-8?B?Y0VBUmZkTWxzTHZONDNGYmZkWTF0QTBuWkI4UlFNcWYvSGhkN1JzbXZ5STFP?=
 =?utf-8?B?bHFvQ0ttVi96WHFmYWltTkQzR1dXUjZ1Sm1Sb2VvTHZqdXZPOVkrR0lueWJx?=
 =?utf-8?B?Q1graFV5eDQ4Nzhyazcvd2lHdG1aU29mYWR0OW5ta0xmejRwTU5BOVJISmVt?=
 =?utf-8?B?TXAzQzQyeFVxV1NJNUo1SWJWSE5HWGN5RjFXR1FwWkJYd2Y1TmlGVlYybWN1?=
 =?utf-8?B?ODF3L1FwYnRrY0pJaFZHSVJSbTc3cnlYbGpnWkVWbEZGWjJuNVpMSnczQVhN?=
 =?utf-8?B?aW5MODlzWW5Nb2tKT0h4dThVOVJhMVRKUjJHTGtBcEJjM0VlRlE1NmFRVHNx?=
 =?utf-8?B?b0NlNWRUVlRpQk5xbzJ5NW54QVhUWHBIdGhjU2k3ejEyMmhxZjVoekdlZ2dw?=
 =?utf-8?B?U3V6T0trZnBibExjZUMzMkdQS3d0WERzK21HV01qYXVjWjZKY0dVb1ZTcU00?=
 =?utf-8?B?aUExTG9IMUJMRnVmQ3FlL2phVVRXYUhQRHZtY2F1Umt6czNGMS9JUWJxYVhR?=
 =?utf-8?B?NzVvRWI1TmRHaXU1WndWNWxlTHo2VHRncjNUWTMyeVpRT1lJc2NFK0J0a0sw?=
 =?utf-8?B?L3Z1UjVmWkdmbW43UkVLUEhGdUlnZDBSOEZrdVB2MDBWV05MY1QzaFVOWXNH?=
 =?utf-8?B?dm1yR1lSMENyQTdFdWZaRkNKSFJSQzdmYmVLK2dWVlF5Rms3OUhycWh6U0ps?=
 =?utf-8?B?Q0oyWCtBeitUdnhtRWtnckRLVHB0alI4ZGxBWnU4TExSYkZkRllnR29adTJP?=
 =?utf-8?B?UHJIb0ZtREJPRitOMnVlWmZ2MzFXbFdnRytPTlQ5dHo5a05WZlVnVXd4T2Iz?=
 =?utf-8?B?NGhZcEZjSnZGeDZhNkR4aUZWSzhncFNBYVNvMmxiU1Fjc1VtSmpjV3ZmNkhz?=
 =?utf-8?B?cENLVlVLY21TT3BZYW1BWXFqSW0rU0pHTHIxemhDVG0wdWF4Q1FpV2xxQWdS?=
 =?utf-8?B?dlk1RjhrYTRpakpDNFgxZXg3dDY3THdLRFlnelZ6b2NwL1NSbGhXZ3F0U0Mv?=
 =?utf-8?B?Zjd0a05IYlpaNVY1eFVDbDdsa3BER01OYlhIV0s4d29TN1UzVVVVUit1Nnh5?=
 =?utf-8?B?dDV1OGF0V3o2TFhZMnNjYk5wdnpsTG1EMS9RVjhIM3ZMaXZDb2orS2tkcmEw?=
 =?utf-8?B?WVY3cHNXRExDWEJpcFAzbEM0Q1FRNkVITGR4ZFNhSmFhWmFJWmdLRHAwd0ww?=
 =?utf-8?B?T3JCNUhWd3VISXpubXhSWnVjc29kRWlpNHJ6azVvR2hzc1A4ZVBUT1V0S3Z5?=
 =?utf-8?B?aGUvVGUzTlZtMmQ5aFhmcUxZeHo5NE5BTjdxRVpEZ1lGMFV4R3dBWTJsRXEr?=
 =?utf-8?B?MXR6RnRma05QTU9aZEhSYTRRN0JWRnk5ODBMWE5uZTNtSTlUNGFxbW9tVkhp?=
 =?utf-8?B?MkwyZHNlTnNGb0hTWkFKMTdKMXphdWpxNDN2enYxOTRxL0ZKWVRXYmxuQSsv?=
 =?utf-8?B?T2xTaWQ1RDYvNmhzZXRsUHZuTVVlcE4rWWVaUGFRTEhSZUE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6060
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bcf88e9e-7e9a-4aa1-6df9-08ddb97959f0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|35042699022|1800799024|82310400026|14060799003|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkxvZVFjRXQ5UUdPdFZ5SzlqVGQzMjY3aTU4R3dodHZqSml6SXd3TmJoVFov?=
 =?utf-8?B?dDRHcS9vTXpMTWxkVThib1d5dm5vV3NjeENWbUhXRnBSdWcvZ0hZY2ZHVlJF?=
 =?utf-8?B?VUpFNTlTczNnWlZ1V2cxVkxxeFgyNXQwaGg5MndZcmdDT2t5NnFHSmNVTVQ1?=
 =?utf-8?B?YmxFb0hidERhSlQ4SUhGN00wV3pySDZGOVpVbGc3cEVYNEV2bUovS3dVWmNY?=
 =?utf-8?B?OEVIN3JyT3pUa3ppd0JJTW1hWlFTY3FZam52QUJmaXY2WjVGanV0NWlaWEZr?=
 =?utf-8?B?RDZTMnFTcTd2NzBLYm4wS211Ui9Qbnd5ektoakU3NTRCNkQ2UXE2eEtvamh3?=
 =?utf-8?B?ckJjU3E4bmJvMy9HRVlBMlZQWUNUU0h3anh5cWZEUEFONzlQYTVGOSt5UFNt?=
 =?utf-8?B?cmdQWkxuQ2c3M0gzT0kxRWFEQURYbzJ1cGp4SHEzZmdzblE2NXorM2lndmJ3?=
 =?utf-8?B?T213T3JjcmNpWVFMZVNIZkZGcFRnUXdXdDRVL3l2Z0lFZXBTbFpzVnZ0eGNk?=
 =?utf-8?B?dm1VckNGQ2pSOWIvMXVuMlBLZW5BalE5T01LajBhMkFuQ0F1STVrdGxRT2Jw?=
 =?utf-8?B?WnRlcCtmdGpsYmVmKzJib21jNVRMTjhjV0dpRUxPV1RxN2VNS0E2MTB4RzB6?=
 =?utf-8?B?OFEvK2lNb0dQS0loYmFzcVJydGJ4UHhGT3RLT3Y0VUQxdUNlK3ZqVmZadXhW?=
 =?utf-8?B?MTNyUzcwUXdOMXNZaUMrNGFSOFN5dTkvd3pPeTZpVFUwdkUrSDRxTEJNNmY2?=
 =?utf-8?B?K09heEErTGtMOWhIRzMwdlppUFQyVTlvdGFMdnRyNmZoWVhGMUdqZUtrWWdK?=
 =?utf-8?B?eEpNcVBzQ0Rxa1FuMVhSbkxMUTE0dlhranJHWmhlelhNVHRsb2pvRmNyRlA2?=
 =?utf-8?B?bjRvWnJjd0Q0cUZRU2lhVkxuc0tDLzFIQXZmemFmSUNTWkZMRDBrU2ZQVGQ3?=
 =?utf-8?B?ZVlXTjUzTWlVYTJKVUJldFVzNkF6ZmZNb3VCdjZhUmVSNEpES0IyQmh1RTlz?=
 =?utf-8?B?cTZXbExoU1VlcEVJc21POU16ZTE0Z1RaRWd0NDlsVDBnanhSK3BEM2tJVkVq?=
 =?utf-8?B?UTBhUW9Pdm05R2pWSm00cFdQUms1Q2gvNUNFYVZIQWhEdlM5eXpxWEd6bVQy?=
 =?utf-8?B?YmxjQmxycS9LZm9Tc0QrT0hMZ3cwNEVZVzBaQkZFaTQzOHp5ZnpNS1lKeW40?=
 =?utf-8?B?eFBlWkF4RnRUSjZoYXNIMm9uRThYMENQcmxNRG96REdVeGFXVVNhV2ZaR2NI?=
 =?utf-8?B?dkhyZnVoOVdkaFpNTmNMdW9qeGVzUXkrT0lEaGU0T3pJbldlQTRxM2Zod21h?=
 =?utf-8?B?R2N0ZHN2NXIxaTZmYml2bGUwMWlwY3R2eEpxa1lmLzBCV3ZHeGJBQWhwRE94?=
 =?utf-8?B?VVBKSnNrZnFEcnVDcDUvemtucmVhR1pnNTEzRlNBdVBRWnlFWURBMnFzbW9L?=
 =?utf-8?B?QXJ6NjVXNlR4TjFOd0hiaUljMkQ2Zk1UZW9uTGtEK0tvdXN3djlBL0FPSEE3?=
 =?utf-8?B?S256dCs4UjlBRmN5K285Vzd6ZWQ1bXFtWmZQY3AwN3c2UTNYcUVMQ21lejdx?=
 =?utf-8?B?OUZDSi9UV2JVMVN0cDBQbUZvbzNFaXNGZWo3UHJZcnBycGF6OWFYcURHalhJ?=
 =?utf-8?B?V0tqNjhPNno4dXhyZWhsVkd3UEZjSGtNVWx1MnlMRUs2YkZHb2VRbCtPUCtz?=
 =?utf-8?B?ZzROQlA2S0NlNU5Dblp2QmdZOXZqSUoxTXN4YjBDMkZzdERQckVrRlIzYlJI?=
 =?utf-8?B?R2FrY0JYWjgxRGE2aGM4bG4wUE5Obi9BS1FOQnRDWW0vMlpNU2RwTTFOZGlY?=
 =?utf-8?B?cm5IOTZ0dWZTdGZWdHJGbTExNUNOaVhZTmQ2TUlkQk1DaUp3NVZmZUtOSlEy?=
 =?utf-8?B?d3JwNklXSzBmSFdYU3pGeTltZGdxaS9nUUZuU0pTdGJidkE5T0JtdElKWDJj?=
 =?utf-8?B?M3IwNkczUGt3SnM1QmdUaHRNNy8xYUUraEdQQSsxVGJOV1RlYlNBWlJyaUxI?=
 =?utf-8?B?cUhkSnNWN3JmVXBJcEM3SkRGc2pVN0ZHTlAxSS9pOHVkUkRacTJaOEJhM21O?=
 =?utf-8?Q?Jmwd1O?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(1800799024)(82310400026)(14060799003)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:02:13.6194
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb971e1e-3107-4f65-3e16-08ddb9796d95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6688
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_080222_386312_CDE21E82 
X-CRM114-Status: GOOD (  18.32  )
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


On 02/07/25 3:07 pm, Lorenzo Stoakes wrote:
> On Sat, Jun 28, 2025 at 05:04:32PM +0530, Dev Jain wrote:
>> In case of prot_numa, there are various cases in which we can skip to the
>> next iteration. Since the skip condition is based on the folio and not
>> the PTEs, we can skip a PTE batch. Additionally refactor all of this
>> into a new function to clean up the existing code.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/mprotect.c | 134 ++++++++++++++++++++++++++++++++------------------
>>   1 file changed, 87 insertions(+), 47 deletions(-)
>>
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index 88709c01177b..af10a7fbe6b8 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -83,6 +83,83 @@ bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long addr,
>>   	return pte_dirty(pte);
>>   }
>>
>> +static int mprotect_folio_pte_batch(struct folio *folio, unsigned long addr,
>> +		pte_t *ptep, pte_t pte, int max_nr_ptes)
>> +{
>> +	const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +
>> +	if (!folio || !folio_test_large(folio) || (max_nr_ptes == 1))
>> +		return 1;
>> +
>> +	return folio_pte_batch(folio, addr, ptep, pte, max_nr_ptes, flags,
>> +			       NULL, NULL, NULL);
>> +}
>> +
>> +static int prot_numa_skip_ptes(struct folio **foliop, struct vm_area_struct *vma,
>> +		unsigned long addr, pte_t oldpte, pte_t *pte, int target_node,
>> +		int max_nr_ptes)
>> +{
> While it's nice to separate this out, it's not so nice to pass folio as a
> pointer to a pointer like this and maybe or maybe not set it.
>
> Just get the folio before you call this... you'll need it either way.

I did that on David's suggestion:

https://lore.kernel.org/all/8c389ee5-f7a4-44f6-a0d6-cc01c3da4d91@redhat.com/

We were trying to reuse the folio if available from prot_numa_skip_ptes,
to avoid using vm_normal_folio() again. Not sure if avoiding vm_normal_folio
is worth the complexity.

>
> I'll wait until you separate it all out before reviewing next revision as a bit
> tricky as-is.
>
> Thanks!

