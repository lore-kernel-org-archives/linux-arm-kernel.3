Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B49C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qn1loSK0SSrzQIVc8M7Bza2QAqmOtCyLrdMdk0NXNjs=; b=cKKmxTFXvttcJ30f5D+L0ZXxl4
	6pKRJw8H2cXZG9ausuTk/kncANsRb2yNTclxjXchPagPJH1Z2BCicu9DBdyg4txN+tUZwCBse5bxI
	cggpkva1fc4+GHTJp6vT3xfsSNz6GYgL24s/zH7htKi633QcpG0wUGAhekFuh90qRU+HnVSm4Rp/H
	wBNRR1vaPjlfmap9nwHAdx5bEC3awhkPbpPmAhzchiw/73KFqtvRWYHwNPBqX7IBAC0ZQRZpnd7NJ
	4EUzdJ5uNO3subCoz46gt6Fdn7Hb+7zjUgua4ff4nyOfMPu3o4qLxf9TzVxk8g5xzyf0NNLSZ140X
	EYO/gcuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoG4-00000005DRn-1Xse;
	Mon, 20 Jan 2025 09:39:48 +0000
Received: from mail-westeuropeazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c201::] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo1n-00000005A7U-2DAn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:25:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyIPpia+cvk+cKaibuGItPTikwQkZWhzwG2ktph5FmCt/1s8eS/pdEvpW5ubB6ZTXhwresfLnnpdJi8W6eXDK1nCoe80/KhQ++FptUU7RXsNBwqwsaPsHSKV0kKlVtaAzSUMs833tIG8DMypTo3+4utuuE6vY+voYR+fT2K3ckZQL/5LSjZ+tSCYrVDVHERipHyKk3eA8bCvyzZNc6/cvVNJvkQBStQlZ5Bzu68ruXfo7M9/ZLL+kKdMb/LOuwXympbjo6zT4lGE0Wb13f8d+oQwPy0yFYh8voqJkLMXtWJdXSjBr0+4qXvAVPT9k3beDAV4MmL2vviP3aDe+TGJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qn1loSK0SSrzQIVc8M7Bza2QAqmOtCyLrdMdk0NXNjs=;
 b=gcu3mWNTGdnGWNyuVd4P/r+eyj/8jqIMheHpD6qR7sBD2Oyh/m1nU4UfEhdX0mOHT6cztAbEr47jpKMGyRXG7fooyzIrNQg7sKK93p7PfByEYqtiiFX7Xe8Ks5srQ1AltmIW3yFmyjpQJ5UNByof85NOMeK7fEP6/GRIRresrnmmYqEL4ORZRqeTvzM6cBgYMLjIbYZD+RRSbiIDvLYWGulbJ3OtSAynkjCpmLiv3y6Hht7i6eKarqPC/6Cp2wWjWKWJFMfpTkeVeZKBKRi/k0w5pjvYcOv1BpUxUdWQMxBYT6XblHigs3E41+b0Bn0ZYUjptGzaHb9twijceTP7ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qn1loSK0SSrzQIVc8M7Bza2QAqmOtCyLrdMdk0NXNjs=;
 b=TdYOPlevvvOWerZsKLL+X0e4sJAD5qFUahrQIyC/jF3TuwiStmQ7Ogkl/AriWTqwZuuq/YPk+F8OYtlkN2lxP81ViPlFOJqVCkjJoPQ9RHzYzG9pXnj34SrowqUjd0lQ87pWwSkS7771339fInqb5DXNf+dn9Z2hIAj8aUFu2VWc2Fnc4qH9a2UJKnZqPdF97eBZIXTeB4dB1vvEMVdRVE3o4OCsfXc8q+ZJH3Efs/yFNag2RBNtilaPsvYnllsW6g6YtUYwi9djDSk9gegc9/Jub1kwUbmLSCEouBhtmNRITX8svYkmKELiO8LY+NdiSTtvJzrNdJ1x2r3v2/U9qQ==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by VI2PR04MB10954.eurprd04.prod.outlook.com (2603:10a6:800:278::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 09:24:57 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:24:57 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Recall: [PATCH v11 3/7] arm64: dts: imx8ulp-evk: add nxp secure
 enclave firmware
Thread-Topic: [PATCH v11 3/7] arm64: dts: imx8ulp-evk: add nxp secure enclave
 firmware
Thread-Index: AQHbax0shBnBOnEMnk2BOqtCQPRdXw==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Mon, 20 Jan 2025 09:24:57 +0000
Message-ID: <AM9PR04MB8604B792B8BABE64544FCBB395E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|VI2PR04MB10954:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 654177f5-c1d2-4926-3282-08dd39344e9e
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?p2HV1TJ1GzUtv+ARDoJqokI2j9ByQdOfUhf4TCYYUE9jCHyDsNKRUwvRb5ki?=
 =?us-ascii?Q?qp7HlimdVw5FoRKTBvE/T/lWuaio3fr73oKWxeQtIxq6L8WUE20ry7vLY5oE?=
 =?us-ascii?Q?ZXKGldMRM1dC0oIHU7WzKZxWM4S/WqkemaxH+9ze3nKuNz4LBBqCwDKyV24u?=
 =?us-ascii?Q?v/NjuZQaLvxolawdX2Z/selDeFwCJoQHhRPv3lzOHV6XEEFzAQ8205S10AeZ?=
 =?us-ascii?Q?PUeRHNNebI0dVG8LF45JglxTx3GBPVHtso0ztpTuesDdZ7IPWaa1P+y6Z4wB?=
 =?us-ascii?Q?0IuMANaBA449omUn+j7VhcvV08m1VuSo2pBL1igSdyutygR9CS5NhNxkZXvi?=
 =?us-ascii?Q?lrWYz35tdaueImKVf+2iYO2rF+f4apqXSqLJzmFh1ajkmiadlmXq/B68wTeb?=
 =?us-ascii?Q?4Vhn5pFUq975w2dbkhBSybLR7lXwsAuXbZMOBT/KkEmIx7yMYU5VpormOFqy?=
 =?us-ascii?Q?jkIfHoApYwQPV4ln4e6jybmVFNCD5CUSR81jcrXqzvnr0e9Vh1Hj9l/GCBdG?=
 =?us-ascii?Q?AI1J0NY9CYBXNKXwoeVwMiZ7R3mUHOFLfN9+DTtWSS9nTVNbh1pl8cto5vGU?=
 =?us-ascii?Q?MQLp7PFu4RBa/UVQxc8DrnKOK49iij/iTkStE3isxEG9riUGrJ4o8FIiPN8D?=
 =?us-ascii?Q?hDN1JS6n6NnEz5b6eHuipsRgcqZVERHpD0ep99G3za1CTjsWzdKS7a98eody?=
 =?us-ascii?Q?zfT3ckOxoKF3ZGWqQMJSatTF0ndeZNUuR11wfnEkpaPAlCSrr76YIyVIB8qG?=
 =?us-ascii?Q?K/Zw0Gf1Xla5553SiA+B/JGb1+DypvoUVV9T4qprD8vS5ibKxUQj8n+5avO3?=
 =?us-ascii?Q?yJRhakrlJWqgXGeJfu9F2LNF4l5f9MgdCMF0ihRWqa8cyIB3hbsa0eynEKFh?=
 =?us-ascii?Q?c1ANjWY7ym5Pu2nfsDE6l6/e2xlPnemn3z3PqfQmaN/9Vu3OhUjn/6Fas0fX?=
 =?us-ascii?Q?sfcyMIdZdC9C1ocUMXztPMrsE9phHuAhycUp45rQTRUk7tAF4kxHBo+fyo0T?=
 =?us-ascii?Q?UQZN4DgVRCStYtw/1V/W7FqbZseRMqBOffIrZMjJIJPwU6UohwnH95x5cpEv?=
 =?us-ascii?Q?pLs3SyxuMgsdh4x4RAcjEoCp6k9RlT/vuiQu/RimfHb8DLXd0CGUD4e1UWR7?=
 =?us-ascii?Q?i05e5FwquQ9GOSnYjAW7+VesYAmK1A3egYoc5aSe0mPN0g5Yz3+3NDOkJOJJ?=
 =?us-ascii?Q?YIR6oY4jFgKc4U0GUhGpGrSv2aVaL+H+9sIO52QxqNUckvjRgnpLtd9zsWGv?=
 =?us-ascii?Q?YY+86RTj/UxRMC+jnPmZy28xrNVwenshTe/zcISNAp58T8C26OFny3nvn/vO?=
 =?us-ascii?Q?5ZbeWaKLbC9gOhQ11d/+QfuSll9DZ7p2jN5+VRQ5Kwu1rbwqOSEgdXEeqrIj?=
 =?us-ascii?Q?iZvW7ADiICH4UxrGBE/Mcl26yN0LJWq4r3/MPfxQNNCJxQY2sThrta12JniU?=
 =?us-ascii?Q?p0y2M0FfF3jTQCYcS+YsZ1Q/ED/ywMqv?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9OZBP5jm1N2uErmupBKTPuAYTUyyCjPr9lUFlQlccsj2iL2PI56uDehgSMem?=
 =?us-ascii?Q?ajHwkJI+ddbu0U+A/tkb6qddmuFFaAFgUl6GctJsA3mkFfStmogGk/XFdSkE?=
 =?us-ascii?Q?hGsS4lcCkDGcedlnCb/m5EQNlPF2VZ9exMwfaFJsvAvccNeLEPvUZERuYxGg?=
 =?us-ascii?Q?9S+iARVIcFCF9ixSrviHQbHHv/GCeiOdP8VWd+Qk5v79QQXXiEsSYGHrwjcH?=
 =?us-ascii?Q?fK0dRPez58RBrQ73UJIoDgi5DjOkYWW3IWcDcVofP/8dRtDjEhx2BkyNNPbB?=
 =?us-ascii?Q?YsBNiFdKX0T6dpx+urTqA1g7FGX8jdkpa3j/CsOTANnVvFsU2nHt+gMjQ0C8?=
 =?us-ascii?Q?/cK5QDWRcdA0V1wecZyhx2F+o4p8vCUOh/hiP0BP17nuG9LkWVjpZodYzjRT?=
 =?us-ascii?Q?bHrir7LmgCgQ64+vE4fvp/pEcA3MTNtYtPtbj5O2wCPpv2ZxMUbU+EtLpMdQ?=
 =?us-ascii?Q?lIyEAFmKkG/GbUeiGfhF4EbBa4JgV3wbC3kAkJRzF8+8HqqVohkdhfX54aUt?=
 =?us-ascii?Q?0xGnZ8LLKWi0Eaj4LrbDS3CW9hO06J5TxoEpQo4IT2W3XcEkq/exGhFt3Iv1?=
 =?us-ascii?Q?Mg49Td5mG2CpBGmjfc69o3943NOe1rfo9ZBRSeWZyhDOyYxumI0UE4ay5QmK?=
 =?us-ascii?Q?WOdC7U2VwpyivGkAg9pLpdEQtRjJd1JpvlDatCXrPZiHFy22Lcojz7lrt5L6?=
 =?us-ascii?Q?FszgbFAPu/6B36GxzKB/RzHQFKY9DTSJZ4qLNqhoDdp152Ahyj4rdL10ZblR?=
 =?us-ascii?Q?GoUwMoT5rovH7DckP8A3tvw6YWAl3GPE8PS2YuzHkogzvvvbfm/fWgS57jsT?=
 =?us-ascii?Q?/E1eXDyZX/MSa/p5x3/S62lm+F4RLXRHdC/L6HLNjWe2jStgFGsbSqMihkZy?=
 =?us-ascii?Q?gHF7nsJaO2uRWZaXgI0yp/NJd2MlLBHNxeuPQJEAbU8bkOHn2Q/cv8oNeszO?=
 =?us-ascii?Q?rlrl2TDSNgtxLho3LIKSCQqiUnaLnrli4imm3gbbYjDS0zzpQf7Oq59lbD5m?=
 =?us-ascii?Q?NJh5uCA9aNiVtD9G0doljqF32oEmqbnb71P6u/MntXYT/gX8FP3Gn1mDiqtb?=
 =?us-ascii?Q?pVn9klkLxKQr8Nr858q/tcpaT6wuuiZVyZCmhVPBjWSiyNBfenx2739C3dDG?=
 =?us-ascii?Q?NGmmrqZ+baSXbx6vPf36CmfWSNZsmGiAJht3d68jDKc/lA6qaw6Lxq6hC6DS?=
 =?us-ascii?Q?sP4dSMkCE90ME9JOSgS4Rb7viK/Op4rrQQJD4aU7ktNa3OjXSEvKkwRlbdU1?=
 =?us-ascii?Q?8Beobdq2ItVH+aHL4wxsVjhfamGL90nRO1ZZQmKiyKTK077bxIT6L9wNi7hQ?=
 =?us-ascii?Q?jkIGWdhTbXehT/77i4vV2SL40FDXk2ufWUY24t13bXZDbb5GgJQAwNLyKyTq?=
 =?us-ascii?Q?vmJIQWJxUOZY8er7enEXyH1L5ofT+J2tyWT+Ytgq1m6bxzGVooHgACQ024yc?=
 =?us-ascii?Q?zt60csJF+C4WI+adKcWYuxS0wdmY6dtgVYghWUDXiMIMzjwcbimnR1szFy5k?=
 =?us-ascii?Q?0DK6c2qh9xU5RcLhrdWyfJyajcwJCow0fyPl/QGZS7YWu2j9sRzFuzcXRiOn?=
 =?us-ascii?Q?bnf28hVdYY0JhAY0yOOHn1bctflPoaJeFk3jakkB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654177f5-c1d2-4926-3282-08dd39344e9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:24:57.6535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A90m9O9IHyc9T70/ZP1mRq084403rDjgEcf5t1bhw4v+Nu5gtvqrUOZoqTQwWFcsbwJZbaKPLnQDgPRIP5n1rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10954
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_012503_859663_8786B75A 
X-CRM114-Status: UNSURE (   6.48  )
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

Pankaj Gupta would like to recall the message, "[PATCH v11 3/7] arm64: dts:=
 imx8ulp-evk: add nxp secure enclave firmware".=

