Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A325AC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgH04LOS5iueAfdsOjhxUDPKryDvOrQ3jWdjKQzon4o=; b=UlpaG8PBxVX/+nodhHL3Q0f68Y
	5GAdNw2QZk7nE9M/epNnkHe5R2/9LQs/GLP8ENmHn/oBxnn0uW3V+/ah2AXZPs0NA9stMKTB9rCIY
	ToS3T5mtJoterf0J0/qDFm4r/9g9W1HlU9SXSlvgQQFRIbGQuZZ5/XU4pqlFHS/rmFFszAzFIPOjJ
	dwkxk0cbOYSL2LqedKGhaG4Y4YXL/wkcltLhDQYwSm0ZH0TF1MhYh+HzHlobNXCfc92yuMd/KXfG5
	Qryp4JaXClgsFwMsFnFZDXq3n0/XAfb1aevbiN/dWppdv+ZCi943AqJIilS/mMGFrdl0vc9sZUKKA
	cEgf8EDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWmZ-0000000BsAZ-1xWK;
	Wed, 22 Jul 2026 13:14:43 +0000
Received: from mail-westusazon11012029.outbound.protection.outlook.com ([52.101.43.29] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWmV-0000000Bs9X-3vUC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 13:14:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EgJLSPwSU8L0vDfYA5rAUn6lFS3dCVqiqC4Zv6FaKd/5baB1v0HztWmA/MxQxjF/bIaMDVpTsKGWUvv7bVJT6Th91Ftv/hftXmw6S8RVKuVCtMwu8dQ7mC17I3924BdQtCEHOziWsqVoQfa2XJnCHMXkaAyRuXLtGB8drCYurLsBbm54I3sJLq0P1tZu+EL9fyazXbUZWUY9r0kHte7bKXXRVOln6doxvoCcPPP+ZdgENGtnMYswueNhRapFQbgSyn6QRELI3INv1xiRvKtmdOFazQxyUjELJS1sRNXLnxnisSdM6Jj6rEy/U0dG6ZIPq4ve/g/yBLbefmbKrMNkow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pgH04LOS5iueAfdsOjhxUDPKryDvOrQ3jWdjKQzon4o=;
 b=y2QVzijoMZtccz9U/tSGRqXxE5ntxC6wtZx9uRkK0ubIIiYHiG/FsrJy9g5etaIF/lrxb8Pugkcj85kn6Vii6I6ndO0q5N7rOlhFLrKxfds5MyX+kYPaTtOUMNUkMUHe2dI+oRTNGiuREYUN8IU0jdQ2II7AHBxyR1XqSbTdlE/w28uFcCp+gChVr+dBPNZk34wRCh5CC/acnbF95Wg4yAEVaQItAeuBTvDVG4AECAwFqP40VVasfP62BOetq/nFnrZ+7bDFaUbPqnOaeTRhMObDHSWBdFXJBB40NOMblJiitAhKya8krRUKJP53yxPmVq0E/mvGesPlW+1kTSs/1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pgH04LOS5iueAfdsOjhxUDPKryDvOrQ3jWdjKQzon4o=;
 b=guNz/iakrZezBdcqeVy5Lc24qc+zAidRH+yB4d1FI6KjSUwzyy9U5iTLrE63ThrJemRW4oQ2EPgfVyJB6Arm0v+JSTcUaCDEf6d1YoCNoTca+JPU2VEmERMefBgkYihMn+yq7BS/qR2i6IBrLoqJWqM1ClF1LswEFBdGkzpJyA8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by DS0PR12MB7802.namprd12.prod.outlook.com (2603:10b6:8:145::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 13:14:33 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 13:14:33 +0000
Message-ID: <895fe777-b350-41a1-be09-77ce9958d00b@amd.com>
Date: Wed, 22 Jul 2026 15:14:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: xilinx: Remove redundant dev_err()
To: Pan Chuang <panchuang@vivo.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260722023523.42269-1-panchuang@vivo.com>
 <20260722023523.42269-7-panchuang@vivo.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260722023523.42269-7-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0010.namprd21.prod.outlook.com
 (2603:10b6:a03:114::20) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|DS0PR12MB7802:EE_
X-MS-Office365-Filtering-Correlation-Id: a044c374-e877-4774-3eca-08dee7f32bba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|6133799003|11063799006|10067099003|4143699003|56012099006|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Wl9vVHqDYHexj87XqP1PtnbNcNMKaq0fWNkwlBtjrI/6VYfCZlhruktrMt/xsQzK0ngK6tr8/X78cXKLs7AGAKsBL8zQKTnx6uhOHnvwqam8nWaQQKnM0ApWMbJnCwMXChbYUdrPICTf9mE5RGlmKjoyY7kkfEhzLVxJf+9UCZHNgCm2Dyn7Jd3JgSCXsVKjtXUhkQHdU7XcHxMo11Gp7x9C6kq4aWoD31Oo7iCJrlilYpTqjYrEbN91IPC6Vutw1Hd7x+AJXJzrr2yQXdEVQpM9wsfG/h7YoGBjgrqnfJedGlk8M1A+Pw0l/OI/I1ip5lQRMFRGwwGktBXViHkjTL+0Dv7BPDLph3Ex+Hai9PQi7CvQJ70dvVGxhFjgbqDiE2rZQxtXDZfY2fjxhJ6TiJE6g8SgQFO5ZAby8iu8LNzQzD1H6udpxM9/hSEFNtyKEBwRiismXd63F0bhCdIvBbdt77mozmW9ZubJrivlfr/AA1MZdCiVBa+0grHWFlIBO5dpfqHXylgFNi0Hp2YOJol8migviyyj6O0ze3AJVDyBRYR9sYQEz7FtIck9MOEK4hfqMSaQzGkfO72BAa+mYScAzD+WgZX2q9HKZHpoU+PDcolRh4F1KLtmSUt9d3r0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(11063799006)(10067099003)(4143699003)(56012099006)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmhvNW0rMHE1VzRSQ1o0cEFWemxzRGhBdzNyZkpyRlBkQXBpUFVwUzBjeUEw?=
 =?utf-8?B?b1dpWTR1RUd5cmpkZSs4dDdVTTYrbDJ2RVhwbmtNSTI5dkZJc0lZbGUxdEVL?=
 =?utf-8?B?bk5vZHNKemFPTE1QdCtyNXlEcCtUcWlkb1ZvNkh4T2h4SWF1a0hBTS9FbThI?=
 =?utf-8?B?WEVFam4vQTBQb2hLNDUyYXJTcXdFNkMya1JSeFR5OU9PRDVEa2VWWkZ6dURu?=
 =?utf-8?B?QzF0VDNXUTRSb1R0YTZGNjUrcURYZVp4OFQwTlFGT0NqYlFGV0JZckFLZStx?=
 =?utf-8?B?YTNoLzdEUy8wcFZPRnp3NHRLV0x2OGdkUDhpTDdrTTlKaFYva3BDTzM1TXBC?=
 =?utf-8?B?akMvTjVRbHJZNXhBY2NmUXpLeUpDS29STkpwejJvNmMwY0h3SGFVaExBQjAv?=
 =?utf-8?B?Y0ZDMFVPOXRYZGNlZE5jWnl5QzlZb3lYRXlHZjltUjRXVWdwUkd6QTVWaW9y?=
 =?utf-8?B?N3BjdFRSclJsbzJCQnVpSVdWN2NlY0lrWXErMHg0eDFnMFV0aEdqNWpIK05h?=
 =?utf-8?B?WlpNZlVEQUdVakY2OGpnYW9sYlBacVlRVUlRejg2dGoyNnhrUk9LMmFlMk1x?=
 =?utf-8?B?azgzWHFFVThrWHFKckVxaXgxWFhlTnZ5emtDWUJnb0RWNXlUbGdPMnpxSVFT?=
 =?utf-8?B?T1JRSWs2V2RHYjh3RnNVNGRmaUdBbEM0V0h0eE1nRmZqb2t4UVRkWlAvSjdh?=
 =?utf-8?B?OS83eVdkWktJTzRtajRIS1RUanFlaDZ1dTNnRFg5ZW5vcWl6bWxYNHByQ2xN?=
 =?utf-8?B?ckNCNWhaVFVaR3BSYU9FYWNHdHkxVHIyeG50dkFKcEt5Tit6NWVSL01WT0FI?=
 =?utf-8?B?aHhCelJZQmEzRU1IaDN0LzEra0J5N3lJa3RmaXd4ZkV1ZHdkWHZjcFZtRkF1?=
 =?utf-8?B?V2E0UkNpblVJM3NIejdmT3NER0VzZ3ZoTkwxRUFad3J6SzJVaWZlU1k0Y0ln?=
 =?utf-8?B?YTZzcnRJVUxaOE0wc2FUbXdnK1JCVStnQ2wzcjlmWm5EUnhWalB5eWZTQmNi?=
 =?utf-8?B?TjJzOGRFRlZOWTViMjc0OHE5Qi9WQVFsN3FLdVBYRDZTcS9uNnhnN3N1YTlj?=
 =?utf-8?B?WTBSMXhPM1JZUDcyQmFHb0dNSFJXZ3hTbnNYN3JuNkN1Qmdsa1ZkU3ZJMGhW?=
 =?utf-8?B?enhGMUpSZnVKWDBxSlFIVUxHMmM0K1ZUSG9US01SWWhkdHNtY1UwYk1IMFdM?=
 =?utf-8?B?ZjVWbHdDRXZlcVd5TWd1ZWoxMlRURGpuS2lHNktJSE5zTXRPckNPUWlSN0I3?=
 =?utf-8?B?VS9iMWZaZ2xrSFZSQkZCOEpMNnNnZWt5Vnh5TW1yTGdPdUZmTWhMRmhWMHdD?=
 =?utf-8?B?OHJnZjNkbitHYnEwV2R2a24rbG52dEE1bE93ZmFRTjN6Q3U2azJQY2thaUdG?=
 =?utf-8?B?WndzZVFBUjhEYmRyZ1dZSzhKMmM4R0x5MDZLczhBa0tDZ0VoWVpnYUdjdnp5?=
 =?utf-8?B?VXBVK1c0MGs5cXRvTnIxczFDekRuZXpOclRYKzNweURuRkRMd0p6RlYxT21M?=
 =?utf-8?B?TWR1dUV0Ui9DK1M5SVduOCt3dUtVMWRlQ3ZUamg5Rm80L0VOTU54Z1FiRWpY?=
 =?utf-8?B?SC9IeUI1Y21ZaDFLbDVQSldCQUhVT1lsZmp0b3Q4cFVVdWZjQ2JsbmJFTnFJ?=
 =?utf-8?B?dFVXNGRuNE5GYVNvUXhnSlFQWitsTzRmUDZtZURSNkJYMlY2anZjSDJNUGps?=
 =?utf-8?B?Sy9DNDlPMlhRdm05ZFRzQmNQMW16MjVMWjFuTHE1OEpWazNvNDFxMVRQNFBJ?=
 =?utf-8?B?KzkrY0JpcXpDQmRPbmtpZFFuLzN2M3hsbitHUFV2bWN0eXQ0RnkzN1FEMUdQ?=
 =?utf-8?B?UjFLLzhDTngwdWpIZnorcGVDZ1c4VElYMVkwMGF4bG5IU3JEdG4vVzhIM0sv?=
 =?utf-8?B?ZGNUTVdzS0RpTXRDemhsRFlKMmdpSEY2dmZuQjhLRXJZNGRZams5bFR3S0Zs?=
 =?utf-8?B?OUFabFBaR01sVzYzVngwVi9HYkh3U3NmY044WmRhKzlhUjg0MTF3UWJaZCtn?=
 =?utf-8?B?SlkvemhmbTdGYjRPOVNkMldDRUFZSG9ydUJQbFBtZk11R2k4UGlwYXQvL3E1?=
 =?utf-8?B?cnNuRERmTUVzSm5aM3NPUmV6a2gwdllIdm9zQW16SkZVaFNMZVdYK0xFWWgz?=
 =?utf-8?B?Z0YzUjFqazBQRmN2WUFuTmVuKzkzcEdUOTR2TE1qc0NLYkxtaVhNZ0JtZS94?=
 =?utf-8?B?N3lETG9oVEk4Ykx6ME9idkZra3dxc1FZZUwvYWV3dno3anBoL3BqQkt3Yzk1?=
 =?utf-8?B?Q3ltRmVKSFg3NEpMTXB6STMrbWg3cW9KeW5jSkJxbDhnd044RFdQazhCaEM3?=
 =?utf-8?B?VC9ReWhVbUdBTlZVZ0o1WlVSbDQ3Nm5lNkh3UzUvUVJXSDY2SXI3UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a044c374-e877-4774-3eca-08dee7f32bba
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 13:14:33.1291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7iOpeCzGle7dPhs8z6/iTLA6WYyIe7pM2wFPj9cHOYILNa8ZJk3iNIBWuI8zsw6W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7802
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_061440_140002_F333A393 
X-CRM114-Status: GOOD (  16.29  )
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



On 7/22/26 04:35, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
> Acked-by: Michal Simek <michal.simek@amd.com>
> ---
>   drivers/soc/xilinx/zynqmp_power.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
> index 370e61ac47d8..54c796afb89e 100644
> --- a/drivers/soc/xilinx/zynqmp_power.c
> +++ b/drivers/soc/xilinx/zynqmp_power.c
> @@ -368,11 +368,8 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
>   						IRQF_NO_SUSPEND | IRQF_ONESHOT,
>   						dev_name(&pdev->dev),
>   						&pdev->dev);
> -		if (ret) {
> -			dev_err(&pdev->dev, "devm_request_threaded_irq '%d' failed with %d\n",
> -				irq, ret);
> +		if (ret)
>   			return ret;
> -		}
>   	} else {
>   		dev_err(&pdev->dev, "Required property not found in DT node\n");
>   		return -ENOENT;

But you still send it as threaded not really separate emails.

When you pass this message-id I am getting ti patch not xilinx one.

Thanks,
Michal

  b4 am -l 20260722023523.42269-7-panchuang@vivo.com
Looking up 20260722023523.42269-7-panchuang@vivo.com
Analyzing 8 messages in the thread
WARNING: duplicate messages found at index 1
    Subject 1: soc/tegra: cbb: Remove redundant dev_err()
    Subject 2: soc: xilinx: Remove redundant dev_err()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
    Subject 1: soc: qcom: Remove redundant dev_err()
    Subject 2: soc/tegra: cbb: Remove redundant dev_err()
   2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
    Subject 1: soc: fsl: dpio: Remove redundant dev_err()
    Subject 2: soc: qcom: Remove redundant dev_err()
   2 is not a reply... assume additional patch
Assuming new revision: v2 ([PATCH v2] soc: ixp4xx: Remove redundant dev_err())
Assuming new revision: v2 ([PATCH v2] soc: mediatek: mtk-svs: Remove redundant 
dev_err_probe())
Assuming new revision: v2 ([PATCH v2] soc: ti: wkup_m3_ipc: Remove redundant 
dev_err())
Looking for additional code-review trailers on lore.kernel.org
Analyzing 13 code-review messages
Checking attestation on all messages, may take a moment...
---
   ✓ [PATCH v2] soc: ti: wkup_m3_ipc: Remove redundant dev_err()
     + Link: https://patch.msgid.link/20260722023523.42269-6-panchuang@vivo.com
   ---
   ✓ Signed: DKIM/vivo.com
---
Total patches: 1
---
  Link: https://patch.msgid.link/20260722023523.42269-6-panchuang@vivo.com
        git am 
./v2_20260722_panchuang_soc_ti_wkup_m3_ipc_remove_redundant_dev_err.mbx


