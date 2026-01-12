Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B91CD2505E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 09:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=537Jx6hLcgW7UEtIl1sTrmG4xLnFVsOut3XLVD0rPaA=; b=PocNwlwSB4OXgrxUGvFOA5GTuG
	Yzj0tNPh3WtXiHedTRj8pjwy4q6Ang9CkNbFWFH9HRfXnCp0jGMkvzE77i0DpjfcEBadVRh4Z1g1H
	tiVdcXmBhPm3Jhsln7kJ5DQxNZ0M5Wyf0wU+jPDJqpcj4fPhGwTg7c1qyd2dqS7T/j1dL2IfB9Opn
	g/KWXkaUwfzUhFu4E1I2NmjXaS9YXSIFW3T8TScmXUQhKkhQ667CKr5z6Ex66dNJPXFEqsjiPE6RU
	lEPqYRXGGswwo8MWcHTQYR8trzsbtAtNw+WkirU6VbY9z67awNK8wcEEzW2ibFdYSaLCFijTMq3D1
	WPmBUgZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEOQ-0000000562X-1QzA;
	Mon, 12 Jan 2026 09:39:22 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEOO-0000000562C-1UDe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 09:39:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k812ZWN2stX5PWRghqV/7jNTwO6GZw6wXrBZgcDvDDM3pNVwBN4hRzJYYu7dTO0FcA5UXNpbQFioYMshbmC+mK4ishKMU1ACo84dcVO8dLuo5n/NkrDiEcFp5ayP2bP3DFEy01CP8Igs5glR1bjcx5FdFWufYmh4X2dXLX+x8RK4eFldiDPGgzDW8pnTCecaq5htwCr48hoFbNAi96xx9DwHJ77iAetIR6wa3f7eIRP8D2/MXUWgwOBp6U+AZZnr+YW8vPSyOxyJgBiELDX+3MWohd3xfdcmSBoUuo+qrAlhyiLESyjnLArscbg9O/crxyNLi9Ezh9XmfZRrzL2RQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=537Jx6hLcgW7UEtIl1sTrmG4xLnFVsOut3XLVD0rPaA=;
 b=rxl5TsQcwyym2gdXZVa9cBrc73oaklx9NX/TO4BtCJ54YpYNkeaGRKCWpCyT9IgnS8GAEfQyV2JV8h7KhdJ1JTHwFbj8dGy993iFEL0rHACGGnTrUGCo8Y3ZQdZcOyeeI9QrEy1EPnk9TVw0xh2hPBdYa/GOxBweWn/dr8Hv3/dEjROt2olcIUTJuRtdq3GX9PWwBscFA9AXJ4wj0XNYVb5APsO2IBltYPKs0h0KazWyguTUUoDYs+9qiPx0qRhAAMecOZ+pF8EgnxoQdbsb6agZjI96dlfUHSNeMoJys4mBIBDH1IOUxRuEWzxpY6Sen8rrJFmOAXaj54HdyO0U4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=537Jx6hLcgW7UEtIl1sTrmG4xLnFVsOut3XLVD0rPaA=;
 b=lfLbnep/x5xWrahOVvLl86My06CyORcUFiIFcFKhCFSRkpxnrqr36j8bbGm8sQpGgo/lL0KNsoDyNHDm0c7SyrgaIlfaWyIiWW7lLMfFXVx2NXUyJyVzTzwjp3Dp/MkUxyl5Qb0Xws4bdDVqklzO6N/sDhhO00KCgozPyvdJQCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by SN7PR12MB8129.namprd12.prod.outlook.com (2603:10b6:806:323::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 09:39:13 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 09:39:13 +0000
Message-ID: <db601a8f-6486-48df-928e-b398f8d4fcc0@amd.com>
Date: Mon, 12 Jan 2026 10:39:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: zynqmp: Fix DTOVL warning about graphs in kv/kr260
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <b484e81c1723fb21530c4f95deb70f3b0b61ada9.1767860657.git.michal.simek@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <b484e81c1723fb21530c4f95deb70f3b0b61ada9.1767860657.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8P220CA0040.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::15) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|SN7PR12MB8129:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d76f869-8125-42eb-4464-08de51be71e0
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajlhOTJwUlV1cEFxODFUMVRMOEp5Zi82bjJaekhDNmNXTDBBdUJaOU5LdVRa?=
 =?utf-8?B?YjV3bkhORWltUUJHK1lMNEpQWDhZZ0t6dm00WGQrQko2ZTU0bTU0MnFmMmRk?=
 =?utf-8?B?QzA0SkIxRkl0SGtnNkxmN3ZkUzk2d1ZoSUh6d3NVbCtMOGt1SDJ6ZXh2Snc1?=
 =?utf-8?B?ekZNcGEzR2c2UGxnRTAzTWJDaHVIdEpvdGw1eW5EcG9IMlcxTVhjMXVHR0da?=
 =?utf-8?B?QXdkUVNXVGx4NC92QW8wWStDeW4ydGFZemlqZGdNSzY4VzljbkhoVTlhSXdT?=
 =?utf-8?B?eTAyNnYrUFJyT1ZuZWdJN29pWnV4ZCtLY1VmUGRkTHBmQnNBRDRhaE50dUZu?=
 =?utf-8?B?SGJac0VKbTFONlBLdlcrYk42TjUyeHVHLzh5Z2RRS2EzWUsyM1FCNWI2SDNl?=
 =?utf-8?B?YkxMUkdSVVNtMTczc1EzbzN4QUZZeHRmdUY2NVQ3K1FwNGxQUlR4TUhqRjQ1?=
 =?utf-8?B?TzFVVkk0aThRM3Mwc1VaeTRYc0NWTmtwUWthNUVkVzhsZFB5cTZNY0xWMkw3?=
 =?utf-8?B?K3JZSVZZSGpXMEtralNydFpHM0kzcnJTQ0ZsNE9ralNFbzlIRC9yRGVEUnpC?=
 =?utf-8?B?TkNYQnlvWFJuYVZzazZJc3RRZmFHWksrQ3JoekxWUW95R3pDVnBmTHI0K3Jq?=
 =?utf-8?B?TG9XRDUwaHJZZUNrNEQ0YnJ0ZkVMNGdkUm1BTXVPSDZBQUlzbTVlRkMwbjVM?=
 =?utf-8?B?UGZScTBVV3R3VFIxUklFSERUUnlFRUJpRW9YWE5kSmx3bW9MUVVEVHBYeDJp?=
 =?utf-8?B?dkU2emdlUmxYYzhWYzZtYUkwT2xxUEY2MGhoUWlnUlNySE5iWmJOOHpsOU9j?=
 =?utf-8?B?TWNMRXI0OEtKTkFvcTdNQVVyK3o3c3lGTW5hY21HLzBMMVRIQWxTcWFqZXJJ?=
 =?utf-8?B?bU45Y1VMRU5keGNhNEtGOFQvSmV2TzluMWRVS1lxTTRROGpneXA0eUxlRVJy?=
 =?utf-8?B?cGYvdTVtZGt0VmhOTFpjVEM3Rjhnc01kMGl2eDBteWxEd3pBczJTU2tRd1Ri?=
 =?utf-8?B?R1VQWTJYVWZZTEpKbmpmYkxyeE5jUDRQeUVPRE1FcUwzamVYWk9jWHI3dmd4?=
 =?utf-8?B?MXgwRFBVN0s0OUsyRk0yOFVVZGgvN0Jsbko1S1FZYWx4UzRpM2hrUTZLTTVE?=
 =?utf-8?B?Ym10aU1EbERCdkZ6REhYSUhQKzQ1eDZ6Z3Y2SE9xTjNQd3I0bEVKdm9ONjRo?=
 =?utf-8?B?MVVPYjAxNTdpZC82amtZTDNQcTlUdVN6K283OTR2d3R1Nk0vQjNFS3o5N3gx?=
 =?utf-8?B?Y21MeWNSNUFXNnJXSjJGRVExcjAzeEhzblpNVytlS2poS1hzbVRYU2V1a1Ry?=
 =?utf-8?B?aVZYaUcyTlgzUUQ5OUx2T1pYalF3YmwvVGt5WXUzV2NBNXlDYjY5VVpUZ3VM?=
 =?utf-8?B?ck9YaWtIbnRTeGtvL01udy9YVGRwQUZFN0xPMXFZMzBLL0lObzRiQmdzNXhM?=
 =?utf-8?B?NmxYYmU1QlFrby9IYUhIRm1JZkpjaUhqRW1yYWN5aU9NelhWL0NpUzhFSVpE?=
 =?utf-8?B?V1Fub2xpMnkxL0ttVWljWVR6ZEJsdVJZTWdJSUo0ZytIK0dDd1o1MVhDekty?=
 =?utf-8?B?N0FKMkVpNU5FQkk3TW5hWko0VzBvNVUrZUV6R3RrdmR2Qm11bjMxNmdLL0Vo?=
 =?utf-8?B?ZGRIcE1SRlY3dHh0UmZFZFIwbkg5aU5ZWHVqd1NlQTlseE9ySlVzVXBFQWtn?=
 =?utf-8?B?Q3poVEhkNEU3N1J4YW5WLzlKRTZ4dk8vWjRmaVZSV3IrVGhadVlvOHBPS3pK?=
 =?utf-8?B?ZlZHM2pycUw1NXdiYytzR3liYTdzZTZwZktNQzNuaWc5ZEJZSUdOcStQRUZa?=
 =?utf-8?B?TkxLNFFvTmtYalRJSWxkNzd0VFpUUWlsemsyWkl6T3N2VThLZnA5QVNvVjJ0?=
 =?utf-8?B?Z0ljY0l4Z1NJNEhscFB3WGhEbXRodlZuaDJjN3hoM0o4Vnd0SVEyR3E2RUlh?=
 =?utf-8?Q?nUFncVZM+Yk0jiZY6NUP+uIqhBImWfjO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0VNSjAzSTM5QVdlMXJ4TWRDSll4Y2M3YU5RN1dtR0xxcTBidEJENXJZTkh6?=
 =?utf-8?B?ZmtZL1B5UkVKSjhLbmx2c05SN0QwVlorUS9Gc3FwNW1UREd6NEFydHpvL3l2?=
 =?utf-8?B?WGhtem1zSDlxcWVtWFZMSTExOHpJeHB6dXliTVhmYnV4anZRYy8vWmpZWksv?=
 =?utf-8?B?SzJ2bXFSeFU1TlR2M1NTZzNEaXVrUkdKbjlaWS90eVBxZ2NMazZtdG1OMjNv?=
 =?utf-8?B?RFlJOW1RUkZoaHdzN20yL3JXbGF4dU01bDRUOXBGRW93Z2EvYVFUUHdZTW9D?=
 =?utf-8?B?L0dmaFNmendEVmRIS0ZqRUo3Q28yR1BtZU5UYWttc3FkOXJCWm9vYnMyYzB0?=
 =?utf-8?B?ME5WbkczelQ3ekJ3Q0pLVzBnd1AxdDlCSjBYL1FVUXdTL24xbUxUc0Z0N0xR?=
 =?utf-8?B?dlZlYlcwTFBWUi9iNzlQbXpsNVRpSGpGQng0YmVjVUxVbEMvQUZtTm50bi9G?=
 =?utf-8?B?Sm1WVWFtVTRhRENpRXVodzFNNGJuYWw0eXNjeFhLSCsrTEMwZE4rOEFLaTJq?=
 =?utf-8?B?YVZGS0YyN1h0aEhETXAvTFlKUVl2ZzlqRTRCVytPYmM0MU5RQ01uMkhPSWRJ?=
 =?utf-8?B?REdsLzluZkhEL1JSV3Z4aFBjRDN1MGJPYkc2cnVpUE14VitSQnZOZ21iMWZT?=
 =?utf-8?B?M2xWNXdCZkcrQ29IN0NWYkVzcTE3L2YvcEhncXRSdVBaVVQ2eDFNcXYxQlJR?=
 =?utf-8?B?akp3TXlEM2x2dndJd25sd1VWb0hXM0pDYm8vY2wxYzNqWlVPUXc2SEdSbzg5?=
 =?utf-8?B?MGZGV29QRjYzZGRqL0UrSG1vclNmblAvclFORHJuQWpjeTZpSjJzT25TVHhw?=
 =?utf-8?B?T1JzRlUwL2cwdjczY1U0QTJsbmcvTUlvaGFxbmdaa1dpN1I4ZWc5aUlmbEti?=
 =?utf-8?B?K2I5NXZXZ2lCVi9BKzU4Vzd0Zm1MUGVJaFNtSTA5WGhtY2tmMkVvbmV6SnhN?=
 =?utf-8?B?OXJxQitsaFpiTlZjbFVYbXdRWHo0L3JEL0R5QUZNdFg5RU05SlNLUWFhdXp3?=
 =?utf-8?B?QU1rZSt5b1Y2WmF1R3J0angzK0JuNWNCNE9zWno0THQ1cmdVS1FnTE1STDZz?=
 =?utf-8?B?SjhCMnZWV1crdE1ndFl0emVpRUFEL2RkZi9FTC9TRWRXM3VZbFdZVGVSQ2pp?=
 =?utf-8?B?aXl2eXRpazJUSEdxRFJTblRpLzVyaUMxRXRnRmpKSGJPY1JTaWJVTXpDMFM1?=
 =?utf-8?B?dTV0bWdBYllWUEFDY3VXK3NGUUNjbExteE1hUmlHSVZvaGFLVlB3djNvN3hH?=
 =?utf-8?B?Q0lpVmNUZTVuckdHV1lyem9SWjhSN3pTWGh3NEhzM2E1dC9lSFBua2RnaWZx?=
 =?utf-8?B?N2s3MGNaazdOcm1XQWN0enhxdHJDMUcxcCttbk44T1dkOHRsQVQ5cDlFR2pE?=
 =?utf-8?B?MkgwRmRNUzh0RmN6L241NGhZdTBjdzk0bEl3KzEvV1NkZUxOaTd2Zmo2UmFM?=
 =?utf-8?B?a2k1UkZEYXFHa2JrQTB1d2xVTmVyUnUwaXlSK2tMak1FdTZzeUpTajA5Q0xM?=
 =?utf-8?B?MVMzZ3h3VFhMZGdKN0xRc1V0NnpLUUlsN3VZZ0ZsdXlSM3J0M0dBVWE3OTRL?=
 =?utf-8?B?ZVlTSWlsY0FaYTB0RnNDSWNzajdkUC9peGR5NFlFSkQzZ3RNTjVabmV4TUVp?=
 =?utf-8?B?Qjl2bGZ0cmwyZzRiZmsvVUlFUDU5d0Z2dGhsS2pDd1BLdEVGQkdoU1cwdkdC?=
 =?utf-8?B?R1gxMjNIM1RCS3RHK2g5UjNJS0xvaGk5YnpEaDBWQkRBclFqQ2RzZ2cwcEVk?=
 =?utf-8?B?MTlzdGZpZk43bi9HNzZjTE9NcDZUMjhvWllQZzI5NVFJZlZvbmdoNWx4dlc5?=
 =?utf-8?B?MWh6TmNyVlRST2IxcmxiL251Y0wvZ0kzZHo3eGJiMXJDUFpmZFQ0eU1rdzBD?=
 =?utf-8?B?dkt5bnl0OWJQK2ZXNzlwRCtiMzcxcFRzcndyRFJJNmg2UUVYZk4yOUVDNkJP?=
 =?utf-8?B?Qk1hZUVMRnZya1hzaDRJSFhyeWoyakZjVFFualB5UHd1R2FydVQzbUJmUSta?=
 =?utf-8?B?RndWZGEyc2pkdWViWWFsYUZTS3pxYkxmRkxjVFplbS9zb0JBZVZGdTdiMjVx?=
 =?utf-8?B?aXNkZ1MxQUl3NlFoSDJUWTk5QkFxVmFLTHYvZlRlL01TQXZ4L0pza2F5VmZr?=
 =?utf-8?B?WVRVVE5iemdlVThRY3gybEJuR1BaMzdDOVBDdlNWWlY1RHN1VmRKT0JXc05E?=
 =?utf-8?B?SjBxVEVXSXR2ellRcWs1cXU5S2xWRFp5ZHplbXVYT01NTElZQjlXYS93aUVB?=
 =?utf-8?B?QS8ycWZudTMxTkdubWIxTGtzNVNraEJYZ0dQWUxKTkNQMDcwYTNvZXFEK0tu?=
 =?utf-8?B?d29IbTRoRWlCMTBxR1hLRDZPK2NWYzlFZGI2cVJnYXY2YSsxVjloZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d76f869-8125-42eb-4464-08de51be71e0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 09:39:13.0512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVc4nsJx5DRgOq3n1Qj04cMV5/5Fm8WX1H2TdBLyl1rLkf2xCT+at8XJZCp9eQem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_013920_489850_3552B7B0 
X-CRM114-Status: GOOD (  14.95  )
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



On 1/8/26 09:24, Michal Simek wrote:
> DTC is generating warnings about missing port like:
> DTOVL   arch/arm/dts/zynqmp-smk-k24-revA-sck-kv-g-revB.dtb
>   arch/arm/dts/zynqmp-sck-kv-g-revA.dtbo: Warning (graph_port):
>   /fragment@5/__overlay__: graph port node name should be 'port'
> ...
> 
> That's why change description and add it directly to dpsub mode to contain
> full description with also port.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso | 10 ++++++----
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso | 10 ++++++----
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso | 12 +++++++-----
>   arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso | 12 +++++++-----
>   4 files changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
> index b82a056be2f9..507be24e71c0 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso
> @@ -147,11 +147,13 @@ &zynqmp_dpsub {
>   	phy-names = "dp-phy0";
>   	phys = <&psgtr 1 PHY_TYPE_DP 0 1>;
>   	assigned-clock-rates = <27000000>, <25000000>, <300000000>;
> -};
>   
> -&out_dp {
> -	dpsub_dp_out: endpoint {
> -		remote-endpoint = <&dpcon_in>;
> +	ports {
> +		out_dp: port@5 {
> +			dpsub_dp_out: endpoint {
> +				remote-endpoint = <&dpcon_in>;
> +			};
> +		};
>   	};
>   };
>   
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
> index 4dcf92a2158f..68394f02e8fb 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso
> @@ -148,11 +148,13 @@ &zynqmp_dpsub {
>   	phy-names = "dp-phy0";
>   	phys = <&psgtr 1 PHY_TYPE_DP 0 1>;
>   	assigned-clock-rates = <27000000>, <25000000>, <300000000>;
> -};
>   
> -&out_dp {
> -	dpsub_dp_out: endpoint {
> -		remote-endpoint = <&dpcon_in>;
> +	ports {
> +		out_dp: port@5 {
> +			dpsub_dp_out: endpoint {
> +				remote-endpoint = <&dpcon_in>;
> +			};
> +		};
>   	};
>   };
>   
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
> index 923a70d750bf..e7417af8ae01 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso
> @@ -3,7 +3,7 @@
>    * dts file for KV260 revA Carrier Card
>    *
>    * (C) Copyright 2020 - 2022, Xilinx, Inc.
> - * (C) Copyright 2022 - 2023, Advanced Micro Devices, Inc.
> + * (C) Copyright 2022 - 2025, Advanced Micro Devices, Inc.
>    *
>    * SD level shifter:
>    * "A" - A01 board un-modified (NXP)
> @@ -125,11 +125,13 @@ &zynqmp_dpsub {
>   	phy-names = "dp-phy0", "dp-phy1";
>   	phys = <&psgtr 1 PHY_TYPE_DP 0 0>, <&psgtr 0 PHY_TYPE_DP 1 0>;
>   	assigned-clock-rates = <27000000>, <25000000>, <300000000>;
> -};
>   
> -&out_dp {
> -	dpsub_dp_out: endpoint {
> -		remote-endpoint = <&dpcon_in>;
> +	ports {
> +		out_dp: port@5 {
> +			dpsub_dp_out: endpoint {
> +				remote-endpoint = <&dpcon_in>;
> +			};
> +		};
>   	};
>   };
>   
> diff --git a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
> index 563e750b0e08..7a05180e58b4 100644
> --- a/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
> +++ b/arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso
> @@ -3,7 +3,7 @@
>    * dts file for KV260 revA Carrier Card
>    *
>    * (C) Copyright 2020 - 2022, Xilinx, Inc.
> - * (C) Copyright 2022 - 2023, Advanced Micro Devices, Inc.
> + * (C) Copyright 2022 - 2025, Advanced Micro Devices, Inc.
>    *
>    * Michal Simek <michal.simek@amd.com>
>    */
> @@ -110,11 +110,13 @@ &zynqmp_dpsub {
>   	phy-names = "dp-phy0", "dp-phy1";
>   	phys = <&psgtr 1 PHY_TYPE_DP 0 0>, <&psgtr 0 PHY_TYPE_DP 1 0>;
>   	assigned-clock-rates = <27000000>, <25000000>, <300000000>;
> -};
>   
> -&out_dp {
> -	dpsub_dp_out: endpoint {
> -		remote-endpoint = <&dpcon_in>;
> +	ports {
> +		out_dp: port@5 {
> +			dpsub_dp_out: endpoint {
> +				remote-endpoint = <&dpcon_in>;
> +			};
> +		};
>   	};
>   };
>   

This should be updated because it generates another warning that's why v2 is 
required.
M


