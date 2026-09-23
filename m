Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D375C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 20:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnelVJ8olU9idlBWC1fqEqI2VSPQZITIRrueqq/XOik=; b=DMXl6loGZmNjM4QUx047QrthMD
	PxfGf8jcC8qCjNm3pwuZiNLQcDCrCLZM/MDKtj+xzlsKlhb6z/V0dgavT/leqLfeNP91k+BOsII4T
	IS5BTnh2a0CuKQ+f4gipqLx7I2l+Vpfysij+2VmylTgFJyS8dYp0pZAJTHfe9pPJIaRAMBC0sv0aU
	Fj+rtIALfsXUWcyoJ1qMBkd1SY/kfQ0S4nWB1YFnY0oYN1G+HivjNgncI3rwySi1MJyyxNpFIa56M
	+8OMIZvRqf/Mt8EDzY64U27Me5vU6MxpSN+DJYNBcnPqyIS4q5txwKfvsLMRv+V+bIQVp5UaVbqZ+
	91hQ3tGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TU2-00000009ReT-43HQ;
	Wed, 23 Sep 2026 20:22:26 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9TTz-00000009Rdr-1SUc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 20:22:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZaS3zx7rbQ0DMBqx/H0KiMuwxz+zr9h1h3V/J1Pd3qPBXzOvEwZjV0S7mF8Z7xT6Z5BxpstyrMMsRmxDYvdzhR3nm3ZkFaGxpOlJfOneOmN09KS9NWACPpDb8SuSXt/Y3KTg72hBjFBQ4MwzkK+7d+1JedPXK+/8zZ3IzwkmhHHcNSKk1te/MCDH+8MemNcuDuskjqBWqkG+ZzDDX4vgTf33T6Ed6B7yjNtRvVHxJ50Wlvn3kWcDMOGQcAgkdsQGKRUo8jKE+KFDLuOVmdC9/pBr6iGz/+deHB66u/6EIVqZYixRzUOo7uZ40gcBP3qjns7wb5xTAONTwGLK6YgnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnelVJ8olU9idlBWC1fqEqI2VSPQZITIRrueqq/XOik=;
 b=RztJu1FApoXlnDT0jlRQRJsGDBGyqp2Xx6LXuevJIfLb9LOSeTBBvimTXKlQHvihUYZqbqtc52mI5nlbinXRrETO6SK3syb/UKUhyIwPJdMefWX3KcR2zqdvfdhvqvsdqhQj7AaqQH5tEknOPdqX++KsV9BbpvQ4MzatFt3mzZScFpFmi3vDSz3OSGYeh0c9bv08kamfcC1tsEJQCxXgawvzPygpOZUKU9fDcSw8Y+LAf5jNqz0Q/UgkLj5GxLBww57iNeii8fcfR45QqWtfkZBYUwddey/Wt4l40Z72jOf4EyGbRCpPbtBGPfMU5Xm9fIIoZ/Q3BEWdAgDUX8bQ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnelVJ8olU9idlBWC1fqEqI2VSPQZITIRrueqq/XOik=;
 b=ElMYFLj11HQIQtIcEJ4sEMFd1Ieyqa5aWf5Z3XdeMC/u1G+HH+AkDNG2z8czNXYaEcff6oVRLhPgFntarEGpFXVKwDV84Egi8kWf40dO2RydUe4RAtF5OwzTqEsIA7eWaS+LmxLpiucrZO5aUkO4MOSdpIGliXEzQx4DI9kBwSr8Jh87lFVC4clurXI+BDv08rXw9DRmCzmrV/+CtmSJGvAQJgZDPdKtUA3vX5cUCZb29+aQ27FW00oMNdTVvZZbcQKMUIQvYK7ZHaNNdFKOf56MF8mtRco6IDwuTpA5qKL9hI0OvGGkYnoVl78uUWQTl75lUj0o/CZHYeJqYeO5Lg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 20:22:15 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 20:22:15 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Frieder Schrempf <frieder@fris.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Eberhard Stoll <eberhard.stoll@kontron.de>,
	Oualid Derouiche <oualid.derouiche@kontron.de>
Subject: Re: (subset) [PATCH v2 0/9] Misc Kontron i.MX DT improvements
Date: Wed, 23 Sep 2026 16:22:08 -0400
Message-ID: <179019492254.3751725.4468513390400686623.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
References: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0033.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: 15735207-7096-48d7-72db-08df19b05b5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|19092799006|366016|11063799006|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: E2pBkTex9ASPtCkn541C4ediPHpSXUB8V+Ds2J71P27+V32POEkbTBo3hFuN5YUkItZODUrp+pKCC6zVgnzxOEqX6UQfhLQu7+2vACV1LjGbUY06YW9LwSM17DpvDjWb6tTgM40UWvYDe1Zn4kJBvRHrBp3xsToTRd/W5ABfL/l+0dnM3Jw4+bd/3q1eqv89hdBDL0TjBRGGPKWvgKpedTQxiSHh+H6xbwVo6XhKQvfFRreQ8Lc55WrlIWzROFgfI/mkWXTP7IP26Wyj9I9HogF+smOiLuidh1ip7AG5RM27pqeKLkM5kGf1MP1zUTYRKU7l/VLPzb/JMmrocFWHAF0HY4fenD70gguD99yaSRFNr6VrMv/Q9Dtpp4a4LV6SVj0axBoJd5hS5B0MV8n73cqhM7Fiw+dNOh3M0fSiwbSB0o6AYOnGyB1lFH2oEBsPXiVQVcMMT0es7sZN8toxUSUleI7dckyQK9ZqdjrNA14ypiibNItdEFMvkm1D56+ARGtkClrKMePPXmManyika9WGr8NKf5q1Q2aFYci/Lhw7/sqUxPDOf1DDSFNJgRKgJT887tMyccvX3xkTC3uFPguGzid2QCTr6uKALp/2990=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(19092799006)(366016)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDJlV2xHNE96cms2SWNhYWpZalJPbitvMllNdEd4ZEpNSXZpZTZVczI0UHp3?=
 =?utf-8?B?UVd2aGNXZURSNHF3RWpqdUFzaGZkMFBmQnFvWEVtS0h6bGQraUxKQkltUFBj?=
 =?utf-8?B?bHlIMml6bEVFUzBORTVIQ0RPWDdKWjNMZ1N2ZDNBZjAwaSttNjlQUVpWc2Ir?=
 =?utf-8?B?aVZtY29QNTlVUlVNMWo5bjlXZ1ptMjN5SVkyaHpEVmM3V1BwNUhPMi9CaEJZ?=
 =?utf-8?B?d0VhMGxxSENCK2ZNZCtNejNldEpBMThHL1IwaUdoRUl6OUVJZ3RDdGZ5R3JL?=
 =?utf-8?B?eU44WGhkeUhQRlFOdXdENkhSUmxCVVFJY2RjNWpadWFERUpkN25TR1ZsQWxG?=
 =?utf-8?B?ODJxdm9qbzBlTkphc0x0bVlLNUE4aUY2ZFdzQ2JWdEdTa0ZKS2M4cU5MV3d1?=
 =?utf-8?B?R0dXSmVPOE82MzFDTEE0Z3dkTmlpMC9BMW10bk5RVEwzTHpIYnB5aHh1OWlo?=
 =?utf-8?B?eWRuclBzcWV0TkVQRFNmcTdFUTJaVGswdmdwUEczUmpDZUN1SkRxaDJsK1FX?=
 =?utf-8?B?dDl0SzU5L2w3VzNXd3IvbXJlZkl3TkRZSHhsLy95YjNGYmhmczZHNUlNem5m?=
 =?utf-8?B?ZEhQR2hwWWdmb3p5UjI1Z3VSR3BEZE9TVHlhSk5sT0pCZEZqOFZiakVWc004?=
 =?utf-8?B?SVlRdDdUSXkzbUNsRGtmR0toU1FuUTV4RkVmKzgwNDZaL293ZGJVQVhqVERZ?=
 =?utf-8?B?WTRwRFRFdDhnc0RWS2hybU9mZnVxSEJ5eVhjRmhjblVtUjNQeGgvS0RFdno3?=
 =?utf-8?B?TkN3b2tFQnZYRjFwdUdGNVhoaldIaGkralJHb2cyUTltbXVLUU55dWtPYlVW?=
 =?utf-8?B?MmsyTjd6T2VwcUp1QmE0TnhJU1lkY3dnSmg3OWJyaURWKzlZLzJGcmV2TVNv?=
 =?utf-8?B?RlNHWkdCTFg3dlVCeHdOcGpJQm5TRWNhejc5Smh3QWhCR3owU21sZldpVmtD?=
 =?utf-8?B?bk00REJQS1p5V1FnUHZXRFIyMDVYTFpQaDJ3TkVUcTZDVXJadHA0RHhGZ2xX?=
 =?utf-8?B?RklIYTVMOTg5MTJMck1ONmNtcmdSd1NtK2YzOWlCWGt4c0VrQUM2QzllVDg2?=
 =?utf-8?B?SXNYWFJTVTFaOTFxMFc5Q2xya2RNZlVIbXdwc3cvMU5nUlpVYUZkYlhUcFNi?=
 =?utf-8?B?WjlDQlRGRFBMRXNwL0c0QitBWWFIdGgzb0pBcTY5d2F5bjh6aU50VWZZeFVH?=
 =?utf-8?B?YXFCVWZXTEx5ajBnQVo3dlc2TFVLckJkaU1iUlpwYWptakpKc1ZjZ0RQTWlu?=
 =?utf-8?B?NWFYMms0SHlCRHE3OVphTk5qQXF1TUlLeUlkb3U5WXJBdS9uU01PUHY3T0d4?=
 =?utf-8?B?Nnk2RmpEWC8vSXJXRitlQXY0TlpjcTdKMm5sSW9ZZytmeTZoQ3hQYjJMOS91?=
 =?utf-8?B?cmFXaUlST2NwbElWRURwQ0FsTXk0ZXd0OEZJNytIekpTeWFBSGxyWlo4eVlj?=
 =?utf-8?B?UXVMNnBFTXBwS0R4M0tVMVMwN3R3c0Q4MWtyd0N4MFc3SUN6Z3AxSUtyZUJX?=
 =?utf-8?B?Ui92YVI1dDh4bEFwN29qUStUOVp1d09QbnpMTUNFbFIxUmtjOEp0VnJKclBm?=
 =?utf-8?B?L2VWREFZL0Y1cFAyZjJ3Vk0rYnFuRGQzaG50UTgvZVRrMWJzdFNXZFJ4MEha?=
 =?utf-8?B?VFFwdTBPZVVsRlJyQ0xtaXgwMSsycHk5QnJGNHZxcTYwS3ZTQkF3MzNuN1Ni?=
 =?utf-8?B?SnREUHZTeW1UVmxyOE9TeFNuQm4yOG0wK3pheE1xZ2k5WlJIWXBiUXFncExr?=
 =?utf-8?B?a2ZPdk9rLys4SFJPclRzYmlCQ1lWZ2xZa0VnMDNzT3VOcUdSRUVYWS9PdUps?=
 =?utf-8?B?eHJLME93d2NhbTlNZ0FOYTJaRVlTbXQrdnlmaTZXMlJzWVlJUm4raUo4b094?=
 =?utf-8?B?bGlHS0E0dWQ0cjZ6aUllTjZZanN1MDY2ZmF0Mi9rS3BNMCt1ZUxKa05xRHBX?=
 =?utf-8?B?MlM4MUhrUFprOTlQS2JKOGlZZXZoSGFXQ1BTbVRKdGZsOUtkY24vaXRoY01t?=
 =?utf-8?B?d3ZJYTJxT3ZrYUYyUXAwc1NZQnd6cDQxRTFjVmQwY3pieTI4NUJaaDhzNWNr?=
 =?utf-8?B?cXFMU09GYVhMZWZsajlXbTY2NVZFMkE4VXh1bFpnQytnM2MyRWp2ZXlxY3NK?=
 =?utf-8?B?cE1uVXpnb3Y3UnhCZ2pSU1ArNTh3cDNhZUJFL3d0OW1uZ3JBSENCVEluaTc1?=
 =?utf-8?B?NGdCdnN0OW1NOUpHQzNwU0l5ZWxZamVtWEtVdzVYazhZUWVxb3orN3lMR0JR?=
 =?utf-8?B?Mlc3WDIzcDc2ZDZPallzQlJDTCtJVTBGZUoxMDQrZDJRSDRLNVBQL1J2cGJO?=
 =?utf-8?B?VTJQRyt0UWFSeFByQmdDUmRSZUo3OWVoM2QzOG1tNitFYTkxZENUbDNYY2xX?=
 =?utf-8?Q?sZuTXokmLtHhKV6uTq6X+uH6LUufQHwOtyI2O?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15735207-7096-48d7-72db-08df19b05b5d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 20:22:14.9365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YVJIJIg1WVQJkMNpYuz7cqfJ1VAE6ofTSavj5T9kIXtr9wr0JdXxyXuuFMRrih18VhYcP3wOkRgjB11PJV/8EgDjEFNkoN9INKOgJbHVQI9BD9no+GQZjMlFpEhqCZq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_132223_400538_68D089C4 
X-CRM114-Status: UNSURE (   7.14  )
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


On Mon, 14 Sep 2026 15:46:08 +0200, Frieder Schrempf wrote:
> Changes in v2:
> - Patch 1 and 8: Improve commit message (Frank)
> - Link to v1: https://patch.msgid.link/20260908-upstreaming-v7-2-imx-dt-improvements-08-26-v1-0-4d0e8a75db79@kontron.de

Applied, thanks!

[1/9] ARM: dts: imx6ul-kontron-bl-common: Replace UART3 with DIP switch GPIOs
      commit: b2e2c41c398d6aa097203e70c7acf82ba4c5a6a0
[2/9] ARM: dts: imx6ul-kontron-bl-common: Add GPIO labels
      commit: 27408de30b6e5bb93dfb99af508a670abd787b00
[3/9] ARM: dts: imx6ul-kontron-bl-common: Fix USB OTG1 ID pin configuration
      commit: d3b1ebe5a7a1f345fdc75a657ae725af0a0bbdbd

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

