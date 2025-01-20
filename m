Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD885C02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qn1loSK0SSrzQIVc8M7Bza2QAqmOtCyLrdMdk0NXNjs=; b=DJoS4NUkAtHuWrTgoWtDtqRj+9
	5H1SpBz7CPeQs0t+yZJt/z+cudyH2qk2r4YGCYROnAP4MaoWkDdlNypqUKhXntYpBDcjMR5HQgyX1
	EdvA26S8vRiG+yMBUm8FwI0/Ay8pZoWUdQSXwefNLpEC6ewEaTDVxMgxmEOBrAVn4sP/nRXMrjSTg
	OKpLXB7D/Hdf63yclItYI8zItHvNFAcy221DXrnnTpA2IrsMB5/WAdkZH8dN0sc+dePTLGgQcQYkB
	eTXKiG3vyes4rYmMJEPeGoTUrxxsFXRkhIZBVYotOiTStwmc8fC0PwWO9pYVNJFRL0SwSou8v4E+Z
	4sIq7T9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoOn-00000005EYl-1Sta;
	Mon, 20 Jan 2025 09:48:49 +0000
Received: from mail-vi1eur02on20630.outbound.protection.outlook.com ([2a01:111:f403:2607::630] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo35-00000005AZ9-36qY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:26:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEeqJnhqTFQp4UruA48xNUABFFwRzIRNz0/iS/Io4NGgE6WEU451kqNFTFqUqmdSHVG/Oeyk2RzblZWaEfbXD/a0EkuxJeEh3HiAyUp4eo/upMBb8wYYPMKEbMUc0DbE7uOyQEEuaTyYV0nMElM3mO/TeB6gbPq82yYHNuBmMrvayUfuu2gJMCInx4/+MUXLgxKaS59U4DXSOunrbGXNib30EiVREiXTRUFnAG0tZimPjYVAwx2YdKJLko9MDh3KnCh9mqd7O3aUNTxc1jQMZR6v4hN8pSke9f3nR8mRIuQ/eB9TcVa3K9E8xXoL06jmffENMI57QeKk63TiiVa3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qn1loSK0SSrzQIVc8M7Bza2QAqmOtCyLrdMdk0NXNjs=;
 b=oXtQSulLq8qsFdcfB5sO0hRzWtRHq6xnxZ8EZ0HbucLsPzarfFZJFtXQyCae7uNqnu+1X+hA3i+JjS/zFPEBK67n0iAw+aOydL9H+yZNeAvn6TuKtiLPB9AU8J5XTNg+9Ov+GsXPKQ2pX7EkcoQ+dAlRBF2L2ufN2FtTBqIX4gXLZtWwBD5dsvedNtD6CoRfQS7Wu1IPzRJc20v4vmu5EN24YerscR+VLWDqlVC/BPQ1EtrjVUaAE/CYeuLCaHf6aiKDz2dUGPQ1EJF5f0UEEGydd5zbhzIvHcVKHKmX6/wALQh/FL0A0gCF8U5XZxJSuafoN9J91r6JlKQhsYzCOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qn1loSK0SSrzQIVc8M7Bza2QAqmOtCyLrdMdk0NXNjs=;
 b=YJvafWTNyq4bT9JQJ17DRDAVdnuFH8LG0P5/TVY5b69nuBaHRth47fQ203kN4GFrcNkEwVJmT9V2M8PLMows+zsq5xpetvZTLEjqRFhpTVo5swDOt3bloWao1bOEH3Sn1rifIHZyPA1Eg3ASbvGu1K+0JgvRfl4HUtwESbcrfSB/8u2x2R+pVLHLdsODyRWKYzC0YVdl4HV81Dd9DZ8aCEMmIMKZM3NMRqh+ja6B24N14jF26peInjN6FJ9MWJYI4Bue7xLIXgYxgk63jY5srbxBnq79xW5082+ZDdtQemWoEBUQunghlaEsLH3Xxbgo2QOh941LWXqCjzQuSXuu+g==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DB8PR04MB7131.eurprd04.prod.outlook.com (2603:10a6:10:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Mon, 20 Jan
 2025 09:26:20 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:26:20 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Recall: [PATCH v11 3/7] arm64: dts: imx8ulp-evk: add nxp secure
 enclave firmware
Thread-Topic: [PATCH v11 3/7] arm64: dts: imx8ulp-evk: add nxp secure enclave
 firmware
Thread-Index: AQHbax1dx9fS05tZT0WjVB+4L2vpSA==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 2
Date: Mon, 20 Jan 2025 09:26:20 +0000
Message-ID: <AM9PR04MB860436DE3E16B20A9254C64C95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|DB8PR04MB7131:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ab74b63-80ad-41b8-8102-08dd39347fec
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?aU+SUT+D4HCkS0ovJ+ZKI1+XM90bMvmdstAZmnLy9MVyder6DrUJldhQ6tVN?=
 =?us-ascii?Q?7qwaH/JxXmF1KemC3ofNegD/lpsQhDbw2gNczOao621d+zIfzKdkteNX+g3D?=
 =?us-ascii?Q?dyKOcyHBfMgX6zHLp082LbARxhpxOrd1IOCHsP3eHUT6B9MRiDPpV1ysHYyd?=
 =?us-ascii?Q?MOLmkgkN7aqZjylLSk8PRN++AC6ilAwowBNT1Lh/KUH1tpwZjPiWj44oC/VG?=
 =?us-ascii?Q?hy/o+R8dEbnn64a/T2LnP5zT74SD/leTqsv17fjfyXw5qVT8ibDKMiA7SWT4?=
 =?us-ascii?Q?tMCimENrM+qhBLq4uvokaVsDyGMQka/7Ak3amMZuDO4xtPLR9hH6NaoGm380?=
 =?us-ascii?Q?zxeNMsGjWNWQlRd7FPezxXXx+nVYwJSUfL1ZBTCnvuaB6m6+uybiEIyq3lb1?=
 =?us-ascii?Q?7cA4DHylCSiD2hnfFPfWxy+DbILFylxra/kAoQc/UbSe/a+OBXLJIOyQjU3J?=
 =?us-ascii?Q?eELDKQSIQIaDVC63s5GFJcy7QWCnVH19k/VV2vFx1w/8uhrH1yHhg/oZ4xMK?=
 =?us-ascii?Q?DLk2B/mN0Xveo7eYdpTSFHiubyFgipLa4vut1P1+AAPdMlwxNh940wLrsmEJ?=
 =?us-ascii?Q?hS56STCaVYo04Nab30iQMU8qo3Uw1pKImKFsFVK1wkK+Wb25AkwqTwTtDbfp?=
 =?us-ascii?Q?vsDb3caVSjG3mAiqzgmUJvAREn02VwF2+e7Xraq511W6TZdvbuiH2anTfKpI?=
 =?us-ascii?Q?/bh64SFeievQlvT7RKQT8zCrrgTGQp6JKggW62yqsgT+IZx/dtEeuevVoaLu?=
 =?us-ascii?Q?RnK4WHZrXVSOROv9U4p4Wm3l37W+KVGNbNc3rGVP3sZuoQilFVwrP/TQpa3i?=
 =?us-ascii?Q?Nlpao8FGeRXhKY18nqq5YKKNP71CXsbeAhSHsKr8LKfENNJayHXCnm232lCL?=
 =?us-ascii?Q?EHSudibLvL8dRkMeiHo9WgjiLZjxomKN+kzLak/fEa1RT5snpzE7AGQNhNBM?=
 =?us-ascii?Q?1B7ctfITV1BFPt83NJh53S25QOePeGEqGaT/KaThBe4ZUCV39v+fcj9EbUff?=
 =?us-ascii?Q?rGLN9jYmD/92K21fvJ828LKpwtkFeDCgnJ3lBSI38/ck3vl/OGFtJIO4Jw8q?=
 =?us-ascii?Q?b2AH+DH3gNOKuvfS/TIa5m8+9Rcxoml4YNaxdChL19teBZbPNY5mf3aaDlQV?=
 =?us-ascii?Q?KPLOZH/hjqa3IHsYEr852NNqfd45ZMbWqKJ+aDSBmsdyfs2rspN4Tl6poeCc?=
 =?us-ascii?Q?IJKL3Xzp9crc17CgAXHFcHDDd1pcxRJ1nt9KOBMnfj1K3j3bJtFBWriupj4y?=
 =?us-ascii?Q?KU5EPVrWxZPZAPvod2CNulakio3w7AVKXN3FJD0wUl9nefQCd23NcoRWFJE5?=
 =?us-ascii?Q?XR7xUHXaau47PrYG88V87PRlexDLRVic4Jp383bQVCIjD/QDp+ynLVkvNRno?=
 =?us-ascii?Q?7yvcCImaQhWqVRGJYiDKLiEiH3ZXh4ZsK1MO+jV1GZCZjOtP0v7UF6nno3eN?=
 =?us-ascii?Q?LIwGWitniygPIQPXnNI6DYRWtPLNQAUc?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rkj8nDaMW3oVuGXWTihoqQWjQzpsdTfHgGzTYkfAkBZwXNIG5F0ihgHNQLdr?=
 =?us-ascii?Q?oI+A5n5PrLSgO+YCn+eGHDJ7He7CYlbpcxRq8+i3N/VJO8aJS5UBMR/0J6nL?=
 =?us-ascii?Q?2ed7lB9AV6xiwBAgAcYKYDsuQpaV7YGbYpd/EhnP0Ynh6ZrMQJHO7zJmK6Ij?=
 =?us-ascii?Q?Hacyh8hJoUNfj2kUBzzWfw0TaDVb/ZheXwE7FltdVRe/5M9azUhPEOdBAUqP?=
 =?us-ascii?Q?uDgE+ade9O6vuI3SKkzecPuXB8kl8sNT8LbzPSFR0RR14BPLY6ZniQWPO+Sv?=
 =?us-ascii?Q?2WLGdD3RRQPCD69rxBxokVLdaRQYyHmaGRPu2NWx12WAsBCgX392zk8ma4d/?=
 =?us-ascii?Q?HS2+iIqkMVmW/VzuPGf7GjkijSREv85hAdiNcBr4/HDat+z3nQQPPIkh/K8P?=
 =?us-ascii?Q?kciTB+fYC/PgoPPtEx7KTYqwW0coMqdOdiLhdEgCoyoux4pyBgA7U4MpOT/D?=
 =?us-ascii?Q?AZkMJMiZzieEkhOXs8P8+JMRX4lNUsrIcgyJ5LbF8l53A6BYUm3dqGjYN9+i?=
 =?us-ascii?Q?aK3IeFiKHsjF4ezzWW2eTwkkQQiLXdOmAr93PidH3P5lNela8rTQnrKVZl8l?=
 =?us-ascii?Q?0M1K36obC3dI4NUl8T0N4ndcRpI/uq+XZfuxoKw1dZx2E5GUtYiqJehuFlBS?=
 =?us-ascii?Q?K9lK+WJI5ydxkSXGMCY/e9OnbEdxcVvoYAeUuakhn9tCY9IYbhAeqbfVAfSQ?=
 =?us-ascii?Q?nO/5zWhndeREbXbTLqwsVRlcTDVD/e7gCzSlcSVzvepAyT6tOHxKHLxTNTcU?=
 =?us-ascii?Q?GUfNJ2KKJ1wmGsOJYFOx3xenGLP1Q1Jd+2mLjOFMJuLb5WvulGnNcAKELKMB?=
 =?us-ascii?Q?N+lLm8LGmcMsiqqMjGcMF8KrdEy/BNY4qKTkQo2cZ8Cadk/yyokxTqrvHi6l?=
 =?us-ascii?Q?gBT6GDsEsAB4VE05SjG5Bp7Dn7EBkx3fzEOezVqNte3Q+6DEM+wyT/FnoW/t?=
 =?us-ascii?Q?QDphwFF/APaHZ8HhD4KD/lWbIN2q0dWS9tCfKDrW4dZy1TLbeRGXWzSeCATP?=
 =?us-ascii?Q?LoFByyxdmdOOzfz0dxTZ2RkKP9YGE8F1OKXv3ZFNRS9zH09NT8eO5b92V8Mn?=
 =?us-ascii?Q?+Pf9Kwm0qQ4eYqHEBBmxdjvYjCqLjKKZNahprnLnorcrSqDcZbg5WjKm1yw6?=
 =?us-ascii?Q?s2XDW8Kq1E1kX4L0VT1xdwf0hbLt2oWGDVokoVFxZO74K0m4PONXYcPCy46I?=
 =?us-ascii?Q?GuYUHwsIpqx9oSrp9wzfCVai2M/tY19Kd9qnCJDS6ktg1jMM3xFjEbXM/U7x?=
 =?us-ascii?Q?xQjUmmlJdXfClf9NIZiML/x0+xe/LDah8QowGLlW2oUkHgiI+OHbqsQ9Kx2u?=
 =?us-ascii?Q?c6Ntbvxveca/BE5EWNTwm9p6jlppllzvj2l/YpC9RzWIfxFSG4vACMlfyNg2?=
 =?us-ascii?Q?bc13CLeahT223oEOxHy0Sno0mSCIiBTXmJlWN+76MckSb375btt9i9ZCi1N9?=
 =?us-ascii?Q?WnaiXxNP9n28FGVZkaG2e7EAkW9d6bgIB4QuQUZ4FrWMXYvY1TrwSHBEud17?=
 =?us-ascii?Q?iWUwUA25Hl3SReeToUZzgDNGrlc1SIHf9PcLfPcNP2L7R9a9FWJyvBVt3gNC?=
 =?us-ascii?Q?5ZwvL6LXpQRVZno/HFo/qu/PEIkiln+bfyTeFxuP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab74b63-80ad-41b8-8102-08dd39347fec
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:26:20.3130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yK0200UtCFd5/Xmqs7Quif7UEFDznIkIuD2JsLy5R5K8fDALbYUzrF6vpAbzrEjamWoqBx3+GLtXR0VkC0Hh1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_012626_232999_D17226CA 
X-CRM114-Status: UNSURE (   6.60  )
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

