Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD71C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 05:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EiWsOWLcDQxlnadT9lgwuzJqXUL3I4GZ0XuMwCJbk8=; b=Rf38m27ynOUSvT2pgHmFpcLm6o
	vtBDsGLIHq+P8KNuC6BkioesNSniV+0r81bqtrSNR08dBGBnWmx+DJcAodS8w3LVJH3vSzhvewkSU
	4miJaxWiMb26+p/B51eU3xHQQD1SYTMrUxAhRpnDLgwr16xBmNhMi5nRWKaNwxZEqKPI1hdyj937S
	VXZCfn8a7UHpw1LDSSqnnQwDfi0Vf48YyBAsuY1So6jF+VxZaggIYyy0pWNp9qlgtNa3VxA+qigFE
	qwrZEraFPwiatDLD9Ly78rHWCtxziHo3HMPcPqIKp+uOJyfPHkl2fntcD/0dWbxRIOJ38hGixrJ83
	Z7OFw/tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgHIN-00000008QVh-2Pec;
	Fri, 07 Feb 2025 05:52:55 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgHG0-00000008Q3c-1Pc4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 05:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738907429; x=1770443429;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=jQOQBdSmlw8h3bxQVX1Pgj50+1Vg9/Y46K4rRXG4SsI=;
  b=aTFeYPvMySX+CiJ4waakcRyo9TukME4C44TOWeug6UA+vnQGeOUIGrXL
   ezmoiK7hJ+pfsKUId4NgqC3TJEKmT34gMrUQLr5Fa4qaJFDF9kk8tG0J2
   Z6l9weUOtou0gZVoJFqxCwkyTgLLo3h1wx1ez4gNVOscbW8560L9YMHxc
   pOjO0tTSgZYHCz6a34Pny0mIxmTErSu0lGr8gVy1G7GlNeJ26zspJk23l
   pKqK1m9/zln+Iyl+WMCznWYLQ801i9cGXmpGk4x+ydisFpcJZHX0NIPXN
   vx71Ziev1Qe1Xqs5CKbSOWwbRZi3OyhMTxNlbISdjA15K+9j5Fl0O28Bb
   g==;
X-CSE-ConnectionGUID: 7KTVRSaMQoSyudSNUMCHIw==
X-CSE-MsgGUID: 23JXAeAqTHiEq84GoSXFew==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39671008"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="39671008"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 21:50:26 -0800
X-CSE-ConnectionGUID: j19yIbo6S82PrIoRuYDvSA==
X-CSE-MsgGUID: PlI1KR87SMOHulD7QIK2FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="111404337"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 21:50:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 21:50:20 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 21:50:20 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 21:50:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q69IEK2QRXzrtIGNKCnyfSg21BraLXth/SSMuI0+4f8cHLJZcHVZEflhk+ofTlk8B1F12MplhmruSCNNPxiqJuLAtoEE+BLLIIl7kNYq5oTh5/JCPXxWlRqnL3HOlccOvWiYWpOx97e3khbEv9I0EE6+ryR4vnM0PYhfTKqE8l3O5gK6itnkeHwqr8PWLVYUDkX9oX+lwx9B2LciEknmISWLyLLnbvSmnwmHJplY6a0LBpWbZrgWKdXdG5daF3SNdXq57/+i8SaECSlifCSgK9RIN9LNivaXHMlPa8KeM495aXvmf1Kty+xbcEKRJramCO7yniEnL7+1ilxs2GbRkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EiWsOWLcDQxlnadT9lgwuzJqXUL3I4GZ0XuMwCJbk8=;
 b=NS/cvsMjwt5YX1OQ68WuUq8jYh1WJAakRdAHE/28NseoW/oy5eeTHx00T7ecqlfzFn8Cg/+k6oHk4u+7CwIgMvfOguA0pssxV3yi81xMMjeryLbgogagy+uLY8ZFZ/E8lnXNvU+SahA2ROW4jm8XTt5qbWqsa1PHni4NefHbiX+LP4p148NC+dmvrvrB+om8WQzFK4jfAdidBgGv+BcxyZDvMfKrI+s3PCckUc4hZGsbO6qbTnEV1i5fdSfnLtTEypJxXReIwz7XxmVV/JaErT6S92rtFphY4OwnHoz0NNAxXpgeV6oy2KAz/8uvFzLKF1ykWoQuaFo/3fq3fGBOow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Fri, 7 Feb
 2025 05:50:12 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 05:50:12 +0000
Date: Thu, 6 Feb 2025 21:50:07 -0800
From: Dan Williams <dan.j.williams@intel.com>
To: Alistair Popple <apopple@nvidia.com>, Dan Williams
	<dan.j.williams@intel.com>
CC: <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<alison.schofield@intel.com>, <lina@asahilina.net>, <zhang.lyra@gmail.com>,
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
Subject: Re: [PATCH v6 21/26] fs/dax: Properly refcount fs dax pages
Message-ID: <67a59f0f7832c_2d1e294fa@dwillia2-xfh.jf.intel.com.notmuch>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <b2175bb80d5be44032da2e2944403d97b48e2985.1736488799.git-series.apopple@nvidia.com>
 <6785db6bdd17d_20fa294fc@dwillia2-xfh.jf.intel.com.notmuch>
 <zbvq7pr2v7zkaghxda2d3bnyt64kicyxuwart6jt5cbtm7a2tr@nkursuyanyoe>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <zbvq7pr2v7zkaghxda2d3bnyt64kicyxuwart6jt5cbtm7a2tr@nkursuyanyoe>
X-ClientProxiedBy: MW4PR04CA0357.namprd04.prod.outlook.com
 (2603:10b6:303:8a::32) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM4PR11MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: ab22d13e-4f5a-4341-5321-08dd473b49b3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yVSj+1R3eZ1iD9fgsgAqfB80fX950Nb5qqMyrn9b12z4AG//aHIDKRzaUwRt?=
 =?us-ascii?Q?rONUGK3PGrtqqibk1BeJrtSDSg8O2Lm35EBYKqx547MudcF6LGs4VeLwSfLG?=
 =?us-ascii?Q?ZlqIKvVtDGYsDtXWUZogI/9Y2Q3JjiQ/l4efvL+GUEYHvAc9W1uplV02mAzo?=
 =?us-ascii?Q?kkePFZSD0BtSVCYQMULKwaw1AobfcRRhuaHX66zaVirX3yOn7Mr8SCtE5iAm?=
 =?us-ascii?Q?c9NQSPHRklHZbQH7ydNtd9TSUqH0IDQ61Z5lqGP1q2SgF6beB4ZAwyc0Iy5p?=
 =?us-ascii?Q?hc6WY8GE5ybGCskSdFj0QgrPVWA7l7xU0dO8PujdRR/wrMHggK+80GHa4YJM?=
 =?us-ascii?Q?y99r/s/ODiwYyGL0yFlM0Nbbqt3I1HUw/WUJSZyKx7SKLzMDL+5tD6ofrt7V?=
 =?us-ascii?Q?60kRTFlrNKlsyjrhkRkJlZJg00ECNIhmpfY+xtqGkYqS6yWpc/RWBJ66JDHD?=
 =?us-ascii?Q?3cxNudCAB1eNdGtcRBl6VKM3fm2vEQmDYcohccwm7zc7zHKQGGi+VrlZsn3o?=
 =?us-ascii?Q?MiZPQGO17xXSp+Y/sJ0b0o0eu3gjTqQkGFlsWUeIRmeSK6yDvY1CvUETqtxC?=
 =?us-ascii?Q?PT0Zps6uSKZjG/xshQqaOo9PSaU15JCrkfQNX7QSoDydW0NQs/w4C+qnSB7G?=
 =?us-ascii?Q?HhkFIFizaY7pqLNmkE1SI07QQo25FnnmqOd3u3sECTIL/qvhs8n4WW2e0DqQ?=
 =?us-ascii?Q?ImVy69up43167wINdJ6kW/Svq1rafPShLBXyjPuHx1OnFa3B2YX/545Zjf2N?=
 =?us-ascii?Q?tI73v2xsXkHGuz36slmEMmbkszPpDze3KFM3fxuBWcO87Dlr3qJV6xPSbc9T?=
 =?us-ascii?Q?nwfVrJg5mEcgGVBzEhHyqQ2raSdjhNUD9EizHFn+uG5UIJOg5cdp8HV+ffuR?=
 =?us-ascii?Q?hYUDAnB8m3vYcB4epwXccyRiNeUcFqvIBBEhiw/QX/GvsKmGEehIGq8qJihK?=
 =?us-ascii?Q?L5ZUP+Kpa2EUEgaNNzWPPCTaVSFsxdGDc/oIoGCL8AElpYIGTfKAyGu/wKer?=
 =?us-ascii?Q?4MXuCNze4KqY/wDJKXGtjCOy85IReVmN1ZE1BbQp8K1kZko1fBUhhS2Js19a?=
 =?us-ascii?Q?ehNDJuHPLrWbZ2IomA5hM/i71T2WOL+7NplXPsxRcu1rkZIXDJ1F67BlYHeR?=
 =?us-ascii?Q?301seFJd/n8gRm6rYCmhOPIuxMPA/yAKZVoQMSkcP7PGP8IlI+xVsPB8XXr4?=
 =?us-ascii?Q?ht02XyTn4ktcI0O4VgElq/8r3YgJqhF63AwWMihaYHjCV4e6XN/E1wV97gSf?=
 =?us-ascii?Q?xa5inMYnoUm8h5/p3H5t4SE0z/arp1BN3y0CsnkpWC33GKn9eo0vBt8TYUXG?=
 =?us-ascii?Q?8LAojKR0oKP6+r563dclXFOZ4UIFDcsy50DVVqheJCaHqg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NBIyPQTayiA6l/zPxSWr92Vqp58lGxeDfPmgtPgXn+hzkA8uNuzSEy+XY4Op?=
 =?us-ascii?Q?gEqkOBggzNB418VHk9KakqqODmI+p3tTanNSiA+pjsiICqclKTvvvggJXH3U?=
 =?us-ascii?Q?Zqc2FGBPBY51ai7FABOiP18AYCTyCviTtmSz7qZryu1HeykIqDSj5grmdQK4?=
 =?us-ascii?Q?al4hm4qzrPvSMBlgCWQDKFqpAwyyE9376nmVBVbiI5d9cImqoigXReK2+R8q?=
 =?us-ascii?Q?h66YYNGRZMNu+rlKcIHHPQXsoEqXWpkJKlreRrR4j7tQ4Su2bj9F+J2NE++P?=
 =?us-ascii?Q?RZcLlKSLFFTEzPmdgF/vKRi/jEn5Ly6d+NFZ8TbVw34u/fF92CPeh1W/Jyh+?=
 =?us-ascii?Q?/+vqF1vflSQ57l7HHZr9RXHTPWU6i3i69UvWREo4ULkGkgsR6eDVwiQ/ZW2y?=
 =?us-ascii?Q?HzZzmcGRwzJ3wRzPaRgCN/oyHuXxj8DyIQIBsMXq//pay7/Ww8q+YOSzw0M4?=
 =?us-ascii?Q?DXU0mrtJvSO9IJV6WNeeSfM0j3FlZubo+T2e7+JCrft3xCm90Qc/972oUblN?=
 =?us-ascii?Q?dD9XmlBhcHKTvgSfz/wTPZyYCLq9mbqw0Rnmsx0Um4kwD1W7zD36jhzLm10s?=
 =?us-ascii?Q?k/17RBp+0AWMq2P4hhQ5Ah1gMKtyWbLRmxOENpDhhg+LQW7N3P1S3f5KwLm/?=
 =?us-ascii?Q?zCm8dJhKzq8ulUrW8B0+4z+8XiPwGnXPxf3Xho75vD2/Lcevm0ZdgyYVnFEl?=
 =?us-ascii?Q?6kb0wciGWEV31/QZFF0UU8ycS6GhVe55DKCrUGMqN+g+wamo0cxsVhT9sS6A?=
 =?us-ascii?Q?0PNHOlXD5Xa64UdRFT4bJvshIJLabkMGm4CHNoBKg1ySR7OgrEtEd/hH7Iq5?=
 =?us-ascii?Q?l+rmhTgAYauZ9UBTHQ2Y51HwCDlaFscZJQL7ecurqdSmkbE3vNYYrLXRr9ZO?=
 =?us-ascii?Q?CTbkh8PEnulPnMr338AIsTDIrZvlq0iwb9hsIpCDkQH2V6ltE/pDAkw6FowQ?=
 =?us-ascii?Q?FULdXQ2oj0IvnVdmNe8PdLVN4IO+5OiEBY70t+8mKtsTehTxYQZlSRcIGo2g?=
 =?us-ascii?Q?npeO9ISeQ2z+YoH6ajvCJKYE7TQKIasW9Xu8sDxzTPkeyKYOZKB0334jHFce?=
 =?us-ascii?Q?YP6Pq5TUnlK4Or3aeVbsWSnjE0KWlY6MwvuQartQAT52Jl+GpjFzZZB5HWuG?=
 =?us-ascii?Q?FrkhhZRL0hyPBFz9LoLeS3G4NuOnzK0z9jLiOTPjs5Ptm9wO9mbouNU2D7/5?=
 =?us-ascii?Q?OXZDAc78eBCmC41Z1r2fCTV+TsBjDDoUGi8V9P88wzT09dSjYj8A49v/grkY?=
 =?us-ascii?Q?FtRY/IRzqbnMD+nO1Noqbb2VzrurpDxjUH4isti2+IP8bcWb//0cnKQM69wN?=
 =?us-ascii?Q?SLyo/L3yystnLqAVtqoYOHeCKR7hrGheh+3UnPw3eaQtsL3utTpwBhmYEYRK?=
 =?us-ascii?Q?3Qhzu9EQpouwkx0Od7l/irmCxWspH8nhnU9ENgu1tzuicj2cS+L0SacWElfe?=
 =?us-ascii?Q?Cxvkyszn0vcLQdpPTONZTgj3mx2nOI8biLxeM5uS4yti5goxeTc9gIHj5p3j?=
 =?us-ascii?Q?tQX5RTto24omR6vgmSsJolPS+d/Lg08y3AgMFje9l1XgIUtImKRUPzALIAge?=
 =?us-ascii?Q?po3C0KM62AM4oc8Ck28VMvKZ4cy8Ot+5Jz7NxMGw/TCmHxh3GEA2MNV3ljbx?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab22d13e-4f5a-4341-5321-08dd473b49b3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 05:50:12.2902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gX2k3q7GH2A8q4DLA/2fil60owTchEVxEfMoy86QlVkux9ho6tprp7hUaO7/th+/nHNQF3sAkfCsHD3SkNckFsRy/7pHGwDBdqmJu+JLMfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6020
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_215028_421286_DB923CEF 
X-CRM114-Status: GOOD (  19.71  )
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
> On Mon, Jan 13, 2025 at 07:35:07PM -0800, Dan Williams wrote:
> > Alistair Popple wrote:
> 
> [...]
> 
> > ...and here is that aformentioned patch:
> 
> This patch is different from what you originally posted here:
> https://yhbt.net/lore/linux-s390/172721874675.497781.3277495908107141898.stgit@dwillia2-xfh.jf.intel.com/
> 
> > -- 8< --
> > Subject: dcssblk: Mark DAX broken, remove FS_DAX_LIMITED support
> > 
> > From: Dan Williams <dan.j.williams@intel.com>
> > 
> > The dcssblk driver has long needed special case supoprt to enable
> > limited dax operation, so called CONFIG_FS_DAX_LIMITED. This mode
> > works around the incomplete support for ZONE_DEVICE on s390 by forgoing
> > the ability of dax-mapped pages to support GUP.
> > 
> > Now, pending cleanups to fsdax that fix its reference counting [1] depend on
> > the ability of all dax drivers to supply ZONE_DEVICE pages.
> > 
> > To allow that work to move forward, dax support needs to be paused for
> > dcssblk until ZONE_DEVICE support arrives. That work has been known for
> > a few years [2], and the removal of "pte_devmap" requirements [3] makes the
> > conversion easier.
> > 
> > For now, place the support behind CONFIG_BROKEN, and remove PFN_SPECIAL
> > (dcssblk was the only user).
> 
> Specifically it no longer removes PFN_SPECIAL. Was this intentional? Or should I
> really have picked up the original patch from the mailing list?

I think this patch that only removes the dccsblk usage of PFN_SPECIAL is
sufficient. Leave the rest to the pfn_t cleanup.

