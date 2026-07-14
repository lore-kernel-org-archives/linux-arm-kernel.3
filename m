Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817F3C44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 23:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovu+MJpfmO8hWq7ZdCSjO3yz9NllpzQkyfrDB5S72dY=; b=vX6XGV1ljdjVQhCCb88u08nzHM
	FnhGCxaSOs5IcjC1Chk8hcN5ggrVPBhtV3j8IZ75dqw1cDsDr74Mx31p85hPj9f/sUQqay/2H5PNV
	UFzzN+dM2exM0GhJr9U+KXES3BPp3ZoJZWkGOiroZawKl6Y4fP+UaiuWkaKW6YSE9Fffc+xZSpg74
	ywUS4D7M/9pG8j8jWAYFOxNINaEHVH/fjSt4f4iAQuPskVuqKYc/RSmIW2YxwvIj/TrI74T/HjuA9
	DJp0Ga95tkiMucl8c+Uqvhm+XDnwM1FlnZUjdy8PVAaPv8Enx38Z3iPtQUdpG8YHuRCDRBisJaX3J
	JhtaB/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjmG0-0000000DRns-2pfp;
	Tue, 14 Jul 2026 23:09:44 +0000
Received: from mail-centralusazon11011031.outbound.protection.outlook.com ([52.101.62.31] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjmFx-0000000DRnT-3ce5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 23:09:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjcSpwpeYNDUMACccEB6n2EkZ9HIBawrUU4CUC1EYmIhb3ksiJR0czWzS1+Y/5XAZzAbhg/26OUbFcw2nCvYQKb2vawVHm2bA8hjAsyQQeFu6N6/ihR6EWrsDsds0I5VzihTtaF/0hcWWj55vp+y5s3uYCooR/rwZuBzjXcjmGM6cWucFED6XZly+6L/xLIh3pkSxPK8YS4zilf7Is1eg/frNNpAJYDnWoexVqgaAZSgbWfZNp0fxXRUzlm7+rmAppergcyDaWfYm+B57Co6y4QX5jMZ1jxoB3ragryS1xC49j6oqcxUupJhmpcZSpP1Fb3nqXY9PzQU6kAOQmDLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovu+MJpfmO8hWq7ZdCSjO3yz9NllpzQkyfrDB5S72dY=;
 b=H4KcJkkcgPQ+Jzx+yeItMnbl8bGMjweQEys8VRNmJHM9VXbm68ZIjypDIG1KDZeRRDY9t0nx0AXgi4TGh5Nr8CHRR1QV94Jm0ujB7GPffWom8Ug7HMczW1AO7HjD8e6QQpbPhkGYglieOKCZV5ip4bK6QgZE4aGboTcEfpj2ab4sERkzym8PJ0ko+wNZ9+VmWIlj5CyRRsS8LP0dPDsGipC7Yk2+x23KArCXwOONnusdFB8Wtm5m3wP2XvbX/oV8YOwoIGiRbuVgde427HnxRNC/k7U7Iv68DFXgno9zGN+JmAMI5P7C4YrakoocR4FCjiMgMYFVuxnTCaL7pHhbmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ovu+MJpfmO8hWq7ZdCSjO3yz9NllpzQkyfrDB5S72dY=;
 b=ADN1QfoFphFOKR3TBvQkXbiJfVz8L7PqAOIfWxyX3JWCTIgEWE9maJO7zc9v69CokgcnZgfCo4fZgpFWpEpPWaLgkD+9JE7WLYtvAcIYZPaDk7g6JbxkQNARdS+0CFJz7cQdvHZ6tEaBa+KWuBfsCSfSiOhZkKbjxmxPpeHg+D82cjRKQH/pFBeUVqtRd6DiTcybvHT3eBqnULj27gOc2/W3XDrtV9QmVjA5N3UkHF4wCDbq4nh+nP8SdebmcoYL5S6nIRkEkQ4x7fCxpB+bQmmcUo++S4srAP2xRnd11cfBO1S575ar3WV0AD05VAQglQTw+uf6PPHfgxrObPS+Kg==
Received: from SJ0PR13CA0098.namprd13.prod.outlook.com (2603:10b6:a03:2c5::13)
 by PH7PR12MB5620.namprd12.prod.outlook.com (2603:10b6:510:137::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 23:09:33 +0000
Received: from SJ5PEPF000001F7.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::24) by SJ0PR13CA0098.outlook.office365.com
 (2603:10b6:a03:2c5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.9 via Frontend Transport; Tue, 14
 Jul 2026 23:09:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF000001F7.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 23:09:33 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 14 Jul
 2026 16:09:23 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 14 Jul 2026 16:09:23 -0700
Received: from nvidia.com (10.127.8.10) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Jul 2026 16:09:22 -0700
Date: Tue, 14 Jul 2026 16:09:21 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <iommu@lists.linux.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, <patches@lists.linux.dev>, "Pranjal
 Shrivastava" <praan@google.com>, Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v3 7/8] iommu/arm-smmu-v3: Change how the tlbi describes
 the invalidation
Message-ID: <albBoVkI4KIh+spI@nvidia.com>
References: <0-v3-4e7f64f4e094+85e-smmu_tlbi_jgg@nvidia.com>
 <7-v3-4e7f64f4e094+85e-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7-v3-4e7f64f4e094+85e-smmu_tlbi_jgg@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F7:EE_|PH7PR12MB5620:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c954f7-62e2-4754-a496-08dee1fcf752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|36860700016|376014|82310400026|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: haDhMwbRthmTRygkdfkmbnH9DZkG3hR3/TJ+yaCTEESPQnPy9Az1DN1vV7NPSkQ1yLM28PbwVCZJdlNq3I4777OQ+nqvsWE6oON4fWQA9YmsabTT0J9V9g3c4PJkDQf7IvNaF6kPXMG7rE5qomEeUPW7XTvLJtFcH12rML82cgGfsPmXTZpnmaffTWCFe8YobZLJPivMiZzuUMp5kU0n17PBxuil/Z1/MkqQGXvzG1OBq4JgSZ4LAs/cYveLY1z20ReUTPriQWDnSgBE/EQYPMsnjx05dgVk1ZptRUPX/1SVVvpBcXtJklgdEGx3GTODO1u5aQDN4viAmuIUSDIg6GjB5wAjUNVu5ztepvdSLLPTPzCq3eYkWA9KIYkiBWAN4/moimN8foX2vuTvCdczVbNRXUt9fVRFjJUc6QrTLr8sNtGcoBfAp8pamVlCWfZBLMKrEyR10MbP/3Zdfvt5znE4T//ZVLjpMLzO240sU2N6tkOJG9u9umnz0KuB231TUQseM8N9sd1HExA9vZMfHy6XrqiQ3PmWROvUUl6rM35LpLDRmY/39XopIFu9MmhcdzO8DIw46aUADsg4J7aDNJojoSc0PmZRMer+vLgk7hu0URia0Kib/5gntxVuXdI+eC1CSHWgpdG2qFFM24AdaUZb/KunZ4r+B0iTlcTA/rrfkvQZCNzsCiGQVqTjinfSvoS6UDnrwbUTC8lo7rjp9w==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1DM3AOsM9UlcCusii+FSh03GqRphPTgvky6I4BT+xZXZ+PRQN+Bu65D1+io6/gy8geEIe0QI0PaFqBV3l2Ksz1y6auNaszYEmolRIUEAEMxEgukVhhIPafEBALXewOaTKMnkwaaOoB8Drwyv9G91B6R4+VBJ/VeycNd7JMpDFYw40x1gyqJTAMhu61Y6zeR9tbriYPtAyzcHNLMrO4EX1WqYU062A5I2IrvzNNgx+95TM0XCaDT1BmIR+ZCkwUcTmgeey4rbRl5HYCaF8PqMHdhw0gzmcgZMJzfZrUaD+F4rka7nd0RUo2tI9EQdeoucPp5tytaE/Mu2v8Mv7+mZucGt2lIgqwujzUIZucMPc0a8P2UCXE//VXKRCPeJKS9mh8OifBrH0WZm2uucUHmpRieOELwyeShDNw4dV1Vhq4mhrrHZON3colyJ3PLVaUEE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 23:09:33.0382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c954f7-62e2-4754-a496-08dee1fcf752
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5620
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_160941_936884_EE1E7BE2 
X-CRM114-Status: GOOD (  13.13  )
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

On Tue, Jul 14, 2026 at 03:46:07PM -0300, Jason Gunthorpe wrote:
> +static unsigned int arm_smmu_compute_ttl(u8 leaf_bitmap, u8 table_bitmap,
> +	} else {
> +		/* Both bitmaps zero is not allowed */
> +		return 0;
> +	}

"not allowed" reads like we need a WARN_ON?

Otherwise, should it be reworded?

> +static u8 arm_smmu_tlbi_calc_stride(struct arm_smmu_tlbi *tlbi)
> +{
> +	u8 combined = tlbi->table_levels_bitmap | tlbi->leaf_levels_bitmap;
> +	u8 tg_szlg2 = tlbi->tgsz_lg2;
> +
> +	if (!combined)
> +		return U8_MAX;

As the code checks "combined", ...

> +	 * If leaf_levels_bitmap is 0 then this is a walk cache only
> +	 * invalidation. If table_levels_bitmap is 0 then this is a leaf only
> +	 * invalidation.

..., how about listing all combinations in this kdocs:
       * The pair (table, leaf) below selects the invalidation scope:
       *   table!=0, leaf==0 : walk cache only
       *   table==0, leaf!=0 : leaves only
       *   table!=0, leaf!=0 : walk cache + leaves
       *   table==0, leaf==0 : a full invalidation
?

> +	 * Level bitmaps use iommupt numbering: bit 0 is the leaf-only level
> +	 * (ARM level 3), bit 1 is the next level up (ARM level 2), etc.

Also, the driver calculates ttl via the inverted numbering noted
here. How about:

static inline int arm_smmu_bitmap_to_level(u8 bitmap)
{
      return 3 - (int)__ffs(bitmap);
}

?

Then, arm_smmu_compute_ttl() would read slightly better.

With that,

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

