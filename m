Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93985C02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 16:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/AraFPssHRmWvVhiNmoeSAg0qmkHvmywAnYEUmNpMdw=; b=4lGGtpxcaeuqaGByAtODI8AVn0
	EdFTVPrMzG9DTUvWFN3O4uBIkjbVi07vJvyvP9bkxoScMuvOTWZ/xFZ0kprHJvxoHGCFt3ydmx0av
	fi+bMOiD3rrgD0koGGwrDZ1v86C1Fjz/9jF3sHYIkfvPJw1tH6IVCvQ+PGcqD2DwZdl6udFF3wUdx
	NwRBrqBV267C4gHPSyGOw2CRCUgSYtBSZmLKtuZ2PG9qNQ3bT5p42Kx2rVITxfdbv22KpVVk2dC76
	oWHe2N66tELwJaNiSzAhAL7A3wo7i7frIy05yXySBV3R34KUHccpgX5K2VfewoL4fTiPVZJjwhUyg
	2rtOTWTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMwJ-00000005mUG-0WAU;
	Mon, 13 Jan 2025 16:05:19 +0000
Received: from mail-am6eur05on20611.outbound.protection.outlook.com ([2a01:111:f403:2612::611] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMPC-00000005eHf-2EZl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 15:31:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+Ab7Hvx9eGgieZfxX4WGRraTwgeR4o1dCAp7M7OfdmCPBLo2lKr36HZVWJ/9ZLYqSzO/oYZdSJcY4KG0EkNRxAdELYEszOfHlPmnM5Eg/WfvirSh11kYSXoQKlu5gHaSBBUNPHQzYzCkMNjlTujITxZlyzUPvC2Sa8WbaHD7PWZ9hs3xoABx4LsLjz93UutIZkb+wweFAdW42NL31sZ1+Y4W98kldaM3FxMK9F+tX8C8/0CU1ORQAAdoF3/B8mJwzaJkRJhmQoW1bKvsf/r7ybqsNdkj9owQxLjRiSVUqKMWydsF9AsgSvTVs5F08LvcowiVTBwS7/zlP+v0LCi4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AraFPssHRmWvVhiNmoeSAg0qmkHvmywAnYEUmNpMdw=;
 b=ielnU+iMSQgJ3JogWybcb7sNwzDaw4uneT+G+cVpUh5I3NXog+cs87qruORTNC+znr9jwkrva3g6W7ic93RRA3Q1VDcfsyZ77Bduf53utw8SIAE5y8z3rvb9H2/8LPjBwfRPNtyhoP6GmFpSMySjteXisltspsssKY2Y/AxvLE1/7DDG53/AGr3HZv36czj0XxmPGDe0IfIhwDpl68krulMU4uacDvpLZcJUUWs2+iMZ5rL609DbKxNXRFLnvhGcz2NPf/O9uSKmJzz4CFFF73Vp3wLkkA9CYoK1GLxlLvPJC2w2IxdvQo5JtwL/jSQ55FcpsO3vuXMEAoL6xSdfcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AraFPssHRmWvVhiNmoeSAg0qmkHvmywAnYEUmNpMdw=;
 b=Vfl9Ej5kisg9clWbWXadG/mRCqlVi0n4nIEhcSAGO3zHYLOaTn2OfpuGmwWTqOvm10SOGL5dAEK9MSOEqKNnvtt8NWtS8Z4CgVjhowhSsS8CMRyYmIIAdnj0O/NPs+Vfu9/08fiotSyKYQfBgDxlYqQUBOClMDlw6eVy0b+KpZZg6pXd2t2fMHTpeHhoYJ1efnqKgu4KiHb5c+Y50H9XxicBQrJPnQsTqpq6iHzboRTsSQSf9p8d1//1haDIaQ/isq6Bq/xG6/GvGMCuy+hYYnDmSze4zaII2+Vf5+JtG9MHsZ2sREmQMCXtXznzj77McUOBl6smiSYB44YnSSF0Fg==
Received: from PA4PR04MB9485.eurprd04.prod.outlook.com (2603:10a6:102:27d::18)
 by AM9PR04MB7620.eurprd04.prod.outlook.com (2603:10a6:20b:2d9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 15:30:58 +0000
Received: from PA4PR04MB9485.eurprd04.prod.outlook.com
 ([fe80::81e8:f7bb:dbd0:b0dd]) by PA4PR04MB9485.eurprd04.prod.outlook.com
 ([fe80::81e8:f7bb:dbd0:b0dd%5]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 15:30:58 +0000
From: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>
CC: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, "cristian.marussi@arm.com"
	<cristian.marussi@arm.com>, "ulf.hansson@linaro.org"
	<ulf.hansson@linaro.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize state
 as off
Thread-Topic: [EXT] Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize
 state as off
Thread-Index: AQHbZa+EYgINd2mhkUSyLwfM7XAfOLMUuHsAgAAaEzA=
Date: Mon, 13 Jan 2025 15:30:58 +0000
Message-ID: <PA4PR04MB94855052830C8F4874237BA6921F2@PA4PR04MB9485.eurprd04.prod.outlook.com>
References: <20250110061346.2440772-1-peng.fan@oss.nxp.com>
 <Z4TreQ5bA9qiMTgC@bogus>
 <PAXPR04MB8459F33BCC84CCA8F49F3B60881F2@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z4UZ2Au7KSFMibDW@bogus>
In-Reply-To: <Z4UZ2Au7KSFMibDW@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9485:EE_|AM9PR04MB7620:EE_
x-ms-office365-filtering-correlation-id: c0d3404d-2a68-4d92-e032-08dd33e74751
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?vuS4GCcJJOvrd887NVeGmu7P7tkmNlvaG449JRJM8HMcsIgjgh6g6sAydIAK?=
 =?us-ascii?Q?2HB96VSJsl0ED9WeuVc+Huj800O5SHUQKaXpV+b055uoUb30uvkXGX1R9HIz?=
 =?us-ascii?Q?Ip1KTu2N6zjMLfifdBdboxi/0ZNqJ6dsMh+E0kmzFbgXuYph4qxezb7htd8H?=
 =?us-ascii?Q?B1umeqm729JUp7ibJPM06mpGhrh2npJaHRHhD9EZ0anTWvkEixO7y7Ef/LCw?=
 =?us-ascii?Q?wkhC45UMiHNrDAVzbNrwphcGP8VRyjfsGLH0GjiG9BOedlOOyl7Yw7uuXQZR?=
 =?us-ascii?Q?L8v1TL1X8K2fSnVJ8r+wYEdmxnVT6kCLgKGLwmBdWTptleNetT4iNaNMH/n+?=
 =?us-ascii?Q?wwf1c1bYiKwPam1ELJKy7h0f6uacSFj7hqH+9jL/jAle8Gm2cCisrjUQeVPw?=
 =?us-ascii?Q?q34iyM1WL2JJPBu3rbUzEpJ6h59B9cA51sFcqrE2ZrC+Z45SpIgh0ooEKEkO?=
 =?us-ascii?Q?gx8i5mXtgB0E3nfmYHrzRN48qi/mg1AlwGGYxiJqqz4NvjKO9O//XCoZPyqV?=
 =?us-ascii?Q?qIq+b50H9MNZjz2+iI/y8XCP9b92Vw3iUD8rfZKe1a3pZb0y/nWjOcqpdfxA?=
 =?us-ascii?Q?eP5FJPhvt0r3uXWkQ66S3+pHA9UL7L6jJPDaF2yNvGKo0peS3WzgvFT1rZb0?=
 =?us-ascii?Q?tCqhkfUivtuHisuslAVGAYpTiXMYIuQQJllSy8rCyVlPjxSn0iV3FnjcA1hu?=
 =?us-ascii?Q?pOpgEWCHHervC6eJPrlWxvf3BfEeD+Ozr81hfgDjxumARD6KWKpCDNC4p8A3?=
 =?us-ascii?Q?3HQ09oUoCXqO7onnCwkIoquKhJNyzTsmpDf5J9YXZqfwGq6JRUtnA0wWEykz?=
 =?us-ascii?Q?GyCGL7R+s++G8TvlSfXnmeg1JWYXY3NGvTKhRNlXp8pL/w4Wg6CYJbvVjaX9?=
 =?us-ascii?Q?Rvm6K0JNLubQhkKfxq4pSMynuabG5IvkACy2Kqqd8KNqTxgD5yXbIrEaO/8t?=
 =?us-ascii?Q?t+xIc6eQERzkL2n3RvB+tcP1g6tnrgYfFv8bGURpmK9yUQeqS8zE1ljY4ZMC?=
 =?us-ascii?Q?4mJJeGbw533KKl2dzpcAlG3gQVhLOCeZGRHaStWicGsHoFnCNlD3dpHEDvUG?=
 =?us-ascii?Q?sfJYXT15hXi7KJUhvBgA5Fi/rDlXeiTs6R8iwDr0S2bJ/RQ0f77W/ToYi2t8?=
 =?us-ascii?Q?idVSKZEkFYDqpmq/WvgZgxwAUqlQk05ufXqkwxNZ5kqVdiykFaQX45hfvSOr?=
 =?us-ascii?Q?jfTZEZ5cetDgtJAn27gRxrxF8CgvvEtW9JpgrGHBjaaPMeyFZas1JLznFW3O?=
 =?us-ascii?Q?1YCIQF1l+Jz0VYVb2dvEqGF/5bjBTwwUVtyTbtKT5BUcDAlwqMxcVEaYLmTO?=
 =?us-ascii?Q?zKeiUy+fZGRoIhnd7i/tmIrysfx0M/+Z6OPJNckMP3AqPVVWqIYGRBQ/gJ1o?=
 =?us-ascii?Q?lpcv8MJvMhzBOo3JeaNNDEJIHeQroLIgdNr2NLgzykux+krgHhx18/nOGawD?=
 =?us-ascii?Q?/muHODJ1e/hMcOdtWuiG4AriRZfrP8Ms?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9485.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uzaZUat7Y96jG0L7ylBQShTX7PflUTbpo4sZJ3wLREkS14mCqDy5btW3H+l2?=
 =?us-ascii?Q?bGM0p9MHpzxwSI+1CJgx13bd3odd7K/PZlRh3fczfce0jrnQik1qvPjcVRB3?=
 =?us-ascii?Q?yW8RW7K/JhuC2IGaDoLCSVn3Pqbp2jmX2mI1JKIgTgjctVXruumqJkFMSi5N?=
 =?us-ascii?Q?ukXGMG0ga1+AMZd/Mwf5/M/yWPo7AwjGeAKiNoGPRxmJ80FDEfThh4jTsP/z?=
 =?us-ascii?Q?eFRbCbc1geA33VEaiQMz7S+PFMk2LjAF8FRNBaVQ7aG1mel9oWYkM+bQnQyh?=
 =?us-ascii?Q?PrU8kh+4CEZuOhgVvjKYNwzEqyx+Z9GceY3FyaSYRgyifjkfomByeYTsCB0V?=
 =?us-ascii?Q?WFIwxBTyhLell3iYZ5cLMIkvWs1MD4DFQ4pcsGfI+/OeRO8yddIcC9qfO6k1?=
 =?us-ascii?Q?UkivdKyqiiKnppKGDbwMhQd5E3X54Y/HLqOuyTojyu4tO1oA5p249/0j1UIY?=
 =?us-ascii?Q?OWwb7I/DqM0P1rOCHUD2U5om5Q9OoHDH5Wg8J85qYf5Wt/NuKfa+rC0R1BwN?=
 =?us-ascii?Q?M51wYo4Vd+FbmCG405vtdqGmJe2F3jRAfkXFyC5T/QexlCFJN/GlAHaikZEa?=
 =?us-ascii?Q?sBWeDt8F8KT91RfgDPSEpsZ4O8rAv4LKi3+zOLKSOSFENhResroNFztY0UO6?=
 =?us-ascii?Q?G4auvEwAyrWbZ4rnefyTDNGML8VZn+IpPtb7W1H7WHvazmzPKsKqwNdCA86V?=
 =?us-ascii?Q?LR+FPrf9/rG/lTpIsrQDIH28EvqpRG0DpKGyAYoLL5BxxL0YuQd+Or5ZsXkU?=
 =?us-ascii?Q?T+jwEOMuZSGGbL9JAHERKYAtiLymWc/8yNBUZMw8k3Zfj97KkzprLelhirS8?=
 =?us-ascii?Q?TpORHOEVyFR3iO/HBg3LLWuH18HRs52g9u/YlfovZiskYpiMo/A6R43ruXmZ?=
 =?us-ascii?Q?wlV7BMd1tQoEQBVH4VO84l6uJH8qwNhBNG2AhiRB+dgiN2Cc0Gi6Fd0x6IXC?=
 =?us-ascii?Q?CAjJV7TttK0Aarq+G4z+LjSYWErmsLqt2i2WyHKRNaQgfzIApGo79fvaEjnK?=
 =?us-ascii?Q?LQ3ud4YMKHxie8FhWcgs1SRjr+B1bfqsNdGoq1fVYuvgaiaIPT4i6ym2xisM?=
 =?us-ascii?Q?92Dbv28TStJ14vze8ykOXq90XVK8ZoOmIbgb1ZSWBYtdu1cIvh7c3cSpQbw2?=
 =?us-ascii?Q?rzIPEB3fo8IQMINHzVdgygFxf8k438TcRG9vlNdre/78k5+Zz8/L4fJqmTFp?=
 =?us-ascii?Q?sW2Ft4acouNhk5NF05e32AkhgkELog8NJN6qXZtHCyyb2E0FDZ8oY/JWRqVS?=
 =?us-ascii?Q?cocjm5Zv76OvhtrxSs8MI0bJYTZOE+Mk5GiZEhtj7Fzuz4A0lxVOB8+GNlVy?=
 =?us-ascii?Q?z1tqOujmJEKqEHXVz8vWwMSXUjEeyBbjBRb0G5H3nwq+vykclZGaWIzKN9Ky?=
 =?us-ascii?Q?HhaOzhH9YY5YxQLLX1VuFPnHXP0wzhRZUzxf33tiXK/Jy3OqEB7yjlP7ciTz?=
 =?us-ascii?Q?VqJ/qPGIjrKankoj1rOB42yaKRuHUfSOO+YAWliFcS1mrFJJrM3ID8cYGjEp?=
 =?us-ascii?Q?pIkv0ft6eSI5jW602TZbf+xnXaDn7ZDjO126Ryq5kB9MSkA89B7L7Lm0rMP2?=
 =?us-ascii?Q?u0R0GyNpsZrnZgVK7kqB8y/BhajqcQ2fwfO+2t3TqkQffaCWtHGuKVjmoYWo?=
 =?us-ascii?Q?pw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9485.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d3404d-2a68-4d92-e032-08dd33e74751
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 15:30:58.3076
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2mao0/vLxsfzYuykv0V/yzhKTmyiodjKOWglvfqU2BYTBgnQQ1Eq3bpx06Nrn5ioxgC/UKfnS7ymSFHhR/LMUxdlAu6v8ZFVCgaevObIdeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7620
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_073106_604927_592A31E6 
X-CRM114-Status: GOOD (  29.36  )
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

Comments inline.

Regards,
Ranjani Vaidyanathan

-----Original Message-----
From: Sudeep Holla [mailto:sudeep.holla@arm.com]=20
Sent: Monday, January 13, 2025 7:49 AM
To: Peng Fan <peng.fan@nxp.com>
Cc: Peng Fan (OSS) <peng.fan@oss.nxp.com>; cristian.marussi@arm.com; Sudeep=
 Holla <sudeep.holla@arm.com>; ulf.hansson@linaro.org; arm-scmi@vger.kernel=
.org; linux-arm-kernel@lists.infradead.org; linux-pm@vger.kernel.org; linux=
-kernel@vger.kernel.org; Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com=
>
Subject: [EXT] Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize state =
as off

Caution: This is an external email. Please take care when clicking links or=
 opening attachments. When in doubt, report the message using the 'Report t=
his email' button


On Mon, Jan 13, 2025 at 11:37:23AM +0000, Peng Fan wrote:
> > Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: Initialize state=20
> > as off
> >
> > On Fri, Jan 10, 2025 at 02:13:46PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > Per ARM SCMI Spec DEN0056E, page 16, "The platform may disable a=20
> > > resource if no agent has requested to use that resource."
> > >
> >
> > True, but ...
> >
> > > Linux Kernel should not rely on a state that it has not requested,=20
> > > so make state as off during initialization.
> > >
> >
> > IIUC, this was done to avoid any transitions if the bootloader like=20
> > U- Boot has turned on the resource and OS can just rely on that stay.
>
> But if it is not U-Boot turned it on?

Not sure if I understand what exactly you mean by that.
[RV] Its possible that some other agent (M33/M7 running OS) in the system t=
urned on the power domain. Resources in the same power domain can shared ac=
ross agents.  That being said, uboot provides mechanism to clean up any pow=
er domains/clocks that it enabled. And our implementation of uboot does dis=
able any power domain it powered up for downloading of images or anything e=
lse (display is a unique case if splash screen is enabled).

> Or U-Boot is in a separate agent?
>

No, it will be same as OS for the SCMI platform/agent as they use/share the=
 same transport. It is hard to distinguish between them.

> > Anyways if the resource is not used by any driver/device in the=20
> > kernel, won't it be turned off anyways ? What am I missing ?
>
> Because the power domain is ON, kernel will not issue SCMI to platform=20
> to request it ON when kernel needs this power domain on.
>

Yes, but the agent(via bootloader) has already requested the SCMI platform,
so it should be fine. No ?
[RV] As mentioned above, it need not be the bootloader. And secondly how to=
 handle this power domain during suspend/resume? It's possible that the age=
nt that turned on the power domain initially will have different wakeup req=
uirements. IMO Linux should completely be responsible for the power domains=
 that the drivers need.=20

> But in case when kernel is doing some jobs that needs the
> power domain ON, SCMI platform might power down the
> power domain because kernel agent not request that.
>

See my comment/question above.

--
Regards,
Sudeep

