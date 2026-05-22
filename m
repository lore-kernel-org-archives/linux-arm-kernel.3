Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0CDCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 03:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=63ZIziEbl7r1rUyQKYm6gS1za9/TSRVB5N3MRu4PWsM=; b=TgHrgwOAY4h2f8d0FINKBpmyAt
	WpBgkvWmnD+YWwIVyWzwZ/1SrvmZfhUV/BhMHMUumTOtfIITYX07ncGXf+q5C2WFtVQFLbGjuFLax
	kyLbLKTc3hz7HFrsOW4RtEMK15gcwcFgsZ/hWXBstMimqrPyJEhnlSvFF3u7W8eGeFmdoOvqUyOru
	EjP2yX7T8Nx0n9WYFVdp1ltZBge/b0XctfhLGBB/4nMzguVO/D0DDPJbH4fBuTApNB5S9oW8f67Z0
	/aWnPZLeqTZyOw5ozvStfqnShHM9jXv65n7D2kmkKa7hbf0/un8ErxO4yuT3NDNLNEXjC7zkNtZF+
	9zMTZi6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGlQ-00000009fGY-3x7W;
	Fri, 22 May 2026 03:41:32 +0000
Received: from mail-northeuropeazon11010014.outbound.protection.outlook.com ([52.101.84.14] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQGlP-00000009fFv-0j4i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 03:41:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogcJ29Rm+EdzQodD7zM+VKmFvLJVfJus6i4SXCwyw0n5pw7e/1Xt1xBBqJIVWeZsoYyDvrNrmO93Mc4AqlAMbC9s5DS28CFzlgQWQsTZ54DPkkqi8s/JWtivONPHyhcW8mGaEJE5QGNSjDNGhP7NYL02Hy3bH/BKDSh6XTfY6pp9VjMfK5er3lp4Ppq/2zB4yP1QtDAgeqOlD3M/i6pwwFECE9dVFKv+g5C/LakP8yZb+zV8nM8gaO7o6VHBGKjt5G4i1e/pgj01zzoOxHlknKWsdpiBr+YLz0OvPMg0Aojd2A1EAgYcLj/ItscMUT4aT4rExv8c4VSHnCBWLJlQaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63ZIziEbl7r1rUyQKYm6gS1za9/TSRVB5N3MRu4PWsM=;
 b=asDEYr6L2k/Sd1ixWrfu5HeQ1f+rxjaAWHA9i3aAH6FhODTRkcBio/x5XjzHLzTRf53pRvxbAkcqG8g9HZwcBhCD8Zqrou07C09NaouIauuQwsr52eo8CS8nPQGf5CqQnC0+04oxqKwhCGWt/D1Cc7E/FPui/XPCNSTcftPJO1+qlbX6V6yuV+Dk+7uS2EJR+3D7l/kjQmImE3OSnRucphT4EE2g1S0R9OZrRVnixKVhNYX9TUlEw2maMeD/MgoLVpQ51PTX4liK6VuRTfahF3gOe8yoGgIfCoUohaRLo/i5OectwOpy1OT5ssjxXEQJ5Or6a/9qZXNOP1Sdrk7mYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63ZIziEbl7r1rUyQKYm6gS1za9/TSRVB5N3MRu4PWsM=;
 b=Z0VPrFscn7qOcqlppgf0jwp0apa6zfD5Lj7lPBekF2fM15ayEmfDsluFn0MThxXpr4rmyTJhO/V5BwBdTNLlBEc0fVg9es+OiHHxJxulF3vZ5rn4JrpRgrHRAH1bli74LoLOqZfa7c1PauCkUBBTUFmH+p0BrOcxU5uNgmKgzKm8RTFEfe8/kp1bZO1Kp/Su7GvRHHGrYBPV6rtzusU77JDcg0QohNum32+7hu4AXQvKhrwZf52WGWvvORrdp0DG2OEP9cuu8nlmDEGVHIqA0o24HTPfMsLCSGr8zSWXK3wRlnfjIGw9IKBJ59Z2IbJaSyuN74QFBh8TEKsQNrrh+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by DBBPR04MB7881.eurprd04.prod.outlook.com (2603:10a6:10:1ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 03:41:24 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%2]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 03:41:24 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
To: hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	Frank.Li@nxp.com,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	will@kernel.org
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sherry.sun@nxp.com
Subject: [PATCH 0/2] PCI: imx6: Improve PERST# fallback logic
Date: Fri, 22 May 2026 11:43:42 +0800
Message-Id: <20260522034344.1147775-1-sherry.sun@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::27)
 To VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|DBBPR04MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cd8e66d-8776-49ba-8d0e-08deb7b3febf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|366016|11063799006|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: CTFE0lBVzyINe0DlbDpdkrn0Gf9zytAeAmrZy3fZnH4ScHc24f5y4xxJQm32Q9rd93m4Y1rfI7fsES3bXT+bKKPq2Z43Hjt5aBamrAX/91izh5tRtg//81ovJNg3uOBEh2QjjWrawV5KR33WLyDFm0nUbslxzqKa7gpRrRnal47m1i+Rz7Nw8BGeA9CljrIztgKBu9T06JrM6JwFd+i+pT93JBjFd4zmxTKjkMkL6F5CroMyqLrli1uxdFDd3c0rJzcpAld1tQr6zXhmmsZnDIEg37Om83tg+VPbSdci7eMBekArU4Bz/0WXDUvWyU75WuNr/xeQmEVnXGUg1kjxOn/nutyt48EKvRaymwgkC7O5G28Uxyn7i6JZ87NuWzzrFHnb8g7l7P0FUiWc0adrvL+3xHoWDhmxdS1L8QQloxIhTFXiObK+Nd43qzgf6DjS+99uHIDcJa5DGKrJ0+rF8JmRd8j5RvjzhE6Co1DS260cW2vgdS+Wgl10P6t9LgrqLhCLAF5zhzFaxxX2D9kUNY527Dgj54tuAVJ+A7x7OixNqiTSiKbCIP6KfUMtBGDkCQrHB5pyG/XRyGWCGVJiKJ79RuvAQEFoBaF/7HLMDDbLfcJCSkDan4mJFs4PghN9qowJNtQ0x8QDs/CNPPDung+d8e0ZikU0qGouNp+R9NmxqBk6yPJLboWQeVMAtSGN8UfpXTKW+4k3iOUQSpA1UXemsyC5249AQ0+ChSR6Mzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(366016)(11063799006)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F8aMecKj5I9SMiOQr3ynhPww2GcOp7WjayAQYqO6YdXfcUy8fbeCd60QkgMF?=
 =?us-ascii?Q?yo6uwhCwWDXVHRFj4hexpVHMJBXxMVVyPRCsxH++FBveq2MeHzPH8y7T4lGY?=
 =?us-ascii?Q?DjSlyKiB8GYnwqg5SU2KlFz6RmmAS+s3uuTqeiQkCDx1zoG8qhA/z9SuA5qX?=
 =?us-ascii?Q?Usd66l33cuXrTYhyJyP3Jo8AJ3/nvJUAXsLzI4yDx9mKnOyonJh/hIM4AQlz?=
 =?us-ascii?Q?LJSf0sTEYhf1D2EK3u9eX0e+z4UWpdHGwLvaSku431W9O+5USQ5x7Kqgv8DW?=
 =?us-ascii?Q?MKOX8T0icwSrKucu6+eokl8soZk3pejxU1grrWA84FE8tfkM+lT28QMxtY05?=
 =?us-ascii?Q?lAWIdNcDN1imNFxkBmoSdFR2lJ9aEtdXJBJaOpx2jspkGwjyG1DhJaJF17ch?=
 =?us-ascii?Q?CMUeRt+MfpczUwYzm/Opy57hUEX19lXLIygG81qUCPD8DdncSZO26sKkTeEw?=
 =?us-ascii?Q?QfyaD94alUCWhpYEKLsd898+ZRNwX8aFdij78t+5Lu9XbCjTZRCtFfeQISA+?=
 =?us-ascii?Q?24aQWHOFb6BanyeHjF/dus2/FA25EK2DniGIzTgxFQ1SIICOOlpjpOkkuUZE?=
 =?us-ascii?Q?OJT3QFhSDKFqss1vL0A6i8MNE3TnwzjWUD2dY+Oebr0LDamFJ+hACAFnh4Ev?=
 =?us-ascii?Q?tdwylDAC/M6gRq5MUZaolYlFTbdHDBZ7Lkpgsjd+HXYRvndaRRkOGg1kDyZu?=
 =?us-ascii?Q?SD4Pe0j90VEoKH//hSd64pzWq6JvkFdl3ddOvrc9d+DT9jbLRNeZXZsjtxn6?=
 =?us-ascii?Q?69GiDYtMDnq1wXmo/ib04Vsw0l/Isk95BhRF7DEwfpOtY7neD7P5cRCTvV6K?=
 =?us-ascii?Q?bYcLIVExD761BR7cLEsrvflLIB+taGkYpFmQhPr0Avhuz2y9ipBOYzZJmP/L?=
 =?us-ascii?Q?FpHs4GY/LcKewNY5eynF4L7YhhCC1furY6BDh7iqTWD3hgtVtLmT5/GTz7so?=
 =?us-ascii?Q?ztvY914i5RBBK+vaBY4G4JfBCqNc4I/REEoCJi73ADkFaJmm5aVXzrLOTuS6?=
 =?us-ascii?Q?1REVlDJMPJMcID+ek0pQdhUciA7tcvB6wFMIpxO9CQyWBhHYigRMFYKs/5Zd?=
 =?us-ascii?Q?v1kasInJEmx/vNMqTr4DjzIKlXHw5ASqPdzt5OUIoOS08W1aPT44f2qLcUg0?=
 =?us-ascii?Q?7Nt1VE5moWE5IRN27fFPixAiAc3ZFg8rwZfO/395ljLnp3zYlzfvyvAKRuMQ?=
 =?us-ascii?Q?GRgXCCaa3uanjlJgtv0QgR9qns4OQR13PyLmRmWUTFV/SUjV6UefqoRcYJJm?=
 =?us-ascii?Q?i2hJGFjcoDA1nShwLE1koT4FNa5DrEIqH1wGMcTd2QfOPLsaduCR9ngXTWwr?=
 =?us-ascii?Q?wfGdPLaZa+NsqD0owtD9RN/AjAMNqF/Znc8to0CCnJQMz+b3HoulwP/d4T9P?=
 =?us-ascii?Q?OW7myCyvSZ/G23N8EQckDB49/MboGy3Kg0SjujPXA3KjU12oRbZZ8p7ti2RM?=
 =?us-ascii?Q?oUtvM06zNbdlSprSvukq+WvPQFWZfAp+qFFqdgDwXUWXowCXZvbhdgYdZlzS?=
 =?us-ascii?Q?mK2yxNvhGAo75PJ4AEU2LIec1TMNjRPKl5uqTHvPuuU2GUYcfMNCIja5HRwq?=
 =?us-ascii?Q?ONwCSX8KcLX3ywt/Z+h4IQR4Fc8hR7QWGyISopUIZuzZSV2YCUdDIooUEBVI?=
 =?us-ascii?Q?1nuEW3hvwCXFfGfHlxHatPCLez6doJGyDPRlsGtMvCEYzUjBjgsfolxLMTga?=
 =?us-ascii?Q?tTCbV9bMi6uuLHvsftTEyxNn31ndvZbX9pywjiLjpPgLudiZzo6/xQjPAOuL?=
 =?us-ascii?Q?fdAqLzA0NBbRcjHe1Pwxt6A+SOZ13qb/JjKfnYJoYugQHJ4ebkc9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd8e66d-8776-49ba-8d0e-08deb7b3febf
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 03:41:23.9974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tdeo17Ig01+lgjB3m07MUbFpQwq5pvMcJGaUnX4w7FSRvO1+EfSP8lwD4aUinzlXG7nuxyykd3UmuaAwRgNnySHlgpzBq6sVZDgO4FikGMPQUsuhxaut4QkC9V5oEbRB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7881
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_204131_220479_DA40D0B3 
X-CRM114-Status: UNSURE (   6.53  )
X-CRM114-Notice: Please train this message.
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

From: Sherry Sun <sherry.sun@nxp.com>

The pci_host_common_parse_port() shouldn't decide whether to fall back
to the legacy RC-level binding by checking for "reset-gpios/reset-gpio"
properties on the RC node and returning -ENODEV. That's a policy
decision belongs to the caller, not this common helper.

This patch set improves the PERST# (PCIe reset) GPIO fallback logic
across the generic PCI host bridge helper and the i.MX6 PCIe driver.

Sherry Sun (2):
  PCI: host-generic: Simplify return value handling in
    pci_host_common_parse_port(s)
  PCI: imx6: Add imx_pcie_perst_found() to inspect the parsed result

 drivers/pci/controller/dwc/pci-imx6.c    | 25 +++++++++++++-------
 drivers/pci/controller/pci-host-common.c | 29 ++++--------------------
 2 files changed, 22 insertions(+), 32 deletions(-)


base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
-- 
2.37.1


