Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA451606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q9ckYqVV;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=D3wrzLXf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XtdDfVPsMN36q2fjhM7w8igynxRl1pFxGYhtL5UkQ+c=; b=q9ckYqVVy6hEnf7cDiK4Cvj5km
	eRbxDewRKbWuMsVf8svoUgCjMnIbOPFBepwP6VqiMGjPo3q5/Ihxv4o//DRiL7WWlcMWxLxiHxXug
	Kimto1fgyUf5pRQCh6ig7Z6tz09YGorvfC7ggek9aKkT1xjdZ67E+b5bU1B6lsdfdbnq2LTkRmnEZ
	Z/SanVPvAUgr9edAgIxMsl1Aw43OzhVv+w+wsOFaNLXhtYbgpniG4S2cbiIoymK6An2AY7Ay1m7fJ
	5ghsv9KSJJWboRMQ80Acns3wkIa7T6KVFxNTy60zxCRIsYKWBpOLZjt81x6mexP7Yq+NCPAAfmqwH
	1fY53xgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwpB-0000000HaxR-0NUO;
	Mon, 02 Nov 2026 18:32:05 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNwp8-0000000Hawp-2yPt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 18:32:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vAMRjyTPOQwpB+knW9aPo9ib3o4b7LuHWVoEx7xj3B5fKMkf656BGuPrAqKlVwx5hwTXNriS8++wDITBpUNS7LLVc2IfaIymTWP/t11R+3Ue3MRouHO4OazvkufNoqrjkve9jKhFJVyIeQFE4yo/8lehY1dc16vzdpXXGUA2YkHxB6LXToYI4F5Uy9KrPMRcczyyBIoZ8Kugk9e6eSfZ1Y10D3frNOtGpNh4glDRdQvZELxaAl33Yh0/3mv/sFtxSXTo0ejKKA3KDskjBYPBQ31HwX0ribwVZFBX0kqNkJonQ7HCZjudGGU8J6sw1ItocXBHVpzRYtiCZ/NgRRi8dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XtdDfVPsMN36q2fjhM7w8igynxRl1pFxGYhtL5UkQ+c=;
 b=zDEqPnI2uLAq3YzoocN9sjGf8/wJWi3126Q5qRLRtK3XC3RE799/1M/Na0t9rT1OvePpsq9raCaBmJ4A3i7GR+hOvjn0SP9YdSJKIido6BW+hVEauV+1Lb8Q0BL+DJF1TOdBbTPB/vsflMi+0NMBHYmtCvrdKgr75kZfoJx/pNxKmv2LtpZK4ktuMwm99pJvISMEq62sFKvsGajufQVapjKg1AtTZWEWcwmzcB3TPnTrDfzfeCGcogd9aVQQAXMQl8ImGJYBGwyadCREX7Dfed2QbRVo3ORbexLTpHbLdF4Uro/yncVUyL/E36OoI4TTSAutps7anNS5yxo2fSs9Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XtdDfVPsMN36q2fjhM7w8igynxRl1pFxGYhtL5UkQ+c=;
 b=D3wrzLXfdfkoD9KgKbJ0MbLsD8zgy1GZylL0kFaVPVzUqtdSQvtqFY6aJpVlyfiAn/b66LFxG7sZ8tIm4zHt7wy7IdN2O5Mj2u4oCnOtxdY1vFgystLrE2E2O2JuvEhF8VQujJf6Y9Yfg0C97gEDzl9bZdGy/xQ0AgrYVJT/RNUBL6VNit6YgkR3F52BVrk4/+pcLGMu6/o+AnhGFs0iAGhABMVWA0ckvbje6LcVnoXDQj8jr1Zo213SEb7bcwlicmBLh2Vk9/Y448skJBCyr/+HQ4rDtz/Ut2tQ27r3FENb/mtCdpNjiWoYp8iDCOMOQS4b0s6nYqyJpuY6KxJ4mw==
Received: from MW4PR04CA0377.namprd04.prod.outlook.com (2603:10b6:303:81::22)
 by LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 18:31:54 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:303:81:cafe::54) by MW4PR04CA0377.outlook.office365.com
 (2603:10b6:303:81::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 18:31:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 18:31:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 2 Nov
 2026 10:31:30 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 2 Nov
 2026 10:31:29 -0800
Received: from nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Mon, 2 Nov 2026 10:31:28 -0800
Date: Mon, 2 Nov 2026 10:31:26 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, "Joerg Roedel (AMD)" <joro@8bytes.org>, "Thierry
 Reding" <thierry.reding@kernel.org>, Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Jean-Philippe Brucker
	<jpb@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC v7 6/7] iommu/arm-smmu-v3: Group aliasing devices
 into the same IOMMU group
Message-ID: <aujW/ih0pRvJdcle@nvidia.com>
References: <20261030-smmu-shared-sid-ver7-2026-10-26-v7-0-961726ebd6ab@Example.Com>
 <20261030-smmu-shared-sid-ver7-2026-10-26-v7-6-961726ebd6ab@Example.Com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261030-smmu-shared-sid-ver7-2026-10-26-v7-6-961726ebd6ab@Example.Com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|LV3PR12MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: 13de14fe-a38e-4cb5-a323-08df390f91c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|18002099003|56012099006|261102123227099003|22082099003|261022105027099003|261021135927099003|261021121427099003|11063799006|4143699003|10067099003|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: Fukb3nM5hrA0KHG+uMUtrpb1epSBhZAzM4nVQwDgh0TqX0BvpAhPhlWwAhBmEeuRCBDBlm5fLjrYkpOZ2TePSk41GLxJSjhz06XwXaUfSmt4d6B56Btu9zspjU+P9D0coyWjbZLN68JmuvO2hW+2M6SQuxEwGeFsNePVzl9Qjf/AI0fq0kJwOorfNFRaQGOrGaXGMuoI529miK9jx6Kqdf4dKVQ227Dr42GrK1sbcRrjNmw+X8ZwKS9ZKv0MaMITyaDvlkwjAMRzxy4NTsfnClXyVp4GXvRlDvuYfk0NB0+PCgcfIiKrkP2hEFNEaurGyr8G8EtVJM9eL/I5mLQZ0B/HuG4TSQ7bBTB8py5BupTYFvRMnGKEHjp5lNUjilVIalSeBLe0XMQkYU0/+FbRhtd3o7s026So+mQf71cOXNy9LrJr/4BZPTUwLukEQyS0iOiZLQO+cVvPH1254HkghrcN21Pnqg9cORaWNjROBDfyEL33FdsCnrJYDy3ESkbZBlc6F/GqIJD25SzSMr5GYDtUnH1HYJe+svi+zNgC+lAiecjU1MBQeMTkt5uUzJGmlpCurd5DvEAl1IQxxvAfIoR436lTHU7ZqIjuEdd6gaQ85IpKaZLFhY81HGTHERQp1r2DILGDQMP3R7CW1eCun+4IGWBIamJp/m8R8XP10dPsxevXSQkv0BFFhUAY95YBTS9SIL3qdJKpMlgzZMPH3w==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(18002099003)(56012099006)(261102123227099003)(22082099003)(261022105027099003)(261021135927099003)(261021121427099003)(11063799006)(4143699003)(10067099003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: d5QfapfVihS9pUQD2ysdydnlafo2uOl64vkWr8W9ZqBxei9P5m9UWj2lJe5wGrtqMA/l7/qSNOonM6bIq43Vt/rlF26JlPdS12kgUt8WmAhy+yiRhVeMFfxxmNho3HrKBbvf9IVLKBJSanQSFvsrvdUuFJsj5swClOvg1nFeOVBqt7VMzOHFh/0YdjjxXGXcXOSuZ2ADkOt4y6Ky80WVpkLGV4546aAmb00SWwBN8kR548MzUR7vfMq6qVewgzvTxwnuDKE/g5pp2zfkfMPKIkK1XXlQ0FrD3NiOpUpKNd19I6HTUBj3CqhHDmYCdWU+JkexqZXuI0bixQ+mFl5qJ091iTDOdFGidzJapcNySMeDxzpVP4K+QkBnGnVJ9sdrZw7Se+ZDjxUOSAzR0v/6pbwi2oNGdWqbaOzR+LO5KjGmE0ng6jXQN9Ey7s2sdkLu
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 18:31:54.1852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13de14fe-a38e-4cb5-a323-08df390f91c4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9412
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_103202_764856_1869179C 
X-CRM114-Status: GOOD (  12.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 08:09:38PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Devices sharing a SID must share a single IOMMU domain because the STE
> can only point to one CD table at a time. With the domain-owned CD table,
> non-PASID devices in that domain share that table directly.
> 
> Detect SID aliasing at group-assignment time by looking up the RB tree
> for existing owners. Since probe_device() inserts the master before
> device_group() is called, skip the device's own stream and look for a
> different, already-probed master that shares the same SID.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>

With a nit,

>  	if (dev_is_pci(dev))
> -		group = pci_device_group(dev);
> -	else
> -		group = generic_device_group(dev);
> +		return pci_device_group(dev);
>  
> -	return group;
> +	return generic_device_group(dev);

This change seems unnecessary.

Nicolin

