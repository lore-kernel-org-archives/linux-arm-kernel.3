Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96FAE9B24D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 11:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gP0dcVOfhtkRI5WXv1DCFdL8f86BBrsD/ZHmojTFsYk=; b=dVeNGISDg1RUigBYIovUV+Dlc2
	agxChUzlSFRYQx1XofhMPbhHzV5sYOeIx92Y3rOkzonFbLWSMsjNK/AKR4lXovb2aWWnkdIY+SX7f
	k813hSe7lQTMzGQ6j8/54f/XIRB1YGGG0kSXBL3HBiTCmvuzT11j0u3XXVDdr0KvEQ/jFUDVZL1QQ
	sHw/rxjf/kyQbUt3ph2geIO4r5C0dFVHsg94QMUKfLWQzol00yo3a3p4rAXxMOZZxF6paKS7JGD4O
	3ZA7xXvsDUIoBBkGGHnTinHLE1FL+EZc46sCaUctxnHNTjFRDhxDM8sT0BPVOZdKVCZZic7zCie58
	fWtqHrvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqH7-00000001wQ5-1IRc;
	Tue, 24 Feb 2026 11:08:21 +0000
Received: from mail-westusazon11010034.outbound.protection.outlook.com ([52.101.85.34] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqH4-00000001wPE-0MzS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 11:08:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMdBmGkIdq/W8rmwgaAASVp4ojOe3haQ8fGggALIZ1muCQgWt6DWIAwIDGUCSVIAkeFMpl4Juh5umCQRUhECnytdtfzSLLkdTmMliypa5Nc4y92lVTLS0L0uk9DOvyz7DLy+Ryo20XeskTkRv0aenCOZquDFqgY+NiOAauZggctDp0k4a3qU3DbvhPpl6J5BBRKv75fh6B5WikTrDIGhP5PsO8T9B66p8L9O+uw1dVnpH5NdCQU+IiEQE8cXOHTp1jLRND4W+vgjo/7LrMK8P88WbNi4Zt2YTX+Pzo1OEC/s+To6bmnxNXvQfG6roPQwQTeSTK1Wnh+ts3qeJT/i/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gP0dcVOfhtkRI5WXv1DCFdL8f86BBrsD/ZHmojTFsYk=;
 b=HoYVOclHD/NG3G9L2LHC++eIfEjxv9HAzCYUuOrL02lSswHbRJg6l8STCPiMNf5OhmHjnFjM7fz2D4kZstt9ijtthLYTQbQEkghPDs0dBaCItMRgo2gATCgm86R+FGw8GiITazx1mI0xWL1nJsmEPdF7aXFziDv4wbRTTrv1C934sSScpazORuPiuycNisUzTvCBvKImjPGXnfWHVe3STxuuv0B70zBXf9XW8yDek7HV+7XtIBNKT9eOrNLwIaFmigIMHuEdERhsi/gXfxeM9J9Fi7gmen2vjlYmPVgd0AC13QeW3E8VC5LUo3wqDHDh61G0PVvNEeJ//5WuPHpl2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gP0dcVOfhtkRI5WXv1DCFdL8f86BBrsD/ZHmojTFsYk=;
 b=tAVZnWWHezeapvvbcf7vR/vICKPKpRQXgwLJY2gYpbcRq4snVL8l6k0hFl4ET5K6anvKNAa0i/uPqunrZRpeYxvEKzLMk962+/0OKHi62fmj41GMmuy8s1dcp+dGNSFlcY4VSVon4e8oWzD3mdQa5OR59pmCJPL21qvKobtgCL8=
Received: from SN7PR12MB8147.namprd12.prod.outlook.com (2603:10b6:806:32e::5)
 by DS0PR12MB7947.namprd12.prod.outlook.com (2603:10b6:8:150::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 11:08:10 +0000
Received: from SN7PR12MB8147.namprd12.prod.outlook.com
 ([fe80::3923:c1a4:778b:56f2]) by SN7PR12MB8147.namprd12.prod.outlook.com
 ([fe80::3923:c1a4:778b:56f2%3]) with mapi id 15.20.9632.010; Tue, 24 Feb 2026
 11:08:10 +0000
From: "Neeli, Srinivas" <srinivas.neeli@amd.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"Simek, Michal" <michal.simek@amd.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "richardcochran@gmail.com" <richardcochran@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [RFC PATCH 1/8] dt-bindings: net: Add TSN Endpoint Ethernet MAC
 support
Thread-Topic: [RFC PATCH 1/8] dt-bindings: net: Add TSN Endpoint Ethernet MAC
 support
Thread-Index: AQHcoWOT1raipV66w020xwAhQlA46bWKPd0AgAFQ5sCAAAsZAIAGHsuA
Date: Tue, 24 Feb 2026 11:08:10 +0000
Message-ID: <SN7PR12MB8147F556D0040D37695AC3B89374A@SN7PR12MB8147.namprd12.prod.outlook.com>
References: <20260219054911.2017362-1-srinivas.neeli@amd.com>
 <20260219054911.2017362-2-srinivas.neeli@amd.com>
 <76c811a7-d081-4238-bf6a-0226e867560a@lunn.ch>
 <SN7PR12MB814702B7C9A28577A94FE79C9368A@SN7PR12MB8147.namprd12.prod.outlook.com>
 <36492eda-a332-4dc8-abd2-99be88f7d06e@lunn.ch>
In-Reply-To: <36492eda-a332-4dc8-abd2-99be88f7d06e@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-02-24T11:07:35.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8147:EE_|DS0PR12MB7947:EE_
x-ms-office365-filtering-correlation-id: cded2424-3310-4e1f-b19b-08de7394ff22
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?EOA5F+Ajq8gb18IL6B2K7FxcOQH0w0R6Q7RBLJmVbheWVaGd8O9kAhG6IU9u?=
 =?us-ascii?Q?jZ3eTW4PC4AHafHmurBgByd5hiYLG4zQj5LbCYvn0b7Lne3wPMFGQ/Zl76Dq?=
 =?us-ascii?Q?zctfyLZKASiGLxaRMq8HhC5QOORzvQxl1vnXM7YW01dQCgrRcfipDSaXoTO2?=
 =?us-ascii?Q?KbSR+3ADAaqGfjnWSDpSD7hhwOegRzyGqRndkz4s0y8aXPl8WfQuKs8Fijx3?=
 =?us-ascii?Q?1jKWyr/E4dCS5KQUlqBmOaFVKOzjpT2j97aDSVXHzdILibXvVx/efEajeQLa?=
 =?us-ascii?Q?Bb+EsL3T3Kx86UsqOk+qLFZH2Zz5DJcoQW1cvxDzPcpSF3Rs71CeK46GihK7?=
 =?us-ascii?Q?HcMSg4PR2tUGJzenz4V14BuOObsWUWvfV3oPbHnFBcJjumqk63sMgxjzDNvi?=
 =?us-ascii?Q?ICf2EQPkoO6jErCqfJyoYSr+HCgFFrl0T9RAMfli3U7tXalF2dagf6Wd3wGT?=
 =?us-ascii?Q?z65bjwy4hgkf4/XbEITBsE5ttrJyEHJnKErsMOvXfVy6M66UsVbIRL1q3VCg?=
 =?us-ascii?Q?3UyU/qgHLB8ppnBv9TTnH9CiZib2DFV5/b+EFk5+yUoOV4Hs50S+zky5SWz/?=
 =?us-ascii?Q?M0bOZn4xSP7UBpuB5QbDrikFnHsApGFxhlaZlCqcj4f7mV18DgCz9JZTbtE7?=
 =?us-ascii?Q?Pi98JaDzlbtDiG4Xws3auM5L6/E0ruwvgAvbGyBPUT5R3C4DbwKE5xGyFX5p?=
 =?us-ascii?Q?3erowQiNqnvJbNCs1VKRtkfaTbhzYELaBGTLlM2+RF29mbSihTn2SmTVCWtB?=
 =?us-ascii?Q?9tSSvcKDsV0CUxzSJD+7JEWBMglBq4H3fohk7mGhPsa6OHsRf4nK+R+ivWIC?=
 =?us-ascii?Q?uPIi3o3SRbQqslY5oqF/zRZMZd/3G6YjrlEuLhBN7rS6fi8mi7bVyb4gWdm1?=
 =?us-ascii?Q?JukcaY2iQHXqleWL6/JKPsJy3pxcCqqyWbtswbLKVg8kCgqYllHaBZ/SmiN5?=
 =?us-ascii?Q?mpmvnJ/ZfwDCWMXac5NKkdNXpNjQwj1dC6UttxKj3i/4C4RXSYyJuTPt2oVq?=
 =?us-ascii?Q?ZEEqKEVK0cFvyPW0G7pJsUPViirkavXkegeC56tSqSthPrIfgOsEaTUZtJn4?=
 =?us-ascii?Q?BwCUGj1pDer6rozUYfZxUWiP69QwbbVAHdRMd4QananpHbpGuUa2GrIuzKa5?=
 =?us-ascii?Q?7ZfGl+pJ2ltEjD4w/W/8V37Nq/ab7kUaBBu7czP7MTur7AZrkj9C6+XQT3G5?=
 =?us-ascii?Q?EHLWmJtiGlbOnmDtI8DX1fONnk3Y2dU58UqFPIY12xFwdBAhKrhVXnUE5aK8?=
 =?us-ascii?Q?x8DYAZQCj6Dk1i2aKDlc07TSMXtzlRSJy8BrzocfnwYyJiNfaxKCBLLm3gjH?=
 =?us-ascii?Q?ZGqjT5k8+DP9ZR1hDUP8JOTgi4C+5GkGvvmSyRvZn6TnaQ+Fl6jshOtHmFr5?=
 =?us-ascii?Q?sdMdJj/X314gKmHU4qMGyI/qzlai7iR8VtAZ0gRsGewJNvZ+H5TRilytdRF8?=
 =?us-ascii?Q?vEjWYenYVto7XKBMuFMr2YwrekqfhABHcUZdNfO1ZRM+9m3m6ctSLVdd15PT?=
 =?us-ascii?Q?J+fsneBpzjLWY58aOaHD/q2EHD86ZkDj7Gved0jHY68ql2k7K1lCgSRq2eNS?=
 =?us-ascii?Q?QAHWuL4JnLWAp+x99xschL/Z/FnJIjKlNYXtWc6W2ubdlm3tMLgMqhTwE5ax?=
 =?us-ascii?Q?iXeOBxoPBn3thnw9jGlEFSo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8147.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5U84tBFYo5owOEd67vkOr8GlDqJrOLzQMUvCSYMV6sHvWFtwJutNKMdk4jei?=
 =?us-ascii?Q?lobJFTB8zAp25mUPnJb6xQBoIASwTMUUCbcdM4yj35RnX01n4al7LrBly+U2?=
 =?us-ascii?Q?+u/QloTjcCdtoq78WmBPe/k7Iq267yj4/nn7J5ZG+wpyodsM6zLw8CyJpvSP?=
 =?us-ascii?Q?roOiok5Cj1H0dLq6olhvr6J3ry6wZjFfvJOACwBv8TJLuxeeZ6319DycCNeu?=
 =?us-ascii?Q?Uv7EJfjWqSne/hpaiAPfPb7R5v3V7LFCZiwYfLHeGtYskZM4BSez+oYvrUD1?=
 =?us-ascii?Q?3WYivMvBdCZjm73dhVyMGbdWGzby5AkO3n6j8VDN9J1ZUznwmZ0MCJD9bmo+?=
 =?us-ascii?Q?6dIelP4IfhFTILAoPbTJkGJu8Z4saX79i4t7L+rdGgW7uYIT7rFtNsTb+4xV?=
 =?us-ascii?Q?F1s49dw/oWNgh7m6bmsJXoL6EcJw9qT0lPTZnUlmyNGTFlzICdEBouo66rwg?=
 =?us-ascii?Q?kaDT2qUWxM1wxKHo0Eigr9zRQDeGvzj2qPRv0f043zwsaQ/nShBqq62XEMHK?=
 =?us-ascii?Q?m1jSCF59vvxNsfVtJfhq7zGmo+z6TSs7uYT43w+PSXvYv+JsR7+HZi17M6Oy?=
 =?us-ascii?Q?hqm5yFoQV0tdLnIi+hLZEl+ySADlJzDN9kPsd+kRBahpQMyCKJL08Wk2SWad?=
 =?us-ascii?Q?XtX/oaqJi/z3rj4F9q/4qedCvAMKeubHKtIoBiDjdjgJF2+PkpjqxclOqveE?=
 =?us-ascii?Q?q+GikgIkVVLbRm5OJxPV3JfenZLf6mT6nk7kxNSpXeb69ul0Lt4GPkLVxA3u?=
 =?us-ascii?Q?3hpsZF70jLLB3VxDKHit8p+g7Bq70Z2OK9sSn4Wz8819JOcqAkuTp0qlTiUv?=
 =?us-ascii?Q?3rRzfmEoe2IhRQG8zo/SW0PgXwkmavppvzRPBjj0CZ9hDHf1w5yg5Rc+LC0B?=
 =?us-ascii?Q?TrSDhNJn6gDTpp5Pzhi24SwIvF46YcTvRlozIe3+mvakxk+z25Q9Zpo5JEZE?=
 =?us-ascii?Q?eKf8c+tICmLQo0GZ2iwT5o1D5RePpc4AYUB8X9XhUVPwiVnOrErUgvc22LbT?=
 =?us-ascii?Q?x9P7T2jYJmuP/rVpZN0SM45c9XAR3k9Wp5IPINNm6HED8F3q44jryRTGU1VF?=
 =?us-ascii?Q?uvC9ZXNQR+RtM4c/uCoTKWCcO1L9UJOnUr0lH7xqwsMP4H0KwqlBOUwwSZ5q?=
 =?us-ascii?Q?GHVJRWoeMQ+YcRct8khGvXHn5QCQLvkIXSonzbbtKEfre+ZxsZ81vtRuIDF2?=
 =?us-ascii?Q?i+oEgeypYLKHjIXSry2fT9y9WtveCRwxJfuESah0GD+v3QjY5rtkHhRWDqjF?=
 =?us-ascii?Q?xkAKi/D98afSNavAJZCpBqTEMjQx0pA98l3dHbymT0T6Per5vc8b0Yfmj/eb?=
 =?us-ascii?Q?SROW7SQljU4aC+vJzHSLF42+oM9uAsAkQxgwr3Asm79olQ+Rp2dNHm8wU9xQ?=
 =?us-ascii?Q?MYSq722CEkcl43Vkz3uOqBVI+uG4EJYpCDKuD+3tb2FXJxApWgQ5uFXJmn7S?=
 =?us-ascii?Q?wef3l+tVBxFAukWyZeEgBck51fmUn9nFbk7E7zWDI/R/2c9fUUUA1aY3MzoQ?=
 =?us-ascii?Q?Iw2UVXFU2w6jqqqoQJ/qUPpd69vRV8W4zLD4qyIZJWkaG71bSkzGDbe+1SSm?=
 =?us-ascii?Q?0/274jOxW3hi10W9ue2cQIyX2EUqX32Kn/QfF47+BWFEilyq9aal9fEcmgg6?=
 =?us-ascii?Q?akMKfgWIwe0jOLVuVeSjPqR/GwhBzyUduEPKX/SGepw748V6WLj/J/J1b8VV?=
 =?us-ascii?Q?tzluheXCUjsQoCXX39yqtddjqzB1hGS5jyTVCwWGR4KNI/FY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8147.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cded2424-3310-4e1f-b19b-08de7394ff22
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 11:08:10.5709
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NpotkkwfqLY5+uBQ3kBWxTJNYaZLGTslTwIKBt6Chxu46kzSKw9hOnP56Ub26I09
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7947
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_030818_147567_FA3B6879 
X-CRM114-Status: GOOD (  17.50  )
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

[Public]

Hi,

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Friday, February 20, 2026 7:09 PM
> To: Neeli, Srinivas <srinivas.neeli@amd.com>
> Cc: andrew+netdev@lunn.ch; davem@davemloft.net;
> edumazet@google.com; kuba@kernel.org; pabeni@redhat.com; Simek,
> Michal <michal.simek@amd.com>; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; richardcochran@gmail.com; netdev@vger.kernel.org;
> linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; git (AMD-Xilinx) <git@amd.com>
> Subject: Re: [RFC PATCH 1/8] dt-bindings: net: Add TSN Endpoint Ethernet
> MAC support
>
> > > > +        // Endpoint Node
> > > > +        ep_mac: ep-mac@16000 {
> > > > +            reg =3D <0x16000 0xa000>;
> > > > +        };
> > >
> > > Except the Endpoint MAC does not have MDIO?  Or does it have an MDIO
> > > bus, and you have simply not listed it?
> > The endpoint MAC does not connect to an external PHY and therefore does
> not expose an MDIO bus.
> > It is an internal endpoint, so no MDIO node is required.
>
> It does not really matter if it is required. Does it physically exist?
> Can MDC and MDIO be routed to pins? Could i hang an external switch off i=
t?
>
> DT describes hardware. If the hardware exists, describe it.
>
>       Andrew

The endpoint does not have an MDIO controller in hardware, and such functio=
nality does not physically exist.
As a result, attaching any external PHY or switch is not possible.
The Endpoint connected to the CPU through the AXI bus.

Thanks
Neeli Srinivas


