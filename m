Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71414C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 08:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vt5kQSK4u0umkEyEjEa3tXHmt45y06Jj4V/i/PNwFSk=; b=KmCFe1ZaoOBl02oPQYyb27LtEQ
	UJvD9odvEXWUbikaIuitKwklSNZUlxEqQxCaYMPMSF6QGWa22LcigALw6I8dnJOQIXMtCVXHj9MrY
	Sa+9ex9Nm4eqI6XDmA0wXPcoFPlgq6fH6nLH3dxdOE3BmU0dTeFrBEDli5CPydOPB8DyiW26Xpr88
	KgoODG9Q1Ul3PmrWdl8K+g+uTpd3HQ7wvFMJctmDJbktEaDugVS7pd0URrU8DJBNhsGpIRR9P+a9C
	DytH7NZKQKo8qBBMoKM4zjCJw+6c1oHKqjoG7y9wblgs8o9Hz/T8s+P+qWkx7IcUiKWgAYp/rufh1
	bkFBdRuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gLk-00000008wgA-38gY;
	Tue, 29 Apr 2025 08:29:56 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9gHn-00000008vkS-3Izy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 08:25:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0hkYY8BRmEEcfW8QzPhwxPs6dxK2LWcQXU/Ykp/tehD4/DHSDcop0/6zSGl42fJGPxo7bkTA5Juki1W7ePnJLQBIBEPs3msfu8imjSYek8LTDHXzYMtg4k8IKhcXoaKCmb2HEUrY/ULYtZAp3bqL6qMb9zpSyt8tzlNlKpq4eD39v7NvZWMrhzJIR60WL3SNCJirJeGdlGaaWwn0tGtm7ceWYYAbHXGocNtaGwdG9oiodz/jG0PUdvaiNlBac42AXfYzdt74ojKTnRIzUuqz3Ne6UtcBzMw07G5OXrWdyPhSfDv0QBkGyQXxAn0Nm5f+54gxysBb9xkHlQg2D+8Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vt5kQSK4u0umkEyEjEa3tXHmt45y06Jj4V/i/PNwFSk=;
 b=SXMMI2VVMQwLLo5+BNWMyBnpfUKho6JeOqelKN7l/ga44PIiEZRZ4qbe0MOMH2dT/BQZtGzMXqxoN2YBRj1hFbksasb+A4pv5JzEbY5s5UZ6reMiiUJQOKnyk3cZUq6MCIzM1bcnaRzzoMapoPMnKfZ3bkAUVYP51S5CmTCeVw8El1bbTwxbac7efUSIVdqteaMKplE0PpJxC7L8gZsnOSDxIhAlWB2P0YzwZ0SAJrQmzMIUnTxJkYspAf4Z0sYtpdkSMkCRPEkXbih2jA7CS/s9qtH15CmdjM1yY/tZp27gkgui4N70euCCxEpS/UzdJLl5h3L7xF/qUlxNfAgHHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vt5kQSK4u0umkEyEjEa3tXHmt45y06Jj4V/i/PNwFSk=;
 b=McR7zXV4Xk/JFUgc0RghP2FGAE0UkSyfhA2x2k30k2EkfMoQWZBy72kjTMGvZwy1v+/Smqi2NNcsTWaWFSesvxKEBgnZ3acWO2CshmkseaToGkwJTD6p2GTZshUO+M0WPwoetsEYtvWcLd/lMPyBiadVXiw9Qc29w/t+h5XAaAH7IBgkN7jC8I7dzBb+YvD6N+aYxd0kCbFutn5vGnO0HqtpthJJxaNFAoZlq7AFpNuVKF7hkLiAAsUFC6twa3+6qWuMCHjCVeevjSLfJeqQvPSU/fIWFoyConZjKuRO8NqCj1kpK9+jnFv6POCzrIsjEpoQujLllfbSVXZCJLNJHQ==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB9269.eurprd04.prod.outlook.com
 (2603:10a6:102:2a4::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 08:25:47 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 08:25:47 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Aisheng Dong <aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Thread-Topic: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Thread-Index: AQHbuOBPK7wvQPUQv0W+RHQ863q5GQ==
Date: Tue, 29 Apr 2025 08:25:47 +0000
Message-ID: <VI2PR04MB11147A01165E7505FE44BD1BAE8802@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20250421062341.2471922-1-carlos.song@nxp.com>
 <ujjbteer3ripubpgmv5qsvhcoki5ibcp4im7vpnna56mbckacl@xxx52nayhw7e>
In-Reply-To: <ujjbteer3ripubpgmv5qsvhcoki5ibcp4im7vpnna56mbckacl@xxx52nayhw7e>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|PA4PR04MB9269:EE_
x-ms-office365-filtering-correlation-id: 9bd53f56-a0cb-43c7-f57f-08dd86f77188
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?sYfNDTJs9k3kD7OjK38Zt6uDZuzpW4VGvEzmbEhrF/TsQZ72xPv/Z99ewjZl?=
 =?us-ascii?Q?j1h/W/17s38IGyi5UY7r9iLy/HuD/UHCumvP8IR1fixkLKo1+CyEIG/4Oa4y?=
 =?us-ascii?Q?r4eJDRRuSlvghoHknzY5CTF2tg8lP/jkqrWXbTS2fOO4Lx2nq7LPutqC+0C6?=
 =?us-ascii?Q?vJEBn28pc6dqTZEXy3O0wUzdtJs3T/IZwm3fSuzeVnIlrxAEjdRKGqRGBiAF?=
 =?us-ascii?Q?OvKMHrPUYlKOd9bQA+Z4UaVN8p0AUpvEe/jcQ81ZaPilo8nzme+DVo9b6AB9?=
 =?us-ascii?Q?MtlRz81iG2waPccDtdrkGijnn9PDBeQfMawXQDTrcyCElsPvVgA6iFRajnY2?=
 =?us-ascii?Q?gw8yZrBjnYkY+W0vBpl26t9enUUdiEtz3VSfuIqXo7g9MwCB8m+gfvX9q2zq?=
 =?us-ascii?Q?h8MWYOml8zNR68temZ0oZ/ajreQT0ykPxgZgkTbfqb32opuveJZItcJC/9pt?=
 =?us-ascii?Q?nManxdzcoJv2DayJGvcJM/URkwHMZ8PpGvdqpZt8wI2mBtiUR9uwNriRbtfi?=
 =?us-ascii?Q?S4zlh2rvI1COlaaGFCXkUZT3Efr+5g1tPX+jk4vMPaMY0EtiK5Kg4iGKJadz?=
 =?us-ascii?Q?I850k/H4XKtv6eekTomIotoeAjvTpJWNFPfrV/Yfr8cxsmx8Y2UvfbSSXHQu?=
 =?us-ascii?Q?W884GjYVfHvrQ1RyzKaJfhuPHsplniyhmXoAh88HZlgLecrRRkakKbYOByuR?=
 =?us-ascii?Q?esicCuS1jb7iQ2tGKXWPxnENBT3B/gSQbY2fiYNsZJIVFned1pWMwtuWR9qf?=
 =?us-ascii?Q?N3yf6nL++Hu8ulN//l/u0kacaE/lxZESJKvgiJjmID0+ZX7rEOssPrqLbWFn?=
 =?us-ascii?Q?hO9hfwpJk+YA430gjztI7kowvsbPZ/Z6Uw/J2V4vFGoMuPaNXVfHOo6Lx713?=
 =?us-ascii?Q?6jYxn8IziNdW3wL+Y2bsWcdn2XZb4gC1HaV7ORUgPVEBI1O/LIugCIOeOKPj?=
 =?us-ascii?Q?uBS7ehXVJOEMEfevl1OhuJ7DM4g01o3zlcFkEmYEQbHg2r2iTU3Zt2OGQCS+?=
 =?us-ascii?Q?uk8vKU0IOPA8vOC3/V6dNuHa+eqlN/gJ4hjpcCHQz/NNyFrFf3YSWAx+2gD4?=
 =?us-ascii?Q?qt99J96s0ZiMMRkbAE7Y0Z9bxLdQQgJZvqPPZ10wGX63E26vUvTxQyLWZzsm?=
 =?us-ascii?Q?zWe7NJMEDjqDvEZOrcYcZCmzxQgxenzEN639fhtdUx8VKdjEpZDTnkOjYLis?=
 =?us-ascii?Q?BpuDlD8wTLNdaLzq7rPer2jYCZherOnzb4TCZ1sG81uJw3WYbpTShaBOpBgt?=
 =?us-ascii?Q?z+M5+ubn11WSrc2GrpUustyLpnM3DqKDg/HHMafbLkGDpPB9mPZJrEdxMw0A?=
 =?us-ascii?Q?Nv0+3EcJm0b6TJ3V9MUHp8buvgFcB2tY9k+u/g9H7J8DPhFKuA9mWofpmM0X?=
 =?us-ascii?Q?MLnz4aNp47ksyhahScQQ8yFrOZrZ4hsYfOZIwMtPRwm4QforTicgOolJCaAH?=
 =?us-ascii?Q?F2aI3J6fzP7x7TUgXIVqi2Nga8YZ+ndHujod54RvImwHXEvIrcOMl2RfCavX?=
 =?us-ascii?Q?UhkbLENX7eUCyjc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M+3kSKmiqowFSgjdo13zb/tKdk063OPEVh2S+N1Jf+VFbDbQRe+JRVp0oTuQ?=
 =?us-ascii?Q?IArhzJ+UHHdUUcHrdY225s+l5AkZQ6FpU8nmKjoFss168S0PBFzdkENEvtGd?=
 =?us-ascii?Q?HD3Yo5aMG/HgOCF8cpJpRYzVQmOdjfiX3qdqUe0a6JCk3gma3LCJ6ASUbcrX?=
 =?us-ascii?Q?B9RQqf5N5WULfwE7xFinJhwcN04sSe9zCnH0QrZ8l+6xbgzRpI1dufSUCUnQ?=
 =?us-ascii?Q?ogIdKOqdL89ayjUc1ggVrjyQjGRmhoPyt3Pgd/QID50RTcKnYcAb1E7A2n81?=
 =?us-ascii?Q?KsvfXTC8tuKUweMnevO11fozKOd/syKZiFxi5CrPPT8iD98z3GdNRbjhrlt7?=
 =?us-ascii?Q?+WFm3cYiXqBLelsPDtP5w5CiqQ9n+BQ7HLGwx+O6EXZtl3JZcVtN6lgfb0Ew?=
 =?us-ascii?Q?XDf4TgAtahpyR/5RDgGHKu0cwVnFbS9p3p/OMIzDuYXrZX7BnQ81gE85nR2s?=
 =?us-ascii?Q?rksHqZ0JcMCXnet7InrB1aNmQMqSBV/sT2bzQSJvtccHr+2jmHUz5WKpFnQX?=
 =?us-ascii?Q?j9MbFmruBaxGcJ5+i1tqc+FthFgcaPGKwPbVjnMLLEw+QaAB72IZTzaIl9Ao?=
 =?us-ascii?Q?BRmWXH12e9rzxSlLZU3U9kFXsfbSFuHWO7QlmEDvRoWqI7bMWaj9wFAp5MP7?=
 =?us-ascii?Q?xsVv9X5D8+fUTOdfXplHgI7iJxEApSDtTqVS3n94iZ+GFed2rj0xT76UTL7+?=
 =?us-ascii?Q?CGccKvK3mbbJQWFCPYjmmEWDN9xjId6+AiNOHLwWitpCodR98BKxZlbf3EVI?=
 =?us-ascii?Q?oEd9VC/3yZf4lvas+8BpIyd3JOv9rz/QxYBAAwLyT835n4Kp7rHa4/qes9n7?=
 =?us-ascii?Q?iN/VE0YWAbei6gHqO/YW9erHkg2OeuddJiqBeYS52q0VLTdsu4wg05sVtvXM?=
 =?us-ascii?Q?Ntdm2w9QGnPkatqVoWrhm/cVWMW0Y2OiteCsoA5Z7OXjk1Nq+3/d2MN1QqBc?=
 =?us-ascii?Q?tpgJr22W4HokePempqBnJiL46cGZQJAvSHmPCPCH0btyFHICWqlfNP0N2ZAQ?=
 =?us-ascii?Q?sTw3xJ0eh0KwhDWmfY94MTLii6gjerDlCqiMpG6KtNvYvzs5361QIgH1aBCE?=
 =?us-ascii?Q?fL1z5bvTtGkjOrugrhxm8ZJPFsAGW1FDANMoWCgoxbt7NLJ3mDls76TmfxVK?=
 =?us-ascii?Q?Zp+Po1Yl8y+jNiR7cKO8MaVJTnvyn9VYK6mmgvFOo1Rg83+fuPbRGWYQvWNv?=
 =?us-ascii?Q?08JD4L7k3MpLoD9gmyqLawKXx+yb3xcy9USoJlRTKZic5MOgoMptnBrdNFnp?=
 =?us-ascii?Q?HSL/lPazMStss2w5Np64IPf5XtD7zvZXemM8Tp5yIko7XU79tDw9qL/dix4I?=
 =?us-ascii?Q?p/WPMAi7SUmYXNoqCaYii+C6pK6wcwbGpZA3WjS7eC3nEDenT4S57MSuez1u?=
 =?us-ascii?Q?VepypMJW6GN61dKHb/A4TEaR61rUZf8PEx0GAj/jcbYe/moqvUezQQYilBnw?=
 =?us-ascii?Q?QQOUZPF6ZGJS3/WSkHXDv4pmqS6dnrC0Y/iL/tXAYWD9fWg6AFg2p8IWuxcB?=
 =?us-ascii?Q?zfT2pTilC6xwmac/fOKKvJ6od02v9o6CUECbnWNOtHjjzy8tXTJS4EAPTtX/?=
 =?us-ascii?Q?+l9L8toEvLqCcJnHO7Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd53f56-a0cb-43c7-f57f-08dd86f77188
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 08:25:47.5877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ttI1VfH4cwK51VYfdhNMUE0M4OgRkFhwlF2NuVu3O+F20bZ8S6D9Nd0+Fu9Bk/6XEr2SbXf13jVGrua8p8C3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9269
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_012551_842819_E8AE740F 
X-CRM114-Status: GOOD (  15.93  )
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



> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Tuesday, April 29, 2025 4:21 PM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>; Frank Li <frank.li@nxp.com>;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe def=
ers
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Hi Carlos,
>=20
> On Mon, Apr 21, 2025 at 02:23:41PM +0800, carlos.song@nxp.com wrote:
> > From: Clark Wang <xiaoning.wang@nxp.com>
> >
> > Deferred probe with pm_runtime_put() may delay clock disable, causing
> > incorrect clock usage count. Use pm_runtime_put_sync() to ensure the
> > clock is disabled immediately.
> >
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > Signed-off-by: Jun Li <jun.li@nxp.com>
> > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>=20
> merged to i2c/i2c-host-fixes with all the changes I suggested.
>=20

That's good! Thank you very much!

> Thanks,
> Andi

