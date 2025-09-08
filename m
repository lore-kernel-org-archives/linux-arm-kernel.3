Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440AFCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 20:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t96BlZXRwxmhbfP7/FJ3IgeBmvrGrupwpB3upGQ4EX8=; b=s2gsRIHkVax2gN1TnIgaopxPCN
	5FjVT+DvUTLC4GxYH/BeynewZIiE2nB4JZra/2h/mHWQLICFJ8A89IstZTtakQjFvNAj2P7DKYz0c
	c8dtuq9hBPwjomvZTvtQoe3EnxQQYuntm1irBc3qEV0LqKCojE0tsZpP4jjkIRBhj6/sf600Hwaey
	WXYyusbBnzEr4Q2Gcp+z4tueBZt7HDAOejZywmG+Q6xrBXJXHrnz46VR21N1YGzzN3z3cdy0C0arE
	OyHxQd0dskaXoQC1psUt188SxsYCQk0PmGoiQjP4aKwhiGm3yzNxqPKXB1R5rzkd2TsuADESnnN7j
	qT7Tzw6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uviAf-000000025kO-3uDS;
	Mon, 08 Sep 2025 20:09:01 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvenQ-00000000lgA-49lT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 16:32:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGGTFouRikhEEEqffJ4WG39aBeuIRNs3LEmRoqeriHIwAxqQK1oqytaox/vY1rNh6uWhapd30nd2CGUfueIpJV4HYbkb2m4wtOaJ6omYsMHnH8AScXO3xySXmoqQffiNAOg7FR/SfcfMZGUIjJWLqzq7Os0ahDjZI6wZQTYIUhIPLOFwCEuQMrVhfi7VoemdRrGPAce1smj8PfflyDkFPSPpiI55WLcfOp5loLqvnVj9Exo9lnxN4zB7qlxwZQzX3M/31ZD1tZdVVgcLDH9uqihrok7CwmbuLO31O2rkgOwxUtz6e7dTD2o2vlrE9F5IYTUOj3P/aAyFdYPs7XemEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t96BlZXRwxmhbfP7/FJ3IgeBmvrGrupwpB3upGQ4EX8=;
 b=c05CDiuGlZsWjnVPg1xCZg2qBCLNCwEm/zoS7r8Z1NyrPRDNN5xdzQl/+D3cgRBMy0tzKpd5sajOOJGriDixPCj+JD1bzdnNFZHKTG83G7GvTJ4By3PIWJOTo7DMwQ5SQVUufzA4XNLdL8akW1gSNVZgGafPzHYSNgpRBglcylMhYUB9ve6D5umIH67sbn5RshEPYWYR+iDzMPBjSSlIOZvJbtS/xGMQlWNzvmHoFnVDs9i9gEQe2qka/zqToHfQ+4g+k2hiQp4N0VixwAa9E01hM4oETMRfve1BCSqXQ7i0AY22whJcibkAn0pyPo3nSgx6RqQ7j4HxzICeUDsFmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t96BlZXRwxmhbfP7/FJ3IgeBmvrGrupwpB3upGQ4EX8=;
 b=DwLp0XkxElmek5ai1waLIXUcJGi72riQhQYvTt1r0BFXOWhkWU+6aZDz/ezVyyy9GHhBSy2oQzrtNgB4Kc57E8S8p1TC08N4YIZKjBg6fcYn5IIGf9vhpvEPKHYyw134bCguxzgQM6j0nj6Me6FLJsyb+AbuWndXtdhK7uo8Da0xDG6YKGTRh689OX/AwmryVzBOHtRHDDT5nRcRYkGomHqqmXRA1hOnZuz4/KFQuo0wl0TjfHCtWpd0mXmVddBdgcJp3ofNjkglKcjjQ3nDHQjIvEIGzAAbtYeNWLlXCp6dVvPWXV1qoYl89CQbn4RUDtSz3o0puGlJ8WcpbYMFbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA2PR04MB10422.eurprd04.prod.outlook.com (2603:10a6:102:417::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Mon, 8 Sep
 2025 16:32:41 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Mon, 8 Sep 2025
 16:32:41 +0000
Date: Mon, 8 Sep 2025 12:32:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
	bhelgaas@google.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] PCI: imx6: Add a method to handle CLKREQ#
 override active low
Message-ID: <aL8FId/JQOfyv4Gd@lizhi-Precision-Tower-5810>
References: <20250820081048.2279057-1-hongxing.zhu@nxp.com>
 <20250820081048.2279057-3-hongxing.zhu@nxp.com>
 <ryvt2k2blew5wisy7edkjqdcmulrwey7lkeriasrmvaigpe3ku@vdgkod2bf7ma>
 <aL71k+CeZEwTnn86@lizhi-Precision-Tower-5810>
 <ruhcvw3oqalrspkbl4ay5vebomatww6wbirwzowxyqxq7sdjou@yba5ri45j24w>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ruhcvw3oqalrspkbl4ay5vebomatww6wbirwzowxyqxq7sdjou@yba5ri45j24w>
X-ClientProxiedBy: BYAPR08CA0055.namprd08.prod.outlook.com
 (2603:10b6:a03:117::32) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA2PR04MB10422:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c066c1d-8ba4-41a0-d97d-08ddeef554c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzU3a0dLbG5TU05xSXg1c2JZbTFsL1NOSVh3ZnhQSE9FaG1Tc3lFZFdFNk04?=
 =?utf-8?B?RG4zZ1VuMUhsdEk4NHlOU2FoeDJ1MHdGbnJDVVo4RGtPZ1YyZVgrVjJXeTNl?=
 =?utf-8?B?WDl1SC9LVFFIdUxYd2EyY0plRXNUZnVXa29tT1N0VTJaV2N3UFFmVVR1am9y?=
 =?utf-8?B?TVUvS3RzQUt2RjAxei9TTEViRGZ2aHlxcUQ0SlE3K2xPMnVuT1hBSmdXK2Z4?=
 =?utf-8?B?Z1RCNERqZVd5elRmVlJJaktkK1lTQjhLTmtQMXROcDVJdlFud21sZHVHdmh5?=
 =?utf-8?B?UEFSL0xwUGdaaUZod3NxUjdib2FrdkdNU1VjUHNsREJPSEFocGwzdkpqNklr?=
 =?utf-8?B?KzhWMlZHV1lIcHFuU2E3d2lOdVlqNkYra3VZa0RRMEZnUnpyR00zQXhhZllY?=
 =?utf-8?B?MzFvSlEyUndpK3NDOWRjMjV4MWYvSFBlWlR2UnkvZXlXSTI5YXhVdU1XTUwy?=
 =?utf-8?B?ZHNSTmFLdWxBRXNxeGdsTXN2SExBUTM3WHZhRkdWeVQ4Q0QycnZoTmhvK2ZQ?=
 =?utf-8?B?OFR3OC9KVlhjYXBqYnZaRkR5U3FIbkFoRXFrMmJROTR4blFDYk1xRXEyWWFQ?=
 =?utf-8?B?TCtIVjJqL1pkcDVwNU0wS1ZhcmllWitlaU51Q2FvblZ3c2RxS2FCYmIrQmhr?=
 =?utf-8?B?WFgydTJZaTBHS0RodDhZOGFDaU1LUGJKL2FmNlYvTm9kR2xhWVNiQk0vbGV2?=
 =?utf-8?B?RVNseEZzc3dWS1BiTDNFSnJTbTNnTVkzejZPUGhmV29PY1Joc0dtWklqQi9M?=
 =?utf-8?B?ditRVmZUQjY0dXp2c3N3ZEs3aTNIcGNrWDJlVEM5M255bWZBUS84bVc0R0FH?=
 =?utf-8?B?OVRZKytack9MNDAvbVhqYkpJM1JLb1ZVdWRTNVJ3dnozc0Z3WWg2cWpsQmt5?=
 =?utf-8?B?TVd0SW5LZXMwQXVRVVplbUlITUgyclJ0RW1UbXNvNUR4MHJDZkIrV1lPSU5N?=
 =?utf-8?B?SnZYNEx3L25SNnowSnd2Vi9UWUdnL2tDREM2amE2WnVSaVFFcFM0VzlyVmJY?=
 =?utf-8?B?dkRNZVpvVFhGRDUxUGV5VmJuakUwRFR6VCthV0djenlEVE9jR291ZjVaQ3dZ?=
 =?utf-8?B?K0JtTTFOYjFtakp1NjhDenFxQWowVVg4ZjJpWEh2S2tyMmltL0xvK3U4MG5t?=
 =?utf-8?B?RkpyckVSYnJZODhBWkh5bzVFMENUanJodUtoc0dwNGp5QzlvSkUrNW1JZEpw?=
 =?utf-8?B?YlM3N0p6V2JMWHowVnFTckFwVjlMU0ZyV1loYWVod08xSkdmZS9NRi9QMkFK?=
 =?utf-8?B?MDB6clJmWFFTRlliVGF2M3JDY244eFpaaDBHVDlCaUp3YTlkdjJiZEQ5SWdF?=
 =?utf-8?B?T1J5NHB2cmlvTDJEbXMyV1FvNzVFaU84MjVCUUF0QVpIcERqS2thMHFPWVdJ?=
 =?utf-8?B?aVhRT2RQalNuS3IrWm0ydmhMVWM4UEIzdXNrcmYrM0EwR2NSNU5qeHVscE0x?=
 =?utf-8?B?N1d1TmdsazJNcmxXUGc1QllpWG5penBLMUxJUk5RUlFwL05xUXJOc1ZBdXlN?=
 =?utf-8?B?SUNvVEJTcXVlMCtZRVR3U3ZPREk0QzQ2djJScTZlNklGZzI0VUEvTXVSQmw0?=
 =?utf-8?B?b29LWjRqWUVCWGVrUHREOXRtd0E4b3VuSWtZdDlmTWtwOHljN1grWXc5NFlt?=
 =?utf-8?B?TCtQL25ra01pMitlOTkvUU84dmN1T0F0YzRMQWkzSEcxSXJVbWxuYTlZdHJ3?=
 =?utf-8?B?QjYvK29BTHhCSGNFQjk2TzcveGFzNWJ2cHIzY1p5SEd0Z2V4TFVWZ25HM0x4?=
 =?utf-8?B?eDZHTVkxdFkvak1YU1NhUUI0cFBVb3A5QWhDaG1xdVFvMHhhSVNheEpEWjJt?=
 =?utf-8?B?RTBCWnVpNmpmTWFoeXQ1dktsa2M2TG16LzVUdlZCYUVKUkM5ajJkd0hzejNS?=
 =?utf-8?B?a0tnb1pXN1hsRGNLMTNNRElJS1pqVDJod20xbE5UVjNaMldTd252TmZhWVVt?=
 =?utf-8?B?Uml0YkZDelJLQjhaSlloTnRVaEhSZUxrVWRtaVE2cTdiTTQwdENKTkhDU0Vm?=
 =?utf-8?B?Tlp1MEJTVkNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qys0dG1PUjU3SHJCWjllM1pDZU9DcGFRVE50ZnlJRE1nTHkwWDlua25nM29z?=
 =?utf-8?B?Sk5lVURrc0QrTVBIOFlZdFdlSm1ZWC94K2RFUWxSMW9VNUtxcjU5cEFMNzhM?=
 =?utf-8?B?MkhSR2V2ckJBN0pkazA1SVhmYW5FQjVPa1JoKytGclUwVjFzZDZJblZmcUY2?=
 =?utf-8?B?endwamNtcU5VU1ltYnlwbmtHalo1NkpENy90SFk1U1VaMTh6M2ZhUStqT1RC?=
 =?utf-8?B?SEEzRmlHcFNLWXhnYkx3Q3RzbTFKMXcraWJFNnhQcnVENG1CVlJocXVHamJE?=
 =?utf-8?B?TE51MlhiMHU4TXppbWNySlRUSFQ0dkRoSDRWa3poUHRjZElCdmI5Ti8rSlNT?=
 =?utf-8?B?OENJdzZmbWZGM3BPTkdvdksybmNiZjRGV3JaVm9sUFFNWU5CMUtOZUxZNGJF?=
 =?utf-8?B?cXVrVWtLeTZyRkMwNkJ1SUNsQlF0ZmI2L1ZaQXNBUVY1dHRScUNzUGkrYnRa?=
 =?utf-8?B?ZkdGYUIrcmFGdjVQckc2dDArV2xaWExjWEdSUzJodmVKT2pCMTN5akdqczRG?=
 =?utf-8?B?aVdRaVVBOVYzSFo5K3Z2eWpBR0xIaUs5S1NXS3Y1TWRJQmN5WnQwU3NWQSto?=
 =?utf-8?B?VkFabG5yWnJQNXRjOEtKR2N0SEw1QW1vckpDVVByZ041UWxiYVVEeDArcmZv?=
 =?utf-8?B?NVl0dW00cUVJQTM0eGtVczU4cWMwTms3M1RnRVc5TlgwWTMrdFloRStRYWp0?=
 =?utf-8?B?Zk1Oek1GclhyY3ltODlLNGhXN2MvSUhvQW9PNVpUL0J3dkE2aC81VUQzWGNQ?=
 =?utf-8?B?VkpoRHV3amptTjVteVR0VEtpUGk4Mjd4SEFtL0hZQW9qU1hGWmFmaVZ1Wnpn?=
 =?utf-8?B?N3Y2aDU4N09GUVZ4Qk12QTIwek16bGR2dzR0MGpiaVgyMkE1MEYvWkc1L1c2?=
 =?utf-8?B?WjJ0WUpHUDlGcnJmMzA4Z1BNZWkzV1RwY1hPc2NhSlp0NktMbEpuTmZhRlVi?=
 =?utf-8?B?eCthTFg1TnNQYnFEblBZSVUwSHdKUlBPSmFtWDFpZXVNR0N2QnJyU2FHeklr?=
 =?utf-8?B?YkRqbVpGYWN1NWMza3R4Q3JjbFdqVDFML0Q0Y1FWQi9qWFpFUnJIVlVoNTda?=
 =?utf-8?B?WXR5M0k2TmFQQml1L1p5YUFURFhWeWZFclUvQ0lrRlhpeW5jRzE4TTZLaFFq?=
 =?utf-8?B?RkllZzd6OU9qb3dHOGhLWGs1dW1FTEFYQmR6NHc3NjN5Q1JvdE9IUHlFTk5q?=
 =?utf-8?B?eGFJd2o0bXFtSmhmRmh6QnFkeElUYU5sazV4RC9iSjU4RnNqS1hiT3dKdXpL?=
 =?utf-8?B?ZzZPVWRRSFRBdUdIUEVxcXVRQ1RKSEhKamV5K0FjNHMxYVVPZGozNDNxNkpn?=
 =?utf-8?B?VlEvVEd5ZkkwMWxpRWpMb1JRMDhMUC85UXE5Z0E5SVI5S2xlZWlCVm9peTBD?=
 =?utf-8?B?TngvVGhGeHRzTmhuMU9kcDQwbERmTWM4SGxrTER5UUk3TmhISC9nN1MrZjJ6?=
 =?utf-8?B?K3I3ZDZBM2N3VmRwT2I1MDNvOXpSYVVWOWxFa0tya3RNQlpVWUZrWFhVZklS?=
 =?utf-8?B?b2xrSE9SVjVuUnN2USt0UkFhNEl4d1FmT2VqcEVGTjVkN0cyR3VFNGlkQzVl?=
 =?utf-8?B?YkVMZ1YwTEdpWXRweHlCSFk3QTkrS2lqeWNsWTA0MWpwdVQzN1JDM05hQmdY?=
 =?utf-8?B?YlZueFdWai9uNHBJeVJPNTdzZmNYRG9hSGNLd1NjYUs1REhWOE9ZQklDdmk4?=
 =?utf-8?B?eURQNW1UdjhmOG9OekFrM0xuK2NVN3JBaFIxOG1IazBQbWpMNExha0JQNXl2?=
 =?utf-8?B?V25xdGdIOHNnVjJtZ1lzbDRyUnhVelBicUMrYjFBQTl3eTVUNjJ1VkcrZVdh?=
 =?utf-8?B?Zm9aWFY3b29RNVlTbElidkJhV1Joa3BqekVVODhoUkdGSitrMDF5U0o1cFJj?=
 =?utf-8?B?SDZTQzROeHEwMXRNb0NIVVI1aFgxRkVWaFBld1M0YUVpTHZhdTJLbjVKR0ZH?=
 =?utf-8?B?OENLMmVoaCtPMjBXTlVSM0Nxcjl2UDNpUVJYMzdTOUFvS0VRdlUrVkp5cFM3?=
 =?utf-8?B?NU85SmFSSkZEbGFWcTczMEF5NTZTRnl6SlgzbzFiMVNsa2ExNDBtd3lralE4?=
 =?utf-8?B?dTV0STkvZEM1NTBIeFpZMTA3NDNFTFJMMkFPQkY2cHZwbXlleTVvZU12WENr?=
 =?utf-8?Q?jkkc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c066c1d-8ba4-41a0-d97d-08ddeef554c8
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 16:32:41.5024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvLScz1KXjNmJyrwsQasGhrUtw3JaKGYOfYipqE2g00z99lRIjneA5y5bLTgCrM2eOPcSQ410Xv+B+C3o1D9sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_093249_179672_C8152F23 
X-CRM114-Status: GOOD (  43.47  )
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

On Mon, Sep 08, 2025 at 09:19:40PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Sep 08, 2025 at 11:26:11AM GMT, Frank Li wrote:
> > On Mon, Sep 08, 2025 at 11:36:02AM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Aug 20, 2025 at 04:10:48PM GMT, Richard Zhu wrote:
> > > > The CLKREQ# is an open drain, active low signal that is driven low by
> > > > the card to request reference clock.
> > > >
> > > > Since the reference clock may be required by i.MX PCIe host too.
> > >
> > > Add some info on why the refclk is needed by the host.
> > >
> > > > To make
> > > > sure this clock is available even when the CLKREQ# isn't driven low by
> > > > the card(e.x no card connected), force CLKREQ# override active low for
> > > > i.MX PCIe host during initialization.
> > > >
> > >
> > > CLKREQ# override is not a spec defined feature. So you need to explain what it
> > > does first.
> > >
> > > > The CLKREQ# override can be cleared safely when supports-clkreq is
> > > > present and PCIe link is up later. Because the CLKREQ# would be driven
> > > > low by the card in this case.
> > > >
> > >
> > > Why do you need to depend on 'supports-clkreq' property? Don't you already know
> > > if your platform supports CLKREQ# or not? None of the upstream DTS has the
> > > 'supports-clkreq' property set and the NXP binding also doesn't enable this
> > > property.
> >
> > It is history reason. Supposed all the boards which supports L1SS need set
> > 'supports-clkreq' in dts. L1SS require board design use open drain connect
> > RC's clk-req and EP's clk-req together, which come from one ECN of PCI
> > spec.
> >
> > But most M.2 slot now, which support L1SS, so most platform default enable
> > L1SS or default 'supports-clkreq' on.
> >
> > Ideally, 'supports-clkreq' should use revert logic like 'clk-req-broken'.
> > but 'supports-clkreq' already come into stardard PCIe binding now.
> >
> > One of i.MX95 boards use standard PCIe slot, PIN 12
> > 12	CLKREQ#	Ground	Clock Request Signal[26]
> > which is reserved at old PCIe standard, so some old PCIe card float this
> > pin.
> >
>
> Ok. IIUC, i.MX platforms doesn't always support CLKREQ#, as the pin might not be
> wired on some connectors. So if the driver turns off the override, CLKREQ# will
> be driven high, but the endpoint wouldn't get a chance to drive it low and it

CLKREQ# will be float and pull up by pull up resistor. The old endpoint
(PCIe standard slot) float this pin also because it is reversed at old
PCIe standard. So ref clock is off at that case.

> won't receive the refclk.
>
> Is my understanding correct?

Basic is correct with some small problem.

It is caused by two common PCIe problem.
- stadarnd PCIe slot define change PIN12 from reserved to CLKREQ#, which is
ECN, before ECN, all EP device float this pin. after ECN, EP device pull
this pin down.
- use logic [2] to design boards, which just impact L1SS, the basic function
should work.

Frank
>
> I'm wondering in those cases, why can't you keep the CLKREQ# pin to be in
> active low state by defining the initial pinctrl state in DT? Can't you change
> the pinctrl state of CLKREQ#?
>
> > So I think most dts in kernel tree should add 'supports-clkreq' property
> > if they use M.2 and connect CLK_REQ# as below [1]
> > ============================================
> >               VCC
> >               ---
> >                |
> >                R (10K)
> >                |
> > CLK_REQ# (RC)------ CLK_REQ#(EP)
> >
> > NOT add supports-clkreq if connect as below [2]
> > ==========================================
> >
> > CLK_REQ# (RC)  ---> |---------|
> >                     | OR GATE | ---> control ref clock
> > CLK_REQ#(EP)   ---> |-------- |
> >
> >
> > >
> > > So I'm wondering how you are suddenly using this property. The property implies
> > > that when not set to true, CLKREQ# is not supported by the platform. So when the
> > > driver starts using this property, all the old DTS based platforms are not going
> > > to release CLKREQ# from driving low, so L1SS will not be entered for them. Do
> > > you really want it to happen?
> >
> > Actually, some old board use [2]. we will add supports-clkreq if board
> > design use [1], so correct reflect board design.
> >
>
> Ok, thanks for clarifying.
>
> - Mani
>
> --
> மணிவண்ணன் சதாசிவம்

