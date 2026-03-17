Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16561FEDA0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 19:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQbeyUpcxHP0UttbckzSvqDGia0H3PNtqqBpsfm0zQc=; b=Q2cOOD5Ut0cUDdNsHUHLQu+dUK
	9x9UiN1e8M4qyH0XvFNmz6HYSi23fj8QbZqowbp8KdkMbzOQfp/g1pwBb8dOldjO8e29NIXZ3eYJj
	F18C2bl/rEHZ+AHFz7bbohrvRdbZaCH9V63qdFjCYTRzOhQwbmO9g0365qz/Y6OQ9CkpOyiUv6qsx
	L5KXDqhvsOwba23/3tOkwrG8vARlt213i+lWpKOj5vJEGqIX5OOyTUFFqUc8YcMDS6AnRFlLNuWrT
	fFLHpsg+3iAqp/+gZsoVJ5PTkc62hnGNOQ2INH+0hCtWrBc2ehaNLFFcTXajUhmEdVmWNpqfyJ08q
	vi2YUzlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2aSn-000000079Q0-02da;
	Tue, 17 Mar 2026 19:52:25 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2aSh-000000079MV-1fCS;
	Tue, 17 Mar 2026 19:52:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrZRvwWWd3mu5dyQDCRBV0eGsIrhTk9gYrfhpAjKIV4qqH7W/wR6/ufJl8dm8q1dF74m4sUfQlvOUgN7wYS5Qw+vXP8EGZuM6Qu4mTOxiPaNYLF60sK7wtTvwoFtMdKYSpdttDCYfxCIJGWY27h9plCxW3FC02tkVNb0eiHdl7wyW6FjGENBEQ3G7kQUuchdD73ykmnArjQXOz1MMjzxcbo3LXD3fJL2goerHnUEtzbjLSGRsMjgcYOds4cDJaY4rWxpsVBGZahDYHJmjLMoj51l7hUFBz7u62bFq+qDfFm8EdJ2ueO31hnrW4aNJRY69Se/QCdG0RNV3ute5gHOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQbeyUpcxHP0UttbckzSvqDGia0H3PNtqqBpsfm0zQc=;
 b=tpzwxM5nLCHD2grD4GXdJ5FXa4Ku5lIi/yWtUX5iVzLU9XrVbmdv8Ysw+HjpxW5Fv8GDhZgkbF14uZNulYKiEbPpBjK8s93IO4xk9GEWEjHMrdmycuSEeRkT0boggimtERUssU45SX9Tx89sYW9b7kFvIxA9xD9xi6ZfpXKmauqjQ9wDvXdkflTG2hdHjvYHy/ShLIe76nhWzT/F5GfNN/e90rrcGAKtRhCQBJG8zmrZCdiK/MTEEv9xukM+shSg9TKipFcbW86/DHA3noDflkXnuV8B37nnui1UNPM/w3A2oGlGY8AsVCyDFXl9m7LlhnzRbjnxWK2LEq4XXXo/lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 50.233.182.194) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQbeyUpcxHP0UttbckzSvqDGia0H3PNtqqBpsfm0zQc=;
 b=uOIwF6qvKjXsjqy19qsCsmojAMEANZmQypBi6ogfveVlZmRH+TJRiKGzOugO2DxYyu+DjE+4kdHjHWxkgB/bc0uTWoYAULHovWiLMZHw2bOc3BTi/Pl4I/kaMmyQqxskRwLBg2MefhmSICggGrIErc46oDeSE0QwWQrxvul1AmJ08AQiJVHIiLggnDP7aRFUv3QWNNd/P2/B/Jp9tNn4OuwqGyZIZvwwWXSfGQmh9wUhD6Jd6AQ7f9NlW5YRN3gKGMxNvy9LPdTzG3+AwOy7FDdQToUJcf/0TeIrelJHNFjOgKsS55vNYj5Vu/rcr3+DoGHE113u7QHoxxkeE69dqg==
Received: from CH0PR04CA0112.namprd04.prod.outlook.com (2603:10b6:610:75::27)
 by PH7PR18MB5827.namprd18.prod.outlook.com (2603:10b6:510:15d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Tue, 17 Mar
 2026 19:52:14 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::f8) by CH0PR04CA0112.outlook.office365.com
 (2603:10b6:610:75::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 19:52:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 50.233.182.194)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 50.233.182.194 as permitted sender)
 receiver=protection.outlook.com; client-ip=50.233.182.194;
 helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (50.233.182.194) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Tue, 17 Mar 2026 19:52:12 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 9DD384186B5D;
	Tue, 17 Mar 2026 12:52:10 -0700 (PDT)
From: Tzu-Hao Wei <twei@axiado.com>
Date: Tue, 17 Mar 2026 12:52:11 -0700
Subject: [PATCH v3 4/4] arm64: dts: axiado: Add eMMC PHY node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-4-fbf790f3f711@axiado.com>
References: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-0-fbf790f3f711@axiado.com>
In-Reply-To: <20260317-axiado-ax3000-add-emmc-phy-driver-support-v3-0-fbf790f3f711@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=twei@axiado.com;
 h=from:subject:message-id; bh=ifJe6BWD6fxFLW7464vvxiIMU26jLX4+q7GsF1xfii8=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBpubDrsBgd7jTU0mf0WTqsmEN7ZRebhG5BsaCSN
 jtiEtA3wAmJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCabmw6wAKCRB4EDBdxFrx
 12ZcDACdvDxeWa+YvZ9ZkoDutVUkl6P9A3G1iiS+eJLgdxQ779On7lSQmqP04GCkGVGw1Ym9gru
 9B08opDi3TyE4nBVLpgC0szn/nTB57rxAZZgf15B+N0rnPn57KV25sPClwsQL0LUc1ZqPZmIk/w
 XSVrBEQsP/fzpD1YbnvGY7Vlb3cwhOtkgeYis9KlVnayk9CghlpHK0SjiADV1TwfAeLda5+678Y
 w2Cukrgkb4RHHs69EGWAlq6IeA44u4OYjs/+A1SC7zvpua9Glu/krrkdKTE7QRsYxD7QedgTp5J
 Ilg97SJXTwm9Med6Zr0u17Re/X0Otq2eUqBS8F8ftqGCDfEA0pbfhE9u0U6c9YSnoP4Td9q36Zi
 U2ocnmC8+vNNXEkF+T8sL9nUe1AUPQLhaJEEYffhGruHUj/dESmH5WG2yxFs2e65yooUldBIFFB
 O1Mt80Oip9wQqzdIJNqSbbJ/aPXKhxB/5tPk2wQIFI6NKdQrczK6IY/iPzHfFVIRbMdPI=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|PH7PR18MB5827:EE_
X-MS-Office365-Filtering-Correlation-Id: 6301bf5c-3acf-4135-865e-08de845eae97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|42112799006|376014|36860700016|1800799024|7416014|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: t0M/h+9p3xQ86JxX+PDB5FooKrTg05KZQOhCCWUyAKFfAIgzJCqsZaPzCRresAghTFOhzM6VlcYjoWKgxnd4Cyo1Xw8906o0SGiySDSl039nxM1xNSn1auhMBSwLo+6/YW5aXNfkXCp62LxAE0s9lH2f0Gc/n+O/nrpmbML7a3IkNkwPIkC/Ok439eRZSx+inTuOKedKr8/fLN0KSleQW7sXOmrkXnYiVwSr71QjRKz+04N9+Gql1qzdFi8j6SvulIM+r6+eOh5WBZr42V90oK8MEbCWYH5B9QoDDWjlKQhzqFk/lgmDm8xPkdCqv9ZVmWoU5m6m2L4HaV+p6kFMZasXkm+B4+MwKE6BYKyPcyHCCo6EZHmpa/h2n0NkBTDrINDWqX9CrgieR/WWVKkYrPnl5z+4mBY406pFZq8YPNswv3Wp5X9MFcYcftjtRTJHIdDexDy8rffCJK8nF0kqwYlkeumBOaz26JoWbN0ovf1V7doRJsFU7i4Y+IE42sdVPErrzpQq1vZADHGK69Fohv1JYCVbLSm4pJh6c5/sOisWWuNN2pJ3VQRVgSasm4Jil6V/B/j+xGRpDBhVF5X3An57YDWTVkHS+6tj0TNvKyYUV7uhLkWOjLuNMON9bjFG3QgUdeoyaQoC3XsqPtSznCrszG0AdHiBp977/0o/V4XoAwh+Ci9k406JAIZfGA8yA1E836Aajvkjvgm3aUoFIqZ7ryWza3RmaJgOP5+Up8/DqrOYZYzlPH88YNYtVhHbioC2oIvvU7KQIMHOaBkA6Q==
X-Forefront-Antispam-Report: CIP:50.233.182.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(42112799006)(376014)(36860700016)(1800799024)(7416014)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FAx4iUjvoUAli7arZ+WitifI1A8mcHdZGwEsi/NAE09hxZUvXJb5ma8beECNOzQcBrqWhEAcyNxtsLYdyr0bZSSTSgKYJSUqMTTWjPPGUylqdyfUx0VZFl8mwPAB8my4f4RY6SyuxG3w+HpwxD6QWPeQ6zby3jbOQVUTKeIsqUsXNeCq4uToX/8a0NBalkSHMNqUmjQSm/oJKuER6Fvlijpw9z6ksNXnyrpmqE/u0RjJwBwQxagu5RydFUp9jGhkHCv9pJ04i3LNx33JsYNJdFyVAMtp+Os0GE7hVOHUyX3+JoXfZFcxWFegAFfAKf572c4JiWnxMhe7db7nqKhOTOwUA5h2rfbn0C8s4VY4mH1G+7xl4KggOyr3hNR7PH0X3PaakIUYGelUNLlq9Mh07Dl2Rxc+Acg2/rBPw/R/hnfY2F9UbxQ+AMT3OjeB1+rU
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:52:12.2686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6301bf5c-3acf-4135-865e-08de845eae97
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[50.233.182.194];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5827
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_125219_442424_4EAB2472 
X-CRM114-Status: UNSURE (   7.64  )
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

From: SriNavmani A <srinavmani@axiado.com>

Add the eMMC PHY device tree node to the AX3000 SoC DTSI.
AX3000 has one eMMC PHY interface.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 arch/arm64/boot/dts/axiado/ax3000.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/axiado/ax3000.dtsi b/arch/arm64/boot/dts/axiado/ax3000.dtsi
index 792f52e0c7dd42cbc54b0eb47e25b0fbf1a706b8..ccc8088bd8258cfb666268b14a3b0716a9ca69f4 100644
--- a/arch/arm64/boot/dts/axiado/ax3000.dtsi
+++ b/arch/arm64/boot/dts/axiado/ax3000.dtsi
@@ -507,6 +507,13 @@ uart3: serial@80520800 {
 			clocks = <&refclk &refclk>;
 			status = "disabled";
 		};
+
+		emmc_phy: phy@80801c00 {
+			compatible = "axiado,ax3000-emmc-phy";
+			reg = <0x0 0x80801c00 0x0 0x1000>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
 	};
 
 	timer {

-- 
2.34.1


