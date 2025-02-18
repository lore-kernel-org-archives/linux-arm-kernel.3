Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EF0C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 05:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smveEJdlItL0C4iF94j/TMmrSX9LkjjSeAItSWuroQ4=; b=Gv1e3z9P0wf1R95cWq+D8klObD
	Gl39puzZ/wYA2ETpr8hMl4cROgHFIT6Tqj4vjTJ8XZs+lwvEVsnPGv/dflXH/cVLMhLa/TYgSb3pA
	22Jnyfz+fFcHf2mC2thbZXpRdpfi6LQx0ZvCLJ9bU1kJBaJDyECjE3PzQQwksWnCxAVfCl+HRKD2/
	5C17Xt6+XqJTT/PYxLt/WKxokApdP1KvYWe/haA0Lw8dXtURZXgtBQ2AY73seL0kMpH7FLi+QsL5D
	JVqrhVgJOPoSr3+3xG13HI59fWL6vXoOSmi0xPT3vjgRNhDicsGaVD/n3Dfpp6DVtD+ACXpYad5SV
	v6iN0dXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkG33-00000006q0M-2cDS;
	Tue, 18 Feb 2025 05:21:33 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkFxS-00000006pAh-3M6X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 05:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739855746; x=1771391746;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=smveEJdlItL0C4iF94j/TMmrSX9LkjjSeAItSWuroQ4=;
  b=Npq0ftd7PhYSTxrworDNKRvO3VZh//MtiP/Tm76x+HSxVkdbWkhVABTg
   n6WJh/SVOy+m0bkMk4AWLR633vVJoE0kxZMFZ3ouVTQvBHmTVaT2y+dJM
   qQpF/mT532d/uCqn6UzPnaCWVgY/++WRQ8KcwUWoKXZqcMFi/NVYmk//1
   78Jghm75EXD1AALH1bNg02RsRV96Fdi7mY7/sK5hDx7KxXwMRUpEk391I
   5C3QmtxElsyJpiS9Q3Ay+7ySQY35E7CbEuNpCmC06R7kpNjRxiq0I3cUE
   UMmi/9SaIvbeNXTWoTm7TUom6SXB56eyLC7YUx+mEMbqp+EjzTg9QQhRS
   w==;
X-CSE-ConnectionGUID: auUYxSKCQau6sCY7shSLeQ==
X-CSE-MsgGUID: jw+q6cGeTSe896qrljSkaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40660580"
X-IronPort-AV: E=Sophos;i="6.13,294,1732608000"; 
   d="scan'208";a="40660580"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 21:15:46 -0800
X-CSE-ConnectionGUID: R3DkYue3SHiTXjt8dUoO0A==
X-CSE-MsgGUID: LOrjCx6dROCA8yiwCCAJSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118419631"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 21:15:45 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 17 Feb 2025 21:15:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 17 Feb 2025 21:15:44 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 21:15:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDtomgp3/brh8PORcxFSM4ek26IYD6YvErmDg+FsFs4iTRwSVESb6LebgWVlafTLBtprn4xhK09vRjIZHPT01SUt/5nqrZfjonO7lbBBrQTlK594AosQki9/+hm+/sofAStFTsyQVtSGAMBiCXx+yBLEWurkB9NRWahv9cry7tRLZbJdNTdVaMgb4PjAVfXjz2ozW4kRWw7mZlOKAlrNKD18rsA/xn9Ox6ObKOLvPDksEDZJzg2UsdzIaWYvhjS3S1TZ9/EMevv7ChoZacnkpLTbzyy2Ec80tHL9HwshKOfIKFUtjyutyOP2QogSfQzVDe4TJ54ITM3GPrLXo8/HVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smveEJdlItL0C4iF94j/TMmrSX9LkjjSeAItSWuroQ4=;
 b=WkOWcvUBy4Ofa0wp7Sa+BMfUZNwVgMcjr251KgPgOg6W7z53w2q726ErUcuCEe1SrYpDF6rBttal7WwNzf7udwBjbWBTNhY8XHEu+AmJVUNsQcCy85M93tiqiyC8gf5m1wC//lI3Zfp/BLEI4Rx2hYvAxFOa91G2McFQtlZfGq6n1oa6LEvtog/NnL+POXULqBw8bainWUu+fu585/qahd11OHWB9Vvf5eeUJHIKPwtKHiH+11IQsLA2A7Z4XXjhDn4htUm7Pss5j4hrKH1EdWOtcj3+rW5y3WYqUfMxt5FUvlHkY6oNRRsTdFKubwYgfm7TWgFNiXJmnVP0HBu6JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SA1PR11MB7015.namprd11.prod.outlook.com (2603:10b6:806:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Tue, 18 Feb
 2025 05:15:22 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 05:15:22 +0000
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
Subject: RE: [PATCH v6 08/14] iommufd/selftest: Require vdev_id when attaching
 to a nested domain
Thread-Topic: [PATCH v6 08/14] iommufd/selftest: Require vdev_id when
 attaching to a nested domain
Thread-Index: AQHbbsCCp1B9L4JFTkSWRpiI3JUqArNMqp5g
Date: Tue, 18 Feb 2025 05:15:22 +0000
Message-ID: <BN9PR11MB52764015B568F6AE7532CE6F8CFA2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <cover.1737754129.git.nicolinc@nvidia.com>
 <3d943ec41bcdc2a3a8ef78c9433e5558be19bf81.1737754129.git.nicolinc@nvidia.com>
In-Reply-To: <3d943ec41bcdc2a3a8ef78c9433e5558be19bf81.1737754129.git.nicolinc@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SA1PR11MB7015:EE_
x-ms-office365-filtering-correlation-id: 1268b217-f865-4d40-c8dd-08dd4fdb3edf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?r1Koqk6WyJBbt40jTocsoflnelYAstBR6fivpULGKxm/VvDPYRVuIhQro8jW?=
 =?us-ascii?Q?pToNMQ0LjFmVQ+kA8hhNI7d8v84DxPEueQoxcsvYEpcMtqPychMIZvmIo+GK?=
 =?us-ascii?Q?PbbNLz6loNmCepp/RVxNwrPZhYcaqIr7Dik9JPBhznfPqI+CfOdxk8m2f+OA?=
 =?us-ascii?Q?sMAiEttVWyyVPrkZuY/4m6a69J8XGte/H6BnmpXVmok/wCQ35oBXMbh5xbCL?=
 =?us-ascii?Q?artoAJiszM7YRWx+7TTFidFhknEH4NbA75adC5PTU331EU69Qbuvr72lxOTp?=
 =?us-ascii?Q?9BybdU8vs88WyU2iiojbW9HIAUVcH1B/Ihiqfh5JYkJynq8eNoNs3AfZdWag?=
 =?us-ascii?Q?67L/ohQVr9B7/gQzeOjS1QGk/EK3iSBlcwp2mQAF/iwAX+w5GwAzWwXAq9tU?=
 =?us-ascii?Q?iQuXnJMEf4WBBKm/8qcH1EitWABm86Nyqdd3JEbK+5ppTPD52dcXWRZrkRrr?=
 =?us-ascii?Q?cYciMA/2wEpom7I199SXmfuAmviD6vl6B2XbHp7tZBatKpx/G0RwL5RnWaw5?=
 =?us-ascii?Q?e7sGAENrBni+SnUF6ssIHQTXWyssyPz2kHqwRUpMkeDGRU3blh7PQVSxqRVK?=
 =?us-ascii?Q?40GUQgu0K47o4AWNfuUR5L8t0FSEqg2KqRb+pOiOcYjuXQwoux0jvegsAubc?=
 =?us-ascii?Q?61R+j/W2Qbg3yAW3Y2ug6kp4etwYVzE2Hjqb9oXlk8y/O/knEk1t4PZCf+a5?=
 =?us-ascii?Q?rTzNJqcvmMiJjrUaHJ3hWyrgw+6V6jsXRRKj79Gucp+vCqcxv69WK53+SGgD?=
 =?us-ascii?Q?iH1w2lQrrYxZ07QZPKlomYoD8HUxBHmmhtzerelIOEBuERlGRC+EituBz+Vz?=
 =?us-ascii?Q?3Mp33Zg3nqLuh4jv/CuJrPL9D8Azfb3cHwzcb77jGIXptyRtZj8pG89yDJs4?=
 =?us-ascii?Q?LpCGqX3Gix3miIh7oTfjf3dQtjTciedxqpNnKH6bIK/WZP3kUgJsb+9Q73H1?=
 =?us-ascii?Q?qo3sS4Z5jZ2nT1L081A7SAVJsr9Dn15PUdeVTT/YCjvTS2HSpoIk9C4bmsKb?=
 =?us-ascii?Q?NYzV8JNXdTPUw5LR2MI3jH7QBs5T0A1iyvjFKV/PQSphN2mfl6MCG2LPA3aZ?=
 =?us-ascii?Q?gdEK0NIFEMnkP3FGdvQJWg2PQz6Nkz5vXUOi1/lJCZulGcDS6SFjRiV9Ugka?=
 =?us-ascii?Q?Gd/PAQTc3xIiycoBGnBKrJd7O+zo/yH9UjWafff00WPsLz+2+g0YIgfPpr1a?=
 =?us-ascii?Q?FzQztnYWIDAkvvwsjQZMzOFiXMuCGW+yUxkYCYHhBirjteQksqXLqSb8krht?=
 =?us-ascii?Q?ZKXbadzrZVa1sitA4W6X/drW+SnFl9uHksjQ/pwvys4x2/BXtr9dTBdLlWpE?=
 =?us-ascii?Q?k12OFhiGwqO+ppSO67VB1Yl5LWXxq+rUCKRPgRTtDovw1B+Y/6JTr7V3lEuC?=
 =?us-ascii?Q?tpW9hgMvn2g5aaXGzwZDbCcWB/X46gDp3Rhsvveida2XNAJGrfWxAcf8tkH8?=
 =?us-ascii?Q?zLYndRqN8veZU7VHHKM4VVHid+MQ6e+w?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5276.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YCCxDWtPAC3WvUOgUANi8ZlD/TIlp9nT0Zpt+xFuUO7PGn/OstexoU3ZsUzz?=
 =?us-ascii?Q?AsQmFkeULoeDLCUgBjVgmdFH3yCbZNzFVAN54a6Z1+fS8EG1DXfhI3sXxS3k?=
 =?us-ascii?Q?cPwopiUBqQFBNCwxLQwS5ESpzjnpbxUuIZ1KcHwH6KcDk/uwPpcPaxdKqd9+?=
 =?us-ascii?Q?hxXQpU2bsQjdBAXypobzDqpZR7Q/A4IrS/Z95BQUt80rPf6EZkl/m5vxOYs+?=
 =?us-ascii?Q?2WN1AJT0LPZuVdcqcYkCU7yNiiCzzB/U89spbvynlwAzFTIFtINm+em1pdi9?=
 =?us-ascii?Q?UfR1tS44Q6HsJp6olOlHNVahhqCkt7NAnbBLacPIRApRkPlLVHdfCo6xCpG4?=
 =?us-ascii?Q?4n+/Q3DIO011n2Fg54zfU9rSa2tWZw9tRpok91cNKxZAUuRjtsD8yFnRCzZe?=
 =?us-ascii?Q?BM/9uKrGmpB9NFe9yGQC6zT5Qj3FxyhQ1aWqKXu5tr9QGRUZwQ4TZURef46W?=
 =?us-ascii?Q?ak0dKjEJexmCVkivWZaYk/2J6J9RjFNi8SPSrDsvb2/PKscgbJC7IMY+ISKc?=
 =?us-ascii?Q?k7Te007W70KUBxqu3XDWPsfOe4owNxYC9k5yidJLFGpdLS4oKHM3zy3cUL/5?=
 =?us-ascii?Q?JSlRURhRxsf1GFXwRoAw7wyFcnuKjh6OMLJRNJqrPNqKjWr97qB0rkf8YV2i?=
 =?us-ascii?Q?Kt6Je9Qjq5kvjWhKps8P0nUxZLZjNR52jN/QpYmIpvy3w0IHeDm7lPZRgUD0?=
 =?us-ascii?Q?LfOCtDg0BAzysDoQRqSs2nHJs8qH0ZsQgDfm4eLBUJQQiWRrQomHeTNEpJUf?=
 =?us-ascii?Q?jR1e+p15Bziuz5t3ANWvC7xSmKD6gMFJ+uzmlNwvJ+pCOPZxmNB2mdDdK1Ii?=
 =?us-ascii?Q?767i3tSWGymOkDvTNpDG0A7QaKoyDRqYjCbZN3QaP+eugLbvEAOC2oGqowtJ?=
 =?us-ascii?Q?6xQQqJ3wEChADc0TjY9XTZK+Dqiv7/XTs5Zg+ngEr+AzxkX1MnBuVxbKLTlQ?=
 =?us-ascii?Q?yHOxaRXg/F9ZpO4Ju2bGqAamswUY9Q8MJ2UDhXYBZv8+ak7tic/yFvIrQw6N?=
 =?us-ascii?Q?4tx0n5ljEjLZ7xZVEtTAlPu7+wdKJDPi7BjTAbGRrLJrkLil1avIPbV54O2v?=
 =?us-ascii?Q?u/80w5c5HkGT642MepClxenpLdv14iYya9/IFgyyU+oJWFohb5QJvf9Ee1pj?=
 =?us-ascii?Q?CxqGVEZImcIXLAIBnzQbvMbmWWFBItiKU+FoEZVY8c0aoYTjUtORUCXxGpr0?=
 =?us-ascii?Q?fTcgbbZJ8OX1woH4z4df3o0aaEp4tDT1MR686tT9IR9kG2bAY94q0+eB5JGZ?=
 =?us-ascii?Q?SQvU5ATE+iOBXi3DGgFUhLE7R9iDjBfG0mRkL6EQbLYV20/ILyvuO/F6NiQU?=
 =?us-ascii?Q?bD+oAxR4lHC5TpCCxS4hWxJvRPbOOzrg4YZEo8YimLao2lcL+8J5UYncdTyR?=
 =?us-ascii?Q?WY9wMgUK4r5DcZPuJ2UOa1Kbxke2j6OQ6JLK6okCSpHLL8PKUjYwnJczuYRF?=
 =?us-ascii?Q?2iXFEe1aZMORR17mHhCSAcAPAdDqU1Zr9zOlnsS+HcpbBk7lNMG3Up8t5DI5?=
 =?us-ascii?Q?A/VA2F8uKINliy0ktpcDZ+LV3BcKNBhbT+9XxfXJOkjEU68Lw5H2ov9ZEZqr?=
 =?us-ascii?Q?z+w68uEHcjUf0paQGI1ZdRZ0b0JqvcSeMJSLJcdh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1268b217-f865-4d40-c8dd-08dd4fdb3edf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 05:15:22.7564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /W/61YhjUAFJFwtjwqpV9Mfuw8ZGwALCNrLJJ9KZZwYLq+m1lBMDSYb0bQHYCHwPIUtLZayQPp2Y+gSiCDn27Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7015
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_211546_876118_466F87CB 
X-CRM114-Status: GOOD (  10.29  )
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
> When attaching a device to a vIOMMU-based nested domain, vdev_id must
> be
> present. Add a piece of code hard-requesting it, preparing for a vEVENTQ
> support in the following patch. Then, update the TEST_F.
>=20
> A HWPT-based nested domain will return a NULL new_viommu, thus no such
> a
> vDEVICE requirement.
>=20
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

