Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F372AC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GR0Z1iTOQebA6NDkRDEaFkcBL+OLXn2bv7Llb/KWBuc=; b=zX0vJ0sMyl3WGDtAzC3TxDgTj+
	La+x5dTEzbmSMZXWdZCMdekxNndMrlWNLGzu6x5n7SBqWOhSXAWmEPkJGrdi62CXlZ2WJhZp2OU69
	oemILPzdP0qhM3i/KnLMlXIqEX2FG5hSVhu5TkCoTGp1i8fX+5RztOc5D3eyE1CWBlycOViWexeHa
	Y0Pfk91KEnYVeaBzLLHl2/BHTlDcvqCGUrw6XLeLJh23K6sn+APwhj1pPPJu559/6M9+mEH4dXbLd
	AX3AH6coJuh+91qDZ4mtDoVa7VI4dNzDHIGaGkNPMyS+Qu/unQlwW+pKfree4f4YeNinrQxnE1PKF
	tmET0Ipg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uJk-000000025iF-3GWf;
	Mon, 07 Apr 2025 21:47:44 +0000
Received: from mail-am6eur05on20608.outbound.protection.outlook.com ([2a01:111:f403:2612::608] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sVD-00000001sNP-0BVf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 19:51:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajtx3Hdx/wl6XYGT59QRTr+M7rtCjcjtqpDFOZm/7s8IDXSLMbmgPC2HUQttROQcv8jYrZQBlGTISZzuUOOZgl2UC3W49/tXsM3C8IxYv6K6JfLB424iVuccrYYdkyRRP6SogevUPfkQzrHEwsQX+KSjsvYCtuFafARSPpGafr6FgGkdv9XdoJXkerDUvCI/2TXUv3sUz7Vg/cD5/lC03s7awlFQ4gW7/+GrkfnoaWnM2Xek5UYI79T466x6Vxet6HnhzCBUfOpzGDngZl0ceNhAZ9eeAcpJ7SuKEewrrOdkspPACzvaSBkk2Cu5ypk6CEzjv1ddjBSo9j4uSWSZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GR0Z1iTOQebA6NDkRDEaFkcBL+OLXn2bv7Llb/KWBuc=;
 b=sh2NjDUZMQInp+dUm+dciQfghigXdGOUmpcu+5au/ooerT2hx93Y6rSrMl0Syn5niFMVjFzm4qBLMBQ6o5VF9nj+r0jfaUPwjRF61CXbJudpWiFun8TRlQaSTOAtic2Iy9I9S7nOGUsFfegQ8aZ33yfBLcpkwPnHWZ+rjz2HnrcECeqglNnQH7OyP0w1tm0wgkdGX69BqghykyVbhwGj5qGgjMh3tE7tpFNBnJ5wvbHCZco7v9CskoF+DKAtvHWOrdpIkqAvlzNNqzN3yyvT6AJtMKzNX08WBn1Hz2UYz3ocsUE0Q5NMg3PrM77S/DIVZy6rBErF7ddhgwrxxO2CdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GR0Z1iTOQebA6NDkRDEaFkcBL+OLXn2bv7Llb/KWBuc=;
 b=PQw/JY/OqY051e32NRI2x/SHQyIcopDr1B24qL8iyf8kI9GFx0fOu4PsO5Z7h0cJ5RMTAc2YUji8vZUdia50tqD2Rlk8QyaOt/jxcHlR/M3wGeEX3a15eH+wwxZW2oW53jyrzr/XGo9fpzQcBeKMOKBJ83kFJnbJJ/F6qnbK/d1HE3yxf9nm11FF+2ifEJNLIlEzdk+yAGN2jHE5xxeQfNhgiJyzyIw9owpJXjOwp9YPqYNpkc0dk+O8zHarZBYs1cAJBDp4mOv4DkgWJwKv0KTz5oi0xWVpUjIm3g7Bg6LKvfziqesbXeoREvqt1E00XESEpEWUj5sxRskmjNcaZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7452.eurprd04.prod.outlook.com (2603:10a6:102:80::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 19:51:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 19:51:24 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 07 Apr 2025 15:50:52 -0400
Subject: [PATCH v17 02/15] irqdomain: Add IRQ_DOMAIN_FLAG_MSI_IMMUTABLE and
 irq_domain_is_msi_immutable()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-ep-msi-v17-2-633ab45a31d0@nxp.com>
References: <20250407-ep-msi-v17-0-633ab45a31d0@nxp.com>
In-Reply-To: <20250407-ep-msi-v17-0-633ab45a31d0@nxp.com>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <apatel@ventanamicro.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, 
 Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744055467; l=1874;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=p7gntWoxGh4gHuQtzBxv9euNYS3wHZIeRIkw2TEkLdk=;
 b=zG4QdGGdfqxDzshMU7Ve7oQJlFKli2a6ZVYWvGb/TGaz4n0XHmKNqynlcFyI+BEZ72WuuWoZT
 CDPTrvS18HQCCFgZIu/vituhjD+febT193Yu6L/YXCad3GJEQqEWjlZ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AS4P189CA0041.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 3470ed2d-29ea-4c20-86b7-08dd760d9392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnZWUVVxMFA2cEZHT3MveHYzVEFEeWVYekM3T0xKY3I1UW9oVFFLK0hUd0hW?=
 =?utf-8?B?UlJCSW9nUWZXNFUrbXRTWENFMzAxdjU1TGlkQ1BjR3VRSVFnUERvemUvdkhp?=
 =?utf-8?B?WGV0cmpjQXRRNHVIMHdZTkswS0VyY2dyekE3d1M1Q3FOdVdVL3lsSnFCei84?=
 =?utf-8?B?a0FPbWJMTEVrWEYzY091VkRDNVVnNGxIUlpsYlEzNk0wcjNNQ1FNQjZJbGFU?=
 =?utf-8?B?bVJkc1hGa0xPODdmNGtBMGYzQ3FZTks4RDFCaHppNE5JOXBvV05sN3BwSU01?=
 =?utf-8?B?TUpJY3VqbnhleHRTRGNoOU1KdFR4dlZEYWZ3ZGNvNklkangyRFBJU2tLSzVZ?=
 =?utf-8?B?R1dnejZIQSthTnJNdDV0cDdRUmdmRklJUHBld0xRL1VhY01mNkpYck9nTi9F?=
 =?utf-8?B?eFdLSkxjVnR6aTFZK2plWXNDdm9RS2xFNTJQZ0RFemhrcWNPMDlYNzZONnFP?=
 =?utf-8?B?UnNJTjZZNys3SFRPTkdMRjJMSjNoZU1iZzVXWS9FeGY1cmtob2RpaE9Wak5x?=
 =?utf-8?B?TjN3bzJ5SFlsNnNUbWxJZzdUdE92VkxNYUx3ZWRsQThNdXk2MnFwdHowamR0?=
 =?utf-8?B?cjlSak1jSFBzRmtYSEtTQlJqUkVpU2svbEJYdEp5c1V0cHFMdlZNM3FGOGFJ?=
 =?utf-8?B?K2hiU2IxdXpvaUNuY1BEb244ZzJ3QnZhVkxVdmpLeERXM3FnSTc0cWtGS3du?=
 =?utf-8?B?RURSS0k1QWRNY2lpT0RKV1VBN2JXdkF6TE96ZVNueHdhajhDZDhTeWxKVmhK?=
 =?utf-8?B?M3lSWW0vRHRIVGRIaGFhS1BwYWVWcmpNT1hreFYvcnEwV2VyN0phSVNZU0l2?=
 =?utf-8?B?aXNCbWoxbWVOVXd0cmdvT0ZncGdmQmpnejhqd0tMY3Z5Z3NyK2tVbnZxRklU?=
 =?utf-8?B?Q2Z6NloxMGtFMUJ5U1NueXNRVGlkaE5rb1p3Z1h1ZzlnZTBmUXJlTVpBOFVD?=
 =?utf-8?B?T2k0ZXpLRHV4dVBOVkYzSnFrQlU2WnVnNUdRN2htc3hJMHA1WjY1ZGsvUmtU?=
 =?utf-8?B?QW5WbkpXNmkxWStyUFJxY3VvQ2UvVUZiM0hpb21pTXRnVk9LU2s1TWlWL0pj?=
 =?utf-8?B?azFtMEJGS2cyN0doL3Voa21tVXJCRkdZamVnelllSXYwNm5xM2ljZGVnUHA1?=
 =?utf-8?B?bHNDRFhzQVhvZzBrMmRuK1NxYVMyL1hRSEpCU1c2OGFXQXkxUlFKcE5sNUQr?=
 =?utf-8?B?ZnJZZ1JMeVNUdGprNUxLVjdGU1paUjFKL3ZIazN5WDhpN1lxVG9tNDZqL1BX?=
 =?utf-8?B?cXRCc3FNWXBrNHdDcTBwU3B3azVMUjFEeXVpYTNwY3J1aU1HYXJlcjh3Qmoy?=
 =?utf-8?B?MlhHVG9aWVNSR1FYR040a29Xb2lEUjJQUk95UEg4NDZHODZjZDZmeE5JNnpD?=
 =?utf-8?B?L0I0Q1lGMjE2aFkyc3JNbmdWS05kVDNieDNXSDlXRjZGTTVqNEdSbkJoSk5Y?=
 =?utf-8?B?TEVNTnoxdlFvYmZ3YXFZaGJsNVRLeVNtSldwRGQvZWdrWmdZL3hUUkhIRk13?=
 =?utf-8?B?MENBVldXb2dmbUUyR2N4d0xCaTRXbHZYUDkwU05XbS90eEQ0eXk5QWVaYzdh?=
 =?utf-8?B?SktmalFWVHZrcmsweDNjVkd3WWF5QlcyNHV3WHVKNHA3ZFk0eDJwSTZTMVJo?=
 =?utf-8?B?eHMwVFpNaDdNaG5PalNEZG85Z3ZYNC96eFdRaXBRS1Z5bElHcGFacVFYNERW?=
 =?utf-8?B?N2wxRUxXWUNTdnFsNmFpc0VUKzdKeGwydDVxMTI2RkRNU3NpNHN0aEkrVi90?=
 =?utf-8?B?MkQvK0VxR0krYjRrNUN3NGlkL3lVbDZRT1ZhNDJKM2h4Q2RHYyt3RDlVd3F4?=
 =?utf-8?B?R05DazZySkFoY1EzdWRIOHdzQS80Zk1NU2J6ZWF5K1p6Tk1kZW5UKzFhWkhn?=
 =?utf-8?B?OThTZ0lXQmFjendPQ056VkdQUTFmejd4QmZRd3NDZnpINHJOeE1kc1lsd2tU?=
 =?utf-8?B?Nkp3QkgwYmlDdnhXTmxod01FOGUrSTI4bDdldTFqUFNTaks1RVBBZ2E5Sm1n?=
 =?utf-8?B?R1VUejRENHh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VElvdmNZYU9zUGhXY3VFSnVmRWxwRDFtcXo4Q2VRNjBQRVh6c0tQejg2ZmZq?=
 =?utf-8?B?VE1GdzR6ajVhSDB5SVZvZzRaOUVuc0pzaE1NMlJicWs5RitTWjByWWVCN0tL?=
 =?utf-8?B?T0w2eTVTTlRwMmJTT0JjcXVrRzRsZkNEaVJ0SFdrWDlPRi9wcjFqMS9rckZw?=
 =?utf-8?B?c2NQREF2T0MrR0tMN1RHR1Vmd24zM2hpOExXZjJTdlNwdnhTdzZNdjNhb2R2?=
 =?utf-8?B?MDJhZ3FVaS9zSjNMOU5UeEY0cXpabzRkYzF4RlVYOURZQ200NnlFdGhiZEFr?=
 =?utf-8?B?TmgzN1JDL1dVdVg4WGc2aHNFSUk0M29sSERvd25ndGJYbk54TlQrMTFNa2Zm?=
 =?utf-8?B?clNjU3RNL0UxMmNoVjRXTEtOWFRtUjZYc1hVRzMzOHl5RFpneFdkTkpJcEVn?=
 =?utf-8?B?TW9BMm81ZEFRUzVCWkVkMllaRHpucDBEYmdLYkRtanIra0laWlo0eDZOZ2wr?=
 =?utf-8?B?QXUxMXcyazR5dVQyNEZ0UXFOZjhRT2lqeVpWeXh1V1BQUWFaUTF5ZFJERUxl?=
 =?utf-8?B?OHprVjVET3E3aW94cWVsbDhPQ21DK0NRNE1kMmZtM2lDSVV6bFNlY2llT3Y2?=
 =?utf-8?B?SmhwWlU0TWJoRXQ5c1hWeU1hOVAzaUxsYU1kVmtaSHhMZzlMK3lhTW9FQzVT?=
 =?utf-8?B?cUx5QzR6TUUxVGxDa24wTHYydDlPNzBHdU5YYWZmNUJZdlkvTS9wbDVKWmxj?=
 =?utf-8?B?a0o3WlQ0ZEZwTDBEa0Z4cXI3K3h1S0RQcExZQjBDV1JyS1BrSnZNMHUxZU1R?=
 =?utf-8?B?RmZKNjBXckRqL0NjVGtHMUtxN3k0TkovQlMwVGFlL0NCZm9OSDJCb28yUTlP?=
 =?utf-8?B?eFMwWjVhcUhUQTBJUW9yTW1IcUh0Sjd2Zi9KQTJmT2RFLzdyY3lKZzluK2gr?=
 =?utf-8?B?QUVyYU5vTHdXVUozM21US1ptc2JoclYvTmpzaEJnam1zSkFlY3oyazhNUXBa?=
 =?utf-8?B?UnVZZkQ4TllacWJwLzMwK1JTdGx3aE4vQTFNcDJmb0NaK0lZTVVTTTlQSjUw?=
 =?utf-8?B?cUtMTVplWm9GbDNGdG1wTUFuY1RXNFV4dXY4RGFCYU02WDIrTmMrcWY5dzUz?=
 =?utf-8?B?M3lQOHR3a3FldFFXZ1Q4bE1SSlRtL0JpQjQ0bWhFS2diazNxV0ZUdHBGSVNC?=
 =?utf-8?B?WlV0QVhLbk5LcE1RbzEzZmN6TnRmSXB0N0xSaE1NTEhqWDZva3laandTWURr?=
 =?utf-8?B?eURyYWFZUnd6VWZXTjR3TkN1N240eGx5U0d2OE5DdU85NHpGczgzNkF1eUV6?=
 =?utf-8?B?Z2ZFNkNodjNaMDFkWjd4YkMxU1VlOWRMS2xsd21CK3lDSHlkdlh5dnRWR0RY?=
 =?utf-8?B?UzdoTUpFZXBqWmM2citFT0JUVGtFSjA1ckxEMU5FVTFCZVg5OFgxMUxIekFw?=
 =?utf-8?B?a0pZRFdEOVJnd1duOVVVYmsxOEg5M2lIUGtiWWd4NUtPcmRzRWpJdEUvS2ZY?=
 =?utf-8?B?QjBsaFJxQXppWDlzYmZMZEhTNG0wMFA2YlpwK1gxTnhRYXllMWNJMFJYU29t?=
 =?utf-8?B?U1ZLYnQxRWxkSEVrL0Z0RHVmRmEzUWo3am1qWHFzNU5rR3hSeFJsWklYUjRz?=
 =?utf-8?B?VGRzTFEzdXRkYVRjR3grd0JyREsxaEU3d2RpNHJxYmNzdUUzT0hxK2FYV3Rs?=
 =?utf-8?B?N1ltai9EVFJjOHRUVWhuZFQvVUJzTjJXWTdSeFJkcVhEVG50K1F5cEUzTEg4?=
 =?utf-8?B?cU9qTU1iZ2pYYzVVWmMrbmRaNXNQdzdGbi9NdUo4azVHVDQ3ZC9KT08zNldl?=
 =?utf-8?B?c1IvcHVnd2xZT2hiRGdnY1RUWDJ5R1BVbWVCRzFmdjlCbGZHM0szZ21kVWl5?=
 =?utf-8?B?MnhSaTEreVdnQ3k3TmhaeHFRMjdlMU1TanJYTUh5dU1IV0swQmtBcGxSaTYr?=
 =?utf-8?B?eW5rTXFWMFk5NXJhSElCdU1wMVFDNWtoTUxjRXFQbC94TDNEQmM5MXU3c3Ro?=
 =?utf-8?B?TENmQ2V1Y044NlE3dHZXcGlLTWY3NVBsbkRnNk1xOWFaekFQdU93L210UjZS?=
 =?utf-8?B?dGpTTEJzeDJJbG55c1M1NDlxVXFMUXVCMjExRjlBa21IRUM4T3h3R0treG53?=
 =?utf-8?B?NnV4SEJQcDhndVJwWjZuVWVMVkdCcWs2ZVNHdTgyTDcyd3YrTUZRSkF1TjJI?=
 =?utf-8?Q?4ALv2dBnZQVkhDDqFY8FrtRqD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3470ed2d-29ea-4c20-86b7-08dd760d9392
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:51:24.0193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: om0VB3FGAcAxZ/EaaRFlb0Z5JKtG35bdnz47GG/8uDCfHUTmURSDwUhdxMvMv7Y9d8fiKzJ+p/NRCxSjFFdjww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7452
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_125127_079375_D9322F3C 
X-CRM114-Status: GOOD (  13.27  )
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

Add the flag IRQ_DOMAIN_FLAG_MSI_IMMUTABLE and the API function
irq_domain_is_msi_immutable() to check if the MSI controller retains an
immutable address/data pair during irq_set_affinity().

Ensure compatibility with MSI users like PCIe Endpoint Doorbell, which
require the address/data pair to remain unchanged after setup. Use this
function to verify if the MSI controller is immutable.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v14 to v16
- none

change from v13 to v14
- Roll back to v12 version because Marc Zyngier have concern about add
DOMAIN_BUS_DEVICE_PCI_EP_MSI.
https://lore.kernel.org/imx/861pxfq315.wl-maz@kernel.org/

Change from v11 to v12
- change to IRQ_DOMAIN_FLAG_MSI_IMMUTABLE to minimized the code change.
---
 include/linux/irqdomain.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 33ff41eef8f73..86222602744e9 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -231,6 +231,9 @@ enum {
 	/* Irq domain must destroy generic chips when removed */
 	IRQ_DOMAIN_FLAG_DESTROY_GC	= (1 << 10),
 
+	/* Address and data pair is mutable when irq_set_affinity() */
+	IRQ_DOMAIN_FLAG_MSI_IMMUTABLE	= (1 << 11),
+
 	/*
 	 * Flags starting from IRQ_DOMAIN_FLAG_NONCORE are reserved
 	 * for implementation specific purposes and ignored by the
@@ -691,6 +694,10 @@ static inline bool irq_domain_is_msi_device(struct irq_domain *domain)
 	return domain->flags & IRQ_DOMAIN_FLAG_MSI_DEVICE;
 }
 
+static inline bool irq_domain_is_msi_immutable(struct irq_domain *domain)
+{
+	return domain->flags & IRQ_DOMAIN_FLAG_MSI_IMMUTABLE;
+}
 #else	/* CONFIG_IRQ_DOMAIN_HIERARCHY */
 static inline int irq_domain_alloc_irqs(struct irq_domain *domain,
 			unsigned int nr_irqs, int node, void *arg)

-- 
2.34.1


