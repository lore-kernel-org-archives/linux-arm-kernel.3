Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDA2C9EC77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 11:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXAyW+PvnZaxUZ+B5d/wb4X82jQDKHGVdyAouxXZPJs=; b=dKeZ5G7/E9uHiFzSqOuHrHQ4bH
	gHS6pwIGPyIijYhAitkSCN8Gp1jg9pJCsUmpHKwj/YOEuWK/MeFBCqsCNS0AbWYQiV/5Px9T567Om
	i+Gix0/KM8nVdFX99YJf96v5YVxzCrJnQXbUiG4fsO7lr9GsR7ZIZrp5Z/zbYbKrYJS6EOe+lbBuw
	ei/qt1iMiVB7bTst0cAME/kJqUy+wB2Huf+562KvSX1NUkQj669fherSFWjB+XBbQxb/fxS8B7YBY
	Jh9imCGvTv1/8XsSA0t23z0+MUI+hzL+UnnpkYb3wBFPByjy4h6NrXsSNkKzjQekhbvyhwjvZfkpZ
	vrlwIcXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGRD-00000005HG2-3R2J;
	Mon, 12 Jan 2026 11:50:23 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGRA-00000005HFc-34h3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 11:50:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGPtcImsGRJ8u4MhCYTM1DubDiW74KNMzOSzY+eS9FMHBHfrcRnbqqwKBfViMuQlIstkJfOs3KjrCrdOo7B5VAE65gzsQie/l0CkSi3vh0n107Sz/ph45b/sd+BlF7RJ6Vw9w8ck7e4LFo+888s7GIL44cVIzAWzHMuRGLyhxTz7oeBEz5CY52mijrnemsmSB4PKvakaV3CIYArL8iXRqGA0p/cGJzkQDaiBFsUSJUlVZ7P8yc4qYpXVunqfBJ00gVep7zVpGVgfO6SW1Zt+Pel1c29Rdag/OpzKEsPnGTxd6Q/G4ZX6/oPI8en5fK4A4VLyquoL40dxvy2+8k8pZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HXAyW+PvnZaxUZ+B5d/wb4X82jQDKHGVdyAouxXZPJs=;
 b=KWa4YuiO4LPz9H80W7LDr9LlDJtc5EGPbLhq25HoJjsM6RDGzGYgBTTEvcJS6aw0HPnEv+1LsZ4GvHvHkeGHyi/2NEoAAXACm52+0OrsjKADdNMXePQ8zghKhS/5FOyff5dakTWWTCexL8wvhYqRKxLoIl9ZJq+XcKNSMTtQzgh9vVBnyI9hYbZ5TwZ6bjwxHJZ8IZgVtVlcRtnEQfs9c7hgNiioCqwYi8LMGiTZJHgWT16z095ZEPS6NkSIYWbzmXL7sRz+0fvUsVpQo4HbYSFLhTyq/OM4ixFMqSkKnZtxfOQNIj3D/wIb6fwr46ygLDDLyud4erpD0LST7emlCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=ew.tq-group.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HXAyW+PvnZaxUZ+B5d/wb4X82jQDKHGVdyAouxXZPJs=;
 b=sYk1UQbGP0+k0dab91PMaCVVtemplyX1Cjg67rqUSAZqoo6RdcVsnLp/tfq4eDGEpF28ohmvzzl7qdaU6s060RqD807o9Sxs3rer35KLyCDGlK2yTYbOAZBChth/50qeErtcX5VascbiDASAL4mgF+RwCiaZIfEd31k+YuAsAWI=
Received: from DM6PR04CA0030.namprd04.prod.outlook.com (2603:10b6:5:334::35)
 by PH0PR10MB7063.namprd10.prod.outlook.com (2603:10b6:510:289::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 11:50:15 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:5:334:cafe::68) by DM6PR04CA0030.outlook.office365.com
 (2603:10b6:5:334::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 11:50:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 11:50:14 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 05:50:12 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 05:50:12 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 05:50:12 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60CBoCBI433724;
	Mon, 12 Jan 2026 05:50:12 -0600
Date: Mon, 12 Jan 2026 05:50:12 -0600
From: Nishanth Menon <nm@ti.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck
	<tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, "Andrew
 Lunn" <andrew@lunn.ch>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hardening@vger.kernel.org>, <linux@ew.tq-group.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and
 MBa62xx carrier board Device Trees
Message-ID: <20260112115012.aiaa7tpznzdd5ds5@almost>
References: <cover.1767627010.git.matthias.schiffer@ew.tq-group.com>
 <5df62f37eb84daff28008b8f9d5bd544b2f3a6a4.1767627010.git.matthias.schiffer@ew.tq-group.com>
 <20260109195912.c7wiyzj4qtdlxkh2@tumbling>
 <b5eec4417133c2802a5fd716aba6a0f7f02bb0ba.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b5eec4417133c2802a5fd716aba6a0f7f02bb0ba.camel@ew.tq-group.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|PH0PR10MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: 0214ad57-7c19-4d5e-e690-08de51d0bfbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|34020700016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+wTk6ZiWnkbsoFhFEMkOdqDbvkI/wYqoBshr8BQ0vUkd22gmH4HVtUbOjDS3?=
 =?us-ascii?Q?wqzksk8UnTT59DUtPwaIZjp2T12xbacHEa7HiaDoCgfocz43u7izt+C0F7IX?=
 =?us-ascii?Q?KcvDT38QYMUgTHCNH1Ovq45Q4XecSSwES0nCpjcAtiEBgSRy+6+Lfnbg+3IW?=
 =?us-ascii?Q?nP2LwBvCkW9OO0mLJ9TyMUWI/QmhrLK65yEH/UaZqXFiKovm3jYU6BrA/wa3?=
 =?us-ascii?Q?DrOIcmw9+oBfnbb95I06mx1rZUl+dHSjlr5xti878GVNDdSxpS4UUtwBmr2d?=
 =?us-ascii?Q?j6et4kMqxDcxlqlkjtkeqdCB1pYQaehGigSKR6XU72pbEAMznAYHDDeLQItW?=
 =?us-ascii?Q?0+8CLQ7HXvwmEaXZnNJuwuJPM3rxD4lm02SWZWWy6c2sGs4WlTg9uAfiKE3f?=
 =?us-ascii?Q?BqGsglJBh1WrUtjOiYsttxom7v2oKHIY55mYBBZUVBqsbrdTv3B6aM4NYlID?=
 =?us-ascii?Q?TEHXAIiIDO3/GJ0HR1ccADYYp+/zqnIs2Uwshb7QVSdK+9yT+iG78h7s0tGQ?=
 =?us-ascii?Q?bNVnFbgxbN6qN/eBLGWygPgqcMRyZ6TinhsrIg8E49itjB2WdqjpfDIJYcPN?=
 =?us-ascii?Q?5hVuMYg+3RnLrEJpUJSpIwC06F/xt4qGqnrEH79+G77XK1tFDme8KtQRQ6q5?=
 =?us-ascii?Q?RTDwNfcCJ0wBCMVxsMavPRqAvoUlPk0vlwEQAAlZMCF0kB2ywu3d9kEgEIug?=
 =?us-ascii?Q?UndsJfYJEffDcvTK90FUBrp4ypb0GABuXrT+m3vVhwKPHJ9Nf5F02IEg444n?=
 =?us-ascii?Q?m2YcTVefmtIUZGKOERij+mLrcrk7ipM9nKkspvw1hIKWBmIW55wEXlP8O62U?=
 =?us-ascii?Q?IhQI4SicvZ35vfLUGK0MW5kPGzwS65RvsIOUJZbqoKFk2VXXoM8S//QattN7?=
 =?us-ascii?Q?MALmMxDzIT+haW9eUMc8HzckRLk6VeeZkzMbCA39C/qcTSqnMNLeDzw5I3Ue?=
 =?us-ascii?Q?Qj0Es1PRCkkGFlnr5NwzPs9mvGlPMrfw0CXupqF6rvhVy2cNVPPWDrXCclyQ?=
 =?us-ascii?Q?p2D2mHO2YhuCd4o1SaqLu9yL45Z2cXg2KZIyotfE5mlRp4DBeZzmbn42k7U9?=
 =?us-ascii?Q?nT/Qm0LgLx9cBw+I/DYPR03egl6Mp/AFVbllnatUpGJsQ4bTIiJqLpoDR/oc?=
 =?us-ascii?Q?Sq+ex6VGFKpsDNH4H7sos3GYhSuE1IsZz3pZSkAG4CgBDv+iGjk1FhB6bRYc?=
 =?us-ascii?Q?Bc9gImEZU4onLzJ+wVmIi7n6apeONAF7ZcgvOlwkYRmfDFGOaIalXjtA+ML2?=
 =?us-ascii?Q?Y6WCwOmWrFILn6AGVxJ1JsBpHP7F1bTcJwcQE3/MnkcQHElQdir9RciTUS6+?=
 =?us-ascii?Q?WjLt22TRx9ZFOQtLC0uirI5viHYDz92bMXofM+2ePZPntGa4szEX8yQLrmXc?=
 =?us-ascii?Q?h0veizyh8EmTIZBcfkgghieL1EAGY2UPwL5VgVRvVdw43yoZh4b7Mrjnlq55?=
 =?us-ascii?Q?33FqvYXsqJQ0Zz1438US7b5UmkB5vNpugzeDprnYnSkJol9/qFscq1WwEIvW?=
 =?us-ascii?Q?LeTB1DrGzlSqyT5nyv1/j/0IjbAWpwyGfE339CRAWsdx09G0TzbkF1a9wC8M?=
 =?us-ascii?Q?ZC5szOXNvciiE7mU+aI=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(34020700016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 11:50:14.4736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0214ad57-7c19-4d5e-e690-08de51d0bfbe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_035020_890190_BA30A7FF 
X-CRM114-Status: GOOD (  21.05  )
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

On 12:21-20260112, Matthias Schiffer wrote:
[...]

> > > +
> > > +	lvds_panel_pins: lvds-panel-pins {
> > > +		pinctrl-single,pins = <
> > > +			/* (N20) GPMC0_BE1n.GPIO0_36 - LVDS0_RESET# */
> > > +			AM62X_IOPAD(0x0094, PIN_OUTPUT, 7)
> > 
> > Could you follow the comment convention you have elsewhere? please follow the
> > same in gpio below etc..
> > AM62X_IOPAD(....) /* (N20) ... */
> 
> I tried to avoid making the lines overly long an adhered to the regular 100
> column limit where reasonable. I agree that the current inconsistent style is
> not so nice... I see two options here:
> 
> - Consistently move the comment to a separate line
> - Break long comments including pin name, pin function and board signal function
>   into two lines
> 

I am not holding 100char limit for pinmux definitions, just pick
a consistent style through out.

[...]

> > > diff --git a/arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi b/arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi
> > > new file mode 100644
> > > index 0000000000000..1b7d58cb7b936
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/ti/k3-am625-tqma62xx.dtsi
> > > @@ -0,0 +1,331 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> > > +/*
> > > + * Copyright (C) 2021-2022 Texas Instruments Incorporated - https://www.ti.com/
> > > + * Copyright (c) 2023-2025 TQ-Systems GmbH <linux@ew.tq-group.com>, D-82229 Seefeld, Germany.
> > > + * Author: Matthias Schiffer
> > > + */
> > 
> > [...]
> > 
> > > +		regulators {
> > > +			reg_buck1: buck1 {
> > > +				regulator-name = "V_VDD_CORE";
> > > +				regulator-min-microvolt = <750000>;
> > > +				regulator-max-microvolt = <750000>;
> > > +				regulator-boot-on;
> > > +				regulator-always-on;
> > > +			};
> > > +
> > [...]
> > 
> > > +
> > > +&a53_opp_table {
> > > +	opp-1400000000 {
> > > +		opp-hz = /bits/ 64 <1400000000>;
> > > +		opp-supported-hw = <0x01 0x0004>;
> > > +		opp-suspend;
> > > +		clock-latency-ns = <6000000>;
> > > +		/* Enabled by bootloader if supported */
> > > +		status = "disabled";
> > 
> > This (bootloader enabling just this node) wont work unless vdd_core
> > voltage is configured to 0.8v as well, no?
> 
> Correct, the bootloader patches both PMIC config and OPP table.

add documentation in regulator node as well, please.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

