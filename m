Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F99FC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 17:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=; b=AnrZVe8z9KKIV63ktoazwqTT+N
	1j1fryznVHxl41zP1bLXi/IsTgSjA7m6ITEv8ATcEjKYNKUOHOfJHw2thMGUFHSvrAMeBCBEnxg7p
	rqlhWx2RjEYf/O604n0tXynt1mcJMcOGCTFIw7+GMyAcMw2yhhLiFqP5nuBz808psG6qg5YRQErmZ
	49FRG8kViJsPgggZrSxtEeHevn2FYWMCBCFoO2pfOYDZ3DRvL1pQoRJHfDEPBlzm7XhqUQSzUTptI
	7W1vNTFd+Z/fLphvOStbD55hhp8IpTMEi/UzFvBpX2DGV0o3dftpoXZWcCYVImHdypi96jB0f0PFr
	1Bibr+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYYU-0000000HAj1-3q6y;
	Mon, 24 Aug 2026 17:33:54 +0000
Received: from mail-francesouthazon11011047.outbound.protection.outlook.com ([40.107.130.47] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyYYQ-0000000HAen-3BO0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 17:33:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lD7MEPCvZrZbm97SygUGMN7wZlEWLgxQQvqrVftpBLoGJvQvR9Q35byGTdfW6x1BLDpf3P9XS5UM6TzlKDwSNJviyzcA26UYZ6xo74nML6JfvCR0Hl3hti2d/fNV4SDQqIES7j5kQAsSy0OtQ62DYIUx5nNXcHDmRvIRFfPTA8CvUNae/S0hTrxOL2ZRNRnVw8/bIBq9MSaXRrjHU91zz3wNoYpbgZpNAG8seju2nK5hK/QrEi34FQ1qimwM2nCxRgNZPY+uhWcDp5aEAbyLKEq7A2IRsKUBwi5Xn22Z0ehO508EURYBmRmqRcy4XUHMZzQ5aMPO1kofs+rzoTvLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=q2YICelPErt5ninrFVJnvfdz+sD6K4NO9uXkTLuwF+KzvvOQctP+YoOEmYjMdp6Axz6pl3w7smpAYblJUMqPzyzMap42leWrAjpzqjGVPg5XfSEbxG5bjlwsUmiucZ1yCj2y2yHlQb5Aq4kBKKKznOkggedC7OVPKHQR2ZMoAmm4rwdGc1Dh9Xk/8bClYr/X52z1ckM8wOkz4wA11CzYyUCzGLnBG+P8Io+Y9qExZcd/CVnhnf9GnRFwkLpH2I6ZyxtYGIllmXQBGYwQCMiwpIJjkc3Jt5WkTH7PacRWu53mNZp7Q0m8+dPDZQWKMFGJiKaGLj0zt+FKcsTWPo6pDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2i+XMUvEqKzc7yHTfRvhcQY8Gt+wl/MWYpn41allwYo=;
 b=iphRGmgyQ366CzX2dxunrVpjgaC8Q2PtwK2L3EQhqXT5wAYyLrVjPL93d7rmC/Hwr4sMP9o9220gBrZ8lps1SYt3cv/jCW+lvCC2jsHQ10KaN+1D4HUVW5Rqx5LS80AAL4kLeccoj5tzM6id2jAAD1quxdcQ0gZrfnISJfYtEo+s2+N5MQQfGAMYLgaOL/X5ATIpDkvbaaLjzoyXXZoe6KzkGRpU8CjCAe4RLctncRYM33pZLK06T2nSgWdLM9Gt/YIt7ny1hHk2hu7XjWh/7VaTRGpQ6rmSc9CQLhXGw6KIoIPTXWfCQmhulgjtvZYzBAgJ4zzhmZjZwqgUdO15JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by AMBPR04MB084187.eurprd04.prod.outlook.com (2603:10a6:20b:7de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 17:33:48 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 17:33:48 +0000
From: pankaj.gupta@oss.nxp.com
Date: Tue, 25 Aug 2026 04:33:38 +0530
Subject: [PATCH v42 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-imx-se-if-v42-6-2e8efac0bb16@nxp.com>
References: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
In-Reply-To: <20260825-imx-se-if-v42-0-2e8efac0bb16@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787612614; l=1532;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=Fey7Yf+dWHev0BhTzN9X8KrA/PpJDRs7p80ZHkKltXs=;
 b=OpYo1hFoNXsz/N/rWDM1iS8XKSFUJCO2tM8Fj43wTxw6otHLCUoHmqH5ZcAx5PSpBFPttRo0u
 sTS0hsKO7WoCgz+fxwMx7jn1/Cx6T7SLbfUSrOBIp/HnNp+LFDh8dSa
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|AMBPR04MB084187:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b738a9b-219d-46ac-dc1b-08df0205daf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|23010399003|366016|921020|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mIIPC4XeSlfRldakY60HHtkFlf2rckgNNzXRB4ymANWnss89gxiS2UvZxHP3TuXV8QZnEZKcl7Lfd/80ojg19CCeGgNzB+Qhz20dl0l0f2sC6ZVKUfhxHsC9dQ2q19i7B4gbvXE/pTsQp/1SF/kXKgpKROEt/Zm/ladSmeTZyVrJ2J+Z+Rv74hlFmWeQ+k7swvkJr0M4UVvL6WjSlAeEcHumgL1a96iJtK1mowSNgflE1E6tbgTkynyzHqjt0wg2RONbkTvvQag5Br8cdWNmO9ud7jK/CCgFPpOuM7rtcJmNdl9Mt40KlEdkHisjVtuq+XKNGI4u9iAMeRyPOTN7g4RMiYQRhz8Nid3FAAvZMZQehAtf4fugmsZD66XToWdevviqrxm+8bKv+RbNzf5HsYc62qIyfYuujDSDATnf7BOxBRaHKTfGBBvuDOUUaRLfl4b0e/gxxC8D38bgh//pQt3i7zTjcwVOl+A8VRHYdACwLZ4hnly86K/6fX1JQ/SSiozb0ueTZSVt9BtV7CM/23J/HRcSfnRsobdJgQo7DgkqEwShUyWXM8qrrMyEIB2W7KrtS3gDlpYL79I/FsMWzFiB5UrfUdKI0A2HxZ/QvOHfihbFm/2wvs0Tn2TcJFtYIx+EVFfNCtjtb086HqwI1S0jdsv08clLuzt+1pgyrVvLTe9yRDUXKU4mijlsJaV+t8KZQW1szVaf3oTid9Ms/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(23010399003)(366016)(921020)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWJsMDFhYXhTeVBIZERnaGoxNnloRzNtREVuVWErWTI3UXFreGZlUXhIMzNE?=
 =?utf-8?B?dTNvaExXWE9uRzVLdVVOaG5TUWxZb2dGZlVzbWhaNHdUelhtSVJOdHVJTXJ5?=
 =?utf-8?B?RVV1ZXV5czZGM09GS1dyYXZMZ2pqNndoS01DSU9yMjhKNm4wSVYxVlRmTk5m?=
 =?utf-8?B?UXhVOTIxTEF4R3dadjJYUUY4b0w4b0pKdGNqVEFFNEQzTjN4LzZYbkZ3R1pl?=
 =?utf-8?B?eDZjeGFzZjhvZUtNaUdsK0grdjIyNTJWWWxPTkJZVlZ3MW00QlNUWjhIT1pr?=
 =?utf-8?B?SU9JREtQOUdhcEpHRXg0OVZOKzdSMkE5WDJZb0NuRlFNVERNZVdPM29oZWh3?=
 =?utf-8?B?ODgxK1dES3M5dXNyNmhtMWhGZnZNR3JaLzdkdzBWeFpxWEpvRTd3Z0pCdHVp?=
 =?utf-8?B?a0lqY2E4MGJBRnRVU1AxcmhyenFxT2NZUXNJS3E1NjFRMG5MNFN6T2JNM0JQ?=
 =?utf-8?B?dTh3TTJxblpoSEZFdm5VQ1lHRDJoTXFTSnBFamNTUjFaSSs4Zkt4VmZUWGln?=
 =?utf-8?B?MkI3aG5WcGt2VVE5UG5hR2R0cDZWRU5ldU1uZTdUQkxRVU1pVTZnUzdPbUR0?=
 =?utf-8?B?V1VXaHdQc2hTUFhzNXQxTlQ1cm9XSU52Ylc1Q1ZKV1dKbFNPZ3BlUDFJMXVW?=
 =?utf-8?B?dUtnc2lUaWF5OE1OS1V5eWFUR0JtQkVENmx6a1BCdFlnelVtTWZNOVc3TC9n?=
 =?utf-8?B?NEdmYlJnbk0zOUZRb2Y5VllzN3M3alJMbHN1c0ZlV3FqbDVPNnJ4TkkwZGox?=
 =?utf-8?B?L1VhZ1ZZcXdjcWVnVWIvLzFMazN1a2tmb3dZYi81OW5QWE0rQzJCSWxscEIy?=
 =?utf-8?B?cmU5dDFnTHFjZlErVUt0QVhERkhoOXlMWGFnbW45T01SZjJPb09pZytjQUh5?=
 =?utf-8?B?NEk5MTBDRDJNSEJSWUxBSXZMV0RzZW5JZkw2SXVLakFYQzZrMmlQcWxhaXhl?=
 =?utf-8?B?Q1NaWEF4ODExZUVWdU43N2F2bGFxTWxYaVRWb1FlS3pLZ2ZlVXI4ZHhoYlpn?=
 =?utf-8?B?aUtBSGZEMWxlZmtYWE92clNjNEIxSHdSaTNxZjlVZnM2anRNZkFERVlQVlJL?=
 =?utf-8?B?T3d0SmdCNU45Zm4zQ2FJMDNkUjRZbG5VdzhGcVlqZ2dYVTZ4clY4WWdENWpn?=
 =?utf-8?B?TUFDQzNoTXdud25uZHFBQzRCSThRb1NxcmpzSEZwSzRJUHBHU1AzK1V1eThv?=
 =?utf-8?B?cGhJb1hnNzVCWWFSaWN5SGViWE5ZNzN0eDBvRURYZDFsWU54Z21DUWc3TWxi?=
 =?utf-8?B?YlBneVRNNTZtMlpkVFJGZGNTRjB6MnhQZnp3N2hLNThuSjFGQjkvMmloR2Yx?=
 =?utf-8?B?N1dOaUQxNUNBeHpmb3RsRWFEUUk2TE0yY1hSRUJLNmE5ankwbUZPdjRuTmxk?=
 =?utf-8?B?VW00T3NUTlg3MXlsMG90YXo2aTFtaERwVld2RzhOZFdSZUtwQU13aXNLUHdE?=
 =?utf-8?B?ZGZVOGNycTJ2Vm5QVHk3NDV0YmwrWHlEV3BJZFI5SlByMDRRdk1SN1lYY0tq?=
 =?utf-8?B?YVlPcytaOFF0UjZLQ2dnTVVOWTR6elRiYlZwU0lvY0pjNkVVSnFIaFlVZzE2?=
 =?utf-8?B?YzhpZENtYWRHdHFuUlNXcHJGalR2V0d5S2tYNWpEZTNDSnpLTlFwTVkwRHo0?=
 =?utf-8?B?ZnRzZmZHekhONWZUUlAzYWFYUTdZcjQ4KzdlOUV0R00xYTlZN0pSM0Vkbk5t?=
 =?utf-8?B?WFg4aFBEY1dzckNNQjArblBsODRtbVBlOGpLRzRWbjhpN3VZNVg3ZnNXK29w?=
 =?utf-8?B?REU0NGdJNG1tMGJxV1JudEx2ZVluazhENzMwRklMVDhnd3libXlqMFphUUJu?=
 =?utf-8?B?Kzh2a2RoaFJCay9TU2VhNHRCVlc4aGlIN0hDMFZQUTh4YzFFejVZTFR0KzZr?=
 =?utf-8?B?VDV4aDFoaVhWNUtYOHdtdkJBYjVxaE0xRzN5ZnRuM1gzWE94c2pkMjZmVkJI?=
 =?utf-8?B?aU1jMEErbFRyTHh3elJnSk5KajZtTlBzbDR3ZEVRd3M0NU0xMVovbmlsN0c0?=
 =?utf-8?B?d0IycStIQjJDcWxMOWpHLys2WHZZL0J5RHQ5bXFibWp4aUd4aWh1WnJkdy9J?=
 =?utf-8?B?bnNKdUdkZzNOaUcyMkFtUHJpTXBtMkpLWHd4aFpERWxBU2phR2hPZWtHNzFG?=
 =?utf-8?B?NnNMVUxGL1g5VGhuNi9sNGoxSEx4Y3hHMEhnVzQ2WkN5bVJGV0FMQjRqSkMz?=
 =?utf-8?B?SWxqOFB3VHk3cUNlTDNQdDlZY1RpVyszelJuZFFSUkJGZlVMN3Q3cGpHcE9x?=
 =?utf-8?B?NlVCc3lSSDFQM2pqSG9peVZwQmYrbTBCNTF5azJmUHIxTmV4VGk4djI4Qms0?=
 =?utf-8?B?eE0zQVB1bW1JVGswUjhERTFLUUNZU0UzdVo3K1dSZk00ZXJNZVhzdkUrNXNl?=
 =?utf-8?Q?Elt9evJTlpRHJp/5QAVscPKV8lOLleyZ7Ed+D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b738a9b-219d-46ac-dc1b-08df0205daf0
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 17:33:48.3689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qghsXNLCux7dGaAV4CY0sWLWQ0lyql3mtuiVKy9Ff2HvI2qRO7alfyYITssbonAXX/TCovPX8KV2bAjQd7myVNNIG/0dteD2ciDTjJ3AFtl/0QU9URPgC6OstQmwMx1f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB084187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_103350_800996_D9F21E59 
X-CRM114-Status: GOOD (  10.54  )
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

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add the EdgeLock Enclave (ELE) secure-enclave node to the i.MX8ULP SoC
dtsi, together with a label for sram@2201f000 that the node references.

Keep the node disabled in the SoC dtsi so it does not impose a
reserved-memory requirement on every board. Boards enable the enclave and
provide its memory-region by including imx8ulp-firmware.dtsi.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c6d1bb9edf38..38233dd74ee3 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -153,7 +153,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -185,6 +185,14 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			compatible = "fsl,imx8ulp-se-ele-hsm";
+			mbox-names = "tx", "rx";
+			mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			sram = <&sram0>;
+			status = "disabled";
+		};
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0


