Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50949C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 20:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7csdtlA5Uv45weWEepLMIOkewxmg+hS1GS4N2YPpQfg=; b=AFBpTGzGM1WM+GRCLN5oO4gSO6
	NdvImwoz6TduRsGEvpUIf/0o3lgFImQSwGNeR7FRpAJ0PAmw6OC670u+FpKvyv+d9Cah0QiCK3qqm
	2RNxHJV1R9M2jLGl0n0VGuK3Eg5g30x13N6bBOkrnXk8ByJh4X/Q1T7YW5fb27+hdFHy1KdA4Od5I
	YaaZtj+T4GqS3p1zNQHfQG4iZv2sQL9979hlrRfeTnyx7zWsVoiBCFfCd0zC0IIkgqHD7cOhb3dqO
	vqhvq8T6o7St0PAKKqiZhFmukrwyOHpmRZUPKRAF3ziCNGG3PZk1X0EaUnKfKbp1UGx/CaRW6h5AO
	NcUICZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYa8-00000000KIk-46EX;
	Wed, 08 Jul 2026 20:09:20 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYa6-00000000KGZ-1AVg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 20:09:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPcpurG6m3xSmkV0yPU2ebeLqQNtoR7rWn8eJITeI9TsHFBMgJqFi0AFLO829UIVBcPL8eIHfIRggk1LLt9ZFDQXQbJCvEj5IKCZMGHOwSysPO1CNZPbAN8u9rOMK3gv2H5aObChJlH4JdmNsIqZ+SMOBdNZRbOLbiws5q04OEwBkvbGRiPBH1uLDJnXHtQff5y/WTjjb6KbP/Dbw0yK+n1409HtpGbB9aExDGIv3lOLBu0AFP5o+28IkRX2X+3Y4ixJcN8jQfgTjE+1KrhshoubGCXeOI4IvjeU8eUjczBDeR6o6RVZyET67b9DNnSjs3+6FcoxHamQX8HPwTJn0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7csdtlA5Uv45weWEepLMIOkewxmg+hS1GS4N2YPpQfg=;
 b=u8BL7pqVkxMmH/4RbFQC0bVqSsFiQ4FgvmEBsEIxaJYp4uDtxSRMpWPjibkR5R6eP8pJvOLJ0TTAM9sqStGyPbRDSVigs0JIpxYHIZkA5GgBUZTPNkDfFvzWp+wAAtFeWWLQolB+toreIkOD4hDrZLNYnzAkH7scirKZR0RMBmDmNsD8F0MvbCymTkOuRQaXFW3C0wp5HGuSEKQ+emqPa1vFJLtuD3kUbuuP4/tmQO5H7GSBxR4aS11oT2vCuatf4nJ6Txd3ojqZ6wfyv1HGRAQT3tHRgV/U5Ar+KmXo3V/cvzKmXriIOYXC5MDSSl7y+dQ50RwZzWgiU/are3lyXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7csdtlA5Uv45weWEepLMIOkewxmg+hS1GS4N2YPpQfg=;
 b=F0JlNBxKumMFnz0a4KwMT3LDKcvJHqKmLyyszmiINaXTwVS9MSW0NFJMnvdEbJecE3TnupqjkGE1uS2JibzIEM89baPP6H70ct5u9IedDr4Sqb3ah5k69L//FLQN+zBBp83WatWadmD/H/1HSyrAxXCvRrkQFVeVZLQaUGRZk+VzA1tfuH40S95/RQHeYtBxtMDj7ymG/GitHTje21CAWfepf46farx7yhsncWFNMWst7NsIhuPBmFgnEctNYRyuRtWcXiJI5bNZGOLyrk6P4nXS+cY1nbIR4MhUytmT68/sZ3hlWoFUWhvEJAxHSBqF6O6so5utd82vAQjhWzoiAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7571.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 20:09:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:09:14 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 16:08:32 -0400
Subject: [PATCH 3/4] ARM: dts: imx6ul-isiot: remove undocument property
 clock-names of fsl,sgtl5000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-arm_dts_mini-v1-3-11b88825fd1c@nxp.com>
References: <20260708-arm_dts_mini-v1-0-11b88825fd1c@nxp.com>
In-Reply-To: <20260708-arm_dts_mini-v1-0-11b88825fd1c@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783541314; l=960;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=2S50fz1wNfOVidACw6brl1w0xz/8fAlphKCE1e06kuU=;
 b=Skhl+Pof4jQi0oMYg/oBQ0R0jrmYRW+prVQUnk8dUrxtP/zYOvSfSEtNDmeAujKcmD90+HwNC
 mrcbe7NaqQFCUH5vVPjgnL9w7I7RNzsw7e5a1i48yGTrBgNDiSbIZbb
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH1PEPF0001330D.namprd07.prod.outlook.com
 (2603:10b6:518:1::1c) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 4acd0738-727c-4048-408f-08dedd2cc82e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|23010399003|22082099003|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info: bxUfbJejCkPln6GrJKuwMWcWNuC24XQlsS4w8qxFbVhgfTtcu6dT0UxsCpw31hacr90cj/qUmYZh6W0/Ad12lkO2nA6XbDeDqx7F1AJ8ptgRyMeVvScEbeY8pHlCd76siOL8Lp51IxjKSVGK/sOaZNi+EKwPLRzFZQlM9w024KuVKoDdJOrrYuWXHMGRGiv3mMJUHjlW43hk5IhUog7mJhYIqgoDu8ai40tuMLKGgmVrjCJVJt7oJpD/mpwsuAoaeBSGQh5ndW5PKJ7+jrmjJ39lQya4R0hcE2tcdcrZX7FO1ASrSTiQaNPsHlsA/jikhK4WVU9YWHJ3Rvr6f6IG1BnRtNUgk1NTaIWEXsdagO/i/+LxEqpG8MS01V8NYmYgupq2f1hFiO3c6hCmIgb5XVxyMICFQN6Q5do6Mbhi+eMfc9IqjPUmUcXRum+cWyYwWA/jPYT1kPUsv5GtKbqXGD5a4aewSGmDdxP4uv7zQoHtyaZwoSsR2jPZe4YZaxhIBiBlj4xcKhvyhEsCN45kff2Xn+AYL2kbZXKkfY6Hn5KeV5xPW/gzxfIzevvw0yKQ2ES6Zk6XpyeVvecn9dcoNFsTfhAox00lTLWEpIWAvwxCtla4Qf7FdPXiiXl0c/hxl1gj+c0utulYAeA/7XqQlCAdxvUA/7Fbj4u0lBLDrzU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0pOcldqdFNGQk9SK0hIbzI3aHZURTF4czZYcS9kUUQ2ZDcyVXY3dFFSWGw5?=
 =?utf-8?B?ZW9qbHlsSHkvZ1hXbHZGZGhOY1JjQjhTdm1xY29nbjN4ZjNyZGxMc0FCM1RJ?=
 =?utf-8?B?eUNtU3BZR2Z4c2tlODhIVkVXaERwU2tDWENKU2pvcTNTQnhUMXBkWHhTZjNn?=
 =?utf-8?B?NGlsdmlmV0ZocHBYTVBYbjhya3BtREw5QVBIMEt2S0orQ1NKaVcwd2tZVThr?=
 =?utf-8?B?a3JZYlZkSmRDVStFRE1pdlc0eitkOWo3b2txMGNlUGpMTWFXMWxaK3ZSVVpm?=
 =?utf-8?B?OG9SeDQxZEhMRVArZEkxM01vYlV6cTVOV1lkVUsrOVBPOGlqRkVJUVlDdFJv?=
 =?utf-8?B?cUlhYzA5L2hjdXczOFZKei91dWNuY0NKMzFJMURZZ0tyR3h2ZXN6bWJlbHZv?=
 =?utf-8?B?bjRWVkNoVE5FZWx1WTU3ZVI1anExVk1Hb2JLNzZzNGFkektpdXlLVTBqMGpY?=
 =?utf-8?B?ODI3VUdpeVE1QVkwamRpWlZ5WDlMUnNVWU5WM1VaSzloaTJ6c1l3R210Z1dp?=
 =?utf-8?B?SkoxT0I1Qjc3VzR5RTBGNERQdHNEZEhGVlozOWJhRm84MWFTUWJKTE9ZdXZ4?=
 =?utf-8?B?cWhmN1EwZHQ0MFN5RGhoVWZkTjdFMndraWNGTHZseW5tVXdDYkxKMXBiQllB?=
 =?utf-8?B?SzN3a0lrb1AwdFNHc0xQcnA0amJSMUNzTFlnQWNZcWZEWWpuMVNjdVBpK0Uz?=
 =?utf-8?B?aHZjd1MwNXROTVk0RFlyWm1UbFhDQWtKNkZmU0dFeTNsMzA2anlEODNDaldh?=
 =?utf-8?B?RkhnMHN2L2dpNWIreXltaXAyK21HSjNrWWxFOHcwVldXQTRGa1o1TnZwMm9z?=
 =?utf-8?B?a0ZBajllRjI0Szh6eFM0aXVuSm90dmtwNmY2MlMrVlY5bGhza0VUQ1QreVg0?=
 =?utf-8?B?aEtuRHlIeDJXSzQ5aVRzSlM0cFdaN0ZaZHl6clh3aE9rMXVWRHk3Nm0wN0Jq?=
 =?utf-8?B?WUZCMCszaS9ESnYzNE1vcFJvWmQ1bkR6USsvK3ZBWHJPbzFCWHpOWC81VVFr?=
 =?utf-8?B?QldaZjJ1V1FOV1dabTd4c1VEUXpVR2dJYWJGaW5XTFZTNTJWVDZQanpvVGFv?=
 =?utf-8?B?cHA2bVZyUkNiVS9LMTVTaG5FQ2ZkRk4yYlcvZk1lZmhpWW1FTG93S2tLVFVm?=
 =?utf-8?B?TEJOWU91Y3pQTFgrT3JvTlVNWHc3WEdwSjRVQnJEeVh3dlErTTNyQ09DNHJK?=
 =?utf-8?B?UFkrc0tlaFpsNkRFT01tTEFGMlBWVW5TVUN5dkxJNmVsQjNWMVVKOGZhMzFw?=
 =?utf-8?B?bFlGcVd4c0Jzb0FINUtTbTIrRU5rcTRIcHl2RnZ3aTFQTGcyT05NT1MwUTBP?=
 =?utf-8?B?NTBRZ0JPdXlXMTFHdmNIUzdtK3R0d05HazY3Z20yL3NwMGNuVTFvR2NOT3p2?=
 =?utf-8?B?RHRCK3NrZ21qS1BIV3BNWjRkUWxrMnRoWm02MmlSUjZxcHV0Q3UwTFIxbVlF?=
 =?utf-8?B?UlB2UnNuUUwxYjgyeUgzRkRESGQrWllValJranJEWmVOTW5JTmRrMDRpcUd2?=
 =?utf-8?B?cXlZbmJkWUg1L2crQ1huRURWb0doWU1XQUcxdlFPZ0ZlUXVjajcwaUdpMnRh?=
 =?utf-8?B?OG5jVnVRcWVUSGdEREFVcDc5WkFvT2YzVi9KeHdWRTVLSi93L0FjRUxsRTFx?=
 =?utf-8?B?amgrTkVmc3czN1JUdXk5RVBOam1pa1AveWFqb3JmbU52a1ZtUkdWK0c4TVRB?=
 =?utf-8?B?dFhxUXloc2ZETEY1N0txYzZvSmNwWG1OUmpzbGpPeDlRaElYbkRKTmFLNkFV?=
 =?utf-8?B?b1Y3ZktKV1ExK2FUNVVTcldKNTVWRWpxVnRyZTI0cTNVQVI5WlliNnBwSlhI?=
 =?utf-8?B?OUdtNmw0V2R5N2ErNkxmMndtZDB0WDFMMk52SjkzNXdTUEQzQVQwbjY4Y1JC?=
 =?utf-8?B?clFYTDlNZUM0SFdZTDJMNTVXVXhzTk5kT3dpb2Y1M1RkTWdiOVdvU093cWhi?=
 =?utf-8?B?cUk5REQ5QlpRZElCVHdDeDd3b0RrWEF1aytnYjVVbmprSitTQUo3LzJEUklG?=
 =?utf-8?B?aGZFcWI4c1NJOWhFeVE3NDBubys0WWJBOURkenRXbG9WSkpMdWd1Skt6ejZn?=
 =?utf-8?B?OHFDMjlaWjBZbU5XVGk3VmxJYTMzQVYwYmlsOFVRT0Z4Z3lhcXdBUldIdm1Y?=
 =?utf-8?B?R0VWNUJzUTg2cENZNjlyTVR5MlRSbFhMYWZCaXJHbW5pTm1hdlg4c1ZDS2hr?=
 =?utf-8?B?Nkg1bzVkUnZQZEZwYjM4WVAweDJRUWZWdDNpM1dVM1RKa3JvOEIvME0xYThN?=
 =?utf-8?B?aGwwZ3hYMXVVZitBZXVuU2cyUERFQWVxc00yaTR2VlMrd2I4QnZqKzdiVnNt?=
 =?utf-8?B?ek56eGpobEdBQlZJbEhuMUg2SVdpM1BZQnJzUHV4TWhLdHFjZXlac1dBSjRz?=
 =?utf-8?Q?H0Hg+O7SbsFgqmnPjdFY7jh7OJnGueQxVBx7o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4acd0738-727c-4048-408f-08dedd2cc82e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:09:14.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8zzJFngZCUrWdMRyxAuIkPvYZhyUbdByIt2MNF9UNgGFX/5MEiVyApCGN7r7sPi0e67bdG2RrHIIFL7x5WJ0nuwp87U6SHaiIWPnJZdFK56sG1R+D5kPbllBlhZoTtO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_130918_346339_8CDD6CCC 
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

From: Frank Li <Frank.Li@nxp.com>

Remove undocument property clock-names of fsl,sgtl5000 to fix below
CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6ul-isiot-nand.dtb: codec@a (fsl,sgtl5000): Unevaluated properties are not allowed ('clock-names' was unexpected)
        from schema $id: http://devicetree.org/schemas/sound/fsl,sgtl5000.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
index e34c8cbe36aec..2e3a71f94f312 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
@@ -116,7 +116,6 @@ sgtl5000: codec@a {
 		reg = <0x0a>;
 		#sound-dai-cells = <0>;
 		clocks = <&clks IMX6UL_CLK_OSC>;
-		clock-names = "mclk";
 		VDDA-supply = <&reg_3p3v>;
 		VDDIO-supply = <&reg_3p3v>;
 		VDDD-supply = <&reg_1p8v>;

-- 
2.43.0


