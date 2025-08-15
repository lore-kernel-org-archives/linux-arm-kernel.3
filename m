Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA25CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 22:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PJbBvDV+noSKFlIser/JH9z0P+Q4gTCv13gY7hx1Mg=; b=PtewsGP5DtihMvVDqMjEfUQ3EB
	UyEphMLXaQwDPuf+7/Lk0R3qxozTbzzNYB3ZtBOoI9N+h5Z6B7dzSQ3raV1i6g6xOYTPRYdROzo+a
	eCHgxdsrx7Imab+4x9C02sUhdndjMD1VCgl6jC1U9y5VePmDOXAHtnr8hBAUG0OhGJ6x1ufntf/OM
	wlidKPMcRqDZvIDbm2FT8+liAZhe6cUpGJy5J+xonVQYWVB0lfk6Fw06mZSF60p4A+3DbjxKTp77J
	pa+ypduFpC7/vT6tFMrCw37bO/kNG8+Cy2Ba7V1KWfHt3tvNOFk63rKn/iu5OWsDfxFeeis1c07qk
	EWt0YJ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un3Er-00000003ef3-3jex;
	Fri, 15 Aug 2025 22:49:33 +0000
Received: from mail-dm6nam10on2060c.outbound.protection.outlook.com ([2a01:111:f403:2413::60c] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un39f-00000003e0r-1evj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 22:44:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=faoyaV3RI4QZLFBQyZTQ0VFAy1ulSEt7yQ6f/9hig8eLlp/yQU6hQnWaWo+Dx2vmZT6J6Nh2qohBHg+vGAsdlSQxAbMViNxgbf+Gv5StvgV9WBIkTWN4Y0u9EF6ZrnEdvj6oxlgnSc+ihziWMFKTG0Hx2DOdclJyEgovcHvkkMBQuyvrURSwMHaw/75v0OR6euG13gdtkHCFkPsArvBMRW2h46tC/d64IJytTj69Q3T+GLtEP+I9+TQgoF5B+pHnuh5KzLxOMp0BXKe0tKbNk+NE5CJkeZRP1BKZWiTAAPQ/e2Xb5URqVgKc1zIW7NkjAg+xLDtcdXLbPXZvVPfSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PJbBvDV+noSKFlIser/JH9z0P+Q4gTCv13gY7hx1Mg=;
 b=h+GTRKbudmV9KvCZj79IqvCQr3euq/CZrBrq7UA03eYkCmYrwCd8zArIKAJf5TkrwRgT/0cDGjLuUM/tJpbq1o7mcImIM2Go6URC7+eKVdykP4PTAh7f/nhSrs3nlqFnl4CQJ0GoWWAJ3+TSZFi8TtnV+5J6Tpo1QwVOam3HgY1K2s0GR/kLOpMogjKU8YxxLWXY933uvW8uTqLzTRLGsosvhWk8jovfeAKAxg6zhOLc3FIYdcnYcZ1fvsUPyHEeD6d+7Vz/uhGKsxxfNXdYDHe90WgAdupfFmXuBdfsDd4LlCXbJVkzpHHxeFMQhYvavgB8TiwYmEtQy27S/ZsLhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PJbBvDV+noSKFlIser/JH9z0P+Q4gTCv13gY7hx1Mg=;
 b=rFG+yO8MNnZOWL+Iz124NZR0d7KsJQNUqEgFDCyrrcjq4wA9+/Vx+Y7NScIzzEunJjtzVzJV/uzp7pK+ApVt0XKlWPZX+LZ5JnyPtkAFft792wZmkRwlrCw1S7o8DudQXrYkQZHazP196qhRd313/Nw2LF4AAUTPfWJYy05yNx6dZ4F5USesbXO+Noc9rpZkWLsB0Si9lSyhU37pvWdt5E9LIGYtHB8xPG8oiIzEDluU3IPnxQzg1++nHQoO5Y7893GI4wuvb8mYRW6T6W76RJ1qXTVi8A67l7mis5kfId1V5ZRPPA8M9SRcfw1B9mBekBdcW0NETduS/tNwzV8HOQ==
Received: from BN9PR03CA0971.namprd03.prod.outlook.com (2603:10b6:408:109::16)
 by DM4PR12MB8557.namprd12.prod.outlook.com (2603:10b6:8:18b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 22:44:00 +0000
Received: from BN2PEPF000055DB.namprd21.prod.outlook.com
 (2603:10b6:408:109:cafe::e0) by BN9PR03CA0971.outlook.office365.com
 (2603:10b6:408:109::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Fri,
 15 Aug 2025 22:43:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000055DB.mail.protection.outlook.com (10.167.245.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.0 via Frontend Transport; Fri, 15 Aug 2025 22:43:59 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 15 Aug
 2025 15:43:47 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 15 Aug
 2025 15:43:47 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 15 Aug 2025 15:43:47 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<donalds@nvidia.com>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 1/2] dt-bindings: arm: aspeed: Add NVIDIA GB200-UT3.0b  board
Date: Fri, 15 Aug 2025 15:43:43 -0700
Message-ID: <20250815224344.908130-2-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815224344.908130-1-donalds@nvidia.com>
References: <20250815224344.908130-1-donalds@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DB:EE_|DM4PR12MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: 76569be5-7d84-4425-bd92-08dddc4d39df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|7416014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1uqPpCxU7duqnv+vXw1RcO9vYHFhzQ3mrFXWNMJa7+JEm62Z4QxEqE0pbTQi?=
 =?us-ascii?Q?UDllrQKthtxN/pnSABeri7XJi9G6Zts454ewkNevO+Btg1VwqIArlNMn397q?=
 =?us-ascii?Q?mIFv7IFBwJuFINYn5ZpUEKIqyy9cVna0yoEmPAR2zaPcMWmahWAroMBT0QcG?=
 =?us-ascii?Q?Lru7s5mNnA4cX9eXy/6sKbD8N9v0LiGdy5cnH/z0w1wlD0MewYQqxZ66+QQS?=
 =?us-ascii?Q?BDQzmrIQUA5CTK7sHoRu2T4y1GX5IAdRVUeY5kZM3O7iReFjbWuno89F0cs2?=
 =?us-ascii?Q?tAsi1kWM2l1z6iyaRxVK871HQdwagwm1ki5QzUQytTIXXaRxrBt2SF5hwtCe?=
 =?us-ascii?Q?T4v0vMJZ/ULyFqNZ724smyU97uOD7uCyu7RQh35yGm4ZgaSH3PWkTlywGz01?=
 =?us-ascii?Q?YIve/pzpuUvfrhgzp0eXJQVvKpQ2eGwJ19N1AgWA/UzX86/IN7DOfTHmCDPZ?=
 =?us-ascii?Q?VL1q4JfU7XOMwn6VF/6yQ4IBhTWneBLRIChZhvKo9Tc0IkAByEPdPrTcBbNN?=
 =?us-ascii?Q?FoS0lWmrOaw9Gy8E2Su9TMw8Juiqmo6LJFPC/+0GQlrDwyBxwTwBt8NiT50S?=
 =?us-ascii?Q?qxuytjdQVev6xXSpo0l97Fawzxr9Fij9k1C8YAn6QhFwWCRiT6Z89jp3jxAm?=
 =?us-ascii?Q?2ud1KQPyg6cKbtPgMWa08BBTAZci6PfTT90v8NCiNLhE0+qtLzGk53+Nw6R6?=
 =?us-ascii?Q?iriasafss3yfWpqIAK6/2biyzc5emscruwut7wlNKxUCtliKSfUlv7G9NtDG?=
 =?us-ascii?Q?/la/IawGaMNjj9F5XcNQ7XzzJW3oMa8FACNcfV8Q6YZubihd3EuRVIVMl3Dc?=
 =?us-ascii?Q?i3+dxoiFTJOvn28/Dnl0bBxwHT72P4DZBC9YKlC+Nyl8wNaw64cMMlcErIw5?=
 =?us-ascii?Q?yf/MBoGhy4KLZsdQL9LN2ANtZfTFeqPo5Y3yf1fHUhXOEzI9ZuBpRblvVfHN?=
 =?us-ascii?Q?94AEsOcKx94L5o22TG/tLAKDlI6Qhf8lVW8rv0u3ASsDspVJN3NwydT2A5Kl?=
 =?us-ascii?Q?WaR/HUzjd7lEFcXtVgO6jjLslkvPMF8QAbvWnEL4UaD6uVxaieEgIBCsNtgG?=
 =?us-ascii?Q?9ut5IJ+IwKQQ6mDUYdrVDhSdQBIzBSxe4KB9um8JVkiG7OXihmzbubPaNQwO?=
 =?us-ascii?Q?qTzFWSLaepgR1W/OLRsbAMMiCUz4vgHqf8UJTan4oH8N5XP7s1D9fntVXpD+?=
 =?us-ascii?Q?FVUeXHTlwGiKPngYoIoPOMcctQv7x8dbRoTYanHFaZgv6fGnOr5vxbssPvUB?=
 =?us-ascii?Q?mZaQQe1rRpT4ApQo3/iMKW/OaPVDLmzoa9ZIq9enZIo7LQtPOCE2FNLXUgi/?=
 =?us-ascii?Q?H4OHzTcyjMFlnbmBym7bg7xdVgY1kVTc0RTb3T3uA6E5e9tYfpO1aGe/mcpj?=
 =?us-ascii?Q?wkUfdIJdMO8ewI8evumIzQ3693db/Pi8DlO2iu5xGc6Y/6REfsOVSRvtyiTg?=
 =?us-ascii?Q?5NL+4hmnkrlQTpDu5SN+o81R3Wme9PfTqLlimHV5xQgzx9veH4ZOdI6ndPj/?=
 =?us-ascii?Q?Wta60Le4D0NtjfI197QDmHp70ETjMr9frwOx?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7416014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 22:43:59.6072
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76569be5-7d84-4425-bd92-08dddc4d39df
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8557
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_154411_435176_6FC55C20 
X-CRM114-Status: UNSURE (   7.40  )
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

This is an Aspeed AST2600 based unit testing platform for GB200.
UT3.0b is different than nvidia-gb200nvl-bmc due to networking topology
differences, additional gpio expanders, and voltage regulator gating
some devices.

Reference to Ast2600 SOC [1].
Reference to Blackwell GB200NVL Platform [2].

Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
Signed-off-by: Donald Shannon <donalds@nvidia.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 456dbf7b5ec8..624581db2330 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -99,6 +99,7 @@ properties:
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
+              - nvidia,gb200-ut30b
               - nvidia,gb200nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
-- 
2.43.0


