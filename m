Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CCAEA4E1C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qX65+vnlZODshHpzQORZiMPXgmkw8Qz4uQOzaHnxUM0=; b=n6QqJw9CVZTZzx88oUiRfdSH7z
	8fVrEH1wZ0JTj1kb8SfNt/v9T3oPSwF3TZiRTmedsrBS1eZRo7MljG3Qh3AGyI4NetFZ0tYdElcq3
	1jGskq43C1zVBDO3dNUW962p5s7NXQEZcB4pp1zGVZa9Ob9/R14ab6Ai5Yib7MR4+hZoBAohaLkiF
	wQ1r6bzUUR8QYc6OMcHFlsZri+Qv6sD9++IWAPQFDa8RRtM8D3JS23a+0tnud5oq5sWVRsKqBJ7BO
	6fhZovqcF+rIvis+50P/hmKZKmp4V0gS8wuTnScks0AF6mwJ0CtnGphcZrKb5AoT9UMeEBIxCtlK9
	QcrkeYnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4r5-0000000DIqd-1nBY;
	Mon, 02 Mar 2026 15:06:43 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4r2-0000000DIpF-3YJp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:06:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ms040X2J8TD7/4oq6UtkVnmqcvFTkm0oEkFjCg0eLFGa8ecdRTNcekdBmf99hFkDcwnIgZy2/FGE6Tzoa0iqYMTZHJKsmbcA/23BRgtAkKURnThxyOpVR20jTCDShsm9U/S0dp0nWex0rPIzK7QJ5KYQQPR6xwn3duiMAAInH3PaRtQBEVXUHbVfT98MwQrZPhJrnq6tmUvwhfHxnDBCBjEL2wwOOu+Aiwew8v3cH7kE/1/Oy5YR7Uy+ctYgITTkdVNjR9ZVj6g4ylB6gLTsXYGXKQRmEBzevXLlpKScXkIhDBpUsU8q6S+Usux4eSqWlf4GEA3pNacPPkkIstzfcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qX65+vnlZODshHpzQORZiMPXgmkw8Qz4uQOzaHnxUM0=;
 b=Eu/dd2XWz0Z8LHbEWMa03Ip9i/cAJdSrfd5Vp35n5E0qPzbQ9kLa243uqOa477h4K6ff4OA7km3HozQj6cfiZSGgG+2dUCSofYpoyzF35nPKkZ7flf2sJD1F9kR3CQ9pVakj+PyOgP3aD9rNpJpvfn9QnSyHGpGjUi2vkctkNaJsPd799J7W9UKlexIatMI6RM5rcP6vaFkzLMp5SYtz/+w4ol9sH0jUS9NgaE2be2XVsAPNgyUv7qsLCvRSf5FJN03wPO+uAhVdTygNOOUBMZVX5qTnDGEo/G5BE3RIFdyQjhftnVS/z94YfX8rVXOy88H8+0J8Fm7YTb+ViZVrdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qX65+vnlZODshHpzQORZiMPXgmkw8Qz4uQOzaHnxUM0=;
 b=s1oEv5cor677I+OO2wSzvMZM1+zENPl2uCS7/xTjOtj9wn8/HFr+mWBeRnuNkHa2nQuH3h4JWd2ISnHlY9TVC0SaZReMzZmX4IxMJbtW+nr24auA39fMuSfoB+fdsVVvAYKFAlm0DCNTp1oa+PjDw3W+HWKoNEYZBbR6jZ0JK3YkwZD0xBahhZBTnvbsXlaMTWKScAs6fUg2KMIJVK+c5V5AQb9kSK1o4bvNlz4aE0X4hl6c/F+k4itYfkVnfkF3ZBPUlkU9HG/FpmWEG6YrchUatVOZo3e2ycy2mZ0O2Se0Minfdxre7jON+tBtS/0XtOovvZ1LCyWIE+62DvvylQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7740.eurprd04.prod.outlook.com (2603:10a6:10:1ee::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 15:06:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 15:06:35 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 02 Mar 2026 23:07:41 +0800
Subject: [PATCH v3 1/2] dt-bindings: fsl: imx7ulp-smc1: Add #clock-cells
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-imx7ulp-v3-1-26b708aecc59@nxp.com>
References: <20260302-imx7ulp-v3-0-26b708aecc59@nxp.com>
In-Reply-To: <20260302-imx7ulp-v3-0-26b708aecc59@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "A.s. Dong" <aisheng.dong@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG3P274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::25)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7740:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3c7c7e-252b-4fd6-c686-08de786d4c09
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: nx4YFJ5cA8getyCRfFPWV4mSinwihjSDwec9lbUdAXxuS1NgPJ5RfEAGz1k7xZBExeNM06ZVGX8982Cld/AmD4UuqZKgLy29kiPnxj3Ju8CR8YSxTQeSGDDEbhucfydOoVZVpclrcchR3tIZzR1gmpPkG7skOt14LFeVG2nqF9K2zptdLXk99YdjzkocEq2dSN7gAdsJ8A58x0PeW4Hzw8B4RTF+tOOFlqQFYzzzTIWkvhPE9HeleayeeFKZZlVlPhXB3p1n0yX+A6ZnSsDgpDMSBlg93MSbX0QfZvpeto3fQsxY+OsWLBuUHlfQJ7WNmdotmFV/J0KUkX/hQ8gdtRvflehS0C6xcQ+T4CTKRoPaotxmihVKmlr4zNboX7XUPG6KE0VQLAlS7C9Y1wvd+Q2//SHfMf4FT9oNZ98cmh8wloMHbgjPym91Z+IH/Sx2BOhzEOU5wxhQfiV9T7CkjqrlcLQnAgRQuMl3jitRYQTt1TRbeTGj15C3Di+RTCaPYP19G80liVWisusQlFC1jiZ2r/MOWfUMfjZQhA1kbbDjY/sQqULkKpp4cAgBVrC7hJaL8bxA094MQrB+xEQk6dlR+dtL3miLHEOOXEJmemngJCNKkDInVUqYKVpxo9CQjg3l13SGq4Muno1q001VXtQzFuUqec8gDEfYVc/9CojKUN1A08wzvDSvRBN13QDwLKd5l6C12t8EiqWGe6wx9IDb3/FwX0aVKW9e0oUwo3Dee4qS1Zr2u5rc+hcxbi9Nao9zZJLDuijTMmth25SGVW8aQ6XaLvXHTVb1J0k0qp4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1lDTGwrNTlMdm0yVUQzYjRDWjlKcmhmRDVZYTZ6MVNnMXhmZlpNc3g5ZkE1?=
 =?utf-8?B?TTZnSWMxRnhpY0RtR1ZqbXRDeHVyV3d5ZFZRbmJTd2QrK1d5MVpkek9QUWlL?=
 =?utf-8?B?eWtOZFBjcnY5NUhPNTMvOFgwejZCV3BRV3IwVURYSVJKZ25LSTFOWlhSSW5u?=
 =?utf-8?B?c21Xa0g5eWtlcFhJZWF3bUVNYXR6eVFQOE5SMTIvTGo2d2ozN0hMUE54ZjZS?=
 =?utf-8?B?TEcrYzFEVWR6ekxNekFQR00vZDVuOTU5RzlBVzQyWnRUaStOZFg4RTNpQVh4?=
 =?utf-8?B?MExBU1phWW5ONWQySjJsU2RiR2dGUUpuaVlncFo5U3BOYk5ibmkxOU55TnRP?=
 =?utf-8?B?RzVLTUl3TURXQnNIakNjWDJDbVBYTzAzNW1wN0RtamVmKy9MdEtWcFIvcWNX?=
 =?utf-8?B?eFgyZkpxK1BLL3N6dzBzMU93U0RTMWxjbE5JQU5yYmlXTWtvbjVBenczbEJR?=
 =?utf-8?B?OFUvL1ZYakRpSVFOcm9MSHBtRHMxL1hGM2pxSnFXQW1leXhIdndWdGJFRUhj?=
 =?utf-8?B?Nm5mZkpubW04UHJFaFlxUmM0bXVtaWZvZnVWM2YvdGh6cEx1WVpiMk9xb1FY?=
 =?utf-8?B?YUpYTzBVeGx2RFgvZjdxMHc4bkhsTlhGQTh1UXR2bzVRU2duOWY1VFlRYlBm?=
 =?utf-8?B?eE8weXdBTEpFZVJ3NmlZRXhzYU9LL0Z6Znpkc2t2OEh0QTNOdkNNdE5CWjFj?=
 =?utf-8?B?Y2IxQ2MyU0d1QzZDUnRZQW1YR1pVcnVRQmxMcDBrWnJyb3F0ekFKSmV2Y29L?=
 =?utf-8?B?N25zdzZtbCtYMXNHNTVtcHFpdStDRjh4YzZ3a3dxcU0xRzNuN3hpSDBvL2ZW?=
 =?utf-8?B?Q0h0R2dpQU15SGtYdHIrc1dxMGljYWE3V1pTZkJoNHVFeEl2eStDcGRwdHhy?=
 =?utf-8?B?a2xXMC9xTDdVREE5QTJxTUZURFZwZzd1dGdvM0E0WHZYdWZPR3EvOW02R0dJ?=
 =?utf-8?B?dkUrMWJGVnVISCtZSGhzZ2VVMVdwNlgrcE4yU2lVTW01eXpKaVRxWnJ3Q2RS?=
 =?utf-8?B?elYveE42WjdWcUhnZTA0dFViNEI3UE12ZmV2SWZvU2Fsdzd2YkZ5bnhhOW9M?=
 =?utf-8?B?clJQek9ycytHWGd5SytlT1BpbWd1bExucktqTnljenJQeVE0Nm5KTWg2bTJo?=
 =?utf-8?B?eGVHcUMzanNPeWdhQVlHREtYdW14dVREczhYMVpHWUtpWGt4M0dsaHk2R1Ay?=
 =?utf-8?B?K2J1ZGNaOFlsUWFxNDEyblNxWXkwZEVpbWIwcFFaUFBVQ0J1a1dUVFNKKzhE?=
 =?utf-8?B?S0tkdmROaUNZVmluN2l1eFZJeVQrUzA3eHZKZ2RYSFladUpWRlFBTCtNRU5J?=
 =?utf-8?B?Njc1c09ibGxONDlTN1VrdUxMZ0htQ05xNEEwZkJHVGpVU3plVTdZczJ3N1Z3?=
 =?utf-8?B?akx6ekZzaEd6M0dXeHV2NXBOZysra0RkdkRkWHhGUmNYb1FJWVJoOVB5dDlx?=
 =?utf-8?B?eVhOd2cvNTNpZ2kzNGtEcUppYTgxTG5mOGpBMXU2WmdFdTdONnBXNWx1SmhK?=
 =?utf-8?B?ZkNDd3YyQ0VJMHJKNGdVSDk4c2N3NHV6NEd1WlRiZDhuVXRDdk5pSzJ5VFAr?=
 =?utf-8?B?ZzRKZlJvc1hsK251UFliSGtYZUp5T2tMeDdwMjNKNVMvNkhCeGNUMEtJTFRa?=
 =?utf-8?B?a0ljR1kzMStJQXpCQXM4SCttVVdKeUdSMjRFMlRrYTZGUDhqUW8zL0pkaDFs?=
 =?utf-8?B?VVBacGpDc2xaaDlsbHRKTG0xcFdtaHVrRm9tTEZjTmFtS3lMMkNkd1JGUENF?=
 =?utf-8?B?TmRhendTNk9qamVnUHlTejBEQkhwOFB6bWJ5WnFHMC9Ec040QnZMcnNLNnFO?=
 =?utf-8?B?R3hFeUFUSzZxMUlEeFVrUDZGcElqZkNWTHc1Y011V2p2SVhtdHROdm1lNkwx?=
 =?utf-8?B?Q29NcFptdEhaUVRKUDlWR042eGlTakt6VWozcTJ4YTJCZXJrVXRTMmhBUWZs?=
 =?utf-8?B?cHZBTmFVRmREejc2czNhM1pyS0dRWXZJWlRIaGwvcCsrUThpdHY1RVVvTWs0?=
 =?utf-8?B?bnNQV2IwSnF3UUVkWVpkaFlraDVMSU80TXlVdFh3cENyRVcyZDBic3pHeFF3?=
 =?utf-8?B?OFByTTRia0RmRzdXSWx4TTZhTFZpREVBRWQ3bjNRd29LVTUvd2ZEUHhxTzJy?=
 =?utf-8?B?WmlxT1NoQnlqU09rcDhzNlZmckFWNlRWalkxRjkrL1MxU28va2JhWXJ2Y0dm?=
 =?utf-8?B?RHU0SmVHcXR1SU5rcDJrQmpCeVV4emQzUy8yclhVakdpOERrczFlSk5yN24w?=
 =?utf-8?B?NjZreVpaclczZ3ZOZ3Jtc1BVQ09nZEJXNXVTZGE3TnZPUXNkYXdydU5JMG0w?=
 =?utf-8?B?aENKQU5jK0NFODVwdE5EYXdTMFRoY3BOWUFWQVdZS01ocDFmbTN4QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3c7c7e-252b-4fd6-c686-08de786d4c09
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:06:35.7374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84NmED1id0+4q5wZefoMSzITWR1ZaHY96gFv0h6n9Mg1chVQCxYRPAA+hyFOiL7mtx3hyRQ/Y0eJDdqBF331Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7740
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_070640_913541_426D5212 
X-CRM114-Status: GOOD (  10.40  )
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

From: Peng Fan <peng.fan@nxp.com>

The SMC1 block on i.MX7ULP is already used as a clock provider in
imx7ulp.dtsi, but the corresponding dt-binding schema does not define
the required '#clock-cells' property. This results in CHECK_DTBS schema
validation errors.

Functionally, SMC1 controls the CPU run mode configuration:
  - 00b: Normal Run (RUN)
  - 10b: Very-Low-Power Run (VLPR)
  - 11b: High-Speed Run (HSRUN)

These run modes determine the effective CPU operating point, and their
programming is tied to the OPP table.

Add the missing `#clock-cells` definition so the dt-binding schema is
consistent with the DTS and validates correctly.

Fixes: 8ba41d6bd9893 ("dt-bindings: fsl: Convert i.MX7ULP PM to json-schema")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml
index 9d377e193c123c7de0ec4db4d4a649ed966b2d9a..7ad470260c0d08bd1e7146ef49e5f60dd6c6d4d7 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml
@@ -28,6 +28,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#clock-cells':
+    const: 1
+
   clocks:
     maxItems: 2
 
@@ -39,6 +42,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 
@@ -47,4 +51,5 @@ examples:
     smc1@40410000 {
         compatible = "fsl,imx7ulp-smc1";
         reg = <0x40410000 0x1000>;
+        #clock-cells = <1>;
     };

-- 
2.37.1


