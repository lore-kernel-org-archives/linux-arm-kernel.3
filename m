Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125BBCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnOefGTI0cf18Z8MTj6MleCguWEHQlhho9M+GtQESow=; b=UsP2EarUg6UlcROlyp56cQY4qe
	1L9xuGW1piBdlVUqNuk+8djgDDGM3Dy0BsMo84++V8Zez/bzpq8oT4KTXfNS02G9EAPYpMNPzGABV
	/3sLFalRAle8PrjKaWHD3P6m3bkB7I9WWOfuvN3p0CYSn5gYNqcy3Mx+bDxnwtkY7HqD3UBgRVCFx
	+WLz8ZhbOEQ4QRmUENbzJknRA110oQLanziW2ccqVRFKWZZh4sDCNQT580csqRD/pv0xl5IbJJEnP
	FEr1F0KhMyaWp+/SEm4q/4/GZIzegujSHKqatW9XeRK/GEd+RStR0mtyqiWZmJJLRP+0WWKCe+E+3
	Gmnmybfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdiV-00000001D0P-0MyK;
	Wed, 06 May 2026 14:59:15 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdiT-00000001Cza-39w4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:59:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTDvvK60XSMlelqvxzl+7B/4uS16tf+4A9fUdOhf7i7UHh5FLzlVR0DvI2N3tc84+rspr8+DAIUUJ7Wz0DTLmncttZCLB0oPgHcpSZZY4zR6KaBs5ka8OQXcmHzReSqgL/VXdBCcWWKk5dS2885NC+TCOwpFZG5Fg90fWKNKxEYxZlfOFvJGpb2r6rJ/oxkai8/ZnnAIutFa/+EIGHDq/j3IwrCTcw97MBvIt20aQjXN51GtEfEFk9GAZ8/jgcOGYg/+nOu4BQ9qWVb9SbzcYYrNQ9nAgKTHNHLJxm/dcWjNrzO1/VokJx09Z4M/Y8+R9wyJ7gfVs850ArmG9EEv3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnOefGTI0cf18Z8MTj6MleCguWEHQlhho9M+GtQESow=;
 b=EKI/i1ERniECZjJD+uZEPkEQw1jLYX7oz5PoO27TGJWnPuFTNaC4W7lWnYcTGjwL8mJYVPiAKnbAErvYtmeAY54LNs/1a0hFMzn7Sb3lPU8M0APWZR3LCVK344ISUZ+aQhq4mHeCrgqKgf598868nYG1MYeK3UTtEecshPxfyHKKYG/Jrte9mMuLGpsG2fnHdiIg/KhN5LProecnazTtncjf6dY6lqnmIh2zGkIF5yxmCCYbXU+T9ybkT0/7RubkTQ16f31u3kYsbPsJUe7uNfTPibZGiSQSQmUIQISu8Qju5uby6v5JUhBP29TY4zQcqA4x9IhKakyWhFnqIu/6Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnOefGTI0cf18Z8MTj6MleCguWEHQlhho9M+GtQESow=;
 b=gdlpQvqt3SahyGEDFnUQF3RKJxacitzhCZSuvrLvf0XoM8gEhzQfcbEnnUZzkUMMmMmN6asUcTMcE4mAONBI4v6yKDuCvl4inRyJ3BDMgiVOwrOrwa+gs+QaNpeA3lSrBESilevw2JqvRxitW+vT4Py4acO659jWNcLVgccvB/BD4VQILW79VUWnvYA9JIP+OfCk4Ociv4tZdCwFj8DiWjH5YCs0yKy+Xs2zKLti0MQVek51IQWQAkcCxjAYJVA4k0QVAYKtzizghEfpbZ/zhO4AQyRjvY7eCr+hUreERJhpNj8ljLxrWAeWP5Qu1iAqVCZXSLgoPfjxmqfMs/Cxvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBBPR04MB7673.eurprd04.prod.outlook.com (2603:10a6:10:202::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 14:59:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 14:59:07 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 frank.li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com, 
 Richard Zhu <hongxing.zhu@nxp.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260506055316.2798693-1-hongxing.zhu@nxp.com>
References: <20260506055316.2798693-1-hongxing.zhu@nxp.com>
Subject: Re: [PATCH v9 0/3] Add i.MX943 PCIe supports
Message-Id: <177807954574.853863.624761746932435454.b4-ty@nxp.com>
Date: Wed, 06 May 2026 10:59:05 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA0PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:806:d3::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBBPR04MB7673:EE_
X-MS-Office365-Filtering-Correlation-Id: cc60d390-1b6d-4b05-5e4a-08deab8005e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|52116014|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gR+lGn1XRZWqB4WXbYW1fn75dDs/dpT0YVgyaEyX6RhebLJ78WNXFEVSNOuc0NoYYV2HR9L8/gtx9KiiUudOVKiKVCW3XqSXzVYri2HEyu6zOV6DSbKux6rvcShZWLq3IrteqRe/HJHIrEa3Bl1iarUTAXq67IxiBdr3mJnJli1mxE3UDAR77HjJE0hYMRDmEwRx06pbU6d8zzJSPkqQcCgvE6FGn+SXT1OSxWW+j8dwHqOmG8dSYuu51zmgH/y9EqCLaByVAofAdIF2aYFnDxB4KnR7haP+fLfWLisg4b7CZlCh+dBHjWUh4jc86r/w4gG2phny044bzvhjpPn7Ma9tGmDxUU3QZgmnHHS6YmLmxjHBChNJxO3Yq4o8xm+ZfqXT3mGVrGcGwPSWlkoYrA/LRLNJD+8fLzl7rgzDFh0MeR67/mGlAj85XVt9K0jIB5d6GzN2OGGGcVMj0zoAcgxXCD/YgotyUH/P2rbB3xWBWxmmDMYFp6k/av43sTCRAO7Qg0uPEgA/BTq8hbJFWgBovRw/L+okvJbEUt/+9yxpyxoEm+Twlj+160wVH7ML1k46FGpRISOC9S/U/ZBMfDgpC2Hjg9uTQ4hcw2avDt+EQ/FWaAc9FW+gf5UlxzkHSZbpundYjcPrfsydvdO9HHbt51wOBE3wjEaRXtPu3YxzU/U0oewj3WZ3aeexTpT8AlOGD2ECjsb/SzdfVFEO12K62ikS4jrpumV0KYCpQf8uKridQPop7oIUIBPlYaRz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjRBR090WWVyNXIzUlVncDFjYjhlQklFOG1VNWVwelJjL0NGamU0VFdtZXZ0?=
 =?utf-8?B?d1BES2poR2I0bnFPNkV2cW1IOGZWU3NZSGJlY3dSWFdpQkVSMzFQMk1VbjFm?=
 =?utf-8?B?TG43R244V3BIZEx2UEdxbGJZYUxsa0pmMHZlck15dU05MlB6Z25NRnFvRnlE?=
 =?utf-8?B?ZS9kTHpxdUVSUEtBZWkveGFCdTNqYU5ITjhSbzl4ZWxYZkVhcnlpb3QyazBh?=
 =?utf-8?B?WGRuNWFSVFZGMXVGZkhqckFEQVJhRVA2VTdlNVJudi8wdU5DTXRNQWw0Qm4x?=
 =?utf-8?B?TDdVRU5BRGRSU2NiYzVoZ2oySlFUQVI4ZUJBYk03YW1WVTdBd2p3WC8xb1cv?=
 =?utf-8?B?bWdkTXdiR2NHeUl4YVFCeGsvQTJ2NzlWdEtWRGN0OGJEZWtCa1BxQ0NELzlY?=
 =?utf-8?B?M3dwWDNQNHF5Tm90OVBJbmlUMEMyb1IyQnBYa29GSUx0c0tXeTNHZ2ZSbnNU?=
 =?utf-8?B?YldqT3ZqOHRxbG1BenJCOWZKalp5OEdhSDltSzF4QkVQWW1NY0xESXdjL2t2?=
 =?utf-8?B?ZC9COGZ5ZmFPVUNQZENOMDFCbm9DN3V0QnVqOE5xYmtXQ0N4MjNLZlNMZmFD?=
 =?utf-8?B?OUVBNzgyMXFBZmp5Y3RubnZlWWNsNTg3SkphZkdWR3BFNHNpNHRFOXYxQ00r?=
 =?utf-8?B?bjhOQ1NlNzdFSFUvck9zRllrQUVPWEtHM3lHV052ZHNrN2ZkQWJFbnBZdDNZ?=
 =?utf-8?B?Vnp4MkpjMGRlVERvTHlLamIzWGFyNjhuanpkZkI4ZzBpN2xwU2pXejVnWXB4?=
 =?utf-8?B?SXJOK3RSblJzS2xpRlJJVURxeHMzVnA2T1lEdENvRnJWNnFQQlQwWHNhMnE1?=
 =?utf-8?B?eGpSWnJFQkszOTZDRStVK2tmSVZETllPNXRydythNWYwNjNBTkx2djZCZXg2?=
 =?utf-8?B?a2xhUnpjZGNiT0tKYVRsNFVjaGZaYklXdW1vTk80VGJZQ2pPZis5enJaS0VP?=
 =?utf-8?B?TXVqaFlHRjJEU0RBRHFLcERNSGxUbWJmSytqckxuL0ZPd0RMUHIyNHluSVF1?=
 =?utf-8?B?SHZUdDl1Tyt5RG9qeis3TUdBQzRNczhUbFlCSm92dGRma2R5dVVjUDIzaVM1?=
 =?utf-8?B?TXdXM3N2Y0pPSC9nVFprT0cvaE96Z2ovQ0s3c2Zka1BkSGZnR0ZZSlZlMEl3?=
 =?utf-8?B?S2h4MUxFMW1JQTJlVjF3bTJkZGZDMWpneDdGMldCWjI5em1GVEdFSVBRdU52?=
 =?utf-8?B?T2RXNi9RN1lNdnAwUHdXUVhGTEFZRE9rVWZjRDFyL0FCanV1RUIwY3Z6SEdS?=
 =?utf-8?B?aTZMcG1YUXRnSVJpbWRRV2JUQ1JYSXhCT0JoTzJTMnUyTDJSb2hsaXNLOWFy?=
 =?utf-8?B?VU5OUmJmckxkNjc3SFdDV0RjZmJIRUJvOE41cmliaTIyMytIcFEybVdhYlc2?=
 =?utf-8?B?b05QMEk1MGlYQjJIVkswNmlyNEhUTGZsNVZtbVg2RnpHNnhnOVNOZm9CNzRN?=
 =?utf-8?B?UmFmQ0lHTS9QN2JpazR5QXhnVXFpYlJOUWs2YXJjVmpTZzFzSHA3VnZrdVlj?=
 =?utf-8?B?NHR1TGVUZWlqaStVLzY0T3Q5Z3BWVG5QTVR0RzZyaVRJeHFkbWlXci94LzE3?=
 =?utf-8?B?Kys1WTI0N0laVTN5OXVqRHRPTzBidTRHc0pPWVd5SVNqbFNLZmd0RElhTXNJ?=
 =?utf-8?B?a0IxTVZZdFNDdDlEZ1JKT25hSmhjRDV6T1pLY0ltT2s1R091YWxQMFZidERp?=
 =?utf-8?B?SFZsNXRIcHBzdURRbjhndkRHOXFyQlRUMjdBakdpK0pjVXFTY204R0o1Wnpu?=
 =?utf-8?B?ZGVZUmx5b04zbVhhbi9NcGRPT3o0QVdZdElXZ01QUXZDRFFkNEt2TFhIODZ3?=
 =?utf-8?B?SXZpcnljOXZieUxLYjJYVnQ2WVEyZ3p3TU9xK3lZTHgvY25iMlVTUzJDVUhW?=
 =?utf-8?B?UEZSUm81K0k5ZUVvVmxabXRxRndsMSsxZDFMTEwzRXJFWjFUWWxnNW9UUUhT?=
 =?utf-8?B?UTgzSnIrQWdxaDhQT01hdC92ckNURnpKNDdRRE1UNDJFSVU4MVRZSnV3QXBO?=
 =?utf-8?B?bklEMGRrOG9neTl0R2o4elpKaEdOQW9lZ3F1c1JmK3N4M25Qa1VQY01rNVFB?=
 =?utf-8?B?R1NJVUJ1MXBNOHJEb3NsbDFFeDdtK3VBUmZ2R0U2Zkk0Qmc4R3FtN0t4L1FZ?=
 =?utf-8?B?TVpscHl6dnduSmJ1ZTNsTEZ4UkhmbXhxTFRBb0RIdDRPeEFZdXI2NkNIelVW?=
 =?utf-8?B?QzZnL3ZlcW5LbFJPMkRkMXN5VThLTTk4aFpOSFF6dWdkQWVxdlF0ZGhOU3Jh?=
 =?utf-8?B?TGJmTjg4UUh2RWtCamNJajFHWERTdEUzcm5RcFV1YWxRejJiaWdWV2ZqSC9r?=
 =?utf-8?Q?8CP+yNtDD3zdw/PWyJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc60d390-1b6d-4b05-5e4a-08deab8005e8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:59:07.8115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlDIrQnMFkruY8ozGxcpgaU62jRaH64JwDL9Z+gNHAALHnHq4MxQ9eDft1m60S+VQbFeknBYuDYQGh4cprA6aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7673
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_075913_795961_B1CFAB19 
X-CRM114-Status: UNSURE (   9.64  )
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


On Wed, 06 May 2026 13:53:13 +0800, Richard Zhu wrote:
> This patch-set adds i.MX943 PCIe supports on EVK board. Please pay
> attention to that it relies on the patch-set[1], and the PCIe1 port on
> the EVK board relies on the [2].
> 
> Both of them are included in the v7.0 kernel.
> [1] https://lore.kernel.org/imx/176649331066.523506.9443864112044699350.b4-ty@kernel.org/
> [2] https://lore.kernel.org/imx/inzg46tc2fwsajxq4vzdyuiq7krzy6xtcg2mjaieninz7zsmgm@mtdjr4tuegpq/
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: imx94: Add pcie0 and pcie0-ep supports
      commit: 43a2c0c0664a14b08a9de6e3d26121070ea55715
[2/3] arm64: dts: imx943: Add pcie1 and pcie1-ep supports
      commit: 7f7b2317069d8a4e56de38606180e60c0969767c
[3/3] arm64: dts: imx943-evk: Add pcie[0,1] and pcie-ep[0,1] support
      commit: d570a0d019a3d84832bfc6867647d3581b0052f3

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


