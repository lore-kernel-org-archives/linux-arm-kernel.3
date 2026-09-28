Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0325CA5FB4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Date:Message-ID:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpGyM7JxTuwngdr0XvYQlCMPs99lXk9dDA2T6OWufd0=; b=NTWTtuwKCk3rEaRlR0eazbI+iD
	q0PoL6eKQN4pX17lLCSEUmpuKylYcLJDWCRhmUE7tHIzTnTJMQt4rY0cgURYeJ5Hq/yceBSve1Dpn
	9ewJraZHhO+e2cRqRPjtO7BWQNXCt06j7/eRI9apCrQMbUnHWGL8Ln7H4HmAvaa292cr+mbXT7V+Z
	KZvbUXBWcZjUTjK7Zq/51hg+FQ2LMm45ybxuy43mW/PC3lmum6zcjWvvNXeHZyJt3EdKkr6iZLDm3
	F84hLUbtsiIe9TPM9K2kIkvq5ZC3rivwq4UJlD6xGHopNYLMnU2teLbDnuYiEqWqL/E5INOB6kiWh
	Su56BkfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJze-00000001lk6-0sb7;
	Mon, 28 Sep 2026 22:38:42 +0000
Received: from mail-northeuropeazon11011005.outbound.protection.outlook.com ([52.101.65.5] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJzX-00000001ldf-3M0c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:38:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5LyyXmML6hB/tPIfIo45bB2mou4+j14VPxMzgcFXUVl7YXbLjbLDMZcWm+Ljo3PL7iRpYV+2jkO1YdsLVQho5NIu+bgkeM3WWyIOx337P7rZmcqw19UX2bLBjTn3Pwkg+Bciu2M1YM82QYNrO65qgQbLTB78E/lCsYVuJgRRCzVf8cJsyQRZWmZW7+r2zqMTEZOb15NEk+VvwFvyMdgmzTBrU0y0L35y+crIh9bApXxuq2N2BawaFncfBiW2Q7GRg0ZjwuOB5X1IWFXChTQYutTuLj1wxgiEbpMRlbT0b0Nx2Lk16V33mVmsV/kzR12jMAS6X81Yzs6zosQuNWDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpGyM7JxTuwngdr0XvYQlCMPs99lXk9dDA2T6OWufd0=;
 b=xmh72Qcu8LsOI5zku98AZJ3Ajo6fG1380ppbbD9VFijGj/nhgEaHBNlcza1rj7YClWmp9DvNg7IMfz0V2LgGwLQdNdZ8YDIi/mrjiFTJgJJwZQkmBcgN5GBIuAar9iBywc9wiPinweWPZmkw/4YHQJJESd/QNhVIhHme8s5pGC6q/Wi92PyNo6Eb2Wj2r++djI1bNYz+ZIO45hioqwB4S90DCG2RY3gSmjqEtQBXbzSPEBvS9cR0NrssQkluUTrVN4XDC7lAe0oCs2i+MlqVtMbzSAKtqdc//nCUww4kQjHtG3YZyB/WRzhv4+7thbdd4CBHsrZNg7xHxBWR/30CvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fpGyM7JxTuwngdr0XvYQlCMPs99lXk9dDA2T6OWufd0=;
 b=UE8dZ03l+20JSEo53CTqZqoIThIyE9KhiGO+moiPSIIteT6fCkcLIHsQorVI/A6Se5CqCtk545/E+KsxsYa1i6wul5JSJlKaYF5n20EGwqmkjvwMe5U1iFUTO9HFF15hjiDsHMMfpW6u6hyAdDLshASOkNu82Uh+wxnAIz29VZU=
Received: from DU2PR04CA0336.eurprd04.prod.outlook.com (2603:10a6:10:2b4::15)
 by AS8PR02MB6967.eurprd02.prod.outlook.com (2603:10a6:20b:2b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 22:38:32 +0000
Received: from MAD0EPF000008AD.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4:cafe::2d) by DU2PR04CA0336.outlook.office365.com
 (2603:10a6:10:2b4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 22:38:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MAD0EPF000008AD.mail.protection.outlook.com (10.167.241.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 22:38:32 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 29 Sep
 2026 00:38:22 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
CC: <kernel@axis.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 11/16] arm64: dts: exynos8855: Use tabs for indentation
In-Reply-To: <cover.1790629313.git.waqar.hameed@axis.com>
References: <cover.1790629313.git.waqar.hameed@axis.com>
User-Agent: a.out
Message-ID: <ec5d162096fb399846349442adccec4459cfdf3f.1790629313.git.waqar.hameed@axis.com>
Date: Tue, 29 Sep 2026 00:38:22 +0200
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008AD:EE_|AS8PR02MB6967:EE_
X-MS-Office365-Filtering-Correlation-Id: c3588592-a901-41c4-f225-08df1db139b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|30052699003|376014|82310400026|1800799024|36860700016|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: IbruI9K5fnkhvKEo5D0GiwNlEw1fQ23CPMQOYIxRde3pVa6DEOTDVLMMNEVZ2SC9Ux2NyEdurKiSKe78S33HN4orL8BG5H8tdSjBu/jz0VPPNe/V8h+Dpg/oU5INBImjBdVqm+uXxv0kI7I8BaGQ8lXrN+ETsg4qlcY49VA3lFXok7B1LMJHjMBj5Aa1iamfvUX4LX2mrFsOI3qLkVIxo8mtKeSsxp9v4hT3ypiAjGQioB6uKCR8gc2cWuxUNNf6TtO4qHZ1CFMwtn0qwg6hEDbh6L+qTlKwUUBcRxON21VVRzkpMFtpNOZLNeIvr/cZMpABLniqf7++LulMYvTjzeN2uyjvf3NpQQjkYpA0xBjOkpH3ogIS3UdSyqG5P5Wq62jAir6nltWj1Qsk/cGIDiVhRBV7inrDNEIh76SJNQb+lv4gBNEA6MVvbczH+MctJqPo+pPaivtwELnzA2kESFucbm2T3MN0auwQR0FgxAutzDPKQXtmiAVrvSMwhxk3rxnOS7Ot751aNK5NtKfohA3R9N5yMSQIoqHCFsbv1JHrS5wROcFTv8ByU3ywe5hkHuyCcj+YCRceD/hP56DHdblRitduLgpBPIdsHS6xcYUBUPH+9PZ2VSHrc3o69q7vKvcl9KLNXwfvAEEy3uZG6nXzdJPsVGL5dR3KvL7t6wCWG/eteG8u87ZAm5sdm3IPoNTd3ROqu7WCXOMxk2kcNg==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /hR2ge8SuixkGUU7k+tspb4RuLkgTGVZ9iEODy3PpKf010K8yKc97xcEYIHes6i6O1FF/qBvijs2wyDsR90BqbqwJwcpj9dEZIy05R2hGDf0UG0HCCkqJ4JujzwMq3lGSPl0Z8hOuc7zrCxIWb5kyCTdERgl+nrHByrzi5NveCYbrQcw5ygcdEM10fx5PSMJAuwxhf4Ccvt7xmJoJXpfA7AtELh33gFNW2JjXdtbJOL7c1fFHfB+7zs4bh8UEL6z6UrpIDLJpSh8gdwhB6iL6W/wBlayrzccZyF3wbkTAQ98S3d7BEdlF4TtPo7U3JhlB4shZzGzKK+cJkLjmvjx0pE9/c6qQIO/p0mMiGG227Fm4TkjAGxm2/GOVtBLJnFvlXzJVuZxuzWrW34/wrwKJnXxWxTenaNt/8c2kOE0438aQBEw/lX8YvUvWIIwB3I4
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 22:38:32.2820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3588592-a901-41c4-f225-08df1db139b0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008AD.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6967
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153835_849611_022D3ABF 
X-CRM114-Status: GOOD (  10.13  )
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

Tabs should be used instead of whitespace for indentation. Found/fixed
with dtfmt (Devicetree Source formatter).

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
 arch/arm64/boot/dts/exynos/exynos8855.dtsi         |  8 ++++----
 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi | 10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
index 0333b80eba845..e43d26d716552 100644
--- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
@@ -199,10 +199,10 @@ timer {
 		compatible = "arm,armv8-timer";
 		/* Hypervisor Virtual Timer interrupt is not wired to GIC */
 		interrupts =
-		     <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
-		     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
-		     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-		     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+			<GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			<GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			<GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			<GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
index 16903ce63a32d..4510b39c5e401 100644
--- a/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
@@ -111,11 +111,11 @@ uart1_bus: uart1-bus-pins {
 	};
 
 	wlan_host_wake: wlan-host-wake-pins {
-		  samsung,pins = "gpa0-7";
-		  samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
-		  samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
-		  samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
-		  samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pins = "gpa0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
+		samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_DOWN>;
 	};
 };
 
-- 
2.43.0


