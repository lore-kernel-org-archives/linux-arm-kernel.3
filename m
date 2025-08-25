Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42BECA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 06:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMWBjFRNg5F/lJrEjJS14m1QZOY16mfomaMxh2DrKIg=; b=b1hLHuHRCwC66ywJzLAUpsN1PA
	vVPZ7S05sxp7E7D8Lq6cx4z2tFxDvh5P4I9yaWG9lhKOJ0VXfDCO1vF8bY/0HUnWHkZkv4/hcaxjf
	LsWBINEE/niRskTXxI8ZE+qkfeCE/cCFPyaDq5e6MgTVgDU4Ys5OqfMaihaddfKNdWKEju1005X06
	0bRFONnI0OBF7urVqpgJZLtVecP2VHwAVpV97BF1CAW7afnOE5OkUSnmLPBY3FMEsX8acXusETn+q
	2TwM91WbBa5HlF6VwPI4z5aiYirjljJwSklbnDOMRmIdx14KyC+NO3ACIYntHbPxRp0RXRBbD1d7F
	o0888Fuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQoY-000000072xS-1Q0s;
	Mon, 25 Aug 2025 06:36:22 +0000
Received: from mail-mw2nam10on2060e.outbound.protection.outlook.com ([2a01:111:f403:2412::60e] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQl0-000000072np-0fhf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 06:32:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgKcyb32q4nARNKtDJAc78q0GrDcvBdOPrRmQ1J/pC0O69mGCqzhkZyau9KHCRIsMbJk3yfOBpX94bWBSKA43/Pf2rVScyYwEl/tzOXGKC74hUtxqZxGtf9xO14iMAu6NKdCLDzGbTkWn9AtFR8AyzUiZ6k0UpVHYjyahkrCbMbGTbRYIY7cK1PfqRs0R8C7xnZP7IrrRtV01+nh4SO7ucB2hl/nArTXX9Syvr7RZ9BTqd5xSai43xxaxiXqW2HjHZbGRJxf4wFxAauU0KzCEZQNM4/7H7IEwcMm40OJmHYXOl/7zJESnI74BXtvRI3MHyHwskCqibVJy4fABsXJ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMWBjFRNg5F/lJrEjJS14m1QZOY16mfomaMxh2DrKIg=;
 b=uPb66VQx2hlFuyIZTQQBnOZpBhFgQqzQquZrmjVgLKmSpWsi5LnMFhvWLlouXh4uqq8jTaKjs+1WNNQSTuyyAe5UccCxejmcENsMY8KxgLzRYa8f3E21ISM1yWbwMcnptM74Pb6LUePrL6qKLKGW3+WAncjCEQV8W23waRjoCwgC6XBQz8otUynXYnsjsdbdCkxTaBhX1PCaO1QzSfnI6hnAQWO6pa4W9wCaRjinAlfjscbns5yKsuMGWZqw35KJdssywqd2jXHm0iMEEfs3Tten1nLoNoDeXiiifjOydKCcOK96kantLu+N6ZvGZNrh5j6GlcZ01MHDOG4XrkQNHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMWBjFRNg5F/lJrEjJS14m1QZOY16mfomaMxh2DrKIg=;
 b=CaWpkCIG6wT6P98lSkVQcWGkT0jwjAe9cmrrI24a6FYIZu6H4XkmTC5h5A0cU2WlWXOLdfIlwy5ITCAHPsGO17HGKPwDOBd9D0SbkmL08xeqKgUcClThx2G88WYxIJidzUnZXGRH4QhDCeClHqEEOEUa2VD/eWg0fdWEf9Jh278=
Received: from BL3PR12MB6571.namprd12.prod.outlook.com (2603:10b6:208:38e::18)
 by BY5PR12MB4052.namprd12.prod.outlook.com (2603:10b6:a03:209::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Mon, 25 Aug
 2025 06:17:38 +0000
Received: from BL3PR12MB6571.namprd12.prod.outlook.com
 ([fe80::4cf2:5ba9:4228:82a6]) by BL3PR12MB6571.namprd12.prod.outlook.com
 ([fe80::4cf2:5ba9:4228:82a6%7]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 06:17:38 +0000
From: "Gupta, Suraj" <Suraj.Gupta2@amd.com>
To: Vinod Koul <vkoul@kernel.org>
CC: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>, "Simek, Michal"
	<michal.simek@amd.com>, "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "dmaengine@vger.kernel.org"
	<dmaengine@vger.kernel.org>, "Katakam, Harini" <harini.katakam@amd.com>
Subject: RE: [PATCH V2 1/4] dmaengine: Add support to configure and read IRQ
 coalescing parameters
Thread-Topic: [PATCH V2 1/4] dmaengine: Add support to configure and read IRQ
 coalescing parameters
Thread-Index: AQHb8YM8lgBJJ/PUwEqjiAtds0zT8rQ/ZD+AgABF+uCAM4GG0A==
Date: Mon, 25 Aug 2025 06:17:38 +0000
Message-ID: <BL3PR12MB657195840F55252FBD319C95C93EA@BL3PR12MB6571.namprd12.prod.outlook.com>
References: <20250710101229.804183-1-suraj.gupta2@amd.com>
 <20250710101229.804183-2-suraj.gupta2@amd.com> <aICPiS1_ITwELrxq@vaman>
 <BL3PR12MB65713879CB569E3B330C1E76C95FA@BL3PR12MB6571.namprd12.prod.outlook.com>
In-Reply-To: <BL3PR12MB65713879CB569E3B330C1E76C95FA@BL3PR12MB6571.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-23T11:41:30.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR12MB6571:EE_|BY5PR12MB4052:EE_
x-ms-office365-filtering-correlation-id: 8949d71b-fe66-48a2-e05c-08dde39f1701
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?7siHQIqoDj6VDX4hrnoGRkHBxeCOuSI9R5KxWFTamGF/2hAOPza891UmWNkZ?=
 =?us-ascii?Q?TIMefPJsOBwAHWAeE2I8t4MWVK3Xzt4tv6Vw9E3a8jJ8/sVG1CfZE3rYxCXM?=
 =?us-ascii?Q?tDFLFIoBn3T3zsaXdMcYvfXRnnkU4vcvCpM3PVAyt3+i5fOaCqLZDqEI5kuv?=
 =?us-ascii?Q?sVVDyRhr3SVLVT67Uutn04bq/b60/Aa4cgW2NLLO3EBwPlL5FJSINHfpg5lk?=
 =?us-ascii?Q?J+u2ubNhN3PcyQqjnK/QO4jO2v+t1NexJNFMBTjuFRv7sSoJcHVOPPYxgdv3?=
 =?us-ascii?Q?a/6D/bvO1VHzcn5F3dzAdmEZFdRZ96zjyDXQz8yOTABnT33YLctSjDIgk2SU?=
 =?us-ascii?Q?ntFdpN7A6osI2Pnuyhfy2Gkzm8qwS3T6Jr+8/ctERB1nju9r2ehA0NdL2WuR?=
 =?us-ascii?Q?wfqB9Ywqxorhdh3oPzMalQUnLuaqmAP8KhK4vFnIkDxYfrsHC83kYLu1OJy9?=
 =?us-ascii?Q?Tws0bqrPGRGV3RpMrhd7es7f48CugYx6pakhMCZF1jyFqyk2a5TV+cbFE8GL?=
 =?us-ascii?Q?iWPhI8pDZFNkIjb5t3c4iqhq/hc1kWKl5FfgSDCupTDNlk0eHMgesKsCjKP0?=
 =?us-ascii?Q?xUsk9zNd88rkjlGvA8PygVv3c2SJTTOEzjwLwtGsEIKgPQUNVWJU0KPOLnS/?=
 =?us-ascii?Q?nn89WFujbt2Bxds8nFgz+WUGsdpJsbi56RXwPtiMQnShzOI0MQSP1kcASym/?=
 =?us-ascii?Q?oDGobAxu8Re7fVp0x9ZDfNG39QoLJSNFhK7kJtgRdz6e05/XIUs/WrkfQTrM?=
 =?us-ascii?Q?y2WkGvfWS5HiaJhRfIUPVVK8Tl5hBrhm5eX/wH4P9d6QYNw26t86F0phcYp0?=
 =?us-ascii?Q?fFvcns5GY3rVuMmW1KfeL7DbTuj9LaVEt7Zy5+rxKyE0/HvUFMKsUgJdzMmn?=
 =?us-ascii?Q?7MB+yjRCMVkVfcwvbGPgUZ0QkVXR/DLBMo5uxNmA2cR0pPYst1+MB+oinlPU?=
 =?us-ascii?Q?iOCfqF7J1sXpLFu23yp6Evkb44hfP0IehIMhxqPX1+ThLskV6zd89Y+kLXGT?=
 =?us-ascii?Q?1MKIRlA3qqjoUmXuW3hhT3JydPDyPHbGv/4yVg1mTxQ57vd3W2LjjI5EqMrO?=
 =?us-ascii?Q?ygyLHs0oQdgdI+OEsPaxO7CSwInrIon2bbtt8IW5mp9NIws+9WESf+p5O0iY?=
 =?us-ascii?Q?kRQHxEvLguf3Ucet0T55ZUaYlalFuXWszGPqTXz7HxuayrrqH+6NsDBstDWS?=
 =?us-ascii?Q?FZOohUdX/4dG1TMfi/rnkHFpOHCf0mO/U2+vZcNfShNceZQXTIugZJMybXgV?=
 =?us-ascii?Q?YAnov9PQw+XoCcVGe7CiMT8mCHUQFGy/OylmoPjaMcHnxr4UoJDmBfP8t0qz?=
 =?us-ascii?Q?BCdCJiCNdJ7mkqO/uEVary1eRjpu/Khx+XlzdZN1MuypDmdQStWf5A5ZVG+R?=
 =?us-ascii?Q?mW7R7A3hzNAgWB4+Plqry7gezO0rzZRLryrBnsf17wfLftPLGeMGVu2Xxslt?=
 =?us-ascii?Q?pIAXLKhv4UEDwshaarH73iYOSEyLKdIgDGPCZovdzufsYP7JsYG+2nB7SToq?=
 =?us-ascii?Q?epkLDaPrltX7hAU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR12MB6571.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?q07cPPu11jItO8zlZDE3rQGHsDBC0Du4gCGToEdq8kJ2GFY3F+LFmG+VFFcY?=
 =?us-ascii?Q?hw1JwOCzGEMqxEDMPaGfh9Jeu+m2AAd4z+QkhkDuY9k085tzbVb6QvxwXKLo?=
 =?us-ascii?Q?Pp22+lo0vCkWqJZa+0iFHUUv9iIRMtzUlG0swodMrk94gyQCy8pwgBb9+3Hd?=
 =?us-ascii?Q?y4sEBU0p1vaBdvnZ4q34mOIKul1ZcNdom43mbpOyzjdkyrielyddBVtMs9n/?=
 =?us-ascii?Q?FQQe+1egZsAosC/XxnI4zMPn5yhDfL+ZahLsc2D2LujGAXrJ+0DIpvp4DpwT?=
 =?us-ascii?Q?Q1jAa5DGOzKzSLdRq4csnfD/tzk1Hfh7ZxYKgIqvdO0WwYeQHqkolcEb5wQe?=
 =?us-ascii?Q?YtMaI/I4QQKSJUwKTrVpAZGIYSsUUFwPxua8uNIYyiD+HHcA6ZxpliMIbXyr?=
 =?us-ascii?Q?U5cFwMpX6rIw7qBlJa4kpayFYhH/6SD6lo+llL2D+Q6AK5nTZz3s9zGawFBu?=
 =?us-ascii?Q?UvUEdWsIdkzkFREpaHaFZgPl+b+tFPGei/fl0oIUZ4yrf5ouZvkh8ijEh+bV?=
 =?us-ascii?Q?mCC2xVNni0BGN7RuowjkyMlT6jxsywtgy4nSTz86V5uyIzuawz/b3pUBvznq?=
 =?us-ascii?Q?P+5uoWYC3ZZPN2eHXsfc2C1i6GFbY6CJLoPnFaxUwhZd+mDRlHMNLdTOvJlC?=
 =?us-ascii?Q?m0UH8KYbVXD7XEM3RxwcbKt2ZQ1A0f1aanlUPboB81R4u90JHUa0z0oRdrwA?=
 =?us-ascii?Q?WvoTrgqN3i4l5fZHPuJlnKOxbIYeoErDRFV2EgZbmX1c7L4jQMj48ccScgx8?=
 =?us-ascii?Q?OQxrUUk+299h1EHBQnxKhNsXjzGaF86ATeGTS9/k+Xeh5WoKJ4JlCPWdEmNP?=
 =?us-ascii?Q?xXBzfDbhAQuvqls/Ood7oYXsFalX3vMFPYSXosKD3jHp2dVL5LQ/Uc7+IVvt?=
 =?us-ascii?Q?xDNfFyUDsOQcNP4XJAl+Px68SFVqRIIfWpWrEqYZg70+zJnt9Q0lGJLyhdoV?=
 =?us-ascii?Q?vLyq+M/FioS/cbV5/MR1tZ650xiD8H/DdSbEWnVD9nkxJQw9X0CQNoD5I2Dz?=
 =?us-ascii?Q?+krTCVE6ibT0u4dgOTVLeG5RdHtJ+qsHEcsTAo79h0iWWD/+dNSYqfVAldGl?=
 =?us-ascii?Q?jg2o12MsuYwJypJ5npQaG4AFdvwuUkcsghdlIQsia56aK5+1xbQqpnTFniLU?=
 =?us-ascii?Q?oqS++POS/knBnOVsJZF+vtdZtKDNLN8omTWqQfE0reo3O3g42qlyuVceS2HV?=
 =?us-ascii?Q?ucdhxjpQwREXLZ0Va7+DvL90ySYSPHezzx5ccpQR8QSYkGF6v1qe+TRghzsq?=
 =?us-ascii?Q?frdyAMvGbeN0EDaZMSa6S58ykWkkm7ATQnj92LJqWekA3RgV7XLnGMMag908?=
 =?us-ascii?Q?MZ3F7XBlwfLH8DmmATWuvcm1gdB5GPwhvITxutzj1eEuYEcDI5s+IZXTW03N?=
 =?us-ascii?Q?jzmB01M3PbbWUJHwuO+doQdGZjriddlQbrvEdTr0flH9SxPkpYt+AZzueGY7?=
 =?us-ascii?Q?nkj8rBelFBKWs64K5LRN4Tg2A09UdCOKQ43Ct4XTlevXJ/GP8SfIIn2UGZva?=
 =?us-ascii?Q?PTRoV73Q+SDLcQM9xT0eyhRXLaegPq76o6cqNIbSKKExlThQ1XdZ1uJW+jeu?=
 =?us-ascii?Q?UD+4raQ4m6hjmSsErw4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6571.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8949d71b-fe66-48a2-e05c-08dde39f1701
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2025 06:17:38.1496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NrKGgrS+RpZNRlX1I569gEg1qs+7MuDfIprfhHvOs94zY/cT7MTxevjNYZ9HL2pCDgiEuuDcEdyZZjgVu+BC8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_233242_224733_1236A76F 
X-CRM114-Status: GOOD (  33.08  )
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
> From: Gupta, Suraj <Suraj.Gupta2@amd.com>
> Sent: Wednesday, July 23, 2025 5:19 PM
> To: Vinod Koul <vkoul@kernel.org>
> Cc: andrew+netdev@lunn.ch; davem@davemloft.net; kuba@kernel.org;
> pabeni@redhat.com; Simek, Michal <michal.simek@amd.com>; Pandey,
> Radhey Shyam <radhey.shyam.pandey@amd.com>; netdev@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> dmaengine@vger.kernel.org; Katakam, Harini <harini.katakam@amd.com>
> Subject: RE: [PATCH V2 1/4] dmaengine: Add support to configure and read
> IRQ coalescing parameters
>
> Caution: This message originated from an External Source. Use proper
> caution when opening attachments, clicking links, or responding.
>
>
> [Public]
>
> Hi Vinod,
>
> > -----Original Message-----
> > From: Vinod Koul <vkoul@kernel.org>
> > Sent: Wednesday, July 23, 2025 1:00 PM
> > To: Gupta, Suraj <Suraj.Gupta2@amd.com>
> > Cc: andrew+netdev@lunn.ch; davem@davemloft.net; kuba@kernel.org;
> > pabeni@redhat.com; Simek, Michal <michal.simek@amd.com>; Pandey,
> > Radhey Shyam <radhey.shyam.pandey@amd.com>;
> netdev@vger.kernel.org;
> > linux-arm- kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > dmaengine@vger.kernel.org; Katakam, Harini <harini.katakam@amd.com>
> > Subject: Re: [PATCH V2 1/4] dmaengine: Add support to configure and
> > read IRQ coalescing parameters
> >
> > Caution: This message originated from an External Source. Use proper
> > caution when opening attachments, clicking links, or responding.
> >
> >
> > On 10-07-25, 15:42, Suraj Gupta wrote:
> > > Interrupt coalescing is a mechanism to reduce the number of hardware
> > > interrupts triggered ether until a certain amount of work is
> > > pending, or a timeout timer triggers. Tuning the interrupt coalesce
> > > settings involves adjusting the amount of work and timeout delay.
> > > Many DMA controllers support to configure coalesce count and delay.
> > > Add support to configure them via dma_slave_config and read using
> > > dma_slave_caps.
> > >
> > > Signed-off-by: Suraj Gupta <suraj.gupta2@amd.com>
> > > ---
> > >  include/linux/dmaengine.h | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> > > index bb146c5ac3e4..c7c1adb8e571 100644
> > > --- a/include/linux/dmaengine.h
> > > +++ b/include/linux/dmaengine.h
> > > @@ -431,6 +431,9 @@ enum dma_slave_buswidth {
> > >   * @peripheral_config: peripheral configuration for programming
> peripheral
> > >   * for dmaengine transfer
> > >   * @peripheral_size: peripheral configuration buffer size
> > > + * @coalesce_cnt: Maximum number of transfers before receiving an
> interrupt.
> > > + * @coalesce_usecs: How many usecs to delay an interrupt after a
> > > + transfer
> > > + * is completed.
> > >   *
> > >   * This struct is passed in as configuration data to a DMA engine
> > >   * in order to set up a certain channel for DMA transport at runtime=
.
> > > @@ -457,6 +460,8 @@ struct dma_slave_config {
> > >       bool device_fc;
> > >       void *peripheral_config;
> > >       size_t peripheral_size;
> > > +     u32 coalesce_cnt;
> > > +     u32 coalesce_usecs;
> > >  };
> > >
> > >  /**
> > > @@ -507,6 +512,9 @@ enum dma_residue_granularity {
> > >   * @residue_granularity: granularity of the reported transfer residu=
e
> > >   * @descriptor_reuse: if a descriptor can be reused by client and
> > >   * resubmitted multiple times
> > > + * @coalesce_cnt: Maximum number of transfers before receiving an
> interrupt.
> > > + * @coalesce_usecs: How many usecs to delay an interrupt after a
> > > + transfer
> > > + * is completed.
> > >   */
> > >  struct dma_slave_caps {
> > >       u32 src_addr_widths;
> > > @@ -520,6 +528,8 @@ struct dma_slave_caps {
> > >       bool cmd_terminate;
> > >       enum dma_residue_granularity residue_granularity;
> > >       bool descriptor_reuse;
> > > +     u32 coalesce_cnt;
> > > +     u32 coalesce_usecs;
> >
> > Why not selectively set interrupts for the descriptor. The dma
> > descriptors are in order, so one a descriptor is notified and
> > complete, you can also complete the descriptors before that. I would
> > suggest to use that rather than define a new interface for this
> >
> > --
> > ~Vinod
>
> The reason I used struct dma_slave_config to pass coalesce and delay
> information to DMA driver is that the coalesce count is configured per
> channel in AXI DMA channel control register[1].
> AXI DMA IP doesn't have provision to set interrupt per descriptor[2].
> I can explore other ways to pass this information via struct
> dma_async_tx_descriptor or metadata, or any other way.
> Please let me know your thoughts.
>
> References:
> [1]: https://docs.amd.com/r/en-US/pg021_axi_dma/MM2S_DMACR-MM2S-
> DMA-Control-Register-Offset-00h ("IRQ Threshold" and "IRQ Delay" fields)
> [2]: https://docs.amd.com/r/en-US/pg021_axi_dma/Scatter-Gather-
> Descriptor
>
> Thanks,
> Suraj

Hi Vinod,

I've added a rationale above explaining why I opted to implement a new inte=
rface instead of using the interrupt flag in struct dma_async_tx_descriptor=
.
Please let me know your thoughts when you get a chance.

Regards,
Suraj

