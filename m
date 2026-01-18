Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FCBC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 16:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tFOXcMgkwJIYv59vNCsUfi5OgsT+art8IW/UrAv6U/M=; b=A7MZs5vBPk4Po26LnL/S6hAqP+
	jwiFD8b6mZpwDFWXnTkhtyTWzUMtp5sdVcDxhFjA+pVv4WfXIrqwzS80BAxbJnuKJSOaioLNx3Oqd
	7JPtHIFtvbvWnH5H2v++V6wc7qNdHct3KIToClh58eWSdX7HCjd0YpVar2uL268EwtRW7nYCLmof0
	9iprbl2HYexZxXa8+nN/o+iJGk3bdiOIa7Sq3U+um1b7qG9MZBrYUZBbG5JolXXLaUqljUFx7Ij6t
	cGIfjE8I6LqnVjzQl+dmFALu+nlX5c+uckh9d/LTvkI0oJ45FvpdSMPS8w1epICj3B6a8UqTXPLNJ
	GytE4Qfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhVeH-00000000TUo-0oZo;
	Sun, 18 Jan 2026 16:29:09 +0000
Received: from mail-francecentralazon11013050.outbound.protection.outlook.com ([40.107.162.50] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhVe8-00000000TIu-0CZi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 16:29:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxU5UlUGMcaDGg6eo5VpbAPAWZ3Eln7PTRHdIuIRM8Q9lnaXv7dy9pC7aHzPkPmdfbg0k+K6HK5HC4YthuJzE9bw3tzyLZ8Wsk4Y9ucVmvhYpDV3IpG4B1FT3ooTb7yXsKSTgsuVxceSqNlfQIHrzf6tTjhPWTUyUajhOWGSkfcJuEaRPuHM9wWABI2PN8ipNYkoCKljxLd6bfJ0dcGIQ6X0oqefnsC9SyWel9l7pzRJ1vfcbgp+vvy2pY801KWWiPcI7u37oTByU1KAUNSg7dywm4DeXGVaTn9RS5EPA7FrcSYDNxJi9DGJA9R7at2Edupg+t4tXWxG3vFONHvcjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFOXcMgkwJIYv59vNCsUfi5OgsT+art8IW/UrAv6U/M=;
 b=fETmFijCzmhbOPWimrT63ywBp4DaGOyTAI79A/t1vTQWGVJml3DQL/2/yoNE5IQcqRsKeDLhxhSxsoHwypHIZ7GFjqumtxkKhNt7BockL5EEuuPYTYUxXK/OQlPNv0EDyY20sdYDoTPm8QDqIXVSPXo9aENxBn4Ud78Ov4qOdoVDyHq6Oi+roFNB6Z9UU7SI/XV01OhcefeRDxRLhF1iXhGsmEmw+Kj8IpGnK1smtuNajWokwLW4yzlwL2oYAKNJcdJFCB4p8A+j931JNByvAHi4IUzKKBGm6t0sCJYs3NeJOijiMYhQLF4bQe3J1W7N3WpcO02NPT5PPZ1uxxbcOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFOXcMgkwJIYv59vNCsUfi5OgsT+art8IW/UrAv6U/M=;
 b=M5M5X2TBB20sxFXBYflEYNzMj+QlsE70kIG3xThkYwlybkpTF2pLt9WP7DChTGdmOQrs9k3h174421xoHov3O22a+w2M9pb4ChjG1ubc5mgNVFGRAGYbuU342aOugq7HjdEzv53JsdOetgKqh/50sungMlAUCH1vWqvrgiaEHYiTQIJU1rSZekYKj1WJTXS/H/zYbX+cbdZTdr72Ob0VZzdXaHMPnoOi75s2aJn92vmAC3BtzLRr5ezV1RE3U67vHrNFs9ilMtbQ5mfc5FFg55ZDIsariSsg725mDOoxMZbS2MTkQa1U8f8FFL4rfCrWiD/m0Jj/O/gsbp0Fm3zz3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AS5PR04MB11348.eurprd04.prod.outlook.com (2603:10a6:20b:6ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 16:28:52 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Sun, 18 Jan 2026
 16:28:52 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Sun, 18 Jan 2026 11:28:03 -0500
Subject: [PATCH v3 6/9] arm64: dts: imx8mn-evk: add bluetooth dts node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-misc_dts-v3-6-d3564716cbf6@nxp.com>
References: <20260118-misc_dts-v3-0-d3564716cbf6@nxp.com>
In-Reply-To: <20260118-misc_dts-v3-0-d3564716cbf6@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Sherry Sun <sherry.sun@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768753702; l=771;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=uG04miELlkG9b3Dtx/9qcoI9g6Fip2oH2LQaCWN7op0=;
 b=jbfJQOEa9YGtXbw1Eiqoquo3jCoKtS8NXEfMu+9YAfI/j06/ozxEHF4Sn/25MH0p3bXk18S4N
 xFBl7elLeUDC6Bgu+irwXSbkmnYPyiF3aIJWmobpjssAHR4hLBu10lx
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0158.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::34) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AS5PR04MB11348:EE_
X-MS-Office365-Filtering-Correlation-Id: 9227e004-4f64-47f4-58eb-08de56aea64e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|7416014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk9wK3pLUEtmY3duNWt6WWdFdTlMZUE2MHVvUU01TUNlU0JtZkhaL0MyRU1K?=
 =?utf-8?B?OEVURnduSEF3eEJIZzViaDVLQ2htMzdtbzZvQzJ3M3RlUlBXSGlvekxHZWw4?=
 =?utf-8?B?d0FUQTE4SkpFWWp6OVN2dTdKbWhMWktUVjMvSjlGdCtjTE1DNlBsbnJxdUlT?=
 =?utf-8?B?UVZwTEJZMlhwaGQ5Z2F5NEE5bGNyYmtsNkV0UGpRaFo1aC9zcmFJKzgrbXhR?=
 =?utf-8?B?bGhxSnZSSlZYcUx6OGNmT3g3RUpzTnJqWlVaS3g4MVlpbEFwWHNYbm84Vksz?=
 =?utf-8?B?dnhyYnl3SmhKaG9RMTNTQy81Q295OVZJcVo0Tm8ra1djMUV2RGthM2phR0tS?=
 =?utf-8?B?dDNvVCtsYWNRL0tzWEdObm1PQXZhcUdZWDRFMDl4Tk5COU1xYlN1Z1hWVTg5?=
 =?utf-8?B?ZjJtVm5TVm1vTjZIRytPRFBxQ0cxdlBJMDdDZ3o5dGhrQ2MxMWwxNjI4bjVN?=
 =?utf-8?B?RzFlUll4b3JTMVhwcFVoUjA1MTJHK205ZEkvWUZPTlpQU2FVUFUzUjFEblhH?=
 =?utf-8?B?RXNKWGRUSjJLdTZiSDdDbzhqT0JJTHNBOGdBQzFJenRwMG5RaUdIcjVoSTNt?=
 =?utf-8?B?MGVPNElRUklMYkVtMWN0ektBRkVpT3lZUXJXbUpqK2h6MlBwV0ZDT3lrdDBM?=
 =?utf-8?B?Q1VQU2kwUWZPbVp2Y1dDN2NvUExBLy9LeTFVYVRLY3R3OEx4OEpSbU1LYkEx?=
 =?utf-8?B?c1VPZks4bHJoWnVjY1h3YjFLSjlNRGhXbFhhdXpsdG9tbGpCZmcrQjNyZi8w?=
 =?utf-8?B?OFdZbFJFN2RxVk12UENoa2xsUGZBbnZlT3h4b2lKYS93SGZ3UGdQeG1Md2pM?=
 =?utf-8?B?NVBuR1VvNHRwSzkvR2pZS1BtTWVaUGNReUI3SHlIVFRaZTZRcU9KdkMyMklx?=
 =?utf-8?B?N2NsbXdpcmxSQ1cxZGNqbEl4aEx1OXpCdkVUSUREQkVISUMvWjJnRE1mVUhV?=
 =?utf-8?B?eDFtMDc3STFYQlF3MEtUUjUrK0ZUT3h3RnkvR1p4bmtTcGd3THdURXhxUFF0?=
 =?utf-8?B?cHVoeGVlM0hmeERFOEJQNkdLdk9GT1Q2a05LSCtnei9iblhhZ1VZaHVXcU1R?=
 =?utf-8?B?TitOWEU5Z3JUVlV1QVpQUklLNG1peHJiUUI3YnduY3V4c0c0YUx2TjZwT0NH?=
 =?utf-8?B?N2ZMOEpTUmZYUEdqU0p6WllBcnA0TngzUEpyamRlZnhvd2ZDa3dZSlJoeHF6?=
 =?utf-8?B?eDVlMVZWRnM0ald3dERUckh3S1ptK1RjK0UyMHFRd2RqYVgwVE9Ud2ErYlR4?=
 =?utf-8?B?YzF1Ry9WRXBUMnl1d05icDhsZ05qWjVjb0xFZ2NSZnF1NC9rdVBSS05uamZT?=
 =?utf-8?B?UWx5VjhzSjA3dGczRnJwcCtOTlpwRktQb1Mra29mTFR1SXVHYThaMXV3YjQy?=
 =?utf-8?B?TmV3OFRvNGduNElaUG5KK3Z5S014MTI3ZC90MDhqMHBseWU4bWlVbS9Wb3Yr?=
 =?utf-8?B?bzArVGkxUGcvc1pYUFJKeXUzbnkrTnVSK0hCMkIwNkgvTCttcVFqNzViak96?=
 =?utf-8?B?TzdaM3NpbThQNS9UMVdwRE5TNXk2MDhOV0dXL2FYNTR4TXVLRm5vRUF4Nk1L?=
 =?utf-8?B?TFNHR0JXQVZieVlVUjBxRisrYUUyZlNxMFdNMU1LTDFsUWhzNTQrSFh1OFAv?=
 =?utf-8?B?djlIQnhxNktRZGo3clBTY0xQS1kwZFdwUFJyYlpCRFg5aytiTGE4QU1uTTZW?=
 =?utf-8?B?WVhyOWttYmY1QzUwaVVoSWprSDlJYnlhUEFRTTBaL2V5T0FIbW82NHVaeVY1?=
 =?utf-8?B?RHp3OWN6cFJqc3JHNzZzYzFBSjRNejFnUTU3N2NGcGl0alRmTmRSa2ppTmdv?=
 =?utf-8?B?Q0c5dVhaNWx1L2g5VVArUkkvNDFWeGJZbzdVaGN1RWtobDdKcG5pREhGaCth?=
 =?utf-8?B?c1hHbWhkQmVpczd3TzNHcnJnaWN3cHBHWWhkWFBIZEkyV0tHZGFnb2VxdERU?=
 =?utf-8?B?RUUzUDRIRlVzVkFkT0dZTnE5TmFrV0F5UzhkaXVESFdaUkV3QmJ3TTJ5VXRD?=
 =?utf-8?B?cU0vdTFpc2JEWDRpeFFPZE8wQ2dyK3pGY2U5U3BGcm1hMzBPeDVQcVk0enR3?=
 =?utf-8?B?ZVJlWWFUaTE5SmdMdDI5akRVQ0w3MWZ0dEF3VVdlaVVndTRaTU1mc2oybkNh?=
 =?utf-8?B?ZmpmT2NsUllEZXE2OXpjUWNHRHhOUWZVZ0NMcStncW5UQTUvRzBPcDV1Y2RX?=
 =?utf-8?Q?c/3nW44yqVX/rtaHzVNLANc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWYwb2FJeCsxbE5ITlRVbXVpbTd6dm90MnE4cHJLRDcwUTBOeC9OUG5PL0l4?=
 =?utf-8?B?cktUR0pycGhRM3lMaUt1S3hwdXNzK0FtRXprUklhUXhmeVNiVk4wcnpPdHUx?=
 =?utf-8?B?NFo3TVc1enVRMlhzWWJZL1F0RFFhSzNxOHlBMUdoYzB1c3d4MnY3V29MdGJu?=
 =?utf-8?B?MTRHbmpOeHBzREFIVSszLzBZZUtvZEY0cUhqeEJtalZOeUFKMlFoenNHa2c3?=
 =?utf-8?B?TGRweElWVVBId0J4K2JTeXBsaXh4VVVITW9qaktMOCsraDB4WnJxWkdxcjQx?=
 =?utf-8?B?Z2VDUkxKam1PcEtvRWh0YlN2eEtBZ3grYThSWmlQOFJiYzVEV1psR1VsUFZF?=
 =?utf-8?B?a1YwZGcwc00yOXFNYUtFSlY1TG54WmlCTG1aV1VEUGkrUDROdm1NdG51STg2?=
 =?utf-8?B?WGlrZ2JnOTBrVExZWm8rWVJ1YmxyWkdwVVUwbTdVVjlVZndRWkRTaEFqYU9n?=
 =?utf-8?B?VkZNTUo4TUFPRzV0ZjBPWmo1bVo1TUNTd3JhaVlPTzRSeG9YejVjVTR5RGk5?=
 =?utf-8?B?cWF1bnZmemYxdEhPejUxWlFhelo4cVVFYTVFUDhqTzloa1RodW1yOXRYNDlL?=
 =?utf-8?B?MWhrdW9XOFpTVkx5ZlBDRXRKamlkNGpVNE9Cbis1bVJ4aCtvWVlLNTIxMHdz?=
 =?utf-8?B?ZVprWFptVlVOeXRFb0pnb0R2ejlzU0xGVHVJeWFmcUxKUjVFV0g4QjliejRk?=
 =?utf-8?B?VmlIV2N4VnZnOER6QW1JZjc0bmhqQnRPSkc5K1RyQjBRWjBaNFZoL2RBZjQw?=
 =?utf-8?B?ck5NdHNPRlIrVmlzQ2RoQWxoQmFvWjEwVzI1dG9KMXJvL2NsRk1NYzZ3ajh5?=
 =?utf-8?B?c2pud0t2VDdUVlR3QzZwMUVHZmdDVFFFVTgxK255a054eWVvN2tQbmdTY2hv?=
 =?utf-8?B?NTJPUVNWRStHbzF4L1hPTlY3eExDOGJNUy9xbXFhbVVLb0N3R3p5dWN5b0Nz?=
 =?utf-8?B?SHFTWnR3bDRKcUlIeFJUVVVoaGF3dXdna1YyWEFmTlpWOTNJQkVHNVJMQjFo?=
 =?utf-8?B?VHduQTJTS0d6QmJWOTZpWHR3WlNvdThxNkU5V0twVHFmcnVHU09XTlFaNlpK?=
 =?utf-8?B?TzZ0WFNMTlU0SDlIcHVyeUVEOEtqOG1tam13SkZnWUsvaFhwaVdwaHBtM2Ni?=
 =?utf-8?B?cUZPMmVuUXRVM1FjbE5nY0Vsa2FqNlVSTWI5NUE2RjZQam1kVXYxMk1xRkpK?=
 =?utf-8?B?TFpKd08rSHZJdGtKaTFudVJRaEZ1elN4L0Q3MGprdDdaQ3UrYXYyR0NYZkpM?=
 =?utf-8?B?YWZYY2Y4MHlKMEMwRHU5eWVLTlZDYWR6aXl3NmZ1S1NZalBicHpoMzh3M2cz?=
 =?utf-8?B?TjRsVXpQOHpCSW5TQ21oNnNDQ3lkWjRGNEhjejdUTEhJWkRZUllaQ1B4K0s2?=
 =?utf-8?B?VUJ1SXgyVlYwREdLU0U1NnZTUmsvd1gvV0x3aDQ5RmlXalV6bjB3dEJoNXFk?=
 =?utf-8?B?NHVENUk0V1M3dGpKRHRKbm9OV2JFbGk2TENEVEJHdTJlanJWQ2ttMktSS0Ez?=
 =?utf-8?B?cC9EL2xsM2p0bzFaVG9FS0pjKzVGSDMvMm9TVWRKclJoUEhyaHJ5UUV2TVJ0?=
 =?utf-8?B?RG5OUVpTYzhvRVpxSFZOYXN3R2xvUkczb3I5NGcyME03cTBRd2FFc0Q4UDIv?=
 =?utf-8?B?d0JEWmJ2Z2NvcjR5d2hCMUhYaFVvQ09NblVFL0d6aDBCVzk2YkxuU0FxeFJI?=
 =?utf-8?B?TS9rcDVMZzF5SlhwOGp1MXZNVHRWdWtkSzRPbFR2UWRBR01ERTJ6YVQvTGRa?=
 =?utf-8?B?YlNoOGk4U0x4R1JmL1QwQUhCNE01R2cxdGMxUCtnOVhqb0R4MWFGRytQWXhB?=
 =?utf-8?B?QW5zZWpzT0FnbnJGMi9SSTNNcmxYeEZrZGs1bzdkejg2aENhSkZzVG93VVIy?=
 =?utf-8?B?T1VwbHU2Mk9GcjQ0V01UVVlFSUlzSTJ3NytXVGNteXh1NmFMdldXUDFIb0l3?=
 =?utf-8?B?bkFEcTFDRktqOHNMbjlzU2krbTVLbGxzMllHZzJDcjBJTlY2UkxnZnVOZmlz?=
 =?utf-8?B?QmsxUFJnVGZsTnlSb2JSZFhiVXBUOHpWNlFpY0MrRXdqSUQxZHFIaU9SV2lK?=
 =?utf-8?B?K3NsZ0NIQTRFankxSFhXbGlpdFRBdTdsd0NIcGUzbDJmWmNrWWVFK0dYTHRa?=
 =?utf-8?B?UytTaVl3djlMQnhTWWRQUlVXSXRuTmJTcjF0Y0o3ZVVDdWo3c08wdHRUQ1ZQ?=
 =?utf-8?B?YzZNTTZCWjl4Ym5UemtiOW1CYkh5T3puSnhYbEJlS2drTTRNL0VieDNnQzRK?=
 =?utf-8?B?S3V0eFpGTzMzK1hhQ2hjci9FOWVQNENCYXRXTVI2eXNuRS9oaWoxd2hLSkg3?=
 =?utf-8?Q?cXghjcsYg0v2NKT2AK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9227e004-4f64-47f4-58eb-08de56aea64e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 16:28:45.0736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YXqTNg8NNJLF1zwhwX2F5hL0rspHRuIlgELPSsGYCcypCuzlg9YtUk+xhHKXe/pYyfGmCAoNWNwAp1h0oRLeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11348
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_082900_084202_C3D7449D 
X-CRM114-Status: GOOD (  10.21  )
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

From: Sherry Sun <sherry.sun@nxp.com>

Add bluetooth dts node.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
index 145355ff91b454795478b504eb403b0590848d46..3e590afa4fabb0cd881d87c953459f9cf2b3bf65 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi
@@ -415,6 +415,10 @@ &uart1 { /* BT */
 	assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_80M>;
 	uart-has-rtscts;
 	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
 };
 
 &uart2 { /* console */

-- 
2.34.1


