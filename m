Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFADCDC171
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 11:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0/Q07u7jpSH+P47c9z6hs39qoiQuJWMEBOPMvn7nqs=; b=mu3grdKRgVCw5Jmb9ObDnYCBgO
	8XpxhFtDAG7Y8NIUsHu6UB2qW3GahJmxjJcPAmqhDGpLxVDcFK/u1bBQXSOaoY0p8nYJ8ILcDUykh
	/li48Kor04mGEMsris7qqdGpUTMsmCNr7hl0Xjq48clnO+5ZHma9ieBNP1LDmzlkWgeXgB0KCv0Bb
	Adus4ipwyKA6PqAuN7bwpGAkhaspGqXWJZzfAUlC64YtiMUQqfl9pEIPLGO/TmXbCI5PrgumECcBf
	/T7mOgEXA+VjmehSsw71F6O73NuhEo53WD2G4lq+PDJOiAt7HYWo6xKQil9xpi6G1ItjBuhVIcGUg
	c8JDC5Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5gW-0000000CvlH-3gJD;
	Tue, 06 Jan 2026 11:57:12 +0000
Received: from mail-westcentralusazon11013035.outbound.protection.outlook.com ([40.93.201.35] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd5gS-0000000Cvkt-3vEi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 11:57:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GU+xXHQg6LutCdiO6xgHkWfDPb57lC4gSQCvqp4Xdi2UUexJ1fPv8egQ0I9fPSPeWlbqhLLFnbj3pchku0NYggJuHbqG3nYb++a9/j2DkjIptc7fx8OFSjp1ceIUGaKyyjPWaySk///lGQlkxhFjt1M3CpZaXHYZzKEMlIeLIgIX8GAu5+83u89SEUG1SCOBTIR6oWmhUmcHz1bm5D8+ezE0SYcP7Q+BtAOvCvUyt6gDZYpDks4QCOXqO6lv6Qy9nzCIeCOc+rOjry5SQNrsArgZcVzvlwvmxpugRGPuiFn48RR2sfjXnAgw1hTb1vKHyiAG9JY+AlGoP24hIPKy/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0/Q07u7jpSH+P47c9z6hs39qoiQuJWMEBOPMvn7nqs=;
 b=D1PaRHxWjCL5dEL7bQ2C42ntmob7I3wElhKW2mqgmYOv2Lb3/ZCJp1YpdWkWkjqG0UwHX7HXnikwDcrDXkPq10QK1X80z0OHFJA4PFQ8/qmsK59vHteqTD5Xg33KcNrPua5DB831eZD99iiyHtJPQdgP2QkUdeJ5JEVMPijgZqdFkgbFUhV1a3IkSV7Ce/7hN4IjCoib8DSePWzKqTMx7LKfVkaogQADeJV/vRTJGx7ulnCap3CMpNAcImmRhYZvSoXBu92rQBhEYheLq/3zxMbq6AIEMxdm90bsRftgGY1QI1XkJyjyc9HZrh5ZgUXHtg0GcXXEhDYAZl6x49fAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l0/Q07u7jpSH+P47c9z6hs39qoiQuJWMEBOPMvn7nqs=;
 b=W70RSTM7c4Rj7MpTOYrCwO3TA/+iBXnfrYOjc5RpKve2gEIhhWOepbPF24+f+DIR8MLgLQHlFyGED9hfSLu3Ut0BT2Jx4/mdrXYc0WhZ9mmKkih0YZVaSoLAGcHIUALPMJXnYC7U88K2UShWrG0VfrRkPv6AOsGXk7zdf5443xM=
Received: from MN0PR05CA0010.namprd05.prod.outlook.com (2603:10b6:208:52c::19)
 by IA1PR10MB7166.namprd10.prod.outlook.com (2603:10b6:208:3f4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:57:03 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:208:52c:cafe::c3) by MN0PR05CA0010.outlook.office365.com
 (2603:10b6:208:52c::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 11:56:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Tue, 6 Jan 2026 11:57:03 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 05:56:58 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 6 Jan
 2026 05:56:58 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 6 Jan 2026 05:56:58 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 606BuwUA2962856;
	Tue, 6 Jan 2026 05:56:58 -0600
Date: Tue, 6 Jan 2026 05:56:58 -0600
From: Nishanth Menon <nm@ti.com>
To: Kendall Willis <k-willis@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Dhruva Gole <d-gole@ti.com>, "Bryan
 Brattlof" <bb@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<msp@baylibre.com>, <khilman@baylibre.com>, <a-kaur@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: boot: dts: ti: k3-am62l3-evm: enable WKUP
 UART wakeup from LPM
Message-ID: <20260106115658.susgttqvokqeasz3@width>
References: <20251230-wkup-uart-wakeup-v1-0-cd6e15f8d956@ti.com>
 <20251230-wkup-uart-wakeup-v1-3-cd6e15f8d956@ti.com>
 <20260105135520.rqnysf77ou2kggfh@shakiness>
 <c477e23b-83d2-4369-81d0-b914089842f1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c477e23b-83d2-4369-81d0-b914089842f1@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|IA1PR10MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: c1a7248c-5219-4595-07db-08de4d1ab51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oQUb4sVlvIATp8PKP1v3nl9qHpnQbQAO2uHqU+YfQqmVfQ2+DstFjUwcdl7D?=
 =?us-ascii?Q?L6MdjM7GQpUYQDekmJWonKM37aWFB6xuaewePUOLMY1mi0v3GF7V/468xMOe?=
 =?us-ascii?Q?Px7WP4cuiezQa4LU+mo511imh4s4kGwslhPLe2nN9k6Ukj5T/6bMO1v3ReKY?=
 =?us-ascii?Q?rbzZIKVPw3SI/O229OHYXuGvKyXyfJ3Lxy5skkXXO9/E0amW3+LyP94g/1Qi?=
 =?us-ascii?Q?OlKKcOPHC8FvU+dZoNwCNlXsJVMJnbuX7JZ7ajRap/kkU39hg8f6EMU8s/qu?=
 =?us-ascii?Q?/zCWPvT8ekXpSA0QRBDZ71ZvDHCNTYjI8QcvZS/2dlJUP3RLxfK/dTE487rd?=
 =?us-ascii?Q?c75Slr5KVB3wF+vGOIOpCJlyXdPCBFJtpZH9i88Vny77wq9fLW417NOUMx+6?=
 =?us-ascii?Q?QwdXJx0GFeTLIihY8rfZKSOc/rx2B5Cpnf+D7jI/GPf39g2RG/ikthMBqkCB?=
 =?us-ascii?Q?869OMDTyBGHqfOjL7/WjE/+djJyyMFjqW4Wv+bldq2uxBudR33J1H69jtezE?=
 =?us-ascii?Q?0eRROEzV7hdRfl5deXyTxiqZprwmb3QIsXDJ+YvbxdXDo08SOZmq1Qjz8hRM?=
 =?us-ascii?Q?gwcuyx6ZKmHKSZd3qnhtdjMWu3nuENI2/0TCgrHThwACumTsH2D14PCs8HYT?=
 =?us-ascii?Q?4kQKrXorz7T1lhkztLdrSduijhyRpRqzpPbA1oEYcGuz60paekMns4Oznl82?=
 =?us-ascii?Q?4JD172ZjNpI5kFpSCHsHd0u/Fbxz2n8tMKdgWYc1DmeixKuLbB+POwikEC9G?=
 =?us-ascii?Q?vjc3bX16JzWekxLZqi5Fno93DwEUH9Dyr4S31NX2k8DLAA8TgQqbgKn+3WBc?=
 =?us-ascii?Q?27GWMdcLiR6q70h8SySMUvzWY//pDfZzK8CvFMAml76ug5jgiCyp8PywHMGW?=
 =?us-ascii?Q?o8DPh8qFFq1E9pwHZB/n1chBg6MO9uewrYkq99QVDnvYJyAhs+3maeSsJKLj?=
 =?us-ascii?Q?gU3xpTYzAGHnSeNnnx/1shitFu0tXDP13WFUsiLlgY3FbvnyF2qhQYpDmQc+?=
 =?us-ascii?Q?qcm1YzMz8RkRovDPm9eAv63GSqFFvCofLpaoItgNjcMjNnWZyKwBAQegy9+P?=
 =?us-ascii?Q?ACaiWBPUxdZilE97OANy1gImbiHoh+Q5sEq0YlSN9YueC/vhDLrEhcDWQjk+?=
 =?us-ascii?Q?QZUBIvTKqf6P6cyGvMrKd+1ejjM0VDuiYe+B3BiK0JZM6a9RIYetAOTzYemr?=
 =?us-ascii?Q?Dep3qbWrMuPrEbtynFseMbBb8VQHTx/j0F760U2Gr03nHaeT2DIE11vhtbp5?=
 =?us-ascii?Q?PyW5+YBuNIJR9GnvNy7hWtGV751rA/UmRS1LoH1G2prvF/lSZGv0OdxGavR3?=
 =?us-ascii?Q?sRdO8OAMcBRv5w/sh19Fd4+P6VsCNmrNpFQIRDx2jpCdsDQYZEvkjMABWnu/?=
 =?us-ascii?Q?DKLpRsfc9LYJE6W4Wnjws1WiHflXAkxuiumm5+3IL5sqc+/TwKj8xU0KdMXb?=
 =?us-ascii?Q?GfK7sAuzSc/kHwtLGBVMR49bUq25+tWYbBI3Oy14Cayc5XdeVaO6l5k1kf0A?=
 =?us-ascii?Q?wrYv54dFSeyzgjSSjpudKeY1n6wvFdKr1puQJfo0IdNLGTZD4udlE1Z9XzYn?=
 =?us-ascii?Q?Qj6Xn+xLMLP1ZSPz9TY=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:57:03.5118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a7248c-5219-4595-07db-08de4d1ab51d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_035709_694939_AC8188D7 
X-CRM114-Status: GOOD (  19.89  )
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

On 16:10-20260105, Kendall Willis wrote:
> On 1/5/26 07:55, Nishanth Menon wrote:
> > On 20:51-20251230, Kendall Willis wrote:
> > > Change the status of the wkup_uart0_interconnect node to enabled. The
> > > target-module node sets the UART SYSC and SYSS registers to allow wakeup
> > > from WKUP UART in DeepSleep low power mode.
> > > 
> > > Signed-off-by: Kendall Willis <k-willis@ti.com>
> > > ---
> > >   arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> > > index cae04cce337366b50928d39b0c888550b14e43d3..02b1a1c76b2ee05d49cd69d199a6aacdb1973fa0 100644
> > > --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> > > +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> > > @@ -359,3 +359,7 @@ &usb1 {
> > >   	pinctrl-names = "default";
> > >   	pinctrl-0 = <&usb1_default_pins>;
> > >   };
> > > +
> > > +&wkup_uart0_interconnect {
> > > +	status = "okay";
> > > +};
> > 
> > don't we need to set status okay and provide pinmux for wkup_uart?
> > 
> 
> No, only the interconnect target node needs to be enabled because it manages
> the SYSC register. The SYSC register configures the WKUP_UART to be able to
> wakeup the SoC from system suspend. This allows the WKUP_UART to be wakeup
> capable even if it is reserved by firmware.
> 

If wkup_uart is controlled by firmware, it should be managed by
firmware. $subject claims that wkup_uart is being enabled, but it is
not.


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

