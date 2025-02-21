Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB70FC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 20:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVFEAqP2ThtwTPS8HOFtHcpvdu573UEcy7UyuodHRIg=; b=TcuJ1PMBnT4Vu3hTMW6d6IzTFd
	QRdUOIicjTdXrkle1Ucj99AwQoWqzHYrWHId0g7CoVJjLECKcixc0fInKeT5tU6gAyMSx6EwEbe49
	f5YDkhthyF5qBOYf7hot9yN8y0c9rBss9QOKRcRhrE6v7CXL5u0g3UlV3HkfaY0GmIpZ4Lr8kVGvL
	0moYhW1gSRBPgDzWcABPHyOogW+fB06oolull9EtTD7GXNQZMX0T+zX11Xm2gyD5rg7sT6cOkU/iI
	4i/LZONTjggFrBHQtM0VH0Tv/uOnc/7ah9XZjrAEba8WEft6/8npY8QfO3ianw7s+mV6hnKDWfpEK
	IcvHxRcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZFs-00000006j2r-3tvu;
	Fri, 21 Feb 2025 20:04:12 +0000
Received: from mail-vi1eur03on20610.outbound.protection.outlook.com ([2a01:111:f403:260c::610] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlZ90-00000006hhO-14M3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 19:57:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSBaZc4QYX+TLHNy0I4lG1IRfpFpA4QO2SGZp2I6c79iwgpZPI0zpnf8Sw5HKJpJV5h0LynR75KkXfyGSB/qS7BkHpv1w/u/cdhrXobv7DA2onzQKVMh5q2/2B6+WTK463er1ZFRSkqGtAMBjKRv8s2IBRMw1pcLWDJmSICm1m0b1z5VnACfXiqlcbK/314Q+p3gUcl7oUu9W/hC+Ub9SjFVCm57UP7qdNWX8VXYiz+f41jFE6CIZjTsjtFTN4Gi0N2OXuKUC5BxU/8JiepdjnR2o+riODY6X5e37fVZPXwi/b5bjDRlWUcSchJT41NYCI+dvJ4P9zwTh6XoFQ9Drw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVFEAqP2ThtwTPS8HOFtHcpvdu573UEcy7UyuodHRIg=;
 b=n5pfH8HSQh5oVQlqlLjMgAjlYxc/zRFCLkZX/HIvAJ7LwrWg3wXXHM9oWKxMUymRdc/wcd7EVPDmQCVIo/y1Pk800sOgVpItTG3faLcxncwRUM7rpVP9TcsFKWIwQDejy2UO640OhRaLkwY4RDwq2fKbG3714/qZcBl3599layPEgZa9FSYi3932HYGyXwab1aj5thHbGFxaIj1iCSP9/tiVWuKAArvkuhsAz0tYPz+p4lEL/5PgB+0kT/eXpb3MwNqG+INhtOf9SUBw2ZdYjkqRcmLo1V3WHdX3MSAQcfxogLCIewAQkzhaxZKmCqnkcDpoiXgHYS6K4ey3B6Up0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVFEAqP2ThtwTPS8HOFtHcpvdu573UEcy7UyuodHRIg=;
 b=VYeuaUA0FmdQJ4EC0gbla8CGUxKTh83ojGrNzK+asIZVQ4nXzIFj2TAvINOYoWihYQXEEUht846TWlhL3d6b73bhYapJUo4yl1ftBefomXED09kRpml3j7iwBSIQqBt8n9QaGMCHwOyBpyvbPTMKoO0nLE0KSMHpRt38YvoF3wWU1SH3NYezar0ejh51fumO/YZbXhcoS8HpQOFngyi3PwB79UT8SlX4UI7QyWdTyRyMkUrwSGiu1cZFNmKdilzhxRiYsc9CDqU1bGWXezF6n5KzNBIkjM6ZdwunUY0Mo7golZAHKymgl4kSiKW7CQWjd5+m07Rs4jGTIC2nVTLYPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB9833.eurprd04.prod.outlook.com (2603:10a6:800:1da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 19:57:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 19:57:02 +0000
Date: Fri, 21 Feb 2025 14:56:54 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <Z7jahtO3bxjkMfnc@lizhi-Precision-Tower-5810>
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
 <20250221191909.31874-5-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221191909.31874-5-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: SJ0PR13CA0237.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: 695a03ac-b78e-4430-ebd1-08dd52b1e8ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Yi3m3Wo1X9lgShfGn1khpwwMAJAwhlxqZ/0zMqMlkC5gB+8k6MXNhUaNJdu5?=
 =?us-ascii?Q?jbfgfdsJ0DydEVCwx7YlWRtABheOfW/SHGMB5e1GIpTznNogl+ewsE5Y8xla?=
 =?us-ascii?Q?MqReH9CiGOnyXjmpXZy5VYIQSQX39fcHPkWXbZH3lSuWoQk1M/GxS+YTLbB3?=
 =?us-ascii?Q?b5oOpXd3VC1PKzNw9SYPk9u11NQEdS+z05b2uszULGcslpCFehDC6utzHuoJ?=
 =?us-ascii?Q?y7j/OIfKgQxEuU0slRVQ4Nx6Tjn2tZvS3/Oxeduxnwc+7AHP2QzWs4/uei0y?=
 =?us-ascii?Q?Jiw5t/p9sv6IexfSNOKSnfQYaK2zf/TOuzqKhsyNOTWC5JbstCmk4XYRoRzl?=
 =?us-ascii?Q?D77Z/TW6QyDrbce+LIaca1sQXpUnEWa4XvD86D+9GYlREkrSBxwVTZH7onba?=
 =?us-ascii?Q?NodVCYr2JH/cnLVlxwZkhrgx+GWXEvcgmV5/s+lfyM7M27iu84vAjUjv0ScI?=
 =?us-ascii?Q?+JiPJoCKB37JzS6VuCCJKjbokS/tsuZGmBs5g2GL2o+oCRMmQMr+Fb1220cK?=
 =?us-ascii?Q?+BdFk0OL9pcIU3uigN9v2y7jX1xgMhtVOCfp9p/gUX154MyySCYlMsmbItTT?=
 =?us-ascii?Q?SeoX+u/XxUT2C6Er7o57K2Fit79Ow+NrknjDiZIG1scMoIE0IZhw8plLQDcf?=
 =?us-ascii?Q?Q4Kh/j8NtL+b6VhfPjBM/PAiPohT6JMAPX9BHDyb6Ed34UB7BC392qoAw15Z?=
 =?us-ascii?Q?aCOrkoi9LcQhJ6sMBepK6qON5wwRZw4RVkxOC5MnQNKwLw0dB0IY8ej5TwXy?=
 =?us-ascii?Q?wYWChZ0cEfgVuWSEOlWlSjhFK38FyZP6ApB69zrGG36d/31i8/0xjGaRRpYT?=
 =?us-ascii?Q?CCrf+MQfWZU3T5CwUJUzY0ixChkGQ5ilGbN/4P1o2XB3S3vzO+KgZ8peOPtj?=
 =?us-ascii?Q?PgslgmDqzlRFrdDjsWYh/S5mb1929napOQiXXCe6360xXimadToAWEVHyuhq?=
 =?us-ascii?Q?wnVX1ENuzqfoVOaece2uifEcEmOXMoawSx57JFRtY57R5RjdFgmkxROEo/Xj?=
 =?us-ascii?Q?Gi+hq6kAwb2W8YohxxGZic6q1rW+hPUaGp94vnLq2W9T6Mfrt2rwRxdCN4/Q?=
 =?us-ascii?Q?IFTEZfM4uWRYOL2PP6vS0EheID7qKcOiNjbgSnvMnclkFuqVPm+5L2BS9iTA?=
 =?us-ascii?Q?35SNAgPeDnoEEF1IlLe/4x1cRQ/TEUyt4n/AxGB+kTptTxwXedh1vARRirnE?=
 =?us-ascii?Q?7yOh84t5KOyHJ/ggNMxqEpaMV3n8HIYFdfqQ48GmxbN+huS6emSqDbmTQUZP?=
 =?us-ascii?Q?QKgO2Vcu4RNcaBxptRS35RMRRNwiBvhtW9GXnlAxqamiPqccoIxKc5KoMK6d?=
 =?us-ascii?Q?Xonu40s70+wOc34bvpRZoclA918eANCBl/yXbuDnry8tlu+NrXlFsgNTlv/h?=
 =?us-ascii?Q?8NhPyiQ8a/fQlLnorw3oIBin1XgXj7iIBhW5CnLN8epsx7nVVXkzuJ04WLsH?=
 =?us-ascii?Q?7PLfLyVEsikzg9yYEI2+BFKtevFYy3lx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AFezlXfTDkKsQ3ycrIXdE3zwWfOQ5ESABQudrDbFQdx8rrA3vZ1QzoAZqoCg?=
 =?us-ascii?Q?R1SCnKFMM+rKP6ipN7v/dVPsEE0qxquJuwW2MxbfWJJ9JK75IohNXDIJYgYd?=
 =?us-ascii?Q?JZyKny+vgq2a8jm7srje4dt1g73hHZ5vZsCGFxbqmG322gLuLdJbPJMm42GV?=
 =?us-ascii?Q?FgZyGRJmbWC5sc9gfk8e121tstVk8qriMvPlZdqW41TuV3Bbnb0SM4Z2FJka?=
 =?us-ascii?Q?jbKB9Bl02MiSc4FSJMUaFjer5ck68AfuJm80hz7DOKOQw4Dmy5b7An6eClxe?=
 =?us-ascii?Q?2Xilw/dTZsgmydEsBm3qQivZpA6jRCHg0vfdi4iy6dvQQCLahBsolG1jIWAZ?=
 =?us-ascii?Q?PChXbFKPS9+WSy/voZ2ySrWtog8pGMheO893WyFnVu7D6zx7gtmJ30JCkOIg?=
 =?us-ascii?Q?orr54lkvB2Dc+MFvd0w/kBL8xKFbYfKxr893El6DSs7gnMFXB7UIvny9qXty?=
 =?us-ascii?Q?Q2wHnsT3VJ0886tQS+2gRBhwwV7NYvudCvV6nJQeenYetwGlFn4A9C9m/bmt?=
 =?us-ascii?Q?6MjF7E7ZiCufv4Jsnhk3kA7rmvetsYfGPkFa0wUs+BOXUo3WsZI0BOnnIaOo?=
 =?us-ascii?Q?LCeZwsgFXwCnTJF2JTLFJ8iJuzG0/rJ5uuXGba3pMSVta+tv5vBdi7Y6QgLG?=
 =?us-ascii?Q?v5rUsTvGR8wI0VublUvtEnAnR2gqb79MATXrFUKSq2vXGhpN4YMn2VvjmWRN?=
 =?us-ascii?Q?XowaoxpTDWDgGsIFYe3RY0sgYY4AHzk/6xCUW+73101bkKebLZXDMMYeyUbI?=
 =?us-ascii?Q?k3o6Z7lIBUzqYWjIokw7aBL4pNP4PaDlie348rcOOaqtFSOUJ0LsCACqxZKD?=
 =?us-ascii?Q?8NROP3fo66rEmTlcxdR4Vt2cw/U0N7jGIvCMDjp/YUi+5G4i2Ank8tL9SKS7?=
 =?us-ascii?Q?apLC8R4h/agCULFBsBSi+E0cJwXdIap9dqIoxN6yCpoBrez4ROnwtSpkxgNt?=
 =?us-ascii?Q?EMEa5wf1BwvFUCw61/enu92UimF4QavsJ98SDRKHAq97JqY0wEtOBQ3Si6Dj?=
 =?us-ascii?Q?PFBXscB+aNaMPiSOSTTXGsOMKfdLABSoFbuS5PEqvCW5074iF6+xPmajeXg3?=
 =?us-ascii?Q?NBai0/EpS8wGwEYTbqXwuD20QFg32esS2JD8sOUlsvW1LWIWypa86L5Vv6J0?=
 =?us-ascii?Q?OIzAJEru4uOE405U6zSgjKs01LnJX7xAHV4wL7yXZQxj083W3KzH6UNisq0a?=
 =?us-ascii?Q?FCq08G7zXVomFNoLG4/mSMLN3mgYpMTQ47jEH8BVgUW+pK7CsAYwwgYieVI5?=
 =?us-ascii?Q?kiq7cgJhlgvCVobpda+WEqulDx54tGNIXquirgPbdvb6jAAa8Oqwtc1CyKNn?=
 =?us-ascii?Q?0JcnToYM+aCVltoWMls9eT+QTGWCr0CNUISuVx7g9VtYQtt2DYkl+2gt0xSv?=
 =?us-ascii?Q?1cnkXfpBI76QvhgkrMLI0bxoPNxRypvUR99akthsVsTz+O4VEWwJTex60pni?=
 =?us-ascii?Q?vywECfGo/DulnbU+sQdlgqg7TK6nSwVlUqkXv0QbjzH47iUue9Ql7J2Olq26?=
 =?us-ascii?Q?UqRPuSb12junJ6KZS3SBLWwgZa5jB5pKr8jBTzHZTmWV5nky8Dc6NhwomhTY?=
 =?us-ascii?Q?geBk9z3XYuP3EJn1mOlC8pss1nnuDKIL1+7KaH06?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695a03ac-b78e-4430-ebd1-08dd52b1e8ce
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 19:57:02.5949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkpOez33sVfDp+u2wcjdzXexKmXY0j7Jqj5rDMmT1MdZqN6MP0EjV6jFMdB4qWEspeyH53QbTtpzmKYonnaaPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9833
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_115706_292082_4D699244 
X-CRM114-Status: GOOD (  23.18  )
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

On Fri, Feb 21, 2025 at 02:19:08PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> AIPS5 is actually AIPSTZ5 as it offers some security-related
> configurations. Since these configurations need to be applied before
> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
> be their parent instead of keeping AIPS5 and adding a child node for
> AIPSTZ5. Also, because of the security configurations, the address space
> of the bus has to be changed to that of the configuration registers.

The orginal 0x30c0_0000..0x31200000 include 0x30df0000, why not map only
config address part in your drivers.

Frank

>
> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
> missing 'power-domains' property. The domain needs to be powered on before
> attempting to configure the security-related registers.
>
> The DT node name is not changed to avoid potential issues with DTs in
> which this node is referenced.
>
> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index e0d3b8cba221..a1d9b834d2da 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1399,11 +1399,13 @@ eqos: ethernet@30bf0000 {
>  			};
>  		};
>
> -		aips5: bus@30c00000 {
> -			compatible = "fsl,aips-bus", "simple-bus";
> -			reg = <0x30c00000 0x400000>;
> +		aips5: bus@30df0000 {
> +			compatible = "fsl,imx8mp-aipstz", "simple-bus";
> +			reg = <0x30df0000 0x10000>;
> +			power-domains = <&pgc_audio>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +			#access-controller-cells = <0>;
>  			ranges;
>
>  			spba-bus@30c00000 {
> --
> 2.34.1
>

