Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9025BE68166
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 10:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G8i6+u/bpWa+b2K8kEUTWbYqKM2qsbXNNKPoTsSjMNs=; b=04jDz6hIAs37Vmf4JYLseK0fyt
	QB3yJB2M7b6jTbuoh/EX1LD51lTbzLgvVtyNeVuQrhXni1Oq08dg8UuFeBHVVm2Qumu43UUz83djC
	ttD6ciPB0LVTYxiTvjwAWx25DNqonBKMIv2qMgQGfKwsy3Sz7BteC9PnQQ1LAvia5N5nQ6GAcabXI
	1U7ZIO3M6YlC0rU6Gdgazel4ltkUMHvJlHffTPrEcCQYi3jimvIdi2uRi/FnIF1ImGMqSj9igeH9B
	mU4y5nV1TRoEngWNccpD9pJSU/IeiDnAD7rbK590UIAY+6XX1M6ajSVGNf6KTckMm88Obt67yOUUi
	wGxT/VLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsIEx-000000081LO-2l4A;
	Tue, 17 Feb 2026 10:23:35 +0000
Received: from mail-westus3azon11012017.outbound.protection.outlook.com ([40.107.209.17] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsIEv-000000081L0-2cGZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 10:23:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bf7MDvULi1PSh49nmS52onY2g78DGV7AlQbnezHW2NjoYw4jtsvko0Ng/LwK6/WnZfBA7ZtmVKymKH3hN2c0BU5ucXsaYawsQtwI0yaTHGqmTIypug0F5gXvALTV3VjSJCYJ/gA1wOUVSC4IPpLqesGmsbEGgArVBbifOHD2FYNbHUhzyKw6rQM08cVRD28YuotlyjWQ9cCexAP7OA10honpdNh5RirWbDzNA4SN+OHdpBEA33BNtDn9YWiF5pQCS2pVL+SjGQQWUPO082vWoouFZxpf1huKI5oAaxbPX7yb/4r2mz5KaYAfFiG3EP5VKiaGoe8ND6p7LjLlAohwHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G8i6+u/bpWa+b2K8kEUTWbYqKM2qsbXNNKPoTsSjMNs=;
 b=yXHFZhXOWGZPg/mYkHe1tet81lhspxaBkn59swFIwJMze0sWf6WZR9EnA6YRFAAxWgN8bYO12BtsVGOPr8O+YBmnQaI1oIfDRM3jZt/3cPE+I3Ice4ZK4HsCvVjgvnp65ws9mQJJXNdxhogkWiTvzN6K7OlbGO5huI8KUcQHNKJHh+DdGJnBK1IbOO50Av9hu++q+QNRp8CP3QYPbw7LW2KDlQPrpoHfwKuDCBDlmxC+xut+z0sZr4ZWnmmm05+HYwEQu9T7go2+YD6QHLM3px2oyh9nlP+XXb/L03ssTGRZbmmAGN6LBAIfe5zsT5RYqS30KExmVtD8A4EuBLWQyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G8i6+u/bpWa+b2K8kEUTWbYqKM2qsbXNNKPoTsSjMNs=;
 b=IyY6NGIRy6pUPJPKi21lyozsMmR4j2eBq8+WqOlUNZbQ/j1fWLquJYQmflTm3XW4rQHBZajSj4gXpr6bh0VwYA79yJUY/6JqfkPUCJTUMPDXXxwj300Ahe0z2k7hM01HGUHzc9oQ3LbuSyxNvUMoLhfCpz1+pSml8yRph9VxyuZbkHJUnVBAWbQYxkzSS7rTpRhDIksx0tgKtdLDsGP6HKs4HJpBFWLX15oDmtl4854CfDvDYDQE0HbhLqEafwr06L0qR785/GwbbZmCyGrW8REXLkD9w9H9zYbvPAYbH/4SVJRO9Z0UvSygE5UafmGD8guP80CRcdTqyLmM8EKyng==
Received: from CH0PR13CA0023.namprd13.prod.outlook.com (2603:10b6:610:b1::28)
 by LV8PR22MB5151.namprd22.prod.outlook.com (2603:10b6:408:1c6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 10:23:29 +0000
Received: from CH1PEPF0000A347.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::22) by CH0PR13CA0023.outlook.office365.com
 (2603:10b6:610:b1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 10:23:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 CH1PEPF0000A347.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 10:23:28 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 5FF92E8F41;
	Tue, 17 Feb 2026 12:23:25 +0200 (EET)
Date: Tue, 17 Feb 2026 12:23:24 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: pll14xx: Add 756 MHz entry for PLL1443x
Message-ID: <aZRBnD2KOP4PYP16@zeus>
References: <20260217094152.19958-1-ian.ray@gehealthcare.com>
 <rvz22m6k4g62gopbghfssyuwz43raxzoxeohfn7hpvbou3htoi@de2ajdoeybm5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rvz22m6k4g62gopbghfssyuwz43raxzoxeohfn7hpvbou3htoi@de2ajdoeybm5>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A347:EE_|LV8PR22MB5151:EE_
X-MS-Office365-Filtering-Correlation-Id: f0abbf2d-a522-4219-466d-08de6e0e979c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzVmeE9RWHR4WGplYjJING1nUmR5UWh0aW5GYmVnTTVaQzErQ0w3ZUd1NURZ?=
 =?utf-8?B?WmcxSTh4ajhLUEs5RHJPc1I4djdxeis0REs1Q0FleE1JM043MXh0amdydnp4?=
 =?utf-8?B?SDZFMExDVU9tdzhGanZhWFJIQy9Zb082WHJENm1hU255cW5kWGk2MndONndK?=
 =?utf-8?B?bWZJVzI0SVVVL1FjdHQxQUtEUFp5bSs4MWZ1cDlRcktsSEE3MnBTTTNXR0xm?=
 =?utf-8?B?RzB2dEIvVWZ5eFRPTXBJR2FQZlYzZnZ0ekQwQ2QvcEp2Y09YNnBCcXV4KzhW?=
 =?utf-8?B?WUxSUVM5NE9WS2h3ajJmK0pyWGFPRVdITTh5QWh4MTlvUml5TTlDbDVCSklR?=
 =?utf-8?B?RGVxNHdJWW5UM1pQQlhyVG9xa0FJVmE5VFZFc3pleFJPY3BDRnZhZEJ4dGtt?=
 =?utf-8?B?dXNlNVlUZlJpQmEzaGhaVDRKSDVQMlVvdVA0TTBNYUpoeXcycXlxTEtHZUZx?=
 =?utf-8?B?WWY4Wlgrd3QvT3JOTUdYYU4wUDJrNmsrTGVWc3U4eWplUk40Tlh5RXpPRHQ2?=
 =?utf-8?B?UmRIY1JzVGhMODFOVE9KRGNZM1U2eHp2ZXVMZXFSZkZYNzBaMERHcCtWK1FX?=
 =?utf-8?B?L29WLzdYb2hYMEdvUDNQaGhVb29WUTRtc1RlRUlBbjNvZGVsUzRMV1I3SlBY?=
 =?utf-8?B?VmF1U1FLZ01rTVI5MnFYR2tScElxeUFTYXcwd1JjL0I4Q0JHcTdIaEpEMGtR?=
 =?utf-8?B?bVJQbnRkZUZ0SkFHNWV5cm5zVTV0eWd4S1MwRlMvQVY1MGRKRGlQcmJDemJa?=
 =?utf-8?B?MjBCZklGN3JFNzhhcWM1U29LOUI1YVFGRTIvUmQzMGdjVFFqYzQwY3RFWDRq?=
 =?utf-8?B?VWtEdEFVYkNmVlB0SmhoMENqd3M3U1RHOHBpUGlKempLQ2lWbUhWV0NsNElp?=
 =?utf-8?B?cnA5MkQwTEJxZEszakx3bmp6N0dDd2JQWkRQV3BUYWk2dFN3aWVaM0Nvb2g3?=
 =?utf-8?B?T3licFVpSWJ2R1BobkdWRnFJVzZrTUUzQWY3N1M5QzdlTGQzNUFvN1RobXJ2?=
 =?utf-8?B?c242QzF5ZXFYNHk3NmU2UTdiRUJHWDd6blBnQlBBTFdzVmtQN1I1R293VVFh?=
 =?utf-8?B?blVyWFZFZEs2dUE4NkpHVnZOVjJWUUxOL0hSM0pLZmFmMW03QkswU2Exc2Jp?=
 =?utf-8?B?MGNGMUVyVm9lWExzMWFyRXN3bnZiQkZrNzRMclk1cTFuak5DQVdZWHhHNVdT?=
 =?utf-8?B?UTBobE8vL1FXRGhFcFJ0bmJLcjZtRzhvY0F4NGRxSmRkV09QZGNUWEhXbkdV?=
 =?utf-8?B?aEx5MzBwZGxyamFJRzFSejJDaWQzK29yR0kxb1NqeStqRzNDbklBMWlIcytp?=
 =?utf-8?B?YWRiVWxQc3ZtSVJQRjNwNHB1MERjMUVGazFJcGE4U0VnNWZ6ODRhUDhVdURT?=
 =?utf-8?B?dkZEVEZ5YitidGFnbXRkOGJrblpUdk15N2pBYXdCeTZKeExLNUVIaG80TVJo?=
 =?utf-8?B?RzFXalhVc1ZIeWZsUUo5bDB0RmtGOEx2Qkp6NDVUQ2ZBNGJFZ3hXaVV1MitS?=
 =?utf-8?B?VWJ0eTNOVC9WSE9KSjI1MUdhemhPVW5QWmNSVGQ4SjR4YkRYU3I0SGNOZlVt?=
 =?utf-8?B?RjJxck9kSlA2Tm8xR0RQaGhaaG1rNkFTeEwvOGVoeW54QjhvNThEQmFnTWF4?=
 =?utf-8?B?NjRNYkZ1WVAxWDdRaXJ1SzluUEdPeHNjOU1kaElSbGhCcWhVMG5uQWkzSklt?=
 =?utf-8?B?TUZMNEduSnNadk1PMXVQZVZxRmQvNDljR0JFU1g5ZjRkdVc0SmVBU1pIMERl?=
 =?utf-8?B?OEF4T1FSRkZ5b2drUUlCL1ZER2k5RThtMHBOL1hHNnh6OTJFQVBIb20xc0Rh?=
 =?utf-8?B?L1NjNTE3OEtSeDFqTzhYZnBsN2I2QmUzNkxiYUhDRkRvK090eGJaSENxeEtB?=
 =?utf-8?B?N1VFa215R1V2aGdmODdtclVBcmNRbmIwNjBGNGJVOEI1b2Q1UTRmZGFNUjZv?=
 =?utf-8?B?a2d0ajQrWXVmK1luWThFNldFUDFwaVpiMXNnb0lTSFBYMlpEVnNhN1RsV1dk?=
 =?utf-8?B?WGdBZFovSEFiYXl5RUZ4WDc0c0lnSDJaWWtwVStmNW9kNjdlbDk4TjFDb0Fo?=
 =?utf-8?B?TUgyL04zMGRYMWw0S0ZTbGtsTWZYV3IwaDN2WnpBZEtDNHNQWStnbzBBK1RL?=
 =?utf-8?B?M3dqUGZxTkFLT3o4TkF6bkR3dWhYV0RkWWhLdnNlZEpVV0JFa256b0RXeHpi?=
 =?utf-8?B?YVE9PQ==?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dqpWdcPXYGPvFE3LDJH8fxOHXWFs8yGe5P6zZt25mPPRkp7hcYOj/eTJL3BcxLidtj6GadMfhQrEv4EwjgM6D6Udar6MLRW/nlh0u6KMy7kIQkJHFNENtHZnb2JiL2rGTHfrQmHv+jMCBc3yI579qVVOrjxzSXHjbSHfEbf062McCIMhydKh89s/4SjrKdV9qOIoJUgqWW3qoWPRFes9gjxwoQQBCnUyKqfTwTGuKF/L/vMgnc8dIlutR57YU5tlGI1ZM9aXJQqRxQPiva16Hili4nwEAhh5rAY5JVi03OnVaWsw8H2a+fmRm8+PA7/gboN2toSPIlK/OKZo6RYhzEmqgzu1FnzZsC11iBNxD4+Wy7z5BqL/qBvXgroeWICrxh3bFcUsmMH044MnJGq61zsaYdX4onu7p1j1W9ks1m0bjQCNwuUfN6W/Z0V5hvmt
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 10:23:28.4181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0abbf2d-a522-4219-466d-08de6e0e979c
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A347.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_022333_666615_645B186B 
X-CRM114-Status: GOOD (  21.21  )
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

On Tue, Feb 17, 2026 at 10:54:49AM +0100, Marco Felsch wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
> 
> Hi Ian,
> 
> On 26-02-17, Ian Ray wrote:
> > The PLL1443x is used to implement VIDEO_PLL1 on i.MX8MP and can be used
> > for dual-channel LVDS displays.  Add new rate 756 MHz, which divides by
> > 7 to provide 108 MHz LVDS pixel clock, and by 2 for 378 MHz LDB clock.
> 
> the on-demand rate calculation doe for the PLL1443X PLLs is not
> sufficient for you?

Apologies! The on-demand rate calculation does indeed work. So please
ignore this patch.

(The patch was needed on kernel 6.12 IIRC, and I automatically re-based
it on 6.18 without re-testing. Once again, apologies for the noise.)

> 
> Regards,
>   Marco
> 
> 
> >
> > Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> > ---
> >  drivers/clk/imx/clk-pll14xx.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> > index 36d0e80b55b8..84279cf9f12b 100644
> > --- a/drivers/clk/imx/clk-pll14xx.c
> > +++ b/drivers/clk/imx/clk-pll14xx.c
> > @@ -63,6 +63,7 @@ static const struct imx_pll14xx_rate_table imx_pll1416x_tbl[] = {
> >
> >  static const struct imx_pll14xx_rate_table imx_pll1443x_tbl[] = {
> >       PLL_1443X_RATE(1039500000U, 173, 2, 1, 16384),
> > +     PLL_1443X_RATE(756000000U, 252, 2, 2, 0),
> >       PLL_1443X_RATE(650000000U, 325, 3, 2, 0),
> >       PLL_1443X_RATE(594000000U, 198, 2, 2, 0),
> >       PLL_1443X_RATE(519750000U, 173, 2, 2, 16384),
> > --
> > 2.49.0
> >
> >
> >
> 
> --
> #gernperDu
> #CallMeByMyFirstName
> 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

