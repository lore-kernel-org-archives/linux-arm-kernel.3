Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7ACE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MmwAe2VoE8j+DJ0+j5VhBvk/btfBB1rp50/AKcSAkMc=; b=ZU0h9BeCyExiYshV3J9/iO58GP
	ANATAfh61MNtht2qtHiu+FTaGGwMrh7zkThFFebIa4I/D9rWWDlQfPx+/AGGc6ML7r3voRJy3+MCd
	XCrGPZ9rCkufhV5/iL5+jmb+qzMw9b21SH9fL/fW6GPydwz0hDpDzH7UMaep81sQKvHXJuYrbVuzD
	nL5tlXP5h6/q1jScf+DMBWdiF0iOCnVcsU8ex5xnHWuVh4Rc0wjxcuoYeDhHqMNhDWfw3KIs8POSo
	0jDm0tfcuyOImBdXIIjg7r26c9r3irJDhFy4cO4Ro9jpDJgNhV9Dho0GVLdS1YbYVvmFP5V6puBSV
	tcR0gTpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnmG-00000009iQB-0Y7m;
	Tue, 14 Jan 2025 20:44:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnfX-00000009hQ9-0FjX
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 20:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=MmwAe2VoE8j+DJ0+j5VhBvk/btfBB1rp50/AKcSAkMc=; b=han6ujE5Sr7l9mRa1SHBWzQBhU
	zkso6lh6AOb9iYDzjFUpFaheCE4eSlUxaUHlMdH3ZakeGhBr2NqLpBXhPZ1K2nYSxqem80ZXk6WxV
	1L/U+pFf1QkE5Mg0oSR8RXazKGJe8/KSeB4+6NCQ0PLUXUe/KwzesP55vhMG6MCH/EnIzEphzmyod
	vlV0r3YduA/Kcsax+HCyB+1NLus9cjNNMHLM1rQAFYCXxUoUie6VfjAq0Ayl04YghtXg2xhk8dxpf
	nD5yUbsbWqo8G3BPR/h568X4HAUqAWvdCdvs3JyyQ+Zgv8fK2z6wBpphvmm1BOJvGUGFbS9V1Wesv
	AdJYVEZw==;
Received: from mail-am6eur05on2061c.outbound.protection.outlook.com ([2a01:111:f403:2612::61c] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnfQ-0000000AcLE-3ojb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 20:37:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsMwesqljd9IP1SfiOxC82sUQPiy2gZEB52pYCeGsM/S8t2LJRAmcOPT4LvDBsnJM6Kjdx9dB1LlDAd0x7Y5um1BtFHzBfsjYgeMXsRU5xDuBIxeQL95Qa1DDG4YHVb/SdDjHXBkUmiaLUZdKpz6xas8SGn43DqHEh+rfHzbywGIkFDR//bnQsaud6L2TSdGcso1iJQJoj0Pkxebp+2xlI7Iucvguyjoln2qfR0I8cFj+fkCrqTnlzQJmna7/qi5tZ1KMw2bQBTp1QF04W9RRnwjmFYbWJ8HVrIlI/lCE5hJy+B6Hq+q/hvknncya77tEs4ikj/poz2kAJ2yRLu4qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmwAe2VoE8j+DJ0+j5VhBvk/btfBB1rp50/AKcSAkMc=;
 b=ZCowjRa4ozY9ernEIZ4NzfXQzRDG9kbrmJNYNjf67TN11tVXoFXgcGSAZ10CdK1CYy/5NfwOOADllM8IYcinQZCpzbfoi4cJA8Wrcg+a7NUW5ChguLssx2+fXqH2Nzahu0FyHBOLTUxGJdMcIbZSxzT8aLxmaiAj2lVY4wnKnxWIWekhuiE69AfJkFv+sKanQMGM0FpGBFc7b2RX0jeYfJ7ubpTB6T1+p5yta+tt6Cu8zUnhHHMln6/WLOyOc0mk67Di0UuSkK652b6DKlm+88lRTnYya+1VUX6l5HYmgxdoHXsOxmKVMR4vkCXyC7fG398jJruYBcnIFnXLgfsutg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmwAe2VoE8j+DJ0+j5VhBvk/btfBB1rp50/AKcSAkMc=;
 b=nTJuLZeT0j2aEK+/cPA9wHkjuM5qxWkQ9FrcrBMpuN4m0iExogWgM6tlOrjGye6rn0mu9sLJwa3v9UJC/eC11KnDvI7uBia37tpA0bqcnELsQNWPbvI6fvUQaCqcZi3qSaJtN7OVY9cogpKtfO7xaJgm9p3tY4G5IS8Z5gI57ue6gXSoqIFEzb8jZmSGPaZgnfpWmY6wTFxTO5qY4ITNMcBJw7YX8ulh2JrPv9c5ItmUqjZE0Yz3did++2KUwiytCc0TSnd3AlnayO94oUyRyIF11FqWV/Bg7lOcnC9sd2Caa9dwfAijmcDqbI8eKF8dvinfkF6GV8UJ65m5E9QQFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10374.eurprd04.prod.outlook.com (2603:10a6:102:41e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 20:37:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 20:37:35 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 14 Jan 2025 15:37:08 -0500
Subject: [PATCH v9 1/2] PCI: Add enable_device() and disable_device()
 callbacks for bridges
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-imx95_lut-v9-1-39f58dbed03a@nxp.com>
References: <20250114-imx95_lut-v9-0-39f58dbed03a@nxp.com>
In-Reply-To: <20250114-imx95_lut-v9-0-39f58dbed03a@nxp.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, Frank.li@nxp.com, 
 alyssa@rosenzweig.io, bpf@vger.kernel.org, broonie@kernel.org, jgg@ziepe.ca, 
 joro@8bytes.org, l.stach@pengutronix.de, lgirdwood@gmail.com, 
 maz@kernel.org, p.zabel@pengutronix.de, robin.murphy@arm.com, 
 will@kernel.org, Robin Murphy <robin.murphy@arm.com>, 
 Marc Zyngier <maz@kernel.org>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736887043; l=4347;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=oum1+Vq6vj4Bu6UlAhpzm57t9Jq7KQ1Jox+WAf+lq3U=;
 b=mgIeM9Sf2r3Rie8MioZgjmvW+QYs6fo6ShswYKJ8QuAUAlfhxumk9lw1CIGnlns01dXjekk8E
 IBITebUmZkxCxRTL74Zzi6FO2/NFeEOhesFVs/fizslKPj2MhkJJh9W
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR17CA0022.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10374:EE_
X-MS-Office365-Filtering-Correlation-Id: 5084e7f7-4b7c-4178-0b49-08dd34db4746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkhLcFZvTFl5SjNRb2NHVTlDSG1rY0NjZldNUmtGMVF4ZEpUSy84UUdtcmFU?=
 =?utf-8?B?b0dIV2p4d2g4QW5RT1dTYkh3Yml1LzZTa2NXTG1uVG9hL2RhbTBya2VEeHVL?=
 =?utf-8?B?cThZT2NPSVNyWXdlaExzYVNaZHluYVc2dkRjSUxTVmJWdE5McFVmODZVcG1v?=
 =?utf-8?B?eWVKbmU0Sk9uYVBHVEZyWlhZS1ZOMHNPMTRzazl5RFhtRnBReUtrMVJSMkds?=
 =?utf-8?B?UkxmOG9sd0FaWldVTURwNE9VV2h3NnpyUVhlZ05Ba2MwcHJBSnFYa2ozR2hS?=
 =?utf-8?B?N1pvMUJXMitEME1Va2JKOGIvWXkxTVQvb3ZKQXQrQnJhMjRhc01Jb3ZYUjM1?=
 =?utf-8?B?S29TOGxHcDAwZVBKYzJnTEJhVURyTlgxTFYrbVFMcHgrRjVZT1FzZlhEU1c0?=
 =?utf-8?B?d0FTWVlyWW5xQ1lycHRZVEVYV1M3dEJlQXdmaVN5eEtkazZaRWUwSnc4RVJH?=
 =?utf-8?B?NHJvaDNsWTBRUThhaG1rN1FPZjNVTlpJY2Z6bmZaVGZBSWRsdkwrYjFiRmJh?=
 =?utf-8?B?cUVOVXNIU0t2ZFVYYStjWTNtYnFyN1NaUmhLSjdoaTZuQm1TREwydXZCczFs?=
 =?utf-8?B?TzdseEF6cjd1S2FNWlpXOFdWQlpFTmxMcHYrRDluSjdTZ0taS0hmUWV6U0lR?=
 =?utf-8?B?dXlkRU16YnpuWGdTWk9acEpHTUd2QTlrYUhiVlNGamh5TE9JN1FlRTdiTExJ?=
 =?utf-8?B?Y3FvV09yWldSYkR6WHJwT2EwenhrSzIrSGREVWpTSk9FRzl4bk9HSGlzK3VI?=
 =?utf-8?B?UnQzUUZjVDRXSWRGakoySjFTdEV5WW05SlRocXJjN0ljS2NMbzJjblAwYS9n?=
 =?utf-8?B?T1lqTjdoRGlLaXdTOHpSSGd5cGl0Y25weXpXclprSlZyeGJhQk90ekZFcC8v?=
 =?utf-8?B?V01UeEpkelBhRnNqd0FuRFRTTnN5dW84emt5Zm5XQnhMMzcxWklVS1VMM3Rs?=
 =?utf-8?B?dTRyRWdCQTluYU9IY29vL2VvTC9UbHJnVVpidnVXa0NwRmhYVDNUT1VQcWhZ?=
 =?utf-8?B?VFJyWmdZRCsyNlNGWW9oTDhVTEY2Z3E4YkpoOWdNTHhXMnF0ank4TUFHbU50?=
 =?utf-8?B?Qms2U3RFZnN3cUNvdzJmT1FOSThHa25vZ1JhTjVhUllYOXV2WFZ1NFI0Ukdx?=
 =?utf-8?B?TkxjVi9oOXV2cFM5TlZMYnphNTc2SDdsZTJJZVkwZkNjZ3FzTjZ1REVjeDd2?=
 =?utf-8?B?aFUvaTk1eXRRdkRJY3BoK3o3R3JEQXhtemNNaW9tWlhQaGtMV1d4NlV0L1Yv?=
 =?utf-8?B?TWM1YlZkaGF4V1VmRS9oQStFVnFTbHl6Qk1NNXA0T0E5VGtnZ05vRUtHWjBQ?=
 =?utf-8?B?ZTg5blhGOW03WUxjbXpra0ZvL2F0a2dKMEwvV1NNQzdCOXhzekZYdUZnRUFU?=
 =?utf-8?B?V2xJUHBlZzVvSTl2V2RxQkNpUEROcndVbTViUHlkS1Qra3lvOWFNU3NoRGxG?=
 =?utf-8?B?T2NWdU1HY0dGTGIxaUM1NDlvR2J4SHhvQkJTNUVueXIxNDNGdWY0UWJrL0Nq?=
 =?utf-8?B?bUc4aUUwWVIvM0VnaHAvVWNvNjJxQTVVSGdUTW9hQ2tnbmQ5SnB4Ukt3Zmpo?=
 =?utf-8?B?eVNSZVczZEowWjRHY2h6YS96ZnB2dmsxYk8yZWREOFRQSHdjaHlROFprajhs?=
 =?utf-8?B?MnJzZlNyMkF5MW1taVNoazZFMkdrT1g4QjJzWklTSGc4cHZYQ0IwN1VvR05z?=
 =?utf-8?B?azdXV3VOc3FYWWtBQmdEZ1g2R0plR1dFMXg1djl6NSsxNFJtVGtNbW9pVlBo?=
 =?utf-8?B?MkdJT2EwVTVhSVhKenJBQkhoanFiTUlGcDAzWUhOS2JTQ29QSWRsVGozdlll?=
 =?utf-8?B?cWNsMFRtN3VNWlFnTWltbVh2Q1FYa2N2SDZac2MyWFhpV2RqZEVaZjNWYk9D?=
 =?utf-8?B?VVVJeEQ4SDNHM3dSWDA5UHhVTlFmTkw3b3hPN29TK3BLNnFKekw1ZzhVYnRG?=
 =?utf-8?B?aHkwWlVlR0VRYks1SU1WK3VUSWRwQWp5YUx6QzN6RjA4dlFJUm5uTnpTaGwx?=
 =?utf-8?B?b2IvdXhOcG53PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eCtZMUNiUDdTbHczbGxmd2sybzRVZWkzVTRlSmZ2d0xPWUNyR0xkU0k3Z1I3?=
 =?utf-8?B?S0E3UWR5M2JsMW9Fa1c1TDlVZnJzR1pUbzJyeXlIelV4TTJMY0Jna20zRDFk?=
 =?utf-8?B?WmZMK2ZlUitTYjE0ZXpSUzB1c1dwcUlPVHE2ZGllUE1NR0NwRU1VVWhYOGNV?=
 =?utf-8?B?czNveEEzNDhYNDVCaWZiZ0Uxd25FTjlYRXJFQ1U1ckpLRDBrbGRCUE0xTTUx?=
 =?utf-8?B?L29sQStuRm5uVytwYWV0K01xd2xUNVB6K1BvL25wdG40cXZCZ1Vzck5tckJ4?=
 =?utf-8?B?WnJ3ZG0zMXR5SkZsUnZURm9welYrU29MQk1TdE1HQkhiREtETzNTMnpLa2dn?=
 =?utf-8?B?RUtzNi95dURzejZGUHZPTXJveTlkM1lXRDV4SkRTUkVmR0dKMjZWTFJ4UjZq?=
 =?utf-8?B?ZEhrTDNNUnAzblhDWkdPT01HY3E1YlFxcDFUbkI5eTVyVDVXWmZjQ3g5UTdt?=
 =?utf-8?B?QzVQbWM0ZG1nYm0zWnVQYnM0a1BYTUVFSGMzM1krMnFRVm05MUU3V0N3SUd5?=
 =?utf-8?B?emtZd2NhYVhyQUY1WmN6VDU0Zk9TZ0xTSWZMaEtVcTA3U1JQWVRNSnBpak5I?=
 =?utf-8?B?MDRaeFUwajBTM3N0MmxmOGlHWWdkNkVqb0UxVDRua0dJOEprU2ZEQi9tLy9j?=
 =?utf-8?B?QU1KcUw4S0hwUFp0OG1Cd0RSL01iQ2NZT09BUU9FN2xmYnlDV0hQRERQZWps?=
 =?utf-8?B?WHVyN2tuQnNCQ2UzK2UxbUF4aVhoZER5ZE1IM1o2UUc3aUluYms1Q0ZKZWZK?=
 =?utf-8?B?ZmtzTzAvV1dVVXRqL3RaWGc0RlhtdjllRDN6aTJyQjZpbml3MHFTNE9Nd2o5?=
 =?utf-8?B?YXB6N0tQcktEUHVrRkhPbUcwTWx0QmZuZm1ScWhZVHp1Z2Evb2ZqYVpvbzhB?=
 =?utf-8?B?eGFkR2xhNUpob1l6ODN2dk4vVUZNazY1M2s3WWgxSHYwdmNxNVVZOFRVbW1t?=
 =?utf-8?B?dVN2WjVRK2VPdlJwK2pKWjdET2I0NlFUVzFiQ2lWZHpYdUpIWVdORkx6RUd0?=
 =?utf-8?B?OTFkMUdWRFluSmRZamFsdnlxYVFTMTNCMzJmYytuMTIyMFdLK0VleFExNDc3?=
 =?utf-8?B?ZEVEMlhCeHdSTHRQNTJyYzdsaGVXcFVtTER4N2dSSWZzUlFNK3ZxcEJVMGdQ?=
 =?utf-8?B?TCtXZDd3Y1E4ajJ0K2lQRlFRTisza2IvTm4rbUdtY1lVS0FoRDBUUFpXa1Yy?=
 =?utf-8?B?N2hGeHNEbmdJWGxBZkJsbDlsSTZXVDJFRE1SbzdscDBHdDYwdTcxSEwzS2Fr?=
 =?utf-8?B?WHlGamxSNkNpbnYxK2hlR2tuekl1MXI3MUF3dGYwVFplODJreVd2cmF4Q1ph?=
 =?utf-8?B?TEhTaHBOaDJma3djTmY5TnlrT3g0YXgrL2o4V0pnU0ZNWXNHVm8ybzRmVjhk?=
 =?utf-8?B?bTh3SFVRbHB0djUxK0tvQmpkVFJnTnRQbTU4UmplWFZ3M0hpYU9zUmo4N1B5?=
 =?utf-8?B?SUtORXZPczVhbHAzbGozL1AvclNGSEZaZzhaUXljVVFGOUNSNWgzd0RabVJv?=
 =?utf-8?B?a3JnMWVranIwWlE3U05UTlhPUk9pdUdYVE9GbzlPazJieDg2WXJvTC9GejNw?=
 =?utf-8?B?MnZVV2Z3SEQxSjJPcC8xMThlUjh6LzZaVWExNVBmT1JrTm1tZC9vdHRzcW1Z?=
 =?utf-8?B?bFdGdkIvL0YwUkQ1M3gvN1BTejV4bjE3akJUT1QvdjZWZkVqWmZnQnBtRHFn?=
 =?utf-8?B?eEJOdEZoRUtnV1ZDN0hTQitnM0ZnQzl4U2g0YzZZMEJJelg4YXFFb21vMkJB?=
 =?utf-8?B?ZFc3UGdNZUZnd0wxRXhONmlKTHVSYnFkOHM2bTNFSXZ0V2ptQWNmSEVTOGRV?=
 =?utf-8?B?eHhCQ2RFLzlTOWE5NG05Mjc2a2UrRGpsaExCdUJtbkxRci81eHQ4cXdlakpW?=
 =?utf-8?B?aU9kZlV0azdBOTVjOE53UFYrVGRHbHE1QVc5VzRyWmtpd0g3eVpWSVI1M1ZV?=
 =?utf-8?B?MjNyaFNBU3F3aGdDWGNtMCtiUTZucWo5UERyS3hTMTV0NlJqYXlKTVB2bklG?=
 =?utf-8?B?UkRPU0lXdmRpTjllQ0dNc3NVR0w0TlJLSDNtM3lRSEZMalk4d1pkbWpESTF2?=
 =?utf-8?B?ak5DbnROSlZ2SWdxeVVQU2pJYUFvbjhkbm5kak1wMzl6VW9xaEpFN29WN1ps?=
 =?utf-8?Q?Y9ux7G7C+BlhttoTR3hDSvBGf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5084e7f7-4b7c-4178-0b49-08dd34db4746
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 20:37:35.5641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7URkDMnekgg85S444dkmnqnUL2hlZBAXKYNPQgQn8kHruiLHipFmxHXscYeRycQvuSNft4qYsR2Rnjkz31zAbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10374
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_203742_666537_C5F220D9 
X-CRM114-Status: GOOD (  20.72  )
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

Some PCIe host bridges require special handling when enabling or disabling
PCIe Endpoints. For example, the i.MX95 platform has a lookup table to map
Requester IDs to StreamIDs, which are used by the SMMU and MSI controller
to identify the source of DMA accesses.

Without this mapping, DMA accesses may target unintended memory, which
would corrupt memory or read the wrong data.

Add a host bridge .enable_device() hook the imx6 driver can use to
configure the Requester ID to StreamID mapping. The hardware table isn't
big enough to map all possible Requester IDs, so this hook may fail if no
table space is available. In that case, return failure from
pci_enable_device().

It might make more sense to make pci_set_master() decline to enable bus
mastering and return failure, but it currently doesn't have a way to return
failure.

Reviewed-by: Marc Zyngier <maz@kernel.org>
Tested-by: Marc Zyngier <maz@kernel.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v6 to v9
- none

Change from v5 to v6
- Add Marc testedby and Reviewed-by tag
- Add Mani's acked tag

Change from v4 to v5
- Add two static help functions
int pci_host_bridge_enable_device(dev);
void pci_host_bridge_disable_device(dev);
- remove tags because big change
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Tested-by: Marc Zyngier <maz@kernel.org>

Change from v3 to v4
- Add Bjorn's ack tag

Change from v2 to v3
- use Bjorn suggest's commit message.
- call disable_device() when error happen.

Change from v1 to v2
- move enable(disable)device ops to pci_host_bridge
---
 drivers/pci/pci.c   | 36 +++++++++++++++++++++++++++++++++++-
 include/linux/pci.h |  2 ++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 0b29ec6e8e5e2..773ca3cbd3221 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2059,6 +2059,28 @@ int __weak pcibios_enable_device(struct pci_dev *dev, int bars)
 	return pci_enable_resources(dev, bars);
 }
 
+static int pci_host_bridge_enable_device(struct pci_dev *dev)
+{
+	struct pci_host_bridge *host_bridge = pci_find_host_bridge(dev->bus);
+	int err;
+
+	if (host_bridge && host_bridge->enable_device) {
+		err = host_bridge->enable_device(host_bridge, dev);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static void pci_host_bridge_disable_device(struct pci_dev *dev)
+{
+	struct pci_host_bridge *host_bridge = pci_find_host_bridge(dev->bus);
+
+	if (host_bridge && host_bridge->disable_device)
+		host_bridge->disable_device(host_bridge, dev);
+}
+
 static int do_pci_enable_device(struct pci_dev *dev, int bars)
 {
 	int err;
@@ -2074,9 +2096,13 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
 	if (bridge)
 		pcie_aspm_powersave_config_link(bridge);
 
+	err = pci_host_bridge_enable_device(dev);
+	if (err)
+		return err;
+
 	err = pcibios_enable_device(dev, bars);
 	if (err < 0)
-		return err;
+		goto err_enable;
 	pci_fixup_device(pci_fixup_enable, dev);
 
 	if (dev->msi_enabled || dev->msix_enabled)
@@ -2091,6 +2117,12 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
 	}
 
 	return 0;
+
+err_enable:
+	pci_host_bridge_disable_device(dev);
+
+	return err;
+
 }
 
 /**
@@ -2274,6 +2306,8 @@ void pci_disable_device(struct pci_dev *dev)
 	if (atomic_dec_return(&dev->enable_cnt) != 0)
 		return;
 
+	pci_host_bridge_disable_device(dev);
+
 	do_pci_disable_device(dev);
 
 	dev->is_busmaster = 0;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index db9b47ce3eefd..bcbef004dd561 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -595,6 +595,8 @@ struct pci_host_bridge {
 	u8 (*swizzle_irq)(struct pci_dev *, u8 *); /* Platform IRQ swizzler */
 	int (*map_irq)(const struct pci_dev *, u8, u8);
 	void (*release_fn)(struct pci_host_bridge *);
+	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
+	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
 	void		*release_data;
 	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
 	unsigned int	no_ext_tags:1;		/* No Extended Tags */

-- 
2.34.1


