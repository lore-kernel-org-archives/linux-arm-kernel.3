Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB31E909C0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cbm/bJsi/ugzWpy1XB2PlzFUz3kFRq0DO90f/pDUTK4=; b=Ol8Aw9LkxTf0mVWL1EbO5IjICd
	hALlLjXQLz+53dvdEFbz73obYY0fuuTFF82CWrPsfMQLTb/EhHfmSotZ5xsGZJTbH21FxWKqimRSI
	i1mwpPjXutvTTEtXblm52zu32spPPMSSfzEDXHPAcJ5FY1z/+/enGFze6m/yr81JR34rxFIeQ4Xzm
	+3Wd0sgQbfjI4KfeR8uFWSlZ0yCeKcf6rnU0LgTEAmLNKFTME7XaBF2GJMzEdaa5pqWkgsSw4YGWv
	g3wvDmhZfmhp+f4k0Dt3GYf5GtwSiI/Q9nspQ8Z+6Z1Ft+g1ZO+cuRk7SpuD+VU5wA5mZTvMn0+Ro
	zYZb7agg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMfm-00000008U6o-44Mm;
	Tue, 17 Feb 2026 15:07:34 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsMfj-00000008U63-3psP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 15:07:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FM2iA/O0TaAsrSGLJepRfWOt3krgSQnyWnOeWKHTjRCgui+vZwma6lR323csvBBCXEOSD+C1Sij2mvcX6tatNlAjhXl9d3HN2JcghN/MYbq/sQVMw+1WkxZHj05DlPEaWZp+Y7Bo+1CqNUSIdlvih+B/ArLtPXYqehKgtsVQYX1R3Q0JyZAl8f+TrEC1yf+qI6LX7rajNSFy2VNUey7k+65qKpFPk9T2CH/2TCAaswottVIWqxhsBk5vPcI9OtZ5b1C37NzJ8d1uCAYIMJIRDjeDaaz3DWQaARFiR5K/FejC1C1WhfMdIj6T9cZVz32BLJ40qEJzPgOewaPeyvyHYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cbm/bJsi/ugzWpy1XB2PlzFUz3kFRq0DO90f/pDUTK4=;
 b=Bv8HIeOgd+mqxingQXvGmb9aNwPJAvp+cK0f1GmUQCS/eHoHQqo7X5/7AFCytgBQD8sI99GITHwYbJ1G/JijQXrc/7uaZ9gvgbwhNMegiQ1RhsAfkU1nK4dkNbeTVdkmDjNmKUc0OqHZXnD0Ath9Cppq153iBPU7qnwwxrCBm/U2Cbjw7gvQpaaYrdgbh7usvBowEXKIjW0Blqjf4Upaqh2fNioTz6BQmk/nZC79vHGWmZaXGIftiPhlF0tDZo1hHpRgM0fmWQs0mZOBW/OAMCXQBL1KEa/91EVoGXOPGgKQgueo5qvDonrBE3WWl6AOhekx4LXvvVC/nvMMIU+DZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cbm/bJsi/ugzWpy1XB2PlzFUz3kFRq0DO90f/pDUTK4=;
 b=g5jxTbCHbnIK9MeaL07Cmt1awjdXw6wtV+0TTVeSdVb8WTjMlaJt/PWrt8K4vylxP0CQf4MWb000ihPg0D5Fiv6U9yJs507OAMvng/J45ie5IC8KxQyFRjr+TtA+DfmKmNZLFJl2flBgd1I5w5oBSd890k7s6+YPTjKiPLMDT3IxwEJ9kvxAa2XyquKjYigXGW7+f6XeOgZPuTzFEqfSND3ivlzA0Ysrx3+U6ApuI+azyEFSO5vG4IvAG6kOmHNBclzyrS1qGWcyp7AHYYOzjpV5NADV36z3DhocT6gq68lgLKaR/hi78xKa+U2kjfSWx8O3Y1VfDd9WdOkPWaW6ig==
Received: from SJ0PR03CA0362.namprd03.prod.outlook.com (2603:10b6:a03:3a1::7)
 by SJ2PR22MB5192.namprd22.prod.outlook.com (2603:10b6:a03:589::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 15:07:26 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::37) by SJ0PR03CA0362.outlook.office365.com
 (2603:10b6:a03:3a1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 15:07:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 15:07:26 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id BFB18E8F41;
	Tue, 17 Feb 2026 17:07:22 +0200 (EET)
Date: Tue, 17 Feb 2026 17:07:22 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: imx: bx50v3: Configure switch PHY max-speed
Message-ID: <aZSEKsT3f2paG0gx@zeus>
References: <20260217125952.53997-1-ian.ray@gehealthcare.com>
 <20260217125952.53997-2-ian.ray@gehealthcare.com>
 <6dc304c8-2e65-4090-85b2-4b69a5751823@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6dc304c8-2e65-4090-85b2-4b69a5751823@lunn.ch>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|SJ2PR22MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: bc96792a-f5d5-4a5a-4e15-08de6e3642e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGZHaEhtQTFXMVpwdElwbUZldDRFMGYxQmFNRUVta3RKLzdSTWV5TlRyVmZZ?=
 =?utf-8?B?TW4rYW1TRGYwZlk3VW8vUHNXYW9GaS9kd3R3TXBpTnZkTWdHSzc5c0N5T1Mz?=
 =?utf-8?B?ejNtc3U0cGxQTTRNbHQyNjAzUURsRzkxdFdROTR5eGN2emdJcjVQTE9vTUhs?=
 =?utf-8?B?SXIwc3M5K1JnQTBTekwzQWVPSEFQWVJvVTdtTVhzZDNkZmRZWTlqWWtWcCt2?=
 =?utf-8?B?eUZCMnQ0NGNIV24yKzRDcUJKUERXRWJuMWxpNTVVVW1HUHUzS0kxQTY3SXFM?=
 =?utf-8?B?RElpdWtnMmI4UXlSOTI3SVZZZHVMNll4MjIxbTdXRUhKU0dEYndXY1R0UnVn?=
 =?utf-8?B?ZTg4eWdkNUYvS3VQVE9oMldLTmx5M1lqRWVVemJYN01mLzFUTTdrc0hTdS9U?=
 =?utf-8?B?SG5Dcys4d1hjMEtlUEN6akw2N0hmZ1V1SUs0Q2lRNzcyd1NwaXBRNEFkOW56?=
 =?utf-8?B?R2VKTjFsYkFDbVR2VXUwTXRwNlhoZlRNT3IyVVFJcHQ2RTZWWm8yZ2tCYTFj?=
 =?utf-8?B?YnJIQTU2WUQ2ZS81UjZUWCtvWTRYZGVHNGZzWUxUNkgvdFMxaXFmRjVub0lP?=
 =?utf-8?B?dG9PTjk1eG1XUG4rRjVDQlRCY3lpVndLK3h2NW96UlgzK3VxSTJKb21QYzRJ?=
 =?utf-8?B?NWV5TThaOVZQVGNoOTJWVkx0YnBKRklvaE1yVUQ4Nk9Ga29aQmpIajNYOGpY?=
 =?utf-8?B?UmJJU1IxdFhFMGNCV2ptTEFBbWhWK2JKam01OTFLWTVzMXAxb0owZW5Vdkpx?=
 =?utf-8?B?Z1QxbFkwL1piRG1KVkExcEFVai9xU3dxbURJWU1GMVNhbjgrMGxyM3ZPVEpk?=
 =?utf-8?B?Z2VzSE9KMGx5ZXEySTBsQXh4TzlzRWlzVGdHY2lNL01nY3d4MFlWTENGKzQy?=
 =?utf-8?B?dm9tcjlaZENCTkdZbmVDQnc2b3NSRTlwcjNLblE3aGtZN0N6ZjlVeWJBQ0lx?=
 =?utf-8?B?VmpicjZudy9NSEwxbDAyYXZPb3FLQThSaUZUUFlURVZ5Nnh0dS9rZVAzMnIv?=
 =?utf-8?B?U2wwSEdHOHVJK1lXMXJIc1V6NndjWndXOUZTeG9HT25FYjl3dVpUSEtIVlV1?=
 =?utf-8?B?ZFEyTXZHVmZqdmRuME9nRFNDZHFHV0QrRGt3Qm1rNm1CdnlscjczY1JSUGJv?=
 =?utf-8?B?alhUcjZCbHViVzBGejFLaDB0azNocDBUYnZMQ0R6QkJpZUg1ZUVKbGVZaExy?=
 =?utf-8?B?ZHMxZkFhdCtTZEU3a1VkSzduRDVoTkRRQVpKbXFBcG8ybnBIT2UwMlBpR0Yr?=
 =?utf-8?B?UnBmbDhyNVo3OEpCTUc4ZTNNaVhqN2wwSm5FMnQ1SmxNcHR1TjZjaWs3Z29h?=
 =?utf-8?B?OEl3QVRadExIMGFyRjZhVXllNXlaam93RDIyNm1lRm9xa2tsRDJEMGJUZGFN?=
 =?utf-8?B?UTRjT2hIcWNMSlVSZk5vSS9yVHhOVXNWWXpvRXVONW8rVWUrS2RYM3hHeXhJ?=
 =?utf-8?B?d0VoNEVPS3MweVlKTm5UTXdheEdPMEJrTHBnNzZ1ZFdDa0xXcHROcVRRaU9o?=
 =?utf-8?B?SFdNaG9XQ1k2eXJXVlo4dy9QVkIxNmZUTHBDN3V4ZkRwRVRzOGdBbWk1cmM1?=
 =?utf-8?B?aWZud0JuK1h1K0k4b3U4UllhQWRyYXRQbGV2R3cwLzBKSUFLYzhPRTdXemtE?=
 =?utf-8?B?VG9HZkNNMGpPM2U5a0hzMG0vNG9ka05kYXVhRVovN1d5RjF5MTB5eFNrVmhV?=
 =?utf-8?B?SWhxNmpiRk9kV05Eek1vTlV0N1h3Z2tRUFVSR3pFQU9BVjZhWldnWEhrN0Zy?=
 =?utf-8?B?WHgzSERKYW5vQXZ3SktTMFJJb3lvRnZHWUtOdFhHbS8rMEpoVS8vNU5jaTNS?=
 =?utf-8?B?NzFxUXYxQUdZeU1RdzZrZU1uTzI4dEx1WGQrQmtjbXdsUklmZ0hjdXlla3Bl?=
 =?utf-8?B?NzdiN3Jmd1luM1c1QXpkcWlWcTdzZGpubnZNQTVMOElia1BCYjZwejNqVzAw?=
 =?utf-8?B?Vnk0bVU0OHJwUjc1MVdMdzZyNmFIcG1vZ2lXZUcvcWFJMzdibUt6NXc4RGc3?=
 =?utf-8?B?eGlzWExWZFpBSEQ5Y0p3aElxdDNwUGpQYytJM3NPTmFYNjN5V3ROcnM0ZTFF?=
 =?utf-8?B?cE9YbURwV2t0V01ZdkFGcFFxc2UzUVdyT2E5aG10SjV5RDF5K1hLOXM5eVAv?=
 =?utf-8?B?VncyVlk3Y2p5NzhaZW9LcjVUOGtNZlJkNUIzQW5UL05sMGloWHhsUzZZaDBr?=
 =?utf-8?B?N280T1ZiT01qMjRqYmRjc2c4UCttblc0MjZrZ1pvck9zV3k2QWZqRnNkbDh1?=
 =?utf-8?B?Z245V0lyRFBFQ040VFcvSVEvcDFBPT0=?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BXsEeoiIZphhS4Iqgasi5WKjj72D7aNKzAI1cDiuU4lwhYdts3sUOMsdAz1bfnlRG+XQXDy2EPd1/8zXij5Cra7iRGSbPMC8PH3Az82nE6llIVZaX1pWDayWSl9qMMTvaNRvTOzf6NewDqLSMT0AOekI7NptU9EFKM0kNNvgpIEbs57ejWXc7Ybomjb0bzCiJaAxuYNRLK/fteHoq7y1XtHSZiOvkaGZfaUUC2C+pH2nGINuzZaSWzk5Sm6P94OyCf/OnVYbXdnPI6Y2GNO7Fne/iXJnW93DvsBntXrKjL/vp+wEVlw24AJ00WhcvoKp+SfN+Q49PTa7eFVqbCZf8ZZVPbvzCBHARIF80PSR0YiuNToiR2UwSAfgocpWpwRTLZztQ1W/IHHdyeGZDo2K4LHlnVIjH49FR/YSAmXG1hLubu6CFsQQrT12oOqw+ctd
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 15:07:26.0559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc96792a-f5d5-4a5a-4e15-08de6e3642e6
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR22MB5192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_070732_827732_A18A7451 
X-CRM114-Status: GOOD (  13.24  )
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

On Tue, Feb 17, 2026 at 03:53:08PM +0100, Andrew Lunn wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
> 
> On Tue, Feb 17, 2026 at 02:59:48PM +0200, Ian Ray wrote:
> > Configure maximum speed for the switch PHYs according to the electrical
> > connections from PHY to RJ45 connector.
> 
> Are you saying only 2 of the 4 pairs are connected to the RJ45
> connector? And i assume you are using a 1G capable PHY?

That's right.

> 
> > +                                     max-speed = <100>; /* only 100Mbit/s lanes are routed */
> 
> lanes generally refer to SERDES interfaces. For twisted pairs we use
> pairs.

Thanks for the clarification: I will send a V3 in two weeks time.

> 
>         Andrew

