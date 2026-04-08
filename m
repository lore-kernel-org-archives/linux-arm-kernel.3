Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B27310F995F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AYzV1Pz7RRxxtiBsImtMmoSwFmgelAN+tBXr/yIQonI=; b=UBI9UXSnFB4hKiwJKtkXhibg48
	X2U/aHQUUPFxvtO4WXs7dexCgpZKI3Vdyu9aqB2f/4a3lw1FSn717b+37B6rMumOb43sUHwv5ws9c
	uToRyXpLIMKyaK3Gt2qsr2gQ4/JM23CUAh3KggVYuF5scBI0/JkDcd7Ii27JgWd9QWmLPecEgqp+f
	240YnroG6mMU4TEB/wZYKDhUR8gFRGgoUME57ijeVegLMN0l70K9pW0xFZfdqr12tjKzFwupCi5YI
	RVD1PiiQ94Do90Ts2gZB4iBc9ftZAm2tc1L6TD9SG1i2NbvWnqLuQ92pzC8Y/lPDulOa/rW+ePfI6
	N38pJgng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAVuo-0000000980j-08YL;
	Wed, 08 Apr 2026 16:38:06 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAVul-0000000980J-0d9v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 16:38:04 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=tsjV3sUpJuglzpeSe2oI40YJS19pCwqCOFSA5oeHXybW+lxQu7OUU8rQ+ilPuC1naXxrg7U9Rgi2m7wY0F3z61g3dne8UevXg6k4GGDCOUVNy6VI2Jmj/Rn5MfjrfDlAOhzwd1CuG/+0yqZByf8WuR9avx+ZJNFVA0Q/MoSish7ScWgkMptsU7GsL+w+n9aWkreFrwOjn6FS1BjJ6QNkfx9al0H+1z2n1FNWfNA7MFJYCLfKQKb3RlDxRsS5Xr05IMAB5J9WrVpQMTcEGyXcl7KDf8LqpPEFfAlsSJNdEfzvV1Yq1hLqwQzkvICgvBZaLRJjMcDq9laYv2TOfbV0ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYzV1Pz7RRxxtiBsImtMmoSwFmgelAN+tBXr/yIQonI=;
 b=WxBckny1DaA7q8i1iPB94LquawvCh5XCI/TpOJw6KplI6dD1jgPQjrT8ojdOLipZP0yf0aMyFJJhbVG6kFYLhiF74XooJpuQWwdzbTKIuZ6Sy/kyw0lvaUaZPkseQo11AcvtWwxRnPjGgFfHYAY/5WHsTuMclSerlGBBl1TLs+XeaI0e2Cw+/clKU01T1KC//DTfWHd6CdlP+NBanDqRgwW9VtHvU9/waCHAXcAjZl+yHYBVLh5c2pAKGbP2O2O1JW0LUFnc2tGgT/AORCtXlnhVSRa2iSoW+3YUJdNgFO12v+EVkBOzuOeZrSJ7Akf4lQ2hT2zqBNu5/25P5QAxLQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYzV1Pz7RRxxtiBsImtMmoSwFmgelAN+tBXr/yIQonI=;
 b=kr4re4/EGi/GRYbM1pElitq9Hr8VLKlZplkqwj3YQzZmMtOEYb5elfXiuXU240QezjQxmCCUrtXWMs201ksRmwBAVtozG3A7BhwTBoKPjULVezwbLvNqAP7kOHeFT7/9MZx2r6DTcpCc4wDxt207P9whvUkfD1BKwyLl0pIPkkg=
Received: from AM0PR10CA0023.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::33)
 by VI1PR08MB10199.eurprd08.prod.outlook.com (2603:10a6:800:1bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 16:37:54 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:208:17c:cafe::2a) by AM0PR10CA0023.outlook.office365.com
 (2603:10a6:208:17c::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Wed,
 8 Apr 2026 16:37:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Wed, 8 Apr 2026 16:37:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=incU4KDy8QNqCUvJrHz8d/yaYGqvngdD1JhHxnr8zkRL5pPVf+H+as/aHERjJE1ANb1B07hehJ19yJmhuH5bnA3KGytLGF5wuRYrnNqNp0CQ2gSx9h9xTc25KlwvDB6+uQ3oBuYH+lgCdI904hEKvaeUCYXDN2ftVYx+/yyzgRb4qVjPZbHWEInGdulKuA6R5HRVG/G/ZRhu8Hxn1klHm1iFVvR8hgTqvHVCihJapBSuRNQJhdWSSe8e+R1y+4lSLElZgp3yetHDJKGLTk80u3QyrSNQi49fwI/srwV6eImxxuPQu9E4SW4fb6EPxoMHHZC+Y/JRxTzLkT0DI34hFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYzV1Pz7RRxxtiBsImtMmoSwFmgelAN+tBXr/yIQonI=;
 b=fd6sky6zHXdpfu4sto0UW74vu1N3xMhZOnvtMyvTlzr5/JRkGn4KtgbjZu5A97FIlwVpOSGpD5KIB6T42Mx8llUwFQQ7q38lUgY6RKnl3EOjituLZy6H9lm+1hoOnwhYWxCR0w5rsxngRV+Uxb42x41p4xxptzNxCLEfDYGOCkCq2FCprFximCZ/WF/yyoDHVvzdlxRbKRCI5ZxjVoOZP+1IevEjHEhyc3zlibNhPVo+6suApt7h0TAPUxtE9q1qMOni/nucvJi8ClI+UpZTt0un6VCCyncOBU7xA09OL05zex7Gv4QiKoI+iaYx1Gp2dLyjF1vRWDCp0FPMFHISjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYzV1Pz7RRxxtiBsImtMmoSwFmgelAN+tBXr/yIQonI=;
 b=kr4re4/EGi/GRYbM1pElitq9Hr8VLKlZplkqwj3YQzZmMtOEYb5elfXiuXU240QezjQxmCCUrtXWMs201ksRmwBAVtozG3A7BhwTBoKPjULVezwbLvNqAP7kOHeFT7/9MZx2r6DTcpCc4wDxt207P9whvUkfD1BKwyLl0pIPkkg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10) by DU0PR08MB7883.eurprd08.prod.outlook.com
 (2603:10a6:10:3b1::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 16:36:49 +0000
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04]) by GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 16:36:48 +0000
From: Bence Csokas <bence.csokas@arm.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Bence Csokas <bence.csokas@arm.com>,
	Daniel Kiss <Daniel.Kiss@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Subject: [PATCH] drm: uapi: Add macro for chipset specific event ID region
Date: Wed,  8 Apr 2026 18:36:06 +0200
Message-ID: <20260408163608.361826-2-bence.csokas@arm.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0038.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::10) To GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10455:EE_|DU0PR08MB7883:EE_|AMS1EPF00000041:EE_|VI1PR08MB10199:EE_
X-MS-Office365-Filtering-Correlation-Id: ec78793b-2ac0-4c74-a984-08de958d2f2f
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: dsC1BnVRQGw11EQ/nDs52oi8ghP7Wo8T4aIZOZrQ5jrOr3G0+1l3mqIx8OfdfKS7kWTsNJwc/anQLSKowBPcTyd2uDdBNhtNbZNNsRrSe6JTrXZ7kmdV4urEoDhiHPu9WdAlegK3A5JPjDXIJYZ9PE9HJYyCmrWnRqpM1D2XAoxXeHL9yJ8NUT7EGfLpbw5zCnaYm5vLxIfHW+IxwerqDwu7irSEEXLVCOTwVt5EXg8z0Woh5Wu5QuC1WVd0WeoJwMs5m3djBlMR9bc7rdS4k70tIr3iPGiPQtLZ1rgEbHPKfsG3y2xjsFb4v7c6zaak6c6BJSIyebIdbNpjiGewLzXM7w1hPlfK5l1yttKl1quKXm8tWqAz+2MZ/bDWSP3LxX0dkiJ7g6xyujE8tfd8SNgRlaeeUQQzef7vjZA2qsit1UbMA3CRf7L/sQYk64Z5EgxeWKaqnlDOMxKW/nUhJJR1jXy98j2doE0G5v8yTzH7hcO83TwE6g67UMB1tbiz++v4hRLk+Cu0whcYsn/BOQTh88kic8+Eh2eHHAAB5wAsmyqnuBTaUkO/LRVMidZCeYH4pMELV7FS8RzMo+WP8p92gy83hXPoWlEhNGuBaFOo0UDgXXiIIM/uitesJbn9a9bJ8w4X5fACzxm02ROq0NZg9mcCNm9iTDwIpJ3FMo6Tr9xOA9nU8wTZ3LfVGiVBIm/NdaaQv1sD/3EipIJnSgWBfq8FpSVVI5SjJT2/lT8=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10455.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: L146Aa3pRosfqNnVGNIfp/DH1+LKP0vO4c9uUkmBM201NLeFDWajqAnlkQBhQYJe8qP9gOon1zEd7kFqxIO2oNrgEXnQ98Ze+C1ZmKZ/m9c6s1Pq7Y7p+8Q5nn+xyDQtURSb4J9vvhi5iYtj7pd2WxZhDxxqnKnxAV3ATqfiZPQ3PVzQ3rkxM+2ERH9AzEHBECbW6PFFsIdbdc7GrSz01tHGX5MkEJumC0SIeAnWR+D/PQSgmy7zDPt2sptBL5E3PwYq2di4cHT9GFyLIiOf1Imq36P8D8GLUHH211fkIr9iyLzSp8sxtOB6v0/i7Ry0EVPrEd02WHGWJ1fZ6YuiHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7883
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9ce24bf7-13b3-4343-6a68-08de958d0795
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|36860700016|376014|1800799024|7416014|14060799003|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: gn328MYVDDXy7Vlu+azigmi7zrI1/xuPBzpKsjU0GypuH9g4SN3kb7cAtXKgdtFIqPZcqUDjuzz3kQDRcPtUpf2iCQ3Ccvy/p65BB4R9xJ1kgqicFFDP6F3dwzLL35pj7vw++vt7FNBFWH/9FWiGmV1RChOXP4K+hv+CkcW6gsc3f05Tfz2m3JFZ49TsjAWQqKbEkZ8l4GxnGe+1/Ax6vIURNo1V42XAz60JvjFk/v0Lu12Ub0St2wo4BMELpwtU/neWwfjLXqsQXgJO6STZcOeiImRQCajWYw7rfvVlF/kfsNrtN9btlhLQLtQfN7hhoPUPmc1XidztuOeMDfS83kmpYKpaSHjElVwhGDywao/fmM4smGvp7QZFA9cr4jpeB06FqsqMBthFJLilZduQqSH8SWVDW2ktKtRgqbE31w2SJl2do3Danqnh+rIIjGDoZh5CxkhVUcQYPPE0Q+g3XDSr4OMZEOFGjBe81CqqNxWxw6Fd6O9x8f9rjqQb0X/Igwz1a6qEFcGWMYviwN444xJcoP1jQB8m5YavbW3ZqZ+geqLGdUntgwlHBYoVhWy4Br6thfIxAgzjQC5x/J7jGujl4HoD5E8K2ZbYQa4F0iSNYXfsXsNYujCbTixMqa54VLdZzM9762NZAkheLeU/OSjuQC2YpF/OXA6xKG2TXqGLLWwfFekTQLGY5fx77mpU2bbnPEWTp2PAxruua0SQ9M7McU0o9Xj/9FdLod4uSjnU9ToYU8sQ5J8QRtnj9gczGnmR6ME+FTQ/i+vGrlZPCg==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700016)(376014)(1800799024)(7416014)(14060799003)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: a+JQt8VUy/ucP4AaiLHaLdCMEHCUCxB0kdZTKRY2uwGsmNL5PN8YfLSn4ZnPFxUYU+SLP6fqO98/9R01CdJR9sXXwFyLs5tuf6o/y487a29Wnw4DAYz0W8iF6wcNDYaV/HmDb8kgEEAfvUZDB7g5QU3NzOxHaqw1Yp7MJTCA075a8GHxHnKzYiq4H2/R3CsNdFBTE/uCsWw9vV56qxxfzLe1bTPbVDqjX5Zd7e3nodCyB+S2mFgbyzLuTj3a9rwAnrV769h//Bbz7D4Wfa8WicRrl+6FNAuGOMFwj5/227WH5O95ZVTOpoMOxv6aI7jjCAYzcVBojigbGXP6+CkO+1Thk2+aKd6xUs+DVbqacWHKXZeCHuQXMOD601eNiNqjKvuduGLhGIk5wNZhkPonubRDWvkH4a8uM2LJWtyaUqutCgqf/+peZecxbATM2T33
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 16:37:54.6821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec78793b-2ac0-4c74-a984-08de958d2f2f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_093803_267183_7A4EFDBB 
X-CRM114-Status: GOOD (  15.03  )
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

uapi/drm/drm.h states:

    Event types 0 - 0x7fffffff are generic DRM events, 0x80000000 and
    up are chipset specific.

However, this distinction was not put in the code. To elevate the contract
between the generic DRM framework and the driver from the comment to code,
put this in a macro for clarity and convenience.

Cc: Daniel Kiss <Daniel.Kiss@arm.com>
Signed-off-by: Bence Csokas <bence.csokas@arm.com>
---
 include/uapi/drm/drm.h         | 8 ++++++++
 include/uapi/drm/exynos_drm.h  | 4 ++--
 include/uapi/drm/virtgpu_drm.h | 2 +-
 include/uapi/drm/vmwgfx_drm.h  | 2 +-
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 27cc159c1d27..aa745e643ef4 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -1419,6 +1419,14 @@ struct drm_event {
  * The event payload is a struct drm_event_crtc_sequence.
  */
 #define DRM_EVENT_CRTC_SEQUENCE	0x03
+/**
+ * DRM_EVENT_VENDOR_SPECIFIC - vendor/chipset specific event
+ *
+ * These event IDs are reserved for chipset and driver specific events.
+ *
+ * Refer to the chipset driver's header for details and payload struct.
+ */
+#define DRM_EVENT_VENDOR_SPECIFIC(_v) ((_v) | 0x80000000)
 
 struct drm_event_vblank {
 	struct drm_event base;
diff --git a/include/uapi/drm/exynos_drm.h b/include/uapi/drm/exynos_drm.h
index a51aa1c618c1..8d3156fb129c 100644
--- a/include/uapi/drm/exynos_drm.h
+++ b/include/uapi/drm/exynos_drm.h
@@ -395,8 +395,8 @@ struct drm_exynos_ioctl_ipp_commit {
 		DRM_EXYNOS_IPP_COMMIT, struct drm_exynos_ioctl_ipp_commit)
 
 /* Exynos specific events */
-#define DRM_EXYNOS_G2D_EVENT		0x80000000
-#define DRM_EXYNOS_IPP_EVENT		0x80000002
+#define DRM_EXYNOS_G2D_EVENT		DRM_EVENT_VENDOR_SPECIFIC(0x0)
+#define DRM_EXYNOS_IPP_EVENT		DRM_EVENT_VENDOR_SPECIFIC(0x2)
 
 struct drm_exynos_g2d_event {
 	struct drm_event	base;
diff --git a/include/uapi/drm/virtgpu_drm.h b/include/uapi/drm/virtgpu_drm.h
index 9debb320c34b..03e8a0c7f778 100644
--- a/include/uapi/drm/virtgpu_drm.h
+++ b/include/uapi/drm/virtgpu_drm.h
@@ -224,7 +224,7 @@ struct drm_virtgpu_context_init {
  * effect.  The event size is sizeof(drm_event), since there is no additional
  * payload.
  */
-#define VIRTGPU_EVENT_FENCE_SIGNALED 0x90000000
+#define VIRTGPU_EVENT_FENCE_SIGNALED DRM_EVENT_VENDOR_SPECIFIC(0x10000000)
 
 #define DRM_IOCTL_VIRTGPU_MAP \
 	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIRTGPU_MAP, struct drm_virtgpu_map)
diff --git a/include/uapi/drm/vmwgfx_drm.h b/include/uapi/drm/vmwgfx_drm.h
index 7d786a0cc835..5e5878384e60 100644
--- a/include/uapi/drm/vmwgfx_drm.h
+++ b/include/uapi/drm/vmwgfx_drm.h
@@ -715,7 +715,7 @@ struct drm_vmw_fence_arg {
 /*
  * The event type
  */
-#define DRM_VMW_EVENT_FENCE_SIGNALED 0x80000000
+#define DRM_VMW_EVENT_FENCE_SIGNALED DRM_EVENT_VENDOR_SPECIFIC(0x0)
 
 struct drm_vmw_event_fence {
 	struct drm_event base;
-- 
2.53.0


