Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CFDD3517C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9npmlan8U5WUNr+ezbrNKUw7A1SqBoelsFCSF3p+iuo=; b=lgCUo96c9Pl3nxYDUoLsugE5lp
	4JS1VNyGsjnya1Bht/VQeLxob7veHCyWmMc3t4mWrBU7Z5tCwq18Gt/F8mu6QCjRffVUUap1naK8D
	CpQj/PsRixuauE3tc0DTFGrkwfIVv6gGoG36FxnDSzm29BYqvotVA86xgyGOnkYUcBDkc7P1H/xe9
	AaQCgDygl8uTPhHSy8llvV0vRTs5EIRFAYJqv+6PB3n9iSr4c+aoe/F5+qqOY/g6z0T1WqE0r/mYc
	p0AcQZE8Q3DPzE+qyKPpkVkQsJy9YO2yhLltvsj0of239YTrj2sHcAb/OB8njv8BI2UjGHb4N2qvb
	olzHQS6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vMa-0000000FH65-0AFx;
	Wed, 01 Apr 2026 13:12:04 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vMX-0000000FH5e-0RGG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 13:12:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhUr7rBBhFJNo6v5Aag389MGc8AjWTc5/1K20f/0rozeLcxppePbFDqGmdrCm+Rrsj+kl9lvUU5l1F8k250RQtpFAnlDHvfVXnc4st0amMV+vTzSKXapiyDl6LhvK65umFKLOb6bZ4jCfFc3CETrqv+/ugfzWLNfSZuJ8Rnum6tyIlDAc9DwG26UFJsNU7csMnydlJIquwrjWVpBt9qbZYvPg+7l50h9YeU4fcqYIbJFqkJwXgTs5uaiXJjgnntxTh28zCoRF5859NhmK646ppeK3PX9Tb2yNHw0jl/IIdVJ9lDkJTTD4eoWWFbGlkLg1fvPQupAXlQ8Ynb68+mTZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9npmlan8U5WUNr+ezbrNKUw7A1SqBoelsFCSF3p+iuo=;
 b=SkYjJKzeTibxuXoretLvobZfFqwMA9h4VRzBpPtIeBBMEhDmr2kEKWHyD0Y2pDXKS+Oosfwqb3FEMb0LlMjjNLhq3XSADS9fGyYKCfLfVLP7t/6KF77YhWjJh2SVMoYx8pHGOtySoSf19CJN8Ns2Y+4kspT54zKQaurFWsQ7TlcTFGZbLWmvvuwthzBMqq6hd0CEKeoHR/yXJdOfoXtsrHoOcIEHsQHKDi3vVAZzd/YzQ431GsdCx2Qb0U3nROO4geWgMy2c0QK7ET+g/1f6lrpnHszVzbZCg0fYLyWU17mp46ROFHlKICC4pFELDOv9whA4Ww1mZn64uFsS/XdbIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9npmlan8U5WUNr+ezbrNKUw7A1SqBoelsFCSF3p+iuo=;
 b=gGWHfYTFJVbWA/IRlHYm4BTW5HLHZ9TubXU/UGevnBqtIBDXG9SDkt5gmAQ+mAYUZt4EqPMdLviLw2eLKSDLWQO27mT0lVrZrrtxuiTS1nUDNOhmKnBKpQ2rzxukuveLiwUTK7iJ72oSqnCjSm7U3YI/TKlmQw1KrLVoDUZd40w=
Received: from IA1PR12MB7736.namprd12.prod.outlook.com (2603:10b6:208:420::15)
 by DM6PR12MB4332.namprd12.prod.outlook.com (2603:10b6:5:21e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 1 Apr
 2026 13:11:53 +0000
Received: from IA1PR12MB7736.namprd12.prod.outlook.com
 ([fe80::2274:9fed:8f3:8550]) by IA1PR12MB7736.namprd12.prod.outlook.com
 ([fe80::2274:9fed:8f3:8550%5]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 13:11:53 +0000
From: "Erim, Salih" <Salih.Erim@amd.com>
To: "Simek, Michal" <michal.simek@amd.com>, Jonathan Cameron
	<jic23@kernel.org>, Christofer Jonason <christofer.jonason@guidelinegeo.com>,
	"O'Griofa, Conall" <conall.ogriofa@amd.com>
CC: "lars@metafoo.de" <lars@metafoo.de>, "dlechner@baylibre.com"
	<dlechner@baylibre.com>, "nuno.sa@analog.com" <nuno.sa@analog.com>,
	"andy@kernel.org" <andy@kernel.org>, "victor.jonsson@guidelinegeo.com"
	<victor.jonsson@guidelinegeo.com>, "linux-iio@vger.kernel.org"
	<linux-iio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH v2] iio: adc: xilinx-xadc: Fix sequencer mode in
 postdisable for dual mux
Thread-Topic: [PATCH v2] iio: adc: xilinx-xadc: Fix sequencer mode in
 postdisable for dual mux
Thread-Index: AQHcq7dnEu4MVLVXG06oIZXnf3P2bbWjB/QAgARjkoCAIuly8A==
Date: Wed, 1 Apr 2026 13:11:52 +0000
Message-ID: <IA1PR12MB7736AE6EEE95D5D184A15B9F9F50A@IA1PR12MB7736.namprd12.prod.outlook.com>
References: <20260304090727.1800289-1-christofer.jonason@guidelinegeo.com>
 <20260307124118.1d527749@jic23-huawei>
 <1166aeef-0c93-408d-b265-9037f2840074@amd.com>
In-Reply-To: <1166aeef-0c93-408d-b265-9037f2840074@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2026-04-01T12:51:04.0000000Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR12MB7736:EE_|DM6PR12MB4332:EE_
x-ms-office365-filtering-correlation-id: 71f3c5ef-08cd-434c-9e14-08de8ff03e1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: qleH7Rl1ymt3CCM+p1JWnPjjcI5nDQ/R2dMUyLhZXRa3LspuKgYn/9/e52P+W8G1LH37URdTyYUoEqaJnpiZty7JUITloDj8cbyP6Znxvm5okBNCzNLgoZIhKxfeSL+ULAm59QXoBKs6s6wiCWSGa0py6S7Iylq2os9ScI5VbdtJeTYlrouWavMNWjYA7M2pe3GRbGxShMF8e+0FPUKKMI/J1VBts5kTMIyeDkXBB6iHe8WnYxaK5TvQDovUtXOYny2rF03pQ/wL4SsfY1qqShvUYYGrWT/bDQx8ujKIgewD7wFShux/qUTR02xCJLKkCOKJD4LzJOv1QaaPIQcCNpB8xmbgTt77a/FmPB9JMm7Tn0Uwe76CccydtlQjqdW2ONFawECzbMK5CQawdUDQC+JN4zCazGmVkkl7wsFjOFrJwI7x+sdcYdjG9KiMj03zlqb3SO8qDxXSQbtjyeL/hV0iYxC4Ivh5Gw3/Xj0j1+4O+Wd++SoW/V52pnfe/XiJ+x1T12SN8oz7N4F+a2iVfuZNHlU57B1G27DNDKKb4MpOZSIeBx5B+rZv4gZ2VWPKF9LuoHnwEnjrVct4hTi1QL/Bb9V6Cr7C06iJFM7CRJTIe3evVkz9P0PXZquOWvEJ+8UN1pzJsEjyiPcFWGjseCeLOJwDjjh21CDZk20yqLtMs7ETAW4YMVDONCZ8SD4co2EvOi2ZI1NkU5z8k+EjkFj4pG9OxS9AFjAeH41VuNRbjPjOMXOM9fj1jC6HITVDy7i/1+cL0A3Xdd5gGuB90RSr6VmliFvCKu3yWmEV3ac=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB7736.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sDIB+5s74RVz+3dUjeL+0w+28WQOKRC7ze7fd+tiCi/febBYAL+1ux6oz1AS?=
 =?us-ascii?Q?AZiy19G+GgoPl7DZi0Oh1zqeJIJL7QaaPLplYdNNUF4gSR5MPMzvmej4r18S?=
 =?us-ascii?Q?pIulG/dl4mC+OQUjorobhZaXkg85oTFRvnRF+in6q7PWSJ6eKnpwaFnvEmEc?=
 =?us-ascii?Q?LGKbKpaM3t7vtGudNvbjHK/vIHa0wyDkJ00faWtWnCjeSZtBXpk1n9J/BG6n?=
 =?us-ascii?Q?y+pLUPRztH01piV77G0F81lKnWXsZmxidgEV5qdxd3YAyVZpKYv5ic5Xq+Ic?=
 =?us-ascii?Q?+/UgmRlSGFi/ZBYfxpQbKz8c4BHTyxCvX8v0KHVK8pm0GfFkfeiYUQ1mGnHD?=
 =?us-ascii?Q?f0nMdIt0kTUhbvg5nv1va1cKyWOeUn0Jcr+Q44wCaghsE63Sx5xHonouIhdM?=
 =?us-ascii?Q?CsYySRm/PZaQ8QOJfTkzjpM+2/yPaixbrS1SUaCPtLufz3gjV6rVRO7i7PoC?=
 =?us-ascii?Q?Di6K96wCaFN9XQ8E6+ZGRIaG4ll4jCHBlaXxyqNIAIYiOk1fereo/XGJ2EEF?=
 =?us-ascii?Q?WEW3ID84Tpp+ujuShb+Xa+bOQLAngzKOxUMMeKSrLUzkBRefZEr+o44TJJxn?=
 =?us-ascii?Q?jZGkCi/WtljleZWFig7Q+dQUHZEjlapQ/tvsSTiW9VSLQaxD9xlHDBTcxNrc?=
 =?us-ascii?Q?J55WemPUtq/yzfwgOQMPXsXuumjXQ64OCmVSiYY58TtOORdYKQtg46iDSOnK?=
 =?us-ascii?Q?kvO+WQoUax5yHlI9YfUa1K8xcmfsljpKUBsd2mofU/ZTLM6VSF6zAOgTymWM?=
 =?us-ascii?Q?z1MRjewkpvlFKc8yjyWRHBuUm4vFEMzRc+h1bPi55Ba2tk1TAvLJtsAwC3U1?=
 =?us-ascii?Q?XVgAqWBmIH3zbS792fUmLjSNUJ4tWBf3j97ip2jspZdXRbgtepnsQMdGteo5?=
 =?us-ascii?Q?aQ9OCdKRGmz+vZYbDTGgfXHwShD7L1GKvtZBEYgsZr4BNFeXTOOgVGEopOyL?=
 =?us-ascii?Q?7hOctjqA+ABhcKz/isHsIVqsCHwm+/+TWaUj7K2/Lodexmyy7UvexR2F1zhb?=
 =?us-ascii?Q?laKSgzqgTg6iuyfan01Ryf0if0SiqhBgkjuQTy0xfNJEY/MY/FtBPhMDjtGf?=
 =?us-ascii?Q?jT6Gh8USUOp/wAn7TuuIiRcShr4KTKQ4FzBW0ldWlRs2CsxVsvls1r2V8hZ8?=
 =?us-ascii?Q?iC+9vAUJinaT9K+HPo5V+jP4BF75XG45X6FQgS/4hqsgY/BoJr+grXGncMOT?=
 =?us-ascii?Q?tigjz5QDmWzKjUQ60+1461gIy6pscHuwS/cDdVkRdND3+l9fTA/kmr6FiZa1?=
 =?us-ascii?Q?sTEwGEASmyM6lpnnZM3S3HXf9jUVMGycit2ELc7I5vWFQXgKESwKGAeV9Cfg?=
 =?us-ascii?Q?Dgq5mwaFR52iaPPFkY5m2ZEnUBUwIZFOk+qTzsm7HgEr9qmsYvSEzLYm6pGC?=
 =?us-ascii?Q?TVRtUGVnNEOsj5uwINTvQRZxfxt2wZVJG4MoXzKDF5Oyxp3k0XX4k77Uvwy8?=
 =?us-ascii?Q?wcK9BoxMgqEm1EmUtRrJv3ScRv5VzkO92DTRATxrZr9I5P9PUG9cYJNLiVNW?=
 =?us-ascii?Q?+m9xMxSIOrC7jPYGVT6lVkcV86u/Z+DVZ4Qo2hsySHQGmBRH22lZawnpe4X+?=
 =?us-ascii?Q?yw2v15BBAxKzqF7rF7DabJJ6l9AXwlwLTwf15yLuWCheu8+YBAFfsaD5C0KB?=
 =?us-ascii?Q?HwadkVl8j8p2ocqGzEhZvBUcfsw5w5X0Xihcqx0batvcR4u26FPx/whWYQCM?=
 =?us-ascii?Q?tBvHn4TF6uyjERt9vP1Tkd2X2Z4oIdUNq0epIOdPrOJ0PMp4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7736.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f3c5ef-08cd-434c-9e14-08de8ff03e1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2026 13:11:52.9716
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MLR0qECYQyWe4NyJXqjXKBgZO6RBI+Ea+EDs2DTqJUkOfpRN9d9AP2JAmTvdFDZ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_061201_382246_BCB3DF2B 
X-CRM114-Status: GOOD (  21.46  )
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

[AMD Official Use Only - AMD Internal Distribution Only]

Hi Christofer,

The code change looks correct to me - it aligns postdisable with
preenable by reusing xadc_get_seq_mode(), and the scope is limited
to dual external mux configurations.

Since this is targeting stable, could you please share what hardware/board
this was tested on and how you verified that VAUX[8-15] channels
return correct data with the fix applied?

Reviewed-by: Salih Emin <salih.emin@amd.com>

Thanks,
Salih


> -----Original Message-----
> From: Simek, Michal <michal.simek@amd.com>
> Sent: Tuesday, March 10, 2026 7:43 AM
> To: Jonathan Cameron <jic23@kernel.org>; Christofer Jonason
> <christofer.jonason@guidelinegeo.com>; Erim, Salih <Salih.Erim@amd.com>;
> O'Griofa, Conall <conall.ogriofa@amd.com>
> Cc: lars@metafoo.de; dlechner@baylibre.com; nuno.sa@analog.com;
> andy@kernel.org; victor.jonsson@guidelinegeo.com; linux-iio@vger.kernel.o=
rg;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> stable@vger.kernel.org
> Subject: Re: [PATCH v2] iio: adc: xilinx-xadc: Fix sequencer mode in post=
disable
> for dual mux
>
> +Salih, Conall,
>
> On 3/7/26 13:41, Jonathan Cameron wrote:
> > On Wed,  4 Mar 2026 10:07:27 +0100
> > Christofer Jonason <christofer.jonason@guidelinegeo.com> wrote:
> >
> >> xadc_postdisable() unconditionally sets the sequencer to continuous
> >> mode. For dual external multiplexer configurations this is incorrect:
> >> simultaneous sampling mode is required so that ADC-A samples through
> >> the mux on VAUX[0-7] while ADC-B simultaneously samples through the
> >> mux on VAUX[8-15]. In continuous mode only ADC-A is active, so
> >> VAUX[8-15] channels return incorrect data.
> >>
> >> Since postdisable is also called from xadc_probe() to set the initial
> >> idle state, the wrong sequencer mode is active from the moment the
> >> driver loads.
> >>
> >> The preenable path already uses xadc_get_seq_mode() which returns
> >> SIMULTANEOUS for dual mux. Fix postdisable to do the same.
> >>
> >> Fixes: bdc8cda1d010 ("iio:adc: Add Xilinx XADC driver")
> >> Cc: stable@vger.kernel.org
> >> Signed-off-by: Christofer Jonason
> >> <christofer.jonason@guidelinegeo.com>
> >
> > I'll leave this on list for a little longer as I'd really like a
> > confirmation of this one from the AMD Xilinx folk.
>
> Salih/Conall: Please look at this patch and provide your comment or tag.
>
> Thanks,
> Michal

