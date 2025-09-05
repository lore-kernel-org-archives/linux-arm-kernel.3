Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CA5CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVYwjpkk7VyCs/iI618+bXC4RwqsGT+qSSBLktkm758=; b=SeIckep6WO9hr0UloLJEsc9U+l
	ESZsnLwt/QJkCPxvxm5YqfBy+0TLYHXxXY9roQRCpQsbCpdFMcBwl4WN6pW/Yj4hkUahcSjWeqAPh
	R6jv307x4hVh3IHhNni6UUu3YEHYCckxsuQyTCtVFXk/my405pea0ZXLkezRhF8uEtkxsflh9hP+i
	hEehTa7ZjYq5K3wEJN1DEjJtWXLDBIl3daG+YxmNVuGRTRN7EcTyhieXtx60stwtk2pWqaNUYVMi/
	5+6mUe8lywJ1uEcKsT1eToeuFP3EnywYxuIxidFJZuL6kcEZC9aBh7+1NZYya+y+EiKdxeTFE8wsN
	oGx0OPhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuW1k-00000001phK-0LM1;
	Fri, 05 Sep 2025 12:58:52 +0000
Received: from mail-co1nam11on20618.outbound.protection.outlook.com ([2a01:111:f403:2416::618] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuS8z-00000000UOs-2q9L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 08:50:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVwqJhnd7BKYu2MDfnzztVJMivcBqPOu3CBJAujpthgPyw2/OX31+btJnpC51kk3iVn/0lvF180QhIm6bvvDVD7k3wlb1TLggnD7deTW2l4uEL/eqy2+eekcNV6QPUvC9g4N4r4oKKvaZ9d2KDSfv5U6mPH4BcBwEJQc/SN/A/h7VhjByQTAP7Hv/Sv3cKE7ovsMzy3Ksao0ICNMPznfUIBpq3F3jdh1eTAKnWxeZ55paEqNnV84t//uOrWFTRs7blRmbGmliXLuCfUhCAWQGOOFdmQwK8n3bl7QthYvb+TG8whscVjaU10JeAoY7MzK5XvWGnrHtZ/9bSO07ZBivA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVYwjpkk7VyCs/iI618+bXC4RwqsGT+qSSBLktkm758=;
 b=Vvf01mLNZbIL59bcLbhGU1GV9fNSFZ/0KedIxyr1CjiSyu0J4Ya5KKvNR53MaNboU2Vzpg7N6Gl8C9CPD87sF2NGOsoEGi8mTjnvHfUuK6B0SYejSx/nvG+UjrHnpRyyt1nSTbWIM7jxl/En86jaVofCF3AaMgv2hFHwXQxnuwVM/iBbNGOUrmd3cpyrTKpfAOHXG1fKtIfVuuhXAkdYMr72i1sKKiwqB+NTnX/suUzQxB1F6sdF2fJjYFCu7EfRGKYqecqeyRFSlOX8B5OJL86cwKCyn3AYsyOlPlMqARCM/6KUa2h7BZLkww1s19UGkN2YEW6aYsBXvWPV8NwZOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVYwjpkk7VyCs/iI618+bXC4RwqsGT+qSSBLktkm758=;
 b=3yMiORiJtD+mvs5mFYRZfIE24qp8CzV0tyMRRUlA/raZX6EGXS0/0k8WGyh8uKn/GcRHp+cvGCIvMQm9/tMqExnq9SyJYAm/t+xDV2rhZJHNGyxnlzZiPTHilHLdiCUUu/ex/6OjurNsUe0NGNGX9QPOoWDSnBTVwmfW1LK/oeY=
Received: from MN0PR12MB5953.namprd12.prod.outlook.com (2603:10b6:208:37c::15)
 by CH2PR12MB9494.namprd12.prod.outlook.com (2603:10b6:610:27f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Fri, 5 Sep
 2025 08:50:00 +0000
Received: from MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::6798:13c6:d7ba:e01c]) by MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::6798:13c6:d7ba:e01c%6]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 08:50:00 +0000
From: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>, "vkoul@kernel.org"
	<vkoul@kernel.org>, "Simek, Michal" <michal.simek@amd.com>
CC: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] dmaengine: xilinx_dma: Fix uninitialized addr_width when
 "xlnx,addrwidth" property is missing
Thread-Topic: [PATCH] dmaengine: xilinx_dma: Fix uninitialized addr_width when
 "xlnx,addrwidth" property is missing
Thread-Index: AQHcHjET1tYIM1lSnk6JdPNQMRAdLrSER2Cg
Date: Fri, 5 Sep 2025 08:50:00 +0000
Message-ID: <MN0PR12MB5953092ADFCB9B5D7B1BE807B703A@MN0PR12MB5953.namprd12.prod.outlook.com>
References: <20250905064811.1887086-1-suraj.gupta2@amd.com>
In-Reply-To: <20250905064811.1887086-1-suraj.gupta2@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-09-05T08:48:41.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5953:EE_|CH2PR12MB9494:EE_
x-ms-office365-filtering-correlation-id: 6c7a9ff4-7c7b-45a8-e9d2-08ddec5932aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?2LlAhZitUmLKrqYe8eWer4ymXwIxjYvpCkowbFxKv8LzdmbybWHl/vOtn4A6?=
 =?us-ascii?Q?YpJxhlha5V8HWPz3NlQXvvS7KMcWBo3UKl0l/Dx5XBTLFBniLQZt1qZThCa4?=
 =?us-ascii?Q?0KW8MrbRnzbpxEezfhvEnmTi3W2WhQmGX2B+DA/NPWSWqbbWMcEzc9s70Koa?=
 =?us-ascii?Q?GFtCoqsVc00JRXUyLzcW0JKmFdkGZPiuENjWp6EXjisc9Lu4vizpvsnm2pKI?=
 =?us-ascii?Q?7de2P1E0xyT/Zd00BaXrc06P10edBUmfFgN+oFJ5LOsF7BWCQUzmjnOJCCVB?=
 =?us-ascii?Q?1Rx1Gx3ZZphlupNuKA3OyBgO+iBizj3iZZm5zE5YIs3/qG9mLwu89tmzVeYV?=
 =?us-ascii?Q?aTTjNNdqaXmGRRYntGRw99MmQzXx+Ph2c0uBF7TCZRCMwEX8PD7Zz4WiyGyw?=
 =?us-ascii?Q?HwhejjH5s8w69MjrcPktHez2s9m7T49yq722BaJ0fRgCUPbT/JF2sB9mWNUZ?=
 =?us-ascii?Q?owJSdCmgoNFn0LygGB3bvYuzZSO2IUcPP9Pff3vWRhelhFGNFcsfqo14ne2t?=
 =?us-ascii?Q?5NUk1Z3E43iiG6+qyKqjB+TkqqXeX2cof6rDqRIns1dhc5LioQd8BBS9Q13G?=
 =?us-ascii?Q?MyKW+78+DF2rzhJj5un8aupGciBwZOFttMypo0IjWDYv/wICnHa04avkiV2m?=
 =?us-ascii?Q?bprDS0wcTHgC8zns91o0YRJFgDpf+gUUmUlpoaAWqPxJTgBMiMZhAEwomP4o?=
 =?us-ascii?Q?m509IN1N3QHWmslPS0murlOsgK7nSc3iLyvjHMAehn5YdAt5LgtWHtr7h+vH?=
 =?us-ascii?Q?zW08j8RfKClJtAcC5PYkEzJm2upnGaNNH1LDhYLFzzE/2OsL8uZi7QZpfujH?=
 =?us-ascii?Q?Mm6txaN377rdkQXYlxfxFmk9kz/P9wjAEDSLoIEudy039ut/hHPLAl5Rm/s5?=
 =?us-ascii?Q?8/A2qFU3HoUDZimSLXeErv1pYashHmTYMk5ndDmiLJ7Nff4ytdOGd9SWqXcp?=
 =?us-ascii?Q?u8XvGleLJm0/+J5RGi8hKy4ENTfKdsI3Pvbmi5ZjKSej4/crj0HU66TFdJNL?=
 =?us-ascii?Q?FO4crOQVNdZeM1yPBSdoarrvEasIFcOtXttV2UMHbhMnIqOTpl/2kx4iRPKl?=
 =?us-ascii?Q?eb+fdmz2cJKrUbNpR8dYiU+lcfUdpMyOR+csxUVCq4YxVFGG98FsKmYNWMdq?=
 =?us-ascii?Q?Udk0k+yn9dTbtHj8qIJACcU6mcP3v7mi79lpb5oaXsjo7qgVwtcsTsoHkzi7?=
 =?us-ascii?Q?butB9kmyoVMhlxG+tBAPX8Cemz7j4Fl3empnIylXIUeemPvivC/rThmf27Mq?=
 =?us-ascii?Q?6o4BnbvM5BPay9HB5b6YXJXgWp2isB7W0Fkiy6Q2BVwKKQ7IlKn4/Mrhl2i6?=
 =?us-ascii?Q?MjKbPINT17YQA99Zij6RnI+W/aAOJquVH7irL7PMv0LgUxLLc5Vt+YPQzShO?=
 =?us-ascii?Q?LEPtAWIuu0lVozgT0bq3xSycS6ysn4UXfkDoh2bFglAPvaHy5Ls5ODLYuZBk?=
 =?us-ascii?Q?ki8Klp4ODNCXxkowsmkxv2UpBB8Xo9pYHtCdE7FiJi+S77Fi+YLzqZF9pvr9?=
 =?us-ascii?Q?VEaRG+ABxZFiQ+s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?u4EvxoFfbmRyBAxFcymIvqdfBWc1fpVc1wUdEifU53008ui6egKZXHUAsiUk?=
 =?us-ascii?Q?x6+b6TphzldyH+msIGcnZ4FOpOn1nabg+dHV/tRJa5FbAY5odRSgQOj1l/v9?=
 =?us-ascii?Q?aHyOH9xJ9mya64fcd5pDXjhEvXMFfLWzfM+bE7651yhVCcWtHYjB8J659rjz?=
 =?us-ascii?Q?Dk5eLgIOmhg+/uI20OcydDDdCO6ztV//jSWr+RxoJqWu/JoaWnUe9+fW2/IS?=
 =?us-ascii?Q?ckJpcdJFqi38EDEtpWlXZfo1RN0LhyvxcGJZxD8UNXgGGtRIfd35GxV3qPoj?=
 =?us-ascii?Q?iqvQDh2F9E16ZRok5gOnRBg11QrW2e5+YnqISdDow8YNOusohAkLTgCYSY+c?=
 =?us-ascii?Q?2aniJoQhwWEzf/j3KX8OTy72WL/sDC1l9IXRYA8yCrv8EVMU6/EUmy73iB2L?=
 =?us-ascii?Q?nMmIK49hdLd8WZtHhqz6xBYjfSxIyFk0k9FK7rYZ1BpLicWtjPF0nnPqfgP/?=
 =?us-ascii?Q?mWbp4K0AwsfGblxBvwykxtsEhybYrXr0M1LO1oagQzyToHYh7sncxK5yR4Ft?=
 =?us-ascii?Q?onzOmhN5ibloQImI9H4tx2nqFi67Wdi8Anlt8JKbjHhGk+3SJWw2FGwy8DAe?=
 =?us-ascii?Q?JjfKxpjKgCLDZwFdP0FBFtVarrpGy0o+9z9CfSCcvZkHf22+9+lMHahENC50?=
 =?us-ascii?Q?8zVpMR4hwPhVLpnWheg5aVob06AFlYFPIAGapvi06qlJxld03TdzOjw2ACwp?=
 =?us-ascii?Q?fc48ubOiI4JKTJUObLdyxkjryaytzO8b2/DnH2HN7c3tfneeCUpMllkVZ6i+?=
 =?us-ascii?Q?TMGFBjjAVMvEVB2yEQSI4X84DBz/yogXYZ1fzaEGTWlLoHtE8pXprQU5GW22?=
 =?us-ascii?Q?BKIT5ffguqcYE8JulYEH1iEmF5WaH2u+EsDK/wmW1T5QMc3lksL0Vb5EE9bO?=
 =?us-ascii?Q?QIPFeiMjk9fS14T14GcrPuQJAC3TUU37QQ+OXKo1f1a78gtGC4kRp1RVJHcv?=
 =?us-ascii?Q?nY2A3R75G65rRtanzJ0vOZpuWYXJ1ENa4GbUqS+Xg084CowQ1wJHj/9Uy2cl?=
 =?us-ascii?Q?0TQAt4DTjrReJxZXssjSxEV7VpR8c2mE925ux0O9w2EVQvdq2sti5BXlV4vi?=
 =?us-ascii?Q?i25Y5DTGfCDpWLLM1PkCKOByJfrhgHOkw4x6UTdnbDefgxcawg7hpsCexxgh?=
 =?us-ascii?Q?EfKIM7Vsbb0/KWW0cuzRckXyS1RTArsGMhJyLq5oDQOObBx/vMe2GWvPTIv9?=
 =?us-ascii?Q?ET+FRuwfyGWpGF8LezAC0BmkM8nKs5306y2Ybt9LDoCdH/WOwXXM5DmHk1h2?=
 =?us-ascii?Q?nQeg9Kr1Up/+Xydaq0hvV7WMZLuoKaV/6L9EGE29DiRXJWgYxdIztd5HBGdj?=
 =?us-ascii?Q?qDRyqlinQbKQzaFqZtICl1ZH8CYONVlJN32HjU0WZjoSKKp46by8qdMYY23t?=
 =?us-ascii?Q?LZYjrPnAKapyabYiirCwx73KjjuVzHcj0WPohTsRVQ8xfwwnnd/BJNUq5cNw?=
 =?us-ascii?Q?ImC6irCb201F8lL6OS2qBnnqTr9S9pas9rK9f/CMWXNH7vp+v8zG0/x7II/I?=
 =?us-ascii?Q?H4FTFscpBy0pJV7baWGzvgTgssXPBGiqwZdL39vATzo1c7xviiT+EW1r9vhc?=
 =?us-ascii?Q?VpxJmuTu+ghQBucXKx8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5953.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7a9ff4-7c7b-45a8-e9d2-08ddec5932aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 08:50:00.2748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uwL1trrIYcsNQz/MCP5h4G32WoaQPU/+2qwozan+DoGNEJpaAxzYX/019PwhWi36
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9494
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_015005_728200_EA3621D6 
X-CRM114-Status: GOOD (  18.67  )
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

[AMD Official Use Only - AMD Internal Distribution Only]

> -----Original Message-----
> From: Suraj Gupta <suraj.gupta2@amd.com>
> Sent: Friday, September 5, 2025 12:18 PM
> To: vkoul@kernel.org; Simek, Michal <michal.simek@amd.com>; Pandey, Radhe=
y
> Shyam <radhey.shyam.pandey@amd.com>
> Cc: dmaengine@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linu=
x-
> kernel@vger.kernel.org
> Subject: [PATCH] dmaengine: xilinx_dma: Fix uninitialized addr_width when
> "xlnx,addrwidth" property is missing
>
> When device tree lacks optional "xlnx,addrwidth" property, the addr_width
> variable remained uninitialized with garbage values, causing incorrect
> DMA mask configuration and subsequent probe failure. The fix ensures a
> fallback to the default 32-bit address width when this property is missin=
g.
>
> Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> Fixes: b72db4005fe4 ("dmaengine: vdma: Add 64 bit addressing support to t=
he
> driver")

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
>  drivers/dma/xilinx/xilinx_dma.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
> index fabff602065f..89a8254d9cdc 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -131,6 +131,7 @@
>  #define XILINX_MCDMA_MAX_CHANS_PER_DEVICE    0x20
>  #define XILINX_DMA_MAX_CHANS_PER_DEVICE              0x2
>  #define XILINX_CDMA_MAX_CHANS_PER_DEVICE     0x1
> +#define XILINX_DMA_DFAULT_ADDRWIDTH          0x20
>
>  #define XILINX_DMA_DMAXR_ALL_IRQ_MASK        \
>               (XILINX_DMA_DMASR_FRM_CNT_IRQ | \
> @@ -3159,7 +3160,7 @@ static int xilinx_dma_probe(struct platform_device =
*pdev)
>       struct device_node *node =3D pdev->dev.of_node;
>       struct xilinx_dma_device *xdev;
>       struct device_node *child, *np =3D pdev->dev.of_node;
> -     u32 num_frames, addr_width, len_width;
> +     u32 num_frames, addr_width =3D XILINX_DMA_DFAULT_ADDRWIDTH,
> len_width;
>       int i, err;
>
>       /* Allocate and initialize the DMA engine structure */
> @@ -3235,7 +3236,9 @@ static int xilinx_dma_probe(struct platform_device =
*pdev)
>
>       err =3D of_property_read_u32(node, "xlnx,addrwidth", &addr_width);
>       if (err < 0)
> -             dev_warn(xdev->dev, "missing xlnx,addrwidth property\n");
> +             dev_warn(xdev->dev,
> +                      "missing xlnx,addrwidth property, using default va=
lue %d\n",
> +                      XILINX_DMA_DFAULT_ADDRWIDTH);
>
>       if (addr_width > 32)
>               xdev->ext_addr =3D true;
> --
> 2.25.1


