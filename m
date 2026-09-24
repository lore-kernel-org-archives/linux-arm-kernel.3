Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3C7C98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pux10LlETLszwSf1Y6MVAh3Fvixzs5T8niWGfHPGaP8=; b=VmOdQEGMiF0bvljCOZ7Kv/Li37
	0esRInPI5xsJz13euFE6/C0iD7M5z2BqJYPrSSwGdZWCPYqy4vs+l6Nu+O0WZWjnpQI5TSGckoT4h
	K/8KJQ2ZBNf71Yr1Z1eXimWZlFoxE7X59C77qgINtWrFdIblMfQJmx56Oj6skJnK4RGB8Sv9ZSC4y
	UakSiMkVDHVEclnNHS3F/RoQTCC1obh/ldLnvxJkGqhkWhqAuNdSpWHrGMw3A4rUOxIgN5W0U6UY8
	MGw/25G6+hacA5JOdQkycIg7lhiMZpx7FqXZ8m+W8gW5dTxirTvhScVlTdXtE1DlPY3XcosgktjJT
	x8+1h+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dDe-0000000AAy4-2XHq;
	Thu, 24 Sep 2026 06:46:10 +0000
Received: from mail-westus3azon11012048.outbound.protection.outlook.com ([40.107.209.48] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dDb-0000000AAxJ-3FKa;
	Thu, 24 Sep 2026 06:46:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNTrZYDOGIx/UxYjRhtgBiAboA3CIHU9iN1lS/7uyRrKr8ztqutHHLX7v4q6oyxr32IYZ9AHvhSa8R6fbAGFMKQsNc1Q2SzIDxVVlxjiJZy/KMaj+X2hkOSiyem6K9FAqF0IDHtiD6t/u505Y0oLJ8FG7x2bp7W9DYY40xnA6i03l/GoTdaw5CP55Xlw+MRjpm0ZocKCoCINXUIzfOEpTp7xeVTh8sQ5mUxJbmfW49bL/BddX+uWqzTRsFZii5us9XLa1Hr3JGXoBx9nTKYqRrIkgpDmoFOK3TPUWysSNJfYF3NBVY4mqu3PuyuTWctYsETAfwKJEO7bO3zOxYbwOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pux10LlETLszwSf1Y6MVAh3Fvixzs5T8niWGfHPGaP8=;
 b=Auj/DAoy3kXR66KZPNBmMjTRxu5WNYR7QDfG//alrsT6EBzP4Wgt0warHPVCt+v+VC6TBQslqiITzIegzcnTNOedM6XFX0lN2xHJteisSQ1pgCfBlfq2VDHHymQbtaYJcM/OjD7xdZkTTY1NX6jlzyfzYhmCZRKXK/TfAgAa3b9mhdB7qeXoDU+ZQJNnfr1Bf+TbSDI6f3o9W18vPLAfOCXapqqNWax+HWavWOyERbVWuWue7YVmVvYXnLACpNiuqphwJdlRYn+SCUzOKDdP1zHzyNJVTbSWCbQ1BFLabXcp4Qxw6a2f4sJA4PcCgsCecf+7JYhTTtLdj/Ct3is68Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pux10LlETLszwSf1Y6MVAh3Fvixzs5T8niWGfHPGaP8=;
 b=StkWSi05T7vNT7gX8cV1yBGseBdFMdj/hG1ClkiIRO1DoCCWXPG0ZWxPZdvH72V06IUk6Dwz644Ti1kS0E4diiWIjfQzCyIxHXVbEwcpdoPxnZuM6B2IUnNjW8x0108QJSnuCM4tXaDv5uvGkE1Tk0yFEauso5bb1aKFDxNma8G5bIbyAorp8YimNffnlZW+JajjZbqFsEU/uZXTktLWZQmw6ORs2ADU/JEJyXqJFz+D0uwIbUN5poqjHdiYxhxCBlgrrhA7jUC2YEtb2zyBC4jk2T/YRa8LxG0M15RJoG01M/zeTeN1EC+7J0xq1eXpGY38CJX3+3rz2uKNHbfKNQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB4914.namprd12.prod.outlook.com (2603:10b6:208:1c4::16)
 by SA1PR12MB9514.namprd12.prod.outlook.com (2603:10b6:806:458::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 06:45:55 +0000
Received: from BL0PR12MB4914.namprd12.prod.outlook.com
 ([fe80::4921:cbe6:78cd:b445]) by BL0PR12MB4914.namprd12.prod.outlook.com
 ([fe80::4921:cbe6:78cd:b445%4]) with mapi id 15.21.0428.015; Thu, 24 Sep 2026
 06:45:55 +0000
Date: Thu, 24 Sep 2026 01:45:51 -0500 (CDT)
From: Vidith Madhu <vmadhu@nvidia.com>
To: Leo Li <sunpeng.li@amd.com>
cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
    "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
    Daniel Stone <daniels@collabora.com>, 
    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
    Maxime Ripard <mripard@kernel.org>, 
    Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
    Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, 
    Andrzej Hajda <andrzej.hajda@intel.com>, 
    Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
    Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
    Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
    Luca Ceresoli <luca.ceresoli@bootlin.com>, 
    Sandy Huang <hjc@rock-chips.com>, 
    =?ISO-8859-15?Q?Heiko_St=FCbner?= <heiko@sntech.de>, 
    Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org, 
    linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
    linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
    kernel@collabora.com, Derek Foreman <derek.foreman@collabora.com>, 
    wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH RFC 03/25] drm/atomic-helper: Set mode_changed on
 vrr_enabled change
In-Reply-To: <75b82a61-fe82-4597-bfb5-3c717fbb0dda@amd.com>
Message-ID: <7d5d4ae5-0f48-7c91-2675-8ae6e20fa5ef@nvidia.com>
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com> <20260921-vrr-limiter-uapi-v1-3-2fcd7d011646@collabora.com> <75b82a61-fe82-4597-bfb5-3c717fbb0dda@amd.com>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: BN9PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:408:f4::29) To BL0PR12MB4914.namprd12.prod.outlook.com
 (2603:10b6:208:1c4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB4914:EE_|SA1PR12MB9514:EE_
X-MS-Office365-Filtering-Correlation-Id: 55832ba3-0a7f-4fdf-8b6e-08df1a077af8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: xon87r0cUfVNI8nhR/C5EB3qVujKWq1qHdaL0dw7cXGSnmgbCsXBi/DmdasaqcM+OuyA2MnZb5HhE9xJzZ17W+SebvSdY/mc+cYklDGQQicmr2UK6pKxRpRO8Z25VsXFMGW3I1e0Uey+S/vepLTaZAvBirFZy2MEMXWJEqzAAHiPIOZp8sAEmnAsGHyQFFxT4B1tE1uA9dgzB/8v7RtEecITSw9yaOfzyvalVxgYurVyCLoz3VcawCjufhXbu2k+w4Hv8nILiiMxefemqOIWFVLpm05hTxghPByOO/YQ3tfb95zFkX3TdBh1ZN4GOmfL2ejavfFl2J6dpoD+gZogMkiDgmitKJOHYVQCScYpAsEDEhjcRoYDRvh1kyCs7t+v4ECwi1BLxhj8mH0Ff0PtB0hora5Gn/HH/GnpdLS++odIp7FjYV4k11ZpKJIgELDz7FKmtM2LigfA2N22DLlA2krsWR3+s1CkiaQ3dKzHerS3RgXEe1WyXcPXj9bmJ+0/rQfOBj1cXfRvw/IwE65FrnpP28Vf06f/smA5IPxymSnl2QP71AuIboxwelzjJ10BfApBLJuxYJxU88HTNrsCVxoDbJONpHQewvyKG/K6vAMpPELmFvLyesrM4OxTK9RLro8gnXU+OC/mXPA2pZJsuikucH1uxIqd599MXzm4GiM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NCBrF8GlyoxNOcuWpX9zvCxKIbQpKmUcOvbM7I9CRTHUJwslz8SW4lcxVHsH?=
 =?us-ascii?Q?uks+poJssqCNXVgQVhGsy8VsdnqXxvXAWsHsDYGzGFZQdJsj6XetVwIQs5Dg?=
 =?us-ascii?Q?7mBAjmkpdbjeUtwXjrih6SMF0Wyztk4q34XOVX0kL9UD0sBUNujcNANuHSSO?=
 =?us-ascii?Q?w7kUnB2tCABoMmYY9jCgd86Fzsjj3GB0S2aMp2GvIKiO6b8Bo8qcFQEdJiWW?=
 =?us-ascii?Q?fkswCMWYv0ndueStJOCQaZl9aPHiP68eSUf5b+V/GNB/i9dwtmOgSW7eyYP5?=
 =?us-ascii?Q?qCjQ5LcKudHLiWqoBo8KAC4gH0QVo+f0ZzV34hqf32foYKAoUsx2/8M0v/QB?=
 =?us-ascii?Q?MgyAiOXHCKkAOjWIYQY7xlZNiYpbEHMlYrbzYYf3TgnoarXjaCu67hle0Qks?=
 =?us-ascii?Q?htNdTepiSRX+7nwf8NF44XO9FK8e0IxTSmgdUnX32GFdGsUhujV+7+cHfPpb?=
 =?us-ascii?Q?mCUBEa9FAH3E5HBQqUib+W92cKbeYWoxmHu02OvSUVAKbToxyXi0BxtlYR37?=
 =?us-ascii?Q?HwSNs9xvB28DrgiOnB5TZwa/Oj9k0nd6rIvdiQuVXe5ULm+HLQ6RHt88Lxb1?=
 =?us-ascii?Q?ZVsVSe3EhXgf+Frx9lMTObw7jieb59u9rtqlDLMHIUXv9DSx1fUQGaWblxGC?=
 =?us-ascii?Q?7GykdFmpscH+tFQTHp23LKsqGOer9zRoFMi8H4YOEJZWe9p5I2+TmcW9OtzT?=
 =?us-ascii?Q?rKLkwFCs4vwmjijASAo0tM9cUD8hihyoYH1Pkha+mkDM0qIWTGej7I0h92np?=
 =?us-ascii?Q?XQaZTtPdBsaDpy+y/5Q1T5ddYRyk/HUPI8LHho4rAaxfbJ10YJgvibsFL90J?=
 =?us-ascii?Q?4dnZryoiAxmN6tJ67QBz5CXkbi6JYtNVz96HlHj7bCXFh5it+1sH8ZY9Gddn?=
 =?us-ascii?Q?6xkHmkt8++zQGDJFAPnJyOG+o8u/1Ne1gn4AK6t6ap/avi2wQELKFdxI9BYh?=
 =?us-ascii?Q?fWAONeHqwMfHbMfd1SiLv9Xf0HALDSrNg20vY1YpBkOYwd0EYXWquVGmtfF1?=
 =?us-ascii?Q?+xTt05XXrU91q4VIl2ZwB6qvRt/Q04F1QE42gPwJKbYr6NQtsinnMaZOUGQs?=
 =?us-ascii?Q?b/RKKkPTxS3tUZytffk0bmMEhfYfiCS7ZUjvB+kkxEkDxXkpy8SAV1SgBRwg?=
 =?us-ascii?Q?ImNpLbgTWYGlP+v9jh9jw55E/Wlf9kjmK15qB6wCXPixqgpgvnWpmUsSkGVk?=
 =?us-ascii?Q?i8jgL8fbyknvjFPOWTwZ8favaOZW9GHggmznDxY6qr7aOuofZ17jFzpZSNNw?=
 =?us-ascii?Q?uABCoU9kvf3ZI+fjX97+wXgMjDqm5a1bNkco+QpQGuGg0g6TY9ZZ8NSvho65?=
 =?us-ascii?Q?cDlgeuh0TuRqwu3UGQod7bLQER4I1920kYnm6u6qWBi3TCkmKg13HYnazh24?=
 =?us-ascii?Q?LAbdLekL/Eq61R9c5eeOJXl9tW6GTbQU9npvre7V8a4vFAdThBBedl4vLODi?=
 =?us-ascii?Q?Zpa+4Ej8RWXXiZXJPViyS1F6vEDIT2unrWRp+xtxt6VhCbNbuU8554wbQxw2?=
 =?us-ascii?Q?vNIkpBFOaok8f+BqV8Z5nM6jPXfvd2uBnC0o8X1Za9M+Z8X4Bc7dwl6uD5qQ?=
 =?us-ascii?Q?7HkhQJ5id84FA/n6TFgQxIF9HgV+cL6NhQcxXn2kSksLLX2DwXfBZ/8rFXDo?=
 =?us-ascii?Q?9BTU0D9wq+xNXSo+2ai2EcCvZmQsU74fewNmLvuepEPe18AkDjdAq9hqsG/B?=
 =?us-ascii?Q?f62rwgZcppoHJiEJ5D4mOmLnIP1Vm5OxN+Q68cHudipjahGrxSnEoRV7l6Zb?=
 =?us-ascii?Q?I7maMd5Ikg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55832ba3-0a7f-4fdf-8b6e-08df1a077af8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 06:45:55.3066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOPjNIoaoy+gTBa2gdJOIEKzW0fAwWKkCHJ+gt1Q918nnXfzFx+UMZhrGNrmT9jpRaWmADB5SSwClJ2Qa69pBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9514
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_234607_894718_07C24310 
X-CRM114-Status: GOOD (  24.75  )
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



On Mon, 21 Sep 2026, Leo Li wrote:

> Hi Nicholas,
> 
> Thanks for sending this out. I'm looking into an amdgpu implementation
> and had some comments along the way. Will reply inline on respective
> patches.
> 
> On 2026-09-21 11:51, Nicolas Frattaroli wrote:
> > A change in whether VRR is enabled or not on a CRTC will be of interest
> > to any VRR implementation, as they may need to recalculate certain
> > internal state in response. So far, this was handled ad-hoc in the
> > drivers that implement VRR.
> > 
> > Handle this in the common DRM atomic core by setting the mode_changed
> > flag when this occurs. The rationale for using mode_changed is that VRR
> > is deeply intertwined with the current mode with regards to its timing.
> > Consequently, any component that cares about a mode change is likely
> > also going to care about VRR being enabled/disabled.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index 9d006f98413a..0664d5779282 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -694,6 +694,12 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
> >  			new_crtc_state->active_changed = true;
> >  		}
> >  
> > +		if (old_crtc_state->vrr_enabled != new_crtc_state->vrr_enabled) {
> > +			drm_dbg_atomic(dev, "[CRTC:%d:%s] VRR changed\n",
> > +				       crtc->base.id, crtc->name);
> > +			new_crtc_state->mode_changed = true;
> > +		}
> > +
> 
> I don't think this is the case for all hardware, at least not for amdgpu.
> The parts in HW that adjust vtotal can be programmed without requiring
> bandwidth recalculations or reprogramming of pipes. 
> 
> - Leo

This is also the case for NVIDIA, it would be unfortunate if changes to 
vrr_enabled require allow_modeset=TRUE.

> 
> >  		if (new_crtc_state->enable != has_connectors) {
> >  			drm_dbg_atomic(dev, "[CRTC:%d:%s] enabled/connectors mismatch (%d/%d)\n",
> >  				       crtc->base.id, crtc->name,
> > 
> 
> 

