Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16E5CA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 12:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VMzUpWdg9sz8odpkuusoxSvmP9NoiuB4a/xdbbqsk5Q=; b=pYCIaLKiIDKMNKkQVWX5rTBLss
	3V/shlcOh8fDFyMQ3DquQvL88x4XRejr3Rz54w5x5We34WtkzDvVluq5ENhhs3IkM2igX6cIS2ZSK
	741pmCMp5Q5rpavVoZ7ovUHIZ4W83dkR/gn007gxJN1SZduBFbo+GQlURC2JqjGEmGUoTplN5R2Dm
	mbevD3qBnG/rS4m1/LVMI/ul88IieP9scj+9C3zdb7vS4rHsp7zIm/xwlSGwcdBRpzDSd9lUB6tno
	U2iuGdQNnxapZ1ILuy51soundj3r581tKQruNyFOJ1aiDkm08o+HjFoBBgMe0Yflu1JJAAdSrLT3C
	LIBvUCQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGAR-0000000985Q-0Jqe;
	Thu, 01 Oct 2026 12:45:43 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGAO-0000000982g-0uRg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 12:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHxurhEbx2kqzqt40NiSijhCLJWaati0/a2odzm2lBhF2xF9CwCu+Sy+SAX7n5AUac5CgKQjaRz9Gr4U6kwi41ICQWQ+oIQLHQt7WMW+W8dm1SBLW3le8pz3eM6oY4jNmYcePfBKVz3vxscUWiKgqyPuVzfXi6SN3GSYXevkQ/BNzJUBGt10966kXjJrRexjfW9W6Avbqv/hIX6mhY/ZMVu8SWRJUfwif8nj1+H4LTBAbT8+TpDRzuuvO66rgKihBOiJrIQIpzeOCUlC7At0t78RO82k85RSUbh5CLGQufP0KyVERPm6wI+MAzHEOPYjhaqpGAtA3enOoOv+nQKRAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMzUpWdg9sz8odpkuusoxSvmP9NoiuB4a/xdbbqsk5Q=;
 b=AX1YKCxMlzRWmKiHh3wiypx7usqzq+AnlrrGrHNhMT4sOH616lQEbktnKMkFcdnN3PLV7h0+wPOXuCVMvQzivAqIn1PHIY8P5QODVJNpIAZ4tWP7Jtm24qUhsMLw5XofGGucSW7nb+ecrLvknTqoQqamdfbyoeKGXa5FA6o4FX8nxPbrqAxW2Np34b0XPCdt6j2jE+6b1vFr2WP8x/U9RZ4M1yFq5GJ4p/t6+cUd/vXR928g5NzDZjScm2hampJQy6rmqw8gGnDGX728lBPqfo8vPYxkfx6C7ZFL8AUiTQiXoExZr/ZUAYlEfiOpvnzHvTcBRe9BcJ0Zk4zW812UFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMzUpWdg9sz8odpkuusoxSvmP9NoiuB4a/xdbbqsk5Q=;
 b=C/cvZf85FrzlwvOkjzJddmuA6PjU1PzE/DBYiKdBX8jZhbmT/CMpYhBTNNzeiBTkJ4SVqr2CmDoYD0vUqKBO00DogndxXvKs+tDORi/88iyLKAO5I1EBb25NPeF4POLpBfbZ1Em85yqDLfrF9wkTyBMLCMXHUPrSOwX6qv4L0pPqwWJCkYECdiia6ulacLx5bQGviK9/4SxKmMw4wa/XE7/OW/YprK/3WUfwNwjQ/9+woz3ICQTNy8Q6lkx0PoIuoHwDPkQ/uE0ix3AyRDi8bDietpNKoMRrgYcBwGP3KpNYLTkWD/l8GFFQuwNrxDLfTq+FIkP/F8jYe+BiF6FHdg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AMBPR04MB11839.eurprd04.prod.outlook.com (2603:10a6:20b:6ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 12:45:34 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 12:45:33 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH RFC v4 0/4] iommu/arm-smmu-v3: Support shared Stream IDs
Date: Thu, 01 Oct 2026 20:49:57 +0800
Message-Id: <20261001-smmu-shared-sid-ver3-v4-0-06b34fb2e691@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPVWvmoC/yWMwQrCMBAFf6W8swuhCdV4FfwAr+KhJlu7Qqvs2
 iKU/rtRjzMws8BYhQ37aoHyLCaPsUDYVEh9O96YJBdG7erGRe/IhmEi61vlTCaZZlZPsdm5bQp
 dyNGjpE/lTt6/7Rmn4wGXv7Tpeuf0+g6xrh8f1tK3fQAAAA==
X-Change-ID: 20260930-smmu-shared-sid-ver3-96807c4f4d93
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Jean-Philippe Brucker <jpb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5PR01CA0217.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AMBPR04MB11839:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f20f69a-0992-4b7e-d522-08df1fb9e258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|23010399003|18002099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: larcLc6/RVfPEoSCpFw594wFlIklM9D40i9ILXaig3iN5nSay5SsL5ZBg6FpYn5tZIsvezq9CMYtgFikf5EqEqHAlBqIbaKjUUYOzd7o9Pj6ueuVAY00JNoAvLr9zfvu03hXygnfjXvVY9YrqBZ6oXDIXvFrmQqPTZCblRKOFC6GBf3ANJo5nBgdlaX3iCzAwIEhcFlLzB1SO1MGrW6cNk3F0BtEZG57eu/VIYqgcOrlcd2PZJ5rRGEgO56lE7WW2og7YTDVzgcCn20bqDT4XkHc44boZ1zEWx/OfJKFYlh6svjMzfLbuCHZhCMevJFE14YEuVxMZ3PLz9PT5tk5LwlzEHjF+yQwdFwc2uZb1wvNw5MgAA8bd1iU0D+KdxdcfaFCYAxcrTTabCE54kaJfzkb9ffudEtCtzJzPnd13wT7a9dh1rFky9YS1udBkbNqh7zb6ui5HZmye3V7+ROUD/1gpAsXr9MpB6P6tF8HK2aQjCZq6MbwG4TIOWvYDckWYSQ/LLG3yCGG34w23lG73XyYD9Ln/UqAll4rcoDPXc9b9oisNkYBunjU0V16ilq0eDA0Sai+u7ORj92ngREWGcE0BHq4x02xKs0cbfXyO34HWrPew9p3twS0i8Y8SKvRU23WuwQcTZdCKR41CxwpqRCoKuiPxjin/kHjvVhxI3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(23010399003)(18002099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2s4QjdCbE8zK2tnUVFYbGpJUnFjcldjMWdlN3RpZXZjNGo4aXlKQmZkUVFa?=
 =?utf-8?B?QTcvNGRpUnhHcjVkZTZwcWtqajNOZDcrVDZXS2R4Smh2Q3pnMENqSC9rdWZL?=
 =?utf-8?B?K0xMR3A4SXRTK2pyMkdESnZwU0UwdmVqdFlXNjhNamNna3NWOTA2Z0F5Z3kz?=
 =?utf-8?B?RG1udk40UlFXWmxPbFBsN3EwdGlpZmNjOElNVFZ2OTNJSGxtNHFBU3l5Wkxy?=
 =?utf-8?B?RnV0b2x5NW9IVitLUHp4TU5FOEVXczcyTVB2SUZIekZWNG8xQWhLMVJ2Y2N2?=
 =?utf-8?B?ZXZXM3JDSk1xZmFTNmpmUjhjZmNnQWZVc3ErdzhrczRKeWY4S1FHcTRMaTF2?=
 =?utf-8?B?R2VLUWNKQnZHZUdQMlc5ajFMREhiODlOcFVvR1c3K3BFNk1TLzJFbWQ1VUpo?=
 =?utf-8?B?aHJMYnFLNkZNeTFzYjNjT2JYL2V6bVZCdEc2aWtEWDJvb25WQlVoc3RvbDQ5?=
 =?utf-8?B?THA3bUpwQUxRYXl4MnUyUzBwekhEODdRVURXSzN5R255SU9lMjVDcUk4Nlhk?=
 =?utf-8?B?MTRRcDlrT04zT2pYaGlJVVh3UW5EQTBURlRqTURxVzA0MjlOSzJZdWNQSTNl?=
 =?utf-8?B?dTNTdS9TWkh0aWZxUkZvWTE3aXlCUWJhQUZqUkZxN0RMU1NjYTBjeW5jT2h1?=
 =?utf-8?B?eS9RV1BoejJyRlZNSVUxL0djUHpJN2NISWVGSmc0dkZxaE9TN2NaZFFZUS9s?=
 =?utf-8?B?ZmtKRkNxbHJtRHk1NDBxNzFmSEg5b3QxYVRrU1lLLzkxdTVxT2xMQjQxK3Jw?=
 =?utf-8?B?czcvUk9PVEtlb2hCTlp2eUFBRTlzRW1CSTlhQXZzdzQrZmlUNDFMSVYwK2Fl?=
 =?utf-8?B?bVRFNVJ1a25WemVBTnF6ejk2c0hYWStXQ2JzcEp0d1h3OE9kVmloemRBc3dp?=
 =?utf-8?B?QVdGUkdvUnBPSkcxQnVnYy9IbUROeDlZWkw1Tms4eExmOEpTNXlRNmd6dTR4?=
 =?utf-8?B?V3ZRMjhoem80WWs2TFc5NFJsbEtMdVFlNFlUVkprMzRjNTVLUERoYnNhUis4?=
 =?utf-8?B?bHNJc3pwQUp3N2cxSGthaHVCMzE1VjFjRVYvNkNobnVLMGZJQ0hnSGFoeGZn?=
 =?utf-8?B?RFVIeGR0ZW05L1EzV0QvV3EyeXhwMHpVUlVJSzF6enNEbk05cTIrT29XSHRp?=
 =?utf-8?B?TXN5cGxUd2p1Rk12Z3ozV0lSckNhZGNVTGRGRUt2VnFxdVYrdkVIMytEczB1?=
 =?utf-8?B?dHRUVUJtdTVGRDBxeXE4VlI4VHFKc05iUjRyMFUwSnR5eEtGQ1cvWXhRdXlD?=
 =?utf-8?B?bjh2cWVIMkxUQ3ZGb1Q5V2VSVGp4MFM0UVY4ZXA3TG9ya0hML0I4VEVsSmRI?=
 =?utf-8?B?V2o5K0NETHhvd0VPVnRCQllhYitJZFFOUmxjcVJoRnA4THZmZWptK0dNQTk0?=
 =?utf-8?B?THRkSzFvR1VFTlZEODhPb3duc2JSZjI5VjlXcWVDU1hZV2JUdlNiUll5OEZm?=
 =?utf-8?B?cjZSaEpIak5zNVg0cmtOa3B4SllwS3FxOERlcm9lTDdHSVdqdjY2TWtxQ0RT?=
 =?utf-8?B?dzJOamtmcUJJTlVBM00zRXhQZDU1aU9zVEM0QWdGaFBPdWxJS3lJbW1aNnZQ?=
 =?utf-8?B?N2w4Y2kxbStzTXpFWCtFdUR1bGJjQzhLL1BrR3dFZERoTFRTZXZtZy9GakVN?=
 =?utf-8?B?TlcrMEhwYTZFb2RDOHpZWmg4WVRvRWl2eXVNdGFHdk1tOU5ZY1RxT284TG5p?=
 =?utf-8?B?TEdmekVSbEZtWEhERXdabVlXbElScG93cmpvaEVYL0NsaUZLZ3FBZ0FBeS82?=
 =?utf-8?B?YkZYL3pCeGZVdWJyWkV4ZDdvZDlXWk5EZldrVFJsSmptcm0xUkZJcHZUUDhu?=
 =?utf-8?B?ZjdPb1N0Q1FIam5uNXp1bFlPU3dqWXd6QU8xdUNGR0ZMd2ZucW5HRUZKY0pN?=
 =?utf-8?B?NDdwekxrY3J5UnA2OEhGNW82Uk1qNFNrdEhsUjlFZzdVQmU5bk1WSXNDRkg3?=
 =?utf-8?B?bHIrQ2Z0dTlzQTNpT1ZxY1FEclIvZVgwdTBtaWxyUHVBS3luaEltVlM3UWtq?=
 =?utf-8?B?R3JQVnJCOVFaMlE0WkpoRWVlQmJjOUZacWtjQWljZ0lRM2IrcUl2QXJlOThB?=
 =?utf-8?B?TzlyRHFxc25nbVlMNk1NU1VuMmFyaURUaFN2UDRqRG9KcGJkbVRoOWNDZjlm?=
 =?utf-8?B?c0dkSTA2MGpZNkxJbGN4V1RMZnI2ekpKdWNSUlYwaU1sV293TmN1bE9NRVhT?=
 =?utf-8?B?ZFJjcHlHRWdZYkxtVC85Q1ozcytEZXZ4dGd4M2V6RzI1cGM0ZHBHWXBuN0Fi?=
 =?utf-8?B?Zk5YaTloRmozcHBEZnJNL2ovOTcxRkFGOXpsQU44UzJhZ0Rub0xnTVJBNWZ5?=
 =?utf-8?B?YVdVYXN3c0ZENkpMb1NRa3ArN1pkZ3RhQ1hYOUdYT2plRTZUSVZQTC9xbWIz?=
 =?utf-8?Q?46i9DuAEnwnOfllROG5NwKFU0VNBR4P23XZak?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f20f69a-0992-4b7e-d522-08df1fb9e258
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:45:33.8689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4ge3turPLoBBgQp7C/2KYrN/dmGB1Z7fuKYbayTrSBaESs3Gweb+bqZlbX5Q2vfPHBZ59tM6zqa7VQZp14vJlVkjxT4h2GTfQDdpVe1KntCYOoVRiznVKEUD3KbPhD8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_054540_279235_BD26537A 
X-CRM114-Status: GOOD (  13.33  )
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

Some SoCs have a limited number of IOMMU Stream IDs and hardware
that inherently shares them.  The NXP i.MX95, for example, has
only 64 SIDs -- the internal bus carries just 6 bits of requester
ID -- serving 64+ DMA initiators spread across separate IP blocks:
MMC, SD, NET, PCI, DMA, NPU, DSP, DISPLAY and more.  Because the
SID space is exhausted, genuinely distinct platform devices (with
their own DT nodes and drivers) share a SID by hardware design.

The current ARM SMMUv3 driver rejects this situation with:
  "Aliasing StreamID unsupported, expect DMA to be broken"

This series adds support for multiple single-SID masters to share
a Stream ID, allowing such constrained SoCs to function with
IOMMU translation enabled.

Patch 1 fixes a pre-existing bug where rb_erase() is called on
duplicate SID entries that were never inserted into the RB tree,
which can corrupt the tree.  Bridged PCI devices may produce
duplicated Stream IDs; the insertion path already skips them but
the removal and error rollback paths did not.

Patch 2 adds shared-SID tracking so that when a second single-SID
master registers an already-owned SID, it joins the existing
stream rather than being rejected.  The stream structure is shared
directly between masters via a linked list. On removal, ownership
transfers to the next sharer.

Patch 3 places devices that share a SID into the same IOMMU
group, ensuring they share a single IOMMU domain (required
because one STE can only point to one cd_table).

Patch 4 wires up STE write ordering (first master writes, last
master tears down) and gates features that require unambiguous
SID-to-device mapping: SVA, IOPF/stall, and vSMMU nesting are
disabled for shared-SID masters.

Changes since RFC v3:
- Added a standalone bugfix for duplicate-SID rb_erase (new patch 1).
- Stream structures are now shared directly between masters
  instead of duplicating them (Nicolin).  No ref_count field;
  sharing is detected via list_empty(&stream->shared_masters).
- On owner removal, use rb_replace_node() + list_splice_init()
  to transfer the RB tree entry and shared_masters list to the
  next sharer, avoiding use-after-free.
- INIT_LIST_HEAD(&stream->shared_masters) moved after sort() to
  avoid list pointer corruption from bitwise memory swaps.
- Both sides of the sharing pair are checked for num_streams == 1.

Changes since RFC v2:
- Dropped the RB tree to XArray conversion patch (Nicolin).
  The RB tree is retained as-is; a new arm_smmu_find_stream()
  helper provides stream-level lookup.
- No per-master shared_sid bool; replaced by
  list_empty(&master->shared_masters_elm) (Nicolin).
- Only SID-sharing for single SID device
- Follow Nicolin's suggestion https://lore.kernel.org/linux-iommu/arG6hmng3NddGEHm@nvidia.com/
- Link to v2: https://lore.kernel.org/linux-iommu/20260921-smmu-shared-sid-v2-0-4b656ce68178@nxp.com/

Changes since RFC v1:
- Revised cover letter to drop eDMA channel example (Jason).

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (4):
      iommu/arm-smmu-v3: Skip duplicate SIDs when erasing streams from RB tree
      iommu/arm-smmu-v3: Support shared SIDs in insert/remove_master
      iommu/arm-smmu-v3: Group aliasing devices into the same IOMMU group
      iommu/arm-smmu-v3: Wire up shared-SID STE ordering and feature gating

 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c    |   2 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c    |   3 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c        | 174 +++++++++++++++++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h        |   3 +
 4 files changed, 150 insertions(+), 32 deletions(-)
---
base-commit: 6474fa070f2b8013b4b87350b775b8c3be6e8aac
change-id: 20260930-smmu-shared-sid-ver3-96807c4f4d93

Best regards,
--  
Peng Fan <peng.fan@nxp.com>


