Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1437BD1039A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6dXOej46qdPs98WVrYbxcY/0RQYCd6DfKodEKq/vqY=; b=gcFnet8fP5Xq4oddvo9DiwSE3T
	HFZI3IgpFqKOf+M0GqoMlhnSJu3L88FOU7j2J4vahqUzlXZLwmuRmwX6/DzEuGf8zfQEwMg+VZg1X
	LLHfa9nWPwGCGZDIHmRg1kqNAZUeuWfUTrjhd45YPX7MttLyTODk+A55PlSEkBU6de6HhINe3IK8L
	rFugVYS2bc3K3mma71zJVfW5nJ/wskooiGp6SYTkoqucRUe7O1z731tDzPYt/5tFusl5ZrX2xm8KU
	0cVjbHY6pgnlNteFRa4+TnXAgfl0Ucw4BKkjyoGjAjfJGtiaVLttLx/exkfHWc3U4qUdl5i9EO2WV
	wfECklPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MZq-00000004Jia-263u;
	Fri, 25 Oct 2024 15:50:14 +0000
Received: from mail-mw2nam12on20614.outbound.protection.outlook.com ([2a01:111:f403:200a::614] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MSh-00000004IFX-3EJy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 15:42:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1M5BCfFwvJxD4YB7bP5kmaShFOx6AbxcHnTMDn+u+wrpgMbNe+2oCuJvqg6NjEYqGRqxRcYJA8cphL2iN5UEXIMOxFlMHi+r7H7Kib5mWOpU9DFgUruV4N94PLPsmoCefQ6eqKncEyhoMzN2Exc7+O8a7+JN/6DwaHOYsBT0+0cG1s7w54gs3YWsdjNRbHu4ZYx7iGlqR/MvqwpL9os3mchG2umw3RZjdUjlMfPUNemh1tVLRbkuTY+GV2s2B+6910sTKvDbwNCxMsfsspyK8wwSFevVJFuX1IiTFqNWhcs8Ijmro+S9Xr0EgvQESr9ma1/8l/oe6eDWcnmmUwp8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6dXOej46qdPs98WVrYbxcY/0RQYCd6DfKodEKq/vqY=;
 b=JjJnMusII4QEP+52jHImv8gr6o/0nn8yvLjkVoq2cTq6p+ExbQqhTmIEuuxjrFRAAaxemVXUDc5EH9uVrwdYeCX0OTCA+rrX1shZCsmzD+9Wk8Qg69rclUGwNsvAZW0Mj5VF/O4LADdbKiGrzoG2EZVtkrlwahddB8iBXsaGbl8n5ghL851T5T3G7wD3nAR/Xlz6cC+hY+W8dHApOhp0/4YT0w1FPlKXpTMCP3F17b8gb/UwYRblu46Jp/TPUTVXWnISZH7HCVv62NIkUGMK1wQtLyB3cupDAp+Lfvrbul6gy3n9oglbtaXbZ8L84k5eL25iU6pATrIZpLG9ZWqyWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6dXOej46qdPs98WVrYbxcY/0RQYCd6DfKodEKq/vqY=;
 b=X+UbiNzpxq+IL8I4lsUD/fxWSb+zlOuniTNfUJQHGh3MwPTM+1m4byqNu8+9qGg1rxac0r61aaiZdTX5qMAFRFOLFc+phIgkGj5981YF0bxlahrZ62+KvS4OacKiMIpBmKaGvcXewlbqNhxjwW6P0HbFxjnQ43LHI4nR08w4snsuBczQzdOgWR8IFWLffJ1Isd4qK6AkEkogvPcbAcIWsXYb/lrrWyO1dDJa3qxFnrv1SE3Hg7W/qRFM48FmnApxGBByfCf6FBImvhnlvZGg3srNA+XlkjNwHLKIGAsp6bywosg/iLXStuN8026KwIk6mXYyCcoXP8greC1oUkezyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH0PR12MB8580.namprd12.prod.outlook.com (2603:10b6:610:192::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19; Fri, 25 Oct
 2024 15:42:41 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 15:42:41 +0000
Date: Fri, 25 Oct 2024 12:42:39 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, "will@kernel.org" <will@kernel.org>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"mdf@kernel.org" <mdf@kernel.org>,
	"mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com" <shameerali.kolothum.thodi@huawei.com>,
	"smostafa@google.com" <smostafa@google.com>,
	"Liu, Yi L" <yi.l.liu@intel.com>, "aik@amd.com" <aik@amd.com>,
	"zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: Re: [PATCH v4 00/11] iommufd: Add vIOMMU infrastructure (Part-1)
Message-ID: <20241025154239.GJ6956@nvidia.com>
References: <cover.1729553811.git.nicolinc@nvidia.com>
 <BN9PR11MB52769BCEED1DC36DBCA75AF98C4F2@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN9PR11MB52769BCEED1DC36DBCA75AF98C4F2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-ClientProxiedBy: BN0PR04CA0124.namprd04.prod.outlook.com
 (2603:10b6:408:ed::9) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH0PR12MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: 1246195f-80f9-4285-8e94-08dcf50ba908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PFixsjgNrY40P3RoUo4sfrqZkueWbv4o3OVsr3jyjA1rkKm/d9aKEVWYzXmE?=
 =?us-ascii?Q?Ql3MvHmJ21hMEc26e+zjNAzvfb+RFDhL4FQSi6+WYRRR0bitemEGaIgjtzzG?=
 =?us-ascii?Q?wxwdsbl85/gB5GeWMesLOrsApW4Bi6rU1V4eRZxf+4ZlELV0J7G+7NXg9avh?=
 =?us-ascii?Q?URP5VxXCwxFN+0xqFSyH4AGEV1n2wqu5nSd0YEp21VAiRdfR51bbbitsxunh?=
 =?us-ascii?Q?jWvU4HDpfKnPLx9G6pz4cp9uvkfioqLaET6pKid9wjkRdmmZQxvALE4EIRlP?=
 =?us-ascii?Q?gbf271qmSZUAzRMc9EhbKVJ0x9yo38lJlbeWyaV70P5hvvWxo8PT3R7MLnHW?=
 =?us-ascii?Q?YesOKCUn23mD7sjElpdGhWiuTG9o32/W3jdtkQzesWdNV7AwuHsEpz+MRZ4B?=
 =?us-ascii?Q?p9jCf2Bl1uaFXqt0jqCxh69UltH1CBYeo/BV5qIbC9veVhNl3jU2nBT1Pv5o?=
 =?us-ascii?Q?5n2kXIWXDr3rWDLhbdrkIFtI+PEzmyOd/i/X0i3PZuEtP0jUa4ZvE1qG5pvr?=
 =?us-ascii?Q?DtwLTVs0uYGWAnnDLLiojW/mbj4FyrxJKK56lQjYeKTI81R6Eodu8dIMjKI7?=
 =?us-ascii?Q?kB5uRLaX2rSYkSpiq75bL8JgyapXpZ6YPaNfC4kwD9YmsX9pHmcYUnqD73Rv?=
 =?us-ascii?Q?0IHBZXKhXC2j1o8MwrYGzSzGsYJgC9VY/LGMAf5sZYnY87ONjBYkx+Pp+yI0?=
 =?us-ascii?Q?4GKwe6KkWWs0dFb9iuHdd6rVDJwATSx6rj078Aj5qOOZV4K1/HMYR3ZoBdai?=
 =?us-ascii?Q?9WjYDk18qKU93hMcfjwlIfpJjxNB4t8+Q8cHR4aOM4D1LSFQykz0ruqbGLhb?=
 =?us-ascii?Q?znnR6r8Q7AoWYNwiTD0bjxREM8Cxjfoi6lOhrlqv3FgY/6l/jorXQJRQtY0t?=
 =?us-ascii?Q?1QWn0kxKtu2+V8UXKFMEGbU+6/MJ2E6cBW4MoTCzIMMz505xeQMkMeL2S+hC?=
 =?us-ascii?Q?uaQE5trh1TglEF7EA0a2uZnWwk1cZWFUeGRZvoW3Jl5zQAR9kC3Mv7xC+dFm?=
 =?us-ascii?Q?BUy4jo7XlMm9lUX/iiyIQwz64EykqQUVvowLb4ErSpHsxKxoLwPaKSDdfr5v?=
 =?us-ascii?Q?zF5QDfYaKeXu3KnFPJVAl7V9UTT6Z8D0z28ww30PnV2NytAkJ+NmlPbDTX/3?=
 =?us-ascii?Q?NKEltMELSwFet65pEDN8/ycTud/0Z3ms6f6qgYZ5t4MbJqmKA8IfZHxQUsfN?=
 =?us-ascii?Q?Ev6tcWO3HyzfpCU/W2IjjclgASiXtJm87dtoBb4+Uc++lVgxDhNrBI4k0vRJ?=
 =?us-ascii?Q?eEQ/7Fgo2f10b3+o+7QPUomL4JVJ+bklvgSuctP4ou60QlGVxsPLIv7SWMaE?=
 =?us-ascii?Q?AMc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?66uOrkb+agLHyeCVBlIeW4vdPHZglDWsGr49Ue78vZ263sKFQFtYCxQIeOH3?=
 =?us-ascii?Q?qdRnS+MHuIPCMsyayMOPFQWxwcnFl8kkijtM+jtQ8px1uoWzsL8mhwNA5Bzb?=
 =?us-ascii?Q?Asa4sJTJtSIa1gd0E+vF5zcNs1T4cq0xBU4AkNHCoAZ0G+3nQrDboQdC7TLZ?=
 =?us-ascii?Q?s9eEfaIe13WiFqburUoyzCEAJ6j9RCKK5kHwRM6cwofMiiZIhw2c6XmaKRqh?=
 =?us-ascii?Q?qzDbUF9nnVEkitKln0Q3RWzlmWJgTmNgtt/+xauVgReY5tHc/cikfEFfnW5J?=
 =?us-ascii?Q?jmyfe4by+nQXIszib0HGY2o/mCDx1VmdrK6KrMk8U6/YBZz0Ad6XbhuIsWFZ?=
 =?us-ascii?Q?5DdL8sB3jj1v1DZLic2t2nc8JS89POqKIYLXPy0zRgMznLCL/Y8uVxB5Jcl8?=
 =?us-ascii?Q?jk1fZvwR7QaeGIvNRPbE/zkwrp8w5Xxm8DFG8xWbpsJjHYIfXJT3Toq1W/tw?=
 =?us-ascii?Q?RRethd4yrPC3/PBBpoouA+dxz8R0mR+6+JbTv+vyzGAltRuFZMktkJXV1ZT4?=
 =?us-ascii?Q?S8zO27ZV3of+t63aYoO+Kbyvnm0pGBo/Fq1YTh7/vZ8seyEQ57yYIg6fG6yB?=
 =?us-ascii?Q?BfMrHjTqdCBHq5dIqTprQ4eARvU9lafWKVIIbdvvMxZg569Txv411MoyLrZM?=
 =?us-ascii?Q?MV7ZvOuhnS5ZAvaPDEt1WrubK6vzTJaNyJFsG9bnCU0PUlfacZRZNK++vOOo?=
 =?us-ascii?Q?+ijhkxDiCA5SU3saXThR6Bob1ZKoMi6AN/Cf2/koxvRabeH7PBVpsXoo0cih?=
 =?us-ascii?Q?keNPNOBciFhNCnjUOWpTkJJnt08yvjaUtP7UYD2TERhpuCftJlFGwlYtV7Hp?=
 =?us-ascii?Q?mM6fXYce6udfCyBv5BrEdHNf4sjfGv+HDjLqBFIcMg4dAVkLYeeQspNyScPP?=
 =?us-ascii?Q?VJCnpYzgc0WAXOhIgcj3XpyG/ZrHFuquH5Bd0ftAw7lGuh9+O0ggLBWrGSYs?=
 =?us-ascii?Q?FxEeWRRhlo9+kgSFQptwG5QQU2Ep08HD43f8SyUu10J7B8QjWbAg+423jl3g?=
 =?us-ascii?Q?NjsAAB/m7iQoilg5/lAxSOG+NwYYxTylJo2Xt1e93vvB3IIYQQEq526gk8fM?=
 =?us-ascii?Q?wFkDjAdbZB751Dy+/QmP00DA/21noAFgZelNCDpvMsGZk4uAiuX+ghlM7fLd?=
 =?us-ascii?Q?FBlgcvtkJUS31UM5et18ahLK2iu0cne7VOvmKfumoLGHvRMSOQyyWEWDok8o?=
 =?us-ascii?Q?tmccErHIuXyL42I7XrbPI1Th9Qd31jgCApFAJbP2fI9kiraAeQpe75Nzg8Tz?=
 =?us-ascii?Q?aa3szeiuq/dauNhRjbL2Ul0b3JvY3ABEnEMw3vCJul2NnO/ERNAl33g7lmvi?=
 =?us-ascii?Q?6gIhXZHAIErDFKJElTedZJa3EAEF9qUygAQCDSUuUb+EmRqRlnM49WqRWfgF?=
 =?us-ascii?Q?sGYJIH/Y+CMB8Kc9do5GwtU4MHshe1gugf0gT0okoKzMFykLeiraStbL1n2+?=
 =?us-ascii?Q?9duu6HCY3n3Bem5qGXd+mZE371uELCtwKgxrpZQWdNmCbi8vsyBUByoR2lyD?=
 =?us-ascii?Q?10aj3TKwX/Lxnps+dJgFHWyRtqzVSeR9BrvhmM2NuS3TOyTqaPZtn8PWSo3D?=
 =?us-ascii?Q?wQiYblTGlVLqsxTWRDD70BPfXSFnn81luHaLZKZA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1246195f-80f9-4285-8e94-08dcf50ba908
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 15:42:41.1221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGHDQav0Of8zkivkCSL02RWpIoWDQ9HPbQCsyYGXZHa0QTmDihgh+aLdibpElt7+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8580
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_084251_823219_085E7245 
X-CRM114-Status: GOOD (  10.68  )
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

On Fri, Oct 25, 2024 at 08:34:05AM +0000, Tian, Kevin wrote:
> > The vIOMMU object should be seen as a slice of a physical IOMMU instance
> > that is passed to or shared with a VM. That can be some HW/SW resources:
> >  - Security namespace for guest owned ID, e.g. guest-controlled cache tags
> >  - Access to a sharable nesting parent pagetable across physical IOMMUs
> >  - Virtualization of various platforms IDs, e.g. RIDs and others
> >  - Delivery of paravirtualized invalidation
> >  - Direct assigned invalidation queues
> >  - Direct assigned interrupts
> >  - Non-affiliated event reporting
> 
> sorry no idea about 'non-affiliated event'. Can you elaborate?

This would be an even that is not a connected to a device

For instance a CMDQ experienced a problem.

Jason

