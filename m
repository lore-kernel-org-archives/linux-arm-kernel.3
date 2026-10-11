Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC91ECA9EC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 11:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gldz2JbW+TjrlfelDDoY1Vmm3XqHEknqc29yKO7e/Fg=; b=nzH0VcVrHd8x6LkkA+7mfvvx61
	0uUWdNkeqPE0qllyrPq+lzwFj/A3Ali8lblhCgmqlLn9m/ISGdYU3IsKx+9+E7WyGhUGY+vN6aAzT
	llfoMZlNvjJpTMp5wVRJqxAJau8n1S7N2tXANrJPPTgCIHPRqDPbKMyC4X6IDAocscklKyF63dEXD
	ixf/UiDqSJ0Sx4gThlcr7P8gROYUeQBUTitOhf6Oa5Q/rveZYsgcMlRd1Sw7OYSWqe0vGBkfpupwl
	jz5ym+QmNXtPTHaLJeM0nz4YryL4c7m8Gwxnr4wW4E1AOwyCF77H968vreobeglQ5oQOpwyuUQppp
	Mt0KsO7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFs80-00000008xpc-1teV;
	Sun, 11 Oct 2026 11:54:08 +0000
Received: from mail-francecentralazon11013015.outbound.protection.outlook.com ([40.107.162.15] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFs7x-00000008xp3-2Kcg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 11:54:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3yG4pqgHiCtpuDhofZjgGxN0tIwcbkrtRCirWazCgA4erUnrHUqdV6RwOuIM5gD10k8LaAm6rFlCEIQZTd74VKsXKhltpPAxny3uJ4x4YDu4kDRlsI1GTTMNnLrc447+Zhc8E8gQdIcQkMY/4xKD3vyliC1u/J2OMq+CZ4vU4h0jLVnNhQwAiiN7cy5OkNjOi5uUhayucjv8tVegF7OvuZveKn41Q2RQvVcSWEDk73OeSyLBKUyP86A3OYwHQWEV9Gofz1lJKJrp+2gMVgJ5uMg+xCOuSxed3JkUjcfHXTkAVTtwcwAhB3GhgUQPvZZ2d7ZzZos+PgRsFljGKaLeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gldz2JbW+TjrlfelDDoY1Vmm3XqHEknqc29yKO7e/Fg=;
 b=hEwtsBo4O8bVh5XAi+6aw3qEao0fLNhf8rBF4bby/oWVkxOMAmMo4htpmeFW35v3lCPHLw5aSwzv374t4zC73mTAZijmXwfSHtEI6YMMPsiONWARByOzfG9U3aisYMslWAPUTPp2AWORlgS7Ko8QDFf4vi4BssGIYmqY5Ng6EwQvTqbkevDBCXbmTAgOa4hgd3AxrKzxRg+7Tqu16h06A/z3OhJIOX4MNij7aeOqkPbvXBhAykW132/1MJMdx+rkk8d02pYk8hZQU8R0M2CN8zU0QXfnTbphX9kUNTVg+hYJlmPgT7RBFLk+27dz58r9UK4w6usBO565h0QtsG/thg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gldz2JbW+TjrlfelDDoY1Vmm3XqHEknqc29yKO7e/Fg=;
 b=rYXcJASTNfUWmwnN95c/SlkSenM5Zn5dOZvZ5VlkLGY+rGiyeRdcJX4x9sN47WH0nHfQK1VU0eYQYX5bMCyNxcxD2OzwLIMvv4WheLwR85iWvIkFY5f8q1J6GGR+V9Wm0nib6x7oTGHRpGT1kCfptr5o/TNwSI/IP9tYn2EHl13moECSHpwpPyTx7otQzNjPa3j02N5ag24sTHCEnO+s/kbeiJ6x3D3WfvHS+JwoFmBYOJrfmdwI7lzmMqKsEI7QbXbCTwxwb1eVklE1CDys7bqCysoRHNXaZkUnW7JBXIcE5KNWj+DtCRTlpuDL4jBMvZ6m2qzEK2pkgTaLwgCNSA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8389.eurprd04.prod.outlook.com (2603:10a6:102:1bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 11:54:00 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 11:54:00 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v6 00/13] gpio: mxc: bug fixes and probe cleanup
Date: Sun, 11 Oct 2026 19:51:21 +0800
Message-Id: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADl4y2oC/33NQQ6CMBCF4auQrq1pCy3gynsYF+10qjUKhALBG
 O5u0YVoiMuXzPfPgwRsPQaySx6kxcEHX1dxqE1C4KyrE1Jv4yaCCcUZS+mp8TW9jUDhirrqG4p
 ZCaCEAsmRRNa06Pz4Sh6O7x16c0Ho5s58cfahq9v76+fA57s/+YFTRq22uSgARe7EvhqbLdQ3M
 scHseRyhYvIjYVUO2NSiT88W/J8hWeRQ+mkLoxk1pXfXC44ZytcRs5RlqisdZqxD5+m6QnHBJ+
 hfQEAAA==
X-Change-ID: 20261003-gpio-mxc-cleanup-e49cc626c51e
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: e8a39cfd-1e7c-472b-d141-08df278e5675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|23010399003|11063799006|56012099006|18002099003|6133799003|261009223027099003|261009221227099003|10067099003;
X-Microsoft-Antispam-Message-Info: W1EPuOSPIAKTC/ui08Oo8HurF0b8JDacB60hfXLjdUJ37xKYxqZw/dBH24Jm8iWQ/+qCOixar7xI2KNB59Uro6DjhuMV5aeVudzeJh63QjNv2NXHjJ5XNSmFAe9CMBP6IYcesPYJLAvEDIPmAQHXGDxpj58frFoFhy+vSDPIYgaTuMG6yEtO8Cd8QW1PjP2uHstENcwCdo98dDa4R/uqwjtLXoRBYBFpaxaXMF1vIuUjGtyE3Ud2b+5KiZya0+GNvNH6x6pAGF9gdXrXQQydYPwc2Uur8v7xMhv4rf/0N+AcpiR1p26EBBZP2GND4lmENOcKi8/MnD55C6x42VejX5BW9ItmqyflxuyFDwa/lqvfYemCAwhT+hAFDN+ngZCv/zgzq/eZGlej0O+nOVHfSt1053rCBHg4pURH28+kT5JSPZvJowT5hjGcsTfenuBTi8KEaCc1ax0HvDfeU9jI5N2uWRBnnBHljpqnNSjbb2fVQIc7m2BFkK314aUtxUNp7ulPyzuTZvmBnQ01UJJC/QR9XjrZck/0D8zTpwQvZmUBdOhZuaQ07d4b4q4cmt5cNaXucJ9wM2/Y/gMnf5EfvbkgDqDLPupj0yY8Fm5MZcEepwwzTJXYUVcBGfCmXChz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(6133799003)(261009223027099003)(261009221227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGRGVlJkejd5QUZWZHhFSVZrQ0tob0ZKRWtjeENGWmQwcHQwam11NVJwOUlu?=
 =?utf-8?B?M0ZrelBKbVFTOC9pRlp2VDk1aWdiZWM4MFkvNkhIclgwbFA4WG1nZUU1UHZP?=
 =?utf-8?B?RStmOHNtcEJBaXJNbnBGS0pkVXB0WVFFK09LT0x3eVBaYjFCNmdUVWo0V2ZZ?=
 =?utf-8?B?K0RKRG1iRmwyeGRWN0x1NXQycytldjYramtWMFVmVXNyZUVXcDE2eUthVXp5?=
 =?utf-8?B?aklHUFhVakJ2SlRSRDNHWUJnV2d2T1VWQXQwVHU4UmhHdGJzVDI0QWVSWjFv?=
 =?utf-8?B?TVhMSFRKa3hOdjZ0SFkrd2RwbS9QZ1NBb2ZNWThONC9lL3doamY1Q2F6MFlY?=
 =?utf-8?B?bWt4QnIxZzNBdGlGTnZXMHhSeE02bUhtRVZQOHVFMEh4dzE0ZmZtQlJDYng3?=
 =?utf-8?B?VjJWSG50QzIwNEhXTm8vcVFiakdRdG9rek9pUkxCQmtBMmlzeEtrTG91OTVT?=
 =?utf-8?B?d3M4a05jSWc3KzhZUFhIZ21GNW9CVDl1bzhkdlp1TlpCZGd6d2tJcW0vYm5I?=
 =?utf-8?B?RDQ5UkM0WXZMZU5oZDhJWXNwSzhiQkJTZnYxajdQdm9DTG1UeVgyQmNHeFBC?=
 =?utf-8?B?Qm9OcnA1TUN3YkhhZytpa3VwUjRuOHhDQXhBU1djSDV2Q3REZW4zYkZsQ0VB?=
 =?utf-8?B?cEhUYmdzTlNDNm1GOWo1RGpxVUVzd3B6QXZHdE5IWStpSUFzUmJtblREdXR0?=
 =?utf-8?B?NVFVY29iNE1WVWU1TS9FbldJblVxRlZ5RkxRSjhqVVhvRVR4cGwrV3preFU0?=
 =?utf-8?B?N2pPSmVheFFsSFM4QUlnTkcvRmJ4ZUwrdzFrSzQ0STZJNXRNejA3UEtEKzAz?=
 =?utf-8?B?Q3hPQVNUNDdSV0lPYnU2OGNKSFEvci9ZMTVIZEpsODJOMm5OWXRvaTZ5NXRP?=
 =?utf-8?B?RXpreUVqK1dXMHhwVE5OeVd2bWt4QW9DaEk1MHFvSUtBbllDVVlHR2ZVa2FS?=
 =?utf-8?B?c3NrTzRQb3hselM0VXRJc1FTMnV2RjZxUnozWHZ3VVdWZmtNZmdrRWlmeGpz?=
 =?utf-8?B?c0wzRXV2elNKN3NjamdXN2MvSGZicHI4djA2cHZmSUMvWDArL1VEcFA3R09m?=
 =?utf-8?B?Szg1YkhYNFlsUzJEcHdMZUlQTEFOb3g1a0NOYjZTSEtucUU4MHJuUTVMMlY1?=
 =?utf-8?B?SmJUaVZBcDFZTWFTTGV2MUJNWkV5UE5KMWllMk94Q0dpcG1tMWs4V2M0NGhl?=
 =?utf-8?B?cHVJY3BVTllNbTk0czRQV1pyTFpMRGlZdUk2ZlRQa0ZFaGVlQUNRc0gzTDZn?=
 =?utf-8?B?N04yTkVicWs2cldLTkxPUnJiOEpxem5WUGhXQWEwMVF1bmxFTG9rTVhOUVpo?=
 =?utf-8?B?OStFWGZ6eFB2WmxYZ2tSUktHL3NoVGd3QW8yOTFvNHlnRWZIMEJqMVEzdzFR?=
 =?utf-8?B?R015ZUNMUm9ONjdYcFpNRWxkSTBweFlQMkJycHZ4UFJSbFZ0eFlDeHh3Wmx0?=
 =?utf-8?B?VTYrNzlZKzV0VkVVSWdsSkRIcTRleWdJWjBtK1kvc0RNUnREVGY4Tm90NnNY?=
 =?utf-8?B?b3ZQdVN5ZkptZHRGdjYrNEFWd0d3NExqQlBxc0dTbWFlWFREMmxnYk51aERC?=
 =?utf-8?B?cW5KMllKKzUrK1MwUWpqU2xTTU9IdHB5NlZzYTB5V1JzTEFNYWpLeDd3OGZD?=
 =?utf-8?B?MDRlR0ZVZktQdHYxVDYzYW1GK0F0ZXN3aitNQUVaY0RGOU9jdk9oVWtRL29a?=
 =?utf-8?B?b3R3ZWE4T0E1dmU2SWxmUytwR2N6V2ZJcjk0NDlUeHg2WjJ6SmlWMEJ5czdm?=
 =?utf-8?B?NjAya0FuZnJjcWZnKzRKZ1pQNTlJS3BjZk9vSThwek44Y1hISXRoblNCOXdV?=
 =?utf-8?B?RG1hV2RTTjZwTDM1NnFITmZoRU8xTFpoR0lMajA4Q1FKd3NnOTZVSmw0bUNH?=
 =?utf-8?B?akxOY0I4Q01MYXZVZDVFaVhXd1FSUHF4cU1reGNLZWVOTndaZ0dJN3lxQmRJ?=
 =?utf-8?B?ejB2TlQvMERWbURXd2xwOHNqa3NjZkU1a2Q5S2hYSHUxblNkYnFjSE1uOW1i?=
 =?utf-8?B?QWl5VDdvbjlwbzd1QmZ6L01jWmlZYUIrY1pSSklZd3JYQXEvbUs1L1V4YmNn?=
 =?utf-8?B?RWZTbHpGcm91Z1J3MUNXL0s1bjVFRFJ0dnovZnR3Wjl1N3BWcWtDSFdpc3A1?=
 =?utf-8?B?Z1gzNkhBb3VZU0NzaUUvS0k3YmJVS2ZaUDJZUnB4VVliT0taUTdjT2dDOU9U?=
 =?utf-8?B?MHVwTnNXWjVsaXl5bzBNZnNHUWZpMEQ4YjJaWnlIck1UOWpsZlFyMkxydDJi?=
 =?utf-8?B?MkVJODA1c1VrT0NiUitMOEtxWWl0QksrRHZTZHAvRUc4bTdIdEMvNnhMZ05y?=
 =?utf-8?B?WmJkR1llM083SFo4enlld2ZVRkgvcFo5aGUrMmJrNWdXeFF6ejJiN28wdHoz?=
 =?utf-8?Q?tyB8F9moOb/AkQv4pFZjKG/J+LYOY2/LiBlFR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a39cfd-1e7c-472b-d141-08df278e5675
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2026 11:54:00.0624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrSJFF8Z8Lotk5QJ3M2xG5r/4omykudmC6ZHw7eQGcKiwfD3QgzQrhgS61cutykNdv9ds2sCv9gV4LijzXh543cu2GvNb2y7Jnx4GcxjG4OenL5eMgCHgtETBDA+eOC4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8389
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_045405_762681_06741A56 
X-CRM114-Status: GOOD (  14.82  )
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

This series addresses three bugs and then modernizes the gpio-mxc
driver's probe path.

Patches 1-3 are bug fixes:

  1. Fix a race where the chained IRQ handler is installed before the IRQ
     domain, generic IRQ chip, and port list entry are ready.  An interrupt
     arriving in that window dereferences port->domain while still NULL
     (mx3 path) or walks an incomplete list (mx2 path).  Move the handler
     install after all dependencies are set up.

  2. Fix non-atomic read-modify-write on both_edges.  gpio_set_irq_type()
     can run concurrently for different pins on the same port (different
     irq descriptors = different locks), so the old |=/&= on a u32 is a
     data race on SMP.  Switch to set_bit()/clear_bit()/test_bit() on
     unsigned long.

  3. Fix non-atomic read-modify-write on wakeup_pads, same class of bug
     as both_edges.  Switch to assign_bit() on unsigned long.  Also fix
     the bit being updated unconditionally even when irq_set_irq_wake()
     fails.

Patches 4-5 are wakeup_pads cleanups split from the fix:
     consolidate enable/disable_irq_wake into irq_set_irq_wake(), and
     use for_each_set_bit() for the pad wakeup iteration.

Patches 6-7 replace runtime of_device_is_compatible() calls with static
per-compatible hwdata flags, eliminating repeated string comparisons in
the suspend/resume path.

Patch 8 introduces a local dev variable for readability.

Patches 9-10 convert probe error handling: a __free cleanup guard for
the pm_runtime_get_noresume() balance, then devres conversion for the
remaining resources (irq domain, pm_runtime_enable), eliminating the
goto labels.

Patch 11 switches probe error returns to dev_err_probe().

Patches 12-13 are cosmetic: MXC_ICR macros with field_prep/field_get,
and BIT() macro for single-bit shifts.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v6:
- Patch 9: use retain_and_null_ptr() instead of no_free_ptr() to disarm
  the pm_runtime cleanup guard, as the return value is unused (Frank Li).
- Minor commit message rewording for patches 10-12.
- Collect R-b from Frank Li.
- Link to v5: https://patch.msgid.link/20261010-gpio-mxc-cleanup-v5-0-1e59e6ddfa00@nxp.com

Changes in v5:
- New patch 2: fix both_edges race using atomic bitops (set_bit/
  clear_bit/test_bit), prompted by review feedback on the BIT() patch.
- Patch 3 (wakeup_pads fix): split the irq_set_irq_wake()
  consolidation and for_each_set_bit() conversion into separate cleanup
  patches (4-5) for bisectability.
- Patch 7 (pad wakeup hwdata): renamed MXC_GPIO_IS_IMX8QM to
  MXC_GPIO_FALL_EDGE_WAKEUP_BROKEN to describe the property, not the
  SoC.
- Patch 9 (new): use __free cleanup guard for pm_runtime_get_noresume()
  balance instead of devm_pm_runtime_get_noresume(), which would cause a
  usage counter underflow on unbind due to the double put (devres +
  success-path pm_runtime_put_autosuspend).
- Patch 10 (devres): dropped devm_pm_runtime_get_noresume(); the __free
  guard from patch 9 handles the usage counter balance.  Fixed stale
  &pdev->dev references that should use the local dev variable.
- Patch 11 (dev_err_probe): fixed &pdev->dev references to use dev.
- Reordered series: moved "use local dev variable" before the devres
  and dev_err_probe patches so the local variable is available.
- Link to v4: https://patch.msgid.link/20261007-gpio-mxc-cleanup-v4-0-c9f5a8b50df9@nxp.com

Changes in v4:
- Just a resend of V3 with below changes.
  Add R-b from Linus for patch 10.
  Update commit for patch 2 and drop empty line and separate
  for_each_set_bit changes into a new patch Per Andy.
- Link to v3: https://lore.kernel.org/all/20261006-gpio-mxc-cleanup-v3-0-129f93302a90@nxp.com/

Changes in v3:
- Patch ("gpio: mxc: convert probe error handling to devres"):
  Replaced pm_runtime_get_noresume() with
  devm_pm_runtime_get_noresume() to fix a PM usage counter leak on
  probe error paths. The non-devm pm_runtime_get_noresume() was not
  balanced by any devres action, so any probe failure after the PM
  block (e.g. -EPROBE_DEFER from devm_gpiochip_add_data()) would
  leave usage_count permanently elevated, preventing runtime suspend
  on re-probe.
  Dropped the explicit pm_runtime_put_noidle() on
  devm_pm_runtime_set_active_enabled() failure - the devres
  registered by devm_pm_runtime_get_noresume() handles the balance
  automatically during probe unwind.
- Patch ("gpio: mxc: use local dev variable"):
  Keep of_device_is_compatible(), only focus on switching &pdev->dev to
  dev.
- Link to v2: https://patch.msgid.link/20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com

Changes in V2:
- Reworked compatible-string caching (V1 patch 3) from probe-time bools
  in mxc_gpio_port to static hwdata flags with per-compatible data
  instances.  Split into two patches: one introducing the flags scheme
  with MXC_GPIO_HW_DATA_COMMON macro for power_off (patch 3), one
  extending it to pad_wakeup and imx8qm (patch 4).  (Frank, bot review)
- Replaced devm_pm_runtime_get_noresume() + pm_runtime_set_active() +
  devm_pm_runtime_enable() with devm_pm_runtime_set_active_enabled().
  Keep plain pm_runtime_get_noresume() (non-devm) for the probe-scoped
  reference to avoid usage_count underflow on unbind.  (Frank, bot review)
- Replaced irq_domain_create_legacy() + devm_add_action_or_reset() with
  devm_irq_domain_instantiate().  Squashed with the PM runtime devres
  conversion (V1 patches 4+5) into a single patch (patch 5), since the
  goto labels cannot be removed until both resources are devres-managed.
- Split dev_err_probe() conversion into its own patch (patch 6) for
  bisectability — patch 5 uses bare returns with correct error values.
- Folded gpio_set_wake_irq() assign_bit simplification (V1 patch 9) into
  the wakeup_pads fix (patch 2) where it belongs.
- Used 0x3U (unsigned) in MXC_ICR_MASK() to avoid implementation-defined
  behavior when shifting by 30 bits.
- Replaced linux/of.h with linux/property.h to match the
  of_device_is_compatible() → device_is_compatible() API change (patch 7).
- Added return-value checks for devm_pm_runtime_set_active_enabled().
- Fixed stale error code returns after devm_irq_alloc_descs() and
  devm_irq_domain_instantiate() in the devres conversion patch.
- Link to v1: https://patch.msgid.link/20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com

---
Peng Fan (13):
      gpio: mxc: fix race between chained IRQ handler install and probe completion
      gpio: mxc: fix both_edges bit operations
      gpio: mxc: fix wakeup_pads bit operations
      gpio: mxc: use irq_set_irq_wake() to simplify code
      gpio: mxc: use for_each_set_bit() to iterate wakeup pads
      gpio: mxc: replace of_device_is_compatible() with hwdata flags
      gpio: mxc: convert pad wakeup compatible checks to hwdata flags
      gpio: mxc: use local dev variable
      gpio: mxc: use cleanup guard for pm_runtime_get_noresume() balance
      gpio: mxc: use devres functions simplify probe code
      gpio: mxc: add dev_err_probe() for error paths to help diagnostics
      gpio: mxc: introduce MXC_ICR macros and use field_prep/field_get
      gpio: mxc: use BIT() macro for single-bit operations

 drivers/gpio/gpio-mxc.c | 280 ++++++++++++++++++++++++++++--------------------
 1 file changed, 161 insertions(+), 119 deletions(-)
---
base-commit: f0406245cb9855e6318335a8a223551354291a46
change-id: 20261003-gpio-mxc-cleanup-e49cc626c51e

Best regards,
--  
Peng Fan <peng.fan@nxp.com>


