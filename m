Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D679CD46BE3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJMZHnFxqaxnp0ny1jZkU5zG3XaAZlFhVFSl1RauP1U=; b=Tghl5q/jLyrr/IAAOZhUh3xRTG
	HYjLggkHZgWYnu5juGCnQSljXGQxqNQUWhY9+TrKT8j755F2FzXkQbKs6njYNkqmv5S8ESXkv+Ihp
	9ptHeAXAt3NaF3NahTveWQbNiIjrpbaIiYzlIw6qyQoqn+dG5on56FOZhUHQ6VTA3Ky4KQrZ/eU/G
	lTeFDXh6DH8i2LqcmwYTv9zeDJMHHWNyJazTxiQkx30MA0Dcg67lWaUZ5uhJwzaMBPSB8lf+0SvCl
	MruY7wEcFLVoPCJ8CzwKTT6GZ1Pw/8gAjj0hr17Gt3cOeUQrb5ticXanmr0cHfhyUnjf678Nqdb7B
	mIr5IeNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Jf-0000000GTo2-0DnD;
	Wed, 28 Jan 2026 17:26:55 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9Jb-0000000GTlR-3Ygo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:26:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSqh+zYS5FDYjpxB+vgsVMMENNAqD+89kS9fGxxZHQwjmWXhFNxYTZD4bdb2DqbfxhQNMAYMqem7+Y/MxJrwL3IWNnQ6j+4Xoyf8QY7HXkP/kyvlCm1QwscXc947NRV/BXnQtGnXk1ahonO1bD7mAl0ScNnv5ZCQDcynR3ZXAy3D8j7M6RdwKp9fVOGYFeio7ItR3SoghVAKKINJaoye2AzEm0LdpCL4BX9IM8NAHdtOWlM3e7izXnvnuZhBBo/eEo50TVLnLVnulDawUzsrpOwxRha1NZhx3U2WzJPtAHbPA2nmuprc8WZlamwXU9LkPiPjJNlVMJbSpqLLPtPU4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJMZHnFxqaxnp0ny1jZkU5zG3XaAZlFhVFSl1RauP1U=;
 b=Ubpew4CWHLymEcR5RjdJKs+M4Elh/gsVlMtNFPY8jRzAzuIIKBy2vRv6SZkgzXkakflLNvrPHfZWnXhfIEhzk2oGjxCdx6KrghIrEQipXWfJIDbZzsCElGgLPHZgb1mW9WPVOc68MSOBA6vEW+H+iHLn2CCG5QjCdwdEnNIM1CcR9wnGtxNUAOBdDnUxK8VBycKEgnjD6eSLKRNEeAA8qIXfku1jP95eKNW5mmYxtQyhwoXeX6Q0Oo7+XKbnIjPdk4D0mJ5F5q92RMRGHcei0hf0Nn2HnnPuvg1RCOxAkLTBwioxJOsbf206D58BcP0QKm96cFpHuzHZsopcS/Icqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJMZHnFxqaxnp0ny1jZkU5zG3XaAZlFhVFSl1RauP1U=;
 b=gRbWgziT6OHfuKKB/Tb5O07LFwwFYbWCk+tEIeltUkvrdqMLaalZYwLX6/+RldYyQGq30CD2ZQ55aEjZ7SR+NjeYi/hE/xHM+6vioYOPu2DQYj1wDyv6r7EJZmB9KfVh1HtOf2FS5aHswUqXeU1mMrBzjj30T9LDHDpWKelJRGN8M6HXZy2YsC5ONM1jRBeGJRrUpGYdZH8tOM8AzRYyiwKzw0VIJUf7vjHSQy+jg5HevSIG4NpbnB25N+2jQQ8usT6XG0cPDVgihhKp8b9BwXETKqKBEO4XTqoTxB/30XoQTjyMUoKuia+bYujOifsHn9TGBzPsUHHNcymRKjDqeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10779.eurprd04.prod.outlook.com (2603:10a6:150:21c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 17:26:46 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Wed, 28 Jan 2026
 17:26:46 +0000
Date: Wed, 28 Jan 2026 12:26:39 -0500
From: Frank Li <Frank.li@nxp.com>
To: Wig Cheng <onlywig@gmail.com>
Cc: shawnguo@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	zaq14760@gmail.com
Subject: Re: [PATCH v3 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
Message-ID: <aXpGz3185shqxpyV@lizhi-Precision-Tower-5810>
References: <20260127025740.2601841-1-onlywig@gmail.com>
 <20260128155529.3699599-1-onlywig@gmail.com>
 <20260128155529.3699599-2-onlywig@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128155529.3699599-2-onlywig@gmail.com>
X-ClientProxiedBy: PH7P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10779:EE_
X-MS-Office365-Filtering-Correlation-Id: 28249ff9-8539-4f65-27a4-08de5e9269af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|52116014|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?48cBdeCr+jRIvlHZBArHDas3hboxCr7QSxjbOGEgmzxpwHrdGN9jN8uJYh8r?=
 =?us-ascii?Q?GIq2T8qgh4DgTCURKHFPNkX7aFdcbbrLXep0zXgsCNNX3wK8W+KwIO5jZVN8?=
 =?us-ascii?Q?dPsXIorJ5bcnTutlSdHboQ9P/ImUwEKdAcgkM+9+6vvuhmeG3PCD9WymRUu/?=
 =?us-ascii?Q?IhSml3zM2bCYjWBwFeA6Gg8jqULSMA9MycIenWKOGj9WQqz1MeLpmAM6if9a?=
 =?us-ascii?Q?p5gZSOQWQGXfAwmbNDHNTPi2ePJeigDJ1MeLMhlC4ebdVbFxvPKJpLx3ZQlc?=
 =?us-ascii?Q?MBCXS3j8kCrj64kAkyA/OSQi4uYdWKpylK/EgLH7gVAhl9smV7cec8PNIiaG?=
 =?us-ascii?Q?6OtIAdnL99E6Vt+7AQVifLQkzh/U8Xg57JXfXPg5SWrJMN9MQA3017jwRDTy?=
 =?us-ascii?Q?soAxWCqJJu1xFVfoVOz/Q3DesVuMtUW0HUZaVn5QVAqyOhhNPbx/oAx7Ke3r?=
 =?us-ascii?Q?Np1BESSLte0RorobCp7uPS4MgViU4ZI5KVyU9TZ034Mh0S0sAKm2M3sIbUBT?=
 =?us-ascii?Q?oE7XQTBNe8E1vI+6dsPsoE2aU0VV7qh58cEenzEqL3A2s+9PtlUrQUbfE9qz?=
 =?us-ascii?Q?h/qObEirDi2NknNVuNXOBWFvI9/HdI+VM64nIMJW5+ju+Fau/EgZKzLwlJjN?=
 =?us-ascii?Q?YNosCgtYNH5phKUGu3O0QtbAE5FfKdX2jy73N1psBiB3NQQYxSMyfGcsBv4l?=
 =?us-ascii?Q?sqTzAdD0EEn24i37z8YtyuD5MZZPy99jal9lrGGB3DVVoyzaGd3lcfa2uYP5?=
 =?us-ascii?Q?k2dvJkpJCfan674mvpRzrbBV2royEvDUSVh3tbmngwdowpd6yFHHZ2ozKKqi?=
 =?us-ascii?Q?KJ2O5kRmfl6QssNMsLjAC29utGgwUboRUXUo1zDP45wN1cm/Z2qGUjV4S/YF?=
 =?us-ascii?Q?sU8yOV6tNnX/iCmwOK8wgywFvRqIn++MIzA6hUbM2dpwhNAJaC5R/48Dxhpc?=
 =?us-ascii?Q?U9pvosWESoyn0IIML1UmHvCgRL1pUxq844A17Vao55xSYqtYw6FkiMnDHUaK?=
 =?us-ascii?Q?PYhLjSGk5ykza52fheoQp8DMOnGa6LQsxmQZaHO/nQY/C2Vkc7S4db9MwBps?=
 =?us-ascii?Q?LT/urt9WsWcCREg+aDJiYSJtLB0OOwBFQ32cItoq7OxKb/nMpVaDGgmcvf0I?=
 =?us-ascii?Q?qxrb/3qR8jrRChqHBvYMcYURzTKHktu4X5QduaF7fDX2WUUxPJnYjSaFJ0Ra?=
 =?us-ascii?Q?S2MaJvfvgurelet1xefkWp2suiTMLSmWGD0U8rsn+prHGUWfzlnl2Ry7cXUY?=
 =?us-ascii?Q?+u8yg1v2urmrAPxmiByCfTnqOKyQWYAFYh6Anbz8KaDbPR5fwQBzCy5D5Zx+?=
 =?us-ascii?Q?GtyuIEjibHDt0rNTX1LaH2v/qqvPZ6+ylxckJbXzoLO5v+WAJF5aE7HgrbOO?=
 =?us-ascii?Q?PN6juoHzCab5OQW7XMZQdxfXIZVdviq0T9TCXrLE0YQ9492bpLbL7jZFnk8i?=
 =?us-ascii?Q?vv65ubZiE4HjFUcsDsy/RqdIhyIRt9RAZgp+0t1cK2HRNkxGAL6TtyWIi6Hn?=
 =?us-ascii?Q?uN9Unc65VVM/nwP5UxDd4mkanMBfAHICl8v4nTEe4XOAPDwWC4cn0AtOzIh4?=
 =?us-ascii?Q?TffmHEQDH3ibsBtQ+uireIWnZHga5DsbY6LAK/r3uQegVir0H/OPTxINPXc0?=
 =?us-ascii?Q?5X2Bh9OYKU0fYZfiCN/RL0U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6M6w/mcmQRUKUAKJJ6l2kMSA49sdd/BDhi4jmk3hB0ZrH1J+Rl+8w1xm6p2Q?=
 =?us-ascii?Q?y7AzkYZcEVmyZHMdJ2E8pRolisMwpEX8BXqJs8exIDvKCfHgtLnp9DdZjVj5?=
 =?us-ascii?Q?JG0Dczo2kVJfOYHXNBwBCKcBYHH7XBEf6cPs9QMBftmtJLs4BbAiRCZMZ6yW?=
 =?us-ascii?Q?Vk1X/IRFmwuINP4l8fpz1rWdiZGBevafli1nJafYjD1bKJFZAuRSc37SCfQ5?=
 =?us-ascii?Q?z/uL5YQWzzLbgasOPPYG0Pz4IvXhPD7GswglzKjLuszZzk2RrVdJ3d6Rm9dW?=
 =?us-ascii?Q?5LXlc2ijI7YeBwIOeekDwllKVISWYUHSdVvKJuwChsODzN/Pa8aU76iRuZxz?=
 =?us-ascii?Q?G1lHDkIORiqFDqK1ahvyOLfH7vj23EfkJNLIa2/0xp1Rd/QIjAUeX9g+JFaR?=
 =?us-ascii?Q?c5Jdykk9GUgx9nV1ShevizgQmhsdZ/S5kGXBCvT2feDWwaZB0jcXKWVRcGCj?=
 =?us-ascii?Q?+yTe+qNTmaJ0zW970jMpdiTlq97An6OBAOawSVQDiSb+nSbkgrb0QHzJMmbe?=
 =?us-ascii?Q?9CfLfxOmNszOV6TG/VGpfkDOTXywAZLOzJAY3TY8OF5ObdGRyqDm7Mbc7VDB?=
 =?us-ascii?Q?Iv6Hgz5Ijho0gmpsrvl1oJve5mtAOLjoXwyDNrZfWQjlcrcc/RFVNbErBDOG?=
 =?us-ascii?Q?fO3n0W+gacqz8/5SrYaLE4ZTqR3u0zHIEPiEETHEsv0IJ0GB+FWhNK9Ojz2k?=
 =?us-ascii?Q?8HPs1CiQgBDH/0fjHMPsq3+vU6HigLZG8C/YF5TPthiSUVNsUuLNnRgB28IB?=
 =?us-ascii?Q?fdZn5jToHLR4RFaSaB0KUjainqC4LqfkbpJoQju39aq07AAPPAGnnIbsrGiU?=
 =?us-ascii?Q?10TEL5X/LYg5oV6f0LxsoT6XXLwJj4vcEpWWE0VMA1cJ+GYMdmtwr6jH/Tiy?=
 =?us-ascii?Q?YiARztAy6y7R3OguZh/XwiSFlbRPATN+9eNy+UHWM+yCRtJllAD9Jytu5Qnh?=
 =?us-ascii?Q?tIWrn33AtTkwJ0XSgvvdjSWT3OYI6OXkWwyay+/yoqVV/pd8NIpCT4f4ya1m?=
 =?us-ascii?Q?JYze4Ofbx6hhy+Qi5riDYFntUfLzFL/2NJYKwch56+E81MJRUdy/aPf1XOAD?=
 =?us-ascii?Q?MnybvOgrUPn8mtoN8l4aVVGCNvt1+u+kbZ3SXSSxSjCMWiWO1RMgbr8FG7/6?=
 =?us-ascii?Q?YMWk4jA4b8M9Fz8vPo0oOhLMSMkbHOWG1Lez73jQ/Q2hn2gS04tsZjhM9ThL?=
 =?us-ascii?Q?GE59agDcCErEUPpPjHagbfTbVJla4S6ETdOtFVGXKj1ZuxZYQcvs2Js/pXEq?=
 =?us-ascii?Q?kihmoUwOhA/1GAHks6yrPISwR3LiW2TFRSN1g7eBCtj6DdQUolQVQlLR9TOh?=
 =?us-ascii?Q?wHm6ITFEiRVG4mRAP03jGnbpvl2mZZBJFv1Vwy6AxPQyDMKR0Clu+zHxbb4T?=
 =?us-ascii?Q?00RBhH7sNQRkuypL0PMVcJxOSnkb+6GpEXUs+fT3liK9PHYw7fKN4C845U91?=
 =?us-ascii?Q?uUOOsKcbtWLKUslSfHr+BzWFIhcsBGH8RxDvbLgyb7vi8Ud4DOq+mvd2zjVu?=
 =?us-ascii?Q?QcWJCuDSJtTPBxNakVOnjF2VXgphYNNtRTkHP+2ZKxEjCnkn9x3ymPDf040x?=
 =?us-ascii?Q?7CMKEcIoA8Kh/NE2QajdvX6D9oVL0TRASu+2073YBMnE9p2s9qQBWcFgJu7x?=
 =?us-ascii?Q?JjWfrtoAHNJs2EGeOfAyuLMcrRcJZ7jNXqnYnfVN/ckyZjo3CHjiMKv6W8ZT?=
 =?us-ascii?Q?/RZagBptepjN/4RabyVS2l/etbyJAXRpgGPn2gRZapCA+wpl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28249ff9-8539-4f65-27a4-08de5e9269af
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 17:26:46.6657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOtnwDrt68qIMQ3FAe7FTUXT2/i+OvDAU0stFzE1hP7TkgSzi2Sr6N3Rj105+PSJcNhLMkCtFw1cFYimGA0nsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10779
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_092651_894660_FACA6C71 
X-CRM114-Status: GOOD (  20.19  )
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

On Wed, Jan 28, 2026 at 11:55:29PM +0800, Wig Cheng wrote:
> Add device tree overlay to support the MayQueen PixPaper e-paper display
> on the NXP i.MX93 FRDM board. The display is connected via LPSPI3
> interface and uses GPIO pins for reset, busy and DC control.
>
> The overlay configures:
>     - LPSPI3 pinmux for SPI communication (MOSI, MISO, CLK, CE0)
>     - PixPaper display device with proper GPIO assignments
>     - SPI frequency set to 5MHz for stable operation
>
> Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.
>
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
> ---
Not sure why v3 is under v0's email thread, suppose it should be new email
thread.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  arch/arm64/boot/dts/freescale/Makefile        |  4 ++
>  .../freescale/imx93-11x11-frdm-pixpaper.dtso  | 51 +++++++++++++++++++
>  2 files changed, 55 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index ce8f937c2315..c2727f8061e2 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -398,6 +398,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
>
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
> +
> +imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm-pixpaper.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
> new file mode 100644
> index 000000000000..a78284c10838
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtso
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Overlay for Mayqueen (Open-EP Community) pixpaper display
> + * support on NXP FRDM i.MX 93 Development Board
> + *
> + * Copyright (C) 2026 Wig Cheng <onlywig@gmail.com>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "imx93-pinfunc.h"
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&iomuxc {
> +	pinctrl_lpspi3: lpspi3grp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO08__GPIO2_IO08		0x3fe /* SPI3 CE0 */
> +			MX93_PAD_GPIO_IO09__LPSPI3_SIN		0x3fe /* SPI3 MISO */
> +			MX93_PAD_GPIO_IO10__LPSPI3_SOUT		0x3fe /* SPI3 MOSI */
> +			MX93_PAD_GPIO_IO11__LPSPI3_SCK		0x3fe /* SPI3 CLK */
> +		>;
> +	};
> +
> +	pinctrl_epd_ctrl: epdctrlgrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO05__GPIO2_IO05		0x31e /* DC pin */
> +			MX93_PAD_GPIO_IO06__GPIO2_IO06		0x31e /* RESET pin */
> +			MX93_PAD_GPIO_IO26__GPIO2_IO26		0x31e /* BUSY pin */
> +		>;
> +	};
> +};
> +
> +&lpspi3 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpspi3>, <&pinctrl_epd_ctrl>;
> +	cs-gpios = <&gpio2 8 GPIO_ACTIVE_LOW>;
> +	fsl,spi-num-chipselects = <1>;
> +	status = "okay";
> +
> +	display@0 {
> +		compatible = "mayqueen,pixpaper";
> +		reg = <0>;
> +		spi-max-frequency = <5000000>;
> +		reset-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
> +		dc-gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>;
> +		busy-gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> --
> 2.43.0
>

