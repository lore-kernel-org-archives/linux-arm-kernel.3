Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFFC10BA45F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXAJz6x4v0pl9Vx450K4Zhu/fqg/v5zMnSbCl0/vTIY=; b=b9+D/8th7UqZOmaejjpPLJh1Ze
	cSuQvKckB/5BdGtl1X50ghbgQiytzMXmH9L70QAITiqMd2Ii6LbbZIfaj5rTIa4+4nX73jEpHEVFR
	/3kukja1o7n/6qNUrg+JfVFmJhp7UzpMFE7eXReTAeQGH7vkEqBfU5IxthF0+IpzQcGkC9+nz/TkE
	1dBvgQT0/I1rbZjIGWPMX8hOJ4y3vEv4v3BqRONIcQhffjt0EDUA7lTYBucRoAj8sGU2/MvpxiwDg
	QmQxP8D+g7z5hY/ev9Nbxap5z3E1bOZUHqtYa8x4rFIvTKyJGihdkKxDKdfyNie9mcRwz1UERfYFq
	GaeQbF9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63Wc-000000074eJ-0zjC;
	Fri, 27 Mar 2026 09:30:42 +0000
Received: from mail-japaneastazon11023129.outbound.protection.outlook.com ([52.101.127.129] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63WZ-000000074dZ-0yO6;
	Fri, 27 Mar 2026 09:30:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cp2hdO0jAJPInXZ8lj3d3IcCiYpuQchqVlMVyZ1buPoyZb4Tv/LQyS/UZlQ3vHWvnOdtbGhwE4+HYZ99lYe4aubRm7tOVlYC0iJpN57CA2d0Vp5a4XMhoZKSo5VZ9aTbpnbchm9cFXizWmBuHZHUoM5TW/JhdaMySIYW8+sRx3N4SY6CsEGDcVCEIC6LfDBpYOPuA4FlLOFJ0a7Of4sIWAuRDSxS04HWTIpU0omXUMDu8bhq0dBNAmaJcAdxZ3cNBfkM/xoe8YhqeZmU29JdDXwB5r+ZogG13J8IeXW4VXTBbnscNct/Xvil74tWF5WdMfTTwOtXgS6dy/2B55zU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXAJz6x4v0pl9Vx450K4Zhu/fqg/v5zMnSbCl0/vTIY=;
 b=xTZU+yPuPEL/6CwTLcoi+XnFRiaziW2Enh/KFrvSWlfpd2PtKS2Ixrw+eGYKS8dYIR00cmGWxWBgB2EkvLxYP42kYFeZXjMbwMQ95lUwlTvguaRoS07tJ9NRDkdFMwfZ6O9DBa+MCnc289rhhbLNll7z42MIFKp0xxw94u9jnbSLqCI2k9OkAE1dLeZs1JLNW3Fjyo/ylMhxlqCkWML47yPzbJWA4/nqzGCVX84h6Hr7z5OYkUEe6ROclaq6kkQjF0AYr+vfjaW6M00Bc2LPccOvcrHHGccZJyW1ks+3PKH38R6lEHDCG6Fn19b2Kb7oFk/a3zv9rO5E6ehWkvdWFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=khadas.com; dmarc=pass action=none header.from=khadas.com;
 dkim=pass header.d=khadas.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=khadas.com;
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com (2603:1096:308::2da)
 by SE1PPFE32D229A3.apcprd03.prod.outlook.com (2603:1096:108:1::86d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 09:30:29 +0000
Received: from PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549]) by PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 ([fe80::20a2:a696:ac88:2549%4]) with mapi id 15.20.9745.019; Fri, 27 Mar 2026
 09:30:29 +0000
From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	jbrunet@baylibre.com
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Xie <nick@khadas.com>
Subject: [PATCH v1 0/3] arm64: dts: amlogic: meson-s4: enable RTC and IR for Khadas VIM1S
Date: Fri, 27 Mar 2026 17:30:13 +0800
Message-Id: <20260327093016.722095-1-nick@khadas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
 (2603:1096:308::2da)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PPF62EEA9B1D:EE_|SE1PPFE32D229A3:EE_
X-MS-Office365-Filtering-Correlation-Id: 714a9104-960d-451b-1723-08de8be37c1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|18002099003|38350700014|56012099003;
X-Microsoft-Antispam-Message-Info: xmddjv4qEpdGZdYSTGYx4SHjF4NeNKtZk086f4phRKGnK6Odq56V6Vq07jPSIbVuZwNkpUQHvuCIkpotHbfgBL5iNcmHuG9m3ePvbQ8SG8Bl2641DrlURfmJGrmffn4+k0CX2bsAE6sMS3ESASeEOnfGOyB0qC6mx4YU62wc+mfzCxnxYwuJtaby4RpK4MCMgpM/VZNG7+ux9yC8AlZxrz3CWFGbMJUud9F3/puYTorftJWtReiwbudfrkrgvpwCw4jNjMEfI16yWET6hZwxUt+ZBgXz9HJNcxva4rOjbROos4aOypkX0IAEct9AX0N8Hbv0RpYfASl9R37WJuv0DYXGMwo+447B3lCCkDYukzl5zxtPN2SrHIw2e2N8RS7KY8ug6NtvHt5wWxC934abGcsxO/Y2uc6J1TTuJCsuwcsx9SJh5aQobIeHgRaibImr7Go7v3/34B2fuPiCCedd0VzYAW26Bs2pKBkUC9YdHncqI/TZNSnHtDFoMllkal5+PG36u93Mu4LPG2jkTzjlFYgmJPVqGYClAMzhD8zmJHAfZpFHYHwX9pmQvcKRMuPN2nXc2zQ1N+Se4C/5XkmawYSHTJKWyaddj4KB47ux/FUQa5v3gkRAg2EkJf06O0T0+3t6crAEWJpQwsiCxLJmPHZ0yNhf98szlSH/oAkKyypRP3LhKJv9CKP9sMaF8v1UlVnID3SELZqnfC7S7+l2sVLUcbq9ok0JnXn85xsXG5ybAeEnSDGVRKmyhtJBzB1wKTn70vrWAiPfmbRzePG4+jwEi5rUcmR8/ppr7lJba7Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF62EEA9B1D.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(18002099003)(38350700014)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yqKyHqBFNDGOFnWjokYCwLo2ZvGbWi8Wr2syFFU5OgnOmmE2LMwsAuT0L+Y8?=
 =?us-ascii?Q?8s+HsZR/muzI2ISIqUpagHgH0LUkvKJaXwUbsrUi5vfGpWd24COPEymfFPja?=
 =?us-ascii?Q?3N+hKAhw75vNYY6Ot9OnCiVSLCmfIoz8HYN4p7etnbTEwqWGINK30zGYvgUC?=
 =?us-ascii?Q?tJP3pK2gAB9Z5D2Idw5KerQCcJ8AYvdH8qF2CWIUcwO1NfYjCPmx+3r6O4ou?=
 =?us-ascii?Q?B0NBRQU5aYYW3yVmXvfrkIebFRYjsEgpdlmV9hCOPuhU5esTkeEMKfxiwVpW?=
 =?us-ascii?Q?kL3gPOrnu9FxUVFPFKJIxYucTaZmEDrE5FSSY4lXSZsZAeyugliSZhHkcDR8?=
 =?us-ascii?Q?6uxIvwXTnTBefv6E/W103Dznln3TvJCjylNo5NxnkN+zbqvZQzG6grdfsMMl?=
 =?us-ascii?Q?/Q5PkqYlICFv88cEZ2VKwTVsL4Z+XZl2jWfe8CFRiJ9PdQPn1IhD0shPJf/k?=
 =?us-ascii?Q?ZGL5IgoGdUMIIMoj2U+DKQFaKf/VgSIs06EZcxZinmw2ezh/hZZ+prLz+mu5?=
 =?us-ascii?Q?v3M2TknIhSFZEN8ZlUYIXFupeVe0qAjVGnKOfOgnzjyRlEMLAeU74eQvKBxK?=
 =?us-ascii?Q?40jJHEQhInO15fJie6YPlQgUJrdb/IOpznrx7HRhSR17koumQia1HvHnfy2f?=
 =?us-ascii?Q?AolXJyURUPpSstisPdKbyaAmaA457hs8vGEyappgOaewbbnbKeiIVrJhoxoK?=
 =?us-ascii?Q?PMyFFpSMPq5ZMKFVhDZZ+8oEQ1zbzJekQA+IbReEvPYePbR8A1lTNRSaa1i5?=
 =?us-ascii?Q?PaPIp0VFek6+mYk5C0s+pzhdjxYRq3Dq2lGBuXMp7uW8v2Hdj8x7hpj2Cyvo?=
 =?us-ascii?Q?TVsCJVbQFWvSrQIaJLF5CLER+85ja5DD66CWYQfKx7zkDGttm2cXfandRxMc?=
 =?us-ascii?Q?7u10A2bbCEspWScmUtP9PkuadoljAdD8LglsQmwLr6qBIvJK+Ka5SmgsTyyb?=
 =?us-ascii?Q?TYBBTmpVRmGzxDW/FQM80B8s8rHtYzuBaEzS7De5xZfdccerVEfClhOiTxkg?=
 =?us-ascii?Q?j3xxl6/xguu7nNngEkl+BpB3xpdEktMoGwaHqvxtfZp24ZA+kfVb336skcsr?=
 =?us-ascii?Q?MQct8LaFQuEWQFrez8yomYhQzos73p5VvbqdHJXRfTy8Ai/UBusCDS4xbx+q?=
 =?us-ascii?Q?Rj7eFteQQ1ETw8daTqerOZkMjzL9nwsyicnBlbtkzcfG4CGlVB4zJTFPNl0b?=
 =?us-ascii?Q?ubw6LFEgDu7v9ox4YxvfdErgpGIl0uh2hZG1i/v1OmF0Wk9n7lNLnyOgFsW6?=
 =?us-ascii?Q?sec0Uk3l9a9IQO3hbnZYnAqL4gG8BneKnkUOeoagfIj2q03UaoNnogWe9CeV?=
 =?us-ascii?Q?QaqmKts8bGpWFFbBXpOUMQW6sv4qTMEdUTu6Qv28nMJuD2foOAsCO5G/GyPo?=
 =?us-ascii?Q?OYi4hhiuxzj/y7bL7OF7mczYvlqf8ifbl2PLQxUTT3ogdpRZ58QuPNAyeTWO?=
 =?us-ascii?Q?nHomBtTIdiN72NnzJdNR90ci2MlIC0kj35AfWhgU0HNMQIC+/nIBDT/RX5cy?=
 =?us-ascii?Q?puuXXotDnrclO8zfxFDtF0R0rC8REJ7EicJLgWvAbMAq2f9Vls7RFmIy4CxF?=
 =?us-ascii?Q?VnYks4a0u150pUbHzZoOvjZ4gukETVRrpSY6fzi4YC44u0noW5AXsBOfC46+?=
 =?us-ascii?Q?HcbHRW8KadK22ZVD/eJqmeZnrYGPHsA79yLKmQv3iYYcHXGHi+sUzjoqBCod?=
 =?us-ascii?Q?sM0BRLYd7fbzmYbBNdHq7tq3ENKyS+dKWusP7tRsOZNN7KZk?=
X-OriginatorOrg: khadas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714a9104-960d-451b-1723-08de8be37c1b
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF62EEA9B1D.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 09:30:29.1999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cRbHLrzW53No3HB2FS/vesd+hEiFMbQYUG1kg1jhKXE97Gru1x7zgSwMZpu94f5h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFE32D229A3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_023039_293989_75B3C9DF 
X-CRM114-Status: UNSURE (   7.30  )
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

This series adds support for the Real Time Clock (RTC) on the Amlogic 
Meson S4 (S905Y4) SoC and enables the hardware RTC and IR receiver on 
the Khadas VIM1S board.

- Patch 1 adds the internal Virtual RTC (VRTC) controller node to the 
  Meson S4 SoC dtsi.
- Patch 2 enables the I2C-attached Haoyu Micro HYM8563 RTC on the 
  Khadas VIM1S board. It also sets up aliases to ensure the hardware 
  RTC is prioritized as rtc0 over the VRTC.
- Patch 3 configures the default keymap to "rc-khadas" to support the 
  official Khadas IR remote control.

Nick Xie (3):
  arm64: dts: amlogic: meson-s4: add VRTC node
  arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: enable HYM8563 RTC
  arm64: dts: amlogic: meson-s4-s905y4-khadas-vim1s: use rc-khadas
    keymap

 .../dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi        |  5 +++++
 2 files changed, 21 insertions(+)

-- 
2.34.1


