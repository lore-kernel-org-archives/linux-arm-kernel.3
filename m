Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2186FE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 22:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUqv0Ksbm+/HEaOsgldlwIOMzDG6U+KhCwAb9+DqhZc=; b=jNn4fdS25rVxOuUPbY/nwF+LR6
	dCkHKc6crRUspADXw3d/DS7qc/K3kZ/fLMAee9j80/+KMlGmh5Bd+RoBGakb9LqeEdptZ90BNBgu3
	3FIuicVBH2n/oL/0nd20bwUjXwxFSyJ9F0hJWQDi8DCJN6NgrS3yl3DDxqK+bD6MYZYDifVA5RroP
	BQput7bTlKWtxWoeD/NEo5PLx+mjM5d6OdtQReHkjv2T0vZXZ9ZTUiq3fq7CG3JZNp1OAm0H3+re3
	vYwCFloNwl0S0tyYsDTTZFvpHEXOK/6z4QAfIG+PZGZ7fj4ueBAoMVDjmdLGSRH4SVDIZ8sChl2Dx
	HZltki/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVecf-0000000A2HY-2XJL;
	Wed, 08 Jan 2025 22:33:57 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVeag-0000000A1n5-2wIH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 22:31:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736375515; x=1767911515;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Ce2+BfJSZKhTHcX12QKljG2tsQBO7DwT02/kJt5KTo0=;
  b=mUcZCYXvtnURZXzQVeek/xqMRXDP9HEbeYDos18WYNi168VH6qZPcd6/
   A5CR3UA5NTbM4tIg4HO2lqnm7vu5PdEaEG0Neq5o667DLMd5dbYA7z+R1
   q/hRnxffN2/3OaFpX/i4V/OofiKs6X0TsRAzkUBG+bB4Ure2hy4M92Bgt
   dom4E+HlXuTQu5DzG5ls/oHZJu/Ry0WUf+2vIo5xVGkLU+tU6Wu0IvIbS
   j9cdPcthTzvlq06i4d4hT9KL3WzMNnBiRsWJgOfb7Cjcx64iZ9qoCZoAa
   fYZNEZvahJVimMAMd36pENkX29rcp1KkpaYNTNgcbnsftE2YMYA2Xh877
   w==;
X-CSE-ConnectionGUID: 4NEy9HChTNKkGd9fN9uW4Q==
X-CSE-MsgGUID: 7QBoHaMPQnS1Mc8rBra4ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40386098"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="40386098"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 14:31:14 -0800
X-CSE-ConnectionGUID: sIe2cLOaTSq2+IFlqu6OAw==
X-CSE-MsgGUID: ryLKBlBZR66qAdy4lMiuMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="103723763"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Jan 2025 14:31:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 14:31:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 14:31:11 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 14:31:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zk1KBOY1I7eufmB0mLtTNGOAGrrztzEUEOimSe5uT45D8/f6TsYZVLfQ2/OgH2tB5gRTFaeDrIVhjq8Rt4Ysove9KsAzFzjlS8zFiTzk0DT/HmbSH+l0q7FZGWU0dOSrJEW/yCbiI6HplR0ScvmwsQ4MfgXFDduQUOUsQ5U70EUhE+zvTxhVMkjfReDyHe9l+3EJhbCY/ZRrXpjSlwySB27vhjbYE1nbJ6RAt8klmTlHCc237vWrL8HGNnOlGiUJL0LcYAO2MeYoLy20a/Z1gnuB4auNAytBuQz5QTC2TQ0L+AEMYoQr4suc7j1NxLt25xe9pq8CRjwPdvQwuJDrzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUqv0Ksbm+/HEaOsgldlwIOMzDG6U+KhCwAb9+DqhZc=;
 b=izcSxrfk+kQqgJmeAAQrG66bkLoSXC+BumrxaL+Y1MV+phncUqwd5y3iQsjbrU1Oe88n+LfepUaWehPLyEe0E6nmXKnl/oG1BhTylSY1Yye3Waa3UbHXP9gYEbFjC2cepNve5t0JiMxqfasjPB/8kvWUJMDXloA5VZNJ9MoRpTaFlhzLAZKm/J1M+dHS0vA3HnXmCjyC0el1Z6+7rBzTvnNWJ+ZFpGZ19FXVdxk3r1U3gy/XzBXhBF3nzXmAXjBkEqH0k1iMEnLDEKrH4RK+6QrOji24b2tsT+AyofK7sGT85CHb7bkj4c+9kvd85vG5+8p7aJlznlqdW+gPWS5mKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA1PR11MB6515.namprd11.prod.outlook.com (2603:10b6:208:3a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Wed, 8 Jan
 2025 22:31:04 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 22:31:04 +0000
Date: Wed, 8 Jan 2025 14:30:59 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, <akpm@linux-foundation.org>,
	<dan.j.williams@intel.com>, <linux-mm@kvack.org>
CC: Alistair Popple <apopple@nvidia.com>, <lina@asahilina.net>,
	<zhang.lyra@gmail.com>, <gerald.schaefer@linux.ibm.com>,
	<vishal.l.verma@intel.com>, <dave.jiang@intel.com>, <logang@deltatee.com>,
	<bhelgaas@google.com>, <jack@suse.cz>, <jgg@ziepe.ca>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <dave.hansen@linux.intel.com>, <ira.weiny@intel.com>,
	<willy@infradead.org>, <djwong@kernel.org>, <tytso@mit.edu>,
	<linmiaohe@huawei.com>, <david@redhat.com>, <peterx@redhat.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxppc-dev@lists.ozlabs.org>,
	<nvdimm@lists.linux.dev>, <linux-cxl@vger.kernel.org>,
	<linux-fsdevel@vger.kernel.org>, <linux-ext4@vger.kernel.org>,
	<linux-xfs@vger.kernel.org>, <jhubbard@nvidia.com>, <hch@lst.de>,
	<david@fromorbit.com>
Subject: Re: [PATCH v5 02/25] fs/dax: Return unmapped busy pages from
 dax_layout_busy_page_range()
Message-ID: <677efca34ca0b_f58f2943e@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.425da7c4e76c2749d0ad1734f972b06114e02d52.1736221254.git-series.apopple@nvidia.com>
 <db02794f12a4cc8c659a1123bdc90fcb4dcb1104.1736221254.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <db02794f12a4cc8c659a1123bdc90fcb4dcb1104.1736221254.git-series.apopple@nvidia.com>
X-ClientProxiedBy: MW4PR04CA0269.namprd04.prod.outlook.com
 (2603:10b6:303:88::34) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA1PR11MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: bdae4f87-bf2d-401e-e312-08dd303422e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZViParltpZlqeDozfF0T2Koomhsr2ax2cRxDLoYcGtU5EqcW1CAmjJnSB78n?=
 =?us-ascii?Q?MBy2BJfCjW7Dj9dRfrUglM9U2UUDg9/Rx7f11aPHzoS82VXPmrg5+txZX68+?=
 =?us-ascii?Q?AaRG/r0S6wz4KNDmXvOlAiBsx/1Nkoi8VsKONkvJk/Pm39z9ue41ulF3dE6e?=
 =?us-ascii?Q?DgPTILe5K/4CaMwJkzjG1CAB8ycsnqE5LLAvGm0LegmGVAzN3utK8W7Mw/ev?=
 =?us-ascii?Q?KnI+4HxzC8xL9dRbnVMGxmqZBytv12zWHY2yvYKY+EP3aEL0rR1ISqQSC2di?=
 =?us-ascii?Q?MATMB4ewP68u+1wiNnneSN4F9rIN01X6b9v1YMfGS2hBZuHsqyMQQMhaDj0m?=
 =?us-ascii?Q?4+idFk9mwcpRL3GnB1Iwn7bvrZSroMGX8Hw9ClYw5fugQBYbiCeUO+MMOemu?=
 =?us-ascii?Q?muTeZ7JJWpej9PzTbFwoug2E5YH+UxOODsEe7wYhYA7eKRx1tGIO0Ze06+3P?=
 =?us-ascii?Q?RkeGFQ8imOXWxbpqitoa8bUn4EIN0TCS64XIurf/H3hQJsCTAFrCQdHShGdl?=
 =?us-ascii?Q?wbo55t1V3dxkzHpcWxJEHWhzk9k6HQ/Js5+CyRauSCdjZWOwtnOjEH2v3Luw?=
 =?us-ascii?Q?h/M0T2DsfTjzklNRskQzF3gI/astosK9GuIXXG+6rOCSF8w+3RXEXlGMJFtF?=
 =?us-ascii?Q?XbdA0lQWBShgeKSmqpvNmLxBRSuI2BOfJDdpkLrQrzS7ErWplYaNLdajReR1?=
 =?us-ascii?Q?X3UCQfVXKjjSoP9S8+WZlHqoFH+wd4K9smdQgN5RrvkwZnrVxYPm7rHLptW9?=
 =?us-ascii?Q?7d/gqAIvOS2ZFeBzpomkA7oysuCIa6UdnmLGlUnrSZ8A2VgOk202j4UN017j?=
 =?us-ascii?Q?RM3qwnG447sbuN5gi5HLKvVGwDTK3oo0aF/ciDq2vtALLk0OXws4t/DNvvIl?=
 =?us-ascii?Q?i4Rs321eV0FlDulKmlpDqXWOwa5Muhp2XBYaPIWIz5jJTWqBX8gw3Bix9Egz?=
 =?us-ascii?Q?J3e60QtQbrhW4GI/MTjvzcJ1x/y/nzlr6KM4QawNE/2Ync8Rcd140T7mPSt+?=
 =?us-ascii?Q?mcTI7C7x6uC38N+zwS9Y6FEE6nQqodKHwyEibaAuBoMJRcwJDREd7CHsXzpt?=
 =?us-ascii?Q?oCWOxXDQzKgy+kjTfMdxD/sYVGulzYnnqahCrVUNc8sO0KmKbwOK6tdkvDpC?=
 =?us-ascii?Q?qq7W4Pk0VVHdarwn3QVDBuMbfBxm/9XUPJoxuWzNofpdywtluq/sFK8mnzc5?=
 =?us-ascii?Q?FqAMC3TnqI/HbIS5nfji9I/fE0N9QXtrXgLf7UtQmlBNL9VCouiYobndFZVg?=
 =?us-ascii?Q?OcDXtI1sAPd1JO7FSfPihbGfQP8DKXZIaV6FOFAomcr5OyVv9s6K8RD9Jk/U?=
 =?us-ascii?Q?VfjbO93iZPgV7Jj01oCNeY644nWmLDpIwJclK7bimD7KcU3war83YzXv1hE5?=
 =?us-ascii?Q?NT2hDzaHNa8tpTfbJDAAT07noq+W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eh3VDFQ5cctR5h6XBYd94LwnS41LOU1dWquAq+DxzGxBOf6eCA4NWEZDri4h?=
 =?us-ascii?Q?4IZTUEm2Y7GDEf4VGO9dltUImSe+XO7RTXyYZN9ykrJaFOOwb7u8vi9bA1y2?=
 =?us-ascii?Q?+oDBASvmCtpKZGLO2lMw6cwa9gajxgwQ4DTZ6lVEfk9ebHcNv/qVY6bLTL80?=
 =?us-ascii?Q?86IXtIoNKxXH9TiFl9BBYlDgaKXE95aykqcF963rfbfY2ooEjmAvZDRQVorN?=
 =?us-ascii?Q?H4Fo4HpvQp+vrv7frjH4WSb4I0DzubDC0lq4hKGmdEf4KqFV551L16P1vjMT?=
 =?us-ascii?Q?J03YAAyFOjz3/jCSsg5cf4J0mad7uuWmLH6QtiXThxvLgtGuakka0Yq49oYs?=
 =?us-ascii?Q?NJb4242UdGxoTUfJFvyDbiBIa4HvYe237CJS/LKznx0h0pGDzAAou+eerKTW?=
 =?us-ascii?Q?7p9XfAEJIma4e7vPtP41nt4e/KihD35BQ7zB48bgARh7rxhczAYovGxnDiiS?=
 =?us-ascii?Q?vjAVN1DV6t0tDvGV2QdrnrpnbTdPtCna72tK2EQEzTWexZ0dELEEdvFo4vER?=
 =?us-ascii?Q?bJKPQRgQtPvyuWzE367+B6zqSN8FNBTNznxyp3sSMyyQRsAp1POzR324S0qb?=
 =?us-ascii?Q?WjG7yHLZC5YIx2TvIhPv9qXadO+0nxoAniAjD08E/Ae3yM+Hp6BpKlmoSSM+?=
 =?us-ascii?Q?eUJiw3l9N+YGFAGbS0MembN9hjZ1H7723LBCxrT9Rv58KREOq5dHs1QffhtZ?=
 =?us-ascii?Q?+JqpKSpcNxRYxthJfXNk//lZs8z7HC21jaQwgmftrRPbm1yH3JXzPL+5aAzd?=
 =?us-ascii?Q?6r27s8hCcyNBgkIaoUNVEhvJAoPRAZcV/GviuHaKOEvw/oSsGJtUoDvj7wwU?=
 =?us-ascii?Q?fokQbHO2DWdRNshRncln1Xservo2wxnMglXJqvuawksTfM2kjA3sPuxKftJ2?=
 =?us-ascii?Q?tH1VIET6TByekztdgbd26Np1vfFgp4rxwSgze4SFz1TnJPA4QE9LEI5ofeeM?=
 =?us-ascii?Q?7LATVXjFm9I1MGIQZ6rFzKItmRI9lqeSmK33AiGokpww1f/z6WrfRi4+NoQ5?=
 =?us-ascii?Q?dAsjMHGv0vlco1JmD6UYAgLUSX/pgaWE5GkS/Z1q0rewRZkD69qY5ryEr21b?=
 =?us-ascii?Q?96TZUnin9VyKzXfDNznBm09wxSbdppmXuFDZhTMiBmhuARTRV/7gmahXAiXd?=
 =?us-ascii?Q?kQaPDkqJxOLm4PdSlmEgwGsF6VG7LF0rlXLvv+XWySiES0IFaPiFyEGEkHgO?=
 =?us-ascii?Q?U+OkHw+kaqtHgzId2vgBz6OxT27aDX3TFNhXuBOEKKaJAwnoRrQOo5zOqKX5?=
 =?us-ascii?Q?5n2wN3Xaa/fJHYV7Plplp7QZPYhXrZIlZ4u1zC45RcZYISBUOfOKYvc/+DZ/?=
 =?us-ascii?Q?tRKxc3j8rMVNYebBgUMDmOkCz9jkhwzQYagwuzhfV/UpScHoUaK2+zs4/kml?=
 =?us-ascii?Q?i3jQOwF6Iid82+CoIkTkiWP5f8HvvnnYH/e8QGvslz8VrXDUzT/hLXQ2ASo6?=
 =?us-ascii?Q?FgglLWNj1R18iIOBQGl6+ZxUDvBikc6Xd55yhDHWAqyzR4HV8OYQdlhrsYhn?=
 =?us-ascii?Q?V+uR28HLIlioMRGMqyty//8BJc9OO/1Q1lAY9/u4Ceh4PGWnvPm4u7kq84EU?=
 =?us-ascii?Q?lmsojmTYow2VOR1A5YVoJLai9nQTneNg/kMOg/sjy7HrL6Wu9U8n6/EUtqlN?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdae4f87-bf2d-401e-e312-08dd303422e0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 22:31:03.9691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPPWGdZU6GcTJ8/rvLuJSwJYs1OIP5G/Xg/+8yLW6S2OYZpQfjeZ4UcwdurA6IFeyGLH3c4EAON7IWQJ2wOTyf38McanhXHoh7hgM7+xfHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6515
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_143154_787280_D15AAD98 
X-CRM114-Status: GOOD (  12.79  )
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

Alistair Popple wrote:
> dax_layout_busy_page_range() is used by file systems to scan the DAX
> page-cache to unmap mapping pages from user-space and to determine if
> any pages in the given range are busy, either due to ongoing DMA or
> other get_user_pages() usage.
> 
> Currently it checks to see the file mapping is mapped into user-space
> with mapping_mapped() and returns early if not, skipping the check for
> DMA busy pages. This is wrong as pages may still be undergoing DMA
> access even if they have subsequently been unmapped from
> user-space. Fix this by dropping the check for mapping_mapped().
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Suggested-by: Dan Williams <dan.j.williams@intel.com>

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

