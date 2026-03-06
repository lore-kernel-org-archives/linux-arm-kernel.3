Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069AFF513EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 01:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzloiUdaK3+oA3d5/9lDbIZNKgivPeq/wbKxGNWlPxg=; b=cXoWFr/YC2TZ63hoIGrU4ccD4D
	qv+R+rkbQCDvQmyH/HdaARl5ckZI1rrQcO8oQhYW+00eKxepX/Xg7OwG1eiTwgb8skM8YZr2rhsHI
	xWUOkA+Q/AvvZsSj0h2Z4ffViIxWIpMD4E55iK9HQ4h7oIIVQgPlPSh9MEBfQYceB6yzW+vHoDr5E
	kWjZWjOUUkQayBCGF/jIvrvMzJsxGJOJU2hpCANiM9Sf4MIXGPnyEVNFIueOpZ80vmoyALn/HZiyM
	ctY2of6K1KscCNij9aFyvlOOYS5MXTrVhnZZaXyfOVkOVU8Y6pAGKZ7BBgWeOnGhlvcpSr82OnNNu
	xYCpP7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyK4j-00000002qNB-2bGo;
	Fri, 06 Mar 2026 01:33:57 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyK4h-00000002qMp-2EJW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 01:33:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBO2E77ZK2Sa3KvgS/SwI+6W2/AY8H9B970Hg0qWF64Ij+gik7qJ0XsA10H1OXi8TpdIgS0HsBD8S1YbwRhGdAfAJUhTT9V1PCgTabwlLnYHWpUtBYox+5+ha4x5uIr3b9tUiXxOG3GBoPTN6zcIcW5xnamKNLkSW70sdkyuO3/VvflHmU8s1jmg/iQcAL5nKrefzXklvOU7RuDNUol6FFh1M7JS+Fb6XIrKIehmQtdw8ZNzSfWkk+GX/FdPhEvBQ0sVH/BHWPE/GiWTg2YIAVQ7BIkvVINZnFmLGypZMcd+vK4i42kEPFWIhYsEBwB5aj8LN04KtJWJhNpSkKqNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzloiUdaK3+oA3d5/9lDbIZNKgivPeq/wbKxGNWlPxg=;
 b=bXZmQKPA0ZHJaPM71zy+ghQ5gqViMue1tR49cuKFbeNCTpOfHAtYNPpC24UZsA2tX4n8JKK65A/zgGthVmPhyGJ+XzupCdmYIN8f9kcmgx+btFH9mRnvhao8LaMynOsDX8L9BZ6O+mmavGzGt0sgZEdKnCfGWLHpMihjdDDitEaVbJFYqARoNQYDYH0tbx0wu4eZDgoCH8n5mvrOYTLo7Yg4XQonc59OJG8Yq4XrZDHftRuRkZSLZB3HzwCZ7jXNvnTlahHiU5Q8JyBEzhOrABm4fjmQP05F6ffjXJerdgk6Be/UgKQdPSm4yheZyD0eyhwpgdOVJzMGhYP6eE9VBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzloiUdaK3+oA3d5/9lDbIZNKgivPeq/wbKxGNWlPxg=;
 b=nBhdsLrxtW63KiEh8ALhjUW7vIaA7+Nh1VU6avjg1v6CG3099MC28henZ5t4WnwYBKT8X8Dmp2e+r/6IIe3EuVrWMT9Av9tFXVdC/a6aE6doNYIHftK4YKIoGb6k4SpI+axNjvT68fTG59GCiq/VMTQZ6xeFuxgBF5Lg+nS/Mu5nNMZ4gB/cFF2AIFdDU5amRyPnrVLb0GXRsfDV8RfPiTVtiM7yUae6x37NP7etxxMDmBpSsvNMVT4pSd6RgXdPINYjOJDGdGuOXb7XN1ZFXljJBbPQEp2e/6opITXU6Frh49EAIKrNVJ6Qvr9B9slIM9F1FqAGWVNx4uzWVGBJow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by SA1PR12MB7341.namprd12.prod.outlook.com (2603:10b6:806:2ba::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 01:33:49 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::299d:f5e0:3550:1528%5]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 01:33:48 +0000
Date: Thu, 5 Mar 2026 21:33:47 -0400
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
Message-ID: <20260306013347.GD1651202@nvidia.com>
References: <cover.1772686998.git.nicolinc@nvidia.com>
 <ca7ab934bf0f433b62a5c15d42241632c4cb9366.1772686998.git.nicolinc@nvidia.com>
 <20260305153911.GT972761@nvidia.com>
 <aanygWWZLA1htDdQ@Asurada-Nvidia>
 <20260305234158.GB1651202@nvidia.com>
 <aaot8uRsli5jNPzH@Asurada-Nvidia>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaot8uRsli5jNPzH@Asurada-Nvidia>
X-ClientProxiedBy: MN0PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:208:52f::9) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|SA1PR12MB7341:EE_
X-MS-Office365-Filtering-Correlation-Id: 01e4281b-ec1a-400b-ecf4-08de7b206a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: VL8zIOnPI3j18gwtIWQf23z3bfqQSk1GUdo3FliDVOefnK6DotzSpqut5AmD/Hmi8U8tWwrzYpbO9IG9dhX355AAD7HnN9AaFdbkJGpGhmnkxbgGmM4I/X4zgHSBK1ojRHz6GgGzS/lNEzwUU8GeVPUXgOYRWHNQ9PeMsLAyKGuW/YzxBT2E67GMMNOu+j9avI5kmIM+Wrw3B4Pth3LM+PutsXw0eZKXRezh3eCZBtk1uMCqd7+qDhFCFZgVnx4r/IKV7Yj9TkFZ1w6MKOnvudJXNYB+HvvPV0fxQZAWRrzm2H/F7nqCNPnqI46wUpyzQvMwPxLIoEDpwMwfWSYmWeG+3v0XGUAFZabBF1AhZ/U1tQRtyU8d9qQpBnwCXUotZ1OWEKv24x1Bltj2eQg711X4nMKDmKFQVYcj9PURk6hoSNUo00hTD+HRDwArQQhrQg82MZ2ZwmuctUaOs/eIfv8gj3CnMuKhWIZvAW1iy/lk/SKzMnxW1TPQUV9CYBhZBbjDgi8VBeVx5SJHNOwfu+4K0w86+1pdHmucnL2cAHVcujbnsmfaUWwnv5N776ZLFzj9Bp/0uCTaTVYQP+QoXynVLx7tLd9iltwvd9SfkGVtUKe3sRijsMo72dZzqiob2Zx44mhDGvkMDNe305q1uFaeDDYalXSOEPoi0RyOM0vAmnNP2P3lQXPCFJYJCjqXVw7l2nIz9PVg7qwPzT+GZ9jEj5LFbj6AOuN4z+CkMRE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AFe7+bdcPyUYYCTHp7UtnF+rFAKAsT9vZ8sKQHU0GGriT2uluU2bWIlPyN+f?=
 =?us-ascii?Q?M4UhRlqzuGDPvs6gHrU7EHGxb3nWUCkkMU+qUtmFpcrp/v0svx1959sLy3s1?=
 =?us-ascii?Q?V8vM3maHhMvJQ5A2hov6MxxMGDQCElc58dgLBw84g3eCdCltGp1QFJLpl5sJ?=
 =?us-ascii?Q?WU+qZmyfbe7SyWV6qmiSJmnVeh5/D8xT/j3hTt2UchJJsc3k3kWE79CT1BdP?=
 =?us-ascii?Q?m+yNgzxmNElKiVWsQcSQP2dF5GUEw5dva4GgRN/plB5PovqRQKhcdP5Kx9lP?=
 =?us-ascii?Q?bDrkPap5R/xLwM5A+NNCvDc0PoP/eiLGJNPniFkBY1+OrGzuylTPoykcaFap?=
 =?us-ascii?Q?Pco4m0QUHCTjZyC8F9COeZAK2ftw5ac4biDH0vvQ3E3XP4Rl79V/RySXS07S?=
 =?us-ascii?Q?ihoDPdbZIkzzrJ7w3sJ+6GKM005Z6FfHEQ6fJ+B5OXRxH/oOKIkr6V9n4P80?=
 =?us-ascii?Q?S7S/qx6+m2GvHpiSr8NHQUkuPnXGMQ4wfdxrFrtbpznOEGPW5NHpD2zQ+5UO?=
 =?us-ascii?Q?+9OOSNfwA673TPWNm5YC5em+rheglSiYSBAqAAQ1POJAQ4+rie1235PYrS+a?=
 =?us-ascii?Q?1KZhhwB9cXKoD9C2zBB4vqz1FdgG+/+sGbrUtiGUXry/2rmxjm8GQU4/6hIv?=
 =?us-ascii?Q?zi9ja4FjV1po3yL0+NsZ3uIEavUY5bIanHZ9seW2B/lOET9RNE7kPnUBRi7y?=
 =?us-ascii?Q?BFeF9WsUJpFWiUh5x8Yi7kFx8ZRO2FZ7F5EFgDFCAimOKBiF7bSVpR2eM4GD?=
 =?us-ascii?Q?q69JOsH3uQuSBNjBtF8c+n0PAbw2rbyFFnragF7+FNXF3fuQdQ0g6+lDc8Ns?=
 =?us-ascii?Q?aF5WCtZkYkygNdSVzt7hBKvMImQe0mLdqHW9n9TUQA/6FC1Tdfh8oaxm+mYH?=
 =?us-ascii?Q?QT3erdY8HMm/L8nyhaLKxGbVobih5KrvCGLGEArmLAelm4UGpKlDe5jZ6CwG?=
 =?us-ascii?Q?A3KcUsSf6Terz/V2GMmZcuqEkg+E+5oG/VuHgvIvYeQwoaYb7AtC9xwChsQL?=
 =?us-ascii?Q?6YpMva/SFi2jMb+UTMBjjPTtViLAkNm3okc8WtzaSTcxZR6EcMkzRTjmwYdK?=
 =?us-ascii?Q?WFGvdJ+2uFXWC2Ol+9tJv1TQnSomR4TshTOghfcX1KJcywX5lOjEg+uuF3C7?=
 =?us-ascii?Q?zu4mBeVoHFUe6nz4+8/W6LuoZUu2mR+eMDhI7AYAZETgw8Wp+Npz+4DC4Xa5?=
 =?us-ascii?Q?Yh8h3x93rIEqeDQhVinbciSefzbtiPNo+ueYmSahdDKW4iayChFQvII69TYi?=
 =?us-ascii?Q?5n835KM9Ih5aZwW104R1K9ZP8kjy1OWnMES+Mzpwz5Kz5+rrYBRhY+NXlTq7?=
 =?us-ascii?Q?ucvjnirpkgfRNGYSmceQCZFv8YBDi5EvF6Moh6NBbEj/1tr+HRc6l4OvOhJA?=
 =?us-ascii?Q?2ApohrzU5kY/yaUPkzh6i+SMYJO896Bi0ZA6ipZ28P6zQ9BBOahXIOdEwRob?=
 =?us-ascii?Q?DfmuY1xw301A0j3QoMCdeLCnzWdjzqb1n2P/dybdj4yVA+w+/XaretjCrvyv?=
 =?us-ascii?Q?gR2qB488HzFpVCYlnSXuy/idvoFRtYrN708zBhHES8ehhpWsz4WvXd6idc77?=
 =?us-ascii?Q?CdB/HX/bNldt2J2VGhWePil5stJTBhPOlBAlURX2izZ/fR5sfJD5Q55YH8eo?=
 =?us-ascii?Q?p7abS+MNP9/Xzx8bHv/I+SHMqkoLpumbwjdkIWnD/+tufZNJTHtx1K6WqUSE?=
 =?us-ascii?Q?Nr5FhRCctYk21Nyk/rLmyWEBnSPIyGhR5GXDW7vB53P4189s0YN59nlXMErJ?=
 =?us-ascii?Q?FSXP1UzuAw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e4281b-ec1a-400b-ecf4-08de7b206a4d
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 01:33:48.8178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmC7apvach0BdGH9u9R77K5zDdo1kyH+ZtpcumAByS/ivRrpJ62QJXuEIk1IDxFV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7341
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_173355_599619_36BE8234 
X-CRM114-Status: GOOD (  10.36  )
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

On Thu, Mar 05, 2026 at 05:29:22PM -0800, Nicolin Chen wrote:

> But arm_smmu_cmdq_issue_cmdlist() doesn't know when to push another
> CMD. In my case where ATC_INV irq occurs, the return value from the
> arm_smmu_cmdq_poll_until_sync() in the Step 5 is 0, and prods/cons
> are also matched. Actually, at this point that NOP ISR has already
> finished.

Yes, you'd need a sneaky way to convay the error from the ISR to the
cmdlist code that didn't harm performance. Maybe we could come up with
something, but if it works replacing the NOP with flush sounds fairly
appealing - though can you do a single WORD edit to the STE that will
block translated requests? Zero EATS?

Also, will the SMMU start spamming with blocked translation events or
something that will need suppression too?

Jason

