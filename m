Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2665C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 14:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lntY/pJrqQPaP9IGXbX8ZI+Znoo4o9cuTdkwN5J+O5A=; b=t/7ztbIebWMNVEkBLMOVZjTvjM
	D1Jon0jRkYU+05oQJNdFIOvGtplp8F/kFQb1gw/XytUHIQmk4xdCqeOKaATTIywxt2tqZ7wppLkw8
	Ps0lqeH8+Y3kC00EkWTMghgh1THfR/K+RdLQRWgHDHBEbuQsxcxsCFEsR9hSFYXNEraoGjebrbDog
	49EKKMglUWN1+AKI4rkWMwCp7Du9ygVOtUtbvQVuRZMMe+qgIpZoWbpG2JXUk0Ab2Gl5IpIKnBJB5
	PjC6gOIyEqT9oY9bua/Cwv7LuijMB2ui5fN0QIioF5xo4eHMA0WrQHedBJekyZ/kk0ee5wjqOwX91
	0LsNQFQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkQU-0000000ClZ3-2oPL;
	Mon, 06 Jul 2026 14:36:02 +0000
Received: from mail-francesouthazon11011004.outbound.protection.outlook.com ([40.107.130.4] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkQS-0000000ClYT-36yq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 14:36:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gN8e5h8deviUZZUUNWsvjgyv5QALV5/nWaXH4qJBOp+zIeqzuX0kFxnVENXuGJjkcVuBFLwjfcVmnguR7qVA1NPJeLdVK/3GVtpYm8TNI0J9E61pvXjt3AfDVch4GQKe2WfUwOHGjA28yEGCEJYgcSNDhXnarzBTC6ZRrByjpW6CUREBOxNG9mvzipIIahoYe9Ad/9gmwXd/7CAkaBmxJIjY1Fd581ERY5KmMs+Cwc6n3M31OD5wpMjXTsRmdMc+wclqbDJIk8RyISVAwRGE7CPr1RL2HCwQOop7ev3CCR6y/rVK5n7qzlJpc3IYh2wa0879VOJGo5z5k9ptiuAn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lntY/pJrqQPaP9IGXbX8ZI+Znoo4o9cuTdkwN5J+O5A=;
 b=qTKkBssKSchRpcsUdRJ1PzCP7X5FiCv/UonrhVha9kbA7RN56aVOIssKDInmf/ZO71QOj9p3kGpiO8ZvLMt8VgwwK7xzcdQb2OTtXwFt45thjjFzm+L2sLQmQ2W36i1W+WSwEgIq61wQivX6NY/P/5J1fRGZN4sJQJXtsVbGnQKoTn9B50LxE+ENfBkoGcg7+fIDKDsUX6dK9ci3KbUjPxqN54jyw1gSKXdLmgbJ3eMADuL2bmmUmX88HRdEoTQ2KQtbwLLavupaLPrPIB+Yi6kYvz1VyEVla0fq0dVULh1av3zv99IwQuKemiezQanbr3LYaclFJyqLGPhi+dXBuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lntY/pJrqQPaP9IGXbX8ZI+Znoo4o9cuTdkwN5J+O5A=;
 b=gZToxLvI20ygLJVRLB7Tlww31H7ZV7PheHg16aY9yXLW3hgjPImgtPSDKznazZXSjxTy7pN1fABL8nNzYBqnGtCiH1GMFDtDhGgAWujadfdUnQLUtkz0LbMSeMSo4+AOcjkquTGG15C+7LcZXA9Sxrf3DhhJlPMWv1Vybdy5cPO8BiTVWRkNUiO1oM2ZaTiuLT10pMC29stUp5FAZcwKrPKpjW+hY/ih06eZkQgID7xpgxEjgmiwhO02wbCytG4kB+c2WJ9aUAD8h68Eao3+XhlMGBVpsmjpziDz8vim1YFDdhKk+05w+wAZ0uayreb54VJjPrUOyiwLQgIcg8nhig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7056.eurprd04.prod.outlook.com (2603:10a6:800:12c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 14:35:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 14:35:55 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Herfurtner <alexander.h@variscite.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx95-var-dart: wm8904: Add INL1 as DMICDAT1
Date: Mon,  6 Jul 2026 10:35:48 -0400
Message-ID: <178334854343.1324163.15144188081827054303.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701155308.40612-1-stefano.r@variscite.com>
References: <20260701155308.40612-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0020.namprd11.prod.outlook.com
 (2603:10b6:806:6e::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7056:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bf659fe-084e-4da5-d89d-08dedb6be32d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|19092799006|366016|56012099006|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 0vE/ouMfj5JOZKvbp3LTzeLxiZaXOug17wodq0gBQKvb7iqTBJNTFYljHlSk4jJlVe9HVMPxIIoURnVpt+tDkoo86QInLqR0YyP2g7d+ZMCRwa535R45X2HIqvs52N55joA8ij3H8mEvwsAEJ2qwvR35GG1ovQjPGEsJ5Mio4nXM3PBQGzSwkNogly9q0G+j/OFA9iTDmJeVdVlmGRIrMT4bHcXYp9Y2BsIN7AhliU1E7ENuul/iLeP0LkD7wmECwEqKwKQaC815L8YzsnuAqW8uVcdpabk58GEcxfcph2/B0C1NpgEIEVeUeCKN72jsf/b2DZnCq7sCyFYyw6XTjQBUGOb6bKwSsGTgZVIBe5M2cwH2bUT03fxwkq7YlHBh+O9OqFdEgZYF98o6QqJ7fOfSKEM0SYE4sLmU2x6DE9M636AR/PvaJxcnxQw5hZFGBdFqWrasUW5HgkwIkTq5vQonmzcR1C7mUM1A8Cso/U9YZyyRyjqM0YwkJ7YMKIEIoNfUFTAgqjs5NlOY0DVOaZ5bnMmM/wwkjsoNI0cxph9Zs8Q8dvAMgiXqhJoZ0WEwBtKM0x6PdbFOE24r00ocna1LCQlWDFFW/I9xyzRONmEMvABUurT3TV5zKKkCzy41TUT2bpp0/1AkpEnyfaEC5okKbJAwPy2DzfCp2OTOpeM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXdVN1k3ZWdsZEN0emdjcGsvL1NORGhHTGxxeHlUbGNseDVMOWtrU3RaQmxr?=
 =?utf-8?B?TWxqaEVNODA4SXNKNTJ2RXR1K3h5dFAzTGlDb3J4cUxoN3RPVVM1YUdoVGRa?=
 =?utf-8?B?WGRGZU51dkNlV3FiTzlaSWowaDFXVlpBMXZKNmVGd0NDK3phdFJSZ2tvc2Yr?=
 =?utf-8?B?OHdKK2V1b1dPcHV1UDZWZlBjYmFSQWxRQ2JpZVRJdCtFSGk1VFpoV200ZzZ1?=
 =?utf-8?B?a0JtazZIdHhTbElDT2VsTGhDM0kzZXNKQ3Eyd1dQM2VJT3ZKei9IYWxCUEk4?=
 =?utf-8?B?UEo1RHhLQ2JPWnhrSnlVNUkzUTJjL09JeXVydWJuMGRpVE1td1gwVTdMYlRT?=
 =?utf-8?B?U25Ba0FLbWxLVWlTU01CWEVUMWhXc1h0WXl0d0FoVklMUlIvZ0dWRWxVUDVQ?=
 =?utf-8?B?eG1DZkFLYjFwWWFHSmlCamk4LzVraXh1VU1VWlVWcTIwRTk4SDVQSGdhNmhC?=
 =?utf-8?B?WWNaNy9RWWlkU2Z1ZThiVFo2K3B1a3NUOTAySFBBZ25JVCtJZXRXY3ZLSTNF?=
 =?utf-8?B?K1ZCa1kyUUlFUXM5UlBJeGl0NlFnbmNObWhaWU5pWDZSNHI2K09KK1B1M0Rp?=
 =?utf-8?B?T0F0M09ud3lGa3o1UjgvOG1OSzJ4NDRxeEs0MHFvZWFCUng5bUszeFFoQ29U?=
 =?utf-8?B?bzBaaGJIbnJ2eDAra1kwajVqRVo0MGRkVEp6bTVQdHUxWm4yeWxoQ1JKdkpS?=
 =?utf-8?B?UlVhYjBMdTViVmtXUzdQSXVhM3BqUVVmN0xwZUZaaG90UFNhMUMrY2VkY2xW?=
 =?utf-8?B?QkZtK2pxSk1ra2Y5THphdGVxdWdzdTdYdnhsdWVDb3JNc0NxNld4OTZDbEhh?=
 =?utf-8?B?ZUx0Nm5kems0enFiMlQrV05wM3ZNMFNKZkUycE9paHo5TVBoOW5DQkcyT3Iy?=
 =?utf-8?B?QXVtMU1ZNDM3UWxwWmcvQjRLOWJYc2ErNmozbnNxY25MMGppcm1CQmFBbXR0?=
 =?utf-8?B?NUJGYWNPOGlEWkxpY2VCaFdRbUN6ZU9naS9KeEhtQTJ0MjIxbW1IZjR1S1Vu?=
 =?utf-8?B?cVZhU0dIMDB4QzVPZTFCTUw3NmdndHMxWGQ3OHh1TUUyTDJBRHFVcjMvRGYr?=
 =?utf-8?B?QXAvS285S0tnbWVKMUx2T2lQaW93VnY0UmpxT0tYYjgwbnd6Y28xMzZyZVJj?=
 =?utf-8?B?VHk2NHNrRFpxSXMyY0RVZ1lGZG1QSUhocE1yaDdwY3dja0lsbFNick43WWNB?=
 =?utf-8?B?enNaNE9MbVpSdGZDYUlWZ0ZRaHlnV3hjUHRkUjU2NHFJZ1JQWUJsZ2hIczN3?=
 =?utf-8?B?N09tNHlmWGx3NGJZeW9tSHJJZnJ5M29nUFN5WHVNbE9BbWYyWmI3UW1lR1c5?=
 =?utf-8?B?L3VLVHVZVmFmelU0TXAyQ2ZkSHBTUW9XYUo0UTdJa3lWdGR5N1FxS2RERU5x?=
 =?utf-8?B?RkJVZzZHZDMzU1RpbEc1ZHhscHpsRUdHNGd0aVVYblRTR0xNRUlQUXdmU3Q1?=
 =?utf-8?B?Y3RhY2FRWCs0TFd2RWZaSk00ZHF3a3ZaMjdIWThUSVE2V0V2blI4N1d3T1hn?=
 =?utf-8?B?d1NVVW56cDByTjBNN1pXQkNTUm50dCtObE9wR09HaUZSdFRzYjNpeE8xUmMz?=
 =?utf-8?B?ZVRXSE1iSEFqWWF4WUdqcEZCTmZuai9WMGMzODc0SlZ6bm5RdW5wRXYzRnlI?=
 =?utf-8?B?Ty9rUTcvQXlqVE41WXBVdHo0eEthZzlFQktjazVIeFg2cDV4K3FJMFJSQS9Z?=
 =?utf-8?B?T0hEOFdDYWZUWWtOTE5wUnNKZzd1ZmorQlRXWEhRekkyM0JyQXdxT0VhK0Ji?=
 =?utf-8?B?TUZ0WHp5dmMvWW9mMHVleGY2KzJNRVBjOVBtRUVuRWozTjFSS0dZN09TekY5?=
 =?utf-8?B?YllTb3NhdmFLZ3hvSWVCbENMVVF3bjJhcE5qS2syMTlBTXRmcVc4Z3ZOT0dL?=
 =?utf-8?B?TUovT1J6TGNTZGdVVVpnZ29LWFNNVDJ5cmpIM3l4MzdOYXVoWnBTQU1GVXpn?=
 =?utf-8?B?b1RmUXJGaVNVZWwxamRTWVNWSVlQTTNrYTFRYjRCOFEvMzFEUFpEQVVORWR0?=
 =?utf-8?B?ZlVnNHFDTkZHbDZYNWtXU1FPTWttL3owc2RHT29RQy9sUHVYSUw5THdHU01S?=
 =?utf-8?B?MnhaTm8yN2tiNlhvdEIwY3N3WSt6cVBjVU5Sa2NlV2U4OG9ObnFxWWpVbVR2?=
 =?utf-8?B?M0xHaEdHeEY1QnhYQzZuOEEvVGRnRnUyd0JXMXFpa0ZHRE9FVG9JTnk0R2tI?=
 =?utf-8?B?bDdVcFNubFFBL1RoTHdyaVg2OS9FeFpqRXI4N3Z0RVZ0dURXNzRCTFVUTmJG?=
 =?utf-8?B?UDAvQnNsd01BUVUrQTQxTXpueHQwdkJPOWR3Sk1xUDI5aEtzUHVXZVBDNjhK?=
 =?utf-8?B?d2F4YXRteTdjRkdqem83Z3I5TjB0NnJTME84QXZyUTI4OXdUVUtLKzd0M2pU?=
 =?utf-8?Q?LmyGSXOQ+C8yv20u1hYmjkSHmYIQ0j6Uz1yOW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bf659fe-084e-4da5-d89d-08dedb6be32d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 14:35:55.4989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PvZCCgpTGvmaBxWTNrGTt+Go56ccIFESp+VhL5YZMo28GQpXkmQIs9oBgpUl1gj1K8ncb1Hs4YRyqBHnr4mWTVQc5KjE/yTRfAwpJngG9z1jsXJVMo9GsVuMhkvMhJgS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_073600_790733_77BD38F1 
X-CRM114-Status: UNSURE (   8.94  )
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

From: Frank Li <Frank.Li@nxp.com>


On Wed, 01 Jul 2026 17:53:08 +0200, Stefano Radaelli wrote:
> On the DART-MX95 platform, INL1/DMICDAT1 is used as the DMIC data line.
> 
> Add the wlf,in1l-as-dmicdat1 property to reflect this configuration.
> This enables the internal MUX to switch between the ADC and DMIC as the
> capture input.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx95-var-dart: wm8904: Add INL1 as DMICDAT1
      commit: 68427905850302612bd68dcec7baf791ca6f8032

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

