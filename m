Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED3FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 01:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4ibtfOvsZAclWethUZi6XQYVYKnbQ1yMnwAVET4wkA=; b=BxCWwb4adM/V9nf+arnufExOKm
	hYoK0bP4p8UhImaGcs0zn7T439aXGjnJ/m4ydzQokZFKhjKvEAC6OZZkEIblGacZgGiZNrN0AP1ZX
	OMk5cBZMbYeUlvwvJS3BVUd/smRLZTWUcQe5o1FI6qR+2T3ognQAEoXoiHEECf9rL9bt4cQLHdWr8
	3RyafEvdfodxwGnULUSCRyWNolIQGUvz7pTRq5oU5HATUSz7tURhxos3Qezbd/H0ALFW739rdcZh0
	6t7NZc6Ens+N8TeYST6KDRRY0WrWbUKz3tzDU7ZEB38DAIyE314aI4hqhD8flAJgPMo47nQNJg395
	xxi99DLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thf46-000000026lF-0Isi;
	Tue, 11 Feb 2025 01:27:54 +0000
Received: from mail-southindiaazolkn19011032.outbound.protection.outlook.com ([52.103.67.32] helo=MA0PR01CU012.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thf2f-000000026Uo-3fQi;
	Tue, 11 Feb 2025 01:26:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rb2sU+OhUxmGELK+l4kQkmIsoH/Ikxgno3Lv4gszQ5GcxV6dXfIpvk/SquCrT9QfIrhnEcviD4ZfoejNYV0xQD8H6SY4Km4Ue5Z3IeBI/WypCjzTFnH8GZm2qZXiwR7sb6wFJJXKh1xGc5ZYV9S6onby1Yk6EmKkzzcPGfHdBd765tQo/a9pqrry4kXqZxf3t2zccxWb7+uggOC4XBvuqieJLDpL0VTq19OeSlWyYgHKsyCXyN4yjdcFl+VAn6JqlhiY8UlZX6lJoONk75iT8POg9PCds6NKww5+4VqmwTlBiqRQjige9P0yXworc3TSCjAXw/wTEjydje6rbM0hNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4ibtfOvsZAclWethUZi6XQYVYKnbQ1yMnwAVET4wkA=;
 b=MVzA2x4aps5VUR52STp+yNzVmjBBYsipqnhXw0CzENl9d8Z1HwUfpgAW4Sv14NcD+XFlzPpfiEseecGxTPkGY2wsLjmPzkMzBAQjymBpRl3ruG/mOxF9C5yWwfIRnWAaWRvm/dk4wpwL0ir6yu3U7IfE71/H8fnGKYhYjsSbxulVRtUSVqZgmfxPQfJvKcGUyzN6Nb7upw/TbwcmXNy/U4CE6NsbdEF1k8JX0krEXwgHssp2u7I3APc/zwM5BX/vHMSSHB1XJp3SG3dCJF1XhYWBz8dRUsbL+QsgiZhAAmbGsKI2GxbkcwgpuTcllopT1Msq6lKEdIEkGn3L2DLuGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4ibtfOvsZAclWethUZi6XQYVYKnbQ1yMnwAVET4wkA=;
 b=dprPBSm4O9pYn9m/bk4/wOVpYeuj8dAcjLkb83z6WgEkMBIvnD0hGo/+9r859kTsDL3Q+cRyEgfMOvIo41W+i4nvKgmjN34q68U3gyGTDyellnrbtBQole9fjvObyGCxko785EzBHdrJiSXgpgfP7CpiaoyoV5Ly6fqy0ZoKld/g1mwpoJN0G3oTUlVk0s1GwLcRbE+uRlupRNNkCTjNDvQC2ho7AclBZh5/5qgildz2ZJIGenZlpTu/YPOHdaNrsY4KzCUdirhiaET/urazMAeJ1OvEeGEU5WXfVceez3UXTGXZTM5GXnKGXQX4Yj4vwnX+mvrH1DepG7c6n4aunA==
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3a::19)
 by PN2PR01MB4124.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 01:25:59 +0000
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71]) by BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71%7]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 01:25:59 +0000
Message-ID: <BMXPR01MB24408EA7681BDFB9E8D50079FEFD2@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Date: Tue, 11 Feb 2025 09:25:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: Add SOPHGO SOC family Kconfig support
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org,
 Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Lee Jones <lee@kernel.org>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
 <20250210220951.1248533-7-alexander.sverdlin@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250210220951.1248533-7-alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:195::13) To BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:3a::19)
X-Microsoft-Original-Message-ID: <ec5668f8-0a7a-4573-9c68-fedcc3f6aad9@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BMXPR01MB2440:EE_|PN2PR01MB4124:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a165e2-977c-4a04-ed53-08dd4a3b08f5
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799006|19110799003|461199028|7092599003|5072599009|6090799003|8060799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3NReEhLb2ZVOVE5eVpSM2hrNmdaUjgwenRscnJ1cnRQaW5jNzBqclhOLzJ4?=
 =?utf-8?B?ZmxncGs0VEc5SnYwb2JRQ09XNGVRYmJ4STRKR2lmYXJGalNCcWhvOTVNTmsz?=
 =?utf-8?B?QU5pR1lSaURpV01GME1YWjlvcHJOaWRMaFVXdldjdDZlbGlvcUkwRnRpcGV1?=
 =?utf-8?B?ajZla2J5cnZZaDBWSmlEaGtFZStGUzZ6Z0lObmI5MHNzeGpmWUI5aEJYOHZt?=
 =?utf-8?B?WkMrdzZyM0VtTEVHSCs3eCtBUHQ1WnpsWTRwSXZJdWZYbjZLWTZrOFNGc1No?=
 =?utf-8?B?TWpaVGk5KzhCOXJzOE90S1dCcVVuRzZzc3BnWGUxY0UzUDBZejFQTUd2eld1?=
 =?utf-8?B?bU0weE9peDFabG8zZGVmbzJRNFpPQWdXRFp2cUNnMGs1T1NvUzZVMUZKRVZu?=
 =?utf-8?B?S3hKUGtxbkhEdGYrOFlBNU56czFocllCVHB1ejQrcURjSURNaGNhQnpWVmFs?=
 =?utf-8?B?MU9rNTRXUUdiZUtGODZtYjg2WnNmb0xld0F4bTZaQ0pZWXhndlpmRDRBcVBW?=
 =?utf-8?B?RGFBZUYwMTQ4bU53b3ZhUDM3NDNXbWRZS3Zkc1FZYmRYK2VzbkwrNWdobXJ2?=
 =?utf-8?B?Q3E4U3FmeGdRRUZKVWFGYktDSmNPUlVWNzNUdndtdjh3Y1lFTnQwWWx2M1VK?=
 =?utf-8?B?RlVwWm0wOW9wS0QycFBlc2JmUVhLTU5kMWhsZFF4Sk03UkZaYUJsY1lKRUdw?=
 =?utf-8?B?YkdOelA2YXZ6ZTNacVlqSFl0WmpHQUNzV0MrZ3JjSEFPdEYxRlJRd3RrZ25I?=
 =?utf-8?B?cEJsa3pZdGh2L1JnZk5DbVllb2YvVmdPelptSlZTKzZTdUZ6VnNremFJK09r?=
 =?utf-8?B?MlhhaWpGZ0hGeDRlaVJQR252K3pCVnp0TXl4c09LZitpNHIrclRiSS9HV1c1?=
 =?utf-8?B?Yys0SHZ2TmhiaFNzNHVob2Q4VUdReHlXaE91dDgxZWwzeFZ0UDdLU0lQZHAr?=
 =?utf-8?B?RkNKVThkc1FNUnRnUjBkNnZLamxNaUpoWmFVTWJNTXFLWUVhTUxScVAybzNq?=
 =?utf-8?B?K2hjNEF6VnJFdlh3Z045ZkQwQnRzVHpyKy9PcjZuV084Zy9wNTlMcWdRdGxi?=
 =?utf-8?B?Y0hpUGJKb2kyREtydkN2eGZsaWFrT2IzekNzdGZvb3VrcUVaeUxObmJBMDJm?=
 =?utf-8?B?UmNOQVZlYmJKZ1lSeUhhV2pJd3F5Y2l6REptL25OYVFqMmNTYW8zd0l0bzF3?=
 =?utf-8?B?SG0xV0tJT1YyVGRrNkpnNVJmZGovc0d5RmJPU0E5U3laM2xUcUdSNWJwSEk5?=
 =?utf-8?B?RERoKzk5T3FxZFU5T2szNGhXU0psQXYvdFNSZTBSU05pcXZmSkxvaVF6cGtI?=
 =?utf-8?B?Z3JITWtGY1pGRnJ6TUYyQzZHck5UWkNVdHk0djFFQmppZEtKRDhwelM4Y3I3?=
 =?utf-8?B?L0VTY0NlOHJ3T1pHTFIwQThQSFJ5WkNPN2dmZlk2aS9yUHNWUUpaa2tYUm93?=
 =?utf-8?B?TmkyRjlnT0RrbUJQUmxQTG9NaEQzTTg1R0JiWTNGcE1jeWVJOU1mWGs3eUc0?=
 =?utf-8?Q?5TyrdA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEY4ZktvL0pOU0Q4TmhXNHBGL2h1TEdtTkZkR29oRDdFcFZZak9CQThDZ2Q3?=
 =?utf-8?B?N2tJUG84b2swcS81WW55ZmVqQVlqR2sxcTVVVFV3Vm11ajdBeWNidzZORVZm?=
 =?utf-8?B?QlVVWUhNNXAxTk9ic0ZYbmRGbXl6SXpIcExYTGExN01jWUtqbk44VzFVeURH?=
 =?utf-8?B?VERwMGtjOXhkRU51by9nMkhvVjVkZ3JjbWJLUG5WYk9OSm1NZzRGMnR5aWVi?=
 =?utf-8?B?K1lJeCtJanhDTTg2VDBQMkJ2bkZKdFo1ejVuNkFtNHpNQ2ViUGI1N0lmQjFz?=
 =?utf-8?B?MlV3U21Xbmdrc1dyUFF1NjlXcUdKSUFXY1ppR3VDbGhLa3MvL0hBZER1UkVR?=
 =?utf-8?B?V2JYbkN0SVJpT29lNlpFSnVkM09IWTlqbXQ5b3NhWnlUTm15Z3QycUd6ZnNx?=
 =?utf-8?B?T05mbjd4R1RZNytFS3V0RDU1SnNhQVQxL0J0Z3IwdTJzbytMTzFCaFpvczZS?=
 =?utf-8?B?K2NUUnhZN0pRS0xNNmxmTWtsd29BRm54bGxBdW9sc2EvUmhua28xbUc5TWNW?=
 =?utf-8?B?SGFEQXRKOGNUNGI0eVNEMHA2bFdPbFdEck9MZUVGb2ZXbE9WL0VBMmVCaFA5?=
 =?utf-8?B?SWFaVjlXQTVrcHVWRTNIN3c3QXd5QVJTMGR5YXptbE01ck9BNXVjZXBpNC9K?=
 =?utf-8?B?YjF2MjlRaGF5KzRtMVlwV1pvUDQrUWlmdW1JeGlENnZ4MXRKN21yUDhMYitG?=
 =?utf-8?B?dTE0VWtLZ3lnUjVQZXF6My81WEw2TlY0ZWlOejNYci9LUWJoVGFFa3hUWnhD?=
 =?utf-8?B?dzlqR1l0ais4UXY1N01KMTJGMXZrdHFNYmlVL0tadlhGQ3V6L1ZMb3BBcStK?=
 =?utf-8?B?UDdUWnVJQTdRejNDTXdmckYyYW8xKzZqcS9TdDVlNURHYnRxaVRqNXFCZW5Z?=
 =?utf-8?B?MURFdm5tVWRRcWxTaVVBckJQTUpEdjJtTjM3UXNXOFBhMnc1ajVOZ1NGNVE0?=
 =?utf-8?B?ZDc3VEdKQXVJdlU0eG0reERrU2d3RnA0SVJVYnJveGYyMTVQWUl6TUovc1dF?=
 =?utf-8?B?bG01eG5FMGYrZXdLYjFFYThCakt6eDlkajg2eis1MUo5Uy9uNUVqOHl2dTVn?=
 =?utf-8?B?MzArM2xZTGlYSXhiSmFLcFNSMEE0WSsrc083UVdGUU1aN1JpTDdIV2dsTThJ?=
 =?utf-8?B?cE5hZ1hyZXlXeFRkb28zRmdUdGxiUUJqUWhGcnNDUU9FZWozMURzTkU3K0Fr?=
 =?utf-8?B?MGtnTmJRMlUzcVd6cklCaVRTUk9NN20xdzVBMG1RSGpBMHFZWVhQQ2E0UlVl?=
 =?utf-8?B?QTd3TnRQd05wYnpHRE1YZUVZRHYyd0Y2NXJ1eGt4TVlwRnRlQWxCUkZMTllP?=
 =?utf-8?B?blI5cThvOXo1TXRVMTFYaFFHdHdCV1p1L29vVzhEWG05eVNXWUZlVXJrZVBu?=
 =?utf-8?B?dmZad0V2V3U3VVlrOGRCMzJFaTFjZVlkcUFVVmZIc0F6cnNpb2lnUUtjc05M?=
 =?utf-8?B?N21mbW1XQ0l5ZUxZZ1RQdi9JOStBRm5SOFR2V0lVZHZRV2UxK2taa1dVcmRR?=
 =?utf-8?B?cjBYcGJkNHN2WkZSZXlLSnRNUjVXTGZEY3YyRFZpc3k1V3pBOFpnYWhKbHNZ?=
 =?utf-8?B?ZWQzU2NZVWdWODZNOHMxc1E4ZXNOSEZEMkFHbUpIVWw0WEZGNUw1R2xONW5U?=
 =?utf-8?B?OTlOa0VVZFo3WFJMUi9uL29naCtUOUxVUlVvVzUrZTRaOFUyTHI0M09RaGtt?=
 =?utf-8?B?YWlpTFV6WFNJaW5qMDBxbUZjRDJCWWFoNHV5aFU2b3MrSTZyZVpkRTBzZVRu?=
 =?utf-8?Q?awA4zAPrfhC0OtPvWcL0jVY/BfVK65rEyVKom5G?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a165e2-977c-4a04-ed53-08dd4a3b08f5
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 01:25:57.3776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_172625_932250_1F203C99 
X-CRM114-Status: GOOD (  12.35  )
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


On 2025/2/11 6:09, Alexander Sverdlin wrote:
> First user will be Aarch64 core within SG2000 SoC.
>
> Cc: Chen Wang <unicorn_wang@outlook.com>
> Cc: Inochi Amaoto <inochiama@outlook.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>


> ---
> Changelog:
> v2:
> - shortened the help message (mirrored from RiscV ARCH now);
> - select ARCH_HAS_RESET_CONTROLLER instead of RESET_CONTROLLER;
> - moved CLK_SOPHGO_CV1800 selection into defconfig;
>
>   arch/arm64/Kconfig.platforms | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 02f9248f7c84..21b6a2bfb45a 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -307,6 +307,12 @@ config ARCH_INTEL_SOCFPGA
>   	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
>   	  Agilex and eASIC N5X.
>   
> +config ARCH_SOPHGO
> +	bool "Sophgo SoCs"
> +	select ARCH_HAS_RESET_CONTROLLER
> +	help
> +	  This enables support for Sophgo SoC platform hardware.
> +
>   config ARCH_STM32
>   	bool "STMicroelectronics STM32 SoC Family"
>   	select GPIOLIB

