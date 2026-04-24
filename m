Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE73FED3F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 19:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/8FVfyx1j6IAH1RF/nR9TCTxzIhBd1Lcs3X4GTLgys=; b=xa9JglBHz34bP4k3ji+RMAVKbj
	IwA8B0m3LiY3j7GENWB9NOZI2UKtcVTQnTzRC8cib7EzLqyRvQc3p0WbR4WLJWGhKu3SARNdN8xJB
	R3oEp0BXww0qjMyAfg/Q64RT2OHXCZawPL1tki2gWi0MZZKyDliWI+I+p6/493x+N92jZ/BgvNk5T
	PXXCA/jgPrDynyyF/zWeDGTRVbsuzmCPNlgHDkDF+iFH4F+ucSKdYfPFEZxPAZVJs2KSgQtHWAOuB
	w8ID2QiKWd33mjNoXf5wHYPcTuu/Cg84B0OTnLv4TSny4DYP8eRd5p4xLe230tuXE2KXSPHioUTsx
	6kv+WruA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGLxY-0000000DgdC-1JcU;
	Fri, 24 Apr 2026 19:13:04 +0000
Received: from mail-eastusazon11012065.outbound.protection.outlook.com ([52.101.53.65] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGLxU-0000000Dgcq-42ZK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 19:13:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMCFif/8WxvBQLBTo1EFVeA02MVpYCf/QCQkFFbCF/XjTuTiE50cawuOWN3i1fsXk2VQySBXj4Bc67jBWICmkiRms+y5YwBlJgkYpWTLjuD2EgUuem0l1GHq59sXbK2mbKRUqZ3jr1IszO3iNQB7LSvTy9mi62st0khYExeWcPDkdoC2GSBf4WXwc0666TKStg9AfTCUNRxJzb4rre9XbvagdQxkPae8Grqx/6a1dlXLeJyD5BxALU53ZL1cFIJsPNKAJZLhfcYmstAGSxCnsxPxGq2CY+gcucQcvxoLfhGshUdg8xuqwBCDKKrwVoxJ3m32lyMYm81sSxXCL8r4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/8FVfyx1j6IAH1RF/nR9TCTxzIhBd1Lcs3X4GTLgys=;
 b=pbjUaLTEMuqXCyMgnTzDjWTPRWZPC8RRLUoGPqCsY9Df8+MwcGb28mZla8UurolOmiPpyG0ghyinJNldVTHuboJv6of0Jo0ojdADziXBokKwVxYdg82vDurkNN7L/z3hcTX08tIn7Rp2z9bcRKUQAOYeqjP3gfo4AA6P5Se6+8lc1ecONkJrdB/tg1H23DLyd5oX5bO/b1JQYp+Req7pV+XQf7cfgLc2QXSjYU38f8JQk5kTE7ikcDVUx+pqDvUlERgZ2b7OjTMNT6Erkc7gogexmFexbP87cwv8L2fVXHU7kGv+nve6/S/O2JZvHLOLe1McctQL3NYGL0W2UGGQbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/8FVfyx1j6IAH1RF/nR9TCTxzIhBd1Lcs3X4GTLgys=;
 b=eM2mQZO37icho9fUzwfy9X7Qs5gJSM1+q58qhNFvK050cvY+gQNoP9YZfhlMu+67yjnsIdGQIOmTFw3jnx06rM2wQmMZ1D+ZiGDq8feguDQ4yhU+yfez6mWOBCAnlcWET+xWl2vZsjA1wcbhv6PTDZORPjfD0WV56TTWsm8j7VT188JHBmM6gcr9pRUcID/bKOk7Wj8eR/kcSjD0ZjAjYYyyg9USWvspKyu/AUAKMIs60ikFJVFDuexjcblls83d1m+yy0sd36CUzjkrliXPIyl2ZOBb4V72wG7HnsPQQ45AmK8cvoig2fKXvrzooqTXiiYRc2WnnBvYkIdHRMjXcg==
Received: from CH2PR07CA0053.namprd07.prod.outlook.com (2603:10b6:610:5b::27)
 by DS7PR12MB6165.namprd12.prod.outlook.com (2603:10b6:8:9a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Fri, 24 Apr
 2026 19:12:52 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::4e) by CH2PR07CA0053.outlook.office365.com
 (2603:10b6:610:5b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 19:12:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 19:12:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Apr
 2026 12:12:43 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Apr
 2026 12:12:43 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Apr 2026 12:12:41 -0700
Date: Fri, 24 Apr 2026 12:12:40 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Baolu Lu <baolu.lu@linux.intel.com>, Will Deacon <will@kernel.org>, "Robin
 Murphy" <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Bjorn Helgaas
	<bhelgaas@google.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Pranjal Shrivastava <praan@google.com>, Mostafa Saleh
	<smostafa@google.com>, Kevin Tian <kevin.tian@intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <vsethi@nvidia.com>, Shuai Xue
	<xueshuai@linux.alibaba.com>
Subject: Re: [PATCH v3 05/11] iommu: Change group->devices to RCU-protected
 list
Message-ID: <aevAqKFq7ATYk3+i@Asurada-Nvidia>
References: <cover.1776381841.git.nicolinc@nvidia.com>
 <12a224061de4fff9e0725909fd0ba4e14996ff08.1776381841.git.nicolinc@nvidia.com>
 <779dad61-d7e7-4ae0-83a9-8c5920222219@linux.intel.com>
 <aerey+ULGG589rdi@Asurada-Nvidia>
 <20260424131148.GB3444440@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260424131148.GB3444440@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|DS7PR12MB6165:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da50109-f34c-44aa-b748-08dea2357bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: kxJyYShzdGF4VYgjHFkQsRKYJUGmzu1gofksDD/C3iUdpFqD4yb76FThviHARCGL/lCT3ltr9cKreXP4ybBp/Y6IbIVq86RGJbz/2GEf4E3uR/0cAZT7K4jm53QbE9bBR1IKO+m3/ugSAyNdt6xkqJPG6ed/cEznwDqxAhOurAj/2NmrzcW9OfPG2ip5T/sUNLtq6zN3elYYRi/H+Q1wfAqqBAJOAHbIpIBH8CUmuYM4MOkwqa4PAzteBau23LE2VIf4ZWU9qC9D+1QxkKRMEfSZWPVDBxZSIXVOobilMAMzXGZfTqlJliQ9uxAiFfmtKeeg2q0ByQRWAzulmRKXecB/+ZubTQ12cUnLCMztwzIE4qokl7nCOOdTklexUG4eGzIyOFd0cLciZn1oMf3Mn+HHpjmXjXWJ6eR29D5roQk0qwlu3e+vAc+hWCBvpfFXukA2orSuEHu3qRmpuHQTO6hea7Exy+hGkfOdwSOEpVvqy1L/PxnmcuxiJ7LecQWueIOiScyGJ+KAzUG/MSEemJWYmmwE/V1q30HnY7LfwdKjLM4z/+2iKidjAq9qT6lEkBGvK795f47xbsNDJZ2yYMq4QmBRLU0I3IHMFG2EhupeeffJ1TpELsL8XhXczNHKP5G7lyHljlPQH6pgOf6ZszAQ9xSGzl89yJKlXCTrUtIvKQItqccMFV110Hn58ol1eXbvBPSfY0C6VmM5vFSzJWiXM332V0xf5Ummf6ud8OpjezkoVS3L3fsuoqblTT/LGMlJ2sC09F2UjQFpl2RC/w==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Jap90dX63RHXFOeUTL5OUT2bUtkxwWtQJ7geaciMsn404klYyeg2UPLteHlUdB2NAr0moqBp/UDt19XzfbpsebtZnGaFXFXXjBNKQAtD/eEdDeMOMojlvLf1YCYyNRuRH9W6BiACBcuDuhUSxD3Zh0uZabi1eTnzG03MUY9cIe2FMybBTHC+SNWXtuLtwdUc6yfGiUX6/ZrY59OBQ6qfJnbTNziy8m4sbykhNL8TV/jGKQz0RX4KwlsTz6woMZk/By3yMDOxDEgGqEHrjflw65hmPGPIll2/WfZNRwZL8OanJXf9OGiEC+j3JjFDwf4/aBptDMtAM0of9kh2UlUntpk4dgglx+OagghIHTPO/RY70H1YK3d6OoeugvvzBBkxsXrSGC6m4eLsIFirD1fbyzYR/0EN85NCVxyQPMcfQsbG1I9yndgWBtUvbG0dML7i
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 19:12:52.6560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da50109-f34c-44aa-b748-08dea2357bdb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_121301_008438_AECB8164 
X-CRM114-Status: GOOD (  16.35  )
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

On Fri, Apr 24, 2026 at 10:11:48AM -0300, Jason Gunthorpe wrote:
> On Thu, Apr 23, 2026 at 08:08:59PM -0700, Nicolin Chen wrote:
> > On Fri, Apr 24, 2026 at 10:53:49AM +0800, Baolu Lu wrote:
> > > On 4/17/26 07:28, Nicolin Chen wrote:
> > > 	    mutex_unlock(&group->mutex);
> > >             /*
> > >              * FIXME: Mis-locked because the ops->probe_finalize() call-back
> > >              * of some IOMMU drivers calls arm_iommu_attach_device() which
> > >              * in-turn might call back into IOMMU core code, where it tries
> > >              * to take group->mutex, resulting in a deadlock.
> > >              */
> > >              for_each_group_device(group, gdev)
> > >                         iommu_group_do_probe_finalize(gdev->dev);
> > >         }
> > > 
> > >         return 0;
> > > }
> > > 
> > > Will the change above trigger a lockdep splat due to this "mis-locked"
> > > case?"
> > 
> > Oh, I missed this one. That's a good finding!
> > 
> > Perhaps we can just change it to list_for_each_entry_rcu holding
> > rcu_read_lock() and drop the FIXME.
> 
> You can't hold rcu across that function IIRC

Oh right. I didn't think too carefully...

I tend to keep it as-is. So, maybe just list_for_each_entry?

Nicolin

