Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9ACEBFD16
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 08:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiobUB5GXaUYRN/RtELklBTsVZ+87qCL0h8fZgrFFoA=; b=R/a/lyjKrXGZai2mWjQLGMiJIp
	YnEcpGQ1duBCViabnUdn75KE7D+Y68kYP23mtPyUPDjHCiwF9mlb8qEpmzNXHMMHtfMvYFkNP419Y
	szRVPIjSV9s6Rim6YOVkUdYXf7Uyxj6VaWVAJ/fDcIlnLKq5BMDHjgDThDzTYZo0Du+2pr7+XGKoz
	SyFz5EIa5gucHBnBoeVBO2qasLuHTiUXUZ/zCxpKYjCZ7eHjfIYizs5c1cFtXjtfFWB+XxkW2jfaF
	pY2kuJJw1s0MrGqlCT14cNPRl8yMdkGMKg0XrIqy6Qo2wWlqk5Xqmq7qLY4ih+sTuvL5gx0XlPV3T
	4Ola13YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD2I-0000000FIne-2OQ6;
	Mon, 13 Apr 2026 08:52:50 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCD2G-0000000FImq-3oqB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 08:52:50 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iDHRwXqZnLQXj25cE7Ks4HbWXz8eIKpTwWVbGxvobsY7EhlmbhplPCdZ3YTmm7eu1ikADLUHBax+Pab4JnHrApJ14KLBoioYhJc1BnBWcqvkXDpDvXwYqgSRnA+rgiY5Ejaiq6K6zS2StScxE8M73ao0MUSPTO5s1/WuIhNPKliTRDe7I0Zc7yjwKlJVhPIsOZ4o4+q9JalpDZUf6G4AJXKV2ewo0Sb92xw7WXXu30kfZaKZW6qXqwQKfXd6To4wNWJgpxcxzznHDE/7DITzqqPoIr1zTicJlJMMRsJaHPIsVGguuYOc2VRs5/kTnAzoTSZEzWx5Srw3fyGobGMi5A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiobUB5GXaUYRN/RtELklBTsVZ+87qCL0h8fZgrFFoA=;
 b=sVXanXOu/2KEjAmNBdVbDoDaWvaAv4oc4K4WShIyF6q0MMuiwGIpgQTBwrNaz8BKtV40P8DE+VU666TVnXxZMHjpV343/kGFacWRLv56zVF2vn9VsTXsjNnr7D5olkns7amfu/Ot+TYri6tS1wiRVNG2+wU8wHpQ2qN3EFr78+c4VLQA4eXssxcZ2tFh3GnTXAnxU8MIJs/AYvv2cGPMeLIn8R5AwhAsaD7sM6v1oTz4XriBAK3tR9ojk5sR93YyC8S4u2xIZsGqIa3wIFIo0qaL9okcas2UCx7Qdo5MEvXmW2IKf4+yKKlFQnizx+9FRN5xV7RJKarpytUszf1GVw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiobUB5GXaUYRN/RtELklBTsVZ+87qCL0h8fZgrFFoA=;
 b=GdBPSBWJ8ZJpYa5PrBrX0ARYaP+xaWFyySajy0RtfMTZTSbANmyw/CjgnkfEVOWAi86j9RMdrjwDUBb4Gblko6vdJkW1Z9YI28KO7LHfuCK9hoSiEMzKhJ7PiBXk6qG4H+hs3RjUNGnWOpEKslZr5+i087wAmw9TNhXyuCpRF0U=
Received: from AM8P251CA0030.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::35)
 by DB9PR08MB11548.eurprd08.prod.outlook.com (2603:10a6:10:60d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 08:52:42 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:20b:21b:cafe::53) by AM8P251CA0030.outlook.office365.com
 (2603:10a6:20b:21b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.40 via Frontend Transport; Mon,
 13 Apr 2026 08:52:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.17
 via Frontend Transport; Mon, 13 Apr 2026 08:52:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9wuId82TG9zpX5lOe2u3pUOVxbKo3+5ToW62/Zv3JKATH6hMLRMhknQk8tANjGVe/WtgguY4YGk/oqTxw+Pz0q5oKKwSWPknn73pJ7KQexXPq2cdbQVA9B71fX8OJbd1hKpVc5aYPtlU3d7rxoo96E6HZTMHvam33e+VzPQRDBF8OMCorWLz2svtHknMhrHxKom6/wesvA0auvpxdIZzWae4FUXOI9zBh+YI82WAaf87tOvZSG1y1BGRAswwRm14IQmjPvbIqrzQoBuM46aeKsQrEALnPXQSY32jBooogF894sBfCkHUbsF2BV/o5/AQhwOOTGdF9UhxMgE6idj2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiobUB5GXaUYRN/RtELklBTsVZ+87qCL0h8fZgrFFoA=;
 b=kOrcBtmVx1OnC1Huh1ahuV1JivcxknCsVJKy2LhqlNP4YjSvGMWRGCvVCAr9MkT3W71tVdsKcvn6QP9WXICaTUBZvH9pFDqvFMNniZCrt8G+yaSq+0n1oXIEKrKl25rBUPT18/yjKS5ARPA9zgGvhZvqotAKo0COLXw/ZYvOQMxlFWA8Py19lDCS6A24cabNc3Astx1HgYhN6mjl1U2lPxWOIdx7MN0QfCamnDdWeXq3xuRKVo3t2V22EnPX6IHn6JHPI2dKPKEbmO2tLq0WgH5pezSVfU+2JATsnZhjWBwzkH26S6qYiCOGhC7FoFkMIP2lTyxEfjeqrNHuM9bAcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 172.205.89.229) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiobUB5GXaUYRN/RtELklBTsVZ+87qCL0h8fZgrFFoA=;
 b=GdBPSBWJ8ZJpYa5PrBrX0ARYaP+xaWFyySajy0RtfMTZTSbANmyw/CjgnkfEVOWAi86j9RMdrjwDUBb4Gblko6vdJkW1Z9YI28KO7LHfuCK9hoSiEMzKhJ7PiBXk6qG4H+hs3RjUNGnWOpEKslZr5+i087wAmw9TNhXyuCpRF0U=
Received: from AS4P190CA0040.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::20)
 by GVXPR08MB10938.eurprd08.prod.outlook.com (2603:10a6:150:1f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 08:51:36 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::6) by AS4P190CA0040.outlook.office365.com
 (2603:10a6:20b:5d1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 08:51:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 172.205.89.229 as permitted sender) receiver=protection.outlook.com;
 client-ip=172.205.89.229; helo=nebula.arm.com; pr=C
Received: from nebula.arm.com (172.205.89.229) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 13 Apr 2026 08:51:35 +0000
Received: from AZ-NEU-EX04.Arm.com (10.240.25.138) by AZ-NEU-EX03.Arm.com
 (10.240.25.137) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 13 Apr
 2026 08:51:20 +0000
Received: from localhost.localdomain (10.1.31.15) by mail.arm.com
 (10.240.25.138) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Mon, 13 Apr 2026 08:51:20 +0000
From: Sami Mujawar <sami.mujawar@arm.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <jgg@ziepe.ca>,
	<thuth@redhat.com>, <Suzuki.Poulose@arm.com>, <steven.price@arm.com>,
	<gshan@redhat.com>, <YeoReum.Yun@arm.com>, Sami Mujawar
	<sami.mujawar@arm.com>
Subject: [PATCH 2/3] arm64: rsi: Add realm hash algorithm defines
Date: Mon, 13 Apr 2026 09:49:56 +0100
Message-ID: <20260413084957.327661-3-sami.mujawar@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413084957.327661-1-sami.mujawar@arm.com>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AMS0EPF00000199:EE_|GVXPR08MB10938:EE_|AM1PEPF000252DF:EE_|DB9PR08MB11548:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d3a71d8-ee55-4e9d-cc69-08de993a0626
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: 4LkPHleAbSMmaZczCkyYnrNEQEstBDwMvVn8Pni15nvn0VvMbDhKoQruipBJQgoPkwVQO9eqEABEPjSgv/28CubEf/wCwGx+x+CN/zBzDUv1D0MEGqKOva36TEHJPLd+gSzu+X20su9V24RhSLwLHvAOiMzYNaGWNlpb+8uP+Tjb8Sv1eRg6f/KMSi5da/+7nCQ/FVrdIwKdCBtWYKF86lWsHQ+Kpnz49z3CFhd4AnoMrD28KWUb2VpTfcm5BGLJmuLWGhUvaOreZt8NhBbQigTUJijcEm+SsAes/2s+V/jWYE0JB8OG2ouat0o6vJRCcKTFpROeTPpD0ls8sqFPxWNKO8IZZZmoMDxmhQBybo935czDuFOGkWR4Pg9kN+pgHBAs6FTLnii27jX5T64SVJLUJ6Rn+1/wKpM01746o954Se3yQdntPIPvNE6Anc8o3ZukDGOSauGiyPIVr69AWSKjclrvEtTcc+uVjpL53fJAlPnF4aHl5EowAT5m62fgK8wKNQYoh0F89AJG5HTAKpH52ISLGZulyUcCmYBnLJmeVJYg1RjMQyHs7oeE/i1eFx5RfpwJ6k4y42yIsIrQWYSk8jX6jbHeGrsBFy0V//DB6yCNL9zPgMQFs46daP/TrH4CWLdgb1sPu/lrJKMF5kh07HWlo/05zB42jLi/O9GKskvabqkgrt6VwUYq+safDCED74nS4VNRSm+osL3BCkdK4PTU7O3vh4l1I2mX/Kx8+jWDDWMmaLMFUcBZdp0Z2QWy3I8q7uahC5Z+bXxNNQ==
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked: kPLc9gQ4RuzTewa0we/6tdYbuPegMS1qUMmDqtrk/ze73biETn81Tl0Q0X2ZcFN5/bEJlM6zHgmvAHh7LnoUR+xLtbYYWjCZSurvMdjJWy15DntjQbsLWQ8tl45EsM0MUL/UHuCgLJA8dl7SEs9l1fmX+Dj4eInSRAELvGS5fR/5/18+cq4ntZaYnhlZqgzfzVWqPfwk3l4nbwvXvE7QZZ14vp9uo3cm/+a/0G6hkUvTXfj+68EqcW2EshtOBcsFX4dk0gKI7xkulBdV6Mp+/z6M9tJIcSQJAQ/QBthyIUI52Na3TVq05ZljZeUVDbJezmMtO8Cq03KsHyG4Upx0nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10938
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 42f71043-e42a-4302-40ca-08de9939de9a
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|14060799003|1800799024|36860700016|82310400026|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: /qNix6bOj6z/VVemPGWZ27UMnEQMEwSuF6IAVLGbzSDrGjQKOuZ+uaXlhOd1qHd9ETxgiAlumb6o61dk5vwzHhBBHkd0bJtY/EqniwTUw7Q4fhXZfaK8vGCT7CtPCbkDzPfV1jzDxAI7mpGYetJypUBj+Bz08554FhJ2hdXhhz91wrLJ5rP0XkatSME3bx6yNXQJI25lORNATib5/otAUxKTT0XhcbZYWyB8RxThWj/r344hKx0xLohim5RJ1FJ322XgrFXtl7HlMkZFdmGzf23ETmqf1MJT92ET/oMiVpEcpv1+mlyHSipWLksmPvzy5m9EHlHybSJRKG8OPXAFH7gA3IxSE/dDFVk8gZHrrYGUFS38MWrRef3StlvSfRfIIElwqTzhziF/9Hln/o9ONU/vS+R+lScjHGeWpyIArVM2wsnvQognSJaQsSUPHzBOmn2nzPDoWsihq/hmuvTQJHGcflddJIji7xHFtMtDbf9c+t7WBQLtlRh2mCm+0IK7zAnyN9Ch+Ovmxg8wOfN1d9iCXyas1XoaWMmC31Pm2nY+1uxpF4eJHfgyAIHmI9FmgY9+pYtnvDz7I3/ha9O40zCIpxrXTL2wfGTUbIH8kIquUvzKhDp3mo4qnodeDB0uvHsVFUbVyswd9a2ocz3WpK1ZDBtKPdIL1D7zsB3JAk5owk7aM40SlhtDnIJq4wc7v9aRUIoaQxHb80UUnH+UHGEVHCdCDqO6HZgButAL/LZvm7Yk4Rrd6GLwW9plG+UUz9Xx2f8ouvKNFUP133hStQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HW3ecMnzzy6CyyqNsVNjTgB8+l1YJtD3gOq+sD5pNeaKY8rgxpPcJXmYI6MxAnd6a7xRfvOT+oA5c3B0M0K/h4Ay5jOZj1f1Va4w5zLKX2Vt6kqePUSnKEPSQlhVKUHh9GgWvOu6Kwz2pHkBp7OEP//BB5gBnnPRebKxUhwtim6dw4eUvsjJm2062WewEfp1ZBwYRueYnNJcIagF75sGEPHmy0/n3qs3BqiFG5YjFzIPYdSpF9myE84HMNgL5FBAs2uJtcDBtz2Q2j+WtNdqjp04LNQgG1/NjVZ2z4R6nJ3arbc26naR6EjCR/ftlql1tS5XrrFonwoMZLPSOseYfQv9Kdeuzi+jGhJnmVnyUpvgxNfPkV4pZWLDI3c2XZl+OvA6GsWI4MjYNL3A1b2d2I4IZIYBki0I7L+0ZaWbJwJDVr5ZCtPbvPUbeqPsB0LI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 08:52:42.2597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3a71d8-ee55-4e9d-cc69-08de993a0626
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11548
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_015248_953975_5DDC6775 
X-CRM114-Status: UNSURE (   9.96  )
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

Add macro definitions for the hash algorithm identifiers, as
specified in the Realm Management Monitor (RMM) specification.

Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
---
 arch/arm64/include/asm/rsi_smc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/include/asm/rsi_smc.h b/arch/arm64/include/asm/rsi_smc.h
index e19253f96c94..dbcb98a6d5c9 100644
--- a/arch/arm64/include/asm/rsi_smc.h
+++ b/arch/arm64/include/asm/rsi_smc.h
@@ -144,6 +144,13 @@ struct realm_config {
 
 #endif /* __ASSEMBLER__ */
 
+/*
+ * The RSI definition of the Hash Algorithm (as specified by the Secure
+ * Hash Standard) returned in the realm_config data structure.
+ */
+#define RSI_HASH_SHA_256	0
+#define RSI_HASH_SHA_512	1
+
 /*
  * Read configuration for the current Realm.
  *
-- 
SAMI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


