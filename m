Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5961DC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGHcDy0qLXRPv9bDtIJ2M7IEz1TWHDvcXEwtams7Bbg=; b=b430zMBXlMIfPKzm8wVglSPyKv
	8yt/Ad7St/Sw15xtkvSomDkdjefgk46cC6FrlrwgleoZi67crtHIOJItL3alZF4q8lqJoBlK6rFqp
	1mGw4o0g7WGrz64ebuUYatjTGy3qdsz8tlIchkX4UGPa3BWeSE6Z7fef2bq9Zrfbnn7T3EV08/OSG
	dwBHZAgvsu5e2Ecxo9T5IgnIp1U05iIrD9onbkbcLQc5EdmtM47kPLtYUsAk1G04qmHvLEISc3BWs
	ax/NkRhS9075lvP/jElkoinKvBjHpGJGhSYhaBz8jr5mODIpAkks7/7DGfoqtXMJrARPOnzQ2jtN+
	O5y8g6SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uJt-000000025y9-2sUa;
	Mon, 07 Apr 2025 21:47:53 +0000
Received: from mail-db8eur05on20626.outbound.protection.outlook.com ([2a01:111:f403:2614::626] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sVS-00000001sRY-39NT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 19:51:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOSh7mgP8yUnB7MwxZr/2GAGlH01Alys+e9xxRzIwqW8pJemcdp+34UW4VA2c7TJBeR96drsOBv7+LcS29AZn56v/VIP8RPIc6ToERfdUfdUp2dZjCI7Wc+21tasX5axXybeOk1Chndv5XX4qlDRUHeHKVmcy8dM3rAaf6tRyxAAup66RYFCsJ/uRqoxj0b1OQEMej9yt8bJeQeTkzBRvwJUVZOaEFO0cw4U9cRMKDOcmDCXwntlrFG/jbIn+haN5oXNPNR3aFHPpP7qJMoWTpi3JvykeJMfi6JIFd71PSa7zCrWQ8S5BZGVqm8VEPKN+sv1k99lC93eoZAFfzaonQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGHcDy0qLXRPv9bDtIJ2M7IEz1TWHDvcXEwtams7Bbg=;
 b=eB0b4pfmwS2vNCnb8PYRL0Ppri7QBIWbw/tYJLF5fMiKitbfodzHgb0wQTxg/P0+7vVUcBv3bujzr5hmxa9+bhRA2wBAydT0yph56CHIyMtiQwnpEUZIN7UZQoCs3xryDW0GZLczHaEAcGK8lbB0WC5/MVvp7wTqoKSYuNt7AEF66ydMqqleF4NoOM+oaYKPMyYzxEO1xfoBgbmBimlcwLZ1vN+ZQzNTCHKOyB68QGtEYX1CvQ+51LppNhZTgdtg7UjUPPWYEzGgPD6fVmsCNA+QYGrQRATrOvRvJNMDAAR4Lnf0MrcuWoEqKSCVv/wVZa++JQRhqwkQXZZlf9ayGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGHcDy0qLXRPv9bDtIJ2M7IEz1TWHDvcXEwtams7Bbg=;
 b=gPL/8AG3Wp3e3qhbtN+HUY90yYJb0NbGH5dnCC5uWyFDSipMt0sNp24au3VVwTHBermaUOye90RS7N/0U2pEWRFVgHQWcZXXusxcYRZLV4YzrX8VMx4PBAotGcrX7Q3vV2YmqoOCQWzRIGZuZV1gDUFyuKZS6d2HjHsPvdciJk7AIFniGTUoBekDEkK9zmZ/IAGH4GXWJZYs4bDuOXY7lnMXD8wBi/8Ewyt/B9ePF4nzVfEXyS7LU0hiOsvG15pKOTL548ed5PB80en67hkGEMVOhdJSBLHZJNPHE6JuWUoc/d9W1zRgxKEvKiZd1zQVeUCVX9sArVQi5Li2wzMGfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7452.eurprd04.prod.outlook.com (2603:10a6:102:80::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 19:51:40 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 19:51:40 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 07 Apr 2025 15:50:55 -0400
Subject: [PATCH v17 05/15] irqchip/gic-v3-its: Add support for device tree
 msi-map and msi-mask
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-ep-msi-v17-5-633ab45a31d0@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744055468; l=1711;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=jis4uAlk2Y8+00RUPuARjfibBzjm61NUigLnBik7ARw=;
 b=iI9pwtljBuLt5jIUX+ZiQVLS/Az2zUc43cUiYGvdxPHQqUiPYE96L0dFFJM6hMF56AuSdFiV6
 Xp5R9HVp69/Dk37YPzvJqnG7sp9relzlf6xlXaDke9NP02aSuqcd/u5
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AS4P189CA0041.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cafad40-d60c-468a-70f6-08dd760d9d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkxvQUtjNDdtMHo5cmdVQ2ZEWHlIZXU3VTNva0wxa1JnS2J3amljTEplN0lN?=
 =?utf-8?B?VWprVDRZcG1zZWM5R3dVbFVNY2J4MXJDNEY3dCtNbXd1Um51aU5WY2dhRGtC?=
 =?utf-8?B?T3dFY2pYOEo3WUlwWHRvMmtqM2t0Nm5OT1V1ZkFLVStCenVZNmExdXo0NXhY?=
 =?utf-8?B?S3RsZmVCMVVqK2RGb2Eya21meEMxSHl4T2lVWFR6bU9JS3F4WUlVbnlyeCtT?=
 =?utf-8?B?WFk4V1dMeU1HUUpyKzNwNWY4aG5MM21CUExCQktYb2VWVHpNOHB3WGhsVGY5?=
 =?utf-8?B?czNBQkIxRDR4TWEvMysrT3l0eXowMkF0SEUxQklUb1hpVW05bTBySjRvRGhD?=
 =?utf-8?B?UUowTDFwTXN2eGgva1JMbmZvNFRUcWdnM08ySW1vTG8wWDl2dGk5MkhaTTJD?=
 =?utf-8?B?TC9EOFFneXlXQ2pXbCtKSEtDRjlCQXVPQjN3RXI3eVNhaGFZSXdOY2JNYjda?=
 =?utf-8?B?b3dqOSsyYXZCQzJXTmJ4dXJNU0oybWJvaTNlWnBJaGRYazNCa2JWaXVYSWtL?=
 =?utf-8?B?TjZOQlJEMnBLbVhKb1lHT3EyWFBNZlIzMGd1c3FMbVZWWWtNSE0zNlNqOG5R?=
 =?utf-8?B?VXVRK29iMGs3UTVKN1BNcU5ieWpwblUyYlN2U3BXMExmMzVZVXdmbWdJTS9E?=
 =?utf-8?B?YTJFWm9vSmxvNHdxTmxPWVNnVWxYNlhoakl2Z0ZGNVZEVkpJUTRSUkovNVJn?=
 =?utf-8?B?c0RBYmt5RnZFNitoSTM2ZHhZeHV6eGtmSlo3STBIeG1qMHRZYUxxU3dFTHQw?=
 =?utf-8?B?NW82WWovQnBMVWMvaFBrT0tCczUzQ2kxcFZwaEkySlVpcWh6SENqcDducEZQ?=
 =?utf-8?B?OGFtbjdSN2Z2YWxET21NZWVZNE1UbFcwM2dFaUFlWW1ydmdUMXlmeEVkaGZo?=
 =?utf-8?B?OUx2UnpaOUVSeFByR0NSemdXMmZkbmtGdEZzRTJwOStQRS9VY3p0b01qcjdT?=
 =?utf-8?B?QjdTVHJQVWRGWlhMNktiYStHUzRxZkRkNGxFajkxZFQ1WGVldW9KdVRzdzFl?=
 =?utf-8?B?OStCU3dpRStCMFA1M2M4S2FLN0NoREJTWG9HazBlYjNtSVlBRHJDRGl4UnZ6?=
 =?utf-8?B?Y09QMWlSai9Tb1dZK05mS0pPbnUyc2hjWkt6ZklwWEJoSE8yR0tveS9YM25S?=
 =?utf-8?B?Q2ROUjNNN0JLQXVLaU94QU5KQjF1SWVUL3BUWFB0U29taDZzL3djU0QwTnVv?=
 =?utf-8?B?Skx4bFQxcTlPako3aHdGb2tIWkJndEJnVHZaUXJUSHI2Ym9NUUhuNUx2em1L?=
 =?utf-8?B?bTlhSWkxb3ppOSsxNnYrOWNKQ3krcGFQaHF3dCtkcldwY2ozQzRBWWl4QVFq?=
 =?utf-8?B?TlhyNXd0RzVyVGpVVmNNMGFhWXQwNUdoWkNWaWs5OVlkcHl1N3M5dVVoeWNT?=
 =?utf-8?B?dlNuM0p5UWhqakR4UERaaGd1RWVvL0t0NTc4V01oUE5LVzhyaVhoMUNNOEYv?=
 =?utf-8?B?b0tKdjZ5dG9GY2hKTHZFbGcxN09aSFdSeGJtU0xZQVJTZnprbmhUTi94TzdW?=
 =?utf-8?B?aE5DNVBHbkxoZkZVUXlZNWF5SWc1UHZRUzFUa1dMZ1JFUlFsZnJnL0xDeWd3?=
 =?utf-8?B?NW9JTG1FcWYxOUNBMHFMK1lqenNRQTlHYkNyMU80WjVlV2Z5VFRMdG9halZG?=
 =?utf-8?B?RDRsZVo5UnpHQisyaURnaHFmYmNzWmFkck01cTVHbDEzallxRTJtUDJTMDBj?=
 =?utf-8?B?TWlOZWdyLytxVFREWVV5T1B1V3BYNGp6SXBrakhvbmkwcFMvNTF1WUVCcVp2?=
 =?utf-8?B?ak1ZWFVtNFoyNjJNMENjUXRwNGFWeW00QURiYlFUaThDaC9FRUdnY0dadzlO?=
 =?utf-8?B?OGRBN1dBZXpUYzMwdlg5b0VYNUZ2ZGNQV3AvMVp3VzZ2L3F1T0JENHNjLzB5?=
 =?utf-8?B?MzVzWjlaWncyQTd6djFxYWJERmxQTTIySHM1a3NLVVlVYkM2a0h1Njh4MVNx?=
 =?utf-8?B?S2JXZXlnUVpLaUF0L0R1Ym9FMklhYXdWQkwzMzJhVllVYmxVaWlIVWlGWnFI?=
 =?utf-8?B?RExRVlNtOFFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFJ2cmIxSmdmN0ROOUdBK3Z1bUYvbzZqUVRNUjhDMkxGeU04L052NjI0RTNB?=
 =?utf-8?B?N0MwQnQ3NUdtMTJiV0lzVWQzZVZGYlV3djcrQVBSeWRzdjA2dlVTWXN4Qm9E?=
 =?utf-8?B?bW5FM1FOZE9kL2VnZlpMd0M0ZkxOTGRra0ExaWdVaW9yUFpBZXQ4cVNkUUdL?=
 =?utf-8?B?NHNsVUdBRmg4UWVsckdjWnJyOTBRMWt1VWpZQTA3S3ZNdDBLOHlIL3A4Vmxu?=
 =?utf-8?B?VUpNLytDNFhtb2M5R1hNdUJ6NXY1a1BGemgxQzlreW5wZ1JmdUVaNDRhcko2?=
 =?utf-8?B?cE91bUZnYU9WSXpYZjlBeVdvZ0R1R0krNmx1MjVrTnRHc3kvZ3pNOGNPS2pX?=
 =?utf-8?B?aVgzUXR1NjU1c1VUdHBIS1hCQXlXRjhZZ1NRRFRQbkNCYlliOG53a3NqQy9Z?=
 =?utf-8?B?bXdTTlU5b3VQWUdhZXZteUMzazdTMmhQdTA4M0J5N09Db1pYbnVGNlV3dWQv?=
 =?utf-8?B?eUlOb0IxaVV2T285ZzdxWGFYYWpXWDErRnNoRit5Nk5FODR6QTd0ckhOY0JX?=
 =?utf-8?B?K09uNkcxNWViYkJFZFRPUmR2MUhEZHNEYXVNWEVpZzZBK24xRGVkVGt6aWY2?=
 =?utf-8?B?SnZ6NjlvWG5WRHd6UnFkNkJoMDBnc3JQc2RpYXNBTDVUZ2czVGxqUjhRb2xu?=
 =?utf-8?B?UkZBMUZqMmhXTkJMT1hGRXBKb3JWY3RCblpBNEZlY2svOFlJTS96SzlqVnBm?=
 =?utf-8?B?eFBHMzVvblRmUUNDajRzOGlFVmpLK0puQ3MyckNHQzJacFpDdDJ6SnhOWDhn?=
 =?utf-8?B?Rk5ZYkNKZCswWVZFSzdiMk56ak93M2FQNHhHeFpCWEVibmQwUUkwMlNrK0lO?=
 =?utf-8?B?WGtyUGd2WUFteEpPQ1RmZWh5cy9HVXY4bWpKa0UrQUxOUlV2WGppMDJPTWZ1?=
 =?utf-8?B?ajM3T3pJbytlLzlRdnZFakxybzl2d0pmbDZic25XRkZXaGtnVFg2TzZldjgy?=
 =?utf-8?B?WFZ6VEoyOEZ1V1NQaUJHekZTTFJML3dvOS9RVzNvQU1IMU01Z0JjdlBzWE1T?=
 =?utf-8?B?SU41SGxrYnNTeFhYY3FyYUxFVjRrU1lqbnp4cVVlQWFiTkdkSmhVS2Y0NzFQ?=
 =?utf-8?B?b29GaDZiVFYzR2E0dkROT0tNWHVOS2h6R3YvcWh5aDk0WmtLQVAwQk1uUHpI?=
 =?utf-8?B?NThkWXYxYWlFL3NIeE84UWw5VDJwRFFYU3lWSzU5bjdLaVlobnZHZWh2VklI?=
 =?utf-8?B?UFlhRFhEQUdDU2FRTUY4U01SWERPaEVUVEZwZGVSNEJKeW9aZzduaHduTTNF?=
 =?utf-8?B?M29JMEROZWlDZFlEZW1DOGxvT0YyTGVlMVdXa3EyR3ZwVjQ4alpNMXNyc2pv?=
 =?utf-8?B?b0RVNm45VTc2bGtCVEtCTFR6Z2h5VVBuaFRBeUhoRitZcENhM1hMMFdRYWFD?=
 =?utf-8?B?YTd4TURCNGhMRGE4Z3Z5MkhCeTc1WjArVUVYMENBb2ZHbU55Z1B3dDFWNFdn?=
 =?utf-8?B?VUtJT05PdlBSU0dSME9PUkVFeFV1ZTROK3YwV0t6NmNTN0ZkYmFqSHpmcHRG?=
 =?utf-8?B?ZU5WMVhtYi9SOXNOaFJadVpmcW4yQU1Lc3A3ZXhucEpGUmdNd3hyVytsWE9P?=
 =?utf-8?B?NTZ3NlNOMzJSZDFidDJqU1o1c3VmQ3l4Ym1MZklqZXVYaE5YdUJhQ1hFTElm?=
 =?utf-8?B?bFpPN0VBUjA1M1FFbStRU2NGSm9jZTN6OGt0Vm1KZlhpanpWQmdFY1Bqd2c2?=
 =?utf-8?B?cFIwVy9mQnNJdFRkS0hIYTdXZldQQ3ZVL1B5UFNFRm45QzlvMFh2U1hJLzlI?=
 =?utf-8?B?QmFDU1BPZ2JwSnM3WTE5V05Ga0szVndBNnV2YUJkRTN1MUc0b0xmckFoUVIv?=
 =?utf-8?B?Y3ROak9zM3Z4R3ljYzJLWnM5Y1RQOVU5djV5bllYam0yU1ZOeGRzQmhhTFlq?=
 =?utf-8?B?MDdHSjYzNHBjN3Q2V0RyRlI4ejUwcFFmU1kvdFRvYU5hOStweUhVeVgxQU5q?=
 =?utf-8?B?ZXA4Vmw1WU0xd2dBbzAyVXhZWXdySGZybkt2UHFCWUNUeWNNOGpyT2lYY3Fo?=
 =?utf-8?B?QlF6RHFvVjlRVWhtZFpLUlI3U251bGRrdWl1TWduUy9MMFRzeDdzM2p4a0pI?=
 =?utf-8?B?T2dTaHR3T2lZMzl1RG9FbUtEUnFWQTlzTUk0ZCs2WDFrWHlCOXQzbVlBem9N?=
 =?utf-8?Q?Z01TmV+wzxNTaoB9P78lrpW71?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cafad40-d60c-468a-70f6-08dd760d9d3e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:51:40.2783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E14KVPTbC+Rr44E/Ac8QVTxfWTUcxaSCf6bTUgLNLb66xjNpgRkQVXbd6DJwhOLpsi2EgxdKNhY1NmePCOvytg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7452
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_125142_784717_C993FA42 
X-CRM114-Status: GOOD (  14.01  )
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

Some platform devices create child devices dynamically and require the
parent device's msi-map to map device IDs to actual sideband information.

A typical use case is using ITS as a PCIe Endpoint Controller(EPC)'s
doorbell function, where PCI hosts send TLP memory writes to the EP
controller. The EP controller converts these writes to AXI transactions
and appends platform-specific sideband information.

EPC's DTS will provide such information by msi-map and msi-mask. A
simplified dts as

pcie-ep@10000000 {
	...
	msi-map = <0 &its 0xc 8>;
                          ^^^ 0xc is implement defined sideband information,
			      which append to AXI write transaction.
	           ^ 0 is function index.

	msi-mask = <0x7>
}

Check msi-map if msi-parent missed to keep compatility with existed system.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v15 to v16
- remove ascii figures in commit message

change from v14 to v15
- none

change from v13 to v14
new patch
---
 drivers/irqchip/irq-gic-v3-its-msi-parent.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3-its-msi-parent.c b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
index bdb04c8081480..68f9ba4085ce5 100644
--- a/drivers/irqchip/irq-gic-v3-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-v3-its-msi-parent.c
@@ -118,6 +118,14 @@ static int of_pmsi_get_dev_id(struct irq_domain *domain, struct device *dev,
 		index++;
 	} while (!ret);
 
+	if (ret) {
+		struct device_node *np = NULL;
+
+		ret = of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &np, dev_id);
+		if (np)
+			of_node_put(np);
+	}
+
 	return ret;
 }
 

-- 
2.34.1


