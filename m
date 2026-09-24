Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DC7C98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 07:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NR4tw5bNPctbzv7lV6ioUeAcO2BHwAnTzaDmUyPX1rc=; b=JxgVbVmFFQyPP9gYrDA1gi0c55
	1UuAvszIir0qpzzFBrR03jVNiiA52gTORcdzFhNOGkO9z33h1k/w8wG1VQ3h3k9PUHA0AmFB4zMYP
	7ClOrPTCY3PZSEWjSCZRwboItrQgurK6sGJcjll742agZxGZveN7xmCG1bQx2f0Rb6io8b2BNd/d0
	Z/lt8//UB5rsqTywW7wkSvNbw+2ZPtMN3naCPj5LCI/s39KU4bav815fq7UsrOp4m84vlCNAyRUFV
	AfF+Ra1E+TfeOvYzKSXgYkztNLvV8r+IcBnVg0K4tOPvDoW8An17CUz69Ys41HZJgXl93gtnWqKY4
	yoom3fKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dSl-0000000AE5u-3Jsv;
	Thu, 24 Sep 2026 07:01:47 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dSS-0000000AE3W-3z0C;
	Thu, 24 Sep 2026 07:01:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktngPzY2mG/14TBbRpa4sYf5qyk8BL5J1CE5iBx+5kSFQ1XFtOUO+LPTOxB/b/RJkyAUqWRGIE3za7Sctpo2la10iL65bMhDrC7jse5wkzn7E+O5WRE/5XdyvQrDJYKH07ymRL2J5WrXACY1zfd2QStME6ibqNAlI0qpLyB9HdQ+tCV8bxqqD4CheA5A4soGZaQPCeEicZDbuC0I5jEg/xZjCF7VcErvhtNQTzWEE6ek6H5IKQSVkrOdQmkZJi/8H/MCbaFxUJimuPa43KVNPHWR59nxIWZdi8Lu9WDT9WUAsKaHQDwdBTqu5xvBYnsOnz7owUX8ARFb5JR61SEo5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NR4tw5bNPctbzv7lV6ioUeAcO2BHwAnTzaDmUyPX1rc=;
 b=UZ4eCMtb3Tzp24JEjIBSmYRqq/QFlTLyCTbfRszxsXNcKtHocSLEVT5NXBo8P+5VBI4C1w27QtOsn1YrPEhGepP450J4jZdPqHbKGKjwaEJU9EBNoAbiwpk1uu+aGTBhhuKiBjOSw1tBh7SKF15qRdNLHqCYemFSoftgk05XmcFt+2utRe3FfH7fUqc3Bx43fbIeUyrDQxaA2HMRQVdFyoW6PcsdhHGMODBXQNv9UVWYbtBw3hew2HHQRHyOVMLSwNdyv8bTpQjwmmSDDZpxWN9WpY26/Upo+zojR1tnEus5yLYUQGK/zLAdIsQijZ0FkQm8jjs35fw94iw+2d3OIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NR4tw5bNPctbzv7lV6ioUeAcO2BHwAnTzaDmUyPX1rc=;
 b=eTAM5VtaQV3ng1HpvrVpjEq5YzLAcM1JUCt5RJGkZopJEHTKnkRdAqirK6ruQWNa4THE2Peilukxb7SCLK3blCicum5kyG3W6fZkeF22mqMKomqUj9pqwx84/WIm5DDl85ImRBWij6lrX8cheWgQQvajGiH7gHAPdxVjBOCiqOurXu4atIobXa4LBkrxDhovKu1BNjzIRqmSyZhVsztDYTRxczmbG03CDTYyHWsSj3dmwppkVAbUPJnLTWtfTSBS2495mVpoSdvcaIPSNx4HPNMFl/v622R8+VlvD5pfk+oEmC8HwTHMvA8YuHZi9CNudiHK8BugHxy5vVvHfVIpVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB4914.namprd12.prod.outlook.com (2603:10b6:208:1c4::16)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Thu, 24 Sep
 2026 07:01:08 +0000
Received: from BL0PR12MB4914.namprd12.prod.outlook.com
 ([fe80::4921:cbe6:78cd:b445]) by BL0PR12MB4914.namprd12.prod.outlook.com
 ([fe80::4921:cbe6:78cd:b445%4]) with mapi id 15.21.0428.015; Thu, 24 Sep 2026
 07:01:08 +0000
Date: Thu, 24 Sep 2026 02:01:05 -0500 (CDT)
From: Vidith Madhu <vmadhu@nvidia.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
cc: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
    Leo Li <sunpeng.li@amd.com>, Daniel Stone <daniels@collabora.com>, 
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
    Andy Yan <andy.yan@rock-chips.com>, 
    =?ISO-8859-15?Q?Michel_D=E4nzer?= <michel.daenzer@mailbox.org>, 
    dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
    linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org, 
    linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
    Derek Foreman <derek.foreman@collabora.com>, 
    wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH RFC 13/25] drm: Add VRR target frame rate properties
In-Reply-To: <YozwdeJLQh-0GBcK9P3QvQ@collabora.com>
Message-ID: <6fb8aaed-5abc-db9c-b09b-3390d8b87686@nvidia.com>
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com> <20260921-vrr-limiter-uapi-v1-13-2fcd7d011646@collabora.com> <588442c7-2589-4026-a8f8-e03f944318c3@mailbox.org> <YozwdeJLQh-0GBcK9P3QvQ@collabora.com>
Content-Type: multipart/mixed; boundary="8323329-1198039324-1790233268=:3314104"
X-ClientProxiedBy: DS1P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:451::19) To BL0PR12MB4914.namprd12.prod.outlook.com
 (2603:10b6:208:1c4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB4914:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a44d491-8cb4-4e2b-3a3a-08df1a099bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6E/swmdctMi83HGK6k9UoVqxyG6Q0V3DjsbP4Kc21d440LPWK0Otx847K5x3lXTiXhyvnLzC5AVZQnr8RB5XeA3oPBlBpsF1W5lWt15GrV1dzTvTXU4wCQy6gb+QRuTAdlwL4b+GvtCq5+OY6hCGDUSLqaTL9g9+Kgliki7fhfVXPNlj7uIaFfE8oV3ggp6KNGX6h+nq4k5NAQpHLqQRrvwl6TaIOsZ4jy+mNKJ1B5Y7yXYC20+6NrvSAoih/YtrNaY3YzNEG8L9RlJdmjwXJ4IPk+j3oSAp7ieeTonr2BwPJlirg/olcARCNOaDx/hKw+D9SAxqa8Xz7giU6lBOqSc/I/Rybh5QdyP0wNo3wciuUz5wKD3+eXWqoghEqFW8Xgtgqg24FzYzkPOKSIXi4I0kDNcDITd29KPAHDg+RqBW3LTZPjxt9VlopoMcTiMKsL4qzQVdPbBIYAcvlEubsSB7I/UosivcqJkJJeypXZYnqjLzONknkcwj3iPuNbXP1YhWQ96NkN+kXk512wCXSbBPy1+el4YS9PsTqT3tVbHW1S/Dcg337Ee/LpXo4o/6oM905+65BFcEmWhECNa6nQ1cvIxlB0xX+UGvYrtzte+W64Tz5mNan3ccJBiOH/TZ0RPi6oXEBoK/YctZe2O7b0uvbuH2RCLk5u5gE3zwl/s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB4914.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUhqL3VhVFM0M1pIOS8xUzJjTXI5YzZwQ20xR1N3SjV2YW44TDNIcXJNZXVu?=
 =?utf-8?B?WDNaRmNkcmpUdXVWQ2pyZWdEdW5rRTlFWjdTcHJKcC9OMno5ckxFWXUxUytZ?=
 =?utf-8?B?dUhzVktpNzZiWExwKzNZTnBoNW5KNDFQQkNMZzN5MVBHb0lHZFowMC9oclQ5?=
 =?utf-8?B?RWZnVmpUeEp6TXhEdU1rRHFaOVg3Q2FWWnFPV1VyVFVmdTl4ZVhDK0ZCMmlJ?=
 =?utf-8?B?S1hRaDh0YVBVcEFVN0xHaU9WSXVRR0dleEh3SllpQW5wbGE5MUExcXNGZEox?=
 =?utf-8?B?T2NiSEx4S0U3emh1Uml5Q0VicXJtZFZJRGxUWkJyeTRqWjZnb053RXIydHc2?=
 =?utf-8?B?cU1nTFFFL1FuR28wNjQvcDZhYi9pWUhqMkZFT1YvRTdTY2crVlVFLzRFTmc1?=
 =?utf-8?B?alJCcGdESTJYNmE0bWxQTFEzVVlHem5FOVl5UXNOZ0RkNFNFaEp4V05KdlV0?=
 =?utf-8?B?YTZGUUVMT1RISzkxbjVtU2k3RVJIZG5SaFd4Q09DRUhyY0xtM0I2cE1qZ2kx?=
 =?utf-8?B?dXFFelVuYmlvL1dmbExCejJxV2YwYUh1RU43YVY3ZkVHR01IWTdJQ1BFQkxP?=
 =?utf-8?B?TUw2VzZWWWpxRHNZT0Z0S2xQWG4ySE16b1FvN05wdXg3TW5Nd1NFRlVXK1My?=
 =?utf-8?B?NlBUNGlhbzg1dE1tam5abkVmNWlGS2txWitGWXJHbUUvS21SK3RwdHUreUtT?=
 =?utf-8?B?bERIMElYVUl2K0FKK0Vhbk1rZU53cktuamhEVTI2dS8zOU1Gek9oRWVsRk5y?=
 =?utf-8?B?TmpVOUtVNlROQ0FqSXJ3MUNGU1hvcldTMTNMRWNWYzNYMmxCNjFUWml4RVVx?=
 =?utf-8?B?NWYwNHhHL2RRU1paQ0lVdTlGL0RCQnRvZnVOTkx2cjMyTi9lSXRGN2QySXRZ?=
 =?utf-8?B?bElEM2ZaY1pqamQxODhyZjJxZlRCREJJQnJlYVRsWEJHcGo1a0oySldMSVNM?=
 =?utf-8?B?OTNxMUhJTTVMbmg2MEc5dW9YczZsdTNKZXA2QXZmZnBhdlZlTXdRbXRlcVZL?=
 =?utf-8?B?YlkzTzkvdzUrWXN0VVdUN2JnMVRMeTB4SDZTYTFxZmxVSXFWRittRFR5Y3ZQ?=
 =?utf-8?B?N0ozU215Vjk3U0lYaVpkenA3QUZPcTg5aSs4T3VZOHkrbElRUkhscGoyV1pW?=
 =?utf-8?B?T2xCcTFUa2RKRDlVMGJmNDhRN2VZTWhmTEkyV3B3ZnZYUEZITk81dDZGY3hE?=
 =?utf-8?B?WlJUN29JeVZpNmtaR2NkRU5JWEVaQUJWVEUyWWFWdXY0WXBhd1BRUWdWUFVR?=
 =?utf-8?B?V1Q1cEQ5TjQ5UmhXQlN3ZjV5cDN5VzlYS2dKQzB5WXVWVzZIeWUyQVdqRlY4?=
 =?utf-8?B?QWxWaVUvQ05Ndlp4QUplWXEyd2xYTFU1VUJrTEV6Y0YxZC9GWkx2c1JxcFhY?=
 =?utf-8?B?am0xT05VWk8wbGtJdG43dkNzRmc1TmFzZnZtRzMrTFFjeGVyWDQrcjlWdnhF?=
 =?utf-8?B?cDBuOENZVGd5aGdWNzd2QXB3UjFpNmVIbUI0S1lUcHdtaTNaN250dU95RjIr?=
 =?utf-8?B?ZnhDTC9udXFIZ2pnQlJFQ0grVTFMWXRZSy9jQnBHWGw1R1dZd2FqMWVMeUQy?=
 =?utf-8?B?MUp4ME5yQXJxZEhNRWxkNVZGRzNVb0dnbUY4QzBZelNrNjVIa0x6aWY4VUNR?=
 =?utf-8?B?c0FxenJDUEdIdW5TbEFla21jdFFxb0ErN3VLdkx1bUd3T2dYY0dQcFZTcHlY?=
 =?utf-8?B?QmtHa0VBV2J4bEJKb3lVcC9NMDlMSEZhSnZDZXFMRG5DRTdET0lZbkFRWkJL?=
 =?utf-8?B?R0k3VXlNeldIMy9RcENMZ1NRcittMlVKT3pyMHY2ZVRSb29ZNGFoWFJvVGh6?=
 =?utf-8?B?Y2w3Vm83bmlPSnNQcWNZZEpNbjdSbHV5dlpJd1RLaHFjY0k4VkZqUjVpQTVE?=
 =?utf-8?B?WHNDcEJ1OGtIUTJ6WTk2NTk3bDBhczFMVkYzN3BMeWNoSzRoSkJONDhQNkZk?=
 =?utf-8?B?NUdyWENhT0VURHorNWtvOFlZZHRpVG5YdDN3SklsM1RLaElXZkVLaldsSElp?=
 =?utf-8?B?T0VWNGsvT2VUQ1czUmt3aUtqbEQ0aGlQb1loL09kTkQzc25pZXdyRm5jU0NR?=
 =?utf-8?B?T1VIek5NenhmMHZYYnpsVTFUdi9Ydk9EeDloQkQyeXpGRmRiOGE1eEVNKzVF?=
 =?utf-8?B?VnhXS29wR2pONEo1ZW1WZmQ5WldaQVZQTE5WSnl1VDNPNHp2amF6OG1xNERI?=
 =?utf-8?B?TndwakhjRFpjcmw5VUV6RlNvbjg2cFRScjd4aEpPUjhNTzcxM2oxc1p2T1lU?=
 =?utf-8?B?L3JveWcva3dmMDRTR1FRVkxwMmE5UVNZMVl4TU9vcUhSaDFMZFhpek00ODNr?=
 =?utf-8?Q?Rkdxi2wDHdZZrRO/ZY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a44d491-8cb4-4e2b-3a3a-08df1a099bc8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4914.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 07:01:08.7171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpMQoZBtnGYVy4QAZSA2mJ/lfI7mEw1Hy6JlJoH4eFGxr5tRlcA1WYlhRfEUBW8YYTVRRxOMaJtNJ4xRijP2WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_000134_692976_DBE0B64F 
X-CRM114-Status: GOOD (  22.99  )
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

--8323329-1198039324-1790233268=:3314104
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Wed, 23 Sep 2026, Nicolas Frattaroli wrote:

> On Wednesday, 23 September 2026 11:51:45 Central European Summer Time Michel Dänzer wrote:
> > On 9/21/26 17:51, Nicolas Frattaroli wrote:
> > > 
> > > + * .. _VRR-MIN-NUMERATOR:
> > > + *
> > > + * "VRR_MIN_NUMERATOR":
> > > + *	Default &drm_crtc integer property forming the numerator of a
> > > + *	numerator/denominator pair of a frame rate to set as the minimum VRR
> > > + *	target rate. Set to 0 to disable.
> > > + *
> > > + * "VRR_MIN_DENOMINATOR":
> > > + *	Default &drm_crtc integer property forming the denominator of a
> > > + *	numerator/denominator pair of a frame rate to set as the minimum VRR
> > > + *	target rate. If :ref:`VRR_MIN_NUMERATOR <VRR-MIN-NUMERATOR>` is not
> > > + *	zero, it must be non-zero.
> > > + *	Otherwise, must also be zero.
> > > + *
> > > + * .. _VRR-MAX-NUMERATOR:
> > > + *
> > > + * "VRR_MAX_NUMERATOR":
> > > + *	Default &drm_crtc integer property forming the numerator of a
> > > + *	numerator/denominator pair of a frame rate to set as the maximum VRR
> > > + *	target rate. Set to 0 to disable.
> > > + *
> > > + * "VRR_MAX_DENOMINATOR":
> > > + *	Default &drm_crtc integer property forming the denominator of a
> > > + *	numerator/denominator pair of a frame rate to set as the maximum VRR
> > > + *	target rate. If :ref:`VRR_MAX_NUMERATOR <VRR-MAX-NUMERATOR>` is not
> > > + *	zero, it must be non-zero. Otherwise, must also be zero.
> > >   */
> > 
> > Is there a reason that DENOMINATOR must be 0 when the corresponding NUMERATOR is? 0 divided by any number is still 0.
> 
> No, I think that's an arbitrary convention I settled on and don't enforce. I
> guess it should be "Otherwise, may also be zero", because the only situation
> I'm making userspace avoid is x/0 where x != 0.
> 
> > > Either way, should these rules be enforced in drm_atomic_crtc_set_property?
> > 
> > Or rather in atomic_check.
> 
> Due to complicating factors like EDID, CinemaVRR, and QMS TFRmin/TFRmax, checking
> the properties for sensible values is done in the HDMI state helpers at the moment.
> 
> If/when there is a similar mechanism for DP, we can probably factor the common
> parts out. I really do hope all drivers (including those that don't use the HDMI
> state helpers) can at least share the hdmi_validate_vrr() logic, but I haven't
> factored this out into an exported function yet because I don't know how similar
> the DisplayPort-equivalent mechanisms requirements are, or how much of the state
> derivation non-state-helper drivers (i.e. i915 and amdgpu) need.
> 
> Kind regards,
> Nicolas Frattaroli

Thanks for bringing up support for VRR features on DP. Concerning the 
frame rate limits themselves, as I mentioned in patch [02/25] I don't 
think there's a reason to limit the validation to HDMI. There is in fact 
an analog of QMS for DP, called DP-FAVT mode - this is quite a bit more 
streamlined than QMS and the validation should be simpler. Would be nice 
to see these properties support that as well (this was briefly discussed 
at DisplayNext HackFest, if I understood access to the DP spec is the 
main blocker here?).

> 
> 
> 
--8323329-1198039324-1790233268=:3314104--

