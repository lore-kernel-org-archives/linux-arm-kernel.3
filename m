Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D80D5D687
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 19:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRdc721AdJuu/iQtWTcIC0D/C8doc1qy09Cu9dA5yCs=; b=2+/8mnf8cia2MbXoC+uB41FpJp
	P9QcL92hXalLmIz/5NL2qr8oKlr0dMFA7HjTDnCCO9ubp+yhn+vQHIco2NVQHWMQk65n9xrLKSiG0
	G0fyeplzbkk+Kd2d4VrU6Ry/tLfaIEllzYxIeAo7+EvEwqv8fUILF20HspsuL1sgeeFtB98rQjQsj
	O/STHJhwmbP8UwwQbg5j5XzvMHdZntVfAmEq7Q+tb28af3o6Cvs9TtgALelJCth/cXfcq+cjrA49M
	ryGpz9A1/gUbyN9UHJHNSB3WU/wfjHR55DBL37r3W5LQlLWffXjSHwVo2DnovrRoqUmxbEvdZpMiW
	4ZwqcAMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t98MU-000000086o0-0yhS;
	Thu, 07 Nov 2024 19:40:10 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t97st-000000081MO-2U9H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 19:09:37 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7HBfAa029219;
	Thu, 7 Nov 2024 19:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=JRdc721AdJuu/iQtWTcIC0D/C8doc1qy09Cu9dA5yCs=; b=
	UBpHY7ccDjoBdafhsv4VKv9XG5U8Dj3zIlJ0O4ftUEr+dN4IipCYU6ceG9vXcLR/
	C/xqWFG7tcTrV6JU3I121kG465npiS0T6nFRx8dg5NrLA+CXJSv0hovMVOhKQOke
	FVPZYZroe+3d19Hp5006mcE1rFIlBZMBHvXl1cTHOnDSnTZANFH3fcBtsn3fH7g4
	MXypC8cn7rJJ1jWJ57gEeNSj7n/MM92ul/+i5LIhbUm0otF1JxiLsQs+G7goXlky
	cz12aIR4XoYWfm2yftPR6wZzjYOIFTcW4FXiLenUcbr8xUpxIfODC3rVG7E9u72W
	GXXALKIAx1noZPRKxrz8hg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 42qh03efga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Nov 2024 19:09:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7Ho2IZ009141;
	Thu, 7 Nov 2024 19:09:10 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 42nahgt646-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 07 Nov 2024 19:09:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kb6hMV5acQBYf5jgoG5ZR6GV64+hS+p0gHPWR2f9afteijgHgxo7GaLtJZR2tdxBDcbMZElZ9Qcu/ZmyUAGHY1NSDSWGiWr+6c1lzglbiKDGtwz0aKsAIO9Hoarivbs1QzltqnCAENZTsMs978hCPUzT7SjQnYdH42ketQdKrtTADihv+2PxtChNDxhG57Rb81Wull7qdo9V04yE9zAk4KZjdgKMSfciirH/dxxMvqnaOLp8AinRGB/xrmPBpDMiHeEfErPGIzp7H6IEuw36LGVO53ZSDbpHzI18og2/pIjjlZ3JRg9BBbKGNiju5zrJafcYWhgX0CGc7jNJm0aa7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRdc721AdJuu/iQtWTcIC0D/C8doc1qy09Cu9dA5yCs=;
 b=ClIUvPOX3xZOfTlmmOsM3x01urtWju9BVp8qoypxoF7AHuTTHa7Q9HKDhcQ7ov7b8VVYiZege6tQrXwCyr9vLWP0Ho0V648lkesI3ZuVDjLOFgI696qRPo3SP1bAUe8qBBDQEnWhCbax76tgwh7AjZcWuPAXDK98JWBtH7AV9YBg/1dyYp6tc1v6wLBTra5bOZxL1baQb3aZ5pjMDsRx/Vx21UurGTEmHanX1ducEJ3gXw1gxeclejfU9H9SLvcgnBm9ghEEgmxyBEt0qvDEVUmQAPMhUOWmqyKsiWAMKltQasQluM7EfSaPSnfv3x6QI+pw8zd0qdKGFsfV8PHV7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRdc721AdJuu/iQtWTcIC0D/C8doc1qy09Cu9dA5yCs=;
 b=tSU+emuZPG3Jdn+A5KrXQ1TOqdciGrcu76NZ5UiEDF87GGyd75lEd/I62+p1MrSE315FWXkhmwne9o2EwKGAlg0kDsnfyTQvtuEBN3Q4vhNW5C/7QpLsmpx6ID+Uh2AsVlka4WlxhlX+wQV1qwhU+8kdN6qRfr6XLWZgpkSsPvs=
Received: from CO6PR10MB5409.namprd10.prod.outlook.com (2603:10b6:5:357::14)
 by SJ2PR10MB7037.namprd10.prod.outlook.com (2603:10b6:a03:4c5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 19:09:00 +0000
Received: from CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e]) by CO6PR10MB5409.namprd10.prod.outlook.com
 ([fe80::25a9:32c2:a7b0:de9e%5]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 19:09:00 +0000
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-pm@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
        x86@kernel.org, hpa@zytor.com, pbonzini@redhat.com,
        vkuznets@redhat.com, rafael@kernel.org, daniel.lezcano@linaro.org,
        peterz@infradead.org, arnd@arndb.de, lenb@kernel.org,
        mark.rutland@arm.com, harisokn@amazon.com, mtosatti@redhat.com,
        sudeep.holla@arm.com, cl@gentwo.org, maz@kernel.org,
        misono.tomohiro@fujitsu.com, maobibo@loongson.cn,
        zhenglifeng1@huawei.com, joao.m.martins@oracle.com,
        boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: [RFC PATCH v9 14/15] arm64/delay: move some constants out to a separate header
Date: Thu,  7 Nov 2024 11:08:17 -0800
Message-Id: <20241107190818.522639-15-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241107190818.522639-1-ankur.a.arora@oracle.com>
References: <20241107190818.522639-1-ankur.a.arora@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::18) To CO6PR10MB5409.namprd10.prod.outlook.com
 (2603:10b6:5:357::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR10MB5409:EE_|SJ2PR10MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b99ad31-b75f-4263-b685-08dcff5fa2d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0HiVPkCu9esO3NbmATu7A3/YGgI1hYtLLr6FdW9oFV33egNler6pAK3+Q9Cu?=
 =?us-ascii?Q?cZqczSZw+w5uvTq3tOeNTfqiA6l/7zfbpSyqsDgsYALGVJjF2+u0mi4SPNfa?=
 =?us-ascii?Q?gCW0ijTFwokeapz22cmZZQtuc9/eB0dCWJeoUKPlovwA+VlUwriQmgZ2K99d?=
 =?us-ascii?Q?DBCIstm5rLfFwz0AhC8NqgJUGMne1FpFP7D7oCJWX25QqYaCb+5sMA42T/eU?=
 =?us-ascii?Q?NHLJEi3FND/3i4SaCZRJGmR4KtN7qx1uf8Ebo6jlcsNuGNVbm/Y1m8C0ENrT?=
 =?us-ascii?Q?BJbDhjW8K08T5HD0lQ1etisn0OVILx36B3DJUrY8XQ/Blv5OIrTqxepy65pL?=
 =?us-ascii?Q?WvZQhpH4FzwyWJ7wu/s5jL5zTczhMuEVdAKOkliy7uyNVcNmELhcsYIJdM6Z?=
 =?us-ascii?Q?DY7JH1eEKBbT6///C7KAo8GPbTjJN5wYq6nAc7y5XZk15O8eoYLJa3tR3koI?=
 =?us-ascii?Q?Jin5UROHENlPn481K9tfroeMZ9/fda5VwFjHzji8O2o1ZZWcS7CLpwZhUTcj?=
 =?us-ascii?Q?Q9RfvSXugnB0LjROit5OXofO927xM9TbAT6+w22u5i8zXxmFvOrJHWYGJhJp?=
 =?us-ascii?Q?JprC7pn8Wosmn3rWGAf25wIxLZdq/3uBE17JBxOW5G6titQSSDGQ2EuWSe0f?=
 =?us-ascii?Q?nxYZsJvxfgag55OeDyAVSsk82pkjhIOFw0EixPpmOEdBpA8aYfeJ0fqFLJgm?=
 =?us-ascii?Q?9Dch+HJQ8U8m03qrzQU5td9tGjlqYIGn4HD/1PVs3XCbwUQ/l7EO2LYF0g1T?=
 =?us-ascii?Q?Vtjt8b48VIpDNnPEqrL/NvsBTnvDeuMpenlnq3q8ht/NOPxOywg3e+Ch8Ojt?=
 =?us-ascii?Q?u0szJ4NlfioJ+f5CeJLUs6qGLFN8/XjI5ZiwCxUs4NymHENwn0zDoinQG5dZ?=
 =?us-ascii?Q?oZ1561fhQqIpuM3SHC9SRJnHAqLWbaZb0sD3usoVUgHG4Y9D3EXbBWVUVDjb?=
 =?us-ascii?Q?j6tuzSsxJ/yPCgPR4uAyiQ/iC1fs/U+cC7F0wrhEcYeX4q8RNKA2iMCzGGHw?=
 =?us-ascii?Q?KrXecnwbnMqy8XmTYSEpSdyMd4QCOo8mG12+s03hkLqeLakhLxnefr/Co4d3?=
 =?us-ascii?Q?p11Piqp+1ZviX8Cl2nePYuQX4dwmnGCGTLwcg/Ky8UYob9Ayhf6yyUEjkNU4?=
 =?us-ascii?Q?sqMXnHrYSgrPW34FS6EAoqdb1BkmOS8Ysmjj1Pp8LuWvIQmlL9h33lb1Sb3Z?=
 =?us-ascii?Q?i/ibDgj/WGkYChNUmQDu5cnEgVD4+5TrDzqwzgIqaKdkXtteGTIPyVeKAI7O?=
 =?us-ascii?Q?9NXaKzaf5tRXbPx+Qg143KgsFz3icBAnwZ80mQVWKRHCWxrjo1Rcl4N6rk8Z?=
 =?us-ascii?Q?7SQ/8w5JKAUERnkdtkTbs9QP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR10MB5409.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lySE2DVzf6OZX8xCmOhynJulAAzzmVTQgMxj1FhNrK4E7VVzoaZfb7HUFJYA?=
 =?us-ascii?Q?5a1JhErCtA1IPfme97eDPCtdUVwadOKt21LybjFtvXwD3DdV5+RRxc7koGPH?=
 =?us-ascii?Q?So6yP+1mMrZRs51fyApjGs7/yTslGf3v2mBpeZ+qLVKOiZsKrWzKrj8QZsq8?=
 =?us-ascii?Q?texHryuaXM6K2bJEycy92SmJQaSuoP+pnV49cMvPpTYW4KmmmoRZjKNt0YLG?=
 =?us-ascii?Q?tunwgZBPYrpsn0S51rUGFs2ZxhAhpg86llomSqs6dJZ5iCReagr+JdHSXVDV?=
 =?us-ascii?Q?vkB36rlQAq3HoHtrdhCLy7ntvYFRJLOPN9dEiieeIK0tnEpUX2FIdTKYZapg?=
 =?us-ascii?Q?+VVNGS9845x/CCgyukrb3uqkxNqv/0IrC/CrbaCJouqGmBYjEjXhZuBFin2D?=
 =?us-ascii?Q?/zljsS4qwDuLU5XS14Nyn1I1c8YYllub+chOd2hjhICZrTbFftNZ5Vl9X2x4?=
 =?us-ascii?Q?qkCuh6lzsNVNa6JhXvuMLkpUXngSmJzmBwvJYeaNzQnsJvR7hhtkVx8/n4Ad?=
 =?us-ascii?Q?Iq3ORQkTwaNPvHGhcwyN1dfAOBfPJhI0cuQqt6bZLdgK+d+wVjicwKOBEoDV?=
 =?us-ascii?Q?FFicHHPto4wwviwHSx71qhJs2Dn1XqJ+pUlyKrJheN5JWd5wTDSy6FnNDuMe?=
 =?us-ascii?Q?tAbL3EfNPmsuo1Qt5ik6DRvt/Xe9Iv+8tKADuz/Rf0EKyf2bIkkKOqnTeCBL?=
 =?us-ascii?Q?arxq0Amrg9eCkv25CK94Icz1oZKLYdcyfVySshOtphhmA0+EUyn3fIrdMuVp?=
 =?us-ascii?Q?7fQzz2XD6FZFjajCnu/Ad7KY8jHTHa+bWvD3BCG0gcSTRGlKWw48BOQpddaH?=
 =?us-ascii?Q?YQCw262E8f/tV7t9PkyICT/dlI2r2xROaax0sIt04H3nG1IPyEEoIuKJMNKF?=
 =?us-ascii?Q?p01xSuK2Ixmj0nyckW5G/Yq0V9SR92IR9nY+RH1DqrVOm5tBI+wtewEMU2v7?=
 =?us-ascii?Q?+B7xOwXfnOaVoii5CKg7ZXN3mEUCFVjWayM2yLMg/NM6oSvJvcrKCA8cCKst?=
 =?us-ascii?Q?ujbJC7sgMNZx4JwJaVbFVDZwJnbnGfNVkq5WmzR6FGHrCg9cldy7J4c3/goY?=
 =?us-ascii?Q?DecKXSjijxzW2aSY/La5wdt+eywEsK0n8SAnDwrQ87O9hjgBRf3PrL0OI/7Q?=
 =?us-ascii?Q?fRO6VA8yS7Ho0rU8kloMmxro04dJdtzh6mvXMMOUtMG3d+t5y+sNmd5q+xEA?=
 =?us-ascii?Q?Qnv6vuNlcRKV/5KjsndNFsMim56PIjqHEDbkoRMpxpG/y5FSQ59MpwA2FnEs?=
 =?us-ascii?Q?fcw5gLcaAnIXuLIqx3yi3mgaeRGMmQ1zQynZXjbo6C6a3h4DBDF21CfM7JRl?=
 =?us-ascii?Q?xmXMJyrsPBptyTLIM4Gba7KTHQ/2MWqCUKl1rjpOxcRzSWr44pRfAXzx0E0t?=
 =?us-ascii?Q?6s6FBHSweXGqoYByVdkiHriRdFrcfBm58vkx3qzNOC1LZuVK8EPkUOwTWgeJ?=
 =?us-ascii?Q?6t87CYKzb90aFVBbi0mTOj6ZbyaD40rmj/yWMvEPuSDdhej43b+bBTSVS+MD?=
 =?us-ascii?Q?3XMW+2s6cPUv1QISfbHOJOMKn0NDtvryqHN7zD5HkY2huHDz7DMfdmmQpOuo?=
 =?us-ascii?Q?QwwryspL28dc6Nu1SdV0+UE4bNqPKqVbbub7ePo4PIOTNJrWjLdvbsAEDVgv?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: BBCZ0WwbmgaDjrHg7xlnI4Rx0Lj24UXEzyCxm3NuuIJxo0IY0hSO6QqtobLJWqysD7bN8fonxL3OAPP8B98QcJZ+oTUS692lC5pTGiYgs22EVv+vE1jlbou9LO7bNkr/KTvMOym//jVOWmnv4iYgKgAByaBY4qZA9BeZraSimzmpmV1YIcf+s7Dfg9nWxofMo4Gnj1lHHmUwnUp1ASi6c1jtHUrFibCQgnXjA0xfDeRbg3LUINTJYgNSf1PWWVQFumL5QbxVZ9QLiMJyYRm/BinIqMB7DtlSdvxhZTwY6+QXwuKByQD6DWFCNZ9pdUxboEfL99z0rBOsNUMhQ5PmRLQYx2BYhWwCuS5lLujiVwUa6qwemve6WYXdsvA1a+CRNX6vEjm3XEcS0Ky8BawEqZbRJV24RZz2enNbiJNKb9e33yRbsINHybLhbs/fl2xN8EqnUL6WanNjfV+e6vuESf1jfnRdhgfwSFhJXnB6ZDjAUkjr5FNVdYCUy1YiTFdaZYJP1cm22J8+Kyogd4ekGHyOEAMfuc9be6F+YTDSPg1jefwJVeRr1ebxPo6+vL6LCNWCZ0Qx+noAWwyPcdHY9/0lD1jQmeBB/8wNwBtDNcw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b99ad31-b75f-4263-b685-08dcff5fa2d3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR10MB5409.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 19:08:59.9894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Due1nKfOIkfQz8sw3Ve2sVCCQZVlUqbqi3DwT0BhbjU6qVxJhgmlNZ1GfMoI9xyY4hYBqkLMpMNBeQ4cYz0UDYQzXugrVZz/SW8bpr7FmJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7037
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-07_08,2024-11-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2411070150
X-Proofpoint-GUID: 4PjqjIBRC43LNInZQ5n8z8bOg8JeVw1P
X-Proofpoint-ORIG-GUID: 4PjqjIBRC43LNInZQ5n8z8bOg8JeVw1P
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_110935_690251_6BB71537 
X-CRM114-Status: GOOD (  16.31  )
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

Moves some constants and functions related to xloops, cycles computation
out to a new header.

No functional change.

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/arm64/include/asm/delay-const.h | 25 +++++++++++++++++++++++++
 arch/arm64/lib/delay.c               | 13 +++----------
 2 files changed, 28 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/include/asm/delay-const.h

diff --git a/arch/arm64/include/asm/delay-const.h b/arch/arm64/include/asm/delay-const.h
new file mode 100644
index 000000000000..63fb5fc24a90
--- /dev/null
+++ b/arch/arm64/include/asm/delay-const.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_DELAY_CONST_H
+#define _ASM_DELAY_CONST_H
+
+#include <asm/param.h>	/* For HZ */
+
+/* 2**32 / 1000000 (rounded up) */
+#define __usecs_to_xloops_mult	0x10C7UL
+
+/* 2**32 / 1000000000 (rounded up) */
+#define __nsecs_to_xloops_mult	0x5UL
+
+extern unsigned long loops_per_jiffy;
+static inline unsigned long xloops_to_cycles(unsigned long xloops)
+{
+	return (xloops * loops_per_jiffy * HZ) >> 32;
+}
+
+#define USECS_TO_CYCLES(time_usecs) \
+	xloops_to_cycles((time_usecs) * __usecs_to_xloops_mult)
+
+#define NSECS_TO_CYCLES(time_nsecs) \
+	xloops_to_cycles((time_nsecs) * __nsecs_to_xloops_mult)
+
+#endif	/* _ASM_DELAY_CONST_H */
diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index cb2062e7e234..511b5597e2a5 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -12,17 +12,10 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/timex.h>
+#include <asm/delay-const.h>
 
 #include <clocksource/arm_arch_timer.h>
 
-#define USECS_TO_CYCLES(time_usecs)			\
-	xloops_to_cycles((time_usecs) * 0x10C7UL)
-
-static inline unsigned long xloops_to_cycles(unsigned long xloops)
-{
-	return (xloops * loops_per_jiffy * HZ) >> 32;
-}
-
 void __delay(unsigned long cycles)
 {
 	cycles_t start = get_cycles();
@@ -58,12 +51,12 @@ EXPORT_SYMBOL(__const_udelay);
 
 void __udelay(unsigned long usecs)
 {
-	__const_udelay(usecs * 0x10C7UL); /* 2**32 / 1000000 (rounded up) */
+	__const_udelay(usecs * __usecs_to_xloops_mult);
 }
 EXPORT_SYMBOL(__udelay);
 
 void __ndelay(unsigned long nsecs)
 {
-	__const_udelay(nsecs * 0x5UL); /* 2**32 / 1000000000 (rounded up) */
+	__const_udelay(nsecs * __nsecs_to_xloops_mult);
 }
 EXPORT_SYMBOL(__ndelay);
-- 
2.43.5


