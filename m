Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A985C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 18:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EP9Ma/FWecRJfLYZ3jc2WcmUe0ueJMKnKTuvw+7szus=; b=4j3H27WQhcgldl17XcORKCoL3C
	O0qvSU+5WSFlja8q9rVZzboirYffILK1YQ9OiBkhtEHSybuPDs4FGfJ75YRfKsvQvXXV109fFvfpP
	4CzzABv7g4rHbGoM5HjrJJ4OoxrW5X4uOrDYCEdmqzayn21l8IiOFg5DNhwxy/woFDBp7PAd6N/Ql
	wd+CIFrswoedt6Alg5cXnTqZjfldzYXa0Sm7MclwWQdWaiaiBns+1TdYhIJlD3xA9FEd8ENybAe+D
	fOJSyGZEJ1mZFaV12puupiF442BoPPH8sKVJ8U969oQrAZtFoeRmaoTHpbBwCrrLCkbPyISqcoTpC
	LGyUQ/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvm6-00000001Iae-2pRQ;
	Tue, 25 Aug 2026 18:21:30 +0000
Received: from mail-westus2azon11010039.outbound.protection.outlook.com ([52.101.46.39] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyvm3-00000001IZp-1CZE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 18:21:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckZKn2S46ENide6WZWIEIx25IwYxmUnRrNKnoBeSa6ETcJGVmY00la2ZdnrPfxu2CrHnhxZsOY5o61xyZrsXXraul+JmxSN/azGoSrprRKdy4argeCniaquFYCPyo3rzyGqq3d9Sge1zd3NjMNusTQ47z7pdAs99fmtG6PKNfkKfld60AR8j+UWqLy+Kgc26JQ/T99UK4OJGdBqxcoIpshPk1fXIRn8ve3EgOnEA5u02PjWurl1oEg7LejkR00eCwY46WO4SgmGQQiJ0t+2l1qbW4CegaD73UgprwAUBGnTrzuwzPcGSp0cIeUCRAJwPX/XQdeVQAwYwA7qDlgXiVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EP9Ma/FWecRJfLYZ3jc2WcmUe0ueJMKnKTuvw+7szus=;
 b=WKm9ZhSkn48/FS04V6iPy/iJZud4N5ntw+NCnXb7aGB4zX8pKbPv5EbrFyYSPJk4W4lYXSwLqYuLw0iz8/qDyLe4LCJKAAE4PwOHGL1igU5hH84LjGV9r9rnpar8uvUZBI664UDYNW19LQhFzRzfyEYpr9mHVU6ktvZcekA8YYgy+veQmN5PSy0Hro572gZw5hCbJRiH7yUatBqxBqu4d+Ss1uy+wzGvFQVqqlViR79fSS8JrQes+CZ1k3WIZbcymTpQCnK4a4cGCpvdvu1FsFDQ44EvT8G90zN0LIdsXDz6Gsr+FxHTLhXA2XnBro/4O2stpQr2ue+wkaiaFHUwSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EP9Ma/FWecRJfLYZ3jc2WcmUe0ueJMKnKTuvw+7szus=;
 b=PbM1qUxGT2z8uYDV03tuRcOLfJKZS/Iluw5cGsPJ/0RUPoNF6Sq+rizZg5u3Mm0EOTVEOQ+Q6HguBr8PVO2qrX0CnMAP0RcVQD0vCU3ZF/idHg1mPTq1U+mEP0HNmtiN2XTWN5KP0DLvxGfCFZFoeDtEy9O65wIEY6bQVIg4ytEOxziYWsgMuVvhPUHba7kYlwxT/34NCAvkCBXIncASa7o1xKQA1+Flu72Dz9C87Cl6/sLT02H/2uGsZENqLrwExL66fPeu/Qmc29Aa15xFSsfkO2Fcdmt6uaQgoZ+2CDUQqTFd0Ek7Ts6PjMz9/7atqw//89C/Qo02azuqRiOvxg==
Received: from PH7P220CA0082.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32c::17)
 by DS3PR12MB999218.namprd12.prod.outlook.com (2603:10b6:8:38e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 25 Aug
 2026 18:21:18 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:510:32c:cafe::95) by PH7P220CA0082.outlook.office365.com
 (2603:10b6:510:32c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Tue,
 25 Aug 2026 18:21:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 18:21:18 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 25 Aug
 2026 11:20:57 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 25 Aug 2026 11:20:57 -0700
Received: from nvidia.com (10.127.8.11) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46 via Frontend
 Transport; Tue, 25 Aug 2026 11:20:56 -0700
Date: Tue, 25 Aug 2026 11:20:54 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, <iommu@lists.linux.dev>, Will Deacon
	<will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Robin Murphy
	<robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh
	<smostafa@google.com>, Daniel Mentz <danielmentz@google.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v9 02/12] iommu/arm-smmu-v3: Add a helper to drain cmd
 queues
Message-ID: <ao3dBm1CtH2V06r1@nvidia.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260728210928.1050849-3-praan@google.com>
 <178767577112.3356902.15184998673790345568.b4-review@b4>
 <ao3S5ickm47p1QWa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ao3S5ickm47p1QWa@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|DS3PR12MB999218:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b29f91-dacc-40af-3b52-08df02d5a859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|4143699003|56012099006|3023799007|22082099003|11063799006|10067099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: +jjVp22L/xd0u8pg6TeByRR4TjorqNqGx+jDUhmH8xqh9slO8XLrhUUMZ4RolfEaYIpUeRn+SlSTKGDTXgUgf56UE3rNK2ilz72Ck92u8pm0bgOjqKroe34TQ20znFGmTJ8u/tL371V/Zti2gxsdlILNHvDubuEB1angoeam+BjG+NB5yuE97UfeW42rT9Om7WrbswvFvllf74RV4Dh6j57AtWEk0VBKWDtqXu9fUcLluzAJJFKX0S4aF3N+lQU1U309aXO91L+flyie/w9t0+sWINC6jneH5dd5z5RoSYp7kyx7ZmznPObvnsJeEuX+NKsypBz089s95Aw3Mr+6XoOZuttBvb8XVSwLnApIkvNyWJ8zkxCoXbKX85rD2f5B2DVKlqZ2jUP6ImfVruyC+8B+QVHkc1l9fWQ6ZhZ83k9BaHpmYyfTTJ1aaCTso/ZbdbXj8oZDTXYg2d3CcnDm/UZk2QTXqisGfaCuA82Vbx/rWQSZmP9ndMAnb1QTMuZ+WKWTh/1X7B0sb5p0D/b0K2kglsYgKMR6itPZrwrtzlSlwSrCgcZ52whnlSG3yYf/o9sy4fPgJYNjPaM+oD4ekTLrq/2Tw1HR7USSxgqXNYGvUl33Ud79hsL0EPJ4GQNRcmW0OS2JEH3imkIg3m+umxcdZcCisUN6lqtA6bV8lBpXMYKWKrwqhrpgC5bM+hw99vkjfM62ut8K9EVo3Ewe4A==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(4143699003)(56012099006)(3023799007)(22082099003)(11063799006)(10067099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xt44+2+IZIwwwXKRJ7amnffpM9EVWtJYdEcl2HkvANxs5ybRSwSqWIWXd49kqSWbqU6TpFseQswQeLH7xwvvKY9se3taLO5bg5s269KmOZavi7/er4boAHRpw6OUXIf1dQKz68KLHf8qU5xuMhRcGgJvdj+VXcp/+pMaD40A14leUim0V4TP9wAe22m7gl1iRBpwmwTbXGXxToS+2lxrlqYWmZjjfGESqUGQ1UikzYeW2HRQXtxDsIjx1xDxkjY4UdLPuHe0LIo3WD4u+09PDgkKP4V8vYZ5ruoN5sMD2d1KKJoqBrr2c1KMYqa7LlCswGINAhPVpWA+zeHrIPAptwtsOBajhQT/5s6tFr0kWi4tBMWKSELC5ggtmhp3uFUqu0I3r9ivRF7gVaquMf4kmzE17wj8Qc53GSkLatFb0daYP+LOovcAnVtxO5RJPdtZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 18:21:18.5396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b29f91-dacc-40af-3b52-08df02d5a859
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR12MB999218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_112127_332028_04C2EA54 
X-CRM114-Status: GOOD (  20.24  )
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

On Tue, Aug 25, 2026 at 05:37:42PM +0000, Pranjal Shrivastava wrote:
> On Tue, Aug 25, 2026 at 01:36:11PM -0300, Jason Gunthorpe wrote:
> > > [ ... 36 lines skipped ... ]
> > > +		if (queue_empty(llq))
> > 
> >  [Severity: High]
> >  Does polling for an empty CMDQ actually guarantee that commands have completed?
> > 
> >  queue_empty() relies on the SMMU consumer register equaling the producer
> >  pointer. However, for CMD_SYNC, the SMMU advances the consumer register
> >  immediately upon consumption, not upon completion. Suspending the SMMU while
> >  commands like ATC_INV are still in-flight could abort them, leaving stale
> >  translations in the device ATC and causing submitters to time out.
> > 
> > This seems broadly wrong, but it doesn't seem explained very well,
> > maybe put a comment above the function something like
> > 
> >  The caller must have ensured that no concurrent command submission
> >  can happen. Thus the entry at the PROD must be a CMD_SYNC due to how
> >  all submitters generate commands. Waiting for PROD==CONS guarentees
> >  completion of the sync and all prior work and thus idle HW.
> > 
> > I don't think the other substantive remarks are valid.
> > 
> > The Werror thing is right, every patch should compile alone without
> > warnings. Sometimes people add __maybe_unused to accomplish this..
> >
> 
> Ack. I plan to add __maybe_unused here.

Maybe it's time to use the shared helper in both of our series?

I plan to send PRI-v3 on rc1 (likely next week) with this:
https://github.com/nicolinc/iommufd/commit/d10325ff40fd45c476bc98d484d8dd2cdc7fdf95

I think this series can take it (and its parent Q_POS as well),
as we discussed in the other mail.

Nicolin

