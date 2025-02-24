Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD81BC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 10:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSwXXP6BNRG345UsPxtpYVjxYEHIPH2f5chGbN0cL38=; b=YyQ1x13m2KUhkrZcKfcQiiZlrK
	ShS/HnB4+61CBLMlThvJzK/flDHeY0xdl+grcb2U+2Iqod5z2UCkLuoGFOF41O5eIBrKFH3fdN7BK
	l5GKtb9hNhqfei34FHXFfUNMAF1XojbHJmONqgaJDOQ5EYvqJ1c/q2BNkS6bAV5A9O3NXbaZDAN90
	/jCF0TLl7nvYi37hilT7QqEj2cn3XUkgY+FKovSFkjHTww0ivnI/IivKZxjEj0RbmqEBbu8E/gjuh
	c6VONbqhA6MGnNFA9WAB4QNvAxFbeMgrLbsXemxNconi7zGGhGo+G7Lnm5Dw7jR96fyVKv032HTcC
	GLJPtXzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVuB-0000000DBDg-2Zin;
	Mon, 24 Feb 2025 10:41:43 +0000
Received: from mail-tyzapc01on2072d.outbound.protection.outlook.com ([2a01:111:f403:2011::72d] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVsh-0000000DB4B-0pNS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 10:40:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ox08jtdVfH8EqRod2dn6c7HzHlORiCdjaJDXWfNuFC3cDdw0UiKvQNEijlU0Tsm/spCscNx58OIUwN4PC4kzwXXInek/ZuLKCop+mIS+CE99aufM2g/9pFR/zIIP9nqRAIWtDVcVUkAFpfuNA4ObbqyL/yrPZklea98ZArEhvPn68464i7mv+CFiOl0LqpLpT41Iow+GB9Qq6eLi/JgoMauSY6ePVqDuXh+Jx3LRevm+bL3CDX+a2/2JhDBeK4jFmyXz1goCKKtvkUxJwUJv6l4TB5v5SSceBaoFJVSOQ9k7D5s5kAtiHw8aQtZz8RG4vMv+MUTTi1TLnlKNE1KnUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSwXXP6BNRG345UsPxtpYVjxYEHIPH2f5chGbN0cL38=;
 b=eYk7RFsBCxPxJx3LOzRWOFew9wxunY7cgm235EJtX2Uz+jZpSqmi3JCJLeRFWiG6FE5TYGOQq9eeJcsek0XF9E5VPMILXp0E//bAou5G9omdece3OdPKmJQrnpqAttjOXiwvHZerjX0TcOMZ+of276r5nsoYk+JLaAOIv4XjDLkuJ5/b8yk1GZdwssyBPikTvzyrw61nUVFbMH23k99kVFhW1A+1cWuawtL2gsg9EQz5VydlHTcv5kRZXpu/buDEXygacUT4jfqmx7rjktbpZToxn6gYsSNtQRjsjYjn7Kt161Sm9q4x1u3hO4N7lQa6Hqh2+CVxjDO/EMcJDgWZ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cixtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dSwXXP6BNRG345UsPxtpYVjxYEHIPH2f5chGbN0cL38=;
 b=Bk0hP03e+FnZHnt2F6SJUNhkoC8AGuorqwHtQn1ZBC4OpvETRV29PwES6Z6DBVmGhoc+0rgh08pMpWi5lvESV/3sPdAXPCTUNRkJycjASiaHV9jjRvuUL3Pai9A+yKSPSEKSKPRsFaHvONE2CzWk2u6NEM3PGHQvTZxcHHKXG6fVj87LW2PntYxSzpSBhspilGgSJzyHjCpRAgOH9vHyOPuDFlUu3q1nX7w1Hp8rMj0sXlVlTsqEkBcFjjGX+jV/RTKddmV9dEDbp0b5J+EpSm0f/0JRI5xeR4FOebzf+tJh+ZvBgKR1jBCGoHMNzwfR8Ts2p3DdnW8cj0W3sffR0A==
Received: from SG2PR04CA0187.apcprd04.prod.outlook.com (2603:1096:4:14::25) by
 TYZPR06MB6619.apcprd06.prod.outlook.com (2603:1096:400:451::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.20; Mon, 24 Feb 2025 10:40:02 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:14:cafe::6f) by SG2PR04CA0187.outlook.office365.com
 (2603:1096:4:14::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Mon,
 24 Feb 2025 10:40:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Mon, 24 Feb 2025 10:40:01 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BC78F4160505;
	Mon, 24 Feb 2025 18:40:00 +0800 (CST)
Date: Mon, 24 Feb 2025 18:39:54 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
	krzk+dt@kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	"Fugang . duan" <fugang.duan@cixtech.com>
Subject: Re: [PATCH 6/6] arm64: dts: cix: add initial CIX P1(SKY1) dts support
Message-ID: <Z7xMeub9i74a_19g@nchen-desktop>
References: <20250220084020.628704-1-peter.chen@cixtech.com>
 <20250220084020.628704-7-peter.chen@cixtech.com>
 <4add2867-8c09-454a-b3e2-b4baaeccfd44@app.fastmail.com>
 <Z7cga0L6UYmPXoFw@nchen-desktop>
 <5f88cdbe-f396-49c6-bb48-f50cbbb21caf@kernel.org>
 <Z7vY5kHfEGzCCuWW@nchen-desktop>
 <0bd5af6c-979b-4403-b1e7-5847979a8780@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0bd5af6c-979b-4403-b1e7-5847979a8780@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|TYZPR06MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ab20a6f-b882-457d-f206-08dd54bf979d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LUf8xSPUqL9/dTXAuFkPSkZ0N/zopa3mdzqjHD56epsL9lVYav/MFNxeJ6Pb?=
 =?us-ascii?Q?ndeefG8DYPbraPbOqnc/FiaaKv7+vT2dL7ViYROhe+7ZDmfudNwSzeVTwzt4?=
 =?us-ascii?Q?evs8E1YDk+fH/dJ64SsUN0Yo6edReUF4+nPW+hph2AfV5RsbftSLu7T4hfpu?=
 =?us-ascii?Q?mBD/6Z95P6eaWBzN14HDoKvjYVamUNJCaZjut7BMot0yHE5mZwgikEWEkHjS?=
 =?us-ascii?Q?ln+oXPrLbbrGZzItOsOQn6vwyUIYU4NmPxwafsmbs7G9DTboK7RujwXPksu3?=
 =?us-ascii?Q?bC3lgSoqRGeXk9mZxmhIC2KEaC31NBRlJ6+mMwgtf0u8AjXcfmbR7KVBvSpU?=
 =?us-ascii?Q?/Xtyd8X4+VRGG5fnob+jkRJ2feoZyxbaEzVpHRhUsVCN79VyrDRdCaqy0Bsi?=
 =?us-ascii?Q?I0FQmxNjQrVkTUwr4ij4tWWIDOJt7rYLuQmYxrWsY8Wb08ZgsfPxyuQ+kj6r?=
 =?us-ascii?Q?gFb+az4DqO1tsd9O8kB375Um5JV7J3OVidtQ9uRtCQMm5MYB4hFFmn9nshwe?=
 =?us-ascii?Q?QvJtBKbFF1nIPkEWahAwd+D72F9O/c2IzckErTNdfiELm/8bQtx/hsV9+d1p?=
 =?us-ascii?Q?47cxvvAF1LA5zaTLIq7k5neoHb3LhGwJcl9+Kb3UG/k7P2v8RvhNfZTG9kYC?=
 =?us-ascii?Q?pLoZQ0t1Dekq4ZPJCCx0agmXPynTXw7/SUU8VIF1aRau4z4+6wo+je5eZr+N?=
 =?us-ascii?Q?ZQ2NAmULovY0Cfabki6XXDvKcwkaZJ4GGPtQ83pQxnqZf/HH2Tww/WpCQOCu?=
 =?us-ascii?Q?khNbJAAPOXI4FLrDhJva/HOsYpH7mCMiApX3AS9LJO+SDU0dExuaI8TUTpQr?=
 =?us-ascii?Q?f2b2abMZOokwkBPSJTlcS5QergUjYLON9zTTzkXv3i09qriv0848oF6E8e0n?=
 =?us-ascii?Q?FCWJNuXzRLIdDwY6eOW/WJQT+HX/LGEDGPE/OtEZZt0648YRRGDjyY3c1yXR?=
 =?us-ascii?Q?8lHSLaRVgDoaqL6nTLAIdaZKSXlUWjqPCUZtDZF8GgMUE2jGoZl2pu5y3OKu?=
 =?us-ascii?Q?s8mYk10mWm7lUVVKlV4fp1z4hwOtgfiIQeKuXJNfKrH0SqO32+gNaMPtdMAl?=
 =?us-ascii?Q?2b3BBk0nNGdBzlfcvn2R3PRX0ukB5k/rVZfRHIXWxzPdUQwvhtxmYPM+MDVX?=
 =?us-ascii?Q?ndRaUfem3U+zS3esY5lsVhPIpEFWdyHLioRYsxNao+b0sJoWsY1IuH51SM+4?=
 =?us-ascii?Q?M6zQQFG6RY+Zj0xPCLbiPk3uiMwYxet/ysacrKn6NZv11h/73vk1DJXdpy9v?=
 =?us-ascii?Q?BHP1edVd8sUyQ+bQpSyfgWbfLvBGC39XhmK/AeMK90ob5Nty5ybUugKcMZem?=
 =?us-ascii?Q?yi4kwwSAJdEt0885pJ2Th3LZ1DJjrXmoSOj1K3DT8HBzBXiKl5QHc+c5iXuM?=
 =?us-ascii?Q?7u1aH9l3/LzUCAbOeHsUT2RDcjG/rXRdKPkcyxsx4o1fwLGahT6MIBAZvDu3?=
 =?us-ascii?Q?pgT3PsfPLJiYrQl32bXjwrFdhFFctqfTQftHM3SaVSjrqIlfNDYwsEs5MAlo?=
 =?us-ascii?Q?0Gp6ybdgnyCRVOk=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 10:40:01.3957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ab20a6f-b882-457d-f206-08dd54bf979d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6619
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_024011_258103_8BB4B004 
X-CRM114-Status: GOOD (  26.46  )
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

On 25-02-24 09:06:23, Krzysztof Kozlowski wrote:
> >> Your "in fact" is not really related to the problem described. If you
> >> put it in the correct place, drivers will work just as fine.
> >
> > You also mentioned that in your comments. Yes, indeed the board dts file
> > could remap physical controller index as different board serial number,
> > but it is not what we would like to do (at least for CIX platforms).
> > In our both HW and SW documents, we have fixed our uart usage cases,
> > for example, UART2 as AP serial ports. UART0-UART1 as uart application,eg
> > bluetooth. Customer will do their design to follow above rules, and
> > it avoids each customer writing this alias at their board file.
> 
> Follow standard rules, you don't get an exception. That's not a property
> of the SoC.

Okay. I see below documents describes it:

Documentation/devicetree/bindings/serial/qcom,msm-uartdm.yaml:23:  serialN aliases should be
in a .dts file instead of in a .dtsi file.
Documentation/devicetree/usage-model.rst:327:at all.  The /chosen, /aliases, and /memory nodes are
informational

> >>>
> >>>>
> >>>>> +       sky1_fixed_clocks: fixed-clocks {
> >>>>> +               uartclk: uartclk {
> >>>>> +                       compatible = "fixed-clock";
> >>>>> +                       #clock-cells = <0>;
> >>>>> +                       clock-frequency = <100000000>;
> >>>>> +                       clock-output-names = "uartclk";
> >>>>
> >>>>> +               uart_apb_pclk: uart_apb_pclk {
> >>>>> +                       compatible = "fixed-clock";
> >>>>> +                       #clock-cells = <0>;
> >>>>> +                       clock-frequency = <200000000>;
> >>>>> +                       clock-output-names = "apb_pclk";
> >>>>
> >>>>
> >>>> Clock names don't need "clk" in them, and there should
> >>>> be no underscore -- use '-' instead of '_' when separating
> >>>> strings in DT.
> >>>
> >>> Will change to:
> >>> uart_apb: clock-uart-apb {
> >>
> >> No, instead explain why this is part of SoC - or what are you missing
> >> here - and use preferred naming.
> >
> > It is in SoC part, APB clock uses to visit register, and the function
> > amba_get_enable_pclk at file drivers/amba/bus.c needs it during uart
> > device probes. It uses common Arm uart pl011 IP, the binding doc
> > described at: Documentation/devicetree/bindings/serial/pl011.yaml
> 
> So you added fake clock? Everything you wrote is not the reason to add
> such clock.

Not a fake clock, it is the real clocks, but depends on firmware open
their parents and configure their rate. It could let others do their
upstream work based on workable console.

Which option you would like to accept?
- Option-1: use fixed clock in this initial version, and will be
replaced later. 
uart_apb: clock-200000000 {
	compatible = "fixed-clock";
	#clock-cells = <0>;
	clock-frequency = <200000000>;
	clock-output-names = "apb_pclk";
};

uart_clk: clock-200000000 {
	compatible = "fixed-clock";
	#clock-cells = <0>;
	clock-frequency = <100000000>;
	clock-output-names = "uart_clk";
};

uart2: uart@040d0000 {
	compatible = "arm,pl011", "arm,primecell";
	reg = <0x0 0x040d0000 0x0 0x1000>;
	interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
	clock-names = "uartclk", "apb_pclk";
	clocks = <&uart_clk>, <&uart_apb>;
	status = "disabled";
};

- Option-2: delete the console uart node and its fixed clock.
In that way, the user could boot the kernel at orion-o6 board,
but could not use its console.

-- 

Best regards,
Peter

