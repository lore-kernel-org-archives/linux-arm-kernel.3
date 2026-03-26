Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8138C10AB81C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 20:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJ6j2iTQSvAYHDxWujPLEhFrbptbIAE0K3DrF2OT1a8=; b=J1jUogGW9c9OKO1+4Zh6V7sCKf
	uHy0WAkphWPSzCnbwv+MZf6GytkBs6pnG+z0C075Fv39yx6iirjVOtaVEHnd/Rb7qsG2PZYNvDsgs
	gxFv3UxL5UQKT7WT1PEPRGomG4IeU+tKwiC0u0Ud7U/53RsLjkJTlC1iKIIHJcRzQh1+az7Z1Ny31
	PIhbO9ez+4/KtfyioGch3c0K5wORwu/mIfNQ0OmGtfBXVElT1yy+frFexVx1tMGO4QbiuYgJ3yM/B
	TzR01j+2K4UhnycTMgplLKmmoJeX0MMFynfHX08wwoe3AeQUG8+VBNn4t8Aqa9AhDvh8WTuE36fPz
	cCV2bqkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qym-000000069n0-3Zgg;
	Thu, 26 Mar 2026 20:06:56 +0000
Received: from mail-norwayeastazon11013046.outbound.protection.outlook.com ([40.107.159.46] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qyj-000000069mc-44jV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 20:06:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEWmyYJxioWVW+Nkzm6nEXNQOEsnkCGFsohq8tCeUF1un1+hJFrwnsRz4IvVx6gcHEhheVfedUUZTz5C0RI8rqFuaMBZ2nnZYWxSyQKVSUi7ytRRq7mx6vi1mt0tlUBL14pq3GBB0qG30FNww9/dvGRJfkAOOksK4eQPsAr+oQ5uwg17YFhqg3u9T4+w2ohni3DapiRwRpyHyBwOUpeOcBFhA9E2yXtzaYcnpc6vNUJTuj8l5V8oM129ulbGLPPQn8OuACD3pJqw0kso6pBV3SDGffzJa1MUKVcvWgAPCOgFfyaE7GlXRh2nCU5hidiG0bX+ptNUABxuDMtwFkLbEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJ6j2iTQSvAYHDxWujPLEhFrbptbIAE0K3DrF2OT1a8=;
 b=P45XLn0UN2pix/a0FLz2KEMCQMMMo7APq+7541egYqBJgs3vO0d/TnWYPg0yKEmIKwypEx/q5CXXawI/tBNh0G1Orcnqh5mvxANHHDveMR9ZeLp3FNkc1Dyxz+E8hNPUAtLjUlDL7lpCj1NxHJAEup2fBrN6FNq6V7qwU+nrblrHFTDDAh+WtNlewiHDGGnKbPkX9oaBaDxiGyDh8sHulPNeJp4gjUhKRqRj5LxrPp6LNn/tHE+5r3C7JzITuQ4Gw97IjLd3QwKILgzjij5tK9y5AOKhugGFdwCCnY90VtLZqqjCWIxJeVARonfizeQWTMrEZ2P+w46QnFo0/oPKTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJ6j2iTQSvAYHDxWujPLEhFrbptbIAE0K3DrF2OT1a8=;
 b=kOfCS0l1lN+0p7ItfMtaBRyw+2vMA/O01xugk8+xIeR0UCPv17apbt57HRQOn+58Jm8Zh7JjDu/Wsc2pioRKJJShJpXZFoPHIFma2nGnDpo0vfFlKsfdZQ4dxTL/WgqYSn9ErGZwPJiuIo/kaJVbDanjyLqELsyFp5ShfoRl+7LgniQeT4V1zsDk5PiTRAae0m9DQXOV+0j5RMTTg9R92hfWZPsCrY5nXZMa4WBy9gMXBXJ+D9gC2njrAulauGIzB8OQrVvOqHkIhJFhwxVIqKwGEag/O4cN7VzLczG2BC88HshYeM6Vp/SaOh3wWkQDnRH+RGnEI+85ep6bf9gCZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB8298.eurprd04.prod.outlook.com (2603:10a6:10:248::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 20:06:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 20:06:49 +0000
Date: Thu, 26 Mar 2026 16:06:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, f.fainelli@gmail.com,
	chleroy@kernel.org, horms@kernel.org, linux@armlinux.org.uk,
	andrew@lunn.ch, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v3 net-next 02/14] dt-bindings: net: dsa: add NETC switch
Message-ID: <acWR0QwRSnupmCvI@lizhi-Precision-Tower-5810>
References: <20260326062917.3552334-1-wei.fang@nxp.com>
 <20260326062917.3552334-3-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326062917.3552334-3-wei.fang@nxp.com>
X-ClientProxiedBy: SA9PR13CA0145.namprd13.prod.outlook.com
 (2603:10b6:806:27::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: 339072cd-f8d9-4d2a-60a6-08de8b7336d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|52116014|376014|1800799024|366016|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: MfeF7QYuezMxxSatTQOo5EGGN+6uXb6zs+DRNDBLGXVirq7pzUaqsJeD56GQea2yW0qOpHFb/w2gZ15D1rkH1PcoUPsHtMfGZSokkfiV6q1XfFZRZoMx7am9EI3c4c1n/oBT+h20bohHdP0zxzQCLMlvnOVQAv91P6U10NgQ5Sihqk3b7DZMgi3fQd3BqTJvYYAhutMwMD2LcBZd4STyxgtB7seUoC1VZsOs/tyX/5aw5pop7qDZqxncDSykg+4+gapdtq29gc7JhRNAKRDpnm2JAao5xo13nUcjZKWvI16CycL9++RunBxWyLqVDyPNpTdm+ihyRs1dwLk2Nh6ZJ86nm49zzrx2VduewmssT92TwNVu4YXUY0lODvkweYx1hCU6RwNXIkSnGC0D0+z9Zrm/OYXokH/bSNqos1bqk9A2Ln9rY6zz1g8G5FxWgoIZryaCtutQVPjU/ww6jOL1O9P3RQZEX0wE4dZzWU0aYSSQGy4/6P0ffhWfCv7NYLPSzpZgvtoxPCGa1+6ykRRICHWPJXIwqnmU4XGeOPf9eTUn2c2hIalJJmlFCEPqNgohMZNO8DoJ9pHqcqYEU5q7ncQmNcpRbVagSPAuwnXIAfX88ogvBCBT+TMwCgrYj9tSD0XIJ/gkA/FawY3kHAV8h5IjF7zW+fxFoC78ZQFjH8JOJbGav9WfEGfrlV7lnfOYuDy284P67KBwWDUEzLtDsQJGRhFlXusrrY9k/An6Iq2mx+nj3z1KtUfXcdghm7e9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q1D2bVDC53Mu03U8bbHYeNrMMzuoJrwr3ILpYepa27o8OJVJ+fkav8VLPkob?=
 =?us-ascii?Q?vTrOvKq4BV50BRk8HMBLgBIKp4GTdKVgO1qrXhdvXP42jDGty1lcmP515rTk?=
 =?us-ascii?Q?L6WExIxZN+mCBhaiIqODXiRcDdJSUyZ57aVVQRFgifX0X51EAphpFgDs5B3n?=
 =?us-ascii?Q?bDLAUtxSHXYMUiP3eARJ22gbkWbHQPsaVmvhD58aXmt8OZADKSyigK1l3x3+?=
 =?us-ascii?Q?1SFuZOABgYiPpPi54RHOv5O7R3/xSQCymO5sPu9gTxj4BsbYKemCGJsxiIpX?=
 =?us-ascii?Q?IfIgVixME4CMt2MzHnWz2YcFfjUGotpUvtu8PK6ljdC+HjrJYxyGShMq+dsR?=
 =?us-ascii?Q?OvKIwpz+R9ss65FQ59RoiNnH3gT5btKZ+vz2eQh9oi5GjuAjDvIi9Gx54K0o?=
 =?us-ascii?Q?FOjxm/8FDO9ero0Zk7x5ULDoXKFdw/DbBqoSR8dug0I/NU6vWGqhDk0ppNlz?=
 =?us-ascii?Q?55rVaLm/vTYbwL97olgT6baCkkp4zRbSzu1Pd1dCOZENCq5c0+YCrpfstVVi?=
 =?us-ascii?Q?/Jt+vPn1zDrgbvO62Ctzyv+KLYaKOGmw4iZ801DsH13ZbOWQhx+yiCN1Wo4g?=
 =?us-ascii?Q?dGyV2F/kKAYs/NMaOS0G/h8ghz+KnSj4tM+nixlkMt/uJUeDGS9wGvaKRe46?=
 =?us-ascii?Q?IIhN6uvNF3lJ74pLLDA/AeqaWHqkuPUNg6qMf2b4U/Smm4/yd3p1fQgqt208?=
 =?us-ascii?Q?NT+Cfrv1dREC116md7cBTTPRCIJJvJ6tDZQBBHoirgGja3n5aEd3fFWxHpZJ?=
 =?us-ascii?Q?oNaCpUA+/OC8cQu2iYMDiDPscxeQXs02AehsdUqOMGNQ+wHS81sDRb4BCjGH?=
 =?us-ascii?Q?3NA2vhj/xBLY7N3B2JOY0RKzr8o97KpBMyoXkPaQNBHCl9O0dK5QqVi4s1jd?=
 =?us-ascii?Q?B2EYoCdqEg3SLjnzNng2kZvy3VXPePTpjYkAz9rfcjunPhbj2wRHXeko9snJ?=
 =?us-ascii?Q?io2k76uWtRZkDaLtk9dv9kCshkILHQjwYnXMjedaMThdQX5JX6ieqFGWlhB5?=
 =?us-ascii?Q?d5iHjH+hd6AOsD7A/SjjqB5INakspE2FEnuNE/6q9ZJ3MpEmUBrnTiWwgNYF?=
 =?us-ascii?Q?b7NGXxKhEbdt21zHYE1mrcZPFEDEiMSOx1EnN/TnTzhHByqV99ulUjneVwo+?=
 =?us-ascii?Q?a3V3KVgwinPRA0qHQSO7EYj9d+Ww2sZ7QLsq9DYtq0MDLTUhxYZH8rdnKoEv?=
 =?us-ascii?Q?7IXLuJjHxXowXDdgD+KJ521pXLYguc5QTVWHBNUU8lptTW8cwrGPepEVxCUz?=
 =?us-ascii?Q?Vv/zhdI0B9Yka+yEycsU+XKmwjMydnOUzva68L660o/GHIDRnY3YIoyfRZZi?=
 =?us-ascii?Q?i1FdQs/sluXOBnSEZ+vumMCp9Gul9Vd6R4ZLA4TggeLvpjP28l3/pb94Vdti?=
 =?us-ascii?Q?M/FkOlwurDB+W+3AqGErH68G7BX77rKYOiW9Ld/4meURfp1oq17JGtqKeU/e?=
 =?us-ascii?Q?EHJUz7QE9xW2JK3c9diU/KhjFajZ7NESDIE3sayrKdLSx+driYloY9scTVCu?=
 =?us-ascii?Q?wf+rr5O2FKQ4wNSUybYsviVt4M5JW5bHSS2M5mSIX4pLzp5UK75FW3OYqpsd?=
 =?us-ascii?Q?R94635kYPFLUkiNXqIZEHz3TydoSYtbwv2nVDYM7RKTz8hSmRm/H4LpswN6Y?=
 =?us-ascii?Q?kJyA7dUdZt4UhXIh46BW4gxmZLQu0DP2nW9wc/xjdE9AmGmiVlnzzbeO8xE1?=
 =?us-ascii?Q?UKZHZrdwqFGyNp/ftDZIWD26ZpMdQPg28zJ0nQILR3ZkKDuqYh6TXKac+mSC?=
 =?us-ascii?Q?6nkwME64Hg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339072cd-f8d9-4d2a-60a6-08de8b7336d5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 20:06:49.2353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxXVujxC/wOqB/EH0mfmz66YrFm/mvVEuAp80GWaVanHaZnF7Q0U3gC6SV/2zVI/RdS15Vtd70cg/83r301BIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8298
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_130654_039796_175104F7 
X-CRM114-Status: GOOD (  24.84  )
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

On Thu, Mar 26, 2026 at 02:29:05PM +0800, Wei Fang wrote:
> Add bindings for NETC switch. This switch is a PCIe function of NETC IP,
> it supports advanced QoS with 8 traffic classes and 4 drop resilience
> levels, and a full range of  TSN standards capabilities. The switch CPU

Nit: double space before TSN.

> port connects to an internal ENETC port, which is also a PCIe function
> of NETC IP. So these two ports use a light-weight "pseudo MAC" instead
> of a back-to-back MAC, because the "pseudo MAC" provides the delineation
> between switch and ENETC, this translates to lower power (less logic and

what's means "this translates", do you means
"this help reduce power and latency."

> memory) and lower delay (as there is no serialization delay across this
> link).
>
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  .../bindings/net/dsa/nxp,netc-switch.yaml     | 130 ++++++++++++++++++
>  1 file changed, 130 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/nxp,netc-switch.yaml
>
> diff --git a/Documentation/devicetree/bindings/net/dsa/nxp,netc-switch.yaml b/Documentation/devicetree/bindings/net/dsa/nxp,netc-switch.yaml
> new file mode 100644
> index 000000000000..e34a4e3504c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/dsa/nxp,netc-switch.yaml
> @@ -0,0 +1,130 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/dsa/nxp,netc-switch.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NETC Switch family
> +
> +description:

Nit use ">" for multi paragraph.

others look good

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> +  The NETC presents itself as a multi-function PCIe Root Complex Integrated
> +  Endpoint (RCiEP) and provides full 802.1Q Ethernet switch functionality,
> +  advanced QoS with 8 traffic classes and 4 drop resilience levels, and a
> +  full range of TSN standards capabilities.
> +
> +  The CPU port of the switch connects to an internal ENETC. The switch and
> +  the internal ENETC are fully integrated into the NETC IP, a back-to-back
> +  MAC is not required. Instead, a light-weight "pseudo MAC" provides the
> +  delineation between the switch and ENETC. This translates to lower power
> +  (less logic and memory) and lower delay (as there is no serialization
> +  delay across this link).
> +
> +maintainers:
> +  - Wei Fang <wei.fang@nxp.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - pci1131,eef2
> +
> +  reg:
> +    maxItems: 1
> +
> +  dsa,member:
> +    description:
> +      The property indicates DSA cluster and switch index. For NETC switch,
> +      the valid range of the switch index is 1 ~ 7, the index is reflected
> +      in the switch tag as an indication of the switch ID where the frame
> +      originated. The value 0 is reserved for ENETC VEPA switch, whose ID
> +      is hardwired to zero.
> +
> +$ref: dsa.yaml#
> +
> +patternProperties:
> +  "^(ethernet-)?ports$":
> +    type: object
> +    additionalProperties: true
> +    patternProperties:
> +      "^(ethernet-)?port@[0-9a-f]$":
> +        type: object
> +
> +        $ref: dsa-port.yaml#
> +
> +        properties:
> +          clocks:
> +            items:
> +              - description: MAC transmit/receive reference clock.
> +
> +          clock-names:
> +            items:
> +              - const: ref
> +
> +          mdio:
> +            $ref: /schemas/net/mdio.yaml#
> +            unevaluatedProperties: false
> +            description:
> +              Optional child node for switch port, otherwise use NETC EMDIO.
> +
> +        unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - dsa,member
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-device.yaml
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pcie {
> +        #address-cells = <3>;
> +        #size-cells = <2>;
> +
> +        ethernet-switch@0,2 {
> +            compatible = "pci1131,eef2";
> +            reg = <0x200 0 0 0 0>;
> +            dsa,member = <0 1>;
> +            pinctrl-names = "default";
> +            pinctrl-0 = <&pinctrl_switch>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    phy-handle = <&ethphy0>;
> +                    phy-mode = "mii";
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +                    phy-handle = <&ethphy1>;
> +                    phy-mode = "mii";
> +                };
> +
> +                port@2 {
> +                    reg = <2>;
> +                    clocks = <&scmi_clk 103>;
> +                    clock-names = "ref";
> +                    phy-handle = <&ethphy2>;
> +                    phy-mode = "rgmii-id";
> +                };
> +
> +                port@3 {
> +                    reg = <3>;
> +                    ethernet = <&enetc3>;
> +                    phy-mode = "internal";
> +
> +                    fixed-link {
> +                        speed = <2500>;
> +                        full-duplex;
> +                        pause;
> +                    };
> +                };
> +            };
> +        };
> +    };
> --
> 2.34.1
>

