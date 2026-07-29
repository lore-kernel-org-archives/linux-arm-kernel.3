Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92861C53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 05:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mtcgp/MWEP/ogAbZzZ1iSHLmhy8pbnK4i1R/lEsUyDA=; b=ZfYQtyupJwZOEnCfBL4yRFmPHJ
	O5GxJsqdGpn5nlgt9l/4orDqt1jfKv08g5J4xh87h0pMSnpf6vT0K5AYZ8eECnZaFa7izd3F/ebLJ
	fqW+8ZY9LLbtY5LPvnY99rhQ9yCwp0g/J41W+JB7TYD+7M7PsCToH3LuCw1Z56BeUoCZx39/gS1DT
	9jUwmwMbN+d3AIjyKzh8NlAZR34WGJi/Nrx9k6Zlc+KodmPfZtvhwvveSz3VEJhar4lNAR/vXkNbC
	I/qAfEj9J+9toRGgQoetOlHXQgcRzd9w/XG2msHsv8WOwaYkZxiybjQ4+lBihQmBqRE/YY2DnzsJc
	DY456gYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wowoc-00000006wLb-3iPH;
	Wed, 29 Jul 2026 05:26:50 +0000
Received: from mail-centralusazon11011039.outbound.protection.outlook.com ([52.101.62.39] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wowoZ-00000006wLH-42Sz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 05:26:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kK/xPc0HvcIojHuGsZ8k83UqHbdHy5fTiiy8L9DC9RNJ+gzBtDr/mYFTgf58hHP5PcKjBpZ0m/6SUi//3fhmdHNNJ/4a0dHm6Oaf9i1CewSVEm7aYbcZV1OM95kzDgdFEAWLdDcAePXlc7HJWY9QE0sRlnEEkGBKjfrmgppPhtkYDAPS52lRpIwY+PtStPyTda+2Vy2YwreW78tuHC0AKdyZDLkemDkCztqtbLATCS27g8eVcDUZlwvA3iUVeLE0ORNZbeKW4lL7XoY87voe40qsOdqbBlNxfkEWTmgri6PSAmD+eGyQkYLV/fHuJK+dfapUYbcJ9HmfM8c47PsomQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mtcgp/MWEP/ogAbZzZ1iSHLmhy8pbnK4i1R/lEsUyDA=;
 b=nDG3e+HVL2M74n/x4/5juTVm92hoLT1xUgwI5QFjXW3+U9KSEpask+MlC6UTVnEAaF6qjdAiWV3mGTivt1XbXzCK6f0VT9VSWpIZ0ZXH+OuJJwWfgig08UyyIZf1wxvcRw4ZOctX7JUaIf5uMEomVC0TGj5RWLWqUWwF1I6g4qDbBhVUDTHFP9jydpAXr/D+5i8WB9wJYbH1gdPBHJFfyXTkdwf46WKkdsXrWC0+O6lXMpIiaceacLPcfFTwSdOeZD6oZgqIgYPat8UGoWDFyrc8rL5V7psS2Nwioy5hbrnxL4X0nDo6cg97+vvefFMrm8+qi+rK+yOhPzT7dkKRyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mtcgp/MWEP/ogAbZzZ1iSHLmhy8pbnK4i1R/lEsUyDA=;
 b=XiJj+V90xh0HfEEI40yzWmZ+oFMOMVHE0x8ZHWFesdm7jhkSr2Pj00WpJXX7kGncJEIFZg8mjk+vdo7pdZXIOQZyHEs/e0AY7D2mHjznN9FclUdUI+4xMdgR9K4kodoC+gf7s5LUs7b+JnOZH5u7sy7OIUb0/ADwtSfKUWpmoKJ7t49v59pqxJd4D5v8Srxz/mNo4KefAbZj/lEvKHGQ1PqtME2076SxAk0fhWZnHBDSRCALwVFWGfr3bOtpQbDOlk3MCL436fkJNHSRnmOE6sSH9E5+lqpv1SMyuMXd6s0kPRAIW8m5PQu9PuYJgbZZ0JTK7FNsir7Z1UqOIbw9cA==
Received: from PH7P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::29)
 by MW6PR12MB7070.namprd12.prod.outlook.com (2603:10b6:303:238::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 05:26:38 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::29) by PH7P221CA0012.outlook.office365.com
 (2603:10b6:510:32a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 05:26:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 05:26:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 22:26:24 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 22:26:23 -0700
Received: from nvidia.com (10.127.8.11) by mail.nvidia.com (10.129.68.9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Jul 2026 22:26:19 -0700
Date: Tue, 28 Jul 2026 22:26:19 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <jgg@nvidia.com>,
	<joro@8bytes.org>, <bhelgaas@google.com>, <kevin.tian@intel.com>,
	<kees@kernel.org>, <smostafa@google.com>, <baolu.lu@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<skaestle@nvidia.com>, <mmarrid@nvidia.com>, <skolothumtho@nvidia.com>,
	<bbiber@nvidia.com>
Subject: Re: [PATCH v2 03/11] iommu/arm-smmu-v3: Add
 arm_smmu_drain_queue_for_iopf() helper
Message-ID: <ammO+4W/dGC8kTCr@nvidia.com>
References: <cover.1779944354.git.nicolinc@nvidia.com>
 <a62db13ab63916e9a62cddeec41a74a98cdf6a8f.1779944354.git.nicolinc@nvidia.com>
 <amkcQRVylEe_t-yP@google.com>
 <amkqZbPJs9qly4pH@nvidia.com>
 <ammMf5z-Gl-Wygk6@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ammMf5z-Gl-Wygk6@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|MW6PR12MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: 78670cca-19fb-43b9-a4a9-08deed31f6d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|1800799024|36860700016|376014|23010399003|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: n+lOne4/jX3kpNFHaL1F3GAEAGIguzbfGm+pb12rfWJbXzmWiICQuZOobYYrrIpe2KMLAQWjdywOxVNAVUp0jCShE03IHR8joF6BjuEJ3dPLJIQiq76Exq5yJngoUGUP9RCBpKshTvGIrw9c3pNMFXjH1SQgtD1qOgT0hYCuMLyh+phDjBXhWNSDEKcOCSWBe05g8p2+sYNJVq240nVeb7PMH8eJuQc3lViBNmTSVXhpEEAcz9sdmaOsWTyj5VgVvQS2Exk5TIedlrKq+dJ5WsNONJqLr76SZo3Gzw2eIY6Csz4aE1pcw7GG4CU/XDrIjvvFY/plz3lmQCDE5Wx38ovtUdotV6RsmA1Nbl+ORcFFHFLZ1YBaphsY22dmIt7pGNxE1/ZP3mj46rklP3Ao6ZOlPxhcl11PqzCP3viIaXy2aSL8MCdNNgTjpgn+cmxCB6Ure9rQ++prBba7+KWP2Dvi/ywqp0AoHq4F3LcmD/tiGcg1GZIQFddlfBqLQkJpz7LdUO202HuOOMXnatJGTm6IjUhTu71xp5J1gZPGIfJ5ihrm/sELAznTSMLMKQjavPwteqFfQ2vSCU6r9layF5F+mw7btJUKVDtTXspZmlc6E1r3Mll83hshMbHXXBeuzLLeViOpZtRtkI0D1WIa4YDuWnEQ/tnNq/+dfKKKP+RPX1/sXoLpBgJpQ6ZW11U6SOo1aocHKXCEiOkWlPyjkw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(36860700016)(376014)(23010399003)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZO6fCeNsgC62aKdR1QePNKIGzURPmv1/9hVv0b+x/sC3AVVUGxW/SBxE1ISi5R4xb0iwaKsuLh5aOdaCqn5tFejOvsVEyPTbAALrOhr6IYo3FlkZmWrPN20Sygi3mvMfZZDHA8I7oxucCaRntypOXu9zeyMKFDOHWQ1BGqcxoHZ2rY1Ck940rmQQ8NUh5XQEkIP+pjFqyi03t5iQj8CKbLVLNZkcMZ0YBybUSvXlDuuRxYa3EC4FO8XKpWRmbVHZVR2/liTogDinn16cujJDSCZjWrTrg4Mai1VSVzpj8dt8vchh+/f9PeQrVy8zKpvQs+ZLnNYk8rdOemaHcds8ovtqhkZPk0LEVNqM3Y8LZRu5d6uP6gjq6yiB6+9lBcOL2EPEo9bq92ln/siZ+U2vxbDZv/MO9116xHHH5Q6JE0ulr5DeD/1a5zmPsVMVwIsE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 05:26:38.2225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 78670cca-19fb-43b9-a4a9-08deed31f6d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_222648_082768_B24ED1C4 
X-CRM114-Status: UNSURE (   8.27  )
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

On Wed, Jul 29, 2026 at 05:15:43AM +0000, Pranjal Shrivastava wrote:
> For PRIQ/EVTQ, my only worry was the HW producing more events,
> say Device A is detached (we call drain from attach_release) but Device B
> (still attached) starts an agressive DMA with multiple PRI requests/evts.
> 
> Maybe we should go back to snapshot based polling for that?

If you look closely, "pending" is the snapshot, regardless of the
growing prod.

 * With @until_empty == false (for EVTQ/PRIQ), exit once "drained" reaches its
 * target: "pending" (i.e. prod0 - cons0, frozen at the entry time):
 *
 *   cons0                cons                 prod0         (prod)
 *     |<---- drained ---->|                     |             |
 *  ---+###################+=====================+=============+--->
 *     |<--------------- pending --------------->|

Nicolin

