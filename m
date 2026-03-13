Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5904107BCD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrP8nup48VDc7CE8AiwFSe2nL7HE9QnPtNbgmxx+sdQ=; b=jv+S90o6E4/smnkacIDfRiWfL/
	xEf3MX3rDc094RqwTyN+W8y1h6E6tinMkP8J2UTAw9YeXqRj1Z8s/LZrnHKJ+6zFszn2G8HzexNBV
	wMPpUHXQ9VUM7G/TScT06b9UH8eUs/gNyfjpsSWsv2ZoSYq9oMMoNNTmrPwJzJD0Z9KwE1n6UTkQb
	o/hboEzVYF9ZJxnae+mnEklsqTaMTPcrMRxUEFf3pFY2t8oVc7n/RyHs6xggHCIuDYeGQR1qMirhr
	mqoOENuQWqM0VrJ0MbhqFFRVbtN5A6tqjo9lxkhU5ixH2I5wupbgxeBF2wWDxltkk0rpsXeDANgQL
	YO3q1qNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15jF-00000000gv4-2zVV;
	Fri, 13 Mar 2026 16:51:16 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15jD-00000000guZ-1uNh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:51:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XW/nShQEFP7kXQdKL41c4RfaTBz/U3VFgyG4nIQXl1HNKjiS+jM2zbs3tOdaw6xiyr5wKxTYGKZ7QxaXFeQFQpmfznHxL+at++HuKPKpiX6r+9IivHykjSUDZ7gJe/7bsKLXtfT+Wl2x2uNz4zoHe6wQ2lPfLj+BkAK6ElzXSHiKr8uFKoikFhUcKTpOq1ksKs3UwHDk1pK/nBE6YQTeZtIh1ITYjTvGqJ3hTVgWbX/IOhIuGzjIdGRw8IvwJUIScR2qt8NRS/rIQfUmUex+YmaCd2XLUEJZM+CZ1XXR39k1w2U8a0Dwd8J4sr4LU1UEJqj6wD8BpcyfCN3F5xWILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrP8nup48VDc7CE8AiwFSe2nL7HE9QnPtNbgmxx+sdQ=;
 b=LVt0bswuM2fNRQEdBvGk5zWPGXAbyVGSozdpiz+7fRRzlBYtl5tE6+KlfR1ZD3K1ndJb0khucBpkKbPIc4DCRNnymoVGQQuGUg5iP5qDISNkZmb7fYN9lX/5oJS1yCqzDGQ+y94aZpcxCW+TcNW4eCQ08shwrx06JtzeAExcH/kQ89BNhgoKhRZQFyEcBiSo3dAs2Jz6C/W7ed3Hns/J+LTrS6F/lCpcrTy2QecjZ0g2qmYX92hmuSG5xoMqlMiuVAfjTBYM3sQWnIYjagR0YPzOwiGyAtHAKTs2CetQPlolq3NjqSNFYYEdTkM+yHZjXLYEpD0URpUa3/bdRrdYpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrP8nup48VDc7CE8AiwFSe2nL7HE9QnPtNbgmxx+sdQ=;
 b=SviTm2TtE0KV7ENkKfYc06W+iDRH3DJksoIOqNsqkbrlNn64PkNe/JGSumI8LXoT67RMau+SC7nsGySiCtYhCZDwvwuqYtiEKiv7YtXbw/+FMyUoJPYi0aPf1M3HaIqR7dFqjct+4g4HnrgNRV69pBFm/uR10evbP4F4m798+941UHIdhAX0fSrkoCw8rHx83xApectnD9P61qyEqGSfcXL42Fk5miI6DcDtzA9jMK18SilrAbzr9za5eUgCqPVbknC++gZNw6CeScLeQTCNB0GCvHEXuf8nkSDUPAwk9WynBIW1e5ULB1PjFoV4hXc5eY8w/kzKSEEe/Zeu9Fivpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB9082.eurprd04.prod.outlook.com (2603:10a6:10:2f1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Fri, 13 Mar
 2026 16:51:02 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 16:50:56 +0000
Date: Fri, 13 Mar 2026 12:50:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] Add support for Variscite DART-MX91 and Sonata
 board
Message-ID: <abRAaZkks9Jilo-S@lizhi-Precision-Tower-5810>
References: <cover.1772642881.git.stefano.r@variscite.com>
 <abQpn9whz_o4n86u@lizhi-Precision-Tower-5810>
 <abQzQnmG0Xh7wXjt@Lord-Beerus.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abQzQnmG0Xh7wXjt@Lord-Beerus.station>
X-ClientProxiedBy: SJ0PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB9082:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d8259b-0acf-4d35-5bf2-08de8120b215
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|52116014|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: E4S5V2nEjleRXLukNOVBmYM1/eF9+G0W8LuDIHlxi26CzU08o0EL5rUwJ+n89mA9GqgbA+U469pPtOPpuzB5kNNFNDRTSV+auMChmp11vco/aBn6oNhs8VJq1mNxAy1F2+UxdN1Phzf/bXS3N7gDtowIM7hGbBnvwr6ptqrG8x7MQ1G9aghWlzy1OIQjlS/f+s1fVdqdkVatPvHYDetNsEm34u66kMjx0ItzPhnfU3HdrFJ+wqomsBzQwlfeNBao3/qDjOArDSYtTCK36MYfqrLYmaL0eQGl9PTHwaPDIC+tXVRRjVdWF1q5doswhZCLrmWLjkZmQK2y3/nmOGPHiyBq3zyH9BOPQM8oa9O0sJH184tzQF50grCtjcwcSg/CS0WZLvvhc41DrLtJyUIZDbTVTSBa88zxMZmd7Lt5SbasxnWiXBWQxdp4kkRvqCZb1YP58W/ctqvPLB4vhK4Y0Szh1yWZOGET2FpD/RiyCg3ISxawLziNTiseF1QHlDzlDNWXMxRq0NqNOYmZIw+yWA/QdGcsy2Vh/qd5xeVz42nfMjjTTXgsLHMQalqJZge7XKLgJI5K0p+eSbKVoabiWkT+lgY8bmVoQlFVL+MuzwMEl8BPQaewD6i1Aehl65U0tbTk8r/vR+jJHDEuEVNRqZYOukE7iuhu1Y8Ag5Q1T9vydU76NFcMFbuYyd4ByBYlEnbWFum1z4rrgR/4vtJ91ciXug8NvRfi8nMi69Ey1Sp0ff3N8MZhtk17ossMbJbt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(52116014)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iWKl3G4dqCkGFd8Pm/5XAQ+eMLP/oZ21cdmtdeYNHjUfWfLoJ+yidTOmnroH?=
 =?us-ascii?Q?cTDH/Yw8bd7HCjsvyOEGD2MKRcIbvkfWwDHlSJ9mrRQq+Yqc+1Da8k6UoT1/?=
 =?us-ascii?Q?N6DzG8jJFkU/Tt6+fVgpExJz0QH4i0NDK1Fa+CiCWu8T2aE+xbKP1oziAKXk?=
 =?us-ascii?Q?Vjx/eLE5nn5Qo1AeDMUUwSH5VVv3ueGG4SqgGk63xsgPfWfMblhS+HUjVoFS?=
 =?us-ascii?Q?y2gf9roU0KfCOs6jBRYShLbgo7VmeLvN1JMyHU2x9taHc9V7w5gklJMtwRc0?=
 =?us-ascii?Q?qwRTPW1oTIoznqZ7ax9s37dYjV1tW7yA76E3NMnXFMYdd8uv3p6viAlCv37q?=
 =?us-ascii?Q?1MhDu97Sx8eUqw43LOhIRFd3kLrNxkvHG3fNCe05qSrg93SCPIdh9dwYJZc4?=
 =?us-ascii?Q?EcvHGL1yW0lnsxF4biWn5GTPd4UOoTLhO/BBnZO9OtrjgMpJSprCNt/a8krz?=
 =?us-ascii?Q?ULgh5nuFZkdLytOjrgWjBmxYkT4O0Vh1HP7RvDGw0axAYpPLz+y0nzqX4bGs?=
 =?us-ascii?Q?5mfRFwOHSjUUMuCWD2oAGk3bRIGyWvQuSHHrNCo/aYX1O39XZVJcbgqjQ3T+?=
 =?us-ascii?Q?N6wzpi0MTYtQEjVVpXiQxsGh+kfXBM7XoJlbnwFG2g44l36bCu/36SokR9Ik?=
 =?us-ascii?Q?+yFBDP96BiF4hrHw+0n7hfNvYFEU5qpuEaT0WmhBbyhlcbsYXGifHuG7GozE?=
 =?us-ascii?Q?GH2nMBzCnDQ1bSS/wqLJk8GuRrKoesa/e32HjJBhkA2AL2DXdQGP8ytasXPA?=
 =?us-ascii?Q?t9l0qv9v8FCzrUpDbNbhVtOBUoz7IutFLo7ZQJ+rGZo3JF6dB+PDVJ7eeSo9?=
 =?us-ascii?Q?TXdBz1SyBs2EpWxnk+4kiYbAOkmuqJ8KoWMQFGtBWKN01pM25J6caFdp2KjY?=
 =?us-ascii?Q?8JjbTOFEnyzu2+qEF5otPiAKqhub0yw6MJ8hFNAPgqqFzGL19hquU3Wgm7He?=
 =?us-ascii?Q?41i46HXNx+GY4lD4UmgpliN5aHHxy1tj54+QPhx6Wc8SnZZfd8Jg01Ykv1M9?=
 =?us-ascii?Q?/Q5x76yzWHv3wcvqRvPJPlm93v53krTxkZ2b4xHiSC0se+zbRCKmW5xXkP02?=
 =?us-ascii?Q?2WJ1WglhmMMawXbynFuDUti7hB5nfwBC9TAh55gFHZi7puWKTDr3/3pOtGhd?=
 =?us-ascii?Q?blPPEtJzeGlIaR9vvQukzAUKneC9Z96pYFtrGGIZLu+J+FTFk49CcT8QQTt5?=
 =?us-ascii?Q?88N4oD/9h10C9qLBejJJ3yXx3+k5J7mHB4CJadK2I+TGR9AbjoCN5AbtDU2f?=
 =?us-ascii?Q?tgpRrUfF+Aoq2d1k8PKcVTRVRDqdd2rNf4dCyeliYoEYJsag74X5k/fvBdED?=
 =?us-ascii?Q?mN9K8JT8SN48xCQTAS1UUEuEUrZzZTVfPhbyVs4mtgotEMM0eK1hIfMAE7wH?=
 =?us-ascii?Q?17cxkSfaB0745bCbYCcqixREmnn7YNIqt7W1OkYDm7/jC2lIu6kgDfxFSqTW?=
 =?us-ascii?Q?TuSl0NZV/MKt3qbp06MtMlFZGtNM8nzWVGj/3aQyPfWbsyuGQs4qn6fHLgvY?=
 =?us-ascii?Q?ys/Xzi2dZ7wvTssLTtVeTB4ZiLQLE2Yg1OLKXel4j0tKScRSp4gzzJhxTf5p?=
 =?us-ascii?Q?iM+GYM6hSptXzhxYZK8KZjpvnORxky8O5c9CLQ33s4+A/JEvMWUGFJ07gNTM?=
 =?us-ascii?Q?vY6yvRMGvKwzFf6jawt05BdPZymt0WBOeTXUz4M2j5f+pZCcGwjeQgg8JRpm?=
 =?us-ascii?Q?SDkXIPBCZpb5G9IymGwl4wKzsdmk6W/3Pncu02aLTiJDwVt6xYYHrn0PUfuM?=
 =?us-ascii?Q?yzuxsw5GXA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d8259b-0acf-4d35-5bf2-08de8120b215
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:50:56.1599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvmKnWZCbZW904lyDMMN19PfcKZ91DRiW6eH2M8ZaDvgQTJsaqik/ke0c5C882XWZxuhPtFi4FLGSzBKrnlUGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_095111_494549_28AF6226 
X-CRM114-Status: GOOD (  21.22  )
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

On Fri, Mar 13, 2026 at 04:54:42PM +0100, Stefano Radaelli wrote:
> Hi Frank,
>
> On Fri, Mar 13, 2026 at 11:13:35AM -0400, Frank Li wrote:
> >
> > Can you rebase to my for-next tree
> > https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=for-next
> >
> > And new file, run https://github.com/lznuaa/dt-format to keep node nice
> > ordered.
> >
>
> Sure, I will rebase the series on top of your for-next branch and send an
> updated version.
> If possible, it would be great if the series could be merged as soon as
> possible, to avoid having to rebase it again on newer changes.

I try best. I go though as reverse order patchwork order.

https://patchwork.kernel.org/project/imx/list/?series=&submitter=&state=1&q=&archive=&delegate=

Small fix go high priority.

>
> Regarding dt-format, I can run it, but in my experience it is a bit buggy.

Put bugg in issue list, I will fix it.

> It sometimes moves comments to completely unrelated locations and does not
> always keep a logical ordering of nodes.

Logical order is hard to follow. Each one have difference opinion about
logic group. I am trying to normalize and machine script. I use same rule
for every new dts file.  property order is not so important. The key is
node orders, which try to avoid add duplicate one in future.

> For example, I saw cases where usdhc3_wlan was moved before usdhc3_sleep,

> and pinctrl nodes were not kept
> at the end of the file.

About pinctrl nodes at end of the file, we don't stick this rule. There will
be more than one pinctrl nodes.

Frank
>
> Best regards,
> Stefano

