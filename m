Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096E5C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 20:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbS22M6E34LTffOomJ4hiY03tHYwgnkHdzornyxLh54=; b=Q23RjjL0OyMMtq4qu1C2SeTZij
	cRvc7FvbI8a8bXyZyXpFziFVa1EUaF1HZgI+wDumN2gFkePLIvCZFY4k1dbQacOJP9iltczuJf1Pk
	4Kbqdq0xJghwauzkfw5HxiYAOW1Knvx+Z/2mmjyYCzrYB8KwhHckJzn2eOhfJBdxNVZa4zmx93XV0
	zHCFXSATGYsBzdyClognhpBwRenb/pt20gcu/EsRvSyfi30PBqrHFi1hBeT2K4XVdwCN+L8UoCNVs
	zEMknanIMr0pOnjSDu901lxnvmd6tv77o7gaYg/1o7F3Q1hUTF1zhoOvlRT2tM/XAomSCtSKXX2+4
	WtdGcmGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnMe4-0000000HEFF-2RpW;
	Fri, 24 Jul 2026 20:37:24 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnMe1-0000000HEEr-1ym3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 20:37:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ofN5D3xyamyJK41sp6MhO7SzDRF6RZvI4hZGA48f+dlopiF4w6tNRMY1A6WHS9HNmgQdehIRPXnxJjZJYo+9kjABpdR2oLH+RIwYtVBrsK9p5hB9DEjfhs1CXHPqzACQc05UsHRImg4whKve7SchOi06I2nBUTiBxjKJNAz4wL9lVY/YG5F5RJOazFsRXb1t6h7zPL+Je+Nfmn05iQ0Xxebpjqrgs/wHOByNZmDIE9js2eJDCy6c+88TlOHDdk95BgQicy+VSGhgSZoDR2Ajv4L4lfNC1FhEItCUljISXkwueJxQ55u3Yb4kSvIEqvb3EZ0cj4kn5tMBw6OFmg1HLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbS22M6E34LTffOomJ4hiY03tHYwgnkHdzornyxLh54=;
 b=C0m/O8Rap40pqAyjJjrvHUNRzKBhh3Rpr8wSRySo8+BvVFYYjwJOd+2IrRxC5bY5S5ENk+UZgsFiBM7Gftc/fxia6aHi/jON6BKKfY6ttvhnt4snpCG1uHM8oR5eAXLbQYgZNnW0+k6SNFJecmu89hmXpoYYtEJ5c0ufJoy2zbGb5sDexaZHSlY3PBxQA4ZyLNycG1wsIt4MOwEYnMhQuOVgjXA5FgLEpEaPnqWDKuJWpyyJxlxndQxwWcCoQTLzIrw3wKP3EjYgmCZ5hFBqzw8PkfuBBhwC+BKSdvtQ9NS5/kmLMu/YKEc/agsCTKYkEHfCroFN7HTFNNZ2F2NFFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbS22M6E34LTffOomJ4hiY03tHYwgnkHdzornyxLh54=;
 b=IqXObp50G0x3obgTt6FtEvk7Ph10VGTNgMn0HP2IqD4HR7xGQpPVIISIsHOF1xuRXDKuWSnVsaRfuKmWYnH637x5dOPEFjJueuBz7NN0er7v+HPgCDCedYgs9oAdsILp2kmHZL4P8Vu62vne0HzCJbQF8a17efeTvnmHDURPLkSrwy+f2g3RU6RE1SfkjbVEKQX4EY2n0nV+juIEAODFvS2jtsJujNO9oTAI4B+/9DiIwnzEgxm5aBnacXH/Zzf9Lx7OPguiTJ53vVzOPw11OApaMnPn51IZB3lS4orvf6c9QFW7QbcadYKY6hErZi8S43HVE6hj/WB/qSLuY2hbjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9727.eurprd04.prod.outlook.com (2603:10a6:10:4b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 20:37:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 20:37:15 +0000
From: Frank.Li@oss.nxp.com
To: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank.Li@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/1] MAINTAINERS: ARM/FREESCALE: merge Layerscape entry into i.MX entry
Date: Fri, 24 Jul 2026 16:37:05 -0400
Message-ID: <178492541738.3817704.1045273647554370242.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630201618.3497941-1-Frank.Li@oss.nxp.com>
References: <20260630201618.3497941-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P221CA0057.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: 197aac9e-ef61-4b07-45be-08dee9c358fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|23010399003|366016|921020|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: /XCZyTy37ihFbw0J+umaF01Rr4QEhjudQ0rIcJaM8r9HZaeWp6fd0UGFwq95JLnbejlFzwgfpWAwBw4h9osr8aBugZAiazdaAAd4pn8J+OiL1U4jDf9yPOhtWBtOvMo+CEAV0YMzu/aMHTxNq5tDucbOMcfjmMJGMg5wgT8Y5TmyTFOgEc6GMZ6bVDblz6HJcvvfI9oVIeLCGE8covbku7pVUbeoiAuMk1IZ1NPWfAlcHjufsCXi7m/NsrGhzuHF/StvvHw80Jn58SWFXt/ANsBsVOqxlIDvoITbkbOouYJVOIP5UazpLlitiD1JKz7M8G8ZIft3J68UK2iM7I3r9kHnP65ZtSYoTUXrZSP03PlFZzcSUG2J3+nAleYJ59YxlsE1PJ+VW6FguyNzAmGcHiLunEi7Tuo1E2O8nG2XwXyIsuLR5UYlIbX36tMfu+dOs6o3LigjJupKClxb+LKCQ1KBTQKUiOkoHQ3NPoGQa2bvYkRDQqRYefRRblgQp1CW1CEYMN9PRCc11vM2Ed926acneH5iokrr1ZEqnCXYfENXp47qEaFYZMKwmv9yosI0keXaGsuIIsL24cFfXKEM0pWNqad1YbFsIoyypHcZji6TXOPQJ40kWKFegGm6B0Q9NSq5dgS9rFC7Jir86a10bBXnC9ID+TQtJ0OZh79KDuWGZ8aNB4x1//SsoCm9IZRRa8t/P0yWljAsI8EE21DbRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(23010399003)(366016)(921020)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGpMZ1NMVTBRTlA5TktscWcxeXpiZm94b2NWZ2hydTJnNTlIQzNEdGdGbHJv?=
 =?utf-8?B?K21SVldQZFB1VlFGaC9GRVByN2xPdEliT0xqNnBjZ1dVL3liaEJrZnByZzF2?=
 =?utf-8?B?WUZFT2FBcE5VWWtObVNZL1ZlZmFlMm1MVW4xTm1KWEZTTnEzVzBJTExxU3Z5?=
 =?utf-8?B?OW9oRjVRbGplSFNYTXlCL2JzMTkxOFpFTUoxL1RSWERMNCtybXFrUkkvcE05?=
 =?utf-8?B?djIwUkRGdUw2aU9ZSWZpQnpHcTJwb1paZk1yZTJyN0RnOVpSeERuaWV3MGsy?=
 =?utf-8?B?YU92RTBwQmc3ZU02TzZVemJxRTBHVjhHSXBmakh5cGdPQ2dCTEMxWXdKSnRH?=
 =?utf-8?B?YkFLc2VENXVXMFVDMC8xTkc1WjN3SDFjQU83dytMZEEzOStDc1lxLzA4ZTZr?=
 =?utf-8?B?cU1ZNGhjcDlrM1ZMVDREdVN1WUVOMXoxOEg3SWUwblRqaXBxemJoVkNtM1JV?=
 =?utf-8?B?S1BScEpwaTVEU09OaFdyQUJya3BoSnJvNzRXVytpbXhOQmNUVW40SWRxWVU0?=
 =?utf-8?B?SmtpOFg2ODRrK1JzNHFaMThHeWwvc3Fxczkyakd4ajR6bmNPRjRhMitrVEZz?=
 =?utf-8?B?ODRuU05uZ1lHS3ZiSHRlWlA0RkQ0ckk5OXo0Mm0zNzdCTWRsN3NxVVhqV1BT?=
 =?utf-8?B?WTh1dnYxVGNnM3c4NTBEVFpmZ3NmaStHck1ma05hclFQdWRKVjNkY1QxQUEv?=
 =?utf-8?B?eVFtY09iTEs3NzBqL3dhMnBDZW40WFY4U3E0dnEzazlmTWdKRVp2czdXUlow?=
 =?utf-8?B?L0J3ZWx5V2ZwUjVNbityK3dNeDVFQkczNldZYnliVDhkZVJpV05IYysxWFpx?=
 =?utf-8?B?RmlBbDJacDBIYVlkdENWWTVXWW03akVrTXZvTFZCSkZ3NlcxS0NJQVZKWGp3?=
 =?utf-8?B?WUV4M2k2SHlQMmkzMno5Y2w0R24vR1l1TlNnZ245T0pyMGIvc2xHOVN1VGpm?=
 =?utf-8?B?b1R0cnYyR1pwNkM1YnJvS0QwVllGakladzhzSXRjb2ZZSHVYaDZkdWFYYWhD?=
 =?utf-8?B?TjdBcU5GOHgwSkV6RlgzNkZTS0VlUFg0aW41THM4UTAzT1ozMThuRWdwSkRL?=
 =?utf-8?B?UXp1eVFtR1JrV1RCT1lpR1hMMEpCLzJTOS9zZyt1dENFeWE1bXUrKzlVTlUz?=
 =?utf-8?B?bGJQQUEwSEpxT2pteGFvUlRkZDIvTEJoKy9vRFp4TEpwZ2ZCcDdQNFRHcUNU?=
 =?utf-8?B?SDNBTGIzTXI0TTl5Zzl3UGVuNEJ4di9wNW9xZkd0bGR6UUluUjNLUytLc2hF?=
 =?utf-8?B?b1dRUFhwcm8yWExYU3JmUktaRVFObzhMeU1TQ3UveDZjYkpJNGxWTEw4NlAy?=
 =?utf-8?B?S2dsQWxHSVVEVFpyS2xPb2JqWlFFUXdwcGJrZ0MvOEI4cEl2UWxpT0xLN1Zv?=
 =?utf-8?B?RG9YOHBsMEF1ZDQvSnhNcGdaUW1WOHBoNEZObm40bXBvRmxvdDJRTkp0U09s?=
 =?utf-8?B?RHNnTkpKQ3p5MEhWdHpRTmZpaXBJVnYwRS92VnRzcGlJZnE4R05lQ2JFdTBQ?=
 =?utf-8?B?WDg3WENJbnptNVRaN3Z6cEFQMHZadjg4THBnRGlhcWp6SEZIYitvK3lmU3JB?=
 =?utf-8?B?czhqNHh0ZHA2UnRoZGg0M2ttUzN0OFNKS0g2U0Zjc3VyZ1ZFN1YzTXFlZ293?=
 =?utf-8?B?dWp2Uzl2YzJ0akNFQkI5LzJtcGFyaE9NNGpoVEgwVXUyZFdmZkIvWmVHMktT?=
 =?utf-8?B?d2w2VktNZVZCWE5SSjJZa05HNWw3UjdhNmgzZjlHbGN3czg1d2k2WWZxVTJN?=
 =?utf-8?B?VzdvVHZQclkyeEtmNC9CUVVzZVhIdC8rb0J5WG8vMFdrRDJTZVNMVHpCT2xp?=
 =?utf-8?B?WStuZjlDRWpJODlPUGdlS1M1UWQwajdVVk1DcmhDZzQvMlZGWmNOZUpFMStJ?=
 =?utf-8?B?U0NwR0JNZWpTUXpHVVVObU1RZldpNUQ2aC9GQjVvS1Y5K2o3ajJqQmcxaTBo?=
 =?utf-8?B?VkJONHBrdGR0ZUNTTExLeVE0OFNaU1UyVW1nOWhqTUtnR2x3MkQrZjB5L1lM?=
 =?utf-8?B?MTNUQ2Y3VTBwa1p1QlNvQ0thS0pwQ21KQzNNVk5IalFDemdOYk0rdEVTdkhL?=
 =?utf-8?B?cDc3a2dNT2J4d0FENEhxN0dSTEliWVh5c0Vta01VN1gvbkdVNkpobGFQeCtz?=
 =?utf-8?B?U3NvMUg4Q1VVa0tTdklTVkhPTG9UNURNSG55a0ZvVkFIaGxpS3g2Y2VJeS9s?=
 =?utf-8?B?d05ES3VldHN4aEkvc0UwZndUS2tsWi82Z0dDKzFTcXBxYVlRNXRwYnJaVzBH?=
 =?utf-8?B?ZSsyUnF5NzU0anoyS21UVEZMSDlwVm1pdHNEblB4a0RSNVZpU25kUDY4SHcv?=
 =?utf-8?B?S2F5TGQ2SVhlcVQ2ejMzMnV1ZXVzalIrb0RzTnVQOWR5NjVUdFVUUWxtRzhY?=
 =?utf-8?Q?wSA1UUMsX55k+1GvNI5lOEb5VZvlbDBH0bS6Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 197aac9e-ef61-4b07-45be-08dee9c358fd
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 20:37:15.6457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vLD1bg5J1Ln/GZY7x622hQ0nD7MdsGL9pZZWkkoROWWG1Ng3YoO9OA4hEAkSM1gGGb6RBDl7j77v3LgW26rzodmovPWJelwfRFbAdMn1wB4AhBjssy/Rr2ZcZgQkIqE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9727
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_133721_548595_D24613F8 
X-CRM114-Status: UNSURE (   8.31  )
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


On Tue, 30 Jun 2026 16:16:18 -0400, Frank.Li@oss.nxp.com wrote:
> Both platforms are maintained by the same people, and the two entries
> contain largely identical information. Maintaining separate entries adds
> unnecessary duplication.
> 
> Additionally, the standalone Layerscape entry does not include the
> imx@lists.linux.dev mailing list, causing Layerscape patches to miss
> NXP's Patchwork instance. Consolidating the entries ensures patches for
> both platforms are routed consistently and reduces future maintenance
> overhead.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: ARM/FREESCALE: merge Layerscape entry into i.MX entry
      commit: 645effc0984ba8cd83cdf31e5a29945cd40973e1

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

