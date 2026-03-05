Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC67F513E7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 23:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whjQqNRb+By/48CNSv1PNH+IajT5oROh7oF0ehwZexM=; b=M5ql9j2LnFFuQoswnM5k5ZfcV3
	rpkkeJeALcAHxuZ7lmzBlQg82/p7grGi4bL8Ole2NWL84ziL5OXNb0IIeEvIl8RCm3JMgYTBXarqx
	ozZYeGwRMlHkcYqxTCIsM4YBPlGxDP9oIvRnAcvY7RHdzJWiB4yMRaVPRzSdkLmQkTJruzVc6j22H
	whtHHJDLAqFUeCrtIsCdq1Cs3P8UzxwqMD58R82m6wJiMZtCO3eZFJSbl92aUXTWwf9WRx98qIEMO
	XOZU26LSZnXF6UNyPKX6UikV4HGvc1OYA+l+uoQgn6US3pce09b2Q3V1SkaCYxSHBGUE5SHr1gXCk
	deqaFswg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIKY-00000002jpm-2LfT;
	Thu, 05 Mar 2026 23:42:10 +0000
Received: from mail-westcentralusazon11010057.outbound.protection.outlook.com ([40.93.198.57] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyIKW-00000002jpP-2jCY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 23:42:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5C5EPS/YJjcVq/11NaSuv1iP/HhllemT1aee9K9joWf6lv+KLIab55jYUCz40jT1XHecidMXu++QUlGP62bld/bVSIlARjDzGAbxDR/Rwerx8njal614JmfoIEqwB2b/iQeIVZ7L0nicwVkJLS3nbbcbz3jVkMeHl4yeyUKuMtgCfkBkA2jsj+ZDepeafmTevt9djVJDPrWQ4nOKYIg+a8gE0832ZaKP7mOcuJZP9vAuM4KY4bwMJyc7QbkjabUC2diKNjWx8gmHS7dBPb/7eIeVV/DGrGKwwy9gTaSEYdIGaIZrLzigreUIJMv55p97Ooy88ir6NTG0IUJim05+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whjQqNRb+By/48CNSv1PNH+IajT5oROh7oF0ehwZexM=;
 b=lE0qoHdwUbvncFdjT5nv59FiHDXgkrGi8DtRPYb+PYHG4PvzI0VONIADLp+X1D4EhKnw6rYzNZ0b109jj9QxyBzVxsFIVXU2cFFhy2hiNjep27N1ayC16Rby2Zlp+c3DGnVRvVoZXyQKKZdg1GTflcj7YXd99AwZDHrhA9JLmftVXcq9z+ttvRXhXuHUcnm80OC2d/EuDn6yzZh+gqvH7SPfbsYIWD5UbGUHXx45oqBsTDWUS/WSR36W1PhSa0Ieow0jiFFaPFpkHUtUuCtOZsFgM3ippGaq4rWpIWVOuEoc/BaIWBPt+8i1x6S8pScWLqju1xOTFOw2/znbhUk83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whjQqNRb+By/48CNSv1PNH+IajT5oROh7oF0ehwZexM=;
 b=hWPFdqb1V44SLKcobpV0J0vOdjj24gJ8G5MvvY0LbsZnEJKWLbk1gVja2BInVrefghWcK2KVTS8SvhdgpBp9QY1+8iQyFNPIfl3TPwTn5KihqeRrNW4/uDhKTGIZDTMjo7agQJXtDs6zaV9EoV6F4OP30q6XD6uT1swNZKFr1lt/ew+CmWmCDiNY1C5oBl9Det19REASBf5rsl7x0wTRcrjMul6jpEdTaPiEcVmUQPBIYApc4xktyMhd4LZbfTg+07SonucnkaDsXIfJg9PTJBsRs+wQzv9/IZJGtBHKGrK0ttjUowSuSpxg3arP9GGOAebbXEsmYkMlO6oYdH4Pug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM4PR12MB5745.namprd12.prod.outlook.com (2603:10b6:8:5c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Thu, 5 Mar 2026 23:41:59 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 23:41:59 +0000
Date: Thu, 5 Mar 2026 19:41:58 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	bhelgaas@google.com, rafael@kernel.org, lenb@kernel.org,
	praan@google.com, kees@kernel.org, baolu.lu@linux.intel.com,
	smostafa@google.com, Alexander.Grest@microsoft.com,
	kevin.tian@intel.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org, vsethi@nvidia.com
Subject: Re: [PATCH v1 2/2] iommu/arm-smmu-v3: Recover ATC invalidate timeouts
Message-ID: <20260305234158.GB1651202@nvidia.com>
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <20260305153911.GT972761@nvidia.com>
 <aanygWWZLA1htDdQ@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aanygWWZLA1htDdQ@Asurada-Nvidia>
X-ClientProxiedBy: BLAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:208:32b::26) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM4PR12MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: c80bbce9-692d-4662-f467-08de7b10cb4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: GRkjcwTGX3nEmlnzU9mDPQIwPVpsK5iic/eeb6UC9FdhY4BwltDNSEMXwFHPEet/iXu5ZR4+ZkZX4V/wGFbBIOZP7UFtacCynxPxoJALLKDQztt4Adf1IwAs73Iok7VxIeH5cUjqJreKzedv2ymegVy8qQYmjB8mDBie+QO/C7J+c6MektmW9rk8cMOa2vgo1CkFsMXIYdMOIZ3TZ7gO136SvWhvjLiaf2vKHttZkVZQAHT0hHQBot65rIniIHDrFlL4Ijtn0V9xRBl4u+lqMnbINjC2L1zg+lZieARiPrvwdGz9AOqIrAFzm2l65UICBxT/VgsIAPFtV33FFvsfj81wjBRKq1xZFyA3TiE0AayUHaeF1y5zygRaEK+CWIUK7+cjgjxnYRASu6IHhrna2wG8Or4bgTsRvUY1UUsXPMhmBtkHdXDsUMIA/usK8yN/J98itd51AqvE0cNhXuuC7n6mkq29SPRN2mFkSTwK556rNAMDGul2NPE1hE7m5Fsi4eKwNxV9D+0Bje3UsSDm3M1UUbr7F+xzRu3VhE8xOaFXJDLl6pIvj3zEN0J9gP0704GV1SdyNje82KndxRjpwt1DRipIizuZjz05Y7cTUOzhy/fYh2SbqOI9AdpjPfgCqbD8HK0XzNLhP+oPRkCQxrySdde+x208PpMuI0l2MFMxvu5Pet2zHthJHcuozGGlmLRyDs1zLbKJSbIw0Vjd1YVkrOVVtJjvmgYvUZLGaR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lI45jSG510VPWJVzeBQfYj12nUdeOAroLiGt9YF3a7oHH4LY31JhRmgJ8HE8?=
 =?us-ascii?Q?5Bs23IZ2ERAibh4hGXq7a3NFlaIQVY4pHDl7GMEaGPcgtLWIXJYZgNLDQPjE?=
 =?us-ascii?Q?Ge2B8HJjGcckq3TYyfueUnO4dUgTJR7T2Er6A7S3NOFniSXfdgnxxuFR4trT?=
 =?us-ascii?Q?ul9Zs4DnmGn+9xEUGq/GUCDn4fB8aGHH0ZgMnIu0uUFv8VW5jYq9LBPH48ib?=
 =?us-ascii?Q?aB5z7tZ/zbuz+J25w/5/Yr+Hv+iY+iaddYOOR7leeZhpg2856wWcaoIVXNr6?=
 =?us-ascii?Q?6j2JnsXRfHNEzKVZ9mwPn1xtkXC5mkoolWWsMuaeHHw/8jsvxXJwcrHJ3HOW?=
 =?us-ascii?Q?WrcnTTYFndfK5T1O6/cGeAerXjg0iMeDUBC9uWO5bpK4KBCPUQ+RVjFqKF8m?=
 =?us-ascii?Q?ACVpXzAl2wgbekcIKcCxL/ejSbtX1JA5xPoO2yM+Eihw+G+fMt8+6Eu1GgKl?=
 =?us-ascii?Q?iqUzl4OUFc20h6rUa79roHaiR1ZmzxEf9r/tu8NfTXUl6x5CRXB1yoYOyKKT?=
 =?us-ascii?Q?DeAMxgGTeQrEyhTIM3MU2/gxRWs/Y78YNk8OuSHlGYNocM9RbgQ3KIiEH985?=
 =?us-ascii?Q?wF7x7aFhzzXBZoxztcIUGpA40OTaEJl7dTyp2FnhpV/d0H8pOm9T4YcpnMfS?=
 =?us-ascii?Q?ELB/W8ssVLqlvIMy+LKdNAXi0EUBxVBQEf3soQ1yAPvx7mRm9bXi+fs3i7T1?=
 =?us-ascii?Q?3lah0wISis5iUgNNvQteREUbDcMOqAz+RAsDR90N+CFpSdCbHKKGubBwFTaR?=
 =?us-ascii?Q?xhbqfTsj/zomyrWWwfYbTG7hs56CG7/aAXxQ0MSpp9uVOp++pI2M+Z/n6DDf?=
 =?us-ascii?Q?ZumPzc8BHBHZIxAqJttGyHMx0db7JKK6tRXTZ4D3ywsQhuiUv0zrQGgsoPoh?=
 =?us-ascii?Q?iyWmDiAxHOl3xY0qTh0i6TIW42mJjAHQ8VMKUZ7koICdq8mT4aUFaLljQ+NE?=
 =?us-ascii?Q?kODi8UEd4y1FIZgNDwlHZgS5xOq135hqxhtFXuaERYkpdFJXY+qxYTh2EQOY?=
 =?us-ascii?Q?z9D/aDLh7iIrpQIAaEvizKJBPbxEqmPlOw3jdkqJ/MYt0eiaGBmIg8yfPYUc?=
 =?us-ascii?Q?O6wjXOM/rUIF19UUzOUFkBVwOBXWdtDgTkOSmv3b0swBYQC2/seA15R9jhFV?=
 =?us-ascii?Q?aJcQun81mkWbIJSbUE29gemqXpzDzY7ENnEDHaRCtaCCiWLmcazLglIfgLca?=
 =?us-ascii?Q?v8ZpCuEQWNABCHecRbor6/2q8enXiistFsiBxlTxA3x58B7rtfFAAg8R41Q+?=
 =?us-ascii?Q?Wqd84Un1bwH+m4YmUDjezZ8tJjgfEimD272R0ZTbnCxAyLrxwPTCUXBUPXgs?=
 =?us-ascii?Q?2GVBye88TbX60InhEZVUbxNpKaC1YizNAEXQ/35tIHz9p8tBiexeIYzglTbf?=
 =?us-ascii?Q?HrV6Zxskap05uG7QbU9rH/FRnEJJvgIbesZ5K6wAOL4fdzUoNoYzeW9F8+xE?=
 =?us-ascii?Q?8O4iZ7yv/FoYNHqDyZBUxUgmv3L8dKhnsbNn4g5VRPAPsgdRHDQxXf07Tpx6?=
 =?us-ascii?Q?xQpbk1L+yfVCoDw4uryvLgmc+0ScVvE7+r/Vsu+SpCBatMrjtmr60iDEMvAY?=
 =?us-ascii?Q?aLsvD4nTkwdqwadi+L1grMbrVsN5zvwM+Ya27XkA9RzcXBWtpVeFliMQFZzT?=
 =?us-ascii?Q?5CB3k8cL4hvjvgUJ0DSP8pCDoBjVckYLXbhw/8f3T5T6SHYJSuyR9St9nNEr?=
 =?us-ascii?Q?KgF/xZfNgJJkX6PDRrNLFspxrLpqHQqUlGYMMMaGl9W6BNKMU7C2ea6LK1Vh?=
 =?us-ascii?Q?OYphLOQN6Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80bbce9-692d-4662-f467-08de7b10cb4d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 23:41:59.5365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJf0A3DjmcuS33WmwqSTZ8xEY9cTqnxDFuaVy/7/k9jdpaebqF7fI/at2DLuJauD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_154208_713091_B72F3203 
X-CRM114-Status: GOOD (  12.04  )
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

On Thu, Mar 05, 2026 at 01:15:45PM -0800, Nicolin Chen wrote:

> You mean in arm_smmu_cmdq_issue_cmdlist() that issued the timed
> out ATC command?

Yes, it was my off hand thought.

> So my test case was to trigger a device fault followed by an ATC
> command. But, I found that the ATC command submission returned 0
> while only the ISR received:
>     CMDQ error (cons 0x03000003): ATC invalidate timeout
>     arm_smmu_debugfs_atc_write: ATC_INV ret=0
> 
> It seems difficult to insert a CMDQ_OP_CFGI_STE in the submission
> thread?

I didn't look, but I thought the CMDQ stops on the ATC invalidation,
flags the error and the ISR NOP's the failing CMDQ entry and restarts
it to resume the thread? Is that something else?

If so you could insert the STE flush instead of a NOP

Otherwise the arm_smmu_cmdq_issue_cmdlist() can just push another CMD
to the queue and sync, it is obviously in a context that can do that.

Jason

