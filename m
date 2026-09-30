Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EE0CA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 18:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1oD6M00AhrP9UDnQavmwQ922aOkJQ4EBAVET7ldRe8=; b=ljx2ME2pYsCG8j2PrDshAjZ0ov
	F+OAAoBQDLLkS1ykr9gvXumhipgYODMowmumtIKcJLYM2+aDYX3XUgp5TWLaw+zzeMLnCSko8geQL
	v0YolyBGMEiePbvZpR+CNR8OYaP6Ko7kSmHFn36ucPnako48d+5oi/pbYLuTiY21TwTPHcOyK0x3g
	8FRjH9kqxdPbvxt1Afo9mljsYKvbqe/2xvZpfats7YBl7ysun3b/Kfe7LW1xZ6hbRvxG9xJgfH2Td
	I7SovwOrJoAbuv65HeQuj89i8G7vL/i3Q/as2D4M5wqalrsdcKwd329nRGLxJQZ2WUZsQCCVevZcT
	W1wcG8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByzL-00000006y3u-0ckE;
	Wed, 30 Sep 2026 18:25:07 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xByzH-00000006y2p-31nQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 18:25:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M46WU9Qwz7aS5PtbnSzWRugLp9/uEFzPlWSHG//wfCVydJ4BDgJj8nsJr5lulFpOhaJAGr1J4xRprdED16RiSlrF6pFkDkJ4fUPVZzWcJAgCIJBlq2TS9VHN/ER3Va5q0nIY/iTyB7RgKnyE4PBdFoHJRNFIa5RQDXNFrYYFO2oA6e4gEDQTjZbo27hZI1hRv7fw+bFpnVlwd4uikUzcq1kEUz8J1A7/h+T0/PRLUQO//qsKnANO5Lk144fGLFWX8rJwqDnIKnPaNQjwOrHlOrZGkPuDxGWIN1KpG7brp8jEMEFw3zfnzuqYhEDI+rUweBS2AIjVNgqBt42coAvT/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1oD6M00AhrP9UDnQavmwQ922aOkJQ4EBAVET7ldRe8=;
 b=mRvwjblBncJET48NggYft62Rx+ncdIGHxSm99EcGfVgwAaMbcNJ1M0/CQf0M4pu9DHDn18qinEDim/6vlyM4qBu8drqeVJ/+pwzA98HWlNjpFYl4LMGILvpECKo9sCqn5PGad9b749+9nUAMblGtl+h0Rf09PvuoJsYAlG1fv/JewRe0rQFMANW1yI10scC8zpXg9ddpU52ZGJ/Z4dHO4hgPWO5NDshSY8kuXj7v+NyzAahfUyjGu1LnpUDZq/h7ba0YZUFpQddASO+hr7fl0szIWpJqdTreB/J0x7MS31HsZUhln6ARkuJVum7EVY9f5n6tEzGSEtDSlDedyhWOmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1oD6M00AhrP9UDnQavmwQ922aOkJQ4EBAVET7ldRe8=;
 b=juXEG0ZXabr8XahkSk03Jva6ULFqKEaN1OmXXoaunxv0W9hcv8GOpTwO9E+Bl68BGXTfMrZLLQTULciw1FyyzV6U/YF1cWDBAwiDQTkO91fqB6C59+ScAl1Tah9BSfzBp0cmcpTlWOsTTRpo/GacNtqYCKDohUwne3TzvcWWqlNSkYKLrlMTThT1aY5f7DvdthRYZ3Amayqy/kMktQzEAyCF6E5fT/wsKGJm9LCB8sQepHbyUPj2/wEnTcy+GHgHsGmG10vrDVE8ccdEPnCcnvC1luTIMpbyjlIRKXTuB/gim/glG/iOLqLmZEoWymaAe8ek/L0YtKw3lvv5VoWJzg==
Received: from MW4PR03CA0266.namprd03.prod.outlook.com (2603:10b6:303:b4::31)
 by IA1PR12MB8360.namprd12.prod.outlook.com (2603:10b6:208:3d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 18:24:52 +0000
Received: from SJ1PEPF000037A8.namprd03.prod.outlook.com
 (2603:10b6:303:b4:cafe::12) by MW4PR03CA0266.outlook.office365.com
 (2603:10b6:303:b4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 18:24:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000037A8.mail.protection.outlook.com (10.167.244.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 18:24:51 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 11:24:27 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 11:24:26 -0700
Received: from nvidia.com (10.127.8.11) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Wed, 30 Sep 2026 11:24:25 -0700
Date: Wed, 30 Sep 2026 11:24:21 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <iommu@lists.linux.dev>, Will Deacon <will@kernel.org>, Joerg Roedel
	<joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Daniel Mentz
	<danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>,
	<linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, <rafael@kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, <driver-core@lists.linux.dev>
Subject: Re: [PATCH v11 03/16] iommu/arm-smmu-v3: Add arm_smmu_drain_queue()
 helper
Message-ID: <ar1T1ecOPXb6JSPc@nvidia.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-4-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260929034510.2023173-4-praan@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A8:EE_|IA1PR12MB8360:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aef1bd5-7cf3-406e-9895-08df1f201e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|7416014|376014|22082099003|18002099003|10067099003|3023799007|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 4wVYO6QZGfBpUQxieROmKLIm5+Q8SUnJBibkwDPJAlPVjPw7jefHQ3LwYh3AERx/+w8z0QCH/MtAEHvvKkCFmh8jWk/34XBh43R5roB9RKfnhHoj3ufPhlW7Wf7f6yYCZBhlKtDM07zmOtkVEcMKLNVyJJTpOywuZWcDLVbiABbRQpbiXfTCzXG3dmGsnelwNI/N5JsvSN3XZ3DcHEcJa2t28QuDCJXM5/1rEtN6BeAEO3XFq6HJMXaBK2NPCMtzbPScqKfBUVA7HhYCxTjBw8k+0D9quiTmM7r+yvwBSOf5ZelSKSV1RlcJqJ50sBN9VEr/3iqF50p4G/gVWm9LcM+AthST2vKNXo6kb3oPHve1R47Sz2vY0o/H+vX2bVsPqpO2mhaSLQL2lhuNMV4Nor9oVYAir1HiNTEd5bZCo0pCxf++71oI4S2OdtT7B8e0XDadQP5L8D/ChCAQf9TeO4Dch40welBKRl19OxzFXF2N0GGcwh9WNs0JfN9jVl0HQTfFecBeono0Gn0CWrviDjiEES4xQfZ6E+YiETcmDVxvm5YJt8MtDaU9zop/yb2KOGnmZUDvcizWFLD5ygBZwFuYWyDMLi8Vf4McaQaD8Z2SyXbr34oebQs6QpxUCPYvZnTPMuWIM+vJOs18p5OzkPLrl1M/aa9ZYKA0sNL6E1mR96DYcQ+n9zhM7EbSs74VlSbUHrFriL9sxAHUMl0y8A==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(7416014)(376014)(22082099003)(18002099003)(10067099003)(3023799007)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TAJ2e/C75Ld6Rg7FBawbGL29QgqTJqjdJq8ZSzcYWh9VLIUkAGCrc7IdlRgK74T/i+4ongNymphyFnN8rJMInVl4gnn38L9Gopk8TdCW9s273NHkORFc/u5X7jUYyDcBk1bblz8v23CD1lk7e0UG4qMyusRqBnRrtk833OFNMhuBJ9HcotS9/KrjNnhiGemw0Mj+rWV7zJmt8jjOFzJQU93zzuC9/LyS4rron3iN3u2UfBaTRoKaye28V3z4t0m/MIeULiBh4vhIO3C6CuBjnynQtBPHclMP8GS3rklgk+9xR9npE8JlX9eUJrUTXLnzIvQ9uB9PAdAISV/ditXT2NM9Jf9C6bUqqQPIIqPVzCpcSkwMGF4nzfaZ7ZfNZHgx+acZalKtqKfYrWnKmiy6nPjxjgLgioRhHm1XmUi1OYOuV/sLBMwzlLjiPqF8wq8/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 18:24:51.6012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aef1bd5-7cf3-406e-9895-08df1f201e39
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8360
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_112503_794324_320AB59D 
X-CRM114-Status: GOOD (  12.46  )
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

On Tue, Sep 29, 2026 at 03:44:57AM +0000, Pranjal Shrivastava wrote:
> +/**
> + * arm_smmu_drain_queue - Drain an SMMU queue
> + * @smmu: the SMMU device
> + * @q: the queue to drain
> + * @until_empty: target selection
> + *
> + * With @until_empty == true (for CMDQ), exit once the queue is observed empty:
> + *
> + *   cons0                cons                                prod
> + *     |                   |                                   |
> + *  ---+###################+=====================+=============+--->
> + *                         |<--------- undrained==0? --------->|

Jason gave some remarks against this API:
https://lore.kernel.org/linux-iommu/179018862538.3334538.17643821143626392419.b4-review@b4/

So, my PRI series would drop this patch. I suspect that it still
has some value for the RPM/CMDQ case, compared to a busy-waiting
alternative. Yet, it probably should be simplified for CMDQ case
only.

In RPM case, the "prod" would be fixed/stable right? IOW, there
should be no new commands added to the cmdq, so it only needs to
wait for cons == prod?

Nicolin

