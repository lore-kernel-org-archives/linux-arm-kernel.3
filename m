Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035AAF4368D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YSnNGEQc82xSVE7hS0vM3RU6y1qTbAkWRgL0yv3iCL0=; b=nXtiziHKHEVLDEOqkLagVwypMQ
	aGDsz2PutBwMPqwiza/Gf6kig3KnOWEYXz+YmxE6xLSWrThTDtx8/hbSJ/PqBLv5n6MEpyP2t+XpL
	ReErTxTnQlWBuUvG5qzWg1P/46mqUyxKBfd+HcuBQ3OkF3PuhGlrO/UTSQO0ATuEZ2Y40QLeaNKCi
	oADtR7FhOS8v9bH/Fq/5qlJmJ1Ssbfkk0s3Qcavuk1H9MSnzuJd6vx126J7ZLCv0LB+wiJYHhF/Y8
	2DkKw7aGFwVkOe6M/qCwKeXNmugzWzMio/6ZME8lWGiX/DNdoEEsriHTANLOv+sxLUHko3uANad6x
	XHsN4ReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDgvs-00000003wPi-2cuV;
	Fri, 17 Apr 2026 11:00:20 +0000
Received: from mail-swedencentralazon11013052.outbound.protection.outlook.com ([52.101.83.52] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDgvq-00000003wP9-0dSz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 11:00:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVVxE2zPwISgixh8zKL0MaPtJFZ41jJ5HnGOxMJxrCFRRbgQUyfh4ANFHoJMcIQFfwAzDndgqkx579rPigEBJDvynDkxlNjCzxs+LXlzSBUnMcz6tF6SV1Fr64sdftbeKJfJMEvQ9L1K0annjGcuYQ775FR/KU46FaYDWs7MSKFyKzkQAgycRsYWZjUPvE3IqeKAfY/7lqQUhoZI+CZY/DG9bEK9r0BJ8+jH8OqyaD3LDqBz+OoEgbwsB7IPLnUzcJlCw1/hKWBX8Ra2ZmVrbS6vIPCEdNvyDg9Vxoanol1twXabQ4cZ62x1Rf51Pi2/6cvlevWKM3ywNFT48yyOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSnNGEQc82xSVE7hS0vM3RU6y1qTbAkWRgL0yv3iCL0=;
 b=JWnC5JskdSvFe3h1uf0VMl4+TWeszbBz8i8+IATq/I9ezwy0+zo5kKyjQJhL3HMA90T8m2XFVoxbA0b0Dd1Jxyd+Px2TvD7Fbo1iVkzepPJdOFfnazbMgtyaPeyDgP0SV98RrQsTS2FzIoCW9ECyWDt6pb/uDLwJAjlKyYhHT83t/D3dNAaHa+DJ7B/ap3Zpz8Q7FRlILsAWXi/5HpSqGcCCzMMDUQIblTNfmBnR2y0xSNthY7vi9tiw1kPlDdCgFqk9Z/AyuT9mdDadcoB5Oz9RLC+qfquXgMily8kPYCT4jqD3hgxpiuXkg1HL3D0YK6CG8O3KbcA/Y1VlltIalQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSnNGEQc82xSVE7hS0vM3RU6y1qTbAkWRgL0yv3iCL0=;
 b=CuZtCEllYyv/yHd4PV4xdAd+/Pt/efdIopx3xuXhtgvMS4g0HcV6Xbg5GtLcs6cpac5f+qySMlXJmFZifIuwR5LDdGyavu6m6xuxHz6gW0qObF852UoFlXTerEU20PbmVfjbsMo/QyiuG1sRHQX3MRrctkiqXFxOVOzxxCal1GcmxrA82hXZPUI9xPf4oVu0774kziWl0byy2XSoQo4ui2PEpIvPVyNzgFBfijFZwpuqS9TH6gnvAf6ZpA+plLLW9GzzFtZknIi0jxZYS77SIPH6pEwYUWjrkgtEf3Aed+am7IdoqjBjEUMjsKuvu7ud/9V7SBNaMIApnB3hHGgUXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by DU4PR04MB12276.eurprd04.prod.outlook.com (2603:10a6:10:629::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 11:00:12 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 11:00:12 +0000
From: Robby Cai <robby.cai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	martin.kepplinger@puri.sm
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Enable dual OV5640 cameras on i.MX8MQ EVK board
Date: Fri, 17 Apr 2026 19:01:58 +0800
Message-Id: <20260417110200.753678-1-robby.cai@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::33) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|DU4PR04MB12276:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d503e55-bd97-42df-803a-08de9c707f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: 4rATppew7kRvadEZ2G1bzcMIGPkwLlssw/Zvt/FuIYL+8Tk/iYWDAlM/iJ7w9kmrNeob8f/hFJwMgixSG+TCCldiXSZQMEkbzoNqFbpJgMTNfMo2PUD23982YzBQPrRIWECIJZ6PYYSM5IoJlbSjX2bCiG01lOVCkokLvRrLEbsqhRvfUNEqYpmkqliF7Q3oRAjN9uEddHE959FOScpbxUZD1XKNL3cwf+QLtsFu5wN7sybIpWuwCiMWOnYVX745cHMPPqkoRWinrmQAqK6bXZ8ewRD0h62SBGC2n+cXMxws5llilOf4puZtxVIhJ5yK3qAbPjFU58T9a0gzm0nLdNi0FGeM4Tpv+0a0YLSgIBGbSXwcY90LCWy5D5uai6JPysSzRVOHzYyvwYQhYU3wcK60lmqgH8mSyAEbM2q1TIdmrNFFOOSsOetIJaua31wv+gFcJnj+1XPqXxk9gkVTVm61smSKkEhqLhJd02k/SbrrODG7+HchqVbSk7fPMo4kADKmYDFh+qJN9lPoq9AjrZop4OaCD+xBSvDJ8OAU1i3tx92kl4xsODiPX2BV3pG9Y517r8poE0gDUh40+2k6IQZtSiwBlVqKaHmlMNjWJuKBWl8kEhlKxur4ioNf++BRkZGzt22flaH88mwm+QpVLYlSXk5NSi8xPpsXuswU5xjLiOwknc3uCjVMHk7d4jMvee7FgXMeBewKm5LqAA4qx0fNDel2jR40DoFwgOF2oe843G4oMjF0+GLzhRdGLk6nMZsVHZjmdqkdbxKzHos4HpkVXntGY9Aw1Y4eNDWnHRA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3crekY2NHdLdTVoU3hNTWpQcVp2aitBK2xLOWRtWDMwVnd6QytIbnpZcUpz?=
 =?utf-8?B?cmJCMVduRUhuZTZrV3BBMkNJWmFDRHN4N1lRMHJGUFdDM3huUXFFNFFuejFO?=
 =?utf-8?B?QWMvdDJ6dFdSNUNBNnE0Q3o2UXNUVHo4UDlHaHJtb0J0d2RGSkphek1jcjNB?=
 =?utf-8?B?U1JpYTRXTytJODdJZE44bzdJM1h6WFhuWGNja0JVZ2hoREVIakViYTBYbHBt?=
 =?utf-8?B?TkFUSG5xK2NaSENObnJaSTF0ekMycHdhcXZRSnZsZ3RwYURtZGpnZFB5WVJj?=
 =?utf-8?B?UkR1ZUJUUlBWMGJrYWlpUitLTTJBdSt5VDNRODNCaWo4enJHQXVBaGNaeXRt?=
 =?utf-8?B?WG5vSm9Xc0diNXlNMEdnc250VjViZjFQNGhYejNEUTBUYzVpbDY0cm5pY2wv?=
 =?utf-8?B?UjNxblg0SUMveUl0ZmFtdzlaR09HV3RxakQwaU9oK3ZUZWJBMnpFMTlFaDJE?=
 =?utf-8?B?YllHTUw0TjhaenpIMlFJMWZRenNVSUlBU0tBZ1N1Y2tCSnI4NVowY3NqeG1W?=
 =?utf-8?B?RE4rUVlac3BKenFDdGx2WmZ4ZjhreUsrMjRLM0tpeHlRK0xhUHRYTlE0L1FP?=
 =?utf-8?B?WGNzdkl2dVN6T2MxcEVzUkw1czRQUEM1VTh0RDR2VzRQRHBiczBFYTdEck9u?=
 =?utf-8?B?cVE2QUZzRGZWVGZGdGxET3FTR0lwNHJPNnVGN1NmTnozSmtXazhCc2hSVE03?=
 =?utf-8?B?SWlDbzR0ak1MaDZEdCtXZmFsZFBhUm1HNE94QXAyZkphZjJzYlE2ZWZmeENq?=
 =?utf-8?B?YWRCdXl6Yi9KdHNobWdQTzhpdVdVMXc4N0h1YzNLWFdxdy9hRi9kV0wxcHRY?=
 =?utf-8?B?TzdtMkNGRTBOc0JhMnNnV09qRndWUHlwMEhtZ0RwYks0eVFkWkFzeFQ2eEhz?=
 =?utf-8?B?TzN4UlNCU0szWStSSi9aVzl2RzBWV09udktsaCtDVHViZVd1MXViWEdoVlRR?=
 =?utf-8?B?M2ovK1BESlphcWoxZUdzaENsR0JRK1BFNXNZUWJOYWh0aU14R0ZrSmlxdWNl?=
 =?utf-8?B?a1ozY1FnZW4ySStZTzRHZ2doUlRmY0J1a1hGSXFtOFAxcVZacmlkNHZSN1dr?=
 =?utf-8?B?OEo1UGpyeEVyK1B4VUpLYXFkMkJFc0lQQTd1Znh4SHhOeHNPQURpZnczZkRQ?=
 =?utf-8?B?MTY2M1EvbFY1MzRkeWg3WWJEWjVPMC85QzNrU0FuOUg1VHI0aWhkOWFyK1BE?=
 =?utf-8?B?SnprS0srZllwcXJaTmZkVkR1d0dNRzV0bjAxcWtnY1MrNGQxZzgwMlFPVk04?=
 =?utf-8?B?aEF5RGdoUU9wY2x5cWNvVEtXNnJNZXlTMnRQcFBBUFZyN1htVm5xMml6TUhw?=
 =?utf-8?B?aFRJYzZUdWo1ZExLd1Y1bi95S1B5Q2pxdis5MlRMZUFOQjFTd3BBdHIyS0h5?=
 =?utf-8?B?Zmh0RDNTeEkxWXJpTnhzVFgxSnFsSEFaeXIyd3V0ZVZ3WStKOEorSUZiRW1N?=
 =?utf-8?B?dnduUFJxSmFybTFCWTRkZGQrVmZodjlIemJHKzJvMGZDczhSMG5naEthNHEr?=
 =?utf-8?B?U2tqU0x1T2FSdHVSZEtaUVR5ZEMrN3Y1cHU0TzFBUlQvV1BDSVRhSTlTWjZO?=
 =?utf-8?B?c0JDS0ZPaDBNT3Ywa2U3YTkxdTRIdWJsQVE0OXdmamFUYm9FUVhhWnlpRXA3?=
 =?utf-8?B?U1A2alBwclgxOW0rWGlYSzA0MDArMk04bHB5VzQ0Rmp3YVdjY0hNSXR1cCtu?=
 =?utf-8?B?QnY3dWxlU09hWVBEK2tzckhzb0hJb2V4RlRJYWV0ajZ1a3BEMW0zL3pSMUgv?=
 =?utf-8?B?cFV1eGpwdHBHUy92eTBwd3paUnVvZCs3cUJMS1BISmtUNjQ2WncwdGRabll0?=
 =?utf-8?B?aFQ5eUVBRWZ4Mmx6NEtwd1FSZjJMdzliTVBMbmg3bW5CTzFhKzVXYy93TGRS?=
 =?utf-8?B?RHpEa2k1NzFuSFo5ZVpiZGdoeCs3NnhVOXpYZ3FNTTFkb3RuTUNTQ1NWWUhE?=
 =?utf-8?B?d0NKQlRUSWVzNndVUWx0aUJsTEZkeUY3V1JmdThuT3dxQUxMRDR1S0tlVHFi?=
 =?utf-8?B?NFlDVGVMcERtRTFKaTNvc0NwZlA3Smt1QTZvSkdjWHhlK3dWSUhMRnhSeUx6?=
 =?utf-8?B?WTZVN3pRSEtpazRoN25oUVZwNDVjNFIxQ3JDajUxckhMV2VoeXJxZzFzcFVZ?=
 =?utf-8?B?YThBTGEwbzl0UTJiNk9HM2w1bzdvQXlGQUpIM3UvNUpoRnVDbFh4TFIvR2hk?=
 =?utf-8?B?c2VFZG9VTGFCNGpKa3hscVh6cFhpcFVyS29wWkRScFRaTjBaOVl2TVFrOGE4?=
 =?utf-8?B?TEZoY1RlWmdFY2NIcEtsTXpPOXd2N0FzdHJwRTdoL01NWU56VU9TNEVqQWRL?=
 =?utf-8?B?UDVxdTBQcXZsRE9EU2phdy9QYmtjV0tHWm5HVTg4eHA3QzRBNWZ1UT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d503e55-bd97-42df-803a-08de9c707f9b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 11:00:12.6555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CmPMiW2D7OgxI58v1MNRCN1X30lxGebot4i913gyhXJxhoqvCi0WsxEQxKqkxBWtBZoQ+cc3ajzzhqBGP7SO7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12276
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_040018_216560_12A75E72 
X-CRM114-Status: GOOD (  10.50  )
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

This series adds dual-camera support for the i.MX8MQ EVK board.

Patch 1 fixes the MIPI CSI clock configuration in the i.MX8MQ device tree.
The previous configuration violated a timing constraint defined in the
i.MX8MQ Reference Manual:

"The frequency of clk must be exactly equal to or greater than the RX
byte clock coming from the RX DPHY."

This mismatch could lead to unstable operation, observed as intermittent
capture failures. The updated clock ratios align with those used in NXP��s
downstream BSP and were verified to resolve the issue.

Patch 2 enables full MIPI CSI support and dual OV5640 camera operation on
the i.MX8MQ EVK. This includes enabling both CSI controllers and their
corresponding MIPI CSI-2 host interfaces, as well as adding two OV5640
sensor nodes on I2C1 and I2C2.

Note:
This series depends on patch [1] currently under review, as well as commit
6d79bb8fd2aa ("media: imx8mq-mipi-csi2: Explicitly release reset").

[1] https://lore.kernel.org/imx/20260417080851.489303-1-robby.cai@nxp.com/

Robby Cai (2):
  arm64: dts: imx8mq: Correct MIPI CSI clocks
  arm64: dts: imx8mq-evk: Enable MIPI CSI and dual OV5640 cameras

 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 149 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi    |   4 +-
 2 files changed, 151 insertions(+), 2 deletions(-)

-- 
2.37.1


