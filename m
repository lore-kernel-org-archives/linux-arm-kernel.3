Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117CEC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q2oMaMZ1a6AtRZU2CmskcOYkI9VKf+vgW1uBa82IK2Q=; b=up33Y0XGoZVNFLeKeP53iW47t7
	sY5otSuaX7OsqqqVhVmQRm2SeF0Ddg3Jf9jpThucl5On6klZsFSv7FsbQoyqHK09NunLVl3IifdJv
	oijqVzFVTcEsjZdsS4qINQ7RrjQ1JFPgRunvo6J8eTnF5K7qEo0VT44WX8XtFR0qU72y5sxx0GTsF
	Us+vcgoUDn/woAtREQpmSl5YXyCfP3dO3FEuGOdtyfGFK+gvKElN7+X06OQf2wQ9P1KoJR6qZW0Oh
	FzEfvCHeETBrN4gqgwarvWAJQnsWY+ClRqcA/0ocGvRKokXLYnk7USN6mZH2R9dUPScJD1uZo5aL8
	r5sO2AAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pvA-00000008EXJ-0RCe;
	Tue, 08 Sep 2026 07:07:10 +0000
Received: from mail-northcentralusazon11013044.outbound.protection.outlook.com ([40.107.201.44] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3pv0-00000008ES2-3oLC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 07:07:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWacxt9dMJrTtld7huh0+9hI2SCQCAlDp660eG+8EKddsnceWV8zHtqAYFocc1cOU56IUPRdhfP++/U/kgrf15wh/eeezSwW/oUIF50K8Y+gCDWrk8GA+prhbZWVtLdt8aWNMALHJA9y8daWvAFhMaI2uz0hzfU0MS70W5v8xYwTaiFSHfiX4AOLQ6m+Dxwl5dP41b48sTjA3dCGJ89hge+7odPUkoVr9fYDfIJ66S7l/ievvX4p2potrTcFVFGoniLpuHtgOapG37eXp2qzkSxgb2MOTCNA63Tf3Nv/07hYBtc+P9X2X+iGDwEwUX6lIa1kfmjn68t0CQkhZ/7v0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2oMaMZ1a6AtRZU2CmskcOYkI9VKf+vgW1uBa82IK2Q=;
 b=B3pn8n8o4cCh4GJ+uk85ANlsuJNw+b3WXiUhMq3vO/LbI7UQlsrGP5JHI4I2WZ3FQuPHe8kur19vHHyVjpxu2nc2QIv675AP/ZqR6M2MY0RVJ9J9d3WZnLnQfJ1OOThWddhj2JbOFFqJNU5RWBCJyqM3IOsdnU7C4lyG+nF+/zik3TzgS726clBqFU8vDez3uwGjkx415Z8qH40GznEaCJRod/2L12q9o33g8Bu1AhIDrmS4xtB3fkj6nmpXcL7m5MaHOXRkwxDr+g8LXUg2IB27BciRw5sTt1FBESMIuiWBiOy4JrGESGRW9FLTKKCS+TqGOdODCjKP7NKzv+R4Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q2oMaMZ1a6AtRZU2CmskcOYkI9VKf+vgW1uBa82IK2Q=;
 b=LDjA+OohSoIfnFWDBXgoj1tzAuiT0EjcjNzXXMpaBXpFHqZuzn8YQs8rHS1HtBNEbWB/LZvCzISgsBq6ardyoyTblaX/rqmwbxUFUHgUFf8zmAhLdgJpmTcT36/taF7kFwujJ5gZWbz/c8BAcOg2gOgKs/FUknHeaNoHOeYlZui8w0l7tgvZN2S+nsV7VY4bw1h7umgTB+OqXoMsgwzZCSLpunbHAnNk25g8ZX9s0S3v1na9IOzbkhtdfV4Na0I4c5L0vEkmqDgR83wGGjlxIncS5jH8zpJ5GhUBUvUK/lxkxCikkd6DLZDrTprqjRwFVxuiy8in5+Z53iadM0sU3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by PH0PR03MB6397.namprd03.prod.outlook.com (2603:10b6:510:aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 07:06:52 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 07:06:52 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org,
	maxime.chevallier@bootlin.com
Cc: rmk+kernel@armlinux.org.uk,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/4] Add Agilex5 SoCDK TSN Config2 board support
Date: Tue,  8 Sep 2026 00:05:53 -0700
Message-ID: <20260908070557.3585-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::13) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|PH0PR03MB6397:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1fc4ab-1f30-48a8-5d1c-08df0d77c21f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|10067099003|11063799006|56012099006|3023799007|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info: hljhAtQpNgcExCm3+pVpUzcCmZCI3yjRPfJJhnwq7ZIhcj7GxzdxZWHoemsX4w8L9tcY3TZb2rlufhWi4nN8mjtOSZB6uLMyn8wFwtVyiBuMFHaLwo1h2e6LipKDRt4gjV6qCX0qAhNk/BabwZx8DmCF4lV4wi7kDnEvXpmCnFoF2tVLmJtpvFqgcrzaQnJ1Md3H+zpylrgvVxKqONn/4cI3LlRu54iQTJSfZ5l8nJFsxKPALzPz5u9ZmXVO5YalZXkuZnlXwnsJZEevP+wTwFKZMAtWPkLRE4hMQUD1agW0jlhPdNdXPu5AbWu/gG5rKlxTj74GpNDoQIa80uYO48hkEqMSwtiWthkkGf2gyQjxlc3zZb8wqGIFdWbxd0h1eo91w9R3g7toI/d2+soRudu8XRPyEblNqdO1qi7i30nfWEDXS7y0jBKGKBXSrodG5nFMmwoVR2amKjOqugyQx5Ykjyb4+82k2FFsOhqybBWRv5w0MWjPyXan0wE1fHWQgZpgbPy+6sL40eyDi6rEvV5hpaQN5tRsJjmRogd0GnNFKQwJHpfyeAtcAw0xa2LfQxAvnsaldjSFROwaw8+7az0Oi8zZyockIu4QCh1Vn6XDIbGzGROhqxPM+Uv7Wgb2VsDIv87DtDkip2gai1ic6YBYXNMUbFIfWwJBjWAVyjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(3023799007)(18002099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?291Sr5udvEa8eyZT7pBhPvplBIcv/sETBDasBselxau5ARecItgQ1ZvjdNNs?=
 =?us-ascii?Q?kk11lyD+gdZMLpXyzFK3yxyRcTgriSW6dUpGHXXxaUh6fqQxdcNoGtbxD7O7?=
 =?us-ascii?Q?YCSfXMZCkd7Wcsy770SRYrZcyoe5w1TWQfJ7zcROGK/+Ud6v+gXAnCNrjHYD?=
 =?us-ascii?Q?vzc/H+z3iJIADYFz63upBcWgmeww4eBt3+fafsLv50j2AAPzV+cFePf7HZoA?=
 =?us-ascii?Q?AxyriXfp/zZflRIM/0DL2Eiv5To4RRSX1GmVKAp+d152OZ6T4kfUwPkC+04X?=
 =?us-ascii?Q?iN3yxa6lYUFLAc8iWoF1pR5mdCc3lbAUjLGNMtyvbi++NjrpyKQR2FU0ogJY?=
 =?us-ascii?Q?xXGUwxulHWkwqt0jUQinIPfnGNFHMq8xds3ikNAj6XuHnc3dohdI95fpimaq?=
 =?us-ascii?Q?6IDg2xp3wFzqeR8ao+Oyhmbnv9H95bF8E3Jxf46/LAXbzruv0c+9+oHQwZWf?=
 =?us-ascii?Q?P6dU/DHghpZIGpZdV3iy7cQerWbvvYlDDV01U8fI8GD6Ep40Zrr+ppNLp1J5?=
 =?us-ascii?Q?Wtk7uA6wYmpF0K331W9AH/+wQsfOVz9l9527OiHbwL4eNFQ456ZzYC9HzJO/?=
 =?us-ascii?Q?ic8YkmeJBWA/IIjoa2M7LJp5xdVtPmFWKIqCKz2G86XViY24Bq0vrCNfBfiS?=
 =?us-ascii?Q?nIb2CHQEzUfSALpViS5SEWeMezJvNpIq8WeldM3P87qkhwXQ6ce1+bPEh5lP?=
 =?us-ascii?Q?0hoxYL/+UDXzNK4jAMpyKR39h5dC0WH417Q9Mr1BV2gWRLR6up2ESLyIkTev?=
 =?us-ascii?Q?ooQ4KkrY4RAKlvLjLeqac8Xvx3GTYezn7Rp741CITpiqXzmDXMQcmMHsI1DH?=
 =?us-ascii?Q?lWm3io2XudZn6oPfbYiBaJO6sGuc2EJH5Rvh3vMCYRLXEdeVYhcEd81k0IvT?=
 =?us-ascii?Q?LgsenvQl1C5T/PudgObozY5jyaWT6bT+bl8c/O4Nv6/aR7vHFTwQg2pZ7cmx?=
 =?us-ascii?Q?nhuLc0HUR7hMcrgxyiUFKbv5ikzpV5Xd3ONM5MMLyfzRBSgFEWpsXqyQnFqg?=
 =?us-ascii?Q?huNEV+2fcMxIoFAMLjPKgEcMvQMVUsz/TqM6vNFJccMUNoW4zu1ZNmK3sjCL?=
 =?us-ascii?Q?FcZJm8GNpaLsOeeoAsyyJEbReQcVORp+SCyF4yposEX2qJXzQP7+bENoyw6K?=
 =?us-ascii?Q?deAcbV1+z1YJNcFCc5+CzgLGB7P1RqDJ9pszF1uYWTtNcl/wSbRoj+Q7zi0V?=
 =?us-ascii?Q?AJSMfUNgSYl/whWrWf+iF2oiR3cZsvZziQxKEPX+JefYaT9DfvmtpIiwqI7I?=
 =?us-ascii?Q?UlQt0cdfRyB3G3hD3NY7KCe8jQjtgQw5qQFu+o5tzaSNdr9PoSX+1l5N6LmW?=
 =?us-ascii?Q?8mrI+iUAH3XDdLhfyXV8D10O+MnOszN8AInIBUhjvS2YMZB3G45KklhP4BxH?=
 =?us-ascii?Q?AMxQrU2Ry084qtvo7R6XmuPEXDovPArvujzrkY02XWA4ouDPWfDfqK78ViOP?=
 =?us-ascii?Q?njDb0d+n2zQzLs6TQqk5JEtwLfDUtRQWfqyxUoY/p/lPK/tGKOVJ+RPwIthH?=
 =?us-ascii?Q?rXNQO4Nl9ZS9XfE9edFGB7F2jgU8b+kUImCE7dd4Q7cAKnkZuG+N70LoHIsM?=
 =?us-ascii?Q?Trox5as2j/B1fh++EbsJb3lGybughO9GFTIApE40rqWHZgcDHzer8UNjaery?=
 =?us-ascii?Q?QfeH+CdEFtVkiTjZFVaTgNcEPo9eOvSkFhLepb2CulHIQrXn4wnt+tIht02l?=
 =?us-ascii?Q?sYYmHLGwFadnq8C4eFUZ9rNcE68LR0GW+0ZbOto3J4G6+VkBguvnWphOO5kb?=
 =?us-ascii?Q?FYEDlVsbnzx7OWbaFHjiz7GRQPq+R+qiY2pFzXAtSANkeHrMHSzKFvp3cGPT?=
X-MS-Exchange-AntiSpam-MessageData-1: 6IG58H/ALM6U7Q==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1fc4ab-1f30-48a8-5d1c-08df0d77c21f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 07:06:52.3456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mB6YaCdU08VDfPSgfAcFDUPrf7pMr3o0tuVI/SqPrS0nKpfF0t+ZONcM0HUnqkxsJ49YqGfUdOpwO06kVrzl6c2iibvzIEiUXXLVSZEgeAfH2EK7rwCyT/5dRzY5Zhv4arSMHknV+f75jElljCIn4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6397
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_000658_989239_68DAC5B2 
X-CRM114-Status: GOOD (  13.95  )
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

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

This series adds support for the Intel SoCFPGA Agilex5 SoCDK TSN Config2
board variant, which enables gmac1 as a TSN Ethernet port alongside the
standard gmac2 port.

The TSN port (gmac1) connects to its PHY through a GMII-to-RGMII converter
implemented as FPGA soft IP. This converter provides the RGMII TX/RX clock
delays, requiring the MAC interface selector to be configured for GMII while
the PHY-facing interface is configured as RGMII without delay duplication.

Add altr,socfpga-stmmac-agilex5-tsn for that integration. It is not listed
as a DT fallback of altr,socfpga-stmmac-agilex5 because that port has no such
converter. Patch 4 adds dedicated match .data ops for the required
interface setup.

v6:
  - Put altr,socfpga-stmmac-agilex5-tsn in the same compatible enum as
    altr,socfpga-stmmac-agilex5 in the net binding, per Krzysztof Kozlowski.

v5:
  - Replace of_device_is_compatible() probe check with dedicated
    socfpga_agilex5_tsn_gmac_ops via match .data, per Krzysztof Kozlowski
    and Dinh Nguyen.
  - Drop altr,socfpga-stmmac-agilex5 fallback from the TSN compatible list
    and rewrite the net binding commit message to explain the hardware
    difference, per Krzysztof Kozlowski.

v4:
  - Fix wrong email address in Acked-by tag from Krzysztof Kozlowski on patch 1.
  - Add Reviewed-by from Andrew Lunn on patch 4.

v3:
  - Add missing Acked-by from Krzysztof Kozlowski on patch 1, inadvertently
    dropped in v2.

v2:
  - Replace mac-mode DT property with compatible string-based detection per
    Andrew Lunn's feedback.
  - Use phy-mode = "rgmii-id" to correctly reflect MAC-side delay handling.
  - Rename compatible string to altr,socfpga-stmmac-agilex5-tsn for
    consistency with existing altr,socfpga-stmmac-* compatibles.
  - Fix Makefile indentation reported by Krzysztof Kozlowski.
  - Add DT binding documentation for new net compatible string (new patch).

Nazim Amirul (4):
  dt-bindings: arm: altera: Add Agilex5 SoCDK TSN Config2 board
  arm64: dts: socfpga: agilex5: Add SoCDK TSN Config2 board
  dt-bindings: net: altr,socfpga-stmmac: Add
    altr,socfpga-stmmac-agilex5-tsn compatible
  net: stmmac: dwmac-socfpga: Add support for Agilex5 TSN GMAC with FPGA
    converter

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../bindings/net/altr,socfpga-stmmac.yaml     |   5 +-
 arch/arm64/boot/dts/intel/Makefile            |   1 +
 .../intel/socfpga_agilex5_socdk_tsn_cfg2.dts  | 130 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  23 +-
 5 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_tsn_cfg2.dts

-- 
2.43.7

