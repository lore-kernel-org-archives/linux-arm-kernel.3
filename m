Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B431ACD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 10:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zp67MF0qA+HRNDIwAXgFJZA7RWBkR3JIocNaEiub2g=; b=gsAIaXlA9vBYbqYtp/YCVr3n0C
	vXra4KrPPfHPNiwED+vaokMUH2KBA/usA7hu6e36WljmTffj1hLBS+t5RkSHTBqNmcL4tVa3qz3Ai
	yr1TjrFAjvzh5ZBZRu/46fpnxPmIl+d+/9AyKnV6Alty0eu/DN+2PgMzzZagPV+4x5JMwguUU9txi
	Rd8ErO4SNVqY4sZytsqfkPwzSayEq/MHliXTGUyma9p901dFSJ3yME71UotNdnOsjIT6HVd94c/Gq
	2R4Tnih4kukmj07XxLWFX/HgMlfm1rBniTJ1JT42Cn0p84m4JOGKtusXw/11oE1jHWT1FTMFXF23b
	0kJqoBvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpjT-00000008235-2y7t;
	Fri, 15 May 2026 10:25:28 +0000
Received: from mail-japaneastazon11023104.outbound.protection.outlook.com ([52.101.127.104] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNpjP-0000000821k-30X3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 10:25:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTMlY7mjpmc/5Cdo+yRZ4GZbiWoHUxLncp+LScGI5FMyv1d4VTuhdd4xMAiZAJHCElAGbjGqkT3bV36Fy6UT8+4dQEPbCShxBXKKsPm83iuSQUk7Gfce9+7Mb/k+4lR5D8rRtU0eIBEko7o9mDyBwI6XajaWMQ/6viL1ke0FEB4tSN6N+R6SplBl8/DXzzXICdHNHCR2dMuSoLZ3RSmaW1E5MdTZH5oklk+OUMWQ1ZmvD16/cpwFjB6FttFydX5CoLGjm743236L2b1egRqfJPnpsZazpamLRF7eruHhPPkfO157etF6jm6I0xaHRrBuDNcm8UiLCB7WDIQfbI8bMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zp67MF0qA+HRNDIwAXgFJZA7RWBkR3JIocNaEiub2g=;
 b=pqNtIxXn4wwfEN1gYPgg1b7srmI24oMpbMyjh9I7rUpwuaz5QSbOSfAg1yHTAjYcCf20Vwshot+g9OEA9Cn3yLJiJS8Kgf3+h5AUi07s5fRlo8AAH+JiGD63cRVdbcrVwtlMaIF5Xsl6XNiUZTZ+lffc1AoFEV6oW2fqIhbX5IxNMlhfduTpp1g7RbnNYy8+RzXPWzr1zYDdkJUgd950r0BpAPEZqr4pgQJN3TTBXRa4ix5zBsy+UvgDhMeSqA2gn8HqsFrxvGPJlviTcsabpJi4IrV4SGlon9ah2O3VWH3R9Uo8DviXQXFl910zGdr1OZv9gXV43gCs5Bd5Sk5D3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arndb.de smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR02CA0037.apcprd02.prod.outlook.com (2603:1096:300:59::25)
 by OS8PR06MB7324.apcprd06.prod.outlook.com (2603:1096:604:28b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 10:25:13 +0000
Received: from OSA0EPF000000CD.apcprd02.prod.outlook.com
 (2603:1096:300:59:cafe::bd) by PS2PR02CA0037.outlook.office365.com
 (2603:1096:300:59::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.13 via Frontend Transport; Fri,
 15 May 2026 10:25:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CD.mail.protection.outlook.com (10.167.240.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 10:25:11 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E5E4F4126F80;
	Fri, 15 May 2026 18:25:10 +0800 (CST)
Date: Fri, 15 May 2026 18:25:09 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, pawell@cadence.com, rogerq@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org, arnd@arndb.de
Subject: Re: [PATCH 3/4] dt-bindings: usb: add CIX Sky1 Cadence USB3
 controller
Message-ID: <agb0he7vvbqSIym5@nchen-desktop>
References: <20260511024244.981941-1-peter.chen@cixtech.com>
 <20260511024244.981941-4-peter.chen@cixtech.com>
 <20260515-dynamic-archetypal-reindeer-dc6dd5@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515-dynamic-archetypal-reindeer-dc6dd5@quoll>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CD:EE_|OS8PR06MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b45c61e-3c23-4964-6a96-08deb26c3f53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|7416014|1800799024|376014|4143699003|18002099003|22082099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: SgztvcBHzBuR+P8Bnx447nU1Z+Q/sr5i4VNWpHSmWQZNFn/Thmo5ygT79wVyz1WPBqvzgVQREvCgbcNcgFJ7orFTQxBLxZrY7VMSegh2hlere7kBircOvr5ad7/S1ZOmtPnH1e8lacofzLmEqJqY+l+RnwvvCdrQ/5jkGf/ylE3SFkZiPvAsOQbRMUS8H53R6ZJBh1iw2PqsU7CtBnN4BM3a0aYI9RHb/yX9fMKQ59tlZ+XJZCkwviHY5a1KcYOX6TTaCiD7MB2Weg+KEyFnxQt5fru20hogFNtLZy1FGEVKwy0rPXkESlJCZfD0BIHlQRNJr52jQky4foeaYDLPzV9sj81387R7o57unhhQVPVtwlbUMI1wAmedHUwQ29nFk5hUZ86RDqI/hBGt8AyQOhFz+CZRUuh7OU3RBeaA3EieQkeTkM0fsFuzrzA99bAZrGC5lkIfzjDbrghFw73muESKsn1ojGl4wKsXJlFpeUND13Xlo4pR3DRPszLkblH4wCoHxupsX0sGo36LNbljUp/es5XONmsFt09WK5yFE6dPCdwavAI+EoiWDErHm98vybBMCg9uMCmhPUJvNSvsSt8r7yNk46vOEYFZnBbU8eyTsxSY9rrcy0+twlV+F3gFJheTNAI3nIfqid16msFn/3SgjmYWm3r3vqk/NnYtINLmPGn2UqjIzYzXKcUlbaVEseaiFpodYIjiG2TeEimQSXAP8M94MdZeUIhTNts+rKU=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(1800799024)(376014)(4143699003)(18002099003)(22082099003)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UKZg6nyDGfS+exr+DlMZhojIPloRYtKkW1ZloFGGgrw+8BEGU3I2S5PB9Wquskk7BryGnTiqHfwGMdx6it7z9T47b7mCXPO7Rp3ZAPe2TZ2MRUhpBYaeFtth5n7eHiK4vfbDRz5KLO/oGxyNB9DMV3ZCVCmwFUtNeD7gQe/rcniIhktygSIG3JmN7Vm6iQST3Ri6c0+F+Gp55TnQE7Za0Rilxb/t5+wR8UjKbR7TxSNCVn0mria5eWOf3r/oCjo8R5rUZMNSAXjZGaF0nTk3FwmEj+X7qw0gwC3d24X2eNlwhrSsosFhpcF1Pp5dWN1Jh/SgDsBfJa+08eqDu+MwoDkbC0OOMsjxNX4ZriHR5LvbR4xZpRyniR4PH574c39WcWWTvgTBki+lGlb4g/gTMRJ7O3Vs3QnQTDDTe+W4j8m/QXK1j/rFGZD6QmIoT2hN
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 10:25:11.8203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b45c61e-3c23-4964-6a96-08deb26c3f53
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CD.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS8PR06MB7324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_032523_768313_908F1978 
X-CRM114-Status: GOOD (  25.63  )
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

On 26-05-15 09:54:10, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL
> 
> On Mon, May 11, 2026 at 10:42:43AM +0800, Peter Chen wrote:
> > Add a binding for the CIX Sky1 integration of the Cadence USBSSP DRD
> > controller. The schema documents the glue register window, clocks,
> > resets, interrupts and S5 system controller phandle.
> >
> > Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> > ---
> >  .../bindings/usb/cix,sky1-cdns3.yaml          | 151 ++++++++++++++++++
> 
> Why are you mixing USB patches with DTS in one patchset? Don't.

In this series, the 1st patch is the IP core driver changes (export APIs for glue layer
use), and the second glue layer patch is the user for new adding APIs.
Normally, we combine dt-binding, driver (glue layer) and DTS changes at one patch series.

It is much like below submission:

https://lore.kernel.org/all/20250318-dwc3-refactor-v5-0-90ea6e5b3ba4@oss.qualcomm.com/

> 
> >  1 file changed, 151 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml b/Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml
> > new file mode 100644
> > index 000000000000..23d82d8cc9bc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/cix,sky1-cdns3.yaml
> 
> Complete mess of filename. There is no such compatible.

Will rename to cix,sky1-usb3.yaml matching the compatible in v2.
 
> 
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: cix,sky1-usb3
> > +      - const: cix,cdns-usb3
> 
> I don't understand the fallback compatible. You claim this device is
> called EXACTLY like vendor cdns? Nope, you SoC specific compatibles.

The intent was to express "this is a Cadence USB3 IP integrated on a CIX
SoC" but "cix,cdns-usb3" is wrong. Will drop the fallback compatible in
v2, and there is only one compatible here.
> 
> 
> > +
> > +  reg:
> > +    items:
> > +      - description: OTG controller registers
> > +      - description: Device controller registers
> > +      - description: XHCI host controller registers
> > +      - description: Sky1 USB glue registers
> > +
> > +  reg-names:
> > +    items:
> > +      - const: otg
> > +      - const: dev
> > +      - const: xhci
> 
> Wrong order, look at cdns,usb3 schema.

Right, will reorder to match cdns,usb3: otg, xhci, dev in v2.

> 
> > +      - const: glue
> > +
> > +  interrupts:
> > +    items:
> > +      - description: XHCI host controller interrupt
> > +      - description: Device controller interrupt
> > +      - description: OTG/DRD controller interrupt
> > +      - description: Wakeup interrupt
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: host
> > +      - const: peripheral
> > +      - const: otg
> > +      - const: wakeup
> > +
> > +  clocks:
> > +    items:
> > +      - description: Start-of-frame clock
> > +      - description: AXI bus clock
> > +      - description: Low-power mode clock
> > +      - description: APB register interface clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: sof
> > +      - const: aclk
> > +      - const: lpm
> > +      - const: pclk
> > +
> > +  resets:
> > +    items:
> > +      - description: APB register reset
> > +      - description: Controller reset
> > +
> > +  reset-names:
> > +    items:
> > +      - const: prst
> 
> apb
> 
> > +      - const: rst
> 
> controller or core

Will rename to: prst -> apb, rst -> core.

> 
> > +
> > +  cix,syscon-usb:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      Phandle to the Sky1 S5 system controller used to program USB mode
> > +      strap controls.
> > +
> > +  dma-coherent: true
> > +
> > +  maximum-speed:
> > +    enum: [super-speed-plus, super-speed, high-speed, full-speed]
> 
> Why isn't this deducible from the compatible?

It is the common compatible (Documentation/devicetree/bindings/usb/usb.yaml)
I will delete it, and add $ref: usb.yaml#.

> 
> > +
> > +  phys:
> > +    minItems: 1
> > +    maxItems: 2
> 
> No, this is not flexible.

At Sky1 SoC, some USB controllers connect to both USB3 and USB2 PHYs, the others
only connect USB2 PHY for dedicated USB2-only port.

> 
> > +
> > +  phy-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      anyOf:
> > +        - const: cdns3,usb2-phy
> > +        - const: cdns3,usb3-phy
> 
> Drop all this and define standard names.

Will use standard names: usb2-phy, usb3-phy in v2.

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - reg-names
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - clock-names
> > +  - resets
> > +  - reset-names
> > +  - cix,syscon-usb
> 
> phys should be required, no?

Yes, will add phys and phy-names to required in v2.

-- 

Best regards,
Peter

