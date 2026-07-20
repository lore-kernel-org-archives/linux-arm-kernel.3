Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD311C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAxOjPJg4/1DU+kZyZtp+50ZSzFoLnovLRubElT1Mx0=; b=cdoaogvhyZVRJng6VLf1PUD6OT
	oNLa1tVnYlJF2u1UVYRnHzdQg0nTJhXZT4L2QIAhcuJIK4Lp+dbh1faCClB0HfxcF/kZXNOPg0MSx
	OKbSmHI3kG/P2HeupvAF8yc/3dom+mJLC5E+XzT6OQN+SIiGIEsCdY/NK8WFNdYCGq8utpbGwD0sb
	GZHJf/AztU7P7pIcyQ+xiie2y1suASFC/2QdIcTaLLBBCdXDcL+RLWVRDIB76IDDaEOUzuEjAmbs3
	KoU5Bwvph+NZMz3Xxu+6B5Wg84hMc4ksK4irzIVTz3zp9vUBnffryQj57w8ttno4Mjmb7saQlIZ/R
	i2SHQDsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqGe-00000007Gbh-24DC;
	Mon, 20 Jul 2026 15:50:56 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqGc-00000007Gb2-0sO6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 15:50:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuoGtW78iywhhfOVcAhZW5U3/NcPUPWC10XLZMgWRBry6ceQB/Y/bEK04jcPSBD+FzRNNN4onJMldcKnZshmmFspes1K35w3ur5Cmkghu2Rb2J++3b9LSHARpQAqxPF404oMcu7etYC0Suc5mYEfZ5AcF4yZX4Mtp679z8UV+HM2OrkDlFTwjmaU0Ihkwys7H2/3dOmE4Jalr74R/81DxRJKo54Ad57Pvp3F/0HqO6t2WFNrG2eQLIs8BxMJtWWxtNjLKe24V6MP9CeHBXCKB8AiNObMYFDz4B9SmvaPji+c6hanQPazDBMw5vdnIEB5rLfMIUL/z/q+A1eyO1Hqyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAxOjPJg4/1DU+kZyZtp+50ZSzFoLnovLRubElT1Mx0=;
 b=vqQc1WHm3ZIi/ECgYhZ23sZGQxg+Ajlifbr2f0JcaKSy0uI7xnu/SrDaiaQsQ/HWLRZGMwFdNjntI+Y3yEfHVzBbR7X5Bdv/poIg37eb0vHrv7UAAU4S3cBjx8HsKfCSg4yuTLqU3KVhygpAT8I/7AXIKFHbi5Jd07com+pPgXs30bQHA/HW8rYfyFs0OaehhYAFBjlWRQSBD6CQ41Px4ZLoZApfA+DE/+BAiHUXOJGAbsHRIizqBUQDCcr9PsMmen4sHeBawZiEYlGS0JWsOje/upsdu+1ioyh7kArcBxhjv5y8asXYpj2D7JUuvP5bOk3cv1/SVDqWRLN6ZMcdWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jAxOjPJg4/1DU+kZyZtp+50ZSzFoLnovLRubElT1Mx0=;
 b=FggQmbUWpKjhzn9Wwo1JnHdKfvFRN87o2Q6obMhcvY5qkTqHZf4fQdC67dWhTA3lOvNLxcNZ3rYFwK7WxGdXY0KPkI8tz36ottTbCqArqTaPGOmxmsmQSinsmKPpCGIp1QLcPmyUJ/+Jw3UCCEyfpcEmpyBuWT+A4ReprZSeo8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by MN6PR12MB8543.namprd12.prod.outlook.com (2603:10b6:208:47b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 15:50:47 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 15:50:46 +0000
Message-ID: <8ca27e7b-d122-48c1-bf1c-0f104c4a7eec@amd.com>
Date: Mon, 20 Jul 2026 21:20:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] soc: xilinx: Remove redundant dev_err()
To: Pan Chuang <panchuang@vivo.com>, Michal Simek <michal.simek@amd.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260720095920.542801-1-panchuang@vivo.com>
 <20260720095920.542801-8-panchuang@vivo.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20260720095920.542801-8-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0030.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:26f::8) To CY1PR12MB9697.namprd12.prod.outlook.com
 (2603:10b6:930:107::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9697:EE_|MN6PR12MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c845d93-9c82-456e-4de8-08dee676a9f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|6133799003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: t61jLESe9wU1ycwMcn/HBIdWE+RSBYDg9oVvF1yRj3E6rR9CSMcx5GYzEEnN1BE4gybw86kw3SGgpe3F1XWt6238zlP1j1TOgQvreir6Q6tfAZeuP9cxxhrxFbmR9EH8mA0sPbXoxQ13pCHjyunRLzqqPnLwdrLMMzSOulc2HPmwiLGEJ+ROqEyAc2ajdQ2farRyDlZtY//O59iyvyFG9ftBjh9p2I/6YwPKdcMfZ7gEfA2avxWyDB0W0JP/SRpP7ji23vXvGRScwzaN+9PMRAg3roT1OYO4DleBwMZ4QZM9SGIhAaq5usfzmJ2JixFkf9a+JTrsYGcar78mY7u7WOzps7vhZaEJumWBnDJzLLWltErVPFJ2rXCEQfG1jcsi/iXGqVp5KZ84RZ1evALiyLeMT4IIwMlQ6r/B3FT4goJVO6RTxVLqsdP6HdUvLrg3PTDYgMJ0lmcgBpvqRDLq7f8COjmkuF2tgIDavuDoGQNhp6grmoTYQWlAPKqSPJpb28DxFVbZ8Xv/H/2ONrz7vz6oW+32Uv5LeDAhUHApctmqZIXBKewM4GY8G5RCM9WEGazP0ps+2WxLDwiJGYoK/EsuU0dvB9fmgZQHK6SaqDROBeRmNYPUdaQMX0KIfqJSBvnT2ZksW/C+0yMS7Qk6DSGkQ3jyZS0IPbG6qd4FnBo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXZFNGhKQjI0cENINlA0aXVDWHFzMXhxN2hKaFg5ZWFDRDlxNTJVT1BGci9t?=
 =?utf-8?B?R3gvZG5zMWRveW4yR2lmK1huSzd3RU0wTWlabk5Rb0k3YUxmQStFQ1paNGtn?=
 =?utf-8?B?ODRySDJ4dGpKeHJrdVFDc2l4a3VKK1pJRG5weDBKekkyMkxzVGFoQWpDNEk3?=
 =?utf-8?B?S3pEMkczSWdvY2RxeUFTT2EyOVJ1WjFUbTU1elIycXlYV0ZrMm9IRFNOeEky?=
 =?utf-8?B?dTBma0RETDJKSVE2eUFUclo1cHFscStzTXZheGUwWFNFSjZyOHIvVmVUZzF0?=
 =?utf-8?B?Q1plWUlJa3lRbVdkM1NiemlrdXBuVndwTkd3TUY1Z3NvTS9LRVlRN2tkVmFw?=
 =?utf-8?B?eC9xa2JNa3ozRDFQNG5XSG9EWVF4Y3VFbXM3alUxRjJVanBuUStVc3hqbmQ4?=
 =?utf-8?B?bkxKOExNL3lVbVNvYWZEMlBpeFU0U2hNTHk0VDZQM0ZuWnZDbDZ4UGJSekpu?=
 =?utf-8?B?ZUkwNlJxMFQ3SytoSzZpZW5jaU5hWWprdnRUVUpkNS9sY3plMW1iemttV21S?=
 =?utf-8?B?V1RFdWtPNFQrQVZneE5YWmhhQ1F4RExnY0dLSmlIalJ6MDNWMVJpQTlqODV3?=
 =?utf-8?B?OFZ0VEExYXpZUytxc2VpU3IraFpVNHk3Vyt1ay9UclAzNGcrUEdINEVreHky?=
 =?utf-8?B?b0c0aEYzNWxMMmFERUdMR2w1VFVDSTRRditPQlQxRitqcVNtWlptV0ZRbnk0?=
 =?utf-8?B?V2JtZ0xtbnpob0NkT2V3bFExbElTZ0lxd1lVZGJJSHZlUEJ5RENhU0NSSUlP?=
 =?utf-8?B?bWh4bERoNGtnR1hQRStsT0RidnRmVkdvZ2JvQ09Ma0tGSW1JTFEzL3RaL2Y4?=
 =?utf-8?B?LzlhRTdFRG92QlladldXYUxZNHFuWkxCNzdKUE1kOHVuaTMrSTE1eXRhWGxU?=
 =?utf-8?B?RUlKaWp1dHBVMnl6cW1IZzF5Z1huWHY1VWdpd29DMlpUdGVpTnZEZEJVZEg3?=
 =?utf-8?B?TkNLMjdHZVdRdllacVY3bTdtZ0RyMWdZTVBBY25jVmNzTjU5blk4eE45Zllk?=
 =?utf-8?B?Q3NWcnNjUFJLSnpFbkUzanZ6c1Z3UjB3aWVmeENmVExQRTdaWkZNeUJvZktt?=
 =?utf-8?B?aGVja3lsemZQM3BRVU5SQXFYUEQ1TmFoUmZBMVhDbUtvRGt3VnNnYjdQblVN?=
 =?utf-8?B?S0ZjKzY3Sis1SHJNcUl4MkZNYXo3S3g4cGNVdUlQMjR6MS94QmExZ3c2MG0w?=
 =?utf-8?B?N2pxNUkzeUxITFRUWDRPSnJuRis2R0R0Zis1OW8rUTNlTWNNRVlGOWpOalpm?=
 =?utf-8?B?bHc0ZSsxdlMyWkJFYW9EdkdSY2pvajNhZy9lcE03YURuVDdkYnlYWGdzaGlI?=
 =?utf-8?B?VlJlem45enNjNXVkem5ITy9yN29YWC9WNVhna09ISDRlWEthd2djNEgyZ01p?=
 =?utf-8?B?WkxLTmpWRjBESk9UQ3lteUViaXRWL053R2JibUNCbGY1VW53OVJ5dkc1NVJN?=
 =?utf-8?B?L2ZadElGcS9nK0NBR2NhQ1BzcjVXMmE1Q2YydzVCa2dMaUdZaDRrUk5HSW9t?=
 =?utf-8?B?R2I3bEJ6dGxlTjRXSnlpYjBNRExpdHpWSXdhYVFOYTZWYnFUc3hCWmROTnBh?=
 =?utf-8?B?M1podmlIaVNoMnl1VDkyMFJ1UEpCRlZtNUpPSUdWZC9PNzNOZ3dJQlQxSGVM?=
 =?utf-8?B?dllLRlRLVGN4WUlQT3dTUG44UmdienlFTzU3MW0rSjR5MllaZk1GeG5QR3BD?=
 =?utf-8?B?SHdZQVV4cmF5VldScStWcTVPcUwrS0ltZThBQ3pSQ05idHF1cGxONkVvQld4?=
 =?utf-8?B?YkRHRXV6Rk8wM3FKaDF2bG8xR1V4dW1KVW5IYVJrSFlML016ajB4K0NyZEx0?=
 =?utf-8?B?Y1FuYWdvZlZtTkY3dW4vZkFUL1p2Yi9PVzBRYUxGaXRibFhmRGlRYXc1UGJN?=
 =?utf-8?B?aFF6MWtTdlN6eDJOa0JVNmYrVks0RVg2K2JoTG10VzBSTkh2ZmsyWEcxbWtG?=
 =?utf-8?B?ay8rczFHQzlGSytHTlBVYXd1NnJ5ZlZFNFJ6dFZrUm9aVVZwbFRxdU5tTnBM?=
 =?utf-8?B?TERkVU5McVpqenZKS0VoUGJMN3lZdWhoank0VzdrWVJaU0p1Mjljc3FsQ2lr?=
 =?utf-8?B?L1hIdVljQy8rMlZiVFBKZFpvSkdiRklsalBROGNQREg4c1hJOC9rQVgwaDlE?=
 =?utf-8?B?cnRzWitRYUs3TmRXdHU2ZGJhRDdKOFQyRTZwZkJzajNBWHhvYUNMUytOR3RD?=
 =?utf-8?B?ZW9FcUgvMlF0YjliWGVDYXZxc2tXQXU3TGp2a25QNWFqdkhITTdoYjY2K1lo?=
 =?utf-8?B?N2dQUFZHWHdmLzM2SjdUcDVmRGdvL2xkS01PY3FQeVNTamsvN3BRV053clFT?=
 =?utf-8?B?VTUzeG90TUF5aHUrc2tBNllxUGRncFFEWTdGUDlqK1V4ZWp0ZEloUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c845d93-9c82-456e-4de8-08dee676a9f7
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 15:50:46.8620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z8dkaNGGOushFmgObzLgOqFe5Ll/vkt4N7GS8fMkJW0Xee3x3AEyNxQ+itQ7q3E/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8543
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_085054_254240_8B540D3E 
X-CRM114-Status: GOOD (  14.22  )
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

On 7/20/2026 3:29 PM, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!
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


