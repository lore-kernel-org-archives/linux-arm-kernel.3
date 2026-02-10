Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB625EA812A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 15:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6irz65NROixGacegNKv2/loo21qbVyBnO6NT8O9w3Zs=; b=TLZSme6ZXgzlS1gxoS6ogZDIRr
	vOQ1GqVyMR8F3CFqeDf/BjOkVhofXND3SROj70mDJkjlvyNFI6ZUIB2SABwvT0yegVfm3Kyl39djb
	dOoUZSXFEY+5Aba/SWc4Y1VenAVyHeSWnpDyCTlkP6lgMYZMJKhFhw3Frj3BUKW+ewK5x0yqR49V8
	fGmg/5QxpOrwRQArAE16fawDfgQAnjTqoFExboIEK47nAHPFNkf0E8gPOTMWGFed+em2q0G76opRR
	1jAtEcR5pegon5x45cTaxE0FTR4rpKNcajwWNp1oSK/OHVcjmyVismWtjOv8UbGxZ4WhW3GDpnqWA
	KZ7QOtCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vppIv-0000000H5k3-24hY;
	Tue, 10 Feb 2026 15:05:29 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vppIs-0000000H5jT-15u8;
	Tue, 10 Feb 2026 15:05:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8V1emMNDiclGBx3EE4kI8ew7VJx9WOCR4TyQ+j28TKOx0khIQ/s5DJ62jx2miNWieuovAnbNA8kLG5ICp+Dv+4iIovWpbSaz2q76YQo3ha3Rl41ka8I3lrfswzurnwu5VKfM3tPj0GMP4Gd19u6hVApH1AiWWrbBLTCN9YigHoWM2V7Tlqi5+S/VRfYnEwRzHau59k89/FWzA1vDXNE2AJRRP8tSOi3aVCn01I7pDE7rkbKqlBKrDXHf44wpgmdguEZZGQbJXD+ckZej4op8OLrqm1qhEFKq3nM7DIAZjdHqUiGhrSY/uDAVJJH+M2HPbDIMvC7KV9QuHJgoX7vPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6irz65NROixGacegNKv2/loo21qbVyBnO6NT8O9w3Zs=;
 b=wCsehzJGqxqRitDO1Q0RoBlD2Mry5TCt6zzIrF9J9yFfem0KXYUL88rDjcmxhUtu/ZoGRlvfW0w2NzCCuGMWNK9Rwb8iwM67NDzSG4D/d50obHhePSeKTbN/RrnwA4iS1aPA8NJ9EGbvAAaX+Du7Ngn8NgrFEUV1/Jxub3MdQRzb3l8e9Irn07idJXr99anoVCYoWLBg4nbkUo+YsWMli9cg2XtkNeHkM3cN+v7+gyihw0ZvP2B9eN+xOMbpdkVGzkIDb33oLHlgwTCysKm6TGu2qLCO9aYlR5m4/6PN9fvQGj4I84QTERSQxmylXXT9RE4sid2ye147o8PPVjXWbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6irz65NROixGacegNKv2/loo21qbVyBnO6NT8O9w3Zs=;
 b=B5Jnd4eL78jO42IurAKPgs1I/byD+iWHT/a/ufgB6a+SZkEc6VQapfT6ajUiCKEQYABfr4uZq9SEb3fQoRh1dXPSQ+IOXSWcNza3+kf4k1loYWnUqFMbIwr7hS3Z2+BRvAVN7wAZ8o3DWcr3GMnkWhzMc7sEWSmbQh1iPJGYO9k=
Received: from CY1PR12MB9697.namprd12.prod.outlook.com (2603:10b6:930:107::6)
 by DS0PR12MB9057.namprd12.prod.outlook.com (2603:10b6:8:c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 15:05:14 +0000
Received: from CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d]) by CY1PR12MB9697.namprd12.prod.outlook.com
 ([fe80::3a41:55a0:8203:596d%4]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 15:05:14 +0000
From: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
To: Sean Anderson <sean.anderson@linux.dev>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Vinod Koul <vkoul@kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>
CC: =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Rob
 Herring <robh@kernel.org>, "Havalige, Thippeswamy"
	<thippeswamy.havalige@amd.com>, Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: RE: [PATCH 3/8] phy: zynqmp: Refactor common phy initialization into
 a helper
Thread-Topic: [PATCH 3/8] phy: zynqmp: Refactor common phy initialization into
 a helper
Thread-Index: AQHclKMbw40ypRlA80CNaCsCEo0LZ7V8E+wQ
Date: Tue, 10 Feb 2026 15:05:14 +0000
Message-ID: <CY1PR12MB96974242D65E9B174AB97D90B762A@CY1PR12MB9697.namprd12.prod.outlook.com>
References: <20260203002128.935842-1-sean.anderson@linux.dev>
 <20260203002128.935842-4-sean.anderson@linux.dev>
In-Reply-To: <20260203002128.935842-4-sean.anderson@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-02-10T15:05:05.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY1PR12MB9697:EE_|DS0PR12MB9057:EE_
x-ms-office365-filtering-correlation-id: 73da15a8-9505-4281-e98b-08de68b5cb99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?jxj3sFzCzbaXWorCaCBHFew93YPncm0gc4JqTfngTjU6zFlz27r4+y1HRH?=
 =?iso-8859-2?Q?wKSH1kmgeLlVtnPVLlDPat/QrFczFvK/YKKBaHvobkfc0MGXXENsOoEDql?=
 =?iso-8859-2?Q?Vlis/Q1RrVhJi24whe7jsBAqW/eUA0d0ZzfwHZHzoLiOMRab2G16O3cPLE?=
 =?iso-8859-2?Q?xtlc9wR+0r4qi4uJI2XkPQHXT1gZ/2hzAISKYQxVtBLogMwPKLg57Wx0cI?=
 =?iso-8859-2?Q?WoSOfk8Ld6H5aEIe0cnwOlUcmzXarIUpJhe6ze+uLL81/la4+OdjV2a90a?=
 =?iso-8859-2?Q?uNQpxm5OxH3UxbZbmvw7C28xJjxoJXnNvrokXwDTVfIFKww8OAHu0oTrLN?=
 =?iso-8859-2?Q?yCJ5Vn7EdUYUXWEuF8eAIokzy6H7y69tFy0Bw/tOCRzO3UWwKQ+f/fjw+A?=
 =?iso-8859-2?Q?9t3tKWpT68M7j6QeZA0OC//LixGcy2VdENrB3ZiVQPighkNj7gIppcLsYI?=
 =?iso-8859-2?Q?zD/JsKQ2cl0GbfDZ66EJFM0lsaCdNQJ3EWWloNMOdltMtxxGDtIepfvdEy?=
 =?iso-8859-2?Q?CPmQMxiDudgvlbYa4NNDhSKXk5gAG8FMhQObx2c7CBA4AVczYqfS7LYGdw?=
 =?iso-8859-2?Q?EhpRa6ZSnt/sCnnVI1P+Yw/fPxMytWrXDeUdzDgicQ08ii5afkGtK6GV4C?=
 =?iso-8859-2?Q?MUMgfXaWvgJt2+/APhQxm+DMSMsKSQtFAU+fESV6uy6Ypzwqhh5wq1zZ4v?=
 =?iso-8859-2?Q?TLBXzR1aeMCpZW3GX8vAkKBzT/XlIRr3AuruNLCG+RZPsuqqLOiI4gVRTB?=
 =?iso-8859-2?Q?Pw2fbjzBNY6tgYpOK4oTE0NY20xyOPtJjgpqe+3q+/s9M2PL5q2Au5A/7G?=
 =?iso-8859-2?Q?e/bDlh6w1Z+qE/EgQ27JRyIbOub8k1JW7yZr4fhik1UyP6mplGAYpf3qmz?=
 =?iso-8859-2?Q?kNpU/N4ia4x2KKvEqwnFbzIOg73bF/XjMFZ/CrYStdthEPdOLY93dmaEmT?=
 =?iso-8859-2?Q?6ixG6ORyDBoPF689wS+c1z1WXxM8YJvJ+qutEMZ0mKCXTdtWUEEvyLTK8V?=
 =?iso-8859-2?Q?YQxImEXotJGMROLiHVZs9vuw5VQy2Kt3HXImCXqHVYbJeSJ4ATg9MS7tm/?=
 =?iso-8859-2?Q?NS3dr+YBfQW/5OIpnqftfsqrMTTu1asi2INIsikDok2lga+FIElCLurCEy?=
 =?iso-8859-2?Q?HqPWd+hOr5c0xncODRwjDGNTKituPUhmsdyjqmw0isZP6EBvMwSQJcjja+?=
 =?iso-8859-2?Q?mhVTu6Aia2fiQ8CB+j/j+BRFb3RCzrA5SoMdjbPc2nl0UZO28/1DFGfxBX?=
 =?iso-8859-2?Q?SZBeMug0tXaR9kbfF3eGSHOtf7LPQ27TedDh6sdS/ds3v1ORRw54k+iHY9?=
 =?iso-8859-2?Q?zIUJFnB83xzyDZ+Ee8hkAQh8A5XsP/CBhaYlMy6oPAL3y0xNG+HNN0ckx0?=
 =?iso-8859-2?Q?Gz1uSVUTddOo8Ha5H8hiRuD/T1W8NZ0QAKz/xleE2D1TQZGsBnG31VUckE?=
 =?iso-8859-2?Q?1YfoQFQDxbl/77Rz5rIzk0BcOkt+FAkh82TI/ak1UdR9B9SkspFc6tisX5?=
 =?iso-8859-2?Q?xBNLrqtPysq2Z3Bk8IaK2LLwIHBy/hCHHWCwEiA6R626sSwnKskZs/iGy7?=
 =?iso-8859-2?Q?sC9UHYDza/kjl43XUs0IVn6lCQLhztIB2U4c5LJ1rpGnH3iKdHYIJIT93k?=
 =?iso-8859-2?Q?vFu8URGjEFUI7bIBMVXJ8TzVYsqMUn7DOJ+Z9msK4iGghugW0VrpIG/IOb?=
 =?iso-8859-2?Q?ziOmZzgfcUuSuUMMdS8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY1PR12MB9697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?FH2rc28avQuakGBWRKuY6/NLgp5FYC3DxL75EVXokb+tQO3oamd64XDznY?=
 =?iso-8859-2?Q?GBJWkYObKcpsg9OJ1dsmDs3+zAXbL/LiTd/KISeMzlKpKuq0KA0P2hNXix?=
 =?iso-8859-2?Q?1MGYAfH3RKs4m0B3z9U1Zhf25GZB+65GoWUwMmLSziXpbbAvlIFPbVWgyc?=
 =?iso-8859-2?Q?cnieYo+dfRzpbgl/x9yjr3wto7zq3Kuj9NtLj/kuYU1KT/1zFMWQxnL3Yg?=
 =?iso-8859-2?Q?0eME8kgWbOWrXiZTx/tjlHWF2Mb/vuGQ/b295fdTYK9m/lkDU8PjE5dxe3?=
 =?iso-8859-2?Q?nLNj4K7ygIu72T8nl5LefCJimRiepfZkn38AIVtwPupvE7OklRQDB4GwAD?=
 =?iso-8859-2?Q?36Fsfar7gSGoGaxnaAMRpy0XJ/lOEF1Ns2XPfoI69XoNqUoUdyjbcKWJ4I?=
 =?iso-8859-2?Q?d9hFWEUeZSmaYoWylyIstjfaF/SZQSHmexWu0Tl39p2Ua/XZcltpNnNj01?=
 =?iso-8859-2?Q?M0rUoEfTJbNlByd1RiIz3BxzFeJZOrZ/r+Cfw4YI7WmSJ02VyDeQkQmbQd?=
 =?iso-8859-2?Q?m1S06Y6K6NpqBmfjqzc7a3OMVihUgxTt+Dp9LQe7mQ1DwZtTgmYTGUxbrY?=
 =?iso-8859-2?Q?kRUx8vt7obj42b5H0M3UrKRrb5n8EZT1m+xY2cwfoUi1Iq33dtUw8Khdun?=
 =?iso-8859-2?Q?BgF1aMmHrSCJsClEx06xoavRs+VHIcf5mELWGkb/h0T2ncBPIjfTsj7eAE?=
 =?iso-8859-2?Q?stGE4/a8rArwpV7/gtjup5jpWzYvc7TymRhNEMcUCYTYXwkVe5VGBIoSHT?=
 =?iso-8859-2?Q?X1PoucN2VzMFq1lEm0lTHVAxbIH+7uCtAqVbaW+4CwywR/4kcUECX0HDfO?=
 =?iso-8859-2?Q?cVEtaMo0x4WrkDsIY2x3QFiqPM0kUqhdBpB5OhRGmDSyiC2ikrr5BPEx/F?=
 =?iso-8859-2?Q?MPw1nCVrbmgCD4ezmiPhQiJbyhmzKrsYwP6JJuqjyIBpl0WwdYLGVRtz4/?=
 =?iso-8859-2?Q?lQ3tVy3bdVDor5ufH3lhy1fXrNLFWlDC5b97XVdmoS4fl+vUvT5phVeyLC?=
 =?iso-8859-2?Q?0GAJfPDRq0KLAfIgQcT5SHBjRf+u1Kj2lnLZj5z1Gjfyrn0PSm30Ci30g2?=
 =?iso-8859-2?Q?kntwJRZ5GI38D16T0keKxUuxQtmVduHz/km4rNhAq4A4PlwIIUnmEzY/b+?=
 =?iso-8859-2?Q?ffRQpirJJWo3aGLPJYNk0DiyscMtVxeHBc+x0mEj6VwmuXSIIubMyn/kAC?=
 =?iso-8859-2?Q?bJkE1tgWznARxNrL5enNeiFToz/38TdZnEe8cV6TH7IxYlL7fK3NBvQS33?=
 =?iso-8859-2?Q?lVl65pM5G5EIopbJf2VMpZsIgoK9LGCD9uwYW5DpUadeFfg8FCEhkirix3?=
 =?iso-8859-2?Q?f1unOahtMziF533L28kiwmQYuNFcZZl3vglikoJZudBv7KXhSW3OmcfJRz?=
 =?iso-8859-2?Q?xb0t3EBClSuvRFwl6a/A5Fias/NetAGWw1rwktzCPp70ikCMpGAeRngiqd?=
 =?iso-8859-2?Q?6SbFOWRIwdVkpuwjyk6DhKz2xDfyKosSQ5msrBBPvVPF2Re/RASe1gq4Jq?=
 =?iso-8859-2?Q?ciY6UHfhdz8JByQDgfq5BipK4K13YHcWcAwRC8xuqfD8IU6+qNctRTT3ia?=
 =?iso-8859-2?Q?ud6ta0RsBhilPa4Ok0mvhYzONNGxX1gZcGQszotdiq+t8Sd1GZpxskrrTk?=
 =?iso-8859-2?Q?iHVRQrf7dLlwn8GpWbQsqnzcXUVnw45c9CO3DiypxhybBekxk9p9319bCm?=
 =?iso-8859-2?Q?s6UPwgyhU9GyzL7hp6EHg0EdqOnLaKKxz9qluqPF4vYUa39aUqqiOibexc?=
 =?iso-8859-2?Q?P/VV8SdXxNxjrdHn675aIN26f5PJWqDZ8bVD5ajcJNbRA7?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY1PR12MB9697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73da15a8-9505-4281-e98b-08de68b5cb99
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 15:05:14.6889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAFG7P7GekBCt+54QakA0AggfKSFwxc/pQDN8eQr8ubOEOIgVrOCc62Tn0sNjV47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_070526_304713_9F8E8A28 
X-CRM114-Status: GOOD (  16.75  )
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

> -----Original Message-----
> From: Sean Anderson <sean.anderson@linux.dev>
> Sent: Tuesday, February 3, 2026 5:51 AM
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Vinod Koul
> <vkoul@kernel.org>; linux-phy@lists.infradead.org
> Cc: Krzysztof Wilczy=F1ski <kwilczynski@kernel.org>; Lorenzo Pieralisi
> <lpieralisi@kernel.org>; Pandey, Radhey Shyam
> <radhey.shyam.pandey@amd.com>; linux-kernel@vger.kernel.org; Simek, Micha=
l
> <michal.simek@amd.com>; linux-arm-kernel@lists.infradead.org; linux-
> pci@vger.kernel.org; Neil Armstrong <neil.armstrong@linaro.org>; Rob Herr=
ing
> <robh@kernel.org>; Havalige, Thippeswamy <thippeswamy.havalige@amd.com>;
> Manivannan Sadhasivam <mani@kernel.org>; Bjorn Helgaas
> <bhelgaas@google.com>; Sean Anderson <sean.anderson@linux.dev>
> Subject: [PATCH 3/8] phy: zynqmp: Refactor common phy initialization into=
 a helper
>
> All lanes undergoing ILL calibration must be initialized. Split off
> common phy initialization into a helper so that we can ensure all lanes
> are initialized before performing calibration.
>
> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!
> ---
>
>  drivers/phy/xilinx/phy-zynqmp.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/phy/xilinx/phy-zynqmp.c b/drivers/phy/xilinx/phy-zyn=
qmp.c
> index 0d3c578d0f3f..152af1702bbd 100644
> --- a/drivers/phy/xilinx/phy-zynqmp.c
> +++ b/drivers/phy/xilinx/phy-zynqmp.c
> @@ -520,6 +520,21 @@ static void xpsgtr_bypass_scrambler_8b10b(struct
> xpsgtr_phy *gtr_phy)
>       xpsgtr_write_phy(gtr_phy, L0_TX_DIG_61,
> L0_TM_DISABLE_SCRAMBLE_ENCODER);
>  }
>
> +static int xpsgtr_common_init(struct xpsgtr_phy *gtr_phy)
> +{
> +     int ret;
> +
> +     /* Enable coarse code saturation limiting logic. */
> +     xpsgtr_write_phy(gtr_phy, L0_TM_PLL_DIG_37,
> L0_TM_COARSE_CODE_LIMIT);
> +
> +     ret =3D xpsgtr_configure_pll(gtr_phy);
> +     if (ret)
> +             return ret;
> +
> +     xpsgtr_lane_set_protocol(gtr_phy);
> +     return 0;
> +}
> +
>  /* DP-specific initialization. */
>  static void xpsgtr_phy_init_dp(struct xpsgtr_phy *gtr_phy)
>  {
> @@ -682,19 +697,14 @@ static int xpsgtr_phy_init(struct phy *phy)
>               gtr_dev->tx_term_fix =3D false;
>       }
>
> -     /* Enable coarse code saturation limiting logic. */
> -     xpsgtr_write_phy(gtr_phy, L0_TM_PLL_DIG_37,
> L0_TM_COARSE_CODE_LIMIT);
> -
>       /*
>        * Configure the PLL, the lane protocol, and perform protocol-speci=
fic
>        * initialization.
>        */
> -     ret =3D xpsgtr_configure_pll(gtr_phy);
> +     ret =3D xpsgtr_common_init(gtr_phy);
>       if (ret)
>               goto out;
>
> -     xpsgtr_lane_set_protocol(gtr_phy);
> -
>       switch (gtr_phy->protocol) {
>       case ICM_PROTOCOL_DP:
>               xpsgtr_phy_init_dp(gtr_phy);
> --
> 2.35.1.1320.gc452695387.dirty


