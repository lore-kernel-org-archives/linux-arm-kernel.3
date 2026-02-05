Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E8DE91269
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 06:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoC5rLRPWJhanhjUYwTLmx/S6PUr/oqw52K4SXjy3eI=; b=zyw7sn3vPF4QrSzzFa1IBBLN8C
	IVFa5adIM40MqzTVvSzU17UXhNR1Rbd2mntrVMgVOMOoWcVd0VWMPow1j71VhoAFY/bx6Hws4h/gH
	EXTkHehfYqVD/M7OTOc4iiS0pY85qRnAuiIn1XL2k6Mx3EN69UifjC/pFbKHDHM0zHApCaMWkT+/z
	kNTxkdvjZtVK0ND/JBkX8nK9+kvcrzziW5i50kL1tl5eKfYG5RAM161ZT9Y+9oTb0Qrkynjg+w2VJ
	+A1VEdy91BD7gWlXVeSk6XgsQIFkT05biRRJF+YXt20YSXHHRNrOF1nR20FVNu9hGt6VDgNDoL1Oq
	lToHUgpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnso3-00000009Vqt-1Zft;
	Thu, 05 Feb 2026 06:25:35 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnsnz-00000009Vpt-160q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 06:25:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3SQaEDrpKSge9C8s2oTo+WKIssm4OJC5jULiiOF/s4orlnrkyTcJfTsIAD52wGsMMImX4xWa2yNaoX4vUuLyTKUXr+YECw5fcl3bBLVFqs0nvfFdfqqFOh1acBw7bwAZi3gxlY5VGEcPSKo2cZgIcZrc4+lf3bXI1i1iKoanaukaWFKk7q2k15aXQZ9V1Nv3AdNrJ8Lj9P8R2KkN+wwdUt3qGPnmz9t4hEF575AVnexcgIzk5FhtLsSqpI3IXepfnrtW253rnIhhPX69xbfTB31sNzUxtNyFmRceM5bjpVxVXW+pwU9yeD+fMD8dWQCHOuVdXl16oecdPaFp88BnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FoC5rLRPWJhanhjUYwTLmx/S6PUr/oqw52K4SXjy3eI=;
 b=rW2w8yyWhI8cO9KgfumyofPJGDS2z6EUMy5TMez0EoETppL02AowgBeXfkEgl+g3XzqL2uNsdHDgrTRrbQOSlS/eKFzPFg2CppJocRCx0xrd+i2uCXEDDWrbHaDILuiwYbKQ9qHnq6lJQrVtPYqcA8WX8mA8T7QrozC5THW3ilj4S2w1J2AkSe1eBKOs4gkWVMNP6Gl1+VkAJm3nd+GMf5fhy+EvazSEmvLuQk27hMY9X6Y6g8eHq8WtikV+eCNRG3Dzi9D0ss0waGhnrFLXsDplXYkWHMv6O43K+7pRR5kphaw1ZZ1OVHY6mNEukbcB3z+UVX4NwtRXYqWJNA9quA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoC5rLRPWJhanhjUYwTLmx/S6PUr/oqw52K4SXjy3eI=;
 b=NqWTbr8Cxgni7CRt4tZBYieE3J6kHGT+C4aOv/ySnwJ8WsDdJ67Cb2ZIhlYg6Mc2AABpkaClRdOdnqGXHs5H04IvXrXDag+iGSXL8XWmzn1r+XT1aKKpFE9WnFHhCmdoMRQf2V2cAEPyuQWI7A0EMbV54x2fNQ/U7jSjn/yDau70uplvqTAudGUnO8Fb1cSU5GM6JCcchapmA/wskguHf2z0UyumULhELgOn0w5wrX1fJ2BvfTHjsXYZ0VCvgLyruV9ZwWr3J4BrsMJiT+oTxG4Dzn9BaVLLTjgHki8v7aZMU8EM+gvivtOIl+WVw7oa8oG9B0Z41InhxYwktf33Lg==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by VI0PR04MB11503.eurprd04.prod.outlook.com
 (2603:10a6:800:2c7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 06:25:25 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 06:25:25 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 1/3] arm64: dts: imx8mp-evk: Enable pull select bit for
 PCIe regulator GPIO (M.2 W_DISABLE1)
Thread-Topic: [PATCH 1/3] arm64: dts: imx8mp-evk: Enable pull select bit for
 PCIe regulator GPIO (M.2 W_DISABLE1)
Thread-Index: AQHclX5TMKi/C8lhqUKsNZ7S+GenfLVyq+GAgAD5ZEA=
Date: Thu, 5 Feb 2026 06:25:25 +0000
Message-ID: <VI0PR04MB121140E20877D9673D20CF3679299A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260204023204.2382433-1-sherry.sun@nxp.com>
 <20260204023204.2382433-2-sherry.sun@nxp.com>
 <aYNmfX8MlT8EDVgq@lizhi-Precision-Tower-5810>
In-Reply-To: <aYNmfX8MlT8EDVgq@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|VI0PR04MB11503:EE_
x-ms-office365-filtering-correlation-id: 3cb42a29-889e-4929-630a-08de647f5970
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?ZPXJy+NvMovDtosx9/K8jfFVNosklxkvyKBxVtXGzHD5c4Ubvo0785uxicfs?=
 =?us-ascii?Q?/O47nq3iMwwJRBFtz4ELHSB5Dn4/8spFQznEa9twqq0oQj8ARV/IMx/70eZg?=
 =?us-ascii?Q?ujx6EptFN7RCdEx+FxXGbHKExN7zGuJwxKRULkaJKS2/xMw1fPu8sUfYzEw8?=
 =?us-ascii?Q?X9lDgNq+GcI5hKUu5cEWKRCPyfhI0OA0XbwU/FSthLtw4q2LksbpviE3sRHW?=
 =?us-ascii?Q?uPmd0ulLEzTydM7CTEiqZQyy7RPIydeX2IT8k2ckZKg4+fdx/ZuRh+m3js5q?=
 =?us-ascii?Q?Ro8Z0CVQ68CQMJHleiMMooF7tJzTIEZvEdRIvtTCYjWjeK21wihCd7fehSY3?=
 =?us-ascii?Q?F0RrXbSMa7kljSAs8/5Ds2gfHRiCM5ZxniRoX02tMsIio6Pe4ceLq8oVshhz?=
 =?us-ascii?Q?H/HZwsMmztKHXEKyxO+lqU1gDoYQkixviCZhhkisYRHhxwum4SHeD7Fj7T7C?=
 =?us-ascii?Q?QHzQ4uBG8wHdd5T0NtC4inCxv7ItrpjdVxRN2hYfSwF5bzaLD2Hz+umrgUZb?=
 =?us-ascii?Q?Mu7/z0R0A7jK/Id/vW4rtw3ntZozbr7wE63KDZ+fX4wduos0SOu7FqAl0FoF?=
 =?us-ascii?Q?jY1uPksLw/spt6EeUzlS8gNd9o3ls8aY+u5CxRpDTOPxkd1ldGzhseXNyCPw?=
 =?us-ascii?Q?nUrTPo2KR3CNWWdI8KAErDVTuq8n+bFEdJwG062YP1KCQI3mS2DLag541LS5?=
 =?us-ascii?Q?j+nKV7ZjnikpW7sUhClt/2OnaCnwP/yJLmRaVZje00v1P4ZF4GpL7vNO1YXg?=
 =?us-ascii?Q?poIKaX2N+FeQJmtcA0lNUZK2Ug+AjFWtv13M9mH1n9wZMuzIARDiWyC8gx7w?=
 =?us-ascii?Q?VkEWe8R7fFkqJvMKLeLpzcjvDNm9dk7yW9ifsa65UzJi4CdViswn9PE8spB6?=
 =?us-ascii?Q?MZWCIyaj80u5vFv9ZRRz3d87bEY8GAIZNC8QwyAMRnjOf4L9XP/RAuDvUAsQ?=
 =?us-ascii?Q?eCJi41BsyD3vTGVES77hkarDs95ERAuxcGt6UyirZB97+nBJnxsaSB6push0?=
 =?us-ascii?Q?d9wqtAl79wcq82Nm89X9ji5ZAuW4BkRFXsMfS/+ZVKyGRSUkWXld1u0EgKSr?=
 =?us-ascii?Q?rnq81wDEpo22DrgVibnu9yqXzHTSnUWKSEc3UiwedEuulwhKX4VzjhkHIbhv?=
 =?us-ascii?Q?RZSxtnz1UVlz8SGfSW54IIISGFo/dyOXr4lmNKdG+wevMC3jnfkJWj/+MmsN?=
 =?us-ascii?Q?lX8iIFWWib/x4WICGzirOESUF67lBzs+VQCqJe1Ekq0onJKA9ZuKdcAdcpTh?=
 =?us-ascii?Q?0Ra75z0WQOT7/3fn9NCQYgOZOa/QkcrMR40Cu/XBKGZ7TnCsnDsRmf8oH2ix?=
 =?us-ascii?Q?YaRxcfnUFxd8Q2hHaCqvp8Vzi+vnHaQrqi2FMQfefA/pZ5J+MSL71LUyHF1Q?=
 =?us-ascii?Q?37sd4rxEvT59A0Xx0Ta4+HNOVhUlxWle4UyGHTAQFqAoicVZlONW2u9OXdW4?=
 =?us-ascii?Q?jhe4y6jMEyZ3KTikQbKTO7W9YLbsRKQYLb6+cFJnUrYRC7UHGQceFdKaRLPj?=
 =?us-ascii?Q?hZExbq5S3hPUJodHeAax34yNv952jRWv0DyFFijNrxPSJoFE1Ln2gWxeBIkJ?=
 =?us-ascii?Q?GN0W0IhO77Bu+C0UYJXYmicMuxzgfAiTOm3zUOKkrxmu11Mn9Z6Mo+x8FY1H?=
 =?us-ascii?Q?eshSLq1mlWBjqgwqplCrQaU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OUy7haQGOMqhrct3dN91MDqaRawFvjY0ubY0h4tY3kAB+rbwReKkIoBCUz4O?=
 =?us-ascii?Q?Sg6qYDqidBUz+A2BxxODiDvIxp/Mz1N+EvYJqs2TeLC3PWeo18oIm6LPFUS4?=
 =?us-ascii?Q?3GppW/93lVoP1VgtR8KSI/GFMnwpfoJ3aM6YVIO5KKbDPV9Gztu4+MOgqeyY?=
 =?us-ascii?Q?Q3+xoBAXF96iIjXor2d+6UOCBq21xsZv9h/RvFCvbE0AsRz2YgZhaydNNnyN?=
 =?us-ascii?Q?5NDiL76PyvCqkRJh2oa6ht2SfYIw06aI7g8gXTYacKEvogy3qBPeYsEgtDFP?=
 =?us-ascii?Q?Khon4sN9XxV41Ewhnx9+QBU69rr8Iom204gbBIlWKJ9rOLSwUzol4XS8dWaL?=
 =?us-ascii?Q?Knsx0GEgz0/yY/CB+XOIHVMvoEF4XBZWdPYATDzdxqaFgHcv+3opcfeYtJsD?=
 =?us-ascii?Q?/7dC0OEPKpHUam4LMJkdozNoilGPeNeKIkZ4pjIe0PeMz0QdTfTtuXNYjGnh?=
 =?us-ascii?Q?E3ePWeN/cRX1kbdC7aIMS5Bj4S2kAOcal+QD7mZksKnsdBi2JO7gK/ewb1Tm?=
 =?us-ascii?Q?FcVdnr0ndMQlRhwtbUsn11UMq1BS9lyHKRo1c4I8fN2uxJevaSg0nWb7pTYb?=
 =?us-ascii?Q?wX+xHwxqMtJLtFZBwixhEOj5v3pjDh+MibKQuQt8d/1QmMhKjChVD6q5Hzn6?=
 =?us-ascii?Q?AoXW87DEXGUKyoGJLUB0bil2p4EaNy2jNVNuWM72gTL93hUYtVwLyqez1qBO?=
 =?us-ascii?Q?fyKp3qyBzj7wZK8pxM1a6dLr+f7bcioV9p4S1Dm4D3QduzVm0wsCW8bVvkm9?=
 =?us-ascii?Q?35hMe0Vp8mln1RIosv2YtbmKGgKhp5fvL1/TMbepZBGHt5DOBJky+guGpOIr?=
 =?us-ascii?Q?4mt/0O4ZsgfGjziO2gkB8+qa740EWneW1rTWt3WAmXQPw62IeEbrkrs/TE4b?=
 =?us-ascii?Q?NC0hbT2nTDxp37va9xK+KKNpyXNbmNM85mgV1oRZKjd+XCOyY7yaXlNmBJjd?=
 =?us-ascii?Q?K6ROeTq+Zqok+WQwsoCq9lHRHlxojccmy9TbENmQOMpOl7tSfqYzqphUzyo4?=
 =?us-ascii?Q?34r2IddFb8fFkvqVDcM1mFbF8uC4Z+QZiDn7S2bYalOx+CevjyDnzMkFWN3i?=
 =?us-ascii?Q?8AWY08uvoUynK9BOlHlL2/O0nDq2wnvlZRfuPd79Mo/oLS3yxZN71TmRFt6Y?=
 =?us-ascii?Q?PRlVWD+dLz6KI2TZYkyYGS9k9Wi5t0SFT5voF6rPjuFrxfb4MwHYNX/lS8YG?=
 =?us-ascii?Q?DhDJ8G8EkTrZiY7XbOMMA1nrQVsxWny1sRyuKrrxBBLJNNvdheLeD9EXrvFE?=
 =?us-ascii?Q?qFuY9vZMUOC1OrkEOiwgS97fIoOWOTtOA8f1Ey1GqHKr/qoPuCd7jgAbYbIo?=
 =?us-ascii?Q?tJM+LHm4lRUjD6MWXaM85wpR39Ca692OL5xzl25TI52R6sQ3TuZtD/5rM+L1?=
 =?us-ascii?Q?uJdUE+iwfx4eC7zmtDN3YF2ujH9PPvFhfI9+1neKZHccIq4W4ggmvzrta9zv?=
 =?us-ascii?Q?ESdq/EjzM0IDTXKbeEirMr5eM961ZaUsGlVlp6AWzJoi3odTfdyTnozItlav?=
 =?us-ascii?Q?uIJriWBaY83znY2VC5L4vJt9hpO/UUOpQy5Asiz8oAR2E0+2xmspWSCEwkEV?=
 =?us-ascii?Q?JfdmHqrPlzTREoz7oDFfZigo6lQYF2G5oDyQkkjAfQJuvbEfcZFMQFFxDu1K?=
 =?us-ascii?Q?zUSxE6OCVDK0B1NltBFkSi2ClU3vLGKNtQ5AQ8IFHvyWtywbBExKDbE9WJdY?=
 =?us-ascii?Q?rCLKR+FYWNGrXBHRs/MDewrKrzHRWEH4Mhw6D7MfF0nDYJnO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb42a29-889e-4929-630a-08de647f5970
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 06:25:25.6747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WUYk0oup/4uO9S7qdaJZciuSZ4ZuqgiTaJHw62VS1cp8Z2yhwpJiOsDb2qIIKY2QxX5nT5DxRHjK+a9H9MqgKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11503
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_222531_326522_A93F7B5F 
X-CRM114-Status: GOOD (  19.33  )
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

> On Wed, Feb 04, 2026 at 10:32:02AM +0800, Sherry Sun wrote:
> > The current pin configuration for
> MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06
> > sets the weak pull-up but does not enable the pull select field.
> > Bit 8 in the IOMUX register must be set in order for the weak pull-up
> > to actually take effect.
> >
> > Update the pinctrl setting from 0x40 to 0x140 to enable both the pull
> > select and the weak pull-up, ensuring the line behaves as expected.
> >
> > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > ---
>=20
> Add fixes tag

Ok. Will add in V2. Thanks!=20

Best Regards
Sherry
>=20
> Frank
> >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > index 3f9b3fab8ac3..a1269c7a6cc2 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> > @@ -1069,7 +1069,7 @@ MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07
> 	0x40
> >
> >  	pinctrl_pcie0_reg: pcie0reggrp {
> >  		fsl,pins =3D <
> > -			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x40
> > +			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06	0x140
> >  		>;
> >  	};
> >
> > --
> > 2.37.1
> >

