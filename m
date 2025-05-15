Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40BAC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 06:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkXvwziBrWq9ut2cTCCce1cIbB9PhRx5OjsUZSD/T54=; b=I7gbHYUFMVFjDDb3zWjlCk8PpI
	st4QrfAN1WVSiS2q4HNltA++5BznPeNjUHymINFHmp2e8wpBJ4ZrMPFlsvXgh/bIwJkgPNxOIE0bn
	2dam5Z8NmZkK3xZoO6PFBW6UsU1kBKMJzlC59GTsQmUxbSuh2Mpg0MULjez5OKYyrS08okDdATQqy
	6+fcHPC3JYB2x2S8wMJIa3X1wuK9CmcpVjTqcvoVCT1e+6WHdB4FLSWTvADx/qELLYHYFFHbu04VF
	g7sNw27XHAKzdhBqYNA6zbTm9xIcOURfa/7Swi7C9UiKxEq00tUKgg/W054l2LEVP9RpwmuKlJ2tN
	GDnePSwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSZE-0000000HDL4-26QM;
	Thu, 15 May 2025 06:59:44 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFSIu-0000000HAxK-2n4c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 06:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747291373; x=1778827373;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hkXvwziBrWq9ut2cTCCce1cIbB9PhRx5OjsUZSD/T54=;
  b=Thhaugh+VSKCoo8I5BFv0bXtWNDtadRRU8IA3GfEK4YEZHMuP9QMANow
   OROv4GnGrnRPoFqGSI26J9XK9ALALHfLnAPY8HX1DeNkIhFAcc9bOC/ko
   +WLizZxhAw5HctiDaojrpsWRLlmPRDvUyZgtEGj/FkZUpUaz/qKS1icRJ
   vZX+f1nQ6t/SCis5T6QXWcwe5DLRQgXw9dJV25VReEByW1EeGSUyJWABi
   L6rhVHOsfNdYLetLfOiO/9ygC1UNRKmEXUjTl4c5gKzwMyFH4sbT4i3vz
   /nmZh+mBPiO5BT5ytYhv56Urd6BCiLxmszBAMkw+UhGRg6+y7RfJ5HNK1
   g==;
X-CSE-ConnectionGUID: 11FQN/6jR+aRxd48lmE2HQ==
X-CSE-MsgGUID: WA8A0OxbTHKOLljreFNYTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="52885502"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="52885502"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 23:42:47 -0700
X-CSE-ConnectionGUID: gFqCnTALQkiNqW/K7JBdrQ==
X-CSE-MsgGUID: Jqv4Qn9oS+O+97xLcjJlcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="139266417"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 23:42:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 23:42:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 23:42:44 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 23:42:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQfC1mHs9r3717ZD6AH/Z2G5CZCRi4RGD7ADSTlFNoGv/B5oFHhC2by9iyS+9FytfkLLDH8PuKyWVCekXrzejqWcpCR1RmVeAgwlUIIzzkUGhrIbY6G9X7pQ1uAyqbhwXR/CGcG7muh3OC5sbJBKJlrRNBGgyHSbhs1rhniurCFVm8+jbFJGoUYHKhicxqHG28CnDrPibmHF/THLlv2OrhUaK8sPXqL8+AnhthtpEJyi9LdWXJUidEhWcbPIaR4F6X8Z4VrB5B2z9Dla2apSEEneZFOEe3uzHl7zstAIK4/ZoKu51N2FgmFAkT2E+bgmTCHDbkFSY3ddI9/tmtKnqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkXvwziBrWq9ut2cTCCce1cIbB9PhRx5OjsUZSD/T54=;
 b=np+9wGmmGxHe7KhoO73aS7m1SZ7J6kGjjoikHU8kUPynXBe6ZgN5TS4M5zJnAWSoWle+zzak7iTrgJmPo07wGDMmPiP1hNn0jY18ccOnG/73xAuT3kSfF7ruaPmVcVHf87xk31Fxku/SqqKcygJLDMZjb5BnUTDlgkd5ZwstJJQJ5DRP6334nkHWlBDJVErBBIi1izdPlIqMXJ8fZpOlsthJ1o9TaFiX//8mwFhRp+CzVjdOKW17GYY6mMvF2jdYstegs83G+m7MfhYUAapJd/FVM5WcxbfStKTgQfNNpLaa4B84eMDT6Ho2XzyxGJQJSbwN8lslAv7fc4Kj7SWGBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by MN2PR11MB4551.namprd11.prod.outlook.com (2603:10b6:208:269::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Thu, 15 May
 2025 06:42:21 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%4]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 06:42:21 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>, "jgg@nvidia.com" <jgg@nvidia.com>,
	"corbet@lwn.net" <corbet@lwn.net>, "will@kernel.org" <will@kernel.org>
CC: "bagasdotme@gmail.com" <bagasdotme@gmail.com>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "joro@8bytes.org" <joro@8bytes.org>,
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, "vdumpa@nvidia.com"
	<vdumpa@nvidia.com>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
	"shuah@kernel.org" <shuah@kernel.org>, "jsnitsel@redhat.com"
	<jsnitsel@redhat.com>, "nathan@kernel.org" <nathan@kernel.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "Liu, Yi L"
	<yi.l.liu@intel.com>, "mshavit@google.com" <mshavit@google.com>,
	"praan@google.com" <praan@google.com>, "zhangzekun11@huawei.com"
	<zhangzekun11@huawei.com>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-kselftest@vger.kernel.org"
	<linux-kselftest@vger.kernel.org>, "patches@lists.linux.dev"
	<patches@lists.linux.dev>, "mochs@nvidia.com" <mochs@nvidia.com>,
	"alok.a.tiwari@oracle.com" <alok.a.tiwari@oracle.com>, "vasant.hegde@amd.com"
	<vasant.hegde@amd.com>
Subject: RE: [PATCH v4 16/23] Documentation: userspace-api: iommufd: Update HW
 QUEUE
Thread-Topic: [PATCH v4 16/23] Documentation: userspace-api: iommufd: Update
 HW QUEUE
Thread-Index: AQHbwI8OUS2e1l0G7EaqJnhnqfoQa7PTR8/w
Date: Thu, 15 May 2025 06:42:21 +0000
Message-ID: <BN9PR11MB5276B035F228F612BE20B8758C90A@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1746757630.git.nicolinc@nvidia.com>
 <06b52408c31858e39a2fb557fd35f80db965f646.1746757630.git.nicolinc@nvidia.com>
In-Reply-To: <06b52408c31858e39a2fb557fd35f80db965f646.1746757630.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|MN2PR11MB4551:EE_
x-ms-office365-filtering-correlation-id: 0c51cf28-a8e4-4728-1a08-08dd937ba4f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?YABLZ9eIGbXgFEn07NInwN68XaDZS43dAFm5iC9AcRu63JqHv3nXVC/eQsSC?=
 =?us-ascii?Q?8NsxAI55nhpEdFnxDMgGfsIBTAWorY0u07CoXl+qmNxhb+Og6RuP4+bIoC4p?=
 =?us-ascii?Q?GkpTHXudKrFRlr+qxbf0cEBfzE7g58cUGsXPMY9c+Jw5Y4h12wRg/KAlJ1oj?=
 =?us-ascii?Q?Ara+Jepyo3gpTmr3UP+ImUZYG9g9/3liY+ceT+ILoSn3ZvtN37k+zAW4fhQO?=
 =?us-ascii?Q?ZXPI+jskGMSYneUbPQ07igrzq0YGO1PGJEqMuOojXSYTnbNaK+mv76zVxXs3?=
 =?us-ascii?Q?iyida9mlIEmuJALL7Ddsy4JSrcFRedpVfyrKSJB1NH9OyqVKV7pRvVpsUBzD?=
 =?us-ascii?Q?e/X1/qS3dXfRj3MoU61CiBE8AfZj5qz4cdKVsrMmlkqLitWlgv4VW7ux6DI4?=
 =?us-ascii?Q?m857whUUpxKJNgZU5jW8h+s0cmPaOzLUIqmrlknLdAAy1JAvVwY7gh1Wd2Ys?=
 =?us-ascii?Q?6sDvFWBKxqLnYgIqJW31HyanEZhkEDJMNgCDCjsdIEBTBBQ+URyJAGEm4z2y?=
 =?us-ascii?Q?a05vIQ03tFAwx3l0ARuPkF8tOGNy5L9/coLOFjCH297yDvt2kvkC+J1pHciQ?=
 =?us-ascii?Q?g7IiB3YSrKkugQiorBCykQ6fQ9xgSmoetZ5m7fyqx40rv4o/4C+R3x3s3ws5?=
 =?us-ascii?Q?hI4XV3+Fd+N2LU1C11xxAsbRLH1AmMwUIdxJv+wvlys49HGV4BUjpVItLAhA?=
 =?us-ascii?Q?d3H4z7CwKrCF5DKti2df+nmY7IRB6jp8OYtWFoyqmfQJLQGxi51bcsmDeX9L?=
 =?us-ascii?Q?SWHEwRNGs8p8epd3v2RSVk2KGBUZQ/Enx8hH8x82QoHs0oL/9Wb3YS2b6mKV?=
 =?us-ascii?Q?Fr/jXmV97UqyAXbAtgU8c0QqTXeOcx/RgR2dNEjVIK+3vfnrRB/D2K7xgKQ+?=
 =?us-ascii?Q?CirYoC8nWBXuCu5ZuXIJUa+AcqPU5qZvhBnUJeWbFc8lLLYYRuwo0o2/cTm9?=
 =?us-ascii?Q?s0nF7Nkp4LxzDHwkesFCaP6i9XA1yso6GdLso0sLOjBIGtZP1ALEiGUSLcCC?=
 =?us-ascii?Q?nPDRdrEw7HHiQI5+Kj6Af/uuC+s+BM/PwlWw//s7s7BK8N+ggSUU67O+g0/V?=
 =?us-ascii?Q?3HVS8m7C1U2d47xcwejQBNxK9/GnYSnTKR9ry68rCv7dns3ZAt/hZ0vz1yFg?=
 =?us-ascii?Q?BESKZX5ujLLfZJyrcNRsJvOBk1werWNJdLE4daY2OEWklffJTOFB25n+GSf7?=
 =?us-ascii?Q?c5yfxVFDq0pK1vL9NTcwqZujIu73zRpSiCTBGxGcabkfVJUB1TOIUw33+gq0?=
 =?us-ascii?Q?1tsO8ApXQJI2E2m5P/qi4roEPuG4UP10mOD2lzhJMcWn7lNIayYOK1GNrQ+Z?=
 =?us-ascii?Q?0iBNx9Pa0ED7rUcrb+u+e98Qy91MzBZ24x/LpowkNdZQukH1ttlumgsmVObR?=
 =?us-ascii?Q?KkOifdTSNHKvus7PwArI15+6yWs77wHGHTX2yJloJ4QULI6zS4tNs24DgrKt?=
 =?us-ascii?Q?J0bhzBfib2Kn3R4e7bMxKYyPT6QgRUla4ziUAHOSHSB4XaIH7UKZ/4C2aoRu?=
 =?us-ascii?Q?VkL5zWklbRSNPd8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2R2/mG3PgbJccXKFEKjXzwH4ERg0aQ7sy0DjwDWu+MDoXqNEaWJ65ur23nJU?=
 =?us-ascii?Q?5gGb6s8BO59jIKUFRoQ1W4jnbbEsEZyVQiY0wyLxw1D/egkOxbrnl0H9h770?=
 =?us-ascii?Q?py3lXX0pzjZP06WM4v1WkXRxphxXsEtoKI6x7EkZXaS9EJnlFVdq439r4e7i?=
 =?us-ascii?Q?ZmRS5d8P8S4wKYDiVH6Mnn/Uidf/6Jg8ugtRHMWawR33eiX76nVDHsHYmnub?=
 =?us-ascii?Q?X5xH4WLu/aQxt4s8smeahu3tDvP0OPtxzsFW/UehvTklXYjq9xHMWfNLfw/k?=
 =?us-ascii?Q?vRLiwFPqtc1v1kdtFkrwqFNMWgYwJb/EGGaScx5HQrvzAYK2rub5tcZ6t9+r?=
 =?us-ascii?Q?MhasIxwFQ8MfTpm2ao+iUbu711rxdiyIgG6ObZ+5jbMN8+uHvNpIzuVBt3fI?=
 =?us-ascii?Q?mF3Sx/WGxkysbR+XavIT7179LrZN8GvEQV2TJqOy6HMF1cj1qhoynv6Oc6M3?=
 =?us-ascii?Q?3VSWtTaJ/qFFd3vD0aElOz8h/JzF7X12NY2eo6gxWrqw/Ix9ttKDGiIxObRa?=
 =?us-ascii?Q?QgrN5BLw/dGX69SDxDAnPSAk4uGVdD6FB1CdQ8Ve6d9z44NQb8smOxeZt9nB?=
 =?us-ascii?Q?/qtKQQnPQuQLPVvhTuGGlIP+IzCZ2kHxlJjKwRrVFffQOmtaIF2dWF53LuVE?=
 =?us-ascii?Q?dd3b3RdJHZVvcXhofsc6Tvbqh9gapXEN8UzQUoJpaYScE1mM5ezO1GSrMF8d?=
 =?us-ascii?Q?+9A+OIvjyFpg4xfh//8tbFkKr1QkMsO05rd5dSROIz01nrFPuuKluBFG3vmI?=
 =?us-ascii?Q?T85Sd27fJli3b/lLkmQcd02sZxStulufmIvjaoS0QPrw0wjjob0Bl2WOU/T0?=
 =?us-ascii?Q?bWIEjj2i6RvyOhJfpVPiMPRqu3VTyPLTuPcPAqGSKnvLC6kE0SteZv+prUUn?=
 =?us-ascii?Q?NbM0v/Zl7efLSbMCaWYqkeQM9G8QLjnr40hKvIfAOkiR03Yz3pW/SQbuISVB?=
 =?us-ascii?Q?9zKvepYfTkKP9SL+80WQD8lNrdoqS5bozvQZcPNhf7DPuoCapPSxtWU1W/nX?=
 =?us-ascii?Q?YkDghR8B5ihe389ILbJEa3oAL2dV/8vcb+bXzpltUQNQuXCkyL2Bx1puTX0T?=
 =?us-ascii?Q?0JQtnjzPaPbSPRuC2ME7ksSjwv6/jgRvMpU+pyr+oKuGiIgXrzofTB6wjxPr?=
 =?us-ascii?Q?gvqD+0ldlXhaYGj2dQup1hLkU4kWjgcewsbx4rt8btTH6eXKGg1Vy/krDZRK?=
 =?us-ascii?Q?ePgt05aaTOEn/JQLkXlxC0LVmBn2ctZzp4bvnlMH8mWY0k0MDMbMUl7YFm/k?=
 =?us-ascii?Q?ywuEz6MoSFsdhhIJ8v1iZT5OiOOTYVe8tjtqRhdD13ZG7UhBrNhX3o73MRPR?=
 =?us-ascii?Q?FlU7AX8ld0bhX+JC55Ct+rlngDuil0IbJYdsSJvDmGHWcVCYjOIPg+gJWVS2?=
 =?us-ascii?Q?L79m/nSHEnPKKGVZTW0fv7c2V9h+SWlYi2KKZBp2nsjLHwVx+tu0LeHDgLpE?=
 =?us-ascii?Q?hIvzUWriAro8ofne9rCF+3MdIHHhSopY6tz0EL++eBtcIhiKM643IKhoV6ii?=
 =?us-ascii?Q?3iD4ZrBBGpMKOPIg1Nb8ZyX1DuvVgBQCUBJ+c4DTcsDx0gaOXlyQys7weRX2?=
 =?us-ascii?Q?S8pJKVF8mKYxIP1XfnsBcxkj1YL/kgxQXr5aIGQs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c51cf28-a8e4-4728-1a08-08dd937ba4f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 06:42:21.3684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b3LBOKBP2ArmRMagH7qxiC07J6D5oFfZnL6V7TjM8oQ5aRiKqi6LqBkUUg5AGQOT26D/9VuVFFLMa71mJSKc4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4551
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_234252_750021_898DBB24 
X-CRM114-Status: UNSURE (   7.70  )
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
> Sent: Friday, May 9, 2025 11:03 AM
>=20
> With the introduction of the new object and its infrastructure, update th=
e
> doc to reflect that.
>=20
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

