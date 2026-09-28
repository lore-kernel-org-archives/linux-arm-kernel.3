Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B6FCA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ym0XKqdET+YVVBkpmcco3bUwRz8F+qCkqp/s9Q9fCgs=; b=VZbouvVqyTYj9LU9foyJpFr82b
	wA8Svz7cQCk9/5Nkrwco+JFA2STeoXNzzC9XvNZkRQtKSlrmOO49/9IGYuFmdRHYuSCBneQAvlYZa
	GFUyXI88kaxUoE17g0oBH1T1MIVZg/19HR9Hl9SLsQZVRZNEOIHNOxLwQEP4VjRvVl2aukXDrvJhv
	StwKUdg7xKysHQMfKIERLZxd0gdwfFtLxpifXGRkIXkLNR4NnSM8+sN7KtnBZPwwUDHchG5ROibs2
	3vF54JZWbNR0OXTArdiP2/1j4+0b91OOTlCPPBDmGMxSuouzsWYL4SkHN+1Iom+qlMYvYiOxZvlRQ
	MpmZRlWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzd-00000001ljI-3kyE;
	Mon, 28 Sep 2026 22:38:41 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzT-00000001lbX-0rUm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:38:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnHR5/qjIDrRRpwdiYlcXuhY35gtQnum6qGkMGgide1/VgDVaqlsdVLPt9Pk/orPmCsx8JFmBoP3cqQ4Y3V7H7KRGzDqON6lEk376HHTKhc6aETK3aQDEN+q5WuSkR8wJxgd6suEM+oeqmp/0ES+Bqj4ICmTPdBe8LwbKzoY26/FlEh44e56k26FMESHYKmS0V/cD30jfqIp84826rfFtRvsWfCRfBkEtuJ9bqwx/p95FOqaIH9fepzguCG97a/BnSgxDGzNyqb0SIYISELOoH3tV9C8ywnVXk36QCEEqDEmbedyKL1zL689kV6xybNdBKjwJCLQRXk319kzP/yyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ym0XKqdET+YVVBkpmcco3bUwRz8F+qCkqp/s9Q9fCgs=;
 b=GoGqAc134dZFoRv5fqHb+aD9t0t4hTNLAVLqQffhDQqMLkQUzrbp7j6X5jhcFZjzqpWDc8ba4r6Dk0D6eAOUVocjyiGwE7u6qvse9AZca9TGFsOIFIxlXFUzTjsSiHIH/U2eorjg6slXJwwtf76OJQkS7XkzTG0ui6W0P2MlZU7UK6kLyoaAo2ZZEexDSRRiAVLRhtO1VHTeuWta6epoFDzWcPltxeefANKzSycApygoBONQqENcqwyFOJ1NP0///nL/1uD0OFP3wOiB2/9iPR5venSfG/3p6AqtF2veUUsXuYXefqao6MqQMmdwt9TuhAKPoKq+zJD8cZhX02OB+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ym0XKqdET+YVVBkpmcco3bUwRz8F+qCkqp/s9Q9fCgs=;
 b=WLB4VJD/zMSdU7/Wj/hu0d5a5kXVkTt9afaMhPou5+DWBzVfso73RUm5roUfHtsa/RaXBg88ZoAe+V5levTvHd+3f9uHaBn5V6y3WfneCB2F/lL974BPGOduoSluJAkolw73JXFO/kM5OQk8NBsktfFjhReC+ksW8YLmRh704Jw=
Received: from DB9PR06CA0007.eurprd06.prod.outlook.com (2603:10a6:10:1db::12)
 by PAWSPRMB0071.eurprd02.prod.outlook.com (2603:10a6:102:339::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Mon, 28 Sep
 2026 22:38:26 +0000
Received: from MAD0EPF000008AE.eurprd04.prod.outlook.com
 (2603:10a6:10:1db:cafe::67) by DB9PR06CA0007.outlook.office365.com
 (2603:10a6:10:1db::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 22:38:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AE.mail.protection.outlook.com (10.167.241.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:25 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:19 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Sam Protsenko <semen.protsenko@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 07/16] arm64: dts: exynos850: Align end of node definition
 brace
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <e5cec00fb665ae8bda863acdb00ee85a6f8f4d79.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:19 +0200
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AE:EE_|PAWSPRMB0071:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef4650e-1d17-4b9d-fff7-08df1db135c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|82310400026|7416014|30052699003|36860700016|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: BOs7cQZSpqvITwVO3CYfO3ANTC2jQOqMendTng2q2k+ueS0Ybm/XqdY0BgHZLz7IHMmYhYoSQdRK+nxzcX4f8LS884/h9hZXRNM8SfAhYnJVeidK6Veijx9aTSEQI7cadusJsmyY3Fd5dNDginayFGgLg9MqvI4B0XBVSHnZ3ee2qeEib2Y4J79hcSSHc5ro5QbvjoKK4jSy1poyxxIuucgbL3dmi2dcDkhtQdpMSQrauR+b9URFuSc2m01g1WQ63mZ7fhc8WhXloh0UJq2TPdM7MU7t3IL0LJJvLHgTVcA07673Y9uDyEkg5UpLO3G5cxqsZY+jQnRj5qJDqVFmkIrrl7SPXAZEBfwtU46wrcREPUcPepAt+gGD4AVlnR3dfrWZFqjJD2ZdzIM6pBQrj5WCWDJvmcGFgSYWdgvFUXXvfX7bNddsZWuTHaLDYmfusUIGATimG8D86atDj2/zoeQbEFM5+o/7BBSoynbgq3MK5sVtQ4cpNgDvxCEn1bsEUkgSZmKt2USIWuzcfcITSO4AGTN1YFy929Z4K2Cj27w7D7O1nMB+xp+9FfImfZlUHnHJNyqt1HPqLzHi/kB9oxOJnzJuVGYJVBKqdBxuvNQ3LxpgOsMfjoXFFidUDP+K00PTeFVaYVZoZ0fQCwpwDOoAsiACGv030O11mti1aS1CFc5mjAiIhfuxkblbN7G2IXbDqc7gQo+5F9niyu6fbg==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(7416014)(30052699003)(36860700016)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6TY/r9FRPBkd7kfGZRJ86aYVEhlIk8b3VIaH/XmiP6haYpukCjK3cDHNcVauLVsQ05bLd3LA2+ZU4YX5bLO+z7nLhcmm+pb5D4ImSnWEPFn23WP0y51bChsKsuDfss+HEZR5zaWoj6WxtoiyLN24L00j8uQc3BrjIe8gihTTx3SUhVxA5OAoH2UEjacbrp/1CTczwn1g3O8qtYUAtwAbAKF59cdhzwR7EyVpEHP1635HIquEH3ObzTOo32C5QoaLOEBnuaZAZIjlfHV2wkiOwdxd4OCtLsW3yD68h3195jqw7ybVsPTCctyUlyB1KpsvFua0mSmus62n9wNZ/mwHEte9e+ZSqI9vK1USZzwnql+DLMNq4b0ZoCvkTZSJDTnZZEvKCgOTg/yMZAnyJLk707jBV+87DgfpLRs8xPW0VyDsf/S0CZwUs2uIPIjUKleB
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:25.7645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef4650e-1d17-4b9d-fff7-08df1db135c6
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AE.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWSPRMB0071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153831_250951_8FC20073 
X-CRM114-Status: GOOD (  10.07  )
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

End of node definition should be indented with a tab only. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
index e3f1ae8dedbff..523df53ee980a 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
@@ -362,7 +362,7 @@ sd2_cmd_pins: sd2-cmd-pins {
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
 		samsung,pin-drv = <EXYNOS850_HSI_PIN_DRV_LV2>;
-	 };
+	};
 
 	sd2_bus1_pins: sd2-bus1-pins {
 		samsung,pins = "gpf2-2";
-- 
2.43.0


