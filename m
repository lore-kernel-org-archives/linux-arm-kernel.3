Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786B4C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 10:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RV5KKqXWU06UPDOQ1FU85a/yQ6AOnXFD9MN9/pFHIt8=; b=u2mJxD30dz1f30xCyNKG0H/V97
	QxpBVQ+nNl1WhnS5uk5ooTcXQr6YVJMrFY6kJkrV3Ki+dhK0IsLA7gpXihjoUP1qsZC1S7HpMB7sG
	f5O3T9JfQKkVnzxpK94WIKC1KiMfj6lEQEpYo8SD1eNq198hqFG3hqfpd6w1BsX8Wnz/GpFVHxpvz
	Qe+6IHgLI0BpVER7UNfqamuvrI6zG8LKQUSKn9EnHpz+cfQnWr2FHRx1EPl/EzbGzpvPraI9Q8cfw
	0K66ENK0o1HjcT4aU5oWfoILvCQstFkOFzAzAVffSgg9Ebt4C6xD+NMhNQjR0xFVYjaBxeXwAf90U
	9EPC+rUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDV3-0000000BrZp-1vUl;
	Thu, 20 Mar 2025 10:51:45 +0000
Received: from mail-sg2apc01on20703.outbound.protection.outlook.com ([2a01:111:f403:200f::703] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvDTK-0000000BrHP-2j9D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 10:50:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxH272SXMd/n3oNBo6A2m2HiO5LNCg/HLXCqGVScugUbo2dPdzd5YAsP4sUQ23UtZ5QLktfFR5YALF7bm7chPLaRzTvgIjuAsN5lU0qUy75R9HO6P6ZbKP+n5ckoMru295wE1RsO12Gh4SS73RoO7MGxREfG7wht5FgWGQg1jSbzRabaeTA+0mtYy0Jqx0kVFWr4AJMFoVTbcq402nTgCwrEtPwipF7NWqjemPHYWuDlOnOCbfikn6LWydBM96vjW4Z76/ZlpygwXB4S9DBY/0rkAGYthIxYcVsG9WFxByaoWRLv6aqvupPtoqlOJI5lEMn0GJuF7547gxPKfkDDkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RV5KKqXWU06UPDOQ1FU85a/yQ6AOnXFD9MN9/pFHIt8=;
 b=TvuXditgYsza1pPmXWDhDArx5vGdr9NEjivCEk++PXMcd4diBy6AC/sbZzvxn1/l9KHGHyZbI8mk8nQKN4ucD2AEp+yWXuCjJ8lKG97fuRMCn/pjaQanA+AU9Dc7XecNE4g79nzWbkEZFSDqH7DVq8dhejD8aLNG3vhPOAv0OSauhlaslk3BixZneIWib89zpDTRt3BmaPAoxTTnbl/CtObgNzajBKO4OU+TrK/rw1YUKjdKwF8IX09c7q39f+hPo9ZARcqS5lhVgqz5RrNrOrGPLZWOmhaXaWE4lV6WTirQC38ZoleNjwvEPFX46HOtaGLGG4rzmjm9dP9fzWy/sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0003.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:26c::10)
 by SEZPR06MB5854.apcprd06.prod.outlook.com (2603:1096:101:a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 10:49:50 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:400:26c:cafe::4f) by TYCP286CA0003.outlook.office365.com
 (2603:1096:400:26c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.35 via Frontend Transport; Thu,
 20 Mar 2025 10:49:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 10:49:50 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id DF164512A743;
	Thu, 20 Mar 2025 18:49:48 +0800 (CST)
Date: Thu, 20 Mar 2025 18:49:47 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	marcin@juszkiewicz.com.pl, Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH v4 6/6] MAINTAINERS: Add CIX SoC maintainer entry
Message-ID: <Z9vyy7f5NOPyzUES@nchen-desktop>
References: <20250305053823.2048217-1-peter.chen@cixtech.com>
 <20250305053823.2048217-7-peter.chen@cixtech.com>
 <7419360a-abc0-44cf-8d55-8f5fad8e9079@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7419360a-abc0-44cf-8d55-8f5fad8e9079@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|SEZPR06MB5854:EE_
X-MS-Office365-Filtering-Correlation-Id: d70ea60a-b719-40ec-9a26-08dd679cf074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?beiTqLJzub/tDNNdSPza4v2i8u8YROwbx/4SCQTraQSnu/+svR198s+FNwNC?=
 =?us-ascii?Q?GTQsLimn6LRiylJejD6Jp0QENYmfdovC+EaWmXlgGKqBzBiEYp1uVtixcW1e?=
 =?us-ascii?Q?AnSvt/hfpn8dgQhUrM8a0oGgJTwemC54WfzXfsZrtqF2zvVunOCnqbKNTqH5?=
 =?us-ascii?Q?BGu1mzxkq+bOh4VgWB3tToHRS5xgzRdeboWz4Sa34OFopL8ttpgQ2p1D4E7+?=
 =?us-ascii?Q?jXEr9JV9iwocw2YuLQtO1ZPN6H4T3dOFiYLNWF0vE9KvxYA4NkoCX170Q6dH?=
 =?us-ascii?Q?rimrM1Jea4P0TpHTTCEKNEagFBCyd2B8dZiymZ+rUjwy0hQwv/IpQxvsf7jz?=
 =?us-ascii?Q?2HZAV9dI2kddgMMwiboTXMumyEtDv4GtLwMrHLs1V1votd6IXY7sllUywkCA?=
 =?us-ascii?Q?xP25NLN98pcJVu3K09v2KEEvWA++1HZ2s6bU5ByF51ECu5bR6ATxl3T2Bwvz?=
 =?us-ascii?Q?NHNWU8nq/p2+NrTLCmrg1A2aNVUodQzawpZ/0VQTYqQ/yKaoiFeBIn4rzkwR?=
 =?us-ascii?Q?QGjuRrZydFou6YivgFyQXEtn0L2Q69HpwCfzvRDthm3Eob0JI9uSnjvVewR1?=
 =?us-ascii?Q?r5THwnAFtJf4V2+hj9hWtWVbtYqhygh+zudLIVCyEQMniK80kKqtXJVvGl+s?=
 =?us-ascii?Q?narprSnHIUozS/0fcbpAo8vwfZ1gOI/7Z6NiUGmqlYw4Z9qGqxZ14lhXjh4a?=
 =?us-ascii?Q?4Y/6G7Mr/7MRWth92Vfu53r1JfCAst9lDynzIXX5Syhi3UoKIXvufq6h9HWV?=
 =?us-ascii?Q?JqjOEibk1LPYfRte6IrVINx6dLhCIBQfvDaHU2N2LqVH/NugVWXbEN4LZWWX?=
 =?us-ascii?Q?SNV6+59MZx8+/P+4s12HaEccZVlREv2keAIZUq4zrkPhPvxzz5SdVw0uysrK?=
 =?us-ascii?Q?lbwiDJy66g8pazPvPkCA9tXxTyIp7BdXSqn4zplvPrmQeNxP2/qyYaCsA6Pk?=
 =?us-ascii?Q?nBlMDcXsicOSrzylxf1QcIvi07MXzOfsA1onwoGDUTcZ2jyl0EGV/1AebURX?=
 =?us-ascii?Q?rzeDI+nt2Aonj6MjNxT5sGZK99WXZZRkGV4G9wxuUp5t2S3xbiZHsRVt4GPi?=
 =?us-ascii?Q?phFtxkG4EWMCQ5EYIW9BgDFTkGAoYG9i7/FVI9P2SyqtyRbsHV+LjtSLrOhW?=
 =?us-ascii?Q?8QycIY46w/QIWX0pa/J/jhKI6RRtYGibd4H0PdCzGz7nTiLur+cCk6nDGRV6?=
 =?us-ascii?Q?BSTjSVmFNdVh2u1s8DCuaj/P0A1kU4QpvwxY2rF/RF1AjNvhiRWmbnlg5VGI?=
 =?us-ascii?Q?D9W6YPxI/nAgpJl7qgEASOCWSZD3G72PivEnpR2MEJsRhOPYdUkxhClpHoSG?=
 =?us-ascii?Q?epV1dFHu1p8nmpCRISr50bJBvNmLxJUgCHKlS0yNCYBgOgGR56rqSmWc/HV2?=
 =?us-ascii?Q?GOEOioLqiuqND7jV5EN5KEjloBCYBKPKaZdgqHN+FxwS++sHYy9legqgkSVq?=
 =?us-ascii?Q?YnoF6M7nX0HTfmgd+mD7sSloBEP6Hp2h5EZcof8X1crwv9N9RVjip+AaW2M0?=
 =?us-ascii?Q?AhJruF4+IJ1dCsk=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 10:49:50.0084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d70ea60a-b719-40ec-9a26-08dd679cf074
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5854
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_034958_687784_DF237BC2 
X-CRM114-Status: GOOD (  17.32  )
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

On 25-03-20 10:25:53, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 05/03/2025 06:38, Peter Chen wrote:
> > Using this entry as the maintainers information for CIX SKY series SoCs.
> >
> > Acked-by: Fugang Duan <fugang.duan@cixtech.com>
> > Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> > ---
> > Changes for v4
> > - Add two dts files as maintained files
> >
> >  MAINTAINERS | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index efee40ea589f..edf26cf11ee2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2354,6 +2354,16 @@ F:     arch/arm/boot/compressed/misc-ep93xx.h
> >  F:   arch/arm/mach-ep93xx/
> >  F:   drivers/iio/adc/ep93xx_adc.c
> >
> > +ARM/CIX SKY ARM ARCHITECTURE
> > +M:   Peter Chen <peter.chen@cixtech.com>
> > +M:   Fugang Duan <fugang.duan@cixtech.com>
> > +R:   CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
> > +L:   linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > +S:   Maintained
> > +F:   Documentation/devicetree/bindings/arm/cix.yaml
> > +F:   arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> > +F:   arch/arm64/boot/dts/cix/sky1.dtsi
> 
> Instead:
> arch/arm64/boot/dts/cix/
> 
> or if you think there will be more different architectures coming from
> cix, which you will not maintain, then useful would be a "sky" subdirectory.
> 
Hi Krzysztof,

Thanks for your comment, CIX is Arm SoC based silicon design
company, we may have different SoC style for middle end in future.
So, for that SoC series, it may not name sky.

-- 

Best regards,
Peter

