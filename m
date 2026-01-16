Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D825ED47CC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 10:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=viXglhfpmz7X5LLQpmSAVJySdnwrZ4jVSRUCMc1pzjE=; b=eL0vKPgZD+2GrP52DfjyLr8v+t
	YItxQsMuYufqwZR7zhfXDWbP2tki4Qh1WUl9A8IxxpcLuHoPRVO095D+JowIiBZ1DFX4xdiRispWF
	l4mBJOK04iDvk7FFvb9K7bY781UrNlF2k5T0siVAhqIuWN2IfCaTkz6LbqstmHhRT3e5AwNtzjlpz
	SBrOb8po6g2qtwtUifG68GTJx4NVYZIY1MCGl5imXIdfqxeTtDbr6Sv44CFyY4jPycHdh0acb5QCn
	tlJHdy6w5s6c6wL1+bCftfYXBN2Zs0lD9E1Rnq+VeeGlrkUYhkPdT0XshBSAXp6EnZiZ9gwRjbQuY
	ZatG6cKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgglQ-0000000DuMo-0Kti;
	Fri, 16 Jan 2026 10:09:08 +0000
Received: from mail-southcentralusazon11012064.outbound.protection.outlook.com ([40.93.195.64] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgglM-0000000DuMB-3ZPZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 10:09:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aH5OTWWt6HTQevAWpIaXwLusRDoK/5ZY4VrHj+AR/4S8PnCnbdpoi/jhDalU15/pR5qt/ZS0tR1IR/AQVWiFN8CUZUt1WZiHotxvLOWMehi6wvDzFS5RRCNfGUPfiKbEu8ZxNMIc2zWmu1E/e3U9Rf9Sbi/YVFoz9oRgC/MZqtwrqyBLY1nU9MhOJEfXNgnIjq4SisOgu4fwuZBexUrvoy/UwZMDzA9uRxe8yXNPwbT9aYHQ92ATmHro+mFWhlOVYOEg8ax4EWPrgygrsbQuh2K7z6lHm+wCO6ZlFtnnnX/EdmCgV/iALAOEE2yTFD49V4mburnsxMmEbr0UemV9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viXglhfpmz7X5LLQpmSAVJySdnwrZ4jVSRUCMc1pzjE=;
 b=GPK+jAziWAYBaSfawlxW23sFNZYLYk7CpWtvxFvI9g3rh2xwVbvHY6oy5fXzawdRlUVftybz5z1FVZqboM2I60fhZaJEkwUudeDFxozmuoAvc6e3YUwMu9NjBZ9HlstxR7Av4a77dIVxyVXaDafGUviKsaKQZrPh1CAgltyfzKOkpLQVT+8pGuEP/n0qkaIXWXOrmxjz9zyoFxKh1b3WSoF5h5YuRaogcE1xxnh58n+nOPufQ2FrloIgJ1isjK91Bgfcg7sZyvuTpmU2IWuNIR+PFS1PhTZORWz0RaXht1MU8Qr+/2v4wypgQWxN7WC/szXYNpi4Y6HZvSLEqZVLAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=viXglhfpmz7X5LLQpmSAVJySdnwrZ4jVSRUCMc1pzjE=;
 b=xI4DGR/1CbAKwj7SJrx7u8n6vjgpbR4Z4FTyqPL+GWDEs5BHUEQnQ7cwgs2jmssH11EhcSCvXU8VIKq9xn4hYitcLcomCXChQ4+F9chz6EfdcqXl0EzIB+i6fgtHL0U46ifv+6pFFZUo0ARlOaqiioAyOdl3CDtqyjLuRRX/j6w=
Received: from BL1PR13CA0262.namprd13.prod.outlook.com (2603:10b6:208:2ba::27)
 by BY5PR10MB4369.namprd10.prod.outlook.com (2603:10b6:a03:204::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 10:08:59 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::14) by BL1PR13CA0262.outlook.office365.com
 (2603:10b6:208:2ba::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Fri,
 16 Jan 2026 10:08:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 10:08:58 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:08:57 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:08:57 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 04:08:57 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GA8tgX3112725;
	Fri, 16 Jan 2026 04:08:56 -0600
Date: Fri, 16 Jan 2026 15:38:55 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Kendall Willis <k-willis@ti.com>, Sebin Francis
	<sebin.francis@ti.com>, Bryan Brattlof <bb@ti.com>,
	<linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/3] cpufreq: ti-cpufreq: add support for AM62L3 SoC
Message-ID: <20260116100855.4w22hu22kzhcdaat@lcpd911>
References: <20260116-am62l-cpufreq-v1-0-63d062317ae9@ti.com>
 <20260116-am62l-cpufreq-v1-2-63d062317ae9@ti.com>
 <79d0f072-80f9-4757-b25d-84260551e217@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <79d0f072-80f9-4757-b25d-84260551e217@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|BY5PR10MB4369:EE_
X-MS-Office365-Filtering-Correlation-Id: c077793e-7ee3-4cd1-36d7-08de54e7439a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?28QhXOTSbf1ZWANC8wLIwn+Au5j7Qt0ytXjbvUWNKqtdra6FkxPTDDzX+taq?=
 =?us-ascii?Q?LAI+8KBvISR+8iZlIHQuZRMBwTDK9MVc5jVP2M5w5hy0zeD89vx4EXGtumSV?=
 =?us-ascii?Q?dlKnMCMVrlhc+RkTYifdhzrYg+2/aKWr8qErpLvHlt/z4nFoKV3VwAzyBymA?=
 =?us-ascii?Q?atNL71oOXgciMAcl99IBqH9YgSJPAuSnC527mEUW1uzl3O+V3RVnmqI8063j?=
 =?us-ascii?Q?OimVKnYv9i0UFKiJjaXN8XQ81CyQJgJyE+U2av1gxLd2OC0P61jdO2rReMd0?=
 =?us-ascii?Q?INanf7Irw3h9McRnuS6cnoukSM1GZMkzjJ4HeAnzSjjZ4+0B2EaqocOVgSjY?=
 =?us-ascii?Q?moMxA0z8r4sbp92OzFWllUMHQU9GEzsX9huBM0eopCcB4GfVe2c4cVFCRAio?=
 =?us-ascii?Q?tsVSmS34GlAWpULjPjhb8mSgQQcr+qipWgdguapYC3octxK2gCOs7SY4jcOp?=
 =?us-ascii?Q?5FLtyT+C9qa7x/1i901/aI69bvRhXF+u+4MAQJphNiWU1uBXCj9abgowN3Sg?=
 =?us-ascii?Q?GZ1dDpl41NxZmo5Lrja/F+W9NRXG8x+irJ/oVDK7HJfIOBOJdMFHwSByfi/I?=
 =?us-ascii?Q?UPoy+tf+5tm0V3JDd19Ydmnh0cEkglXJOLEaiU9xZoqQS4/BksNUsWPFaYwE?=
 =?us-ascii?Q?F6jf5WADAubawodAL9q418FLmi1SjNyvo79lKkuXEmDjxG03P+tunTMzy/ki?=
 =?us-ascii?Q?819s14ciLUNVaQgSEvKHYk+MeXcdtnfVViC2RceDz967GIvwPNrGrtLa6A50?=
 =?us-ascii?Q?bVsx37tx52ADY7iXh6qFFi4+UKGY7qGey/U/0zF1tBljCVBxb6+4Al9Qvn8r?=
 =?us-ascii?Q?3tkIhwhhNwEZF5v08VS/0oHBx4cF6cYZJbUv9/FoYOD+BtHmc+aTQ9s8O7go?=
 =?us-ascii?Q?KxeqrbjCBWFDgaFajOt0q3HSmAUt4/6W0nQ5UORJ33sc4IyFAwjZMHTONb4U?=
 =?us-ascii?Q?FD2zrRp+E5MtqfCsto9oMB9Oi9NSeSCXIhjTYLcjsYlV7eoPgVRN2K9b0SNF?=
 =?us-ascii?Q?WGc3gCVQ2pbrS5z1GyVdYTlsdeB+vO17gvH7nnYl71AQSXSCBATw5/AenENr?=
 =?us-ascii?Q?EVTQACp9/SGEfyrNUlz4us+bEoBYS9U1J0q/xhfpr1V6ZRSsPMP8jVQshwRG?=
 =?us-ascii?Q?vHGYXmc+M9wWZQPNMW50rzDeXPyHB0gjlTDY43FyOm3Q+v/k1kVCgVfaSj7S?=
 =?us-ascii?Q?qt676pZMb/kuHaCSjJwgMsap/Uy3c+7A8+CIFNknQVUkhu39BiAJgg5Yie1W?=
 =?us-ascii?Q?F0R2L8orc+3yeY+wW8pszc9aHPbKKTbm0tRPKFxJaG74/YlkItgjDaadpNNr?=
 =?us-ascii?Q?vD7RFGKrXOZDfba8QXVnOPT0mzbSEkPxel7BbSMmUoGQjzEqU/FE4/HAmd6s?=
 =?us-ascii?Q?jQTuyVVIt8XHlVTZaANlHiNr2CYtMCg5e9XeWHbrczNbzF5VofDwubDpeQWD?=
 =?us-ascii?Q?aQb5Ou9g86G8Bchl6Hg+Hr7BBqGDXWGFvViPPqc0zxT3BN4TFBNFJfIGznxA?=
 =?us-ascii?Q?LBZrGRcyZCC5Nk2AnzkU05N+uJa7FIMeLCk/6oKhHctS2VfmjoPZckAW7gMI?=
 =?us-ascii?Q?g6DAaULhw6YOUPJMcHIhitFWAPPMeTy9STff+7gn0x9H0qhAA5h4ANKOFmU8?=
 =?us-ascii?Q?qLo0Mej43xFaKn2+Q26WYVbSpYq5Z76H3D4wnYC5Z7EbnGgyenFSZSHqaGhN?=
 =?us-ascii?Q?ohf4Gw=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:08:58.0378
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c077793e-7ee3-4cd1-36d7-08de54e7439a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4369
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_020904_893215_0AAEB1E9 
X-CRM114-Status: GOOD (  25.50  )
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

On Jan 16, 2026 at 10:16:55 +0100, Krzysztof Kozlowski wrote:
> On 16/01/2026 10:01, Dhruva Gole wrote:
> > Add CPUFreq support for the AM62L3 SoC with the appropriate
> > AM62L3 speed grade constants according to the datasheet [1].
> > 
> > This follows the same architecture-specific implementation pattern
> > as other TI SoCs in the AM6x family.
> > 
> > [1] https://www.ti.com/lit/pdf/SPRSPA1
> > 
> > Signed-off-by: Dhruva Gole <d-gole@ti.com>
> > ---
> >  drivers/cpufreq/ti-cpufreq.c | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
> > index 6ee76f5fe9c567b0b88797ddb51764a2a5606b16..8d8fdb068dcdc2caa0b656405f38a072c0700f71 100644
> > --- a/drivers/cpufreq/ti-cpufreq.c
> > +++ b/drivers/cpufreq/ti-cpufreq.c
> > @@ -48,6 +48,12 @@
> >  #define AM625_SUPPORT_S_MPU_OPP			BIT(1)
> >  #define AM625_SUPPORT_T_MPU_OPP			BIT(2)
> >  
> > +#define AM62L3_EFUSE_E_MPU_OPP			5
> > +#define AM62L3_EFUSE_O_MPU_OPP			15
> > +
> > +#define AM62L3_SUPPORT_E_MPU_OPP		BIT(0)
> > +#define AM62L3_SUPPORT_O_MPU_OPP		BIT(1)
> > +
> >  enum {
> >  	AM62A7_EFUSE_M_MPU_OPP =		13,
> >  	AM62A7_EFUSE_N_MPU_OPP,
> > @@ -213,6 +219,22 @@ static unsigned long am625_efuse_xlate(struct ti_cpufreq_data *opp_data,
> >  	return calculated_efuse;
> >  }
> >  
> > +static unsigned long am62l3_efuse_xlate(struct ti_cpufreq_data *opp_data,
> > +				       unsigned long efuse)
> > +{
> > +	unsigned long calculated_efuse = AM62L3_SUPPORT_E_MPU_OPP;
> > +
> > +	switch (efuse) {
> > +	case AM62L3_EFUSE_O_MPU_OPP:
> > +		calculated_efuse |= AM62L3_SUPPORT_O_MPU_OPP;
> > +		fallthrough;
> > +	case AM62L3_EFUSE_E_MPU_OPP:
> > +		calculated_efuse |= AM62L3_SUPPORT_E_MPU_OPP;
> > +	}
> > +
> > +	return calculated_efuse;
> > +}
> > +
> >  static struct ti_cpufreq_soc_data am3x_soc_data = {
> >  	.efuse_xlate = amx3_efuse_xlate,
> >  	.efuse_fallback = AM33XX_800M_ARM_MPU_MAX_FREQ,
> > @@ -315,6 +337,7 @@ static const struct soc_device_attribute k3_cpufreq_soc[] = {
> >  	{ .family = "AM62AX", },
> >  	{ .family = "AM62PX", },
> >  	{ .family = "AM62DX", },
> > +	{ .family = "AM62LX", },
> 
> So you just stuff at the end in every commit leading to unnecessary risk
> of conflicts.
> 
> >  	{ /* sentinel */ }
> >  };
> >  
> > @@ -327,6 +350,14 @@ static struct ti_cpufreq_soc_data am625_soc_data = {
> >  	.quirks = TI_QUIRK_SYSCON_IS_SINGLE_REG,
> >  };
> >  
> > +static struct ti_cpufreq_soc_data am62l3_soc_data = {
> > +	.efuse_xlate = am62l3_efuse_xlate,
> > +	.efuse_offset = 0x0,
> > +	.efuse_mask = 0x07c0,
> > +	.efuse_shift = 0x6,
> > +	.multi_regulator = false,
> > +};
> > +
> >  static struct ti_cpufreq_soc_data am62a7_soc_data = {
> >  	.efuse_xlate = am62a7_efuse_xlate,
> >  	.efuse_offset = 0x0,
> > @@ -463,6 +494,7 @@ static const struct of_device_id ti_cpufreq_of_match[]  __maybe_unused = {
> >  	{ .compatible = "ti,am625", .data = &am625_soc_data, },
> >  	{ .compatible = "ti,am62a7", .data = &am62a7_soc_data, },
> >  	{ .compatible = "ti,am62d2", .data = &am62a7_soc_data, },
> > +	{ .compatible = "ti,am62l3", .data = &am62l3_soc_data, },
> 
> Oh no, here it is correct. Random choices?

Seems like I remembered last moment, "Oh yeah I should probably sort this
alphabetically" and then forgot to follow it for the other instances :D

I'll sort it all out alphabetically and resend. Thanks for reviewing.

> 
> >  	{ .compatible = "ti,am62p5", .data = &am62p5_soc_data, },
> >  	/* legacy */
> >  	{ .compatible = "ti,omap3430", .data = &omap34xx_soc_data, },
> > 
> 
> 
> Best regards,
> Krzysztof

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

