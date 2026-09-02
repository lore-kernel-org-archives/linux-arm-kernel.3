Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43874C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7auofl/AGQ7uvM8ZncM5eaQFjclLIfcKzxPHbXDvRc=; b=QkzLjZG5rgkoHY+M1ukR2YhHra
	umt2ZGtQCKZPy2BYkCBivindSGngyS/V74IfeCKVOK5G5feGqKOoDfvYm8jK9KozEbTkKzSt7I7HV
	7i7PzTUHr99srCXpQPhrW50Y1J970YWBevspaaa7wi7l8ZkrlvPvhwO81cCM9vC8vU15L0V3W+3Gu
	0rJXqwgBn9hyqvflfdKGB6r4gahKjIYc2ZFq853NKU9128KGP/tp05zF0Mldr4JdEmHLhN2k6Wcxy
	dYc7ih3rhTaa2m7Nen96LaLXl/2rvlKP69sKupoW61XPkvnWX4OcRRHVoH0HliW+NrBLzUCSp3IB5
	999BawnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qdz-0000000FhkS-1tT6;
	Wed, 02 Sep 2026 19:29:11 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qdx-0000000FhjT-42QK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:29:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVnAQbW0+pr0d1fmToepTaVf4MWedpc/iufcOzC6CqGuZ4c99MKOBt2dQ+Kzv4i6H+fHn0dRC9LZ4zajV1Bq0bbecAEOJt80CIef7g3Bd0xRFFCC7aSdi/5F1HxEroNowG6NPa5+iZibUo5wOKn8QvUvVDYPc50278d3DDGyjH5uXpfzOCTLRiIhLC6xseEcWB2FGxXiEWDvmODDCEjVL67CcZn8K4DHqugXcAq2U5nMjGSUHiG0lB/hHY3osAFjPui2x7AhNFpNjtrfmL9h/Lvg7/VuGIL98Y3DiCY/sTFpNs8rA3PfT8BHT3/c2Lk7qX31yRyUEehk2PuMF8t09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b7auofl/AGQ7uvM8ZncM5eaQFjclLIfcKzxPHbXDvRc=;
 b=GIRmSRe3TpgRZOTsYgekA4OCLxpCdLukJs4lj4Iam+lUxX5K0YcHYTmwxlHoQ+3CIKA0xAFqmqufh009V+hrSH6IhIMrtpm+lMVG90T0Q4cvGko4aZL4OnjhlMXLKTIaxRMc4l9EMUDeM7HapCdAumV0YHQzWxt+SdkJ6N9VX1s8AICBAyEx/z9R4u0YMC6ljLsLKADiI8C8Upxzskp2CF0r0WKyylmSvRJKeiuggTJreLJHdEuJtZcDLN1zH40q/5sKgq5M6BJgH37Ikj+fvGlXDhqfP4uG+acZ56s1eVBwHRV//TSN2RGkgyh27ET0kC0nbbNPSGwi2SS4sSl/kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7auofl/AGQ7uvM8ZncM5eaQFjclLIfcKzxPHbXDvRc=;
 b=n5t82BwqwDDokKuIuMhpo+poVr6KbPuINCO3aNyS0YuOfBDQDb2LFfHEfrLSk0Wiys3atR63e6WkH7nkDS+z+lVoU7gX4AVLahY2wZSozN99SGwU6WdrcblgsihKFTsW1sRcRFqBNXqzdDP5m0dnWEw3aFN4pluTMxal/XRv/2H9HnbtvovmHR+IILhaOVgxx3cVqjup9+0Mt9MthlqiYX3iUT19lp1IoykLXg6q+uCz/m8wfF9detRqhCxPYgnr6JaFCsQoHLsIFl9hgwFsoZjaLJTjQ03tMF+7ei98nJAnkcA/gWkTKvhtKe5JrKrNffcYG6Coo8arAe0keT88Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU4PR04MB10338.eurprd04.prod.outlook.com (2603:10a6:10:565::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:29:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:29:03 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Franz Schnyder <fra.schnyder@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: (subset) [PATCH 0/2] arm64: dts: imx8qm: Add USB HSIC support for Apalis iMX8
Date: Wed,  2 Sep 2026 15:28:49 -0400
Message-ID: <178837731315.2104985.502141651386977100.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
References: <20260821-add-apalis-imx8-usbhsic-v1-0-fb93d73ead44@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF00013315.namprd07.prod.outlook.com
 (2603:10b6:518:1::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU4PR04MB10338:EE_
X-MS-Office365-Filtering-Correlation-Id: c2882039-5ff4-4bb2-4617-08df0928724f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|1800799024|7416014|23010399003|366016|921020|11063799006|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: Hbi8k/o60nlsvAITQICEWDFWOtZNI34b4iFwDjq/gHaV2QuBxVJc9vYSDptVhRGLeJi00VbyEizn0vKdFi1bcBJVEX4ifYBPGiVBv07FIyyCcjORNQCF/kHYMRBaXLJtQpcf234MwabpDI3MBUrRciZngw11sk73cjMK9WCFBxqduKAmNJastHJY0E/I1sxWO+LORvxY5XZtw5ZDLVNng9r/7in4YD7nq4hs3xFe9a08sg4KO6JhsBho4vU1xWkr9SmqKa04RITTWTe8hVQAJXJXmTIjcOIjxkaL0N6DUv+aDoXBfwSeRQQpF15nHk1Gwa8HmpbJ0oHBafQzPUIEy+l52Ql6OrZ1TuDFg89KnSfgGjSo1l1cgLU20xYu0WyKMJfhDyEOOodMA4LgLY8lxh+RMhfHWbzgxeDCAZft33C0NZMCZyPcPIikiYJ78EI3LU7XNBTUbwWDz6FnrWDOBSI8e8Q5nRvkcZMpvhmnuAk4j93B3eJfUrG4Ov7i2GVgNmlY0+rKXxWxcVolsoQ0xZDBG03OAZRf4MVRV3ypZEaXfed84kSXAJDdHaKfTn88/ZMrAjvMRKHwFPEhI6rKn6cuVx6HZ447AmwlLG1hUInVBSF/RtLhmWLomErE9ZVwzfy/I6D+cdMc6hl6pUilTTffrMsPm5qq9HAomAJNKyacO27utdDmPw5oQHXFXrnyAwP+00ae9OrPtgOHNG4DxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(7416014)(23010399003)(366016)(921020)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3hJdTMyeTZHYW4xUEZ1dENBUUF5ZHVOaTFlbTBvTXJ0SjBNWEZhb1RBeldN?=
 =?utf-8?B?N1RtTUJ3aDYxY0R5aVZJN1BUNE02dHcxQ1UxSXVMZHhJaFBKb2h5TnRycjdY?=
 =?utf-8?B?bEx0U0ZMcW9yTllXbCtMWVZNeE9xa0hOeC9OcE83YXFSazI2TE1KUHg5Wlcx?=
 =?utf-8?B?QTlvQUs0dGs5T2w0bjdNaTZ1ZXFpbDZoNFJTRVhqUVZjYmNJS0IzSTZocVdX?=
 =?utf-8?B?VnY5SGs2SmR6bWtlcGdvZ3FkNGYzWDc2UFBGRmVRVktMcFN5Z243TE9PUDZ0?=
 =?utf-8?B?TnVPWkdLOGhiQWdSaVZCNEErYTVXajFMNnhsTmpWamxycE1HL05jdm4vbFVy?=
 =?utf-8?B?MWVOeTd2dXJFWTQ1MzdQcDNNRGQ2cUU2OXhtV3ZGQWpLNTBQMmhKaEtVM3RD?=
 =?utf-8?B?SjhxODdYODRwK2pnY1YxWXBSZkM0VTQxR1BqVjVBamNWRVp1K3lFNUhIRld6?=
 =?utf-8?B?cExXWGJISFQwUkhqc1M3d0k1U2h0ZUhpZGJ1OGpYdGlOMWpFZmhoZytCd2tr?=
 =?utf-8?B?Qml6Z3JIWkFkSkNnSWFwV3BBS3ZGZHUzMEFLU3RyYXRhL1JRVWpFaVhIZk9L?=
 =?utf-8?B?YTNTVUdLY0RjL3hQUWhHaVJJVzRWelVtSzFkTWhnSjJhcVVwT2F4UHVPWDlX?=
 =?utf-8?B?YzlraitGSERaNngrN3FhQm5yZEJNSkkwOWRoclUzOU13Z0RtbDNvNk9NYnE0?=
 =?utf-8?B?ZXJkbDdGbUczU1RnZVliSGdDbE40aHpyVko1ak82Z00xY3lKRWxOdXZRZmdP?=
 =?utf-8?B?TFJQTzNKYjZiUFZRVVZvaFREMFVBNms5ZE5GcStoODQzcktJV2lYUHoxczdZ?=
 =?utf-8?B?TXFyamFoVUNVOEZhZmgyTzJOYkc3UUVHOGxOa0EwR3NWVW55STZrSEJIOGZ0?=
 =?utf-8?B?NExvS25KRzh6bFkwUk1kMFdTc1hZWUFHMzUzYjIzTUt1bFNlQkNzenJ0T1Bk?=
 =?utf-8?B?bVQ2QjdDcS80WStpaS9BUWFFNjJBSXZocUxBNDVoeVJycStRVDZrc0JGYXJs?=
 =?utf-8?B?QWd4bEsxa1IzOFVrRkZlZ2xrNzJpSStZeDY1VGVNVFdPTTkrTis5TG41UTlT?=
 =?utf-8?B?VkFjUkxYa085U0JmUW5YY01QTnNHSjNUZzVVeVJOVXhpWFp0Rko5cWRock1j?=
 =?utf-8?B?WHNJL0o4Rk1vWmJ4b01sY1BnZGlvc1lmZmhkMWlaS1lMdnZwUnBKVXNZTVVV?=
 =?utf-8?B?UHp4WVNPdVJ1alBaYS9VRmZHUjJwVVdnZWJkR2ptc3I1TC9xZ0FPUlJYQ3A4?=
 =?utf-8?B?NVZURjlxSGpXZHFnSUxNRGIyTGVodEErWFh5WGwvQkEwa2d4VXU1ekRPK2VX?=
 =?utf-8?B?MGFHM1dIcVl6SkJBaUVrKzQ3SE5yS0RlSlBSelIxMUV4SWtTN1NBcDFNVzhw?=
 =?utf-8?B?aWIyTjdBeXFOVlkrM3R1VGFoRVRXWG12bnB1VzI4RW1QTjEybmFaSk9hK1Ns?=
 =?utf-8?B?QXMxeG5kVXhKNTNTYVU0cGt3emNYWnpUR3F6dUJoQlUyUmRRRFFVNEZ5NUdP?=
 =?utf-8?B?TkNKdzA3WGd4YjRGY3pnczQ2UEk4RG9QVElKUW83eGNFVFN3VnhLd25ZWjhp?=
 =?utf-8?B?OEt4OXVqd2JDVTJUYk1DYVg3K3duR1Q4dzdrNDBkRXZiMkN5cTF2eW45Vlgz?=
 =?utf-8?B?Kzc2RHVFTHZMUDQ0UFVZbTBQVlMzVjMva0V5dVdCWnA1SitKWlNEbjZ4cnN0?=
 =?utf-8?B?eU82b2JKSGs5UUlWcEVYNUdrRGtBZG9jSWcrRzBPMlJXZlg3czk5Q2ZPTEN3?=
 =?utf-8?B?bUNOb2lmYVJIL1FMVGJjV1VJQlg3MFk5b2NqVndveDduaGFjaXpoQnZZcEQz?=
 =?utf-8?B?alliYVdLeXJENnAxS3NwK1lIcCtzeFlVZXh3bUhBaWI3Y082cEx2UHhLWmdI?=
 =?utf-8?B?OSttb3dKYm5UZmhxOFV4bTl4UlhqWkp5eDdIU1VtWiswYWs0UTlja3VhODZa?=
 =?utf-8?B?Z202dlVMYW9jc2w1cVFJcysvMlZKNkRTbWxIUnpRTUVVcFNqdVJvdDlOQks2?=
 =?utf-8?B?UHpvWTkrNGhnQ0hkS0F6c2hRMXd3TWhZTXQwYmpPKzNsYjFBZzNIWGFZMmpz?=
 =?utf-8?B?RGo1VVpLTzU4ZUh3b25JNEhPSkYrWjBCaFgzdFBtQWZ1b2c4SHc0UElJcGdN?=
 =?utf-8?B?Qm5mOVl4M0FueG83ZDN4ZDBmYi8rcU9rUDB2bThLR3lqaTE3bkg3RmErY2k0?=
 =?utf-8?B?M3VJK3VLUmFjMzc4aWlJTUV0aXhNWVU3M0RuYytVckRObC9vNU5kcWdWNUd5?=
 =?utf-8?B?a0hIMUhITi84WVdQOFd3b09SK25obXBFVG1ZL2JtSlg5MHZ1MktTMFlvY0x4?=
 =?utf-8?B?MlArRzJLYnhFMlluNzk4YTZEdjhJYUpYMTZ3T2tWOFVna2tWVGRSMFVONzU4?=
 =?utf-8?Q?gZOyZVlzFTXAkKHWPx5UUugCLWaVej+udANgb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2882039-5ff4-4bb2-4617-08df0928724f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:29:03.4010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7QaW2m7jx1y8qAgLbfEZ1w6uWf6C6nH5AYyCTW2Pj0OGzGn/9COEUtqq/qDN8iLZr43rnmPdhQh4KUfe3T7ve5p0Rgsuylz6E5sbORHeuhmvkmyuCdS/MGsAPvxQUjZ+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10338
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_122910_008351_BCF1BB41 
X-CRM114-Status: GOOD (  11.55  )
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


On Fri, 21 Aug 2026 16:58:56 +0200, Franz Schnyder wrote:
> The Apalis iMX8QM/QP routes the second USB controller in HSIC mode to
> the USB hub on the module. Add the HSIC host description for the
> iMX8QM/QP SoCs and enable the HSIC path for the Apalis iMX8 modules.
> 
> The HSIC host node is added in the QM/QP specific dtsi to not conflict
> with the address used by usbotg2 on the iMX8DXL variant. Therefore, it
> can't be described in the shared iMX8 conn dtsi.
> 
> [...]

Applied, thanks!

[2/2] arm64: dts: apalis-imx8: Add USB HSIC support
      commit: cf08ef6995204752d8423226f3588c76c6403996

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

