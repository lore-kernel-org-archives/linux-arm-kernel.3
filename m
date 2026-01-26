Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B914D1950C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgTW/fG0nb22mO1t4i+3vdpszbxGCgOxLxoXq5dToek=; b=JIEm+8aOFaFFvYFsIuM+bGniGM
	AuT7MIkJwyoBtwKrAkyuQaJMbtOr7RJ7wDXmDn5aY0kcVZUtK4+N14meHjJ46Br79EOZ+Lmp3iK68
	MEtP3qe/8V8pPLEJbFX8xW5biP5HMKbsd1IXUo7ukqA+kBonkeULJ3fG0I0MUMp5naPZK86NIulF8
	O3/+EqYZmG2eSECxPElLVFe7QlCG9GFGMMglAj27MhSS95NWSqhHe8kcbD2KYRpjEXi9hqiENC6N0
	waCwbRPDCZm7UkqB9jKR4n9ofX28Q2/LGqtWRmiQmS6b89XzhH8NrauReso4JIXXC3oJi//llYDab
	5M5jE5Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQGN-0000000CxRe-1wsg;
	Mon, 26 Jan 2026 17:20:32 +0000
Received: from mail-westusazon11012024.outbound.protection.outlook.com ([52.101.43.24] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQGL-0000000CxRA-1dfi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 17:20:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npxxqS7Karp2JgWG0E3kELInknznj1IQmEtPFCxRcMokjsN3QfpFUvI+vrOjQkjbO1xMd8EURYqtXJo1Ltu30qn7ZxFJCFzmFkQiWOtp+GQrHmNo6zWo2U40pwF6m5IyJrhflKtvNkJC0N756LFoILgzvfR/9C95f7d8ntVKimuTh6WPaiJgkUQFzPGTGQmZS3vp3YBR1B5gfhMIqz1kMBesW87q1ZYou3gEjwywxlh9LbdB3jyhThw7JP/uMloHqjWlMBIt/9akszAtSxD1meT4fyOO0FReAuKSdDTayiI+CeavSVwd7zXDxVQ51ff/g5irzdHALU2OiBDRa6U0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgTW/fG0nb22mO1t4i+3vdpszbxGCgOxLxoXq5dToek=;
 b=LGwjnKqS0pOUTy3kkIJQ6LPaAthe+F9IUF6SlwNbU965Xl/oVhpHHefe2CGlkDdpLwO+7nJcmIk7eEi1ZVwiXELW6yQwYcwn3K1JEGu4pwg7PVxC3kVhfbDSNa0UtnCYmo9zCvhP6drnS4xEzx2lIt/umiUPXCBpdToJOzCOx7UIcDJFZqq3I67yYp84G8aQ+pXmPBCoQgsAmyWycpPo0Ok6YgDdRRUc0PXOYOfzkLrZsdhwmdcyUURSX2dE/6rl8i/ZJAhCRp/nznbDxTJWeokAIdmn11mA9c4+GguSXPKw1bjpYMLjXAYW12DGyQCC/pZI6dnuK6kKlHLvie/Hgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgTW/fG0nb22mO1t4i+3vdpszbxGCgOxLxoXq5dToek=;
 b=F6kVIJavC9PTetgcgCLPeKe6mxDqbK9IdpBUiYgh6hgrUMu8x3XRyI+BHhpKEKMjBkQ10o3/jXoxsH9CjvsO85mZhAdTdaU6/IvUkLSYpcZuCYGdl3bclysDbHh4C2sDZBp4ITeFhFPMV+66A7q60arI9k/QpEIJ2AAyaC4n0Tmb0fRJDhLtNu1oRHxHD91SSGoTZo2VUnMFw4nQ/Ed4JexIWcSFe9Eg3115fxORbtamnLDq99iU/RwHI5rn0Y/5ZQIdlUtJxVHIW6xHnd9Vrg6joZ4qdVLaaNbw4Ph6B5hJNPNMEUZk6FEg8y8HMQw6irifG1FX5U/WoPu0+0+OGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by IA1PR12MB6042.namprd12.prod.outlook.com (2603:10b6:208:3d6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 17:20:21 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.015; Mon, 26 Jan 2026
 17:20:21 +0000
Date: Mon, 26 Jan 2026 13:20:20 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Will Deacon <will@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, robin.murphy@arm.com,
	bhelgaas@google.com, joro@8bytes.org, praan@google.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH RFCv1 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Message-ID: <20260126172020.GP1134360@nvidia.com>
References: <cover.1768624180.git.nicolinc@nvidia.com>
 <09cb6be1f8f7472a2f1ccab72154cc6e22cf570b.1768624181.git.nicolinc@nvidia.com>
 <aXdgljWHHPVMTmya@willie-the-truck>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXdgljWHHPVMTmya@willie-the-truck>
X-ClientProxiedBy: BL1PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::10) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|IA1PR12MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: d00c96fb-5abf-490b-4b02-08de5cff2f4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P2AObSqw0g1vjDY36kOoTmAPHuVFzccFD5o+xwma11GYdCnI6ujTEa9R09vQ?=
 =?us-ascii?Q?FnMOy9RggZUYry7zxg94tA0o7mztNv57VSS7tno4mRFitNKjyyUN8gufd+ju?=
 =?us-ascii?Q?2PbhxBl9PnhAFLQFLS4RAOXuOau39yelg2fM6ttAMeCE5bFg0UP6LHGjisIt?=
 =?us-ascii?Q?lNCY+TOym19ixDKqV/CTS+BVHOMEQiu0QPqFsTcABbfuRoOEpqz3bwTWm8ZT?=
 =?us-ascii?Q?F9s8ccSUIRO/kpYv/ZhHRFoyY+0B6ALudjdaO6j+2AYNthnFlWXutFcegIUw?=
 =?us-ascii?Q?yxnN6iEQrKoabV4ka0oz98d9eS+k0o9IHjiq4eyGy5rdpP7JAOJOp+/F4bDX?=
 =?us-ascii?Q?P+Sgptwc4l4togkCvFQCNBB0Nu4/WpMqlPKOl+QIRVtkL9LItIf7/uM3WGo1?=
 =?us-ascii?Q?ShOmxu2MNPV+atZIx3OWTsC2Aaeg24jX8MJptiM/xBzegB7oiJoRm5h8mlTN?=
 =?us-ascii?Q?D7zO6fbOdkCbdbiN4P30UExn5MOqMTe81aMMgdpeCKcqUUI5juPWJ7nd/nhw?=
 =?us-ascii?Q?q3wKtoKkt7sO6J42cprOPv3QWJVeBeaMP4liS7o2GOVajADuIU4kDgGbh7yF?=
 =?us-ascii?Q?igtFse6J5Z+kzaUvjaUo0Dy+FzUV7fqgJ0SUa8rwleEnP8bspWC28HdnKFaM?=
 =?us-ascii?Q?QAaG3K5mYvwyE4cxopmBWh6xu6EVnWARL2U6TCLZbpzjF2Mtry0/jZ0ZQ9g/?=
 =?us-ascii?Q?yNuznsvjY67jn8QsdT1u1sRc2s9RZNRNBbuHCD8DMbPNTitPvKn91km07ff4?=
 =?us-ascii?Q?bTy6hqYf7lfxdPbg8+//VoKp3kOv9AuBCaaDGU8Vy+qshQE9RvmDcQ4Umjgy?=
 =?us-ascii?Q?6nWReFXxoKl8FVKnWGCf1UlTFxzS7l6EKNIv04z6TEYixWuSdggnnSMtZ0TT?=
 =?us-ascii?Q?MRISZmh/MvbKhZisT7MVb1NXiylVl1mcvDF2XMglHhJdoktGYXGH0x9DiBQF?=
 =?us-ascii?Q?xstYzoMi/FcH5KB5vqej277tJX8ODAQ1ZkWP7MYwjlnT5XB3wtmbW7uuOwX5?=
 =?us-ascii?Q?hsMVzJyTOrDAhIZpxVnqLTes3AHsAu19BqevzRIYVfeOACZ4VD8o0Vd/OS7c?=
 =?us-ascii?Q?fvGDCxJHbNG7LGwSzsCqy2n/TmQM6ozLEMMYVs9LdxpMPxEYKRjUDlLGqefP?=
 =?us-ascii?Q?8ZBDccThzdbxLYsWaB6tG3NdR0J8/2VQTo5WhT+YPJn4dXwUnSJlB8TyK1Xd?=
 =?us-ascii?Q?AJGAQpoQ9jQWKfefJiVMOiIjoM5u3PFkxrfl1kyXmo9Gg+0JzUVTGWUqCL43?=
 =?us-ascii?Q?pjMyYy94nr/aLfiCez4he7Xhp9UNkVqql1NzJlaiqWFHBA4ViyTvUc4KQUd8?=
 =?us-ascii?Q?91fv7Tk9va/8FMUIPtjwqjWFifVzTjcnzZREhltOHyfAQg34cK6oev+5V9t7?=
 =?us-ascii?Q?dqnlPIcAABsL6cy8t/Wigw7L/cwJzwbuzrldAOFmmQyGKcWJiwoFt9irXUsj?=
 =?us-ascii?Q?rV+/sth+oGAbGM95qUHtHz/dt4KjhNGpjXn5/yVwkjoCCbb157krBXFgmopn?=
 =?us-ascii?Q?eY83m7zi2B/cZ4UPGd0s0p8ZMfUuAAq2RiL9NDZ9asywS708WKawr5VdQ0ho?=
 =?us-ascii?Q?mOYsthxoQmS0K8W5xEA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8+NAsWbRRjHc4YsSmVggZpKi1XDTcZQ/6QplM7c7bmA9slKfYEevcpE2ZJIC?=
 =?us-ascii?Q?PsWLQGiyhpXpIZrhnl2/iEUNqajBgUNkozjiJ9CJetdihzDOnohrxAG9FUt/?=
 =?us-ascii?Q?WdCuOFUcz/quPPUZrJRK+x2vTniADb1W/1R4VX0NAlGOhKwmlUSoSikOzWUV?=
 =?us-ascii?Q?KbB1BWx6NmKmbBaE1dQ3AzxUfCWPnXe/sVb+W66wBA4OlJ5RG/x70zo71+oF?=
 =?us-ascii?Q?0OQB6/9s7eQaq4b9kAWy+JHFM2V0mgVqwUw13+Pv2bjTXkXK3xkACsWtG5jz?=
 =?us-ascii?Q?lEqMcIYP2OUQ9ywB9p4SLhNT3ra4Ja8xY3PF5MfVudHAR3k2tGcEJdYShiiW?=
 =?us-ascii?Q?Hchuh6P09dgG5aQtkA4dzlgpRPK5o/W1AtZi+YDinUoZf6Ht4f375Qllbw1i?=
 =?us-ascii?Q?cJO8CNqa2C6V9ZZsc6K7m7Kn+I73mBJNRBJcBePRDvAiOmjSUNAJap6em/ka?=
 =?us-ascii?Q?t7Rj9aVsmoBO9491N9inqylpwohxo65JclAaNVzfa0/xjVC9CyeqkZgucWQ+?=
 =?us-ascii?Q?b72LitwO0O93YthDMapqLBytO2mHpXEPaST/WCOLB00GJhgpT9LrWQdDiq1g?=
 =?us-ascii?Q?tKXSbqBqnT5yvDhQZh1MjiIuYjN4Sht1q8S42SVfzbZKowFx4/MLkD3o2YAh?=
 =?us-ascii?Q?DPgCU9IeKmQdL9BWMjPUdGBJ3/lR2WxzPBEWZZqK/sOeYPb0NGIINbdlsNld?=
 =?us-ascii?Q?QllG2SzLELgCmmqOauLoRdPFoCm5eF35KxrurTkGkEEW50KiPM4dhGJUNGeI?=
 =?us-ascii?Q?PbxtD4X1GMVoFl2iJlcKxpZ5tgCP3DpJf6IM7BGLoi7jJuN+ay0Bkts/ag4B?=
 =?us-ascii?Q?AFT2XD+e3ogxVlGsf5I1N7tL8U66Dw+AreQU+tn+MH+MPoSLEzzTP0RQb24D?=
 =?us-ascii?Q?vcDQ+H5gSGgPFdUl6XCWgRCdGnrAC/6RTvfUu9DRFTramvlMisFRauvN9CyN?=
 =?us-ascii?Q?Y5ydGvKAtfHliBR3IEMR0SkMvMIVIjH00oxSUjy+LCW90DZqr6Z0tTPoROf8?=
 =?us-ascii?Q?AvFbb3CEv/PoeHQAS6fxqaAou6kfJNNTAL1ShPhkRHoZ7p09Efq0Snl2P4FR?=
 =?us-ascii?Q?iuhYqE6OW89yyrTkmMFQtN3N5apR8v8TVrWOkW2f1AyPZE9bxymDQjInFNJC?=
 =?us-ascii?Q?UV3hlMFi6U+JVvdCoZcmVxr8HviaT6HXU7SYZYel3+ZmpHXOT4gUb0v9PTdV?=
 =?us-ascii?Q?sLRYgv/cLiUn5xBkx9D24SziSOstXTID7dD06HLVm2xHapv6AzbzhVNtD2mN?=
 =?us-ascii?Q?/ySrFMVt2uECeUR8OsKE5jzzc07ij/RFcTdpFBw4S97l5DM1hYfgvUir/xqB?=
 =?us-ascii?Q?ge7wPWe8YSrdW3KRrYUNieKVwxU4OOw1fEYlRihPSc623pc9XW1vxqtn7i0y?=
 =?us-ascii?Q?CBKboPcIcj0ewSyL+jbVH6wpt6BjzLJLZks/9NZjJczEjMYzvlPDCx884j3n?=
 =?us-ascii?Q?jEksZjsb1LeRiQGHk31N3tcQanC87z5vhbR0O0Wn75XVecwklb/imaspuXn0?=
 =?us-ascii?Q?tAewU0WW53Gaxf1ZrLFqqXMlFdECksQdJVOaKDd92i0AFpc6zAU+wAoOq6PJ?=
 =?us-ascii?Q?Bl5B+F8m/TkwX8tyCZgiUiLKuvQiVb6eZ1bDDsXiplF2POeMoH+gOS6rl2vO?=
 =?us-ascii?Q?1MKC2lq2fMpryx43RjJgivKNhyVDXsG0RjqXH0ZaZBME+0CZm+wKpLakob7P?=
 =?us-ascii?Q?En1xeSvBji4UgbcHn+bjtX66RwSydF5mKsbyR+UwNhg8cCu5JULUznvuGmrD?=
 =?us-ascii?Q?+rnkoAe1bw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d00c96fb-5abf-490b-4b02-08de5cff2f4f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 17:20:21.6019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PGvelygnnbTeDGEu+DU7lfnYzj+7ukunxuHDm6vqZcB22S3cgH61tOiadsZMAuKL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_092029_449320_E10DEB42 
X-CRM114-Status: GOOD (  11.49  )
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

On Mon, Jan 26, 2026 at 12:39:50PM +0000, Will Deacon wrote:
> > +	ret = arm_smmu_alloc_cd_tables(master);
> > +	if (ret)
> > +		return ret;
> 
> Were do you allocate the second level entry for ssid 0 if we're using
> 2-level cd tables?

I don't think we need to. The entire design here has a non-valid CD entry
for SSID 0.

The spec is really weird here, on one hand it explicitly says that with
S1DSS the CD entry is ignored.

On the other hand, you are also required to have a CD table pointer of
at least size one for some reason.

So, I think a CD table pointer to a fully invalid L1 table of at least
size 1 should be OK?

Or stated another way, why would ie be OK to have a 1 level table with
an non-valid CD table entry for SSID0 but not OK to have a 2 level
table that returns non-valid at the first walk?

Jason

