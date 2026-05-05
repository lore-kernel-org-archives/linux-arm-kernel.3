Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDACFCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2J1AMgA7SjZ3FmZG9nyi5KjZQ5Tt/H93SCPy5yc1cU=; b=UhbF2REAx47JiREopSzCfDsDsE
	ak5tUkgBTr2/vz2DyrUVvU7n2+6SQpuPuBL3ADafXZCaCqb3G8EDLn6Qo+1qbuHicteTsH4U9c6m+
	uwnZGeYova3Xd8oWYJtYm0N9rt0M9EnsR8WaUqTolnp7EEUUmng+F5CaR54xiX8d0cpsQ0VM9hQF5
	D/jIwESl5N6wobV1mlng+yJVOptuBA/j3Njg7z4HeO9q1qIiGqWXKgzjfHzzCoyRQPpiUkbq43k2p
	gl75MEKFWwrGTPTtggFDz4h1U5UZrE+OSz3f4zXiHW+emtA8cwtYNnAuWMrN+Dm7wOLqD6yA3XwW3
	v3qXAl3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJ4e-0000000Gy1A-3PP0;
	Tue, 05 May 2026 16:56:44 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJ4b-0000000Gy0Q-3KvO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:56:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jq0FcehP+iYLZW8dFaY+uQBKG7moqY2jQouVpkh99xQ24xzUAUb9xV8+3h9HAHoC7k9sx+yAdARpope4NP9C52QQH+a7C5oZfYK/Eh9fZjBITXyo6w63EHR9IHPzz/ThkJ4D7HmzJ05wIZs1QE0z6q+SeCGRcntjkLRmF25wKVhr6g6T/sFxt42UipIC24ncp2G9lBuwnFn3TXeFB+wzaHNxtw0+1csVo5BCDdn1ZFUBrnEYBSStCgFrb09hpmlmoevGgi+o8pjTZCTFcElguxUszmcun6PhL416KCkYz5grIikE5Rcvt2djN96icI8SuGKaollhAPDn4KC7Nl8jTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l2J1AMgA7SjZ3FmZG9nyi5KjZQ5Tt/H93SCPy5yc1cU=;
 b=OoCO/hY06UrcfWpZvumRo1w138Ej14DoFBiPjjtqjb7iBEHAfRzZTzJWouQHAGeIqfbR1KoYeghNHgvx43I/ShVhBEEy9nN969CpjxlmqEifJBGyM+Rq/Bm1aSBuauNPYyMrr2Oyt5vVJz5savx66Z6KIPhbn0xLHuncQQMoTwRIBYWF0ysUlirwIEvzBu9YHLiMqtuPJjs+L8iRt9on7fawa9NuhJEF1cyXTbYATDVFNdln51LiCODD3XQM7AMiKgBrGujbz2qRA2aYnZUsLC17L99PFGuVrwgCOe5AnpwiyfcPMSv6ihB7lXU6tYO72AHYpGcKrj/Ilqm8UjCtcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l2J1AMgA7SjZ3FmZG9nyi5KjZQ5Tt/H93SCPy5yc1cU=;
 b=GxPvklzL90KH/gWR7mveChcIwY0cLySA1u7DVuGbcehOqWRpa5TnJSmhg8U6ulkCFu8XG5uDm4J31LGrzWZTK/VOsGqlzKBUWNwPRR2gmq2SGKgs8AKozp3p5JQAOH1NRL+YKDE7vG4r1Zd8fVLoQvpv3hdv42SwpwfTNcx1tncIJ8QGJ9yymE8kxXo/PJ/vpBt5WWpfiSw6hCNmr+DrfD8AMuOJpkLTaS9ep3LC200kvzSmpQsKDtVbLgEsQDa1Bum0vkKyKPXK11rgHXi7Z1B3wIA1BA6C0+Z6UqM2M9Dz/916PAJaKFkfBf/e8nDj1QZ48rtD671WCP0Ch955CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10491.eurprd04.prod.outlook.com (2603:10a6:150:1eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:56:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 16:56:36 +0000
Date: Tue, 5 May 2026 12:56:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: add tqma9596la-mba95xxca
Message-ID: <afohObxES9nIQla2@lizhi-Precision-Tower-5810>
References: <20260326111803.1248934-1-alexander.stein@ew.tq-group.com>
 <20260326111803.1248934-2-alexander.stein@ew.tq-group.com>
 <4f436a21-ecfa-44ef-9002-c64ebd5e30ee@oss.nxp.com>
 <5988897.DvuYhMxLoT@steina-w>
 <20260422114213.GA68897@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422114213.GA68897@francesco-nb>
X-ClientProxiedBy: SJ0PR03CA0061.namprd03.prod.outlook.com
 (2603:10b6:a03:331::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10491:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc6f58d-e3de-4020-de65-08deaac7448b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|19092799006|1800799024|366016|52116014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: DLUWygGrNpqYR9K/XxIGt9iyo68D4XrHgxpF0A+etpU287YiI/180vXWB3GkhxzL8H0QN+Wlcq4pAQlPqua8EBoDq8v7hNKNeUPXv6bjsZn/QaaoNdJZlA9tz1ltIfbpD8FWV5eE7BVCvtazQ1DWke5n0AnE8KwCC5JThMYjlacc8ZarDOWkki904k6dHyeVuEfMTSebpwsCki1OeAdGTeYDGZNbTvUOHuozLJxrVyfRI//Zj9U0Wiuq9kQ8Hj8ZwFc/uKF0HLtGwRt5Hrj86XjE9pEW+KfJy69BeKl8wWj9qp+W7CCbnFFPhRSPxSrdFWV3JaEVdBZfAbrWvVzANYcGGqYZp6ZHCMoIgJMV73ZnT8OVaddWquFJY5ITJj8TbQQtIKcpc5Wc5SHbTvRVCdFiifMLQNVVvwehSfrPPhYJqIhNnFYweEW1RvZH12YN9dfeCF7coKi/21duOuHMP5uD1PGgKPpAio9fuDxuprDYSiAbWr6n3+qvt32FfmUjxzxgbo3gyqDsrP3AnJ5wDlGFVWAPXM3psZgaariUW72M0z8c/mPhuTttMw3RdXW3hHwsrXgXKS6oDh+SvohHIDZ5ee69YK6hhrB6+IZvwDt3A4peTx+BfCWoDcWwTWtMIEo7u3uaFPyOlaVIHwBsouZ/58DYdHK/ghwKeTXqyYgzrqI1txSXcCvgy1hhvTgi8J9fa9ukgCfyMt8Msz0hzEuAOSrTmI8QrVXOkSiSjsf1S78/u6RVb4z4Hly90AHf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ghd0gR4qTVaD6D27AZR2m9CIrtgr7vU+9XRU22auEmCR9T2lAKK9tPI761s5?=
 =?us-ascii?Q?Sk4/niIIKEah8YB5N4XxE00ppaATdsjlDkxVSZ068WjeoqtCrsn2jlav6fx3?=
 =?us-ascii?Q?C5vW11QNAL1YuJhSNPlRGn7AAfluuylJLuRYBbnzgmA7btzTMBOfU1uTtB6g?=
 =?us-ascii?Q?AhxU6g+m8R7YypwNdgky1jKdWcLgNp6Ks6YosZgGyB3tHZonH/WoUhR0jUAL?=
 =?us-ascii?Q?ZwIdLdui9kokl+F4KWSK0NM2jFoGIPgrL3ssQJ83L8tasGZdUflyNQDtO4eV?=
 =?us-ascii?Q?yxij7PZoWCu9YZC3ZRlpWjiAZhfIF7Yd2Kk9ugfs2pBBJqDi4cmMiKjA8bs4?=
 =?us-ascii?Q?NMNXsNcAgXvUPt9pGCE6IYUYPqdUjy9LRIXnrKl6/dQ6jMQeOv7EVKvqoPH6?=
 =?us-ascii?Q?a/0lowfP4AeOeV0jxI55By4Unefd9rWsYBSphtzNui6XdldwK1AYEcsd8+s+?=
 =?us-ascii?Q?Qd50Jdp/UxlOpUr0B7RzG0eeBA7+9hERt51bzMMrr7/Y5/o4bBqFcdoQQ3L8?=
 =?us-ascii?Q?CeHktxz4GGGUjQc4d3ZT1sueXcLkfRrJArAldjKns5/0Pjt9vsfK6SfEKIMZ?=
 =?us-ascii?Q?blwEULEOY/yaFfI7BX//KuNHXfZKftlVDW3rl5/LIVsYIWcJR1/NVcTVh199?=
 =?us-ascii?Q?3BAgOFuBB04nuZTVyxY+ubl/itUMf0AxxVxC35CwszRMMnWB9tOXTmqz6L37?=
 =?us-ascii?Q?jybfHOubKSOD+7uum4g2gLaQshIYBgOtZsPY1RRhYfNgHVWavpfhN7EcJqng?=
 =?us-ascii?Q?2vMc0n4sJptGDtciU/5hSxKSZSQ1iQhWREAcp+ndhtVBXQdo3sNdT+VmBQL+?=
 =?us-ascii?Q?ZiLlOwREuw8sUBP45mvyWs+IZyFL0llSyYyeN4OXk1OoMYW5ArYYlLFrKRkK?=
 =?us-ascii?Q?CCg+5UXBn+3HIezzIzgsP0MzLPVNJh/phgdzquSym0qI01RKUjVpS4LVhSfL?=
 =?us-ascii?Q?EbgoU2QQxW8Hm5qFa6KTgVadmO0UuFXTukRwrhspfvaREPyasf5LLjJnW4EA?=
 =?us-ascii?Q?DnGKGrSWRWBpho6PKilN92x9wfXaHCpqPPFYy3X7IzlGIR3oKKLST/VCVOKt?=
 =?us-ascii?Q?a4yx8+IwD2Yg5S7kzAzF51/mddoVD9FErSHFOk37gVvc3lNmutmNUCfYV0eO?=
 =?us-ascii?Q?5P4SPVwqvBwdo2gAQEJ2LNV0PqYBercu7VSBeMigtRl/av2mHHaDJ8tZK5T5?=
 =?us-ascii?Q?XOG1VqMQaJEWRIKV5Un1CJhqoy4VptxNhzet6JEG9HvXVD4rjTemSNfhyVvD?=
 =?us-ascii?Q?BhR6kwcBSxaqvLtcZU6+zV7WyJ9JqaPexQbPnQVK1liKtAC0Cx+Cf9C4j1US?=
 =?us-ascii?Q?AaP448NFIjy4v5gGEmsa51mKAm8Ar7MJp3Ed8hE02eebGdK+v7H5SODvS8dD?=
 =?us-ascii?Q?MD5CdtI5+4fAEj32NmNFMeNZUP6tqOv/ykJbhSXeo7ztVjFez5juLXZCX7tQ?=
 =?us-ascii?Q?cUxxjLxKG5y1nF7gFxJGG2+1QVD5PgVFVifm69hDEkcd2aTlZ8T+JOh+0uit?=
 =?us-ascii?Q?dYqQNF4+m3QJZBBfJWK3wwAqr36w9qVr0xfpsxM1dVS097YHvALJZ+kbOd+r?=
 =?us-ascii?Q?l91tCNJOhE4wluRZhWarvg0Iy5b4Lu2kaYf/xx4EUTWLBxVH4VsX08p+bvt/?=
 =?us-ascii?Q?qxCRqsM41LEPqwNUD6tc1eBxH0XuyIl2hG3bITwEo9Qc8mxqrtkH4cdQwJPb?=
 =?us-ascii?Q?HrtiXOTgr2jPgCsnrGjJ+75erPdoT5hvj+2CdOzOMVB0YfFMX64H7YToje30?=
 =?us-ascii?Q?c0oiq65b0Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc6f58d-e3de-4020-de65-08deaac7448b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:56:36.0171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+KcYRPh+AQURRvXBINxwc/50o34bTYk0BKXJXZBfFGZYf2ONNYE/TKLSSSePhjSJyKAUmCaSjLqZ/CZ2LaktQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10491
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_095641_860238_7A707E65 
X-CRM114-Status: GOOD (  14.67  )
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

On Wed, Apr 22, 2026 at 01:42:13PM +0200, Francesco Dolcini wrote:
> On Wed, Apr 22, 2026 at 07:58:11AM +0200, Alexander Stein wrote:
> > Am Dienstag, 21. April 2026, 16:48:25 CEST schrieb Daniel Baluta:
> > > [..]
> > >
> > > > +
> > > > +	reserved-memory {
> > > > +		#address-cells = <2>;
> > > > +		#size-cells = <2>;
> > > > +		ranges;
> > > > +
> > > > +		linux_cma: linux,cma {
> > > > +			compatible = "shared-dma-pool";
> > > > +			reusable;
> > > > +			size = <0 0x28000000>;
> > > > +			alloc-ranges = <0 0x80000000 0 0x80000000>;
> > > > +			linux,cma-default;
> > > > +		};
> > > > +
> > > > +		vpu_boot: vpu_boot@a0000000 {
> > >
> > > Should this be memory@a0000000 ?
> >
> > According to schema in dt-schema repository [1] the node name should
> > describe the purpose, so I would keep that.
>
> See this question on the topic, and the related answer from Rob,
> https://lore.kernel.org/all/88456d17c91737cfc09af46673b49bb9a9d36dc0.camel@gmail.com/

At least, need change to vpu-boot for node name. label already indicate
purpose,  memory@a0000000 should be also okay.

Frank

>
> Francesco
>

