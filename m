Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41B4D591B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 20:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjltTYAiP3JJUYeKeACfTOThUjyhe58YE6Cz4xazx5Q=; b=dTtg6hfQsPowlFbijgxTK3D9L4
	e5o0MCVLKz30NBYlx1IXhvHZG8xL3hPwKoF4dIOqDs//XiXVDqVCdzM53lYNwZ5EAaG7ha295w6gy
	HRE/Gm8FWeWT+2Ed6ApDvYb/vbZHztkYWUvFFTv7gUrYsep2idwWVAAaqLFNZUvgaWeMcxZFF4/8V
	rcgqmJWI6CBYOa4cavvTHAEHwg5iNMVszr4hv7UcgsAJv4etyqtg/zASxQpmr82cqrZ2uptWdWVYf
	jrE5YSQAStsZRcSJx7iKyOeuhyQziNmN8THyZ5xzmPZNg7gDdbAkQyrilO+DGwESWf5YeYu4JU9bg
	0A/l/g3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD8Ki-0000000AZFh-3qfp;
	Mon, 18 Nov 2024 20:26:52 +0000
Received: from mail-westeuropeazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c201::] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD8Ir-0000000AYrl-10hP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 20:24:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvunnkEcL7GTCkp35VoxoIqSSaZrxz7TLHneTpFGe+YNTUDe1xGefN3AvvnbcBaMiUvPJNHQcLrv2RHfGiuej23g/P6f2KI50w3BsPgvZr8S6AhdtbgKz0O64SUcl22bue9ZzyPFlp5NrQQncun7hpFyBowzVAhJud76yeeaJX5NYFA2pwyyN8EoDfB3YkqeysuHU11JKG6T3FXNsuwlwbLM8vC174zIndVVvWiO5aFUoT3IZOz/9aq+mDDE1mrS8g9p0Jf+4KQIj8xzfrBb6N4C4Z65IExrvA6lmsYGZEbf1Q16KZJwiNWlsPFQscUtXbZIfswFPerazHsRl4mESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjltTYAiP3JJUYeKeACfTOThUjyhe58YE6Cz4xazx5Q=;
 b=TCLRtnI3wekOXp0KceJ5Z4LBrTGQFCD47f86DzqCfOgyulVZQAvlX3hWjbHmcvY2ITvtP1qy0eMbX1fkcGyCiPCM8jPJ43AEU4PVeDnR5szD/83ZF/uVAEaBqDMm34vrbGYVk0/vHOVvwB7KlY2Jtt+CM7IUMMUmC6O0D1b/04o8hUT3XOPrX4xVNPQKcN5MvY06L4Gx+pblMrl3ZnU4XOAOfU9TObZIvXE4qzvkjYL147QOtyE4+Kon8bkCc9loYK/fX8GYWGkHNWOOHggzQMHFEjP88p4XRI6JUiLJblLjdhGLg5zvup5zVP+YC0tjJnvoHB1ZnfnXW4Me6KhaeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjltTYAiP3JJUYeKeACfTOThUjyhe58YE6Cz4xazx5Q=;
 b=eYYu0VybZ8ZegWPl6BbHHg2bJL5XsReDycX1ze2cOGtOx468zV89xGN1UiEBWZzwb4IsqZSHBQJ9LbTErvBp9YZY4o/a3xNAfmNaRe1FDGIlt0fH0zlqJT/lP9i1h+KBWb2Fzp8HeHZzUa3q4fniNoRzwuZPDO9NuvMCcaXcys5nrxfGHwM/WeL31nrGlPv3R6/cBA1bVj7qJIrO9QmhiXvBcC2tkw2kudA6kQEjpnzAk5HebIyZgcVEk/vKwxoWlz2Pzb1eZOOJ4Wi5g5MQR2sKxtGhIL1nAM6X3NGl7aUwMzqRBHIoCVE8Oc3NYAlKDHSEPAVA8exYvW/w7nRpYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB6858.eurprd04.prod.outlook.com (2603:10a6:10:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Mon, 18 Nov
 2024 20:24:54 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8158.021; Mon, 18 Nov 2024
 20:24:54 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 18 Nov 2024 15:24:27 -0500
Subject: [PATCH v6 1/2] PCI: Add enable_device() and disable_device()
 callbacks for bridges
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-imx95_lut-v6-1-a2951ba13347@nxp.com>
References: <20241118-imx95_lut-v6-0-a2951ba13347@nxp.com>
In-Reply-To: <20241118-imx95_lut-v6-0-a2951ba13347@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731961482; l=4315;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=LM4nM4pq5iLunWRIpH0m0Z9TCSc7rsvjExDSEjrn0cU=;
 b=J+WakrLToP+kpt9NmKzlo1QeqlCklM/+nIXuqTtTPTDbLN5wMYV/iPqKiox43tVtV5xs0XKni
 tyubh5j/4wuAzoA5BKMgMrGkSknQAM166M719sfGQdRfvBHAqVzHrWQ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BYAPR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:a03:54::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB6858:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e5e3b0a-817f-450e-d076-08dd080f0ffb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MW9CVzlDM2dQQ0hVbVBHYm5uSTdoZnBHWlRZNjl3QkljQUxBMm1BQ1ZGRWdV?=
 =?utf-8?B?SDR2K09hYStBQzhDTXJBcEJ2UkJBbFlrMkEvbzlzMWg0bDNFN1dIMHFvK1c3?=
 =?utf-8?B?TWEwVnd4SUNsRkRIUkFtMnVRTHV3ZUh6UTU4Tzh5cExUekUrSEZhVjltc2N6?=
 =?utf-8?B?YVJRWFpTbHgrSEZQSDVUYU11NnYrbXJqTGVSWEZSUDVySFZqK1hjWGFoeGFV?=
 =?utf-8?B?YjZIZkdpOG5weC9BblhYdkJxaGdRUTdWNW1UdmR0eUEydjgxbS85MTA3SWo1?=
 =?utf-8?B?SEZSV0hGdzdxSWdyZld0Q0E5bHJaZzF1VUdIZEgwSm5yai9ZaTY2Vmd4bkYx?=
 =?utf-8?B?WnpXcVNIWjJzREJBc29ZclpvazdGYndtNjZOdjU3WHpxdkRVejVhWk5wOXYy?=
 =?utf-8?B?N2dMNDlXZ1M2dG5jclFSbGRPcTIxZWprbTBZUFRqdExLZGpJZzlHSTJCZDht?=
 =?utf-8?B?bS9yeGpqTjRNUW5QUVdEQXdFT3lVQlAzN0FGL01VL1hwaEREMFhsbW5oR2ZK?=
 =?utf-8?B?bHVYYVpTckFjaEhJa3lLU1AzNE9Hc1VVODhPRXlKcmdXcm5jRlBIVy91ZVFS?=
 =?utf-8?B?eFo3NVV1enJWcnVDVGhLTzFNcElEakdPSmd1NzR6T3ROR1FxZ2lyM0I4ZUlh?=
 =?utf-8?B?UWx1ZzJhNnNQU1RtMzFKcit3d2Q4MU5SWm40c1lVWEtHTGpjNDlNdXJyWWpY?=
 =?utf-8?B?VlVxYkhyTFZvMWlJY3R1UUxUWnRXWHdMYTR3QXl4aUFtWVBPVnJwdUpETENB?=
 =?utf-8?B?YVR3QXNUOGIvaHJiSngvcWIrMUFtSk50OGEvblpDK3N4bHNNQytKY2ZFVkc1?=
 =?utf-8?B?bHVUMnJGemxWRkNPb1NkVWtsUncxNVc3OXRWdU4rWm9HYjVPZHAxdkorVWZn?=
 =?utf-8?B?aVVZbXM4STlhUG9ENHNBT2xqcmtUT3ZKS3VHRVF2Z2VQV1cwSElxVjBSWU54?=
 =?utf-8?B?L1lYRVhLWlp3N3dXYUpiY05OZ0lidEl2cG8xVVVDSG5SamRDUVR2cW1vQktK?=
 =?utf-8?B?d2xneXNxWGUza1ZTWEY4SGQrODVKbDYzVDVsRHdnY1hHNzVKWGIzMDBCZk5j?=
 =?utf-8?B?ZU51ZmY1Mm94ZExqNGZweWxTVThQNmFrUkF2OU5RcHZDOUdqcjN3eXZxVmZD?=
 =?utf-8?B?bDJRSFQrb0d1RnNNaHJtcEROUVB6SlB6RVhZNERBVkRTUm9tR3RCQjY0Nk9R?=
 =?utf-8?B?L3IrL3JzOGtYTFUwTXZUVnNxcldTbDZyRzdDY2pQVGhUTGFPZlFmRU91RkZG?=
 =?utf-8?B?Ni8rdVAzakhubnlNSGxQZUhXWmtZV2NrTXo4TGJ6blh6Mk5vd3JYYXowRE5H?=
 =?utf-8?B?KzhLSm5xNGxaV3hVRm4rcUtnNW1iU1RYcGJxKzhQeDl5UHl1WjhQNER5eUV0?=
 =?utf-8?B?c3cvOE0wTFM2TVhLei9DNHlNOXlSUFBLRy9pQW1na2pFSFVJS0V1UGt3QjJB?=
 =?utf-8?B?KzRBMjlJeFVaZlRjUDJxd1BvZE8xdS9manhZMG4rS1JPMDRzbkdDSm9KRWpk?=
 =?utf-8?B?U0hXUzIrcHl0VkpINElqTXJuakt1Y0Fia0VyUEVxVkZaRVlrcFpHOE9nT0NM?=
 =?utf-8?B?aG01VkhPZi80d1RXU201RmVLNzJ3dkhIQ0M3d0FFd1hybCt1M0ZsK2RVWmww?=
 =?utf-8?B?Z0tpbGRueGMyV2FGbk5VaDRRS1Y4a2x4MzNub0hsZk5PSUd6ajcxckYveklQ?=
 =?utf-8?B?WWpka3hCcUNkNzl5SmRCcmw0dW9saHdWYkVJRjBKTFVjaE1WQTdUWWF0eDJS?=
 =?utf-8?B?MVQzbzFuZlVhQzhrOHdPTnV3OTVBb1I0OTFlenFzdlc5eGcxc2RvWFpKZXlD?=
 =?utf-8?B?cVdrZTNjQ0c2b3VocTc4dE0vUXRCcENHclNUeFUxUUI2d00weVhrb0VJUnNu?=
 =?utf-8?Q?4EoNXHV7MqdYc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGFIT2JHb2pzbUt6NUdBdUxXTGUxYW8vZDZiZ3ozekhwSHFKSEhqRDlua2pT?=
 =?utf-8?B?NzM1bElYcWV6dHF6UlU2S1lKc1liWjRsMkhNcW9rUndxeTAwbS9WdUlvMWk0?=
 =?utf-8?B?bkRTUFFocFI4azd0OW11cFlqdWE3elgranhQTm5ZUERUN29sZW1RdkI1UnMv?=
 =?utf-8?B?SnFpTUFqOW9ZWkExTXViVU1WUVNvNmVvSDZNb2huMXB4VTF0VkVZcnJTaS9q?=
 =?utf-8?B?UWRUb3cvUTArWnpDMWpOdktCcTZaTlhGc3NEY2d0WHc3OVl6cHUxSzYrdEZU?=
 =?utf-8?B?K2J2Mm5KeWljSHJQSmprdE9IYk4yZ001eVRiMUlnT1luRndCUDdySEJUdkg2?=
 =?utf-8?B?enNTOGpVTGw2ZFBiQ3B3blNLWW5UTFRVTGlianJ4TG51Kyt0OWEwMld5TjZS?=
 =?utf-8?B?SkJ4dHVNMnoyZHJEZ2ZOV0V0VTh5UzVGeXZuQXlua2E3Qi93TTE0blNlVzgv?=
 =?utf-8?B?TFdyY1BLNmNRWWd5U0QzTkxtbXZUbnVrOXlPclJ5c09OamlRY0hpcWtudHJJ?=
 =?utf-8?B?ODZPNUV6U0t1V1BocGI2R2tTOEk1TVpJRlN1TlgyeXRMV2ZEZkMvcXlwTWJV?=
 =?utf-8?B?ZllMTlN0eW1pYW9HSERXUHZKL3JKdGF1bG9yakRXUnMzVnJtZ2xyclZNVGw4?=
 =?utf-8?B?aEF2WldLbmlRYmFUZk1pOExEczNycXBYRGhSaWx5OFN0RHFvYUtwajZzaW91?=
 =?utf-8?B?Ky85M3l4WkdoOUh4b1ZoMXVPcVdMQVhLdks3VWpLVFZSblh1bnYxa3NJbTRF?=
 =?utf-8?B?YnpYWTNWMDNrZ3RYQXI0TWRKaTdpeEpPcE53L2xQWGNwV1ZKTVRPSWh1MTVz?=
 =?utf-8?B?c3E1S3p3dkNpUWxsSFZrWFg3NHNZSzlEN1gvQXVyeWNLMldYdWxKQzFVQThQ?=
 =?utf-8?B?T2FwQmtpSUY5NmdZZ2ltNUdRc0wxdWxXdWptTU9VR1oxQnIwdWhtS1RSZWZR?=
 =?utf-8?B?U0pPUEtTclNYNkswTldsVk44aGhEYjdBbHY4WUpYK2h3dGNvM240ajI3RXRn?=
 =?utf-8?B?Q3ZzSzRyNVJKNnFXc1h6NFllZis0elFpdTYydTFkWnd2Mm1mUnBjQzRsSDNP?=
 =?utf-8?B?ZGQ3aEVpTDJkQWU3SHFTWFhEWWR6aUNFbHEvdFhEeVpDWU5NWDBESC9jZERr?=
 =?utf-8?B?alNLQkpFcVQwd0QyckNIcHl6WnhXWmM2bThVUVA0aW1QSlZXandwRldSRXJM?=
 =?utf-8?B?aWVIVysvTW1wQldsZndNVzZxOUtlb01WR25hblhMb0VJdFFHb0ZYOUVtaHdH?=
 =?utf-8?B?MG9jOTA1aFF3OUl6MVVGeWNoQVpMYk1sSmhFQ1E1M2pYYXFLVEVmbjdzNFlJ?=
 =?utf-8?B?b3lIVDBpd1BKQm8vREtPK01TRGlmVFg2ZkdtNkpEMGFqT1NHRTBCVFFxVGtq?=
 =?utf-8?B?cDRLYWpoYjdud0hobWJtY3h6ZC95WVVINVU4K0xNdmVEUktqenhOWnNpKzd3?=
 =?utf-8?B?SHUrSnBLKzlTUnFvZnZobE52a1lGUDFWZ3RaTXhIdUFCREc1c2FTYm15a3Zu?=
 =?utf-8?B?L0s2T3d5czhFSTlRSlVYT05sTnFBQ2g5Z2VBWFExMmRTKzQvc2w5ZDJuVHNK?=
 =?utf-8?B?dXE3VDdKd0xNTFBpcmtVTmhvRnpTb2poWnNwOVhkRDE4dXp3RVdqYU8zekpW?=
 =?utf-8?B?Vjh6QzRhalFYMXhobFNKNGhYYm5jVXo0Q3JLam1DOUZXek1EK2s5eVY5UDRD?=
 =?utf-8?B?bFhzUjdNaXJuVnZsVDhDbHpHTzk2Yis5cXFlRVIxanEvRk05R0oraWFvQ3JM?=
 =?utf-8?B?WGZGVTExSUZTblhYR21Ha1Facjl6cDZEdVladG5odEsxTnk2TjMwYTYvaUJ2?=
 =?utf-8?B?K1N5RHhOcEtXdDVyTFdWTkw4Mnk2bjBuTzR5YmwrQ2ZuNmtzZStLaU81UGpX?=
 =?utf-8?B?cmp5NW1xeGhsamlhVEhOdWkzNi9iZFUrSmdPcGRNOVRLSzFYZ0l2S3NVSDhH?=
 =?utf-8?B?cE0xanNtY1dyVng1UFg4ZVdDb3ZJNURyRmZLNEJTaXVlSm9wRkZWZzRSK3NZ?=
 =?utf-8?B?RjViV2xoRTQwS0RZNFY4K3kxSjVLWnl2TVRoLzQ0TnBWaXBJQUEvTDJmOVFE?=
 =?utf-8?B?QVdteklZSlluUWpSaCtGZTMrMjI5K1JJWHkwbFF0K2VsTGF5VHZNSXBjWldL?=
 =?utf-8?Q?SEQw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5e3b0a-817f-450e-d076-08dd080f0ffb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 20:24:54.3190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOE5drYL0M4BeXtmD3x0MJun35oJ/rPQxbFVrEkpO4TR51Ze2N7jMoNqEyQtilVTrcExVqk4BhIL+0P7UAUgDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6858
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_122457_287182_B0171DFD 
X-CRM114-Status: GOOD (  20.78  )
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
index 67013df89a694..4735bc665ab3b 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -2055,6 +2055,28 @@ int __weak pcibios_enable_device(struct pci_dev *dev, int bars)
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
@@ -2070,9 +2092,13 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
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
@@ -2087,6 +2113,12 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
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
@@ -2270,6 +2302,8 @@ void pci_disable_device(struct pci_dev *dev)
 	if (atomic_dec_return(&dev->enable_cnt) != 0)
 		return;
 
+	pci_host_bridge_disable_device(dev);
+
 	do_pci_disable_device(dev);
 
 	dev->is_busmaster = 0;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index a17edc6c28fda..5f75c30f263be 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -596,6 +596,8 @@ struct pci_host_bridge {
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


