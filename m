Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332E6FEA82E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 08:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tB/B5eCZzUOV15XNTpU2uQCMulu4NiL1JRANB4OUz/s=; b=t0V2/Iuu2SxbeFXCjutAOXnDIG
	bWdVeyz641cIIxG3jnH4xiurRky1pMXzn88fj1WuQ6WmUbM+EMnDzGieGKvoqgPV4jd/7rfzBxDBV
	VPoSix2dNXPCYORELY2TvWtEEcjSkNt8hW1eGTxWMF16vFIcsXpTDuOrtKLb6Dzjhqh3nDfNjJPgw
	glR9yIdSFWsy4gd+SghD86lknl6pxka7xJEzCNisUKbSu59eS4hZjvz8XI4gD7WWzVw1zJv2ovk0E
	tCqHP0ju44liSNEZVw/WnE3ApfudQkM6PAjmLntaN47J8JNFtCZwpb/nX7dlm8ONuWj64XgpIZJ6I
	ds0Km1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Jdf-00000002x6R-3BJP;
	Wed, 25 Mar 2026 08:30:55 +0000
Received: from mail-northeuropeazon11010004.outbound.protection.outlook.com ([52.101.84.4] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Jdc-00000002x4H-1Neo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 08:30:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VyfX9xGe0/j3zqkiyzmyS2EocYmDom3GJrdbfYs6dsKPvwFLxKxjtu7YZ+VxHE0iJT21R82E46xBgPKaHIXbtmsFZRHj/f41TQbMG477/FahEzUUNanTLC1tClqEtj8QBPdGW7MYQcH7wGboO92fDZSmdD1fFw5n2M5J+6sTpuUVjaZAhCDw56hKdiCZDPGmjkLH3dyxd+YnpjMrOwn5GxooqZGPccft6qq0ZblZpGSoR6TeOhe+3El+Cg9VmjfsNZZ+2OfZhJMocJxkFGZU0Yy/ovtJHnYZ2c38wYk82nTIzj5WDBGN1c94L9xfRNWdw0dIBpjdM0NO/Y24N1PlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tB/B5eCZzUOV15XNTpU2uQCMulu4NiL1JRANB4OUz/s=;
 b=H2Q3wTE6Zf7kClFvOfHAy/KNuBtHZP3adnMhfEKTwuzq9rNFv025qxan38cvszNxIilQLMtO7O9+VXtF/HDtZghKnPmHwytXA7aFCYkCK+OMk5kv7Zuags/acD2ppE9Aqz6YoFm5v45ci2YCMYb5s+d26jP2aJSk/13DrPYS0lD8nd6fcrAe6Ga8/xd/CGJhmeDNxTuFffwl3FXo2GA2zFuHQd2rzFQNFbErqHfnCEn+AhVQhD4r9+ugBcFgjL8eO7HThg3bTM7cpbrol2RpbQhwz7XwhpE83lysLaL3C80SXAm3opTtFYCjsjn83Qwh795PIWoiAxZyEG8I5zgU+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tB/B5eCZzUOV15XNTpU2uQCMulu4NiL1JRANB4OUz/s=;
 b=L24xP6Sn2AkhUrqbKTn00B72ggulpt2zNeBE8kemELaMymopv5GwcSJPxzb7ADDonmGED1pZepEVPQDn19Uv/w6ob8Q7jD1BFmlECBlcNxeqXzVvBfmjdU2cGUvULz3PdCcCxe2/huFp1/wdttM8IgMP7pBx4iZ731BkGL94xS3jL/pusHHm6VHzsQxUIcI5m0JjOBCTLmNyG5rx8LHvyhD3OMAs79DCM9tmCHH84Ir6oc7csOjFMptk7oBjpNnWfpjmjHsFgrRvT95AUNSEqG0PBFn8pPC9tUgFhy1Jr7Hh2GVD4jC1AxHK+mR3QDbl6D86b6cmcbiYDYkO9c2cFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA1PR04MB10723.eurprd04.prod.outlook.com
 (2603:10a6:102:491::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 08:30:49 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 08:30:49 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 2/3] arm64: dts: imx95-15x15-evk: Disable PCIe bus in the default dts
Date: Wed, 25 Mar 2026 16:32:00 +0800
Message-Id: <20260325083201.2637520-3-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260325083201.2637520-1-sherry.sun@nxp.com>
References: <20260325083201.2637520-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PA1PR04MB10723:EE_
X-MS-Office365-Filtering-Correlation-Id: ce8a6742-5aba-4745-2131-08de8a48d181
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|52116014|7416014|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: tQMpFp6OXLcvrrGrEn7Y2mB7O/3wwJlU8fDYeelRCtlRjjpT1IKZSeT7lMy8QbTO1iSd8wVG8p1ExGjS6jf3DeGc9snFMVx5xn5EFq8pW2tBWd+buOwJg3/Aosk3YqToNYi1TAWZQeD1RBN2Il3ryOaioY5E3ys2vpdwTCmNT78USB1naSabSlRQDLvacETTnVSXPw6QWy1lpR4BCa5EtVpYKNH8TYsOeqOcPL6OhwvfDdxRWZMUncGFo0okwSzZk+5XWs+kPJqc/IjA0jKBvhmiYTFCM31WAWqF6OY+47uFxRMtJBJ8cXr2XZzpDXD7SnkdmM/R4eGDuywsO7qCxQyrQrypVOFjoR8U/a0o2WgqBejaE5fl+c+bIflFKcJcyZfpI59iz/Uzn5MzctmR0INZ2OnxD1XgG5yAjOdDF7wBAhhrHCC9cSe/jL++NUFcq6xbTHrZEcAhqc128Q2wJ75FGNpnok9n/bXfopU06Fqv6HuDZCqyoUUVAMClbNY2j2rj92CGYNc8oPq+40/RiN8qIv4Ar4wdwG9VbAgra7bgNp84XIPz25ndWGl618c+JEpcdhWvkjKxEh3s+2lO6BGNjZr363DlY5g3SM/zUrnvyXK2OJX2BJ+V1tff5ORQLkrSdeyGEO/2dGSORjM9rXuGypx6FXX+yODv5e+Re47Vr42H3swd8d/XzNjNMeLJ0KgYxqlbKdZzR8jxe8k1zrn9KERW50SXPASw7FRiUPf9jLv4MmqUi92Yj79gig24iYtIYvvgrVvnt+R+kcCkMi17kR+NK1VtTJ3uj922uJM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(52116014)(7416014)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UQwRBPK+xUosDs/TgdQqQaKKtkTOWnc2OlsQtkBUAR/9ReJ4etNq3pO1UJ/h?=
 =?us-ascii?Q?tjV986ryP9FDeweMRsKJm7cOJd8G+1onPzvhs/JPQrK5nnbTlhGb0OMgufJy?=
 =?us-ascii?Q?9f5tEXiVwwX8YMRwQCn/wKiHqhng1ZV87kFxMGZbARkD1l0o5dT4ELegQM4+?=
 =?us-ascii?Q?huNuYA3cEaxKUh5o9dYLlEaEq83GuTn404mj0t5newDUUvaQGGES4US+DDTr?=
 =?us-ascii?Q?8v7cav+ELF5s8XmiXM8aJcQgtfKgX9/AbzWph8fVBFG7vrSZxGlRXW32IFvX?=
 =?us-ascii?Q?bJijaiEuoOrR+FpDih+uCs/CD3i6uUpZHmCsNaXNXJbYU9+MxK4WgVwruzrm?=
 =?us-ascii?Q?ULkRP4HMjUseSIxIGABo7VMRX5AfqWxBQ+6B/0Lo9csr6SVSV6vc67oz7uZK?=
 =?us-ascii?Q?FiuhI/rNsrGqdLaZRTICmsOjpeA3Q4anyGp6JyIahQDaDyjVAuIYMQ5MB2xS?=
 =?us-ascii?Q?zuKoqvXmzeKKIiKBk0aWLFU61bjhmnwZzm97RiTngAcCKS2plRWb0K/bTfbw?=
 =?us-ascii?Q?4l/BrXSB+rDlQd+FMXhzEX8nAcUfasuCBn2Q0Sq/6uadFNYzIh6lvF6dByhh?=
 =?us-ascii?Q?XZm6YwAYk6i+l205cevztkjI0nh9mSV89u2maSGI7ychG1WixWoXqVtPtNaM?=
 =?us-ascii?Q?pIotOrMp2Z5HXam7uKLW+GSlcRPrCdFS9R3nOychJtIL2nyDvxJ0Qz6DHVJL?=
 =?us-ascii?Q?6/XMulaQ8CXAiGMNotWpsWLH8/737ATovmJvNxodVP0W7gh9XCPqfnUJIGB+?=
 =?us-ascii?Q?em+uxDK931beqsS8V+ecJsalVMm3Hk52zmNdaV/igW/onTA8loJF8TjZDD/W?=
 =?us-ascii?Q?2awWZGz66Rzc6y+R7zqz6hDPZlxqCj7Ejo8Q/2Tsv2D7sifwi8lbVhiwG3ql?=
 =?us-ascii?Q?h0kIsidCe6Rr9hh4h+xPxQXPWSy/L0DV1lXd9jEq14bch4Rb/ry2/9mve8gB?=
 =?us-ascii?Q?Zsi+rXGFrUCUKh7jtgaU5CC5rJ9zTeUvQQoZHq8RSfwlPpQ2TrtrruRRay89?=
 =?us-ascii?Q?u7kPlgbw4UBeN2B1XiPIKNJh7QILlvL299+5tdxtiSPHzul218rF7kc3Inyq?=
 =?us-ascii?Q?pvBWI4NpmJHZv9IrIQWM9qSfC9LB5E4dCZ2kgOCV1Pb7VZkFu6dPiDg7Pdzl?=
 =?us-ascii?Q?B7TT9D4JvClPxmgZUbqBfyhK9WALwGN3Qg9kEzu3Bza4Yj/fVSmONXPHoD1u?=
 =?us-ascii?Q?0hQtseCqQi+AvYBD1gAS/ukLuJBucI/QStRMCGywMChQlKb+14sGGy68Ri40?=
 =?us-ascii?Q?Af8rVTDBeqsZmTi3YuByMyvJSIji/0PT9do17S4deovm4SDs43M7USBxaAg6?=
 =?us-ascii?Q?WTIgVUrEvToHixubNMDANcsDr18OeXr5Z1kaaquL6y2LHlB7/3vEbTFOv8rs?=
 =?us-ascii?Q?o0zknn+PAQ/PIkdovTqO9TmANowlo3GK7jwHpwgeHBQDRqgME7tPqphZBgT1?=
 =?us-ascii?Q?H4esl5zUH8P8zaFsqNx+5/LghzZyQKm01ADsU2W7oAx8rFRty5C0CIGa3wqA?=
 =?us-ascii?Q?Wlrf8dqiX1DpzDloRw/CrK5IyYpDDRhfQwv2SK2ogDZAmg4gQ0mmXKS90jzo?=
 =?us-ascii?Q?1OG0uSPFSXhJpgaobW76tqhyjJg9JD2E8R9nbHZk9H8KFtAXQQkp3QtPRk/Y?=
 =?us-ascii?Q?g5xBr2Xzyt0O1OUtI3juvcB9y6cYCzI9TlUTVlQfe2H/MfH5SCY96jBmvYvz?=
 =?us-ascii?Q?PkV/9N9h9CVksdxZ3/doq0FAlf9FsZxn6eEBgLlTAWg1sK0YzNiM+FdrGe/p?=
 =?us-ascii?Q?XFlza1GnsA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce8a6742-5aba-4745-2131-08de8a48d181
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 08:30:49.2397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GVuk8LIPUd9RZnE5QjKrPs16AhGh2xtusVmMERxFKrLYxgnNRO83PgDNICVOWrGh9y4Tdsn2frTyhLLYuTRaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10723
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_013052_375900_68EC41C5 
X-CRM114-Status: GOOD (  13.15  )
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

Disable the PCIe bus in the default device tree to avoid shared
regulator conflicts between SDIO and PCIe buses. The non-deterministic
probe order between these two buses can break the PCIe initialization
sequence, causing PCIe devices to fail detection intermittently.

On i.MX95-15x15 EVK board, the M.2 connector is physically wired to both
USDHC3 and PCIe0, however the out-of-box module is SDIO IW612 WiFi, so
enable SDIO WiFi in the default imx95-15x15-evk.dts.

Add 'm2_usdhc' label to USDHC3 to support device tree overlay for PCIe
modules. Users who need PCIe can use imx95-15x15-evk-pcie.dtb (added in
a follow-up patch) which applies an overlay to enable PCIe and disable
USDHC3.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 7eb12e7d5014..e4649d7f9122 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -557,7 +557,7 @@ &pcie0 {
 	vpcie-supply = <&reg_m2_pwr>;
 	vpcie3v3aux-supply = <&reg_m2_pwr>;
 	supports-clkreq;
-	status = "okay";
+	status = "disabled";
 };
 
 &pcie0_ep {
@@ -1137,7 +1137,7 @@ &usdhc2 {
 	status = "okay";
 };
 
-&usdhc3 {
+m2_usdhc: &usdhc3 {
 	bus-width = <4>;
 	keep-power-in-suspend;
 	mmc-pwrseq = <&usdhc3_pwrseq>;
-- 
2.37.1


