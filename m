Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C73BC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 21:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXuYCWpKz6o7vXZaJ2qy1cRAQw+2vbTJMOnPxlpYevI=; b=FMPFn5K55hmVUUzn0cQgz06Wkm
	n5biQeOViQRrPSqTmmO3hCLUjaR80Q6orW0jDvfn27mEy25hbNdhzrys1ME6YqB7QTlA49T3f/NSX
	PjYuZoZbMGiqncZaB1zSq6z9B3Hke9g2pTEoeHz/RgDcI4R3SbejEozQALmT9+h7yYHcpTqvBlDXF
	yq+fEM6Op7k6Hrz+c2n+/nrGFT7sA0alBPa8ei0pumnDFUvl7T5B+v31QtkQOqqdA1BC/SqQo7CJt
	/L8LE1vwwm2Fyahy6huJ6b0VZ1YZbPLUEAaf97c4eR1HBAFdhJ2MCfGI/+IBiDDSVlbhp+3It/xLP
	FDx0j5UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrN3P-00000002qGN-3vxM;
	Tue, 04 Aug 2026 21:52:07 +0000
Received: from mail-northcentralusazon11022115.outbound.protection.outlook.com ([40.107.200.115] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrN3N-00000002qFp-2zZn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 21:52:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7U9Znp425YqvJmV4ZIb4Xe1PwTBP57B1RikZcU2K6kDRfDhmhd6tIKNybZh5YdiH0wYpIM29pV+ObcFlY2GsbRRqsi/CafccewZfUeKCW6ISl9xCoJyqpFcjp4rG1OomK9gi2UeJm6asRWJFMDtfybHiS8EFSBwUnWH4wUg2fTJqTrkBwXGlFUwsoXcgLpBIQ1L1L8VoAnJrWIJTeIQMIrp660+1SqPm0RZ+3xTAhierfTuhzlo0/NPWdWwNY7/38ksKOK0rjBEVR9IJ4pYctK9E0O+6c/ezppw8KiNZHJalX7gZZKXRNlXiXCSdt907bhBsFAmhJhmG9Tem2OytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXuYCWpKz6o7vXZaJ2qy1cRAQw+2vbTJMOnPxlpYevI=;
 b=vGhzQ6CgV7+w5h1MfuIqVtWjJrjGMz5lwpJa8p9fwL7xq4i6A49WGLN5z8Gv8amPCXvtdTDs0AwPnBAlaJLWQDdY4XmotzmmfvFbmcRczQ1eCq1HH+htwy8slXOpqX/xeGTNMvQCaC6DInwPQGKeDDVPZ/Q0ymwM0wFfbyxXaIu7GEFxB6OJX+WzpfxSZIOki2hjJztpT+EccwTFfvyotoFkJ4NqD5VNlAiyqUoaZ5OG7HwyeCdV9Z6oR7xHrioZ8mEyuIs5nu5czYL99mXcNi1qIwfQewdNXGoceuqtoJ9LjYTwLUaF67MHmlKPbIiMUSizzHNLBT+WA4098cA9mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXuYCWpKz6o7vXZaJ2qy1cRAQw+2vbTJMOnPxlpYevI=;
 b=lOdisEvmDmTyn4ZndgqMkSkyG9b8wMVBxYV3XOcAnD0ajj23OzhBVZLUc80kYh9nP8hpqAEnEZAoYGc+4hiYyEu1m80l0GtBiVry7moZ1anMEgmmop4yVL4hQc7zI8AsBuuIwELMLdszn6UBKiRmC4JrKYhPrRALZpre5IZtNp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 LV5PR01MB9419.prod.exchangelabs.com (2603:10b6:408:301::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.15; Tue, 4 Aug 2026 21:51:58 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::46eb:64a3:667c:c1a0%3]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 21:51:58 +0000
Message-ID: <69f4cd9c-bd6c-4e5d-b8d1-a7be8408a57a@os.amperecomputing.com>
Date: Tue, 4 Aug 2026 14:51:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
 dennis@kernel.org, tj@kernel.org, urezki@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com>
 <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
 <amCPBrdltFSE_fEf@J2N7QTR9R3>
 <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org> <anHuLy52o5S9Nlwp@lucifer>
 <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com>
 <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org>
 <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com>
 <anIXr4Kbn59Ac31Y@lucifer>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <anIXr4Kbn59Ac31Y@lucifer>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P221CA0050.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::13) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|LV5PR01MB9419:EE_
X-MS-Office365-Filtering-Correlation-Id: d67f5c34-5e8d-4e06-3fdf-08def2729b45
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|10067099003|56012099006|55112099003|18002099003|22082099003|3023799007|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: pFIjMl8ubaYULAUtpBiv8MSkc8DgMAm79oazFWnE7KIKT+QrPADyEc/5WE5LVJJSX7meAS/Gb9aJ1EptUKI6Fomq3akIOtH66U0TjGxA9RDgCkUcJ3CWnJ6gIfYXKSwhQHalvWfEX8ppSCO3fKzZa3s8EL7eOeJ+COYSpA6gWsp7PJfd5ve1F0IyJazRREdINFsDJRaVq3W2A5tSt6kA0t5u7FkdvJxEk5RKsX0GdEEm5w7wY1DLGFKxtBPJ9OyqhW0qKYHmFr+tiYkO3no55nb1E6Yz+B+ZDyeHF9ac1m2+BXWaAfGhNb0wO6a7sjzc1tVCKsDiLrKhytd4FO75E6sD8jWGT29GSLkbmq5L4ytw5zmsqkGRG/jP1pO53eMZxPl2gFLI+oS0wVrcrBX4zt3+EH1W+TQETXsByUFMY000XEDXFlzF1IgXm1YPNVbzF5BsZCF3W0bp7XFah3DuTCV0d1VLGQoYYR8FoqROuJqbpWFBerV1jcv/IuNMLiGUHGdnjfOTUylpLi7QGJFZmXBKJ80Sz8t+TjnwhMm50frPKd4rVaIzm8xtc8ORRW1KlFbklkBixuirXBxSwxnWVPSg7j/Qlf+bTAAHXeZCXGJr8B+4EBFo1kVVcxkbvSqU6c/G5j6qQZvx0fxjW2GWRtj+p7D3EXnJ2wLoHqJXIts=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(10067099003)(56012099006)(55112099003)(18002099003)(22082099003)(3023799007)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V05RM1FNOUcxK2ROeHh2cFd2aWp6MG5kcWsrc0d1MTdORFZ4NEJISjFpSTB3?=
 =?utf-8?B?bVdHbnFPcXBnQU5WNHFsWGI5SWJrWjEyM2ZEdEVpY3FyR1BzeVRwWTRSR0Rk?=
 =?utf-8?B?aFZHR1JjUlhrbGtaeW91Q2JiWit0b0JhZHRWclk0dEswQlA1QkMxaTNRQkkr?=
 =?utf-8?B?M0JsWGZwSnhXM1lBQ2szK2pBZjF0UWMzU3NXUWF1eWVnNFRyZVJyT3JmbHo0?=
 =?utf-8?B?MGg4QWduajdKYVl3bFJIWXJPKzU3OUNzR3pSTHBmS1lLRXRDdUpmUnJmc3M4?=
 =?utf-8?B?cGM5amJkRUdlWHJ0V0FpRXhJZVQ4OTU3c0srYytLNS9TUDVLaXlYZGlaZTZ3?=
 =?utf-8?B?NkdkWnI0R3c0TFRsWWRsR1VUbXlNeUE3d0RZOW8vNUpuSFBaRU5TdGxHYkRN?=
 =?utf-8?B?SERDWDA4dnp2TWVzZlIyQkdtOHBEUExNenZFeU93a0dYNlQ1YS9GU3dIRXA4?=
 =?utf-8?B?ZksvUTdiV29ocVVUaHN6OVovUFMzNTBrVlZQaG9HZHJwNmRFODBlajhPRkc0?=
 =?utf-8?B?dlVHT05QaGY3R1NRM0QwRzdQRkFvTzNPOW9WT0VpUjR0S2gxZkRiM1czenF5?=
 =?utf-8?B?ZmUvRmNTLzZFcUtJSWJLTFdWR1N3cXh1alpXY3JBSDA5NW5uSzE1SjNKVUV5?=
 =?utf-8?B?ektWMnB2c0Z3OWtxT2xhWVA5RVVBMTlsdTl0bUxRbHgvOUlxbXd5Q2xqanR6?=
 =?utf-8?B?c0FVdXg3Y2QyU1YvSW96UXVZd0JUTDErODUwVVlMaVJrbzBWeFBaRHhVekhl?=
 =?utf-8?B?MTFUVGdJZ0Z4OUhWWEpkanRBa0diT1dRaFdPNmQxSEtXMUdGWlQwMUNDc0lI?=
 =?utf-8?B?SmdySXEwNytzaHpCQVplN25Wa0JoY2R0Mm1ZOEhKU2VHeTdNdk5kN1Vib2NX?=
 =?utf-8?B?ZHVmU2s4bDVnSmNGQk1Ld3pZUGQ4T0dlY3ZSOUJPN1BLMVUvT1dXbUt1SEtL?=
 =?utf-8?B?Z1Mvd1h6dTR4ZTZZZVd6bGhMZjFyZzE0RXFTRVp4c1IzZGZrdkVPemRxdWlY?=
 =?utf-8?B?UEg0OHdVNTJRTHdQMjdYU3hvdFFqK253MkR0NFBKMktDdUNWSkNNVU1raGsv?=
 =?utf-8?B?WmtLaFU2dXFzRlNiVitPdm1wZUcxWUxydkJIU3NkcVZnemIrdmpPb3craHF0?=
 =?utf-8?B?QVMrRUxXOEhjQjRpOFE1eVpxMVdsREVBMS9oSHRqVmFKb0VvN3kvS1VESmtK?=
 =?utf-8?B?WGk0OTA0eUttczdoRzRMTVNtRVphUVRSNVdMZDVtZTc0cXFmRVNUaURsa2k3?=
 =?utf-8?B?MWxJQW85YTFMdkhjdURDTk1NdDFxeEFJR3dHVGZjMDlBRXBlU3Z4aHRBeVpS?=
 =?utf-8?B?VENqN2JTNEhXYWlyaFkwS25zRHpGQkVVOWNDUEZWeFFjTVhIckJQNm52QW5v?=
 =?utf-8?B?ZmdsS0RsRnZBaVBkcURoTjlkSG1pbEZ2aUhUWmRoUjByN20vakMwaWV0NGxi?=
 =?utf-8?B?b1VING9GZlJNTmszbXBWdEpqUVE5SldHUWNtWWdaYTFBb3E5QlZ2VFBqM2lW?=
 =?utf-8?B?cXFCOVFUSU93VXpLd2VnSklUd2RGdytOU0hnaUxWR21nRHZycm5NOFhGRTEz?=
 =?utf-8?B?SGxUSjZqT01qSHZzb2REZmtZUFI5d205cFhjZURCOERrRjNaNXd5VWxwOGhF?=
 =?utf-8?B?UXpXcWlRcWgyVVJDTmZXWFFpSVNFeUN2dE9NV09uQ1JRdzZBMHR1clBvQ2Na?=
 =?utf-8?B?TjEvbWhpOFdhOTVrZGZzeVpPNlV2STVLcW05YmkvM0UrVDZySXpGUDFSQ0U1?=
 =?utf-8?B?WlVzejZNWmRySVFuMFB3MVNNRUFYb2RNZU5aU0c1Ky9yc0p6bitqb2xxOHZ1?=
 =?utf-8?B?NFFHK1pOdFlSczV3R2JKc0ZtbVY1L0ZwNVNoLzY3Mm5GS3M3Q0ZvaEhsZGZy?=
 =?utf-8?B?L3VaUnA5RDhpNzVxMWVVb0cwSkIwOFRGL1JvNUM4OXdicXVRVmlPeHpsWGdC?=
 =?utf-8?B?NmVvL1FZbXVMU2xhSG9scFZoTmlmbG5WRTZhVDYwaXYvd0JLQytKRW5PeUlO?=
 =?utf-8?B?T0JmTURpbnNTdGpCZUEwWCthUXZ3WVIzTU5ZM1dyQmwrTE1Fd0RpV0JQbmpH?=
 =?utf-8?B?bWZSWnQvMElmSzY0cnllVnZrVzhMVWhybGdEamNBTEtJeVRlamNRMUpNVFVu?=
 =?utf-8?B?RGJab2kwVkxlcVZGbEduODRlQ3ZXNW4rOVQ2a1ZJaEtSYloxNDVaUjZWUyti?=
 =?utf-8?B?MzRwVk9RMkNpRW10aWh5OVNhVlpWYkhYdXZkSWt5OWdrOXRCOE02Q0k5eWh1?=
 =?utf-8?B?UTV0R0lMbWdlRFdKblhlNTBrRDhCZE9KcUVXSytHLzNUV285S2tWYjJPY2RC?=
 =?utf-8?B?OTZkaWtiR2pQSVVYWDNMNk5VZllMMFUzYjh0NThzRWxvV25NSkxmSDVGa3hy?=
 =?utf-8?Q?QLoTJR/YNpIjI9zA=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d67f5c34-5e8d-4e06-3fdf-08def2729b45
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 21:51:57.9959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IzCFkBoHGC7+WQmSiT6H36Y0I/8JcLyUzP5c+HAWaME6uiloARfCFUJQWy22F1JNMseMBBKKrrNBiCHWEublOZGv0sU8drf5eylWuwJHFYY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR01MB9419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_145205_788646_7E3BCA13 
X-CRM114-Status: GOOD (  35.34  )
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



On 8/4/26 10:23 AM, Lorenzo Stoakes (ARM) wrote:
> On Tue, Aug 04, 2026 at 09:30:08AM -0700, Linus Torvalds wrote:
>> On Tue, 4 Aug 2026 at 09:27, Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
>>> We certainly do not want to replicate that approach. We are using the per
>>> cpu page tables to avoid address calculations in the VM that other
>>> platforms can do with a segment override.
>> Right, and I said that that's ok as long as it's a internal
>> architecture thing. Not a "this is how the VM works".
>>
>> Because people really have wanted to make it a "this is how the VM
>> works" thing. And that is very much what I object to.
> Well :) it fundamentally changes how mm works - now we have a whole new set of
> kernel page tables and PGD's that we have to think about.
>
> And the series either tries to hack changes that fundamentally alter how
> vmalloc works or will add its own duplicative kernel page table code to do the
> same kind of thing.

I don't think this series fundamentally alter how vmalloc works IMHO. 
vmalloc still works in the same way and the page tables share the same 
contents (except local percpu area), it just needs to sync up kernel 
page tables when the top level is changed. This is not new, x86 has been 
doing so for years, see arch_sync_kernel_mappings(). The patch just 
added the implementation for arm64.

>
> So now core mm has to worry about TLB coherency and synchronisation, how this
> might interact with things like page table isolation, and a lot of other
> headaches (and I'm not really convinced they've been thought through here).

I don't think this series changed how TLB is sync'ed either. When we 
invalidate TLB entries for kernel (i.e. vmalloc area), the TLBI is sent 
to all CPUs, it is unchanged.

The series does change how percpu area is setup for ARM64, but this is 
already sort of architecture dependent.

>
> IOW - breaking fundamental assumptions about kernel page tables is inherently a
> whole-VM change (See [0] for instance for an example of what can go wrong).
>
> If Christoph + Yang can provide compelling data that advocates for this change
> AND the core mm and arm64 communities agree to move forward with this, then
> things are different.

We shared some benchmark data in the cover letter. Kernel build is a 
quite common benchmark used by kernel developers. Specjbb and MySQL 
benchmark results are considered important benchmarks as well. I wish I 
could run benchmark on more ARM64 cpus from other vendors, but I do have 
limited access to other hardware.

>
> However, I think the best approach here is to find the least invasive way of
> limiting the change to the architecture itself.
>
> Mark has put forward an approach that eliminates the exact overhead that this
> series aims to address but does so without having to fundamentally alter core
> mm assumptions (v2 posted at [1]).
>
> So that seems very clearly to be a better alternative to me.
>
> Ultimately we need mm and arm64 maintainer agreement on the way forwards (or in
> the case of a truly isolated arm64 solution, arm64 maintainer agreement).
>
> The LSF session was not encouraging ([2]) and as an mm maintainer I'm not at all
> happy with this myself, nor does the arm64 community seem all that enthused so I
> would against gently suggest to Christoph to be a little more open-minded about
> the the proposed alternative which he seems to have dismissed out of hand.

Nobody disagreed Mark's approach also achieved good result, we just 
thought the series can do better. I agree there is always trade off 
between gain and cost, this is why we are seeking more usecases although 
there are different opinions.

Thanks,
Yang

>
>>                Linus
> --
> Cheers, Lorenzo
>
> [0]:https://lore.kernel.org/linux-mm/20260723-series-vmap-race-fix-v6-0-8cc77dcc0018@kernel.org/
> [1]:https://lore.kernel.org/linux-arm-kernel/20260804170503.3513916-1-mark.rutland@arm.com/
> [2]:https://lwn.net/Articles/1073395/


