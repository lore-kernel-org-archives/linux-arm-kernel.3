Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEE2C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 02:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wi0Ty6/Ratm93cTjItJ7iDyCe7Un/ly3Qe/7ZY6foag=; b=ueijPzXzPhmeN63QntJmbGAJHK
	uRFnULf2ju1HLRk9Y61R8Gevw5zI2MPeiIw7vtrKaeLZ9dc1qv35vtekTZ0V9pbWcy/bUj2aRuHVW
	qtvPUNdOoHZGEzaadlxR1cI2dCUbpt8tIZZvY9j6h0baDVkIfYCILQYmjYTYSkpQAEuQoIpOc8n+k
	fHa3sbWmWMv4dBAC9aQLhDu36lTs0nBjJTv0itlcLUQX6bYRwFofwctTljJFqTsfcg9G1XTT4SZIY
	qW8Q/R7y0xFZDbv7uZ9YLupH1fiP5+nJiTfy55hroOXDob/ObQTyUyheURdUufkJSUzLucsY2tcL1
	aHKRW/5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4yJ-0000000BoOZ-0ZSW;
	Thu, 19 Jun 2025 02:25:47 +0000
Received: from mail-mw2nam12on20629.outbound.protection.outlook.com ([2a01:111:f403:200a::629] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS4vI-0000000Bo8P-0J5R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 02:22:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yy1wcsVU1WpQQQUFgq6Nqdb7oUeT5PlnrVT74vnay4KjtHWqYgs+iYwotx50hcXchClBGQPF7a20/laQDVbp12JY3STsuHb0x2bChf10mcwWkiD7SGhgl+FmKWeKfB0EdKVECD3MyPR3JzQz7XOrEBqEm6XyWzZpcZO8QYwCIT5TZ4NuUvKy/Am7ExcJwvnSw/jMplzg090yoXIW2dzlStggOAoVqtiCjuAWEx1lKkYhADC+avLf3ZkhhCy7VVSCuamhGrvexHpCRrt8g5y91HSMGYmtwQoQOoIbIVCE17kgmTPE3wr2OF0n49iLzbTxyHQQZeBBd91KzbeinzBgsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wi0Ty6/Ratm93cTjItJ7iDyCe7Un/ly3Qe/7ZY6foag=;
 b=Rj8vvtf/U04Xlow3NceDQnC7E//mdtuunTeuEKe/cQetBM6KUPfnNvyBL8Q5NS5IgJ90drU8BXeUQOgnjhNB4UGlwlt3b7sVLn6HYIjyECAZ9twMhFdw73juR6fQfYO3omumWnKXnpB2Y+P8jkM8jNZTVlzK+hSjjxLbHOS+Z56oPNB70vbYm8apIwKDtTXXJteSi9WyguR1SXJ/1F7ZxnRb+eskYJnKHQgqWoYulIyeUzMsWkyUlugEAAikoVnM0ebFQB5L1ywHz2qDDXvc/SaXaHE6QkezJ/Xs78+mtMIATdiNfB19K8h8WxtxnSQsbPktI15vQMTF0+9qVV9CSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wi0Ty6/Ratm93cTjItJ7iDyCe7Un/ly3Qe/7ZY6foag=;
 b=cp+3//tNhM3OctZqPccQKC7QzT0wwr03f4XIrJzO60Rjd6ksDVzTGLMfYnmLMJin+btpthbiIAqJqXcBGcXyerlO01z8K1nz3BB75oGRBYEbGPeioOaB+pur7joU+DPZyKqGc377Tq1I6BCOofB3x+FeBrkdZ6YMzvFRyP0waqhTLVvQeZqWDi6Me2cXzagqoht6IpOtgIlfWggUgq271aux+SSW7P0zXXpUZgr7MCRlDLml4HcspvbzIaGvaZ7ew0ld+QD1GnSYkInG6mHoSMD58kbR8ZZvNumJ6qnna8jPPtKbJbpQMx5ZgFpyJB3fOjuSGGNAZZ4geKZ4TbXSRw==
Received: from SA1PR12MB7199.namprd12.prod.outlook.com (2603:10b6:806:2bc::21)
 by SN7PR12MB6984.namprd12.prod.outlook.com (2603:10b6:806:260::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 02:22:32 +0000
Received: from SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::ae1b:d89a:dfb6:37c2]) by SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::ae1b:d89a:dfb6:37c2%3]) with mapi id 15.20.8813.024; Thu, 19 Jun 2025
 02:22:32 +0000
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
Subject: Re: [PATCH v7 1/5] KVM: arm64: Rename symbols to reflect whether CMO
 may be used
Thread-Topic: [PATCH v7 1/5] KVM: arm64: Rename symbols to reflect whether CMO
 may be used
Thread-Index: AQHb4B4N1wf8XS5vvUiK0jUwBZiI7bQI/CQAgADCHeg=
Date: Thu, 19 Jun 2025 02:22:32 +0000
Message-ID: <SA1PR12MB7199C4E718B01D373C9554B7B07DA@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20250618065541.50049-1-ankita@nvidia.com>
 <20250618065541.50049-2-ankita@nvidia.com> <aFLOnN_Ha3s724rK@arm.com>
In-Reply-To: <aFLOnN_Ha3s724rK@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB7199:EE_|SN7PR12MB6984:EE_
x-ms-office365-filtering-correlation-id: e2dc3f7e-4391-4d93-aa14-08ddaed825a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?HRpYkf+q0Ms1DM862oayfFBjdEgELQlmL4mXdNMzQE2FvE5pX7GRKhdkhV?=
 =?iso-8859-1?Q?slJR4AoRpwDfzc2NFoIfx+alf25iiM1jSHutF/cnvzikQ7vGlRFm5Scmr2?=
 =?iso-8859-1?Q?PlnR++TegM0FH/Iu2d8+IcMfd3dWi2WobRW5YwHuKIW0iSF26FNmMc2FQl?=
 =?iso-8859-1?Q?g3I1Jxlyx2cXfANZg0G0MGpE/AwKfaMeJBSiHNTtwwASWPTcjyqskF7JEY?=
 =?iso-8859-1?Q?EKqZuTw30C9qFrKynTgtRalf0+TeHYQKW9+RkR6YuRuHBuJ6QvE7JLhPlF?=
 =?iso-8859-1?Q?sfjx+VpQPWnNnYPInJq6DyRABxq4IX27Di/pEZnz4Z/cXVTIcQhTRE3px7?=
 =?iso-8859-1?Q?/OkHHE0Kx/yTqO5TY8VrM0Ld7iY80ncBl4DNe/TFR4zIyM9OTG6M1I/5we?=
 =?iso-8859-1?Q?5q7dfRg2EtpMwfqPJkPs1nfQ/VdjLYfiuq+MqVD6vyoRvnJwRJxSUVZkfk?=
 =?iso-8859-1?Q?YpznHeIo10qrpn5GA+wUe9C8dzO3zmHYPMY98vMOht3wd+h3qjHPP0grU+?=
 =?iso-8859-1?Q?5sCB/IMb/G+DO4DsobSVWTbPT5HdMdCMBMvHZJqAcrvlf5tP8Kh3hBxczW?=
 =?iso-8859-1?Q?XHqvBtFzDX9iqGtgVDnZps4ns30g0XG3azV2h8PGKAbW6xr0GRPqlvPbGp?=
 =?iso-8859-1?Q?QMz4hWBoiBwcz/xWYpngoMbCy86pKefx+2oFyo5IfCreQ62SAHEM/iENco?=
 =?iso-8859-1?Q?4Jg0PO59fe8soThQdViROeL/MSexQFyqZ5wmEDehN25hYzV+xI25736NIb?=
 =?iso-8859-1?Q?QYhgoJ+ISL/LVON/U6npRomNGDF72uRcIpMUnOfge+05zY3KUXBAZf4pB4?=
 =?iso-8859-1?Q?KkCVekqm4HD08DTsK5M3RXs2iYG5z/FdWqEmzThRHxHPKN35xT/+csPLDv?=
 =?iso-8859-1?Q?ttHTza4ZIU3bHjRoLvdmmZHSc9vbDSVEBF+oolzBnzunQwe1bnoiY2NWAy?=
 =?iso-8859-1?Q?f6r9AlCXfggTvJ4afzChksUCXB9LmCsh6aUM7KYVkypMDB12IsHg5Ym7Da?=
 =?iso-8859-1?Q?Zr3Yqmyj5QEUNO34TShk3VuaF4r+SMnmzTcOmX+Uew6/RUVjLRVdK8p2ip?=
 =?iso-8859-1?Q?OF+DBX2xsbptvs6cGK7v4mcVkvkv+SBNEIP6m0SEHbmauumlDDiDSwVlXK?=
 =?iso-8859-1?Q?GUYjgLD2y/X8IIyxl5bJHjXKbQ+f/4HmwwnWUyXyEl0Zo/yARU+AgXscL2?=
 =?iso-8859-1?Q?IXlV7m5qvR6GSz48VJd0DJitH4BT0cCeeqXPuq5tyV7ne0oz1YzngIVKYO?=
 =?iso-8859-1?Q?8CyjWxWI4SH+biSEoinAOyCBx5LTN7xlfXlUHeo861kWJFw3avh2KfNfHE?=
 =?iso-8859-1?Q?QLuYPFb992RPmbfNAMufE8PESsOOu2aGoJjFMmXRPIg2R1NTa9NrnZWS/C?=
 =?iso-8859-1?Q?IEkhIq61/Snizf/Tj7A7K/LveIlE/wvVLc/5zS3IF7KJTW4Lfzk8PmIVr/?=
 =?iso-8859-1?Q?Qx5isaP27xyZ4KeK3G/RaoIbU7v5tCPVHhpo0EFi/53YLCQdlB1xs9+Gl+?=
 =?iso-8859-1?Q?YHsnJgS9Pq2ha9ZMTSWn70lhCa7wsvhc1HqLPg8pXCZw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7199.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?St+26rUmCX45y7STRtq387i2qOmyvi4Oem2yZgmISgPhcQP+rw5kny/QGV?=
 =?iso-8859-1?Q?3Dz1rxDZm/vwjVHvoIEWbMi/rqTbL3TlWGyKQfp7gi5haCQwIkfPzeUyz3?=
 =?iso-8859-1?Q?3jLYQyzacDfbzB37bLE2ZoyhcLRyJES1d/aaJIjnQx+Q2mwKXL8MGGsO9i?=
 =?iso-8859-1?Q?dR+MyH9xbcl5hRjryIN3Bw+lyRO00xeLa8eQVE8WwzaU7cCllEIMPuXTM/?=
 =?iso-8859-1?Q?X2gdEqhnJEOL138bwPp9+FWgvPOr7bnhhmDltF2aHTyQzGriSx60OKEfkI?=
 =?iso-8859-1?Q?suSeEwAQryrdk9mWH3V1i2wD+c/p44pesxjvlN9LpMr1YjFrLIlXnsx6GH?=
 =?iso-8859-1?Q?8twYC6zoFbpj9XY217kGZ2NhW7K11084pqD6YI+6KGnwKIF5JU5X3GGCz6?=
 =?iso-8859-1?Q?BKbXUvq+UGO8JO7d5o6pJAUCON3d7psf8yrKoiVC7UUBVRp3FEznzGm8Yn?=
 =?iso-8859-1?Q?159eMaptbAw2QEg4Ti29RT9E98hnvTeErI6wNr3IDv9hNuqk5qLh26hCvG?=
 =?iso-8859-1?Q?09HMvDXSnCd9UogCKOZuUNm6zp+4gup8E560r+gF/tdcizrzjuCf5JrkB/?=
 =?iso-8859-1?Q?55/ayipTbyWV8L6I+oUWLLf9O5tY8opJQVzvTu6FYJ0mSLCowDpTvCUQLF?=
 =?iso-8859-1?Q?ulrVkdX/qx4iQ9KpatWdy+spyjdKUiZwTK+nlxUDRpIf6YomVoXte6E6NG?=
 =?iso-8859-1?Q?oehrPnOmHkZcJlIBEEobit528baTsTImrZEJ7FmW1JJgxc9Xtm5HFxCfVH?=
 =?iso-8859-1?Q?CEMP5gFmWHO83yrjQIoE1UlaMwuQzusNnvG0/hQyt2U9x5DZst72X0RN+6?=
 =?iso-8859-1?Q?F/7MRRkixMocUJMzZ1tr9mOsJueDWUKIMJ95UcpJkAHlGFRB0PfPeJQ04R?=
 =?iso-8859-1?Q?/4AygZBSW+wGHUfhldoUbUf8nEpBbjr/cTqQUm7v1jJJFK6xXSnFJTt7yE?=
 =?iso-8859-1?Q?Egv4tU19ltdxIQAdrDvK/waW34lvHl71qcRGh1ZCdcU0EIOpmswCp+VLye?=
 =?iso-8859-1?Q?4Dn5YwD/uFWADOCEfFzAIsixML4K4W4PiFx4GQr0AUHQSuUvYXD0ZVz+X3?=
 =?iso-8859-1?Q?PWw/WkTHtLHUdnlHh+PXNOT6QDc+Q7jbRNVPiRkjB8s1yjsIZZUbzv5r4x?=
 =?iso-8859-1?Q?02of8XqPOk+CIB0no+mH7KtVdeKXI0UqsWvzzP3Iot3TMVtUCwBE3Jtc0u?=
 =?iso-8859-1?Q?DLgNo4F/j0aSiY0oNUh/hLhyGo5ISGyfteajSkk03mtYxLpsSw4a9o8bj8?=
 =?iso-8859-1?Q?nEQNUA9B/sw4/4yquG3Co+xonP245jiY9v7AMLKp1px46gK2ujJpQiF75R?=
 =?iso-8859-1?Q?1vsGmOsL9QgbQ9sUVUvas7e1DLcaYLgjtNzQmVaQMAPRJrbhnpH5yRzXsD?=
 =?iso-8859-1?Q?/KapyO4oa1bZwId1hrUplAGXAUE5bAImPiVCOF5+n17Y6VW45BeJhVaARr?=
 =?iso-8859-1?Q?nHiyMoPuIgwBidCbPyHHvWXoCKIxyslDOLIusARsFMDSWRy/8WpGoH7tqz?=
 =?iso-8859-1?Q?y9jD00a/pyAH8eJxgtMXF6itlvZA/77VcyJyJCbUpPsIQiAA2SPwIPMKwM?=
 =?iso-8859-1?Q?VL3tKOEzOKW6vZtxSTNOfCD/813u7mMDZ+uLoWaydCaxNK3acB7dXmygyJ?=
 =?iso-8859-1?Q?wEH5NYFHjWOBI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7199.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2dc3f7e-4391-4d93-aa14-08ddaed825a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 02:22:32.4178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iqEY/QuIcphqkF1UWCp2ED8+wZXucCcjcKFUhwk/2LpHI1X7+CKh1AhIyawgZxtKZXRBl1NzN5F935VafgzqzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_192240_115620_B37526A5 
X-CRM114-Status: GOOD (  11.45  )
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
>> -static bool kvm_is_device_pfn(unsigned long pfn)=0A=
>> +static bool kvm_can_use_cmo_pfn(unsigned long pfn)=0A=
>>=A0 {=0A=
>> -=A0=A0=A0=A0 return !pfn_is_map_memory(pfn);=0A=
>> +=A0=A0=A0=A0 return pfn_is_map_memory(pfn);=0A=
>>=A0 }=0A=
>=0A=
> I wonder, why not just use pfn_is_map_memory() directly? At a quick=0A=
> grep, it's only used in one place and your patches don't seem to modify=
=0A=
> this function further.=0A=
=0A=
Ok sure, will make the change.=0A=
=0A=
>> Currently, the kvm_is_device_pfn() detects if the memory is kernel=0A=
>> mapped. It thus implies whether KVM can use Cache Maintenance=0A=
>> Operations (CMOs) on that PFN. Rename the function to reflect this.=0A=
>>=0A=
>> Additionally, the "device" variable is effectively trying to setup the S=
2=0A=
>> to prevent CMOs. Calling it 'disable_cmo' would make this code clearer.=
=0A=
>=0A=
> I'm not sure CMOs is the only reason. Another is to prevent the guest=0A=
> from mapping device memory as something other than Device with=0A=
> possible implications for external aborts.=0A=
=0A=
Ack.=

