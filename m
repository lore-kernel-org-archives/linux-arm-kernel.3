Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8BDF4BB89
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 21:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LbTWcJ1jDMsRMCln7mvnI6t8mQtPfwCq9Q010oDa2bg=; b=VgWdTfUhUE14Cngf5hd4+Q+R0P
	MzOqUdtw63PhjPWQneR4oJ/WdzoalXQLpx0q6EZF3PjqEDjEaN2/iMvbzk7kznFrdXhAzcf/+Szfo
	f6EoGTwEeiFSlhXBfpHff2FDgokTLx+W8rhOwH+P1Dh6O8CbH1pfr64w5yJps+NW37A8p6S9uhj6x
	I/I88hdZ1tf8DrU0o2D9ypSv/QYoZB4adgtiUe4NQAMOijUZKRiQLva0mzRmf8mDkU0VUHsiKkhuW
	oByRlgxs1RjrWZAPz6Ws3AyfBMpODkBhbtimMvllvNjK7AqkbqYrF1j5Q1O6/pM7vIi3WZHZTRTqC
	4Y0YWOlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuzzM-00000002oYY-373Q;
	Tue, 24 Feb 2026 21:30:40 +0000
Received: from mail-westeuropeazon11010007.outbound.protection.outlook.com ([52.101.69.7] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuzzL-00000002oYB-1g5K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 21:30:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDmi82VG9dDFsTJdLWM8nga5c8xCxnU2IVC0+urlDqPe6Za+ADLyBVo6BOKnVmoo1A9Xjcp34S1hoKJv6m7osxbYS1vzRqc+jWJ7JNxBwmmoFlMiiZeD8jmlMb8v1knYoLMo1Y+T1iv8rkmYwtlr21i8jqIKfgrkkctZ0PfGW/oRrVVjUzn+eKd//faY/JFQZiy9mV3iUTeIcoghUQM478JQtzSyamu8sgLHgSZc32sQisbXcalxjGJiskdg4HpKjyrJbc6HDMr7cS6F1vkGp8D+lWt83fI0i/FitgHyBYhJGB+9XDfa8SMioUoZrPtfKmGpTvqdbWq4jPnRyuqUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LbTWcJ1jDMsRMCln7mvnI6t8mQtPfwCq9Q010oDa2bg=;
 b=efVbxZD8vYg05jTYzmw7EC8kYSyfYA+sDAuRsZa+eVARENbNXFP5V9mseLMZzUxGlKZBceqgy9VIaBAO11IsINkXelpG5gph+FVH6kdQ35szkOHqHgA5hZu87SHvwg0+L/IE2HPXG20Q+7qLjWdDn9QAMb5a7S+tL/7q5MMLeNWERxxBlApAAxDFoCnYvGC5sj9mmB3PIn8ota9Hx301CYoOjI7E+A6wElso2AUcCXXOCd04Ei/YKcnNk8E8Li9LfUsSwJo0TPMXV+Pizwc3Sb0jgReERiXl6ENvq32TEqLV24ETD0wWJv5styInZU7KaT8k3rEeCZS9ufiMRHyr7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LbTWcJ1jDMsRMCln7mvnI6t8mQtPfwCq9Q010oDa2bg=;
 b=ht+9sYKTp0fkjWmvpThkt8Y1kueLBZV4UaImJGQrWwTnFFjsBnM9goJ4HUx3Shr9figkkCRQ+D6V0e6+dPRSo0U62x1i0J+G9mB38UtlkUrEwuoYyQmf/wOsS6WK8CBMO11cZh0fVtYTA+39EZaOrYSF9Ahu49n2IugCd9jl74QGPr/b3iaquOn0DKZTbKvkbLuntEJRWv3rWJMwKsBUMoN6IYbxyTDg2uAz1jTm0zE3nGB0TYBf43G5WXqh+IWegwqlE3C1EkIKIO6JSh/m1afNzBVQ/7D7muDeHmbr+V5rOs9bezZgypT6MGFeQK8PLqkG41yIcivuohc03IJEgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7336.eurprd04.prod.outlook.com (2603:10a6:10:1a9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 21:30:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 21:30:35 +0000
Date: Tue, 24 Feb 2026 16:30:28 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v1 06/11] arm64: dts: freescale: imx8mm-var-som: Update
 WiFi/BT configuration
Message-ID: <aZ4YdCIG2JIT6BQS@lizhi-Precision-Tower-5810>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3e79c4d806b8b8024b71bc99c36b09a2fbb90a65.1771353301.git.stefano.r@variscite.com>
 <CAOMZO5CAb8738HdH49WcY-JPTzQ90n4Bnmyn96_3jfw47mxOug@mail.gmail.com>
 <aZTEm8nUUVcKZH0v@Lord-Beerus.station>
 <aZXqSz_OsCC64P7i@lizhi-Precision-Tower-5810>
 <aZX0WB_6qPoCYVvC@Lord-Beerus.station>
 <aZ28RtuAWcatyVAf@Lord-Beerus.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZ28RtuAWcatyVAf@Lord-Beerus.station>
X-ClientProxiedBy: PH7P220CA0036.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a4a54bb-f44c-4d2c-2a7b-08de73ebf247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|52116014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HrThLgp6JA5MnnABjECSXqXmPnZp6HZYSndCw0vbhMyzg+qL/wmkoKpMSfnp?=
 =?us-ascii?Q?Ny5yoIecOjdECQCsPtS3oTz91p6SADPwyS65xrbp07041B/kSyHFtVavASSM?=
 =?us-ascii?Q?bV2ncM6tpCyj3AB6PcJTPtGfr7RRIc3I46TG7mAlz0Y6A/4Nv1f015uZzUW6?=
 =?us-ascii?Q?NDw5aCBGLwfDZ0rP6nD4WajwBhtXFYnRFmqAmD8lNW3/Pf0cL8lSqQnkVtTw?=
 =?us-ascii?Q?8hbvEkMIUIMXBFbOHPswEZjnJyI406YkR3tPZAErwFg+K7qKvo+XFoycTQs7?=
 =?us-ascii?Q?DcXCtag8QtgBjVqUfJG2aEuZLPCKYHlt0CFLpryLqgShpXBTgTv6VARkSEFq?=
 =?us-ascii?Q?00x/Qw7ehG+E+C1rChPFfd1T8lRcJfcm4gfTg6LnDOsw37kOcItd9uHNA4pI?=
 =?us-ascii?Q?JmApUp6BQspW/Zzkm+7sME2iqlcPI+wHts8rv/xRrIzX0+wFBto2wwO7YeHE?=
 =?us-ascii?Q?bJy4c87hdQdEcTFqhZyibc/vN4o20ISjbDOyS+0bnc+kSzfLNenRxab0ZMBx?=
 =?us-ascii?Q?q5CcWyM+Z1q1uXNho1DFdWEbBK/SBbWmpJIJ1edZ1o3RPsUqOraiAFtkNo/S?=
 =?us-ascii?Q?qiIlGwydGohHDIa/QtrWr+kCS2FjWZBObvWctj6FoJ3lB8e+uFmoIwdyRQ9X?=
 =?us-ascii?Q?N4qLJ3e8/qjdI4rteVkqVVFe6GYvrqCLHMZcAUHfQfNgDQ7IUBSorPXA9Yh5?=
 =?us-ascii?Q?sO5SzX3pyZaN81Pp+hvfkExgzNvkhDhGQVztm+j3BfCMyM9V6cdVW8Uy42EG?=
 =?us-ascii?Q?lO7lia+oTJKWJskTumiO8Lqac0ZkzRX8eOy8bkasGIQo1eR+9GPtvM9yyeRd?=
 =?us-ascii?Q?yxWWD2AKxEzqHwgnGPmLvChnfxnvAO7ybPj814C0lv5NAjD3h+Hu/5Ng/FNs?=
 =?us-ascii?Q?1i74SyLzggyJq7lWoONE4HZlzu2dD8jHvfubHPOwpFErFdxiN9tWhl98niHo?=
 =?us-ascii?Q?xVFMOtCI1WoSWjISUw2XX4ytNeRHtAo0NwUPedbJMphDCL65ayjZSABVJQ8f?=
 =?us-ascii?Q?lgkV3CWdAFnrefDSPa/Wn478aGdDC5BPkpzbX+raj/JeobbqwqTjDmd13x5E?=
 =?us-ascii?Q?9KNGKXMztE5D16dvq9cdlURd2aAuFFOHu3rBF16/zZ4WTb3+a2Od9DRBg40T?=
 =?us-ascii?Q?qBqDOpYSA1iCI3ucDPybK1jwTDktHptsNhG8IX/KFRPF2YHA9gjWPGB6Ga5V?=
 =?us-ascii?Q?JXFzQRfkAsGk8RC5HiALrVUIqwZF3KWmm4/FFCtLW7piX+IrEqw6OUpVh/6t?=
 =?us-ascii?Q?naDnfl/SACtg2JdWyjzZIkrUFJaKCkwN46Gqhu+3sLy+OqTpQ1qN1RRydJHS?=
 =?us-ascii?Q?Ns8hSkRrvdeKgk3zVvo7NeYcym472qb56kipNpGUrlwuLhsy2JTO80vQZnCl?=
 =?us-ascii?Q?JFTvbIKv0zunZcBXUhy3JgTbvuigrWqWR6X4heomAj0XPT57AKT5s6/feLx0?=
 =?us-ascii?Q?vU4mmVyHQnXWyV5rsfa9V+cySt3YCGHiWg8ReY/egMS2jPs5N2g4RJvHvrdd?=
 =?us-ascii?Q?j6kOy4scD8tBSde13zGly/INSPtiDHxlX59t5BBYyeMcgebJ6W8sTxr08pnc?=
 =?us-ascii?Q?XQmbqwmfzDYZNaE7rYX0lBVG6HUeG47+keUPXnEn8w7rRFygs1MnJdwBt/ei?=
 =?us-ascii?Q?MOCE5vhp4kqCSlYtFKOHeUA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f3JTbjq586jdkV5m+dQqPSZSsX0Qz5qZtjesCXp58Jd1NdnAR3s+I5km3LYN?=
 =?us-ascii?Q?0XSP3gHIsmATZ9qELK4QAhBpv3RrbRw5danoHHiUdRfkg5yc880XqrRPfOb7?=
 =?us-ascii?Q?LX9FiAAFQdRNMviFaSpWbmKcoz4xpJSKVuV+MTkfz0oi+dJ9MfbEPvDMnRWQ?=
 =?us-ascii?Q?cdhnVNZwNstKX22BNDrVoVCU5G0N3oSBGWLU33eKzAxxGstEE3aizVIEf0C2?=
 =?us-ascii?Q?bAGDGLud06BWqpnshMCJaZ/mW4WjJ5Wd+BrEafE34nRAAT1qhjBuYTPaqX5s?=
 =?us-ascii?Q?Pf4SLRmWf0LCoJTCiKARw4nqXe531Kg6+uTWvPHpt430jIlqaGym9KIkXb81?=
 =?us-ascii?Q?feyW18lC/wbhqJRvztOCG4RRrqJFXxnoz1Fp2YaU6jlsMb7tzZagMf3rwVaK?=
 =?us-ascii?Q?TmE5uu8vPHt/qdKeyHapC5RjqyRr58c6OX+hRC4m+oUjtuT70WExgCl3kmkx?=
 =?us-ascii?Q?WxXxmi+m7dkGlIAGfnxxZRwb5esiG2iCOhDFS1jIK+uOFF6DXuT9plk/Cx4Y?=
 =?us-ascii?Q?r+EukenwyhGFLmeYlENfo6P3Fd9F+KWUaNuF1OhLHUi4wXiuYzEIK0d9z+Lo?=
 =?us-ascii?Q?zwGKYUwLLz5BcuRCVRb5Ds+dARROP0IMwnNpqYaW3WkbAnkbdY5BfMVLYO9+?=
 =?us-ascii?Q?RzQ+dlqUul/Sb7kxMOu51NepGuN/UKbMAzFTwmC6/F+OznVu2oCeE+8Q+Nrr?=
 =?us-ascii?Q?qBL8JcsJCOjOLmAXOJ/hEFqGBLE4bUpwL5fG/EJ1s5ITWuA8VwxS8HcKu1qi?=
 =?us-ascii?Q?4TSsQchQHoqJhteyJ6O4lxSGVIzgdbgBiH4np4ydOolq7mCqerT31RSysUxG?=
 =?us-ascii?Q?mhhVrE1CKT8CzCLnhlPbaCC2dCVtmUAf2YUmoDpke+8Dq1md2RKrxgLlVcB9?=
 =?us-ascii?Q?oa5Ic/0QIYbBrfyO7XVhPkRpAhEA2CYK8jD873CFqufFW8QyidBW4QSsWjl6?=
 =?us-ascii?Q?FkvCEFtt6hDfSAmWkRrk/8PbmHsWSo3yssLQCJNS+2E7yrAX7wIyHKLeWvOP?=
 =?us-ascii?Q?iarg+iWc2pO04DqtYusYbGdTYqL7C+J9HYJ9g0z6AIbnR6VhjSJEQ9JZCe0q?=
 =?us-ascii?Q?xNJp07bVmx2FccoWWf8xVv0nL0k4xN7V7OgG2RoZUb9VGSCmZDTgb6PXlR4k?=
 =?us-ascii?Q?M9AnBpVeblEw0TMqewQJvcfrvXAJsLhYwEdAZttcV8tW9Zy2uso09JzuTmHJ?=
 =?us-ascii?Q?dzx75n27pmcJLaOMtPpgtYKUWFdvikW/HtI1kxLviXk2ClloweqtL7mzI17f?=
 =?us-ascii?Q?ZtH9jWUu1ITP4DcWx/v2BI3y7Bt6CCMHqWTJII2ELo04ei7UbIiIQZvwkxzQ?=
 =?us-ascii?Q?zvYx12n0h+a3a5rp3+7jfrzNjfq2T/IvlELOaLAfIqmD394pQ7cT2rNUqfak?=
 =?us-ascii?Q?CtxghqJooU4NzI6kxmaBy74Gy0BPKy+rEUM7RWxd9yzdS398R1m8YfMUk0MD?=
 =?us-ascii?Q?XCN4g/F+ARTUNn1CoWJWo4Qts6tFr6DhJ25Nus+lf9nUXGZPKcSjxUFUqp+b?=
 =?us-ascii?Q?mOGVZ00h4wQkekVrmXXjlphN0wV0Zkph3hRAgGxONUzj1aN82S7bSeC33Hsx?=
 =?us-ascii?Q?zZfxKJZFD6sLJ+LD8oUdypj0WU1XJsoVdQwqDWHrRtgKk9JMvbBjZx9seGUR?=
 =?us-ascii?Q?tUiaLXqie/bp6o6VvspXRr3a3r6xzXBmKBowxRXL77QgcEo2R8y4wshPmVsI?=
 =?us-ascii?Q?BzVyMe66doFtWEMAL+BoSQH8hmU1g0IfeCCL17F9yJj2B/Db?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4a54bb-f44c-4d2c-2a7b-08de73ebf247
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 21:30:35.3731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQ94gGrdgLhX+7NoluC+DSXEvl7BAPypWRvzpHPqA2FkttQCoj+SymW7xwDBhpvJpWjYNYzMXy6q5x2T+jBjxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7336
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_133039_469248_11D770BA 
X-CRM114-Status: GOOD (  31.14  )
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

On Tue, Feb 24, 2026 at 03:57:10PM +0100, Stefano Radaelli wrote:
> Hello everyone,
>
> On Wed, Feb 18, 2026 at 06:18:16PM +0100, Stefano Radaelli wrote:
> > Hi Frank,
> >
> > On Wed, Feb 18, 2026 at 11:35:23AM -0500, Frank Li wrote:
> > > On Tue, Feb 17, 2026 at 08:42:19PM +0100, Stefano Radaelli wrote:
> > > > Hi Fabio!
> > > >
> > > > On Tue, Feb 17, 2026 at 03:59:33PM -0300, Fabio Estevam wrote:
> > > > >
> > > > > What about users who still have boards with the Broadcom Wi-Fi chip?
> > > > >
> > > > > Will Wifi on the old boards stop working?
> > > >
> > > > The Broadcom-based WiFi module was used on earlier revisions of the
> > > > VAR-SOM-MX8MM. That hardware revision is no longer in production and
> > > > is not available for new orders. All currently manufactured and shipped
> > > > VAR-SOM-MX8MM modules integrate the NXP IW61x instead.
> > >
> > > This common problem, we met similar case. After replace new compenent, it
> > > should be new boards, or new revision.
> > >
> > > I don't suggest directly replace it to broken old one. You can create dt
> > > overlay files for new boards.
> > >
> > > Krzysztof Kozlowski:
> > > 	how about other vendor handle similar case? Any guide line for
> > > that?
> > >
> > > Frank
> > >
> >
> > Thanks for the feedback!
> >
> > We understand the concern about potential regressions on older SOM
> > revisions. However, since the wireless module is soldered on the SOM
> > and not configurable, we are aligning the upstream device tree with
> > the hardware revision that is currently in production.
> >
> > This change also aligns the i.MX8MM VAR-SOM with other VAR-SOM
> > platforms already present in mainline (e.g. i.MX8MP, i.MX93), which
> > use the IW61x wireless module as well. The intention is to keep the
> > VAR-SOM family consistent in mainline with the hardware that is
> > actively produced.

Actually it becomes two boards. Change components is quite common. Direct
change at dts is not friendly for old boards users.

> >
> > If there is a strong requirement to preserve an explicit description
> > of the older Broadcom-based revision in mainline, we can evaluate
> > adding a separate description.
> >
> > Best regards,
> > Stefano
>
> Do you have any update about this topic?

If can't auto detected, I think keep old dts, use overlay change to new
one.

For example, board.dtb

you can rename board.dtb to board-revA.dtb
new board.dtb, by apply verb.dtso to board-revA.dtb.  Or you direct use
board-revb.dtb.

If change is big, you can create new one.

Frank
>
> Thank you a lot,
> Best Regards,
> Stefano

