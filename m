Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE72C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=soc7A5JG3xLoOX2mL+sojnKa62PTGCMFDKCD3rEtp/4=; b=H4yXLqZ2x1ne43KvqdOK3cXfeO
	htmoiNrauymb1zvkpPH/kRjKuPFPiNy9LrXLR/+77WxgtajPI7nrNIgvd+rt7LoF9m5dr3nJyphVh
	Mi3PsDiddZ2qK7C1t/5wJ3vX7NZCX9Ir7dB9O2treO6FPFAixmfQLBS99C4GS+2i0Pxv/vgADH6OU
	/31CDxpmodp0ibkShdTFqkdnnIC4R4NVPCYCejC9bk47yLe3LOgQ5WT4me48CVx6NWePtnfcgQ8pT
	XDpm3SJThzX8behhS0/9iLb/tH9/Rt9rEgrL2r0My92q4bW6dB9QjKYzEX+yrVvOBfVk6bObQrRDF
	HXtwWwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPtN-0000000DV6q-2jqD;
	Fri, 21 Aug 2026 14:06:45 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPtK-0000000DV4n-2L5t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:06:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkOFbjvp3W+EIaodk6DoPdhph/xCsihUrYtzHc+nRJvwvFZwiLOc1C306iW45pJrcFL2IhyqIpNRW0Hn6uIG5+XVDYSwUjeDqG76vQ+vJ4rEeI2SlT1tiQbl6PbqMvXyfUPG3HxLKZjIMrnLLejKZYQOsieJS3OhoCoRDaikQktj6xELYnO9sBORNm+qm+Np/nGWtNpQtniGbFGAdudC/RchX/T47zpVFJ2jVtnSceOrJ8wEcqpKMdZnLjJ3abFaez0boI3b2OhVLWgD1oVepZgDDaHxuxHmurt53JHloTog4mmgnnquuqO9VJlBP9rbVtqa1xcrjxZWsBHFt5JgcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soc7A5JG3xLoOX2mL+sojnKa62PTGCMFDKCD3rEtp/4=;
 b=T8pJV8rhHn7d+cBE2wzR2s+fqzKnkWWYBa73wfB963SfY7fnhzLRBbHhxgcsXwCq1ojZSYsSMz0us/mZne0bfV6z2xElWpR4KcpfW32VVRZJLaaGYcfRK2MeUeaASHv1v7RLOeNNJ1uW565sKsgfZurHNNeCJi0Q0TJ1cdF/UGN89taFMa8amfZ1KoXC/bi2FzTbuZacOG6+IVo2liV+84vLzopQE5/MWBp3z9WgNDkEn/0jVJVMg8w7HAPhBOFH4p4rMIl3ecqtb7mmHl6jTFnZKyezO1l4J4dca4ArB1uj3mHU9Oo7xbz70fvHu5d96O5WSvzqvERAFQDqBJzEKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soc7A5JG3xLoOX2mL+sojnKa62PTGCMFDKCD3rEtp/4=;
 b=GwcOcKHllh06gQYLJZb0berkvialhgW1D23F4vdH5YAdC04aU4axPwJVwKWaov+If6Etc9MVBZ+PIujrpWyhiYrnH8sQyXrcC9Apygi+6c7EmDd6XkE/YQ28nfpXNYyQEfoCYdMXPLx606EHVJMCtgcHvg5PGivA3nkTLc9Rmmgl4+xsx7OJFgR4zrlwCsAUeUFLTwQzZx8oeps0s9IW7MLyWcCcPie7PWYsHTODgcYmjXHwzGLRNzH3jLrRFZsleO9fcGDCUAtk8zi3bYSjQ+XbNfv836U5KbNkyMSlUsp8hBRkrmTVpRYcdTXXc+mzZoJgUbBVVyRKv+JMmoWrfA==
Received: from AS4P192CA0027.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::17)
 by DU0PR10MB5385.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:340::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 14:06:33 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::85) by AS4P192CA0027.outlook.office365.com
 (2603:10a6:20b:5e1::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 14:06:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 14:06:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 16:11:59 +0200
Received: from localhost (10.48.86.251) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 21 Aug
 2026 16:06:22 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Fri, 21 Aug 2026 16:06:09 +0200
Subject: [PATCH 1/3] ARM: dts: stm32: fix vdda supply for onboard hub on
 stm32mp15 DK boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260821-usb_fixes_vdda-v1-v1-1-0c213062165f@foss.st.com>
References: <20260821-usb_fixes_vdda-v1-v1-0-0c213062165f@foss.st.com>
In-Reply-To: <20260821-usb_fixes_vdda-v1-v1-0-0c213062165f@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Popescu
	<catalin.popescu@leica-geosystems.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Fabrice Gasnier
	<fabrice.gasnier@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.86.251]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AB:EE_|DU0PR10MB5385:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7a5e0e-1e6f-4cb9-a46e-08deff8d67f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|7416014|376014|23010399003|1800799024|82310400026|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: clYwCZHs8fARoISwsbKNWIBKigQEhgj26KidI/V+4YR41OMzQ538Fh5uQquCzw2a7Nzpa+Zhm8hV077//TvQEvArSZKEAuqBneL4wC+RP3cQioXV4UKRkESG4lOX9ZIQsXUoZXIU9K+DCpHfiJMSOb0nPin8vaEVWHp5o8oSAkeEHvsq/Q1Rfv4RKS1pA47q1p6Po+3eBbPYFXlKkqI/sC6tOxUP/FB0PuDr6Ok6Pdt1NSmCHepXkA8hzXvtX74O/rNam8ANk7PGOlinbkFHzPFvVd1MZ7uhC0wARWwV/cDN9sG4V6XQUkNfzxkoSRadi1TlNFZY5fT/Nc9sQgXk0CWoPLRO2M58F/Vp9vQxuYNTn5T8v2ATS1LZuuop4t97UtRxNUWE51XUDPFX4AeK2xS7BDSHhoUpWGp7eAaeQxDzh7/kVyzkIu4uoF7c5/5eHfAwUDI4jJmBSecPhrtDexZNggWbPwjn6guFFxTSRAyHRrW5nlKvbdSmgWGXdAIUliYNJZGGP2aWboVvV07cX/q9KqI9sS3l3eG1MSu6q79NIKrTb497Wzhq1oAUZqjXdj/irdmU7T4RLGkp4MrcP33ZlYln4f6Be3B5zeLpojY+P5HMKP0rHGJjhqHl8M9v8c1WsyLtjyZbWpDM3MSkBVAf5d8PeBgq6qWw/q+h+iGugTOFreek6aZnwSfCkSTPwz+09PBjVfoR9N1GUSm92A==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(23010399003)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xz4kE2wm8a6OPnsdKieUpSbpjc/NKgs/djIZAHaqZ/6fGNvM/gM36i4Tb33oGUj2nFa7RfhSMX2YTHURlV15vlAcl5hyDxSqJRA4M1Ahe1lGY/Gv4PFdxdmxZ5kQhbYjlCPj4WwKyd/c2aX+2pjEiBF7XDWFMXtFuZOFLSOZ1nvW7kryd7wHLlhizwVzSwtnQSimx4gUqYGGvoxxiqZZSSWURXQWJsunjQVgZ0uze4xIUZOu6zShqcf35h8tlGvwrPJUij/CsSSgvphYIh4YzLo+90TA7jNl27jCNRBEhNskZOVPU+Km8ezqbgYT0PaC1x6K+aE6/gm9Sp4NCXFaB7jU8uS1HxKl/mrgEnyXfrr0xsvymMhbLHVISuqtQP7Oj3rHxxahE4OeSioDP63dTeZiUtFb4N1xXqnxzGFT10h9z0zBj/S7eaAsdjRXjFs5
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:06:33.1717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7a5e0e-1e6f-4cb9-a46e-08deff8d67f1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5385
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_070642_882370_DD05B36A 
X-CRM114-Status: UNSURE (   9.59  )
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

stm32mp15 DK boards use Microchip USB2514 HUB. Since vdda supply has been
added, the regulator framework wrongly associates the 'vdda' supply
dedicated to ADC, so the wrong regulator is referenced.
Only the 3v3 regulator is used to supply both the digital and the analog
part of the HUB.

Fixes: 673655f7944f ("usb: misc: onboard_dev: add vdda support for Microchip USB2514")
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 599ea07bdb19..01ac3d7d6d0e 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -764,6 +764,7 @@ hub@1 {
 		compatible = "usb424,2514";
 		reg = <1>;
 		vdd-supply = <&v3v3>;
+		vdda-supply = <&v3v3>;
 	};
 };
 

-- 
2.43.0


