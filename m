Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057D3C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 03:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSU9bEW0F2Zb97Cz/wUxAh2qwFGK9egi2tNlChYsXzQ=; b=XZOJmcFnzFZ3Z1oQiXFyhHPdWi
	1m5hlbv+IxVuUyADc8AK653ggWZ2tX/5ZWtIllrjyx1uW00nvhLOTH75HH8DjXWEtf31sCdTPW/Xw
	8IysqNYQpDFjbP826hlPodaG0Mez7R7vAEWqzWxhs72VZ5sSRfJdj/S4Hdkq+2X7AJBYKqHs5JoKS
	lGDEICF4+gvEAmNc04UzXYi1BvZF3MxEVaHiFArd6Azscnh/obPwshC9MI1fQR2t26kUQB50c3n0V
	9dn4Mfqw6Y2OReFL21IAwWPaPxuOD3VJLotNF0Jo2Ut20rkMk3QJxNAyDQkOHV1HpL0/Gk6N9eKPQ
	rKk7jFfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYuo-00000004MBr-1jbW;
	Tue, 28 Jul 2026 03:55:38 +0000
Received: from mail-northcentralusazon11012060.outbound.protection.outlook.com ([40.107.200.60] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woYul-00000004MBK-3NBu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 03:55:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bs4qLL26LUNCgoWw1w/ZhCF9BBArbqLoGNEXYeedSG+gK/ISqMG19Iw8pbgb31igocdEndLSgiKfgclWdl/g6LWw6yca8FSfFFUnszqidhJnXkklNkQrHMIHFeyJlFsb2qC/IfiqK99Vp6ebQQB4k9UtspCacmZyoSCDAANJYRmuX9c0g07gp2ZX2f/gJL/PkN8VefoDvKlOG2sLlxgIm7V7q75GHA6hxN+MckXtf3FIu1JkRH5fRGR0++Kyp6hZSpwx5+WvO3rWkawT+goF0nIgKz+kTTuPm5ufIyBIFci8u/+/AQkPLzuX9qeep4nKBn8wQIMfmAWpzCCCFbNjjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSU9bEW0F2Zb97Cz/wUxAh2qwFGK9egi2tNlChYsXzQ=;
 b=glajJAkk31W4+CfCmk2rM2iK5d3naSDab965td731l9JF3X66X6QyxpHbo+giuDyIkO+y18F/cV2n4+g+ARReZYkUxBIRAkyHXxJjb2TunAkz1ONMU0/D63DIsD6+Ek3ZaVSXj9ILgWRR6uePKRxu2Fgj/vVg76YDZdiGsc9klewqo9zaaipby8gKO4gJ2k/wDHvVSc3nujA8oCyrNB5j6vIh7wdReOteNAUR8WFbG3mCCrRSc6G6dzblw0FX9y1+rJRCONP864tu0GhJu+CkL6Wy1GJ/gesrew/OQsYBE6uWIYBy7DdngiS+l0w2DI9K16TQ5ggDfmJK/SquCrEtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSU9bEW0F2Zb97Cz/wUxAh2qwFGK9egi2tNlChYsXzQ=;
 b=YtCBNbay3PQiIn81QtoU82WVyEUScHx8ogwrQOC1LKCcgvGXKPZIR4B/METe9NSJfapuy3s8G7//pnZqI+NQCO6nrkWy8qM+UYusgcizQq5REFU4BjM+OZJ4fVRfs6CiQm05QvgYvnByHLXdoqshet0Kk/UjQISX4IkPv8c+Umoi1V9arBcmerFNVEmKU/9rUYJ6qyIcSZhzupdh51WCUt5XUZETYUV8dYJVvHVlSUVKrOKN1gC62cvXlAFtI8zBDTDxVZ08nc0rWjibwYsAtd4O4aNrNlCOdYktCFM9b38IVRUtBbmQWNHdwh3Msw4VozueXvva6tnXqW8hLRMa1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8245.namprd12.prod.outlook.com (2603:10b6:8:f2::16) by
 MN0PR12MB6103.namprd12.prod.outlook.com (2603:10b6:208:3c9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 03:55:29 +0000
Received: from DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4]) by DS0PR12MB8245.namprd12.prod.outlook.com
 ([fe80::e7c5:cfca:a597:7fa4%4]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 03:55:29 +0000
Message-ID: <a12ed6d2-ceca-496b-b104-aa669cace5cd@nvidia.com>
Date: Tue, 28 Jul 2026 09:25:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] PCI: tegra: Add Tegra264 support
To: Thierry Reding <thierry.reding@kernel.org>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Thierry Reding <treding@nvidia.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Kevin Xie <kevin.xie@starfivetech.com>, Aksh Garg <a-garg7@ti.com>
References: <20260716-tegra264-pcie-v8-0-23e51589229b@nvidia.com>
 <20260716-tegra264-pcie-v8-4-23e51589229b@nvidia.com>
 <063777d8-cd4d-43cc-8f65-102191848c9d@nvidia.com> <amd8FoDqTNV2z2vM@orome>
Content-Language: en-US
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
X-Nvconfidentiality: public
In-Reply-To: <amd8FoDqTNV2z2vM@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0106.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:276::6) To DS0PR12MB8245.namprd12.prod.outlook.com
 (2603:10b6:8:f2::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8245:EE_|MN0PR12MB6103:EE_
X-MS-Office365-Filtering-Correlation-Id: e1844673-b062-417a-edc4-08deec5c104c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|7416014|366016|11063799006|10067099003|56012099006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0R/LGc6hlKcmiqoZOghjMePClcoUnskBuy1MtVJbexg/FvAzfu2BcXAEWuHyoDQU7LUnTjiStY+fzbL2LZShLFLN7Pq5MDVTWOhXGSvx0Ds16FRo+viNaXSWbW6bYhadPFmJ3P3WWzZVkW2BuUeLsTaVVtUTOV4cozw3EkZBMNiHXWeQtV2xi6kgGw1p3eC5Pcj89chjOJ9nUabufG0gKcIFLlwUix3btQNLDw8aDUJBWro3CqOhDPtggPHC5fBlhdT0xXShIb+c1lgCnKfLcrQtMkgXyd3Bat6v1tsWfKr0mVs+BvQYF0kaAirbjyAlGX5Jgi5P6BU6eTRsgt5P5q1rbYYEKwNC3auLsUz0US7hfv4ek0GBnWHExzNSnI52Yjqut1sg55GaFaXN3Z2g1kEFsO6txq2eX25yGL0NN7jrZYBEZkFPpCfMiRJU4Sr4YsZVzhuZoPaCub6AA1LIKSgRzXpERjy3fi6u/FesnfO+tS9sGVTcOSvKler46Bc0S4k8/IQol/ZPo9/lyrz6CqwNjLjrHA4av0WhLaAdGJHOYJNhishyvvCNYJIq97bnJy5pPTfyp4SMhnWvK+FP7wnFN3JA95cgoKJSxGCNRNki8sutbhdDEW9D90sj0MZiuLzoc8sE9yr3lX8d0G1F6JslsIn2T4RHEAau2qsZLj4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB8245.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(7416014)(366016)(11063799006)(10067099003)(56012099006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGlFMVVYVWxBNjdDZUtJR2x4WEJyZjl1NkdDK2NVZndQZlVicmhUL04wY0lJ?=
 =?utf-8?B?R09PTmRRNUVndngwZGluejh1bHkwUDBQeFB3TklEenJiQWlJcVVpTW5KNmVq?=
 =?utf-8?B?RkVNZXM5SWZDdGI1cnFqNU0yZ3ZlYzRBbENyblUxUnF2b04vc3hKQzVkTGdz?=
 =?utf-8?B?cmo1bmZMcjJ1QnlvcDBUc2FWQkh2MzFjbmVPZWl6U3pXWGtxejZjTXdzcVdp?=
 =?utf-8?B?b0hNenVwU2xuNDRvNFRrN21sQ1FPaDdWYm8xNjg5ci9yWmN3VEFHODArWnBu?=
 =?utf-8?B?aHVSdlNhWlpuRUVFVURvZjFKUnV0ckFrRDcveFVsT0UvbTM1MnQ3Q2svMFBC?=
 =?utf-8?B?dkNkSk84MXpxNFdzd1dqMlVFUHozTWY5VlNkYXAzQjVFd0Y4UWRTcFA2VUYy?=
 =?utf-8?B?dzJIcHpuQTROeERUQTF1VG92c1hOeG9hb24zKzRRdjhsdUxpWVR6NXJFY3c2?=
 =?utf-8?B?V0ZNek5QODRleG5zR29Hd2FnOHFiNWMrMzVGNExHbnMwc3FsMEFsTm9OaVpT?=
 =?utf-8?B?cUdmbkR4cDFJMjhmNG9QdjlpaEFSZ1A5eXJYTUhOU21HczdUays5aEtrZzd0?=
 =?utf-8?B?aWhyTTZqdFM3YVlKTVY2SHhyYU9SOWpNYjNkeFJZUGhIMWxqeU0weWp2REo2?=
 =?utf-8?B?bGZzY3FDNmhhM2RnWmFiZDFBRUlObkxJcEVNMDlrL0k0OENuN3l4Z3hDM2NT?=
 =?utf-8?B?am9xNHlZeHRHYTQzNUhUZUFZSzhzT2VRa3V2NURCQ2Zob2VzU3JJa1NEcVNS?=
 =?utf-8?B?UkFqbWVJVDk4T2lGeTg0TlRCeWYxUTMwZ2NvWFRNUXVJbXZINWpkeU1rZHow?=
 =?utf-8?B?a1lObWNDNnJJVkJoOXBYSGQrODZFZlU2WW5JYTV1MmQrNS9MeC9sL2RKUWxs?=
 =?utf-8?B?d0tPcW1sS1hqRVVzODdmdjU1UUlxbzF3ZFlFOGRlSkVXN2o1NmxITjVjbG02?=
 =?utf-8?B?eDJ3WlQyejQ1VDJBbEVJQVA3QkV2OHZ6eWhXZkJCODRjTmRXNnpSY0V5ZmI1?=
 =?utf-8?B?aXZ1SDRERENjSGdzL0VaRkpaSUw5cHAxZTNncEVwN05yc2xYaDc3a2xERk9s?=
 =?utf-8?B?SjFVeHFBY05Ba09sYyszQmFzMDVSMGFRemFZQzgrMUgzOWhsZnlZL3RweUVX?=
 =?utf-8?B?VFhxakM1SnhQWGZ2M1YrY1Fjbm5yZlBESXdGZlY4UXRVaHZMMWladDdtUk9o?=
 =?utf-8?B?cTRDcmMvQlFMZWJHeGF0a2RjeW14NCtFZm00Z280Z1VFdkN0Tk9tK1BGT0V1?=
 =?utf-8?B?MWxETHRZRmlScldZbmh5c2wvbm0xMW1OK3Rub3oxN0JuNUIxWjR5dVlEM0N6?=
 =?utf-8?B?ZXJGeWpXNmFDM3kwazEvZ29NV2xaZjZHalFvL0QrZldEZjJBTXltL2k2eTk4?=
 =?utf-8?B?a2hlR0FUZmpxd2I0V3p1RUdHNEZ0N3hRMFdXZXlGSHArckp0ZTgyQlMxZStV?=
 =?utf-8?B?Nlo0MUppcHcwM1QwaE01MFRWTmpBYkR4M3B4T09zMlcvUlVIUXlWWGJ5QlA2?=
 =?utf-8?B?Z3lmbThTVEJiQVZoak5VdFdzUnNnZlREbkMrT0pkd1k1SHNMMDJSa2NucXFD?=
 =?utf-8?B?MmVORnl2Z0hWZHVKRDZRa1UxeG9uQVMxT3RuZUdWbUliMklxRGhHVFJKc2ZZ?=
 =?utf-8?B?ckxtRi8xbXJlWmJyWitsc2x1bWMybG5FQVFvK1h2YVQ4ZE9KeC9WMG8zUjhC?=
 =?utf-8?B?MDlPaWtPc1g5TndoZmtiVVllTmVPVDk5bzFpMXU2V0sxTXlsZzZCRnk5K3ZP?=
 =?utf-8?B?aERUbmdvL3NhZlJvNG5aMUJCZ1dWMGpJeEZReHYvYmhyMGgxQlcySVRYdG01?=
 =?utf-8?B?aXVKcDZocVRQbmJoMG9nRWlnR2hVQkt4YTZFVUNidGMxYURsRks3M2RUenBo?=
 =?utf-8?B?ZHBucmMvR0dPU0JnSkhkQnhpUjJ1Rkp5WkdtbFlBd2VNZ1l4UXIxbU04cEZ4?=
 =?utf-8?B?UkRFajQ3SkY2MFVrdWlMQ0U3QmhkSW42SzNVYzMxNkMyUmlOVzZVT2Rpd043?=
 =?utf-8?B?S1lDeWRxNmkyNzdRM1J6eVNsR1hOTzBwUVBGaGltcjB4UU5MSmRVVzZVOHhP?=
 =?utf-8?B?QkJ4OXdaTGE4VVNCMjl1K1BZcG9rVHh6UE5JQ0JFbVVTOXlxT0IvYlQ0RGlU?=
 =?utf-8?B?R1ZVeG1NS1lxS0I3YjQzT2krMWhSQnFoNWJzMmFiUHJDVVBtenh2Z3FOSkM0?=
 =?utf-8?B?U2NXeWZKUVlMREtTS1FrK3RHRkRTQldhQ2RqS1drcDUybk52S0xNeEpqZ1RO?=
 =?utf-8?B?U2FZc3Vna1hRTnVKeDF2cVNsYUNyUE9vMFJKYW4zSDRvQXhuOVAwTWs5QnRQ?=
 =?utf-8?B?YllBL2hNWFVWU2FtL050UUo4SE5NSERGRDFZMlJDYjg5aVRRemp5Y1A3a2t0?=
 =?utf-8?Q?FTYL5wN6ZeFcOfRI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1844673-b062-417a-edc4-08deec5c104c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8245.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 03:55:29.1524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +MSIC95lDmJNypCsALV74Iyn5v+km1oDyaVCZPKbGHCuov+AIGmT6FpDDfPAdsCu0QzYqJYOk06D5lDU1Inovw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_205535_885315_45E6BD8F 
X-CRM114-Status: GOOD (  14.79  )
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



On 27/07/26 9:14 pm, Thierry Reding wrote:
>>> +static int tegra264_pcie_suspend(struct device *dev)
>>> +{
>>> +	/*
>>> +	 * No need to do anything device-specific here, BPMP handles the
>>> +	 * details of taking the link into L2.
>>> +	 */
>>> +
>>> +	return pinctrl_pm_select_sleep_state(dev);
>>> +}
>>> +
>>> +static int tegra264_pcie_resume(struct device *dev)
>>> +{
>>> +	struct tegra264_pcie *pcie = dev_get_drvdata(dev);
>>> +	int err;
>>> +
>>> +	err = pinctrl_pm_select_default_state(dev);
>>> +	if (err < 0) {
>>> +		dev_err(dev, "failed to configure sideband pins: %pe\n",
>>> +			ERR_PTR(err));
>>> +		return err;
>>> +	}
>>> +
>>> +	tegra264_pcie_init(pcie);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static DEFINE_SIMPLE_DEV_PM_OPS(tegra264_pcie_pm_ops,
>>> +				tegra264_pcie_suspend,
>>> +				tegra264_pcie_resume);
>> PCI subsystem registered pm_noirq callbacks. So, controller should also
>> register to pm_noirq callbacks.
> Unfortunately that causes illegal uses of msleep() in no-IRQ context.
> Sashiko complains about it and is right. I don't observe any runtime
> issues with switching to the _noirq variants, but it doesn't seem right
> to stick to it.
> 
> Is there any reason why this needs to be _noirq, or any benefits if it
> was?
> 
> Thierry

The PCI subsystem registers pci_pm_resume_noirq() as a noirq resume 
callback. This function accesses PCI configuration space to transition 
the device from D3hot to D0. Therefore, the controller driver must first 
bring the PCIe controller out of reset and make its configuration space 
accessible to the PCI subsystem.

Many other controller drivers in drivers/pci/controller/ are registering 
noirq callback.

Thanks,
Manikanta

-- 
nvpublic


