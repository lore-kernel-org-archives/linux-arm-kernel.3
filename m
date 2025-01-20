Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AAAC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 09:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kEHlUcvCS8RRPfqLL7uNfFP6dNzIoZxYk26pDXRhgXo=; b=gEaNo3UrRnV8DX0StFwLnoGf7k
	l9knicyrttA3VWwketGZQWV1SM3FD1EAwCWGM6VkeIUKG/IMeJdUM0N+PNpWEKGLrsj+aCmDD+jGx
	f8JimsBWT6IGvXNA0gQL65aB8RKGNmul8eO1wIJRBC7d0frCHmcto371cd44/L30N9g7zuM/y4UdR
	g+EySEtGEuZmeQamC4vf0epYz8Ke9R9THLWOBXGCIH37JPBsvyB+i8DuqJ2A/iwZVlkWj943M840M
	jpo7NMCXYbBppFBUk7NIqXukj3R1Xbr2WjxVALpst/R6dwVSuU6bSULbGQemfDGWXGe4B67YicAtD
	80j9MbfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZoB6-00000005CjD-0NSv;
	Mon, 20 Jan 2025 09:34:40 +0000
Received: from mail-am7eur03on20609.outbound.protection.outlook.com ([2a01:111:f403:260e::609] helo=EUR03-AM7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZo0y-000000059q9-3p34
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 09:24:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5x8CTuMEmVJk2rBUEEh5e7LJiplflIC2LIT5PyhhdH0x38tngmkRwF5K9Af6Gy8yCM4WzUNjsiCha7lK5I1Z4QXm8rolJ7M3g9/mui/IucEozZSJus7Ky3OgfKtkrWQcfe3SrzUKU9v9crwR5NQHutaCrPgqyyB3lQZViN8WCvy1u6ya7dtKgCjyZc9mrqJelibyhY68wqPtgYYluv7UDY3uk3tHhd8tO92q+Ys/YEgGx32mIXMEMbYRzHetHRl1IjPf/ZQVf93ugJc9bI8fI2cnt5Z/zl1hrMsEYEn8xupwO1SgGYiNCrq7rpHp1KHli0zMnBs1Hg3yYu4nVL1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEHlUcvCS8RRPfqLL7uNfFP6dNzIoZxYk26pDXRhgXo=;
 b=ZnyA1xwgfKKkC/7tZeUjFyaRZX3wRYsdK5SG0UpA10UWXbS+nG1Y51o81vLiit5pzSrudUu9MJAthMQ1x03j36crZ3keGHMISqQ65rnn/bzFc6GGrwXaeBW5VTHy/iyf95rHnbxHVBGnsuVkCZ7Xv65rRpypwf0NH0ZnGfMKovis3NSodDCfMiSGCH9CvpxxTdaSiJlDx45qb3ylee15YigcgfWo3ICLQfO6N4QCCjX/n/XeOBjbNLuyOuy2oeSwyvyrqtF3/lMQKlg6drgo+MrqLMQHJwPK0JSGcn97h7B7YncVvrfOLEe95VrKUjoWxyapkkrEvt4LmtDWvDXpDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEHlUcvCS8RRPfqLL7uNfFP6dNzIoZxYk26pDXRhgXo=;
 b=N3FOFzvpPmGFB4F8CRq5ObVIaOjf9DQv9jeK4XXulMY0/cKIzuH64C6x/QzL7xlru4fXB6dtdBzr5Xih9I+ktb/z3AT4k7pXMbdpLbttIZUcEL+Ul8Ipugiol4lxDlpNwMMGjmfm2yoUe1zs1WxDY08UmEr5S1DrjIbJQjQy/WueYyXQS4pBUIfnNmcye5titLLlVsuN2GwRsNJ86DMjSfrGxXK7qurCrxwhfpaZ+a+8hXDOMs7ZV/mQJEfoMaoFW7TqfJ5tH1SumM5Ex6Whkbax01YB9YrBRis9n2YvTLh6ImXJIDZ6Fv4ZCWEQQOguldvM6Xvm9keBG3s7kvSlsA==
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by GVXPR04MB10731.eurprd04.prod.outlook.com (2603:10a6:150:227::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 09:24:09 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 09:24:09 +0000
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
Subject: Recall: [PATCH v11 7/7] ele_common.c
Thread-Topic: [PATCH v11 7/7] ele_common.c
Thread-Index: AQHbax0PrRnVTojW6k2kMqAha80YoQ==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 2
Date: Mon, 20 Jan 2025 09:24:09 +0000
Message-ID: <AM9PR04MB8604DFEFBD12A432598AF78C95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-traffictypediagnostic: AM9PR04MB8604:EE_|GVXPR04MB10731:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 993b111c-5b52-4bc4-2679-08dd393431a7
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?h9TUEm3GHna/Pr4gLa0flVn4lav+WW4LEXUHuCGPmIfGiKHNYy4EMy0i7a7v?=
 =?us-ascii?Q?8scJlEXULAziE6Oxg47lH0WTw8BR3y/kmyimf4dhig2iUp+Tid6q+7LYVsYo?=
 =?us-ascii?Q?az3rgd+Dox//u4c/33LU94fWFovD2/DKHEyGldp3z0wdF9Tr262ODuCaAVjC?=
 =?us-ascii?Q?IzFIGZqNzlyEUWusmrBb66iVtdeUWozOcwNLQA+Op12owVZ5WTlmtrKSoseg?=
 =?us-ascii?Q?zKTVVP+zhFqtcbncWsydswQD9CTOQeuYVLfzIZaRIeg4l6UjfSvURGtIJvDf?=
 =?us-ascii?Q?jzy7zu29SBxLh0i+/utSIfu4HO7rik+ay8hd1xmV1eRfehAAiVEJ3zIABmL0?=
 =?us-ascii?Q?pB9pRqeOX9weJ96VKt4S+7ULQuCt7JLX950DePOrdUuYamFdsFdLHbPC3QLd?=
 =?us-ascii?Q?4oEpNdvBmtOhhh8uPGwvPE8RCldYmCUfZ8BMY24YW0aHr/nG199HJ/X1AyzT?=
 =?us-ascii?Q?SVdJ5vVZerzpYHP+MNeV+DAvkbxcwOXZitWSsNv4Ukn9yzQqCJSUlp5btm+I?=
 =?us-ascii?Q?rrouEVo4rr1FAYwlGPCoiW85R8sUqJfx8Jj4J+kmxjFceWzl/MvcvfJZ3RoQ?=
 =?us-ascii?Q?aGfYIA6TFa9EjXfnE8snAX9A8PM+Zf68ABR8MDVsYFyeysULrbnGLsXXaBEI?=
 =?us-ascii?Q?32LqE5YtK7SJ+0xZCRBkUvz6lgZdrPBIHzHteCf3MMK12V7S0XNEBtHCZtL4?=
 =?us-ascii?Q?s/1B5rtmxGJV/Qn4llYCca9WyvwM5tOgJhjQFjDCXTttr8jj/gVn/JFxRogU?=
 =?us-ascii?Q?I4GHXRhQ1HkMVbwUVWuQNzYtgoqZYTsdx4NeKpba8wmBCu1lPHeAJ7i+mHNA?=
 =?us-ascii?Q?4HvZ0KVg532f7P8rktoAAB1Zv68KpRBEgyRYPrE62qI5TduuEiqc6fP4lETv?=
 =?us-ascii?Q?wudMeyCZp1szfIP2bhZhGOeqxXVPGPh3gzlEW579MN1Z6msj9lBGGp2Vul+O?=
 =?us-ascii?Q?h+NX8Fq1ZDiBZ9tjz2cPs2Y9Rw/5XSH04X0IGf2yJmvI62jzTx2yAp+V1mzM?=
 =?us-ascii?Q?gv8NszUkE1uf404SW0FJWDAcoYZykRwXLc03ht/863Vy/19rFb46d+NEobek?=
 =?us-ascii?Q?9LPwZNcxIBtYSxSvXJbonutUG2GF/WSti0H7jjVJq0sWes/olv7mS0f2BWQp?=
 =?us-ascii?Q?T3evexhszLFTRT9pdhbQ2S7U3NrInP9laDq6zHU9ZbeVhEVE+ry+YNbdAnWe?=
 =?us-ascii?Q?gn195yAJOuGy2fehvcBsbnQxNT/f7r41WG/1aemnArTgK0L7///Lh8dp084O?=
 =?us-ascii?Q?+38puj8qFQAncYkrNJO2DeZniZ+WtrauZH3vl0kEi81eN4W7NqWCVe1P8Sqf?=
 =?us-ascii?Q?R+9XUY9MRr4hxDBv8LLX6MWes4iFcai/c9Bg0FORWP+k775y5CyLYGNdNCvq?=
 =?us-ascii?Q?z/UX6C8u8gjJqh2neKHV12kA2FSvggeSUbmQJn8I2WvgG79eyQmSbD4OPCDk?=
 =?us-ascii?Q?qrrbX9LecaAn9iHc2u46idGUnuKimyCZ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mC7l2YZ8EZfcX+decAa8yU+7SmTqDBd/LcN2o7P+vDVJeLdifrxKWedAQCge?=
 =?us-ascii?Q?LaJmZhPTNBDDXTMCCfRUYTQ7tmAtCJHArX8ySRlmleIeWSS+TFmhiydK1L2g?=
 =?us-ascii?Q?wVSqXWW1QMrThyqCAmZFitXOHsxPD7Qlgz+zOCRscNMudkJgji0dStqDaV0Q?=
 =?us-ascii?Q?IY8e7mYONH+DWLJwAw2GJ1dBgAOcciR/h2ugcN5M9Gnw3AMfv5WJ/BrfUK59?=
 =?us-ascii?Q?Pvklr+0AxZJNe6WKbfLhsQQQq1EaeuLqwwqu1WALjjzV+VJLehNPtAEFtPSi?=
 =?us-ascii?Q?3FOdt0COK9xD3RIykHFTUhV0RT17CIBFRgrJZ7Yox5CyjyIb0ZOMlPATiPua?=
 =?us-ascii?Q?Ip6O/RNA+yZhd+kuquH+5dKjX3MHJFL+C+1Lzfgds056AMZ+N4x1tPLaaPud?=
 =?us-ascii?Q?2Km5udfySlBZqYOk/SyX3RzV+mlMR2JHgMmZESrs4qmckBOxNKG1/vPYVuVZ?=
 =?us-ascii?Q?NPxT8fClDdcwANJfiPhm5IYEgAc8+QdeeNaDSRJOOxYkx8r+dcATkgSNPiqE?=
 =?us-ascii?Q?TZirzh7klLRE+A1BILlb0ZktcvvyzaHFFBetpuJJrnAbDl65cewsEKie/3JN?=
 =?us-ascii?Q?t04O6iuNK/XXytdw9SC4SIfXlinXe7HpuL3Hmol2S/Xyoa1T3eT+hiQBI/Am?=
 =?us-ascii?Q?ESQgJ/h1GAOf0/DsW0d8z3xkzj5dUVNrTK0vZef3D5M0FXYvmIOoAR7idMTt?=
 =?us-ascii?Q?OHo2V9xSoVMOfEM/xqPCrkDi3/WfSay4WC89BoQvd+lIbXqgCnDuNGphxyUj?=
 =?us-ascii?Q?5DUakNgjrC5kr0b17sHqRrVhIEOrC38uiVKI1Q5fgmnVEoDSTQyP1mzX/ofk?=
 =?us-ascii?Q?AJvspiUwywaPFjOFTXbqCc1njx/ADQIM17AlbbFwc/k0mv1I4Az77CFALee7?=
 =?us-ascii?Q?Mhs/CJ1hSlG9ANSJkCdH7yoo10dOXfIAoY15QA6WVKwVKVOaQOAMcgxYud6+?=
 =?us-ascii?Q?lXnpYLoY80E7LbhDSh8dwYx+rejawkKOUTManVPvVLgvfLtlxB9foblWvmQ0?=
 =?us-ascii?Q?e3LWGEtlhgTO/tzoc8iI0/OAoIi2AmNlpDFIYSFtgvuKUFbvNoovVDlVG5Ak?=
 =?us-ascii?Q?ELnLIK7N0T3thbhDau7Pnnbe+BJRdyEFcwP9ZUT6b7gW+JylNp5zqvaMCAEU?=
 =?us-ascii?Q?pzegOrbzPToBnDI1SLiz3xYDMJwEL6kaOxAlGR+NuIk9oqsOqtYSJlxmeyvo?=
 =?us-ascii?Q?MQrXQ6TKKMCiN7ofESiXRAoq4wA3rdWkPyTGYZogAPikB4zbdi9Ba4cnJh8X?=
 =?us-ascii?Q?9rD3A7CCVnnWyxGdaIHR9TdepYPb2zD95JZKR0YQ2HlLorIuF3GN6Mmrxb9Q?=
 =?us-ascii?Q?PGcxEAL+6DhQ9S6djEm8oYhxGOdZ79zZvtAJ4rIV8fe0DJB4VNpynmUSDfnD?=
 =?us-ascii?Q?Oj61Aq8n9+G6xY4/UGfM5He7TB7v7dyZADsjp0s5n1dlxSG6rfuX3XBoh5Qt?=
 =?us-ascii?Q?WQOaSmGLhvEKXoBBHf56McIZTH2ABp7MUhr5mRBUMuR1Iq+dSibtkTsV5oPf?=
 =?us-ascii?Q?0iG6L38OjheC0eAwDq7l2np3aTW5D59b4lO6unOLW/wwbmasfRRnKtNnJ9AH?=
 =?us-ascii?Q?oUSghyX03jBkGVAq5MvEmIZmO9nVTYBEXaYf8y2C?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 993b111c-5b52-4bc4-2679-08dd393431a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 09:24:09.0454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jh9NJaFkEKOymBdQ4Otvws0zTTOIFYi51qi+6UIb2z6GDRljrj3SkOKdf6sS9GXWHX8B1IfKa1jY74qwtv8INg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10731
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_012412_942233_5BB371F9 
X-CRM114-Status: UNSURE (   6.40  )
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

Pankaj Gupta would like to recall the message, "[PATCH v11 7/7] ele_common.=
c".=

