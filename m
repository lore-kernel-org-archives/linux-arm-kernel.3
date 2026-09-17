Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999D8C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 02:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgmpTeddKoYljOoFhvuONdqPI/uJeGpN5GkIusLcQoc=; b=EpoqmcX0tmHq2dT63kTj8hipvz
	lj2l1Uu06JC4kHe7FMgQBMZtV1pfMoOlzXL0OGeUxwVhRmtXXX41sJEC4EYf/8ftofFIP3IFQujcP
	pxlGujeXirdhFzZOzSLQSO+Ww/NjZCvyOs3fvCQDNSyd53Qpi575ysEM8QG7409RneY/PeKY67CSb
	D7p4l05kKgRi+a1C+7KdD7JSqVjvXpRukuLAUecRrJCdvVmmYOpsMuSo1dQymKo24R9jfzydh09/a
	GzCfndZ/Eo7ze+GGiJoEgBEY9K+v1N8EqxNwaQ3xPcFm/qskGpaJJ1FiImL4rw9FLcHjjKb7YqiHo
	17ghd7OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x726m-0000000AU7P-1QUw;
	Thu, 17 Sep 2026 02:44:20 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x726j-0000000AU6p-3odm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 02:44:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wNizo4wEvduG8zimjRzfVXR649oghGybxgnN+AGrApSw0YLEnUlkUMlocKTC9uN4CtSurkdkt+VFbnmOhLoddawyT5a/ncpdmhBUuA+1JTNvZD73mVkCKLsWTtLDkm+4ocAZgjuBroXbxf5XEVkhLNtymDdnB6tfGn+2OmMOFJ7QWeaY7VVuUzo7UWc5yXQHGY1mRFhhGgI3p0KLGkxcyiatGIEIgHFlPAkoORLj7bdosRVCSQSbjFcrSjbpAesR978ch8tQKyulTWMJBS3xKOKwRdzjoMP2VQ/If/nXADZKaTloZjr2MuKSrDOJZYIX6nlrrpGygXBqLb+xdKasNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgmpTeddKoYljOoFhvuONdqPI/uJeGpN5GkIusLcQoc=;
 b=IWWHzRgdsbLBNecZ1DPEFE/yTZSfXa5as60N1SmTyD72FR354A0Sm8o19+UMuWMYMaU8+SkfDvVOCq16Dqh/C/p7sb5dNpQ87I9WBsnLDZajX1CqngThnBgU6BFSl00EHXdLVC/vAGlt8Wc9XqSoZLZ9qgPYhByBgL/AXeW+s1ixsTMx38ADPTcPwYguG41EHGXpkKRHLHfo31xumu8XVr1e5c46sjWbKTeyGjBxIRQvlDJo8sJBo5MTdX64uFYTQEkJPeZI8rMx19QpB+Pp+L8izuZE0/sDIQbpQDY1Q1+m8WYVpIlstfH2bMxX8AZKrAnekxmw6wkbV8UbSh2xRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgmpTeddKoYljOoFhvuONdqPI/uJeGpN5GkIusLcQoc=;
 b=o6yIW/38RF8hKv6Xm7lcScoYw05HTp5xKoM24CNJ+/XT98xb9jQE9Hiy1TL7789m8vBHzkcOAYM3L1RNh9FNeNOF+rRV4kpIMqoNyWVsGTCV9TGcfdlcoTv1fVPt5OwIdZE5Hr4jias9+2oS2O8jh+rzkJXX59+4O/THgEodUl+gsCWC3HhWOYag9spidgn16AnOFipaxsA37p8oOsDykgzwQ7mgrlnSvyE8m6Yu8h843M4d5S4iEW7Ij+4lIPlbdvca7GAFAbY9nEN9+I9yLUebazsGWpxvEYyLyVpBax5ktAE1UYZNa9TQOK70lTu3MUokoaFpgmfxB58nE6VYjQ==
Received: from CH0P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::13)
 by BL1PR12MB5969.namprd12.prod.outlook.com (2603:10b6:208:398::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Thu, 17 Sep
 2026 02:44:10 +0000
Received: from BN1PEPF00018070.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::30) by CH0P220CA0011.outlook.office365.com
 (2603:10b6:610:ef::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 02:44:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00018070.mail.protection.outlook.com (10.167.245.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Thu, 17 Sep 2026 02:44:09 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 19:43:56 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 16 Sep
 2026 19:43:56 -0700
Received: from nvidia.com (10.127.8.11) by mail.nvidia.com (10.129.68.9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Wed, 16 Sep 2026 19:43:54 -0700
Date: Wed, 16 Sep 2026 19:43:52 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet
	<corbet@lwn.net>, <iommu@lists.linux.dev>, "Joerg Roedel (AMD)"
	<joro@8bytes.org>, Jean-Philippe Brucker <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>, "Robin
 Murphy" <robin.murphy@arm.com>, Shuah Khan <skhan@linuxfoundation.org>, "Will
 Deacon" <will@kernel.org>, David Matlack <dmatlack@google.com>,
	"Jean-Philippe Brucker" <jean-philippe@linaro.org>, Jonathan Cameron
	<Jonathan.Cameron@huawei.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
	<patches@lists.linux.dev>, Pranjal Shrivastava <praan@google.com>, "Samiullah
 Khawaja" <skhawaja@google.com>, Mostafa Saleh <smostafa@google.com>,
	<stable@vger.kernel.org>, Vijayanand Jitta
	<vijayanand.jitta@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/9] Organize the SMMUv3 invalidation flow so iommupt
 can use it
Message-ID: <aqtT6P1TsQk/N9dH@nvidia.com>
References: <0-v6-9cd17417d355+281836-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0-v6-9cd17417d355+281836-smmu_tlbi_jgg@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018070:EE_|BL1PR12MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be12ea5-2c6a-4c27-af33-08df14658d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|7416014|10067099003|56012099006|11063799006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: IawGfcGIMVj8lmYRixAmPB0OEJtGoj7Wu9Vwa82u0RSifFtfOuZBCtAykROe3z4xk03wZPY8SZFVYpxlX+3848r9V/7gfBvv1VT7Yp+G9Spa7zm9xfya2AxoSO6m5IjVYP2+cTTZpYsXrdwoAilgOmo2W59inYJqAunvGxVq8kAPsUKWDW/wFT+lv5JRsKu4i3WP/DWP3X0suGjaWorRVbZhOZlAC0qf42UNYOQkYBZPfI7LSe38P782yBDUFkDwrL4H1ON1utyN1NxSQI4iYdJnkClT1ADmcdPhs8kQhXxuRKYS0FuLbigcUcqfYTR7GXpMbLqrg7vJfbuXYhyznQ7ZcxCU7ZUrOncRdkhxdA5mWgG9LXFc5kNYv6G/QwV8SvjQ8xndUFSH9f8Xpi8tmub09EV9X10l6HK5KywAIAE6CuzrmLbSQhURcQ/7Y14iYLh7SOOLfdASSVChNLAKFM7neE3xeB7pMSVdbynWgX90j8o9YuE//cHkQ/kaTMZRlGEK9CNmmljDQVNJN/QGdm5ea5CGC3Aw14PY7J7OGq9Jd+x+6Brknd7JHhh1U01NWqgN6oL5J4IdHQU8co1WOzZDOmsJzebocMxIP52KOxKqrhqOl/I0wbaQZAO2kxSqTq1DzGOnWQN9xg1jy3EOUNQaMFPt/ELABisRfOgorWMbGyAmRUKmk0KYP1E2Y42DyEIpwHaxoyGEyHdcGoJTDA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(7416014)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5UdHRKKRXhP0KikUbWzpX7cmE8Vyr9XfI4724KWiYsJmUdD+t1APAwZ936VVPoHg5aZLm+qkxrZ5TvvXzzUbHIuBtbxUN3qDFfx7Qna4nomJ7bhpMSZEQDGrZXrkD/2M/4Ks29uFcppHOfXbmLDlVwghmgHZfq7aDLXbY8GOIJuA/KGWtgLDb+o8OhiVnmWEedmzLDj4TkyOv0n/XRLXL+VSfH8ukTqLERWrLjxfxwA3rSZw8mKadFwGfHT2qej+0+TVlaL5pFN31HQAoyv6DCTNHBaooKULaFWLdYOI5d8fX9tcibByv0jbtHIQEVzh3SP9yaJRzkjKQX5Hz+l8jM/Vnp5qaV4VEoMmySJCw/7c+Vsxo3a3FtDWbMV/MTmd/ZPEfROJvC6bNi+zEMHAuoZ5g9j3zeJzQSrL3k0nZtrEAEwCeakJHSw3a7QISBCp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 02:44:09.8198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be12ea5-2c6a-4c27-af33-08df14658d04
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018070.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5969
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_194417_957158_2E6801AD 
X-CRM114-Status: GOOD (  13.99  )
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

On Wed, Sep 16, 2026 at 09:27:41PM -0300, Jason Gunthorpe wrote:
> [ This is part of the patch pile to move SMMUv3 over to the generic page
> table, the precursor patches have been merged now:
> 1) Organize the SMMUv3 invalidation flow so iommupt can use it
> 2) Use the generic iommu page table for SMMUv3
> 
> The first patch should ideally go to -rc
> 
> The whole branch is here:
>    https://github.com/jgunthorpe/linux/commits/iommu_pt_arm64/

> v6:
>  - Rebase to v7.3-rc3
>  - Add helpers arm_smmu_pt_level_to_lg2sz(), arm_smmu_pt_lg2sz_to_level(),
>    arm_smmu_ril_calc_scale(), arm_smmu_ril_calc_num()
>  - Remove unused leaf_only
>  - Combine has_range_inv and range_inv_scale_max
>  - Clarify comment on arm_smmu_iotlb_sync()

S1/S2/SVA sanity runs okay.

Tested-by: Nicolin Chen <nicolinc@nvidia.com>

