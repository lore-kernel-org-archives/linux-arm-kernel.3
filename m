Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84665CD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 13:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqzVZrxxdtCqsHmvyiTNgkuocxgpVTecJYfn7f0FxYk=; b=HyiI1G6hGbdCY0NedGt23XrSgi
	wzHkm6N53G73o3anUQWQ+JcNYeyA69L36+yru2lEPfl7CrceJ6IcAvMHarOelULGa/AUKllJ0tf1b
	T9uMqHrn61L7xUGM5EMLHr0qhx1ZkvJygAf7lMmh5Lpd/wyTIW1sSzv/Geq2oflxWGkhQ2ZXJ8Fat
	tUApxLiNFKw8vZ+3Br4uws9VlzJtbQKBTaW01rcvKtL+PNoWTXVYSrK4EBDnpYufsXKA46736hDz8
	/xdc08YUdnD/8kNVIy0iifN4EIJK9LB0Zs/dYCHLySkyzYkwxl9XLJWXkwF7ytL4nFeH9hBnJ/iUi
	w3ws/4Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCoz-00000001MZg-2kew;
	Thu, 18 Jun 2026 13:30:17 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waCox-00000001MYm-08Wc;
	Thu, 18 Jun 2026 13:30:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFwWqutA8m2SHF7NJ7OpWOJpd5eI0HrVjeTjn7EBc8qgKAKsm8U040dlt7gcWaPErtDRebTsZKmmJ6rWPeKSESYZTXBxUBRRLNJmbqlhI1xlnRJCsdMPQcpmP1GX5sF5Uii7YryhxikzxEWL5ygY3TOQ5mFwYHpOFfoM8CtzOFpmYFt3o9ZpUCtAqsqIu9nVeGzsXk2Tb+dfQ8MzTsvdNuz3ve0LWAFGQIqN2zkef+xwUBFQk4KOUB+vKB5gVdfmQpLwizEhmYfbDzRVy016BHndYUieUubcZV8/hAfLjy1KgJT2XZXsMB+aTQaVjaJAdHBn6/2p5+pblfofificrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqzVZrxxdtCqsHmvyiTNgkuocxgpVTecJYfn7f0FxYk=;
 b=F0ixFGBZQE7m9TKPFBDT5ibUUUHUO6h9NIJoyCJbZsQB/Nt5Wxxs5hiyOhsqzscSHpc1D8575kbaTY/9YBKvoBlbcUwPJMmdIqCXVNnXu37WhhSbo2yka3piV3LaybJsPFTFLyaLAFq7jYmeNh7ug9PGM0Iex0zpGfQRgGvKWcEBcRWTYTYc3IEJkgctK5DuuBr+cmIxSLz0AFzu+HXLp2MX9S5iBQy8ZOxwQISRr3qJf8oHOADJv8FKnWhxzScPq/qU0HSV5gv8EQ6qt9JNWEMZ8kdOw1gN7PXcBRW7lgN/YK0SqF5LcYgMfCELccI9qhbHnk2T9fG8+d5LTRLMJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqzVZrxxdtCqsHmvyiTNgkuocxgpVTecJYfn7f0FxYk=;
 b=dvfuAyFSRxoK9s9lCEQa3DuzHayW5hoF/MktaQ8EVPxkKjsH/Xi2nojOqyjGjUa0w27fXfON8phWhgaa/IYkAJMns6y5+kCj25gRWnFLjqVLpm+Jdj6ddpJXewXNM78nsF8vIZOEN7KynllxeqBilF+/FYXOr7tzujK9FlukTJRar4t7bEXunPVCjaz2O3ds3Gwvfer9s9pr4jdqQjZyzF3Jq31wC90C18SlYYmGD9wUXSG1GMCBknKkIBkD0zuYJRjHlAHRXe/W2dDH4EL+bb6oOXX6z058vMsNkM7QASJ9jinmouNOJyWroKZ0tM3F5JJ4sk9nVmjL7OwdJ9A5dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com (2603:10a6:10:2ad::14)
 by DB9PR08MB8628.eurprd08.prod.outlook.com (2603:10a6:10:3d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 13:30:06 +0000
Received: from DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f]) by DB9PR08MB6697.eurprd08.prod.outlook.com
 ([fe80::bdec:3e95:6614:441f%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 13:30:06 +0000
Message-ID: <5a63af84-3f97-47a3-a39d-f0f2839c9f3a@genexis.eu>
Date: Thu, 18 Jun 2026 15:30:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next v8 11/12] net: pcs: airoha: add PCS driver
 for Airoha AN7581 SoC
To: Christian Marangi <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Saravana Kannan <saravanak@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev, Maxime Chevallier <maxime.chevallier@bootlin.com>
References: <20260618125752.1223-1-ansuelsmth@gmail.com>
 <20260618125752.1223-12-ansuelsmth@gmail.com>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <20260618125752.1223-12-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF00023970.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::332) To DB9PR08MB6697.eurprd08.prod.outlook.com
 (2603:10a6:10:2ad::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR08MB6697:EE_|DB9PR08MB8628:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2268de-8b3e-42e1-ed66-08decd3db5e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|921020|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: Irmb2hjIIAwBwjVUdCy+Tm17MG0gBpSXCi9Pe2PbOuY2SusbuxGrO3BONobAJdLk0zhkjuLf/VMJfR+6kp5G6k43/BCk7A/0MsMa3/Tk6KJJMCn3bvTtYWf90EAJqZJCPuqEUET4RG0Nl7eKkWeZs86sLNCof9Q96Z+wkbvcDjOr5vTy/X3ocRwR6PX+u+4py4XPcJ2BdiP1wHwQhD0Ic4tZcy54sDp5Hq0p5wivLzyrLFT20slKDuk9MYrXlz8MnI2F/cOmGt9NjAN5tWHsOtKDRxxOjoLrz+LJVAjbj+E8mch6xe41VSu3eu9vQIHdwEVwbfrEM+dS5oeA7Eo4Bohaech6s4/HaKxP8ly8B7uP0zCEN/4Xd0+KuJTlnX/WMMgq0Tz6xulgbLzDX3AZJRUA2I/f0T1zjee9VsrCmkRvJa6XiDLlcXaOiDVd4SxtUy63nbEoffB5AmCFjnZIbOjzl+3ZT9yPTZThtKR6rjCm9tWztZ7u+dR3XnowYxe8eCxOJEdAznHSZPQrl0AYeGws/R0S9NCwYREOYPUD0+TtqmO2y7jlZy+OHAqY2Vah4ZffwVc8Cx6d/I0ueHhIqGigHrlmDkxdusFxcGALlu/6ZEaYuhshEmN8UaD5usJtheC8XPxSuDHKeRITDYe/uZ1OZomB2i5yenkbdXN92Bny/SWhNc5CwXPRmXwNmbE9uncodlmPmUILeXmn4ac5v+jy+wuQ7bD+F5jGWKBZoBg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6697.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(921020)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUw0VEJ0Y3ZleFBXcDMrUzI3VkhGTysvR2JyME42eWlVdTZrbjRmdmxNUC9h?=
 =?utf-8?B?eDl3dHdZSDlQTXpDZUU3UDUwZFV1a1c2aXN1V0dmRHE0Z0JVSUJCbmY0UFJY?=
 =?utf-8?B?dlJNN2Y0RTNYcFUvb2Q4RUJoSkNvd1NKYm9aQmRxSWZsdkZXNmEzU0cyVWZX?=
 =?utf-8?B?UG5IZ3FDZDdQbHNLWnhHVE5hMVh0SUQzSE5hdldnZ05GRFN0M2ZZS2NQL1Vu?=
 =?utf-8?B?dkI0c0Y0VkYxbk44WmRqcGZHeXEwQlpyRE5GOXBacm42NFNtKzRCKy8yVHg4?=
 =?utf-8?B?RHhScHpnY2d3NHRySGh1Z2l3L1JqZnN4RzFIdzd0emExb3gva2NrSlFFWFBh?=
 =?utf-8?B?d3p5VkZlWU44SWZXZFdZUFNqQVJNSHc1MlNZVTRYdDdROE1ZNnJXKy8vemtY?=
 =?utf-8?B?WDNZK2Nta1FZSE1xMEl6RGdEaExiTlc4K0twZGZva1FhOE1Mc0RYcExqTTY1?=
 =?utf-8?B?NEFleFF4YUJ6NDNtQ2VoYnowTC9TSW1EQmFoN1dWYXlVbDRNbEJBR0Jva0lV?=
 =?utf-8?B?ZWE1VVg4LzQ3R2lIZEVQU3F2MlAzK2Rya1FpRnZvTXFVejJwRTBOUUlIRTBI?=
 =?utf-8?B?Z2xKUWJNeXU1c0J5ZXhCZ3E3YytsSS9MYjE1UmQ3N3dzSHFNZjBKUE9qRG9P?=
 =?utf-8?B?am43SWFRMDFCTnF2aW96T0pJalJVSkl0WlZmLy9tUFArc2cydVBMY1FPTXRo?=
 =?utf-8?B?WlpraUYzOERPbjBxc2szSW1seDhLV1lCWHFXc3hGaHM3K094ZE5xMTVuZEhK?=
 =?utf-8?B?aDY1TFY5NGs3b3g0OWFJTHJvY29ROEo0OWxIQktHalp6SmFwUjBpQ1lxQWt4?=
 =?utf-8?B?bHMzbUxRTkFNM3RsSmJCK2NvTWpKMzBPTmpzRXpqYUJPdUVZQ3B0TDNLSE9J?=
 =?utf-8?B?OXZRVjlFN0F5cDdML3k5NEM2SHBBSStwVUtsQkpGeDRoTW8yZURTVm1INCt6?=
 =?utf-8?B?UzMyem4xODZzS0NmaUN0Vmtxc3pYK2kvcDl5ZGM3WUZUL2NYZ1JDNFFQclk3?=
 =?utf-8?B?NGdmSG9aR1BUaFc3ZVM5dEFFandFOE0wcklRdEhlczhCKzQzb1crUmxlc1d5?=
 =?utf-8?B?MDI0Y1F1S1ViQWhqVURpeVhzVDBBN0ZMalA1RUl1V2dvc3kwSFA3azZ0NGlU?=
 =?utf-8?B?dnRjSk12ZjZMNU45TEtHbGdrOFRpNzhob3hTOW40T3VpYWZiTHRaS3BvN0JF?=
 =?utf-8?B?NC9DMXNSQXlPY0lEdS9pbDlQYkdFUW5YOVQzUEdjZjR3S0UrTkc2TkpjSmFn?=
 =?utf-8?B?OWkwbDQzUURQb0pYTDBSMHllMXdYWm0xbVExaEFMRHRLN1NEMjNTS0RyNHBH?=
 =?utf-8?B?T3lReGZ2aGJJTk8yMFh2RDBNcVFGbHUwSGQ4Q3Vwb252a0VOZDhEY1RaemJn?=
 =?utf-8?B?QitmTjVZR0RUQ1QyOHpoT0x5U3ZRMjVTRjQ2eE1tU0ZrYTZtb29Obi9uVVc3?=
 =?utf-8?B?SktiUFR1L2M5RUtYcXVkcmZjaEFzWGFjQjRLNnhoOGlmcWliTkplNExwdGpk?=
 =?utf-8?B?RXZPM3ZvRFVKWStQZm9obVhMODJzaEo3emJnL2x0K01zMmFtelkyNkdmS3VB?=
 =?utf-8?B?UEYrdldtSVdhUEZ0Ry9QNmdvTDRhU1FIdHJ3cXlsVDczdTZTaDlzSk54TDJy?=
 =?utf-8?B?MUZaTk1ma25UUmYwTzF1eHlGRjhYRWtUOW5Cb2RWdTg2M1JTck5xcWlNNXhZ?=
 =?utf-8?B?dHlCdmpLWHYrS2l6VjNaaThvbjJOY2tpbmkwN0lPSXRkT2xER1RRSGdvMFdM?=
 =?utf-8?B?YjVSTzFwOXBCY0hhYkt2Y0k2NHd0aXdKdndoYWxlZlBDa0o2VHU4Q2NrWms1?=
 =?utf-8?B?cnZzYXRKbFFNRFRwVktxNDlUdWxLeVV1eEFjUWdvWTE4bVBPeFJWWjIrNWxQ?=
 =?utf-8?B?cGVuSjM5SURhQmFFeS9RSHpRR3FBaTMvYlgrRHV4QzNvRGRET0RzaHkxdlBi?=
 =?utf-8?B?b0pHZVVWVlUzWWZ2aHVGTGRUNjZCNkNBUVZSc2ZwUU1QQ2luRjNsTkZocEJp?=
 =?utf-8?B?MzJmaWpwZWV5UjJEN0V5MTlVOHlCSFpYN0lJRmN0UEVMZ2xveW5RcFVqazRM?=
 =?utf-8?B?ZnVxc2VOZVF2RXRkSkxRaWsxa1VsTUZ4emNrYWhCRDBEUWVqYmU4bWhiYkFj?=
 =?utf-8?B?WUpEQUVnNFJDV0JWbE5Dbi9PSmQ5TytJTnY3UlpEWlZCcjB0L09rcWw1VS9w?=
 =?utf-8?B?KzNWT0sxNXVackVtNDhVNzdYUll0U1hBRlV0VWhnMTdySithYjlNNXVDWDZG?=
 =?utf-8?B?QndIRWJkVjRlN3dNQWpUZm1MVFdSaklGdDY2amRyajNoMGV2Q0tza3llZHZz?=
 =?utf-8?B?ZDBvNjVOTldBb3Z0OGdJOHY2b1I0WWJKSjRrejhwbDlQL3VFSzRyTkgwNUll?=
 =?utf-8?Q?HmTINJnhtJ2CUBt0=3D?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2268de-8b3e-42e1-ed66-08decd3db5e4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6697.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 13:30:06.3484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vizWWE/4EaRHshpvi5R2sKa3dJHxEqwucEBMHtjQeLwCYdFf1nf0aSnbXHw3aaOtO2NHq/k7tatr8eX4vixV+20+9Cn7PCxU81V7+/hkdeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8628
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_063015_098479_9821CBFB 
X-CRM114-Status: GOOD (  12.22  )
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

Hi.

On 18/06/2026 14:57, Christian Marangi wrote:
> Add PCS driver for Airoha AN7581 SoC for Ethernet/PON/PCIe/USB SERDES
> and permit usage of external PHY or connected SFP cage. Supported modes
> are USXGMII, 10G-BASER, 2500BASE-X, 1000BASE-X and SGMII.
> 
> The driver probe and register the various needed registers and register as
> a PCS provider for fwnode usage.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>   drivers/net/pcs/Kconfig                    |    2 +
>   drivers/net/pcs/Makefile                   |    2 +
>   drivers/net/pcs/airoha/Kconfig             |   12 +
>   drivers/net/pcs/airoha/Makefile            |    7 +
>   drivers/net/pcs/airoha/pcs-airoha-common.c | 1324 +++++++++++++
>   drivers/net/pcs/airoha/pcs-airoha.h        | 1311 ++++++++++++
>   drivers/net/pcs/airoha/pcs-an7581.c        | 2093 ++++++++++++++++++++
>   7 files changed, 4751 insertions(+)
>   create mode 100644 drivers/net/pcs/airoha/Kconfig
>   create mode 100644 drivers/net/pcs/airoha/Makefile
>   create mode 100644 drivers/net/pcs/airoha/pcs-airoha-common.c
>   create mode 100644 drivers/net/pcs/airoha/pcs-airoha.h
>   create mode 100644 drivers/net/pcs/airoha/pcs-an7581.c
My comment that the files should be renamed now instead of later when 
support for other airoha platforms are added still stands. The common 
code is not common among other platforms (EN7523 as example).

MvH
Benjamin Larsson

