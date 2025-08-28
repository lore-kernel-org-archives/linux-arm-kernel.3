Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5886FCA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 23:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxtxNXLoFd9ZPSJhLfKXSXsYB3xSsobvMfwsD4z+oV8=; b=4xo7L5bJeEgEOibyEyBuPzf9Q2
	rvvx6vdDJ2rCNmhc3qVUszEAcPWEpMJntHQEVInPMzji8jRZZBZHx5zZucWAGEA65DYVzoTpELRlN
	EwmdrQUFnNoL11PN7SY7aqvRj8IjLL868Rg8sSa/2IdI5hZi+P3kwKOx2lArvn152d2VxytI9IRTx
	Vn4RzqaV8ozz4IVoxfg8ghaHYfxqjpQC/TZnkOijh0usnMZdm0czCahcJ0+8cq2HWmTGEZRHZrwET
	GZeUmEB77dGIxbIqLz9dZ52VNrIDvB7KJLf7wMcN/4YYGhkIq0oHhALV8dTJ02IV75xrqF2r/VQDS
	w8mx8g1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urlzh-00000003dfu-2AX8;
	Thu, 28 Aug 2025 23:25:25 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhBS-00000002jz9-3CTg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 18:17:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdLQ2K5rE33p8B0hIWcbeHJZUiz1QhzKJue3Ity+cMRZfDO6grV3pK2M+r+49HVXELMXZyOz7RtZSyJNTxfGGGbWcRCQnAf3B4borJnjz4QsvUHUsvcGH4CyhwlyrQe8WQQPJeJPY9kO1isv3W3rXHPjKbsF5ANvZShMtGBhTntekGWlsBs7PGwO//suNNMbaVXfQfeyZHIW/DcDxgtNWzuNtYnJx7ip9Tn1tp0tji5EhRnEXyEchS+3soStapY8RbUusFcEq7dDj+7rS3FqtTLAGnOTZbnM2iwh11R3Lpq1hl5UUeNd3YLwXTqZOCw5tLP85dbWLEK0CWfBzhi3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxtxNXLoFd9ZPSJhLfKXSXsYB3xSsobvMfwsD4z+oV8=;
 b=i390lTqusOnyNwUHY/ckcWInI0RLObqO4oJySEkT3px8CZKV+yGrZWVPZqxjso2OXFf+fICJJu8Sy/Vw7t1NTGRnXfCsFWU6nux9sEO6A5k7JhMM5k/BAOTuQgorQ5kKkriFH6TgdA6RMH2ROw94z3phsjKy0bElCTceiri/eMaAMHAxPr+wsnDyoR4Z6+E1rWbgTIUkas5+ADmApBO4E7rK7heRwZ+4bxKsU9imbHf/2xN4V4Vs8LpUo/DccPHOliQBNIXc89VHpqlruKP6Q8nZMuVkPp4mK6VPXx3SHC+wRG2mg8FMizMSSEIBD9aDIq4yfw3v5DlX95B6Vu++Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxtxNXLoFd9ZPSJhLfKXSXsYB3xSsobvMfwsD4z+oV8=;
 b=E4+6nm/qObXjpSlAqgDfYZ1pyOmpMXXcW1YM4dn4lCVU86aKWiiU8rdpaMP712qZbSi2oJJnoyP+vukafW08O3Yj5YMuFzaTx6Y8OblMLQX5Ve7XQN+/zSu+hL8/sGk1gK6NPG/b6IjHBND5yYlq3KTaAqrhW4urU6lO7ccORFyI+aYZck6VktF6nsm09xiqD1xHjy5XwlZB3i9v5Gy7NIVA2/gndBhiY+OhYtxyFMuj1s3ssuoXPd3epqyzwGndo7nIRftiXWUJuNAu24GbLLR3cZ3hR91kQT3oEtOhsbPmySAc4s1UyN6b98ArMXYw5azxviqSVFtxbHhEbHzPeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA2PR04MB10131.eurprd04.prod.outlook.com (2603:10a6:102:403::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 18:17:10 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Thu, 28 Aug 2025
 18:17:10 +0000
Date: Thu, 28 Aug 2025 14:17:02 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add TQMa91xxLA SOM
Message-ID: <aLCdHv0KcaJsdv6q@lizhi-Precision-Tower-5810>
References: <20250828094745.3733533-1-alexander.stein@ew.tq-group.com>
 <20250828094745.3733533-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828094745.3733533-2-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: SJ0PR05CA0208.namprd05.prod.outlook.com
 (2603:10b6:a03:330::33) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA2PR04MB10131:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b09c2e-d6ed-4cc3-9823-08dde65f1aa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ikV9kaoVTkxpmOYLuB4jVb/kmuKoeUpUrmgm/JIXs5wMiW8UNgCz5TD0Vjam?=
 =?us-ascii?Q?GBk9IfzfbwRhHauCCY+aDHISBpHitJFGDr+58gMSzqTjGUKkuvlB6BD5ahv/?=
 =?us-ascii?Q?91VfMggNF9cqUtgXSdYCV/l5F+MRAKg978iBZx6Wh261NGfKhnin08xyoN1z?=
 =?us-ascii?Q?vHxv5vMMTI7wc7GP0YEbSnVKY72d2HOYEbaBbtfJCEZIuspSz65knk4+n3X0?=
 =?us-ascii?Q?B3Az3Lvy0Jizp7sI8y8TU10n08Z2+ZA41C31f3nCfE8sgWMM06VTI7QjzQQp?=
 =?us-ascii?Q?KtEle2DWWLrFJ+Oj81Bg7kdW0KmCj8gpbaO1DVC2yEAFjcHgzSdLHrssitqJ?=
 =?us-ascii?Q?c7WHVVJUQzV9vwq45vDWPKLBXK/cmS2tWWpb/aqH/GOIGRhwcmHb8+BL9M9x?=
 =?us-ascii?Q?HMGfbRCpLGxTyrVEVw/LuYMo3VXs+s2tUitJ/BKQMF3ojWzU/A1AP1/Mlen9?=
 =?us-ascii?Q?kiiLPidd5KKvLFdn3Z7cg4G7FSyO9O8dvF0Fjfmx//qWIixRr429ncP7Q7s6?=
 =?us-ascii?Q?uM+zou1ap6TEJO6XluyDJZzwB+T9/4HmtSemSWS/JFRrccG8Eoirj7lat4pi?=
 =?us-ascii?Q?InReq/vYMrRcNArhYV87iDpuyFOyMgywbRKOpPMYnoBj+qbcNTpNfT4kHFls?=
 =?us-ascii?Q?98tqrKAkZWX1iR4Hui1/YX/jM/w2fnKyynBgENQi4w6D7pHUbMAPbBTf+Mpe?=
 =?us-ascii?Q?E+HM5klKPcOwH00FijomeEf8mWR1B5LKwc1P5L6KBPyln+yd9Sw42Oav9/SB?=
 =?us-ascii?Q?42iiUU5C1Kb3JtquMtITPLkn/jm56a7HERSaT4FY7WDFGwyo+40/gjMT5syk?=
 =?us-ascii?Q?J6lUDEUO1y6w+Smeafzs31pAd0xkYpYd/6OBVx5xEhfORh0QuFshctRFNnGC?=
 =?us-ascii?Q?1DZgaEXAOC1VwuTClc6k86wVpoNVM1qAth455+ZrXaTEx3qrF+IPOlVM0Ddk?=
 =?us-ascii?Q?+pmZs4hzrCcC/DYyfrpgEk4O0kYacMq76Q97qAamnk8Tg6xjyu1iQ8Vfj5o0?=
 =?us-ascii?Q?fvTJlKLfkF4jlJPYf8bOKGf+hzcej9/nGwLdKR75EiyMAl+AFsYK10/kTpmn?=
 =?us-ascii?Q?cEo5xWsqkqBqcos/tQ9BMH4e73mEgtvLr0GzpfInudjJi3nJRLBl8seORbUk?=
 =?us-ascii?Q?+wt+t6juHPF3hz7KRwfC/kP08t+f8k/PZkua1Dv7pHXV8obbr0g9YSEXOZ7D?=
 =?us-ascii?Q?bN5E7/41UbI+t3BHH/9fzozmycqxe3PCK6edVYqu9iDISA2CdRpV+4dkT2Hh?=
 =?us-ascii?Q?E6K/3Ib7SH5gktcjYf7ugzVzx+zATWtrj0PEJPraIhM5oqGjTiUk83ZWZ/uB?=
 =?us-ascii?Q?mqv4s3Rab/h4tQax4zw50rwRmjZZ7Uf0olof6sDsK9JxcXIveUA10Sm7XKad?=
 =?us-ascii?Q?bEy+2Psm7J5eEwUYm4ekQcNXdyK6YrFn8pt7z2uU56d3NtBVPgfPj/ZmCzPg?=
 =?us-ascii?Q?mC9MtyTiGD99CV1JSLU7OP2oIZb8HsvRsQlllnZ5WdRgs7Npg5dCJQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IDzJFGsmT6e7KkEenCxLreT6RI8jgEeApLvHAgDmXMYjxLU0yOEVjKHWe+KS?=
 =?us-ascii?Q?tc8OJCgJX70np6ufzIeE15AMnxKnJngtU9Wyq9YdXrRHNoVcv1cnHCxi1H3r?=
 =?us-ascii?Q?fGXR6fo0urxUSteMBsGPnkrComeYb11dl+qX+Miy0fNcimVTxpxfaDJRRlA1?=
 =?us-ascii?Q?VXBtgTpnHT0VSZ2mdYbxWa9MVSP88PYpTMpBrqQuhpz5KYoT3HBWHvokJ4v9?=
 =?us-ascii?Q?fG9tj2IP3s4qKFSkKfvx2t4Qfjr3OTFcw+N3+VhLdspf9/3GHFFokV9KM5l/?=
 =?us-ascii?Q?Mv8OvEazMz+X0+Kx1TkkhlJhUrD60+b/9/yCIH8CyDyx3eJ39mESZJ7Q9gaK?=
 =?us-ascii?Q?qbion9XaF2s0N39CvMKyn+qvBA4ywEL1kJdOOBfLVcZyloRrlL4qIIiflrZL?=
 =?us-ascii?Q?b0k4f4c4NE8Xa9ASqkDG7h4MGTvFwu3pGnWipgWVdrOUz5YKhxycX286MarT?=
 =?us-ascii?Q?mqbs0E7GU+WHckzmU6v9o30OtF1Z0jS+ygr4w5K2hgaZEbz5kpRLaxbfs6/H?=
 =?us-ascii?Q?R6O/1gY5X2vGN5UiQm+QYBUJnWqu+JQJr2o6DxIKl8eDE0hCwQHikvpRV69n?=
 =?us-ascii?Q?B6ya0QPLSY6SGkdqRsE2V3cGiqvSIlsRbEN1udeTmEtEdp9yc2jkbCS/t5vy?=
 =?us-ascii?Q?AxIMtgQvFdmaNeIad2ZXwKh6XbKj8xRvZk7oVyNyqZxwxzFRkX70Fe1cDG7t?=
 =?us-ascii?Q?02c+w0/vPGMa2AKP8aRYI9FtArUPiYf6KmDvrBYfOZf7bR4VlzhKGfe1Vqpu?=
 =?us-ascii?Q?0cdb2cqyma0dqdBxRSoQOdKvSm86+hc/iR/XjKao8LpbHao3eiMFMIPu9FFA?=
 =?us-ascii?Q?4wAgCiQZYkPlBauax5h33+xWRT0lFxr8Kp3i0CQ5J6B9NN9Cpcq1fKcVb7KE?=
 =?us-ascii?Q?fAZnHQ/MoPz9aiINrTRgNfgs3rhnMNW0fEvEM90ecuSRK9MknUh1C5GB//8I?=
 =?us-ascii?Q?IBU1cfYGnGtAihQBvoyXqXyB9kya+X5i1IhetQw5yoJW9DA81bNo5Poo1/3u?=
 =?us-ascii?Q?1LPa7A9rOLsS2U2nCWVSgVI+rdGSq0eacZkkZ9FsxM9DZrFuT16eTBJ08y90?=
 =?us-ascii?Q?gYhSopIAL9E/w18OtcEGYY3gHKp6ShC2KbMBRFULr2Ryx9I8LaRbLmz64nyo?=
 =?us-ascii?Q?riW6XFFemue+Ic2RUDl4dGEvF13xWfnSpDjvtahzHqNGeIhkxXIoRIsrCjUf?=
 =?us-ascii?Q?+kw3O1VWpi7iZ20d2d3HKM6QoTWlEzqeMDIGZlX9wD0nlhm3w+03hXUk1jDi?=
 =?us-ascii?Q?OrWOTJPIEJUhKqeOXFeqCYm/LIZhgH4Jmpfc2IGEa/2WlYyrS3l2MRzUJJfq?=
 =?us-ascii?Q?qqWaE/ECEMG0KAZjhUhkEaDmUV0i/maOO0BAyI7R7OZ1AhJv4aKjutWcKqBr?=
 =?us-ascii?Q?aqnN1fdGInYZhnCv/YbhKMzzFXVkGaJIt/DBMUpSq3/cCTx827xax9KM7ArD?=
 =?us-ascii?Q?mxqHzNddC7JdtjvGHrTw896YYZmQc9cc80g1JUwCcbRb+cb2OtesKFMkdNF9?=
 =?us-ascii?Q?mhsR1pZjuIBE7HGPdyQt0NwF/GcOg4Hcfrdoj6CCUbO8slUXCrD8EjpOb1km?=
 =?us-ascii?Q?xVStw6ooqcZcwns4MaRZ28Yj1W0OFfNlTgSJW6gO?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b09c2e-d6ed-4cc3-9823-08dde65f1aa4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 18:17:10.1513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aF970FlrzyGQODwR/7qGOtCBrx5EMJ/cHcotgfrBmm7KzzZn8lKrZaqgupXCoBmFn4F/LL04Rd+nLN5+4ZlU5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_111714_825449_7F7705AF 
X-CRM114-Status: GOOD (  21.11  )
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

On Thu, Aug 28, 2025 at 11:47:42AM +0200, Alexander Stein wrote:
> TQMa91xxLA is a SOM variant in the TQ-Systems GmbH TQMa91xx series using
> NXP i.MX91 CPU on an LGA type board.
> MBa91xxCA is a starterkit base board for TQMa91xxLA on an adapter board.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index ebafa6ecbcb64..0843c5e9275be 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1433,6 +1433,24 @@ properties:
>                - fsl,imxrt1170-evk         # i.MXRT1170 EVK Board
>            - const: fsl,imxrt1170
>
> +      - description:
> +          TQMa91xxLA and TQMa91xxCA are two series of feature compatible SOM
> +          using NXP i.MX91 SOC in 11x11 mm package.
> +          TQMa91xxLA is designed to be soldered on different carrier boards.
> +          TQMa91xxCA is a compatible variant using board to board connectors.
> +          All SOM and CPU variants use the same device tree hence only one
> +          compatible is needed. Bootloader disables all features not present
> +          in the assembled SOC.
> +          MBa91xxCA mainboard can be used as starterkit for the SOM
> +          soldered on an adapter board or for the connector variant
> +          MBa91xxLA mainboard is a single board computer using the solderable
> +          SOM variant
> +        items:
> +          - enum:
> +              - tq,imx91-tqma9131-mba91xxca # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM on MBa91xxCA
> +          - const: tq,imx91-tqma9131        # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM
> +          - const: fsl,imx91
> +
>        - description:
>            TQMa93xxLA and TQMa93xxCA are two series of feature compatible SOM
>            using NXP i.MX93 SOC in 11x11 mm package.
> --
> 2.43.0
>

