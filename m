Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C958D58D7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 18:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+PyKJi+aTy+Alx3BxS1pS1wtn4JbZn6q8rhoZVTqyA=; b=OY8i/kN5x3NcinpMvDC2Jd0gsj
	xuYKHIQQKUfy1yvsye26vA5CHgCI4KK2V/xjhJYJYc0d18Q384Rk44kEixGwy3GycLy7yWI22LHo7
	RXRE/V/TuPfFxGxRaUdT/ftxNJsaqjzDSse7Vb+fzhIvP/a5JT1fvWCvjLL8uojOmHS/zUoFpg8k4
	mvOnNXjOMf/cVO1nQX5bF+3lfEfQ/a3/6AcGzc+5NveRMPDe22EN28wgYeGdCGVjAgOY1QMpeqlNs
	mVgtzc12vwNPYK7L4wf4eSmhewCJde46SEXkNMY4Kygx1KDXGY20fauXwFt12BSewS14Wx3sM1nWE
	L+rhBwCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFe8x-00000008u6Z-1mLf;
	Mon, 25 Nov 2024 18:49:07 +0000
Received: from mail-dbaeur03on20631.outbound.protection.outlook.com ([2a01:111:f403:260d::631] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFe7w-00000008tty-12JH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 18:48:05 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZkTp6gAsJenWK7jKGr3gyXt+tusYtPPqA7ZChhFu5VptV2psmcfTAB9FTKGZGirgekk8Nq0imEFsNqDeiJFFeB/GL4jC7kkzd611MlQZ2pzPWXSC28RfQy51XnR6sckMI9How0dqsKVER9p5bTXgDG+L/47qKV1h+ZZjhbWiqXkCWZA7DifwARhthZHGiE89wdJbHTz58QuJXYzEnTzTZFQ9jlqr6MKgvU98ipPhIr4BGD6Ca6Q5S8DiWmdLqpaaZ/s2SatDWJo1McYtgJnvsvcAKTcILFL21s+5Yy3+Ma6cMjhm5UkiK/vrLjglNEJjvE8RPFmg5tK4DMAdRJl/qQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+PyKJi+aTy+Alx3BxS1pS1wtn4JbZn6q8rhoZVTqyA=;
 b=PKCiTL3jxVTyksBbT2QKaYB+296+PSDS1p8UT8mLNQnMggWQoy39E7lvqNf8Vb2XZIrnhZCpBRK72EG5FyLr6PofqubAN9AhGvKbTXgowJyUQY5FFyelWVUpWZASRC5BJ+79ImbTrbY5CZZisf0U2AqF2t8NuFd3Muq0B/7uBVQo1RH5JKzlIVzB7trDHubPq2G0kUxZ2QkFxkwiYAD9Fl1W8k4+9vxjTgYzPhpryL0Zz4ZelWmbR4yNP+83yOF49uDWU+8mguTP1B0LxGSmOg8kBAJh3C/6c6kpFmsstY3DdAnC0z8U0pohLZBg3QbDqJjXJIWDYytgIadjYthEtA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+PyKJi+aTy+Alx3BxS1pS1wtn4JbZn6q8rhoZVTqyA=;
 b=UUen3gmoNxQnAVRVrd1wTmwcjhLRB4LMvL+uUtiSY/bNW/3MblAxF9AJKL7+rkKasbhRdB8mkuli8gp6cCtKFqvsE+jyvqBiDQesI7MehVFb5p1bwvHLy6/kvVHBAV+auMdn1D9qLvuHbPZlJLQElHRNPrka8iI1kNfJ8gZkt18=
Received: from AS4P192CA0043.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::9)
 by PA4PR08MB5949.eurprd08.prod.outlook.com (2603:10a6:102:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 18:47:56 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:20b:658:cafe::20) by AS4P192CA0043.outlook.office365.com
 (2603:10a6:20b:658::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Mon,
 25 Nov 2024 18:47:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Mon, 25 Nov 2024 18:47:56 +0000
Received: ("Tessian outbound d013e61db77e:v490"); Mon, 25 Nov 2024 18:47:55 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5680d3a1c8097d7f
X-TessianGatewayMetadata: zTFRKwTlBNpvI6vADNslsTZRf8gDwQS8StOpmV0mqlUFFycGB5hH+0TlLRNcTQtC2qQvteZMbLbQb5lF4kUT/uv0rTVwji1brfCGItJu8DDG7RKFQQ+4+yvulpJqI028ps9T8cW7D8f98ukqZrfxDw==
X-CR-MTA-TID: 64aa7808
Received: from L12b98ffba7f3.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BD128D3F-9A23-4011-88FB-B7E019F66716.1;
	Mon, 25 Nov 2024 18:47:44 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L12b98ffba7f3.2
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 25 Nov 2024 18:47:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A5pBBgi8z/2/AbsAn6ZvRHQNMgbVgPf6thdtqbd6rOzkNAspx/5xH1ARgXRsJS+d4uoloiAe86LSvWq/j7z43jVcK00Ls6YW4HpOAyB+JWF60UL9ndoLZG9ITqbPKlFkH9mYqcvq7xGm65ZyvxEzq22M3cfyFe36EVTC8p+7LrKwhZ1m3b0SHosSSu1F9CU7JSGDjkwvFzfQ9BNV6PeqGqsrAf76QEF+3dGBDRtEMR3fsUpeWaSR19EVl70+ALoWPEt57iLDXJ9xSYVG8WZqR8Tx12tqSn9hxWBeA19ePKQc6qzp/SCC2x95C4+qCs7QRAiPD0nKPH+asrjOid/lrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+PyKJi+aTy+Alx3BxS1pS1wtn4JbZn6q8rhoZVTqyA=;
 b=gxBzFhrQHyUPZ9Za/jF+xtSW5GLLp0IAHlyAdV8GEe2bb7mp0IuJ2keHXGRaCQVLgIY8FxJ2btSe+xkVgCE69uXR+o56fQHGnTCekqlSL7Vo+DS+EdHA/5MMiMvSFoCCbm0HOSeUQYCKhEXAgDMxb0mqYSI0g52HPyPocBtGZI6TkXJ1/VhvJ0r+CtraS3m38qc81o6cubyKYAEANZROK4YNynkp5RLJYYKdlHwP9Qpo4vCawX79f5Y5E4UzY8Qi4/ertvl1488CDrPYEYLmrdzHOSV/Qs8AsWXtCzyU30A/OHpoWzwVdBk0SesqjMlTcaAgKr3roMLCQ/ExWM/ACw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+PyKJi+aTy+Alx3BxS1pS1wtn4JbZn6q8rhoZVTqyA=;
 b=UUen3gmoNxQnAVRVrd1wTmwcjhLRB4LMvL+uUtiSY/bNW/3MblAxF9AJKL7+rkKasbhRdB8mkuli8gp6cCtKFqvsE+jyvqBiDQesI7MehVFb5p1bwvHLy6/kvVHBAV+auMdn1D9qLvuHbPZlJLQElHRNPrka8iI1kNfJ8gZkt18=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS2PR08MB8670.eurprd08.prod.outlook.com
 (2603:10a6:20b:55d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 18:47:41 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 18:47:41 +0000
Date: Mon, 25 Nov 2024 18:47:39 +0000
From: Levi Yun <yeoreum.yun@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: broonie@kernel.org, sami.mujawar@arm.com, sudeep.holla@arm.com,
	pierre.gondois@arm.com, hagarhem@amazon.com,
	catalin.marinas@arm.com, will@kernel.org, guohanjun@huawei.com,
	Jonathan.Cameron@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org
Subject: Re: [PATCH v2 2/2] efi/fdt: ignore dtb when acpi option is used with
 force
Message-ID: <Z0TGS+EA8JlO3WXq@e129823.arm.com>
References: <20241125170758.518943-1-yeoreum.yun@arm.com>
 <20241125170758.518943-3-yeoreum.yun@arm.com>
 <CAMj1kXG4A4h3=bZC6kSrwsZa7p4RZ-uN5N67pZUFLOQ2RJE64w@mail.gmail.com>
 <Z0S3wiugr0JML/cV@e129823.arm.com>
 <CAMj1kXFOdGaYiVWOyFEK+Lz97YdzAu+AWj5trZBTL+Xc_DXnmA@mail.gmail.com>
 <Z0S+zP3u4781zNwo@e129823.arm.com>
 <CAMj1kXHysummq5dG==gOmQr2DgtU5Ee0_tJbjGagRJniAee1vA@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHysummq5dG==gOmQr2DgtU5Ee0_tJbjGagRJniAee1vA@mail.gmail.com>
X-ClientProxiedBy: LO4P265CA0186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::13) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AS2PR08MB8670:EE_|AM2PEPF0001C708:EE_|PA4PR08MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f055fdf-7c97-44be-79a5-08dd0d81ad14
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?x4GB4MiWrPYGZIn4NeN14jxirAF9kGNGCEWETVphABs9FiwyMJz7jlVbNp6f?=
 =?us-ascii?Q?lbwSr0MaILNWeoJobRE5OJPyaKnHA8bWYBDb5adOdu4/Kj4kEqIOK9AF39I4?=
 =?us-ascii?Q?PzgP8bPC+Vv+4l7IjzjJWZli9jis5S9ZRilOGjKoDwJdA8SXFsCD+IELwZ82?=
 =?us-ascii?Q?SNMlIb4KTuXvXeOViyYugCtemYUA3UGb/TQ5/SoPKl2rXTU1WQsHxTJ5O/N0?=
 =?us-ascii?Q?Q+EH21HE2Ja4D8lh7jYkvbGAOSYJfI37h78E9d7vPgAhEjE57bEKn21f4yme?=
 =?us-ascii?Q?odrrpuK+zG2jN7g7R6/3kST/DuazH9jjbOTOoVG1MTvQScUHUQCc3WLsImin?=
 =?us-ascii?Q?obrBTR/dAr98ztNV7SJumFgpG2nkXoDpyue4U6eHB2CTo+R6hKGC1YfNlLQZ?=
 =?us-ascii?Q?xz2nozXbkoKSrId0+fCbXRYmJY8umffixboCKEEof2aCI1Ytiv1hDY4SzsXW?=
 =?us-ascii?Q?qWMFoZDj+1RI3673K2kAJ6KzTNg3Fr8ePxOPFDE7UZgD3jwuMdvYaUg9JrMI?=
 =?us-ascii?Q?j9vT/31EXYPno1VqE1MPMLzQ9YyGzagiXxj5EEEOMZKorJYQQNtezxq3zKhB?=
 =?us-ascii?Q?DlUjRHxinT4yA/5G0U41sKbaP3P5oAHySdNhhaKVKwr7BIkGk4t/Io1KkyyY?=
 =?us-ascii?Q?JM6ZHieBl22VZLdC/qcVz1E36W/46KkuyuqCOxPk/fc9qfqrNxEH4FxOrrK1?=
 =?us-ascii?Q?APqLSnKNNeGHkudb2ZPlZGBtYegbTLWIMAcH8hkQfPM5F/B0sy2TRkdBA0XI?=
 =?us-ascii?Q?tJixS4S2F1bhgQoyGIQ9iffBiichJaxXjds4O7VM6u454cmifRJjUkwLnpAR?=
 =?us-ascii?Q?Hl/LJGaknNe5l8RGw9lK5oCohwJGRyCfUTKYWkCRETLOETV7n7UnAWEaOAet?=
 =?us-ascii?Q?00EppJct/TGCFroBApvMzZvdtmTq6JUsgPndmhapjoDT8SCnEK/6ZIEofIrT?=
 =?us-ascii?Q?qrYAhdnYfEe4pE4xwzU/RS6LzyHT9XhHyiwcZa5eN+Pnnka/yaATYYSuFPD+?=
 =?us-ascii?Q?XRcdMadxSjV+JhvOJtdezOQiKZ0Le8RXv0mKM9K8oAhz0DKVjgxLnxjy34uu?=
 =?us-ascii?Q?3nsgvYBVTdiqgDuGbfo8XXQPntkutj6cy6P/UDzj2hNnSeMGrl+qbyih2dAW?=
 =?us-ascii?Q?ZF3URXSd3DFAO3ZKaIANIsRijjfYM57hfaIjW2NxxSRy/OJM5ses+SK+Cn4N?=
 =?us-ascii?Q?rnAls7eQ/bamJw5HR2Pe83BOapI8f6jU+2db/PKIIIAz1dmnknu1aR7UTkVg?=
 =?us-ascii?Q?2nw1m7gpysus7p4Z7FI8zWafB/D4K7v5+o9w3niJNzPz+IQT4yyxc4fY1SHn?=
 =?us-ascii?Q?hZEUNswhgcn8+E1dYwhPGY4y/hI1aHgI3gYRGG8agPF1nA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8670
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:150:163::20];domain=GV1PR08MB10521.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7d3d4ec7-78b9-4235-e772-08dd0d81a424
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|14060799003|36860700013|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5ZVhjj3XclPvOnQOzsETE17iAjr4DXysQKkjKXokhjqkVEWXVFfKbBRFWerG?=
 =?us-ascii?Q?OJgriapG/lz0tpHD/Q9Wl6K2iVToenKmBeqH7F4vURJ4r95PFHf+ZO5c4LmJ?=
 =?us-ascii?Q?be5SAly/W5aXd6cg07OuvaEbOQrQsWnwgy7IyuBmVli6I2PKFT3ISelRkulH?=
 =?us-ascii?Q?xs9gY8K4OeD5kcm3AcFe57GBxRhXjVkyf+PDRjyhGSz8R3L8KwL29eL1/jWd?=
 =?us-ascii?Q?LKximJOpdd0YPvZfIicnCe7+MEkyOBiQCCzpR0wCFrPYQoSZLVUzUhsPxOQI?=
 =?us-ascii?Q?gtVa8wrEBiIq2IhW5Ag3dupa+M4AUHUHjcfhWDDWEo2TQEJeZEhYrohfn+In?=
 =?us-ascii?Q?lbUlegBb8HPMiNRLhyZ25zRkt8P4FH0e1srHPm9zkBDPcMT8bh+K2/PgZJUu?=
 =?us-ascii?Q?UBoy+DYgvpje1TCHEOjorOwD8JDwLgWeOrO7L/WhO2x6T2IhxYImo7BH6h8I?=
 =?us-ascii?Q?C7A+Dd/c5T8/iPFE/tPA7M9VLwny/fDlcmDpXCzB1ZZ4Uti3kj1DDOAW5ikt?=
 =?us-ascii?Q?rzsrF98OwQtxPlu5K2pxgJbeIlT9d3BgNgW00fnIa3I4jzvImRMv+51Dy3+T?=
 =?us-ascii?Q?Uzq95soQJGkxMzs2tWI5h3XxqVdTEF4y2obNLCEoCWTLmjckQFgcEfNUoPNq?=
 =?us-ascii?Q?3DAiOGkWkofE0z5D5QbT1COSYCQyWQwyVKZFkgJ3mNa6EqX2QM9/XByNZnuD?=
 =?us-ascii?Q?A0rbWOV8yAbng72WtG9FyTG3ka8FS2vHom21Vdyuga5vfFgmb9mchn/WtHOz?=
 =?us-ascii?Q?QZeEGbrNAZTb/m6WGZEPpu1rs+riCNBb6h7ASPDaqdPZLcN6CWCNtaw16MdU?=
 =?us-ascii?Q?RadrMM4kj5ZsTwiKmlDLrq9/2cb97oAWTZ82l1rMkmiuHjJNg8GXtZeuduik?=
 =?us-ascii?Q?Gsy1e9Y1vDU99286z3Wzu1YhERrs/AxuE8J6jdPvQHN5gHWB7b1DZTFellAl?=
 =?us-ascii?Q?eTUnIAeySn04sI1URieMtETvFu/N/nc7deIRfcTlVTjIiF5phurzxOE36Qyy?=
 =?us-ascii?Q?U+0LXiD9SJyJ1ANgMuuJKNnUEQ8wyVtBKHLbRzz2YsRjI70JttdsiM/Il/33?=
 =?us-ascii?Q?QgERO6f65au9g9KSL3R5MBNN+01ePS1zPH6Y0BDsHVdzoCtFtDOfTYnqyw68?=
 =?us-ascii?Q?LMdggqa6agmWkVdXQnrKMgtxPOQikpcVkMsYc5DyvVSvlHMfHcOX8pMOww0y?=
 =?us-ascii?Q?anCxCvlkrZC5pcxs1ofJHobmWA69Jc/MSGPlhmU3XLDSOzdLtAbJL5jicOhj?=
 =?us-ascii?Q?hRIlwYquz2ANUEueTHZvixtCOpPex0CRdXM6e3HtvmKwQlrJy/vFj9b/slgR?=
 =?us-ascii?Q?iUy5ooS6nTkFweve9wfYX1iggIbODSLSDi76wUCGsfj4G7I3K0vntRALKuNJ?=
 =?us-ascii?Q?Z4Eo+zC57EUc06t34fxSZ4coSIqGXh4vsvGnRYuZ9f2lVpDQFipLynUIF2g4?=
 =?us-ascii?Q?5vsnG6h72pPenCSrne1bGxPW3JvkmNzv?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 18:47:56.1752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f055fdf-7c97-44be-79a5-08dd0d81ad14
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5949
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_104804_296043_A1340F9D 
X-CRM114-Status: GOOD (  11.92  )
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

Hi Ard,

> Thanks for explaining the issue in more detail. Juno is a development
> platform with a highly unusual boot stack so I don't think we need to
> accommodate its quirks in the upstream kernel.
>
> And I still don't think this is something worth fixing in general.
> Even if the machine description should be taken from ACPI tables only,
> the DT /chosen node is always used as a conduit by the EFI stub, and
> there are cases, e.g., for initrd info or the kaslr seed, where this
> information might come from the bootloader, such as older GRUB builds.

But suppose the DT loaded is corrupted (i.e.) no property for
"#size-cells" in root node.
In this case, uefi properties in chosen node will be installed in
"corrupted" root node.

my suggetion is not to check "acpi=force" option but verify dt which
loaded via dtb= command line option or
via configuration table in efi-stub code before updating
fdt with uefi properties in chosen node so that prevent generating error
message.

Am I missing?

Thanks

