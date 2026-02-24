Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC56F3C9BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 16:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHhBFcbBTUorCY7vemzw8skjt1bXlxCdnb0sykcbxw4=; b=EvQj2NSIVuVqPN4s4FqL07K0ZW
	CjfMRc4wQL21651CXUqJvDfNo0o7tOdWONU95CirpIth0QDscpJaxXhegAbWSVUoy25Ia1luPXt8p
	4PUBIu+n/7xEoDALB8cEZORQGlwmbfWrKHfSYTwzgp3tYEvyDmaYgKKFFYWBpKV6ocn5atGv4DcOn
	Mt4fYt46szLyVqHfOOb+HN+NnSHFj3zCikA4/ceZSz2Ufm84ik0KdZGxCqA3tY0cVr69dO1shtATF
	2t40rwCfe4zwF1u9Wfuf7xXTvVXTWPfhVWJEYMgOvo7Y40LFSBZdWSQz4MUK4PnjhIqTr9g7ftkSl
	7zmig8Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvVk-00000002Q3d-45xN;
	Tue, 24 Feb 2026 16:43:49 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuvVi-00000002Q3H-1fxY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 16:43:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvszJMPHdyqrmBqtlSUVLRvnK04KsOb+2dTtsGsF21T/8H7JliElf2MjMQ2xi08sKQMqMf46dgQy/7mjQXXEvHz/ZFBHBlu5AX37V4HyLKgiBzOHkNDAu6aPx2WiJ1QFp8lRL3fyV8UQI8hhNt1A4tz2hxOg8a3krKwHoQZyqELE+3g0WKDM5jZdg/KqlvcQuzfa6JP3hYiQYqlb+qpssTwXD+jEb2TPCJl6Wyr+ouXrc49GtKSyDvKuD0pP7ZxWcz2oYCeBhBSmIcacknJhWXE/tTMYd4/+7BujOJegFz9bwB76lz3842fR68C7kdcVytpoxA0TJRz8Fv5Oj9DaHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHhBFcbBTUorCY7vemzw8skjt1bXlxCdnb0sykcbxw4=;
 b=YgorGtWP+84HLErH30eYwOSqbqPNdkqrmnsaeCQwvLQ84FZAe3brjBOPqUYqrXdqpF1fWeRkUI2GYUIO9jXwD/TL8WyRQ4R5KYSKRGOOJrdjzhqv5C0+ugM+V59vbjN1H3LGFqEfz575Q1+VtNczXXd3fDnkpmBji6b5JazFEeQmIhodmJ3H4S23UyiJ5HEOtRloeWBjFxr98yDHlmnN+3dP7EXTVSYwBJsgouOl0j3bYVFpuY8FSeAuccrqRaMbgqDuz/TbMeVzsRRYFWYh2QpKn8Hdf4zf35xzYz6NeRreTTuvs/R4K9NTin1mgR29pUj8m/WuHHGl6yeeN8Zpfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHhBFcbBTUorCY7vemzw8skjt1bXlxCdnb0sykcbxw4=;
 b=WNmcBZ9Wu+W/zdZeMeb+ljgnX0fQNASNKtcXb5Tq3k1ynFbxbwaD+dIfS+/PMbt+cB7VT1/TnnikKvaWSbnpmm1QI4WGlfKTd0+Tj62rRejK58ja6/67H7cHqRV/5mRG+7ieUZjlbkSrQjogyhAEQuP49D1vWE83jeJYFpOk99WrYafKBCzlZ2XJN5UUrYzo/qS46b3eNzmnuXPmErwfo0ENKpLu+QdzXz94E3ck23FabVKurFssv1Zjij7dsWXwV6JQSIEyPEQxqFdu3X1c9AThH+GhTwg0LgzQNXftgyLc12yeigxmIBZ1eZR+nG9mkxsVyNVdSXR8wkbdzR2okQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GVXPR04MB10303.eurprd04.prod.outlook.com (2603:10a6:150:1ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 16:43:39 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 16:43:39 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Sherry Sun <sherry.sun@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] arm64: dts: imx93-evk/qsb: add m2-pcm-level-shifter-hog to enable BT HFP
Date: Tue, 24 Feb 2026 11:43:15 -0500
Message-ID: <177195134253.2886260.14856162433874840391.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121111346.2598783-1-sherry.sun@nxp.com>
References: <20260121111346.2598783-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::13) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GVXPR04MB10303:EE_
X-MS-Office365-Filtering-Correlation-Id: f4f348e2-9fc0-4b75-1516-08de73c3dc9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVF0T3g3MklENkY3MGNORDR5aGRDZ0FWQ3ZNcEhZNjdnKzBzR3ZqSnlKaStH?=
 =?utf-8?B?d053NHdQWkQ4RHY5OERqRFA4ZzJHc0JkQVF3dTE2T0RMZ0ZjQWxHM2xmZk00?=
 =?utf-8?B?UG1VcnQwcGxiNmpvRy84MldkdzNVWWdRV1JXMDlvb3dpeGpyOVBmT3cyV25q?=
 =?utf-8?B?Z2pnem9IL3MycG1zNThxanNUOFh2OXhPQlVYVk90aUt6VWlGWWoyZkJkSkJI?=
 =?utf-8?B?Qmt6eDVIRnZuVWk5TFZtdXJzaG1CMUFJNzVYRnJWbFNEL241dzhwU0pzeVdF?=
 =?utf-8?B?ZlV3V2RNODNaSjJ4VURaZVFZYUJ3SytwMXUzYmVXc0RObFNRdmtkYWcxK2FB?=
 =?utf-8?B?azlhTnlZelRUVFpEU2M1ZzJ3TFhkUVhYZndYQ0lmSTBhdnFuSGh1VTJmUE5j?=
 =?utf-8?B?Q3NwNnRDUGZja29wUEN6MEV6NEd4L0hWS0FHZFQ0MDB2YXRsaDNvQStmQmk4?=
 =?utf-8?B?ZGJ4cTNTMDN2eHh0WmtxVGxUN0QrWnozQnFvejZNcjZUcDE3UUtQOUhTUE1S?=
 =?utf-8?B?dk55OEtkdFZhK0tpVlh1WVl2T2NSK1VPSnBWeWNEc20wL09QZlZyS0xmS25H?=
 =?utf-8?B?SS9pTitFZWl2MUhmNXljYThPYjNkaDRxNDEvNUpaYTFpdDdpVE1IQWJlYlpB?=
 =?utf-8?B?b1FKcDlHUmlhVE9OZ2w4S1ZnTWVDVVovbWxEMlN0SWFwalpnamE5S1psZXNV?=
 =?utf-8?B?d05yVmNNd3R0aDUxTFFlek5xZzk4aHFCWEJWbnRrcVRXUFJxQU1WZThNN1BJ?=
 =?utf-8?B?bkVldTFobi9QRFhBRmlpUGJMTDUwVWFTOTBERHQ4OVJKOE5zb2xjOG90Mkcx?=
 =?utf-8?B?TXZiWkhFUjBkUUNyRXU2eTRka1VyWkFmOVdJT3FqQVpBUFloU3VnOW1lZE1D?=
 =?utf-8?B?L3JOTFlpQklON1dJVXNDQ3hmZ0FOUmlwd3p5RHFLZm5Oek5qMk1lUkI2YTZR?=
 =?utf-8?B?REo3a0FQb0wwQkJzeVZOMFBjbE1scHNrVlhnY2FFR3EwRmN1Rm1vSTNwZFdW?=
 =?utf-8?B?MFV3YkRmbCtjRFo0SWYvTDRNSHFYc0FNS2J3TVo4TnplT05PSjEybEYrL08y?=
 =?utf-8?B?cGgzVnJnazIyWHhVUDY5bDhXcVkrRjlwT29FUmZWcWkxSzZRWW1BbEFkK0ND?=
 =?utf-8?B?NndrWVBGczJJNjNBR0xwOUdRV3V5QVJnYnlUT0tKbkN1WXpsZmhDRWlIOXIr?=
 =?utf-8?B?OHQ0WEFEVDF5dEVFSXd4UnUrSEZuaVlMMmxMN2cyZFh3REJ3emhZVjF2SkRG?=
 =?utf-8?B?TjJDNVArd1dEWUpmdFBPdjZlUGxQNk5VNUdjTitwWHdvSlhIRk9SK0pobzBF?=
 =?utf-8?B?UzJrdVBhS1hYd3haTDNKUWxaUmtpWWoyUmF3TDhHRklFeHF1RE5DWjJ4a2gz?=
 =?utf-8?B?ZGdQS1Z4TldOeVBZTUx0NmFmRmN1UDZZME52M2VxSG5LbWNmRS92dk9Ua2cz?=
 =?utf-8?B?NG4wUUNjT0xxOE84ajl2dW9GSkd0b0ZhOWduUEczOHdOU3RLQnpwRHhMMmtq?=
 =?utf-8?B?Um1FYm5VOXlCRjZQT04vb3NpMlhTUlhSeW9UZlJ2SDhGbW9uUjN1VU1sSXIv?=
 =?utf-8?B?NUZGVFBRanRvUU5SaDRkU01NSUduYVg5MW0zV2NXVSt5MXI1dDVYR0FYcUQ5?=
 =?utf-8?B?U3VsVEFBa2FLQzJPUFB6VTdJdHR0ejF3MEtsT0lPZVAzemRwOExFTzRJSFhG?=
 =?utf-8?B?VmY1aS9HZHhUTCthRUtLN1N2a201aWhkZHUvK1FzZklxdG1ETkxadDBvNmRm?=
 =?utf-8?B?SElieTZtQWxuVGd4RWlDR0ErRk1GQUxRcEJDcTdWdUQxMVI4TDc2czZISTBt?=
 =?utf-8?B?Y3JlbHJpSUIvdUduaFRvMUpXREhIaVFDZ25EZzhNbFdYcGJJNmVSV3A5STBX?=
 =?utf-8?B?L1o2b3czMVV5SnoyN0FHWDlCa3BHV0RFMmtKTlpXRXdaSVdVRTRFTm5qZk5m?=
 =?utf-8?B?SUgza0pibHlwM3NOc3doeWVkb2R2Zm9KbzJXTXlmUktLSndkZGl6UXkxMW9j?=
 =?utf-8?B?Sk5Tekh3YWMzNWRCcDVrQUJMQStsa01XU21HVjFmTjNDendMTmxITi9QaFVr?=
 =?utf-8?B?ZHJlaS9WenBEUmdTRUpvejhqSlY5MGV6NmJUWmY3MjMrSFBBQ2hVQVlkVndl?=
 =?utf-8?B?TmkwUDNIdFZqNkFXT1RsSzFOU0YwNmFqU0ZFeFB4c0oxVXAxS0oycjRRbmtO?=
 =?utf-8?Q?v3uDhl3IB6jx9MlhtGyx4oc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWU4My9jZEpGcHZvRGpwK2NuVFZ1NlMrOC81Z0E5MWprU0JYNERQZkE0djNr?=
 =?utf-8?B?MldMMm5QZkZrVkZ2MW0xR2gxVjY5dHV2aHY4V1dsTi9WeXJYaGNlNW5iNXk4?=
 =?utf-8?B?Umw2YTVyMEN2enI2cUtESHZCRUlYN0x3cmZiS1VwZU5YcHYzbjh3bUVMcDA2?=
 =?utf-8?B?NXZIWnNZVTl1OExUYWQ1M2k0c3hXZlIrZ1lvZi8xY3BwWDNUOUJadHc2Yi9O?=
 =?utf-8?B?UWJhbkNVVEpMWUVwS2tyV3NiakM3VWtSTy9BdG5PTi9DRXIxM3BWLzl6Vmo0?=
 =?utf-8?B?OWwxK3NBN0xtREp1amZJWW53eFVDbGRxZ1hqYUxSajA3NkxidmtYLzljRVpm?=
 =?utf-8?B?dUZjWm1pdDNVejlwL2l0S1NwTzQ5Y29CM0wySEhlZDEybWpmRmRvVm9ENDU5?=
 =?utf-8?B?MHN4a2l0Z1NUcnY1ai9CaUlCcEFkaW55ekI1enBESnRtanh4bU1lMlU2VTFU?=
 =?utf-8?B?THlneWwyVUdlMzZCNUZ3TGx5SEFralFMS2NwbDNrd1M5aWxOTVRjT3VCWXd3?=
 =?utf-8?B?SXJjdVRFZnRhVGNPTVhBUFA0T1g0bWptRkRMSEdabndBdDdWazM3Qy9OaWYw?=
 =?utf-8?B?ZVlBWlY3Q2J4UGtuVFJURkhkaU9FbGJtVE1VRDhEOTAwQnJ1K1N6bmptejVT?=
 =?utf-8?B?aWtBR2N4OTlXNUM0SUxRU1pTV2pCUkowRHBXdGZzQ093MkZjU2tZL2dyamtI?=
 =?utf-8?B?UUgvYkYyeEsydkY2c2ZiREs0N0MxeVpIN2txS25NVkZKQnBBcEJVSnZSRkJK?=
 =?utf-8?B?QThyS2dvdWdhZEo2ZUNsVlB3VEc2T1lySzUwYjNpOGxJc2tOcmQ2YVBGVnFT?=
 =?utf-8?B?dUtUY3hKaFZ1MDV2OTVzNk85WTUycy9kSW91V2h1Z0Q5WVNQZmRNUTBobkpz?=
 =?utf-8?B?UXdrdVRMRDZ2ZnRncjlwTlpqa1NraVdFaVlTYXpPV1h1c3NSd2plUnAxcWFR?=
 =?utf-8?B?TFE3ZHZ4by9qdnBMbUFaN2VoMk90Zys2ZjhCeDhvcU0rL2RxVFdpT0x4K05X?=
 =?utf-8?B?MzUydFo3VC80U3paR214MjQwbUQ0eXNZbTVoTFpQVjdZV3ZnTiszYVJzc1Vy?=
 =?utf-8?B?MnFyL3dWTDZ6dUc2M0dtRTQ4emlsaE5GWC9OMmNXY3IxdEtyU29hY0hQK2Ja?=
 =?utf-8?B?K2hRamJHSkJBNlphU2owSVRSZFRVMXZFZzNVZXB4ZWk1QThhNjRNcUlyczJ4?=
 =?utf-8?B?L3pKWkdxMXVBaHI4d0IraU04Ui94eWhsVzZVeDRLazZPbjYxN21ScmZMbEtz?=
 =?utf-8?B?cGUzOFBhU3hOcGVYOTI3Zm9ENTkyODZzSVhkTm95OXcrR256MHA1Ny9GWktD?=
 =?utf-8?B?clJHRWw2RU1KTy9WRUpLeHBUMWxNVWk3dDNmNldCN002a1NGN09abkJIUzB3?=
 =?utf-8?B?TGNSZlphK0tXeDNIQ1hLY2QrV0orV2FDcmdERGt5OXNXWGhHRjFSYmVVUW9G?=
 =?utf-8?B?RnEzREdzcmFuZWt3VXZoc2FTQmpSRlNRc1puNzFYa3lmUzg0MUZ5NnhOakc2?=
 =?utf-8?B?RUg4c3JuWWF1VnpVWCtxRnNpZWhoM0dTUHZHM3J1MjRXY1VJb1Jqa0FXSHM1?=
 =?utf-8?B?TXgyQWo0N2F3cldyR2tLcEUwNUdyNTFjMVhQVGN3dE5uQ25xNFYvZ3JBVDQ2?=
 =?utf-8?B?cUxWVXF4ZmdwVytDMTdJRUNMallUSXVaQklrSHJiQ1ZiVkdHbkd5dlQwWnFZ?=
 =?utf-8?B?ZndkSEdQdDZZNmx6WDZzeHlrM21sVDlEZlZoUTFGZ2VnaDVNRzBIOFpyQU9K?=
 =?utf-8?B?Q1E1TDU4ZFZTdTd4WDBWT1I0WlJuemZ0UThURFAzR3hXQTZGZXNxSmZkb2k3?=
 =?utf-8?B?aEtJS2FMcU1uLy9RZDZZRk42L2xXL1RxVVlwenVEOFR6MzQxWjQ0R2Z2MDBo?=
 =?utf-8?B?MWhUYmFvcExlSStSTjB2eTBUaTlBZEgwMzFLUHBmRys2L0tmL1FvSWFTMmh5?=
 =?utf-8?B?OFhGSlVXR3BmUVR1QkFjOC9KM1VqL2RFYThybWgzWFdhQXBacEtXS1hTc0Uz?=
 =?utf-8?B?eGJLVFdBWmlHN1grQjRPdC9KODhIZ0N6U21zeEIxbTlSa3ZZd0hFV3gzTTh6?=
 =?utf-8?B?ay9yempoUDVIS0M1MWtuSGtyNGc2Z2JORTFkSVV3K0svaGM1Q1ZtUlAyc2JF?=
 =?utf-8?B?c0FkUmRPZjB0UDVZSEtyRnF0emxoV2cxU0dwMEN3UEZBU2p3TVF2TnFEL3Zt?=
 =?utf-8?B?UUxveUNsSTloa1Z3ZkZvQ3ZOa2RxakNXekt2bjBDdFNEMEpKc0J4N0dFdjBi?=
 =?utf-8?B?YTlJNFhtNGpDeGtEV2s4eWM2bWU3dlJJeGZqQlp5SDdsc3lMaWFWYmw0alUx?=
 =?utf-8?Q?Rp9kqyVWUa/mdjagKW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4f348e2-9fc0-4b75-1516-08de73c3dc9f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 16:43:39.3705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KaYxtaYt6cgGPdvDYgc6LKL9KFyn2XXE4Hu7ddsuhrtzH1V/XOrXbNEpMZ/r22yioLg2ipVs6N0NmETkfAT7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_084346_439432_332C26F8 
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


On Wed, 21 Jan 2026 19:13:46 +0800, Sherry Sun wrote:
> For i.MX93 11x11 EVK and 9x9 QSB boards, add the gpio-hog to enable the
> M.2 PCM pins level shifter connected between soc sai1 interface and M.2
> PCM pins so that HFP feature can be supported.
>
> Since the HFP is only used at a later stage — after the BT firmware has
> been downloaded and the BT connection with the remote device has been
> established — both the pcal6524 expander and sai1 interface are already
> fully initialized and available by that time. Therefore, using a
> gpio-hog here will not introduce any probe ordering or dependency issues
> for the HFP use case.
>
> [...]

Applied, thanks!

[1/1] arm64: dts: imx93-evk/qsb: add m2-pcm-level-shifter-hog to enable BT HFP

Best regards,
--
Frank Li <Frank.Li@nxp.com>

