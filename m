Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CC01077603
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 18:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uSjza+Pg6L4somw7c5rB62XxatgKpxn7WgFljf9SzU=; b=QSZTlzHTlIv98GNb+LaP2BKAXE
	9DUcKlveD84XPS0M2IrRPSJzQ9DcPxGc5baNRuzmAne/mRJlb36zV9+Ffk97jXsEpkp3eEgQgesxj
	wCfY+m+R7V/BHKAaKFu9EIPzqKMMc6xlrJzYqYaqW26DQbW4nQ5PigzfQOG3ZE6aairBrM6a+XjeA
	za1ndGo8QA5gd8owhpH0IixBgeOF9i3On97EQ6VmnEU78LWp+75A4b68XgBvEHiBTVgiUfyaE6sl0
	cJ71pVxrgiN1ePF2Z8vXRyYhWU5vzUsol3YF+DWr75udZ8qEZu+Sf3TX5QYmUgYU2WJ96UIO1Q16Z
	f0zMIjzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vrL-00000009BJK-10PP;
	Wed, 18 Mar 2026 18:43:11 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vrI-00000009BIb-12zk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 18:43:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jS1JaOTj8eplvC4/TgNm/4mzUXu8ADQaT3e1vsxUgnlDeA3yzuVkpsiBq0TxD9pNuwzU/U7nqsXsWc/MTxczIr1xSK7rtxUjFanORmz00UccL0RhAUsccqAipnfxVPRbyy5bYulnELtaSFsIiqaObmzYs6C36Q1JfDsOFqioS4HfD+ggZ+O2tGuhAI60ROqzSFJptcY6YT6tjTsteaCA+kVEn5C3Beq8ShkII8qS75JBQNUqZiJvxsoZU/BJo1RDmTG531UBoFAyqlgne2udANC/eI2BQxpTsY/8nbWY6hQZwsZVewG2mxZ4lLuzc9H9iM35KaELgVjls3Qi1DTo9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4uSjza+Pg6L4somw7c5rB62XxatgKpxn7WgFljf9SzU=;
 b=wUob/JTv2EtbBlNNSGmJ8lHfGK684TSV8fS8lSN7NoSnx7rlpeeESXBqtZI8sOGi4DUyqxEwYu/2I1Jf54QGUz8eJrbKGG4ma3/hWKYax1nNBI2JQtyfWlgqsmM16yI6ElzgLc0WMn6qvZhjijH0qOUHamjXo1EeDvIBIcZgNsL2M/JKJdAJmfp+238KCgRz4PlDgKFq4klNIw8ls3L8eUhXe3f+/+0BxTx+JzqBdvuEP+tpHOErNlIFIG5HCNOIMTLBz5qyCssIE6b+gqr+8k4NnqU3LB+W/Bqbr7ZBqnirPX2CyUIPgUf2lEhY1h++TfDsCyfNKpm/PbuHsEV8MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4uSjza+Pg6L4somw7c5rB62XxatgKpxn7WgFljf9SzU=;
 b=Q+Jonq16UdoMfsXd5XZICAHay++Zs2LS/NPoCrntMrtY9i0R5kn6TdqI33oBQSs+a791txLdTVzwwDq/lx8InlaiVRxMphB3ffB45AGAxdYQWLB6jP1SSgfNzxyfiIGcgHAAdPEi3hxrLB1DJ6o7jvkzZVcJeCvRvqI+XZnJ6QgE9+JGu1JOSli8gGFF+ak/nKBnpd/kscnDMZ/G2u+PnqOb/Y7c/gCatUHCWZqf66H8b8YWLNYnDX5RRI2dcLLl2WOrIMrMiWnQodRJy4hqdFqhFcjE4VMys3xFKqr6r53vkvFCowvw7dQqcWKc0ceoGbbi8lrO/JnmG3JxyfO9dw==
Received: from BYAPR08CA0002.namprd08.prod.outlook.com (2603:10b6:a03:100::15)
 by DS4PR12MB9794.namprd12.prod.outlook.com (2603:10b6:8:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 18:43:00 +0000
Received: from SJ5PEPF000001CE.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::99) by BYAPR08CA0002.outlook.office365.com
 (2603:10b6:a03:100::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 18:42:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CE.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 18:42:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 11:42:36 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 11:42:36 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 11:42:35 -0700
Date: Wed, 18 Mar 2026 11:42:33 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<bhelgaas@google.com>, <jgg@nvidia.com>, <rafael@kernel.org>,
	<lenb@kernel.org>, <praan@google.com>, <xueshuai@linux.alibaba.com>,
	<kevin.tian@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<vsethi@nvidia.com>
Subject: Re: [PATCH v2 2/7] iommu: Add reset_device_done callback for
 hardware fault recovery
Message-ID: <abryGd9F/IuInm/s@Asurada-Nvidia>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <3750a106b4ab4235df842fa2b9defbc8226ebbef.1773774441.git.nicolinc@nvidia.com>
 <566549c9-fab1-43b5-a35b-e3c76f1c285d@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <566549c9-fab1-43b5-a35b-e3c76f1c285d@linux.intel.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CE:EE_|DS4PR12MB9794:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c388ad5-acab-4302-6275-08de851e2d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|7416014|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: CXdbGn+wkUZS63ov3DvQ9QPpsF3m+jFfMi4SLqIsVWbat79cZJlAB9Y5iDs8QVzWDyPClv8MaFus0pDxd1b5756HVdjJhk/sB4kK5dkpB4lwPFHXPFyzbO/HGunD+PvUPBeU0msMufkq8Jcg5woNlb6DZgqaGp7d0WBDDONBncAOKeGt8YSmIDJVDe9A5svo1BnC39gLwfx9MVhOWSBK16ShEYeG/mfr92FGcx6BBeLIGQVwKbx9zT/3UTP9cDm9pslFBJtVnCnFkN0GknFkt/nvyfS3VCDTSadWWV7pWMKaZTIB84mxHawyhfES4bm3HRTVzFbg45DNTiRuk8afhj4jxqutudYpcgQq2SayrASkl4QPHTc4YCU8QK0orv3ojZ0VYGmrLc97o1kF7UY1XTMUD3vimLLR6p0fNshmyzUcrLcR76p2MmOO0EjdVUJVRNOmb6Me5Pv2koU6mllYTyMpRgDxwM+RmNEX8oQOicyzTk2RhK7gotaBuehP5OWNJWtiAVqF+Wghtf+JIiAUGM6+vYZTYDqX4c7rJbAwJqUa9eNnD1Pb2S4jTPfKJpd02ETL+Wvunop/nOSUQZb/ONXH85CQo08YqMevKyUL3+AO/tCPxWGxUu5z+zQhMeJOl1OljmWEsXhrgKV79DjB81R2oYurMblDstKN+jpdoN1qFGeRMmdry2FwKpzQkcSH/fYTYMNLtp81WzH713Pb7v6bJlY9b2dy/gu0PWhypJ68kAe+ZQL9gGwW04/KJX3o9519vhpKK7vyo6tbGfpq0A==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(7416014)(82310400026)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: b2C3/rpisHN6UZLUp9S+Qe1seYOqtLNO2vFe+iaWyAHFLe9Vh3lpNhhL58Erp+eJdUmtheYSGE/QxnwM+UrvCI1+OEHWsVrJN7nnnDxg/IiZp3PadJ75LVtKc/z5yiIHjNDa6ZYpFJNSF0z+7cx+J6Df/tJWvTbjb6wbBgGpShg6FaEIWE49OqgAEd7fNirnrIkPtK1tpZpbz6sBkU1KneY7nxWYpt22UNv5Y5Pw5oowJaYxSWSCM+OjOGL2B5N2NHvgxvKFpx8APuIYjf36E6fh527uI2ncFfqyHvcLhg/ulQyNkIIY6BTOeCyPXL4m8dKKe4IBXbjhpSsYNS1R+14AR1kziigt2UUKHmxpBoSVHAuRoVd+ApTQldfvS+XWBYFGbRWqRwu3oFNo/e4ND/VJE97mplpxdT7TKhAzvkDKD711ZxVmxzmfw3n6ISub
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 18:42:58.8013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c388ad5-acab-4302-6275-08de851e2d57
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9794
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_114308_312717_C422FD64 
X-CRM114-Status: UNSURE (   8.23  )
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

On Wed, Mar 18, 2026 at 01:59:58PM +0800, Baolu Lu wrote:
> On 3/18/26 03:15, Nicolin Chen wrote:
> > +	if (ops && ops->reset_device_done)
> > +		ops->reset_device_done(&pdev->dev);
> 
> Nit: dev_iommu_ops() ensures a valid iommu "ops". There is no need to
> check "ops != NULL" here. Just
> 
> 	if (ops->reset_device_done)
> 		ops->reset_device_done(&pdev->dev);

Yes, right.

Thanks!
Nicolin

