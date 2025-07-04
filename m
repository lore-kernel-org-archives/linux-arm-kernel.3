Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CE4C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 04:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPbah+lSD8kZgpfDaIiS/pRd26Nwlta81qIk6i3ZLqA=; b=GDccIY1vgdymnzZPCYJSL1xtwv
	UhM5vMnRGi9TiDvcK3eOLcG+MjW8BMUalyYabAabqTXD44dAPRx3nSOqIFixFa6G0PLjq/Ls8nScX
	qPxWCPKA9TwbGeqdDTfC/yn5vCsew7zoo1xojtr6xPAQj9G6sGWYSphXrMgAtZC7ZCy9pjhWFWtTo
	++73AE5NqvzEfh3kUrzS0tdiR9aU2GhDb/jGSDgU8UAh7SSU0Y3lJkvnHCrnkDVTI38r4jvEDUDTw
	Jd/um5CECQTAhoQBnV/GbvKF4PC5wYewIcF2HUjyUw2b/rcjxTUijHXiBCzeeZ8cUvsG92UIE5Sd5
	QygQTjBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXXm6-0000000DCeS-42uC;
	Fri, 04 Jul 2025 04:11:46 +0000
Received: from mail-mw2nam12on2060b.outbound.protection.outlook.com ([2a01:111:f403:200a::60b] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXXji-0000000DC8q-2Fgo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 04:09:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjev9KHLTsnsnDcxgBn1UmqR7+IAFm+DnpPKPTs4jvps7OJA4bP8HXyeSsmUNmGZcSE25cKxOZDyNAd6zmx/5BCky7FMW3gIW89LzLrkctYJh6fvmi+ymtnMmLPaRTmLj17+TgXUapWKwFry/7nQ8p++vOyg4F1f2ER4W/GoeOvuqL11HR1m9ldp2cjaOowGFmhJkU0swbnwscjubDEAxgqqIxoY6BbQ0Ba2F9xUf08VDb9vyMiH4MqOK4iD1zLNvHxu8wHi+DXDeNw5IZ5D96FGdOJQRquO66wN7BhlCoLzViTRVZNsyNz6+8o02mpkfWK3IEtgpPkInEboOx6wJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPbah+lSD8kZgpfDaIiS/pRd26Nwlta81qIk6i3ZLqA=;
 b=Wuyx6/jd6mxPLVI9ChUobmDLaR57a1iV7yK+raQ6HO//lTiEYECBS6KG8VTm5zFtw3TiqUm6wvUVKdRMWx+aLKiwlj4Smde3mHdg7l17FD46Y7vgd+vMpM/aGxaCygE25ttfpmAc3fvYeDpdSKRuP2RA+q/frSjAqoqyz/kKw/Xmrw4JyS1fU7x3K1JfaF9BFanrhN4QqOzsOnX+fa5aXreyaIyDeRlTO/EP5IRmtM3IhRD8ytXHTia/Xw13R+T6dFHa24spJ02+40tVwUubBfgbXJ/V4HSafouIxDPNDD4tCZtr0vGHM3qpR4Ohdo9UFD5EQyhYr5bDTs7qeiPvIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPbah+lSD8kZgpfDaIiS/pRd26Nwlta81qIk6i3ZLqA=;
 b=Eh0BdinZc6qTSXOXql7W0M61C9SY/cAc/17+D3QLsu4Coq0WA6YWfN9d3IhqUgIgGvbZXu6adV4Gw24iQfnJ0IgS/oRWvsnOloELmU4xlQvpQ3iCsWNUcIsmCb3eSmbDUFL5nVxFd96o2j3iuoJ61Q6hFYg+vRRDqByyKEEXYdOFymqKXZ+Sqrg3J8p/+wvXcSNJPosPsUgqom691ARexnCeM9K3mlxg7BJeDysNkN4PsyLulvgWrf1NWlaDHJOn91cSoPqnXQY1VpibGLLu4EoahgrpI/muKfR3p+TYHO4oYIdN9G+8aHY0K62wQ1J6d7Uezl3/ytfEPMTh3nzyug==
Received: from BN9PR03CA0181.namprd03.prod.outlook.com (2603:10b6:408:f9::6)
 by DM4PR12MB6590.namprd12.prod.outlook.com (2603:10b6:8:8f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Fri, 4 Jul
 2025 04:09:10 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:408:f9:cafe::16) by BN9PR03CA0181.outlook.office365.com
 (2603:10b6:408:f9::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.21 via Frontend Transport; Fri,
 4 Jul 2025 04:09:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 04:09:09 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 3 Jul 2025
 21:08:54 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 3 Jul
 2025 21:08:53 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Thu, 3 Jul 2025 21:08:51 -0700
Date: Thu, 3 Jul 2025 21:08:50 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"will@kernel.org" <will@kernel.org>, "bagasdotme@gmail.com"
	<bagasdotme@gmail.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "vdumpa@nvidia.com" <vdumpa@nvidia.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "shuah@kernel.org"
	<shuah@kernel.org>, "jsnitsel@redhat.com" <jsnitsel@redhat.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"mshavit@google.com" <mshavit@google.com>, "praan@google.com"
	<praan@google.com>, "zhangzekun11@huawei.com" <zhangzekun11@huawei.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "mochs@nvidia.com" <mochs@nvidia.com>,
	"alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>, "vasant.hegde@amd.com"
	<vasant.hegde@amd.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v7 10/28] iommufd/access: Bypass access->ops->unmap for
 internal use
Message-ID: <aGdT0uNtfIFLvnBO@Asurada-Nvidia>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <a2b2a9704d7efff717448cbb76695e83f2fe67c9.1750966133.git.nicolinc@nvidia.com>
 <BN9PR11MB5276F03CF1E97173E711A5288C40A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aGWSkRX4yUuuOVZ8@Asurada-Nvidia>
 <BN9PR11MB5276BED9EC2F89E805F6BA678C43A@BN9PR11MB5276.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BN9PR11MB5276BED9EC2F89E805F6BA678C43A@BN9PR11MB5276.namprd11.prod.outlook.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|DM4PR12MB6590:EE_
X-MS-Office365-Filtering-Correlation-Id: 81394f77-9561-494c-2ced-08ddbab086f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0o9i3f7j0kp+sOt+5g2ZcxUCnNKVmGqi3aTzFEESLq3JgQBYaHdOJmkbgmIh?=
 =?us-ascii?Q?HKP5Km6qcPrFqOJZ5lflGhwikhtJ1kFCNB0hb1BkU5AkXQa4Jd7JueWp/fdx?=
 =?us-ascii?Q?2oKt/OrJw1KhN43JlQw30+yBCeX9sUY9+/388TAV4aX8mN7/gg64ce3Z64N4?=
 =?us-ascii?Q?HzbpRWYOOjlu01c6wrNHPHn5JWDHXGuz37TIj7vxY5udHS6tkJMXTknCipgC?=
 =?us-ascii?Q?paUgoxINKuPGuS0oIWz5pDgZoxLLaZz5sChnA+yvPVlX5+ilY6gsTJM4SFYS?=
 =?us-ascii?Q?USOVKu4sSbwejXi7vPi01jIHigVYzt5kD1L9u9/opcXDgrT+G7XBnu4pZDNB?=
 =?us-ascii?Q?MHuYqhyJnnjdWlBhHdPWZYh3jNidHZ3P7i0pfJ7IPJ7taJgo9kK5l6R/uSWJ?=
 =?us-ascii?Q?TFT1ESp/iEbn4ANPqw9A5U41w/2bRyCc7sTqQjdeNKiaB5y8XlbGqi1ezDFx?=
 =?us-ascii?Q?FTrxu/tm+gnI8GWe9N0O95LmE6TUJm1DlfcSd6GWdtS8rNY+rDrlZYmExvfn?=
 =?us-ascii?Q?UrqHmC1a+jek/Si8RoPBRrE9ve7Vw2JTD7hNYFFMsXKtSPZ879ccc4ayXLfz?=
 =?us-ascii?Q?pFf5pQTYRwQbxvTPEzbv4RfEG02uLrUYmdtrL4+UGMfd9bNm3aOF5UUdGuq0?=
 =?us-ascii?Q?mvUSjcJrkX/7wcYqInUpmwziGLdin0DAlv8YgOlf/1VK6V7NmLZuIfILwaK3?=
 =?us-ascii?Q?Knafk8MGpILV+kAkXP1y9QMOcVlht4dqajLg2MEjygt/ZJpZi/kE2hezxmce?=
 =?us-ascii?Q?Upio0oXKBU79IwhxF/8oRHCRC1ptnQ5Y/260FHlD/y/1vdeabrUiDm5Dn8hv?=
 =?us-ascii?Q?we3A0XrT0wuJslD2USsmFzIjOXpVje0oDTU7yg4o3bo8SJizdVQtZfCqLYPK?=
 =?us-ascii?Q?lHdBFFNUtYoi1DA6J7jRCxnXOw2HEEZWXvW+n6TbzR0L67n0r/66bPZDktyT?=
 =?us-ascii?Q?aadxov3oex44jW1r8/N7VNMNHsEDh26Z2mVANCMREryHpBHduf5rdnQqv93l?=
 =?us-ascii?Q?HTgVIOIXXoLLdlrnbldHkQZKyiyND4E9E7MAOqyKU79tdpMSLh1h6+t9O8rt?=
 =?us-ascii?Q?xmVER+Wwn7yBlCJ5RbuZrJqmsHqu3xWwAmSyn6fjt9fjdyR2ektH+iCp0PKa?=
 =?us-ascii?Q?+fZgUfkUciReVu+IgH+ELLoL7tJvNTzBBpon8bZc0CCm9gW9QIlUBWWjDpWJ?=
 =?us-ascii?Q?lThbw2T5oyT2ks+hO2W5GFMDk2E8Ct3CRr2UQsooQZTMtSYCfafth9sNposy?=
 =?us-ascii?Q?cGg+fFINYbMISael3610jo1g0zFGicmMuXo+qB9l50J4Jw2r6WP5rIRFcbb1?=
 =?us-ascii?Q?QKRc/ssQrT8wLa2xVTHUb9RgJAkz0yD1PiudEWvQJLaaPB1Jb2Ammx5ctCbQ?=
 =?us-ascii?Q?C7gM8uDT4PdhvYlYA/BEeiZjF+2yMH8/E82SuFUeK5o8Ih0Mrrpy5e9DVntK?=
 =?us-ascii?Q?34kaU5G3rVPwS5a5V4pxk2daw/poDcM2NrBnpwWdz6St+fw6srvwGc+EH6Lb?=
 =?us-ascii?Q?g2M4Ev6RiTkZo4RfsbDK29YkrBNfbLeyqOP8Y2O0A2SB9JlmBSR0obHHsg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 04:09:09.5733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81394f77-9561-494c-2ced-08ddbab086f4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6590
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_210918_576076_0CF77C4B 
X-CRM114-Status: GOOD (  16.83  )
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

On Thu, Jul 03, 2025 at 04:57:34AM +0000, Tian, Kevin wrote:
> I meant something like below:
> 
> iopt_unmap_iova_range()
> {
> 	bool internal_access = false;
> 
> 	down_read(&iopt->domains_rwsem);
> 	down_write(&iopt->iova_rwsem);
> 	/* Bypass any unmap if there is an internal access */
> 	xa_for_each(&iopt->access_list, index, access) {
> 		if (iommufd_access_is_internal(access)) {
> 			internal_access = true;
> 			break;
> 		}
> 	}
> 
> 	while ((area = iopt_area_iter_first(iopt, start, last))) {
> 		if (area->num_access) {
> 			if (internal_access) {
> 				rc = -EBUSY;
> 				goto out_unlock_iova;
> 			}
> 			up_write(&iopt->iova_rwsem);
> 			up_read(&iopt->domains_rwsem);
> 			iommufd_access_notify_unmap(iopt, area_first, length);	
> 		}
> 	}
> }
> 
> it checks the access_list in the common path, but the cost should be
> negligible when there is no access attached to this iopt. The upside
> is that now unmap is denied explicitly in the area loop instead of 
> still trying to unmap and then handling errors.

Hmm, I realized that either way might be incorrect, as it iterates
the entire iopt for any internal access regardless its iova ranges.

What we really want is to reject an unmap against the same range as
once pinged by an internal access, i.e. other range of unmap should
be still allowed.

So, doing it at this level isn't enough. I think we should still go
down to struct iopt_area as my v5 did:
https://lore.kernel.org/all/3ddc8c678406772a8358a265912bb1c064f4c796.1747537752.git.nicolinc@nvidia.com/
We'd only need to rename to num_locked as you suggested, i.e.

@@ -719,6 +719,12 @@ static int iopt_unmap_iova_range(struct io_pagetable *iopt, unsigned long start,
 			goto out_unlock_iova;
 		}
 
+		/* The area is locked by an object that has not been destroyed */
+		if (area->num_locked) {
+			rc = -EBUSY;
+			goto out_unlock_iova;
+		}
+
 		if (area_first < start || area_last > last) {
 			rc = -ENOENT;
 			goto out_unlock_iova;

Thanks
Nicolin

