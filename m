Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E94FD45EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 20:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmWDQ8t0KR1xTsteB4oI/73cR1VaAxkeYefXR/F2ApA=; b=yK/plzfEr6z7LUnzPrG3c0VNQb
	XyE/nRdfXjLHjF38TGv48JYl4D4edgYK6KmUsNOkQI2rH4gc7EcRV8+rgDpGly980qfDGMh6bE/5h
	QjH9y5FNY7v1GvwHiEqpmcP3u8r7TDdHOmencSq4e0evIBu+dxtRfoUV+v+0MFUM2O0ABKmBzzYlf
	xQwW2YU3uSGsqMb9k9agWug1490MROKRn4DYrkcqGloB0qBFETz21oUk7a4bAtt5txAt/TOmUkjXx
	G2+HVTLU4wUka8OqL7pzYfnmfckFsyjV+kBFiXeZsctIdB4GD2Bdd9QlDQisBcV/Kjm4a3WQ8zKcm
	0b0xzpSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLTN-00000004rOk-1SpC;
	Wed, 25 Feb 2026 20:27:05 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvLTK-00000004rOL-3SGj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 20:27:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAY+GF1y60rTxWdwqOa0VxZpg2gd6WhtPsMFhzdL1OzpajeUY45gj7xA6VSl1zLj/tPmx4U2JzOPtrq2Cbwb5K96ggjKwCXJTYpf/pc6cB4rxx097TXfolYndsgcNKuu/xTFeFjMY6VI8Ny28dINK7/SdIgLzEeweSdKrb23wDitpaUcsaXdUwsh0YatbX0OtsJpLkYQgSI4OQ1Kk4XOLuA/lfpKRT4uagf1MhfHs0wZsbvhpksDnR+Aw/5X+DCgD+Tppogiw7e09ZABlwa4t15ecInhh8zXMn0kGwBWNjoXXAgGU9ll6M068mDulU1emgupbQtbdif0yvi5r7Nx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmWDQ8t0KR1xTsteB4oI/73cR1VaAxkeYefXR/F2ApA=;
 b=O9aBsMzSFOwCLk0kRpN5I2RtVhvhyTjZQ0OssXrn8ce3/ceR2td/m8ASCN+vn0VfViYLxOomg0spcI3vWT4UgES5i6s2bQxgMjBvE1E5pI3qe8SlMNhVur+V7KPCMDzik3xii3T9WaDRPQK/+uF1TRQKVIIio/8x+pHcpvgboVy/RrDvHuuCgcqkLrRmOfDlAClEYjT9fvrQii3EsfdXIMYVy/loDOmVzBM8ylNGOeb37RF3KLgeGfLMASk+klpMIbnJtmekVM6bOKJKmQqH8Lt7o48zfXwHR4ueI1GOHmeU+03RvTX+aAe8xJ8gh+dF8gvzWqoTh7f5h/eLiDy5DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmWDQ8t0KR1xTsteB4oI/73cR1VaAxkeYefXR/F2ApA=;
 b=F+R7wxADX9c+DQMadJpwessnsPfdKi+BNp3QctQZOU3sTTbFb4zhs6HfkFPPaVmTmqk0vQ82pknbrcSEpgiDvxWPnB3OxfM2mQRe7k8f0qVoXmO8gS30M6telbpa2MN/QuRGTeqVtn99YuYWWi6M69oYAXMUsU4ufHVumOQgBRKWWDHdkD+axt5Wt8pm8gm6GdXus2Uh1sriMfX/kYh+KDfC0lGTnsqCg3Y3t5Wl69gt2c+LIGH+xp8IRcMJdbUOe4cbFgQU9TvWrvwLKsvMNP5DF1ON2JF9GWidn2XyZgRinLkWtbxTbW2gvJEHecFOG1RJPtGob7e2rsQn3kW9kA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB7172.eurprd04.prod.outlook.com (2603:10a6:208:192::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Wed, 25 Feb
 2026 20:26:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 20:26:59 +0000
Date: Wed, 25 Feb 2026 15:26:47 -0500
From: Frank Li <Frank.li@nxp.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 5/9] PCI: dwc: Replace certain BAR_RESERVED with
 BAR_DISABLED in glue drivers
Message-ID: <aZ9bB8IvnBmcbe75@lizhi-Precision-Tower-5810>
References: <20260225170324.4033466-11-cassel@kernel.org>
 <20260225170324.4033466-16-cassel@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225170324.4033466-16-cassel@kernel.org>
X-ClientProxiedBy: SJ0PR03CA0385.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB7172:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c31a26-5a70-46c4-8926-08de74ac3a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: SY6V/vsYR+d5Q94bP+b0raadgvJDkrCgtKM5vFWuf7V3VJZYIreHuQyjcNpslD5NDigX50bvQbB622V1avxArFL0UpCMUwjj+EI8RzU+HFq1WlOTIy0GHmd6lBXgddl6JTYsuu1ARsh8d4p3sa6Gsp3vWc1ht6GvU7c95Cw1dFMXQcS1wrb0uPpenTc3H8Ide3JA0wthl7UY2B0ydCGNSpB8WortT4aoO5zq+v1LNh6FDV/9ofwmrmVYmmpy4WqY/pofuLkXjEyNN/gzeUXvZG5qwNvVFH3jqpNtyLIo95a2OCiiHp7JxA2CdM74dHY7/AvJLpTsD5sqNH8a7jWN5ZKY77dxc2d88QLOx8Dbrt5Crbkdh/XYc5qhx8QwDh3v9Bfq7nnwDzkL+6SfNxQg+kF5s/nch4acQhZUS29F3QeF7BZY2rZeLY7xckIpmPJEY9pAfp6opcBAIvkoY41CBXDZWs6n+WR4jFBqg5YvHGm33EqNobWNcWn9DlySnX1wrnoWXwHH88McsS0IRRJ5dpVtzxBfsuUmRemnVAFI0uf+gs/DQpp7rNSdj12swglnDFaPjTmYYq3ClusLbPY60IEQ1/5KNnMhIYtFElUbr8leVpSsvjAeDiC5lundel4tbJmgGXMclTP1CtpDzkA1H6bEVMTmyq8FVkEY2Zf3caHeKtwl6OyuuflKgIP4QmeCrDX/35XnafFVHIZFTb7pB/SYaBKGm7iUudo3s5oAZ2IAVrV/q5V7WXRQg7x54Dciy6Klg2kdcZMYmkA2+NDtafgPkxo7PUkpHbQjt9PrfFk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/8jOnGrpSxNR7laNmHlCR6HFzbKbA+vAqxRFbYWIRz3flZGKQkTC70IyG2JT?=
 =?us-ascii?Q?bsuB1OEVBjEV1ZWafs6KwE8ZBmF4XhcIVzoNdKzCtRH9c4yrs3YW//XBAWGu?=
 =?us-ascii?Q?HNyO0KQxGtv5dvP+h/DDhOFodQwrwzf9h1A7n5ZXXy71FB/RN7Ewb/95fs+X?=
 =?us-ascii?Q?GE7fGXX5nc3dkOJX1+qFzvasTQ1KbvrRy+GmnB1fpq48TfczsdNNeXz8T0ip?=
 =?us-ascii?Q?RPIHxb8iUNue68Rdk6GM9Bulhks8021/lorHW2GRbBL3ECDQskHRItDKnLO0?=
 =?us-ascii?Q?4s5E4fBV1MHL66o1ZAlyMQSIf36jJzrl8KE6KxnFUMj8GAOjBNxnDioGDNsz?=
 =?us-ascii?Q?9Z+AjbSnoXEkMcJxRpheP0RHyK0NZEWbfZV0yOr7JeUcQO/U4oMbYhlem7Pt?=
 =?us-ascii?Q?5FHJGRRYkakoNodjWvTD2ZZarFB0Y8AuipqtoaLguTH3gjHupWRfSqPPqtx3?=
 =?us-ascii?Q?6FxDXw0Dbp0fy3jjKxJphCZtvPQR8Yao2Qzb0sRhAX7JgnSktsaSGeycFRJz?=
 =?us-ascii?Q?700cFF/Mi6PvHTFqNnWA9oSSoc30WJsD1p3vEESYKoc6YCncEBkpy0qritZ8?=
 =?us-ascii?Q?WxdkcWHH+N3uFSH9lJfud5Mn50V4R2CP+YvOwZGi8JeWRE95XgICcRQPsQRp?=
 =?us-ascii?Q?nG6VamzU0YT3vPpAy36Jjxt7rovyLem0EXdm1bghk8MFYU11Zgr96EbN8esI?=
 =?us-ascii?Q?UGs1b2Twq4ABsOUCrJ+q7+GSPUQ0IlUD9M6vKk8AfWTFrVP0JcSXDmKFhwJo?=
 =?us-ascii?Q?rzsT7EMwfCByp+CfnBQxEDQQB/bKwo2S4tEv5RPkSPKCjam4+E1q3nx6teko?=
 =?us-ascii?Q?JGvbacvU9lmjIfAAE19yOv/0AJZqNOMFM8DL0EGnkNrvfmHqC3s7Nz18mXsx?=
 =?us-ascii?Q?PytendAb7f0TXRxPn+jTlDXtEMKiCnO+O2XdNN2Xo3CAfoWVn8lYiihMQ1fV?=
 =?us-ascii?Q?b98xTjfrnLoCubiVhZ17QFaT8dQDLX9P3i9p0UaDAecICeM0Pf7poSCDbFPJ?=
 =?us-ascii?Q?/xvdTob6kvMFVuzZxGHNua8n+9XVN9r6kZXhrC5Mdbi+JJpJd4zjIObPzD3X?=
 =?us-ascii?Q?rigUWKm71zBWM7IyJ2z9JcRFb7XsZFc7a5rcNIFtSmHbZtlpO0jYixn2xUXs?=
 =?us-ascii?Q?wsr3Iq8Y3wxC31aBhf+4ie7rtqEy5u79RGQstLC7zrM7IiemPWj4NBH5tHzP?=
 =?us-ascii?Q?aknw1S8n/+i/awXag93RERfPQZHectmxnzdtW5R7NL134G3OBhDExpaimmRz?=
 =?us-ascii?Q?/orzOpLBG4I2U3Uer5p6VcHmtB8RRwnill9fHg7MTn9s3co+9DzAcWFDTdnp?=
 =?us-ascii?Q?mWwZiaXbaPkUbBkmG557S+KWVdh0BXY4/eDjvhRl6/Tb0ZMkEQ5zcI5W7t8p?=
 =?us-ascii?Q?tf1et/oEu4e7XcTObbvZqqL+WksdF6ki8L9Jv/RCJr15ACVjykRI9UgsSC9c?=
 =?us-ascii?Q?OjZvKjrDZXIQvCcnmkNMD8ZO+77if6TkVwIHmR3GGm+Md8PBw/NW+M2sYOtZ?=
 =?us-ascii?Q?p0/hm2PpgLXnLGkIeK0x7JcFD02VnVgOfNTnQ4viD8Jw1lWx3fl2rXIwZcaF?=
 =?us-ascii?Q?AgG18QxMtaQDOHZIcM+Qvl2NcNggGzkOiADuf+pkgNutuCu+Nvx3h9L5DPGG?=
 =?us-ascii?Q?zwXV4Rl9pGSCnat1VNyFMOQZ6z9w2SFquKE2e7LaeSevoQ3IcMAOumgqg+Wq?=
 =?us-ascii?Q?tX4uKEYJMjN4DHiWv4ddBKL8LogMJ3DI5QQkDQQ1FEbgJ8YR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c31a26-5a70-46c4-8926-08de74ac3a1d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:26:59.3915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnBXGN0dl1mK+hV31k5hm+u32Qj4CK0uer1iJ+u2SyzFj0O95rNHTrGsqbgzb8p7U1RcsK/FAc/YZrRuqT8vsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_122703_028846_816972CA 
X-CRM114-Status: GOOD (  27.31  )
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

On Wed, Feb 25, 2026 at 06:03:28PM +0100, Niklas Cassel wrote:
> Most DWC based EPC glue drivers that have BARs marked as BAR_RESERVED in
> epc_features also call dw_pcie_ep_reset_bar() for these reserved BARs in
> ep->ops->init(). (The only exception is pci-keystone.c.)
>
> An EPF driver will be able to get/enable BARs that have been disabled/reset
> using dw_pcie_ep_reset_bar(), except if the BAR is marked as BAR_RESERVED
> (see pci_epc_get_next_free_bar()).
>
> Thus, all EPC drivers that have BARs marked as BAR_RESERVED in epc_features
> and call dw_pcie_ep_reset_bar(), should really have these BARs marked as
> BAR_DISABLED. If dw_pcie_ep_reset_bar() is not called by the glue driver,
> the BARs are kept as BAR_RESERVED.
>
> No EPC drivers outside drivers/pci/controllers/dwc mark their BARs as
> BAR_RESERVED, so there is nothing to do in non-DWC based EPC drivers.
>
> Tested-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/pci/controller/dwc/pci-imx6.c         | 12 ++++++------
>  drivers/pci/controller/dwc/pci-keystone.c     | 12 ++++++++++++
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  6 +++---
>  drivers/pci/controller/dwc/pcie-tegra194.c    |  8 ++++----
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c |  4 ++--
>  5 files changed, 27 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index a5b8d0b71677..ec1e3557ca53 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1433,19 +1433,19 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  static const struct pci_epc_features imx8m_pcie_epc_features = {
>  	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_1] = { .type = BAR_DISABLED, },
> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
>  	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = SZ_256, },
> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>  	.align = SZ_64K,
>  };
>
>  static const struct pci_epc_features imx8q_pcie_epc_features = {
>  	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.bar[BAR_1] = { .type = BAR_DISABLED, },
> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>  	.align = SZ_64K,
>  };
>
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 20fa4dadb82a..278d2dba1db0 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -933,6 +933,18 @@ static const struct pci_epc_features ks_pcie_am654_epc_features = {
>  	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
>  	.msix_capable = true,
> +	/*
> +	 * TODO: This driver is the only DWC glue driver that had BAR_RESERVED
> +	 * BARs, but did not call dw_pcie_ep_reset_bar() for the reserved BARs.
> +	 *
> +	 * To not change the existing behavior, these BARs were not migrated to
> +	 * BAR_DISABLED. If this driver wants the BAR_RESERVED BARs to be
> +	 * disabled, it should migrate them to BAR_DISABLED.
> +	 *
> +	 * If they actually should be enabled, then the driver must also define
> +	 * what is behind these reserved BARs, see the definition of struct
> +	 * pci_epc_bar_rsvd_region.
> +	 */
>  	.bar[BAR_0] = { .type = BAR_RESERVED, },
>  	.bar[BAR_1] = { .type = BAR_RESERVED, },
>  	.bar[BAR_2] = { .type = BAR_RESIZABLE, },
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index a6912e85e4dd..9dd05bac22b9 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -422,10 +422,10 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
>  	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_1] = { .type = BAR_DISABLED, },
> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
>  	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>  	.align = SZ_1M,
>  };
>
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 31aa9a494dbc..9f9453e8cd23 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1994,10 +1994,10 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
>  	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
>  			.only_64bit = true, },
>  	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
> -	.bar[BAR_2] = { .type = BAR_RESERVED, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> -	.bar[BAR_4] = { .type = BAR_RESERVED, },
> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.bar[BAR_2] = { .type = BAR_DISABLED, },
> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
> +	.bar[BAR_4] = { .type = BAR_DISABLED, },
> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>  	.align = SZ_64K,
>  };
>
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index f873a1659592..5bde3ee682b5 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -429,8 +429,8 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
>  		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>  		.bar[BAR_2] = { .only_64bit = true, },
>  		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
> -		.bar[BAR_4] = { .type = BAR_RESERVED, },
> -		.bar[BAR_5] = { .type = BAR_RESERVED, },
> +		.bar[BAR_4] = { .type = BAR_DISABLED, },
> +		.bar[BAR_5] = { .type = BAR_DISABLED, },
>  	},
>  };
>
> --
> 2.53.0
>

