Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AA2C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 07:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpZOqXMUk/odu/wtIC8b5q7dMd50iY45StG7iCBrVNA=; b=hEPVblaHyY6W1F2/kn3TCFFHyF
	+WtXm9aWWNm4f+OMzE+HK9VRIZjsLXWZ0sYEo812KixuG7YSVjUTYoVXwBEjU9CrdqRnYSb4WD2Pu
	qOqVQX/Dd7WlgSxXnIRaCI9EsumFCttCyVe1Jx82sbdVpi+JXzInFoswL+aQObaoLU2x3IP+fQa+I
	Tohoo1aiKaccQNbv2vOTlga0yP9gn9izRkWd/NJcNV1m+AZvasFDyuQWUJ/XZHZizz6TGa7DS9A4a
	xMIbbidAY6VeraTmQvuPVXWf/ptelzqAY/qes2n7auxF6ZZ0XPYNOqUvhZ9mpg1YKcl/5o6WswFAG
	DlYQ1Cmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDsY-0000000E57u-0IEg;
	Fri, 24 Jan 2025 07:13:22 +0000
Received: from mail-sg2apc01on20726.outbound.protection.outlook.com ([2a01:111:f403:200f::726] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbDrC-0000000E4k5-2Sx2;
	Fri, 24 Jan 2025 07:11:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mestpGpRk9DXXKnhRB3ZdgKoP8pNyqJRktjmvZbSUx55/9GUxXTrDVjeqNTJiyjmeQHC5o/Fpyy50ndCiI00Z9j76Ey5W5WiRY5785xSF1qwnutipnshxUTfEcWE89q59r+VhW8HC+vvCv8k7bh4d+VIKg52wbssandNIEyMan5h3XjPc8dekTKcKCH6Ol7s21EbBqOtfXJXz9RGUdMQ8OlePIXoy1hK8tWfqccBg1JZW8hprcHmo9KRbBsIFHeVxs2sFmWJh7nVrHqr3R7scvWBE5tEP3EX/01YsmcnAlP4RJQeFH3tu9UKGqD5SCf8SIEyNcobnT7yTb9k9MBACQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JpZOqXMUk/odu/wtIC8b5q7dMd50iY45StG7iCBrVNA=;
 b=xcOCapCz8JlAG1U9wup+FTMGWJQcnSsxMMGYlvrf9In2eezwdDt7k0hjguP2n75QwNuXYRemqqVcmwx/bAvfWdzhwU5F/jd0py4Xkde4bUov61v6KvX5WBXjDiFtpF4vKjncdKa0HaYhayfc46ZdrtHnAhqtpdpZmG60WByncA5sfei5J7C59ap+I2LOHsNo8Q/mvO0PR5wMlmCGj6SkqlOMaPADvEaUNYqYEc1chaip2W9LPBWU53A2kQ3SFhBjRb5sFW9aMT43Ch1QANvngzyOCb/N+NOfLj2pOXf94n0lNcOseb0JqnOEspQrjHwpNvt5tjJZAWIs43ZFHcJlGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JpZOqXMUk/odu/wtIC8b5q7dMd50iY45StG7iCBrVNA=;
 b=AFkQxIure89NJ/QWt+9lhX8R4bQ6a2LsCeS778DvXXJ65xF6Vd2VndiC0gQajVw5bL+PVfdODwgdCIWXUzRJOw53qcb+rcz+ZII3xMgKf0TnxhM/9IJCKEo8blnAK3fngOWPR0dFBXg7Km+pAq9fWiJCYW1Qb15w8RQ40WLpXCt+O5BD8lSVSlksuoh7kjJZ1FDEdokfYEx4TsOVbimTtcfVuNz/7eGS2pVyBqCPyYzcIvCIM/9dRskPJtvI026oCij4h60MuIV1ifHGSDvJqgW7XXozb3aJqBm6FprbngW2HXoI4HM47ESz1nyuSzu4GYC/6jOZG2Dhep0uQPagTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by KL1PR03MB7456.apcprd03.prod.outlook.com (2603:1096:820:ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 07:11:45 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 07:11:43 +0000
Message-ID: <698e092c-ec94-4054-81f5-54826f113cc2@amlogic.com>
Date: Fri, 24 Jan 2025 15:11:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: amlogic: clk-measure: Optimize the memory size of
 clk-measure
To: neil.armstrong@linaro.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250123-optimize_memory_size_of_clk_measure-v1-1-06aa6a01ff37@amlogic.com>
 <04d08bf8-d5a2-4262-8210-b5173b8c613b@linaro.org>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <04d08bf8-d5a2-4262-8210-b5173b8c613b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|KL1PR03MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aa506d9-0016-46b8-2457-08dd3c465b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUJCekFkSEx5eU0veVNEZm4xSjIyMXEyUktwblB2MkFMMkcvMXFqd0JBNllh?=
 =?utf-8?B?ZHJJYkpKbkdKRVU3Qk1YVGNJeVpudG11MmpUQWJaQjJoYkhKakNldjd0K2dS?=
 =?utf-8?B?cnBtbjN4RmtDRjU3aS9NK3dJRUtpdnVsMk02cFJ4WWMxNnVHdVdOUzdsbThn?=
 =?utf-8?B?aWFNeGtMK3VodHpYV3hQT2NEVFdRWnBDeHRTRnlhU2pWejl4cjhrb1hwRm5N?=
 =?utf-8?B?ZDVONzdadFREOUcrb3Bxem5sdFFjaUg3SEZlb1ZNamtiT0l2cWpGSzIwbXRh?=
 =?utf-8?B?TTZMRmZoOVVndjdudlJ2WjRKTng3emdIYXRIejAwaTJWaWpqTXBjN3FHUXVw?=
 =?utf-8?B?QVlpc2wwRmUvdjR3WU1rVnE1ZERvWE1XNU41MG1NRU9Ub21rL3FFYmExZUcr?=
 =?utf-8?B?TCtGTnE1R0xmWldFa3Y5UUxOSGNqYlBSdkdSRlFaZHZBWVIrOTRaTEhPb0Zw?=
 =?utf-8?B?MmFNTFlpdHVMd091QmtyRUZGbWp0VjdkWjkxcE9jTEtsSUJsQ1dJZTIxUFQ5?=
 =?utf-8?B?ckE1UW9UZURqa0htUkdCRE4yYUFzT05taGFVMUVNcGdEZGorWnhvbEFkSnp4?=
 =?utf-8?B?SEhMVHJkOE92NnFJVXlrS3lQQ3U5ellaM05YNXNXYm56MEdWbThaeXNiV1Rj?=
 =?utf-8?B?NVFQSHhidFJ3Yk1vN0hZYWhnK0ZxbmZjY1h5ZnFPNG0wRmFUTmlTOWFmck1V?=
 =?utf-8?B?NCt0TFBBSEd6T0lFYUpjNytHZGhzcmNpaHJ2ZE1aMkExWmh3MUh6SzF2Ymcz?=
 =?utf-8?B?NUtvaWpFUitUcUE0OWZkNm9DWnRDNEtwUTJPMGhJU3JqRVVITCtLWGxSSjh1?=
 =?utf-8?B?dGNacW9QM0pGaFF5ZUNQR3pzNVFtVERwR0FQOS8wamE0QmNEUlFVSmVxYTU2?=
 =?utf-8?B?b2lyNUtEUHFFZmgyN2tlKzhkNTdjY1Q0d29mZEtaZ1ViM2g2R0xUaUZ2d1Ri?=
 =?utf-8?B?dVI3ODVZUElCU3BtclQwdWFLdC9Nd1NWc0ZEcmN5RGpWWkNiTkVMaDNISkVG?=
 =?utf-8?B?c0Y3a0M2bFA3SGpxZWZ6Z0lLUWF3ZG8xVmxDcG13VGhCKzN5b0plc2dtSGtT?=
 =?utf-8?B?UDhNa3l5TkNVYzFGcW1aM2lEdG4xZHloVFBSYy9vY3d5bDZXMnpadVhPUEJN?=
 =?utf-8?B?WFVjN1ZvdWdUNjB4MTNQTFlqZkoyaTA4dWdtUjZZVmFwdG9lKzRVK2RtZENs?=
 =?utf-8?B?UXB3REJFcU9DbEtIcWdxK2FlS2V6RGtxSnhZOTN5MGV1cTY0RUd1NEloNkV5?=
 =?utf-8?B?SWp3M2ZickdONE90TjFPelVIK2JNMnVkUkdSVXdUODV5MmtLVVFZWjlDaXpZ?=
 =?utf-8?B?cmZqWUJrLzhabUFSeXozd1NtMGg0VFE3ZXNpMTVhWGcvREFCUFU1SXh3NFFF?=
 =?utf-8?B?c1NSRENNUEJMTTZwOG1Gb29jN0luc3Bsc2FYam15bWx6czkzWmhsTk9Hc0xo?=
 =?utf-8?B?RVhBdUNwSlNMN0dncjhRMkx2dEh5anhpODhUclFjVXNiS3pSZ3A4VkhjR0pu?=
 =?utf-8?B?aEZVeXdJWVg3b1NrRXBDYzlkd1VLYkI4YlJ4dlpKbkl4aWdKdzE4eWF2ekpp?=
 =?utf-8?B?RWY1Um1JNzJCbWtvTy9ZMTdiTzd4OWQ1U28xNEp3dTc5VTEwZXo2YVQ3SEdY?=
 =?utf-8?B?QmJGSG5UcnlNdEQrcGRuVUFPdi9zUGJ1ODF5cmVqZDZveVN0Y0F1VGNhdGVJ?=
 =?utf-8?B?OVRwclBJd0xJWmpad2VSb2t3TURNSmEvVW1lL3RSdE5yQ3V2ZG0xenh4UjFx?=
 =?utf-8?B?a3VYOThjVWVzeng5WWEvdktRdWh4QVd5ZmhhcXFuclRRVjlGb2N2UG1UcGNR?=
 =?utf-8?B?TURYRVhLcG00RDIxYUQyT1RTSDIralFqZ1lVYU5Kcmk0bzJNS2dTMXpiTUFt?=
 =?utf-8?Q?YkEgEDkzyAIvl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0tmL0liaWxqcHBkWTVEQnQwUFM2RHppbWFJVklBa1dpelBmbGNSNUR0cFZl?=
 =?utf-8?B?akc2MTlrQTF5a2kzdnFINlJLdkRwMHRxVEtOVVFETERxWXRpU3pNbGZtNU5Q?=
 =?utf-8?B?OXNJb0h1S3h1cmg3Y0ZHMlZoY1dKV05XaS9CK0RmYzI1cldMblVGL1ZUdjd2?=
 =?utf-8?B?NFZ4VkdsZU9TVkVhN2tuclNzdlpjQ3BVa2ErNk11RzA2VVhJSnhZR1BqRnNE?=
 =?utf-8?B?ZXBWOFlLY1NFNEpldkVMSkY4dFA0QVc5NDdXTnZzbGpPcUd4Vnd4d3dmMkNh?=
 =?utf-8?B?VXpMcWhuMXQrMWdUbElmOTVaT3o3SmxybWdzRjI1Y3liSWU1RmN5ZWIzVkdF?=
 =?utf-8?B?RStHMXN6YVM1TkprOUF2Z3FucTFhcE1JYmlsZnJDM0x3R3p0V2VaMUMxYnlB?=
 =?utf-8?B?THRiL29UYVJQL251Tkg1UHVqTGkvUFBwQ0VZam5oUVh6WVdVUkRza0F5LzVM?=
 =?utf-8?B?ZGhRYTRBdFUxK3hBUllmd21rNmF2a2R1ejlPNld3Q3BrYWMyRXhvMEZaSnVZ?=
 =?utf-8?B?aEhVc01RNHVGRU9ITlR3d1hXTE10dG92UGhrMU5JT2lQY1Ird3hCenQ3REFi?=
 =?utf-8?B?RHgzTm11eDk0U2ExQW1Gcitxc0NuOWxwUDI1YktnMVdsY0V0WFpwQ2xIaEp6?=
 =?utf-8?B?MkFKL1FnMVBpbFRBS051SHJIVEQ2bVZ4ZU9yM09NQUhEMXc4WVE2MG9iZjJn?=
 =?utf-8?B?VGNteVZkb29kOCtiSUlmcjZVSWhmdXp0UytmQTVBY1NxZWRmZWd6cXlycSsy?=
 =?utf-8?B?K04wVnBDUm9XMGRRRzR5alBzTHNGZ2FKZ0trNmk3S3o5QUV5VmFrZGxZaGdw?=
 =?utf-8?B?dkRkZXZHdE9xV3FHVDVpU3Z6Zk5DaXhyeTJRWDJsSkE2Q25FQXhHSEk0Und2?=
 =?utf-8?B?a0lSNlRmMDlubHRWZGxZTHlmZ3BxMjZkcW1SN09tdTJNcG53ODNCQW1rYXNx?=
 =?utf-8?B?T0o3QjlUWm9Ib2FLRTNhT2NhbnladlhmeXFBR0dFQm9nanNrbzllZzBhZTdR?=
 =?utf-8?B?Znk0UGRXU2Fob3FrUDg0aURGdnFTWEdwYWNOdm82RVYzSC9kcDduMG0vR2pu?=
 =?utf-8?B?d1NNMnNOMkxOWlNVRkpWN3BQK20zamJ5SFA2YllxTFF2WDQ2R3NpM3NteXJR?=
 =?utf-8?B?dGladzArMEtRcGorSkFrWHJ0THcwNis4cXFTcllTQXFydmZoTFZWbE1xNGQ3?=
 =?utf-8?B?emkvRUdIOGpCVHE5UktodlU0WnBDdm4xcEgwRitvdmhRbWxDSVlFNG41OW13?=
 =?utf-8?B?dzJLNDlOS3BGQk5hMWRXMEg0NU81OUlZRFRLbitiVVN1YXlacGpwN2w1SVpk?=
 =?utf-8?B?MkdkREJrb1FNMXBtM3lVLzV1WjkyRE9hNnhsZWdXUC9GZFBaQ3UrTko0OERY?=
 =?utf-8?B?N0JWNzM3VmtHVEhmOHUrbGlKNDFiTy9veDkrbStWdzd0bkVOSTRHT1ZaeTdv?=
 =?utf-8?B?SnFQSTl6em5yZENFOXVTekhYY2pCMTcvd2E1QXhRRCtkTDc1M1BybkN4Y3d5?=
 =?utf-8?B?UzErK1h1cVNqN3ZrUk4vYlNiSnBwbFVJRjdMSWkyNWZDZkpXWEZGYjVDbmRC?=
 =?utf-8?B?K3VvczlROGxMdUJldWkrbS94WWZ6ckFjendDcHgwRVB3RTAzbW15Rkp0ckxU?=
 =?utf-8?B?NTIranpFUko3bFJ5aXdyN3VaOEJlbzAyRElSQWpwdjZYbnpNY3liMTl4bWs2?=
 =?utf-8?B?dy9Qek9kVmNycmUzVTZRWWpHUGFtOXhOT3pZbHNDVG5VOWxRL1JvTlpMSSs2?=
 =?utf-8?B?MmdBckFpTG1zY1Q3UzdjclhQemQ2NU5xYmVrQVZVTXZTOGNZN28vWDNwNzNt?=
 =?utf-8?B?WW51NEkwcXFoK2VmMzU3ZmJmSGRDeWxMZS9VdWtTb05OU1UwVUFJY3pKbEgz?=
 =?utf-8?B?WXZGVVF3cThKTytXYlhwbVkxNjJ3QVdlMGduVFFHWWh6VEVZUGIxZ2YxZWM0?=
 =?utf-8?B?NGw2T2xWbVZ0cVo4NHlaYkFXcnU0UEthZ3FjcHdGS0llRldwWFI4eTVOcEdW?=
 =?utf-8?B?ai9XbUdZTXBqVEUwMHpPRnBCSnMxUi9UTnBZa3ZUSld5Z0tJTmRScFJUTWVC?=
 =?utf-8?B?QzNncnJZd0tMMVlIRThyOEc1dGtrZmZweExSaGZySmFCNFlPUnBaVnFJTE9V?=
 =?utf-8?Q?9HQ1sx0rsNVh1m+USD07+GpvY?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aa506d9-0016-46b8-2457-08dd3c465b5d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 07:11:43.7719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4Z92kMN+T4rDCwhk9Jvo7Gmlz/6MATohXQrkU6oweNnmAElnuHsC3GSb8nOqHL4Bym3S6ovoeN2ExTNaPRCGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7456
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_231158_803055_84DAA2BC 
X-CRM114-Status: GOOD (  17.39  )
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

hi Neil:

     Tranks for you opinion.

On 1/24/2025 12:15 AM, Neil Armstrong wrote:
> [ EXTERNAL EMAIL ]
>
> Hi,
>
> On 23/01/2025 11:37, Chuan Liu via B4 Relay wrote:
>> From: Chuan Liu <chuan.liu@amlogic.com>
>>
>> Define struct meson_msr as a static global variable and remove the
>> "*priv" member from struct meson_msr_id.
>>
>> Define the size of the corresponding array based on the actual number of
>> msr_id of the chip.
>>
>> The array corresponding to msr_id is defined as "__initdata" to reduce
>> memory usage.
>>
>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>> ---
>> Each msr_id defines a pointer(*priv), and all these pointers point to
>> the same address.
>>
>> The number of msr_ids for each chip is inconsistent. Defining a
>> fixed-size array for each chip to store msr_ids would waste memory.
>> ---
>>   drivers/soc/amlogic/meson-clk-measure.c | 119 
>> ++++++++++++++++++++------------
>>   1 file changed, 74 insertions(+), 45 deletions(-)
>>
>> diff --git a/drivers/soc/amlogic/meson-clk-measure.c 
>> b/drivers/soc/amlogic/meson-clk-measure.c
>> index a6453ffeb753..b52e9ce25ea8 100644
>> --- a/drivers/soc/amlogic/meson-clk-measure.c
>> +++ b/drivers/soc/amlogic/meson-clk-measure.c
>> @@ -33,23 +33,27 @@ static DEFINE_MUTEX(measure_lock);
>>   #define DIV_STEP            32
>>   #define DIV_MAX                     640
>>
>> -#define CLK_MSR_MAX          128
>> -
>>   struct meson_msr_id {
>> -     struct meson_msr *priv;
>>       unsigned int id;
>>       const char *name;
>>   };
>>
>> +struct meson_msr_data {
>> +     struct meson_msr_id *msr_table;
>> +     unsigned int msr_count;
>> +};
>> +
>>   struct meson_msr {
>>       struct regmap *regmap;
>> -     struct meson_msr_id msr_table[CLK_MSR_MAX];
>> +     struct meson_msr_data data;
>>   };
>>
>>   #define CLK_MSR_ID(__id, __name) \
>>       [__id] = {.id = __id, .name = __name,}
>>
>> -static struct meson_msr_id clk_msr_m8[CLK_MSR_MAX] = {
>> +static struct meson_msr meson_msr;
>
> The whole architecture was to avoid a global variable like this
>
>> +
>> +static struct meson_msr_id clk_msr_m8[] __initdata = {
>>       CLK_MSR_ID(0, "ring_osc_out_ee0"),
>>       CLK_MSR_ID(1, "ring_osc_out_ee1"),
>>       CLK_MSR_ID(2, "ring_osc_out_ee2"),
>> @@ -98,7 +102,7 @@ static struct meson_msr_id clk_msr_m8[CLK_MSR_MAX] 
>> = {
>>       CLK_MSR_ID(63, "mipi_csi_cfg"),
>>   };
>>
>> -static struct meson_msr_id clk_msr_gx[CLK_MSR_MAX] = {
>> +static struct meson_msr_id clk_msr_gx[] __initdata = {
>>       CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>>       CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>>       CLK_MSR_ID(2, "ring_osc_out_ee_2"),
>> @@ -168,7 +172,7 @@ static struct meson_msr_id 
>> clk_msr_gx[CLK_MSR_MAX] = {
>>       CLK_MSR_ID(82, "ge2d"),
>>   };
>>
>> -static struct meson_msr_id clk_msr_axg[CLK_MSR_MAX] = {
>> +static struct meson_msr_id clk_msr_axg[] __initdata = {
>>       CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>>       CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>>       CLK_MSR_ID(2, "ring_osc_out_ee_2"),
>> @@ -242,7 +246,7 @@ static struct meson_msr_id 
>> clk_msr_axg[CLK_MSR_MAX] = {
>>       CLK_MSR_ID(109, "audio_locker_in"),
>>   };
>>
>> -static struct meson_msr_id clk_msr_g12a[CLK_MSR_MAX] = {
>> +static struct meson_msr_id clk_msr_g12a[] __initdata = {
>>       CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>>       CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>>       CLK_MSR_ID(2, "ring_osc_out_ee_2"),
>> @@ -358,7 +362,7 @@ static struct meson_msr_id 
>> clk_msr_g12a[CLK_MSR_MAX] = {
>>       CLK_MSR_ID(122, "audio_pdm_dclk"),
>>   };
>>
>> -static struct meson_msr_id clk_msr_sm1[CLK_MSR_MAX] = {
>> +static struct meson_msr_id clk_msr_sm1[] __initdata = {
>>       CLK_MSR_ID(0, "ring_osc_out_ee_0"),
>>       CLK_MSR_ID(1, "ring_osc_out_ee_1"),
>>       CLK_MSR_ID(2, "ring_osc_out_ee_2"),
>> @@ -489,9 +493,8 @@ static struct meson_msr_id 
>> clk_msr_sm1[CLK_MSR_MAX] = {
>>   };
>>
>>   static int meson_measure_id(struct meson_msr_id *clk_msr_id,
>> -                            unsigned int duration)
>> +                         unsigned int duration)
>>   {
>> -     struct meson_msr *priv = clk_msr_id->priv;
>>       unsigned int val;
>>       int ret;
>>
>> @@ -499,22 +502,22 @@ static int meson_measure_id(struct meson_msr_id 
>> *clk_msr_id,
>>       if (ret)
>>               return ret;
>>
>> -     regmap_write(priv->regmap, MSR_CLK_REG0, 0);
>> +     regmap_write(meson_msr.regmap, MSR_CLK_REG0, 0);
>>
>>       /* Set measurement duration */
>> -     regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_DURATION,
>> +     regmap_update_bits(meson_msr.regmap, MSR_CLK_REG0, MSR_DURATION,
>>                          FIELD_PREP(MSR_DURATION, duration - 1));
>>
>>       /* Set ID */
>> -     regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_CLK_SRC,
>> +     regmap_update_bits(meson_msr.regmap, MSR_CLK_REG0, MSR_CLK_SRC,
>>                          FIELD_PREP(MSR_CLK_SRC, clk_msr_id->id));
>>
>>       /* Enable & Start */
>> -     regmap_update_bits(priv->regmap, MSR_CLK_REG0,
>> +     regmap_update_bits(meson_msr.regmap, MSR_CLK_REG0,
>>                          MSR_RUN | MSR_ENABLE,
>>                          MSR_RUN | MSR_ENABLE);
>>
>> -     ret = regmap_read_poll_timeout(priv->regmap, MSR_CLK_REG0,
>> +     ret = regmap_read_poll_timeout(meson_msr.regmap, MSR_CLK_REG0,
>>                                      val, !(val & MSR_BUSY), 10, 10000);
>>       if (ret) {
>>               mutex_unlock(&measure_lock);
>> @@ -522,10 +525,10 @@ static int meson_measure_id(struct meson_msr_id 
>> *clk_msr_id,
>>       }
>>
>>       /* Disable */
>> -     regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
>> +     regmap_update_bits(meson_msr.regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
>>
>>       /* Get the value in multiple of gate time counts */
>> -     regmap_read(priv->regmap, MSR_CLK_REG2, &val);
>> +     regmap_read(meson_msr.regmap, MSR_CLK_REG2, &val);
>>
>>       mutex_unlock(&measure_lock);
>>
>> @@ -579,7 +582,7 @@ static int clk_msr_summary_show(struct seq_file 
>> *s, void *data)
>>       seq_puts(s, "  clock                     rate precision\n");
>>       seq_puts(s, "---------------------------------------------\n");
>>
>> -     for (i = 0 ; i < CLK_MSR_MAX ; ++i) {
>> +     for (i = 0 ; i < meson_msr.data.msr_count ; ++i) {
>>               if (!msr_table[i].name)
>>                       continue;
>>
>> @@ -604,77 +607,103 @@ static const struct regmap_config 
>> meson_clk_msr_regmap_config = {
>>
>>   static int meson_msr_probe(struct platform_device *pdev)
>>   {
>> -     const struct meson_msr_id *match_data;
>> -     struct meson_msr *priv;
>> +     const struct meson_msr_data *match_data;
>> +     struct meson_msr_id *msr_table;
>>       struct dentry *root, *clks;
>>       void __iomem *base;
>>       int i;
>>
>> -     priv = devm_kzalloc(&pdev->dev, sizeof(struct meson_msr),
>> -                         GFP_KERNEL);
>> -     if (!priv)
>> -             return -ENOMEM;
>> -
>>       match_data = device_get_match_data(&pdev->dev);
>>       if (!match_data) {
>>               dev_err(&pdev->dev, "failed to get match data\n");
>>               return -ENODEV;
>>       }
>>
>> -     memcpy(priv->msr_table, match_data, sizeof(priv->msr_table));
>> +     msr_table = devm_kcalloc(&pdev->dev, match_data->msr_count,
>> +                              sizeof(struct meson_msr_id), GFP_KERNEL);
>> +     if (!msr_table)
>> +             return -ENOMEM;
>> +
>> +     memcpy(msr_table, match_data->msr_table,
>> +            match_data->msr_count * sizeof(struct meson_msr_id));
>> +     meson_msr.data.msr_table = msr_table;
>> +     meson_msr.data.msr_count = match_data->msr_count;
>>
>>       base = devm_platform_ioremap_resource(pdev, 0);
>>       if (IS_ERR(base))
>>               return PTR_ERR(base);
>>
>> -     priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
>> - &meson_clk_msr_regmap_config);
>> -     if (IS_ERR(priv->regmap))
>> -             return PTR_ERR(priv->regmap);
>> +     meson_msr.regmap = devm_regmap_init_mmio(&pdev->dev, base,
>> + &meson_clk_msr_regmap_config);
>> +     if (IS_ERR(meson_msr.regmap))
>> +             return PTR_ERR(meson_msr.regmap);
>>
>>       root = debugfs_create_dir("meson-clk-msr", NULL);
>>       clks = debugfs_create_dir("clks", root);
>>
>> -     debugfs_create_file("measure_summary", 0444, root,
>> -                         priv->msr_table, &clk_msr_summary_fops);
>> +     debugfs_create_file("measure_summary", 0444, root, msr_table,
>> +                         &clk_msr_summary_fops);
>>
>> -     for (i = 0 ; i < CLK_MSR_MAX ; ++i) {
>> -             if (!priv->msr_table[i].name)
>> +     for (i = 0 ; i < meson_msr.data.msr_count ; ++i) {
>> +             if (!msr_table[i].name)
>>                       continue;
>>
>> -             priv->msr_table[i].priv = priv;
>> -
>> -             debugfs_create_file(priv->msr_table[i].name, 0444, clks,
>> -                                 &priv->msr_table[i], &clk_msr_fops);
>> +             debugfs_create_file(msr_table[i].name, 0444, clks,
>> +                                 &msr_table[i], &clk_msr_fops);
>>       }
>>
>>       return 0;
>>   }
>>
>> +static const struct meson_msr_data clk_msr_gx_data = {
>> +     .msr_table = clk_msr_gx,
>> +     .msr_count = ARRAY_SIZE(clk_msr_gx),
>> +};
>> +
>> +static const struct meson_msr_data clk_msr_m8_data = {
>> +     .msr_table = clk_msr_m8,
>> +     .msr_count = ARRAY_SIZE(clk_msr_m8),
>> +};
>> +
>> +static const struct meson_msr_data clk_msr_axg_data = {
>> +     .msr_table = clk_msr_axg,
>> +     .msr_count = ARRAY_SIZE(clk_msr_axg),
>> +};
>> +
>> +static const struct meson_msr_data clk_msr_g12a_data = {
>> +     .msr_table = clk_msr_g12a,
>> +     .msr_count = ARRAY_SIZE(clk_msr_g12a),
>> +};
>> +
>> +static const struct meson_msr_data clk_msr_sm1_data = {
>> +     .msr_table = clk_msr_sm1,
>> +     .msr_count = ARRAY_SIZE(clk_msr_sm1),
>> +};
>> +
>>   static const struct of_device_id meson_msr_match_table[] = {
>>       {
>>               .compatible = "amlogic,meson-gx-clk-measure",
>> -             .data = (void *)clk_msr_gx,
>> +             .data = &clk_msr_gx_data,
>>       },
>>       {
>>               .compatible = "amlogic,meson8-clk-measure",
>> -             .data = (void *)clk_msr_m8,
>> +             .data = &clk_msr_m8_data,
>>       },
>>       {
>>               .compatible = "amlogic,meson8b-clk-measure",
>> -             .data = (void *)clk_msr_m8,
>> +             .data = &clk_msr_m8_data,
>>       },
>>       {
>>               .compatible = "amlogic,meson-axg-clk-measure",
>> -             .data = (void *)clk_msr_axg,
>> +             .data = &clk_msr_axg_data,
>>       },
>>       {
>>               .compatible = "amlogic,meson-g12a-clk-measure",
>> -             .data = (void *)clk_msr_g12a,
>> +             .data = &clk_msr_g12a_data,
>>       },
>>       {
>>               .compatible = "amlogic,meson-sm1-clk-measure",
>> -             .data = (void *)clk_msr_sm1,
>> +             .data = &clk_msr_sm1_data,
>>       },
>>       { /* sentinel */ }
>>   };
>>
>> ---
>> base-commit: 1e1fd26ed4ca05cc1f0e5857918da4dd54967f7d
>> change-id: 20250123-optimize_memory_size_of_clk_measure-f9c40e815794
>>
>> Best regards,
>
> I think the goal is fine, but we should avoid any global variable to 
> store
> the state and avoid initdata, but yes I agree to drop the fixed size 
> tables
> and store the table size size in the compatible data.
>
> The solution would be to:
> - drop the MAX like you did
> - add a msr_count with ARRAY_SIZE like you did
> - but mark the compat data and table as const


That makes sense


> - in probe, allocate priv with a large table inside, & copy the data 
> into it


The copy operation here confuses me. In the probe, the msr_id_table
is copied again to the newly allocated memory. Is there any special
consideration for doing this? My understanding is that this msr_id_table
has already been defined and its information can be obtained through
device_get_match_data()?


In this patch, I defined the msr_id_table as "__initdata" because this
.c file stores the msr_id_table information for all chips, but in
reality, we only use one of them. Therefore, I defined these tables
as "__initdata" and copied the table we need during the probe. After
the system initialization is completed, this part of the memory will
be released to achieve the purpose of reducing memory usage.

PS: I'm not sure if my understanding is correct.


>
> This should probably work and we could move the tables to read-only 
> section.
>
> Neil
>

