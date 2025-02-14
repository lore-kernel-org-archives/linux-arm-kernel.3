Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D61C021AE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oo5uiSNwbdGkWtSeH6BGbauFrN7i++VkqJLY5WtF2bY=; b=pESoZVCfr2l8dzjAgeQRfX9yei
	+3nX9BBjtaj6G0AdYSwYEYhPNCYq4UqblDg+yg7Zhkh6P5LB2ORAetIqR3/V13jNkKanzDbYL/gX8
	WWAW5WSBtrUF3QvKjzmzfbEkbsbF9ntzKK1s0yN1QNUwTHJVjxMPVF/q/AY90D2UpwtyEv0U3snZj
	bIXcxN1Hn/Td8WlSTkDvxFjMtfqeCOVrdYJYFQg6Y7IjOGmZg0mprq3FtuNNK4oqaMNEN69iqpFsy
	AfcivnoFntWKJpdDYYnreA91CDdetUCPo9N6ThujAiK2g3erfMO9DxTT/sTyfv7D6tqnZ6Tpg6mzG
	bqMt57xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0cx-0000000FuV1-1Ral;
	Fri, 14 Feb 2025 18:41:27 +0000
Received: from mail-mw2nam12on20600.outbound.protection.outlook.com ([2a01:111:f403:200a::600] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizAo-0000000Fcpb-0TNU;
	Fri, 14 Feb 2025 17:08:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mb0taHf2JPGAjB0Ikn9dHlEf/D6y6S2tTffcxwX8ns+Uja1XNJxmG9zbG3L17NQetmc+VGrorszSI4bDYt+HBkA3pmaFEhfFivvBRfqCxgwaBwwtEEp4JcK6/WIZOQMzjazSmsM77jvxD5znGQGyVLbFqNWfi3ipb+iFZhKFkDSuXrMMyDTQlQEUZ0ZzbAPdFVYtOUwNO0wv1UVgOXAC4c+npEDN5OQnTsrfF8KNAvUhX/ovwgcuM03iqBWH5CxNMpWHDwQdH8xUWJxYzrB+PU4x6QTLIkZelxFYBBXaJcY7E+GvFrewpWyolAUJgUNGmPmEVbkewyq0fG9cpMP2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oo5uiSNwbdGkWtSeH6BGbauFrN7i++VkqJLY5WtF2bY=;
 b=Zv66uLgSQSQG+ttW21eaIABl4TVsbcfJPxqBEdFZvNeMssGQYHdnsaoRmgCqzpJQtUpGnknPpuABSv4MlEAmZMJjgUQqa0Mn741III+NrUeTb3CD7TJeNvhCR+8AeP0zjP/XHQcby8K6YybMhzCi0p+PYEc9PVRQfmkDCq5DbIAYP2m6PbkRYMNCTTf95KhvwD6afg2JJ19MCzOnzlJQ6Mw04zV6V17u9yVFRdD7xvC18BUhoFREqmBYVBC69fiTC+x1LDSoNZN1T2yEOdrUTUeuzh57yUpUxXG63BjOYeu+qPDqgFB1Nol9QcL4s8tIKpyxL6aenmZ758N6TUHY+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oo5uiSNwbdGkWtSeH6BGbauFrN7i++VkqJLY5WtF2bY=;
 b=TRY15sjJCejhmJCHF98m4DrctTcnju809esZKR0Lq4T32/YoG9lxG02F/4lrUUAiTx0kfj0/AF38APtSuphkgHlwwBBP4O2SqUrxkmEl909m6Hm1zLxDMDTdqUNeVSETBOJTHJ2OKRQEMNVB8zKtonVvEc+D0NJI0gSQIepSd99sRxAmg5qU7gS5atjV3FIh/pw8RNVRMxZZEG2ChYQmoANBeJCANHpl971As6jbIbNrCFlrrZn1a4A61EE5HR8lnQDnB5Pr33NReOGdgsZgfJoW/d8JluIjla0C1AkVr+1QY7Iq83WCxdQawwq359FjcaBrgbDm05Q1h7uIp92NJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Fri, 14 Feb
 2025 17:08:09 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 17:08:09 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>,
	asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2 13/23] iommu/pages: Remove iommu_put_pages_list_old and the _Generic
Date: Fri, 14 Feb 2025 13:07:46 -0400
Message-ID: <13-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
In-Reply-To: <0-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0007.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::20) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fc3e655-f754-4b1d-4281-08dd4d1a2262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cUMRFJ86s8HnzOYGRIfhT0qAvkCB24/GYKLfN70rgkEK1ktkVKewBm2rLgyZ?=
 =?us-ascii?Q?kig9QefF64kleYo2Dhbk1xh4nu59DlK6tUH8p/7Vesoav9qRMutAqkLhtK0U?=
 =?us-ascii?Q?21t87GFh8t9g2IsL3vLGByyS55NrQqTdTgxWp6v1HtQZ1eIqD+T7hUk/6DOc?=
 =?us-ascii?Q?3TTuMhGnzZhByq3j1YVbBOCgOmwr/Ht1BuOMMETnpe4khfD0OBH3nakMX+Hy?=
 =?us-ascii?Q?RTequFo9EDNavfTp7wAJHGbjyzpVFHo7tnkB+srTfciU4lTDNodjh948MPDe?=
 =?us-ascii?Q?Ze+hoBNc6N2cKGaR9tCl6vB/ZJUhbTqBEUlANdP5Gz4joYuDzzpTxLsV4zWL?=
 =?us-ascii?Q?gaefUl45QllqV3VCFaffpcoQLJgnPvqJ0dCL78yyPlaWabIn1x501GpSbubg?=
 =?us-ascii?Q?AsnMWtbsXHpyzuxUGCKOHHS+tXpm9mbX56yoOUUfzdLr0D09cSZhZW5Hhl3y?=
 =?us-ascii?Q?i7HyDBrumUF4Fg9HDz3XJhR4zNthSvpFZLbhTpdTqZAuaU0vjtG/RsIW3U82?=
 =?us-ascii?Q?Xbq5AbJyLGRwkmMsmg+UBSx5Jp0dxmMijbL9xbLiFMABvXOTr5hyghOGix8O?=
 =?us-ascii?Q?sqvKUp8RAd/EoeN+kaImf3KkkkxSR/RjL/06QBJtpJD3/+maYKbQZth6WG/A?=
 =?us-ascii?Q?4ST3y9eAumjcR01mNA1uCTf8y1busl0hQTQZ1210yMU6+UXPKkWdxpm432a0?=
 =?us-ascii?Q?e4BinYrqFKbvsFJ4o6u8HNmyzqaNX+CwfsdSLA97ej0dn0DIzWKMIU+5QwMe?=
 =?us-ascii?Q?91HN5dMtAVn42KAgXBw9a2UfxU29nhd982T3RmnmNOChSUsHMhX2fFrhTQ2c?=
 =?us-ascii?Q?QS6/37/LvpUcSFCgRQ4QlPIanZc5dKuIV4oQ9bTy9J5kMN39mfknjdRMyvFM?=
 =?us-ascii?Q?wmvJ40BUz20nJtCNgnmsADoIZC6Q5ABFFhPvaAZmh37vXiq8OuPpirqlIcJO?=
 =?us-ascii?Q?2BgqBv6We1gn5t4fvOZD1N5mYNuA9oAuN4v1KZGgVqZTMQBttLcdQ0olTp2h?=
 =?us-ascii?Q?eegcTBVUa/w6ONCO0J45w11BAu7Y7hF6X1P6ORRISwZNPxXCgTtmyvMBbQof?=
 =?us-ascii?Q?Nq4vHc0CnSBQKe/BUhFGeukygULcnrdhkDSdLkN40SM46DWNuK+/zMg8Nn9T?=
 =?us-ascii?Q?mQ64c7Y//iX+p/yLqGqt/wQaCxtGxJ8vCThgZB8eyRQIHmtVZtBrXc3E/H8d?=
 =?us-ascii?Q?XJdp8laqAtVjn1DqSz4Igc+2pkcGdz6LMfPmaXnPXtZ3ifC7uWu1KmKuCrHa?=
 =?us-ascii?Q?ciLRefGiiTm7uBZXpKYr+dO8PnVK9y1QOlnufXpW/IwIlKTYGjMa0J6G6Q8W?=
 =?us-ascii?Q?CMBIDrqthk5RV1LayMY45Lg3czBIGehD03JQYvMHXlGEEy/LZko57vQVkRWF?=
 =?us-ascii?Q?hYskaYi26KydtdH+9BX1A8m0qTr2+TkQIEarn/IRmrWQ0RgHE9rCzOZyMVMf?=
 =?us-ascii?Q?RlJ4/EAX4SI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F4cFwcVnQbuIljKdTL0LQLTVnxDLvMWzs2Y7gn+74/JnLqzXJqfDc4TX5l/T?=
 =?us-ascii?Q?zV5vS6IvWCbMjJMLf9Bj0L7ChQlx3s9ZsCzlpbEZyK+uUPNR8e7rdK4I2SVN?=
 =?us-ascii?Q?tr+srpclBZT3iR0AdQRsC5imiDPSrzUT5kncmoT9+JJ/zkWGkS6RJIXWbjhN?=
 =?us-ascii?Q?f2PnyqAB+LGEvXrYrai7WZ7mGW1T2ShuOF/pHUUVqVYdtEF1CAZ0YdoWd+rn?=
 =?us-ascii?Q?AG+rSkcCLImnU62m1oGzNWdOZYvo+IwhwnKOTWwzuBezoStW4EWvcCv2f5Yx?=
 =?us-ascii?Q?X5XujK1AgZp3QtY7WPQmV6+Up0Jfwceh+NJ4wrjZZBrJOLsrCYQeWZ6P0gYY?=
 =?us-ascii?Q?dDaxb7VGlIWRA6xpm4v8d4okrqwkOw5ET2ey1QVuG8GYG7cCeFM6ttFT8OGV?=
 =?us-ascii?Q?anvbO86s9TUb05eNsFeW3iLfswC27WhSle4XJ2AEkoWwYxLlJgiufs63VB+U?=
 =?us-ascii?Q?WCJB9TPkUn6uBGJ/XLOLSgv6oBdxM8l/O2eQ8iRjDYSPsb1MI35xBsHdxyhd?=
 =?us-ascii?Q?Xqb6M7PUwdPo2OWcYJSuwsq7qQb49Uf/PNSzoCy+ATLqze9FWb25i24Pnxn4?=
 =?us-ascii?Q?eXSJzdbJUmpxHqkK1qqypRIx3oHiojlXp74Bxmn8gxR5GJbM5GMJ8XOOY3Yy?=
 =?us-ascii?Q?ZYmS9DQwILilW8RuaiE9jJaWNc0F4hQtJba0opoypjHzUPNJVXIMYoxyB4Ng?=
 =?us-ascii?Q?y8uvH+6NCvUbNWjeHxOhCfbWR8rRaj/B4DXRu+l92/ISrMHm90RaRVk/wBDu?=
 =?us-ascii?Q?xRULtO1DyO0Go13wFZ4wy9xPp5k5NN3AEGx9CmDtkHp+GGoptvNOW27nG9cX?=
 =?us-ascii?Q?LiNdCpNzrs4H5sxjvCu7GlHxjiFArmB3G51DYfJ/2DzUMtLOgBJVX0m6/zBh?=
 =?us-ascii?Q?D85s/8y8mCubRRtU9+5QZ1OA+fmDX10SXLvO3pEWlCEGSlJCNGR1Y9y6syWj?=
 =?us-ascii?Q?lWD+u8InGzkk/NLJ4DdOWR4XpptijugIkVZyImao0K+I/MLI7YnYE98Lb6xC?=
 =?us-ascii?Q?RHklAiLRyCERYZQydEzlrCl2IpCMbCMQIYfH2vtfGYAzmDEA1DTi7AxcUNZY?=
 =?us-ascii?Q?tjQDBIswDnAtkv2Et2VYxCtSzuYTEv7F9IXAQ9ctqLQE0VeXYVC4lBbGRY5m?=
 =?us-ascii?Q?Z71AI+q33vsOGBsWTGYX5uBdUpYcPARLUQkAl5whHLyn4zUGoE47+l161p37?=
 =?us-ascii?Q?rKRfkZLsDvRJcciAuRnCX3oQQLEJKgm+UaYQcs0Lt2pgR9w/Ys+hLfJFNrjX?=
 =?us-ascii?Q?MWXJx3BU+/a3CQJ43jDDavhEfHr5Qfaiqf51ZaTPDgguVFGQA/D3QHiJhvpP?=
 =?us-ascii?Q?ibyhEdM+d4hX5ChPWY3UK2IqD6GMdpe+whmC39iNPrXdRpxStgFO6erngRxf?=
 =?us-ascii?Q?US0/UCiV8jLnOCY3uappR7KaAYeUwo8sOQ9OOU4BmnEdubtgkG0qTdb9oNKJ?=
 =?us-ascii?Q?3OO3KsplpAobKjMHIqBcB/yby1MdLBAKYz1QzH1/ToK+oNugi1tpYXVcY3SQ?=
 =?us-ascii?Q?URi744+fEpkUHVa06VINa4BEMTs26aS9SQ1yM1YhtzheiLrnel0cJM6tVR/W?=
 =?us-ascii?Q?FelYOcA5QxsXy89IvFs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc3e655-f754-4b1d-4281-08dd4d1a2262
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 17:08:00.0956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40GJqkYpEliXGLQyRi28qjWcfJNgWZt98ES0fIV7ZavCEWFXRqTIPfK1bkEldwo1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_090818_165801_440A790A 
X-CRM114-Status: UNSURE (   9.40  )
X-CRM114-Notice: Please train this message.
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

Nothing uses the old list_head path now, remove it.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu-pages.c | 15 +++------------
 drivers/iommu/iommu-pages.h |  8 +-------
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/iommu-pages.c b/drivers/iommu/iommu-pages.c
index 1739df8c8b304a..03d35c01597cea 100644
--- a/drivers/iommu/iommu-pages.c
+++ b/drivers/iommu/iommu-pages.c
@@ -67,25 +67,16 @@ void iommu_free_pages(void *virt)
 EXPORT_SYMBOL_GPL(iommu_free_pages);
 
 /**
- * iommu_put_pages_list_new - free a list of pages.
+ * iommu_put_pages_list - free a list of pages.
  * @list: The list of pages to be freed
  *
  * Frees a list of pages allocated by iommu_alloc_pages_node().
  */
-void iommu_put_pages_list_new(struct iommu_pages_list *list)
+void iommu_put_pages_list(struct iommu_pages_list *list)
 {
 	struct page *p, *tmp;
 
 	list_for_each_entry_safe(p, tmp, &list->pages, lru)
 		__iommu_free_page(p);
 }
-EXPORT_SYMBOL_GPL(iommu_put_pages_list_new);
-
-void iommu_put_pages_list_old(struct list_head *head)
-{
-	struct page *p, *tmp;
-
-	list_for_each_entry_safe(p, tmp, head, lru)
-		__iommu_free_page(p);
-}
-EXPORT_SYMBOL_GPL(iommu_put_pages_list_old);
+EXPORT_SYMBOL_GPL(iommu_put_pages_list);
diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
index 0acc26af7202df..8dc0202bf108e4 100644
--- a/drivers/iommu/iommu-pages.h
+++ b/drivers/iommu/iommu-pages.h
@@ -11,13 +11,7 @@
 
 void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order);
 void iommu_free_pages(void *virt);
-void iommu_put_pages_list_new(struct iommu_pages_list *list);
-void iommu_put_pages_list_old(struct list_head *head);
-
-#define iommu_put_pages_list(head)                                   \
-	_Generic(head,                                               \
-		struct iommu_pages_list *: iommu_put_pages_list_new, \
-		struct list_head *: iommu_put_pages_list_old)(head)
+void iommu_put_pages_list(struct iommu_pages_list *list);
 
 /**
  * iommu_pages_list_add - add the page to a iommu_pages_list
-- 
2.43.0


