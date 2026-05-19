Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816CBCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 18:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCK+io77s8e/tEkO+Z5eSKvy/TfWV/JKNcQtgScNMMQ=; b=1b56zgEHUvhgqi4yu1Qrn8KrJ7
	wzAdaoKaPyfeI7zEXl5xWXqCZQfwn6mPm5/bMO8TjOXe/lgQhGfMBLssmeCerSNsj4eZ/rcUkKT+F
	/Uq0/YyP2DMKyOBPdNG95NQuNZiKEQT4xPaURyZt+194cPyP09+dQPmKDfEmLMwuJnop3KS4he5L5
	wFDqRFcbqQYe1a6Pt4/lgXu/7qhfNArpXcc0pS6nfitfxZ/uUktzXvlsruKFJZEpTsPDVEk8YeZDk
	OoneRo7mEndmJsPeKZp0mRfT5JLsnrBhcFjFaszLbdxfIyDB4dqyz3GBdXo/d8IVqruonRvc0fR1F
	++itKzyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPaZ-00000002Yc6-41HC;
	Tue, 19 May 2026 18:54:47 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPaW-00000002YbL-3C0Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 18:54:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFP7rSMKGyxgrDckaORGOgTDQYvhLB3HqIIlBd6JZ2CnNrEbNvrE1Vdk/e95gFHWlevipwk4dJkFx5uAySDpsBS49eqBfeqGcyt8znvb99g0HvmN/Fo8yDwJ09TB6J/BA49TLDQz1lryQPpqdH6OP/IhwU1YD7jBRChABLL2pDc+BWVs4NXpM2hGswBo36CFZmmIy+eb5YvAkjQ4TEgv9TxHM58kmH2U/V2ezlMxrfa4+nBn8zahmd1OTy3LHA3QWE/rn7KhYQqVfCzcx9ri4ONbBJGl1fCYYA69G2+xV+wrqTq2H49hxNjATzc9HZhmhHGkKeb8Iz1gFLWpxoOEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCK+io77s8e/tEkO+Z5eSKvy/TfWV/JKNcQtgScNMMQ=;
 b=X5IaH/RATeLg7s0axZhAIMQQlmtaqXKwtKCgNKX20cFtc5gwPH9qsqfsdddSojE53MJvVQD9pq7Fh5Re09YBPOL+Bv65OzTukN4/zIPIv/S2DCQiis1iPruTETXakO9AmgVdFqCh9hA7F5jVj1HbKdBVXv5WtC5Q9QkphUIgoG2mf29xEXELsaEvUJabwcmusplViHzjqRiRsvOAaAK5wgNvcWWis5DGeC0yhWuCzyLuEU8eGWSYG+KZaZ02TRdMn8L1qKsvwFh1PJ5229VSKlFef4+/ewm7JItYYhoMrKE1JHVbRmo2e8bcUpkVtczS5vAA15fScWoCgEY89ZAeSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCK+io77s8e/tEkO+Z5eSKvy/TfWV/JKNcQtgScNMMQ=;
 b=Jow1kDKq96pZjpn/70DdJS+hfQnu+bCYIJwwz5HHRJP2Qec18OQaXAzTCzAcc4M9rDnvVGg+FQefgseAWiFTXWACHRQkMfLwAWt2TsA5dOmboEOZPWZuzUUWO+8ZKKTA3YIN9FNNt8kWaZpB9KSw7n0imNc3sn1SsGmJTpSu+k8MAg7/RfuKaIRg0zn3P062hKc+TlVl9AGDLnAIJkAgENKGY99j9wWGt/71xHtHBDOeNFsHglTC8cHi/Xli8Ir8M7jrbOaGtqRepgRIonWb0LbMYedH3DcsUlSSXVXDLEBdHbHVcsg/FjPHEe5q3Hj4XJPyvkkxGEOkkHswn2ySQA==
Received: from BL0PR05CA0015.namprd05.prod.outlook.com (2603:10b6:208:91::25)
 by DM4PR12MB8569.namprd12.prod.outlook.com (2603:10b6:8:18a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 18:54:28 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:208:91:cafe::4f) by BL0PR05CA0015.outlook.office365.com
 (2603:10b6:208:91::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.15 via Frontend Transport; Tue, 19
 May 2026 18:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 18:54:28 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 19 May
 2026 11:54:11 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 19 May 2026 11:54:10 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 19 May 2026 11:54:09 -0700
Date: Tue, 19 May 2026 11:54:08 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, Bjorn Helgaas <bhelgaas@google.com>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, "Pranjal
 Shrivastava" <praan@google.com>, Mostafa Saleh <smostafa@google.com>, Lu
 Baolu <baolu.lu@linux.intel.com>, Kevin Tian <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <vsethi@nvidia.com>, Shuai Xue
	<xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v4 06/24] iommu: Defer iommu_group free via kfree_rcu()
Message-ID: <agyx0OhPB+6ZPfJu@Asurada-Nvidia>
References: <cover.1779161849.git.nicolinc@nvidia.com>
 <a65846f5514fd3b7ef6c19e060ed3a25af75bf03.1779161849.git.nicolinc@nvidia.com>
 <20260519113916.GO787748@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260519113916.GO787748@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|DM4PR12MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: 490fd3f0-b7d7-4d70-f46e-08deb5d80dd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|11063799006|4143699003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: h8mfqFHQ0XcremjlpsnYCdeH3CodQMgU/jVdfyHMGnyYIPI5udY+YaARQV4/gaZvWPRe3iXMvMub5wy7l5SlUBbLTiKNl4FPOSm/C0iMuzoyG21JISwzeHKEp6i2RdxQCqjXsAC5PNNPm+5V4VgUW84YQhfyK6egSlzzLCV8mcAYm5Z6hBJjCAGUv1ZX2WpLF6iwWQ92ldrRzO6pzCoJgE0vqhDhCYPxO7ZV1ISqWY+tNq7Bq83FwIQckopfXKYB1+pR2DYMVrANBY/1a0IILmXr15nFS0RpGu1Ku94W4BE7WJ3Xo45RqX6DvAgCT1mc6l054smSiaYp0A2xlWPnTS24jkbYUy5Pl5msMR4o6TMxRfcYjbdihTH8p66VJbciYdB18VSMotCHXAvZoY2DC9Y2aGjp2pQoA6JAOC9xVZZyGoQRBzVn6v0crEMW1tQoC2XLNGe/mv4SSBg5iWaLuQF3Qd6qg9P3A3bOKhKb0aJLQPZMSAdLrAfXWH5y/YTCcRHIVNziowQQz1FwkE3nDCT8e0+fw8ZbgblpFHTh7pOzk9u7jlk2IwjSQK5UYQqUeEqFj/0vBrDa/2pB/clEuPcXZIpP0Xfeqhz5uC/5LWNKBHxuOfzv/xAwbNlVzKpo3qmQtvuZznxGKgQzYdvJHO+TcEJVS1HVD/fJVBL6xjCHlM7ZepFlbblxXZb83qtF8z+l57lhEQXYeL5XF8yk/FTPddW61AHl8Z70X+1ZcR8=
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(11063799006)(4143699003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hP5nLuCM2xfX7k4w9tC71WVPg+K1dqGm/gKPKM91pvKNvuSyrFdgNc+UuoFz+MGqdZJB0t5VxZdO+jt87VRWQ+umjedIDsJLXW0750+nM5U/eavNsTBWrg9l7ICr37UkYmNXJASEZzvdAhyDPrjgtZVEahqL236LG5PUyoOH9yZoIe4tm0Xw1cKhxOb7/zl6MeRF9nauDGp0kCvWGIz0QHgiHfLcra3F8+Pgrp9aiWdPfcJOve7ied3ZJlGg98DvDW8Pyph/XZVs5B6uZbmz0EwBfG1idNhWgA6iLlFvLjn4aKr/7SN5bCERVisi3RDZz2u5bFWzqvw5ILkJIflrbwscQkOOAdb3HJuVI8/q/GzWbTEv+edguGMsN0yhp9chR8b8j/fViEEGeJ4/kceVbIrUGR51zcwIrgoTiU6QGpbwOVEvhZn6a6JaP/aLjr1k
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 18:54:28.0653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 490fd3f0-b7d7-4d70-f46e-08deb5d80dd1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_115444_803481_5886CD46 
X-CRM114-Status: GOOD (  20.32  )
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

On Tue, May 19, 2026 at 08:39:16AM -0300, Jason Gunthorpe wrote:
> On Mon, May 18, 2026 at 08:38:49PM -0700, Nicolin Chen wrote:
> > dev->iommu_group will be read in an ISR-context to look up a group_device
> > for fault reporting, in which case mutex cannot be used. For that read to
> > be safe, two things are needed:
> 
> What driver does this? iommu_report_device_fault() has to be called in
> a sleepable context - usually a threaded IRQ handler. So mutex is no
> problem.

It's used in an invalidation context, where mutex is a problem.

> This seems like Sashiko slop - iommu_group does not change while a
> driver is attached and a driver is not permitted to do any "fault
> handling" after it has detached, it must flush and synchronize its
> IRQ if it is using this from a hard IRQ for some bad reason.

Oh, I probably picked a wrong word. "fault" here means "ATS broken".

IOMMU driver sees ATC timeout during invalidation, and reports "ATS
broken" in a lockless context where device could be detached. No?

> You need to be alot more critical about the noise that Sashiko
> generates, alot is useful, alot is not. It is a not a tool you want to
> have 0 reports, complaining about hallucinations is expected.

OK. I will be more aware of that in the future.

Thanks
Nicolin

