Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A4CCD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 07:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkC/ryJ7JLFQiKV6Zn/NiF5QszhmiDVLt4SWfpfZJ1E=; b=Jek5Dp9lg85uW9t9sPT+dDp4ko
	6D5ZBhBy//R9nkKUp04o+du4r1RMyc/5dL5wNRzDltmmkVLfttfc8IHjEY/bjR/IQB73yU/ucg1s5
	xvpCOzdjiuNe9+RaWiS63b34cfTTk5MnQYMBicMxrt/TgRuBNXsFPwG/U8LidvLGUVjm7xiV17amV
	XaT+Tyybp2pGhHOO7FEw/kKifuJCvwramAnZ1qb5vtHjJD45JkTtPL0yqjSCReUUtJvIhuZQZ6zWl
	gisMFYASW4n/AUOxlKnCD6aY9JL7gXJZl4gb2zvLxl7Et3yYX5eSM6Yjclc/yTbC/JQqFeqOsOvPi
	P74zYeJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRm9O-00000001G3D-3ywu;
	Tue, 26 May 2026 07:24:30 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRm9M-00000001FpI-017W
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 07:24:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779780268; x=1811316268;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RkC/ryJ7JLFQiKV6Zn/NiF5QszhmiDVLt4SWfpfZJ1E=;
  b=cP4snfCrNMNzA/m4a/ou8Kxx2lJwHlbvKWIUT5O2KvCZrsOg3SeW7GL5
   t/R+weZrPKHSBBZ86oGXwQndIt6o8OucWgz4O/Q9DbcvPMm7ZC7OZF5BE
   C5VIPn6yzoK58Cw7D8IQwZuX3ICb3wjZGXyega8NX/d7uriIG2niwLWo9
   7wBx7Sh7dlXr1hGbuPI4Y+UrmkhDtERy/XeRMYqMyXIzPJtMUziNP+UiS
   Kz+odJVHLIwvf6QdIFCTucxfj4NRADmakh2fo2UuhpKstP4hnHpnbAHD0
   9qlwqH7g6TKP3VNMZ0DhpRroJ3oeGqlAkaPh3Nm8w8u1bQnSIx/CQg4vx
   Q==;
X-CSE-ConnectionGUID: iTWd9TBSQfS4wzMzggNoPg==
X-CSE-MsgGUID: KMUTKHEVSES2nJVaZYgS9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="106045434"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="106045434"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 00:21:14 -0700
X-CSE-ConnectionGUID: g9ZeM98rSrOHz6yJir8nVg==
X-CSE-MsgGUID: 9DWIMSQBQ+2YBdNVw3uBiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; 
   d="scan'208";a="237655835"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 00:21:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 00:21:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 00:21:13 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 00:21:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSihexQsF+01w/CU1rubKJ4hKnPcq1HdaIzs4F9/MmWPlN9mhSs1SiPixo/+nyKiQCg7hsDMhF7B0tjrxrehGwuGvb2KJFweBz3VYm0W2yhLabp81LgOD7yHmgeGkGGfiymOZk1e5S/Pkcf55bCP9ESDCfCvE9tbUYkoGT/s30J9+kbhEqqqOmIP7XvRlnD3CxupfI1vH38QE0IbnmpNLNe6WDXjeRb6CyN8IKvov4Aci/e8BeGH/mKt7Es0hiniklR0fRHg5DKLRZP23M5CNAmUsph5E/bOeee1t0S0wl87H3lyhThlR+G4VeYKAv4XcBggCkn542PJpPkpzaRNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RkC/ryJ7JLFQiKV6Zn/NiF5QszhmiDVLt4SWfpfZJ1E=;
 b=jnHPItcis8sJaK5apHn0qYtUDzaAncNB4IPCu8UHWpMvOv4qlZz+v7nASCpOrGMEmSLov3VL4tBZtjiV4j9FCWIyXMhXp/306ZR5zlx1xmT4OGt8od54MgMYm5Q7Betp/0qJJIf4MBDsGljn8PtjSWcp53ykKgER91ej32jrLTCpdftViiG8JQ6ebzia/n1z5gMP7bIiTq8+hqkmR6Wmdd1/A7T/jR2/SDEcWhzRvyq22Ed+DfHhgqxsVsE0Ic5C8djP+e5kfxdbsXLEOkOUnGHCUwj+/yFf1ny5Y1tjAVo++ehYRzrNRcmQFQZ0dsEpwT8x7Tit2ezFiadcvMAxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3690.namprd11.prod.outlook.com (2603:10b6:5:13d::32)
 by IA1PR11MB6100.namprd11.prod.outlook.com (2603:10b6:208:3d4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 07:21:10 +0000
Received: from DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b]) by DM6PR11MB3690.namprd11.prod.outlook.com
 ([fe80::7db8:f6b3:30f8:ee4b%4]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 07:21:10 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Joonwon Kang <joonwonkang@google.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>
CC: "Alexander.Grest@microsoft.com" <Alexander.Grest@microsoft.com>,
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>,
	"amhetre@nvidia.com" <amhetre@nvidia.com>, "baolu.lu@linux.intel.com"
	<baolu.lu@linux.intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"easwar.hariharan@linux.microsoft.com"
	<easwar.hariharan@linux.microsoft.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>,
	"joro@8bytes.org" <joro@8bytes.org>, "jpb@kernel.org" <jpb@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>, "kees@kernel.org" <kees@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "praan@google.com" <praan@google.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "ryasuoka@redhat.com"
	<ryasuoka@redhat.com>, "smostafa@google.com" <smostafa@google.com>, "Mehta,
 Sohil" <sohil.mehta@intel.com>, "tglx@kernel.org" <tglx@kernel.org>,
	"will@kernel.org" <will@kernel.org>, "x86@kernel.org" <x86@kernel.org>,
	"xin@zytor.com" <xin@zytor.com>
Subject: RE: [PATCH v2] iommu: Allow device driver to use its own PASID space
 for SVA
Thread-Topic: [PATCH v2] iommu: Allow device driver to use its own PASID space
 for SVA
Thread-Index: AQHc6Gp7+Rzmy9QGK0OfKEU3ud75L7YeaBpAgAB9mACAABXBgIAA7cwAgAAFk5A=
Date: Tue, 26 May 2026 07:21:10 +0000
Message-ID: <DM6PR11MB3690699A3178F1559D4BE1CA8C0B2@DM6PR11MB3690.namprd11.prod.outlook.com>
References: <20260525164715.GA2487554@ziepe.ca>
 <20260526065822.914216-1-joonwonkang@google.com>
In-Reply-To: <20260526065822.914216-1-joonwonkang@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3690:EE_|IA1PR11MB6100:EE_
x-ms-office365-filtering-correlation-id: 888df35a-fc53-423e-13df-08debaf75c56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021|56012099003|22082099003|4143699003|18002099003|11063799006;
x-microsoft-antispam-message-info: RA0F1axFurjleCpEPHPNibEuTrbImXoJ8hfHjEUPaz4UvOH78A5BTRPG7veEFBEEYetBVeTiX0VAihw86tyH8Cb4k+9Z3odtlO7r4FV2xQzsUQ2O4+bHESHMxlHdtqAI2XpLDoWgra/NQuDMXUb/SqsaYDWPo6Hef9glWVPm64onUnx2H6NOOtUaHyqAa3uJOuZldvAKeRYrk7ZVV/7Yuztlv70kbbsFKoWa+LAROy+t21s5yuOnEsKwfLcPrwJTgp4hUDEH60vF7C6d9BmvqAocHgLZNS+tFQL0xWuvf9X8l4lISflHUuNCQwLzOvuv4jg1s1TC8p+3sllMKbNZgpIqX7rdnVUNS+wF/2gEcEeMxJWBFM2jNriRWETffn8RVBjCgvvNPVz8iQ7+X8ucX/t5U2TpobMM/awzeXGeGBS0rGmCyVYKChzPbXuKE+7bXmHGZ88CVNLKccLplgYyDxXM3YXcUYsIyeWofR9g4nkQd77nNvdGRO9gq8JluDLhm0tHsb36RgxLl5rnsIbBwJJ9aG0wOJ9z5aXgfLOIxqnIwb2NgQcZiIIisRharXv18F0rhX+rTEcqmtYpkCQzLeSqBiHr9Evx1yiXZwPm48oMsrSdemh0+sJs2NRbWdfDmm5rSHfsUZ9CrQUjjJyO/KfAQM2Uv/mYTcgtGO09cHZ+i4eVq2quDd1kyWzu+FOWrOKtoCrVHZ1rx+kolRjxfhPdVFlgHNOhEp6OGg5UjZ9S85ZAZX1HxnZ69ITfBAw/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3690.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(4143699003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V3I3bURXd1NxVXZPM0w2RjI1enNDVm9CWWh4Y2wrNGZkeDlBdnRNakN3bkVH?=
 =?utf-8?B?UFVVbkJDZ3RwZDNteUhyK0ZSZUVpZVR5enlTYlU5ajV1dlVsYkJNQWV4VTJj?=
 =?utf-8?B?bUpRWDl5SDhFYjhicHh5QmlJdU5rNUVHMTBialBHditINjdkTDJreGFaZUNx?=
 =?utf-8?B?cTJpLzFHMkpuL1AzUDhOODV4VURuZnExMU1GQ2NIODdJa2VUWE8yeFhsNk80?=
 =?utf-8?B?QkRFOUU1ZUJZWmdJUUZrdEg2K3k4NWhEMzZFNUF4WlNCMW5TMUQ0RVZrUlpO?=
 =?utf-8?B?UmlIeW4zTkNmdHJ5NHFuSlJWdDJDZVpNc29tcmZpc3l5RW5COHNWU0NUdDZ5?=
 =?utf-8?B?aVNJZENVeDEvT2tHOVpXWXV2MG9MY01sT2VnZFczd1Z0Zzg2TTIzZTduNlo2?=
 =?utf-8?B?YWhMYUlaT0RxTDZ4TzlCTWhhYlZpcldiQ3E0TUNkS1JFTUswcU5uR0RmSFVM?=
 =?utf-8?B?ZFJRQ1lzOFB6djlFTzFuVmVacnVJUlpmb09KbTJYUFJqWHIrQS9NTUpQWjZv?=
 =?utf-8?B?OHBhTFlLYzkrRU9CU3RtN0ZmRlY4dzdzSVErcU5WeFhZbzlvbDQ4SjFmUUlB?=
 =?utf-8?B?WWljdkc1WFh2VE9TVktBd1ZJazJ6N05ha2pUYzlVQ2FrQXBaNGZrZVpiZ0Yv?=
 =?utf-8?B?NGY2T0cycFcwWVFFWFRuRzJFMEpremdodXc0TVUzTzd0Ui9Ed0g3OXkyU09G?=
 =?utf-8?B?Z2hLOEZsR2pKcnpnMnh3am0vR0V4bFVqQnNCVVBLRm1WNmFJQ1F6TzRndFRv?=
 =?utf-8?B?Qmx1NEYwcnFWTGRScjFUaUlVaUNyWVkvTGVNaitnV0ZEdjNJUU8rUjE2b3Zo?=
 =?utf-8?B?VTNGSStBaHNaQmlxQ1l2cGM3YzI5WGI3QytTSm9LOGphTlloN3NkVlJZOFpo?=
 =?utf-8?B?TFo4TlpKWmloSWovMWRBNStmTHlyNjIwc0wyK2lKcEw3REptVmdHQTdtZ1JQ?=
 =?utf-8?B?azV2SjJsSEk3Ni9QQmlHQzdKMjBlSnF3aDF6cTRUcGJxUGZlVjFFdHp0NUJx?=
 =?utf-8?B?TFcxakNPa3NzYTFxV1h3OSt6M0VWajE1UDRqd1hjZ2ZLQVpGYTlsbzZaL0dD?=
 =?utf-8?B?WDhQUG8zM0lqRUoxajJ2bjZJYW9vc216L0c5bElDOGNGVEh2YzJRbGc5dGox?=
 =?utf-8?B?TnVVNS9ZSGdDUWxxcGxzaUZtY0VnS0VuVC9DTGZlZzF0anpuVkRvMW5IdE5k?=
 =?utf-8?B?UjhRYU4vQ2YzbkIzRzJBY0VmeHF6OFFvcVlTd0w4SGFtWWVoM0FacFpKdVZz?=
 =?utf-8?B?aGRpbU9BdnB6akN2VGlNZDVIUnhQcC9uSEJDYXhtYzV2aklPZURLRFlJL3BW?=
 =?utf-8?B?K3llNlVGTTQzcWFGczg5Y1dlSDBsRVBGS2RwUkVtakhsWU4wZmRDTWRoYk9R?=
 =?utf-8?B?a1lIcXl0M0lmTWdTMjNzT2QwTWhGck82NXpicXRrYjQ2SUtMNVF0cGlvRCt6?=
 =?utf-8?B?Qm5rT1B0U0E1eE5hSUcvTHNZd2Y4d3dFdmVTdFhUV1FmRXErUGl4YzZvdzNx?=
 =?utf-8?B?aXFoZ3lXVkwxWjhTbUNvazFZdFZYQ1JsUnBybGhGcEFKUnk3VmwxVmdUTGQ3?=
 =?utf-8?B?Skh0TlM4dWlOL0tZejRwZTZYbnlKRFUrZTJBUURHVkFoT2lwRnlVUVdhZDZo?=
 =?utf-8?B?b2ZFVDR3VG52eUFFUDBOcktrNjFNaHBxdjkvZzRybkRhUDRVdVJDODNEaTBS?=
 =?utf-8?B?S0l5aW5WV3ZKNXdxQVVVc25remg0TmQ5VWloTFBDU004L0ZPZWxTa0l2enBT?=
 =?utf-8?B?TFdUbk1WUDd2S2V3NDNmWXU2aGt2R01hQS85QW1mc0xqVXJDMFF1M0xwZ2pM?=
 =?utf-8?B?WnJydngvTjRtV210ci9NTHFnUmVmNndGQ0MxRWxUZklQMEQ1bmZEc3hoZVFK?=
 =?utf-8?B?UEdYem0xWUdxZTBySUNXWWJnYmhNNjlWYml3anRmaXVDVmkvTGI5TVZKQ0M4?=
 =?utf-8?B?cXpWSUR6VzhNRkdlZ0I4UmZzMDc2UGszdUdNdlNZaThNWkYzZDkwdFRhK25a?=
 =?utf-8?B?TEhIT2ZnVmhlOCtpZHRHU1lJeVBjM3pxT2drZjJkZ1RRRXJQaVhKNUt5bTFY?=
 =?utf-8?B?YUx6ekh6NzYva01WdTUxVTdyaGhWcDFuL2d1ZGVXTzhubHJUN0RubkhFcHhW?=
 =?utf-8?B?RWhoQ2UyNkQ4WHh6OHNKYmlETDBLMUJwK1NETkh4VHJyZ2pKS3VPWmlxS2Zt?=
 =?utf-8?B?akE2dEFHekNHakE2RHZPZ0gyV3dFZm56THBUc0ZvU2lWUWc0dXU3YUQ1Mmdh?=
 =?utf-8?B?cXYwNnFMS1ZuZ2dPeGxUa1FvNXF6c2ppQUx4Z0tpZUlPOExTbjFLOTJqcm92?=
 =?utf-8?B?azQwMUNRQ2Z2WnhqT0tzL3pkUG16RTduZ1NOREk1bnh2TEdIWWp2QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: o5Ag6+1C3Cz6C4GGPQ80PflMdfwGkkH0Pls7LJqMiLZleS9ov8FAz9Ch/MAs22Va6uGpfYFWCn8J/EKkWeD8YMsH3FMZOJV1Y525+iuhLVFN+/c0/LTzPTtbMHjgfu+ibn6RkYFK+11aDMB1T/QSIBlSZBHB72TgRCMxI52bX4uki8tJyN5LgNBS+7oOzU3+RQrqgFttd7T1QOANcCYbWi9sIYwet8/XRW730cpvZCxyTYktF1pzrqvifrlY19lkVs52Oajw946hMovBMtsd2SYo0u4t/swt26yJeUKRdlJJJeruZv2HpDLGzE3fkhO4M26Z+evBAo/DTDsoV0IhCg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 888df35a-fc53-423e-13df-08debaf75c56
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 07:21:10.1991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t4Za2DhvKtQ71IbQVpW6Nf9J0bYjt66enjaXoPy9W4ghvz3Hj1zyJoBlRwVr8nKMPV2+7rNbbPNutFO9FLlqwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6100
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_002428_197806_937A2B20 
X-CRM114-Status: GOOD (  19.08  )
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

PiBGcm9tOiBKb29ud29uIEthbmcgPGpvb253b25rYW5nQGdvb2dsZS5jb20+DQo+IFNlbnQ6IFR1
ZXNkYXksIE1heSAyNiwgMjAyNiAyOjU4IFBNDQo+IA0KPiA+IE9uIE1vbiwgTWF5IDI1LCAyMDI2
IGF0IDAzOjI5OjI0UE0gKzAwMDAsIEpvb253b24gS2FuZyB3cm90ZToNCj4gPg0KPiA+ID4gQ3Vy
cmVudGx5LCB0aGUgb25seSBrbm93biBleHBlY3RlZCB1c2VyIG9mIHRoZSBuZXcga0FQSSBpcyBv
dXIgdGVhbS4NCj4gU2luY2UNCj4gPiA+IEkgdGVzdCBpZiB0aGUgcGF0Y2ggcmVzb2x2ZXMgb3Vy
IHByb2JsZW0gYmVmb3JlIHNlbmRpbmcgaXQsIEkgYmVsaWV2ZSBpdA0KPiA+ID4gc2hvdWxkIGJl
IGdvb2QgZW5vdWdoLiBEbyB5b3UgbWVhbiBtb3JlIHRoYW4gb3VyIHRlYW0gYnkNCj4gImFjY29t
cGFuaWVkDQo+ID4gPiB1c2VycyI/DQo+ID4NCj4gPiBIZSBtZWFucyB5b3UgY2Fubm90IHNlbmQg
cGF0Y2hlcyBsaWtlIHRoaXMgdGhhdCBvbmx5IHNlcnZlIE9PVCBkcml2ZXJzDQo+ID4gdG8gdGhl
IG1haW5saW5lIGtlcm5lbC4NCj4gDQo+IEhtbSwgaXQgZ2V0cyBiYWNrIHRvIHRoZSBjaGlja2Vu
LWFuZC1lZ2cgcHJvYmxlbS4gU28sIGRvIHlvdSByZWNvbW1lbmQNCj4gZGVmZXJyaW5nIHRoZSBw
YXRjaCBzdWJtaXNzaW9uIHVudGlsIHdlIGZpbmQgYSBuZXcgaW4tdHJlZSB1c2VyIG9mIHRoZQ0K
PiBuZXcga0FQST8gSSBiZWxpZXZlIHdlIHdpbGwgbm90IG1ha2Ugb3VyIG1vZHVsZSBpbi10cmVl
IGFueXRpbWUgc29vbi4NCj4gT3IsIGlzIGl0IGxpa2UgSSBzdGlsbCBjYW4gc2VuZCB0aGUgcGF0
Y2ggYW5kIGdldCBpdCByZXZpZXdlZCBhbHRob3VnaCB3ZQ0KPiBjYW5ub3QgbWVyZ2UgaXQgdG8g
dGhlIG1haW5saW5lPw0KPiANCg0KSXQncyBub3QgY2hpY2tlbi1hbmQtZWdnIHByb2JsZW0uIEp1
c3QgYWx3YXlzIHNlbmQgdGhlbSB0b2dldGhlci4NCg0Kc28gbGV0J3Mgd2FpdCB1bnRpbCB5b3Vy
IG1vZHVsZSBpcyByZWFkeSBmb3IgaW4tdHJlZSByZXZpZXcuLi4NCg==

