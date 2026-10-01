Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF34CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcMBJ1EMrXm3o67TgwSPLZ9MxI6xAN+c8oiHgNLAhqg=; b=PwxfaUCYsRJKaJ+xJ7f+ADQjbd
	BsJmg6ycME4GaPs6T7wkzS+UcoI5a12ApuZZyfBV55Nwbt6S+1wihLe/jas8j32OfFNfQHoshOwQr
	asIPC0Gb47cV9gFOZGcOUVlSQXDGr5r7NpWnRRXJbnU8Ph8K3WxheGK0uQdZghZLJjEvYqZMSQWUi
	h52/fAGdpMZVMM8VY143z9ffr9ch4vy1sZ2TtU9DCwTE7FYxlmpIw1TQX9PFOua1AJc+5l9S2yHIs
	aWb6gpaIrnPGrqLFMZBn+1/8euDrtDD02mghINefgGSE2vIo91yWQR7KIYNf1wuTT/T5oQQfChcdh
	IuSiE1ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJNq-00000009fN2-1OOn;
	Thu, 01 Oct 2026 16:11:46 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJNn-00000009fLt-1pFP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:11:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LX62eZmHCJmiKlMS3Fg7sAC4fypuM/WX8pRbhJn8bwJ/H7oPtn0TEv8O38nMuYRxUgm4SnmbftPWMnrk1DrBE00FN9tkXveoGKvNzB6DL5eG/s7IGZBRJDSDb6/hizbKcQJOEQXDL5osMaiRpZCzG57gOzAF7v09LXfl75EV9IU9j9YyL7TvWPFgooDObdI6IPNVKh6y4s7ImVSsCAhPWzlh1zce7W2shMADld7FeTbrQOZLV415VPH67Tzbk7fNepyv7wFXUHTlvCRK6GwVM/BMUEEbeGWskMB6MFQTauqD8mZinfM3A7+d/bZc3D9Tqp149VamfEyi1JnQq9f6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcMBJ1EMrXm3o67TgwSPLZ9MxI6xAN+c8oiHgNLAhqg=;
 b=yym8T71eCSNggi5GSAJbvoT7SbtECqARK4c2mzXEud45uwPRe5Jid4gD8FxJJnfAZTA8fMjyA3+fJrypQEjWA5pLboPoER9Si3rUl42XDGXYw/6CxPAXYW8UuqLcc7hGdJOOucFhaoyVIIMsKbws0gFR08gHIn7TOIi6TaQ4hwcSZdh7iNh4wya1bH4l+XrFsk1fEx8QTOh9Klfq4H44y8p+kRhQ5t4JAOXki0QyHC+KxNqp+5aKQurB7HgoI9cUiYaFGotJX2HEWF4ph/UBJBZKV60p5T60OvFhmRk9Vwn9zWcRAH8Cb0UJEBSMrjqRrNoUAJssiloRXy2fTt0tXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcMBJ1EMrXm3o67TgwSPLZ9MxI6xAN+c8oiHgNLAhqg=;
 b=PeCuvLkvXK3313xBYAJFEVsw/HtKjQ+JDf6+EpHBGLRY8zuDup/Vx6gINocCcH9okxdExV+WxnwseHxZmSWO2ZdaysZXExSrswxmh6fUHKw/aRjqiToNlsQSLA9atJEZ2Nc+VSudp8nLGOIQZ07GCqJ2Q4bfMaKdpDiiFgt6rFJPAwY/eVyCHSLMzICNA4DtN0vBFTyMzupGsnLqJBeZ2y+5RwCzeRtm9vTMhX5SYwghhJBljA7Fb7/AUsDX+ZejJfOOoUjxAHEraY9azOPpaTbezA3EElOT9c0QMnthswYnVM2u/4Jqiv+HTWYqM4fDfv7Wudn7H7qJMfMRpgWV2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8287.eurprd04.prod.outlook.com (2603:10a6:102:1c4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Thu, 1 Oct
 2026 16:11:34 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Thu, 1 Oct 2026
 16:11:30 +0000
Date: Thu, 1 Oct 2026 11:11:20 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com, hvilleneuve@dimonoff.com,
	marex@nabladev.com, stefano.r@variscite.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] ARM: dts: imx6q-apalis: Add HDMI Overlay
Message-ID: <ar6GKLLRaoLocXfR@SMW015318>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
 <20261001155412.3177428-2-leoreis.costa@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001155412.3177428-2-leoreis.costa@gmail.com>
X-ClientProxiedBy: CYZPR14CA0017.namprd14.prod.outlook.com
 (2603:10b6:930:8f::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: f1c2e91f-2170-407c-580f-08df1fd6a776
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|366016|1800799024|22082099003|18002099003|3023799007|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: vi3gmti6lXgXZItKH+fg8YURE1UlIGcuzWCuYhLnA537tef3IDRNaRtUCAnzV2Pcmby0bKmjWYM6s/yP8cDOisqSPa2SzME10qx9ERciwpDbviQtptlb1jFVH1gkeR0c7bsJBZNBRLW0HkqHJE5Vhh/4JET7zVN0Rn+hQ5u+ayS8e5wgvT70wqovnOnBnZ4Yn5RZxVPT9wVhBp0InaVUz5NGOEpMS5Bp17iaVspJ0fZdsM7AovVJCE3OiySQ2o4rowZjRvG3y5fHmYBHK+CDD5xQhtcFCSDLPqUpRMCjwlyEVvljfTTpgzO932KJNIpiBiLEl7V8p19qAUA2mNe2xZWbjiOBjEeqwYunNJjHZTRcb41qa8WL7zTprlw9+iQ4m8Xb2PwaopWSqLQRpMK1wQXw3n0cwIa7WAKnAmgKUr4XQ1k8RHp3W1JVraFR482NWcrgBuIx1/V8kj7vSLu1Hak8OzfvcTOuWqedy20UTFA6jogMlh5DDe47U56dq7Y7yVV3pTS/oFxCSus+RfXSBZSUO01JFroh1DwcNixKimIDdz+yF5cliwIoikVDORe2P55+2zOwMSFRAT7Pm30O557NSllD+lStu98hfuqaOUguWKRl3RvMnfZXPJny6Sc7SH4O6y7wTKjJHoiSsRA2haNQPnX+Tc9gAbcghXNgiQs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(3023799007)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NTjPDYBDxuhp8TRmvDCJcfmWDSsCiHT0dh3tn5DG2vJp4LWSNxCn2HqjEL5E?=
 =?us-ascii?Q?8LtGrdeOF3s0MGs6VyawOdLAtFvht8/8wRpKfAOHnID61ZuxjsjRT83dqPkU?=
 =?us-ascii?Q?n3Te+PjGXIA09fjcQvyEoB5wuLAU011+iAFLcRKHqy8LTPhJYQfyTSXJjJRr?=
 =?us-ascii?Q?Df9Ew2fnU1AbEI4rGyA2X+GKe50MJy1dm3STWXrWLS9hL4Yw8c8LQl4DFkmB?=
 =?us-ascii?Q?vYDWWx0lv/M86pT4ZEIw/f4HFk847yLnO2dEDhZBtLjMGuy5F5COvOwqCVKJ?=
 =?us-ascii?Q?xUS1wH9cpvTtft/Qt2M4ggO5e9/dVngyuAxuVD53c/AvazM34ydEts+Fuu/S?=
 =?us-ascii?Q?4pYww1VzNqqvfmLgrfe80Zs0rlTrMtxuOTujiNr5M6iMHVsdY5hMynZZNhFk?=
 =?us-ascii?Q?GlNYbAbi3YLfhriDciGeutjFZyZICZCboeu0XUuXilsdUXAMsS7ZFCcigw2d?=
 =?us-ascii?Q?TyPkOUDYpcRFGdOrCZAkUB6tuG0MZ0QhaxyqFjpER49uOjc6ew4JhhY1CfwY?=
 =?us-ascii?Q?cLh6YoO7QdtitUObFcP3//JIBxgbSOiUX3dV80Ss+JW3sjwLgtqRBBhRHD6K?=
 =?us-ascii?Q?R8c0S17AO1Qfn03DofFAB146VlvRt1iHA+QPBF2W5YzP5CvssbOSvT3/0P5Q?=
 =?us-ascii?Q?hjOlZovxxmHclE9jA6a14axWriHGTQ+6hgxEhuAXDRpsJBnO00SjuFPV3ZRx?=
 =?us-ascii?Q?JMN3+ejkEnm8ZUdWabBI82wO/hH0QEHGEJo2bEwmynOsSEsC2WxMnMpT8Oc/?=
 =?us-ascii?Q?upqxcknpBzY8qdPSaBSE1A97REsbBDQ5bYzXLn2DgSWESMH3uOLlDQB0bUbA?=
 =?us-ascii?Q?ZYLn3e+1PXAYhsgL1fXAtRKcqcjdyNH5u9yo3f5BgdfH/5zp4bltQe2HTyI6?=
 =?us-ascii?Q?gEmKATqdR0moKPjvYtCKDfwizVNQbadlqFfz3vacy6eNXg4ixo0ArTyH/VhX?=
 =?us-ascii?Q?6FeL9ijyOX3L/c71ROzM5JwJPg1UfdgvEO9l/AnnN51W/qpg8HRvwfUixOSC?=
 =?us-ascii?Q?sH/vPoJo6fTBhifcWrO9UD0eH0/x9pFo9mowS4fvgtvD1SWUCQvRdrrlYBgw?=
 =?us-ascii?Q?fXuX9fbhUMlr4EW4MBlxTg/1ZrOCVndODTvA03ytanQD2vftcuggoxZTY28O?=
 =?us-ascii?Q?9vdbygTD9hrf0Tbxjpf8VnTwsN3CGfMQNpAc7p2JuLkS4XHVgiPqIFU6t93C?=
 =?us-ascii?Q?2tqAOJu9XeVfvjYPcJmOQJ1isNpS5m9Apv9B2G0qiIxA0u8Q71FAV6vbiz7g?=
 =?us-ascii?Q?/EPXVmF/ZDpIhk/kSShOrvecy049svJAPCrZNxd3tfUD4kIlK7Z1Z8/U7SOX?=
 =?us-ascii?Q?wH7uUcqLnEYhg2pnfwLSE7JkW0SHwZLfEDKraOHUEKsQ0R0YHIjNsbKdiQUX?=
 =?us-ascii?Q?Ysxqx2jus1xeUdGoHRD3ONKbRKhykYFptLU9EaANr2t/UPx3ljebko2DFgpQ?=
 =?us-ascii?Q?uQp0KWLEReFkXw98IiBsFkyuz/6fmPvuErxU8oiX4TH5Zh4UT8wHuAi3n+N+?=
 =?us-ascii?Q?BBb/vEQH5c8M2CSDR1/7XC/DbAUM6OUVhWMLoiOvbjRzCyxdMPXDwbiIEHfs?=
 =?us-ascii?Q?90oUAbVFCDlyDXKlIDJ1ARFwJ2JBsSVXQzh3VMwbvdC/niCEESlBiHfnXzjq?=
 =?us-ascii?Q?6/SJrN9YrXGkci7rF4UMTK1/qkuzqoemv5ld/HNuUgl/+S5ASoZciy9mZHJi?=
 =?us-ascii?Q?PgsgZd+R/0fjXgJzSFd+O8Q3p98C/3LEGJL6A+tz4+xzvOopCoXpeGqtgS/d?=
 =?us-ascii?Q?rx+FrbBvKW/R97DGmt+cCnP0OF8pxyX9Ibh4sO4YhNWopqavTTFx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1c2e91f-2170-407c-580f-08df1fd6a776
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 16:11:30.7878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /uXXKAwT1n28aszJLyusgQu0ykdFvOTvLIyJtajk3nBYK2mqrKYXybRb6L6woITKcOx3MMitGN1AvG/CvZX9nYXjnS7G8QQw+8dTTyc5sbDJcVkuzRFmmTaiDo26bPv4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8287
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_091144_576388_EBF1D4E7 
X-CRM114-Status: GOOD (  19.19  )
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

On Thu, Oct 01, 2026 at 12:52:51PM -0300, Leonardo Costa wrote:
> From: Leonardo Costa <leonardo.costa@toradex.com>
>
> Add a device tree overlay for the HDMI output on the Apalis iMX6.
>
> The overlay is also combined with the various versions of the Ixora and
> Evaluation Board carrier board device trees to provide ready-to-use
> DTBs.
>
> Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            | 51 +++++++++++++++++++
>  .../boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso   | 13 +++++

Thank you share one dtso for difference boards.

Can you use imx-hdmi.dtso, so other boards also can share this file.

Frank


>  2 files changed, 64 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso
>
> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> index c5caca92ea10c..32d77a59c4358 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -59,6 +59,46 @@ dtb-$(CONFIG_SOC_IMX53) += \
>  imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
>  imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
>
> +imx6q-apalis-eval-hdmi-dtbs := \
> +	imx6q-apalis-eval.dtb \
> +	imx6q-apalis-hdmi.dtbo
> +
> +imx6q-apalis-eval-v1.2-hdmi-dtbs := \
> +	imx6q-apalis-eval-v1.2.dtb \
> +	imx6q-apalis-hdmi.dtbo
> +
> +imx6q-apalis-ixora-hdmi-dtbs := \
> +	imx6q-apalis-ixora.dtb \
> +	imx6q-apalis-hdmi.dtbo
> +
> +imx6q-apalis-ixora-v1.1-hdmi-dtbs := \
> +	imx6q-apalis-ixora-v1.1.dtb \
> +	imx6q-apalis-hdmi.dtbo
> +
> +imx6q-apalis-ixora-v1.2-hdmi-dtbs := \
> +	imx6q-apalis-ixora-v1.2.dtb \
> +	imx6q-apalis-hdmi.dtbo
> +
> +imx6q-apalis-v1.2-eval-hdmi-dtbs := \
> +	imx6q-apalis-v1.2-eval.dtb \
> +	imx6q-apalis-hdmi.dtbo
> +
> +imx6q-apalis-v1.2-eval-v1.2-hdmi-dtbs := \
> +	imx6q-apalis-v1.2-eval-v1.2.dtb \
> +	imx6q-apalis-hdmi.dtbo
> +
> +imx6q-apalis-v1.2-ixora-hdmi-dtbs := \
> +	imx6q-apalis-v1.2-ixora.dtb \
> +	imx6q-apalis-hdmi.dtbo
> +
> +imx6q-apalis-v1.2-ixora-v1.1-hdmi-dtbs := \
> +	imx6q-apalis-v1.2-ixora-v1.1.dtb \
> +	imx6q-apalis-hdmi.dtbo
> +
> +imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
> +	imx6q-apalis-v1.2-ixora-v1.2.dtb \
> +	imx6q-apalis-hdmi.dtbo
> +
>  imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
>  	imx6q-dhcom-pdk2.dtb \
>  	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
> @@ -183,15 +223,26 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
>  	imx6dl-yapp4-phoenix.dtb \
>  	imx6dl-yapp4-ursa.dtb \
>  	imx6q-apalis-eval.dtb \
> +	imx6q-apalis-eval-hdmi.dtb \
>  	imx6q-apalis-eval-v1.2.dtb \
> +	imx6q-apalis-eval-v1.2-hdmi.dtb \
> +	imx6q-apalis-hdmi.dtbo \
>  	imx6q-apalis-ixora.dtb \
> +	imx6q-apalis-ixora-hdmi.dtb \
>  	imx6q-apalis-ixora-v1.1.dtb \
> +	imx6q-apalis-ixora-v1.1-hdmi.dtb \
>  	imx6q-apalis-ixora-v1.2.dtb \
> +	imx6q-apalis-ixora-v1.2-hdmi.dtb \
>  	imx6q-apalis-v1.2-eval.dtb \
> +	imx6q-apalis-v1.2-eval-hdmi.dtb \
>  	imx6q-apalis-v1.2-eval-v1.2.dtb \
> +	imx6q-apalis-v1.2-eval-v1.2-hdmi.dtb \
>  	imx6q-apalis-v1.2-ixora.dtb \
> +	imx6q-apalis-v1.2-ixora-hdmi.dtb \
>  	imx6q-apalis-v1.2-ixora-v1.1.dtb \
> +	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
>  	imx6q-apalis-v1.2-ixora-v1.2.dtb \
> +	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
>  	imx6q-apf6dev.dtb \
>  	imx6q-arm2.dtb \
>  	imx6q-b450v3.dtb \
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso
> new file mode 100644
> index 0000000000000..592bd366d94e4
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (c) Toradex
> + *
> + * Enable the HDMI interface on the Apalis iMX6.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&hdmi {
> +	status = "okay";
> +};
>

