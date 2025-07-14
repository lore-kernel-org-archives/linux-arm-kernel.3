Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34903C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 17:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ygSKGZL8Na83xJlW8HqlTS26a5PsVkiYYDDUARydCI=; b=BipDEQl2/NZBMSIIfCtJ9Jwb7x
	sfudie6oaCwjmtQsREDBui5QkHByDj84WnDw4Li+Rp1BLbcNtT/uDH6QfX1FPLgm+RixPzjxKagcG
	v7MAp4zuYDSR1CuSE01PN9n9UeHcMxG7dRL8FzsERuaI7AfaJvl4unkpHOf2fsw3XXW+BhJmX7Kbs
	E3gBgoAxdZxD/GDiZf+OrMSUhDTwy2mpdW1MPzrB1greRFisctJ/G+OYK3MQW+d8gQCu1jMNgVs++
	YWugGfZ4NCXHiz0KjRY7FKo8oqxOWrDmbhxwRkv65pQLqYg24VugnpsfogIA902WjsinXc90YYWHJ
	9WiF7hAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMgq-00000002vCM-0kn7;
	Mon, 14 Jul 2025 17:10:08 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKuQ-00000002cgx-0VVy;
	Mon, 14 Jul 2025 15:16:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jk2IqVgMNJ9O1tLnhnQqoagsZw178bQ3iNEdlEwTrh4h7gHdhl4uKGVPPAHiEbfjyChmTX8oTR9xmb8Ss1mXVyi41RHkmGhfwr0bFRBzd2UJJ2aU2lIDfC1g0tXNi+KF1mb1iCK2o+pLXhrScfIEy4NfppEmwAOdo2auAzTbjKTBXs0RpJRnqxc0McQzaumf4YMCpyw7KtRSASE6ZF3pZ3vFFcPWneif/BlpL1BmsWuXl+kK5xzciYrVo+AdT85P9dI4eedGc7ghOYUG5GzVl+TH6HH0qyIFeI03VgVC7iCKIgHgoDhl8SSuxUiqjLHFjCnKuvlsKlcZXxJmyMN0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ygSKGZL8Na83xJlW8HqlTS26a5PsVkiYYDDUARydCI=;
 b=KsPS3myTnyEIomHLSBL/+PvVLzJRSUAHmIhZ4wE6V3V6Ff/jbMiFvgAPPpNooAsNBIFKfb1JMcOSkZuW4gG+wFYpSLBXUn+CDKj5ehSkW1KEelBYNQ2rSm/S0GbsZvpBHAegFbdxeU/Ul8EbpW4KjaoX8aR83aViBAuct2CevG7BmneZn/IydD64vgo7VN02VJufG8vSL5uPY69pH1NaJ8HMHuqmRc/wXqpabxmcf2tpykdJcIzK2ZFGMp1JBRpb1wwNOh4z+k7tDLBqKX/fLs87WZwa8v8zp3qI+Iqo4zYtjsOYFamBLPmYKbso3Y9O61fSaq3cGh1RONdUzUMl3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ygSKGZL8Na83xJlW8HqlTS26a5PsVkiYYDDUARydCI=;
 b=G6egAU5oA4Knn2YdT69BP9TCGU3IWOiMtNYWXmWbylbXk4vXmhIUkBVAVJAR7Pvh3iAekhxtlGTRmiGNdsVRcTv3q0YNkRCjBQyHu7M4zxov4kLy8yKgmkfwA9mLy7p2VbXIt7IaglHJaLTiqkEY4+Wzeo5vgl1tL4TnLQiPW14=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by SA2PR08MB6716.namprd08.prod.outlook.com (2603:10b6:806:11c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Mon, 14 Jul
 2025 15:15:42 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%7]) with mapi id 15.20.8922.023; Mon, 14 Jul 2025
 15:15:40 +0000
Date: Mon, 14 Jul 2025 16:15:32 +0100
From: John Keeping <jkeeping@inmusicbrands.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC/PATCH 1/2] usb: dwc3: disable for USB_ROLE_NONE
Message-ID: <aHUfFGnGZP4z7UgK-jkeeping@inmusicbrands.com>
References: <20250710152252.2532020-1-jkeeping@inmusicbrands.com>
 <20250710152252.2532020-2-jkeeping@inmusicbrands.com>
 <20250712001131.ax3rw24h3deekxfv@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250712001131.ax3rw24h3deekxfv@synopsys.com>
X-ClientProxiedBy: LO2P265CA0160.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::28) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|SA2PR08MB6716:EE_
X-MS-Office365-Filtering-Correlation-Id: fb44d944-6b74-4f7b-8379-08ddc2e94b59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0muWFhu+jsXp1WDpSsQ6WpMKg+FRXzQY9xpCbmPQN4s0uDwxgrUgfO6RcWnn?=
 =?us-ascii?Q?yW1X+DTxU/Do1ZADAqnvvHS6X9td6uAGr3XaaOitWrq7vsrKKVSgtadtKxex?=
 =?us-ascii?Q?9LlNLCepIxDW3tBGKABFKrNBUWt3uQQP5meYQkEu99dgGuRJu5pSB8cjtiys?=
 =?us-ascii?Q?cnRVxTZln7n+82BIkTTCSmWnXGspPWxoOSS9jdDn5SlyNXmexL5rol/tinFi?=
 =?us-ascii?Q?j1lO2oAax6oAIC2H5L+0gSXAiPLn1PdvAmZNUMr5FDVloo41wKFm3SEHE3Z5?=
 =?us-ascii?Q?HD4t7h4ARSxSbh5tl8I8TWL1l2cp2BNexiq7lflFrCRBvZuYOa6RhL8cqPfL?=
 =?us-ascii?Q?Itmluq4EUh7nGpOQSnNWJwdXpg/69KLjQISv/+c71GxO+zP3rCaY16O0JA1B?=
 =?us-ascii?Q?EwxmJkG/nf4VWVpESBvAyJgRj/Wr5dMF0T4g7tHxlSbbc2m56PUdJP4yUvH2?=
 =?us-ascii?Q?pTuYfleZz3+TS17YpqK/rGOviaUg9cVslRV2nIflBl5EB9aDuhA0ircsNu6x?=
 =?us-ascii?Q?3EYC3/2fdqbfQj3rdTredUJt6y74+Orts6e6R/KatcvoGPhIliXrr0pdgJdG?=
 =?us-ascii?Q?u2ps0Mw8JjP7A1aLtyT6Y6w5vn+2/jOe8iqD9kyyUfs/hZozjaoosVkUXsG+?=
 =?us-ascii?Q?CnzW0wuO0H6iOF1lQVDNd+Cmtg11uMpJ55J5QdoYZmDxAu2TTbWcwyd4Rz7x?=
 =?us-ascii?Q?CeAPcvM88kiMfe8tu6WY2NGYQsD+UAqUIWl3BERaSY3uVSZA7nz+TPth0Yl5?=
 =?us-ascii?Q?JhBdgptiRhpNU+aQ90pOuWy8AOj3OHm6Z9zsgYlUuakSAxHwDJLPkp1G7t1F?=
 =?us-ascii?Q?um6QyriwKsqpTS9aKlt6mYE/36yjrx/SUNZ8rVSZbjfPcsYgkPXcTaFO38SI?=
 =?us-ascii?Q?Jeg6gHBC4F4by9JRq8NCEroffjIG+JwtnRrAgRwMi0jOqnq17/UXYBO2385W?=
 =?us-ascii?Q?oOghl35JC6YHf0JEsydWXAE39v7p19K0SABj/a0tSj565MfpU2Du/Mei1i90?=
 =?us-ascii?Q?wMN/pdAYet6OKuHVbLQY98XE8Vc8tzvssZm2eGBWwf9VGfKG0VuJiYGlKBI1?=
 =?us-ascii?Q?CpBkyvjFcw6rMlTxTrQ8grGMGS6KEMM1yNoZX8mCR6CWTPPtwGl/kf5k9tEI?=
 =?us-ascii?Q?g3V88Wj274pisSNux9/bl4cTQvnon0teFZnhyiQBLyKhcdrKtnsSVAjGZ16d?=
 =?us-ascii?Q?zCz3pTdCDzxqMV5TYw7PVU8XkGdduon1TXqnxCKxVqMAw6k/UZn965HkaGMY?=
 =?us-ascii?Q?+nVnZGhI58eSIcywlMxdHDhX8rkHYAdg98X/MSyyCa3Cp1ldb5qxsuCIHKs8?=
 =?us-ascii?Q?S+eXpr79PU/fvlM6++tuSauHSazKIfJd2i8u/PrvY3p+gvFIWw3yToQvC8Pa?=
 =?us-ascii?Q?vX7imMeuSNK4I1MxDEsZ6WXPtuZcmFzvWUfqK1m8BOusIlR+ZopOnCfwWGGe?=
 =?us-ascii?Q?Prwy837iAS1EIudlFOhiUzIneOUqyPQHmWXV8Ic3X8B/mIzz6RwkfQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR08MB8282.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wzAEQy2pRTc+RXH+nSa5S5ZLviB9wpHnDeSVTxO3pPR//T9UTUZ2YtSSSkm3?=
 =?us-ascii?Q?HMgCBFF+L6oLS5nexHNmYn2SOUOi0RwDmrv1cEM0LAQzpJcgl2qi+MgLi8H7?=
 =?us-ascii?Q?KM3UgK9OaCAJ9sZHGQGh0j5hNPMbTGSHXgXA5T+heRUG2K15o+NJBd+QRZ8u?=
 =?us-ascii?Q?jUB819xmdN59x6DzqsKQF6S6A7NgKf2Z8bikXSrEqQ7rv1DrqmfF9bOZ7cu7?=
 =?us-ascii?Q?c1ZAyJgf3wC9Gdni5bv9dDnu8xDoAe+JdE8KLk5WzYNHU4PY4lYsgHBc0qWP?=
 =?us-ascii?Q?XAJ8tqC+36M8SOJFU3RgRPx3RW5aX59ZFP7Mh4DkLT7qns7DVEHPf88XTCG1?=
 =?us-ascii?Q?rwYDvyhIO54l93AlzRYF28KirwhsKL72kh7qC+2pz4mD3+uUY3Op6YqzIMKA?=
 =?us-ascii?Q?/vOKAeTegvKtPMEVG1qEuTtYaxEGItyudU9LlBzebDB18zV6NJLrJPY7kwu1?=
 =?us-ascii?Q?tA3iX8kAqPd6YxymUrXVegqAQBQ/VrFT/GOB6lmkCMkWOOwczfLugrRQqCcW?=
 =?us-ascii?Q?36j4EOU5KqgkXuIYusZfzzC4+R6XlRY6UK0HsFUq0rMG5+7DBRZLykJELiyk?=
 =?us-ascii?Q?NaI8WvkI7Qtp0T+C9lMRRqBm3rP7w+zGAoTaMtmTg+hUmmsV4M6ShitCK8kp?=
 =?us-ascii?Q?hT/7+d8XjWMZ8PKmforg7cxgIO7WBMLoW/xJrg62FZS2tUk09JoEwLI9IWEP?=
 =?us-ascii?Q?8ZcaHysyqmWPZ+zbb2h1vnlKESE8bA7Fw5h2KeuQy4DdGNjUoxr4IXq/ZowB?=
 =?us-ascii?Q?madkeep/To4MOZJVjcaEva3qfIhHKE61C0YPjz9LYWaEvMFEG9MLhAyf8rPv?=
 =?us-ascii?Q?MXJLNL8vJkBhXNHbDEOP5vQq3dUBsmnRh+CApsXZ+C0k5HydmapMLJEqr/7c?=
 =?us-ascii?Q?CjLH1kKmBeeRhPhaQojHkdXw9/VoGG63Tkavw0xT/hGDUv5yaFN3/lh859jq?=
 =?us-ascii?Q?VuSeF6uXoqiPJxFBuOtKX1TxKTnOTp9hnRSeKvFMBXz0WkupCl810AZB9HYe?=
 =?us-ascii?Q?gFAPHAqAgLBiUTeCSvXO6QyBlbxPW1et8Wqfm8kwzVMU+9THPyl0HvFu1Y92?=
 =?us-ascii?Q?cq+LZO98PZSqb1Wxh5rOREZvzRoLCD9XTBvgeV4VNJ+XlKZcFjaEW7wEMHEP?=
 =?us-ascii?Q?web9HcIy3pjSVSNF62tOZGTnSXI38babhGtURMEYlp1aHjtZbpnDxNVB8rgZ?=
 =?us-ascii?Q?pZNtWhsLeCI3jeJL60Wh+YIT3aAnjLgfCfv4Dh8CbjI2AQaVFnLzM9pjS5xB?=
 =?us-ascii?Q?uYwiHfxzQVm70MY0gs5zz4DaO9PTx2ap9G+ViYaB2iTyRcFfoPUz/17I+PYC?=
 =?us-ascii?Q?tsB3wlfWK5Gh2CqgpjhB6faJpb8ww36ogq8tjjlyCBANmqsQxNo6WVvD6zYI?=
 =?us-ascii?Q?wXFX9GutdNV/x09mgAe+z7WkMpRdYlVBOaHO6xft81gxWDKq/MAgkrwaIFoY?=
 =?us-ascii?Q?wmANAFWY3alOh7a/LQjILrZmedsDfdUjelZIka5oon9zCJMoPAJDopapiM1X?=
 =?us-ascii?Q?Ue5Wb0T58GwOl082jdUYGiS0i8eDXI7AHeigOjxA0Z9iwgTq13HBcRffSl7/?=
 =?us-ascii?Q?7qDJ/DyR+QADp0uGGMTgUPjmYpbk0TtfZ9DjoGeGsXYZTZfSQE8rBpH/9R8D?=
 =?us-ascii?Q?0w=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb44d944-6b74-4f7b-8379-08ddc2e94b59
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 15:15:40.6539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BIRFrvxbTCO5LNAgtmpW08oNvGwPaCGcjmcYnGRSQc8NuBGat/I+QBZUOLcFS+ceCWzoyMc/v9nbdZJQLqfGkfzijnH6lOwAex7K7/aMqZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_081602_177337_CCDAB98F 
X-CRM114-Status: GOOD (  34.72  )
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

On Sat, Jul 12, 2025 at 12:11:38AM +0000, Thinh Nguyen wrote:
> On Thu, Jul 10, 2025, John Keeping wrote:
> > When the phy is acting as a Type C mux, it may need to reset when the
> > cable direction changes.  But this should not happen while DWC3 is
> > trying to use the USB connection.
> > 
> > In this case, there must be a connection manager to notify the phy of
> > the orientation change and tcpm_mux_set() ensures this happens before
> > DWC3's role switch is informed of a change.
> > 
> > It should not be possible to go directly from device->device or
> > host->host with a change in orientation without transitioning through
> > the "none" role as the cable is unplugged.  So ensuring that DWC3 always
> 
> The controller is either host or device mode. It's odd to use "none" to
> indicate connection.

There is no connection in this state.  When the type C controller
indicates that the role is "none" then there cannot be a USB connection.

> > informs the phy of the new mode whenever a plug is detected should be
> > sufficient for the phy to safely reset itself at a time that is safe for
> > DWC3.
> 
> Couldn't the phy do this as it detects connection/disconnection.

I don't think the phy can detect a connection.  If it is configured for
the wrong orientation then it will not monitor the correct data lines.
The phy hardware does not signal any interrupts to the CPU for the
driver to react to.

> It seems what you need is a full controller initialization upon new
> connection on orientation change, and you're using role_switch selecting
> "none" to do so.

I'm not sure whether a complete initialization is necessary, but what I
want to avoid is the phy resetting while the controller is part-way
through device enumeration or setting up a gadget configuration.

It may be that simply avoiding resetting the phy if the orientation is
unchanged is enough to avoid some of this problem, but I suspect there
are still problems if the clocks from the phy to the controller are
stopped unexpectedly.  However, I have run some tests of this change and
it looks promising.

> I'm not sure if role-switch has the right interface to do so. Perhaps we
> can introduce one? I don't think we should change the behavior of the
> current flow and apply that to all other platforms.

I don't think it's unreasonable for the controller to be idle when there
is an external type C controller notifying the connection state.

The hardware setup looks like this, with the Linux type C code notifying
the phy driver of the orientation change and the DWC3 driver of the role
change:

                      +------+          
                      | DWC3 |<----+    
                      +--^---+     |    
                         |         |    
                      +--v--+      |    
                +---->| PHY |      |Role
                |     +--^--+      |    
    Orientation |        |         |    
                |   +----v----+    |    
                +---+ FUSB302 +----+    
                    +---------+

The advantage of using the role hook is that we are guaranteed that it
is called after the phy has been notified of the orientation change.

Do you have an idea of a new interface?  Or do you think it is safe to
reset the phy underneath the controller when that will halt the clocks
from the phy to the controller for some period of time?


Regards,
John

