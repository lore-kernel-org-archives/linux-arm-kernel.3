Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B21DF8FA78
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 14:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8jM8gb6N+FiX38dj9PVUKO95IAKX00CjT/QZJppmXU=; b=tBIaoHidLSuMUnYNGO5SYG0Emu
	XEsEuYTAZZ53DgT69eizl1UBwB7IM4toCkAXCXwE0TSkhBKQ8U39WQvyhyyp66k2+Claf+SNVNrgT
	4WaO64oozY89sb2j+mrpddlE9DWwbvfp7U/BPq1G+8Jelm8RDggtRrpf45cFSoDO94EzSNHorIupa
	q8knnR1PIbxeG1+7/CvH+2TAEMhBhu6mUSUDj0gfNgdj5ICM8s2ONErZaOj6GFjK2d1TsCXxfZo+y
	dsXtdQEZTM6kZSZVcv0nynBHGEC7rhDHHMEtsgkHZwRZBEN9JF98GXqlHbGGz96WCAxEsPF/wVl3n
	1ZPCrjgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBus-00000008izN-1oO4;
	Tue, 21 Apr 2026 14:17:30 +0000
Received: from mail-northeuropeazon11010024.outbound.protection.outlook.com ([52.101.84.24] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFBup-00000008iyq-08CC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 14:17:28 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yv2WUiM5Xp2dyxDEeoo3SDRIql+vQrADOjI3apCpCoe94rAbs0nUuLoK1y2tH6jJIeQM23oWiVkwhiHnZhaiTe5xLJIK8gAGrFZPYaS40VuYPi3ZIMIHg20l6Q7rgPTVa7f3gfyz7WphmTopO86S0+1ZGDnC4IwgFt/2YlmIoNWlcGGB7g64DgYzTZDFwsXnVXxZeEbVMJOOA/1zuSQRWJvyyx5Tg8QsK767lDimlLo9w6NpXqNs7W+/gCdDm83z6BMsGSQZCU1StUzN3wp/ZrBjhuotR9zk0uSDuqt7ti+r4BHmrH0crf2pUjL7v/kkuJM595gm7cfZCvDgIPpUIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8jM8gb6N+FiX38dj9PVUKO95IAKX00CjT/QZJppmXU=;
 b=x6I46nc0m1b4MCBy1y6e4mXc+KASqdv4w/TT4/2oTctYID7E3LX2moTWtLfftjTbMlypChPqX8KFpWlkAsgvU5JfjeflUq1dRyZiRkWeOZLcAK0xNj0pU5hw7duoGZvPA5PuT7aQw1GkrDsK7LuKzHiSwzoUL+xDdVyY5wBMm4Jl0xmSqOuzKZABnkNGzn8HsAkpEEGp9IQXwkzXgCujlmIHpLU8RRcy6isOJWHC3jwC8gIm2TKc5MZve2XEe+dlFJl8PCKxFhlOrDfGUuHzsDZPLb5WstkHewyv1m5B9ZZwgvkyA/Xd9Eq1eLdU0wFyVXq0VvUkTkZJtnN3cOMGxw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8jM8gb6N+FiX38dj9PVUKO95IAKX00CjT/QZJppmXU=;
 b=gPuq/qgFMvCrMhStF1LcXs3qvNPkgnf2giiG+/fua0mTDOaenhqRVvrx4EHZ14ZgSlWOl5wGugDSCXsqyv/YpwMdFMMXY4fFmjBrh5d8ppApIYN1i9RR3w4sthP662wd8qKGjPe7R4HH82HswOGXje+xorP45+c+/t4mM67VLTA=
Received: from CWLP265CA0461.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::9)
 by DBBPR08MB10556.eurprd08.prod.outlook.com (2603:10a6:10:531::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.32; Tue, 21 Apr
 2026 14:17:20 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:400:1d4:cafe::e8) by CWLP265CA0461.outlook.office365.com
 (2603:10a6:400:1d4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 14:17:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48
 via Frontend Transport; Tue, 21 Apr 2026 14:17:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELU4tQnADmSdBGubins68/autVEZHOTcfhg23Jrbi1Pl+UcYKqJ1PxIerJIS66e5mcrtKuahZMjcpk7rzLiZf4Ry2kW1/wylMnVqmwi2HttJb6c2GesPTiGuEl6pia9VxECuhwr2SQI6SXtLvgB4wxTRCzlMq+VQgWFxS3g6cFxxiiY5VIU8DyAwTjH00oNcnolq10Uan6nnF6LYpHpiVQn6ynfl6zIPvbJdgYWy7qlat1tyZ+iyOoE81v2mg33mj+kVz+6Tbt+nNomw4VL6zToNdSM9qjD90W9YHa7PBFBQ9mRJU5N3cCD1mbuHMhj4kQwrbWvHNSLzzmHPGfpwwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r8jM8gb6N+FiX38dj9PVUKO95IAKX00CjT/QZJppmXU=;
 b=n6/rdKv3XqD48n6fm7TL4/CX1WjC7pVLAdh4hCoz+YoESQxY+ISTCvrE5pX0zhAeBvLkfC5931PgVV8741D0SAD6Wu9SUaA89NqQY0QiCWtuOZN0JbmODywFOk8DTA/kzNQXdTKi6AT0QGqgjmogCvcUmU7OGF2zzOSXivK25YSFNKpJcKj7/yLR99UbmmBOwmBSdxs1lwtv1i4KnaKlCnVYDrz9OsZXJ5VG1AV4GTQpWntvhSRPrbuSn/qeYj7acVQKcfC/E1u4aF1z8JQHH0Qr3aInGrVHDKXWAtnXyZGNwPCOrwbEt8HJFtkBXOo5wYc1mVMns3w1dHokkdNCSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r8jM8gb6N+FiX38dj9PVUKO95IAKX00CjT/QZJppmXU=;
 b=gPuq/qgFMvCrMhStF1LcXs3qvNPkgnf2giiG+/fua0mTDOaenhqRVvrx4EHZ14ZgSlWOl5wGugDSCXsqyv/YpwMdFMMXY4fFmjBrh5d8ppApIYN1i9RR3w4sthP662wd8qKGjPe7R4HH82HswOGXje+xorP45+c+/t4mM67VLTA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by GVXPR08MB7798.eurprd08.prod.outlook.com (2603:10a6:150:4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 14:16:15 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%4]) with mapi id 15.20.9818.032; Tue, 21 Apr 2026
 14:16:15 +0000
Message-ID: <c4d90a5e-d28c-49b3-ad6e-4f045769a44f@arm.com>
Date: Tue, 21 Apr 2026 15:16:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/12] coresight: etm4x: exclude ss_status from
 drvdata->config
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, james.clark@linaro.org,
 alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
References: <20260415165528.3369607-1-yeoreum.yun@arm.com>
 <20260415165528.3369607-5-yeoreum.yun@arm.com>
 <20260416155118.GM356832@e132581.arm.com>
 <57dbea1b-670b-4b8f-a590-1d4239bc2c76@arm.com>
 <f2b0dcc5-8002-4ee9-a219-fb361573a9c3@arm.com>
 <aedLaFhwyYMM8tUw@e129823.arm.com> <aedRqhC1JcoeV+R2@e129823.arm.com>
Content-Language: en-US
From: Mike Leach <mike.leach@arm.com>
In-Reply-To: <aedRqhC1JcoeV+R2@e129823.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0296.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::13) To PAVPR08MB9674.eurprd08.prod.outlook.com
 (2603:10a6:102:31d::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAVPR08MB9674:EE_|GVXPR08MB7798:EE_|AM3PEPF0000A793:EE_|DBBPR08MB10556:EE_
X-MS-Office365-Filtering-Correlation-Id: ccfb2eaf-4cf7-4d75-af86-08de9fb0b35b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: TQWZpBqznCHyGLBySKsMHIZ/Ods3IeP7YEFmYfY/QzPe0KCT+9YO9XXYTL1o7iH55Q6J1yc+IiTB96RCtQVagUS1tk6V+Qo1IPiwtIkzpyz4ylmrTtm9Kldgfa3nFOpyTvrhF4b9lk5hR4r75L8oMhoVMPtv9B1avHsGe8r75Luy3EdKGaFNp9U06MJAB7fx8aBz57rXlkPG1trYXHR+Dlb81sf0i5Pf03DWKzMXgGZoLCUf9rVNw2fmZ24Yx20DIpJOEojNcw/9NZxj6pAwtr/TNcMZhfs/m/tdTR9y8qS8QW3c6YEEQ5lnSGmWWrY1hDT0VZu5/TECSmWe/0MQFRJbYy545VFFkaX9lCgJqqjPFMo8IBluqXTz3KizhQj2Efnr1HUdM1A2FW63UL5drqc+qgSRPWemBK/gK8bwhZ9pVrZQYBvdcxLwK0B+jMQnZ/flpX4K7WYNIgeBRFAsKWZCWRJmwqoKhQBmyMgEJ8X59XuYiEfp+bn93RxLy9gxiFKmqbLIs7QnBnslRXFbNKqL/Vco6L023qa+DFMnBicP7y1tOZr0a1WVq+G8T4Q/IM6IyU8QEK1wqXVAeNjijk00/5HrskT73qpwSYgA3I+SfkI1Biiy7GIJMtJ6rNEu3k7UEY95I9uUJaMP8lrse2+gU2abPXMfJ0LtM3/zXD1dlJZ3ZdkSnrXUaYXHxgSs1LibrIOUmxp3+XpDRecFYpIKXfjMg+B+Mq1SMBevBik=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: KGs0PSXun2M/fDCevlye/2X+HxobAloH8yNNV5z8yW+T3SFaGa/5ukMlqRp+AL+mxawBenk3gmHCy05nck6ODjfg9LpP6lvM1ontOgbnfu6tkx7pdo2fo+OuiUpRjAexv1WiFNUcT0ie7HgzuBO1hOPg/pSvRJxq0JyAOb3RdQwH/3NAgGfnPsvl3xyRnzWJZUrr548Eg9ojXS3Ne1DM6rZCIzI3ZY+xe1aV5vI5ZpRqLOGP0kelKs7z1hBlH8+gzNit3r0dFXFBXtg9bC5L0z027aFs0jXitVQ5iZzn86oQ/fTDGoWLBD/KT5o1TenL4Anjw49oDXqbYQ3oOd+ggg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7798
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 766c9deb-ccfd-4fc7-8974-08de9fb08c37
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|14060799003|36860700016|35042699022|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: ULDSItRAkI/In2HAVlGAmxlqDUA6EHccSAEuhCXI4aAmmRAJlFuYCdBX4vGOMx41YcZaMpxeIsninftlr02r+irfi+TsSgF+uImFbY6EFkSuk+BC0++0hEaJXmFLtmW/TRW5d0C7xMw38CFpjg7ZBYR5KJBvOe9DbogXIurNU7ECKI2CCfWicwn3yr8arA5pm4Lb/8pRkY3xvpeehhF/kcc6IJ+j/Xp2gBG5MGnjElMUyhdpL/dFzMxuzm/1hDbDLAUQs+SZawtRe4saQ/AoTNIl47Tn2ODzlvnEqkvJxShTerxL7CjeixdV3JwPXwt08YzqKMsR3+L8w1sz4+Nk8y7GhUkgeRrBaWBYZ0unpq7GqL2Jm45dun13w1rYT/TwRlu7Vibw2AxQqJbiYPw4j5HHF4mchOTLso30MEXhtmTE7XuWxmCuv/B0Uj+CPzk9ePLoIMRMGziwdYMGTd1US/pDFiRgqEcmynGr5Kj1peW9tKKGlXwKmj9aSKwmiYfndSeFl/tzCLY/rq+3OcSKbE36GiHu8UL9ehNwnc1BKmrLhjJlGzsafje+R2DomMOAdScVgWQBGHUjOlrbQ4Guq4M45NfxRjUH+WF2hpJ/IAe2lxesrZGz0akbtDeCXO3IF2bh6Iy36wGqSuq16Sc1NY/1dsZ+lJUEEiul4UcdozjTdxeT2+yx2/bweywz62g8enn81QrqEH72eDcImHcujmGhLc/SfqHqzUg1+SsAARHFfwdem4hXo8aYLtuCGaifGxpeKpVpC2Jau/cIrDa6OQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(14060799003)(36860700016)(35042699022)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MEeL8Yo3DPNNHM6thZnZWntCik8UkhpJnOqpOYKC3JMCH0YS19XbmcqfYTGxlwY6DzuDy1PAY+mPAgMlCcngw7k+AjtOu4bVbu2PIBPbcdmEeqaCM65qsVWEB/DJmMAZTwT31fK3zHDCNhzCBUx22GdGG8aEbLGl1z5MmCaXYfwa/TJeEb96TqEC3YNEX7mgCekGfkeQRmeSIt/y+osP9IGqWO65bG6ZhVpQnkwRjcvbnFSf8Avrd3SLe1USBQGG7qWq+09KKv0qotWcCYtSehO5LXGJZPwd3+xU9BHfwpgpzynX7/oKrV+Ny24ZFwlYuK3TLw+fFdnwZ+EhvO89jtLHtGwfzLPsl1AeUOaKRUfXHIs27oxOpRn+U4cSBgb2XpN8EiuwKFvLnAl+p+Od2SeBmI0Rij6BKNSdT8hKxf9HOw6tudmMO6deVgQ2A4ax
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 14:17:20.4414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfb2eaf-4cf7-4d75-af86-08de9fb0b35b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10556
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_071727_237406_930C39BB 
X-CRM114-Status: GOOD (  16.88  )
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

Hi,

On 4/21/26 11:30, Yeoreum Yun wrote:
>> Hi Mike,
>>
>>> Hi,
>>>
>>> This register [bit 31] indicates if a single shot comparator has matched. So
>>> read-back provides information to the user post run to determine which if
>>> any of the comparators set in this way has actually matched.
>>
>> Okay. so after disable sysfs session, to check former session
>> check whether comprator has matched.
>>
>>>
>>> Moreover, the specification states "Software must reset this bit to 0 to
>>> re-enable single-shot control" and "Reset state is unknown. STATUS must be
>>> written to set an initial state...."
>>>
>>> Therefore this register must be written as part of any configuration so
>>> should be available in the drvdata->config for both read and write,
>>
>> But I don't think this is the reason for locate ss_status into "config"
>> since its write purpose is not to configure but the "clear" former bit.
>> That's why I think it's enough to clear when the new sysfs session starts.
>>
> 
> IOW, I think it's better to remove ss_status from configfs item
> and
>    - add field ss_cmp in etm4_cpas
>    - add another field ss_status under "etm4_drvdata" to show "PENDING
>      and STATUS" bits to sysfs after finishing session.
> 
> Is is valid for you?
> 

No. Why two different locations for a single register read? If I have 
the ETMv4 hardware manual I am going to look for a something that is 
recognizable as being related to the single shot comparator status 
register(s).

So in sysfs I would expect to see all the bits from the register, 
displayed, without masking off the STATUS and PENDING bits as happens now.

In the code I would expect to see a single location with a sensible name 
- ss_cmp doesn't really correlate terribly well with TRCSSCSR. If you do 
not like the original ss_status, then ss_cmp_status may actually be 
better, ss_cmp could be either the ss comparator status or control 
register.

Regards

Mike


>> --
>> Sincerely,
>> Yeoreum Yun
>>
> 
> --
> Sincerely,
> Yeoreum Yun


