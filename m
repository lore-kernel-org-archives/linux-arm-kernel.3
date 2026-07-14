Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD08AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 06:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Subject:Cc:To:References:In-Reply-To:Message-ID:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RBG03HzQlFskiURXJsWH6+SxmK9iT0h5v5faf0HzXF8=; b=Li/DT+nqzhiB3J1y4jASIYmMhE
	J6ptCHNIwoD7SsvJPPzoUP+L7BXHsi52zSUba6Hmep60PdUQJMD1ypIMP0KcXLxrkt+Xd26ov+CJv
	YkR9iH4x2uRS4PXAmNg5OYVmBcUxGRXHQaFiWYC28/bz/6d84RMTb/IcJQB4yab/DFELVpVG4Uqzn
	lJWq5oNAZrMth9tVxA4ZCS0PdAzpJbILMgobwh4mhNf8ejGv1rQXSDpPqPp+fWMcHE3J/4VduoUV9
	Rdm33+YA9qkxbrXbMiumv+ci65ioVEAXhuGrdRtbcFrNs4bltHV2Tgy6CtFwGzeAZC4jFYBQVPx9A
	QbuVKz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjX18-0000000B5m0-389P;
	Tue, 14 Jul 2026 06:53:22 +0000
Received: from mail-westcentralusazolkn19013085.outbound.protection.outlook.com ([52.103.7.85] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjX14-0000000B5lE-2aPo;
	Tue, 14 Jul 2026 06:53:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emxBXgFCfuSlS1HLoWCaegJI46in82jOHl6FQwMZZ32rLAvfz/GEkObu7mzIvja0qZUBSeeuMuh52pY5yDsZ5pKztLYedT3paxA0K5bx6QPpPbsR+ryIwDmWbCo6p0wIghM5Mm54F+/2cED7ryb6Elf7MOa68bXHNBoLCtTnpegDliwop3OQo6rg9NK5XLNTiEIJQamhewCIjWEWTESpXJglJcn6vU89sj/Q455N4hh1tbuImzLWyd95C3FfOcbhbR5jyR0C6ar/uNlAL8WJyQCyV1UbNO9LrDwXfK7TEAA+JCOzsDDYzzY31/Fa1hMUVANCdHBNnHPlocx3vNQRgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBG03HzQlFskiURXJsWH6+SxmK9iT0h5v5faf0HzXF8=;
 b=zQfYWG2HKKUzodXrMRlfB5oAeFJwCH2H/l1bSUM41fUY2pNSq15+zC6Jgk7Nj7rRt+ILtn3JO2Pj3KsxeurVSlOjY+tbDr96cZIq/EzpZV2Cg0804YcED4tvvmW00ck7kkGK29UunU9NVIE5F/66koHxcVagBtogCzRz1jsEzkUlGYwfYYKPeIobEg/0EEHE3Yb92Hi5u+wFxiZlQSSZ2amb2oEEcEzv/9lWHmcAVraPOZAHb/YFe1YDZLNAXbzsHzmDuCu8H3uv4GZ1T4yoEcMht9kY4XR+yD5OOSO8OcjksCS3mYcsw63v+6FhdRHL3bT++nuBq4vIOkbf9fCWgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBG03HzQlFskiURXJsWH6+SxmK9iT0h5v5faf0HzXF8=;
 b=qwqNFWsa+VyFa9i7j3RGtp4RVv7RuWi94nHV622iLlJ8x3hEpOguow6ymBuFqmcbMIZoTjLAezVkKZrBGXxbDQo0oMs3/JykC0A2uHkVsfl4Eala0RHoxLZPRcglHaswxPHzA2rNnZDg85KMJTtGxwUGCjxxf/WFimFoWPACPOMMWbNv0OJn1L+8Ka9VUTVJqW9qzyFffsAfRrYw7jqNy0JMqRUz0VTP9Rif/DGSbswZpYQBUfHWyR2I74V/r/71hbXwy/jZHobEDuFyXXxuVLJjr4BTy6I2QvFypak4POu+7dR2LG7lhlLZq+I5Tlpsp4sc+OAtZhUgpPIa4knIBQ==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by DM6PR19MB4106.namprd19.prod.outlook.com (2603:10b6:5:24e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 06:53:14 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0202.014; Tue, 14 Jul 2026
 06:53:14 +0000
From: Liu Changjie <liucj1228@outlook.com>
Date: Tue, 14 Jul 2026 14:53:20 +0800
Message-ID: <MN0PR19MB60918292CC2D566716815F26ACF92@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB6091C07C729B83E594722E84AC3C2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB6091C07C729B83E594722E84AC3C2@MN0PR19MB6091.namprd19.prod.outlook.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org
Cc: Alexey Charkov <alchark@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: dts: rockchip: Add LCKFB Taishan Pi 3M
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0028.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::17) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID: <1ccb1032b67442119f45687ec62ceeaa.1784012000421017.tspi3m-rockchip-v2-cover@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|DM6PR19MB4106:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc9b1c5-6a4c-44f7-ff21-08dee17493a7
X-Microsoft-Antispam: BCL:0;ARA:14566002|16051099003|5040399003|5072599009|37011999003|23021999003|12121999013|8060799015|15080799012|19110799012|24021099003|51005399006|41001999006|4302099013|3412199025|440099028|26104999009|40105399003|10035399007|3430499035|1602099012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IdvD6xYtMKrgj8wUw3bJucTGiUR1M5Vw+XktXVx7ITFBS1KTctvFRsjAici1?=
 =?us-ascii?Q?KmYR9fbzlQaq//QNLX92Yva9qfJov3uHrfnmi8H1hZ48vjoZ4WlKh5mPKK9g?=
 =?us-ascii?Q?R8JI2p2H713KWuTDd7N46+rV6igqpzuk4mc5Y97KtkYthfu2cgd449y0S+iC?=
 =?us-ascii?Q?3/yojGjct2ParM2kTiqfrlg1HVK9WYxaSa8TuBdd9DGXAmmzKpxC7FSX4hjb?=
 =?us-ascii?Q?xtZxj7StbTrb3dl3lv1qm+YgvIMVWs2aP7P4gO/JPxuvhvnEue+wVPZdSQcx?=
 =?us-ascii?Q?OPb5y5gALc+xoan2tODJweeNDiREcwodR3pmOUke1AQngNLBLnxv6fC2mifW?=
 =?us-ascii?Q?g6uSUpDMqkjmLT5vROR1R6nTwJYIU7cFr6dwKpJ1V5NV3eMc/pZg1hiDsx1I?=
 =?us-ascii?Q?vVj38znPaNAoWPAi5w6VcwnbI3zKhII9ZcDsE9sXjFbyV/5cElDI1MKv2RcF?=
 =?us-ascii?Q?pklkZHAr6qg15Gva7dQTJmwpwvgc6nQ68lIp0crJS14SLb6269J6CBuOsrML?=
 =?us-ascii?Q?jfYTK8rsgE2pwYnyimY3P9bvwMA10JUpFJM/9BrsAvDpAAXMQw2FyjWqBSjy?=
 =?us-ascii?Q?9XsEfhAHCA5JytR7ymZr92hUJcSXc4MMA+WBn6N9yCJMRFHL1d5wK/6xRFuP?=
 =?us-ascii?Q?eSrEdTwXCTQRyTE3PQedmRrdd2xKHOe6ZH/V1HtNElFF+gwAsfRmb9wG9n65?=
 =?us-ascii?Q?1JdnV2Uws/zZf6ds8cOfejNCdp2mmizVlDvj62SCgbLDXFQYli28j0r8xbLx?=
 =?us-ascii?Q?aZuHIcNQ/k26ZT5BxxuUXnxHAcppUqAZLycDh/pbk45hjCS0JvVkpihKsX2b?=
 =?us-ascii?Q?6y2LPDUPp+1cVKjYQE9N/Qx547utTvQsJ7kMdYLNReVYxweHA1Ccd3wBorVK?=
 =?us-ascii?Q?Zh8aPLvhT3zIsyh6prKsOv2hUmmXxwRGsI5h0IApEnKSRhOit5YWX/xwvKtV?=
 =?us-ascii?Q?9YdY/w7pEYxR44Pg7ieWusOuGf085z5JMLEDyL1nsn9qQo3lQZ6O9Kn4LEri?=
 =?us-ascii?Q?XE2UdN9UYO+o6rVdnrT8ba708c0Hkxk6joor4O4O9raqgIuEM6Em4D1vuCiM?=
 =?us-ascii?Q?7tjC0BceyvcyLTF6r6IprMlyAV+Qw10jf0ZuKH+RUXiYAuaf3GE=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yMd7Qmr3b8zKHZyfK3kR9eYboITHOp0ce8kFViXaplQq4/4+Ga0kP8g4XByw?=
 =?us-ascii?Q?BsmVZrWCKPEHrj7GbC8+KqL1ADPOUgat1w4TCNaX1vCOJdAtlOSS0AneGBhl?=
 =?us-ascii?Q?VkjjGtgOAYNpY4cFwRTBXpcCEaSKYlU1m/iAt8yIRnvMvuVCzU4mjgQMM704?=
 =?us-ascii?Q?WvuYiT/u+uwfzYTbW0KAHKQViYYzTTcGa2OQwm0d/vMoejlkgonlCJWIc4io?=
 =?us-ascii?Q?NRjjDD6xpveACy5lb088l6CpxG2Gw10chVDAIIS+CVc2kzTdblwQQdDDItwT?=
 =?us-ascii?Q?SDOrZMtjlbGZ4BmEvK87Oy0Obux46IC3PYNhVL9HuaqeBQFmgbq8Aa7WGrYF?=
 =?us-ascii?Q?F+sksELfIkBdfugeHIGf9Y+mVGdezfwLTjRkqd1ZgEsuH42k7VX8JSjbkgFw?=
 =?us-ascii?Q?QJtn4b63ggYj7GcsACfg5sNGBGyvMUxVf+GXptNeXUAiBWPaxmsYQlLHZMFv?=
 =?us-ascii?Q?fWqEJXhqLTXYqDjGYH4vDQaqtKXMDpj6reB+BpB8X4zc/B9RI8nCDOUJqHsV?=
 =?us-ascii?Q?7NQ/il7OMMEDp9GkV/tJAco/5CSLeoFKke0oGE4yYuxUEdGW/lu7OpSm7pn3?=
 =?us-ascii?Q?RegZ4S5nRCgPNP5V95mEaWBt8vrEbgBLbF8jijs4iSDeuSawCaT/7z0vSZ0U?=
 =?us-ascii?Q?YbbedJRQcwgnCcYei7Eu/FuNJkUL5wfLf3Hq1jarrVZUCoFPP2wn/0aZxuFL?=
 =?us-ascii?Q?3SAqRXQ9p24UsC1COykJALTGMmEavBxXRZZ72RAiqnVfWM8F1DoZVfdUab+X?=
 =?us-ascii?Q?pYPScjteS/Ruc14nGgBzMp/LQLE1H6HloizNRV5jQhGEJJiGgoeeI7BmHPCT?=
 =?us-ascii?Q?gMG7JvauAnWy88RpNFuV0Lj1x+Umnh5scZwO1c2Lqsi927lVRLPc2ZmePwvR?=
 =?us-ascii?Q?I0o0v9wfK9onKMgtJ+As3k87vNQ3JMgiFy0/GIqADUIMfdM9VLOiDGoykMGw?=
 =?us-ascii?Q?6Si3ek/WRbEH4VAhd1n6ICm2hjWD2OHsTA3vP8qEvfNXG9U5kQAKgR3oFHLI?=
 =?us-ascii?Q?iG0yzyh/IaqY6IeIFOKyqOYemDlcV3oktb7n3mwdelDzBaol8glG+H6LREk5?=
 =?us-ascii?Q?BG2vPPITJbPwmVC3rA047tT9g1eJlfwCfTfu7O0eJm6xS4uDfoHjs7NN5v9R?=
 =?us-ascii?Q?mfGVgfV3IIf5b8I2srSemNCjgLihn6QdVdGAKoLRk+JqbWGNMVdocXXFBQgd?=
 =?us-ascii?Q?N3kegfca2pguNgo/5QB4bvc2s5jFvgDrUZPNF/5Nu7CVqfRfU+jT8BNc+kc9?=
 =?us-ascii?Q?nJYCdN1gvo+XS/TLosWOUGII5ONxOo4kQ2yLW6W/yao8unpUGbAbThLaOid4?=
 =?us-ascii?Q?FDE/T+GcIZozn+gDb660CBfRaSoWOkxn7zqg4ixT4cQawA7XRxdHUOkXrhwj?=
 =?us-ascii?Q?ySakF5dn8pUSuh8Gc4vXuKNfj25SVwLWMxumyZ2fIbh5FXBlEA=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc9b1c5-6a4c-44f7-ff21-08dee17493a7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 06:53:14.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_235318_694429_14578727 
X-CRM114-Status: GOOD (  19.62  )
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

Add the compatible and device tree for the LCKFB Taishan Pi 3M, an
RK3576 board. The device tree is based on the published board
schematics and only enables interfaces exercised on the hardware.

This series depends on the separate net-next series:
  [PATCH net-next 0/2] net: phy: Add Maxio MAE0621A support

The Maxio driver is required to select the PHY's 125 MHz CLKOUT for the
RK3576 GMAC reference-clock input. A generic Clause 22 PHY negotiated a
1 Gbit/s link but did not provide a working data path with the PHY's
default CLKOUT configuration.

Changes in v2:
- Rebase from v7.1-rc2 to linux-rockchip for-next commit
  8017cf28e756 ("Merge branch 'v7.3-armsoc/dts64' into for-next").
- Keep the board compatible and Rob Herring's Acked-by on the binding.
- Add the published schematic link to the DTS commit message.
- Correct RK806 rail names and input supplies. Retain PLDO6 because
  VCCA1V8_PLDO6_S3 supplies the RK806 VCCIO pin and must remain on in
  S3. R4 is an unpopulated reserved path to OSC_AVDD1V8 and is not used
  to justify the rail; OSC_AVDD1V8 is supplied from VCC_1V8_PLL_S0
  through populated R3. Drop the bogus HDMI regulator and model the
  FRL level-shifter GPIO on HDMI.
- Add the SARADC recovery key and use VCCA_1V8_PLDO2_S0 as its reference.
- Add HYM8563, its interrupt and 32.768 kHz clock consumers.
- Use VCC_3V3_S0 directly for the SD card, document that SDMMC0_PWREN is
  not connected, and add the eMMC supplies explicitly.
- Add GMAC0 and MAE0621A with RGMII clock input, reset timing and the
  validated 125 MHz CLKOUT setting from the dependent PHY series.
- Describe each USB Type-A connector and its VBUS supply, and remove all
  added DWC3 quirks and the incorrect PHY supply.
- Restrict USB-C to its wired source/host roles, remove sink PDOs and
  VBUS sensing, and use the current connector port graph. Device role
  and DisplayPort Alt Mode are not claimed.
- Add and test the mSATA function of the miniPCIe socket, HDMI video and
  audio, and AP6256 Wi-Fi and Bluetooth.
- Add UART6 RTS/CTS for Bluetooth and remove redundant pinctrl and
  dr_mode properties already supplied by rk3576.dtsi.
- Limit SDIO to the validated 100 MHz SDR104 rate.
- Do not add local FIT boot arguments to the upstream DTS.

The ES8388 analog audio path is deferred because it has not been tested.
The socket's PCIe function is also deferred; this revision only describes
and tests the mSATA wiring selected on this board.

USB validation dependencies and boundaries:
- USB-C source/host tests in both orientations used a validation kernel
  with the 36-patch USBDP cleanup v11 series applied:
  <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>.
  That kernel also carried local validation follow-ups for power-state
  handling, orientation reinitialization and a USB-only state. The board
  DTS itself uses the current, single-port USBDP binding.
- USB 3.0 Type-A tests used the separately proposed linux-phy patch
  "phy: rockchip: naneng-combphy: Set RK3576 USB3 SSC downward", based on
  linux-phy next commit dc59e4fea9d8. A final-stack A/B test changed only
  those five lines: without them the same MD202 failed USB addressing with
  error -71; with them it enumerated at 5 Gbit/s and completed the 64 MiB
  read/write test used for board validation. USB 2.0 did not depend on it.
- A new 1 GiB stress test exposed SuperSpeed resets and I/O timeouts with
  the RTL9210-based MD202 even after the SSC-direction fix. The USB 3.0
  claim is therefore limited to the enumerating and 64 MiB functional test
  above; sustained-I/O stability with this enclosure is not claimed.

Hardware tests:
- eMMC HS400ES, SD card read/write, and read-only mSATA access
- HYM8563 raw I2C register access and recovery-key input events
- 1GbE ping, bidirectional iperf3, link unplug/replug and reboot
- USB 2.0 Type-A storage; USB 3.0 Type-A 5 Gbit/s enumeration and 64 MiB
  storage I/O; USB-C host with the validation dependencies described above
- HDMI 1080p video capture and stereo audio capture
- AP6256 2.4/5 GHz scan, WPA2 association, ping and bidirectional
  throughput; Bluetooth firmware load and HCI bring-up. Active discovery
  was additionally exercised during bring-up.
- UART0 and a normal reboot with no panic, oops, SError or storage error

Static tests:
- git diff --check
- dt_binding_check with dtschema 2026.6
- CHECK_DTBS=y and W=1 Image, modules and target DTB builds with GCC 10.3
- checkpatch.pl and a fresh five-patch git-am check with both dependencies

The board series by itself produces an expected dtbs_check warning for
maxio,clk-out-frequency-hz until the dependent Maxio binding is applied.
On the combined tree, the only remaining target-DTB message is the
pre-existing missing schema for rockchip,rk3576-edp.

Link: https://lore.kernel.org/r/MN0PR19MB6091C07C729B83E594722E84AC3C2@MN0PR19MB6091.namprd19.prod.outlook.com [v1 1/2]
Link: https://lore.kernel.org/r/MN0PR19MB6091AA2B594F0E026518E884AC3C2@MN0PR19MB6091.namprd19.prod.outlook.com [v1 2/2]
Link: https://lore.kernel.org/r/CABjd4YzNQCwtxz+v474vrS0fCO2AZz+bNCQ+4F5afTeAUpad7A@mail.gmail.com [review]
Link: https://lore.kernel.org/r/MN0PR19MB609171877109E10553B5DB5EACF92@MN0PR19MB6091.namprd19.prod.outlook.com [COMBPHY dependency]
Link: https://lore.kernel.org/r/MN0PR19MB6091CD5A84D2DA5DACF434DAACF92@MN0PR19MB6091.namprd19.prod.outlook.com [Maxio PHY dependency]

Liu Changjie (2):
  dt-bindings: arm: rockchip: Add LCKFB Taishan Pi 3M
  arm64: dts: rockchip: Add LCKFB Taishan Pi 3M

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-lckfb-tspi-3m.dts     | 984 ++++++++++++++++++
 3 files changed, 990 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts


base-commit: 8017cf28e756cd0f6988706b5d33bdf4eccf4844
-- 
2.55.0

