Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB50CC71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmvqIHssEob/GMGuRdpj1Nu9tmGsBGo7uOV1uBeYj60=; b=gbSESVilct+qYNJ3y+LX30dfZZ
	ezcX8ryNRkZe6qC5UipBG6rvaJCgm4BpBL3x00p05tjAyEVPBwHnDhed2R4otPd7U6nVO2rfOevSA
	Xay31yoyPFO0jTothL32GpoPqKEF3xzNdMMyv4Zb4MVutcbokgfOfxJoaXEVx0LtB2yU5HipcGyxn
	0sjvSXfMnusrKzZDsnaUOl782d98CGLta+zy8l05mWolPp60eo6FMjbwvaEX23iSVQ/rsygsR4mFU
	4Zpza1UNV1XWT3zZGzzs8RIRAuNpyLCpHWIhZOeQ4flYPK7mDcFnQwqBYNN2oDTTPNVbnOJtYG1kD
	58e5UXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9Bn-00000004PGI-19Ix;
	Mon, 16 Jun 2025 12:43:51 +0000
Received: from mail-dm6nam10on20626.outbound.protection.outlook.com ([2a01:111:f403:2413::626] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8A2-00000004Dur-2DyQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 11:38:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lzG2/Zs6MKSvlmkgUYV5jmqgzUoh7D1iCQUVhsP01D7xyJxqTEByM4RPhq+jHeiu89eUfhBqCb+izKbcyIdpeHGrvx6V5CSbBWi0CEiqpIfN6Y8duwBd4C7RgvdY7yHTxvizNAK9KsOJJPXGhNfoGDE7Lr5lHslnyFonwt68OMpa2Bz0NHFedqnLjz8NoU6cGGTy9GfqbV4qNo8REhfSOKhQBG3E1mH8jP1LK6z6AC7ghliA07o+MfZG6OMQENRTwVzun5Rb/JIzJOtTnUJ4r25YhasWE2ej3n91KtgqizufWO3PhDtKVy2TrSnKyQoQ6db3+ktlYPh0I14Ix1WK6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmvqIHssEob/GMGuRdpj1Nu9tmGsBGo7uOV1uBeYj60=;
 b=CaSRM/AuE/VQNqHhPBmwSrrP+RYEcLgm8s0g88xaIO0fMr0G0uwPzrVLRHw3O0abdZiceM77mj2NMuBxzqBhSonTT4xEcMZtSYNOy8irhqx2OPWvz94P9Nzp09zEIQ+dgzdXj0/VK9V2XkMfoREeZyDdnDWzm4OVB0e6fHYUVUgTsGzrzTOUgDLBvPF0WMB+zY1izAxPrK6avnemHPBDmteBYMFxm1dtdDVxnVdc4akP6iWI8jXTmrVpugpWWIycjSjXi44HkCbpJ42i+PBJ8kl4GL6Ax/K09925BIXrllJ17YpNbXM12pbEP8ZC68tWcgbPqc88lWxLA0csF8AJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmvqIHssEob/GMGuRdpj1Nu9tmGsBGo7uOV1uBeYj60=;
 b=p3EgKtTRM7Q/sm3vFD2B4YydHBrY73XDpWweJ7JJSexfNUMgI1QRCE8B80AtYxDvqSFo8cITZW5fZjysvhKsCwfq1lYKNb6FpCFxWaf7wN+K02oEov/APB/we/G1nlICDS9XRg5jnsy/9m7P3O9kiGiodAWkQlE1JzaQa+MWUxff/j3O1Odok4CD9Z2QDQ27oG6rK7j7iPkZJvg+jt00pcwsWAdWr6562FjpPfmCFCMto42LJn+5qAeSt1lv1dppzLuINnBfNUjojbdwHx7if/uVq1Z00qmzkGPpeFcHfgUltm9s/tH+iMH4Q0xNnau0MdEquLDCoRUWJkiDXNvJPQ==
Received: from SA1PR12MB7199.namprd12.prod.outlook.com (2603:10b6:806:2bc::21)
 by CH2PR12MB4310.namprd12.prod.outlook.com (2603:10b6:610:a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Mon, 16 Jun
 2025 11:37:53 +0000
Received: from SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::ae1b:d89a:dfb6:37c2]) by SA1PR12MB7199.namprd12.prod.outlook.com
 ([fe80::ae1b:d89a:dfb6:37c2%3]) with mapi id 15.20.8813.024; Mon, 16 Jun 2025
 11:37:52 +0000
From: Ankit Agrawal <ankita@nvidia.com>
To: Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson
	<seanjc@google.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, "maz@kernel.org" <maz@kernel.org>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com"
	<suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
	<will@kernel.org>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
	"shahuang@redhat.com" <shahuang@redhat.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "david@redhat.com" <david@redhat.com>, Aniket Agashe
	<aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>, Kirti Wankhede
	<kwankhede@nvidia.com>, Krishnakant Jaju <kjaju@nvidia.com>, "Tarun Gupta
 (SW-GPU)" <targupta@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Andy
 Currid <acurrid@nvidia.com>, Alistair Popple <apopple@nvidia.com>, John
 Hubbard <jhubbard@nvidia.com>, Dan Williams <danw@nvidia.com>, Zhi Wang
	<zhiw@nvidia.com>, Matt Ochs <mochs@nvidia.com>, Uday Dhoke
	<udhoke@nvidia.com>, Dheeraj Nigam <dnigam@nvidia.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"sebastianene@google.com" <sebastianene@google.com>, "coltonlewis@google.com"
	<coltonlewis@google.com>, "kevin.tian@intel.com" <kevin.tian@intel.com>,
	"yi.l.liu@intel.com" <yi.l.liu@intel.com>, "ardb@kernel.org"
	<ardb@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"gshan@redhat.com" <gshan@redhat.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "ddutile@redhat.com" <ddutile@redhat.com>,
	"tabba@google.com" <tabba@google.com>, "qperret@google.com"
	<qperret@google.com>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>
Subject: Re: [PATCH v6 3/5] kvm: arm64: New memslot flag to indicate cacheable
 mapping
Thread-Topic: [PATCH v6 3/5] kvm: arm64: New memslot flag to indicate
 cacheable mapping
Thread-Index: AQHbzEzI+6vBCHMvLU6Sk33wF14jHrPlo3wAgABB1qiAEJsKAIALHHIAgAQvyq4=
Date: Mon, 16 Jun 2025 11:37:52 +0000
Message-ID: <SA1PR12MB7199DA749A833C23A2E1320EB070A@SA1PR12MB7199.namprd12.prod.outlook.com>
References: <20250524013943.2832-1-ankita@nvidia.com>
 <20250524013943.2832-4-ankita@nvidia.com> <20250527002652.GM61950@nvidia.com>
 <SA1PR12MB71990A84FDB4350DC02CEC6EB064A@SA1PR12MB7199.namprd12.prod.outlook.com>
 <aEMsDsi3DSm1up0G@google.com> <aEx-JlaYJsLAQx3J@linux.dev>
In-Reply-To: <aEx-JlaYJsLAQx3J@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB7199:EE_|CH2PR12MB4310:EE_
x-ms-office365-filtering-correlation-id: d970ab48-78ca-437c-1cac-08ddacca3ae2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?m3JgU0VbenJNpu7i7+x9Vj0yaGGfLMiAgjKRLatg1mZSTSdibNV/+z3M2g?=
 =?iso-8859-1?Q?LyjvITLxitHHMZ9OGXotoj35AiZ7c3BrntbkzXkyF/FiaKSgzQmhWF4GXp?=
 =?iso-8859-1?Q?Sh76CP7Knax6oXCU0G29SbQH4JRS+nesPuoAHBKBH9HBBrHVRIyyVycktX?=
 =?iso-8859-1?Q?NoLZdn9hKSFT49XIThGzP+e4562F7mx3C1Dn97BnE4FCUj4POylN46EnFH?=
 =?iso-8859-1?Q?EF17u/sXPjgITibXBEy33isKbbdivTJZuS0Z0OpwtBII1Didyt89xOvObY?=
 =?iso-8859-1?Q?98FAKhMFZ4x2pW7JcKsq9lBvPCLHyc2leITd7VDNDYXH3Vt0J/6D2nFv2C?=
 =?iso-8859-1?Q?HoWhhkH0WrNJZVBAHV949VIJDGFBC6APtjZO60XLAY8qEHhROwszCbSpPc?=
 =?iso-8859-1?Q?yMq7RXw5vAguGzbe8wKQ+TJQQ4oIcnd5K9M4cNg25pBdslRd5MJo3+2gbb?=
 =?iso-8859-1?Q?cy09SVlIE450ubxchwMOyPCZPnCfhJERNTfImamsJ/AVsxWuQHg0kbaixv?=
 =?iso-8859-1?Q?3kS5VYs/Y4ynvVjFV7RouLjyjgfEKfWGnJlKmE/LxO24BCksOeBZukb1dN?=
 =?iso-8859-1?Q?Qh8ageHuRflL3hAQ1PZuotUiCqJNaE88IFR7iN/KWDBK0WMXtS5figfFUS?=
 =?iso-8859-1?Q?txCv71gxRFy3A/4asn4tptm993fJpmHpy6AoKKGGVAVQSUZL2/2Io9nyNX?=
 =?iso-8859-1?Q?i8q16mRKvr8jqYnBFFaov3CsU5SLheybBB/lRJ+Hl+0o8gm8Rcobfwvb1Q?=
 =?iso-8859-1?Q?OLKoDGaspHMDAbXPXU28voEuyQgfbb+jqPSPAJ5CLt1TP5AsQtBc2WC5eZ?=
 =?iso-8859-1?Q?KFvQTjljsc8BrNK0W7f7I3RlG3sZO5hW2Chvxkwnqy/8iI0xeRbPU4xJdl?=
 =?iso-8859-1?Q?/8QV4RfLhdsBi9X95aIhyk+BrQSQt9wwpQ/VpnBI6oPuvsGxzxbO8o1RSE?=
 =?iso-8859-1?Q?tZ2dBsca05hZAuQNlcG9DckA/1Z/qn2DqUlRPbg/Sw6QnQfq/nDenEYDzI?=
 =?iso-8859-1?Q?uDoG+MAdA3ol6i1UWtUnCdc4JmAVlQr549n32Rm4RSgKcjS0M3CX01fKir?=
 =?iso-8859-1?Q?jIfHLQYCUviaT9oDe+PeN9CIGyUpAe+wXmpDzaangVpxme7l4uKIceJeW2?=
 =?iso-8859-1?Q?wRMm8v69mK26Jl/ScIT76DhqbDiTRE4TH13XIfFK8xQ4PdHDCFA3kdLl8Z?=
 =?iso-8859-1?Q?fLkGErVfNzmdoiyeVUMEsRKzBVBbqtBOrO5kaRA6QpmtzUKvps9jkA4BaC?=
 =?iso-8859-1?Q?iOrQMj+DVktpYjIfVn8RQ99DtQije3Gl/i8UUMPd1c1kkDYd4YJkhqGHxL?=
 =?iso-8859-1?Q?mzr39zwUYoOtPJcljopyKwF65IY8oogd6lNWB2VEYDKaCVOHslOY7T14ee?=
 =?iso-8859-1?Q?Q7q0+7re1hdBuFy9B2cot48/2rj24w0HBVZ2xgVKI/088miaRgZe8SShPL?=
 =?iso-8859-1?Q?bqOen8AmhdtTH7nwtjPKgZ1XZ4UidnzW+HtLvn9yPQRuY1D7S8xdVRgXw4?=
 =?iso-8859-1?Q?/RCP5sao+eR8D9QTZFXCe91DUawd2wefh+QI+ZeiN6RQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB7199.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?HNnRz8iXyHzqnnQGtkkF+EA3NAOajGE6PpUtNCXoISEFqp5zjecxFVCjBw?=
 =?iso-8859-1?Q?80sDfPIA/VSC78CmRrn0jrS2Cy4ZMv3jzcDyWzFw1jODZZDmyd02naIaUj?=
 =?iso-8859-1?Q?l4Jfh2A81bobINhAiBMrVB/x5tO9KX8/l6c/4YVWi0gy1TiMh54Xk/NNFS?=
 =?iso-8859-1?Q?J+9RV1M5ISfrHyAFkwLE9w3qhpq4u0b9Mivw/XJZH6ILwjJADjGBtAHYki?=
 =?iso-8859-1?Q?dIxmvKADQr7KgL22l2iWSvPCaYhKAkeMxLWCf6F1GuGP0VflFNm35nK5RP?=
 =?iso-8859-1?Q?F2SS6tyPxbMdL7lq87lagdr5ApS7IRW/M+ZeoyOGU4PZhWKjnqJ2WzPX/J?=
 =?iso-8859-1?Q?IkbJEiK8qdrB/6/Xqod/Ewuj8QxKxJFyCjU6KxjsLUIVPRXuYH4O+raAlo?=
 =?iso-8859-1?Q?CqyxofqJ8XTfQgiEXIuxFSG4/ZVLi81nICS6AvNImL/YfPbL7OOrusxZ1a?=
 =?iso-8859-1?Q?UaZNlMPQC1WRKaB2Iw0fRCFumgSt7RSZ2skzXFEkecwGj5Nbw7w/5IW8bY?=
 =?iso-8859-1?Q?tW/7/QVCGrAUm0Y95BFLBTKhfsRSVjuOQVb4Qt9WJlC4oRyf0DwJdkcVw2?=
 =?iso-8859-1?Q?OizuGyVYTpgMDvz7b9MTGNQ2VgIsdvZjH2euQDEfjf2oj0OW98QR9gFveK?=
 =?iso-8859-1?Q?yNzIzYvP2eOCsPdpu3U8yqOUHIsSecoVlJQF0pIKQJy1OoxKFxd8WIOjba?=
 =?iso-8859-1?Q?JIVOE9p2gdQmABH6ImZ0M4gnz1cF3It3eA7FJSLAp9H+68FMQt68VY829S?=
 =?iso-8859-1?Q?wRkbAiDbLiL7XqjKcrJYX0shIUveRREamAiGUwzzGVAnqGScZ0tl7TLOlA?=
 =?iso-8859-1?Q?s7J/z1zyNk9/fqwuE9K2L5Jc+OtjUDJxRwSQKauYGqHAfnW+iAAU5x9Wru?=
 =?iso-8859-1?Q?skR0s11/sNCMTDKSuwcAmiplOYh10qNI0E7FCofAoz1oEiYzz+gFFPj0Qf?=
 =?iso-8859-1?Q?dSIY6w7u8lPxICyhOKdhsSW8S+UVPUAYMjFPUiHy7vrQaVdgaWwnPaXh4C?=
 =?iso-8859-1?Q?PBwzTQD+8WMWXVSJ3Exz0BrCbEbGyCOCRSOfR010J5vdNdLcK65Md1VLFx?=
 =?iso-8859-1?Q?VnXxatSs6IXJCI653pKC4ssfpaekO9XwCi4ChRU2de+zOWSrnque3VltI+?=
 =?iso-8859-1?Q?sNRNQuA/dXteoJe4mhTVl6IwPHoNPualI+jdZwBIwHyHsbtegq41awN+xp?=
 =?iso-8859-1?Q?AqJ9F4p1d4kvsWOViSDy5qSnHlgspKW9LGcC5VEbezFDqlo8mtVY5x1nWG?=
 =?iso-8859-1?Q?I/z1wGSsaxgAkNBeiiuKc0/xXEXA71E9V4jhPH1jyCECzLPKd51M8/5Etm?=
 =?iso-8859-1?Q?5+g09c+k5JlV9ovwl+ZwKUkT++6dmz1g3jG+jWRSyNaJT5UE5EmMn9aTO1?=
 =?iso-8859-1?Q?qpe0T9dtCDQldvm8DCEr6lVXnJTgdYaH9nOtRvgaKntEy3WJfQB6laz1fw?=
 =?iso-8859-1?Q?rI5zlqAXK7gG1/kJvN4+WyAucgIpcaQMqjV81w6np1vtbSBSzNwyW3eQvx?=
 =?iso-8859-1?Q?Y2mQEvp1zuHRhyE3ou4XQc4UsZ11Rallx8v13MFD3Ky3iE9+Inw/mDhhdK?=
 =?iso-8859-1?Q?BePN03QG/AsiIhZ0/484LEGPiLOvNd5VYXDkN5IHdPOFlLMkZD/XGnK9iD?=
 =?iso-8859-1?Q?OkWKemYXs3QzA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB7199.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d970ab48-78ca-437c-1cac-08ddacca3ae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 11:37:52.7227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e11r7XgY8XgeLmkBqMKTMu2+JJ+WiDLn/pd7vdnzIdWHl9xYukWP8PrXuxpTQqEcax3UCcYIrhTtXrqnZPQE/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4310
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_043758_934640_C0F435ED 
X-CRM114-Status: UNSURE (   9.86  )
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

> So, in the absence of a complete solution, I guess we can forgo the=0A=
> memslot flag. OTOH, the KVM cap is still useful since even now we do the=
=0A=
> wrong thing with cacheable PFNMAP so KVM_SET_USER_MEMORY_REGION=0A=
> accepting a VMA doesn't mean much.=0A=
=0A=
Thanks Sean, Jason and Oliver for sharing your thoughts. I'll remove this=
=0A=
flag, and continue to keep the KVM cap in the next version posting.=0A=
=0A=
>> > https://lore.kernel.org/all/aAdKCGCuwlUeUXKY@linux.dev/=0A=
>> > Oliver, could you please confirm if you are convinced with not having =
this=0A=
>> > flag? Can we rely on MT_NORMAL in vma mapping to convey this?=0A=
>=0A=
> Yes, following the VMAs memory attributes is the right thing to do. To=0A=
> be clear, this is something I'd really like to have settled for 6.17.=0A=
=0A=
Ack.=

