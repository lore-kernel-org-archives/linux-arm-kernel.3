Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FA9C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rx71NZ9RTquuvMlBGM4BhygQpphjN/tMpdm0RaFX0Xs=; b=Y9mA44IQ6/eIGOl0oqSWsmhPNO
	S/ARZVxW/4CHbLai6y40wxV1vA/11ACowaUIp+3B8QygKa7sqZkZR3nIHqQY7s8eRRSCW4W41QNh6
	HO3SCr3a2qY1tSkCqft38lpwFTFvmw+ufaFOHV/QoghE2G2Du2J6u61dvhjUzv63DTc99a2VMP8TR
	dx7aS7odTs3NGENRwGXG7YPNb+BaWeSsHkNRWmh+AQj7MaqGuxsg/uDQIoHj612uapxFviKPg/8zy
	n4/OSNNhi2pBEWhbgyJpTlt2LYm/hNROpQi5K4Uzpcs0LrXMlGpqgBSsT5uq3kbpTLQ+a6adOy/gK
	0Xuup+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XQQ-00000007g1Z-1om6;
	Tue, 15 Sep 2026 17:58:34 +0000
Received: from de-smtp-delivery-113.mimecast.com ([194.104.111.113])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XQN-00000007g0X-1N36
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:58:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1789495107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rx71NZ9RTquuvMlBGM4BhygQpphjN/tMpdm0RaFX0Xs=;
	b=SLD/tnlbI7WZK8PoBz1YfmJPS3/KVDTdEnChJT4Xhvy6PwkvnXzNYcO7gUg12NY+OralAa
	J//IRd97A3so2ALqfpP9q53FuR0g27wV1fftxqbbGg/Fy55hMz+0f1cgpQGwRhkqAyLMO0
	yQNjcts9qKKwsoo+okxByAHDowhTMRY=
Received: from GVAP278CU002.outbound.protection.outlook.com
 (mail-switzerlandwestazon11020078.outbound.protection.outlook.com
 [52.101.188.78]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 de-mta-52--kEarTA9PXaAodnX_aO2KQ-2; Tue, 15 Sep 2026 19:57:16 +0200
X-MC-Unique: -kEarTA9PXaAodnX_aO2KQ-2
X-Mimecast-MFC-AGG-ID: -kEarTA9PXaAodnX_aO2KQ_1789495036
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:2e::8) by
 ZR1P278MB1057.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.12; Tue, 15 Sep 2026 17:57:13 +0000
Received: from ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2]) by ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 ([fe80::88:6821:13f5:a5b2%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 17:57:13 +0000
Date: Tue, 15 Sep 2026 19:57:11 +0200
From: Francesco Dolcini <francesco.dolcini@toradex.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Francesco Dolcini <francesco@dolcini.it>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH v2 3/7] arm64: dts: freescale: Add Lino iMX93
Message-ID: <aqmG91HwmKe-enfy@francesco-nb>
References: <20260911091952.96233-1-francesco@dolcini.it>
 <20260911091952.96233-4-francesco@dolcini.it>
 <42ed88a6-d208-482b-94aa-2e45b69c173e@lunn.ch>
 <20260915132806.GA226756@francesco-nb>
 <100eef7b-e1d6-411b-bac5-98790e8f9ea7@lunn.ch>
In-Reply-To: <100eef7b-e1d6-411b-bac5-98790e8f9ea7@lunn.ch>
X-ClientProxiedBy: ZR2P278CA0030.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::20) To ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:2e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZRAP278MB0495:EE_|ZR1P278MB1057:EE_
X-MS-Office365-Filtering-Correlation-Id: 9741ac5e-b988-4e18-a5ba-08df1352c5cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|22082099003|18002099003|4143699003|10067099003|56012099006
X-Microsoft-Antispam-Message-Info: tVNzzijrHYPd/1LDdLY28UUPGz6JBu1KMvPV6Mo/jBwx0RH3P2/sgpFJOUdw25oQoASUmOrewv0Fvo2QvB7Ygv2I8MPGd3QO4r+3fiRYS/vsXbC2RhYd8zCmdzsHUrl84LCAaDhde9UzQcwKAQqQpECY9Nz3mGjLxrmybOkhvb0PvsQLNY+djli9QnEg2JqaU4x4hjOYns+pKU+86LP4PLirQ6tJ33442MWdRbGcHmWSreu+OnT8M4nf5nQz8s4MctRl589dnrrBVHaoK+M+cQHOju7/o7sqUM0GKtXbAX1R029Uxj7bk3Cg4d8w9CWK33P8iLmIJbxqdWzQfttzxsIdhIfFafDPiXnVFaV8D6Z8UsHeC4v5hclHZkw1iZQAqHsm9Ragb4ZWuezaJy+loJkR8R9lZCp8Y9ynAaB9EoBiwRnbNltLvJdBaoYCNYrVTitiXlCiK6ofV2Q3W1yL8ZXyeo57Y0Eio/fyR5VzWHDCWrTrlERBsAf51m9iTkEz5RwnxJjXGQFg2BZz/7KLt7Oaz8S+Ylt/hU4DVF1d/L58atkwOGcYgfc/vU8U7R19bRD2EHQ7htPtzXW0X15O2NTrQT5t/B1XLkQQZkPFiEeVc1pKBKmtCA1ikL87pVwjpeWg1QwHPzF4c3HA7aUiKA+gBlZlqFA4K0MrNekPbyI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1102
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PkiczPe00Ec8DdOSVZ7nV2pmPV3B6FoiHbZVho4ZC9hCDSb5GX7scglnzJTz?=
 =?us-ascii?Q?vWZhVAUPtjrE61alxrBGgDddfGG8RMXKLIdpmo5ZQmeLN1+9OEQW1he3lh7z?=
 =?us-ascii?Q?lNsofEnw8+KW/9KftQkYt6BX5bp0I9zmWaoXdQGbPreDg4WDtdnRxEchYpU3?=
 =?us-ascii?Q?LOZ4a+EYbKDUE290saKKrR7T0aBCIwlJhc38Rjp/AACgLx+7WYEt02Qn6fj+?=
 =?us-ascii?Q?Yizo0FU/07D0Fm5ELDyUbxWPxU/CIkqFLu7oNTlkJVeA6l2FbZe1d5PJD6pz?=
 =?us-ascii?Q?L8V/LoLVxler/B3EwH5fajpaKIyl4TFm5KurlR2EJ2J9vldt7nImi5ImNuMB?=
 =?us-ascii?Q?lhbvdLJ7ovb2tHqsjpONwfjZVNxZhj8UVX+iJe5xkUnQD7qXbRqQnQTxcgcy?=
 =?us-ascii?Q?QzJn5unup0z9X33QDsB/daS8AtZvxAH1DI2NDwVnzLykj8gBziZoHj15uCqU?=
 =?us-ascii?Q?MP2XwxMoBXw4qQqyFxuVv/vp4lbx1Y2rDejDdYc0tQwbG02Z5xPMpYNyVqdC?=
 =?us-ascii?Q?22acKuKlkMl/oqYR9UYHDCaVxEUAmOma+mGQJEYrFU2LCwuBfACQc3nd5KO/?=
 =?us-ascii?Q?5lKkza1G1HevQhFZoH7MpHyc69tKpKHSvmJyzcHxblGGCJl1p41JbXSAlERJ?=
 =?us-ascii?Q?StNOkF/AkBrmFxUn5nuog20a7OWahl+hpj/vYc/idD0DBgfZXwJsi8C6Tdo3?=
 =?us-ascii?Q?GlhMLKtfxiDK0U28PBzR0GLXlDG8AQA8/h8lLuuKZE8IQ/uTtkZMVID4OTZr?=
 =?us-ascii?Q?85VksxotFmGSswFkuI8TfpFd530D8Tzw0KLsqBkyX+H/2pweXKgCG4RbdSXh?=
 =?us-ascii?Q?J0VD4XbTsbBYG2xe62VOn9Pzhjo+CAXngescUE6wbhJN2HLkSWGMAz77Nbl9?=
 =?us-ascii?Q?/qj/hDLpb8zYkP1mnqU2bVTzGkwebtZ8e1ANtfxmjZV5GxoD2P52W2pqX0TF?=
 =?us-ascii?Q?sJTBLYy78T5BDy3VpAkGLH4dD3RhTgHpGbw8+verafNAFn4D2GKFlJKOsIgt?=
 =?us-ascii?Q?6ABGF9/aJkKOyVcPTh6WUgYpJzU9TZ8NfswKjM1Ydxl8ApwYnrvOzI/mnfnc?=
 =?us-ascii?Q?Nbz0qIbgNqvLGeAT9YxvnCQF3S4iOOFaxaK522wJePxYtGciTQn3PjYimuoF?=
 =?us-ascii?Q?Kp+Psx7LQuwZswUgGr/WEhThGHq4k4kJ35UeZo1udUzb2qc5Lt+frk/sT9M0?=
 =?us-ascii?Q?0Q4vZf/SXgiLdM0op8RJKWVkYtVD6fTis2g8gRmLnNJCkQ/JM3CLazmfyWYb?=
 =?us-ascii?Q?MoTbXJntQv2ppwTzXcXVlZuM1m6WNHInPmYCo+HHpij3XBdYAjq0lrzSK6Fh?=
 =?us-ascii?Q?9jlPnRVFoh5u/bW56iIensX9DJhByQBTqwuoO3h+zR99VcAuaPT5cChnemRh?=
 =?us-ascii?Q?2H+LxUPqDsVgUDRkajfND+yIO/pA1fFvvIZZqIASQAcsQ2gIQDFVbAlszocY?=
 =?us-ascii?Q?Hu0R1FmbxEuEsJ85gFbVCN/dSrPP5VXa0bioOXpER6WaD9Rqltlb9nU9ZZXe?=
 =?us-ascii?Q?8gPpBY8B78sgQRMxlcks8Y/zG1ZBWJoJUV2vHYIbDo6t3f6MvY9s6cLOiZap?=
 =?us-ascii?Q?AxJ2VF+NCHxyDxUrgFzAMJhauKgomi1TgF8SBxtugScrjdA8gsKaf7A8JYyF?=
 =?us-ascii?Q?x3IrjIwBlcIImG74pyZWYHwDxvRXgD3SJDbcpVdgvupoQPy+lICIq/WWFOob?=
 =?us-ascii?Q?pcW1eu0E6rUD8BReap9VGcFhG2AlM46khSQfip5lIO0yhLWU/nbmUg5iKBG3?=
 =?us-ascii?Q?Sm4ABrFQPfcLcSOHtsXHuBaSGvNsuv8=3D?=
X-Exchange-RoutingPolicyChecked: WhyVRNuo7NozkKRNPSMNMPNuEhXlxx7RpDSnpDGrw/flE6noPTjJFvdLgCJFaX7//LpAN96FqQ/fFbNkKbD0EVIXxI03CmlcVjXAGkekbeCSCx8e8rm+5x/9+HP0AR99vXWpOXTKUkzN3y7/vkdt7ZGDuuolfK6IyrdBPMnUjWNMvoNkec9l13yQmuK3q2PKxcToNf8cw5F0u52luvVXqYjAlmeO0cJX6kXk/m69dGTS3KbTuh/TZL+uLytoeoab3OwOGyGJHRPjW6+H7dRs11fRfTBfn90FD9IMK+MoP0d/bV9FvN+iMzaKQpuc9jo2Y+0U8N1ZWAYphKLWj3/TZQ==
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9741ac5e-b988-4e18-a5ba-08df1352c5cb
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0495.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 17:57:13.8353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apqufXXPYgAvcKSynoD6HtFMsGNjRB4bJJdHjEctuwQ3yy/O+Sww4GDWwnQnYc/LJdYHucgsAEsn3h1TqobCQftYupyhJFgdnrsMXUs71JM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1057
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ur1odX454CuIcEcWBlu8wDqOlrKmxjSpqgxXLuaIcIk_1789495036
X-Mimecast-Originator: toradex.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_105831_526479_E39DD1C5 
X-CRM114-Status: GOOD (  18.40  )
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

Hello Andrew,

On Tue, Sep 15, 2026 at 06:49:19PM +0200, Andrew Lunn wrote:
> On Tue, Sep 15, 2026 at 03:28:06PM +0200, Francesco Dolcini wrote:
> > On Tue, Sep 15, 2026 at 03:19:45PM +0200, Andrew Lunn wrote:
> > > > +=09ethphy1: ethernet-phy@1 {
> > > > +=09=09reg =3D <1>;
> > > > +=09=09interrupt-parent =3D <&adapter_gpio_expander>;
> > > > +=09=09interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> > >=20
> > > Falling interrupts is probably wrong. They are normally level, active
> > > low.
> >=20
> > It is wanted. The I2C ioexpander component used for the interrupt
> > supports only edge interrupts. We tested it and it works fine like that=
.
>=20
> It works, until it does not work, because you hit a race condition
> with the hardware, two interrupts in quick succession. The second one
> gets lost, and your link remains down forever.

Would you mind to articulate in which situation such race condition can
happen? I tried to think a little bit about it and I cannot think of
anything. I asked google about it and it pointed out to a patch of
myself ... (https://lkml.org/lkml/2022/5/16/1186)

This limitation is something that exist also with the TI SoC, for
example, also there only edge is supported.

> >  - when we tested it, the SW emulation was not really reliable, and we
> >    prefer to play on the safe side
>=20
> If you want to be safe, delete the interrupt properties and let phylib
> poll the PHY. That always works.

Yes, with the 1Hz polling. That might be too slow for some use cases.

Francesco


