Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B361ECFA478
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 07:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NFOyOBJmnhmx9Pf4OtTtJIyUUvqfCFlnRx/UlNfSZg=; b=HGdRV4QrqCJ2B9fDiBOrCe/sMk
	bJoDlKEhh0TD3dmxkRwAFxI2x/95Mx5a90NcZQ4nXi0cK9jDpZSqkQTHBilxgoOcaR7sF+fs/7Tqv
	FNx/UNyNUvi69e9AuMTGvM16P81VT+AdTYT79mLeYe9I65nVA552Pf/hhdKCjQ9bd9T6z3GLgHFGc
	FhxwNiTFVsdn3nAYFYSSp8rceStZf/BKDksjPu0fxY6F/WYh8V6NvaZg5JLTvdiJR0RP4ItLmISRw
	koL6y/kz5C4Z6YHyAhZtIqg5zQUFZVxEWlERCbm7Jccr0B0/2PRZfCchOu2CioZomxOVRYjdXs4Gd
	GlsZnBEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMM3S-000000080ng-3nKZ;
	Fri, 21 Nov 2025 07:59:42 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMM3Q-000000080mt-1zcf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 07:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763711980; x=1795247980;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h+KcXIu9rEFdF4UBArUNoijf9e8APwAaJ0fLm9ARR1k=;
  b=ldL473gWQP21ZhRnPPO6T8B7mg69h/VVpHJR9ogNzy7+cwPU+dMQ4UXg
   AcHCp8AE7xDm1VkAsRx48/4LzHZpYPmHNqasifjI1bl6vHQqCYPdublKL
   8Y/lLrrBfz01Rv3QAsReqPbBGbKGHjxdOufcdFpGZXtvzAWOooKy0jZvK
   FmRohIu5yO2vewVvD76N2wg3tJiKFHiPfuY4hxXNH93wcn5Kx+E/mrlaX
   zehNUXxU9Y4O8o0y4Pr6SUT5vVageypsCrtufYiV/S5Q0lPWezAtb5Qke
   RD2L+7ASdsWziwhhuojvnqcyFeZjXJ2RM9cina2eHpmK9wbd5qdkBO2NE
   Q==;
X-CSE-ConnectionGUID: /6aaU/2ORBiYZNlgUkOQVg==
X-CSE-MsgGUID: cudRvBkARGaaFWHF+z9WiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="53373019"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="53373019"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 23:59:40 -0800
X-CSE-ConnectionGUID: ycA15y9eRsqTzP6tfbieAQ==
X-CSE-MsgGUID: 0x9ZzMVfRgatxx4KNkf4ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="192081347"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 23:59:40 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 23:59:39 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 23:59:39 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 23:59:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWmHNmjyDuW4Z1dPmpP2KV4l9OAJztHzdb5i5+hhjCaelTLv9CK0TT0junnNO9++SyDwtK/dB6Pjnz0/VwKFV9vvX+Ngu4BUFlvzdQalKTerepYeMuycJFpc+O0Q05yFLpIN6EVys7oWc9SpO8+YR7ClLUzik20cRjY02NEDyX9j823WCATkfzVHn7mWhmCbpc/UZNB2MFKtXbEFo/wT4W48NsFqX/h0yShCu7hul5FYAQ1i62RgHLOJe1/xx7AnI+OQF9F5hfc28yzzJxKuCUK3UFJxQegvLzZW3TlbFKwnX4QL/r/Y7O8D9Sz4JTa/l2ka5zRDN2Vo6iRutT1j9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NFOyOBJmnhmx9Pf4OtTtJIyUUvqfCFlnRx/UlNfSZg=;
 b=fdatzkKkwPZ7K5L3gdY8ruARJFAqQff8tSsqW9CqCtMKy9gQ2SF0G3LVf7RGIiJDGxmoOtinid9JYGutk4nkLopiJWHzHZWWpG7473qWSlWb6CBnQ0ffTQ8aCax7GPrvrzeQ9k8KTKkmzn0U8L1PSpJ4SlevXrSeh43seH5VObrcLF494eOcEyjd62fG6qv5xWyCxiiRU92eTN7nkJkaLIGVXFZAEuy4Mff2yy+Q3J+xFdTYSpxaaO//3a0dOV/xCINL0I/4v22uRvXBT2YipjZTu2O0gbfKiawfw8yM1kRiy5OiQYc+mRfs7c3BJH1ypxBhel0Ar45khCK4nPULVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MW4PR11MB7031.namprd11.prod.outlook.com (2603:10b6:303:22c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 07:59:36 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 07:59:36 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"afael@kernel.org" <afael@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "alex@shazbot.org" <alex@shazbot.org>,
	"jgg@nvidia.com" <jgg@nvidia.com>
CC: "will@kernel.org" <will@kernel.org>, "lenb@kernel.org" <lenb@kernel.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>, "Jaroszynski, Piotr"
	<pjaroszynski@nvidia.com>, "Sethi, Vikram" <vsethi@nvidia.com>,
	"helgaas@kernel.org" <helgaas@kernel.org>, "etzhao1900@gmail.com"
	<etzhao1900@gmail.com>
Subject: RE: [PATCH v6 5/5] PCI: Suspend iommu function prior to resetting a
 device
Thread-Topic: [PATCH v6 5/5] PCI: Suspend iommu function prior to resetting a
 device
Thread-Index: AQHcWO7jc0OFm26Gq02eZzZpNDi/+rT8x5+w
Date: Fri, 21 Nov 2025 07:59:36 +0000
Message-ID: <BN9PR11MB527606B1150A36D5E3F6E03D8CD5A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1763512374.git.nicolinc@nvidia.com>
 <9f6caaedc278fe057aacb813d94f44a93d8cab3c.1763512374.git.nicolinc@nvidia.com>
In-Reply-To: <9f6caaedc278fe057aacb813d94f44a93d8cab3c.1763512374.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MW4PR11MB7031:EE_
x-ms-office365-filtering-correlation-id: da9486ad-fbfe-4a32-c67c-08de28d3ea37
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?nK14XPdpbAJXGX1CHcxl+bpsfLjZZ1LmB5sEKtWMhAVNFv6oU03/+yTviWRM?=
 =?us-ascii?Q?Bi+CI1A0djuCBBopolDIGBtsMoedqxwdjjM+j1jeEZ5cqdub3QsepQYIgBWw?=
 =?us-ascii?Q?0PUd9nfHboaMgiOAWfkFSl803bBhTcFB//92hLpQOgqMy1Rp+OK5Vm61nzbr?=
 =?us-ascii?Q?xI44292GUXzKG3y62rf2hU6+0qrRKNETa5y+x4JIwmg/PdxnP9h/7pS1/c1x?=
 =?us-ascii?Q?yjnfuxzkPNPPy7J4zNDFrrlr9868mYU4aOgs3kR2xyMqNAcimZcmimvEUGZ3?=
 =?us-ascii?Q?d08EGXDa/tASbUPOTqw2GI5MdEnnK/P16H/lSRq1Z3SmPD0d9sZuDAQqXnr4?=
 =?us-ascii?Q?0VHGCiNETD1w3Rueefw22WE2R/BgMTH15ZUPnXgeaDFkDmt4jCtzW/AwcgY2?=
 =?us-ascii?Q?TryKPUQwpMNq3qVB87jB/5oIcjpRDY5qtLjnuZVhjZY6yCdln8ngxv5lTm5A?=
 =?us-ascii?Q?/iddyV6PSUnL/v5a5V9tHXwfg+niokGoGt525JIVcMn39qmGS+orixOKw3Va?=
 =?us-ascii?Q?ZbRUDNxItgIW/DF2vdXXKqAiSWnkaAd9np+0zyd8OnrJmaJgvG9BdJi388kc?=
 =?us-ascii?Q?42lVJMVtqh7FEzGO3nxGZT2Xo9ryxpZmTOb749soxb0GdEELUhlzpBdGPEve?=
 =?us-ascii?Q?0O2B26dzwwzHpJaFgLEyuEJTb1Jbnt55vt3C9kf/vDRw2gFiubd7nLnOftFt?=
 =?us-ascii?Q?dd6DBw1bdPjYm2EGAnVNvqAnR0yWhfZCMKvNiQV8DB9F/4VHx6lsTkFA5O2A?=
 =?us-ascii?Q?lvZBR/v4uYM5wsA1OAiYiacGgS/uk/WT1zXWqqzF6vIPwLfbZ2Z7sfTqo/R9?=
 =?us-ascii?Q?Y3I/bIKvSmEBCyblJ2Qi5A+wmyhDGoCPo4kcvKr+/5PLXsHToJCRcoS9+HOP?=
 =?us-ascii?Q?Fmx6ttAFbgR0ofSVEVsH/b73OT5w98U0Gv0Fm04Njb8OAkQNkzAh6phTLB6K?=
 =?us-ascii?Q?rPN7vB16AX2WFIWF6xo9r6nQQJJUjZEEDr70L40YI7RMe3f5RwA2fLHQslI4?=
 =?us-ascii?Q?Sbgiv6JVTYG0Q/gEnwdtkXcvgH1yX9QmpC8Ku/L2+FDU4lGLToodT1RZuNa3?=
 =?us-ascii?Q?EriZOAFdKeMUmHlOL2t0mzy9v9ruoaLI1ycWQHmG2ixc9b7JlAvRnOlxxg0m?=
 =?us-ascii?Q?MKXQJBa6EmNf70gS2q+Hq3bvF+AxIPdMtwS5sb6iy/UKPVW4TY6gZbRqyjG3?=
 =?us-ascii?Q?b+VFqRpQc1t04sk1HzZa7q4aV6yxjftXvrDuti8aTibRJ1WfD3ekD60wYCi7?=
 =?us-ascii?Q?dzVtE2jRW37BVPKn+L5SnAErsNmLRvk4fjAVdQ7dAaK6CRZeYP7yWUECISkL?=
 =?us-ascii?Q?10vJyklvdOkvGoAUCgPQDIkWUGT3DxgcStJtPVuCGBg9Vtq1igSItmCEWCRO?=
 =?us-ascii?Q?2yTtbMi3X5XphPHux91T4xsAKsNYKZ7Fxnd3+DwqiOoP4NAXkwCP5R5vcKUd?=
 =?us-ascii?Q?RkbGLY6w+99snpRsZ3b2x2InA9nDGK0n4WB8qlvVI72EtAlxAkfRBLoMHjjx?=
 =?us-ascii?Q?YEwYPejvx+4MyQXmjFdeRk5iR3RBhgBfPCWS?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nCSk+JBqhj/lZiSOddddpqO0BrRlDbTegGkJT3rLRlOvGJlLhVlmSuO3sVQ2?=
 =?us-ascii?Q?NxWChQQfvE2JKYok87x77Af7Qdu7nhyX0/6KNIbQ095PtlmQaOtg+P6Skh0i?=
 =?us-ascii?Q?qTRFIyvuFric/v7EkTZRa33l/DhNgLeEPZmbSDQzckD1eTr+BUNAHP9WC708?=
 =?us-ascii?Q?D9AMYJTW93EA5G6tUy8z/eANaKOxQNJ/RanY6XhC9mGCac9G4fGNpJM0nFSU?=
 =?us-ascii?Q?qQj+K3VoPnp77VT5J17QJrWzueI1qgbA5gZ2kIRlD3ftnk6ZvpK/THl+U7dg?=
 =?us-ascii?Q?1KgLS+A3ezu8hDBcT4tQa+pAWhFGEgIXYdrwBnfK05TXC3nn+/HbGTtEJlE8?=
 =?us-ascii?Q?Y7Uj3rUv7+uH4tkN+cNJ5rrjKnhJvgf9yCppic7iXbmn3Jz0EuuYnNiUIogQ?=
 =?us-ascii?Q?f4m94FdH1oNjm3QLJiWleQQ5AfECioRHjlGIx0A6U/SYttV+9wRK2+vv8sKM?=
 =?us-ascii?Q?8SlwIS7/U9gx0fx65ktqRRLZUQZBiela5TR4rwiAWPz7BK7L20KAFwqXKuCx?=
 =?us-ascii?Q?I0r1/3O9rfFhfA7ehagKibEMii800TfbIBb1pS++Ie2IP4LZgOe8Aocw/LAI?=
 =?us-ascii?Q?6Id2r6YqgNr8/NK4nJEeZlgSJG+XEzQY8/4Gj/pcdSW5udFtgXj557xdNjI0?=
 =?us-ascii?Q?iSw4rv3cFPVdhxloU+aMPt6tujgyylgahuhW4iaoDZCGLdYqEmD1IugeIopi?=
 =?us-ascii?Q?eBg6kWU9w3Ccp24fhVqaX8N+TBTAOphzyiT8WLwjVh7DCuJH21wLRx30XQRB?=
 =?us-ascii?Q?xQgkJinP5hzyn9ExrsBzUg08fzkNCo1sghBj1qHAL/cc8WfktJUpcLbc6gnd?=
 =?us-ascii?Q?fr/GhHo2anAzxrD8tNZV+ic5MwXYr7vXkJzNxM83KMDvTFPXRtnfLyE6rGHy?=
 =?us-ascii?Q?X1YgzSxMj+PPDOPqs+N6e1gbwnq/Rh/g9El+itHqdrJp6TCpE8mmvRJYQN+G?=
 =?us-ascii?Q?uYF9pR3TzdWp5sVUJUihJozouRbn+iy1V/7ESmdWvwyx5mEdI7EfXfpVuYtB?=
 =?us-ascii?Q?lI1NvNOG1zc9hB+wv9Bik64pRFtluajXCl/cpaOWJ+XcMkcaajgFDGC4syth?=
 =?us-ascii?Q?zH9n4nSaqnqlsFNmcD821P1NyVonjhfJRqHFGcu+St+dANCVL+JGlK+tNro4?=
 =?us-ascii?Q?OvC22ZL4276/CpUQLs11501aY5H5/lfGvpTnLDN5X/VWL/cPX+217nNdNdxU?=
 =?us-ascii?Q?/mEW6NeJof87V1eVIOdTMHWzNE9kpE4ExM4zKWObdmOpyI8/k308Y373Z6pJ?=
 =?us-ascii?Q?f02wC8fxFp0JUabcEqCPmL9WEiKiXzRLRCs2WZhduOvgbXBjAKAXt60xOPA8?=
 =?us-ascii?Q?57B+b1rkyG4kH9QEOuwl5jwnnvychPfppfikjtA3kULnPFwd+cYqcEuf1Knw?=
 =?us-ascii?Q?MbJp5WPHIX0EeCac6pJNt5TAu86ySrA2GsiVDAoMxtSYShuVWzCvLTl8LpZ0?=
 =?us-ascii?Q?A6dlcg5ci+FBHsqPOIeB3lWfc7+V/ZTs5dKWtJivxxaN03VzODrv0oxMGRHv?=
 =?us-ascii?Q?qXpu07uX1YBlM5/0whjkI4fk005WJ7NGSQF1q0WmQoFIIWL6pNSxnQzlt4KL?=
 =?us-ascii?Q?hBjmBPWqQ7qXRRhfFwNtjevhDvjT5YfQCeLSKITL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da9486ad-fbfe-4a32-c67c-08de28d3ea37
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 07:59:36.5792
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vBPd+Q523u6IbDu/J2UnIGXcYvIBD1mjgeOtPEg658WaWXsNa0zehjAMuAbbRsOZmoUGZZfH4KgHpWc4DUebVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7031
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_235940_534907_DFCD7D32 
X-CRM114-Status: GOOD (  13.52  )
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
> Sent: Wednesday, November 19, 2025 8:52 AM
>=20
> PCIe permits a device to ignore ATS invalidation TLPs while processing a
> reset. This creates a problem visible to the OS where an ATS invalidation
> command will time out: e.g. an SVA domain will have no coordination with =
a
> reset event and can racily issue ATS invalidations to a resetting device.
>=20
> The PCIe r6.0, sec 10.3.1 IMPLEMENTATION NOTE recommends SW to
> disable and
> block ATS before initiating a Function Level Reset. It also mentions that
> other reset methods could have the same vulnerability as well.
>=20
> The IOMMU subsystem provides pci_dev_reset_iommu_prepare/done()
> callback
> helpers for this matter. Use them in all the existing reset functions.
>=20
> This will attach the device to its iommu_group->blocking_domain during th=
e
> device reset, so as to allow IOMMU driver to:
>  - invoke pci_disable_ats() and pci_enable_ats(), if necessary
>  - wait for all ATS invalidations to complete
>  - stop issuing new ATS invalidations
>  - fence any incoming ATS queries
>=20
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

