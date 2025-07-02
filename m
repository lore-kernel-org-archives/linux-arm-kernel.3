Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600F8C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 15:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KzJ8h3K17CuD0ipoWyXa/s4C51oo0tVwa7hDJOfoZto=; b=thAo2rJZZhYrfvnF4RRDU5t8/B
	9OxVuX0y/vSWqLKReCS108xPrhZ6XNgOUwfGOahcX7UcezqiU2EEVRAwLbeRpbPuthEI7WfeHrk7P
	d0k/Z5dE/iUXhmCYAJBfEXaIIrh6RNqE15telyJaLaJPKywIE0FS9ESqrRgwTfBOOzvxYmfrZ0WzB
	xmzpqlj5jhZK9xJ6k47IxlpAOr7MwSmg7i+I1U0QCK6OH8EWgs1EcD35pyBtsO/eBUC2hvCrCMLDA
	YwAxH1V9Twm2QJqpdlnf6W0m3PICdhosbS3WbQdkO/qAWVylf/p3EF6zC9XZ3JYwvE3zdGRRrRjSI
	f8Af3oSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzbc-00000008ptR-2D7k;
	Wed, 02 Jul 2025 15:42:40 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyn5-00000008g6i-261G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 14:50:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeJVR7iL1sHwon0ZA35vFyzVvtgEfV78pmeKu9poVKR2l3sEFwZvIdxOFtoUAWs122Ws8qgvrh8Rypfgl5SFNA6fJyR08KDHdGg5aMGEq1fkeSkxxl/1q/M8rd3nw2D0lkl8WiYT38dVPJapfcSrG1Yw1FbYqhsI0PzY1wBmHQCAREjHxU4wfDkaIpfynYqqqWD/6BT4r4BmpK+1g+7ICbUv/+Dax20SzU4k0vaYfSEueyttqzNIn6NlCbhoBoa35lxVCizfoxod9L36EPJdQXnu+F9srvV94jj+9JbX1eN74F3SIRtZuoFdvDYwtUOs77NPISPy99apt564r8XtRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzJ8h3K17CuD0ipoWyXa/s4C51oo0tVwa7hDJOfoZto=;
 b=EzTtM4W27+TxprK2D4SLdVBdl2Y8gGat3okunnYG5BrJNzwKLB/8yWc3c2TxnuTBgtlAWOvY7ecpkQHYs71wicUzT1dApwQP/rVVysWJKqZh0Lcj6xvflAKP71a903qfj79mAs4+BzfLf+HNNPmJJ2Nl004gQMTl+xTNx/A0zUuGT1iRDqwNohBrgxL3ZEnnbwyOSlrRb81T30Ti+FCsVzOGzGUh9z711vErJgypT1D3sALbcWvzBNIY2r2noouQi7E2Q7OjU62fVbCi8z51IWkvEbfUmlYjD0wuXFprYWMGuJAfM1Mhg0fv2ito6uGGPYxtR2EOxVhnDBm9KKYvJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzJ8h3K17CuD0ipoWyXa/s4C51oo0tVwa7hDJOfoZto=;
 b=ddz1/QPmhxpYnznVCAwMbMYyyMV5U/DX+EAyx20c5C+IdAbtEigTijKm7udcdiU0EW45B34Te0t7qlMhM7BII1ONDA023rIJ6z3GPqrpARWMQMGxgPns3Q52tJYRR7ZB4Q00Vy6NAlFOv0x/URoNkC4Q2JvMbAsS39vwjsOAdtBkd8UPlBw5770/4AZaq5naI1tlt+/RH+BsYZIWlqaj36talaNBaHBVG3lTDhe2uNc6B01ljHdQyPzprCa1kO7lr0A7EqbN4l7s7bOIe6who6oM1q5sQ7CfFEgpA5+w7D1Kmlbbhr3lwjfTn+RwEfFlrsJlhGHEHadmLR4d5fgqpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB9711.eurprd04.prod.outlook.com (2603:10a6:102:267::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 14:50:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Wed, 2 Jul 2025
 14:50:21 +0000
Date: Wed, 2 Jul 2025 10:50:14 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org,
	jdmason@kudzu.us, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v19 09/10] pci: imx6: Add LUT setting for MSI/IOMMU in
 Endpoint mode
Message-ID: <aGVHG+GTANAx7zzp@lizhi-Precision-Tower-5810>
References: <20250609-ep-msi-v19-0-77362eaa48fa@nxp.com>
 <20250609-ep-msi-v19-9-77362eaa48fa@nxp.com>
 <tovqcf6mjrajaie26t7gvl6uuoniqyturogzyaef6bksjm2nux@ggsmbgudgf7n>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tovqcf6mjrajaie26t7gvl6uuoniqyturogzyaef6bksjm2nux@ggsmbgudgf7n>
X-ClientProxiedBy: AS4P191CA0014.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB9711:EE_
X-MS-Office365-Filtering-Correlation-Id: ef6de253-8c50-4b17-2c49-08ddb977c514
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkU2c0xxNTNKeHRlN1pVa1krdVpsbkdiOEVqNWhPWmlNZXV4WWtTc21aLzFY?=
 =?utf-8?B?WG5DeFU5cE5RSE92TmU5ajR0bm1Ia05hUXRxS3lYTTcySzNlSnU4aFVQZ0Jj?=
 =?utf-8?B?QlR0amo4bC9veE5ueTB1bS8yRUNiUTVxbngzM2o4YjRNK29Qb0xydGxidXFn?=
 =?utf-8?B?MURYbFhvOE9NdWtUTUZVMzlTenhtRkdmKzkxTUs4MU00ODZkSEZnMXFXOElq?=
 =?utf-8?B?ZmljV2NlTGRzWUhnUEo5SmEwVmJ1QzdOWWNCVXNwbStGUTc4d05KbTNieVFz?=
 =?utf-8?B?cEg4YzdVZVhPYmJlOUNEbm9UZkNuYm5Lcjk5djNPSjZDRnV3bnpldDFESGxL?=
 =?utf-8?B?SVlzbGNrT0tPb1pnV1FSSXVqR01NL240cjBuTHlSK3IxYnAya2hTNkNHdGU0?=
 =?utf-8?B?OXhTeGtJV1E3SWJZZHNKdUwrUmVLb3RvVGptT3Vmd3hBcHdNUEx1ZGI3ckpj?=
 =?utf-8?B?Mlc2eU10ZDE3a3JnZzBNN0t2YmpTU0dnenROR2VRTlMzdU1iamp2SmJPanEr?=
 =?utf-8?B?cUFrZTI2NVZiTm9ENEFNQUFhSUJNSGhaTU85MTVrRitWMDVkRDAzeXpYdzFT?=
 =?utf-8?B?Y1d2VGQrWjE0M3gvUm5KZCtGb0xkTzNwTnEzdUg1MU51RVFtNjV0c0toZTlC?=
 =?utf-8?B?SlkyOUMzZENwN1hIcjhtOHA3SnhIeWZ0QnFPZlc5dE1icEU4YUZuWEJ2Nk1O?=
 =?utf-8?B?dDBFTmNJbHRSMk1IQitIN0dwUi96TTNHYVR6QVN2bGFPUFM5eE5KV3NsUnc2?=
 =?utf-8?B?TTZlZW43U1NsTVVtRzFWM2FiQytCKzB3TzI5ZCtrVzVZdFVvbFdxNmVncFND?=
 =?utf-8?B?Q1FvbjBmSlhSMW96QjJHak0xL0JSVDMyZ3hVWkk3YVBrNFoyNktFdmFVbUxS?=
 =?utf-8?B?dUNSRHVGTStVcVVNTUJHanR0OHVJNXZMVDBZU0xvaXc2RDBzRXVRTmxRVFlh?=
 =?utf-8?B?eW9rSGRCWDVLQWs3TjZkYjVFTXJIa0NZNnpraGluWmczOFRjSzJIb1JUWlpS?=
 =?utf-8?B?NmM3UENQMDFlZTBhSnMzSmViTjlnRG9iTzZpTG1vOEtNZ09STlVyOFlFRkVq?=
 =?utf-8?B?WWF3NGI3eXRuaGQ0cUhjdzlOdGFPVnZIQjZNNVk0dXNjbUtJd1JleWdlc3hv?=
 =?utf-8?B?eEp2M2RueTJTRlJ1Si9QL3RwdnRSMlQ3UGJrNzVWVkR1SCsrR2FjMU91K0JV?=
 =?utf-8?B?Q2NyaSt3cmYxckMwWDAzV1d1WEF1SmdET0grTC80Uno0STBCTWVZOGFic3Vs?=
 =?utf-8?B?cXY2QlFTVlZROEtBZEEzSzN1OXE2aXo1L25aWGdXOXRHbDEvZ25SUmhLTlVz?=
 =?utf-8?B?aFVoUnZhc01BUG5iU09lZ0gyK1JpNTYxeTVtMmg0NGZoNjZIcFFmQy9FUEVL?=
 =?utf-8?B?TThUMFdCaWVpM3c0VE9iamdyQ0hFcUswZjdQbHBOb052NzZzdXVSTENuU3Nq?=
 =?utf-8?B?TlNic1B1YmNmTTI1UjhEdTFzTkhJMEMrQ2xoUUsyTGQ5K3FvRHY0YkVTdkU4?=
 =?utf-8?B?cmM1anI0UlZSUkgrUUlPbGNBVXJHMS9KZ2hYcnNwZGdTc2xaVm1kNTJlVFM0?=
 =?utf-8?B?cXFNVUhnQnFEQkdzZXJWekh0M3lRcnh4alVxM3VlODFzSm4yRkJHU3JRQW5Z?=
 =?utf-8?B?OVlPTlhkaUJpbjlraHVyOGRJejV6dWwvWnowTm54VmVFeVBzeGdZREVVZHJI?=
 =?utf-8?B?YVZUU0JIM2hlbDQ2dnFtOE9ZQlZnbm0xNzdENjBrakhUWmR3NnZlRGk5OVhJ?=
 =?utf-8?B?Rk8xalFoeTZLWGRsOEl0WC9YSWlzWStDMHUxSzFFSmVJcmlOenVqVU9TcytQ?=
 =?utf-8?B?VEhkY3FRWWZnRDhrT2VxeUx3ZkU4ZHN1Y0tTbjZuMmo5Q1l2aFpKdmNoKytz?=
 =?utf-8?B?KzlhTTJoWTN2S0VuNnM3UENsOTBYSFlTNlJITUhiTTlNZVFnWXhZajN4eW5T?=
 =?utf-8?B?bXlyYktwTkU1NzFuZEVQTjhSNnUrSHZUbFpzNnJXQjZnYzNqSGxmOS9zRGFs?=
 =?utf-8?B?WUhpY09lUHpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2YzSWhDeU9iN0NYcDhSUklza3M3NHlLOUFmMXk4SkhYcEFpZWs4K1VIWGNx?=
 =?utf-8?B?VW9hRTlPYUZGdnNIOHdEMDhUeUlOS1UvakhJU3FrNWEvU2YzaUd4Z0ZWQnEy?=
 =?utf-8?B?d1ZCd01CL3FjWUl6dnVXbmxHOXNzQjZXa29LbThiNUhEL2hFVVpQL3hZem9G?=
 =?utf-8?B?bGFSSlpNcEJCakQxVkZ5cTkxbGxKaXFiTFRNR2ZEb3NDZWtTSmVzdVBTWCtx?=
 =?utf-8?B?b2xydVVaYklxQlNpMDE2S2VrZFhtMUFsVngzOU5ORHFicDZDUnVhVm9rckpY?=
 =?utf-8?B?bTlTWVMzZVNWU3QvMUs1NEIyQ1hSeUxML1FsMmFwR0o0YndPZUJQTTRiMVhR?=
 =?utf-8?B?TXZRNVdJRWRtMWVxVVo2eEt3Sjh3czIvaWx5RTl4VGlvaytDOXJGODhvLzdM?=
 =?utf-8?B?YzN6MzlwZExFaTc0TXcvM0UvbnpmNW5lKzlSM01JK0s4TFMzRGh3TmdWcXgw?=
 =?utf-8?B?Wk11a1hiaG5LTnYxL3grRVgxQzJtQkI2NUUxTDZyQnlrR1FiT1RtU1BQY1Fv?=
 =?utf-8?B?RDVxQ2FkZHFMaENBbXUwU3Y0RHlsYnUwN0dCVDdDV0VaZ0NrTnNKbDZscGNT?=
 =?utf-8?B?KzdyVzBSVWJoMkg0S3BybG5jV3VJeVJleG9rL2VJVUxwbWh0LzB3blZtV0x6?=
 =?utf-8?B?OGJZSHpWSVllK2t2RHpYOFkzWEFvQnB1djd6dWpxdm1LdVFEY1B3Y2t2T0c1?=
 =?utf-8?B?d2hyVmhGdEhTcmpIVjF3MElTNjB1VDNVTHVsQWZiVzdjVldRQTUvbWJYY1B1?=
 =?utf-8?B?a1J0aVZ6enZBaE1LZm5mUllPOXVmcGtoMTdSUVJETGdxQy9FWEg4T0puUzZI?=
 =?utf-8?B?TWF2ZGdJZ1ZSNE5VZTczN1JkSkZ3a0pueUdHc1A5QlZWT25wZGVQM2o4OTBp?=
 =?utf-8?B?clJxOUtMS0pEVVhUdzIzZWIxcDZxUUR1YzRCYVZZMXBSS0t6M1N4dUFHeUg5?=
 =?utf-8?B?QU1NZTEzL09yWUJON2g4T1Q2VkpDcGdpMVFlKzVvR3laeXhRc3hNcHU0SjJr?=
 =?utf-8?B?Nm11eG04LytJUWRlT3JqYlBlaUtHQmFsM1AzZlhEMXY3VDQ2WGlLMXJGMi9G?=
 =?utf-8?B?ai95bnJxSnowSFN4dVNpdUJCZmU0bU5nRG1rUWQ2WXdEcTF2eDI3T2d5bVU3?=
 =?utf-8?B?bXNyYWExbU5hUkdqQnNFUEt0ZG00bVkvN0l3U2lUcEo1VGVVdGlBZWhhQWVG?=
 =?utf-8?B?cDdiajlUc2grWDB4T0Fsakg3d2lBaGRmQ2pKTzd6RDJaUUtCUGZOSDBQYjN0?=
 =?utf-8?B?L3pBNEg5YlhiWVZSeHkzNnkxSkwxL0dYam5LNDI3d3hmcHF4dCtTTGhIRVRs?=
 =?utf-8?B?b3ViZ0V0R1h1Tms3Wk8vT1B3YkpBQXhweFN6ZXlORjhqNi81MXltMVNmRzBJ?=
 =?utf-8?B?eUZSWlNJRFlIdHhLTjBSWHpJQmJ6YW43c2Z2S3NZN2VwWVBiRy9mTTdLdDRH?=
 =?utf-8?B?N2RBRGNidFMrd2p3T1VmT0J5SWFmTmJ3T2xRQVpsV1VqWVpDRWlTZ0Z3U0VK?=
 =?utf-8?B?eGFhcnA0ZEhDMFAwQ3AxckxWUktiR0pMSHZkbUwxWmJhV010ZmtyOWhUL1I0?=
 =?utf-8?B?QnRPZS9kUjhjVnRBK1BnbkEwZHNKZTZKY0d0emdBWG5KeFFwcndySTc4bXM2?=
 =?utf-8?B?Z3ROM1IrVytveWhRL3h2UFo0aWVuZ3Rhd0cvL01UNUVEZWt6U2NrTzdZMHJ3?=
 =?utf-8?B?bTZkQm53bi9zQlA4SWpacHBpcUJEcnBWNEF6SzB6RzRWM3Rkcjh6blkwQ2g3?=
 =?utf-8?B?b3BLY1Q1MGZraW9rSWxZU1ZDSWJDTDhpZnJOdU9hWGtrU3lFUktnYjhVaDFZ?=
 =?utf-8?B?UzlCdEZkOUFyeWIrSXJqZ1RLemJqWDMyWmlvL3NMYmJBd2MwY1VwVWlmQmxs?=
 =?utf-8?B?eU1kU1hGeHM4VjdpbzB4YWFqdThxM1hFbThQNHFzeGh5TXhQTjVkZUhJR1gr?=
 =?utf-8?B?b0pTNE90UU13V2ZNUjloMkJLU204ODJ1M25DOTFKZ2lwbU1nUnJpbG90K08y?=
 =?utf-8?B?SHM0ZXhFWU8rRlR4S3ExOHdiQ3Jtb2w5Q0s4VzVrN0hXUGg4WHJJelVlWFJK?=
 =?utf-8?B?QjRaYkpoVFZzdm5namtkZG1SakdLS1crT1JMTDRYc2MyZHVsRzhWWHdzWVpx?=
 =?utf-8?Q?5fR7oub1q/H5P1KuDUuWSszMW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6de253-8c50-4b17-2c49-08ddb977c514
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 14:50:21.6782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +F8lm7O9Rr4R+4jpmY+UIRPKlLeTLayL9OW2wmgnNXsUW2HvxWB4KWYNtAKyeBDKiAApqZMcna403vBc+rKujQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_075027_542891_6F2791A1 
X-CRM114-Status: GOOD (  24.94  )
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

On Wed, Jul 02, 2025 at 06:52:01PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Jun 09, 2025 at 12:34:21PM GMT, Frank Li wrote:
> > Support only one physical function, so call imx_pcie_add_lut_by_rid(0)
> > to add a single LUT entry when operating in EP mode.
> >
>
> So previously LUT config was not present and endpoint mode continued to work?

Yes, LUT only use when enable msi and iommu. I will add such information
at next version.

Frank

> Please explain why this is necessary now.
>
> - Mani
>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change from v14 to v16
> > - none
> >
> > change from v13 to v14
> > - new patch
> > ---
> >  drivers/pci/controller/dwc/pci-imx6.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> > index 032b906c44dfa..3123bf49e209c 100644
> > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > @@ -1063,7 +1063,10 @@ static int imx_pcie_add_lut(struct imx_pcie *imx_pcie, u16 rid, u8 sid)
> >  	data1 |= IMX95_PE0_LUT_VLD;
> >  	regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1, data1);
> >
> > -	data2 = IMX95_PE0_LUT_MASK; /* Match all bits of RID */
> > +	if (imx_pcie->drvdata->mode == DW_PCIE_EP_TYPE)
> > +		data2 = 0x7; /* EP side's RID from RC, only 'D' is meansful */
> > +	else
> > +		data2 = IMX95_PE0_LUT_MASK; /* Match all bits of RID */
> >  	data2 |= FIELD_PREP(IMX95_PE0_LUT_REQID, rid);
> >  	regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA2, data2);
> >
> > @@ -1767,6 +1770,9 @@ static int imx_pcie_probe(struct platform_device *pdev)
> >  		ret = imx_add_pcie_ep(imx_pcie, pdev);
> >  		if (ret < 0)
> >  			return ret;
> > +
> > +		/* Only support one physical function */
> > +		imx_pcie_add_lut_by_rid(imx_pcie, 0);
> >  	} else {
> >  		pci->pp.use_atu_msg = true;
> >  		ret = dw_pcie_host_init(&pci->pp);
> >
> > --
> > 2.34.1
> >
>
> --
> மணிவண்ணன் சதாசிவம்

