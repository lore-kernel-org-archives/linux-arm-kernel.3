Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99CDFCEE91
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 11:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksaFoQt7vDjuBNHULKpGN/wsacAEtcX4P5k/SPuv3Cg=; b=2m4oEVeteUsTY2wDkA4m2NHIbs
	j4kcS0yUqmqhti73+ZD5V5wHpSoycvC4u6LNjJ1Nf1te1m20y8Lv8YbiWeLX9oCrNw0Lp5HnFy3PE
	w5FSlcqzE9gsbXntiFkDGfA7MpDLSnU5N02NpTTvPgP/4xMhknZCMcMyrneXkBEy7ufjodRGypTjw
	L0CC0BCwiTcG5ktZqpTPsq7A4f6VGHAmyWv633vqauxDloStJDMRrD0GTJkUuYdHlA7K0KKSFuhP7
	mfmcjut1ysdrJELTIfh9FtsKjiZGpXc9SSXbN9DMJYYDFu2PSPVae7ZO5EpVYpcPSlOHoQwAuw6Pk
	u/RXLCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDWW-00000003xLP-26AJ;
	Wed, 25 Feb 2026 11:57:48 +0000
Received: from mail-westusazon11012000.outbound.protection.outlook.com ([52.101.43.0] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDWT-00000003xKj-24DG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 11:57:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pth/uEfwOhjG8mfHKVI21n/U9cd5q+xOm/FK2cCVGHZ2ksiz9FEYzmuOynXlXUQdAtblRxsYJtrVgehSBV6dmV1LiF9JebFGJ/5Fu3Mg9Ehyhm4HVu5tNKsLfFKY+vGLSV7bHoLBqPcbu0H/wV29XaBeogFJxYMSW2qgoP06EtiXjfDYyD8zw38j1PqONsuYvl1mE+CJPE+KYT9Q42VAG5fwW+pj0ZLq4f+Y3v0fjXmN2F1KLWKEGSwkHsqlySC2n+7XQMeBoSVjxHl6jl9noLYximASodwP0ylGh3vcwEa7m8ggoLiLhSAx4P/9uvQ3qTN8D4jHfijwS05s/3+jcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ksaFoQt7vDjuBNHULKpGN/wsacAEtcX4P5k/SPuv3Cg=;
 b=vyGL63ulaWxoRmvr92VZ3PSpll0IyK58tMDFb4elJyo0LKOjKLNkF0coBWW0SZRLKAhsSNrcRDsvcXn6hmDmSR4P5KwlELQuEmvibzLy5nF8iGeOHgJ8xVf34gjsuGaOd3cQhuZNdB/sTjs09PW4XqqgjbFX/0MN7US/WQoh/MKHmD5qAvuXhBDOJuASRXzbMrKC9BdUHRUfoT2Rq4l7MlLWliOQMp7enATHPBTPqytrfI/6wpaOjzWU4FlxXuQ7WssWajWY+gtGfgONCxJpl3+S/eA4WldWIfrD/+HE9s3j7uQt6wWQQJ9c6cgSXlS6BVIUnsCFthuK5XCCduKCdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksaFoQt7vDjuBNHULKpGN/wsacAEtcX4P5k/SPuv3Cg=;
 b=qLIU/WaJlbgLP+VMKDHSvtTiM3IBOUeqxhOCOJXdMPTgKcZH71vnGmPyDopxgxklLgYE/AjKrg18fbN+b66J/e54AZNdtwcm4Pba6lHP34QLyPind+AGQkSkpP2BRjncszQbncdnpJa1uypP3B4t0d/PWcYXK5Qyrwot+RvD7W8=
Received: from BYAPR06CA0007.namprd06.prod.outlook.com (2603:10b6:a03:d4::20)
 by DS4PPFAE15A2261.namprd10.prod.outlook.com (2603:10b6:f:fc00::d3f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 25 Feb
 2026 11:57:41 +0000
Received: from SJ1PEPF00001CDC.namprd05.prod.outlook.com
 (2603:10b6:a03:d4:cafe::33) by BYAPR06CA0007.outlook.office365.com
 (2603:10b6:a03:d4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Wed,
 25 Feb 2026 11:57:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CDC.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 11:57:40 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 05:57:39 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 05:57:38 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 05:57:38 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PBvcK3397713;
	Wed, 25 Feb 2026 05:57:38 -0600
Date: Wed, 25 Feb 2026 05:57:38 -0600
From: Nishanth Menon <nm@ti.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
CC: Vinod Koul <vkoul@kernel.org>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>
Subject: Re: [PATCH v2] soc: ti: k3-ringacc: include platform_device header
Message-ID: <20260225115738.whcskn7jbhpstc7g@pester>
References: <20260220070242.470060-1-s-vadapalli@ti.com>
 <aZ6pQMGJn99ZLWyb@vaman>
 <6b1e747a-fa42-4f1f-8d57-41f9d7b574c7@ti.com>
 <20260225102839.652wkz4o2fxe5eok@jimmy>
 <3e005688-e479-4109-86b1-c2490cee1a8f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3e005688-e479-4109-86b1-c2490cee1a8f@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDC:EE_|DS4PPFAE15A2261:EE_
X-MS-Office365-Filtering-Correlation-Id: 85e71ba7-1295-43ee-e77b-08de746513fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|34070700014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: E5+jgFgwpOo6L7Hz9IPMZVp6wa6qG8Bcsk6GhYTgY0tU6Og7sgEy1xbBpKosJ+RTdzyYeopKoLN/7ZRtx/t77OE558dUFI4Rimo/wh1kj+J4jHSs2Z/qXwUq0DnewZXz+ooqqSVjtpNgcD0ePdUdkPC5B6TZvRAg1HvLK0LH4nlFsr22F7237m8OhkIp1mg9YCYJ7OAQ1Me4O1wVXHNpKo4ykkHQp1ywKxyQ78ssoYyuG6BxC68TgWuKaERXLJhwXFCsWBDi+Hv4ps4PnA4bmaDdSbclJ51vu6g2rOENq7vfVvAvU31ovFCQHs/fETrK2zo8eMvy8RAJoUCCCD9Nggh6UE8GgAWYbwy34udUmnLw4wjYox4h9CUM33mjNPuWfh9tQBCm6Iau8Wvu50u7wMJRZUrFglU8DUcS7B7+Mm3s9A+Emlwoav/9MJO7Dd3B4yVn3DXtNNDfqfH9v2GkopI4EVNRoCcFISgPr8hC8JX/AZAIfCKd7ywFG31D1YfiNHyw2IhUJfc7lmPIhdv8xPVmDReSRJtmPKluXV3wb6XFZfEG9ICfFbRIj89k4YM8y8faoyLolINVYpok4KTs7C2Tfvf0uxbSZPUQSSEzm0nbAA9F2fZkJYOPhddtH3NeXmgeUO7sq+Dxg+YwERZoAgeNj2DK6O98h57nHo3zxU2NA1J1Rr9D2rQuAwgT8YObcGfWjYCW47gcHoGhNJaD09NlatBcnNV/9OKtxmApzEq+OEdBRp2wHC3wZIXVeCsrYKoGsnym7Hd4IpnBBjBDomGSmFNoOwr4oiUqTCeT9KmhdMhDdTDVY0OvVEHqDgoqfsAWmQ4eVQe0JuYnGgy09AvO2sTb3jlMfiCDroyxvhA=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34070700014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: urCEnRoLP/atOjz/Dy5uDwC6g6r2zYRdr4eC3LtXRM7WlwtYKvP3A1D4wlVz4JON+35NWxkahe99Jq303KCdgyplJcg28lzItWon5iJETqSiwIbYZTxx0i3LFhoGDSqSCvJp7qDHpXTKNjY0mRqN+Pio/XfnbeLTXvOJitnEbYlGUgR+GYwRuzTw/vZD/0CeEHx5fdC8w3OdiaDh8UGmE0+5pkhXxxm16VnfCRL5ltXJqiN8K7m/XI4ssmMuy3vhIL80ADGMwU25zle4qTbGe4iikgyTfN0LRO4sdodBHlscdra7VIaAuwWBur/Celuj4FuMxKdY5dZwzr3qScw9G1tONB/ObT0TGgduIqQus6PUwjzkhHuJQXmNmg/tSSvHFbkMkGHSU5l0rcXHVGP8enYVyRDa23pT+mK9v/iZNk16rbjDvdoK6Z05XfAvkfeE
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 11:57:40.7803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85e71ba7-1295-43ee-e77b-08de746513fe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFAE15A2261
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_035745_538763_C54165E2 
X-CRM114-Status: GOOD (  23.26  )
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

On 16:08-20260225, Siddharth Vadapalli wrote:
> On 25/02/26 15:58, Nishanth Menon wrote:
> > On 15:33-20260225, Siddharth Vadapalli wrote:
> > > On 25/02/26 13:18, Vinod Koul wrote:
> > > > On 20-02-26, 12:32, Siddharth Vadapalli wrote:
> > > > > Users of "k3-ringacc" APIs may not necessarily be platform devices. Such
> > > > > users therefore will not include "platform_device.h", resulting in
> > > > > compilation warnings for the APIs declared in "k3-ringacc.h" which assume
> > > > > inclusion of "platform_device.h" by its users.
> > > > > 
> > > > > Fix the compilation warnings by including the "platform_device" header
> > > > > file, which should ideally have been included since commit under Fixes.
> > > > 
> > > > Which tree is this intended to get picked by?
> > > > 
> > > 
> > > I assume it is the SoC tree since 'get_maintainer.pl' doesn't output a
> > > mailing list apart from 'linux-kernel@vger.kernel.org'.
> > > 
> > 
> > drivers/soc/ti/k3-ringacc.c already includes the header.. so who needs
> > it?
> > 
> 
> At the point in time that the v1 patch was posted, this was needed for the
> patch in an RFC series:
> https://lore.kernel.org/r/20240518124234.2671651-19-s-vadapalli@ti.com/
> Although the RFC series hasn't been merged, since it is still possible for
> non platform-device users to call the DMA APIs which in turn depend on the
> k3-ringacc APIs being exported, I posted the v2 patch.
> 
> If you believe that this patch should be posted along with the dependent
> series, I will do so and the patch can be ignored.

The right thing, IMHO is to include the header in the files that need it.
We don't need a single kernel.h with everything piled on it.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

