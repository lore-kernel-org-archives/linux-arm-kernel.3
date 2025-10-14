Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABCBCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 22:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3yCRcO1O/Fc/3+wF+IU7bzNlu2Y3ZbOjG+Dpc8/xLY=; b=gM7+1JbBeXA9jOtDJVAk9AJ4gd
	C6gip3ClD79AxrE8NvrdzC7u3nfFO4UBHTUsFCwS/9wfiwcqW4ZbEmsqj2bCnfdfUXN7mMF/j7lin
	Rgp0Q53/oSOD76jioNE5w+B2icErvZZ4XXE6wSon5QIkvnfkvYSEJljYuEkg/WI5cY7jd3ThV9nJD
	5e4a1K5R6Xzej707eCSvbmhbzx0T13Zbcx0hcuQsZHXjV7FEB7K1RPj+Mjghz2wLq7UwLmaJizCkt
	mh07f0vomVgJsRmxNfvKK8tbCC3YUUfToY6ivutkzXUxDH0R/3pnPFlcXKstLZjonEzWKTq8nn9GS
	pHfpwIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8nOS-0000000HXlV-2ccw;
	Tue, 14 Oct 2025 22:21:20 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8nOP-0000000HXk5-3buk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 22:21:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjuQLQj1PgDoxXnZ79Gg1QckleLvXXMSUpCQyWBagfza6vVJMwwTkrk58H5bAQhdejTFovzuO+Z7VeNq2IQwP1Wt8gpZgJSZVdT4CMPb4jffVqzlImugzL4b2wcCHxwpm1EXbueyF5mZB3CaO4voPWBYWqm0YTwP+fmAMp81YTd6AFmf5MvxE/j8/2ncfF8s9HGDwG0esGAW6GkdNvNmpGB4SjVXmXM/WPl4HFFFkhCECrIUA/usOdiynk22CN34Xp6a9S2WWrLU5CC9uNx6xGWu41LwrzSdb5V09vy69etaVJGwmfaGZFVsdRxZZnW9FB2XzvKLJB/N/s3wrL353g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3yCRcO1O/Fc/3+wF+IU7bzNlu2Y3ZbOjG+Dpc8/xLY=;
 b=qWPtNXqYbM7sMJxj9IMcnTILoduOI0ojoBfENCmJTx3qIsMG18eNH/zyrMIFIeC4dSpzYCcMCOt/a1gZc18lPJ+K0W5CSmUxt0p8Pmcaax4p+5rfsv/zPBpWzQxFSO2QgIi0t6JcMa1Ha9WmP73WqzGUAIZT51CMtdnULolON2I4/nymPqB99hrfOUOFHMzYfXseJtsCai1VYkrIFXS9nQqQ6wW5eviiXkIbvN7CL1Sm37OV5nEpfTMufBSCseG1SpHISaV/iD+dLfQhjlPUjM+erpQHQMmRhe4BAVL8OhfhVgoDTni1vG2kvHLyz6XhonBhejTikVqzmptQKfDFeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3yCRcO1O/Fc/3+wF+IU7bzNlu2Y3ZbOjG+Dpc8/xLY=;
 b=eAdjgHH7JQejPXymFUhSyv1uM27XJbLL4MRYwGijX7e/VPA8YltdFOZtJGPEfcE74rnueDayZ3r1/KXkfRV8EF4VgReegEUbue4w9SW/z+LJ6htp87dQ6SKWLzYwGI2dpt6+VHm6ZNwuh1iSQ+VHdtmuuEFdToFXN5yMKVOZmiMLSvUwXmMfM9AGMnH1Q1uvuPiB4ST5/U40QHi2hXil4uJ6pciQp+aRdVqiiddbHgRF275Ak3fEXB+Op0rMfuQFsM/iQcklJhDP9ZssAIfdc5dAg0PVfztxuxpax0sOsjqchk6Qqd4zOyr9GQag5an3g1jT3aLRE2gqEXdkCx2cIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AS8PR04MB9045.eurprd04.prod.outlook.com (2603:10a6:20b:440::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 22:21:03 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 22:21:03 +0000
Date: Tue, 14 Oct 2025 18:20:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Scott Branden <sbranden@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 2/4] of/irq: Fix OF node refcount in
 of_msi_get_domain()
Message-ID: <aO7Mx11tWFbDX8u1@lizhi-Precision-Tower-5810>
References: <20251014095845.1310624-1-lpieralisi@kernel.org>
 <20251014095845.1310624-3-lpieralisi@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014095845.1310624-3-lpieralisi@kernel.org>
X-ClientProxiedBy: PH8PR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::17) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AS8PR04MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b43d9e3-ad5a-4573-e710-08de0b6ff5ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BTjcchDBJElvehx7SYHeov+U8udcwEQ+/kZWp5bbNM+hCEkqPshGcIpGh5Wl?=
 =?us-ascii?Q?W8CHrqLQSrybp9OFpyFnT750LHAg/nh2N33nNwmr4CJztU90JlN1PqdsEajn?=
 =?us-ascii?Q?5YHWcvEtbd4YSW7EriiHQAVYJ86UV9Z1ZKx9ZnhxXTweBPOe/SNKCGm4QS8Z?=
 =?us-ascii?Q?Pwfltnweq/5AIoV5fkSciKcwWL7GIoR6uQtfFKhy9/Xzmlq0B/lkD1eDkQmA?=
 =?us-ascii?Q?PPfg1dq9gD3/IrgXlQSGUAehEkA9SiKPyPkICh0xMLSe4jVRe2+iomZMlg0w?=
 =?us-ascii?Q?iUOGDNwoyOol1lWApo+Zq0U7C6EvAvvqQa42kaoIK8I1CnuCbiMU+CKalIRU?=
 =?us-ascii?Q?Z/ynyzgv59SGuUjm2jbHcFX4FOb/66ZxsTIj066uOwbCQsuUGRaeDB7YyMPP?=
 =?us-ascii?Q?/7WCblik5H8/Ag0yp9FgEsr309zBQE9Uaq7P/CHCvflAGWr91KwkiMsSHrIo?=
 =?us-ascii?Q?rvd7ERUbIoDIyfR8OOZOOlEiKij9XgA/V6YlPJA5niKB5r11GhsTh8eBMJ/Q?=
 =?us-ascii?Q?cjiArFNwb3Nc9QHjc9LWfhDO0UtLBW300TOYeYWvvrbIB2m05R2S9uoRYHG4?=
 =?us-ascii?Q?1TvKBxYLG0yT2oP5GQbPEVry82qh/FEvziYu5eHHmMd0u5h9R9pAI/9JiEXO?=
 =?us-ascii?Q?yuATWm3ERY7HhSD1v0e2ywRoTcVfawRQ1Pi6MlUNkXZ49uo1rvumsile84ml?=
 =?us-ascii?Q?/q6fasNzR3MrgxGUe6QiK7hXbBXtld8+FBVldKylom5OIl7X4rt5YrgtL4p5?=
 =?us-ascii?Q?ZaZ4XmDWQv6BS8U1T/J2Iu1p6DnmqNKDE+dDwqAN9VBhrsKmxZjj5bihEX2z?=
 =?us-ascii?Q?zaJUIN+sL6FopmGZ7Ys5/XHvCbSN8xPD7uPYJH+/cHxdOiXvgEQrr34+9nJU?=
 =?us-ascii?Q?XwvbHZ6h9BJGb5fSTvW+1argmhSm80RzS54yYzu4JAwFAljYkV7wmmjiiflc?=
 =?us-ascii?Q?R2IjkqNUFndBRXV6Npl9COhrGckDKms0wh9NjdMaI1B+4AWzDa1HE/yoevar?=
 =?us-ascii?Q?6qlVCsdbviBDS55E4sP6k3U3ZH+VOcLdztX0CrdW+vHOigSleY3I9Lxm6NLB?=
 =?us-ascii?Q?yc2gHgojlotzjJZZRsXRgy/0lPs2lY4rFUiSC0cLsaGr4rRrS7whqMOJlaA0?=
 =?us-ascii?Q?lOpse8Sk9tR1EZ/KiP6VVr5oiRSAp80u3iIp0oG/Me+i92hf1kAMb6pPXn7f?=
 =?us-ascii?Q?3M70HQMQiIfKF1r91XQAFAgYQzBac7j9aWD5ODLfQ2MO/O3u6kocJBvNMqbz?=
 =?us-ascii?Q?YhdS+jvPpN6WIsqIzbGF861GwUmSAHrptuX7fQ1hLqjaHOemHjKKaEQejPbA?=
 =?us-ascii?Q?kNGosf4oPeO9K5Gc4bIkNM0sR50NQI2Q2jTqgpWw3WGVeHRvVJJaV9jNGP9g?=
 =?us-ascii?Q?hcZfOvwP6ztF5+hXuKaV8AU2bNSXu89ibGsoDBbQDsVl6QiTyLkHir1UmZ6f?=
 =?us-ascii?Q?mizsBJNt3xEsNs6JlojH5dpc/25fTSJqh4+GgvbQsccmqL6CXa38HABDUvWZ?=
 =?us-ascii?Q?KJ0WOj3at8xI8d5zpXiceLDHXETKc9c4yXNB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rFYrXesA0kBG4/3ReSg9xEHBUj453jtnANtXSAZoo3eOEk4UiZZABugi1zF2?=
 =?us-ascii?Q?WxxPCvz8891zjkGjWNVv976vfeLGWiEQRKivtghkZgu3zy/iNgY4WPdEOkAi?=
 =?us-ascii?Q?O0OY2EWLzYKhL0u9VLFpgaqFXCwWjKUbktJHE5fYTcPllZ9CwR8ggkgP5ewB?=
 =?us-ascii?Q?lWQ8biXYvotcXC0QNA/iBBi9rLmAJ47uKebCgUEPTKQMzqqV6c7LEkPELtth?=
 =?us-ascii?Q?eSSax7hY8VBhLJkHNkXAKx0CWtb/zZxHHu4nTSnFBKUtnft3npZZki93FLyc?=
 =?us-ascii?Q?xDTyPk54gTg4C6++heaIDvCGuNUT9ct36E0cMiuc1BdJvw3DNCiCqnIQ8Mmo?=
 =?us-ascii?Q?hA/k6HrkWZPasRESmbCoeYPlyPmMvJTrclCb/I9NMWbST7kVNPXMWqiJJsmQ?=
 =?us-ascii?Q?tyDxIajnupb66Ih4wvaiwWcWhICrw32of2PHQc5LTw8ILrvzmNfyAixxcWRT?=
 =?us-ascii?Q?R5NtseO6REvUQarxke5t2deltLG2YxUfBFTdSKf6A1RUwm5e2S7Y6YU0X4er?=
 =?us-ascii?Q?7rulOWYkTpMkD1l/2xb8EyDSA4kK8GPhr1z9P4dSgFaHg4Irf3ca0ccKmGxu?=
 =?us-ascii?Q?WHlblEsovVr9ZUstap1Q1AJr3DTN/M/lAMVBB4nF0bjam6Lg3MHA3je2+u1T?=
 =?us-ascii?Q?JeQNAqge/RtjCAySTjgjO7m3b/ovXU2N55UJ67+080gQ41mjN1GdWA4jnkFr?=
 =?us-ascii?Q?rq7+mvI/uU2FUk1xHoMmqpXF+vZUPksDsv6h2ACLXptVVynNIs08UC5uU5OO?=
 =?us-ascii?Q?JBNTQ/g2NfQH4Frx3f9Qv5tchWvxcnO6ICyxH1tQpqZe4bYtlZvQjqbuUUl+?=
 =?us-ascii?Q?Zw+ffH2UBNyBMY/L+Qezw5MOwA/0sqL51zO7d/QA8uckUUI7nZm24aYWL7pW?=
 =?us-ascii?Q?63Bql4fFxhATNdwgt9FwsYpoTRa3yGiUju9SdIqi3BlulFF/AMl8Ec93Xgic?=
 =?us-ascii?Q?XSjgXOvJBo/w7fmC7D6CdKkk0rt9S/ZJjiHyxKzKnA8VX5Vkp4lZ4BTe2SC3?=
 =?us-ascii?Q?4Xfr97znxGFQOkaF9gnc70w1WKp4QcfM1V4B790EZhV/J75kuo/tZ6Pvv7sA?=
 =?us-ascii?Q?5Xnz2nibNmy3TnXt9F59o/W3NbwrrSooB9NEAz7/R3WT3s/Pim4DU7R/AF1f?=
 =?us-ascii?Q?/n56qm0/QGuZJW8mxeoBA5SN7xNo518oeELw+wom/KU3v96P/mm0OEeg5QoW?=
 =?us-ascii?Q?eS+vKuw7ahS9fTTxMXYKG+iqKaNi+DYwpv3Og8I9lOH4bjFUvFwl1uxHEcQS?=
 =?us-ascii?Q?Dxj+9gze9r4CgeLpol8loHGygoAvi5vZzSuW22jKaVaWma8WbhZUYuT4AzN6?=
 =?us-ascii?Q?WvsRRB6sPGXoPNQzUzW11+zwYNrmaodEUTe6dllwdSuhzgSiOzthrjL+Yn8m?=
 =?us-ascii?Q?7yHzvwdR2Qt9NqcYqh2CYpwocbs5liYE4+s8DMJ5IUUB1ITi8rY4Y4cBrtHe?=
 =?us-ascii?Q?qYdgb2BSZkHdVG2wU2Z1n/V01yWd5GDUfAoRa45BcFelcPiUsTCeT9Yrgvrf?=
 =?us-ascii?Q?8Itn8Vdc4EmM6AgR/zYbVk7b+fanXty3/5XRACWj2b3oe6UmImaEGOz6sQs4?=
 =?us-ascii?Q?0ecCammY7TwfFkGo3os=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b43d9e3-ad5a-4573-e710-08de0b6ff5ff
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 22:21:03.1175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2JOULJhQWo/bnIqAEeB0pcgw3OrN6aoJ3/NmrOoMGgcUlXf/JGUXc8xLl6ehZhO11O5Mezx9/X0BNZXwCn3Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_152117_920632_C2B4103E 
X-CRM114-Status: GOOD (  19.63  )
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

On Tue, Oct 14, 2025 at 11:58:43AM +0200, Lorenzo Pieralisi wrote:
> In of_msi_get_domain() if the iterator loop stops early because an
> irq_domain match is detected, an of_node_put() on the iterator node is
> needed to keep the OF node refcount in sync.
>
> Add it.
>
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

After go though of_for_each_phandle, I understand why need of_node_put()
at break branch.

It will be nice if add of_for_each_phandle_scoped() help macro.


>  drivers/of/irq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index e67b2041e73b..9f6cd5abba76 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -773,8 +773,10 @@ struct irq_domain *of_msi_get_domain(struct device *dev,
>
>  	of_for_each_phandle(&it, err, np, "msi-parent", "#msi-cells", 0) {
>  		d = irq_find_matching_host(it.node, token);
> -		if (d)
> +		if (d) {
> +			of_node_put(it.node);
>  			return d;
> +		}
>  	}
>
>  	return NULL;
> --
> 2.50.1
>

