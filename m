Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EBD10D14AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SI0DjnsHT/kuw5Mml/ZLewYpI2n+SnGRVZD8a+fperc=; b=2aBW2tr023McdiR1S8RaRVqs75
	eO1y1Qj1SY7MyCPsKOWkAyANSv40E5JBzJzKMgl3P3NPUFMttnwIJBXryA3dP2nwVRW6SkH0fKB4r
	7BXLfwvJFGdTERmsAKGn77t2+M+n1116zHFXRXJNCXSF4d8FY/g4aiWu25Utads6zS+FUGOb01mFV
	UxvhTyW2Dmp3SAnTpwmhidiaaAFnu5xIRcBOANIoCTcKaAEPEpCi7C0b04YXzqG2GK1e6MQsxk9cV
	ZJd6v2zGZfB2yzM+apGH9YgJ7yU1wpQMqM8kfGHRKjaT985oWrzHv62CiFf6BN7/F2slM7VTfjDef
	HzzjBFNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CH3-0000000BJKo-2fJg;
	Mon, 30 Mar 2026 13:03:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CH2-0000000BJK4-0xyy
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 30 Mar 2026 13:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SI0DjnsHT/kuw5Mml/ZLewYpI2n+SnGRVZD8a+fperc=; b=IU7h6tV6YycV8Ha33Nf2fiHF53
	DpmIEYOaZw2zZ+IPk0zJrxAGr5rGidII41GcDi21z5q7bYBql61G21wTms/EK6jvqEr1GzmeHO6Iy
	HRCByJBws58lrVIlwhbqhnZq6Y3DoiimD31TD5WYZ++O2iyB0HwAHBKlwjgIdbnRKKhS8Y4rcPfQp
	lH5WDC4uZ51XIHIwlkZvD6JEeGA8qL6AY7uXyvXxSfS1t6gCWFX26FwydRi+NUwJta8iQpVoxCbRE
	xwc7DgcV+PZnsgnQ1SnWvNctE6ilN0tfIGsI9G3EwRWh0jAUHMkjmV8BT7L9lIhZkkQMzCX0hAiLe
	T2lxLf5A==;
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7CGw-0000000DtCy-3eoY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 13:03:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJI/MXAPzRZweZiaFfUfB/2p0CG9pSyFTNmdKDuD0AZT7cTHC7xttVe4HBBETOKyXDBQSgQyRkjwiDCfJ/nW+xTrFVytOuxc9Fjgx5Lz4nXgRtkS8inzTPNkQU+MhKdEYZektG3Hv0i/8Ter1I6/DcHEYI7Im8J67iaflKpxWZe4tMTgoC/7PpF9m0r7A1nrvwUHd5mUg/laNbzunHoPmNcYQMQVSGYrKeZ/FEWMueCHWHXApgR4bGyXM7QzVcBUwYC7Kecv6HTtGf7d/SjjMUSt1ZcnnUJAC2x7BHZL9DfsWOwe3F95oZy6JmFY2OoqvzWVzl3BHoucvqfAvPHObg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SI0DjnsHT/kuw5Mml/ZLewYpI2n+SnGRVZD8a+fperc=;
 b=AmnwIjzCtOm1uS4oBTy6xePfIP0bC3k8I5XJd/Woa1jUSS6/SEynBH6exkjOPRfPHXqP7N/PsQ/Ks09vC/lbNqN5LVwKPA7EBIEeMXv6RqM27s8vndOlHjtg4nD29c94SIf7pMmYLFMuXiy1+IEUYsjTEeJbKPRIY9Mi81r/+A1Sl9XNbXXKLNRu1XiZz0sALKr1fg/QAZP6l/6qB97uWZuZGzf3FQxjAYhrtFX8KaeUHe16sOfJqxccISLUPquf/3vF8N19us1GwEuPyA3zUknh5bYDGZxlSnwnr+VQcN3dqMtqfglFk+7OKNWTS7Nt4o1WOMWNmgAnj0NkNXmkQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SI0DjnsHT/kuw5Mml/ZLewYpI2n+SnGRVZD8a+fperc=;
 b=fIILoWz7gx3XKs0+m30l0259XI+hPszCNx+ncXHODG721knx/t8P+40wD5tspaEy+EwtWNKm8p7cVLMTiNdxfiUWCYxhPOnf09ot17GbPsuZpbqjFFm8OVoyg//DWd9Nh6PROy/KTIYH0sZ55YOQB3XezzaENr6RRaEkV5p7tLxkEJtOoOf54aMjDFwJMQwcTlzqqRzg52F9z/xNxKN/c2huzmbcbOUg5fxntUqd+sS0CSAdGmnn3B2hmyw7lqhYOk7Aw/VmqBuLrNOXzzIy7XN6rgiMnFhPA2KbqXwQH0TsWcfvRZo6Cnz+EIKGT56AuVXoYo5lcUIqGMkzZtflIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by LV8PR12MB9667.namprd12.prod.outlook.com (2603:10b6:408:297::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 12:48:48 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 12:48:48 +0000
Date: Mon, 30 Mar 2026 09:48:47 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, bhelgaas@google.com,
	joro@8bytes.org, praan@google.com, baolu.lu@linux.intel.com,
	kevin.tian@intel.com, miko.lenczewski@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	dan.j.williams@intel.com, jonathan.cameron@huawei.com,
	vsethi@nvidia.com, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v3 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Message-ID: <20260330124847.GI310919@nvidia.com>
References: <cover.1772833963.git.nicolinc@nvidia.com>
 <a0dd3e4cc5260f55bbec5b3ed6791def33028735.1772833963.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0dd3e4cc5260f55bbec5b3ed6791def33028735.1772833963.git.nicolinc@nvidia.com>
X-ClientProxiedBy: MN0P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::32) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|LV8PR12MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf455c7-25d4-44df-7cc6-08de8e5aafd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: jZYxUymWCi1r1ci284/Nr0HbY63b+x0seU7u6STCyoeP1nrDoi7j2ZHUeTN3phT2YfJnOynE7xXZglRP3mahXgK+FCry0ZIEO4nMjZX5lMeKrnukero5JXU8jgYy0MdV23gpSunAsECQrF/xC3VpDD5hEXJ1n6ofOPSwDnUGIAKuI3n/AwWYEGKvoOH/kSNqSe1ChcC0Dbpi4XEbhvgcPw14ClcJvde7UsQoYIQeUg1O6HMCu179vSd3ldh/vbA6+NQIAkXOpP7r5ZxgOhGNDNvDLW/1SHIwpswmvXASmYYxG6c/hlighMdGFmag1L4EkYPguwwg5Y/puKipphvLgbOt3E+zQFqBgke57eMazECnhGU3QK1adb29YfPYdVvylnfWOg/ozYeKS92mX1oVNU9fkPMqIoginJ3qAa2xvMbqwBrysM2LNPBfsndl1VNBrZfMNfjtES1LfdpCZSjJWQ8fqSjjjt7j3XaTctyxKmnLnsJRzBqxFdwD15BpwrcJeqab5u0S0PXWjVS8Z835emcWenOlLMpkR9pmF7w2CNreFzpZEFd/50rmL3PYALGHZ0BSJBEJ8tA8sCdZGZxYqwsm2Z+Be0QKG8B6qRUn8+ATT2qJUvk/beXn/20E6s8HNPCl7iqbcye61lezQ/Sc2ts8LTK5PlVCiD91yUpoxDB4f4hdgiQYhovGRD0khu0yKdhFcGFBcpig8FB1Vg0MNX7ibgloWBjp0N+fMYT43t4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LTM1sazjCCpScnCLW2Tixoh4cdg8+YtvXYGw/dkMpOAJqpB7jFuhyJ/H+vAs?=
 =?us-ascii?Q?oECJ6HBDK6zYeWCAW/tNfzJpeOdWIe2vbtVbTEeznHDlX0GUU61XZdVSB/tb?=
 =?us-ascii?Q?gXf6w5e5aHtyfN1m7Yi01M6m6KMPTUPrWqaHOiGC1Sf6YAY3p6txgtIObKui?=
 =?us-ascii?Q?uPCtVnEQ6b3oNaiUCWxadvyzpCVgjb1edRkMGTORtvdwNQP+Rw1VDH810nfh?=
 =?us-ascii?Q?OQ2SypWxeL0pXuRTTfHknGvOmIREqk9wprW4JmDJxDzSLQm1OvzsTxvbaiJd?=
 =?us-ascii?Q?1cffbSW47+hQnFk5040hXo4aC6BSTMlxxu6T5a6zR88zN77tm+hYySKRFWpj?=
 =?us-ascii?Q?3aARTTuPuXz+7uE0axYlhwTtOq1/t2iMFA5qc9Mi1TpBKcLmHp5Vovv4WHTH?=
 =?us-ascii?Q?i6FKv3gmxoazCisamV/0ho2p3/qieSegTBdH6ucZUesU3rNOR+EkkU+CdGMh?=
 =?us-ascii?Q?vrctFzi5Vb9uVIG19CMVd+2Sbteiq/NCD8FG0JyiUCeQexRnD/6e10IAgxrH?=
 =?us-ascii?Q?fy7jHU5jXtYcLaFkk9IGEX9E9VRs4DjfCIb7xZ5FY0xWmwOKERD4Alelepcs?=
 =?us-ascii?Q?JVRm8ZyeUlXl8mLVUkhcHJx7flZV9i/ffn+vtqCE337uNtYY1jJEtD+XQxql?=
 =?us-ascii?Q?du2RPsvyi1VplWMduMlpjH+0pe6+KnqTuQYkz9FLxo2xcQpwRswH0BfAcVNy?=
 =?us-ascii?Q?rqCYOOyRjge1/iO8/132W7U81ItbR8VkY/w6hKFPXq/cRwoIWN3hP0ThMxcU?=
 =?us-ascii?Q?/r6cFQKKjrbnfL4yBCZUweDpHzVkSGKn4OJlhcSaHrW1BsZPFP88/JNS568g?=
 =?us-ascii?Q?DJ3ZM+V7Dwknt65Op0+/ydGgFQq/714XIFTky2e4p4P4GXPIaYqK5kJR/lm5?=
 =?us-ascii?Q?YjoM6WNtrbxHDCaZ2qX/D0KDDyTWTxrHRmftrPezcP3g5UCbGi3z7NiWqZKL?=
 =?us-ascii?Q?hKZlaBVjvnZpEWGRUKdVq27GdAeGeTH7UU9AXflgzReaXTko3gTPHnth8XBQ?=
 =?us-ascii?Q?dYJtAtlXTUwn123gcCeNg4RQxyjzTyaGXzMG+4g7nncR6WYEXssVc0ECffxV?=
 =?us-ascii?Q?m/RESVXqvBcjDy/lzFVAyBQ6YxA4gOhFnHpKF1sJ9kLf4DcQV0KWZh0gLHNF?=
 =?us-ascii?Q?8PdNrTCI3nxE/ElcI7uGjH/UjYqa6wJG6d67aQIImXBAqIp2dnIaNMtdkRbv?=
 =?us-ascii?Q?kNcwprGJNFvV2cqqJHietJdtLJDFb3o+gRUUd3AiRA2vT3GMEx9e/6qxh/V7?=
 =?us-ascii?Q?xGZxos5ir/liGjHyFtiBvO4BawmGBSm88+v+JjpgA252+Jw0t82zY2jYkKsk?=
 =?us-ascii?Q?mUOsynhSzoh0+rJNXrz7x7v7+IaWqo1zfRYWYJFHaFtZMtZEi5EnFSbm7tuX?=
 =?us-ascii?Q?AVPfHs9OUZxkQfL66Bhir4BMxBockEHpqesaeKZlR6Ng2MCka9oTjVCm/bmG?=
 =?us-ascii?Q?LM1hZTSe/MAixN/n897b6q4WYqLfUbO9pkiSE+UgmoiadiCf8BUDsWXoBWTc?=
 =?us-ascii?Q?Qghc52ID+BmhMrJE/QeGVRKf83ryRPRjQtmwawUNaC599g+bXN43QaNlfaWd?=
 =?us-ascii?Q?svGDLFhLa5NN2JlaNIbSW3c9AUaxuOYR8SVZsmAIG0fyEu9Hqj0EaQjr5G3o?=
 =?us-ascii?Q?upvAO8q7uadUrNZOWF0tpdoJhJ2kIykduICodLJc+tZaIim95VRBxZm1aWXg?=
 =?us-ascii?Q?nLlBqU+TwOK5bwXAsTAX4My9pEicd9GnWrLYlnlYfTFtwVfH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf455c7-25d4-44df-7cc6-08de8e5aafd5
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 12:48:48.4273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSVwlOyouK7P57IQTz7SfVKLb+9TADs6bay4P1H913IMP4C8q8rcGZgMOvYhQlgZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_140315_009612_6EA6ECA0 
X-CRM114-Status: GOOD (  16.85  )
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

On Fri, Mar 06, 2026 at 03:41:15PM -0800, Nicolin Chen wrote:
> Controlled by the IOMMU driver, ATS is usually enabled "on demand" when a
> device requests a translation service from its associated IOMMU HW running
> on the channel of a given PASID. This is working even when a device has no
> translation on its RID (i.e., the RID is IOMMU bypassed).
> 
> However, certain PCIe devices require non-PASID ATS on their RID even when
> the RID is IOMMU bypassed. Call this "always on".
> 
> For instance, the CXL spec notes in "3.2.5.13 Memory Type on CXL.cache":
> "To source requests on CXL.cache, devices need to get the Host Physical
> Address (HPA) from the Host by means of an ATS request on CXL.io."
> 
> In other words, the CXL.cache capability requires ATS; otherwise, it can't
> access host physical memory.
> 
> Introduce a new pci_ats_always_on() helper for the IOMMU driver to scan a
> PCI device and shift ATS policies between "on demand" and "always on".
> 
> Add the support for CXL.cache devices first. Pre-CXL devices will be added
> in quirks.c file.
> 
> Note that pci_ats_always_on() validates against pci_ats_supported(), so we
> ensure that untrusted devices (e.g. external ports) will not be always on.
> This maintains the existing ATS security policy regarding potential side-
> channel attacks via ATS.
> 
> Cc: linux-cxl@vger.kernel.org
> Suggested-by: Vikram Sethi <vsethi@nvidia.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/pci-ats.h       |  3 +++
>  include/uapi/linux/pci_regs.h |  1 +
>  drivers/pci/ats.c             | 42 +++++++++++++++++++++++++++++++++++
>  3 files changed, 46 insertions(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

