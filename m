Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06AAC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 01:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90fehQy5Z8AqQRqWp+91DuACeGP3sq3xvVNS9opXIV8=; b=EkQehaCJYLCYGFSIxL/vRStoky
	RGrj//oeAvXEisucMBN8E9w3vri/AlVlTCa1rxOtg4GvmNyoKrE5DfOYPSfE24nfGhp6IOLJw7ygI
	xXjjWFPvqePSbaXZP4/YbU2QEJwqILIuO9wQq8or2xujj1muPa4dZaZmXJvXy17EylwifNIsVdCfr
	90lBjabncYNQo3DS0se4F92NMbfOvK8Zt3w2f9VWNkeGnJmh/CYzryBJdFhXtzl67SxjQjdENqHGb
	zTX+hDD54/vd7GwPyshz2GlgicmcQtoIiBm1VXkzv3USHlZxQGsz/8Tw39H7JEnFBf1gh0n+jWZNN
	qitc7nWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugvXz-00000000RwC-0riz;
	Wed, 30 Jul 2025 01:23:59 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugvVU-00000000Rjy-38Xi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 01:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753838485; x=1785374485;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Ite4oTr+fC4wY8qlxqwedIpruxtI5rXkuwiwj4FS8bg=;
  b=LPmB8+kzYHK61MmWSn1cU/r1g0LwgUW0aj24PCx6AUl5PAYra5dKMRtg
   QwQIiTgAkXqOrNt10Er0u768+e1wtJre0EAer4vNtAT2T97nDnKLh2ump
   7g4KGYSrwNe6kti9BHfNtZyMHEVM/kR94rifAT9u2jEHVDhPB7RXErjFT
   JurQJascD2Bs4dV6uYKtPC9zd23QbqaCsr1OO6G0NB3hKttSDbAsdTm1T
   Ah7hx+PzNvNYModo5B3uBCmG0/UD56oDaH5ITW8ruFMTGy76c2SdB6NJQ
   zsgY9iA+WZmKTlu79DnKD8UoL9zHCh2nAL2VDcQdoKGXY2wNQ2+iK84l0
   A==;
X-CSE-ConnectionGUID: uTzz3PiKRgWSy4eWVrMdfQ==
X-CSE-MsgGUID: vFIam1fjTXu9XeAT+RQEDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56278597"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56278597"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 18:21:18 -0700
X-CSE-ConnectionGUID: 1JGBRA9nRcyMx9wxqCfCsg==
X-CSE-MsgGUID: 5oX8o34OTNuDJbZjTvQmFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="167031156"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 18:21:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 18:21:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 18:21:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.79) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 29 Jul 2025 18:21:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUs5vrkyHx1Y7kt1yXHzeMYXs2RkhMfRX7bzapDwCavAU+9tcAH53lbLQZGTX0YVlP86T/opV2bkFdHT7ZqzsDYIfoef83OYgeo0LPs1/HpyauDu/M3Dkr5B7H8TGdkbbfKz1dWGtU5t1dP+ozczrnMXqOyiTIlOQFYdpDskeTxrRl7irX0Y8bwY3GertzmG2rscZH6KmfQ5LNmQqhCVkL254F4hqA4SkGCC09AEhJC3XisUyfCLXUGXePMCmQas6Y2iEZ69tCzCcZ9yIwMyFrFkTC9hf4NTyIsB7t4h9HPxMUacGeNxvXBsq1fWfN01imlaOe/rXHbxtQuA+ATxnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90fehQy5Z8AqQRqWp+91DuACeGP3sq3xvVNS9opXIV8=;
 b=dOO7gDTWV5G4DQ8Pywk/WRtedqFUqUbShfBCCNfE6WScNIXwWfT8FCq2pF/pD/+erxt9e9U0osucAc0XcDfiaHdN0mkWXZOtP7kxhOLxyz3UDxGXi48qi7LjLJiF14QJkgi9jydMAdYOqiTcUg1+2cyLrtuLFYBblrMtrC/LbDswhQPpQ2KwQdJ3qAWASCsZdPhnQOKdzhYYF2HPHUowu5HNaElABYoE/Rncy4owOG8Y+5bMeFHKMhZ6Mx8FixhwRFSunNhC7MV3Bj7rGEKuBmuBNsVQCFeoMkWiBqw3MPj+DeOnq6s8suJiyQsKv0rTDSPHl3IWprdavLYIV19iZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
 by IA1PR11MB7680.namprd11.prod.outlook.com (2603:10b6:208:3fb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 01:21:09 +0000
Received: from CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::cfad:add4:daad:fb9b]) by CH3PR11MB8660.namprd11.prod.outlook.com
 ([fe80::cfad:add4:daad:fb9b%4]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 01:21:09 +0000
Date: Wed, 30 Jul 2025 09:20:57 +0800
From: Chao Gao <chao.gao@intel.com>
To: Sean Christopherson <seanjc@google.com>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
	Vishal Annapurve <vannapurve@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Nikolay Borisov
	<nik.borisov@suse.com>
Subject: Re: [PATCH 3/5] KVM: Reject ioctls only if the VM is bugged, not
 simply marked dead
Message-ID: <aIlzeT+yFG2Tvb3/@intel.com>
References: <20250729193341.621487-1-seanjc@google.com>
 <20250729193341.621487-4-seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250729193341.621487-4-seanjc@google.com>
X-ClientProxiedBy: SI2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::9)
 To CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8660:EE_|IA1PR11MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f82b91e-f751-471b-9570-08ddcf075cdc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kHYVRsM8J2aWmWsZX1p5zKLDqREMGY1WezjknFDqpHcvGZpG42JQOcM59O08?=
 =?us-ascii?Q?MmS7Mj0no24VgQ4G0hzbJqko+u+teZqF8qpBiAi/X5YYsRNF4pjNIYQbR406?=
 =?us-ascii?Q?vIUmbLdtFSk9RfRF7dUWG+jL5zTtbJd0irpde1Rfe8bRZn7ajOBMUtRd02tB?=
 =?us-ascii?Q?2jHtcogLrzFf32y/fkcxmCIH8oM7Q6LaUBgOe7lzoKW7L8UMlyNYmKtgl7MW?=
 =?us-ascii?Q?Dq2+it7jGpDvitBslM9HJ3a5NN0/lNbLOJ7BH+kzKAE7vULBHTp/cz4hoMl+?=
 =?us-ascii?Q?w6IOoJJsHviUUZ47o2oBdEqoBMmIVr5B7WjOhSp1PbN2QT3NKDE4oAQzgT1Q?=
 =?us-ascii?Q?nKbMyifoowE3ALnv90otaC1J4aQf7OOvfiOz4WhUMmMkzk8ZC6SssIAePcM3?=
 =?us-ascii?Q?u91KjzClg7ZdisyV93o6hWzFKaaJHQc41tlKWAtqKkS5mhVxu2Zoo5runEtk?=
 =?us-ascii?Q?PE/0Oz/rfoBlR21bl+qxf/GbmgzNJBmVE4Gj6Lpprk5ujTi75Tup9IWF1K+i?=
 =?us-ascii?Q?y92piQ6x0fGMykKGUdfuDHPy96qhGX5wBCTz6e9AOhMT78OuFWuziYJcTr7/?=
 =?us-ascii?Q?iBSrIFb0abphUbWjeSjwIEcG8CuiQeUKV0UF+uA7BsnT2hOXA7DcpeGktbBu?=
 =?us-ascii?Q?g8Ur40nczDcsNjXIdI+YASYoGnzs66N3i8e0yzK3k6+Ikh2L66acpL+1NUF9?=
 =?us-ascii?Q?hwH8IXYviIEVNblXdBZrGE3M5dCtfcgaSdPRcmLUhN8RIXcq2JSRKg99xhtP?=
 =?us-ascii?Q?YZvPPzYCQk3sowkAQgGbM1dkD47X5iCbfwvsZdkUFHV8OJ4IsheRvKasB5dJ?=
 =?us-ascii?Q?YrSAmRIGfb3cS6/+qWsY76cERvvMl4mGOKaff0GZi0lokJIKR6akS5oDDBKm?=
 =?us-ascii?Q?FsDjj7UtM6AGH3DxX/l1synqHt/gfUUp7r+2+vzwUzDTxWy+kwL2hzwJdjm9?=
 =?us-ascii?Q?CO9T91f1qq/J2XWV/UaqPpsOHdtn6L9RaG1k8XQZ1xiY3zLtYJ9d/h7+jP2h?=
 =?us-ascii?Q?tmV8UsqzVzpf8sLFpclott3ZLsKV7d8mWk39dQbtw2DW04ZsIQFImS8pUNNs?=
 =?us-ascii?Q?GuE8uOgVxeUqfFzF5iOUNE+6pDaneRwYYtZAE2aTH140vZpMWXiLb0U5Nbp2?=
 =?us-ascii?Q?1477JTPbwUGmr0TM1d66foFJ5an0ZsNdWu64MeLq3wJDPFSxaJC6D8pdlBOt?=
 =?us-ascii?Q?L4SNKlxtyjQsltPlVducOm1VehtW4pA39ksmqBzyA5EchFQgIbzwiM0nKZDr?=
 =?us-ascii?Q?XkBbcfYXe9KX9fe5f+D7hih247Y7u8FzupteQDWLEzw3V9zHAI2agoYBR23C?=
 =?us-ascii?Q?TTTeleoZ2jweuIZE+DauaCyRfjOjGgP0uRqDqpTWNcRnGphatzDdfBrJ/G7v?=
 =?us-ascii?Q?/t+7mqPbIRncc7jDd6XlkRnXRBr7Luo05/v958/Q4gZjHJo34Ed02S9nxDoI?=
 =?us-ascii?Q?yC3nP9aEodI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NVx0tgdGkhHltf6LUDunFbvMPwtXeN0KsjfgjHcT/7KDhXGecZ9xKOzV113M?=
 =?us-ascii?Q?7QuXmoFP3YHeuSHBUoR4IIYVdr+nZYYpcMiXvGpvZ2h0ueF3IBYaHJDj94Rq?=
 =?us-ascii?Q?OLdk+4O64m9LgHLx2otwc3VJLso03fhmJ7gEk65UVmb5qokuaC87F/377MFa?=
 =?us-ascii?Q?kKf+Aq3Pgx8/m5Z0NSPk3BxkSSUAJ3fxs9qmw7WLCwxqhQ+tGxt530li2J2C?=
 =?us-ascii?Q?Ky3DAyYMBO2qXtfxlRXyb56Wtiv3SV9rU78UvcIqebEqRcjGPKDjn7rHeLt4?=
 =?us-ascii?Q?1ypaM3I+OCHyZIawecXFDF2nc/R+yeK5YGBUMeHRz9SdTTSeCHVp047IF7vC?=
 =?us-ascii?Q?FAXnU5HNs8hf0MDMae56xERaoV6t5Djv6clWnQnJD6U58NVP91KJkKSymOko?=
 =?us-ascii?Q?sKDYQb+qeOncY1rlgtXODS74IiMlYO2gA4tlpC96KAZmJwzChc/rDgemehmK?=
 =?us-ascii?Q?D3+4qkUNeFZJI6FRno4B7CakpRRL2dtCIS5ajtO2jQSgL9UA72gWRUyzgk+9?=
 =?us-ascii?Q?sQwiT4erYpmW5ThCvha5/tLH9DNmqXhm7KvIyp4zZbhp1o40IJAmnaysj/7x?=
 =?us-ascii?Q?RoLiDnGmnve1FXjTngSwxUa62CuUbbFW2rchLw3iFM/RDTWREP3EQ/ISbJoZ?=
 =?us-ascii?Q?Bd6ofTdGe8RmF5pt/g+n1odHHsFQ/AQFVhArh9+fdSd50lH5yiClWfeWsktF?=
 =?us-ascii?Q?t6CilFoSU4342m1dP6XAeDcRA+UWXm3x2YeF/wClIGZEkxy6y2Zt0bFQRg+L?=
 =?us-ascii?Q?NvSPGV1qv8P4AB1xBlenRzaJ/jH2yuh16rWGwXIgHS599BsnqUS/JMQFnrLL?=
 =?us-ascii?Q?ejaXAGk+znaYZwo3BhhG75/fgZksemd0w9BlzwpaeOXocAd/dO1YX7dBhcQT?=
 =?us-ascii?Q?nCFo+CPpyJ/PPXaV1zFyC/rteaoO+qSHl9JT88WdpoFT5PUxiZvCJd6Yumlb?=
 =?us-ascii?Q?JVQtRHU5IOunlGesmR8paW/BoCOZtEq5w8NP3tTV9y5h3jtBNTMm07Glkynr?=
 =?us-ascii?Q?B8W78ydBO3JNMQTDFKgEYwByQPSpZk0n4yQYAk5qN0pE13NI6Zl66skWHrWf?=
 =?us-ascii?Q?uljJE9acDTjUEVLU+Ri7bVkM3knGX/kvQoxa+2FEVrowh8Yq3nxk3QRFgO1I?=
 =?us-ascii?Q?6Jka9I8xH2GsefbmVpc9r6IntlKf088U9STlGuj1mW2oajxy3ku/vW12S2AI?=
 =?us-ascii?Q?p8agpdbqxtCoLbcBiG0An5sPnhz0nQNnlMgAUPUAb9cHu2D6PCA4pgHupHaZ?=
 =?us-ascii?Q?QIh7LxFre74ywzHCTIpQCLqoX8ORSlGRU7NUa6MJp3m0BvazmCEq+qxL79NY?=
 =?us-ascii?Q?RnpCFWRWxvRBjRUinp3Q6LC6TF11LSU+BcC/sm47pEEMfvGf8TMYdkY9zDtJ?=
 =?us-ascii?Q?2TWJJjqO2ytXOYpgcZ+NzR3vuZP8D2H0gXhbtJzuueGd3doskrWETHAiligM?=
 =?us-ascii?Q?xmTWJjok8zSSn+fbaQ8x3gnD4Dsf8VIli3bengz2l6UUyUbbGbFGb13Sf2c6?=
 =?us-ascii?Q?OIqsYyXXM5DZHOfW5olvz3kMsCLPpTH+nK+SQzLHDEriKceVAE1OmxUOufdG?=
 =?us-ascii?Q?yRd34lP47A+4S5kbQRQHQlR4c1g5Ln9iQtqVfHaj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f82b91e-f751-471b-9570-08ddcf075cdc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 01:21:09.0017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Ak8iO49AxWOZFakD6b5kdQtfr01kRHSrkTiBZhNO8DKaCkVQLpkxB/gDB/VS4wkXiw0uX+adA4XaujMuDnVgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7680
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_182124_862977_83381B9D 
X-CRM114-Status: UNSURE (   9.58  )
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

On Tue, Jul 29, 2025 at 12:33:38PM -0700, Sean Christopherson wrote:
>Relax the protection against interacting with a buggy KVM to only reject
>ioctls if the VM is bugged, i.e. allow userspace to invoke ioctls if KVM
>deliberately terminated the VM.  Drop kvm.vm_dead as there are no longer
>any readers, and KVM shouldn't rely on vm_dead for functional correctness.
>The only functional guarantees provided by kvm_vm_dead() come by way of
>KVM_REQ_VM_DEAD, which ensures that vCPU won't re-enter the guest.

If ioctls are allowed for dead VMs, would it be possible for userspace to
create a new vCPU and attempt to enter a dead VM? is this something KVM
should prevent?

>
>Practically speaking, this only affects x86, which uses kvm_vm_dead() to
>prevent running a VM whose resources have been partially freed or has run
>one or more of its vCPUs into an architecturally defined state.  In these
						  ^^^ undefined?

>cases, there is no (known) danger to KVM, the goal is purely to prevent
>entering the guest.
>
>As evidenced by commit ecf371f8b02d ("KVM: SVM: Reject SEV{-ES} intra host
>migration if vCPU creation is in-flight"), the restriction on invoking
>ioctls only blocks _new_ ioctls.  I.e. KVM mustn't rely on blocking ioctls
>for functional safety (whereas KVM_REQ_VM_DEAD is guaranteed to prevent
>vCPUs from entering the guest).

