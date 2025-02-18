Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8332C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 05:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HFgXxVFwfEyNavnicJ3EknQxOggj8QvBURt7T/2hEqw=; b=Quiq/KmnbjdLXt4qMMpNirDcKL
	3MqfxH+vwNUNtiXG10qedCIWfWvSlsT63r/Ay4mN548ex/QZ4Vr5m2cp4SXBJslcxwxNDazBqK43p
	XWoQLV/Et9aS6/ePwVXyYV9GTUK55iMgrN4nBhWhRcgVIqwoxUX7vv12YyvvxCIw+iUgTer2jMaw1
	RS5AGsKsh3Y+EuW5bHnTQStT1k5kD7+zJRZoVY/DHj4YDpv8R/VxTv9R/3y1Pk7CxjgdBsoiezdti
	tvuqFaRiNCtqo8I2+6Mx53TSKt4M+pX0VKW5AouJM0eh0/N/r8mCDZY/cHMl+CAZPPLkRmr9NBxmP
	tnVxVbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkGEW-00000006rpT-3RdU;
	Tue, 18 Feb 2025 05:33:24 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkG5r-00000006qQK-33aa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 05:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739856268; x=1771392268;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HFgXxVFwfEyNavnicJ3EknQxOggj8QvBURt7T/2hEqw=;
  b=CS8QFC/Y9aAFMs3+9uo8Y7iMTiBRy3vumZj82DDk1DoLLaB6SQSCfh7M
   W/0DCRBMgLghOG1qrESp+Gc4b0o5STpoyozZ2/p2hOQL98WCjRr1yYkd6
   TzIDcjcPM0lYcXAAiX0cTttNmCYkEVtgn1CyflmrPVi6n/daJoiF6MFjb
   Fj40fEGaYORJdixasz2w8N2DeeTAQ7i1Undt0FNKp1eLJqKJe0SBZoMOu
   4LIMPG2ror1wrcQTUV3fpFt2Nbi00F+Z3+cwFK8J0DK4+oNkG5yXXJI3o
   jwC5cmSYnKbz7/Ebf0Mmjxb9VcPHajoNyS4HER1wdGREFNasR0PGZnlfJ
   Q==;
X-CSE-ConnectionGUID: TzcZNp/zRYGX7jIknLAOHg==
X-CSE-MsgGUID: 96n9w8c5QCCbDInM2fp/4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40405247"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="40405247"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 21:24:26 -0800
X-CSE-ConnectionGUID: ByMEcyVETtiCwV6i1QjxZw==
X-CSE-MsgGUID: mnh7xK8PQK+JGT3Rcf2GNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; 
   d="scan'208";a="114218875"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Feb 2025 21:24:26 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 17 Feb 2025 21:24:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 17 Feb 2025 21:24:25 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 21:24:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/pU30CMyqiKWUQpT1kzjnZd4GEcvhUS3GbCB579MvbyNQtn+DwmLWrNLEaKu60JZb6Xhcb5q9TxhoJAdhB2TxvKSIQKvSe+i475wZfRczPqpC29aTagGpMdtpF/Dm5u6IgS8uxjmqCEDEga8yA7Z7BAHHT12EZswv14J7eUlSD36JzPrvw6A5EoivaPHhHWrRCmPknQo+yJbMtLkGIqLNv5aGJfPg91oYB0tAcfq2iMJDbo+DtDxFkQKubDSWZgb1c8NiPzvvCbbJZNFs2+sYuHFOXAkgvmyPjASUCaPMBg42rabuQ/HwzcWkRCqLWNSpngYuUDq2JaDVVCMQKTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFgXxVFwfEyNavnicJ3EknQxOggj8QvBURt7T/2hEqw=;
 b=bb/GTmMlGCB+GIFXAe8o/zzTH017857nMxz8WBj88Odao04YDyl1tkKWFrvaML/CgLLKQPHC3S5TDpG93M/s3XNegy6wjObKRa3gZr5FsTAwkrlE21F8RFRNLlFlSrjdX2QmCQJRyiuVCB0VU2IU4H751B7PMcQpP3r4otdJCAnqZ5NH2ySEzvbO1Ag2d+X3ZAtdSIKKQw7Q6HBu3PLWgwo47rGrh4kKIIdL+vGNyiwcceLRLQT7v/lLADXGhdPrYwEsUqvuGa4IVZh4pIa3rxmf5wRUxuS2xykXFlmKgCAfDHVrV643eMhLkI3zKm7pw5YQ1CuZRFMw8/2KuoDNPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM4PR11MB6142.namprd11.prod.outlook.com (2603:10b6:8:b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.20; Tue, 18 Feb
 2025 05:24:08 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 05:24:08 +0000
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
Subject: RE: [PATCH v6 14/14] iommu/arm-smmu-v3: Set MEV bit in nested STE for
 DoS mitigations
Thread-Topic: [PATCH v6 14/14] iommu/arm-smmu-v3: Set MEV bit in nested STE
 for DoS mitigations
Thread-Index: AQHbbsCFs6lMlaYX2ECY7z55PmzT+LNMrIOw
Date: Tue, 18 Feb 2025 05:24:08 +0000
Message-ID: <BN9PR11MB5276291C74E2DF0C8821BE718CFA2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1737754129.git.nicolinc@nvidia.com>
 <436ac2021bb3d75114ca0e45f25a6a8257489d3b.1737754129.git.nicolinc@nvidia.com>
In-Reply-To: <436ac2021bb3d75114ca0e45f25a6a8257489d3b.1737754129.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM4PR11MB6142:EE_
x-ms-office365-filtering-correlation-id: 50fb4ca8-727e-4178-9492-08dd4fdc784a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?xjbwI/41ezeHErJ4/B8sTliwv43AbQbTCLiRpEptM0DWpMqctAgbjadZylCd?=
 =?us-ascii?Q?a7QduaqD5xrtH6W7AHt82jCyf+pontZhHA3Ob7nNl4sfzJk7BzSvpEm6l2K9?=
 =?us-ascii?Q?Hr7h4GbI18NTP6T2pEWyyjHA7rQ5B8JaBLI2IKTcuAJfFa8tjMZSw+k/qmh8?=
 =?us-ascii?Q?9MCNx/KYnGxpJ0xLzekYgttT6uz5ujU1tBHGjXDWF3iU9XDm0LUmk1MUhY+L?=
 =?us-ascii?Q?n3vtO8eJi9n31swE+LoHxMjpmdipSFRvqIF9SMErpIY9GzD4mw8EJkkSnqqW?=
 =?us-ascii?Q?0zHSh+6M2DL3GEzeHu79o3LUHkUjTX82fbt3utS/zk/llnu7bWak2GDYnEoh?=
 =?us-ascii?Q?doSLE7Oyu4DOzEY4AASW+mmosmVZb8SP+m20ZX17bSqN/Mw+leARKOrHMNE6?=
 =?us-ascii?Q?kCwqN4pAfb15PizqeL38DtmvyRchBrQykQZ4TUeW8Nsq+IagtWtHyX0YH5c7?=
 =?us-ascii?Q?7IY5tD0Fx9advtvwqWS+0t6OjFvfJCOY1VIPIhAiofch/mhDGfH+u2C1S0QT?=
 =?us-ascii?Q?qx4hGl8W3BH1fMX8a2uHCkLgxzD22Phvp4y6VvBH+xn8Y95kK31qbwGEZBm/?=
 =?us-ascii?Q?HHg0cIKlII/q73tc8HGpEdVFK0tsMOk4/VXpFnlCJp62ecgRjbbqvUEKJk/K?=
 =?us-ascii?Q?jLy7m8b/t/8a2s8g32jY6jieR4sYHNSpewUfCde3lnbry3cdHDEvmPAvL3rn?=
 =?us-ascii?Q?GV+EdDLwaTXJdjQQkUSg7E2rHzB9JAjsqGL6Jl+2KsB3NDuzsN+hEf2ig1Xl?=
 =?us-ascii?Q?/DZaPjm4oL5SrWN4t2Qfi3kNlmfwxyd1Hs0yWO/shqZDxRsFIlDEjGX2hN3F?=
 =?us-ascii?Q?d0FDPihj3Z0c8U72CqgbpiRmtrTxLkUMPYPPCAlw2ttzrYkjrIBgvDt8qZeS?=
 =?us-ascii?Q?+bFDmQNqbN4/NYy2E8ry0DNmnvDstC4vm9NyHPs2qSFu1QWsAQMBhGNi+FIY?=
 =?us-ascii?Q?HQXw+9EvV2VrXNgHAvV+LmJyGfMUnAiZTVbVe0rdim2kKZoI74t3eC1Jb8FW?=
 =?us-ascii?Q?50VHkNDVIAWfW2Jf6R11DPE+PXCQiYJsSjp59ldD4EYCL1bEag0PRCZR34mL?=
 =?us-ascii?Q?EmhwYrmHYH3CtdolRERvpZ9oNVVp7O0RZSVWrPCfr9eRGEWv7CtA15p3uvNk?=
 =?us-ascii?Q?JwjJxMyhVEf2yQqD91E77jhHGaJmqi5CNLUsB40SDCR5f3mwxzcb5w1jns39?=
 =?us-ascii?Q?LlGuSJq/JEGfGuhh/SWyKDQEtTm3j3FyBWPKbydBnNgNuxmoAtk08YWSNiz/?=
 =?us-ascii?Q?O4z7K7D0cxyDq70b+WnFjGW79CEEjk7vgQQj76TvKwNuv0xUSm68tL8UNARx?=
 =?us-ascii?Q?gwvJR9Mt3VpdZbl1O9pp5UAxk9Vh5gSAmZ7TS0huo+KPx9l4BFY4eV2LKMvs?=
 =?us-ascii?Q?qNID8yrJdHwbh/xjIjm+Snrl3NnVhba8/eV0Mg9aI79BoV2UecH+80NRUIg8?=
 =?us-ascii?Q?dPdpe5d+p2fQzc3HQDjU2JLi0KK9E3my?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wjlVcuJXGz5pYUT+lTlg4quY70sEO7KLR+TI0yJKjX0xl80tmyecJ6rp3eab?=
 =?us-ascii?Q?+hsNZk27i/y1VZ+QNyaZIY1kU0whZBGgfJm4foGq54tKhaPB+c6UzRgNfvQr?=
 =?us-ascii?Q?/dEtP1wAUHDZ+naARKv32SXiy+n+t2MGEReb4C+N3fujlEn6t/qxGUmuj/Q9?=
 =?us-ascii?Q?vTyWjZ/AfNP8UX88N7VVW8MOpW05DI+uOxiBOeub9d+hnxTLGdQszDyiryFd?=
 =?us-ascii?Q?/ltvH2VaSBXwsi3SwShH5E3iDRn2rO3EvmRhLXxhkrMeMnUpCleTZSFASuo/?=
 =?us-ascii?Q?abDYku+OvV1HYFvi5LjGRlGeA8sg0DCpW4OUfZy9rCZ6Oj3hL1Up3pERTyNi?=
 =?us-ascii?Q?zrHU3DTnOBe2trrXjJ8p08qMkEIC1hd3ctV0oI57L55sipPvdAvs7v+4UqAQ?=
 =?us-ascii?Q?58627pw/rdUF462oTiJs3GZoz+GIElGHXHN2UL6sOFhTHVSXF4ymiK4WEHuq?=
 =?us-ascii?Q?seT+Y8NBIvwbWc776fS4qu8Xqp/poGH97Y3LDCsnAv1PTDa1vMa2zsibAXYo?=
 =?us-ascii?Q?Ln6qBazjIpDvKRPdkG8BYEKp+XD/L44KwsSQCfSUuVfqS8mdtMf3bXet07oC?=
 =?us-ascii?Q?wx13eyaLk0uSDm1OnHyFVsZLDGF0E2xtFnI1Vh0P3AnVO1H8bW2j4jzYfSIW?=
 =?us-ascii?Q?HPnzODDypmqOmkSAxclJVLQLo8ZTwQC7hlDNtGh0OEd0qN+iHjQduccc6a/J?=
 =?us-ascii?Q?CzQAUGZQfwi0IrtC7VbwArUGrDzR0+nIRjuko0d9905pipdQCjm2fPj44aBq?=
 =?us-ascii?Q?ceKhza1nT+TTztgysB6v3ZxNuoz9jJ3opTGPpL7HMw3nWf3/Jc1aJt5OC63z?=
 =?us-ascii?Q?6XXz5l7jqhDsosiWu2fW2kUyiLA8SEbZp3FRsfak7vdWairdL0nx9U62sUOP?=
 =?us-ascii?Q?BkNytTogfYdoRrZdkwT5jaXHWFIP9B+sZFZNhNpxcC670QqWVIO4VPnUGkRk?=
 =?us-ascii?Q?z3zRUGrBkVj+N6Sc0I4I3v3Im3cCERoW9LMPOkdqrGfpBAOLVPb+lec+zsHf?=
 =?us-ascii?Q?11Yi28dkqUzBUsxyJahMI8JL+WNoHul4ou2UtIARKkAqm0o6pHf6zHfx2gMW?=
 =?us-ascii?Q?/RGH2sQJeVCUcayPH4ci3rcex7j+4VNm57X6MwrDr2Z1OS4ZyLATKJwRt/rx?=
 =?us-ascii?Q?CO6+24Ir+yS3dm64BOksKiA6csdc4G/UXm63gJabBkciTMVDyxE3Xp6nibWF?=
 =?us-ascii?Q?57FxYTnfYllh4DFnxIYxyeC0/xybROeQtyOBEZKMZWUxzG8UGaGOOdM0+azP?=
 =?us-ascii?Q?eVSiCZX9xWi8JC3vMXPseJwAJmHQiiWYZEyafZk0bwU5eM/8tABqLbcVAQUX?=
 =?us-ascii?Q?AEtoxheF+L8f3l1as3E4qs7egOEbageUOBgjPvKpv5lQdEFdkEQYxqUTg0yi?=
 =?us-ascii?Q?5C8Ys/g7i344NHD4OVb7ruIkHFaThUuNz/28h3iGN4NGDInR6JNwteOEwzUS?=
 =?us-ascii?Q?w0CYKyh9hfbaKR7ztZy6u5L0sC9tzTSAVfUzK47C4ZlyaGjUT+h9fK4qi9Mv?=
 =?us-ascii?Q?92h4HUXKdg3+KtVK4TvlGx+HU1Po5SuLLRcwk/hw3HRBpIqKBodUBVZArUHq?=
 =?us-ascii?Q?8nHDkMKpev4kppnmOsjMoEs0otiu4NpfiwA6ZUAZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50fb4ca8-727e-4178-9492-08dd4fdc784a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 05:24:08.6011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HXRPC60Qo/FUiELsv12aDNeMB4detAKvbiansPT/zJP0vP78qSJXsF/GUYDxloNRamfIYeZtFU85ff7eLNHl9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6142
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_212427_774842_FB8C5D64 
X-CRM114-Status: GOOD (  11.53  )
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
>=20
> There is a DoS concern on the shared hardware event queue among devices
> passed through to VMs, that too many translation failures that belong to
> VMs could overflow the shared hardware event queue if those VMs or their
> VMMs don't handle/recover the devices properly.

This statement is not specific to the nested configuration.

>=20
> The MEV bit in the STE allows to configure the SMMU HW to merge similar
> event records, though there is no guarantee. Set it in a nested STE for
> DoS mitigations.

Is MEV available only in nested mode? Otherwise it perhaps makes
sense to turn it on in all configurations in IOMMUFD paths...

