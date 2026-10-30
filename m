Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FA4606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 20:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ggDCNZ2P;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YjamefHb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pkXhAAFxdrywU3msLORhtm+R/KgsTgeImnWjlCDw1W4=; b=ggDCNZ2Po5kJ7WVbkl3Wj9uQwA
	z7yaTBaiRlGrOAA9Re4m7t/j7NY2I6DbNC4Q3bV78BufF1Sr8k4kwumm0AwL+QtsGNAXqJYr49hgU
	Odoqp+fImLJdI+idNtfsPSjz5uq6uegsnLapk9Qx64yMwM6kTyHgkqlsFYLrRvbVSJLlGwtyn5GAV
	VcdyZ5wXBHCfLKmMww5DqqN0UfXYs6bdKFf2vSkx2Tcy0RCPKSsiePbope4kSPDeaIgssuTOkLgyf
	xJoXZ6c7CJqYfnG/bYYS87wM+eSLGm040VlxGcpLJpLa+EuAkFAmsv24Tf45GUMF6i7zlERTXgT/I
	9KSOFuJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtdC-0000000CaR8-1d8w;
	Fri, 30 Oct 2026 20:55:22 +0000
Received: from mail-westus2azon11010048.outbound.protection.outlook.com ([52.101.46.48] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtd9-0000000CaQR-2U3U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 20:55:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHvLLKGQDNA4LUZvunT18Rfwmg5qJlUAvpnokBVtgi7PJ+6KGbXvux0QlCCgpzoaAhf4bYdgoni4PVKJinpJL7tmZ7TrRJRjg93AIyd+YD/EgUeOZRlx6u8XXdPUwEjVjtR9BpsWNFIZUCpPBqmHTtYCkjl7RKolkKPD1gwJsamVfzd6f1XV7SqRSmwIklj6zRYze0JpKWzWn6czxnpcZDQ766dy0jNvVKWCpqo6cbyVX1NudPPzs7rqGeUAyMqEimURp7wvkBsU4PDU4xmXz+novzA47YkIYbaCQC+65Qqi3qYcBr7oc9QqPknxZIjv5rAUs3wRFrpuOGJL7k3MQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkXhAAFxdrywU3msLORhtm+R/KgsTgeImnWjlCDw1W4=;
 b=fDpnOitGb7MFCpmaDp1+89g4fq6T08xr1V2EQ9n/JKyUIBJoAMclRWVrgGwIDNmQysl924vCBNH8S9hb2tlA6QQxf/Td8ai3B1eOcR8wrugUald3ZnsPG77yKWZ7jiDlU+y5VKDUZxA8ZbS3nE4cFJ39gRPHL4UiYa8BZzNX0HS+ZVXWVHXTkKTCTDcqwDiWzrtgZkYv+nDCC1RHI3PdZq2rfLdEbWw6izUf/ivEMex1nm7fmyzKkSHSW1OmFunWapKrv+zXWQgDBqZkaAUKtfkTHtYpk/yEQfyH9KOhTm9YV9c28nW9tNoiVKicaSORPJoWQ2BQ5pzNkREPqy84Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkXhAAFxdrywU3msLORhtm+R/KgsTgeImnWjlCDw1W4=;
 b=YjamefHbkzg7DwXPDDWLY2TlPF3i5n3hfi1+S3Cj3BR9hAbsWQCEUor3ukAVuK1WV1pwWXB+XWR4u+NR9U4dfha1r8kf6i+/FGv3AjxtdD+fXNt9c5lcZpIi2DbZRisXAvYuK69jdDKNrUrF/892o/DybIdplInySqthklYLRopV75bDzVE6l8W/xQpaIHwSjdzZ+h47Xupg6GbsJY+kAtBeYFMUAVxQYHr0VJwVWu21cHLl2LOMM5d2tFyUgt0nZ4eYEP20I6F5O+rOlc4cSSINcFjQaoUUvGyiwO3ul8tVfwu8zMMstf8t0n3P+k3SYnbO8QjNpW0wU3RTUlOKag==
Received: from CY5PR14CA0011.namprd14.prod.outlook.com (2603:10b6:930:2::20)
 by MW4PR12MB7213.namprd12.prod.outlook.com (2603:10b6:303:22a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 20:55:13 +0000
Received: from CY8PEPF00000056.namprd05.prod.outlook.com
 (2603:10b6:930:2:cafe::53) by CY5PR14CA0011.outlook.office365.com
 (2603:10b6:930:2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.10 via Frontend Transport; Fri,
 30 Oct 2026 20:55:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY8PEPF00000056.mail.protection.outlook.com (10.167.247.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Fri, 30 Oct 2026 20:55:13 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 30 Oct
 2026 13:54:57 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Fri, 30 Oct
 2026 13:54:57 -0700
Received: from nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Fri, 30 Oct 2026 13:54:55 -0700
Date: Fri, 30 Oct 2026 13:54:52 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, "Joerg Roedel (AMD)" <joro@8bytes.org>, "Thierry
 Reding" <thierry.reding@kernel.org>, Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Jean-Philippe Brucker
	<jpb@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC v7 3/7] iommu/arm-smmu-v3: Plumb the CD table into
 the CD helpers
Message-ID: <auUEHLb8kCUUMoAG@nvidia.com>
References: <20261030-smmu-shared-sid-ver7-2026-10-26-v7-0-961726ebd6ab@Example.Com>
 <20261030-smmu-shared-sid-ver7-2026-10-26-v7-3-961726ebd6ab@Example.Com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261030-smmu-shared-sid-ver7-2026-10-26-v7-3-961726ebd6ab@Example.Com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000056:EE_|MW4PR12MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: da94ae3a-2509-4944-87d9-08df36c81807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|36860700016|23010399003|7416014|82310400026|261026121527099003|11063799006|4143699003|56012099006|261021135927099003|261009223027099003|261022105027099003|10067099003|18002099003|22082099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: H8SFPcWKkHLORr3vvw8FM98AmrJmlmjdEKqX/HR4Z9/dv0tJBt4dYVSZiutK5c0Zcy0F9wU+5nsVP9597jmGu/m9qUBXF8YC3nBAg7POIBBd4WXcRA32WvuOyC+e6yMotHbKqrYt5mMzjEf6slCHD8rBU04+xwIuqB6BkioOqjIe59M8jRJ64VGyWIiLJ4ZpB74dUK8qKVcorLKjThKWcuXWKEQeRkKT+9xAJ6POIf0HmK9bc3tfbJI1sF6XFedHJ4Hd0w0geFwV+SiFGnt6jGHFyRoNrRBF35QIWli82J4/rbGRIKTKtJyGPsFbmOrk9udTeGOgCBk+6AlW9PcBZ4MOozfc1jUekjKl5Y4JyFZYysUmoDZVb/EIapRRPNNdtTOhcKRDMnSJE3iVBLheiawh1NyzIUF8/4zplI9faBuujpihIZowvtBXpESfu0N5VUcUd6csNudu7JwNU0DYyydxlKvFeOxL+rvb2l+JZAUoNYCJx0gVXIq88Cn10CwPdgfognFgz1hfQ/7uRMRO5HQNi/6WTv2FZUnuqKsQWCl3VSBwWXzJ6pnFAxRzK7TQ8+kvjmXOymFh5ZOTWiZmqz+wwCmKw3V+gAXYmljzVYVZFZ56L0Ept5BY9vC4d9mSF0E7VYfuvZtdNznF55Fkis/a0vpsnwv4tjF8Ok/ell9aZB5xXs1UlSuy4fARvqVryIUH+oPH2FhYlgjwrWsk1w==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(7416014)(82310400026)(261026121527099003)(11063799006)(4143699003)(56012099006)(261021135927099003)(261009223027099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IhgB8LUBCS5oBtMfq3IuYRzkbq+0W+QIVgkTsA8KcPYsRGkm0w0ZqquFowPwMSjG/KBbGsiC/XqeDFH+NgKD+JeH+CX7AzhQ+GYmWLQWjR/pQHN0G1N3Ovkug+bRKhdQKbEQchP9T0At5CStURvnZvsEPlWl4PTsfHcjsAeUbKL2EJoZFR6hnTIoo7tTvMkhb+KqrfqCx9nd9oWoG400hgsqxfu/SgXBn5kC+X9p8HsIdss4VNdAQdO99h8gfTtEv0RNukGRCvGRqjQnbxqKpOn2olg0Rk6Tpo1KbAq/0t2PDypauFnER6ohCGHW8rcOPSOdDYSdpAb57bD0NzWgjBFiKMQRIcRYVwjXHDN94LpQm9AY2VSNF/iV1LJejFQbdDvEbXyjI8Q/JQpZmZIw6UzgpiTLJwS8YKDFZzkJYgjBh9VBdu4NgKOPkXmd0RHE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 20:55:13.3464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da94ae3a-2509-4944-87d9-08df36c81807
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY8PEPF00000056.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_135519_659207_F188CF84 
X-CRM114-Status: GOOD (  10.69  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 08:09:35PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Refactor the CD table allocation, freeing, lookup and STE-building helpers
> to take a struct arm_smmu_ctx_desc_cfg pointer instead of always deriving
> it from struct arm_smmu_master. Add master wrappers so existing callers
> keep the same behaviour.
> 
> Prepare for domain-owned CD tables, where non-PASID streams will point
> their STE at a CD table stored in the IOMMU domain rather than in the
> master.
> 
> No functional change.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

With some nits:

> -struct arm_smmu_cd *arm_smmu_get_cd_ptr(struct arm_smmu_master *master,
> -					u32 ssid)
> +static struct arm_smmu_cd *
> +arm_smmu_get_cd_ptr_in(struct arm_smmu_ctx_desc_cfg *cd_table, u32 ssid)

Just keep "arm_smmu_get_cd_ptr", and change master to cd_table.

> +struct arm_smmu_cd *arm_smmu_get_cd_ptr(struct arm_smmu_master *master,
> +					u32 ssid)

arm_smmu_master_get_cd_ptr

> +static int arm_smmu_alloc_master_cd_tables(struct arm_smmu_master *master)

arm_smmu_master_alloc_cd_tables

And in the other patch:
arm_smmu_domain_alloc_cd_tables

> +static void arm_smmu_free_master_cd_tables(struct arm_smmu_master *master)

arm_smmu_master_free_cd_tables

> +{
> +	arm_smmu_free_cd_tables(master->smmu, &master->cd_table);
> +}

Maybe fold in the condition.

	if (arm_smmu_cdtab_allocated(&master->cd_table))
		arm_smmu_free_cd_tables(master->smmu, &master->cd_table);

Nicolin

