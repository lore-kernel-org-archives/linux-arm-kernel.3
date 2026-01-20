Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49002D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 11:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNOPyStpT/8zwNjz/8ZakGbmV6jSnATYswY7QKUMJr4=; b=T498Rx/phEH7mXdfdKiinahvs9
	J6Yll4NPFbL/5HECVDEpCvlWNzZcNz3ffZpyWPcpf1HSHqhP/PnYioy9GNXSmZswPmfl1u6tyJj52
	zN9nk+0k3cqT+hMBdDRvwzGrMEeASUWmC1N+v6hPI/JOORLfKvNmayxr1bnQ8J9MYdId/UEvfCRD5
	yB+15ThvDJGw/uF9q0b4mvkxviWeqzosYCpA8KsKyV2NOu4Ks0q668S3hKQHywq9aLQtCUxBNK2Bx
	l/wOGY5zgSevlL9gfYXkvGsrq/xFcB3wCYhMfhgI9nTxcOvhTNqm8rDJ0A/SUHGbfZSN2wekuUfom
	uJys3Ehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9UO-00000003fUy-0QBv;
	Tue, 20 Jan 2026 11:01:36 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9UK-00000003fU0-47lB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 11:01:34 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BSAFK25IVSYnfWda2IDtOG329wXXTgTFBxwrMKniJZsVs9YslAqwlYKHkou7Iv0DavaBTf4ZW9fWOj3gD3xjSZgquUz3QlpmhFyaX75SohAPMZ5AqlRgDcgFjGoLLFF16au+2RjIhD6B2Nt6L+9NEr3uEo1oyjPl9M7ZZmGWruy2cRM0thdR03M+J0LwSctskA3M2bbHfaRail/BPWfnnrwNlNO3FdwrFRPZ5Z3VTaAkInZkQZiItpvJjL4MakBffROysMKfdr7ef/RxL+saoJ25m9EWHLhjcWP7NJLt3Xyk8PvaKqZgVvZF1/SoC/2XJ7Au8/U0UP9FfxrS9dVH4g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNOPyStpT/8zwNjz/8ZakGbmV6jSnATYswY7QKUMJr4=;
 b=csKql3MecuR8xhEzyXO5BzNIBBpcRrQMCFWMqeE/7lGUQpzrX274w/L7xT11hib2Ck8n+wTXEn5krcHURB5LcN5uPkJwBLZEJsnfjUSdD45I65R9pB+IJ2Hr4jaizdPpVfboXBTP4BskbVTmAqc5ifRZsUizQeSC6ZM3Ab9xYdZAJNeTile13n9RhVquvxyoecSzMZbuGiQrgfdEVtsYhSVp+Gk1pOKuVhjny6ZMZ57gXwyFwDEmvCekEEj94QJdOxzFbIIBYXvwZuEDPgJnc4iH+tGabjzTrsFotwnQvfzsyOwpEDrXSydVA2xJBYPbps0z2npghFq/NxJj+l1xYg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-oundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNOPyStpT/8zwNjz/8ZakGbmV6jSnATYswY7QKUMJr4=;
 b=bevnnqreSoJP6x5yYk+uf4OOPV4OLHJlOzAYm7bHyTAueORhS6mEw5zjcvZVBmj+bar5YL5APyBSGX7+J6LkofKqUZGX5VeCuQlKLEB8qevC9/vdz7RbtKEAO8G4qa2QvTlukWzfL8JXeo0bLXlUog6nlxgjsWA1g0aMxv0z/co=
Received: from AM0PR02CA0180.eurprd02.prod.outlook.com (2603:10a6:20b:28e::17)
 by DB9PR08MB11338.eurprd08.prod.outlook.com (2603:10a6:10:60c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 11:01:28 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:20b:28e:cafe::88) by AM0PR02CA0180.outlook.office365.com
 (2603:10a6:20b:28e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Tue,
 20 Jan 2026 11:01:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Tue, 20 Jan 2026 11:01:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMR9oM+B0PUr1lBhP4ZT7YPz3xE7IYlxGIPImKRQDc+ThJ1c5FXGxGjTOch9X91MPtdomw++/vqtt3TiT/m44eiY+3eeHCoip4G0lF8o85XHHZkjqWRPfFD4UCBsf+Sdo7CGv85h5HjEpB49hrpZ92g64JidfKGr4mjgLRbS7lEc4U1kkxq//znk57A/WcN0YgBWE+0eNCSKKlG04wQczKYR9LPQtOX2A2ErUYaE9CXw19rnSmDv7u1Gdq458zVwwCFYUkuiPBJZU9qOxyLY+ZmTbIDRMPQuEEhL2tkllTshOq7XmKHOzgbqFQcLbP33ZcPflvHgwWyLHK+HnshZFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNOPyStpT/8zwNjz/8ZakGbmV6jSnATYswY7QKUMJr4=;
 b=FncuIuEBWegSjsHGn0NYEM1fy0ml6ULwSA+0gkRvFcMDGFlF8zRtu+7orvcTTRx8S36X4+ybGENmjDn8LX97vF87UG24vFrulXxPOG5hTPhGShEzxuPpP8ACYGat/Jx1ogUQgpVfFAA7uDhc0Jv/3M2V//zRPT08Nn0qbR0LBOqfbOhSJJ2TX8AV2wrKgnleqC7xgraADlO7c2rTD+adm4AV1olVkIn46Gii4Z1uxc/ALaFpzMnuYKtJrxL/mQJwgmflF1x6X975xzdIWJf6pXcIdQUfWIZKkDASqhBmQAT8WiTAcu4k/hwPd6gRfgtGyrusHvdF51qevcn3CLB3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNOPyStpT/8zwNjz/8ZakGbmV6jSnATYswY7QKUMJr4=;
 b=bevnnqreSoJP6x5yYk+uf4OOPV4OLHJlOzAYm7bHyTAueORhS6mEw5zjcvZVBmj+bar5YL5APyBSGX7+J6LkofKqUZGX5VeCuQlKLEB8qevC9/vdz7RbtKEAO8G4qa2QvTlukWzfL8JXeo0bLXlUog6nlxgjsWA1g0aMxv0z/co=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by VI1PR08MB10244.eurprd08.prod.outlook.com
 (2603:10a6:800:1bd::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Tue, 20 Jan
 2026 10:54:58 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::8c9b:58d2:2080:eb98]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::8c9b:58d2:2080:eb98%3]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 10:54:58 +0000
Date: Tue, 20 Jan 2026 10:54:55 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	catalin.marinas@arm.com, akpm@linux-oundation.org, david@kernel.org,
	kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
	lorenzo.stoakes@oracle.com, ardb@kernel.org, jackmanb@google.com,
	vbabka@suse.cz, mhocko@suse.com
Subject: Re: [PATCH v5 2/3] arm64: mmu: avoid allocating pages while
 splitting the linear mapping
Message-ID: <aW9e/6np9uO39yXM@e129823.arm.com>
References: <20260105202328.2418990-1-yeoreum.yun@arm.com>
 <20260105202328.2418990-3-yeoreum.yun@arm.com>
 <aW5p1ylQBNXTEmmq@willie-the-truck>
 <aW6hISBu3hNYS771@e129823.arm.com>
 <2619166b-13ef-4daa-82c7-1d44035a8d6c@arm.com>
 <aW9LCX92T9t8iDco@e129823.arm.com>
 <baa46ea0-737b-4d9e-b4f4-2eee1476da95@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <baa46ea0-737b-4d9e-b4f4-2eee1476da95@arm.com>
X-ClientProxiedBy: LO2P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::21) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|VI1PR08MB10244:EE_|AM1PEPF000252E1:EE_|DB9PR08MB11338:EE_
X-MS-Office365-Filtering-Correlation-Id: 622d8235-0009-4f53-2b39-08de581342d7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?HHLb0umC6gI80oe4NorajrMMqgKdRGvoztBCGkN9VwMjIxZ3V+NtFP6gWTWl?=
 =?us-ascii?Q?7n3msbRmf/zjEuMdJuYUuafYTFw7P+ZHhOHUX//X4PTPrnkGZ6FPR05y0LjU?=
 =?us-ascii?Q?ru98D1lTvGRsOxreVbJcd3bxZIRcAGG6fa69ldPgEeR1VZ15hcAvqDTHpHDR?=
 =?us-ascii?Q?nEL944sU3NsGBXryRhYmNvi6gY2XY97YGg+5BD21SqI+WIXDShQ7fzHAGmOr?=
 =?us-ascii?Q?JIwDTylV4tSG/HAFGQ2mISnk3t3Iz/UYwA/xTqO1vULVccyToxTpUEh3BUBN?=
 =?us-ascii?Q?e32KAUHVBjrF5yjsKyO/42umvYXNo22+2hWaxNdMHOu201sOSSYK796WL+39?=
 =?us-ascii?Q?kpxNEKDMzSA1KG4GslXzqzw+pXPV0f7KTanUq3X+itla250c+ucPRyNA1Dk2?=
 =?us-ascii?Q?Za1ygDsdjab9LtUMOLaG1BCzz+6tILGMU6/6ZQ5n8+23c6aBTt3Pb1PjT7Zo?=
 =?us-ascii?Q?Dp1xSUE6Dve2O3nJ1mNDGLKBhZYhXk8DJJ5wCTDVLVRvcx4Jsq9UaggTpTQx?=
 =?us-ascii?Q?rDA4hQ9pPGV3DfEGgK7KCv246uSyYTz1Gdl91LLJ/OR7Udog6rqL5CFuocE+?=
 =?us-ascii?Q?jMLngU+QLvfr7iuIKfDZXCnkCXBkiCTVvRzHOZq6/Sfj1B560al/b6QgCG0z?=
 =?us-ascii?Q?Z7ClQ5wdvM6Sl+MVP3MLhGSqDoL9V3ReRKh+vShbYw1Kyz+XFNhuqjC3NkOZ?=
 =?us-ascii?Q?3ZrmX96MZ6YkVJhM26D9QTDv2Ej6BFLFaLfqjJAtUsy+GnavaUazZ3pyzCiJ?=
 =?us-ascii?Q?zoAVtd/evv0oHaKRtA73m9+K3QX+PJlAXhIXdfFOF32gpI8bG0/6Ors6Ozby?=
 =?us-ascii?Q?49ccKHi4hoI73il5+QRgY8dym0XNxmSVrhbjAmLBA6Bzi8sjYcNCEwJtXTYa?=
 =?us-ascii?Q?bwsLMcuailWWkklK59yk3WJj5rhjIPFtxGyRTei9pK82koi4OUufOPGACwrb?=
 =?us-ascii?Q?RGf6MXf3ykVyiVQQnlxOM2CulsYofiP41ct1/+rGUuVKiL5U8M4BYbHcuXSR?=
 =?us-ascii?Q?ERRkjDcDhAhdyOsbqjWMrCfZlKNIY3oToVTGoDroJctSPVbKKa/GqSL+HRFb?=
 =?us-ascii?Q?SJs2Xa3WzYDdON6AbTkWxkbXg5O47rkShPle6NAJY1fj6Zae9GMZ2kv8hzgT?=
 =?us-ascii?Q?Epw7FpE0w1O/dPkLxUwIhypvasG47FOH8G+ruxATj05bNK3aQMaZiIzFfc81?=
 =?us-ascii?Q?T2iDNqbewttDDPcMBfez0Nq7fAMJc9Ryyxp/iSUJL2r/itUw5rgFoPhk+DUp?=
 =?us-ascii?Q?sxOpFRff0kqZqaWPIoGr7JCV9E2N1Pnl+5CSe56Mtmg23Tpju28/rhkROQ0N?=
 =?us-ascii?Q?3T0Lk/wjgLIfT5DelltTr9uHDlJkyegNqNL9Vsifyh11U+ZcfsVNAwabTWs4?=
 =?us-ascii?Q?ZsgvEzJz7ByOXX+3GEqT+8o/kFflYNffPfNt+e/iBaka6djJotE6wJUXK6vp?=
 =?us-ascii?Q?oLO2gCevMpvdn4snGNQa3ilu4JfbVRbYvJsuMcab1vcXgQ1LI7WjEAAv0DXX?=
 =?us-ascii?Q?MgZAvEBRh951MbtyHTb8UnETqWWGBIL0mCE9gLJg+s/6XJ6ACBnH0SxO8Hlb?=
 =?us-ascii?Q?Px2xTxSWsIwbwqgFVv0=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10244
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 354c3d1b-e7c4-4366-47b3-08de58125a45
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|82310400026|35042699022|376014|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JoSmtP7rWE7Jch/WeX3fJQgQBJAxioj3MRg0DrD65DwoKts04ChLiie+JG11?=
 =?us-ascii?Q?oPuBlnhSTJg/w3iQQRQm+9X21gORyysHhzFHYuKVf+jxFDFxusn4S9CKK18F?=
 =?us-ascii?Q?KvFym81oGav6o1WAlXwU+bJk0V4254Vl3gsU3+nDraiqWVujwuKtC0BFrSob?=
 =?us-ascii?Q?zc2efciIDxD9LbZloIDvWgB4NWQ1YMe/OW9CLGgPsLZMfF1yQepCAKRqrujK?=
 =?us-ascii?Q?KaCNBuSpYqx3L0WsRAlfi/C6k696ejDi1RpSg2iQN4LO7z2b6hxcIAY53ekq?=
 =?us-ascii?Q?88jQuOGhA9dEUNn2cBO79HNsvH37bsaTWrTtZ+u3P8XDzj9H9GYMQGAmHexx?=
 =?us-ascii?Q?qvC3OETiq60Gq3ezS0osnVE31XoCLWq9R9ZQ+QsAGDUWmal8By9wxYMF0GZq?=
 =?us-ascii?Q?SOkuU+A+/n8s8IYl0689XqFmY7pJWpld2eMWGAg3JVrFdP0AU/z5PZqqrf1M?=
 =?us-ascii?Q?KDED3H2EUmiT7yO7uA2Gu2Of0ut6pNeJpGI8TuSIjhBwDdKL8Fo5Vc9rClNK?=
 =?us-ascii?Q?0aaj96++pgfGl3cYHWwZhSPJrmdwbwblsKlTPZ9OyTsuKTV/pvO11wdQtEnf?=
 =?us-ascii?Q?61za1vj1qG3/JObHN7GQ4QFnB6M1/3uNVwg+VLNhr5uw2pWIQoGbFfdJfk6y?=
 =?us-ascii?Q?t/6ENdqKiSjV2PSpLnIb4nG2k2OAQzVt3vCGtOh1KHzgm+XUU+9LwsBYlox1?=
 =?us-ascii?Q?KEg++nviv0wo3Q5Ut8fHb9pAABQJZkwMzhI3PBrAmG0wGSGV3BYfIxM0hu7L?=
 =?us-ascii?Q?JI6Imq1IipB56Xllf9sMA7rUbUr2xARZ9HPz3fOU/2C37seTma0kmsF6U90K?=
 =?us-ascii?Q?YSLgqi+0+BCkyyB38tRp8ah217/AhSFRK7gevtQjiUD+PjWvLMXEilvsMxiW?=
 =?us-ascii?Q?pUcHWi54Ca6Cwfa8INN2cBTFjM0CCn/OEcuIvh5r9tDEBx4FNtHKH2gjViA7?=
 =?us-ascii?Q?GyfglJDa377ZG6AXoKNTRtqNtH7RIA4eBY+UDdzULqJuuAImhLZt7JRfkd3R?=
 =?us-ascii?Q?jlEKlwJhXk2zKdtGH//fkVpMONNpHnNK0/+JXCxC99eQzj8jlOV6w67FFlBY?=
 =?us-ascii?Q?A9FDRzIkl6vEzZsomKUBVHvp9EPFNVMRZdJD9ofVCQMDl9vOcUs7ychbTSf+?=
 =?us-ascii?Q?NotSJOmkoC+kzFJWxTPo5SCvGgWOt7bglyauQ3v2d2BQLKUxqCT+eT0jQqB+?=
 =?us-ascii?Q?CAz8G9t+F12G7rWssI6+oqwlBJ4ztYOi5RD/t93/b1PQxqVkcfhBmZJ7P3vI?=
 =?us-ascii?Q?kIAxOK796rrYkvbE7ZlhLSEzs4sxlPBhmnYAniaQIrWqxmhvjDv22ATpgM1C?=
 =?us-ascii?Q?pDpM5apYnFxzmOyvClQohInZGIkOBt/01Xbi9p8APSzQJ5Io6mFEeoVAhBP6?=
 =?us-ascii?Q?yKIns76HKeIJ++UtdvP6DOvCbSrjMouGqVb398rWkmC5NJ6gHbXLGUGCE2a2?=
 =?us-ascii?Q?+3AnGUnTWU8O4HedHTi52biJwiFg/CEA4s2CWDmKCisZGhngR2Gtt6+drWVa?=
 =?us-ascii?Q?RR+lU9jBWaJ9V/gaf8yc9tLYVqPKNu269mNPjzPJHxYejAj1PP1o9Hg6RrJE?=
 =?us-ascii?Q?MEEBRZKNylqPiHnLAd95b/dg+/5Xxz6H0BWmZemvUGhMGE+rxvuxZs0rEsBS?=
 =?us-ascii?Q?9P+HSz/pv5p6+2rTs88/3FRIwzZt9erVc4C5PoOKj4U5dgN/T5hZLieZaN7d?=
 =?us-ascii?Q?Z5IfSA=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(35042699022)(376014)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 11:01:28.1243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 622d8235-0009-4f53-2b39-08de581342d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11338
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_030133_169512_62BC10AD 
X-CRM114-Status: GOOD (  25.61  )
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

> >>>> On Mon, Jan 05, 2026 at 08:23:27PM +0000, Yeoreum Yun wrote:
> >>>>> +static int __init linear_map_prealloc_split_pgtables(void)
> >>>>> +{
> >>>>> +	int ret, i;
> >>>>> +	unsigned long lstart = _PAGE_OFFSET(vabits_actual);
> >>>>> +	unsigned long lend = PAGE_END;
> >>>>> +	unsigned long kstart = (unsigned long)lm_alias(_stext);
> >>>>> +	unsigned long kend = (unsigned long)lm_alias(__init_begin);
> >>>>> +
> >>>>> +	const struct mm_walk_ops collect_to_split_ops = {
> >>>>> +		.pud_entry	= collect_to_split_pud_entry,
> >>>>> +		.pmd_entry	= collect_to_split_pmd_entry
> >>>>> +	};
> >>>>
> >>>> Why do we need to rewalk the page-table here instead of collating the
> >>>> number of block mappings we put down when creating the linear map in
> >>>> the first place?
> >>
> >> That's a good point; perhaps we can reuse the counters that this series introduces?
> >>
> >> https://lore.kernel.org/all/20260107002944.2940963-1-yang@os.amperecomputing.com/
> >>
> >>>
> >>> First, linear alias of the [_text, __init_begin) is not a target for
> >>> the split and it also seems strange to me to add code inside alloc_init_XXX()
> >>> that both checks an address range and counts to get the number of block mappings.
> >>>
> >>> Second, for a future feature,
> >>> I hope to add some code to split "specfic" area to be spilt e.x)
> >>> to set a specific pkey for specific area.
> >>
> >> Could you give more detail on this? My working assumption is that either the
> >> system supports BBML2 or it doesn't. If it doesn't, we need to split the whole
> >> linear map. If it does, we already have logic to split parts of the linear map
> >> when needed.
> >
> > This is not for a linear mapping case. but for a "kernel text area".
> > As a draft, I want to mark some of kernel code can executable
> > both kernel and eBPF program.
> > (I'm trying to make eBPF program non-executable kernel code directly
> > with POE feature).
> > For this "executable area" both of kernel and eBPF program
> > -- typical example is exception entry, It need to split that specific
> > range and mark them with special POE index.
>
> Ahh yes, I recall you mentioning this a while back (although I confess all the
> deatils have fallen out of my head). You'd need to make sure you're definitely
> not splitting an area of text that the secondary CPUs are executing while they
> are being held in the pen, since at least one of those CPUs doesn't support BBML2.
>

Absoultely. Anyway for that feature, I hope to sustain the current
way -- collect, pre-allocate and use them for specific ranges.

> >
> >>
> >>>
> >>> In this case, it's useful to rewalk the page-table with the specific
> >>> range to get the number of block mapping.
> >>>
> >>>>
> >>>>> +	split_pgtables_idx = 0;
> >>>>> +	split_pgtables_count = 0;
> >>>>> +
> >>>>> +	ret = walk_kernel_page_table_range_lockless(lstart, kstart,
> >>>>> +						    &collect_to_split_ops,
> >>>>> +						    NULL, NULL);
> >>>>> +	if (!ret)
> >>>>> +		ret = walk_kernel_page_table_range_lockless(kend, lend,
> >>>>> +							    &collect_to_split_ops,
> >>>>> +							    NULL, NULL);
> >>>>> +	if (ret || !split_pgtables_count)
> >>>>> +		goto error;
> >>>>> +
> >>>>> +	ret = -ENOMEM;
> >>>>> +
> >>>>> +	split_pgtables = kvmalloc(split_pgtables_count * sizeof(struct ptdesc *),
> >>>>> +				  GFP_KERNEL | __GFP_ZERO);
> >>>>> +	if (!split_pgtables)
> >>>>> +		goto error;
> >>>>> +
> >>>>> +	for (i = 0; i < split_pgtables_count; i++) {
> >>>>> +		/* The page table will be filled during splitting, so zeroing it is unnecessary. */
> >>>>> +		split_pgtables[i] = pagetable_alloc(GFP_PGTABLE_KERNEL & ~__GFP_ZERO, 0);
> >>>>> +		if (!split_pgtables[i])
> >>>>> +			goto error;
> >>>>
> >>>> This looks potentially expensive on the boot path and only gets worse as
> >>>> the amount of memory grows. Maybe we should predicate this preallocation
> >>>> on preempt-rt?
> >>>
> >>> Agree. then I'll apply pre-allocation with PREEMPT_RT only.
> >>
> >> I guess I'm missing something obvious but I don't understand the problem here...
> >> We are only deferring the allocation of all these pgtables, so the cost is
> >> neutral surely? Had we correctly guessed that the system doesn't support BBML2
> >> earlier, we would have had to allocate all these pgtables earlier.
> >>
> >> Another way to look at it is that we are still allocating the same number of
> >> pgtables in the existing fallback path, it's just that we are doing it inside
> >> the stop_machine().
> >>
> >> My vote would be _not_ to have a separate path for PREEMPT_RT, which will end up
> >> with significantly less testing...
> >
> > IIUC, Will's mention is additional memory allocation for
> > "split_pgtables" where saved "pre-allocate" page tables.
> > As the memory increase, definitely this size would increase the cost.
>
> Err, so you're referring to the extra kvmalloc()? I don't think that's a big
> deal is it? you get 512 pointers per page. So the amortized cost is 1/512= 0.2%?
>
> I suspect we have both misunderstood Will's point...

Might be.. sorry for my misunderstanding.

--
Sincerely,
Yeoreum Yun

