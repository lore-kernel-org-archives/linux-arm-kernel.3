Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87ED6CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 07:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5bA6+hV3jaizAn7SyebArU4P5rAHIjSf02IqmyI9yr8=; b=gvQ9gvX1tJ/AkEd/CDNS7saaN/
	+FTOoVrcIi21oTc9RmSxA1ct7TppOQzoR6WReaBQe81oYn9g78lO7dPgiPdN+JLwvyxJjTLxJoorF
	37M2v+SMotPD/JissMaRlV4np4mXOFdXobVAfV+hqUjmvdNMy8HMjvBI/hKbefbYebtrjGSJmOBKl
	WGaxRaSDOOZl459wk0Y8Tjed2quvfNEWecCY01yYRhN8S+T6De+OGpsHH0dzMh6u9p38nZxREY+7z
	8GsB6pK6VxZD9bpLvXbPc3sFO7AOrC7Oy+4NSigUMswpLu2g40VuxNPbwW/RGHs80CVWD4hk0v+HM
	ui3Bc1JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdqC-0000000FOFl-21mk;
	Tue, 28 Oct 2025 07:10:00 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdq9-0000000FOES-3UCp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 07:09:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbI8SrdncCehF4+oZDvSjMhKq1QyxJIRH+FLO88pWdFkdDJTi6egghGDj9KU7LdD3GGhapc72Mgz+SClMCjpbeuN6rBM/DZl0QsOON2H5U7XdYuD/EBa7zb7mEVuWO1RRQcu/Sua3gIJOAKrUmgQit6T13wa5MpiZ1dpqtRJeaZ9tTiVNDLKJoyAADrJppaM9Tp/E4XVhocDWkkvJmkk4bMokiSk3EwVwnkH7xE6P2mVy/X5J4TR00gc516PG9H4AJbcfVX0Aem/vVTmigkpkVPWBJMvtu+3qVUAtrURqg+p3bKSh/d/qo3fNao6Fg27P8lJCz8iXwl2gK/w55Pnmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bA6+hV3jaizAn7SyebArU4P5rAHIjSf02IqmyI9yr8=;
 b=XFXCoHdZQ1QerGLMAy9vueChxgF2QP38UcRsJRaNQHoo+RGAcutUBsX0YpOw/sA6KGYQW4HrJ0Coxs38d7W0pNvFGktYzCLkMj4ygtrD3pAa5Yu1mgTDHlCTXQ6uAy7F3L4HdQC3tZ8m9CqBqudsjQD6Lrg07b0ppIunmtQJEljLxIVk5ETiGVqby9VFB/JR0psTibU4dIDv7FWiuXhE/zAZ/VksavFL/GXsJTFtQ4cg6HoBGfgISr++MIu8U2gHXNKBQm4OKBQosAaS/4im66npnvdYJt1QkMVzU05xtiD+pWyTQq1jxJQVeZ/njSCfYFPZcJbNov7MVOXQA+7hww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5bA6+hV3jaizAn7SyebArU4P5rAHIjSf02IqmyI9yr8=;
 b=nc6J3owjHQPxfDs1NUOBPcz3jzbx5G+AYzwWY24J9Ci63GgZumJ+cMhmWt9UsD013PrG/eKcVqAwHDLkBN++H0E7dfdpG3a4OWspod1/xreK3MRAirRNYMvibNpCwAeoBdLF4CpJSaQhqOwIt78RjESy19yTd2RDohU0IManZspEcGMEnxZM+ty9lpziihPV+Rt6kfD1+rv+HAjJOqa/oIy5qPD3zt4fZEC39RKNszzyRqQkiqSB5BJm+1ahEvQ8sh/KnXPDzqxBoZdfMj9BatCNlaTpQiwpVghovMN7BhZ/j0IYLTKmYxNHL+quqNGWQXr30SGZJd11Zve36wZd7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH8PR12MB9768.namprd12.prod.outlook.com (2603:10b6:610:260::9)
 by MN0PR12MB6318.namprd12.prod.outlook.com (2603:10b6:208:3c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 07:09:51 +0000
Received: from CH8PR12MB9768.namprd12.prod.outlook.com
 ([fe80::f7db:9f0:a574:1abf]) by CH8PR12MB9768.namprd12.prod.outlook.com
 ([fe80::f7db:9f0:a574:1abf%5]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 07:09:51 +0000
Message-ID: <d64a3d70-1ac8-46d6-9e85-d75aebc1e012@nvidia.com>
Date: Tue, 28 Oct 2025 12:39:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/4] Add NVIDIA VRS RTC support
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251007135738.487694-1-shgarg@nvidia.com>
Content-Language: en-US
From: Shubhi Garg <shgarg@nvidia.com>
In-Reply-To: <20251007135738.487694-1-shgarg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:4:196::23) To CH8PR12MB9768.namprd12.prod.outlook.com
 (2603:10b6:610:260::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR12MB9768:EE_|MN0PR12MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 69f09ee2-d782-4090-6ec1-08de15f0fcb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2pKSVdxUUZpalBoMmZYd0J5RUhkeWhQSzFEcXk2Mkdqc21nODBqWmpUTVFQ?=
 =?utf-8?B?Vi9ISERCaUFESU5WeUp2eHJMMFhXMlhuMGxneCttdXRTYS9zVktQUWRia2Q5?=
 =?utf-8?B?T3pCZHg4ZmhBcllLWG0rSzJOQ3FQMWJYQllZQkZIdEVFWlZwQzJMK3dtNHpR?=
 =?utf-8?B?Z0dXSU9YQjV0b1I5bWVDblNZSkpJSHIvc3B3cGQrZzRXeFNSWjJOcGpQK0gx?=
 =?utf-8?B?SlBhMXpHd1JPcENJQXg0WmRIM0k4U01Mc29pMDAwNS84dFlEbVE5bXdiWWZ6?=
 =?utf-8?B?UFcxVk8rMzJuenUzSEMvNDk4TVBlb3R5UThvMFZRS0hNZGR3SzNWQklvTGNh?=
 =?utf-8?B?NnV4TXo1Um1pdlFyanFYNkIzTEVrcENhTlk1K0Z3Si9waDNjUUxYVnpXN0tM?=
 =?utf-8?B?L2hkWVRQbUNnUWM2cS9IT1gvb1cyWEQ1U0RSSEsrTXZuL3VES3dYVHdFK3Zh?=
 =?utf-8?B?a1JsNlMzUE1LQ3lQV2UraDFGdFRjd09lMjFZV2NHTkNCMGFBNmdnUVQzdEdX?=
 =?utf-8?B?R0xQREIxL0hucXpsVjVCZDdIMkZ4UlliRlZwMlh2MTlUSnh2OG1KUS9mWTlu?=
 =?utf-8?B?T3JkcVFJcS93dmVOVmhoYzhNZWZjY3BIenIzVGVwV2hVaGJIWGJLTGdhMXln?=
 =?utf-8?B?RmVPNUhSelRmQWV4ZmtLSWRxRnl0N0ZXa05XbUhiZDIyZjBZZktkc09LdVFJ?=
 =?utf-8?B?SGZDNVAybnFFa0JuTUlldVBOdzlrQTNSVlhXaXJEVlpnV0VhaFlOKzRyOEsy?=
 =?utf-8?B?RXJZMU9TMnBzNFlRZ1RGSFRrMEhQMVppTDZNQXZqcmpHcHJRVFFtS3E5SGVZ?=
 =?utf-8?B?V1MyVVJVY3ozNUY1NjVZMEFsZnpGK3F0ZU5IWnNOR1ZQMTFrNFpCc2o0QUM1?=
 =?utf-8?B?YVVNR0M4ak9BclBCSzk4RmlxNzk1UEpoTTI5TVptRm5qTWZ1VFExWlA3Tmcr?=
 =?utf-8?B?UTBjeS90ZVY2c3BrV3ZUS2VUWHNTVlVtUnFWUDdTcTlCaFJzQ1YwcUNNOVdu?=
 =?utf-8?B?SC8vR0ZMTjc0b1Zna1V3ZE1la1ZhcTEzT1BhZ3dUVjdyUDVLalpVNDJDS3FU?=
 =?utf-8?B?NUlVR0plQ3ArekhhZFY1amNQL2cwbHdQaVdkUGsyaTJyeGxWcUMwakdYWURq?=
 =?utf-8?B?bUh2aUdFdzJ5VHg5OXRKVDhRQ2RscTNxdm1zZ3FaaVEyY2M3SVhNaUVsdmNK?=
 =?utf-8?B?VFh1VUVtZUs0TDJjbHRDeENvWFVXQTQyMVFNTEhkNFgrczNNYXVLTnhISmRX?=
 =?utf-8?B?MEE1N3lnK1VtYnhRN3lhM0tUKzJhc3A2SXc2Q1VKNWQ3WjBubUFaNHV2cXVl?=
 =?utf-8?B?MUZYT2x2WFBvZmc5VGk5K1hGdUVOV044Z3MvSzVxcXdMK1NRZEhVMDNhcXdH?=
 =?utf-8?B?aWhTVTUrZmtVTTBNdnpIV2FHemZrV0hpNUdGaHg0bndPalNIWExheEM5R0NZ?=
 =?utf-8?B?SWF0KzNIaXZWNE90N0sycTBZbVFZcXJ3QUl5UU8rR2Z4Z3ZLdGcvbTl4MEhF?=
 =?utf-8?B?YWc3Vmt3a1ZmOXVUVEw3TDlIS0xCRWZoWFR2YUhSaEZ0aW10aEhFYzg5WW9R?=
 =?utf-8?B?Tk1EZmtJMHFJY01obUNwanZUdjFna3RnTTZyaUJNWCtiMlI1dXpycHJEZ0x2?=
 =?utf-8?B?UVZHZXRXbzVWYXppM3U4Z2l5OVUzQkFIcklVREtXbjdvZ1pCRmtYTFJrQWc1?=
 =?utf-8?B?My80NTlNWFl1STRsbXRGNHdTc2NRdVlwYnAwM3I2enppeWRkRlk5ektYeHNk?=
 =?utf-8?B?V0R6Y1NsUlJMU0F2S1RXRDZvaUtnMWRvTXYwcWQ0QUVmMTVRRzdoT1p1TVpD?=
 =?utf-8?B?czJVakFSQkJYNG5meldmLzZDdUhmK1EwUEFHSkw2SjRzWnAzSEZiZmRBc21s?=
 =?utf-8?B?Yk5CV3Z2M1M0MGdzMG5hMDI3QlR2b3BlSUJ3OUJ1M3dIUXlyUVAzNXd3c1RE?=
 =?utf-8?Q?RpGgsfe00cyY+7nvYq5CVEoen8gMIm6A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR12MB9768.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXJIYnR6anN5aTROdENJRzJUVU1aZTg2VFk2dHI2WnMvakRoU1B6RDcreTJG?=
 =?utf-8?B?T3lVMTNpa2k1WmdkQzlzYmhPNFhnZEt6aXo5Ym5BYzY5RmtqRjR4WlhrQmk1?=
 =?utf-8?B?K1JjamppbUE4NldJNi9Tb2pQQUxyR0tBakhDWFBmWkpDSEw5dnBoczV1MHhN?=
 =?utf-8?B?YjY0VlJmRkhRN0RiSS8xVjNqTjJ0eXpHVUc4TzB0NDhpckFldlZXKzBhMFRV?=
 =?utf-8?B?WlA2aFlhckJzKys4bEtTK290dm1wQ1JQSExTNXdWeGlNSEFjckhzbWo4akls?=
 =?utf-8?B?TkJvOVVvTFpvQlNMVnFFZzNEc3pkamFQVE1odzdXNE12WDhkbTVSTVE0T21D?=
 =?utf-8?B?UWhsaFl4SlJXQlRBSHdFeEVPQ3VIWFB0NG10Qy9iVnJBVkxaV0RqOE9uM0JJ?=
 =?utf-8?B?dGF5dHlsWTlBSm5FQnZWYWNsemV6TkhkcjA3b2pCWUdZL1FXakF1eElMRkhq?=
 =?utf-8?B?SzlMRmpoQ1FnUEVsM0tZK0N6cHJDcDN4RnppMnlrV2NuL05CakJFQ3MzNU1C?=
 =?utf-8?B?QysvSEllTTB6U0pUcmk5T0UwY2VmaFN3Uy9INnNtQVFqQWZIdkpWQlFkWnRz?=
 =?utf-8?B?QnA4OHhHZDdlUnM5dkNYZHhuMnAxa2psVzBEaXlPUTg1NzYyS0VnMXAxTjZB?=
 =?utf-8?B?aXJqSnZIdVR5TGNtTGRLY0c2U1lDVlhicFRBckF5Sm1xdTVTcWs3S1BiM0xz?=
 =?utf-8?B?UjB5SmVlbXBLZ3VJNnJmbmExZk14RWM2aVNvK1ZMVFRueDRLUWNnRFViaEwx?=
 =?utf-8?B?Q3N3ZndyVjh0NllldjQxaDRDZFpvZUtidWQ0b2drV0xVVnVmZ2NYMzRzMHVI?=
 =?utf-8?B?bG40WkI5eldvNlVBTmJzd0VHdGJkRy9aTXJXbnEyY2U2VFN1ck5aL01UKzZQ?=
 =?utf-8?B?eW5IMVpRTDRkOTlGVllYcGUrU2dkNTRsNUhtRUhRR3BoRHBWODBkZ3VrZlNS?=
 =?utf-8?B?bGE2QzhPMDdXTGltUU95OEo4L3BCaU45ODhWaUEwRWozUk1hR1NmVGZRVm5k?=
 =?utf-8?B?dW4xSE1GbHlud1B0SFpqN1JBTXRwZG9ZVnhWOWJpbGdpNUtMZEswMDRORHJy?=
 =?utf-8?B?YWhTQVFoTEoybEVUQmFTZ253bGd2MmhiT0JYSlorQW9abzRiRmwvNHE0TXZR?=
 =?utf-8?B?RjA0bkhxb1dDRjFYMXljYndpdTkwcWlQakQyZVBQUmoxWW4ya0IwWGdyMjRn?=
 =?utf-8?B?UUhHa25lTENuaW5kWS9vNXFPaGVKT3YzM0JxMTZGTjFWTFlZOHI3dEg5b0NO?=
 =?utf-8?B?a21lWVdkRGFiVVJXMDNTY3o5RG1zRDJoekY1SktsMTFKZXFMaGRVSzZraHU3?=
 =?utf-8?B?TTFKN0xrNXFOZFY4bFdsNER5bWpmMGdtUUhod0NQNUd4dlhORTNNRkdBUUtL?=
 =?utf-8?B?cDRwa2JyREM3RGdyVWxjcEJCVUQ1SVZreTg1YlV4YS9ZTTRVNUYrUitqc2tq?=
 =?utf-8?B?eHluT3ZEMytRZFl4TXRxTzBRbHE2N0FlNEhxZHh1YmlPMmE1aVlaQ2xWMXVa?=
 =?utf-8?B?T0xRdy9ENm1kd0xIdm1FdlFITEhLdEZzUUk4RTk5VUtoZ01VRXRZQlVDeGZy?=
 =?utf-8?B?K29xUkcvV3A5cWpyQjB6K29WdDZUSFZ6aGVZRjkzb2NnTyt2MlgrWnFHMEhF?=
 =?utf-8?B?MFZXYll2aElqcDFTVnRtY2dOOFZLQ3ROZDlJR29ob2FnRXU3UWFaNEVodnBz?=
 =?utf-8?B?M0tMVHZTRC9oUDg5RzB2dnh4REZxR3VmTDJCQ3Z1L05mSEVaTnlZcWFPK3Zn?=
 =?utf-8?B?djI2RVJHSU5WMFBNT2VyYXVKalE3UzQ4cmJ3VXdFMVRQa0cyYW11L2U2OS9o?=
 =?utf-8?B?UEhyMnFzY3I5Q1ArOTNlNUhtMTNVRi93ckZJMWd1SVA1M09zdEV5UkdVTG5V?=
 =?utf-8?B?SFJBdEhMNHcxK3Fzd0I5cHVBWUs4dERzSnduMXMzWTR1bjJia1hEWlA0Y1dT?=
 =?utf-8?B?bWk3S2ZFSURCMGwwK0FPVE9HK0VaQkpFMjRIcG9VS0hLZlIxczhzTzhvVThE?=
 =?utf-8?B?MmlwQjFza1hWMm5pOGEwK1dSN3dsZk1jVFYybDduN1BteUxlb00vMUJFSFB0?=
 =?utf-8?B?dVhjNWUyY0dEV1YyYzB2ZHRnZXFBWW1SYU9XQnNCaXJHTG5VaVlzRms4enJi?=
 =?utf-8?Q?7YY070D30NrUBiaoO5TMUjeyj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69f09ee2-d782-4090-6ec1-08de15f0fcb4
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9768.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 07:09:51.2313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5Celb/6wtbHRq84AlMMySxKPLjE3NzbTxOqN2r2Cm4CG7X+axpPyubCmHvzY7+Z2aoabMJXL0xDk8r1D2XBNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6318
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_000957_879375_463B044E 
X-CRM114-Status: GOOD (  20.94  )
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

Hi all,

Gentle ping on this series.


On 07/10/25 7:27 pm, Shubhi Garg wrote:
> This patch series adds support for NVIDIA's Voltage Regulator Specification
> (VRS) RTC device. It provides following features:
> - read/set system time
> - 32kHz clock support with backup battery input to retain system time
>    across boot
> - alarm functionality to wake system from suspend and shutdown state
> 
> The series includes:
> - Device tree bindings for the VRS RTC
> - VRS device tree nodes for NVIDIA platforms
> - VRS RTC device driver
> - Configuration updates to enable the driver
> 
> Changes in v7:
> - rtc driver fixes to remove mutex lock
> - moved rtc register definitions in driver
> - dt binding file name fix to keep same as compatible
> 
> Changes in v6:
> - compatible name fixes to "nvidia,vrs-10"
> - changed dtb node name to pmic@3c
> 
> Changes in v5:
> - moved device tree bindings from mfd to rtc
> - changed dtb node name to rtc@3c
> - removed VRS MFD driver
> - moved VRS common functions to RTC driver
> - removed unused register definitions from header
> - changed driver compatible to "nvidia,vrs10-rtc"
> 
> Changes in v4:
> - fixed device tree node name to "pmic@3c" in dtb aliases
> 
> Changes in v3:
> - fixed device tree node name to generic "pmic@3c"
> - fixed indentation in dt-bindings
> - added rate limiting to interrupt clearing debug logs
> - removed unnecessary braces in if blocks
> - changed dependency from I2C=y to I2C in mfd Kconfig
> - fixed return value in RTC driver function calls
> - fixed sizeof(*variable) inside rtc driver devm_kzalloc
> - switch to devm_device_init_wakeup() for automatic cleanup
> 
> Changes in v2:
> - fixed, copyrights, definitions and dtb node in dt-bindings
> - removed unnecessary logs from MFD and RTC driver
> - fixed RTC allocation and registration APIs
> - removed unnecessary functions in RTC driver
> - used rtc_lock/unlock in RTC irq handler
> - added alias to assign VRS RTC as RTC0
> - added driver entry in MAINTAINERS
> - few other miinor changes done in drivers
> 
> Shubhi Garg (4):
>    dt-bindings: rtc: Document NVIDIA VRS RTC
>    arm64: tegra: Add device-tree node for NVVRS RTC
>    rtc: nvvrs: add NVIDIA VRS RTC device driver
>    arm64: defconfig: enable NVIDIA VRS PSEQ RTC
> 
>   .../bindings/rtc/nvidia,vrs-10.yaml           |  59 ++
>   MAINTAINERS                                   |   8 +
>   .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi |  11 +
>   .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi |  15 +
>   arch/arm64/configs/defconfig                  |   1 +
>   drivers/rtc/Kconfig                           |   9 +
>   drivers/rtc/Makefile                          |   1 +
>   drivers/rtc/rtc-nvidia-vrs10.c                | 542 ++++++++++++++++++
>   8 files changed, 646 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml
>   create mode 100644 drivers/rtc/rtc-nvidia-vrs10.c
> 

-- 
Regards,
Shubhi


