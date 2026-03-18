Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6921C103E198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifOwTx/ZKFSsq1byrKK3EedWc8qS4sOikGowXOjP3w8=; b=MMB49XtNdYolnLorwpqUATpeuT
	XwK/25ytxqWmVAb6OXQba3TYLqas4b1EZrbU/+7B7ExayrhK8VMeXWEMoXQzB+vXzwsV+3465ZU/s
	IwzJ+Ib37sL9/eFKlQJO8/Ry9EPTTDINgBnkTquJlnm9MsBvP9JzOtCr+sVpysm0IkROcNsE/GFd/
	adCUw1RwPA3mKMyh9bdq8UcNCu47i7RVoj0DetWLK2ehLdjjKwoXNz5K9rvREjPgJbRvKyKsc95oq
	88dIIvzd0o8pYPUzepVkEMSWLaCF4EuY11G5T+GR+NOA6drIWYFnEPmX/QPMQ3SqE6osq9n8CdQLR
	GKH+8XxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t0z-00000008kDc-3SIQ;
	Wed, 18 Mar 2026 15:40:57 +0000
Received: from mail-westus3azon11012069.outbound.protection.outlook.com ([40.107.209.69] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t0x-00000008kAe-2oyc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:40:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5FGA72+GBc7V30K+4417QbPsbq3loy4TG35hNgMSAEBqDCZfYIvsOlHTdnhpKkoef7x61VxlMJyqAMimj14nWXwwYI/Yfo2F4ep2eAZEa9Fd3w1yuS3RBnqX3Ok0XiQ1fZefHkyZ43/+LcJsWcfhTgXOXgBx8rHgcH/CNtnFV5OF6xAgBPIlZTDO39yhNxVMQHndQNogl3sh6+Xv48bHVS5MP3ny60QNrxhrC7C6cFLH0hYa3ytdftPzrqYQUkmj8b+CBixOt9frmTnOTiynVqB2Z3+qoJN6sBr51WX+dUAvybQn3nM5jHPkpWn9hhhiiy3vkBgE67AmH0ifX9kjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifOwTx/ZKFSsq1byrKK3EedWc8qS4sOikGowXOjP3w8=;
 b=TkQyoSXL6kSzmcyPt3aUiNbJc3cv5kr3oxL936ywK/xvKnBIobI6paO7KUpuo5OzDGzPmxSdruUeeizIZZNPuG9pEJNrpbnYq5qiZDJlStBao/S0wAFFEViJxKI3A0VQOb8u/4USIIdz9aCMhQzuqVTvJEe+HKTFXpOmG49vfovV+vMlOKPypzcM8h3lu49hWJUjsBYMDx2SH8XAJH9d7e3sR/CZwI42Nx8SFnD+Lns7vWG4wIxyklbsIfbJVQ6hF2jIfrBpb+Z/e8U28I2sjJfETuNBfWk4+uVFzlV8rS1ISPzJ1z5OBwibVQJByle6Bx8OZWCZwm6/WBZ/uQu0eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ifOwTx/ZKFSsq1byrKK3EedWc8qS4sOikGowXOjP3w8=;
 b=uC303CXNebkOJme9dWArIqbVShtAnAiYF2Bjccx9wL2d7s0KpDgsfvaTn+ceb4IuCFmBS5U8YZcRDfciaoNm5p/9mlk4yM9aZHa2Ha/fYSI9ymGCDw80TeXBLen6FAKZINSK2c18cjM9fGKRAXnzGGwHbg+vwSPf382k4fHz2L0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by MN2PR12MB4157.namprd12.prod.outlook.com (2603:10b6:208:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 15:40:46 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 15:40:46 +0000
Message-ID: <ca5e9e7a-912c-4df9-a84c-616e471266c4@amd.com>
Date: Wed, 18 Mar 2026 16:40:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: xilinx: Fix race condition in event registration
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 jay.buddhabhatti@amd.com, marco.crivellari@suse.com, tejas.patel@xilinx.com,
 rajan.vaja@xilinx.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260317133451.1324251-1-ptsm@linux.microsoft.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260317133451.1324251-1-ptsm@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0452.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::8) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|MN2PR12MB4157:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b1ca9ba-3c47-4723-af88-08de8504b900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info: /CE1kxujgncu8DQUW9kEZkxYhYj4olvli/+ss7v27TvAoSUYSRo8bhEjcSbbm6mkmj+jDt0jbBSXVQYOrnKs4HWdIdPKmoDWHoKQw9wIspCJz8OQahiGr26iJJ6MCx96fszx5YvNzisVEDGCX7KaXxJC/xNRx/8izt4oXh7IH9MCqmgruVNQ/4lJyTXVQrPDJkx37vmrp8mjWEmlB/DC+8nESl5AQmIXD11YnEm20lh5u7vkvJLKcpflcXUODVQpKMxWpSRldqFAJ8TAlw05veTvYZLeu7XKwttId+pcoYazqtGcFpb87IuRpWKPUmfiB+H5IBEMkD64wevTkdyCS19LisDAfrNp+PjIK5b5NwPRamTsLWGJkl2/ipHeRXopcjxWVBjcfxKly/tgqypjj2pK1WdHfUGkGKh8Ndk32l+4nOCBABHsV+k9pQBuLdWu6dF87jYbm4kQ3gdCN78zUacm7yuoVMTxceKvQ6yXL4JGd7Wg6vreW8ioU2rh58heJbu/1fWODd0rsnRACColZSjdvwaCfVxIrgR2AOenQJf7v1xkSjxEWRmtf//qTs7wSHiHStDzgt/o4Su6jvY1g7SBmViLD6X4LFLZizNl18WsE25SzCjtRsRvzs6ykAIoHGD+nv+FEhUziFDtOfwP/iNWOAt2gdtcqyFmpWlO1blaDrO1PP/XACPu9Z5APa/XqEEUL/cN86I0Va4LVVbzw0VFDkeZHZDIFvDv55ZB+z0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2R6QS9ITklRZktvRk1vRTFtS0x0QUFSc280QWQwUVB2M0hiSktGMTFJYTU5?=
 =?utf-8?B?d3NsUXZFM0tYd0lDQ1ZUYmcvTVhIckpqRnNqVldYVjNHMXl1TWVaVC83NDJI?=
 =?utf-8?B?amFBLytybGR1MVFkRXFmOXl0cjJ2dXZLNzViLzR6UmV6VE5ZSTc4K1J1Q3pL?=
 =?utf-8?B?MWV2RGtzdXlDeDRNV2tvVWJMdlcyc2VLeXpZSWFZQjVSSGlqbjJvR3FPa3d0?=
 =?utf-8?B?RVkwWG1mMEFyRHFuR2laVHlJYUl0L1M5bk9QcURkcWpUam5Ua0R1MUcwTFpI?=
 =?utf-8?B?OStic3lWZkxESWZvcnpKMTBUdnRBZjlNOFpBZWdWeS8yek5OempVWE9EZCtI?=
 =?utf-8?B?UVk4WDh4OWZlS1FWemdLUitTaGYzd0N6cysxcmxzVmswTS9PRVhxUUs4eXNv?=
 =?utf-8?B?RlhlSm9BdXY5SkVZTGFJQmpPTVdBalZXMlczOUdjM1RGckxpVkUvQUVLTVU0?=
 =?utf-8?B?UnIzOXVKYzRrSjJmV2w3blF1U0ZYaEZnNHNyL3NPQUVHK2FUN0pCYUZ0R1Fp?=
 =?utf-8?B?V21RMHI2b0RIM1VTSlNlT1hXRTVJVUNoR0phRThwRjdGckJGMlduWEcvZS94?=
 =?utf-8?B?aXVnWHM4VWdVaEV2dXJZVGtQejZLbHEyMmV1UGZvK09RbFZsOWs1T2xjWGtk?=
 =?utf-8?B?c002SVpkdnlrekg1UVZWRnUvbDlJWUNEaW9JN1ZOZ2U1YXU4NUR6VEtEcERJ?=
 =?utf-8?B?aENNbmFKYWE3cXFQenEwelN3Z1FMSks3T1VRZHEwMlBHMW82aURIa09TbWND?=
 =?utf-8?B?NmN5VWhUMVFrS2NjQlJLY0lJRjU2czBVWk5UaEZTNURQalFuRmxnWkdxODFq?=
 =?utf-8?B?a25DQkpaMy91c0JOQmZKWFhVTDdaUkM4TW5XVVRvK2tnbWtxUlJKRmthdjVN?=
 =?utf-8?B?WEVMUyszOVU3OUxrTGVzS0YvUEpHYzVSZDE3aE5OVmNVTGQwS1pmTCs2TSt4?=
 =?utf-8?B?bE9RN2Fud1RSd1FtOTNXZ3IrS1paMUFhOFNWWmRnbU9SandOa3NxZnBOVnNX?=
 =?utf-8?B?L21yaEdzT3REanpvcTVRRktuRTRGb25taFR1ck0vMklnUFpWT1JHVXNHaWFK?=
 =?utf-8?B?TlhVbnpVVUdKSko5Q2xUMmZnSkhrMHJBclJUcHpIa2tCZERieUJvRHAyR252?=
 =?utf-8?B?OFM4Zit4QXJzL0FUVUVMRks2SjYycGpWZ3l4bFI5clZBalRJODlrZlN2c3JW?=
 =?utf-8?B?K2hhR2FsTjdqa0R4VmZUYUQ5MnZQYy9ZQld5R1BjU3pBTlhBUnBoUDM2QzFn?=
 =?utf-8?B?QWI2YTlxR09UdjVqYkZGY250WXJwdFJGaWlHZml5bTFRamMvWjRjQnp6eWVJ?=
 =?utf-8?B?Rmpyb3BGMXY4eFdBVGFvZlRsVUhIQ1RLUmtYQmg5bU1xSE5uOUdwTU5vRnlE?=
 =?utf-8?B?aG8wVnlXUUkxYWsyQ3kxbTB0MlNXQkZkeUVRUVg1eGo5Q3d2enJUTzRsbkoz?=
 =?utf-8?B?U2lOQ2tOY0tJZWpTUDNTUWNpYkI3a3BMMUoyWCtsZFZWcitqUU5Mak90eURY?=
 =?utf-8?B?RWdEQXk5ZW5EN0lMMjY1QWNpcE5vN3BRMlZTVFhnRThHbmxwOHBmbFlOM0Fn?=
 =?utf-8?B?Tk5NS0toK2IzbWVlYjRhajE1NCs3R0tQcWpYSGxwRkx6Z3pDcXhxRnNGVGFN?=
 =?utf-8?B?Q0JJdHpJWnlnN2pqY0ZIZzY5SEt4ZWtXb1RuUFM1WmJoc3RmRW5rNms0TWJR?=
 =?utf-8?B?VE5yYUdvbGlpY29LMnNrZnR3amU4T1E1WFp1aUozRmowb0M0eGVJRjNSWGJ1?=
 =?utf-8?B?bzgrT2Ywc2ZXK0dBdXAxZ0JSNC85L0lBV2xLWkk5aUFGdEkvVzJaYmIzSXFo?=
 =?utf-8?B?NkVYT09hQXRtQ0pXSzY4UjJzbEtiY3RNbnJ0OGJLaUdIVmZhVmFpam04WkNE?=
 =?utf-8?B?R1pSWDZvdnhBWFBwM2NTME1Yejh1aWFncmlCZU94bU1qWjZ5c2k4ZHNZeDRK?=
 =?utf-8?B?ZzJUVU9tWStHTVpIam02c1puMnA0aVNMN09mRlpyUDdRYXdVdEY5aEkxZVI3?=
 =?utf-8?B?bWNQUCtaTUM5b3hReWZFT1FiYld5aVZURis2MmZ0aWJrelR4ODc5ZE9sdTA2?=
 =?utf-8?B?ZlBpRmhERzVmTDAxQjBxTUt6aTBCWTdvVUVYN29NUUJLTDdVT1dXTlliTGZK?=
 =?utf-8?B?L3dSTzV2UjdPLzNQZm9GSWRjS0NONTI0dnZ5QWlPYVp2S3JIajBzVC9EVmZy?=
 =?utf-8?B?UlNmOWtJNWNSMm9JZ3JLcXRGSHo3MTdvWVU0Y2tTL0NtMGpuc3g4d1NpN1Nx?=
 =?utf-8?B?cHl0eTRSOENmOExLR3dEbmVQdXhiS3RlNkVIR0h3MVh4WGFyRUh1c213M1d5?=
 =?utf-8?B?bnIwSWN2Q1ZPY291K3ZoRnhKNjhvbzFKL290RnNRc1daOFpDMC9EQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1ca9ba-3c47-4723-af88-08de8504b900
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 15:40:46.6088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYOZ2eEuoG+CPbjWzHrm5KdjxJGSRZlME5PzmxXFx/aiNZxx/OXf18OD7zraYQPK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_084055_816036_76CE9DED 
X-CRM114-Status: GOOD (  22.37  )
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



On 3/17/26 14:34, Prasanna Kumar T S M wrote:
> [Some people who received this message don't often get email from ptsm@linux.microsoft.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> The zynqmp_power driver registers handlers for suspend and subsystem
> restart events using register_event(). However, the work structures
> (zynqmp_pm_init_suspend_work and zynqmp_pm_init_restart_work) used by
> these handlers were allocated and initialized after the registration
> call.
> 
> This created a race window where, if the firmware triggered an event
> immediately after registration but before allocation, the callback
> (suspend_event_callback or subsystem_restart_event_callback) would
> dereference a NULL pointer in work_pending(), leading to a crash.
> 
> Fix this by allocating and initializing the work structures before
> registering the events.
> 
> Fixes: fcf544ac6439 ("soc: xilinx: Add cb event for subsystem restart")
> 

please remove empty line above.

> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>   drivers/soc/xilinx/zynqmp_power.c | 34 +++++++++++++++----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
> index 9085db1b480a..aa35b63b45a3 100644
> --- a/drivers/soc/xilinx/zynqmp_power.c
> +++ b/drivers/soc/xilinx/zynqmp_power.c
> @@ -303,18 +303,18 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
>           * is not available to use) or -ENODEV(Xilinx Event Manager not compiled),
>           * then use ipi-mailbox or interrupt method.
>           */
> +       zynqmp_pm_init_suspend_work = devm_kzalloc(&pdev->dev,
> +                                                  sizeof(struct zynqmp_pm_work_struct),
> +                                                  GFP_KERNEL);
> +       if (!zynqmp_pm_init_suspend_work)
> +               return -ENOMEM;
> +
> +       INIT_WORK(&zynqmp_pm_init_suspend_work->callback_work,
> +                 zynqmp_pm_init_suspend_work_fn);
> +
>          ret = register_event(&pdev->dev, PM_INIT_SUSPEND_CB, 0, 0, false,
>                               suspend_event_callback);
>          if (!ret) {
> -               zynqmp_pm_init_suspend_work = devm_kzalloc(&pdev->dev,
> -                                                          sizeof(struct zynqmp_pm_work_struct),
> -                                                          GFP_KERNEL);
> -               if (!zynqmp_pm_init_suspend_work)
> -                       return -ENOMEM;
> -
> -               INIT_WORK(&zynqmp_pm_init_suspend_work->callback_work,
> -                         zynqmp_pm_init_suspend_work_fn);
> -
>                  ret = zynqmp_pm_get_family_info(&pm_family_code);
>                  if (ret < 0)
>                          return ret;
> @@ -326,14 +326,6 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
>                  else
>                          return -ENODEV;
> 
> -               ret = register_event(&pdev->dev, PM_NOTIFY_CB, node_id, EVENT_SUBSYSTEM_RESTART,
> -                                    false, subsystem_restart_event_callback);
> -               if (ret) {
> -                       dev_err(&pdev->dev, "Failed to Register with Xilinx Event manager %d\n",
> -                               ret);
> -                       return ret;
> -               }
> -
>                  zynqmp_pm_init_restart_work = devm_kzalloc(&pdev->dev,
>                                                             sizeof(struct zynqmp_pm_work_struct),
>                                                             GFP_KERNEL);
> @@ -342,6 +334,14 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
> 
>                  INIT_WORK(&zynqmp_pm_init_restart_work->callback_work,
>                            zynqmp_pm_subsystem_restart_work_fn);
> +
> +               ret = register_event(&pdev->dev, PM_NOTIFY_CB, node_id, EVENT_SUBSYSTEM_RESTART,
> +                                    false, subsystem_restart_event_callback);
> +               if (ret) {
> +                       dev_err(&pdev->dev, "Failed to Register with Xilinx Event manager %d\n",
> +                               ret);
> +                       return ret;
> +               }
>          } else if (ret != -EACCES && ret != -ENODEV) {
>                  dev_err(&pdev->dev, "Failed to Register with Xilinx Event manager %d\n", ret);
>                  return ret;
> --
> 2.49.0
> 


the same change should happen also for
  else if (of_property_present(pdev->dev.of_node, "mboxes")) {


diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index 5086c1e6797e..98bac07f73d1 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -346,15 +346,6 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
                 dev_err(&pdev->dev, "Failed to Register with Xilinx Event 
manager %d\n", ret);
                 return ret;
         } else if (of_property_present(pdev->dev.of_node, "mboxes")) {
-               zynqmp_pm_init_suspend_work =
-                       devm_kzalloc(&pdev->dev,
-                                    sizeof(struct zynqmp_pm_work_struct),
-                                    GFP_KERNEL);
-               if (!zynqmp_pm_init_suspend_work)
-                       return -ENOMEM;
-
-               INIT_WORK(&zynqmp_pm_init_suspend_work->callback_work,
-                         zynqmp_pm_init_suspend_work_fn);
                 client = devm_kzalloc(&pdev->dev, sizeof(*client), GFP_KERNEL);
                 if (!client)
                         return -ENOMEM;

Thanks,
Michal




