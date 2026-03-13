Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6DB107BCC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHbl8yRpI1/LjTe67wCgC4LMBe5xireGe3tS97yd9Is=; b=i1V2L/qn4fsIRosUXGEfiyMdyv
	UPc6xFJMpjv5T+qqcUCOIRPesfl4hM+3475x8vBrBvi8Bzau8MqM5U2O+OljWAQZPVj9X8oh1ZO39
	smmBdcPcP8LAiE6KSxW73rMv47WZ+Kyuw3bHhoAEvYX+stPBiXLom0zuMYw/BQ4K2i4WEeIZjGR5x
	+qTFZjAxSPxwBsTLwAZvaBw2dPxlcJhii5uGXKyJxrSFWomKMQqXyPQBrmP6Ppsmzvb9lpNZPqVtG
	PMMqaRwca1Mq4lxmUgRh4FrzgDaHXufyBz7zT1aWB3st9kQorwXvGhNhCpcCVl2BVKBWNj//RhguX
	7tPePIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14zT-00000000boM-0dYU;
	Fri, 13 Mar 2026 16:03:55 +0000
Received: from mail-northeuropeazon11010019.outbound.protection.outlook.com ([52.101.84.19] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14zR-00000000bn6-0JDH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:03:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQKvqoTITF7FTjYQMn0b1fr3Mdf0AGw7eVqAAHXU7JkYH2gMBc6yWIfzPhJJQmx9UBaE3NfetJaCN5EaNGEMB+RHv5a4vzJd4KQkn9Cl2YYw/bhDqAU4BoiCmW9CSNiaZVoZhuYN558tQtXC1BpcFz/VFf2kmVwKX8F7UoPIpB7WC/LP5dezC/Sxbsf+Wlk8/Pt8HtMrs8DTYCaC4icnJ9KqWMEoLhtwt8Iw7ZwOHb0qB/3b3yiTpvi9MQu6XsK8eYQr0SzXx1QYEcYxIRoQNPu3tjN9WrYa0WhZ46QBUnyLX/adTJ7BW5Un9Z+Ev6xwsiWv0Puh1oxFK4oq+Yo0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHbl8yRpI1/LjTe67wCgC4LMBe5xireGe3tS97yd9Is=;
 b=bhwdkcH8idsMDzbdZlk/k93zJXzfXrgeiJR0wCDp1zolYf+OxLX0I/vPHj5VEYxAcMbMs8Z/MQoR1eKA6i+AFa6QfOofOEV/66Vpxx63cyEOd1BHWyVDHObzcD//BLJB6VlMJIiLXgs8NTvCCJCjnggrz34uRy/SzP0fMi+GBwnwc7xRIvDlptFG7lUlJbIuPi17UGhnuHdlLWruCXzHk9TcN9VY5mKUepJaWb4YHkwzZNK6NgiiqcfX7XNWTvhdkMAePoF8lTep55zxgzyOi8wJdxwqu7GIt2uGXTnNOpB1ma+lO/J1uiK2rltYkGOPV8fL17+EcUtc0l7hFcnGPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHbl8yRpI1/LjTe67wCgC4LMBe5xireGe3tS97yd9Is=;
 b=Q/P26N6QxW0L62MConjRXWWOCjiYKtfQitvY4Hxqe5egKY7EQaZezomW2j9mp4fT9B6qbO75VDVGCrvKnITV6P1dIKp8BBD5xpG4DgycEwpGiPL3tAN4Lbc+/BpMMEVc8pzKse0661cjL2dJI0jZuKwalmzTJYOBQVdI4D0ipWjpGnwPfNE8ZkmICP8CQT8rwGy935/2giz7JXis4WljNtBOqtyrIoRr0ja5G1gXt3qUP0hcOHCOA8kUuHrq8XpYP0Bu3nR15vaYMWYB/tiCO/aJOMiHM7BtZjCU9gIFRzFszcfC152LiYS9XtvTmvzKigtgC3k3asIFH8UapFH5ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB7620.eurprd04.prod.outlook.com (2603:10a6:20b:2d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 16:03:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 16:03:44 +0000
Date: Fri, 13 Mar 2026 12:03:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 07/11] arm64: dts: imx8mm-var-som-symphony: Move USB
 configuration from SOM
Message-ID: <abQ1XYca3XRvcr2f@lizhi-Precision-Tower-5810>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <04b20cb1abdea86c551a851a19eba8fce1640c87.1772898346.git.stefano.radaelli21@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04b20cb1abdea86c551a851a19eba8fce1640c87.1772898346.git.stefano.radaelli21@gmail.com>
X-ClientProxiedBy: SN7P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 59bc11d9-7224-40d8-78cb-08de811a1a7b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|366016|7416014|376014|19092799006|1800799024|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 8f2NmEQZ7Ox2Xo1Ka+9jIY4GBPfloEQ4T5Go1eK6Rj+lM/XIR6q23B0MQvbsJHPX/axmx5BBHwv9rPiZwDFYxHFQKLjM8yUmMvyDKCvqjKHveL9aPhmnyngG/4RMRF5aYNECskQw+Mp9IMzmcEcDD9Cs7CMmfmGP3Ct7oqxfTkoJ6eOz8VSGb31h4h4cvbI6W0OfZu5m1scmrXV02W862d7ipsTUkMLKOTG65kmDQe7xU8em/nKrIeIbXJlqcZ39/yHv8bWphioM/2xqD6auIibDO8lBax409PujEGfI6EKwwoScuqymQm1UJENyhpOcU5jgfNe+eV3A6GsubrVKb2q515G5qZt+qjji1G2/gs51YMiz1BBfMC6zAYZsDqINBz4pLosV9R0ckPYkW5+qITIraJAuZ0VHorH1Sw8XOyy4DWBbbAaunj+0hYo7lLjqVRTeRRyaEcKMDGx6HDHwUuBYNpCUnjZ9wR4+8Eh0y00sSAE5FPMMF/Ceq6pXr4Bd8iLTjGJWpgQpul+m9h/1RdAVOUBA8JaVfhB4vX/bca2OkmKMuNQuHVKPPv7QFvymwP2JsXzZrzVpBBYL4wYPnpPkIapoJzCOHexxIr0rlsiEVvmfBxuSRHbY52fE3XG+SZHcEUu6BRXe18es8PmTcZEmKXD01V6IOE/RJMN5zpeS4o9m2afJJHy+EQgkrpQ4nhtmA0kqSpoVwY+CqWSgkR6oYzH36XHL/31QM4z9RUTF3czhzPA986eTgkdJfDpQ7+DexqttogZVMqoJDQNHxZ/OXiGqI2kebSfyAF8/6xk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(7416014)(376014)(19092799006)(1800799024)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bDSjqAKhyBoTtiGe+F8qI2+PqrGcDhKTPgLx6zbdZXpq6z5EEYv1Mv/ASLDg?=
 =?us-ascii?Q?TKJF7PcF99qIrO0b3Xp/PpvuPEDQCxyVPKBIbpQ2KXCYox+ALFEvNm9FKbhT?=
 =?us-ascii?Q?Ztuh/n1vdiADHDIfbHvUcDSaQ6no3RhrA2NZZ3YgOh8cMtVqAI6wn6MNMRE9?=
 =?us-ascii?Q?nqy3qvnnpkjrfT6NGpZRuLTFFWAGlckGQoen0nKtwcI6KxbCfcOlsGuq3exK?=
 =?us-ascii?Q?hRV2Bx+Qu3GRiFu4rxKW95WC8LrPeQuRC3di2m3P0rDUpA46dQCyf97/L/Hd?=
 =?us-ascii?Q?Rq/9ffJu0DLAQCwxPIoj375InIFBsYxkFtWt/NDwtZFCUrjHhmYdPri0s76b?=
 =?us-ascii?Q?2uAW09/LkPInWhISkF6idnlUIhvnTr04V7IqVU5m8Q0Zu2geEzs2ClsACl4/?=
 =?us-ascii?Q?PZZ9zlly82OEl7FhPctjIZwDm964qt2dfwLdpb87UTvyZUE7x7RkOBFFtyNO?=
 =?us-ascii?Q?vCtBuatua6r2fiYREFejr7URZL3kyxuMvN8uvOHWyZCQtvlyoIw1cReq5jbM?=
 =?us-ascii?Q?nyCFPB28HfO32highFOUR2UfQ7tRr/VI2dhjR6tffm/VYuP18buQVfRIbU3d?=
 =?us-ascii?Q?dcBZuNkDXMpcSQI2XGUT5atmdkGlDJ0Aq4F+PIiCAieRnnq9c7oyXfYwgnkz?=
 =?us-ascii?Q?MyAuW3hHq/uL38dDkXV0FxNXVWQcKyb4nY1EzUnMnAo7WlTqEBbKlrisFpMo?=
 =?us-ascii?Q?YUNLebJ0NrPz+7dg0D1sgOTanMDW4sRj2aF9bhVejzFJvWR2/m+os5EeIjXK?=
 =?us-ascii?Q?PXU3YjpfiBmz2LvW0X8Kv0bb9WOQIe4ABQqIFuTI6LiWFehR08t+sG9Z4Jl0?=
 =?us-ascii?Q?bPSIlExe+wvj2kiU4R0O1cDdcibOTpqbpPl3+XadESZYjgu6QAFSEPUnb7rH?=
 =?us-ascii?Q?Nisx3CybB5J6zbrz0FUY/Bnfu2TO9H3Mngrcv4dC+EygjPvZWD2EO1w+XlSQ?=
 =?us-ascii?Q?xxvuBmJS0n1ul5QdIsDcOSthGxyI7EcQMxtbHpYTdvUWnJop1O/G9V89HzLh?=
 =?us-ascii?Q?GFfrWuauT52dChWcywMdShVu1CoCJi7qyInr2m/CxOWQAEwgZF2LBOto3wms?=
 =?us-ascii?Q?HRc+fjyHHdAeJbxwgbjq1GFHmuAT7yzBLezUMpHocQclHqlu+Y1qOfsKgZdE?=
 =?us-ascii?Q?cQl99ubdVUCbVOK9hql5+d/EzhrZngP5Xx9md6+iQYI4rJbBDHZoTVAhSrF+?=
 =?us-ascii?Q?gHEZ5n5UW82BpbCjZCnixCDhfxS0Orh6MnoWOFr2ZNukf9pb3s9yiKa8gSUQ?=
 =?us-ascii?Q?V1r+AaQ63mbB5VccHBzKIPHUMxC2ZKNiX8cn3x6acur01DiVQEY0bBFPpkxX?=
 =?us-ascii?Q?Gz3NnmZ/ssBPXWz1PN0PQAeYqeMk5rQDBnJRuprtdCIIpvVs5YKVJ50Nc99h?=
 =?us-ascii?Q?IrJYr9AUWkMMmc/Gij33WhgK3CvR6L0+0K4rLycFZRLQo0sx0M0xOp++0WHh?=
 =?us-ascii?Q?PUIlh3fylTFAqhjhP/F0sGoTsLPZpb0Um48uAapPmrRmC5tGUZehy3u2W0ky?=
 =?us-ascii?Q?FJrWN1p1BSiturLFONAqeVEmgr0ex03xSl9LitxX2MlnPDb6PKHMj7CZHHhE?=
 =?us-ascii?Q?bFelVfJlT7Rt9b3RrqM9GMUePZVk6rCTEBpuuHwNdh0Q1dyFrP4A1oPp9U2N?=
 =?us-ascii?Q?5y4+rC2hNaXA5aD/WyxbJvEA5MAKIgJyK90z3DTxlmXLCNP5+F6U+1Kv8PsT?=
 =?us-ascii?Q?DlmrWMtnsH4gtAo5+9IA8kzA+g9zurJYFdkaq5nItc6q6JGtYycjQJjN0WGV?=
 =?us-ascii?Q?8LR/zJfh/Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bc11d9-7224-40d8-78cb-08de811a1a7b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:03:44.7596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q29GNcpBIkc3mPIpxSYhb+Y+YJtg1yRfz07HDWE0vpsYdFpvmtZsd+oAS38uB5Gp+FVmlhCv2lJjBHrh60Bbrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7620
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_090353_117603_AE5884AF 
X-CRM114-Status: GOOD (  15.95  )
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

On Sat, Mar 07, 2026 at 04:54:43PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Move the USB controller configuration out of the i.MX8MM VAR-SOM dtsi
> and into the VAR-SOM Symphony carrier board dts.
>
> The SOM does not provide any USB connectors and carrier boards may
> choose whether and how to route USB, therefore USB should be described
> in the carrier-specific device tree instead of the SOM include.
>
> While moving the nodes, align the Symphony USB description with the
> carrier design by enabling both USB controllers, wiring USB1 to the
> PTN5150 Type-C controller for dual-role operation, and updating the
> PHY tuning and VBUS regulator pinctrl (including a sleep state).
>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v2->v3:
>  -
>
> v1->v2:
>  -
>
...
>
> -	extcon_usbotg1: typec@3d {
> +	/* USB Type-C Controller */
> +	ptn5150: typec@3d {
>  		compatible = "nxp,ptn5150";
>  		reg = <0x3d>;
> -		interrupt-parent = <&gpio1>;
> -		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&pinctrl_ptn5150>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <11 IRQ_TYPE_NONE>;

why need update irq type here?

Frank
>

