Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D20C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6LfpyFcgH/oNNlE/Drzszv+AWz0flrK71sbAWgelUI=; b=ZTHJHVR1SfpsfSQrDW0rHAtfNx
	7SZ8oge1PI3GYMUWu1XEeMLTgebee+CNslp8/sx++D62TQKAwU32FD61ttItw9hWSzolfbbUMYk4t
	N2JuyAJ9apHWlACiAmCNNOENerto47WiI7WHBSdCgujokm1zYPlLgGRJ3WNJlMzc1bv+ENWzp4xWV
	OHlfdz2VRf7OB2rQ0W7zxYP6KkhJ1TUqFihGc8Hflt9/24z6LY1sKW2n9QpDNzJuyjqDqZNzgPkBA
	N7f6WOGLRe8IhdahHe79Cz+xRiMA8lnV1K0UZPKi9W/iw/NAv35RqdiECAcGaAtePsI2RkaKt/zTh
	W2Jb8VdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wto85-0000000EHsv-1INF;
	Tue, 11 Aug 2026 15:11:01 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wto80-0000000EHrj-10L2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 15:10:59 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vBA4DhcCwJVkSvMYWmbTdFt4EVEojuv9PCGQqmrc9l+QidzaKkcyaQnB3n/PUGc/YwR1VQzpBSN9pWyJZubOrqjhDcTvXiuVEpgNsveytezWauoOOHotHoJELS3B5IsiBI4SO4KJ/2Ht7CQBaXZq+GrJOp4HsZDt8HJhZ9bXz2nJ0Gz/TliyI99eutp4+k95V0DjXhzJgIoHub/Y9LDGvbI73GHFvYwOAND42/srqMVG8Vc7L1zSDJs7Rj7UmbcrKhEYsTwP8Rw3f01o7PVOosNGdRUoORED44CKpQj8XpnKAktCeRsgMMXvREfJ1fV+HTIkAYqw313xcP5Q3C02cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6LfpyFcgH/oNNlE/Drzszv+AWz0flrK71sbAWgelUI=;
 b=WCRNPxLP/wz8PTjQl6HVSkn6haOy1NZxMe9m3CXgnIaAG3BMU4912Fr8ekeM4ugrT4dJmZz5UiY5yvwf4hLV61A/bTk6TPfRHClYukZ+QHaWPYkhjoDdAZF1GFV27JAmRSxPABMacDSG5vnFkTNr0U4jZsmB8KP/Tu2h2h2kFwPJtat0uV/HMcnWfV+vJZcZHrNfk1QZPavLE69tNpQXhinOZAJHmFnsaNibbWUDvAWccwBXahbWWVJg/tVj80NqCz+/er8odQUprfazGX0V2a+dcQA5UDhZTQu/PiovRElKL6j3Uc+Zw9ba763csc4i1z2CjdoaeBtfkMrHv34ZIw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6LfpyFcgH/oNNlE/Drzszv+AWz0flrK71sbAWgelUI=;
 b=IgXdTjb9Uvfm2ZoDPOuDEqKMpm9RpTWW9TpuWBEby5fbU/0dWlxKQ18A3kRhGgcsCSHUVqBKLl+TeyOnJXVSv8RFikjfEOTKie3fOPTdWRjAvifBECoxNCmuv8ETGXW5LpgMgLkac9YMjHwQqhB2oDJuMfKGbz4MQssSxP11kCw=
Received: from AS4P191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::18)
 by DB9PR08MB9780.eurprd08.prod.outlook.com (2603:10a6:10:45f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 15:10:49 +0000
Received: from AM2PEPF0001C713.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::83) by AS4P191CA0003.outlook.office365.com
 (2603:10a6:20b:5d5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 15:10:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C713.mail.protection.outlook.com (10.167.16.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 15:10:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjxhkA0VcD0kXMhz/H5CVHHhKIO2fKimrsPuCtsfC9vk49WFL7VZXazY6GrknSczXl+bzgvWuH+Cu4fybjyQbiaeOK2u8qJ/sQDjZ809eLmEDlGUtrr9SN327Uf/BJ+GMjCqAXekP+S61DjbusypFel3ULI5K2uVy2f5YI1RCSATgp5j4GlCenYdni1oEq1Ec/VPRXbl02PlL5vFn8QyCdHH58ZEcSYPCReZRZsL7qYF1ES71lG7nDelsFCXi6UwTTsd+e4+RvfqMHtYbltyjWbKCY8CAMxup8wSokdhYlWoh3Vpvg7rYIkOw4ojoEDbg+TPShZMU6bH82QX5mznxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6LfpyFcgH/oNNlE/Drzszv+AWz0flrK71sbAWgelUI=;
 b=ZIu2gRpG6/kwMfGWEwJb548bLZ3Aj2p38tw9n7UAxbfBx/U/MRO3Qvht0TNar7MDKezY3zEA5Hs7dLOSfCBrfVtFQB5QF4UiOJ1Z6C9Sb2pqDE8VvjOForGU67VsTwg94bRxBClmdGe9W9LoXcvhhLjyQKQC4tADvTt/Hh+r1sP8pkdxpHqurkS0xup27dYcQEAwGcw0Tdto0CmF68jvlP+rMMsXEEVWjW6Meo4HrEItzfnp9RCQ7EqJG9Kmi4anTK9Kh9Sz8O7lBh7QQyuHnSi4+KFiSodRZzguKR0X3FUGHuDtvfZoYDFzsTB4e0dQXjfSfbDIWq75HExZV13p3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6LfpyFcgH/oNNlE/Drzszv+AWz0flrK71sbAWgelUI=;
 b=IgXdTjb9Uvfm2ZoDPOuDEqKMpm9RpTWW9TpuWBEby5fbU/0dWlxKQ18A3kRhGgcsCSHUVqBKLl+TeyOnJXVSv8RFikjfEOTKie3fOPTdWRjAvifBECoxNCmuv8ETGXW5LpgMgLkac9YMjHwQqhB2oDJuMfKGbz4MQssSxP11kCw=
Received: from DU0PR08MB8421.eurprd08.prod.outlook.com (2603:10a6:10:407::19)
 by AM7PR08MB5413.eurprd08.prod.outlook.com (2603:10a6:20b:10a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 15:10:17 +0000
Received: from DU0PR08MB8421.eurprd08.prod.outlook.com
 ([fe80::2158:1cab:1d88:ba2e]) by DU0PR08MB8421.eurprd08.prod.outlook.com
 ([fe80::2158:1cab:1d88:ba2e%6]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 15:10:17 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org"
	<oupton@kernel.org>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>
Subject: [PATCH v2 1/4] KVM: arm64: vgic: Free gic_kvm_info on initialization
 failure
Thread-Topic: [PATCH v2 1/4] KVM: arm64: vgic: Free gic_kvm_info on
 initialization failure
Thread-Index: AQHdKaOE7GI8y0csq0WodhejRe85tg==
Date: Tue, 11 Aug 2026 15:10:17 +0000
Message-ID: <20260811150941.941295-2-sascha.bischoff@arm.com>
References: <20260811150941.941295-1-sascha.bischoff@arm.com>
In-Reply-To: <20260811150941.941295-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DU0PR08MB8421:EE_|AM7PR08MB5413:EE_|AM2PEPF0001C713:EE_|DB9PR08MB9780:EE_
X-MS-Office365-Filtering-Correlation-Id: 830ed3fe-fa5e-47c8-4463-08def7baba33
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 4qKVFAWCGapbglhIKBYc0XXvwisRFFbG6SNCUkspMFCr3KA2RMu4dyNsUjsa46BEWntTNmqb+cZIRiVviaYla2pn5dzoj/2jY8rdl15j3kfJYAgySQjx8fgmUXM/KyyqrxFvldwM1hO7gszPV55Zl+R0RroRl+JmzaGlvpBemAFOTSV9jMAbyPoF8vmijUAyX7gqLSY/nMaAN7y+WQEgx5GypDZ4GS96WglF0IDarK1c7o8YuY4L9F7oyYtAjAK19dnhI9kbt1WWzz2HCY568nviZhibqpTPjqdGhGu3mCZoMvo3Q5Ytt1h3a+Y1RgQAH+VWz15YHMZ49z1sokI/jcgheJVC13IaNOpNyhegSgdzMNQJLM/c+uUkMT/RUCbZQm/NqUrMZFVuB0LkDAd86Uj+a1/A1fHWk1KHakSVta2BHlwtPQSAoweT7yotOlaX6ko1XwsZ6PXfoqfdhYk8bDAZJ50Nqa3r7O/oc5Rqqf4U1kRVz1oEx1pkOr0jY+tmv1MCdvl5/g+Ne50Rf/3zCHWR5NhMwT7zv8JUVSIIzHdVYSrPN9qqns/5nUwOkbTbSFQ8gsgRwtyV55w1/HO61S3/o9YKXwgFVTdfZ1bTAS9nawtuacd8On+UKiKYsJjKSthRkrpg3NUvA/Ts6+6xWpp9dYcSPlYteDpA/YHK/6s=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB8421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TcDkzNSVnubC4SUvRuzR3iRXGOI+0XEyGTFixYc+L/2jlLa1oVuJOWZ1vjMGq5cgjiu/cWrrEZpuqDlTPZc7/eFGlhDkFFfyfCaJxO+vKS2dLH2eTFijvLkhi3lrUgaAw4RG6V7MfFv4Mcq0bZewCqEXY7ErtL8Avn6D5UDQhZ2Zv6+xVXRjxKbxWTcIf80HO4TilvPCFoP7oNQtq7lojboFe8om4b2jsl8QzQgB3DHrfnu5MJ1GKFIHQMcaURhmWr65K1tAyU0ri87wiAlqfg15VQxjD/JM/nsijUBlXq0UaMg3Ot5S/hV74fOBe+1UJuTnQtYSCsRfiu04CGanOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5413
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 04833d75-006c-4c9b-c757-08def7baa71a
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|14060799003|35042699022|82310400026|13003099007|18002099003|22082099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: nyb6cpDyLv8ta0vcqHhIJEChSUjkM9WTnH/SjdW+eFcjj5MtX+Jd2I//Kwz23fS1JFXsvtTB60Sv0iXucZz99T33yoqTJR5yDY38R3LI6jsbzhCgJviCmE3O6/H74jCVvWfFpo3HiqYnrlZSjQFkfxwLJFycdKnqNLLA9R/tG9WoyMrJN9ZpLT6AsUpBVHN3lZWIPEY8CFX16eX4Qp4cFcCaPHJPDXTcRBhAKqaic7H3UdQtbwcBuX6uA6rRY+R8P3M3PEOS1fvGXKpjoK+pLDG1Ti5uqwuovdSTuN81h0e1Dn1yKQbWPlNiDQRTkeUCNx2SlqaBmMq1zrjzNEts3ydJ4JWUNQVXE0u5Pq0RW2JPDEHeAxL0JFinjp2XVzr3slsTjN4rNcOub+zAhoA1j5Ci5q78+ViIST6+SryyuXdAHqf8atqIBiCyL0OI+8Lr3nVHrWfYvcZPJmd5gijrRehFz5L4lpHbT+xiVy/WIFaW/AW0g0VbVCEcGH1PgYjVSA+ULGa1iDv68BBuSS4A+OVrKbNO0OdPTBLZy0q2c9BMLmgcElWpPDgmfwj9LXTeuZaTn6ptAAFGt4Cs7SKaAdgCe8OkJKnld+BPf2oXwE0jrrhY6IA7Y0yjGanekWrf/5EqF+w3BFN760rXcfohkw==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(14060799003)(35042699022)(82310400026)(13003099007)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TgPe6v4AASzOI8xusw++nRG3Sa9+eRYJGioU/m2sNpoEW6wC+qLGigu9tRIl/SRmH/g6FWwPVEYUWhPoaC6TSog8C3scTS0jxge7Md6wKsxIzYu+bZrSpZHM8VmbUaJAhPAE5PWVaieIf2y73o35JxpItvStsc08znPdBlC1bfaINcfZV7jFGGCtmjqQCBNjxdFByCOg08WRwzjkIRXZjViQlcuIDci3IfYCgvD0XOE+AcI62Aia50RSsk8/m2ohZBm3M4/OMIccLNsZlP4Sbz7fCNP5ByQYlqCU/fR64DNkBpTkSYmr412MA1pp7kCHDkFfEkijbCfCufgSRYmch/07LEqzS/815FnoGyEILuSB90ctL/ub4poooGLjhGTzKz6+GhDev6PHrajSZW39NQf1AdZyf+NNi8XzOHw617hoszwEYnzq0ivI2TU32TEJ
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 15:10:49.2196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 830ed3fe-fa5e-47c8-4463-08def7baba33
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C713.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9780
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_081056_278309_63C56E7D 
X-CRM114-Status: GOOD (  10.99  )
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

dmdpY19zZXRfa3ZtX2luZm8oKSBhbGxvY2F0ZXMgZ2ljX2t2bV9pbmZvIGZvciB1c2UgYnkNCmt2
bV92Z2ljX2h5cF9pbml0KCkuIFdoZW4gYSBtYWludGVuYW5jZSBpbnRlcnJ1cHQgaXMgbWFuZGF0
b3J5IGJ1dCBub3QNCnByb3ZpZGVkLCBrdm1fdmdpY19oeXBfaW5pdCgpIHJldHVybnMgLUVOWElP
IGJlZm9yZSByZWFjaGluZyB0aGUNCmNvbW1vbiBjbGVhbnVwIHBhdGgsIGxlYWtpbmcgc2FpZCBh
bGxvY2F0aW9uLg0KDQpSb3V0ZSB0aGlzIGVycm9yIHRocm91Z2ggdGhhdCBjbGVhbnVwIHBhdGgg
c28gdGhhdCBnaWNfa3ZtX2luZm8gaXMNCmZyZWVkIGFuZCB0aGUgZ2xvYmFsIHBvaW50ZXIgaXMg
Y2xlYXJlZC4NCg0KRml4ZXM6IDBlNWNiNzc3MDY4NCAoImlycWNoaXAvZ2ljOiBTcGxpdCB2R0lD
IHByb2JpbmcgaW5mb3JtYXRpb24gZnJvbSB0aGUgR0lDIGNvZGUiKQ0KTGluazogaHR0cHM6Ly9z
YXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwNzI0MTA0ODE5LjEyOTY4MDMtMS1zYXNjaGEuYmlz
Y2hvZmZAYXJtLmNvbT9wYXJ0PTENClNpZ25lZC1vZmYtYnk6IFNhc2NoYSBCaXNjaG9mZiA8c2Fz
Y2hhLmJpc2Nob2ZmQGFybS5jb20+DQotLS0NCiBhcmNoL2FybTY0L2t2bS92Z2ljL3ZnaWMtaW5p
dC5jIHwgNCArKystDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQ0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9rdm0vdmdpYy92Z2ljLWluaXQuYyBiL2Fy
Y2gvYXJtNjQva3ZtL3ZnaWMvdmdpYy1pbml0LmMNCmluZGV4IDkwNzA1Nzg4MWIyNmEuLjY1ZTIw
M2Q2YTJjZjQgMTAwNjQ0DQotLS0gYS9hcmNoL2FybTY0L2t2bS92Z2ljL3ZnaWMtaW5pdC5jDQor
KysgYi9hcmNoL2FybTY0L2t2bS92Z2ljL3ZnaWMtaW5pdC5jDQpAQCAtNzg3LDcgKzc4Nyw4IEBA
IGludCBrdm1fdmdpY19oeXBfaW5pdCh2b2lkKQ0KIA0KIAlpZiAoaGFzX21hc2sgJiYgIWdpY19r
dm1faW5mby0+bWFpbnRfaXJxKSB7DQogCQlrdm1fZXJyKCJObyB2Z2ljIG1haW50ZW5hbmNlIGly
cVxuIik7DQotCQlyZXR1cm4gLUVOWElPOw0KKwkJcmV0ID0gLUVOWElPOw0KKwkJZ290byBvdXRf
ZnJlZTsNCiAJfQ0KIA0KIAkvKg0KQEAgLTgyMCw2ICs4MjEsNyBAQCBpbnQga3ZtX3ZnaWNfaHlw
X2luaXQodm9pZCkNCiANCiAJa3ZtX3ZnaWNfZ2xvYmFsX3N0YXRlLm1haW50X2lycSA9IGdpY19r
dm1faW5mby0+bWFpbnRfaXJxOw0KIA0KK291dF9mcmVlOg0KIAlrZnJlZShnaWNfa3ZtX2luZm8p
Ow0KIAlnaWNfa3ZtX2luZm8gPSBOVUxMOw0KIA0KLS0gDQoyLjM0LjENCg==

