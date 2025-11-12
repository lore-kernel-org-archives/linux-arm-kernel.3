Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042CDCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNCtjxh7KT78Ck5HpjZt9v31jCCMuUp3++FTbhSyOuw=; b=bUV7iYpTFgTH6s/ikL93u9EyYZ
	8thwZJS1i6dnN/RG2rbm4OimiJVgzfadHBagkfo0FiE0iPzhgzzWR7Tmgt7tXDd1xocM39aoAFicU
	wBBAASim+YEWGi3YFalg81rnCAbiOkKgHWSkKgkOJ7tA74vxn67rnETLHI2GrJQ9+/aHIoO87zj71
	4IaovvvXvo7gJFXme7cWZ7qSodVLu59h9OxiuGXP8kbIMRGRz2RBq44e6OG2BWcBaHnq65LBNvK4N
	4dPcupdLL7EWlhJIas76X8+S51NIGCI292gpnAczKpTd82wLDMJzRdoD66cZn3Wnu3alN7oCs9snM
	SBuU5q0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCmR-0000000944g-4405;
	Wed, 12 Nov 2025 15:29:07 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCmP-0000000943z-20LP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:29:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuAH3U0YDwOJuejc6CTd6fLRDbUAQDEbwW64aXq+uEDInBq+tZG0C/8Np9qjm+GavtRwsybzNULM3SH38zA7TaXgIlU/WLyQZl8J3K2siykIDOiHgbFCkz7wKEFbWGeinTmQVlFbFwRMcEC7TODNfQLnkeN3s4n1ozCb1qr5dm5D0qHFMdkXioOFiGy9jtDkzxbM3cOnsFypFNU2MicJ0R7Qb3dQGRGPfJYvsYApPDQQmJVnKjKU5mr/SA5XY8lcsRxWhr5gz/e6zoI3WLAmOnvh4NuHaMoVTnV+Y9nw4F7yofJ2yCU7rNuvsahvby8BoIA8bjHS7JYxLx9+8IByoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNCtjxh7KT78Ck5HpjZt9v31jCCMuUp3++FTbhSyOuw=;
 b=Ng6RBw4OD22uTiD3KefmJOzpkO3+tMf+9umXLja71G57m/Sd/vAgg+jxG/0tlkKnXL8NfiMMzwSeRaXIsxCNdFB8phQQxF24dlBSS2BKBF6wWI5l99DOwu2Bp8gUy88ISjr8eTqUV9OdQh+X5NWRCSfVU10SKiPPc/tYW5AjiuBjYcRuQQ6o3ZHI+xm/kLg9GGAmpNDwo1MBgQM/sodnIwalUtuGmCWNLoFW4ONLuX4DHi4gBbQXxpY6hAV3foEHExzBRf7nUSAP9fF06ya0IAQ4FgfFqxvo5jfmUGD3INlwGWddJC9M3PR20ujxvID+ten7nOY32EsbA552D7LFMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNCtjxh7KT78Ck5HpjZt9v31jCCMuUp3++FTbhSyOuw=;
 b=Ldcbk8VoCohwahdH5fqHUSs2AxmUwfe8sbDeNotejX20wrZ8G5whk64/L/63SNR/hDkaF34l89jicpm4UjoBjuZHEZCgu7NbFAuXBVsoEawcdxfpgi9SXZ2IXtYSrn04GdDrN3qeklL2KW7wZsuosD821/RmNbnMZ3R4M962CI0=
Received: from CH5PR05CA0017.namprd05.prod.outlook.com (2603:10b6:610:1f0::7)
 by SJ5PPFDE7085185.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 15:28:59 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:1f0:cafe::4) by CH5PR05CA0017.outlook.office365.com
 (2603:10b6:610:1f0::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.6 via Frontend Transport; Wed,
 12 Nov 2025 15:28:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 15:28:57 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 09:28:54 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 09:28:53 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 09:28:53 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACFSrks2919754;
	Wed, 12 Nov 2025 09:28:53 -0600
Date: Wed, 12 Nov 2025 09:28:53 -0600
From: Nishanth Menon <nm@ti.com>
To: Andrew Davis <afd@ti.com>
CC: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>, Tero Kristo
	<kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, Vishal Mahaveer
	<vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, Dhruva Gole
	<d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, Kendall Willis
	<k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 3/3] firmware: ti_sci: Remove constant 0 function
 arguments
Message-ID: <20251112152853.3ad5co4usxu7hiyl@ultimate>
References: <20251103-topic-am62-partialio-v6-12-b4-v10-0-0557e858d747@baylibre.com>
 <20251103-topic-am62-partialio-v6-12-b4-v10-3-0557e858d747@baylibre.com>
 <bc987a5f-ee3f-4722-92e5-056bef4d84f9@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bc987a5f-ee3f-4722-92e5-056bef4d84f9@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|SJ5PPFDE7085185:EE_
X-MS-Office365-Filtering-Correlation-Id: d425f3b6-bc20-4347-4da5-08de2200327b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P4gp5Y0YJZxPgE6iFyKXOqaLPhpBWZ6cxAOrM3uwKYT8y9KTbMcjZeKfI1j2?=
 =?us-ascii?Q?9p/J8juK3FucNjSM/WuZBj4c+eRsIBPYfvoH+ARLv2xVGAdsHiEocgt0NZdW?=
 =?us-ascii?Q?zOhSiG+964N/GEZxBDxXGMK2mRHa4WrmneHC5ckTq6Nb5gJALMfUmfFydtpc?=
 =?us-ascii?Q?KhimmtN/N0LBhtv1GzJuLZun/3FS2NXdM0G+ibbICTCJ9OusnzL+sYkoCp2t?=
 =?us-ascii?Q?+okN00hAgeFwFJfecgs/lop9xaEKY05bJuAjVo0r7lByO0tHrtUFKMXPmvgF?=
 =?us-ascii?Q?cPQsSMHqZvkl93yV5abWyXUQswap/HPGC6NyklSS5zm9xC9G49Dw6r+zHuv7?=
 =?us-ascii?Q?jecrmTBQehAtRUadj+vvjpWqAcwMBYHd5pTQ0JKfZTnUK850fuAW1h8hoSYb?=
 =?us-ascii?Q?G7Y9b63P4hbXD8SU0NRmyjDEey1FYmJR4BURgsc/JMxJKXbfBDPBPbA/ksah?=
 =?us-ascii?Q?z3luLW6UoJH52cVgejnnhOT+AKZaHZjwz70YTiKoxMmEDr1Rk0eJg9S4/tBr?=
 =?us-ascii?Q?hkIQv1WMhhb7geeLqwXNRrId+FCCJgAxUUNIue/yp+73IMTiU/Cs/QMUi2rB?=
 =?us-ascii?Q?kOnto+3MNQuYOF1T5Heym0z/5ya7+VFnwAp+cx3IBEvxeFoplb4F6TkYwuaa?=
 =?us-ascii?Q?lPfzI7hEXxDV2rgTpckjo0WFOSD6vPDp1WnT07F0s6Del/rxLJTaj/YZGIhg?=
 =?us-ascii?Q?HaeCOKc3AzaBL+yNfsdwwKGK2NTt8ICgUnWOsMsA/wDwC5B0FFpmK3dLCENi?=
 =?us-ascii?Q?o5rO9NEIGqcoaCCQyajR+VPBBYlk9btIKtWEaMvITIw6eOV4T0weXX1OtaVh?=
 =?us-ascii?Q?97lg65bmTHR6jBay29h7xWVCZeblH8FSOpWzBPUMPOfchW/b+M0NrHMxEF2e?=
 =?us-ascii?Q?ZZTe0BNwTyoRXDpv2tzGfkYdfKomFUNv9gca5lzrE6OTZu56MQi6+pS8OXsB?=
 =?us-ascii?Q?I3mCKOXp6TDmGFLRs8SIwJem+PnkiWYxUb+3DOFmyE8H4S2EIvf/f+CUC8qS?=
 =?us-ascii?Q?hh/wn6RH5ZEdDU77WE7cGOWsgC8aOJBoLryHOETrClOs5QiB1SIPPDtRi/fE?=
 =?us-ascii?Q?1cG7TlrZyNawnf7I9IUblDXJik99Ujn7QaWbGxAS++5JDRBNq83Y3memBaUK?=
 =?us-ascii?Q?n6RXT7ZvUB8c/8HGV/DuUQdZBP/3tPlTpD0BlhD5mEJ4zEDI6Hq3SrMVe0E6?=
 =?us-ascii?Q?ryPi9OhiB09wNstzsyEDYaVVzFjls4ZqnGX5ia5Jmx0825iTd6fQ0l18DIl8?=
 =?us-ascii?Q?nvTyF+ZPiMmza+EVsRMP8eYcN2H9iCVCgySMgMtZW/ApZkftz8ib81uvik+D?=
 =?us-ascii?Q?mUz8g5iGE2+6IxFoKMyxayeJDtIPhqaC+MbJ+BrPImzQAOLl1nQmBuGbcHqB?=
 =?us-ascii?Q?JdUpDDrKqzDY8hGGltvdojUW1PXy5Qdr7uAk4X562kpD+PtrzfuzWYq7t076?=
 =?us-ascii?Q?BS3J+9y9L0SvJLfn+kZw6Z/TEhZJC4Nuj7o5yvgN1Mtz/6mbnJC7HL4Am2NL?=
 =?us-ascii?Q?FbMmn1l5Zvwit3NATjSf1ZpJw6ynY0RtBYGoeusCpSCBlUnXWGD7rIH4pozy?=
 =?us-ascii?Q?MmEr84EYR7GmS4GZ41c=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:28:57.4788
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d425f3b6-bc20-4347-4da5-08de2200327b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDE7085185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_072905_518569_292999A6 
X-CRM114-Status: GOOD (  26.48  )
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

On 09:26-20251112, Andrew Davis wrote:
> On 11/3/25 6:42 AM, Markus Schneider-Pargmann (TI.com) wrote:
> > ti_sci_cmd_prepare_sleep takes three arguments ctx_lo, ctx_hi and
> > debug_flags which are always 0 for the caller. Remove these arguments as
> > they are basically unused.
> > 
> 
> Does that matter? The functionality is still available and when we do
> use those arguments we will just have to revert this patch.

I agree. please leave the existing params alone. no point in optimizing
it.

> 
> > Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
> > ---
> >   drivers/firmware/ti_sci.c | 17 ++++++-----------
> >   1 file changed, 6 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
> > index 811507ded63ac784ad6c6ad77b2f827768f3f3c7..023c603ae58cb5df176c66eec429bd0b4037b798 100644
> > --- a/drivers/firmware/ti_sci.c
> > +++ b/drivers/firmware/ti_sci.c
> > @@ -1664,14 +1664,10 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
> >    * ti_sci_cmd_prepare_sleep() - Prepare system for system suspend
> >    * @handle:		pointer to TI SCI handle
> >    * @mode:		Device identifier
> > - * @ctx_lo:		Low part of address for context save
> > - * @ctx_hi:		High part of address for context save
> > - * @debug_flags:	Debug flags to pass to firmware
> >    *
> >    * Return: 0 if all went well, else returns appropriate error value.
> >    */
> > -static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
> > -				    u32 ctx_lo, u32 ctx_hi, u32 debug_flags)
> > +static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode)
> >   {
> >   	u32 msg_flags = mode == TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO ?
> >   			TI_SCI_FLAG_REQ_GENERIC_NORESPONSE :
> > @@ -1702,9 +1698,9 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
> >   	req = (struct ti_sci_msg_req_prepare_sleep *)xfer->xfer_buf;
> >   	req->mode = mode;
> > -	req->ctx_lo = ctx_lo;
> > -	req->ctx_hi = ctx_hi;
> > -	req->debug_flags = debug_flags;
> > +	req->ctx_lo = 0;
> > +	req->ctx_hi = 0;
> > +	req->debug_flags = 0;
> >   	ret = ti_sci_do_xfer(info, xfer);
> >   	if (ret) {
> > @@ -3729,7 +3725,7 @@ static int ti_sci_sys_off_handler(struct sys_off_data *data)
> >   	dev_info(info->dev, "Entering Partial-IO because a powered wakeup-enabled device was found.\n");
> > -	ret = ti_sci_cmd_prepare_sleep(handle, TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO, 0, 0, 0);
> > +	ret = ti_sci_cmd_prepare_sleep(handle, TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO);
> >   	if (ret) {
> >   		dev_err(info->dev,
> >   			"Failed to enter Partial-IO %pe, trying to do an emergency restart\n",
> > @@ -3768,8 +3764,7 @@ static int ti_sci_prepare_system_suspend(struct ti_sci_info *info)
> >   			 * internal use and can be 0
> >   			 */
> >   			return ti_sci_cmd_prepare_sleep(&info->handle,
> > -							TISCI_MSG_VALUE_SLEEP_MODE_DM_MANAGED,
> > -							0, 0, 0);
> > +							TISCI_MSG_VALUE_SLEEP_MODE_DM_MANAGED);
> >   		} else {
> >   			/* DM Managed is not supported by the firmware. */
> >   			dev_err(info->dev, "Suspend to memory is not supported by the firmware\n");
> > 
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

