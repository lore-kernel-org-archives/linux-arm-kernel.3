Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB8AD6CFB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 02:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hJ7SiZEYvYAlsc14anCyTZeV+aePRCtmQf6l1HPYF4k=; b=CGDkqs0/UiYCXoIOznlZOJAIwh
	8fx4ZKNXudVArCPqE2yFm/0ud35YmNrabnCPV0YFPaHQmK1zC9uYC1zveH/vqfMp+NjXTsR55VeFi
	SNOw4waD8UYyo6WAdfY0dRL/2jbTXm3wID5BY+LhcAJU++FXQIfRGJSzwvDbURSvBGrjWZG6edVkB
	m+UDKmf7ljx3E5KxuyLdZ0xaGRjpn0saCCeq8JqdgOa3zWRlx2OZwQeYDYzBKXTknkmDnbdvGIEpb
	C1v0jifChsd1cjjsnrHtafEgVst9GL0ZxH9YmZUr4TJetLKl4Q9J6Z/I1iPsMwtnMSdMStzP6BajH
	gyNBB1mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj74f-000000083F2-36He;
	Fri, 23 Jan 2026 02:39:01 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj74a-000000083A4-2Ulz;
	Fri, 23 Jan 2026 02:38:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qoJe4GuFH959Z1rPuEKj+xihqZp6YV96svSt6QFllkxnUdwHN937aOPvHwTqShdN16+5OSJFCoJ8og4RC6Wck4JzNeyV3z1JFK2eZ0xiVdw4EB9Cv8uwg/l9/0QCoU7q1JQ3dCF16+LpMFYGnZRUMNVP3o+CIxYdfLS2t2PEthN8Vat/hHtY4EWRQYg1w6EqQePA3z4FpdrUv8mY7ezeQSszxjkWyozNqMF5vvDKYx8iP4NGYMsTJMG8++PiRgD/GXBz7w5KKEUyw1O9T1kNhwAtO6Uo6RuYMNbjXTUwozjsumfB80wxojsQHeqF7FsRI5OSpoTLaRgKGwySy+hRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJ7SiZEYvYAlsc14anCyTZeV+aePRCtmQf6l1HPYF4k=;
 b=eZKL99nX3p2ODK5rqwT3j9arr2VI1Mf/WITq3k2YZ4H0sjYP3UcPHWkG+9aVjxVdnnNeVOXagFrkOFVRAGLbByT3Mla5Pr56Jof1DdgLA1lfxUeCm3eNmApuDAtMvEvjqIafsdh/U86r1Z/ElABkftfohr4GFR37z55k0clu5s0M+qwjS7BNs1bDIWZQn8cD8IvQK4S5fzmJUXNqk1qW6FTLrU0/orR/NUy9mrzXQo2jIJxpYYUs2tdT6UD/Rxx9eTuXPim8w5RFnHIJNijgPKZBiEnxKO4EUc4GG7hAtNRrZV/CgRClEWiRkCeL3+C7CfQicknaeWuClsNhRUou6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by JH0PR03MB7558.apcprd03.prod.outlook.com (2603:1096:990:a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 02:23:15 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::af44:7e78:1133:adec%8]) with mapi id 15.20.9542.008; Fri, 23 Jan 2026
 02:23:14 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	xieqinick@gmail.com,
	Nick Xie <nick@khadas.com>
Subject: [PATCH 0/6] arm64: dts: amlogic: meson-s4-khadas-vim1s: enable LEDs, Keys and Bluetooth
Date: Fri, 23 Jan 2026 10:22:52 +0800
Message-Id: <20260123022258.136448-1-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|JH0PR03MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: c19f07ce-e937-48f1-a334-08de5a265ccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+AF/klGNoh+EbHg2GxNIy/9NEUVcQ0h6px4U3Q4xIKwgg7ouwFth3pSvVN7I?=
 =?us-ascii?Q?lthQ2SyViEJMgXOwtQxhize1b8zEimhTN0BZssBfDLs67VqFSYejAYYRgiAf?=
 =?us-ascii?Q?/urbrNmuqiQ/9UqvMW0wDibL7YSD5bOwhTfBQ9x85OAU+QgeVemK19BZ0V9r?=
 =?us-ascii?Q?TPzVavxOyIt1YWq0vlhU6Wprak66e9XXtcmTRW5XYQS4yWx4mlNqhWRJ3RFS?=
 =?us-ascii?Q?Z+fzAEj4fpVMmBom4is2ltkXmCcbttHJT4sgYHw9zKDLtP1vXDlMyJ22wcmn?=
 =?us-ascii?Q?S/fnzxmlr8xh5SaZnNQMX/rdCplikdmxgvmsUUHmfgsF1VOPAEawfzLk/aZ0?=
 =?us-ascii?Q?9PtNBdteDZDQjEFHXw37S/mfBlqatFntDR43M5wDm6kkjhpyKjb5ZO4YaS+r?=
 =?us-ascii?Q?gPBufJX2ozJ4AoNpFY4Fn7cMkQZs3RqrMl62qK1q0gzVDX2LqmCDCCzFo3ri?=
 =?us-ascii?Q?wrkZZjQR2alyPDOjxZgYmlnk0bASdET7FYG6xURXiusNuJ4FjBNKihxHSSbv?=
 =?us-ascii?Q?Pc+CMBLHWv1DKCQnucNrHEg8atC2BDJNPQ9P/KwPiod7P+PtY06waCOY3JKO?=
 =?us-ascii?Q?NySZ3zEZnonhV2YPNZXRejBghFNEL7NToUVjXBnVDMn9sVyXH7MNLPuBAjpw?=
 =?us-ascii?Q?DBuhHkB/sJ/pnPuAo2XQvZ5u4gGoZ97Xr9VROvQqmxC61wHZgxgEIq9NRZSA?=
 =?us-ascii?Q?+Z4Lg0gouqYz8OPAtav1VtnU3z7PTyMfUgi68NWV84MVx2dE7FYa3fnfmNmj?=
 =?us-ascii?Q?gY02NGy90DyYdqb9wC+N0z2g/zI2gjsXXHsyRJpKctJIn8pvqS6rofCQHhB3?=
 =?us-ascii?Q?FUoENy6xgF5pji1/UI68Viqvf4NRBaL5b2F1NrMfEm8hWBUqkCHv3SpYyN4O?=
 =?us-ascii?Q?x/wTM1mlbgp0oTkdAcZrMXV/P6V0Ssn5FgjCBAAc0kX6MG0a9xvToHIQ8acx?=
 =?us-ascii?Q?YTYqEDQvz/JxSMix2x1+enevhZAFlFTr26uK0o5Fb0OiEl2GJ5AXwmSemg+s?=
 =?us-ascii?Q?y9wMXr7xies5veNIkteOz81KL9DD8x8lMoK+WdPXJQteKRdZBQANAXYilBLG?=
 =?us-ascii?Q?n+SLkxmm4bb7e/YxKJN/+kCCzQXhmipukBXsyCJF0cCdX1HKG17BJsxZsTDr?=
 =?us-ascii?Q?VWw9UyIJtSQWiqpC8g+J4irEqyunG2EZ0sQf1obYmyt5JOqTeU/jWog/kZ5A?=
 =?us-ascii?Q?IAKBp2EoaOwk9RCeeLGccv08L5H8CP8sGVCKGyN1yM1SU+bDcFmdFmV46vX0?=
 =?us-ascii?Q?V7y3SnM+PuD2/kx63ILBS3KZWgE9HzXEu08nOSyZNHYe+FrlIp8Jg7L3lpYJ?=
 =?us-ascii?Q?xgTMMFO9wd8AuoMnGmgaeF85e06FNfRzDlZh3FscjKGvaIMSHmvzMosAYgLo?=
 =?us-ascii?Q?9D+nJvyWUqKAF50Ltk/guZttLpXKcSpLZOUNuwnkc02fLBpzM8Kg9FG89vML?=
 =?us-ascii?Q?2xlT4JUVJgpbiKdIMRYzwi5D76DJjH3QhubevV7w07hkAkSIj0UPkQmAxin2?=
 =?us-ascii?Q?McNuEPxmDXrcl268yIK/XpcTNBDT8BIHsJTcfQ9Gd0PNpBI+NLNwHercXWkX?=
 =?us-ascii?Q?Lr1f3qfGQGLy14wgijWvepqaHQPksD6g37uegh+v3IIngl1mhoiNIZouzAAi?=
 =?us-ascii?Q?JmFLkYHlAS2rjEDoBZQnKzY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7OW5rtEbHQiwNYPect9idOgK8/wHyUMNOGIGUQZ9dPMutF4OvDVJNpf7+1cq?=
 =?us-ascii?Q?8tvkI/zS2qIDxnmfUCIqOpBStUrJP1M9f3OllCIHoQajfrGDxMwqo8x1KIuU?=
 =?us-ascii?Q?Kv94Gngjh6GxXxmlqQmJP8riee4yfdhqS6cAWCxthfJdWv65ZloaFvqWh2gg?=
 =?us-ascii?Q?a+QBmA5t6Gpz0MZN3MZtkoJqyUw1MLzif8fgaY5lByFsro31yw9TAQ2KlUmE?=
 =?us-ascii?Q?/1muv2nQM908kmC107q7YiUU2tj6knG3wjYKqYIH/YGTDxaYWMceqnXIb8cx?=
 =?us-ascii?Q?UanCEzfS0xHSt9s57sRKrDwEYVq/KSx7TuY7T9ee/KhocM0SBb2IBwERCCTa?=
 =?us-ascii?Q?ZkiIxa8p+q1tNhKKed+yo4EjZY/LpsFHDEPjVrvOL9QkIZ57Ba3oYFNgIcn7?=
 =?us-ascii?Q?kmNX8m0Oa/mVOi0aypvlNnc2NwV+ysZRgHelAw0VltOxk0QugJpm1b1A5CsE?=
 =?us-ascii?Q?k5aTTqISoVqdJ31Kr8nUNw0bXSHNSPR+S4Q0LkxVwAWFZxXHqmY9pQqH44FW?=
 =?us-ascii?Q?UCncvmTNfXRbpVx1YB0ntwyzcJZROo/iqlIguAbOzmAN2xtIMs4DpnlW8MZ0?=
 =?us-ascii?Q?wTvWubfIrmtmvVL5ush51dgVcQ35Ief2ZrlJkvSiwW0KRKk/CqLLmczN34wn?=
 =?us-ascii?Q?2M8N2nU9XiJKlrjYpfdPkcksoRR6vpYVWRCNh4hpHc5tRFMvjieKtPxvW55R?=
 =?us-ascii?Q?G8cJe9u5SuBknz8IybaS0J3cDLoxKktJhDQXPVyxYYMqKl0YLT5/EukQ2zzS?=
 =?us-ascii?Q?Y2woG54SKpG1FHZYu4NzXRJbmejCZGUGoVWWm44PyOpbdnhZneRZ6uEeiT1e?=
 =?us-ascii?Q?aSgN6MC86KJ/DJHQ+VsHHjIZjRQFmjAHtTT7esfvrTPuWONfiBHxp29t4grc?=
 =?us-ascii?Q?jKufwMeIot5HQ5CQXmLzKoQ/RA+EeBAanqAQOVAh6JaU6hrY8Bw7eJo5uzmH?=
 =?us-ascii?Q?sOsFLaBYBVqn+aDNky2RfYH4t5lcoZ1su3zqzA1CSQtSYoAew5g/+sBSQuxC?=
 =?us-ascii?Q?PyJpINIfnYNV1h7nzwxmUpo32yaxfDMp7Hc7nF59StZUOHv01isgLRXf06BT?=
 =?us-ascii?Q?3uRVpvYMHm16KapfQLPu6JLOQrPZ8j6V1fEOBfxDI4o5ED+pPQzWpB0/Vkn5?=
 =?us-ascii?Q?EfFppI3pUJIKZOt3XyTLeBshzyKBmlmsacf5PKqFRBs+9K4YlzOYVHspe1Sy?=
 =?us-ascii?Q?7qiuZVhTiEuthDAzkm0Wk115yygd2FkzJCdAJl87jlQnE/GqS3Mff7JB4PGt?=
 =?us-ascii?Q?JNW3IaNZM+nET1w4zTyVCW1n4JDcRhfLETQGQRyzgFQhKVjc3kgfx0HtcZ7a?=
 =?us-ascii?Q?Ek4rEOa5Bq/DCzjTzRu8fUjNzgGJPHQ94bSsVOYRgAYqfmBI1IcZlOZI/Pcx?=
 =?us-ascii?Q?cNJP0ONDhTqU5XNg20fciN36+NUFTJ/fe0XxdfH/DIKgLKuySvAiJl3lJhI4?=
 =?us-ascii?Q?nvXvW8kq+2ZgM6ZZTy1FF4q2ccSw2DLE0FgG5iHzH/5d5T7loecsJNqZuOM2?=
 =?us-ascii?Q?yu3aAwSuZVPrb7ib8YxGYqwT8RlJBJXx/ir5/69PH8bieY0gPAc6swt4t7Hz?=
 =?us-ascii?Q?XQCR/ZVtUiw4vdTKuD4zywCpsI6Tf0OwYQmKBYXYC9X70yM1PipZHMtpSlIm?=
 =?us-ascii?Q?xYV5bQoJlPKmatEoaLMDg8zfVePTEPyPfYQD2uHBENQFG3WXaa2Z01Mvrsrk?=
 =?us-ascii?Q?XgVB6REkGmVXJIcTvq+EoY+c86+h+nEndiXGK50PXLmHVmkR?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19f07ce-e937-48f1-a334-08de5a265ccf
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 02:23:14.7944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X0iY1L462mNvSCLLo+NuuBXLlkCb5RNxTKpQLO+P6X5cXWPZGHWYUkqaajsxkMzR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7558
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_183856_632375_2F353003 
X-CRM114-Status: UNSURE (   6.03  )
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

This series enables various user interfaces and the Bluetooth module
for the Khadas VIM1S board (Amlogic S905Y4).

This builds upon the existing board support to fully enable the
user-facing peripherals.

Summary of changes:
- Enable UART_A and Bluetooth (AP6256)
- Enable PWM_G and the Heartbeat LED
- Enable GPIO-polled Power key
- Enable SARADC and the ADC Function key

Nick Xie (6):
  arm64: dts: amlogic: meson-s4: add UART_A node
  arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable bluetooth
  arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add PWM LED support
  arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add POWER key
    support
  arm64: dts: amlogic: meson-s4: add internal SARADC controller
  arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: add Function key
    support

 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 63 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     | 36 +++++++++++
 2 files changed, 99 insertions(+)

-- 
2.34.1


