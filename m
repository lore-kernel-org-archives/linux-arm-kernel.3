Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF973CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 01:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFw+lw0iImvFiJqZhwThHkMmMSFoab+JjP06nNrTTnE=; b=47FSRsrOGSpIcEmbkpCpoDl0/r
	BPBnrz2UBG3/8NTbKFV+ssUmxxLipZLGWiXO8vaJGZ7RmrSy5ftM0z07lmQcOPFVZzAmosdZElCPr
	hHfiJOh/Iry/yqLtlncRxPpajHSG88/NRGIBZ9e89WI72mna/K5HUJm5cDIeb02kF2mjgzA6FXYqR
	jXtvjMRk3HwqICqsZtL9ZI3Up3MVfICJHL9DxLCgkkxX4uBKmF+JqJdX6rkQmPvD8F3SMpQp+DAYg
	wEODwFr9RlAD75LZm0ci762iRPPpjvrgbtbarCt6b4PGK3yAMTOe6ZwHYLdTgKb9Pty7JO2kINB/Y
	9qxLshXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Yui-00000006K2e-3kep;
	Fri, 17 Oct 2025 01:05:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Yug-00000006K2W-2y5X
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 01:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NFw+lw0iImvFiJqZhwThHkMmMSFoab+JjP06nNrTTnE=; b=n6b9xDlz7Cce5gCHg2sDQH+MZU
	Y1ZYH9d4s9F/iruyggWtFOM254g6ZhsxgsNhVeeRZnw8I4bpvWEBs+q5cfEwF2O0r1l9Kyv6/3xqE
	4yimgD4F6Ia8fmAlsRuFfME4GCYAwTqgIs1KdZWofKgxp3KY/okJ8SirswImisjnow1n6KXC7sDtj
	2/Oxlu5gwLERSRP+dEmi9KwLCcoUpG3hQoO/LUen9Ft8Gyc98aef3/Lfk5b/LGQXM/HiMnrqf80Qr
	lVdeqwfC03vv4o6wiAXleRnT1QwOwqV4TBG5iNyOu5v99pO8PY7QXRdYGLUEhps2tTw/oco0/I0Qs
	7kM5YlRg==;
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YuY-00000007Abz-2KU6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 01:05:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrNkOcjXZbZAcsT0itUEiA0vm+m9A4zV5tyIPH9pFhjnyJ9wYg6ZNZFkMxjKgLkMvqYQqe3WjO7XDwD08E7OMq9YOnwm0g1a5FErLEpf72uDuDDl/DEJZB1UGT9koqnnuF7NZHBgUf8eGVrVoiLZ8BMheD5fJmNDzb+KBix1Qu64gWU5GKfl34iOJCzQ0grSTXDIhlwxHoHpYi42yO27vGdVaMTIyMa/mdJiOo3KaKd4csGGoRfQX4m+U3ic3X1UGYIECf8FMOJ970NUGnyDpF9iy7OmBZR6sdKFvgAZDvSf+OXosNSMcWS9rWkYoc2ssBGM/8zJn4OFL7cTnsFa5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFw+lw0iImvFiJqZhwThHkMmMSFoab+JjP06nNrTTnE=;
 b=LDWYDz3eBSYRDSpPw/XVKs4ddeoaU83aglOgHbeW78pSjSK87HxMKgPoEZ0lpbbYPNGBiItsJPwQgkA/53NThYHA1kwfVegeepPA71XdXEdnkCDoDimsgrfmkdJS00HtaX/5d9+divhTji/aIMdx8ZAoM/K6k8DSI7HrV+P9AiDRRS4VWzvqGZsaOnCWSVyzxcHWXsjA/9xD22F0oUBsA+OOO5NsDMUaslEDOxU/ZLKG6xGdx7eV7H+Bl6F5SFvQUZ3zwvCbW7UTPUuI41bnxtzif1swerShAjU4U9hWxIH2Otpf98CkbxXm9S7MQW8ThoetwP4itFoCRTVbCjmz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFw+lw0iImvFiJqZhwThHkMmMSFoab+JjP06nNrTTnE=;
 b=SBmPWDWbhN/XLsUKg2ZH32GpKDo8Xhx0BimuMMVvsNnxi4kEsjmfcXv9fjDA3dkcZl5eFq12/3Krmm2wdBobrTKhBmYIazz/jlkRUW68rIWrm+b0EB687x/5EjEZGVqh73ldDdG0uhkG/G0Yge9yxivs/rrOUMOQIPKnPVUzAV8j4x3qGytXEcjmTtf43NLMCaQrNYotKaQLb/FI7CNWobENvI2B2fFXKiqixFVkb0kEcUDszFx/knVZfJlRRa1TMBmLU/b+ACgyRUcs72Ybk7Y49v+lhtXJxh+JTGPBnMT1WEH9ICZcC3tr7KnEHeLlJeLPpHJpUwXawzhFww60Yg==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by TYZPR06MB6076.apcprd06.prod.outlook.com (2603:1096:400:33b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 01:05:06 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 01:05:06 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Colin Ian King <coking@nvidia.com>, =?iso-8859-1?Q?C=E9dric_Le_Goater?=
	<clg@kaod.org>, Mark Brown <broonie@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH][next] spi: aspeed: fix spelling mistake "triming" ->
 "trimming"
Thread-Topic: [PATCH][next] spi: aspeed: fix spelling mistake "triming" ->
 "trimming"
Thread-Index: AQHcPrHD+qVep+JgCEyp5ortgF9RDbTFhaRA
Date: Fri, 17 Oct 2025 01:05:05 +0000
Message-ID: <TYZPR06MB52031BFAE4FE115EE986FFA6B2F6A@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20251016153000.9142-1-coking@nvidia.com>
In-Reply-To: <20251016153000.9142-1-coking@nvidia.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|TYZPR06MB6076:EE_
x-ms-office365-filtering-correlation-id: 86ce1b5c-a39d-4eb2-05f4-08de0d1935b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?9rM2XhEz1fROR5mtH2BxZ3Kjds/uv/3fIINufXmqpTZqTJwzcb+zUVfzbS?=
 =?iso-8859-1?Q?a6VpTqGh0MLP7i0I67SWLit5oRIfgwX6eqKAl2V28Fu0O6A0Im8bo0L0Vk?=
 =?iso-8859-1?Q?MREsp+80O8PspDiMTGsA0bRkYEMSLwRXGhvyWYLD6FCT+hywpXMJeO3dPQ?=
 =?iso-8859-1?Q?Kr70BVezkDRsuhNB98YdaVclzy7FMW51YUi9IjlB7Uiyiral8vVTwnYlgE?=
 =?iso-8859-1?Q?t+Sxv84MFHl3f0MDIY7NLsew3NJiy+kKWk+I7XxZfZpVoq/Mt1eIlmAl+F?=
 =?iso-8859-1?Q?FenBFxlDp9/2zek1K9MtZOnkbhPS3vQX/fqq+JjVeu8qbildNoVg6nPkhk?=
 =?iso-8859-1?Q?nHVbHXFXhIM9TkYH1je/30FMD67NEWr1dfBL6uPE9YyWsiAvclqFuLRqmH?=
 =?iso-8859-1?Q?juxcqQ+UfMj4LooFRM7Ei+3raDAAZgykrqdqf5qbVbZYrM8DJpUNrleTqo?=
 =?iso-8859-1?Q?x2+RpjxzMxUZf7U0rmAp9D/IG6w2PHPxjbcv/Rb1xdGIcOMYyGJboV2dN7?=
 =?iso-8859-1?Q?6JBcxqS+qynK1jl/rBvdMSrw0k75isc5IJNThnahKRbrVHF85gl/gKWV1+?=
 =?iso-8859-1?Q?DZu/704vKmbdIP5uiRG5FtxPUEUckRrMSVn9cahr/Hj5//hnJDyEwoIZVp?=
 =?iso-8859-1?Q?0VL9u3c4XWsvSZfApYI4YktBuMu9qnbxxqKQsmzDUl8pfMMmZ1I+ZmfxjL?=
 =?iso-8859-1?Q?ozvZDFWoOVkp34NxMrJJzfclK8cIui9yxjnDYEQzatP9rnVzpp6U09jbnQ?=
 =?iso-8859-1?Q?SaPEv9lP/mT/4V5OwycobffIb8u1jbB/W05MYRVsR1W/Pykh6HCQnwXY66?=
 =?iso-8859-1?Q?/Np5gNbORcFwChVbm62AoIMsmL7A1WRInFUUfwp2c9XiNHx0v0uaY389Yf?=
 =?iso-8859-1?Q?3Gt8LBEbyt3f5gOIQ4+SIkxIcH5HjBWHWCJ3I7WcnJ7FJzv0ynolrOwLm4?=
 =?iso-8859-1?Q?+oRKv5snppVwSbjYkaN+4eKyK5LuiuC/q1bNVByEhvyA/ZJ75GEkurKiyj?=
 =?iso-8859-1?Q?FvbtnkEvT1/A5YwUMeat0Gm6mAGPZkkvDmW0cmf6oK2oRrBxiC5+L8JIiX?=
 =?iso-8859-1?Q?6bz6nFmEynriojUfdMzSm0s2do45rl2Hi2FhrkXQIMy8MBQf0ydO3oPSSd?=
 =?iso-8859-1?Q?DlZAypaSze0orow8KfmCWfYz2NJDlt902mqtQ41reIsxs+1vTPF3tXnXMS?=
 =?iso-8859-1?Q?mvLMmEpflb3cI/dKjSrYAXo9jH9LxqPqjHd/ZHEFwTr1c+fJ/EWcAFfXAw?=
 =?iso-8859-1?Q?9ld7FF4CLciKXhgtFqOGvCejSoqNUiGOzLzcX+X2sTzN7O+UAORoxWR1xn?=
 =?iso-8859-1?Q?FvJvfRT3vosNaTfLytXhY9mUkBDB7VspYZTDo2zKTPXec2S/gtRE1mGzYH?=
 =?iso-8859-1?Q?mU7Fuha5aq6vyMkfd3EXINAJN8sUTaSpjZqWSmpoTPjvrkw3cdvonUdzG/?=
 =?iso-8859-1?Q?avnJjsbk8QHc3CbtrnHoxm8h4hRFGUuc4lfU/1OUcy4QoHZBPqB4OYylt1?=
 =?iso-8859-1?Q?jeZwQMFmsDiP4BPYBYe7I6+0cnWRGuotQgFMqLFAfPi1TzUkZW2RI8hgwJ?=
 =?iso-8859-1?Q?wW0ZQ8trPyXUP6ZaMKMuHA9d156g?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?p5tzW9W3GVqq+V7csUZbhoe7joUTuVxLfYvOFcQzwRuzZk0mrbAoly3e/H?=
 =?iso-8859-1?Q?qMff4QnK6TLJ6JjAF+ffuPm6aMQViCXJiu3UheECEuEBkRSiDpJYH+21aQ?=
 =?iso-8859-1?Q?3qODirH2eUjDaXI7W8G6PORLZSB4YNECiQ7hvHHT9zzo3tw0k9y7HmMrwa?=
 =?iso-8859-1?Q?ohs2LQEVEp4jz8zFnjqUinE9XIpz5YPhGoIqdzDPqI2L2V6fpeX5DnFlAs?=
 =?iso-8859-1?Q?RNmh06TmedH2z3OVe0TADeSjikolNPRgEvnCuSi7CFDSqdSTPCA6QD/gIV?=
 =?iso-8859-1?Q?E4fX//glFTUwq5h6eOFp0TSS0Y0guWXQXMbspKemmEEuSTvsJqIOJYOqHm?=
 =?iso-8859-1?Q?VA3GCrn2zT1dUwRFWhahDyGPg5l1sCdhgGziRZy8xR9bHlpSqpgkO/93h2?=
 =?iso-8859-1?Q?eGf2ZFbKoiieWrM3CLJwHBxRnM11JFeM/2esnO2uKY/3Gw6yTNXP22BRQ2?=
 =?iso-8859-1?Q?GFiazbXyIoxsFdGyfakwmtpj+IuxVFsgx3Em0Sd2JUGsoFVltQEz5JbOFr?=
 =?iso-8859-1?Q?rDgyz/rIwhgkFBMAKDlgBXEyM9JAZt2RCpn5rbiq4MaHu6ntnROPwvxIeZ?=
 =?iso-8859-1?Q?8c1OrCCrb5F7WJUtao2gO3YNv+V2OQAGUmSavNCpqkyAtsoK+D4v8VEF+U?=
 =?iso-8859-1?Q?oLPuSjQn4IVJeC5H/aZ6uBgf1jPt4L7MhsqPEMPMlE6IQuwsgkUGdBOiIt?=
 =?iso-8859-1?Q?PhBCiE708CY34GlAZ7Y3KBIJeSf0i1MUMui9lzzu1dbKA4i5HcEPJ0RIrh?=
 =?iso-8859-1?Q?lVPk/ZiLzWWIY0HLd5+ty4tpyecjivWhQz/FfU9JBGBMEzhdHh3b6B8Xfa?=
 =?iso-8859-1?Q?4Zen0W7tWRonUut+LnTWd7/RVSrn8g4pR1YcyIiNhztuneiHQvwzgauI5k?=
 =?iso-8859-1?Q?Ql23w4IkegcMLJ+3aYt4H3nVgBIY4n/eicVvoi5VU8TaDQs67sAS8h/2LM?=
 =?iso-8859-1?Q?IuiFYaHifh0omS5nwrAF/tSnVQtXPejw00RfxZV9yccSyAPW5BaHZb/q/R?=
 =?iso-8859-1?Q?iHlV+ZUPUgb7HuHNDB3WnQf4mIQBzDhDuDgqSgHcG2HbKLjEX2EWSkA1cU?=
 =?iso-8859-1?Q?sjVy6CG0pXvHmc0IFOTfk9I+zi+i6wLWkoC+o0BKsJd1kesHa90a1M6KDF?=
 =?iso-8859-1?Q?5+tNBeOIqYq4cBAX8v+0S1s9fk49KnYv6dFQij1Y4sId34CMmq/ujcDpYF?=
 =?iso-8859-1?Q?c4gJdTFSaRMDTk82nL/O7liJFL8p+mH9vxmuE+kvBpPoxmfBw/U3sbMiPW?=
 =?iso-8859-1?Q?q8XATKv9yjLf9mBnSRh7YAbBISOxmg0kmuwLPdDfkWh7zRtdL6brytoWmd?=
 =?iso-8859-1?Q?w6Yznfcc2G06HE1DDvEZv17OYCFn2/UHeJ9ymyJLS5c5dAl2qpfSaepQBQ?=
 =?iso-8859-1?Q?KbkqyKCW23MUAA+4Yu/VKimPXXmv8oIMxzkESHhheEgYcCMHfQ4RbxGnUz?=
 =?iso-8859-1?Q?btDTtr262F6AZjl0p0VD7caxiKD80FrHL1ZrCk9WWEx/otJT+ZaQnGbH9Y?=
 =?iso-8859-1?Q?XML5QgmFNJe9f6tLieIiAdZLyLcwSiofBbCvuO+wkOHi+riqduimtCxtBb?=
 =?iso-8859-1?Q?Yl5OXpiEtwOJ3CRzdiZ4CXr4Rw/RXWRIa5B+Ff9FLXbE7hHQ5x3v8UgnC3?=
 =?iso-8859-1?Q?4dcnOalrFNccDbOsXYFR7EexZg+gbL4/7xLqTmDzLEPS5vPifkDwJtMw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5203.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ce1b5c-a39d-4eb2-05f4-08de0d1935b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 01:05:05.9016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6vYEM0qk+NtXWu6uZ1JccNkKVznrXZQuY2GJSLh6e8WHV30weKOt4p4RWHZWALefzF8YGOwUZxmh76+lgqzicwKYSM3NaWiBVfetr7n0v6I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_020539_910985_BB60F344 
X-CRM114-Status: GOOD (  14.01  )
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

Hi Colin,

Thanks for typo fix.

> -----Original Message-----
> From: Colin Ian King <coking@nvidia.com>
> Sent: Thursday, October 16, 2025 11:30 PM
> Subject: [PATCH][next] spi: aspeed: fix spelling mistake "triming" -> "tr=
imming"
>=20
> There is a spelling mistake in a dev_warn message. Fix it.
>=20
> Signed-off-by: Colin Ian King <coking@nvidia.com>
> ---
>  drivers/spi/spi-aspeed-smc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20

Reviewed-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c =
index
> 0c3de371fd39..f3a7189afd51 100644
> --- a/drivers/spi/spi-aspeed-smc.c
> +++ b/drivers/spi/spi-aspeed-smc.c
> @@ -539,7 +539,7 @@ static int aspeed_spi_trim_window_size(struct
> aspeed_spi *aspi)
>  	} while (total_sz > aspi->ahb_window_size);
>=20
>  	if (trimmed) {
> -		dev_warn(aspi->dev, "Window size after triming:\n");
> +		dev_warn(aspi->dev, "Window size after trimming:\n");
>  		for (cs =3D 0; cs < aspi->data->max_cs; cs++) {
>  			dev_warn(aspi->dev, "CE%d: 0x%08x\n",
>  				 cs, chips[cs].ahb_window_size);
> --
> 2.51.0


