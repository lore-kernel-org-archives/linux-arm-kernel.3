Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34394CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJVQe5c3M68rzvstWyGpnAxfYFDg9kzXXrAJjm0/A4s=; b=nu2nW70aQH4pUCTRFjD2BKQlcA
	QAcLFiwztBuQmGd5T0Pfo4HhlYG+1i8VGSy52xfvZUL2S9YsXp1laZWayweK6cwrH5tRq7tKcmhx5
	EFQCznU1PvsomE8GdzRExrojav5mHeEtg/gNVU0fFcEzwizaxJGdQh2VZvC3QFXzyAfmo1vnSuX9j
	HNKUh5Ti2YxHvQR3aLfZ8hdjFD3S+aZxidJ/VSFKaPFfl/nmjuAxfje3uuG1dd5o9p5zuRbxE18IG
	F2MwCVHK87xTWfnlDohviHxQMc8aAZxNJXDb9JqjuKzoMHDn38ULwC88TlCj+VjF61z5lgn1wwM+0
	4hPAIhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUT2z-0000000Db4r-0lFH;
	Tue, 02 Jun 2026 17:37:01 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUT2x-0000000Db35-0sap
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:37:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gb6dd6HXSgqJ+fKVWWHIhkgxVDQW6VKE6Vk1LyZBOMFvoE0uhXK6lJ7Zjfv8OCU12YkKE+jYEEkTCoNq9pG21Jio17NGNbXSynH9K8oV/hJjjS91FGqEONbyDyjxhfsUwuAt/pRL4I/+aZX10En+/AcHFCpe8I3GO0VcWLqd4TLV8HJ+lk7kYyplko7denyR771+tYrRwhSUY3EcO/FJFflC0PkFOkCbuqqJQ2v0bcoJA9KyTiSEQIM3pkhwtm1Nv58o8lSQvtFEYrcyKZmmHCVBvAmoMQxRw/I2wSkTLgNg+HptbTlF/NDewYXBdaYrqzNrgi3AN+DduhF910jkbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJVQe5c3M68rzvstWyGpnAxfYFDg9kzXXrAJjm0/A4s=;
 b=nrfiC/QKfZwPhdJnry1kq8kujZf/PkIijPJqUIAfM8lt3sSaNwNZNzsB6JqdP+buDlBkYVIu5ovR9zKcsw5Ty3Up6zc0DJSvNph1pyZeXZDLr/OsAi8fPEgx1ozHxhJUguVTyV3XlsRyIeLF2nxqgWl6GrSK7WqLM0GyBy9KQeR8/d9CVHO63fJi8VtPLsQZcR43oJHL23Ii1wZKltKb0PjmhX3W2ToM1tc2GV/CmY4SqNuSeLLokCTMh+RT4TQ6TnHHLyZBmTiAu7aMSHLIE865miHERdAOEohxXNbcE4nT8tzaA3Y7PGlsUWUQKGncnzI/kuB7cHNst1YkfIR4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJVQe5c3M68rzvstWyGpnAxfYFDg9kzXXrAJjm0/A4s=;
 b=V1Ds3I9v3P7Z/ZEgcKqMMcHYR95SmKZHl++oJg2nCD9z5tyhJigYlVPK5ze1djzOVBPVkSn0I5y3vvZxQH1SSLxeW3umhZK9GLBd9Rg/FCuR1nx8SMxKRV9KTZfggHUazifWtW7x68U+c5YqXd8iuuJHFBndg7R4sjSjuBcI+h+v2Eruf1a1o+uTeVKZmX7e3al3YtlODbkuR3fJ6tBgAOszFP/ECV4DpvrvJLPu7CIRyyCwFQ0saKG1XZ2rOlYnOGFcCZI369er/7xNKl1GTWbkso7x03zMy3lojc9vlG/CoQ918i/6pyWWJrgYDqDnMEKzNLcbMYRlPcRGmXP9XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10702.eurprd04.prod.outlook.com (2603:10a6:150:211::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 17:36:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 17:36:53 +0000
From: Frank.Li@oss.nxp.com
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Frieder Schrempf <frieder@fris.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Annette Kobou <annette.kobou@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH] arm64: dts: imx8mp-kontron: Fix GPIO for display power switch
Date: Tue,  2 Jun 2026 13:36:45 -0400
Message-ID: <178042180222.3440036.9442732960327112305.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528101556.75926-1-frieder@fris.de>
References: <20260528101556.75926-1-frieder@fris.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0137.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c2::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10702:EE_
X-MS-Office365-Filtering-Correlation-Id: b39092bd-eb13-4fc5-2023-08dec0cd88ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|22082099003|18002099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info: 6QbAQouUyFaVTvhpWn2l9v9HE+dLBx1wJb9NIbGZ/61BEJ6shaE3BxGJ/Csu+T81NzZhKTLjRk/rK/eHMjd3XZbH61XnUaakK+h8cpFz6MEF0hJMFQJVdE1X/OWQMTZ2tBIzN6xau106QH1TjfXqses97HQ69LrkcRxmNuhhDFU97K6hn91v8vKpuyS5B1HWx6YQZkxAU7basiPNMuZSH9OV0r4lQRM3AkFYwD4tsrgkAI3ifk5C7CJ5PW9zKkPY927qYje6R6WmgYsSh8ehOoZ1kTmZT86C6EH/8+DjZh/7yNWjgPJ0SrHdJ3rd1Jv1CdNydkoJQNyX5WGz2uaBMIaM6UnxZseXvGTTr50u/tVgdQ4pRhGWG0jdvFEz8/dNzYMTnBEEI2BcwsoPZc3BjdzB9pjKk9sDwv8trrJ8bVJbWJH2zXJ28oQp/mOkaR0G12BPhXJNUyCUKGuGxDXZY8UDgYw0DY3n2vdcsubluQ7+EvWmaI4uvPUUmoJ3TcxR1kUcCcEU82RX228itzPrqnere0m6pKrIsSReCEImGIrYndH3Gz6beY4wcnX1Qs0D6W60GNafLoCrVuudl/0Xh8hXeiaA9oCS19wZrF3S76jztFIXSbTNIuNLpMLrASZqZ2UbRfsQ/T8h6z3PnyB8uyatGiOn3Vf0lPTdMe4rk+gs0CaDdaGfyDZ7jLdOSucXBIIpAYOdiuUaHj9rNZe9wzAfRODbyttuhRv/DUAH8ow=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkhDWHp5VUQwYk9VSlU1Q2RKSnBlQVh5dXdzcjVFb3Jld2Z1OXo0NnRQWmdB?=
 =?utf-8?B?Umw3VHYrUGxzbVQycHNZTlkxcVUwbGRhRUU5RnJKdy9lZlNxSElIRG5zaEFq?=
 =?utf-8?B?c2tVUzRXa3plVWV4NjcxWDNkNkx2L0Uwei80S1RYTnh1VGNIcGF4bXI0RFNs?=
 =?utf-8?B?aDVIcjlJTDR6Tmo2WnpJcWVRZ1pQSUNOZWx3ZmY3RXlVQUJ1SVFzWDlwTGJw?=
 =?utf-8?B?ZnBZR1pLVVRETUdJdytaZWFTdUtxMnhzSVFLYmlhcWlaVHc2VWRXM3hRV2xu?=
 =?utf-8?B?bE5PY2l2SmUwK05pRDhhOHF1MXVLM3FEQnYwbHI2S01GWFhxQ0R0dHpjR2FT?=
 =?utf-8?B?YmlkVncwTlJBK3RJTHU4VGNaR0w4NGlJc1VBWmdsOVZuTFEySlpabURqS2hJ?=
 =?utf-8?B?VjFPY3ppZlA4VlU1MlVXdm50SGJ3VVVESWFvcWJpZ2FyOEVKcVpxRDhBTHRk?=
 =?utf-8?B?QUZSS21oMFVvTTVXODBBbmhlZlYvbGRGQ1NvSjNOTXBqYVI3eHNEWlJkZnJI?=
 =?utf-8?B?V3d5MTk2SVRjOWNoL1VuUDlmczFEVEZ4TUxscXNuU0ZrNG5pKzFOeTl3eEFS?=
 =?utf-8?B?YVNuS3JrdzVJUmZ2cHRFN1VPbnFLTDA2aEdXbTc1bXNFclA2ckIzUTBUaU1W?=
 =?utf-8?B?bXFBM2c5N2lNWk5CbGxsMnF3Wm11L1BGZkRudVZjUENaM1FSazhBU3gyV3ZC?=
 =?utf-8?B?YkNjSmYzS2o1Q0hhUERraFNPY1Q3aFdrMjVQUk1FN1VyT3ZUdWkwMGJNSm85?=
 =?utf-8?B?OWdnNFJHU2YvWHJtN0Z2TTZZUzVXSFdNejdwMzdCVUNkdWE2cW9vS08zdG5h?=
 =?utf-8?B?aUhaZHlmb1JYTTF5a1BFMjJQS1BpYmxuYnBKK2VFYm1vVndNeUxvSUl3ZkE3?=
 =?utf-8?B?NThMUVNMWEZ1WjB6V3p1cm94bFBiNVF4TGJScjRBRGxWMGpIeFZ6Mm84N3Fw?=
 =?utf-8?B?dVljZXBFY1hBTWlrTzE5TzNkSFVKOGJDWUZDYmJtbkFaSEdVK09YTnFJOVR1?=
 =?utf-8?B?ZU1PRnBCdkxYY2k1OXVBZ0tXNVpGL1pjMnlmcjgyRDZXTFh0cDYrVjJrSGFj?=
 =?utf-8?B?dXVoRWxwdng1K0ZlcXRiZjE1cWpOMGptUnF4cFZ3ZWtmT3lNdzNHS0xaRFRI?=
 =?utf-8?B?VytJY0xUMkI2RGRsWWU2MGcxaENKV1Vac3haM2JjSDdUQ3ovQ0I0SVhqYUhY?=
 =?utf-8?B?amxwQkQ5Smxnc09Ocmh4QUdNTGVQMG9KTEFVMlJ5Tk5UNWlxbzdBV1dMeHJx?=
 =?utf-8?B?bHJjbnFsZFR3WmFLQVBhRmJkMGFVYXh3NHY0eW1CQmtvRWo1ZjBUdXV3Y0hU?=
 =?utf-8?B?UGxHTkF3MWxjd1JPZUNzWWcyblFQS05jTGNLR3dUNHVyUXhicHYvcHlJWUx3?=
 =?utf-8?B?RHZ0NlNvZXRPTmhIRlo2Rm1yOVRiVUdFZzYwT29kdjEvdVMyMmoyZzFKYmFt?=
 =?utf-8?B?eUZVN0Q1R0JKV2ljUHlQQW51TU9aSzR3aDM5eGRqVWR6dHhTdDIxRG5TKzQw?=
 =?utf-8?B?Q2VOU1BmV0c5VWxxK1d0ZVh4SWpFcGYraWhzWW1sZzVXZ1gzWXY4ZkliVnNH?=
 =?utf-8?B?M3B1cWVIdkpQSHM2OGcyb2g2Z1FKblFyTFl5TkxNN0lkMlhKcWxPb2FTVFRV?=
 =?utf-8?B?aWNJRGRhME0rNUM0ZlZOZzlZTi9tZHF5VmpQK25JRnJKeGxTeFlXOEg2UU95?=
 =?utf-8?B?cVhtRzh2Z1Y1T2g0eU9UVmhvRVlxdDlra0NVa1NtSVdUZmM1WnZlSFM2WWlK?=
 =?utf-8?B?akw0dERPUGM1VmNIVGtyNWtTUEpBVzRWY3Z1U2lUMzBCQzB6aGZMSG81ZHFV?=
 =?utf-8?B?MTlDUVhaQ1lqaWs5Z2h5SHJGdUxEdVh2bFB6NU5ETjc1SUdBVU1NUWxQUnpO?=
 =?utf-8?B?SGdlVWU2bm5ua2FtRitBYUpyZnY0S0QrdjBCVUNtL0ZxQXJtVi9qc2hhUlpw?=
 =?utf-8?B?Z1U0MkxEZ29wVEZQVldtcyswTWYySFFIdUlMM1JuMDZ5Vi9QdzVnM1JldlBy?=
 =?utf-8?B?L1RVZ041d1NkcFdTRHZTWENzTnk4cnVWVXFvL3B0aUcxK1pjdldYcU1hamJG?=
 =?utf-8?B?NSsrMG9Na1FvZXVsYTQyZEZIUXVPYy9sUGtpeTRvUXF3RjBEYjJqUnFGUHU2?=
 =?utf-8?B?SG16ZzlwRWlxNnA1dW1IL21makZJWW1mRGJQYXR0cVlndG81Sy9QQjdXLzF4?=
 =?utf-8?B?OWlpb2VPZEd0a2ZkNE5ia2Y2UEJIaGE4NUoyMFMzeUlkZ0VSZ1pXakMzbnhw?=
 =?utf-8?B?R0Y5THQ3cTJVaUlmUWhrRnpoVGZ5S1VzNnRneHhsbTFNdVE5SHlLcjNkRnVw?=
 =?utf-8?B?WjJmMEllS1RCb1JBblN1aStpNGZXVENQUXhJQnZqSUt2aFk4Mi95VUYwZUhS?=
 =?utf-8?Q?rA+LKRrEf+xqw2TU3PfcuOQRbvBWKI3bNTxiQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b39092bd-eb13-4fc5-2023-08dec0cd88ad
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 17:36:53.0247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PjYaagklYnNZFvkSv7JIp8R4PkWL+zGNPJvF7CZSES7ObQco/YGVbD+/2Rsdy8jvH/as7gTjMKuXtWqGb92eb72cfhwCddEyVi/UiTvH7HijOKYb/2lXwgIw85S+U9TA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10702
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_103659_262899_D9F83E47 
X-CRM114-Status: GOOD (  12.40  )
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


On Thu, 28 May 2026 12:15:56 +0200, Frieder Schrempf wrote:
> The GPIO that controls the power supply for the LVDS display
> connector has changed between early prototypes and the current
> production design of the hardware. Reflect this change in the
> devicetree to properly switch on the panel supply.
> 
> This was working before even with the wrong GPIO due to the
> bidirectional level shifter used on the board which drives the EN
> signal high even when the input has a (weak) pull down configured as
> reset condition of the SoC pad. As a result the display was working
> but the supply was always on.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx8mp-kontron: Fix GPIO for display power switch
      commit: ef64f97227a44177d68206cb88a9015897e34571

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

