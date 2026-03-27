Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084EB10ED679
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 13:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2uU6p9oOhVjyzDGMh2qFtN0ERW8us0nz2Z936+7BBI=; b=QdE2ebnybmWmAzRiBtHcltNtq1
	BFJR+eh6bKwvrSAR7OAsseCip1GUSSOlFrte+98/5kdXYjf8mvZisxldPymQ+kbkI5exGSf/+IQpU
	dzftqjFiZ6IOph66epbpfFlVRTgVyPCwKkbRQLM+WN6FTvKtWGvgwgv3Q2KjPyre71CQFo8u4XMHV
	dVxRuWTq7ftV7akM5zJFunj2PTxpllTRSJMzt6DAX1EqIpBGzTsrbukXIbXTrvreFi5V8jfZlEk59
	1/54nttvc8vNNfU5+n8XPl4SfeQBtRaVhHYsCJaQx+SvsJx8/+zZvfnS9grw+oBzGLO/BZhoCeZel
	XgQp7Gzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67iK-00000007V6V-2xiO;
	Fri, 27 Mar 2026 13:59:04 +0000
Received: from mail-westus2azon11012004.outbound.protection.outlook.com ([52.101.48.4] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67iH-00000007V5n-1SiQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 13:59:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Slhv/hr5rPpR2yDIcvx0ZUEyHqVYZLusyjPqGGxnkNxbYmvl6DBNV0hCO1dd6NYcbyXfv3ATy5qAPiyi8gqnLbZkI9J2Bi9k8zN/WRWBoLXf/yKmp/50V1oKo/SH9HyWcL48bZ6diUv+PjDPB53T1tb8vkAEEkziqFFaAbB++ynWRlnFiWOXmAfgYFJfzHzXxrbNbVCNITu8IKXBWdsuXileWJYN13lzazhT3xsJVZhasrxmVoGgat5/H20mvreIExDVcGQtxHL6cisYwFRfiw4x/ZnhtNP9JbAc6vVVD7dX1C5O4ZMPNavmPLNU6wsGRVdATZp4IpT3OaqA5QBn4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2uU6p9oOhVjyzDGMh2qFtN0ERW8us0nz2Z936+7BBI=;
 b=YYp/ZmeToDL0tgOsXP7HrSkgZcMN2tD4PXU5Fn2tj+shULIjwH0K5C52MgpkaaaozTWjbUt6b255OKF2gS4dfMYLodmPYy+kTeeD5+70NrP4gAlW1e0FOi5rYfraSrOQLefFz2/7ZrftRa4t66dBw5fN8YCPfwiNMWM3Jcnhyz7dH74prrTUzOZydvtG1bupm0c+ZgZ9nQOhS7XYDfs4Waexrknhlp+BKKZ2+ezEZmHgd/QzIJMfYwcm6oMsorLQo7GPXCZ4p4GOmvmEOFr5ZgDJiyrXZJw9bXXR6JpXFwe4db7zaRUCmdYGuSY9Z8Ihxs8x/2G3KX8N5kLTZwMxyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2uU6p9oOhVjyzDGMh2qFtN0ERW8us0nz2Z936+7BBI=;
 b=x3Omn2dikgHofrTrj9WKtKjFq5Bwa1T0PBHHbOZ+AjEomqBJfnRrHyT6GU59sx2lPvdvitlbuLkyBNwjOpWWd7VfmeFKbTa7BW6xMSC9bFiOs5gMdALD6UyrL9YarGkuRAe/fhEkEyFsivw/wJOlMAqLfcEHi1JHXg0fnql7YQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CH1PPF0316D269B.namprd12.prod.outlook.com (2603:10b6:61f:fc00::604) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Fri, 27 Mar
 2026 13:58:54 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%4]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 13:58:53 +0000
Message-ID: <21fddc86-191f-40cf-b0a3-8ddd93b81d91@amd.com>
Date: Fri, 27 Mar 2026 14:58:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] soc: xilinx: Fix race condition in event
 registration
To: Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 jay.buddhabhatti@amd.com, marco.crivellari@suse.com, tejas.patel@xilinx.com,
 rajan.vaja@xilinx.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260320060306.1540928-1-ptsm@linux.microsoft.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260320060306.1540928-1-ptsm@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0162.eurprd09.prod.outlook.com
 (2603:10a6:800:120::16) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CH1PPF0316D269B:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa9c3b5-e7db-4460-51ed-08de8c08fb3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 6tzPeSXW1iNX/hV4tIotjzQIPlwhoUd3QPcvOHv1EVaqU/QBXMPqwtsvxCUJ3uBsK9l4Mtawu/nsauLPBuatUiQ9I9BMAV9lE/9RWN5GP/v1SsMrkDz0Nttrvahbwfyc45/ubju2I61mQtPDM7mlxXCOcw129vVcFJj0FAZIdr/mvr3WNiQ2O8j3zklmV2QoJpA3B/IgADdWKVzhxhVlaMluK87ukWcmprlee9lM5E/DvUsMcUN62b75Ms4/UXC6Hey27frwkZLDgrv0xxVqJkm9JssWcMXuDaKGSxe0JNweurT/AdhwLzYlS8QLzwM6Gs/5xOkrK7kyWxd97IgHTxbdClCtqbb77RovA6r8RYl/jDYvaE1uTaVyslcNm+GWMflRtxTaHh8U81sXN2p65cCMmldXJjmMFbsPorG8JiJiLZwJWmVjkBsqzP0voOp8FpPFJxR6nf//yefQL24R8pTth2Qnt3JTlQ+ouXufWT5adCo+piET2DCUujQum1AuPyhTLtUyqtc2qP+YocIRqCcbC6L7fkizs0bKfT4dQbcmEb/0JslEK7rPYNYg3zIkddhcd+7UmGrkBinXotsp0W7KC66vaHQxhWnA0/ZccABwcB6KBRz5mkQGlLZnFxjIsMB8nKhgYVV+fkqCO9j26CQrSj8e8zTiQ7w00Ynb0k5VYqtB6E8d85NK2T/h/sCMot2RMhd11ZypeKoCXbdT3HyrcIm/wyVqOO3T2+lT06A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXd1WWQ4OUkzMEdyRG5ST1pCUklwMHdmRnd0STc1cnBIdFZVcC9NQ1BMQ2dx?=
 =?utf-8?B?RTlFdktXbElyWmJHUkFocHBtbHRnTDhkdWVuajdHdmJKTGdLc2xYeHlXMS9O?=
 =?utf-8?B?YStnSHZQdVB4MEhSdWM1RE83R3JWYWVDa1gvQ3gvRHp2cUltS1JBaEkzekdi?=
 =?utf-8?B?VlhscnJ2NDlUZ1E5MHVxVDFwV29ocGJCd3gzOWErSmZwNTY5MjRRWGV2djlo?=
 =?utf-8?B?Z1Nlb2VOQnErUzJKQ09nTGRkdEwwZHkxbnkwY01KKzhmQU1yNStXcis5eTcw?=
 =?utf-8?B?OStlZ1VVK2FWOW5EVlgzSHBINGlPWmw2UE9BR1MvUXY2ODNEckRrZDhqa0pJ?=
 =?utf-8?B?SEFsZVEyWXpkanJjbTAraEI4d2Npb05NYk1DR1lEN0xzb0kxenorTTdYRm9n?=
 =?utf-8?B?SnpFSFFlSE5rZXBBKzV6ZXJMNUNac2h5UDMycndaM0ZCKytxNStmbVViTHNl?=
 =?utf-8?B?K2tqcVBTZFdJbmRMbHVKbXhCQzFxc3NFTklQbERTL0k4bXBnR3lwQ0RRRHRN?=
 =?utf-8?B?VkNrbE9WR2x6MEFNdEtzNVBDbkw4b015aWxPcjVIZVJ6bzlzMUVvNnNLYVM4?=
 =?utf-8?B?Vk9LMjhvbjdyLzdiMjdFYWxwK1RSb1pMWkJiUEZsUjFzOUxhbXJwWWl1TzF2?=
 =?utf-8?B?OHZSa2dTMENZTE1BTGhxSXIwSmdsUFVHdGlpcXVUYXI1VVAzWnk0Y2J1UmVB?=
 =?utf-8?B?WjliUWJrR1hLVGQrYnFYT3VrTFhCNE9od0hvc3FNWHQ3dUNuZ0tqSkJsK3A4?=
 =?utf-8?B?bmxhanRCT2c2QjFweG9GcGU5aXBnSXRxZUhxRTJMaWJ1cG5salpLZTVoQkNv?=
 =?utf-8?B?cHVMTmZCaHpXaVR4T20vcHkvci91MUpwMUFGZ0xxeXluZEpjVVArbW5LNUQv?=
 =?utf-8?B?VS82MlhMWll3cXAwcFMzUWJoVDR4cGNtQW1zQzBYUDhLeTgzYVlTeVBqL2NE?=
 =?utf-8?B?YWFtWTQ2bW82RTJDL2p5TlQ3WFF2cW1taXlCNE9tRUhWUWRLbkJhRWxXK0t0?=
 =?utf-8?B?dFZDbGF0QUlkQmJVQkhNMVc2RFlQTjlFNjJmbDJld1pWMk1iMjJpamRMdFRK?=
 =?utf-8?B?RSszS21uNzRkYjNOdVdtcVFRVEhyU1Q0L2w4THpSOEUzbkc0dkpRM0hqeUJa?=
 =?utf-8?B?UmpjWjRpOXBGVU9qaHFucGJNYmhmVFd1cUl1WWZkS1BoV0h0UC8xVnVYU1dD?=
 =?utf-8?B?eTJYUzBUa0Q5U1FhK010VjhGdGVzU3d2d2tKek5vWHlmcHAxR0prQ0gzdVg0?=
 =?utf-8?B?Y09tOTM2UXBYR2RTWFZDZEhFN1E1b0trNXlYbzVaNlJZSEVycW1TdVpHRFJt?=
 =?utf-8?B?RFJ2d3ZBSUo0K3ZhLzgzdFNrMitlYkI5T3JCeERFbVJVT2MzN3hHNkM1a292?=
 =?utf-8?B?QVpBaWVDMWYzTDRnU3FDaVlvbmc3RFY5UFZlZXlSUzNManA5OWU0YVVjWFNJ?=
 =?utf-8?B?MmV2LzZBWmQxdFNtUWJmSEZtdnYrREJNNWxFUVBLak9yREZGME02RkVaUC82?=
 =?utf-8?B?MC9ZbU43V3JsSWsvalpVVlpmVU1pNStUdVhlSFRuUnpqeWY1K1hqeHRXSlA4?=
 =?utf-8?B?a25MT0hTbFp1THlZd3AwSXFXTGtzcFZhSENKTHdaaTlaNVFLS0xuNjhnclBE?=
 =?utf-8?B?MlprajJMaWJhYzhERmVjcXVZVk12amRHYnovT2lZTndaUHhZOXZLaW9udTNH?=
 =?utf-8?B?T3ZSWkswaDdiSjhuaUJ3c3BPUzh0dDQvMDlYV3JmNE9WNjh3WUJPaGlncUtJ?=
 =?utf-8?B?Tkp2ejVqU2cxNXluYXdmVEs1cks0eVh5Uk5sRFBVTnFhTjhuTkpqM0lQTzFL?=
 =?utf-8?B?cmZyTTgrMUhMbnIvU0VEVElXc1FHNEtRWGkxeTZ0VTRpNk9UY1hPaUgzOFMr?=
 =?utf-8?B?dXJMaVJrTkg5ZEFYUU9odW13Q01KZ0piS3JQRUNvNkNMU0pmazRxT3BUVzUz?=
 =?utf-8?B?TTNLQmZyNTFPZ0MwYWVFb3VMLzVmUCt5c0tDM0Q1QmdxUkZCb3hza3M1Zi9y?=
 =?utf-8?B?azVRNFpBdXRKTjRCQ3p0bG1PUjU3MGUzLzZMc1lNSEtjVk9WTkVSSEtYMnZ4?=
 =?utf-8?B?bVZ6TENWblN1aFNMdzk3MVBwc2NCNTFuTHVwdHUrMXYxenRMTS9PcFZ2OXR6?=
 =?utf-8?B?ZjZFdUFrYksxY0l0Nkp3NS9PU2c2Q3hIWStxdmU0Nm9nVEFsMStIUXBhQzdL?=
 =?utf-8?B?dDI5bGM1cEhzWm9xZFptUDRxd3NMQ3hxb3lYa29FK05RR2YyUlY1TmZKTmNz?=
 =?utf-8?B?K1cwQm53VDM1cDlwY0dWZWVCNit3Qy8zZE8rSnBXRWRiUUJ2dVhrcFdCaGhm?=
 =?utf-8?B?RnRtUFJKaU9sUUFONU45ZWgxSmVORGh5VkR6d0ZxRmIybFRob3ZyQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa9c3b5-e7db-4460-51ed-08de8c08fb3c
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 13:58:53.8146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0omCCIb8i+8KHBRppJC5cWC0M+MIiC4Wk41niiXwY7uWYMzDFTovz3AeUMUeJqZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0316D269B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_065901_464836_387B0DF7 
X-CRM114-Status: GOOD (  22.17  )
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



On 3/20/26 07:03, Prasanna Kumar T S M wrote:
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
> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
> ---
>   drivers/soc/xilinx/zynqmp_power.c | 43 ++++++++++++-------------------
>   1 file changed, 17 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
> index 9085db1b480a..9dd938bd01d8 100644
> --- a/drivers/soc/xilinx/zynqmp_power.c
> +++ b/drivers/soc/xilinx/zynqmp_power.c
> @@ -303,18 +303,18 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
>   	 * is not available to use) or -ENODEV(Xilinx Event Manager not compiled),
>   	 * then use ipi-mailbox or interrupt method.
>   	 */
> +	zynqmp_pm_init_suspend_work = devm_kzalloc(&pdev->dev,
> +						   sizeof(struct zynqmp_pm_work_struct),
> +						   GFP_KERNEL);
> +	if (!zynqmp_pm_init_suspend_work)
> +		return -ENOMEM;
> +
> +	INIT_WORK(&zynqmp_pm_init_suspend_work->callback_work,
> +		  zynqmp_pm_init_suspend_work_fn);
> +
>   	ret = register_event(&pdev->dev, PM_INIT_SUSPEND_CB, 0, 0, false,
>   			     suspend_event_callback);
>   	if (!ret) {
> -		zynqmp_pm_init_suspend_work = devm_kzalloc(&pdev->dev,
> -							   sizeof(struct zynqmp_pm_work_struct),
> -							   GFP_KERNEL);
> -		if (!zynqmp_pm_init_suspend_work)
> -			return -ENOMEM;
> -
> -		INIT_WORK(&zynqmp_pm_init_suspend_work->callback_work,
> -			  zynqmp_pm_init_suspend_work_fn);
> -
>   		ret = zynqmp_pm_get_family_info(&pm_family_code);
>   		if (ret < 0)
>   			return ret;
> @@ -326,14 +326,6 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
>   		else
>   			return -ENODEV;
>   
> -		ret = register_event(&pdev->dev, PM_NOTIFY_CB, node_id, EVENT_SUBSYSTEM_RESTART,
> -				     false, subsystem_restart_event_callback);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Failed to Register with Xilinx Event manager %d\n",
> -				ret);
> -			return ret;
> -		}
> -
>   		zynqmp_pm_init_restart_work = devm_kzalloc(&pdev->dev,
>   							   sizeof(struct zynqmp_pm_work_struct),
>   							   GFP_KERNEL);
> @@ -342,19 +334,18 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
>   
>   		INIT_WORK(&zynqmp_pm_init_restart_work->callback_work,
>   			  zynqmp_pm_subsystem_restart_work_fn);
> +
> +		ret = register_event(&pdev->dev, PM_NOTIFY_CB, node_id, EVENT_SUBSYSTEM_RESTART,
> +				     false, subsystem_restart_event_callback);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to Register with Xilinx Event manager %d\n",
> +				ret);
> +			return ret;
> +		}
>   	} else if (ret != -EACCES && ret != -ENODEV) {
>   		dev_err(&pdev->dev, "Failed to Register with Xilinx Event manager %d\n", ret);
>   		return ret;
>   	} else if (of_property_present(pdev->dev.of_node, "mboxes")) {
> -		zynqmp_pm_init_suspend_work =
> -			devm_kzalloc(&pdev->dev,
> -				     sizeof(struct zynqmp_pm_work_struct),
> -				     GFP_KERNEL);
> -		if (!zynqmp_pm_init_suspend_work)
> -			return -ENOMEM;
> -
> -		INIT_WORK(&zynqmp_pm_init_suspend_work->callback_work,
> -			  zynqmp_pm_init_suspend_work_fn);
>   		client = devm_kzalloc(&pdev->dev, sizeof(*client), GFP_KERNEL);
>   		if (!client)
>   			return -ENOMEM;


Applied both.

Thanks,
Michal

