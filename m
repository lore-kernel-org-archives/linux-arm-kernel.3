Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBCBCD13DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Mk9fd14xg9cuY2J0dvONSJfwXFrD1HcZnn+irTqETA=; b=F/Z9W5Sya18Ja/KNL+1TNZg/Wq
	axnoQfe3iQ4G+mrCyJ7lAdMY8y7kIkai0ed+xwP8gRt6kMAXkAd/qbiCal5YC4YW7IlgKQQDM8DQF
	gnYrMZmw4RQN2uKAuEgvcO6bHcK/5Zjw06UPbZHL5HEBZwEnQXi6eW8qhMxNItD+d45PSXw5j8BNn
	+FaPc2xoOm3qBl74CU3YaDtJ7ckRERqEPXSkCr31tE8AnD0kOWciTdZ0OtoTC9C86VmUk+7Fqk/Jr
	gNdYpioY2OjuX9yXvjJxOclx6aAxrHTEmm7xVPNqX/lXNQ2lULf26OhreyPFTSJHqvex6FoLsvd9A
	FTvyABpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITQz-00000005f7l-01i6;
	Thu, 30 Apr 2026 15:36:13 +0000
Received: from mail-westeuropeazon11013042.outbound.protection.outlook.com ([52.101.72.42] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITQw-00000005f60-0HsU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 15:36:12 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dsl5nrrQYJ6iUZTwfCchS8PvQb5JkD96lirBu35C1amwByujthcvexihbHcEdr/OLkFE45smAHI8LEkYMRHkZURUBXyB/7jdjZadl+2ko/neO9h7ImCF/+bypQ+XhagdwCXgXOrkKHYg6SsVUDf2EOjaarItrJ3bSe1xeokAozMw9xWOYAi6oCpDK+9MiEVX0GCm1UdQM+AHe3QBdqFvBbBQ1LzmG1rXHzr4x0HG8v2LvxUeBaC/9widuyr5zpoHeV/8RPD1sX/aeK4Uact7qJDS2cLDApxhetyKA+NNDY/wzqk/YyNBjzKwHb6NQXGA0NQqI0aliNy76uywJU3S5g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Mk9fd14xg9cuY2J0dvONSJfwXFrD1HcZnn+irTqETA=;
 b=qw8a7GcA9sunG489i4XcUk1F0Re/VE9npDE1zg2WkHlh7ayboe4hL3AYRZosoocEJWKnWqRThwg7HFei0DS+Q9r3qoNlv4RyWdtDIVwwgCdddi7z/9pcVMo5n3+BqxvqBufb65PSPVe5C5cGI1lPimaiuWeqdA+hlmujmVzyZMBRGCNCSU6nw2Uj86A7xSVYDjQkSUihjj6j+UITUxha0B5pqv/XZrUueMaOu0ADYPxf8RVPNKRAwKeBOJWqzyTimUhoOVHo37/38kDN+oMDGaBFSMxBrvO3yAo1OYOUocMHzuZFUSkRztO/6dcRY3edbILRaEl8UcCrSDxgt9ydbg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Mk9fd14xg9cuY2J0dvONSJfwXFrD1HcZnn+irTqETA=;
 b=IxW/WIh4hxtdGMTKQZjr3GHkkroZdCOV39DHPAx4Gkfa2pmGqNDq7ZSIrPOiMOGQeSZw4+Z0PLIx7YJhKp2wGuTVApcbatpK/RXEvPQxa5ADW0uzIukkZ69MX0nGeUs9VU9KNF+n0xLCK1NUOdFKfB2o+HYBvLHUhDR8HdWTg8o=
Received: from DUZPR01CA0328.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::13) by AMDPR08MB11527.eurprd08.prod.outlook.com
 (2603:10a6:20b:716::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.21; Thu, 30 Apr
 2026 15:36:04 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::64) by DUZPR01CA0328.outlook.office365.com
 (2603:10a6:10:4ba::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 15:36:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.18
 via Frontend Transport; Thu, 30 Apr 2026 15:36:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovjyEsocJJAqhu32hU38NqF7h/8xT/J1tK52FSFZ6tMsCge2G/telWAlR7yjELyltibsfs1UYl8I2VBJGtFIjTu+U8XQbBoF6x2mTY4I9oDELB7sGZpglqtycishwmWWKOrYdg9Z6Qr7qIzrU9pBP/89cI+zUaeUigCzGBzFrlv6ENHw+ZcPq2XQwrfEqIYlBDCdgz06bl2y2dVGfTJMSA7aNpjb76AdmGC/iYAsr1LMlybnxwxN1jenTAdbY5JRzEK4LZZtqZWyBKizx3jAK6qDOtBrE88s9QCM6ddTfkhxVZmcPVHKQpxaj0gV2dLtqCjhUSnKcWnnZkExyRL2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Mk9fd14xg9cuY2J0dvONSJfwXFrD1HcZnn+irTqETA=;
 b=QVFP91pq9qJ7qqegbrP7ZmwS/rtmcLJB4uaBSOFc2VKWptwVMJt4ssgSsUX7xyCwysML/EoByyQVUKWvhY+VrvNL0L+AS411lv2CLONz3H2M2J70BRjsdrWQYnR/DYzflNxmXDryGuPykjyI2MpUA4dBiKl2AGksVnXC/3d36Y9AatxyK2tgkxSaewCDODXGxg3s+7V5aCB/NAtivjcXYwbIcY9047R4jDon1foPexyHxWBpm3gpfnJTHsmVcf9MDjkLt8ezYyhfk3gmfBdkv82B1u4OWwm/EQf+Rfa3/ErxTG1BqoNepCvC7Hv1aOj2RXb/98LHYpy6a2wTfobHvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Mk9fd14xg9cuY2J0dvONSJfwXFrD1HcZnn+irTqETA=;
 b=IxW/WIh4hxtdGMTKQZjr3GHkkroZdCOV39DHPAx4Gkfa2pmGqNDq7ZSIrPOiMOGQeSZw4+Z0PLIx7YJhKp2wGuTVApcbatpK/RXEvPQxa5ADW0uzIukkZ69MX0nGeUs9VU9KNF+n0xLCK1NUOdFKfB2o+HYBvLHUhDR8HdWTg8o=
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com (2603:10a6:20b:47::18)
 by DB9PR08MB9490.eurprd08.prod.outlook.com (2603:10a6:10:45b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 15:35:00 +0000
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7]) by AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7%5]) with mapi id 15.20.9846.025; Thu, 30 Apr 2026
 15:34:59 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: nd <nd@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
	<maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH 3/3] irqchip/gic-v5: Allocate ITS parent LPIs as a range
Thread-Topic: [PATCH 3/3] irqchip/gic-v5: Allocate ITS parent LPIs as a range
Thread-Index: AQHc2LbnvlMVCcIPykKm9ZWm8OVADw==
Date: Thu, 30 Apr 2026 15:34:59 +0000
Message-ID: <20260430153352.3654325-4-sascha.bischoff@arm.com>
References: <20260430153352.3654325-1-sascha.bischoff@arm.com>
In-Reply-To: <20260430153352.3654325-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AM6PR08MB3399:EE_|DB9PR08MB9490:EE_|DB1PEPF000509EE:EE_|AMDPR08MB11527:EE_
X-MS-Office365-Filtering-Correlation-Id: 4854af30-0d9d-40fc-6f28-08dea6ce3077
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 9tr2U/WFPlb2LZqfSrAARw8wxUlZvnfNOiYs4sc+uhm9kbrzr1WRrwEbaIg0K0d+6kUnYBiqxO964wZ9Z6KQOk1mA/Rq2ClczFA07/Kz2ao+7SVl0GIeBcayCqMLf7slN+zpsCSLYmaqNplFC86tVOquK/uoZke9gzG0leqkZJ3UKRvN99bDopUcmKH/LxPNhD2Jv6FHTgiIDyqqor/s3+Leu2n5cQgV0JFZNXSrs0heiBgWcYG+2bzSH5E3FhhAo1t/C8ek/cqKRHohDLKbP5jHVeDsaTO6npt44Dv3otIqI2gk1JQJVQiQDus7jcW24b1YPKijelnRXJoXjk2nIBkSlKyMVbKimQuzNdPpVsXToRghvS0X+CjW7VOysI2QLWZO4vo6jLt8//eQhAEMIyjra+MWOX3+UkD7115mqYfRxIVeyxuTr/oNvk7gDQCzr2kVzPa2hM3rogyf0HJvZm4IJqDiEbDcePGBumTHaDwV42OIJEMj0LxJOpp1gHlHehJUsOZjYJ7ihu8lYYvbDiBoboRU4gt9IzBrGuXia/IikB3tEgrhqTr9UTNyBpaVE1ZsLGrRjulrc0HDVMZDYbbMfdqDWOonbYbf3ARFXmBPbh9D2B4s0LgPvG17rStvhV4b4wnbTAeLTUTqv9uc/HJ8Y+q+QHd9HhNfKt7ZutCCg+m8JPUD8Sl/N4fjroBXP30zpZgsz68B2IPWwYhl2kJNktWwnArUM1h5N6r5f7oGRjjnouUa6R4SrgTVTy98/jwKHzD/fAPWzCzwhsy+iSMpDK+jBjoACsSrhZIkLTY=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3399.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: n1WrXs1IrkhTuK014CCiQmn8BftbmN1Q4Ybr2gJMXlR0HyLL64ltLIBNmt7YEEH7YM3mJaO2YGQdeJpCr04H/9IMYenlXQ09M28zKMyKJocvXK/kpUORy7ywrRky9LezG/u9lroEj8gF7nqR5pfJ3QOfjMeON4nFS4yWHaQl3H0LQ/JUUlYuKYIME4FbLY77nqNNzYWKElreQyE8ijvvbOhS7UwcGQMe44C7WO+8jmqmWYoPld9uHZri3us6VLBs5tOCyp/ENLQpSde6821m8TbEtfgeUZ6XPmWGLCtAiZ3FO2NXsTnUlxZmIKO6w9v7lZp/tOjnNLQ6puFrIxNxsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9490
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 12001fa7-a9c1-4387-8514-08dea6ce0a4a
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|82310400026|376014|36860700016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: iA7Ozwprf3FeH6Rw0qsNXFYAlm8hXPbkgee1bbFYWbqSjmSj/xzNI8uDiq6i8wRlaHLplnQzaCuSKlLO0Qrt4b7GxaHM1vI1elOmLiH3XNJxDA/PF9Cvbf8X22SzY1uO47ZC2z3GF0uGvck8LUifYNDSBOslGQ4gJb/Ui8Pcjb7dx7EpoKOci/gLLa54FLy5/pnlHxZlC5E9An/R4WDzC5qmVHJXS1u1Vm7lwcMdqSQw8ZtjqNaLtjbk8HDGQr6IlhWHLr4ZDGM0lHVcSt/3JAm7eEl/B28QGHeP6KZvWk6IId6oCN7UPPjvkB12DzKPcIsIutJQkNfFC+xhGJr+XlBdPLGJcz5ISLRv4YIYwthLXLYkJVSKMRllgg6liA/6TOf7Lo+FKoU4GVgBJl5wRQC685EfHlZITDRvnseVIhG6LtV9lvDsqluJ6VOdHW+PeBMbhGTi17uwR8oBZf9Wg3/ekZDNknx+r1+iaLcfHbpnPgahGS55YPVi0T6xN9O+vKqMbWVG9evHDNXXOmD0YPVhHtcHeVIbCzAineNqm4sJFuiV6v1uYJGHyynVvyoGOQ65DQ6dY22de0USC//QFnlpEODIWp5m5hDOtMhFvjlYrfEg/jeI18acMJ0I0DnB0jpnpf+TiFWQBQgjZ56yzxq0Rd3ODTjCU2QZ+GVzYlYmz8Iafm6ADMiQTpqoJb+yhGsyljBhy7a4oUyhqJi2NqW6frPPKDy6piJX9LA451R4PpamPLNjfBmFc/bKsTy5SA8LVewA+5oaVqbG0yOitw==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: OeCt5jLjBOViUezvqgI8LzR9sFhd0jsc38RvexDmOrDjmRExQDgretzRk+l8efWywQ/QBd/CUUrZM37K9DH7lhJ4voCFECAjGPUpUaOITaMn8ol/vaz0gYxaxDhl9Etwcajp4lZSjg5kvSkmpLOAeUiLTFkyRMJI/YhAR0de6hv0uCRK+Y3PK1EtaVdGWJqfCNtWW7zKAnuxu5J7Xa82UGGFj1fPOkkTQZG5hI8CvuQaiZAGqVN24314gJsTspCeG1pb99FJreMGrPxgabXvXx5S/F2GRYjrrXbdb+kx2uSNjJQb7APt+Zgb6aPQRlpFiBJR65K9K1tEQSVVMNVWLGh9wXDCeQJ9f1pOA9CSs8b8sPnonWnvetwoa1BAssnjppWgRB0n2Sk1cya+ROwYCHGNeueNif7HsGibhYrr9wKsobRVo4qAgo3Jc0ImE8jh
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 15:36:03.8797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4854af30-0d9d-40fc-6f28-08dea6ce3077
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11527
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_083610_158969_A587B3BD 
X-CRM114-Status: GOOD (  14.33  )
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

The ITS MSI domain no longer manages LPI allocation directly. LPIs are
allocated and freed by the parent LPI domain, which can now handle a
full range of interrupts and unwind partial allocations internally.

Make the ITS domain request and release the parent IRQs as a single
range instead of iterating over each interrupt. The ITS allocation
path then only needs to reserve EventIDs, allocate the parent range,
and fill in the ITS irq_data for each MSI. Since no operation in the
per-MSI loop can fail, the partial parent-free unwind becomes
unnecessary.

On teardown, reset the ITS irq_data for the range and then release the
parent range in one call, leaving LPI teardown to the LPI domain.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 drivers/irqchip/irq-gic-v5-its.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-=
its.c
index 36d03f82ef684..28e39b065de0e 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -937,6 +937,7 @@ static int gicv5_its_irq_domain_alloc(struct irq_domain=
 *domain, unsigned int vi
 	int ret, i;
=20
 	its_dev =3D info->scratchpad[0].ptr;
+	device_id =3D its_dev->device_id;
=20
 	ret =3D gicv5_its_alloc_eventid(its_dev, info, nr_irqs, &event_id_base);
 	if (ret)
@@ -946,14 +947,11 @@ static int gicv5_its_irq_domain_alloc(struct irq_doma=
in *domain, unsigned int vi
 	if (ret)
 		goto out_eventid;
=20
-	device_id =3D its_dev->device_id;
+	ret =3D irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, NULL);
+	if (ret)
+		goto out_eventid;
=20
 	for (i =3D 0; i < nr_irqs; i++) {
-		ret =3D irq_domain_alloc_irqs_parent(domain, virq + i, 1, NULL);
-		if (ret) {
-			goto out_free_irqs;
-		}
-
 		/*
 		 * Store eventid and deviceid into the hwirq for later use.
 		 *
@@ -972,12 +970,6 @@ static int gicv5_its_irq_domain_alloc(struct irq_domai=
n *domain, unsigned int vi
=20
 	return 0;
=20
-out_free_irqs:
-	while (--i >=3D 0) {
-		irqd =3D irq_domain_get_irq_data(domain, virq + i);
-		irq_domain_reset_irq_data(irqd);
-		irq_domain_free_irqs_parent(domain, virq + i, 1);
-	}
 out_eventid:
 	gicv5_its_free_eventid(its_dev, event_id_base, nr_irqs);
 	return ret;
@@ -1000,14 +992,14 @@ static void gicv5_its_irq_domain_free(struct irq_dom=
ain *domain, unsigned int vi
 	bitmap_release_region(its_dev->event_map, event_id_base,
 			      get_count_order(nr_irqs));
=20
-	/*  Hierarchically free irq data */
 	for (i =3D 0; i < nr_irqs; i++) {
 		d =3D irq_domain_get_irq_data(domain, virq + i);
-
 		irq_domain_reset_irq_data(d);
-		irq_domain_free_irqs_parent(domain, virq + i, 1);
 	}
=20
+	/*  Hierarchically free irq data */
+	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
+
 	gicv5_its_syncr(its, its_dev);
 	gicv5_irs_syncr();
 }
--=20
2.34.1

