Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63355C982DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONxPRUYNx4yzclBMxe80SIGes+ArcUajWBi9f6wp1Fk=; b=xB2ESmsscEexqZlIkuQuxw1T1C
	BLFlRz5/IHcdipDzzcItJPq9ca6Djqfs347wjWBcOjNPRCk87tDjxL17HeKVTZLjAz/kvnfGyM9Ud
	u0sSfCkJZEU3nSdjFcxHxpKUU1wA+S0ASMVr+bZl8sUrbNpXAt7zG2J87hkGjPkdjUtPQh8OdJlcR
	vld+7RpvOoNGgbEr0gPW4Qd+vggjIgzblq5xpVl3Nm3pKUolToic11E+WGZQ6ZttVXW7Yb77v3mpg
	Rp6P0VVu0wVrZxsnxx6HCx33HAUtT8dKnPTtimN70CCOgrPLtp7J+rWhLAyUwkhztFG10qMQPC7ph
	QRmfTunQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnLj-0000000EYKD-3pjH;
	Fri, 16 Jan 2026 17:11:03 +0000
Received: from mail-eastusazon11012009.outbound.protection.outlook.com ([52.101.53.9] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgnLe-0000000EYJf-0Qt4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 17:11:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmU65Ex2e9n5Z3IGgh+PWZc40xWuW/kZkIMMvqS1ruivCvIAJExfyPjnvd2LcX98rJwS7aySNtJQoPohyhOQpoJc1z26p53KANvpZEoSgn2SxkdN1yFOUONwiavv4bDgLLUWqIZp634OUyNkV0mXSUD5/+WJOC8OFCsegcC3f8oxJuHrN2+xXgs7ufLMjCXMPRb5nniVKTjUODkQDSuPFeUIygVp0bBi5ihAe9cExV483ABZZtFIgeNlxx9RMoVH7ZauSwScT13Mj2WmTaoHUK9QcalyH/U2HEhAKH5DKytu2+sb8ZGsi8xtOGenksFLKknxCpK794RBy2PF3AuGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ONxPRUYNx4yzclBMxe80SIGes+ArcUajWBi9f6wp1Fk=;
 b=ilTC/XGmNqyXXJqwMOaMm6nehSjacBd1nJsApjd41kj0HstT2tWmuaVeT7f2nxb9jZ0Ji06aF9koTLOS40U/m98wvyetHWUl355dNXIS7ZiaR6ZrvO+j8GVQcagS4tEP3kDUL6vSmWNGZBmhmlJQkdnt5P6xjSLS2v8tmHsvrt3vkuEMShYdAMMzJ8AKdW5upZr5RgvTyT/NFHn+jabTBjh9TNIrzOEIIcM4Onz/uDOtHNAFEDHK2N5ph8Yl0CCsDcqRlMyTJFHZNZ34kXenf9zMD5wOPlm0n/jI1ynk3+oo1cVYLs7IhBRvg06lqeGTS5myCY1KjRzNMcyu9wV7eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONxPRUYNx4yzclBMxe80SIGes+ArcUajWBi9f6wp1Fk=;
 b=Xsaq22rGDNP6VK3jjlz/8F1gpaJ5fOhkRYZypYzqIqjwfHkiFv4QwnuC/0b8079RvMgWWUzcn4yPSe6A2GT0rzOXUFg18LBnegWzqDtbjE/RvTEsBpf0sLhElnS3OCd+0e5MGxqUFABOcSHw+PfaE+IachHH4aOjyJHFCLBeD2pQ/ktf7Pzp5g/Jcgcj7DzLLxkHRdE4uIOyQ0dulXp6VlaOvthxymJaPheGDsdA+xSo0zXXL012RE9xZYuwQGns4hKz20+S3f9+xp67oCJ90/7Tkeh7LcP0hRK57DGz0eFYeR4u7xXYs8Z4zWkMO4kYd4TKd+bPkrig2My79Wz2FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA0PPF52B16157D.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 17:10:49 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 17:10:49 +0000
Date: Fri, 16 Jan 2026 13:10:48 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Cc: iommu@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Joerg Roedel <jroedel@suse.de>, regressions@lists.linux.dev
Subject: Re: [REGRESSION] Re: imx8 PCI regression since "iommu: Get DT/ACPI
 parsing into the proper probe path"
Message-ID: <20260116171048.GP961588@nvidia.com>
References: <a1d926f0-4cb5-4877-a4df-617902648d80@green-communications.fr>
 <eb94b379-6e0b-4beb-aaa7-413a4e7f04b9@green-communications.fr>
 <3780eb61-68e2-42ce-939e-7458cd3a63cb@green-communications.fr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3780eb61-68e2-42ce-939e-7458cd3a63cb@green-communications.fr>
X-ClientProxiedBy: MN2PR22CA0002.namprd22.prod.outlook.com
 (2603:10b6:208:238::7) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA0PPF52B16157D:EE_
X-MS-Office365-Filtering-Correlation-Id: 5019449d-2cb0-45ff-c612-08de5522322b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?33A8C+1vooMiSjkt9CJTHKuJKshi7KbCDxRIPDq5vA6SqchYlRVzSTyBkkgI?=
 =?us-ascii?Q?LeKzESSsZFyCjaea9W3xR6p8Iy60lGtDDSBAPm6vz6mipt5LRTxTu4y1Gynr?=
 =?us-ascii?Q?42msbfjg/CGaejaDJH8+an63LsP7/SMLRJVFlUq/zZb3RYklzE/D2JoyCL0G?=
 =?us-ascii?Q?w7ufbYRvq2wMmIEwRzajHY/w6Lfet1VvvLxHhKSpByyeghcy/7H4dqyRCG/t?=
 =?us-ascii?Q?sqLYCAzHw59/xAqR2+3QPOW6vUSuRa2Srv8F4sYuSusIibF5eKhlJLlMSpFN?=
 =?us-ascii?Q?VP1YA/jwAzfUUhA1VNlItkDw1CWITc3qWOCLzjCKG+3dN08a5Bwo80Px7tqV?=
 =?us-ascii?Q?kSZTHB8PFN3yzg8tAQevZO9/mPlGpaum29tq9a+IHn34zvaNdNqO8IzJcOO3?=
 =?us-ascii?Q?hsj4tUPs8iD9Q7Q5ROvE/yXDsBSnjBA9J/PQLWUQruBT5WRvFDzzhqbMOUsv?=
 =?us-ascii?Q?uNkLZiWAa+Q+rjePjU3TNkXJwh6IrwVzYiMfBphWqa1W0LOwKnxec2QCTcbR?=
 =?us-ascii?Q?2/7rqkh0q0HNiapnNjidS1RlaVK6Ulaas46hZhVjRsVkwUDwj62eeb4YEB36?=
 =?us-ascii?Q?zFo7q1r2PE7C6wzqkEsYtbhOGpwKVtbUUudVjDc5UjVQPcMTkzj+mKcWDPy5?=
 =?us-ascii?Q?c5+m4Blz2xxkMFFgMClExkBjbCZ0x7hC1n+BPcqhIKi3Bf9UluGKi/KgS1Cv?=
 =?us-ascii?Q?r0LgV85w/nIAnC/KvmC/U/W6zIJKG3Wp4R3ThkfMGbXWLQoenH8xiMQX42Ko?=
 =?us-ascii?Q?DVgDitq7q0Z8yH2mtDNLZc4+Nnt7gx5WBP7xb+TbV/wu+oxuaCoL7J7txDbc?=
 =?us-ascii?Q?UGiAyo4x++q5KHHSrs1irdJk6SoOFkkCrjCsU+lDMgKXg28xvT5vlW5w8w6O?=
 =?us-ascii?Q?2lgxU83iZ6VGzb+/bMu4Xf+6q78Mhdwdl/3P7Ll8bD1yYgP+nJrian7VfC4k?=
 =?us-ascii?Q?Gr1KqrONybVdVPpovE4XmX4koTqgOg7/MUC1qiLMC0khIEQ6l8CXy4Cpi4l5?=
 =?us-ascii?Q?d4q1RhPhzrCS7oSfphYv67jruNrKP3Fef6ZkP0JfokKFxB9pPL7PJanfLvJj?=
 =?us-ascii?Q?jDiHkhVk3yPVrZeVmp+nSCRRM1QNKGmH7tn3ehTlcatyy5fbR+u6ZhFG/RV6?=
 =?us-ascii?Q?Yarm3URa1ivCC7v13AjSe14bxy20yv/vLlTg5AjrcU7w3bUAGfvT9tbv0HuP?=
 =?us-ascii?Q?aIcHBVpkaKwZ2W+GpfjFz97LmhX9P4LeVerNL5ZBSCN2X69QNztajHzBOpjM?=
 =?us-ascii?Q?/iZCRzdt1oDYmGlSnS27L+bya8XPfhHwsMXRPeNka4IlDaiQ1b8PkCXg3q00?=
 =?us-ascii?Q?xzFiJlVqsVJiF383Z6dIXFw5CaS2YcIWULRzxyYWmmXpM33esu1yoDX+BitE?=
 =?us-ascii?Q?YRpbH92kCxf4Ltys4e72jk+yR5mZ92TuqHkYWCV9IupyzKeAk+2a7HheMjqa?=
 =?us-ascii?Q?hPxHREjQdigAXCUNSXBFCHw3Dg3jpWBcaKelnBuClspasjVy4j6UyIsunbGh?=
 =?us-ascii?Q?TKVRXugOearDJDbOk9CEDGplf11z3Nh9aJMWzpaJdoCTlmyXfYt++kB51Khj?=
 =?us-ascii?Q?awqmMMxqSo79aWC71A0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sU9G6HKycgqeNP4IPyeZTqt44uAWGz78xuPv4GxXujDDIFHmHHafFK5DmU1u?=
 =?us-ascii?Q?a7rXwt0zxCHBR8LHlLUEOd9huoDJmkDa59LGyOmFPPioJLn7my29UsXM3ZjA?=
 =?us-ascii?Q?4sFGCuNKJnUt2o9LqZzvSPRz8fCOoy9+1q9zuPq9yRypdegw1yPfhjiRpYzW?=
 =?us-ascii?Q?FteOqpRuSjQ9Jf5lLfcvrEkXtB/fL8GQq9IhVWkMkoJqghKRHov+xnupkkiL?=
 =?us-ascii?Q?ClD/Yy4ar6D3MfdS65/zZe1id4Xh8boxhEICx0RIoJ1VfqTqP7NlHKRwYybC?=
 =?us-ascii?Q?IWdBMHw6Dv4ZQtyVeMpxvg3I1I6IX40S9jsCOgy/f5Hh9dtX/7AEOgpbrBpV?=
 =?us-ascii?Q?+keWLDMqxhxu5/xdf0J+BqZ8cE9q1RpbcPnwSdUckqlP0JTIneSzM2MIWATL?=
 =?us-ascii?Q?rCY9eSvUcMgiXmrqpCO2pwOHyN6bgZi+iwfKdV7S7aci7JP2J+75Vz9XTveP?=
 =?us-ascii?Q?+TBnr9WkA72WJWU0ejoV0xKrqS7C3Ijf2YFuncIiEkEcBFRrJ198YbAlfyQS?=
 =?us-ascii?Q?ZljU00p8X2zaN3cT7I8Y7PsPFD4oqlVakgR1LoIpHDFqE2ppWz/Teilwiwr6?=
 =?us-ascii?Q?ahqQjISNlEnuffnayMVuv6qwuIo+uaMKOZGT7zX2cv60jqCmm7S42WWDJ6B5?=
 =?us-ascii?Q?bx0so0cmKL1b20H9vfBmwlstc493TpXXp4SEC6MRt69D1LO70mrCnL1IS9WT?=
 =?us-ascii?Q?qWt1fvv+7oCxi906eynDLb6Klnt3OvLSOvAbsTPwGhwvz8dpS7+PVxJgcD+C?=
 =?us-ascii?Q?04D2pQmFyy4P9CbCCKmCsajXHD5qQlOXWZHUYoDsnhuM9/lOTvBg4V8CGYEu?=
 =?us-ascii?Q?LVm5dIGKcSvynOg5xfgRnXXm0YsbJMsc/zA031rC+W/fqv6aPMQurH00C1lF?=
 =?us-ascii?Q?ovpIZ2D0vnsidj0jIQSPW1zMwawda8chnuxzRtDvKHwGOaeOcY7vFwI97FCs?=
 =?us-ascii?Q?iTGCNwaWOtMsy1kaor71XDB1R44dR4IqGzfPBI/FD1+SH244tIGIVo8ttwcX?=
 =?us-ascii?Q?Q3GWtknr5BnnTXON1Mx11QJtEF5gwfATL0zXltCBEUdhhfkI52IDVChGAr1d?=
 =?us-ascii?Q?509K8WnUg8NV1E9kRMuGe5/LOGXeKvYbcJ2npAcDd3pQatVLoWWHHnF6h9WA?=
 =?us-ascii?Q?36d3YYhICuzk53Vyl6QRkjKYhDu5IZERl9DMVQMXgqRqMLPiLORDZLoWXwJK?=
 =?us-ascii?Q?SZkqfpZokkMa7iLBwTKMroS8CeQLHxQhQ2E18fNmb9cYbedyxGVhLk7hSlsJ?=
 =?us-ascii?Q?jWLoe2pza3qK11I1iVwwhzB23iuzaECw2soKG2U+nextq3zhZQkdLWSSIbJQ?=
 =?us-ascii?Q?E/0csNf3WR1BiQLSan85fRgh9K/RfF1u3hy77aBk4cfJy9Cgy1l+EUmHRKnl?=
 =?us-ascii?Q?5UBsj9PR+9i+m12cGw71Cs5vGB/QEi4sCc0IhK+ONAmaPPX7fpnczZpsLxbi?=
 =?us-ascii?Q?fzBz879ccRmSuvSiEZOGHB7zJAoxvzz9PPG8grTz7rfIpo7UY0HaooycEY1y?=
 =?us-ascii?Q?5RYe6uFENaLQ/go3oPhYhNpMrxE5nVOyb2vJTdKYfmix3mBLIgbooA1pvhk8?=
 =?us-ascii?Q?tGFB+6z8IUz/WI2LvD96FggXzHOvfifD+5vu6/EyFifk9lAhRRg6DDXIJTDF?=
 =?us-ascii?Q?ym8EUoby10Rji3si4JKCYfM1N1gZ5N2H5Xq8KTWTTQBJ8OlHtYnXm8yfitCs?=
 =?us-ascii?Q?bGe/livS93XfOnrgU6EU0AoUNvNQ7MzW/DhdOwMnmfv652Qg2mbq7LUBb/c8?=
 =?us-ascii?Q?uZ9czAdFNw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5019449d-2cb0-45ff-c612-08de5522322b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 17:10:49.4241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LsNuf3A8b1H0bnbS7tGROCisFkScW6mxB2R5cB1RWhY6BKJ2VZ6avmgFlwz3n2S+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF52B16157D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_091058_235503_75639E15 
X-CRM114-Status: GOOD (  21.65  )
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

On Fri, Jan 16, 2026 at 05:52:36PM +0100, Nicolas Cavallari wrote:
> I debugged it further, it seems to be mostly a PCI issue since the system
> does not actually have an IOMMU.
> 
> When examining changes in the PCI configuration (lspci -vvvv), the main
> difference is that, with the patch, Access Control Services are enabled on
> the PCI switch.
> 
>         Capabilities: [220 v1] Access Control Services
>                 ACSCap: SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+
> UpstreamFwd+ EgressCtrl+ DirectTrans+
> -               ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir-
> UpstreamFwd- EgressCtrl- DirectTrans-
> +               ACSCtl: SrcValid+ TransBlk- ReqRedir+ CmpltRedir+
> UpstreamFwd+ EgressCtrl- DirectTrans-
> 
> If I manually patch the config space in sysfs and re-disable ACS on the port
> connected to the LAN7430, I cannot reproduce the problem.  In fact,
> disabling only ReqRedir is enough to work around the issue.

My guess would be your system has some kind of address alias going on?

Assuming you are not facing an errata, ACS generally changes the
routing of TLPs so if you have a DMA address that could go to two
different places then messing with ACS will give you different
behaviors.

In specific when you turn all those ACS settings you cannot do P2P
traffic anymore. If your system expects this for some reason then you
must use the kernel command line option to disable acs.

If you are just doing normal netdev stuff then it is doubtful that you
are doing P2P at all, so I might guess a bug in the microchip ethernet
driver doing a wild DMA? Stricter ACS settings cause it to AER and the
device cannot recover?

It will be hard to get the bottom of the defect without a PCI trace

I don't know why your bisection landed on bcb8 - the intention was
that pci_enable_acs() is always called, and I didn't notice an obvious
reason why that wouldn't happen prior to bcb8.. It is called directly
from pci_device_add() Maybe investigating that angle would be
informative..

> I also read up on AER and I'm surprised that I don't see anything in dmesg
> when the problem occurs, even through UERcvd+ start appearing on the root
> context and AdvNonFatalErr+ appears on the switch.

Though UE and AdvNonFatalErr sure are weird indications for an
addressing error.. Is there some kind of special embedded system thing
going on? Vendor messages over PCI perhaps?

Jason

