Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADC5C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 13:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkWHFlA1e20KLhNBrzryRre0sGGm98ZGnrrCH/Cq3PE=; b=r/4UakzpdmKZXr4e1IryNUzEw8
	IsHvt0ZaV2znN4Qy/i8iRC3/3qQndolaR+qWYU1xKtBXg1Eo8krIcQN0/ngwWOa0PdWfqVoYTSTuv
	I5QiG7J3jujpuV4fQHT3NPyez56rKLc1eyK0YiaBhyCLxwp3MG/7D0gr6hhShUVlN/tz9NdVnAf9s
	flXVxt6abDk0Hfiy8Lg9cw4Qo+FV04ft6VjBGJHsmLc3BZmZDt2EW6xxEfLrgi1hb0d/GNTzzuEs/
	wXBGhkUMQ0oPA1BD5P3gmCM5x6CFovYwy2Tnjq53pFXneha9ua4ZgsBNXxRLz+PMq0oroU3pqztqS
	89WVuDcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry84-00000005u76-29Pp;
	Thu, 06 Aug 2026 13:27:24 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wry7y-00000005u4w-2Mjn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 13:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osqbkKKlggqUpd8Vy9MVRAnApGBWBOY+jorsB9cl8g7QqyOPQttgE2m/MbTbGifsb1DVGzhte1lXJC2NuxmpQxogk8cjOnVq5sft1ommXVQ9Ytv+9VEnWCM4/J0/0E2bML3M/B3qStkCZag6BkDGyvkwt4maCf+989nkD1J9b4rClK79R9UyBOISVbPu95XOF+DxZ8e3EhKI5P6TKlRg3+gMiG6m25I6mC4AwtYa8/Re2c+KZsXkEVqHjy81gV5EHpzz343mDgFQ28GRWrIR7vyN5fWtzGzjtF5bbix/H3vVBvuZPGqKjoMa9Wp1AqaE0/jfodpRL65Je1sph/EdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkWHFlA1e20KLhNBrzryRre0sGGm98ZGnrrCH/Cq3PE=;
 b=oBR6Qi7vZPxiyXUm+fqpE1y76Q5l8uUXcnwjBQngAD4zy8NPYRJ1l8374zptHmLSdBnoRS/L7A1/UJ0j7zlw0Gk8hfmP8nhQKlDMC4k+pqu3IqtV1o0xL1X+FjF2J4tUxiYlHdqGi63IjMG51h/VP03cWqFDzUrXIhSrVOcdv2+U2vPoLBnJApEPRG2eFgGIAzOSrwOaDYmBvUiHIBNvijfDEoNFV5CpE2UyOKpg9nyeuKvc+jjTG5dkPKaRl5qevpz0PEhL1zOVHq5at4Tf1on9k0DouA4R/1L+JuJK4UTC4naiCi0xgZvVtAvjLEQa7bTmsVu8m2bY8zsTN2JMoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkWHFlA1e20KLhNBrzryRre0sGGm98ZGnrrCH/Cq3PE=;
 b=bTfsmih3t+1ImfEg17LMP8/2ZVUFoNci4QsoiVOq/KdsWoU3n8QYEVO2/RIxAKPJbrwrNsT/9slbS5iTC9kTO7MzVUTGSJEFO2emrNT54RuWry1lcY3PUEJdC/K86qBKsbFpcd18Uk2TmQAK1lwT3pJQavzrRMzpY9c9KJ8aiBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by BN3PR12MB9571.namprd12.prod.outlook.com (2603:10b6:408:2ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 13:27:08 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%5]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 13:27:08 +0000
Message-ID: <5a471469-ba92-46d8-9ed4-90719074dca8@amd.com>
Date: Thu, 6 Aug 2026 15:27:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] firmware: xilinx: Clean up firmware and EL3 state
 on kexec
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, git@amd.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260724101948.2895263-1-jay.buddhabhatti@amd.com>
 <20260729122522.3732875-1-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260729122522.3732875-1-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0015.namprd10.prod.outlook.com
 (2603:10b6:a03:255::20) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|BN3PR12MB9571:EE_
X-MS-Office365-Filtering-Correlation-Id: a5c85458-3479-44c2-0f95-08def3be6a59
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 52kTO4qns/SaDL0OJtHjPTp2hg5CZ9SEoezRRhZu5RF9cv/cNnUYJYzOjQEA6MYD83cadPiVkWgnwoW2XecHQVjQfE7SD4oX37N9PUmOupAetg7aJ6sg4uvOLduEdGoU0O0Hl9kssiSpYIQi2e+UIIAXTkjZk9k8/2ID7I5VDkVwxg+A7rFBYbYrOBgx6Y2EA2X+8YNI/N06rOAyc/ZJDI2qeLfr82nejZ3033C+2SAYAIzHl9qdM7cOB3HaRhVlEDHn0jKmLLXa/WvM5VPxsT0w2uawWUXQ9eECg7/HjwGbYRFZx+uK7Hb9+sclA/+5sFxbLOSAoJ5n6iXxc+DttzHST2rXYbknfYLm0qDlXyQP0sTUvYh43IIpT9jHZVLrL0oZ/rjgAKTM8ZNvrWdIIR822CaXeFfewOlLDIsh0Ngx7jPY2DRjVrStaQPDgbWExDzQ6QANOUqUCGYmxEIhoVETd7x1rO/0s1JvfeuR+CfHBdcitO+dbdCIANs4FsX5AYP3E2lZmp9UrBNNe/tpYOIiqFdN0DQzycrZa4uG6TPUl8YELmptZj2z2+zr9nFynKHN1n1kogj11PDfWno2WZ1hScnrtaiMAX8X0rPzT8pBZU7D01913xi0VRuW4UxTsxq1DZl/XjV7u/DbzY8olZJQVUhnA6EddXELFWzgMdQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTNtMEt1ZGxRT1hTZkgyNDFmWUtYTnFpMmw5dUhRNXUzYlJrNUpkYURGOTdO?=
 =?utf-8?B?N2E5STBTdlJ2U0psMnFyUGxRWiswbVFkdDZvUTZMMmpwK1JhbE9iY0tFZDZR?=
 =?utf-8?B?bjZQV2dYN2ErQ2ZmWDhhVGlPT0xXdm5oSEdWcnhtb0dYRlE0cTFsZVVBWEJX?=
 =?utf-8?B?UEMwVXpORHFHbUZzVmYyNzlQSFR3ZHZYaVAyaDNqUXFUQUY5RnVNbTNoc1dX?=
 =?utf-8?B?N1JHcDFNaWQvcTlNRG0rWWxUK3dZdjlBeGJRRHQwY2srQ0lpdGlmMTIwV2NH?=
 =?utf-8?B?elpGUWhKUHlEM1IwWEhKMzQ0cnlzTnBQa3Frb3lwV3FIWVE2SmZua2FsWnZh?=
 =?utf-8?B?aUJpMEQ1TU52M3hISTF1dUg2R3hnaFBLYnZHVmZMTlMxVFBWUGNvUUNJd09S?=
 =?utf-8?B?dDVNTi9HRThoWTRnT0NRbXlYcVU4emdOUUNGZ3A5aU9kaEM0T0s1VW9laXZY?=
 =?utf-8?B?QzBMaDNLeXRKdjBOcVZ4NGtoWUxCeENWUVBVdkhxMVJrcjZtbXdvT2xSNGVt?=
 =?utf-8?B?QktOS20xTGVucmlHKzkxY1BHYnJWbXdrSlRUVGVXYUxhTUIyUG1IVGErVHN6?=
 =?utf-8?B?RDA1SVBNQk02ck5ZM2d0UHljWmFiMWJKOTZxTnZhblJoRzBUQVY0TzhXZ0R6?=
 =?utf-8?B?eVordTVWb09LUFpwdmVmUzNtUlVTZkNob2JnbHF0Q2pxZGllNG1pRGR1eUxr?=
 =?utf-8?B?VmxXUUFEc1BqODVLMXNRZHlaVEg2cUZXbW1JeFVCeUZMS3BRbWx0Rmt5b2k1?=
 =?utf-8?B?Y0pKdmt3MENCM1RlTTFLZ0k5Mzh1NzZST0dDVDZEZngwelZMWGJBdVdUYStn?=
 =?utf-8?B?Rkhhc0ZIS29nUEdwaCtuT2JMZkVEMzFVQSthb1ErZnJzOWRnSGFlalY2aElF?=
 =?utf-8?B?K1pRQXg1SEQxRkZONjJ2b1FaZlA1ZDRYcDdTNGJOQXJRVnovTmpUNkpHWUhX?=
 =?utf-8?B?ZFhXcG13V1pQSGswRUplbFljMHFzYWtVS0ZDL2pHK3hNeStkMWkwN2NOQmVE?=
 =?utf-8?B?dGVoTDBSSG5POHAwWEpZMU8vWG1qbVhobDBjMlRsMk9YU1JnZm1vL1FKbUFq?=
 =?utf-8?B?QURnUkFrbXl2Yk5MVExQY2ZyVCtkS0hNZmdsTGhGL1p4MXlUemI3d1NGTlBo?=
 =?utf-8?B?ZEo0TVo1QU9jUjhuVzZkQnVtZ3BOWUVkMThxbFBSNXkyWjh1VVB3UWd3a3p5?=
 =?utf-8?B?QWtwOTlLNGtZOTN5WTl5U0NkZy85M3N1RGN2a2NWWTF2WktsLzZWNUt3NU9q?=
 =?utf-8?B?Y3J3V0pVakxhSzlxTFA2ei9qdVFodURFbG1IcWtTK1NvOUxlRmdjeUlSSWVX?=
 =?utf-8?B?blpUUlB1c0MzRVpsb1VTemNuS3BTTHpHbTliLzMvRXhNYXpjeTc1SEIvOThK?=
 =?utf-8?B?Rk5QdUpqZmZRWFltWWFzaXh5NGZCcU92djNscjZhR2h1TnZyUmFDQ0xyalFk?=
 =?utf-8?B?ZlVJamNRSjNscEE1QlJZMXRsM2dUV1pURHR4Z0VIenVzRVJJakZ5R1V6ZlB0?=
 =?utf-8?B?Y1RKcUhEUGoxa2pUcTZzcnBVUml6Vi9QZ0Q2ZmU1NThWb3dZRTVmSmoxbFlh?=
 =?utf-8?B?ZEwrSTA5Nmc2WlBHTmVUdnM3bVM3V0VPK3dqWUE3NzdBa1hSQyt0RkQrUFFn?=
 =?utf-8?B?RmUveXcyOExMZ1FyMTREdWFxR3ErWVJoZXdsanlvRG53b0xEcjB3LzBjMndI?=
 =?utf-8?B?NzY0MnlhN21LOTZEZzBPeEk5OVpYbkNoVTRvWkp3UW1FQUpMZXNNUjJ5aTU2?=
 =?utf-8?B?eGliTnBEWVJJTlFwWTFFWnNYb2ZqajlPY3pWVTRQY2hKY2VWcmFNODliN2la?=
 =?utf-8?B?OThKbkc4WVQ5WGljUGhqeFNFcDdCZ3crdGFNc2NydFJ1UzNYdVZPbm5iUWcw?=
 =?utf-8?B?NnBUZEUvNEVEL0NwaWZwTXpUU1laTXR2djhodGpYT2RBaE5hREgzUSthNlpi?=
 =?utf-8?B?eEpHTC9pY1kzSUhMTk9pUDg2cFI4T2M3YWMzbVBRaEI0bXE4OWpaYUtQNFVZ?=
 =?utf-8?B?bCszdWZzak5HVVU2OHB6bVdpc24wV1pXZHVXb2ZuTVplZXNjeW1mUUk5aFE2?=
 =?utf-8?B?d1crVDJIUGt0dzlncWdLdTJuNVVWUUxVN2U4dS9NN0srdlR3Q0FaOW50YndE?=
 =?utf-8?B?RmZJU3U1cVF2UWFQb054MEFCTEV1NGFDMjJXRTlGSGRQVTFZTFJYNU5ob3lD?=
 =?utf-8?B?K01RRjdCdWxlL05lb0E0cm0waTlYcEFIVnkrWW5UN3l3Z2IvL2k2Q05NbEd2?=
 =?utf-8?B?VTBzVWRydllHeTAyWGdocWdNU0c2aHUwbDJlMUVHR3oxTnVYQjViQkVXWFk2?=
 =?utf-8?B?NXQ3d1k0eVFrZVVlZ3VoRXdDclJrbVVyOWlSNDAveWNjYUx3RUVOdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5c85458-3479-44c2-0f95-08def3be6a59
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 13:27:08.8027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqRTYp7E1kwnmxJHsdvU1DNlWE6e7s9qp9hLDD5G8MKkg4HxIx6fC8v2xZT4SHHk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_062718_609352_E026315F 
X-CRM114-Status: GOOD (  18.87  )
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



On 7/29/26 14:25, Jay Buddhabhatti wrote:
> During a kexec restart, only the kernel is reloaded while the state held
> in EL3 and platform firmware persists. This leaves the freshly booted
> kernel out of sync with secure firmware for things like the SGI number,
> shutdown scope, allocated peripheral devices and registered notifier
> callbacks, which can lead to unexpected behaviour after a kexec.
> 
> Introduce a mechanism to clear the stale EL3 and platform firmware state
> so the reloaded kernel starts from a clean baseline:
> 
>    - Add TF_A_CLEAR_PM_STATE to clear EL3 PM subsystem state.
>    - Add PM_DEV_ALL_PERIPH to release all peripheral devices in one call.
>    - Add PM_ALL_NOTIFIERS to unregister all notifier callbacks in one call.
> 
> On a graceful kexec reboot the cleanup is performed from
> zynqmp_firmware_shutdown(); on a crash (kdump) restart it is performed
> from zynqmp_firmware_probe() of the reloaded kernel. Each cleanup step
> is guarded by a feature check so it degrades gracefully on firmware
> versions that do not implement the new APIs.
> 
> Changes in v4:
>    - Modified platform check to restrict kexec cleanup to Versal and
>      Versal Net platforms only
>    - Used EL3 firmware instead of TF-A in descriptions and comments
> 
> Changes in v3:
>    - Corrected subject prefix
> 
> Changes in v2:
>    - Drop patch 4/4 (feature check improvements) from this series per
>      review feedback. Those changes are sent separately as:
>      "[PATCH 1/2] firmware: xilinx: Use TF-A feature check for
>      TF-A-specific APIs" and "[PATCH 2/2] firmware: xilinx: Propagate
>      actual error from feature check"
> 
> Jay Buddhabhatti (3):
>    firmware: xilinx: Add support to clear EL3 PM state
>    firmware: xilinx: Release all peripheral devices from firmware
>    firmware: xilinx: Clear firmware notifiers across kexec transitions
> 
>   drivers/firmware/xilinx/zynqmp.c     | 86 +++++++++++++++++++++++++++-
>   include/linux/firmware/xlnx-zynqmp.h | 10 +++-
>   2 files changed, 94 insertions(+), 2 deletions(-)
> 

Applied.
M

