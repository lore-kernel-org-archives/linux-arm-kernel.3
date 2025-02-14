Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25547C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 17:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQLmVmPA13zm/dtcsU7hfhHLF+EPo/Fm52RxrhwEddM=; b=2L1vAHUjUDxiYbzgKUdIvACHKU
	/J5X06GbZJhGAHWxI6lOuYchiLylt4/Sdc/YGbmbaktYXxR9cuWtg+9VTUupNfaiXHo7FFiWNqJOV
	YE6tZmMFTyMweoeRO06D5G52Q7Ex/2TuhkOrDw+MIODOzjGPDa5l56sO+GxmuZH6cfxMR/Ac72KWZ
	at7yIVVEuZqfV0znwztHE39GhoCj0kXiVrhz2ISUaGQr+z4UZgNVcWYn3g6yUqATZ/KqgxJjVH+GP
	4uDy3zxf7Ah1GQPOrBkcq6+hSdVGnc7ucn8KaMArGN2PAhoIWKT52QL3eZyerH7oDvQBsLbFeJntl
	V3pmw4RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tizXx-0000000Fiy1-3C0p;
	Fri, 14 Feb 2025 17:32:13 +0000
Received: from mail-mw2nam12on20604.outbound.protection.outlook.com ([2a01:111:f403:200a::604] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizAp-0000000Fctu-0nw7;
	Fri, 14 Feb 2025 17:08:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btRHCCjKCupKRDCId4yTOlFRa3k2EqMfNcJO8F89CAM/KEexmaIFqki2alC8SE4EXVmCZnWhiZLtghfzeqyxo7zJS3jJVUV7xRiHy4xxA/a/2FPgh95zpElOOxx3EATZ9/w5FpIc7023jNPQb6QA0dZTkosl3U8mfzq2KQmsakCclHRGTMHgvSQEXFDeoOWcGrAaqZlwUIF95nyhZcgBAEcBqYt+BbHPpxj85rVm94+imGVD2Ls2wP8RVL4pMcGaQGlcBnCGEJwqaERQ0jfXdgbrzrNgWBONOwaqljZ/wtGawhNXLsp320ytuxbYn7ZzBmgrz9DQf35yAnXXSdf64A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQLmVmPA13zm/dtcsU7hfhHLF+EPo/Fm52RxrhwEddM=;
 b=TSARs5QpDSZFJ7HAOqLsBuMuJqYjGLtq+DCOtEnhjvfk9WGpNic3nax2v90dpQ+NRL10SKaZBwtvbZdDJEFz/mjfFmhyOyO67d4YLDvHiSqVkfpgsCZo/KsEPp/WaSrp42aZ4b1rAYvooT0xrEC4JKW2AuEbmY5yxYYRvIOZ4zkXtFaumRDlUHv/I/pKddF1AM4xVrALY7dK3uJ8Jot3fWJ7IEBmsOPzZvB6TmYLQaNCsCSD+y7cQ0NGtal5bbqxAgE+4dctGbh/+O0cqhWmKNTlFAhYKsuRKgvPcjHLE01M1IxTEeguR52ABb1DmzKH1YAMhcEtgwcNgedhjCCukw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQLmVmPA13zm/dtcsU7hfhHLF+EPo/Fm52RxrhwEddM=;
 b=T+41pzmbKnOYjn2RaYfTqJBKAhPfUtlxtkzL1Z8inH/VK2WuvXy7sphFt70LsE8K2dYO3H2N7rtXcwu0m7sEBN9r5Sh9DR3/t+RgqOdjSy3h0DoCVZNif6x5fonkVyp978J9CdkOeke38bJQTYjraKnojhVQLcO7656gFH+BJGLJk/uHSVCnzSSa2iPNEUl0HPb+N/gPHqw/cdQS6+av/ZvLizBdI31dIbAGwXcrAeoM3YPkYqiso4eMt9VgGVEC4aUxPMg0jXpkQlO7t4rya5JSa2p9vWLk4P/aY/+pv14jIEJcsizHcZ2oKr61eTkWhTnMDXLkdJm22ByqBn2/ig==
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
Subject: [PATCH v2 19/23] iommu/riscv: Update to use iommu_alloc_pages_node_lg2()
Date: Fri, 14 Feb 2025 13:07:52 -0400
Message-ID: <19-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
In-Reply-To: <0-v2-545d29711869+a76b5-iommu_pages_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00013E00.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:1a) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e070c8-5e79-465c-5533-08dd4d1a229e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TjpGDZc1osKX/s/5lq+WO3JhvkEJgGGsWBZbZ8/KQ1lngmm5BIeNyg7/KFbk?=
 =?us-ascii?Q?zjzLNZDGjH+K/U3bUzrDuAyQPIwy/dtuSj42/Ua96sDLm0gyMtpZgtHcilBW?=
 =?us-ascii?Q?vEc4SmhQVQtR/hj/K6mcybQQ768RRclGSBXOFye7UfLM/eXlDQ0wQjNwlp6J?=
 =?us-ascii?Q?fJ8RIv6BswrYi6s0dFkkj1oWNm9SA+yXGbk6WV9XvG6rqTM4yd3ys5NWmWIl?=
 =?us-ascii?Q?dMv6irB2hLgGwu37UGWvEa0/+oM8CTiGE9dJeyr0ijuLlwx2uzlfR30usLKb?=
 =?us-ascii?Q?Oll1cJMQA3HCD7XHw06dNMV9jVNmq3tCOf0/kmMC73U4vE3BfA07qa9eCaKZ?=
 =?us-ascii?Q?p9f3M3zLAVHjAlDCIziDVbNnvh6JVVFFMwjvinlpPSDrOAZjR42JG78RM62k?=
 =?us-ascii?Q?ejL9ZHqC/eLNikXb+jI6ux3ixU9+jtx5kPyysQztI3zKL+81Af0hrfFYMdxF?=
 =?us-ascii?Q?OpvGh08OpGqKsq7M967bgsKLXkcb43p0WqiNwN2CsS5l0slOKZlsIJU+8wrN?=
 =?us-ascii?Q?fc1ID50o10lpMViEPtXxKT0Bglm2OID1SyHFSifTcjGvdWaq2Vis165Uauce?=
 =?us-ascii?Q?wL19Oxaw1dkyA5mhvSiwwM44aOjqnZTbwc9B7milXh8r9aJyCdYViz01you5?=
 =?us-ascii?Q?zFT3pfpGihI7XoC+BO5XTpfy112zcKYy77wEDP+BB/jp1nRhCRys9Np7V232?=
 =?us-ascii?Q?ncTVUGJ6CMMxT655Adn6UkDUc9lC0VFukFN+1aZhCz5+vErSOSsPXPzgRYs8?=
 =?us-ascii?Q?G0Ag1Aa0iR7jYAcGGlp91uZqJR6x7uNqLPhZEMEw2r3Eq9OunwGZyoQ6uVLl?=
 =?us-ascii?Q?v9FBd427t3zTF07czYtopuCg/H6LwjeYu13rYXl5/PmzzJF4UdtvIQy7BnN4?=
 =?us-ascii?Q?fKivXknP8BsTgxnN/Yvws5vHdGO9qtUfbkWTbDlABXshF3WMpmta+NhBdBaO?=
 =?us-ascii?Q?eOtCED38b36S7aH52P6soYmso/zSbLatmDTJypuWqKfRCBGpdmQxOUttKBBL?=
 =?us-ascii?Q?2uhpyWx0NtlaWahcTqZvQuU68SsXe/P6ZgI4LLbSw/AJCRPRlFXD+/S83DHO?=
 =?us-ascii?Q?JAaIk5/gEt6otJJf5T/2CLvvO4fBSYU/4gI1SKv72eDjuyESu8EKp1YKvvKs?=
 =?us-ascii?Q?vkz0lw8vAXwzumunHU9FGGCqPj5gNdao382ilxyOCMEgcCMAABmmfrJcGoTF?=
 =?us-ascii?Q?GQikyA8IZOED3dR1nrutSN2cj5iGsUWta9puNAnVOOrA+PSo+xgpHXFr/ls2?=
 =?us-ascii?Q?JB5ZobyTTfm7RpZgHaN3ZgKlQttfrgXzl3HplKJqwwDrJxnR/IIy2jxNez74?=
 =?us-ascii?Q?gscSKF7QqM5gxbDrHDe8OkNfGxc7ZKeSOYloFAES2X1m8Xi/2v5CgGSMjiZ3?=
 =?us-ascii?Q?U8iUtGKHvrgYoz2nHtGBAu7nia0fpVkBN9QKbOsEMrtO0vnRRoO0+2MvND2a?=
 =?us-ascii?Q?94JZA5kSivM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vN7ZmJbBKgjoBmrpB5U+sVMviqcsB+imfByRxpH3ndOYmA6lxG092xZUGuXC?=
 =?us-ascii?Q?OH/q2Nzc7Zzk6S3a5rDFCdW3wLehdezvq/cr5967j9zVqXY8psQd/vqzysAW?=
 =?us-ascii?Q?wovWMtMBn1GW5YHMhQvnDL2DoRIf9y/mEVi0lwMHR80oCsWMWLIRNjhYGbdQ?=
 =?us-ascii?Q?GxA1fQ1427kr3VwAdzuDZFzyxfxAk6x0M9ywUiV7qyJTb6+dKgWwO0wJiwtQ?=
 =?us-ascii?Q?XXRope3ocLNmKGWZzkBHnC9rWxsyK+onuiJ1QUxHvgJ7WmHuxsnk1qS/sR4w?=
 =?us-ascii?Q?IIEbWCn6pXGzIKS5ECn0jew2Af7RmTezJMuHvDqsz6/JKPdSM+wq2y3UT3mp?=
 =?us-ascii?Q?+dxCuu8bvv7e3h/SAdSaMOrmOK6wsX3UrH6fS4ou5gyXij2mHP0D6lX3gyZK?=
 =?us-ascii?Q?YvQagvwbVq22//fhFqFEBMpQufn/W3PMcYZ7lgu5oQER000ZtA30a3vcIFmn?=
 =?us-ascii?Q?V/8zTErLLI0O++VGox3XxMAApeHx4iSRrJpQUSEn98VPYxsf2BvgxdBf6kKV?=
 =?us-ascii?Q?YUn/f4QHdsCTKeeEX4FLZUaJgIYmXrRZ1qb1DSm3DxxiGK/xmiYlHxbvx2q3?=
 =?us-ascii?Q?ksTRpHkNugAPuyTnNJKfQnuuXQ1FXV6u4f6scL3Uq4Ukkg8TTLmb81yVd2qX?=
 =?us-ascii?Q?305ZrrcZ56qOEugsHFvUs0GaQzFsKDZI0dixQ6PEe6PdnOcRbb642EAGDFqb?=
 =?us-ascii?Q?Ly/Sl//v/XFZ8+Izlayaf+7U+cTCFv2uKW41KeXzU7BldHLbkn7+eP13Zt4D?=
 =?us-ascii?Q?h7mXQD1o4I0AGJCbc2uQpiP3zo1zDlzbWFrQcd+12kfNx5pURvWRRKZL9RZJ?=
 =?us-ascii?Q?0IUkEAj/k8ZCiVtW5qGnDm++ojdikPTKZ6FEhF95JKsHDINmQDw9SwNXKSDd?=
 =?us-ascii?Q?f9/7oGxlIIFbXDkRG9dKrUVtyYMKbY9XCgLtqflN0CNq6ayy7Zw4oBza328g?=
 =?us-ascii?Q?Sq0guhLQU/pLjj+/IuVkLbDIrXIL/zxTHd4iiGcFwtngVT8keg1I2HrkeDvo?=
 =?us-ascii?Q?eZMoBk6PqztHL+rtB4cmDQ1XgiX3zkOrV8lTdAhOFGAiGjWfW/UHTOpVMqwS?=
 =?us-ascii?Q?09yJZS02TyOIOgLDPuvKORexnXGP6H+InoBhKfURy/lA8ztHEXI07nrmRfwV?=
 =?us-ascii?Q?mSUol4p1i1rXTQUdk7hEcPQ0GTHE9il73pWu0OU+v34ZiLWuMwIbCcDQ57bW?=
 =?us-ascii?Q?oktqEcCsoGAFaBMOSfmwDxovvM2OYmCaIn3J+9pj/tJpz9k5OH6Xh7dRed8o?=
 =?us-ascii?Q?FGEJ4iBH1JXV40jK+s+AeRdfJ2G3+wbYB7Gm5lCdDAZ6xwcdOYgu3MzW0hhl?=
 =?us-ascii?Q?ophAcu/EJ2isBIqiRI0Qp4b2nAnL8HKWCu3G8mhye8nGqEL+meVK8fDqsP1E?=
 =?us-ascii?Q?WsEMNbCyB/mUKkjND5RK4QMQoAQc+LX8QWmuRlw64Z8KSKB3w0KGg/9wd26h?=
 =?us-ascii?Q?DggA/tZiw0AyywjIaFuvv3VqfHGi845z93kQM0Q7U6TC1nA9eiTPTC8wsH7Y?=
 =?us-ascii?Q?a4GAUso5A/0uoEPJT7OWfqPfwJ3dME+qeXpLThFeH03LL1qVuC8VeswWzogV?=
 =?us-ascii?Q?y5uqDUfbb67Wuk2Zh5Y=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e070c8-5e79-465c-5533-08dd4d1a229e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 17:08:00.4400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e1h3alEuLNFtjFiv5edB3Vzy2kh0Lg4MSG9zsdMy9WK2w3dqJIizzhz7AN/sBGNP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_090819_238126_D13BD9A7 
X-CRM114-Status: GOOD (  10.88  )
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

One part of RISCV already has a computed size, however the queue
allocation must be aligned to 4k. The other objects are 4k by spec.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/riscv/iommu.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 2750f2e6e01a2b..8835c82f118db4 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -65,13 +65,14 @@ static int riscv_iommu_devres_pages_match(struct device *dev, void *res, void *p
 	return devres->addr == target->addr;
 }
 
-static void *riscv_iommu_get_pages(struct riscv_iommu_device *iommu, int order)
+static void *riscv_iommu_get_pages(struct riscv_iommu_device *iommu,
+				   unsigned int size)
 {
 	struct riscv_iommu_devres *devres;
 	void *addr;
 
-	addr = iommu_alloc_pages_node(dev_to_node(iommu->dev),
-				      GFP_KERNEL_ACCOUNT, order);
+	addr = iommu_alloc_pages_node_sz(dev_to_node(iommu->dev),
+					 GFP_KERNEL_ACCOUNT, size);
 	if (unlikely(!addr))
 		return NULL;
 
@@ -161,9 +162,9 @@ static int riscv_iommu_queue_alloc(struct riscv_iommu_device *iommu,
 	} else {
 		do {
 			const size_t queue_size = entry_size << (logsz + 1);
-			const int order = get_order(queue_size);
 
-			queue->base = riscv_iommu_get_pages(iommu, order);
+			queue->base = riscv_iommu_get_pages(
+				iommu, max(queue_size, SZ_4K));
 			queue->phys = __pa(queue->base);
 		} while (!queue->base && logsz-- > 0);
 	}
@@ -618,7 +619,7 @@ static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iomm
 				break;
 			}
 
-			ptr = riscv_iommu_get_pages(iommu, 0);
+			ptr = riscv_iommu_get_pages(iommu, SZ_4K);
 			if (!ptr)
 				return NULL;
 
@@ -698,7 +699,7 @@ static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
 	}
 
 	if (!iommu->ddt_root) {
-		iommu->ddt_root = riscv_iommu_get_pages(iommu, 0);
+		iommu->ddt_root = riscv_iommu_get_pages(iommu, SZ_4K);
 		iommu->ddt_phys = __pa(iommu->ddt_root);
 	}
 
-- 
2.43.0


