Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD85C4453D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 02:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqRIhtfyM+rmii6MwjIYBdEehdXlszkBeA1dXI+SJMY=; b=jOuYqp1DMEc0AzQViA/F5zouws
	it3w0waOJYJ8Y1n6LCkWx652TWbmDCoU7MratDuuAc91iEhnLcTN5uOIsEXtnkrsaZAUQfmO/XJHb
	8FP2Kv7akeyLpz4qPE9D6L17olDR2rY1FFFLJQwPwRXVXGgGcVC9e5z75RtRMO6A9xMbiLUzCkeuo
	XaICAft+B+NURyXYS+DjxcqxRrGCwVd7+iEYXRzen7jYWefR4QbcgCXY0tBMRn4ajYXgU9TzyhrbD
	GMy7E4dgEdoOUtuXCrbbZyiwMqnoUolhkIeXq31AAlejZmayeuxn1kjst27gX6JKcvDVBaT4kt4Ko
	E0GWMUkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmisj-0000000DC46-3Ilx;
	Thu, 23 Jul 2026 02:09:54 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmisg-0000000DC3i-2M5R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 02:09:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOdJ9pa5/qJ96iVu0+hJvKvC3/IZP3Zzkz4X7QwSC/4Yjc2ixaHEly2jD5PvrYbNWiqBIrR+UDS774zHB562fOhKzUSiBwyX8l66CmcTYXR4f50fl/Oj4CnBbRzBkYekwGDTvUTz7ImwiajU43YOaWqvlOtS0yK+gKt1RCpBGdX5+3uH63GHQDED3ELRoFILozFWS7HHt5kcbSB3RQcHWTuncgviMnN6bdqgLDIU7SJSRFfH9Ts2x+u4TmE+AmgKdTf8iC5y3A8ntRN++c4VXbiFQHnLugTMAqiasUkod685SnOpYzZdV4PY864B5pSK96v9fZHhHyM16EmTq6ESkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqRIhtfyM+rmii6MwjIYBdEehdXlszkBeA1dXI+SJMY=;
 b=hFICyU766JS6sRAMEALz9PDrZB1Fnz9j91Z39j9IgarvfjcClEgl0gu4c49AXgaOvjuzJyI0Kny/wYJRCG5aJ/+aepub9kbDiICiecfOeCq/Tt94MYtdE3tADNPwA2+e25yaI98VyHBga/XRUaN1Xoo3KIdLNGOj+TlTCMyWoi6a4LSPeWXPjSaNcZPvY4Hegc6bhKy3OCBgx+vEAYiJQiH6VILrk97KLFB5eprEDuQ7vzIbpNTiTyY+qFYTPuUsY9Znip+0B6rT+YAmyAveWVkJt2KzlwJ8ermL/BVexYXBd4VM2AIbWBH+OJzDPx8irtqpzsre79emsGltkRYhVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqRIhtfyM+rmii6MwjIYBdEehdXlszkBeA1dXI+SJMY=;
 b=IiMBU3qeXhQKq9tywgh4rZkpd75XsXJCG7hI+YL0h4JBxCvr/FHmpD9IdN2bKSbCYNwmpanxCgVNoQF/v31wAqtPD9PI7yZVsYAkYKHQXryVNqgQPhuzmXrImA9AwzWTNOT7T/MxVj0SvTdfoVmKn19iQHuIjeqQfz3IPwEusk4pHjSm6aCrbDYJ3d60IJml702av++NMeSgDDQRcv3U2RSel8JjmJ4T3sJh+Mz9Spq7Gs0FuuQUpV6Gz/T9IqXj+L3CuIrrFGaaJgub4N4f9BRSdd+CsCAgpROrXJW7wCPWK1NxlT3Mr0hofiUczdga7dou4FisBMoQ0gthMwSNJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TY1PPFDCB216449.apcprd06.prod.outlook.com (2603:1096:408::929) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 02:09:41 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 02:09:39 +0000
From: Pan Chuang <panchuang@vivo.com>
To: michal.simek@amd.com
Cc: jay.buddhabhatti@amd.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	marco.crivellari@suse.com,
	panchuang@vivo.com,
	ptsm@linux.microsoft.com,
	radhey.shyam.pandey@amd.com
Subject: Re: [PATCH v2] soc: xilinx: Remove redundant dev_err()
Date: Thu, 23 Jul 2026 10:09:29 +0800
Message-Id: <20260723020929.554299-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <895fe777-b350-41a1-be09-77ce9958d00b@amd.com>
References: <895fe777-b350-41a1-be09-77ce9958d00b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TPYP295CA0020.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::10) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TY1PPFDCB216449:EE_
X-MS-Office365-Filtering-Correlation-Id: a054ee8f-ff42-493f-8d3a-08dee85f73af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|13003099007|38350700014|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003|4133799003;
X-Microsoft-Antispam-Message-Info: Qo85k+7loqEQmrmraio89tcaNrp8tJe3WCY/HHgGJVLpCwaUBNGOWBNDVsv8mWoxVmGeTt6oWHEZt1NrK3j/k73u7cQMe6K2omiiph96iXIDLVgtWytlEosNMljhjqg0vK4U8a8BkINrx7zwE22EgIRGy46kPZVY8DgMZkyftVdYhuRFRh1D9AnwchicMwCbBL8WiPiJ6gzksSgq7FeaQzERGoRFkKRXbNpmjF5st7bcMdW7JX6yWdMPZYa6gv1Tg0oyK99nYOfXf1JofyXYjqeVl+4ciPEi/+rFuIQ4RvpmhMWVc6ee+PT+jHFkKydv1Q0/NuC4YRnaeqQsMJvodwFBnui+wlLVSHOxhiEn70VO4enAAG/ZW+2zINfZo49oYElLrFo+HIuPMv6XiIuCE5jeBvMQkKHhhMKFW4wXjlHAeHR+/8MICHxL+DC8/bNNc7O19mK3LyRbx5h5pbtpUKreLAVY9srZDiOmp2IaMUoQks/+twlydS6NA0C+rwVg+fN3VE2t5fPzN/RL1A5IJWEYI2Xuc9oJV9/bkDFMu7ZZC29Hjjwba3pRGVm66k2JX8bEwbqrKcW43jdGf+43/XgUFlT8E8XfIijs3f97vEJ25VbxNGbtCsGfNhmdR97r+iRVcj+PFH0F4lycU7u+fMgVn5MvcAsNCUAW31yd0xY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(13003099007)(38350700014)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(4133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T25PUzFqNDR0K1FmTk9GTkJhN2FzVEpBMk9UaUZUV0VHTml6VUZEVlYyd0tF?=
 =?utf-8?B?bzJ1M3F4bmJHbE56cGVMY3J1V0hmUUcwSzlBc3RHUzdlUlZMM2NESHpVV0t4?=
 =?utf-8?B?OUU4OXByR2lFRUFmMFVNbmhlVTJwSkRhNzdCYi9GNitjeXVCTkR4NXdQZUpU?=
 =?utf-8?B?bzlEMHBLT1daaDhQalN1bGM4bFJRTFpuRTBtRy9xTEd3SlhGYXZ3SEQ1TTBv?=
 =?utf-8?B?YmV3WUtvV0tiVXNRaTRSZWJoNjVuU1JVZkVqeU5NYzFHU0dMY3pnUDhMamt0?=
 =?utf-8?B?STYxUW55bEZlZUUxbW1OZkZFS21pTFZDQlJ6bkZ6NS9OOHhheWFUYjFSWjN0?=
 =?utf-8?B?U0pJNGQ4aXM4VCtFTVZSVlJYdm4rdy9qV3orMitnL3ZqMjlDd1pKbHIzdGxF?=
 =?utf-8?B?M1FjQk0vamNVazRTYTJWY0xRb2FaY0VmejEzNWUrbThVaWxOZnJvQzM2bTNQ?=
 =?utf-8?B?eDBrMC9CSlVmWjFYV0h1eEMybWpNYkFHWHM1bFZLNkRRRmNFajNvQzEvU0dH?=
 =?utf-8?B?REtlWmFvZTkyNlRuaW0xWnAvQUQ0OGdqcG9VY2xBTHJkVGMyNWRjYldQSDFM?=
 =?utf-8?B?bW5xb3ovTUo2NUFKQUpTeUxPS2pCdm0wY3dtSVV2RkhUTXoxK0JySFE2Vjk3?=
 =?utf-8?B?N3gweUd1T09ocDVsTXZtNkNmSWdyZnYzb0dCNHVwY1dtWkFWREdNa0pjYzRv?=
 =?utf-8?B?ZWZ4b29hdU5RNDJrOTEwRFhJcWI0QWI2ZUt1bGxtL3pUNWtDNXZKMDlGb1A3?=
 =?utf-8?B?WGpjVWVmaXRncU5sWm1ZTXoxUjlRMzhmTFIzb0dtclJ1eE5OVUJiZUhtYWhS?=
 =?utf-8?B?TmxOVndnWDVaY1EyQXhud2JjYmV6Rk9hMXpxSjdybVZxaEZZUHpPay9kN2RU?=
 =?utf-8?B?Tm9CQmpNZ1dTYndzUmJuSVBZNm9CRFdtZWNtQk1pQytKeTlSWXlOQ2RXMkZS?=
 =?utf-8?B?QVIwOFluY1Q5UVB0VjhyUGhyaytPeGtsSklsR2trQ04xUU10WjhKdmtnSXRl?=
 =?utf-8?B?VVQyWnRTcXpWd00xYW5LUDIxUCtzMkxsMUJLelQ4YThaSTIzQzFDMEVsZFZY?=
 =?utf-8?B?WHFMMnNmMkZjZDdBS3NVSDJ5YzMyd2VnY3huaXJsck5oNEJ3ODJFRWdUTWxW?=
 =?utf-8?B?V0piRWZwVTdLTkNxNHN2UnJLQVRRNDZzRTJ3cUhLVFlkRytQblEvM2ZLR0Vh?=
 =?utf-8?B?TXZpOWpFL0VxNFhvelZGcWR6SHEvek1WdzJWTkl1eXRvU040MzViOGdiK3I1?=
 =?utf-8?B?ODVqOTVoRWExcVVZRTh1U3FrdnhJS0UxRXNiVGR6UjNZenVvOC9VVTY1Qjh1?=
 =?utf-8?B?L09uNFcrNUFSTFQrTVI1Q1RBMWhxTjB6eXdPUHVFeFhWOWtNUm12bEQ5a0My?=
 =?utf-8?B?eUFPT25ncVpiMm1sazJUSHhOM3hSaERiaGZGd1dRcDRWc3l1bU1uMW1YUTZ5?=
 =?utf-8?B?MlJkd2pwdTB4QnVLbHFnVlpHTy9HcklKTFV5TUFhRGRNT0FHb3Yya25kc1pN?=
 =?utf-8?B?VXZKQk01eUZlRnRMaC9MamRYSEFTR3RVejVxcjlUZU42WERQbnhWREVqWUhm?=
 =?utf-8?B?bWRyMWk1aHAzYUdqMDZETVRxM1pDeGg1d2QwdlBRdlloY2l6Yk5zeERNTGxX?=
 =?utf-8?B?cmF0cHEvSXM2ejR5aWxDTzFDdHk2NTdxQ0dXTjNGWHlYZUNYeXNWdTJqalRP?=
 =?utf-8?B?c3dUVm00OHhKblpSSUFHSkZyWEJ0dmRGQnR0QUlvWUM5S01uZ0pQblhtOXJo?=
 =?utf-8?B?TGo0VjlXeUVFNEliWjBuSGFtRmsrcnVpSmIwYng4VFpPVU5BWTM1TFNndnln?=
 =?utf-8?B?SWxtLzZQQWJkZ0hvWVZHV0ZUTEZONU12b05yYWJIaUVObmt0YmYxc3NPaDlV?=
 =?utf-8?B?cmNISlhaZXFBVGJ6RnRHZG1HbjVlSjlrZlNnVGtNMGtKUm1zSS83aWYwUDBJ?=
 =?utf-8?B?SVJQMHZWd3ZkWFNidUdwVmtJRkFnQkh1WGRJSUtuS3ZMUlpDQUtsTXN2Lzhi?=
 =?utf-8?B?dnRCN2pMckhBOG1HemdCMXRVVGdEdWFETG5PRG9XYUd4eEVUYkpWTEVLQkpY?=
 =?utf-8?B?TzRNeVliYUpGdDlJRWRXWHRjZE1yMnpJQnVrUGRBKzBtcjQwZU0vbE1xT1pW?=
 =?utf-8?B?R2xLVzQvcDFPMEFJYk9RSUhBTnY5UE1nM3REekdzaDByekZ3ZU1JV2RxSW8y?=
 =?utf-8?B?V2R3WVpiYnlvNjhmcXV3bDRZTTRaNDliZE5qQlJIUkdwMG5PWlFWMHRFQmtP?=
 =?utf-8?B?cmZKelUySTJ6clNwWko3OHhqWDQ0QXlsamVOSE54N1VYZy9HM29JeUdkKzNx?=
 =?utf-8?B?dzFNSmZOeWZtNEE1dEh2RURxVEZxUTlvYmIyR0sxYWU0N1VDbGJ6QT09?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a054ee8f-ff42-493f-8d3a-08dee85f73af
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 02:09:39.5901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eiBPioGUAp31V7MqH5laE3pDP5HC4RWGqh6zS/EWntEs4vPiB0hjI1VPdFbIUO4TmUOcVmo+4dlZ87/dhKiVNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFDCB216449
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_190951_394511_0594C911 
X-CRM114-Status: GOOD (  18.52  )
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


On 2026/7/22 21:14, Michal Simek wrote:
>
>
> On 7/22/26 04:35, Pan Chuang wrote:
>> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
>> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
>> detailed error messages on failure. Remove the now-redundant
>> driver-specific dev_err() calls.
>>
>> Signed-off-by: Pan Chuang <panchuang@vivo.com>
>> Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>> Acked-by: Michal Simek <michal.simek@amd.com>
>> ---
>>   drivers/soc/xilinx/zynqmp_power.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
>> index 370e61ac47d8..54c796afb89e 100644
>> --- a/drivers/soc/xilinx/zynqmp_power.c
>> +++ b/drivers/soc/xilinx/zynqmp_power.c
>> @@ -368,11 +368,8 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
>>                           IRQF_NO_SUSPEND | IRQF_ONESHOT,
>>                           dev_name(&pdev->dev),
>>                           &pdev->dev);
>> -        if (ret) {
>> -            dev_err(&pdev->dev, "devm_request_threaded_irq '%d' failed with %d\n",
>> -                irq, ret);
>> +        if (ret)
>>               return ret;
>> -        }
>>       } else {
>>           dev_err(&pdev->dev, "Required property not found in DT node\n");
>>           return -ENOENT; 
>
> But you still send it as threaded not really separate emails.
>
> When you pass this message-id I am getting ti patch not xilinx one.
>
> Thanks,
> Michal
>
>  b4 am -l 20260722023523.42269-7-panchuang@vivo.com
> Looking up 20260722023523.42269-7-panchuang@vivo.com
> Analyzing 8 messages in the thread
> WARNING: duplicate messages found at index 1
>    Subject 1: soc/tegra: cbb: Remove redundant dev_err()
>    Subject 2: soc: xilinx: Remove redundant dev_err()
>   2 is not a reply... assume additional patch
> WARNING: duplicate messages found at index 1
>    Subject 1: soc: qcom: Remove redundant dev_err()
>    Subject 2: soc/tegra: cbb: Remove redundant dev_err()
>   2 is not a reply... assume additional patch
> WARNING: duplicate messages found at index 1
>    Subject 1: soc: fsl: dpio: Remove redundant dev_err()
>    Subject 2: soc: qcom: Remove redundant dev_err()
>   2 is not a reply... assume additional patch
> Assuming new revision: v2 ([PATCH v2] soc: ixp4xx: Remove redundant dev_err())
> Assuming new revision: v2 ([PATCH v2] soc: mediatek: mtk-svs: Remove redundant dev_err_probe())
> Assuming new revision: v2 ([PATCH v2] soc: ti: wkup_m3_ipc: Remove redundant dev_err())
> Looking for additional code-review trailers on lore.kernel.org
> Analyzing 13 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH v2] soc: ti: wkup_m3_ipc: Remove redundant dev_err()
>     + Link: https://patch.msgid.link/20260722023523.42269-6-panchuang@vivo.com
>   ---
>   ✓ Signed: DKIM/vivo.com
> ---
> Total patches: 1
> ---
>  Link: https://patch.msgid.link/20260722023523.42269-6-panchuang@vivo.com
>        git am ./v2_20260722_panchuang_soc_ti_wkup_m3_ipc_remove_redundant_dev_err.mbx
>
Sorry for the confusion. I'll resend each platform patch as a standalone email.


Best Regards,

PanChuang

