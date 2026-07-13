Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AABC44506
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GmABDqq2A/6sM+JU6TfD71MScsEfvEmd385SkW2qdA=; b=DeXm2jqyTe/1TRRyiLahgWGpKR
	YgmsvQN7FqlKtJMn7vUOn8LFBx/DbZpYSNLB/IGAKm3qrL7qxxwKDHyL9pvSPI2uYfRvR7uZF9MON
	6DV781I2Z2omb8/8UwbUVwxkRMIEW0nLdc7MtyUzUdU7XHu7Ol3t8B22kKUsVIIzKVF2uMq8rdnca
	f5rmgj2GwLqNyh68DLOBn8ofK6XIBVfdO8IcfDayrjPUSW87rbFJJPwKVQ4knsV/AZkZbsmDQCkwW
	wwGVexyW0V5aTSj0PLBnD3OOXHR0pN3v4zYoXCz/uDJCIfuQxwqffXbzwhxewN5nxtsfioHHgqU24
	OyXEWfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCNE-00000008dZM-3dPS;
	Mon, 13 Jul 2026 08:50:48 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjCN2-00000008dVb-1k7x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:50:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iizEwk2oEhhbsjPBHLg9fen7EoKUWdM+6I4WdehNdbJ6m3DEcAuM0NSk8we3iKJN1B40HSZRwE4tew9a6YMpxeMZQIi8vQk0a0kQExHug7SKjpR98JKdili5TUqu9mfgagQH4ai8Z0xM9yvtQfNxh8emDuArJUEuZuoKKjwlVGtz6VOMnIwTZXSBg7On0iRHg1lC1HrNNjPtf//mr47r46GBEnjnFHurRHFYwTFuONBx4TDUMDcEfr1Tc7vg98hfswhB9BOwSB2wj6XqC0JSsI6iMGeESW9MyJDEvgv5E5gGnvNkUPFHw+APmI2So+/KxOC3wggNcLy33Ya8JWOpkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GmABDqq2A/6sM+JU6TfD71MScsEfvEmd385SkW2qdA=;
 b=hVuJZFcSmUgykbW/tjeESigh4CkpY+eC9fV7eRsvYOU5NThb+VqgjN7sEF45rt3scZ+U5BP7yDwP+i+A9COXMhrqDuOjJ8EDzsRuXNpX/eUVXYxUru8cuVPAmj+rFb30l6B7WpLZCNBULvmIsiqIQOwyqjzuKdNnDicu9PYJZl2jUo3PdJRM9RJmtWwQ1EuNvMb8fUtzMXAeNiP70wEw2rLDkQA/d3DTlELDOY4pZ0EdZcuXASDl2KQasRD0sogQkD/AF/PEMrJkqCnba9K0h2dVrwaO6LkfgkB++r9+Qm9Z5ax6e6eFTIfyQvRuTO7aP17EYDvkey7RPV9clv7vTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GmABDqq2A/6sM+JU6TfD71MScsEfvEmd385SkW2qdA=;
 b=xNiKZgYr7xRTj4VRpvja/rsqX2UZji6VRbCGFjr7Y9hzmVr+ERn6LfxY/fauZVbh78wR9TuiUcm3J5b3L2A2+8OhxO4hYk7e5as9WRQEJsiXl1bt3dMXI9JDdztJQEY01ckkLc8NbEww5rn+RaONKdcoEmWPSg0eGKKAOSB3eA8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by PH8PR12MB7027.namprd12.prod.outlook.com (2603:10b6:510:1be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 08:50:28 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 08:50:28 +0000
Message-ID: <efa39e05-0bed-4a61-8636-22487e6f9f86@amd.com>
Date: Mon, 13 Jul 2026 10:50:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: xilinx: Remove EDK/Ethernet references
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
References: <40767504662d6461553db77465230e25348c69bc.1783413127.git.michal.simek@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <40767504662d6461553db77465230e25348c69bc.1783413127.git.michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::6) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|PH8PR12MB7027:EE_
X-MS-Office365-Filtering-Correlation-Id: aacca730-d392-4aa0-af50-08dee0bbc9ff
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|3023799007|18002099003|22082099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: vagQBLXOfqmELT5SjR1C+Zj3yhMEDKXX3yMnsIMuQ5EGOAbf5mxJu+9NuAJ0Nz6JJyCpY2su6cBgQ2ODDLl715SKsZnXOmCUuJy4GmPVZq0Ir4mcb5QDEy+BCYHS+Dnx/g5uoVvJLF4W6ukI/GVbq3yK2Ghi/x8YAMhBqk10CUAVVHS3XR8G6ZECiPA5bIq+0WE9rocz4lXYH07Fsk2Y/JT6q9WTBWV7Wbt9wLyxrkkR9Q8ZuW9IYDWjNd5MFGzUTlKCSuG0kUvSOt7WTpqGn1EwT/U+ZF7r9foSsscaQUDYopo2ktZzh2jkVNK0XvwanIjom1l+F1d9XuRiWuvvNqQzXaULlNCmcMu4osJCe+o4/P4DRzeVGEO2idMyUXOO1ZQyfMVk4/ps2a+gSiYNz4lgr9FvXV1AeW5m6BE0fyc6s6NHZleYOffip5nYJxbP5zUJ/d6a5Sktv5U4UIXS5SfwTdpFDdMEmFs5HdblF0iM67aImukYXVNH5s8NBN2Cj5LjVMpGhmKWpnFetgOGcEUMk0rbMtIcYgqUSbqo6xICXpH2A3jb+mtNeoa7PbTIJ9LwRxa/tkidf6h4RMOZmlOvF32Gl+Hc0F0SJ3rcHvSVDFLb4U92qBhoQRajNqeKvTChPYtV07MmTeWY0Inih8dGS7eIRsWiZmahuJnRdtA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(3023799007)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N251RDhGaU1JNEwvQSsyL0RRQjRBQ0pWUHEyeHRyeXJzNkF4ZmVjT1g1Q29z?=
 =?utf-8?B?dFp4cXp0c2FlaTVMZEM0MEtiaFh4M2s0bFkyRWNSZ3hFMFYzRDIzK3NYQzFu?=
 =?utf-8?B?Z1VhSk1jYkJYQUlIQmZCVGNad1hkeXBSdkVkb2dLbFZjbnVMcWI1Wlp3T0t0?=
 =?utf-8?B?RzBlVzBoamhJYmpONnRiY2pDM2lFOGxSU0ZvYVpiVFRXcVhlVDdJOW9lSjc2?=
 =?utf-8?B?cHlHN2tiV3lxcEV1aVZYS0o5NVJBUm9EYXVBZHU0RVlBZzJkVldON01sU0dM?=
 =?utf-8?B?MmJHcmtMMmNzWmEzNHBVVGEvN3hDaGhZcnA0RlBjU2U0N2cvV0c1S1JlRmNl?=
 =?utf-8?B?Ty9VMjJ6Zm5VbVRtNlJ3bHJQYWIyc0xieWdkVXk3cEROVUNlYnZPOFdqaDdC?=
 =?utf-8?B?eFZvWkRWQkxSK0N5RkkyNzFMZUNKRktqOWQ1R2c2ckJWTVN0ait4WDhpdEd3?=
 =?utf-8?B?SlM4OElCalRUUUpjWmZzb0VNMXJHUEVieUxLcUd2YlB2YTRVNDRJcEZkcTZ1?=
 =?utf-8?B?SXN2NzhVY0JrME5zTWVuS2dIUGZ5Y3VhemxPTHRZaXBtSE41dnVHaWg2WURo?=
 =?utf-8?B?OEJKbmFHUlJFbkEwelg3Y1o2aHA0OFdrTjNEaEFoWkllcWEzYmtjM1VySFNT?=
 =?utf-8?B?YUpqKzY4S3BmM1plclRCdFo0ODNjR3BFZncwbW0rQXBVVDFCQ0g4ODFmVHBM?=
 =?utf-8?B?VXladXVrTHlyT29YRlRSWmEwZG9FQytwb2cvNTljcUYxTk91OTJjMWVweEhK?=
 =?utf-8?B?RFgxNEJ2NGJLNlhTOTZsOFNmZVdIVC9QZjRXbEp4ZUFxUHlNUHIxWkNuaFZ1?=
 =?utf-8?B?TzQrcHRIdjUzVmR1d2VUOWd1Z2FxWGRPT0lRSEloN3U2ZnNIbWJ4aGRjajlo?=
 =?utf-8?B?eUNISG1zWkZnT25PQ3prRDlTT1lHMW5YT1hSMDVDZmU2ZDVWOEppK3g5RGYv?=
 =?utf-8?B?c05TbURadHFJQXBLU0VLWGtlbjRSdDUzbjVoWnNobzR2aFVzaFpuRk5KZ09m?=
 =?utf-8?B?b2xsRWl1K2VFajhpRHBiRG50T2VHenZ3emVvYnZCdm8rd3NIc3dCU2RmRzhz?=
 =?utf-8?B?bjRqam1RNGpGTWNDVEZhRGtvbnpnMmhaVy92OTV6UFczczZNN05sYk9OajBw?=
 =?utf-8?B?QzUzQ3hCanA3K2d2ZDhYUFkyWElUWXFkdEdLVDRFdGNXQ0w3MllNNWkyWkdL?=
 =?utf-8?B?R3pSQVlHZXNSOUdac0tZUE9TRXA1ek13N0tpRElrTFFBMlB1YWNJdjRXUm1S?=
 =?utf-8?B?ejlpbmJtbWNnUVRvZHFaWWxhalU1ajRmbG81QndtWUdDYjBkKy8zUVorU0l2?=
 =?utf-8?B?WCtBNmRSdXVZaktIcEhFeXh0Y3l0TlBlMlFVdmdQcWxsc3ZFRzNCUkJ0NDFI?=
 =?utf-8?B?Q2RGcTBoWlE5NVVZSmdNRjVwRmk4SHhQNXVoblJjTjhrUG5rQWt5NVJxa0s4?=
 =?utf-8?B?WkRUZTkxd2hJTjduSnBZajl0b295cFJvb0tKNWw4WmNuNFYrU3RxeThKaUhQ?=
 =?utf-8?B?THVCTkNGMW42TmJjWk91WWlsV3JFajdMQXhIb1Y3RzBqMHFhTnNycitGQUho?=
 =?utf-8?B?N1hHdzJzSUs2Qi9VNG1PWmNaWlhpZFJ3LzRTZzdWdmVrTnI4VnNQdW5SNnpE?=
 =?utf-8?B?V0ErNjV2UzJhWkI3andYejJuQlJqYWR4Um45Qlh6WXFGVmVvbXU2djBMTGdw?=
 =?utf-8?B?Nk9pTHZVUjIrWmg5MnN1M1dmdXNTOFdVMlZ4V09DOGpuQlJtVE9LTmFwYnhZ?=
 =?utf-8?B?SHhlWW1QcTJrbXRZZzA2Rk1MRDQ1K3l2RXV3WFJGZmh2WkRWcCtQUWE1Qmt4?=
 =?utf-8?B?TkFFMTk2WGtLSldXZU1qeFd5K1dBY1R0THRrL2JWRHI3ckVZQ205b2FWN0x1?=
 =?utf-8?B?V3Vrak1WMlNxV1JmdGtrZ05RSWR6Zmg1YXMvc2p3MzZzd2EvME1OMGNhckRv?=
 =?utf-8?B?TXNtZ3Q4ak16d2ZhUG15S1RqaUhDK0hXaTNSdFh0WXdJbEdUQmxQRDU2Vnpi?=
 =?utf-8?B?UWN4OE5IUVpIb1FBSS9oNG8xM2owNGNsY0VoRkpGN1pLUWJsVFhRTEdJSzh0?=
 =?utf-8?B?RmgxMk5JYWMwZlhZSUQzdmFXOVZyeExwbzUwS1BtejAycjZYaFB5dDdkbUZP?=
 =?utf-8?B?bHBPNnA2NmdMenVUUm9MdmdtNDhEcjRlR3ZaRDlPY2hQUXR6S2MzSDBaTmJx?=
 =?utf-8?B?RkYrOWxaZFBoL3MrdXIvZ2hwZEJSK2VUeHZFSTFRbnRtSmFJczlUUXJmY21E?=
 =?utf-8?B?eXFGL2gzTGdMMnpvWEM2MEYvY1h2QnkrNnpCcy9qQkNGMDA3cG1WRjVlK2t5?=
 =?utf-8?B?YWErUWZia3UwL2R1aWk2bGYzOENidEloYUI2dXBvTmE4L3VUblJwQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aacca730-d392-4aa0-af50-08dee0bbc9ff
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 08:50:28.7261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwUGhFJj1UutQFJ+SQyLdCU+IvxePYgeopF/NZU1Y1gicHRigjWcm6yjmuIgu+yc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_015036_546713_E13AB2CC 
X-CRM114-Status: GOOD (  31.34  )
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



On 7/7/26 10:32, Michal Simek wrote:
> The latest EDK version was 14.7 released in 2013 that's why remove
> description for it. Also remove generic description for Ethernet which
> doesn't bring any value.
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
> Changes in v2:
> - Update description for additional bindings - reported by Sashiko
> 
>   Documentation/devicetree/bindings/xilinx.txt | 98 +-------------------
>   1 file changed, 1 insertion(+), 97 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/xilinx.txt b/Documentation/devicetree/bindings/xilinx.txt
> index 0ee9de99b3ae..a1a2cde7b7d8 100644
> --- a/Documentation/devicetree/bindings/xilinx.txt
> +++ b/Documentation/devicetree/bindings/xilinx.txt
> @@ -1,93 +1,4 @@
> -   d) Xilinx IP cores
> -
> -   The Xilinx EDK toolchain ships with a set of IP cores (devices) for use
> -   in Xilinx Spartan and Virtex FPGAs.  The devices cover the whole range
> -   of standard device types (network, serial, etc.) and miscellaneous
> -   devices (gpio, LCD, spi, etc).  Also, since these devices are
> -   implemented within the fpga fabric every instance of the device can be
> -   synthesised with different options that change the behaviour.
> -
> -   Each IP-core has a set of parameters which the FPGA designer can use to
> -   control how the core is synthesized.  Historically, the EDK tool would
> -   extract the device parameters relevant to device drivers and copy them
> -   into an 'xparameters.h' in the form of #define symbols.  This tells the
> -   device drivers how the IP cores are configured, but it requires the kernel
> -   to be recompiled every time the FPGA bitstream is resynthesized.
> -
> -   The new approach is to export the parameters into the device tree and
> -   generate a new device tree each time the FPGA bitstream changes.  The
> -   parameters which used to be exported as #defines will now become
> -   properties of the device node.  In general, device nodes for IP-cores
> -   will take the following form:
> -
> -	(name): (generic-name)@(base-address) {
> -		compatible = "xlnx,(ip-core-name)-(HW_VER)"
> -			     [, (list of compatible devices), ...];
> -		reg = <(baseaddr) (size)>;
> -		interrupt-parent = <&interrupt-controller-phandle>;
> -		interrupts = < ... >;
> -		xlnx,(parameter1) = "(string-value)";
> -		xlnx,(parameter2) = <(int-value)>;
> -	};
> -
> -	(generic-name):   an open firmware-style name that describes the
> -			generic class of device.  Preferably, this is one word, such
> -			as 'serial' or 'ethernet'.
> -	(ip-core-name):	the name of the ip block (given after the BEGIN
> -			directive in system.mhs).  Should be in lowercase
> -			and all underscores '_' converted to dashes '-'.
> -	(name):		is derived from the "PARAMETER INSTANCE" value.
> -	(parameter#):	C_* parameters from system.mhs.  The C_ prefix is
> -			dropped from the parameter name, the name is converted
> -			to lowercase and all underscore '_' characters are
> -			converted to dashes '-'.
> -	(baseaddr):	the baseaddr parameter value (often named C_BASEADDR).
> -	(HW_VER):	from the HW_VER parameter.
> -	(size):		the address range size (often C_HIGHADDR - C_BASEADDR + 1).
> -
> -   Typically, the compatible list will include the exact IP core version
> -   followed by an older IP core version which implements the same
> -   interface or any other device with the same interface.
> -
> -   'reg' and 'interrupts' are all optional properties.
> -
> -   For example, the following block from system.mhs:
> -
> -	BEGIN opb_uartlite
> -		PARAMETER INSTANCE = opb_uartlite_0
> -		PARAMETER HW_VER = 1.00.b
> -		PARAMETER C_BAUDRATE = 115200
> -		PARAMETER C_DATA_BITS = 8
> -		PARAMETER C_ODD_PARITY = 0
> -		PARAMETER C_USE_PARITY = 0
> -		PARAMETER C_CLK_FREQ = 50000000
> -		PARAMETER C_BASEADDR = 0xEC100000
> -		PARAMETER C_HIGHADDR = 0xEC10FFFF
> -		BUS_INTERFACE SOPB = opb_7
> -		PORT OPB_Clk = CLK_50MHz
> -		PORT Interrupt = opb_uartlite_0_Interrupt
> -		PORT RX = opb_uartlite_0_RX
> -		PORT TX = opb_uartlite_0_TX
> -		PORT OPB_Rst = sys_bus_reset_0
> -	END
> -
> -   becomes the following device tree node:
> -
> -	opb_uartlite_0: serial@ec100000 {
> -		device_type = "serial";
> -		compatible = "xlnx,opb-uartlite-1.00.b";
> -		reg = <ec100000 10000>;
> -		interrupt-parent = <&opb_intc_0>;
> -		interrupts = <1 0>; // got this from the opb_intc parameters
> -		current-speed = <d#115200>;	// standard serial device prop
> -		clock-frequency = <d#50000000>;	// standard serial device prop
> -		xlnx,data-bits = <8>;
> -		xlnx,odd-parity = <0>;
> -		xlnx,use-parity = <0>;
> -	};
> -
> -   That covers the general approach to binding xilinx IP cores into the
> -   device tree.  The following are bindings for specific devices:
> +   Bindings for specific devices:
>   
>         i) Xilinx ML300 Framebuffer
>   
> @@ -102,13 +13,6 @@
>                                              Default is <d#1024 d#480>.
>          - rotate-display (empty) : rotate display 180 degrees.
>   
> -      iii) Xilinx EMAC and Xilinx TEMAC
> -
> -      Xilinx Ethernet devices.  In addition to general xilinx properties
> -      listed above, nodes for these devices should include a phy-handle
> -      property, and may include other common network device properties
> -      like local-mac-address.
> -
>         v) Xilinx hwicap
>   
>   		Xilinx hwicap devices provide access to the configuration logic
> ---
> base-commit: f608bce703fc31a2cdf67abe1de882d5bbc45142
> branch: zynqmp/dt
> 

Applied.
M

