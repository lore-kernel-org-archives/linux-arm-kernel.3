Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4D0D3C912
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 15:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YWJ14EphM6Mzlo5mNPu1/ywx/fwyBx5UQXDQMmJYLa0=; b=4m1sOZDYA50BHajgKP6jM31S7/
	D/B148hnzZhsxpmy7cQfuMMKiQxE9lWlFz2GsIwRVvB9UUYEjN6NQrLdwr7kjy6n+0yCgOV3o7Uhj
	zWa6F8QaiwBz013pWm2nbgFM05O7f9g1nXREgfdCsV/S3K1inPWtvzcDSUZdrlAbb0IS1105lh7Dc
	NnSXG2X2ZEirTa4yVGtZUloowL9tDN2N8PZ0OLPiMyocf/8Ti+hKJyeVwAOD/D0lDL43U2aJ9lobu
	Ymy/Sstxfmchdc2eFTbanUFBkk2b9LS9rjc8RgIDz7PKliVtt7XMorXhQVN9SUsEEfAcFRmNT8Dhw
	NXaL8gEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTLzJ-0000000FYHl-1v9q;
	Wed, 10 Dec 2025 15:20:21 +0000
Received: from mail-westeuropeazon11021111.outbound.protection.outlook.com ([52.101.70.111] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTLzI-0000000FYGP-0eoX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 15:20:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWmF/x7mQghP7vE65hoIAPOCNQKpDsOjEmL+Z+13puK4l3Yq0aVO//OdfW6oeBkpvlMfCNVOCEKL02kZOzAtduT5PMDNKMdwbRDMPe/TjCWpyXNCN/X+H/lrHoJonMFM4gXIwZfU10u1TETUezL+f7Jva/wrlQoFDqnEke3bl1sCMHtT6NtwX4FdPbhC5WFgIlaY1GeGcWGCxS8envJ/lnRsRLbNU0fGeJ5RWnWqhTZ5XmpDzGitwdBa99/ZUWRh1GRVa7MmPVHO88+3M4C8MBQT67Wkc+v9oWvDMq2kwEfEuP1TvKXNgrsgjt7aBWbN2No79JagzdXG28804WPt+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWJ14EphM6Mzlo5mNPu1/ywx/fwyBx5UQXDQMmJYLa0=;
 b=dT7Esmkj9e+83yMWWdjHrUxe7c2FdzYqZK2yihCnqm/1A9+s9a4+LyEUAOA6w6ptxkjyjtOMEdd4jRUYHJP4WgZf1Vj9ra4TfbMssHnul6KiM501xwLHWTYfq7hBkkOeI0mMchAQ9aVGR0P69UMoHA4pMidfQzUJmT+1Uzi0SeimkIvu6T6/WBptXaR82Otfdiyisj1iLhhrtNGP4DPOFI9dlCJEwhl+o/asK7inMpI8QWB9UP+tp7inDh4KlsMEBoBT0o3AQ+5F2BWAIp924R/k6B4L2On07uQtNm7Yfc2uO1CDSmbduTsdjVlnwXw/P/uMtnB1RagXwGcbGsdKmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWJ14EphM6Mzlo5mNPu1/ywx/fwyBx5UQXDQMmJYLa0=;
 b=tECybPnA+7kK0PtYDISGBOzTvCv2KG7eUVX+ifjmF6AtM+wF4PCNpC7KTNJyGq03MpeicUMG0cDuGx/Uvh/v5q75i/fe0AM+yBjO+4vcZo1mN+8+4jUtD3CNd1ty/Ukpfq0JI4tM3Rd7DoAWUt1LUaT/GUOecxXMvxf5ZeeACS9UO0jKsNCvaMCpSWcX/A5tkmdkpu/FnX1D8h9VoSFtGENujRkGy8Q0YZQAS1GkVkzXKFduvuXxgGq8SkG+Q9VFYLIpZnCzyrV1whZkApTA8S+src0LQGuhHRn2lWVsQgjSc1YbIGH2DKa4J36eJlw5qCcr3KCCrPE9rNNde11g2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com (2603:10a6:10:3ff::18)
 by DU0PR08MB8347.eurprd08.prod.outlook.com (2603:10a6:10:409::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 15:20:08 +0000
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824]) by DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 15:20:08 +0000
From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 3/6] arm64: dts: imx8mp-var-som: Remove UART2 console
Date: Wed, 10 Dec 2025 16:19:55 +0100
Message-ID: <20251210152000.42265-4-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210152000.42265-1-stefano.r@variscite.com>
References: <20251210152000.42265-1-stefano.r@variscite.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0080.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::13) To DB4PR08MB10341.eurprd08.prod.outlook.com
 (2603:10a6:10:3ff::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB10341:EE_|DU0PR08MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d142998-b12e-4bcc-1882-08de37ff9a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8dceuvw4Pdphzy5EIgYO4L0KA1a0mXBV5JlUzZCirMmU6yhP0QeiBsaChMzY?=
 =?us-ascii?Q?JRNkVXTOZXT6cJBfLOXSBtYecfSBsYhLs4VdCVsNSSnJNeODkoJuNkO5M0sF?=
 =?us-ascii?Q?hjCAR3f7Gzq+gkjPjuzSme3CPiNrN0kIBEU/xa3ZJNAeD6PiPNGlT9Ef8gja?=
 =?us-ascii?Q?wEKWnob9wEZttmR18nK38DIxXo1/A3WzJ65WKNWAu5uXacn+IWLQ3Ois6/EZ?=
 =?us-ascii?Q?QkLh0bKEr67digWa4A0TXD067l6AlvM5cGm/80tBWwzphM+0pwd6dpxqG2/p?=
 =?us-ascii?Q?0QE0DBnfWrqZeLJ4NyEQLi9kWd6wJgJINgPmKfeuv0Fpv36b9HwR79rSNZVl?=
 =?us-ascii?Q?fxdbDFSLEfyeXda1VuFdh+Rp2w8NQblq5dN3hAscEUqv8LGLBV2G+V6c/DOV?=
 =?us-ascii?Q?wtYCnQ8WgxvG+/hjZ3GCr575A/5E18Yky9SAPZbG4kPNnyuxyQx18ncctH/J?=
 =?us-ascii?Q?TTyiilmf1gVioJGktC/mOq8eLRMRGtWTit3RZPw5TqBn26yBfGXlFap84KBv?=
 =?us-ascii?Q?+oD6iL4+6mEHboC9EPnNQ/qjtDDoRfIDenVNQCx/wGZWOv4gZ+8xhG2BfVcv?=
 =?us-ascii?Q?u+zcgj9OBnujcnsNDAbg9O+hNsKnoOD2bUlj7uiup9v5Q7irU/Ks9NT5mIEr?=
 =?us-ascii?Q?19KfrCnNtUVRFbL4Z1AUdBPV40l7ZeTikeGTFqIjYp+MkOEhrcVuMoCoE6u6?=
 =?us-ascii?Q?FMp0n8oMGHXsqg7G8FtZBg7Sk7ZFc4GekGDluzyc/2AHoGd0809C0h7rfDiH?=
 =?us-ascii?Q?rM6B0fupEn7xcLJgzQcK0cfuFgovWEd6KSMz9pOSFH/flgQ+EuFefUzT+j/8?=
 =?us-ascii?Q?ouJSTGBO1RSbYSlE7IjzZ8mAMglB7jm0yVxMkL6X577qyYPW+667Ytj1duRt?=
 =?us-ascii?Q?G1rYAHeH9kXWLkluOgJ7mUqHShoX1mC0MWsmzVR3pmEYSV8ggUe0cUl5bkFU?=
 =?us-ascii?Q?HhA4TTyDZU2gg7cQa6/DruYgq7RTCKhtqu+VNU3MljeBaGd5TGLRh7IB+tEv?=
 =?us-ascii?Q?ulW2QZ+JFrcbxZqp1YrPkcXSxWCx9g3zkYHOaJH3E5wdIo4IiCsqtt3ITZ87?=
 =?us-ascii?Q?2nty6a49zIjHBjEQu1MW/B9/aLU6nFQjG1Dwu+5YqIlViNQl13rA2s1AsHpV?=
 =?us-ascii?Q?OLC2HOVGKxge4SHBIvtTAhKu9ZBjF++aDRdcEb+llVP9sDZRoELjERcBoQ8x?=
 =?us-ascii?Q?xQIVO8FRIR/ecsWCTO6Rx7owu/lvS2ogOqgVxTDQ5+rVCJuKYDv8LhxC+XHi?=
 =?us-ascii?Q?XPHXASsvvf8jnXFDjQImAI+MpcU8KeXTWs2KXK9CTLA9gjN6an/qRB9CWFPx?=
 =?us-ascii?Q?6ZFj1YrwDYAAbJ4WoVFvLpd+PtwdnCKbcReePAvQTGqDaA4yEZv4lHn/vKKR?=
 =?us-ascii?Q?Rz5m4MNK+WbwcYNkaXesw90eGZ00TLvN1CWMbpkMZYGvBeq50pFMkHDmTqOO?=
 =?us-ascii?Q?ZRfA548yGJT9k8hAnRPPMx3PavfxUezs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB10341.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GtJ1YwLr6zIlnXmtVVBnC8Hwf997Bzu+oL4GNqEQuCav8mHWSUYNBIvsVfQ9?=
 =?us-ascii?Q?oqeI8qQ5tsojUqmktkXUxYcUuByQZfh2/4Z4D8G3NOmI7a5zGWUIOAZjfU3e?=
 =?us-ascii?Q?02zLvh7p/0cecbby9HiQ1rNG5dduP0rqvU7BLn+iSq1kEcQjTHYiSuCs56Md?=
 =?us-ascii?Q?h9gZ0zHOp1mV8K4Yvdb1KpWd9vHr3VxJVEancGk2vPWEtCeD3rzOOBGZKjU1?=
 =?us-ascii?Q?M+8z604MStqP/KHQNwypkz8iRAtQsCaQksb+ubfdtDIZlotPHcvB18boeWQw?=
 =?us-ascii?Q?UpFN/ZQOREXIBpzQs5RCqPt7Ut9S4/4COELiejv+3vHZkfRyPGGMHxFUCg5x?=
 =?us-ascii?Q?rwkbiJtrMeOE6TD5Y9e4l/IG8cyAf1PE6ivk0UXe+zpwuycL91KNDITtyyhw?=
 =?us-ascii?Q?4cbj1QX6jZDRXpLH5+O+X7fRhkf1r1XEThS7K9lOAP1fAQqwKAO+1ZIkue0w?=
 =?us-ascii?Q?uUwwOV4nYTorgRg49B98ZaJhEDPSp6/XkmlAKgIe5/0CFH0d8Ew8Wi3QDDqf?=
 =?us-ascii?Q?JjwdmrRJHqPnDePFmrASF5eHIh3CYYq19rP+BKbA2Hx8mBcAJGx0lR4k/ofS?=
 =?us-ascii?Q?dnGNMxfXwWMAsv6FPmI288gLiwTWzgfOl+NMY35HXQzKjFUKNlKYx1lrK5aO?=
 =?us-ascii?Q?CqaFnr/c8/MKtOeca4EtiJZS/LYw9uVOkHWqOO8QohxjEx0+4dMMWObd8dvN?=
 =?us-ascii?Q?OhmBROy42xUrKWplTZKiyBvNVQIRSqL/GN1AJ9wHLVAaOvGX6iUHdgtc1vT5?=
 =?us-ascii?Q?bbFe96UQ4JLnfy8OgtW+MpK7+9VNSv7Uef7I5JRDVO5iBGQ5uIrB8TNUJqrW?=
 =?us-ascii?Q?fU/VWrSTQXijW2Pe/yOi13z6uCK24JTLTYRLn/h2vWxge0YG1Ok/cagQhV4o?=
 =?us-ascii?Q?DJMKWHcmJbVRSwXtLXzqusVsCoI1/16hZuX9EvCYPcxEkc25wNZHfxVGWoYP?=
 =?us-ascii?Q?enVIK227s+JSu+CySHHnDuwT0WhxMrqlprhrwYQFp17kQtTNg/FzH7ck+LKX?=
 =?us-ascii?Q?jFhwzhlMDSFEWDAH1RMsOZ2F5BzTuKqUyKsjU8JbWCvYQPMzDp4uPnlR93Z0?=
 =?us-ascii?Q?n+yCIIXogovdiYNDFQetHbX24y6m9URSi2Fbpjjx1QRcx4LJXvCoWqx7tdOd?=
 =?us-ascii?Q?1rRf25K5tpwOcQnVKYIunjw+e+/PfzmZ9j0E8bbMLUyAlOLaPZFm1tcUoZNz?=
 =?us-ascii?Q?d6IApwgWh0hE/IMs02ZOlzrre34kOM0XTr3W5X4YuZzOvuPPXNwwa2vb8ri1?=
 =?us-ascii?Q?Mdj3ZA3dvFMillGum1LXZtynC4yPYzCvMrxYjU2G5iFEtB9t0f+oicxcEJqR?=
 =?us-ascii?Q?OoQiqsANBM/KtISqu9ETr1ZoJLRpojKlsaLzun8XI2T1KqrNzNIoJfVWbcl6?=
 =?us-ascii?Q?JUfGgjKh2HSyE7jxxBAl4LCW6kRNPpa1xShbL4F912JI/2PoCX/nNrGp5zoD?=
 =?us-ascii?Q?WqMept/XabCLbDgOd1Y3PQqs/osGl7d5fA8zbAGAPYIzTnJxa6Rh28OmEhzC?=
 =?us-ascii?Q?SMLt0Qovurc/GPELcqb/ieAxWvQpSlzvqiAj6w0QtdUEQuOqGG6QLNL4OGVl?=
 =?us-ascii?Q?hv5gjYDmt9rcPVKfWjJQUNMVo9BKULJbrTMdLTgr?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d142998-b12e-4bcc-1882-08de37ff9a7a
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB10341.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:20:08.2454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xn/qgi169qGN9wGsIzA981TU3p4S9ySxOCO3mNlmgNLcow7pmyDn7kibWfMY/vOVrBcL110jmHM0WN1jE8jXtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8347
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_072020_200116_A902B95B 
X-CRM114-Status: UNSURE (   9.76  )
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

The VAR-SOM-MX8MP does not include an onboard console connector. The
debug UART is provided on the Symphony carrier board, and customers may
choose to expose any UART controller on their own carrier designs.

Since UART2 is not populated on the SOM, drop the UART2 node from the
SOM device tree.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi     | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 158a78ec9656..5bba91dcef17 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -15,10 +15,6 @@
 / {
 	model = "Variscite VAR-SOM-MX8M Plus module";
 
-	chosen {
-		stdout-path = &uart2;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0xc0000000>,
@@ -206,13 +202,6 @@ ldo5: LDO5 {
 	};
 };
 
-/* Console */
-&uart2 {
-        pinctrl-names = "default";
-        pinctrl-0 = <&pinctrl_uart2>;
-        status = "okay";
-};
-
 /* eMMC */
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -267,13 +256,6 @@ MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
 		>;
 	};
 
-	pinctrl_uart2: uart2grp {
-	        fsl,pins = <
-		        MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
-			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
-		>;
-	};
-
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x190
-- 
2.47.3


