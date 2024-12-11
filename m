Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A83AE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 08:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkaefTtwt5bGh2gW4IoolSUl2iO4oNRPSg91sywOT6k=; b=lkd/0SaxH5L3HIanYJZU4Gz1rx
	O6MKLIt3YwWbmRB/nEgMXrV4TK+kzUzbBIX+RaE2aPtXTQ/GOlV1pMRzdkLBhdD+100EDQroxFijv
	Y1+3iDEoJki60ymV+/G3L5yAIksyWpz3PVyXkET9AzkrbiIdatXOPiNsJ9vtZWFNcKS+MFgOTb1Tu
	S44T+ODsJ4QHRSzNSHzLzmJu2OAmWG8MrkVoyfkSpL6iVaNrJVG4IX/TM0C0ZpeVYbFgw3xxCiME6
	OLCCS+WsFE8JWzLxwrx0gJGtQMJdlrWnMy+gTwcHP/EDIUQOBHmM638ErzOTQvPubmp94ZYHwfC2X
	eWbbIXHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHu6-0000000EC7R-3Yps;
	Wed, 11 Dec 2024 08:17:06 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLHt2-0000000EBrR-0lt2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 08:16:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733904960; x=1765440960;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BkaefTtwt5bGh2gW4IoolSUl2iO4oNRPSg91sywOT6k=;
  b=LWtqCphtteR9ROIgWH0r/9+eY6PIAF0CaILXjN6/NkWf8SO9wXk9YrMN
   zNPq8Q9ChP1/wdY+usyKT5vaX09Bvp3A3/bdZPnMURQx56QfOE3TY6AvW
   rSroowmt+iS6uDNXyCd70TgKVkNPDBFVdS//xXQwR1sZlNdPNE/T58tTa
   9kUdB0b+4E9G04BXmd3WdDFhB1/3233BN1PE+1dL/0pWf62c3e3Kh4Pq4
   xLVwGJvYBLToiwCni7+sGhOP8O21g1wATC17YtzUH2EvOKbPEJ/3DJdtr
   mXD0MAuOQMZ2hEB+TSlODD71MbQXNUfEVdNaPYmlQAs49VW77PevOzsKW
   w==;
X-CSE-ConnectionGUID: 8Kv5Xx0VSwOsi4ctsd3UUg==
X-CSE-MsgGUID: cRp8GEzoRLyztVXJ0j9oTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34414083"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="34414083"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 00:15:59 -0800
X-CSE-ConnectionGUID: 9mUTepg3T0+h0pp+AfBFtw==
X-CSE-MsgGUID: lea7YmXNT1eyETI91+TCGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="95573560"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Dec 2024 00:15:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 00:15:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 00:15:57 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 00:15:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZF0R6Decs6jNEahkH+9Ve9kNJdgbt28hx5v0R7nx3odoB1AX1hTIwhLUgxKo+CHwBsmIpgvdwxgex+sKb1v6KOYQNcJx6mTQS9s/MAbKok4plKUzxuG89VU80zfXrgoHI4HkZfcIPOvjQRu893gcodudz1o+ABsvPqMuBKaM7bQdFD52/SQtVm4LMMCH8NrXG86RAl1PRJqbHrnytEPvyMhPMNjVfy3hBIGDUNWBV9Yp70c3BLllQ0LJqBsmWFJvkNcTLmP8chMx4oOX53BqXbpk+1vFND/NtsPHwVzPEVBFxaT+EzRrpQAh+oc8Lzc2tYzVY5jHF45m1LbwFlVhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkaefTtwt5bGh2gW4IoolSUl2iO4oNRPSg91sywOT6k=;
 b=Oih/o31ruzOQt4H5bHlDW9lhNG10XUvrkhfSCmK68+UZw3MLccRr+ydAxXzYrmlK8dN1wxq89fejF/rakyMRrRhXpUCcY4KFSv0ntYSFHTC1FlBb8hv2G7AvlcQvtO8KtZy6x4jM0RboebZX3j2mu093Q6elb2aXaS6MGZuzgPTRoTizQmnxwuBdZkD3lwqTu+1YQWoWeiqKiXD9e2DD3mlf/QvwLI8YHcXCin3AELACRda7AUX+uOApWUFZeMb2UEf48d7a1dmScHsriFkvMQqg0VJb12YB8mc0RzmCkVbDMaInh2pEIkpQQrlJUeb7OfgGmZzSAY8ZZtdgRxy/zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH0PR11MB7634.namprd11.prod.outlook.com (2603:10b6:510:28d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 08:15:36 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%5]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 08:15:36 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"will@kernel.org" <will@kernel.org>
CC: "corbet@lwn.net" <corbet@lwn.net>, "joro@8bytes.org" <joro@8bytes.org>,
	"suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "dwmw2@infradead.org"
	<dwmw2@infradead.org>, "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, "mdf@kernel.org"
	<mdf@kernel.org>, "mshavit@google.com" <mshavit@google.com>,
	"shameerali.kolothum.thodi@huawei.com"
	<shameerali.kolothum.thodi@huawei.com>, "smostafa@google.com"
	<smostafa@google.com>, "ddutile@redhat.com" <ddutile@redhat.com>, "Liu, Yi L"
	<yi.l.liu@intel.com>
Subject: RE: [PATCH v2 12/13] iommu/arm-smmu-v3: Introduce struct
 arm_smmu_vmaster
Thread-Topic: [PATCH v2 12/13] iommu/arm-smmu-v3: Introduce struct
 arm_smmu_vmaster
Thread-Index: AQHbRdBWljBTs1DfXkWuxKfInVx12rLgvbgw
Date: Wed, 11 Dec 2024 08:15:35 +0000
Message-ID: <BN9PR11MB527669503B30B7C67907DE398C3E2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1733263737.git.nicolinc@nvidia.com>
 <6270c905fc8537ffc51f6f2ab2db0601c9f08a8d.1733263737.git.nicolinc@nvidia.com>
In-Reply-To: <6270c905fc8537ffc51f6f2ab2db0601c9f08a8d.1733263737.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH0PR11MB7634:EE_
x-ms-office365-filtering-correlation-id: 3d6c5b7f-6d92-4fbc-bd06-08dd19bbfd92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?FaaASwtTOuwE8daQAOS6KcHnK/L5fwm+bjAB3AXTpUqbg17OSFh3Qu+QQpor?=
 =?us-ascii?Q?OmOHH2En7OEhgSf6sW3Hq623dqHixd3gTmS7PBZTffMlOZfEI2xgYRzj67GC?=
 =?us-ascii?Q?2sGJTVMBdaFhZTNPKhTR8H9F2jd/dGFFGJsZc+1EPyljZYpnUYbDjzrh9bnf?=
 =?us-ascii?Q?BZ5qtqeu5lNfvocqz0yuh0dbx0hEHRCj7cFgEDgs5Tlo50vMtwEzkY62FjrO?=
 =?us-ascii?Q?EMGh4NaTi+LHn9WrytX+BPtSswr+xiWcTaekMQmibSaHOe3djHjzD6x4DwEv?=
 =?us-ascii?Q?0m4z00xczshntFKoTvuqnd00u1lpFiwVlNv4gshcHP+3zqsjvXoz1tIxifzg?=
 =?us-ascii?Q?nRRGrpkpGRMHBZb1d7oRCPvxcaqn82zHLkW2lLxKwB0MxJjUS2FDqaL6Ss4Q?=
 =?us-ascii?Q?sMtX8isUKjGbpatTuD9osRs1wlDcgAddqzZskjOkDqrlLhgxq7Flt9mGAQj0?=
 =?us-ascii?Q?nyyolzHyRPidKKkW60grrQe1SmpBg8aiyMa94GPNz7NPI1VjRk44K1c82trZ?=
 =?us-ascii?Q?fVLD1LojWzghgRkI/i1/uLE5cjv12+NO5aeGwNBcEE5ukmVgLCOOJGTxnEug?=
 =?us-ascii?Q?Cleb3cgYMnZCIBmIZTGO8f4KqF/0ualSbJeMT+WYM8dbvQVdGTc0Fcus3NAi?=
 =?us-ascii?Q?jc0UiN25/LIsLEJ+8vMDRg8m5C0/IDukC3voGtEcu7CjARr8dvllLpm6ilNR?=
 =?us-ascii?Q?uIZVE6aJ/rjE+0iG0HUFJQfdfF1qVZzwlwVX5QYDMtYFNT7EVingENBHJNey?=
 =?us-ascii?Q?fpmMPxHud7k1zqGi0GL3m6R5bS/jFKl6JFtVtORg9JTTLFud7Ly8ahSsUy2d?=
 =?us-ascii?Q?Wbpd5tVlFQeRq7brp7FftJq1mD81ZuQAmxUsfSitr1jEppArEuANbEFJ6BzO?=
 =?us-ascii?Q?tsA3n6kw+eBim3g8jLaIYLeO5cAe1E7AiVaLy+ZvhjYctk7xPp6LFICfQCbT?=
 =?us-ascii?Q?4NDdsE69CFhAtrLfyqerlGDfPMCy+QWo4v/+HedA+AeIXthiEvB772PS8b3K?=
 =?us-ascii?Q?SXozPQ6SSdEtuELv9Zf4gTcGSeLEcrY6TrsZc71I3cNK1DOLPxkmI1InGN/6?=
 =?us-ascii?Q?k0PPZRa86Y0QrZcF/uIBqdAGM8SLKO6SVU6xXaWE6bBhMuKrtIwVRSror94m?=
 =?us-ascii?Q?phI02sSwhKWVf1j+67ktDtjJ7dvMInUllhPgwGppKydNlC7nn1MyyOXCsSEb?=
 =?us-ascii?Q?bPqzspgHWpm/mkprQ6TIT46P9OOYb5Cow6U5XrdrtjEDbh58BTpfbUYDRz9i?=
 =?us-ascii?Q?Eyvn2AtIZgYYwfWELuC5OH315zpRbZ+nKFDn7WjaBw+ROUt6aRfg56jIl+EA?=
 =?us-ascii?Q?UDWmLjAstO0oOmJnMDpOzUeaOMaQfrj618JzCGOfkd12ocLnfeeSlJipfepS?=
 =?us-ascii?Q?Sx8u2sr5fnOoQF8FgTF95jgxTn7Vctbvbndsqp/jDElrGXGpjA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?stPxFkvHah+rXFel9ysQ0jFFkqkis1Xvu/7LHME79J61/d5fLLnWC41s+WlF?=
 =?us-ascii?Q?VGKrHMwSGxlnpzFx3n47vWKj316VoFtuEjSX69xgrilowmqEL9VFWatM5cSK?=
 =?us-ascii?Q?3VVU6A+K19WUA6nAQ2gtgrNhn9asUBOQkf2xg470pYFv0oY7GvuxD2rHPMNx?=
 =?us-ascii?Q?UX/NPIJ/pfoqVkOCnuDDu4AViOAqBYGbr/l3eo9vNPrfB9BIo1YWzXUtDHwr?=
 =?us-ascii?Q?EEWZy9MmYSl9UbyQWQzB0aIhERd42rL5Gjk2PPu3+dFBG92HDtPpfyz7U76h?=
 =?us-ascii?Q?YKvw4JuXcJRz6YicGQb8yp4dBuADpGQiOne7q3w785VEeIwxT0koib3KPUv4?=
 =?us-ascii?Q?FbOI86G6TPrZNZ/mqbVKC0etP3VOcsZb9NRQbAU2MAeC3UkYvltfFOs3h+II?=
 =?us-ascii?Q?HtTQnO5fn/5vecy3d6hCAsofSooFuI8s6CRmrvpLHkrxZ51+zp8ygU+k2rLM?=
 =?us-ascii?Q?OACAfVnD5eOjOiNn1kmmZrGsxfQs25trw1GjQL5AUTC9XB+aN+QmYC1iMTcZ?=
 =?us-ascii?Q?jnRG5ws1EUFiOZH/HviixATEjs7bR+2YKYuXfhPFBu/lG02gpGJSOjXQrvlI?=
 =?us-ascii?Q?8xAAQC7v21MVlEyJSYuGzoW+Vlxm3Vei/U8t99FbUe4QWcW0c7dx5IV31DhY?=
 =?us-ascii?Q?hI45gBUQm73osd947Yi/yey+q+nUFZNCHGkPjHp3CXMraxl0KzSbHk08IZti?=
 =?us-ascii?Q?8E/S2U+jHv0ddGrIW9L4pDuKweo8SKfp3bT+5wNhlNig5Dn329CVc8Fj2iYz?=
 =?us-ascii?Q?OSgNRhcr6noyF9aiTeIACtcCGXqP/9Ie3FPdk6QjcJmmbPQnpN8cdQ7C3b0w?=
 =?us-ascii?Q?eG6Z/229BwDNzzZanzFqOb0WZTIb/M2uB7FxJB5MRwsBmjb0j2VSB33B5xJ+?=
 =?us-ascii?Q?HVn4B/oL/bIXr7//TZ34yn6qA534GyA3oTHTpWnNF73BVzwYlTg5DJtbmRK3?=
 =?us-ascii?Q?s3Od58dTFHldvcFU8yJo+vyA9m13+JzfTr7CrmIXklpj/fq6nPHfdgpWzRwV?=
 =?us-ascii?Q?yueIf9UtvGCZBlejLM85Oc1xbTf1IJ7XL2SFdA8cibRFcKMs/CXDlMFlAyKu?=
 =?us-ascii?Q?cMMduo1qgRXy230dRmE0IqbKKpOqR7ezjg7ybPMVDyoPelGeW5YvSPxD1Zmq?=
 =?us-ascii?Q?9nSh2rbBbV9ZOtkZFEm7p51Tkulx4DmDBDsGZPnQdgMK7UfQ0DQbFq0/BpLg?=
 =?us-ascii?Q?K4+SjrNZ7hNN841aFbugqEZGIJvye2RQOLbSFr1qaxMC64VOK9YqfWph84G2?=
 =?us-ascii?Q?PFWNX35Pk+gUfboMoCek5TUUdbH9TYvki7W/nhNsTtl6sxtZn417ump3GcGX?=
 =?us-ascii?Q?NRmVa9qr4j861bat+wC9zhp/J0nRzk7PGBbJ+OOBow/Ekc9XOTUM9s5AsAiE?=
 =?us-ascii?Q?YkmXnchPCW+TdIgvUo3+Ca10VXtQ1qpb73hZ56QA9K8UuTabuZ0pmNuDil00?=
 =?us-ascii?Q?U6rReGs0ZU5VHC0OWB/PkbQEuOqACUIJFO+/GaEK11VtirxxJedAMwlLB2d0?=
 =?us-ascii?Q?aW0037MDOZyev2z03zJe4yh4rkU070mxgGpXC2QzGorfZprOQM/G+StuIfdH?=
 =?us-ascii?Q?ZupjCdtsHneZNbvtByoiTyCvMk6mR7kOXN9z8Y/I?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6c5b7f-6d92-4fbc-bd06-08dd19bbfd92
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2024 08:15:36.0021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q7/yvl7k2heoEyvvhknYHzYZUyK3D36W0p7xAds/UhzEiRjbrXBg4MjAhVq5X6+6LiSfobfJ7G+1yBpI8xsa6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7634
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_001600_431745_F8452022 
X-CRM114-Status: GOOD (  10.96  )
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
> Sent: Wednesday, December 4, 2024 6:10 AM
>=20
> Use it to store all vSMMU-related data. The vsid (Virtual Stream ID) will
> be the first use case. Then, add a rw_semaphore to protect it.
>=20
> Also add a pair of arm_smmu_attach_prepare/commit_vmaster helpers and
> put
> them in the existing arm_smmu_attach_prepare/commit(). Note that identity
> and blocked ops don't call arm_smmu_attach_prepare/commit(), thus
> simply
> call the new helpers at the top.

Probably a dumb question. viommu is tied to a nested parent domain
which cannot be identity or blocked. Why do we need to change them
too?


