Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6AECD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyuDzba8LgwjhwhapR+zMF/lNmbwn+t9q/HTQamKOlU=; b=sfkd2RKzYg8a8OKpUyqaDBJqB6
	cFvRRt4MCEhhhth96zOapBRGcJlLLbGwAkD3N1vY95gFvwOGBtEu+iwyRC/2QkDFD46BZSF1++zyC
	CJkKyLtLwTFSIUc/LOEYITz8Z3Vtj2Ncn1BWPl5xlAZ4HFC+4p6/qxMSVA/fReg4SShxTaqZX9GkN
	/GoMA9rHNfUm1pTgDPCOSl9k/iwMDkl3UdsiwittlMrvTWfBfIDhl5RED63lzfy/Q7jGuMKhmBwgJ
	CWODEnlXaNVcxsGVjlFM5VJgIb11SsthyiY8B1pqRt3wu1QSS2KADcJm3SxL9pD9Nmc40dIV2jym1
	TCG6+XyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtbO-00000002MMl-1ykF;
	Tue, 26 May 2026 15:21:54 +0000
Received: from mail-northeuropeazon11012008.outbound.protection.outlook.com ([52.101.66.8] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtbM-00000002MLq-2ySf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:21:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TW0kAuJ32hjGixJ56xEnWZNN6JXwPZ0KLTx+aZJjFxyz+dqDRKl3gnzlXTkeT6zhDukkiPouIQjrAUzno1YmJIYMKZTWmMlTiCLIQ1sGkQjk60PvMrl6g5UQuowaKuYSYXh37c85HhD1d2Jh3kZVF7qFHtgdxERvJwicC/ni6IR2zwUk2JbVLwnX3+Cu9xGYT9iibvLjrH6w3SHt16Qq8j8ni3tSG8qfU3fHsfIEXqZggjJz3m0+IYfJrkaXBkyMM7mAwASntgo1uU1ev+pBloP85iQBjMI4tn48x45pJPHyv0XV3N6bCieNNLfTj9MBYAgLUS19JWluYb+/cNlLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QyuDzba8LgwjhwhapR+zMF/lNmbwn+t9q/HTQamKOlU=;
 b=cBngmrgUJVcrZRp+BpTTv3bRYRHG+yOTJIsxqiXsMwfWKjSwcV2Z/5VV/aEYOgw8l27g6tbEeX1DzW0XglLB2YDBkAEqWi1K6qWrypQmFHlAJL3g3jf76V1FXV3YSq8MUSskRUou6K0RxmpxwzhNvQsmGT6XGWdIKv0DWRDA1ywjojh6o/swYKT0pyymqsyE3/jOV/Z0vJD9bzyU9mfroXAHW6Eyq4WwrReUm6eH9NqBLd1h8yhYFN+VobKDzwTG8fcD24aGo8nuMFlkOuqeOQIT+MePJKGPfgF2f2PGVNUvmwNXRIe3GIeFE7Z3S/JX5+soGguzxrBiZT65ezCm3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyuDzba8LgwjhwhapR+zMF/lNmbwn+t9q/HTQamKOlU=;
 b=DwfWC8oA6nxuyCLO2xZF5Js7oRKMWxs6XPR4yi23kUYUHIEPwvw+hp6AjmjikyOuL/9nIdt876JgZq++r5rxbqxYuVa1eHYfdLPCr0Yis3qOia888NQcXDvrysq0KmAtlokT9/8FSAETjSIQBfsGuMHeG7eAQrtSlprckGIMD4FTc4PGfAp0hoxZEtzr/0MsRliqHJc0bLXKPNcHA2+CsVichxwnv4Gt4Cqci+U3gopfq73pBnk7yFIXIjB6bp+AHVqrQB4jX46je6Wm0oPz3WJWZ1PYwwO4QyI/k1dRpvOsX7STIWjrGu5W174KeNk2XAycyFo3YPxCWIfUm67cMA==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS8PR04MB7605.eurprd04.prod.outlook.com
 (2603:10a6:20b:292::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 15:21:45 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%6]) with mapi id 15.21.0048.016; Tue, 26 May 2026
 15:21:44 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
CC: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Ingo Molnar
	<mingo@kernel.org>, Frank Li <frank.li@nxp.com>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH RFT] tty: serial: fsl_lpuart: Add register dump
Thread-Topic: [PATCH RFT] tty: serial: fsl_lpuart: Add register dump
Thread-Index: AQHc7RguiXOUem3zBkK8SdV4HIDu5LYga5sQ
Date: Tue, 26 May 2026 15:21:44 +0000
Message-ID: <VI0PR04MB1211492AAE8858FD14187E922920B2@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260526140113.50372-1-wahrenst@gmx.net>
In-Reply-To: <20260526140113.50372-1-wahrenst@gmx.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|AS8PR04MB7605:EE_
x-ms-office365-filtering-correlation-id: 03234a02-cf4f-4399-6dfa-08debb3a7f2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|56012099003|22082099003|18002099003|38070700021|6133799003|11063799006;
x-microsoft-antispam-message-info: rzNSrcZxZqxtEWsdhvetPTbWkMGL7L7sHSn1hZoYLwsFPC6v0wZDaEb6yxoJXW8TMgIsLD+Ohb84ENRhF4WO/iB+NKmbmcvB50K8T3SCfGai0Cgwr/NXh6GfP9GMpSGIUfjPflzyacmX3mho6b515OlysU+xBTZ9TjV1DB27wRaS86A052Uy+MNntn1aPZikQIc1I5q267Z0ogRZO8qPr5hyOM/4zQOsPbwBqKar4ToTDdiYFklCJ1KBXqoKjtYovXWlN25bzvsYhULQJRc+C+zjvilqtfFwsbz5JAIkXKvp7/Od3ErN+XCJ+Aji1v14oQGUyuam3FDNNU2nsdglw5H8HoFWqBoGAIFXxUIRfY9qlBGSbFs0nDxjdYvpECn04uTMP7vqdAHvlnDxZsrCkpSZCj2jPvsZCbORklef2Qgkj+6qBl+QTnDCDeN6/MHFj+zJxJWFz1eu337SZE6WR77CQ9bjxySLXITbCFubS870SfHwxuuksGSPb0POi/q0CB5ctGwelq43lGhRGBOHImX94t2FLFMUTkqqwJoYw7bvqe78b3+fBMWpKTddbI8W81lM5iH84aIR8DjRdUvtxTbCx4tbqDCOLYQIxm6wHdt7Zj1ie47gJcU4DwHatYEsdb2pmrW9jAZlfgPRBlpbQwvfrTxpbmdpMItBagvpIFVirZQDmPvueYU9rSbOx31uv8ByksnV3N/ibhOeREF27BX/e8tiO3sPY7BOlumnbVrAmCJGlSrgfN1+zUi5zU7w
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(56012099003)(22082099003)(18002099003)(38070700021)(6133799003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lPsLmhsMPCQM1XAEOJlejQ2D9ClJebeG0y/0dtrEfWi+3aFQpPFc6iAPK6EC?=
 =?us-ascii?Q?sU/hYlv+3sbPh2+R6/qBFlDjFLlWgYzJ+qFRDNTBIdcqUGJXVbjAxRQ3eolW?=
 =?us-ascii?Q?fI/RTBtcRiUGfatW48u07rCaFS2xWXVmNcdaNU7aeW54xkafYpGR7aVOoe00?=
 =?us-ascii?Q?mv82eQ/jyEHqo3dVAvBHrLGOAiVInbIJAIYBj+AhCU0pQZwqxsjyaW6YDL0/?=
 =?us-ascii?Q?09en5C62LTzwTwFzOahKUz0Lmu5kxLRO/e0q8SsSuOexIsCU6QaLH64dcz3Y?=
 =?us-ascii?Q?CFBUB7t0zWEoqwDUuJH4WYTqW6sdd7XKR5NlPindMzytUiMNe4OWerk1iaf9?=
 =?us-ascii?Q?IGtTtSi1BAqMaAfYS0KlYNLj7LH72O1dtjQTGxbRDwXmgQotosGlOMvKyIsz?=
 =?us-ascii?Q?4jzLpb1dkH7+LmXELtk4DZXT4DzOgTi4vVrNKX1cYXIVcG8bQDL7e3HH+tXA?=
 =?us-ascii?Q?IklOiHwEJVp5ztaP5cfCmDtPCfrPylOZsyqAaOA3zE49gKsvZeH2GHsozsKi?=
 =?us-ascii?Q?Rnp2He70JqNr3Bnrip2gehQSl7jEnVXZlsJLj40ETcQlJ22GrskV6NcRoBSl?=
 =?us-ascii?Q?pox0hc8QeS4YxifPyb7CPr2595UsWLOXIt9sAj1HaiXuHXGaURuzq8vJF0aB?=
 =?us-ascii?Q?mdtJKUgObaEzQZ9LKVvHy3Iljuoh7nAazNsmAOd4RpLxFfhg6IbeVPA9eqHl?=
 =?us-ascii?Q?wISezdZllbbAW1F9scKjWtmrJ9rvOs30aFJQwqPnj2/wNimqCEMcNwhB++3K?=
 =?us-ascii?Q?vEx2rY3UUeF4z0YwhAnc0kGR2XP4O1eSPn++coK8bJ3yzy2IpR/nzamlEx4T?=
 =?us-ascii?Q?uYp31MLbgBiL7y3TUMmLB9C0QI+M4yu/aauslbMWp+7j9zq77GR0CU/2kY63?=
 =?us-ascii?Q?9O+GGkc9Ctd4fr44k0nG7p1LeyOh8YthY+VbJBbObe7lnkd4dthpc6G8gc0c?=
 =?us-ascii?Q?JHB6rY84vcfWIP0MuoJEA9xdUI6s2CSj/RdeJxgi9hnWHQAVn2JKEJ/ev3x6?=
 =?us-ascii?Q?lCaiMGlJuBS26Qvvy59GNuTJ1k5YMV37LMImySbMGf5TAFvih4qE8OK9hLIB?=
 =?us-ascii?Q?FUALRDwJV2axTZ/GWJN2rmrSpgDJWrNmLCkRF/+aHWTv8ySE88CywocvSFQS?=
 =?us-ascii?Q?XMWd32oPgUk3G+5aKjmF/gsfLLrM21yg2V1VgbgOksx+9GeK698i6CiLeJX1?=
 =?us-ascii?Q?pSDhYs8+rDzltW5WSQ4+SAGMSnFeYmW93Teqvw/871sLH3fHKkkm1c8hOwKx?=
 =?us-ascii?Q?QEjBqwQKQWFCeY8sYSki6voGRJWi9jFL7trYvc9LRmSCc0GTGBa2HbDUIBU9?=
 =?us-ascii?Q?QZd+wtyLCJS4qXW5vDnHkrVGcF3TIu0rhbe9mNHfasSznql7/OTRB2MKRzaP?=
 =?us-ascii?Q?ad7ppMtlXdwHy5VBCqEtBAluXAMAgdCQ1ntCO4FYSL1eUfeRXBAt6cRQkOOD?=
 =?us-ascii?Q?Kb/IyZa27ztlSQNHQPbMxdk1ux/FQ2up3QPIgwsowMJhvuqfBnYOKtNZMkAd?=
 =?us-ascii?Q?Ej5v5SuR7LfjlMqv/OyaR76CQnYclcK8r2m1QIdMd0d0A5eh8BkNGbbBbd4f?=
 =?us-ascii?Q?U7ABFD69brvk7d5oyJ7/k7HaLhY2kuVOf8P/lnOMXjmJsXwXxDCcN6MM5Irr?=
 =?us-ascii?Q?KsGjrQNSO4GudCxDV4wOIrq0JeXoqQt3mOxxyc4bHpLGBugIiRUyEmV139v1?=
 =?us-ascii?Q?VVu8o0U0yHWJHhkx2agWrIT9ol8ZnyXf70aA9GvfwpIyJFMH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03234a02-cf4f-4399-6dfa-08debb3a7f2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2026 15:21:44.8987
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WiJbe/2jE/JpbT6t8LkomijnNtZTHVptfbj7QTCkrgTSOvuLrfsngh4fSbh2X71oub5yw4fe4w/6MHIyjKPlDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7605
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_082152_764827_4F559877 
X-CRM114-Status: GOOD (  25.64  )
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

> Subject: [PATCH RFT] tty: serial: fsl_lpuart: Add register dump
>=20
> Dumping the registers from userspace for debug purposes isn't trivial,
> because runtime PM can gate the required clocks and any read access to
> these registers would result in a lockup.
>=20
> So implement a register dump via debugfs, which deals with the runtime PM=
.

No need, you can disable runtime pm from user space before dump the registe=
rs.
For example: echo on > /sys/bus/platform/devices/29860000.serial/power/cont=
rol

Best Regards
Sherry
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>=20
> Hi, I only have access to a board (i.MX93) with 32 bit registers, so it w=
ould be
> great if someone could test it for 8 bit registers.
>=20
> Thanks
>=20
>  drivers/tty/serial/fsl_lpuart.c | 69 +++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>=20
> diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpu=
art.c index
> 1bd7ec9c81ea..7e4b3e59414a 100644
> --- a/drivers/tty/serial/fsl_lpuart.c
> +++ b/drivers/tty/serial/fsl_lpuart.c
> @@ -10,6 +10,7 @@
>  #include <linux/circ_buf.h>
>  #include <linux/clk.h>
>  #include <linux/console.h>
> +#include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmaengine.h>
> @@ -23,6 +24,7 @@
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/seq_file.h>
>  #include <linux/serial_core.h>
>  #include <linux/slab.h>
>  #include <linux/tty_flip.h>
> @@ -291,6 +293,8 @@ struct lpuart_port {
>  	bool			is_cs7; /* Set to true when character size is 7
> */
>  					/* and the parity is enabled
> 	*/
>  	bool			dma_idle_int;
> +
> +	struct dentry		*debugfs_dir;
>  };
>=20
>  struct lpuart_soc_data {
> @@ -1031,6 +1035,7 @@ static void lpuart32_rxint(struct lpuart_port *spor=
t)
>  	}
>=20
>  out:
> +
>  	uart_unlock_and_check_sysrq(&sport->port);
>=20
>  	tty_flip_buffer_push(port);
> @@ -2860,6 +2865,67 @@ static int lpuart_global_reset(struct lpuart_port
> *sport)
>  	return 0;
>  }
>=20
> +#ifdef CONFIG_DEBUG_FS
> +
> +#define dump_register_hex(_seq, _reg, _sport) \ seq_printf((_seq),
> +"%-12s: 0x%02x\n", #_reg, readb((_sport)->port.membase + (_reg)))
> +
> +#define dump_register32_hex(_seq, _reg, _sport) \ seq_printf((_seq),
> +"%-12s: 0x%08x\n", #_reg, lpuart32_read(&(_sport)->port, _reg))
> +
> +static int regs_show(struct seq_file *s, void *p) {
> +	struct lpuart_port *sport =3D s->private;
> +
> +	pm_runtime_get_sync(sport->port.dev);
> +
> +	if (lpuart_is_32(sport)) {
> +		dump_register32_hex(s, UARTBAUD, sport);
> +		dump_register32_hex(s, UARTSTAT, sport);
> +		dump_register32_hex(s, UARTCTRL, sport);
> +		dump_register32_hex(s, UARTMATCH, sport);
> +		dump_register32_hex(s, UARTMODIR, sport);
> +		dump_register32_hex(s, UARTFIFO, sport);
> +		dump_register32_hex(s, UARTWATER, sport);
> +	} else {
> +		dump_register_hex(s, UARTBDH, sport);
> +		dump_register_hex(s, UARTBDL, sport);
> +		dump_register_hex(s, UARTCR1, sport);
> +		dump_register_hex(s, UARTCR2, sport);
> +		dump_register_hex(s, UARTSR1, sport);
> +		dump_register_hex(s, UARTCR3, sport);
> +		dump_register_hex(s, UARTDR, sport);
> +		dump_register_hex(s, UARTCR4, sport);
> +		dump_register_hex(s, UARTCR5, sport);
> +		dump_register_hex(s, UARTMODEM, sport);
> +		dump_register_hex(s, UARTPFIFO, sport);
> +		dump_register_hex(s, UARTCFIFO, sport);
> +		dump_register_hex(s, UARTSFIFO, sport);
> +		dump_register_hex(s, UARTTWFIFO, sport);
> +		dump_register_hex(s, UARTTCFIFO, sport);
> +		dump_register_hex(s, UARTRWFIFO, sport);
> +	}
> +
> +	pm_runtime_mark_last_busy(sport->port.dev);
> +	pm_runtime_put_autosuspend(sport->port.dev);
> +
> +	return 0;
> +}
> +
> +DEFINE_SHOW_ATTRIBUTE(regs);
> +
> +static void lpuart_init_debugfs(struct lpuart_port *sport) {
> +	sport->debugfs_dir =3D debugfs_create_dir(dev_name(sport-
> >port.dev),
> +						NULL);
> +
> +	debugfs_create_file("regs", 0400, sport->debugfs_dir, sport,
> +&regs_fops); }
> +
> +#else
> +static inline void lpuart_init_debugfs(struct lpuart_port *sport) {}
> +#endif
> +
>  static int lpuart_probe(struct platform_device *pdev)  {
>  	const struct lpuart_soc_data *sdata =3D
> of_device_get_match_data(&pdev->dev);
> @@ -2969,6 +3035,8 @@ static int lpuart_probe(struct platform_device
> *pdev)
>  	if (ret)
>  		goto failed_irq_request;
>=20
> +	lpuart_init_debugfs(sport);
> +
>  	return 0;
>=20
>  failed_irq_request:
> @@ -2987,6 +3055,7 @@ static void lpuart_remove(struct platform_device
> *pdev)  {
>  	struct lpuart_port *sport =3D platform_get_drvdata(pdev);
>=20
> +	debugfs_remove_recursive(sport->debugfs_dir);
>  	uart_remove_one_port(&lpuart_reg, &sport->port);
>=20
>  	lpuart_disable_clks(sport);
> --
> 2.43.0


