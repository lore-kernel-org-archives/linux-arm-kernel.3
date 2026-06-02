Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4886FCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 20:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvhA5ChVOcQ/XJI+Tcbc6DLIvrjkLc0iOPcR5ePR2Nc=; b=BDzoFZMlpfESG5ucjZSVn5j2Nj
	G4sR4bpXPk56JRi4inaX87g71axTddUDpVjzJJmGgqB0Ymfg0hArN2WOyFcGg4LN+EMmcM8Tmy7vT
	MJCOVq9KVNPUQwMNnf5Wn9TD/8g+w6cSl2905XkgFVXtuGN0polOLe+oRYvCOnqJBbp7dhUb57WjO
	KHzzzsCe7XwOlDYrnQzNPA6GVoisPRQd+gRG6isEPvX2qNBPrhcIRPip+Btp5yRNPFVwFf8fYewoP
	Gq4xZRYudZyZUj0PjHqPoboI0cGMoEXWk6mLeh1rgcK+AdFhi7oJrOFoheCvvqRxkGSTVmiLmEibA
	QEgRYrYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVtB-0000000DlJr-3Gsd;
	Tue, 02 Jun 2026 20:39:05 +0000
Received: from mail-northeuropeazon11010002.outbound.protection.outlook.com ([52.101.84.2] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVt7-0000000DlIN-0thD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 20:39:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oK1+vmjzAXm5SSNCuQLunK7rM4OZKm0oTKH8fMSMp6t65QdLCMOsTLjDvnsLY3p4YuedGCaMf7WeHyD/nsmvzoIAWzJ3HNibMH+7uptN9HLVOiB53zPC3N9YBSYmECRPVLlTdTPe5MrQ23U7IRT529zVfn0Ua+tJhuToZ80pW/gf6lprMKnCPcmDqoOOK/ckfFsf0FdLOrfk5hO3GvvqPDfkbjz5GDvnajldJcGVrf6vlUdN7vDiNHB+EmPZFltf+IVxaWs5qmFHKJ0GOaSMMe9fh0l7LGJASfBg3GTQoILDaXJYMf9jt388mQszi2erP8LuPVEXwvUQvb0xSPuHag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tofWZcrBvj/w0ajDKPePucgR5JZiHerCipC72hV4qIA=;
 b=iJ3kf4qu6A5PTvfP9f/hwl2CrRNDUgMQbaj5XnBK57FUC+3zjW5IxJY4moD4Jezw3q3IFu2XlnMQCJcI0pndsVlFPQUj3K336ZHku/YPt2H9NowdtRlSzb0WkD+b9hVhV136El8KQDsGKPOClOGqnlTeEJLHuNhWNO6ENp8cnvKplU8QUcPQG6WQvXeBPvmWZHAtkhmqT4O5aWAi3y8iRNqnGmOumiR7jIEz59hpP/8cLFOs1K1bW2TDV/6E+eJcvXUEniok9VdcV7/1SFpK15xlT58owSvKp6ikZmfBsiXVHlmQWcLXR6oDys/Q1z38LjuGtyzhfbFqHyT4uzgUTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tofWZcrBvj/w0ajDKPePucgR5JZiHerCipC72hV4qIA=;
 b=gXi04hYIsh9zl/tbCD41iX3771lDiq4WQDSkAI9+AFrdOqxzi1ZwuV9qdxNJEyqYj2vMsU858tNxTLOuJ6+DXTw5D88dSpmO5EbIkCayBJECrvkGT+yFA8J415NR/zFvI8UDR5qXeYHYJ7d0r/BDlj69Ss+cAG4aMVADtfq2EN9y1O4Wih2t/91P7OhpDCVd9ZQHVPfjK1wHRYh8FtcnR41IIZ7hDlXy+hSwgGEUojsgZ2jpwX/kWPsfMzHCmbbGG7dMJhzG9OE8mJsQD8y6Va+6bzzHioA6TsRpIvx97Yepu8zVOweNk11gxzmXBMfsxFlAmiJHdZKeVC1zqXX6Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS1PR04MB9699.eurprd04.prod.outlook.com (2603:10a6:20b:482::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 20:38:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 20:38:55 +0000
Date: Tue, 2 Jun 2026 16:38:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: freescale:
 fsl-ls1028a-tqmls1028a-mbls1028a: switch mmc aliases
Message-ID: <ah8_WDMsJLIoEJ-y@lizhi-Precision-Tower-5810>
References: <20260224152523.570057-1-nora.schiffer@ew.tq-group.com>
 <bfd19beec4ccbe296cdc1da865b15caf3ad1e5cc.camel@ew.tq-group.com>
 <fc375090851c17e069d7271f99ac4f75490a9a92.camel@ew.tq-group.com>
 <2b4b5b6ab51f991d859e52c1572008ae715c650f.camel@ew.tq-group.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b4b5b6ab51f991d859e52c1572008ae715c650f.camel@ew.tq-group.com>
X-ClientProxiedBy: PH8PR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS1PR04MB9699:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bfe8457-b0d0-4723-8808-08dec0e6f727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|19092799006|366016|38350700014|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 19qnHJeQxdPLUECyczUtwb2nECnOkFjcsGZ/Fw+VajweNwdE6WM4XKDLXX1cmX4JBJdN1PTRYjc1394DB+QcXrtSqmzVkw0O0QEZLe0hg1Hau2vt2eFkXUOcAFG88u4LE/4OBmOZv984enxckK2bG9ASrFVygoHMQUMA7ygmNJQwiLYxVx5cHf42okgwq9NUG1nxpHPf5r/gg3SZyYYCFmLyqkzbDXO46zySOLESYFVWUuciGtWEo4wEPlK9UZ9X6MTpkkvEhOeZA01phNoN07zG2k16pPgoqPQaHUsInVGncgkshHga1/PaZFSdeltfeR/VOb7G1axAADpYZa1/8FwLHvVwlBnZ0DkRViqRioNLPXa6Hgbynt3yUOgXHIs4Fh2yvNF5THWH5Qp1L6FBk1HR44oKKLPcZvaVlgXQXU/bnlOkYHWWoEWSeW7Vc8uhd+HcqRWGPPpZrPOE1MmUEGehAID/rfFmjCkpPAdsZt4F2ZqBJkWqhhWcX3RZphrO0nTfKuF/F2+hzb368dJFOaEUr8IHBa843aLX4hEQOf9emW+/Z/rh2KGladxZ9c+njbupCaIXqxhK99CAhcEAHtcoifGoZy50Lbc2KgExA93jmhg+Rzdl2XrXN7uuWYUe9QdLiFf9ICZYQuE8Y6sY+4mfCDu0e9PneMrEWcD3jiI7xoh4Vn+/Tad3ok3bkHe/MA0q0lvTmgB+TeVcyN0qgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(19092799006)(366016)(38350700014)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1xJHM6aNUKO5dd8JemqoTHBdJdYx1C8mJIBFqRIWey5nGXhjyslgTrSsJd?=
 =?iso-8859-1?Q?jR4wxnKvXR35FbTyyQgadWncuxQXzTsgMF6TB2Zs/7EbvtDXXjCOnCqpXq?=
 =?iso-8859-1?Q?EVFBvi0QlXhti28O15fdDG7zFLgbVnPQGMk7F+0SdGD9XEJb0cLsqm5zGs?=
 =?iso-8859-1?Q?/YJekBDGB4Je+D/YXV30H2ttRbHD4e/FYLNcNiNdbxdQOETLuyHrlF7R6H?=
 =?iso-8859-1?Q?smT/GQWh3F58ZVqBBjUF3MqJ11H3acAid2QjD/ZwS9Z/Taa+5QIIp60M0V?=
 =?iso-8859-1?Q?kw9PgJhjx5HVl3qWVJ4XjqlaOogcUc9iMLtb70pzfpWkGXYs+x3kC+tS27?=
 =?iso-8859-1?Q?SoMDdkyHRx66d2CTqrk4O9eKW3N63GjiRQop2QMLPk7Bc9JBBDtV+NDNxw?=
 =?iso-8859-1?Q?F+Y6Ez85lu39d/O+0g1HaMcdVd59kck2Mkib/Xnr0bmrT1c8Ussa6Ebeh9?=
 =?iso-8859-1?Q?aJhr+ZACtDsdRfmabRvdE7xPyWugcgPxyht+zzjqxeqP9gYdPGVLBrYtHS?=
 =?iso-8859-1?Q?Vqk7z/LcKFDQqxGEJkqV8EW8IpAyvFiAiGE2hT3vQWjdsPy4VVjJMKJTsT?=
 =?iso-8859-1?Q?fU1FXTwkFpf4do+dCBR5UIoZ4i8n7UYR6B+xU49qWEbwXxVwxnH46gk0Hr?=
 =?iso-8859-1?Q?Nblzv7uqVcSVxBbbst02GICdOuhrduaQlBhSXLzzeAmP0dDbF3KW2Z1rdd?=
 =?iso-8859-1?Q?JhiVG25V73xhbWeeJYL7xyO1Pl5w6yJUK9LmtP65EG0EmMSjIQ4N95x5Fr?=
 =?iso-8859-1?Q?FfQYEhAT2PyFOkBkVEefO8Nn4Fwh3/E1v6ot/px4lq6fTpWIxNAAe6DQaO?=
 =?iso-8859-1?Q?RwReRTrPB8BbwyXKLbReuOVWCTotHYTvWp9eCoCqNMT5ERLe+w4KRibWRL?=
 =?iso-8859-1?Q?eWvst8A/ZWoSNXrFvKci9xF4xTbeaQF2TH8XAtAgbu0+PTUzY5gX3XdKj/?=
 =?iso-8859-1?Q?VIFAFsa6OhEM/6WL7iTc18cB3mUnddyHcpPpNEnkujGFo1AqoxsT8SzOe9?=
 =?iso-8859-1?Q?BEJ0esqFiQz8n9urlVkGVzv+h7LX5Q8hr+zhCe+mAONO2h7Z3gO0/nqLrk?=
 =?iso-8859-1?Q?UO1Evz515NTXsy+TxFhjFQmjyNX6TIGW0u0JKjVCZhNN47R6tyd1fikV45?=
 =?iso-8859-1?Q?kjL/j79JihC2WOeTRvHqjBMuCiNISgnesX6LGY6k4mEaG/S+ac+/3l0JGD?=
 =?iso-8859-1?Q?+Ue7RGaJCn75V6vqtbyNnr487e8jlxQCgPjLxO6lPwwABLtjP5zIp/yl8K?=
 =?iso-8859-1?Q?1oQqt0ifLfm3M2esLsgZsKpDArbEmSqWV/NNON10ILh2OvRKjWGXGLD5Af?=
 =?iso-8859-1?Q?fCkg/vt2q2WDn48QeyeSt5lUAKuQxlfqNtTXm5vpJAGwwJ3XP1PIo/Jr1x?=
 =?iso-8859-1?Q?w0PhCDn6uwpmUIqIVUnJ2WZ6gFs5hsCVsYr3tRqTME2k1ephRJayPisB4J?=
 =?iso-8859-1?Q?NoYiCNemhNy5kyfg+naBnPjkxnTUcvHhryn+syPcC4kRX5tACKBBScIge6?=
 =?iso-8859-1?Q?iMFNXLDV0MVBVdl/koA4IbY9iaBU2J5DDkG/c+qzhOOyC+pWci+ZlQ1aff?=
 =?iso-8859-1?Q?yIxaq3uxLtDRYx16APi5QsS4FlUyJCGR+KSLh3VvZDcCPH/UGMWUlLZobI?=
 =?iso-8859-1?Q?9bRrnE/CeXmGgcOrMHDkTdsC/XuMq8RoRNwLl0SfP0sZVxSAFK3QzbBuWs?=
 =?iso-8859-1?Q?QmgJhR541JRuTpWNV0qRMljaUFvqUCwqmXNQaQ7+z3uQyUdQ2dgkn6q7Qi?=
 =?iso-8859-1?Q?EIICqZ7+Kbawh5xR13oS7/JqmIpiBWubzfM12fPrE/XvRR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfe8457-b0d0-4723-8808-08dec0e6f727
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 20:38:55.5863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAE1lNssyvBGyYaRwjt4UkJ48np6/TNBqtF2DllKtdqGoAW1e09C4rEsSMnEzeRJLqBHwWRWGRKQw+Zi8dr04g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9699
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_133901_253544_79748BE9 
X-CRM114-Status: GOOD (  37.86  )
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

On Tue, Jun 02, 2026 at 11:56:10AM +0200, Nora Schiffer wrote:
> On Wed, 2026-04-01 at 13:31 +0200, Nora Schiffer wrote:
> > On Tue, 2026-03-17 at 09:29 +0100, Nora Schiffer wrote:
> > > On Tue, 2026-02-24 at 16:25 +0100, Nora Schiffer wrote:
> > > > All modern TQ-Systems boards follow the convention that mmc0 is the eMMC
> > > > and mmc1 is the SD-card when both interfaces exist, reducing differences
> > > > between boards for both documentation and U-Boot code (which uses the
> > > > same Device Trees). Adjust the recently added MBLS1028A Device Tree
> > > > accordingly.
> > > >
> > > > Fixes: 0538ca1f102d ("arm64: dts: ls1028a: Add mbls1028a and mbls1028a-ind devicetrees")
> > > > Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> > > > Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >
> > > > v2:
> > > > - updated author information after name change
> > > > - collected review tags
> > > >
> > > > As mentioned in the v1 submission, it would be great to get this in
> > > > before v7.0, as the TQMLS1028A/MBLS1028A was just added in the current
> > > > development cycle, and we'd like to avoid changing the aliases after the
> > > > DTS was part of a mainline kernel release.
> > > >
> > > > Best,
> > > > Nora
> > >
> > >
> > > Hi Frank,
> > >
> > > can we get this applied, so the change makes it into v7.0?
> > >
> > > Best,
> > > Nora
> >
> > Hi Frank,
> >
> > is there still time for this patch to make it into v7.0? If not, it would be
> > great to have this applied early in the v7.1 development cycle, so it can get
> > backported to 7.0.y before anyone starts relying on the current order of mmc
> > devices.
> >
> > Best,
> > Nora
>
> Hi Frank,
>
> how should we proceed with this? You provided your Reviewed-by months ago, but
> the patch never got applied. It is also marked as 'archived' in patchwork:
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20260224152523.570057-1-nora.schiffer@ew.tq-group.com/
>
>
> I'm not sure if changing the aliases at this point would be too much of a
> breaking change... would it make sense to resubmit it, or should I consider it
> rejected?

Sorry, wrong patchwork status let me miss it. I just applied.

Frank

>
> Best,
> Nora
>
>
> >
> >
> >
> > >
> > >
> > >
> > > >
> > > >
> > > >  .../boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi  | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
> > > > index cf338b2e80064..426a81e1743f1 100644
> > > > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
> > > > @@ -17,8 +17,8 @@ aliases {
> > > >  		gpio0 = &gpio1;
> > > >  		gpio1 = &gpio2;
> > > >  		gpio2 = &gpio3;
> > > > -		mmc0 = &esdhc; /* SD-Card */
> > > > -		mmc1 = &esdhc1; /* eMMC */
> > > > +		mmc0 = &esdhc1; /* eMMC */
> > > > +		mmc1 = &esdhc; /* SD-Card */
> > > >  		serial0 = &duart0;
> > > >  		serial1 = &duart1;
> > > >  	};
> > >
> >
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/

