Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DC2C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thMVPdzuEPVipOGQA8SSMgXkgtmVdOaYEwI25JXhWLY=; b=RTDnLZ2WQIA0JNCrAXysonZhZO
	bf3ytKMB3q1TwdI8VELj/6BWYgdOHjyWVPDr3zo4ZhlJwNztngE+hOszFPCJy5t7EB0vpXe7ooq2T
	WhVdF4EAZnFmHWFZGfGVGNYlNPwjH45JpjdVuQCrovcr+fuWUfi/DLOnPKXivviIEw6+3ZqMfvPnl
	CR0agK4F28YQuFc9NZ/tr2LckOOfGNljthZyPczlaubWnMz6n4yEoW/j9Ea7jJEcc47QrVTdHT33+
	x1dd5I5DnzXuDvi8UtLv2FQsS6gYc2K2a7JkAFfWQEwZv7bklPSA2YWxBAR2fPfhpCPumJoNskz8r
	9BsB/Vrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUz0-0000000BdLZ-0yBL;
	Wed, 22 Jul 2026 11:19:26 +0000
Received: from mail-eastus2azon11011057.outbound.protection.outlook.com ([52.101.57.57] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmUyw-0000000BdKv-43yQ;
	Wed, 22 Jul 2026 11:19:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqCtX0v8WaDywl4EEMRAL9IyJOP/fof8LEIVJ/Nj/A2YPilvATUHrZsqC3KOIOjOO999WjMAtQIOjs8lx4ci1+qHaC3LCl5Opo/2UULvRNphvdy8qrXDOFvg0a7bBZu/3lauebZEvbfpyEz4OtTK8Yr1zKEwD+B0Ye1wiolUP9JW5eQbfmxqdVF6Kf5pOXnfmWhhoiUhaGKswxP2FGTvdeKBbp/wToJrOtO4MiaIlKLPCDo75rDS7WuNf0Jkr6XMUChPSSMpv20AESReOKYfs8eZtvMAZJghlk1AuWZETI0d4AZjITAUU8NkQRmoY7oa3HCW2hVOH/+117SB2UfLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thMVPdzuEPVipOGQA8SSMgXkgtmVdOaYEwI25JXhWLY=;
 b=lTX9D9HsAd/tuSgsXLEJEUk1FWJnQ61h8QRmst4Qg4wq6R56dmpivyBJep8OjGmSZKgT+JZBaX+CTSIq5CZS1ewIK3JQqyxQphnD3cOGRQNtRvZ9h/56YdYMZqVs4782Aqlqe2gMDKitQD5rmy7aX2ynEj35airIGmmj/zpG6u7H47zpowS3euC3u4KONBzGHIfJ6LaEPZcEhvwZq/7TkKSyGC8vRPXOTlC5w7DgoYDUm0V2yzz6AG/Nq0yrcH01FYpk5tH/TlDB9a7QCePFF4yVJgtwPvau9kltRgiYtNNrAdEu316esE9gBQV2w5Z3KGF2X0znPJHODkx7nBc7/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thMVPdzuEPVipOGQA8SSMgXkgtmVdOaYEwI25JXhWLY=;
 b=Ql8t/hDnSmVlgFhZcbthLxcfaFL+xrB87jKMaCCBUDRt6XdTCSUMhB1dQcOBaVXqkpZHdeGAPbrsBr0SJFvw/1aBOnKcr3/EanXe+4UyJ7d0GvKhQotm0S8ghFPFwVacTPNb04ct+gcVM/dDPhTAKN/Hm8tqXLzuRge2Xw3VC2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CYXPR12MB9280.namprd12.prod.outlook.com (2603:10b6:930:e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 11:19:18 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 11:19:18 +0000
Message-ID: <4f24a842-0fd3-44c8-9730-f9703bd89414@amd.com>
Date: Wed, 22 Jul 2026 13:19:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 0/3] phy: zynqmp: fix SERDES scrambler register
 handling and enable for USB
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 tomi.valkeinen@ideasonboard.com, vkoul@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260627155229.2791113-1-radhey.shyam.pandey@amd.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260627155229.2791113-1-radhey.shyam.pandey@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:332::26) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CYXPR12MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: f40deea6-e826-48b8-5044-08dee7e31208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: SDWwCO4SyXLEfuZpdE/4lEHrzNJEVECSh136vvgibzQPVXhfKX1QZBxRwlUWCY+tPXRXMOIeBJRxP2V16LvdrDNfuvseojzI9ZNwbhFYxo/UYvJ4o+IoQTCoRhKS0dz66ByHXF4NQPAgFICZ09XvLQcKAqS6yk6UiNJAWpItH/bhRJMZ/Y1fA2IDQ8b5AqAwqF7XkP0uOauqyF7tsA6/FJsxNdeq420goRr3yZtxqBxKDh+njqxalyfz+IVp2sXZIuJoZA7Sd8FVaZD9mdlxTNFBO8qLmvmxfWSeZOU9wRNbQh7xWLE/rL+hU9bsR/n7Zuyy/HXBi4WN+iQKH6ZmJOEwNrkF+TFq6SM1xfEKzjZ9mayRWntEe4P5p7kn2HC7lxuwJqjOaUGY7LQElQ7LbCpAhIaIy3Aay8cepBggVN5WjF2GoTbI7tIw3eBEIYj0nt7d+NEzOKDAaEIbRFoK+Ww7L/XpAfkSoxwwthNOwRevL6x1+1Ihjou0L6jT6L+kBFfl+3f/wcs4xjR7I9WTwffA8vXXMwD4yKFqDfTFMEg2z4o/QAOMTcNeALm1/dAaMjzsR9q2d+36gwrGIKdU9m9xHxZBalPN/xBJFhcWsxlFzIZwJ4gbsjjtnB8A1uH1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elA4YVVHbEpQdnp0Uko4T1oyUkNBcElGKy9aL2pPQklrcG1hTDFkZWpBMWo1?=
 =?utf-8?B?bVN2NWxOZ2JmVE8zWEg1d2hHbmtwV3NJczBWd01KRExWVi9JV2h2UklIdSt2?=
 =?utf-8?B?VGVPT3JRYXdRcTI1ck83RUJJL281eExySG9kbmVIZGd2SXhEdkY2d0JDbitC?=
 =?utf-8?B?alR6Q2dBalZBalJGdWxJaWhzM1dXVnRzV0ZIZ2o3d2s5UGNvRFZGVDJDOEpM?=
 =?utf-8?B?U3VYdEJEdW82blNYVFFsYnFSaktuZFVmRS9IQ0dVdi96Vk5JRkJRd1FFcDZ6?=
 =?utf-8?B?L0tTRThaaWFFQ0FvYmh5WVdRMGk2MUpIcXdkUlh4RlpQTGZ2dERFemI0b2ht?=
 =?utf-8?B?LzZwbG5nbHdNY2dJa3dxSGNKZW1KSWplckZFSi82WHhjUkR6c1JJSmQ4UWJm?=
 =?utf-8?B?WEY3K1FSeWdiWHBTbnBZN3ZwTGwxeWw1bXhpaWY3Yld4ZFpPV0RwSERGZ3hp?=
 =?utf-8?B?R0NPQ2lsdGJRckZOenpGWW0xNlpqVmplZHc3d1ppUjFBWWMrc2NaaFlyZVVr?=
 =?utf-8?B?dDJtWmJPTnVkNW0yR2xXZy9rTzVwMmdQeElGRE0xSmtNOFoyQ1BGY3lzTFlX?=
 =?utf-8?B?YjhLa1Y3aE5KTW1EblFTaEhZQ2ROeVNocmJ5dTRyc1NQQ3o4eFFNczVZMlBX?=
 =?utf-8?B?Y01MYlN4cUY5YVc4OEJkNWpoTzB2RnZmOTMxU1U1R2FnOHdidW9SRHJoT2xa?=
 =?utf-8?B?S05UQkdQK2RpNmg5TTd2WlR3bUNDTjVodWkyUXpDcDg0NjJZQ3RwdzV2cmQ4?=
 =?utf-8?B?MXJmOWpuNlJCNUl4U1gyN2EzeVRWckVycXM5TGN4RG1oMXdlQldzQ0Rhd2Y1?=
 =?utf-8?B?T2JXakNzWjlxZE9MZlFCWlF3bGhCVjhvZncyaU92eXdIbENmQXhQSDZBa3R5?=
 =?utf-8?B?YVZRNWgyOUVnR2pabXNFZDIrVS9lUHdObDRrNDR1RGllSjlETUdjaHk0Tkc1?=
 =?utf-8?B?dVJrejEwV0dVMVo5Qk05dWt0Q3ljaEFweXdGTXBwcUFGaXMvZ1JyKzN1QW5y?=
 =?utf-8?B?NDExdVdhaWNmb1pLNUJ5b0o0ditVUWFEMXNFYktwNzVLYzhZL2paa0Qzd2Q1?=
 =?utf-8?B?TjdXMlNlaE1sMng3cFVHNEtHaE1ycDdEL2h5OXYrMlFGcUpBSVhnaVpIdm5Z?=
 =?utf-8?B?cGRZb000OW9RRUVUUEo2b3VUaFYrZHAvbS93Rjc2Y0srbkxDME4rOWZzZDMr?=
 =?utf-8?B?d2tRTlZqNWIwUmFYa21iYnowK24ydTQrWmRVa1BrN1Z5Z3g3UDhOeUxEY2Nx?=
 =?utf-8?B?UUg3MlphKzBqTWdYdXdFd0JJQlF1Mi9EeTVMQ0IyNGxtYjBnYlc3K2dpUVBE?=
 =?utf-8?B?UE8wTHhnK3gvM1RkUGFabVlZaUx4V2dxOUhrRzFKZndGcC9CZytERGRXTHBD?=
 =?utf-8?B?NitneGNWY3RaTTVoRyttekFmLzNDbW10MzBPU2VaWnQ3NzFCYkp2bEFWaGZK?=
 =?utf-8?B?VjdMcHJXYU5SZTAwdjF3RUlUN2NyWjB1K0VNZWE0Mzd4dEorYmJFRXZ2QlQ1?=
 =?utf-8?B?dkdPL3pXejY3UmkyeUVHOTEzYk5FOVg0VnhiRkUreEhqRTV1blJJdFJjRVV4?=
 =?utf-8?B?UVhOc3dEVkJHUk1mMnlIL2xIelA0SnFxeUxwNmV2czkyYk02Q2ptTUtHY043?=
 =?utf-8?B?M2pYMis4R1hoY3REWm4vZUJxZVBRYThJNDNGQ1pOOWFBTXd2SGwvejFKL0lC?=
 =?utf-8?B?VnlWeDNWczI1VGtkZGpjUVR2LzBZeFc5bU9tazR2alVUL1psdmczbUdzNnFj?=
 =?utf-8?B?bEVHbjBNRUNHb3VSMHFuc2M0VjYyM0lOTkpzWTh6aXR1amJOUFVkbnRPSmps?=
 =?utf-8?B?V1NhS1A3ZjBBaWF1WXN2YkZCU1RTYzlueXMrdFNYbnVuckZVbUtXZTFDVHBH?=
 =?utf-8?B?eEVSVFcxOTZTZlNEMGNpQnE5QXFsQ3JPVWVFNExqK1Rodk5rYmJCODFvdndS?=
 =?utf-8?B?ejVrRDZRSTNXTlFreE4yazd3dElTNDVCWTdQbThYQ0dya1BWc2NMaVU1UmZj?=
 =?utf-8?B?TCtDRjlWWUh4alA1UEZoTFo2ZnVKTXdBZkI1YmJsM1RiOGwreEVEWk9CV1Bk?=
 =?utf-8?B?dG5KUXJsK3FsSnlDOG9lc1MwRlBWR3dZV2VDQ1lkckU0WXUvZ1JZVjlKR1Rh?=
 =?utf-8?B?cEpnR1A1MGgvZWJaNm1YZ3cycWo1N3FoVVhUMldOQVVwVzF3VGVEakowOWh1?=
 =?utf-8?B?UHJyc2dydGErM0JWd0wzb3MwL3d0cHB4elExUzlodjAva0swdm5tMkxHY0px?=
 =?utf-8?B?WW1yVTZSbHVRSS80ZUhncmpaakpsbU9OeEFhd0lNdmtXNXBHNGczdCtPcm5J?=
 =?utf-8?B?Qzk4bGoyWnVMKzAyQXA0TGVuVTJKcG44ZUo1R3kxdWZFdUZrYy9xdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f40deea6-e826-48b8-5044-08dee7e31208
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 11:19:18.0445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zxlLzEanjGXRH+LNpGgxmLo/JGqCQZcUp9B3RBozJj1zZUb+XhdeIndsNEnxU9g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9280
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_041923_015788_B75DDC0F 
X-CRM114-Status: GOOD (  13.02  )
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



On 6/27/26 17:52, Radhey Shyam Pandey wrote:
> This series fixes three related issues in the ZynqMP SERDES PHY
> scrambler/encoder bypass path:
> 
> 1. The L0_TM_DISABLE_SCRAMBLE_ENCODER mask incorrectly included bit 2
>     of L0_TX_DIG_61, which is a reserved read-only field. Correct the
>     mask to (BIT(3) | GENMASK(1, 0)).
> 
> 2. xpsgtr_bypass_scrambler_8b10b() used xpsgtr_write_phy() which
>     performs a full register write, clobbering unrelated bits. Switch
>     to xpsgtr_clr_set_phy() with clr=mask, set=mask to preserve other
>     register fields.
> 
> 3. USB Gen1 requires PHY-side scrambling and 8b/10b encoding as
>     mandated by the USB 3.x specification. The driver was incorrectly
>     bypassing these for USB, the same as SATA and SGMII where encoding
>     is handled in the controller.
> 
> Issues reported by sashiko[1] are pre-existing issues and will
> taken as separate followup series.
> 
> [1]:
> https://lore.kernel.org/all/20260512213513.852EEC2BCB0@smtp.kernel.org
> https://lore.kernel.org/all/20260512223142.1AFC4C2BCB0@smtp.kernel.org
> 
> Nava kishore Manne (3):
>    phy: zynqmp: fix L0_TM_DISABLE_SCRAMBLE_ENCODER mask
>    phy: zynqmp: use read-modify-write for SERDES scrambler bypass
>    phy: zynqmp: keep SERDES scrambler and 8b/10b enabled for USB
> 
>   drivers/phy/xilinx/phy-zynqmp.c | 37 ++++++++++++++++++++++++++-------
>   1 file changed, 30 insertions(+), 7 deletions(-)
> 
> 
> base-commit: 3d5670d672ae08b8c534b7beed6f57c8b44e7b43

Acked-by: Michal Simek <michal.simek@amd.com>

Vinod: Can you please pick it up?

Thanks,
Michal

