Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9A8CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 02:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqXnhc/p0SHCt6plbJCmwBLn0H4tfIIZ7VCs53rnXBY=; b=PZdPEgztRdNLqzrGM+C5qan29U
	s3IdWqKm8lkal6EOh2JOIo5GRHUHnnvDDA1dJkH9uem9RRnTtUT8y6mFLQLcazp4LYtcsVs6kfz/N
	qi5RvvS5jb1yFeTJlVxHg44xn0Ym1xCs3vFLWmkzt3dVuUmwbkedgn7fvRRMze+bvYqnV6B7uJdY5
	uD/aCqp3CyD8SpqeJfxFCyfBwIeJ5Sa17Ufs6yD/hJu2h5cR3UsXrp+bRvMmdmT2gY3gF5IEd4vZ+
	jKodbu11uiWI9M9waFx2OFDcZ3do/tMcseH9R05e5HM9rHzpltxCVN///kwCAJUBFfooAPFRbrV9k
	K9/eOEEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAEa-0000000Bajo-1T1a;
	Wed, 10 Sep 2025 02:06:56 +0000
Received: from mail-bn7nam10on20615.outbound.protection.outlook.com ([2a01:111:f403:2009::615] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAEX-0000000BaiL-2hWX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 02:06:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jh+LfN9nGevGCrvaM0Ng7Xov/JSDTzZYdEGPD08csrwZcsz/QqQGzNQBCvzRFBWkXtjEHvKjm973wuIMIarSv3O3zoFmQBx9EF8pvbr17rRqt4PoqofZN1tN83L0kzMfuqCncu4BYLB6jEhSzEURnTiJFnvh7VVMZABI+bqKwBKFWDwz1C5Zr+y7MQn5rtU5Ib73sM2xqmmvUt6ovZQ0GaSCMl/ln8bqXzn0BA8rqkubCtMNqtNVuEdVaUWRKyTp4wvDO76VXEDdch1bsF+7rmXEP/hfE30tO6GJrALmncOzWtuvGL6C1aCHLQm9FJ7+nW996YqeVcoWDuwiEBkc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqXnhc/p0SHCt6plbJCmwBLn0H4tfIIZ7VCs53rnXBY=;
 b=PEAD5Bpuk56qy8VpxQBAj3MkY3i9CaEaMAYUm/BNGgWkEFzO38ACIusUQrF+ovp12j7XvKl+yXPZJpLZmuev7wUGeR3hImZ+p4RAWnYIFigJxa+mLAc6v4B/uwG3ickP91xwgRdaTIoNYxqrqaX0w1dmMT/BA8mdA23UMd3hK5dj/5Kc7n7CIApNa585KeFvcVXDMhkL/BAqxNP5HkXKynYghQqptHRjQeM5Qhi3qk+5D5I7GyhA2J/J6iEg5vpCB0CWbaT9KjW8EfT7G3gpsonKK6Drd8qeff5GXay9e9lwSczvOdPfWq/MXpDZbO0nsSa3P4panjNHfgS9BtpQ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqXnhc/p0SHCt6plbJCmwBLn0H4tfIIZ7VCs53rnXBY=;
 b=aVJikd6nfMV7jj3hTOOBVq99CeeJkuMlDd30F3XxDW1LZVkR01urImZ4VcvtyLVWaxy4IeJX/CP+XvTkCYqvGfWKAADTTT/cmkMicLOjSf6jcxAiH+OeOHJcoDcXjH+EBWhCGpdUMxGjSLamA3lc/C5pEh24dCAggPU6fyNUIN41tZQhTziJG9xvuWa74o1GyQDYgLxXBxGbLW6997ZQ607cd5YFQkpkm4PUdUHWrP0AROxnSkZFZjt2F+qth91FQiN6WdvsvPPEWEf/WIjOd5IoUMdESQQLrnCaf3ygAKc+dOteBRMGS92dtM7tsVc16wy19rpmq5gnkq8bduk0hg==
Received: from SJ0PR03CA0189.namprd03.prod.outlook.com (2603:10b6:a03:2ef::14)
 by CY1PR12MB9581.namprd12.prod.outlook.com (2603:10b6:930:fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 02:06:42 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::fc) by SJ0PR03CA0189.outlook.office365.com
 (2603:10b6:a03:2ef::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Wed,
 10 Sep 2025 02:06:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 02:06:41 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 9 Sep
 2025 19:06:18 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 9 Sep
 2025 19:06:18 -0700
Received: from Asurada-Nvidia (10.127.8.12) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14 via Frontend
 Transport; Tue, 9 Sep 2025 19:06:17 -0700
Date: Tue, 9 Sep 2025 19:06:15 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
CC: <jgg@nvidia.com>, <will@kernel.org>, <robin.murphy@arm.com>,
	<joro@8bytes.org>, <jean-philippe@linaro.org>, <miko.lenczewski@arm.com>,
	<peterz@infradead.org>, <smostafa@google.com>, <kevin.tian@intel.com>,
	<praan@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<patches@lists.linux.dev>
Subject: Re: [PATCH rfcv2 2/8] iommu/arm-smmu-v3: Explicitly set
 smmu_domain->stage for SVA
Message-ID: <aMDdF7h/YCcVD9oA@Asurada-Nvidia>
References: <cover.1757373449.git.nicolinc@nvidia.com>
 <390fe709e756a54168fcd43e1323998456f2d8d5.1757373449.git.nicolinc@nvidia.com>
 <a21aa473-b85c-4c40-a3ca-efc68c264071@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a21aa473-b85c-4c40-a3ca-efc68c264071@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|CY1PR12MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d46f01b-0289-4a51-5885-08ddf00eaf71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UijTvaCu9nkZuG5L+q+SkkSg8ABLUom5L5djoG0TBzS7WUdlZD/gqwphe0y0?=
 =?us-ascii?Q?mBQvyzhGBq8lT9X0wVf2trqiRP9gXBbWs4f0xjnuy+NBmNQcfBkOzeamo3Zu?=
 =?us-ascii?Q?ygAho3E/+dptZW3YGTGWY7eGVXUi+oMFVXvYRuMOTyhlWcfgwuwYlx1hYBWN?=
 =?us-ascii?Q?kynitnDpu2CGNd7H30o9wc3JEeOxklUgqS0i4RdLcT5Zfll/fo2ZuEkBn5DM?=
 =?us-ascii?Q?tN5kWtA/kH98Rzpo147NZ4HQ0EmxR5PnLW2KhF04ov0i1xJH5oCqlHLW6Tld?=
 =?us-ascii?Q?rQoRQd/GQbj5OFloFuDASexeQppY0OF/9Fm4/FSRRcAZ52Da4HMg8fS7O7zR?=
 =?us-ascii?Q?4n2EiF5z6Drx3q5p11HJFuWYwgh6q8qx+TUjlP/0Xd61lhgBYwr//RkK2lmV?=
 =?us-ascii?Q?Y30cOFhj87WKpiJofffdktBoZMBMhkcaLVhDMEuTQevcOj6nH+x9U5cZ9uIW?=
 =?us-ascii?Q?2kSdeqF0lBp3PT7b805V9RjkyMFI26oL+nzVGJQm3MwftTyQsj0f2/wCugAm?=
 =?us-ascii?Q?G2OJAg2D4mROrQfKPGYi/qpRK0k1N5Dvr3+jAWc2ktE9coaRWlFs0dMauolC?=
 =?us-ascii?Q?wjUpga24f3k6vrwXJPOfq1HOPgZe3AMdXoOBaLpvuz5NEO5mIrwM2Wfwl5gE?=
 =?us-ascii?Q?eIjhE8fgYbCx8+9xXW/r1OMinesW7xp8KkfcTwjht+Gos/Myva4Ge1c3UDgj?=
 =?us-ascii?Q?3/5bpyCIq1McUgFTMn+qgJSoJ8pquCdjp6ubfkbmoZBIYEdZ9oJ0ZP4tqr8u?=
 =?us-ascii?Q?qW7urZ4R132pcyagKZ7R1UbHLqjzrpAwe4ubx7vvJKmFC9BA3N3beN1OuqY+?=
 =?us-ascii?Q?mF9pVgodTORnVvwc/7oM5ZCs5NKDXrib6hnThsxUBXJXPMqgMMTz1vUhpNCz?=
 =?us-ascii?Q?WT2nJUJsoS+/DCJt36i/3MG0VrtBGqZevPxmywe4sJNj3NNhDyw1GxwWzeS0?=
 =?us-ascii?Q?l3I/spRcunJlEK/7j2Mzf9sCzNZcItmnqTR5YdZBIlj2l3IIyAoww0HB7Lz5?=
 =?us-ascii?Q?GGiUr0QooVlSXT5aXU0i/+nkgvgzGKguvfqnrslc87nRdFcjTgxlIMg8dDJd?=
 =?us-ascii?Q?y23w9vd7ZRJIGXE99m/yKZJGTrE4faxhToWflaUKhKNItWn5lU4vEgd9otXj?=
 =?us-ascii?Q?z7Rc48lawRJx/xiUwLKr4uHXz0SL+vywp7l0HiGfMrqOHoBKWJOJ3cLeOwDk?=
 =?us-ascii?Q?YXx24q8aWJvH7bJLCJjI5MRCkR91ywjp+ckE8x+oERt9OOdXpsR2e7F4wbpS?=
 =?us-ascii?Q?H3GCQIzNCjFsYp7XqWFmlQ/3dFR1K8jaEm5D3trOPUkI0pPxAu8shpbrLrx+?=
 =?us-ascii?Q?pl97YYPWejw669sTqeOkAOGyTLzuyIBUKQUz4UMBMQCXnGw6tXebTZm3Jzml?=
 =?us-ascii?Q?zK/mHx4ktivB8HMnFyl0kQkF9daF0ZqeDF6FCcXZOo0ISY7NWcyF0XYujp07?=
 =?us-ascii?Q?yLLYMGr6A57pw8gWaqQlMzvEEpa8vMo0mCzdtUYgiq52K788we0FgvYDVeGM?=
 =?us-ascii?Q?hvogKKBg2lOT/hcay7Yxotdb7lIAVSzf3l6f?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 02:06:41.8740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d46f01b-0289-4a51-5885-08ddf00eaf71
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9581
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_190653_679746_A5858041 
X-CRM114-Status: GOOD (  10.72  )
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

On Wed, Sep 10, 2025 at 08:31:43AM +1000, Balbir Singh wrote:
> On 9/9/25 09:26, Nicolin Chen wrote:
> > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > index cccf8f52ee0d5..0016ec699acfe 100644
> > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> > @@ -3070,6 +3070,9 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
> >  		arm_smmu_install_ste_for_dev(master, &target);
> >  		arm_smmu_clear_cd(master, IOMMU_NO_PASID);
> >  		break;
> > +	default:
> > +		WARN_ON(true);
> 
> WARN_ONCE_ONCE() and shoudn't ret be set to -EINVAL?

I will fix it.

Thanks
Nicolin

