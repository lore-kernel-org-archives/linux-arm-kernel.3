Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6098BC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 18:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6D0L7dRD3X0aKxCfSUgowc2ATkrbBsTIgo1OEyWclvk=; b=CFMwdppsCMZ1VMqLEqe24/qp78
	/Fl6QGJLWihtULkhF2Qxl6zX89OEmvqsLPMuBIxu0mQ8O17HHQp0ECqLdutSe6PLSB8vsQfMaQWv+
	BGc0bCY09JyhntyPw6DeE4iqufTwRDc38Z+pX7ir+P9FUq01YAkA92PwI8rLAg6z7uDO+wtZ66oB2
	3TtSGnnwgJH1xpBlChltiQKnKYrVLSWH6qhLNwZ9ig23NU5TQPbjMdpAGF0iCkwlD8Bp3BcX+Z/Tp
	ouW6GCNK1oUxTmbDEe9mSJI9niAofvT2J4sg2J2ONBDKDF+bMJDyBjK5MUJjNEl+nVN8s7DCK4Dge
	S5cc2M2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTRC-0000000At4G-2EGv;
	Thu, 17 Jul 2025 18:34:34 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucTOk-0000000AsnZ-0qsk;
	Thu, 17 Jul 2025 18:32:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuPd5TIn6maiUwmu8FMooDJ4h4lUTbmdcelce6V6gBkrer9cZ1he8HjajNVyl168PZ7XZcZ/jnFqf+OL7q7MlkaPAuPYmGZXr7P1ACt2q25jsPj4bKnLWS9ErKOUVIn2l/0wsinGaOzMvTm1djL6uXtOB4FfIqqDoFDBiZw9WcG8/Nqt7MqQH7XL0i+k9h4qwQ8sMNaVlQ9vxOrthLFF1j2jEVLG07XjX+ktij0wH78FJfZ/waNoYSPTvwsQ+43egxrA19jHhmuTtWcHQbDNyEuQFwWEHooBd82mqsPNbynr2S0QVvN2LTq3eeb3ar2/dDkIPNem457XnP14ugAO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6D0L7dRD3X0aKxCfSUgowc2ATkrbBsTIgo1OEyWclvk=;
 b=EvQcVrkyjy821j4cXCKfZ/A/YyJm240mTPoYrduKoBFOX3BIm2lxrbLsxy4ld1wIQs7hqQq67vtmnB6agDPUIkZ8SqC3+UxUHHllPUnlndf0KGDFIZckzRp9s/6iFu8LKcqf2GM2qOfN3WfyBSlwkJ0yCVM8auTFfXZmQ4eurdYcpnP9+zkJp32+57ifv4Pzf+ZEBZkLX40NDgISvmF0KONSyJ4Wh715AWbFIkia8519AFGNWBN9juCfYdrGwh3ZKdwzQVGoMN87brpS4zqDiOfua7rBEqnViejRiFj5SWlrXtzip4h/DU7Yf2r4MqmPFJWuGWjyPjB9PxKqJu78jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6D0L7dRD3X0aKxCfSUgowc2ATkrbBsTIgo1OEyWclvk=;
 b=EaA6jdv0YAYRaQL8mVC/GpW8I3dVrwNwLig1cCXdZpN1V+vo2YL5+1m/CcqcYaPqLn2ylfJyELP5fJdFry7WnOHIADQCArh2uXx+XyKRxQBivxxB7lIhLOGkLZvo9KIA7xxT+/HcvXmTdWSL/Qd/TbkEIOBIdWQ73bdmlV3780IZz1mvy9H7wz/lz/w9Zh8Ejrepvbbg5Q0CeEULkKke0tDRmSjjnpQ4jooLYLkS97ak41TBFqDErChBENJSqFUOKqxT6F1vjqqSPIuUhVufL2HIzPtBI0OjmSBLx9tudkkhY1OaYqs5xtLhPUOaW0O8NvBE1+Wlv/ovL96NxYOPnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Thu, 17 Jul
 2025 18:31:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 18:31:32 +0000
Date: Thu, 17 Jul 2025 14:31:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 2/4] PCI: host-common: Add link down handling for Root
 Portsy
Message-ID: <aHlBfhYvNNOfqoq1@lizhi-Precision-Tower-5810>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
 <20250715-pci-port-reset-v6-2-6f9cce94e7bb@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715-pci-port-reset-v6-2-6f9cce94e7bb@oss.qualcomm.com>
X-ClientProxiedBy: AM9P193CA0028.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7216:EE_
X-MS-Office365-Filtering-Correlation-Id: ac29f30d-dd70-4bca-4f3b-08ddc560273d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|1800799024|376014|19092799006|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TpgGkWvkg5cC1Dy5q3kWidZjMLPWfhOJXLlghvcgFUAcjrSre+z5x+aYDnsd?=
 =?us-ascii?Q?BZdyRijKJ1VlQD5XCxIWkXz0Lf6bIqIxGaHFwYCJKM/IbZZKVfMPqeaab0f2?=
 =?us-ascii?Q?1ieWQPjuNNhKVY6lAGqfTav811gjaaU84//Vr+AeSnUToYs+ut4DVz/kttDF?=
 =?us-ascii?Q?1+9RzWV3jwklqzuQQC48tSRBXrjtidA4Cx9FBzUvQkyb8ZJ7YT61AqOWnfbB?=
 =?us-ascii?Q?1ZuInCh8RKzd7ry1lgbIrL3tv6tv4f3q5B41IrwJWbRdbHfx9h/SkYqcJ4KD?=
 =?us-ascii?Q?fZv4DqHuIJ1t94rfkxLzDQW7yg6kn+SvSQU3lr+w1eWnED3dwbBu5UggiOUu?=
 =?us-ascii?Q?z+9nnn9AIf0gyJwUByfPPiIa1P8rmoRtdTk7uBIaKPEHP9xGFbVV0eiVq+JS?=
 =?us-ascii?Q?0aVT50+v7gTUKeLvVAUw9SGX/H/rNPovL730ONOE7kBKD6w58Xn338DMo6cc?=
 =?us-ascii?Q?EvdQuAGTv6ijWsNzEMLcrjpHPu9gmJik/z8WRKU5HLIjICGYaywLhI3Wmkr/?=
 =?us-ascii?Q?gBUb8YzAo1e4F3jo9vHABg7ww682f2uUy3Gs7auzjIMqcD+xMa56jQWtevaw?=
 =?us-ascii?Q?HewfC/oqVH9bUkvaoVbUyHOW/qmVvFNkO0Yz03jPhRdQCDz4b/kToTUP5m/d?=
 =?us-ascii?Q?Lbae1VI1OeBtJwGt+GhE9HJqSAqvU5t/vXovndhGl5Pl9d1iPynPQ/14kCL2?=
 =?us-ascii?Q?che+YVHeVJWZ9KcTrD2YZmVGNybYatT/Hjy0fRBlE8/hH4MpnldRaKHtQcr1?=
 =?us-ascii?Q?LOSQ3aKyZddz8mrJdGQCeRq29zvNjTHQHMRkWx06i37WBTXoyZWr8BqtVOAA?=
 =?us-ascii?Q?8DFIvZrSK7tmrOafTIfBOSRkzKpBZVCrTF+hzEGg70+mUSMCFPgAUvWWf0I+?=
 =?us-ascii?Q?S3zL+3deMWGFxkFGnOfNq8XSANgDqQ/RA97Mq4AuW+J1ULyjp1QQfRSH4Xmf?=
 =?us-ascii?Q?+WhjTG5PJEl271m+48Piw4YMeLrkMz+cRGMsUCcEID9QgKk9FOg3nGMcXs3o?=
 =?us-ascii?Q?ZeU3DmEDqWSetKc3whNGITtZgpNU/68l7zr06TFAWiY/+GDdo6S0iOMYN8qt?=
 =?us-ascii?Q?kSGqLWUiyvcVc1zP1dvt6aZJ9v1kKePPaCossZUa5ZR0wwGvRFnv57fywXzY?=
 =?us-ascii?Q?MpVcQm+5LKGrf6mVW/Jv60TluJmlef8liZQ4nbbAmgVSvcPHW9L6jKQ+WOOY?=
 =?us-ascii?Q?v60aBISHTWeNidwTpr6e93eFQAgdtU42/imGS1oqz4C9Q/qst6quigZiz6rE?=
 =?us-ascii?Q?9bcgfg6/DBpxoY0knznJdFMbHmA7kVx5Ui5ncj473QH+uzJPrKjiNU1aEjPU?=
 =?us-ascii?Q?8R+plgOlhrvhrgRhdIInLP21Qt5ywdViOwQ72WuZ/k6Ql+XgQI0d0lX23zum?=
 =?us-ascii?Q?FIqhbo4g7rykLHKYl9J4yGAPklftaXDg3Dk1d+Ahgh1H+XyQGeiOCXuV5xTW?=
 =?us-ascii?Q?c6SALK1ODSa2WJU+zrK3QJElmzvQbu3F/G7ZiajLVArM+8OzzCCIEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(19092799006)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?afiABw8oPuRL6mgY0utr9OFQ8WLLnIXnBHuDBp/0W16hVWEUDAilGlJFAyHy?=
 =?us-ascii?Q?++oh3+rsGEMjpPK0t6v/Trg14P7QRj2CA6b14kjvX6gMVeqiNnOK9jXLhnud?=
 =?us-ascii?Q?+0Riz2nMOSbm+PqNnvWoOLiEyPsrcRCE36gAt5Uob9SbKQyGSKk1gRjOvFy7?=
 =?us-ascii?Q?YknVbWI8knl4SIai0NCq9FN7WLB6ERDpmegP2IlYWFwcF2x6cXUARemvmIIq?=
 =?us-ascii?Q?HI/a3iCCEXBMnHWcxXnQa+uN4eEERdT2YGgR+rPr9vimoltKt5B949Pmoe3v?=
 =?us-ascii?Q?rn3X2v2VZBLwIW3ai59Fh6b561u3hMx/TMKS3E/YJotddaMxL52BXMhMv6FJ?=
 =?us-ascii?Q?DFkK4PiZ27f7yNtQiTNKCnmsZjIY6TPWBzSUPpN0+mjVz8M8hmwudbC41Daj?=
 =?us-ascii?Q?tPE/bKvi6snB92BYZcD8D1ZKGFOwng+KgAROqfQP5PrJ2di2nIhGPrBu4KeJ?=
 =?us-ascii?Q?8S7qjiq+dljB4FqI3Jcw0wt4eW08i9ScyLclGesBhwlCDUsfWQpv/WLBUF9S?=
 =?us-ascii?Q?AVVA0hhxy44h17Zgcqg862JMuNRWDh0d5kIyARf77WKvYNhPmMJvYf03k5jr?=
 =?us-ascii?Q?1Gsr6VOxBYmYP7Tq6oWbFWJi3SBuYcyPDCu/MiTcSZpK6o8XfFbNyKgqMUOa?=
 =?us-ascii?Q?C4qA3cPgJ1MZBDVXAhXjP9mw2mjBR8L45vbb9ymmx98i8ezHRR1UlITQJXkU?=
 =?us-ascii?Q?ZbYES1qhgDSD+j2nN0Qex+jD51S+uIEnW4mNlCNF8V2Iaa5McSKXoXI8/mxX?=
 =?us-ascii?Q?UNaZTIGZYFLWgbJgJ6YBPs131qS+XxidjctPuGu0XObTjx7CQgc+QQc4lX58?=
 =?us-ascii?Q?rguDrHH4/hiFy+fMCW6Gobk6tdEFoQCotW3JleIEwHD7bwII8cQA624XZTco?=
 =?us-ascii?Q?/9osikpDVBt5Qn/j85jxGCu8yPo78J2RWQ2AQagjLknrkY/9dU94GSyRXdbN?=
 =?us-ascii?Q?Tgiy0sjMfzMI4H2TWL8P8eKcUn7VOwJ6WJstodFzISyR55Qub9aD2SMAfO74?=
 =?us-ascii?Q?ivXOnhW37FpsY8j054u9zkv2AtlvAzdC2fXmtZZo4U20tIDxEIMzJl7A5EiD?=
 =?us-ascii?Q?binUq71qEKCybjh6XYsNFQZj319FBAlbtY7bKxDnz3UGQJZQwboOiQK9njh+?=
 =?us-ascii?Q?2lsRrobl/jbRxwmPaZsqblr2V0V/qXkFRgBR8vpaRUAbAVreqHId7M2U3GjM?=
 =?us-ascii?Q?mpMnLh5oZ4FxWKgjKmTFBwo2AIwIFJIiax+oS6F6LGKWsuNV3PhA2sIPiSMP?=
 =?us-ascii?Q?RmiWkYkbbq6zRoTu6T4LjKD1LQ0/zoOr609I3ixOSp49xtvE5A4cnt6577+F?=
 =?us-ascii?Q?VLTq9BAhc1PbEvL2NAiKlivnHEhxEjw54UOdkzKETZYhsBFmzsvcM10UzPq+?=
 =?us-ascii?Q?uTApYXPx4NnI5F/aQNfPwRQOqCdKD3ECf79NWerFz1ZdmSsPolosElFgdodZ?=
 =?us-ascii?Q?uXYAyWoL05lRSyMN1m7Nez79qfyLY+YWkTbTYmX7E4R7S4oLmuY7w1z0EUyX?=
 =?us-ascii?Q?07PaJtmtpAefaPO41Tr3nPtwCejaIhTg0f6XlRNopKqHoaRs0rPYycYPZDtw?=
 =?us-ascii?Q?+njtOtM1jvaS6Yi8W2/nlOapkJWCYUKrhSMNnf3n?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac29f30d-dd70-4bca-4f3b-08ddc560273d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 18:31:32.3669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDTtbB2mCr5oT6jxmUbFaqDq88t7kHLcSWeFJGsngSxr9LLvCyx2uUqBflRQy9bzvNi0ojj3k2zqm1MjgXwHcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_113202_396773_464F476A 
X-CRM114-Status: GOOD (  29.84  )
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

On Tue, Jul 15, 2025 at 07:51:05PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <mani@kernel.org>
>
> The PCI link, when down, needs to be recovered to bring it back. But on
> some platforms, that cannot be done in a generic way as link recovery
> procedure is platform specific. So add a new API
> pci_host_handle_link_down() that could be called by the host bridge drivers
> for a specific Root Port when the link goes down.
>
> The API accepts the 'pci_dev' corresponding to the Root Port which observed
> the link down event. If CONFIG_PCIEAER is enabled, the API calls
> pcie_do_recovery() function with 'pci_channel_io_frozen' as the state. This
> will result in the execution of the AER Fatal error handling code. Since
> the link down recovery is pretty much the same as AER Fatal error handling,
> pcie_do_recovery() helper is reused here. First, the AER error_detected()
> callback will be triggered for the bridge and then for the downstream
> devices. Finally, pci_host_reset_root_port() will be called for the Root
> Port, which will reset the Root Port using 'reset_root_port' callback to
> recover the link. Once that's done, resume message will be broadcasted to
> the bridge and the downstream devices, indicating successful link recovery.
>
> But if CONFIG_PCIEAER is not enabled in the kernel, only
> pci_host_reset_root_port() API will be called, which will in turn call
> pci_bus_error_reset() to just reset the Root Port as there is no way we
> could inform the drivers about link recovery.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/pci/controller/pci-host-common.c | 33 ++++++++++++++++++++++++++++++++
>  drivers/pci/controller/pci-host-common.h |  1 +
>  drivers/pci/pci.c                        |  1 +
>  drivers/pci/pcie/err.c                   |  1 +
>  4 files changed, 36 insertions(+)
>
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index b0992325dd65f0da8e216ec8a2153af365225d1d..51eacb6cb57443338e995f17afd3b2564bbd1f83 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -12,9 +12,11 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_pci.h>
> +#include <linux/pci.h>
>  #include <linux/pci-ecam.h>
>  #include <linux/platform_device.h>
>
> +#include "../pci.h"
>  #include "pci-host-common.h"
>
>  static void gen_pci_unmap_cfg(void *ptr)
> @@ -104,5 +106,36 @@ void pci_host_common_remove(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(pci_host_common_remove);
>
> +static pci_ers_result_t pci_host_reset_root_port(struct pci_dev *dev)
> +{
> +	int ret;
> +
> +	ret = pci_bus_error_reset(dev);
> +	if (ret) {
> +		pci_err(dev, "Failed to reset Root Port: %d\n", ret);
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
> +	pci_info(dev, "Root Port has been reset\n");
> +
> +	return PCI_ERS_RESULT_RECOVERED;
> +}
> +
> +static void pci_host_recover_root_port(struct pci_dev *port)
> +{
> +#if IS_ENABLED(CONFIG_PCIEAER)
> +	pcie_do_recovery(port, pci_channel_io_frozen, pci_host_reset_root_port);
> +#else
> +	pci_host_reset_root_port(port);
> +#endif
> +}
> +
> +void pci_host_handle_link_down(struct pci_dev *port)
> +{
> +	pci_info(port, "Recovering Root Port due to Link Down\n");
> +	pci_host_recover_root_port(port);
> +}
> +EXPORT_SYMBOL_GPL(pci_host_handle_link_down);
> +
>  MODULE_DESCRIPTION("Common library for PCI host controller drivers");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
> index 65bd9e032353827221a6af59858c46fdbe5916bf..cb0a07c8773ec87838164e994b34a62d2c8118be 100644
> --- a/drivers/pci/controller/pci-host-common.h
> +++ b/drivers/pci/controller/pci-host-common.h
> @@ -16,5 +16,6 @@ int pci_host_common_probe(struct platform_device *pdev);
>  int pci_host_common_init(struct platform_device *pdev,
>  			 const struct pci_ecam_ops *ops);
>  void pci_host_common_remove(struct platform_device *pdev);
> +void pci_host_handle_link_down(struct pci_dev *port);
>
>  #endif
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index b29264aa2be33b18a58b3b3db1d1fb0f6483e5e8..39310422634a9551efc8aded565b7cc30f4989d0 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -5768,6 +5768,7 @@ int pci_bus_error_reset(struct pci_dev *bridge)
>  	mutex_unlock(&pci_slot_mutex);
>  	return pci_bus_reset(bridge->subordinate, PCI_RESET_DO_RESET);
>  }
> +EXPORT_SYMBOL_GPL(pci_bus_error_reset);
>
>  /**
>   * pci_probe_reset_bus - probe whether a PCI bus can be reset
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index b834fc0d705938540d3d7d3d8739770c09fe7cf1..3e3084bb7cb7fa06b526e6fab60e77927aba0ad0 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -270,3 +270,4 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>
>  	return status;
>  }
> +EXPORT_SYMBOL_GPL(pcie_do_recovery);
>
> --
> 2.45.2
>
>

