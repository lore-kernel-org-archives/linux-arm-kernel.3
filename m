Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB473C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 03:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sun3Kf96aqA1fXDqI7EMlSK+E+bLJoN8dOhqqCwyWsI=; b=JP1QynPv00ScErD9/wsq5Ig4iM
	KJwnDJHqlp2nbeolBmtU1dhDQFiOO6QpHVahNlTukrdyUlrzckcF5XqsrXwXvn2P7RiqavMPfPRbF
	0iebmUUz51J2ObofGkEbd3YMhJKTDDvE7urqtmvzZWQKAzoU+LPDTQIwbphpk1eN67QbfXstmzXiO
	KPOYyW3u/1NPOA9qQD8WYrx5CRAk1FcZd7GDSzWf6Z/v1jekxjewo6KblPOBe3moB/TnwCt/bennT
	9N7sizkoEuFM/DypP1mA9aeti+KGPtN0Yjott/PbrbgJxF1QrQuaKYgoRzjr2PoC3HsymdpH0JW2v
	L9B3BMBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgw7E-0000000DyMU-1yq7;
	Tue, 07 Jul 2026 03:04:56 +0000
Received: from mail-northcentralusazon11012016.outbound.protection.outlook.com ([40.107.200.16] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgw7B-0000000DyM3-3asW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 03:04:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fs6aYqY+dk162HVUDxZWpC6EAgfPNpAvNFie0/nawZIU/Tmm6jPQAbfkS9cbj0s17waHY5qYZdNXmdX9B6fR6iZXoRiXzGUAsNk+gjcPp4l4u2u6572gY4R1ZvbfOcGwcAJyA+lBj6fpru/GPZrGZc3cI59somguk/k1d/7E5V1xF5rDQ0sxOiZjlpB0QoihLVG5AaH9CY6qf3gV6iaHSY8P9mXGhV89DKHJt+Y3bVve7y/aayXQCVRfEpyNJfPuRb2mKUgZK0QfxhsE8fahNXXSFcc8EXHC+OKPj/gkM1eNxyOIwKDoRYAeC2KVQvQ1u3ndLiI1jhs7EqHeyoF99g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sun3Kf96aqA1fXDqI7EMlSK+E+bLJoN8dOhqqCwyWsI=;
 b=GHzkpkZoSztEHxVbdDmHojRqhQEAEw3DEGFTlL/XzIdZ9IF7h7VuVWoqT2QYn6AlzQkBEhb0DIICgZJprtLTAd/58D2eAm6wYaTuLoEh5R3PBzSZCOPjTMRKIx8z7qq7B5hbmNAPAzRdUmDimCa4gfVzsVG6DzZn9W2+o2MGuO1HQQQPFghFL6jMEzFrD6HXGsmARlRNgkANs6D53MQGeEM2It54825pvrx394zqV9hxjC0VTRN/pmJTcwokkt6+HC8h0KBhwaKNxFsNsRn6CCmiAu+bMkObFSFPqKrrcx8D6IgxlRCAonYexKdxBS+XM1+NQpFALMUaNMQDPogeQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sun3Kf96aqA1fXDqI7EMlSK+E+bLJoN8dOhqqCwyWsI=;
 b=IdEFwvIA732REG8vYiq+byZAQe9VzxHQMVQqrewEGYZPoDp/9O0ytws2DFuIi0gmqjCKGTPpfJnHMVuijtjs9VxDP6fKnMJTkuAp5MvtyWAeiy0iVStFVecxrZf+EoyuyujqQenvW4TotSKANFazFFVoALrxI9qJ38mWxXg2G3saqNCmCWNSH1CdK3Shn7uKBvdCaeRzXEWruUe7WHU9k3LsjlpjgF+USjAIzm3iHh/vjBPFg4yLsiGBfb0lw4QC8UQAnyXL5KGCXX5sL0XX83rt0snH1saLEslHVNlzAfAYsSNMPpGROwqrebxtc83DKasv0qI4/Iz0MS5i48216A==
Received: from BY3PR03CA0018.namprd03.prod.outlook.com (2603:10b6:a03:39a::23)
 by IA4PR12MB9836.namprd12.prod.outlook.com (2603:10b6:208:5d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 03:04:47 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a03:39a:cafe::8a) by BY3PR03CA0018.outlook.office365.com
 (2603:10b6:a03:39a::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.12 via Frontend Transport; Tue, 7
 Jul 2026 03:04:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 03:04:46 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Jul
 2026 20:04:34 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 6 Jul
 2026 20:04:33 -0700
Received: from nvidia.com (10.127.8.14) by mail.nvidia.com (10.129.68.9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 6 Jul 2026 20:04:32 -0700
Date: Mon, 6 Jul 2026 20:04:32 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <iommu@lists.linux.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, David Matlack <dmatlack@google.com>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, <patches@lists.linux.dev>, "Pranjal
 Shrivastava" <praan@google.com>, Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 1/8] iommu/arm-smmu-v3: Pass the parameters for the
 invalidation in a struct
Message-ID: <akxswI05If+23vyz@nvidia.com>
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <1-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|IA4PR12MB9836:EE_
X-MS-Office365-Filtering-Correlation-Id: 17dbcc1c-3c36-4799-7e97-08dedbd48085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|18002099003|22082099003|3023799007|4143699003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 4Yy3GkCS4IML4gnr4ft3jakD5lNhC4VRWvBKoRUuvog8teWcW/fHJAaPK+qisMWPnY+eTzI/gcEqh4camg1Ay1IR72ptKjP8f4FtVYjUjDmoSbYOtzNIRTGdNP61YpyQ4ZQNOzOxfxfL0qTa/dcrGh7+uKtDEzN8/F5bxtu1m42mcvbPsMbCxJcSgOx6GCOr1SPomO0Gia4KuQWDAjXeKbe7ZiEE+7fBFBeRJO9lyct5Nf+uEkOQgur6mLF44d6bVGjGP3SE2RXptwHe3RGvYQmA1kW9Rub8aO/gZZQwc3R9JlflmjHxReZ+I9DT5+v9ktpqUtsAL4B9WtiLxvkxO0o1F2xTpcSUVN6jj5ySWoCjPIRTixnD587y2axpj8idBQXAAuhJF8vS2w+2Ck9CaDcpKImB+9n+9qD01Y4uMcZzFdHDBdrA9C7GiZocEAsjzDUE3xMkPt9vBaDuJN/nI862STdHpXpAiQD7hOyJ5aQXSIa6zt2XMyIvhpjgPLPivqCzPcvwwBSPh10ObMPDxIkZ9V1DydzmB0Lyap1Yfxt5HAP9ul5ulfvnOzOTH824tsiRJzkgMtBtB0pibdLHXo/X2AyWEPit7oi67oP3GFI3zTPeTC14vHUM6/HmCyDXL7sz3iiYDOq7edZZt7ftTwO/wjz6tamtqhTgoceR9jxpiNkmgiOSYzZFAWBo5fEvf2VF3f6gJYltKbm1XQdqLQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(3023799007)(4143699003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Lf0U0V3Yyt2vGlikM08Qhx5YRmb69GagL/xq5olYdNVpkrsKRdrSRSMZYWcQQ6+QghK6vwj+HdrVR6egxLjq0qfoHXaZQmg9knIan2Ae5Knsh0oX8eO9TUhsT8Q7O4iY+GN3yQqMmqFWckcZ82ghzAHOKeoCTxq/fS+UmyuTz54AFybBnjbtKDyXfWPeLWvZ+Tv5h7WxEI75UXaj4CFJk6AJmP1qbNYiQ6c6hDSoky9SSSQr95/seg2VHqC1Y0kCXmqVeJ4e9K8fz6DWLk3JDa4sAA8g2jlHH2G+DcDe99TcwftTZvAizmENLqOzfnU/tr4XIzhd9W9iyC4ZuvhD/Udu6jGTIT0tUE/WEENdAX0eHiHjITh9pyrwL+eibQtJP8H094fNzc87wrl5u6zgE5KDzRqKTojQ8hoIb0MrtAOkZhxudIhh0KpuZdoTOA2q
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 03:04:46.8647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17dbcc1c-3c36-4799-7e97-08dedbd48085
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9836
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_200453_900628_936D35C3 
X-CRM114-Status: UNSURE (   7.81  )
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

On Mon, Jul 06, 2026 at 01:26:38PM -0300, Jason Gunthorpe wrote:
> These parameters go to a lot of different functions and the next
> patches will add more. Put them into a struct to keep things tidy.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
 
Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

