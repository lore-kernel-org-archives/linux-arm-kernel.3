Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41E4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KldhSB0pud6g1HW/T6ibVITtB2vGFP1lJ68H0tQdAU=; b=fiDNR4Ay0HmQwYgV5H/tVYsvTK
	2IkD7PmNKL9yCF+KsCJN9o/7ROKcqgVgNgZLMdI+55CrT2x3gnKJPTyr7gGhIMNE177OAZbAd8E0c
	5mYLdblFz/SyFcboPAbqVidtNHP+NjK2zmddNzfTez8VNg1/u6Ji2JSkrLQBC8oNegFhAjwKuFf9k
	7jB0RimMrhraK0o6eoVatTLIk7QIPcIGXEvVq9BsuxYdo0RT2pQYPeR3+1tka3w3+fJ3TMYNf/Wum
	iEnnd2VhaomV25f69ipDMtEFK7ef+HIU6ONoiLKaELKmpKqSrl4k+JjpqR4c5tQ6fJ/7F0wTyH6BO
	FZz0S+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRai-0000000FruE-3xw9;
	Tue, 30 Jun 2026 06:05:04 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weRag-0000000Frsq-1GfF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 06:05:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k0sXFwZt2MYj7ZVaPsoUJmF6yyP62rqI/xYJ6PJ//iApDCkYhm0OdPnhEDWpCdfYwdTV5dEh7boDioXHeeLIh7qkfMzJA6jU4dThVu10+b6QltUs2z9Eor1LWofZL3WPLkQ+n+xdobVH7q0Q5Pf2kZfVi2HHjKbOndg6wq8xFswdy4jga7aOxq5KVPQ6tLVupGwIy3uWpreLE0FizomMtWEj999lQnzC8c0w0+mGLJlaUT+2Cl3Z2kcwSQwq1b0s2d8y+Va53P8WhVeSlbfp6HQTYtzkwLaHQ6lueOwG9mWCZWibsPCTyKDlA3ClRt5iocyFySKz0XNMq3N1x6e2jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5KldhSB0pud6g1HW/T6ibVITtB2vGFP1lJ68H0tQdAU=;
 b=F5Z2wwHiyqjA3bcMdMUxnpoIJNcByHWDnuGFyTMI8PxBQQ1oe6fGTNtWfb540Uk9s5DazsBmnbZDiAZDiLdCuKraXRuoYhoL7mCBlGTAZO64xZ4EMdcUs9RK2Gdvtww4akAgr5tXbjBDjTfg4CTJkR0Fy5Yw0KUOvhxPjCJobg/M06uCwqHILVscd4Yxp+x0DwwInBNffu0eAFgv5CidNDSUWJPOuCmu50cuvVwBFckhPgjOX0QshFBGrZnF+4YsqaiWphoxFHUUsThbLnlaavwSCXvHjY6WlQyJ6LGpv9c9MniWs97pnuWDlp+vGaNbZMENeQizFqrJSwXMCTWGaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5KldhSB0pud6g1HW/T6ibVITtB2vGFP1lJ68H0tQdAU=;
 b=Dp/KQ9SSjdh098Wpn6I5k2YazpGJAnaFmqtar5Y+u5/Ju093+6VnJ/B0S+WK6ZD7PWWscUFCUholuiinY90MBQIcfTHyQKzN8k/aXXNXHn/ANlTKyjMvKEvW+hUqWKmASH8NxFbKMFe6H3XFooRRLtdpyeUR3PCqp4pJsAC5gLoOLuwUyaCqYvagdV+b/nmHWSop9dqDi5RZ/rxuaFh5K3iXcDvEXqRPIk2OmYTzOJp2/mlVpiagn7eC/E1MamUta/DM+y1Hsr7Qa9MxjO4pOErvT9sOa83X8a5G4Tx11zX7XWI2KNvxcUejsn6U+Z7LqLb2IcU2KpvMUq5b4t4PNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by AM9PR04MB8748.eurprd04.prod.outlook.com (2603:10a6:20b:409::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 06:04:56 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 06:04:56 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de
Cc: imx@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sherry.sun@nxp.com
Subject: [PATCH V4 1/7] arm: dts: imx6qdl-sabresd: Move power supply property to Root Port node
Date: Tue, 30 Jun 2026 14:07:04 +0800
Message-ID: <20260630060710.3294811-2-sherry.sun@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260630060710.3294811-1-sherry.sun@oss.nxp.com>
References: <20260630060710.3294811-1-sherry.sun@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|AM9PR04MB8748:EE_
X-MS-Office365-Filtering-Correlation-Id: e3950daa-9278-45c8-e692-08ded66d82b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|22082099003|18002099003|56012099006|11063799006|921020;
X-Microsoft-Antispam-Message-Info: sjA6Cfv05Psg6lphoao3CoiuD9L0na4x8yE9bSBFArc3o9JoRe6Uo4bTzavJOXbGUHayvrNjvhOIbEm7+XDmMozr6lsgevSFDwXrlYZgUWef6WUOET0ZJrTRrXBpM8umfRD7KxKhrB2f1Zi6rjPebwPl2GsdR4DN/lAtzQniQB6/m7gt3qaNcb6cGTa3ol59y6NuFx2fpJQziWO0DEETViKKCqP1niqAGlpEH9QcFxHLzLvOpcndIxv0x9rc9PBld976/roZxjsmZviuLqdixvoAjPvdzUGACbVDdbkKQSG6aVFYwk1rxBl/gVIyeDrCfHcmUY80LloemA/mqdF7NmhBfHPYSgyNA1AH1Ql05qQlSSUb1mjGhe43MkSuh8zGBgyxkNcy00qBfXvDwtq/qcmN+TiK1QpfFxoecxXWo/2C9Q+rPyoQrp/m/XA1Q78lPKjMDIaMJN79maB69uuXlvhGYs1C2B42Vgr079P3hd966TfebC4WwuHREeQWfDb/NkKnXsOYJPYK+4jDgcq/HHvS7oSUADAfZ+ZJwGaKzbOBZL7Fa69t/Wzz/08L8tvKLrsMm3cuWX+pVlsZv12CHNQlOvoY5bH5+pzXk6GqN09b+nmOjUPXAeb1dNT9bRia/iFK2K58gFdORGVzkvkilvo9f4wkZRW+TA5wCf1/RPG0aPR7yWlv9LEwTSV0O0iBhsAn2Fv72yFD89OhwzVjPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(22082099003)(18002099003)(56012099006)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iTmaYBpmNYcXsw3nYZFZx/zisigKBuYPI9Tsrv7JJgce5YKwyDET/sTn47Vu?=
 =?us-ascii?Q?RLkhMVWWDfczX9EfWxaQgkgUgiSboAsKD4Uby3JsAqL/xFj/32nyFBQC1Am7?=
 =?us-ascii?Q?iTJRfwaMbeLHPAEeJ5NZcBjdJmmYm4EK5PEG7V7Xxc1ykHJw0+jWX0nWyrHv?=
 =?us-ascii?Q?VSJdEN4IyCX5sVGoUUgmU8TSb4dfljXA6e+6m18k6A3o9cxHhFK/fgyx05H4?=
 =?us-ascii?Q?dljYWcJNMlxQEyeAJ8RcbvawfCxCnBfidHNCY+QuAGXFiacwoQWWedL+R6bF?=
 =?us-ascii?Q?2NHXQ7tXkCAWbGzAH8helm01levu16fm0BnNEgJRHuVLjHQoWy70bGJePAER?=
 =?us-ascii?Q?9Fan74O/i3fAhuBoNa/b4Ab+77OGBX+IncyRGeu2sJLXiXkR72uSRkKe/LVW?=
 =?us-ascii?Q?rpJzcbE81yd0S6On7cjEUzVPRxyg3i1hIKSuumu3KcUwFFKnC97RwjH9uVqp?=
 =?us-ascii?Q?L/bahGlP3vl31ZNG4rMhLP0FOUiFoA9mAJbJDEHC3XSF7o5lFgwTmzgYdrB3?=
 =?us-ascii?Q?rvjfMx22ICDyBenUUKfodGpOynNxqJvSfQY2YqHgnfXLPhf6z10feIM9iI5f?=
 =?us-ascii?Q?dc0KT/THdbWWBxxOb/f8+6QncE+wzPk94zU9sbYL6t5xRwHGRO5lH7UxuuOY?=
 =?us-ascii?Q?qfNcQz1HFMXVkEtg9XnCIgHflL1y6tA5hKRmRPB5H1zpRYzQn46XAjP/Xmmc?=
 =?us-ascii?Q?tyX8YD36So5PvTbEKGx3sS9GeyMxBM/oyMCmub5RtIipD2lUVOH87piX/5QS?=
 =?us-ascii?Q?dAA8wa7y7kgYblNUV1iQT1tX79trbTdwz3OcgAbHsD4/kLCp9xvRMWyPkA8k?=
 =?us-ascii?Q?inQlRMBzUR2a9eGx4KWqZXQG7ON06z4jvjW2oeox0khJz1V9G4IjR9L1QMp9?=
 =?us-ascii?Q?xoB4Y3obX0O/tpKHTUEu2nyTMAHoqa+ThLh6dj54V04SRo48bwPRXB+uZIGG?=
 =?us-ascii?Q?93YUVJpSh4B0y+PjFqFEdrsjei/nRHY6mEjOm8iE2WK2yi9lCeSzSaGCbGS7?=
 =?us-ascii?Q?dlqO0icKFMU0tP5f2jzDZ7dpz3j4PYe3dF2a0+fKo8x46y2QZ4hyEmfd8V5y?=
 =?us-ascii?Q?D7U8wV+kuPkI0cPtyHIxyyo2R3WAN4YxGZf3bUXUwpFSHw6okrZUI8lwQu47?=
 =?us-ascii?Q?Ae8QLBGMYd5ufTw8IAsN919rTRLhZt4YJT/AexiFtd7yR22VZkshWYhTH39e?=
 =?us-ascii?Q?3P4sHlk8+bq2S0DqeMVqKpvWbCv7/CDvbwOwdqB42UwniBdMk0m/1AyYCW2v?=
 =?us-ascii?Q?H3OsQ06jmAMNdiJPUIAtnq+E7RKjO/rb1vj6/rO1+sYD3kdFs38ok94y5J9I?=
 =?us-ascii?Q?jbUbIRSQw7GulbF0jhN0lW9DuAePBx2M1o0cknEyldHEGUpEH8PXIaLh+l8f?=
 =?us-ascii?Q?P5m0mFEHB1u75DIENMUf3+DSmDA7RE0xNUfDlSw5YGqcFNVv6VvHl7ilJmWf?=
 =?us-ascii?Q?v2S9TYcLgJ0vwMPD+3pqozCbC8mBSgy3NJfIK2Bo1dr7UcAYXdftWEvIN1pK?=
 =?us-ascii?Q?Oq1rPqQ26tBvwQKjTx/yy44bxIlCkVCb60DZNur1WeX2S0EfJqMGQWwsoa2O?=
 =?us-ascii?Q?2A0LTydpj4929fXPFzMaq1Zubkc9GxuJJmhrEpWKzeJE6Cu9JwwrRjwymRDA?=
 =?us-ascii?Q?sOgnAnU0rOA09p1KxLZ9nZHWWvVtFvg1TtZ4fWchnPgzeUS8CoaYBgtkQYwj?=
 =?us-ascii?Q?lG9HRRYCmAU2NH8g7JH1Sqvqw47h8n8xr4QVOY3EK3SoTjABnHqE28x4hJqn?=
 =?us-ascii?Q?o0IhDdpvFEgdDNNjed7JKSuuKncrPcWn3Dx2LcVkIIs09At0hMaJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3950daa-9278-45c8-e692-08ded66d82b3
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 06:04:56.7513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+0G2x+GBMsmYMyDQN4ouNFIkuGconl/GA7CMSPK9DIuqrLLiuueEli+ydtMETG18t7Jh0DB1ncrpSo9LHmTUtId8aLubAq1P3YnKiEE6tluBsjAhWeNPK9lrifXS2UD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8748
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_230502_351126_3861DBF8 
X-CRM114-Status: GOOD (  10.72  )
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

From: Sherry Sun <sherry.sun@nxp.com>

Move the power supply property from the PCIe controller node to the Root
Port child node to support the new PCI pwrctrl framework.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
index fe9046c03ddd..c52b8897f999 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi
@@ -756,12 +756,12 @@ &pcie {
 	pinctrl-0 = <&pinctrl_pcie>;
 	/* This property is deprecated, use reset-gpios from the Root Port node. */
 	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
-	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
 
 &pcie_port0 {
 	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	vpcie3v3-supply = <&reg_pcie>;
 };
 
 &pwm1 {
-- 
2.50.1


