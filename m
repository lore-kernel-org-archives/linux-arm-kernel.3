Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A314C369C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 10:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyWQd9RirQuvWOMoRUPdR5G6DNJV40Tjnu/eR5qttPk=; b=uUX074Qs7tyK9msNXQlw9M5gmo
	i7bXGE66gGG7eKxwsvtX87vTZdkUAV2C9JxgK+Wv6ZNxfE5KhrpTgMalwYX4a8rgLH+3LzhmTmrwP
	ujMcadwJ6tRlKFqeI/sEHo/UIp9hWKGnpfe4ndBRF65yNEOOiVIZOt8GTMgVpt++gMhaBCbx3L7F8
	pfbaZtD+ZpaeYamxH6jKHQh94n+rO1Ta0l9SNynCDRXI5UWVt0PKBBX1EBoOJysw4YSdYQgJuIR/V
	lO1AlICqXXvv0M1nlnDn45kcBqdRdLal56TvSNL0y2ycin799qLe/leWCIUd0jmIXv3fNWXadYooL
	OZHSiKwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u503F-000000099Wg-1UPA;
	Wed, 16 Apr 2025 10:31:29 +0000
Received: from mail-psaapc01on20713.outbound.protection.outlook.com ([2a01:111:f403:200e::713] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4yY4-00000008t1u-3ld1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 08:55:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kt41NwnblJ7mq7WCSLadUHtl+RpBNarIj53cubIovEYxxY3/UAKNK6ENtk2Evv3K9vjRj54mKLU3iHTWpJIE5mLy+e0/VGzbfm58NCLlTV1wQlbj4hXsJ0m6D6Lh9K1+Zp6Q4xqrzJA4F+1U/TGaeLgovC0kkIsPhGaI1PErEuuzJ7tOGsGugaBTJIVtbf+wexdijUM7GpZkOClmGNKTBqyMYdraJD/ON4O9WIO/cnZGioK9Nt77hrCqMFzdBH99nA9Z65MGwF2x2xdQi67N+uFXLqIQAtoztTVzRXKHzvS3VWCJ90aBm97A7T89FyaLtMxesrX1vkIpJAJML4HkUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zyWQd9RirQuvWOMoRUPdR5G6DNJV40Tjnu/eR5qttPk=;
 b=LsKQtXVK5XIXBg6I/8Q0BQmn5abPnY0c/yf5NaCxPBLbGstzK2hYJnoEo++e9murRsqq84uTbKTNjEV/alyXHklgENcclQXZo0oc51qBwPoT5xtdjZkoy9Q/uPCSFPR75RyxwHEzt8a+L1PTOHwe1Tu/FmP0QwYfRcvX/ZfVezEKP6u3uartoyq89Yc7A3485zwYgvXNhqwz4MynpFNSEWcFZAUb+ghHqBBscYuGYP+aBUuIe38TLk04sV53D50274aScLpJdHod3ya/DW+2EgGRc+ZYHWjLh6uSAoO6cha0o6vDf3Y/UJUp3+T8BKcH6OzSCfC4YWS+/nInNOjXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from KL1PR0401CA0030.apcprd04.prod.outlook.com (2603:1096:820:e::17)
 by KL1PR06MB7010.apcprd06.prod.outlook.com (2603:1096:820:11e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 08:55:06 +0000
Received: from HK2PEPF00006FB1.apcprd02.prod.outlook.com
 (2603:1096:820:e:cafe::20) by KL1PR0401CA0030.outlook.office365.com
 (2603:1096:820:e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Wed,
 16 Apr 2025 08:55:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 HK2PEPF00006FB1.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 08:55:05 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0631E40A5A01;
	Wed, 16 Apr 2025 16:55:05 +0800 (CST)
Date: Wed, 16 Apr 2025 16:55:03 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, jassisinghbrar@gmail.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	maz@kernel.org, kajetan.puchalski@arm.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v6 08/10] dt-bindings: clock: cix: Add CIX sky1 scmi
 clock id
Message-ID: <Z_9wZ74-cqqVTPD7@nchen-desktop>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-9-peter.chen@cixtech.com>
 <bdfe0108-7ac3-4f2c-b7f2-97943ee85235@kernel.org>
 <2f05420b-0c6f-4336-9854-036edf8d28fa@kernel.org>
 <Z_9pvs-YKLwFal90@nchen-desktop>
 <99e3b06a-f612-4f22-ae5f-43a3d618b06d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99e3b06a-f612-4f22-ae5f-43a3d618b06d@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB1:EE_|KL1PR06MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f056cc-ea34-49d6-9ffe-08dd7cc46255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GFkFxYO5hFlrGNrA3GHd+Z+wrF4qhTicyGF3YuEAvF4pM6MWHfd9iOH9ajQf?=
 =?us-ascii?Q?GE/zLDpHm6JtnCGAG2wpotSH3xfEKjmJKGT2xPQLzlVbQvrF8WS/Poh03WLw?=
 =?us-ascii?Q?w2OU5gMeZIgwwE4l6lGQzCQ3fPJ2/xHpN4s5zFV6N6rHvgMhJ+oq4TeydlQq?=
 =?us-ascii?Q?Qf12wrVWB2TpaK5/NjPSJvMwepyC34JS02MgT2sD0LLEQ7EADI9dwmbllGnV?=
 =?us-ascii?Q?DwMuaUZ21+04JEi+7LcXS3PZlN+t+IW51vJyun9PUIo5rJNsjLXqFxXZCD4H?=
 =?us-ascii?Q?WioTErNjBnHfslrCZB7NPbJ6KZsMPGyxBG4C5EZrwwtjDlmptjAWZfupdjte?=
 =?us-ascii?Q?CKNucWAgBCM6boFvSWJrP8jApe/ZaPnQiBqG8Ckg8mNIYOuRfKqPKQ55b0gf?=
 =?us-ascii?Q?vlG3ZY0Umj8vZq7aewOkJTZZ88V9JTcluvY0S1QVuJekMfzdqe9L8udLbSG7?=
 =?us-ascii?Q?BOanpA9H0CyKn3G/ZwAK28B6Jo03gyY5G9sW0gaC2svQd2liE3deFFx3C7BO?=
 =?us-ascii?Q?F3I4EZ+swU3+yqPcZ9LPEL23cWz2z1xdJD9NB+uDIHmsuqWgc6VuWWacqFua?=
 =?us-ascii?Q?TTTRzab9I3zjYqvoItT9HB8nanJxIkBTVJeFtnt4LmA0B3GMhse5tgxJJohR?=
 =?us-ascii?Q?nyQFdDA174BEz9rVGthy7VAmfAp8MrnIB2ilZ8YfvOsaFCiqmLVsNGKGvRan?=
 =?us-ascii?Q?wS1zF8ZIwHITBupL+z4l69oNcS2VzVL0P6ECa1QSJkyqhKQ+PYk1guuOwobv?=
 =?us-ascii?Q?TNwIPAT17DoV6cvz0nmU1OimODihgB5MDAJXXDFnbARQhIhi0plmK5ZNXgJV?=
 =?us-ascii?Q?9iD6pVJcj/pkJmIgEzb6WtZsEvfhTBaeQxB2woQ5S4HNgIpW3xNtmtq1/gzP?=
 =?us-ascii?Q?E5MF1htaqkRpJlN/tovgaZ0iO+yy7MWBtL5hoOw4OTp2vPgmu9MMm3WCLOMW?=
 =?us-ascii?Q?QAfCw/vbtAroY3+64GYngaUKmQFikgdjr6V1UK5eObk8YsbDkdKiw3b4GrdJ?=
 =?us-ascii?Q?BmKI2qR7oQq0NQGJUB7wHGx3aBecgwTt/eC0bjKCUT+VHrDacaQaOBYAxt2N?=
 =?us-ascii?Q?MRZcmcBX0Tkp+F3ptXutz+T3g1jBRxMYD4W3Xb9tVnJZu/RTlg5I3fvKg9nD?=
 =?us-ascii?Q?Rz1Y/sjMz75RoLp1ZmAO3J2rz8RaZnsfCZW58KzXvM1DYSUr0UKBngzXYy1M?=
 =?us-ascii?Q?iP9JzfOfIEavX2dd1VdkEyiqfqC7rr+RdlrNGVtZcPFYBqEes518xoC2vyfP?=
 =?us-ascii?Q?wNEafNG1Pdojvw7Irs5SyYhdCJTpAiAS9FyXSINeBCJt+ayYpBrFFaCU+ONQ?=
 =?us-ascii?Q?oBmCw0iDglAH+mLpS2iVV1B70f8ruAE6kE02V+b7H9m1qeSgMO3Yc1Rs9uMp?=
 =?us-ascii?Q?IQ4/UrFhxgwbnJRp5Kt0GdsgMNHCaAxwmYTo0K2/5lVcZT7p/oAArXLG3rAt?=
 =?us-ascii?Q?9Qw/vz0nCL2fpFY46pDquxkDE3HPIFKCx2HnU8c7gwmtr0HAXpf4wCZR6A9S?=
 =?us-ascii?Q?fNdyeflAsDAUJJdKKRdbvunYtD4IjyBijndY?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 08:55:05.9191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f056cc-ea34-49d6-9ffe-08dd7cc46255
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2PEPF00006FB1.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_015512_964719_75A897CA 
X-CRM114-Status: GOOD (  11.35  )
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

On 25-04-16 10:29:45, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On 16/04/2025 10:26, Peter Chen wrote:
> > On 25-04-16 08:38:55, Krzysztof Kozlowski wrote:
> >> EXTERNAL EMAIL
> >>
> >> On 16/04/2025 08:35, Krzysztof Kozlowski wrote:
> >>> On 15/04/2025 09:27, Peter Chen wrote:
> >>>> From: Gary Yang <gary.yang@cixtech.com>
> >>>>
> >>>> Add device tree bindings for the scmi clock id on
> >>>> Cix sky1 platform.
> >>>>
> >>>> Reviewed-by: Peter Chen <peter.chen@cixtech.com>
> >>>> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> >>>
> >>> Incomplete SoB chain.
> >
> > Sorry? What do you mean?
> 
> Your SoB is missing. Please read DCO part and actually everything around
> authorship in submitting patches.
> 

Thanks, will add my SoB at the Tag list.

-- 

Best regards,
Peter

