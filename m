Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311E6C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o5f8Ho4StLRZh8DkXn/CGGPfa+ygdg42nexttHsVcis=; b=ak0xZkZlHwtwwcacz+zNp5D4Mh
	b9YygNhU/pFP6BuaZgvyT2VwBTgtAtp3qbsaIkcHE74TGkRXTgqBeCC/911rCxe/Qg84MekKnp2Og
	Dlw0RJtnZEx7aUn4GAiGhoCTav02Z0s40ZgKXtjhQPRjTq23dzpv9NItDYEO548J/pO28kJoCjHOD
	HPAQswIei9reozghsowD9RB8aHwvFLi9yvA4VYCQMurbBlCgHESIXO9GpS4uAr03WPbNbY27tPK88
	NwX1wjSjyTjGK2bSmRaTaVHqAc/E964H/i0wdVIcd/OenJt7a4bXXTwl3GwJ+kvWQNKws4Y4M84N4
	MlVJA1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhlJ-0000000FshJ-0u9Y;
	Wed, 06 Aug 2025 17:17:13 +0000
Received: from mail-mw2nam10on20717.outbound.protection.outlook.com ([2a01:111:f403:2412::717] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhfK-0000000FrIW-0U2q;
	Wed, 06 Aug 2025 17:11:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTQjVlO/xorfGWmzTRQIEWaKi4qNC7e87+OQiDfNFPNJsRW+p/rACnc5LSpgCwHxcDDtDcokcDMIjc6HMoBl8K4xgZwhH/Mz8NYdlDn4foIXWXq0LdRygnkNAlIEjRafgg6k5hLw+mPTeHyIiOIEoxggnQE5UBabqNIf+5GeB5DmR3nD8aItd1YtCUv+RinwssJjJ5qJtsVI4VaxBZciAp+9yCUeSW2QqmaTP4WUTXO3JBJ4PJEGpYxoeJDbg6W1soT3NPwDPvcvcVVfHSgr0j3C90NoqvhczMVWOI+uJVAha5UPtV+zsyqEcJ7kM9uRN5py00Ed/oojRiRHtULDBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5f8Ho4StLRZh8DkXn/CGGPfa+ygdg42nexttHsVcis=;
 b=dP7jn68URsqp1tIb1w5yOm5iFr+ECpT9gmGoQI8aCZiM/MKXA3gdpf1W8qfW6NWyR6undZKI1/UHFdzMIae5sHXAJ97bTFkjJVgcwkZ1DVPGW3yiOU14LqWebuakprWp+x1V5Pkm+6UEWi68RnhrGroyq1iXGrWgFB0hZYf6kLJ9w1KJ8T6KqXMi6XvL3TGgamkaz6iQoQnPo104rUcpeApanKBGF9CNYCY+vWDqqCMcTq0UEbeKBdG6kc1PlICV5vX8VMluoJ5F7UBa/nakoFhmC8/008tEaNmmMCvlTqVn3pb/Cx+oaAs1IuY+88gtesGaGsxARz3gcLVE8E8E6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5f8Ho4StLRZh8DkXn/CGGPfa+ygdg42nexttHsVcis=;
 b=gzN4MJEJdN65IXkhgWxXTpK6NFp4WODi0uhBM/tovbV3DyosnVUL5qdIemqG3zu16PGCsAF3KqMGe9Cn/inKRlfD480jqPpuDrOnGlE4SvFDJvJeYlC/LNeTT7Mecxmmzyvv/o7NWyzqRU32UYmvYl6vcF43MfqzZWwcD4U6Jxw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by BN0PR08MB7502.namprd08.prod.outlook.com (2603:10b6:408:159::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 6 Aug
 2025 17:10:51 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%7]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 17:10:51 +0000
Date: Wed, 6 Aug 2025 18:10:43 +0100
From: John Keeping <jkeeping@inmusicbrands.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	Vinod Koul <vkoul@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC/PATCH 1/2] usb: dwc3: disable for USB_ROLE_NONE
Message-ID: <aJOMk_PVasn-tvV6-jkeeping@inmusicbrands.com>
References: <20250710152252.2532020-1-jkeeping@inmusicbrands.com>
 <20250710152252.2532020-2-jkeeping@inmusicbrands.com>
 <20250712001131.ax3rw24h3deekxfv@synopsys.com>
 <aHUfFGnGZP4z7UgK-jkeeping@inmusicbrands.com>
 <20250729221027.jvg3bpqhc3z5j7xn@synopsys.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729221027.jvg3bpqhc3z5j7xn@synopsys.com>
X-ClientProxiedBy: LO2P265CA0235.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::31) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|BN0PR08MB7502:EE_
X-MS-Office365-Filtering-Correlation-Id: d921b688-daf5-4093-466d-08ddd50c31fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ks2lJUWbLS+VT9+2FjkoMMHFs9m3Ny8hdqJH4pkqM9zyI83qij+Dp0abbpIj?=
 =?us-ascii?Q?ZUDjQ2YILSFSpiAlumDPbH85YGzx/t/ZYjUdQ96zApQc93+UE40iu+xDM2o4?=
 =?us-ascii?Q?hMqgyl90+svHqMbX0plSN8TnQ2I+w7ITKFPWGSV7DRHrKRKYPTL+/JzGgrsu?=
 =?us-ascii?Q?/4Ym38AA/8wYyvnXl3lGXXNCNQk5KyzF+aKxWhUFbjcjkfAg6qe5/MWKu6jm?=
 =?us-ascii?Q?zprgPeGK9TWYC4k5pPXbWLgtFO7KyfcVSW108CiTyicGjjLh54XBc5B3Fedw?=
 =?us-ascii?Q?PRSkpJXTTLAJ/SjAPGUXbeB9KpD+TvuqSCI01DeHSxgCoejQ93/9uX6sa9DM?=
 =?us-ascii?Q?aJPMNGPkvCbMDyyeFvXBhaeDCo0N8fx8hi3Cx26769CN3UY2sUN9yXQctvUl?=
 =?us-ascii?Q?YT2vj9GShIlEOt4NrDgjPKCtYmHalV2SW1VhdfSMQee2q72KD2p3wsAJ7IvJ?=
 =?us-ascii?Q?T7qTSqkQAtjXMyp7uMDi7FcT7VJoDrgbQQKqPiu4DnS2frDDOhVvjk/bpOGq?=
 =?us-ascii?Q?FnC9xVMlQYf1WZWsg3bJ8UQiU6u+HPXDXAN0Z0dtYNtP6qpmFoSpABOB+p0n?=
 =?us-ascii?Q?663rH5TCCWcMPjod/tI8rX89gnXGSqp8OaYfzvd196dRsLUMXkDkx8XgyplM?=
 =?us-ascii?Q?z/gQU9d2QjQFj9vlLWUqdgiidwrjQDE/cnVv+//paGUolNSyApZltOY7+VHQ?=
 =?us-ascii?Q?6FroT179Fbx9WXWMk3MNjWE7VgFFLacpP0cirAP5VGpi/Oo+qXgwXODl3dZk?=
 =?us-ascii?Q?QLShe9rJkc+iJrH+lYi8caXoLorI3ipbAxw32qlf2Z1hFcSD0/Q9Ai/vt/MZ?=
 =?us-ascii?Q?W3YcplEnm3DRczfcFkyYaQOz/T79zZnu62/1diDbbqGZ87WyG22w6MoY4KnJ?=
 =?us-ascii?Q?fbnv19erpc/BClrH4ifN554sCRIXCqjNTDTdag8Zwg2cnssGPrcxrjnEWxRZ?=
 =?us-ascii?Q?MOmQxefufihvF3JKVQ+4ShtUYYhbaCOdrWqWqWBsaAlgSNdQ996nZkfO/meN?=
 =?us-ascii?Q?U8QyWoJ6B7Q0YlJNYvcSFatDtZWK8TygubG2dgQoH7o2hEMUOrAEPqWO87hk?=
 =?us-ascii?Q?DyV3/c8b3mzQydbuhY9YMFVHslrGx93igCu+FXxegljCai60jwdKKa/LElNc?=
 =?us-ascii?Q?z3PREKik3XWAeKeDLamQn93mFduL77RGvIU2PWZODCEUw6y1HvDYNLxlJ/T0?=
 =?us-ascii?Q?TpccpFhiXzOW4ePkFhMGpH7fDJNuo/z9mAxy0rlV13dnE0BFdBzZ/gcCNmWL?=
 =?us-ascii?Q?kQ/ZEwU2iPAn7B6YnU6lEp1Omt6yX/0NOMezhWdCluhrUFOXutTYvw7byJMJ?=
 =?us-ascii?Q?y8hTl3wVQK59dFmOL0SY6KsfTR2P+Mhd6FByWyV6/4tx3R6NvMlhiVFHrDXn?=
 =?us-ascii?Q?XXtYaQG7i80WQxodh0S5rNB7MPiRBRNRX7Xg+x9svvNTpVEzYG+598BVXTYy?=
 =?us-ascii?Q?dSFsOChYbXyLKzFEs6xorYUeUq5G9Bz7N7i34+KocMC+onvqRlR8/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR08MB8282.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hehQ9BgYnSXwzJqbFFEiS2By8Ar8xJj31i2fCpfq1g8DClrj8pkWwxcgx5/N?=
 =?us-ascii?Q?DZjtAMfB/C82ypQBycmShZXsQyJU+UViGhArxsbCvkYxf1puvCwWazyKTsOF?=
 =?us-ascii?Q?P+eNLxqvl0FobJRjEWwhMn4wFOxPlDAZNP5i2Fiy+wnLlvFUOG/zgqW5iXOQ?=
 =?us-ascii?Q?ChMgagYKGNW/d6rOuJWKkbh/aiCoorukmCVxaB3nKulqOACruwSLU0LQQXTy?=
 =?us-ascii?Q?+KL2GY2NZNOfAhRbqcCgvGBMhfmE3jqVZE8SJOVW3i63BxZST8iINSgtonHy?=
 =?us-ascii?Q?2TfUTpe3yu6Dc9UcDB80fHdxbn0vuqZMijuRzcthWcukja4TzQjf8wdtlRZ+?=
 =?us-ascii?Q?zBRdoRXhQ/cn8Ae3YFCRhanjAxxP6GT/IEZg3qad2HxGioJgeOdOudN+zbfT?=
 =?us-ascii?Q?4xn+u8ViODkyXPZmeT/NJweY6vhZ56zaqMDbdQk4uEzjldoXg3ow/XNW83lm?=
 =?us-ascii?Q?SNRMuD0aVzoKrdHGPVNPVhi5xOOreSGAxfwamA1fLZDBJ1tMJsHIqw1GFkyy?=
 =?us-ascii?Q?X9exyYDcMnOHXuWEg7YoEi1tURLMXxzB6NYpQXJH6EM9+pBXoWhGVgMaGqIQ?=
 =?us-ascii?Q?r7zgUa3le+wvQ+vk+fte+88Ws+shg3+tfSKGjwY2wKWapMUdgYdlCsAex6+G?=
 =?us-ascii?Q?RrRUw1xOtnw5bXwDAGt+BRC1HUN4nJ2wH3BCUqYhjCVv3QPwkiQske7Wx86y?=
 =?us-ascii?Q?XpN0ens5+tHi8BVdwj2Id4cDhLcAqzHlGH81TzxVB72XeXGgcevYymJw1sZB?=
 =?us-ascii?Q?uYeYJzoFRDopss2sCJVcMaFH9UPnPBTzuSOiGz8nsA3jf0wTdMgjOjr0aaS4?=
 =?us-ascii?Q?x8wjtkz7ZjWD4SVErGpFkJTBgxm5HFSNubVgf90egeqnvNGMHxPtmbXUGaNf?=
 =?us-ascii?Q?Xc9YfKgDt0FanGkmn5jlinstV8WEwiYCsJQZho2gCnYuex0WAqxzyxav1GTF?=
 =?us-ascii?Q?auPmxB/nXbghQ41/OJ6rShaJGbSfkialAZKn1lZJHPHJ45Qh1AHfkMU+ttk4?=
 =?us-ascii?Q?xjrb2pUtpt2+i7UKv2FO9XH88wKQ8aIRNry20GFBH6xSw3tOm4MZV37MhWl9?=
 =?us-ascii?Q?SVebYC43lJIZRfbNeoRsieM8MYQ+aVDLQxhyYamLu7VcshukREZvchCInf0O?=
 =?us-ascii?Q?boZEFq8DCbDS3SkEW5lSuVWYDinqRBu8O5SxszNYg3Y5M+eOI9joRmBJUf+r?=
 =?us-ascii?Q?POawtuFHwurxjWoHpEsWbth/zpzRstItrqop4fhQlxkjXYjjuTK+fQqfcRCA?=
 =?us-ascii?Q?WAwQ1kliWO+LNPXur5SXzFY2hJBdfCVQwvGgwlmhZZszR1lUw9frY6R4XcmE?=
 =?us-ascii?Q?m/Qd5kGe+/eMC0V0OJHlD0R2GqVndBEqTq/lqBe3vgfmBvjfU5LAWwobt3+i?=
 =?us-ascii?Q?j15LRweyCF9JXIOqX+9EUexJl0PcwQRUTJ3WQQBY8Wmz+52TyB57NzboNkJj?=
 =?us-ascii?Q?He94d0D2W+DUqDz1eW7o2vFewtKum2nhgbmSX1yez2V2LHW8w0yyUtQqZPBA?=
 =?us-ascii?Q?dcbK/w3/U87xKh5TK/BIBkAGjgvwPR++AKDv7/4bDEpGfdBCHPMLazf0tRSj?=
 =?us-ascii?Q?sllZ8TXEltjRPS32fNQIKuX0RIa5qpDZXBuDRS4kJPw0XNkVHOP3QuxvX00m?=
 =?us-ascii?Q?Uw=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d921b688-daf5-4093-466d-08ddd50c31fd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 17:10:51.4180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tA2/2TZBHkwUOUT+QOK2bUTfvV3osNHavN1Ti7RfhAK4WQ84pvnZjLRk9r+9uKs4iFZzWiCv/SSDGRJmuQHFo//xjriio1xQQnP+V5SZJmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR08MB7502
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_101102_191112_37EE0D3D 
X-CRM114-Status: GOOD (  55.74  )
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

On Tue, Jul 29, 2025 at 10:10:35PM +0000, Thinh Nguyen wrote:
> On Mon, Jul 14, 2025, John Keeping wrote:
> > On Sat, Jul 12, 2025 at 12:11:38AM +0000, Thinh Nguyen wrote:
> > > On Thu, Jul 10, 2025, John Keeping wrote:
> > > > When the phy is acting as a Type C mux, it may need to reset when the
> > > > cable direction changes.  But this should not happen while DWC3 is
> > > > trying to use the USB connection.
> > > > 
> > > > In this case, there must be a connection manager to notify the phy of
> > > > the orientation change and tcpm_mux_set() ensures this happens before
> > > > DWC3's role switch is informed of a change.
> > > > 
> > > > It should not be possible to go directly from device->device or
> > > > host->host with a change in orientation without transitioning through
> > > > the "none" role as the cable is unplugged.  So ensuring that DWC3 always
> > > 
> > > The controller is either host or device mode. It's odd to use "none" to
> > > indicate connection.
> > 
> > There is no connection in this state.  When the type C controller
> > indicates that the role is "none" then there cannot be a USB connection.
> > 
> 
> It's not about connection. It's about the current mode of the USB
> controller. The mode of the controller isn't "none" on disconnection
> even if you try to role-switch to that via the typec switch.
> 
> > > > informs the phy of the new mode whenever a plug is detected should be
> > > > sufficient for the phy to safely reset itself at a time that is safe for
> > > > DWC3.
> > > 
> > > Couldn't the phy do this as it detects connection/disconnection.
> > 
> > I don't think the phy can detect a connection.  If it is configured for
> > the wrong orientation then it will not monitor the correct data lines.
> > The phy hardware does not signal any interrupts to the CPU for the
> > driver to react to.
> 
> Ok.
> 
> > 
> > > It seems what you need is a full controller initialization upon new
> > > connection on orientation change, and you're using role_switch selecting
> > > "none" to do so.
> > 
> > I'm not sure whether a complete initialization is necessary, but what I
> > want to avoid is the phy resetting while the controller is part-way
> > through device enumeration or setting up a gadget configuration.
> > 
> > It may be that simply avoiding resetting the phy if the orientation is
> > unchanged is enough to avoid some of this problem, but I suspect there
> > are still problems if the clocks from the phy to the controller are
> > stopped unexpectedly.  However, I have run some tests of this change and
> > it looks promising.
> 
> That sounds like the the phy reset is done after asserting the vbus
> valid line indicating connection to the controller. Can this be fixed in
> the phy or type-c driver?

I don't think so.  I've tried implementing this in the phy driver and it
does not work reliably.

> > > I'm not sure if role-switch has the right interface to do so. Perhaps we
> > > can introduce one? I don't think we should change the behavior of the
> > > current flow and apply that to all other platforms.
> > 
> > I don't think it's unreasonable for the controller to be idle when there
> > is an external type C controller notifying the connection state.
> > 
> > The hardware setup looks like this, with the Linux type C code notifying
> > the phy driver of the orientation change and the DWC3 driver of the role
> > change:
> > 
> >                       +------+          
> >                       | DWC3 |<----+    
> >                       +--^---+     |    
> >                          |         |    
> >                       +--v--+      |    
> >                 +---->| PHY |      |Role
> >                 |     +--^--+      |    
> >     Orientation |        |         |    
> >                 |   +----v----+    |    
> >                 +---+ FUSB302 +----+    
> >                     +---------+
> > 
> > The advantage of using the role hook is that we are guaranteed that it
> > is called after the phy has been notified of the orientation change.
> > 
> > Do you have an idea of a new interface?  Or do you think it is safe to
> > reset the phy underneath the controller when that will halt the clocks
> > from the phy to the controller for some period of time?
> 
> The proper fix should be in the phy where it should only assert vbus
> valid after processing orientation and phy reset. I'm not familiar on
> the communication between your PHY and FUSB302. There should be some
> indication from the phy that it's ready before you can assert vbus-valid
> (that can be from a callback, a status register etc).

The FUSB302 is connected to the CPU via I2C, there is no direct
communication between it and the phy, it all goes via the kernel's tcpm
subsystem.

The problem with re-initializing the phy is that this causes dwc3 gadget
configuration to fail with "failed to enable ep0out", and this happens
when VBUS valid is de-asserted.  This is 100% reproducible on boot for
me where the init scripts are setting up a gadget via configfs.

So it seems the timing of the phy setup needs to coordinate with the
dwc3 controller.

> What you've done is a teardown and reinit of the driver, triggering a
> soft-reset. This can re-sync the phy. That probably takes long enough
> that a phy-reset after orientation change will be completed before the
> initialization complete.
> 
> If there's no way for you to know when the phy complete its reset, we
> can add a quirk for your platform to always reinit on role-switch call.
> 
> Let me know if this is reasonable.

I'm happy to test patches.


Kind regards,
John

