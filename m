Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5327EC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVHhROb6skDElo/s/HFtCsTiUcfSJLi5MjLcy5RmQ2k=; b=Nii/9u4y7Nw5GFoY7c2cWK/E0y
	soofXkBD/H3leahAyLfhpoaMeoAtJCFjkK2OjOsNutZCzwU+GgHKshHeMA4o4G1hE03ATAPstW/Dv
	7ZWzwheN8dcq1Dmv3nvbs55o3ob0B7HGMQkEEVmE5DvXuFp1KMUD0Q9tpzfbNkFeGiWamoVmx2zhs
	TBeUgxwXyEJSUHiERQ03tiL5LNA/3MnKNAPQjO06WuHKu/0Nmscak7hgp2n1gW1y34HGZ6L1KoV+k
	kuOW8ORmvfwEsQprUY2PTj029OWGeOwpFYkNq+NT8xDoVrKYHRxsQ/VkadIXQ7/V8UB/VpwpOPdzu
	/Uue/RZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thjsC-00000002iYV-0SUn;
	Tue, 11 Feb 2025 06:35:56 +0000
Received: from mail-db5eur02on20628.outbound.protection.outlook.com ([2a01:111:f403:2608::628] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thjqm-00000002iCZ-2a8V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 06:34:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QGsFzaJZgdu4Y1AwBQpOzST58up3NI6i2bb+ILDqfj9sg5Yjc1gOOxMpPx1hiiZhfiaWxt4ZIFxpbyDvVzjHFLpze/1xkQJAVv63xEC/EgGX4G3dIvDw4LEITTdTgvMjDWX1EXJ7HdPeSbN/7mzOxBBtI7HLySfBACubFldx+zik/L5O9iinDTaR7PIzmr8N2HtMK3hgsGNIjOfR/eeB0rw2/j14MlB/UYkDfuqDxGHQ1PI4GzoGgKtOdaoDIfoe9MxEtZsmqraqXGm7yhhzZPNDTHnoABT+jUmfW96iYq9mNpcpS7P+VftwAWkE+NC2x+b+Wb7CTV7Uiw4QUTV5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVHhROb6skDElo/s/HFtCsTiUcfSJLi5MjLcy5RmQ2k=;
 b=lCj9/qEGtHBbf+q9NeEO0KO03xUOwoQce1dJ8KkwAC5X1KdKs2YOIF0K81W7+FeyT8goPxH39Rdyr+u4Gy6V7JGbKSafRjf2dleQ8H9hteTS7J7825bd/a0UM01mlfpc4MRwngTuyU7+RIOkAJwbU29JErXCzsTUHN01Ze7Qcu7nTYMVrXHoPgX1KsNh/8TvQrWidwHJaJ0L92+zEFb0Ttx/cq50KmCVj4pALBazPr8igZDXnJyk56SUB5LZTsoHNqEAv0ZRo0dOToA50dc8ZvwXLoIbQIgHe+jzCl1NGnnA1SMaYXksvP1jGrnh0qgqPNSBywkUZfnimliAyPR7AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVHhROb6skDElo/s/HFtCsTiUcfSJLi5MjLcy5RmQ2k=;
 b=fGQdDzrYIPEXc2HXWo1c3+FZxNYPEm3X87te8DoHyWPR3UcjIjKe7f5/5gDhX1dT8++P8/DetEC/liBbkmx0zySJ5wh52a93HaL4aY06iNrK07yUV7z+WYb0octrBO/SbfhWUahYRIDMQAluj0qBj5xDNwePqzDb1CNnEokUg5uNfsyH03SUwPTYQId8cHsrwOw8kvnxTarfQRzqZ82W9yMm1mTyMoebKYEY3lZcVfedjzCiNTBOid/5IJMnJwlI47tHzvXHYAOZdUFbCXvGpwmsLBd4taZwPsBeZ7Xes2AVhBjoKACCHDF9xlNd1U62oGaeWZ1HHDAAJODDbQhwEg==
Received: from DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19)
 by DU4PR04MB11007.eurprd04.prod.outlook.com (2603:10a6:10:582::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 06:34:22 +0000
Received: from DB9PR04MB8429.eurprd04.prod.outlook.com
 ([fe80::2edf:edc4:794f:4e37]) by DB9PR04MB8429.eurprd04.prod.outlook.com
 ([fe80::2edf:edc4:794f:4e37%6]) with mapi id 15.20.8422.009; Tue, 11 Feb 2025
 06:34:22 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Shawn Guo
	<shawnguo@kernel.org>
CC: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: RE: EDAC on imx8mp and ddr scaling
Thread-Topic: EDAC on imx8mp and ddr scaling
Thread-Index: AQHbeUPcqMuGJWEkBEWOfX826o2SNrNBpcvQ
Date: Tue, 11 Feb 2025 06:34:22 +0000
Message-ID: <DB9PR04MB842936EF132C8DCDFC0AB8E992FD2@DB9PR04MB8429.eurprd04.prod.outlook.com>
References: <CAOf5uw=SHCLAH21RbZCVYyU6m4KRD9g=KsYg0b9vq=AFu+cb+Q@mail.gmail.com>
In-Reply-To: <CAOf5uw=SHCLAH21RbZCVYyU6m4KRD9g=KsYg0b9vq=AFu+cb+Q@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8429:EE_|DU4PR04MB11007:EE_
x-ms-office365-filtering-correlation-id: 2f315694-9c7e-4de3-1140-08dd4a661ef5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?b2l4WXFrNDd6b1ZaSEVqdGRTd0F2bGF3blRZcFdlMTB0T29Hc0xZaUNPbVc2?=
 =?utf-8?B?dmVpM0VVcHpDYnVjZkcwUXVTazRacWNVVS85U0QyMVJpSXhwcmZ1eE00eld1?=
 =?utf-8?B?cGFOanBOdUFBK2gxMXZadnhxWGJoWnNEVVoyMnJqaGhscnBsRlJ2R01pRFJG?=
 =?utf-8?B?SHpBMGRtcENSRjE2OWM2MklKeDZYelkrd3ZxZnVJSXJDZXdDNGlPL0MvSDdE?=
 =?utf-8?B?NW5VdkhvY3lieFNVRlJMVUFjS000a1RiZ0w0dmZsc0lYdHBHZ2J1OTZ5bHJq?=
 =?utf-8?B?am1hTDdlZEgxcnJUdVJ1V01FRHY0SDVVUkQ2WU04Y3daNk51eE1hYjlqSmdj?=
 =?utf-8?B?T0tQMFNZS05pVitEbDUzQlFKazdzVXRWb2xpYVVsdXJCbVJ2S3RiU2w5cnA5?=
 =?utf-8?B?NE1IcmFDZ0lXUVpXUHJGempyVkxsREFDcWpLNDArVHloN2M1Y2JqVnRybitX?=
 =?utf-8?B?TmdDZnE4NEkrNVVFUXBLcHRVckcvOWNOUnlKMHZXS1ArMkFqc0NQRFdVU0lq?=
 =?utf-8?B?UU9SVzQ2U29GRGdBR01xdklBTTk4eU55aTNWRnR0VnJnV1FDUTQ2Y3h2cUdX?=
 =?utf-8?B?T2MyMnRPb2puVFJvbTFHNHVWRE5VdHN3T3BVbElyKzI0cXdpVFJ1aDh5b3dG?=
 =?utf-8?B?VEJqOUtCdFdCeVYxNWdHV1laYUxhanJUV2hpMUhqWEhyaTg1T25ZYmhIRldw?=
 =?utf-8?B?cXFDeDZDbWZJWGhocUxNTnZWNXZyU1QrUlU2ay9ScGd2WVBvWU5sTTRVZWFU?=
 =?utf-8?B?MlkwbWZJZnA3ZlhtSEZsdXZFS1RYSVFZQXpIQnV0dHQ1cUlCazhmUmNlbnBq?=
 =?utf-8?B?aVEvbHlQaUpyRlpNSU1LYzdBWnZURmxNT2dSanUrWEpJSTAvR3FrMXo3YVgw?=
 =?utf-8?B?S3VueE1xYXFZa2N0MUZid3NyT3Fqem9CMW92UHU4OTZ3SFdSQnl2cFFORDNz?=
 =?utf-8?B?bzlLZFFZSFN2YjBBcXRWK05BQUxla2VpTmlPNDYva2dmT2taZTNyV1AyeDkx?=
 =?utf-8?B?VENQVDVVZXp6dmVUQ1NTRXlqMFJFVlRtRElobW5XdWNVZWgyUUNWMWlzOFRC?=
 =?utf-8?B?UnZJOVdKWktxSlovT3NXTFl4ZVpPR3RlM2d6SEdjcDNJQWZvNklWWUFzT1hx?=
 =?utf-8?B?K0paWFFZNlRiYVp1OXUvbmkxSGdTL3JYbjIxYlN1dWNNbEVvUW9SWHhNclN5?=
 =?utf-8?B?bkE3NnRtdi9aaXlZaDI4VjdYamliYjhlemQwZ0V2S3hJSFJ5dUNTMnludXhi?=
 =?utf-8?B?dWZ6WG12c2dTdnBSRHFZOXoyUzJDWU5EckxjbnNxVmhROHdCTE54K1JQMEEx?=
 =?utf-8?B?Q3M5RmxYU0U4UVRneEkxcDljREx2UnFva215R1FJNEt4L3BMejJhL3J3cEN6?=
 =?utf-8?B?V3RnOTZpbGFZa0NuVHNvUkxWRm5zMlF0YVRHSTc0bkxLNno2MUh5ZGhVT1dj?=
 =?utf-8?B?UUIyVmgya3ZGVFh2MFQzeHd3blAzRnlTbmxPSnFCU0EzVDlla0JDMzVuYjh5?=
 =?utf-8?B?Q3BxYWx6OEtkYTJpQ3NjQXZvR2ZVVnQ3QjZrWGh0Ty9qRGZtd1RPVVBwVGlU?=
 =?utf-8?B?QTBSUDRtbXlYckRsTW8zdE1qWXhINDNIdFZ2Y3FSa2xwNXVzcVllaWZBZjJO?=
 =?utf-8?B?SjJCaUIxU0hMY0Mrd0xnTytJWFFOdzd5V25NeTVFS05vM2ZqNjZqeEVPVFFS?=
 =?utf-8?B?Y01uTDBDTk1paXI4ZW1MY3JPNHhLRTNVWkNmalJXck1sZ21DaW9rZlhLTnNq?=
 =?utf-8?B?UElZRWl4SVpuRUtsRXVRZDI2RnMrT2Nia0NUZGVXSmtDMHJyMDVDNVE1UVZS?=
 =?utf-8?B?MWVpNWwzSUhlY0dVWUFsR2NOcHNUa01TN0FDOUh4RUtvWEcyckZsRitHc01r?=
 =?utf-8?B?TEpQaDdRVHZyM3dJeUdUbERuM3dKUkh6U3dySldTTTRKWDF0ZyttWlphaklB?=
 =?utf-8?Q?REWme/fI/COFDE74Y/UkY+fVskrkbahI?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8429.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SXZlanRDYVhlU0UrV1ZrSGhFVW9kMG5COG4wZzJZdVFFUnB6R2RtQTg3Nnp1?=
 =?utf-8?B?Qm43MkdzRzdkejQ5ZmdDUFVtUDR5MkVMMXpqU0d6MG4zN1dKbUgzUktHd1Yw?=
 =?utf-8?B?OWRTbU1rMkgrc2NLdk5OOGVrOGR5L2F4U0xvK2tSOEpiRjkxN2UyWWhRNVJ3?=
 =?utf-8?B?SzBLTjNUUS9ZRTlGSnZFWHdpU1gyUWE5TE9wcktJTHc3N0FIVVA1TkIvQXpM?=
 =?utf-8?B?RzdiUklSTmwvK0pOVm5nQ0NuRktTd0t4N2tFOFFRTmtuNnlTS2NlUnUyQTNY?=
 =?utf-8?B?VmdXKzhLREt2TFVsK0hnS1VyQklJcDNzSVVTc2VFZXhiNStVaytVMmJuSzlJ?=
 =?utf-8?B?NGVMREszR3U5eWdWOXAyV0gyTkVHOFVrZmNvZVNpK1E1KzdUUHZoOGxGeGZj?=
 =?utf-8?B?L3VZTDJwSXltSFBLT1g4UlVrWGltd014QVJGRDlST2ZOaFpvSE1IQ2MyVkRj?=
 =?utf-8?B?dEVqQ0REb2JOQWxZYXI4VTI4NFNURTVXbnA3ZmIxS1NsaVh3UnVFYVVGZ1gr?=
 =?utf-8?B?b1VyVVNBMTZ6TmxlZmMvZDlvanFxbXFqRGQxaTg3SWNjSWdoWm1MZ1FNS2xk?=
 =?utf-8?B?Mnk2Z3N0V2JzalFvUlBKdXVYZlJWdEJtSXJpeU92OWlid04xOFhUR29RejV3?=
 =?utf-8?B?QmdLdkx2ajdIV2h2VTRnT0I0bVNpaFBCSzMxaktPcU1OQzlhc0NvZXRVY2Z1?=
 =?utf-8?B?ZnlzQ2NOS2pHdUNjdlVObjVjY256OHlrRWthTEtFRitQZ2VUeC9RTW9ibDBh?=
 =?utf-8?B?VGkxVzJjZUJYU3VBREZYUzgxNklSdXhsZlFMbkRKWjcwcnVZYmltdmRDWTN3?=
 =?utf-8?B?VVVNYUFkd28rckliQlE0aHl0UmdwYWIzTWhpS1RaYzdxUDB4blZDNjdmT3o4?=
 =?utf-8?B?K2JhQk1DUG1naE9DQk90U2MxRTFrRCtBdTFnTk9aeGt5SElpNmhJMldXSFNi?=
 =?utf-8?B?YnFnL1J1MWFXbjlYdTk1NXJXeHRRY0xiMXNqZFIxckYzQWN4Z1N5akNjb2pC?=
 =?utf-8?B?UERUdWozSTJ4a3RFTXA3K2FyeEpPSzY2TEdOUDN1UFJnbkRyano1dTlrTFJo?=
 =?utf-8?B?aDhsdTh2eGJSNTBHK282QnhkMlFyMG5HdnBXSXBHTXlVcm1GdExNbEc5Tlhq?=
 =?utf-8?B?V1o0TU5sMU5qbExEa005TEJNYWZLK1FNS2xwYjByNDJxNUJsUCttcnpPN1JI?=
 =?utf-8?B?NXZtaUJYcmZ5K1QzZitrV3FWQXZ2Yk5QdXdoQU5Ia0NOSFlGdEhnU3ZneThr?=
 =?utf-8?B?S3JML21ITUpjUHpES2VROXZxVmFPYnZDeTUrbmo3cEtQUnVlTDhYWEhmQ0t6?=
 =?utf-8?B?bTBIMzBJMWJSLzYwWmhlYUZ3S2FtbXpoa3pTV3ZPZlREQnFOYTl3c1BQUGZa?=
 =?utf-8?B?dzdlZ2VCT0F2b0Z2bmxZUDBOUUkwU2tURjFmTGxiNWpqMEk2eURoYUY2a0hN?=
 =?utf-8?B?cTRyclI5YW5BWUdiUk1BdDR1dktIOUI0bUdieVBXTlFKczRMK2grb1Q1SXhD?=
 =?utf-8?B?aGtKU04vRHoxOVFDYlI2Y2dNME9zUENSMFpvUlZwSnFkeU0vdjlGOWlCY3Uz?=
 =?utf-8?B?b2tmOWR4TW42Z3BVSExFYTdENjY0WHYvaENBWUI0M0tMMWdkYzhjcHZMRDRB?=
 =?utf-8?B?UGFVUDFGVGt4S2VNTDVLV0NMZDdnMU1ucytxZUZubFA4bWdSdWRaWFNEVWV1?=
 =?utf-8?B?c2o4K2srYUpzRzhSRHRQUUtZU2pOc2JPZUs1cnB2aEUvank4cjJKWVJJRXVJ?=
 =?utf-8?B?YXhMWUQ1ejh6RUJuSlBkZE5iaWVzRG1LalExZFBrVVJoU0REbWl2eUtIanNJ?=
 =?utf-8?B?ZWFFOGxUTUxBaXRORFJ1aHdYbTV4UTZOdDFyRzRJeFhUWnpFcFN5S0tmd09z?=
 =?utf-8?B?Y00wNExlNG9qS1kxUFNWd2pYVDQvUkJuendab213YkhONU00QW8yaUkzNnB3?=
 =?utf-8?B?UWhGMlI3M0pkN0ppaDBWY0NGT2RueCtrSWwweFhPb2dBcDd1dmJZN2h6OUtl?=
 =?utf-8?B?UVhkSElTMno3dG1XWVhtS2ZtNC9YU0Q0SExwTzBIWmptYUtRcVlJcHN6NFFv?=
 =?utf-8?B?eXNkUkMwMHloeUVsbG85NG1mdjlNTmFKSzF4K1pVQ3NRVXRYSnZCTTZjRWUx?=
 =?utf-8?Q?+BEI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8429.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f315694-9c7e-4de3-1140-08dd4a661ef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 06:34:22.2651
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9OZglDY3hrpFaKAhjKv1PWxy55ODTFODGw1HK6/2UI/kOBMKMAkur68Cm1vVYesHQpfEOd1fhX0uDhwWldbW6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_223428_653212_449B71B1 
X-CRM114-Status: GOOD (  18.20  )
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWNoYWVsIE5henphcmVubyBU
cmltYXJjaGkgPG1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20+DQo+IFNlbnQ6IEZyaWRheSwg
RmVicnVhcnkgNywgMjAyNSA1OjM3IFBNDQo+IFRvOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5l
bC5vcmc+OyBTaGVycnkgU3VuIDxzaGVycnkuc3VuQG54cC5jb20+DQo+IENjOiBsaW51eC1hcm0t
a2VybmVsIDxsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc+DQo+IFN1YmplY3Q6
IEVEQUMgb24gaW14OG1wIGFuZCBkZHIgc2NhbGluZw0KPiANCj4gSGkgU2hlcnJ5IGFuZCBTaGF3
bg0KPiANCj4gSSBoYXZlIHNlZW4gdGhhdCB3aXRoIHRoaXMgcGF0Y2ggImFybTY0OiBkdHM6IGlt
eDhtcDogYWRkIGRkciBjb250cm9sbGVyIG5vZGUNCj4gdG8gc3VwcG9ydCBFREFDIG9uIGlteDht
cCIgYnV0IG9uIHRoZSBzYW1lIHRpbWUgdGhlIGRkciBzY2FsaW5nIGlzIGNvbWluZw0KPiBmcm9t
IGFybV9zbWNjY19zbWMgRFZGUyBmcmVxdWVuY3kgc2NhbGluZyB0aGF0IGlzIG1hbmFnZWQgZnJv
bSBpbXg4bS0NCj4gZGRyYy4gV2UgaGF2ZSB0ZXN0ZWQgaXQgYSBiaXQgdG8gdW5kZXJzdGFuZCBp
ZiB0aGUgY2lyY2xlIHRvIGhhdmUgdGhlIGNvZGUgY2FsbA0KPiBmcm9tIGxpbnV4IHRvIEFURiB3
YXMgc29tZWhvdyB3b3JraW5nLiBXZSBkb24ndCBjaGVjayBvdGhlciB0aGFuIHNtYWxsDQo+IHRo
aW5ncy4NCj4gSWYgdGhlIGlteDhtcCBpcyBjb21wYXRpYmxlIHdpdGggaW14OG0tZGRyYyBhbmQg
c3lub3BzeXMgbWVtb3J5DQo+IGNvbnRyb2xsZXIsIHNob3VsZCBub3QgbmVlZGVkIHRvIG1lcmdl
IHRoZSBzdXBwb3J0IGluIHRoZSBzeW5vcHN5cw0KPiBjb25uZWN0ZWQgdG8gdGhlIGJvYXJkIHBs
YXRmb3JtIGRhdGE/DQo+IA0KDQpIaSBNaWNoYWVsLA0KDQpUaGUgaW14OG0tZGRyYyB5b3UgcmVm
ZXJlbmNlIGhlcmUgaXMgdG90YWxseSBkaWZmZXJlbnQgdGhpbmcgd2l0aCB0aGUNCnN5bm9wc3lz
X2VkYWMgdGhhdCBteSBwYXRjaCBhZGRzLg0KaW14OG0tZGRyYyB0YXJnZXRzIGR5bmFtaWMgZnJl
cXVlbmN5IHNjYWxpbmcgb2YgRFJBTSwgd2hpbGUgc3lub3BzeXNfZWRhYw0KdGFyZ2V0cyBERFIg
RUNDIGZlYXR1cmUoZXJyb3IgZGV0ZWN0aW9uIGFuZCBjb3JyZWN0aW9uKS4NCg0KQmVzdCBSZWdh
cmRzDQpTaGVycnkNCg0KPiBCZXN0IHJlZ2FyZHMNCj4gTWljaGFlbA0K

