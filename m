Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13659CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLU9YfCTRRsboxUvfFFpxhPMEJFzyA/VsO5mM2/Obds=; b=IPTwWur5ejVd0JdzKImIIHeEE3
	xYQfkwhpNCh4I0/JPDk0EqymD/ZBAW/wVtURp6YcVn83d+u0gP1MoM1is3FQ4P0AxPIUayKiYtETu
	SIk0xy4OIWcKpCcyN3sdAqKJwfj1CpB8QdFKY6Wx62uuZKrlrFv09ZVcFthMttgVkvix08uIVAHLC
	LS5OZgXmTTyx467YmeSgwsuCDNF8QvjNj7mEjyq+rPheqqKe11/SNEqN4aFhPGNYzhrcnJPLrgD4c
	V3sAqYsEcTUGsPB31UTWhp3GFl1DumWTJuq8/rK9VrB1yndwIoH0T73m20WVZC5UNlGGU7zt214h5
	6jpC0c3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYie-00000000NSr-3nG6;
	Wed, 06 May 2026 09:39:04 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYie-00000000NRU-1LKv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:39:04 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=v5i5nsaNpAk66jBsAzC77E006+70tJF5vMillk6SJl2rPVRd4NRIxh6KoWVHcIhapi2noaH7N9i0Y2bz8Wii/hSGw05QY44/yhfyBtg8wBuuU77kkOVvR1cjw9U0DtYa9mRTlxQ24gnLxOm1rEcyQ2krCkNP497Xl8E19587r+6nNbx3VfA3o4Vw+QamOO/OoFR2Oe2sjzI/dyhEh6mhuy3iQBq92JmQa9n4pgeuQwJIKz5iYg+dEEXMDBEwvI3/EfUNv0Esz1jylQf3kPXRL8Fxw3xGlqrfH7/RC4H5ZMrQj18q0WFhs1u5mcSOG8U2wFKqbb5/mMQy5jP1gLVqZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLU9YfCTRRsboxUvfFFpxhPMEJFzyA/VsO5mM2/Obds=;
 b=F2piORP9pe23NZ9wmTmq3FS6Aql8YIy5rkweX56qO8hvJqusOCh9FdzDOwT5kxsth3/aEYpnBeYA4caIDYPj+In68IO5eMFOnYxwhL74iRQZJXWq7vWExbwbdVrRUqGgkX5ZjYOqM4es+/ioxivUY9H99ihbgTTGFuDuvG/MMSZSYX4g/I8EcZIT0/hzLEKYZAYhpfBpH8pn6LQAh/R0bPxbZBpJu2+LfVWV5JRrzpbhRmUUJiueh8gFJK3cwbbhUcD9nIwQZQ2gbZNaRL4lnHb956DbeXHdqU8lVUHCKSALBH4bvUEJ0L7sMK9/BiQnkmReIrY46gqMPy0xhlS3sw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLU9YfCTRRsboxUvfFFpxhPMEJFzyA/VsO5mM2/Obds=;
 b=qYa8FzmyRsAkFReirnK0VLSbR8Fo1b5Jz2wfjI0cMVm/RKbYaJYIbhXnlR87Dta5R61aduc6VjIxf5WVY4WU9jSA8Miq7oi/P+J1YQq26lMR6ml3osGJtj1t3VDlczB/7U9prNwugJZoY2kH78+nuefQZItbSR3T2q4fJbkcHyU=
Received: from CW1P123CA0014.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:293::8)
 by GVXPR08MB11421.eurprd08.prod.outlook.com (2603:10a6:150:2e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 6 May
 2026 09:38:55 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:400:293:cafe::c4) by CW1P123CA0014.outlook.office365.com
 (2603:10a6:400:293::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 09:38:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Wed, 6 May 2026 09:38:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQX5BbxPutpDlUCmNpPTMGgCgNqh280vbM34AP3V/7O34kK3i7hp4MlMC1FK2h8tMNP9bmFaZQ07yMJOhP804U8JCd5+pG2d5pU78uforcYXJSYrXcWM7CFEz7e9uyID69jv0R8qyAvkwFaNlpHWw/hF5YGGtQRKvWYnnPkZz/jqhV/haMFnjSjGpeQ+g8woEMSePB+DA5P0irL+22Yre8FmERP/B+RXrpLydcN2/ox50OGT2jWLRzjHJIdzhC229E2N3hZfqJ8JxBwlb/3+yoL+PaAy/gOYrIT2ke2zyWhigcKQVhGRGcJN3w4U59ShHAz7gV3At7cMNQX4A9Q43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLU9YfCTRRsboxUvfFFpxhPMEJFzyA/VsO5mM2/Obds=;
 b=yFb4oYlkQxK+CQN2V9mkANWD9shLHOFFAlx7p+q3J8NgxcKn8SPZIbTxOam2RebnoQwUrfPioyMm32/bPPYtvh8IDEEP2W8d3d/9x0gxdC2TuVx1l8BFUMfWlu2EebcRFxoTBflwsJLvS1bQplzsjJrGFswoOWPdm4w57EXGUwLN1ahshc+bL+A+rwUtxUlWAmIN/SbrD5tNrmvyfoG+kmosmT7FIKCqyM0qf1Yxrma1Sfr6YNWXDL8qH3iIJRFA613fPKdR+zn8Ghr4vHIRuBLjXAnCJd5VmDudWimNq/fU66SYvUi8pVmqT2nm2fmYuXpklJRA0xGQ4Skfa47V/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLU9YfCTRRsboxUvfFFpxhPMEJFzyA/VsO5mM2/Obds=;
 b=qYa8FzmyRsAkFReirnK0VLSbR8Fo1b5Jz2wfjI0cMVm/RKbYaJYIbhXnlR87Dta5R61aduc6VjIxf5WVY4WU9jSA8Miq7oi/P+J1YQq26lMR6ml3osGJtj1t3VDlczB/7U9prNwugJZoY2kH78+nuefQZItbSR3T2q4fJbkcHyU=
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com (2603:10a6:20b:47::18)
 by AS4PR08MB7631.eurprd08.prod.outlook.com (2603:10a6:20b:4ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 09:37:43 +0000
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7]) by AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7%5]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:37:43 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: nd <nd@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
	<maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v2 3/3] irqchip/gic-v5: Allocate ITS parent LPIs as a range
Thread-Topic: [PATCH v2 3/3] irqchip/gic-v5: Allocate ITS parent LPIs as a
 range
Thread-Index: AQHc3Tv9OohpP/fXR0a2O4rk90Eqnw==
Date: Wed, 6 May 2026 09:37:43 +0000
Message-ID: <20260506093634.382062-4-sascha.bischoff@arm.com>
References: <20260506093634.382062-1-sascha.bischoff@arm.com>
In-Reply-To: <20260506093634.382062-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AM6PR08MB3399:EE_|AS4PR08MB7631:EE_|AMS0EPF00000194:EE_|GVXPR08MB11421:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f6e558e-c56e-4717-b2e4-08deab53485a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|38070700021|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: tHJPc/G0SSG0usy5uOJVREXy7k5F6n+kzefR3qwuWtGFYRdqUj4/xwmMOB/OpfjiuU/P9lYJcwltDFy90/OIiiadavdo+V/eC4PXPEIM0A8+MrmTZzQU6hJGqP67pSnEAsnAKKPoPGppzHa1b5imVVCTUq+mrj5kfs6Xnq//uyAgn4msWxphPO0FYPYiEI4BUsBidbDkbBxnzMwhJ8UGvuBj0wKE+bioD3klTtHf2rQg1vYl+vAy1oa4z/ybHj9SQsB+vlF/eSgdE60DTV0gk4NF3uF9H+lwd86aDl0U1qPap9DnILurRvsOSgypYwBb3CrxbOBbUdoz+46lBmtupkButljwkP4qO2fhG1UIB9A9UA3sg39GULG2IIShDjhuZmI7kuZsVCGS/T1hkRNVnakypiNMdWaqPnOSJtB1+ZBPo26zmM007KWMp6UNBToNWm3dH+nMmpqYLQcJJjABU7QjJRQYpF7oTvFdP8T9sHmGIv/rEK1bewqIZdLagl8zaOkCMAih6yKekKo1YhY4kSBfOuttmdrdjwlv1AonFx5jU7C/lT+OEr+7mIZmvfqmK0KZQ5o6pbXX09B3bTl7XE6jMD0d35OWvWURSVWony0Q8fWFKe402CGmhpBmZyfjFerGXPE6MVA3FNjFeGqLAP4Uw34lE9b47cfb/kWjCSiaROBWNEmYaBGJGjKz3lJHyWQuZJNVNXOANp9uRNf6GnLFhtRjeacnYoirVMfa6qmShO4K5pGTuE0g9NC3X9rf
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3399.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(38070700021)(56012099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SqbdomJCMhUM74wrrFYIUyE1qEv0ZrTwp9O/EJUt4vAnNMwejllA+BUqydIVG3GEycpaeIfUhpo6ndIBtffniQGyTcz4LmJaJosSyd0xz+QelAKesRiBlvHxNoJqYsMJtLQpRrLeL4JzqeDL6AjOUxF85CM1f7NYLmSV/oS0AN2j4UX/M1QcbSLilV9JapnaUJMrzTkY4vyUNESHZl60mS6PZXy77vsROeALzLeh64KK8gU7FaOjsZArNQljY0hPHhQ9o0x3xdX5l5B02GzklrSSqlRUkHwx9Ed45oSRCkI+VH3mlqTWIuImotvFdurA07diCNE0xnXUxp92176iVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7631
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 711e0f84-84fa-4c91-1111-08deab531fcc
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|14060799003|376014|35042699022|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: aBv9cqVBZWLY8JAF8u5rAeX8ma8m2S8aKgnGeEnBrZxyIlHGek1WI2mbAJvd9imfhmaFIZs6LYNVvSafZXWIJDmVeVpBrDWQEiB5ixI+HDwhL1D3CxKUc4a4gEpTVBoh+g8ahrsbtsU1jZ9HqlxO2+BgZARir4nExz6pPOuxevbQzjpSU2IzkO/W8cuUt2b5E761Z5UZNXlPHG++It51yeRBYKtoCfXS1gmLg0Yq6QxWTCOmN+NeqjiIqcmtUCdJZl8cLkT6XMjtvs6LI7TNeWOWne9gyGTkcgBttDA2ZacySyj/yUpvh26L/qVMtohwHBUZBbIyymM91E4ubJwqA1BPlB64vZtj+zQJSkf1YMX2cmu9hlv3U19wlxU7X5S5H5XoCFrGsN4MYG/gb8nosIIovId9HkTXfIjQPE8NwE8/wEqKncuqXSUatSiHlbjwfzs4Eci4IosFko5MPXpNVl1y0D3TuLq0adWMVn5+3YtwNIAX4FZ1tmBSSUtb4+/RM9sL7pFMsdDXC2hPZESL/4f1tmqwLcDbRDK9YQQH0h+4Zj7S7snxvuSvafNk09Vxree0FR9/wJyZblL6tMZbf3V+rD+ukC3lgzFbT/Mip13BkQmUqXILAAvI2sC/uKJotWKWuTmMREo6FaEZu95Iqo9q3HTJWg87gBKZ518iDyLVCDj1dgGfEh/0B/uMyX79Sgv2JdS53NNGQwtQFyrN6+g08763zVkByG3v0N+XDqQ=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(14060799003)(376014)(35042699022)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7yUXuWvSeVeEVn7thwlEGZ4Ht2w4aaOlnrLWhHLL9fZHetqeNPCr9Yjf5xwwWbSYap7f5FmV39IwtQathAU8onht3e0CFSCFDCdBbmez9E5MUrryg08Pb6m6m4X0ccdKsLooBLzcmp4gQIRnY/fBmDt8deamlHurIDeUQ9b2L6cTVRHUOKtCOz6Mgbg8VqCd+w170xYG8+TKNVgm4Hkvj3GXbTrq+AOYcS+3W/Mb29y4rGhK7Lb6UC7kb7DW4FlhpHdG6Czq/ofYfirZ0BsuvAFoTcv9p0Oe+3M2wYFkVb+q+yDzYj1GwzaMQ7+1fudecwz3m1tgV2XD2jCJG3KJb2k+5R4WEVvTrxUPA04vi489t3vEadno1iOjgJdme9irRQRCeezBrBTTN1eixpsUMtg07CTsYIt9zbUDb9w09UFUGYHQ5SMcu6OXreF/A7d7
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:38:51.6800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6e558e-c56e-4717-b2e4-08deab53485a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11421
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_023904_359809_04A7CCC0 
X-CRM114-Status: GOOD (  14.79  )
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
Reviewed-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
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

