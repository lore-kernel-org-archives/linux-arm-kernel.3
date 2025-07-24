Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520B6C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 19:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VA4GfeyegDuFFcMP1ryb/lQ3pabDbR5khwWz5rpG1hA=; b=KetlJaGT9fnqRQYm2CEYI6AiSO
	IpKaGafcEKnZiz8waG/XA3EhU8yMOzMHkNmsRPPd0nU7/gCbIdkdh6nlED6b12bi011asZh1ffgPi
	we/OXt7lU9xULUHUksPKBiS0UbD/ixZzQIHJTvkpAXS72IbI53h8+HG1NXwnJZrhTFLPYCvnOTsTA
	8b4aZ3L7j3YRDTsABcQ4rp8oXBTijU2ZlXqhsHVMSWlq4GqC54lSLjbWwm+N12aYcx383q3VK96Z1
	P0P/KQLx4vxhVWiMj4ioquXbA/32G3bxds12CN9C0NbKpGGWFuL8mor/iNa4XPXZFgW3icy0NQfSV
	XWAIHFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf25H-00000008LuZ-3aSA;
	Thu, 24 Jul 2025 19:58:31 +0000
Received: from mail-dm3nam02on2060d.outbound.protection.outlook.com ([2a01:111:f403:2405::60d] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf22g-00000008Lks-3qvs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 19:55:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NpkC3iJe827z7ceTEh7IT6N/AMGFRYeoCVSwcnlY2HUjOlsjagfXcysFikizsqYaSznA9Co/RBZNwAdowVx+kCoPO/qAQTzvyWUtEr8nogL9rvuRhNcF1klYnE33CwXkCmkRKowS7HOv6eENAgne8O9ViUWJLE+6wTY6Pqq+0zsT8DEgEp1Mj8miEUJnhEJRyCA3vOwRy71YyzhvHn+cNLquGIU31X9wjB5Z9TMOqkFJJbV1HCOpu66LUHfG1W4TGrOEmNCEuES3pgXfeGJ1vwGoSHsQm96K+Fo9NfF8VmnDSsO1iPptGfKDi+KnoGjv9+i4m18H+3dutef7l0lEfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VA4GfeyegDuFFcMP1ryb/lQ3pabDbR5khwWz5rpG1hA=;
 b=LzLNjF3kJ793jGNdZ64fnxheLEbEbx2CQy4VdKXKXRaDWpp0MfKD0pQ//ibDu7ANmK2xB+6ZLxz5GGR6lmVHTLXiqfqXWVYkp9h1p2ZDykVHLtW8W2WJT35AaoDmKfM4MkLOukdPGLadK8NDyjgjNnxvGFJx4Mm0IyeaAc6TAFQ8Od9QX2XoCFyNZ2YKyDm+sFi9wLueDVTLoZ4dkx9lrGO0YAe+Z5ROiGIZVpv4RUg7Nf52uD8fqa/7FWP0VWBNWFbAgyfOAAoai9367Z5nuNCh1U6Zlz9rXbqZLgKvRTyCQKMJoZioHCx6zPIdyF0hRbNkBwd14HLnCS7opS2xQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VA4GfeyegDuFFcMP1ryb/lQ3pabDbR5khwWz5rpG1hA=;
 b=n3YfzABEdwgxEDjqIG591UIkYbF94ert/GVgD7mguWf4HJcs5aupWU/k45r0rEr3gi+fW6FwUNrBs5Dhi5Jdz7PHFc7E23eJggxohmLxyJMGsii+gnSO5VfPqP54SJTJHyHfYFVTdd0ZuL68FsUkz0rfLAcGb1Y0Ty15ahvKlLkXKLRhQQt9dKsyj9cwkmhcJYHD75D6CiLSvrtlTIzHYRYjkeeD3fti/YnX65Mkr3Uyi3gu5Efyl416xfdv3qbaqpbaVnz5+TYGs6fEwbbuHMWrDhgW6CwE2mpvvK1WiRrl1m1vOmeTs/ehjxrdls1r+UIVa7bCT4tFvvSxvvTxbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SN7PR12MB8102.namprd12.prod.outlook.com (2603:10b6:806:359::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 19:55:41 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%6]) with mapi id 15.20.8922.037; Thu, 24 Jul 2025
 19:55:41 +0000
From: Zi Yan <ziy@nvidia.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 lorenzo.stoakes@oracle.com, vbabka@suse.cz, jannh@google.com,
 anshuman.khandual@arm.com, peterx@redhat.com, joey.gouly@arm.com,
 ioworker0@gmail.com, baohua@kernel.org, kevin.brodsky@arm.com,
 quic_zhenhuah@quicinc.com, christophe.leroy@csgroup.eu,
 yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
 hughd@google.com, yang@os.amperecomputing.com
Subject: Re: [PATCH v5 6/7] mm: Optimize mprotect() by PTE batching
Date: Thu, 24 Jul 2025 15:55:37 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <AE5CBFC7-5701-407D-BA22-C7B8733AA244@nvidia.com>
In-Reply-To: <20250718090244.21092-7-dev.jain@arm.com>
References: <20250718090244.21092-1-dev.jain@arm.com>
 <20250718090244.21092-7-dev.jain@arm.com>
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL0PR0102CA0043.prod.exchangelabs.com
 (2603:10b6:208:25::20) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SN7PR12MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: 26bf0352-ac14-4fe5-6558-08ddcaec11ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/SwiPQ0Rd6jLQUC3rk3Fx+IA0KgVUS7LvFiO4UTG3ZG1gQ2FgBBm2U1GW/bT?=
 =?us-ascii?Q?nMYd8ALR8X4HYC9UDL91nYvqylbB05WEXS/yAWnaPG4cHIo32Ba7W4o/RAeM?=
 =?us-ascii?Q?Ekjwjogv6KyCjgTmyD1l39MwBjm5iT+iN6bl+ZZ61D26HHrq3pIzhxYu7Djn?=
 =?us-ascii?Q?/UnJKFPuRn0TPG/aMP2RSINd7YpjUkBdnUmTvDJzgBwFyG9ONSFkya74pZdB?=
 =?us-ascii?Q?2rcPX7p3gGmHTa+FxUQ/TubDVmAW8j+tw1N4yYhXVAklyq6LnpMX4NYeNzHj?=
 =?us-ascii?Q?iKU1YS9EJcgjellM62zFPFgG8y7QCdJ7i/BbKtl4TcOKDp0tTrhRFcXepRA6?=
 =?us-ascii?Q?4CvPVf6X22O0//whJhnfYj/yMU9FZ2Sj9FPJmJxIKRgw82NEO8lSZ2Kd6kgq?=
 =?us-ascii?Q?1V7xnNdF3ktMPwUe6E/MpyrzM/w3auVe7SSKZCygaUHgsK7QWKfXzGX8xm1a?=
 =?us-ascii?Q?XvcQUNlGt73i1Ggo4yEAhY9mdiMusu0sb4klAFR4XzV14g+v03RQaIQHWGR5?=
 =?us-ascii?Q?+afd3VTtXMjsge2ZXLqaTkjOmqVIA+/NPaun175Bdw5tWex0L+JxWp79mQo0?=
 =?us-ascii?Q?sZVD7lpAaUwzjGqxlKAFDzRdrYUW7Jqlzy7z/1yEIcQTqsoxayttJxAk5D7J?=
 =?us-ascii?Q?7VgzKQ//XSIfsqnipJzKK6vZU4b/vqNa6bXBYf+Bl+cURL30fAbDl+ErwU5B?=
 =?us-ascii?Q?LKhFDDgjpl/Lla7jlCa+SzdCXwBFO+c9E6OqBQNdWbZ3BslJIs7kXOMz+K8V?=
 =?us-ascii?Q?K+UuDKTeC7BdSlSCzLISCGOEnOBX1ttECOCPDn2yR2q39+M8KEJ1lXUolXSV?=
 =?us-ascii?Q?4yIvPhoJURSeGE39EytvO/uyv+AJ8+XcziRNfgRDfr3cpoGiqyFZBOOU2iY8?=
 =?us-ascii?Q?xS8ha0fWjzdpyHYFiJzomVO23VOI8Bkrn2YmKWLYfpUlgBcjQGKUhaemJxrk?=
 =?us-ascii?Q?vXMFPJoxUf6qz0M9JsHZnumYi0NirQEiMcXLAbFSvsN89c7fw2BDQ83TAWrM?=
 =?us-ascii?Q?8nd4co9k6Z05I5oJNRk8cE986uUyqIIfaOeSU2qbEy/7d/Q31Xsf0PuQwZ6y?=
 =?us-ascii?Q?rShvX4Wc+Md+2QAdBtec6dFTm6nTjGeKd8/Jr3Xez5a7nGpIjLX5uLr5338v?=
 =?us-ascii?Q?gHWqZuC8L6X6V0UOca2vcRWbfG5tIt3K7975PST0iVqQ6wMRgsjLBPFCLrYP?=
 =?us-ascii?Q?ORzUHI9rbXeZ/Lq6VEVfnOIsQCbf8uuqpM7RgG8fXGS32e5VpnQ0BHXpQtN2?=
 =?us-ascii?Q?Yy7+/mlwze9rCdtdambxYA1CuV/tar2Vbsk4l3Uscy4CRj+uTookPvjM3APC?=
 =?us-ascii?Q?mu4By3X6PAL6Wr0DJckyVM4y9zd0Ki8ovED2Tvul294eswGPI5S9nKc5jjNn?=
 =?us-ascii?Q?rr23yF/gxys9iSX2zxw0po51opZE5NQ1MRGM2FzJ8tiVXauhIzZfmx65M8C0?=
 =?us-ascii?Q?FwGKfNrSF3s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mHM4PW2epiMIedDBL0yQqBnzgFTUQaOvErOPP3wJwNRzdfXjEn+/tnflOiVU?=
 =?us-ascii?Q?+Zxb+wrsTfwoetIFL3mrWqTO1tnhJT3hREZ9MMNCAwp2Vknn4QCy+PUf+jP+?=
 =?us-ascii?Q?S9kRVV2VEkHsRgtqnFKxyVaD9+SHoo8Y6qxb2L4dFIE/57yghDoop8S6FHog?=
 =?us-ascii?Q?VqBn+n3OnVJbeWKYUzAYkUeqne5sQHQOBnfAJLXtvPTLn+64Lbkuyh5tlNHs?=
 =?us-ascii?Q?cybf9xnkQFNfKA+oFShI5Ugodz8k28yU8wcVLM3QjqN3tKL48eM/s0Zp2+Ih?=
 =?us-ascii?Q?DL2Ni+17NIgk0kI0jtBHuhar5sZb7PcZHHaGkhw4PbhWAGP4DdhSPzKsF6gG?=
 =?us-ascii?Q?XSVyHZS4FFKh9LDEshwfWKddOANnWCDtTVl7ja2eGsVkZZQzQ0lyutFkWwdY?=
 =?us-ascii?Q?KEAdLLChcB31HCIG1V/VK8AmXzc929ztgH+C1G6g45ytU5PVllk6p6NPZ1dJ?=
 =?us-ascii?Q?hGdl9ffQQAiBkSJkGnObX2EDGi4ASfVGOfGTWnVg9fHmMwVVtbJjEA/n6QvU?=
 =?us-ascii?Q?9NekE/lDwrTiQpQgPgSxqwnFkYhkJEW7UJXNDVF/4wt0f55fiNOVbSoYUq+Y?=
 =?us-ascii?Q?NMCQKMDLzpOIWJsthZnhnz8ANrLy+nIvlhgD5UARH1Opm9eVSVXiwMtEcIec?=
 =?us-ascii?Q?pIqhn9Fp+CnZDERA7AlGXQVnszVqMqQChZnShALElxSsNUvjAGztL+Ogz+s2?=
 =?us-ascii?Q?cNfVVITqeD1Wp+7g2UnV1AAliS3nKheNoPvkgiDYeNzWPZzWJsGwM0cu+N0Q?=
 =?us-ascii?Q?vntMSsYR527N8PO8MIEW0WUUNW7ruTby8bPHsVWNUWjc2XMrFs9ieH5cQiH7?=
 =?us-ascii?Q?aqpiiOTzrx89cKWIsnLQgk2Xndd7J4imUHEW0ANNF6phWUDHWw+piG97PIh4?=
 =?us-ascii?Q?yqaGnm2vFtJcPSIGZwcjb/XTLAfFNf/e3KaiKFWzLhJTxnWPy2uWqCdFHYqX?=
 =?us-ascii?Q?SRrmYgBZckxjZmofSJVtpJ9qWywfpP3Xa8N8f7NOYL7VyS6SrRqsmpBn4NgX?=
 =?us-ascii?Q?Tn2ZHtLUCTNT7NaQMkeAsICmN6jtRzwxoX4Kkvg8uQh6VG8CzRAI8RYe/1MU?=
 =?us-ascii?Q?8ZFmTl/52SqA8cwj4qUg5e6ENMqWCsVYhp2a4ppd8IqpN/p0E/WP3vhijysb?=
 =?us-ascii?Q?fdGM1iCGvq5MPbKxRuXczjB3/0DHo1SvgsNdua3JRLjaz4pSGl4pVk0gkVYz?=
 =?us-ascii?Q?Mfo1fmGC/h1q4Kq1LEmfxNogZ2sQVzJG8M5J8+PnWb8olif/ncPR86StIsD6?=
 =?us-ascii?Q?Ca9aKdMuhvPwJpA8Iu2GPt10YER3cUdfFbXBDSbab4WKhdSqTybQW0JecyJY?=
 =?us-ascii?Q?MdbNSsHlS7CLNoV++yfQbjFTpx5Yzw0TtzPKcKl+CXrFpiqQx51WOTE1gFcD?=
 =?us-ascii?Q?X1sb+nZOUCOBkv4vrQKUoiKRHKsg+LnmxMviISciS00hf9D1y69rKNbrkKhd?=
 =?us-ascii?Q?hnfESfz8Q3Io0kltk68G2J8Cij3ffIvK7XvoGCpJ9yCN1DaCLbxk2vuwOG82?=
 =?us-ascii?Q?8T7rZgw50F4JR3eQTgCcdro9/29FBIxCkdhaCaeHP+dBQHu5TsiMY+UCf+Fy?=
 =?us-ascii?Q?8taSOWA3Dxx1L7m+mmU1fOm+XgsGs8jwfw8YPbBt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26bf0352-ac14-4fe5-6558-08ddcaec11ba
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 19:55:41.6581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3cu3jv8vt4kWoHk/fx18xC1VcJZmOviDSaDsN2X5L3RcXvmV8gdFrlMm7Qq/Vg4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_125551_013527_C4572E90 
X-CRM114-Status: GOOD (  43.58  )
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

On 18 Jul 2025, at 5:02, Dev Jain wrote:

> Use folio_pte_batch to batch process a large folio. Note that, PTE
> batching here will save a few function calls, and this strategy in cert=
ain
> cases (not this one) batches atomic operations in general, so we have
> a performance win for all arches. This patch paves the way for patch 7
> which will help us elide the TLBI per contig block on arm64.
>
> The correctness of this patch lies on the correctness of setting the
> new ptes based upon information only from the first pte of the batch
> (which may also have accumulated a/d bits via modify_prot_start_ptes())=
=2E
>
> Observe that the flag combination we pass to mprotect_folio_pte_batch()=

> guarantees that the batch is uniform w.r.t the soft-dirty bit and the
> writable bit. Therefore, the only bits which may differ are the a/d bit=
s.
> So we only need to worry about code which is concerned about the a/d bi=
ts
> of the PTEs.
>
> Setting extra a/d bits on the new ptes where previously they were not s=
et,
> is fine - setting access bit when it was not set is not an incorrectnes=
s
> problem but will only possibly delay the reclaim of the page mapped by
> the pte (which is in fact intended because the kernel just operated on =
this
> region via mprotect()!). Setting dirty bit when it was not set is again=

> not an incorrectness problem but will only possibly force an unnecessar=
y
> writeback.
>
> So now we need to reason whether something can go wrong via
> can_change_pte_writable(). The pte_protnone, pte_needs_soft_dirty_wp,
> and userfaultfd_pte_wp cases are solved due to uniformity in the
> corresponding bits guaranteed by the flag combination. The ptes all
> belong to the same VMA (since callers guarantee that [start, end) will
> lie within the VMA) therefore the conditional based on the VMA is also
> safe to batch around.
>
> Since the dirty bit on the PTE really is just an indication that the fo=
lio
> got written to - even if the PTE is not actually dirty but one of the P=
TEs
> in the batch is, the wp-fault optimization can be made. Therefore, it i=
s
> safe to batch around pte_dirty() in can_change_shared_pte_writable()
> (in fact this is better since without batching, it may happen that
> some ptes aren't changed to writable just because they are not dirty,
> even though the other ptes mapping the same large folio are dirty).
>
> To batch around the PageAnonExclusive case, we must check the correspon=
ding
> condition for every single page. Therefore, from the large folio batch,=

> we process sub batches of ptes mapping pages with the same
> PageAnonExclusive condition, and process that sub batch, then determine=

> and process the next sub batch, and so on. Note that this does not caus=
e
> any extra overhead; if suppose the size of the folio batch is 512, then=

> the sub batch processing in total will take 512 iterations, which is th=
e
> same as what we would have done before.
>
> For pte_needs_flush():
>
> ppc does not care about the a/d bits.
>
> For x86, PAGE_SAVED_DIRTY is ignored. We will flush only when a/d bits
> get cleared; since we can only have extra a/d bits due to batching,
> we will only have an extra flush, not a case where we elide a flush due=

> to batching when we shouldn't have.
>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  mm/mprotect.c | 125 +++++++++++++++++++++++++++++++++++++++++++++-----=

>  1 file changed, 113 insertions(+), 12 deletions(-)
>
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index a1c7d8a4648d..2ddd37b2f462 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -106,7 +106,7 @@ bool can_change_pte_writable(struct vm_area_struct =
*vma, unsigned long addr,
>  }
>
>  static int mprotect_folio_pte_batch(struct folio *folio, pte_t *ptep,
> -				    pte_t pte, int max_nr_ptes)
> +				    pte_t pte, int max_nr_ptes, fpb_t flags)
>  {
>  	/* No underlying folio, so cannot batch */
>  	if (!folio)
> @@ -115,7 +115,7 @@ static int mprotect_folio_pte_batch(struct folio *f=
olio, pte_t *ptep,
>  	if (!folio_test_large(folio))
>  		return 1;
>
> -	return folio_pte_batch(folio, ptep, pte, max_nr_ptes);
> +	return folio_pte_batch_flags(folio, NULL, ptep, &pte, max_nr_ptes, fl=
ags);
>  }
>
>  static bool prot_numa_skip(struct vm_area_struct *vma, unsigned long a=
ddr,
> @@ -177,6 +177,102 @@ static bool prot_numa_skip(struct vm_area_struct =
*vma, unsigned long addr,
>  	return ret;
>  }
>
> +/* Set nr_ptes number of ptes, starting from idx */
> +static void prot_commit_flush_ptes(struct vm_area_struct *vma, unsigne=
d long addr,
> +		pte_t *ptep, pte_t oldpte, pte_t ptent, int nr_ptes,
> +		int idx, bool set_write, struct mmu_gather *tlb)
> +{
> +	/*
> +	 * Advance the position in the batch by idx; note that if idx > 0,
> +	 * then the nr_ptes passed here is <=3D batch size - idx.
> +	 */
> +	addr +=3D idx * PAGE_SIZE;
> +	ptep +=3D idx;
> +	oldpte =3D pte_advance_pfn(oldpte, idx);
> +	ptent =3D pte_advance_pfn(ptent, idx);
> +
> +	if (set_write)
> +		ptent =3D pte_mkwrite(ptent, vma);
> +
> +	modify_prot_commit_ptes(vma, addr, ptep, oldpte, ptent, nr_ptes);
> +	if (pte_needs_flush(oldpte, ptent))
> +		tlb_flush_pte_range(tlb, addr, nr_ptes * PAGE_SIZE);
> +}
> +
> +/*
> + * Get max length of consecutive ptes pointing to PageAnonExclusive() =
pages or
> + * !PageAnonExclusive() pages, starting from start_idx. Caller must en=
force
> + * that the ptes point to consecutive pages of the same anon large fol=
io.
> + */
> +static int page_anon_exclusive_sub_batch(int start_idx, int max_len,
> +		struct page *first_page, bool expected_anon_exclusive)
> +{
> +	int idx;
> +
> +	for (idx =3D start_idx + 1; idx < start_idx + max_len; ++idx) {
> +		if (expected_anon_exclusive !=3D PageAnonExclusive(first_page + idx)=
)
> +			break;
> +	}
> +	return idx - start_idx;
> +}
> +
> +/*
> + * This function is a result of trying our very best to retain the
> + * "avoid the write-fault handler" optimization. In can_change_pte_wri=
table(),
> + * if the vma is a private vma, and we cannot determine whether to cha=
nge
> + * the pte to writable just from the vma and the pte, we then need to =
look
> + * at the actual page pointed to by the pte. Unfortunately, if we have=
 a
> + * batch of ptes pointing to consecutive pages of the same anon large =
folio,
> + * the anon-exclusivity (or the negation) of the first page does not g=
uarantee
> + * the anon-exclusivity (or the negation) of the other pages correspon=
ding to
> + * the pte batch; hence in this case it is incorrect to decide to chan=
ge or
> + * not change the ptes to writable just by using information from the =
first
> + * pte of the batch. Therefore, we must individually check all pages a=
nd
> + * retrieve sub-batches.
> + */
> +static void commit_anon_folio_batch(struct vm_area_struct *vma,
> +		struct folio *folio, unsigned long addr, pte_t *ptep,
> +		pte_t oldpte, pte_t ptent, int nr_ptes, struct mmu_gather *tlb)
> +{
> +	struct page *first_page =3D folio_page(folio, 0);
> +	bool expected_anon_exclusive;
> +	int sub_batch_idx =3D 0;
> +	int len;
> +
> +	while (nr_ptes) {
> +		expected_anon_exclusive =3D PageAnonExclusive(first_page + sub_batch=
_idx);
> +		len =3D page_anon_exclusive_sub_batch(sub_batch_idx, nr_ptes,
> +					first_page, expected_anon_exclusive);
> +		prot_commit_flush_ptes(vma, addr, ptep, oldpte, ptent, len,
> +				       sub_batch_idx, expected_anon_exclusive, tlb);
> +		sub_batch_idx +=3D len;
> +		nr_ptes -=3D len;
> +	}
> +}
> +
> +static void set_write_prot_commit_flush_ptes(struct vm_area_struct *vm=
a,
> +		struct folio *folio, unsigned long addr, pte_t *ptep,
> +		pte_t oldpte, pte_t ptent, int nr_ptes, struct mmu_gather *tlb)
> +{
> +	bool set_write;
> +
> +	if (vma->vm_flags & VM_SHARED) {
> +		set_write =3D can_change_shared_pte_writable(vma, ptent);
> +		prot_commit_flush_ptes(vma, addr, ptep, oldpte, ptent, nr_ptes,
> +				       /* idx =3D */ 0, set_write, tlb);
> +		return;
> +	}
> +
> +	set_write =3D maybe_change_pte_writable(vma, ptent) &&
> +		    (folio && folio_test_anon(folio));
> +	if (!set_write) {
> +		prot_commit_flush_ptes(vma, addr, ptep, oldpte, ptent, nr_ptes,
> +				       /* idx =3D */ 0, set_write, tlb);
> +		return;
> +	}
> +	commit_anon_folio_batch(vma, folio, addr, ptep, oldpte, ptent, nr_pte=
s, tlb);
> +}
> +
>  static long change_pte_range(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, pmd_t *pmd, unsigned long addr,
>  		unsigned long end, pgprot_t newprot, unsigned long cp_flags)
> @@ -206,8 +302,9 @@ static long change_pte_range(struct mmu_gather *tlb=
,
>  		nr_ptes =3D 1;
>  		oldpte =3D ptep_get(pte);
>  		if (pte_present(oldpte)) {
> +			const fpb_t flags =3D FPB_RESPECT_SOFT_DIRTY | FPB_RESPECT_WRITE;
>  			int max_nr_ptes =3D (end - addr) >> PAGE_SHIFT;
> -			struct folio *folio;
> +			struct folio *folio =3D NULL;
>  			pte_t ptent;
>
>  			/*
> @@ -221,11 +318,16 @@ static long change_pte_range(struct mmu_gather *t=
lb,
>
>  					/* determine batch to skip */
>  					nr_ptes =3D mprotect_folio_pte_batch(folio,
> -						  pte, oldpte, max_nr_ptes);
> +						  pte, oldpte, max_nr_ptes, /* flags =3D */ 0);
>  					continue;
>  				}
>  			}
>
> +			if (!folio)
> +				folio =3D vm_normal_folio(vma, addr, oldpte);
> +
> +			nr_ptes =3D mprotect_folio_pte_batch(folio, pte, oldpte, max_nr_pte=
s, flags);
> +
>  			oldpte =3D modify_prot_start_ptes(vma, addr, pte, nr_ptes);

Here both mprotect_folio_pte_batch() and modify_prot_start_ptes()
can collect dirty and access bits from PTEs in the batch. But
modify_prot_start_ptes() clears PTEs to prevent concurrent hardware
modification. It took me a while to figure this out, since I was
wondering why oldpte is not used after mprotect_folio_pte_batch().

I wish folio_pte_batch_flags() used by mprotect_folio_pte_batch()
can take a function pointer to allow either read PTEs or clear
PTEs, so that there could be one function. But that could
complicate folio_pte_batch_flags(). Just a comment. :)

Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi

