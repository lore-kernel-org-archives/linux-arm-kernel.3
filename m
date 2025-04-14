Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BBB1C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 18:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLH+Co++08+Y9Wng81w5diSULkrJrfIgInXS5IrP/b4=; b=hbOs6MA76wemcIlsItRUf/JVXX
	Qv8GXjddGtCxOmXlzeqIt9lSOlgDC1aDJXrynMHGriMuN2BXqbZrRCXsw5YSJ8g7i9qF0cssPxpzX
	mgeEa0GInYc3g1byaBehD/4RB8INBP26VwSHaftmB8Wf/cxNHwR7eEq9rmSDjFMY2cK4om4jOGKv3
	I3NPNdVT+mOD55SJkHRJUHxKtQOcE+tm8ALbjiZ9rwwtNlqwNFdwFsmmzzczEiCmC7tazrXXx1q9n
	xiAgIr7kjaqTl8dI/yiPD9FbD1tvLNDJ4A/BNZgsQDz2aBBWxZrf8XoY+pBBJ892wYPSewzl9SuST
	BBvYJ2ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4OAW-000000032Z0-0Vfr;
	Mon, 14 Apr 2025 18:04:28 +0000
Received: from mail-mw2nam12on20605.outbound.protection.outlook.com ([2a01:111:f403:200a::605] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4O8c-000000032Dp-31lt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 18:02:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wQFktAbxIrjLPOFHpFq4Lm7mRG8Z9uDbzJobI9DHgtmpU6Nbm6s/OFdjuLGE6Y1bCiLuuiaorrJNV5lALstmvGItfoRjGLAT4Ssn2Cmo6RyNT6wEZZy1pt35Ygw8wlKasBeoaiYpIjZjW71et3MBDHmTo8jIttzhwzRunoWnfPYTuCnEpWfJ+Yr+4lpViNEtUSRAx0ibxLg6VWD2WjV8zBQ6/6B4Bu7zsd0yBTXk4D0lZz3chH5R/SsZCp8/AVmJlv1ZqANPU1cF+KayeeER5X5uP6k4gyAvJx8lPEi3i1QmWje1hOVAzbSL5brP3Q+7MaQO35M9tZ3UQcwjSgTBdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLH+Co++08+Y9Wng81w5diSULkrJrfIgInXS5IrP/b4=;
 b=opD5K0K1bXi0U7HgoX2KbKvgRubOqwHwFAxRGQm/wbFXzaa1O0BRrwc1ySb4LJwaNhEKr2gPy3OvjERv1T34i3TBTQPgFYYOmKR+7xtFycxrWbhKYZof+njuVwjPpiE+U5ON+i2Bn6aM7vrecAtwiym2CLMlF5NfLEGRrUDKFzorpqJKrDxkPbTtuIV3heC6uWv5O6ab6Pfe1CAw4XQncTG4jBg7mgBnqiia/Smrbm8pGH9ee1q/FqVxiojocPxrc/SRFDC+wFhwu6t2yRmd1xQN8wV5++InyYFeKm3HijO9cdFwoVY7cpFCG6LOX02r7tzw7C7OsFTxgAUbDfOCYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLH+Co++08+Y9Wng81w5diSULkrJrfIgInXS5IrP/b4=;
 b=MP3yfeaXa1oweB7mrqNQDgdQMSNIr6znYuU0eUZLEl4ZR3B5zjcRZfgGHJRh3UVkb/U3crAaKhuoPOoxwS4xb+zKlFlw4sngL8s3lD7mLj7MWx2J/H/YB5RRXZSSBRNrQHuvjK1U5rWFcl8u5Dl8t7jUa4F1RAGIf+5KUBKAtODAXNOySqEiKz4ANdpCrNDavPDs7WeVGWMIG1nXuPgJ6wOs/e6df6NWIrmi7xXaEWCLM0XK8osqRhIyKgxlM0x47vFvlD6+hWn73ptjsVBtbCgL/BkDuQjRsDV5W/3EeMNJju4jSv5dGSOdo2aYZ3ufIgzdXhZTEyE7zPthnIV0Vw==
Received: from BL1P221CA0011.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::23)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Mon, 14 Apr
 2025 18:02:17 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:2c5:cafe::2b) by BL1P221CA0011.outlook.office365.com
 (2603:10b6:208:2c5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Mon,
 14 Apr 2025 18:02:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 18:02:17 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 14 Apr
 2025 11:01:58 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 11:01:57 -0700
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Mon, 14 Apr 2025 11:01:57 -0700
Date: Mon, 14 Apr 2025 11:01:55 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Matt Ochs <mochs@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
	"corbet@lwn.net" <corbet@lwn.net>, Will Deacon <will@kernel.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "joro@8bytes.org"
	<joro@8bytes.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "praan@google.com" <praan@google.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "yi.l.liu@intel.com" <yi.l.liu@intel.com>,
	"jsnitsel@redhat.com" <jsnitsel@redhat.com>, "mshavit@google.com"
	<mshavit@google.com>, "zhangzekun11@huawei.com" <zhangzekun11@huawei.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>
Subject: Re: [PATCH v1 03/16] iommu: Add iommu_copy_struct_to_user helper
Message-ID: <Z/1Nk+2kucCLx9+A@Asurada-Nvidia>
References: <cover.1744353300.git.nicolinc@nvidia.com>
 <65b51f57d08069c9da909586faf4e73d247a54f5.1744353300.git.nicolinc@nvidia.com>
 <86881827-8E2D-461C-BDA3-FA8FD14C343C@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86881827-8E2D-461C-BDA3-FA8FD14C343C@nvidia.com>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|MN2PR12MB4111:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af9499c-f0f7-4cfe-ec81-08dd7b7e7e7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTBvWmtTaW9hOEpRN1pDeitMN0hRNkRQNitjRWJsMCtNZ1loblVLSDhhNW1v?=
 =?utf-8?B?UXc2QzZoYTBUbjd3Y21GeFJBaysyanNSME5ROENqOHQ0aWpIRFV5WFQ0bzZu?=
 =?utf-8?B?QjlobCtqZUpvWm1OTzNTcDdQMzFXanJ6cWtNMVJ4Mm5iUG9hSGxnODFnVlE3?=
 =?utf-8?B?bnFJaW81ZWJGcWtPcllXTmg1NDJXUmlvTjZJNmRjODUwRzJVQStHRlBoUHFB?=
 =?utf-8?B?YVM0WU9OTTI0cFViYm44SlhJTk5XTkpiOE50R0N4TGdaY0hJaW9NRGNqdmRh?=
 =?utf-8?B?VFNLaWJNK0V3ZDJRZlQ5VThGVklzSmtCZjJ1Y0dzTHZNcGUxTDJEU3k3QUlN?=
 =?utf-8?B?YlloUmpIUTlSSHh5VEh4cEtoQ294bFNQQ3c2ZHhYUUM3MGtrQU1RT0I4YnBY?=
 =?utf-8?B?SDEvckZhUm5hZnh2K2UrQWt4a3FMSWNOMTBsTmN1NFUzQ08vV2tjdGNmVitE?=
 =?utf-8?B?azFHYkJGd3BjUWFEU0xEQ24rZHdrb2x0Nks4LzMyWndQblNQdUdwWXpLT2dQ?=
 =?utf-8?B?NndDS3VFYnRoR2g0azgyclBuNVBzQWtqNFRkS3pJZ1hBNUE0QjB1RVI4cG0y?=
 =?utf-8?B?dnE2ZnN3c0lMV29PNUIrRUdoYTcwV0dYU0pUMHdCUW5aMFlxdzJLTzhuQzBt?=
 =?utf-8?B?eFNZNkZmQWVPSUJzNVd6NUNkdVU1dnE4eU1id1U3SS9ZL0didEI4NUtpSnNy?=
 =?utf-8?B?QzVCRTZrZGRsenVyZ1BDK2RkeWNZV2V3ZDQ5MVNrUm9MTVFCUzVsSS9BTEVR?=
 =?utf-8?B?YXhUaUljbHNTalNyc0VwdlB2SWF0Rkk0YTZ0SmRLaTFYWWdDSDRyVU4za29P?=
 =?utf-8?B?aldsQ1RNN2JJNEVER0laL1dIdUJKT3laeldidWlYN3JyVTVac1JZcVh4Zm92?=
 =?utf-8?B?MGNLV3cvbUlTSDZwWWYxUi9EekI4eVBRTHFTcFdlS0ZhZGpQenIyUUxhL1lJ?=
 =?utf-8?B?MWJpWWFUTFhLN1hZVm5vNW0vVjdmYldSMjdzVnl4a01RZFNQTDM5ZUF4bExB?=
 =?utf-8?B?VWVMZ0ZOTHQ3VTkzcXJpclZaNEF6M1lGQlJNc0ZYNmR3c0NxenJjY3ViU3kz?=
 =?utf-8?B?TSsrUlBiWGpvQ3N2ZkJ6MnVZWllpU3hzckFOZUhQTzFFb3pmY28wU25OazJW?=
 =?utf-8?B?RXdVZ1FFTGVZK2MwYUF3a2haWVBDVktXTWRXZFZsNXJxRHpBWmR1LytMb3Nk?=
 =?utf-8?B?Z256RDlzRnpZYVBmQVFKc3FnWHpqWFpYcHo2djNxRFZHc3AwWGNad3Q0Q05H?=
 =?utf-8?B?MmxuL1RPL3lLa2hsdjNjc3hXeUNrZGdNZWVZMG1jM1ViQzJ3VEtCcHhPZWxW?=
 =?utf-8?B?MXNiNTVBcm5NYUtpd29NajRLK1ZsZ05nMHNzSTcxTmZnRVBhRlc0bzhVaUNk?=
 =?utf-8?B?M0p3eTVYdjNheHlEUDdFR0RsclhHNlNVc0dYM0ZsT3pyNnR0S2FOSGZFcExB?=
 =?utf-8?B?bGxOb280WmNHOStNRTdYWXZkZHBaazRwUitpUWduR0w4OWdONlJGalJScWJ2?=
 =?utf-8?B?Ui9xdXBXU3lBMGZiSld1cHlFMHJMY3pOQmRjeXptZnZOTlp0WG00d1FNTStl?=
 =?utf-8?B?Ti9KWS93aWlHejBpSmxTWkV2Z2ZMYXdzcnJhTVZXQnJ6bVRZU3dQMERSeEox?=
 =?utf-8?B?UHYvUG1XWlByblhVRHVsQzNYRWJJWkkzYW5GaGthSnV5TU9CL1YrVENsc0Nm?=
 =?utf-8?B?V1FESHZVZkh4WU9IOVdTb0hiTzF1eXhYK25INFB2clNTbndiK25HN2d0ZG90?=
 =?utf-8?B?d0piYVYxQXZ0RDFuRVN3UHRTQnhqNEVTQWxneHdPNlFPQ29wNGZUZ0tNSWVu?=
 =?utf-8?B?WktBRnRacndhSTV0NnVTbTIyYmRnUmtRcUpiNUVzN2wweUxSYlY1TGtEa0ZP?=
 =?utf-8?B?N2NzYTByZjgzak9BVS81SzJqa2RMZWVyZE84MkhtR2dVQkplSWxYQkNmaEdJ?=
 =?utf-8?B?WUhaZEMyQTU0WWdTZEhrMHlOTVZKUmRCWGQ3cGdCZ1ZrajNXTFVUdG96OUJn?=
 =?utf-8?B?OEkrNERhZCs2dkZHaDkwK1NXRWpMQkZ6OHJMSVZKYTArek8rOWlKWGY5RjY2?=
 =?utf-8?Q?fzERCp?=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 18:02:17.2946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af9499c-f0f7-4cfe-ec81-08dd7b7e7e7e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_110230_755884_41C06025 
X-CRM114-Status: UNSURE (   9.51  )
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

On Mon, Apr 14, 2025 at 08:25:40AM -0700, Matt Ochs wrote:
> > On Apr 11, 2025, at 1:37 AM, Nicolin Chen <nicolinc@nvidia.com> wrote:
> > +__iommu_copy_struct_to_user(const struct iommu_user_data *dst_data,
> > +    void *src_data, unsigned int data_type,
> > +    size_t data_len, size_t min_len)
> > +{
> > + if (dst_data->type != data_type)
> > + return -EINVAL;
> > + if (WARN_ON(!dst_data || !src_data))
> > + return -EINVAL;
> 
> The NULL pointer check should be first.

Fixed.

We seem to have the same issue in __iommu_copy_struct_from_user().
Will send a patch fix that too.

Thanks
Nicolin

