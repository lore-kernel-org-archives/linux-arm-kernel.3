Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040FAC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aI3fTfpS1k407mzlVioiYhNAK8wUNwZEbgWb34E61W4=; b=xnOaguXBLoKXwco7rjbbxRUx50
	m2oHujkHvF8dnPKt5S8RzFuSznpVo4aXpXCAacSL5vDAuxkDiSgdlZgqsFOXfKmxXX/+ilb8mZvmy
	1od+CFQc0hnHonoYqV8DqDi7yultBpnfeVD3RgCJR3KSJ/ChQjjtRw/AVC48/zoQ7Rik78FDJuEZh
	CTevTnvgWV6xxCitH6Irz/zO38lF67iynLKs4/NQ4+r51h/FuaDzfzxuZzgj1jsprk9Yq2p0PeewC
	6zfAdpkOht5RDMmEsf36ANnp03RhcAeaM9FueSXqWboHeSTpQLgW4kFtHLPAEI12DwJXrIIjliDJV
	IkFZXGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoOF-0000000EJer-1O1z;
	Tue, 11 Aug 2026 15:27:43 +0000
Received: from mail-westeuropeazon11010026.outbound.protection.outlook.com ([52.101.69.26] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtoOD-0000000EJdZ-2vWC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:27:43 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lGv11H+XJyK5+HqBDccgfTyGjv5qKqu+FQC+LcW82wDlVJieZi5gf/JZMLvCLPJm5zjPReDCCr/PRwV08c5DtRIXv+3H01rWQGlb33OkcsG3AenYIke+FTzZcwfkxwcc9LcI67QpYX+zt/a8wGU7Bb/FQLeOKmK7Z0biabsWzjTxwGln6EWq7rPwoQjJH2r8Ft9aHGZyXpSGvW5ZNjY5B3sx0dJDnVX+3kt4NegZPVJ0PFP9GDg+VTF5+Rt76TBMJj6vBFU+kBC/ZAWSm+FRTMfx1ZjnvHakxAbeEUpoi9HD5D7gGQM9OLLe1RMUKVvqMMMSdFQs94quq98Vnq5erg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aI3fTfpS1k407mzlVioiYhNAK8wUNwZEbgWb34E61W4=;
 b=K55UwsjfduiZNh2BnNgOdD+XbDi/vOvLbk+L52Ej7ZQASR5zQPT/2WNXa91JeGCTjFInzPQXKvtseWLlntkMJHlfJ70RmbXDFYcgVzpiR7cgmiVem/TlsUITsO0GFXKxFennQOGaO1U7yM0jxBZ0b3B7U7oYqbZByBEXl8EonMulDXPDZUtFSDnBEdo6TSMLoze+mwZstNGj9luFsGm+IeV4BgpPkulDa12maE2N1Xkld64BM75ltoncicJDIYgHoiOpCqcC40dvQkeBAhEH69rGO8Ij0VUSI/5BN0ythXrR+65kHuBXUOX7fXsEfgrgYe3NRHZW4dpRAdiJL4wIdA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aI3fTfpS1k407mzlVioiYhNAK8wUNwZEbgWb34E61W4=;
 b=fD4u1BEBZJAxMlp/R6nMgz3IgKg6YiT9tSJGXM/rJV0BIogn8Ca/Md2W0Hw4Cr1Jf21qOiJpfpQn33myid1ROLaci/XS6BLpglswdyH4amBrGDk4zBkG6T4xMtYZQyw56m9rUVcaMpQ1r0nEmBjcLwvUk8imfUC9J+AoDDkVlxM=
Received: from DB8P191CA0001.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::11)
 by AS2PR08MB9151.eurprd08.prod.outlook.com (2603:10a6:20b:579::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 15:27:35 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:130:cafe::56) by DB8P191CA0001.outlook.office365.com
 (2603:10a6:10:130::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 15:27:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 15:27:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVsONf9DxURhuQLZZq88SRh+LW9zRD7/b13CCAY3zv9xdGBEQeMAsEyWGE6G2FLPjQ6dw77Z4HomDK/K2vWAum1Apncb6RKc1SJW+p2djdVJyzK9yGCYu83CqXcgTgXrD0pQUKAm1dWr5S/BLorOQGpyhT9a1dUQcsvYLxuRBx7KKEjH91UFJrqOTLrY9E/bzjclJDLSgoh9K66MPb6ncHnGh4adf+XUW8OaidxLoJ2nMOdabsgYQfURKOMJ5YU8Fvx0ujjGS2YHS8D/+ykMvbGqkEUgbLfI1aQkx9PfvVpgUbirqx08OwvMrWOz/ntx6JttNAcqkAvsN1nC5L88aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aI3fTfpS1k407mzlVioiYhNAK8wUNwZEbgWb34E61W4=;
 b=QFg5ZITq1A1eSFk+UbOrGGanIapSJI7tIr0CnBtAMSHR2/Uz1Ztv9qooIQ0UXkAbySLHoChhgK2T7ZSOduvMnNehUL+ElUSvCn+RxUa4CMY+GDsltw/YHqOfU7JlUfeww4HGxD2Mmow3ae6fbeAjJ6lDS8QYAlUteQAak096yW6q78So7ousi5sxGYiD/JHFKu1B4k+G2uy2i/cd+f9KsdvoNEC3VUscNMnYFOO73BuQianuLPeJRT/4fNqKcLBnHURY3GbLtbNAWScrRByXyh0J0KRfsnRkP9+fmIo5budFKRBftSnzffTLw+l4Jpy70hAHyLqfcgjOxfqqOt/UtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aI3fTfpS1k407mzlVioiYhNAK8wUNwZEbgWb34E61W4=;
 b=fD4u1BEBZJAxMlp/R6nMgz3IgKg6YiT9tSJGXM/rJV0BIogn8Ca/Md2W0Hw4Cr1Jf21qOiJpfpQn33myid1ROLaci/XS6BLpglswdyH4amBrGDk4zBkG6T4xMtYZQyw56m9rUVcaMpQ1r0nEmBjcLwvUk8imfUC9J+AoDDkVlxM=
Received: from DU0PR08MB8421.eurprd08.prod.outlook.com (2603:10a6:10:407::19)
 by AMDPR08MB11505.eurprd08.prod.outlook.com (2603:10a6:20b:718::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 15:27:01 +0000
Received: from DU0PR08MB8421.eurprd08.prod.outlook.com
 ([fe80::2158:1cab:1d88:ba2e]) by DU0PR08MB8421.eurprd08.prod.outlook.com
 ([fe80::2158:1cab:1d88:ba2e%6]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 15:27:01 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>
Subject: [PATCH v2 1/2] irqchip/gic-v5: Clear per-CPU IRS data on teardown
Thread-Topic: [PATCH v2 1/2] irqchip/gic-v5: Clear per-CPU IRS data on
 teardown
Thread-Index: AQHdKaXaUMI2wv2HfEeit2JC/PLCnQ==
Date: Tue, 11 Aug 2026 15:27:00 +0000
Message-ID: <20260811152630.942023-2-sascha.bischoff@arm.com>
References: <20260811152630.942023-1-sascha.bischoff@arm.com>
In-Reply-To: <20260811152630.942023-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DU0PR08MB8421:EE_|AMDPR08MB11505:EE_|DB1PEPF000509F4:EE_|AS2PR08MB9151:EE_
X-MS-Office365-Filtering-Correlation-Id: 14d52df6-509d-4e31-34d1-08def7bd121f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: aoFx+S1e+Sfs7p7tFZ/kVnwqLXixdeVdiNsQiU643Q5jPfnY7wL/3uWSAsNuSdavgeNfuhUkNuhww+NxTqGShVgHZ5pMeapzqMimJEW1ENcuUXu8Agk8tZkkQe8us13bmvM6RKmfDAWtcLJTQ9B6UOyL/ATNh54pKCTyhPl5YAtuQNhuyjrn7P/mvDEtlWOweN130DY2ZCH9tJwRvqVyCUDycGjVEKGujQ2DODL8J9sourolI2kdXoZ9WLP6jJy2coXuymrduFFJomZu0znD8gVkBBEy+vYGNdzsWymoTYy1z8PrimnHHGGLtEgVxllruxjwBKDKMVc7oPhzT/VYkWt/Xn1RfS4EwyiDXaXGJzvktX69nAyUZROs+s4fYTygiIMJID5D5yQbHhmIsI/oq6awuukAsYSDr4lAvkDfYuHHdOm2MxQUy60LYhiuEj+gCJN6FnW8Lt/xXabsfTxak6TuSZlV++h/SpTn9FGbEWB0vXCQ2unCoibGz4bvswXLfl6AQH9id2p4QpeZm2ffeyk9MYXjvFq7gfPirlxWXbong8GPybPJA81OGUVvTHYqQk+V/okLw4Q6E3Epp8dUVtd0NZCfIKkcRF9/AoI8ylZY5YjNvmCesw9Zb51ZHXJAcVCL3xthlA+GMsR5ysqIUtxnecKBl6NKJSAYxpRnSQM=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB8421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: WYca0z+SXNdrkxGCPOlV5nh+ip1zs7xVssFGj6KQDBo0GFq+PgUfTIB9uBIjd+1Eq1V4AWgQth0VHoC2QiaVgWjFkbOMtqZKPWxrbZqEh0HoDPuSZgWck996VXVF6qU9wCsenfU53pC7G/LazrLFGVzwOyNC5vWCORgwNq6rWy+NKowsKMB7iCD2AbmZmgmSfexv05IyvkkBvPzspG2JNSK2ytRUGzvh/UOQEU9zPrNghHOGfA8x636z2fS9MzZAXnvs2078Dph65CQDBdf27y8W2O8RKj1jGpwoPtlTD+NdjpVs7WtrJ5VexWjcnyE/GIibclng2kAd0clVMSXmYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11505
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 40f191a4-58bf-472a-c28e-08def7bcfd68
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|14060799003|35042699022|1800799024|82310400026|23010399003|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: ZLXAa3xr5NbZ+1GATJ6lXc84s5OXT102slAakDIK79ZTCxVfflv0zei5im7omUGFCDYaz5fVxr5eAq1mNzJHpHEumnZteEQVMtQ15U98aQfO6mpxw52aAlnzY+RqcffXz1LXu+jMEqUG1Mr3OOw0ZNymYTiatYBNwVmJpBe5fsfqD1iNk4vQb7s1FLl/2rKJVN/SP6OuWC5Zbmi8gTEsqGRBh3uXxI6jF5a8SWyHJ/5xCyoIxYVzIrSETDnonerZ/p2KulWm4xsfksMzPNmpGDlBIhtoqggRC3y9PWSLnuNrd84rkL9AKfZ7YOczrsXciCXDzZmKwVQpzdrMgG5vS4/P/zBRxKeVyDlKwK1QZgBpOT/n04vpf3nDtyJwZj1xoc067K5eJRNoPlE/ck2MXqzokkq8kw2lV0QmT4Up7JjyRA6iKAHpxg/oKFA329TZgKczqB63+6WE8MqLBoXnS446Fo9pmy1/asHiD39FbgGn72C5KBt9tiz7RcCiMOaQIMbNSKHa95s2XUlUKvpLUHQbgNDil3jMyYsb1EQg+VA2Bf+LrDXtbbt3fjsv+6afEc5Ohe9LqEcQ9C9Z/py5BjzQC4pG/NsEmFfVqNMxqmMha/MM2Rv0yaHTtR1CSd8HjQuajvYCkXQJPXVxcSz5kA==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(14060799003)(35042699022)(1800799024)(82310400026)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZCAjOcxkGPbC6PfnncbVNDjhLoNQEafRDNH2h9+Z5THmUZR4LhD4BJf38HxSOHYMKoR2ahVikIP+U+Wn9yBrpEoEynT5GkZEkb043I0iaatTPGuzdli6WKkwdUAUvXPHprIsUnqDAGFlv+glirT4UlvFmtQPPeJjjKlVQNOcTwT0hOPnkYtCi7LSpNnm5st8vs3jfiJGzRai665YQ9wM7ZC60k7CPDu6gwPmxuUB2iZXlPBWr3BlJLibzfjCUyGhRBhp2RuLWrL7iGkdz07IPQ3nv3mP87LrK+OAdKLTxo9c0dCsVLQiMWsbvlTAZNSzpA/U9FSk4sY6mckZzctALNaQ0bpJwMVqdhUfamGSaiPVOIjdQ0E/wMYLaYG+QkDPG73BOYYZBjaQPEUlUXqSaN3u1aoWerlNPmwvW1nGx0vZlMTZwx8AN/irZae/w+ln
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 15:27:35.7081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d52df6-509d-4e31-34d1-08def7bd121f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_082741_741617_C7F6CFC5 
X-CRM114-Status: GOOD (  11.84  )
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

SVJTIGFmZmluaXR5IHNldHVwIHB1Ymxpc2hlcyBhbiBJUlMgcG9pbnRlciBhbmQgSUFGRklEIHN0
YXRlIGluIHRoZQ0KcGVyLUNQVSBkYXRhIGJlZm9yZSB0aGUgcmVtYWluaW5nIElSUyBpbml0aWFs
aXphdGlvbiBjYW4gZmFpbC4gVGhlDQplcnJvciBwYXRoIHRoZW4gZnJlZXMgdGhlIElSUyBkYXRh
IHdpdGhvdXQgY2xlYXJpbmcgdGhhdCBwdWJsaXNoZWQNCnN0YXRlLCBsZWF2aW5nIENQVXMgYXNz
b2NpYXRlZCB3aXRoIGZyZWVkIG1lbW9yeS4NCg0KT24gaW5pdGlhbGl6YXRpb24gZmFpbHVyZSBh
bmQgbm9ybWFsIElSUyB0ZWFyZG93biwgY2xlYXIgdGhlIHBlci1DUFUNCklSUyBhc3NvY2lhdGlv
biBieSByZW1vdmluZyB0aGUgc3RhbGUgcG9pbnRlciB0byBpcnNfZGF0YS4gQWxzbw0KaW52YWxp
ZGF0ZSB0aGUgcGVyLUNQVSBJQUZGSUQgc3RhdGUgZm9yIGFueSBDUFVzIHRoYXQgd2VyZSB0aWVk
IHRvIHRoZQ0KSVJTIGJlZm9yZSBpdCB3YXMgZnJlZWQuDQoNClJldmlld2VkLWJ5OiBMb3Jlbnpv
IFBpZXJhbGlzaSA8bHBpZXJhbGlzaUBrZXJuZWwub3JnPg0KRml4ZXM6IDVjYjFiNmRhYjJkZSAo
ImlycWNoaXAvZ2ljLXY1OiBBZGQgR0lDdjUgSVJTL1NQSSBzdXBwb3J0IikNCkZpeGVzOiAzNTg2
NmVmYTUyZmUgKCJpcnFjaGlwL2dpYy12NTogQWRkIEFDUEkgSVJTIHByb2JpbmciKQ0KTGluazog
aHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzI0MTA0ODE5LjEyOTY4MDMtMS1z
YXNjaGEuYmlzY2hvZmZAYXJtLmNvbT9wYXJ0PTINClNpZ25lZC1vZmYtYnk6IFNhc2NoYSBCaXNj
aG9mZiA8c2FzY2hhLmJpc2Nob2ZmQGFybS5jb20+DQotLS0NCiBkcml2ZXJzL2lycWNoaXAvaXJx
LWdpYy12NS1pcnMuYyB8IDE1ICsrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBp
bnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvaXJxLWdpYy12NS1p
cnMuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXY1LWlycy5jDQppbmRleCBmM2ZjZTBiMWUy
NWQ5Li4zMDI4YThiYmJmNjhiIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1naWMt
djUtaXJzLmMNCisrKyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLXY1LWlycy5jDQpAQCAtNjUx
LDYgKzY1MSwxOCBAQCBzdGF0aWMgaW50IF9faW5pdCBnaWN2NV9pcnNfb2ZfaW5pdF9hZmZpbml0
eShzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsDQogCXJldHVybiByZXQ7DQogfQ0KIA0KK3N0YXRp
YyB2b2lkIF9faW5pdCBnaWN2NV9pcnNfY2xlYXJfYWZmaW5pdHkoc3RydWN0IGdpY3Y1X2lyc19j
aGlwX2RhdGEgKmlyc19kYXRhKQ0KK3sNCisJaW50IGNwdTsNCisNCisJZm9yX2VhY2hfcG9zc2li
bGVfY3B1KGNwdSkgew0KKwkJaWYgKHBlcl9jcHUocGVyX2NwdV9pcnNfZGF0YSwgY3B1KSA9PSBp
cnNfZGF0YSkgew0KKwkJCXBlcl9jcHUoY3B1X2lhZmZpZCwgY3B1KS52YWxpZCA9IGZhbHNlOw0K
KwkJCXBlcl9jcHUocGVyX2NwdV9pcnNfZGF0YSwgY3B1KSA9IE5VTEw7DQorCQl9DQorCX0NCit9
DQorDQogc3RhdGljIHZvaWQgaXJzX3NldHVwX3ByaV9iaXRzKHUzMiBpZHIxKQ0KIHsNCiAJc3dp
dGNoIChGSUVMRF9HRVQoR0lDVjVfSVJTX0lEUjFfUFJJT1JJVFlfQklUUywgaWRyMSkpIHsNCkBA
IC03NzMsNiArNzg1LDcgQEAgc3RhdGljIGludCBfX2luaXQgZ2ljdjVfaXJzX29mX2luaXQoc3Ry
dWN0IGRldmljZV9ub2RlICpub2RlKQ0KIAlyZXR1cm4gcmV0Ow0KIA0KIG91dF9pb21lbToNCisJ
Z2ljdjVfaXJzX2NsZWFyX2FmZmluaXR5KGlyc19kYXRhKTsNCiAJaW91bm1hcChpcnNfYmFzZSk7
DQogb3V0X2VycjoNCiAJa2ZyZWUoaXJzX2RhdGEpOw0KQEAgLTc4Nyw2ICs4MDAsNyBAQCB2b2lk
IF9faW5pdCBnaWN2NV9pcnNfcmVtb3ZlKHZvaWQpDQogCWdpY3Y1X2RlaW5pdF9scGlzKCk7DQog
DQogCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShpcnNfZGF0YSwgdG1wX2RhdGEsICZpcnNfbm9k
ZXMsIGVudHJ5KSB7DQorCQlnaWN2NV9pcnNfY2xlYXJfYWZmaW5pdHkoaXJzX2RhdGEpOw0KIAkJ
aW91bm1hcChpcnNfZGF0YS0+aXJzX2Jhc2UpOw0KIAkJbGlzdF9kZWwoJmlyc19kYXRhLT5lbnRy
eSk7DQogCQlrZnJlZShpcnNfZGF0YSk7DQpAQCAtOTUxLDYgKzk2NSw3IEBAIHN0YXRpYyBpbnQg
X19pbml0IGdpY19hY3BpX3BhcnNlX21hZHRfaXJzKHVuaW9uIGFjcGlfc3VidGFibGVfaGVhZGVy
cyAqaGVhZGVyLA0KIAlyZXR1cm4gMDsNCiANCiBvdXRfbWFwOg0KKwlnaWN2NV9pcnNfY2xlYXJf
YWZmaW5pdHkoaXJzX2RhdGEpOw0KIAlpb3VubWFwKGlyc19iYXNlKTsNCiBvdXRfcmVsZWFzZToN
CiAJcmVsZWFzZV9tZW1fcmVnaW9uKHItPnN0YXJ0LCByZXNvdXJjZV9zaXplKHIpKTsNCi0tIA0K
Mi4zNC4xDQo=

