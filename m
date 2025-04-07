Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBF6C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 22:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4JrBsZtAlcOj29e5c0bW2M2CW0PWqPaa73Lwja/s/W0=; b=Fcw9aEUc7rWIrcc1K6NKljPh3m
	A1+lLZJKaoSiDzlbKoB4j4uzma2qncE5HiE3u1z4R61yvZLgRKFsPSfM4P9w7ZIEVUigA5IKc7D2e
	fxV5Z8WLTqTxi10eW2n+dxOZ4qUYF9BY+I+VBjeDCby6zyck0leswJ8kiqqp8zWCgkeoh3MsGzfop
	K2SFEBcMvoZBqg45kosi5IhOlSS6Y+hZJ6pobqLVfMzSd4Eyybcx980AugnY5yygfrf1CvwFOeggr
	Fkoav97m3MjqqL1PR0Ibfr2gZQSUFcBqT5MiZLMbWeC3BgD1FaVsB7FU9WgL/pZZernMfqDsXnCCN
	I9JMHQ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vPV-00000002Ea3-2WXb;
	Mon, 07 Apr 2025 22:57:45 +0000
Received: from mail-vi1eur05on20620.outbound.protection.outlook.com ([2a01:111:f403:2613::620] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sVP-00000001sQa-2xVO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 19:51:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfLvh87chlf20+02gN2m+yEPyWkQXjv6QgT0rza9uE9Rd8gU7PGQhx97vYEygWR12e6hKjRiw8Cr4w7jxyAOiQmurluHcnBP6ixm7kfKPwQIrjbHg7ZVNO5c9uxeI1HWe+pIN9MAR+nYL/5mydNpogTsAEPHQyOld5bpg3nVgTk5vRNdD4wjDodIKfJNUEycfbEWlJ1GVmHe7Pqjiw0URflpiyfekpckVn9QHqsgfJ+N1KIv1iKqVGmS7h7PijayXYa2r1PthRbcIOEEbjHVstiuqLAEd8aXEif0aXdhZwrQ7kzQmHQS8EHf9OwSNG2tr992qOZkYh22DwCNiGXsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JrBsZtAlcOj29e5c0bW2M2CW0PWqPaa73Lwja/s/W0=;
 b=frKH0fV1DMZ3ANgEgJAB7hUoyEKPhIEhi0qdWrPoUWkTByBaIvUG7T/CDCdKfr6Q4ashGrBXm9nCt1/mCxgh7nqHHkhsj1h7jZ6ttj+Nd/C/iheYDYU/dFiznr+u8I80+YjuBd56o0AeTmXPE/nTOEbAbR+q+5CtyW2kqbhzf5YQy09BDETayDqV0URFhFLVFlVpRGPyOIxhC/uYYBi265DAcw/1/K8rfeSD1p1+P5zs3csIbqkEUnmOxGuxXR/+qUU1mMCVd1SQBt4F53M83+zYOIe4v8ap+Wk7R7LQfBLMbvn3UzsojNGbtBqaZatl68W/z+mdXDJUZ0JdRyU7mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JrBsZtAlcOj29e5c0bW2M2CW0PWqPaa73Lwja/s/W0=;
 b=QiT+i9k/NZat/FKX+8XOeCWJUL7z4WTgqGvy6NhVgsiVpKTyt7azj6hD1Wd63TQ5DL3HooYFo6MypUSCDmbcqowDfbcRO/he43y5tXPSEeC5r4kZ1Si7Q2AjS22MjReGYdbXP8Ejj9yiUR/t2wkqAuHacl2tKPAFkNw1YpapOn2EpMZY5Jxk9P/IAyfQetDC7+pKyP/R4AVzypnLfsq/m/GZFGBwV2+5VCUeHywWb7DYJD9+EIanLKXvMrMHhpz4SPyUESjeGIZEcNbZqxnSKkBCaSxVyn+n54O8I67++U7xfGcRqczwevRtS1P3vJ+KJHxJByTbLxt/+M4x6zRzOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7452.eurprd04.prod.outlook.com (2603:10a6:102:80::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 19:51:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 19:51:35 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 07 Apr 2025 15:50:54 -0400
Subject: [PATCH v17 04/15] dt-bindings: PCI: pci-ep: Add support for
 iommu-map and msi-map
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-ep-msi-v17-4-633ab45a31d0@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744055467; l=4116;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=lx8wFQA410Ulvs80/pKL4VcApSvR4ds/sEngpDV8Kd4=;
 b=I1R+jDG3YY35ycOben6Uf+GFMbs3NADfpUIB+/Lejqv8MZQ/THhseBoBuWYYBlww5NEQQEie7
 tQ6xWc5mfZFCVpG8bw+bLzee6GopcdR0M+ULD+7pbLa7z6SCCOF5exP
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AS4P189CA0041.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 913b0e73-9d4a-480d-9298-08dd760d9a14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHMzcWJJa1pyTkVHL0ZENmdDbHRWN1RaSkZZY3h0ZDFoOEg2NFJxdDB2VW41?=
 =?utf-8?B?SlM2RFJQV2hiSlA0Y2Rsek83ejRDQk40U1dMWWNrSjBtUXpqZDFMSk1adU1J?=
 =?utf-8?B?cVdoUDlSVFN5RDZITDJKM0VINUZRU0U1S2ltbXR4Y3grUnd3TVZieTNyV04v?=
 =?utf-8?B?NzNTcFgrTUVnakRYblJpMVFyV0ZzcG5hdk4yTm9DaWVjQ3dSRTU5T3Q2b2lj?=
 =?utf-8?B?YWdiV05ZMnV3b1FZOGE1LzQ0aTFvcEtHVE1Nc0liNlB4cktVNDRlbzM2M3Ju?=
 =?utf-8?B?Q2tDM0E2dndZYmN1K29lRXl6S1o1cFdxQituZ1hhUmRkN3oraldsRWpNb2tu?=
 =?utf-8?B?NFNSMXd6Qi9rQWU2VEdqdXgvUmFudnJhMUg4RkNqamlTYnhUVWlQcG1JanZl?=
 =?utf-8?B?K3l1MTdOU0trdW9sOEp1RVoyZTlzQWNJL1VXMUlBVUlFeTNGRmlneTREZndT?=
 =?utf-8?B?bS9ESjkwUzhzUWgzRk5xMi9LRVJmUXZ4ZkZ5b3FsaHc2dTd2c2FqOVQxeVZq?=
 =?utf-8?B?cXlZaHcrdjFuYTFEdnd0OVRKVWZPakltaXV0MUZTeU5UM1pvYTQ1QlI4aGsx?=
 =?utf-8?B?eHgzOGNyRlQ5LzdZZ010aTAvTDU1SnhOVVVJbEx1RDJSKzJ3VVJtYmpvMjJM?=
 =?utf-8?B?eWN0U2haNzlidUN2WFJpc0NscmJFMURDSnRDb0N6cnpNeWJMVm1jYS9WZk5L?=
 =?utf-8?B?SGQ2UDZiVlRZZmtGa2tHUlpqdVpCTFAzSTRpUFJZWFVrU0lYd2lYb1F4eW41?=
 =?utf-8?B?QnE5aTRPdzkrL3dBUWRCSjJCQnNpSzRvWENoQUx1a3JlanFOZ0FKT2xUYm05?=
 =?utf-8?B?eU9pSE14ZUZwcUF6Smo4Z3VlakkzVmkwY1VucFBidVFicFVzUmQ4VUwvbnAx?=
 =?utf-8?B?NHRPdGlCajN5dEtoT1RaMWJ4ZXVDUldZc2VXOFFxMWlWcFlhUE5ZNGt2T2p2?=
 =?utf-8?B?Ulc0R2N4WS9FV3VqSVlHSTdmd3JjQlZCWVBiYVhXbktMNkoxS1l1M3hhK3kr?=
 =?utf-8?B?MUFIS2kyZEczNjB2YUlKbFpjOGtuY2RLQmJ6OEROMVFOdG41N2pmNnBwNDND?=
 =?utf-8?B?UDZmK3VBUjlBZVE2TVp5NnZDTTdBaTJJcUNJZEhiSm9VRDlQQTV3d3ZHeWJB?=
 =?utf-8?B?eFFZZmNIcm1TVFdrVDFsek5wWTJOWFphWnFFYWhEZUlQTDJxS0IzM3Y4UERN?=
 =?utf-8?B?VEEwKy95TitLdEdleEdVeDJtYzRHaTNXLy9LR1Z1RkVUWTU2TXBieC8ya0FB?=
 =?utf-8?B?TmsxaC83c2drT0dBTGJNQjlnaVVvMjN0T0lXSVNDc3l2WHAvbHdzdVhac3gw?=
 =?utf-8?B?R0xKSVAwL0NRWlNONTRidVF0SEExcWxoYkJzaFY5bDRGVWFrektkU1ZUaXRN?=
 =?utf-8?B?Y09NVGlCbm5iZzl6S1ErNjl0YmFYV1NtTHlXVXczcWV5RDN4UWFMdk9xUmdI?=
 =?utf-8?B?dWQwZG1JdW96bzFnM0lGYzZGdXBXNC81NVJIeW80RW5iRFIxZDBBWUZYUlg5?=
 =?utf-8?B?Q0JBMHorRmQ3alExRGMyRkYxZ0M1NkZhd0I0MStYSEUrSkM0Yjd2Tk9keWxw?=
 =?utf-8?B?amJMengzTXQ3N1IyNXh1ZndXU0ZSbjcrVWtEY3RaUkNyd3ptUHBQbGRnaVhs?=
 =?utf-8?B?NXltNDM2S21qYzcxU1hkaGtidDQvM013NE1BM2NUSUJsUWFtVWk2UGpDZDFH?=
 =?utf-8?B?T0hIc3RnejM2dTkwQ2drV0Y1ZUNrUmdhaUwrYlFrNW5LVmZXTXhqYXFpQ0RU?=
 =?utf-8?B?eFZIOG8vYXRvTTBvZUJzbGovc3JUUEJOTFR4aWovUkE0ZGMrSkJaVkI0R2pa?=
 =?utf-8?B?SlozYXN6S0pkTldHaTQyMnhNUWtwMWhDcWxyZDdtNmk0dmkzTFBLdC84eERa?=
 =?utf-8?B?QjRBYmJHT1p1cW1NanRvRTU1UzZ4ams5VWNreFZ2My9lcCttT1RiRzFlMm9K?=
 =?utf-8?B?dCs0SkVZY2RJVUhHWWlrT2RJYUFtaHA1d2h3cGc3Uy9CbGtTUVFuZmN0MFRm?=
 =?utf-8?B?T1M0cW5OYmF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmxQWFE1MDQzdVF4bVlqaGFmVkE4RFNHQXNlS1EwMTE0SGd5aWtDeERscnM0?=
 =?utf-8?B?RFNzaVV2NXgzY3BnZXF0K0h2V2FtMTRQWFp5SGhpV2F5KzhkSk9lMDZIZXlK?=
 =?utf-8?B?NXVkc3ZsdWExTjZ2VCtYNkVYSFdVUnV2czZDRjJ5ZldXeENleVYrbFhXa3d4?=
 =?utf-8?B?dG5zZzBXMWgrK3p5dVVacEhVOWFSRG1Ga2ZwNVZSKzhaRzVJS25jc1JFM1FK?=
 =?utf-8?B?ZmZkQ05TUURJK0dGVHdkOXA3aVVjY2xHdHdkZXU5Q1MvQmFEVWFHQ1YySmw2?=
 =?utf-8?B?eWtzc2p6Wlh1NlhDaWl0dXQxakU3Qk9TN0ZFbHpYRVRzWDV5ai9ZWiswQWtk?=
 =?utf-8?B?SWVWSmFQUEVkaTJmTkZEOXBrUTNOeXR5WHdUWnZZOVRTak53TG1RWTZHYkNB?=
 =?utf-8?B?VTU3UHM3OGJWR1FTL2hROHlpb3ZSem9BTnJ1c05hK3ZSK0lDZTNOamxxUHFT?=
 =?utf-8?B?U1JmZVlCdDlLZUdHdVYvb2JZYllGeWtrSEJlQWFWbHZJQmNjYUJhQTZxOHFi?=
 =?utf-8?B?cXl4MlFJMGhPSGROTDc4ejV3WS9UUGVtNUxZc2V2QjlIaHRTb2FXdURBQXV6?=
 =?utf-8?B?MXBCQXNxamhoR2g2UTFDVFNzNjlzRy9EUnRqOGxYS2ZUTlVMRnptRTk3R2pw?=
 =?utf-8?B?RkgxNkhjR3VZeW8wdi9VU3BqMHgxM2Z2eGtCMTZCbm1UWm9SMVhaSjIzUitJ?=
 =?utf-8?B?YTJ2TkhtV3JXUERpSlp5ZDlKSGloRWM2Q3ZwSXAzVSthcDcraXpyVGpnOFM1?=
 =?utf-8?B?cHRsamJVTlpBMEhRanExQnI4MGNnRS9VdzJQcXRIeVlWSXE0YlhXZGYvelhQ?=
 =?utf-8?B?elYyRFlFNXZHbnNuN04yL0ZTWG1mYkdUcHFuYW9MZjd2Uy83bnk2aWsyU2Nx?=
 =?utf-8?B?cTBHMGZwWnF0Qk9CQ3NBL3pzVHlZSVk2VllZQjl3S2swYjB0OGpIOHBhM0Rq?=
 =?utf-8?B?Mkd3MnZacncrbmJQNWZjU2ZNRzIvWHl0YkpNcUFMNGJmWUxBQkVMQUJUdWNQ?=
 =?utf-8?B?a3JDcmpGU2RGRGlXcGtBT0hLMnYzYXpwcHVNOFVKNDRYQkVEdWZpUG9BUDBX?=
 =?utf-8?B?ZVo1V3VjeU1ZQ0t1Tk9rZ2ZaUUx1eitUNWQyOXlqNmdabUR5NGtZeG1odDBp?=
 =?utf-8?B?MHB5ejhVL3FxbkNERFpDZnEzUnhwMGNLRlVNY083OUJQeERkZlZzRTlma3Zu?=
 =?utf-8?B?REdPRkQxS3g0YklkN3dCcHA1VmtaWTNJaU5hcXZoeGRCVnBQTlJNYXBQVHlS?=
 =?utf-8?B?amZhNVZZNXd4Q2JLMy85Y20ybjc2aXp6MU5Nc3hlRHV1RWdmSW84TndJUFZz?=
 =?utf-8?B?Qkc4K2pkMDVoOHZDYWJjVzI0ZW1RMGVJUUEwN3dVRmM4QXl2UUdHQllEbzky?=
 =?utf-8?B?YzJ5djFlRFlEZDI4Nk1senBJUCtVdDNXL2I4ckpROVU1Mnl5Q0M5M2pZT2dT?=
 =?utf-8?B?Tm5GZ2N0cGJMbEZCSDRNWVRsL1o3VnlQY0doMEpwaDk5RkpaYml5R3NlbGdI?=
 =?utf-8?B?Z1VFcmplTUR3WFAwMkRCcmNPSkwvUmhnK2IvM2swR1o3Y1Nsd3cvSHRLSFJN?=
 =?utf-8?B?a3QyUkxHRVlSTmI0Nk9tYkdXTFlkZW9PK0ZJU1hTYmdVNGExRDNLVVU4aktF?=
 =?utf-8?B?UzI3T1FpTVVjMEtLZHV0R1VYbk9YcE52bkFqcG5Md0UvUC9adHRWZ29Kb0ZW?=
 =?utf-8?B?TkNUK2VOQ05iNk8rTmZlVjlCbVYwc2YwQ1E4MVYvU3l0VFN1UytCUDhxZE4r?=
 =?utf-8?B?VllFOXU0T29PN3BLTmhJa21TK1hMeHhWcDM0NDNWQTZkaUNFcDZzQjM1ek8y?=
 =?utf-8?B?OWFFcVBaU202dDkvS0JnOGk1bHI5bzYyZzhDUVhNbUtkOW9qT2JSUmVOb2tG?=
 =?utf-8?B?blNURGNGRlg2N29nSXRBMDVGcm52Tm5mN0NjWk91RUs3Lyt2aE1xN2I0WEtC?=
 =?utf-8?B?QlNWVHJRM1VkQ3cxd3lCMWkvODJNZUx5ODhETUlOR2dudnVwU3cxRjk5KytP?=
 =?utf-8?B?S1J5czNOdXpZVTFBcGFoeFEweDV5c0xlM2VCM0d2d1dUZy85R3NCWTFITytp?=
 =?utf-8?B?OEF5Y1ZWem1CMDJPODhoY0hoZkpsaVRVSk56U3B4TVp2dUM0NGFFanpkN2Uv?=
 =?utf-8?Q?j9jRxhP1Vc2LTh/dql0+Mku+W?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 913b0e73-9d4a-480d-9298-08dd760d9a14
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:51:34.9618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P8AE2vEpby+mbjoIk8nfaOBf58IET3EClHbSxvwli/RBIYRKXIz62qIXuo2OoWJD6FCZcQ1awx67CkpnmH4BWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7452
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_125139_916441_E92B7CA5 
X-CRM114-Status: GOOD (  16.90  )
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

Document the use of (msi|iommu)-map for PCI Endpoint (EP) controllers,
which can use MSI as a doorbell mechanism. Each EP controller can support
up to 8 physical functions and 65,536 virtual functions.

Define how to construct device IDs using function bits [2:0] and virtual
function index bits [31:3], enabling (msi|iommu)-map to associate each
child device with a specific (msi|iommu)-specifier.

The EP cannot rely on PCI Requester ID (RID) because the RID is determined
by the PCI topology of the host system. Since the EP may be connected to
different PCI hosts, the RID can vary between systems and is therefore not
a reliable identifier.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v16 to v17
- new patch
---
 Documentation/devicetree/bindings/pci/pci-ep.yaml | 67 +++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/pci-ep.yaml b/Documentation/devicetree/bindings/pci/pci-ep.yaml
index f75000e3093db..a1a5b9b8ef859 100644
--- a/Documentation/devicetree/bindings/pci/pci-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/pci-ep.yaml
@@ -53,6 +53,73 @@ properties:
       must be unique.
     $ref: /schemas/types.yaml#/definitions/uint32
 
+  msi-map:
+    description: |
+      Maps a Device ID to an MSI and associated MSI specifier data.
+
+      A PCI Endpoint (EP) can use MSI as a doorbell function. This is achieved by
+      mapping the MSI controller's address into PCI BAR<n>. The PCI Root Complex
+      can write to this BAR<n>, triggering the EP to generate IRQ. This notifies
+      the EP-side driver of an event, eliminating the need for the driver to
+      continuously poll for status changes.
+
+      However, the EP cannot rely on Requester ID (RID) because the RID is
+      determined by the PCI topology of the host system. Since the EP may be
+      connected to different PCI hosts, the RID can vary between systems and is
+      therefore not a reliable identifier.
+
+      Each EP can support up to 8 physical functions and up to 65,536 virtual
+      functions. To uniquely identify each child device, a device ID is defined
+      as
+         - Bits [2:0] for the function number (func)
+         - Bits [18:3] for the virtual function index (vfunc)
+
+      The resulting device ID is computed as:
+
+        (func & 0x7) | (vfunc << 3)
+
+      The property is an arbitrary number of tuples of
+      (device-id-base, msi, msi-base,length).
+
+      Any Device ID id in the interval [id-base, id-base + length) is
+      associated with the listed MSI, with the MSI specifier
+      (id - id-base + msi-base).
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: The Device ID base matched by the entry
+          maximum: 0x7ffff
+        - description: phandle to msi-controller node
+        - description: (optional) The msi-specifier produced for the first
+            Device ID matched by the entry. Currently, msi-specifier is 0 or
+            1 cells.
+        - description: The length of consecutive Device IDs following the
+            Device ID base
+          maximum: 0x80000
+
+  msi-map-mask:
+    description: A mask to be applied to each Device ID prior to being
+      mapped to an msi-specifier per the msi-map property.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  iommu-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    items:
+      items:
+        - description: Device ID (see msi-map) base
+          maximum: 0x7ffff
+        - description: phandle to IOMMU
+        - description: IOMMU specifier base (currently always 1 cell)
+        - description: Number of Device IDs
+          maximum: 0x80000
+
+  iommu-map-mask:
+    description:
+      A mask to be applied to each Device ID prior to being mapped to an
+      IOMMU specifier per the iommu-map property.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 0xffff
+
 required:
   - compatible
 

-- 
2.34.1


