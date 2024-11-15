Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90193D6A225
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 02:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuH6SdsI0iVESsQQGkSarzpT9ac8i9sOQ7ecig7TDkw=; b=LSrq8PIbb71QuS0onExobmdxbb
	fFxZvkFpHZYFknuV6rc2+GnbnHKbLyrbrspUv6v3ro2I/gkODLJd8/GfVGI15M60hc0pm8BOd9auB
	HUxz+9ZbFMfw63vOnlvKIVB/tUmyuG5zc/PTElrZKSm0pVpI1+UYIZiY0QbFr4WjwSA8U3bINDdwA
	DMqy+2LYUBMsFwz4GX5rQxQfJUm92Itu8bm1+aZddoZl2VZgVHkAtpAU5gYqbs5kFhKwmPAMbhZj0
	m6ScLgTJA6muzU/cQKQOoIbGDRizpaDt3PGTjSj3K25sDW+x1vBidTlKDqh+DaiygVgdLV2jPKKu0
	XlSzwkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBlgw-00000001Mel-24GR;
	Fri, 15 Nov 2024 02:04:10 +0000
Received: from mail-vi1eur05on2060d.outbound.protection.outlook.com ([2a01:111:f403:2613::60d] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBlg0-00000001MaW-39O2;
	Fri, 15 Nov 2024 02:03:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JEUo1+4N5MgXlc6qMDzZQB1Dve7FUEa/BUM3Jk7fRoLRP80l4mIfEBBIuSqpG4EsC4EQvVKX4///ppOIz/bodtfDYr5tkDQGOiZlEe/ux1hqSZSAlutHfSxVCWXd9WMG1lMbnxfzgDXWGPuiYLZmZZLygmW3FafHFagbmctjuU8xD/Xm+30T07IsDDJKWKWqeyHEzGZy9wQDaqqRlAFxzO1TyqwnEmQA3Te6Rnbws1dDNhPe02FkFHz/r4FrqOCl++TZw6qOQYT9h0U1k3ULaSRORKRIBTkreNLqmugf9VqEi0mhC4LD0J2MOwiTNQeH47ANV+xLFws3/vSquO4nYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuH6SdsI0iVESsQQGkSarzpT9ac8i9sOQ7ecig7TDkw=;
 b=WhGdlpu5V143ioSS5QQ4PW9RF9pvUmMv1KWWToZnaTYucIYPFjhe3nVreExeaxWLCKAYBQ5F/GfK5SLXTAp1rIWANdw025PeSu7WfPQcQ1U5fGs+cUsbdpE66ZoxYVnNC0ACwJa4b+7rIfhWBjgjSwZI8CpYZYVNpCh7gM/r9JqwAhp8P1xF8X+g6kXUy2oahfsQqUcqezLt6YLqc0PD9dZejIgdp1mXqAJ9st+V6+FEPZ23eGzr3d8YGiPcjSstXTL3NPpP9fnx/AXkuhL+uTOAeTLoGfzLUPzGYdbwk9yHJNfRdwveOafIj1xWzUfWjjNU+zi5KAaQBDYi672jPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuH6SdsI0iVESsQQGkSarzpT9ac8i9sOQ7ecig7TDkw=;
 b=gA9nSX/abaehiRw+FHO/XLnlA+G1o1EzUY6gsySe/4w6mxKBZmdUGn8vidtrhHgWpaJDtMaknadsOj53EzzHvwvJ31EpPoCyt/1uYDVsloIm0K3b2WTBp9T7lWKY1tcSai/+SVi3rFoeXvh+igoyTHQ8faQS8IayxYggKPyS6q4vjqDgvF2efHA4YiZwSBKdIY0kcAliVi6+M3KA7Mc50W2EGrngDlKmqaQbcb96c2yNrstXb0HEGGDG9iCFjfJhtxBTs0ByZDnMWSaV4eC3A6ac81B0L0zR9hf3PuGvikTwYw4i+TQjOmyeA0lZhCrNcD/yLodan5P8uAPx3vAhFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by PA2PR04MB10132.eurprd04.prod.outlook.com (2603:10a6:102:407::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Fri, 15 Nov
 2024 02:03:05 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8158.017; Fri, 15 Nov 2024
 02:03:04 +0000
Date: Fri, 15 Nov 2024 10:00:45 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Conor Dooley <conor@kernel.org>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	jun.li@nxp.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: imx8mq-usb: optionally refer to
 usb-switch.yaml
Message-ID: <20241115020045.qlrkyrelpgdwpxxk@hippo>
References: <20241114102203.4065533-1-xu.yang_2@nxp.com>
 <20241114-marmalade-bottling-8fe656515ee7@spud>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114-marmalade-bottling-8fe656515ee7@spud>
X-ClientProxiedBy: SI2PR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:4:197::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|PA2PR04MB10132:EE_
X-MS-Office365-Filtering-Correlation-Id: 8534a2c5-e7fc-47d6-dca2-08dd0519a441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5sG9j1lKZx5RaZvQfaI8GZX0prZ8xPBdb5nPheB7sEnFmspI/EowTYz/yKDC?=
 =?us-ascii?Q?nFZFqZo6D0/NoTFrK1/LZjvXQTpDKWc52b4uurPkFlHqa0KbIofZz1M2agNf?=
 =?us-ascii?Q?BUVEcV8ZPjPNRuaFk72AJsZ/PW3yglJFhq+M522utF69GnF7ytQ5uSwylwpS?=
 =?us-ascii?Q?ay5gJvmU23A4379SOfdvZztu1a9hiOsO5YS0APhBS6n9HZkh48KNJyp1vy/+?=
 =?us-ascii?Q?GLZ7SqNXnoZmGlVoo132b9kD7Oz/kxEoS+rUFz4XFcmGqW4g0/SuRTygQkiX?=
 =?us-ascii?Q?gL3Vcc+IUh2IaaUpW3M0vPtbiFcCyA/GKWC0NSIKMe+2IzlJhvBkV0K1gMc/?=
 =?us-ascii?Q?JtGE5ifrC8ReFnN/0qstFQtX/nyZwnZz+1Hv1NhWBbatfyB8tGUUn8DIL3gG?=
 =?us-ascii?Q?ADQy3H1qIjvsX/v8S+DdVf2AVPQ17IZxfzAOCxZTdmVJ3g+4nrTkOSsF2Rls?=
 =?us-ascii?Q?WiuTXCrQz5D5HNtTOX9SjjZ9l0M+J3IEiaW3ZpqwJAGwMwNa2qU6gMp4twU+?=
 =?us-ascii?Q?4iSb7G6HVoS/es01d92rRJbg4TIu6NH38SFthK0a85v5fRt7NLV3r2HlL95e?=
 =?us-ascii?Q?8/fxUce09mKM953bbiRzSwjJ37+fvvcSpZHv81kLylGe7g+eioH6amI2AzH+?=
 =?us-ascii?Q?Hg04M3cgqCMFKZQcRtWwL0DfwZ0sHldDNgwBXXoPhBNLOMaaELo1CfX4p14B?=
 =?us-ascii?Q?VlV9drreEqQAbAsHi9wyICi++N73RyYa/MJP/1VEU/DQ5SJ5PzL7fxQKH1dG?=
 =?us-ascii?Q?0VSpiEqmrf+Jpw2N94h2BLN11hWvJ7TSExd+1mVIyzljXNRb00pBQCUmI2N1?=
 =?us-ascii?Q?i7ohhdK0Ow7c50yP3bj8CKGO6qOxS1FoGZ1X1F9DLmBEBuJ9luAezUv6GH16?=
 =?us-ascii?Q?iW5Hq77q7r5ZlAeM4EiIUpkI6JfZrGTYmaDFzTayT3Fof+TfUw6BSQ7DoWlY?=
 =?us-ascii?Q?h4jBdhBYi6WKaXgz3M5v8JEf/gNBUdEId5MYoAroLGuoUkOFRcU2fJAAnpuv?=
 =?us-ascii?Q?qnx/B6vM7ofVqmiibGyUykxmM6dA2DxyM8VZetYcQGmn663PrbGuZzeIqCr6?=
 =?us-ascii?Q?QKbIahMJCBT2dpNzImy/I3fWabkOmOVWL2ZQ53ep3f/2nfHSXlFaPDU5hNoF?=
 =?us-ascii?Q?+CU7NwWO85q9LiN3YP/2nCfmVTV05SH4l/rWLkjUO8UuP8tWOoeO7Eg5Oc2X?=
 =?us-ascii?Q?G6j+L29fw/9NvmPn31GFmg6AB7dr2iftXHbLK8VNU6gGngNVS6APziPSfBj6?=
 =?us-ascii?Q?nYeg3psKrGO6KPEb9pF5s4g0B3sFCj4u0UlSmoEYa54MY5J0wX/yIIuxXn5v?=
 =?us-ascii?Q?yEF/hYY6Zzg8y+uRjcH0QGIO1TMKb025x8NBTns7m7iRjX17VGDitBj0Ee+u?=
 =?us-ascii?Q?QjwVui6PQGW76KddbMNkIUmXvvFb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VJR0PchuEt5O+w9HfDtpGUaqATN+cfpj8OJ+lv4a/cMfViWgZbFggHwMastQ?=
 =?us-ascii?Q?w7Z5Vs+jC/S1uyDfoKRJeF2Mu6JGglI/PKfuBg9oHaitQA8f+LyrpPxkjafg?=
 =?us-ascii?Q?N1wFd1m8Aw8tLOFP2163Qr+hxJR5Bk79HXCteVMaEjG9n0inx86XDlshslhH?=
 =?us-ascii?Q?TJeNOjT/VW56ctw1pTILKiiL7D17H0iYf5k900ELoA3NsCJ6FcyWdyFZgjnT?=
 =?us-ascii?Q?rd/IDZrIN9Qeb7FO9ZMULp0bl/m2eQ2hNcgKTG8SsWjoRLe5q3lvZt9uO3Mx?=
 =?us-ascii?Q?42eXEhDQBOseXAVqHFTu5SNtSUM+D6t30Wn2PNXyz3NonJww17X8F+hGzpTW?=
 =?us-ascii?Q?imWsLFKq/zDkRPC6xsQ5+wX3yRBHMliekLV8ltfG749Xo5YV+2MEKbR3uz7W?=
 =?us-ascii?Q?g0jviGiUxz49WwLRG8BwunPaO5f4C6r5YbdthM3jkMK4whIG15dITjllUFj7?=
 =?us-ascii?Q?PDTtFVMlHOpwwSreTDtHnxyh4iaNP7Y6YyemMHpPrmSnMLU4zp+KwuFmm8vp?=
 =?us-ascii?Q?3fSuxhF9HqqKYw0CL9R/wQ/lAjohIxfFwKlkbwiLaagVRWaUpJNjnMZvdrXV?=
 =?us-ascii?Q?kNENx3i0tO3H5fsTcNbvFW1/f28qOAtKuTWVW6NWBNkugK0Fq51s/XOePupX?=
 =?us-ascii?Q?wOYWsGw9S1T/oa9AAq5rBhJzrbmn1a4VuEEtfI3jKr5FJnLdjfcTG+CFsZQt?=
 =?us-ascii?Q?9Ur58zQIFqtZwzt0e5p8VE/++6Y3tHLP3OJYKfCYyi6LKLET6gPQik/VH7BN?=
 =?us-ascii?Q?adoCoSQK5pcvqwWzHMVPox2pHJXXrn6l088HY0/pYzvzqKmUNPHSTIudSLfn?=
 =?us-ascii?Q?sQyKBBVwe8j3O7mAuTVKusI/Wu3kDL5D3jRay3zFJRWomWP0rCxrKFqE2gk1?=
 =?us-ascii?Q?UvN/nhPpmPcItk5Z+EmdYunohoWBFJmy8QkZzYPf8B+wEjqypxZ08n+ldkL0?=
 =?us-ascii?Q?tvxAdRnnzyoY/eU4uZQj1UTGABBOKUxtumfZp8aVQH6Actdy60+v5pwxFqGs?=
 =?us-ascii?Q?BPcW00CWHdKWovGUmGaou4Ss5cQQ0hflm14pRP/cYa4x8LESBu5KJ/6phExV?=
 =?us-ascii?Q?CdtPZaJCINCQ/jtwSxvJtpltXSsBZPI9BvaTV0p7HTNHjlctk2MzygwOgIT3?=
 =?us-ascii?Q?nd6yMj4IzHEDkYOOeCp1vHewEOdZXmNfV/cLxxiiHpkieQAQz+wQ4fx2nNoW?=
 =?us-ascii?Q?1TzXUALHzVNgDCeoJqAqbkBaLgaSyVD89pVPh9g56PjWyL7mRFHiLXvpHXq/?=
 =?us-ascii?Q?4htSQ4npO//bt+loFCrZAHh14bwjN3EWyWnxpxekZ6QZeouzOQdD4E9VPY8x?=
 =?us-ascii?Q?b4pkiVHnlZGODY9L09J7++zvQ6Nnibof0itq9WuaA5RgAB+50OcrdNex8JVl?=
 =?us-ascii?Q?LYeYtuNZV2SYnkB1KkioraEwMM1zLkiEUZ/1CC9mTW8hglEfK5I6ZctveuS3?=
 =?us-ascii?Q?6P7x8I+Uu8HwDkEV0caIvMooOSrVFIBq5sjPGht/AvDTORML7foZtQMuDFwk?=
 =?us-ascii?Q?uK/hLvmenh4GiGlTSJk+BOA12zCPbx4g9nb710us4KNvfT3R5DTf7s1t0yYC?=
 =?us-ascii?Q?sefiNrclITB6sZvIf3o1ZVoW/a0GZ0f9hR+MkQcy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8534a2c5-e7fc-47d6-dca2-08dd0519a441
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 02:03:04.9348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HKKq+3LkqinCEwB/sP5brXWgseKDmgghsf4hPgTh7H43p4Yqf0jnBlRzqYIX7t537FGEh2thLbEsmALSDL96fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_180312_868931_829A7F15 
X-CRM114-Status: GOOD (  20.08  )
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

Hi Conor,

On Thu, Nov 14, 2024 at 05:45:07PM +0000, Conor Dooley wrote:
> On Thu, Nov 14, 2024 at 06:22:03PM +0800, Xu Yang wrote:
> > The i.MX95 usb-phy can work with or without orientation-switch. With
> > current setting, if usb-phy works without orientation-switch, the
> > dt-schema check will show below error:
> > 
> > phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
> >         'port' is a required property
> >         'ports' is a required property
> >         from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#
> > 
> > This will add a condition to optionally refer to usb-switch.yaml.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> $subject is not what the patch does.

I look through other yaml and find below format could achieve the
restriction on one property:

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/tree/Documentation/devicetree/bindings/usb/gpio-sbu-mux.yaml?h=usb-testing#n54

  - if:
      required:
        - mode-switch
    then:
      required:
        - enable-gpios

If mode-switch is present, then enable-gpios is required. If not, then
enable-gpios is not required.

For my case, if compatible contains "fsl,imx95-usb-phy" and orientation-switch
is present, then this schema needs to refer to usb-switch.yaml. If not. then
this schema will not refer to usb-switch.yaml. So the subject could reflect
the thing this patch does.

Is this feasible? If not, could you give some advices? 

Thanks,
Xu Yang

> 
> > ---
> >  Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > index 6d6d211883ae..1238792157f8 100644
> > --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> > @@ -118,6 +118,8 @@ allOf:
> >            contains:
> >              enum:
> >                - fsl,imx95-usb-phy
> > +      required:
> > +        - orientation-switch
> >      then:
> >        $ref: /schemas/usb/usb-switch.yaml#
> >  
> > -- 
> > 2.34.1
> > 



