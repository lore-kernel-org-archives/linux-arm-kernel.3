Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46281CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 21:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7j1RIeWXFFkERxDoi1YTZj9Yg/v4yEl0amaPeV9rwU=; b=JaP0+Z36gEwTAc8YkxvzZdfMqq
	a9edy6eT9IHScN4jpkOuSpO9s8/Etro8mb2XsJFH8LgK8+7xqXFTVLQcq/tFpiMfi4sA9OUcQSOO9
	R54qZeE0RN6DivlbmT3n+u53TW1ZUHJ7ksTKJ5PXqmcgYcHpVbnEjBSzJMZf85MSBunnpssC2mFLq
	s7SPutdfhSFf3YfnG8SIJ324xQ7VFbhJ0j6RtBEKHoUdM7qEvxsTfDhU2duVYsFaT/nDfP5SDd2RU
	8GW1scVqVfg44saLDb2nVXHsVTzdfX3aXDTkH5NjjlCkt0Wvp+hQkga/kCXwojTWGo7JuxMCc5PCL
	36xvncSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRvb-00000002pqU-0K80;
	Tue, 19 May 2026 21:24:39 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRvY-00000002ppq-3eic
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 21:24:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cbi1ABCYSnhWXNE3FsNvnDdBxIyw0aNLDmPywi8+seEqrczMgRonM49OMxCZMPVA+dW1UN+f5Ig4/DcIt3laQ3v5H+lzyEcxO4dmYdEzpvDHIGD1Q3dCfzOxzuMj5i8puJXT1z756/BpPQDgxWkFXhCzaJXDiBuFO0TCJqtq6l1EZJ0cW00hpgi0o0jysV5PrQF9AwN56t6elBz7rbSEBBBI7kSHSkhzLK+c3QkYTDkVcGjGBe8QAGHU6guPvuY3bJZaTjaWJQ5HAlrZMzQWn1dFjuxpsckr3wa3x86U1QBjRmrXbmcUSTlKEt1onoh5ikZVyXAR3hEOxAfLxXYk/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7j1RIeWXFFkERxDoi1YTZj9Yg/v4yEl0amaPeV9rwU=;
 b=C3+VV5ABuyAYHoh1WUgblv3vi66jurAsXeyPfVIL1TBwNHYiKK6odJ82npbgZSogGrHzVnufNm+MJ1Sgn/R11gP+rCHRpRsm7f04cKTPbrD7XBA7RwDldovkw5u9WlHoyeZhP660OjD+Ioeu+qcTTBY1olGW0gDWKl5wNgT4YBtCwYmtJN9p5NdIPGDHqt+Xq6QT/Vy+Ti9ykVSm328vXwRxvAB9UoKwRpUScf4fZWd4dTa3rzoAF47sDiKt+/3t7JHgsSgDo9HEn1ROw+MnYaZQzpY+VYBSwTaLK703h0Q1Of8O+JLOdJYUnhgGZ5w+ouOasqMV0N0P6jllzzz0EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7j1RIeWXFFkERxDoi1YTZj9Yg/v4yEl0amaPeV9rwU=;
 b=KvFyEDGHjJQLwJ5p/jMDO/rY86RqXTV67RouvoEo32EIPuWvf6rnk/Eo7IVBIF93yXbxLgPNF6iwBWCiiuiXvYBXpydhCmqlnjw9eiXZ6qFkFZwwsmCRpia4cTy5gSReHmiEPLL8Deuq4GVTkv6DPbnkZqgqCeadYUOP1u2627g5CIGHrUi1VHSFoLD6ihQ9GZLf+J7Q362xDT3SDy6tqFdNdUf++MjkdoqbevssMTLg5EFpCMb05BHRor2UANtgaRtlWAmZQmXgF6mM/l9nbstTbpTJDuinsH8Z/NECmPlN9E7BVUvg13iNEojz9fqSe+FY1RYEOANQ3wl55jownA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7762.eurprd04.prod.outlook.com (2603:10a6:20b:241::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 21:24:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 21:24:31 +0000
From: Frank.Li@oss.nxp.com
To: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com,
	shawnguo@kernel.org,
	Sherry Sun <sherry.sun@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: imx: Fix PCIe EP vpcie-supply properties
Date: Tue, 19 May 2026 17:24:25 -0400
Message-ID: <177922585671.3340498.10763283261621159089.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260509015411.3218700-1-sherry.sun@nxp.com>
References: <20260509015411.3218700-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0110.namprd04.prod.outlook.com
 (2603:10b6:806:122::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: fe8f10ef-53b3-4406-12f4-08deb5ed0445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|56012099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /D6N4OHoZsd1AE2y5Uu14A7tA7WxtGiYUJkYlRao953bAHAJBWA4736Edo0e/KQXyqNXDYJqMEGgPbucCXeyaHtMhTt+mBzJpFga7d6tJVDe8OIEE3QFavXcv7UEPn6Oc/cXejLTT9DuKdBO0gr54KfLjtUsAdYQFIA0SqBapnsJYLlUVzR49WV2o5X+wxwevqgrvT406VJuJawNCLs9rCF8H+iJU2cD1TIvMwjsBhHhNPYTnJ88+IxUE5l8+98FkPBey8KLpCJsC3iR9yXjaIy6jlctqDdj+Ujg6lK7MNaCzF5xDA3JNPR1QYcZ7Tp5T1gHiEsvg1VDVtJRcFX815GJjjUsrM3wcrXp4Q/jEipElMi2qRBFaLzJWHYNmvIL/HjXHHJk0IHCwuij7AbgeEX2SjyBz4Z+mcudlApuV3WtF5dY3AXFoyEu8NDJczsyiIREoy8ofJl33I8t0ew2C+kw4cmXWqBpRoR+LINrIUiZtEYM8gjvLTzMV//4ECRV+Il6YRoAWO9y3WlSesTgrolB+sHNP/e9W5eO8+Rf5IU7hXNATsWpB0fZ/BTh1hBP0I/zInsKu/mKsAGQnXFeE//v9/k8njCm8oSjhM2dY4e3dggMrgY+FU/3h3OgS8zfjB1DGKPvb78Ff/sLO9CG7Z2ECZKY0y+MGNxPGkyoe0eRw0d1fdMAOc5tgbp398yq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(56012099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUxXNEhabXY3RmlTY3UxUWtWcjB2RXBWUmZGRzA3U2NrNnBNT1JmZERHQnFj?=
 =?utf-8?B?YXJkcW1jWWRka1N5emJNMUdVSkZmeGM2OUVocW01N2wxaTd2ekxGeno0WVBt?=
 =?utf-8?B?dWsyb25yL0d5M05MN21QOEhrcGpsM1Jpa051bVcxSFA3ZzZCUnpFSXdiVHUr?=
 =?utf-8?B?bzcyaWVYMTFqYzIwT0xMSzVsWEpxcm1ZQlowazhlS2NNbWh2RkE4WVpld0dv?=
 =?utf-8?B?YUJIL21na3F2N21BdmhteDl3eUI2ajFiWXhGaHBWUHlmSkN0SE9CZ21KOEUx?=
 =?utf-8?B?KzN1OFBtMS8rL1ZHV2Z4VHQzMFZlVThvWENYbm9hTUNBQjZ4TG1idFVBYmtD?=
 =?utf-8?B?TTNUTVhPaVFudUhsRzhXTW85ZmZvWm5PSnhYSHZ5d2RJK2RWa1RUd0xsa2Rv?=
 =?utf-8?B?cWZWeDlJZmpva2tNOEdIS0VRazZqUWhaODVjeDBwNldxWTNtWllNQ3Nkdms4?=
 =?utf-8?B?RnJNbjliQ3BGbzFZbE1hby9WcjU3YUd3dTlGQmttQ2QrOG4vRC9YdkdYTUNY?=
 =?utf-8?B?OUx0VEpSU2JUTzRPU0I5T1VMOVRpZ3FVOWRTVkJzMDg4UXBLMHJZbmR0SUFy?=
 =?utf-8?B?aWdFZGlSdzdhSkFrQU1OTnZkSTdQNkRZMTdEY0RxbC9JZTBFaTBHVEV1cER3?=
 =?utf-8?B?TzBCaDkzTVZUd0xEdEwrS2p3cTVPdGV4V3h2R2ZjK3VOUi9RZVpRWUxhL1cw?=
 =?utf-8?B?Rjk4NjJYRURaRzBlVVZxb3AzS1BSbkhPV0VVbm04b1AzMU04bHhaY2tDemtH?=
 =?utf-8?B?ajdxM0dQRmJsUE1BbUVaQllNTmZLRVduNk9vbHllZEEwUDdzbWxVazhUdW1M?=
 =?utf-8?B?YlZvRGdVU09uV3g5cEhvY1ZqMFdUNksveWQxREd0K1UxMHl3MkYyUHBaRGxx?=
 =?utf-8?B?TWd6Z25oSlpnNHUwa2xzdTMrclFMaytzQmRteldJZkE1ci9WWWE4dFhJc1RR?=
 =?utf-8?B?ZkxPREVxNUpHNHJaSmZ0VDVoS1hxR3dqbjVxajhqMlBaS3lmemU2K0lIMGc0?=
 =?utf-8?B?RW9SVDVkY1dNZUx3ZG5CMVJWZ202OHpaT1gzU3psYXJMVXdadHJNTTFvYlF0?=
 =?utf-8?B?eURyS05ueElXVHVkR2NBM2hYanpXNDJNQzNySzdPeEREdTNRdmJQNHRBVjVh?=
 =?utf-8?B?Q1JBQ09adllOS2lGOXRoOWhPSVZmeFFGNnVoRlVCbVJBS1dodUt4djFzY1oy?=
 =?utf-8?B?aHRPOHgxV3l1RzNRY29zUDhNalpDZlB5ZDB4NmpiY0UwRWtNR0w3VEhKZ3Nl?=
 =?utf-8?B?ekFEZW9VVnlldVVERnMxMzBJdk81SjdhbGlzWnpVK24yMGQ0R2l1U0sxN09J?=
 =?utf-8?B?SFFRaHBycDVXeTZ4cEJqOUFqc0NqdG1UTURpUXAvSWFpZC9yVmpUMlZIajAz?=
 =?utf-8?B?UGRoaWpOZERXRHExbnlwamZTYkxrZ1RqVzY1NU5KbkgrM1FMSkVyZU9yR2dh?=
 =?utf-8?B?TWlvR0dDR21ERVNhU28xTm1pdGFkdVkzOCtpV2E1L3pnZnZSNGJ4bzdEaHRs?=
 =?utf-8?B?QUR4WVFnbGtnZ0M5OVNPVnRLZGgyY1hWUHdQQXg1WUpvNnhORUhXTDQxYVNG?=
 =?utf-8?B?Z2k1cHNxRkpnWUhLK2ZtbXRUTmRjdktWMlVHUlR6VTkwOUxRU2ltWVczUjRi?=
 =?utf-8?B?UWEzOVFPeHZzblVkdnpTUWVFYzNTbVVlUmQyaGhNUVB3cm4rb01ZTEJoWmZM?=
 =?utf-8?B?QmQ2WXRCL2V4dkh1YnBHbkx1SHZhY1krTFlnNGl6RmVMb1JsL0svaGE0N3RH?=
 =?utf-8?B?Wi9PcXlxVjM1anJuM3ZZV0s0TFpXN21LYUY0TEQzS3pGK0ZLL3k4bk1hUENo?=
 =?utf-8?B?SzA2dHZRdS9CMExnK1BRYkRHN0dvZmczTXlFSnNLQU1raGZvdHlzT29LVmlR?=
 =?utf-8?B?ekE1Q0dUdE5Jb1AvUUMxYlRqZDJxZk85SlE1NEc3Q1duUUFrN0FQcXBlYWsw?=
 =?utf-8?B?aFFmc0FiakpkWENFejhmTXkrcW04UEg4aUJGWGJQYkc4L0hHbWRnVWxrYVNv?=
 =?utf-8?B?aVFoV0hYazdkT080OEU3VU1HTzV1MklKZDFOalBpMEM2dnFsZ01ITnpaYVFZ?=
 =?utf-8?B?dXpGQ0dxQlVGQ1pZRkNHZjNZSm9iQm9ZOGNkcHdMQkl6VjhKaHpDTFl6UCt3?=
 =?utf-8?B?UnZRWTlkdDlDVVpJT29tTjF6K2JSZFlLWXpVOEdCUHd1Vzc5L3huU0V2ekZs?=
 =?utf-8?B?empsQkxxL0ZiTG1CQlRFOGlZSHJoeHRzYnI1UlVwSVl4a1E4czhvc1U3SHRn?=
 =?utf-8?B?SW1SWDZmSHVJR1lwVkJjOENTeGc2Q0J1Q2R0RGhhZ0JFQWxqTDU5cnF5cUQx?=
 =?utf-8?B?SFZ4SmxrcGpHMmVMRWY2a0FvZFFid3Z3bEs4OU9SdGNLd3dFcEYrcTJnNnNk?=
 =?utf-8?Q?zG5W1VaZBHcazXApHKonlRHqADGf7XA2sevA2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8f10ef-53b3-4406-12f4-08deb5ed0445
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 21:24:31.8725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIFbT90ANh+DaeU/TFEZtKDJL/mI/waM8mBwU/vxSrTBQMZXgAvL+lC8AqeiTlcI56gkLWNZRuxesttcLHiUH/kZyBaJuryW2N0vC69C/18AAOwf+jY9cBCtyEWGvwjm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7762
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_142436_915253_BEEF4C03 
X-CRM114-Status: UNSURE (   8.45  )
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


On Sat, 09 May 2026 09:54:08 +0800, Sherry Sun wrote:
> This series fixes PCIe endpoint mode vpcie-supply properties across
> multiple i.MX platforms.
> 
> For PCIe endpoint mode, the vpcie-supply should either control the
> actual M.2 power supply or be omitted if the power is always on and
> uncontrollable.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: imx8dxl-evk: Remove unnecessary PCIe EP properties
      commit: 538525f34158deb21b782164bde23ec07a353e4a
[2/3] arm64: dts: imx8qxp-mek: Remove unnecessary PCIe EP vpcie-supply
      commit: b5ba136d535f1060322af31c0cf74d85ea19892d
[3/3] arm64: dts: imx95-19x19-evk: Fix PCIe EP vpcie-supply
      commit: 596d0f9f4fefffbf783ab26cfa90cf50f5dd6bb0

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

