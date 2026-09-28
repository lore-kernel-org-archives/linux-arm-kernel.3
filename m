Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C03CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvP+VrT8FiK2ImMsziQsTYjbtXhaiXfN9G5oh0W7nAU=; b=BTPXQEw2LqWJgac2PbfpIOlh1Q
	/If2P+H2ASzk4yqHoiRcXm/DdwitMWf5KDlGful7nHPl3IlI6FwtaT4xfyIM97v7rIxRmNcLj8Z5X
	reNyopdG25Q/shgGPunFD5QwNO5jixNZ9r0u3qVz7ZcRjisXd/hKZ2tkfFjL16+2MXO6+nzRjWSjs
	UrRpLhSh3CeZJr2T2ql2DwoiJex1n519UBW9JbEaNY7ST6KWztPF7o8+MIpjuihxQ0QHz4iV6e9DQ
	oG8DTBIm3o5mQNdR1DckiKOmFNgX7uqsVyXi4EmYMz2x8PLrKW1oeoo04jVZXOOHMO6T2/o8iLBos
	De+qmLpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzd-00000001lgx-0JLK;
	Mon, 28 Sep 2026 22:38:41 +0000
Received: from mail-northeuropeazon11010034.outbound.protection.outlook.com ([52.101.84.34] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzL-00000001lXq-1Hea
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:38:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVbZVD2EdwvZi4g2IwDNoOMur+iIxSueZ14TYpPr3fBXdKnW0c5EQg1i9AFwGgrID7XDLTpeQJoi5BtyimfaQacB/k1SpeD+f7ox3QxrbP1LrxCnxE65xj+J1jnjbx6pXp5Oh8ugledNf5IT6ezrCNTmbs7hrl6ALNiWWuPLbjRVame7f7DfdUdRexfObKEz493ooDo8zl+2ve6PXrEGI48rl6qZT5tN3owj1eel3OPfSd8aaeB3DADKgE/ZPz9I8KbtP7aqUZTTzWmqOk28QgH1DEf03PtCKL8gCvhzRIsyw8UrfJaXRqTMRsTtlXV8u+bhkvrdoHiV2kc7ga/BtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvP+VrT8FiK2ImMsziQsTYjbtXhaiXfN9G5oh0W7nAU=;
 b=ftLpYzdlDAuUc3RYg5+ZajvCei6KN92yKyZ+cYqdJEuMX7w1/h8u8Bg706HT3GeKeDsLmd6Tzj0WV5BOdVTCBxi4rGe0TJFJH366VVk3A31Cpsd13cHT5HkuY9BUOE//cgmOlZQkcYTJmmhhQLKR4QdroYw1lARJmPo51jwo0s3ciU5c19gfIeJ/uZ8L4z7C8Pj/6RbKuhPeHDstnh7p4c04V0fuL7z9wjO0krcYIRQ+Gx4mXg9OV3r8J6DpfLV/5epmV75VbvW57Rygn1iaHsRI8yUJYdbPy9oZO6f7vkAJszmH8N7rf2mDVzViUbNWRfHc9+hB4i+A0KKzDJz/Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvP+VrT8FiK2ImMsziQsTYjbtXhaiXfN9G5oh0W7nAU=;
 b=KapGH6aMKiKDY/zjKvh4BecSIuSK/W+J6LbEbA9XewsrCKhZ33r1MLgMo0jz/1Vm+votyysjhku9nE4UgB5PlWBH2bw01vRKrVceO+jgsaKezc1axvq1aCAxJ+NwsqsHbdYyk3iiWQ5r8b7CSWdkwdP0Jk2E+dOjZwB46X2ID5Q=
Received: from DB9PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:10:1db::29)
 by AS8PR02MB8945.eurprd02.prod.outlook.com (2603:10a6:20b:5c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:16 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:1db:cafe::6a) by DB9PR06CA0024.outlook.office365.com
 (2603:10a6:10:1db::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 22:38:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:15 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:12 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, "Alim
 Akhtar" <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 01/16] arm64: dts: exynos2200: Remove empty line at end of
 node
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <58f66e4612773be8c0391e3e963c72978aba58ae.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:12 +0200
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|AS8PR02MB8945:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a88dfd8-d1a3-4811-bfb9-08df1db12fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|30052699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: N4ZJ1M2HQIvwaL+XpJ86UcftsXX5Flfkoabyiqx8iTG/74GhjqafjjmIlWT/o7kG9q+Z2XhSHUM6aJHTVtdrvaqTjlk2SlHBi1dCaSHAucOM7SqobU7d2jBEtmKrtdqpY77m76eS32U7GLbfA3RFZ1oSniitSgNXfS3XAGeGyPe2bCy6odeMhZIjHduy+l9CTENqjLhWRwf/6XtoenxLOh0umnIoLsalVVaopwrIeI/QHPd7XuhYTN7CgfhzoZXzRF7B5AUVFFR52HBROBJWSHeDPB/fTt0ozvNDG6a13lrueYxXA1S0Xo6K8XVUEqVi73RSIAFWo9F+gxg0ULOUL6Tkt7wVh1jlPW2Pvg+EdyihrmWBem1eQo+BeKRg44a7Kn3Ln/heGc3roDwZduTQJ2kRH42lZiqK+MR/9aNFfov4aP/MM4suLuefeR6PXPogRpe2ZcT74lZLob5u86BD/4hb28u+SeWyqcs1spjPc6H7SgqNbAKVmlskBvSGP3OvKKA2gsm0tvYc2bfy+bthsF3W+eXybpj3Zy8GmMbXsa+qUQatCswb4WYeexUeSeLTNpx/Qla37b7muSqaZmbnxzXSogesyKOFSNfjpRoBt07aCnFU78P3FGwRmWsqEgdjqMnP8wRaZAWL4z387j9uvTkrBAhX9nhugaXmBR+wAAmeFGk64VU8zOxQgFhFzpOOaQNgKJQiOS6fy74PimGKHA==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(30052699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: x2zW5C0Lqj6pOtzO0ka2NjFAlshvbEKeyDTjDXGXygTN8+ROwAoYBeZqCCu8+XJBSEei7y0ba6m2rmrthlNdjNFxNqKGhRuRqGm0+/O7i6ziHd5GKaJX0rXUjrgjyXRqXTyMIIxe6UKMnkuknQ08EDFN2U4dJNSwEJbf0fLsjRr90PM0udKLYtbYtDGFqhR4AZu9O9wJvkHUs1gNr8QO6xCftKluvoWY/TD8j2DQ0wXZWfnJZFAPqx4+tsGur7im+ZSXoEHRQXHW3x1G5uroVdM8/QRm8l84rVSncqrQ3UvdLVdK1oMkvHIqZJXqZ59dvpOPJMzxkbAszwD/++3ZFtRjsvDFnEREE49gR44Vnfsgb9Z3aTHSH71Y2QpiU8jTm2aP/C7bRY203N739mEIUWzbx3XzW6pvlvLxyefmiHJvcA+fzv6oNo6esW3teleH
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:15.6592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a88dfd8-d1a3-4811-bfb9-08df1db12fc1
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8945
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153823_347884_2EA6C968 
X-CRM114-Status: UNSURE (   8.80  )
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

There shouldn't be an empty line at end of node definition. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi | 2 --
 arch/arm64/boot/dts/exynos/exynos2200.dtsi         | 1 -
 2 files changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
index 5877da7baf5c4..d5aede3af15f7 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
@@ -702,7 +702,6 @@ uart20_bus_dual: uart20-bus-dual-pins {
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
-
 };
 
 &pinctrl_hsi1 {
@@ -1171,7 +1170,6 @@ uart12_bus_dual: uart12-bus-dual-pins {
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 	};
-
 };
 
 &pinctrl_peric2 {
diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index b1c134f223245..3b853d66e19ce 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -712,7 +712,6 @@ hsi2c_21: i2c@10970000 {
 
 				status = "disabled";
 			};
-
 		};
 
 		cmu_hsi0: clock-controller@10a00000 {
-- 
2.43.0


