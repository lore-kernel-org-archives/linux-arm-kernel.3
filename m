Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7CFCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpIpCP4uEJEkXPDzjwAmYmnsbZihBAoiaiozj7nDRJw=; b=Rq9vcmi1YJLBl1oPTJ5kQTxeiG
	KcYxuqbR6n1YO+JrUUIoT5OZZX0PHvUDpSxOd82n8ZIrz75s1JonPjhsvybiqgKRTwAZ+UG4qOHZI
	nUEGXkVtWME4/jmPchgyFhlCmCyMxBwswouY3epeZiLCU886V58LDSdkpTHV/UGz11L8N7yFY2GoC
	TMqf5pJy/1V1+baRSdbPSB4pQTeUzr17KZtVdqPUpj2tc+5u2wPiMK4WzFVYrXy8Lw85igFGc6wfu
	vDzS78ATr6ZZPwWUzzJ/iSyG51cILA3Hmu6KSWrIZrtDQpr6FxbUMQME47eALLBFOx2oGqyfDZzA6
	vNZB4Q7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSaa-00000002jwU-3wCJ;
	Fri, 22 Aug 2025 14:17:56 +0000
Received: from mail-dm6nam12on20622.outbound.protection.outlook.com ([2a01:111:f403:2417::622] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upK48-00000001Z74-1bUX;
	Fri, 22 Aug 2025 05:11:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AVsYzvzDDNOZQtSzeJ2FMw3sb+UQd2iHadyW3r/OLm6hwYBFW4ckL2wIwPRK8ldrrC7ubh3dJtdis1Gn/p8AfqfVGP7C4jtz5omgoyMe66LEi++709tOi747pnuPT+aGGfe3noqP+Dyw+HmwToWW1dmDJN+sCJr4I0/DlaZ0wxx/6q02WWCl7OMBROPgcVKzVyRV4Uk+rM8D4z12A1Q2gAi/JSv5Er+qag2LvQ/ajtLqtHZ9X6cgWy8b7Kq0bJwXrYXE424QFZyM/Wsbpp3dqVMW4IA1NUIIAwqChOT2iBGcuo3XPpu3GjYRV0Agr2I5KM9AEUIQIy+v/iTR1vx9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BpIpCP4uEJEkXPDzjwAmYmnsbZihBAoiaiozj7nDRJw=;
 b=JuqcZTyqevJlAj4S+tUhNAwsQX3S5gHZ9Hkw/aF1fN7r51cRwLpoad7R0GCDOwAKlb8iU7jBkHgmHPlXRLhqpTRyUXZN9mFNNvwElDQDz32ZmKIIsmoPG9lKfFDkLrC5cZ7eulW3jmkPFNjmR7oPfcbLFBKo8LIHSXHjyG/JfYf6gRtwFz/qiIIiv45zGP3xw/mouA4Bn5BsrV2bsdxUw5sKJPT50JJSYqd9thCIuYGzed6GipaXp09fuQg6ORZ6k76xyV6uH+ZWeNKyZLXDAkv775ueKwXrPx6pvbcyirF10eD38Hl66EpPEPq/zwm4n08L/GakgnNF84n0GRKFJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BpIpCP4uEJEkXPDzjwAmYmnsbZihBAoiaiozj7nDRJw=;
 b=OsCBn8KXcf3+Jqy6nTa3BjBHMbv9AQxS4nx7KXbq+GDi/jUun0mBHL8l3bhYdTKk9OvFqdQfN1b8bWQ4eA1ytG9y76WkQBKWsfCoGzeVdE3MdwEHhzKtHf//9lo9ABYDAn8qdWddc4W1tVN4TJggnf0Yu3XTL7tTjrRDG9kJF1QpvBd2sI67kgOedk2Cn2LzrdgqcpS2Oa7i3O4IyJq1sYDjAbEu2k2qFqYk3Bz/zdEVXS67RbeZrM7kgTOYaWY3jSW/VrSdseBZs7oyLUo4DBMv21geCcU8Gp12zKrAXzjpIQ5JUAqGOr3gy/TxgxJLXbsQVyLSVpcuIOv/6+VMCQ==
Received: from IA4P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::8)
 by IA1PR12MB7759.namprd12.prod.outlook.com (2603:10b6:208:420::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 05:11:40 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:208:558:cafe::bb) by IA4P220CA0004.outlook.office365.com
 (2603:10b6:208:558::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.17 via Frontend Transport; Fri,
 22 Aug 2025 05:11:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 05:11:40 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 21 Aug
 2025 22:11:27 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 21 Aug
 2025 22:11:27 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Thu, 21 Aug 2025 22:11:26 -0700
Date: Thu, 21 Aug 2025 22:11:24 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <robin.murphy@arm.com>, <joro@8bytes.org>, <bhelgaas@google.com>,
	<will@kernel.org>, <robin.clark@oss.qualcomm.com>, <yong.wu@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<rafael@kernel.org>, <lenb@kernel.org>, <kevin.tian@intel.com>,
	<yi.l.liu@intel.com>, <baolu.lu@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<patches@lists.linux.dev>, <pjaroszynski@nvidia.com>, <vsethi@nvidia.com>,
	<helgaas@kernel.org>, <etzhao1900@gmail.com>
Subject: Re: [PATCH v3 3/5] iommu: Add iommu_get_domain_for_dev_locked()
 helper
Message-ID: <aKf7/Fk/dT6UZWb9@Asurada-Nvidia>
References: <a69557026b7e2353bae67104bbe6a88f0682305e.1754952762.git.nicolinc@nvidia.com>
 <20250818143949.GO802098@nvidia.com>
 <aKNhIr08fK+xIYcg@Asurada-Nvidia>
 <20250818234241.GF802098@nvidia.com>
 <aKQG9/skig6F8LdQ@Asurada-Nvidia>
 <20250819125249.GG802098@nvidia.com>
 <aKSyzI9Xz3J0nhfk@Asurada-Nvidia>
 <20250821131304.GM802098@nvidia.com>
 <aKc5niDWTwaCInH2@Asurada-Nvidia>
 <20250821183704.GP802098@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250821183704.GP802098@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|IA1PR12MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b59cdb-8784-4321-6367-08dde13a60d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PX08El9zB/iKwWcqDTmB5sNCDCRqqq42VGvhf1D8fWaBzr/5uhBB0haUloEQ?=
 =?us-ascii?Q?8tvbMV74P2TlEvLCF4f80zleGgMVlhitMKeXYhJw65oc9ukSLvRNHXD7uf24?=
 =?us-ascii?Q?J4NU3/DNBhF8hjfj2l4tU1Lb6OdjJjSXHPSwJRBqESMi5LBsKg68dK+l44jW?=
 =?us-ascii?Q?DpUVIQjUaaH3NIeCA0AlrMJS/RuBAY5PLBqj+qYwv5ebXSt6YtgbjVuLwyzd?=
 =?us-ascii?Q?2UdRo4d5IjfhyZFZYvTGhQ0REpTyBbHzQHCjnCsBRU5Rm+LapxEAW9D6y64k?=
 =?us-ascii?Q?oFRnrUDTS7Z04BUy1gsANouEAR5ym9jC+zgzo/TbedejgCG5J2CvnucImkye?=
 =?us-ascii?Q?ZolsM/fRdL+aYEKK5EPq61rN5Jk8kiSO2HzdXUpv4W1VT+k+YC8FaYqp40fU?=
 =?us-ascii?Q?g7/9qKIWVwxt4yd/oXwMe694JU7bC5MBPuZfqDwwsD2IaU9ZROpWeYAM6da9?=
 =?us-ascii?Q?YYbAhEViISM8Gy0tofmbDyufwOKqxRZF3V7WzHxhiLxqysKuzNa3lsdH5sAz?=
 =?us-ascii?Q?y/ehDaCuWb64yFsaAmi8d2dw9nj1K51U+j5V2k72EeeZHkFCA1uk0IZ/X+jw?=
 =?us-ascii?Q?0SsyrstqoXxKS3fQ2ew6POBQSABKRw/8sOZjXnKq4eXeaak4PwSE05IvsNs4?=
 =?us-ascii?Q?jf4ljOhnYsJe0cZfbDg7iFfCtdt97iOFeS1juh3CsX9ebE7ER1V09pYpwK8Y?=
 =?us-ascii?Q?NJ6KpF3xEsj2QaFblH7dly02fwJVHUbqRRsG1dxEeFdd6BoWJGtr64VyU6/+?=
 =?us-ascii?Q?JHLjGmJWZpw9udICwDnDo4XkrSyiEYU2sGpdGdfVC3fdXmcM/Ufl8XMjb13E?=
 =?us-ascii?Q?vWumPqefq0iDLiJJvpbu8RMpl0WekUB+DZ4kD8EEPKZZ0oIvMxnjVaXs4rtQ?=
 =?us-ascii?Q?2UBWHnv4/5EfLgE5DvCrGYQ0c0FEBZJ3+EnIkthf18F6J3lH+/ugcXsBR9Gm?=
 =?us-ascii?Q?z2Oxox5bYSo4XxvaJaxUticE2wB42AgyteitTpeb9eAssf7KEtXKFEqIF2zm?=
 =?us-ascii?Q?Ez0Fy1gvTnUvb3pdUIo4/2JykwPNBm9t42+cimnwcJ1InhQ5r04I879wZkew?=
 =?us-ascii?Q?Nor+XYEks3UcGNhrO/pRFL5tjcPf8Wr9OaJSvXvf2IksfWJoCBJvYvjoU9wX?=
 =?us-ascii?Q?5M7NAh7MXmz+oWXvNeCY5aWuoCamxBuWKo6w2bLAft3FPhR6I84aCpuMhugU?=
 =?us-ascii?Q?EAgAe3fWGtb1L5qTH1HFJIWWwjcLuQRaejctt590v06G+qx1DEQZc9WPAwkY?=
 =?us-ascii?Q?gv1cQQoOh8BfIqUnGSD4gLasbYHBMdWB7RT7eS0HwL+x4bcy/hlbGforofV1?=
 =?us-ascii?Q?/TU25Rgt3osU4AgpCv7a4HxsFFb3s3yaRBY7szAmj7BymWrusiP4cJo6Y0zD?=
 =?us-ascii?Q?SntLMcE2u7NC/x19JGYGiC57RGd3VonZrLUhDb5nEV+z/UbEo8Td6Az7tNQA?=
 =?us-ascii?Q?j2+2qv1Hey7zMLQGGvC/magf+7Av/t/8dTMfhzknExiA7WCI9YDANks/mXnH?=
 =?us-ascii?Q?KTd3hdA0ferBdwU4xQhiir98AC4rJLHNoxjW?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 05:11:40.3324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b59cdb-8784-4321-6367-08dde13a60d2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_221152_427396_12588451 
X-CRM114-Status: GOOD (  17.25  )
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

On Thu, Aug 21, 2025 at 03:37:04PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 21, 2025 at 08:22:06AM -0700, Nicolin Chen wrote:
> > I should have pasted the full piece:
> > drivers/gpu/drm/tegra/drm.c-960-	/*
> > drivers/gpu/drm/tegra/drm.c:961:	 * If the host1x client is already attached to an IOMMU domain that is
> > drivers/gpu/drm/tegra/drm.c-962-	 * not the shared IOMMU domain, don't try to attach it to a different
> > drivers/gpu/drm/tegra/drm.c-963-	 * domain. This allows using the IOMMU-backed DMA API.
> > drivers/gpu/drm/tegra/drm.c-964-	 */
> > drivers/gpu/drm/tegra/drm.c-965-	if (domain && domain->type != IOMMU_DOMAIN_IDENTITY &&
> > drivers/gpu/drm/tegra/drm.c-966-	    domain != tegra->domain)
> > 
> > So, the check is two-fold:
> > 1) is attached
> > 2) is the shared IOMMU domain (tegra->domain?)
> 
> Yea
> 
>  iommu_is_domain_currently_attached(dev, tegra->domain)

Ah, yea.

> > Overall, I feel this would be a big project yet arguably for a low
> > reward..
> 
> Indeed, we can drop a FIXME comment there and leave it as the last
> user or something perhaps

I see. We could keep it in the library but discourage new callers.

I will start with the internal cleanup as we discussed, as a part
of this PCI reset series. Then, I will try adding those new helper
functions that we've listed here, as a separate series.

Thanks
Nicolin

