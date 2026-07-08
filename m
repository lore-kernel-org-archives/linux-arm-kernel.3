Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A971C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 20:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=28B2Yq6a0+ihENDfNbtgeeWuhQpoiSJ2rwCINAwp/DM=; b=htAlOFJoBgXtPu1k4LPrM88S3x
	rb7bez6HA42KKtS6Coiz4W1cdyJfwIJQhgJijiFi7ulGomHqNbjKI3dgOc1ljh91WEOs6r7H85ovA
	C4UyEM+SB7vItj9yYPBmKEaJBLA+Zv1JKa1bwhILtYRlzx1sDa6PlrgVUDgjXFMM87EyLRXnWhQ+a
	w6ToxUHARbgwgFWTYccDfPA0ux4cJlfL+vWJP/SYcFr+cPykVZseydM05Xg5qhsDPXT1xyhymbT20
	vQtlKzM/mGLPqZTSwbe07DzHIp1Lmna12Mpn4gmu7jEFdH+JESc3JulOAz7Bg3mOVA1Hyfc101ebh
	7RvDiFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYZc-00000000KAO-1xUl;
	Wed, 08 Jul 2026 20:08:48 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whYZZ-00000000K9j-1Jud
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 20:08:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGJmkAZ1YCI9DQ7BJdwDAhQmqiv97hzqrOY9cL/tTsa11hh6ZcjIt5yHub5ruwxM1IRaIzUYjfaqBtGuZwuQ78OvfvH4/T95QZmJD6En5ElaNzQ43c8IbJrFaQNpZmIXEsLjhYtrnv9koKPZlKDXzX00BOm8dXd+Tv65CROzrpr50T6toPhfPsC6Qs/dTDYQaAJoWYRUawnMwBTtInh4yBYqt7C1n39xyh8ziyBg07aVMK/04Gvyvdldoq3LPB/7OGT8gBcGdBXSSAihZVWQ7XWeGRDJf75bVpVsQaXpRcLijKNEBce7ZYLuN5mUViwAVfINt2tSwpQ4ZmUiA7OxyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28B2Yq6a0+ihENDfNbtgeeWuhQpoiSJ2rwCINAwp/DM=;
 b=LyMYsLPFP5AOJO5NX2+0uKNi8B7MvtB12N1D06IZBC164rMCzI6aJZhk7OdHtfrFebzpMU3Eh3HnyLXuZ5fYmj+rv50c5HnqBH53YaJIo8JsF+gzdbAKY19AIDXzl2pi6Uuu0bb3KkkC69ixp0a2a7NC0HcxRmY7aIZM6nVJB0L/5Uiu2j73dvgOcVjvA6NhrlPqk4bktpAKwWP+J+KXCz+pnJ2LQin6cTgcDIutKjLJ8HRxGFPN+xh3IzSDJlQ7aiW1V6/PnWSaT21PmnofF0Pfxmy9KVSSFHUTNw9E2ltezsur9/Z0LLgRV+QwVqZCrzR85FLMgFdxxElJiWJYzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28B2Yq6a0+ihENDfNbtgeeWuhQpoiSJ2rwCINAwp/DM=;
 b=uR7kpfoxATddDu5mwyCaNb5nhtbBr1Ka+0E35IflzbURndD/X29j5++yr87/XR5qSNMT0JT51HeSFa90wPcMIyXYVDOWmVSGSt/sYneza9i1/usRMwNWWOklEkbtJFHLxIWCiVHmsu0XDq7KZIBBGCtik/vG6v9dRGMee/Wk6vS24M4t42ldU1YODDGOxEH37DtCd+/KZlocrE1ZYy0Fq4kLRINxFS+MkRIN8yccaZTkfPwHiSERAAULh4dxIbPShPj04h9ngM3KX+qqij/ZFoheH+3+owLuAo1IJh323iQr/+JKe/y2aS8Q8FOXkT5BuVJtV6EHXquarwuET6zaJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7571.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 20:08:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:08:39 +0000
From: Frank.Li@oss.nxp.com
Subject: [PATCH 0/4] ARM: dts: imx: small change to fix CHECK_DTBS warnings
Date: Wed, 08 Jul 2026 16:08:29 -0400
Message-Id: <20260708-arm_dts_mini-v1-0-11b88825fd1c@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD2uTmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwML3cSi3PiUkuL43My8TF1zsyQD80STJMukJEsloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAfvawHXAAAAA=
X-Change-ID: 20260708-arm_dts_mini-76b07a4b9bb9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783541314; l=876;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=BK4y2WxSO/bbgxjNuMfAT3x46pL1d5QYgO2xMfkEJ8E=;
 b=IxT4hXf0C8/V+a9wOFTFEyMpA9J2B+5Ds5oWXTC20Sd8bc7IU3uE0MBNGP6hFYI74/5fDU6TW
 EZRQ7n77c/5CGHI02oOvTAXVkMKgKbsKUZoDsDHaUZ2t9BiQ8zJ7l24
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH0PR07CA0032.namprd07.prod.outlook.com
 (2603:10b6:510:e::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fb4625b-6015-4ccf-cca0-08dedd2cb322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|23010399003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: JgbhHWPm2pkwRd8bUUgbHdBtY1hpK6TMz0BrNlQqwG6+Dc9R8he9FdUYj8P0Y0AQ9IAxI+ky5aq5B6+t6dppjPH0o2vF72cXoB1NYDhzAvXfoATOn7fI+1+vLqe98qCU0Dl7dRa2thnEj0Ri2c97MCde67lKKUiscB8V07K91g5EQUCq0MnMqA3SvplgkHGq53sBl5wr3oJmXJWgqLlwrG3k1lICHpOHN+BfOQY7HFtEwRmEteZQBKoiSnswwuP2D1pQuR/92ywQZIY783LS/Z70Rh6dxAcbjMlqGwXfS3ifdnfq6k+rqPcU6KWjXFeIL20Qi3guf7y+fQP5FpCP7jrm5hEQvEG3iJDp9ECX1n6VyM/0O0EjER5Z9G/8+4bo5IUJZXVpIzlPq21KtyIbrbEiBiTTVQLYJUKIc1FO0upHXSfFRPJ4t1nif2u4nnIQKG5y/n6JEvLrAB0QsJdR6+5CP6O92I6YsCyz+ZVnNY5Pp9PbJP6ftuyiGmiTxjRRks2VTWOeSUZZJCSmYCw/hvcpFdpS44htkQwGVEZASXmB20sk1epZQHEWDzEGWRa4W/BweAs4xPWXUj2ND1vnzevhdqoLDKrsqiuj1z1VutDoOGZzfWMJ+PSAgDUOwXH2xZe3pg0JlK5SOLGVGPC8xjBObZFntFH2kmdG+uvgcok=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(23010399003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0ZLdVp2TGIreHdHelVHOTBWcTIyYWdHM2lHZVVlRXFXc244VHZFWThIV0VC?=
 =?utf-8?B?WTd0dnRZWjNUOEx3QnluMnNMYVVoNno0OTA2b1BSZTVwb1ZMT2JreUJJSWsy?=
 =?utf-8?B?aWdaUzZ5TkdhY1pic1gwM0t2R21EZnJIZmJ3YmJYdDZlV2YycFo1Q284bVR6?=
 =?utf-8?B?TlhaSEZ6NWp1NWxJY2U4UVplTXBaZURhaUdBdmhPbWlNOENDYVp5aWc5UjZ0?=
 =?utf-8?B?K2dYS2s1TEVzS3pTZHRBbXhLdFR2RVNVaVFRNldDU2ptbCtwZCt4YVVJTy8v?=
 =?utf-8?B?NCtZeUl0NDR4ZkJra0pEeVhQd0wrQStIaDZRa24vYXZlVXJ4RnJ1ZVlZV1dm?=
 =?utf-8?B?bFhMNVBPZDVkdE9rSGU1OU8zSm44NFQ3SE5OVXVoVG5WWW9DaWhxRlk3M3hP?=
 =?utf-8?B?ZFNHUG9NbVhac3paMjdNU1o3MXh2TWxuOTFFNFJ5WmsrUHR0bjY5bFZwY2Rv?=
 =?utf-8?B?YkRZQkdkaXFYa1EyM3J4bnNOVnNkYnNNa3h3VmFHbUVwRHJlKzMrZHBxK1A0?=
 =?utf-8?B?RGtEZ2kwY3BHS2R0eStqZUlPOStWWjYvWnBHOVNDdHV0MXVHaXlJMklpejVp?=
 =?utf-8?B?WElIVk1JeVU0U3UwRWd3aTg1UU5rM0g5aktVYkZjQ1ZpWkxEbHRURWpSNlNo?=
 =?utf-8?B?QS85RXNtd2s0WDRzdjZST2FvY2FRM0tsUnpwM3JOeXdNMEphenNtVU1GdXNy?=
 =?utf-8?B?ZVRkZFo0c2hTN24vTlhBNnQ5eG96b2tNRXhOdjZOalFSNFQ5WG5UWnlqMk1R?=
 =?utf-8?B?V3dQdCtZdEhYMjF5VXZhdXZreTk4NnZZQ0lIM2ozK1N3SUZveHoyZVBNUlA1?=
 =?utf-8?B?SjlvVGs4SDVDVlRCTjNVbm5qV0t6TWQxY29hL1ZlTit5UldsVDliWUNvNzFW?=
 =?utf-8?B?UzkySG1FUmxoM2lYRElXOFhnQm9Xa3VJdUt0aGVqazZUazBoQ20wZlVtSGZE?=
 =?utf-8?B?elZlOVZzNWk4TmpDTVF2NDJhTmZwWTEwRHNWSTBlMHRRUi9JaVNKR0xxbnFU?=
 =?utf-8?B?SG1hcURHTGRjOHY3UFoxNEtWRTlHU0FoWVdvc3IyekhWNHhUcVdKK2p4azdm?=
 =?utf-8?B?alY0RUtOdTUwZm5HWGNQclgzZHZrWFFKaHZHMDRreXYzbTd6bVViVnYzS1Fq?=
 =?utf-8?B?RzM1ZzA4WmxSRkpFMld3ZFdMdGNLUlJTbS9Id2NnU0lGR0o4b0FlYmpiTVYr?=
 =?utf-8?B?bHgwdVRQMjJ1OWVCN1hsYzJ2cTIwMkh3dkRlaTBHYmdzM0hXbTlROFVadU1r?=
 =?utf-8?B?bUF4S09CclNhdnpPVlFBeFVpaDJETWdoY2M2azNHdzVKWW5jU0VFVE1Iak0y?=
 =?utf-8?B?R3U3azdzOGNaRmlxM05mVlluU2xmcXErWTBYeG92STZtVE9YVUM2dmJCVW1a?=
 =?utf-8?B?Zk1UeVZPSFQyeWNZVTIyT2grMzBnYkhjVzVVamQ0cExUTThlZUhzS1NvcW1D?=
 =?utf-8?B?U3huWVg3OW9VN1k5OVQvOEFtblhFVEVERFQvMXNmd2Rxc21MeG5iNUNIU2Fx?=
 =?utf-8?B?cElwdVFwdkVPMWROVkZvR1EzUzhpa0U5Z0p3eW5GVSsxLzlqU3ZrRHBaWTcv?=
 =?utf-8?B?MEpodlZMckxZaW5BQ0UzbFZETU9ER1N1blQvY3VMRTh1Z0RHOUpESHc3cUYx?=
 =?utf-8?B?c0N0UjJGeHF1OFhna1RJQlBFVzVGSzA3Sk9FQnB1bHRrcEtrQlhLNnozZWt4?=
 =?utf-8?B?d3V5dkxyTko0SldXeFJFdEE4UmwrcEhrNUpWSTY3WmVhdWJGZUFhdjgydmlZ?=
 =?utf-8?B?VEZ0TDB3ZlRvaGlWMjFYUW5ITklzRUtVdW1RbnVWL01sYmpCR2JrVjFlOFpP?=
 =?utf-8?B?MlBESlFrVkg4OG5naEtQcXEvZTNNeklPUmd5a1R0SU1sQllubUJVVy9CNlhB?=
 =?utf-8?B?d3pIbFdkbmtpeENNYmJtd2hXQ1lEOHREeDZHSjltVnd1TmhFZ0V3cW9hUzFO?=
 =?utf-8?B?R3FmSlRqYXZEQVpYdlpUUS82M1lxZXIzRFJFL3JWVGpNTHhEMkJFdElwS0gy?=
 =?utf-8?B?WVoySzN5LytaS0FRcmNwTWtXME8xazJHZDNMZnNJV3VrbWhsdlgzVW1BbzRv?=
 =?utf-8?B?UkJmSDZzaTVLb21wZkVyeS9oNGRZdzN6amppS253cm1mMWFkTkt0bWFqUWpt?=
 =?utf-8?B?RlJPY0JHM0tHTEhNWkJrQytlWHJaVEwxdHpWeTJrT0ZIYlRxYUZKZ0hEbE11?=
 =?utf-8?B?UGFvek83amxSR2lMV1FkR2J2Wmc5OVFpNlUzSE9hZUZmYys2K0RuMGdiNUJE?=
 =?utf-8?B?OWZBMVR3S0hEZEhSRU9wQ1N5L1IrWUl5MmcrUEJSV1ZGMUdpUUVjVGs2TkVa?=
 =?utf-8?B?L2NUYTNLeGJjMG1aZ3hYY2Y4dHRmZGhOREdiaThIQlJOaEgxSDIzQnB5M2ZV?=
 =?utf-8?Q?ycveY2BeTkME0qTGP4+hIAJqQcHjiEOiqLF/q?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fb4625b-6015-4ccf-cca0-08dedd2cb322
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:08:39.0398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Dm1m/Dm+F4mdEzZzlYaHug5XyDr1ButgMfUMWdIFAIbqeHC2JsCVPNJ8DKq+gOOOpn6/U1ENE14fNt5I8S9t2aO7VdNlMXuAmyGzNTdxN58Ywp7xpfcuNRRcUfVqFQP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_130845_363515_6101EADA 
X-CRM114-Status: UNSURE (   8.58  )
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

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (4):
      ARM: dts: imx6dl-plym2m: change #io-channel-cells to 1 of voltage divider
      ARM: dts: imx53-smd: remove undocument property clock-names of ovti,ov5642
      ARM: dts: imx6ul-isiot: remove undocument property clock-names of fsl,sgtl5000
      ARM: dts: imx6ull-engicam-microgea: remove nand-ecc-strength and nand-ecc-step-size

 arch/arm/boot/dts/nxp/imx/imx53-smd.dts                 | 1 -
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts             | 4 ++--
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi             | 1 -
 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 2 --
 4 files changed, 2 insertions(+), 6 deletions(-)
---
base-commit: 6c94b38b83a04c43ea49004275f0391404051093
change-id: 20260708-arm_dts_mini-76b07a4b9bb9

Best regards,
--  
Frank Li <Frank.Li@nxp.com>


