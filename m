Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8419FCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKCBeFsCXaNuLJFdYCL686ENNyJ5DcId7EPJeT4o5dY=; b=TlOd8iUahdSRzYbCVydVjbM0Yx
	UReiryliIxiRKVBZJIvTI0zhp049zAPOfwTGWoOgTL044GE+yitOVEFr5iIYteEiWAlqHWTgrbWHm
	M/Ra+QMPbPyQy5bAqTPrjy5FfouTmvG4FPer8gbgbknb/BlUMvCpIeiR2c96JRd9c5XzbxeMp0TNu
	4cIuyhp7ZX4HNi1/he4CWAYVv6YJbEnnKjD+cn34PQLiRzpodRT5vCX+COhm2gbqtJanQHVuYceiL
	Kjs2noZqluNR36paA+xO7E9YmQJowioCXWD1+JFKs2uJJhUJDXCNarMeB/qtizPEzaHP4j4ug9vly
	APpyplvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1KJ-0000000Aipw-2LFT;
	Fri, 26 Jun 2026 07:50:15 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1KG-0000000AipF-0zNz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:50:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFgE1gJje1PT96jbXwxBFpzcm/utkv9Y6gl3fj8UQe7pUNuSbWe5f6PTgzbUBROzObSGbyAKAnNebSNoyxKjUxKg/no4SeW55aZTRwbQ6VQNq22inCNnsrMAxCEWVCdWMCpa+FFtUxf9PfRvuf7yx0eLLf/NFBPI2oYyufheG3EuaEo/TMTRwJ9ZU9gGON+YV756lzpk6ICw727VZCM4XVxUg6MyeysS9QvIQsFgtFyH/aY586sy7JGT77KqoLZeYooQ06Iumfxjgjv4ET9kr5qH3G2TYNcqVWP7GhCXsqOZ2JrQ5mo2Gnbu94fAO8E6NGr5Sxb1WKFEqU9WKjgrKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lKCBeFsCXaNuLJFdYCL686ENNyJ5DcId7EPJeT4o5dY=;
 b=hWFy9zoT5WZnJAtZg0Qe0tJHOecJDasGeVoerzMJaU43gs03ugDEZh3OeWz/rw/J+lr3cGoxb3L0v+TIQkcfNPc6PfO1A9q/1ftT9Oc9eUdrha+KR34uNa0eLrn8gEOGSJFdZEXb7UjQpD3AztHyA0QVzr7toGdV4ORmdUtuEgikNwD1xUeLydq9oxgRQynkWIWGpQthVG168CkrRFEcjPk59SSlzahtwOJvEtvuGJnfYk4hff7CLVupfDAbdVPXGsP5TnmPpoS8ahf49Z0Q34mB4D32BQ1MckDZJeb4szueCYhIAeT7HMLjcEBrOZ5uQzR+6n/l0q3QpEhG/gibRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lKCBeFsCXaNuLJFdYCL686ENNyJ5DcId7EPJeT4o5dY=;
 b=WIFjo53W7bI0VKzimhv/+DMHWr4Oo2x/igIG7dLNklihIfRFDUxS0PhM4TEhkrOZph4Qk1wLQjIuWWNTUuahjvDa5ahAC49cnkXrma6dn8f45jaoQicBnefiR2pW4WPt2Ya5eT/b8D7hE7GMlQrMD5JaSbXmHuRzKO1ZZFIwi/di5pUTNdKqclNmoKVy1jhwGeRZ5V4gzVcvY8BrB511iEErSTO+QB6M0dHmr/HVM/dF1bzqMuXNNrrFvSmrpOz5llfjvZpk2ClL4pcTXTl3G7zgvHl47SQhljzlW7ipFitgW7jDD4nnyEXkQswhHaPZCN6FX1ATMyGZKjKX5EtTaA==
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by GVXPR04MB9950.eurprd04.prod.outlook.com (2603:10a6:150:11a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 07:50:03 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 07:50:03 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Jassi Brar
	<jassisinghbrar@gmail.com>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] mailbox: imx: return TXDB_V2 timeout errors
Thread-Topic: [PATCH] mailbox: imx: return TXDB_V2 timeout errors
Thread-Index: AQHdA+b2UcB8BMFwn0ytyz+ZPZtYhrZQeNaw
Date: Fri, 26 Jun 2026 07:50:03 +0000
Message-ID: <MRWPR04MB1233037C743B0F50B83B13CCA88EB2@MRWPR04MB12330.eurprd04.prod.outlook.com>
References: <20260624143707.49344-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260624143707.49344-1-pengpeng@iscas.ac.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12330:EE_|GVXPR04MB9950:EE_
x-ms-office365-filtering-correlation-id: f62c4792-ab1d-4ac5-30ee-08ded3578838
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|10070799003|23010399003|38070700021|22082099003|18002099003|56012099006|11063799006;
x-microsoft-antispam-message-info: P7w20qJt/1y7gn4k5jIyAERzQ4EuIVbDyRtqEHFpj62FCZbbojvZuB+MawzsWi1CuR9kxaPrnQizzQj83/CsHefxn6tRjmkc7UVrPgm5sxFJXHHkLuwnSHfOiPlaL6dL//kDa+UH0VKa1f+nhrScWr6PGwdmBSdJZIC+2IXOxiEuy7kZKqixPcyQ0dYjTtRLAoPaGvY+75vHVLTBtuXAR6PCiaOWQ0yQxg3flOx6R5Ue0m7oXoUzpeGr3Z2GaAZyb54XgFpQ2L/YLh9mQyDlapzZlY3CwF1ziyzvmNAJm5f7UmmCzu7kQectJLuJEwWHpU6uwaeLk5LHIe5m/BXkYJGZkhQNgsFBXQk+S7BQyxcYBn+SgaZL8vgzIwkDgUDgWh9d5OefS2Skx2dJpUtmkmx/me/0JC5tGsdvu62P5dDICWfzkIfg3V81s3PFK4iOiN7t9BttAnCddgRZzjz0CBvlbCXHfL+UcYyBAyOHK6QA3B9Hz3mmv9m59Ay4dciIDabJ4i3fcZxDhIPHnChxWVaxfP854bJzPd0ITlupqHyuEQV1tEYjV/6nMYZBQsjLzEtoq6kUqj+c3yExVxeP+zmpW9zVxVWx26re8VEwHx6PhUBt6fPaw5j65kqxtCQLLve7tJkt+JpzQ90KDm2Vc0VOnIc7S6xCVgttbdRic+kGCKA2vpmnIFKbW+McgxVQ4SS8drKon6gTfkZOohAPY6/M/w/+arhBOYseAinbkdo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(10070799003)(23010399003)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DOs58gDxmZ+K8HkmnUPC19JGBzeifw1iwiN+y3+qRm46v9pkqHjbeVrtpbOq?=
 =?us-ascii?Q?YBURkq34O2ftPzB9TaYKJLdiyTBEZ1IWKiG3ib7tSVBdOdC+AR84JpzYaIa0?=
 =?us-ascii?Q?MNoyQHbKf61dZGQ7aXP9CKNBoAPRpqQNczVXpSUf/Py80hMbuAkgS/Lx33me?=
 =?us-ascii?Q?RRwxNM1xfDD/Qi0p7NAQvxP5HuGIPFXtS7dNpQbBv0zOiYzs/1GI49UjrJli?=
 =?us-ascii?Q?V1iAVGr+cVxczjxUzKvHVCbWqVNZuqo39Rp0FstzjLOzUMKM4UE+LObl6gMc?=
 =?us-ascii?Q?Uxu5cwnG2CtIoPToMmon3mgDJWgLelCXNsYRmX0gs2RV7ZwUBoTjjv0Mxxe3?=
 =?us-ascii?Q?0BmP/FcfmTnBLc1ucMvoS3ruyJ16WLdYAqzOUhrk3uLBuf+kFfkdkHVsWZ55?=
 =?us-ascii?Q?uNleMZ4UAv1KNhVEtVssDfvHVfVCqrPq7lrPyDKOQCljWwh8KfLzWWa9MCHx?=
 =?us-ascii?Q?mEU+YdxucMAYprEzR3WdF9N7oEepg5QNGIl1hr2gWxmlsMh6Upoewzy4EDZh?=
 =?us-ascii?Q?jZGlx9BeFOt/QwDNR1h3YRSk+SBjZi9TcvOujV+nnABHIvBOzk8/SKYiCV9Z?=
 =?us-ascii?Q?1OE2sQYA9FWQ3jO6okfqfSYnjXdp7I1zKY1RfD/6hLo/590O9tCIXW1CLI1u?=
 =?us-ascii?Q?Qoz/NwBzBfUtMyKstjW0yHMA5+AGH+/N0nU45VWrUrFPFbhx4rYEx7mILcah?=
 =?us-ascii?Q?4b5rqT6hSP7S1s+9zUn5f2JiM05lwPLyZ1KKTmqQVrMLqFLO1sLhwe9Knkjf?=
 =?us-ascii?Q?VPRrdSyvFmdV2t3axRgjCdDoqtnt3prwpfC1luK7RORmj4hOVfe8EmW6eDt2?=
 =?us-ascii?Q?E5rvGpZad3oiN5WYHZVtEbNyaHLzikHVANucXL/n3AJnY/ddcF9/iI/A5QaO?=
 =?us-ascii?Q?Ezyo3MuSKowxSBCp+Kt9lUvU6a+2gOsRD3wfqMUGM6VW2GgZMnD6MHbNBg7b?=
 =?us-ascii?Q?Y9QD5nkKp9Wi+lqmf42YQw/adJVPNChFyQv3QvqycVFCyzd9sk1z8/norTdu?=
 =?us-ascii?Q?09EvfbLndxH3QjnBeLlfBbswwCR4C9PneC9ncbVBwocmImq6Z7RRDC9D8aJV?=
 =?us-ascii?Q?oyG09ue/7TF7Zu2EsqGx9Q25xXFKdi+8b1aKXZQ1t+LECqceNH+D22REsxv9?=
 =?us-ascii?Q?N+7SkTHaeJBQ95w4FHo3yn1OEE700v7pl+/GHyQdPjANWYGoAVWNbZ4WImqR?=
 =?us-ascii?Q?B+T8jJiKIHteyNKlze8edC40Nx2iHkjTtX8I5bN4DEQw+OsZPx7zYi9u09p+?=
 =?us-ascii?Q?MyYr2t1l6EdpHHPUE8N2n7yBE1m3x9L/59FIrGmf4qeV0Jy3RMI7CwkgJiVn?=
 =?us-ascii?Q?I2eN9/WsqIB2VSs5VsfYscF6tUr0nAS5vZbIKr/euZbgrWgz3Fi4uG9m2zIq?=
 =?us-ascii?Q?FeIcZm6A7hf+gVjkrOtaqW3O/PEL+ZJTXOobHFa/ZaN66D1n62w28KvMWtyv?=
 =?us-ascii?Q?ucd90nm7OTYSy8tbnCZgsfwXLwU5bbtcQQMmRwV4+tCMgqvWypnoneg4x6Ya?=
 =?us-ascii?Q?km9L6zPnMa4rLTaKeqHFuVta3BI2QJeVjM3bzDBwrmIg64zXFnD9qLVmwhph?=
 =?us-ascii?Q?7BJXyy/6dJeWu3AvZyxRs302K7hGbUoEP9mB0xkwZCL/kpP+8kqogClmYFtB?=
 =?us-ascii?Q?YyGWUgPwFO8RkKSeZQmUKY83BiTsjb1qLnRiXe5Y3qGMvhqCZcc9nLQdLKZM?=
 =?us-ascii?Q?M3EglzcFPYJ4HWK7Po0NVeDNZajXgSxwAbrq2d2PkcI0TpF9Eqpi4myZYCIr?=
 =?us-ascii?Q?EiTpurAIKjLdzp8Ew9i8VyoGjZwlVTEqcOUWqqR93vp25smWnQYu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62c4792-ab1d-4ac5-30ee-08ded3578838
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 07:50:03.3729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o8vb3Tfle/qkjMxXnw18IzrvXGs7FoPbPxjKWAtJ3Zn9HLrN8HYwrI/F+KRzMXLx/m07JelNwmyppBbefbpIug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9950
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_005012_287991_891A8848 
X-CRM114-Status: GOOD (  14.98  )
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

> Subject: [PATCH] mailbox: imx: return TXDB_V2 timeout errors


Same issue:
https://lore.kernel.org/all/20260617-imx_mbox_rproc-v3-1-77948112defc@linut=
ronix.de/

Regards
Peng.

>=20
> imx_mu_generic_tx() retries TXDB_V2 doorbell sends until the GIR bit
> clears, but falls through to the common success return even when
> every
> readl_poll_timeout() attempt failed.
>=20
> Return the final timeout error after the retry loop so mailbox clients
> can observe a failed doorbell send instead of treating it as successful.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/mailbox/imx-mailbox.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-
> mailbox.c index 246a9a9e3..86a8a590b 100644
> --- a/drivers/mailbox/imx-mailbox.c
> +++ b/drivers/mailbox/imx-mailbox.c
> @@ -253,6 +253,8 @@ static int imx_mu_generic_tx(struct
> imx_mu_priv *priv,
>  						     cp->type,
> ++count);
>  			}
>  		}
> +		if (ret)
> +			return ret;
>  		break;
>  	default:
>  		dev_warn_ratelimited(priv->dev, "Send data on wrong
> channel type: %d\n", cp->type);
> --
> 2.50.1 (Apple Git-155)
>=20


