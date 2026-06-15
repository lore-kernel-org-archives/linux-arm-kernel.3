Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCBCFCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 20:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lp9bLVg84ahzf3lLofkzq8WYwD5G9UwYPjMxA17gWNE=; b=AHtOZyWmtuuws9tmMagyaRxljz
	00NvRahtBZTfZ4AaAtEwpClfc5wCm0EUTBtpA5M3WU4AxGj9drzczIg9Vsh9jLZDpHFe4+xuz6aIj
	0iNEok5YKbUqSCHu95lBEKwTwFwlqQQeAQDzMVUiBAYcCBTMsngOGB+dxrq2z5+TdOQNF4rVuExYW
	NYTgiXzqWlxa3L/70Vmp1B6/5iQm+x53YmTwU/jmKqPYVMQyK5CzwHmTqz3kn4k05MMB7NnIlAVJy
	nGs/xGtW/B3KWLF20KP0rW14gwf0hfHYLfHqkacXh5MEko9N/yg1yswn2ceXaYqTSVPbBXhQTM7kf
	cJTt6NYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZDmR-0000000EoLR-4Anv;
	Mon, 15 Jun 2026 20:19:36 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZDmP-0000000EoL4-3wgc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 20:19:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X48YV14GgO+ISI1nRKKt2MFfiLGBcKDGLIFPueD6RYvJTaEmxHgNDirVj2+1hdlNVGiPmjaV1RfiU0k+/oR3L6rxfb1YAX7CIEn6S8NTgVK5XN0lleSKcp3Iw5wdQwW8lj+99dKbmf56niuZQzmmIuEb0Sora5RQqcatfNjma9WO9Cv/Q+k70UDfOG3s/TmE1IxJpAWmwIB8BdPxRs2Sfi/KuH0Vx+nTSUVubyhYd2O7ufmTZJji+0tpj5rJd0p740BM5rrGN0uz8Ifhb8Ridh0y0Tcm17oj+S9EfRpIDbMFPWSqR6XbmoSz1hZ9HY2wAR/iTn+Dt5Y5aMRYniMYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lp9bLVg84ahzf3lLofkzq8WYwD5G9UwYPjMxA17gWNE=;
 b=b5zv2RW4JJLMGsDMbfqc6LnuxTVw0+JTvEEyD3yH4yLoOkI4IXxdy2PJEG88yoViuAfC9U2nEYg6fwGtOZwC75X9zyNL076B8OBXK1xho4JBt9g9dZTcVrNFZqoi4chCvHo8q1wncolH49KCABsEdA/3DugZEz30VAcyJEv+/OY7VPGDxnWrW/BdlR54mXQnFzZTYPDRZbZhDJP18A4HqglrMirbsxnrFmHbSnRCBOh9BfuhHowxXrbTAQnkvJVg5GfC+NIkDnwPAjlsQKhmHDH8HadhwEG2idOZwJgUvUDWSWDRchYUYWAkN+lvA2pyH08Vkv+0NY/Q1U0EcPvcyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lp9bLVg84ahzf3lLofkzq8WYwD5G9UwYPjMxA17gWNE=;
 b=XJhwbtCcEYKVPA50002z8hc4KFcxbhKRVrb+2LH9mSmAD1P2wBjO0ie1VdSIh1DYRQYiGoW0ydzIPd63V4VtSm/+6go5+QeIIgiEeoaFH9odXuVP9w789P6Zniu0Dktvhf5BLUcacJoGu1UqMCyOeMr4Apts9+tw+OCsQwhKYCac6i8c2OSBsXNEzYr2+yawU0QyMMGM9+ZboFEgqkKGV8+aTeBhAeD1mIsYCXCoV5vcL2T9CJKMYOUuvejLG8k+xKAAhBEdLkVyNl+HHyWaWOBze583TI/0u0nyEZU5+NRU6ph449J6k1AYIo763IQg7AJgvvmiEwu8IuzKqJ/txw==
Received: from BL1PR13CA0321.namprd13.prod.outlook.com (2603:10b6:208:2c1::26)
 by CY3PR12MB9704.namprd12.prod.outlook.com (2603:10b6:930:102::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 20:19:29 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::9e) by BL1PR13CA0321.outlook.office365.com
 (2603:10b6:208:2c1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Mon,
 15 Jun 2026 20:19:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 15 Jun 2026 20:19:28 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Jun
 2026 13:19:06 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 15 Jun 2026 13:19:05 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Jun 2026 13:19:05 -0700
Date: Mon, 15 Jun 2026 13:19:03 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>, "Robin
 Murphy" <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Shuah Khan
	<shuah@kernel.org>, Pranjal Shrivastava <praan@google.com>, Kees Cook
	<kees@kernel.org>, Yi Liu <yi.l.liu@intel.com>, Eric Auger
	<eric.auger@redhat.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v1 4/4] iommu/arm-smmu-v3: Process vIOMMU invalidations
 in batches
Message-ID: <ajBeN5X1hxjD5QpL@Asurada-Nvidia>
References: <cover.1780521606.git.nicolinc@nvidia.com>
 <00748c5cbea95a938d032269001a598203b06bbc.1780521606.git.nicolinc@nvidia.com>
 <20260612135409.GI1962447@nvidia.com>
 <aixZzvVWmAFEDQZI@nvidia.com>
 <20260615134301.GL1962447@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260615134301.GL1962447@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|CY3PR12MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e1cdcc1-5d9d-40bd-5a2b-08decb1b66e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|23010399003|36860700016|18002099003|22082099003|4143699003|11063799006|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: ovgTk2GEspka/pDbVpGT9OL7xYDYGguGulwTGuNTkJAdJA86Tt3YfRELK2jk9S3UldcXIuGjBoE1EwFJtTRwmda9RVSKTgNpHRunG1C6uOfWYQ9ec5MlIbM4TLQs8ZjSXdyMMH7LiQ+hvPe8qnsqqdpunPbBqbQdXnWw2icYhCod2leZZSajWmNsnvtimQ5z/TA9CLlr/e0CWgPdKur4kIvzNEzNRpDFTXdW/idDMtZ5EYSpv+SkwRQPHhCoq5ZHmsrln3tqylzuRltMs1vT97SWAr3fXMDe5tRnjZ8p5+9RlsyZAx+uP2mUNm0aNUUTWgVOV8dgsPJUiZR5mIgYByYhxRkIpi0w6EC2zH2eG7DnGi5/D22xKFhbOizWKoLtqiW9UuZAwooGKA5JT4hQZaWKIpSK3Ejzp35IGWe16orq6oOp2u0xLTuhdH5b+akBD1D/wr8wbrPNnODgTWwb6k8HuYg+PwJ/jxGcuEodQ+h7EVT8x6nDeAaU+B0C0gHXFh0G+4gJ270o+TgTw2g+C8q6F26cbg39kMvrk9bxBrg7P6yaKLRPCIyBxbMkIikuvOK+PuajspzYGDGZKH2pB0IYYjjuFA+B4l26+MxuVIxTZ5qRHsTpWmjsZAVdKNvuOmn3r8qa7g+peS8cPWaB8SBf+FidIN9wjruvEh7aBL5D2i+KuB2R5HzPprsn4kVqNUZ7TnD+w8eWuUISfRt/Jd4+6pjiydZ/IBPbp1C02XI=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(4143699003)(11063799006)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OTuADnAWqCujVdaQ2Qj0ndpZqyw2iVelikOIZ8oAG7f+SmCHpOoVmyTAiOd0HzQuoLV784rjsK3bHl/CEBpXcK6zzEXcG/KA00Nad3L6fCyDcA/fymIjuW/PhYSVQNnvQ93XUvbSusdN9UOaEa064whIURFd0tfq8kCjtHsFt97K5ZB5s1CtMGbnBc9oT5s4rO6JPGOdiPJtHDRHv6GqvB+CrjCa4ZNULYTLCiGyKdqw/1WPz4xwXxIvkasoZ5fCkh88ZlJqOvMspCzPvk4PWFtx8WkPVwOfOixdZPnw4otHt1wOD/N3PcUUcz0jLlmRw6/tWp01ex9YJHxxuiBhrKqC7yvrjVLObe8tGNREndSz0rqflhnIsNiQzaQ+pmFbPiKJz+k+diEDp9qW69JHT2UrLFkumSou4IiC5Jga1HtMbVgVldp8/vsN0oc/Fs5V
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 20:19:28.2179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e1cdcc1-5d9d-40bd-5a2b-08decb1b66e8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9704
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_131933_983660_40EC3113 
X-CRM114-Status: GOOD (  11.78  )
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

On Mon, Jun 15, 2026 at 10:43:01AM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 12, 2026 at 12:11:10PM -0700, Nicolin Chen wrote:
> 
> > VMM would have to know which command failed, to flag it in the CONS
> > register, indicating: a) commands prior to the CONS are issued, and
> > b) command pointed by the CONS is illegal.
> 
> It is a VMM bug to send a malformed command into the kernel in the
> first place.

OK. I will follow that.

Thanks
Nicolin

