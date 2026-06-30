Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6498EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 05:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SL9T+80cl3d06Kx4mGWIdIBzncwj8eN3xgedZI0Q7gI=; b=tN/siXkbrlKc3sLUaQqGuvKWCV
	aZzfW6CE7L17gC6gEEg8cg2s2MqRQlDR/5rBugceRX6s/w/OhFk/nxWZF7yBu+asq9zUKS+BhzShd
	gGmy6ga+yp4oPbLdM4l8L2YpUE4gUzqAxyEB5c9ATjht8wMENLnAhbqlQVPehsde7H3mcHlSgifZF
	jOI88P3on1FFYJhJpE+lzngUjETw6JSbpHyWbRSgQrrTCV6JSp6W5RaDubbTS6kHDm4rWKPgLzltm
	7zKvjoWR/biPlOAHTqEiLpOj8znGDI2hhICVvvWu2Dohg6nUNZPcprtoVYLuNqbDE2BSW0lOW+738
	ZfZZzvNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weR9N-0000000FqHn-1FpI;
	Tue, 30 Jun 2026 05:36:49 +0000
Received: from mail-westcentralusazon11010009.outbound.protection.outlook.com ([40.93.198.9] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weR9J-0000000FqHN-3f9i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 05:36:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UExPIjF07bpMuCw0ZnBViC2llCuHMheE/9u6+6ZiN8sNT37UvKM9/WU1DV1NK5g8OQSyw/sz0J9fJpmZNoFy67vUcR9IojUPuf2nNiYN3IQrMbTUyXm9IuYGfcfiWZSu9pp0qonUu3L2JBbyfmSyz7G20f4o6MPve/5Yy0xfxb+pwy9AA3XmOliov0/ivnLqY7ogx8gHq75wXZRPU0yDG4RywkYHMfh3ojFVuqABAu6C5PWYPYobs9vdJe+6bbWQoIxo+h7X12cDkGmOGgt7SmFIDcF3/O1K+9505OMYztOcUntDbIhjyv2VZ3xLWIO6M24ThNRHoJzKk65zVHtrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SL9T+80cl3d06Kx4mGWIdIBzncwj8eN3xgedZI0Q7gI=;
 b=K6M1FjmQ5DljfBDIwZIYirFJ4BgACwP+qECwtMGazXc+BG5MyR5lYH5VrBA/zc4sdjnwQx3X+IXz0uY53msj3uz0xq+pRgm4SRHbGB1dbkmfPYSwYmfULf6XX4+UGg+qQAGcg9NrD4Sg5t1o1jVgGvs0sYdUSSy4/Fv1wIxmOWI45NJ1JnmfjosKsuXxRceBrECiRd5Xgrh7lpWVYnrhCBgA/bJVIYvOfyH9VV1Va05VkvU7/1MSv/w18VEAKJ+SL+l9bHkUzvLDLj/+rvQ2UF89WWgBU3Jx/c2O435M7AFntc+rnr4sVMsvQvKpxbeKAj/l/JlIQamXMqZR7qncfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SL9T+80cl3d06Kx4mGWIdIBzncwj8eN3xgedZI0Q7gI=;
 b=aUHQSCwjg6T+arAeESh06crAlRceDqgrvQjmOwLNdrBK8xpRa5vzms5uVRMl+XDgUNs+pXihnasXIjFpYIkiwWAXhEsIyJ4RzkLlskWwqwx4vfck4gwdusU16pgYmH7fr7GSISQKUR466HckBvRtt6TQEDC5iyCumbfLs1G686ExFONo47sNxaHy1tOqO1Ca6P74eiwPiQMxj3oDVJ+Kp62StRR67YLY+JjGY86McmiV+k5nhg0U4B+iDd28yvVFResu8aNCkyDBQWrUI6jP3I2r2ka7Ghs4cywKwEhAWm78YY0qTuRhQQA7gH/jYjVJ7FCDWYOsSTL5g69ypx1JvA==
Received: from IA4P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:558::13)
 by MW4PR12MB8609.namprd12.prod.outlook.com (2603:10b6:303:1e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 05:36:37 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:558:cafe::b) by IA4P220CA0002.outlook.office365.com
 (2603:10b6:208:558::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 05:36:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Tue, 30 Jun 2026 05:36:37 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 29 Jun
 2026 22:36:21 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Jun 2026 22:36:21 -0700
Received: from nvidia.com (10.127.8.12) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 29 Jun 2026 22:36:20 -0700
Date: Mon, 29 Jun 2026 22:36:18 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<joro@8bytes.org>, <kees@kernel.org>, <baolu.lu@linux.intel.com>,
	<kevin.tian@intel.com>, <miko.lenczewski@arm.com>, <smostafa@google.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, <jamien@nvidia.com>
Subject: Re: [PATCH rc v6 3/7] iommu/arm-smmu-v3: Do not enable EVTQ/PRIQ
 interrupts in kdump kernel
Message-ID: <akNV0vxHEgiuZSEZ@nvidia.com>
References: <cover.1779265413.git.nicolinc@nvidia.com>
 <e643786d849d274c1d8dcfc03795f572aef812bd.1779265413.git.nicolinc@nvidia.com>
 <akIxS7kuhuLRHAMg@google.com>
 <akNCuEfZ30Gf21iQ@nvidia.com>
 <akNM5peYovV3GdV4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <akNM5peYovV3GdV4@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|MW4PR12MB8609:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb97a01-5a92-4416-87fe-08ded6698dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|7416014|376014|82310400026|1800799024|22082099003|18002099003|11063799006|56012099006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: xd+eKW2LBOB8/EB333xAblnyW2YpEMveIJIX2R+uUXidn8zGahLyq1ogUbNPF5uUTt/9NzbRnLlbRq7iSVQjp6GJGugHhxrg2vM9MtSstnL8z3wuPsArlCfGfp2uWGxRXfLstRpWprjvQQtsmNKVrJoyZf5yVtaBj9wJT5uLgnb0D67e7SgXwTTAXxW/NpQIb7o1IUi24/2+sDlWSxG9FkdMuuH8Da7kOnssa9YqCkGbtq06hEoPzLN3cGRfr8XtUVqPgYLCyriQCOCeR5wa2m08h/PhDEnvtQKZw/R2engHajXR6m3DGg414eItrLNUVuJbB3KZAiLTQheh3Ps/iA6NAlhLyhFMYjrJiNNy7eG0bUWcgq4Nmg6mlBJrOsJamHem+BZIOVKqHXtB9w4o4aHVYqCDMye8cv0FVvbuX8lw4TivRhLVdxR8OtPhQ6AosbuJCRrrvww+5cUhgwJ90D8DE3HtLwVbsT7OfXqedc7nQ4n1pbCaaxd3LLSKkSu9aRiPw4gvDjISu975VnjHV48BaH9P0Bfyz+GrkjbMItIEIqJGqDieBJyRDBaqL8r9Vmy+bW9Sg6u8VyDBcL2l1ravoxukkDEk/TZt4pWbiMexs+a3U2rTfMPBotdq/ZEAzJ0vVpDkcz/+HdpR4P4aj2dvRoV+rGX87OaIvHWvWdMOfJF9+STrbXdXleTqZzqrkSuXm2wzKVyEtMPy8pfPQA==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(7416014)(376014)(82310400026)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fudLwo6CQK0CtD9UHo3VpJHMutRV838nMNpqgqMoZ9GFoTP04xUK9q236LJDUrykclxJ+3+XxYAJei6Zy1EdyjoY5+NC8njemi3vXC/0TmND6sbIRyic86SEyHxF82AXPZxsbM+0zRPqdTf4VgBP9CqZmPLZ27hJlBpQxiSLytJ7Hit1dJQdkSEpDaeLzHKSGmoU3dIxUQ6jcY5V9de06xP6IHQ3qMSHd762s1wsMJqx+KPZrlRA7grDUHpRT1S4aJ0Ke/aI4w2NIE+Rg+WxJPL5XHFEEIEn15u88b/j7EXpxntPfW+GWZdIwwTwB4ytNnsqRJHuRzqPAVoplOxvpw5G4Q6L+6AmHHlvkIl7uBVjrgZMRndVrZw3ge1eM91eTCkilLND63GiImtWxOoQNCC00du1JZFQvXNhR3G5GlVdF9ykg/y0fr6WT6IxPoQo
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 05:36:37.0379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb97a01-5a92-4416-87fe-08ded6698dcd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB8609
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_223645_938080_99A8BD18 
X-CRM114-Status: GOOD (  10.18  )
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

On Tue, Jun 30, 2026 at 04:58:14AM +0000, Pranjal Shrivastava wrote:
> is_kdump_kernel() ? 0 : IRQF_ONESHOT, note that devm_request_irq is just:
> 
> static inline int __must_check
> devm_request_irq(struct device *dev, unsigned int irq, irq_handler_t handler,
> 		 unsigned long irqflags, const char *devname, void *dev_id)
> {
> 	return devm_request_threaded_irq(dev, irq, handler, NULL, irqflags | IRQF_COND_ONESHOT,
> 					 devname, dev_id);
> }
> 
> Not a strong opinion though, just suggesting a way to remove the if.

I've thought about that but kept the if-else on purpose:
 - Using two ternaries doesn't seem a common practice to me.
 - request_threaded_irq doesn't read as clean as request_irq
   for GERROR to use -- one could wonder why "threaded".

Thanks
Nicolin

