Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42166CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 02:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1acGgEmHMcJR0/4plY3txSaSuZisVH7dssnv4GVxXA=; b=w6TN+19bs+BZ24R991dw7KEY2S
	oFrfVRyPIijphn3wWIfpNlhN0wq6GLa/V3bnLqB85FqePsJLj+MsKnX0f+nwjuKAuuBQzGyJX6gwz
	TFDy1aDAVWv2bl/rNaFWpsHxHVvtGKJtGVJ9hjuPdBXB6jxDFuLj6jAlL44j1Hr/PeSEd/UO/8/HO
	RebubTJwzcNIbMOWzf+oacD3dRySKwdjcNzVGb8ifg1QVDqiQcRctROqipjDd4TiYusoWZzrQ6VGL
	6+TYBsD4Pb7xOBbrhNDDOy7ShyDD4LyqizqYN+4+qTx9kH7o9hCh+9dKIWkYZGCxDo+reFYThOIHR
	t8K5ON+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7GB-0000000B0Te-2OJv;
	Tue, 04 Nov 2025 02:59:03 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7G9-0000000B0TG-09Vn;
	Tue, 04 Nov 2025 02:59:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pare1Y5yL85LRaZ94rU+7e/8Rvv+lc8KuuVLVyNtSzjfgGfMncN7qRdkrt3Gu1a8Sdd8/41ff0rh2603mocIzHBQOZ5wAzeKj2BDtNAIDUjq1ni26Rr32Go7QqQbXzKPx2ZKV8Qnvq/UNsy2htM/7Ia9XFzKkGRm1irCWEl5dEMUeYfKiRMHqbkDA5GqW4XpE5+JkcKqmLesfrny91i1ELUVyKWamwQ/3rxVf6n1aH7l2nSSBJZ6IIq2UI7cafpEDTIwJEDIBu8emrmJh75RpD542UYed7qz+sxU20r6vHS6Y0JCdFJODL44/HWBVq5eoIm7oEFYbNcClSuHu/kHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1acGgEmHMcJR0/4plY3txSaSuZisVH7dssnv4GVxXA=;
 b=KnodH6VePY7H+/vLy6cf2wwyQEEZA6e8hdtNS7vS2/mlhaPQcuf397rNdkFj5JPl9CHs2Kmu0GRVkA9Cuii7JD41tyPPPh+tjq42+jssKhJeWIcPFvE64S3ImX3JGB+qumiv+QcY0Lpdl3wIQDqGwvmnziJ0rmEe9xbNdvEs4xmC1JekycmQtfU65WbOaUmOwxur5D1L5lekqs5WQNCPwMA/eopobptPRlXlqjnvbzkKAsMBtIC0cBJQEZ24wtNnt6hDHVmp1Pun5GZ6r37JRlUi4E7XiU/2soZFc/+gKRS/4eFwvTJSVjTM1685Q44Fa0saZQXX1dG9IYHPkWg83A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G1acGgEmHMcJR0/4plY3txSaSuZisVH7dssnv4GVxXA=;
 b=R6DMjHUKcNRf7qSpeFj7noSTn3Asv1r7iqGjXgdg0fy5Hbky7+uWhNyJLLNulDwWkG9YXgQtrGiU6V0qMGbwP4hkDt2Lw6U+UcCZz7yO1Dh7OWmseG4Sj4As1jL6z/tk1juLbNxIReCFt1bQ3pBhvyQkW4JCHA1SIFmTlYqWcTqWT5dXPxInlLKj4dcUi0XtOfseoWcEMEZpTfXIjdLcJA8oD4vbU/hIX8J0x3IXxIam6yXF/dh2lk3WS8mKgP9hJ9ZmvIo2y+Ha9mGAnQut/GmlL35vXIXUt8LBL8l1oBiWmB4CpX8qbyTBH/v+sYl48GflZUejwccNnJuS7mPB7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM7PR04MB6965.eurprd04.prod.outlook.com (2603:10a6:20b:104::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Tue, 4 Nov
 2025 02:58:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 02:58:53 +0000
Date: Tue, 4 Nov 2025 12:11:19 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 0/4] Add i.MX95 USB3.0 PHY alternate clock support
Message-ID: <20251104041119.GC8752@nxa18884-linux.ap.freescale.net>
References: <20251103-usb-phy-alt-clk-support-v3-0-18b8bd4f01b0@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103-usb-phy-alt-clk-support-v3-0-18b8bd4f01b0@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR01CA0144.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::24) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM7PR04MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: f3277e87-9853-4306-f7c9-08de1b4e1656
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LBR9jd8U49Nwe08WyL9yL3LAX7r3iKjXJoij+GkSDd7Rb9erBMuvtXM/A098?=
 =?us-ascii?Q?DTVoSDianEXUFp2fmx0kFh9LdzY35UCpCveukRCTUmg43b3OdrpWgaMoA1lF?=
 =?us-ascii?Q?fIVpUUkzAV0Y8tAG2P0EdWsouLPOmioO2uysYvlyndune6+MO8ZJ5X3yh2Hm?=
 =?us-ascii?Q?zgLlpK6cwFWrKlX/jIhwh/KTnaY1ifn3ZZn37P1+Scwj3EVFdCeQzcR6OvVa?=
 =?us-ascii?Q?iSvCHSuTc++RgKop7/KAXUHQtYNfizL6+XQKnhj1U1HxuxKGDQbo6L/g6Y8i?=
 =?us-ascii?Q?ycLhx55aG7P1Hdlhvjpzbv0L0CNmR44PIvU/djjSXuZ6seWNtVq4HJUNtpUX?=
 =?us-ascii?Q?vrY9eSmJwsJA5ZCBaGdCUgH/qJFsE1f4slxIx8pMsVMuB5SDlseTJPDg1WCj?=
 =?us-ascii?Q?gmznzuGSUHgGBfN/Q62pXYg7Ix8Sr66z4LKY+vMD7rQJGfyEryWWo29zt0Vs?=
 =?us-ascii?Q?sw24ZcCPBytzY5hSOV7MvibNvupHcReiRKagl7KwPL5wvGMpYpJdpG4/UidS?=
 =?us-ascii?Q?/Rk5YiNsHR8VdedG9aChPIfutlV4xfbmFYPqL9D43QRQGmRIgZs2EjqyQxm3?=
 =?us-ascii?Q?EaDlft7hwSlos6Y46u2PnbnXaLBpw4I60JIUqJ4FZhjY1nkFY21jcrFs5f7W?=
 =?us-ascii?Q?dH/sE3BE8EMEeKgt34wjBN1RU7vziEaLMcgV5VT5Pjw61XKJxvF8T6wfqcGN?=
 =?us-ascii?Q?lTkiwQg9/HUfJQbL988PsBJYI9EnMVYZ3f/iMZVJRrbLLrPgbB3Za5HPz/Od?=
 =?us-ascii?Q?ZgIm1iqo84YkFVvqbmTiOZ5QWkFmA/SaGAKAnwLP2xiatzX8tJfYUoFFs/HU?=
 =?us-ascii?Q?GdSWOhIuKHStSMTJaDpbIKMrML3t24SxLrNLjy/7Oaqv8lp/kyj9qstPKKpo?=
 =?us-ascii?Q?Og1wzIXnCchlTSJQJa8nfMDZrsGgx0thKNSRxxDQ32gksA8ovUunH7UZO2Vi?=
 =?us-ascii?Q?kNhRk3Ihlzbk98wui6KJwMIcTrlbWvB1NAHm2x67W7erjsMrbMzQIBAiqm+2?=
 =?us-ascii?Q?J98teu1/WmG0PYvTwv4JIJzCBLU+O+ZV1E6LCrYHEzsDnrYmakzSprnvXZK0?=
 =?us-ascii?Q?t05Ew9e1hX3FN3rjnoap9W2NQvcbDcWK1KqqDVzwTqOSTi7khkbGZGflirTH?=
 =?us-ascii?Q?H0Uw3vo9/f4UZ5+bUI43n/PjTXbNyRcloE1ywzONBBuQMN5/TQKhl9wRm2TK?=
 =?us-ascii?Q?NzWAXbi/TOpyuyr4tnNnB0McDp37toc/J2L7ZgPO3YGK8DKIhjVB5v+hNrlI?=
 =?us-ascii?Q?lzRBkU8qHznpUaFHOErJ70Z7kttPqoNCNDGOWHsOec5+KYk5UYcSQJSGumaA?=
 =?us-ascii?Q?aQ+A+fPvFyUN9WmguW6eiEvPHtOOz1Dwr6m9YH+HDDU3jybameNl45katML9?=
 =?us-ascii?Q?iwnO/BpnAd8WPmP1Fx8p6itkkraPTytJxz17Cv/PGRtRpC/TLLZ8f6Xr/Gsi?=
 =?us-ascii?Q?mYPA/TivThQyA9kk0v52p8eTPo9fXU6yb6vCSo1F5/XnDw+llxME/d7Q9N5o?=
 =?us-ascii?Q?qqbBD2I5pm+8Kh/oZLERTJQ80x/o3WP2iljf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Eyn3zP6zqdAgpage20+SFAJCXxzQIJiF6UTmUi7XXnW+twfidM43L9105Znr?=
 =?us-ascii?Q?d8H8xNqsVWA3gABufL65KhvaSzzYBJXI+o3JtbLJTAn9Fkr5i5oLOx7O60qS?=
 =?us-ascii?Q?9wRhNSxQjzKT05IKALxBaow+IBI78y4qXlbsodbgKwKM7B7+/ZaWHpWeUFtW?=
 =?us-ascii?Q?6AKDqOuzOqiWotZ+wr9Q2QPOwMB3li7G5BoQljcWJieO/x5XjIxXHsQk/OZM?=
 =?us-ascii?Q?ptHTdf8KTIySHf4MlnEwde4GedM5Notv3ybip0b3CrjSLcF2+u2d2+I0aJ3Q?=
 =?us-ascii?Q?GLv5lgFHn0OPdhWgJJ0v0YrfDYrVqNLMbFC3oaX85BRUqcdtzEf1tURlL7og?=
 =?us-ascii?Q?B3fkYK0LmJdLSmno0Hj+N0cSjRce1e/sDuU7klmUEOA/CDgnrTZCxvNs6l3V?=
 =?us-ascii?Q?CQja3gHvsZXbEEy8h7ngPGuSV9E0juGviArWqz24fmOBeTfBnw75gs8bYLW1?=
 =?us-ascii?Q?B4alg9PWfIGSvIqvzNfml0vQw56whJbNoqAoSCo76+CNKH/nbrs0wIW0s0ed?=
 =?us-ascii?Q?Jp9+RgeMRKlJsBvA8DE322i9oMYgB8WcC9+ZJcluHxf25cB4X/5/88ecxiVM?=
 =?us-ascii?Q?zL6y/cZzjXLUiqcIyhsSnLpFn9r+4Ep+q9bVU6z3yUK7Vq2GOO9UnIzcCYhb?=
 =?us-ascii?Q?jiPYAPnkcZIKxFj0Gsi1mwrdqlEI4cyZv86nQG1/Z308BaRcPO5PZm0c1J9+?=
 =?us-ascii?Q?C7owAnzV0LhJAuR7GVwNkSN9AB3E3olQe5fMjC/xtN6iC+LK5UYTQISwyBtd?=
 =?us-ascii?Q?lly6frncSbSKBeNDy+ZtQGvvFTWKWpKbiX8KafsQ3nOylXrxhGOXTlb4nM/u?=
 =?us-ascii?Q?GeZDVcgK6IUqBzrKpV6vF2XkHDpub2nzRCx/GsLPG9UajTF+gzNHpxUm4NtA?=
 =?us-ascii?Q?FpoacheZHgfTHXaspRauvpT8ffLr2LQ4efiFWX0Y3k5wK0hRLtFhAYA+tODJ?=
 =?us-ascii?Q?FR/bkizjwgfatn7GvViFryjQ18M6Ocj+WtYHDWiZAiD0apQ4mE2QDpa1Cx5m?=
 =?us-ascii?Q?TEYwMpECcaETSim4xRwLyfoOlSCycb1VGX+dUHI+sxPSqTuejnxAoLxSzkwe?=
 =?us-ascii?Q?P2oqtC+PZEwyttRdAkGawyUHLoEHhiBVy1zOoUvdLYn/9qQF6yEwnh3TsQi4?=
 =?us-ascii?Q?hIZcD9R0OEbVxIr0ycmD3DBABwgj3G2HAGHAAuzyzBINdntrxDffhwTa943j?=
 =?us-ascii?Q?aVdAyfFVR3KNRpIHWBSuOwP8mY4YH9Z24aaOf3K8ntopzbluBSk+OpaAlMc8?=
 =?us-ascii?Q?W5HdBUS+DYZ/QySjssDD4jE3KQMRpZOzbbo3scHYGSzuKTlRnN2F5v+GZMT6?=
 =?us-ascii?Q?50k9XsZXFvwUnfNjSEEI9hqu+9qJKuK2GjApYH+OtTcS/ns4lppXR+ux9FIW?=
 =?us-ascii?Q?A9/aVS9UQQmR+4Y+1YEPXWCvsw677OrTkIE2IIzqmsxTOSgGJ6379JXGNAKl?=
 =?us-ascii?Q?a8HY0BVUJek4WkPGXQb5Xswh24aBRpx6OYfIHNrPyylXuF7aJAVe0hKwKRxl?=
 =?us-ascii?Q?gKTPY6tScdOCXrl6W3tGIiUu3BxedCo1wxxHbgV2rHg6Y73bGKc8qzuUITZ4?=
 =?us-ascii?Q?QGkqrUZwZTeQTbjDhzg7h/REbl7o46EJhC5fZznc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3277e87-9853-4306-f7c9-08de1b4e1656
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 02:58:53.2087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NN3yu+9eIXxOFHnTBYjdMD8eAtP0PIB/PgJkflwPq/ZBt4GaIX2HtHlfNLcARYfkwrH+pUQcvGNIdLJt0xOI3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6965
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_185901_082205_78054E93 
X-CRM114-Status: GOOD (  12.42  )
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

Hi Xu,

On Mon, Nov 03, 2025 at 06:08:31PM +0800, Xu Yang wrote:
>The i.MX95 USB3.0 PHY supports XTAL 24MHz clock by default as reference
>clock and 100MHz clock as alternate reference clock. If the default
>reference clock brings USB performance degradation in bad condition, such
>as the working temperature is too low or too high, switch to alternate
>clock may overcome the degradation. This will add alternate clock support
>to enhance the function of USB3.0 PHY.

I gave a recheck on this patchset. Sorry, need to take back my R-b from patch 3.
I think we need to avoid introduce xx-usb-blk-ctl here.

Reuse imx95 hsio-blk-ctl and fix that node.

We only have one HSIO BLK CTRL, PCIE(0xc0) and USB(0x00) both should use it,
but not introduce a new compatible.

Let me give a look on current BLK CTRL for PCIE stuff and extend it to support
USB.

Thanks,
Peng

>
>---
>Changes in v3:
>- collect some Rb and Ab tag
>- Link to v2: https://lore.kernel.org/r/20251010-usb-phy-alt-clk-support-v2-0-af4b78bb4ae8@nxp.com
>
>Changes in v2:
>- improve patch #1 commit message
>- collect Rb tag
>- Link to v1: https://lore.kernel.org/r/20250919-usb-phy-alt-clk-support-v1-0-57c2a13eea1c@nxp.com
>
>---
>Xu Yang (4):
>      dt-bindings: phy: imx8mq-usb: add alternate reference clock
>      dt-bindings: clock: nxp,imx95-blk-ctl: add support for USB in HSIO Block Control
>      phy: fsl-imx8mq-usb: support alternate reference clock
>      clk: imx95-blk-ctl: Add one clock mux for HSIO block
>
> .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  1 +
> .../bindings/phy/fsl,imx8mq-usb-phy.yaml           |  7 ++++++-
> drivers/clk/imx/clk-imx95-blk-ctl.c                | 19 ++++++++++++++++++
> drivers/phy/freescale/phy-fsl-imx8mq-usb.c         | 23 ++++++++++++++++++++--
> 4 files changed, 47 insertions(+), 3 deletions(-)
>---
>base-commit: 18514fd70ea4ca9de137bb3bceeac1bac4bcad75
>change-id: 20250919-usb-phy-alt-clk-support-e54e69ac0780
>
>Best regards,
>-- 
>Xu Yang <xu.yang_2@nxp.com>
>

