Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2FEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 04:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/x1B03fM54/58w2ZxWW976Myd6hPMyWcQWYH9oDKTh4=; b=vxHKOl8mjwwXMn2Oxz9HrKLixc
	eb0NzowSPviF3OeLRJ64WTtv0kzyuyOsatGDPxiWe3A0K3IM3bEBK692TmevrbKBzCebKnfjJ7G05
	B8reYNCRfiuAAIreth/0XAtIKNNGBPjl/Q+cIl4TPB3mLSUJkx/A2oWxM9OwJHyjb/uNDuEvOfvRr
	y4gYe0/CXhdLSoykz2N0+IvigKrpTQ0V+TZnlpJ0J8LheQFlAKUZ7KfsmMRYZUeCSHJc/qSK1kZcF
	u3asPnFvh1LQ5T7GCjBhS9xUH6t2lKPmj17wZ1c1xzvlvexJIgwk5hRmZUdl9S2nLmrzwn+gvZ+0F
	bAqyysMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toEgy-0000000DOfO-3aqD;
	Sat, 01 Mar 2025 04:43:12 +0000
Received: from mail-bn8nam11on2060a.outbound.protection.outlook.com ([2a01:111:f403:2414::60a] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toEeY-0000000DORm-3IB1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 04:40:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6ex/NmOyKErhFGNOHtDdFVSciozY6OuHZVbIghh7w9L8QcN7m2w/HH7tnAPcRiC+hfF0xL0bgetwObMGmj2a3vtglC5U8xcmVqyVKXFHj9Vj4c+2w6moPF9Rgfd1PCKQLbgeIz87D3KC9/56rUtVrTRK5A1igKf09CTPh2Nk42UPkw1wNMyUveYe4dqJuq9gHGXE59fMZJIvX8HjBuIUTIzC4FFNNecnt9C1E0dWTD2IaRoTp7uZqjCkQc+HxknpwV/YILrH4ALK6lTDmMRb6H0KHZV1BZKZh3GpribkK7H6SEsm/+hFicUyQXQoBF0PKD+TYJjriOC69nalrfiAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/x1B03fM54/58w2ZxWW976Myd6hPMyWcQWYH9oDKTh4=;
 b=r5U+n/vmEy+TUCkCEHz+4SHkXg4vlzOyk30nxY8S9Upa9C/RmQ9EBWCKUP7OGVfbm8zdWebU/0AtKUGvsoP8AwRq+OGiWj8dZK1xSyyFSIhDZLgmOytAg3vhrvSw/c3m349RUqTwAdS8AprFuDm1KU+ov8DGXwvTLoGp2xfbSQCjPkC6ij8dj4ci655DTNSzoPqzhI5ZJ3gtPwBpxoLoTxucrN/IswjRmWehYf+wPYCvU77K71KBobrljLV/oJrLbz06qNpzONi6vfaelAOxXGrYZngYPOVP63xEc5jaLxZwm3JVTxcANpbWGML8U92c+/8Q4FKeVaWxfKN50BRWTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/x1B03fM54/58w2ZxWW976Myd6hPMyWcQWYH9oDKTh4=;
 b=Glncjh+gHT8Mghm3uYz7Yk7qcWHYwZpsuL8eCiLjIBRbRNVg+rF65ieXshW7VsCkDDe03FgMLNnoyGl0CGd7BLzrueVx4tzlvjZmgCRK0GpLrjbklJz2rWIu/soyywe2FgQZbNM2l1EGwjwOhYZx++zVXdbVSRHQzf0qGXNMDBWxtLidp46/8zJT2DV53K2y2emUDwljNVoA8oW4EsD9FwTOGCYKqqvbGd+2gvQvJ787Fo69zVgBS9wHY88VUdjQbWdGz5U1Q4WPTmCUr1XRuuP+KFEixygwRpwlxd1z6kl0aEmC5KCa2tw5ceaup7JyP0Ti9wD5AzW3w2d/zi57+Q==
Received: from SJ0PR03CA0225.namprd03.prod.outlook.com (2603:10b6:a03:39f::20)
 by SA1PR12MB8857.namprd12.prod.outlook.com (2603:10b6:806:38d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Sat, 1 Mar
 2025 04:40:35 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:39f:cafe::c5) by SJ0PR03CA0225.outlook.office365.com
 (2603:10b6:a03:39f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.23 via Frontend Transport; Sat,
 1 Mar 2025 04:40:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.16 via Frontend Transport; Sat, 1 Mar 2025 04:40:34 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 28 Feb
 2025 20:40:25 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 20:40:24 -0800
Received: from Asurada-Nvidia (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Fri, 28 Feb 2025 20:40:24 -0800
Date: Fri, 28 Feb 2025 20:40:22 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: Zhangfei Gao <zhangfei.gao@linaro.org>
CC: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>, <joro@8bytes.org>, <suravee.suthikulpanit@amd.com>,
	<robin.murphy@arm.com>, <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>,
	<linux-kernel@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <eric.auger@redhat.com>,
	<jean-philippe@linaro.org>, <mdf@kernel.org>, <mshavit@google.com>,
	<shameerali.kolothum.thodi@huawei.com>, <smostafa@google.com>,
	<ddutile@redhat.com>, <yi.l.liu@intel.com>, <praan@google.com>,
	<patches@lists.linux.dev>
Subject: Re: [PATCH v8 00/14] iommufd: Add vIOMMU infrastructure (Part-3:
 vEVENTQ)
Message-ID: <Z8KPtlAy1aekFe2C@Asurada-Nvidia>
References: <cover.1740504232.git.nicolinc@nvidia.com>
 <CABQgh9FYqzoUxjR246QBPGW9jqngK1JpgfACvBTLTHq-mBBCJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CABQgh9FYqzoUxjR246QBPGW9jqngK1JpgfACvBTLTHq-mBBCJg@mail.gmail.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|SA1PR12MB8857:EE_
X-MS-Office365-Filtering-Correlation-Id: 24f2bfa6-deb0-4bbb-4e28-08dd587b34c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kfvezs0K7T8c8uFa9XcxlT0cC5ZRB7YJK8ZrRpXu0a9YynnTGLlB5GPA2JKU?=
 =?us-ascii?Q?fsbRMr8+hdbjx9JgYrHaPsdo3jh3ZDSktHdRCjvNvIT4bTcHbOci0fLGtUU1?=
 =?us-ascii?Q?yprzUktoBMU8Sd+tyoMvu7BNPlHctSMS3NdT18x5S7YAcafQCQ1qK5g2E1qC?=
 =?us-ascii?Q?ZVIBfQxl9XF4369cDhCFhm4vfZnRLY1O6ETgSTWQXsk+bUWl4pKd7Xpl2Bfx?=
 =?us-ascii?Q?77UDIoYImdGclygpd8sWOsiEmNWaat7eq0vzWtR6WezML9Y6fXR5EXiSf4aY?=
 =?us-ascii?Q?2XXbJdyCgcJ6DOdYVe8N9zFOtqujahg75a6CnpeTPcxcRfO5fWXtBZrW8EFU?=
 =?us-ascii?Q?eUJvwc4Q2WhJ86FKX3DuTRYYHovUhmXgr525ZzCusjbnc3lyp87ySiHOpnxY?=
 =?us-ascii?Q?5jEwqMmC7smtrKHgyX3kZNkkN4pfcpeCbS1q767rEdd5IqgUqewg5oPHlH98?=
 =?us-ascii?Q?L1NvHn/qa+JwQNRSfMVh1pP4cHxgLEya6cfxId94TERY5n7hCczag/l1smUo?=
 =?us-ascii?Q?rXQ/a3g0zRPgMzD/zSmTieCbxVbuNC19TdnMn5q1QVHV/f7YoAO8rwM3Lw7H?=
 =?us-ascii?Q?23PdaYGxf9NJjaJwZfWqK5nzSrtwYxOVvgul7M8lV7wMiHkhXOBBtVcDrzi4?=
 =?us-ascii?Q?wqP7Rmk2UOEr6BZsF6yDYZwVL3ZaKDkHuDWLsY++9NHKGNMUDTcNs6GL63O6?=
 =?us-ascii?Q?a0dTd3zYgAifgutOKFoOCNGE4u8cS5O8yPZupybITowL2Gs9AvTDJqwRO2OG?=
 =?us-ascii?Q?z9CO/ZAo/e+nXqgeF0jPEPuo+DBsmsslIdnBElaLYCuVpeRBMqz5Hc5kBq1n?=
 =?us-ascii?Q?rEBWDJCVIrK6j2emJsxn/HnFZVcS3vdJIPKww41ZWU1ISphEPE4LtlMfzKNQ?=
 =?us-ascii?Q?3u1pGawWbUn5SCzZIvDoEm+obBxrVfKCRaoQlArrNVoyxFfQAJGZN2bhHrh7?=
 =?us-ascii?Q?5yhjKWq6C0U6QZhXq12aPQjnK16F4eBKq2J3/HGpVf8CFuA94DmcJSwTm6/w?=
 =?us-ascii?Q?Eq29UCvdrX7TTFOM1uys4jMZi84W11JYUcXjCLoZ9I98yVTHr9iLNTnT1wHJ?=
 =?us-ascii?Q?jeVeTEsznWWs0bx5W1OBrSvC/fQfCiMJuj7Q4wdTogdA1f3avOINzhV+wpWs?=
 =?us-ascii?Q?3+bdlNWXduX84TexJO/qBcz5eYPyYo0t6po1sygxes74n1XxMdXNYqeQ4ZkX?=
 =?us-ascii?Q?SUAiBV96ZgTyk8gQHbILa7twh7Ndw+tiJNWPADnELyX2FkU/6so5vFfjZIxO?=
 =?us-ascii?Q?/neyo1x44FG0TnhlWsjrGbSoAwurWAxcQSP36PYTDLlksZ4mDOn+9JK0TVVi?=
 =?us-ascii?Q?V1nAWEpAu6SnoAsFjFQZ9FRf68hJRAzH8zdj9GYhCg+bl62Zj3bN7VxpKkKb?=
 =?us-ascii?Q?f0Ej1RCJlahmKlsXT9G8nFxjmrEvpTxWo8gqCPu8gIYOTmastNxzzpqjizhf?=
 =?us-ascii?Q?5JpMBy7x21tKh6rDlD24jFlRveQ6bbe8cTvJ0QyrfNwv92uIV0kU2KZU6WMP?=
 =?us-ascii?Q?F94qb66dAq5zPXE=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2025 04:40:34.5305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24f2bfa6-deb0-4bbb-4e28-08dd587b34c8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_204042_843096_3E041B02 
X-CRM114-Status: GOOD (  19.22  )
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

On Sat, Mar 01, 2025 at 12:16:00PM +0800, Zhangfei Gao wrote:
> On Wed, 26 Feb 2025 at 01:33, Nicolin Chen <nicolinc@nvidia.com> wrote:
> >
> > As the vIOMMU infrastructure series part-3, this introduces a new vEVENTQ
> > object. The existing FAULT object provides a nice notification pathway to
> > the user space with a queue already, so let vEVENTQ reuse that.
> >
> > Mimicing the HWPT structure, add a common EVENTQ structure to support its
> > derivatives: IOMMUFD_OBJ_FAULT (existing) and IOMMUFD_OBJ_VEVENTQ (new).
> >
> > An IOMMUFD_CMD_VEVENTQ_ALLOC is introduced to allocate vEVENTQ object for
> > vIOMMUs. One vIOMMU can have multiple vEVENTQs in different types but can
> > not support multiple vEVENTQs in the same type.
> >
> > The forwarding part is fairly simple but might need to replace a physical
> > device ID with a virtual device ID in a driver-level event data structure.
> > So, this also adds some helpers for drivers to use.
> >
> > As usual, this series comes with the selftest coverage for this new ioctl
> > and with a real world use case in the ARM SMMUv3 driver.
> >
> > This is on Github:
> > https://github.com/nicolinc/iommufd/commits/iommufd_veventq-v8
> > Paring QEMU branch for testing:
> > https://github.com/nicolinc/qemu/commits/wip/for_iommufd_veventq-v8
> 
> Thanks Nico
> 
> Tested-by: Zhangfei Gao <zhangfei.gao@linaro.org>
> 
> After rebase on your branch
> https://github.com/Linaro/linux-kernel-warpdrive/tree/iommufd_veventq-v8
> https://github.com/Linaro/qemu/tree/for_iommufd_veventq-v8
> 
> Tested with multi-device in guests, with io page faults happen.

Thanks for testing!

Nicolin

