Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32445EBFD1C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fK0TMdysGd0b7HIfitX9EOQKTeDQV6srXBzl4ZAvVr4=; b=wpm/4P92hjAuVcBeLejbtw8zD/
	HfbzUxlv4PgPUxd78eteyIFdqataIh17AyaOC5Y7lbgeMB9kQTU8IoiIk0+1nMwwq/8fVI5G5J35V
	GnAXqf7N5pARnr1t/HOPFAyizTcDdsm7Mi65ZBCmGAGMPJao5tV3jTWMrKgo/7/zbHbpqhIbtCdPy
	INoIYPNhcwvC6kwje4mPYOaei6ViZypb78XN5aWCtzYd669d9K2LMgYhRM0t8Vwn15yzkeNt/1mwi
	kG4nuTbaxZldBNMKxanE0PH/MMT8K30WUrGypxN2UPTP2dV4IVQ2Vc+LgoZkTqQqQmXW7usijCpGj
	K34jZ4nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD26-0000000FIk9-3Dir;
	Mon, 13 Apr 2026 08:52:38 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD24-0000000FIjO-15nq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:52:37 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=oPYmyqRU9EiEiHEXNqLTzGFj8kumRzJWsxdrkZz8GI0q5xBcdtrQ4WsGZtElTa/4WKImdNUa4DLId+stJhsbtfSllYb/hDn2/fs8sb5JPfkZ+bbRWJB1V+0JuJSsehia716DACkd0lOltuSMirVyy/ZHI3kvzGt2WwxCpTPx5RCe3152FSyyPga+sQLh4bgSZr3scfSXr8J9TO4/egP6PnjLDV9tBahfBm4jF+bNy6X+0VGMnuIXDcxyFdxjJD0RzWR6kqd+LL/6HKX7jALC7hAzc0fZYCkH9guVrEGKq0RwLRlbFs6E9mhJbBQOCck6zu1BgMNGUdZjLwew+vsuSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fK0TMdysGd0b7HIfitX9EOQKTeDQV6srXBzl4ZAvVr4=;
 b=clr3F9tSVyREBOpM34mXVRFT/diUH9agc21Mqm87ChbKkdzYN3xtBqdwv8FN+s1mHOJYMVL2l8JyrPGdHQYh73hKFXVY8kzlvbreankTVWqaHryPfM+Nl64WkUmrZZ9mYfh+RUxcZzMGFmnA0CMGvVGBSfGgBbRPRQwfp3R/iXggpkrNQ7tDVkmQkvavdsufRDHjoMSjABW0uoB0BRwZe+UiOzmBpCTfdrgYYED+QpoIgRb4VgVSD333qMgV4b2XCJch6lRPmrNjdAVpBBCdnM3zhjItY9dYa8QY2OnfaK5MJFI5MX0I0PgirzWYuWic8gLBkNjoKY1UlzSi3MHgew==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fK0TMdysGd0b7HIfitX9EOQKTeDQV6srXBzl4ZAvVr4=;
 b=GTAkuh7XB6MdUCD/3Wo3gnMOmCLfq79f014USkXCR/s+8EGXMncrio1JFZGpwrUMk3U1tPDztnRg6NlabH4j9kraPijU7jHFiehZn6P16BGSzX67SRWUXQmZUwJesoqovb9ySVXVa6MmciHTqIp+hzfrZ1VJSs/xK9JCJmmnkQc=
Received: from CWLP265CA0420.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b6::18)
 by DB9PR08MB6699.eurprd08.prod.outlook.com (2603:10a6:10:2a7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 08:52:27 +0000
Received: from AMS0EPF00000196.eurprd05.prod.outlook.com
 (2603:10a6:400:1b6:cafe::e4) by CWLP265CA0420.outlook.office365.com
 (2603:10a6:400:1b6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 08:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000196.mail.protection.outlook.com (10.167.16.217) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Mon, 13 Apr 2026 08:52:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcs+2aVMvmG0JyZ/o41D/K/yWx3t2uTrAee18gsua96mgHqmLuEasNqEML/5ow35deewjBsYSfnDPjWNvekd0INVtrRoGwuNL3Xd1sD0tBYEMAO4QLEIN+t+Mc2nG3L76hBDt78Tjx0p94fse0/HQsNmMd8HOgAdVY9+r1SQBmHbwZQnEi3xu3DNkKBTrLAZllDkRA/y9yHKxsN1EXbeM0BDn0PO2xLNlU4hQXcKg/7p72XsWI5cpUZqZnYQsbS4Cz5+d9VXZgI/r2huVooPJZIIXXVUFPogYjvzQm+VgLqziJ9QSeq6rzQPmARJOWDX+E0cmWtcqgllowqjbAGPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fK0TMdysGd0b7HIfitX9EOQKTeDQV6srXBzl4ZAvVr4=;
 b=w/BUp2ndq2PGOakK3MeaSocCmP+DR7Weq4b57SONYjPFXE3Vtc0vJRtbhzQ/nGD+BGODEK0AgbMVHB+Co2AD8khOcujpqVP0AD4nj2YIGx/CamBpr7aEm3QyFu2zqBTBP5knlbbQkzggc7wZqUapY+sUfx5wxdbkKnym14+I1Iz2nmi+/YPKy4PB1eAQYJ4aiJameJgLI8NJq5FaCIO0oj3zWfzbzb6ML0tSDpwJbl+i86fmf4cmSgROo5CssjR/dUw4cCLZO5GbJ+iebbqDK+KQ0TwWwIX0qXI2T1gm47sE1rAljuoiZWfP8n3uPosytYtUYid08agwcTFdCAfBiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 172.205.89.229) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fK0TMdysGd0b7HIfitX9EOQKTeDQV6srXBzl4ZAvVr4=;
 b=GTAkuh7XB6MdUCD/3Wo3gnMOmCLfq79f014USkXCR/s+8EGXMncrio1JFZGpwrUMk3U1tPDztnRg6NlabH4j9kraPijU7jHFiehZn6P16BGSzX67SRWUXQmZUwJesoqovb9ySVXVa6MmciHTqIp+hzfrZ1VJSs/xK9JCJmmnkQc=
Received: from AS4P190CA0034.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::10)
 by AS8PR08MB8442.eurprd08.prod.outlook.com (2603:10a6:20b:568::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 08:51:21 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::8f) by AS4P190CA0034.outlook.office365.com
 (2603:10a6:20b:5d1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 08:51:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 172.205.89.229 as permitted sender) receiver=protection.outlook.com;
 client-ip=172.205.89.229; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (172.205.89.229) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 13 Apr 2026 08:51:20 +0000
Received: from AZ-NEU-EX04.Arm.com (10.240.25.138) by AZ-NEU-EX03.Arm.com
 (10.240.25.137) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 13 Apr
 2026 08:51:19 +0000
Received: from localhost.localdomain (10.1.31.15) by mail.arm.com
 (10.240.25.138) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Mon, 13 Apr 2026 08:51:19 +0000
From: Sami Mujawar <sami.mujawar@arm.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <jgg@ziepe.ca>,
	<thuth@redhat.com>, <Suzuki.Poulose@arm.com>, <steven.price@arm.com>,
	<gshan@redhat.com>, <YeoReum.Yun@arm.com>, Sami Mujawar
	<sami.mujawar@arm.com>
Subject: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
Date: Mon, 13 Apr 2026 09:49:54 +0100
Message-ID: <20260413084957.327661-1-sami.mujawar@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AMS0EPF00000198:EE_|AS8PR08MB8442:EE_|AMS0EPF00000196:EE_|DB9PR08MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: 10cd8c7b-f1aa-44dc-a7f7-08de9939fd34
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info-Original: IUfTB86ju6wVnO4swZbh4Q21Rv/tXLP+Ya5bxibFsobGrL978JYDNEvw8ZoedkcPExVxtr25WF+NxUFkeya3d+hQg510IGVFDvW1e6NB4MAQ5vvVm1itm/YwXeTrACu7IFO/+vQNWcxbgtRYOvklGfyoZvs0haA6xye3iR0u19Kz9XnAIW3yL3SlPjYVRbYDE1VGw2QBMjDMjEvUAnxHhu1L2ZMJbLuLHX1q6KWzYYdmDcz8c1uPTsSiv1aJ3yWjKy/IXOGc7vj5rizNwjAUblS6W8cBLr0txZB8lSGYgins6iehFxidQE2ny4QeOrvWFgHli6QHIpmUx6K8pGUv7pplOqH7AFdqgpSxIG72OTzDjLO15WbbzQ2MlXOwWxolC9HjavLB59r4IK1BDspJT553QJOI/bsOhB7teFjEGkxbfT8NxyRs51kBUJ+iU0ZVfDDj0JjK6WSTToql5kvGc0DlIJeL1481niVKefXFiU+zI7Ie1FzSvpmvKjgQxCkoKkt+xIsI1ZWOostQjDTGEPkA5GTORhEolPfO/CNDNKLtXyV15RdpVLToKuAmf0WFvrqWpHgCo03tZHV5ErBXgndN5qSwsV+s/wYIMCR7mrMe+JKlJQRycCNFpggkhQpUWGHBUeKUhQJWXT2SgP79Wv4BiR+rHq4zAyh7gNgcgTQvP4T7Y9DkDq0PSS5cNORvW9QMyGCqC68eUpQ+L0+c3uLC44VVPAgaGH1+9dRk82lEv29nOKlGvsw86d1m2s+YuczkOKfO1brFjg2nvpfNIg==
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: a96UwkYwO5N7XytV5Tf3Jkbanp8CSXUYCxzLjtFHYecmVp7fwrr5LBogKDyncLaNyQEk/HDpfILhqFtGZTEFojpLBxJgz7KVyjfxqpmNTPsQQTjoln/CwzfEjhjK3SUP+v009OmGecVTLySw1wrNsNrDHUV9guizho9pmExqKtATHoLnNQItiZNkjltrPYiP0tYZWFiSN67esAGWRrBTYflX0Te5ZOs9BvnQUKyAq8ZKLhb5v6HW7J5J7C0BMxBTh9uNYM4ZDqQHv9Gf8/UFIRCyvSECpwDPgnklpCAHyIS0/OHRiHj1tjw/rGoNaZujw9bhewzXIUYeLuh46QTP+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8442
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 965824d7-46ce-4bb3-d84c-08de9939d51f
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|14060799003|35042699022|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: HlgXXPxuyg8IZCq1tZyqtsdgi7AHHL+VVbg+LjpwsMSjjT+XDr+r4nAVWT9kpiGtN4boeU/Xq0DWEJYIMaUN/pVsbJ0JM25MHVxNFf1XfdSSJtYRcvO6A9vtHIz9Bv7NhsEBM6Cp6vV2Ad5J0s/ySc8008hGOYX63a53cC6YnP3k0Y9/L/zOx330tJYUuyD8pf/loBED53bgAdt2F1vxpm6xmFNcn3OkIr/ik5XYuZdNSGiUoQy6ZT5tjHltURKTBjM0GfPDGVOC2d75BaPCoLdjG8sbeoRr4j73r6o2dYJfAzUTlBoIA1p+Yta0FnnwHXcNCMixtaApSsRu9SUoE2g/HsuybEprefJGOAJZMMrB3W9XCseRgmQ1TEMS8LtdSzxmyrIzdqkQgZeCutpucK47n4LI8KyCxsrkGFKyMUylnNJdph/25X7Sc370A7r5yL4SmOWYx/V3iV3o1LhlsBTHOqKgxP5D12FTI/7kAld4HxEd8bQH4h8u7wyA4r5C8uZLC8hg+1zhWTmIqRrhDp0p7qmCq2SptaJW9NpH0+7Qz8Qe75NCt/Q8ExSh5zkTiM6cyjHvR+nsK7NPpOUjgtP7N3F13V+F/y9amCCWTDYkc34513AlqCt2vHD3e1z1pTKzrmLXjh2gdLGIzhzAlwSqBh0aOjY951Y9/5xhI1rCSizQj0INP8NxNBe3Q+DYyQhpjAki9tcRIMx1UjdFuzVGK1WvzKV9OHw+0tOWD+IFxEXRlB/QgFGT63g98TMLyf50A4Zx0MOEm8dPempP1Q==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(14060799003)(35042699022)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FOoptmuoy0FpaUWrlBO9NNH6JoHHdJIqQDKTQKJ12oKrpxAvG9ckfTENFJxJx7/sC7/7+CkeTN2f7r3chxYN3QsAZ2VZYN0uDny89S15LnFaaEL67fT+reiCySNI5pHII7u8KHER0wPbS0/5D9jA3iczUvybYG3cnJ5ajPJfpT4wpzEcelyX0/prSf4y7V9LrtsGonntLKNBkvOIRJpNOfp6zTfHeGP5ZWYYgFeFs+ymAs9doHIroa5rummQOvJfRYDDcShtTbcjbHf9GXYZ7HFbUz0kGz2wAjw2rt9QIL5tsv3jK/jtyXCF4UnriJkAmc3Yz8TDv8KMIQNRE96gZnF/5uGpqCq7pxKyf41/12gmdYb4zE7vsz4PXnz6+NuB0/j9JIBXPQ1wdEAZ3HSHo/7j8GRI1/MdPfpSJjo5M2Ck4QJkIqX8m+EI/eQDkKJn
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 08:52:27.2422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10cd8c7b-f1aa-44dc-a7f7-08de9939fd34
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6699
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_015236_309656_8456960D 
X-CRM114-Status: GOOD (  10.52  )
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

This series adds support for Arm Confidential Compute Architecture (CCA)
measurement registers in the Linux kernel, enabling guest Realms to
access, extend, and expose measurement values for attestation and runtime
integrity tracking.

The Realm Management Monitor (RMM) defines a set of measurement registers
consisting of a Realm Initial Measurement (RIM) and a number of Realm
Extensible Measurements (REMs). This series introduces the necessary
infrastructure to interact with these registers via the RSI interface
and exposes them to userspace through the TSM measurement framework.

At a high level, the series includes:
 - Helper interfaces for reading and extending measurement
   registers via RSI
 - Definitions for Realm hash algorithms as defined by the 
   RMM specification
 - Integration with the TSM measurement subsystem and sysfs
   exposure for userspace visibility and interaction

After applying this series, measurement registers are exposed under:
    /sys/devices/virtual/misc/arm_cca_guest/measurements/

  Where:
   - rim is read-only (initial measurement)
   - rem[0-3] are read/write (extensible measurements)
   - The hash algorithm reflects the Realm configuration

Patch summary:
 1. arm64: rsi: Add helpers for Arm CCA measurement registers
   - Introduces RSI helper APIs to read and extend RIM/REM registers

 2. arm64: rsi: Add realm hash algorithm defines
   - Adds definitions for SHA-256 and SHA-512 identifiers returned
     by the RMM

 3. virt: arm-cca-guest: Add support for measurement registers
   - Integrates with TSM measurement framework
   - Implements measurement register refresh and extend operations
   - Exposes registers via sysfs using a misc device
   - Dynamically configures hash algorithm and digest size per Realm

This enables a consistent mechanism for attestation-related measurements
in Arm CCA guests and aligns with the kernel TSM measurement abstraction.

Feedback is very welcome.

Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>

Sami Mujawar (3):
  arm64: rsi: Add helpers for Arm CCA measurement register operations
  arm64: rsi: Add realm hash algorithm defines
  virt: arm-cca-guest: Add support for measurement registers

 .../sysfs-devices-virtual-misc-arm_cca_guest  |  38 +++
 arch/arm64/include/asm/rsi_cmds.h             | 105 ++++++-
 arch/arm64/include/asm/rsi_smc.h              |   7 +
 drivers/virt/coco/arm-cca-guest/Kconfig       |   1 +
 .../virt/coco/arm-cca-guest/arm-cca-guest.c   | 296 +++++++++++++++++-
 5 files changed, 442 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-virtual-misc-arm_cca_guest

-- 
SAMI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


