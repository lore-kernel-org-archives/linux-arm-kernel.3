Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC79C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 03:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jd27nGY+5KvHLaZztpyPbP6IKetTsBT3yeAWLrc68M=; b=IarBG0eMLo1Okkil5lKfpw+0ct
	k0Xn2ycXu0L+36H5e/QuQTWTFFsqZCm7GE3T6FjQprGp4oxu8lqIDjNz5CgsuBYmhzrRVjWufvgAr
	0tb/TDru8EivRv3B8xnGY9tYNV/xsUrf77nGXdzKagCy7AiIsAaiSLYW4m/4F1so33CVu6/tIEF31
	udB//1YRx/2Sel9dpqdt6aG5kc5Ov2e2oTekwWI1+JrIQXOOmGMJ+MnCMIq4Xk2HajZ0N6GTjDZqW
	3MgQiU9RI0tZTvH4d7B4zMFsPmxFrwMjkNVQIdsXKi70FMErMOZnrAbArWBG8P357CaCufS3EBb+2
	0Nx6PeNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFm9f-00000002Q5h-3XK4;
	Fri, 16 May 2025 03:54:39 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFm7X-00000002Pw7-2rEX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 03:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747367548; x=1778903548;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qaS+yC542mB98RqvxuyVtq6T2T8W0V/g70mdyVgFkWU=;
  b=XTucw1DFsVoqXzsrjUC16BjGRlZXDVsjfXoVXi5aNRq5J4eBvUMNbsIo
   sXxA3iBL6EaFX8X2GV6QTQKDdk/JaDhi+lXHnRI+0outgZTYdXhGo3IOe
   racNdUmaD+Eu/xpfbNEixLND3uJLG7TY2J1kHE9beECHCkFkalpo6HoJr
   PJ7gwZ+iejCBb3RbCqm+avFdnAS7fK8Ar08ubJE0qO/EbMmNbqFEm8dZA
   WJl8uD2dW0sh+gL9RFb1jilNaclR6p+Ucp37nv38/Ntda3UyHaesoW9TI
   x0tCcILzbTaUOxpEsM7r7zYZ6jm2i37pY4vhY+VQiEFx+/g2+tqBcXWTS
   Q==;
X-CSE-ConnectionGUID: RGTU494NRW2y5vfmQsFAkg==
X-CSE-MsgGUID: 5zgLGNvqT/ugN2HRQ5HlVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="60668533"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="60668533"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 20:52:25 -0700
X-CSE-ConnectionGUID: mzRlsFCkQjyBkXiKuXnWFg==
X-CSE-MsgGUID: V4ykL6FcT76FBIb26c5nYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="139572289"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 20:52:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 20:52:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 20:52:24 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 20:52:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkSfssOyGR0og5bkNh5eEE1h5lwfTjrve1mhohDP1idVxh5qWVaRUQIOqRhRNAo0zAjGhheX3TQE+KRzRq0yiux/Ur/oxjSMKxbdP0Ow7TQktZ+c4WDA0DCNwh1VrSncykVCd3fvDBxhIKCl01ZwLvopbaNgBhEp/oYFlbgjeGELqxytJlKp0/yEa0VwfhvNApy8kJn6ENFhIR53xSgv4MeQVuHvlvxKzgn4XYrjo9PoRDPxbERU3DAbUkaW9FoS/S4tBsoErTAIv42VJbzo6e/B1ehb7SH/bgZw8QfEuO9HzJzJz1k1M1WiNNqUNlH4y2eNRlLvA/p2p1c/f6n3DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jd27nGY+5KvHLaZztpyPbP6IKetTsBT3yeAWLrc68M=;
 b=CtDULODkOKpZkB+wlmG9TepWHoCXoMAMJHpnLQVXHGOz+V5qxGya9DmI6FkrRUbgPxqVu3CdmRTsk3eCT7cfkJn/gY8BLdQmfd8LMGMPAjWPB3B/QFB2SYrckQ2ib8sGuU5jqtjB0E4/Ysa1NgqbXfROHS5Kkf9wMY4h6AdE0LSFbKRPW6udegVjziGdNStn64MQ+j4E8TAjWmjO/1/RC7qFC2AUmQ1nHyuaJMLdgVVsmUb2yNodyod+BUYB4qyOZVRsCHvy7yLgAU7ENsEikkgptq4o9+xsgT6p81ltZk47jVkwoyzxuoeBae0eTqiFXMUzaf5uD3TeeWt5ugSAww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM4PR11MB6068.namprd11.prod.outlook.com (2603:10b6:8:64::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.30; Fri, 16 May 2025 03:52:16 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 03:52:16 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
CC: "jgg@nvidia.com" <jgg@nvidia.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"will@kernel.org" <will@kernel.org>, "bagasdotme@gmail.com"
	<bagasdotme@gmail.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"joro@8bytes.org" <joro@8bytes.org>, "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>, "vdumpa@nvidia.com" <vdumpa@nvidia.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "shuah@kernel.org"
	<shuah@kernel.org>, "jsnitsel@redhat.com" <jsnitsel@redhat.com>,
	"nathan@kernel.org" <nathan@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "Liu, Yi L" <yi.l.liu@intel.com>,
	"mshavit@google.com" <mshavit@google.com>, "praan@google.com"
	<praan@google.com>, "zhangzekun11@huawei.com" <zhangzekun11@huawei.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "mochs@nvidia.com" <mochs@nvidia.com>,
	"alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>, "vasant.hegde@amd.com"
	<vasant.hegde@amd.com>
Subject: RE: [PATCH v4 11/23] iommufd/viommu: Add IOMMUFD_CMD_HW_QUEUE_ALLOC
 ioctl
Thread-Topic: [PATCH v4 11/23] iommufd/viommu: Add IOMMUFD_CMD_HW_QUEUE_ALLOC
 ioctl
Thread-Index: AQHbwI8AVK9WzAglbEaPfz4i9w6907PTP58wgADSFwCAAIWNcIAACXcAgAAIimA=
Date: Fri, 16 May 2025 03:52:16 +0000
Message-ID: <BN9PR11MB5276C2D25DCF30A7367EFD168C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
 <f52937c027e2fd25d76bc47f4965ba46f82c77c0.1746757630.git.nicolinc@nvidia.com>
 <BN9PR11MB52761EF8360BEF5C19C2382F8C90A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aCY2GKfMh6f+vXHj@Asurada-Nvidia>
 <BN9PR11MB52761839AABD5AA55DF3FE118C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <aCauEGCqk5lVikwR@Asurada-Nvidia>
In-Reply-To: <aCauEGCqk5lVikwR@Asurada-Nvidia>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM4PR11MB6068:EE_
x-ms-office365-filtering-correlation-id: 5d61ce58-554c-4708-73ce-08dd942d0cb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?VKlMI5gzDNl3vuG0ETtga2qmQLlGUN2ceA2twS5t9RyfcwBroMwMBp18ho8b?=
 =?us-ascii?Q?Po4fwi4MZjXTp823/4EWgvu3LYlx2eDw6TpPWv6G1NOFCne4DFBR2Foeq1BZ?=
 =?us-ascii?Q?q3SfokNW44tTKi62cMcBHklT8nt/K5sf25STK1Ru3TLamJIsdERqUMbijKB6?=
 =?us-ascii?Q?3+i292K4GYZDd+gjwVqTVDvQIvBO5Re39JfTtY/SrW631rjSN9JEk4K3bW0W?=
 =?us-ascii?Q?Ns8EUvFQJrrgHBrOoZrBc6YFYqJC9VKCd8DwVUZpf/vr1x1tXys61vKDa6Y7?=
 =?us-ascii?Q?hlI1nDwTTd442kINdVdfBXZABez7RyP/TKa9P41VTRCffWNB4+Dh3KehQJet?=
 =?us-ascii?Q?bplsC0oRhGB6iBe85iHBsENwCsIwZ3e1c1SLuwTRC4tFBK290De9x47Mw4xq?=
 =?us-ascii?Q?/d15g7kkrm13GZ+fdNdwXgAgt8aI5o6Ek65DWu9MtvXroGPaghJPuoluCu4S?=
 =?us-ascii?Q?sA5gy1GDOxP468IlsKZPw9UCQiXZxmkpX/QlIe6ODDAZ/OorNmC0TZMMApih?=
 =?us-ascii?Q?J7ru8PadJfRWb6UHuxGbKFQj52vT95lpTzHoboOWubYrEUOXUsPeaFgyT6Su?=
 =?us-ascii?Q?sAHvEH4ZjE6cuxbd4yHq5O2dlmT7P6t/tLbuJ8XHvRnQGVmsBfA0V1vJPkk6?=
 =?us-ascii?Q?ZUrIvl0pOTBorjCXWFvuQtibFvPmk1p0zb9SCzY0KzcxXAusLHdbnwhSc5hi?=
 =?us-ascii?Q?ZeF5d2+ilGRK9Yqw/+sjH+Bb9grVDFijCrThXAEZB+H/v/R6BSf0wWWIcdpR?=
 =?us-ascii?Q?g85TWhM3hmQ25H86QrOhWk7Pij5J/ZAFjREA38B/gpRIBZmFG/NaN5YCBGhO?=
 =?us-ascii?Q?qvVH4JsL7vpep1MyXK+Ubg6OR89yZ/0o7MYICYCskyy/5LLLqKGZ0j5r83vC?=
 =?us-ascii?Q?jSNBZ8eyDFJZQNDlXvA8sAS6Gybybk6B8p4y4AgvqSThvBzy9W7G+oQ5LZcK?=
 =?us-ascii?Q?hvUv5X3bt0j6M6gDwl+e/WPb/EhOR9GdTJt5F7/peZrblguD1j3WSaQJrQ3w?=
 =?us-ascii?Q?v8eIp8h/O46/f9oNmBjMu6+afxgXtWy+zfid/diKZknraYAKq7SjlZAsQySL?=
 =?us-ascii?Q?oP76lgcYZVKpS7c9ePI9DylCJCeupSv/lrcAGE5FuujYHn92exgdjVAr7kIU?=
 =?us-ascii?Q?u+ApCOYKW4X2x8CT/LJbDaqEmAUhQbOKFpWUkhGW/IV70GmNhN4xK2mE4TXw?=
 =?us-ascii?Q?BkLZCBZr5s2oEg7tjVX1zHMvhhdNxaiv4WYS7+NnFbkJN/+8rZc9+puz0EAl?=
 =?us-ascii?Q?ZQ1Zf2fE0CTzUkw8ZV2Y5yCChL/WIxreTzz0NtR+CYb0rNXP88Qn5W2FsaEP?=
 =?us-ascii?Q?il7d3hi5xB8s8tRbFpsd/hghkMunBYwbpPC0a+W54paA1IVtp4PevIU9wTpI?=
 =?us-ascii?Q?OoaiLmTABWZLHBaMxFK6PEibo5c08qn6Ojyo0ANoj8JNLcLKeB+IUtbBNxbl?=
 =?us-ascii?Q?dQEGjaZSA60jZht6pOqUlBaj1fan6DRscrkMbGNAMd+FecMCL7/oVQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AX6pWMw8OJqE0UymkRk5KxDXN5flfI3sDEfy0S/H9wVjUwlBtt1WYzOD5WCX?=
 =?us-ascii?Q?QsJ8yqwUAbZduazOAfRcA4kKZM3cwqr9iWyYaunFbg/bY77rHkFZhiolBDmW?=
 =?us-ascii?Q?QxZKBAsrR1jgg5783nap3Y790NcTOGIBoJMDKx2S0axyOVglKF2qMi4AlMON?=
 =?us-ascii?Q?PThSXYdLdD7GH2a6v2ex2cpxU1euK1AytCv4X3bcLPNvFt4zVpSkGV5o6ZOJ?=
 =?us-ascii?Q?OtD7k6EDwqPja8X5q8NI1QY6iOB8+7pe3PDaqkt8pCzEgo7RXnV50VlgWADw?=
 =?us-ascii?Q?pykHWkixBarBv/yh+BvFASK00UTZd4A4en0CLLcYKpVTAYjBOHn5w3DqM5Bw?=
 =?us-ascii?Q?c7KJacznfrcYpR/UGDqzT/7JOqbf0kOGDGBZCT8/cuzajISIaYpV0uiRDdVW?=
 =?us-ascii?Q?ZCSnX4p9M5TX8blnPVpu/gttUwqMssuxa0yj6PI48bTZ8PSlVBL9hXpV0hQ8?=
 =?us-ascii?Q?vZBY3t/FIWtF2LZ5QtYU67x+zmmtVOX9v0l3ILrjoHu8rL7zmkb1S2k+ezxC?=
 =?us-ascii?Q?abiG1W/aeWffGaaviDgLu0wHHnnYAeaM1Xsgz7/ipwy7v9WcmzCnWkRrW65b?=
 =?us-ascii?Q?Etl7zkUPRW7Z84LRXs8xk9Qqo6SL+y8/1JEyBI6jqcS6hWsCvgCe0sspJ8gp?=
 =?us-ascii?Q?vGUqK2lvYUGf6OlMYdYBRTFR6BlBQZ86jvvrJwVL42yfuKtGBS/BV8BKjW28?=
 =?us-ascii?Q?YeMlyy9ljQtqA3zi6/mNXxumdWupPuNdx8xHtBbipOpHBIwiUQu7UNGAyDs+?=
 =?us-ascii?Q?WyrfpDqdtwdUDBL4pS3UUMug+GRivIb//LL3XPpRspbaVSQ+AkHeReKN2Qkc?=
 =?us-ascii?Q?OYEzmVUlu+FaMuwPeAjvaeoQOff3kHAAtVM53bOolC9T6FN/diCInYMDzf8d?=
 =?us-ascii?Q?9rYF3zzfDqKUSo7ori5Xlx5npg7CeFJ0rgFl6EpTgnSPL8bJrYFEcYLgaBv8?=
 =?us-ascii?Q?+o7wcwFivRnJGTQ6LaIcwxo42wom2kBQ2bt3yvf185zcA9UVYTUPCoYWs3Mh?=
 =?us-ascii?Q?waBFXMS3qISw6gsBNjCVF3SeqB+LQht4FdzVwUfbNtTuDDuIKo0Z2wTHzfwJ?=
 =?us-ascii?Q?aS+2K8Hi1VdWKE+M58Sy0klz4cs/ZrgDhP6p8r5vrwHNbfwriP22nBJ2QY8Y?=
 =?us-ascii?Q?9rwf+3E6WRP+o5w8gGtc8oHlpPu5LbbAgRrPm2ixaCIGApcyQS2LdnW5t3Gl?=
 =?us-ascii?Q?439N1fLeo3oZaMVmrgMzU9sCHVIH56Twjc56m3OMEUVM2UeJaKfIPlBNul29?=
 =?us-ascii?Q?K/tXw713a6anaL0/6p9B1MS0jXES8CXLJi5ZlAguIx4ujojL/HfV1NIJj9qR?=
 =?us-ascii?Q?U1TzvMYu/sQxpgKwz4qJ8nT3XSOKEjisyt+x3BcBXG/E4EcZBXIVD2p0BEFL?=
 =?us-ascii?Q?piHYsdgKV+bt+1p4C6MyILsZMRWy5AJQadV2VyIv16c+CWdWjqBOxWZ/Wq0n?=
 =?us-ascii?Q?NZI2Bft2WHoiNuZ4hTwPytuRBfuxD9oF6pkkYCqb3bwK82z4DpsrBRZS97VC?=
 =?us-ascii?Q?1x2RW9eINp1Udg9finZ3vbfK4B2vhf31eWR701OoBVGaq0O+j+8t+82zFPyy?=
 =?us-ascii?Q?3VqlSN606cXdX7sCEs/nmmyzgCketDB4AApaY1YB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d61ce58-554c-4708-73ce-08dd942d0cb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 03:52:16.3206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tsExRFP3tsuI3p6G2onOFmI5lThFf+5zGuLVZ9j175hnzVfvzjiYoyaqWAnRmaO5xqizjHeR/Ri+AKpNd3GBTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6068
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_205227_779179_F9FAAB92 
X-CRM114-Status: GOOD (  32.04  )
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

> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Friday, May 16, 2025 11:17 AM
>=20
> On Fri, May 16, 2025 at 02:49:44AM +0000, Tian, Kevin wrote:
> > > From: Nicolin Chen <nicolinc@nvidia.com>
> > > Sent: Friday, May 16, 2025 2:45 AM
> > >
> > > On Thu, May 15, 2025 at 06:30:27AM +0000, Tian, Kevin wrote:
> > > > > From: Nicolin Chen <nicolinc@nvidia.com>
> > > > > Sent: Friday, May 9, 2025 11:03 AM
> > > > >
> > > > > +
> > > > > +/**
> > > > > + * struct iommu_hw_queue_alloc - ioctl(IOMMU_HW_QUEUE_ALLOC)
> > > > > + * @size: sizeof(struct iommu_hw_queue_alloc)
> > > > > + * @flags: Must be 0
> > > > > + * @viommu_id: Virtual IOMMU ID to associate the HW queue with
> > > > > + * @type: One of enum iommu_hw_queue_type
> > > > > + * @index: The logical index to the HW queue per virtual IOMMU f=
or
> a
> > > > > multi-queue
> > > > > + *         model
> > > >
> > > > I'm thinking of an alternative way w/o having the user to assign in=
dex
> > > > and allowing the driver to poke object dependency (next patch).
> > > >
> > > > Let's say the index is internally assigned by the driver. so this c=
md is
> > > > just for allowing a hw queue and it's the driver to decide the allo=
cation
> > > > policy, e.g. in ascending order.
> > > >
> > > > Introduce a new flag in viommu_ops to indicate to core that the
> > > > new hw queue should hold a reference to the previous hw queue.
> > > >
> > > > core maintains a last_queue field in viommu. Upon success return
> > > > from @hw_queue_alloc() the core increments the users refcnt of
> > > > last_queue, records the dependency in iommufd_hw_queue struct,
> > > > and update viommu->last_queue.
> > > >
> > > > Then the destroy order is naturally guaranteed.
> > >
> > > I have thought about that too. It's nice that the core can easily
> > > maintain the dependency for the driver.
> > >
> > > But there would still need an out_index to mark each dynamically
> > > allocated queue. So VMM would know where it should map the queue.
> > >
> > > For example, if VMM wants to allocate a queue at its own index=3D1
> > > without allocating index=3D0 first, kernel cannot fail that as VMM
> > > doesn't provide the index. The only way left for kernel would be
> > > to output the allocated queue with index=3D0 and then wish VMM can
> > > validate it, which doesn't sound safe..
> > >
> >
> > VMM's index is virtual which could be mapped to whatever queue
> > object created at its own disposal.
> >
> > the uAPI just requires VMM to remember a sequential list of  allocated
> > queue objects and destroy them in reverse order of allocation, instead
> > of in the reverse order of virtual indexes.
>=20
> But that's not going to work for VCMDQ.
>=20
> VINTF mmaps only a single page that controls multiple queues. And
> all queues have to be mapped correctly between HW and VM indexes.
> Otherwise, it won't work if VMM maps:
>=20
> HW-level VINTF1 LVCMDQ0 <=3D=3D> VM-level VINTF0 LVCMDQ1
> HW-level VINTF1 LVCMDQ1 <=3D=3D> VM-level VINTF0 LVCMDQ0
>=20
> So, one way or another, kernel has to ensure the static mappings
> of the indexes. And I think it's safer in the way that VMM tells
> what index to allocate..
>=20

Okay, that's a valid point.

But hey, we are already adding various restrictions to the uAPI
about dependency, contiguity, etc. which the VMM should conform
to. What hurts if we further say that the VMM should allocate
virtual index in an ascending order along with hw queue allocation?

