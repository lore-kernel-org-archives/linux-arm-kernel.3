Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64838C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 19:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozm+PPp72HtRaRbPK7kbtEj1b+26+f2JqQSiOCKNuE0=; b=ARjMQk/67fovjJQAmelPlFVVLI
	DZMYYLu9Jho2TrDT6utjyvy3CtRigwBQEa+UpwmK/t04TM9pqA4f8sLJghzxo6Ktofp94CRR4xF2c
	K/zMoEaaaha1thacOyLRwT1r0OQ7FoEHWlNRUprJtdnI2//j97emSKNzzPMkcKmQy/tN3gzrfdY0c
	+hi65XOskkScdr5EqjaVJCCCEiAOYiWvtDYeRMrxalVvkepqMo1qIAz/2a8z+/GOctcweyqZn9+Ct
	B06C7sQSGHbu4gChy/zIkEtmgoLBOZYkUkEVqzX7JqnfIPMDtTaC1t/BDMlrfcB6DcgcCY/qJ0bnu
	Cr1I3JcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQvG-00000003krJ-3yj1;
	Mon, 27 Jul 2026 19:23:34 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woQvE-00000003kqb-3Xma
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 19:23:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/2rnfFtheYtltne5xyukWU4RqiXnAxmy9DldTLYo0NCdlHHZg33VveZmaudXKjkPV5AAxyj/nUULBqRfTVinz/2xo8vFdf10G+/KVsSz7szeJhfgCqUHvb8zzK30Y7MIxf9a+FfP6cKfiVd2MP8orQbA8DCs5XcCAgfp4QB1tsKRtjOkMBpX2qCbBxyYWDAraYnB/xBjOesKDqMt/TZAVPTsTiY5iBAM2gnA87B5P58BeF/yHoYShRpLU8AmXpo0mcRrVhkV0FwZokouJCjVNoMllgfe1AG/+7cagFdsTGq+74Vpk+2HGJol4BLPP1aa8bhz+WycA1/G/svcI2ZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozm+PPp72HtRaRbPK7kbtEj1b+26+f2JqQSiOCKNuE0=;
 b=goC06oRuAmn0IFi7tbdFYNwU0Hdgjb655zFbf52rV0tj9OA5lvHLMUxI4xbC5WNjGpSeIbP15qPptMn5Ddg0LpmR4jd3ldBlbO5xpM6yrD+cHA3Jy7ItMOHG77yF0BAHO+8kDfkrqhV2w+egU7IOt7qOoIj1+IaoM13G6EejjoFaX7GZlDLBtRzdm6XOx+fJK6E701zfoYtRcjtOwuP8fvvXfdA5j4JHX59mwf+BXRvSH5tJfoLfvPlqnh+NIN5FrJOb5sPl0Fk/46NOhj5wZ7SkXDzgt+EPTIrGgVlU9F8NSgFRIuunF+YqTa8YQs/l/uzB3Zs81t/sNYOjk+ualA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozm+PPp72HtRaRbPK7kbtEj1b+26+f2JqQSiOCKNuE0=;
 b=M65j47Ti/G6Ub4tGaDkrrCBg8hfiL84+Co5Yz1AJl8gXgZEW+UoblGOGDpwqmFUNeRbG70LxfjsTx77l3p/UMCV/HvBBhMc0Cd1PI6DicOu97yXZF7mz4O4SkyclyHaTQ/xczfcVzS7dOPWF93qdKR6sD5KQglEjU40NM4qldMjCX/Jy3Rc4/8ut9Q89xHvn9+aNm9z50xyaQK6DT+5oxjIBudNaeXQlwo3e60ny9sozNA3Cx1wpf8l+Z+h6Qr+yhqcWUj1z0lkqv1RVyK1PlSJlK9csJqksnMB7SihMbJ32rVpSrtmVjQdzhzmN5IniH+d2+hSvOlGzUKqbnHkb8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7234.eurprd04.prod.outlook.com (2603:10a6:20b:1dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 19:23:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 19:23:27 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/8] arm64: dts: freescale: Add Verdin iMX8M Mini overlays
Date: Mon, 27 Jul 2026 15:23:14 -0400
Message-ID: <178517845494.2620222.10013511200154969577.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0158.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7234:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f49673b-a265-4242-033c-08deec1488eb
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|19092799006|366016|10067099003|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VhjqZ2xOZp3AL0HRvajV2uBlXZ+cwOY2ZExgvQX9ug1YrqsxF+xNF/i9Pb9tou4yM8aRnJ2VO8BS3pnHDve/wWsuERciFVmFSPHkd27vQlDvIc3UsGuG6x98wbzMgniCI4tl5kDBNM4bfvuEcjdkKf859liJUSGht55gN1kqFDiAuWifKAjUJnsssP8jh+LCAzuRzJtUIOyqlciNHz4H7SPJrRW0mfk2FcXYMQ7r0Hx4cFHfRdzwx7gfY3q4ZbUPy0BG6sYCmTgmdduTFcpb4yq56MA+xHDmCxR0ZDL8t2L3JENFcidCqwJOnlIk5pHlDExPwRr6+kO+xbOM77JT6LGCTTTMqCcZoNtubJA3Hy4jO3v46y9XHSBvzjFKNBsnYZqlujb6m/Nled6xoMEGj8gi0LUHxPe6+tYWfuA1sxicTZPFpxNuosOJQvfGSnz+NANUjAnZKaTyDwusGgBrwY42CwuJ0iJ5+XaLxrr7iUHRkCUZMFpywSKsdBztBvb+rzPD9f2Z3ClUoAI8NrhAFb2ZCEnqo0qS0UxF3v8clGNS8Bkthd2G8QIknBn/7L1BZkIWvlc/q4PJp0SAmgzBnCRwHF3xPWPsx5DFtLvq+NvjREYeynfcXrtAprA+oijHVLRDGHEWi6IqnIpxxPz5XzGu1ZTjYxtBqPMRERaenG4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(19092799006)(366016)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVNsOUI3NEtOZ0YvSUlmWHYvalpmUGhVbTZqUHBzYWdiUDlWQy9welFvUzBS?=
 =?utf-8?B?cUFCdlkzdlBEWTdSc2Z4L21hRnIrb1psdFhvcjBKT2xTK1lGcWg5bGNQWTRx?=
 =?utf-8?B?cTMwMFlTcHNnaVJnanNyNmZMUXBCWmdRSFZWY3dZSk5SSWRTRHJIQXhBOUNT?=
 =?utf-8?B?Q0V0SGQzUnZCUHNoaFIyYVFXNGxZMVZ1cWQrZ0pmVlRWcmozcU1ZdjdTSXJs?=
 =?utf-8?B?RWJvUXlrVlVVZkJkckU4OC9LMTdsK3lnZTRyK3hoS3JWK0JjM1M3M0hKTG9K?=
 =?utf-8?B?UCt2NXpzQ0hmb1hZWlNPSTR2ZFpZRExyNVYyWEcyd2NNd2FmdjJiRkJqeG5H?=
 =?utf-8?B?a2NxampzWDM3S0xlcXdaNkZRM3p4d2dHS3UvcUs3aWtPME5zUml1M3ROaHl4?=
 =?utf-8?B?SmtSNk90aEkrc1E1S1U1Rm5IaUJhRXhJTmMrVElWdEQ0TW9idGJ1MEdlTkhF?=
 =?utf-8?B?TWhKc2dJUURWOFM1S2s2M0lpMFRZSWpPcE90VEdyWStNNnc5RTNvbjh5cGhF?=
 =?utf-8?B?TnNWWTVjaElDTUJiRU0vNEFDQURtbU1DR29TRXAzT2MrZmdPZHpsak4vVVJM?=
 =?utf-8?B?cW54VUYzRGNmbC81R0kwcjh5U0RtRklORyt0WFh6alIxRUk1OEdzUUFYRmo5?=
 =?utf-8?B?anBNK01QWEZHRlAvN2NMQUd4eEE1cndIM1ZVQUp5T3ZzUHJZcEJKTDdsbDBW?=
 =?utf-8?B?L0k3UjZIb3R5SnBQUlRMTWJ2Q2FJR3M5N204a0gvdTRZV1hhREFrSEx3S1Va?=
 =?utf-8?B?blc1Z01UV1l6TlFoWFRtN3J6d2xTVlQwZ3hocmNuZGNOSWx4L0tXUFhXeVBw?=
 =?utf-8?B?RXdTSXZWdEE1NENCdEo3T2lML2UvOUpqU2lzTTFZUzVlOWNLdUMyVGdpbXlr?=
 =?utf-8?B?OW0zUHMwRTdTRlIyeWhUVGpma2xnUXBzbDg5bXVNd0VMUXpCL1J1c05LaXpn?=
 =?utf-8?B?bElrY3FldUlEUm8xVnplVXhHQVA3WHZFTEZLN2VRU1RvWGJjWnFzY1Z4SkIr?=
 =?utf-8?B?QUEySUo2WXc0ZmNNVXdpNzdNbVcrYm0ycGxhNW5EZWVtVW1VeDZ1dm1vMFlS?=
 =?utf-8?B?K21lQU5hM0dYUHpLL2tjMXNFcUZJbURnRGVMSEJsR2NUYjkvaXpqU29xWlJ4?=
 =?utf-8?B?K2NxMDgzM1VPWHVESnpDcmRjQmNVYmFDdVU1VCsvZWRUdHFQOEg1K2M4ZGxh?=
 =?utf-8?B?MWNkZlNzNGd2blF0YnFGR2g3V2hpSFZFTHZWd2JwVGxDSDFSZml0NldLYVVo?=
 =?utf-8?B?TVo4bkp5K3M4S3RBd0FFU291MFRWYUFNelZITU5xOVM0UEFHcEpNaThnWUFM?=
 =?utf-8?B?WjhhTHFJeVgreGFraFZYcXFxVy9ndnhmemFFa00rclJiSGpJcWxpUEZnZkVS?=
 =?utf-8?B?NzNDOEV3TEVRQm5iM3VtWFZhOFNJS0xuL0R1azE1a3hPV1FrUlRJYnh3NWkx?=
 =?utf-8?B?YW1FRnNaNXpNOW14M3M1eHZaY2hhZFFFTUtiR0QyYkNLVVFnR2xuOFpCTHhJ?=
 =?utf-8?B?ekNweHJyeUpIL3BLQ2VaMzdIenlRVjI2eWpiZlRaYnR2Vi9EclVRYWpucUR5?=
 =?utf-8?B?c2x3c2xBeWk3UEw4bC9mT1ZMQllmNnlQR1VtR3prb1NFajQ4VVB2VnlhUUlB?=
 =?utf-8?B?am1obEorRWJ6M1hFT25yMCtGTis2UzV1dmg0RnJXcUd3Z1JjNXlyK0NqK2Zp?=
 =?utf-8?B?NFJGNWk2ZGdMUkRHcnJ6RnVLcGFKV2t6QkZXNG1sT0hnanZXR2tyL1p0cHJ0?=
 =?utf-8?B?dm4xK2QvRUJsTXVuRXpDM09pSXRNVi81cFRaUnhnUlFLUjdoNGVuczM1RTZL?=
 =?utf-8?B?Rk1sTFlwZWNteUtPMm5MRmMyS3hEWTZKTzJVM3VsOXdCZ1d3WGhjNUExMHpo?=
 =?utf-8?B?UTNRZlU2THJXamQ4U05tcGlMajk2VjIrQ0pYODI4TnVvOUYvbm5nTVlGd1hI?=
 =?utf-8?B?eC9QK2pEY1JCejg0L2JoYldVTTUwakxsMm9Bdlc3MmJGZlNEQ1lsUUFpT3ha?=
 =?utf-8?B?SzU3VC9UdUdkNXB3MmtNVUdiQ20zMFEyRUdUaHl0M0VZT2l1RTZXNG9iU0po?=
 =?utf-8?B?aHMwdDBDazBmVHRaZFE5VnBvQS9DTzlPTVdacDd1aUN5YTRONUE4bjhpRUhm?=
 =?utf-8?B?a3JFR3FvMUVEU3RkVTBlL2tjVFdwTTFvakFuWlpCN1F3Y2dIMEVqRmpZV0xN?=
 =?utf-8?B?TEpXN1lSQkVsUzBsMkU0anBLakJOa1F0MjFxUE9wTnJ6R0hUOFBiTzhpUFhv?=
 =?utf-8?B?cnVPN1VrbzNZc0VRVWRwTGFyRmJsWEcwZFRXZXRIOHF0T25NWGd1a3pPVmdl?=
 =?utf-8?B?eENtNEVSeWlZeXRQcHFnZGJqSVB0R2NmQnRsTVA5Q2NUUEFTcVpOc3lYVzVZ?=
 =?utf-8?Q?3UHpcZNR7KVGejqSCKrVt+9OC2MSAZDD8+hhE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f49673b-a265-4242-033c-08deec1488eb
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 19:23:27.5449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEiQHDTuZzCo+GShzTKZYjgOvnn7Lxrz7UasUEoFJNFQonox3ya0TBR7sparcAcoe6y43w60ENB35JFAjUg5/9ilEtaTw2/bWdti6Gq0HTVa678/BP8kyvFiFSivOvnN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7234
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_122332_889912_71DEBF5E 
X-CRM114-Status: UNSURE (   8.77  )
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


On Mon, 13 Jul 2026 17:06:21 +0200, Ernest Van Hoecke wrote:
> This series adds device tree overlays for the Toradex Verdin iMX8M Mini
> SoM. The overlays cover audio configuration, display adapters, DSI
> displays, OV5640 CSI camera modules, and Cortex-M4F integration.
> 
> The series adds support for:
> - NAU8822 Bridge Tied Load configuration on the Verdin Development Board
> - DSI-to-HDMI adapter based on the Lontium LT8912B bridge
> - DSI-to-LVDS adapter based on the TI SN65DSI84 bridge, combined with the
>   Toradex Capacitive Touch Display 10.1" LVDS
> - Toradex Capacitive Touch Display 7" and 10.1" DSI variants
> - Toradex OV5640 CSI camera variants with 27 MHz and 24 MHz oscillators
> - Cortex-M4F remoteproc support
> 
> [...]

Applied, thanks!

[1/8] arm64: dts: freescale: imx8mm-verdin: Add NAU8822 Bridge Tied Load
      commit: 0a0ed37b68ff9e09025f9f5ed780e6b8b343302b
[2/8] arm64: dts: freescale: imx8mm-verdin: Add DSI to HDMI adapter overlay
      commit: 70b923a721c9364e43967a9a0e7b37c52bc57ec7
[3/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex DSI to LVDS adapter with 10.1" display
      commit: e23768eba9badb72bf335e77cdfdc4eb73174bbc
[4/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 10.1" DSI
      commit: 16790c0bdb2b20f8ab0286f74a617839cfa81e29
[5/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex Capacitive Touch Display 7" DSI
      commit: 4bf5b8862fae3865069b34bdde2492e3e49f1810
[6/8] arm64: dts: freescale: imx8mm-verdin: Add Toradex OV5640 CSI Cameras
      (no commit info)
[7/8] arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F remoteproc
      commit: d4fc54ac184d036b51d1638a83f717269b86ddec
[8/8] arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F UART_4 overlay
      commit: 0c4a972d869eff8070685c055b6a9366d6c63710

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

