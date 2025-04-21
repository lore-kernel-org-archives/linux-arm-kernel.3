Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DB5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 16:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfwVcqZIdLYa6ESa9VFX4UZ+RIhl2xtGcB894nYNcAQ=; b=x5Gukm4rBS4ikHD/2o3JTsYE5I
	yIKFLWhN0cc+/m+CfDxjvbgjCMzZv+WHviWLljvtibtpJVNnqStYQ7Wxn2vSR2hJAnRIIFIJn3z1r
	NjsGPzT5ZUdj4YiFynqWhMm1gLsdV9wY4JnXwl0PCWnSTaeWq80KGx26vZBYAyJFai1Mjw2rwE9K8
	hYX50j31+t5yQfLXCDL1N4jGgJ34+c8A5RB1Wb03Kk4qUZUUYGOJdyHCMXkwKUGiyKDUa4fhhqmTU
	qUtuvZm2MKFMhWcTd0n8DhVaX/32for8x+FnV1NlAsTmBqAOXEbOg/xhhwsGUwSE5z/RN0wPWl3T0
	1OaZ40Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6tb2-00000004d3h-1DjH;
	Mon, 21 Apr 2025 16:02:12 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6tZ9-00000004cuf-1Kzz;
	Mon, 21 Apr 2025 16:00:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhJeSVCj5+5pax3Z3dHRhYbwV5UUs/2bcVB0Tw0zUO5IujlHlKtO7RARaFcd6lySQ+/gF6B9st1JLYr9+YHnS+GuA2fKzYxoBt+pxdDOKPq4NPQLnIcZ5Awcr+GjIX8jsnlpcVn7KoxamdoY+Ug3m4MDNHMMxgXIFcKYvZRM6VOettzcFkgRmfMvN66+CSBaYNV5q/GUZAInNwjYDOKMeL9owuFIOGGbvymrEemd7fZenOcDsZ1XdjC8v9zajrYL9pIpkmMBQXtHcb7zf4IhZfhMW+oZCA2qpSW9OjnXX6kqbDEuJYPlYpF+49a/NlzUdeqJMMzXs+2Y8x/JLOjvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IfwVcqZIdLYa6ESa9VFX4UZ+RIhl2xtGcB894nYNcAQ=;
 b=oxECZRWZa+e8FbJ7AaoQiN/jzLgTq9U15+iRHEFmXyMkjmO90I3n/5Zl45og6oo2hTLdX72vAoW4pjaV/l9JyY0TlljjFPz714imVgnR4dlQOlc2VX/5sCvGqtmVKdMIuhttjd0f2N+p6vOzL8nf41PNVdunQD5zEnPPcfZeKea75l7noZ8iWVmhfnmp71Rh3ay7w5u4ks4OoFgv93+8J9Y1zHYJaSMqftK3pCKBVOwtmjiqF2wI3Pg5M+iv6DhWhmqQf2/U+yb0ZJ4DRPSLrpGhw9u7SiQqPrIwFHWo5JDhQ/HxC6gWETqrMEkJIr9aFgzhtzs2qlu4jPLPGiczFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=163.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SL2P216CA0135.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1::14) by
 TY0PR06MB5593.apcprd06.prod.outlook.com (2603:1096:400:31e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.35; Mon, 21 Apr 2025 15:59:54 +0000
Received: from HK3PEPF00000221.apcprd03.prod.outlook.com
 (2603:1096:101:1:cafe::a) by SL2P216CA0135.outlook.office365.com
 (2603:1096:101:1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Mon,
 21 Apr 2025 15:59:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK3PEPF00000221.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 15:59:53 +0000
Received: from [172.16.64.208] (unknown [172.16.64.208])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 548CA41604FA;
	Mon, 21 Apr 2025 23:59:52 +0800 (CST)
Message-ID: <60a41564-43ed-41ea-af5c-eb8409b47ad1@cixtech.com>
Date: Mon, 21 Apr 2025 23:59:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Hans Zhang <18255117159@163.com>
Cc: Niklas Cassel <cassel@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Shawn Lin <shawn.lin@rock-chips.com>, lpieralisi@kernel.org, kw@linux.com,
 bhelgaas@google.com, heiko@sntech.de, robh@kernel.org, jingoohan1@gmail.com,
 thomas.richard@bootlin.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250417165219.GA115235@bhelgaas>
 <22720eef-f5a3-4e72-9c41-35335ec20f80@163.com>
 <225CC628-432C-4E88-AF2B-17C948B3790B@kernel.org>
 <8af8a418-b808-4a14-9969-1c6d549e1633@163.com>
 <vc6z6pzgk2sjgkghnwfzlmj3dblrvpkfnsmnlb2nnkj2leju7t@uxy3kthse7g6>
Content-Language: en-US
From: Hans Zhang <hans.zhang@cixtech.com>
In-Reply-To: <vc6z6pzgk2sjgkghnwfzlmj3dblrvpkfnsmnlb2nnkj2leju7t@uxy3kthse7g6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF00000221:EE_|TY0PR06MB5593:EE_
X-MS-Office365-Filtering-Correlation-Id: 348ec270-357c-425f-77e9-08dd80ed8e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3pUSzFYT1ZIMERMTCtwN3JDclhPaG1nVFRCMHlQS3JpSWw5K0J4alBqMUFj?=
 =?utf-8?B?bkxHZHo3Y0YzZFlXUlRvT3RNdXFPZzBSazJZcDcyMkhuelErVHhqWkFSZGpa?=
 =?utf-8?B?VUNaYS8wb1Y4M2tPdnc3NGxGWWc5OWhnYUVZUkI5WmpOTUVnL3loOUZzNFBM?=
 =?utf-8?B?S3J4WmZXNzhKazM2VUJMeXUzcnllbG9IeVR4Q1g0OWVBSFZXSis0K0U3aUIz?=
 =?utf-8?B?Wk5lWE44b2l3SWtWUUhMU3l3T1NwekptUDRxSVhPejVpMzUvVDR0WFBOc0pX?=
 =?utf-8?B?WmJuT2M1ZFpPR0t2M0pYQk1rOUtkekJ4UXVTMUxoc2R0VVhCL2p5L244THNI?=
 =?utf-8?B?UlFZRmVZaXQwUHVJN3lqb3BPN0RzVzRXQ3BwTXNkaEtrcHVlN1dlMzRDUnEw?=
 =?utf-8?B?NThuZUFobXpaK0d5Wll6WDVoN0VFbzlvcUIrYlhjYVZWcEZLZXpjcnM1aGFp?=
 =?utf-8?B?SkZyZmkwZExGUDJuaUl0Q1ZIa3E1MjQ3TTBsYVBEaEtQWDV2SllNNTdGZDFF?=
 =?utf-8?B?c1FIUUhlaEtFazFTMldZaW9LRWNEVUlKamY2RVdxazVjQytkRll2OTF5ZVVG?=
 =?utf-8?B?alZ6bFhRSHUxVy9uRThsV1lUbjFnOVd3cU1HZEpwRVl2L0hzN3AwV3o0dmxX?=
 =?utf-8?B?Ykg2RGhVNW9yMTIzekZld2tBZEhISVBNbUNqS2s0amIvZzErQmJyZ0ZpT3Ft?=
 =?utf-8?B?cHNXMER2cWx2RVpEUzRpVFNxdnE0ZEp6WnkwZEt6SVpNVElqVWEzbHNtVHEr?=
 =?utf-8?B?azdqM25hTWZTSnNBN0tXV3pOdXdxbXErWnM4ODZnaVloeEZxWk1PWHRIWWYx?=
 =?utf-8?B?Tk9tclQ1MThMT09Fc0d6MEt2NmxBd2JKaldSa3haTjZ6bnVaQkYrMlFSMTNz?=
 =?utf-8?B?K29FRDdjRnV5QjZ6YzUzWUlVN1EwTFVPTmlPQ3pOQllaR0xEVkg1cFFJNFVw?=
 =?utf-8?B?aGpQVEV4RW1xNFFYK0Nobm9pdFkxR1ZxK3pGNkg5S2dPekdiUDdiQ0doMkhN?=
 =?utf-8?B?SCtVSWpGWW1SQnI1WEhJMHBpVktTZGVkNGNGZVo1cFhrVUtQcWwrVzFoNmRM?=
 =?utf-8?B?YUZ2VG1kR0g3dFRmRFFScUhSL1NUQnJtQlhIZW95RTd1OWZybVN5VU45bHcx?=
 =?utf-8?B?M3o4aXVyQ1VuMDV3TlNNbkJNWnQ5SEVmTk9sSVRra1FtMFVFL2tPT3JCZjBT?=
 =?utf-8?B?eW1JNnk2UURGenJ3RXdpRUZKVWtheUMrYU5iaXhtcXpFTk5KSm1IeEh0d2Rt?=
 =?utf-8?B?OFdRVEs1cFpweCtuUU5jbFVFaCtLMWlPUFNHa3JhNXhhb085RzQ4REY4OG1u?=
 =?utf-8?B?cWxqOXRMR2xkTVUwclNCSitpbW0vQ3NhK3pnaGxNS0ZucmFHVURDZUFaQjlj?=
 =?utf-8?B?T2VONjFobGJHWkpTWGFSZDI2b0VRekhkaW12RnNLaWpWOXU4QnZhL01IcElr?=
 =?utf-8?B?NXJRYWZjbEpvY0x3ZnVrbG5OemUwVE1ZRDUrVGFqWm13UWxCYUJXU0IyN1Fy?=
 =?utf-8?B?OVUvekJOOUowRDRLVUNYUnQwY2dQbXJJSTlpQmQrcDh2WlU3enhEZHMrZ052?=
 =?utf-8?B?Y2RzRGpLcXc4d2xxWW4wejlKOFlwM3NVd2tkM292UWRPRzgyc3QxaEZqWklv?=
 =?utf-8?B?RmRaVkxWN1RwYlZxc0w3aU1aSzYxN0x4QndZNlY4amdBcDN4OG9rMzZlN3ND?=
 =?utf-8?B?bENDa0hxZ25DY3NsUU5IaEx4WldqTUsrNWlaeDM5MFdqdk9wNC9qUHJpUS81?=
 =?utf-8?B?T29uc3NEbnJOOEhtaWloeUxEQ2JZMHU5V0JlRjNPZTdEY0RsbG9YQnBQQ3lk?=
 =?utf-8?B?d2wrd3FySnJGaEY3V1E0Q1lpeWdkTzh0amxBUktUd1ZlNXlKVFRXbm55VXpG?=
 =?utf-8?B?dExaSGNRd1J2b2NJd2FpaDJENENGa1cyRDFOOU9jZXRIUzY4eVowZG9oN1k5?=
 =?utf-8?B?YlJmZGxUaW92RWpjclVaU243N1ZHUHJOTzV2aW1kaElsV2VSTFZlS1BFc1RZ?=
 =?utf-8?B?cWs2cjRPeTh5aFVtNnN1UzE2SEdwZDJPMm9uZ1loZ0JIbk1vK0pNcFcwaG9w?=
 =?utf-8?Q?ts+v+2?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 15:59:53.4035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 348ec270-357c-425f-77e9-08dd80ed8e1d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF00000221.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5593
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_090015_473764_D35B8A23 
X-CRM114-Status: GOOD (  27.49  )
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



On 2025/4/21 22:53, Manivannan Sadhasivam wrote:
> EXTERNAL EMAIL
> 
> On Sat, Apr 19, 2025 at 01:21:54AM +0800, Hans Zhang wrote:
>>
>>
>> On 2025/4/18 22:55, Niklas Cassel wrote:
>>>
>>>
>>> On 18 April 2025 14:33:08 CEST, Hans Zhang <18255117159@163.com> wrote:
>>>>
>>>> Dear Bjorn,
>>>>
>>>> Thanks your for reply. Niklas and I attempted to modify the relevant logic in drivers/pci/probe.c and found that there was a lot of code judging the global variable pcie_bus_config. At present, there is no good method. I will keep trying.
>>>>
>>>> I wonder if you have any good suggestions? It seems that the code logic regarding pcie_bus_config is a little complicated and cannot be modified for the time being?
>>>
>>>
>>> Hans,
>>>
>>> If:
>>>
>>> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
>>> index 364fa2a514f8..2e1c92fdd577 100644
>>> --- a/drivers/pci/probe.c
>>> +++ b/drivers/pci/probe.c
>>> @@ -2983,6 +2983,13 @@ void pcie_bus_configure_settings(struct pci_bus *bus)
>>>            if (!pci_is_pcie(bus->self))
>>>                    return;
>>>     +       /*
>>> +        * Start off with DevCtl.MPS == DevCap.MPS, unless PCIE_BUS_TUNE_OFF.
>>> +        * This might get overriden by a MPS strategy below.
>>> +        */
>>> +       if (pcie_bus_config != PCIE_BUS_TUNE_OFF)
>>> +               smpss = pcie_get_mps(bus->self);
>>> +
>>
>> Dear Niklas,
>>
>> Thank you very much for your reply and thoughts.
>>
>> pcie_get_mps: Returns maximum payload size in bytes
>>
>> I guess you want to obtain the DevCap MPS. But the purpose of the smpss
>> variable is to save the DevCtl MPS.
>>
>>>            /*
>>>             * FIXME - Peer to peer DMA is possible, though the endpoint would need
>>>             * to be aware of the MPS of the destination.  To work around this,
>>>
>>>
>>>
>>> does not work, can't you modify the code slightly so that it works?
>>>
>>> I haven't tried myself, but considering that it works when walking the bus, it seems that it should be possible to get something working.
>>>
>>
>>
>> After making the following modifications, my test shows that it is normal.
>> If the consideration is not comprehensive. Could Bjorn and Niklas please
>> review my revisions?
>>
>> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
>> index 364fa2a514f8..5b54f1b0a91d 100644
>> --- a/drivers/pci/probe.c
>> +++ b/drivers/pci/probe.c
>> @@ -2951,8 +2951,7 @@ static int pcie_bus_configure_set(struct pci_dev *dev,
>> void *data)
>>          if (!pci_is_pcie(dev))
>>                  return 0;
>>
>> -       if (pcie_bus_config == PCIE_BUS_TUNE_OFF ||
>> -           pcie_bus_config == PCIE_BUS_DEFAULT)
>> +       if (pcie_bus_config == PCIE_BUS_TUNE_OFF)
>>                  return 0;
>>
>>          mps = 128 << *(u8 *)data;
>> @@ -2991,7 +2990,8 @@ void pcie_bus_configure_settings(struct pci_bus *bus)
>>          if (pcie_bus_config == PCIE_BUS_PEER2PEER)
>>                  smpss = 0;
>>
>> -       if (pcie_bus_config == PCIE_BUS_SAFE) {
>> +       if ((pcie_bus_config == PCIE_BUS_SAFE) ||
>> +           (pcie_bus_config != PCIE_BUS_TUNE_OFF)) {
>>                  smpss = bus->self->pcie_mpss;
>>
>>                  pcie_find_smpss(bus->self, &smpss);
>>
>>
> 
> As I replied to Niklas, I'd like to limit the changes to platforms having
> controller drivers. So here is my proposal:
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 364fa2a514f8..d32a0f90beb1 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -3228,6 +3228,17 @@ int pci_host_probe(struct pci_host_bridge *bridge)
>           */
>          pci_assign_unassigned_root_bus_resources(bus);
> 
> +       if (pcie_bus_config != PCIE_BUS_TUNE_OFF) {
> +               /* Configure root ports MPS to be MPSS by default */
> +               for_each_pci_bridge(dev, bus) {
> +                       if (pci_pcie_type(dev) != PCI_EXP_TYPE_ROOT_PORT)
> +                               continue;
> +
> +                       pcie_write_mps(dev, 128 << dev->pcie_mpss);
> +                       pcie_write_mrrs(dev);
> +               }
> +       }
> +

Sorry. Since the reply just now was made by logging into the email 
through the browser, there are some errors. I reply again as follows:
[My personal computer is not at hand. I reply using the company email.]

Hi Mani,

Thank you very much for your reply and suggestions. The following is the 
test on our platform and it works properly. I wonder if others have any 
other opinions? If not, I will send the next version and then see 
everyone's opinions.

root@cix-localhost:~# cat /proc/version
Linux version 6.15.0-rc2-00015-gced1536aaf04-dirty (hans@hans) ......
root@cix-localhost:~# lspci
0000:c0:00.0 PCI bridge: Device 1f6c:0001
0000:c1:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd 
NVMe SSD Controller S4LV008[Pascal]
0001:90:00.0 PCI bridge: Device 1f6c:0001
0001:91:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd 
NVMe SSD Controller PM9A1/PM9A3/980PRO
0003:30:00.0 PCI bridge: Device 1f6c:0001
0003:31:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. 
RTL8125 2.5GbE Controller (rev 05)root@cix-localhost:~# lspci -vvv
0000:c0:00.0 PCI bridge: Device 1f6c:0001 (prog-if 00 [Normal decode])
         ......
         Capabilities: [c0] Express (v2) Root Port (Slot-), MSI 00
                 DevCap: MaxPayload 512 bytes, PhantFunc 0
                         ExtTag+ RBE+
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 512 bytes, MaxReadReq 1024 bytes
		......
0000:c1:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd 
NVMe SSD Controller S4LV008[Pascal] (prog-if 02 [NVM Express])
         ......
         Capabilities: [70] Express (v2) Endpoint, MSI 00
                 DevCap: MaxPayload 512 bytes, PhantFunc 0, Latency L0s 
unlimited, L1 unlimited
                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ 
SlotPowerLimit 0W
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+ 
FLReset-
                         MaxPayload 512 bytes, MaxReadReq 512 bytes
		......
0001:90:00.0 PCI bridge: Device 1f6c:0001 (prog-if 00 [Normal decode])
         ......
         Capabilities: [c0] Express (v2) Root Port (Slot-), MSI 00
                 DevCap: MaxPayload 512 bytes, PhantFunc 0
                         ExtTag- RBE+
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 512 bytes, MaxReadReq 1024 bytes
		......
0001:91:00.0 Non-Volatile memory controller: Samsung Electronics Co Ltd 
NVMe SSD Controller PM9A1/PM9A3/980PRO (prog-if 02 [NVM Express])
         ......
         Capabilities: [70] Express (v2) Endpoint, MSI 00
                 DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s 
unlimited, L1 unlimited
                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ 
SlotPowerLimit 0W
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+ 
FLReset-
                         MaxPayload 256 bytes, MaxReadReq 512 bytes
		......
0003:30:00.0 PCI bridge: Device 1f6c:0001 (prog-if 00 [Normal decode])
         ......
         Capabilities: [c0] Express (v2) Root Port (Slot-), MSI 00
                 DevCap: MaxPayload 512 bytes, PhantFunc 0
                         ExtTag- RBE+
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
                         MaxPayload 512 bytes, MaxReadReq 1024 bytes
		......
0003:31:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. 
RTL8125 2.5GbE Controller (rev 05)
         ......
         Capabilities: [70] Express (v2) Endpoint, MSI 01
                 DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s 
<512ns, L1 <64us
                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- 
SlotPowerLimit 0W
                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
                         MaxPayload 256 bytes, MaxReadReq 4096 bytes
         ......

Best regards,
Hans

>          list_for_each_entry(child, &bus->children, node)
>                  pcie_bus_configure_settings(child);
> 
> - Mani
> 
> --
> மணிவண்ணன் சதாசிவம்
> 

