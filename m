Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84751E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 20:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZo4HustTWTLuGMOz5T6u5UpdFOEvU3triVIvL58SGo=; b=Ub1bhXAP1rHKWouzWLUbQIGE8d
	lrkEJ+/aFFJOuitSXec3eDSo28Di3GuyviVdyViu1qCy5sU7EdxTYcPb0l4cl+qzYUCTfzfmMvpZX
	XWmgoLMVOJPe8sNUinniZMKxATgiEbHX23iErx+i+jbnTo664oDIJD9qAfiBKuHoMWg7wEDfsqgIh
	VO2heqiNzVkndS7GgZj100bALzP95QyZOVIh8z8d+J9/UkhAJkd5mx/aHOhWbt1n0YW7PIqIHVT+2
	oGhZeru60zxtngD38ujqJ0urQyS0+j6pVndAQxZ5CAixJj1hv27fcGd/QrcB4G7+/UQZcOCz9yfCj
	UmyGnYTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSCn-0000000BROn-0f9G;
	Thu, 02 Jan 2025 20:54:09 +0000
Received: from mail-mw2nam04on20605.outbound.protection.outlook.com ([2a01:111:f403:240a::605] helo=NAM04-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSBc-0000000BRGT-1YQ5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 20:52:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ykp4jP+XxEnp7yatgd2VKsewe6rvCsWFQi3P8Fp497Jesd2TN5afdzo+/J2J7k7dld1tZCc6PMQQu7ZQfKQyjc5kurZekVwFR+Vao1lvE9rjE0db6PwQX96miOLNjcChy9zZblehaccXVA6UvQP+ntyKLZlzxfHNBKjNKp8SJhrmUBvyIE4gUMLq0AYLLoJGgaQy6eDiR2EINRmKsBi7j7xePq4gcyo4XVdZus6PuATOIBTXHkj/Ul7BPtCV8rpVF9NVR/7lGsNRjA/pXZNjvEY3gEGRmgS0CU5+uFY4MZZMj11NbKn/i4qpcA4fSTpJ1BUB5boKdWBeeM8MGz7bRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZo4HustTWTLuGMOz5T6u5UpdFOEvU3triVIvL58SGo=;
 b=WQz6uW3vRUd9JDhQgURMouaP2q49gXgT0ZWboUJmkQzpbb3biZakgvRagEi1aBiPM+NATrEldECoBjMwA430kQBZrC6LH9q9UQjBxVXRYDTr8+sbXi5nj10QuDOxHxozkfgBRmsoSHwd0I17VdhNozokpGtHttVV3uQxdIDAAcjW21e2lYAuUtrRRdzRwu6wZIVw08djphPOX4fL2sFfIAM0I9hLBVsxMHxjkFhOUzdzQanjstUeKxQrtsGeQdG+P1NE5L4GsWJl8mwD4h4g4i1KBKO3uT2U8bDLxwmWXiRirzxx5y5Mw1xmstY9iPkwQSR8kpSDt2YAXPomNjR4nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZo4HustTWTLuGMOz5T6u5UpdFOEvU3triVIvL58SGo=;
 b=GgskF81jY7miQKbWJQQCjngMiCowd9hXvdvGIwmZCoaRueYGymmFvN/WinAG/gIJGDrtJS8TzyfPkCMWuKJ5QBTpTl/TTbpwS3fgctqkNPye3qrlqrV/Q+OmKWfjGboDWQGFy5CNYwmVWk/e8He+oLc0y1BIpVjrFJCfHxlaMKLOG1qIAvNjBVtrMsrMqxovvVjTGnyTp2wZJMWmZbYI8TybXlonCJC6ppisAJRJuAxeOKqMptkmwAcs7LEbBNx5jRAl2SLP/gDZDNf7MIuApwuY6hwtX33f9c++tXarcBjbjigENLmJRs2c0zuOR3JR98FheyjZ8Hb64xXDnPZKmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB7661.namprd12.prod.outlook.com (2603:10b6:208:426::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Thu, 2 Jan
 2025 20:52:47 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8314.012; Thu, 2 Jan 2025
 20:52:47 +0000
Date: Thu, 2 Jan 2025 16:52:46 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: kevin.tian@intel.com, will@kernel.org, corbet@lwn.net, joro@8bytes.org,
	suravee.suthikulpanit@amd.com, robin.murphy@arm.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com, shuah@kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	eric.auger@redhat.com, jean-philippe@linaro.org, mdf@kernel.org,
	mshavit@google.com, shameerali.kolothum.thodi@huawei.com,
	smostafa@google.com, ddutile@redhat.com, yi.l.liu@intel.com,
	patches@lists.linux.dev
Subject: Re: [PATCH v3 06/14] iommufd: Add IOMMUFD_OBJ_VIRQ and
 IOMMUFD_CMD_VIRQ_ALLOC
Message-ID: <20250102205246.GG5556@nvidia.com>
References: <cover.1734477608.git.nicolinc@nvidia.com>
 <dc1252de7ff06c944cb7d91c91b4f61c25182f91.1734477608.git.nicolinc@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc1252de7ff06c944cb7d91c91b4f61c25182f91.1734477608.git.nicolinc@nvidia.com>
X-ClientProxiedBy: BL0PR02CA0140.namprd02.prod.outlook.com
 (2603:10b6:208:35::45) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB7661:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b3ff495-66e0-482b-89ab-08dd2b6f69bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/OPBvE/SYr180LvXoNm2CYB6YRWWoFFX8QzNTfDoAB6PfXh9i9uywmHXETGF?=
 =?us-ascii?Q?pABvVQU8CRN1bfLOh3erQHWyJgmyaPP8KMznx/B73SnI0r8W54MDbUjPbTyE?=
 =?us-ascii?Q?6UI85SK1CF5aYkvTYUC38PdwecHbebRdNWnM/nzYQlxZCsA8UsDms1Xz8SX5?=
 =?us-ascii?Q?NQAqkMcjW/L3+nHM/+jEHqMVkOOIAn0wXWqMULai1yhRXdageMVD1u7UZplO?=
 =?us-ascii?Q?+vimSngqmf5UO9lrLkBa6blyiROoU13U2QhPCwbkR+n5HY69mZeWoX9PekN7?=
 =?us-ascii?Q?Q0x80tYgnt++keqqMkWkiSbunRauYl0ioljL5MBUzqw0k+MlmoxiQOKWwnrz?=
 =?us-ascii?Q?7cvn88R9L9VavDTxYtDeYJhRjFGTIrCgObCsy8c62QpxHY3fG4xrRRGVWi7D?=
 =?us-ascii?Q?8aPrNYaDsN9MASkS1LSIqI8+hqIfQsBEqqdKfL58xjI8zpvhdhGembs3sLVB?=
 =?us-ascii?Q?rQs5tgBh+Ozq2jb7az6QBVAIl/mt0jQay3EedavAZeRb4AGwOyms33pBSYES?=
 =?us-ascii?Q?QSNdZfY89eiDPQVTt0s9oG2bXGn1F5x+9PlZpl/ZfEuv5/XDGXLthbQho+fg?=
 =?us-ascii?Q?ixQTYn/Lmg/zFARtNJkSjFwB7iuQoxJZjMWj55jVNsgE4m5dq5d72VUzacfS?=
 =?us-ascii?Q?ESGU//Y6vvwIBLxJIRxhR5/8ZcKzmV5x1easYBl17IT0ShTvUF3ej3Ph4gxv?=
 =?us-ascii?Q?o6zz5scZJS53cElpAM16Ndt3+DkYWnEf49COB+lwU9e1nS7CWLYhEMGjzi6V?=
 =?us-ascii?Q?CSl+AQpg9tVpmJqBtg+UIsK2FwZ1h7Yoz/gei+r2B0ZrURO2p6qXBAp+CeR9?=
 =?us-ascii?Q?lhrK442s2fcz/ccGaTycgqiLTKa8MSh8MBtVwyxI6kDFi4MdvNTbzFhyJbkc?=
 =?us-ascii?Q?GlNH2fyBD3U4GnxsWq/1i5QNQjLkqXUa+zwS6oIVeatcZK5jECmJj10wnd0x?=
 =?us-ascii?Q?7JOETu+Y5wXLdGTLroimy1O21ilke/att7y4KUfKRj2bqK3y1oQLPf7hzb/w?=
 =?us-ascii?Q?XhZL7orx/jPlaBNb6N/t7Ty/IQKMFl7RHEumCNZx2Tn1pYP7qJFzs7CgZ7WL?=
 =?us-ascii?Q?9WHC33jJStTxiYNZJ9e87w+j/NSd97J2z7GhE//jkpTp2X8/crPPeb3nrkeI?=
 =?us-ascii?Q?HN3t7DE68dIUbZx87nUO/f5ISb+nC8SXdizf8FJv+0rH6uFyIKXjb6tpEmel?=
 =?us-ascii?Q?V1cizVolY60aBsrvKvGBvbr0xEj6qrft95AZYiN6blrY6AH9SCsg+YKA1n/a?=
 =?us-ascii?Q?AFvR5nq5oQSPiioj18/cbST49Ro7VxpY5vT1L2X1raMWZBpoMM4BVHBdCa39?=
 =?us-ascii?Q?grs6221YF7ZC/Ri84N63EmnNJp76Hpa2dycGRWxyZEdMqSBMBItKY0gJttFi?=
 =?us-ascii?Q?l/kKRzPbd7AAajkB02CY6c69kVBo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0/ryVYmRgTZrgInAfAGAhFjyhdDKN7X9dkDKR+2mW60nwwBtE61m2YDZJyk7?=
 =?us-ascii?Q?967c6cZxIsveDibFb/3x46rCGpMK6jHGCGSJnJCHHTqpOry3PuHHKZOGm0Xd?=
 =?us-ascii?Q?nAFYLyWXY+pZQLfJAACiw+edcP5Ebo7NpIpvEwlzhM7bsxJ3KZtiH/XaiAYt?=
 =?us-ascii?Q?CdH8I33CYq9gZpksz+HHdYZTuBCRUkvKJeVrn8JJVngDG2a0XHwx+WiIv3Mb?=
 =?us-ascii?Q?0JhLNRxq9gjfK9SpFEhWF/X3IFcwYObkVZwUAwKMtgcmwmYS1e+Ap8QMzWYm?=
 =?us-ascii?Q?bAQ1sqkSXAlYweL/AX2mO596AOrX0hooB9N3Yo1cVWd5tCG6TsVJkCUBLtM4?=
 =?us-ascii?Q?aomy7erX2mfV+zhiU2MrPDT0EesjoagwxyL0mrJVdsL0XrL6D2kpC3PvqmLL?=
 =?us-ascii?Q?/QhOYrRuJYXC1HVQz3g+Dlfz9RJV6Wgmn2A/Gyh/lSOrQKdvZyZ7uiyIaLu+?=
 =?us-ascii?Q?G7mUxU8f71SJkr2Yuarh34jwEeEMSQcQAxsK2IjMHU4RA+TPxAAZ6BPBS23n?=
 =?us-ascii?Q?EDYD5F9/Wloif7s5YdylsMHGGV7KBbndHmzfTIIFfdfkuaHTImtFstrV4bOO?=
 =?us-ascii?Q?Ua7kNCxfU869o8L5Zro0njtWVjSeRdBQOLSdI4HcSETz0+o5tRyKmtoJ7NOy?=
 =?us-ascii?Q?hv7XCHSNgpnwBqPEx3sh9WerwwS+aeQon5UgJfqDtlaMX8iJTfDxfnQ9Klfn?=
 =?us-ascii?Q?zg41DmqtWz1YbWmf1doU8p9UQYlBj5BfM2CwEfq4krlbnXibkbsoUNBHV6uQ?=
 =?us-ascii?Q?0lCbv2/r4r318NVuVMCaKb0vwa2v/JdiAliE0gCGvgbxcUYSZ4XpjTKWgR79?=
 =?us-ascii?Q?sqVX5U4i1ZL0Wcio9AjHpcbgaPKd117qcXHoYouzYLS2dM81WJ1FWuctRgBZ?=
 =?us-ascii?Q?PAByonfq5k3hG5n79/wHZWd5GAM7rUbgfzODYgXqpf75cc1fTDuh2X43xzFD?=
 =?us-ascii?Q?8W+8Kre4R7xRm8IDJOmSh8Zxb0CxHGk5OUK224KUNCj8Q2wIG0Bl4fQV1NRd?=
 =?us-ascii?Q?6sXiosQJC8IYEEYabqN+r/YufBI1Yrw+dXYmrN9bXDn/hIAG2Ngrm0fQ4noM?=
 =?us-ascii?Q?l41/gHm3Xc9kFGFkdiQBg26yGTQxEOY6DHjKiKbOPb+5gzBmpNE8fVOdxijF?=
 =?us-ascii?Q?GYil/Bll4BS1SBdOQd8Z+YkAww4rL822f1cyW6esz/pmrDhpNkjpgpONKGns?=
 =?us-ascii?Q?dxhRmymMoNxuvN+eEhab7kEPflzmBc2atcse/5ussnVOstjCi8xtzVl+rB+6?=
 =?us-ascii?Q?kEC+ptM74YyseMWu9G8RNSjkXFxqyPCMhdIFmidkgXprN8In3Wzv8IVrPOeZ?=
 =?us-ascii?Q?ZuxjkrBpm19z0D08SqbIQztYyFDMQO1EpTrpd1m46f7xffAGYKNdGw3Rbn6+?=
 =?us-ascii?Q?GArHraU7KE+KECY5dnPrep54bNfHGFPJW1roP3zqu52fpDljmg2WZF8maqbJ?=
 =?us-ascii?Q?q8CqvSX/z56G7w5vOk42cKwFYCxdGfkazGffDpP78l4EE6AVFIhV5fVrY096?=
 =?us-ascii?Q?C9caHeiFCs8jvXMbL6AJmIVKbmFkgGUbvyx1QBh76BAECZ4/AJGXoFIJhejZ?=
 =?us-ascii?Q?2uE9IqLv9kbr9So4n+7KaO36E2sMst+jw4qaR7gL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b3ff495-66e0-482b-89ab-08dd2b6f69bb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 20:52:47.2896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2fQiZP+z/jXAmFer4VXd6BLSMC/CXC2qZynvGAUEwS+pLYF9cODmc0s2acw9lJnP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7661
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_125256_411963_E942AB21 
X-CRM114-Status: UNSURE (   9.22  )
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

On Tue, Dec 17, 2024 at 09:00:19PM -0800, Nicolin Chen wrote:
> +/* An iommufd_virq_header packs a vIOMMU interrupt in an iommufd_virq queue */
> +struct iommufd_virq_header {
> +	struct list_head node;
> +	ssize_t irq_len;
> +	void *irq_data;
> +};

Based on how it is used in iommufd_viommu_report_irq()

+       header = kzalloc(sizeof(*header) + irq_len, GFP_KERNEL);
+       header->irq_data = (void *)header + sizeof(*header);
+       memcpy(header->irq_data, irq_ptr, irq_len);

It should be a flex array and use the various flexarray tools

struct iommufd_virq_header {
       ssize_t irq_len;
       u64 irq_data[] __counted_by(irq_len);
}

Jason

