Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384E2C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 22:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sdD3+Q8S5IkCF4m8e3gy30qcQAF+RFp5slh3qfQ0CoQ=; b=qXDjbz5cLqtu4sEcsQNY2igoT/
	PO+hqJ3rE4N6ZkdR9BRwi7Vg4J+fCvcTCKR5p9f+wnIKuRQD2Z3E+lAROk8qa0ww7VUxt/NhLpmlv
	y8T+Q67O5FdWIwYFli/UZtgJkwPnEOklaOzZjTZY6Iw+lr9uVKBYfGuzXagWgXFn/rrvpqgx7bfT0
	xH1SUzbh5pWtmbKotpgFoiBQgwjMxaqgYAzeN+xnrCONBhqEH1MDR2J/4z8Lg34+YEeYU9bAWzeyv
	H2dUq0AivP9a6ld16nlQDEi6LNosw8CXIKSieruWGCtrjE+IUSnuoOXA4yr8+rZcl42SqUa+6llM5
	1xr8HAlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugssE-00000000C3U-0RMS;
	Tue, 29 Jul 2025 22:32:42 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugsnd-00000000BqZ-0ZmN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:27:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753828077; x=1785364077;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=sdD3+Q8S5IkCF4m8e3gy30qcQAF+RFp5slh3qfQ0CoQ=;
  b=mKTODOPc4uXsxOOmCbc3UpGpkS9aC4vWcpQRSh/Z9hnE8RkFmfA9nqzN
   za/iV6p9XwBRrjwTe7GKYBcoG0fppV7nwZPsMQzvIxjfc7h/PQ9GCxhE7
   +HA3mwM9Akjw8qWPk65+xBfBXh6koWWmkwZdgxxVjQgIT/mnrqHTlTGpf
   9Pg6vv/lBawQisZhUBUbz9QIKt5NIz6dxmtsNz2eiUg2N52Ud0HpAruKy
   CvUSZSvEdfTqsjZc1q/vnjOcQp6pyy494zujPU39x/aCylsbZp1FTX/zM
   39UXsJkcIw9YIp3D8eryiBMrJ9AxOK2nP9Rc6dUJWrxuKAp/IzHM7HCyD
   A==;
X-CSE-ConnectionGUID: yoiRuvWdTRW6So+Mx0huyw==
X-CSE-MsgGUID: s/pyQTlgTZebJHTB3ASaPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56054216"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56054216"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 15:27:53 -0700
X-CSE-ConnectionGUID: EGimb9puSr2oHsEdboFyqw==
X-CSE-MsgGUID: pWfX8Uz8SUmHzvZVmEcHMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163598519"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 15:27:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 15:27:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 29 Jul 2025 15:27:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.50)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 29 Jul 2025 15:27:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhjZPzxIPF1CdVhEWnoGsz9YhIN1mipMjAhddGJu042lU8yTUvfsEvCOLwTD5z36DttJMnPhOH+/guDeAaMv1iK1TMIWrM77c/PUXfUHjyMOilWe0AkjE5mJP9klQBYffdh9a/g7NaBY0w7ARGQQtvGjzJv/qCjmRHQNyMeudS/R/BXKuAQLNnrw7VMQy94celDi1QRxpsvOOBQNq2Jbq1a3HBqNK75g7cLhXKw9FT5BPFCJdMzejQ2x2tTBaOa8C9v7dP7CF8E7z0wQI4vXyg2X8v4ffDsdosykkUk0SOSc3gElc8HIs/gZgJ1XvlDJQQZnfRgMQ5y0U76AhcAKmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdD3+Q8S5IkCF4m8e3gy30qcQAF+RFp5slh3qfQ0CoQ=;
 b=pLpszaKlNa3RiaekGSdMbusTz3mG6pXLkPJmzcgo0gTQt8SeuxNqqacyMaFw0kfpL//AeE8ILb32d+ZPYDhD/7Y/awS+pK8dHvZwlHHIcxPFGR6f9NQikv4iMGQk7RJA6YpNt4s1EoaDvZQGh1Ql2XM2AD4bZULGmYG1K8tehVtbehh5PX9bgf+zsAj+vWg6QBztN3Q9VJf5w1mhjFVzBdgPxuMN0j9aIxIQ/IeL3o0OSN22xMaVkDMyU4rxcoPgJn8dS6jGS1QVqSS3w5nUe59ujpo0gY42dagoL6jsGt/UBB0nchoDJ/eoTyadga+l4Y8uowzZmSVLDPnX9VssmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA0PR11MB4605.namprd11.prod.outlook.com (2603:10b6:806:95::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 22:27:35 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 22:27:34 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "maz@kernel.org" <maz@kernel.org>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "seanjc@google.com" <seanjc@google.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>
CC: "Annapurve, Vishal" <vannapurve@google.com>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"Hunter, Adrian" <adrian.hunter@intel.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, "nik.borisov@suse.com" <nik.borisov@suse.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] KVM: TDX: Exit with MEMORY_FAULT on unexpected
 pending S-EPT Violation
Thread-Topic: [PATCH 2/5] KVM: TDX: Exit with MEMORY_FAULT on unexpected
 pending S-EPT Violation
Thread-Index: AQHcAL+7V9fiN+6xT0aRmIRaSyEMmrRJrnYA
Date: Tue, 29 Jul 2025 22:27:34 +0000
Message-ID: <1d9d6e35ebf4658bbe48e6273eefff3267759519.camel@intel.com>
References: <20250729193341.621487-1-seanjc@google.com>
	 <20250729193341.621487-3-seanjc@google.com>
In-Reply-To: <20250729193341.621487-3-seanjc@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|SA0PR11MB4605:EE_
x-ms-office365-filtering-correlation-id: c31bec05-0484-4217-272e-08ddceef1dd4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MCt6MVZldEZ2OGg3b3AvdkZmVW9NM0hNUk90ZW9pUGlNSzZiS1dVckdwR2tz?=
 =?utf-8?B?YjlweGxJOFJXcVBIUDY3aU1XaWNlRHRxSGRPckV1M2ZqWlA3dW4rVGd4LzNC?=
 =?utf-8?B?UUEvZ3dHRmNLRVBBc2NaemxVRHhoU0h5a25CRWZpaHh1TXJ5SmlhRzJLWXda?=
 =?utf-8?B?SHpOQThyTUpack4wN3pTN3RyQ3R3d1M1Rm1heUUydXlPYWRDekw5aEhqZDVp?=
 =?utf-8?B?VWxZTklGNWZhVW84WGFCSjNJOXp2bFBvYlhUUzVEemVlREVkdkJ2WEhEMXB6?=
 =?utf-8?B?OG9KMGJRZ1M5WmxNR1Y2bmlLQjRXNWRRaWpmVzJhYTFkdHdKN1hKQzlSL01D?=
 =?utf-8?B?UTd3bWNaVmg5YjZkcFNKR0hvTlhkcUwwZXVFcnE1bVRuQitiRTM4SGlXWUZh?=
 =?utf-8?B?dlhvQjRSV0psUG9iYnJRSjdLU1lPUUIzVEU1blJrMUNRcU9pNXM1OHQrYnQr?=
 =?utf-8?B?Z3ZHU1EzUFlSeXFKSW96Z3oyS0c1ZDZibjVrY3dubHdoTFlLSHJHS0tVN2FR?=
 =?utf-8?B?TS9YWnRWTG1PY3B0Q0NEbHNsNDl5bzY1ZDMrOWVKQm5kQjhBbmp3cFhTMXQr?=
 =?utf-8?B?TkJONmtwRDZuRjhHc0l5YlluUmdxaWozZkI1KzdpbjVTWlJpUWpWTURIMWM3?=
 =?utf-8?B?czkyMG9UYjFmMGtRRXdzOVhuOVBsNityVnJ3eFgrZmpqUUNTUVRQblRmMkhH?=
 =?utf-8?B?SkRXYk9xWms2YWhyWm90bmJVc3EzRURqRWNMWmFKMnJpSEl0aDNQOURqcEU1?=
 =?utf-8?B?M3dVQzFVYThFMUlVZTBLV1VkU0Zsa1J1YWZaOXRwNnhGNlFYd3VzR2lRemNn?=
 =?utf-8?B?YnJwenZNbXdHR0xTUjU2RHJrTlZrY3VIRnYwRmI0Y0JsN1lqM2pVVGNkUHl2?=
 =?utf-8?B?MURsemlkMHIyRmpRTENBWXlXTVhMVGpqUlRBNEFZcjZaS2Rlc2Z1ZHhkeEdP?=
 =?utf-8?B?RG4vVTcxc2hFQlFQa1FHUnVmRTZmdG9JVmY4YnF6d2VsTC9wK3FNYlZ6YlV4?=
 =?utf-8?B?UEVaVzBMT3JlS3IxcW00bFJncWtNc1YyMWlCdTBhTHJnaElEYkU4N2lTa2NI?=
 =?utf-8?B?ZnMvbUcyL2VNYmVoMFdRMFFER3FnWlFCN3N5Y0lzaEtTWWZxZUlJTDZEMkFh?=
 =?utf-8?B?aDNETXc3SmU0VkNVSE1LazdpTTRZN25aNHNUYmVPVVBZa2xjL1dGMTE0RlRt?=
 =?utf-8?B?dWJ6M0VTMmZGaWdKc211OFB1SDRLUk5TblI0WjB3VWIwcW5STitadGlzd2tL?=
 =?utf-8?B?dkQ5b1ZENmRzSlNSMUtHT3NtUno3OGlwVW5PUEQwNzFyTzhINTRXcndrRmdo?=
 =?utf-8?B?c2RlZWtnYllzUWVINWpuN1daQnpKbGk5Sll6RWdLVWNPSkVBNkc0VkZHcFNB?=
 =?utf-8?B?Z2FCTndSQ1JjUFI4N1FYR3Q2cVFQcW5OdTJUeFM0V2hoZlFTWVg1ZDRFbEJh?=
 =?utf-8?B?QU1NbXQ5V1E3VWZZTjI3TlR6RjA2dFU5ZnN1TWxudS8vZU9UenpjRDFuL3Fk?=
 =?utf-8?B?ZlFIRnRnWlBmUDZvNkwrZmxzZVlwd2RIMVYwMU1jRWxhWDlLd2hyRTMzTlJY?=
 =?utf-8?B?aW9IRk43SEF5VDA4ZmF6RkpRQVJ4VElEOUkwTmtQUWtuZThwZmdtcTV5NFY5?=
 =?utf-8?B?M2dqVjV5RytzYm0yT0JKN2dGbUh5a3J3cUJDeUMzVkdhb3plRWhnUnlFbEFn?=
 =?utf-8?B?S01YV1lhVitxbFM0eVd1MkxQQmxWR0w4RTRwL1lZV2twd1RpVEdqc1Y1Mi93?=
 =?utf-8?B?RzNIM0xzZ3RnUHc3VTVkQ0tHeEVwWjJiemorUW1mc2Jnbm1tL0YrbTV3THg1?=
 =?utf-8?B?cS9Wak1kVmNxekwyK1psSXZXNHpGR2p6Z1BiMmNQZDBOZDR6OXRqRWFiRXQr?=
 =?utf-8?B?c1JxdmgvUnhhNzIrOVVPVnVNVjNFb3JGblEzYXRaTU5uRzBJSnVPZ3dnRC9q?=
 =?utf-8?B?dGdpOTVrNU5EZldWdWFIOEtLZ0VWTzVyM0loWTd4bUxzQWZBY21MTGcwdU1l?=
 =?utf-8?Q?i+ovlD7mk/aCaNSottTFb/6VuAOT4U=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0tGU3B0cXpBbzVGUXArQXhEN2hOMkt5Wjk0WTFzVU5uUDd6VVZRT04wTCt3?=
 =?utf-8?B?dTVCeHVBVEZzdEdZdHlGVEF0K3lBUEdXYnFwZlVNUUVTcG40QnY3MUdVd3l6?=
 =?utf-8?B?LzMxZ3pUUjkxTkdhNzQyeFBNTEhUYjNleXRIZndHVVgwZEppbTQxbXpqUjhJ?=
 =?utf-8?B?ZlJxVGRQK3RicVBDSE1sQzY4SEZad1pzQVNMT2M4djNOWnBrc3RLd1ZCQU5p?=
 =?utf-8?B?RW5zdEoyVEovdnRxelcrdWJJd3ArUUdBNkQyRHhFdzhNMHpGTXBWUWN3UVNr?=
 =?utf-8?B?cDZUNmxxdW9oc1lQek1DUm4rQnhTS0RPUFd6akRYaEJOY09yc1pscHV5SXZw?=
 =?utf-8?B?OHQ1eFkzcTIyVVlXL29tdGFpbWRySkhYN0FGbE5VSmdVZ2czaU8xWGd6Ni9y?=
 =?utf-8?B?YUQzMkdVSFRNTEdOK3haUlAwVDcrMVVPcExyMitDa3IwUlZ3U0xxaG01azVI?=
 =?utf-8?B?MmdNcWU2TUNibmV4WjFXSmNla3Q1bzV4RktBbnpHa0UvbHoyL3B1VFlNdnNN?=
 =?utf-8?B?QjNSempaU0pNKzRmK1FJaU5yL3NralNZSmZSQnMramtybHY1bmk5V2tGUTQ2?=
 =?utf-8?B?MW5EMUxvNDhzNDR5MzFXZmM2djB2bnM1VktGdTFXYWZuT1lIV3NKVm9Kb1lw?=
 =?utf-8?B?TkVDMXZWQlU0bzUvZXVzKytrZWlTL0JKODRXWDZobjVHMjVGa1lvbEIxZDE0?=
 =?utf-8?B?NCtmZFJKSFFjV2VpamxhNG9tMHJDMFdSQ2Nvemh6cTRxWU8rakd1Q0UzeWlx?=
 =?utf-8?B?am9KL2pFdmJnaGJqZ1ArdnJMcTVJTEFqRWxaOHlBSUFwNHM0SW0yZjFXQ1VN?=
 =?utf-8?B?S2xjRENqNG9LMVRzTitMRTVBU2lYdkR1eE1IRHVFSnQza0loYTJXVE10V3Iv?=
 =?utf-8?B?WHlaV1hnZXdUT1pUUmdvRk9oaTltVkFWd3BPZC9hUmE3cGJpOG0vdTUyT2tC?=
 =?utf-8?B?UjBlVHBuTjFRQVpiRTBleStiaVF3OU1qQ3JFMlphMXNJcGNNYnFxNlZQNnYy?=
 =?utf-8?B?TDN0MzhpVGp1aDdJQ09uQ2ZiZ2Y0a2NVcHFmMWRXamJ3R1IyQlBUcmxDZGVv?=
 =?utf-8?B?bGFzcjZGZit4M3VmUllaV0FLc1BpTGpmc3lkb3pFYjRnd2FsbU8wMVZUSWZ4?=
 =?utf-8?B?eDBVblptR3RHRzEvS3VvTFBPeHdjd01OTVpSdXhrM1lqeDVicDdOYUFnejdt?=
 =?utf-8?B?NmRmd2IyMk00VkJXKzdJRWl4bmRTR3VrSGNKWWNGLzBDcXlCaXlEcVJPOUxT?=
 =?utf-8?B?dnZtYjR1Wmg1Yi9ScjFxUkNiTUVmS08xTHF2Uk4wUlF6a1M0emxzemlsUmRY?=
 =?utf-8?B?Rmx4QjZDM2R2ZmJIQW56WXNONlIxTm9wSk1kZDFpekRXWWtjNWJYN2QvSDh6?=
 =?utf-8?B?elJ6TWRxSFpxQzdqdkY1SjZ4aU50MndPUW1MVGxuVTd1TW5aMnBUOVdranlz?=
 =?utf-8?B?bE1zOGdodzhDcEtuNVd6RDVIZGNIZzg0UUI4bk1ma1ZtTDliQ3RBZlBHQ25j?=
 =?utf-8?B?QmZZd2xDZElOTllwcWo0Tkp3dk9BcUsxUktwcS9PeklqalhuQVVBMW9nYUhF?=
 =?utf-8?B?Qk83SFk3cEUyU0g0L1Irc05HL2RJV090OWNQQVRoUDM0L3VhQ2hNY0dKd2t4?=
 =?utf-8?B?SmhQSlFXdDJ1amVyUTcrSHlwWXVNdW5mSStSTFJ1MXc1TldZZHEvYnI3KzZl?=
 =?utf-8?B?TkFBSzNIVW1obmlHSXRSRDNza3dyemIyS0ovMFRBVWFESlZYK1Z5M3VZbXpX?=
 =?utf-8?B?UEdGdVhTZ0dNUXhoZVdzTGZ6WWtnRDdMeXVUWUJvdmNWL0RoZktaVGMyWjhV?=
 =?utf-8?B?UDRZbXl2YW43WExmcys4MEQrR2lzRjdYK0tSRFd6SU9vajZ2eTkrcTlzYVY0?=
 =?utf-8?B?YjlmU0hycTEwM0RqK0NGZm9HaEswYlBwTHpwWHRCYTNOMkhTM2dwRjhJUjZw?=
 =?utf-8?B?bW5TSjRXWHhNNitsQkJ4bHJhV0EvOUg2dkMzNjd1S1JJSzQySEJ3NHR4VkVw?=
 =?utf-8?B?NGVjQVlNMnc2WmdFM0s2cVhYUm1iaWREb3NwR1ZBcktEeDYwMkZ4cHFROG9G?=
 =?utf-8?B?T21HbVkxQ2l0b3l0L1hsenhIcEhaUU81V1RBNWo2cUNpMjQyTE1Odlc1WCtN?=
 =?utf-8?B?YVFtOVMvRzJheWM4RXF0Q2g0OHdEVHcwOEo5dG9ZRzNuSWtrRnRheEw5amdy?=
 =?utf-8?B?VXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <339A614E24C8EF41BA9CBFA5AEB70C68@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31bec05-0484-4217-272e-08ddceef1dd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 22:27:34.8852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c5uo52Z5BggsTbEVKCayqC+tYV2lfEbvWiw6EbkFSlZU3GLuwGLOB2lcZ7Fn1+LusKT5u5YsyN/NrT/QiRfIiuOWKGNOHQtqPzEfsQJEUhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4605
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_152757_190094_1813AD5C 
X-CRM114-Status: GOOD (  15.35  )
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

T24gVHVlLCAyMDI1LTA3LTI5IGF0IDEyOjMzIC0wNzAwLCBTZWFuIENocmlzdG9waGVyc29uIHdy
b3RlOg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3ZteC90ZHguYyBiL2FyY2gveDg2L2t2
bS92bXgvdGR4LmMNCj4gaW5kZXggM2UwZDRlZGVlODQ5Li5jMmVmMDNmMzljMzIgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gveDg2L2t2bS92bXgvdGR4LmMNCj4gKysrIGIvYXJjaC94ODYva3ZtL3ZteC90
ZHguYw0KPiBAQCAtMTkzNywxMCArMTkzNyw4IEBAIHN0YXRpYyBpbnQgdGR4X2hhbmRsZV9lcHRf
dmlvbGF0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkNCj4gwqANCj4gwqAJaWYgKHZ0X2lzX3Rk
eF9wcml2YXRlX2dwYSh2Y3B1LT5rdm0sIGdwYSkpIHsNCj4gwqAJCWlmICh0ZHhfaXNfc2VwdF92
aW9sYXRpb25fdW5leHBlY3RlZF9wZW5kaW5nKHZjcHUpKSB7DQo+IC0JCQlwcl93YXJuKCJHdWVz
dCBhY2Nlc3MgYmVmb3JlIGFjY2VwdGluZyAweCVsbHggb24gdkNQVSAlZFxuIiwNCj4gLQkJCQln
cGEsIHZjcHUtPnZjcHVfaWQpOw0KPiAtCQkJa3ZtX3ZtX2RlYWQodmNwdS0+a3ZtKTsNCj4gLQkJ
CXJldHVybiAtRUlPOw0KPiArCQkJa3ZtX3ByZXBhcmVfbWVtb3J5X2ZhdWx0X2V4aXQodmNwdSwg
Z3BhLCAwLCB0cnVlLCBmYWxzZSwgdHJ1ZSk7DQo+ICsJCQlyZXR1cm4gLUVGQVVMVDsNCj4gwqAJ
CX0NCj4gwqAJCS8qDQo+IMKgCQkgKiBBbHdheXMgdHJlYXQgU0VQVCB2aW9sYXRpb25zIGFzIHdy
aXRlIGZhdWx0cy7CoCBJZ25vcmUgdGhlDQoNClRoZSB2bV9kZWFkIHdhcyBhZGRlZCBiZWNhdXNl
IG1pcnJvciBFUFQgd2lsbCBLVk1fQlVHX09OKCkgaWYgdGhlcmUgaXMgYW4NCmF0dGVtcHQgdG8g
c2V0IHRoZSBtaXJyb3IgRVBUIGVudHJ5IHdoZW4gaXQgaXMgYWxyZWFkeSBwcmVzZW50LiBBbmQg
dGhlDQp1bmFjY2VwdGVkIG1lbW9yeSBhY2Nlc3Mgd2lsbCB0cmlnZ2VyIGFuIEVQVCB2aW9sYXRp
b24gZm9yIGEgbWlycm9yIFBURSB0aGF0IGlzDQphbHJlYWR5IHNldC4gSSB0aGluayB0aGlzIGlz
IGEgYmV0dGVyIHNvbHV0aW9uIGlycmVzcGVjdGl2ZSBvZiB0aGUgdm1fZGVhZA0KY2hhbmdlcy4N
Cg0KUmV2aWV3ZWQtYnk6IFJpY2sgRWRnZWNvbWJlIDxyaWNrLnAuZWRnZWNvbWJlQGludGVsLmNv
bT4NCg0KQnV0IGhtbSwgdGFuZ2VudGlhbGx5IHJlbGF0ZWQsIGJ1dCBZYW4gZG8gd2UgaGF2ZSBh
IHNpbWlsYXIgcHJvYmxlbSB3aXRoDQpLVk1fUFJFX0ZBVUxUX01FTU9SWSBhZnRlciB3ZSBzdGFy
dGVkIHNldHRpbmcgcHJlX2ZhdWx0X2FsbG93ZWQgZHVyaW5nIFREDQpmaW5hbGl6YXRpb24/DQo=

