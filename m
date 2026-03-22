Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264EB1094481
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 03:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wH2WesUVmdFsXKDBaHyzDwSHa92p5brSpS3GKEVH750=; b=Yxivh0qk6+HmcmVh7Ya7siwXYw
	Q5AVxhon9AEHa7u2fubraaPZrWn2j36MxkxUBOYfm71r7wSlPthORqWhCnWiNulgx18cTuNjacy9U
	skkboHg9dcHccPQ+L/WSC9Fnh+cAp1VZxPjNc0vZTlhOjrWqTIi2V2rO5Y8qSU/YW47u/PJX5P0nP
	x6L09ZAwsASeB6tT3uD9A4FqfwpjpCECOf2cemKAXO0ozWS4laWWdpI82hIIUxhL81QI7EAQ42MAR
	lV9NB2edNF8VYONRwalrHiBJ+VrsoEl9hV6jJAq7Et17ZYAgzAT0BKRG4BD8sPwNmwBUANJTrq+qV
	NP+aWiAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4970-0000000F0IC-13sO;
	Sun, 22 Mar 2026 03:04:22 +0000
Received: from mail-northeuropeazon11012039.outbound.protection.outlook.com ([52.101.66.39] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w496x-0000000F0Ho-3g7J
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 03:04:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBZRaUCQr52frbLMmrWO2uIhxzCHR/BYvJbe17FhwhtCWvEcFP2RWfC2PXZM2xVuRtX5p35LYrk9G88Kh9nm0Ku3ChJDcOc/DQLLgskefDqX5KLeg+aTZgzksCTcEhKuOo3jsrVVPgZZyEdxjOMkZDSgCXcpRQ3X6u9/1Jn0SZQigsbwRfNOChm03uaK3jrwEBuucBAx+ZsxVKiY9w8mVN/a6ZAITgD59bN6kr6VkOvFN6j0qOeiSprIArJgY6VGZdVgCzJjm0EVQOKqw/x+DeTgRMPisJsfiIqWxG06tqaSJ3t8ySpIU4RTO0UY4NB8hy2nKd1AgDZAiN30R32msQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wH2WesUVmdFsXKDBaHyzDwSHa92p5brSpS3GKEVH750=;
 b=tYUjmzK7AmAy+UDDmhc4LCuU54eQgTPjRhBDbznUMKJEYmGViA4FNdhtkoYZXuw3hjiRl2sxSGur7ehmZj7djkB68BXnCNLPZxtnQp41A7uAUO78RtWQNZt+FIQhysg6FwDHryCo/RBqkRFzbaRsDwKCy5nAfbhLvNeWPMbaZqD11AznS3FdiyIsOe82nSfD36tZsZxApCfteuq5Jl60yQnzyXz0guJmzALyqkIT+E0wqfkNqXx6MVzPEl/p5tX3Fp+HpQGNhH1k/iIynUTNM/IA7/FrBU/JZMv6YPvD/s2z7N2ix3Rz1WHABxmPgubGWpLXr/ogaVwBtJvAzrzX5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wH2WesUVmdFsXKDBaHyzDwSHa92p5brSpS3GKEVH750=;
 b=OIzaZsCmjZGHNpIBvtdrwEJ4nzQyuPA+dtqDv0lNH7hTW1+YAzoBh/M+NEAkigG999cK8B2ajXBecCaNwLTRWJRuaOGQei1m+rsj0JuFFRFGx4wrj7IZUx/yk3xdfjyQzSlEwVBaMj7dah4PCxuBD+Qlt6aACpoSCqIb9tYCibaEvzrJdgmQYIEXhiv3hb2N7IAQJ0A/d/yjk9goH/CXyqmYXOk4mT9w7a9bxlameEkwlHPIPBnv6XwqbHocfzjoYS2dTE0NrN7IMCB/SAuh2Jvj8ZabtG33LdbuwVUSxVjwnPRBrKLbySSb0a+P52BzL7vzLdm18TkQf0+EAwEQEQ==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM9PR04MB8811.eurprd04.prod.outlook.com (2603:10a6:20b:40a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sun, 22 Mar
 2026 03:03:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.022; Sun, 22 Mar 2026
 03:03:59 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <frank.li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v2] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Thread-Topic: [PATCH v2] gpio: mxc: map Both Edge pad wakeup to Rising Edge
Thread-Index: AQHcuKA+G1eOINrPn0OSZMvrGuC3iLW536mw
Date: Sun, 22 Mar 2026 03:03:58 +0000
Message-ID: <PAXPR04MB84592EFE18236DC4D3C71E4C884AA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260320193150.2508850-1-shenwei.wang@nxp.com>
In-Reply-To: <20260320193150.2508850-1-shenwei.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AM9PR04MB8811:EE_
x-ms-office365-filtering-correlation-id: 4c1dc546-99ec-4c16-6b4b-08de87bfa9a4
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|19092799006|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: K3c4qOXK/j8JS4H9f2Y/6geZ4YWrKL9PKYBiBqH4j1jatk8TtjadCs8xlRYBPe1OKyTD3YIO9dPyZgDNgbXQVTtBxpxl6sWM35+mPJR/njLmN68QwZMTrtGWpOvHzChMIkzWCmeRBowNCgnz3KRA4FSbYsEnqwcNi5bOuDLVVO3tCo9OXX0rTG7qUxGpWeNaO0dm0OcMFIRg/m5rGNpADyBO63EkiG7A9zB5LyrcQS1tkewnanuiNCmGCESysWi6kd98BlNpmgXu5n5P6rnPPjt9eBoteDPmINSFzyJBDio80kdxYXpWDFN3q6zaRhG0PP3q/A7zv/yK8BL2wcRmyeir6f5l6Ds5HhuFaUWpcn4JkTG0eqaNMxFkLw5VOmObSiwzyCLPxhkNj4XKlyVEjE+mlOftGFW9f4hmrgk8IzxLC2XEeDUHFaZvucEnKJJq4hXbVw0wKBRbeGk1F08lcZ7P1q3aitntiSDsW+F/SgfUJqUooibIP9CHN/QWeIrxthq7SomXxBAZyUXIrT1QAWq1ArGPhq//xMGqgb1xgWTDMjSm81ZFizda5Cec4SB/qJkjTlUMXBobjktEDeU8Y+Faem0w5C9hBeCAR5bVJ8OwQFyh5Vv7yaITx9C2RxRraVvtxOK1qEKNiQNx3KpNuTm7/76OeXF87xK4g40RSKtIR/agwEcxh3AX85v0tEo4uOQQ+0AG1ZxEE/lJvBFutS4NaSlKSfUDTUcjdbIfZtpgU0tVQJOU6in9LQaPjXQ8ommZ1ApYokNNR5Tsq9x1s67/ZgtpBTL9CxFdbuy1K0s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zpU59tqv6ZSAa2y1g5mc7nRgbrGhX3ihmgNMRqD8tZvcrnwRb0jRGQ6M4UfF?=
 =?us-ascii?Q?JBAFP6TfK8oqo34MTx69o3WTLol5KR5BQYmreOaF9H56h4H4ItzaOSQ0hXvG?=
 =?us-ascii?Q?CGGIZjUkjV0dKboKDgb42i3paThMTmpaN3uhHan58NGH7A82553C0NeEFVn7?=
 =?us-ascii?Q?Gi2xXgZiHUNRGYXhmuoL1W4e54Ea37TeoNBuAnLIP+3/oG/DQK5NvnC/IqhN?=
 =?us-ascii?Q?dpyKjO2nicHo0zf3y30Agr1xyMwoOsLa2OEk4XzyjEWidR3ycWog9HI1FR9+?=
 =?us-ascii?Q?vNp0YtvRKcAq155X12hl1bnHw5TY5LBUdxnEKQRbzHDUs3xL9WVk1QyLg+jh?=
 =?us-ascii?Q?H6+XnTSrON7/Ua615e8OccCn3+w6T/ixDDXrhlbdeoOV2HnBEHAp8JvVtt1z?=
 =?us-ascii?Q?TMFATWQf1j6bZC6PQGzWDscKKHnNfCkB2c4JDjqXizpAF8koa6hn7pA+kKks?=
 =?us-ascii?Q?UApfZLRCFQFVEqJfDSIJLvwgHDVTu6x4vssU00MbJCZYNhSb+Q0XRiW5RqXj?=
 =?us-ascii?Q?AgtJk0j8VU4myKddxKiFglkl1gftpAWptM5fFDSfaS1Fl+lb4MIGlThodfJ/?=
 =?us-ascii?Q?3yf5d/vTqonfVKhagnzRh+u5lO7k9D+/Gvrr81CJc06kkWipHLtsHKgPutUs?=
 =?us-ascii?Q?iuO7dyCIksi6XOqPfYSc6bnlc6LaLJain/RHWbHHzXKQSkdan5k9+x9RY7f7?=
 =?us-ascii?Q?04X8775nNnJgadUqJHP74MbhQjH6lqYdWqLZVL0nDJ17LolU9b5zIYTXhzlW?=
 =?us-ascii?Q?9fQZikP4dv+DBQBmcQ1EQ6VG1kCyrPVVEdHA+bIsdxd1PQNjh4pshVWFht+n?=
 =?us-ascii?Q?ahbtTDa3NsfITlgGtCjKtmvvd7HXLkuY8e+5FenR2ASKg2T6GF5AZNFG3HYb?=
 =?us-ascii?Q?RkEkmDI8Iq6Bomcx6oiNysjuOIZiDqXYIYtvN4rar91QG/0iQ5P2gdQcfSLi?=
 =?us-ascii?Q?Xr3KKgZ9NZt7p74UfZuVd9JVbof+GvZBAltUBjmaxBFfoidVPJb93EkZZCsL?=
 =?us-ascii?Q?amf8JxP3COdlDN8K2mhwpvx4UCNFMG2s/Blyk+C/gTaBvmixF2f4Lwd8WKcY?=
 =?us-ascii?Q?mJFY7s6g6BpeG4mdGeKFve4fKh3hxxPazDId30ZqMeBOboclgDsW6UMhnVDe?=
 =?us-ascii?Q?jyRHbxkCHzrCMadRWn3JLbiol7FJkoN+9b9XANUFU9Pn78XRdHcCc/8tARM+?=
 =?us-ascii?Q?l1/5+xOpgz7sRqU9OjIZHstdqCcPTHSkjdcLjOL5HY/yumfdzMYV9WmqzarV?=
 =?us-ascii?Q?mm7M1PlgFpTBn/4IKo5PEzpb8/ZE9tv0TMJudFXec8ye/gAmrWTKEzoetWwJ?=
 =?us-ascii?Q?1d5aGJsrxfygOOuc4JJj1zUL8fS0S94UXRaCha/IFpj/bwrDaCrTvFY/zF3l?=
 =?us-ascii?Q?wYAQkJ7ivw2K6ibo7bEkR/5saBn1pav+qz8qVJTqWl0Vd0/5jmluxB+j1Vtn?=
 =?us-ascii?Q?CEmhoi5hpdE9AD9PH8IALx58MiN9AguHDkNBjX6rrCzbl/a2ABEEWMHynYcV?=
 =?us-ascii?Q?xb8VIWhEilXLFQ9q0xAJaaF3DfcvMumjN08M1mZdncDloa4leXxU6IWsuh3v?=
 =?us-ascii?Q?PshsO7xCBlAbPf424e8zsyLSDspAab6+SMyCJOqqIyFPhdys5RenOZJUk9or?=
 =?us-ascii?Q?TVNlx+4G4c04YRFKRjW6Sbetvm7Nh8dogI+DN4UJuUdm76qebYrL1BM7e1z4?=
 =?us-ascii?Q?S288wL06SsDu+4qtk5ZoQOLCylUnrY141++xCWP1ivcFa/v/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c1dc546-99ec-4c16-6b4b-08de87bfa9a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2026 03:03:58.7787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DzH4zHaW+vELrCFzy1v3CvuB3IHC69mMbRUvC45pcxGvgf43dRzt50RIPxnMddH52wP83b35T4nDPHM2daWgxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8811
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_200419_948968_273432B9 
X-CRM114-Status: GOOD (  11.23  )
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

> Subject: [PATCH v2] gpio: mxc: map Both Edge pad wakeup to Rising
> Edge
>=20
> Suspend may fail on i.MX8QM when Falling Edge is used as a pad
> wakeup trigger due to a hardware bug in the detection logic. Since the
> hardware does not support Both Edge wakeup, remap requests for
> Both Edge to Rising Edge by default to avoid hitting this issue.
>=20
> A warning is emitted when Falling Edge is selected on i.MX8QM.
>=20
> Fixes: f60c9eac54af ("gpio: mxc: enable pad wakeup on i.MX8x
> platforms")
> cc: stable@vger.kernel.org
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

