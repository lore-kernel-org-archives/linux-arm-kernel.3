Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4C2CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4FHW6CaUTl0TueHoFmn4OO/DiEzY5a5IVsUj5WSD1o=; b=AF7HFFe24Py0QGXkGYBxwnX1W+
	OtuTPackAPyfmxfyGMT7hk8AilJbE5Tn04Knce35MzV1dEZsptkPdVb4qjdgPVGxNy5mqZM8R62hT
	UCA9rxtrssXGLVJylffS5D1giufQiDoBHbn61M/DZgskCW9xNyJIXaNTS84uD4RmjWyTJNsHYqgda
	1kZAVYRbEa59pk/q5ap/dQV+AwJZ4UcBaSEHoaIL70g/XSJyh+c1gtOmPrYlr1FDzTaFQtPJFAcWn
	/Q8mXMnPR/FhdBQPODL4t2DqhzzrjdU5apGH8kSvooMxqMNJwlnvRbAvc0MQde4Z7X4JDizG+n2HP
	DIxgp2LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Paa-0000000589g-2IjD;
	Thu, 16 Oct 2025 15:08:24 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9PaY-0000000588T-10gL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:08:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsVzAhOTpfW+TpwNzR9hLnT9DMgAKgMPIQnOC7SggFxxDnJVjQ/dbGr8Gx8Grpby8TK9VxCzHUGuXJoGRL9R00rND3NkdY+RXTZFRxSYoCphFS3UFdERXDuHz/3Df1bLjvLxtOIQzMWuUK6XT3gUeEuUHbzbmRdtDwX0JhOztx/I6fAnMZg9OLbQnT/oe9fZ9DwT+824+UEPAHO/yUdVk5ZqQPvR9N/yQ6GaUocd3znU4QnSN9GjlqDMjVZR90ce5LTIg2mnrqMsUGcCUOxEfuAHheAduxFo9j2l3zxamPDV1J76zlRQcIKvjdWPgR0Hpkt3oFY+zNVSL61gtm6ElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IC/SxxahXzt3OdM1l2qgFO7QCJk7DTwY9YOHCd15y9k=;
 b=YgRrGs0bR5TxLPrIC57oDfvh85y6JauSNDnxmgxPCAW+vekQzgNJWt8c21KcA8PB/Vkavm5oWU2uOXaq1bW5EC8oNWddtw3H8tio6ic+qhCzJ8s47CH17MtgkGplf2NICOyWLGjQve9aZpYQGn7PzKQmRLqBFBrdAPwfxoqCuadcwnQxO6nGIDC5TbqtyoBROgs7p86JiGZ3WtiZXimvPz1aX1hZ/b5AIPfmebC442GlBr5bjNeTzB/mAPVviXuh0NpJZqpcxAohETvJVBmoBafqDQxCE36FSoMnnExOfhsPqev8/MonCcQv1owp8CmEMCJ7iXXXKwm1boc1kHUhgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IC/SxxahXzt3OdM1l2qgFO7QCJk7DTwY9YOHCd15y9k=;
 b=OI4QbeqB+mi/eFaa7RDc1Ao07nybRU0HIobF1w/23Ilpa4TGdbwwFoD6PSoLVPjNf9oq+IFgqn/4lJi/Q8gZTFghl51ww3MpHmxlwlrZkW3ZdzjF6xGiawolQo3YUOhC4x1Gnv+n73Q261kFTL2OnVbjWBZs2JrI8i8p+/0UpeG4iU/qRWp84W+gPQsmh1pEgvdSruRNb6TV3QK/Uuxf7SNoFi8WqGzs70b1aBCZ8t9uTLXd61yWyjohjkPUTfDzXrruxVGTxTIRjSptUfYDZ+rtHbw2jcSFqSqD2heoBbyVgWeEYsTswH/yAxhG4Fy8tiqWM7cbNJGLo3QrkOk8gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI0PR04MB10463.eurprd04.prod.outlook.com (2603:10a6:800:238::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 15:08:14 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 15:08:14 +0000
Date: Thu, 16 Oct 2025 11:08:04 -0400
From: Frank Li <Frank.li@nxp.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH] serial: imx: allow CRTSCTS with RTS/CTS GPIOs
Message-ID: <aPEKVBC++mI+lrKA@lizhi-Precision-Tower-5810>
References: <20251016113730.245341-1-matthias.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251016113730.245341-1-matthias.schiffer@ew.tq-group.com>
X-ClientProxiedBy: BY5PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::36) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI0PR04MB10463:EE_
X-MS-Office365-Filtering-Correlation-Id: ec5d6b7a-866e-4370-f323-08de0cc5d3f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|7416014|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?JrSSzWs1CpoPZUMn6qrlMJ5+Hcy1aqCgAKQxICvD5Vtexx0nlw7JdlCaX3?=
 =?iso-8859-1?Q?HfHPNj5cGPG6Sp7uFnz1mDA0AnZEBVkD5YZ2ydIOZprxflVO+UZCiThHaD?=
 =?iso-8859-1?Q?cOgGbISW46VOndIWuOVS7CaEOSfGO/iU0LOucYHN8p7Z98CVcoD8NLjNQI?=
 =?iso-8859-1?Q?Pr8oeqwG4+sC2W9iNjqC6mNTsRpcjd5/fgpxghEveslC0kI9ET8pFhIuQR?=
 =?iso-8859-1?Q?FZeqvBvf0GAuzlVfLvgcJwG/SBpHQgmwhrh41XI1hyfhEoGwo6PXiHQ52P?=
 =?iso-8859-1?Q?b1qirND7ETjQgm92HTTd8VppYWlLfi8nzgUdr/jg7ZIEYAbz2btfoolLKg?=
 =?iso-8859-1?Q?qjRtRNRwPPYny9CcKzfoIKorPMlkExri/LkUNmz+C+2XQfjGpDoR4acbuJ?=
 =?iso-8859-1?Q?z7zU0WlsFC/rC8im5Ei7ZMhLVY2MB+pUn7VK3pFiJM1clhu0D5ViA9+xE/?=
 =?iso-8859-1?Q?1LftXNFljp8hDYfbppN7SIFi4DZPWNodm5t1+RrGc6t1+oWAdoSTKXmbMB?=
 =?iso-8859-1?Q?Ou9SCHlHVCheyvmLdICWqUm/cxMnwjVSwLClYPHOZNsa3YOiRT7zcaaiXc?=
 =?iso-8859-1?Q?eGj6p5P6c94ZFyoy8pqIzlfD1IPlkafORJT+mBOWrmUkMdlbDsp3H1jR0b?=
 =?iso-8859-1?Q?KTi4yZhGlyAp8/16LEV7Jkdzq4C2+JWVEQo9Iexk9bcILrLl7HXfXTxOuu?=
 =?iso-8859-1?Q?+yOd6aJSAmgBec0NOv9bGDIoGGLNkb79IyyAcvzjmdAkWGWcCagQZiO5qV?=
 =?iso-8859-1?Q?jRTPyFQ8XdwJu83CiW16pMYuY+76OBVK273OwgN3Sp5cKM6Y6+kao7ClAd?=
 =?iso-8859-1?Q?WANayz5OaG4TvAMr03LqFXzliDq+sARpA8Xf2Vrwld+MSO6jiZfbiy5hoC?=
 =?iso-8859-1?Q?AsuZyR49qZFTEHpyocCN5FeYxQk/JP8JyID3FJ3MaPczdGaBLbe37765L4?=
 =?iso-8859-1?Q?Gzzx3i4CVL5Fxd1lWai8henKeP4sE1BZScZHSpeF9NUq3gTMLyPGlcgVvv?=
 =?iso-8859-1?Q?ASuJcnGarnsJ6cV6ORZ7CnRjj+4g0NzzWYIM2fBqStliFZJIgcIS6IXSCM?=
 =?iso-8859-1?Q?3+YZ885AMbKbJqurbRiotUW4gCVBhbrbsN+1itYP3I3sYnhw27bE5i+Uht?=
 =?iso-8859-1?Q?yTXXAQ+aa/f3JbwMFrIUisTydXOebLxNdtLiCgfOQeOEfAMRWY0XD3kOzB?=
 =?iso-8859-1?Q?EmazYAGl8DDZnuZAwU/as+Kt9MLmliYFKSotBpCxfjeZ+C0yAVhUXCq3v6?=
 =?iso-8859-1?Q?/6ZBY0Nm58XJr0IdQouhlKGvjQBqRoKrnpVyOPToNFpXq8P2OgW+L+7qc3?=
 =?iso-8859-1?Q?GD8RMKvEZa5/tvbK9EKJnOePUvTmRdoEjWz/gdew1SPlvlnpc19Klog8B3?=
 =?iso-8859-1?Q?dtNpv9o7IKPa4Q50XGgn80j58mJR/7VVHZhZU0OkHljBJIIRXSUr+lwEaC?=
 =?iso-8859-1?Q?AeB53Fi6ilDkZNQ2m2UAZjM55ASVxcYwF8SSLjmjdkOb4atuUiA5N8YLEH?=
 =?iso-8859-1?Q?nxUC2xUp2M+5JWsjZjoJnYkECxdbJjnNwzZXocPTWEpw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XhlDZQ4c40atExULufP9lsC1GibcADSN6GfkxLQaVf/hIdjIQntinlRnrx?=
 =?iso-8859-1?Q?usjSLDeo3n9kZnCVb1g2kCdMNyCa+FtcpGTS0Tb513yNRd/PPekHF4Dic1?=
 =?iso-8859-1?Q?8WZOO4XA2PY1WgKKgWtMki3pUlRhS5h/SloKDqPhlRY8ks1gdjHlOJG337?=
 =?iso-8859-1?Q?3In2uyeK094m7md76PIyNgOi99B1cdXn6A+LqG6JNoIUS+cXd/GZ596kXv?=
 =?iso-8859-1?Q?0610gFeMSorjZHewVkT4NPcqkufXaiybiTQ/FwA3RsfmuK8uZ0N17rky64?=
 =?iso-8859-1?Q?+dr+iQ6dEfcYU68GTJ2B+iJ21pl5dUJTCOzvwGuX9HjbCqevXzXJsHo4jL?=
 =?iso-8859-1?Q?Lx4B9tuyDXNITYQCwxx7oRazJ1FeAMJBO4B85DIljpezReR6+ZUWeLeJEs?=
 =?iso-8859-1?Q?KlOPWXzD4mWUnr5yf+IWZpitxP25J/iMK7A8yVsb/gDOSuYSVsTE+ql8q5?=
 =?iso-8859-1?Q?qiF9K7cKE9LgzHhFgbLhd6VE8h06lXKzSe5JXTuqZJoZvyzY0RsYHtPICx?=
 =?iso-8859-1?Q?k2WBIVLpcltuCrlVYvmOHzhsAkfEn9cfn9lDHMN3gQdU4d9zjb4CSCsz86?=
 =?iso-8859-1?Q?cVv56GrEyqZStpsZucJgJGkWx0IWOxRpUkc4djvXPZ2zrpf3qdzgGujDWr?=
 =?iso-8859-1?Q?LFp2izaqt5RubDPvdkSaumRq5rKKgDvWNDX6KS7wiF5CMqKT2YwXomPIyT?=
 =?iso-8859-1?Q?FceTL6Gg+EClpUuLqv3YVd6JEs/RToE+fvUOV1NhoAqM/MHleL5jviavlb?=
 =?iso-8859-1?Q?buv98/+LNGBqhIRfZKr02Y54slME059CzLMlbGnSkRGYX40shm60QJxyVa?=
 =?iso-8859-1?Q?SHbiYxPw9ChrPVmmAkORQXad9MmQ+q4gMw3ssIGSWjr1+qoyL4m58Tm9PY?=
 =?iso-8859-1?Q?MFdJ7A6cWCs/Wvg7Bs170+gWhOBU71b5AS1NaEtBknueXcNr13NSdX6SyP?=
 =?iso-8859-1?Q?pU/yvGeSxXDua3OkqRpaeanvK4yMZIJUW5AiSergwRXMO3yBuHduVFSBoJ?=
 =?iso-8859-1?Q?oItFHD7kDAM/1mWnTEzE9R1fHq/nenIUafPTJCcpGX07UxCMintozgrCXB?=
 =?iso-8859-1?Q?cSlPkaVWpVBq3BkguZUJ6Qf/Z2XCLvA+k70OmorKN5TvSG53vZDn8GcdcZ?=
 =?iso-8859-1?Q?Cp28+H+LLY3xGFaVOQiINoEgcV70XccEZd44dsa56S2q5Kzi4so8B2u5RM?=
 =?iso-8859-1?Q?ss79BEvNW2Wksj5EluWhSj3mZqrcLdNG49eSglyLR7+zDXbBe5omP2rl9i?=
 =?iso-8859-1?Q?FgyNzclXEpyfZvAzgbHqktZ1wYkbfqSi8GauCAVlb8p85G5ryEyULpOCeJ?=
 =?iso-8859-1?Q?vTHPfRIyzUWUCmm/lOX5+r8DcDcjD8xmUTqAsVUmAJ30G+SphoQb98RLIg?=
 =?iso-8859-1?Q?W6HOUUTbtADvST76eoXMUsclloCm0oyHN69PjlVzKsWDVO2s9AzgIMtwix?=
 =?iso-8859-1?Q?5TDOpry9r1frKvz8/VvF68/cYRjr90xJgA/yg4H0ZvOlbUxVPeztfkFrRa?=
 =?iso-8859-1?Q?0/1NN6UIeH0gRAH6oHcPSbUpSs2wGqHmyo531Gmjcl7q3Tn15Wp6j3UbYh?=
 =?iso-8859-1?Q?H7zjObQ8Bd+OesE2ElX9jk2BqJ5zpKf7XLsUwPu89Q2i3QsBGJVF0g9H7P?=
 =?iso-8859-1?Q?J4HcefUbG/QFKWtlnaJ2E9ommaIjBnAIad?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec5d6b7a-866e-4370-f323-08de0cc5d3f0
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:08:14.0002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /hn2bF8YO4164OrmuMymZXKi73z+0atcxmOTXe/zcR4XsyKcQ0bPbtu33o4IOI8WBtK9/Ic7+KZqRxcI1ccIFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10463
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_080822_283156_9C2CD888 
X-CRM114-Status: GOOD (  24.75  )
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

On Thu, Oct 16, 2025 at 01:37:30PM +0200, Matthias Schiffer wrote:
> The CTS GPIO is only evaluated when the CRTSCTS termios flag is enabled;
> it should be possible to enable the flag when only GPIO and no hardware-
> controlled RTS/CTS are available. UCR2_IRTS is kept enabled in this case,
> so the hardware CTS is ignored.
>
> Fixes: 58362d5be352 ("serial: imx: implement handshaking using gpios with the mctrl_gpio helper")
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/tty/serial/imx.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> index 500dfc009d03e..4a54a689a0603 100644
> --- a/drivers/tty/serial/imx.c
> +++ b/drivers/tty/serial/imx.c
> @@ -1117,8 +1117,8 @@ static void imx_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
>  			ucr2 |= UCR2_CTS;
>  			/*
>  			 * UCR2_IRTS is unset if and only if the port is
> -			 * configured for CRTSCTS, so we use inverted UCR2_IRTS
> -			 * to get the state to restore to.
> +			 * configured for hardware-controlled CRTSCTS, so we use
> +			 * inverted UCR2_IRTS to get the state to restore to.
>  			 */
>  			if (!(ucr2 & UCR2_IRTS))
>  				ucr2 |= UCR2_CTSC;
> @@ -1780,7 +1780,7 @@ imx_uart_set_termios(struct uart_port *port, struct ktermios *termios,
>  	if ((termios->c_cflag & CSIZE) == CS8)
>  		ucr2 |= UCR2_WS;
>
> -	if (!sport->have_rtscts)
> +	if (!sport->have_rtscts && !sport->have_rtsgpio)
>  		termios->c_cflag &= ~CRTSCTS;
>
>  	if (port->rs485.flags & SER_RS485_ENABLED) {
> @@ -1794,7 +1794,7 @@ imx_uart_set_termios(struct uart_port *port, struct ktermios *termios,
>  		else
>  			imx_uart_rts_inactive(sport, &ucr2);
>
> -	} else if (termios->c_cflag & CRTSCTS) {
> +	} else if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts) {
>  		/*
>  		 * Only let receiver control RTS output if we were not requested
>  		 * to have RTS inactive (which then should take precedence).
> @@ -1803,7 +1803,7 @@ imx_uart_set_termios(struct uart_port *port, struct ktermios *termios,
>  			ucr2 |= UCR2_CTSC;
>  	}
>
> -	if (termios->c_cflag & CRTSCTS)
> +	if ((termios->c_cflag & CRTSCTS) && sport->have_rtscts)
>  		ucr2 &= ~UCR2_IRTS;
>  	if (termios->c_cflag & CSTOPB)
>  		ucr2 |= UCR2_STPB;
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/
>

