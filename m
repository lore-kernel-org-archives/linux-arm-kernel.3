Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5376DC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 02:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtX4IYHJBHH9nu5PK7b9bb5RF1Cf861jiEF1RVf8+tI=; b=mNH/e1QPre+OtSke7iHejMK3vn
	Pi48qGP6m4521fL2BqMj4YidFHVeKzt19M1SEDtJL57oPEeC6LkIQEyftW6udsIH71EOqBz40GEnE
	dgoiAqRsGmEgWX0H/bC8NJIQKs5RSQdP8Fim2JQ1aNkSZf6IT69aA5JVyZ0/wqD1fBaQOKtcQ10Kr
	f+YQpQKMHpJirr9jwtX4e7YZr9SAVSoMIkNVIrC2D2ljguVwUGcQcJB+jFy8+ns5MO8XQRw6qhVQ1
	EuIO5+Zce4+odCZbNhHAFfBl13lEyD1KIe7vdIniFHo4BraC1qYzkKrKokjyV5YVMgHYON1rwfXNM
	lejM8VRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CRb-00000006ubd-0DAv;
	Wed, 23 Sep 2026 02:10:47 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9CRY-00000006uay-0CHE;
	Wed, 23 Sep 2026 02:10:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v62iWZCwdpPiudXjYVRd2lpUBX19fgsL+VLr9GEc8mCJlaar70bfsz7D9vjJ+T5lkHZc3fIy4+hFz7M2y4WgkmVkoJ5BLaXI7Xzw5OeUmFU28Bfbjl+2ilY6IQSFSAQcIDfwPnqx7gbFPk4IcQQbLwEIbytS3LMCyMhwofTz4pisDVApD8PJPRcqvWlEucnkTVKHy9cD5jBgj5/7gMyS07KUjc/EaJufltmWVbEwlqduCw2l6i/XYnZJsJ08//vt91DB3xELWnWeEv4DyXp7RwwEeWNvcq532vJW4rGXTFFelFr9tn3QQNDP984GxscDLwQwPqr1Xd79zV2P3xtxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtX4IYHJBHH9nu5PK7b9bb5RF1Cf861jiEF1RVf8+tI=;
 b=gL9NILr3uTg+ZdBAdtoXLoajqC1Z9YWBbEd/3yIxVw/fUQwnSOxYZipN5dtjGYrBh976b7tU5N5+UYlTT3r0MFx7taKsltYlv5w3WZ3Kre9GgCO3WROwgvzyXBUshpMi2zUfniYH89sJ8Jm5fdMfEGt132jdEKyohpqD6WXo4lwlbjvmVD88jmxkw4LIW5iFcfUpfRq1eeLSXPXdpsja3bdUqNHHs5Nj4Hpnoso4NIJ4LKsfJ3hI2dK0pLqC4ikzm3FfWJlykcDNlhCu9R8tg3pzmAFFKUhHMmCnYWzKWFjXxkUWrHZxpVHfHhU+TLScFCVF5FRGi4LvK/uDUnyshA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR03CA0012.apcprd03.prod.outlook.com (2603:1096:4:297::12)
 by PUZPR06MB5721.apcprd06.prod.outlook.com (2603:1096:301:f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 02:10:34 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:4:297:cafe::4d) by SI3PR03CA0012.outlook.office365.com
 (2603:1096:4:297::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 02:10:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 02:10:33 +0000
Received: from hongliang-System-Product-Name (unknown [172.20.64.180])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 288A343B1061;
	Wed, 23 Sep 2026 10:10:32 +0800 (CST)
From: Hongliang Yang <hongliang.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Hongliang Yang <hongliang.yang@cixtech.com>,
	peter.chen@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v4 2/3] phy: cix: Add CIX Sky1 USB3 PHY driver
Date: Wed, 23 Sep 2026 10:10:31 +0800
Message-ID: <20260923021031.815275-1-hongliang.yang@cixtech.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260906032431.470744-3-hongliang.yang@cixtech.com>
References: <20260906032431.470744-3-hongliang.yang@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|PUZPR06MB5721:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4e811cd2-16cb-40e1-1b7f-08df1917d9a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|7416014|23010399003|376014|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: l4+qGz4o4dffyc/iXgKb3SsxbB1CZcmlJEY4EieCrVPb//DBODLRVEvKfQTglMLFhyrE9abUaurzQzB4fJ9WC56KvNH0QAWPnMDGOQSaHfLXG79DMoZtTgEXOGHGyqwzqEjrKEnbBo1k8ngezu4LnMFZWEyWQjJBtpzUgskbX3wD6Q2FCDded5F5BCxQEjfQxnap7WqX8+I54fvmJGPQ+kBh+/UGbOnAWWrdH8l8Df+nZcl7mE46ixYkTPOWtS9onWM3fvtPn2171j+1LY3dfEFISgfO71ioSI7uBPYeY8XPUowCiabc50ezOWWuW25tMWjhGK3m2mLDyv3v2elqem22qcxDmkWX6TlrqWBIBzPtr40NBD2i9M1CphX6t7V4TwX9DK4YpvbuA/Jfe70ux8yHE9TIua2jHeF766aTGF2X+dZGIOiTJmhHhB4f+XjzxK6lZTGe+g5Ec9TR3Hxzy4XTKibLmaoEKumXFgbFVlzMyD5jjvfpfEyTX3NSnA0nVGhBNIwxz1FdPplEiDoMSbky2WycaMS98QRDYpf/WFY9qBiP9xfEQw4DDV6jtEv/FHrR7pUUcMbUBz7uYCwC/mN4RgF6A/ygMxyA5eTGxRKuQp78o82keVDnkuJcFU+S3cpmV6uDupqvAAE5jf6kVBo29OgbQ9R2EYmqr4RhXSZUXJA75Ks5D00xIjYcmuRvPshbzpHHYV/yvpz7118xEA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(7416014)(23010399003)(376014)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2uI9ZaesvWZnNi46dBIwbF3UGudV8pBsTr0TGMBcq5LufZRVUHjF2pudP420BMP7CeeoDT9cj9IzcnNb606zYUA2AmPvN8eUty6R/+3XlC2x5geOPz7vIAKxd0UP7F+WzN8SUQIFW30ChiJNBr4gC5Ll2amWLVoft8urNPFpt/6sB5GSO2AfbZw1d6NtOqgFm2xu0CL7Yp6doTiqGdsI4Vl7BGmCiAfmKMY/8BJJpXJLKaqIPURukDREAaxdA/jvxEFBwEVVzFBlIq6oXeeNKi9b8dU+9eI7XL1GzmgJMnl7lWOaNnF0nUsUKc47s/ZBD+8Ro8l4LQ7JalOLPia4Ghp/OHskjEG0GBstEsCuX8QgYDOddB0LilvHoEhllbsPwGMzwLp0lBoudHwB1ViZPM+uq1gtzVulJTOh/bv1z8awFcc+rckCYwegKH7Sjfmq
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 02:10:33.4038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e811cd2-16cb-40e1-1b7f-08df1917d9a7
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_191044_084576_2CD82E4A 
X-CRM114-Status: UNSURE (   4.82  )
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

Hi Vinod,

Gentle ping on this series. The binding (1/3) has Conor's Acked-by.
The driver patch (2/3) could still use a review.

The USB controller glue series that consumes this PHY is also under
review, so having the PHY side settled would help both.

Thanks,
Hongliang

