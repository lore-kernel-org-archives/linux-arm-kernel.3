Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF329107BCD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 20:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFUkyhLPoe+Ypx+GkWpAwcRbYqfxX5pchdchbgBiknA=; b=ZcewoDFC/rV4y1J6hG/DW0FJIr
	YlNGMUPUCCmioruM+NNVeaxaXAJ6zEeWZzYsCZQSsgyhRL1ULg6wREmuFTYlFgshlSdj6a6yc/+pR
	xhadqQ4akruXe1FrZin12cPaSBPopu2DkXwaS/9uwDUOZPIxRGYCcTxn+xvCz6XMDE3MZyD+56cby
	Gyrn02UbyY1tpemvGul0xuz8JMirLJFoy53ffmbVDm0l4aTEqJCFtJl6uCXwpf/w6b6iMZ4XrjwWT
	1KfyVrbDVut/yn2Mp3q2adi/oG9VLZ34zMRPC6Q4sv/pTBCoPc4sx1UyCNHqG2yzHOoGaoyHF4aPo
	7i4g9a0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w190E-00000001Akg-3lRg;
	Fri, 13 Mar 2026 20:20:58 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w190B-00000001AkD-0w7o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 20:20:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nISrt/Z4iGZ+DQQacd5K/cjzCg2hBMyHZ/4k/sQ4EYzrQ2Q/XMMN22BWlExYz2gEPHAx9e03UTz4kW797BSJWk62ioNuwK10lt1SRKUWRGGaXpbKhxW4vEQM8vqt/vPwJBisL3eD8hpb8xWJXFwCNxwFr0cylOzV+JF76fZE8gbcsvLILdUu+Up4IQQPYM0gh8Xy4Dm1UCASxUl8fHXrRaixq0jH/QzENtA1VdHDdkL4YgdtRYgBOYQW12QdeZw58RcYK1ILFVjjSyFAFaN5zyZnYFbWICZce2USOEf9u1zvnxwMR8NqFg9zY7Crx/XGHmaXm6YTraBvpNScnOwx0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFUkyhLPoe+Ypx+GkWpAwcRbYqfxX5pchdchbgBiknA=;
 b=LR6Sw7+FnG6oRa6McTXPAWhP1LEdlygBm7JyjHwuA7S4roikhuWKnI9GArhTFEuIZoIOpJ7Gs6WGTFAlimsTXBjv8Ni6LtifH19xrWRhwmM5NlrdKsbMxC7tnE0McfLXqfstPQXXmHcmndyDJ5tlRdxKl2rKRPepbzLC04IPHeoT808cP27kBO6QVS8EIxHeYuqfzSD28IpUDgACn903IPN+Cbrc22kIg+/kCbN2HcWCLehvueL681aQ5Ayv3nbpxvP933EejROL7b14xzW1JzXY58JE/FtTNoLPIDJTB719IUnBRamgS7NnsC+z93vpJbPrz+vRelB4U2++2UpICg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFUkyhLPoe+Ypx+GkWpAwcRbYqfxX5pchdchbgBiknA=;
 b=ucgGSFJyB11e14+BkWZ+hM8z4S0lY/oZm+Vg777O0BLan28+0Fjh7L9AW0IkLFbz0YXXPz+O89ZYs/53iSWgZbg/cRu4KnrCXyacByNOu4BVnObuirEsFl7LcG1qeNgsuphcUZHsAQ5kl7OT/3iflsqSrJgBbLu0Rqd96TbvKJR0p2n8NI8e0ilfGJLfEOrFrv+gbQ6jpSP8Nca4U23XuCwt/Q/OHvxDgneoBkFwFrLbkErk49b2PLcL9p8t3xjgw6P32wBfrlPU8eSsXY9aVo6FIMNfTp++qHwJNOqfSncbBL0UTxtp8SxGJxj59n5zbfaUFR3b2XpLPZ87sngj7w==
Received: from DM5PR08CA0038.namprd08.prod.outlook.com (2603:10b6:4:60::27) by
 LV2PR12MB5918.namprd12.prod.outlook.com (2603:10b6:408:174::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 20:20:48 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:4:60:cafe::5f) by DM5PR08CA0038.outlook.office365.com
 (2603:10b6:4:60::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 20:20:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 20:20:46 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 13:20:25 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 13:20:25 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 13:20:24 -0700
Date: Fri, 13 Mar 2026 13:20:23 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Qinxin Xia <xiaqinxin@huawei.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>
Subject: Re: [RFC PATCH 2/5] iommu/arm-smmu-v3: Add register display to
 debugfs
Message-ID: <abRxh24wATp9r6+F@Asurada-Nvidia>
References: <20260313104351.3502293-1-xiaqinxin@huawei.com>
 <20260313104351.3502293-3-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260313104351.3502293-3-xiaqinxin@huawei.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|LV2PR12MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f06f9d0-3ae5-4bfa-e91a-08de813e02b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8OeKcuLsxL7hUcqMaq4woFkFPReIgFpXe29T+0derMQbvhRxMWenYTlr91UlkTQRbDt+sz7z6CGwqpdbDrnJEIWRMFnbRV2VoKHAynFH85YB/eqs3Dda7fKld3xddJZk1KmVk6zu/n/beo9NaoZ/z2i7ScFtM06h0SqJR7O6SkKXuoPuK2X2xetsTDpaVqul6U/KuDMMk2PQCRxgZBLYNAUvURwRjSr9js5EcYPmYQzmI6z3jPd97BR+fADx3S4V1fzQRTQFyDLwyMqAyZsaqTcgzRpQfZpx1MrXYGuxTCHQyI9VK2eg/r4AEgJi/sGig4B+0f4fGTvoWAIlkqTvLCLpWJjmV5/jVyMfT5uj0MkZ4qge4dHIlLLsvmGdzhgDuHxolNE+hAbyFEwY0GZ5AqM61VbO0R6RIlZm0F+4qT4N8scuPUjdpRJYD7nlXFtHSTWROUD8gxEDiu4+c7rVbZ24WNL0VDvFrptE/Sdg3fzCsGxgIql8nYjm3O7Vq+oLyCSm0ukC+WPR8E/xc1AeWA5Z+TnvsjjjXiwU0AeuWlNauAJR+dcWcfeSjdDSZ31eRfQIP7lfX7nZFKJwHBfqux84SlMSznhQfRvcHyqobeAuFRhTi1vDri0Xz4RJyP8yaRh7p9B4ABFxezH4VdPbZQCW/vmPPPAsjS6Ot83C02s+MY/l+5PAJ3K8FSTRlYa5UG8mo7FZdUAfiGFXhzPBbQ823B39tsFWSrEBmDSAjepDhVyW8xIELtPfArGnx8ndMC5018ustptzPjKEhIFVrQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: G8+PVi83Z1vrbWeXYht0OjuXvVQ3DK8CtQCktS8b+7hRPC62jthAT57j6hCfeOm/v1op72eqYb0pr8ZzZVL7fCW47G07aAmQCMNsHN65Wa9UgYSfAn6HaY4egY8hGNC1FlqAdPYMncInU2nb5a+pVOWORDPDkD6EoF3xJegRUM1GvsZkWNG+3Y5xTKZYSZMh5Ithg2Pg1uLBKlfUbafKIcKlkmBX5tNO4HrblTlfQz1/PsXCoVwJHCOvaPvK7+qxvqadl9En4qu2D3WNyduigXdmdSzfSXBjmC5xBHlIWxlVIJNJgFWfhNbftrWVYSxDYXkZgWNb7IsTOUgTucKvjw52JB06Fk+Mx9wIKqAy/Px8JYPZMKfISHPSpG2XhnrQbpjV213DmeDcc/IX9y5/AETnTSl7Qcp5yReKK0f8EOF610l92+qp/Wp3nNubgibq
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 20:20:46.5121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f06f9d0-3ae5-4bfa-e91a-08de813e02b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5918
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_132055_262626_BA751858 
X-CRM114-Status: UNSURE (   7.17  )
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

On Fri, Mar 13, 2026 at 06:43:48PM +0800, Qinxin Xia wrote:
> +/**
> + * smmu_debugfs_registers_show() - Display SMMU register values
> + * @seq: seq_file to write to
> + * @v: private data (SMMU device)
> + *
> + * Return: 0 on success, negative error code on failure
> + */
> +static int smmu_debugfs_registers_show(struct seq_file *seq, void *v)

@v seems unused as well.

Nicolin

