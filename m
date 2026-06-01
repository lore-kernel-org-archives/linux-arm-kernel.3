Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FED3CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 21:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIdBkenJvKI0gAe/EZyIMyTEcJaCdajaAHe8PEyhDYg=; b=WJxE6b+ILHN31CPWO0gw0OhEQq
	FaxMFkhRUZHxp7YUSEyQIa6woMudwTmh/FGKXl13QXdKs+jxI34W5lVRlRCOMjfPFb8MrPPUVhSNh
	02pw2keGbThna5tobN5TMDi47+k6zqQzTUJvOkxVo/3S9rE7Q0cIvrU+xtPi1Ln/jIOlKC8SfPb04
	CdOdbfYZDwQAv2XsXrMfVra6uAQixf/xSBpmi/VBziCRvo3uKoBTDhRLf/a9PiExtEe8aKMde/nOa
	HS9Gx0zCky6dEhnwhcnfEBTRUkZ8zg4tpA70Gy6JrMtbsKHXRPQVGTJqRW4RiZR1EzNEt2m0RiGi3
	awX15GaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9mX-0000000BqDF-1ywG;
	Mon, 01 Jun 2026 21:02:45 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9mV-0000000BqCf-0Uug
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 21:02:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDpAIRBuWDNYSxMQzc3oXDm69tGRUs/3tAcTk4Zgq8hPP6RT4IbzN4unGAWsQ29Ni4HbJFheGQUa3p0wB1EmESmLVJIFNxkTMV22QDIcXb4Py27gVTOs/WjtXJ4hyh2YoX5iZ1+p2tgVd0gNzf5aXm1LkqFX1YiXs8LNDfOGiJhtJiMDYHvY/DMxkG/C4sscWyeOb26fVfSA7mdA4vsdmbmZBg8smfqLGuPvUwmb9XLdi+Jtcnpd051dXndbU2Rd2yj6DAHh+yDOALW3swuhnkdBVJWXT17oIHOK1X2YC0noDKb4cjBvXU8dgUKi6qyTolU5CYDrbV9LIuS+vFCFVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIdBkenJvKI0gAe/EZyIMyTEcJaCdajaAHe8PEyhDYg=;
 b=ce2eadTJFk48K4JL0+/W71wMrpmDNKLfS6srtSugzgqs3nlpADjgVJQlaWskaUVCW0pqkAuuZcUb68n9M6qXTzLsHmHfszaF+MGWZ87aESZf9FZJHMJd1Io3ECoBj/ZgtZNY9VtsXc8glYtbpktC23xVMenIF4caXXNdQ02hR2by0rfestS0cmJHWvKq1wXSn9lwbX4aVOfzQ/l7hK83P8VPZTmIdQZ0F3QzIV2SqFn62DO6cPjCRph3amgPSPIY9jZ/v92Nuf86liX0IvOBau6hBWuuUfnIW9+fRAC8S1DupOEDP5IB8DKp4Xm9ac7sP1WQs338zhx0WfABhelmzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIdBkenJvKI0gAe/EZyIMyTEcJaCdajaAHe8PEyhDYg=;
 b=nH8Hg9iX4ymMlR9wyzI00MIPIqsmll8LIc8m1oRu3CmIVUBWi53+oDp/NvbfLgVVAb1gByJuAtE+qM4MdJ+R8sxkgQ2aFBj5Jc4OUA2UJB3M80knQ/LhSg21PF2BpyN0ode/5/sUvJTpBNIAY0ky1YZh14GmgYMTMvU896m7aaqPiQ2emy3wUYLYSskjt+nEkvBfJAf75g68nlkuqfOrnpkm6ROjH7IDNbF7uPAlKtv5pCWs4K/wAvq9Cu59eSrFdA4rpOrMcQF4ffTXIyW+1ftBv4WMWcmq8usB7ouSpN+SNfl1GpgxXGv+9pVPS7mvZZ6d8j392qeOFmKWE5Fp/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB12079.eurprd04.prod.outlook.com (2603:10a6:800:310::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 21:02:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 21:02:39 +0000
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
Subject: Re: [PATCH v2 1/1] arm64: dts: imx95-var-dart-sonata: add CAN controller
Date: Mon,  1 Jun 2026 17:02:32 -0400
Message-ID: <178034774897.583570.3114832697826515081.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528160358.19006-1-stefano.r@variscite.com>
References: <20260528160358.19006-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB12079:EE_
X-MS-Office365-Filtering-Correlation-Id: dc15826f-2567-448d-5256-08dec0211d47
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|18002099003|22082099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: V8ZV4Od9cD6gRvJ19jswG62zCt1JPRwKaQPE1fw5h8/lin/c6ipPSv2FakVQKqDC63ibpzGgC0CP4wV2LfTb/0rWRWQ0bjg//6Lud17KuDPo+05Ip60YsA/m1djxXwAB5etXVfCebKedmwgGozT+8d8ki5WfBZw65lnvuhlyuFPoYWcW6AiEJ29TkJGhIUgIpX3PyqjMknfv8vJqUEuUHg22MDA6vrMXA/tvYftz+bpAjcWWbj98aawvH+oP0CmHb7fi86/DMncyIPMeK1XIbTEraYRj7OuR4XzdX6uSH8Sncdj3s0KFqyJzTlRuhm7C1UnQe4nE1j6+SnOlvUKBmPPHz/bTwIV/2fL/z6Hl4b30VT7sKe+rINkuzRkBFganZ/JXq9x19gKFTiEmT7fcxN+8d12Jn2hrEx8U73IuwOO/fPP0p+SWPI2dboCY/GnVzdP++eko5ElZ1f9++FfXVgVEMPbDumtfAt1FUZkVFanuuzS3uNRLiFUDhqdYRHFZFZuEohMeSJso+yYEUHPTuyjUm5NS66SptSWTBnk1cWtcGXLcSHSVoQnu87KU3E21b8Fp7lyzP4LtyUjixUfLQjr5GLQpmN5vwI9mpdyX5nLecQArPSAWAyOGcZ2hQHF9Kq06rJ5U/8c8gbiwfs9wbHGmYAdAPvjVeQiC7vZ+wzWFSuJ2rjVzghcdUy/OQooz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3NxQjNqczBxbnViL0hxVlo3ODc5UGNjU3pNZVltSm00WHJ5V2xlcUJUcUxt?=
 =?utf-8?B?eHFVb2J5RFZ4a2hxYi9ISE16V1RaM0NsYy9rSCtMV00xam1WMEhhQVB2T1NB?=
 =?utf-8?B?NjV6djg0OU95TkZhRUhDZ0RROHdBanpHZVVYdkI5SzNQL2ZORm1aYnY3UGw3?=
 =?utf-8?B?aldDRk1BZjQ2THIwMUQ4cjl5TGFOMTRGZUtvR1lXa0xZSVgxTmh1R3NobEky?=
 =?utf-8?B?cWdUUm1nQ0EwQTVFV2xkbHRGUlMwcXh2SWRYc2FORXM1cEY4RzljWjZzVHdn?=
 =?utf-8?B?OTJRU3ZVUmNvRVMrb0RwdXJ3a3l3NkRzc1RKenZXRXNPSUJtVjM1ZitoUHE2?=
 =?utf-8?B?eG9uWFBxYTBFQVNza0xnUzVaMmUwRDlYUndlcnVOby9kQlVHaFAvN1RJOVB0?=
 =?utf-8?B?MmJySHJKcW9seURIZk5mOW96MytmbGxveG5GNXRpK2gxS3pDNW1oT0w3Q3ll?=
 =?utf-8?B?b1Foc282MnRwYmpZeHBDTVBYZmE4LzNVME16SXVNM1kvOU11NW9TSnVVTE9I?=
 =?utf-8?B?VmRIZm1rK0hvejB3aVZ1MXg1a3FuaUJIMzFWUzE0VXVWSFBLaU9hQXNxNjM0?=
 =?utf-8?B?VmZBbmx1aVpSakFFOXoyUGtUQUNMbFdrZTZDZHVKVGVDVkxoM2pmUjZwbVgw?=
 =?utf-8?B?MzMxdVU5S1NtRndYRzhaR0pZcGtpOHQ5WUlSeTJVM25oVDNhRHFGSGNsejIx?=
 =?utf-8?B?SUM0K0pEVS92bmErS0FSdnRVbHEybzRiLzRZVHQwZUFXb1VObzhlM2xvOCsr?=
 =?utf-8?B?WDRLOStxYk0zdFNWQnJ1UGRaTHl6N1JMMWhPbGNJSllEUHVKYzErL3pnVlIy?=
 =?utf-8?B?TktnaGsxUHhMREs5NTBBdndrRU03Q1VCdWdxaGJPMzNTYjY1ZnRmZEI3MzNC?=
 =?utf-8?B?eUVHcnkyV3liRU5RNDFxOU1ZdTBFYTZmUGpWWXhLUUZYYzd6SFQ3UlUvTWFa?=
 =?utf-8?B?RkZqdHFkU2FDdWVIcnRDcjRjV09sL0tNbkNMcFQvcVh6R0tkOG5jeWw0UzVk?=
 =?utf-8?B?QTVkRmw0bW1XbjhZbW9tMXdobDVTWW12QWdpYVE1emZuKzdXVzlIVzRId1dQ?=
 =?utf-8?B?MDVZL0dGcTc5d3lERTNlUm1FdFZ0dm1nN0FNa3ZPVUM0N0NWeW42WUFIdXdY?=
 =?utf-8?B?RGcwbEdnV00zUW1YVTc2enZkV1BHaXZYdWVSVHJVZHpmRi90S1pRVXVjYngz?=
 =?utf-8?B?eEs5bmF6SjBSR1RXdWNYSFFnMUlnWmdmSXN5cmVhaDZQT2pNQTU5TE5GL2F2?=
 =?utf-8?B?NElwOXhqVk5EbVF0Z3I1RXYzNlB1Mk9aaGkxME42STQ0aDdCL2JmajAzY0xS?=
 =?utf-8?B?clJIYTdVYkN1TVhJK3dUWjNER0NrK3U4c0ZYSG5XNWFJQzZkWlFYNkNzVFdl?=
 =?utf-8?B?UExYQ0NkV3FZbDV6YklQSnB4a0FHOHd4QVU0dmx0ZlBuWk5VM1Q2eUJQdkxY?=
 =?utf-8?B?b3ZvUGRndVRUSytIT3FITjFWYUJKcVJlZEJvNnRsQ2V0czAxeXBCTWZQSlV4?=
 =?utf-8?B?Z05sdCtkclVpemo0UXZyVVJIa3ByOVEvSmlXTWlxbUNtZm5vT1hCWGlFdFVq?=
 =?utf-8?B?VXFVeTA3cTVHRHExT3RMZnhRMks2MGY1WTM3bWpnWUk5Rkp1ZUhDTlJtRmR6?=
 =?utf-8?B?aitTUmk1OFVFQithbGM3cTh5eW1QdG04SXdCeldYUnlXRHY2cUo2QWs0Wkgy?=
 =?utf-8?B?ZlIrcXhPZ3Vucmh4Wnh4R3VoRHhoUUtoWmhBazFyZ3BLZzNYcklGOU1uMnJP?=
 =?utf-8?B?RDArVTRKMHVZbG5SQkdOdzFWVzEySVBoUStjNlVrRktaNWpqNGhmb0tOVVp5?=
 =?utf-8?B?dFQ3b0FaYkFpdHJ3YVd4dHUwVWw2MW1ya2trZzhBamViRXVmaUhXdkN5dFBk?=
 =?utf-8?B?TDRsTm13NzVFNXlzb3BRUXlKREVxa0tUTXQ0eTUwdlM0clYyZGFqYUN4TVVn?=
 =?utf-8?B?dy8vRGFzZzliMkRwMklWeUJUY3d4Q09mZHlxeHpGKzhhbzN4L3BFYklGS3R6?=
 =?utf-8?B?NEdrYXNjeW9jTE9STXdZaU4wcktwWndvd1JtS21SSnJEREY1eE8vS0VuQkM1?=
 =?utf-8?B?ZVF2dU1HR0Y1N2ZSLzh1dWt3c2xEaWU3QXZVL3ZDbnUvV0JZYU1WOEhGOFlp?=
 =?utf-8?B?am9BelhCY3ZYZ3F0Zk0zSUVOM2J4bkU1YzVURitOVEFBdkhnL0I4M3FWM2wr?=
 =?utf-8?B?by9xbHFQczJPbTZBbXVvbHQySVdZZ1lBMmFBRys4eEZtcTJkeFgrN1pRYUx3?=
 =?utf-8?B?YTZ4cXdiblZidUdtUkFnWk1mUytRVldGdnQ5UUZUaXgrVjltOTZtOGpKUmZz?=
 =?utf-8?B?R3Qyakx1SlJyMGxlbVpzQkVWUGxDU25abko5V3BYdy9idWJmbWFGa1hCMEZR?=
 =?utf-8?Q?GZTxwp2rN+KIp1//uF0Se2bMIzllbql2KvLYc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc15826f-2567-448d-5256-08dec0211d47
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 21:02:39.2314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bDuGB95FgF1WsJ34UdZDhUmpoRQ6QX41E11VmWLaMPzfnXWXEOGpk4V0X1NwOwlVRKWxII8nEL0jhOD1fTnCfir9FGGxiqYkiLwrD1slksnxIGajCxGw8F2oV8QxgX1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_140243_161752_B545880D 
X-CRM114-Status: UNSURE (   8.48  )
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


On Thu, 28 May 2026 18:03:58 +0200, Stefano Radaelli wrote:
> Add the MCP251xFD CAN controller connected to LPSPI7 chip select 1 on
> the Sonata carrier board.
> 
> Add the second SPI chip select GPIO and describe the CAN interrupt and
> pinctrl configuration.
> 
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx95-var-dart-sonata: add CAN controller
      commit: d120bfeca4b7a284ebf977adf525f80f7ff6bb70

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

