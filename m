Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D34AC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 07:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhQYDFeX7GJZhL1SxEV90YuMx3FEXPkqvBeVQzDMBLg=; b=1SlW/nqjoiKfiqoDBvrmj/oxL+
	cIyL1px7jJ8TfXt4nPYTxsgf5gZ9daxHqlUvIhsUpmNn0YZ8/SD9mWdGXHK8p1aQxVBc/+mK7oRnp
	71f3cEnTsyHqwVsaKCsTYmCsaGk+Z50n+lJ1aECZCJS6K1GlFBsbzKdrJ0aax08cZB5FAnmbqgB8K
	DHyYu3t+3JJYxxNSzXrb8PoDH/5A4Phrw2fuq+0DWediaKksY3SfdVn+Gal+EOOpoAKwaZ+hls1KN
	TKjCLPogV+RhqlkM1UIDTNd2n102bAvmHfQwicq1elb3aDud9IUtvSgXeijTsquwBhZAMRXQH3C1i
	55171ZkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thktv-00000002rU6-2yfQ;
	Tue, 11 Feb 2025 07:41:47 +0000
Received: from mail-am0eur02on2061d.outbound.protection.outlook.com ([2a01:111:f403:2606::61d] helo=EUR02-AM0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thksV-00000002rLL-0uST
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 07:40:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHd//VkdQ4oX04V8ZPTraCJdEu9SiBctoLP2Eh/qFLjFKY+X8/bgbGwdhxNuK2wP9fZGU+Yo0/TahB9YznQTYRjLhbeYtqImi1s8ybCPreShtyoRQpqe48DPxAdKDjD8Q+iUWCaUvklLPCT5qHRGlAk5PLNjVhj1NOqs6oJcUBr0HNFT8ee+tKQ4cbCAijUdsVVZ8GB9qjdEy/6whGB6OLSxdLCOTFl8jZJYFzaKMDS/Rh8TamPIDoRHvTox5cwKHZTxm8OMr3BPEhzidwZcpaIdxRqzCOymLzf1McdR6MCg0LRxu2Y2vxCegGguTo0bnSc5GRqvfrEny97VLPvecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhQYDFeX7GJZhL1SxEV90YuMx3FEXPkqvBeVQzDMBLg=;
 b=RwFivLnZlaG4/eA67W4w+AHLb3mouVXOxyynSH5fiiWaFSs0KpZuSK2VfHBTK2gMtPhX98D+McYjCHcQy5IAD5VEUwFZc80SrQJr0kt54cARjYJdXTfWGnp+xq76sdwaBtmCBXj48+fuFzP2zokxCd3Kax6EEK0wlITpy/cte6dh4dNT1fgvOowti/bJUwxp1IBTTvWBgsgg6BB0xMa/3fjfO/ClFQC5IhdBeA+rF4nmc4CZ4oNtmuCP0HIdnBFdSfp1j7lXcUlXlZ/r+nd3osys9ka02vomm650tAtkfIEB84muJplRcdpPIjUGtBfRcFCRHeANqAusNZxPcGTNYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhQYDFeX7GJZhL1SxEV90YuMx3FEXPkqvBeVQzDMBLg=;
 b=LofZlhm2mg0vGobqOcVkQI3rh0IvKuXwnM9mcn/kPClaW+qgwZXij3/uRTfvPQzhNAvhiDE1ZmfLLoJTFVSAyHNBZAnu+vtZH1IF3DV6soVrNxZAy5HIgOBEvjah1XgAwKQoOuUfC451VRA1YieZRmDh+CqrcE5tbCsWU2mkev9N4u/X8K3aYOB1/blwVLnSUh7aJzoECRMuSzxyGB0dZP/RYMhDPll6H2MjDBgnxhBayWn+1KY2Zzu+scAbghqB1zVxhnNEAFGtlQAcaQEr6k02IuxpY7D1LsXPTaU8nbwHwshW6FSYCCRGrsJipj6jDmgI1aenMAjJumWUDSP6QQ==
Received: from DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19)
 by GVXPR04MB10852.eurprd04.prod.outlook.com (2603:10a6:150:225::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Tue, 11 Feb
 2025 07:40:15 +0000
Received: from DB9PR04MB8429.eurprd04.prod.outlook.com
 ([fe80::2edf:edc4:794f:4e37]) by DB9PR04MB8429.eurprd04.prod.outlook.com
 ([fe80::2edf:edc4:794f:4e37%6]) with mapi id 15.20.8422.009; Tue, 11 Feb 2025
 07:40:14 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
CC: Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: EDAC on imx8mp and ddr scaling
Thread-Topic: EDAC on imx8mp and ddr scaling
Thread-Index: AQHbeUPcqMuGJWEkBEWOfX826o2SNrNBpcvQgAAPdYCAAAWiIA==
Date: Tue, 11 Feb 2025 07:40:14 +0000
Message-ID: <DB9PR04MB8429E49ECB24850B1046889B92FD2@DB9PR04MB8429.eurprd04.prod.outlook.com>
References: <CAOf5uw=SHCLAH21RbZCVYyU6m4KRD9g=KsYg0b9vq=AFu+cb+Q@mail.gmail.com>
 <DB9PR04MB842936EF132C8DCDFC0AB8E992FD2@DB9PR04MB8429.eurprd04.prod.outlook.com>
 <CAOf5uw=68M=prCv22=6yXXTNgNvN_rfV0yFfX-4rNniwdGLvJw@mail.gmail.com>
In-Reply-To: <CAOf5uw=68M=prCv22=6yXXTNgNvN_rfV0yFfX-4rNniwdGLvJw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8429:EE_|GVXPR04MB10852:EE_
x-ms-office365-filtering-correlation-id: 8883e633-7016-4503-3246-08dd4a6f52d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TGxRL1NEVXdRQWtPY3gxQkNLcVFaSERmclRMT3dRLzMrMWJFQnhaNHdkeDh4?=
 =?utf-8?B?SzkxV0p3U1VibGFMcnc1bkVYRFhoRE5hOGR1Y0hTM0R5Q0tXNkRSOUNqWHRa?=
 =?utf-8?B?WndKYXNxeVJXcFBncnhra0ZQUWQzaXJPUFBUYUtkRUUrMFFTTUlOUktST3BL?=
 =?utf-8?B?UTRxdTgxZ1hpaGQ2ZGpqSWpROXBPTDBsWVpGUllDS0lGTzQ0ZjU2KzFtblFr?=
 =?utf-8?B?d0ZzMmhxU1daUkRTWTdNQnNwenphRmptK1ZzYTJkVWRYYnVZcnp1Yzl1aE1s?=
 =?utf-8?B?cXlnTHllLzJHK2pXUUxvSWlYY09MMVNZeWg1dGFzRU8wek9YcGxkZERubTNj?=
 =?utf-8?B?V1hJSWgxaldUbTZSNlhRVEo5UVFUQVdlMUJhRWE0Z2tjbmYrdzdMYW80S040?=
 =?utf-8?B?cllqZ3NUeG4wQnBwN3RRbDRIYWlVOHF2a1Y1cTdMTXN4TFB5ckFGMTJlNVBw?=
 =?utf-8?B?SnVLMkNMbGhXdW9rcEZzemxwdlFlbEdNb2VZMTgrNFp5SEE2V0JITENyZFU1?=
 =?utf-8?B?OWxOU3BCSmVSMG1icjdmTjd6ZnZJK2dDajRoNndkTUkxNVRHVm16akFvSkY5?=
 =?utf-8?B?aWhCNUh4VE5QUmN2SlRhVDh2alBnUGVVZ1dVRllhM0ZJMzlWMW0yOHU2ZS9R?=
 =?utf-8?B?WTU0Q3pnWXVKZ1ZnS2VTOXNNZTRSN21CN3dra1JDVlB5ZFZvdTA5Y09BS2N5?=
 =?utf-8?B?U2UwK1pFSWd4a0dtYyt3eGhqTlYwTllyUloyRWZmZWRmVzUybFM3N094OVg1?=
 =?utf-8?B?T0JDMWJSQjIreVFGSndmRUhRVlU1bTR3YzF4MXNXeSswa1lLN1krMHJIM0Vi?=
 =?utf-8?B?OSt3RFk0bXJ6RkhNNGJ5M0p0T293QVNDbExKUW5SczQ5NHkrU04zSVFDc2oy?=
 =?utf-8?B?YTRHci9lOXhSWkhXd1FpV2pUVWdmZ0RsR0JJNXhXZW9HSUVQQnhlUC90VmEv?=
 =?utf-8?B?ekVuVlVXR29GcU5zd2RaM3BiZ2dTZHRpY2dsUjdFWjZmZEFZT3g4TGZpS1Jv?=
 =?utf-8?B?R1cvcWVxMVQwcXhpYXdtV20yWWl3UEJEUHpDTHA5UUVmcVBOQkZuK0xIQzFj?=
 =?utf-8?B?SU1EWWQxdkNaY3NiRDdqWUtrNG8rTzhLejAzV3RsalhDQno4cW9GWCtEOERF?=
 =?utf-8?B?bXdvTkVXSW1UdU5TeXZSWXJGai9zNXJCNUpMSVBLTlc3NitFc0ZPelhQaEl3?=
 =?utf-8?B?eWZ1NnEyTndMaVlab3d2bUpHK2hTbVA3VFFadWZHOFlxNlBkWTJuLy95a3dD?=
 =?utf-8?B?OHlmRU82UDFtT2JVY3dNb2JNQTMyLzA0YSsrek9aOCttT1hjNVltZXE0SGtP?=
 =?utf-8?B?bVBXRWUweUtEMUNjeVBWVXIzVWd4clJkQlByQStBbHlyMndEQnNxV0JvdWtv?=
 =?utf-8?B?MHR2SE9rZUE5dDg2bFJSMGRoZlR6emxqTXdNVXJFWUFpUStwUlZFSlBMZ0xh?=
 =?utf-8?B?NVc5aXdaV1huS3ZjaFdoNVYwZUJjTXI5Z0x2TzNrakdpNFpJTEplM1FIVVl2?=
 =?utf-8?B?emtZbUlRTzBMNVltYkJ1NlFLaXl4M3d0VEE0Tk81RGcxaGtrWEpYR3NNSlFG?=
 =?utf-8?B?SmZHY1lVRVJkdVozOW9HQzBqd1ovanVaWjlzcUV5bDVkeWEwUkpad3FDTDFZ?=
 =?utf-8?B?KzhHQTVGenVKWlVIUDhxT3FyOGF4MXV6Ui9ZVlVQRmV2bFV3c0lPR00wUlY4?=
 =?utf-8?B?ZU0zR1lhaGM4ZFFZRG9tOGxzbHBvWHM4N3M1TjRjRWFRRSs4T2tiNmRjTUJ5?=
 =?utf-8?B?M1lhczNVTmtQMys3MXNwbWZqUUllUjF4eVpEYXpndHVRZ3lLVmM0M0dBMGg3?=
 =?utf-8?B?ZEdBdksxaUduVHdBaEg2RFM0SWp0QmsrVjVnbnpFWVNobmVmc3Q0WDJnL25s?=
 =?utf-8?Q?ub6UJszrxB4S6?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8429.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWFoWlFuRktsTUNsVFZGbWlwZUxuTGZzRUJzczB4M0xaZ0J6eDcraGhycGh4?=
 =?utf-8?B?ZU5PQ2NZb0dDU2kyUFcxdTU0cGJaOUdkVGRJUG92a1hteFU3ekVCWFBEWkc4?=
 =?utf-8?B?SnRuZkQyV2s0K2VuUlRUczRWb1RMUjF3NlY3eWtlVG9hS2RYK2RPQTBsb1hB?=
 =?utf-8?B?QTU0L2VWdEZERzd5elpGNW5FTk9aaURiWUNTRDdpNWRTWXNES1ZUeUtNMGVJ?=
 =?utf-8?B?TjJRaS9xTEJhTlJGU3IyS3FtaDNJM1JLK29BRlFuLzNxQXNkSzl2dDZKelBL?=
 =?utf-8?B?cUZHeklGWmh2T1RzMVVLKzZHT0hmbkpaNE5WSUJxZThGYUZqVVhXQWNoMXYz?=
 =?utf-8?B?aW5neVMxWnlKU2FiRlFsS3pSK1NrcnlLcUx3ZzhZWGJ1aWUwNEo3MUtTVURC?=
 =?utf-8?B?dUxCYm1qd1kwQk92MlFoTGJwSVl2U291ano5TTBreGxzRmYwcy9ZVGgxMzBu?=
 =?utf-8?B?ajFvZkNoMmNBV2hWY0Y0bzZJYVBLbWxPbEtIQU82SHV2UzV5a3JhdVlnakFO?=
 =?utf-8?B?M3pHL2Y2R3NVUjdqWTlFS0hkN3VabzYwai8wTUIvQ1A0RE1ndjNLMVZWQWts?=
 =?utf-8?B?R0lXMXordlNoSVZOdjVMczZNTHNMVlhyVHQ5NG8zMWsyaTZtUTZKTHFlUGFG?=
 =?utf-8?B?NUNnQzhWUUx2d1FFSEpiMlQvcUU4ZDFUc2l0RjJ4OUdDSVVXcWFKdWFUaWZa?=
 =?utf-8?B?N0ZlelBTckYyYkZCTW5FYVA3bGp3Tk9SZ04vTDdqeWlxdzRjUjRuemkzOE1k?=
 =?utf-8?B?bzFCaE1INU9hTkdtQkFkaTBWaEpFeTNKMERyUW42eERva3lUMmNiZFdleU5s?=
 =?utf-8?B?dUt1YmhPR2pVblh0K3A5a0NkZGRRbmUyeWZoTzF4UXd6SG53eHRwc1hyUEhx?=
 =?utf-8?B?K0JvREJ4RGhKVU5kWFBITmJOWmZ1SEl3dnRzcEZ5R2hpcHUzR2RERUJZK2l5?=
 =?utf-8?B?ZkdjRldlUXhtT2JNdkMvbnZYc0ZHQzVWQVNtL3RSaUpBT3llVDNpRlE5SFla?=
 =?utf-8?B?MzRsdzlUYklxV2N5c2NpeWJBdHV4UGE0amZvbFZWMzBaNlhyY2lqS000WEpw?=
 =?utf-8?B?YmZHb1BpTkxqZlhnTXk5L05sWkVZcVFKZm1WMU5uR2xSQmZXOVNmMnJ0dWFG?=
 =?utf-8?B?WW9lVEdEN1pPMGlJcXF2WW1xcUNMb1FWU3ZrYzBnc3BsbXRIM2U0S2Zuajlt?=
 =?utf-8?B?RXpyRDA2UXlNZlVFQko3SnM3dVBIdkRuNUJQVFF1QVFVZ1pORWFlYW5vMVk1?=
 =?utf-8?B?US9TYU0zdDZnM3YveW1maHVKbDc4NlhOMHViY05iaUIwakw0SERhRURGcVRn?=
 =?utf-8?B?RkpqdkZ6Yzk1SVJGNVFKb294K3F5cFpUdThydUdheDl0QnJqS1dybkhtWXI4?=
 =?utf-8?B?MEgwWW5rRmRYVXREeHEwV01Dbm9Xb1NsSG9DL2EvRytHSGdiSzliUkF3RDdT?=
 =?utf-8?B?WGx5WGN5WDVlelpzd2FDQzRVOG83N0g1elQ4YjJlM2dmQm11KzVrK25DSGFQ?=
 =?utf-8?B?OXJZT2gxUlZmVzlmeC91SzNOUDZTWXR5SHZNSk43bHpQUUhLNTQyK2ZEcFJY?=
 =?utf-8?B?T0hEd1FJL0xrQ003V1piN1ZGZ1dTQzVUVzZkL08yUDBNMnpMNDVLMUd1Vm5x?=
 =?utf-8?B?bE4yblRGbWdWdGNzckZIZ3Nlek1vZG9OcG5zTWhHWHg5N1B1N1ZYb0xvclRM?=
 =?utf-8?B?ZXRldGlnNGdxc0kvTlFueCtSSFVEQUIxZnNiQVFVUHo3SG5paHJzTWxNbXlj?=
 =?utf-8?B?cjE3UERIcU1zTzZ6TXlmZEZmdjdSV29IK3Bsb1pzNDhPbnV6NlhFbXlsanR2?=
 =?utf-8?B?OEVOOEJKQU9lTHJsWGpISEtvMXp2dloxOVgzUXZNVU54Z1ZmbHBxUkxjNGJ3?=
 =?utf-8?B?SDFTTExQVHRpcTVDd0hmWmpQYUhoUVdZV01URUF1b0swdGR6NFlWcnJ1eURG?=
 =?utf-8?B?N1pXWllHT1c2VGh5cUsrZ2lucmlsU21KZk4yMDAzVExPUmdCUVlvdDArVU9q?=
 =?utf-8?B?Wk05L21NNGtjYjJHU0hOMVB6clZabmhZMnlCRjFKRnE1aWpobkx6YWt2WlpG?=
 =?utf-8?B?Z3l5eHlPZG5UYk5Td3JMc1p4VkNTTUduT1FyRDBIWVV1NytMcUI0TmVCZm1O?=
 =?utf-8?Q?ySdk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8429.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8883e633-7016-4503-3246-08dd4a6f52d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 07:40:14.7692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V/bTI0fq/vcw9ByJSJEfXFRhv9fBdrC0iCPKJ4op07cFWRKy4ome981Pe7wt6Yc3XbWVvPzifmAjPKOI0DvbwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10852
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_234019_439097_609D6074 
X-CRM114-Status: GOOD (  34.56  )
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWljaGFlbCBOYXp6YXJl
bm8gVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPg0KPiBTZW50OiBUdWVz
ZGF5LCBGZWJydWFyeSAxMSwgMjAyNSAzOjA5IFBNDQo+IFRvOiBTaGVycnkgU3VuIDxzaGVycnku
c3VuQG54cC5jb20+DQo+IENjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBsaW51
eC1hcm0ta2VybmVsIDxsaW51eC1hcm0tDQo+IGtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPg0K
PiBTdWJqZWN0OiBSZTogRURBQyBvbiBpbXg4bXAgYW5kIGRkciBzY2FsaW5nDQo+IA0KPiBIaSBT
aGVycnkNCj4gDQo+IE9uIFR1ZSwgRmViIDExLCAyMDI1IGF0IDc6MzTigK9BTSBTaGVycnkgU3Vu
IDxzaGVycnkuc3VuQG54cC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hpIDxtaWNo
YWVsQGFtYXJ1bGFzb2x1dGlvbnMuY29tPg0KPiA+ID4gU2VudDogRnJpZGF5LCBGZWJydWFyeSA3
LCAyMDI1IDU6MzcgUE0NCj4gPiA+IFRvOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+
OyBTaGVycnkgU3VuDQo+IDxzaGVycnkuc3VuQG54cC5jb20+DQo+ID4gPiBDYzogbGludXgtYXJt
LWtlcm5lbCA8bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnPg0KPiA+ID4gU3Vi
amVjdDogRURBQyBvbiBpbXg4bXAgYW5kIGRkciBzY2FsaW5nDQo+ID4gPg0KPiA+ID4gSGkgU2hl
cnJ5IGFuZCBTaGF3bg0KPiA+ID4NCj4gPiA+IEkgaGF2ZSBzZWVuIHRoYXQgd2l0aCB0aGlzIHBh
dGNoICJhcm02NDogZHRzOiBpbXg4bXA6IGFkZCBkZHINCj4gPiA+IGNvbnRyb2xsZXIgbm9kZSB0
byBzdXBwb3J0IEVEQUMgb24gaW14OG1wIiBidXQgb24gdGhlIHNhbWUgdGltZSB0aGUNCj4gPiA+
IGRkciBzY2FsaW5nIGlzIGNvbWluZyBmcm9tIGFybV9zbWNjY19zbWMgRFZGUyBmcmVxdWVuY3kg
c2NhbGluZyB0aGF0DQo+ID4gPiBpcyBtYW5hZ2VkIGZyb20gaW14OG0tIGRkcmMuIFdlIGhhdmUg
dGVzdGVkIGl0IGEgYml0IHRvIHVuZGVyc3RhbmQNCj4gPiA+IGlmIHRoZSBjaXJjbGUgdG8gaGF2
ZSB0aGUgY29kZSBjYWxsIGZyb20gbGludXggdG8gQVRGIHdhcyBzb21laG93DQo+ID4gPiB3b3Jr
aW5nLiBXZSBkb24ndCBjaGVjayBvdGhlciB0aGFuIHNtYWxsIHRoaW5ncy4NCj4gPiA+IElmIHRo
ZSBpbXg4bXAgaXMgY29tcGF0aWJsZSB3aXRoIGlteDhtLWRkcmMgYW5kIHN5bm9wc3lzIG1lbW9y
eQ0KPiA+ID4gY29udHJvbGxlciwgc2hvdWxkIG5vdCBuZWVkZWQgdG8gbWVyZ2UgdGhlIHN1cHBv
cnQgaW4gdGhlIHN5bm9wc3lzDQo+ID4gPiBjb25uZWN0ZWQgdG8gdGhlIGJvYXJkIHBsYXRmb3Jt
IGRhdGE/DQo+ID4gPg0KPiA+DQo+ID4gSGkgTWljaGFlbCwNCj4gPg0KPiA+IFRoZSBpbXg4bS1k
ZHJjIHlvdSByZWZlcmVuY2UgaGVyZSBpcyB0b3RhbGx5IGRpZmZlcmVudCB0aGluZyB3aXRoIHRo
ZQ0KPiA+IHN5bm9wc3lzX2VkYWMgdGhhdCBteSBwYXRjaCBhZGRzLg0KPiA+IGlteDhtLWRkcmMg
dGFyZ2V0cyBkeW5hbWljIGZyZXF1ZW5jeSBzY2FsaW5nIG9mIERSQU0sIHdoaWxlDQo+ID4gc3lu
b3BzeXNfZWRhYyB0YXJnZXRzIEREUiBFQ0MgZmVhdHVyZShlcnJvciBkZXRlY3Rpb24gYW5kIGNv
cnJlY3Rpb24pLg0KPiA+DQo+IA0KPiBPaywgdGhhdCBpcyBjbGVhciBidXQgYm90aCBpbnNpc3Qg
b24gdGhlIHNhbWUgb2JqZWN0LCB0aGUgbWVtb3J5IGNvbnRyb2xsZXIuDQo+IE5vdyBJIG5lZWQg
dG8gY2hlY2sgYmV0dGVyIGJ1dCB0aGUgbWVtb3J5IGNvbnRyb2xsZXIgaXMgZGUtZmFjdG8gY29v
cmRpbmF0ZQ0KPiBieSB0aGUgQVRGIGluOg0KPiAtIG1lbW9yeSBmcmVxdWVuY3kgc2NhbGluZw0K
PiAtIHN1c3BlbmQvcmVzdW1lDQo+IA0KPiBBdCB0aGUgbW9tZW50IEkgZG9uO3Qga25vdyBpZiAg
SSBjYW4gY29uc2lkZXIgdGhlbSBpbmRlcGVuZGVudC4gV2hhdCBJSQ0KPiBoYXZlIGRvbmUgcXVp
Y2sgaXM6DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4bXAuYyBi
L2RyaXZlcnMvY2xrL2lteC9jbGstaW14OG1wLmMgaW5kZXgNCj4gNWRiNTQxZjBlYWYxLi5lOTIz
ZDc4OTc1N2MgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvY2xrL2lteC9jbGstaW14OG1wLmMNCj4g
KysrIGIvZHJpdmVycy9jbGsvaW14L2Nsay1pbXg4bXAuYw0KPiBAQCAtNTU2LDggKzU1NiwxNCBA
QCBzdGF0aWMgaW50IGlteDhtcF9jbG9ja3NfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCj4gDQo+ICAgaHdzW0lNWDhNUF9DTEtfSVBHX1JPT1RdID0gaW14X2Nsa19od19k
aXZpZGVyMigiaXBnX3Jvb3QiLA0KPiAiYWhiX3Jvb3QiLCBjY21fYmFzZSArIDB4OTA4MCwgMCwg
MSk7DQo+IA0KPiAtIGh3c1tJTVg4TVBfQ0xLX0RSQU1fQUxUXSA9IGlteDhtX2Nsa19od19jb21w
b3NpdGUoImRyYW1fYWx0IiwNCj4gaW14OG1wX2RyYW1fYWx0X3NlbHMsIGNjbV9iYXNlICsgMHhh
MDAwKTsNCj4gLSBod3NbSU1YOE1QX0NMS19EUkFNX0FQQl0gPQ0KPiBpbXg4bV9jbGtfaHdfY29t
cG9zaXRlX2NyaXRpY2FsKCJkcmFtX2FwYiIsIGlteDhtcF9kcmFtX2FwYl9zZWxzLA0KPiBjY21f
YmFzZSArIDB4YTA4MCk7DQo+ICsgLyoNCj4gKyAgICAgICAgICogRFJBTSBjbG9ja3MgYXJlIG1h
bmlwdWxhdGVkIGZyb20gVEYtQSBvdXRzaWRlIGNsb2NrIGZyYW1ld29yay4NCj4gKyAgICAgICAg
ICogVGhlIGZ3X21hbmFnZWQgaGVscGVyIHNldHMgR0VUX1JBVEVfTk9DQUNIRSBhbmQgY2xlYXJz
DQo+IFNFVF9QQVJFTlRfR0FURQ0KPiArICAgICAgICAgKiBhcyBkaXYgdmFsdWUgc2hvdWxkIGFs
d2F5cyBiZSByZWFkIGZyb20gaGFyZHdhcmUNCj4gKyAgICAgICAgICovDQo+ICsgaHdzW0lNWDhN
UF9DTEtfRFJBTV9BTFRdID0NCj4gaW14OG1fY2xrX2h3X2Z3X21hbmFnZWRfY29tcG9zaXRlKCJk
cmFtX2FsdCIsIGlteDhtcF9kcmFtX2FsdF9zZWxzLA0KPiBjY21fYmFzZSArIDB4YTAwMCk7DQo+
ICsgaHdzW0lNWDhNUF9DTEtfRFJBTV9BUEJdID0NCj4gaW14OG1fY2xrX2h3X2Z3X21hbmFnZWRf
Y29tcG9zaXRlX2NyaXRpY2FsKCJkcmFtX2FwYiIsDQo+IGlteDhtcF9kcmFtX2FwYl9zZWxzLCBj
Y21fYmFzZSArIDB4YTA4MCk7DQo+ICsNCj4gICBod3NbSU1YOE1QX0NMS19WUFVfRzFdID0gaW14
OG1fY2xrX2h3X2NvbXBvc2l0ZSgidnB1X2cxIiwNCj4gaW14OG1wX3ZwdV9nMV9zZWxzLCBjY21f
YmFzZSArIDB4YTEwMCk7DQo+ICAgaHdzW0lNWDhNUF9DTEtfVlBVX0cyXSA9IGlteDhtX2Nsa19o
d19jb21wb3NpdGUoInZwdV9nMiIsDQo+IGlteDhtcF92cHVfZzJfc2VscywgY2NtX2Jhc2UgKyAw
eGExODApOw0KPiAgIGh3c1tJTVg4TVBfQ0xLX0NBTjFdID0gaW14OG1fY2xrX2h3X2NvbXBvc2l0
ZSgiY2FuMSIsDQo+IGlteDhtcF9jYW4xX3NlbHMsIGNjbV9iYXNlICsgMHhhMjAwKTsNCj4gDQo+
IEFuZCBpbiB0aGUgYm9hcmQ6DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9mcmVlc2NhbGUvaW14OG1wLWljb3JlLW14OG1wLmR0c2kNCj4gYi9hcmNoL2FybTY0L2Jvb3Qv
ZHRzL2ZyZWVzY2FsZS9pbXg4bXAtaWNvcmUtbXg4bXAuZHRzaQ0KPiBpbmRleCBmZmQzNjcyMjU1
YzAuLmY5NmE5ZDlmNjRkMSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvaW14OG1wLWljb3JlLW14OG1wLmR0c2kNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0
cy9mcmVlc2NhbGUvaW14OG1wLWljb3JlLW14OG1wLmR0c2kNCj4gQEAgLTE5NCwzICsxOTQsMjMg
QEAgJmVkYWNtYyB7DQo+ICAgPCZjbGsgSU1YOE1QX0NMS19EUkFNX0FMVD4sDQo+ICAgPCZjbGsg
SU1YOE1QX0NMS19EUkFNX0FQQj47DQo+ICB9Ow0KPiArDQo+ICsmZWRhY21jIHsNCj4gKyBvcGVy
YXRpbmctcG9pbnRzLXYyID0gPCZkZHJjX29wcF90YWJsZT47DQo+ICsNCj4gKyBkZHJjX29wcF90
YWJsZTogb3BwLXRhYmxlIHsNCj4gKyBjb21wYXRpYmxlID0gIm9wZXJhdGluZy1wb2ludHMtdjIi
Ow0KPiArDQo+ICsgb3BwLTI1MDAwMDAwIHsNCj4gKyBvcHAtaHogPSAvYml0cy8gNjQgPDI1MDAw
MDAwPjsNCj4gKyB9Ow0KPiArDQo+ICsgb3BwLTEwMDAwMDAwMCB7DQo+ICsgb3BwLWh6ID0gL2Jp
dHMvIDY0IDwxMDAwMDAwMDA+Ow0KPiArIH07DQo+ICsNCj4gKyBvcHAtOTAwMDAwMDAwIHsNCj4g
KyBvcHAtaHogPSAvYml0cy8gNjQgPDkwMDAwMDAwMD47DQo+ICsgfTsNCj4gKyB9Ow0KPiArfTsN
Cj4gDQo+ICsNCj4gKyZlZGFjbWMgew0KPiArIGNvbXBhdGlibGUgPSAiZnNsLGlteDhtbS1kZHJj
IiwgImZzbCxpbXg4bS1kZHJjIjsgIHJlZyA9IDwweDNkNDAwMDAwDQo+ICsweDQwMDAwMD47ICBj
bG9jay1uYW1lcyA9ICJjb3JlIiwgInBsbCIsICJhbHQiLCAiYXBiIjsgIGNsb2NrcyA9IDwmY2xr
DQo+ICtJTVg4TVBfQ0xLX0RSQU1fQ09SRT4sICA8JmNsayBJTVg4TVBfRFJBTV9QTEw+LCAgPCZj
bGsNCj4gK0lNWDhNUF9DTEtfRFJBTV9BTFQ+LCAgPCZjbGsgSU1YOE1QX0NMS19EUkFNX0FQQj47
IH07DQo+IA0KPiBJIGhhdmUganVzdCBhIHF1aWNrIGNvcHkgYW5kIHBhc3RlIGluIHRoZSBlbWFp
bC4gVGhpcyBnaXZlcyBtZSBhIHF1aWNrIGlkZWEgb2YNCj4gdGhlIHN0YXR1cy4gU28gZnJvbSBv
bmUgc2lkZSBJIGhhdmUgb24gcmVnID0gPDB4M2Q0MDAwMDAgMHg0MDAwMDA+IHRoZQ0KPiBpbXg4
bS1kZHJjIGRyaXZlciBhbmQgb24gdGhlIG90aGVyIHRoZSBzeW5vcHN5cy4gRG8geW91IGhhdmUg
YSBwbGFuIG9uIGhvdw0KPiB0aG9zZSB0d28gZnVuY3Rpb25zIGNhbiBiZSBjb29yZGluYXRlZCB3
aXRoIGVhY2ggb3RoZXI/DQo+IA0KDQpIaSBNaWNoYWVsLCBJIGFtIG5vdCBmYW1pbGlhciB3aXRo
IHRoZSBpbXg4bS1kZHJjIGRyaXZlciwgYW5kIGFzIEkgc2FpZCBhYm92ZSwgdGhlcmUgaXMgbm8g
cmVsYXRpb25zaGlwIG9yIGNvbmZsaWN0IGJldHdlZW4gdGhlIGlteDhtLWRkcmMgZHJpdmVyIGFu
ZCB0aGUgc3lub3BzeXNfZWRhYyBkcml2ZXIuIFJlZ2FyZGluZyB0aGUgIm1lbW9yeSBjb250cm9s
bGVyIiBuYW1lIHlvdSBhcmUgY29uZnVzZWQgaGVyZSwgd2UgYWRkZWQgaXQgYmVjYXVzZSB3ZSBu
ZWVkIHRvIGdldCBzb21lIG1lbW9yeSBjb250cm9sbGVyIHJlZ2lzdGVycyBmb3IgRURBQyBmZWF0
dXJlLg0KSXQgaXMgdW5jbGVhciB0byBtZSB0aGF0IHdoYXQgeW91IHdhbnQgZG8gb24gaW14OG1w
LCBidXQgZm9yIEVEQUMgZnVuY3Rpb24sIGlmIHlvdSB3YW50IHRvIHVuZGVyc3RhbmQgbW9yZSwg
bWF5YmUgeW91IGNhbiBjaGVjayBodHRwczovL2J1dHRlcnNpZGV1cC5jb20vbWVkaWF3aWtpL2lu
ZGV4LnBocC9NYWluX1BhZ2UgYW5kIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvdjQu
MTQvZHJpdmVyLWFwaS9lZGFjLmh0bWwuIFRoYW5rcyENCg0KQmVzdCBSZWdhcmRzDQpTaGVycnkN
Cg==

