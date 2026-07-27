Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AD4C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 19:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+xPuh+zQksPq1zB0a5As0p7vLzE4MY19JjIUCua6bE=; b=VqkcrpOwyCVzcqi8wPte0sZ4Az
	opmhTlq2m6Tcy6TZn99LJ2y7Lafc1DC60Vm9fJ2jEqcRUEn57knpR7uWPH0WCDaLhvOUa+3uuaK/P
	QoTT81czQvsR2yriGReCuVgJe0II5xn9f/q/BnMw+vfKl2ssoJAZ8olaUsw8pwyWYrwftNerzuoQh
	eQK4YWc2FbQnop3hFkrw3XoM1JJ9k8y4f3UEh36b2tksMZO+kgzDsDgaswmnSl1jEVKfWfB5h2FON
	7JL2/qEHxBo78YdQckJObXsyt/5OEqyvHly9uX5D9BMEVjZSERseXwFn/6Io2O2pG+hf5mf1vQHzR
	ioXLYufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woR2w-00000003lV5-0wYr;
	Mon, 27 Jul 2026 19:31:30 +0000
Received: from mail-swedencentralazon11013001.outbound.protection.outlook.com ([52.101.83.1] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woR2t-00000003lUh-2a6C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 19:31:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjUMBQRMgThwPuM7E0X9zoSbVJoXGNcsUMq3uz6QTSfflaiJo0UQImO3cMSfZv2K+GPsXLxidKbXvJJjC9xenh7I7j6/5WytMFyzWwHKqOuXzBdkEmCvoA9/Gt1tUEt0x+X+03xKm5hk2eWfm44LkXvM8rMTZIyH/ouHaEQaZKWokHKDSHhZhiw4x+Smf8r5IT0LQUai9vbfQtrA605oyWL6fAvPszCe0rzm34b8bbxxdQSQ3vlZ2AjRLhiMDr9wW5/rms2XmiFAEP9qi7N0hxkorcORntglWLAwPZec4srFPtbVys6tyeNJK/dcRLlqSvFExewFxO6rmEY39aUCVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+xPuh+zQksPq1zB0a5As0p7vLzE4MY19JjIUCua6bE=;
 b=ANs+gK26Rc+Zoe7lWVrO6ANYJuvi4S+poOH7xHt1fQGX7NsjcB/6noOXNXh7aCYjRuDF7IiGuH/m1w1Dln0ky3p5r8JhN8OwfJRmnCSvB5IaERn5ELPHMOgIz8coZjK4Pa/RcmFQ5Mt4tfex8tOF+QWvuEyqtVWUU46GvDL7JPm9mpZO3JSS8rzS/Gu9MoJb98r2Yg6oDvfW4aNDzMpeTfG+aYZxEJbO/XVkoQ3U6L9w1lNp2UA7IT70fyTAsKeqBey8apmZ05hiTiE7FUg4eH+Dmn8mRQ8/UDib3TqbsK6fahUeurazgMNqTnkVQ09Z9DPjuP6CrIR+0yx7CINt0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+xPuh+zQksPq1zB0a5As0p7vLzE4MY19JjIUCua6bE=;
 b=ABOJrySQ4SdfPDEwGusatXFfPh7iJTdsE/oa6NaSMR8n0YQp6kjtksZXlVgZjDNAuPI12Hu1r9wkK8l0dsdKAmAhYFyEfnK9aAeHJcmw7HdabgwOEDJ1899HKpEUHEjtWb8DOr3JV15nuTpIwjWbAI0L6Ipnt79TAVwGxHTTKVLsZgS/0GiGsWsewxxfAoDQFFdC3x8Z/xQkoNRJqbRO+52lwkh5QXl2JZkuCc4aRI5ZptJy4xtrv5+JjwLm1g9jmbhkg/waLm0nLcYn4tVxN4YdhLqWJNIh8856KP/Y8cikil1YolHWDa5Q50yHSMcic0y6xw4e2BAEZd585+fxhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB6947.eurprd04.prod.outlook.com (2603:10a6:208:18d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 19:31:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 19:31:21 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	han.xu@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: (subset) [PATCH v3 0/3] Add DMA support for i.MX94 and improve AHB read performance
Date: Mon, 27 Jul 2026 15:31:10 -0400
Message-ID: <178518066116.2648170.15820007549794747555.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722-xspi_dma_upstream-v3-0-6b7ff50cae8e@nxp.com>
References: <20260722-xspi_dma_upstream-v3-0-6b7ff50cae8e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR22CA0016.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: 124dd789-ee3f-4b8a-2d56-08deec15a333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|366016|23010399003|1800799024|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: JaRHzzvWPc/5EoF19hDwz0Kk9MvzVdTlE8CZnBqvgYy1kztVqdPut+z6fPF9zcvNBERA85Wk++daz1ZlbvlaqIQx3lnh9BG0StMelZtEAV78Pcwp5IkrSuoGexkeOY6AVlCYA0JljSg+7bf0BSDfyC2ZKHUdl7xdcv7Y4GAZDyva0+82049L31dOL2c8Rg5zfAwjXdf2BAzGV9VzYJIrqB40jssvFhgJRVncmLRWz5YLi/bW3UsBcQdIRRE6P3De83er1DhegyXIqSRvccbasGirlKEUeBNGsIVAeRqPFRNonRfAT9iw58uLHmy+jUQ1mt+MRLFrFvquEP8Rxp/umgeTn+mnAV96FLXmE0W4xguVhDYi7iGimRu+9WrmOnbkSVJKgdiKaVtdDLe3ZCNjqo3+lLoprvrJZeLfx+WWaOsfUe6TDfwzxd34hQsOG2pn404Gf+KWiOf+HsDsmktN1h3XTKuqWWLgdQfvYfEriZYmcMgNC0tfd4m6EEDzgpYtv5OlpfBI4NUR1va55osYMQlt78ZVzwgfy/WgaOwMis3AtMS+p//mzOX3dyhMBvvVV86uRdJVcAXKDJFcfDV/2pXOQf/4XtU2WeIyu8TE2TmF2VU6ZLMZtguXykDpQE9Fai+hB0Fhzdpt9OSuevDNLQkdID0oD26Ac085bC7Nqo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(23010399003)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHMvbzJTMW9wRm5HeXExaW5kd01FYzZMLytWKytieHljSGMyVWtIVDZtQUQz?=
 =?utf-8?B?L1hPNnZ2TENUbGNiQ3B2ei9LM1dxTjhKbm8zVTNmc3pXdkVoNHlyNCtxUkFo?=
 =?utf-8?B?Rmt5SWFmV3pxUmJleDlscGNRZ21iQUNVa0Z0RThzTTIwRkZ5RmVIVWFHUXdx?=
 =?utf-8?B?ZlNBdlZoY2xIUmtaeG5Udmg0Vk8wNkJ4V0hNWWlQdEd1anRpMnpxOTk0TkdU?=
 =?utf-8?B?VDA2SkUwWitmdVJFZkYzUVBTTXhHaEJ4QkhuZjdac0NFMmZJUXFxMFhJY3A0?=
 =?utf-8?B?bE8vZ1NXclNqVHBEVXlIc0VEbXRQbzNGNGJrMnZiT0k5TkR4L2NaWDhFMHFa?=
 =?utf-8?B?UUlDNzVkV0t5TkxJM05xRmZlem5qWkxoK3YvNXpiY3RuV0VCUjZWb2NNSzlM?=
 =?utf-8?B?R1A1YTVzU01ZUE1Ea2VpYXkzcnpDNUwvSnUxSENOM2tleFoxUGFtZjlodjBH?=
 =?utf-8?B?QTdlRzRwL3pjTVpQSzFQcEw0N0lnVVF2aTlNSkliRHcxN3lYTjRDQitya1R5?=
 =?utf-8?B?V0tvaGFZN2FNZE0zMnNsVWpXRCs2d0NEelhrQjRsVG1FL09OSDZtZ2phem9t?=
 =?utf-8?B?RWJOU0JzZUZzYlovczZNTGROU3hzdTI0ak9UN3d1WmVIWnlwb3hidXdxQ2ZR?=
 =?utf-8?B?ajlZUTNqQzNwUXRNMXpPR3ljOUhhMng1MGRCRGZPL3pURUdJd1pFbnE1NzUy?=
 =?utf-8?B?L3JQL2NRR0JsSlkxNlI0WCt4cnArNlpmajVtRVk0WWRIYWhvZkFPbVZFL1Ns?=
 =?utf-8?B?N0VUYlc5RGdvNkJmRDhMdG9oU1o5YlRqWXI3bGVNNWxXZ2ExQk5pVGlhWVdS?=
 =?utf-8?B?L2NDQlljWWQ2RnVtLzNERlZ3c1ZYTEVvRmU0cnBUcWZXUUFQc0tpZWdJNXFm?=
 =?utf-8?B?WUp1eVVoTVlWL2F5WlJuZ2lyVytqZWo0NzdMVFF3TklzdDdZeElkTjI5YTNN?=
 =?utf-8?B?eUZEN0l0RFRIU0N5U216eml0K0IzdkZEbG9UTXJHUjJEREhIa1FsZW45RFNZ?=
 =?utf-8?B?bnFTaDllSTFqK0FGWExsakpyNzhxSjBkMVl1YWY1U1AvY2xyRFYxYjlnTHFP?=
 =?utf-8?B?akdSb2ovVVRzL0F2N1Q3amE4NFVkMDJ6L0FzaVlkeUF6R2N5OEJ0V01PTG5U?=
 =?utf-8?B?cVBxK2Q3M05DRmhCSWoxRWt2bkxFOVVMSmU1RDEyV21ma0cwbUZIRzZ6dnc5?=
 =?utf-8?B?YzVCWFprVmdUVmhkYUJ3UzZpZXNRck9tazVlZlZaSlFPbFFxSjlrSm9oTjda?=
 =?utf-8?B?NVZ1djhHLzhOUGFyOXpiUFI4N053eTcvTXFwTGFnSnU5RktZYlpGYmh4dWR0?=
 =?utf-8?B?UDVHYncrZE5COVRiY2VrTlN1Z3lhQURFTHhQaEpEK0pSSHFmbkhKbWRKVEVs?=
 =?utf-8?B?cGJaUTZsUllHamNTVHNWVlQ1SEwweGNHMmVsK0l2NGxidUM1QVVydng1dWpx?=
 =?utf-8?B?MnplakIrYk9GaXlCb0NRZHRGSkIrSWUrSE9GYjBPeXo4R2s5eFkrd0pxVjdx?=
 =?utf-8?B?SzNCU2QrY1NLcDFybW5lSXdEYU5kcXY2YjhyOUkxaHhJUlA2aGpUYTV2K3I0?=
 =?utf-8?B?ZEpOWWVtakUya0psdUVVVEpsOWtXdEFDMnc1dHFwQ0RWV1lzeE5jbkxocW5h?=
 =?utf-8?B?VjNhTCt2Z2FqTkdXejlFNkxBT1FkZVN4UGcyY2NWaTkrNnZKNVJyK2tuOHBp?=
 =?utf-8?B?TjBjbzNTaDdFN3ZTQmRHMVR4YVlDdHFsUG1ZRVJISmU5WjBQZWxXOGpiZ3ZV?=
 =?utf-8?B?Vk5WWTVYRHBtajhXRFFTQ3dxbFV0UWhlTlZNVkFXSDlIZ2pLN05xdFBwV0Zl?=
 =?utf-8?B?T28vdWg0SjJ4VjgwV1BpRFg1VmxtdkV1NWRzM2FzTGdVcG9kQi9hb0U0RzBL?=
 =?utf-8?B?VktmZVI5bFVnbXdqbXRGRWFLOGhsS2RIYXp2VUNWTkIrUFFNL2RQRTl3eTVl?=
 =?utf-8?B?TXBWblhMTVI3aFZOeDdzWlFaa0kvWFZKamJ5SWl5UlNOYVRRcitsMXJQRXNV?=
 =?utf-8?B?cDJrS0lxaTAwQjRqNXFGWjNvMGJVWUtiek43VHNkRzZQTjdrSE5VWGxpZFlz?=
 =?utf-8?B?TUxBcGdFc1grQUcwMUdlQ2lWY1FQWjJOUitFZnEzK2doYmJhOGg3cytxMFVN?=
 =?utf-8?B?eFFKTmVialMrVFV0aXJjU1VYS3RjdlZDLzdnbUtBYURQV0VURFBrUlFDUm05?=
 =?utf-8?B?WHMwNjVWQ2lVYjlrVDdyc3NNTlNVR2xhMXdXUVJaMlcydUNNSG5CYlhEdXZM?=
 =?utf-8?B?Z0dVelhEazdmRGxTR0JJN2lwV05Sek41aUtaMk9ETDZLVUpMMWJ3Wm5jZ1BP?=
 =?utf-8?B?ZDRTYWx2eHFKNEt0ekRvcVNqcXRWQmtBV3NrVysrYmNLUXJRL3ZsL2FpSnFh?=
 =?utf-8?Q?PhNKAOkxqTEK823gduUF3oQK94feWVA6kS3Pc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124dd789-ee3f-4b8a-2d56-08deec15a333
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 19:31:21.1378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPaKUTkwiJo+0jInlU23OtkBIvPC+5Yf9BfhqfkBd/TGxRo/rIBEhawHujfQ2cRofe5r5k+5PGRJRd5mqD0iGM2wf8EA3rGXfxxVCYJL2ckVhGhOHZkyS5yR32m0A26H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6947
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_123127_681560_B10137EC 
X-CRM114-Status: UNSURE (   9.81  )
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


On Wed, 22 Jul 2026 17:00:41 -0500, han.xu@oss.nxp.com wrote:
> This series adds DMA support to the NXP XSPI controller on i.MX94
> and enables the use of DMA for AHB read operations to improve
> performance.
> 
> On i.MX943 EVK, the measured read throughput improves 4x higher, from
> approximately 70 MB/s to 290 MB/s when DMA is used.
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: imx94-xspi: add the DMA channels
      commit: 933bb140ffbd5015e940ea376a8c5c15b0fbf5d6

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

