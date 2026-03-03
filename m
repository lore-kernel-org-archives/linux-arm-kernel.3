Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B32EB365C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 02:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShPey4FUZ9lXgah50KcLPGfsWtPDOBgekggZmtB8wCE=; b=uw0rHVJkkJBqIuqQpV+OuwXuUI
	J3cpLdqJasRKYKzSz08h+dcFsHY0esOAS88nhuByBtH7Uj2a0T9GV0sPPq1tmd3GLa39DWivNr8d6
	MR5wP3t/OJWSgeP88kDfUjs+6Eu4NnSU+im3jry+1tRBVi0ScgZPozMKVZBnvxqSuhC45UCVWUr+k
	Nh0nMkE3BPzM2hXaQjmWp1vsaJkzI8Vg/k4RjTXvU3WMbEEshmZhyT5Z2xINNNGCgKRnX46AxRi3C
	5wGgziegO191zRL4qqpgQKoWmtOu5e9LFS9kFy8Iid0xLm/laZE0OSXcv32jpSc5PxWvfyuoXvJ95
	P9hDr8qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxFtn-0000000EQUs-23SV;
	Tue, 03 Mar 2026 02:54:15 +0000
Received: from mail-francecentralazon11013052.outbound.protection.outlook.com ([40.107.162.52] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxFtl-0000000EQUS-0hnD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 02:54:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llUQnmc+K1Ctrazmc9XP+as1q0p2QtEjfFWR0q+nMLqrTPRa3Uted3b61oMKiVX84Pjh2oG+sWdMoHTIfb5rcyLZcrBgdCEHucxFZlBmJixb4x9HnnyWzUrJTyI3lFunrBf+EqiPT8Azi3n0BAWnjhiw32dnE8AoCEfO8NEUBdWtY5Sczp6tS2q/VqJhbT7M/QVbZkwDpIZNBdoz5YlnZF3U1CoPYvn/6JTu4OukWhx0gal2D/xDF+0zdUzmQ4k7I1rpDESHIMUcCcapAgdDbpJCLryAkOHrKxnGP9lkskJexcBHs6bAvqbi68zYtwZJXBXwdpx7Yi/WdfiNATChvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShPey4FUZ9lXgah50KcLPGfsWtPDOBgekggZmtB8wCE=;
 b=vTFo1Qo7DAoEEO+ttNdkBHJtqHPZn5kqhPvUag5nMr0lUOvRHeiPuSY2daZ+V+zEOUnb9dSU4FeuPKOt3s+Oz0MREz7dgQVspKnNSQzEHgtZ82j+yY0HeLtavC+1nrVFFougkfljgc4exbyfNNIlkkZQqGPJeE4g3DbeBtWVd4OHymC6t7PhDK8uWdkYxe4CNT/br2bwTIGhxkY/dPfKaCo/WvuTWY0s8mNHdr5tvbXd1bSvVaQ488nFEs5KZpl30/TDenSpr08iFpza7O5GHOEbk99ISTxRh4iSwrTCkzI7uPaPYSLUFvSGcRoQIKucqVf+ZwkkBFKektgWPe5nPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShPey4FUZ9lXgah50KcLPGfsWtPDOBgekggZmtB8wCE=;
 b=d5pc458pjK7PXCrNzSB94ZfTgfTlQtuiG/bTznc84aFkf8nDgJyQjDM0MkQcH4mavc/CPRRsBsJWPc/fCPe033vXx7vDTBeIP8KoouiruFnRf8fxlsv5J79zlby0zINLtzIEE2vNCt61QJlh/EE2N8sZOLcfKVuKAABSNd0+UQh15fFqFqZS52shoUCLsKy/LQOpjbVwhmHLwAPD0VJtgbWvpM/gUNLQbvPvdpRcM360x8P8jt9GS9recPwPs33AZdmzRZXtpNiQE6HFIjumURTfi7Luxcb4NoNlVWLYoZRP6KIUs3EJ0pnElr8oUBAByJziGO0SGKuse1s8IDFVeA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB8013.eurprd04.prod.outlook.com (2603:10a6:102:c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 02:54:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Tue, 3 Mar 2026
 02:54:05 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Brian Masney <bmasney@redhat.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Cristian Marussi <cristian.marussi@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "sudeep.holla@arm.com"
	<sudeep.holla@arm.com>, "philip.radford@arm.com" <philip.radford@arm.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, "vincent.guittot@linaro.org"
	<vincent.guittot@linaro.org>, "etienne.carriere@foss.st.com"
	<etienne.carriere@foss.st.com>, "michal.simek@amd.com"
	<michal.simek@amd.com>, "dan.carpenter@linaro.org"
	<dan.carpenter@linaro.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "kuninori.morimoto.gx@renesas.com"
	<kuninori.morimoto.gx@renesas.com>, "marek.vasut+renesas@gmail.com"
	<marek.vasut+renesas@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: RE: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Thread-Topic: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Thread-Index: AQHcp/9lAoUMJunS2UiMm4HYHJF3xLWXSggAgAQ1IQCAAKK28A==
Date: Tue, 3 Mar 2026 02:54:05 +0000
Message-ID: <PAXPR04MB84592B666C8A19994C2903C2887FA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-3-cristian.marussi@arm.com>
 <aaI9JBwWaMmfBbd/@shlinux89> <aaXEtNilpRYhwmYc@redhat.com>
In-Reply-To: <aaXEtNilpRYhwmYc@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA4PR04MB8013:EE_
x-ms-office365-filtering-correlation-id: 6acc58d7-ebb7-4ac8-f887-08de78d0226b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|38070700021;
x-microsoft-antispam-message-info: TuI2bVkxIc6f59hF3h+1K7QvmrIMT82qkERaIOTyInkj+sVoNXGRw/PHMmBS/jVPpXWKPiCVyuxJSWZ5DTQ+ZMUQB+rc3hNvEL7FYR/Ph9d9h3XK1rzCFLCxdtpCN16JmDdD7uAQC9Q+9wUGuPNUG22/9JOSwDXAP460S2x5MHn8hXPfa7JeyB13+HD63z9RcVXGUeFMM63As/GfRYDSoEkI3c9w2El3Lv1fE2wFoplS2WwOrTdKkytt4Pg8VmWhXzuHc7SCqNvQfbkq5hlPYvAn2ZPIAY58Z+AbQdqPUifpfGuNQkaFLB44kUvAuRk3VPYaIsAWFyfj/8B7kqB66YIWmjWMs+85dapXTkZELoytBBMHDBRpo1rGZVXrDBi3Rshg9YnOPToEFU654+viVzCqa4f+ZUJIf9PA+cvWuHWkuEfkSqj9KmLUYK39crYEYYFWG5DZtxT5vqQpeM6h4saOqKXLaj8a/LE3SlcCPrLdppaSpsuG2giZfxhNU6sCB8ybT9UU5edjbUVDKsZnzqwZX2mUQgonoV0VmqyLciA/jNZNNaZ/axuraC8l9rx58O5Ridc6kfP5vMOpGLORBD5XuupPaBLqBZD9TcU5k/KdNIyfN4R883MKVGXKGpXo9NSRvq8s9Xn0crNKz2cMZTOq+y1E6TW8cwnFWIARTz28SAxMkksvPi1Fs+mQYXsbip5TQB4imFWKgAojiv1+NX215foI/UNxIE9DfknCohdD9rg8gCfJE3a3dbdtClwNURQ1ir+tOTUKTauqQVibQ6nGFOn0Xu6PYtOkSHzTMGY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GjHJQQesRzSPc7AkaT9F+q3C7BlJtEqatstoVwdcyaIP12yJVLrtjDXzaQKO?=
 =?us-ascii?Q?430CMCuOWz1ACOm4dukrQIWH6lJHI1hhazhyn6PENxomGOq1gmpRmbDDrS7+?=
 =?us-ascii?Q?SqJSeibx8P0s/GmC57Izff3vg8kdGdcAR9J7mmESRGDCqLl4jdidP8Kr/6gR?=
 =?us-ascii?Q?RhFEk1S4/zz9WwbUADlLOJi+LHm/hEsMi4soLex4vhxbMrI68bOhCX10Oye9?=
 =?us-ascii?Q?dtFkvNGSmyGJQN88SunzlHYprrKkj8+x/i3avnSmo76PeSHl/9jLzxLuQaHT?=
 =?us-ascii?Q?yucIx1+j84pf24dC0WvP790+5UC+A15lMzrRa/RAVUuJhLGsjgCsqXuClMv2?=
 =?us-ascii?Q?tFTt3Nlgk2X+uXSnikpvR7r+L5XH7XWk+9IVHV3K+bytj7olf+y9kD1tldSJ?=
 =?us-ascii?Q?FUMXFRT8KRNfptADif8mSvPSSDTWg09cXGh+PKLIlgbTyvrw6KAduL1sN0ok?=
 =?us-ascii?Q?RTYUbXQ4JpSlGdeFdP0wTdRdohE6q7MXpk1TvIJP/nuyk9Xoj4T8K22Ku+fr?=
 =?us-ascii?Q?nOxdF1j2zY4eilBohZTQuZUCRM2mVAuf4OicVfhmUt35x/2dPBshO+xcCS0W?=
 =?us-ascii?Q?CHtKmCrzFOnyQuu3z49BlD/R/kmrggs0FfevOFbs1yHVRvwqE2ty9cGplmf6?=
 =?us-ascii?Q?1T2gbCwp+r1m0uF1MXX6En3WE6Oy4oh3caEBdMmdr9gRDjUproigqvkddOU8?=
 =?us-ascii?Q?kv7gpZT4wRk43ulFImrc70JGfakUt448Kge/Znjs4J/UUzK8rCa2ORhv0X5n?=
 =?us-ascii?Q?DHS1XSVK9Txobegs7y8OIFokvmaQRWLWogpigOFk5kPMHOlGYhKR5Vz9ZWGl?=
 =?us-ascii?Q?XN+RB3vWwOry4fwm3bCXnbZ8Y5hAzK7a40onjUpSP5lsJEnQOAM1o3x2H5+W?=
 =?us-ascii?Q?ZvnH4Rw8x3KtpziXundOGGbHYvmgC+T8eTkq//IRvLbUtGaq/P1l93kdRlxK?=
 =?us-ascii?Q?VbfWarRxMFbI0koMVxsQKkegA+tviqhkKxQjs8BckhLo3mRj3IOWreQQEbPq?=
 =?us-ascii?Q?363dbslMl96Mkb1YRwsQSxL26nYE2LLO4obTL/KCUvzvaMJS7f8sHrRHAvsS?=
 =?us-ascii?Q?Nfv80VgvrztlxAdzEeg2enpwFQYD3BngImtQ4EtacaFeY4ZbVWNKFWJoN9MV?=
 =?us-ascii?Q?C4aR5k9ppKw4VR6BY7WdinWNbxtOHFjoEqalLSZtKekP7/EVZac/6uCYHpgT?=
 =?us-ascii?Q?KLDmOj0+zsfPgjUvH+BT3tVwg90hBThHzQZqWDOBMmAgtSb8141sUTIwR9PH?=
 =?us-ascii?Q?UDjevGXL3/YNU+zVjs0QiskmiBLYh+lsu7Y/9I+J6ICLzQKZn3qnFVf3NJ4x?=
 =?us-ascii?Q?rRw8qrKoZnFC3VHEDgcZWkWftxvXVv32GaqnBsbTUB8KHxDbWHAQkGXh3yPj?=
 =?us-ascii?Q?vICdCXAk4L0zIG9WrXxEXTrexnviiUc35xhKF2mN2nW+CWsNGcFuLLBAcV9u?=
 =?us-ascii?Q?sKb0exQrrcG14ikjcpj3kIO31YC0ocoppd+C1mzMeJDU4SkUpmdDrG+WPM9j?=
 =?us-ascii?Q?mzHVfNUssGWELb4vN7N8y3ob54BOZKKkiyxqw4Z/iKiP5Vm2WTZjorzWtNqw?=
 =?us-ascii?Q?Vr8PQ+8x3ykeeLG3SHePAVgH3uowrFhxZ1fiKQ+KeWD/muxt1DZoXyeRoByF?=
 =?us-ascii?Q?rve5Fi1I2Qyjb8Vo8/3OZQSlrzIKJD8ol0O9toAb/yEXpcUJ3Y03JyNA5eGX?=
 =?us-ascii?Q?3CiltPd5Bvc7WynvbZ1eRzB6fKf65DP5iOFWi5ucdrabXTc0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acc58d7-ebb7-4ac8-f887-08de78d0226b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 02:54:05.8855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uIWwEQeRMf+5a74ozPODPa0jpUZ1tdZCG3vM1bx1kb9WznucwkVGCbhAwvlD92PV4DqftvO2XRt6oMpHxcTlCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_185413_210705_BE5984A1 
X-CRM114-Status: GOOD (  24.41  )
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

> Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock
> operation
>=20
> On Sat, Feb 28, 2026 at 08:56:04AM +0800, Peng Fan wrote:
> > On Fri, Feb 27, 2026 at 03:32:16PM +0000, Cristian Marussi wrote:
> > >Use the Clock protocol layer determine_rate logic to calculate the
> > >closest rate that can be supported by a specific clock.
> > >
> > >No functional change.
> > >
> > >Cc: Brian Masney <bmasney@redhat.com>
> > >Cc: Michael Turquette <mturquette@baylibre.com>
> > >Cc: Stephen Boyd <sboyd@kernel.org>
> > >Cc: linux-clk@vger.kernel.org
> > >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > >---
> > >Note that the calculation logic in the protocol layer is exactly the
> > >same as it wes here.
> > >
> > >@Brian I suppose once your CLK_ROUNDING_FW_MANAGED sereis
> is merged I
> > >can flag such SCMI clocks.
> >
> > Per my reading of Brain's thread, if ->determine_rate exists,
> > ->determine_rate() will be used.
> >
> >  	} else if (core->ops->determine_rate) {
> >  		return core->ops->determine_rate(core->hw, req);
> > +	} else if (clk_is_rounding_fw_managed(core)) {
> > +		return 0;
> >
> > So unless update scmi_clk_determine_rate() to something:
> > --------
> > if (clk & CLK_ROUNDING_FW_MANAGED)
> > 	return 0;
> >
> > return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id,
> > &req->rate);
> > --------
> >
> > It maybe better to update Brain's patch to move
> > clk_is_rounding_fw_managed() above the check of core->ops-
> >determine_rate().
>=20
> The clk framework has some basic sanity checks in place that are called
> during device probe to ensure that various ops are configured properly.
> I could add a check that if CLK_ROUNDING_FW_MANAGED [*] is set,
> and a
> determine_rate() op is set, then it gives an error.

Sounds good to me.

Thanks
Peng.

>=20
> [*] Note: I am tentatively planning to rename that to
> CLK_ROUNDING_NOOP in v2 in about a week.
>=20
> Brian
>=20


