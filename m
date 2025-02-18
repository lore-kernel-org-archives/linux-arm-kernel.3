Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617B5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 05:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a87L3+BFeOMCj7F+S4bbzafaU8uU6LhPdjTj5GoCdsw=; b=2LKz712Zp6v2rUbojayCIW/IP/
	wTfeh0h9GDs6f/msZPNyraFecVNNyK6I1xAZklbTEy1gNu/59BM5DnibyQzBknEbppHhAojkDLyOI
	sb22ZcReZl2pGHxTlnUYK1NgVfC+CCoksXOdfWDghTX4jMNJB8bQ1VeNXCq9893gQ1bszA/g/5WEI
	MPZap4b02yimeIdCltns39VcJ4BV/QAUSTrRQqjz2ERlG30vcFGlya7gZGf9OOhkNNSD0E2eRKcfr
	pYfsgB1hm1wdHDnRYSsMoOS9Nxm1bGamK5HGN6YhzjrC8PDRPgslEEsPng3S3RHNJ0LnBoYTt4lld
	vP0ZiXJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkFym-00000006pVD-2JbE;
	Tue, 18 Feb 2025 05:17:08 +0000
Received: from [198.175.65.16] (helo=mgamail.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkFvr-00000006osy-0x0k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 05:14:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739855647; x=1771391647;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=I7hYXdMzkarQQqdHOW3pqJ+6Z1QqcSuT6/6F2pA7vqM=;
  b=l9kFlSlVXLfIXpcIQDcID/LEzA+8Yw7lchUgQOdQEYpeO2FDbR8Nr8E5
   dmdqaXlaA3AWLtSS8nwMLy0gtKW0kV1IXJwPTqnfWn2befh+KLo7ObRQ/
   FllazHMpeWPZvuI7O4W8kCm5nlWbvKybHXuv/zzRzqLUmFNMTU8EK769A
   /CGbx4NpPQpu6vsSrsQWH6KHhcRvcfrelBbk3HaikxttvWtB6mpa1BRFH
   VxK+T+eDarwiZ7QBUmRyPCoEfkNUD6SFGyXboBGbnIj0WH0YNLUl7HUIZ
   9OWe15NwEWZ+y/r1vtdYee+3asHWa3hPrnC80+TINgewwjA0jyxP6PJt2
   A==;
X-CSE-ConnectionGUID: TAAGvysSTOiW300ggR4P0g==
X-CSE-MsgGUID: dex/16PBQpK5RD3IPb6rOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40660404"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="40660404"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 21:14:05 -0800
X-CSE-ConnectionGUID: KxvosQ7ZSPOEXEabWpF+WQ==
X-CSE-MsgGUID: o5+DLotqQbGrrpwrKXjJTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118419323"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 21:14:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Feb 2025 21:14:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 21:14:03 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 21:14:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dT+I0z3K5lXNv7ny1o+/D/Y3FrhWXNA9GpGmVy05Z3WRN11xDY0sRA3bkDjVfPSK/7I6oZUaZ9ZecUHe0adUmf9Rb4irHN6gS1CoFXapVAuqdQVX2Zxl0ZyJ0SmgGTXG9Ix0ZpSnsjnNC4AP5fJaALPVth5VqkzzUiIyB3+v2HCG6WgK3cfmePCGSofl9ewawqfTydDJduC37C7SolwfsyT1W7aoXzY69mPiks1TYofQ6jS1zIIjymbj7tXS2UzPYY9MGoJT568NYCoYTMHEQFasC4sX7ISfFh0OO/Z+/4TVh6x4VFdH0yO0ePq42KaswRKCXfMBYMuXjZmo8pEIVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a87L3+BFeOMCj7F+S4bbzafaU8uU6LhPdjTj5GoCdsw=;
 b=U5GCA4t2otCCW+peASEhfrKiQlV/tCx2XBEOyhbaw2uPfTHdawu4lH0JAy3ZTiRjoUp0PD1W1YD3Pg2kXnvDtSeg916HyGe/2cIxDWM0qksrGumNIzc4Gy2JkVSLwjrfKL4NxhdG5LOIOR2FLvxpG0OydKOoRXZ0muByM3FtV7jsv2YX/5KYj2jjQYUVACP2pyd9ZjLBNP97/u4K760MJWZnnNZkhBPXR/QsE+FjH86qJCtSrjAi+DfLkFTEsn6HGeIbj1JXiaAPJ/r6JqX3aTuNLLKyvlaR0COFzZx7SkQs+ZaZtNyuFpFm/wHpkBJX3neSSzqjEpSPZMrKzgoYHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA1PR11MB7015.namprd11.prod.outlook.com (2603:10b6:806:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Tue, 18 Feb
 2025 05:13:47 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 05:13:47 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"corbet@lwn.net" <corbet@lwn.net>, "will@kernel.org" <will@kernel.org>
CC: "joro@8bytes.org" <joro@8bytes.org>, "suravee.suthikulpanit@amd.com"
	<suravee.suthikulpanit@amd.com>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
	"baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "shuah@kernel.org"
	<shuah@kernel.org>, "linux-kernel@vger.kernel.org"
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
	<yi.l.liu@intel.com>, "patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: RE: [PATCH v6 05/14] iommufd: Add IOMMUFD_OBJ_VEVENTQ and
 IOMMUFD_CMD_VEVENTQ_ALLOC
Thread-Topic: [PATCH v6 05/14] iommufd: Add IOMMUFD_OBJ_VEVENTQ and
 IOMMUFD_CMD_VEVENTQ_ALLOC
Thread-Index: AQHbbsB3/FSgDe1QKUK+gEWFAeDH5LNMeqcw
Date: Tue, 18 Feb 2025 05:13:47 +0000
Message-ID: <BN9PR11MB527614EB9CBA3BAB951B0DDD8CFA2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1737754129.git.nicolinc@nvidia.com>
 <2fb8d9c7b01ad36b42849283cd33d931f11092cb.1737754129.git.nicolinc@nvidia.com>
In-Reply-To: <2fb8d9c7b01ad36b42849283cd33d931f11092cb.1737754129.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA1PR11MB7015:EE_
x-ms-office365-filtering-correlation-id: 830c9cc8-cd22-4d60-9152-08dd4fdb05d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rJ2RVyEsTut+AnBu0DFNr8H2eBMaofFYa8Qo7l6aozm76i1TlyeT8EhdJ7Aw?=
 =?us-ascii?Q?ZFEPqgBmQNWo6o/EAmubNO/agWmBQF/4JpLdd8JYL4SbrMluN9OZU2m3w4nX?=
 =?us-ascii?Q?xVGObmLfkNffPSFbwSnG4f/aR77DaCeb2ndtRSxMOIUpynOdBM5HceWZiq2r?=
 =?us-ascii?Q?RC6KovyINqsRStnoMFfI6XdKx89M54Py4wD9QGeElMh30ysG5d0T9IXsO7/w?=
 =?us-ascii?Q?fTobEQDJPt1HrUSOdC6whHXT8D0WKUCRHacB95AccDuBn/w9NX8uHu1evpPU?=
 =?us-ascii?Q?wGCmll9P8fC3OVWQezUM+nmc2jrQRsj6mX6N7xzhF+Ftj+yKIJO3mxm7fnL0?=
 =?us-ascii?Q?sFi8w7Fp0TR5trKS7CE1tB856VtH2oPRTfjPfaofnxOn7theDfJ9TZBonJd1?=
 =?us-ascii?Q?ZltFFyygWzCwNE0UqN2fDzSYszoTAHXQTDmVokmFsAzuTZtte7AbLOE4IMG8?=
 =?us-ascii?Q?GPzs7/Aanb91c0CrDTIFLL/BUlHnbT+xkwhH/Y7/nUSkmURzUuSZN33CdKZF?=
 =?us-ascii?Q?9p2nvh5c118sDhGV7gZEzSnzqT4RY7BdnexVEQswWzzZ0XzruYcQgpJoKAi5?=
 =?us-ascii?Q?fKtI9ZzNlA646HDokGPcLUgz7c4YpbkeOxf1zMf0ekBO6Uk3KH+fhVfSM9+W?=
 =?us-ascii?Q?k/MNwAvniVlzAIZgrrLRzkpYg7kdT9+vhc0NysAsEFlwkKj67/lwrRN+/wn2?=
 =?us-ascii?Q?/CNdDBhGBtH8elXK/O+spvG+RyobMVxjdIaktHNar/YBQ/QvPW6/YIzSZ9XA?=
 =?us-ascii?Q?w5EiwQL23KMXbwR18N9izrwFJjxtxk7mkFEZmey490SP0OEVi8zdJGJmHemg?=
 =?us-ascii?Q?H+gZ7ZMFoKQV22o6N/PyIzEVb7EZkvWMAO+J2EC0BUQ0uRAsj3o4jpifsG1T?=
 =?us-ascii?Q?NZr22jGnK6UvkEBIjNNhI9u/o+1xrmOLr34+xquOSbds7mveFwqGJ8Ibsdss?=
 =?us-ascii?Q?3qDQbrEMwLN+CIPsJlvcGbwlW32U2gYiHql0UcS8LF1KJI1Q7xJHMv8JGjXW?=
 =?us-ascii?Q?10kDXefl+6yuxV65D8B/NVO019K0jIhHwyqDe28CF8P+UolecQR5nWotVMiv?=
 =?us-ascii?Q?zC33sPAANZgzJrmAxJ7cowpzM2LfJaqA7CCHwuViHWjyaCwZPGWo86AyMbEF?=
 =?us-ascii?Q?ZGWpLo3CKZ9NhxQTMuYArT9JEI5CSgerkAcQ4dh2BoJxtf/25PKAg6zioinQ?=
 =?us-ascii?Q?VHwrP/SJWv2ta5Pk6d9ZGlAlUMfpbHMJEQT/TGg2oZPnbwoTFqkfZPF5utBO?=
 =?us-ascii?Q?ugeu9GL8sOItMEYmiuGGTUlBEG2EHfCRfLCgk3uBZToQza/8oO8OJ7dFx81s?=
 =?us-ascii?Q?FNOZB6Lr7YJX353547VAK5KEjHVv2ybBzmRrz0yyr+DqoZtHvrica+676bxR?=
 =?us-ascii?Q?dMW3S9ibYNh7VLeCbI6JWWcUsQf+Zc9IG4cOig78VbGmM4Z0is9dep+eSpfP?=
 =?us-ascii?Q?CwH/g82I/uBAbXrtspuTn0zizMwEQIOp?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?U3kBoJNDriiIUweVhLB6DjRaV2nvugD40waXtTaiy0w+/9pWN2+AkTHSPlmZ?=
 =?us-ascii?Q?YR0Kkm2YjIPI0Tz/L6140gTu40vs07X1k1u8wzwyl2AyPW4BvIerOtvYtx93?=
 =?us-ascii?Q?PNAGSoVwqGfOoYXFio4+rZ4MRpYHpCkuLpufnXliJXdHppXpmjcOtmcpFNXq?=
 =?us-ascii?Q?ovbuRB5kgHCLgk29sbscCwWFxihGMg4a7J2dH21Tgceuddwdn9rJhX9lBg8c?=
 =?us-ascii?Q?cLDAqY34g9W2pc5cErxSLyaGUHC9UQxa84QW1vjKf2lMZUehKuNG52sEDiFn?=
 =?us-ascii?Q?So0Xy5UuTIL1K/8zDmaeTQ7zdMleSo0CTJdrHgsS9fFube6UAxgd9m1fGMgO?=
 =?us-ascii?Q?SAoLksqZAixRvcpqWlhm/3Utz6a1cClQnJkWOvGZWUWFfeH37lSqzQCIdTuM?=
 =?us-ascii?Q?WTfjD7h4SojqzLTyTCjr+VhCLX0hSI6+vZtTMBxsl8rR7xEhTBqa1zX/FFj5?=
 =?us-ascii?Q?HwFQgU94oAzNR2vQ5kzxggKx6zdMI4cBg4diGhaV98QVaP2KMpfJHzQ34Cu8?=
 =?us-ascii?Q?RP3zlMqo59wz2wQP5gNJLsEu42BBRE1G6ViyAkcefP5vv9/9t4rO2nskZj3d?=
 =?us-ascii?Q?zX9XFGddv035U8oWl8hKe930pyVYX2NaHrJb8VXTmBxKggkat+8MvkdO6klj?=
 =?us-ascii?Q?buUooiXDqfyn9WInW+ZN6IIamM8jMpNoeILnNGv2cBMaT9vHNINRg4s3+F+x?=
 =?us-ascii?Q?M9kZpAP1HGntaY4P8V9VIUJ5IzzRJNBETsNSt5+68da0647CHf+5EX3B0FCT?=
 =?us-ascii?Q?mR19byKBRkW84SMZT/vVsPKzXk+4nFJZDV4PxujhmGjw4Nz2XmZ7yeG4hjpB?=
 =?us-ascii?Q?mHIudGzg/ucrkmUv05pt6wiaWtgKUKY3EFz1qfZFBptPcp8OF+v9ASBUzcsS?=
 =?us-ascii?Q?a2ubWwtKmN/TvUQwA6GJWjrq5HT6tJpCvppp9no/iXMez1pTi3KwNs3ONF19?=
 =?us-ascii?Q?orpCIHjGuZxegmukJRr+hFF60WUUD919bA5lATN24hnzUhssf51jqf+KNqna?=
 =?us-ascii?Q?SV1wDdjTiPTBf928oSSb0iZyfx6uHT/HF7MHG3boIfgoAyBbfcSG7E+meuWc?=
 =?us-ascii?Q?JIF/qKYFfOd+uNrHMyB7CcOlnNcWWkLpfqo6zFhFCho8veXCsa48ZNlF6EEW?=
 =?us-ascii?Q?9q3wR4SASjabLydgmRmpLLDLsEBQCfaxBhrr1bQnlo17Lr+gv0ReEFPnIUrW?=
 =?us-ascii?Q?E4Fz05UaAY0bBR2MvxS/XNsjESGH5C2XUXVofkHUcjrQ9+yDcmRD5/cebXxJ?=
 =?us-ascii?Q?VewVdqOY/oSPOM/LU/EuHDmEFBaBrWrjy4LuAYsptsXecCfX/3yO2lfvxsme?=
 =?us-ascii?Q?x0bC3r45eyCXxYAGBMSUJ/gOTa2pOh4yrOVCEV4PsThg0WUHryt7GViYtUQe?=
 =?us-ascii?Q?eYIEK+PqhJYMTHKtvwa/9+JB1PMtxAaCf2BqB9hcSxWr6ISn4jEaoBRMKUSA?=
 =?us-ascii?Q?BjrZxZ3IJKqaL/2GrPnqtnzpIy6VN8ABfEROi8o+YDVdlhDs5QVgxQyWIbTJ?=
 =?us-ascii?Q?4HWNdSlTUd9iTxbit1fAIXIpNlGX+MFGY0++PtcIAz9owt5LIMos2qIJtEGl?=
 =?us-ascii?Q?yw4EMpELgj8FRLIsE/y0ZBL8/2U2gh0OX/E+Ooxi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 830c9cc8-cd22-4d60-9152-08dd4fdb05d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 05:13:47.0870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kj5fz76u8OoZGhZK1AyQswF/ok7I+IzzuJXKItQIQuDPjxP8Rz3yH7MxeFjqy5ZSqx+rX93V32EIJpWeBFOZmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7015
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_211407_341728_DE95663E 
X-CRM114-Status: GOOD (  22.81  )
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
> Sent: Saturday, January 25, 2025 8:31 AM
> +
> +/*
> + * An iommufd_veventq object represents an interface to deliver vIOMMU
> events to
> + * the user space. It is created/destroyed by the user space and associa=
ted
> with
> + * vIOMMU object(s) during the allocations.

s/object(s)/object/, given the eventq cannot be shared between vIOMMUs.

> +static inline void iommufd_vevent_handler(struct iommufd_veventq
> *veventq,
> +					  struct iommufd_vevent *vevent)
> +{
> +	struct iommufd_eventq *eventq =3D &veventq->common;
> +
> +	/*
> +	 * Remove the overflow node and add the new node at the same
> time. Note
> +	 * it is possible that vevent =3D=3D &veventq->overflow for sequence
> update
> +	 */
> +	spin_lock(&eventq->lock);
> +	if (veventq->overflow.on_list) {
> +		list_del(&veventq->overflow.node);
> +		veventq->overflow.on_list =3D false;
> +	}

We can save one field 'on_list' in every entry by:

	if (list_is_last(&veventq->overflow.node, &eventq->deliver))
		list_del(&veventq->overflow.node);

> +
> +/**
> + * struct iommufd_vevent_header - Virtual Event Header for a vEVENTQ
> Status
> + * @flags: Combination of enum iommu_veventq_flag
> + * @sequence: The sequence index of a vEVENT in the vEVENTQ, with a
> range of
> + *            [0, INT_MAX] where the following index of INT_MAX is 0
> + * @__reserved: Must be 0
> + *
> + * Each iommufd_vevent_header reports a sequence index of the following
> vEVENT:
> + *  --------------------------------------------------------------------=
-------
> + * || header0 {sequence=3D0} | data0 | header1 {sequence=3D1} | data1 |.=
..|
> dataN ||
> + *  --------------------------------------------------------------------=
-------
> + * And this sequence index is expected to be monotonic to the sequence
> index of
> + * the previous vEVENT. If two adjacent sequence indexes has a delta lar=
ger
> than
> + * 1, it indicates that an overflow occurred to the vEVENTQ and that del=
ta - 1
> + * number of vEVENTs lost due to the overflow (e.g. two lost vEVENTs):
> + *  --------------------------------------------------------------------=
-------
> + * || ... | header3 {sequence=3D3} | data3 | header6 {sequence=3D6} | da=
ta6 | ...
> ||
> + *  --------------------------------------------------------------------=
-------
> + * If an overflow occurred to the tail of the vEVENTQ and there is no
> following
> + * vEVENT providing the next sequence index, a special overflow header
> would be
> + * added to the tail of the vEVENTQ, where there would be no more type-
> specific
> + * data following the vEVENTQ:
> + *  --------------------------------------------------------------------=
-------
> + * ||...| header3 {sequence=3D3} | data4 | header4 {flags=3DOVERFLOW,
> sequence=3D4} ||
> + *  --------------------------------------------------------------------=
-------
> + */
> +struct iommufd_vevent_header {
> +	__aligned_u64 flags;
> +	__u32 sequence;
> +	__u32 __reserved;
> +};

Is there a reason that flags must be u64? At a glance all flags fields
(except the one in iommu_hwpt_vtd_s1) in iommufd uAPIs are u32
which can cut the size of the header by half...

> +void iommufd_veventq_abort(struct iommufd_object *obj)
> +{
> +	struct iommufd_eventq *eventq =3D
> +		container_of(obj, struct iommufd_eventq, obj);
> +	struct iommufd_veventq *veventq =3D eventq_to_veventq(eventq);
> +	struct iommufd_viommu *viommu =3D veventq->viommu;
> +	struct iommufd_vevent *cur, *next;
> +
> +	lockdep_assert_held_write(&viommu->veventqs_rwsem);
> +
> +	list_for_each_entry_safe(cur, next, &eventq->deliver, node) {
> +		list_del(&cur->node);
> +		kfree(cur);

kfree() doesn't apply to the overflow node.

otherwise it looks good to me:

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

