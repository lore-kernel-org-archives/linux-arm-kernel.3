Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20ECEEB57C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 15:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlNmb+89soM5lnwdbydLb64ceYOXcFv3V1a6e8OHM9E=; b=Z67BWdmWRJJHxpABl6jVO904Du
	EiSpVGxDPlmNh/fc6HNOEzGuTORYDgPvbuIFivXLip2eg0MW7+uAeT6apiGXRzx3ay0VrDltDmA1p
	mdc/IPO5SLYR5Ht4UE8ADOcqRXQLxC2kyiTgmqFN9ifEpMuClBZ86Vg+RG7dhwU/GNN2e+TZELVXX
	a52P9N6l0phzG5Wg0r2a60r78DNNYpzo41/Re3A56EoRlOkDi+jF/g39FQ1LZqJIqfvStAS2Nw1GU
	6Pg40rEGvquYnhAzwOuGYUOgAWDMlcyz/S93Kv5C3GkwYEwsDtLsjjGJdFcjcG0+ttoXfsf+wQoRi
	P3wbHLkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbKFi-00000007INQ-18bP;
	Thu, 01 Jan 2026 15:06:14 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbKFg-00000007IKR-2B0x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 15:06:13 +0000
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=UWohnCh0YLCPyptliYP0nrlbbgrdDbUkMS8SGHLzrmeHTrUIqW0yndLpstvCaml+V2UwUrp9ifPotiE07YLmRciZhHQTuz6Bg4rgXOvAjmLmwZHUCziimPCvhzj0heUFqz6h11QMGkk2+d7sVJ2YIXx1ARSvp+Xv9nsGtoNrTGzbolEQGQinZnZ55ngE2D+i0OLhAlVl4ojw1fYieQO2yL6YyKCLtOpwWI8deMb6j16JDMntGog+pI9HjGqVqVv1aWfLk8wN0zYfrQEs8NnsO3QsfeyVUfR5iudBcdydSd0qCGh/7NEMB1eXD66qhavekQuOR6zpY0sWmNj3mZ0YJA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlNmb+89soM5lnwdbydLb64ceYOXcFv3V1a6e8OHM9E=;
 b=f36se4r5hDDU1o4UG72q27976dklh3xUoPmFCayyKQHc1Jbsf0ru5XYIjB+PPvz8lIVNgwwOerPQcCJbatGaLd2V7faJEvDfhGeV1eCcwVfS9FQ6ouY5+oe/41YWhjGlt4Nes9JsOCSIXcIyN1QhXMtDJSdjocVVmXSoEZ1K8fY2mwjeqT2ZzodR3h7a4lBAf5RzubE+FbhnjiznnsxWofxOFpgosfC18OoN5NEWdxXw9nDXVmQ1OdUeoEMFl4FjcYDncwwraPVPLKAkcdqg38vEIacpF/cXHb/NdMFIEOa5jg0Kkc07P3lFcBgx+E1nvKaVcdTDZxaZ12L4Z4XXGg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlNmb+89soM5lnwdbydLb64ceYOXcFv3V1a6e8OHM9E=;
 b=W8uGX20EJ03/h51un4ZYxP81kFtsTayeex5kznkNDQkV04V8mHH3vY6BzSC1FjYkXn8C+sHtthf258bdPRYn4embZk+9rzQVZT4amjOQBlb19iOa08msXGTjtejH9AG6ZjfAlvznWOXD98T2ZM7LRjZ8R6QixKNJ77GW1mBByME=
Received: from CWLP123CA0212.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::18)
 by MRWPR04MB12070.eurprd04.prod.outlook.com (2603:10a6:501:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 15:06:08 +0000
Received: from AM3PEPF00009B9C.eurprd04.prod.outlook.com
 (2603:10a6:400:19d:cafe::9f) by CWLP123CA0212.outlook.office365.com
 (2603:10a6:400:19d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Thu, 1
 Jan 2026 15:05:57 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009B9C.mail.protection.outlook.com (10.167.16.21) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Thu, 1 Jan 2026 15:06:07 +0000
Received: from emails-8500981-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-218.eu-west-1.compute.internal [10.20.6.218])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 70781809E3;
	Thu,  1 Jan 2026 15:06:07 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767279967; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=OlNmb+89soM5lnwdbydLb64ceYOXcFv3V1a6e8OHM9E=;
 b=dcb0zQ+LUaPthCq4M6UL9ScvHNnJMEqHXoFSYbWNB2n8Y2lcrRNyVJWp7leRe5M8ZltXO
 1lPg1NZz/PAtraqVrvbgQdZsvllha/NpPGUaF7v6G3vvCqwFt6XW2X4KAFAztWuwqDBTQKg
 wmHybvjipGiqDEIaWBSLjFqNige4neE=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767279967;
 b=jAowCYNnpQxI/ewbCV4NNBirQajPjyvqlaCniZCkDyB+6cgKZ+5vN10ggVuXiD+rpGx7b
 c00Cvue7uJZYYY+s0vpr8sytTkK5g4bwvJuo5yo5qvDJNK2fZ0xUcZerlRI45IEhfAiaWwq
 1MPAJatYnVvRNQXMhDKuD8rZ1QkVAuU=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXci//wvZY0Zzzbk30fyRN/crT5s/WbksqWEXxDuMr/FKJjkn9rJptOqQ3QhM/68o55g3W+LUsO9d87hGIQj9p7tC0klhAa4WZDtKdfRtph5Eke+d4vOkj15GhjclRjVl1VeGXxuXY6d1KudaK8WtNWc8QbrFv4AXZvMElXMkPc6gmZ1NjnDTLpIbuwDNvWfWFGmJUgAwbgZuu+1qEFtl61WTayNSxdiiCQkhc/LNuxIeHTPdZ0HHbJFoNH0nrrQn5I4QTjU3sG9Uipc4G2vcafbLJk9U1I+Piz3AWRoiG2YA77R3znR5+HSuqkHydtEIibXYqE6anoWp7zjZYjgXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlNmb+89soM5lnwdbydLb64ceYOXcFv3V1a6e8OHM9E=;
 b=pcpUTFLXyt4zueplv6YjM/n1Ryz17AC84ajqhxYQUIlQKCyxyBfo2/TqByc7xNKh25HkYH7qExazNct9AzAGTNjb50zELscaFNTnBr+UP493Puwu6cV/EQ7qtat30WUldc5jEm51MNeBRFJ1UV8IrTr2+CCkWFwtBGbapowyPURxGgE1nOTKx5on5uwhnMbSYjZDfJNPfzn+cNZmM50TEmkONnZjKCcKLUJc3Qpb0t5Pj1U+VtMd5kRkEIApIc7/AIFkcsGEoPI/KBHP0EgY0EoMPNrt8CRULjgBlzPStIh8u/2j9Yp0LjlrNyby0T35SF56BvCGVEsnQSoAH8c9Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlNmb+89soM5lnwdbydLb64ceYOXcFv3V1a6e8OHM9E=;
 b=W8uGX20EJ03/h51un4ZYxP81kFtsTayeex5kznkNDQkV04V8mHH3vY6BzSC1FjYkXn8C+sHtthf258bdPRYn4embZk+9rzQVZT4amjOQBlb19iOa08msXGTjtejH9AG6ZjfAlvznWOXD98T2ZM7LRjZ8R6QixKNJ77GW1mBByME=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PA4PR04MB7664.eurprd04.prod.outlook.com (2603:10a6:102:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 15:05:54 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Thu, 1 Jan 2026
 15:05:54 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 01 Jan 2026 17:05:44 +0200
Subject: [PATCH v5 4/7] arm64: dts: imx8mp-sr-som: build dtbs with symbols
 for overlay support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-imx8mp-hb-iiot-v5-4-b369b2e0c07f@solid-run.com>
References: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
In-Reply-To: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TL2P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR04MB8749:EE_|PA4PR04MB7664:EE_|AM3PEPF00009B9C:EE_|MRWPR04MB12070:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e5314d-ddfe-4d74-44ee-08de49474abd
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?RjBWa3hxbHVtVk5PUzIxR0lSRVFxSGoydm9kUHFUMExvS1ppeXp4cHQ1dTlq?=
 =?utf-8?B?Nmd1UW9qWDhYWHdqc0E2S201cVNXL1VERWZZRnBqMUhPWE1OMzRSeE55RlNU?=
 =?utf-8?B?M3F4ek9xMy83RGw5Z0kvSkZWajJVaWE1OVE5QUJBS2JIekZod2Vka0dxVGNK?=
 =?utf-8?B?cVJGWWVVNGc5WGV5RmMrUDh1R0ZXOWFpMkRHYmpUNTMxckRVWjRKQjZnTy9O?=
 =?utf-8?B?cVdiMFcraUdZVE16YXhIeVNTUWxmdFc2U3d2NFpaZ3oveWFVNjIxdWJGaWZ2?=
 =?utf-8?B?TlZXVTlKak9BdmwvNWgvRWcvNDZVZXU4RFV0dWpwQ1BuSnNnZWlVWElBZCs2?=
 =?utf-8?B?SFAxK3A2aVZNSDVZS2ZEK28yaE9rMmY2WUppeUhFdlFzeFVSN3p3M1B1Tm5y?=
 =?utf-8?B?bmxNaCtmdmdhak53OTNQWmFtbkk4aWs2c0hMM21mMEl3eFp5b0NFZW1kbHo1?=
 =?utf-8?B?MnI3dExlbEd5a2taZUV3UC9FUnBlelk4Wk9mVjA2b2lscVpqdzBSMldRdTVN?=
 =?utf-8?B?RzJGcEp5UnYwK1BwYkM0cjVYaDJKTTc4Qm5MdEJhSVJHNXV1RUsvOWFFcEZX?=
 =?utf-8?B?SWVRRlBnaE95aVp6WUtxWmtJK2I2SnlLSlVaL1NHaTNKWDBBMXlXOVZUMVMw?=
 =?utf-8?B?TjNWTUJPOUUxM3E3cjgxZm1VWGpuUHN1enA4Y25RN2VFMW9UWFNWRnlGRmxD?=
 =?utf-8?B?MkUrb1R5SExtOVBMMVcrVlpGWVZDQkJYMTN0d213YWl4VmhzblAvM3VaVVNU?=
 =?utf-8?B?QVNsOVBmUXJlUEx3TldUTTc4eURWckpjYWM0NE5mcmc2SUNkOXhJY2xhNmFS?=
 =?utf-8?B?bzdsdjZnUUwxbGt4aXZwbHUvTVRXTFZLT2wwbW1zR1AycDd0bG42SmFWTzVD?=
 =?utf-8?B?VHRrRU9KaVpkaU00OE5qMFdocjhJOHN5M05Lc3h5eUFndlliVE9sZFNWdnB4?=
 =?utf-8?B?Unp3Z3pzMDVycDlydFNIbDlwayt3aWtGZmVjbmx3Z28yY0FaZGVxTkgveGxI?=
 =?utf-8?B?OHcvTGk3aHNqd2NvakRrZWVxdUFULzYxcmhLMUZqSEN0WkdSbCtoSnpUc29k?=
 =?utf-8?B?MERyVm5ocVcxcVMrS3hIbVdRR0ZXb3BVYm41Um1XYXJzVWJNR2h2NVdSNGIz?=
 =?utf-8?B?a1lNek1oTE5DL3NOYUs3c05tOHp3RzN2ZlJoK0dHT1JkZVNxZjNsdVlzREtE?=
 =?utf-8?B?SUx5b0tjR0llZlRaMVhHT2puZDAzZEczT1VNcjZQbHlZeHFyY2FtUjNXZXBr?=
 =?utf-8?B?bFR6dVR2QUNmckx6Z3RvQmFGOGdnbjltaUZsMHk0MVlLR2YrRUlXa0MyNFlX?=
 =?utf-8?B?U3F3c0NkSjBTOTNvbEY2L2F3S2JsTVFjZUdEN0xaSFRhbUF5dm5sczJJNHJN?=
 =?utf-8?B?dGkzenhNakI0aDVHYXk3RUt4U2w3NW80UTdzbTY1WEFtMDU4aG9UakNDKzVp?=
 =?utf-8?B?NUg4eU4xcGJrRW1XOE85b0RyNDcwQy9QR0RtS0pHV2k3OG9xSU1jckZsL2RY?=
 =?utf-8?B?TnhUMWcwYjZKekQrKytDUkExaEhMeTlUNUpRZUM1T0RiWXdDYTFiRW83KytB?=
 =?utf-8?B?eG5mZU15NExrSzE5aFpTT3VWZElhOEsxT1RmSzZDalJkTGtpY09SRFhyS2Fw?=
 =?utf-8?B?cHY1Wm9ML21GRnl5Y1lCNU5va0dxWHE0UVpFaDFsVmVnOXZaZXRWVmo0bzVC?=
 =?utf-8?B?eGhQczRLcTlhNTFDejRVaXFkVkl1ZzVTTG04amx0eUVVNll3dmNLUGc2d2ZG?=
 =?utf-8?B?aU9xaUNhU0taS3FXdHdFbjkwM0NtU3pESW1nTGRDdHVpczJ1MlBMRE9HYlpL?=
 =?utf-8?B?QjRuYTRsOGgzY0JJenJ1ZDhPODJYMFdKejB5SGZGL251alNwQ3k2RkxvWmxT?=
 =?utf-8?B?dXJhRXFGcWVkU3NtMG1BSlFGK1RwMXBvaTZaRDBkNWh5cUtsNWUxYzVPcWxV?=
 =?utf-8?B?R0xXMDZOcitiYThITGNJWVZLaUlJaXpvNUttWUxLMmpqdHE2dlo5ZEdSL0pB?=
 =?utf-8?B?QUFoVTJhc0lnbjVRV2xncCtOVE96dzRQdUhxODF0Y2VpUDkyYm85c2l0aGFq?=
 =?utf-8?Q?2IA4Ti?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7664
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: d06ee6dbd86742a5b55c5813778b410f:solidrun,office365_emails,sent,inline:113452bdee034aaec32088b4b1e9092b
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 70be7c99-4aa3-429d-720c-08de49474295
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWo0VEhSS2hLUW13Z1NrK25xRWpIUEN3QlhadGlyemVSbDIvVzNJSmszM0Jj?=
 =?utf-8?B?UDloam5vR3NwTWlsYWR2NXEwMkl0VWxlZE5OeTJFcGpkUjRxbm5YRHpEb012?=
 =?utf-8?B?SVcxRWc1KzZaZHJLbGxrb0hhcmg0cW9vS1lGR0dIMG1FdllNSHFJV285SU1j?=
 =?utf-8?B?U25FaXdoV0ZoT3BtWHFRQXBTeUhvVmdPTEU5b0F4UFNiUDhQMXRWcHJIUjhY?=
 =?utf-8?B?Z3ByOTgrcnFsSFNvOTZZQ055dk9LZXgzNHJCcENyNEY2NmdoZzIvQUF5VGFm?=
 =?utf-8?B?WGE5K0ltYTk3NU9GNlRaQVFJdmFXOW1QUzhUSVRGc04rVTRQTi9ZQ05ocllJ?=
 =?utf-8?B?TFRCMy9sRU13SGNZdTlKVjhReitEMFlCZjdPNGpDRWdiQ04zSFRVY0JOWVRH?=
 =?utf-8?B?OWRvcVF0SkloSE11eENqZ0dLMWVNOUZsLzRpd2ZqRVVmM1FwWnNqSys2dTVr?=
 =?utf-8?B?WWtPamtRL3hRVUZWOEF4Nm1SNVZmZzhobDlSRUJQYlZjUzhUTXRuVFRZcUd0?=
 =?utf-8?B?RE5ERndCVERER2hFdm5GaHNqUkFMazEraS8yMk1QZTdUTytrODVGM28zU2VX?=
 =?utf-8?B?eDhvenJOU2tzQU5GWFRJQVBhREQydzlaZnExL0tQSlJ0RS82QUQvUVJ6NlYr?=
 =?utf-8?B?RnZoQ05rSmw0NUNkVzRkS3hEdFc4QlQ1T3JheUhsMlhpZU1nUUJIeWw0NUNw?=
 =?utf-8?B?dWdyWVBZd1d1aUZoNG5JNXM5c1RPTVFXTkdLY0FQdXlWY2o3eDUrUGgvNG1U?=
 =?utf-8?B?WUliRGZTdlk3YW1SdysxUmVvazI4U25qZUIzcVYyQmRzbEJTN05DNEl3S3Nm?=
 =?utf-8?B?MUZ0ODVzZThjR3JKTGdRRk9GOFZQYTdmb1oxUkQzNHVqS29TWGZzZUExUklB?=
 =?utf-8?B?a0owcy9CV0huQXJBd2RkN1kxU0x1TDFDY1Vuam85VytiNXFjN0xGejYzSyt5?=
 =?utf-8?B?ck5RbldtVGhmWlMyakIvZVVIWEpsUzRWU3I1MHF1ZXJQNStNNFdmWVlZZFJL?=
 =?utf-8?B?Q0RzcTZDb3F5ZGYxL3hNQUlOQWFTSzg5VVUvY2tpY01qNGNOUkM3UW4rdzZ1?=
 =?utf-8?B?bVZXTitha2FQdWU2N2VHcEFJUHZzMkZ0cllMenlvZ0tCV2gwcXV6WFNaZTV1?=
 =?utf-8?B?R0ZJSXFkTVdHWlM1ZnllL2NYZmo2ZXZ0d3Q3TDgwcngyM2NYVmFyd2wwVUpO?=
 =?utf-8?B?QkR2d25OZmtUTGlNcUlFcER1RGlLakJJMHpEamgzQjl6QTlXdGEvL2hTaXo3?=
 =?utf-8?B?bGhKSHV6OTFmaHloelN4TVZNaHIvVktkeTRueVEwOVNLTHJtd2VTRFN2OVRp?=
 =?utf-8?B?SWFNYUJSRnFENzJhclN5SGpHUXYxTFlWVUhwMFFFeDVERWd1YVd3L1N3bmZV?=
 =?utf-8?B?cXRvSXo3M0dxbFVxNURFN0UxVURXOW5MTFlrRHRHS2tFcFZLTWZyMzlRMmpK?=
 =?utf-8?B?d3I4YUk5SXU0OUJ3VXRvVk1TZzRBeWF2dWhHdEF0RC84a202WjJrOVpSdDhY?=
 =?utf-8?B?M1BybWF5UmZwcm8xOHViMzVVVklHanpTUUZndTY0SGlYS0NsZXlGQ096aURL?=
 =?utf-8?B?OXpnWE1SMkdWSjdjYXkxZHNqL1FMeitwRlg5SFZvRkVZejlGLzQ4K1pRK0Rr?=
 =?utf-8?B?N1NQMHpZZmhsbEczU3hIRDRUR0xGWStYZU9YYTY3bTRHQUtIQVErUHVWZmxH?=
 =?utf-8?B?UzlWb1R0aFBKQ3haaUJXT2N5M0phWitHTWl3YjRWQytkRmpJS2k2dnV3Nnds?=
 =?utf-8?B?Wm1CUXhKVUp6SVhESXFSSGxtcG1PdGpaN0dBdlY4NmZLOW9pdkVBNW9LTEJq?=
 =?utf-8?B?SVQrN0toTmRqemZPTVVrUlhhUG1TbjNkSWJkRHZoZlpDM0VrcFVVMTZhNmZw?=
 =?utf-8?B?WjJhUVAwSkdnei9EbWFrd1hMbXJBcXRCbVVuS2h2RVp0QnlyZitGVTJVUDhl?=
 =?utf-8?B?cGZESXgwRERpclFGTXdsd2xrMyszNjcvRzI2ZjRMR2c5RGp4R1J1Sy8zbW9w?=
 =?utf-8?B?OXYxT2NiZjBDb3JIblVZUnpKUmR3dFZFM3llVmpNdjgvYXhwS2hUOFpoM2Zp?=
 =?utf-8?B?d1E0enFUdUkwbTV2V05GTXl5c3RSY0I3cFZ5dmRaUjlrYjhYL3A0c0RaYXRi?=
 =?utf-8?Q?SXrQ=3D?=
X-Forefront-Antispam-Report: CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(14060799003)(82310400026)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 15:06:07.7606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e5314d-ddfe-4d74-44ee-08de49474abd
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_070612_724703_6D9D0191 
X-CRM114-Status: UNSURE (   8.02  )
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

Build all dtbs based on SolidRun i.MX8MP SoM with symbols (adding -@ to
dtc flags) to enable support for device-tree addons.

The SoM has a camera connector for basler cameras that can be enabled by
downstream dtbo.
Hence by extension all boards based on this SoM should support addons.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index f30d3fd724d0..c4c6fd6de963 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -203,6 +203,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-helios-lvds.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-proton2s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
+DTC_FLAGS_imx8mp-cubox-m := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
@@ -213,9 +214,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
+DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
+DTC_FLAGS_imx8mp-hummingboard-pro := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
+DTC_FLAGS_imx8mp-hummingboard-pulse := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-ripple.dtb
+DTC_FLAGS_imx8mp-hummingboard-ripple := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-icore-mx8mp-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-iota2-lumpy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-bl-osm-s.dtb

-- 
2.43.0



