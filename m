Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC6BCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NX6/G3q/A2aOK2BP+f/VOeIdQ/KH1BPplZXiNAxycVQ=; b=NGb+0B14Q2oXG/uwns19h4A5Gz
	JBIWC/MQ+YHItLauW3Dv2UPiSqRhweS6eN9d8wZTBbharlfoBw8JjpLrI2Xl0/25+imZL3XUm9PfR
	IJ4LhDpjrgBloXYpAiH4oZt1xZXOudyxd1B8JTqIH5lKb19/MOelP2DRq4VxlnVSWDXFY5EBsPpsr
	YjbzW1FqMNuu9dKHKID16FpyGQHQFg2O2lUoPbpHTvCMy/f/y69+w6c9cRmkQfFVALQEYmmB8HrP2
	5rb2Hc28ajJ3ViejmBunyd1DckgYd9Cpy3C05moFxk+0wVphVO/CdEF5ootS8C3+pGKfRw1iWGlq5
	42RIPngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcOf-00000003kBY-2der;
	Wed, 22 Oct 2025 17:13:13 +0000
Received: from mail-westus3azon11011038.outbound.protection.outlook.com ([40.107.208.38] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcOZ-00000003jz9-3lRi;
	Wed, 22 Oct 2025 17:13:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPKPfi9g+9aAtYxx1csdvotvEaCdaK9gBdOvKk+QIFeCTwVP8FDkFPLJVddFV6GoVTcbfGUVSI8m5Bp9CQakxXh9nnjL4j55hAFbg/hbkoeXBOt0O6iRRHuV+9iCILEU6nLwqCh8FJ2wcsRzvT4Nh6NcVPxKHFmBvDhyO35UG3InTpSLYNEbka8rAzfwyPWPEBS9TR0v6/VD7N3K1dMAFbHquipwnPm2HnoP3a5Lbr8+te1wdhbQeVyeayWFNOKFlAB2OsDuqlK/4f/W8BE8IV8AKp1jd0sqmdUXBFhuOhnUqeqp7gb+qWzlq/W1gD9n9mjsBydo81/ei5KIVZqTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NX6/G3q/A2aOK2BP+f/VOeIdQ/KH1BPplZXiNAxycVQ=;
 b=Es3J4D2KsW7KmttDV2vGA9KEUMrRgUDytx9IWXME1ci1WhqxR4z/aVNSpNpTY9zaR/i/J/AI9QoxX0Ccn2SDmvydCDjAffWRgcSiN7zijCqZSFGIiKzmuKyvifS5nerNqzR4AAzzYQJ1UplAH7N4VM6PlS0icCBgeRSHp4yDlX6S9vW1+zVpSbc5mBxqyFlUsNlQjt4auZr+U8sq/y4d0MTjbGielY7E4nCq9vQktXxY/Lx8CzarDdJW9zpxK0lLSh18rYMANXQXmqfaXn/DsI0Ne06lYWSH+qx5HWMYBh2hiY/3oORgW7ldjgsbs1MJoouySnj75hlZssJwRBQ4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NX6/G3q/A2aOK2BP+f/VOeIdQ/KH1BPplZXiNAxycVQ=;
 b=oXBjr8KVwnUEHQSP3iQSCuU1keBbdZl0VXesQCEq+eSzjKwLcfBD+THjS0oSrkaZKGo320RvHcm3DbedHjiuMXIeAOYcCG36qL/YkMa4QVV0HsoYDbZxbqFwktKh0TIuAQzMYEUA6KL+751Bk0o1WHqBnjIB8T8oEPSdaSZnJ7Kz5Efhl8oygES9oSX4dNxCCb1nGoDW8x/VaMJnxBTRlCQQyF/a39ksitVvYkpVweZ5Xp0i6U+6n4mGMTBAjQXPTX/XY21i5Eg2IS1VAifD1xaPJ2C8pkOL2xhcL/U1p157ux4B4gRZujWZguuh1UhUcb5JPmUpYQP/jHnQ+GCOKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 17:12:54 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 17:12:54 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Benvenuti <benve@cisco.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Leon Romanovsky <leon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nelson Escobar <neescoba@cisco.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>
Cc: patches@lists.linux.dev
Subject: [PATCH 2/3] iommu/amd: Don't call report_iommu_fault()
Date: Wed, 22 Oct 2025 14:12:51 -0300
Message-ID: <2-v1-391058a85f30+14b-iommu_set_fault_jgg@nvidia.com>
In-Reply-To: <0-v1-391058a85f30+14b-iommu_set_fault_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR04CA0012.namprd04.prod.outlook.com
 (2603:10b6:208:d4::25) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|MN2PR12MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: f70aeee6-58bb-4821-1013-08de118e3d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FvkiCe9KNwYQc+Y9s9UiXPZoqg7PFuUM2eUY/lIjWbv+Xvd0JWFt1B2ya7g/?=
 =?us-ascii?Q?AsUvbTxwpsmvTQj7YoWqvkhySIqP11WQo/FdZfyXGYU1M9DEdTOvOk6yCU6l?=
 =?us-ascii?Q?zFeRd2tNmFHe/zRe2ikSc63Pe5RT6eUsgwL//qoZanG4p246IYw4JMpCkU7p?=
 =?us-ascii?Q?ZIHfe+EBJVlPYQAA/FdHvgqW5jWY+BUXHRIvBPQ9R5iLIKvdrFx7nFqD+obh?=
 =?us-ascii?Q?UUelsvGB9+2LvL8dovTnAWGyrDZbUyOW9WwmkL2plawfc4POiTZjo0IexCZE?=
 =?us-ascii?Q?X6hoS/4z6GttF/cspumAiWSKDl9mJAAQuYb6YIJR5Tgjsql3/eIb0jAhB/06?=
 =?us-ascii?Q?UzfW2UEox89tbP28/AvZTJTznHm6c2OrBxea4TXAcAsmU+tHHSkOuvO1zRyg?=
 =?us-ascii?Q?tPfvNrKnwhO4Fx3eU3Cei2tZ8ZJ5RVlzz7yq+GQDYqU9+ghhA/nUQSA2z44J?=
 =?us-ascii?Q?HjfpUMv4UpQ8qozH1UzkfjRlS4pMKkFnNB4ejed/tgTBRYleGBjDLyFS/X0K?=
 =?us-ascii?Q?2qgMkerrekDV/BA5MAkFFhE6pnMSvS9IyLWfGdYi41rMIf5YLWzVRfdpwDXH?=
 =?us-ascii?Q?56JLQ1iiol0T8rS+VPg8hsi/OZNg4V60GZAGCPRhMYHkFWqI57fwtqws8qPa?=
 =?us-ascii?Q?zm5QK3n1XA0G3phqbnbMQ1P1/sQypxU0+t9PZL5k7eINtHxyRvYV/grrK8zS?=
 =?us-ascii?Q?YoiLQHhO9FoFQdn0sgSqy92MI588mVk2+cxAlndS6fMyBGmq+xF3UiuME2fx?=
 =?us-ascii?Q?sfB1L+Z1jnWXi7GMNvszoQD/r542y0UpUju0xWnJmP0buGBK6MiqQGIFW8V+?=
 =?us-ascii?Q?1ix/HgrB3APAZwKChdx4jjZ9kscTJcQrVALCd/SgegalafSCgxQ2noyXU99J?=
 =?us-ascii?Q?/YKwvI2+D4/tF33fnCySPnI9ZMJZTYd5lMbB64eY36qQ1euxd+gOuZHq1C5D?=
 =?us-ascii?Q?jE+eeeM7Y/7OaB8Vf/u9A512BecydaXksBilQcCF43pBp5ui/7w6muZW2YuL?=
 =?us-ascii?Q?Zawe6X7CGwuSLsJ+poOjCfxMZs0RIfmmtZv7CX+xbKan7YCjCLRu65yUazXb?=
 =?us-ascii?Q?1KRY6F7j1JTYgu92AxcDbmuTQfmA5JUaxDMMKi6+6sAzgF6CfAiK5IHu25Sv?=
 =?us-ascii?Q?IHikajYYaD1a5tMrFc2leRbifimKUBTYgtq2uM7NFGr0pSPMiYPOBZywUcfF?=
 =?us-ascii?Q?lcRd5MRXzQ3v7HWsoG1UBdbeOqZVeSPsf85HZt47GbPA9p5WjB2yxy2xpWxy?=
 =?us-ascii?Q?Jr4JwGHro7WmFOQMakNBe190B2MCQtk1aQPAd4haQDFhr1wGIpnNUWypGD+W?=
 =?us-ascii?Q?clSqUzVxRJIZa15fP3VH90q51dXbkQtulUd2at0yyGPAzIoN0HjFDi2M0qMr?=
 =?us-ascii?Q?l91KOAewiERmKkvX//sitY9lU/gtAemHwG8z1xkJb2xl+TCXtuR5r6xK+xvS?=
 =?us-ascii?Q?5dcYRn28IFSbESkOsbaMf0x94gq/30KUtAOgvllKX9OqNgTWCXzy7JpETtt9?=
 =?us-ascii?Q?yParEiDn9/SiazY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3613.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q6HKPK17/vMzLB5yC12XfxMCt8VO/GlHRYOCdhVImNFo0QuW+7du0cAgD0rI?=
 =?us-ascii?Q?SG572sepcYytLPpZ10vupJaSi7hPqovEaG/LVTpVWBXFohi9+jedvQ6nL6mz?=
 =?us-ascii?Q?k8NTjacwZRR+rFymgthH+lCai8zYAbW4ahv4yDHUwhnQ5/SQgHpAq7M9aX9z?=
 =?us-ascii?Q?tCnH+v2t0ViceMV62xGenklpjgOsfpuLTHznJ0IGFizcYTfvoPfnCgDHwaGr?=
 =?us-ascii?Q?2uKquwB4QhHSYQuAMTDtR5eyyedOBMUD28AFSqPi5CA8Pqlv6uMnc7h8Z/DT?=
 =?us-ascii?Q?lhBDDRbvRjUKCC8SsF+wW7790aeTaQHv+8XDab9eczU+nzd4/2HR1sODtZoo?=
 =?us-ascii?Q?dXD2yjnv5OuC0GnUtPf5ASPvegG5FUMujA77HUWfjCpFolTaolRYKYNe6che?=
 =?us-ascii?Q?lOONYac2qiJOt8TRA5MIUW5DK8JzheJvL8g0/bAl1xgchk4zr2/ZTo4ki/uu?=
 =?us-ascii?Q?PoGIojR1Nik46IU+xH/mEbrEjguOU9Y+1BtvTCe3mvDd6EKTEb7h2HYBicI4?=
 =?us-ascii?Q?7iWBFPVojm6VX9RgKaqxqK7n/Q0taZP1p2vNXz38J8Ahs0o2vnNifp6XjQgF?=
 =?us-ascii?Q?avnv4XuHpWXhDl4VIDVMZU4px0cIm9nSqm176q8i5F8CreJpugELH6P6C/LO?=
 =?us-ascii?Q?t/Gwjrk4vXY71dFS6vINuhITOc7fU7t0EezN+QGwYiW/3CNiU860HHRiiQ+c?=
 =?us-ascii?Q?TVwdL22R5th1csknzcOMSY6+3joN/4YZFtc3xfAClTBT82rdFEf+pGmYJ//s?=
 =?us-ascii?Q?GUY7VnSEsbfP+gYPoyEIM3ZQU6AQcqB1czz8TFfC9Ikg9a59TjRSN0VTIsRJ?=
 =?us-ascii?Q?fx865SKYEDBbgReQGVcJ8rS7jqfzbCzIAzuWvnUG4wOkk7nAj1CFLnYD5y9u?=
 =?us-ascii?Q?CLCxPgXQhjZcomORoWw5zZf49n57jCfnyxUNd0fN2AvWxW4NvJxDzpUAvgE2?=
 =?us-ascii?Q?RTq/6mGkORmROsmxUd5TcpGNJCNdVPhSuivbF/mmyPCNW30G9yW3xxX3QLPn?=
 =?us-ascii?Q?1vUxvWn8h3GlfgMPPdAyrV5KnYZwBwKsbYGBuV5SnfhCwqoiI8FgFIDzRj08?=
 =?us-ascii?Q?S/L6RC/atCPbS4sRgHs09oRPYHf5/iS163UmIJKv5kaccbUjhyX0AYKKSC+q?=
 =?us-ascii?Q?iO1MGQjnklv9PHCcn3UVGMMIjQOhBgaY+FHhNiykDrrQssrkvq1QY/Qp4wom?=
 =?us-ascii?Q?kDePuVvTWFUpXQOi02MRchW68LbSMyP7OunTJi5Rs0umlG16IYxkFp1NLXFQ?=
 =?us-ascii?Q?JMKSEXkOxeC63KLTUf9he2oX5rKU6AejMPA5cOOISmgY0zf9J8/XDFlKZabS?=
 =?us-ascii?Q?FAE5AulupCbxPv8gcuhecgrxwuaPQ41gaUNz4ITKO2EmGEtkpAVFZJeLaTrA?=
 =?us-ascii?Q?eOmkFa4T1zlwupwJngwd/ULrSQzw1MeobkHP28tkrnWEXrP3TUpk+K9H+ULB?=
 =?us-ascii?Q?euCeUWcJKLXkICP3dSXjQGyJTsxZBHTn2oyOSy2tPbifr5kiktTjjdqWrAM0?=
 =?us-ascii?Q?mvEsvxLoIU3wjM1/BpxjSdCKJ/ATklZP3FF5/KHz/+dXkWZKRJVpDsk3NN6Z?=
 =?us-ascii?Q?v95YP0cqvQx+5STAzo0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70aeee6-58bb-4821-1013-08de118e3d69
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 17:12:54.8322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: We9KFnUXWshZWHRO8FtY5nJBIyqKK4EpZRvtIUppM1FksZMUE/qjA0BYgtYfEbR+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_101307_948147_41CE8E9A 
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

This old style API is only used by drivers/gpu/drm/msm and
drivers/remoteproc, neither are used on x86 HW. Remove the dead code to
discourage new users.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/amd/iommu.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 2e1865daa1cee8..072c80bb2c2b3a 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -840,29 +840,6 @@ static void amd_iommu_report_page_fault(struct amd_iommu *iommu,
 		dev_data = dev_iommu_priv_get(&pdev->dev);
 
 	if (dev_data) {
-		/*
-		 * If this is a DMA fault (for which the I(nterrupt)
-		 * bit will be unset), allow report_iommu_fault() to
-		 * prevent logging it.
-		 */
-		if (IS_IOMMU_MEM_TRANSACTION(flags)) {
-			/* Device not attached to domain properly */
-			if (dev_data->domain == NULL) {
-				pr_err_ratelimited("Event logged [Device not attached to domain properly]\n");
-				pr_err_ratelimited("  device=%04x:%02x:%02x.%x domain=0x%04x\n",
-						   iommu->pci_seg->id, PCI_BUS_NUM(devid), PCI_SLOT(devid),
-						   PCI_FUNC(devid), domain_id);
-				goto out;
-			}
-
-			if (!report_iommu_fault(&dev_data->domain->domain,
-						&pdev->dev, address,
-						IS_WRITE_REQUEST(flags) ?
-							IOMMU_FAULT_WRITE :
-							IOMMU_FAULT_READ))
-				goto out;
-		}
-
 		if (__ratelimit(&dev_data->rs)) {
 			pci_err(pdev, "Event logged [IO_PAGE_FAULT domain=0x%04x address=0x%llx flags=0x%04x]\n",
 				domain_id, address, flags);
@@ -873,7 +850,6 @@ static void amd_iommu_report_page_fault(struct amd_iommu *iommu,
 			domain_id, address, flags);
 	}
 
-out:
 	if (pdev)
 		pci_dev_put(pdev);
 }
-- 
2.43.0


