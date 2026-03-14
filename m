Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763FA10706D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 12:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FYlSIaVXE6oyKGXhaBt+kquYAW+UQwHEZ4RwbjKeZnw=; b=y3vnL5l+jI4bzeIMP7qDurSB23
	eeIx5uAl2/B8kFN7biGOvGVS38ye1GHmaRX/I51uBWZliQXMR4JwxUX6idQqa5s2texHRfgc1zIdC
	dZjdvtLhwJnqx47xuGaF4yJtJKsW3YdtU3esZ5reagLpQ9LtPUmwWGgRPOXrVSHG3dLEF6LVWMc/C
	TNSM4YlqzHkWl2pyxNf5gi6B0KAa+AMB+n8C6CdVJ85Omnp/0HHWrzaRBLpZNYUIteR33vnKvBTEV
	KXLCixkcaFaK5xibfTxdgYevWOyrXfaXesJO4uvbrlAGv9dzzsKaOR9b+SNRAYg4MYQsT5x/3y2Bu
	XbcC9R/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Nka-00000001nwt-12fK;
	Sat, 14 Mar 2026 12:05:48 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1NkV-00000001nrF-0Xop
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 12:05:44 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CHB6YjqBRA3wn4dO14SFlbTP87JqhCM7TEa78vbcZXpULKdRC8fgTcm+f1bvKqtqhe07bSct5ngDXOyrVJJgm9rMFyOMX6GGWUciszArZNhk2SgQbrkbq4g65cSHAIsk0vKli5rkTgLNbrgw2OSlNiaCtSxpzxhyz1cjKZxPh6CwnYeUNWxS3QrnAhoHLO/TPYEU3cNS2nufbOlqAXkLTAACYBQJSRQ2lLx1IcZv7ythQ6P8yKjmD0ynzF3VJhhANxWqvGtAEkVmhAZK59sLlq3R1lRREBilRGEW6Hfl4dC4gkSUxpub0uly40XBbrnl8qNu2tM91a7BPju0iZ8eiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYlSIaVXE6oyKGXhaBt+kquYAW+UQwHEZ4RwbjKeZnw=;
 b=MvhsSPU62XM9HFoj/KJaZw3a2qiL6yQv0N8fK4GpUYYtR8WtqODsYv359sNfsr6vtqof+ERoPsj8/cVTtJeC3q4obBX5d9IdQeUNUKJaUmMSKYhchHfHDqtxFygZ3jvm08spVMkIU7vnvS2tIbNNh7ocPOFlNOUp1IKkUxE4HhOUEHMQ+y8dw0BC6qAtBslBq9aFU7cClLZJPEzg8HjH/Aub7kH/UhrwhtTGIrHn3t5EBAMD+9Cg4rpn9v+AdFLoP8JkYrzVFPxkgHzQKeq3GGmwZ7BRq4oE9r3MS8XahhQQZfJk35DcYqIe8kQFFMMBFpejqSYoxADTDW4ZVwsYsA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=temperror (sender ip
 is 52.17.62.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=solid-run.com;
 dmarc=temperror action=none header.from=solid-run.com; dkim=pass (signature
 was verified) header.d=solidrn.onmicrosoft.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYlSIaVXE6oyKGXhaBt+kquYAW+UQwHEZ4RwbjKeZnw=;
 b=eOMo2mZT5klAoQTBiNoyq2vq9QGQHDOdBaEPhX0OPxhGVdjMS7B0DAJKXjaZe+IRaTroEpwO4gQFU6kb6uZ2geca4yMy3JpvV+6YbQo/KJwCIsx1YAtdDfGe24xyHWNKan0G+ecSmWJxsOOGqYYCybPOWm2HuFpnzMcfMHeBoo0=
Received: from AM7PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:20b:110::12)
 by PA1PR04MB10262.eurprd04.prod.outlook.com (2603:10a6:102:464::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Sat, 14 Mar
 2026 12:05:27 +0000
Received: from AMS1EPF00000092.eurprd05.prod.outlook.com
 (2603:10a6:20b:110:cafe::1f) by AM7PR04CA0002.outlook.office365.com
 (2603:10a6:20b:110::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17 via Frontend Transport; Sat,
 14 Mar 2026 12:05:38 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=temperror action=none
 header.from=solid-run.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of solid-run.com: DNS Timeout)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000092.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Sat, 14 Mar 2026 12:05:37 +0000
Received: from emails-2311019-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-180.eu-west-1.compute.internal [10.20.5.180])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 0194A80161;
	Sat, 14 Mar 2026 12:05:37 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sat Mar 14 12:05:27 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F6P2Szc3vOOxO6j1wwLQeG9Z8IxUSAhLxypxUWV2O/6MwxXIXkHKgs11lgr1x6osPc4g7qQRFxtsgt71nLkSpb5Yr3IVQgwOwrm328qqCb84/sWrfGOVSOTCgruLJsISx7QGUmi+1DVIhWZ6sQ7RJ+py0lnG7SbeHb7npm8YnJRTPHUD7CQ+vmlWMYvHSPZrVuhtPO72kiWUZIr4SMJ/T+y7hk4fn9Mm9PfAJWDJzuXf2stGC/aC+k8PWJVrjMB44e7jfUcCR7bcyiisXn3CF1CQYuv/7bsf6EzoZAi7gFCSSgoaA8UmlYJehARKbQQ/mHUw+qaSxc5OZpTrfpn0DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYlSIaVXE6oyKGXhaBt+kquYAW+UQwHEZ4RwbjKeZnw=;
 b=QXYt1Qbc5PJFfVD/DRWroHgst0EBpTemZK0v6x9RrfrBaVMnfsHmmD32i82B4Tzeh9YDNS/gjpWVHhHannu5PZz3JoX4anYFa6FD8knBOyiypgLevdli7ZYDOUZ8Ck1Z7RRDRihhR+KAgFqswZQje3pB3lipqNLT/eZo4JWtucaMCEn+lc56N6esydJ0ayHSR9mLWILrQCiovpRfmNHVH4AZrrqcgGWexEcy8uPUvnQEGAJMAiSsrb0/kWujKcucPcQK+FctctlKgVskeovPaxeTeyiyqWejnH4hqEfTswlX++GocmdEJHBj0xT9QD6UMZzO777xYWslREstDi7HEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYlSIaVXE6oyKGXhaBt+kquYAW+UQwHEZ4RwbjKeZnw=;
 b=eOMo2mZT5klAoQTBiNoyq2vq9QGQHDOdBaEPhX0OPxhGVdjMS7B0DAJKXjaZe+IRaTroEpwO4gQFU6kb6uZ2geca4yMy3JpvV+6YbQo/KJwCIsx1YAtdDfGe24xyHWNKan0G+ecSmWJxsOOGqYYCybPOWm2HuFpnzMcfMHeBoo0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM7PR04MB6805.eurprd04.prod.outlook.com (2603:10a6:20b:dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Sat, 14 Mar
 2026 12:05:03 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Sat, 14 Mar 2026
 12:05:03 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sat, 14 Mar 2026 13:05:15 +0100
Subject: [PATCH v5 05/10] arm64: dts: lx2160a: add sda gpio references for
 i2c bus recovery
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260314-lx2160-sd-cd-v5-5-83de721585e3@solid-run.com>
References: <20260314-lx2160-sd-cd-v5-0-83de721585e3@solid-run.com>
In-Reply-To: <20260314-lx2160-sd-cd-v5-0-83de721585e3@solid-run.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Carlos Song <carlos.song@nxp.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 Rabeeh Khoury <rabeeh@solid-run.com>, Frank Li <frank.li@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::19) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|AM7PR04MB6805:EE_|AMS1EPF00000092:EE_|PA1PR04MB10262:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc5dac6-a60b-4be4-44be-08de81c20107
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|52116014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info-Original: Qbb/4PT6Lj5UQrh37zUGUy1vb4DTUadXJI7xlvC/1s6BsxnlrOWLQApU1OPgpWCZf6AaclKfrFSpW+wfZ7Ha2kBl01YF0ZXs7+5d23MX7+6P85PI8tP8lsXMe9FNI0fUk0FqBykHyNyTt/eiFiC7tSrb6uqXkifRF0NxY18EZHZTrZr2b0GmKhTRxCSA7xcc5a8BBdGHwOBUjJ4BgzIpaFHX/4ROX3usUCG9tH9OvuCdWCg7/oBy/lc9CogK9OsB0TND8fIEuJq1Fi04r17/KRnYK6BRXSXkjYiWrawWJ81Lfx5kB8NiFWJ5C10qOOGOu+Ir7T7cVcwWeimYZwTarfOJ+wVxzVorunGufKreRZgXTYGTRFISpExl5T9E1l4MvWyYx7Ek78J8g0c61UtcTOmpS5xZPbPIhfXmXc7W40H/0MIiBifOSL6VtWhVIS1UsYrgC0B/TmZdPzE+FcpbZWubBMfrPRSNjyD0Ynoc3Qi+UlE4IT2Ljlm9uasMuJQVdcxOMJc6KJbWnQpj3frZgI5oe/TMKw7J3FTQtS0iuHF2t89JS+W8qyKKqzj8mXd+upxBIC8SoFWO04+GlgE9injY8Zqzf5fkax7rOx0H8JOQAcYMZTbpJGj2ph4rGNYhRKR4K2M3ksrMYGVkySg69I6DX3hbORVoj1o98hZr496g0WopsaM3NOYEbYaQSHGnsXmGDG85/Dx8NQPNIt3q6x6fir3/8s+DBUOCGfbYOE4TAVAbX+JyRQQDwN9mKOXTjRofVF0UGY9TA087XubnkbBC5opFgLif1Bv5pr/ag9c=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked: dUMZcjRo9QzRTgLnV4JAwZq64dXUI4FGjp4m0dE1K3MyTsYM4p7ZXcugi2qTJFZ5Ybg/sArPFLvMnn7fpv5JoC3mx8KegbfvNLHlPHGoTriHbmpi45q+vZgW6i7i8S6YIhP6x2xhOxG3H8tLWAs129hWRMNL8Pj6p9mBqSHrPURzxZdSmrV92lW9ljHourwB2IxAK30K6hlx2pTA6OyuSnGWBySgNpfGgGiqio2llj4iuh9WDS0p6nA1iT5SnsP21Mh+dNrRh+rmuGgvK3epHK7nSm01NuuiPRmOnSyqP/4r5gxemZoqt562/dJG1ZhMmlv2jsiPkDHC/nfkAvlCTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6805
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: df80b182e76a45dd899eaebe93736035:solidrun,office365_emails,sent,inline:e8a71b8ecf121745cfe4398c998083a7
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1ecc6a11-fc3a-4f58-7332-08de81c1eca4
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|35042699022|14060799003|1800799024|36860700016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: j6MzA45jF+9VsIxwVsDY6edtP8Ouv1gsQ1nZRm3IRQqeBmVOYma3hTL64tN9B5Ao4Ayri/nqQiN4L57rVne+DffVdiByr+YAhff4iPr7K/Toyc7LyHL+APHitmzFTo1ZEum6xxCLUU8+4MC7DpIwa+VLxVrQW9AoBLvfh3B7sLV/Ge7cRWU1qZItIJN49uAw9ymexbImt5RjbHvg9fo4DcKSYioO3p/bqV5NS0z1LqoEh+X/LhmTTSGYpGk2tbootOj8sFxJHmTiwlAfaBBN3u59U2/IgswChHdPF6n6X2d1fcuJ1BJpAV4tMyY/kNjfUXTdjc3ctiEBOApEuEiK9Dncjo3kIoP7IRVLM0gQl6nPf6KwvaLHMpxWll+BMAFn7axgxvXSOnDP3EfCgnKP6jKZBiNfkEZkOKQgMlL2Krc1vNCTdZqPbon8ay4XdW33q/aIWYE7ef2cbUPktng7jCAfCzrinCXaNzUOPJd0+ZQe+8AAipBa9uUmOw2YVi+bELnJozZFL5FpTLWCHSpf9S9IY8SpvPv3Fd1SdRevUW8BpACe227A8E5a1FvUxELoMVBqV222ULxC9Y4dOTZY65uzzzruY3BWkUR3L0nb2UAjJJOUh2IB4RWA2StzRJ6AoSxXVILzl/gksKX2jgKT8IKCaBNopOPWEYkUOHEzfJOJfl/6yiR919JVXfwe35fH1/uGQyVJBCz/9/ZP84GHCreY02lzfHJ9HDbCN3tkXftw8AL4YXyM1N01tmREYaTB0Fyb2AiyXg8Uoyg96yse/w==
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(35042699022)(14060799003)(1800799024)(36860700016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oIPd5YSdjH+Q8pnBBRpHlDt6cMeGnT/4dMxq/j6IWkIRAT+jbGcK7Ygtyemv9zEeIYLf3Zr/AbgEwxj91gRsQ7hny+eq+5tbE6vMZlkTIUwlt+PiRYSp3zf/CMSiyYqm3Wk8e9gPpovmP2dTYd7rtJ1JWCjj0FrSgRQRXH2nFWzzuliF+mG16lamxmbkki5z9BsCBPZHJR6qL2JoqIFPSTRyp6nRaVxDEBXfbA1NLxV3y/tm8Xa29AOE4tC9ACp+I0LaO50KfyBNNL7AbPxyYOfsvZx1yu7tCyGqhcqYWEz/ANPrFRJ1v9TMK/NTheFqWT291xItoRjvGtRRG7jsAbcLLgeIiTkjuEgWBzHClVvLfbhCrrheSw+JDcwGz1hSRBUVGC2gPWxcJVQy9TjJcfruj+IfO9YFuCCQJ7KV5dwv414wMEcxO0mDTy8K2kzb
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:05:37.3055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc5dac6-a60b-4be4-44be-08de81c20107
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000092.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10262
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_050543_404407_29D25023 
X-CRM114-Status: UNSURE (   6.64  )
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

LX2160A pinmux is done in groups by various length bitfields within
configuration registers.

In particular i2c sda/scl pins are always configured together. Therefore
bus recovery may control both sda and scl.

When pinmux nodes and bus recovery was enabled originally for LX2160,
only the scl-gpios were added to the i2c controller nodes.

Add references to sda-gpios for each i2c controller.

Fixes: 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 28500e8873909..53b9c5f1f1935 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -753,6 +753,7 @@ i2c0: i2c@2000000 {
 			pinctrl-0 = <&i2c0_pins>;
 			pinctrl-1 = <&gpio0_3_2_pins>;
 			scl-gpios = <&gpio0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -769,6 +770,7 @@ i2c1: i2c@2010000 {
 			pinctrl-0 = <&i2c1_pins>;
 			pinctrl-1 = <&gpio0_31_30_pins>;
 			scl-gpios = <&gpio0 31 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 30 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -785,6 +787,7 @@ i2c2: i2c@2020000 {
 			pinctrl-0 = <&i2c2_pins>;
 			pinctrl-1 = <&gpio0_29_28_pins>;
 			scl-gpios = <&gpio0 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -801,6 +804,7 @@ i2c3: i2c@2030000 {
 			pinctrl-0 = <&i2c3_pins>;
 			pinctrl-1 = <&gpio0_27_26_pins>;
 			scl-gpios = <&gpio0 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -817,6 +821,7 @@ i2c4: i2c@2040000 {
 			pinctrl-0 = <&i2c4_pins>;
 			pinctrl-1 = <&gpio0_25_24_pins>;
 			scl-gpios = <&gpio0 25 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 24 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -833,6 +838,7 @@ i2c5: i2c@2050000 {
 			pinctrl-0 = <&i2c5_pins>;
 			pinctrl-1 = <&gpio0_23_22_pins>;
 			scl-gpios = <&gpio0 23 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio0 22 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -849,6 +855,7 @@ i2c6: i2c@2060000 {
 			pinctrl-0 = <&i2c6_i2c7_pins>;
 			pinctrl-1 = <&gpio1_18_15_pins>;
 			scl-gpios = <&gpio1 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio1 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 
@@ -865,6 +872,7 @@ i2c7: i2c@2070000 {
 			pinctrl-0 = <&i2c6_i2c7_pins>;
 			pinctrl-1 = <&gpio1_18_15_pins>;
 			scl-gpios = <&gpio1 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+			sda-gpios = <&gpio1 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 			status = "disabled";
 		};
 

-- 
2.51.0


