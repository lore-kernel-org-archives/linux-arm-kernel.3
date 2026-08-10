Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F75C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 17:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LZmjn0+XIP8nPeTF0UaBehxust62ipTzSeJByLiShc=; b=qx7jllhfs4UE0WQaTOo6rrd/KU
	9mWkh3ZEJ+uA0/l5Fqnago2NZ0CGgow8oVg6bmoVoPYn/aT7/adULT4XiP+GxJhafHvxfTMbedSHV
	N6Xxdord7lQh24CWwXpBS971TGNQiPIwwILOBvmZj03MebtTv19scOwf3UdArUip+9V1VCb+yup6v
	EB6HT+ClvZbbsZX8iY35oYOog9cTthL/DvKYT/3IVOkqkM04CRBUYTztsM145Al7Eoms4m4wknd39
	U2JmXraAEzfLDs6pCvPKdfacEOqtSlePZf10TEkp0/DjunSDc5cPkB6yHafh1SWz7PLFlk3vbWrjk
	+3tuuSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTQL-0000000CT6O-3Are;
	Mon, 10 Aug 2026 17:04:29 +0000
Received: from mail-northeuropeazon11012022.outbound.protection.outlook.com ([52.101.66.22] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTQJ-0000000CT5g-2grS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 17:04:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ck840dL2av7kEncH53qOG6OqojO2meGFrL6j9NGscTGSl5YNQ1URCVS92AejBJabac8XKLHDR0GOjAeXLcKgGFGcvFEEriZ9eV9tx+UbLTcu5lb7a4rX5g+4gwdzVZX6P1ZGwvnbKwrHi+tGqMaklZlnVnmNG7vjrQ9Q48YE2M+/B5+Cl43N7YHtuyMKC+/3CbinNMlxFXPHlelvo66jTj+DZdPRUhc3+wLmpqOjid70lEuRnbLn8r9obcHQzavLoSAe4/B3MBPKMcb+89aaNgDz3PD+oH7U7AETlAL9QFuqv6Z2SwOucn3vGUBMrVw1e9NSiwJDO9+0Z/5jftbcbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LZmjn0+XIP8nPeTF0UaBehxust62ipTzSeJByLiShc=;
 b=WsQKyuckvANg6VvVK8dwgxyG+ngFYMy0hgwqUvbbd79tDLTDXL1EZgtWxfnmY087mSPtaMKc7WuMK3honAFiusA2QpJUtJsRbj3AKdYegEwKTThUzRmN0w1IYzvVayv/Y/0doC0+uf8pHQCyo8DmUVL5J38Dd75bdcJCrZP9oGv+QvFNYHMCjQouhd+jKzyiP6a3LxZXdwkpGW7PryCWHJ89ZL51x1mVgoVObwc1GzOyIEDdkQv7hGw/YF5NSx9nHxrV2ukGvbMno3n5DhWZmeRfQRtg6KozZUb3eyfzwbt8QIfM5E5FaGlOyz34B7f2WxwtKIsLsrOClsZqxHgzQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LZmjn0+XIP8nPeTF0UaBehxust62ipTzSeJByLiShc=;
 b=Zp3sC22kqbnWegUzmvtm5uxZIQithMfSP9/9WnxEy6E+3qlPAhN0J5Y5HD2zEMuHKqofiB+pz9rt/uDoSh1gCKvBnJ4GYfl4HlyQG42Swe1CwfoJ8Koyk+Elxv2DDb7zzeG3cvKU+leNDCgesXgu3cDPV8R4SbuQFiLgI0CF0ukjE9DWLfC/BmvX7aAhohyn0CuDyljsG6PteasjHRCcFpBn26IpJWfkjcxf34L6rIodUInvL52A1ccqMFVPHUwZmTIF5BcsDjjXNRwQHUSRvdBfzaLT9MtkZjgX0/wpi27mW0/TNvT/R1BFa/N3vXNGW4blB82C6UFqf2Ae/SCy7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10295.eurprd04.prod.outlook.com (2603:10a6:102:447::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 17:04:22 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 17:04:22 +0000
Date: Mon, 10 Aug 2026 12:04:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] ARM: dts: imx7d-colibri-emmc: Add Toradex
 Displays 7" Parallel
Message-ID: <anoEjfZ_0RIfU83u@SMW015318>
References: <20260723105225.194366-1-francesco@dolcini.it>
 <178604616242.431490.2877142775301570674.b4-ty@b4>
 <20260810145346.GB81453@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810145346.GB81453@francesco-nb>
X-ClientProxiedBy: SA9PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:806:21::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10295:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fc3043c-f976-4448-d3a2-08def7016c72
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|23010399003|18002099003|22082099003|10067099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 29Zmo2Cl5j2F0CS/ZbX2OHIP+WzGHniWvavmq9zWwMxVOkmHbP83xA26YpMK+bQhTTVShOIvjVhaR/v5BpAit9w7pggamO+GLcMA/eohQoK9L5/CgslsP14WIsaOdVbTuyrj4/zOpAe7tEwIRtNriKC5s35YsT/OjNII4U7yxmxyu2wMS0BNIXxygUsjVrWFIxCyFJrztq7lpk8gBBIk+qXkGMNDU4lvEXs5htQLNlsjMi9GnaYCkvzN4FuoxpbY0w0Kl+36F/feHXhPmXDVGd+xmAXV8485R3UV/VO331duI/gQFMKILGCuKoP/t1NIiax18KXA5eUWZUpPFygps8omikoTamz9OBBlNTW5fKlC3fIwkl5qX7k7pGkrbnH+eLjQ/hv9eE0NrbjsW+A5IJlIMqAtAqN11buFAuvoPuoJOxPm5yQ//EnGahcAploQOwOeqCeDZdNrmrcna5+avHj7XylGN9EeQs2rleUuUVqA6xeH0JPJccjN98j5sR7GqEFfeEXDKx1XLLrS8GRMaLeuLvgE9uV2lFlyIVZqdYnEcBbfYTqz0mGDkfVux72HsXF35fDgTUUiCgiX3Ft85yBFNb0q2BTA0L3hUxytoKX0YoDBfAOVND2dSeBZ7c/AX7903tsh+LpixxpZ0BLUPTV0JdoNDTupuAWNh/zFXao=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EvNaECHV0HsAV36zp1Rp4oczlZNphBLqjlPIFmoFM5PvrrxSBRh8ZAbV8jWm?=
 =?us-ascii?Q?vMKQ3R0BTwJYHJxNbdHJGVlRUCvY6KAWj95tuZfc1rwiw560rqwxtNyuuR9C?=
 =?us-ascii?Q?Un7vDUAvTUqCjL/PmFzsSNqgWThPAEIeakXzg7L4c87UXYtKbwFsBU301grP?=
 =?us-ascii?Q?D89SlXeqUnrliqE1SJJ0GN7tChNUe/WqG0Nciwh6/7gUxOm+PvkzakiZi0/G?=
 =?us-ascii?Q?keyP1KZz52Pis7hcERYFAndOXHclIDLj+wbPEhpzKNX7C6h7e7t7J9ZVyrtY?=
 =?us-ascii?Q?VTG4MlLUm1c7oprJNI3iLiw1fQ5X3Q32YqER8T0I1fg1KdnAn7wdMRKj5nxd?=
 =?us-ascii?Q?OMlK5aKYvhNbxZ2PrcgsH4yzR0M0otKv3y2RPGbcujMUJMOSj7yGJjD920qx?=
 =?us-ascii?Q?NEt0ezar8rogNxdX4iV88mTyJ0kNBUhv1Ph7wyFqF1MA/GR8xAAoJ9/EuDzt?=
 =?us-ascii?Q?Y7odzfD4TYVQwpAodqwQzqgsrqzd3bqqXjXKlbkKXSlNMJmePd6ly6it4pI5?=
 =?us-ascii?Q?HjFcYl3IsJhFPzN6OA7OPRPv4xeZ8vRFZU/H8Q+HBaGjqI35+4B/otpkR84r?=
 =?us-ascii?Q?YaTJGQdGLUc+V9JSFtdYPQrJo7ArY9ToOpfW1Jochre/r/n6tuEXEDb1rDoV?=
 =?us-ascii?Q?Hsj5yS9Ug6TmbnwWYQSi6MqldRzr6yq2Y8JHXnXgg5dUAQ9sxwlwNN3q8PCA?=
 =?us-ascii?Q?C/zs9k/7sORI7ASuKrhsfwbhlBgwaJ2pMf19o3DYdU3l29CyvOLfO2JIlntK?=
 =?us-ascii?Q?LHGxZEGIjUTzbMvbtRp1F0o3G2XKgEKwtbqmeu5Q/T0FYvGRx8rKuuFCGM5L?=
 =?us-ascii?Q?Pmxk5XRinCEpezz7G8haIeuibTtT6ZMRPvpNW+DUYkCLW051zWqTzTWDPPUe?=
 =?us-ascii?Q?kURzOy2op+RkTGxAMmhGGJxIzZ0Shx0cgg1kMJ+L7bJWoDJN9h/EwrnUiaaA?=
 =?us-ascii?Q?PIz9zpoBmnqnC6QYCEFhbErRSIjebkJyQOfxa9qpZ5TNjZJ7bheMHX6v1igh?=
 =?us-ascii?Q?en1Tn5i8crmnmEPA7kyXQlmCSZKht4z5JFMirhtMIa7hG/G2lJS/cSEr8COk?=
 =?us-ascii?Q?M173OAV8nkoc4lwAyRUi+kgcv7PfR8H/js0rHHSwBYrLqUBkjJNMKHFE27x7?=
 =?us-ascii?Q?m031N8iXl36kqw39vHol99UBMFZZXpXam0UuhvN6UQg3jg43xlQ0ohyaFHe9?=
 =?us-ascii?Q?LWJlhgGhDSiaESEfwrzFA94VYXJvnPJz6c62oBDpffRIKVjhvDB4EmFMbN4I?=
 =?us-ascii?Q?TI22E7S4qZlqgMTVtE2gY89wciAu1rwvDTo1tYTy8vZvEmjSc7SFYu+HfLnn?=
 =?us-ascii?Q?eEtBfbZ9UM6eT8htCLxgCFPe2XJ36Cn6C95PQ0Ow30V0aJPnRf3VyT+z0l8L?=
 =?us-ascii?Q?gtn5FaXMw9VYk1Z0p+tLSshK0XHUo4eU7Sdou9j5ihGusy7GeG1BTkMlsPb4?=
 =?us-ascii?Q?XTO4Hh40xXQ3UYbMkfco2jr1cUjfy8KydG6c3Dxzo2cQ0BPm69OV6OyeZJnE?=
 =?us-ascii?Q?hSb0n7TA+mtn95BLTqXPLsVKsdo0p14t9++7pV636sVRvnkV3P414hBcXqON?=
 =?us-ascii?Q?PDlKWd9P8CytDr/rG8Dr9CaYdRfAGXuwykr2woo9MJoacYSOH2WiNiKvLDbB?=
 =?us-ascii?Q?efG7Qk+KgFnkRJHgpYaNYX+OfahbJveGUYwu+qaZJmvQUSbw38rE4yagYJta?=
 =?us-ascii?Q?jf6pkRaGjegW6Mmj2nPBE0wT9hAApr6bv6yetyNzgaWbyAkhAPaxLjncZVLG?=
 =?us-ascii?Q?e7KT9+AlMbj3fqp04IHNextFk+U9Ncqi6xu3Rj7Bohajf7tcacTq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fc3043c-f976-4448-d3a2-08def7016c72
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 17:04:22.2770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zgnCBvhPPSjwTOfKfhBrJUl/IUK0gTybuNEbPwwrZJxAzIIIpWwdeUVatysHXXJQDH44WtoOzbdJ6+kqAPsmhAk1Z7DSb3oHXezIVRkdALHLW/eiaWPhpWwK1B96f3KB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10295
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_100427_683661_088A3665 
X-CRM114-Status: GOOD (  14.37  )
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

On Mon, Aug 10, 2026 at 04:53:46PM +0200, Francesco Dolcini wrote:
> Hello Frank,
>
> On Thu, Aug 06, 2026 at 03:56:41PM -0400, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> >
> > On Thu, 23 Jul 2026 12:52:16 +0200, Francesco Dolcini wrote:
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > >
> > > This series adds device tree overlays to support the Toradex 7" DPI displays to
> > > the Toradex Colibri iMX7 SoM (eMMC variant).
> > >
> > > Francesco Dolcini (3):
> > >   ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7"
> > >     Parallel
> > >   ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7"
> > >     Parallel with Touch Adapter
> > >   ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display 7"
> > >     Parallel
> > >
> > > [...]
> >
> > Applied to imx/dt-indend, thanks!
>
> What's the status of this? I do not see them in linux-next.

I already sent out pull request for 7.3.  It will be for next version 7.4

I doesn't plan put it into linux-next until 7.3-rc1. It keeps continue
development during merge windows. I hope this ways to improve overall
efficiency.

Frank`

>
> Francesco
>

