Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E83E909AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 15:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bl+k1GV91xykRRXb61NiR5J72EFBAoOR+XEhRiy6yg=; b=z+jV//2BSLqX7joXp/hhTdglLH
	VWZjQmhZjwS8yaJdf7JaAPyq8lrZ//Z0uTtQCggMDhnOFhoCNnyYPZ3VpMuxSBhXUyX369M+Pd9+j
	7tii4WeT6HtQmd+gIFV3r+M73GD0P+lkCduQncEIgF8TUHgQ0F2YgYFxXcyyyYbaJKhXk2X25QQbI
	qGf3xKrfFWE74GrJ3dfCSk/ti+XAz3kMI9va4/d1LTjUVwfdkG32Y3cBsKmlMpCKLyINALrM91YlT
	JPUkj6n/qmPQiEE0dD3yd97XYVbLtW7zI0Ip2eawN7BL63olnnpUp4TMyXgNJJfJ4gzpjP4u0qS0t
	SsJpxc7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMnJ-00000008UUc-2KcX;
	Tue, 17 Feb 2026 15:15:21 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMnG-00000008UUG-3wNv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 15:15:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPMg44CSNTinjrv4HCcJy037OMTzBgRWFYUo8AVxOGhuWebX9RgLPyWsDZAVFqm+mVP77qu8NZmPVWb02yHnXsnwBwQOzK8nzVF57/FdUpoMiH7Ye+6sFRI9A/X/vGLf18SjX0GvAqyxop9RG8VZzdPlkG35qvENpnxaA6ZolrcYrN/1fQ12I4ZMLyaGumlbE2bgXrq6Po1fppoujdaSL/NAWZgkoH6XQ5JXihgV+n68QJGkAGR5T1kKdCNEP4cpSuwwM2qg+Q8qboeYB2i1CMdr81SjjdoLWLzWe9Uqg1qrJ9+motIk3BtwhpbkRi3Na89bJ/LxoANK8OMuK8VU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bl+k1GV91xykRRXb61NiR5J72EFBAoOR+XEhRiy6yg=;
 b=LexTytnTfmnipuQ9EK66XymGaBmUQJfddBOK4L+81cRJVtRXE6GZxeZ0VAB0vdkkb2jsKrGXXriii/e1/DUiJMG9paoaPno7cWjAsMkCPTOUcp3fNLjSqObLfkcKDUOjsAuYyTHRVBbmAs+bn6VjWZYeQNRLc0QOsyJSzFLtQzYh3HPSh9xkOnSr72L1nxR6uendCtv+kK1n+rkkfDq/8T4Oq4Y4TLuL1kJCg0nJjrvxMCCVmZrH3W0uoAOJolqmRe2y4FvhdP8eaU/U9MMgwLxHB1ifHjTrO9seRG86eb5+JB8U/mvkcMwruhfYnESfqDFb5OfQXHHJkwrGktd6rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bl+k1GV91xykRRXb61NiR5J72EFBAoOR+XEhRiy6yg=;
 b=gfs/H7NbFOEyZ/mN2r0uhQh4WAaN7842qHd9u0cz/RPMBHUwaYRPkYn7TWDz0nebJwaITq0ZWWYUoPmNPnfTETI5aSgn/yiiZQjIsJr/2UMZv8VkXJ5OodkG18tDzD5iYJN4l8e5fG+v6bR8MolRmqPz6+eFOECnYFLP1mWQpKh8daZNJCkMeiLZJM7Rx3EVv6DUQSX6a06yPa7k+A1JWZe1kZd491DRXtdT96o093vohXvaN9A9+JNqH32mLi0GgVCDtggelMZkqUDNEHcFzG0AxSSknJWEMJBrL3YmrsV4V7P0cP6l5BgfqXCuCbu25icARQA6d+sWJWt9/nz+xg==
Received: from BN0PR10CA0018.namprd10.prod.outlook.com (2603:10b6:408:143::29)
 by LV3PR22MB5724.namprd22.prod.outlook.com (2603:10b6:408:275::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 15:15:13 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:143:cafe::f4) by BN0PR10CA0018.outlook.office365.com
 (2603:10b6:408:143::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 15:15:13 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Tue, 17 Feb 2026 15:15:12 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 95392E8F41;
	Tue, 17 Feb 2026 17:15:09 +0200 (EET)
Date: Tue, 17 Feb 2026 17:15:09 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: dts: imx: bx50v3: Configure phy-mode
Message-ID: <aZSF_VIBRPodKCD6@zeus>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
 <20260217125952.53997-3-ian.ray@gehealthcare.com>
 <fa3805bd-d242-4399-8175-4b8dcd0f84b6@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa3805bd-d242-4399-8175-4b8dcd0f84b6@lunn.ch>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|LV3PR22MB5724:EE_
X-MS-Office365-Filtering-Correlation-Id: ad743c7b-15e5-4c41-516b-08de6e3758de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bEZVRjdqK3Q0UklwbEJlRkpOSmtRWFU0TTBQTFp0YUR0U3kxdGZrejJqQmRz?=
 =?utf-8?B?VnQ4d0s1RzE4R1FQYnBTdU9EM1labWZub2QxTTZ5VURwNHVyNktiUmtXQk84?=
 =?utf-8?B?N21qbi83ajVkb1kzeUxBK3JlbnlRa3lQeEg3OFFaQnB5NWpnWG9qWE42bExR?=
 =?utf-8?B?cUh0V28xVnhlODc4YzEzQTZhcXlTaENzREFHRlJOb2g4ZXBERVBGb3NnUVpw?=
 =?utf-8?B?YTQ2MUlqYlpJZEhhd0U0Skp5UVV4U1h5YlRjWGFKRHZCZEx6akVNWmt2MVhD?=
 =?utf-8?B?UzZreDNDOW9uOHNRTlQwOU8xYjZrRHJFeFpTbVlPREZGdWdIZWN6amZ6N2E4?=
 =?utf-8?B?L1ppWXJGQ29GS0E1eGRocXVKMU80QzVkZndDQmJQbStNelVDNjJnVUZ2SWwr?=
 =?utf-8?B?YndUcWovOVpBRm5zbU9rQ3MzZ2MxMlJpTXl4SDlQWC9haWhURGEvV3pvdXlX?=
 =?utf-8?B?c1p2K1VrWTZYQzBoVXNZSk1XNjdvZVV4T3pSSzVpbjE2SGoxRkFlMzJsV2pL?=
 =?utf-8?B?V0ZqaGNXdUlvUkdaSWR1UHkySnBOOWYwRXNmZFRjWTZDMXZ3a2hLNk5NWUc5?=
 =?utf-8?B?d2R1bDdDS3RiUnlCc0JWa1FPdHlJL1JxQ3VFbUFNOUdyc0c5QlVkOWJ2WHZP?=
 =?utf-8?B?dnBSWUVndmtZOHQwbXhpNjl5UEZHaG11SDZGaGZTdmVKZUFWK2thR3JqS0ZF?=
 =?utf-8?B?RG1lZnVqYUF4dXF2Nk02dEllR3ViekJvYnM2aWJBQmtHTFVjVEN1bGVOWDZs?=
 =?utf-8?B?N1p2TGc1bFpNTDAvZTY3bVJMazliTUtBd1VjRnBCNHRDemxRbHlLVmZXU2RG?=
 =?utf-8?B?UXZjNngxMUJBOUR0UGZ3SFZkZUIwbWtMRXhtRWpHU2sxNlVhY3VqSENxUWVk?=
 =?utf-8?B?M1NoMnVtajVqWnh4N2VUQzZlY0JzS0ZITU1RUzZqR2tVcHJTc1FqV3d6bGZq?=
 =?utf-8?B?SGlObmpoQ1IwUXFabEk2dzczS2ZwdkhKSlRWb3E1aWVBbU5iSEZaanI3bHQy?=
 =?utf-8?B?MzUveStBR2VrcU16TWRBcmczTVRMTjkvRUFsQmJRaUxlNnE3c0xZYWc3dC9T?=
 =?utf-8?B?NXU1ak1oVEVudFNRR0doWmRWS0UvRHdacG41QVlGQ3VOTUhnZk9zelJweUNQ?=
 =?utf-8?B?TmRXckVnd3FrbGtjbENIT2xIMXlHSExQRnU2TDNOWEE4d2V4d0RRSVJNNlJs?=
 =?utf-8?B?UHB3WC9randHWEFvQ01yMnNCVGh1dE0rRWJBL0ZGV0xDcDFINHlrRFhpZGp5?=
 =?utf-8?B?MTg1Znd3NkJTclM3Z1NObTR0TWQzZVh1TW80cVc4c3ZlMmR4UGdxTGJpMWpy?=
 =?utf-8?B?eSt3bm1iVHZOcVNsbC8rZXJTZTdENmVJOUVrY3lzUlhhakhYd3Mwdk9jYzls?=
 =?utf-8?B?aFdUaWlJNHFDQmU3R09aUWRldzNlT3I3bU81Rzl1NDdwRFI4ejlBaWVGZFRu?=
 =?utf-8?B?YWNlSDE0NGxLMEh6MXJVN25sQ1I3UW56aTM0KzltSXN6YTM4VXBhYXp6K0pj?=
 =?utf-8?B?a1NrN3JkNGN3RkpkMVoyZU9Tb29ndnNaci95cStYaUNmUUxIZ0s3dXRZdGlI?=
 =?utf-8?B?UkVrbVpuQ3RvTzQyQWlXMzV0dWJIQm5qcVJjQUw2WDF5clNScUhpRnlLektH?=
 =?utf-8?B?RVIrN2h3eG5YRXNOeHYrQ2s4bm9IeVJLMDFqekhhc0pjZ21qNnJJa3RBL1pz?=
 =?utf-8?B?NjZOQXR5dWZ2R0MvWFVWUWNaZTVzMEFzdmQxcFRSOTZxYjVscnI3MDk5WWk1?=
 =?utf-8?B?d2UyMmE0TzVsMktDZkVmQWxSZ2pmNnlBb2RoVE5ZRjNhUE5MSUdObzg3Yncy?=
 =?utf-8?B?YlNyNk53RUxabHRPQi91NDF0VUJNVnAxQVk2Q3VkUlNsUDcrRlVNNG1jWFM3?=
 =?utf-8?B?Y1oxMFBHTzdsWkZNNVF6V01Sczk3MmNBMmZyZEZmQTNxTCtuOXZLTzB0WCth?=
 =?utf-8?B?TWdWVjdITmdwUnN4S1JiaGlOSXVFZVorK1BOSG9NWmhkOFA5RXdPUTZqdkU4?=
 =?utf-8?B?VU5uVURxdHdrVDJpK0hHT0Q0MEFZNVQrS2w1dHZhV2NwNGp2MFhISlVPU01a?=
 =?utf-8?B?a29FTWdKT3ordngxaHJ1SnI1aStNajZJT2lPbmRRZXJaQUNmV053QVBtRlBp?=
 =?utf-8?B?TzQ5V3NmcTNJNmdWZklteENvZHRMVi84L2hUVFd0czhXbTRpN3pPTnowVFFm?=
 =?utf-8?B?OEVGcEZDQVpjNzB3T29MM3BqWE12OFBuVjk4b09ZcTZmUEQ1STZDKzJsbE9Y?=
 =?utf-8?B?dFUyRlR1Vm5Jd2RqSDlMME4xTFRRPT0=?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: V7XXtUFVjPZQnYdGL5jOPrIwlABARtdWBd88R0MDhflaXmj23LzwwmY6SDu3vHETZizSErrg5h+rLYUaEIj7szpifHcKpp7n9TXWrE6/Fo/Fwo1Ex9umysK5DtkCSc/phFHnovQq1xvmkdyaIG7NT9Zbw1ntw5BusfRIh3myMvCycGddCtc/8md0E6PIU4smRxQS4OU2auPQocelWp1Xo88iPKZ3Lme271VQAKlk7+S0d58qHlbKgXfM3KC3IkgNWAa4wK0FqH1jHqJpFwbiXIBLWtbP04um5Pd+CCIEW5Jys0wmhv+F+bmeHbgaeleFvlv/CfeKj/bSpNIrQ7BKNeZjWXxheOy8B6QRDO86ACp+r5EPpz5RTwn3a10iquFsVq1KNtV7SE4B/RhlDJibpCf0G3oY/U7b3/rGSBGtloLtOX+LXZs1zx+t+wx5rYiK
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 15:15:12.4758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad743c7b-15e5-4c41-516b-08de6e3758de
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR22MB5724
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_071519_004178_BE3A15B3 
X-CRM114-Status: GOOD (  17.80  )
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

On Tue, Feb 17, 2026 at 03:58:42PM +0100, Andrew Lunn wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
> 
> On Tue, Feb 17, 2026 at 02:59:49PM +0200, Ian Ray wrote:
> > Set `phy-mode' on network switch CPU ports to eliminate a warning.
> >
> > Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts | 1 +
> >  arch/arm/boot/dts/nxp/imx/imx6q-b650v3.dts | 1 +
> >  arch/arm/boot/dts/nxp/imx/imx6q-b850v3.dts | 1 +
> >  3 files changed, 3 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
> > index d994b32ad825..7326b8ad08cb 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6q-b450v3.dts
> > @@ -140,6 +140,7 @@ port@3 {
> >       port@4 {
> >               reg = <4>;
> >               label = "cpu";
> > +             phy-mode = "gmii";
> 
> Are the PHYs external to the switch?

Yes, port 4 is connected to an I210.

> 
> >       port@4 {
> >               reg = <4>;
> >               label = "cpu";
> > +             phy-mode = "gmii";
> >               ethernet = <&switch_nic>;
> >               phy-handle = <&switchphy4>;
> 
> You have back to back PHYs on the CPU port? This is not wrong, but
> unusual.

No, the patch sets `phy-mode' on three different boards.  (If I
understand your question correctly.)

Thanks,
Ian

> 
>         Andrew

