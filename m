Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81A6C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 05:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ylZ/CvgG3yh2HSIJShoIBFahkooqMR7/RY6zuzk8lgo=; b=ewvFh0oQyyq6BxB/6KbVYwuzUH
	sVQjIqhcqhuFoySXYuT1Qk1Qpr1VV4Qsdgij9TsSLvb7vUGpmbIXrM5DHulN7fKjTI/uE6ODgCYmg
	aAgD+MGwHFhzq5mzEDZvfPIknXFBr/42XroU9Amgj32BOptaLT2zrQ+5nmAshMX0idllxVALuNKlQ
	JxzqVKKPXgPn12z7sCnx/IiI4RB/JHIrx/fuXLyXeDsW6SqbBLVSnAAS0ENJCheEURaEKLUqOoxVh
	iJXVIN/ln8gIfBOgKJzvKLJwaQQ8B5PXG+ifJq9iKy72bTLMzjbXHaVIIlR72muptZ6H8KGeNCwYi
	jhi8UUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89tZ-0000000GvQg-3tFH;
	Sun, 20 Sep 2026 05:15:21 +0000
Received: from mail-japanwestazon11022136.outbound.protection.outlook.com ([40.107.75.136] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89tW-0000000GvQL-317E
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 05:15:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8SPU5oAvtezlEd4woUcNkLHALbOsUJgdptDyX27GWCxQKPbAgC+WyPDXNJFWfJaKD/IPB7czGlDqmuLYvY16lX6Z63EjWvB2tadTw/DB+Ve/qVEBlDytIcK4zZSlKn0m6oo4Xav+eHBSXmMw0SOP6BcYdKemutbifiJpxKtHZdWf+cOJeTPi61TOHjd3J2Tiyxp1gH+VZeLWMFAIPFfx6wlRyBkEZ9XHqzj8tQ1VRIseHjeJoWTNqshxcDkC8kPeCZMKxuaIYNFInfQb3CjYlckCYybsJ4czNso96UG5MX8oeMrWwAgQvpOlm2u0jTQughEDf2HsjCtBmxojgACNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylZ/CvgG3yh2HSIJShoIBFahkooqMR7/RY6zuzk8lgo=;
 b=pxXgi3CxESXTde6BDP9bdo0xPDjvgOYLxLNwOLCmScwsOaz3VJAGjJHmj/Zb26QE26zwKFOQAiasENSpzOy4bbGI0ZP9iLrRfvpeQJK0EyNFGD78d241fORMG11pR9tlAicSC9KuCVKIzG9+/+xcbtpf3d2Wpv4BVsAfJplljS8MzLoI1v/Ksr6e7jInX2o9ihi8oLpkStfH/JDlpDBfs3VtX5PKsnGVnrRfZIYPrb8ZlRSdfFHQq642+ETE08Ka/T5u0Kt4cwQkGII0IfxzByVbN6EHF4LAiyUn3ITAkaYJ1ikt9rt2sV4bbHKgsxY2t8y/chYOVgmWgrIUWdEt2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0356.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:7c::8) by
 JH0PR06MB6891.apcprd06.prod.outlook.com (2603:1096:990:51::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.15; Sun, 20 Sep 2026 05:15:04 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:405:7c:cafe::6d) by TYCP286CA0356.outlook.office365.com
 (2603:1096:405:7c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.15 via Frontend Transport; Sun,
 20 Sep 2026 05:15:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 20 Sep 2026 05:15:03 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B587840920E2;
	Sun, 20 Sep 2026 13:15:01 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jelly Jia <Jelly.Jia@cixtech.com>,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	robin.murphy@arm.com,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/5] dt-bindings: dma: Add CIX Sky1 DMA-350 integration
Date: Sun, 20 Sep 2026 13:15:01 +0800
Message-ID: <20260920051501.3620794-1-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aqE42NzerAiD2U1E@squawk>
References: <aqE42NzerAiD2U1E@squawk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|JH0PR06MB6891:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: db941cae-d928-4856-80a4-08df16d6207e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|1800799024|36860700016|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: OAJssUO5OBQLxSxysO2gjsA4HD70vatnsM/JWqqtcnGhYlgP27EBi9Ywp0Ou0QKHFObaSoFQb914F/9uMOGtX2xg3mIlnutcxnRf/S7HcadJ2lvz2b+BOULQ5YM8UkhFw1JKOvB8f7vY2eEdzuidSfLMrjTMr4+U27s4SY6SU0RunUoBUmzGVwGYSypxFIc0V+gq9JaJid8zoUcfV9N/nquhZFKQmzIF3hOcm/GK/kLug/WViwUXGvdZMBZ6cU4nTiwqwwUz+G7NqflZzzSw6m2MaJ0DiTsozct3LKHzS2PLII3L8Zu9e4EvqI3QMi6eZBrLiRxShB6WfNRgK9yyUIslYa2rT8hea5JI0Vg7p6soCWIPXxIX+UjaTAg1B5YDosIGlhde2BOYabFudaUOWn2gSXgZTVwi/TNNpiOYGfJwd3IOXwUQE7uPD8H0s7lJaE8H/iU13BhbMGIc70SRL5Ea/n3aUF+SjrC8Oc05ZFm8jTS/Dnyl3qr4ZSBphhhCMfT5FgueQph45VaroFVX4Tj9kTWJcPJqYRX9S79s8qW3X301N9ek1ZqR7iaHY1d8FSEeTrvdHQwgmOEIW3kv26/J+//hg+pAnSWGI7PCcdHkK7Hm2WjezlilICVvKOkEssLqa7/x5Lsgjg7FN2ojznzALT7pFseJWpmQWpGbKk+l18UpYWVh5Mvm6Un87BQ6+pf2u+r6W6gD8EkjUPjOgw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KowlSTKsSt9TJdAxFPtmIulOQxSk4H8krEHbIsvLX/3BxqqksLTr1ZNpAhVmdK8Dngu8n+h0JU2e0qwXJirROV1wGFMHfQpBVC+U69wxmyNbF4kS518dhvRfaKTdBpO+BwDqcqHLQ2sckcytkI7MOlskCJNhLeGi5qYf4eqoM5qnzRqPYqiD5mmiv+WLzDKPlyUWRaCgSoY2jDf+BhTq4KMsKQdpICNRATE3I8t7B+o9NqxZxrpyvdvzGh4VHjvschyzL3jBXhb6XBZuT0qPtY7WQQa/rYkmLsGc2R0UV4TRE7ux3J6/QWlVuTLvowjv2FswOnU0PY/j+ai+9E4GWZxVESqLgQorDxgWnN48UhyoTcYGXaG0kXDpt44DfNowj3XpK6uJVIns2ZvXvpENt+iJ0kN7eh5Y5uI8NWM8xZQeMsEqZSpHps69Y3VrihvI
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 05:15:03.1384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db941cae-d928-4856-80a4-08df16d6207e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6891
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_221518_763999_CDB0B00A 
X-CRM114-Status: UNSURE (   6.20  )
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

Hi Conor,

Thanks, understood: with the SoC-specific compatible scoping the
integration code, other platforms are unaffected either way.

For v2 my preference is to keep the wrapper, since it leaves the
generic arm-dma350 driver and its binding untouched. Does that work
for you, or would you rather see the dma-350 node itself carry a
device-specific compatible, with the clocks, resets and
memory-region described on it? I'd also like Robin's take on the
arm-dma350 side before restructuring that far.

Best regards,
Jelly

