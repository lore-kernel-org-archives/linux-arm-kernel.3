Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4940E88D6E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 01:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KA0g4CcJzgTmkPOlSnMVpJ5IexzmNIyOdwkkjfaXp8=; b=bt9Y1Ybc4HL7CvE27WqX7MfgWZ
	qXTySgbL61JeenjaJgpi53o5t6GB7VvOQ9F+dyUgQ/QJWTFXsFrs0IlgXm2tdeyH+g6g9Lh7md8RG
	XDq+TlfAgUc/znQojeykEnhA2KH+wm9nAkMDKKC4d5oEZJCBPd7NK9sO38oU0zwaFtlYHPNzaZgaI
	OfelN9jxAxGZo3GLVmdC0pOhsK3J0HkhUc8UOhbm2tySQ4wblamLkFrLpAzHNYBqd2q/2nQvL+OwU
	Q4hvHqKZpy9HUqB3gtrMpreXffnhDwXz1nU+3+DYOzJ8MRyZU9lUMPUZyvd0+fJbMkG5THgRHW6Zy
	418Lp89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8prA-00000002nqI-04sd;
	Sat, 04 Apr 2026 01:31:24 +0000
Received: from mail-northeuropeazon11012035.outbound.protection.outlook.com ([52.101.66.35] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8pr7-00000002npp-0RDH;
	Sat, 04 Apr 2026 01:31:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HURhMOdp6snYUgTdGItzWifysHrlIGV5m6qeGh5B8LuIMpX2ur7QVgOgzR1R+CcQvqLNWUUIA0ZMXRb3Sd3VSHrCSeASVVKVPf53iZOwhmM44f3aX8x+OcUyjILJwc+QLirciLaWSU+HnzQIWh7YBOMPWMqrPH3V0Obdh2jFSWju8lDiVyRe7D9WY00BkFWHmSruv62ekmeaG2badmkbYDLh3EOs4lhGRQgsuKzk8csEHLAJaaKr9+4TAXOASdEfdDfC3YImPlsgFvV8bjn9ANDbM6uTPRi90MqY8B4wgc9Aya99DLL652t8lAbvJEc5Uqg/v9meav/6EEvxf9QbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KA0g4CcJzgTmkPOlSnMVpJ5IexzmNIyOdwkkjfaXp8=;
 b=tu+DdkzXbagBJpW2A0esLSG9K7PMwNYCxJWFPvZmAI+OwFOr/mrDtokt2Kf7pt8CvFVC9HO3K5eIVkLSR3tZMt2QfgMH216cK33g9qYpz2n/XtA0mezItXBms0a0RMnLA+164/fGIakq8Y9vEgMgMDZedncTmGVH2ULqB2teM9OqcdMZTiXIMdd8KTbvQJSpzESeRFIWimN+iPnXqVgnp9TgtTj5pVq3N3xPRrRn94y9Agn+wi0xwG4+c3LZthoYeFJSMhOlUibop/tm04z5c/vxCO+r82uMbOFGikCpSaRdfic0/GfGErOOnZfDWVknEkgpyp3H3NDi6rOJC6/iUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KA0g4CcJzgTmkPOlSnMVpJ5IexzmNIyOdwkkjfaXp8=;
 b=YQnL/2qNj2SxRj2hoo+W4Hb22eiOZAYrfD8zkjVkdfvBSWmspNZHeCWz0g14LUkkBx+mu8FC9LYph1wMmOqqAVMb1bMcm8e+/SHy71ENFSFnhOsUU4p3ktmSOZTi3DtDZCdTtKy91nsHgQBEsgtFpuMxSFzqdGyZF/tclgGywSi1bCqSPXIMBAgzwjqeUpsKNPQYCywJ+V/oa7207qSqV3ZL90v4U5lmnmh7avYjCkCfDjTZ3/4VspK/Om/uGuWbuGILFCQ20XQ/25USkq4lgjMMrWRkwWO4WRvHZs8NDkgnQUC374g4VFke6y2v27tDq86xQUnpNUXUpEXuUzMiVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9830.eurprd04.prod.outlook.com (2603:10a6:150:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Sat, 4 Apr
 2026 01:31:12 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Sat, 4 Apr 2026
 01:31:12 +0000
Date: Sat, 4 Apr 2026 09:33:22 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>, Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Shree Ramamoorthy <s-ramamoorthy@ti.com>,
	Jerome Neanne <jerome.neanne@baylibre.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Dmitry Osipenko <digetx@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Joseph Chen <chenjh@rock-chips.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Lubomir Rintel <lkundrak@v3.sk>, Julien Panis <jpanis@baylibre.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Alexander Kurz <akurz@blala.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: (subset) [PATCH 05/15] dt-bindings: rtc: ingenic,rtc: Use
 generic power-controller schema
Message-ID: <adBqYiSLJC4hGnpG@shlinux89>
References: <20260316-power-controller-v1-5-92c80e5e1744@nxp.com>
 <177523251875.1559844.9690289848283345069.b4-ty@b4>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177523251875.1559844.9690289848283345069.b4-ty@b4>
X-ClientProxiedBy: SG2PR06CA0218.apcprd06.prod.outlook.com
 (2603:1096:4:68::26) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9830:EE_
X-MS-Office365-Filtering-Correlation-Id: db44ff0d-b2cc-4300-fb22-08de91e9db14
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|19092799006|1800799024|376014|7416014|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: cfmk0AmxiPtI1Vu4YR3gUClrCO+V54rAiYdO/fQlYvmEE3AUKFZw1zY3eR9zUyU6SWwq1ulOcX852x0fO+gAdz/bSVJjFRd6FISb8BdDPi21bFKGDJc06mnYh31qt54AvtkgcvLaKbQZ+LJeVkMQIDGhHi1h3YUOeAuuPOoweEmRtaAnzPnWelfEu/yQCcdgEbLrw0cXt/lSusEU/NHaBxpsFiz8QDsCUFlYudiYUc2miXUBW2p1Lx93aYWlOzSeehAQm7b9w92S6OaZvD3sNK48mJYdHPLjZ2ODn4wo2FnUQgYwf/yc0hdxvxFtZWp01ZDBW7DpDm8YVFl0F1fePtwNo7+ED4D/dLGPi5diYwwM4/MX/HJ30P33fjxHJDOftpoly6foQ5h9d0/uv/TtXSob2ZeCrWA621U2OWR64kXpEDA9UWRSUILwNX6tpkORRl73CNNkypFJUmVysMvDb0KbcKHX+767H8bpyDPDzJja45hVYQv3TlbkxfljIaTvO3U15tVl4V7NrOkaXibMgVSGL6QBFyKI6U1K8nltcQ5IhKnBPkX7L5EEngpjPLnNIYBXYGv4TOrffUtPCp0XLa8LOx0AeMPMSv38V+QJjzw7flfit+I2gn38Cw4j3RAv/v97UGs/OPq2EOutzQBb7//Ubcn7qjAdUlpR+A/QAuD4mofA/+nCUHTbqHeYdn5Mn08Ybp1DRNrRAUtpeHyo8VKivPwP5c5G+DDaRS6nkvg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(19092799006)(1800799024)(376014)(7416014)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kmX4AXwZ/dsDqn9iFox7Q7CfeABuORY6WKIvXtwW8i+AoL06RhT5iq67ZnOf?=
 =?us-ascii?Q?P5yEmdWqxa12CMwVa4a2MoaxJTh7stmSfKqlzfLdYtPYs6CkLlbD4Fqzaex/?=
 =?us-ascii?Q?7Ll5zDUQ/u9x5DBlPl9esQq5XzLG0zFCFF+VDrlNiASCgFi56H2GV7bRgNzo?=
 =?us-ascii?Q?z3GBltJQ3OZ8KSInPeCs7O/mFbfFCCoLmSDAkikSq8iPPswy+BTqdIf3M6kI?=
 =?us-ascii?Q?z74RSkjtIcZ6iHjrDFbOnDu83Y4K4FtkdcCxqBvmY8Pb/c7LcDp4up0keNP7?=
 =?us-ascii?Q?5ZbcYQ6wYnB13K26ZJLllM3or36VvkZY5qpbeU+vfmhCweh5z/mtEjBuoixs?=
 =?us-ascii?Q?yDnCteveF7eSDF2q/SOWER/YFDdlO5faFSX9czR83KIqaaPzg/8XWuKZvkhD?=
 =?us-ascii?Q?hAQYFRbOkWEYJkEexbgB+NzupLHQKQWPzy4Dy0BZa0xhPZSR8g/EjCnxBj8D?=
 =?us-ascii?Q?eu5LwKPToERdwikKnJeapfM1ibSfiTq8hgKuPlnWlMZj74HoFWJ0OKvsHZcm?=
 =?us-ascii?Q?If+HLhdZUJdbf4438es4Z3NO9SaBa15CQYQckv/DoSRaV52+/lc3iP/UDdhT?=
 =?us-ascii?Q?FC3ZUTcDoyWF2snzh9t+vsPrhb7C2Bm8epNFlJG547Icqp+DrHz5n6cpzdVf?=
 =?us-ascii?Q?IeXnSO/jtzFZYjygq/nJQEqErSg04W41gfGv5Cke002CD6XxNh/vwTP56xvN?=
 =?us-ascii?Q?sflPt2nBqbfEZ1Lp6VMK6d3vsAYNoxbt8l0/kwsZVTBMLFXULuAIRDt44eD4?=
 =?us-ascii?Q?OJkAtd0ItC9cw41oejU24WbOmyWtCS4TKJRNLul4fubrd8409VPm8yZG6Y0C?=
 =?us-ascii?Q?4bSpFqNfzoPxUFVrLKS1bJVJfXLvOda/NvRm5WrwMzqENR+t0Wrv2qwPCYA9?=
 =?us-ascii?Q?Iii78hdIVa9VU+cXx3Pwgo948KKuv6XUfUBvZSjru15BvPCeD14dOIe3HILb?=
 =?us-ascii?Q?rMj2hGLxrImMgIYne4Jdpm1yJb1UOXamsvdvMG6FOw1UjgAI91MFyQjvWbbS?=
 =?us-ascii?Q?0BxrM5NLQnKvMB7jmlfpr0IcUeIdqwFtkyrYYgcItG3q9asWu7VFL6Tp/bM1?=
 =?us-ascii?Q?i2mXBOkmlpcNgle1eVak2ruEJa/vi2qaPimSDgVBiwc1R8IixtSlF/0uO2Ps?=
 =?us-ascii?Q?V2IvSpG0mTirr8iEf2YK09FwKAg7VW8I+kBBaksR0L/cICT+PL0WKKLFmz9G?=
 =?us-ascii?Q?i16q1dLlxKzk+2TdzmJ6UAXgTorttp5Z/gCRogqVV9U+mdx+j4LXQw2NbbLm?=
 =?us-ascii?Q?FOYcs5DDAbbDkXWB9FvSbJN93e/VatySzU7wxTUSXdXNSoRAZePCM/qrrPL0?=
 =?us-ascii?Q?wgqzy4e/EkuLfXdtb63FYKyJF4atzk0pccF3SIfTYCpimHN/ODsQJKn3RBtr?=
 =?us-ascii?Q?yBfFMr0WsgNAkZKkOdxWl6z0AFmjNG30L2xrGltsALUJOgdS7oxWNRHIigad?=
 =?us-ascii?Q?+J2w8dUukBpHJ1c4tqDn+5AAmt/JgY5M9rKYkKObGhQ6K3aUzYJHJVu7pJyj?=
 =?us-ascii?Q?QN3zCi7ySn5SVWJVCZsKIQx7u7mA6Yw0NioFlcb7ch1W5tOD/ngWVHxJaxOV?=
 =?us-ascii?Q?Tpf/JBNO7ORINm/g61nVVeKy6xJFD5FW3wtDsDs1/joJWmJfvKZQo1rF3z/I?=
 =?us-ascii?Q?tU60V7fipNaI1emOVsYKvDKQ9rKa59H6qmPiQ4ccbIEvYqnQSe1asLLaZLiQ?=
 =?us-ascii?Q?0rnLcqzGXyEtQwI33Ejmd9a+vFXUgiNPIS1Z/aXtP/NHVatCsYbeNIoEaegE?=
 =?us-ascii?Q?T+cpKDvAcQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db44ff0d-b2cc-4300-fb22-08de91e9db14
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 01:31:12.5753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j29Y0YMHoXISzfpvrhhwHlLmTf2po4JZCLrFZIHfPPQMVUTVdugfJ8Y5lMZzSd//msonz4MazMVzvpU0iy5PPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_183121_157933_BD9285AD 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

Hi Alexandre,

On Fri, Apr 03, 2026 at 06:09:00PM +0200, Alexandre Belloni wrote:
>On Mon, 16 Mar 2026 22:47:40 +0800, Peng Fan (OSS) wrote:
>> Convert the binding to use the generic power-controller schema instead by
>> referencing power-controller.yaml and removing the local
>> `system-power-controller` property definition.
>
>Applied, thanks!

Thanks, but patch [01/15] has not been accepted, so please drop 05/15.

Thanks,
Peng

>
>[05/15] dt-bindings: rtc: ingenic,rtc: Use generic power-controller schema
>        https://git.kernel.org/abelloni/c/0452290110cc
>
>Best regards,
>
>-- 
>Alexandre Belloni, co-owner and COO, Bootlin
>Embedded Linux and Kernel engineering
>https://bootlin.com
>

