Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBF1C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 02:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/uMahd+cxODXsITWtHF16gqVimJUR+819u+YrXQ0N0=; b=iGZGkP24Y/Kfc2l5EoMJ45NurB
	oYJWcB7W7FQPQpYyE1e0PdColOb8FS2VN1KKt7grmRWDSyndbVMU7tDc9t3L4wmZ+PVCgArTuwazY
	Lfd37lTpiQkTvgVeVxZewuIq+bFgge6aUNZ2PEPQdNWsn+KH6O7uoq5wgV8i2yaqiHDpb0loqLhDc
	vJebPDfxcxAxmKUNlAllU1jexKmK+G3sefJ0jQ+Ni0+/KvSiBTIK1qi2r+sK0zQ7EKNzRSHzLQ+DV
	X0924qeAE8P4g1qHcuSD03B+rC7Io65i4Bq2NyEClst5qxQh3VzYwIkpm6kgw4mZU8527nQ+qQB+v
	SLguV5dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4w7-0000000BoCx-1bzW;
	Thu, 19 Jun 2025 02:23:31 +0000
Received: from mail-bn8nam12on2062a.outbound.protection.outlook.com ([2a01:111:f403:2418::62a] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4tt-0000000Bnzq-1uFd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 02:21:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMLbWcoHwIwqlB5FcOM9W5ZMF9cyU4KLuMO9jgl/CFFnQuny/tipcLLQEgjt4+KvmXdEprHojBdKjP2bn20RxQwnGyc6YkeKBFa/4KgcJPHaW5wLglMtLl8bhXj/esfMLf1UDMvKrIN+8SCyrMHyaOmFHtB9Ohg5pN0XzO//XotzRsnfrpH+bn/9Inz0gYnhKNRDcsOZupfEpwWb0VZUl1yCYtYfzQIoBqXfb/gJJg5ZVCYson3tdB22AWrI6NSzzXFHZolLfaVF5Zhwyt5f+t2jWTle5xf6wYfmNYRvHZDTqIagNlL8eJAKNpMEE7irrWO4i/1lXbKNt9WTPJltTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/uMahd+cxODXsITWtHF16gqVimJUR+819u+YrXQ0N0=;
 b=EQ+abp0h+W1xJjDPFnf1TRSHifOY4IS0xpSI5lyy/etSqAL4OR6UgRSTe6G9ayHFGyWfe45B70liMXpHDJXNqa8syNaVRzsyTlNuFTBzSoj0QAw37FQwYFMNq+JbwMG1MULQr1T9ewxqBMG+yFD9aJo4cAj8/xusBec+jv/wQd/7UH6lYsCBM+cOn/BBuT0AwEyprtuEvSSr8ampiKPHrtRoTP0/B3JeqmE8vw2if3i9U2edzlGAyq9wznbMZdrCfTNveWSNaYFpuobrnH/x64bGnpg2XxzrapeZ88CTbI+CXSHwfc6lo7obOGbQAVQ9csymxO7fsPhFqOP9MziyYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/uMahd+cxODXsITWtHF16gqVimJUR+819u+YrXQ0N0=;
 b=QlFyARJNExtUQ2MTz4dk+FXtcyC3vd+buZmKduYZrpDhRdjySENMZmFJPxCLDnWG08rsVYXlzchd/agtX6fADrr+lt9frrdWnhP5cn9blJ/BnNbYLf9i9mtMGWUB3dDD1kw37aVg0av51F3hwRZr9ep2pGYEbu37NALuqvxWDAkVsWGDfKlTBfcP5mII2YwQtEtdi4RagTKRGkxoCt5gB0wkIKY02/pEtnP0QjFOiLYhgq44E/LIO2hepzmwVkRPmKT9xfQM1d6ws6FF6q8HNYSS7plFCt0CFgBCog6xcM3x6IvQRpySs0GyYgE0P5ofgcxuQ4zEDhI2By8YyxhmKg==
Received: from SA1PR12MB7199.namprd12.prod.outlook.com (2603:10b6:806:2bc::21)
 by SN7PR12MB6984.namprd12.prod.outlook.com (2603:10b6:806:260::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 02:21:02 +0000
Received: from SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::ae1b:d89a:dfb6:37c2]) by SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::ae1b:d89a:dfb6:37c2%3]) with mapi id 15.20.8813.024; Thu, 19 Jun 2025
 02:21:02 +0000
From: Ankit Agrawal <ankita@nvidia.com>
To: Catalin Marinas <catalin.marinas@arm.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "joey.gouly@arm.com"
	<joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "will@kernel.org"
	<will@kernel.org>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"shahuang@redhat.com" <shahuang@redhat.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "david@redhat.com" <david@redhat.com>,
	"ddutile@redhat.com" <ddutile@redhat.com>, "seanjc@google.com"
	<seanjc@google.com>, Aniket Agashe <aniketa@nvidia.com>, Neo Jia
	<cjia@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Krishnakant Jaju
	<kjaju@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>, Vikram
 Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>, Alistair Popple
	<apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Dan Williams
	<danw@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	Uday Dhoke <udhoke@nvidia.com>, Dheeraj Nigam <dnigam@nvidia.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"sebastianene@google.com" <sebastianene@google.com>, "coltonlewis@google.com"
	<coltonlewis@google.com>, "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"yi.l.liu@intel.com" <yi.l.liu@intel.com>, "ardb@kernel.org"
	<ardb@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"gshan@redhat.com" <gshan@redhat.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "tabba@google.com" <tabba@google.com>,
	"qperret@google.com" <qperret@google.com>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>
Subject: Re: [PATCH v7 2/5] KVM: arm64: Block cacheable PFNMAP mapping
Thread-Topic: [PATCH v7 2/5] KVM: arm64: Block cacheable PFNMAP mapping
Thread-Index: AQHb4B4Q2ttwO17ce0uE4d9KsSbF0rQJEAyAgACwFVU=
Date: Thu, 19 Jun 2025 02:21:02 +0000
Message-ID: <SA1PR12MB7199F2B88CEB501F498FF903B07DA@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20250618065541.50049-1-ankita@nvidia.com>
 <20250618065541.50049-3-ankita@nvidia.com> <aFLfT_c4Fcxt8euY@arm.com>
In-Reply-To: <aFLfT_c4Fcxt8euY@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB7199:EE_|SN7PR12MB6984:EE_
x-ms-office365-filtering-correlation-id: ca87550f-569f-4045-a2c3-08ddaed7efd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?smJFqMT9+P8fsHeL7s7+lNyMcybmOFfqHGBsVKNd09RyoUB98IGi1YHMDj?=
 =?iso-8859-1?Q?8XHMkbSIcqTXxAE7FXB7288HWIFtPvBO6Hznr4DWUMWxG+PWnSGEBX2wwL?=
 =?iso-8859-1?Q?z2CZ8IX/LCq22mWMAK8G7EExz2lhGSZwj+O8eRb6vQ+66og4SjwKrfPa2B?=
 =?iso-8859-1?Q?5CFkVMfE3OKHvlFRkVr/2zYYenMb3b83ufhRtGylbCsXojLbPJdbD2TkyX?=
 =?iso-8859-1?Q?4XHzRM/TsM8gMTFdOdiVmcv8LDQBSCaA3RUh3+Td7wyus5JBb3p4vOqMmn?=
 =?iso-8859-1?Q?g04k1XtPYF2efudkNHmETFfq8NVrKRwqHFxLkzqvVMzGgY5CKWMu8NlRYA?=
 =?iso-8859-1?Q?OrFVzwmn+Jd2cyk2eKJA35pKaFBmDZ4WgDRIj5HwYk9mBuST2tVLefixQW?=
 =?iso-8859-1?Q?L9lVKmLVqzSIoxOL5zvHMOlDfq8XRH4xaUgDyFehbMosu6rEPe0HhNyx4i?=
 =?iso-8859-1?Q?E/bFHLsttN61h+qrF/y3hR1yF65MSlZWyUocmCe7GNfnY6YOfW/PkzX0Ur?=
 =?iso-8859-1?Q?k9LajPzpmYOT+rTNUCs3bFkS7RcHYaTWYavK6WejZdbdaWEEqh5JmcCf+K?=
 =?iso-8859-1?Q?q/vbnXRcr8BcLRWNrMy5gi3GTVI4ryBiNpD51L/U7b0tml06Z1wgtBsy3S?=
 =?iso-8859-1?Q?eHwtOF8CMUVC5UlFS7fUOW9wZIQ2rUHFH7zIlid1IQ8zGJkpM16PK6kI5q?=
 =?iso-8859-1?Q?qkPWBljYvpeBB8HAKC5nv5vGjwTgJu8xFS4hJoM9kHFFW4G70RaJjCzm0K?=
 =?iso-8859-1?Q?nqr4fkqhtjVJdKe4RfKVMLckcW1k/MXSb94zO6ukRSEgu+hDsz634/UB+U?=
 =?iso-8859-1?Q?X09zVTQ119cjZ2IKS+C1N85cid/0V/ZXtF/OJ0VIktxhbdtq45vD9y6PR7?=
 =?iso-8859-1?Q?2xzC8V8e2gICAQ/FbySXg2TbL07pYKPNHoXWV9GZu5mbyJEQbWevLA5kSx?=
 =?iso-8859-1?Q?qXaGlaCtL7zJjilKtzs6+YRFQosMOWvHzm8h1j5C8Vs4o45vjnOKhN/nki?=
 =?iso-8859-1?Q?ugospA4zwTAyzDtQI0TQaLALK8502hIsJFEf09Oo5VTuwKnbAUCCoM8y6t?=
 =?iso-8859-1?Q?Ip6Wu3i4eelKFKS4S9xgIS0ZrBBhVxAqol9FVUNNPfH6ygnJCEo4aRrw1D?=
 =?iso-8859-1?Q?XhNoM+nlOX8I9kM0TT0BhlhMzs74mEZ9K1t4g3xNdZCD1PEI5F9yzhXfju?=
 =?iso-8859-1?Q?U3HibiTv+3xpA1ycTNOn2bff33KH9eVMFcv7AyWQbtdrb5OMYMcFWvrtyS?=
 =?iso-8859-1?Q?eNIFCgDkIuZAwtl8KSOszxGw8bPjRVbVEnq6FWfL3ah6IDRw0CVEkUBnbw?=
 =?iso-8859-1?Q?QxJ+jNNX3VtLztXmibcaeZ1fvOtWPhGLmhiCjU6g8EkeLbZY2TCtKhkcGn?=
 =?iso-8859-1?Q?gdBIwzPOKk+DYfO4oNPCC588yGM+OgPF/o6/c82M01xuLByqsUALIAUucU?=
 =?iso-8859-1?Q?G8urM4/Vd0j1oSXyy8xih5jJ6aZ2Rzst76XlxyGSnM1C/ysHx8c5HaXycZ?=
 =?iso-8859-1?Q?t9b8E/SVTVIVkdTkSoyc2E5fvDWf9DE4YiU4J9ByEQ6g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7199.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?OpHxWsOuPbmrV4Q0T6q72uJ8kuVdRbzpbN7BTcUVMsyIExQJXPZEKa8guY?=
 =?iso-8859-1?Q?PBFdV0mX5Zp1HM3m1oW8009VEioqH4e9eatHd/Uxgkj9I5t65Eul5UYRv/?=
 =?iso-8859-1?Q?umSRkMmF9ppI9pHMK6M4/Mxf+ouETSscBkjWFL2IQfOnNIR/3gcgj+POxJ?=
 =?iso-8859-1?Q?n4lFLzGso/3ddqsyvttz8KqlHJmuRKz9DJ5XX1ytdTAcESU8Xz/crMgDC4?=
 =?iso-8859-1?Q?AFzPc4YVvnYj/OQ/hnEEAmvEFdaC1QwUY/LYUTAXotlFwmxHmqUlEmb0L1?=
 =?iso-8859-1?Q?CIlu1lvdfm9J8cMBBgHO9Y0EY/YngE9W0rkW771nJHffw8E2x+u4yyCQ8P?=
 =?iso-8859-1?Q?r+fE/ol8+Yk3sVCp0Iicez3Yb4aOH+cuoglEXx7HCbTrOLin2mj2I9PlKd?=
 =?iso-8859-1?Q?wdSqgsOHZlukjKM4bv3c4FrKTa5p6Fu7G5QuqYPZY3DTIL+9OrYJFa10Lj?=
 =?iso-8859-1?Q?F9ZP1vHJjOWYrVqOLI1gMNy9Pr6Xh8l4T7h72J1Bn+xPuoPtvJuZFQcQ82?=
 =?iso-8859-1?Q?T26/S/oYGv/oSk1yNNZhNNdFjyI140cxpiN3qKxV3TPu+RKWwVjMKF6y7r?=
 =?iso-8859-1?Q?gegcL+XFXFc3KSw43FPkg9AQ0NN6jq0ChG/KQZlxJOYK7aIoKlZGlU7iPy?=
 =?iso-8859-1?Q?XuSM3gOvKlIRdC3d9ItwaAOYd9DyQMeMICF4l2uGcuuhBMhurvVNC+ZH5Y?=
 =?iso-8859-1?Q?XTzKQRb8l+Vvg2bJwKkNUsKB33+FdB+96N2VnafBJTzQbjSzlO2quaccG1?=
 =?iso-8859-1?Q?U5g0URleQaD4VgXvZcd1xV4bhOCtodbmg0+avOQfF9bcVkG7Wzn14W4f+G?=
 =?iso-8859-1?Q?NpI3hrKlUvI9qa2AWWLp824jC3o2CZ4A2b4WtwHl+28vovsn8tZ4ga1c2p?=
 =?iso-8859-1?Q?MXOR4rdsCmQTasNs4RmeVmoveU5iaWPEM71B8bTP7q4lNf8vp4NXn8iAt5?=
 =?iso-8859-1?Q?SodHZbq1Fv4U+APA79cZ6UE1tA0vc5Cd0Jb0JzN50vYfbgZrNPNWK7wHdj?=
 =?iso-8859-1?Q?JDeelat0LHRgdZLsqUwSt/uLX4SuI75Jr1JbtBX02SnobWmlOy9OFZH93P?=
 =?iso-8859-1?Q?cvuCCh1Visv7+tLY1PAarwG2L1NrL4qFv+wqSHf36z0i2y5JZmCpdTtqF7?=
 =?iso-8859-1?Q?j686IBz5EFCb4o4VBdKhdLa8gzeK9l3DVJXwZFdH7bFS35AG2HKo1meL/8?=
 =?iso-8859-1?Q?cEZui5inIK2+Yu9N0zGbDnHUt/DdqSj2GmyoYGvD2pgGdgs6FILooQT73K?=
 =?iso-8859-1?Q?dIM2oJhzDc5bBBHY5qA03q2s6swVJixnXCEw/IjV9AK1OIe6WtH2ziOVRA?=
 =?iso-8859-1?Q?m1hKAUhu2hRxuW0I+qYm+aRp/0kJMOfWo9/k7x0Raj5HxudomyuV3xR1bq?=
 =?iso-8859-1?Q?l/2pzD9ViQSP2SVGDRINOCaCGQKNYdtdWzNGzQSkhr+FmPVQxA3Yq1zQXd?=
 =?iso-8859-1?Q?vLHpEUn7jRvEWjaMQk4hX+jtJLjqc2fojwyG0N+CF36ixsLyjUOv00ArfF?=
 =?iso-8859-1?Q?EQ7/Dg0CAsxFgerse46zygyCQCP+0qBKhY+gvV5+AVGSFWtf5w+DxsBSeW?=
 =?iso-8859-1?Q?uAlx4XczQbN/8QlV7LOkHTVvy+G6agFglpo3xPOli3/p2RrqImWJ/2N78e?=
 =?iso-8859-1?Q?0+nnisRRB9hTI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7199.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca87550f-569f-4045-a2c3-08ddaed7efd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 02:21:02.1556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K/VLetb25spB9ESEtelGWTeHCDSdsWtPLX2PoxriWd7IA3+91LIsGO+v9ztY+Ev7/f8SYKLmxuotui4cKwE8lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_192113_494494_83D9E30D 
X-CRM114-Status: UNSURE (   8.83  )
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

Thanks Catalin for reviewing the patch.=0A=
=0A=
>>=A0 static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ip=
a,=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
struct kvm_s2_trans *nested,=0A=
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
struct kvm_memory_slot *memslot, unsigned long hva,=0A=
>> @@ -1477,7 +1493,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, p=
hys_addr_t fault_ipa,=0A=
>>=A0 {=0A=
>>=A0=A0=A0=A0=A0=A0 int ret =3D 0;=0A=
>>=A0=A0=A0=A0=A0=A0 bool write_fault, writable, force_pte =3D false;=0A=
>> -=A0=A0=A0=A0 bool exec_fault, mte_allowed;=0A=
>> +=A0=A0=A0=A0 bool exec_fault, mte_allowed, is_vma_cacheable =3D false;=
=0A=
>=0A=
> Nit: do we need to initialise is_vma_cacheable here? It did not seem=0A=
> used until the kvm_vma_is_cacheable() call. Anyway, it's harmless.=0A=
=0A=
Shouldn't be necessary. I'll remove it.=0A=
=0A=
>>=A0=A0=A0=A0=A0=A0 if (disable_cmo) {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (is_vma_cacheable) {=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D -E=
INVAL;=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto out_u=
nlock;=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
>=0A=
> so, is there anything else changing 'disable_cmo' up to this point? If=0A=
> not, I'd drop the second is_vma_cacheable check.=0A=
>=0A=
> --=0A=
> Catalin=0A=
=0A=
Ack, we don't need the second check.=

