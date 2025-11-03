Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D071CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 21:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTQ+/eoAn+aZqDJLqryvHIkv7HpjCVbKwDoZrK9Vy3o=; b=OFseiuXLhzGHj4mzDIwFeTyjPM
	BGOMW1DGjqGssv08YLW7tRgalp7dB/+CesGp/6jWY5EqmuEtPGzbvnwv8SqhO7Uxbo+RSpzhjg1C1
	4S62bycD7Ssy2rEbWGhqZa1IjcCSlWB4uDn4nf3Wm2R+em+HAABeA2QigYsguWMh8dnKeIZMexPbF
	sNbZdMa9ry7CTuwGjsJ4bJYiwbdojKZtNYkFAquuVxsX5iqTCoKth+FF//jUxcmsZBcQTBLTea691
	lJLER/+d7a6CpWspwZ2QDRbXO++A3gSjS2+kmIAhGcDSpC33Zi9GnjoKr8IaLjPPfA5ioQ+bxHXCR
	b2+sqc7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG2QT-0000000AfnM-1Eks;
	Mon, 03 Nov 2025 21:49:21 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG2QP-0000000AfjY-43FO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 21:49:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lD7ut6w9DHmvsK2hTCanOjn9BKmlNLnrXaeQT7pFNdxDnhrviACbqsw46GkD4RTMDx2y4CWfxpd2Nqt8vz1mdW0jgjeP/LaeRh+YyO5ajrsX90j4At7OkZDu5l7VrMpzEgNnBgZ14S3qcpsDtxuX8Bj0w065ffwJIRkPUAXBrcutVm1+7fy5wY0e6oRmWUSyWob+/hG6AlKbXClThG2kUbokB80esO9Qt05WY6dnxpMYBmEGAhX1jrqMHiIRSot/b6GgIkLJQ+eoQALhSO3ZAGqy1GRL9Xkpdr2aF6h/DvyJDlraC+bWvFwHL+eHjq3a9jIrLdkEei/HPDu0lI+Y1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTQ+/eoAn+aZqDJLqryvHIkv7HpjCVbKwDoZrK9Vy3o=;
 b=kL0DuuLyYKcbdKMGnmJmyRWVRYCjxsonGUgpd1b2n6wAm6h7LiC62EkmMyJUzwxRCSmSAswIzb9Ze39C9nPcXlTF4qiX7/uKv6IpK2xqJYJuTxEh6QRFCeI+tAHGNMy3hCkAx4McW9G0An7arI5+9lbg6q02GDyfIiJYoBSRNsS02D6dfq4uN3xJLOaHWDP/cihxf1UCW17DAfBOLlN5CM4lwua7lsyU9ozexZELBuORaoNET5IxNXa/N3pNYmSjZQztg/STNTkDz5mL+wMiGGxfrgCB5mhiQI8Bi7RIv95rqX8IAnuEu2z0SuxNDji0LQnY2sjBYsfW6GSMlfljBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTQ+/eoAn+aZqDJLqryvHIkv7HpjCVbKwDoZrK9Vy3o=;
 b=dLNcv163tsvo+6XSG2cSAQMU1jgreaTXoYeG5ttui5Q+JK1fetd2oG6orE9PKvnR1suKC0S2DVa32aAg7+/rvg6wSR/oVKpw/o/lTainTrRZYyUNxmTP0K1YCafwzwCSzZhw67gYWJmxAN5OgZ7R7uzFl/OaJVuPRBqjYV6mQ3fGKTADoyThMfFI9DjwCjmoWchy66jMObgjcyTrcf85fe6rgDzfu8kfQHjPOOjpHps+yRkY6JgKA4sWF96l/RJduR90dfaM/gneTj6EFl6d90IDc8j/3CIwWdblmsnsChnGZ47JZ5kvI8tg5SpZ932mO+AwwJwaMfVGN58o/CDy9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by VI0PR04MB11503.eurprd04.prod.outlook.com (2603:10a6:800:2c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 21:49:13 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 21:49:13 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 03 Nov 2025 16:48:33 -0500
Subject: [PATCH v3 6/6] arm64: dts: imx8dxl-ss-ddr: Add DB (system
 interconnects) pmu support for i.MX8DXL
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-qm_dts-v3-6-2bfda8ee14c2@nxp.com>
References: <20251103-qm_dts-v3-0-2bfda8ee14c2@nxp.com>
In-Reply-To: <20251103-qm_dts-v3-0-2bfda8ee14c2@nxp.com>
To: Frank Li <Frank.li@nxp.com>, Xu Yang <xu.yang_2@nxp.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762206519; l=2241;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=PisC1FFnqO8CpYCnMicfreqFJ284Xm7e1m95ZljMa9g=;
 b=+XJWcIqyHi1ifjF9jFRG5RU0oBxiJbsbd4iRbJUeGx18rKqO8b4OdFeDDQd8v0b3SCi669cM5
 +W1eJ5gB815CxwogmJt0Qz+oCXnot5qFqnf4fX9Mr96I5bHF6RbxXhx
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0238.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::33) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|VI0PR04MB11503:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b053bae-1b24-4163-abca-08de1b22d3f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFBic0xwNFNxVmNBdk5Qd3orUFNMODYvQ05GeXAxa1AzZ2tkZk5tQ003UGM1?=
 =?utf-8?B?VDc1SEl4Z2Z3MERLTU12SGQxSUtDdFZpQUE4bGZYSTJWRDBUeG9PQ3VnbUlR?=
 =?utf-8?B?S3ZzYmNlOHI1WlJCd1VpY2xhQlJTM290STNGNlIzYmRncnZ2U3h4YWlnQ1Fq?=
 =?utf-8?B?eitxUStqN2s4K21vaDB5bWludlFKNzBnZ1BsUjh3SThZalZ1bVZiY3phUGVw?=
 =?utf-8?B?ODdLQldrUmlkV00ycnFaWTAyYlpnRzVqODd3N2xmSCtYRzdNQTlUSUFDQnVS?=
 =?utf-8?B?L1V6a3huME9yZm96SGJoc3NGS1d0YnlzVzZBOTJ4TlRQcXNwWkNWaDBnYWZT?=
 =?utf-8?B?QzN6T0FIdGZBZFp3L0tMb1B1TU5HNnFGU0ZwY3BNTHNndzA0WWFLY21LN1pS?=
 =?utf-8?B?cTlzN3c3QTZMK2VYeGx5Q2pUNE43dXdLR2N3T2QyTm55amxEbnBLRmVDa0JL?=
 =?utf-8?B?TzZnV0tkcHJmakNtOXVCR3R4Tm9CYmVXNVM3eTJWUWVHamJyc2ttTTFuekZE?=
 =?utf-8?B?QS9WRmxPNlAvNDVrZnNZZFlKK0dicUdYaU56QjhUbENtdTZmZ1Jhajc2MHAv?=
 =?utf-8?B?N001UFY4M05XeUhDaGR2SWR1OG04TWNyUEpBS2tPZGF2RGlUTXdVbXl0NGd4?=
 =?utf-8?B?dW1OWlBEcXRQODRIcGRQUHdjUFAzSWxpUzFiU2F0ajVCTW8vVnlhWk92T2hm?=
 =?utf-8?B?cTI2c0w0dlpjY3dGMFRTakFOTTRodktuVzcyb3RtbkFhcjdDTUtjWERsVTRs?=
 =?utf-8?B?RlVGeTZ4eG9QTXhTd0Z4dXpWTWZiRjJrZnAvNzNRaGdoQXN6OVpEVXZCZVls?=
 =?utf-8?B?dWZ0VEpUTytXVDdDSTUzQ1BkMmk1RWlBMkJubTczOWNKSXVXQkZmMURhRTVH?=
 =?utf-8?B?MFF6NWUrN2MzcGhhMHU0cVJTcUZnRThyY3ZyRytKeks4aCswcFQ1cEl0dTFP?=
 =?utf-8?B?bDFrYWRhKzBDZU4vKzBIbGNrUXViNWdYZXhtcERNU3ZwZkdGcUJOLzZJVlBS?=
 =?utf-8?B?UXR2bGphZTQ5RWZZMzJhQVBtMklGekZvT0hWbVByaUc0Z3ZXNWV2MVpIekZE?=
 =?utf-8?B?UnQ4MHp2WHV4dVhNUVVOcUg3YVZaSDJ4bEdhdk9ielVuejhuTkd3TktBbnVi?=
 =?utf-8?B?b09pNmlQRUtIYlBvQWpnM0ZWMzdWMVJSQmh4bDNJTk9tbFhwRDJ4UUNGMXVM?=
 =?utf-8?B?U0FZQTREMDF6KzRUd1FFMHEydnVvWHRPWUcwMm41dEp1UlMxMEt5VGw1RWR0?=
 =?utf-8?B?L3NlY3lnS3pMSTNaR3U3OEVJNjNYMlVhR2dTanF0aE5OVDllazczcHpxOGR4?=
 =?utf-8?B?WGp3MW9COHdpalR0WmZvc0NqZk56YXd0VHFIRVM5WXRZWmEzYW1xb24wZ3p2?=
 =?utf-8?B?SkVTTEUzSnJjdFhZdXpPVVVzSGJrUUNRejJGWEh3MEZyQnNNK3Y0WElKY1Mx?=
 =?utf-8?B?d1ZxZjdrVXdWRGxCV1gwUGcvaGJncmJ1U3RNTmR5VWlHMS83bnd5bnJYUDZy?=
 =?utf-8?B?aUw1RjNIOFFPNmh1QnlBOEpHaVRjL3dadGVaQ2V5V1VpUzc4bVZGZDFKZ21r?=
 =?utf-8?B?OTYzWnNMY2pGNlhTNHc5aGI0cEk0SWlvZmlJaUxabm4rWk56c2JNTkhsQlZ5?=
 =?utf-8?B?YUltdGhuKzFobGl0bk5iQjVsVUU0cWhLR2lKdHd2VGxDMzdBb3dLNHNlcFNK?=
 =?utf-8?B?Qm5qTkRKejFMUkxNN0ZyemQ0R0Nhd3pVZVpJM1BxQ25SN1dEOXQ3Q0t3SElE?=
 =?utf-8?B?Q2xOMWVTdlA3T2JCL09LNjA5ek5HMjNEMmpFY3Rpam1IcURCOE9mRmpZUXdz?=
 =?utf-8?B?L2tMUXlOWDk4SE56bzZGakhaOGpkbTFFODk3YTNVWDQyUVRMWmJ1dXlJRGxh?=
 =?utf-8?B?M2tZaVVVY3RGVnAzbnVzU2lCblgxcXNXbGpyRHFaYXU1UHpMRlJzMW53Rk5B?=
 =?utf-8?B?WVp1NERONzUvb1BIN0ZRbnRvT0wrN3JBcEtDQ1JvVTJLUERSS0JxTzdUM1h2?=
 =?utf-8?B?WTkxcWRPRnZHdUFMSnhTN01CTEdOYmpka25PYk5xY1B2b2xlbHo2Szl6T2Vm?=
 =?utf-8?B?R3hqYWNIN3pjaTRTblc0cUtiU1pNM01ZZmVUdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFdXMC8xbzVyc1dWcFJLdE5xYjhFMnRlME45NGROWVNCdlp1b0kzL09obUEy?=
 =?utf-8?B?VUgrT3BjdjhyWUlINHRJYm04MVRISkNFQ0hPd0hweEFoZlp1QmxVd2F4RVd2?=
 =?utf-8?B?a1pYYTNDazNlSE1iZEd2bnNhS3FqVGlIQVV1dWVUL1cvMDFvLzZQYy9TZWtM?=
 =?utf-8?B?bytwVm1TbnVzd0VvSk9qcExoZzR6NkdwdG9HOXh5T3NXNmpJWTFQUVRZTDBZ?=
 =?utf-8?B?c1prcmRvWGxBRGxOUG5HRTh1cFFkWGx3elptM29rbWp4NEFQQjdyVlZaZmtr?=
 =?utf-8?B?RmVzOXd0WHhITWxMcG9xeGkrRTZqQmxRbUU2dVQvL2x1QTZzaHJ3bERteEJw?=
 =?utf-8?B?aFhXNjNhQU5iRlJRdWgxTWtZUi84N2Z2OENJRUZ2QzA1d1hFWlpDdEhDTzd1?=
 =?utf-8?B?TjZTdXFLT3E5cEFjN1FjVjNxTmJETWF3dUo2cDJzS1M2OEVTUEpIbThIVUhz?=
 =?utf-8?B?Q2tYMFZTZW5KOFJ1b1Z6Q2NJQnV6cnZ0TVFtUVljcWNJK1QvSFNhbmpBSXdx?=
 =?utf-8?B?bXFBZm9HU0QzcXUrbllJYTBIWkE2VnRnZCtCUFIzRHlKWmhaZENUQ1JrYk05?=
 =?utf-8?B?VTJTK2VySEp5SnA0Wmc4MnpRSTd0U01IK3pSZUYxYlZqR1haSnpsM1pHRm13?=
 =?utf-8?B?VFYvZ0I3NDAwZU00UXAxTzl6K0lNM0d2ZzNZZVZDKzRCejV5UzVJOGQyRHVa?=
 =?utf-8?B?dk82S2Y5SlJtR045QjZPT0dwUjRkcW1ITWZoVnJrZGptVHR3TElGdUdKWnpU?=
 =?utf-8?B?N0dTSFErNnZKSlZkS0RIUWc2L3BxNG8zWjdFVXprR2FXZ05sZ01taVE4RFQ0?=
 =?utf-8?B?NU1vcDczN0dLbmVEeXdocWdIVGF1aFM5Ym4vREtBM3Q2T2hWNGVkdVB6VDNr?=
 =?utf-8?B?WkF6YldMSnRaTk5yNW14YUdOb2w5TmJTRU0yWWd2YmVVZW54ckt5OFBCN1BP?=
 =?utf-8?B?RFl3NFFpVlJEZDRqK2JKMG5zK080R09NbXdCZmpVWjVHYW5LNThabXFialVK?=
 =?utf-8?B?ZkNOU3dYLzZ3bC83b1NaQnNqTVVISjdvVWVHWkVYRXBRejFLREV6RVE3cVBZ?=
 =?utf-8?B?Skk3YXFrRkVLZ3hvYXNmaWhZZGQrOHBsV2xTcUNYeEtxTUJlUHIrUDQ0SkVS?=
 =?utf-8?B?Uy9lK2VzRktMeVovazdSNTdtSjFyRndWVjN0V284aklzZ2lqd3lKQWthODRV?=
 =?utf-8?B?ZjFlL3dheHo3VG4zeEJ4WWRyQWF3Q2NTZW1QblZUZ2JoVGNpSnhieHR1TGJw?=
 =?utf-8?B?ZVRRb01DdUhWclBPaUZmV2Vyb2VQUi9Pdm42R3FlVEF3MTJ4cXE1VEh3bDRE?=
 =?utf-8?B?NGZVdTQzYWRSSTd1WXBqdjJ2a0g2cS9GcGVJR2JWQStRUkZqYmdpM1orbkZv?=
 =?utf-8?B?b3l2amE3QzZFaFRVaTBNNDdvYTdjWEwySzJNNHZqTDVkVmVTd3BNMTJMTjdM?=
 =?utf-8?B?VTlaOVVFS0JXdS9lZHBjRjI4YTMyNWpCSzM2dWxoc3hCcDdzdnhQUVUrV0ZO?=
 =?utf-8?B?SGFVNUN4RERLVHh3dXRzTWJ3RURYWnZnWFBtYWJzaEZxSVl1enExSXhqN3JT?=
 =?utf-8?B?L2hUNFhGaEgwTlMyTDdQK1BjZUp0ZGsrazNQNzJIOGthNCtMWDNsTnh4NFBN?=
 =?utf-8?B?T1pQMUwzekRNMHUvSGZYaktuVlNOV3JjeWNuN0FyS04xMkw3RFAyTnNZZWFT?=
 =?utf-8?B?WTFVOGQ2ZlBFUUs4cVdkdFczemt4M2NCcUFGRk1BcHVaK0hDMldZR2ltaDZy?=
 =?utf-8?B?b3BiNWtySmlEaUk0d1Z0aWlXQjExUW5Xam12VFUwUUJuRkx2UEJmZWVwdjN4?=
 =?utf-8?B?REJLU1JseXVCSXdMa204SWpObGYydVJ6OURSdUh3S3hYdHU3eWVLZjlONDBh?=
 =?utf-8?B?c2RCa2Nwbm1rTEFubnhUUXlZc3FLWE1aMFpxNmJsQTZxb3VYeHYwdDVjTnA2?=
 =?utf-8?B?VC9yVXlPcFdYdWZ3RkE5cDVta0dvcjMzL2lTby9kUkVMY3RCaEJoZmZQT2FN?=
 =?utf-8?B?cWNRYUZJb2hoSHlOMVdKRk13NEVXQW9ibzdPUVA2ZlliaHZ6MUpoa0J5bW1k?=
 =?utf-8?B?Y1E5N1pObHhKcG40aFh3a3lGNXZUT1p0d2Z1UjBIdVJFV3o5ZUw5eE4yNlp4?=
 =?utf-8?Q?+18XNITLvKbKGrnvC5MewfxW4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b053bae-1b24-4163-abca-08de1b22d3f6
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 21:49:13.3641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cU0LtwTy8Ag0DK2Amk8sja/UTcLjlCxIGCsOUivJP3Cb2FbYutfRQ5X7OTuGx7dY5Ew7sHN1TuA1jKgYq8veZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11503
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_134918_383256_438086F4 
X-CRM114-Status: GOOD (  10.62  )
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

From: Jacky Bai <ping.bai@nxp.com>

Add DB pmu related nodes. This pmu is in DB (system interconnects).

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- move clock-db-ipg to imx8dxl.dtsi
---
 arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi | 22 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi        |  7 +++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi
index 3569abb5bb9befd4d1504e3e2a352c64229533c0..adc6e394dbc5598c50e0e288ee605ac91087d36b 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi
@@ -7,3 +7,25 @@ &ddr_pmu0 {
 	compatible = "fsl,imx8dxl-ddr-pmu", "fsl,imx8-ddr-pmu";
 	interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 };
+
+&ddr_subsys {
+	db_pmu0: db-pmu@5ca40000 {
+		compatible = "fsl,imx8dxl-db-pmu";
+		reg = <0x5ca40000 0x10000>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&db_pmu0_lpcg IMX_LPCG_CLK_4>, <&db_pmu0_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "ipg", "cnt";
+	};
+
+	db_pmu0_lpcg: clock-controller@5cae0000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5cae0000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&db_ipg_clk>, <&db_ipg_clk>;
+		clock-indices = <IMX_LPCG_CLK_0>, <IMX_LPCG_CLK_4>;
+		clock-output-names = "perf_lpcg_cnt_clk",
+				     "perf_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_PERF>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
index 8d60827822ed1cc6cfb1a9369faaebfd711708d1..5106be2fde6e025cc066b796ba7987d0d9c21bd5 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
@@ -236,6 +236,13 @@ xtal24m: clock-xtal24m {
 		clock-output-names = "xtal_24MHz";
 	};
 
+	db_ipg_clk: clock-db-ipg {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <456000000>;
+		clock-output-names = "db_ipg_clk";
+	};
+
 	/* sorted in register address */
 	#include "imx8-ss-cm40.dtsi"
 	#include "imx8-ss-adma.dtsi"

-- 
2.34.1


