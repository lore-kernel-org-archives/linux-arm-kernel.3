Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7577C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 07:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fp6oQj/0xmlDjzT8ekE4T+7ZfpyfnnHm6yufH7rHQqE=; b=rqTk31M5znCQxNoDlMjZiw7nVE
	wSWiMYb+SHmAjQ6miljFb6+S8dQyb5EaxJDcLaT48gt3gS3lc57lrs1/Gq5HK2V9681XcvbFVK2kU
	Uih7mvyY6XKjyZdN6zkrwoP3G4WBaZnb35Azci2v05yw2q5d0jznSVSyeH/lCwrZ/ZId0rhZCflyE
	4h/TQxJYQvMdgLuDwuFmCW0DGmD9PQHMAOOyLFTEbN663pn06/iHw2wLlDT/HxRu+cBoxoNwWBqaU
	jyFVz5qGB+BBXzGNPe3HVh5sMNqGF3yixNarjfkT75yUeIi9keRJtqYlw7S2sVCKDCpog8WIAUEuz
	779Fh7zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8UN-0000000E1mr-1i1d;
	Fri, 11 Jul 2025 07:48:11 +0000
Received: from mail-westeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c201::5] helo=AS8PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8Bv-0000000DyXK-0LFz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:29:08 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Rqvf9q9xKKgXBsX9XvWH7eGOIC9BY+hFoPVeB5D6wWiglfDEofCzZYyyjDNkfCA0Br939BbyNiRPnG97dMi5K2ox1bPm6AaCyXnc7vifZpekA5R6fwZBoqwQaoZKXEXMuqfufwCcpUA8PAXA1Nmo8eA8LtPtLOBg4wcJlxbUi2+wAOv+TLif5JruxgP5WPHYYEeoXO5kSScOVCuxbr+E4kUxHyh8w6Kr9zwvQoaU8gkcHg21A6EtsVX92qrqy64CfgTDiHi76nqJ419i4lDdyGblfgBWZgAx0VzE7h8Pld2ymfI/aLKuH3At/7b/Ry7vdSneGfvB+WBAkKgrUuLqyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fp6oQj/0xmlDjzT8ekE4T+7ZfpyfnnHm6yufH7rHQqE=;
 b=vKFcwrBLRmoFO2uYtImnxqhV3poNu+WiAw8PV4h4B+cP29AzwWupY+q7QcowaOdZeMCP6wv00AKhVCvN2BYu8IbWnRzpKCdzFcDAZJmogKtR4PmjDXdnaRVOHtVXJmRMfsxDEY95xezSueFP6IkyiXbcT8EJuiGWyb/xtfbJJFz0JhJOXtm0AtCEWh77847AX62z6yFhOhtUm1WKTMM6eGepv0wr5GDZMd5wy7SwhNP+xwfA+HXDIuMFtBFykwZC7Zv1voUQNfXrTbUWaf+koyq1n2+E0MrEnA06mBdsHilc7gdWGF+IUBtIP6DZddYk/nBxKUL7DKFD5/C5b0YAAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fp6oQj/0xmlDjzT8ekE4T+7ZfpyfnnHm6yufH7rHQqE=;
 b=KJEejQRkNG91Ed6KF3ClwsYX9lW2p4hRET1cVKIucQa83TCAaoBN1fsLhLIJCI3a3b3PePCc/KtqatMfkF3H4zmbNIfMPjhBjG7iMI2k8goP25o+LxM4MBS0wPyPLBVrrQnXQXpeY3KD2PgX+CLj6kGpR8FwOH/xt/v5wzLPW2M=
Received: from AS4P190CA0041.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::15)
 by AS2PR08MB8901.eurprd08.prod.outlook.com (2603:10a6:20b:5f0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 11 Jul
 2025 07:29:01 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::33) by AS4P190CA0041.outlook.office365.com
 (2603:10a6:20b:5d1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.26 via Frontend Transport; Fri,
 11 Jul 2025 07:29:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22
 via Frontend Transport; Fri, 11 Jul 2025 07:29:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfmyhkkpnhrvPUclgFwvhHNurZSnXrlsk7Mk4XW5HpGH52mc34BLUENsFHRpEUdC1j+sdRbL1a2s8kImPJP/UHizc+nzK2/yzvmv6dtnnJtsW5KNAVB/qZ3uOxD6O1X4UTHzkmhxq0rF9J3Xzx9/2/kmu2kbFr+H5aeVCZerUiQ9dLKAxKIqcIFpzG3O6jL6156erukk21A8S7CZ8aCXRLFBbSWyBBl7Tixpq8OqBJnHO5mH1/23yufYDhaYhtcZvCZY2fkUCHGRZDzDUodK//911zei57rCULJZTbxxtmC8X2Qlx1NnAWYMCSi9/BxHfkqYhzeHRzlKvzQzCYAaqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fp6oQj/0xmlDjzT8ekE4T+7ZfpyfnnHm6yufH7rHQqE=;
 b=riGy2fRJIEruTkr8d/+z8v73hXOw0vbb7XCIs+srQcRtvYXO7DXh5LjvC3D4O4WwrkzFW/K5Ty4UbSkO39yWYo8Bfxgp9c6OJ/OW8bMayMVUpb4kOcLWHzb/oP7djmE+ZicR1Z/YpczwX4qD2ZK2G7fbkYJdRUuMCr91IzKLUv228L+tc41bcPac/Skwlwao3KOEcIKf4Td55joy4b/MObakN52CCa5pJ3XPaq+x+S97eds5wbZ9ESc9b0SWAjQhqNKBRpYZOPhx8xewyetm0QcBgp33C6zXVnEjn32gLV8wDK1anfh06+9yljHUnIML+k9RiUx4f0UDvaFKBMQz8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fp6oQj/0xmlDjzT8ekE4T+7ZfpyfnnHm6yufH7rHQqE=;
 b=KJEejQRkNG91Ed6KF3ClwsYX9lW2p4hRET1cVKIucQa83TCAaoBN1fsLhLIJCI3a3b3PePCc/KtqatMfkF3H4zmbNIfMPjhBjG7iMI2k8goP25o+LxM4MBS0wPyPLBVrrQnXQXpeY3KD2PgX+CLj6kGpR8FwOH/xt/v5wzLPW2M=
Received: from DB9PR08MB6555.eurprd08.prod.outlook.com (2603:10a6:10:257::6)
 by DB9PR08MB9828.eurprd08.prod.outlook.com (2603:10a6:10:45f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 11 Jul
 2025 07:28:26 +0000
Received: from DB9PR08MB6555.eurprd08.prod.outlook.com
 ([fe80::2034:a24a:7524:2101]) by DB9PR08MB6555.eurprd08.prod.outlook.com
 ([fe80::2034:a24a:7524:2101%6]) with mapi id 15.20.8901.028; Fri, 11 Jul 2025
 07:28:26 +0000
From: Tamas Kaman <Tamas.Kaman@arm.com>
To: Mark Rutland <Mark.Rutland@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [boot-wrapper-aarch64 PATCH] Enable GCS if it is present in the
 HW
Thread-Topic: [boot-wrapper-aarch64 PATCH] Enable GCS if it is present in the
 HW
Thread-Index: AQHb7yUt0d4VUEayzkyEnhhXmrD4VbQmmAkAgAYV+oA=
Date: Fri, 11 Jul 2025 07:28:26 +0000
Message-ID: <453E5CBD-06D7-4C1E-94AB-80294032E2D0@arm.com>
References: <20250707095430.3821373-1-tamas.kaman@arm.com>
 <aGu-TFbj2mJ2t7Tf@J2N7QTR9R3>
In-Reply-To: <aGu-TFbj2mJ2t7Tf@J2N7QTR9R3>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.98.25061520
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DB9PR08MB6555:EE_|DB9PR08MB9828:EE_|AM2PEPF0001C708:EE_|AS2PR08MB8901:EE_
X-MS-Office365-Filtering-Correlation-Id: cd18acd0-8817-47a0-7153-08ddc04c9aee
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|38070700018;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?YTFEVEkwb1loUWZDQVBRVVhvcEFUazRMc1hUa1R4MFNScmxHY1dRUDFaSzlF?=
 =?utf-8?B?M0M2UmY0aUUvSHdHalFoajZaTk1PZG1zbWZwNjBFZ2Q4TWVWSE9YbE52b3dh?=
 =?utf-8?B?dXp4YlIwcmdQQVhNNHBUOW1NWnVOSGd2ZVVTakdFalEvc0I3NkhoTlgraU1r?=
 =?utf-8?B?T3l0eVk3QTZ0QXpwQ3ZMaEVSUXRIdVY1Qm4wT3R1bmR2anc5dDhDS05vczc2?=
 =?utf-8?B?TjJ1bkZFV0ZqNzBZRUw0dzI1Y2ZBcWpucjFDT0tjUjFwajdHKzdTbXErOG5n?=
 =?utf-8?B?Ri9yd3I4MThIanJUSmJNSUluUFk0dThlSWFWeEkxSGlQVjBLcE1BV2Q4TlZX?=
 =?utf-8?B?b0pTdEhmQy8yczJaR2tJMzlOYzNwYWt2VkFqOHJDSnJCRlQyS3RrRnJiNVg5?=
 =?utf-8?B?ck92QVRReE45MmtTTmY4THQ3VzZJTHRGTEhFZ2NxeU1jb0N3Q2VteWJJZWZV?=
 =?utf-8?B?OWRKZ3V0aDE3dkdGSGdYS0NHNFVBTHR4T1F6RUd6MXU5cjM0ZGgwRmdsVVBO?=
 =?utf-8?B?Z0dBRnBQR0RpRmJMMTdXWkpQOGNLdVRPWHVBV3pKN05lNjlCTzVndHRBcFFD?=
 =?utf-8?B?d05aR1VjSWxBQ3pia3hVcnFOdVNGYm5jMjlPZnN4bDRSUTVPYVVEdENvbXp3?=
 =?utf-8?B?ME4yVHU0amNmbGtPZGpZc1lrWkhFcnBpTHZITk1vOG43bWhuUkhEbVFGbWYx?=
 =?utf-8?B?Z1V4VGt3TjAyYUczSmREcmg0UStpbkZ5SDZ2Mzd2R0NxYk8rMDh2VEI1Tkcz?=
 =?utf-8?B?RmkxZXBzUGJXWTBUQmxpR0V3ZElscHFjeGlRam5uLy9MZmpXMzg1SWhGWjE2?=
 =?utf-8?B?M2l4T0F4OC9TNkwzZHJhRjRKNXJoVHhyRG1VL0hlbm0vSmZRRzhuS2tWSERn?=
 =?utf-8?B?QTYycXBtKzY3ZU5ocFdmbGhUTzNaOXNVS3FHSEhxZWtad0lhTlF3UGQ5R2w2?=
 =?utf-8?B?T3dJdy9EU2M1Zis2Wm1lM0NKamQ5M3pwVW96SlJDV0Z1Z1gxNncwbEZtTTdr?=
 =?utf-8?B?VHJka3NuTjZxeEZTWGswb1BxQ0xBTkQ1cFNQdjFORWN0dXJFUzJRZkNzRVFw?=
 =?utf-8?B?VWlXZEZUT3YwOEFuWkR6VEsrVjdGWUxhWS9JMk5Hby9MVlhTM0w4Q0c1QnNx?=
 =?utf-8?B?dFlZNThvMVl2WS9vbG1nR2hnUnRtNnJYbjBhTHlxbi9HZ3dOWnFSVnQ5WHZW?=
 =?utf-8?B?UkxHdWtTeG5JUjVPMUdKN29GVkRrQXB6eFdweitsZ1ROVU9FUlNkQ3lvZHNk?=
 =?utf-8?B?OGI3a0RmZVlPVXlTUmgwZjNqMGZQeFlXanVzWUZSeVkyOVVkSjZ1V2lpV2NF?=
 =?utf-8?B?OHV0VWEvTm9QM3ArSVJic1J4Q1F4WXduOHRtY0ZEZTlzcDJndTYzdldWNG9s?=
 =?utf-8?B?K29jMXBLQjEwYlc1WW9aZlNybEV3MWVxWFFncHFYSzYvV1o1ZGVIUTViQjJE?=
 =?utf-8?B?bGZ6VjNKcjZGZXR2OGFrenpvZnZIQ2RPeUk0VVBtdTd5endyWDAyS2N4bmpV?=
 =?utf-8?B?UGNwcjlDNnBhVTVlNWx1cFp0MWNBZHhBa2VIaG9yVWFWNjFZcXNSMHN1VkE4?=
 =?utf-8?B?WCtQZmVNaXVhK3g3U2dDaUFianpRaEwzR0podEd2OUJKS1g5M3ZmckVGWUZC?=
 =?utf-8?B?YVQ5eWNWU3E5TWl4Z3JUODVHbXRsZUc2dmVkKzZUbXRjTGRnVVJwZDJ0d2lY?=
 =?utf-8?B?QW5zUDE3bmUzdW5jbDdZT3I2d3hJQis3N1ZaZHo0RSt3QzJjbUxMZTRmODdt?=
 =?utf-8?B?OU9UWjg4RFFmc1kwZTMzM2U5Vmc4NUFtNTRIU0I4RWRDTnpwQmltYzFyY0to?=
 =?utf-8?B?WEF2WXVxaHovalhzTDFGVjBBK0JEdnpCUHd5ZS85Yk9QZlFiWjBqYTdoNEpm?=
 =?utf-8?B?cW05NVUwNmJGcjVyWTg2TTNqK1d0RHJpZ2R1emtmV2cvVndhMHhEcVhhZHNh?=
 =?utf-8?B?NnJaaEtIcFpsaVRKVW1CZTZoaEV6ZUVyeC80THRHeE80NTNDZGNpcE12ZTR6?=
 =?utf-8?B?KzJtNEU5WnFnPT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6555.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DB8C709EAEC0549AB1DBB2A3C87FB6A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9828
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: de14c490-28f4-4a17-9e08-08ddc04c8695
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|376014|35042699022|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmtzWCt1clc1UnlrRmVZdmxTTkc4ZmxlTW9YR1lRa3RKdHNqWkgzNG9nd1da?=
 =?utf-8?B?UGY0YXRaem9WWXErNGIyczZrOVhCNTNwY3lLRG81UTJ0SU1nOWVLbnJkM2ZL?=
 =?utf-8?B?QmNnN1ZMdWdWSm5NQ2VLRm91VmNLVHBlbG9oL3ZubTZSR21zQzdoa2FjZ2pJ?=
 =?utf-8?B?VVpsb0htSHdQNnY2Q2p5R2g2VjRHNWRQeTY3cWV4YitqWlZVdVFrdUgwWTBa?=
 =?utf-8?B?TURGQXcxZVNBVStvMm1hMGdzVFUxWnNQc1IvQzZBQ0lxTWhBbFpkd2NGVWZy?=
 =?utf-8?B?WkxhQnB3UitrdDBHYlJhV2x5QWxVTE04c3N5anZ2Yy9ibXlxay9jdGgzSVk0?=
 =?utf-8?B?Wk4xdERQeDZDTWhPdjlhMjZ2aG44ZXlsQ0hZT1h3M1VXbDdKelM4TEhaVkhj?=
 =?utf-8?B?MmpJRy9sL1dOVnVOTTNRZStYeVlqNExRVlMvUTNmRVJ5UHpYYkE1dzJOTHU4?=
 =?utf-8?B?ZFlRcnZUaHJ2Ym96Vk5QSjBnVDF0Y2FMaDJiNC9OcjFLb2FFUWlUMGhuQ1Vl?=
 =?utf-8?B?cmRHMXN1Y3k1UnU5aXVuL1k0dlVDbmJFNUJuZkx1Sm42OGNCNzB0QnNyb1ZU?=
 =?utf-8?B?bEhRYXFjQ3plYXdDblRaZEx3WUJ1bW1vRXZmbFRsZEdxZVoveWJnbmtvNm16?=
 =?utf-8?B?TW1Ra2R4SVQyTzg1bE5nNGhCUmM3Tk5HOW5Fc3ViUlNMcm4vREJtaEZTLzgx?=
 =?utf-8?B?c1g5ejVkcHg2TEQrUmhreXc0eC8rRkJjdy9FcStmZ3ZPN0NrWlQ2QUJpWWk5?=
 =?utf-8?B?akxWVzlna2x4V2RYZXJOSVZyV0krK3RhSElFUkNtMUpRZmNka0hOZEppYTh4?=
 =?utf-8?B?dFAwRGhKZXFKKzA4aksrMUlONXZLNTgwU2FFVnlUVnk4bGhNWjdyK2lETmp3?=
 =?utf-8?B?M1hleGpGN3NSWHdUYkk1OUZoN0Z6ZVlPM1RXRk1ydTJZZWovY0Y4VlBmdmZz?=
 =?utf-8?B?a0RKb1RIMm14N1dDM1V1UlBaa2JrUzNyaUdxRFU2RzNYWng2bUVRc1RhTTRk?=
 =?utf-8?B?RzBTVCtOUFVqdUhWQi9IQ2hocUdpd0NSSE5yRzRvci8zQmIxU2RUMzY4RmVC?=
 =?utf-8?B?NEdVZHJKQzgwdG04K05wdjREWHFNZ1lkdGF2Q1dOaFJkNG5SY3JaZDhXNTM0?=
 =?utf-8?B?M1laekM5OVlIQ0czV2RWSnE2QnVqVFp2M2M0cjlhYy9NYmFGUU1JdzduajVT?=
 =?utf-8?B?RlpWbTAwV0h2NlhYVFd6S0ExdVIzS0lYRHlEeVRoNklVdWRkSWpBUHpzVHlx?=
 =?utf-8?B?RnBLTXo2a0pIcm83MXJCcXJwaTZOeWlEVGhVdDRPR2tnMFRabVdJOWZlTGZO?=
 =?utf-8?B?Ni9QUHczR2lRYXdQMk1FODNoamZIREtoOEg2cWxBeGhBQ0F6cGgrMFI1cUNK?=
 =?utf-8?B?ZUFWZDF2c25md1k1djFucHk3VlBxVmt0dlU3NmIzL0J4ZWdDclRoUjErMndZ?=
 =?utf-8?B?TjNGcXVvUE5MN3NpZHlGbjFHRGM2ckRuUGVsei9vZjdNR3BVT0lYWFZ3aE5s?=
 =?utf-8?B?blpNbDhRZ0ZiQUtKWkVCZURqL2h2eFJlWjU2ak9XdjBSRXdxaEdJNWZiQzUx?=
 =?utf-8?B?T2FFVUMyUUNFa2grb3ZhMEJ2STU0K2JKaUJ2UE1FdHRadi9TbFZzTlY0VUhR?=
 =?utf-8?B?eXZkc0c3Rk0zVG5tcUo1V280TmExK2JOVlVmSGNhTjZ2TVdXdnQyUnZ3Rzcv?=
 =?utf-8?B?dERsbUtBUDZiay9BSlF5RjdZaXFpRnlrZkJucDM2OGZIVXJQcDV1dUVxR2ll?=
 =?utf-8?B?TVl1cVlvTThPREVKUndXWHRXZVVpdWJ6WGYrOHBnSDd2Szl2Um84ZGt0VnBk?=
 =?utf-8?B?NXg1dVpWU2dzdWlsRTN2MGFZNWowWkRhbEYxUi8vQ1BwaTBOV3Q2ZTI5YnlU?=
 =?utf-8?B?TFZCaDBJTHRlN1VmYm84ejJBY0UxbHpPSmdNbEc2VThSa1JaU1orWjVXNHc2?=
 =?utf-8?B?MUVKMGk0a0dzWk5UVFU4WnVNUXRrcmNHUkRORU5UWngxUllkNnBhN1JxTDc5?=
 =?utf-8?B?R3Bxb2dKd2JJejFUakpjQTVJclE2RjlBUGNhb0I0VGp5a3Jvc1djSWJqZWFN?=
 =?utf-8?Q?XsYIvJ?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 07:29:00.5449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd18acd0-8817-47a0-7153-08ddc04c9aee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8901
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_002907_277974_8469195E 
X-CRM114-Status: GOOD (  10.77  )
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

SGkgTWFyaw0KIA0KPkZyb206IE1hcmsgUnV0bGFuZCBtYWlsdG86bWFyay5ydXRsYW5kQGFybS5j
b20NCj5EYXRlOiBNb25kYXksIDIwMjUuIEp1bHkgNy4gYXQgMTQ6MzINCj5UbzogVGFtYXMgS2Ft
YW4gbWFpbHRvOlRhbWFzLkthbWFuQGFybS5jb20NCj5DYzogbWFpbHRvOmxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyBtYWlsdG86bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnDQo+U3ViamVjdDogUmU6IFtib290LXdyYXBwZXItYWFyY2g2NCBQQVRDSF0gRW5h
YmxlIEdDUyBpZiBpdCBpcyBwcmVzZW50IGluIHRoZSBIVw0KPkhpIFRhbWFzLA0KPiANCj5Vc3Vh
bGx5IHdlJ2QgaGF2ZSBhIGNvbW1pdCBsb2cgaGVyZSwgbWVudGlvbmluZyBhbmQgZG9jdW1lbnRz
IHJlZmVyZW5jZWQNCj4oZS5nLiBBUk0gQVJNLCBib290aW5nLnJzdCksIGFuZCBhbnkgaW50ZXJk
ZXBlbmRlbmNpZXMgKGUuZy4gIG90aGVyDQo+ZmVhdHVyZXMgdGhhdCBtaWdodCBuZWVkIHRvIGJl
IGVuYWJsZWQgZmlyc3QpLg0KIA0KU3VyZSwgSSBhZGRlZCBzb21lIG1vcmUgZGV0YWlscyBhbmQg
cmVmZXJlbmNlIHRvIEFSTSBBUk0NCiANCj4gDQo+T24gTW9uLCBKdWwgMDcsIDIwMjUgYXQgMTE6
NTQ6MzBBTSArMDIwMCwgVGFtYXMgS2FtYW4gd3JvdGU6DQo+PiBTaWduZWQtb2ZmLWJ5OiBUYW1h
cyBLYW1hbiBtYWlsdG86dGFtYXMua2FtYW5AYXJtLmNvbQ0KPj4gLS0tDQo+PiAgYXJjaC9hYXJj
aDY0L2luY2x1ZGUvYXNtL2NwdS5oIHwgNSArKysrKw0KPj4gIGFyY2gvYWFyY2g2NC9pbml0LmMg
ICAgICAgICAgICB8IDcgKysrKysrKw0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9u
cygrKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hYXJjaDY0L2luY2x1ZGUvYXNtL2NwdS5o
IGIvYXJjaC9hYXJjaDY0L2luY2x1ZGUvYXNtL2NwdS5oDQo+PiBpbmRleCBhYzUwNDc0Li45ZDZm
MGZjIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9hYXJjaDY0L2luY2x1ZGUvYXNtL2NwdS5oDQo+PiAr
KysgYi9hcmNoL2FhcmNoNjQvaW5jbHVkZS9hc20vY3B1LmgNCj4+IEBAIC03MCw2ICs3MCw3IEBA
DQo+PiAgI2RlZmluZSBTQ1JfRUwzX0VDVkVOICAgICAgICAgICAgICAgICAgICAgICAgQklUKDI4
KQ0KPj4gICNkZWZpbmUgU0NSX0VMM19UTUUgICAgICAgICAgICAgICAgICBCSVQoMzQpDQo+PiAg
I2RlZmluZSBTQ1JfRUwzX0hYRW4gICAgICAgICAgICAgICAgIEJJVCgzOCkNCj4+ICsjZGVmaW5l
IFNDUl9FTDNfR0NTRW4gICAgICAgICAgICAgICAgICAgICAgICBCSVQoMzkpDQo+PiAgI2RlZmlu
ZSBTQ1JfRUwzX0VuVFAyICAgICAgICAgICAgICAgICAgICAgICAgQklUKDQxKQ0KPj4gICNkZWZp
bmUgU0NSX0VMM19SQ1dNQVNLRW4gICAgICAgICAgICBCSVQoNDIpDQo+PiAgI2RlZmluZSBTQ1Jf
RUwzX1RDUjJFTiAgICAgICAgICAgICAgICAgICAgICAgQklUKDQzKQ0KPj4gQEAgLTEyNSw2ICsx
MjYsNyBAQA0KPj4gICNkZWZpbmUgSURfQUE2NFBGUjFfRUwxX01URSAgICAgICAgICBCSVRTKDEx
LCA4KQ0KPj4gICNkZWZpbmUgSURfQUE2NFBGUjFfRUwxX1NNRSAgICAgICAgICBCSVRTKDI3LCAy
NCkNCj4+ICAjZGVmaW5lIElEX0FBNjRQRlIxX0VMMV9DU1YyX2ZyYWMgICAgQklUUygzNSwgMzIp
DQo+PiArI2RlZmluZSBJRF9BQTY0UEZSMV9FTDFfR0NTICAgICAgICAgIEJJVFMoNDcsIDQ0KQ0K
PiANCj4gDQo+VGhlIHR3byBuZXcgZGVmaW5pdGlvbnMgYWJvdmUgbG9vayByaWdodCB0byBtZSBw
ZXIgQVJNIERESSAwNDg3IEwuYQ0KPnNlY3Rpb25zIEQyNC4yLjE2MyBhbmQgRDI0LjIuODguDQo+
IA0KPj4gICNkZWZpbmUgSURfQUE2NFBGUjFfRUwxX1RIRSAgICAgICAgICBCSVRTKDUxLCA0OCkN
Cj4+ICANCj4+ICAjZGVmaW5lIElEX0FBNjRQRlIyX0VMMSAgICAgICAgICAgICAgICAgICAgICBz
M18wX2MwX2M0XzINCj4+IEBAIC0xMzMsNiArMTM1LDkgQEANCj4+ICAjZGVmaW5lIElEX0FBNjRT
TUZSMF9FTDEgICAgICAgICAgICAgczNfMF9jMF9jNF81DQo+PiAgI2RlZmluZSBJRF9BQTY0U01G
UjBfRUwxX0ZBNjQgICAgICAgICAgICAgICAgQklUKDYzKQ0KPj4gIA0KPj4gKyNkZWZpbmUgSENS
WF9FTDIgICAgICAgICAgICAgICAgICAgICBzM180X2MxX2MyXzINCj4+ICsjZGVmaW5lIEhDUlhf
RUwyX0dDU0VuICAgICAgICAgICAgICAgICAgICAgICBCSVQoMjIpDQo+IA0KPlRoaXMgbG9va3Mg
YSBiaXQgc3VzcGljaW91cywgZ2l2ZW4gaXQgd2Fzbid0IG1lbnRpb25lZCBlYXJsaWVyLCBhbmQN
Cj5naXZlbiB3ZSBkb24ndCBwb2tlIHRoaXMgZm9yIGFueXRoaWduIGVsc2Ugc28gZmFyLg0KPiAN
Cj5Nb3JlIG9uIHRoYXQgYmVsb3cuDQo+IA0KPj4gKw0KPj4gIC8qDQo+PiAgICogSW5pdGlhbCBy
ZWdpc3RlciB2YWx1ZXMgcmVxdWlyZWQgZm9yIHRoZSBib290LXdyYXBwZXIgdG8gcnVuIG91dC1v
Zi1yZXNldC4NCj4+ICAgKi8NCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FhcmNoNjQvaW5pdC5jIGIv
YXJjaC9hYXJjaDY0L2luaXQuYw0KPj4gaW5kZXggY2IyNGY0ZS4uZjgxNWU2YSAxMDA2NDQNCj4+
IC0tLSBhL2FyY2gvYWFyY2g2NC9pbml0LmMNCj4+ICsrKyBiL2FyY2gvYWFyY2g2NC9pbml0LmMN
Cj4+IEBAIC0xMTgsNiArMTE4LDEzIEBAIHN0YXRpYyB2b2lkIGNwdV9pbml0X2VsMyh2b2lkKQ0K
Pj4gICAgICAgIGlmIChtcnNfZmllbGQoSURfQUE2NFBGUjFfRUwxLCBNVEUpID49IDIpDQo+PiAg
ICAgICAgICAgICAgICBzY3IgfD0gU0NSX0VMM19BVEE7DQo+PiAgDQo+PiArICAgICBpZiAobXJz
X2ZpZWxkKElEX0FBNjRQRlIxX0VMMSwgR0NTKSkgew0KPj4gKyAgICAgICAgICAgICBzY3IgfD0g
U0NSX0VMM19HQ1NFbjsNCj4+ICsgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBoY3J4X2VsMiA9
IG1ycyhIQ1JYX0VMMik7DQo+PiArICAgICAgICAgICAgIGhjcnhfZWwyIHw9IEhDUlhfRUwyX0dD
U0VuOw0KPj4gKyAgICAgICAgICAgICBtc3IoSENSWF9FTDIsIGhjcnhfZWwyKTsNCj4+ICsgICAg
IH0NCj4gDQo+QXMgYSBnZW5lcmFsIHBvbGljeSwgdGhlIGJvb3Qgd3JhcHBlciBhdm9pZHMgUk1X
IHNlcXVlbmNlcywgYW5kDQo+aW5pdGlhbGl6ZXMgYWxsIGJpdHMgaW4gcmVnaXN0ZXJzIHRvIHNw
ZWNpZmljIHZhbHVlcywgc28gdGhpcyBkb2Vzbid0DQo+bG9vayByaWdodC4NCj4gDQo+V2UgZ2Vu
cmVhbGx5IGZvbGxvdyBhIHBhdHRlcm4gb2YgYWNjdW11bGF0aW5nIGNvbnRyb2wgYml0cyB3aXRo
IGEgZmluYWwNCj53cml0ZSwgZS5nLg0KPiANCj4gICAgICAgIHVuc2lnbmVkIGxvbmcgY3RybF94
ID0gREVGQVVMVF9WQUxVRV9YOw0KPiANCj4gICAgICAgIGlmIChmZWF0dXRlX2V4aXN0cyhhKSkg
ew0KPiAgICAgICAgICAgICAgICBjdHJsX3ggfD0gQ1RSTF9YX0VOQUJMRV9BOw0KPiAgICAgICAg
ICAgICAgICAuLi4NCj4gICAgICAgIH0NCj4gICAgICAgIC4uLg0KPiAgICAgICAgaWYgKGZlYXR1
cmVfZXhpc3RzKGIpKSB7DQo+ICAgICAgICAgICAgICAgIGN0cmxfeCB8PSBDVFJMX1hfRU5BQkxF
X0I7DQo+ICAgICAgICAgICAgICAgIC4uLg0KPiAgICAgICAgfQ0KPiAgICAgICAgLi4uDQo+ICAg
ICAgICBtc3IoY3RybF94X2VsMywgY3RybF94KTsNCj4gDQo+Li4uIGJ1dCBmb3IgSENSWF9FTDIs
IHdlIGhhdmVuJ3QgZG9uZSB0aGF0IGZvciBhbnkgb3RoZXIgZmVhdHVyZXMgKGUuZy4NCj5GUE1S
LCBNT1BTKS4gRWl0aGVyIHRoYXQncyBhIGxhdGVudCBidWcsIG9yICB3ZSBkb24ndCBuZWVkIHRv
IGluaXRpYWxpemUNCj5IQ1JYX0VMMiBoZXJlLg0KPiANCj5DYW4geW91IGRlc2NyaWJlIHdoeSB5
b3UncmUgaW5pdGlhbGl6aW5nIEhDUnhfRUwyLkdDU0VuPyBlLmcuIGFyZSB5b3UNCj50cnlpbmcg
dG8gYm9vdCBhIGtlcm5lbCBhdCBFTDE/DQo+IA0KPlRoYW5rcywNCj5NYXJrLg0KIA0KSSBtYWRl
IHRoaXMgcGF0Y2ggYSBsb25nIHRpbWUgYWdvLCB3aGVuIHRoZSBHQ1Mga2VybmVsIGNvZGUgd2Fz
IHN0aWxsIGluIGRldmVsb3BtZW50LCBJIGp1c3QgZGlkIG5vdCB1cHN0cmVhbSB0aGUgcGF0Y2gg
YXQgdGhhdCB0aW1lLg0KTm93IEkgY2Fu4oCZdCByZW1lbWJlciBleGFjdGx5IHdoeSBJIGFkZGVk
IHNldHRpbmcgdGhhdCBiaXQgaW4gSENSeF9FTDIgcmVnaXN0ZXIgYnV0IEkgYW0gc3VyZSBpdCBo
YWQgaXRzIHJlYXNvbi4NCkFueXdheSwgSSBjaGVja2VkIGFuZCBBbmRyb2lkIGJvb3RzIHdpdGhv
dXQgdGhpcyBiaXQsIG15IHRlc3RzIHBhc3MsIHNvIEkgcmVtb3ZlZCB0aGF0IHBhcnQuDQpUaGFu
a3MgZm9yIHNwb3R0aW5nIHRoaXMuDQogDQo+IA0KPj4gKw0KPj4gICAgICAgIGlmICgha2VybmVs
X2lzXzMyYml0KCkpDQo+PiAgICAgICAgICAgICAgICBzY3IgfD0gU0NSX0VMM19SVzsNCj4+ICAN
Cj4+IC0tIA0KPj4gMi4zNC4xDQo+PiANCj4gDQogDQpUaGFua3MsDQpUYW1hcw0KDQoNCg==

