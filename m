Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035F7C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 17:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVc9q7jY2sxB1eWVO1hhgTM+qPxcUKZpIAq6bU4E2IY=; b=x6IqLer884FQw3KaRQ+05kk8F4
	eWtWZjyLeyX0ZcGLPQeL5cPcQLN/j1nnmgXT+1IStg1IYMOEQIJpIf4jFfTYZThjrPRe3upn5y9kg
	ey7+f25X1D9S3J8A3XW/URYuxPGVWFqZH+4wntIfeJeM80aEBbPKCKuasLJBz/aLEDSgjh2/xjtFd
	Ogyf67tgm5X33G9cs/4HXdGZVt8ND37HH46pRYaasvFJ4JTMG+0uhavRVgpu6C7VBWSq6YcBsXMVG
	Sk97F+8mNUATBp9JB/yuC/+e8rUNe/xphKNGEr7bYvinUYAxdWTY6uDbCBqdXHT6/h0h8GNxOS66V
	T6tjH8Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuw2W-000000030iP-24ml;
	Fri, 14 Aug 2026 17:49:56 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuw2U-000000030i5-1EGF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 17:49:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDHgmJVQzAWuji3dHPZliTDdprKFuhJdkSwjuoBOdJX1y5cO+/HQQqyKapDvAj34CR2l+ZFubvWtOYeMWVAuD9dhiRCNCIrMh9fQ6jJfIGb3WHsSleABu/8v1kqortyzYku5RvkcGaOXjlCl+297tQqN5mgO5XS9/Y93OzDjTO+O7v1VCNgitVWIcZKGYaBC1pJD5jk06MG1gzyWp6Wg1loAZiKuXiMrCskgY9OZxKf8PbdWImt1omw2iJ4ge6LV+oBTuBHYhqNpVK+zrpyNqWHKoLNFEufCOsK4zAOTuiczGreupKupw/F+barJCl9Fw2BNO3af1yZmqSmG3K3qZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVc9q7jY2sxB1eWVO1hhgTM+qPxcUKZpIAq6bU4E2IY=;
 b=GS5mt45R3eBn89+8AejI6B+o36+iNw+bQIQMr0AC57zgQHXZ0B8DlFFBMorShFEZnnWHe+Lh7A3CurZNL23fChc9roLhiFwrBuuF7V7H3YCBwCfPKseXqEN8b3mcZYrapWQJ0GNtN6I4r08I94a0sFVqBLpC0iuI0HvkB76dEhEX8lpyE8uoIcrMfU8gBNmWM29hXnqugMmAThnyWAmARlkJTGXW8+EL+cv/c5On5SPQPgkZoDoWKtnGqc1r1ipsE6BqywSjQ1akHhyFnvFacDAKWZcU9Uz6VhaeiZ5BQih9w4rYDd/KrFZzb4K2hIKhMP1iVdprEVBC1w4XXhmTxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVc9q7jY2sxB1eWVO1hhgTM+qPxcUKZpIAq6bU4E2IY=;
 b=lfPCRt6kkoSaNJlwYYt4v+vYlMkru+bFaF5bhn+POGDbBwqLqx421aasYK4uLm+DY/dOaMOrU+KFzzv0TVKFAjLTnr34+N3Jmfryb5238nT3hX+kehCeHqNMo1L82xWVbrp0BFt6XnOk/OrmYTOukp5ziEgqJg1UB9OIblj+3a1UHaxRHgP/K/7v6bLL/jiHY62UFEYNtC+uT+qyoAf3XJi56Fe7p1I4pIvyQK5Jxm9MUXVcJ7SU3qwuhJaooO90eugzSmpF0lESmy1lIDX01jTeGjsqn96xOO+chOsf67XHXPQMYD9PjWR+SegQSjdP/Nd4xUm7byNnJXNUly/C2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DSWPR12MB999175.namprd12.prod.outlook.com (2603:10b6:8:36f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Fri, 14 Aug
 2026 17:49:47 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 17:49:47 +0000
Date: Fri, 14 Aug 2026 14:49:45 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: Dmitry Malkin <dma@nebius.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [RFC PATCH] iommu/arm-smmu-v3: Allow nested attach for PCI
 bridges without vDEVICE
Message-ID: <20260814174945.GD510472@nvidia.com>
References: <PA1P190MB25578C482C8A3B06A4DCC6FDDBDA2@PA1P190MB2557.EURP190.PROD.OUTLOOK.COM>
 <an8jEbT9pAUYfsvR@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <an8jEbT9pAUYfsvR@google.com>
X-ClientProxiedBy: YT1PR01CA0135.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::14) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DSWPR12MB999175:EE_
X-MS-Office365-Filtering-Correlation-Id: 727cbb89-e0c7-40cb-c414-08defa2c6e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|22082099003|18002099003|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: +O0JBTLh8C01WgGtb9Yu0CHfOiNEbKBSbnBDonSeyFsL5pUhiy1vgJtPWtndrl4NhyRn7iyqKq4yr3d4I7TCQFmfVriEa/88GfEBn9a1fJWLwmIPgk+u+ujGwptV9kgzsGmJPxTuPVeJzaoRqxjWvh1SK0TBpsVQXdo3RpV/VL7B5ALG2FUjciFhZKnGaUs+oxbKhHIFA0xWdHR2EDNKVhnd0DrCXcdI0pYSiAxxzB0lg7WjsZQK1MTXKC8ilLW/51Y1abOozkP05QY0Kczt1XntxhW/5ZlJliS8JO6pvwMqzBunnhSvR4C0/S/fbTVjPdp02JalvHtL1MBNWiowLZpGA45KZOv8O8wmZWLz8wBRzW3bFQIS0++BoG1PrUEU4S7lJHTNRdtTSDJbR5CHV+dCu86otJUqRqFTZ0S1CYqdj9zPsu/DLaHwD9r98jvAosXy7si5tkeRXljodpbeFs15IQCqQHLx5RKJho6JQbCftJguUV7RwHnStDQjssSd7umgqp0U3+eTzJ4GeGSfg6BtgjceYha+HFfmaWzsuXvhZSlwbUBpe/p2+081RzQH4Q8h89w0ozo2t719E4VhgpVCKbGMFeqBU28IYGqiBDxRzpfIEJPYFCzvuvQfr5krZNswxKBwx0GmUvc+iyYYO0xGZMOeieNMIGcHvFfaSCo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wkXaiTCTfLaPi1J+HK9h+D7h/X/Vrnx4HqdAj2LSJi/W2khy6/VsVEHKBqDi?=
 =?us-ascii?Q?8TJbYyr2tycf4r8nJaCvutawg72dNE4iMCnpeXclG5sDh+xoevf7QkOCkkCH?=
 =?us-ascii?Q?Gbpley+GZCrzo0PIAk5oQmt7bQCvmh4rxha0etyNcQCbBKhrhDDxMHJa5Txh?=
 =?us-ascii?Q?dDFTDKl3AzG15I1f1McO2UhLsVjL2pIhRa0qqnr0/CXLx1lzoiioM/csAOBJ?=
 =?us-ascii?Q?aUXFjo+E9JEYyaT2CMZUl0wkBoNgw8iQnE6vG4Q0oFv2g/9bRUeamM6+9/aW?=
 =?us-ascii?Q?mB9+Pzs8HLvpkNmTeNm/vsevqmD+S7aQBj8DjgdPzHv5o/BLRAeAMFYX4kKF?=
 =?us-ascii?Q?HHknBDNVFY7IoY3r7q2sABK76JGoofTy+E2JLZKPR3XZah6CRII0z9QQLvim?=
 =?us-ascii?Q?eaPCJJbCDCzPSNIrLcGXUW4782x3sP7xzkXbb5J3CUWuoprhKhiI6jr0CrNP?=
 =?us-ascii?Q?7vr4z1g9EAcuywM8VNftiavHGoegiv+S9+8Wqb6M7Tt7RmcHU70ZRRDf1l+Z?=
 =?us-ascii?Q?C8Ty/wciJ396IOhsncfaMGfo1Dq8L1GZ5Bxz6jqC4MftkasAux3CHc26A8EZ?=
 =?us-ascii?Q?+85lOlMJ79VYaabbGsWWOCc25DI6Bwu/nR+eJ1A6Jb/MBUzB295Lg83rhSyK?=
 =?us-ascii?Q?6utly6ZnQIrhHH8w4ZLux40dTS/za7DeYmsTPCWDTVQ23fglhgsSvxJA35ja?=
 =?us-ascii?Q?fkGJ/m9ghcBf9MPJPvsKVAmhg5ymyaXhFIbfKo9I+TZ1Jil08P04+6TxwJTr?=
 =?us-ascii?Q?rqSnPcAyW4FHOf8iuMQppEtdrYM3MFybuEkIQP/KYyNXtgXSnO7Q3w+CIxMs?=
 =?us-ascii?Q?G4Yux160gEkBb2RvIqNEGH+IfOXlFR9+EuPbM/f0HxVKPYy4qTkXlZ96F0Ba?=
 =?us-ascii?Q?8EoTmpwvWkNv0Gb+cQelQV4rnahZL6sYBHaLs3uXg5jYIjGfElrHIwuF3z5p?=
 =?us-ascii?Q?7t32MZCQSTfmdKzskCrUH+CU7H+B+38vKr4lsLVUSUEb/3w8jiufko7K+2hs?=
 =?us-ascii?Q?guYR4eCYIeQXqinTldEmCTnL21wYFgPPqK+vlm+m8+kkA8T35aAdtjyReaPw?=
 =?us-ascii?Q?SAyPsNsF7YtfJxd6NpYK7dmfkK3If9U1mb0X4wTJFbo+YKykJJYYaIb03Mb7?=
 =?us-ascii?Q?PUzPulmOOm5tDicJ1NukZVifi2UP7Z68urxMoBGw/vsHMKImBq07+9CX4zut?=
 =?us-ascii?Q?4h8KS4/2BlrgazUZCcje9+4V6lyYWWPgCsgQ4LG09TWMuHcBhMEWYRzzr5X7?=
 =?us-ascii?Q?XpiGSX97ZjqRXtVbDqT1dXhXARV55g0lyfQHpSrmZFIHCIK/XtH0Vy4mk37P?=
 =?us-ascii?Q?2K+jtp7GlQdk6dmBVmoi7jQoOZYrXNNM9A7dBNyyFIcJk9MeMzwxr9U5npZ5?=
 =?us-ascii?Q?R/JA2j2Oljhf80GrlL20IWpbBR7WXw5b8k53B3n1FdHYUF/5ixcggaFytIFj?=
 =?us-ascii?Q?o2UvIIC4dwvZNIkAnep80EUbbW/Mp1MiYvclV36oOHj6QY/r9oAvw81rU7iC?=
 =?us-ascii?Q?nLkwYL4llCvZWsa+Peoo7FuDve8fFk2lxIBB+3NVKr46P0ZhglhFOfRrE/5E?=
 =?us-ascii?Q?D4nCNfIcNz/a8FOsJMIFOIpsMqKcGl4H9jd7v9pzKXadiCGb2XsrB7FUocLs?=
 =?us-ascii?Q?In2RN8uJiU2vrNpiYL/oSpFfpU8v448jKJ/i8PQ01zYW9QjWM7THGFrgfd1Y?=
 =?us-ascii?Q?7SN4oEL7gBT6dUnjAURDIh+bcgQxGEmmFf0QD2gk9n7wcZVqM11Az5z5wkgY?=
 =?us-ascii?Q?dZ+qhBKXeA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 727cbb89-e0c7-40cb-c414-08defa2c6e40
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 17:49:46.9810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4S2M8mkCSEYg/KkDcFzm67HeE8AfDk7Zu0TeOUEahgZJjNnF2YO/MfmOdzg/vkK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR12MB999175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_104954_357206_F1B13359 
X-CRM114-Status: UNSURE (   5.94  )
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

On Fri, Aug 14, 2026 at 02:15:45PM +0000, Pranjal Shrivastava wrote:

> Also, regarding RID aliasing: while it's true the host bridge doesn't
> need a vDEVICE for its own host-consumed DMAs (like AER/PME), are we

RID aliasing shouldn't exist in any modern system. Unfortunately Linux
gets some things wrong in its ACS processing :\

Jason

