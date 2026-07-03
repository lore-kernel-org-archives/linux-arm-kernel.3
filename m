Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084ADC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kynkT9xSj6cpTiivgOwKBoN9sMhgEVuYlOdBIgNNMA=; b=u7I9veydwxMzDj9za53g89PBLO
	GSVD1bZRxUeTqJixLH+xXQvs+NS47Isb7MPByO0W1Tmmtz8Xu0K9rOQ8GxAViTXpP3NzkKp3DiwX1
	Fhncoqbj7SRIDntLS1lzYL3OY68KkSXUzLP1ksklA1jkeKsCAR/EICsxGeqRphpANCZpWwQXR7WZv
	cD+kgeOCjmWB/Li0vhMXMHPnnlOiBwdHh+tgjDp8ojaYx/fTdsN0tZFGdNYgu5qnacDMzvn1lct/d
	zp0xB2URJ6rMLNFAvMPfh+QkkqGhvSXHbMMkPmNokZKfzzyGBNW59u3nLBGiGInznAQ6Ej2NdNSAj
	JwSgab3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXR4-00000006AWW-0d4O;
	Fri, 03 Jul 2026 06:31:38 +0000
Received: from mgamail.intel.com ([192.198.163.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXR1-00000006AWD-2Dyw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783060295; x=1814596295;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+3DykHsSij1gDU+SL6Yc6ThSVc+1bUQhikS1ogcyBkU=;
  b=PWTEhi4fIwbAsGNz0jdSVh1/HyC5Ot6gAxtAs7yCFEkfcLWM3DcgW1PB
   GzKniLBvqlAs4/TTML5kErGn3IKk6kgfOXw0O1n6nwloI+3DndTxmdP0I
   1JiuTxK42ah91igFAyDmNPqzUzqecex5UIGKS5SMPDLRv2HnWc5YoaXAB
   lqgaxrxSORUL4kiGwvVsgJXcmvxZxIWjNHKk2Z3p0NpFwUR8JuAZ4jy0V
   Iw/bxfjTRQPqlcktEznJyHiHzK+cDFFY82oFsLBt3M8UG7evCzG7Q8pnA
   1LnMkHFbYv3Gb3K3PVN2PYkiNzQLp+tT9uo0WjR8hiEvh4ckqyK5aqWEn
   A==;
X-CSE-ConnectionGUID: yIcL9T4SQUifFZOlIGwIfw==
X-CSE-MsgGUID: O8CybK2oRJK/uyzLyjcHiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="71331153"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="71331153"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 23:31:35 -0700
X-CSE-ConnectionGUID: K6odcQ5kTcygIUOMayJX+w==
X-CSE-MsgGUID: cR6ffQ4HTyy+mHEmc5BKrQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 23:31:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 23:31:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 2 Jul 2026 23:31:34 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 23:31:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ajjt2NHweOO7TqyyrQF8ePlKnFDIpEGVifZ0yf72reemQY5ZSGUNCyQGaOgwgLIDadRE+UHoi0Xdalymh+BPQ5gZ9Rzrh9ZkS0sZifWAnUT2AjGbdCGwcTinunbLCvfqYd9QqtqT9KDmr/yoi0k9HAlXeVEb27CWxmYbezKk8A0kx1MgSrOqFDvU/8iRb7zwiHtvq1KhntwI93IN74DSeAdM9cBUD0s7aHMZhtpp7ypj/4CdHC2AgXobfFL6D2mfP002JqKU2+yxbroTfv/Celf9biEM72QvF+HFJg/bQWkuW4UTQCLvO0/2dVP0/UBB4h6ykLpoa90MHfkrPWpjnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kynkT9xSj6cpTiivgOwKBoN9sMhgEVuYlOdBIgNNMA=;
 b=iTfFGYcAokNMdIaw854e969zz/ETFEbmpGP8g2x3U1jXhcxZ9GdAcKc5lSvh5qUJUDHnep4+jDtNLQ+iPkUDOayChn21u8OkOI0S/mheEwAbWnK9cKuEy0RRh+ixJei0V5EPrGQL6ELdfOf+LD3S+tmxrftZ2sih/YTSFccicwDGVI12VberoPc6JEWsbFhRt3wdyAJKdDcg7fjLCNjglXFuqQnb9gbvVd9HRHoR6EoqZ380VLd8XP2Ah+KtylsX47wpfLMwWrL4g2rCvh4DG+/lIm7ZDuZoLdy4jRvLuZEXe66sZedCzjEEICWBXWlzqZbFjH2wzMMrqtF++NvfkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 by CH3PR11MB8751.namprd11.prod.outlook.com (2603:10b6:610:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 06:31:26 +0000
Received: from CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225]) by CO1PR11MB4835.namprd11.prod.outlook.com
 ([fe80::d051:d948:c209:9225%5]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 06:31:26 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>, "Jason
 Gunthorpe" <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>
CC: Robin Murphy <robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux.dev"
	<iommu@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v1 5/5] iommu/vt-d: Convert nested cache invalidation to
 the core array loop
Thread-Topic: [PATCH v1 5/5] iommu/vt-d: Convert nested cache invalidation to
 the core array loop
Thread-Index: AQHdCAyTstHZd8k8lUu1z/VKrebPS7ZbWugQ
Date: Fri, 3 Jul 2026 06:31:26 +0000
Message-ID: <CO1PR11MB483566E20F0A6E13E57A5BFE8CF42@CO1PR11MB4835.namprd11.prod.outlook.com>
References: <cover.1782767398.git.nicolinc@nvidia.com>
 <58eb6a9c1ba59ab3b4d1617adf697262f4c2a633.1782767398.git.nicolinc@nvidia.com>
In-Reply-To: <58eb6a9c1ba59ab3b4d1617adf697262f4c2a633.1782767398.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4835:EE_|CH3PR11MB8751:EE_
x-ms-office365-filtering-correlation-id: 6f8a3647-efd3-48a4-9058-08ded8ccb595
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|56012099006|4143699003|5023799004|11063799006|22082099003|18002099003|6133799003|38070700021;
x-microsoft-antispam-message-info: MWBtiq0giDmXiUaaTJOhmbLdy6K2cVLfRz6oVwoe86v+4S0MPCRl/kizy8bb45LNqd8rS+QjeeVdpxNiXEnWANe9ZHt7BxsOFOQCwX/9eWTtcAFHTXo24dsjsxhRhezi0Fr648FSQG0fMvIWxRbW7gZEb77xJHh6x/sRx5pW3QKu604megZAfsNLC2FJh//EfbCsgas4WDyaFwjUgXmHdipZHF95FRbNkf5c9P5N3k+aHvRAhrh1lIl+VyYNXphgnhQ6sxj10g/fqe+13nAbWKRZ2NNhNqqEtZ4NgA7RzaYm8kNoAgLPpY7v27YtdBkQa5WM/GfmWjRsklG3VKmx/wSB+ltaXUCbkBNktFSMhiJ/hYusfSIKSnIPug3YmVILAsNKoKuWZJ0vwCusr4DmgnBKTrOwNAjhW+9KYzLbiJrvUqmOYOEbBIEz5MklyaX5vkW8zLWFkn35gLb//EC2ONEK5zfDvtkiI2sO0IoQJ1Fk/flyYy9qqyGcNP6LT9MBLbdpFy9+1L1NfnrQ4dFOct0ybVlHoxmR5/ZkoGPU+3iTjp4B7QdhG0lZCrIgMEnypPpG70lRFMh4/MfR9XYwKfLQz4MTUpMkvs6txvt/H0vW+WQpeTzuyaXrTQn0h8gYYLwI2Wt09gamm/ZF6Vwwm0nKtWluX/o/kVZS2KKRMD2WQg0AYeXvHl0tof+KI9FU7jqrqhgVzSWIHq7u3VVCsdZKKCrRlAG27zELaQdMyW4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4835.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(56012099006)(4143699003)(5023799004)(11063799006)(22082099003)(18002099003)(6133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uo4Y2k0Nih+V/iITkZTA13HnGLjAdMIBqCoxVtCGZmVErQvqOU8qcj+gMZEu?=
 =?us-ascii?Q?1p/U1mryRxsHnECOfFM7zxSMXOMqJuTYTpS3HM5sFxAWqmJwsxpEa04kOE4/?=
 =?us-ascii?Q?eUo/+OPN64KA7bpI1vJUZJ0wfceVuRxs+C4dLFrilw2jA0AmOywZigJ/byXr?=
 =?us-ascii?Q?vV0UD7xEj0Ha9cyDGQQY4d17PUhRkmcerWt3HdBB+FAy4Gx5G0Yq+0IcV3IK?=
 =?us-ascii?Q?aIegv9HWTNVoyAaXkDVN0wz+GtHhn8nrz33qqCt5qIA+pYyQ1QfrRjoy7URR?=
 =?us-ascii?Q?KJlmXyc/L96oliGsej8ExdiU4eyVqfybHx7HS8R+8BB3+J7nj6Gn77LCIBcQ?=
 =?us-ascii?Q?xMBCTBPyT+hM5sDsL7cS6k6qOSqoOigJ0PD9g3HVMQRZxlPBoJPW2/cNM4zK?=
 =?us-ascii?Q?c4VQLK6a56Z2EVPfb9opoMZwPSaLftZ1BcnwEo/deKaJ1EXxB2XG2mCD7NtS?=
 =?us-ascii?Q?M/hfkg4rbx8Ah/nCi4JUiBjxVsjEHljUvyM1A5qkVMOjkCFz685h27r00+98?=
 =?us-ascii?Q?qDf1KNBVi911K6O8yDgVlrAFNPZMsE+wtdLzJoGNQY7qx9waXKezw7CvnNci?=
 =?us-ascii?Q?cx7n0LlLtLRg+H0moYxESDd0aTMfNtDJZ2zqldRJmp4mYZCC15IRjORkCjW2?=
 =?us-ascii?Q?re/yLzYn5TMIkat/dNpfFUAv4S4yXHz2M6IU7a7z5ouJvPbCSdXDi7w7JXoA?=
 =?us-ascii?Q?k8sRNW+lbx5/x6NTLv8Zjff+qZFbgXE/HqaPFEjb+QLDcBNiOzqLinLU2LjP?=
 =?us-ascii?Q?uzdP4OcVe5037yOJCKTHBd6B/fbe96IXKEsrjHwBkKzdG+YwC1AbIah3a+vz?=
 =?us-ascii?Q?RjWN9ek82cPV47ntUFrjbbLAwgoNUj1eJHEL/gZmW/G7k4RIioHLZohYV0W8?=
 =?us-ascii?Q?FeKqS4iOfib+Rruegq9zWOl9svpVMmD2f08Vct/EuV+lAt4fy5i1qzMg+zkw?=
 =?us-ascii?Q?SfXHYOp+rgbJzoSBdFqwqnjm4Mg7C/OeunEdsH+hbwAuSK6CxR4vUUBp7jvX?=
 =?us-ascii?Q?JNyk48q44qza/gpiA245TtRHq6EzJG9ida1PAmhqOHonETwDrRWJNNq3FZl7?=
 =?us-ascii?Q?akyANiZPSRRkCnYDRw4g/G1xUcn0oDTlXZETV2VFtbUPexXN1wf8pumTDEeh?=
 =?us-ascii?Q?Zt4MlPCDwdR9heFjvBicPUL6mvtjBSve3ye8Rf6jpS/siBcc7yCcwGS0kp1+?=
 =?us-ascii?Q?SBEOHduhYvO64auRAfq7eTRW/2GTHtQPEjFdAjodcluk++jeyt/F+RI1ZY6g?=
 =?us-ascii?Q?YgkLOmtJGZJ2Bo5ovbZ2Bd1rfhxhpZwcYAwGudHPlFds3jBA2dFmcqc6c9vN?=
 =?us-ascii?Q?9TN51QdXLJHFfKitr2DIvnPrjSFYrZYSabsOUSV7EOW5CuFK3/dtmoww2UVL?=
 =?us-ascii?Q?l1b9lbvjXDC+0hFRjavKpYdcCwKzUAJ2N6xPfnJhN0IfzqcMI7BUVbBmO2Zx?=
 =?us-ascii?Q?UTHFZZbN3KXnOQEGTGY2EwhqlmLuNWBq6C0fagni2Z/EBXesgarKZs6EOwTM?=
 =?us-ascii?Q?TPyGRAXmat7nk+VclQJos9sBysRDvlKm3EJDliz4ankjk0+YP29Cwf60btNH?=
 =?us-ascii?Q?osyP97mKsEuMp5IqtzT950ZzDIj1+mVL/Ha7kwdXEKNUK75sygIRy4j2RAXM?=
 =?us-ascii?Q?kEspEXyZoi5LSN7X7Icit9iNyNSzVMtzKXyUyORNimCBGU+meHcTJnXBS8Uj?=
 =?us-ascii?Q?KVbl+A/Bx1yT1WrmIJbOb/7XPmJ20hlY0tXTxMuFMqg/URIR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: s1Bbm0sAdQgtEVS5vzNJhSoGAjqsVwi/RgA7DpJuCfNDsuTuuUywSnE3b9m9QkZ6sN3pIJMyLa6gCVvb1n0K1FGx72vbl2iYv9eX9ry0Q4KFCknGB6umyZNCTehm1iQQmTeJ6JTdeG5R+e72Bofpj9X9SIjPCtb9pOldBFZlMISx5SQYryzTi4vwXW8JGUB8Io2ei6uzU7H9hzlVLzUsAJNqBMmXFhi5tUlmrUMyNlhR6SMFfZvoFlesr0njN42ezvyExxAwt9VwHnnxNSktjEoLMJq4Pnt4/X4ebE1/1OAbRXPd8xJFoKk8W3POk6p2c31GpnRFDdGQcRxqiT8hjA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4835.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8a3647-efd3-48a4-9058-08ded8ccb595
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2026 06:31:26.4292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bCwEfB2q99EM8B0iEE2rgpxQi/kvab+5q8G61/TCn2O/vjud6U5xdjZ1+AuYUQojzcjRMm4BeDY4frA4BdJ6mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8751
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_233135_584169_1B8A0437 
X-CRM114-Status: UNSURE (   9.09  )
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

> From: Nicolin Chen <nicolinc@nvidia.com>
> Sent: Tuesday, June 30, 2026 5:16 AM
>=20
> +	/*
> +	 * The core re-invokes this op for the remaining requests, so handle
> one
> +	 * request per call. A zero-length array only probes the type,
> validated
> +	 * above.
> +	 */
> +	if (!array->entry_num)
> +		goto out;

ditto. just return 0 here.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

