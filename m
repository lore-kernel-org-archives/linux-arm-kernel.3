Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27583CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 18:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0BxjBZnV5QfxqIBVMNXpDQAT4zMTjDNf2XU7ia75ed0=; b=pNpGR07a8ArfwbCVFtHgG5ZBoP
	3cCcaczJ0LCoKVlxi2f4Kc4s4MqlpTvb3MSopqvnmypvUIcnigUj8sLflDBKOGoE622y++crRp6P9
	1i3l0uJBBf5yPnMRYfZiWln6SDxNNu68YzOJ/TvVjCuS22bJQCBdshbE2MbtdgcvEpKPbwVJv2n4f
	0/cRpu2Umt9kmsRtuwoiwTYApFtjQqgjUCkVkWq8S7wDjwcnnVi0WZB52apaL65uN9fXuInfU5Gta
	oKXOyINpefoa0rW1inS4y/infJS6DMvkdbG8fW62lnjqhw5KKTLuAslGbQu8Inp7Ce95r3cTdCXwo
	8FqoPTpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqVA-0000000Fh7c-0eNA;
	Wed, 03 Jun 2026 18:39:40 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUqV7-0000000Fh5y-3mHE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 18:39:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ba+9vRipYU2OTCnUCpm8lHifesplL0i+a4ypv63Pzll5ldqfc4i60eZ1poJ1d/DDDM2O4wnDAW6eHWUQUX9VFqOLaGLo5FkD5VeJKK/et0Ox69XU9pjXbfRhVB3GDrTmzIi4OaNjLsjIzfoJdP1ZyA6+HHoQ4uR7HdeBFiVyJbFfS5udLRTgWOwX52DHnlOS563BMvOK+s9VIU8GPvkth4qttG6Nnwt1XfiRBiRVW3ruGz8pwXN3lgo800oaQylOY8mn6KlZtnz/ftyE5tkMVZTcBCPZwa3swHTq82SUoXPtyJUZUQ0w4n13jhVlAt102mCtdKlm/DbDdxa95zgX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0BxjBZnV5QfxqIBVMNXpDQAT4zMTjDNf2XU7ia75ed0=;
 b=XXD9yWd+8WnMD6mHIpJ7AHZjm7OmNSlFBf2JePtkyb6x3Dqpzv1yiEkro0Rt8K3//9bLQC8ujPfpbUCVNgPpIzVtnIUA2GfwY8z9qSF49/dOO3pUiynIuhgipB9TsqmIVlLWWp0m3jtJaSPJr43ubXSUJqfNBza7PuAA+NTiASftJHsrJw/DMhR90Xq5SrBAge8MVs7zmUAYF9huHawJ+2JZgequDt6ZgjQninKiwmbLh74+b/m5yORK5eOL69mL/trQcR1GVC3Z9KxGH/6LWs1Xk6wSXBh0l0k44uUAwxn32NDQz8OwwkIPuuBOwCrY8ckJqkqlJttEyJX4VHoduA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0BxjBZnV5QfxqIBVMNXpDQAT4zMTjDNf2XU7ia75ed0=;
 b=dYDog13gDzSe5GJ9tYxfsi9msu4NXr1UiNyn/INHKiaaI6zFjRg/nPm5vCAl4fOOihlirsQnQHbQTFLgSlNwMKDKSh8Jm+XeIoLXjDrM0PQtN+LTBNdhV58rTjHcfKW2CRYGC6Cco93bpHu0M8950I2Qbuithdk409G84ut4jh12dRpgQ2Ajq/9qxBcrgodICqZIWWtDfLsMp0WTm9vQE3eW0ZS8eFPyHiCC7uLvlxN5ABkiKOtIw6QoX2zj9mx7xGpbeMq2xCinfxWAtsj633Be6s7UmUroW7AbpEvHaE7hOSFumdtdvPYrv4D6GMQ4kKWtRvyGvKd8DgJWf7bMfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9898.eurprd04.prod.outlook.com (2603:10a6:10:4d2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:39:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 18:39:33 +0000
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
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 0/5] arm64: dts: imx93-var-som-symphony: align DTS with hardware revision
Date: Wed,  3 Jun 2026 14:39:19 -0400
Message-ID: <178051195233.2750461.1118920514526691738.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780474803.git.stefano.r@variscite.com>
References: <cover.1780474803.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P221CA0029.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::34) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9898:EE_
X-MS-Office365-Filtering-Correlation-Id: 657e7b2b-e6b3-4a96-9fef-08dec19f74c1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|22082099003|18002099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: EiNPIVqsxRZ9rQZ6WVkQLNZWX+OfXMFSYHhR6C2Q/nIajQFhYiieULdLOBhBGSrx1ygXKcCBxCHucXaYnzUC7UlDCdW+NsBn7FERAhKCn9DDMjQd9Hw8hJ6LW2gDHIq03sJBCTJsjcNZEPy7TOK3aYtX0oDqYhoGwDBefLg4q5DcaF7mqlNUatmexboA2J+Zb4X2gJIKA+o6YZ27PTFfLdGAw9jl7u9OPzXyfU8zlhHoIxva9Eu9t0AXnTxXZmtY1v8QK2g+L5ZeY/HmOFeGgdmaGPTIftHH+wWG7g0hXGg9uiHjoqS7h4P8wrHuAlZS+YQDRVNynJZOJ18KbwJZVjwel9VrPoXToXHJDKZpss0F45DdxFkzy7QjHGGveAejmz/jaAXCbiy+CXDUbLo1fvEoIHPk/oIMlvFDMqIA6PC/uoi1yi6BIVZnVvPL6Cj9kW7/JSp+HSBNXa6GAXumgMJsuRiTE//gZTHFSYM01fQWx/wo2xgWIVagCFWzPV3vpLXvMyNUpEaDdvL5zVfPIPMVxuTvipegINnAu/nI0HgQPwBzC9AefxiGLhW44xntqYh5NEt5ar1hO0WDt3AU9s0LwiVlkvUHkwK41HOx6fN+KCVIVwMTr416e+VCxchflrP/92OPuWrA2mrWOMG00nJ18a+IHHKbRmtWoEaRArd94nWUU0EWe1RLqMnjmnet
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1ErTjJVYWQxb3F4TkYxSGwwV2FraWdrcjlHdlh3ejZWQW4yVDZLTFpxcWVJ?=
 =?utf-8?B?RVliWEh1dTZrcitHVkRjTHVwdGR5ellQaVh4UUM1QlV2bmUrdlNYelA3aERE?=
 =?utf-8?B?RG9vTjNGR3RwZTZGS1JTOXh2UDlFUDNLaG0rTzFOaDFJZUxUZFFETnJoa2t2?=
 =?utf-8?B?WWVIR3dvSzRnaVliZHdkeWpQVkVrU3V4UGZlVFVZaWdRRXo0bWhpTjFVbFpX?=
 =?utf-8?B?eFh6M0k0UVhmODdrWWx1UDlLbUlQeUdvS054SUx4U0tHU3p3Vklud21aaGcy?=
 =?utf-8?B?S0VoaGFjYXc1NllEWFkvRzN1eGRXaUpOTG9xRks0RXJsMU5LaXkxWkk3R2tF?=
 =?utf-8?B?UEE2K2l3U1ZUU1FvcUxXRlRmWE9seE5YbExWZ2l2UXV4cVFqQ050S3NITS80?=
 =?utf-8?B?NHlmcHV5SG1QZFdQU3RTSTNJNkpuRms5Z09mQTdWeVVDbFR4VFc3cGFpN3ZO?=
 =?utf-8?B?OWFURE00cnFYcGZReW8yb1p3Y0VRWUpMZkR1NGJxRFFNVTFFamJtYjd2QkR6?=
 =?utf-8?B?L20wVFFmVURDRFRmY0dnOEhPazN0TUEzajBEQkgyWWRHNS9tOUFuSEtPb2Zr?=
 =?utf-8?B?RXpQTHpxTFJ0N3pYY3Voci9CUSthTzNiKzU3M3FIaC8zM3hTcVNOSEhIdTZW?=
 =?utf-8?B?L3o2a2pOQXNtV3VvOXpGQ3d4Qk1mSG9nWmZmUkxpY1RTSDMybjFPLzlHM3cr?=
 =?utf-8?B?WTNjdmE5RElxU3c4aEpHZ0VuOXZ5bWROVFlLK0poWWR6NW1kcEJOdnF5ZTlE?=
 =?utf-8?B?Y3ZVamQ2S0ZYV1ZsZlhDZzZ1WHdNR1JvazI4YjlnVGJIc3l5T0xVemhUVng3?=
 =?utf-8?B?aVRqY1NrWkZYWUFBaGJSem9iNjJycmZrOFpuSmxKazZyMnBUN0dNK2xIWXpr?=
 =?utf-8?B?dFB6ZWgxdUtobG9XZWNNSy9ka2hYYkJMVnl5bzdvUHFQRXY3MFRqU0hrSlIv?=
 =?utf-8?B?a1ZpU2lzNnRwTnd6YTYrd3BNam0zK09uaGRBTk5TOXg1ODNtUE03TGRpaDYy?=
 =?utf-8?B?SEY3azh1QXc2NWVDMDZyRzZWZXQrTEpkcVhZQ0szZGNRRnhYSGlEbjQ0MDAv?=
 =?utf-8?B?NWlpRWV4WjZ0WG56eHpZSHRFK21vNitNaHJjOVRiZGtZY3A3a1JhNHhqdW9r?=
 =?utf-8?B?NnVsb1RUR0lubTJpV1dyN1c4NFFkdktMUUI0V1JVdW5uV016M0cwcmNIV2hK?=
 =?utf-8?B?bjJPY3ZJWldqMXo3L1RQK0toUlI5cXhoUWxqempmakRldFdTVXBZREl5RG9p?=
 =?utf-8?B?ZWVBdXp1SzcvcTBQVDFFYTFPLzdFK0I3QmJnZ29aNkpSRzB4STBSZk5oZlkx?=
 =?utf-8?B?Ulk3QjNaVW9Vdk0vNXdTYWljNFRUSjhFNWd1WlArb0IyT1hBV2NMc2lMZm5Y?=
 =?utf-8?B?cVNadHZUekNUN2pBMnM2VVVtUkhVK2hyQWZ2ODFUait1UzdUTjJqY1Z6L3F6?=
 =?utf-8?B?Mk9kTC9NcmFxb0l4QTd6SmVVYWZTRU5sSi9rakhBeFRvOTRYbEtEZCtaQTBN?=
 =?utf-8?B?d0I0TWxPVkMwaWVxaHBpT1dGY0x1cVp2MDFhYTJUZWx6dks2MjhWZy9NdzNI?=
 =?utf-8?B?dnBCaFdqMU5jOG9lM2lnSkNQQmtYaitqSUZ4V2t1dTEzaFNzSzZtZHdvK3FC?=
 =?utf-8?B?OVlFWURYZWhtMkVlemxOT1JoMEhoa0xUZTVSUVFmR0RTeEJwT3R2OUlGTFBH?=
 =?utf-8?B?VFRjWGZza0t1QmVjSVZWaVJDRDlvelNMU1Q5M3NxVWlCWDBSU2MzUGx4cWpK?=
 =?utf-8?B?QTlOS1BkVG9xUHJaR2s0ckxtdGlHdWVwTm5Oemc5c2I4cE1qS1dxYlVST2Jz?=
 =?utf-8?B?cDJWTWgrNFJOYVRqcVVUNmZ0bU5QTS9QWTAwMUp5RUg5eU9YWm5mckpCaFBH?=
 =?utf-8?B?S0taNEdZNTc0S09JR2pHZXF0Vm1TWW5IdnVPbWdmTm41NnBKNW9rRG5RL2Uy?=
 =?utf-8?B?NS8rOFloeG5KUE9VdFlXNWxtNnY4eE1PYmVWN0drdFd4dTRCZ05kVFRUNFRo?=
 =?utf-8?B?Tjlad01YV0toci93Q0JEdXhtZ0tRa0VoWE9hVmhCMlJmYkhGMUFZZEVIZ2Vr?=
 =?utf-8?B?LzgyazN3YUx3dVRZdmhzajBzUjliR2ZaQ1BVNjFTa0RQak5EYnRkblRWSUhY?=
 =?utf-8?B?TG83dmdwblZkUFVCTVdDWGZsbVU1VS9uMVBNU0lsRjFVYzhQU3h2bGE2bHYy?=
 =?utf-8?B?dzRYV0pDeVRqUzdTZ2dzYkpleG1NV0Y3MjNTN0Fldm10NUZvUnp3cVhpUGtu?=
 =?utf-8?B?c3dzM3B6SFU3NERnZCtIak1uSHYxWmcrRENzREE0d0VCOEVycEQ1MVN4bTYy?=
 =?utf-8?B?OUwrRzZGdUQ2RVRCWWUrcGtuVmFuN05ZZklSQjRTYnNjcHg4d01XYy9VMjYy?=
 =?utf-8?Q?+K0McU2o7Nmd56yrb6mFeubr7mRExmXhMBSka?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657e7b2b-e6b3-4a96-9fef-08dec19f74c1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:39:33.7663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5jtDukWM01Zunw40dHxrCrAbPsRMCdIeppgAzBr8FgjgL56iaBVze5PM9wJeZOlkX8yn5qjGIJqkejaDAuPc8E1+wY9O+0zjcXLHn4Udug78ValZx01m4qAtiCnKVlv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9898
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_113937_955091_F41780E5 
X-CRM114-Status: GOOD (  11.66  )
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


On Wed, 03 Jun 2026 10:24:59 +0200, Stefano Radaelli wrote:
> This series updates the i.MX93 VAR-SOM Symphony device tree to match the
> latest carrier board hardware revision.
> 
> The changes add support for onboard peripherals and complete the board
> configuration with the required GPIO, pinctrl and PWM settings.
> 
> v2->v3:
>  - Use reset-gpios for the TPM instead of a GPIO hog
>  - Add ADC1 support
> 
> [...]

Applied, thanks!

[1/5] arm64: dts: imx93-var-som-symphony: add TPM support
      commit: ff36dd3052902fb9beb0aae9890f4e48dd1dbb17
[2/5] arm64: dts: imx93-var-som-symphony: enable UART7
      commit: 787bd1ec71cf1b176e4e89c26940790891a53a6a
[3/5] arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
      commit: 5def8bdea91aa39b7eb87b513eb8c509f7125d2c
[4/5] arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
      commit: 35aa71e7bee68b00291949d091c1f1b8f783b63e
[5/5] arm64: dts: imx93-var-som-symphony: enable ADC
      commit: ebb039d82a1b8f2d1ed3c98cc404a17e266e54a8

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

