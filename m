Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4145C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNrEi7X2FtACU/OyXj3bE/A2mD+SbPQQYZEhKSNBQo0=; b=d6FmGkagWegwHiaOMqM6N+PJMc
	jSjYNGKhzdpZOVSkVwDKqAbT/fNn3StGqoxXxsSdT3XY1jRSj9tIjZD+AaHpP8hV1mv/LTnnLvGTS
	BwQb5awkrhDAYqaLXb0jeGYIOKdRsQ4B6pOFdThxV2BsfEpPTqqu8Ey2xeAqfpheETWibVLVuGauE
	f/O/j0SYY763rCsGNiTruNVE9+bAaMZFGjgLPnPXPfbeXzqLr4y4pc7l8IQlKcUYsdfMFBhcrlXcV
	ceEVdM66MfGdq6kHTZPZAIVD9fHJzse/FoTrmR8EAMZ2/hHidBcHGsQQ1rwYjxfoXTK82q2rzIHaz
	iTsTzi2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwFU-0000000EiOn-0Wr0;
	Thu, 23 Jul 2026 16:26:16 +0000
Received: from mail-southcentralusazon11011042.outbound.protection.outlook.com ([40.93.194.42] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwFQ-0000000EiOF-3d1Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:26:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpOm1lnxFy9biC4pbcgN0jkxqIl6Dccqr/FDQK2YrMA8bmmx75iUKdvSdTujwCUG5wfyq8Po8UNLQMKnDgHGEcHDzS5ajGF8/ndF7PeLdt3zlCxoPz13jrush0dUeQSFfB41iNqi4RakMJgfMwZh233zEys+ApMQWjViDACaXRH1X3bBOZ6jvmeI6Omu1tJEljW/LB4Nh+4d5bbIZhWAyDzsqLC/UpGyJg5MzL9JgUFgfdH9bPrU/zuU3C4CtBv5nSr98/54utw1gRS5Awtku3dMl2mY6lYW6/hdTmJQF24TCbKr32+mEqbzk95/YLfPFOz8XsBvqzZwnSvsu7nisg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNrEi7X2FtACU/OyXj3bE/A2mD+SbPQQYZEhKSNBQo0=;
 b=we5bG6Aalr7AolhK6N6AibYpR63lDF9+STi8n0YQecLMHxK3xH4XDeBVoY8YlQw52+P5+ZKiXBwV3n9lTqKibffA4utrUaRMOGJYtB6wDjyTiGDwfV1nyh16kFS8i9Ls64Wq21GVSBUcxJ4sfB+x2Text34kZE9mKH3MRBvbh4h+swUcWY+6UlbWppxYxK18Y1fImN0TRte7AeZZCa70RyacumI2Mbok6b/cp22a/DlFvZKCJRYrOqKfiR25AKYahGpwW40seq7DBTmo34smY8bDWf2mUQvs5GlS6yQc405E5V/1TYvYCEwM3bFmxdSatu6swd2hCNRTz59V/ISOcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNrEi7X2FtACU/OyXj3bE/A2mD+SbPQQYZEhKSNBQo0=;
 b=QY4rSvtmUZLxuny6aAYEPo0rn6n2ODO7NuQtv0CwGkdUawp7pnYhrv5cr3GMLhD0jUeFW904c3jtpkYuBaM6J9uvkEs7e0xz3Jie3omauM5I1lwhEdiDxqsnPVqqD253dOvAsDNl9pACZr1pMq88kzrdeH17UhLJTt13ucXrJ1E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 16:25:59 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 16:25:59 +0000
Message-ID: <e17a0d43-ac6b-4a2c-bc95-cb31e7befe9d@amd.com>
Date: Thu, 23 Jul 2026 21:55:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] firmware: xilinx: Release all peripheral devices from
 firmware
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, michal.simek@amd.com,
 git@amd.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
 <20260723124841.2567827-3-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260723124841.2567827-3-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0071.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:267::17) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 24985bbe-35e5-44ec-1bcb-08dee8d7145d
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|4143699003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: XHhTAURMuMKSQ36okhTFQdfMNMyT7g++rPyBBFyXDZJN9mE0ruKCbosPE7Ym8+I/ixCLVEyow8GHHSWzdq/ZAR4JWscWTAa0olhNE0R66uzV0SyrhBICSVBpYLbMhEt0LY/4atboyOghDHmlU6vZJ//EVt/gkovVOmCAgQ+4RUbMpMWmfoH0EdzzpXjc1Oeh0iJ89g+iwFq5YXhdbHbYZ53tkyhtfnjUT+BhhF24RNdrp0r2Usp+JrFaoI9fMUy5R1nQLCc0hA3OXtdomWsWXqNFPVGxNwtuB2ffvrQqZD/ZSusMWGN4fI0UE77ScY2tPsinsYT0zMAsooxtIGE9ikIAjXPYUhG0qkXAruj6HsBrdW1L7hWmza/ymlCLEQwDJurXQ14TR1XQ8MOdcnoJYH+kY/E4kKH8Rntay8dvGApFhtujEfsfvhBzth0JlVVYMZs4q1DLY7CvfefF4v7UB58I0n4c/32qr4k3iATCdC4q4pu/D9aHJGw+Ol6CQUSSFO+mTqCku47DC0EnqHlxcoEYQbY2kwGbKxq0MkCqy9FqCkk+L5Hx92i41HoklnjY82KJFLXlUvLRntRex1Gsr897yrAYSPg5hDV3tAgzHxve8mMolek0NNrm1/2Tyv6I4dfvG3BlJTcNI0tyL/7EeuWGauO1zTf7ptjiDh6Bx8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TllUdzVyOHNhdFNTVStBRVhZWFF1WmtOck5jNkVHcXJOZ0kxTTFQUjJVZEx1?=
 =?utf-8?B?UlhRNCtoOEtrQTl5YkZsQ3U4SVZaaWNUS3dkb3k2dnJmNWs4aUgxRjd0bUU3?=
 =?utf-8?B?ZWZBR2s2LzBBS0Fzb29OMjMxVW9TQ2V0SDQ4aVhZSnB3bTZtQjBpSlk0ZEVP?=
 =?utf-8?B?dkZZd3dXZzRjMitLMFhjL3JjbitQNFFaeW5zUkJOUFRTSFU4dnduZ1NHbXRj?=
 =?utf-8?B?eUVFbUpHbGlJbXVSRytnaENacGJyb1k3WWcyUmlDbllwQ1Iwa1hNN0RmbFhR?=
 =?utf-8?B?aHZ0ZUhCajlwenY0VWEvNk9ML1BVTjBFQ2ZJYWRxTTRXT0pBWVhIQVdIWkZi?=
 =?utf-8?B?WU81N0RVOFVLZnpJZ3BqMnJsWEd5ZXAzRzlTb0d4S25icnNJTWxkNzQyTklF?=
 =?utf-8?B?N2N1clUvbVBzUDRsZWQ1WHczdDh4MC9IRkJYbTlmcGJtSnNvNWRaZnE1blF0?=
 =?utf-8?B?d3F5MnhpQVRTNmNuNi9lQm5CTjIwYjk2dHpMcktJMzRMRm9mQjBkN2gyV0lR?=
 =?utf-8?B?eFJpd25rK1pvd2hOQktXZ0JCamFyeFloeEZhYzJ1VXFqWUFxNVAyWHpTMDc4?=
 =?utf-8?B?ck9CTmp0QlA1RjlpNHR1L1lpSjZhcCtCVGpZTlVQODdNeURDS3ZEYlB1R2hG?=
 =?utf-8?B?M3I0Z24vUWpnTnRLT2JxN0p6Uy81WDFBZFd3VHhkbDl0aWVlZEI2TjZvMUJs?=
 =?utf-8?B?blcyMnJkelgrU01rblRrWmE2S3BtQ2pLUVh3aUpkekZHSm54THVJZExNY0N6?=
 =?utf-8?B?cTBIV0VmR2xUbHdOSU93ODNya1N3TVRYYTMxbkhHbE56bGVLV2FhZDVla2py?=
 =?utf-8?B?WStIeUdRTHBGczErcndIOHZVWkVDVnYrY0FQdjc1WWpxajEreG11eXZrZlNB?=
 =?utf-8?B?TnFKQjN4YzV4U3hvS2o4K3I3OUZOQkE3SXBsakVGd01yNHhUa1hDZnNoM01l?=
 =?utf-8?B?akdXRUJ1VFF0Q3NIbEhaQkFJTkpXN0ZYVnZJVGpob1pMQU5qQU4rRVBtckEv?=
 =?utf-8?B?NURNUk1EV2REdXVTZnhRalJsTzZ6Vy8ya1JMMUhsZWN2Vi9KMmNhZTl3MmNH?=
 =?utf-8?B?eExVSVNkUGQ3UDlNZStJMVZVbi9Wck41dERtN3p1WHdmTXdRdHY4aVhGNkln?=
 =?utf-8?B?bDBLRXlpZlp5TnpLWUV0OWRRT2RodFZ2L1ZTa2UwaVh4WnowaVlKOEdKWFRL?=
 =?utf-8?B?Q2NpMlNyV0paRG1EWnVGeUFPODlZNGhlTGhjUlJSTS9mb3ZscllsSEVsOXVG?=
 =?utf-8?B?NWt3Yk1mNFVoTHJMZS9sSHowOXJRWWZZVVJIcU1Qb1hqWkcrNWlVcXptV25U?=
 =?utf-8?B?VzY3TjZldm9EQW9hTmx1clN6KzM5UGhzdDdRZUR1UndhSzMxdEpMYytYNVpr?=
 =?utf-8?B?aVg1TEx4WU9XYkVoTEd3OUFBVElmODROMnROVHcrMkZHQWpML1dTUzk3ajdt?=
 =?utf-8?B?MFRXcTNVc1J4ZXpQRHkwRjBWK0tQbzNvdDRRREpOSDZlSjdNRytLVVBSblU0?=
 =?utf-8?B?bHYwcVBpaUtlS0dWNTdUTXQ3M2xnZmpXVGpQMytENlZPK2VMWEtRMzYvWGt0?=
 =?utf-8?B?M0ZyYSthYnhFU3BEU1F6eWtUd3dTYkpteXN1QzBHSE5NbDJkNE5LNjhzTWdD?=
 =?utf-8?B?cTZYM2hqdGpJL0JEaUhGcEZnTnc1a0tvRzM2Mm14elRabEluNzFOOWdYM1RB?=
 =?utf-8?B?bDBiNjhXM0RCMXZWc2hCaER4K3VzcUpOcG9hRzBpa0Z0WWtmVyt3U0RMejM2?=
 =?utf-8?B?YW1WTzZQM1N6eDlKcUhXeXI3aXhidGlsa28wUjJQVG42S3pkWDc1a0VkcWZz?=
 =?utf-8?B?TzMxbTFkTlI4Zm96WGRQYXZlYWZCdHYxTzZnZmFTQ0FWZmd4U1RwTUI4anF1?=
 =?utf-8?B?bFVjZlIzQUNaWHRvdXdmMzdtZS9mY3RqV2kwY2g2bmVZNXAxU3hETXNSQ1Vw?=
 =?utf-8?B?OTM3cTVSU3hzSlpTSkYzTHhLbHA5UDZyQWt1MkJFV3NBUllUMnV5eVdzZXRl?=
 =?utf-8?B?aENxc1BzUGJQampGZlFFU1kvUFhiQVphSndlT1RDSW1LUkdRK1IwVDJ6dXVI?=
 =?utf-8?B?MDlKZXRGM0xycVdsbU1pRTdRM0ZaMnlQZjFYbThvWEJFcWthY0ZVLzN6a2Ir?=
 =?utf-8?B?MXFXd3NEVjI1Ui95ZXVqalZiZ1MwWENHOFdiWU1RYmRrUnhIaU4yN2JXVjU2?=
 =?utf-8?B?a1d1UU5RV0VqVHhrMG9ESHlmVDllWm02TzRFTTB3Wnl0RGE4OEtqL1Y5YjRZ?=
 =?utf-8?B?SFZuZGNreUlTM2Y5VkdmUVc4ekxJTU42WnRheVh5MzIyaHRDWGNleGNBRDZL?=
 =?utf-8?B?TDlzN04zRW85eUw5M1Fuc2ZYTjAvWWdyN3MwVVVVMWRrRnlQSUw5dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24985bbe-35e5-44ec-1bcb-08dee8d7145d
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 16:25:59.1585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5yilM5AswbPT/vXvpoykocZqOXu7i3BSyaOIgrlX5YqYHzONfJek6IyuTPPc+Om
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_092612_924172_0BBFFAC8 
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

On 7/23/2026 6:18 PM, Jay Buddhabhatti wrote:
> During a kexec restart, only the kernel is reloaded while devices
> allocated in firmware persist, causing state mismatches between the
> kernel and firmware.
> 
> Introduce PM_DEV_ALL_PERIPH node ID (0x18224FFFU) to release all
> peripheral devices during kexec. On graceful restarts, this happens in
> zynqmp_firmware_shutdown(). On crash kernel restarts, it happens in
> zynqmp_firmware_probe() of the reloaded kernel.
> 
> Releasing all peripherals depends on firmware support for the
> PM_DEV_ALL_PERIPH node ID. On firmware that does not implement it (the
> feature check reports a version below PM_API_VERSION_3) the release is
> skipped and a warning such as "Bulk device release is not supported by
> firmware" is logged, e.g. on Versal NET firmware that predates this API.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!
> ---
>   drivers/firmware/xilinx/zynqmp.c     | 15 ++++++++++++++-
>   include/linux/firmware/xlnx-zynqmp.h |  4 ++++
>   2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index 95ffd8f33ce9..64d2109eefd2 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -2070,7 +2070,7 @@ ATTRIBUTE_GROUPS(zynqmp_firmware);
>    * zynqmp_clear_pm_state() - Clear subsystem state
>    * @dev: Device pointer used for logging
>    *
> - * Clears PM specific data in TF-A.
> + * Clears PM specific data in TF-A and firmware.
>    *
>    * Return: Returns status, either success or error
>    */
> @@ -2097,6 +2097,19 @@ static int zynqmp_clear_pm_state(struct device *dev)
>   			dev_warn(dev, "TF_A_CLEAR_PM_STATE is not supported in TF-A: %d\n", ret);
>   			ret = 0;
>   		}
> +
> +		/* Check if the firmware supports the PM_DEV_ALL_PERIPH node ID */
> +		ret = do_feature_check_call(PM_RELEASE_NODE);
> +		if (ret >= 0 && ((ret & FIRMWARE_VERSION_MASK) >= PM_API_VERSION_3)) {
> +			/* Attempt to release all peripheral devices via firmware */
> +			ret = zynqmp_pm_release_node(PM_DEV_ALL_PERIPH);
> +			if (ret)
> +				dev_err(dev, "Failed to release all peripheral devices: %d\n", ret);
> +		} else {
> +			dev_warn(dev,
> +				 "Bulk device release is not supported by firmware: %d\n", ret);
> +			ret = 0;
> +		}
>   	}
>   
>   	return ret;
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index baaa88b0b197..ac39e5492961 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -50,6 +50,7 @@
>   /* PM API versions */
>   #define PM_API_VERSION_1	1
>   #define PM_API_VERSION_2	2
> +#define PM_API_VERSION_3	3
>   
>   #define PM_PINCTRL_PARAM_SET_VERSION	2
>   
> @@ -145,6 +146,9 @@
>   #define XPM_EVENT_ERROR_MASK_NOC_NCR		BIT(13)
>   #define XPM_EVENT_ERROR_MASK_NOC_CR		BIT(12)
>   
> +/* Node ID for all peripheral devices */
> +#define PM_DEV_ALL_PERIPH	0x18224FFFU
> +
>   enum pm_module_id {
>   	PM_MODULE_ID = 0x0,
>   	XPM_MODULE_ID = 0x2,


