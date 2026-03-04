Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82793EFCE4C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 22:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXrErA0sMeKWmsOp3wui/g3AkoTupSMFZLHGNvdpKz0=; b=NR30lShXer8joEmqawbhbNc7OD
	LTrkN4eUfrcLAUl/69w401XCgeJf4MWq2qaewBc5g4iOoladflIaQ7jRJ97qxXLZZ/P7GAgN8Knpg
	FHsZZ3KsG9VJ0CdO66+QfvfDh56HVhK/V15383pTO2SON/lcJT6AMRQaDVOWT87o0js2XQHKguizo
	ZGfvDdPtDGqj41+0zvkK5hrNfKSooW+tDP3FKN8UiRYWAPbIQO5txmbcByelYLJGK0+84/8QETV/u
	nsHktlaV1KnnUt+n5UhtkFF5iXqVVwCFKxoKUL/KOpdkH1hPNMV5iRqNTv8ji3J8jjqYrJeYYpkM6
	DZOSF4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxunh-00000000ayx-1tZj;
	Wed, 04 Mar 2026 22:34:41 +0000
Received: from mail-northeuropeazon11010058.outbound.protection.outlook.com ([52.101.84.58] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxund-00000000axj-2Kv0;
	Wed, 04 Mar 2026 22:34:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzPLJK80uR2+uzgdBGD8p0jpObU5dSZNFV3wAePQgiMz93x35gT7bNUzBQcOAZqlpSJSYYerUZFSS1Titk0rMm7JzFFs0LsfVMxa9kCl3f2DLsyRgqsvhGO/JpgBu45c21wfn6/kfdxabhUIIaI+VUgs4avk5uP8NVSa3LVSYqcT+U5RKFsdGd8qwlcAbNlPVOUPtYZz1u5kV3S2++K+qSQDGU9YKhTBoSpmHlD03+K7VHN5AbtDlkkg7dVMG4BCHeWZMrxVwqpJ9vA1K5gRztVJL7F0qYOdgNXgTFkKRNigSosBn90eNtckVUSqvo+vQ5optFmcrBlnGuTrGCj1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXrErA0sMeKWmsOp3wui/g3AkoTupSMFZLHGNvdpKz0=;
 b=c1jW/pJKuqzPuMqRHBH1MK6xtragAz2dTL9LBPxl+R5NGLzanJBkNvCZ0jI0PxSyFruQlqpmdifzeTb7HN+aXjMNHd/xa3EiUDUj/bvtQrgVmyNrtdkxhUBk5yX72Gq7rp5eCZsPDIsYb+JsBO0aPJb5DieMONJ75Wo2BtNwhm4Q5ktHZZgwvUx7FgAj9ZItoSYUvX+oHKGoWzMY5ZngCGMAf8A9YLb6iWT9EydzuWxqUC/BdbTyD/JOuqfaD5suZmUO6HnmYnK1pPafg4xNqMDPO778SenSFlGAKOL9WrrUzbM0HYD7AaSOc8YuVvFsYo8rZ1ClVoxnklYfu4cEiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXrErA0sMeKWmsOp3wui/g3AkoTupSMFZLHGNvdpKz0=;
 b=ku9gb9XWLdEYu3J2MGZQ/GqPLS1ufQRkGJ2Cc4feC05GfUqZLD75O411Vd9tBrTvC4bvftiiXHlQiUQtcIVlzdkKw5D8uW4pb6JCfy2cTeenbIvv5SwykHDHbKrNdEvVJTT+vRiB67YaHEKtJ9pGuk3dR+ArCBMu/NrJnqC0NilSjk2hfZiO+TOwU+Ky48MbMoDrHeSh4fs/B5T0eTL4X/C0SHAwHKVF9ApnNXvIm1CTRyO80uHwFk/79rVWyPiUSLlMLe7zjFUgobKEQbS7XQTQl6mmBFvQ3VNAyolDmE7xkNoL3kkqAysIUR7urH5+8ravyl4GEM1zhy0EP9i2JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by AM8PR04MB7859.eurprd04.prod.outlook.com (2603:10a6:20b:24c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Wed, 4 Mar
 2026 22:34:32 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::f010:fca8:7ef:62f4%4]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 22:34:32 +0000
Date: Thu, 5 Mar 2026 00:34:27 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawn.guo@linaro.org>,
	Yixun Lan <dlan@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH phy-next 02/22] PCI: add missing headers transitively
 included by <linux/phy/phy.h>
Message-ID: <20260304223427.scaf27g25creiryo@skbuf>
References: <20260304175735.2660419-3-vladimir.oltean@nxp.com>
 <20260304222408.GA40990@bhelgaas>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304222408.GA40990@bhelgaas>
X-ClientProxiedBy: WA0P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::22) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|AM8PR04MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: d42453c5-5530-4e99-d982-08de7a3e34b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|7416014|1800799024|366016|19092799006;
X-Microsoft-Antispam-Message-Info: T2j0ynHVVUYIV9sAgspMauLSM7QGiEPxOPUXg+mSaegq9CE1l0ne6LdiBpt1z8hrW1uF9bcn8qvt7FeOuonKdUtFLaSjvsdSMPqkiL1Tp0dSeYXvfS8rUyv5cK1tFOrsGxhKo36XAsG0qvgDDwswKIxtBxXzNynfzcIvLXyeiq/n6DErGMzL+j+kCVGVMQY768KQuFS+AHxP+NwMQv62u1Qz85PI/OFsemxFaVGQJJckxq5LIEP+TDiYC4PjbNOIFTmedk+8KmjqgUm76f6xZz1sySPMHf1lrUoahF9eZ4SAtlmvhYf+kIk0uyzbBCZDocetqGoqdoTdbYfPscP2wHfBNnATsvp4XSMXMIgSLLJGOf5Qt4oWjsKhD1YBxElKd74+pMw6A2H6kY/nnpyiY8RjRt3c/VFVT+x/exFd/9YNKAiINCiQcOoxNUAScDKuNWDtjaorxJnFXDwvDDn1l0KFz9povdJMq0XYrSXf2bnGWECKwREb/8RT+jsCc2mJpJKQBNds+YtrAVEZsBN+xUBSjBnFYKCPteUuykqhsItqyBQgkCm3VT03d1s7v24jm1hrLnhlMsose24Ye+3iXvBMxba8W+OH8eag0cu//mYU/SN7AbD7blt3PXkkrLjahALJ/J7B8PgyFCjW2xx54K5Yr98rQCPyhZk1yO50zipV4WXi8+CU0F0mUeUpV49vi82Qr6v0qedgI64Hx4wrvA59Qy5BkCzgcn4/Dd7nx/I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(1800799024)(366016)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RRVR5C/RocM+30f+wt84C9y6nmWaq/vKT8ZEDg3Vkw/B6kcy6USWfA2ua7nD?=
 =?us-ascii?Q?78rTEUiXq2QQNzYghPQLNqYi1PNm8eUibz/ugen0Sh9pyqFiFeWJsWbHxq59?=
 =?us-ascii?Q?La8aaYZqcOgPbEO94wi/XmsQF/8Q+iJhd+6s3t3yviFpyrj/eoEf2o8yRZtT?=
 =?us-ascii?Q?UwVWLqB6039oAYNXdPYmVOV/L5y/wJjg0m4qHEk1mrbJKjAoCKGmFXMAWzuP?=
 =?us-ascii?Q?JjuCBuolxr0vFVpA+cvDti6YAdP/CwBWii5vWhdZJyUE88+u+3GJ3KFMMhEV?=
 =?us-ascii?Q?sFGfZ6THXZbxpamvbrIbKZ+7S/VjIw1t9JjYJVez7MmCVnMfVwMVqXSRyUNZ?=
 =?us-ascii?Q?B/Xl5hVcbhUusJ5kemudV2EjMrYmhNc/ABzUDGw+4nxUAxmKVt3yYkwZZh4T?=
 =?us-ascii?Q?Hx4aZ9TK51tpVhbcNaAgtp32taYAN+Zxsxj+OgI7+zIVkn+QO0JPxZU8Gwdv?=
 =?us-ascii?Q?vCIl/i75ruO2J3IppM9kCK16em4paTOumi16X/+/+uDflj3nAxDbYkMZYrFw?=
 =?us-ascii?Q?9x47d85BmUr+slx/v7Z2f2BSbi8gyRkpAnsB52KzajetmfVGhgF6atxd8znX?=
 =?us-ascii?Q?bGIs3QsrUvshvbtj0sjz4algeVAH0PSn04MEfJX2jzv3hiMB4cHC/O+0mScE?=
 =?us-ascii?Q?0ZJ6EGcl/ryLVA8TQ5y9GcTh51EwlkdWVI3+jnbFC+7LodhRWq87sUU6fqA+?=
 =?us-ascii?Q?JaDboRGutF83vBFb6HcbpGnr60aAabzxCRQYzHBlEU/NDTZIROrG8JNocO5K?=
 =?us-ascii?Q?3DwIe+d6NavoapFS3D52ImcCC6Kyveve8tlTEsN3yak5rJH1TattvIC8jIR6?=
 =?us-ascii?Q?OTVg/rdBkUA776gO6qOv6duWw2MVHsfwq0BRzVz7NhlIpB+fHqJWtvEEIx0X?=
 =?us-ascii?Q?xVN9Y3dXMQQUyGTPwwbn4SzY7bYm1BcAbqBT2FMkZkHCezgWkiWTyRr2qKUT?=
 =?us-ascii?Q?nxKtoQ8Vmf5Vur/qa0ipbXNyox4Bnyyh1f7rXQUxveS3Y51PK0CuhAKKXlis?=
 =?us-ascii?Q?ZJS8Rb7RgwkECLydkCCIOlaCtdTtogKTN5vJ3WGB0DwsJ8gQptz6emZyvdo7?=
 =?us-ascii?Q?JYk9FJy3DqOo/bbmLweMKKNMwoAO1dwkFagveHhyGLktK7gofKPAb1uqSng3?=
 =?us-ascii?Q?AQBYODKnp2CQLs26umveBOYHiAS8gsqamnvLlhZ0InCtLCDW1Zg2PpWpSptm?=
 =?us-ascii?Q?2JsMV4PQ7/KFE3TaxezYa65DDUa0/hcQkXzMn1HO3BclloEADcxe24ICDj4R?=
 =?us-ascii?Q?rAzZslyVg9Nhhb8ixFGfwbDVrjGzCMe/nDL/vusqlbdcvWHoYq0HDz5lU0BA?=
 =?us-ascii?Q?N/O/VL8ujI4GS1QxhHuG0u15lOYsf7BMkP4Nqoc9OVmHZH+mcjoUkqx1F3y3?=
 =?us-ascii?Q?rcaA6UeToxHirSYVh+sEENgdEJErvLCTFPOHyAc8BOlrcWmEb31kZ4QksDqp?=
 =?us-ascii?Q?9V/o7x2nFJKDRhf0bV2bbokMpWTLpQw6C3NjmObSgDHX+Hdwmg2EdfWWlGYA?=
 =?us-ascii?Q?ZBrjLR2nlTE9piLkJXed/q0RoZjPIVOpfLUYKq0sd1Ed+2f5MgCBkorA7Y4w?=
 =?us-ascii?Q?KQbvnPvUSuKB+mha50Een23p/wR7azT5QFTETiYE3ii4818pHG7BKDfFruCB?=
 =?us-ascii?Q?RRetR+lsw+0mrwINwn7mm5sLq2KkQS4q8MKKzbxYUDESOyPZHWbuyqnHG9wu?=
 =?us-ascii?Q?fcj/Wux5kj1ZmsEeM1/K9uVJ/QooyXU4lKsCquqgNz3FVKsZuRINgRKm5FvU?=
 =?us-ascii?Q?s071hqwGW8BEoA2c3NkI3LBaAktbrL2u6kxoDHd3Co2GGmx+5+D9IR+nYL6N?=
X-MS-Exchange-AntiSpam-MessageData-1: pf5ZiVDe1d6vJ1IBJK/L6Nb9wj//e7IIlXA=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d42453c5-5530-4e99-d982-08de7a3e34b9
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 22:34:32.5473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PcMVcOV3Ik6ptoE4VsCcvoQ2sjRW8sUQ7x3sTlEGffiS/HBjAc2+VhWf33xxqwko6TTz2bjvVPHe6kHiGGwCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_143438_354903_14A37917 
X-CRM114-Status: GOOD (  13.26  )
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

On Wed, Mar 04, 2026 at 04:24:08PM -0600, Bjorn Helgaas wrote:
> Update subject line to match history:
> 
>   PCI: Add missing headers transitively included by <linux/phy/phy.h>

My case-insensitive brain didn't understand what you mean by this.
I had to power on my case-sensitive part :-/

> On Wed, Mar 04, 2026 at 07:57:15PM +0200, Vladimir Oltean wrote:
> > The tegra as well as a few dwc PCI controller drivers uses PM runtime
> > operations without including the required <linux/pm_runtime.h> header.
> > 
> > Similarly, pcie-rockchip-host, pcie-starfive as well as a few dwc PCI
> > controllers use the regulator consumer API without including
> > <linux/regulator/consumer.h>.
> > 
> > It seems these function prototypes were indirectly provided by
> > <linux/phy/phy.h>, mostly by mistake (none of the functions it exports
> > need it).
> > 
> > Before the PHY header can drop the unnecessary includes, make sure the
> > PCI controller drivers include what they use.
> > 
> > Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> With the subject line update:
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Thanks for looking!

