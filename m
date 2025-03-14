Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01212C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 09:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/E9o5ImE1HuJYzGLkLRVhDQzHYF59OdA7dFIkjH/uhM=; b=dWgyTcSGD0IBBAr6iMXUqjBOfB
	+wDrNIJATYDSPMA3wFG8cvuinU+Uzf+UNcS9rRwk7Z4Cl3ltfZZ13bF9MlGP0tHsvBVEKgoJBnG/P
	033cirfclAE+qNnrAi/84EFz6wV3CWPr/INGY5VTAykFcX9MhvlHwUsiM27nLbYZ8TA1jWBzdqRoz
	97uMsd+pefgS50RFFzkLCj8GrAktyhGA7IuG0Cn8aKKQPSrulmc7DPhtinP2gnn4gwSfnCm1LWGP+
	Hv1w50EXDK7BkK8PjBKJvn9l9jw+6xT89XlRPOxiRCabpu2YJqEJRubw0aCrhq+CAVk3WpfbGyRlW
	Kb0Vsf2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1CV-0000000DeCx-1FoK;
	Fri, 14 Mar 2025 09:19:31 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt1Ao-0000000Ddq5-2J2R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 09:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741943867; x=1773479867;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=IZR0+VaKcZIp/kHQoQiwT7gnTxjKF/LkQ30897P12yA=;
  b=b0iWsNfe6nDaxOfeU4DJcxp4l6Azf6xHNw5rK2uWi64Woqz8ce/ZEEA7
   01RugMG7MUHDeqTHo37HEy2608TcK3QC5JFGqOvzKkIJ++UZuhvBDay2z
   n08VYLbA/e7yq8CyOJvSH2+OIdN9bz79gdcgjnhIPJ2vJeTvN5qfgX6fv
   ckt5/1Uply/KucDuV2U3PbOGAVh6d+AzNSJ0UlJVvCVyhvuHDmazDhuhP
   jRvwkAcd9sgWqyf6WO02eWwbzUk6pa5PGwXAiK8SIkiE2NrWDV7jGH0SW
   8QNzBxAL7iS1fWieBzwktJ6wvIpbPrrps/uEA7CjnaLI0d5/OlTK6gPru
   g==;
X-CSE-ConnectionGUID: U74CXkf5QxC3bWP7Gc+ePA==
X-CSE-MsgGUID: mm4S1dqJQjuBIpAKlAaaTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68455363"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="68455363"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 02:17:44 -0700
X-CSE-ConnectionGUID: 5Ay+IrVOTsiRRQadV2mulA==
X-CSE-MsgGUID: dp1a9WSFSWCsNJC01uYHNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="144398945"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 02:17:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Mar 2025 02:17:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 02:17:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 02:17:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhqQ4VljlODa4IG/FNJTA/iQLhL9wgDc8fnMavkOgC1IjNAMQLcLc8dGEFbnaer2qn7DZofTxIp1d0GbQ3YSd6qdddqHbjCmgBkBwx9KjtLu/sdX46hy1BczBhLLBDBlnQpqGcZSY2pQjaFi+gTfA+yVoF8Ba818LGL3OD44VYP2go2Frr+Ss++zXfxRnGxiuopLgkcO8CR1DuxyrEZqZsmet5n/HNkX/tI1/HeP98GeHU3kd0vPiKV2KvWx5FvfcHvy+vHBmRhgfn6j/vZZxsRt6tWZI2Zk3fuDT+DSzITvfXj7vt9aDsXphxOHuD6RXZ9xr/saNdrh3rgpuc/zsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/E9o5ImE1HuJYzGLkLRVhDQzHYF59OdA7dFIkjH/uhM=;
 b=RQiDDPgzLZ8BTlS819+WADQ805HfDruo0z20TpgdQRg7aenVVtB4juFNG3MSPHIlo0S8N4uhuVqiSm1mflVsxrpkASod/2nSer65wHZMRTIb9pRrHWkcITa1cOh857RcwJvs9Gg42ktumaetShcbtQ1EUYSLs4Lzbku44j16YehT30eHl9gwXVYaVG8yIJC8q1xkuUileOjRpTLrnC8a2oB8t2La46ZPiskeV6Pq9lq0887+6q1jblVzSm1Pei2Bu7GHquQRAcKbc1a2RcqcMOcfV8Mpk/aHDqq77PidTdEXV4vCFacCdfM4PIXB8LMghUadCHMOEustab2VU0JZgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ0PR11MB5182.namprd11.prod.outlook.com (2603:10b6:a03:2ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 09:17:40 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 09:17:40 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "robin.murphy@arm.com" <robin.murphy@arm.com>
CC: "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kurmi,
 Suresh Kumar" <suresh.kumar.kurmi@intel.com>, "Saarinen, Jani"
	<jani.saarinen@intel.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>
Subject: Regression on linux-next (next-20250312)
Thread-Topic: Regression on linux-next (next-20250312)
Thread-Index: AduUwRxTv8Au//8ASkiRhj/prEpVyA==
Date: Fri, 14 Mar 2025 09:17:40 +0000
Message-ID: <SJ1PR11MB61295DE21A1184AEE0786E25B9D22@SJ1PR11MB6129.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SJ0PR11MB5182:EE_
x-ms-office365-filtering-correlation-id: c0bd5eac-6611-420e-6dc7-08dd62d911ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?i+A1emGyP9clTbdiL5gZRdmCfYXiRfVgJw5yV5VeblGPTZfedCuZUp1MtZ?=
 =?iso-8859-1?Q?c+OsmQGI7LBzZhfPirK7QLpZ9vBnmIBQXbien9Ed5U9onsT+D+M50daTCg?=
 =?iso-8859-1?Q?99CNdbkLiuXqLtcukC7eF+ZvITgaPSxTAK43vBEP5nlx1AjxIj++fh4Dog?=
 =?iso-8859-1?Q?rcY6HbDi+SdGNx1TBhO7BhlYvIfMZoYZ78X12NvNjDX5Tl1p+v6TXzrPJ3?=
 =?iso-8859-1?Q?L15D1LmHTTReD+sQ0IIZ03ZldXDv85faXks9B0Mt9Pv9rslGQtqJPG/bi7?=
 =?iso-8859-1?Q?LVU86+WkI2Qh4U2HO52yGJmQJKXTHrC2okKetJcH9ZatS63BXxrn0+6kpq?=
 =?iso-8859-1?Q?TfDuD1o4ZB8g7ZMtMUc2QT8+NZf0YoFaT2s+cwAUbR1kJSzn4UECcUEvKv?=
 =?iso-8859-1?Q?LuPuwdZ5QFLzJGlDKJAwQtM7lhOqZdcqxia4QXjSQqkjTFjLGN4frN+wgU?=
 =?iso-8859-1?Q?2NtzOUNueK/whQegsuWdBy8nHfdqsTx7j6cfp50Ru7u3d1IEtwTzc+ggfm?=
 =?iso-8859-1?Q?JVieUpB9cY2zhDCT2sXm/r9zgMCARt12dFGOdS8fdMXGkSf43GAY7CRXLG?=
 =?iso-8859-1?Q?a+Ic7dtLP3p1jLUvvHqflVL1fQdHh0hddL+sj7+Z5HwKUyyyrILp4MeYHz?=
 =?iso-8859-1?Q?+TlR4FwiP1ZQe7/SAFMpKRiUh2GoTCizZjXNX6N1+t3btamoeNIz8rOelG?=
 =?iso-8859-1?Q?n7GdcVxlG3wzdo/0KuAGz5qwYGscVysiPu6x+iNltgEDY8f8kFRHhlkyRZ?=
 =?iso-8859-1?Q?xDLaTXUwRzjE1h4vWsm/ANbZ2ie/CC0TgEvbvBP/m1jOIPgh8agK8fiDGL?=
 =?iso-8859-1?Q?Csl6ag5L2IY0vzNCd9ebNo6j8pn/S8mZUPKMuE+er9HokENJQ0Sw2X/tBd?=
 =?iso-8859-1?Q?wIm6r9ChJzWV0lujn8Onjvtj6cQFkV5fLjbg/jhT0REBCD21glAHuslo49?=
 =?iso-8859-1?Q?w0ApkMQRi77pi2dHFNwM9nKKZJ1Kr2f15YjK9p2fP4+bInhg+ihQeo2ZFY?=
 =?iso-8859-1?Q?pGWN1C5zidt98RBodqu50a2fYJ57bCShkdgUeL5N/fhJ354s1Ap+okIsC+?=
 =?iso-8859-1?Q?XYPuruR7K23iYugUW+X5JoUlOD5Uqm7MAVoWFjfai0ytNyGEQxmIsrZ+yB?=
 =?iso-8859-1?Q?tYvYLPjLUyZawX9vFCJ445VBo9ijDwuq2v+vf3f0VOJMt9gqFeL8y80OKU?=
 =?iso-8859-1?Q?sYSBM97cs7+qLmTmveWdqdthjdOFLRmeK4B1Qt4jxvnTJ24ggqqh+5TlXt?=
 =?iso-8859-1?Q?3OvBn6CT6WLKxequ7/XBjScKO2tEAa9oImntqBGQ2ixw/ehvGjYgmHEp+7?=
 =?iso-8859-1?Q?KNtOo+EuPHnNsYY5wHssPOQZScR5pDDK0vRYt6K0J0LOxuCxRYnKz8tXqj?=
 =?iso-8859-1?Q?CvGWtJGcSFD7koeN66smK47QRmFv1zGvPpa+ceLF/3cxdkZgjbqrhXk8XD?=
 =?iso-8859-1?Q?DUlbBmkRd+gn8aefE//35I/hKcQruecLakxoQQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?rsooQJGDUwUrJqzzXthaHYa102w50DB2AnjfdWJuPa+zrchCrW2ZoiEbKk?=
 =?iso-8859-1?Q?3bsB1pffO/gqRJE8InIC12MWw5A9hIjZak+GABVr9eeOQhbFhH9GyTaJ6y?=
 =?iso-8859-1?Q?5CRX5GPif/cNjvqzoyZe1oGKoTAd/y80fzhWF7vgZtGfDWesprYAshyqRH?=
 =?iso-8859-1?Q?/eZps7r7O43pgdZNdr9eB/j6/1ED2q8Cs19OeOLUgNp+BCf9cq6wCxTeQX?=
 =?iso-8859-1?Q?WJrarAyVHVcvqfbYStcHXcI+5+K/Pa43oapwvbZqRExJtscYUBT35vUPgS?=
 =?iso-8859-1?Q?R0ry1RFJarDPSyDj13PV/QBBcaQgE1NYIED/7x8YnBSnZ6QqKyrlCNGfQ2?=
 =?iso-8859-1?Q?aDCINMszoWLJS4bV7cCPm39QTxa8e+XLE6xppJAKH4w3dnqx1s4hnQB2gk?=
 =?iso-8859-1?Q?ADtqWvlynwV87Z5irySmaDQC0Z2zJxzdP/CCFeCd0Vk5LTB/5HHFGUIiSp?=
 =?iso-8859-1?Q?VA8LDoN+GRbnhs/kQ4BDYVCXVYQDM40Nk6GxVVuo0Ul2gfpbzs6VjbJG+d?=
 =?iso-8859-1?Q?N/Xbh5HnYc7AMgPHNCqPglryabcr8Mc8yIznyuWKPR2vGM0HOhq4Mx4rg1?=
 =?iso-8859-1?Q?cNOnMrvde1Bn+7Szo0rzLo771YjITKD1fBMIWVhMzOi8nQuKwRa/CWcnAo?=
 =?iso-8859-1?Q?zqBM6Ar6jrkFFN0efM4thwZEimCXZ5phAGwkG8TE+Y255L233NU8dpRlss?=
 =?iso-8859-1?Q?PFMfrMLJPicyeJibmNW636ncpHVIuUM0CJMkycdXfHMoIVwzwC5eiX2Bcx?=
 =?iso-8859-1?Q?WNNUhTrx+XWKmwSR85cAvJQ2NrUrrYwBJUhqqA96HK7FkXSTWMVCEaXXyt?=
 =?iso-8859-1?Q?NUAkrtxgnPQOU8Rfx4w8JXU0nFRTzmGKE/uIy60rTpxZSbxhcIrviymYEQ?=
 =?iso-8859-1?Q?Mlq1caS7VbnPZ5tr7vntpUEZm0nf9WyhpV4XER3WkEOHwX/tZoYRxfia5y?=
 =?iso-8859-1?Q?1zNZisa9n6Sj+13XGp0f11u7GctIy9/OOl5KpOVZi4wO3ra12Lkmj/IQQU?=
 =?iso-8859-1?Q?/ukfAcTsEoN7GrrnIey6IdZeNrPTyLdgtKvXo7oCKCPhl8sjmnWASCFw36?=
 =?iso-8859-1?Q?sygRFp0mfo4nCie98jfoHNaavcsAXDZWVOVkgGdkHTbvNKagpaffWJoQAZ?=
 =?iso-8859-1?Q?nSFO4mAWHuBdoqpQEWfqb7eciRvGiFPn8YkFCI/Mq6xALX3HAWGboQRX8Y?=
 =?iso-8859-1?Q?+bh1vedlzd4nEDlfIlmpQuz8IXIgz6fSD1Qa2DEvI5phxoFC/C7HU1Py0M?=
 =?iso-8859-1?Q?NYJWAXQYyb1N9zbg/8vMEhxKtkBd68KRy3lZRSBrvevf77pBoSOpKStFf7?=
 =?iso-8859-1?Q?z0GkGl2exyX04USE43umjocglBpsJWCBQR7tb3zn3e5BzChn/RiyDOwpI1?=
 =?iso-8859-1?Q?/3EC9Rr5Z8BBjPZ0WMBUhG27IA0CwBuCyHKUpWFErfqhss0QMr/P+FobgB?=
 =?iso-8859-1?Q?jXiZ6H9OLdRLHL1yWj8gIRd+M42oqMBdZ3hkdukcak4GWgtVsQ2nGU19dA?=
 =?iso-8859-1?Q?CRSPFWAB1nBuyHItl6OahrHkCPhnYSD8cED53eCGHrwl/+Ro7nD1HWht3j?=
 =?iso-8859-1?Q?2NZTPIS2rTdEJLz5ggT413oV7pCwIcGfC7mSYqN45MFJgfacfvRxkltzEp?=
 =?iso-8859-1?Q?noGzTX2M78Z+GU0b0q0VXzI9Vh8hhDdzpL3qNguf9dn2+90DF90jE1ag?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0bd5eac-6611-420e-6dc7-08dd62d911ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 09:17:40.4160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qATDH6FK3K2tx4IvazUB5yqdCbUYA1kNiHzRFkxCKrNL1JYj8PzOTsLIiuLIo/SKieO0DDVh1HgyGfctL3O8cK1Qef52eIDXUvxvuUSUPu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5182
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_021746_723042_36F63082 
X-CRM114-Status: UNSURE (   7.12  )
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

Hello Robin,

Hope you are doing well. I am Chaitanya from the linux graphics team in Int=
el.

This mail is regarding a regression we are seeing in our CI runs[1] on linu=
x-next repository.

Since the version next-20250312 [2], we are seeing the following regression

```````````````````````````````````````````````````````````````````````````=
``````
<4>[    6.246790] reg-dummy reg-dummy: late IOMMU probe at driver bind, som=
ething fishy here!
<4>[    6.246812] WARNING: CPU: 0 PID: 1 at drivers/iommu/iommu.c:449 __iom=
mu_probe_device+0x140/0x570
<4>[    6.246822] Modules linked in:
<4>[    6.246830] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-r=
c6-next-20250312-next-20250312-g9fbcd7b32bf7+ #1
<4>[    6.246838] Hardware name: Intel Corporation Arrow Lake Client Platfo=
rm/MTL-S UDIMM 2DPC EVCRB, BIOS MTLSFWI1.R00.4400.D85.2410100007 10/10/2024
<4>[    6.246847] RIP: 0010:__iommu_probe_device+0x140/0x570
```````````````````````````````````````````````````````````````````````````=
``````
Details log can be found in [3].

After bisecting the tree, the following patch [4] seems to be the first "ba=
d" commit

```````````````````````````````````````````````````````````````````````````=
``````````````````````````````
commit bcb81ac6ae3c2ef95b44e7b54c3c9522364a245c
Author: Robin Murphy mailto:robin.murphy@arm.com
Date:   Fri Feb 28 15:46:33 2025 +0000

    iommu: Get DT/ACPI parsing into the proper probe path

```````````````````````````````````````````````````````````````````````````=
``````````````````````````````

We also verified that if we revert the patch the issue is not seen.

Could you please check why the patch causes this regression and provide a f=
ix if necessary?

Thank you.

Regards

Chaitanya

[1] https://intel-gfx-ci.01.org/tree/linux-next/combined-alt.html?
[2] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
/commit/?h=3Dnext-20250312
[3] https://intel-gfx-ci.01.org/tree/linux-next/next-20250312/bat-arls-6/bo=
ot0.txt
[4] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
/commit/?h=3Dnext-20250312&id=3Dbcb81ac6ae3c2ef95b44e7b54c3c9522364a245c


