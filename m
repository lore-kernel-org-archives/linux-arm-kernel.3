Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E01FC5DF6E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 03:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoPRcyj+hdrIjGKCyD/qLhw7uRyYr6i7kyf8wnqQcfk=; b=ijyDjyorG9oB3LJvfCjhZKwq6r
	8IrpV5FF2p1eljZvGuay5I/qlP0lzq+Ed+e4DEd/laQ5NuP6JKUOAIr1bOGzy0awkfKCAM4/fHFye
	ajgKTBFfeSzvS5ppT7AkZUlvQrmpfxf2/jSP8t/c3yfV8wvXtiPUBG+VUXKvuM/BWUTKdYhp+Uysf
	k3kovJZj+qQVk2eJCkTrotyXjNIE/tHjF2IoORi9m/bJKBRrh6bC1aK5LfqZTw0vo0vnOT6WcK+fb
	FcUMJzzS8QCKWAHOFg5PBJ2YpVaoytqwURj9obKlYuxCTdWgdrZpQtimixml/dnjoxxDl1xrn8B12
	INaxSSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvncL-00000005LVI-2fhg;
	Mon, 17 Aug 2026 03:02:29 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvncG-00000005LSo-3mI3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 03:02:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFbCerWAJgMG/14xEbOY03kUv1S7FlTTRTIP5Wecyema9QAw9gnTsF1p+U8kdwMDpHTZ5+Fe+gZ4mmIMzZB5GkcSwo8ygcBYiN+d+UYOxThZXDMc7VB0Q0dJ+AaV00Yp/n+fSeeQ3JDc5EgJxzFsyrsMQDPZUwWKLqhrGkuVjdAziZk7214M3RuVbfElLlhW6AdgDADsHax0CiNV41NjNjH1gaxNWdVs5PJPFZYUJoUW5iXNO0ewjdQWjM3JeTtxXGhRWtOSYE6VvBLAninIlf4Y6ICDBMzOzZHedH3nMyZ5wBeYAHka0ID+mp0ORCJd/eronQbGcBlqy8uttsqaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uoPRcyj+hdrIjGKCyD/qLhw7uRyYr6i7kyf8wnqQcfk=;
 b=QEvCx3ubPWrimiB0xXPGNFPaoLOC5QF1Y6PVjvPpFVXFNZDJbjKUuqfTjc9mX5e8wIeDoJfu4O2K2srTYW6z/CSAqXk7rUtcuIdRkREimt3Hp8e5XUwTIXV/rooyI291/n+it623cTvizxt+PlCRu/UyhlvwSsL128jHmpHxIGCtcFm/9ee1XOqwCq3Vgbz0YmTKjPYRcOVqyzq9gDaWc0SOs9buBq1emu343pYqFS303UchGqDn7fyIis6NDIbM/tqpMQR37YcAC3yDvltGaimZo+1tur8/fcsqvPcR9kvy7Q3rN2V/Y4P6ztMHYskI9FMrrLMzZtCykdZy7pvAhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uoPRcyj+hdrIjGKCyD/qLhw7uRyYr6i7kyf8wnqQcfk=;
 b=vCg3hNcLN3HSzo7mIH7LIocsWkAJIibym9UoQO0AxTwuFNeFG/L1Y7EreAylPcZks5YyhMb6L0IeS4W5aQ8D15PWVTRhf6eIyenLsxSzaWJaWaTxye++F/hOhva3lFlc38TRq1///l5Z2JQHnAoXTkWw76hS9hUwfcxTKSVSI99GsCMNmPi7mMWo2GGMjKHd1AoDCtsCysBCdAPLypACI8nPQzjTnBf4+t7CYFdq1UGy6rti24mayro8wqEfaupqk4BBNg0WCoSun7PPWTJK1h3GBaMDUfE2RmbHN93lVQsYW2jHxkDQiof9N+gJWcHs5qZFJ/rPVjNWzMlETCaAxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by LV4PR03MB8355.namprd03.prod.outlook.com (2603:10b6:408:2da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 03:02:17 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 03:02:17 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: dinguyen@kernel.org,
	maxime.chevallier@bootlin.com
Cc: rmk+kernel@armlinux.org.uk,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] dt-bindings: arm: altera: Add Agilex5 SoCDK TSN Config2 board
Date: Sun, 16 Aug 2026 20:02:10 -0700
Message-ID: <20260817030213.6769-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260817030213.6769-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
References: <20260817030213.6769-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0096.namprd05.prod.outlook.com
 (2603:10b6:a03:334::11) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|LV4PR03MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2a0d7c-eb65-4de2-b3ee-08defc0bf200
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|56012099006|10067099003|11063799006|18002099003|22082099003|55112099003;
X-Microsoft-Antispam-Message-Info: MGyoJU0BM5qCHY5TE+A1kuXTLtZo33kZ6AIUAHtJYMktomUeDocDAj7oga0lKaHirJAN6NoEVCrXzF1jqkN2QlnSP2EFqVAzEXdkO28DeWLGJ90Bydbb1UpmyPg9rgl+nmeZdlx019eCFlcBjpNIzyWlQY5Aqyw8kM3ur1TfjfFL8586uTI9LtXsatDX4ydohTe2m328yRBwy3p3wid3jzZMGjNr/w54uIHtkbzKjBq0LE6KXsKmn/QS2+ktor24aXwfHp9xopDpGM8PVWbZERYXg+lVIjjbl+E7YJQYoIQ5ur9SF5QYO0w+UHHcsxSbodHtUGpZJ9Vt941SyTcQNPpxdHkE7aWC3YrMN0zrP34pIEvkRrBTOKgoE8cvoiLDP0B5zlnQ9WwuDS+xbNQ5W5Fnk9Ii4nCDTgWB3AKQ6ekV7CPC9nia5mittDZeZh7cr8PjQqQyowc4AQdZQOo1Jjqp9mXX4qsOaysQs0MRt4LlxoMa5nDeqdE0A/Et7TAVTBx4xy2Y/hA9dcR1Qtza8U1GFK2BRYZBN9NmcNDvuzylVHV6yqgaSLwOYkU+7DBs7KdgLQTwrGSp465mMMmY3GAkcKCH/48hsDsHX/ypjEsnet56B13lKloo6i8ZvMh13qhT+uHdKij0Vwa5LsJ0FX0INtgwkJDC+Tv3IyQT7sc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(55112099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gSidxD9snAHAs/yzhicBI+khqbvdF96+NDBO10HoD00uAC4ttIJbPgeSxtz0?=
 =?us-ascii?Q?s42uuxC/zL+niqY4O/ZbOt7PiejaNqApxQGQ4NnH0X7taHMd0CrShdizC2C0?=
 =?us-ascii?Q?15QQCmXt7OWmaObEzWuUVSJI4bbi5AEJYUWYH8X587efLAWlhtTQ5WsjQY7K?=
 =?us-ascii?Q?zk6KFB20E0bNAQeOK+cM8q8wgZwslynvrauwIJQdbiYuPtYJvEEWPkSk3ouD?=
 =?us-ascii?Q?fTHQEIsSmVS986ri1iXQ7HXEzM15he/l1FssrxNyoV8+kwQubOVCKOgBhOB5?=
 =?us-ascii?Q?p8AHS2ORC0Qjcp6ZOWmjYUUyan+TCO/tsHzU8FbTSmm8HhgDGFbJF6sIGPw6?=
 =?us-ascii?Q?MP4PW6KohxV4/taq2fTUFQU9a6KJfN/UM1cSm4c4T6nd6HhmbyRRKyovU4ht?=
 =?us-ascii?Q?qj+/fKTfKJLB9PmK9RybCJr0MdHE8bXCPBlzDdgM4OKIo4R9XkRxoJibL3WM?=
 =?us-ascii?Q?PANqM42dsD2iZP02g5hn6xIs3Y6BRZIZKcB0Wh4uyN5nXmrLdI3HPDUwVLEk?=
 =?us-ascii?Q?ETnRNEQImkFAYbnaYBvbxTaNq3kfxPoRxPWCMCthfe9GleahaGExUB2/H/X6?=
 =?us-ascii?Q?Ez5y4cVoG4t0e1xSGixDdX5H7uUmux/B4OGC89iiRREuRL5IeFeptlhtGtl6?=
 =?us-ascii?Q?Vkymt+0jP1vHUVW6xSyegBooWKETQ1PKIVnh3pI0oUo4AFpIjaM/aYlgOyW2?=
 =?us-ascii?Q?mcELhc6nmmauCkNu4sQ6mMjAngYG6MKM2VJ8QMpipv20xVSDxGsx6oKKNQFq?=
 =?us-ascii?Q?bLkNfSvr/qWTJccssgW/IiFQVngwzOuzWvGTKoEsniTJD3DMbZA/Q1QF+L84?=
 =?us-ascii?Q?MObtiDzDSOLEjsD3tDva5p3rT/IQC93yzHG85N0NYIAVp7YeSZwaZD1mvPP9?=
 =?us-ascii?Q?FF6WFyGmeZ1ZAWmYcKJgeA4F/x/8B+AeM7SEKyCItjEYsPW6qYbqVRAKY1iu?=
 =?us-ascii?Q?BNCXwc/CNu/lULXNr6vn/8PzS0QuuNx7rce13YhrzHX2IGxSebrnP4lvGv+J?=
 =?us-ascii?Q?6sini6eHBBwFkSh5Dy+Zcvr3Xlhgd/X0mMow8pzJZ4fTxB+OaOokVT+0Do92?=
 =?us-ascii?Q?Jv8VLl4xTpcwxURN0JryfnxE8vC8nMQhm3xj4FvJKnNKWEVdlYOmy9Kt+Wjc?=
 =?us-ascii?Q?GeZMBiZi+rVd2BJefc+myI9yBVkQ0DjxPIiZsz1f3cTJpuuFQ3rgLIvmdMba?=
 =?us-ascii?Q?+O1qI/T9TKUKotBQqYVv4aQKKLgUM8WhuK1aWAijvxviRRXsY9v7RWX5PTjA?=
 =?us-ascii?Q?efrwlRvGtBo9xUWo6Pi+kRU7VODhxc2eVOhKEvreS+X+EdG+0dNFZx7xryfi?=
 =?us-ascii?Q?UCjJNm7jjXktEgzX2OQp/kIi1LpmiPavGoyymeorpxBaeQNAx1lI9cws8/ai?=
 =?us-ascii?Q?LhZnSwXfm+THZq1gsqR5CbwB1byHVKW4NAmdy/0K1VFPrq16bN6MWEXEPBe5?=
 =?us-ascii?Q?gEiyIMKJqGuDBs5SRRRswJe6C2UGoCLnuDFsdqU5AamkgmdqxEt+0ubOmbDL?=
 =?us-ascii?Q?g/S7jbOtyPfggRyo4M3i1p6KXOUpTR7T8dTNg+11QxanuUQ5c3A+MGJ9nGIf?=
 =?us-ascii?Q?koS78mqXwripT87JR1qy92I2uHrfWsxuib31tbZBflndDFyB5dNJnixVlyCG?=
 =?us-ascii?Q?1AncIK3iOrNXiwsGw9574c6zZlDYgf02AVKhfv1KIYrTsW1y2jqk4LlkoIc3?=
 =?us-ascii?Q?tOhYsz7zvIAiYw796DBM+xlNX/C1eCzkbsMGXvUoALuikK15NbfbSxPCiAxa?=
 =?us-ascii?Q?8ZLGLLGXv4xxhS9/84k11KZXUsghiiColM4eEl9iCp7uqcMpDMEyo8Dy/+M1?=
X-MS-Exchange-AntiSpam-MessageData-1: teZwljLCU4oB8g==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2a0d7c-eb65-4de2-b3ee-08defc0bf200
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 03:02:16.9705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQZy90hdylgK6oSJ+ZDWQCLteKG+Ac1ixyALwSNn86QQ75Qfpf8SIAaKgpQP4b+SApVrWrAJVeuP7TalEc5tJJfSoKIIv48gMqcrtoQWzrBAZjUNts9QxV50+kFCaH7N/SFvVB9BfjYYMRqtFHhPDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR03MB8355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_200224_951141_0341659D 
X-CRM114-Status: UNSURE (   8.46  )
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

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Add compatible string for the Intel SoCFPGA Agilex5 SoCDK TSN Config2
board variant. This board enables gmac1 as a TSN port with an FPGA
GMII-to-RGMII converter providing the RGMII clock delays.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v5: No changes from v4.
v4: Fix wrong email address in Acked-by tag from Krzysztof Kozlowski.
v3: Add missing Acked-by from Krzysztof Kozlowski inadvertently dropped in v2.
v2: Replace mac-mode DT property with compatible string detection.
    Use phy-mode = "rgmii-id" to reflect MAC-side delay handling.
    Fix Makefile indentation.

 Documentation/devicetree/bindings/arm/altera.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 3030cf46fe74..e431469a7175 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -114,6 +114,7 @@ properties:
               - intel,socfpga-agilex5-socdk-debug
               - intel,socfpga-agilex5-socdk-modular
               - intel,socfpga-agilex5-socdk-nand
+              - intel,socfpga-agilex5-socdk-tsn-cfg2
           - const: intel,socfpga-agilex5
 
       - description: Agilex72 boards
-- 
2.43.7


