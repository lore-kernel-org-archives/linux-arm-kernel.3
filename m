Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EB3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 12:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gAEL2a8AWArKT2/m5kktgJf02wNEfzY/dwD7ImenVmI=; b=07o4FeD9aoFwyqHq72PsnILGUR
	pywL1uR8nC36ry92Gm2kOyIOMDWr4uYOJyUSarLoiisJUVvfNszj7RIpVwgbz0tyognWobJUcXXVi
	M0MKvqvMS1FwTPI/E7qAkEvMWN+fkk8igRrVnVtbebBkZMXeSkVDUgZtpU0XRDistCEGdtkPYCEcT
	U+ObbKJ9Krfr9mULgFHmSrdy7jUfFAxuyWgzHkDFRxbnq4KTVTubCuFQR2PRcV08VDLtygqd09pwW
	BQMbV4n2mb4bP1/S/Ot0+FlzWB3BkVCZgzp2bv36i9JseY3Bn65u8wZK+M0QT/GYRnZ4h5rgSGnuK
	7ZVWXM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU354-0000000Exiw-0AoZ;
	Sat, 04 Jan 2025 12:16:38 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU32n-0000000ExQT-06BM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 12:14:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLtanDjOHiwf8CONo5eLX3zmc7AfkloFfXgPSoSg79ooRPsPkNpCY/0MMwIew+axpwTHKnpSl33js7n/EXTUwWY/bEQNY9pQ6G5vBQlI7fLsU05VeqaxuHeDTeM66NbpTpUstE82gsAQIlQ5o/z7yiEUdZovveyvWh7ZrYW1aBernd6edsm0oJ6KxIT+N9OPe/b9+cbWTHamS5VkYqtwRPXe3L7CwaYxgjcGAffM5IZOB3h0x90FjeS1rGpxNpBGQu08SkbfC6WxX+PkHVRvnSRmgdkBROkjCQScB0pZk+kzHunmSyBE2OWSEu0QaQD8tMeJdsCghDXUwrxvxl1FDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAEL2a8AWArKT2/m5kktgJf02wNEfzY/dwD7ImenVmI=;
 b=Vs4tSGHR10Xx4qtd7yIUjKAT6tKdquv393mVDAJwb2j9aFqkT4zaY4Zkhhk7xIuRBRIgDuL3MuuJHvctnOPfgocwRMHxPgxP8dFeJjYoCKMS+tsxfiWtvfBbp9OA7yuv7lqwgbep2nNBL8YPTQ4LiFHqS/u8j/fvevwSt9eEDgITl0snmpohlnV2dj4kCM0H0Pr4IjgL3V5UgOa/sgziSU3uGfA/hi4A/XuLW5DlLwgjl4AfU72wqfJ1sUv++NCQ3Gew4vhTyPbQBL5IWdoTcqIhiWIOekelwvmdVA4YyOvuzRu4llViUOUr8GFfFvHlGZAklHQDhsdqF8JszFbdnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAEL2a8AWArKT2/m5kktgJf02wNEfzY/dwD7ImenVmI=;
 b=ILcLfSeYeHsaML3KXWEHdH1joK9DeGjTg7CJR2Zan4ZV3/3ouTiVE3G+csFJA2UnD95gCM3YSJpOngq2QZpfjHlW38rfXDBSOFquLDPuyiyqSDYnhYfsFdD0wVC19cqm4+rZ8mUa/vAKl3XVFkwy6G9cYIh8sdb8hUoHlsun76fhOyyiOJFU+t+GURs5RikLUlszURQF1oinR2x/xYNmP+87dY94iX5GSS1QX7bFO5MFByTNbOG4QohKtrX25Qc31zNY4+fM7LdnsY3fIHb9qxeCrFUmzaGxBJ1FZYLcDDbol4Y+NFuYZM9rUCCdbcieYNFwkv+FH7BJbjj2ybslxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Sat, 4 Jan
 2025 12:14:06 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8314.015; Sat, 4 Jan 2025
 12:14:06 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/2] update i.MX95 machine compatible
Date: Sat, 04 Jan 2025 20:13:27 +0800
Message-Id: <20250104-imx9-machine-v1-0-18a78e41456b@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOgleWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQwMT3czcCkvd3MTkjMy8VN0k4zRzi9RkyzTTJEsloJaCotS0zAqwcdG
 xtbUAhu4+0l4AAAA=
X-Change-ID: 20250104-imx9-machine-b3f78ec9f5b9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735992821; l=749;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=tP9qcGSdsWRWTcOt2N9Tq5QaWyrEWwUSD07wtyt5wdU=;
 b=oiFw/m6yvjw2q04ElfGVCjXQwQ85TEp8TeyuhsTF+0gyJdkRMRvKGDRJfjgzDv/eWS+9eZpnK
 pQ8wHQoqYe5BlLz1tnKrdlkYHqUyc09UX8t09oq7aB35qBI5NTB9L9e
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b98f76d-1df4-449f-ee2a-08dd2cb94912
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T08vZE9jTGVIdGc2UkNmWW1qQXc4RnEwUXZ0dXhEWmxNR3orZXpKM2h3MWM5?=
 =?utf-8?B?ZUJjZWozUEZhN051M1FDc2djQmdBYldmNktUQmJWakt0NE5HM00vMGdKTjF3?=
 =?utf-8?B?b2ExWGdMWVdEbFB2LzN1ckU3bzRCRlAwZkFheGhhU3ZhTUV2bTJITjJ6bkla?=
 =?utf-8?B?eFVucjBnNDN4eWVJS1QvY00vaVI4OXN5WHV5ZmhxNzB1aHN1SnlValZQeWNS?=
 =?utf-8?B?MEI4Y1JjRk1NOW9pUm1JYVNzemNEWnRnYWV6VUdHblRKa2ZDWWpVSnVsSmkv?=
 =?utf-8?B?UUZmZFU0RzVBSU9hUk93S2NteWhqV1p3dlcwcFpMMlVhcEx6R2pPYm5HT2JY?=
 =?utf-8?B?MUJmV0dKZGFQRzdJOXNiSDhIYm40MllwOHNkV2VpVEhuZXFPNzBKZGg4M0VX?=
 =?utf-8?B?YXlrRUk2QzZHaUNtemFNejRtbEhNcnJPbXFVMzZwbmw1bExhQXFweXVPMVVI?=
 =?utf-8?B?MHRKN3ZkZGwzblRnMWUzS09hcWQ1eWxBTmNkMlYvdm8vU29JckNYZUdpUjZK?=
 =?utf-8?B?b1FkenBZSitLVitqQ2V6OHA4UlFCK3BDd3hYYzV6VEh6c3NUUk1aMmZFSjlL?=
 =?utf-8?B?eXlKVVQvRDI4Z3E2cVFQcFBFN2Rhb3pibitNbi91MXZ1R3Bhd1FDWGRPcXdN?=
 =?utf-8?B?U3JUSm1rUjJtQ3dZUFZKc1VmV3V5Zzl5b1JIV09scCt0VFRlYUd1bUwvaWh1?=
 =?utf-8?B?YjZMYm1WT3g1aE43OWFxYkJ5MTZ6djYwYi9KaUhVWXZRWmV1cXUxQmR6L1p3?=
 =?utf-8?B?ZThMa21qNHMreDd0eFY5MkdxVm8yZEM2MUpPRGtEQXNKSnc5Tk9OTVQ2RjI5?=
 =?utf-8?B?eDhGN1lqM2hNWXJsZWNUUkFFbk1RaWlwQ3ZsK0YrVytMVG4yOXg3NlJKSm5h?=
 =?utf-8?B?ektZVExZNXdqTFZYamRtOEl0d2ZneUZZN1p5U3RrVFRDOTBGQTM1alBMNlk3?=
 =?utf-8?B?YTVJYXJZL2xyc253WTk0OHZrdDUvOXdUeVhaaGoyVENaU1NjR2pCUEdVaVJz?=
 =?utf-8?B?NEdqaHZ2ZXFNRjR1K0dqNEhrZEEzaHQrL2ltRDNGSzZBN1VjRktFRW9SWmV2?=
 =?utf-8?B?WCtZOGp0azRiN1oySFdvSjVYeVpmZkx5bjBWcjZ3T0pQcFZmRlUyU29Cc2FV?=
 =?utf-8?B?Z1pYOHZTTlFuTTJnWVQxQkczQTJhM2ZwbE92YjViQjRkcFNmMkZWSjFWZzBH?=
 =?utf-8?B?SUtmT1VzNzRIU2ZCSDdDQ3QwVmpHUHZ1a2lRZzc0Vy8zM1pYdHVFS0hMTE9p?=
 =?utf-8?B?MWw0SUNDdlZ2K3pTM3FjMzNBSVVIUVB6dk5wbkdZRk5aUWdyc1krQ3lIQTJC?=
 =?utf-8?B?N2FrNUlRbUFPODQzWC9wY2dQdVdId1l4bUJHTVZNUmFxVERSSkdDUFRIakpn?=
 =?utf-8?B?eFFaa0xLNWFSRm01MDZ3cVZ1Q2Z4RFlmbWh3eCtVOFJYcUE0bU85L1RqQ1c0?=
 =?utf-8?B?cUp1aFlWclY4eTdoVlhtK3V2TnExQU1ZbVpPSXlRaC9rWEpYa3Fqb2EvQ3Js?=
 =?utf-8?B?T3F5REdoQmNGVTNuM2ljMXhOY2Y2c1NicjJCaGJITWJGak5IOVFjRkJhVDhv?=
 =?utf-8?B?NVFHai8vUkd5YnhBK1pwNmxpSENVRHcwUEpVcG9TQVpkS0ZNUlR3UllsQzlt?=
 =?utf-8?B?SW1ocHZ2eWFjeEV6VytDNnN5dURNNjJabHhFUlR0UjR4WGg4NmNHYUkwQ1Nz?=
 =?utf-8?B?T3djYTFKQlV1S0UxVkdmd2pJNkk5ZlZzL0FTL1ZSeWIzVlh1QXF5d0pFem5r?=
 =?utf-8?B?ZVR2bHkyR0kyQ2kzS2hRSzFCcDFvbm50Vko5dHA1Y0tMWURqWDR6R1VWdW5p?=
 =?utf-8?B?RjF0bTJjNEJLQ2k2VGZYbXlwdFBiVzNpeGlkUWptakhlSmZ6aDVrVXRLR2tl?=
 =?utf-8?B?cG5pYkNxVTI5NUdSS0k1ZzR3Rm1PdnFOV3ZWK3dMWWZqb2lKdW13Y01wVk1p?=
 =?utf-8?Q?XKSxV8g4V9BGzBk1UPgDTvQmWBCpF6Xu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXk2bW9NQllTenRWQXNNWG9RUG9KcGwvTHZCUjhUQUJiZGNoUW14MEFBQWhq?=
 =?utf-8?B?ZThxNGhxZmZKYURYZFlJcFBBSVplMUJDamY4YXNIMURra2h5TnpLMWVqOFdE?=
 =?utf-8?B?UjVjZUluWk5BMjBuVnhHdGpxTjlPQWRENEpLKzhOYWNjMzE2dUxwZEdScVBn?=
 =?utf-8?B?ZWxFdFZBYUh2VjJ3S0IwNVlxVUVVSGpZQy83NWpGdmJrU3M5cmY3ZmdrQzU0?=
 =?utf-8?B?TmVnTE5jSld5VzFaMW1vamgvNzZHeVdDczBEc1FFSU1iNHY2SFVnS3pHSG10?=
 =?utf-8?B?LzlRaG9oZXJpVUl1eTVWMzNqRmNRUEY5Wmo4STl2ZFprZEpXb1R4YjFlb3BH?=
 =?utf-8?B?SGtkOWdVTERGQzdhL0RaSVpzYU15eksxNmNtc0F3cDh2NFFoMkdoQU1kbHBS?=
 =?utf-8?B?Mkp3Y016cjg3aFF3UnZNUTlWOWJKYkMxZDdZcjBqaXdETE1FUEl5RDRqTmRB?=
 =?utf-8?B?cHRBajNPRTBTRTN3MWc3SE1MRzY2L2xrK240NklBaS8wK09SYVJEeWwrWlNn?=
 =?utf-8?B?Zkxmc1BmSjNSWUg2d2I4Z0dRZi9VL080dUdlOEY5anRjMEtUNkx0NVEzN25Z?=
 =?utf-8?B?bkJlUHh5WUh6THZFWVdMekZNOENBV0l2M1I4VFd6SkhwdEYydjNvMGhxUHBO?=
 =?utf-8?B?cG9oSlVIRWE4UDlDcU1HMEJKdmZHbVlISW1tSllaeEdSMklpaTFXUVRLaFRE?=
 =?utf-8?B?Z2lLNEgrR0luRUJoU2JKZ2xtVGhiOFpTMXJ6V2lDS1lycHpPV1FRNTl5N1d2?=
 =?utf-8?B?cWx2ZHduazJpcDBNZGVVTmRYc0V4RngrNHRzVTJBdGU2Q0FWcTJBb1YzN2F2?=
 =?utf-8?B?TjhCeWpBK1pBR2FPWHQvYUhqOGs5cEcwOHd3SFZSeUpxK3orTU1oMmwyY29t?=
 =?utf-8?B?Y2dnMzYwL1pCNjFwSjZIMUMyRVVHSHBBSVNoMldCRU10T3pzOEUxR1JjbEZs?=
 =?utf-8?B?a0JWNU1HQSttYlpyMnFYRGcxSjJMdHRQUVZIODV5U2Z4Mkl5NFlwZERPZ1k2?=
 =?utf-8?B?UkVzL2lITjFZUzVhU3VMSmEvblB0Z1BzQjZta21BckFPcWdNTld6MXI2THVP?=
 =?utf-8?B?ankwWkxxT3JIVnRzU3BNWC9yZHlOb3k3OHg4SkQ4R0J3S1k0bUhCTVcydHgr?=
 =?utf-8?B?Ynp4NFgxdzUzS3Y4M1B2bHM5QVVRNlRJQUVUMnAzcWdIcitjN0YrcWlLRGdE?=
 =?utf-8?B?UHFUQlpDWWJvak9xZnhyajNnZGtRNi9HY004a3J5ZzVaWkpJcnI5aW16R0R6?=
 =?utf-8?B?MXdlUVpGZ0M4S2ZGcU00ejJrRTJwOWdQSkVXZ2ptQUZZdnFseWNod2RHK3Fr?=
 =?utf-8?B?ZGo3MUhiaFgrRmxhaXNlcjNMNEExMmhWbk1ZYUdKK2NMZmoyYmdoTWt4c01r?=
 =?utf-8?B?SjRNNjcxdVdEdFFMRG5ra25SRks1aVd5TGl0aWladzlFZmszQ3BNYVY0citw?=
 =?utf-8?B?YURSWVNBQitwaTZlOTA4NG5nUFowTkhXNmJjcFhudHh5RnpIVmxwSU9Gbjhl?=
 =?utf-8?B?THc0NGRzMnh0ZGxVNmREaDNzd2RmSlBrRDF1aVFRUlJ1QjJNNGNIVjkvVmZP?=
 =?utf-8?B?THdjSDVmeU5aN2FKZ0l5bUl1WUZ4aUVyakd5eDBsaFZCeXFaN3k5WjJDdXVU?=
 =?utf-8?B?TkJYYllNOU00ZVJRRTZMVFlEMWtaWWhibVpIcnk0WUxMOUdKcndRRVNOWVZh?=
 =?utf-8?B?d1ZDRWNpVUtPVlNwN1l1Nmt6Y2ZKelJOK1NkdjhoRlZoRmd3Y1VXTkp6djNr?=
 =?utf-8?B?bHZBN1VaN2F5WERNNExGdWFJMFJZR0RtVUJnK2I3SFphay9ZazkrbjRUQ1dO?=
 =?utf-8?B?N29oY0VxYW44ZFV6UmQ4TXIvQ3lDa005cUJoRWRPblgzY0YvaExKbmpVbzVr?=
 =?utf-8?B?dG54SkhydHVmcUt3bW1rNkFtNzR6d1c3WXF2WDZ1ZnhLK1FYTVlST2xzRHV0?=
 =?utf-8?B?VDVaQW42SkVzM3FmQ0hUVC9SaHpDM1puaXYvdndKQ1NPdFI0T3hUMjAzOC9m?=
 =?utf-8?B?QWFFemIxV3Bicll3RTFkMkRYODZNcHVDUzhVK1hoVUxzeE1mM3pZRHROcmZK?=
 =?utf-8?B?bWkvakRrK2VmaVV4aTB5cWxLRlIxbjE1bVhGRm5rMmJjTjc5TEpCZlhteE52?=
 =?utf-8?Q?HPr3XxoiCn/crPLBm+oPojvcb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b98f76d-1df4-449f-ee2a-08dd2cb94912
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2025 12:14:06.5747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: saIxbamijXdRVEsAYosf+1kCcwDiVpDNuqxHlaQgF/A5j7rrsrgcabp65fmCHgeacHLD614gC2UYRifibE3Jqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_041417_078051_B2543E95 
X-CRM114-Status: UNSURE (   7.95  )
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

i.MX95 features a System Controller and SCMI Spec 3.2 compatible
firmware System Manager(SM) runs on the controller.
Add "fsl,imx-sm" compatible string as fallback for "fsl,imx95" to
indicate it is compatible with i.MX System Manager.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      dt-bindings: arm: fsl: Update i.MX95 compatible
      arm64: dts: imx95-19x19-evk: Update machine compatible

 Documentation/devicetree/bindings/arm/fsl.yaml    | 1 +
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20250104-imx9-machine-b3f78ec9f5b9

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


