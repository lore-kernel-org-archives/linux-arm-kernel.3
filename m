Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F34C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 06:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krnHSRPra2hyj49NI6dLDKndq4ujnCLGsRb2LAwHoxw=; b=PSzoCnDFiGc9jDpRF1EDS8WnuG
	i3IJiWdDmBMod2USX37HNilYFxNTKw4KewvxQWGScvG9JqndRDfN2AunE5ldeHVW1DFSDbO8oan6x
	hqhJXh1ZIgRq7uMZXOHDLqUr7CxuJSYU+7gCK0Rzk9O9+5b6e4eVFV+5u1Qqx59mtieKt2vlTUgGV
	pFJDGDuTRxLLK6qKmQVz93cwsyfe6ePPldN+TR5Ky+1X8Zah11EuyMlX9qVtS/0XgIh7pDW8NdTzj
	caS+x53AnE85xeoHn6gWcNLs1dQn88HaE16Kh20YTBDlrS1w8v3m76qPz03C6TcZE2DM+ZbNZN2R8
	w97FM4WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnGW-0000000DZvR-3fod;
	Thu, 23 Jul 2026 06:50:44 +0000
Received: from mail-westcentralusazon11013052.outbound.protection.outlook.com ([40.93.201.52] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmnGS-0000000DZuj-3Fdl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 06:50:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jed+G0wthIN11ekKelMGyd/Jvuxe6tzaynkV04BWx4SzZ9R0mso7jaEz14byfx8KegAzY1fkmwMhTVcjzQQLPbCAhgNyLA85dqtaUUw/GRz7gDNTSX9zYwy1oj7lLp+W533bGYkVCapm3NluNEwQd65IeK+hZrtGwiFXMZ/zw3waERCc8G+mby7HvZlj71STGVfNyUuUOpQ6SjpgyxOEbMpVYgcJ8lClYxuxm9gqrmPEltbp2YDYqg7GhUhy+PwQRk73M/qnGTO3QirjWZ1Tg4wVCdPRHyTtyIBugTmHqWdjv+CFVAhlylZt8GErYCrDJcpYap87SIpdmUvB0WGKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krnHSRPra2hyj49NI6dLDKndq4ujnCLGsRb2LAwHoxw=;
 b=mnWG5dLkQwqFqt3VhS+nKRH5Fb6uAgfdtK1eT5Z5mdY4zO0QDhEQFJkQAeAp7G5RmzPnOUioIuiGATbIulAesjFUm9vOt4x2crxQEPN/p8tlSA1ZlzvLHC/fPy/M2EdRut8jGZx1x3QzanCUAz423C+AgQU5jmknCLJaM9FW05DdtBQ44uVs19OoKsKF+tEx1BbgFIcWmVZ5CNyx9qaAI6sgXJSh5AnjJ3fzX00hEE28qABuCCbRTz6tlE2nEq+sgmyx24G97GeNDUF+MF+upxSz09AY0kroszGYA0uweYbTPRs+aXQdTXcrH7kjaqwHtVC5FPhHKagH3+nBP+b8RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krnHSRPra2hyj49NI6dLDKndq4ujnCLGsRb2LAwHoxw=;
 b=byMmsOzQWUQNdgTCvWU08cfrvudz5ksEJOQmK8UYzHW/P60bosK0hTtKd+Tm5sdyHQUN/sC98vUd9krCRc/kj9jeQhCx9w15Mi0h/EuBZRw2f/u9JT39u8QGzYz+5dvCpfUrsm4WcTgpY1uc/rbmeKlNnuDdAaELPWi+GaOQjFM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by PH8PR12MB6889.namprd12.prod.outlook.com (2603:10b6:510:1c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 06:50:33 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 06:50:33 +0000
Message-ID: <b9f09fe9-e374-44b2-873b-61fc47e1e7c8@amd.com>
Date: Thu, 23 Jul 2026 08:50:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: xilinx: Remove redundant dev_err()
To: Pan Chuang <panchuang@vivo.com>,
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Jay Buddhabhatti <jay.buddhabhatti@amd.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260723022857.627844-1-panchuang@vivo.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260723022857.627844-1-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH0PR07CA0006.namprd07.prod.outlook.com
 (2603:10b6:510:5::11) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|PH8PR12MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 65551f38-6e83-4e8d-21b4-08dee886b14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|6133799003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: ApQaqQ4j4rfqepEtiynkraqtHqtEtZrY0IIODV7a68m0k6x4WkRC8aFahkHwJwM4rM32JQyPkNzVB1A7PWqGUbuV0U27z+9H0WfUIWuUrPh0seTaAk0CRFUIwUL1URCyfde0yH6lyIgKZ5TPUV+BAm/1CzPmw6GkkhRAv0w1zVYqL6Z+hsp7mG4cI5F/FOl3olsOZjoCARg59jSgshWT3mnV3WUIJw92OV0ku389iVTOyEvqun2slcV1BXiEynBwEDzugmSWbL+wq1lUMViILt7AD5zQsgVf6pPd81iPkm48paHEVZ5ruoOKRjRknX0o5ix8EWcNGlhlphuZMEsq6xrtXzAD41uJdiWu/EdENKGWvo5Qe+TL1XuCQ67yWfsV08xgnSNL2D9vuOu5Qo051HD8zGZ6vXvowO04qMvOVp6mDQBpcxN0wvB8KJFZZo3DiWs4tc3/B5ugt32gSxYsTUn9aUuPt/ve+KvFfMLN+3AF2fn69EMdh9vj4BPB/CD3d3sNFyR35DCfh+871zkOK/g0uxu0/kK95BXCsBDD/FXwTqEAaMSo/kp6F2aPgYvsJvA/G/l1yBtuMGKD2EKQ/P7e950wu3lGunPlCBfaUdK8gSnZrvi6RjX0VG5vCkF8DFBPugiTTnJ9ce7Zi+RYxzUq4F0+xt90eOfJEb4ZY6I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkpFY0xPcU9sTm93c0NFTTI3RnRMTnF0WEpaMno3TVlxcnB4YmZDS21rcG5v?=
 =?utf-8?B?cFowYlpUVjhWZXRUaERGRGtyMUNxK1ZkeWg3YVhobGU1UEtueEFIeDZWcHNW?=
 =?utf-8?B?MkI0UUxQeW9KemVUeTdlb25lS0kyTGRqY09OVmQySkRFcGltMEJ5WVc4MkE4?=
 =?utf-8?B?bGhHVEVYY0xDNXFWbHBJNFRaR3Rycmhoc0VoZk02bFQxVGsyTGtBTzltdG5h?=
 =?utf-8?B?NkVwMjMweGtwcXZBeXozWExzc0JxUGJ6RVB1RkhRQStpbDZxVVlNM2lpQmlK?=
 =?utf-8?B?SWo5M1kxWmpzNGh2TFZDTTFqblZ1b1FmMTFEYkNldzBvcHB6YWRWVDRnT1dP?=
 =?utf-8?B?Ymw1L29oRTNnbHNQbW9jV0gzYzZWZ05MclNyTXZoNmZCTm1JQWF4LzA0R3N5?=
 =?utf-8?B?MUtLQ1NhakxrMjJ2RDJnSU8zblB3MEVaOG9iWlorVi95S0dOU21vUU1lcWpQ?=
 =?utf-8?B?Rm5KendpTEtaOHJMUGhCcitlSzNVd0cyTWRTcHBrVmdiakJFaGp1bDFxVEdz?=
 =?utf-8?B?THorSUUyNTJsaW51Zk9sYlUzellJcWdIbDh5bzNnQ25XSXZkUng0aXhXYjJT?=
 =?utf-8?B?M0pnNG9nNEt1azVkOXo0WUduMlJaOUNuUGJwa0ZxOURFb3NTMWJvNTlsV1li?=
 =?utf-8?B?bHEwZDUvb0o4RzlHblRMQWZlai8wTUhVVHpNT0dLWjh5ampnUXI1Z3NzS3ZC?=
 =?utf-8?B?N2xYSFhnWWRtcUNvUEFuNm5sOGZGaVdmTTFmdUpjVi9ReGVpTHZoS3k5K0Ez?=
 =?utf-8?B?T05qMlRUdTFQb3NQdEswRE1QUERvMlZHSFVaT3lXRzNoMUsrVGkvRzB1VG5X?=
 =?utf-8?B?UG1yNlNjNWVuN2J4b1pqMzg4ekhSZ0JlTkRaVjBXdGhNWnNBZTRLUGRtOEZW?=
 =?utf-8?B?a1RUYW5pZHVTSGpDQW5HVDN3MGZ1cHM1d0NneXlOMHFiL1ZMT2ZsKzhsOW5y?=
 =?utf-8?B?eDVNYXBtSnRqdFZiOWorL1M4R1RaTG1uU3Nhell5QjBZc1E2UFVuNXJTS0FK?=
 =?utf-8?B?YW9jOXlwK1M1WHVOUWxqVFUwcFVLMnB0QXNRYVN6K2dlT1JqNTFRTHJiS3hl?=
 =?utf-8?B?TTQwTzA0WHg1U1BQUklyeWt5NFZiTElXNWpidTJqSXhuNlZJZk1nS3Zac2My?=
 =?utf-8?B?M3kwZEM1WGJwand1cDg4MW5TWlV5Rk1tNEVBV1JsdFdwS3lFQy9QYWF1U3Vp?=
 =?utf-8?B?NnRQR05VRUlaY2R3aC9pQkw5YTYxejRObUxsckR4akxhQTY0d2hmTm5tdmlo?=
 =?utf-8?B?WVIySnJFUDJVSUpXVUZKTTVpZ3RKY3pwdWNmTXVLbEdOQVpZbm9Td0M3dS8r?=
 =?utf-8?B?ZkRsOEdWaWJZR0RMV1NQTmVRNHdMbW5mM1R0a3daUVQ0Q3dweU1xcGxLTkgz?=
 =?utf-8?B?SllRYU5lQU9KdjFGL09EcGpLR3Y2VlpGeXJ2UERjM2QzeGV3Wk42QkhYQnVq?=
 =?utf-8?B?aWVLeHB1STZadC82U0xqZ0p3MGtSQXJiOWVvaTFJNHFJZjZvSDNqYnM4eExZ?=
 =?utf-8?B?QnpSTzlWYkxndjdxK0xIV05XUDh6S1ZtcG80ZnFyN2tGSG5uZXdidGdnN2NU?=
 =?utf-8?B?WExjMW5WZzF2ZTUzVHhKRkNUNGVLUkdHbmExUVZ0NFlQUUJsNUVlYnd4eVEy?=
 =?utf-8?B?cFJ0UGJNcFBPTXpOakdVdGNSdVgyOUNkM3Q1RHVZcnV4WW51M3FRcThKeHd1?=
 =?utf-8?B?TVhtaHhFZ3NjbGkxMS9aNVJqZUJFMXppaE9JYXR2SmUvaEh0blFtL2VpK25z?=
 =?utf-8?B?WHNEYlhQMHA4MEpaMWRUTUM3SWJQTUJERnkwOHFtTll2WkpFOFNTYStuUmc3?=
 =?utf-8?B?TW5hT0g0eFBsd0lEcVMyQWkvZGpXTnZTVnp2NUlvcEZBeVJiRE1XL0hDTVFH?=
 =?utf-8?B?SS9zVkZiUjYvQVFxcEsxUzFZaHM2aUhSNVFvbk1mRnVJTGdjWE5PenRQK3NR?=
 =?utf-8?B?YXhibVVBVzNzVi8rTzVQaUVadWhrNit2Qk5EUmFjQzhWY04ralVMNWptd01I?=
 =?utf-8?B?VGJFMUhwbFBseUwyN3FrM1hxbjl5RUhKNWVTeUFZWmdYdnBsRlYrRUk0NTdx?=
 =?utf-8?B?eXh2K29FcGx6d2dvWG5Ub001MXJLc2RPWDNyTE4vWEJPN1d3cjRDZm5ROWNr?=
 =?utf-8?B?NTRwblFqQlhrZlpZMTNzaUxOZGpEYXJhWHR5MVM3cnJKS0pDNmEzZFp2MnRW?=
 =?utf-8?B?Y2w2bDBVdkRuZm9YL3R5TkFLSTAvdWM2d1pLZ2ZDaktSVnQxRStDTzZpOVho?=
 =?utf-8?B?SmNLbjB2dWppaEJwTU1TUVVBLzl2L2phRXprWTMzRFp6Tk1UK3c3dHFmMjhZ?=
 =?utf-8?B?aE9VQWJKc3BiMzF5M3AzN2pnaUJ1Q3p6WGViMXBObktTaldTU1pGUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65551f38-6e83-4e8d-21b4-08dee886b14c
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 06:50:33.2067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzmTfNVr6eIPBgovgrpKb/jFwVQrFlxun/GT82rCDzCmJJ6D1LMItKIBnNhLgEET
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6889
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_235041_289829_0122DA13 
X-CRM114-Status: GOOD (  14.38  )
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



On 7/23/26 04:28, Pan Chuang wrote:
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

Applied.
M

