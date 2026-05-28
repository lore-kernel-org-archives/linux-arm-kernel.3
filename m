Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC63CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 18:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWb/dQpfJMTzYdikbDeUrMlB+zDobwsHdBiQ4z/wWKA=; b=YB8sSLhKpvOEbjVLbdmWiOWMkf
	K9JFLAZz6HurJLiB6n5EGRSLN/S7Rz8p2WuBEawJQXmX0DgB2wbG8WllKR+pvx3n/uFqw3HcwnCgt
	VyqwoFY7AHICZ6YG/XbR+bmlsgs+XH2sBL1BKyNtWl/z4undmJDFXpzYgzl9NprKHTLBZCG8n3sSb
	hhR5SEyizSuSUuY64MbL6Gbx81YvAj9HjxlSTgLWlrj2Ula9qrQHBZVSMiwFypeaT3I80m0GvWbWS
	3IIlZQrv/ixpymNw29cd5tdbAzJ1YJlBstdLU5Jq3IL8W6+bhWCKpe/4VoEBIMbJ7ELP088n3rNgd
	7Wc+GjlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSfM7-00000006B2i-3MhW;
	Thu, 28 May 2026 18:21:19 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSfM4-00000006B2G-3hVk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 18:21:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXo356IzJKN+Qo2KhBBNQlsvlqTxuQOFmKTQhwyTfFpDMTP21I8fVJwCqKoEnm42FIgKEH4Nd+LQO7DTpfSh7VStf5O2deBZRe6xEvq0ro4orcrOp6v6mjJgNURjoPrut9LXMtfgmu5TbZshfKdgOgNu1rE8Lr27/nE3zYxJmWguh+WimcKyFyqNY3zozn/+/FEns8jP/RgTceQf8n9jYU1upCIfz5XGZaUdIMEkJB+5B64azUaklFVXwLc8QsY9k3Fq4BKBY/m4gG8KdYCtcbCyPUrQ5vL00IiCbMAZZrzzBDc9Mm4lKwbI7A1LR0XxZtcWYo+qs+SZKaMDM+amhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWb/dQpfJMTzYdikbDeUrMlB+zDobwsHdBiQ4z/wWKA=;
 b=Na1vBDwT3/sL2RCxExjk3nsQqbSQ+wze5NTZbIL0GlKAZvCYP9yCg5ugzsW+pnw1Y5v/JhzKhckGIcoNwRnRWb0GK8NnYnUDKpWEdTQzHFnS77mjSSbWDChMg7vGPMRItaob4YnniT2fN1RfOsHHzFN3lORsaLc0+Lkm60DKMePQN5LBEpKfcKkSw7PFxFwpuXkqXiJl5S/qfDrMyljRZcOOOKgrCAz9aQR85UFtOjm+0u0pUYTP+9ZWhCYMxs09YpPYsYbvBZjUbWHiZ32sJ64/okA69ZLOkJu+pU4zozbpY4Ht5zNONys07BvuQ2dj1fzgfLrYmf5M6ZO3iuFwLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWb/dQpfJMTzYdikbDeUrMlB+zDobwsHdBiQ4z/wWKA=;
 b=tfFIUR7OHpatwFJKx29cp4iAVrv3FEJOSrbB1cE4k7cev3nWNA37Ax37/I2vkC5BNyNWIm+5GPYHHDjPeFDSlOuWi3H1p8pRhTxqqJu33oRo3oPZDCWcALIP8GLU5/BMAy3vhG9dFQ3ZznUOnfp9/Qg6Y18B2VE5Ye/CBXKzgiIPqmApwsLcMYtL0GoFCHtB6TP9Ye3rSF0c+uK2PL/3tJRK4pniJa/WvlAvJwtMKu2JQ7eT6t0TBu2A71k33qnbb73kyhd6X9KL20/FQd2o3L47OsYMC+ngLKNpkxSQOiVt+w8yZnrfXzBuwhqybrQsXPRlX88E7UA6E0bK6OtOfw==
Received: from MW4PR04CA0299.namprd04.prod.outlook.com (2603:10b6:303:89::34)
 by DS0PR12MB8813.namprd12.prod.outlook.com (2603:10b6:8:14e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 28 May
 2026 18:21:04 +0000
Received: from MW1PEPF0001615C.namprd21.prod.outlook.com
 (2603:10b6:303:89:cafe::56) by MW4PR04CA0299.outlook.office365.com
 (2603:10b6:303:89::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 18:21:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MW1PEPF0001615C.mail.protection.outlook.com (10.167.249.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Thu, 28 May 2026 18:21:04 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 11:20:38 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 28 May 2026 11:20:38 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 28 May 2026 11:20:37 -0700
Date: Thu, 28 May 2026 11:20:35 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, <will@kernel.org>,
	<robin.murphy@arm.com>, <joro@8bytes.org>, <bhelgaas@google.com>,
	<baolu.lu@linux.intel.com>, <kevin.tian@intel.com>,
	<miko.lenczewski@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <dan.j.williams@intel.com>,
	<jonathan.cameron@huawei.com>, <vsethi@nvidia.com>,
	<linux-cxl@vger.kernel.org>, <nirmoyd@nvidia.com>
Subject: Re: [PATCH v6 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Message-ID: <ahiHc3y4wAxxtpLT@Asurada-Nvidia>
References: <cover.1779392420.git.nicolinc@nvidia.com>
 <18bb6f421b3be891caa8f1fb50f3a4d56b52d5be.1779392420.git.nicolinc@nvidia.com>
 <ahheOF8L0aGMttcI@google.com>
 <20260528152930.GA3195266@nvidia.com>
 <ahhuFw3ZJpy48xkH@google.com>
 <20260528180018.GB3195266@nvidia.com>
 <ahiGIUDG2uvA6usM@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ahiGIUDG2uvA6usM@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615C:EE_|DS0PR12MB8813:EE_
X-MS-Office365-Filtering-Correlation-Id: acdaf9aa-a51b-4918-5f7f-08debce5e163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|82310400026|376014|1800799024|18002099003|4143699003|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: avc0d5lCWgxgP3yf1xZ1520kIIrYo/yFNWScXWHBEOGB+SKF5Gi4U3E8qCvbBTtOK9M5lTXKsQGO0kYCfiB4bo9KTxdUUREeuLP6mztC2Mb0StB3vKZGGEES6VJsX/MooL5T2I8caYawA01Vw9VJ+rqdFuUJH7nn5g206dd0VvK/en1FcoUfzI33+EVJo7h/Nzy2FelYfMO9fXSrIjiaHvKCwS4euyeEN8mVPUk5OydPC/VTHb779gGPlN2QDF6iAF8gmqwneUcTkz7LXvrOrQsEssMDtB/hopkjyn9c6hgfKubZ6frScQsbHqSStXlOkk/CCu0C1Jl8zyXlGrMd2/H4EuYz5rZ12E/pY+rDU7ievaAFUlXQQz1BuHQc2xh3KXiIFQ2jSDHSOUVsEx/9rsroIqN4JwwBmlArs3jh0TH8KNBsK/RC6cx8ZZAe6gbE3cN4gaKDqkYmdRwU60SluCGD5W9eN7AYUTqxNd1Mxfu4EhblC7k06h1AJxtRCFEQWuO5WefJZoKAmeEe8umvbX62xxHHzqijckMBCHzV8S/Sh4XkzDvFPlBIH59K5hf9QoZb0O8oyPP/J+iNy4EIeq5bWNHI+K+9Cd13PRfIKfvAl8hH689w0epjN+RIPkcv2sa0EkmRO2BaUYWA1SQ3IK1x8ex5azblkpld/kK2QE3i0lczr7lWTDyFLgIyTWH8ubNpL3Hk1h7y8lKdugowsJU0tJRxeqOteYr8JRKsPic=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(4143699003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: icrxFBdifWINmP7ws2swmy03QeU8GgpesuMQ/LRGuN1G2oi98GBcDz9Q2NfObQfz2ifc/oBc/tXd2geoWMQUznQPZ1xVrmhy0okA3Hiv2wy7SsgFPpD06SYvejsrD08KOmU1IP7Q6WQBD/aID/lFkd1vm8fEc9eZCfZC7f/YUOn6eQ8sMCfM4Wk2NNVH6V35MQAwPPv6df3AWnoIYKAz8Fzxw56ipMA8VI0zUGDPkVLWfCqBdzDvEO5nGHBKwyBwgtwlEoQzCb2mjgc2pZPWpD8j1eQf1AK0qkid+Eol/uk2nP+vfDQ+HNXtDVS3E/3a+U7PJboAoxnf3SxIS1atT6KT20gWEP4QS959PvhVOSbFXb4GA2wTBK+YoltVs+WJdlCowwZUpZgaB6ZaUzPGmy2XV93H18Sp3xTD9KG/MdqMxf1mTGcNRpQjsTf+cO3O
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 18:21:04.7117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acdaf9aa-a51b-4918-5f7f-08debce5e163
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001615C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8813
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_112116_925275_8B8E3508 
X-CRM114-Status: GOOD (  20.14  )
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

On Thu, May 28, 2026 at 06:14:57PM +0000, Pranjal Shrivastava wrote:
> On Thu, May 28, 2026 at 03:00:18PM -0300, Jason Gunthorpe wrote:
> > On Thu, May 28, 2026 at 04:32:23PM +0000, Pranjal Shrivastava wrote:
> > > On Thu, May 28, 2026 at 12:29:30PM -0300, Jason Gunthorpe wrote:
> > > > On Thu, May 28, 2026 at 03:24:40PM +0000, Pranjal Shrivastava wrote:
> > > > 
> > > > > > +	master->ats_always_on = true;
> > > > > > +
> > > > > > +	return arm_smmu_alloc_cd_tables(master);
> > > > > 
> > > > > Nit: I'm not sure if I'm getting this right, are we saying we *need* to
> > > > > allocate CDs for CXL.cache cases in the probe itself because STE.EATS
> > > > > requires Config=Translate with S1DSS in bypass?
> > > > 
> > > > Yeah, basically.
> > > > 
> > > > Effectively the ARM rules for enabling ATS and Bypass together require
> > > > a valid CD table pointer.
> > > 
> > > Ack. But do we expect transactions before attach_dev? What'd happen if
> > > we don't allocate CDs here?
> > 
> > It can be done at any point before a non-abort STE is formed.
> > 
> > The core code pretty much does this immediately after probe so there
> > isn't much point in moving it later.
> > 
> 
> Right.. that's what I'm not understanding clearly, if the STE is Abort
> anyway during probe, why are we breaking the alloc-at-attach convention? 
> Usually, we allocate CD tables in the first attach_dev call. Why does
> that not work here?

It would work in attach_dev(). I just felt cleaner to have it in
probe(), paired with arm_smmu_free_cd_tables() in the release().

Thanks
Nicolin

