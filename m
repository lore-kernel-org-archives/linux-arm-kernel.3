Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91696CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 20:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:References:
	In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o79GJRkhQn6HUuiYdy/uilbPD7kMMks0zhkJ6J4+GZ0=; b=ynjhsk7ZF7NFI4ygPou9txSjUY
	RoU67MWH3LmRDlmYfzMn4FFZMFS9/zCrfOdzs8UFPJ1C9jOaTdhid3eC2D1eu8wUqgjMQVdTreuEc
	PFQ0KnoAyB6WTngOmhpMoQ2ps5018qgQCwmJff95W/hJ7KM7mZDORxnHroeBuB6E+LQb9I6eVT1RL
	nrSrG5GW+/XOxgJSnLCyv409C0E3vD8sEIbM04SvwwuVU0fqgA9P32+ctHZu/4ZV9QzQkYRW+8DHP
	tuZawQdNQjTYDZbSG9bWLDakpU7aHxGG6N3INV5U2IeaGwBU646d6s1b0Im4X67e7ynDmgt+am3oy
	cGm6ivhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKMDv-0000000HPQD-1SrI;
	Tue, 05 May 2026 20:18:31 +0000
Received: from mail-westeuropeazon11013069.outbound.protection.outlook.com ([52.101.72.69] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKMDt-0000000HPPL-1N1h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 20:18:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqfhjrldo5B5IFLp/4EcogVGpXpXD1N0/Ub+osiG9bSZviT36+1xdbyei3l89uIhSJyld66OJsw4XZ1wVYfQz1d85kn4hGIKj4XZKYOgsK4E2hMzjEb17882bezHWJs56kN54AMhsZdtdYrapRRVxRmGj1g+ThQWp6o6QSat0CkhUIycXq5Rn/VwBnopfhJvYx08nO9J1icnG85DU7wL5U/u0m4JU7wTuTJnurejmNIh+tuPYVTTpFjfsD1/7ppukmYUUYpTu+TkgRuSbc54aArtz5S9PrciRoZ1JiS0Ozf45evN03EeSHIPKRJPSpUatDY1r+zESLE1sat8DurHzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o79GJRkhQn6HUuiYdy/uilbPD7kMMks0zhkJ6J4+GZ0=;
 b=TUGLRiXdDnXsM3FUjKzsixMT3VhB5cYA3TMNfGKWE3+UQWGzN36Tsvf8s3oeA7Q48cZt2skqjs7ba+hTzMKfl5RH4OfVJpZp60jqXc3Kyg/sk11B+vn9nxnWpLvGDZfPQznWRGohwbwl4thzpRskZjP+DK1HSgxKDwkv047LyWtG9ObU3eqNiOjrZ8NOjS10X3uvlvMzG0W3YfQErOZWKrasr0nxrUxqm7HeIHejgOTcJDeIvaZoPzZHTcD3Y7PB6G3ZQDgJ3mZxOhI9G5+BnNszUOrd2RI9qb4l0iEfzEr1Mo7jzDtUhKUO+t7mFVx7gDyC40a3f1ALwuaqmdUlMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o79GJRkhQn6HUuiYdy/uilbPD7kMMks0zhkJ6J4+GZ0=;
 b=cffdhjyF5nnjMbVDtsY6ZvhgLH7JojnQEpOQpb6tqG04CO1iPLIoKKE/V4213P2/t5GAsHMWdIHzW+aq60pVeiRcQB+gBvZLBZ4F+LgXnAvF4GMcrLyZCaDfDF7B9BWpaFUhmfvatB+gW07igcd5cA7nWcK+uOJtW0/EX6FIh0OJTXW+6OPXpGyD/Lxf8waOGEhnfiHQsiHEKZylpg7ldVDHFQYD+KRvX1z8/2/WLZpyV56rR0mZ3hptrLdUjSgzllWgkRmoKwuIVecMrN/Rjn51nCbFZkFP/+pVAYVlPksGQH57A+JQuRrPiV2zr0QAbbhqUe+Npyl2UdW9qIUznA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8257.eurprd04.prod.outlook.com (2603:10a6:20b:3b6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 20:18:22 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 20:18:22 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260409093307.56471-1-francesco@dolcini.it>
References: <20260409093307.56471-1-francesco@dolcini.it>
Subject: Re: [PATCH v1] arm64: dts: freescale: imx95-verdin-ivy: fix RS485
 RTS polarity
Message-Id: <177801229907.2086462.13572979869004892941.b4-ty@nxp.com>
Date: Tue, 05 May 2026 16:18:19 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ0PR05CA0114.namprd05.prod.outlook.com
 (2603:10b6:a03:334::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 958530a3-9e35-41bf-5708-08deaae3745f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|19092799006|366016|52116014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qwZyGs1+2k3ZcqS0A+uTHQkUUZNbuov60QyFXvGsuyxiwAyTbh3DiYNN6RibG0/u4yJf9WSOaSMwvTR5F57GwtnhNENiqYUIfpu4Q19TzmDNHHUj946m2wNqRSmX8yVS03JR9rKgnqSRuCWz6914CvmfUWPgel9MhWJkl+AeSS8ltYZpEXaXgrbsW7dUf9K07jQNAW3x9XGU530gjqyVdZ2hW71QmJ0ZAsaqayy+A9XAiH5uRdrlR1b8sxCHBPmokb+UZAWyoceNAAYNu/ARlr4JqFcaua4XE/EJ3Psnyjd4bMrx6iErZp5xTvuDaQuk+z41OBJnbul5klXUOvy/dA1wcZ1tWiKT3Nl6B+0L1mo+kxVmjOXKobmFmqhekH3h3WJfGtFyB4vcqDI246Ne8F1bSDRSRCriIA6+1ahdjmXeBShmHlED8qQqJGf2LL2hHSCdL+ZjFPWHpzDgNBHjjsuq4D2CGVk0ZQrwfNfzhC7utec2VbQCm7R8xe1B2w9akUxvJEPHIqnt1rko8NpA1pylzUvG+JXpgvpEoAKGYspzs3ph22gfxnQDBMekZuBfFQri76VXL2hytrPaVlzPu4Mf3J6TK6eusEtHTpIqzrSgV8V3u2F2AN1Tt7GTBbOat4LDGxdKmje8yctXGr7ycvc42CbzndamdFBueXdE1QwIEPanYO7rQahPL4A7u7KgmV0j7zoM1KH+Z82p/lnv7wUUcsQkCwqxyFPPfCAnRQhC44Xu788esGWAkZKMfmF7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(19092799006)(366016)(52116014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW1wSVBGcTI0ZUdPc0djVTVpTlc5ZTY4NDl0bmxTdnVCbk5GTEI1bnp1Tjcv?=
 =?utf-8?B?MkhvN3d2cWpEZWxHb0gwUEt1bmZTbFF5aXA0aGRSay83SVBoanJqYnVNa3o4?=
 =?utf-8?B?Q2Y1ekc5U0pQZ2hnYXRYMTFuc1YxZzRNTEtMYllqa1RsMW1BQzV2Wjc2dVlY?=
 =?utf-8?B?a1NQQmVER1oyMmt4L2FrOVVJd05USFkzeXhuSjJyR1ZaU0F4YkxlN0pmUVFy?=
 =?utf-8?B?clE5akhUbHBoRmFuUTAxNisxSHVvQjJEL2VDazJWcDNPY1loSXJtWjJqRjkz?=
 =?utf-8?B?T2FtWVR5VHhaQ2dBQzh6ejF1UmVLQU1JVlBRUmxFYTMyalVVTm50TFh1d1U0?=
 =?utf-8?B?SS9rNmZZTVdVcWRuWDNrZFBNcy9kbU9QTWxsUGdFZUcrYU9ZTVE4RTVQd01s?=
 =?utf-8?B?aWhDN0RFbDNxdHNqbWRxbFJzb3gvVFlDaHZlZHVwcEY2WkdXVU5VVThBRGdJ?=
 =?utf-8?B?SGFxS21lRFdpUlZtam5wb0FEYm13NUVzV2JqMnM5QXp4YzZWT016MHRxV1Y2?=
 =?utf-8?B?dUZNUlIzaW14ejdSODFDcHBtUm52SCtMamN4YU5hYXdTNXY1L2RScENkNnhm?=
 =?utf-8?B?WEhOUDZZeHJvMFFaaXFwMzlHWWF5V0NxTkVpbXVGS25KWHBmVi9vNFdwd3lp?=
 =?utf-8?B?bXNWWFJiVGhSMkIzWVRpeGdxaHVLd2FLb1FSVzNWQkloMHhIdG1qb2hMbXRS?=
 =?utf-8?B?K0pYSXVPamZEcmlLeldRc1M4ZHE4U2tEaHFyWUhWUzZQNFNxMGhEVStUNlhn?=
 =?utf-8?B?a1BrNEVYaTArWUJPUXVFckFMenlVWlloaTYyM3VZbkhER29yamNueGxocnRo?=
 =?utf-8?B?dUFmYjNlZzFXc0pVUHVUYVVNV1VXUHdEcUx4VGlIb1dJNktFUFNhZW51TG5L?=
 =?utf-8?B?VlJDSSttZDJ1SVk1OVlNOXJTWWU1VXZ3ajZsNW1aYW1QRjdab0NnbFp3Z2wz?=
 =?utf-8?B?ZEhGUnlUV3FOT1BSckl0THRsSm9DWDhCMjNDNTNkeGI4TEQ4NEYyOExGakti?=
 =?utf-8?B?bjBUUTZjZXVyV29DSjkzT3J1UnpFaGFYdmRNeHFmK2xaS2RoM2xvdzRWSEhn?=
 =?utf-8?B?b01sVE9KQ2M3ckhUMmVqajhIRnJCQUlNZ3lLTFRGNGlYTjdtVUVJalgvVXk5?=
 =?utf-8?B?ZXRBR3c0N2o4SkVLb0x5cnJZWlBUWi8vancwU3VVbWJyS1J1UXVDM0l5ZnBn?=
 =?utf-8?B?czUvVlkzVjd2dmQwTjVxMlc4V3loa3FmZmRjUzU5MUhMb0o4VzEraEpYbllM?=
 =?utf-8?B?M2lEUjBMSnkrUERFazVhZTAwbXRrNDQrRTVLeDJvcWlvYVJRUzY0OXBtcDVZ?=
 =?utf-8?B?cWh6U0ZpbE04cFFDMlpHSGFiMXR0QzdKOUJyNzJSUTBzTGZ3ZXo4QmJoQjhT?=
 =?utf-8?B?SkFJUlZGenEzS0cvb2trSVFhRUJqS2daSUpqRFhXdVFiMlVwcVo2ZStpb0Rw?=
 =?utf-8?B?RVBEZFJyWDc0NnhONk9LOU9Odmo0bnY4UWg2eFhGRkxuSk1wNDJzZVdvOUI1?=
 =?utf-8?B?RnNEMFZDRW5ibG5XT3pieGIvNkFHaUdGMlhBdWRMZFpvUnljRytremswQjhE?=
 =?utf-8?B?UUl3b0lHMU43ZFRTanpibERCTnVyVmpNNXZnekxqZGgyekRmUzg4VFkrRTZM?=
 =?utf-8?B?amN5dk5RZTlFaHJNUFd2WkNtTG11RVJPSXNIRWNQZkI1dy80YS9XeitEd3ow?=
 =?utf-8?B?Z1VhZ1BsZmUyc2RHQ3AvYll2WS9uRGRKZnpNaVpvQ3BuRG9Fek4rdGJRRk5N?=
 =?utf-8?B?ZWtONmQrWUc2akFWdlFlYitNS3diWk9FU2oxN0dhQnl5WXB4U1NUamozbjFx?=
 =?utf-8?B?UWFZOXNuZUdPaWRJYy80STZJOUlLa2srcHhrVWx5SkFGSWtaaHlMclYzQlRN?=
 =?utf-8?B?TjJHcVV4aFNhWjF1MGZqLzYxa2lhalIvdTR3VWNOanVaM1hKZFEzcWNnRWd1?=
 =?utf-8?B?eVdrSHpDTkpDV2Y4bysvemRWTGVFQXllc2lPejl1S0dUV0xSN004eS80VTBi?=
 =?utf-8?B?MEcvNW1YVGJBWlNnVUMvNXNuK0ptTnozNHg0VGZrUUR6TEppLzQyaG9QR0ls?=
 =?utf-8?B?K2FDM0NFOWVDRzVjWkRNdTNTQzBsS0RZTGNzbGJWMHNhZk00ZGdoRmJFRWFl?=
 =?utf-8?B?cmtuRVVMOGVkd21LRmpvai94OURXVVkxOVlHbVNtR3E1KzY0ejUxdUtBWDBN?=
 =?utf-8?B?MkFHWks0QUR5QUtYWnlUT2RlMWFiVXhJdFdqRkFOWVo0SXlJdDhwUWtlUWJH?=
 =?utf-8?B?dTM2Q2NhcnVUeTE5OUlXNndaUWxLZnNvOTlpVmZYbyt1ZkdyZklVUnlrbVhK?=
 =?utf-8?Q?Swm7wR4hGUcpKoswVe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 958530a3-9e35-41bf-5708-08deaae3745f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 20:18:22.1475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQQRtowfL3c7KxMT4JtH15PRs8T/kSBWQN6DxFynHfUQ/wHk10eh6zz2zJmzbcvdjpyXiUHZDl4e6JZ3ssmF3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8257
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_131829_373973_B248333C 
X-CRM114-Status: UNSURE (   6.21  )
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


On Thu, 09 Apr 2026 11:33:04 +0200, Francesco Dolcini wrote:
> Fix the RS485 functionality, the RS485 RTS signal is active high on Ivy.
> 
> 

Applied, thanks!

[1/1] arm64: dts: freescale: imx95-verdin-ivy: fix RS485 RTS polarity
      commit: 9ef3ab7ebe6e41311ba5b24c444e70e1626e91ef

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


