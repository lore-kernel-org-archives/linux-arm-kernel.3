Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6729C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 03:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJyWZC/L2aqfp4YvKRifzxYVv57fndsYGyGDc2rpXNw=; b=rAW7JNhvz4l1xvv71SZoOsYxKS
	q0pCueah3Ff9+a2oRC5wh4hZOEVjPmeOpGO+VXqhStZ5KpUEMRRSKDxd2fCw+qJHc0j3NnZFXWI42
	kWeukJ+Br0g6wthWPdPb0AkFB5Xi0GqS7B2mtHdiEXyXc9zpogfWZhdwInVwqBl0hRpSd13yRTp02
	CtV9d3zrWYgj8h2mFzgAb81Jexl1nrU0XSkaBMDaJACUKK+uBQmAoVXTWb1QdIYNnShXEd7O3rN2L
	myVOTgkakF3c0943hEfECcca2Ym3ZYBVa/MK/VinkUAQFsuueJ0he3O9NqID+xpV8vBdHT3ml/Sqg
	Lyro5h+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1bZH-0000000DiJc-0kcI;
	Wed, 02 Sep 2026 03:23:19 +0000
Received: from mail-japaneastazon11023095.outbound.protection.outlook.com ([52.101.127.95] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1bZE-0000000DiIT-2dKS;
	Wed, 02 Sep 2026 03:23:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdYoGqUqhKqLirVGb1v86WTG+kAu5SSQMDiNley+Us1nufg7xNpJQ8DayR4WOzPibsHTfbWkeiaZXb0Ue5mGWuVGrDHJ0JG12juu7hIt52RS3X7TlG0KG8PW/N4u19b5Gtl+e6B6kUxE0lC8Fl2w00N1lw98gPT7Fj+kjuXQJHGeFZa+QB4LHDtFp50p2N0GmZVygzrdpDVvPtHiPkG1lAlPeRYG03g3xW+JLK6TllHD3F73G3wuhBrkIcyHNMcsF2cmRNOSBHBEtfVWZj/sMRU8DFCguROPghwzlcrBjXxTbxMg+F/l8owx24uGyzOaKg+Hb7LwR9hR3pmo/IIMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJyWZC/L2aqfp4YvKRifzxYVv57fndsYGyGDc2rpXNw=;
 b=R2gcdYyxpB9ih+X39nLxibN93ZzpPE7SOJKBgwEeFunXjyT0Lcoei2dQYaYPHaJctSBsxm4Rg+uxTrPu+0KJJh0r6ASe+UP39zXkBWDsbpqoTAR9Volj1LkqiEpttwgXfMjGnN2btKUjK1RGvmwc5ZBwIORIi2Rz5OIWG8RXW2JRODq+eWSebBzTbx9XPO9lj3HBFxPxNSm+WZQSH12BBnceztcekP3Xmm4gxADx4rI3g88nUuGquvEXmlSqTM3TLmr6BXGGWKLxjq8LZiddJb2teBINtG2zx8+X0amddLbOgJMQtPAjTPlGkJqvhbCjWC/jnjLGowAq2iaSYnzfig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI1PR02CA0056.apcprd02.prod.outlook.com (2603:1096:4:1f5::7) by
 SEZPR06MB6197.apcprd06.prod.outlook.com (2603:1096:101:f3::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Wed, 2 Sep 2026 03:23:11 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:4:1f5:cafe::4) by SI1PR02CA0056.outlook.office365.com
 (2603:1096:4:1f5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 03:23:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 03:23:09 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id EAC8240920E1;
	Wed,  2 Sep 2026 11:23:06 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: krzk@kernel.org
Cc: cix-kernel-upstream@cixtech.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	fugang.duan@cixtech.com,
	gregkh@linuxfoundation.org,
	hongliang.yang@cixtech.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	pawell@cadence.com,
	peter.chen@kernel.org,
	robh@kernel.org,
	rogerq@kernel.org,
	vkoul@kernel.org
Subject: Re: [PATCH v1 1/4] dt-bindings: Add CIX Sky1 USB bindings
Date: Wed,  2 Sep 2026 11:23:06 +0800
Message-ID: <20260902032306.1182941-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <503e87d9-3311-413a-98c0-e02a02c4a354@kernel.org>
References: <503e87d9-3311-413a-98c0-e02a02c4a354@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|SEZPR06MB6197:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d21fa2d8-0b2c-4a1c-e0fb-08df08a18350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|7416014|10067099003|6133799003|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: ePfPXo8cb4KRXRq7UL5GFJkvJgSGCiv9pIod2tB3Kw88//EWQ0LKT6XOnYKIeo+bw7muAAdyMFpvF5+Iuc0ymhw/sIzSPboX2FoVjsljwXV/+LiVsd9tD1NJmaQxCBbGbO6ZIDsq5NFQHGONJnHYuyX10RN1QWMH6r/an9DbZ2OiZqhI2ARz+cdFZzsbM1nJ4QUVu1qCO2GuSF5AcyAs8gEpIpKUVsE+Ewe2R34qrfc5TAuMvUv2J9MvIEpxbHvD1uq+udrBbOOWQviCfc8hOWtdrAanvoLZYDvFQX/JWXdhBCoHhQLc3gEm0NbsOJ3rPV7lfQb9sG7gNJ1VdLGeWZU2FHBa/O0f1tKEWt1X7ORr3x8PMQu7m6Jh+XKGr6rext17eABfw7chYjycwxeEJWl/BVj4iG/q2aEGY1wTzqQFq71s2TXEHVj+CTzhEt8cjOXr6fbHZKu/EMEw5gxmukm2ccj70CPdGznaOId9aGW6ilfgc67o2GqibIlZr6k1Fd3fjYO5sfV0lTj4vhpJtTqeJs/qDdKiqJMjnC6kXhoujFufQKUJn4qB3f6kymH1VUAIPrJSGcAUjFBSq9O/dEiS/vwvs1ui9SYabbt4s1ZRpccjMaqrV8HDg5Mr4bcx6yV8zGFs8C9KX8RqFSLZdg==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(7416014)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yO4ZuF/7bb8tZ3E6q5rd1qaSbV0vaJ30MkC/+E7zDBbQNxpZVZh6eUiRzS4CJ4aB6A5WEuT00jHtznkVj0o8V3pFecIAzgdhmxBwEVU3YE8WKEpermSqtEuYhM46Ab0SkcE3iaRSUYf05QugL7Mpd8Nc76Jm48zFqtE4DmpA8ymCvmxdSze2YUXsJNO4H2e7jiMw/28kmV9QbpQJHo+ZBzQ965IBy38UqctSYPR+QMph+r1ot19l4SsJK2JfHU8+sBqb9CY1S2NJbOiwB3x5IC//rnGhGOR+TSgJIKdBWdJip0I2IykS7vEcHItOU+wC2pvB69HsacB001KC/aGErEdFygV7M3P/vMb9Xe+t1TLt63Ixlk0RV0XUYIpNVC/7zK2ehkqYWy5rsXxMwanTecOXNMuUubpYYUVuJidLFNoO2gnV5666fdXIcvhUyAn4
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 03:23:09.3473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d21fa2d8-0b2c-4a1c-e0fb-08df08a18350
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_202316_677721_EFE70C95 
X-CRM114-Status: GOOD (  25.73  )
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

Hi Krzysztof,

Thank you for the review. Most of the comments are already addressed in
v2 [1]; the remaining points are answered inline below.

[1] https://lore.kernel.org/all/20260902032134.1182634-1-hongliang.yang@cixtech.com/

On 01/09/2026 07:47, Krzysztof Kozlowski wrote:
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23
>
> And do not combine USB patches with other subsystems.

Done in v2: the combined bindings patch is split into separate patches
with "dt-bindings: phy:" and "dt-bindings: usb:" subject prefixes, one
schema per patch, e.g.

  dt-bindings: phy: Add CIX Sky1 USB3 PHY
  dt-bindings: usb: Add CIX Sky1 USBSSP controller

> Please read and follow DTS coding style.

Done in v2: the schemas and the new DTS regions now pass
dt-check-style in strict mode.

> > +unevaluatedProperties: false
>
> Which other schema do you want to reference?

None. Changed to additionalProperties: false in v2.

> > +  reg:
> > +    items:
> > +      - description: AXI property configuration register
> > +      - description: Controller status register
>
> Registers are not address spaces. Devices do not have address spaces of
> one register, so this is not a real device.

I understand the concern, and we looked at this again against the SoC
documentation. These two registers are RCSU (system configuration
unit) registers, but each of them is dedicated to one USB controller
and not shared with any other device:

 - The first register is the controller's Control Register for the AXI
   cache attributes. Its bit fields are awcache[3:0] (bits 3:0) and
   arcache[3:0] (bits 7:4), i.e. the AXI cache attributes of the
   controller's own AXI master interface. The glue driver programs it
   once during initialization.

 - The second register is a status register providing the AXI clock
   valid status the driver polls while enabling the controller.

The two instances submitted in this series illustrate the per-device
offsets: the USB4 controller uses 0x091c0314 (AXI cache attributes)
and 0x091c0400 (status), while USB5 uses 0x091c0324 and 0x091c0410.

The reason they end up in a separate node from the Cadence USBSSP core
is purely physical: on Sky1 the controller's control registers and the
Cadence USBSSP core registers are two disjoint regions in the address
map (e.g. 0x091c0314 vs 0x091d0000 for the USB4 controller). The glue
node therefore describes the Sky1-specific control registers, clocks
and resets, while the core node is the Cadence USBSSP core itself,
describing the actual register windows the cdns3 driver maps
("otg", "xhci", "dev").

That said, the register windows are admittedly tiny, so if you prefer
this modelled differently we are open to suggestions. One alternative
we considered was folding the control register file into the core node
and referencing the Sky1 glue properties from there, but that would
mix the Cadence core registers with Sky1-specific ones and lose the
1:1 mapping to the hardware topology.

> > +      - const: axi_property
>
> axi
>
> > +      - const: controller_status
>
> controller

Renamed in v2 (reg-names = "axi", "controller").

> > +  cix,usb_syscon:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the Sky1 S5 system controller used to program USB mode
> > +      strap controls.
>
> So this is part of that device most likely.

The OTG mode strap bits live in the S5 power-management controller,
which is a separate hardware block shared by several subsystems, so
they are not part of the USB controller's register file. That is why
the strap is accessed through the syscon phandle instead of a reg
entry, while the per-controller registers discussed above stay in the
USB node's own reg.

> > +  axi_bmax_value:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 0x7
> > +    description:
> > +      AXI bus maximum burst length configuration value.

Dropped in v2: the value is fixed for the SoC, so the driver now uses a
compile-time constant and the property is gone.

> > +patternProperties:
> > +  "^usb-controller@[0-9a-f]+$":
>
> Why using completely different names than entire Linux kernel?

Renamed to "usb@..." in v2, matching the cdns,usb3 nodes elsewhere.

> > +    $ref: cdns,usb3.yaml#
> > +    description:
> > +      The Cadence USBSSP core controller node. See cdns,usb3.yaml
> > +      for properties such as dr_mode, maximum-speed, phys, and interrupts.
>
> Redundant description.

Shortened in v2.

Best regards,
Hongliang Yang

