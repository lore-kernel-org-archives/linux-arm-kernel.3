Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718B3CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HWOdJrCsnYanaP8JouiirI2ajLlTJB6sVZiACaYGgt8=; b=sTrLAxcR+O7qp3n/rVNY6fQ7Oa
	SjEfavDu2UPpA9f0xNb6wPFDbMI3d8UnzBz4La7cUQbgx0ktAnF+3XmhHv5kAF02nmTED0995wiK4
	UYfFJdMl9xo84SuC8RLplT89BTk2zZe4Nv5QlEXyjx/p4hXgICctEZtVSAGv6zuSeMktPG4w8Felt
	NZRwK5aIx+DaqIs2Q2NsMeLeSk5PuHMjtwGUamJtzJ069uukYvgwk+ORVvp7JbzJgNY58sqLOqzxx
	H6JanuFH8yPBwTEn8euCVgKL+n2uFTF+EOdEzfq2bOu670SjhoNJNxqP+q7ZMYbuAmJQX1bH0U6qK
	Qp5KCNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzeS5-00000003bR7-2tZG;
	Fri, 19 Sep 2025 16:59:17 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzeS2-00000003bPa-3hsi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:59:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cG/ZeZa2IFWyFYkZRLlVCaMLpnJGEfbhxovnUgnACMXBEj+4c9T5MAwLGP6YGPK3SIq3mtw4hc3ZS69IEXfQWOQzDFs3Mvcn0zkNVlISfutR/bFJeoiH+ALNn5W/kd1l9FB9FlCab0N0CUwCJwXcdINDFwwF6tOIe52fKZW/cp55C02t/d0XHQERqNChrnfpuTQvRn++A5x6Vygdc7RDMyrsUvqieAXxgrqKVyXVC+dff8nO9Gdf7dvwV//yXt2sPqBbyf2nvWVpzK1jp1smLlb0szOtYEhzcINRJunaqQslqWmAX0YeyWRwn569Gdw2S/5G9G6gl0MB4A4ezczj6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWOdJrCsnYanaP8JouiirI2ajLlTJB6sVZiACaYGgt8=;
 b=cd5w0LCHL64VU/R1oehCIjQzxOhnfFrh+MW5IWDz/9WH77y+bF2fpu20R1xnMHhjuiq41nszPhPdHUN250jKIEUOZvAKrV5sWJy/TFzZFYp7ukf78J4RGOb8PeK+4+se4s6j1yhMiS5Q+hdbtrysQiJpVqGqPG3qBdH+BDTMSFwhEk4t6EIMRDzr6EFHqQvUqe+rHqhPMjoPEokSuxHRYj2I06RtCFDUpalZEQ1XmOLn6h+1Me3DFZPIxIUlzibW9y5+5oYo0WujiboQrP9J3VYGYV7rXQl7g28Une5jAB76Wk+Na7gLd53w60kneCxmkqErWBsMdsENvqZY1RHXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWOdJrCsnYanaP8JouiirI2ajLlTJB6sVZiACaYGgt8=;
 b=L0IiUNXgqD/kZgwKPb7xrilJqEMpPz3+lmDYM+bg+jbA+H7iszY52bV6tPAQVvB6cxnaj1Ox+qlXt4frmTA8JhyhanSfO9Jqhp/usWLlYo+UFwsjjrosLRgDtfVTcvnSF5r0hnCht7ITGgi3klI4GsMfETHx9RDfO1m9RUAlqcZVjEUt+pvFopKZ0HqbQzKY0fEN6QdNLp+E8+7BH0SFAS1PEP+V7oxxBEjHO5EmYPx+68+NSFSUbMA2T9dotcwbywLjshaJUfSo98SWfV4DdGvaJvetBW7RBolcoSuKnfqH9YnElOj0/aFq99jjbwOYYhOPPiNTj3nRj4ntHBNgZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DU4PR04MB10646.eurprd04.prod.outlook.com (2603:10a6:10:58e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 16:59:06 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 16:59:06 +0000
Date: Fri, 19 Sep 2025 12:58:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: chester62515@gmail.com, mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com,
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	cassel@kernel.org
Subject: Re: [PATCH 3/3 v2] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe
 driver
Message-ID: <aM2L0C4SsGTzLQwi@lizhi-Precision-Tower-5810>
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-4-vincent.guittot@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919155821.95334-4-vincent.guittot@linaro.org>
X-ClientProxiedBy: PH5P222CA0012.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::8) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DU4PR04MB10646:EE_
X-MS-Office365-Filtering-Correlation-Id: bdc1d2e8-ab34-433b-63a8-08ddf79dd7a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yKHA7yf1huwGj89qr3UrIjEXhFIXX4+fdQOABrCEJJFpVV1MQB3L4SULiu9H?=
 =?us-ascii?Q?7aNcU3pV5vmfrnvHMMi78vLq00Cqcu60SZEscr05KrJXqHFzNduzlYnNHE+x?=
 =?us-ascii?Q?XlEREXv6CWZWaY2l7lGQThUmsg88zaIqcMLUeIJBCj0CwJycp8LfkGc/Tjq9?=
 =?us-ascii?Q?x81ljIMQQ3ntWdNcQ7vT/AoFvdaMtlGsPjjV+nbzUucAXVAJ1MUafCbbwWe5?=
 =?us-ascii?Q?Kaz2yi5dbDaeXT2dvfe+1KJHYT0nIZ3rBxZn8v+eyHBYd8cPl+7FbdV+Z3Ef?=
 =?us-ascii?Q?DvrRQjEjvUd90lhdxiwdA+oOis29P38WWxTqV9uU8O9DR0MgFSPiAcLOjtwW?=
 =?us-ascii?Q?sCDnue8rRT04m2VGIoIK3XMOGZUy0dOdmAKasWRzm3A3hO1EiFvbzitvHvUE?=
 =?us-ascii?Q?WUacphZnBp3lt+ueIVUZFK8YAgd2pwLJCgJxwK+oNsAgegLK5j53XlQ7VkC2?=
 =?us-ascii?Q?o7OAYzB5S1vaM5T46Zn7hZh3b2B8+q7PQTpOd5O87eyokprHXsKjUmNNOUsk?=
 =?us-ascii?Q?Oe0qYPmUw0+yJrN63Phz8M0JPPxfEZ5JTG1I+5C1yqiG2zsw/uswetBU5gRw?=
 =?us-ascii?Q?MD1w5enLeLCEvHfFUiR5f6t5e30U2Mu6RVVEYIPPlnKNPDLuSQiZlczQVMrr?=
 =?us-ascii?Q?PG7pg32S0uWKIP/tewnq3JL/ifw4oGHLK7MlpJwUV+0zv1miN3Tv8CDaJtKo?=
 =?us-ascii?Q?7fVvPYaDf+CA0q+hfdTqTCde1/VPJdkWOSJhs/cdT2W67UmFIf1K7b+tf7qY?=
 =?us-ascii?Q?JDmmVuBtsaDlUFckYUfxUmmcqeDCte5MJiW86BFR4tldEY9vcRYSuWtFDi+W?=
 =?us-ascii?Q?RUrCadmWOGgKu3iohtYTIfacpBEPTRp06ZB2yeXiHkuW+xW8BLbURFd12BSV?=
 =?us-ascii?Q?P86nJv23ug/eipGdAePaqjDicYheSWp1+qFc0V/1Xt2AbeXS+rIsQnr0zNKt?=
 =?us-ascii?Q?jmCojdFLZxRfbm2qtKxxkyRUVvQcotFsugfFLxHDz91urU+Pf4RCQoarDodS?=
 =?us-ascii?Q?aFR+HSlS857sZiwRzOA4h0sz4CRlgnAcUETqZc4QKORwiDTnOuPuD+Eeyrag?=
 =?us-ascii?Q?NwZxSNnsIk0fVMiBsVtau0sONtleSvFqhzFa2DN8/Na7VS8oLGdTLLqCR3k3?=
 =?us-ascii?Q?qhY89JfDjICsvkH8J7X0EHfHTH4ULUk0btE/VGwOadV1W6nUrXzR1/Q7e1Ix?=
 =?us-ascii?Q?5OvV5KnwH9ajK4W3+AGKJkTIdaU9JkrD7R2hXR+gWA7an5Qa1/4uoM7ivHFS?=
 =?us-ascii?Q?PEd9H5oxPD++ktB+cD2v5SB+1hOPb74KFT+0rHywvBab+0aoT4B06jCagZoO?=
 =?us-ascii?Q?sSnWl1d/wxYb8ihCjnQF44UhWypRWUW1tU3vwuUTVWP5oZv1ok1HLyVP6rpB?=
 =?us-ascii?Q?wIkJfX4aAK4eJ+mcZE/XIoFdlnyENnIfTFejrB9/+ODQIU9NYylTMhKER+DQ?=
 =?us-ascii?Q?LiuFAo0j5A76OEAJGtUZqB/iajTofFgBsnGJ4Xx6fvn237yMZK6IEQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P3XnHnID2202HnDRfNomURbXxYUynoSgHbEV5tGz7Btb9nviTZv+jebhmYph?=
 =?us-ascii?Q?1oqFspC2hMSF80ZtCmeO1ApQXXBCaNqEiBTahRtSP5WunXvgwRcEe+DVeADo?=
 =?us-ascii?Q?29WD7h4SpTZEzoKvN6Ko4VIuYCCanXlt/TJfKr+b4kabmRP+0vvehjVq0RVJ?=
 =?us-ascii?Q?EvIbHRp9tSySlVYOuaIGFaH5KkzcApu49vk67jOsXvP+fJwNCRyWWFy9EjvN?=
 =?us-ascii?Q?SSM72TSA7+ch6tSLMoRyroscMCS8Gev/uPTStBvUkgK6Pzb8mi5XaqVTSFcb?=
 =?us-ascii?Q?2Q2M3GQpoCvv+FI7HxxxI7ygSZd2JqFE6oyC1BvokP9eZSelNSJK3BswFRAV?=
 =?us-ascii?Q?2Rb19x0S8FTv9EfMGM4WKJHQO5PvUbowXc/7St9n0UfyFRAlvdvObmLscDa5?=
 =?us-ascii?Q?4WN+iJCHP7SbF/4yGjnr4wTcSwymXGTVfuat+GCqcy2VEbke0Z4T6At+6ixg?=
 =?us-ascii?Q?iUwnENEL4k291+bjR/7JlYZS2P0pQ7eG5KV1TY8BZf6aeT+lzee7T75jQRqd?=
 =?us-ascii?Q?WEs7DvnDLP3sCxDmkcTn0RINiFyB217T1kcSzyLvblE0D3GQWU7gOLGR++br?=
 =?us-ascii?Q?rNlbIed+isakjF5gc1df0K92fmWA85LJXyw6I4kHy2k33NIXHqJarUOEMN/l?=
 =?us-ascii?Q?vmfdXGkq/2OSe4iROzOktxBSYt5b//goPI0tSd3cBJJCKhqNH9rPzcyVdDeX?=
 =?us-ascii?Q?HhamZlyQYYJuQ4RNJTW0wqYimMYh64GgDBwAIO87twRUEsUpzcHLq0X3LnYA?=
 =?us-ascii?Q?v975PYfnoyTg+wYjubjblKTQC5YIDG6bCHpZe3Qvhdye3s1o4xg2OidLdjfE?=
 =?us-ascii?Q?a4t7r7tUFDsSlNDBJm4A9KYcZYEliaBo2OwQqbEj8Rxpzr5b51vJFeppLGbS?=
 =?us-ascii?Q?A+HK+QzVanCcPYZD9Z4Q1oZYLVIAs6EkTDyXb+IFA/OwiS+FG2C3Y8WjV5HR?=
 =?us-ascii?Q?+FEup6YHNKl3XkDeX+kwoqEKmCp9vOuaOrcu+Irps4WpwNxf7xjSTlvLp85a?=
 =?us-ascii?Q?MTPnRhespyCGcKf2jGL8eWJF6aR6Kml8vo7VEhRr0hQFTyMRIWfW5uBzuiWG?=
 =?us-ascii?Q?Z/I6i7MpI/s664V7NGJZewAv1OQlqIvNqwi5XdF1Rbl+onCARY//4nwWFm4V?=
 =?us-ascii?Q?qZVeLBABzr6x9+jYbphCLBow+AfHjgviWAGBY6+BnhMmFpvtEDHVRo8q7Cgs?=
 =?us-ascii?Q?KJWnRv6YodTklKvOvB56aZoFMFDD7tnhcIvAWpDalPVY94ZI/ePQ8Mtf3/q5?=
 =?us-ascii?Q?eiBZsq8ShMnECZPHGy/MGW8pwYvQ0GFUfh3nf5hTRlD/Kx8BV2JFd2laDren?=
 =?us-ascii?Q?l0KPa/3HKkiIbQAh7aDa4j/OsQjICPOFxpup8ag6vXd/cz6pF9TPD+S3QFaC?=
 =?us-ascii?Q?Jtri2WpuQYaGhJFOp7crUEEYtSA75cninpmhNLRX4tzP7UmgiyM5Y3oNRRNi?=
 =?us-ascii?Q?SJmnGOLIDUD3YZNOaNDzFtWSfWJ9KRsBVPGhGosxBO/QKaFOYQYhKQsKFJdo?=
 =?us-ascii?Q?1k06eFvf/Sz7FSN0LgRrSrxyTxvQna5oKcvSTS5ZPVoc9IK3f/f4XGv5PNXu?=
 =?us-ascii?Q?DetsEXaNtP55gYQF9tSx6qs0rMrY+SqS273xWKse?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdc1d2e8-ab34-433b-63a8-08ddf79dd7a8
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 16:59:05.9382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /rhcNJ/f5lyUbGdkun2vL8LPR9xJ0/j8PwW/Ehr662hPrr2XZY3iwOj9j2pqH82Mqn+wwXe+lU14emNscXFokw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10646
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_095914_946079_EB67D245 
X-CRM114-Status: GOOD (  15.08  )
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

On Fri, Sep 19, 2025 at 05:58:21PM +0200, Vincent Guittot wrote:
> Add the s32g PCIe driver under the ARM/NXP S32G ARCHITECTURE entry.

I think common ARCH maintainer part should only include core port of SOC.

PCI driver should be sperated entry.

see PCI DRIVER FOR IMX6

Frank
>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd7ff55b5d32..fa45862cb1ea 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3084,12 +3084,16 @@ R:	Chester Lin <chester62515@gmail.com>
>  R:	Matthias Brugger <mbrugger@suse.com>
>  R:	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
>  R:	NXP S32 Linux Team <s32@nxp.com>
> +L:	imx@lists.linux.dev
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
>  F:	Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
>  F:	arch/arm64/boot/dts/freescale/s32g*.dts*
> +F:	drivers/pci/controller/dwc/pci-s32g*
>  F:	drivers/pinctrl/nxp/
>  F:	drivers/rtc/rtc-s32g.c
> +F:	include/linux/pcie/nxp-s32g-pcie-phy-submode.h
>
>  ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
>  M:	Jan Petrous <jan.petrous@oss.nxp.com>
> --
> 2.43.0
>

