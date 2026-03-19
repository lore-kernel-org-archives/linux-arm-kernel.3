Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A4F1088E61
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 01:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfl1J+hEEZ9VDoKkB91iRa/TwdEBdEBD95I9KJpZa50=; b=knP6+9CYUYpf6nnIUmzgxkRjqI
	agjtNK2mJ8pk92Xhdzu9skXZLjfYKS5g0rmklyL7aFPq+/12H1i8EAhw7A8dRlfAUF6L6xmfDVHR6
	L6eRIv75tTLU1GefZg7Bbrt/+k2ZDuYzrWS2/PUh1+urWjv+nVgdd8d9e/y4wvPvUO0VReXg3LgwJ
	Yk8V4mEIW6bvuPdTZa+qh0zECuOeRyYaFRZ3g31tSB/EzLSK/RTRSk0JDshBF6Kw6gJVw2LoGJgLJ
	MKlRp2Y8d/o9Y/N9N2U/dt8gzg7VBGY8WaYFGPAM5MHRZcVTmJsnxlnc9SbuWQYZFmxRE3f94+odH
	/o4DApVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32Ew-00000009bEb-1qyd;
	Thu, 19 Mar 2026 01:31:58 +0000
Received: from mail-northcentralusazon11010071.outbound.protection.outlook.com ([52.101.193.71] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w32Eu-00000009bDm-21Vq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 01:31:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xz43Ck/4igVOLHl19gFle6BDXPins7dFs0V73cjZomtLuwjUD9Ky3pm32OATTwJvWeacgFP81jswaRVWh0DmwgxzTNxSINQg/vAr2FUrxUf8q/UDwZFx8TDLKVz1LcqTVdjwXKvSDNDwCZcjqtfPGr96PojeyWsPOzjTyY75QFrLGE/A/aQGhzI3GmX24KVYiXY4ZXhXca0oaCyjjZqPoiPH667SdgmHwOumaqngN8N7UjUNlDb/HLW31wHbCIT8yNjG/Rv0Di7Ot7KgMuNp9rPfMNo5nbDNpF9QlvaIN3Le0XqTpjT93qc6pWDEVPZ9NWhb3dcW6RWyiTPuukpxgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfl1J+hEEZ9VDoKkB91iRa/TwdEBdEBD95I9KJpZa50=;
 b=a5T2JjUjzHfclgbuSWoHUGNuVCLfTpPQHHfJiXJaswGRwn1dBa7mSTD0ZYiaX7keAPfCxEDeQTgvWqxFc1qMKe7709EesqUd5x61Sr52VBfiim9JSJiTHZncb6bM3moTMx6VE/zt9PfCqX2eV78u+I6zcCaesOHNTV3JBnqAW7wPgioSzucl+YmhxVvmtbwbYegsHPKEw5uUZE0752QWPxLwhNulpUD7aMlMY8XGSnNiPyEwQEU+hm6suvkzUs71mtDEwkMHspv91YNPt8O3BkQ55hhFebTH7MEEEqVjm0YR1K0bcfIw6AW7ZXX+fT4m4c1wGhUSKORHX16cMe8VFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfl1J+hEEZ9VDoKkB91iRa/TwdEBdEBD95I9KJpZa50=;
 b=jiwfh6C6+fQMjbjDS/LMi2wplnjTs3hIV/2B87H2AfHlz1qMYvccJgcZ7+wS8P7FWq3YIiwfQWADKA2AwOnG2mYiIDNOMBoAWg67J9tMCV+UJ8SuQXehAwUAR6g3/sJ/JPxGhp0Z6AtoGDCKoGXwkC/ihtpLvypxyBX5d25oNH2+NQYKUxITYLCtuaaAAMY7HCcq9KqxGeKluG7HiIW604Q5Xv7Egj+XPocRlm8w0CdWoAOPXyObDeXx0rY2NPI2z0oVu0TjsXIgIdlYLFOHLl0A6hrHpxzArsQ0ntXJwdks4Iesr0T6e6GozKhwf7EohM/RRQzzKBy8mnkJoSYapQ==
Received: from SA9PR11CA0002.namprd11.prod.outlook.com (2603:10b6:806:6e::7)
 by SA1PR12MB999230.namprd12.prod.outlook.com (2603:10b6:806:4de::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 01:31:50 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:6e:cafe::bb) by SA9PR11CA0002.outlook.office365.com
 (2603:10b6:806:6e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Thu,
 19 Mar 2026 01:31:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 01:31:49 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 18:31:31 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 18 Mar 2026 18:31:31 -0700
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 18:31:30 -0700
Date: Wed, 18 Mar 2026 18:31:29 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<bhelgaas@google.com>, <jgg@nvidia.com>, <rafael@kernel.org>,
	<lenb@kernel.org>, <praan@google.com>, <xueshuai@linux.alibaba.com>,
	<kevin.tian@intel.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<vsethi@nvidia.com>
Subject: Re: [PATCH v2 3/7] iommu: Add iommu_report_device_broken() to
 quarantine a broken device
Message-ID: <abtR8TWnq08G9AcO@Asurada-Nvidia>
References: <cover.1773774441.git.nicolinc@nvidia.com>
 <c5390aeaeccfa86a1c79f26d2c0ff5df380940a4.1773774441.git.nicolinc@nvidia.com>
 <791a46c7-3129-4438-86bd-b7677e01332a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <791a46c7-3129-4438-86bd-b7677e01332a@linux.intel.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|SA1PR12MB999230:EE_
X-MS-Office365-Filtering-Correlation-Id: e78a401a-bd09-4513-67c7-08de85574ac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: shBDbRVi6kX3RhGBJBvDuxcs1eUNDLoUmgcP4q2Y3dP4UPhEIOG0ynA0F/ieq0bBKmlzkt96NIn+idMInVK8PJuzOHbZjQ+C1XTKc2ViN6FgOgjjYTCZDp8Qc2oznZMsqpha/2tOWT7ihxB0g+tB4iLxqUEIgIYAVgF9fcr8YN3T31GIE/mxi8V2Bx5+yVpl5u9I9nRgyzhKODqEa/LJyPrmQ/YNfg6MsAPiw5odcALygzKFYhz/T7HdzxHjbsgrZc0WB8iSJRIfd80MmFBcMWxUdzFx6ufjqewS9UcZH+zuwKuoe80cyLmXWg/zz4ApQvGFfs3slI1PhNlkSiN+FlWI0DFpquqrpI2S8aMzsJSExigKzd9JPo3EdkQbKTmdlfaCc04Kk0sg9GrT+tKDrM9dmAOPhL0X1Bc7T8+YgL5+k2MWRIx5vfQCz1bBGKnWoC3rwifUIHQmo57AuD8jNN4Utsz0r9yl/470KR/1b6c1r/yOa31043uEp0ZSa2DLzZoPZUIexvwI1tuxzXAI3L38z3K2oIuAVqlCLbEzXx8X3YRYLASZHA+yKRxDayNd4AG29eNfrLxPvk/mqcewKFh+p+8wQSYcS6HtKaSAjNhEQNIhkE3EXr+q6bVapb7b+hIU0t1kA4y9B1ZYkXR7uEQLwKr8lWS31fsHEiMLOE9Wo5Gqu1z0q1q95k5MxdArTFBXHFWEAF6nnraPTjxWlwaUlawHUQZJdz6dLqfxkYN/3C/wyxDatm9WfsAXVb6JhFd/bl5CwvlHF90KOrboGA==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1VeKNP/spRhb+Anodr8hKcGynaqmNDOTGh4X9SRt8TCekVYSFq3KPeksXoZfcqwOLhYDc4ZZpBMUFjgdlIJFdG71gpLy/u2h40HGZLxnTsS0z7W8j3S5N+A/uV/uYQVKJ7h8y/Wv5QGuy+qckuHWelQlciMWDVegmZz7rJBaPQkTo8qeXjJnHO/7TLXgQCvR+yC26G/n40Wf/sDvx50hLB0Hc+IxhJi7kGfm9cMw1ySsTNCF/9z7YzG7trHFiNdQ7Vuo6zcAyYQlRW9gmEyAywuGihfOxEY+sw9omz1/tUQwp/IBCCMZl+jNMev+3Oqb7hVHO7VrsN5o9w3cSQRbBj3peRfH37+ZsUIUoGhKVrV/5wl6qMZ09PcP3f5XauwsONTsbhHOC6i80GplgN8h7wQxrX7NUlKCVRYslOAC9Lb3xeq08Pw3T6jUyn1m1lmZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 01:31:49.4685
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e78a401a-bd09-4513-67c7-08de85574ac3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999230
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_183156_524864_0F4D4036 
X-CRM114-Status: GOOD (  13.79  )
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

On Wed, Mar 18, 2026 at 02:13:09PM +0800, Baolu Lu wrote:
> On 3/18/26 03:15, Nicolin Chen wrote:
> > +	scoped_guard(mutex, &group->mutex) {
> > +		/* Do not block the device again if it has been recovered */
> > +		if (!READ_ONCE(group->requires_reset))
> > +			goto out_put;
> > +		if (list_is_singular(&group->devices)) {
> > +			/* Note: only support group with a single device */
> > +			dev = iommu_group_first_dev(group);
> > +			if (dev_is_pci(dev)) {
> > +				pdev = to_pci_dev(dev);
> > +				pci_dev_get(pdev);
> > +			}
> > +		}
> 
> The current mechanism is designed only for the PCIe devices within
> singleton iommu groups. How about moving the above check to
> iommu_report_device_broken() and emitting a message if it is called for
> unsupported devices?

Yes. That would be cleaner.

Thanks
Nicolin

