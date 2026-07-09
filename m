Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663C6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kCLIJXBl2w39voCh0FBiouFR+dS1XE/RMFL10ASi+CI=; b=zFs7hdlvqzUH8wWhWBO1QwP2Qy
	W0+lTC5deikoYBvzgltjU0hzshqAvMV6E+hj8YvZQV6OmWw72DLbEpZRXASbv9KeM58Bw3Q/F9GRX
	fDoHo2JEnM8gUlGsabUOpIIx4hUZs/8UBuB1iYZI2vCRTTE03jK0HOZfLkyj0vbl0kDvLZDaWNFAX
	xf2CdgLv43jtXg7vXdGPPG4DYhLiYJn0TeeWJvKjeeBRvzq+Ytb+++VFLjqhEZzHRmw+cwU5LYgev
	/qZFJZZzKEcEF5wIJ7dgU7mdWBfaVX/Ne+UmhokTXPvgtPxEM4oYoHh+wLI3vCBtAZDeSS1Mhqk8H
	YcdR0tTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqFu-00000002rY0-3w0I;
	Thu, 09 Jul 2026 15:01:38 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqFs-00000002rXG-3YKN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:01:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IEaezLK7joPVMlDSYO0Ql8183YLd3nKAY5cpaNtkU3Ll1ykUHkw0pu+R3VKXq8Tj8hzIFAM69YMhbD7278hh1VXoK0/0xLObcjaRFEgW2oxXvr78ta3hOYvY4v9jCs4m++ea3216lIOoplgrsIAarH7MHhqC25F8g3pLXyV0ZL3xqAY49+NHmCMQMTTnaIn4ThggZk42Uq781ZuMArOCr329eCngrZt5W7B26DVha4Jk+Xf199ypX1Pvw01g6NR/Ty4B/9XYAWnM/csPMh1aZJL3YFnARa75C+pbxPvI7WLzf+C+yVI5r2rtJ+U032s9n5mOHinQzBK+NNo4PC/Ang==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCLIJXBl2w39voCh0FBiouFR+dS1XE/RMFL10ASi+CI=;
 b=FI+D+yRK1pzH7PWKE2C544CU5Mf3l5lmFo+zZrTRqkRYAG7OJcwjYupQ2PuFtrR5GbajuiNLl4/OyNjQlT2dDJhuitorIi4nEajG3P2gKxMen6pOuBBERC5L1o9Wa8rmW9ZrMswgjUrkFWWVhgw6LEbIdwYGSStpSFse1zp9/91DAPZMX/8aNkQjpOO1SrfSIvcrLQHIe/Hs3wH6YfJDeOy+j1CyCnoFo6bRqoGxPBBd8vNpvocs4U6RKWWmiFodpKsODLzVjCOLDGQPaFhlPrr1d6wySz3N0kZvSHRH8jaYhbJkiaZByuOmxTMWJdGudI/HjCA7QnCh8d1/Yd+KOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCLIJXBl2w39voCh0FBiouFR+dS1XE/RMFL10ASi+CI=;
 b=IkT157QZIFSGrDwEclKNx6pr1gaTgyb1zDC8WtuQSEXn8OF4/NXICGhdo0VaRvD4AiYzqt7P6V6dkjIbeltFi7ZnFYHkMU1ROYVARfNqlVo3HO41Ycta4/kL0GLwQFJUU3D9F125Xdb3hx5rqLRyMn986fmo7FJz/o90pXcgFosinBeVLR2MEtrUFels+2PLiZt1kGl03dbagQnuss0uzjyp3nzeQ8QNbHTeJbn6lWBljqT6AeX2AGmZ5OaoCvqWwylKQquy+5MISvLPfbdxIZvHs19Jv+fIzF5dKx2L8o4X6Hvms8SiDR2AtmXKnmADC/l7BGFHtakVZxgCzzzeuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10759.eurprd04.prod.outlook.com (2603:10a6:800:260::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Thu, 9 Jul
 2026 15:01:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 9 Jul 2026
 15:01:32 +0000
Date: Thu, 9 Jul 2026 10:01:16 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: st,stmpe: add deprecated properties
Message-ID: <ak-3vC3BOoQMj7nT@SMW015318>
References: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
 <20260708-dts-stmpe-v1-1-1f51d15bb358@nxp.com>
 <20260709103237.GF2045740@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709103237.GF2045740@google.com>
X-ClientProxiedBy: PH1PEPF000132EA.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::2e) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10759:EE_
X-MS-Office365-Filtering-Correlation-Id: ed27296e-942d-45e4-b9db-08deddcaf65c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|19092799006|18002099003|4143699003|3023799007|11063799006|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: lANp3EgCTTlqbPPiZyUi4fyBS7QaI47X8L7hxD2sMIqGUAnqMKw8p+lULDRmMfTvgAOpkw2eAKkboyEtK/bcAcFaR6TcvA1sjgPT2xgJ+4SvxBCql5hlZlWxBfYZqoFZQM5Ocgl8W6HLWhZ2ymgizbTw1KokSbSbPhQDxgZCvuisFdRdP/zU+MXWd8egBr6RTJZzlpK9PTwxtX/r23Rwc/eBiUXUTh7eGC531VBigVmD5w8hNY2YFxrUEAeL7g3eG1GCE0GYYQ+qmT7xScFJU7D1SZtmdKGdGRMiZ3Ss2JnzHYdz/aeAHLgicQ958yk5QcgKQe/oQxzYyuoZTEjx0gW+wqkRqKkfFtaPMdVUg4guf8oH9uvkyIKReVtKzz7kRc7guU0CEKg8B1zM/Aq8cAzk0BcDjDJtR63V6S2JzSyaK2UyyxDbk6tMPYJYEo+y7//ZeUPwdSB8qQmbzQlWzp2WlcMKyL5efXxuwcz8ktK19dNMU1Mvf6PTaSnoVV9BFycLaq9RZEtrDUuwoFU+lWQGsXRuL6eQY7yMAKQUt0v63mHPIMK9zXlHrbls6c+S6QS01Ebhu+qQZO+h0ahHNRZAWOKm8ilrRw9fTBsXjZ71q1csG5ZF+ZgQ/OzjRaRe
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(19092799006)(18002099003)(4143699003)(3023799007)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iwyD5QW10DnWfdeKypx0wkXN44um5hCEc6MbfwEMWS8ctK8oBLN7pNEvRI/Z?=
 =?us-ascii?Q?PB93+iwTz/b8dbv0cJbw7OkWzNbauyUf9wabV5xS+9j854dXvakyorjgvV6+?=
 =?us-ascii?Q?Zurpu5HRKdPInDA7tkfestEyFZZw+65CpGdQ4TK8D/46eqn0j4DdTXk+bRiJ?=
 =?us-ascii?Q?GqY3Ssk+VVX7c9fMZF0Pc7b3lJPPJ4MyRVLjOYlnHMUa+cMUo85kaS2PsN0p?=
 =?us-ascii?Q?h2+ThASEXWANlrrsQ4rEn2tF2mehM9ZRIHKLT9II15pEizaUNB/Qv9JIOmC3?=
 =?us-ascii?Q?ZGwK6HYX1c3fuiCG0f9r/kJFZGzYbwJbaRNJTc2Ly20aHf/vtTymq50zlAWx?=
 =?us-ascii?Q?FecNE9XBM57a4bbKGiT87W9W3yAaaK3/rpj97AHb1+JbomtTA2Wm5MawyLGv?=
 =?us-ascii?Q?slswC4S1Trl1s6TQVQ/k/CBCdFB5iLKsivDdONe5XfSmutFGaEpebscUALWO?=
 =?us-ascii?Q?QzpcA8JOZX/zlB/tC4aUvpiePHtVGSwYDcujtbPqloSQhRWa5pZz4lyZwQ8K?=
 =?us-ascii?Q?N7iknB1DZ8vTbgz+2s/8eDJLLMAV/9mytjrgPFDxJR0VZQGKuevrKXhD6J5A?=
 =?us-ascii?Q?SMbrEbK6Q56VYzNnFgOVgFcoKNNyeG6QSFpSp8TS0PP5OixwsLbOU9BI1inh?=
 =?us-ascii?Q?0vhmfDuC8lmNkjYHAPqjd5qEbROBzjuPtf8vd9TlSJlWcnRAzTZD+OyaLkPB?=
 =?us-ascii?Q?41FLURb3lyyMQQlULsZis8OoSRs6/zE6ZSkCzDrZFwGypgziznm3LC8/J4BI?=
 =?us-ascii?Q?ktfArGhFXV3KeHMGTcLfheCtlJkbjFuTmPaBOlK6mAEH2VmWz2qxi6uaUkIV?=
 =?us-ascii?Q?FqR7HTnjNuONj4B8CvLoUuEzfvQ1MqEYDK2aHffFZE14Cy4xOVAhaqIZl6qK?=
 =?us-ascii?Q?o4LuRrYEav35f4wBLJGnCwL94leSXYIAwJBzE33/Qeyk0DHKoohpqMw6Laq8?=
 =?us-ascii?Q?hPTIA/t/f5LSe2hzuzK8CF7GukfVmKKE7XC3BYmgMZ/8YWBD/ykjxUHLuJhb?=
 =?us-ascii?Q?uxzh3vpYrEJ9YNje+4uleXm2BfbRKzejyCSDbgndGrmt5GWpk5OxRh+w/LHs?=
 =?us-ascii?Q?FHGlgLEaV551yL4HTWA5cq0DQcLNkwLFiVFzlP0NfA6MCFt2mj034ifOOmyc?=
 =?us-ascii?Q?480uvVzNPvDN+Yz+jsajIOv1ng31nu7oWcPhrTPMY970GPDFEhs4DtZLr8An?=
 =?us-ascii?Q?e2Jh9KycIZ0wlIyyzh/nFgRMN41ksG7VH/9zsXGnnOb0pCavICOdizHNRvqy?=
 =?us-ascii?Q?3DoYhw8pQZYmumVQrIKwwRSzGBWJsmxIBnKkPlyVHKoeDgEdWp9676IZ2939?=
 =?us-ascii?Q?Klcroa3jqZOgBhMJ8vUP2UKfLAuwdGiIWOgFYNO1htdlitBehz2yhSf+1KsI?=
 =?us-ascii?Q?KqOnYvnGVypC1MY8T2h01GX2m6CrL+GE6Y40Kh/Mdq+55zu8i/FX08SGOuxw?=
 =?us-ascii?Q?4OA9s9Xme8hbLw3NCe+ZfLmGe2t0s5ktsvPklSEZynxPYULzrNeBqz9zsTni?=
 =?us-ascii?Q?72Mv8lGqLbMztnWOzdo+4/uck0ue5wvmNOYW7kcGNYr6jrhQrQLbqtbRe72i?=
 =?us-ascii?Q?FOSX66Cig0DmVkjxY5etmYoQK+K5DW1Rfkzspz9MmNFsvyynM8v4Jbru7rd3?=
 =?us-ascii?Q?9oZvvONNM0O6lxJ6SYhWwOVHBwxYHDPOnmXF207rDqPHj1/dtxH8Eq720g2t?=
 =?us-ascii?Q?rSHNlVaUDLhYk0Ussj53rVqF90JvS54m+YENbDa7rl2cG2Pf6CLgG9bh4ijE?=
 =?us-ascii?Q?f19jN61YkfJoPteyydkTlOvxFXqRrtLIY65gFvxXmTLQW3uOfNLn?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed27296e-942d-45e4-b9db-08deddcaf65c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 15:01:32.2955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ffWr4dnpi3BBHmTQPxxTsc2jyXwZx8N/or2bU+/s9d8ZFn/4TmAj+N0nU3uUS28SXNx0YrkOzOzxKt8RXFzNZFoPR4M3xihRtUXLygno7PHLDbExWuYrI5QxesY2XQJD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_080136_887275_8FD9A1ED 
X-CRM114-Status: GOOD (  17.03  )
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

On Thu, Jul 09, 2026 at 11:32:37AM +0100, Lee Jones wrote:
> On Wed, 08 Jul 2026, Frank.Li@oss.nxp.com wrote:
>
> > From: Frank Li <Frank.Li@nxp.com>
> >
> > Add deprecated properties st,sample-time, st,sample-time, st,mod-12b and
> > st,ref-sel. The both driver drivers/mfd/stmpe.c and
> > drivers/input/touchscreen/stmpe-ts.c parse these information. Some dts
> > put these properties under mfd, but some put these under child node
> > sample_ts.
> >
> > Allow these properties put under sample_ts and mark as deprecated to fix
> > below CHECK_DTBS warnings:
> >   arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: stmpe811@44 (st,stmpe811): touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
> >         from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  .../devicetree/bindings/mfd/st,stmpe.yaml          | 24 ++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
>
> Why is this attached to submission:
>
>   [PATCH 0/3] ARM: dts: imx: cleanup st,stmpe touch screen related CHECK_DTB warings
>
> And where are the other 2 patches?

whole thread should be here
https://lore.kernel.org/imx/CAD++jL=tBRFXzqa6gXNnZ3-DRUMvs=waSdDvq5h5MPHAQoheqw@mail.gmail.com/T/#m08252cde5cb39f897cf06926d87bf782ceafc7ca

I use b4 send, you should be in to list for whole patches.

>
> Pleas send new patches as a new thread.
>
> Never attach a new patch to an existing thread.

Maybe your system has problem, which merge similar email to one thread.
I meet similar issue before, mutt wrong merge two thread.

Frank

>
> --
> Lee Jones

