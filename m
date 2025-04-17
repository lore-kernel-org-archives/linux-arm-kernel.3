Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B76C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2bHLIVBCPY0YMH8B71mwnJJLoiNa2RLhW0FwbYoi9Fc=; b=4tm1taz+18tphMMtbnbQ3AEY3B
	0I9ts4qB/+jSe7WQeKZPkhSbRCOvHRYyW7kchirn0IQUMvONM2h7oG7ieNm+1c9AugpoWKNPUjNb1
	DQ5r3rwUSTLDw9VHNRuazjX5Vg8ocCVKvyjy4PDCc2g6B0iWJCDCnUIjoSJ3x3nFGJq/n3bhNeMbF
	SywVU3uZ00UGfWdD4Xtemczzgb92eB5c79IZ3FvnzJ4LBUUTlaIIXJKeTkOYkPQ5DFTTCZ6CrXOMT
	9vnnFZeo6fRiXU2lMIeB420ayr3nR47Jfg6Q/VoBwjU/uEXrPm/g3l65ael+RMwAUYrjeCpFwxDWB
	yQgB781Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5RlO-0000000Dc5W-06Kz;
	Thu, 17 Apr 2025 16:06:54 +0000
Received: from mail-westus2azolkn19010008.outbound.protection.outlook.com ([52.103.10.8] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5R96-0000000DVb5-3nqz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 15:27:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpfRWzQ8O+rcUmXhH0XGU3bhrFVYFBw7W9Z8U+ezAPpGbFuhO12lm8UCpwWfXX45RXskLMVo6CG5kw+enFIIyZBX64ACtoNVrXj8JVhFc8ySdrD5OrEOsnakqB6PXfYcryQY9jjMWSom8g4eaBnoThcXuT+jAsshI2gVlzt2W61i+cjO948FHBq46Qp3Ly6JaH5HDVjN+4MXgvbprIV6oWYzVVTEzuGwz1c+fob9VRYjIZAbJ2tEH8krDx3WeLvEOirrMJOaWHG33cNMNRtVcuBuWaqsII5ZTnepYcdEgUHDASA9Oj56MEimB3CmCJaRKguESimKTrDy9Odwbz48wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2bHLIVBCPY0YMH8B71mwnJJLoiNa2RLhW0FwbYoi9Fc=;
 b=TO+9KKj2FCoc1ybMXB4sQdWtxCzIYiMvL1GBtsfgZe5h4aaaDfDz7wZPLEep5sG9U95TaCzMLhaHJ3kA3fFCB918tLefDzsxGID7HI2PPDSlWNhFcDoOm+luH29VdmLy04UFbqEQMHDSz3V4Z32t34hSlwAI50OAXUm3LktZkcesaxXTzy8AomQdT+Ow4O9BLQgw6nIyZPw4VD419tz3+5yy2BF+MJhfdxODsELw+cC4JG9xFK/kqi89nxyMXve6w5UoqHpCGjBgFtjy4mQ05yIpO5j/7Gwd5nTPya0gAWpI0blqmpZ/GrHifR7MraAYYvG59/8bRh64Ggu+jBr4DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2bHLIVBCPY0YMH8B71mwnJJLoiNa2RLhW0FwbYoi9Fc=;
 b=CJZi2hd06dLIX6Co2Q9ce9FvQk/MPSJydh4yY3xIi9yrmfSYM7ezdWcSVLAygwPKvQgNaPzXnFCGw5TOMbyPCnckeDJv/QzJyOhqyMaVng98F+2jPkKssgGv60tFeaR1P+IIAxwpY9u9aOorru2fU0lnJlAtb+nmMled9xE/3Npm8LOZ9soNGIfwUUDYnXOQk5lizdGIveJdDdw2MKGT4nmvRZdiJbxltWhxIoDT2igbsI/LLVt0JUgpNF6l8v27joxK3hv0Dlou7iCg4HauOPhkuz5YH4+HcMWnKQCNObK/MjvkjOUnkIz0RA37Q6reJFaiQ+Pz+WlekiQGb+ay9A==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CH2PR02MB6919.namprd02.prod.outlook.com (2603:10b6:610:82::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.43; Thu, 17 Apr
 2025 15:27:14 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%5]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 15:27:14 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Roman Kisel <romank@linux.microsoft.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "bp@alien8.de" <bp@alien8.de>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"decui@microsoft.com" <decui@microsoft.com>, "haiyangz@microsoft.com"
	<haiyangz@microsoft.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "kw@linux.com" <kw@linux.com>, "kys@microsoft.com"
	<kys@microsoft.com>, "lenb@kernel.org" <lenb@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>, "maz@kernel.org"
	<maz@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "rafael@kernel.org"
	<rafael@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>,
	"ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>, "suzuki.poulose@arm.com"
	<suzuki.poulose@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>, "will@kernel.org"
	<will@kernel.org>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
CC: "apais@microsoft.com" <apais@microsoft.com>, "benhill@microsoft.com"
	<benhill@microsoft.com>, "bperkins@microsoft.com" <bperkins@microsoft.com>,
	"sunilmut@microsoft.com" <sunilmut@microsoft.com>
Subject: RE: [PATCH hyperv-next v8 01/11] arm64: kvm, smccc: Introduce and use
 API for getting hypervisor UUID
Thread-Topic: [PATCH hyperv-next v8 01/11] arm64: kvm, smccc: Introduce and
 use API for getting hypervisor UUID
Thread-Index: AQHbrY9+kt/SfeyHgkimGtmc6aRAS7On8gyQ
Date: Thu, 17 Apr 2025 15:27:14 +0000
Message-ID: <SN6PR02MB4157CAFEBDE5317F176F1FCAD4BC2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250414224713.1866095-1-romank@linux.microsoft.com>
 <20250414224713.1866095-2-romank@linux.microsoft.com>
In-Reply-To: <20250414224713.1866095-2-romank@linux.microsoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CH2PR02MB6919:EE_
x-ms-office365-filtering-correlation-id: 813d1c23-24e1-4d0e-711f-08dd7dc454da
x-microsoft-antispam: BCL:0;ARA:14566002|8060799006|8062599003|461199028|15080799006|19110799003|102099032|3412199025|440099028;
x-microsoft-antispam-message-info: =?us-ascii?Q?opINBDO+eyD0OR1BfS1VfjES49a0PEm/cVC1oDb17F4B8FhwLiRndFHB+VZq?=
 =?us-ascii?Q?5WQUHAqjn1GSuLVOu/MnD/Q7s1teSuvMdg/+e7i4mOO3uvFyTHVNguOiqRJe?=
 =?us-ascii?Q?Shs67U9UB1O2tzpGXhlM+e6ModQyRMbkiD0IVlCAnv4Unwl9BS6COo2SxSm3?=
 =?us-ascii?Q?JA4/kK7L00U0iUPLHBgnTVc9IuQBUtiTpIY9/w2boXao9Fg/GlAuUpyEBcx5?=
 =?us-ascii?Q?udJh4rvO4Up2QBIX/s5bmqoBpaa5hIAVLec2GiDF9cyZsseezjSSZ/NwTmxw?=
 =?us-ascii?Q?V9qMhU3jXxW4wVmws3p4Uzn6/EmHXyEe+84jT4HmLD82ghqAUAlY82FHPuC9?=
 =?us-ascii?Q?4sTv8gXDUAPE8Vra2O5O07aUIEhDxR76142Xr67KAX8n0PCA52VaYe3U4CWX?=
 =?us-ascii?Q?L+Edmc0qgaIcVx4bNM/73nK+02oi6og8RtFcAxbBbDqR/g+/dwtxta+G1Cn1?=
 =?us-ascii?Q?Gwrc8zoaESRa7nf49oRQ5S0pFEHutRCuQZB6ZvcUJRm3v9PEtIM82T2aLtUj?=
 =?us-ascii?Q?fuyyCMzym/TGTkMbTnmvLlxR3jv1Z/5oJc2KrbIbVW0NNh6YuR+lTc2t7Hsf?=
 =?us-ascii?Q?O1WVXtpts/fnp2w5zqEPXmI+DU6rzXTrp+GBIbUKPXMSvaEqAm0C8jg+WOsj?=
 =?us-ascii?Q?Y+yd9BeDZwxKnW2TsZrKCDC3/Ur8D3ZFlGs897B8xMUamf7zpbtWsmAdwfBV?=
 =?us-ascii?Q?l88KhgCaKt9tla9a1at9KNo4hEMwQUvNygCTX7/8NslAyqnvukv/m24gqn1C?=
 =?us-ascii?Q?4gHRXwAiPEr5Hq3RErDFUw6V8o6ffJKtexhWXonuNRDNoACIOJL78/1SaPJd?=
 =?us-ascii?Q?u8qXkDsa+BLPz1EE04ohLk7zYMIvFM0+XH3DFAEleunk9VlpTeRdfopn6Fvd?=
 =?us-ascii?Q?vTZOIWY5arQaLHBVF4JWLhpUGg4tZ9gVpAFHsSdrxVh4JHlNK0LjCqjcM77X?=
 =?us-ascii?Q?nRoUf+5ZRlrk2i14FBYqDP0feim5zcdbaCZgylRgzJLhGTaemD4RarqyKfwq?=
 =?us-ascii?Q?1KtyuFL14gA2SKZ2DvpcUxtaha7nEiGVxAh2JlKxhT2Dlm35FMIZJpz/Xdk4?=
 =?us-ascii?Q?5Msr21lEKQj5GvDxCchYcC6rtdFGYw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iC64XoBQR4PDN5+8wO+W+SdkoVd2VEzxYJeUgYe7kJhmLMTxq1lFHZgoqO+J?=
 =?us-ascii?Q?lqWJXci58+0jjMTgLF/if9X/pr2VkaoKGlV0JsnlXbAmy9jV0jcePE72oom6?=
 =?us-ascii?Q?H91aNu682Q1NPvTc+LvqEZUnJ5hW/sXop/PVixvDswmy1vreJoUZHluMI8s6?=
 =?us-ascii?Q?jvRau6SEvDrmV9CZQGY5nRhl45YpVWfpt1ZZn2J3t1hebVEp+vZ/jyhQ87wa?=
 =?us-ascii?Q?v5Hxq6H/VazUMoJTm43pGVL+4NlDycFifuGf7Py74BlRhnrfrT5bRcxGlp19?=
 =?us-ascii?Q?igDDRkwmNOwO2I5KMoaYDcmEdXxWNyTZgCd9jOjCHzqIZU/LZl3x8LkIBsHc?=
 =?us-ascii?Q?VV6O/KHIogLMxQ8mEWEL2dXSLuhat2fsatQ/pKdrOdyxGhp8TVvECR3KcFmW?=
 =?us-ascii?Q?rP4PRLyn1u/GC0etLMzUcIrDJHygFgU7SArDkAPQPx/XYLankXd8n5dZ9snu?=
 =?us-ascii?Q?dxWy4JJbkw2tR+RPHWxAj/oL9MR5EnFC9DZRrF4JvRYI7Mol2uiaGt3wFsKt?=
 =?us-ascii?Q?u1X3jsJ2aI9Os9sCvKOPvLxv+ammO4F58D73DrlWVpnkfIzEzZSqTsJ9mTtf?=
 =?us-ascii?Q?8R5VRCJJ8jj7hsrO9dilBlvamPE4D6c56M+7TH6a0USgrwWPVkJy+p5Zcek4?=
 =?us-ascii?Q?9tq2f7wwyx6YjDh5ku+Bue5K6scgD6803C8PbzowH68gJ1OeUlj2Up/HJAP2?=
 =?us-ascii?Q?fdEag1Nd1DWoUScni/kIjZqRv44FlzfCioFjmtBplC8wgMjGkvYQKSUupEnB?=
 =?us-ascii?Q?/ZyiFHonr0WEpU6AX/1X6J6fqwjSUWkG/T/zDoQQllq5Lvrvm9PsTTbIjjqV?=
 =?us-ascii?Q?H+TVBPNsFttrshhLMGkze+IEuWKlc8uEOr3KSanz7Galr+tFdL5PPFfs8AxA?=
 =?us-ascii?Q?sfYA7p2tqeLACCyAGRexLJ4dWUTKdYbhY40n0noPJmHFZfk7VCIooCeMpSGI?=
 =?us-ascii?Q?/vQqANltdoX1udpb+UIG9hjUGq+qyfoI63wa9UQbFtfOkcl58nmQmMB0Xctx?=
 =?us-ascii?Q?feVEBeYsN0V1hDGByru7k3hMGEn84cGOVEcGKlczrj/80N/28GvnpeYf5mBp?=
 =?us-ascii?Q?+neVZxkSF+bztD7bZyrag6Nr5dXXke+cdTtHsTX4sFrvIoCa5ww8ZdB4J3GO?=
 =?us-ascii?Q?0znNUaw1lBNSzT+ItmBG25QbG/EH46kTLhs7lJMMt0B2TrTIS3IUZDshDtw9?=
 =?us-ascii?Q?3I/I40Te7nm6BUEc2tr08Hy98T2p5w7WY6QgeoMQHR4pyywC4cyXOvl9HHA?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 813d1c23-24e1-4d0e-711f-08dd7dc454da
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 15:27:14.6742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6919
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_082720_958995_A03154D3 
X-CRM114-Status: GOOD (  10.39  )
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

From: Roman Kisel <romank@linux.microsoft.com> Sent: Monday, April 14, 2025=
 3:47 PM
>=20
> The KVM/arm64 uses SMCCC to detect hypervisor presence. That code is
> private, and it follows the SMCCC specification. Other existing and
> emerging hypervisor guest implementations can and should use that
> standard approach as well.
>=20
> Factor out a common infrastructure that the guests can use, update KVM
> to employ the new API. The central notion of the SMCCC method is the
> UUID of the hypervisor, and the new API follows that.
>=20
> No functional changes. Validated with a KVM/arm64 guest.
>=20
> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
> ---
>  arch/arm64/kvm/hypercalls.c        | 10 +++--
>  drivers/firmware/smccc/kvm_guest.c | 10 +----
>  drivers/firmware/smccc/smccc.c     | 17 ++++++++
>  include/linux/arm-smccc.h          | 64 ++++++++++++++++++++++++++++--
>  4 files changed, 85 insertions(+), 16 deletions(-)
>=20

Reviewed-by: Michael Kelley <mhklinux@outlook.com>

