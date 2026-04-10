Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4858CF36BAE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 06:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XwzsAs7S3iCOzqmPYMa7WToFEJVIkJ4Ircl5UYemu8=; b=Y0/U4OPkPs65uz4ghxCSM/tPsP
	mF37oC7odR4N2q0PTn6Pu2VouVynqUBnKhPCuWFABZBu96fzsONZ88d7V4dJuECe6+Ddj/jUnk+OF
	k0zV3OqfWjpT83iwN1ggbwaS7Wj5bAzrPLkrVOkfTfWxc1ScY4gkivF22XC2a7EEHsS3ZiyEx8pFU
	+oYolYvG97PNIAjTCMAyXp0+A3JZlW6sFRbyD3SGBmVxf/dUnR3+x3gi/M9rcKgkJygTf0ZbU3+YU
	CyR6RzlBCmdGaUYcRBPhmH3Ne4Y/DQM9X9LgflTCqjStzXy3RE6yX6DFUe19Pp7hl+iFj7blF9qxP
	aqqJ4+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5Gg-0000000Bg0a-28Pj;
	Fri, 10 Apr 2026 06:23:02 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5Ge-0000000Bg00-2kVA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 06:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775802181; x=1807338181;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tJgfP/ev7QuUt6H5TAoYiub+jTqV4Z8b8+Bb6Vb6aHg=;
  b=Hynr2zQsfJbe3h5N3kQYGiPA46rU46QHtyXvpz12QDFfuyjUyR7k2uDN
   d01LMf44/bcFl+/eD6OhcYZe7vCiw+lmcDAKeGpH5+uzQkaUDSpVXmqQA
   5W9BIyYpw3AW+JxAnXMLHn0QKzdUkjWsO4GOTCB10XlZ0zxOWq3MvacXf
   4zgN85Wt+3wTF5qA1dLQM9C1oZ2KhqPHmHavKGhBLofDEJ2rAdl1NVOr5
   En/NOCrKWg6uavktG3RhMzdXMjVmUCLR7VNFyXTcKiL6OJMAbJ7ElktDg
   ie6g/gqKz3uKiqmGuXeNvgI1/1hercKrrYoRdNt0gZloyT5BfoNybkvV7
   g==;
X-CSE-ConnectionGUID: fn31DD2TQkqgUUSHRPevAw==
X-CSE-MsgGUID: 1HLxCLNbTxuUGI+H9oI7sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87104396"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="87104396"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 23:23:00 -0700
X-CSE-ConnectionGUID: pyqf7TjlRrOzD1yEhDtwVg==
X-CSE-MsgGUID: NxIMJVZOT1aOT9MxCQIn6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="226280885"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 23:22:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 23:22:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 23:22:59 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 23:22:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vn2IqB/Rsc1iyS6rMwSn35a1AXvrOhstM2fTU508bF/cgW8Fc/CC7MjXzejM2oTgOhM0GSZA8sxfGwwHgHL15PtqCEsFFBh/fvCGk5syGmk25dg7isSTZaf84PUitVy348z2yQ6BOnmQxLLN911sOudMYCIBn8LBHElJMJ7XjUHEUVKhmrj9q5klZd0LG0bdl9JP/j8z5i1nCbU3xCG5em2Te7sK1dchoU+7S0Wo7+Xre1596x0bKr4TRzRMdYMLlAUDGkUQBH+6lNry3LFIb6G7eQ5rWegx+OEsn7QcC1W6vPLQm29Cs2JY1xK6LdpI3ErenCC7U5PIN08DBIfMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XwzsAs7S3iCOzqmPYMa7WToFEJVIkJ4Ircl5UYemu8=;
 b=TcWFvdt7VWbEEbXGxp/D208tCkT1On2Pd2nfv5zmDerNskDth8VL/aocqSnqQ8d5Qa9KuQNaC3wE6zUGvhC19/P6sdPPkUdSR2y3yJa3lypWGB+1i0jFpNxLq7g87r6RLLTjhHV1Ws8JIqGh27a36vkuEShbD0QF7ymeMZS7UBkBaXaSUwXpAyoTbSQsJkPDpNGoE8ol5T3NT0Oe96ZGOTuHXdriMFLZbOmMKhJHIbFwncW66Nhn/bbVzmqqET7TeTTDvzl5KfW1H4z6uo2BvhxCNNgKp8QdcVmjGvTShUJLr/hwHYJy+ZZhms4mERTl7jVQpSH0RvnP5nmR2uEbcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by CH2PR11MB8814.namprd11.prod.outlook.com (2603:10b6:610:281::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Fri, 10 Apr
 2026 06:22:56 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::f997:762f:f079:134f%5]) with mapi id 15.20.9791.032; Fri, 10 Apr 2026
 06:22:55 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"will@kernel.org" <will@kernel.org>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>
CC: "jamien@nvidia.com" <jamien@nvidia.com>, "joro@8bytes.org"
	<joro@8bytes.org>, "praan@google.com" <praan@google.com>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "smostafa@google.com"
	<smostafa@google.com>, "miko.lenczewski@arm.com" <miko.lenczewski@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH rc v1 4/4] iommu/arm-smmu-v3: Detect ARM_SMMU_OPT_KDUMP in
 arm_smmu_device_hw_probe()
Thread-Topic: [PATCH rc v1 4/4] iommu/arm-smmu-v3: Detect ARM_SMMU_OPT_KDUMP
 in arm_smmu_device_hw_probe()
Thread-Index: AQHcyFm7AmXRgq+OikGclriLK7tuY7XX1BkQ
Date: Fri, 10 Apr 2026 06:22:55 +0000
Message-ID: <BN9PR11MB5276EC948B1E2BBC73824DF48C592@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1775763475.git.nicolinc@nvidia.com>
 <2572aa7fdd3b32eefe48693668c146f4a68ce50c.1775763475.git.nicolinc@nvidia.com>
In-Reply-To: <2572aa7fdd3b32eefe48693668c146f4a68ce50c.1775763475.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|CH2PR11MB8814:EE_
x-ms-office365-filtering-correlation-id: 4e08b1df-0a79-496b-cf24-08de96c99a8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: kkjki2AWt/BcOWi01v2My67D0J+s098SZOQvgFBgupDIW8nWKBstWKQC3mTR53cbWOEbCgDCKTF3MSVFmvWC1p9ucjr5+7jQroAaAmpMsycmR7TbWnG5ufhn42QBH5S7Sp3oJHkA6WY0+0eMw7bonK9lt3h034HJ1oGxj6sEt1Dcsd2snk8gsAEQvHeHrkiJu3Xk8k8MUHWWvEsx509jVi1aFjdorcCWm3IjdmmneX4jCFn+zNbxylk+iBoRu6u+S2v3PEBtKf/2zwdTBHqMg9duUdkGXtLbPEfQA9BU72ErxmzxlZLtpIIT/fwLoxrPZAGzXOo3Nss45C9ZeuQajzQOK8DLCWWVHhaoTgzCn1bZUPH5frlaArbn7mTp2NdAhOpGfXJAvRxxTr+x/1PgqE38mIXCgptLWDgsVtPRkwlm9pVi3Vdu5AFVcKZiq1RhNXvv1SEHN+NmwK7PsOJbEvaVaAAHs6zq2iTqkfHVzu8WipE3eixYGxSywBMPDDJ2OJ+uL2hoMi/a9JnnFUqCmXJVbA6Wg/56/cik5nBvyC05KA3tsS5UqqjzRztonxikQbmk/H1HhtFnng2E5xNBrzcOa0EifFkR8yA1f1SNhIex0UWgj4Lgx+ZxHnkl/9QcSW66Phid5PDMnfULwX//l/CJvf2gKcpPBRzzYm3aB4VPSTPjqEVOJd8o5fqva9d89M/PhTh3l5osNGPSIAidZbR/1O4CN8NiInBKXU/Yixgz1GZJ/XirGpBt6ozzqTduach33btczV0UKJ661sRUjtWOWW6KytLX2K9XN0gEVhA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oFD00HVUap0W0mMfGlwU+cvhRu6Ak5/ArlkiqdVtvXpps0X5mK046y6DhNSo?=
 =?us-ascii?Q?O7HSsFhAh3LY3OZl9UQ1dnw2MLR/dXvcjvty45k+NZ/VyXQpyZS/beAYBgj/?=
 =?us-ascii?Q?bD4p6esHQoclJTosx1OiywItMmsXqyLcuO8PfqkvOAT5I6ZEmWqj0baJ0B4N?=
 =?us-ascii?Q?ZDPUrzWhymfBPAjMCTzhdbFJ1B7C9tKO+NQm6RwUQoCqyIdyVvgghA8deVVn?=
 =?us-ascii?Q?+aMZWGtL1XbM5G81xlnN35oQWNiLhJFkMQ2LJ+HcWZy5+9UKE5LSwpEBebeU?=
 =?us-ascii?Q?roIiXRZYRJo+iZSPoHlL4NZO2bdz3kbBeCQMrX7lg8LWTNTwhJbdyiqd/ivs?=
 =?us-ascii?Q?c/sPEadaKW3UHCI9d8+fgDIe1/Kji7ZDgjC9qI0mPfuqKywrrC7MiK0QDXte?=
 =?us-ascii?Q?+5gC5Tzf0fMa3ez5oJHzgawWOiRlZ2HWWSETH8vKG6u43p+7wwf2/GdVXQts?=
 =?us-ascii?Q?FGFA9GGblIjVssWuxypfBQsykxgkLd7xiy9TF4w83szH7RY7mMGugGC1+CZZ?=
 =?us-ascii?Q?xMLEabFDYuBrseXA77NmhE7+L+sHjNRU5XR4F2afmFQgwGpMLq382Mn0iLo5?=
 =?us-ascii?Q?VO/7FKpSTY0V6Vw9+VL+YmlRFi8zVfOvvYOP2gEQ9q3e1l+53ZJ15AroVNzp?=
 =?us-ascii?Q?JnwUdIW4tLG2uVRAo1xSTBNwIcGh0aafLTuO5UcuNvoTcK/7QyfzWD7mcmcT?=
 =?us-ascii?Q?KZEtdxmCq3uJhVOUDtBYp3fG9+ylBqR/e+QVGMwll+yiXp6WFH0ZFAlVeE/c?=
 =?us-ascii?Q?wB7iLNWJ/Nxa4djSXL3nVEiwnt8LBkTps26sfXU6b9wVUSiwyp7koQnGRTkh?=
 =?us-ascii?Q?aselIbduS7Z3/HrUZ9tMAHPsK7HMQlFQ7wsY9+qNlc3ZtX1YMwt/at510FIc?=
 =?us-ascii?Q?yorLoEwOHpQZHkaK++BF9VzCTTx/QUbR/23fI6cIjDHKa4moa2za6UDtr1rE?=
 =?us-ascii?Q?WYQ+hmPl6bLzuK1WVblcltLjTQBCVEtowcfE5gT+5bgX5Ri7x83waDpteRiI?=
 =?us-ascii?Q?evIj/dIIgEVUwnMpko8ESxiW0Yp0N/tQQkrNuoXouP/fF5iFE33Ixj51mH75?=
 =?us-ascii?Q?W+5Hs7XNxziMHyUEmAbpi9PbFk91yBJ+75ZKwozbsBuxohlccqJeN+GZDYmF?=
 =?us-ascii?Q?s6o4biGWg9Q974MAUkp1nFT98Ek4kIh/smvPlbHyjeXoPay+jgRWKaCN/YJO?=
 =?us-ascii?Q?qMrwJa418CyQdnfxm/qrp6nHsMXz9/XyrAp30yP+JHyQf35m/9bwle0/WSHy?=
 =?us-ascii?Q?s1b5da4s7z3d1rwY2dyXPyRGooRmAziirgtQ8LbUzYv41lvaXNXwzNbzMgnV?=
 =?us-ascii?Q?n+kS5Eir6uX1Yho57+idokPk0NngVVOnJcMK/ndyct6GfbbDL0pTaViIg1rv?=
 =?us-ascii?Q?758MHzgkWckDIPrcAHtzhUchizOD05mhsZPe/k5yygoaZ6gyR1ra5hOIMI47?=
 =?us-ascii?Q?YrwnnkOcYOLxGXm+WLYC6MfwQVa6I3R0ePsgMqCKNG48kSxr5ciuY7iKCvVA?=
 =?us-ascii?Q?S7jOJGMBmdlJHSJYM/OajJxStzDcQ02OICDuswVLuW7huXFJQCMTCYvNExb8?=
 =?us-ascii?Q?1GlpZyQmzf75wBGpIJdeUBEU6q96QICar3s2MMsHyIeWyTAn7IkbABULNcF7?=
 =?us-ascii?Q?+GU32DQBHF4eB+HaFb24x+0w2aBtMzZaKvGQ9cHKXUkFVpz2lloWvFoAYfSd?=
 =?us-ascii?Q?QVqTb97r0INTcJhRnA+cERVbShC2oHGt0Qy2dZ8LfOtRDO2tga0BQm7wSCPI?=
 =?us-ascii?Q?4C3UWQOJVw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tIS8x/yxFUgj4Oelx6H5Ve8ExTOMDl+SduEwl4oEw+p1ZlJc4hVwZNu8dS98Swjundh4i/MZrgDVAD8/jC+I806jfFcBAxpDRbZLRbuzvgj3AXl6Yw22P5g20O44oqE1if8/60D/XxUWuZs4nEeN/COGviGxirk4crEdGPfsMbxBBLngmft2okvxIAiOqxLqKTf1apDbuXItaDUbTr55pLWpzW4b6mke546T0j9PH2wFSEoM9+/SAnONXQ1v9YhFjJw9CJySxPSCqM1uU6goJQ3k+A5gFOf/DnadNJxufn86rsCHDxSjjbqJOCXzzW8pYZeY7T2I9T8RnlWqoR/4ew==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e08b1df-0a79-496b-cf24-08de96c99a8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2026 06:22:55.8230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZuZ7T3YF9tebcE/5Lae6KataFl/BFKQeeziA6qlKG8CJRoTtnlnprlj1Lijn27rEebzV6yO3n34bwvkBEYPIsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8814
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_232300_738407_614F6ED3 
X-CRM114-Status: GOOD (  11.90  )
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
> Sent: Friday, April 10, 2026 3:47 AM
> +
> +	/*
> +	 * If SMMU is already active in kdump case, there could be in-flight
> DMA
> +	 * from devices initiated by the crashed kernel. Mark
> ARM_SMMU_OPT_KDUMP
> +	 * to let the init functions adopt the crashed kernel's stream table.
> +	 *
> +	 * Note that arm_smmu_adopt_strtab() uses memremap that can
> only work on
> +	 * a coherent SMMU. A non-coherent SMMU has no choice but to
> continue to
> +	 * abort any in-flight DMA.
> +	 */
> +	if (is_kdump_kernel() && coherent &&
> +	    (readl_relaxed(smmu->base + ARM_SMMU_CR0) &
> CR0_SMMUEN))
> +		smmu->options |=3D ARM_SMMU_OPT_KDUMP;
> +
>  	return 0;

A warning message for the non-coherent case?

