Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA9D10AB82A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 21:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSxekb7GZVdb7TEN6uXLZzRnGG5+eFAEFTezW1dkK04=; b=WAZlvaXK4Iar8BD5voS+500yoO
	quobFhhL1mR4hlmg/wDJWapLIroxsVLzSXrnxmx/OJEt561I5EhAVzsX35sx0iCVcMLHQls1K34Fn
	Rnty15F527+mjgfFlMVAYdcG7BW5/SS/lTe/Ci5nWdnXl5sd8srPeKFfWicJ6OFPdtXimmm8Ov7km
	gJmbpAN/4e4OJu+h9Iop2ABfflJWBlextrLUwplBR7MD/SgFp9kJfaUwX3iYwfljqYqSVhV22elfb
	+iTkLknhWMAPGgjwVMUU5brzzucmJFDb6r1cij1TwIC7+EoWY28ORq9SfUuiOdqeOUSvFlMi065cS
	GS8lqNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5sc1-00000006Gxg-0dUB;
	Thu, 26 Mar 2026 21:51:33 +0000
Received: from mail-westus3azon11011032.outbound.protection.outlook.com ([40.107.208.32] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5sby-00000006Gx0-3Awe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 21:51:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wx5NrXbvE28X+J+eXcwqkrcRusUaJKwKkMS61Pwg9O/pln+3e1xU/4PnWp/XAXm1Uzm2Qt8V0x+kbgH6b0zS5GO99aq7eWnXlfG+jN8M4rBz/cHmHtTcGzyjRXxfGrgMwEv1Bo53DpcpjMrTav0eTRew2HMCsEr2xbdnTNYqzrnXJ5Z3nVMdD7TNQxkNqPkGvkA1dDoLAe/PIqadqmM8vUXociFrcfvxdg1/9ZLmy45dbykgw5lhI1xUlza/1uJ/UpRD9w0oG3d0amjnTm7gusZ5VHkhCpDe6HlkjpOY50L3HRGkAyNdtYoyzRYopxnrmqIaZbgQ8vth5j8FZHIzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSxekb7GZVdb7TEN6uXLZzRnGG5+eFAEFTezW1dkK04=;
 b=UX7JRHMn9on1hBsPI98nEQ+R7EA86KQ4NoEUB3JqfpLVPw87ZN5UB/oQeKr2TDx66hUUoUDGSIFEmvGwf2fcEifL7ZDsa9SSVkC7+j81tY9UZ6OzQqda0CBevB2Bx+G+SvNLzcMZCu+NFvKQO3SdOVPDsd+IaeTCI4uTN1gMR1gWBFm/Bv8A7idryqqnxocE/SnVFQMwib0tBaMrPnNdm12MWCagUVr987YUGu659xIa6UM8GrnZQVaAnVLsB8kQ2z1e5A5burRterWzJ8r/rlniLnVjRATfvQ0Ih6i4kw2OL6G1RsYcF7nZdsKCmBjW9SWad4buyrexRLU18UpzPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSxekb7GZVdb7TEN6uXLZzRnGG5+eFAEFTezW1dkK04=;
 b=t7ekeWA0GAxwXLCPaOO80byVqtkbHzSOoZjxhq5XVIRHPIxszXgoXu/3cUS0X5gRdQzCkcp9dhL0KPQcm6au1pPN1WphuG/NivT4gBkCnId2HCsZsbqAAzRmqAiWLyJxNVPZoEPw3xN2MvBoxOS/kF5OPkBNBXsUJP2yMwKbCoatxguqEE320MkPOeIelAJjSiiU8ulcVFw6pkNTwPZsN/6zRZR+cOtxjEI4OwbAweeicb4Imn7oyVJKBS0ILpCB0oAeobiYwmnHOxLtfT/kN6XOKwp4GRM39XFEwY10EZCoAaXDc7jB5cg6BvIAuKYRDvO6v+NKA7Cr1gjEPZg2kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY1PR12MB9601.namprd12.prod.outlook.com (2603:10b6:930:107::16)
 by PH7PR12MB7114.namprd12.prod.outlook.com (2603:10b6:510:1ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Thu, 26 Mar
 2026 21:51:18 +0000
Received: from CY1PR12MB9601.namprd12.prod.outlook.com
 ([fe80::cd76:b497:475f:4de3]) by CY1PR12MB9601.namprd12.prod.outlook.com
 ([fe80::cd76:b497:475f:4de3%6]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 21:51:18 +0000
Date: Thu, 26 Mar 2026 18:51:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, bhelgaas@google.com, joro@8bytes.org,
	praan@google.com, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, dan.j.williams@intel.com,
	jonathan.cameron@huawei.com, vsethi@nvidia.com,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v3 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Message-ID: <20260326215116.GK67624@nvidia.com>
References: <a0dd3e4cc5260f55bbec5b3ed6791def33028735.1772833963.git.nicolinc@nvidia.com>
 <20260326213854.GA1348488@bhelgaas>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326213854.GA1348488@bhelgaas>
X-ClientProxiedBy: BL1PR13CA0125.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::10) To CY1PR12MB9601.namprd12.prod.outlook.com
 (2603:10b6:930:107::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR12MB9601:EE_|PH7PR12MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: ff63b225-9d5f-4656-7e59-08de8b81cf56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HeM8bdVQlggES0hR3o8FDcsIt3o3WTp7oTmxb9yEKdX7kaz+qKi32K79SdjtaG0oWEIoIISdS/cB9W0O1YJlUx+RN9S4QHj287ybwA8KPavZZSE3HPXoNrvVdSMLjEcxYxHu9TKUYnYaUpRPSV1a1YJJNAaOvlht8x8v585VyXcLJYd8aqsGNSYTx9wvAabz3acemuO4jkhlcZRGk4S8v9qt1SaXw6iCO8A3CHl8Af4HDdQl4VKzCsthkzmlOzrkFHCa15DcjY1+gjwo3OpfAw6Q5m0yNiaFZ0J4xYV5nr9DjnKJQ/hUoKxLUWOiwaWKXkUIOi23UC5Ompi8TCL73EQiN0VyM6hGWjEGywOAyzNwgAeAlCIukmUJYk4dgd5+03UDnRkNWwzoV1ZYmk2lMmhIBgkZq0BvVCVmm/L3AYnyk+CacphRFaUrOfQrTrbUcrWTcERgnkAHqevyHFst+RPrwtXfWADGvaFJIil+HPcjM5lBJh6XBcQZxnFj3HNCrBGs+7LnCDXvhQmK3fCiDDUKDyWGty3dwtUHB64BvxfyvWkWqYZI72r0Ao0i5XV+I+DS+H6CFWiESnA+nHyAJZ3NjJiCIytyPbHpDbEeQwuGLqG2d+FHNVfmLzn7QAX9MHRbhqN51UWGZvn8HhDIadq4kxJqP8oDS8cKxI//F9zkqmQgMS5zdcrvQU+yrNiTbUuWxa1HJyI0JDBzVUj1PPX7O154ugOO6vhm058X2C0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9601.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e/UVAIszi5kLwRqIALX22rX20cO3ZdhcVUTwSZm4fp4HJiaTVykE1P9eugA3?=
 =?us-ascii?Q?pS4fvjCbg3VMrKsWeKjnJjtNJmB0f0W69bgJLtTTa63GIjTfaHj/kgA7Wzmy?=
 =?us-ascii?Q?f75mcUIONrCYPOnnMjnFLBDn3LyVx9clhjTK7tJFUjj9Pf/A00i1RG5ZpvaV?=
 =?us-ascii?Q?sHB+lmQs8Ev0xNQMZ9eUCWHsdEdepVVh8EKNeoZFL1dnKyZHUoBHXty8/jcC?=
 =?us-ascii?Q?rErdFxXGGv8fEqvJLbgCFJGP0jWYhsCiQguA6qyQYrMPInbi/c8fjJSTrwQX?=
 =?us-ascii?Q?eIcBj1Oy0L57F0RtZw82x0IJpxwCeexaue/rNHaPWee0GMFynD62ND5j/BBv?=
 =?us-ascii?Q?gbSYU2Yd4lvD/o6ODd5cwXvhmltCFxqVWFVzkME+yOzalASkcOIVMDe5jQh5?=
 =?us-ascii?Q?65gj8qlNQbZPLIBMz9rR8I96LsabKk+n5QM3N0LKI0wLpFlCBqySNf5ENlWu?=
 =?us-ascii?Q?q2pNmVgq1CmXROOa9VYOaJXyz8Ixt6pTKKouzgDFMHe8Jbk0/REWJmKJNTEH?=
 =?us-ascii?Q?mDyHv6szdEfVvMuHMUpN/qGnQitBlkU2NPEHT9sZhAzLGs/LFurIuOmKWheD?=
 =?us-ascii?Q?+BTMiMyY3HMJc9yynlRYX7BPeKAlR4QDxKqcsYk3q5Gq9NBdemSeF8Lm2Mfp?=
 =?us-ascii?Q?H47PhNOZRXnUbMuvqwvafBZODj6/HfoCqZLEAcB3L8mk2Zh4ydNlXK2zHdjw?=
 =?us-ascii?Q?lsRG9nc4+Yrqs7ELTgTPd2JYDkBQ48PQVWGh76vCinnhL5t+sh/P0Pbn+fSW?=
 =?us-ascii?Q?n1SyOJHUVOC134YD6NM3QvjGk2tFfgi55rtd4I7WhQ2TL5uxBWgtME0l+8JW?=
 =?us-ascii?Q?HgEi4+GIFD8x7lX4S4kGyCm6srMrg+LM0imcX9PrZzL/pVoZFtld3Cz3AWR5?=
 =?us-ascii?Q?blJkQItzK/Wua2gAcIE4QlEWaf1Rk5VSERS7K/rKRLLuGW9ulhICnJPNUNtd?=
 =?us-ascii?Q?/F6Ef2oiKt885sqI1MUYgoqvCh5DaRswWrIAHJUsERgLuzuO+OlWN4iVDpod?=
 =?us-ascii?Q?JLBQlh0EGpCn0jlg8fADawzqMC63m0wjT4V6P9NbLSaFkQKb6DQhpPSWfYqD?=
 =?us-ascii?Q?3dhMCYdpQf40HSFjx5AwFJmkMYwwo1Rx05mGbpdzOpkKHxu40XSFFPD+LJdK?=
 =?us-ascii?Q?mUBV85eR68Q+GXVCpU+1QPSQtpxEWg7BWXZcTOffkoPG4fCRfAxSogUBQFk7?=
 =?us-ascii?Q?lfhNGTIxJApN+w3adwtORGiJXeQqoiJBHemADaOlQKufISxB9qjrMRAvbRwD?=
 =?us-ascii?Q?rnNbYR+afnWizTiH7Wvl6Dvp1LI3CFOHY25nKzRf8SsqdV0EWeind2jIhlsv?=
 =?us-ascii?Q?lDXbJ1uvaoYNPjvwzcho4wLlJN1JLPITF9u1DPjU46fJdyFsB6a+vbjLC+R9?=
 =?us-ascii?Q?BwaP4KQWliW3DIWVmqaqBsevUK9U/yC0lqcWIIi7ECrTqCeEej+q65oFEXn2?=
 =?us-ascii?Q?pCpm9CxyuUhtDBAT8WDmE6wgyUmj9KmL5Mwq2QGnFReTVSDlFery2ag7Fqgd?=
 =?us-ascii?Q?aGDUXa4gXcmvfv/u1RULfeZgruiAS8KCsAwpM+qNnzheJjXGOoqN2Dqi+KmE?=
 =?us-ascii?Q?MPOTg3/xUmGehPopMO87kB0odPFW7keip/wdek/jSfEXAsFyzwoB+duD2n41?=
 =?us-ascii?Q?W9LA5wEcfH9j4Vq+0VEyBhBSk7LpkAZbaecnpua0rgtqR0mfh7Rg132J11W8?=
 =?us-ascii?Q?jYyXLZBEezt6gc6juZvHYratWJSRhhyqcDYPMZwblANeWJHX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff63b225-9d5f-4656-7e59-08de8b81cf56
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 21:51:18.0997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmLK5/SLmuzZ1G+XbnqTZ6P0SzMeYYg9TuS/41Gs82VEj92JbFIw7bp4L1+v+gH7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_145130_809228_A0D47168 
X-CRM114-Status: UNSURE (   8.68  )
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

On Thu, Mar 26, 2026 at 04:38:54PM -0500, Bjorn Helgaas wrote:

> It's only called from arm-smmu-v3.c.  Is there something unique about
> SMMU, or will other IOMMUs need something similar?

Yeah, every iommu driver will eventually want to use this. IIRC the
motivation for using the pci core was to make use of pci quirks.

Right now ARM is the only one that turns ATS off for identity, but
IMHO those are bugs in the other drivers to not do that.

Jason

