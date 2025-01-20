Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C866CC02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KhWOFope6fTItDDerwL8bOOW18ZcWc2EGCSVX4WnXK4=; b=gF7vmozMFHF9uuWdHPB6UtN/Wi
	QKvATHHy7nPZAdx7cYjQy0h64g5NrSGwCKF0YP2zvzu9FtxoTpWufmY5T0LNncUCVxvTa5czyOFl2
	cVGb+323NwVaNWFog80dTDn2wKaZDcXdTk0y8gdp81ooT7EJpv+EZvEB63AJmx6aYJbHV0N4oVCkF
	TIdr383s5Eq0LqcqwIxebCrQPXGrCfs8Gix6ZauM3b+BqqaWen7wtkSmy3vkzncnzYNM86luygPJK
	xxpuA+ZtH3MsOjwAMhIoSnsGbSwwkMW1ge/lefUIXpMP1i4sdzGXlOkB9w6/gfDXe/HSLLrK4HeHp
	2AKtA8Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoCL-00000005CsN-3cqa;
	Mon, 20 Jan 2025 09:35:57 +0000
Received: from mail-dbaeur03on20601.outbound.protection.outlook.com ([2a01:111:f403:260d::601] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo1C-000000059uN-2lxS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:24:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6yqosaXqLRonBOwGoEoMP/5DXQwnzvuUc8Ciah5uJEpAc5DvCQHvDMW2OueAeLcTjS3bY3IQl7V1LDtQkqbCsIAMgKGZDTaUaWf/N+NCHyS3zK3Tw54wgx3sx20wAD3VtWiwe6IWjEVy6ELCQlhPiEx4Uu1hSqB+m13bV9sqGbSRBtGekkI/5a1/ZXxsep9HnVHGYlbJSYojmnKpXVZIYddTH3yVSKKREWPj64qAGw1oQnULP0xk4EtGiVFx1OYI6h+exuIydAk+ycIOzxfF5ZQD3xm96MjflU2lugSitOXKe9n+Lx0dSRPjtTkIdM1kZA21ffGoUSwn3hJWiyjBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhWOFope6fTItDDerwL8bOOW18ZcWc2EGCSVX4WnXK4=;
 b=bUjNR2oGW+t0eP21WpX+lKJ8azyqtdiY435shKAOWpbeLxPhkbIjJ86NZRMoroxUqvuzXzv0RPfadWd0dhCa0i8KtEQSAVUKFJ+2o61uvE0slRzXVd5w86j7Jl8HDfXogVO2srJkB2mI78jZP3airaBnvQTJEp6SchuA9i+naoD0ZFPnjoLvSgfXT+1CBq0KDSZLNTRMrqbn47JgWYumbusYSqgkveaKl8IqpnsZODBXrLVLO72RBOMohkN9LlBdaR7onif79F+XWspgPbYAMxld6zqODcHAB9kLNCukwYSSrFV75tUQka5te6lwhiMV60gOicyW8bc7ajB0yDoVDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhWOFope6fTItDDerwL8bOOW18ZcWc2EGCSVX4WnXK4=;
 b=jKkQgobeGwVPrehaq5UVyFq35VIu9n6K47yPpHzDXt7XZBWZPye5QEQSfaQ7h1fL+NaIYUnX41YXRrlDlqJJxmH0sCMSJRiWP6wyksiPJfa9jUW7mrloGKkNq5aS1Es0R5QQtdlqQovkY+DTtx2am6OivGzYho1yDlIFqsFTwK4uC1GyT1nYFOSquFhjSh1KBvf95ausC+buhzwn74CwZcu4hgp82TZJ/uoZX4b/TsIWTDNMbP76F2R2uTthvMPD51TyoqZkb1fjv+EecE4KxFqa5NpP7mw9FPJa/KVniQexfhbSNtxABweKGMtK4vic/YT+SbMNqR2zXO1cjBDjnQ==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by GVXPR04MB10731.eurprd04.prod.outlook.com (2603:10a6:150:227::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 09:24:23 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:24:23 +0000
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
Subject: Recall: [PATCH v11 6/7] firmware: imx: adds miscdev
Thread-Topic: [PATCH v11 6/7] firmware: imx: adds miscdev
Thread-Index: AQHbax0XJqxGf8vF206zq7QUdARQ+Q==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Mon, 20 Jan 2025 09:24:23 +0000
Message-ID: <AM9PR04MB8604E64C3B991C46E677123E95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|GVXPR04MB10731:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0aba4d6c-5765-4ee1-fb8d-08dd39343a14
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?lup0ewY1fSElptGGzWe5zl7YScTjeCie2MNef6+GXMtCnjf5kvP06hNOiMR/?=
 =?us-ascii?Q?G/BujvsDW406yi7RCnO1kvf6/RGcyWOyOx7+u0MpLGELLGEdipHsanHoKce5?=
 =?us-ascii?Q?wslijPn29UY6J42zKY64dyVKPiZKJUwFXorXY0Ih5XZU9mFor4aDzsHbp9RX?=
 =?us-ascii?Q?e5/tZ+NxWTM2faopnrTBRfLhBMW56dVF1VgIuHjxJP79BYLhCSM2gZy8dfBE?=
 =?us-ascii?Q?AFmPDc3o7bwt/2/JO/Jt6qGM3YBUSWQb89jFOWo1udorjHoXbeZqYN/1FuGc?=
 =?us-ascii?Q?Qzp6z2b6OSuI29bZvbdO4ipvjhbg04BpftmGcDFHxJ94ZzZQtM2yB8aVolh2?=
 =?us-ascii?Q?CCZE+85XYksG7pfzLs64lKrYZXXUXWK1RztIesPok5/0fKkJNbQePBzKKuTt?=
 =?us-ascii?Q?0GXfbUPG4HJvsEB4FKCOHADbmewa0C/FPx+KG69j/kvFUDQ2v4ewQp6c+HXb?=
 =?us-ascii?Q?ZpN2cSK8UZuZrYDRw6DAzpqXweKZRCGHaeaSz1q2bPp1z9BcDBrhaia0D93I?=
 =?us-ascii?Q?UE/Td5H6PdnPvkTgb8DF3uFFyw5hR7rAIKEQ7Iw3JadrwiacLE+FBILQSKem?=
 =?us-ascii?Q?2lTezZ3xjVWpzaP9o+xmQ7pXKrO9aoGCM0tVIki+gpjrL3w1S40EXqnNK5be?=
 =?us-ascii?Q?81XN4xGCeu2yNSLyMUdB4p7trCzooR5A0J1uPCrMjDZmoZqSPYPYuDrIFtO9?=
 =?us-ascii?Q?sqOTbL1V4eTl6upgHvssheHLHZEy/mnPaAEqi632prf9f1bOur+0hnk6UdBf?=
 =?us-ascii?Q?hGRlQGUo/sttAwv4QLQzYBvXPbmwmfDUMthwnoSo3lI5GzCkjlIv2cBci3ST?=
 =?us-ascii?Q?EAHO2/u7z5xJLsqB7mA8q5E0UIPcoSe+dGoFNed9O1Z7AH05gV7pBLAddggU?=
 =?us-ascii?Q?oYNUiGEZIXZaFGTPULrk1UiXBaEotTeqDpsE7IVIf4Ou4VQV4IiDzNKzh9mK?=
 =?us-ascii?Q?0j5X1Gr/tcsJ+AUO2us1METurI9sP6lEpkHtBfmA0LlnrcSphvLhuEjMmA48?=
 =?us-ascii?Q?YckoQzMca/M40GEAqyv8ZZw22vJxQFT2kRqgdSOae2nnWJRBgIZHO/7fcKw1?=
 =?us-ascii?Q?Rg5A/K94fC5Eh9Rb9PHy5wicw6lE8YxFiOTLFp8vuhLPKRZFy/w0CPRO3uqw?=
 =?us-ascii?Q?BbWscIw/bXOlWSzxG7CiPBNOmIebhAUwTmEW7UQuOrs/UgPhSd4/Rs3c5IRe?=
 =?us-ascii?Q?rWZejO5FC9mRZRi1aY/kqxxlO0sbAj1nyn4+u104ycCE2TT2dbX/UyXCGcO1?=
 =?us-ascii?Q?ftBvY+BFTbM/Fu6cXkwhQ2XhA3hLUGjZ//S8Lvd1+hCkjcZwHUrFF8VaK8xc?=
 =?us-ascii?Q?Sf82whSRp+TmhewErLtPn9lrRDTK82eiOkv0PxKTldU6a/aaTW+e9Gcx1fwO?=
 =?us-ascii?Q?l6jqyG7DWN9+aU+mrD7aFZ2ytXT4+uaZyTSxR3N0sVYxfpSYhWaIpBrqH+NA?=
 =?us-ascii?Q?KAZ5fEYpJPJhgpqvkEUXU6BMtzGgP5k7?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OLP0AlsRO/9t9KQkVpGPUVHh73vUp7q4KYEpxxH4vMKHdcC6WJLDMFKShi2W?=
 =?us-ascii?Q?y3BcAizW+a4wr0JciOs/zr3JQPcC7d1nMHPnd6umMvRfkFHAdHY/BMaieTMn?=
 =?us-ascii?Q?VMeLMK9SXq5uglIZWWCcSstnIGuRhomGUzHXN55Ge9dOraGXm8B0hd+eH2TD?=
 =?us-ascii?Q?QzaWYmE/zjS2yGYgk3LKV6Ue1i50+gfQ5bF/ksfj/g+MMKj3NrJjCbMznD/w?=
 =?us-ascii?Q?jhLPaOlkcGxo0auFzp4S9Zimpxz1h3pdtI/YjHVMRwiazx7BeaM113b2x/MZ?=
 =?us-ascii?Q?Jh7ZSdOgGTnGYHGXTARR15NoduADmtnaLd84yTf3N5uWI/niSUBv5CE9sf5S?=
 =?us-ascii?Q?egJZJ1VubVrxceHMklKHF33q7UbMYtM3SJAsdzCtXlwOu1dWCHraikDRZlIs?=
 =?us-ascii?Q?FBm1f1ucDdTLTR8Mwem+YgpfHoJF+dcGv+qSVfaYQEIwtjjM8cC4xMNbtzY7?=
 =?us-ascii?Q?MLfrCr0Mgou7v9ObveZ0GTlCCVYOZ2uqo/TdBHwIx6DcQGJ3Ro7r4vevYT1z?=
 =?us-ascii?Q?QWbirMsNHi9VdYvNe/BNsDR3XNbvymoBlklNvimo3KvZcFn1dPbIGM0iN8m2?=
 =?us-ascii?Q?yoJ7B3nUYqGJLRxVpQqPfOqwtkBh3pam7ZeXAXHT8mjOsc/zHKkBTzdR5ObW?=
 =?us-ascii?Q?8N92/efZC+iQ0wJDzpkgsvvd3ooh9WN/VHc4qkBh6w+Y8Y6IXISpweSkLIrr?=
 =?us-ascii?Q?5KfSP1nXnJ75E+aJBh2POHucwKQcZJwMzsyX564iuOxrr5fwQc7D+IO9Rneb?=
 =?us-ascii?Q?v/DApqfvJ1M7cs6vAd+8CspDlfug1hYtPREkixXbbeS7ksio9p1fcgOKrRKe?=
 =?us-ascii?Q?0MdL5bvxgty88ngycDKPkF/V/SFA8lmxoczQAQ3ZtbBP/Nn8hRX9aP8WBiFt?=
 =?us-ascii?Q?VstGwo6Xh4DnBoXdYescmV9SFD9vgTaYFPhfX2OJGOsUN0Vh5Rc/Gd/qr5AR?=
 =?us-ascii?Q?TGshrDAflwtwqsRgsIvfNsrdpqXdTOArieK7XCkBJ+/lphc9kv8XGTRSKZx3?=
 =?us-ascii?Q?1ApbDAdX4cGZYUHHJ2zBRGgJc9i3sfmb4VCwTYqY021c4C7xo1UanT46qH8i?=
 =?us-ascii?Q?Tse7t4TF3GvDPwZRI/mKruavPA+6/kh3EgRdN8GQoJ40A41BsR66dNNu2A2x?=
 =?us-ascii?Q?mceXQBQK6/e96UbfSN2+u2+gRQJMmF4pBF7/Is6k1yl+aXkjRuwPs6NwvdJe?=
 =?us-ascii?Q?Pns7zipuJZljG+Muyv0itaVEF/EAu+a2X1DkGdIkDTuhFqDv+N5MWjK3GS6X?=
 =?us-ascii?Q?RU+9yZKRNmC9t9PutsvN/XvZl79IhnK7J6IyYaNnxPzSRSichIDwz8vlzcnc?=
 =?us-ascii?Q?GUwU3jdHmHO8oCzA8DcUCPPBxT0MNTzcWi3rXzuBy4qcdS0o08pfmtNBz8zP?=
 =?us-ascii?Q?hnrGJCiiO+OOJbsgieSu2bxoYKJWTbxF4GQLoQG012XqAkuTSHjqBap4qWBm?=
 =?us-ascii?Q?hxXywzquVD3wk5Yo/uL6SJF10z/lTRh44u9AVNjL9/kzbdymXT470Iz0pROB?=
 =?us-ascii?Q?sJ3J/JOMf7U+HqYr/GGarpSaoiO47NtCPGRFvrK9b2nLhZ4bYZHoz6XwZ9ei?=
 =?us-ascii?Q?uFtUkfzBjzSovRS8JOoQ4SW7+L9wkoiY90WLTYUf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aba4d6c-5765-4ee1-fb8d-08dd39343a14
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:24:23.1588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OTv4VE6REuq+cdeD1yfCP4CsM6pfh0CFr7MVIljqWI2KpzXa5ccjeogqv1NOR0HWIzuupExHIMwfGZ2wZGkJwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10731
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_012426_804213_816AF40F 
X-CRM114-Status: UNSURE (   6.27  )
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

Pankaj Gupta would like to recall the message, "[PATCH v11 6/7] firmware: i=
mx: adds miscdev".=

