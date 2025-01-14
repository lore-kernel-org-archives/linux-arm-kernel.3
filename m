Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D2EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 06:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idlcfja3DeNfVAR7I+buYIPJo1gL4lVASBdfhSZYaqc=; b=lRkuhlf82Xn10H79PVfbHaTV7o
	OxTcQ8Pe9PDY+Tdfz5jHLfXGMQ3o3VQyMZtoQb1eG3N3moL7gOcIH1khkx89fa2P64KrpFQVwp8vk
	psdoSMu1Lw02bij88hdG5+9Ks6OL/7+1bsOuBYEez7I9wQCUQEE8i3Wf2ESKQesVD36PQgqTAZ+zT
	eOYqxcIdU3aNImKclY4jeiXN05oNh4VYs+nkgMVq08RnEFuEwl3eGba/U2C2ExFp2QldIf38ml2+f
	pmcFVpmCQCqRhwWJBrnxu/zYDQi3gKDC90Q+x9MzP/lUf90WV+o0Tb5AcdQZMbFBOK/QpDeGbW1Pz
	I3iVxaug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXaBm-00000007Zxm-1Q24;
	Tue, 14 Jan 2025 06:14:10 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXaAX-00000007ZoW-3Rab
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 06:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736835174; x=1768371174;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KEmS1Z299WnqpeOIPpWE9WpBQm5aeOU7PZ93d/CzbY4=;
  b=Wkp9CXjrsMxcwhe9uusDN7w+puYD5vB2CrlXGecRQH4hn0syeRYK9TOg
   HbH7gctx33PIAy0XRsvj2Jgo9kO9meO2kENPUfNWIvIHGnKKnSCdmD9N0
   S4BFqCXsaou4Y6Kj3CfJXCXluJFNl2wUQ+HEqndlGssEYJ38Ko9Emgmp/
   LplVWm29zhXW+di0XFo56+T7EbRz/58pjlaSVaFsMjNYzQhqYAZP9gPt3
   Ya7b/7P3C8u7GxJoAjKIQlLjLg8egAnP9IM8ORhcOk8oAJ0xg3+cdJoZV
   ENf23hpDXZuBJsfQbvADz7Igm6PR3glpOwcY+/2zmlj4bU8bwNjSwZEmj
   Q==;
X-CSE-ConnectionGUID: 4Is56ctuTW6pMFaP65y23Q==
X-CSE-MsgGUID: 0MPdMWgYSsic/aVfbtecRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40796914"
X-IronPort-AV: E=Sophos;i="6.12,313,1728975600"; 
   d="scan'208";a="40796914"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 22:12:50 -0800
X-CSE-ConnectionGUID: O8SaAUFXTs2y/LLUMLcaiQ==
X-CSE-MsgGUID: bdo4BKOQQVCWJjYvwrPZfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105589580"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2025 22:12:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 22:12:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 22:12:48 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 22:12:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgT5bD1n1UqxcJ1crFhf5RZfepsuq+Z4jyzvG40Pg0wundq6iZ93H0g5AkF7LIKlt5U1o2eWEGMphyE3SXL1Zl6yQgvCC+HiWguZxM5bwU6aT4h74tAds34s6fi2G41sAfyrSii8mpOi91eP3RqCB4WUX0RQl0dzuUNArkn1omfIgev2HCCh0a5bpnzsqsJaMyshjHnymtrl3ut7UivW/SOfetER7TXAnGVjEvn/RAm+S2mhnELrCmO0+RtarkYn7AgWpgWCWTVPj9qaadFpcFAeskaDl3Be2zgJYtePVGWmRXIqRUhehSjZg6ZY0/OaJU15HFr4eXoNYgJrdWMIoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idlcfja3DeNfVAR7I+buYIPJo1gL4lVASBdfhSZYaqc=;
 b=aEOK8SdTx7pRoJsRpQznzSTSAt1xOK3Ua3Whi+y/XDMIIpMkrGeXqCTk4IL90Zj0Njwsu30ZFteJOnWi/RIcApP6vpqcVtw3b1muEJ9zsUzRF0xPoip/1Ybb7QQC+jsXBwoGObAkpw1RPK1Ckw1m06YG1+rnzzqqvGpbZO21uhmiKOVYbOxf+mEHYegu3PP8L4GxDAbmP+CnozNAdZhOWyE+5tjMiSgKN/SNvEna+fJOviwJiVkr7t7ijJjIT4u+zIPkbqTXzKn8eGQrAL3LlhNQbmwPvdNR8XoofD6+bgM0az1Uijymxa0+sap07ZZgofZJ+W1Ix0kQpAqivvQ4xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM6PR11MB4676.namprd11.prod.outlook.com (2603:10b6:5:2a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 06:12:46 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8335.011; Tue, 14 Jan 2025
 06:12:46 +0000
Date: Mon, 13 Jan 2025 22:12:41 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, <akpm@linux-foundation.org>,
	<dan.j.williams@intel.com>, <linux-mm@kvack.org>
CC: <alison.schofield@intel.com>, Alistair Popple <apopple@nvidia.com>,
	<lina@asahilina.net>, <zhang.lyra@gmail.com>,
	<gerald.schaefer@linux.ibm.com>, <vishal.l.verma@intel.com>,
	<dave.jiang@intel.com>, <logang@deltatee.com>, <bhelgaas@google.com>,
	<jack@suse.cz>, <jgg@ziepe.ca>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <dave.hansen@linux.intel.com>,
	<ira.weiny@intel.com>, <willy@infradead.org>, <djwong@kernel.org>,
	<tytso@mit.edu>, <linmiaohe@huawei.com>, <david@redhat.com>,
	<peterx@redhat.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxppc-dev@lists.ozlabs.org>, <nvdimm@lists.linux.dev>,
	<linux-cxl@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-ext4@vger.kernel.org>, <linux-xfs@vger.kernel.org>,
	<jhubbard@nvidia.com>, <hch@lst.de>, <david@fromorbit.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <loongarch@lists.linux.dev>
Subject: Re: [PATCH v6 22/26] device/dax: Properly refcount device dax pages
 when mapping
Message-ID: <67860059b200b_20fa294b5@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <7d5416ad49341207e5f3c48d5b9c4b7af5fd9ac6.1736488799.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7d5416ad49341207e5f3c48d5b9c4b7af5fd9ac6.1736488799.git-series.apopple@nvidia.com>
X-ClientProxiedBy: MW4PR04CA0293.namprd04.prod.outlook.com
 (2603:10b6:303:89::28) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM6PR11MB4676:EE_
X-MS-Office365-Filtering-Correlation-Id: 397e2004-ec33-4c2d-de14-08dd346276c7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ubb35cZFd008eQgbGeHXSwfQx2l9LkE/CzVZ8CXu454g+Z5BkyHj/65VRDN2?=
 =?us-ascii?Q?L3PtsoTtxjijOzIOazA3a6ssovV7mwdiVCWbh6/k1fnO+ucg91JZ/pPeyIv8?=
 =?us-ascii?Q?w5sFRKcgXwCaha26KWhJOxS40xF49OWL908eROXkvwFVVauHaIZQDZYulfwo?=
 =?us-ascii?Q?rhGX7EvS0i1x45wnhtGz8+tph4NWFqHvXpcaijoDnj/0UD6srRhGWi4O4h+g?=
 =?us-ascii?Q?hDqEmvdvY+nrqCC3FvXrB/Fi06cguda9in57OJJOcoGPVWcvt98MzJTiietg?=
 =?us-ascii?Q?sx7kyT9x7nyort90KMAaMgz5uBtSirbRRfI6XesDT0hPKXmxVaWWeORMw6Jt?=
 =?us-ascii?Q?KaIZdXqJAG63MIZVoymryXK862YxkJ6SQCthJOmAVimHksT+qPkRLfZktXKS?=
 =?us-ascii?Q?LXgIUpIE+Occ4UhrpvW1yVOzLJyS9KsjiWhUkxoKhx/aCsK/mhGWST8rDV36?=
 =?us-ascii?Q?Eh5Uhu1CNOp7RIt7Jz61OAf9ENMhoByLzEECwqwqaCYSa+K7ckSQ07/jdzmB?=
 =?us-ascii?Q?1tlQg/k7x2Fx3TNbFgxkk9q/LI7/6ag2u6V0bz4iIWdguAnsYy1kptTpuSLS?=
 =?us-ascii?Q?cEiBgLmejkyhhpjJLtm5/Afn9M1NAJZpttIGC2W/A9S9v87511rlNjvkvIQs?=
 =?us-ascii?Q?db60ov83/T/FLNDMPOcrL+iuzbEJHf7xmMyjjGcfGyrmDZT6HD2kory6Vs/3?=
 =?us-ascii?Q?6P9mV+fX4Nh69/jMB9dX1J0JIPIWMP21DjjaBFBBxRTMDtC+6DarfzoSdlak?=
 =?us-ascii?Q?dVDVuL5p5SebMFhnAAOt2UmOX/wleO/G+roi9Yy2HKXT7kaezfexGpebz13i?=
 =?us-ascii?Q?UBe0ZHDZQ17vGiBmvu6vGhZgkh8Y6Y2CY2lYaYguS6p+c9PaJ0YFwMjbDWxz?=
 =?us-ascii?Q?TWIc7GQqYydnXyzyJsp3yKzyBfcueSSN5/PEQfTAxCgorhPVCwIyoLi+TO20?=
 =?us-ascii?Q?1Xn5cNPry+baM+CJTIktA5Ay2x0nY/I7HMyYcKvve4tuj4lE0YyU6t/fIZjt?=
 =?us-ascii?Q?YrBihU5YUm1kEN7SEiu/BfeNv/+IvsIx/TMYPw+XB9E9jV9A3LsKDzfwOvGd?=
 =?us-ascii?Q?Ms1PZV517DZTpBe8528iMoC9MNqa2cju+yTkJTkXmP+8r3rwugN9rsAkcLiK?=
 =?us-ascii?Q?+nesaPhkZr+UWAKUm8zuFg+lySjsL1GLv8OIacHPagRAmpjyTn11vgepQ/rV?=
 =?us-ascii?Q?V6Mabn7xf9Lirt13o3YofB/ep0M5YGetPJbMrWpO9y/nQ6ouXgB4x6IcQJrt?=
 =?us-ascii?Q?ixm9AfQOyeygA5nZH+if3rdBuGF6L16FOhLCy8sa7uSjlYrsRAOMNg8hhmJN?=
 =?us-ascii?Q?Zx914pckRTZ842j7JnLBcjTyidVo3gI/gVlmfv96nNQwr/XT2+8D4G10o25C?=
 =?us-ascii?Q?LnoQ2EXp8hgB9P9Kl/J5G2/kSDO8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PN15taGIPKxDFj7EX00hMk5j3tlidozrXVnPi8zaSbhD4w736AthXkiMcmcn?=
 =?us-ascii?Q?upksF/7/R1kSCmTQ4B9+S7AOFdXR5wO2BiQ2KWhmfJpMEKvogXiAcZja956l?=
 =?us-ascii?Q?LduF98oPasMfu4Zau8mEJIvosNTKTgp0DwWlyctgkdAd12JOse+IM8qs4t7J?=
 =?us-ascii?Q?DsSiDR+K/NLY2Q+JKlivpdyrgFDMGOtpniy3+hw5gn/nXKqf+y4xaMDEwKkk?=
 =?us-ascii?Q?Pzhg5sRmFOzdLxe2vh1k+kn8GvjDB5i7RwbGEwMoih69yDwN7hNfabyOhf7Q?=
 =?us-ascii?Q?K/kHwgcspd9Alx7pchtZA3n6X1LMpSeiRYJrUY+O7HK2wcR9B+NMjQFD9UNj?=
 =?us-ascii?Q?w20GG+qtkOfUnMvaSkam6N6/GwvLZclR057r5Z7xHCsPviemfU3Nzu98faZ3?=
 =?us-ascii?Q?X7efoz3YvdS6ecsgZcXFA6Zjtgix8azldEoTOZ7JrADbbgtRXb+o8GC4/Y/o?=
 =?us-ascii?Q?ApQs6gB0yhRwdpxD67pWyHs6to03pILPbv6bny1ARFr8qMX7bep0RKqpvp6w?=
 =?us-ascii?Q?QE9rDo2arFZy879HdU8x4NhdK2HO8d10LvfjQBgsZYnKgdRJ7MZ51/os1pgk?=
 =?us-ascii?Q?C096NUdaavbyBK4/TJWNnWT0Kn45Totu5IBm8P/NDe1T/6RSlJ/Sj/lIpaZH?=
 =?us-ascii?Q?K7v3poo0mXGwbROEOGmVwWLxi4V7ZTchF+kPq34qtGkX6EqAHZExuS2lJ4di?=
 =?us-ascii?Q?eMwEpWWydQmJlKN6dUx+mG4Svmz17hhDPOgWmNud/RuQyf8YlagkwGzC21fq?=
 =?us-ascii?Q?+f0ZEo2BIasMjpwWGUe7wHWa4BwhO6J4S6t2enA7sZABJzSRjvblVJ1hYoUn?=
 =?us-ascii?Q?7yYfQVmqqtBcp0p8U6pXdOrUgy2jubF4ntmYB0MH42LmCTWGk2XMXoAqcXq3?=
 =?us-ascii?Q?Ufq2iKozxT8BNdPcSRIGMd1Kq+WtHSwdUR3hauDXxuo6hQHapt0uvYywtos1?=
 =?us-ascii?Q?7ZXMBrvN7kh0H6wQ4S0/dGSxrhdU1f4X5rIZjL2Jk4cE3h14RozlKJf9uaTJ?=
 =?us-ascii?Q?CiXtAPFd1YtHUAd7QFM0LKeYth/jItvvphC7sVZB3iI8S9RsyS9q3CFGr2Yr?=
 =?us-ascii?Q?zIClGjBjb3ocFewoHcUdZ9YoMbwVtLNWxqVEW/8jssJrxscKM+b0CJ2xl/r1?=
 =?us-ascii?Q?T+iTHnFi5mgCr1lWQ1OBjuUSi0iis1bpY+/3Sg6t4u0q2gCxyT6AJqDNb9ZG?=
 =?us-ascii?Q?ea54+ZACTfQEiBSqUTImIy4zzXBe8ijXwjAWX5pVRL0uKCMkt6ieN/9MtFlO?=
 =?us-ascii?Q?4guLwbu8LWY7m/rRIwm1DQnKgZmhKjU5r8QEjJKUoZNWsacC7eMnQolMBhqj?=
 =?us-ascii?Q?myAwn/N3Pdeg8aZQ9ifL4K/RLwjFEvaLppqv4stDzPP7FTls+Sj14DYvJ5E9?=
 =?us-ascii?Q?Cva+fEH9KY9M8t1BCQ0B4rHiMkMmfVzmS11tAsOhp21dgYYShhzj6GlgSyMK?=
 =?us-ascii?Q?q8SgUANCIPL0aTW20jM7AhaMnD5VpFRoO/1kXFNVOnkGmo3z+9nnqd/UrEiY?=
 =?us-ascii?Q?EJFLMTEbIpOMxCxGQJvAK4e8+gaZkV61OlKbNLrXvs+/rPHKz7COE8s3hAkH?=
 =?us-ascii?Q?ztJbJL7A65LWL8lgLllFtPLCIwCROkBHFTtEZoR0oK3DOYoDX9mycOALGaR5?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 397e2004-ec33-4c2d-de14-08dd346276c7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 06:12:46.2175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BCs1YqIUcRnYVk9zwnblXXOdzusAg8xya7tbVu6H2k6HuEP5VbFPqYftN2iSPgiTG5UkMKi355MHPOOgbAay7x+699o7jt3mU1lsO2Sm4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4676
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_221253_969530_3B86C645 
X-CRM114-Status: GOOD (  18.52  )
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
> Device DAX pages are currently not reference counted when mapped,
> instead relying on the devmap PTE bit to ensure mapping code will not
> get/put references. This requires special handling in various page
> table walkers, particularly GUP, to manage references on the
> underlying pgmap to ensure the pages remain valid.
> 
> However there is no reason these pages can't be refcounted properly at
> map time. Doning so eliminates the need for the devmap PTE bit,
> freeing up a precious PTE bit. It also simplifies GUP as it no longer
> needs to manage the special pgmap references and can instead just
> treat the pages normally as defined by vm_normal_page().
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  drivers/dax/device.c | 15 +++++++++------
>  mm/memremap.c        | 13 ++++++-------
>  2 files changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/dax/device.c b/drivers/dax/device.c
> index 6d74e62..fd22dbf 100644
> --- a/drivers/dax/device.c
> +++ b/drivers/dax/device.c
> @@ -126,11 +126,12 @@ static vm_fault_t __dev_dax_pte_fault(struct dev_dax *dev_dax,
>  		return VM_FAULT_SIGBUS;
>  	}
>  
> -	pfn = phys_to_pfn_t(phys, PFN_DEV|PFN_MAP);
> +	pfn = phys_to_pfn_t(phys, 0);
>  
>  	dax_set_mapping(vmf, pfn, fault_size);
>  
> -	return vmf_insert_mixed(vmf->vma, vmf->address, pfn);
> +	return vmf_insert_page_mkwrite(vmf, pfn_t_to_page(pfn),
> +					vmf->flags & FAULT_FLAG_WRITE);
>  }
>  
>  static vm_fault_t __dev_dax_pmd_fault(struct dev_dax *dev_dax,
> @@ -169,11 +170,12 @@ static vm_fault_t __dev_dax_pmd_fault(struct dev_dax *dev_dax,
>  		return VM_FAULT_SIGBUS;
>  	}
>  
> -	pfn = phys_to_pfn_t(phys, PFN_DEV|PFN_MAP);
> +	pfn = phys_to_pfn_t(phys, 0);
>  
>  	dax_set_mapping(vmf, pfn, fault_size);
>  
> -	return vmf_insert_pfn_pmd(vmf, pfn, vmf->flags & FAULT_FLAG_WRITE);
> +	return vmf_insert_folio_pmd(vmf, page_folio(pfn_t_to_page(pfn)),
> +				vmf->flags & FAULT_FLAG_WRITE);

This looks suspect without initializing the compound page metadata.

This might be getting compound pages by default with
CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP. The device-dax unit tests are ok
so far, but that is not super comforting until I can think about this a
bit more... but not tonight.

Might as well fix up device-dax refcounts in this series too, but I
won't ask you to do that, will send you something to include.

