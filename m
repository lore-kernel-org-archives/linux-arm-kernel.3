Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767D7D2FEC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 17:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOg4uXo8prp29PDNc7kwzE0Mq/UIgeNp1t5PiFVRdoQ=; b=jIB95mwwO7Nzl0rxZu7twjyFEU
	3kncrUb7qXnZ68065+NOli1qAXevW9bUWQJC6XX1yvaM8exnwSmvvvH++f9RfQMqXN07sVWuD09SM
	WJB+DlZJcVEGWTFmfeAnFMMdILQ8GACKbSui7NRBgQUC3ajjfBGPxv0ypTDlxMF9/MiWl1oWpc3PU
	ryKdTodXuP31k7FFEjdAudEzMk0b/pSFtpbLR0qe2ED0DqzQpdaCWwSqO0lyj6g3zy4bYX5rNKX7z
	uG0zohbEoDs4FLGMUu+6q0QJjfXIno2bR1ANmUpA+zI7zhgmoAQ5Wm91OPBTPEesx0t56X0SKuTtJ
	42vre2lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknKY-0000000ElIl-3XdG;
	Tue, 27 Jan 2026 17:58:22 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vknKV-0000000ElIG-0c7F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 17:58:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNIpbAIS2NXo0uJ3aV6yPndQZL9OFWSqBR1xXQyDauwAaWnSTWRlF21zAPlgPj3UaQzvGiYtfrB7ve7s5qIyA9p6uU4oKuh0dkeVldm4939gdBPax051R6rFzwagU88fN2efJ+M6cLZNTFLBXA/SBUzG7uQ96X574Gy1RdkjIXnJM2Np0jfPEIIbWIzBuS/QtCbCVdZptdLx2pe1Hd19DXZdqMjehkPOZprBpoaXzog2P4ufQiIvX7awRlPFDmjqi6+2IC8FKVUfDGnYKrYsfbSbLfQtoPuRMv7C7+65m3Tyn95ola7FTjFJcbdTMiC/PCajmNsK0N4CceWsferlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOg4uXo8prp29PDNc7kwzE0Mq/UIgeNp1t5PiFVRdoQ=;
 b=Vu0mdVgejUrXDfCO7nFchcx0WtaVw9+7rQU4WaVTU3B6plaSWjpUM+Y0p2HKkUjnCTesf4wfQX/pdtYrR7x7IpBvdGWJn2zSXe9qVPS7lnsa9tuNmbBa3o9Otxte0EcJYOEeMQqOXh9vIwpqlwkAPcfZv7VdDh4QusxJsGRDL44zk/Za+ECmGSiDhaOt7u5Pbuz1vM5sKcVwM02kZ0gFBv2COdjAK1TQfCXg4WRTafru4H/RXERaCfoVPfrt4op/LzHbgzBnscYV1DcSPXFuwUcCcfwpsYjQ1JGZlimif7/p9O9WJKhe5JiYfM/XupXHnpZCrwMd/jQhS3QQg3muKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOg4uXo8prp29PDNc7kwzE0Mq/UIgeNp1t5PiFVRdoQ=;
 b=kXVmObNb5jMZSjpFvffwl+1zuXSIQolx2tOcYysGBXSh3/KPUCRSM3YEbVFgLcbBZuPYMpLIgtBDjP12E17sqPi79HB02aTALFbgXzTcMf6QENcLRxjsbQbrijFyzfFhNAY4uCmvysFzEIJaMof1Mpj6R3Nl/WLO7q6bq/N/YaFgvy5PVWKpApr0ZznXAH2wo2XVykIkVX+BELnCr7x2ro4edio4/rAoeqcNZd5RiZeNucaBcoz3Bj07Fzm39tQ7yEZ6tDmvOoa8h7mbzyRYhomaXPfeFczNcqZ1J0F+t2k2b92+TFGMnHm5JsfKrzY03XLe6omsYZRxQEj5zMmyPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by MN2PR12MB4237.namprd12.prod.outlook.com (2603:10b6:208:1d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 17:58:14 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 17:58:14 +0000
Date: Tue, 27 Jan 2026 13:58:13 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jpb@kernel.org,
	praan@google.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v2 06/10] iommu/arm-smmu-v3: Allocate vmid in
 arm_vsmmu_init
Message-ID: <20260127175813.GN1134360@nvidia.com>
References: <cover.1769044718.git.nicolinc@nvidia.com>
 <3f7c5b84c4f8605688ac08fc2ea2dab08a3c5c0c.1769044718.git.nicolinc@nvidia.com>
 <20260126211636.GB1134360@nvidia.com>
 <aXgrsJeXB3bpFQqK@Asurada-Nvidia>
 <20260127151138.GI1134360@nvidia.com>
 <aXjxss9H3NQ/qe+m@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXjxss9H3NQ/qe+m@Asurada-Nvidia>
X-ClientProxiedBy: MN0PR04CA0022.namprd04.prod.outlook.com
 (2603:10b6:208:52d::21) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|MN2PR12MB4237:EE_
X-MS-Office365-Filtering-Correlation-Id: 841fcbb9-cbcc-4674-9ef8-08de5dcda43c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Iro8eeusLQ/kthDLwhg9tiwY4uQbvA39R0TqskVqJAHbtldgi7m+MWgkF422?=
 =?us-ascii?Q?m1WbCCzZLoZqilBjraoogcn3UQJpDra8RjoCNmp3muCXrgjPvWF42LlQHIbg?=
 =?us-ascii?Q?FUtBm2Qlvwgmdot9NsxbgNjPz306czg7QjjlQkoeAWhov1LUmlTcKscT3z9Q?=
 =?us-ascii?Q?cnkG179P9MLrr5yH1zdOqlykNvXoKgwdnZUM2hibyc7ibFXC5pwSWGhKfNa9?=
 =?us-ascii?Q?UWXLTer5f69iLlP66xFxdkcStxPVegOoMAJoKouU8KHZdyjCV9nvNzJSf/96?=
 =?us-ascii?Q?z279tVj+SimDRWXecGfxdlVL96sXsBGH0Hc/akpRE6TlwURVe4c9UePqktU9?=
 =?us-ascii?Q?pcu1f7g4ceCacrZ6OkFg2sB9Y/WFY6TXX1N0r3VM1wqI/qg2q+HU+4nJ/smf?=
 =?us-ascii?Q?+sGybm1aHUnZ3GfN+xQEqyKfkCyaWtMKyAvUaqLvDerp0u+THiToxYOfAcqF?=
 =?us-ascii?Q?5JCUmoo6mXvVxpXbeI9/Ok78nPyHHxqUKuLWrFodOdbGj5HJow7CVay5TBG/?=
 =?us-ascii?Q?LHAt/xVGtcVP3I4ucuf66+xKCIkdEOiDxr8ARC6u+NbOr0rLqCvGRa1Aqo/o?=
 =?us-ascii?Q?Ty0l59wSc4JVmBs4dEpeKypz4mQKeLbKc2tpOtVToe7aMI6ZCURKimj3cd0X?=
 =?us-ascii?Q?pTbGGtMcF7aBAj5Axhnb20j8AHVfTJ3JPx+X+S8XyTYaSNuYoAqU3EmKaMeb?=
 =?us-ascii?Q?PaZim4ZwiJ85rXFZMdok9Slya0FWA68/xQrKeJBuYSM0EH2tPXLTt0PppmJx?=
 =?us-ascii?Q?zorXzO2x+5po++LM1UvFUVHaJsUZXBdXzf7OL16L8loyGDQYDOcFjyj3uD+b?=
 =?us-ascii?Q?3QGFnynFtAVJeCeJpVCw9vmC1N2YtK+QiJFUXU64mNlCrN83KStlSKm4MAoF?=
 =?us-ascii?Q?EbXBc9GWesRaTiUAh8MZCnhBCwP9Gb22L9AtlQKNi1Yx9o83r/pPCmMimG8I?=
 =?us-ascii?Q?Udwq1zO3ZWW4+4zoWI3hLSFZlGoDOf1fUayMRqOed6xNOYo22eydqBhXW1qC?=
 =?us-ascii?Q?5X/CDFOpui7GjMfnb40qHgFsgcC81Qq47kGi7Ug2XGwMMR3TpzyDlyAhDd5R?=
 =?us-ascii?Q?S4JG+X4ZOhL/oJDOeoJwJMsKyUlxpmeyThp8QPmlvZjfEWhWeOHaaBynVyX/?=
 =?us-ascii?Q?uGlstrle2P7uh0LW/zsLrX3yKLjHcm28U5fUoASEsJ1PzNqV3IxHtln4xqkm?=
 =?us-ascii?Q?E8c1PIYvZYDs27dJ2/tH+pDqNaqTapY+ckhPEETVh6WQi+g6TBy7LvHJkwCm?=
 =?us-ascii?Q?XvwDgioya369pYr5wQO7g2DDDNcxoiUN0S6eJCFbunn7Yf88ffMV4SDklDFH?=
 =?us-ascii?Q?JOfQyqenfD+CXKjVrAGTKafsPgyilTNCJeu43npwRRNblo7R+6n8ajiNNZI4?=
 =?us-ascii?Q?OfOSSWaWd3HtzNHdy0C6/WkJBmUIS3kZ5KwnXSOyjob5deGr9UF/Gnjj2nB7?=
 =?us-ascii?Q?HmRvABBuImq6Ffhp6/gpySQe/EsfaQxH96cBAqMHv5elxl/ObXFlTfGxojdj?=
 =?us-ascii?Q?SfNXvhBe0Gd0jkxllg7HGjOYv3Fc/Biyp235iYWvuKL1BgJR1chFrWwRpFmU?=
 =?us-ascii?Q?rnHu89oHT5CakT4Ssms=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2f7IYNDB1HY36cPRQoLGeh7lYtKWsm/zWrsVLWMhplkqzCUH9syQnjhqYjMI?=
 =?us-ascii?Q?b3mcJfszPwnTLO78NOjUkCwKSep+Me505OP1sIDf9J4+JNfQUgOpC27PEx8Y?=
 =?us-ascii?Q?UWM0iKBzfVJZfi5i+ZUK6r29/Iz28ekH6N16etzmC6Twy9x8POhYx8DwkhPW?=
 =?us-ascii?Q?uetMMNOWXgKQ5jqB6yGcn38jOplXJxD7C4JZqucyqNq+M0IXR3JRqnCBAX3L?=
 =?us-ascii?Q?Gh/iMN1YpWlMxo8mWS2WZEaoch8jIuEhhG/Jw7UtdQ9Nni2km6MKh7JabdI0?=
 =?us-ascii?Q?nheErfvkt0gpd0f4+Zf1fVajlbqar+daegxkc4scH7Hw8Z9NDE/Le8WTlbRM?=
 =?us-ascii?Q?/tYext0ssBvkyY1cFbBtBNkOlqEgNwXeADjg+8HHPTV0yi5HMs+KYbv83ulI?=
 =?us-ascii?Q?scPJvKa7q2wyhMIbNT5iIG1IVKyxbqACe2SmQZB8ENFfCiFNh+T0IkGWeSDp?=
 =?us-ascii?Q?YBBRih7A32wIqq6Bl6rIPv/vHT8z6IJH6fTWcfUKciguxsWUnj6hgeCUxc1O?=
 =?us-ascii?Q?ByWbQK4dx1D1n6UfzQySsp9kxFMH+YOwanQ8YncusX/PicU0+N0MX1Ds2O3W?=
 =?us-ascii?Q?SqolsjbvKJSnMqjhiDbNRBgdaJrwUReGKt7V3L/PkGGeQp6J6Y7Jw1Fpokra?=
 =?us-ascii?Q?qaAL/gWU6hEJdIzD3nNU2MW+A5YGb6ue7gWZmkI18ZHQUVuTNOTF3xMkHHB4?=
 =?us-ascii?Q?L37P2wYnxxcYpzMR98XKDz4ITVcDXxY4wCErHVvtGiFWwvKLTBPFN2zym5Y6?=
 =?us-ascii?Q?4w+xnQEh5pmMUCbUd7JeawfY+e+QZZg6bjaBJNNWdzJ+9NkP/n8t56xB6nwe?=
 =?us-ascii?Q?3XGoTGzb8Nb85CUsrskxiZnNBCyyqkhQ8EnuYNqfNTFLpX6/SUcosfSRXRqA?=
 =?us-ascii?Q?KLQe29yHZLVBI4Asdjit5SHwn+jcA+PT0bpAHUP5g/1i1QXPaOObZ/qnJbNf?=
 =?us-ascii?Q?1Q+EhVl6Z7KS1G5CtXjGDbFM7ja3M1UepZ8STeONNxVyk2ywonnMj4wu8MQO?=
 =?us-ascii?Q?Qh/9bZmmRZ06FVlZU1Jtd8p5hb3A0a3WxTF1ISMvyAL+3al5PHvBqFjYrQsM?=
 =?us-ascii?Q?jtU8OHIi/yg2j4zI8IF9ATViOPGKClYwFZa2o3hIOK053lHWi5Yyg8PqIyI7?=
 =?us-ascii?Q?LWvbNfzDzcb1ZslU/zN2AAhN0Nhpbu9EYop4BLi2jzSfq+h5Hey+WSaOqtGc?=
 =?us-ascii?Q?xno2b/qmqqNkCJfk1ptDdZng0kmJl0782xR5gXcFkxLfx9ydWdqOS025tRsN?=
 =?us-ascii?Q?FP1VxwWQlwcp2cEUGK1eGGXhuejW/qt2KCdu3l1SbD+g3enzyJzIrc8RqE8i?=
 =?us-ascii?Q?33JZ/QHN8ugWs2N2KV52CVomcPJMSeTln2lO0fKaSWOpIdsffUAZFDZZI83t?=
 =?us-ascii?Q?EUSX7v7UjP+7iJL8SNAdEJ5KNlhlY+VjqofvmxHaUuAr0xA+9rRQ2N4WOQoK?=
 =?us-ascii?Q?Dyzmfw6IY170yUD9UxNorOm67FEy8XRVD0RaWj2CO0pyGqX8WCJIYLiTKk5Z?=
 =?us-ascii?Q?7WGxNVvoavaTOCubNWYNyriJAidJIr+QCJiXM4eCxjx2tG4A0PwxtATavyb9?=
 =?us-ascii?Q?W6R73MhTya+hoYnbcngjTgmZHVBJg2Q1GHEBp2e4j+aL5YGjtaxlkoHOn0ix?=
 =?us-ascii?Q?lSqOTAf5tmVG/0uf1k1WT2PTzEdcd7JGj/xRosHFIdUVmTMKtqedm0HxpD4V?=
 =?us-ascii?Q?ttj+RbRe1y2eaXy35MyeREamU7SYJipxBJvkzFKG/RgxtUQxSAl+IFfTP5UX?=
 =?us-ascii?Q?gsZP8C2N5A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 841fcbb9-cbcc-4674-9ef8-08de5dcda43c
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 17:58:13.9938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qkDVnGZWVoRUWvfnPuEYQ55Ms8c1EgTXAr60cPbjwntavH9JItggO7puoGMmtKJE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4237
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_095819_466543_6A262FCE 
X-CRM114-Status: GOOD (  12.46  )
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

On Tue, Jan 27, 2026 at 09:11:14AM -0800, Nicolin Chen wrote:
> > It is easy to understand that lifecycle by just allocating it for the
> > lifetime of the VSMMU..
> 
> Yea, it makes sense for that matter.
> 
> So, perhaps:
> 
> VMID owned by a vSMMU should be allocated in the viommu_init callback for
>  - a straightforward lifecycle for a VMID used by a vSMMU
>  - HW like tegra241-cmdqv needs to setup VINTF with the VMID

Yeah, the cmdqv should take the VMID from the vSMMU and that is a good
reason to pre-allocate it since it won't go through the invalidation
list.

Jason

