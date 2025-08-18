Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89764CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 22:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHDqxpgW9IeVWPr8+ARozSVA5QXWXk8BLJWa2kH7XKk=; b=waoG257hEqmLFp7ASEa7+UDf1Z
	Cn14APkFKUqrYtLmLJk2KR9T0rsI50tU6z8uiv7jEdMpdnW2T1nNArF92Jp/jEwvVZKauj/vL8LOp
	3YzIGWfN1qbfDl/SdB3aFXXWHYnXDkdvl6RAeqRjM7XKFnzKzIusB/AZYOXwT3J4vrESZbHritmfz
	dBx02ALV5eqEbQPySQ7s8w3Et0lkr/fuWoCXgmXokN+gHr+cEc6f/GMLixUk/c5Mj2qmiS7u3T8LF
	SHg0VIPhSV2EllKKoAMgpaBNqwg8o/7drTVG2fGnFdLU+Eyc0y1AX1UxqRONcok18plRfvCjHkPUv
	ZAAb1QBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo8Fs-00000008pXY-1SRI;
	Mon, 18 Aug 2025 22:23:04 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6mn-00000008f4F-35F9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 20:48:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUECnzVDe+pRRciOKa+35xDyMDScF62N4/quf3lPMCYWtNYNN0cSx3SFjhLJVB7Nz7uyPglsTTdzwQUMqviGE8dcjhvwfXXD6Ffpu3vc8/7bvgQadc1H0Sv+tWsfNdbhTA4PdjM7b+K972/PnZKQS9Qx4dK9QzDJ9tyWU3Zg89/J9zPNYWUjYuT/uaZrR6wibKqrX7ffOmalDMwEbMpE62WZArtCpntTTw/zvsDe2Iz2XBPjbZKN9ODngrUd+4w5cdZGJ1+C1Be8jngeqGsPrFysUE2ciKX93+oK6x/nmtWI6588W5Q1Op/PygPJoVcvebLqFX0SqnjCRXapnHTclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHDqxpgW9IeVWPr8+ARozSVA5QXWXk8BLJWa2kH7XKk=;
 b=As5PQV59A91oCZGggTq5aA6hsAYGWgL74d1uqa4suuW2x5oakUaONJgWzBF1xMbh03ZKfSM35nrFl40n2HwmqWzU5+ERjhQezGqDBmU+C2VmBBVtvYNZtn1kUR2NOr48WQtoPDJ1CQjKLQExpsobf6Vn1NawnYaeVtMMgJEyX9ahh9P2H3DINFXnlsOvArJ+1icGayc+kH54+foqKLtEThUuFLPoRFCOFfe5Ka9wxiUQw+fsKgKm2kG/AfQC8G89M+3u0ujqSA+OvRdl6Nqx/HtmSygFaKkFh3WjQ7hUN+ya7ljFuiZmSFEB2b7nSh+Wfo8Lq2EKL0bGF40AWI7BKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHDqxpgW9IeVWPr8+ARozSVA5QXWXk8BLJWa2kH7XKk=;
 b=QRu3pEjcWxS6AHC4lc3lpLbKF8qOj1fUD2uyS7WioegtNywK/IC/oF2wpE+z+LsLvJEubdusK/AwuMvTbyTc5EAeztbO5M4O/CBd9mFfbSE7CeunRpSLf5J9u5/FdsCPqk87GOE80EnDo3ItVlb430mHh+8iKZ7aL74NHVb3va18Drz6y7SCzR5xgeJBTmOlm+Qd5Q5jIi9Url65HOvT7Ca7AW51Nv4z9dvPRHJQFfHNukWY6WSftA731SRnl+MWbADVeYDhxAuJHWVC8DboD3WZRPkF8wtLrq1vFA6ZjHFfd4jorIvfdiT9G99YEc+9jIpbn0rAPAZKKlK4ge8DiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9009.eurprd04.prod.outlook.com (2603:10a6:20b:42d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 20:48:56 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 20:48:56 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 18 Aug 2025 16:48:26 -0400
Subject: [PATCH 15/15] ARM: dts: ls1021a-qds: rename 'nor' to 'flash' and
 'mdio-mux-emi1' to 'mdio-mux@54'
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-ls1021a_dts_warning-v1-15-7a79b6b4a0e2@nxp.com>
References: <20250818-ls1021a_dts_warning-v1-0-7a79b6b4a0e2@nxp.com>
In-Reply-To: <20250818-ls1021a_dts_warning-v1-0-7a79b6b4a0e2@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755550106; l=1201;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Zn5cF36wdWuKNB59Mgc3wEwBStX2f/ojn++xdypDZ1s=;
 b=fckSVmDVMmqzSguUWPFt7DP75O+E2T7HSUsq9iA2BAaD2bzTor1qvgaBlM5r+W/XQP3xeKfWT
 wggBYWVnPBLB3QApl4+iRIri31b1AO7uWvy+VLbIL19wdT9cJGF0+Fp
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AM9P192CA0022.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9009:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c1e0a81-5c74-4c8a-08af-08ddde98a64e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cU9BVDBVaW5UbUhrNGw5MnVrQWhkanVJNHkxR2pEb2dUczQvaFh2Z1B1L24w?=
 =?utf-8?B?TFVEOUZmZ080UVZXMVVaMFpaeGZqeDNXNzNDeWZoVDlXMG9RRmNuVzdvdDQv?=
 =?utf-8?B?MGlkV3lFSm5leUtRc1VGcTZUQ21XV3VNbzRqbmhWU09CL0pPMUJxbmlCZjdr?=
 =?utf-8?B?ZzNIVktiL1RwTzQyc2EvUVhCOC9IakFBOFRuTXBFZjJaNm1sZVIxSit6L3Fx?=
 =?utf-8?B?SjFGZXhienVmNjkvV3JCWHhQbnQ1NVBuRldqMDRERDk1YjVjZzloVE5QRldX?=
 =?utf-8?B?VjVjWUxwWG82Uk82RWlqRDFXNUxTVnEzUkJ5cjIwQkNDVnZ3ZkhwdklJRnY0?=
 =?utf-8?B?NEVodW4yOEVvSDl2YmdKRjMrTlJ6WDcxelM2SU9ZdlRBeldsVVo5TGthOWs1?=
 =?utf-8?B?Ym0xanQ5dFpsYlhpSWNPL1ROZDNxQ1pRU1JyMEpzZURiSjYwanRoZVBWcUVL?=
 =?utf-8?B?TlVBbVZqSnVyYjF5WlRLQ1ZCNDJrSHFvSjA2ZFk0V0FnMXhGQm84aUNkR0Zs?=
 =?utf-8?B?N09VSU4wUkdLOTFnTU1ieFdZZU9JZ3cyZ0JZc1o2VWVsaUJ1aGJ2dFpUT3cv?=
 =?utf-8?B?WEhLaDZTTmxJT0Q2MG4xQ2tyNS9ucGd6VU5vZSt4ODZua2plTlFhcTUyb0Zp?=
 =?utf-8?B?eFJkZUc5bnlxSGVnS2FOVFN4b1NVTEp6VmRQSjkvb2tEcUZOT1hLdXR1VDBW?=
 =?utf-8?B?bUFzQXFMQUJjZlg1M1k3dFpxdnUzejAvTHQ3K2xta1BJcS9GYXRDUy9CbGwr?=
 =?utf-8?B?TWp0M09kbVpHWUNuKzRWYm51ejN5TTBJVEN0VHM0ckhCVndwTHpjQ3ROS1Yy?=
 =?utf-8?B?WnQrWFcwSWxxeWM4S2lGLzMvQnVzVWExVlcwRnRCZWVwZU03ckIwT0hTR2lS?=
 =?utf-8?B?QXJUeHBJUm53R1QxMzJMbEtlWXgrSzdDa3Q0UGFsVDMzbWdVRVgyTnp0RFVS?=
 =?utf-8?B?a1RKbllZeitoTDdDQlVSQmJVa3J6VTk5MHpLbEVac1BIdm5VUmkxaWUrK2Vj?=
 =?utf-8?B?SUJGOFZ3SWoxb2xySW1Fa2ltYytwdys2S0JKSGpMc0pBbnFZQnQvU3h2MHhz?=
 =?utf-8?B?ai93Z25WaUFFbjBDK2JRZ1ZEZmdGc1g3dVNXOFlkS080MzY5M0wvSW90UlI5?=
 =?utf-8?B?UGNRbXEvaG84M0g4Nlh6elVYQmxGeDdDMGZFbG5BbkpPUGUyalA5b2o0dUVu?=
 =?utf-8?B?akcvODRSTDlZTU1ob0JEOWxmdnF4dEphN1FhaWlmbEozc3BDeHNXRldpM3or?=
 =?utf-8?B?VGhCa3M1aXNtT0VjUjJVd0lOQ3Y0MmdCekFmOEh4U2RybjNEdE9YK2pTeHVo?=
 =?utf-8?B?WEVaRHk3N0tiTm80bjF5VGQ5UFBqOTUrSVJ3SDQ2SjJ1UWxIY3FZNUNlSmh3?=
 =?utf-8?B?c291d2tKUGh2cWdlVTFldWRFZmNMQUFwbjNSM2s0R1hCc1BKTGNCWVJBdjZ4?=
 =?utf-8?B?YStuYkdiVjhET2F4Z0VJZlc0dmNKSks0K0d0bFNYQjBlamFiYXc4ZzZ6TzU3?=
 =?utf-8?B?Ui92OW5DeTR6alIxdHh5K0NjanZucG0wWnRJRmtBUStDcWNUQU12aWlkQklP?=
 =?utf-8?B?Mkd6dlNTZTE1SmpBY2VjcnFTZk0xYVNkM0RXaFA1Ui9xTEtPWEV6aWNjK21M?=
 =?utf-8?B?ZzlmYVBvME42UHI5SHVWV0crV0RxOUJsd3NtdDFVVUJHMjluSlFoNnJFUHdj?=
 =?utf-8?B?eHUwSVAyRHZiSFhTVFY5M0FDN1pDb1dHTGVzalZuMmJjOUYrTkhsV1hnVWJL?=
 =?utf-8?B?b0dmZldONlkxalZDekwyczBKTmVtR3h6N2dKbFpBbzJUM290ZE50c1VuSjN6?=
 =?utf-8?B?UlNyL3V3OEFxN0p6SEVFV0ZmUTB5cnVYYS82QW5sYXZUU0FIWVZCc1B1NjNy?=
 =?utf-8?B?YmRVM0VYaXNPcnFudk9VV3lnUXlNQXZQT0JWSEtudXl3eXlOMUVNclNPRzdX?=
 =?utf-8?B?R1JPWEx4MTdOQTVJQ05iYmNUaHp4SEpudGVNamEzeVF4bExrRndvZUpGSFFK?=
 =?utf-8?B?QWZtYkpJYnpBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzhkajJ4TXU5YVFYTk55NDRuZWFCY0ZMdTBlY0NhZU9ueGsycE5QM3JJTXpD?=
 =?utf-8?B?dWIxVkpVVXBFQ3hNZFloZzduOE9oQVV3bzFRT3pVN3BWSGxYRnFxdGRuY0hN?=
 =?utf-8?B?eExWU1JVcFpacXc2ZXNUNisrNE9WZnAvTE91OWdybW1TNFUrMmJHZWUxYjNT?=
 =?utf-8?B?ZU8xMllqZXc2OVlXeUYxcnFUdm9RVFVxbEJ1VzhaOFNyUVpLN3FWYy9yRnlV?=
 =?utf-8?B?aUVDVnVHd0Vlb0duTEFCVGhqQlFGNkIrS2dpMXJwT0pZbGxhSHFySEJNRlhi?=
 =?utf-8?B?SUY2SjkwVjNrZ3ZCb2FKcnhRdWlTRWtteTFlT0NJRUtvS0YrWDYzb3BiWGZB?=
 =?utf-8?B?aVpXZTZPN3Fjei9MWlpLSWZCa253RVk5ekFLRW5kN2Ixeitvam5WaGpRc01E?=
 =?utf-8?B?T05FVW1zbFRNS21Pb0JDdnZON1MwMVVvMEVUY2dadUk4a3RIUHovOUk4RWpa?=
 =?utf-8?B?bTZ3bkNHREtmazRrZ2NuSTNyMFg1WXMyWVVscUxJRlhjRDQ3dFRDWkZZSjdL?=
 =?utf-8?B?VXViaXhnRHBlZWl5V25QVjJ2djV6TFNEWVYvOXczY3RockR6TjNnUnFOdUI1?=
 =?utf-8?B?UXFwbzY4OVRHcmt5SmtWd1JyNHRXKzNPTjBVUXhZRFhpL2VLdCtYY2ZrdUJF?=
 =?utf-8?B?M3FtRHVMdVAwenlFZXlMN1RKL2Roc05TbkhQRE1SUXlOU25UQUd3cjQ4aUIv?=
 =?utf-8?B?ak1ZU3pPQ1BLZmlyckIwUkwwNG9hTDl3MHRMUVd0VGEzTHBSaC9vVFhOZS8y?=
 =?utf-8?B?ZHhOaWRnRWFwOWhrL3lTZ0pkditxWUFHa1RiaUM0VXFLd2JMdmlUekg1V3NV?=
 =?utf-8?B?R1JDdGh2VVhObnpaY082UEpJalRZNDZmalNPZ3MxU1V6RTBCWTV2cG5VZmFz?=
 =?utf-8?B?UWxlNXpHaGJ3UloxSE00ZG5Ubm1CcXRrNUFieWNST3BYc1E3d09wOVVydEpu?=
 =?utf-8?B?YkgwRStFY2M1OW5EOGNHUjVDY00zZzA3WGEvZHdGQ25MbmxVbWF5b3hUQzNX?=
 =?utf-8?B?SjE2TjdIcE12RkZMTEpaOFdNZEVFajlvR2ZmbVVjcVQ4RmN0aktneWtNdUsz?=
 =?utf-8?B?TUNPV3R0OUgxTmRVMkJOZ1V3b1pETHJQQUhibm1yNzMrbmZIR1diWlRmSlBE?=
 =?utf-8?B?UVI1RnB4dHZlWkZtZVRhd3JaRGF6ajdSclliQnJQZkZBRGpSWTR4bDFQYnNk?=
 =?utf-8?B?bkt1MUdDSk1NdlR2Z3FkdEQ4THlaeEFpSmdKK0NtQkltb1NkQXlrZTZEbmd5?=
 =?utf-8?B?QTUxeEZyVUsyTUNlUVJqNWNQdElLKzlyMGc3V3R6U3lvWkZFRzh5UnMxbUUz?=
 =?utf-8?B?MEt2b2tnS2JKUlhrVGplWUREWWVZVy9DVjcrd1RiQko4a3I4WTYwZlBHRmdX?=
 =?utf-8?B?WkJYU2dQK0pFSVY3VnpMVGJ4dHZMdGNudVlzZ2Y0ZDJ5T3FBVUZhekh1NVl0?=
 =?utf-8?B?cnlsSy9LcDVpMXhoUWo0Mk5iVUNkMEJmY3hSOTZ0OUdCUzY2NldNYVZvcEt0?=
 =?utf-8?B?cHlQR1JpRTIwSEFXaSttWU50MFFWdVlqQmFCdmlZK2hEVXVHWTR2WllZdUc5?=
 =?utf-8?B?NkFmY2J0ak9HaHpBa0s2QTk5bnlSU3hlMzUrNU9mUGtBaHJiV0hDOVM2TUps?=
 =?utf-8?B?VG9RaC9pY1NmYlVxNFJ3SlhabUw0L2ZzWXl1SUg1R0pNUjdjaFg4ZUFubHB2?=
 =?utf-8?B?Uld1TlVaUzZtd2VydEJTRHhNdlo5ZmhVK1pDYlB1akpnYlRkRHlmaFpITlRh?=
 =?utf-8?B?QXVEQzJFbjQrVWlwV1hUeDBxdFJHekcxdGNYMFhhVWF6ZVlJc2hDV2VSdGxN?=
 =?utf-8?B?dkRTTjNtZThDM0hIb3EvUU83amJ4TG43R2VkaExFVDBaY0ZsYXR5TzRIVDFC?=
 =?utf-8?B?czB1dnhKN3BpVzRYaENZc1JYTTcwVEY3eVlrZ1Z5MERDRUFwZml0MFp0ZTJW?=
 =?utf-8?B?K0dvTlBhTS83WlhyVDRKbXhaNkIrK0NQaUszNmZrY09LUnVmQUNoVnNrL1NZ?=
 =?utf-8?B?bUhDODd5c2hOa1RHYjM2Zk81UGhLZzdJclJHeEE4OE16WkE2ODdrVURCZzdp?=
 =?utf-8?B?NGJCSUNuMitXdnJxV0ppZk15L1pDWndVOUFjU29MNUkzSXlyZUcrdGFCUC90?=
 =?utf-8?Q?Uo+M=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1e0a81-5c74-4c8a-08af-08ddde98a64e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 20:48:56.4376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: skKdWJ0jXsEObojZKLjWoM26EVpe2TrHF6Z2JllJxtfb8WoDbgqDC+OUOcXY2c+1UyyOl6gfb+VbxCNYW/kfIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_134857_785319_FA39EB06 
X-CRM114-Status: GOOD (  11.63  )
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

Rename 'nor' to 'flash' and 'mdio-mux-emi1' to 'mdio-mux@54' to fix below
warning.
arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: memory-controller@1530000 (fsl,ifc): board-control@3,0: 'oneOf' conditional failed, one must be fixed:
        'bank-width', 'device-width', 'mdio-mux-emi1' do not match any of the regexes: '^mdio-mux@[a-f0-9,]+$', 'pinctrl-[0-9]+'
/arch/arm/boot/dts/nxp/ls/ls1021a-qds.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts
index ce6e950ff10ea10b9431144e5147e75e3c0ce6cb..a880875ced83e10c37a4d49d9b9951cd3d458ff0 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts
@@ -211,7 +211,7 @@ fpga: board-control@3,0 {
 		device-width = <1>;
 		ranges = <0 3 0 0x100>;
 
-		mdio-mux-emi1 {
+		mdio-mux@54 {
 			compatible = "mdio-mux-mmioreg", "mdio-mux";
 			mdio-parent-bus = <&mdio0>;
 			#address-cells = <1>;

-- 
2.34.1


