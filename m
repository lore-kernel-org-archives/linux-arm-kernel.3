Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5D7CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 18:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FhkbXi6XD17Rr7QsNsBDPKKx/MUipz7Nu1IWH7yUbpw=; b=XkmV0MQRX4rBhR7b/Ij0U8v68a
	HZg2INe7xxKIScb0ywBPZgksDpEa1pFMzt/30M1c4kHQVTsdoTIJB156XNyHsBSSOjiOf4Sn5BdTT
	jbQEct/gN7vcOX0t5De2WoNs2YT+AWZhP/bD6U/E96+FgkeSNy7AtQ8v/G9W0XIDOECgZgQ5oG9io
	5jWLwWTZBnIIz47+7LfgAJCOEukMveSRqu27T5yRXXwL1gv89Hv4unj9VfBvboAvXnxmsr21a/zSN
	WPGtNk2att1WHIoQtXGJxNbvLjpKp3bGOZkxrCaYKUYXdRNuXlyUyZHKR6Ab4CZZQsbR5GsqMp09Z
	nWmMxiRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpzf-0000000Fe9W-0jXv;
	Wed, 03 Jun 2026 18:07:07 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpzZ-0000000Fe6c-1CRQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 18:07:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=veH6ZDV9rupLvXh3CB81KsgHkMa/dz6rIOeth6X5VW0mMGF/ExuBbz+SDiL+vEt+KVYnUrzGCLtn6x1Dxvt7aepDm1c4AoTIMqNxY1JtlhVqiWNSs3/G4CfOo6WCGIU1MIh4JmilCZbUu7mj2uO28WVz2KoeTVzkTsDJSON0cf4WJrM3DlhechsgZ35Jw9zVohA3Of+ilkvLGOhGzCIsevg3MaxjGrqQAI5diYwr3eMWDfwhRVFoTnz6RssnKkT7grIRzQkGx8K6VXhOduTnxeBNtIPjtX7lfLji2Oiha+e0QLL+FpymFLAQ2ZnHFZ03OKNpj8MrSGFVey1XqpmzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhkbXi6XD17Rr7QsNsBDPKKx/MUipz7Nu1IWH7yUbpw=;
 b=cennm3y3re7G0/95LOanm45/EDOR53w0Fbvaus9NqKDQGY8gRALkE9lwSNIzmVFNsQOTk9j8ny+nlCgBP+oMp4L91lyfS6A6OEQujqmbKD2NzCOD5U8sBBYr+qKESkfat/RLTJojv0oTmIb0ekU0mC7Mwdb2NNWkkznzA/dyr3x/yCpb61McW3w9x+KOLg1+gIN14rlMCPtK3TXyyprmPndeKVD263PpfkZ/RbVpSI8BylGkvvZoSOyYj4tr3ezxXbwO0Lywb8J2t7p0G7r4cfscMLj99nZRcPWGOTkOWzz6hzMTdRYs8c6nfqVyFCBK9bOWknixzy7oUGD/vO74fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhkbXi6XD17Rr7QsNsBDPKKx/MUipz7Nu1IWH7yUbpw=;
 b=FRTozM9+7eZTNVDVYyfwgylZ7H4fNlcYpw8TjhfSZyXbHKi/yAp+YDfWjWNO5t/4omC9Q+b8BPcHKfnOWYZUZ/IpMV6GQNKFEaNZhkdZwo/pyJmaiMz8qVifj2PtYYk6n4AChnlx7B52MNb5Rv4x6K12b3KQSbU02DBw+uyZRiYSRZOXnTOHjtX1lxxq2W+UyDd1BjwIYIl2CBp2JnyjN9KpNZLY/MLV9nVIBMm6PsptDZ4NvZm0vmZoRMTjPtHfsKGnLXpx+oqY95WPPTx6Fuw3j4FYNBoRMiSe1EtBo3MI5qfW8VqHJfeuG1T+G/bIKP5dOavnANgX0Rr6e/S2tA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB9967.eurprd04.prod.outlook.com (2603:10a6:10:4dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 18:06:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 18:06:56 +0000
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
Date: Wed,  3 Jun 2026 14:06:48 -0400
Message-ID: <178050999797.2675045.5958713442005454113.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1780474803.git.stefano.r@variscite.com>
References: <cover.1780474803.git.stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0057.namprd17.prod.outlook.com
 (2603:10b6:510:325::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB9967:EE_
X-MS-Office365-Filtering-Correlation-Id: 656efa92-f25b-4fce-accd-08dec19ae662
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ZsbUI3cJ6Ct13nyYV0NxSDQkubOiSkmQwtNBBYUHbjRivNOEU1MPaVR4eyo0MXher+158QHZNDG85/WlmeXOVpym5DAv57mGNelXWAB0fSwgkmQnSUDOwmC1Ky0defFwLegwjmjzk0C1U4VdMQXYhZdNRbjbvHXCk1mQICVZz3dMi3tx7+McXSjGWpU2MlGOgk4c5PsWFjAFXsslgMwd+acaQDY9CUCKB5Lt/88a2UfsaISRJW9ms9F3rEt4q6D7N8/lU2GLuynAhc/sCtz133hVHtvKfMTZYmLHOGjMILL7xzxnuZb189xeYnBmenttlkD3i2KXy1BZQkR0C+AcCp3FroYsx9G6R5srop/lVEfhq4iAUKiWqF1BcWGp6oEoiFQH92xLTS/eWSZb1yI9o7hXcxUtnFneK0HtsFTsc3BLuoNEnG3A+UL04ZksXwVklE/Bx0ppG/Xcedto9b7gsKcb6melE0RLun4wI4VrM356Y4jgjUxsjZ00we5JcJwY2PSdvRNld/KQUOVr40AP7nlWuHeoEVLI4YXltOjzBpssv8Qz5a+TqCiSkH7ZF4FVIlQLP8OE05q/bXOStkhDlaQUR/ZlgcRTS2VoATMs6cMleTXBYbQD7djvjr6sLr0J2D6NSQkOnrXpABLmQ5oKcwYseMari+HlzTK02hZqz/xaDGgkRbnMOqhcKNoB8SE0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEJCQjZIV002TUt4dkhRZFNvYVVObmVGY09GSVB6dTYyeHdYazlMNmdMUzdZ?=
 =?utf-8?B?bTdqSXhXdGRnNjRManZCMklRSSsvQkM2L2J0YkJsNEtvYXpHcjEvQzZyMU43?=
 =?utf-8?B?S1E4VDZMci9JTFhNTlBGamdVL0hLT29lcTF2Y1hFQmVUTEdaWXV3WTdhcVpP?=
 =?utf-8?B?eU9EUXhDL1VHb1hybFV0MHVaVTYxQXVJYXdsT0tpZkhlbmx4WFVqVFpnY0xP?=
 =?utf-8?B?SWRLL1JqZ29TK3lNYWVoODdBaVVnWXdmbndyOGlzTGJFWWJSTEovaXZGKysx?=
 =?utf-8?B?TEN4VGQ3Y3V6ak9TY08yUTE5TEpBNGNybWxpVm5LMmMzaDdqdmpsbGIwOFVE?=
 =?utf-8?B?VjM5L0thR2ZTMTZQZUgxbjhUWXNlQ1RTRGRSOUNDRHVzRmJRR3F0UEtCRVp4?=
 =?utf-8?B?bld4czBDa3AxcHhEalU0dWF6bmtTR2VWVjk1amt5WEQvUTA5RVFld3NSdFVN?=
 =?utf-8?B?OXZ1ZGxPY3lTK21nNnRsZCtIOEdqUVpVc2lXZGI5TUZPenJDWFZlaWVZMTNY?=
 =?utf-8?B?Y0RZOW1tcXg5L0QxelhiZ2k3S2llY0tTUUxiaWl5T3ZtNzJGYjB6dmp5b3Zm?=
 =?utf-8?B?amxmSjRJUjViNDlGV3VRK3djOXQyb2x3a1pVcWdHMVl4Z0UzVy9zMzF6MXdM?=
 =?utf-8?B?Yjc1U1g4N3E2SUVYTHdkbHkzcUttd3V5VnpwN0hBeW02M3VCRE14eVdXNUtl?=
 =?utf-8?B?SXZJZ0dseENEUDdrcldTZFB5UUh0QTNUMUEwN21sMjNiZVhxQVh3QVVidDBV?=
 =?utf-8?B?NzhHd0xtNy9ETjUrWWZVK1J5MVpWem5tRlMzS1kwbUJ2VFZydlFTdHFaVmov?=
 =?utf-8?B?WitJakl3TENQbE5kZTlET005amhSOVVEUTY3RnVzNEM2aDU0SmNsN1ExODlS?=
 =?utf-8?B?UWIyOHlDQ3BZc3RDeWlkeWxtaWhxOFZrMXZJNWMxcmRwai96TVFkdnlIRWt1?=
 =?utf-8?B?cTVxREFUdElFbDBDOTZJYTNySFZyM3JTQkxVbFBNTWxyc1Q4SEg5QWJmTVRz?=
 =?utf-8?B?UC9vY3FwNmJ3Ny9kTG1XTVhIa1NkTW80MG1lek1BRW00bG01YUU0cUpvTkJv?=
 =?utf-8?B?VFZCN2RaMmVHelhaOU5uanV2azB0dTh0d3JoWHZMRWVkazdhY000RVpXSklv?=
 =?utf-8?B?bkdRMElpeFR4WTRLL1drTmdDTUV2OCtxaSs1anNsK2FvUWhqcElWSGhZS3dT?=
 =?utf-8?B?T0RiY0xOT09xdnFHbnRFYi81V0UxQXdVdS9idWJOQTZoaWxvNExkVFhtQWg4?=
 =?utf-8?B?dFFzam1vUlBoRVc1RCtORGN4WDhhVE41bXNUeUp0dG9sNGZkekpNMG1iYjVV?=
 =?utf-8?B?cTNyMk8vNFh1MjF2SzZIY21kNWZpSWpVVFIxZytOeWxXTm9KdEdubTdXUG1q?=
 =?utf-8?B?M1ZBWVA1TGRFZjNpWG1uUlU4S0hkejcraHRWY3RtRFR6dzZ1Vnd1VXkzbjY1?=
 =?utf-8?B?WWZTV3dSMzhoYUJkMDVuZWM2VDBKNEs0L25sOFg4UHpuUit3T0Q5QXdrY3NI?=
 =?utf-8?B?bTIzVUxFNU9IUkxxdzhZcDRFcXEwK0hvMkZlOUpwT3lxdFU5TzZ5MWlWV2RH?=
 =?utf-8?B?SVd2YVRuS2pDeFdyeUxWdlZCdnpITjlYdWVQcEp2SEhBdVc5SGdIdEp6ZzB0?=
 =?utf-8?B?T1NmdThhR0Fyck54MmxXWWQydXBBUDlobHRtYkNQL3pUc1FtYnVHWXR1a2p4?=
 =?utf-8?B?UmlYczA2MjFna0lKbzBiT2xOVTZFWG9PUnRJenNlMGpoNjVVam5vVHhIMlNE?=
 =?utf-8?B?bGwyK0E2N3Q4dUR4Zk5DakxSRUFuazlFcHRsOWpCSTcyMXZvTklPNzczcE1N?=
 =?utf-8?B?MVJrTUozNTQrZGtmbEFIbXY5cll1QWxsL2lxSHgwNHMrQW1TOGF0MVQxamgz?=
 =?utf-8?B?VGN3RDQvSnVRWmdvcEJGS3J4SUpjZnkxM0s4TEh1bjBqeTNpelNIVms1UnhZ?=
 =?utf-8?B?L0VYNUdaclhCYjY5Q1pmSWlJRFd1TkhMQnZ3cS9EMXljaUVScEpORHE5YTRt?=
 =?utf-8?B?aXV4T1NGa0U5OTlUOERlNjJNUjFTU1RhNkc4Z2puKzl2OVhtUW11SEI2TTFa?=
 =?utf-8?B?N05EOUtkdTU1ZmwzVTloSmhXRUEwT1owaFZTZlQxMWxYSUdNMVJ4dzdtb3Bs?=
 =?utf-8?B?OUJZYmFzRFBCaE1FV1oxd05xOGsyaXdscjlmclhlN1pUNjNKa1Mzd0YzcW1S?=
 =?utf-8?B?NTl2VkIwYTNkWVdwc0hhUk15Ni85N0U0OWM0Z2Q5WmwvRHNTMWU1OFdkYkJ3?=
 =?utf-8?B?ZGpYMXgrSnA2WTZSaGJkT2g5eUhMcVpUeFY2WElXY2JJWEpKUFJvb2JyRkFt?=
 =?utf-8?B?UitxV0tIQlo5d1BBdFd0TG1aVjNpaGVNMGNOek5yK1ZPUHprQnlkSWhKRU9B?=
 =?utf-8?Q?RCzlWpihiEecbtXW1eQpL7gfpfY1f+A7dBv5C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 656efa92-f25b-4fce-accd-08dec19ae662
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 18:06:56.9310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yRWF0R75kLq0hpz1zcCQZMOjP6CYl63JF8pGvzkGLx7rBcKLwziqb9E5W1fjyWoiOtKuE3vF/p3N2wMr6FMCcZB7Odn8xSaVUDcD0L2n1SXAls2LDxYrUsQov4sM8p50
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9967
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_110701_331327_F38EA997 
X-CRM114-Status: GOOD (  11.56  )
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
      commit: 51248ee29b08f161bf5bef509f572ddc336cd0e4
[2/5] arm64: dts: imx93-var-som-symphony: enable UART7
      commit: f4e6883c411c40bbeadede75e92cff5e17066769
[3/5] arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
      commit: 2b57947cc182076aeb7b6f81586c6220f37bf824
[4/5] arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
      commit: c8ed835941cf679551e10c901c2bd2e2c7f333e5
[5/5] arm64: dts: imx93-var-som-symphony: enable ADC
      commit: c68b0517041f5406293c172af001136d85b9cacb

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

