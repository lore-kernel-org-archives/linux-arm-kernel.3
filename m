Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF30DCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 03:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQ3SXTgb4Xv/Ee6cKKO/UYy3kwvAVVJ9guhtdjn3rK4=; b=uspZejgk9ZyUsw81+kGhNUt1DR
	HBw/63Hi6hPzWs8M27HH88PTbIsacuBVjDvhmLiDfo1jF/600FLEYu6xPuenKwp7wQurT2ACaCKC/
	B3nUnSkRjwhw/ZsrQKk80vibQjfJQYSNNvImF3DAvQygq1OmGLAQdW7Q5HYgh/PHP9cNqV6Hlgdd+
	VVoBJPqg6/42R92sJvWzWYPngxYayr1pDu6flo/Eh8er57Aj7j8tVKjrTSKE1K+kxR1Y/n5EC0OMb
	iFkxb8/xbcngNLulM+lFNRThwMV7vUymZPUlwXfWg8kOQiTUUwy2w2JaS5XIZgFVlM7I2h7ZWyUw0
	dnJiAgwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxzbH-00000002e9G-24zK;
	Mon, 15 Sep 2025 03:09:55 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxzbE-00000002e8l-2Rx2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 03:09:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ijq7qCzJsIJw4sEwxKVLBi4m7n1y6QfpTsNb0S7CIrTTFKtkogV6cep2WL872jEe+kKUDCdjws+Hea3R/MLXHHeWCtXgj5A9qXWj+Rg6MJFm950CLSeUoTO7mVt0TlPIK2zRsqQloYoTJpzPS1UKI8ReAtjHmeF9oT72QZaJWLV/VFmX9muRKYQYAY2wmcHeH0HTWHyC5aFs9V+CBztMeQeHxOpmdma1kt80Vp7v49FiRvxbT7aXLXc6RETg2VzyT8jyQHTMGvuVOZua5E986q7ATDvlS2hXnv51H94r5gEu0uRSYNhtgv3ICZOlKfhQNQnmaPhKMKNWZwajqGLgFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQ3SXTgb4Xv/Ee6cKKO/UYy3kwvAVVJ9guhtdjn3rK4=;
 b=wcIOo6bemuVoVoKPIkQojkIFvd/ztkjBx1MYCe0mVJB/i32WLacvClfhwKW7Ig0f1budiUUUpzceIGao6acKmo6GiLWWZ9CqLcN+OnPnD8q2j2RlBwUIozt0V4oXiJGd9vCNt4agZ+gNOc1KY0wrObW5xbnb1lKdjKAQVQzrQ5f0ydKOoUwiJ1MDS0deBedXGmZ9QJ86GUx12mKFvcqdb+McsGAoUi1gh+xMqdsdeif2rXGdUgGqXlO5L9VpkKM+TsfaXkWSs2saI04LOpWihWhf0S7Zlzqd/D6nh+tZPYxNRw4B6JYzBHZI8HeUv127Gm/7TEpEtZgOTd46c5xWxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQ3SXTgb4Xv/Ee6cKKO/UYy3kwvAVVJ9guhtdjn3rK4=;
 b=dmwm0lYkc66Gj5wG8OBUv8sD4lsRZk4hy8QCjiJ1R4PGQ/ItPOdDEiJEVGBpALX2b+hSdo/l38RLHpFWSINwf1vn+Z1PjyUhaZlDIfgwRdwogfHTALmSZXCUVrWBn1YXiCeb6emzLQelLVF4/AAAfhOsh/8DOBRf8oR+v+FQU27Gzsc2wpV1UUhrpgTXUuXxrRAQWyz6MJ18JLYkC1xjiXK0ajd2VaPLPz2KDkiHuHONIyUnEEIPD2rDscqWYkpEVvreVD4E98fSOIeqvZSmuhnq148iwj0SMoiT7jzX9DosnltpaRzCKcUAGl6rsB9qriiOkLgQP/Hs+4jiXwp6MQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB9PR04MB8494.eurprd04.prod.outlook.com (2603:10a6:10:2c6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.11; Mon, 15 Sep
 2025 03:09:43 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9137.010; Mon, 15 Sep 2025
 03:09:43 +0000
Date: Mon, 15 Sep 2025 12:21:12 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Alexandru Chimac <alex@chimac.ro>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandru Chimac <alexchimac@protonmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] clk: samsung: clk-pll: Add support for pll_1061x
Message-ID: <20250915042112.GB1331@nxa18884-linux.ap.freescale.net>
References: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
 <20250915-exynos9610-clocks-v1-2-3f615022b178@chimac.ro>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915-exynos9610-clocks-v1-2-3f615022b178@chimac.ro>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2P153CA0006.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::22) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DB9PR04MB8494:EE_
X-MS-Office365-Filtering-Correlation-Id: a2dfc592-846f-4c9c-d719-08ddf405505b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|52116014|7416014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ltz1vYWCaWqQDAFvAA9GsJ+JBGjNa3ncB3F2yS0iM52/WGVHFaLySsDcjRDv?=
 =?us-ascii?Q?LhWwAZEN2SCej/GdwtTofkXH2AmhgPcP/eCghC59PY5R5p0PS8Y0aJverd4N?=
 =?us-ascii?Q?dLG4udamgXp+mzwsd8u0S2atNjEYvWiWngQqhKzqh+Da/9EZJRnHXHJLBE9N?=
 =?us-ascii?Q?BAPNh/5k2AqKCVITiZyU+I6bA9nMtj4H158FQlEFSR1ObGZ+7laaHjS4k1x8?=
 =?us-ascii?Q?zLaWddghRSJIFe9sVyOlWytnuHjx32QaBvYdqZLpGA3lwS7vg/hPFdh19VGE?=
 =?us-ascii?Q?2RzkAQHjFDYgQE6qaq3umdS6e0I77GoeNu6bT2Z7raFMxoJt4yxXVMOdQFwj?=
 =?us-ascii?Q?Oto8ZSHHLJ6w3GwYWEEKdOQZp0raQ4jxdQr96eewmqMh9VimyVlelD3KsUBI?=
 =?us-ascii?Q?yQMJw0UTRDEwe/c789Aqwrkw/3Ks9MXb3qfOx+klMWGJlJTth+43nZLupUmH?=
 =?us-ascii?Q?UBDaCyUPC+3mlhC85hO0RwboWXZ+WnaurtLLgVsYDzbLolRSE7dXrErEeKN4?=
 =?us-ascii?Q?EHG5Wo0DloOvpAB3jSQeT3/QTjMYbg8hyu2yWBUxiQ+BfdsVhjaXQoe7fXXw?=
 =?us-ascii?Q?/RPMQPLYewt/q5gmTJqS8X8YcaUEx8GmPUslgClF939K73Z96//CbcjFjRqx?=
 =?us-ascii?Q?SCFZ1hk7ysgOkrWAjLdE0L0PnR6yJ03N9GMGGZvWJ46zXQH36T1NeMeRhL5+?=
 =?us-ascii?Q?mbMz3iPTGckaOp5b4fLhL6L45I5SWmLQpclfL56Vl6pqyQwhkcvQzBXb/aW3?=
 =?us-ascii?Q?/Sw6Fd3j3GKiiYkb6Nx+RVNqyiWpTQzB8XstZWSpbMl+ZioT7TLBkz/M1guX?=
 =?us-ascii?Q?n8JNcMAorI8HCKpBOiXBal2F/uDP9sd7ZF+aEMed9J7ySkFzUK16z/h+Xaba?=
 =?us-ascii?Q?DAOmbK5EZE+mgNNMXEeFD7kF1+icuZy2Iu5Z3PcoGKv3x1ABXL05oIlmrtyR?=
 =?us-ascii?Q?Bucx/K9+eZQ2syOPJxtJYAjrcrY5KMREhi5yr40tpgQE/lqJUuhsx0Q2YCQz?=
 =?us-ascii?Q?jGBSEF+7NcfwOgCU9mvHFPTdGC1tYDISerSszo3eWxVk8Wn78YTCQ0eIb0uC?=
 =?us-ascii?Q?gwQ5kR6mnXr8S58sRd0rZmLdot0iFviSO7VjRHBSrSi6fJOTq0ch/zTsJd8o?=
 =?us-ascii?Q?kXt6E4l+tXAbWUxf1crL3WkHObUnLk4BLED6lw55JN4ZG6V0bVCgnTI1RAEF?=
 =?us-ascii?Q?R7fuC2ow711EME1K9nizWKGNoVImI4rHYqCwPcMUfzSAHY8+ihgo6m4zyzLV?=
 =?us-ascii?Q?vNYXJI5vk36kSuexoya0xySoO8UzkpIIH7ks2bwvT1AT+iAQouH5yPiGar2O?=
 =?us-ascii?Q?HA023jYZ9MsZ1NVDOMRSFP0zhCt+CkDveAgjo15YkhYEbTg7gAS/zztpEZVn?=
 =?us-ascii?Q?31Z12c2/RRniHLHJFbaB1m1LwxtRsq1UJaWBBt7xDnB11oK4+omJgjxC2r48?=
 =?us-ascii?Q?rGYgS9co775CH3o/SBKGqUKY0eKyrw6/loYHmmrqk3wsM7Vo+pn3/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(7416014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hzOFKFqeT6Hk4ZZZZQsCrPP49NAywMOYbswrDPIOwfF1xg5BnibhSrTiVIgX?=
 =?us-ascii?Q?tFsIXTeBGwzVpJ9Cf7IL5QkHj18LDjTGiPRZzmIq2KDlqPX7mn7P6/QXZv2s?=
 =?us-ascii?Q?egnucMC1DLLolnkXovCqz6nyYBn7ZZtKEztESwFNImEqDHQ1UnoU8FjpNe0k?=
 =?us-ascii?Q?P4ZDFBgI4YBfOSeQnvePH07v7hnDwo9NDm4liU2Ej+3hyNiz3qIJGZZMLtDY?=
 =?us-ascii?Q?CvxDJ2tJ8C8v5aOtEBFrXJWK1naPxAUTjxugIm0SftccRiiWGPt5BE+XFqbl?=
 =?us-ascii?Q?qz77IGE0nv5fNaXnlBN2ZqIxJk++CwAyqF6U42EZYVWB4C6V+t05xxUE6r+V?=
 =?us-ascii?Q?sSzDzlr7YWfurIzn1aA2RD9Q0bMmpzgSxGSdnrpjpRTSqRPCyh/wAD3EeHS9?=
 =?us-ascii?Q?s/ZfULqdpcSoxIiTEHTa2k/QWhwSQQPSNMYVAb5qL6knv0y8N5jMn1c0OH/P?=
 =?us-ascii?Q?YKqjgKOYigpurccEOJeR61EBXLDhaW8s/9DgV0+SwkY9j/SNlOK3nwOGUEeQ?=
 =?us-ascii?Q?4Tg+Ug0pnZM7O1//gR76BT5NAHu8xrrJ+Aa69eUmKbX+J3OD3UhE5VSGbty9?=
 =?us-ascii?Q?Pidq8BztAu1+N/PYSmnraqtWgCq5Wxm2uXwoZ0xpYVOxytIRnsTeugzGTRcv?=
 =?us-ascii?Q?nKrIBJqF+jsnGN3C++WuloL1IafFXJROCEUWIFYDYXckWyVpavca/FLCbP9X?=
 =?us-ascii?Q?1qlkYaOmeE2ci8Pwf/1XrYFMuX63haqyoJ+bv4oxb+dkpLrLYEqMu0FLjWZ1?=
 =?us-ascii?Q?Ju74kBLgM2PKtsN+qf5aLy57oFqUcbSRdH4zFSZ3Oi1HTcSdH0XZPx4GRRrh?=
 =?us-ascii?Q?BfcJLUP4ho+0l+f9wx+T/JNp8FSx/MGmtMvwO79yRzaOL1QIijZMJS9qlXCX?=
 =?us-ascii?Q?ASAbjnB/eiXYFMbPC3rBTn8cOGLKf4prpU8ON7Qnu5C4xIS4mrk/JdSzZ1ia?=
 =?us-ascii?Q?cgnIU1x0IWtbPM0e/I70ebwVwy9fZVOHJOQNCkFM9SiqmrXz6+iYdyc+qnvd?=
 =?us-ascii?Q?R5RTASfpGzklo6LB6pS/oLiJttnD0dTTUvdu/iuO/uFAWNeoR3KnzDz7p1eX?=
 =?us-ascii?Q?Tg3qZXRQFphxn14cQf9g6MvkWMfI7YTTSpUHMYzj7Uj3/BjCIe3wMPrqq+Dy?=
 =?us-ascii?Q?skLCzDsDbfgjMmAbucIxC8z3mz7bXY51Ba1WB5414SDDKuZqU/lwmvig1GDJ?=
 =?us-ascii?Q?NoJY3vdw+L4oT86/e1+HzcVVZRztCa7dpkIw3NRo1+o6jp1uIVYIqyhoO/VQ?=
 =?us-ascii?Q?Is4el5oexwWgmBcBFxnSUc39Qhzp9JyZkyG8y3gcZpBK2uPnDoBOceuBFOdh?=
 =?us-ascii?Q?1KoUiFkhhebXWbW+YyfkTkLbiFMMuGmn/1eP10cFTsZoukOu/+0LZHciO+KW?=
 =?us-ascii?Q?bL7akzfiVOr7V/j9qD2zB9agtqUPPq5CHM1XAK91uNZgWiy/HXUPbzsYuuh8?=
 =?us-ascii?Q?bRfW7fhMGl34sOncLcP8Uv/dLxeU8uGKWEdw8G9ADj1vEkqg5jnEdkkiDR1R?=
 =?us-ascii?Q?UCc+dQL5/oTABqgR260RMyfeWOX/YURnZrllY9g/LTmM+Jtd22x/cDJ5QuZc?=
 =?us-ascii?Q?HcSW9RRYPAnj1cVHSfHSfs7oR7If94IW26+A0jOw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2dfc592-846f-4c9c-d719-08ddf405505b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 03:09:43.0704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EkpwF+7ySn6T50FnO1YbLl4YNK+uC89o+XCmNME7W/sXhXzDANZhUTqQnhMocfFBbvstkS+oAw3zNpdEYeCiJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8494
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_200952_633302_1EA4BCA5 
X-CRM114-Status: GOOD (  12.39  )
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

On Sun, Sep 14, 2025 at 09:19:32PM +0000, Alexandru Chimac wrote:
>These PLLs are found in the Exynos9610 and Exynos9810 SoCs, and
>are similar to pll_1460x, so the code for that can handle this
>PLL with a few small adaptations.
>
>Signed-off-by: Alexandru Chimac <alex@chimac.ro>
>---
> drivers/clk/samsung/clk-pll.c | 29 ++++++++++++++++++++++-------
> drivers/clk/samsung/clk-pll.h |  1 +
> 2 files changed, 23 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
>index 7bea7be1d7e45c32f0b303ffa55ce9cde4a4f71d..5fa553eab8e4b53a8854848737f619ef6a9c645a 100644
>--- a/drivers/clk/samsung/clk-pll.c
>+++ b/drivers/clk/samsung/clk-pll.c
>@@ -785,15 +785,20 @@ static unsigned long samsung_pll46xx_recalc_rate(struct clk_hw *hw,
> 	u64 fvco = parent_rate;
> 
> 	pll_con0 = readl_relaxed(pll->con_reg);
>-	pll_con1 = readl_relaxed(pll->con_reg + 4);
>-	mdiv = (pll_con0 >> PLL46XX_MDIV_SHIFT) & ((pll->type == pll_1460x) ?
>+	if (pll->type == pll_1061x)
>+		pll_con1 = readl_relaxed(pll->con_reg + 12);
>+	else
>+		pll_con1 = readl_relaxed(pll->con_reg + 4);

Nit: it would be better to use hex value for the two magic numbers.

>+	mdiv = (pll_con0 >> PLL46XX_MDIV_SHIFT) & (((pll->type == pll_1460x)
>+				|| (pll->type == pll_1061x)) ?
> 				PLL1460X_MDIV_MASK : PLL46XX_MDIV_MASK);

FIELD_GET is preferred. But to align the coding style, it should be fine.

Regards
Peng

