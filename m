Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54397CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 22:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fepT9LqqSrElB/uCuvv+sJzs1prvfI76FS2DQp71bJQ=; b=XuqXX1g8aABA4h5BxAWyqUEeX7
	FwWkUeyEbBqxpfIccjKssumdYGu0a7AK/6Adbqa1vZayOpgOghv4mEyIff4JPP4oMOt3+ngX3zjSV
	ETL00USCRsG4rq6QjeeGcREbGkRCrY+g86j0E/sK4Mz9eOwdL+Nf9XJ7pxZ+aV2UWmAEYBbuNFUrp
	3vUGcvDUe8yd6yLUoMO08x6rL2aWrXsg5WOn3pDmuZ8OeoVaGeQuDyq7cOCwdC3Y4eAsPkhwcDMLE
	CTVw1QqWIk+Uij4CZ4jDSfiRxmrKKmsxfQQKzqpaQeGzyFtbQRVVP0+UTzHGeX5r5tAD51fttdzh3
	V51V5iRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSivC-00000006SLX-3mAU;
	Thu, 28 May 2026 22:09:46 +0000
Received: from mail-westus2azon11010069.outbound.protection.outlook.com ([52.101.46.69] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSivA-00000006SKo-0FmN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 22:09:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjvaPAy9Si8OWwCEbv457i8cExQ470+VNK/FHXN/T4PvKn8kS/AjQBJ/Kv/ZfS7ti5euv6n/FFpyCaG3NBCG+qTFOekGmoi40DOMOrJfdoyxYGIoxraCKFgdFTIfv9TjgM8h2hhKpYlkMYQ0ZT34obXu7nB1lmp0rcysf7BjZ+OolNMtN/M2QYKAlkboXfZ4N9+/wKYfrCEImHsvTUj7odEP2wPiMdgjP8qe4cgZPjcnv7ZonGHotItAqc4hj2wxlWX3MfmutjKMevdw4YDiM6bxKjT8duzO+QvCO34RWN/ar+2ksPcb9K80ORzq7wxT9gCUk6GxunUi4pInp/By8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fepT9LqqSrElB/uCuvv+sJzs1prvfI76FS2DQp71bJQ=;
 b=RztQMlbOSUVkN8FE8Q0lPNKO6eBN/zdbGiDasVpPU3RQsvMCYgsw0OwOFA6I9uIJ9z1Kp0jPCGw+sg/WLuri8liI605R1qTl2AxsPEKWvpIMP8bYPCboquy+fKZl7auoWpPTV/JOhwoZfoTHxMdcpiBD6DyZPVRoxD+4XzXf1wOl52u6G3KmyZ1um/sEA805G1cRzTG3o0B8Z5za7Vu6y9srEfHC+64EJ3PJGLCHjuevcZSbJRCBJneLL+C3CfwOXJ6TN4m3KlPDIOxBI43uwuRYeXZkvAtV35Apzz/7NYCuIxAmypW7VEDmX3m8LCNz9osFwQQFKW9epzDmvpFCuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fepT9LqqSrElB/uCuvv+sJzs1prvfI76FS2DQp71bJQ=;
 b=gejNo/jJLIKWxyQVAVtu4GuonWn5k2i4JfEStgGaC3xKI4lPOegaSfx/+MybunLEvlHvtjw5eWnYuOCOY4Cg5EMrdQEE1CWrPdtxpX2h5SJw3NG6S9dxRfiqjWEgQ8bOqJYWx+BrJ0w3FL48G0OZcRuAAfp0tDUWcF76u4Dk5QeL2CLKKpUnTfyw6oGHQbhLYAH9Fmo20N4ZyBES+xFxvbr3fg5FVecDbzmMlBSC1QOcS1VckPa78AsjYlrl7/VkVe6g/fu0JrCqlX8xODMiifcTZmbG/GpJi9zMyXi6V6DT37GJHwGQDRN2fWJEPajrQnYoRDPbOeurzzf/ZjajuA==
Received: from PH8P220CA0027.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::8)
 by MN0PR12MB5761.namprd12.prod.outlook.com (2603:10b6:208:374::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 22:09:25 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::3e) by PH8P220CA0027.outlook.office365.com
 (2603:10b6:510:348::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.14 via Frontend Transport; Thu, 28
 May 2026 22:09:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 28 May 2026 22:09:24 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 28 May
 2026 15:09:05 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 28 May 2026 15:09:05 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 28 May 2026 15:09:04 -0700
Date: Thu, 28 May 2026 15:09:03 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Pranjal Shrivastava <praan@google.com>
CC: <iommu@lists.linux.dev>, Will Deacon <will@kernel.org>, Joerg Roedel
	<joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, Daniel Mentz
	<danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 02/11] iommu/arm-smmu-v3: Add a helper to drain cmd
 queues
Message-ID: <ahi8/7NnqW5TzY4P@Asurada-Nvidia>
References: <20260527221407.1756491-1-praan@google.com>
 <20260527221407.1756491-3-praan@google.com>
 <aheb/OLd9AQO6rD8@Asurada-Nvidia>
 <ahgaQm5y_9mISKg0@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ahgaQm5y_9mISKg0@google.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|MN0PR12MB5761:EE_
X-MS-Office365-Filtering-Correlation-Id: be0dab2c-414c-478b-c747-08debd05c707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|4143699003|11063799006|18002099003|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: Jf5iuWj7XyAhzXeqslezcxxaKo1Wfr1vZmckmsQPYavdwH+YmBzOGfjNEqGDTsnWJ/RYN22DGb60aZ85NkTFrDQJX/+O2VJdQRmqj4yWXEbyBlknxq9i1mZ7MvJUoS9ydP2yD7ZwrrXfcC7IwAud7REDhfKvQNoztPcsmy139ep2OFmeJhRvbdKWFBuf+tca5XxUJrh+Udtz2CyGcwFPlVrgC6740OTWudrhxSD0ZETsXPw66M2rbs5ddhdOYd5qpP50u4X9Ox2NOwL7mrmuMJXy19MlSg9XCUWXa1+l90kPRcsISasEfoSMYsru+byVqB0XiZNf4eNVVlQ6kXMKB4NOFJM2lKVJ9X/An+7wwhTrRpVy0sYmvB2MURXlxjw2TZVo4LWoeATZPze5WNBZPxkREtpgmQW9NAXCzbALMSLw426v5ojYGWXyI5pXV1K8Pofs3WpO5Ld8X8QlHrcZM8zozvHIU7bXttnGsVs/Az2M1joYXX2jtC9EeVYg52SS2JUmGnxj7F6Qm26CCF/rhGfkDjB7X/2WJxTGACjRq0Duyo2Yu3yjc5wFCiiulkiVpzKW/GD/FdBM7F6H7ZssmZ4SntAe6shw6ij5+FeMOz4oL2EE/Ra0QlD5SL0iB7D2JyNV7o07nmn/0KSvFJYOcbjYANuAv1wRWhL54qeoPKjvnfmmHL3wsNVu8fUhhjz+Sicm50zrDKdHsnJnrbTEH316QBpPtpZglXzSDHbnnhs=
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(4143699003)(11063799006)(18002099003)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0ngZDrCPcuvgYpA13zkzuJ163eXJ7KI3QDJROuQTpIEojcxGFXBKFC1JRdP18pR3tx/bcLwKubTZdS2GHzKQ18zwBDMO/T7OXCTBckEQFExvfhK1c+b0X/Z3p/s1oTzF7NnztWouppwO4NEFEQvpb+Qr8keLPaowI4gmHZg9j0MfzxspVj+FkxoNaq9mLQqTbHE1Iooj3CR3CKlDqelolLTw4LWk0SuU57AiV7FksdbaVvCm5NX/9wur4mv9AoktM65+yVdet7+5tEx0cSyfuO3Z04nVZK6AXaaG7DWMHGWZtGw+17C8K9iZNgkMPLRbFfGawXpJGqlyQi86Lxf2umZR4f/Ci5PaOvoEQcvcYS6Ix2cWYwmqO8ZYl0JlddGx8rWEmfrTCQXJPwXnhbt97eOZVKH+FmxF0zud/MR/OHQqk7Sconi9n62qVF0xaMfC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 22:09:24.3573
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be0dab2c-414c-478b-c747-08debd05c707
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_150944_100926_42EDCE3D 
X-CRM114-Status: GOOD (  19.09  )
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

On Thu, May 28, 2026 at 10:34:42AM +0000, Pranjal Shrivastava wrote:
> On Wed, May 27, 2026 at 06:35:56PM -0700, Nicolin Chen wrote:
> > On Wed, May 27, 2026 at 10:13:58PM +0000, Pranjal Shrivastava wrote:
> > > +static int arm_smmu_drain_queues(struct arm_smmu_device *smmu)
> > 
> > So, this function has a very generic name for queues but its use
> > case is limited to cmdq in a suspend context, and might not work
> > for other queues.
> > 
> > I am adding another helper for in-flight evetq and priq:
> >  - Drain a queue for a detaching master; other attached masters
> >    might still advance the prod, so queue wouldn't be empty.
> >  - evtq and priq sets wfe=false.
> > 
> > So, there is a naming conflict here.
> > 
> > Maybe:
> >   arm_smmu_drain_queue_for_cmdq()
> >   arm_smmu_drain_queue_for_iopf()
> > ?
> 
> Ack. Sorry about that, the earlier versions were draining the other
> queues too but that has changed from the last few versions.
> 
> I'm planning to rename it to arm_smmu_drain_cmdq(), sounds good?

That sounds okay.

Though my series is still at the early review stage, I would like
to merge those two functions at some point

Do you know if my implementation can work for cmdq too? Seems that
only the WFE would be different, which can be a bool?

Nicolin

