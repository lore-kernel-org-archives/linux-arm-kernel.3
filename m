Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D2E1C369A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 21:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbXHpTIvY3lK/PUhp27uVmw/pyQFw3cH2yjbLrE9G6w=; b=ObsiTh/ThLxLvLkDIkkC6ygWz8
	sz2xXllBuozLxYFlzEvk9D10pN0mB7Ro5FCfiK+K1aE/J2fxARFQzXXbA9ckveMzyasSs1nlrDtm0
	Xr6mPyvRXmSBiGYu6QRnoXOUYuETJK9wxSdfIXMMwFfjFVTzUxWH6AjewWgZPtfXfFcXWCRcUli+z
	AZvygJ9g6zJeS7c7ONOsnaF4BkG+aHn33oznOA499NUmknzX/j5eqlDN74hGhOjGbifFRtT7coi1+
	gYWpYQ1o2gLJi0enwoY7X1VCZ7R9OyTVNx1Ig4bskQLPqHix6uN4dix/cqqYvM5Ya0oBmf3/PrsPk
	okzfr7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uKB-000000026YZ-1JKZ;
	Mon, 07 Apr 2025 21:48:11 +0000
Received: from mail-db8eur05on20630.outbound.protection.outlook.com ([2a01:111:f403:2614::630] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1sWE-00000001saN-3S6a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 19:52:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eld8ufndr6/CzTXVFfTkdU+WInJQqwnCa+Ts+xTLMIvTSVXMjntnFAe/oQf1++2LiHrw7FqtnfzFlB7iZDLC3CGdZCSKevDKLWXdbzA4tJImymv89Aa3IGEiz+Vy6rTckDUzTPOlYOjGvXKn3QDRGVrZyie1CMPrJLHMsVeudOQnHZVfNZyaXz992lGndC457uTiw2YHUgScJCSjrmn2+eWK3T32LFvioHkvj7DTTDTdCeYxo/aeazhFoHOUOGVLySsozsUSkNVICtRdN3cmBolw7nn0DbueaAyBsqKw8oEeG6VJeflI0kHFWxcawZ9lQ9HLa79954X+RkOvqqtf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MbXHpTIvY3lK/PUhp27uVmw/pyQFw3cH2yjbLrE9G6w=;
 b=bYqM19LYN8j3XwxpVmO4vsgZa1fjj80duU4Hq/qWPioF0Rhz0MqbyFYxyaOQ/+xiKLrSJHhDkH4ov+abrVzL+CUQxvPURSmM5i4yXWfc4cD1mgE9Th+n6u5BzaBX9SIHsJcoO3TKrT4NXNes0dzA0e19XbANb6ISkLg0gYTsgOEoWNzBLft9DIFpzURTqaCdGGWAX8pXuPK+Wx2gq2kHbcAKVpDAVIoMU/fuAmCbT6/UBw8jWtF/nlYPbWgp9FASZ5pqaKG8UILkwdJuvcuF9oaip2+9moe5fa8toskA2Xq2ZnDIT/fattHr/Pw71vwDpgQUUfB7KsFaOheh+szUyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MbXHpTIvY3lK/PUhp27uVmw/pyQFw3cH2yjbLrE9G6w=;
 b=ZP2Wpigx9Tzn2QK77vaI66xLPTSp/Z8dUZJHanKd8gvZ/E6/Lc43H2Bjz7iCCUMHaL+/iZDJZ9uiu3KhmeGZG4RbRJYnvaobuLMscpl2uFBpntccTJhI3T7zuHO2s+j7xYX+g0Ib6jK+jglNJYeXUUmZ98hjov19NEN8Gwt325o4dvxNPhFvLm+XCpcxQ+2TEEKfh1OhUdgGPExyhRI3CtsViSKBT5PKPKg0azekuTOSlm8dexrV4GAeFzo651k84tPIeE+Wp0RDqsk+QUnZqE60tZyfSNSZeP2p53px1sn/fGIP1JjsSQlOqDRch7B70lyulE/SekVZ9a2SN7VgdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7452.eurprd04.prod.outlook.com (2603:10a6:102:80::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 19:52:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 19:52:28 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 07 Apr 2025 15:51:04 -0400
Subject: [PATCH v17 14/15] pci: imx6: Add LUT setting for MSI/IOMMU in
 Endpoint mode
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-ep-msi-v17-14-633ab45a31d0@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744055468; l=1486;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=y13NGoBJeE1mUHUBweMBxtJI2C8OON0QvH2vvgiDgJs=;
 b=Aw+d+Gamxsf/Lhl1B/XKnOYRNdM+fzI+azX0X92agdxDe4V7Xm8Bpd3gaeyVSO2unvLzg5X9M
 o9vQwdsfpisCcNjR0TmIhfpw1BVlBKkjJgpVyl9DipBU1gWlTLRrGjf
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AS4P189CA0041.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7452:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbd6d77-a6ac-4e0a-93c6-08dd760db9cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0pzZ0xWRHE3cXd6TjByVmladWV6OUlsNGVvTzFZeWY4NXdkMXlNYVYyS0RT?=
 =?utf-8?B?T2g1N0NuN1c4YkZLb01vbnRTeGhvd0h6RXVOOWZwWGZuazV1YlpreEhVQUc4?=
 =?utf-8?B?NEhqdWRFK2FkRUp1SUR6RXdjcC9zMWpHaENzSjFUTzFlbDJPYUZPQTZMWWVZ?=
 =?utf-8?B?Z2QzVHlzME1YQ2V5bElONDR0WGViNlp4dU5WZTRaSEd5UVMvZE9SMmIxUkVL?=
 =?utf-8?B?di9jZHpRN2JUelhhQ2ZPVHNKalNZN2JHL0hwRCtwYTdEQ2tjOElHRWJ1UGJs?=
 =?utf-8?B?QkE4djhhYzZOR3hHMkt3SmNwRmNzQ0VTRDU5bWJMUUJBOVh5blNoa2VsZElM?=
 =?utf-8?B?eElaejNGaE9NNzJWY0VSOXBvSm9QSmpGTEZaZmFlY0xONDMwOFhwS3hlc0E1?=
 =?utf-8?B?NEdMRzcyY0lvQjZCV3ZGY255NUlIMkFRVXRuQ3ZPOXpRZ0dMdGtJakxscGx4?=
 =?utf-8?B?RVhkU3dPZXRzc2NaRDdhazRtYzdCdjQ3MlVhL1JjeXNNdEJLOVMya1RMQUdJ?=
 =?utf-8?B?UlpYcE15aFJxcGZrTnhuMGlrUnpjYVhMYnJzN1Q5RXZDc0dtdDNFSzVBTkNB?=
 =?utf-8?B?bkZlQkZVeG5vZmU4YjdIWVRScXFBOGtWeTRkaWM0K3JReWNqbHJPMDRpQU9i?=
 =?utf-8?B?Qm1mZ0FTVStBYjIxNUZ6aTFkcVRxZEF5Z0dRZ2tvTDBZNHlGZ1Jna3ZzaWh0?=
 =?utf-8?B?WFpKVTVONHQ4OFNLUkN5bUJNRWYwcTZnR3ZySVlxTUs3L2g2UUVnVyt4Qmt1?=
 =?utf-8?B?N09NYUw4a2djall5OGV1NU5aOVBjVFBGbmwxTjhramlVSFl4dkNkNUZ5d0F2?=
 =?utf-8?B?STJNNk56S1R2QnNIbVlTR1J4Z3I2cG42aFIvckx4Q2psbGhQN3pLczdRV01R?=
 =?utf-8?B?Z3hZNm1QVkMvd1draUJIN0lZck1WTzMxMXg3cHlPN01HUGt4OXhsemJoUUIz?=
 =?utf-8?B?bUppclU3M2tLbmtLZHd4d3pPRjVmMGlVelpBbUFrWUs4YU44TzVETGdvV0I3?=
 =?utf-8?B?Rk9TSjRRcHh5ZmdBUWZqcHJ0aVBTeVY4UVdubFlzcXR6cURYdnpBeEsyVmpT?=
 =?utf-8?B?ZmRNQ0JETnQ5Q3daTmg1cVJ6bXllNVhQMFpJMk5pTGNWMkxkTnVnYmZXMFE3?=
 =?utf-8?B?elYxb1JRTE0yZm5kRzNPZkFNbHBTdXR5TGFOblpOVmVNcXZtOEFEWmo0b3Jo?=
 =?utf-8?B?WUd6dlloTjdkN1dxMlIrRzNJaTNYNko0YjRvTWhYSUVhSDRwYjlkK3pMVHRO?=
 =?utf-8?B?Sk9PSVpGRGpBK1BoNUsrSG9pSnBkcW45azk2THFBU3dlYStWSHFhU0kvSXgz?=
 =?utf-8?B?elJSN0dodktaT0tNcGJDdW1TMmVYak41eXpNUndlbVd2eVFySGt4RGVDa1Vr?=
 =?utf-8?B?amZVNDcrR0pQZVdUN21WSmhVTXY1NkJGZDVhbHQzc2kyV0NNaG44azZDbUJQ?=
 =?utf-8?B?VHFzQXRMN3dKNmJwNHVXOGk3TDRsUU9WVWFxNzlINjM3UUFxVXQzSGVPQ01U?=
 =?utf-8?B?N3ZEK1hVdzlpRTFBKzJrMVRJVGtGbTltVzBqR0hOT1BCREJId3N2bnJqaUZC?=
 =?utf-8?B?bzV4OUxyb1EzYWtiR29OTWF3RklidXZlS2JKV21TMk1yYWErQ25Bdk05L21R?=
 =?utf-8?B?YkQ3YVdpWE05V090cGw0VXhHVXZPNjZBMlRUVGhrNTJwSW9nbnN6aVRqeWx1?=
 =?utf-8?B?QjJLelIrc2N4Wk5oMGhvVGN4cXAyZ1pmdlRSNUt5K0lHc3RZazZvbkpJOHh3?=
 =?utf-8?B?RzZhZlpNb1B1TFk4SHdPNTBLc2ZjMkF0b2pmUTdaWlNzcnZtT0lpT2FVTnF6?=
 =?utf-8?B?bGJscEZJTlJSWng5SFdlbnJXZnp0Y2tSQVp3cDkycVRlRkdMSWd2WnYyT0JQ?=
 =?utf-8?B?cnVZNWt4Ny9oWVBsVTd2ZGRua2xzZGFSVkVTeTl2a2FCUmhTOVlzTllNTzdG?=
 =?utf-8?B?ZVEwS2NpOEtZQW93VnBNZjhsWk5iTi9BaHc4SG1zUkUvbTdPT0s5U0g1K1Fv?=
 =?utf-8?B?dG03T3dJS0tRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnlvY05oUmd6NnF0T1I0aDUxZVNpNkJ5VTBjQmxSVXdhV1J3YzZBN0JFQXlI?=
 =?utf-8?B?dHY2cVFWd1phQXdYUjBaWDBKcEIyTGd0WnVza3F0Qmh5eG80OEJlMUhMbENF?=
 =?utf-8?B?OE5DSExleWI0TWZubGcvM3J5VElsdW9EL2wzbEpwelkxc3d1Z2dZeEtkTitv?=
 =?utf-8?B?dlFmRUlyYzJlTk95WFlTZzNhMjJFdGNNa1BJMGVDZWNzREorOHZBbkJ1b3Ix?=
 =?utf-8?B?am1nU1k0NE5mUlhnamZ0SVp3VG5HaGJhdk5xTjl4RWt3UlBSNTdIcjRhL0o2?=
 =?utf-8?B?ZUIzWlJ0cCthS3dJekF1Nko4VjlsajBwYmJSdWhET1ZUVjRpeWhDS1Z4RWNY?=
 =?utf-8?B?RG1XeXZFbjVVVmJlVDBXcUQ2YldnRzM3ZlJlb3Nza28yQ09qK1dWNlhiZ0dp?=
 =?utf-8?B?dnJzT3FKY1VMRHNjR0J3UTdhV2I0ek9nRGVtbjhCMWxNbElnbWM0c3YyTkFZ?=
 =?utf-8?B?Rmh4WVQ3UjBhc3ZDSllrRzg2b2QvdWxOcUYrY3NzQzFxQ1JnY2ZsMk0wYXE1?=
 =?utf-8?B?ZEd5WmRHVVI4MXZGY1o3bXdUNGlIOXBvSWJ4cXFndi8reFdrb0h3N1BGckwr?=
 =?utf-8?B?aFpyYnMvMXpCN29JRkZEWnVoSFltT2g2clRSUWJSS2NXQWlua21xZVN5R3Jn?=
 =?utf-8?B?dk56VVpleXdkQ0ZyT2o5SGZIRENQQU9QWm9MNmRoV0Q2TU9iTUF5K1JaN1RJ?=
 =?utf-8?B?L0hwU0Z5dDV6ajdiT2JHc0xpZ2w5Rm92RzB5YlREYjIzNDZwWWxrYTZCKzdw?=
 =?utf-8?B?akdhektCVEFZaG5jQkd2V3R6S1JwM0ZMYlF0UVQwY1hKeTlSOUU2MS9FTVMv?=
 =?utf-8?B?UFpXY21YUUV3MDlsYnRLRk1OWldNZ0Y1ZWRNY1lYcVFBTzMyeGNvVXBtN2RK?=
 =?utf-8?B?RlRZZmRRL2FOc1lFaFB2ZEorY0c0dmJiVEM2WmI0VWpXekVyWjFtYWs2ZUpF?=
 =?utf-8?B?Z205WCtkbmhRQ3lnbFlaLzh3R0JKMWZ0WEdvSVYyRUJaaUdTdjhkUHQybFBY?=
 =?utf-8?B?ckFlZHdlbGw4YXN4Wk1JNUxHTGxTRCttQVFlajFoNnZFTGg3MERIVFBHZCtZ?=
 =?utf-8?B?SUREMTZCR29rYU5NMVhEU0xIOXRtdTgvdHN4ZktHMVh6UXdvVnc2MkNwSUQr?=
 =?utf-8?B?VlFpUld0STE5QVkxMVNKZXlNajB0VXlBdW1wZk9aekdpQXZYTWd5Ykd3TTRP?=
 =?utf-8?B?b2VYV08vcnY0T29lVGJQN05rTHp2ZFVNWXY1emRhaEkxVWJiZTZWdUZScElz?=
 =?utf-8?B?LzFQU3dKWkV0MVJhL2x6R0l1VTQzY2tUZmhPYzhlbmxZeWVhZ1o1NDlTdDd5?=
 =?utf-8?B?VjJqZVpZM2NXSWh1bkppTEtjSHl0WGVRdGpHcDk1ZVIxQWxnSkhCZ3l2Ui92?=
 =?utf-8?B?N3BYV2VyTUdmVXI1Q0lsMXhvSitvV2N2TG5lTXcrQmxSbkdkWkk0bEtYei95?=
 =?utf-8?B?bGJ5K0JqRWhXUGh1L2NaUWh5dnBsRFlnN0grd2pNWHRXQWpJUFlkQThYWUpT?=
 =?utf-8?B?bHpqcG1oOWNFODhrQkorUTU0OEZzbFZLLzY0VHZta21VbjN3cVlXSnE3ZGpo?=
 =?utf-8?B?aVArdWdKM0lGK1FtWE5RVEdua2tVZDJKZEN4K3NlZkxENnU0WG5VU2FVSkd2?=
 =?utf-8?B?dFo3cHVwNGFsMVRnT1UzcXFsNnBHUDI4d1BJYkNETm8wb2JBN283N24rbkoz?=
 =?utf-8?B?U01sdnpmOFo3N2hwQjhlNnF2SFFuSkNQaEd5VTQ1MGRYaW9EaXVXU1B2R29j?=
 =?utf-8?B?RE0zbEgzSXQ1YWZaU3htTStlUFZDNUNtdVFhUkJwNDRMeVJRMmI2ZURFWGhU?=
 =?utf-8?B?UW1vZ3IvNWt0VnNqUDRqS2wwR3NBayt2R3RkME9WdnNXcXJ4QWtrYzFld2h6?=
 =?utf-8?B?TEpLQ3JocGNPVmxBUXdZWGdiOElKbHl5cjZqN2wvYnNjb2REaFg5TUV1TlBS?=
 =?utf-8?B?WUl5WWxaZGE2MmxYbEl3LzVVcEdxaXZLKy9mWFJkcEFHclFsVi9CZTl0NUpi?=
 =?utf-8?B?MWY1ODVmc2k1aWpNSW5ySUJ4RDZjMHp4NU5FZmhUVGNBLzVzeHJvc21Lb1Z4?=
 =?utf-8?B?b1NMbzNZWDA0RUlYRE8xSnNiS2tOMlB3d0VOUTVGR0d6M2hIWWtGSjBwaStS?=
 =?utf-8?Q?+YQNbOCtJf4+PzmCDF6y7Scaj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbd6d77-a6ac-4e0a-93c6-08dd760db9cd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 19:52:28.1336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RSTKlSmeQW9FCavh73R7WUlFx1lHJ9cX4/iMnxr6NQ+3AgCzaKPB3XJaBbi8NPhWt1WKRSosI3cAGcAnTEBNwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7452
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_125230_866482_C8200C7D 
X-CRM114-Status: GOOD (  15.14  )
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

Support only one physical function, so call imx_pcie_add_lut_by_rid(0)
to add a single LUT entry when operating in EP mode.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v14 to v16
- none

change from v13 to v14
- new patch
---
 drivers/pci/controller/dwc/pci-imx6.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index d1b1365e7469e..a6e4630fcf530 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -992,7 +992,10 @@ static int imx_pcie_add_lut(struct imx_pcie *imx_pcie, u16 rid, u8 sid)
 	data1 |= IMX95_PE0_LUT_VLD;
 	regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1, data1);
 
-	data2 = IMX95_PE0_LUT_MASK; /* Match all bits of RID */
+	if (imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE)
+		data2 = 0x7; /* EP side's RID from RC, only 'D' is meansful */
+	else
+		data2 = IMX95_PE0_LUT_MASK; /* Match all bits of RID */
 	data2 |= FIELD_PREP(IMX95_PE0_LUT_REQID, rid);
 	regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2, data2);
 
@@ -1622,6 +1625,9 @@ static int imx_pcie_probe(struct platform_device *pdev)
 		ret = imx_add_pcie_ep(imx_pcie, pdev);
 		if (ret < 0)
 			return ret;
+
+		/* Only support one physical function */
+		imx_pcie_add_lut_by_rid(imx_pcie, 0);
 	} else {
 		pci->pp.use_atu_msg = true;
 		ret = dw_pcie_host_init(&pci->pp);

-- 
2.34.1


