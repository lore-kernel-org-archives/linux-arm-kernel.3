Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7ECFCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 21:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JuJeZoRupbJ8PI+SNj3VmzUCCEFhLDT924JDikRMsGQ=; b=qbPjAGezT5jVhKrVSg7o/Ii7ST
	8Hhc7tWQmeXWLMWj1xkfxbgTI+JooKJVBOEHJYhJpN9bxxVo83150lrInXAgi1xFYFBtf26DMk2HA
	dFu/1qfQSBcaB61VgZQW9cCUPGQxArSh2nLspdAdm2YuT36gf5OsFw7pIoVREF+JmzvxCvBgfJXj2
	qfy7hrabWvkeEmlNSaj3L6IaTUv/SHY6hw+Ps+Q7ysX3xXPkJBpvklbpSTnegWKbsYrz8ZXqmgdpf
	+S+Jza62sf90tAHajz7Sg7skcGbZvFK/QJQIhaQMmGVYQEuIHG/xZtrxWGFYAbqdBGh+W+4BdTnEF
	y/6clO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAx7J-0000000F27q-0eIq;
	Mon, 20 Oct 2025 21:08:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAx7I-0000000F278-13H6
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Oct 2025 21:08:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=JuJeZoRupbJ8PI+SNj3VmzUCCEFhLDT924JDikRMsGQ=; b=qPIk14ac8HaZzjiqIOlyVdHr4K
	ZLndtTswUWz4xEtgCyJDMwXMCSbIgmQG4qtR+8aPxaLMTYNt7EhJQ/j3ClFMf0qhi7iekLvjsmuL2
	SSrBaLWbzocbhuHJF9/9LdwCnJnO+ICTLK74aZ6UPRvSo5UotGZ2k3cOwrx3f2y8XSLaTz8j5p6xa
	fTigEH6Ae9JDdnnnDm4zGNb6FM5C81qXlkIjnq6+l9qFPaGKtTfkbs7kVjPrjw+rfbbD8jWmKKKym
	DEY5a2Sio3HCxC/Nukq/R18A7PoU4UFC6+bqlgcBWAG3dup5HfiGwt07sr9Bm2N+FexAy62K3W1I8
	zJq6/F4w==;
Received: from mail-norwayeastazon11013037.outbound.protection.outlook.com ([40.107.159.37] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAwF7-00000000EZn-2OrI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 20:12:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bl1sArSZtfP9FQdECIMqji3TBl3FM5RAsFMewDLuefz06sOzpvRRBpbsX8D2Ylw48Nb83jlBe5HEQv8jPfHgL1vtUNXWs9EdbWgb/4PKkMaGluuN3QS92cSrnKtAh9N8XYETK78jVYJS7Gibjr02/M2x3hxEJHqniBCw795dRX/GOMjf+WdXiq3PqIsS66sXM7xeVygKJDMn4acF5H5ESui91f9Flx2SyiBFX3Htq+3AqwVTSx2xHFqNtYlee2+VkTvgJawm80OjLymVaxzviRM6uh2djJfMzLeVtvr+ssgGjwDbPrgVgmgaoLBboRPcRVazT/z3hI0r7jr3fwcE+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JuJeZoRupbJ8PI+SNj3VmzUCCEFhLDT924JDikRMsGQ=;
 b=WIxCIDeDC5yMs7w3DIMEa0yaKllI103pXS9xLO1Cd6twt5FjkF/9+JQVi68dPLf9zQLYlCPXsSCZkT3VnSKEpofysYs8wHtaCxpUTG8h7XstCLPoGRyyYZVJFdOSSkvE/pTQkz4+ORhoFKA8ps4jeccUegm8dxs+CLZlt7WWXZMpacfmZ67Zh45O3/LhAMAlQoI7jZGW8d8AJqY+RrCMtD7pC6OPu81F2hun/r9eD3RW3+VVtSyYks57/HmQeHV2ttnRDCp9tdV+E0a+Liy4WfUZdL+7vf8qDVnCt7G7uf/OJLnyQGTZtNci6DWKqunXx5y9U6SI5jMLW2PaRMZZfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JuJeZoRupbJ8PI+SNj3VmzUCCEFhLDT924JDikRMsGQ=;
 b=HaoVt8JR3COLTZDjJsKkWDvE+pPAjzZPyh1FcWM4SsEHxot3imSjeRNhFEetRzpuaEls5Sc8UlqYLG956+mI1OsgZwqPlm7TbqTmgPai/LQNUmOKeaLAp62u2Pj+znANGtfQDsitmL6PCwQGsAjhoi3VMNmtTAdhxZjzSY1V4whRNpjxm6+cYCMuOu8QCzmg9SbOAa4hvUIbbB5ZHsrqXDo0REFYN8wO7XzGIB0oz2YMfyhGJoLMwXFgmjPPlvOq/hg7c35xrOjdwu7RiYyzsrqNBE8rgF422xRXhagXlOOkeSVwgkXRErLi6Bn1LuqdEtaOPfX43Qrhczqx7yAPkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB8105.eurprd04.prod.outlook.com (2603:10a6:10:24a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 20 Oct
 2025 21:07:05 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 21:07:05 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 20 Oct 2025 17:06:38 -0400
Subject: [PATCH v2 4/9] ARM: dts: imx6qdl-skov-cpu fix typo interrupt
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-imx6_dts_clean_2-v2-4-3c12ead5094c@nxp.com>
References: <20251020-imx6_dts_clean_2-v2-0-3c12ead5094c@nxp.com>
In-Reply-To: <20251020-imx6_dts_clean_2-v2-0-3c12ead5094c@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Christoph Niedermaier <cniedermaier@dh-electronics.com>, 
 Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@dh-electronics.com, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760994408; l=1122;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=8aTZKe3qv3MLpXNuCM/OKkmFSdtUNhaBB/L4oe/NwIg=;
 b=Mof5BBwL7xVmjNuvG+ZbVog6y1L21tAlwuwX0h8EO55AygaybiCMh0o8SvedvnrbPox0amvqe
 Q6AaD9vmWOiB34ZtbAoaXGwxjD6RPmnVLD369JzFoImIZ9XhF0qgBx1
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR17CA0035.namprd17.prod.outlook.com
 (2603:10b6:510:323::16) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB8105:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b5f3560-c972-4d5d-29d1-08de101c9f6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWhnOEV2RGxtSDJuY3pLNzNXUkpuTlRkVUNmQStQWVFNUEVxUUhoNzNPQlVX?=
 =?utf-8?B?SlRhalJyQXZ3cmNWbHB3ZTN1ekNSa1dmMHVrUDRpdG5DRkR6WEdZTm1hVC9u?=
 =?utf-8?B?azR1MkRneThhaFVyVmN3cDVYNHNKYmcrZXA2MWpWbFZJT0pGVXliRW9RMnJP?=
 =?utf-8?B?Und2emlvR3hoYWJWTTNLeDVyWWQvWXQ2SVZUVThTU2wwMkR0RGFBczlBTEYz?=
 =?utf-8?B?SDJxanRRSWpsK0swQktuTnp5bCtoNi9kZU5MNDhNVmplbnhENlFXdmJpWjR4?=
 =?utf-8?B?amVBYjZST0w3dk9wVDFneTV1b1lod1pndFRDWmZWblRWT2RST2R1R0pla3dn?=
 =?utf-8?B?UHhLZmFLby9kczVLSWd4N0d5OFlmUkVoNUpiNFVZMG5GUmR1aUQ3OGtHQlow?=
 =?utf-8?B?Zzl2RUVoVE1wdG55WjFEeEhpaHV4U3RCQVdYWXZLbjdnTThiS0tjZ1BsSitn?=
 =?utf-8?B?dFc3UEpQZms0dFUyNzloRWYxb202RTNQcU84MnByaWNwMEEzVy9tT3JreW5n?=
 =?utf-8?B?aFRBV3RKb2RLUTcySFFuV3dScCtqNkEzeVdXRkhJRi9BcFVLWGFTaDFWV0F3?=
 =?utf-8?B?Y1B4WGR6L2syNEUwODNRWlNpRjZvblVOSlowMWs0eTI4V1RlZmRJTS9wd2lE?=
 =?utf-8?B?ckptMXNDUU1EZmtaVUw3TmIvbFF2T3MreWdEd2NLemVoc3U0dm53WXEwenRR?=
 =?utf-8?B?Sytna2g1MmtYTUorVWV3S0swTlpmTHV0MTJKTk8zN1l4N0FRR3VVSzV4ZUdi?=
 =?utf-8?B?TXpFeFUzWDZjYVg4RHVQSjNlcWpldGhtS1J0S1djN1FyOURsdDRhS2pBSUg2?=
 =?utf-8?B?VjZTSVlCbTcxTFZFWERoSUNMMDVmT1JvdkhQRlBTNTQxd1FsMER3WmloYnpl?=
 =?utf-8?B?c04wTm5nMUwvNWZtc0pFVTI2SU53aExUeExlSlIxMjNQU1oxZDFQaGxFNEVy?=
 =?utf-8?B?bVVHR2xEbUdBWUNGL3hzTTkxclBoMW5RaGFxWEhYVk1sb1dPd2VOZnVCcUJB?=
 =?utf-8?B?WDV1U3YrSlNKSkgvUnEzYU9mRGw0T2Q1OTZCZk5ha0huWmNuY25BcVcxN2Rp?=
 =?utf-8?B?cHluUEZqS3ozT1ljcGhsb3pqTGplOVBFVHNYQU1za3BidmlGZzNTTktaMjFa?=
 =?utf-8?B?cGxlZ243OWVwMmpBemdxdXpoV3hsTWJuVEhGdGxiMzhqVktTUXlxcDFvcUFD?=
 =?utf-8?B?eWZDVmlSSDRuekh3dWVjcjV5WUVtSXdvNVU3UHBabnBvbHBjUHJtU3RkUGxH?=
 =?utf-8?B?NnhQWEROL2NXVG5ML2IvM1luWEo4SVBIazNybG9PNGNSVkppT1JNUWtPYUFW?=
 =?utf-8?B?MlNtTjhhRGs2WEdXdzhLb0pxSFYreFNPL2Q3bVVmOEVaN0s0TWtEZWJ6a3o3?=
 =?utf-8?B?OFlHaFFpMUlPWG4rZmFVTlVsTkczVHpoWGdHQ1BqNEoySGt3YS9BaE5xaDRQ?=
 =?utf-8?B?Y0E5elhNcDl4TlMxSVNRWmJRZWFmOVpyR2RRbHRwL1V5a1ZmNEFkSlNNbnUr?=
 =?utf-8?B?Zkg1Mkx3b0FJWmZXeTdFV3B6Qy9LREFveHA3amkxMGNLc24wUE9BRFdVUjlQ?=
 =?utf-8?B?QStDKzMybWdEbXlPNDl0UzlMb0lpei9SZWlMYUd3T2lRSnhSM25VaGl3c25l?=
 =?utf-8?B?OGhwZDZ3Z2NqRVV1Q0xVZFlNNGVLSkl6R3JBNGF4STMzSzN1MnJhaHA0b0tz?=
 =?utf-8?B?amtwZjIrcWN3L3FaV0lsVGJRVXVGaHRSN3ZMODh3S285Nk9MVEFUOWhNcFBR?=
 =?utf-8?B?L3U0ejRFYSt4M3dxSENHcTNDSVNrWDFxb01zU1VTTnZqc2MwM2FON081Yks3?=
 =?utf-8?B?dHRRNjNQMm1Tdm5SZXNjRERkMnRHT085OTBpYVZvMGd3cmJuTUpaaXlzY0dR?=
 =?utf-8?B?cW9xbXllQndxRkdSNG1EclN6K0ZCTGpoS2NBMlR5L01DNFNiZllUdlZoS1ZW?=
 =?utf-8?B?Y0p1c0V4NXFhSytHVXc1OFY1TWtIWlNUdXFaL1pCRkdPWklNRTZUVjhwMFRm?=
 =?utf-8?B?M3pRK2pHOVM2Nms5bENEaFMybk5SWHl0U3c0STVCVmhwYlZjSGVSR25oWW1N?=
 =?utf-8?Q?EG/NO/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkttRkJsTUxSeXRrTVNkdzhaVmZWRnlDSlgyVC9zeThpYVVtcTlDYmJ4cTdT?=
 =?utf-8?B?OXQvaDJlaWkwOFRHVzIybmpiMXpsZW1JczZqcFhGY2hxVjJXeFZqTml3YTZM?=
 =?utf-8?B?dnFndDlZZS91L3cyTEtFaWpmSmtUMDMwNGxIQ0RHczI3SzRtSmM3M0RVNXdm?=
 =?utf-8?B?MCtKcXU5OVp1by9HVlplUFFqS2VDREx4MHZ3dlhjbTE5RVcwYUNvRTVBN3hs?=
 =?utf-8?B?bDBjUENMMGYzUzVocmNyQW03ZWtQYWQ1Z0tuOGRBTldLTkJPS2FIRUVTYXJI?=
 =?utf-8?B?Mzl3WmJPaG1UMjk2QWdpL2ZWOFBoR3VTZTlwbzlmMUJMc2pDTUtIeSsxei9m?=
 =?utf-8?B?czcwcVVWZlVNT2xXckR4QmY2UXZGUGVUQ1owYjBEdkphYzRIUHl5RW1NNGpJ?=
 =?utf-8?B?VU9QWEFQa1BoME56SVpwMVc5NlhwTTZaOU5yRFRPN0NOc2x2Sk9hV3ZER2hu?=
 =?utf-8?B?dkpQL3liZWd5UWNOYVBCWW1VdHZWZVRNZ0pURUVaTEVJRjh4c01sZjhDTXZj?=
 =?utf-8?B?bHlnTmxyWi9McTl5R0dFWDJiRGRjZ3JqRTFEOXppUGgxaUVsMUhxMS8wblpL?=
 =?utf-8?B?alptdzN1aWsyLzIraHBJbmRqdVlRZXA1OFdpKzFDMkpuUXpRa2VOUVI3cStV?=
 =?utf-8?B?bkR0V3VWRGMwbjE3dm9Ed2M0UkRKdlZyd01FRnhQeHNzTFdTM0dya2ZIVXZI?=
 =?utf-8?B?K0ZiWjdiZmxxZHN0WFI4WHBBYlJMdkJPNythUFpkTzZBZWp1KzVCTjVUR1pK?=
 =?utf-8?B?RExNeVkxWTIyM2Y5T1d6Sjl6b3JKL25VMldBMzNtRUE2eDNhZVJhckIxVyt6?=
 =?utf-8?B?N0ZXSzZGOU1aS0ZpcXNtdHY0TVdFZGVFRDgxWGNNV21rMnYrZG4xNFNTYUxl?=
 =?utf-8?B?REZPU1dZdkFoZEpESkFqUi9kMXo5bHBUZEphRHFZNE1NeVVadXBlWFoyU3lH?=
 =?utf-8?B?SlYrWFNJbGpJaEhmU2VNUFNmaEI4dFB2WndQZGU2Y1pKSUFSV2sycXZEU3hI?=
 =?utf-8?B?aElObUc2T29tZzA0UjJuSFBvbVNjRXJBcmoyd0swQ1NVNUpkY2xhMUJvZmRm?=
 =?utf-8?B?OFZubmNNb2NMbHFaOE9KRnJxajc3T1NxVE5BVkI3T2dEbEl1QXN0d3RiSTBS?=
 =?utf-8?B?YkEySEY4K0EwT0VydlNiek8vUEJPelpyaFEzaGxZU3lLUkg4Q1B1K0QzeVMx?=
 =?utf-8?B?NDlORkxnS2E0Z09heTNZQmkweFJzVFBoUFUrbmlscU5sMGN1S1M2cUhiVXAw?=
 =?utf-8?B?OEdHZ0FOTnR0Q1NhSU1MUjJtQUQvV21QK0w3NkZ6ZkNieER2QXFsT3g4Q0lI?=
 =?utf-8?B?ejRsaHdNRi9IRUxvN0JWdGFSbE9FMXRZdXVUNnc5VU8zMUtaSzJYbExydXZJ?=
 =?utf-8?B?dTAxeEJPc2Mvd1VMbXhxNytmK3hNRVpVMTNuWHZMZEVLTmIzS1grSnBsdHdx?=
 =?utf-8?B?bVJDTXV5bnAyMEgwMTZybTdsb3d3QUE3YmlHaFdmTUNqZGZkSW11RzZFZ1lN?=
 =?utf-8?B?SW1GQjJSRXhHN1lyaTFZQlNWNkRCTk1td2RPeVJRV1VBWEIzSUE3OUVHc25T?=
 =?utf-8?B?eXpjdCtIOVhiSnBLblFLU29MVjNNUHZtK3VsdUJMMmg5OUtQN05kd3o3Skx3?=
 =?utf-8?B?VGxhQXRONnQwUjh6a0swSngrV2pUVm5tODB6NVhtUzV5aVFacmdYdktPdzJ4?=
 =?utf-8?B?cHM1QmFiR1RvWGJWSTVCWEc3bmJaNGNFbVpycDBnaTdzUzdkSnVGK1JJVTVM?=
 =?utf-8?B?V29xNXFPRGsxNHFEdVJHL3dJK2pwaXIybzRtVXFjRHhNMURWMFlHS1lhN2xu?=
 =?utf-8?B?RTExSWo1VDJGa2g4SXRqN005RjcvYVRxUVJ2cFFmaVI3NWFVaUovQlB4ckVW?=
 =?utf-8?B?NXlPS1dDdHBacmhBYXZQTDE1a2toWUZobHY0WFg2UjB5YkYzcGhmRVFPTG8z?=
 =?utf-8?B?dHBvUGc1VmZiQTcvRG92Mk96YmYxd1JQWFo1Z0ppbzJ0Y0lZNTZHQXN6Zmxs?=
 =?utf-8?B?Z2FRaTFwODNIVDdKSU4vZENHNDBMK3FRQmhFL3Q2Zk9VZTN1R3BET2NLTFY0?=
 =?utf-8?B?Z0dUZHg3U0pZMVFORnhMUkduelpxV0VJQ3dqd1VCbXZmTzRkWjRsMEcvc0Ex?=
 =?utf-8?Q?HCK/gbrZ2MtCqp81J3JbHYONG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b5f3560-c972-4d5d-29d1-08de101c9f6f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 21:07:05.5089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4N5GLh+ppoVXzPvMSbagPaTXLNUQarhf/VtpozqEqkxWKIHF7X0rg0S3Oo1D7vVR9dvdv+ztMAY9R9t8TNFOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_211240_869777_4F7E6FE4 
X-CRM114-Status: GOOD (  11.81  )
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

Fix typo interrupt, which should be 'interrupts'. Fix below CHECK_DTBS
warnings.

arch/arm/boot/dts/nxp/imx/imx6dl-skov-revc-lt2.dtb: switch@0 (microchip,ksz8873): Unevaluated properties are not allowed ('interrupt', 'pinctrl-names' were unexpected)
        from schema $id: http://devicetree.org/schemas/net/dsa/microchip,ksz.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
index 6ab71a729fd85d0b0b6dbfbd810692b1a0e05ec6..c93dbc595ef6eceda5fdf7b90dac57bfed59e489 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
@@ -69,7 +69,7 @@ switch: switch@0 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_switch>;
 			interrupt-parent = <&gpio3>;
-			interrupt = <30 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <30 IRQ_TYPE_LEVEL_HIGH>;
 			reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
 			reg = <0>;
 

-- 
2.34.1


