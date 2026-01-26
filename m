Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3E6D1950F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 19:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaJP3VYkmn9Tc5byBes7ATCUG5bAGo7WDZbYur4eBwY=; b=vv6Au+nnuhnIiCsnFEoDpj2KXt
	xyGaKi3i47hSiapNVt28lw0b3Klc+Dx+IAn0/nAzdSrvNEpkYO9rC6MN9fIdXB9q8k1vDTbBgQuSV
	him8IJQspI59MkmLsEzrl1bcBKnhUrAsxKSSYQr6CXoVfAWYWHYMffVUODUp65inFIUWzAPlIzhCr
	ld8ySzA3otOiqOM1ra79xSONBDib2OXDmB9zoneCKrR2es5Pz6zED+PcJjdN+/DBSxMHnutGNHbAl
	omwJPC6cvizFu9yBuNK64iKp4ohrsRAPq5uv8co0EFRkvAneogEIZvwEbi7WyFEG0mDJ/65k+7gPY
	7PEYyyJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRy4-0000000D7iK-0E9D;
	Mon, 26 Jan 2026 19:09:44 +0000
Received: from mail-westcentralusazon11013029.outbound.protection.outlook.com ([40.93.201.29] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRy1-0000000D7hw-3TWH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 19:09:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORTB4mp3a72Agg5o6Y/2rQPGwwfJfxO0f6fdLFy8lnyixdYySbJLIsjB7UiBo/renUWnAyCS++36mAej0YeGj5ExoBuG/x/1Y+fXTiTN/ELmExCUiwtMhyTxR0A70ludpdlQMHlCwYU6B72WXmqdF+ImTErsJACVGo8GqDNF2I0FARNqesnvu1s/xXuubpwNtWIfyOIsmfR5o8yY8HtFI6Eipcs+nNmfVQd0prKMX+DvQ83qhV+PVcNkR4ksB7j37zBG05fboA6DXpHYiDfJZ9ghTmG22xtdXG9JH41EA54Y+7aiVAHtHiErDByOf7BXp1Ggh6MkwkrQWxy4QCcW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaJP3VYkmn9Tc5byBes7ATCUG5bAGo7WDZbYur4eBwY=;
 b=s4Ta9WEhJyZjZnKQm+sSyswajVv3/4D9Pj3OQqsF0AsZllrSOhjW+FeNr7ZOM8UsHr5dGmC4bMbFEx4IsN+xCH1iCz0nJDJZg9OHnD/ObGrCNS54mn7jfId5hM6I6wjog+78ghqo5EjAuHveVyblS7QrgDl+nlGC36necF6qwTk1vAWBh+JM8WPavercnOt3IcmR4gwqF9oRLWjv7PzcLn08L1JqIsiPZoOZkRUbqH0DyScA8HvcJSMx7glRAvuWu8qNEachYCuYyGJjl3tx+4eUw15gY+PmiQnXPP1TGw6cBfl49yzy/8yMX+UB3KvynRpO/KGnJ8n7Vikt3vXalQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaJP3VYkmn9Tc5byBes7ATCUG5bAGo7WDZbYur4eBwY=;
 b=g+chIT8zmKEBKfTBZ6BLaTl6qGfdc8J+77tDBWpeVkoSPAKsuPO5F9LgS3H2xxk45jtCXwGvVAv8FtOrmx3ckJeErGgS8Ajoua+UshFssQa6eR4CMCFBSxB7eQe4VHTtuhfpcUBqBlFIB3ISA9p29KjDHLQMsyBx0TcbOFONqhJ+JPSEcwx7RQLWDBjpQKbu5wmSopqgwdJWZHKa4BjPMtAhaUfSNDj903NtEdMANQlGLuKUKQKteAYQpeyD5RDSUz+4CaPTYAK+cgRMhcdsJkwqoQ4HhsHE4mS41u3rMUbaTUQXXRiTltDuWTVZeLf7/ttPxcLep3ILDvH+x8P2Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV8PR12MB9620.namprd12.prod.outlook.com (2603:10b6:408:2a1::19)
 by DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 19:09:36 +0000
Received: from LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c]) by LV8PR12MB9620.namprd12.prod.outlook.com
 ([fe80::1b59:c8a2:4c00:8a2c%3]) with mapi id 15.20.9542.015; Mon, 26 Jan 2026
 19:09:36 +0000
Date: Mon, 26 Jan 2026 15:09:35 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Will Deacon <will@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>,
	bhelgaas@google.com, joro@8bytes.org, praan@google.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH RFCv1 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Message-ID: <20260126190935.GV1134360@nvidia.com>
References: <cover.1768624180.git.nicolinc@nvidia.com>
 <09cb6be1f8f7472a2f1ccab72154cc6e22cf570b.1768624181.git.nicolinc@nvidia.com>
 <aXdgljWHHPVMTmya@willie-the-truck>
 <20260126172020.GP1134360@nvidia.com>
 <0a60797a-fbb9-4a83-adc6-ad62baf5915b@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a60797a-fbb9-4a83-adc6-ad62baf5915b@arm.com>
X-ClientProxiedBy: BL0PR02CA0083.namprd02.prod.outlook.com
 (2603:10b6:208:51::24) To LV8PR12MB9620.namprd12.prod.outlook.com
 (2603:10b6:408:2a1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR12MB9620:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: c7abe658-0c81-474e-87e9-08de5d0e7224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ymXolgS79OD4Ku0AV+2f9/3h8RbbPPqmP5vOSCnYWNf4TxMAf9mS+u3DmCx7?=
 =?us-ascii?Q?ICgyVVFIl7Eb9lJk/V/tCRX2prBLJmvccUngaczj2bVs2ZlYYkPHzisrBbwm?=
 =?us-ascii?Q?1olHi6qTMnDmJSGi7dKkOKt0mYbbaRSMYwUEzeDHw0u7w5x6XJ8f8qa0cT2W?=
 =?us-ascii?Q?kJo0B6yGVkfYdlhIAyp+wXydZ98C4WCiNvSlSzzjJwvri8KV3GtB1xPq7+Iw?=
 =?us-ascii?Q?liLbvnxfdzX5TOfhQn3jX1uw7oupDTbeC1WWeEsr4OJ4nmBPLHQfMSYvdYb+?=
 =?us-ascii?Q?NDmJ2bgw9GnWiXanCY/Q+pElVXJG9zNPkeRCXwuMgeBO9wU8QaLJKFXGSNlB?=
 =?us-ascii?Q?nt02U0fzCmqP+FZm2tpu3PDIQWw4rcgdV2vYvLYlzJePzGPOn3PTL1685+rM?=
 =?us-ascii?Q?orokOfj/cOZspeLUn+RdEtEapEuZOhOc6rCQPMIxR1N5dQVDaAztBfjFw1vh?=
 =?us-ascii?Q?DukTFhlxuJlr6Rl+QLYplq8VlFwGhHxMOeOhmUMrwaeffLTWhIwi1585XQaT?=
 =?us-ascii?Q?i8UcFFwCgJri0VnV3lCG/2ESVAOyCtWZJ7Myg0Y40Exg6UjujLZTsKq9SxlY?=
 =?us-ascii?Q?VFeculLxKgrR1gFWM9DlQe6AZWQtYnZ1I0pHJrhPRzEHqRPvwhzQyMXV05jr?=
 =?us-ascii?Q?/dGhkPQLq81VJBV8GWpgSAt7T5Wc7udQ1pWR9Qdkm52brtWKLtX2b1VeRLEx?=
 =?us-ascii?Q?gbgyxtIoFA7fPpEQxo02+Ehc5BpgDgk6cemQ2ry3YYUSPZoWT84ne3Z0YVT6?=
 =?us-ascii?Q?rOm47LMB7E2y/m0jWN7AQtyJS68xLapwMRfVgGz/Biy8WqJ0YHNbyyUTeByf?=
 =?us-ascii?Q?axuwYc6frCh58F0u+xPBOIfezUPiMqn6kKUFXW+WHlDfCnRbbiwH7dBWNLut?=
 =?us-ascii?Q?DhZO4EOlu/DfhQinlXs9GWFFqoI8HNAVwQZ4Knl9c/JPyKpkvx2hpsBcdzl4?=
 =?us-ascii?Q?JMT3egfs8BxSM4wzv2Fwhkfo08m2a1i3FhH3fgqfR8T/CwIrwmE8Z7Y/1FzP?=
 =?us-ascii?Q?XdBQDDo+SS+bHG4Uqyw0KkABGnJq7klEzNRwEKDw2+TyefljH384gHtQAezo?=
 =?us-ascii?Q?WRpf6tlSa5KZQWorciPSgwRsjjhuwfbK5J3NcWcYncsQ8VRfBVtTcaAmACiH?=
 =?us-ascii?Q?ae9+8CwjIi8e+uKUbdJpykL0xp4IG20zwTPNprYbBR/cWExx6EDjAM6s0St0?=
 =?us-ascii?Q?Xnn4jT076FTr8zFu8bXMcqQ8F8oktst4RDwnJdImTT2jHfu51q3FldIsaE+I?=
 =?us-ascii?Q?Gui3bTU6uu3Bt/urL94GVm+tnLab1fJzPZuTnTGoclgVxtRbYLtPOU+yJG05?=
 =?us-ascii?Q?EOeYBy15NQbG/oE6/9VknMLEglTFVwCs0LhWxQIE6pd1kKhmaWSDiIFoRr9r?=
 =?us-ascii?Q?75/rtYSfwF14R2pF6IZyeOezKnHADVUWuR3jfmapCs5POEtRa1IgvdeV9+3/?=
 =?us-ascii?Q?J9LpMP8bNcB+j3YQ0Om/fOrHhvE/JMW5Ac3l9d6SrhD47oHZjkXTlmFfPzYR?=
 =?us-ascii?Q?g5yWYCNwgpqtIIOyunn9UknRFk5AoIs7R/FoEMQStltt6tIzWMkbYlx5UV5W?=
 =?us-ascii?Q?0rIGlzzoAWyL/GC4CqE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR12MB9620.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vdCcxlnEzimpGiLHuHbg4GxUARFf+xYKkDXY8ATUdr323cCAF3QOZc+OLJAw?=
 =?us-ascii?Q?Ca9TPMwKm/LpCg1rhQZeMGP3Mr5rSWwXAjKOpEExwuzCLcgVVHcr6WpVHJR/?=
 =?us-ascii?Q?HBBlDdktqBvBlkB8uBXJpVPwBbnOMwh6B3YUB9DwyTk0/+507pAbdZJGxz0p?=
 =?us-ascii?Q?jCvxjF4BjAbT8LHS9kBRbLCwYJW+MlgLiY8jgCa2MrkAP+p0X2mFsah/TgCR?=
 =?us-ascii?Q?E62aVcUAKTcGjb8mhNfdb6q1CNoCVo3rX16j1J5ioAXaj2XKSTox6QTxoJd6?=
 =?us-ascii?Q?UmhSF9kNzMLgWPjY8ri/AEhBN718v8sbAd4AAtf+uoDvHKuxtsOflKJk+pca?=
 =?us-ascii?Q?95wlQQ8M4RfnT/62OOeVtc6nh2d4Mlexr2kB7sfZpEOSYtIB9Zm6Ec991+IB?=
 =?us-ascii?Q?AIQzCGPyU8sVuUJ1F5wrVyLuJAklFlTXOu1YDxdu3UK7b43TXja8Cxq7rKL5?=
 =?us-ascii?Q?DBtNqW+OhtkT/WJbYtyGnNc6NXWU5Sb6jRuLp6+3dDcPB+uXTmZjCehlWUo3?=
 =?us-ascii?Q?O6oJOl/DDMtwP1xL64McDP200zJ7rYObFv31eRM1CCLrvcdkPwLYLwm7ZOW6?=
 =?us-ascii?Q?3i8Ka5EKwb2zXP25ZV5tlyEAeDo+LSjGqcIWL/Q4BhdK7f1oo5SgXQi7i5ER?=
 =?us-ascii?Q?JnZY1eYrROaEONZ7KaOceE4kttM57KUBh4jP78JQ+SZTjoUIa391ZMlJlonA?=
 =?us-ascii?Q?phqZQrkYDHRaLwlwn8s0obo94IaBWrEgzzKyZrbNGP5/zcvJROJZ2+hxQEcO?=
 =?us-ascii?Q?4DEoAjtGBuW1TP/kK/LVggJWHXvT5Kuw9QNXuS4p88aURiu/aiqr3Mhv9TRc?=
 =?us-ascii?Q?aYjT3mJdiT6F3N9wh/ull5m11EpktVJrmhGC3gzoPPMdh80Iuz1gkjOYaeOV?=
 =?us-ascii?Q?5/e5UNeADIWRDc86ubjefDB7EzE2KUoCela4h4VLKza58Vtl0FWLdDlge8rn?=
 =?us-ascii?Q?9cnvnIR26fmQ3XVnk5rWHtqWfvbBikblPP0oP8tERenRna9NZmeNv9KIB1lX?=
 =?us-ascii?Q?zSVGz8N23UjcjJY7VZAO90tBW2/3NF/BVd+MngtohnfxQ9pbUVMu1Z6R8QQS?=
 =?us-ascii?Q?+0avBR9S9TdJ1AWodHo/pzdKYGvkAircPKJY/kBzgKX5jL+47X7/FctmTYEX?=
 =?us-ascii?Q?BeVCF/WZiPKh7WyLIBUC5QiY9eWf1VBw2+wrMaCqTfIbUfzMq2Zb5VNqLmVh?=
 =?us-ascii?Q?UKGznrF8lCKbP8LOXgeB9aEQg07WeP5fpCS7RuQgqapdGRqCjp24/ImABaEM?=
 =?us-ascii?Q?0f7aSUkVBwx1AqpYGhuuLoevuQniVvSt0M+2SyaDlZpXmgGZyVHEs5ewhSjx?=
 =?us-ascii?Q?zr8dH7OcpgtXqOewVg1yP23OT9b9uUKd9OkMWByJ/6/iK3qysXSQWouM4KON?=
 =?us-ascii?Q?Gpulsex4V9KUIQg/2rgMO8f9uoNlsaN+kiLpgxwPZqOSfM/VF2x1YNw+cCki?=
 =?us-ascii?Q?VYnHLFkyOaHnfKHNn3U8Uo3fCYYH+IxMjgLDT4pSSSNFia6AcCH27iSEor+p?=
 =?us-ascii?Q?lCTShmWaltfbEd8nAxA7DqhsIHs6klWf+ZbtrW/475DKvx9rxNpWvF3s249D?=
 =?us-ascii?Q?zGJRGbJNBmKF08eHDGYFor5GF+crD4iPrmgm6I30fRQGsQ1r55F8hVcqNOMB?=
 =?us-ascii?Q?Afhs8V6UwhaLLUtDqANdcKwhfhs/b0+6wnO+kTr9lB0C5ly2+EowjmgKpc6o?=
 =?us-ascii?Q?/iyLk6Tpair4FcBPgC87/ntkRHrxfWmC3XKoiBmv/FgsUPIHSe0ZRmGxym+Z?=
 =?us-ascii?Q?PXM8u8ds/g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7abe658-0c81-474e-87e9-08de5d0e7224
X-MS-Exchange-CrossTenant-AuthSource: LV8PR12MB9620.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 19:09:36.0842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjlj5dZMXLz2tjxipgMwfSkVwI34Fp1fDImVir6dC7xlex6D1d2soTMnjnINnzO4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_110941_897474_4C358D1C 
X-CRM114-Status: GOOD (  20.05  )
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

On Mon, Jan 26, 2026 at 06:49:07PM +0000, Robin Murphy wrote:
> (assuming SSIDSIZE > 0 and it does anything at all - note that strictly we
> cannot assume this bypass trick is *always* possible, since an SMMU is
> permitted to support ATS without supporting SubStreams).

Yes, I think Nicolin has captured those conditions in computing
it... We don't have a logic to disable bypass in that case though.

> > So, I think a CD table pointer to a fully invalid L1 table of at least
> > size 1 should be OK?
> > 
> > Or stated another way, why would ie be OK to have a 1 level table with
> > an non-valid CD table entry for SSID0 but not OK to have a 2 level
> > table that returns non-valid at the first walk?
> 
> S1ContextPtr itself is reachable since S1 is enabled, so it cannot point to
> nonsense. But the S1DSS==Bypass behaviour does state:

> "Note: Such a transaction does not fetch a CD, and therefore does not report
> F_CD_FETCH, C_BAD_CD or a stage 2 Translation-related fault with CLASS ==
> CD."

Yes

However, taken together:
 * S1CDMax is set to substream 0 only
 * S1DSS is set such that "does not fetch a CD" for SSID = 0
 * SSID >0 doesn't fetch CDs because of S1CDMax

Then it seems to be saying that it will never use S1ContextPtr? ie it
is IGNORED?

> So if we're not intending to actually allow traffic on the SubStream(s),
> then it should be fine to use either a 1-level table of invalid CDs, or a
> 2-level format with an empty L1CD table to gracefully terminate any config
> prefetches.

Yes, so arm_smmu_alloc_cd_tables() is fine since it creates a valid
value for S1ContextPtr such that any future use can happen without
changing S1ContextPtr.

Jason

