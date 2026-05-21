Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC663CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBBD/Qx2168rADX0pEGbPpmi2yUYpZf1u3sdvoFcLEQ=; b=mZbr9B2FS64aFRhjCbWdlHiR/o
	WDeVXyjgQTUjkWYikt11pUMlpGx62FO6UvGeFtocfGLMPoSBqh7hCwWwPpOK/EvxKdQCmi8LvvkwA
	j/p5Y1osxQRZtfSun/NoNL0kqdNZNaOCnjCN4ApSH8tkd17yjfA17yfLfb6IdL3dideCIZA/BAD21
	VS28WkIh2Aru59drpKXePm8/FvYnXUVkCPZU69omJhYJ1hCkkybbjV/aCv3e6ZKe17Tg4WuP1u1iA
	FZUbxsntOnByHM5YJDDrg7oEglCvTPsUhoNQRk5iO+u/BQC0PGRTfm1GNjI06EzKABQ1pmGFiI82T
	ang3Fh6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4r6-00000008CDA-3QVX;
	Thu, 21 May 2026 14:58:36 +0000
Received: from mail-northeuropeazon11010001.outbound.protection.outlook.com ([52.101.84.1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4r5-00000008CAn-00fo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:58:36 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WqRiA0sp88lowJy+u2j7/A9kAjOKVl8SfqDZOVUlPeiZ7k2J/63oejZtNvuRfcnXXFud8d7zSJEbVjj5/eTQTf9UOrOiQzLeXrUfanVoVEGHA0J98zn5EgKscn7gRcGIeqrGEza2T3qwbHiaW4aXbAdFEK2xOTVZRewIEHcSQja8MhJ4U9YMfpl1CyVnaCwSywewRTlKQ81/77FjavCcLuSgdkt1U7rVlN6qonqOTxfNl2xkWgpoyMJCVmTuLg0CWzcYq6fi4p6FuYd/+O3Yr6DdwcQa7QwfUozXrfEnm2cHtg4oWEyz7q9X3kEfXqL06pSJ/VoeYsyOvXFfWoHlOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBBD/Qx2168rADX0pEGbPpmi2yUYpZf1u3sdvoFcLEQ=;
 b=yxBX2iUVBYLhFhHmIq0lIBkJzV0/3L/7w/kLRwVihcJyqtG5ywiZeIJcD+Fq2K4I8ktAxgj51AgeZOmzaQzY/XgT5K2/+4g75cn/RoIHMF8M2WL0MmlmdDY8squVuHDB2byqkgUE/Iucnn8T93n2ZzvK9kb4jbt/s+ddXWQWhfjjBxqY7jV/lrKy7e5erXj1WY0w4+gKBTJGHasCJDHmTXvqCf41fyXv5cY6NXl8qrZDLjD2KTpJ+V0GAodkdgJ7MR6zArAVtLxzQKlN9lHxihVDlWOwfJ4el/z824A0DE+ZVpYoITpmPlv4/69Tkt5x3KRPtBisH9iwKu3HlRV1XQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBBD/Qx2168rADX0pEGbPpmi2yUYpZf1u3sdvoFcLEQ=;
 b=oRVszuGwMPWdXG4S4y43wIh2HcGQjV9JtHRRVhAU1sBzmsnXduVG0i3OCBjq9gdLIwNjfgCyl73gHuIzDRt5tnBYiZrlxe9hF94oGlXCiV3hbCPjoXYffRSjq8Y0ya+cyMDKlwL+aa3p8nnqTotD8ww/97YKRa4/N6yBZH822qQ=
Received: from DB3PR06CA0013.eurprd06.prod.outlook.com (2603:10a6:8:1::26) by
 DU0PR08MB9371.eurprd08.prod.outlook.com (2603:10a6:10:421::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.24; Thu, 21 May 2026 14:58:27 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::a6) by DB3PR06CA0013.outlook.office365.com
 (2603:10a6:8:1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 14:58:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Thu, 21 May 2026 14:58:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LRt+TFF4MIxHJv2XmJaB1OAvoFufpm7UVxuTtEmbRihPypJ8wsfIo/K5KKlCvniUT7Sejkva3TYGQ6NWRd9Q12IiVSLoWTRodpvMjVMMgiuabuJggHdFOngc1pKDjg+W6WSB0rHSDFg96Ss3PEVVuWH6vK+dOGVXy6SUFRf+rQXmmOxJaC96tYyXRK4UeNgc0+SD25qb4QI1KaX0BKi5RGnDjv/KEJt3syegOLGrlPKZe8X9PxSiu9SmgzdT9/HpPp7MuPs4dVy2fqO5UVJWV5etmhVa/kI/vlxNqyfQilktvPcXcPz5fJWIgzktUfybRiRpj714aRziypZ4PpRx4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBBD/Qx2168rADX0pEGbPpmi2yUYpZf1u3sdvoFcLEQ=;
 b=MmxNRUJRXdBNTIZdzS/SzMPlRSFvZ04qzvQwIjppW6LxjvaEsCCbnXM4X+jlbkjux61+CRfXxregfNIl/sa1yNBeBIlC30ygcSnntzOl84JXeNBLNxKHgTt9/KHIKTyVjHijDW6temFsJ70oHAvJDS52sw8MK2Gq1awmaHg1CoD9ZRbg9OXjMNXg3OC6sUbQNJn5UfBq/Roe3/j0Iavi0x/0n0kKQZ6kQBHjF8WR81KuSVtccVquVtE4lsqsRoMQpLL2VnqAfYFFoDaMXhXQLvFJ4RPHzONL92o/S9oXvb60ukQ4XWgR2M+VFq8l7EfgaU2BpGHqZPXchG+cervlrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBBD/Qx2168rADX0pEGbPpmi2yUYpZf1u3sdvoFcLEQ=;
 b=oRVszuGwMPWdXG4S4y43wIh2HcGQjV9JtHRRVhAU1sBzmsnXduVG0i3OCBjq9gdLIwNjfgCyl73gHuIzDRt5tnBYiZrlxe9hF94oGlXCiV3hbCPjoXYffRSjq8Y0ya+cyMDKlwL+aa3p8nnqTotD8ww/97YKRa4/N6yBZH822qQ=
Received: from GV1PR08MB7315.eurprd08.prod.outlook.com (2603:10a6:150:1e::15)
 by PAVPR08MB9209.eurprd08.prod.outlook.com (2603:10a6:102:30a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Thu, 21 May
 2026 14:57:22 +0000
Received: from GV1PR08MB7315.eurprd08.prod.outlook.com
 ([fe80::c249:1aed:a4c2:4193]) by GV1PR08MB7315.eurprd08.prod.outlook.com
 ([fe80::c249:1aed:a4c2:4193%3]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 14:57:22 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: [PATCH v2 24/39] KVM: arm64: selftests: Update vGICv5 selftest to set
 IRS address
Thread-Topic: [PATCH v2 24/39] KVM: arm64: selftests: Update vGICv5 selftest
 to set IRS address
Thread-Index: AQHc6TIgLgXp89eM3kiUTdbjynvxlg==
Date: Thu, 21 May 2026 14:57:22 +0000
Message-ID: <20260521144846.1899475-25-sascha.bischoff@arm.com>
References: <20260521144846.1899475-1-sascha.bischoff@arm.com>
In-Reply-To: <20260521144846.1899475-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB7315:EE_|PAVPR08MB9209:EE_|DU6PEPF0000B61C:EE_|DU0PR08MB9371:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aeabb3e-9059-4a99-e41a-08deb74969f2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|3023799007|38070700021|56012099003|22082099003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info-Original: C1lVTGf0URCItpi4qnNNbBoEovgVpdYxuL6MwcO+Fnkd6Xuo7gcCJ4TCEQF02tAM18xn5MQvebDMQ20RfCoWcHCSfQ/hIxkIGaHyrTF8TGaggKmqu54SrJEAVd/7vaUJCIHEu6ZtRzGoyUDrqJIY529mDFYz7cvYE0oAN8Vf9QgxWGWbPEGOhx4HNl3Pc/W6HP2SFnJCR1qaxj2RwUbMsFobgtNaf4zNrI4EgSwRluDgkqeUE8zgezvwNPp05N8gAOGd9u/RKK3LLd2ZVmUhhBMXsLXk5zOMBSryq9FWt070HXM2lVqCnUxOn5q0QK6Lev+iMadQ6ttY1swjVnmApNLgfVKomn6U3h/9tR+mukITGQXoFonEys9TapGr0BVNsE2q3oBentTirE2oYQmkeetFsErr3718tq5sWAuHjpx8ASdULRPDX/mDrAUKWW8X0p8pHfYahORIHelLn3sA74YI9BFgdfob+MNC+g48gX1AoljWUkkYTqpA+FoKv1dH54ovTN5wEQMm0SWoaz/bLC8fDp5ZLSRTXewNXdVuUO+CJBAVbM9cuDaYHSyEJmuwH2fnlmpyRTNnbAaykWAyyurZ6djK8sUigRtCJ3ul91H1R1cgXYD/U343n1dWt22DA2rlIbSO/aZlHyE432C1Y/jK4P8iQhVF10F4JaKX9SGSXsrS5VNjHvzcV6gxJPNrRb8kXaUdi9le0lUrVsUQf9sh2PXwaE3Eyoup5XaZMIjKVNLqgfaq0e69DMd0xMVn
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB7315.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(3023799007)(38070700021)(56012099003)(22082099003)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LsPTdGmwrn4YKWwjCJiyDDQ8Vutizc/WmtX8vQO/HeKDd3WvgvXQiyUagP0dZWhftOKRpoBhK/+GPWyyRB94WyjzkINT5D5ENX0/tG/UTuu1I04QVx8rld+LwEbeJd+l1QyuR/Q5Kk5tajrPRReawx6UgFxrCbzzdz8LOUsEc6lKA0hNjfjWaW95udoliG7cJECodVQ4gcsaZV9rxJXpS0A2EXlmLqt4k76RSipsPBb0ylQazrZSJ+zvHxbC8hcoIIEH15Z4wRXz/HTeJX44p3d/4WVgui97R700+HK1fY9q/zgW/OpBRqO68eCwgFO3TJwGoySbPPZMn3igcJXJNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9209
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9a9e4873-bc01-4e79-3eac-08deb749437d
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|14060799003|35042699022|376014|82310400026|3023799007|56012099003|22082099003|18002099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: vzwDyoYPUoysn2w+PYWELOb7ui0+aL3TSLggUpQOBX2UGwDgGEJ7q/YxrU0gzgjHdTWfGnnNHSag28k33QSfknP7cP2yL73RurFRTanZ9hoio985LEIIgTH/sZQrcFhMmSKK0NFdaNcf5m97gTNtFBejD0lJgBjoKs5vFJcsYPy5OA4+lYGeViSvYyyWmZgBNNZKlIBhTIbc8C6rBxuFZIb6WeYpW1KhN/i4l/mcnXcmIzGMbNGf4tAIGH2vbIeIw1I3b7WSDyuwTfZNxICFT3yBq9QRNUkaFkbM7q6GLOtjYQY8g+93+9feZjpey9QHUT4q3btQaFiiNgLfU6/pvzkrbN0fUojrodL8oMsJwRtPzQMyUl1V2M6Xx2kw7Se4oNU/8KsgdcddoB1VbZBpl0cYFMQqmfN/qkMr4ApQfjGiketDQSHjDdayUWf9XP8UoRiA4frpNjMnLhzMKPgmj5mpQ2CAiRq9zhAI0GjrXSt7qDntccFgQLfr/R89y7RBKlx/bqjBNAuHSvYBaSDs0h6leA19oBOOmg3v+Nb8oYqeoHo240bb4oRcG3wuzbNWd6JRKuOtbQmJEmLkSzpbI5BQ2ey8m63VAXhBgVdyu6HcgHYIwXYqURTrYSdoP/Nj/diXj4Y9pZt3fFaY5YenkxaK2X87JOnQ9Eb49dp3bEdxhVagujZSDMg/1YdSSpbBrxty89SnkA/Dsk/K7jt7pzNZImQg1N24enysTNza+to=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(14060799003)(35042699022)(376014)(82310400026)(3023799007)(56012099003)(22082099003)(18002099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: aZVl88ND4Gc4ZX5KNgDt/rt98lMyNPH1upBOvI3knhqEpwRyuBOODrBCKoWcKIbBH8jjWRrjAH3uekRQEfVD53cIHIzHC3D2FCBO4moqQzuEGMTRYoVzP1abDANR/0Kn2hhbwgnwGdPJXzF4h5H3s31hU2uhqQTPRT5FV9mts9M9tSHVd/4etPgYnV1qv7eKtblkpRNEevsl1W7y6si6UTZ8U4Z3miQViLjYejP6eNm7qdNQPH+0xzkZyBNMcZxKm/mSOqcWP7PMTat4PSF2R9JACKRWc9ju/A6ReBN152F0AiX2nJSv/+Cf/tD+K4WEYBIJzy6MukfLF8o3lOoak4VAjkeEy11Xygu9gXkjRPGopry1hi6p96LjdIeCvfTWZWe5qoVzo10QRP+zf4NB8lj62zewm3FgyyhM84MVg2kaTvR9PJmkAI3qtHUlVzQd
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 14:58:27.0263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aeabb3e-9059-4a99-e41a-08deb74969f2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9371
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_075835_043424_DFDE8B80 
X-CRM114-Status: GOOD (  13.55  )
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

This selftest was added before the GICv5 IRS was supported in
KVM. Therefore, there was no address to set, and the specific UAPI
didn't even exist.

Now that the IRS is supported, and setting its address is mandatory
before VGIC resources are mapped, set the emulated IRS GPA before
initialising the VGIC. Running a GICv5 VM will fail if userspace has
not provided the IRS address before the first vCPU run.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 tools/testing/selftests/kvm/arm64/vgic_v5.c        | 6 ++++++
 tools/testing/selftests/kvm/include/arm64/gic_v5.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_v5.c b/tools/testing/se=
lftests/kvm/arm64/vgic_v5.c
index 96cfd6bb32f6f..19039a8940568 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_v5.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_v5.c
@@ -100,6 +100,7 @@ static void test_vgic_v5_ppis(u32 gic_dev_type)
 	struct ucall uc;
 	u64 user_ppis[2];
 	struct vm_gic v;
+	uint64_t attr;
 	int ret, i;
=20
 	v.gic_dev_type =3D gic_dev_type;
@@ -116,6 +117,11 @@ static void test_vgic_v5_ppis(u32 gic_dev_type)
 	for (i =3D 0; i < NR_VCPUS; i++)
 		vcpu_init_descriptor_tables(vcpus[i]);
=20
+	/* Set the address of the IRS before initialising the GIC */
+	attr =3D GICV5_IRS_CONFIG_BASE_GPA;
+	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+			    KVM_VGIC_V5_ADDR_TYPE_IRS, &attr);
+
 	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
 			    KVM_DEV_ARM_VGIC_CTRL_INIT, NULL);
=20
diff --git a/tools/testing/selftests/kvm/include/arm64/gic_v5.h b/tools/tes=
ting/selftests/kvm/include/arm64/gic_v5.h
index eb523d9277cf1..c388df8f2a2b4 100644
--- a/tools/testing/selftests/kvm/include/arm64/gic_v5.h
+++ b/tools/testing/selftests/kvm/include/arm64/gic_v5.h
@@ -10,6 +10,9 @@
=20
 #include "processor.h"
=20
+/* GIC component base address is guest PA space */
+#define GICV5_IRS_CONFIG_BASE_GPA	0x8000000ULL
+
 /*
  * Definitions for GICv5 instructions for the Current Domain
  */
--=20
2.34.1

