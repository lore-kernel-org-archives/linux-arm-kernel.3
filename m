Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35536CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 14:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tahsPdcHCKKg/i9fnusVY9tzzlk4YRJ/+PiYsoL8v04=; b=o0sUeGAY2UHZdaPXDcvljIWGcR
	jNx3jH/gY2LFxG9osZwtAA70gc5HNfWri5bfwWn9rijieF9j3T2LNa3s5LsXRl/tzGzKX1mVrqYyZ
	eJouTiolU6kZINAPa4pp1Vfxo6vkKsOy2MsysmBdbnSXEWYz9WwKZJc3gS56O9NvXvNdFP+GapASj
	MObAriSKbq4zoWaU5EPiuWeOO3a6QvdYn/f1rpFviKSwJHCtxfezynhenuSF6hShFBT9qZC5GOuoz
	//hEOrlgkRIx6OTFiU1EEbCLsw82MoTXLFEbpIDUnw+4e39l+JDx6s8X8kS1MNUGaqKTUcE0IOjDn
	TzdTr6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXg5H-00000009Zdz-0pSG;
	Thu, 11 Jun 2026 14:08:39 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXg5E-00000009ZdL-3Fty
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 14:08:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/PHRYf5QxqTf+2DzcqUdholfA9LnDCR3loM65nZDABqxy6lMV/k/Ux4m71dcfO0IaMpck3He+Xj5CaTWSED0b7wWelb0Xsqg3IGyJuHaXdG/ruKk8u/p4KvRxpV+wVTwALDFxjZb/kuMqkvGIeBTz6q8lVE7aQIrwDO5hwgqHrIJGS5uN2YK6Ti5NSDjBtrVOf3Wbbr5rkNSmlXJ4X0Bj0Uf/X+PwYMYiR/GkPENs6VR9NaEmySI6LuUzwEcbVFIn/Bcu232oifIOxdUO4iFRaGZgeMWTj8L9RyuRzRIpggBs1BiX2Ans4h2IgQaEEVlG3zWi4w60Ylx4j4rnYbzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tahsPdcHCKKg/i9fnusVY9tzzlk4YRJ/+PiYsoL8v04=;
 b=yD372Jpo4LtEimUsL0JHztn16POKqeiYywemZdwOq2wLkmZy090ITP4eutTYz1oh3aVN/dEPA+hu9G+eebOthp5ybONQOw8WXPI1PHiat1zoRV64/oqS/+FxccYt6p/DWaWvVkW8zD0+wHBfRckDy8grgQlbAws2SAKPSRBz0AmG4uHBcRJhe5PJoAyvktUGfbQoH6+SZ1J+l0dELC3VmoaUPVs7eeG9KRqe12v8QwLSAzvC9hK9TmX3rTffGNil5udMfdXGvEJ9l7SBQODzOIt3EvAXiL5ddLvu1HMzRtcwcGVUXdTp7iNSAMVNTCwRsFaAyWPWWtJ7j/l65qZcTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tahsPdcHCKKg/i9fnusVY9tzzlk4YRJ/+PiYsoL8v04=;
 b=WD9789y6u7OJjdzYuMqf1ZwCCofIBz7JiBZakccvAGjKcBjwFpz2yfxRftqzqgir9MUyHhDHQnEPsNYAt24ADYczx8PgMVWCOQytxFSbF3D9HjTahtENGNAfABnCMq0zBqUgyLFxpBh94Lb+A2vSaRejK/bu0uf5gZ6Lo4BLsepFiZygw3d++rdQb7Wj7Q4o7glWAQGkKHkQHJTzKQJhL7Xbxekgf/xpoqL0kiXznXbuN430ebOLpA1cMbxnI0M47PfQiyURY9E4Z9vvZgi7RPa1OY7t7gH6MX6v2M8vCv0Yki+DrENFqTHMnVSXUqatdNdlY0fx4AwHRZ+GlUQ8rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 by PH0PR12MB5608.namprd12.prod.outlook.com (2603:10b6:510:143::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 14:08:25 +0000
Received: from IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c]) by IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c%3]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 14:08:25 +0000
Message-ID: <aaad3692-74d5-4048-ac5c-ca47ef65c32d@nvidia.com>
Date: Thu, 11 Jun 2026 09:08:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Vladimir Murzin <vladimir.murzin@arm.com>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Vikram Sethi <vsethi@nvidia.com>, Jason Sequeira <jsequeira@nvidia.com>
References: <20260610164822.4157248-1-sdonthineni@nvidia.com>
 <aiq5VigmtZq9GlAm@willie-the-truck>
Content-Language: en-US
From: Shanker Donthineni <sdonthineni@nvidia.com>
In-Reply-To: <aiq5VigmtZq9GlAm@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:806:130::28) To IA1PR12MB6089.namprd12.prod.outlook.com
 (2603:10b6:208:3ef::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6089:EE_|PH0PR12MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: e69a758e-b155-4d3d-5755-08dec7c2e712
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: DVP8axl2FWHSR8s+wiyYl+s6VDk6BfZ2x2B4BRwhH2ZnVkV8qJUPS7QmD3Mue2GEwoRhLLqBcqS9gMY9jmaQa7OWMVVO7iSfTK92eaJJkfQ4W6986/yadBfC5NkFNUICM8nUcI/tAWu4hOHvPcE0jEHEjIB0oGtmN4QlSBdUOKF26parCodZVaFIO86BbsIG7yZkwAot71I/1U+VcNE+nRsm9v+f6Zn0HhNctCFMsg3zcpv5XM++u2QrPN7BA4jz2Mkl7NhBcD8ujOi0SmWkQxsA1M8hsmIcw8nKcJhA6Jy+T5O0l4MgmCGtJaPmZe35Gu9oAOHHD5RbDdTfQTfr6SLvUMaCgcQ+RdDO4O5ree0OmZZvnnsQ26ulF7eqFSMvNjBwoGG1rTmTQBU0yQcLvecJfdqXKtUa45oMkcEaPFQzn9EJ3OISci3JaFmjcqSZm0bKBwWLx0hT6iRhwOK+HzahpgSGABZ5dLcCFQiijp1ycfX0QVtoj+cELphTwTsAkGHQOyOV4/zJMdKSFzLVF3WOhDRSkwXNSkq/jxSyU4k/oDl1HnqGW+llNMOj5Xlj3fPd4w6Q5mWWdTwZcUjX7lIcQvgw+8ulyCYDc0a4Ekpp0acbkCbhGmE6g3+R0UyP1iHsEUD+r6fhG6JuGkQV6xR6OYNm0VrKKa1hkgP5j7yDdJIIyPLza6oKLS2Sorh2kXHEbI4Tx8K3s4tD9J5mMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWI4ZGdXRUFUeUoyOHdkWkg4WFJNdExDMmsvOEJNdnY4UGtpcnNFdmtTUnYx?=
 =?utf-8?B?c2tRRmpzYVNqckpBeFRQWmczSm5SeWExaW9tbk40ZTZBUEtCa0lRdmRkR2Rj?=
 =?utf-8?B?eFFPUHR0SGJTU3ZSMXRnVjBVelhnbTQ3V1F4ZnlHeUtoNlNIbEdLRmxiQ3Y5?=
 =?utf-8?B?dmEySDJ1WkpvamoraVJ2QWVpVWRBL2NBTS9CNWdFSzZXdlZiNUlZa2hES1Uw?=
 =?utf-8?B?ME5TK05tY2pwTWpGRkljU1JyNUNxRzBvRFlOSlowN3FqaGF0VG52RFZ0enFG?=
 =?utf-8?B?Rm4wMHlIQ1FmdmdCY0RvOHdkYXFsQVNWMXpFcWRpelJsc3pET0p5SGZCaW1y?=
 =?utf-8?B?MFNwS0tQNXJoVWlQcUZYS1gxcEJHMjVVMnVkeE9yalhKZ1AzK1B5c3Rhb2to?=
 =?utf-8?B?KzRPd3JFUmQxZGpVbGJtRzcwaFcyLzhHcFc1K280Q3d2OVgwVjBuR2VhV2R1?=
 =?utf-8?B?WXdYcFVJdWIwa1N2Z3ZuVkJ4UCtOeHJJVzUvWElkSENuM3MyRW41SVZ3dGdV?=
 =?utf-8?B?NzVGZlFDMnZDbEU3STE3UkY3eTI2VFRNRTFSb2pmcktYN0JrUkRsdkVzNlFr?=
 =?utf-8?B?Q1RiN1NSbVVXQkJjNTdoOFRUVUhFRDd5T1B5ek5YOEtzV0pxbkxlUzI4SHpJ?=
 =?utf-8?B?REk3YSthNm04MHdQUmNsRG9qK0JZRXVkdWRPSlk5a050NitNWVg0OWErUXhR?=
 =?utf-8?B?eGd1WlFuV0E0ZUhWNHd1NDVmVVNTUnZXeUIzeVhQWHJocWtBVmU2SFJnY2FP?=
 =?utf-8?B?aEVYdllRdjgxbVRNNHZTaFJNL09OUm9SL1diajY5TFp0MkdwK3NpVjRaSStI?=
 =?utf-8?B?K1dkaE9LbHlodjVZSm81TFdxYi9la05mRWc5UnR6dWxpSXFrYlptWUo1Qms5?=
 =?utf-8?B?SGJldU5aN2FqTXBqandHcHY5QVVGaGR5bjJDdnk1WGdQSVk1dFk1WjcxNEtw?=
 =?utf-8?B?aSttbVh6U3pMeW0ybHk5dHA5YXFENFZ4aWpZSlpwUmt4QTc5LzlxNHVPbjh1?=
 =?utf-8?B?RkhpdzFjTHlNMldwWmtTNjkyVU1KY3pRSkFETFQ3bGhGUjdZNzhvcDUya0FQ?=
 =?utf-8?B?VExCTzFvV1QvTFFhQW5FMWRBdkFtZ1N6SVNKQk51RmhFOUlIOGlZK3hmUWx1?=
 =?utf-8?B?MHVNeUpydE9KZlhCeis4ZTRXbm10YkxJbndncEkvejdRTkpSOWlvZmJpNmVY?=
 =?utf-8?B?cTgxbktJc1FacjBCakMrTGFKRVdCTk54SnVvc3o0MUg2NWVtNWZtUDAvb0dL?=
 =?utf-8?B?aU9MeHRWai84aDM0THg4TXdCWDF4bnVKMnVqTFk3L2Z2MU5Id2h3alAvVjRk?=
 =?utf-8?B?eFJFNlIxY0pDdkUxOXlyNldHR04xcTY5eDZ5bTNJQnhKYXRKakxscklSVDYv?=
 =?utf-8?B?eEsrZXl6MVUwYXVuRlBCS2M1QnRXUS9Yc3g5SEt2NGZwcHJaSVVrTGhlMU9M?=
 =?utf-8?B?cXNkVFMzNXgwNklMQWZrdWJKNTJ4Q1hCOGxsOEpWUlcrMjkySXhRbnZpK3RP?=
 =?utf-8?B?dzEzQlRiRTcyK0wwWWhCMkVYaXFGTXl2VnQvR000QWo2RC9ZakpHQXZReTFu?=
 =?utf-8?B?U29VNkdzc1BrMllMN1FwNVZjaHV2VmJNK1FHdXlrSWgzejhVbmt1eEpmMldN?=
 =?utf-8?B?ajNiTExCMmkzUGVkME80Z3BHTWtBZDMyK0lnbnI3QjU3NERNSUJMNThBYWZo?=
 =?utf-8?B?aHMyOXQ1S3NwZVJOejhRUW1LVy92dGV6Nk9lcjVFYWRrYStZZXhsTTJJamN1?=
 =?utf-8?B?ZWlWbDhVU3BkSWd3UmpIK2NDSDVxNVR5TnNYN3QrM3dIaXVKMHFOSWhGSHI3?=
 =?utf-8?B?OENMNmpYbThaOTF2WWdFdHJ3ZGhXS3RTMFJUYitmTERMVUUrak9kTDA4WkN0?=
 =?utf-8?B?NUF4cVR4T282aG50SERoRHFLUHRIa1BSQVVXNXo2WHEzZW5UNmhVZk5TS3ZN?=
 =?utf-8?B?SHJMMW0zYzJ4djZucDJjYlZudE9QY0R6VFZlNkkzRzM3RmJPTGV1TGxWZFNp?=
 =?utf-8?B?M2ZUdEo1cWg1RTI0a05MZzcrbEwrZDNxOXlLb2pUMGtpcm81eXhaUzZiMEF2?=
 =?utf-8?B?WDNWazVGcDNnY2RRSEZBV0dXQjN6TVNYaGdvVTREcU9ZVXh3VStPNHI2T1ZQ?=
 =?utf-8?B?U3V5Y1RYT0gxQWc0cWgrVFhFaFNWMm92dW1RdmR0a2lIRzc3eUI1cndKV0xa?=
 =?utf-8?B?QzhJQWgzQUZ2TU1QZXdlblJBWmxPbnZpMFh6djJEaG84aW13ZXlLVms1K3Js?=
 =?utf-8?B?YlZZMWJHY0V1MEg0VGpBa3FuQUlFbldvYTEyREFGM0ZMcWVDOG1EMzZhL1h3?=
 =?utf-8?B?QWd0d3gyUjhuRUZiZkhlelZZbTZXK3VVTjhOL0xzejRQcS9pZzA3UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e69a758e-b155-4d3d-5755-08dec7c2e712
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:08:25.0049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5OZvyhaIj9WJIMinaNbWWzekCxhVsKftAsb1qR2kfXOvhLpSq/F0tzoLkg8o/wcEodAjBOBuSKAedh5iTJDug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5608
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_070836_861526_C11C1C28 
X-CRM114-Status: GOOD (  26.42  )
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

Hi Will,

On 6/11/2026 8:34 AM, Will Deacon wrote:
> External email: Use caution opening links or attachments
>
>
> On Wed, Jun 10, 2026 at 11:48:22AM -0500, Shanker Donthineni wrote:
>> On systems with NVIDIA Olympus cores, a Device-nGnR* load can be
>> observed by a peripheral before an older, non-overlapping Device-nGnR*
>> store to the same peripheral. This breaks the program-order guarantee
>> that software expects for Device-nGnR* accesses and can leave a
>> peripheral in an incorrect state, as a load is observed before an
>> earlier store takes effect.
>>
>> The erratum can occur only when all of the following apply:
>>
>>    - A PE executes a Device-nGnR* store followed by a younger
>>      Device-nGnR* load.
>>    - The store is not a store-release.
>>    - The accesses target the same peripheral and do not overlap in bytes.
>>    - There is at most one intervening Device-nGnR* store in program
>>      order, and there are no intervening Device-nGnR* loads.
>>    - There is no DSB, and no DMB that orders loads, between the store and
>>      the load.
>>    - Specific micro-architectural and timing conditions occur.
>>
>> Promote the raw MMIO store helpers (__raw_writeb/w/l/q) from plain str*
>> to stlr* (Store-Release), which removes the "store is not a
>> store-release" condition for every device write the kernel issues.
>> Because writel() and writel_relaxed() are both built on __raw_writel()
>> in asm-generic/io.h, patching the raw variants covers both the
>> non-relaxed and relaxed APIs without touching the higher layers. Note
>> that writel()'s own barrier sits before the store, so it does not order
>> the store against a subsequent readl(); the store-release promotion is
>> what provides that ordering.
>>
>> Like ARM64_ERRATUM_832075 on the load side, the change is gated on a new
>> ARM64_WORKAROUND_DEVICE_STORE_RELEASE capability and only activated on
>> parts that match MIDR_NVIDIA_OLYMPUS, so unaffected CPUs continue to use
>> the plain str* sequence.
>>
>> Note: stlr* only supports base-register addressing, so affected CPUs use
>> a base-register stlr* path. Unaffected CPUs keep the original
>> offset-addressed str* sequence introduced by commit d044d6ba6f02
>> ("arm64: io: permit offset addressing").
>>
>> The __const_memcpy_toio_aligned32() and __const_memcpy_toio_aligned64()
>> helpers are left unchanged. These helpers are intended for
>> write-combining mappings, which are Normal-NC on arm64. Replacing their
>> contiguous str* groups would defeat the write-combining behavior used to
>> improve store performance.
>>
>> Co-developed-by: Vikram Sethi <vsethi@nvidia.com>
>> Signed-off-by: Vikram Sethi <vsethi@nvidia.com>
>> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>> ---
>> Changes since v2:
>>    - Reworked the raw MMIO write helpers so unaffected CPUs keep the
>>      existing offset-addressed STR sequence, while affected CPUs use the
>>      base-register STLR path.
>>    - Updated the commit message to match the code changes.
>>    - Rebased on top of the arm64 for-next/errata branch:
>>      https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/errata
>>
>> Changes since v1:
>>    - Updated the commit message based on feedback from Vladimir Murzin.
>>
>>   Documentation/arch/arm64/silicon-errata.rst |  2 ++
>>   arch/arm64/Kconfig                          | 23 ++++++++++++++++
>>   arch/arm64/include/asm/io.h                 | 30 +++++++++++++++++++++
>>   arch/arm64/kernel/cpu_errata.c              |  8 ++++++
>>   arch/arm64/tools/cpucaps                    |  1 +
>>   5 files changed, 64 insertions(+)
>>
>> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
>> index ad09bbb10da80..fc45125dc2f80 100644
>> --- a/Documentation/arch/arm64/silicon-errata.rst
>> +++ b/Documentation/arch/arm64/silicon-errata.rst
>> @@ -298,6 +298,8 @@ stable kernels.
>>   +----------------+-----------------+-----------------+-----------------------------+
>>   | NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
>>   +----------------+-----------------+-----------------+-----------------------------+
>> +| NVIDIA         | Olympus core    | T410-OLY-1027   | NVIDIA_OLYMPUS_1027_ERRATUM |
>> ++----------------+-----------------+-----------------+-----------------------------+
>>   | NVIDIA         | Olympus core    | T410-OLY-1029   | ARM64_ERRATUM_4118414       |
>>   +----------------+-----------------+-----------------+-----------------------------+
>>   | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index c65cef81be86a..d633eb70de1ac 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -564,6 +564,29 @@ config ARM64_ERRATUM_832075
>>
>>          If unsure, say Y.
>>
>> +config NVIDIA_OLYMPUS_1027_ERRATUM
>> +     bool "NVIDIA Olympus: device store/load ordering erratum"
>> +     default y
>> +     help
>> +       This option adds an alternative code sequence to work around an
>> +       NVIDIA Olympus core erratum where a Device-nGnR* store can be
>> +       observed by a peripheral after a younger Device-nGnR* load to the
>> +       same peripheral. This breaks the program order that drivers rely
>> +       on for MMIO and can leave a device in an incorrect state.
>> +
>> +       The workaround promotes the raw MMIO store helpers
>> +       (__raw_writeb/w/l/q) to Store-Release (STLR), which restores the
>> +       required ordering. Because writel() and writel_relaxed() are built
>> +       on __raw_writel(), both are covered without changes to the higher
>> +       layers.
>> +
>> +       The fix is applied through the alternatives framework, so enabling
>> +       this option does not by itself activate the workaround: it is
>> +       patched in only when an affected CPU is detected, and is a no-op on
>> +       unaffected CPUs.
>> +
>> +       If unsure, say Y.
>> +
>>   config ARM64_ERRATUM_834220
>>        bool "Cortex-A57: 834220: Stage 2 translation fault might be incorrectly reported in presence of a Stage 1 fault (rare)"
>>        depends on KVM
>> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
>> index 8cbd1e96fd50b..801223e754c90 100644
>> --- a/arch/arm64/include/asm/io.h
>> +++ b/arch/arm64/include/asm/io.h
>> @@ -22,10 +22,22 @@
>>   /*
>>    * Generic IO read/write.  These perform native-endian accesses.
>>    */
>> +static __always_inline bool arm64_needs_device_store_release(void)
>> +{
>> +     return alternative_has_cap_unlikely(
>> +                             ARM64_WORKAROUND_DEVICE_STORE_RELEASE);
>> +}
>> +
>>   #define __raw_writeb __raw_writeb
>>   static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
>>   {
>>        volatile u8 __iomem *ptr = addr;
>> +
>> +     if (arm64_needs_device_store_release()) {
>> +             asm volatile("stlrb %w0, [%1]" : : "rZ" (val), "r" (addr));
>> +             return;
>> +     }
>> +
>>        asm volatile("strb %w0, %1" : : "rZ" (val), "Qo" (*ptr));
>>   }
> Use an 'else' clause instead of the early return? (similarly for the other
> changes).

I agree. I’ll rework the raw write helpers to use an explicit if/else
form instead of returning early from the STLR path.

>
> I still reckon you should do something with the memcpy-to-io routines.
> A simple option could be to make dgh() a dmb on parts with the erratum?
> That at least moves the barrier out of the loop.

For the memcpy-to-IO routines, would it be acceptable to address the erratum by
patching dgh() to a DMB OSH on affected CPUs, as shown below? I’ll also sync
with the Olympus CPU hardware team to confirm this approach for the v4 patch.

#define dgh()		asm volatile(ALTERNATIVE("hint #6", "dmb osh",	\
					ARM64_WORKAROUND_DEVICE_STORE_RELEASE) \
				     : : : "memory")

This keeps the existing memcpy-to-IO store sequences unchanged while placing the
ordering barrier outside the copy loop as you suggested.

-Shanker


