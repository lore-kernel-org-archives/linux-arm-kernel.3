Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB20C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 11:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwBhS9B4VgIzzHxKKpSsxgOxLjTU1Uvo2Cs605oUvVE=; b=dPw8EI2j7nUMlSWkf6tKzpmmbN
	uowTQFkJWgo+Xes2mNQkdL5hsnEdaEwSHCKX9x74+O3agukSg1oA74UBrkZ9CAQskj59vQ57hAWgD
	BeVBRwcgY1XI18ZuLtKDeTzzB66sRucoyu1jUkYBnvnaq4IWrKb6sgbDHAG3kP/P91vJgpTgdUrWh
	iI3i6M01JVxGEVE4dgY4fCKjQGirI97sGqaNGFIIdCtQBB9ncS0n9WNuVK7EQwAVvtvyRIDSK3pn4
	pkAkwAOzCLlP6TXUXwNt1+FtkQzO2gakqUud7Y1pG7CzZmUVH6ULY2//H8A2ot1hmvihHbllRMQqc
	mUJRYpVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQIw-0000000Gzpj-1h4I;
	Wed, 08 Jul 2026 11:19:02 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQIs-0000000Gzn3-20OK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 11:19:00 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jmRFamsv4aRPQsNELgU3mqt3+5PnvOL5bj4f8uU2OVHGdIJ8pJsUtpanBj08MMFj5+5ten2uA/d24v7DUILc5B7W+g440gbu+9ZKYYpCJto0TxTE1lveUBywa7FU4oJG+49dJZO22BCjHHyw87+1ZjxKM935DBuYsTjt0WdizoFBmBGQMrJhuPDt4yz3FTx/G1bxZyQGE8WD9TmogyClSRCoyHfDO1KDCdbmuRuFW87SDOj2Vr+49+6LF2hFveMxEbrPbHtI8pNfO9Xuv0Oux7OEdIm51NT3tAVWhxfPd5kPpGcSg3QJI0pZaRcNo/vdMcwG/66+TiqwuGD+X6PvXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwBhS9B4VgIzzHxKKpSsxgOxLjTU1Uvo2Cs605oUvVE=;
 b=ZUBV3CMr8ATVLHkmqaDIFEAFAiBTB+A4VVVoy41Ei6W0fVlj5J/c37cM1wgj3/u0M7P/1Ovv0+B0J/2O7ce4U8yzXiZ1nYj9hsTfJYpYHLtCMkydUrX+uAAA3/uHzqpFA6SKJ8LvZT+ppW1/yawzUXB0u57TM+BXyFL1HcgiNM9rEff2ahuqirGC+ZCdaXTJ0RYwHz7jZmRG7aufn/aMGGpqhsj+sdlWEt4H8olnqjKtrsaJBV/y4rnbMH3uAOG9l4r//wx9IM3os0QjY2DcsHgQ8gBv1HLQfnb1YAE1TLzRtltUPVk8zxL23ypIOzpByQ2InuVhsgVzsrUiz9t+aw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwBhS9B4VgIzzHxKKpSsxgOxLjTU1Uvo2Cs605oUvVE=;
 b=keqkBrMhJIQMnBnc8Kb9EKgcXDWlPYDoH4WF5w5XkUSkq8lhrKhhoAziCjuuwVtbXnoT544QL3LxEYTBrVSFUOMhx4ywQr20I57UA9/EjU9gzLFvJ7OTBqodLgZz3glyCwp5ke8uIsqM0zjEf/5mUAD5DtJDOkjWJu6tC1gED9w=
Received: from AM9P250CA0025.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::30)
 by DBBPR08MB6204.eurprd08.prod.outlook.com (2603:10a6:10:1f5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 11:18:49 +0000
Received: from AMS1EPF00000091.eurprd05.prod.outlook.com
 (2603:10a6:20b:21c:cafe::2e) by AM9P250CA0025.outlook.office365.com
 (2603:10a6:20b:21c::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 8
 Jul 2026 11:18:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000091.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 8 Jul 2026 11:18:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRkwqWv+y5GZD6LL3dPURmqAbOm6wcOvZv9kWXvuYloEln92x/ZxgoJ9VUWynBhfeg4onQk9ZwE+yT2VS93Pqn7zoX/PXukh45tt4LLckEqviPZa6X6tFYBzaPV7CI2g+tnRyawzlI1/+0Q7rZIFJJInTMac+Ux7dYEOom0/5VgDdaX21ThtPHomW93YG3sbn/jUFdBswQ2S/WofESey8Mf1zUSGXaimKLc42Sr1Mex23tjaWOCDew/YzZOwnkD1lqwFlawQjeyNh+n5U6DUccA4Dpvea0j6N7sckfNun+S4ukuLGmtfX+rbwwmPab+9+T/+CE0/ErsS9YIgFWSFLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwBhS9B4VgIzzHxKKpSsxgOxLjTU1Uvo2Cs605oUvVE=;
 b=TNhvOUo8BeDK2MoP99WC1zQiYfgnznT8/DxgQAxQXbB81yATv+JRJ1de58W3t1WuZbM+kDxZPimPm98gK7QhkliQcWf8htjQE9Vq1cBxGVKlwlABRCh5taYBhYEHZMzHIMTpJXyZDvbRZpdUrljLykRAly9czoZQRADfMf+31fZQNtKDrbH68TWbqEzSGdg6SU+SgGes7xusblvWfc4RcB/pjK2k0KHBXKlvJ0ursoavHk/YLxspnJlyh+O0eN2J5utLEsGfelHjgcWRPJr9pLtV4jXorl3ZyDK5WzmzJUqtB409zw+/IBA7BGYFC1reSv9G56ejIu2x4pNF2KPmqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwBhS9B4VgIzzHxKKpSsxgOxLjTU1Uvo2Cs605oUvVE=;
 b=keqkBrMhJIQMnBnc8Kb9EKgcXDWlPYDoH4WF5w5XkUSkq8lhrKhhoAziCjuuwVtbXnoT544QL3LxEYTBrVSFUOMhx4ywQr20I57UA9/EjU9gzLFvJ7OTBqodLgZz3glyCwp5ke8uIsqM0zjEf/5mUAD5DtJDOkjWJu6tC1gED9w=
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by GV2PR08MB8632.eurprd08.prod.outlook.com (2603:10a6:150:b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 11:17:45 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%4]) with mapi id 15.21.0181.010; Wed, 8 Jul 2026
 11:17:45 +0000
From: Mike Leach <Mike.Leach@arm.com>
To: Leo Yan <Leo.Yan@arm.com>
CC: "coresight@lists.linaro.org" <coresight@lists.linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"james.clark@linaro.org" <james.clark@linaro.org>
Subject: RE: [PATCH v3 1/1] coresight: fix issue where coresight component has
 no claimtags
Thread-Topic: [PATCH v3 1/1] coresight: fix issue where coresight component
 has no claimtags
Thread-Index: AQHdAAT3/VyBTw7HQkuIRxXco323rrZKYx2AgBktxDA=
Date: Wed, 8 Jul 2026 11:17:44 +0000
Message-ID: <PAVPR08MB967430FF10F7300580230C4B8CFF2@PAVPR08MB9674.eurprd08.prod.outlook.com>
References: <20260619160148.499223-1-mike.leach@arm.com>
 <20260619160148.499223-2-mike.leach@arm.com>
 <20260622102625.GF31870@e132581.arm.com>
In-Reply-To: <20260622102625.GF31870@e132581.arm.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PAVPR08MB9674:EE_|GV2PR08MB8632:EE_|AMS1EPF00000091:EE_|DBBPR08MB6204:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a7d65b-30b1-44c6-6a83-08dedce2aed0
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|3023799007|4143699003|22082099003|18002099003|6133799003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: cBkhwZTAJrtjE0+C5/ktJ5iEveATql4f07bVy8a7aSTgEpqRp9NbjdqiKgsHCj4V1TIFHvhYWYEL7AdkZslTeKud9QOGloucTaVWpuFr31YzhH153dDYDi9m5cSA8V5z3q/5QdjkytVcBb8KpvxVfVj3iDBFU/ZqVLj/DM58vcJqbynPMnz6SeKpLSjqAPaWSZKMHlu0e61SmWKRde1ugOKHu5GOmPDSwzyE8IfvMFi8CKUQFLn0cZyNnUrUb00Tj1VD82nS41yexkl5+lCg6YnLClkOPuZQ3H7ZMjorLAN9SYEOwv/cEaA20BRxXDh2154a1SbAYAdboNH8z+O2Rma29zw7tRGvZ2YWnhEDIVCnTDgd+19PmtWGY5GS5tp8dGoa9FIhSHq3qOpEJ8T+wFAzmbU3aESN0K/iS0NkSRydQwi0wPnFQm0Dv27evkNZW7biwk2m7ItgqYp5A0HBLexaWVyBhJOJnBiyb5UWysstVerW75SY/35fMBaVjG8kiaGfCis9KDRSpFXD9kbVtwUvk669MmZUG17P6Rxx1NDCRC1/jKzghi4aPFVTLYZHZud6MtwFoiBnxHQ38UtZpiSQ+wi27lje8GGue1QZG7wjW/EkWxCvRlsPithF1v3Z4TJj99DfiT0eGu9vftp+HZX7eE0Mm0u4c9sw6gfSinhkjNauJOxU4TUzFveqnuto/LR1jtmt8ZrXCad5LXNnjMqHh0c1NyTc9F4hvqk7SfQ=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(3023799007)(4143699003)(22082099003)(18002099003)(6133799003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GqIn5+E+i7FDQRKXyyM/YyPG9mWJ++TyVtJbOO7wDSPwos/qVC2tFGUUEHfy4c2oXm7F0PxuTSITSjEKQFoC9oVmmpRpC37bgcSpN2u6I7WplYe5O6enM6HYHYp5jkaWRC3j5hYNL7q8VnYvEgrJOS9rp/DUzubNlUZfe6hBId8v+1JrDDryqSEghqIMYCjUOZ3F/nIZFQR6G/lwWcKxou4I8j9u7xf7v4kQS+7HDATyoVbVU1jUxY/hhHby5mB51bd0AJX67q+RYrnHcRrbbUtyuaeLtMdlQdykHLSipBDDvz8l6VFxX918HN5k5CnRS9dODaNOh/TIMDfAvdERNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8632
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bef468a8-a315-4f8a-eb78-08dedce288d8
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|14060799003|36860700016|35042699022|23010399003|82310400026|6133799003|18002099003|22082099003|3023799007|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: reHof1E2YXnDmMSN2eDjLJgtSkeqU/IMCx6GGZhsKsumFU9XkWFhSbVII1CzJn9nhvlOUSmG4CmrVgHx2dhpWButtC8Kt4hKY55gsP95E0wNVZvh0n52fR4jIV28DA/KKS19SrwiBc+eCTylptXoZRwktSlfspCLyTqY4UQ3DEf1aJ3LEAlt54gmt5pQv+UEJPrAU5/PG3Qo5z1Tz8o7LsjZkaMAiPcVeZt4aybyGFwQa3x8nor+moDYV3M9r44MFzE4yzkRmkXOxH8M2z6hMX2VpMWoZLVaJv4ZtOb42FhminuAHrWKfpvn/olnoJ6IIlCJpbRNlObpasCLKe7PpFHD1WRVQtXVQT8sdLBGZB6pGsD8NsYw6D2732Hn27AErUiDs34QUHjs70pZ35xtZ0TOh6mXdCJvTtcKcUOlwvFnEk15te3KDyqlHcLzjzUO0xsCh0SZLGpv5GzCx3ZPCXAHx7zQV+dylUm0FVcJRDJx7DFROyyN9Rm+sIaB4c/akrZZ43Ez20uvBpcjRz6jHN/R9vXKGhPl21YGx9YxFYh++t1rh4kkQzMkpguxQNNEt38aJ58uBoGsHTAQ5m6cbhFeMOESnWPAjv7S/H7MIqCi9nW+yoeZ876GMl4wQ5575gb7jxSuvSRcCgZwK5BZqqSGnwSN4lYUYnZv9oyzd+rX7wQtsCoXJsVXubBpERp7/DrmTgzGebvH76vTjTWH3Q==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(36860700016)(35042699022)(23010399003)(82310400026)(6133799003)(18002099003)(22082099003)(3023799007)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: e6cBqawuqMjs0+88vKx6y+plV8ZG+FYYZp2qpKNNTkQlmpIYBBoE+tblV84QocbAaygYxLvqShCcT34tn5wh0oc/l/fpdr8THgRXCkfWwHVWsZWdbQSMUjrDpLcT28RVsLz2mhuNo3WrAFBWARRQbQ1oVMBXItrAOLH4avOY91dUXLb5+kGAHXL+9SjBSJvQ/GRt/EyajhxCzNYmp3UWdZyPcy2KqmLGdA0tUzcOImFnBRnM2NMhf95a6y6/t3TEc8+THvPG+19Jf3GJtrxmXsRN0qu5aou6v7C88GVQRDw2OssoBBEoFTqvQDeuhSeqjvMjkjB/t9cUPeqqiS9ibWXpS1PI1/DywkZEbwhjSSdGcO3+CrlqBVK+U2DgdPApxHmk1XqXplXtWNIUic+177H6PrhxaYbjUQ18R7gAB8CWbP2dFLWdnfyOWTodSdnO
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:18:48.5813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a7d65b-30b1-44c6-6a83-08dedce2aed0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000091.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_041858_811209_760F32FA 
X-CRM114-Status: GOOD (  25.04  )
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

Hi Leo

> -----Original Message-----
> From: Leo Yan <leo.yan@arm.com>
> Sent: Monday, June 22, 2026 11:26 AM
> To: Mike Leach <Mike.Leach@arm.com>
> Cc: coresight@lists.linaro.org; linux-arm-kernel@lists.infradead.org; lin=
ux-
> kernel@vger.kernel.org; Suzuki Poulose <Suzuki.Poulose@arm.com>;
> james.clark@linaro.org
> Subject: Re: [PATCH v3 1/1] coresight: fix issue where coresight componen=
t
> has no claimtags
>=20
> Hi Mike,
>=20
> On Fri, Jun 19, 2026 at 05:01:48PM +0100, Mike Leach wrote:
>=20
> [...]
>=20
> > Any device which is not verified to support claim tags, will now get a
> > success return from the claim/disclaim calls.
>=20
> Do we really want to relax this?
>=20

The claim tag specification permits 0-8 claim tags - it is perfectly reason=
able to have no claim tags on a device - including an implementation of dev=
ices matching ETMs CTIs specification etc designed other than by ARM.

Currently, a correctly specified device with no claim tags will fail in mos=
t of our drivers because they all assume all devices have at least two clai=
m tags - to implement the external / self claim standard.

Clearly this does not meet the specification of claim tags.
By returning a success call on devices that do not have claim tags this act=
ually simplifies what otherwise would be a much more wide ranging set of ch=
anges.

> AFAIK, all Arm standard modules should follow the claim tag protocol.
> SoC specific modules that do not support claim tags should not enable
> claim tag handling in the first place. In that case, they would not
> need any claim tag-related operations.
>=20

Claim tag checks are endemic within the drivers - this solution allows for =
a valid return for devices without claim tags, using the simplest set of ch=
anges.


> The tricky part is that if a module provides CORESIGHT_CLAIMSET, it
> likely supports claim tags. Conversely, if a module does not provide
> CORESIGHT_CLAIMSET, validating claim tags using that offset seems
> pointless.
>=20

CORESIGHT_CLAIMSET is used to determine the number of claimtags available -=
 even if this is 1 or 0. The existence of this register is not proof of the=
 ability to provide enough claim tags to support the protocol we have imple=
mented in the drivers.

> As a result, can we constraint to only two cases as below?
>=20
>   enum coresight_claim_tag_info {
>        CS_CLAIM_TAG_STD_PROTOCOL,
>        CS_CLAIM_TAG_IGNORE,
>   };
>=20
> For CS_CLAIM_TAG_STD_PROTOCOL type, it must pass the validation.
> Otherwise, the claim tag operations will be totally ignored.
>=20

The process is to check the claim tag register on init to determine the num=
ber of claim tags, which is cached in the device structure. We use the defa=
ult 0 enum as not init to allow for the check to be performed only once.=20

After the check is made and we have determine if the 2 bit protocol can be =
followed or not.

If the protocol cannot be followed then the set/clear API will return early=
 and allow the drivers to work correctly on devices not supporting the prot=
ocol

The override enum value is for devices that either implement a register at =
the claimtag locations but it does not operate correctly as a claim tag reg=
ister per spec, or do not implement a valid register at all, which might re=
sult in a read failure. The advanced CTI device from qcom I believe falls i=
nto the former category, but the latter is also a possibility that is cover=
ed by the use case.

> [...]
>=20
> > diff --git a/drivers/hwtracing/coresight/coresight-catu.c
> b/drivers/hwtracing/coresight/coresight-catu.c
> > index 43abe13995cf..d8a0ecc502af 100644
> > --- a/drivers/hwtracing/coresight/coresight-catu.c
> > +++ b/drivers/hwtracing/coresight/coresight-catu.c
> > @@ -574,10 +574,14 @@ static int __catu_probe(struct device *dev, struc=
t
> resource *res)
> >  	catu_desc.subtype.helper_subtype =3D
> CORESIGHT_DEV_SUBTYPE_HELPER_CATU;
> >  	catu_desc.ops =3D &catu_ops;
> >
> > -	coresight_clear_self_claim_tag(&catu_desc.access);
> >  	drvdata->csdev =3D coresight_register(&catu_desc);
> >  	if (IS_ERR(drvdata->csdev))
> >  		ret =3D PTR_ERR(drvdata->csdev);
> > +
> > +	ret =3D coresight_init_claim_tags(drvdata->csdev);
> > +	if (ret)
> > +		coresight_unregister(drvdata->csdev);
> > +
>=20
> coresight_init_claim_tags() is much simpler than coresight_register(),
> this is why we can put coresight_init_claim_tags() before
> coresight_register() to avoid complex rollback operations for claim init
> failure.
>=20

There is no csdev before coresight register - we save the claim tag operati=
onal state in csdev.

> I have no strong opinion for this, as the sequence in this patch should
> can work as well.
>=20
> > +/* helper for checking if claim tag protocol in use */
> > +static bool coresight_using_claim_tag_protocol(struct coresight_device
> *csdev)
> > +{
> > +	return (bool)(csdev->claim_tag_info =3D=3D
> CS_CLAIM_TAG_STD_PROTOCOL);
> > +}
>=20
> Redundant for bool cast?
>=20

Agreed will change

> > +
> > +/* helper to check initialised */
> > +static bool coresight_claim_tag_noinit(struct coresight_device *csdev)
> > +{
> > +	return (bool)(csdev->claim_tag_info =3D=3D CS_CLAIM_TAG_UNKNOWN);
>=20
> Ditto.
>=20
> > +/* cpu bound devices (etms) may need to run on bound cpu */
> > +int coresight_init_claim_tags_cpu_smp(struct coresight_device *csdev, =
int
> cpu)
> > +{
> > +	int ret =3D 0;
> > +	struct cs_claim_tag_init_arg arg =3D { };
> > +
> > +	arg.csdev =3D csdev;
> > +	ret =3D smp_call_function_single(cpu,
> > +				       coresight_init_claim_tags_smp_call,
> > +				       &arg, 1);
> > +
> > +	if (!ret)
> > +		ret =3D arg.rc;
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(coresight_init_claim_tags_cpu_smp);
>=20
> Do we really need a specific SMP call for this? I understand this will
> be used by ETMv3/v4 drivers, can we simply init claim tags in the local
> functions (e.g., etm4_init_arch_data() for ETMv4), same as the current
> implemenation?
>=20

Yes - the purpose here is to avoid having two different APIs to access the =
claim tags, simplifying the driver. Additionally the early access is before=
 the csdev device is created.=20

The intention is to move to a check once and save state without needing mul=
tiple read checks - which is what happened in the previous iterations of th=
is patch set.

Regards

Mike

> Thanks,
> Leo

