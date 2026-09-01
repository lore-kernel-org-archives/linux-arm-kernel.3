Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5863AC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 20:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kDcrvQqolwvwCNIFD5/rKOSNlE7cLfEPCUNt4xcoBA=; b=J4yThthSIK9dW0JPE9t6X1jroo
	+y9nE77CRq4RVi0HUYaTjlMbryyjp8BZxXHNYBE3gjcoHXIW1CrgAKOkm89war9oHrktGZ7K9nFVi
	QZmSsLgIDDmxAanJ9J1pOhjPWtXHutjJzLkI6zy6NXhNcN0nH4U0cr5009eN4HyHH+yJTGoUX7sFr
	WCd7uFXv/yVDIuMe0cRxosi6rLS9EuDu54U04CFyz7QFwYpjhoIDZTfLE6F034aIuP/NGqO08ado+
	e6+hdERHd6yCqHEjv8cIQqHpnu8yoHDE/74YSx1yfCM9yAPYp9LSAf8G5ywDz5uXQMj5vTSh9g4V3
	fPLiFzyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1VYr-0000000DMfO-1mHW;
	Tue, 01 Sep 2026 20:58:29 +0000
Received: from mail-westeuropeazon11010045.outbound.protection.outlook.com ([52.101.69.45] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1VYo-0000000DMef-1jWB;
	Tue, 01 Sep 2026 20:58:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8wfo0FJ+vQhFORZkPstV7Bus2EH2zxzITWT0HpNJFg32m0AxZ2O4DKt2gWccGEKGAvGxX+mN3CdIlXibkvq/q+tPYpG2WVDo4xVGK3y/8Gx8fJ4sGjw/cyz1yb6mWlerw4JhZTEmoofrEfCkbLM/6byg+Zvj6qTL8kfY/tmEyBCFeU+nfmYthtQx3IdJbUrmg6AW6q8v83KOCo0HUXEViZrfd4MJjAuc3KzPP8VloD69QGoi8TgWiYKDAQstT2Tr4OofvZlPRZ6/sI87p8MwQdYsNXOq68Z7pNSd4iQ8ZzXvCQMqq84Zx91DAyh28y/cAVH/yAZibFZcrKXUOyOGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kDcrvQqolwvwCNIFD5/rKOSNlE7cLfEPCUNt4xcoBA=;
 b=fQLwyclw9KhxEXHjF/9kBKO1dqLVl6c/+pOnam/llUETNIGr1wm3hgGXlx3tg80hoA6vsmlN0d541t5pGbA8xujPpAzQCpHSgkaqTSHMumkb+QTSqq8HV+DpdsLByGf4hkGsBa2Kds3jVWIy8oREk1PffnCY0AaY/E7zRziY4O6YPC3x73FIdJgZYUFhkFFvQxZ9Sqjz5Q2b+SpcIeya2vAFgTWYdAiE9qy0of8f8P7Xj/c1uYbQcUt9q7/HTZ3Ieqr4SKmI+ON0w9fcwahhLAMGfcR8B99zkdhV9r7DJGkF63xt4S5B22ARpnc4KdAvqLsU2zXGo5xqVjP4Xck+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kDcrvQqolwvwCNIFD5/rKOSNlE7cLfEPCUNt4xcoBA=;
 b=gmXuHzikv9KNPLuKxnnQkjY+4r9TBR3kuQpC3bOCGk1gc6i1OnOdZzg9SpxgH61HweSVtTbYFxurVOdS+0J9lcf1KRD7qvwFzSJVY87HIMfIm5eviT13R5BacA4vc276etllws3sGFqjrTol6AoQmk1+gVevgPWH0lY1LnRgH+mgxRpa9zxZ8vDO3/1k3gUWwn8D5bci/GpnptQ7db7ua5YP6J0rbv70kAItqiHX50/7Be2hz6tdZEQkyq+vpU/3VX/EJUj9zIU6fItzcFA957PihcDD11glzbod9R3p5SURH8PPdh/rc8NuORHGJLfWeKrDJilg6OnQsST+ICMGFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB11494.eurprd04.prod.outlook.com (2603:10a6:501:74::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 20:58:18 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 20:58:18 +0000
Date: Tue, 1 Sep 2026 16:58:10 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] i3c: mipi-i3c-hci: Add a quirk to clear the TX start
 threshold
Message-ID: <apc8YiMT_8aBukeE@lizhi-Precision-Tower-5810>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
 <20260901-b4-i3c-hci-ast2700-v1-4-19909e7cbd7e@aspeedtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-b4-i3c-hci-ast2700-v1-4-19909e7cbd7e@aspeedtech.com>
X-ClientProxiedBy: CY5PR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:930:1e::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB11494:EE_
X-MS-Office365-Filtering-Correlation-Id: bc504428-7357-45f2-53ee-08df086bbfc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|6133799003|56012099006|10067099003|4143699003|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: C7Tx/Kngz1gU19ZRzmZmiN9if5er5RwKb115IFh6oqHcxq0z5L1X+EzBEkJMUCkUeqOYNxNvTnt9tKIsVX2EWCEGXwV8bAj8QKNWGAxf1VXSpFD9q2LqWFsT1YJ/b4PulX73huz88//GPGhARVaBQJ9wZyVtrx+z3pCqTDpD7dqYrDk8ojgVB7azvnzZ5Oe8L1xrvsppUCWbvVYYydxRJU3+Cmp0XhujdzLO/aLRywR0A4cA79romzgs4o56bDGZR5fCB5kkuJwYM5yj8rbk4cLx2kULHUIA5hhU6Z67sABgDYdjOpU/4gkyPbENNLiku5nlUoeno73Qxiy8eS1yPnI5HeSwKkyxtiEfmdYZZVTdpi6O9XQBsxaRyxYRy6+04fIXvfxaeGgQkwDenjbXI7woVkP2kvbxqyez37Ppa6uNYV+b1hyhqAdV8r7YyMm7QxPlxFhYWdJ5GFMHqFQsu/CLkhWZrDBqWtub3zNWSAadMG2rC1LqMvgK4fLWcz/aIrjjRYwmsTyQQ2ThTH97SRi+5xUnt5xc7mfxSDkxpgtuucVfZEfWdmNm1pl1HE0SlwV0Y1cB8MpmfkSrNpKEOwNg1Bw7yYLKxtE0+2ycvWndBNxv8pi4SVGD+WqokB2hxv7MFEHzW9nWVIy+zwyCmJCTPxkmbEJ4cTS5wFALymM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(6133799003)(56012099006)(10067099003)(4143699003)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C+HLbaxeyBb0JWUGGoDGedA1G4ooLK5hRFuu/nzzl/PfWxCLp7Y3qS1GJ/KM?=
 =?us-ascii?Q?x8jxoWaijmnoMAnjV7xhBeRKGxSbugH3qLlzpLaEg0+S7FmTQVh1N57x85V1?=
 =?us-ascii?Q?MYfsI+KZ8ax4IuUvQ4+IHu1pgmjyOT0Gf0oWI3uYbqjaSFkS/wx5iX/yc7Ys?=
 =?us-ascii?Q?BEN9Hsbr6kii6dY7grjUloKNfppi02xxZsIKN2DjAUcsMptwDFBAp9MNVuLH?=
 =?us-ascii?Q?4thTWPvALOXn+6S/1I8RJGRhMqnMWxKR+jC/v4dfrrOBrNV4TpDApmJx5VtX?=
 =?us-ascii?Q?ItJbqqNOi+cSS/DnuxOojWomyqso0SWP3lfkjcxZA0gnlUM9xf7pPQYJh1TN?=
 =?us-ascii?Q?czauXY3iPmMoFS3Va6Z4RI3zkdvE7UI2F4pQShlOKnPvzD9ZzH/9wCwdZS4s?=
 =?us-ascii?Q?omm6y78t8isP7sgKTarupQlcneqPZTdNf9eWyB/Vvy5lHkHS8hi0/wpjr4Ek?=
 =?us-ascii?Q?GTFqzrRsKMqktBOGokrtlMWV1Wmd0qiReIq25FrJq/TW3ouzQ7kEo9Tr4uvJ?=
 =?us-ascii?Q?e4FFl1qk9A37YqBmRAwXxHjRMxB6PHdLhI/GgFsEGk0QEZwH0R/wacJHKpsT?=
 =?us-ascii?Q?62dlLeCP6tEmHcJhZDdVJO1mkC9EKW9yqsVU/CHgmHD7hQk67flx3BwMdN1R?=
 =?us-ascii?Q?QcLKRD7b2oaAol7xArbAxyCzmcu404/XFZIAiFRWdfE5UyW55kocoV5IouCI?=
 =?us-ascii?Q?/Txzy4qmN/yEas0dCeFOgnPfpgVloMm2XnyLebuymN/7Osq9SW+pAn8z/bli?=
 =?us-ascii?Q?cuapNzQJoIbAdX7r9wwBlm39Cbqg20RbghSghd48ggVXdwkxurGUH38Z5t/D?=
 =?us-ascii?Q?vJxAjDCM8cw5JUvcTUb5QG87wJuroQFbX8Iz/yrnxdMVXYa0NRoIJRbuslqw?=
 =?us-ascii?Q?E3kmCAZTxNPu6s9SXeoGy2vUUQ3LpzcneiNSLVqdKjlvEPY+dQGKkLTTnbEN?=
 =?us-ascii?Q?Y8HZg3ardFoRMA4Ug79CHjNOdlHqaYDXUBKAwDZ9jwbft8OcTsylgzMUl3Pj?=
 =?us-ascii?Q?f4tjAJaye/yvuSpYHwIy8j1YLhWZdCek9Y83KfY7MdH3n5qQwl9GA480BG6U?=
 =?us-ascii?Q?mU2hKBpAn/jZQSuNSEAJ44lBZIRGfA1BsXRtl2zLhR0Nl5/P3RLz7dcQu0go?=
 =?us-ascii?Q?pXn9yfvFR+GVLyJ11actYVQjjq1kiUo+ku47g5EpZS99iwSsfAf4vd8iJkox?=
 =?us-ascii?Q?ZtB55Orx1jfNadr5sflK1QK6BenNiJBxpfPmril3Mg9WJtUQclUT/dep72ix?=
 =?us-ascii?Q?gKnk25xaRnrFYkGWd2eRLyti2mcUxUz9Yl+QUiJwMB/LbSQTlQGBiNVDUHcy?=
 =?us-ascii?Q?pVTxP/S2In+MBbmJtq/hmDTS2ptSdjGaCXc15pgo08qlUCB51r0ECpaGWhoi?=
 =?us-ascii?Q?i4xbgb/g90ht6kqYHlBkVySX4wLk+NwDKRUtovCLME0PFS+UbM3d6NAfNUwP?=
 =?us-ascii?Q?Y55lI2FpM9XVh3o6SpkkQDY90es/gueLyNfsTHmnjmn3VO3P7olMVdffmSPo?=
 =?us-ascii?Q?9tnmZvfRjKojA7UAVttL3+rIaSZ8E8avF4uvJO9ZsUDVZvZfkg5i4kqrWlA5?=
 =?us-ascii?Q?ZJAnisC6emku8XDF3ES3gXBArALnGLipkCF6fQPVFJjWxgyLiCmaYrJ6SWd/?=
 =?us-ascii?Q?VRhLEv3GxdHyz4TP+wdQOPUrZwW12EY5+zHfbSE+Hw4viUDTrZF72uU6zq7L?=
 =?us-ascii?Q?atU56yz9qY5wpFxvlmS80904fnDnnH5qP4rp1RH3os9WV5vvNqOxCi/zvAnl?=
 =?us-ascii?Q?1cA9E0w/m8zfPRVVEjDKfPTWoAhZm7oRr4sqSkTABc5O84ywHX7C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc504428-7357-45f2-53ee-08df086bbfc0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 20:58:18.3253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4wnIiVWcg1S0pZ1fBwymd+GG++5LdaD8UW//1KKR7zG9i0BZuw+3PJsEsP8PaFCp92K3HqjwzDhR/DUy5jJPnMQyLZMWyA9D+NaTbNa2J1OnGTkU6DN5pFaYOGZ6UBe0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11494
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_135826_455632_96140383 
X-CRM114-Status: GOOD (  26.43  )
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

On Tue, Sep 01, 2026 at 07:35:31PM +0800, Billy Tsai wrote:
> The DATA_TX_START_THLD field of the PIO data buffer threshold register
> holds off the start of a TX transfer until the FIFO holds a set amount
> of data, which in PIO mode cuts down on the number of software writes.
> The field resets to 0x1, requiring at least (2 ^ 2) DWORDs (16 bytes)
> in the FIFO before transmission starts.
>
> HCI controllers that support both PIO and DMA can expose the two as
> separate register blocks; nothing in the specification says selecting
> DMA mode disables the PIO block's own gating logic. On ASPEED
> platforms it doesn't: DATA_TX_START_THLD still holds up transfer
> start regardless of which mode feeds the FIFO, and in DMA mode that
> threshold is never satisfied for some transfer sizes:
>
>  - 1-4 bytes: uses the Immediate Data Transfer Command.
>  - 13+ bytes: since the hardware fetches data in 4-byte chunks, a
>    13-byte transfer fetches 16 bytes into the FIFO and reaches the
>    threshold.
>  - 5-12 bytes: the threshold is never reached and the transfer stalls.
>
> Add HCI_QUIRK_TX_START_THLD to clear the field whenever DMA mode is
> selected. The clear lives in i3c_hci_set_io_mode() rather than in
> probe so the reset-and-restore recovery path also reapplies it after
> a controller soft reset. Move the PIO Access Area register and
> bitfield definitions from pio.c to a new pio.h so this quirk can reuse
> PIO_DATA_BUFFER_THLD_CTRL and DATA_TX_START_THLD instead of
> redefining them.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Assisted-by: Claude:claude-fable-5
> ---
>  drivers/i3c/master/mipi-i3c-hci/core.c |  14 +++++
>  drivers/i3c/master/mipi-i3c-hci/hci.h  |   1 +
>  drivers/i3c/master/mipi-i3c-hci/pio.c  |  97 +----------------------------
>  drivers/i3c/master/mipi-i3c-hci/pio.h  | 109 +++++++++++++++++++++++++++++++++
>  4 files changed, 125 insertions(+), 96 deletions(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index c03c3a9cbe4f..2290a889701c 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -26,6 +26,7 @@
>  #include "cmd.h"
>  #include "dat.h"
>  #include "ibi.h"
> +#include "pio.h"
>
>  /*
>   * Host Controller Capabilities and Operation Registers
> @@ -823,6 +824,19 @@ static int i3c_hci_set_io_mode(struct i3c_hci *hci, bool dma)
>  	else
>  		reg_set(HC_CONTROL, HC_CONTROL_PIO_MODE);
>
> +	/*
> +	 * On the ASPEED AST2700 the TX start threshold gates transfer start
> +	 * even in DMA mode. Clear it so DMA transfers are not held back
> +	 * waiting for a PIO FIFO level that will never be reached.
> +	 */
> +	if (dma && (hci->quirks & HCI_QUIRK_TX_START_THLD) && hci->PIO_regs) {
> +		void __iomem *thld_reg = hci->PIO_regs + PIO_DATA_BUFFER_THLD_CTRL;
> +		u32 thld_val = readl(thld_reg);
> +
> +		thld_val &= ~DATA_TX_START_THLD;
> +		writel(thld_val, thld_reg);

don't move these defination, original isolate is quite good. Add API or
callback to implement clean DATA_TX_START_THLD.

Frank

