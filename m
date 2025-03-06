Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851A5C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Rj/RZrQrfDp/JFuOIJR+RAsh+u9TwZuk/iR9EUFHd8=; b=ZsFu+hK5aKiAQaWWO/hzfB/Nov
	wcGyBsMjfR3juRX0Mg25NJMZU8RtyeA5RlSj0tXYc0EGl3EWK05kOKhROStMQ6+PZAZl9Is5dI3/p
	fYxZIbSfStEKZSqvaqdroHIknl9WoOW1Tc8w1YZvN1KGkBor7G5C9v5pyc5jbXkc+M9zGYKfe4RUl
	Skoxzvnks7Bs1n1dfAkfDvdvAzTacf8nOosbQyJ9sGxazOHRS+OEJ8ZTln1DkOHFcg/MuHP5jiFxv
	ufsuGQZ5Rbt4jwIPAj8w8qSCanu+yDp0yHrOU8mwH26Ybsdy9Hx9TenCxEAdgtR0aUnfwEvngm4dr
	69+4pq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCms-0000000BH5l-2a5x;
	Thu, 06 Mar 2025 15:05:26 +0000
Received: from mail-db8eur05on20624.outbound.protection.outlook.com ([2a01:111:f403:2614::624] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCkF-0000000BGbn-47ko
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 15:02:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFVspKVfGr+akC+KBAounM5xZgXGf9d4ZjO4icUhNuj9lHoTtNGFeqzGzcjgWyK0TK+IKwmQVHzYFTGLkHts1aktZ3PxS3oziaLxBmQuIbelArbC9nmFYFVAPdn2afCXjaYzJnwe2UbdGegc9vr+0wBHqpnq0DlUqcSDNE14Cis9j+KP5LetR+WE9xa6R+dlHmZPlW6gT8lqOF1khOai9JWiNyc3DBQqfX+1L80Cv4bYEQ3gPqvRjXssL0aeVyh90tEUTNDbbCDni4ETeqeJQsCA0GH0sssEFg3qC3QQ5l31xDI8UmsB2/d7dwjTrFqgAu3fsZtT2j67dJEk5p4ihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Rj/RZrQrfDp/JFuOIJR+RAsh+u9TwZuk/iR9EUFHd8=;
 b=Iw8m1c3Hd5svimGWKYQs33fMX2+Ia9aFJJyuxigzfl412Veoz3Go23EfE7DmpvA4IKB6l/fv1cs28o7IpT7+ofjA00B+8NUCInYAB9vK7gKPxNMKl+VHmI8Nw/SW0CWMNOwfXt32RdV1jgqU5HZBduceiNkEWAAjqLRVEBCmEWGLDDRRTMcEFWNQPmGvo93IDPWbQobSRb9CquKMedAKyAY3pUbGQv3JU2t3yZ+xKQJ4kycGJkn1gGQh3gCZ9V2YPMO36fuELWV43/BFUEY89rn0dL1E8BuZf6gJXKM0OmShaQinKFnIGeUdkQaQL5st3y19s5q/C5PYkt63FSoE9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Rj/RZrQrfDp/JFuOIJR+RAsh+u9TwZuk/iR9EUFHd8=;
 b=KV7WgxUw7V261i1+yAUhN+AjeZpWfusbpYUBm+vliI24ESyELbMq04NrF36KfgCG+t9pL/Txq7TixO+wWC0E0XkNgEJIfGc9vxT5SI0afuaGdIpr+BaDNZ6gyKSU8VFCzxuX7hBGdzIC2j7lYNzDEEQzkKUsaBI7wb8F7wXOXwKqw3sSrib0yb2t1ygg86NkFOhpUZy0YL+l9WzNQ4BSdPsfTs/FoX+jNNL4Ui5JN/eGsnQ7SHm0N4suQa0TsMiQImrE8opYwNIxBP7GWO6kD/qKwvr44eneKiadU9QefLWmEIvRPms2BTuhtmGLjimXNBD0qd6VsXNj3uP8RPfr4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7233.eurprd04.prod.outlook.com (2603:10a6:20b:1df::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 15:02:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 15:02:32 +0000
Date: Thu, 6 Mar 2025 10:02:22 -0500
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH] ASoC: dt-bindings: fsl,imx-asrc: Document audio graph
 port
Message-ID: <Z8m4/ljU4h6BtB7g@lizhi-Precision-Tower-5810>
References: <20250306053138.1914956-1-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306053138.1914956-1-shengjiu.wang@nxp.com>
X-ClientProxiedBy: BYAPR07CA0038.namprd07.prod.outlook.com
 (2603:10b6:a03:60::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fd83afc-21f0-4f81-29ee-08dd5cbfebe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pMZj6wnVhUWFeP6SgNnBIex7Sd2089G/mOAPgtrOf3yBXkJDgL60FolaQLZB?=
 =?us-ascii?Q?r0X6o11TAJpZpGIEUXyUnYqWekE0lvHU5Ht3JxFyGyV52VaD0ohIQ6Sy9tW5?=
 =?us-ascii?Q?uNbDb7kY21GTqikxi47x7ZpEifZqB3dn1S5eGEBSaZgkIZfnVLrntXaOHwNJ?=
 =?us-ascii?Q?KLrEUguG87wLKEvBTwJ95tWwzcpWLUlmPWYkFvtUwhsh6Jlb2x7GCblIrNiH?=
 =?us-ascii?Q?D8jVhMLUiXgP8Dm5gqMvTeP1WLOgnFm+z0bvk/RODyBUB/GtP45YfPk0p/NL?=
 =?us-ascii?Q?CUWBMEUSfyfePFnukLqW1iGVvTfZ/JzDNx+tTKNcA/YfRgGDl+y98bV3/uzI?=
 =?us-ascii?Q?YgLCkbIz352ssXKTUePtQmO61xhrYAxYGVBM+b8Lymam8u7Nj0L1KPC6tBa4?=
 =?us-ascii?Q?ExJ57bJnIXiu4EW30IVFl6QYBn7ziRA8zYgDsgk1KTkzBlOLLwzszKMALlm2?=
 =?us-ascii?Q?cES5SaG02X6mY8eQoRuhwzqNDugzAW9ZukOpS2CxmiceQZDiPf7Lt56ca3i7?=
 =?us-ascii?Q?WLw25i8HAg9BwPiRtshxu2MFzuHH+IFLA2nFhj5wfOfI+CqzJElcGDlIBMx6?=
 =?us-ascii?Q?VBITBmEjts2ewR93eYo55z+GvinLqsBTXloT0Mj+hoakoEV33EawuDWK7NQe?=
 =?us-ascii?Q?ijVmxNdClkxa8SwP/qHlxcVNuPj7dfumObKs1xKDwXvQ9/6d+J62JkwFvjHX?=
 =?us-ascii?Q?TD4TEHgCBKVlmQ+5cSQsOHuSXBMkz3Pnh4Fb4FRYTgtNVZtTA1pX8ysiXe9b?=
 =?us-ascii?Q?hrCZA4kZkGeDwBxcThyZlyAw3ozlD19tpVgQT/lGWnf7KkgLalbtW+8/IEV6?=
 =?us-ascii?Q?Vx0s6HwYUgH+tKucBIm0Qe4IIEDAvLVqWgPkmm7Izl0ip04g9r+vvMbI0JyF?=
 =?us-ascii?Q?Aol7GwQqwKglyH/TkglEcEDHy25nYvX0peHsYl9qlbpgzDZoBgfY/rPeHsMn?=
 =?us-ascii?Q?fjhC6eHunsUU5+qnezcRammqnMh6EYAQ00REiD6ouN3UOHIcq/+Wk9Y30TRH?=
 =?us-ascii?Q?yMDcfCnSeEcT4Awk/6h4Rs/113Oa4KLNHsSlsrLpvLtcLLLbRUeLLnpS0/fA?=
 =?us-ascii?Q?l5bN77WfSov5ocpmZHh4jwP2kUKzA8Id4z626mTvePsUAPNsdCKKugkIjjpK?=
 =?us-ascii?Q?EanKASJpEG9UqQ1PaO4b7L/w9APGaO7/Ed5cjnN5c09d5oeqIuTchNr89dNJ?=
 =?us-ascii?Q?HxCOPJHP0vhjgx76XDksBnbc3udXLMEbsde2/XJquIlBEZnfqTPJy2QLxsrW?=
 =?us-ascii?Q?AAsRGlqvjIMVuEuGsGYEPfFNYPpWp5QKQG3f61Up4vupIpjnOKQx4uf8CD6f?=
 =?us-ascii?Q?foyHt1D0X6j/1ZVAXUtnMfpcA5V9wA1Mjgu7FtoUo+lS8gsp7gBSo405W9jX?=
 =?us-ascii?Q?wp7HUH7a8aEj3LJkE/sTkYp/HLlLOG77Z4Z4INpoKGfkzNpI3H/t5HsqMMYI?=
 =?us-ascii?Q?MJnN6c1OZiNLVoDmRaTTdSaRBiDmwM1m?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c79yFEGNgdAOszRPxJju/+TZ6dGBOrpvplu7BE86n61Z5uiztOOYX6rJ7J5a?=
 =?us-ascii?Q?ojaFrkKuRTYH0CUUO5uEEfiHh9j0LkDwkKXZuGOYjmYfKah3WZLgmvltYqtc?=
 =?us-ascii?Q?5tYOU3pi64pkv0fKZqhSDYYzeZJdgYwdGsIYfmoY4VY/LdNTc6dRW2+ulg8U?=
 =?us-ascii?Q?QE6/h5jhnJ9KNUlhvWgBL8BQw4LVFVuWhXGF+0Q3I30su+jp08Fj647EHb1j?=
 =?us-ascii?Q?F7ylcDp/+eZtsEMIJgwdoUKAsvk6U+xpgY7ILzWaMyhel9WHLcU7FHsHkb1g?=
 =?us-ascii?Q?1vxxLnOcNBePoWOXGWsih9UZPzQctSTwTObm9k3y5UgGHYzr4iq9anxxC+M5?=
 =?us-ascii?Q?txIwGjJcuMda8OdbQ+BYWB0UG8sCQCmpqV6qQUDVUwqXrAzt2Oik7sDhXead?=
 =?us-ascii?Q?ajrhFvldUgz69EXDJQJlIzk7A1LaRvx5pTUJMGwzrLusXdvwpCEDLGJX7MhC?=
 =?us-ascii?Q?HS4K5pX4psyUtCl/XiVdwt9npeujz3gwF/97AB8R/RtVvEtnq8pSwlUo5P0Y?=
 =?us-ascii?Q?wcBUIWJrcO+INOhe7ap2fitEydaieZzsFryRx5sTDdhwkD3CBmy5CiWp0osS?=
 =?us-ascii?Q?158hjS08HKTCIdHlZDmihI731hMryaTKsdJWm1cKQq9OdDkgmm6lkFs2nIA6?=
 =?us-ascii?Q?N6/NR2xAZORnc1H78MC57WKoRgdw67fBL8wtByRSgFSQf02xonDhj6Z+Aiyj?=
 =?us-ascii?Q?dUaPc4O6rSuco5Z9avSoTbHAMBhoM5hT/uzZPhdFMRhWpY1hwqrMrD06EgHr?=
 =?us-ascii?Q?rUwci4dsfAJ+nNaLUqT4r0qkapfyUGQc6BDk9PVo+6aVtro2iuGswBtZOrek?=
 =?us-ascii?Q?E2e9HEUnPtEpK9zqBwoZHd/nHmJro4I0mRSL1/tfzDe9aI/WzpjUu1XyZbig?=
 =?us-ascii?Q?UlhyvrRxEjyxp+bb0zA/sVs2Wxg6ufTVK4ynnAMn/FYERd//L2q+MTMa4lVC?=
 =?us-ascii?Q?SWIXFvPI32hFfQ8htiJWLuK46wW/Ay2T5VA4N9y4V0D5WPRz8CVEHPrPq+SZ?=
 =?us-ascii?Q?zZoKeSfI8RGh6IeUfT7lk2g5YxLDoge77TIaJW93ZGSF0GVLHmXgMoOP+9a0?=
 =?us-ascii?Q?xsULKfzYKfxOy+oUkHWEyLNse/zS+xlzYW6gEd7P04AIA266Q54ZufaYGOPH?=
 =?us-ascii?Q?Y6oVERcS5EzlQwGSAN3+bTjTjFL3PRX/iVgQ7Kuieu2FFqBmhq1r4ERqd/rZ?=
 =?us-ascii?Q?NO4UBh8u4WXm+3K6gMBUNE5tcKtIIryWOXtr9VEYjN9kD0/QSxxOiILzu63O?=
 =?us-ascii?Q?V6i3ZUK1uXNefE3bXRzdZ37+qvZdayvU8eWBTceDLSz6jzInq3Z/TTZ8XZ/7?=
 =?us-ascii?Q?41EbtUmzrq/a/N5q/bxkqSsohytTl+zdOIBnan5N7CGicnEUOKmhw7m0IlpW?=
 =?us-ascii?Q?JnVwHFjdGuKFbbKE4c2ZO/F6p/zH2iEyklIK4e8zlAzBOfUmaYndsYgtgwJT?=
 =?us-ascii?Q?qwTSikCg6w/9zsasxg7XzOJ2wB9Xf3IOp0AP4Vk2xR1mgTsgZBq664m5htmQ?=
 =?us-ascii?Q?e9vGa5hP2bUJL4qxHJ6zA6BONzI0IBQEMXB/M+37S8YGmigvcFSi5X0o3De2?=
 =?us-ascii?Q?mAid1yd+sB82pFt9NOjdTekMC9Bl0xubcdXlL2G8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd83afc-21f0-4f81-29ee-08dd5cbfebe9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 15:02:32.4875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vRPSl9qBZ3/+eYFG9faYHcyjQtHz75siHzMVJfHMowO/ZAm3RlNRpcm+xOK2NMNUHgtyL8OW0LHt7PYe88MgTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_070244_045640_5CE0D037 
X-CRM114-Status: GOOD (  14.99  )
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

On Thu, Mar 06, 2025 at 01:31:38PM +0800, Shengjiu Wang wrote:
> This device can be used in conjunction with audio-graph-card to provide
> an endpoint for binding with the other side of the audio link.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  .../devicetree/bindings/sound/fsl,imx-asrc.yaml      | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> index abac5084d63b..85799f83e65f 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> @@ -77,6 +77,10 @@ properties:
>    power-domains:
>      maxItems: 1
>
> +  port:
> +    $ref: audio-graph-port.yaml#
> +    unevaluatedProperties: false
> +
>    fsl,asrc-rate:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description: The mutual sample rate used by DPCM Back Ends
> @@ -174,4 +178,12 @@ examples:
>                      "txa", "txb", "txc";
>          fsl,asrc-rate  = <48000>;
>          fsl,asrc-width = <16>;
> +
> +        port {
> +            playback-only;
> +
> +            asrc_endpoint: endpoint {
> +                remote-endpoint = <&fe00_ep>;
> +            };
> +       };
>      };
> --
> 2.34.1
>

