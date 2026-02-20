Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C8AC531F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 00:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d6bg0rpR753Rq38WNEga+kGEU5lWqLs6wq3nmC5S8ek=; b=YizXaCrhjs0dS2me7r+F9g+UiN
	DiNfj7DHd9Sa/ug5KBsd/NWcK6I7NjBWudFN5thBiIvu5MwiqlUmo6Tdfb+TNL2X4mBdNlQctEpMy
	TPvPoSVgBEuT5zDJsjHNk/00EefbuTEL6XVqGVN+s6XUDhlw7aFJADFE5XBLRLVmBDrkCGGMcAupH
	TMg3p4XVsvl1laRRQKLafX5vLFuW6T4mkKUdnSTj5HvU5UZQMeoVLn6RMQn2jlWlS+TQ1O8friJrk
	oeNpir0H/p6aneDdF9OKrXalaRse5TDfkP9JsP0Cjdnv6kUj/Wts767ZkgEe6cNFU3LzDWtHZV+Tk
	bMfIlrSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtEbl-0000000CmFf-3Vmq;
	Fri, 20 Feb 2026 00:43:01 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtEbU-0000000Cltg-2Znm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 00:42:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isvQlzq5mqtqD5HxCGe2/IUJa747sUC2FGbORAGopw3+XFCS6mSpkd70iCWRH0JmyE3wCZeDsShZs7Rn5qfxIG2D39pMkrfSlPGa8inAh4OaTwtWg4+A1DkLYyRZX/SLI0tfG1A82NZxZQUg7MyKRq12EjwP4SGvhjWkZIGJ28bHC3knOKVeeOsozGBRLAbmzbDzNT/sE9lBlldiwGaDGQUp+IkUWXuEBUcQxUY5a6N5T+l0BU2dHPf6QceAi4R5A13wdNQaAs85Q57W12ZMBQn6RByMDXPrkocaNLYGpiDVlhwZGkK0nU5qD3Sts/sM4UEp1vSsYCuZYtjy7BISeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6bg0rpR753Rq38WNEga+kGEU5lWqLs6wq3nmC5S8ek=;
 b=hmzcc5FX3rgjqi/B4aEHRAyp3K/YsPjwUaS5dGicQUYNZf04xyoth0LzrFuaK4SsrTXP5kx5IGtYeHcRDDje3tW22Cp/piU7efYunR+ZVWuaZy9mTBMdCC5ojZywsTX0FSEIeK/TlHJZJQGWVkDpBrHzkyjMLXUq3ORm1KzQ2/MCmgDbrspZ3QgEplCyFxkcCSyAvxFnRIwTYeq6eI+wYKgSmRODoc3M4vdBgVU3IZC4Q2ZSOYEdlqJVRjxumKGbUEZVIANAFxlNWqH/uAcjxa4GMXXD4VvVCo852vrYMhQDZCt4IyRCgXjSC1ctYPEOPkW+WBKJLV+D83H9yoqQ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6bg0rpR753Rq38WNEga+kGEU5lWqLs6wq3nmC5S8ek=;
 b=SELyhEIDgpO7P51Y2COqrIOhGhes1JjUUHWG77+0RuVm/k0axjxKnOUzCQ+2DB+JIa+Ns+JMO1rqOXYTozUhzukk6NOMGZKaYcR/6FGEKzdz3SOfpPBCwNxaX8JMO6TtVnRXVdxRTdqZvGP1IZzH9YKK3GdjdCAIIx/UIzYeSZQ=
Received: from BYAPR05CA0097.namprd05.prod.outlook.com (2603:10b6:a03:e0::38)
 by SA1PR10MB997739.namprd10.prod.outlook.com (2603:10b6:806:4bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 00:42:39 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:e0:cafe::85) by BYAPR05CA0097.outlook.office365.com
 (2603:10b6:a03:e0::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Fri,
 20 Feb 2026 00:42:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Fri, 20 Feb 2026 00:42:38 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 18:42:38 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 18:42:37 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 18:42:37 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61K0gbe73456406;
	Thu, 19 Feb 2026 18:42:37 -0600
Message-ID: <b22958ce-fb67-44d3-841a-d02a185942e5@ti.com>
Date: Thu, 19 Feb 2026 18:42:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-am62a7-sk: Disable mmc Schmitt Trigger
From: Judith Mendez <jm@ti.com>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>, "msp@baylibre.com"
	<msp@baylibre.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20260106-topic-am62a-mmc-pinctrl-v6-19-next-v1-1-1190ac29aadb@baylibre.com>
 <c47697b4-6ebb-4af9-be96-c964d990835d@ti.com>
 <DFO764ES0FNP.1SUQK9R0EUUDQ@baylibre.com>
 <1a91fd40-e814-4b4c-8914-d8f0c4768e07@ti.com>
 <DG59D7WGM35A.1WNIIMNCQ8U3C@baylibre.com>
 <7ae7f6a1-0ee1-4d56-b1d0-f038a7d22b4c@ti.com>
 <b649669afe4e2c829389a6bedabe47446d2f3d2b.camel@siemens.com>
 <615c56c4564b38fe82585e9873949b538f24ae7b.camel@siemens.com>
 <7ad9d8bf-a962-40f0-bc8a-92228aeb0b4e@ti.com>
Content-Language: en-US
In-Reply-To: <7ad9d8bf-a962-40f0-bc8a-92228aeb0b4e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|SA1PR10MB997739:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ff57cb-5270-4cac-0f86-08de7018f2c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVdhUjloVTdTazZUR1NLQ3luLzZDbWlLaUpVYVVaTHFaRFVYYnl1TmxFdzk0?=
 =?utf-8?B?U09WOCt3OUZZODg0ak9NcHdXajhVTStrUnIzRnN2OFUybTd2VzRIWlZDbC9T?=
 =?utf-8?B?S1puR2F6ZldIUlAwY1JVYzRvM3RQZENyQWRnaHVvbVkyWjZvNkxnelhRTHBj?=
 =?utf-8?B?eEUvVXhwMXdTbmxVWmFDYkxhOFBEUUUyTmJxT1RzZnJta1VWQ1piM1JqOWRH?=
 =?utf-8?B?a2c0VHlQUXoreHdyVEFwUVpMUkxXTGFMbE54Q0dsZFNUQ3I2ZDVObE1vNHo5?=
 =?utf-8?B?djE2QlhrSTI1blowRkxQdndsUjZMWmJWWjJTR2JsSnczYnZDWlZlMnlycXFC?=
 =?utf-8?B?UkNJSjRtZlJNU25yNzl5TStZZEwzVWZzSTR1NER6ZVFwdGlsVUE1VVhFV3Qw?=
 =?utf-8?B?VzVSRUhydXhkUTI2UWx3SVd2VWRPeXhCTStnWGFEU1NBdmt4VVA1d2VpOFhs?=
 =?utf-8?B?VXQ2SUtqTWc4YTRuakRSaVBjeUJjOUF5Z2xOVjlKcUQ5UmdJdzdPeTY5VGMr?=
 =?utf-8?B?YjVJVzJ3VmNvNlNtZTRGWExZb1Y5WjBZcThqNG9XcVFWTmxJVmVHamIrSHEv?=
 =?utf-8?B?QVZrV09sVDFPVHRNOXBuMGl6MGdqbW82aUN4R1dZVkFmYnNZNlRVdjRNTnRY?=
 =?utf-8?B?d005Q1JqKy91MXh4eGk5dEhMWEpQb3E2clRaK1JNcytoT1A5eDU0cksyREZ1?=
 =?utf-8?B?RzBneEVqQUNqeG9vRnV4T0JlMVlYZmdPVlFNbmJGbVljY04ySkxyZlQzU2gz?=
 =?utf-8?B?SUw2bEd3YzFidmZnYW9YdFFXdHM2SExIYk1oNjV1Q3kxcmh2VzRvZUdZUk43?=
 =?utf-8?B?TDVFelk2UUNuaDVqRi9ITndsUWJLUWhTVUl1ZHZ6SlBmdENia1F2cm44c3d1?=
 =?utf-8?B?N1A4RTAzRUhueXNCTVF1NE1UcjF0MTMvWURLS2g4cTZqalQwblI1TTJJOHVT?=
 =?utf-8?B?NUZhT3B6Q055N1ljeWVyeUJsaTJTS1F0Ri96Mjk1U3JRSEtYNTlSYy9zb005?=
 =?utf-8?B?NUNCTDJrc2NiV0FMSXV5K3RuL1lhTEhMYmt5dzJUYTMwcXZNNDc0MFdJazBw?=
 =?utf-8?B?dVlyQmlUNjI2ZklCT056NmIrWU42SGM1ems3RldqRWtuRjNVRjhMQTVCb2FB?=
 =?utf-8?B?ZkxFcjAxUS9jckhkUmg0N1cvQjlLbkIwTC91UVQyQk8vcVFab0lXUml3TTY0?=
 =?utf-8?B?anN6VjFlWG11U051OFZxSU1EeVZiOWxlUlN4M1cyMXRKajdTVWErczJSVUJI?=
 =?utf-8?B?YTRXa2VTVnE0b0JZaWlveS85czhKQ3UyS0s0cmZLbXRhMmJNS2JJcThQNGUx?=
 =?utf-8?B?T3F4Q1hZV2FvVHVVYzB0Zi9PTE5teFhKb1hIOFhpT3NoMjVGZ2pZTTdhWTA0?=
 =?utf-8?B?TnpQcmtPaUwvWXNUU09TNTdvTllWNDhIWGxZZENuMnlGQWdTS1NaR3p6NW9H?=
 =?utf-8?B?T0Yvcjg3R0RPTVBWUVVhaDBvYk5yeUoyYVNMbkJMTEVjTnBGajRnRVE0MGVE?=
 =?utf-8?B?QU5veGlVT043eFE3TlhDRmVReWR3a1ZqS2hCWmlLMzI5RWcvay9COTY0Vmt4?=
 =?utf-8?B?NGhTSy9Jb254NVJkTzNVMEZiQ0FkT1NLS29rZGdWOXBpRUpGOWZNd1JkamQz?=
 =?utf-8?B?TmtDYVQwUU1HYTM5aEFCUEdFbk1uaEhVUWV1eGhJZnpiZ2dlQ3hpUjVGMFMz?=
 =?utf-8?B?TTJraStDUkF5d0ZFRzdVQ1d4ajg2T3F6ZDFEdGtib01rbjdkdEt6dzZUaGN3?=
 =?utf-8?B?cUR6Z3JoV2xjRERNSUN5dndnRU1aVjNqVGo0Z0JLUEZjLzlXRDl1cVl5Y1hO?=
 =?utf-8?B?dDdFV3RSb1FEWlY4Qk5mTGg3RDJZVFBDVUZwUnZiODNXZzluaEI0V0pEOWt5?=
 =?utf-8?B?MFI5ZkF6VUpYRUlQUDRDQnJaTXpOcGZ4aXJoWW1LaTVhQUpueUxsNk1oQStl?=
 =?utf-8?B?OTZFRklRY0V5Ky9VSms0UjJFNGRMRjNVeVh5dWYrdE5GblAraUNtYWlGcHBW?=
 =?utf-8?B?c1VJMm5KRWlHVmRIb2c1SWZWNkNWQzlDd0NNVzhhSXRtL3ZrdWlHOVdWY0Z2?=
 =?utf-8?B?NFhHUHgwdXgyWHhhbUNjLzJaWC9OOTJkRE9PU2hVRlFhS1VvOVd4bmYvdEhZ?=
 =?utf-8?B?WVhkTm5pU3g1WnhnQmpSR2w5U0ZnSmVPTk1iM1FWK3dzUkxJMTNGNXlBbjBl?=
 =?utf-8?Q?78mT3q7o/H2+nLHozP4umZQ=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V1sFYXSioYgYBcRJhhHwiRlpBdLXFsPssa1E761PaJCYyFs4SvK7a569Pj1IuOzaweR+qGdSsFrGbTQjBFMfyajVRlaFQBXSqKOzRJ3SEyY+S4zlB29v0adJgqgoJUnFZpf026S/WPYCg7suE8uxWej1jIEEGQLMAnUc2og7xtsKlFyd5W3Nwt03VFPUGqc/1b6+5iogRCZdidb0JaH2Ke82P6XvGONFe7PCMloIjM9mS6Rj5NkCrbd34kuk35ccM+5butRc71DqxhxsyvvqE3D0+R2wmhFTmWvwQRulm/h8NMzY8v8jygJjdI3+buwcWjwNHBeJSWeLSuWChahQjh3+ujBEO9S+OJr4EIrGayCBhy1vkj9PpHwPIT1uRGoJm6v0G9iZUj0mB0WI0TgKFcTh+jwoXGnKEPBhs8jDZYVgoSkHkGtFqyo+p23ptUit
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 00:42:38.6586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ff57cb-5270-4cac-0f86-08de7018f2c7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_164244_668981_632E98E1 
X-CRM114-Status: GOOD (  17.19  )
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

On 2/19/26 6:10 PM, Judith Mendez wrote:
> Hi Alexander,
> 
> On 2/17/26 7:23 AM, Sverdlin, Alexander wrote:
>> On Tue, 2026-02-17 at 13:57 +0100, Alexander Sverdlin wrote:
>>>>>>>> Can you please run a quick tap sweep on MMC1 and MMC0 interfaces 
>>>>>>>> like
>>>>>>>> so? https://gist.github.com/jmenti/f4a73a8323e44bf717c6d2c528c499ca
>>>>>>>>
>>>>>>>> This will give me an idea if whether we should be talking about
>>>>>>>> revisiting characterization with ST_ENA=1.
>>>
>>> I wanted to apply your patch and test on our HW, but I have some 
>>> doubts, if
>>> the patch maybe missing something:
>>>
>>> - am654_sdhci_write_otapdly() turns out to be unused in any upstream 
>>> U-Boot version
>>> - new "omap" variable in am654_sdhci_execute_tuning() is in fact 
>>> unused as well
>>
>> and
>>
>> | /home/sverdlin/u-boot/drivers/mmc/am654_sdhci.c: In function 
>> 'j721e_4bit_sdhci_set_ios_post':
>> | /home/sverdlin/u-boot/drivers/mmc/am654_sdhci.c:598:9: error: 
>> 'itap_del_sel' is used uninitialized [-Werror=uninitialized]
>> |   598 |         printf("j721e_4bit_sdhci_set_ios_post, mode=%d, 
>> otap=%d, itap=%d\n", mode, otap_del_sel, itap_del_sel);
>> |       |         
>> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> | /home/sverdlin/u-boot/drivers/mmc/am654_sdhci.c:594:13: note: 
>> 'itap_del_sel' was declared here
>> |   594 |         u32 itap_del_sel;
>> |       |             ^~~~~~~~~~~~
>>
>>
>> so I'm not sure regarding the previous test results at all any longer..
> 
> Sorry for the late reply, somehow I missed this email.
> 
> Oh my, I am not sure what happend but seems like I did not copy the
> whole patch correctly. Were you able to bypass or do you need me
> to rebase the patch and copy correctly?
> 

Your response actually explains why Marcus's log did not make
sense at all, thanks. Here is the updated patch in case you need
it: https://gist.github.com/f4a73a8323e44bf717c6d2c528c499ca.git

Markus, can you try with this patch instead?

~ Judith

