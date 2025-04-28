Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF8AC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcyWyIKSCTzI5AimZXIVPS4xBNZB3EtI6M/x4noiUY4=; b=qAjdwDgYhl76wA0WXy+rPEDZq1
	spoJnlsG38OnhPFfVv1aeAptz0Qizx6H+7TzZwowokbHtigSeeAgWn4/+Qni1wxC2TIi27RLUZN5J
	LjiCvqbE8/bj6UXPaCjkmWlQcA1cKj/cgs5l4f0KVtKNSjX8ECtX99sQeBe3D5uph9wtGAUeEw0Rm
	cI0KAtgubZVUH/Hu74Qz7fMCQY6ogpRMhogknPuH53bFvAuagzcYIzztdIyTqZBJ6dFxIaw+F0Rxs
	vOInUVYP9o/p/GS7VlCvCfss6W2RC75aEevjtFNNHVh+vLPoLZvkFkIRDz8+RkZnYNhv/X4bNpe4E
	xL+PUImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UtZ-00000007RFr-3NxE;
	Mon, 28 Apr 2025 20:16:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Tip-00000007HkG-09Cl
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Apr 2025 19:00:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GcyWyIKSCTzI5AimZXIVPS4xBNZB3EtI6M/x4noiUY4=; b=VuSFwFMJWp1OtGPKnC0zpA1PVk
	3rU42Kr6MS8z5xw3Pt1HhMTlBL4hivs1gkH+Jb9cR6NGTW1K8GvArOyNfzAHk/RZdtjhtUY4RnkDM
	e51nMg+qoO6AygKVNyzabE81E6lIZcBJdFIdH/hez57YmehzRikDY26kg8tqAEz54MncSHDee0S5Z
	CHQ1ovZTmpsEWU57Qc5aC0mZQrYy4Tt2+SVI3RFnWRCUtA3ApuWbq9ZQUPy7D3L/fyjwnYGMoN4xG
	D9/Vz2GwxP5op2fBu6ggt138BuLG//6wH7hEtd26ky7WHzIUUNEGhRXRwUp9NVDrWjmri9UPIIpyX
	uHXVsY2Q==;
Received: from mail-dm6nam12on20626.outbound.protection.outlook.com ([2a01:111:f403:2417::626] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9Til-0000000CzHh-3igh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 19:00:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oX/4pbrQY0zgQ7GZbF3ogz4Ti5qlbqZAObhbpSzGTTpw3/mkrIYbz4TxPg/VDHuajWCte0q7tL9tRW9L0ae6dPY1Ia94TpZAekqPzSMb5ezY9sAdZsXOMF/irZmR4gGb4d/n0YqFS4reo9ibl6w34MtMOW4u2hB15aws18h40G6QI5IXiw38aC4qRd5d0S54bkNpwuAh2CULU5ifHfnCTo1ZOj0h1971aQ5sO3xBwElXiSohLVEgDybCg7rOaSpMIaysJe48Y0dZWEWMug1rGM4czrW38+LRXEMlg9ZfVx95XCyIvrQBbkD3a/taTGJUDoNCBw057arpA9BC1W2Kaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcyWyIKSCTzI5AimZXIVPS4xBNZB3EtI6M/x4noiUY4=;
 b=TdEiQaEW9EHmQ3mhjPPynmFqRsyg135/63/X5UdUC4V1r/XT3C9Z/qnDAugr5GGpDTCvXK1bmqUESjspakoJKhlKIUXimllfySHPjIUWLdMlfedqDylLJ7jaXcUzNYlhwbKFVxWdQpxF/e+K3SalbCcmQSxck0XphzdoxgtgOl07zmFcQkWOQH2JCmh1MGTLKnwksl0x3xWVpcYB45dPRTwom7f6348TnKGzVgKQtNhKIvsLL8qSjFqyzDgVZA+JSQGmANNiXpOxuy4KvXeKRAwjqfYWN/gnEtNSCGy2GBWVkjYFVpWKyNPVfeY1hu6SXxhnNe1OOcbogtMODmcXMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GcyWyIKSCTzI5AimZXIVPS4xBNZB3EtI6M/x4noiUY4=;
 b=hHCYjTWOUxqMDGsHiPpguOjfefJB9xkCbKuh1v9SVFFsqkWcK6W8/9BhFkiA5lPnMA0mJQ5j9gmWKG3haD8el/l7JNAc+BzDxEdSmNU6EgA22HfWzidLihwhKqp3syrhUKw6cUhjRD0474zKhAQuzFWuP/9ikQ2BB4oOT6uD5A2dnCuFArI2zTuHzzUdPUvG5PK9NlP1B7DOO3dYV/itSue6SgWSAhdcL+K8BZKMXQYYp9xIykYCE6n8Ie3nGKVZ3u63lm/LcTs93OnEzc7ECDbazZus9tvI0h2OOq/YvOI/gspZFrYAOWv2gEnh4nZatuY3ZIhsl38PaSGZ3SkKOw==
Received: from BN8PR03CA0003.namprd03.prod.outlook.com (2603:10b6:408:94::16)
 by PH8PR12MB7280.namprd12.prod.outlook.com (2603:10b6:510:220::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Mon, 28 Apr
 2025 19:00:46 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:94:cafe::6a) by BN8PR03CA0003.outlook.office365.com
 (2603:10b6:408:94::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Mon,
 28 Apr 2025 19:00:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.2 via Frontend Transport; Mon, 28 Apr 2025 19:00:45 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 12:00:19 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 28 Apr
 2025 12:00:19 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Mon, 28 Apr 2025 12:00:16 -0700
Date: Mon, 28 Apr 2025 12:00:14 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
CC: <jgg@nvidia.com>, <kevin.tian@intel.com>, <corbet@lwn.net>,
	<will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<thierry.reding@gmail.com>, <vdumpa@nvidia.com>, <jonathanh@nvidia.com>,
	<shuah@kernel.org>, <jsnitsel@redhat.com>, <nathan@kernel.org>,
	<peterz@infradead.org>, <yi.l.liu@intel.com>, <mshavit@google.com>,
	<praan@google.com>, <zhangzekun11@huawei.com>, <iommu@lists.linux.dev>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <patches@lists.linux.dev>,
	<mochs@nvidia.com>, <alok.a.tiwari@oracle.com>, <vasant.hegde@amd.com>
Subject: Re: [PATCH v2 15/22] Documentation: userspace-api: iommufd: Update
 vCMDQ
Message-ID: <aA/QPhB+7PM3GDEq@Asurada-Nvidia>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <820dfdee121292fe4cf891feb86f82ceea521e22.1745646960.git.nicolinc@nvidia.com>
 <aA-RQwyTS1m4CuPw@archie.me>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aA-RQwyTS1m4CuPw@archie.me>
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|PH8PR12MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: e584fedd-2e6a-4dc7-0024-08dd8686fb95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r/2ctnPy9/Wn6DUvR4XrwTt4kMFBYcRFQESF9l1ba9xEowVEwuozopGAVFM7?=
 =?us-ascii?Q?x2e/VRzQJ4gVV0nBvDWO9yLSe0Lo9RAJDFPbXBDhGBKC4XcPa8z3fNd4L4fb?=
 =?us-ascii?Q?LuSwp5pAVeD/bOx1qdvlsumuzYldqU5w0fi99eUvihT6jf5XSydG2rXIU70e?=
 =?us-ascii?Q?/gAAp2vaig2ALgAvQoPH7HcCHAZfqr5CQazMNYOb6TX76do+3e3+ceZsBzHD?=
 =?us-ascii?Q?C5q1X8EP0J9uLsq7fiOjens5SDQE6CAEPxMfK6+arrxh8qlQ67McU3MGmpKi?=
 =?us-ascii?Q?sIOT5cQS8V4PIpBRoQKEb1z+SnuSXfFJJZp+Ong9oLrkAi3Wmsfrls+tXxmI?=
 =?us-ascii?Q?CY7TgeWHSY0xhrNa8VaMNrIY+MgYx3ZbOKkheBt9L/a8hWnh+AmIsjKuMBPy?=
 =?us-ascii?Q?HZZjdIhJIVdZOqtlTi+4r/Ei0YvR2dwMOMVF9TXV6TrEfyWbiYMz585pbTW7?=
 =?us-ascii?Q?JfXYhMMCZQzzeMKIDRds0HADbe/eAVobQPoxfJLhev74qPDAP7wz1m6DAyp5?=
 =?us-ascii?Q?2Ydu77zUDDpHxkbuhs+BHSTKB01SGfn4rIQec/2C6LFgdTncM7W3dRQ5HMTR?=
 =?us-ascii?Q?IGlgKQbdkoJdbkYgkt0x4bKL4XhJ4O06tkW5r2tlG8/vqhLNsB/qlGxZvHN0?=
 =?us-ascii?Q?p5KBs5+d+epyLKrqIxiAcJj9TqrAuxP29F+ikITlUIaQ96q4o4vtjC4705Mw?=
 =?us-ascii?Q?YPOjdvjJzpOb6X1YeoK54G2q3SHwKgKTQkm2dufS3T+3NPiURrAWk+WyYTDa?=
 =?us-ascii?Q?S5PH8iaIdaQdYFrw2dpuwEutbWtw0Iq5mCvcTwBdQYmnoBYODUU0S64qlXgo?=
 =?us-ascii?Q?Jc+CrBcqWwanYUNVxfH2v6CapODHJrlBAv8RVpoqpcvSRCsrph0nQ9GBC66N?=
 =?us-ascii?Q?rFl3mEP8OBa/g3CQRDUnDeRxeH6jksddkFsVt4cbF7FzSDIv9A2wZ4dLGyzj?=
 =?us-ascii?Q?ZrrBYzNJOEY99sWcoOMcRkD5cmSRbINyPAEqtvyjDIrHjM8VkSp8Y22IH+CG?=
 =?us-ascii?Q?ktg+fE2ut7tUaUph3jtdQwFCbY3G9BrS3Obrk9ZiTlzgyLHoRpEzYOk/RZcf?=
 =?us-ascii?Q?sLNsdlsAvjcWDNnMbc5WtbnqRfugQErk84YAGhPEH4q7BDQoRUoHCxoWKcEw?=
 =?us-ascii?Q?cAYDJRYVo/ijt7j+pkvh5IUHpjpJcv/8TqFcOefj/lIvyDuayMsrT38rDrzt?=
 =?us-ascii?Q?/Ae37CGQ0hzem5qkYXGcNSbmVIj/PJt8B88eqMdIuUQdFQ/xBZr7F+Czjhd+?=
 =?us-ascii?Q?Tr5QaKZFLu2H/XmKs/0NI0/XU5KUNmdWIKb217kjMQwXGEn1jMmQQqQ3eKBl?=
 =?us-ascii?Q?wv6+9bIkwu5qXrCuKAMEPZjztUQudHk7a8VMux1wf7qp/2fun2adr89t5r1k?=
 =?us-ascii?Q?0iWl2nvCAsWdNYaFWfKM5U4FNpM1NKSxXQvpgU5mM7v7o8JEFX/7xmHe44+0?=
 =?us-ascii?Q?oJI5fEdvvHnv0twAjIyO/WDZtWwFqbDkTGlGFw1WFHN1Q/fNV6gUbttaBl3N?=
 =?us-ascii?Q?rhH+9c+XkbUF8sobaSeveA6UeeQL+ps2WHwc?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 19:00:45.9083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e584fedd-2e6a-4dc7-0024-08dd8686fb95
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7280
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_200052_048881_4FDE1E93 
X-CRM114-Status: GOOD (  11.51  )
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

On Mon, Apr 28, 2025 at 09:31:31PM +0700, Bagas Sanjaya wrote:
> On Fri, Apr 25, 2025 at 10:58:10PM -0700, Nicolin Chen wrote:
> > +- IOMMUFD_OBJ_VCMDQ, representing a hardware queue as a subset of a vIOMMU's
> > +  virtualization feature for a VM to directly execute guest-issued commands to
> > +  invalidate HW cache entries holding the mappings or translations of a guest-
> > +  owned stage-1 page table. Along with this queue object, iommufd provides the
> > +  user space an mmap interface for VMM to mmap a physical MMIO region from the
> > +  host physical address space to a guest physical address space, to exclusively
> > +  control the allocated vCMDQ HW. Thus, when allocating a vCMDQ, the VMM must
> > +  request a pair of VMA info (vm_pgoff/size) for a later mmap call. The length
> > +  argument of an mmap call could be smaller than the given size for a paritial
> > +  mmap, but the given vm_pgoff (as the addr argument of the mmap call) should
> "... partial mmap, ..."

Fixed. Thanks!

Nicolin

