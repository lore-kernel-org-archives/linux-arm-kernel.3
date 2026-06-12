Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC56CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 01:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEu2wdrDPUr1xmF+qeBn232NQgBal7CFkQYY+pI/Nyk=; b=W6VmtvOLJaFtKivlZ1MZ6xH9C0
	GzF7xsNjKTRZeJ9u6ZWn1azcVpgD3mYNm4mBrUXFiLOsXFA4kvnWw6zHFj0JVW4D+PAClPCSHe6Mc
	qohMNsrjiy+ifp8ukUPyBN3bvaPxEWZx7HD8v60bjMzKetNhiOQFkHCOgH4Ybg1E/djO0jNiyQ/tX
	lK+QjMUwd+J92kpD4r8LhnvvlD3TaGv/tAhtYFaT/9mdxR9Oqcrhrcu3mKQQ+pR6+C5nmuSoSvrM/
	pxQZRCA6x3SFi9ssa3dK7VzOtbZWWhqjZyChvfMuhWScfoKQhUU0lvqdFkmWJHlzKzlDTeGjumiFk
	xmqZAQlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXqTQ-0000000AFGn-04pK;
	Fri, 12 Jun 2026 01:14:16 +0000
Received: from mail-centralusazon11011054.outbound.protection.outlook.com ([52.101.62.54] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXqTN-0000000AFGG-1YaA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 01:14:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVRQ3NC4+bOYSAnYu+gAKtFrU1VDMNarkj5rjh6RB3TH1hIlVOgD3F8OdPlRb09xdIpoBUKfUz+RYoHno7PsNQeHwrxl435x520KL2nMLqg6/a//lFcQmRosiCiAoSEpwhIEBLF+7A9bahn6d1FUcmKEGFVIYLY9D2wg9lmqc+vcbUj38179j7+fYWEMu3XUb6Bb3L/CCnCQltWfV4/yuudlAT7TNQ3HQQ65nho47P9yUHPGjX/X1cli5oGpCdC1afgiszgPpVV+L1we7/apNUfq/rlQGDZ5MoXY2hrQWJnDUD1oYw5U5GEK0Ur8TiS0vidLC+JEAYiPzeX0+JMmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEu2wdrDPUr1xmF+qeBn232NQgBal7CFkQYY+pI/Nyk=;
 b=qVO6JDLhEDfJaJVM+YCY2KvPV7ID1WGSf+UCEUPea9xexGOowtlX7gTxSvBNOj1j28GvRpCs8Xqv3Z721VtPoGyybNJ7sIlGEs47h4HeYfLhmB1m+HcjoO/bhPQvzoy4RrA7xkRK5gKG4LWLznamKemAGonMNdnAEY/LBsqM8iN+DK7RuHzE0aWr1yVfG8BmOqZ8enZMEtwHPmQOMSRLHbN9xy90X9N+q2X1rdtHys57aWwE0tOkRRbiO2SZqx8ApM2g1TVVz1H7a2ahQk8mIDuowYO6d5CkinozWJKY5ih2pVrGz242quOwDJlWmr1DmZXaUc60rdnN01kvVDtRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEu2wdrDPUr1xmF+qeBn232NQgBal7CFkQYY+pI/Nyk=;
 b=GJ4BngJDcJVwM3GMee9+LD5ZivWaqBWyZxgHHAwuhYZO5ZqFJ9Vom2KQWZfLJIZOUSoaMeOJw6He83JnLHH7HMI+sFLhG+/Odp2hQzteTZJ+v5F9+HzUTZoIkUrU25NWdFPHT/gsg/5LaPkPz075j/ZuLsKPUc6M97ovNIPI1SW8+1c6rEh36yYtDBWiYprZNYMN1x1gcHnEerLAGwOQ3riIXiSbiSW0b7Cquc5QiNjs5lZLNXSwuvOIPGjzsCesc3JsPg1on5ssVW7rXEoFRgcraopsWSv8qEym+PUFpSK8aDJ2EMWc78uEIcP8+c/WA+XWUwT9ZD0lbZgNj/iJMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6089.namprd12.prod.outlook.com (2603:10b6:208:3ef::9)
 by SJ0PR12MB7067.namprd12.prod.outlook.com (2603:10b6:a03:4ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.18; Fri, 12 Jun
 2026 01:14:04 +0000
Received: from IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c]) by IA1PR12MB6089.namprd12.prod.outlook.com
 ([fe80::abd0:32b3:6f57:1d3c%3]) with mapi id 15.21.0092.011; Fri, 12 Jun 2026
 01:14:03 +0000
Message-ID: <851c4107-3f6d-46f3-b659-212ce4f69e6e@nvidia.com>
Date: Thu, 11 Jun 2026 20:13:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: errata: Workaround NVIDIA Olympus device
 store/load ordering erratum
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Vladimir Murzin <vladimir.murzin@arm.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Vikram Sethi <vsethi@nvidia.com>, Jason Sequeira <jsequeira@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>
References: <20260610164822.4157248-1-sdonthineni@nvidia.com>
 <aiq5VigmtZq9GlAm@willie-the-truck>
 <IA1PR12MB6089049028A73A2078FC6831C71B2@IA1PR12MB6089.namprd12.prod.outlook.com>
Content-Language: en-US
From: Shanker Donthineni <sdonthineni@nvidia.com>
In-Reply-To: <IA1PR12MB6089049028A73A2078FC6831C71B2@IA1PR12MB6089.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0144.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::22) To IA1PR12MB6089.namprd12.prod.outlook.com
 (2603:10b6:208:3ef::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6089:EE_|SJ0PR12MB7067:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e39b29-7782-4060-05d3-08dec81fe447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|4143699003|56012099006|11063799006|3023799007|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 14Nvx+F7YTOUd9+nve2IPQc3x00f1QLt1qN11lzNfZSYEORR5jRL0W0CXs1y3EA8JV8yfSObLPJj8tziwYtms3ZU4fLdes8ximxI1ApLWsEi39VTpD9iC62Gq3l/yFuGeVmSP/LHjQWOcVJE0FIMR6cgngcZUvYP2usivxEEVzrNm9sIiB0c6N5Xj5Mm3UeQpaNKXbY1lic8m9AyYhfegpoveCFwtP5nS+wUO2CwEYNJFT9eOVi6K/ffst1v7woCxfXP8QE5UJc11Qr3C1TiJeEKI1Q3Iev/hMSdjVEXi2zQ2LVEhc4xmr7eddrMc52LFzMEFYuVthG2iGTrfxEqDgI8Gqpwm7AVpw1wtdZrnQzPBe34fvZSoqxdBF/9XoU2uOvUaikf5fDaxM2Ul8Ke1cnr3hO5UP9njb7v29qpGUUWW17RzwA0xY5suTzwFKoBVkp50IGrOTv3DKKq3kVwEF8f1EmGRxDhvoG/Lr1C3HYIliBqSGvoOVDabIhW5uR/8KFQvXdPV1H5WARE9BXG3y/+GKIcbqrhVKW8KkJVuPS+6SyNE+5hcG9XUvGdTDVVfYVq9iYvvkFBrPKPneINnh6hCeCkyLzq28wtx5nWvxGC0STnVk6r+TmW/BmIopMGAURVuqqL5qe9raARtO8eUDOHQ5zYHOf0pwPbcQ9Y+dzLdWIGp6hkVdb3HrjH2Sb7AfPuTovTtvlK7EN0wcS18g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6089.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(3023799007)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWJQMHYvUTVHcWVmZnhjTDRpZUFmTjRtSnBSZkdUeWt5RG1mQ0h5WTdZM21F?=
 =?utf-8?B?U2p3MS9lOUlicGJiM2F1N0thLzQyV2MrWXVyb3Nxd01tS0ErT3Y4bXJrSDVN?=
 =?utf-8?B?UzBOVkg4dzFCWGZaV09jTGVBWmFUUVZ6TElaTlJzUnpxZG9FTGduR1NPRFpS?=
 =?utf-8?B?ZWlWWGl5bVpIUFN1VklUeGJlank0OEhIUkh5dlI0REpuTlBVTlpvVEp0dXZB?=
 =?utf-8?B?UXNsTk5oWUl1aTVxN3psV3pKZnArSGo5R0N1SGJkZ0VTalI0eUg3cVVidUs4?=
 =?utf-8?B?dk0rTi9pWVZ1NzRjajNTdXgvQk5nSmZxMkMxUFZWV3dNWHV6MHZ3dHhnWk5z?=
 =?utf-8?B?Umszcm1xZXdLcVd5RzRqc05YSHpBWk9nYUZ4UUhPVEpGa2s1TEVWRFZzNW9N?=
 =?utf-8?B?eUJFcldIcGpNdU9rUVBINTBoQndncTVzT3NSbGdrVkhEdFZMTWpKMWpvMkRI?=
 =?utf-8?B?OCt6QzZVN28xVFRmRDlqaHBUemV1cEEzbHcyMFQwSUpnY0MyYTR1RDNvc0hO?=
 =?utf-8?B?NUNIcHE1eHlIWm9NNTBCdFBwZ3IxV1lncjNLMVNGZDJCbnI5Wk9FT0Jvd1p5?=
 =?utf-8?B?andoNUc5emMzLy9QNFZQNk83L2FtWVVlbzlGRHRMM1hGV2dXdTdjbDN4N2Rh?=
 =?utf-8?B?eFh4NmlhS1dzR1JMWDZvaTl1aW9zWG9pczU3TkJXU1dDbi9FUHprb1pvZmdx?=
 =?utf-8?B?cmU4V29iREdrbzVITDVBZGpFOGNDMkdCMVRzc1FhL0JMaHM3bVYvNkVOSmNN?=
 =?utf-8?B?bXJZUlYrUWpQMzhDSzg0U24rMm9ybm1RL0k3bXVvL1QxVUw4c3M5WEhkNm96?=
 =?utf-8?B?SmR2a2xNRnZrUlNQOXA5dFVDalczV0x3Ujl0MHdBSktmYm9SMDJMd3U5YitZ?=
 =?utf-8?B?ekVFaXYyaGRFVzJmT0Q3Y2dwcFRIOEJWVytoalNaazI3ZVo5dWVVS1JNbitR?=
 =?utf-8?B?ZjNJUG8xam1EcWpheXRSVEVnUkM0bnVzaHZjT09yL2I0cTRQbHZrSVdscllE?=
 =?utf-8?B?M3QvcTB4RG1mRmNXNWZXQ0dGeW1HRWNWcGhYUE5jRGFwejJjOXcrV3RwNWMr?=
 =?utf-8?B?ME1JdmFxd2dKL3c1SzhtRWYvNnJnRGhKNWY4dGlESGNvd1dKdlBSMk5UdWlT?=
 =?utf-8?B?OFVUTTBPQWU5QTB2SlphMlEyNXo5OGZFdlBIRXFYUU00YUN3ZmpHeEx4WFJ5?=
 =?utf-8?B?endZRndEN2tacmNMVzJyUmxjTnhFUXBlMExFZVYrSkNjdEx1VEpZS0pJS0FS?=
 =?utf-8?B?T0Q4WDR2UUg2cUFyb3hmS3FZK1NpdWhYMVpHQTJJYldtLytLdzBoak1pL0l0?=
 =?utf-8?B?L2NEMFp2R2w5MUpxUU1YZlZLbzFtVFQ1Zm9ZaWZIVVpFRzJkVGFNQXNHUUtu?=
 =?utf-8?B?MzRUU200ZTZVNmhLdUpMbHc2TkZ2a3JVam5jcUt1RWhWY2tmQ3JrQXoxU0ho?=
 =?utf-8?B?RFZ4d3o2anlSTmRJeis4YzkvSWZNWEtQejVlN04ydXNDQ01iU0lxUm93SmVy?=
 =?utf-8?B?YVE4NE1kVzRFWjNOMERtNnRNaFZOdVZjZW1wTzhNSVNERjFYbWdnaDRIRXB3?=
 =?utf-8?B?M05IY1dwTjlIVy9WU3NuY2hkVFYrQ3pPb2pFaEkrTEViaTFETE43WS9OVEJs?=
 =?utf-8?B?ckplQlJWQjUxQ0NFYjlXR1VNYmZxQnhhbGVOZWxTR3hYOEFXdERpbzlyL25R?=
 =?utf-8?B?aS9Pdm5oUDdEejVrUktwd1YySEZ0UHRQNytEcHhSalRvQ21CUCtFdy9mWFgy?=
 =?utf-8?B?OWFPaGc0ZDRrblJMUUtBQzQ1NVNLWnFUU0haOGRsWm51djZYdzNESWM0ZUZm?=
 =?utf-8?B?ZUlWWXJYQ2NBaDFCMUJ4YzFuSnkySWtPeGcxMHduU2xZODQ5K1p3dmZzR2tU?=
 =?utf-8?B?dlJ5ZUcvbXlybVBuYlFncWswcXQ0bzY5OGFTTzZPSW90MlAyZ2xiTE5iNU9y?=
 =?utf-8?B?L0hEem9LY1FQbXZwK2FvNys4WEEvNWZQa1dRbEFaLzdyK3BqL1dZMytnYVdO?=
 =?utf-8?B?YXBTV1l0T0R3U2FTeFFIYVo5S3lQcUI2Sis5aXFEeTExRndnTzhqUUEwSUln?=
 =?utf-8?B?TUpEY3RIaFFlUUtvbHdROXdBVkl2dmsrWTZnYlFUU2pyVkU1bTdOS0ZUZzFH?=
 =?utf-8?B?WDg1b1NWZnc1TWM5ZjFGOWRPeFVTUFFqd3ZxSEhHSzh3UFc1b0JrVmN1alVj?=
 =?utf-8?B?U0Y5TjB3enh6OE4ydUhURitUSXhWU3R4MVkzcUtGODkxY2dVbWxGRGs2NHp3?=
 =?utf-8?B?MU5pc1gzMEJUNC8xMlNUZnJQSzBteEdjSEhYSW54MldhSlQ0TnA4WW1xTjdJ?=
 =?utf-8?B?RkYvd2pmMXd5Z04yQkxuZFBwdTJLdVlTclFvdFhUY21mcGxyRDgwQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e39b29-7782-4060-05d3-08dec81fe447
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6089.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 01:14:03.4442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPMdPiLuZj5cu40OaxDSl20+wQwYZ3chYFDOFI63k4aM4Zu+hU1OWi4exe2hIxe9/J7Lb5xEyyECdi3pQw9HiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_181413_468840_74A02833 
X-CRM114-Status: GOOD (  27.90  )
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

On 6/11/2026 8:39 AM, sdonthineni@nvidia.com wrote:
>
> -----Original Message-----
> From: Will Deacon <will@kernel.org>
> Sent: Thursday, June 11, 2026 8:34 AM
> To: Shanker Donthineni <sdonthineni@nvidia.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>; Vladimir Murzin <vladimir.murzin@arm.com>; Jason Gunthorpe <jgg@nvidia.com>; linux-arm-kernel@lists.infradead.org; Mark Rutland <mark.rutland@arm.com>; linux-kernel@vger.kernel.org; linux-doc@vger.kernel.org; Vikram Sethi <vsethi@nvidia.com>; Jason Sequeira <jsequeira@nvidia.com>
> Subject: Re: [PATCH v3] arm64: errata: Workaround NVIDIA Olympus device store/load ordering erratum
>
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
>> Promote the raw MMIO store helpers (__raw_writeb/w/l/q) from plain
>> str* to stlr* (Store-Release), which removes the "store is not a
>> store-release" condition for every device write the kernel issues.
>> Because writel() and writel_relaxed() are both built on __raw_writel()
>> in asm-generic/io.h, patching the raw variants covers both the
>> non-relaxed and relaxed APIs without touching the higher layers. Note
>> that writel()'s own barrier sits before the store, so it does not
>> order the store against a subsequent readl(); the store-release
>> promotion is what provides that ordering.
>>
>> Like ARM64_ERRATUM_832075 on the load side, the change is gated on a
>> new ARM64_WORKAROUND_DEVICE_STORE_RELEASE capability and only
>> activated on parts that match MIDR_NVIDIA_OLYMPUS, so unaffected CPUs
>> continue to use the plain str* sequence.
>>
>> Note: stlr* only supports base-register addressing, so affected CPUs
>> use a base-register stlr* path. Unaffected CPUs keep the original
>> offset-addressed str* sequence introduced by commit d044d6ba6f02
>> ("arm64: io: permit offset addressing").
>>
>> The __const_memcpy_toio_aligned32() and
>> __const_memcpy_toio_aligned64() helpers are left unchanged. These
>> helpers are intended for write-combining mappings, which are Normal-NC
>> on arm64. Replacing their contiguous str* groups would defeat the
>> write-combining behavior used to improve store performance.
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
>>      
>> https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h
>> =for-next/errata
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
>> diff --git a/Documentation/arch/arm64/silicon-errata.rst
>> b/Documentation/arch/arm64/silicon-errata.rst
>> index ad09bbb10da80..fc45125dc2f80 100644
>> --- a/Documentation/arch/arm64/silicon-errata.rst
>> +++ b/Documentation/arch/arm64/silicon-errata.rst
>> @@ -298,6 +298,8 @@ stable kernels.
>>   +----------------+-----------------+-----------------+-----------------------------+
>>   | NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
>>   
>> +----------------+-----------------+-----------------+----------------
>> -------------+
>> +| NVIDIA         | Olympus core    | T410-OLY-1027   | NVIDIA_OLYMPUS_1027_ERRATUM |
>> ++----------------+-----------------+-----------------+-----------------------------+
>>   | NVIDIA         | Olympus core    | T410-OLY-1029   | ARM64_ERRATUM_4118414       |
>>   +----------------+-----------------+-----------------+-----------------------------+
>>   | NVIDIA         | T241 GICv3/4.x  | T241-FABRIC-4   | N/A                         |
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig index
>> c65cef81be86a..d633eb70de1ac 100644
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
>>   static __always_inline void __raw_writeb(u8 val, volatile void
>> __iomem *addr)  {
>>        volatile u8 __iomem *ptr = addr;
>> +
>> +     if (arm64_needs_device_store_release()) {
>> +             asm volatile("stlrb %w0, [%1]" : : "rZ" (val), "r" (addr));
>> +             return;
>> +     }
>> +
>>        asm volatile("strb %w0, %1" : : "rZ" (val), "Qo" (*ptr));  }
> Use an 'else' clause instead of the early return? (similarly for the other changes).
>
> I still reckon you should do something with the memcpy-to-io routines.
> A simple option could be to make dgh() a dmb on parts with the erratum?
> That at least moves the barrier out of the loop.

Thanks Will. I looked again at both the arm64 comments and the generic iomap_copy.c
contract, and I’m not convinced that making dgh() a dmb is the right fit for this
path. Based on the documented comments, callers should not assume ordering from
these helpers; if ordering is required around a memcpy, the call site should already
be providing the necessary barriers.

Related data point in generic lib/iomap_copy.c:

/**
  * __iowrite32_copy - copy data to MMIO space, in 32-bit units
  * @to: destination, in MMIO space (must be 32-bit aligned)
  * @from: source (must be 32-bit aligned)
  * @count: number of 32-bit quantities to copy
  *
  * Copy data from kernel space to MMIO space, in units of 32 bits at a
  * time.  Order of access is not guaranteed, nor is a memory barrier
  * performed afterwards.
  */
#ifndef __iowrite32_copy
void __iowrite32_copy(void __iomem *to, const void *from, size_t count)

/**
  * __iowrite64_copy - copy data to MMIO space, in 64-bit or 32-bit units
  * @to: destination, in MMIO space (must be 64-bit aligned)
  * @from: source (must be 64-bit aligned)
  * @count: number of 64-bit quantities to copy
  *
  * Copy data from kernel space to MMIO space, in units of 32 or 64 bits at a
  * time.  Order of access is not guaranteed, nor is a memory barrier
  * performed afterwards.
  */
#ifndef __iowrite64_copy
void __iowrite64_copy(void __iomem *to, const void *from, size_t count)

/**
  * __iowrite32_copy - copy data to MMIO space, in 32-bit units
  * @to: destination, in MMIO space (must be 32-bit aligned)
  * @from: source (must be 32-bit aligned)
  * @count: number of 32-bit quantities to copy
  *
  * Copy data from kernel space to MMIO space, in units of 32 bits at a
  * time.  Order of access is not guaranteed, nor is a memory barrier
  * performed afterwards.
  */
#ifndef __iowrite32_copy
void __iowrite32_copy(void __iomem *to, const void *from, size_t count)


The arm64 comment says in arch/arm64/asm/io.h:

/*
  * The ARM64 iowrite implementation is intended to support drivers that want to
  * use write combining. For instance PCI drivers using write combining with a 64
  * byte __iowrite64_copy() expect to get a 64 byte MemWr TLP on the PCIe bus.
  *
  * Newer ARM core have sensitive write combining buffers, it is important that
  * the stores be contiguous blocks of store instructions. Normal memcpy
  * approaches have a very low chance to generate write combining.
  *
  * Since this is the only API on ARM64 that should be used with write combining
  * it also integrates the DGH hint which is supposed to lower the latency to
  * emit the large TLP from the CPU.
  */

So my reading is that dgh() in the arm64 implementation is there for the
write-combining/gathering behavior. Replacing it with dmb would make this
path stronger than the generic API contract and could penalize performance
of the WC use case.

For the scalar MMIO helpers, the workaround promotes the raw writes to
store-release on affected CPUs as v1/v2 shown below. For the memcpy-toIO
helpers, could you please clarify the specific reason for adding a dmb despite
the documented no-ordering contract? Is the concern that some drivers may
be relying on ordering across memcpy_toio_*() today even though the API
does not guarantee it, and that we should cover those cases defensively?

Would prefer to avoid replacing DGH() with DMB unless there is a strong
reason to do so. Please let me know if I can post the v4 patch with
the change below, while keeping DGH() as-is in the memcpy-toIO path.

  #define __raw_writeb __raw_writeb
  static __always_inline void __raw_writeb(u8 val, volatile void __iomem *addr)
  {
-       volatile u8 __iomem *ptr = addr;
-       asm volatile("strb %w0, %1" : : "rZ" (val), "Qo" (*ptr));
+       asm volatile(ALTERNATIVE("strb %w0, [%1]",
+                                "stlrb %w0, [%1]",
+                                ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+                    : : "rZ" (val), "r" (addr));
  }

  #define __raw_writew __raw_writew
  static __always_inline void __raw_writew(u16 val, volatile void __iomem *addr)
  {
-       volatile u16 __iomem *ptr = addr;
-       asm volatile("strh %w0, %1" : : "rZ" (val), "Qo" (*ptr));
+       asm volatile(ALTERNATIVE("strh %w0, [%1]",
+                                "stlrh %w0, [%1]",
+                                ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+                    : : "rZ" (val), "r" (addr));
  }

  #define __raw_writel __raw_writel
  static __always_inline void __raw_writel(u32 val, volatile void __iomem *addr)
  {
-       volatile u32 __iomem *ptr = addr;
-       asm volatile("str %w0, %1" : : "rZ" (val), "Qo" (*ptr));
+       asm volatile(ALTERNATIVE("str %w0, [%1]",
+                                "stlr %w0, [%1]",
+                                ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+                    : : "rZ" (val), "r" (addr));
  }

  #define __raw_writeq __raw_writeq
  static __always_inline void __raw_writeq(u64 val, volatile void __iomem *addr)
  {
-       volatile u64 __iomem *ptr = addr;
-       asm volatile("str %x0, %1" : : "rZ" (val), "Qo" (*ptr));
+       asm volatile(ALTERNATIVE("str %x0, [%1]",
+                                "stlr %x0, [%1]",
+                                ARM64_WORKAROUND_DEVICE_STORE_RELEASE)
+                    : : "rZ" (val), "r" (addr));
  }


-Shanker


