Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C594C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 05:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xAi7kQqA4isOm8+rWenO5Y4kAYPIak0lYSGlEC85Ec=; b=TnO7KUQI0Val46/fTIDja9cjbR
	5cvrIF7ry1WMLgvV9dAKVsg1rcNHphoolC455Jepm0R/VSiQOttjhZdUZb/57c2mT1NE+wY26O7E/
	hF8fOdI/MiAr+uctFhIQCnmTH0K6BjBHD+6cwdQVsbVPKPhIDIdv6IrIEErKgHnC7b8xCN1Nfj5f3
	CwzbRk77oYpaI8W+qKY9KaNUmf/f1cbOmbk/ldhBR6Ns+YWBb0b/SCmv911xHrjSQh2IIj5qJ3b9J
	RIqbEvlcHCIB9MkPwxL8Q0liTUMVzn350Z0JjM6t6w5Zq8dP3ai1l7UZcrm4u5/7YmVtFNHjBis+r
	gj0EZGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu3Tw-00000001JrU-1iXY;
	Mon, 17 Mar 2025 05:57:48 +0000
Received: from mail-mw2nam12on20611.outbound.protection.outlook.com ([2a01:111:f403:200a::611] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu3SF-00000001JgP-3MOk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 05:56:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fF2d2tjgP3C83CC2C2HkWYcrlECuM/Ni+JO2gS8NAy7WCmunKwnrm8eFuiMKPiuaJgPWoAIdLQiESfoBa2zvIqjMZfTNA1yixMOK4olwDx/cvLe5Djtm1VRKuW/wI6haTQu+HYXGAUfIyTR6pZv6kk/D/O4H0PFJnJSlckftDkxKjDWQwwZWt0vj41GBOMExv+DP7Fd/rcFXapAre/TeixpgJoRY0fpB/qYVklZB9X/OByCc1kpdtk29acO798xdIZgybtt6QHtdT2drq+1tJ4D15he16cG0FY6qx9RlXieg25Vo53rwRGS4pzUz141I7suLGTiWaW5QXO9GtA7t+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xAi7kQqA4isOm8+rWenO5Y4kAYPIak0lYSGlEC85Ec=;
 b=CXz3scg009f5fYFjGpKcY0rz/W12eGyE0wOdITkr2PJ2XrFXhls8Z85zMakdvxMcQkjFpWCrlSnLnWiynWccz0dK16whPrZzvyTdfCrh+fUaL9E57hKxH4V0Mmc/I5aJu76wcmVukLv0sgZOTe+H3r19SKaZjeeoYFJFcR+oFGhmt8UsJ2IeriER0ew3aTbvT8ThyWmzthg1KA4zsHS9O36lZkaF3OAHHPo7xm3dPOIkWzXVjfycm2rR7WWoYExzWCM7J/rZgzmCeYZuLJ+1NQI+pqQQ7Mn4AlGchmYfdyjx79HhuKlpBiPjaAiXJMt2nBZlIQ7WOmzUxKtJNOQVjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xAi7kQqA4isOm8+rWenO5Y4kAYPIak0lYSGlEC85Ec=;
 b=TPCWdf3LStqYbLIbTiF4P2M1WB5tnqsOpdAMGdQ8wpg/vj/Qdrym166WWgeL0Xh3SztmEdqDwN2T5duhYNvmIR+JRWwZzU+ACmroDotcy1nq8QR1eH1DHOmnUAsCY1lZZ41xxwr6+Rni53BnBwwr2ZcbYDxUNL8X0NNIPNVudJ/EJHP5VnscZss6r3WhsxB8NuchJMjE/5EVljki3c3CIlCdA+Zi3ShmK0LBk9IscFc8X0QB7eKili/kwgjvF0i37kwoM8GJnRTFTz3OiBnvI6lVZJYGCQ/a6m3toHNq/IavezQkWPqlfJHFoWvDAWSOd+FUzeIPlEaJ6WEpOuaZmw==
Received: from SA1PR12MB7199.namprd12.prod.outlook.com (2603:10b6:806:2bc::21)
 by SA3PR12MB7975.namprd12.prod.outlook.com (2603:10b6:806:320::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 05:55:56 +0000
Received: from SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::ae1b:d89a:dfb6:37c2]) by SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::ae1b:d89a:dfb6:37c2%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 05:55:55 +0000
From: Ankit Agrawal <ankita@nvidia.com>
To: Marc Zyngier <maz@kernel.org>
CC: Jason Gunthorpe <jgg@nvidia.com>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com"
	<yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>, "ryan.roberts@arm.com"
	<ryan.roberts@arm.com>, "shahuang@redhat.com" <shahuang@redhat.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "david@redhat.com"
	<david@redhat.com>, Aniket Agashe <aniketa@nvidia.com>, Neo Jia
	<cjia@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, "Tarun Gupta
 (SW-GPU)" <targupta@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Andy
 Currid <acurrid@nvidia.com>, Alistair Popple <apopple@nvidia.com>, John
 Hubbard <jhubbard@nvidia.com>, Dan Williams <danw@nvidia.com>, Zhi Wang
	<zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>, Uday Dhoke
	<udhoke@nvidia.com>, Dheeraj Nigam <dnigam@nvidia.com>, Krishnakant Jaju
	<kjaju@nvidia.com>, "alex.williamson@redhat.com"
	<alex.williamson@redhat.com>, "sebastianene@google.com"
	<sebastianene@google.com>, "coltonlewis@google.com" <coltonlewis@google.com>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>, "yi.l.liu@intel.com"
	<yi.l.liu@intel.com>, "ardb@kernel.org" <ardb@kernel.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "gshan@redhat.com"
	<gshan@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"ddutile@redhat.com" <ddutile@redhat.com>, "tabba@google.com"
	<tabba@google.com>, "qperret@google.com" <qperret@google.com>,
	"seanjc@google.com" <seanjc@google.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
Thread-Topic: [PATCH v3 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
Thread-Index: AQHbkaduhEbbxySPq0WwO4LU4q6wXLNsQygAgAD/GeCAAIkeAIAAC14ggAFVjACAATjx0Q==
Date: Mon, 17 Mar 2025 05:55:55 +0000
Message-ID: <SA1PR12MB7199B320DAE42A8D7038A78EB0D32@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20250310103008.3471-1-ankita@nvidia.com>
	<20250310103008.3471-2-ankita@nvidia.com>	<861pv5p0c3.wl-maz@kernel.org>
	<SA1PR12MB7199DD985C45943A663E7003B0D12@SA1PR12MB7199.namprd12.prod.outlook.com>
	<86r033olwv.wl-maz@kernel.org>
	<SA1PR12MB7199500A3683B15A64B663D6B0D12@SA1PR12MB7199.namprd12.prod.outlook.com>
 <87tt7y7j6r.wl-maz@kernel.org>
In-Reply-To: <87tt7y7j6r.wl-maz@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB7199:EE_|SA3PR12MB7975:EE_
x-ms-office365-filtering-correlation-id: 2e4e8b0e-d168-47df-4ef7-08dd65186228
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?tGz5l7fNSkzwB8vQbKwPGQhJxJ7bpTf4+2xJp1dEZ+vKViCGSuuFRzobct?=
 =?iso-8859-1?Q?tC/5ZcCugzoNGocn/4F3AWQjbW6pX7qs1HBYVtxABZuMMphIm1njqGL7ws?=
 =?iso-8859-1?Q?cuwKL2p1aCawFbtjSju7A8JqnLKao5pCtAKApI37q1ylY4mMkdDbG+Mn9y?=
 =?iso-8859-1?Q?NJ/uatvoSZscFYviGg0GuiPdEGIhh2PaKLil4AF+9rqt6ZH8hhQuEfrPO2?=
 =?iso-8859-1?Q?UJdnXIGNZFa0vrdG9xKncK6Akk4c3e4eWYU5y5xRLC89C4zWZZ47cdX9TZ?=
 =?iso-8859-1?Q?MOnA3v8P8o0M9vl0SA4EV/HIS78+KoT6LTn/kYf4n9Y/PuKfsToTlAfX5d?=
 =?iso-8859-1?Q?cGfV62wxGESWw3qPVEmfwh+BvMtSLI4+pWhfBNBWOLFHs9nHvZymuXC1Qj?=
 =?iso-8859-1?Q?1zP2yGhaXZDuFJUSHp3lmud4ltCklY3b3E6kd/chIkWNmzKTIjCQvWrifE?=
 =?iso-8859-1?Q?KIMDk1xJrQN8weio4753wUpa4PJBj0e1H4auyUxT2tbZ85q5ZqsPRuauot?=
 =?iso-8859-1?Q?71Q7Dg40NDiA22B9ZZMF0SQWTtFPx2o04oSpZpKhyZOeX47lZeXrzEZJ2Z?=
 =?iso-8859-1?Q?9tvxxO+R7+qrRiq0guLm5zQObdq/mt5oR4ipmLpr8HbkhBP4xXroSZULz0?=
 =?iso-8859-1?Q?aEeD2wQlYXcqhiplyKo/pNbRuTCvkPShoZCk8SHV9jlTML15CH0tl+JrgC?=
 =?iso-8859-1?Q?4GUYO0xbdglLJ7nc1kOAAtR2/P5xT262zGTKjhBWk7CdujuC9wjEa6Q0s9?=
 =?iso-8859-1?Q?ifsSBGvND3VF/im6avTkvCYcnwzl4c1oqg6y3KeazoCr+bchgYXrYWJ9Js?=
 =?iso-8859-1?Q?/lg0QtK3snHjdJCyjf/qKfqzBMorNTCkvXQZWInmj66Kp4HX72t4nTd6tM?=
 =?iso-8859-1?Q?5Bfs/bcVJDjjBtjwVS2IurcCBK2y1oByKJYHCEctWfNQa2ODteob6B5eb9?=
 =?iso-8859-1?Q?jNksmTceUXZvKSf1vtVIswhpFzy1x3Qitf4NaQ/JvIH860HMDK66udVoT2?=
 =?iso-8859-1?Q?SjA72kwHVO6ilkRElkKoC6IeNcxeAcPGvEgORRFVp/XRDEltEF9evJNEkQ?=
 =?iso-8859-1?Q?NBToQwxRK+4lLq+SsvwHUOV1WDRCBACnxm/zpBrVbWPI47V1w6VNPwJkAW?=
 =?iso-8859-1?Q?0JKQU7van//29jrGp7YyH88YQ7GXNCVE6ghBOY6d6OuErhDgIR6dJXCiUu?=
 =?iso-8859-1?Q?xTetFAoRF4bELzhGF8eYqO2G9hYKeAkIjglG4Yiz6zXNTw9brxttSh7WvL?=
 =?iso-8859-1?Q?iIeHUKnu0bJOdxVCm7fhYYHF40PFnqGFTBzlOKT3/tIkeFOjpQdwn2s+l3?=
 =?iso-8859-1?Q?PItZ/tSGiq+4VvFSamj/1tPM+fdhVCbCS8sSmLSmfa3tzuy2OAUSHUIglx?=
 =?iso-8859-1?Q?9lcQj0zVpI0tgjibHNeAFm/1bJVsk2bf/RKpG/42dsoEjH2Hrx01vKtMLC?=
 =?iso-8859-1?Q?qAb/rG0OuOL7mGYZk4CEHHrNG/nvhVQj9Qx5XuYnN+/7saEY2ff4rILUTe?=
 =?iso-8859-1?Q?Q4uDEDDEJoPavNehBI8J4z?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7199.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZNe5PVFYPFCQSgu7CVj/LREdNnBJHJGzehV9I0RPKJfkqNiyOacGKnJ+Ud?=
 =?iso-8859-1?Q?w6rJ4ucS2DhZ1VJ/mUIo1bV+bc5Zsp+vOyXYG2ydzAZEYnTrFRM4rRbHtf?=
 =?iso-8859-1?Q?Mq9lcd//dD4f8bi+eIw2gOTgILAK3fv9+ww6anOhDdHnBjlIcckiQ/la4V?=
 =?iso-8859-1?Q?WZINlqUJ+wJAth5pIQyJAXu8moU9IxcnUyT7GM68iJ+/75zRjZ2bGHyouo?=
 =?iso-8859-1?Q?GouB58TnakY10PdXdMrC7kLn7hw+hkGxHRVzOuW7K/f5osNL67wzWkn60Z?=
 =?iso-8859-1?Q?UFytLmmqR3HnHyBuuYyi+kgWu6/c2h4X4kzV9Qdy9KW0C5me/d+ungWyk4?=
 =?iso-8859-1?Q?hbu48v4vMWvx8mMTE1aOleDrx+DMtnBu429cggfP3aWo1+lW05N4tLS4JC?=
 =?iso-8859-1?Q?ZJ0yk8UWqGmpvYP7uWbM+Xn0b+MGVYp3HI+JvLFzKgs1+3LorgwBBrbSmm?=
 =?iso-8859-1?Q?sCO7khI6SSVFL7Yq2mUBjgAVrLwSpXLpJjoreQZdiug+E3K5yiAhnUte6J?=
 =?iso-8859-1?Q?HJPRy16gL8ky+0n7A3pFVaGzvd/3M3BTD8E7OiMAicfsARLILQJP51pJcG?=
 =?iso-8859-1?Q?rHPbqld7I/9HeQZxr2JqdOXfPAS2xLT7VFC63OOU9a8duHOkQpVpt8LS8X?=
 =?iso-8859-1?Q?GvB8bq99Z5f/UaZ1wSHtSsNQMH6sqiEiGYv33CCbxlXb+Q/CC/kfGnTzCT?=
 =?iso-8859-1?Q?4lA6Oc6mUTC6CCZ07LdgSB8qZvMSgxzSF5tZhWLAzqaCUww1hJ29eqo+Y/?=
 =?iso-8859-1?Q?LT/eg/YjKqkym+NFe4woNb15r7+v26YnLjAAn5lR5Na5b4nxH1wQm18JlA?=
 =?iso-8859-1?Q?IsTYfR8uI3ehVTp1ia08eTZatZIT54bAOGK8+qqaaP/uWPAncJjo8F4rOG?=
 =?iso-8859-1?Q?Cjt5FLARqgTlyvKsRUGWejZ4TM+SD7Gw1ys+NnuX1ejXP9Yx8r5b/wxnP0?=
 =?iso-8859-1?Q?CQCycdyIlr5Rc99UO8RYZDhHnSdYfsN8H2XqR4Hb9+t3ciItafXQwUPDfA?=
 =?iso-8859-1?Q?WbjZokoureAMN0HfLUKI3EO9Xex1+83t+yLU6/ZX43qhBHlcty5GL97zI7?=
 =?iso-8859-1?Q?A40eDbgW+rSGdiQ5rcDq4hvbSsIn/6sLo/cJOjyzV14T3l/Sy4ZmSzsYat?=
 =?iso-8859-1?Q?Ks8UGpx/rJNAS8V4G5qfvCv/Se1yx9Lr/JUiGkhwbddrYIN5OvUeX4+zjh?=
 =?iso-8859-1?Q?8+mlUNIQFNA92GwgoozBwDg++UxllH609GLZ5N/AxDHy9rQ7GBAukfbKeB?=
 =?iso-8859-1?Q?o0IXfLgSQSRpi/r1rBdrqxpolqvgJi3F74H4wODum1dw3+clpl00+GSskj?=
 =?iso-8859-1?Q?GCFfXvxWhsINtlaWIA89VTpx6CVLX2AdQsc17pDn6fmqkt+k/V2QC+B2sc?=
 =?iso-8859-1?Q?X8LMUiFt8bwWFEleR1oxddR7TqFAz1/MTl6NP3wxSUTG8IdW/xMbaqiGye?=
 =?iso-8859-1?Q?8VwsHKS3Ii/5Tt4K69qZ573zF1sNQVcEdB5pwShumNMpPq3kjAD2+tXulJ?=
 =?iso-8859-1?Q?A5hiEhGsJgLj7H/XRTeTsrDuxlFVRhy9OC3YmR6dA1SgVbmwXBa9eBMsNM?=
 =?iso-8859-1?Q?iVmjo+BnDToK6VOV6C0xCDTVhllLXGiByKXBeVm0R+eBakDyxYK8flFVMX?=
 =?iso-8859-1?Q?NdqqjNt/62hlk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7199.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4e8b0e-d168-47df-4ef7-08dd65186228
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 05:55:55.6577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wRZp9EIbCT1cBkfTdnkDLbUSiZMjk8oxr2TwkL+LJr2ykY252Pdc4gv6SNGbTxbW5nnLGgBtagpTjMddHezpbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7975
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_225603_839314_8E996B07 
X-CRM114-Status: GOOD (  10.59  )
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

>> For my education, what is an accepted way to communicate this? Please le=
t=0A=
>> me know if there are any relevant examples that you may be aware of.=0A=
>=0A=
> A KVM capability is what is usually needed.=0A=
=0A=
I see. If IIUC, this would involve a corresponding Qemu (usermode) change=
=0A=
to fetch the new KVM cap. Then it could fail in case the FWB is not=0A=
supported with some additional conditions (so that the currently supported=
=0A=
configs with !FWB won't break on usermode). =0A=
=0A=
The proposed code change is to map in S2 as NORMAL when vma flags=0A=
has VM_PFNMAP. However, Qemu cannot know that driver is mapping=0A=
with PFNMAP or not. So how may Qemu decide whether it is okay to=0A=
fail for !FWB or not?=0A=
=0A=
> This must be checked at the point of memslot creation, and return an=0A=
> error at that point. Memslots are all about stage-2, so it makes sense=0A=
> to check it there.=0A=
=0A=
Ack, will add the check.=0A=
=0A=
>=0A=
>=A0=A0=A0=A0=A0=A0=A0 M.=0A=
>=0A=
> --=0A=
> Without deviation from the norm, progress is not possible.=

