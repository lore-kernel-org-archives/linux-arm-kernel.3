Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7712AFD8FC3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 15:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9fPW2kaPKUAFZVoLL3fo/SOegtBkzgndHi+9YjidEo=; b=gfhyb4hGtBJGbTZJUwtr81hyhU
	QJLKDeWXlHHwVt/PUbcsA56e/mwjs0i/uy7roAT5KIlORO5RSPgax71pIuFobFViOxi9yAteQenCp
	8zZw7WGxV6+GwT75wh50srd9ClhF0WMRLrjkuSeVKPZxC1V8mHlS5AwioyghvpIBSomi8vlBRIRLg
	6+jmUQhjBmILQQFwrsfPxycSELoq4SE5DGv7XRe3W7pfHoFLsLFGomZtgp/QPbQNBP2YHhVDKxHq5
	paCiltzph2Bn4Zt7vIwSNkiDV1Rixd+NboDdjBUmBUGa5rY1qVFp4yRFQHHcp8e3yyZ8YuUg2VU0M
	0pWRmHCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdjw-00000006Zl7-0NRe;
	Thu, 26 Feb 2026 15:57:24 +0000
Received: from mail-westeuropeazon11013027.outbound.protection.outlook.com ([52.101.72.27] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdjt-00000006Zi1-2K6P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 15:57:23 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Sm8W3Pwz+pN8DZQRAI/tJ7lNfTcE98+fz7qYWSHsR0NP3c9WW6Ztfaur2lOijrnAzhNpPYO9pNuMPx9yxeV+xUWd5nBCt8p3EvwXHZdBKswZFIIyrpN3Gg5sDMZeoGhVFv680rNW6sbkHsxYyB1oxDpdZRB7HXG+AOfIPAQlSXvIvnPma0+yKqV4VnxjGFwnGlNPkSrfG0iKVzTf1eJz5hB1FyZkX2L7auvItMZ1KalY2o21UrpKyTEPsd6DqnglehX3cp6QaX07wEAsccO3JRYjpNLvQMU3nxVrCKkInqT0FHwadvcFINS/1xYcMAuTjvDFlC6xBwXnMG59v6mCVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9fPW2kaPKUAFZVoLL3fo/SOegtBkzgndHi+9YjidEo=;
 b=GErS8nA/t5USdr/xJ5T+E/qEzo25qK3GrdURzODZ1/iP+rIlgNoZwiOEzUHzApPsf2vLZyCOAHFqrshwFtcjqCxr8M9EGp3V4Ib7TWuamN3+p0IPWYQqLIpuXHBPVhc7Smcj+ZeBZDs3HRAEtp8SfrCtbC2j7IqL73EAQlnTnjv9X0v/D6WlN7qcbAD08rqanZbEI5zWSbCgxsGKTpq96K6C/89/mkeH5fzsztdtj7kCu2I/BYmJGQ8KtV94nlsI+CJYn58yRemR+DfwtEg3iMWArzFfFfpWzUZajC6s8h9zTZUBv8+xBsY4/C8IEKETHowSiUiAaUdbmEroCF/mDg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9fPW2kaPKUAFZVoLL3fo/SOegtBkzgndHi+9YjidEo=;
 b=r13cKx+mBUxzyMqJIn6jY6M7wk5DLiUoisYIIVPsWzM8nmtWWYu0STEDUOKH/G8CdwgaRH1Uob2OCFEKASAjlk/UXhAFzaVgbNAY3yqt0htP9p5b+sGglimqdRBzp56YBdeoxRT/QhT0iztbVP+4zJCwYXO9QYu+lVI7LZLwfa0=
Received: from AS4P195CA0016.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::18)
 by DB9PR08MB6346.eurprd08.prod.outlook.com (2603:10a6:10:25b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Thu, 26 Feb
 2026 15:57:15 +0000
Received: from AM4PEPF00027A5F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::ea) by AS4P195CA0016.outlook.office365.com
 (2603:10a6:20b:5d6::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 15:57:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5F.mail.protection.outlook.com (10.167.16.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Thu, 26 Feb 2026 15:57:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICPEUSoZQS/4mGyWyZuexGD+fgw3HJMMf38Dj5uqYsTCbSRJQ7aGbzBT6r/2qArNJe4KbXO/oapW4mp3GkZlNy9JxGC6QSXV/xCGgQyB73uLYFk7nOYq04Jzqo6dMevXWYYKh8iW5FN/xBJf/Kpe7PZmpccWZporsC3HVN74v+FrUnZCXr6u10cr9YFuKs1tZtsKaoI1c3aoHT9PPcTcvEfrNtBORSE4iCB81E0aB23+N5akFpXZ+ZhaPEkmucAUS8+5yir/M5EwgPB8SusbEIjmciMqwapMPoKvxqMMnQq80FYT5mOj1O0Vbqb3mGP5OExGMfEnl9Q0u+OfqyIi/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9fPW2kaPKUAFZVoLL3fo/SOegtBkzgndHi+9YjidEo=;
 b=TyTcDjxxHz3yxa32WS5iXuoFGqVWWxpUNLWD9ZvuVgGg1Ew1WdUzHVDLKKbkTLcsQ6I1ahfVH9R74F4ua8aSHt62vHTMKhFXsfzW2scg4keAFljQaohHxbJtxE5h8W4Y0NkFFX83GhsjDzbRP+Y55YZircpW7ej3QKr0jUf9mu3ZFKtY4gFw19m8p/RxME19evpv+IPGum8M9DgrlUQ1fIsv/+YzFgO8cqjk9BGKsok8kPNoNMyp6JHv31WCesdDHr3cHyNX1728iBBQp/R4CoHt8+Kkk31WXcC63LMElfRq7uX98QdhTXePSjeVso0tpvMld3EodesO1eb2PoKOyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9fPW2kaPKUAFZVoLL3fo/SOegtBkzgndHi+9YjidEo=;
 b=r13cKx+mBUxzyMqJIn6jY6M7wk5DLiUoisYIIVPsWzM8nmtWWYu0STEDUOKH/G8CdwgaRH1Uob2OCFEKASAjlk/UXhAFzaVgbNAY3yqt0htP9p5b+sGglimqdRBzp56YBdeoxRT/QhT0iztbVP+4zJCwYXO9QYu+lVI7LZLwfa0=
Received: from DBAPR08MB5687.eurprd08.prod.outlook.com (2603:10a6:10:1b1::17)
 by PR3PR08MB5819.eurprd08.prod.outlook.com (2603:10a6:102:92::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 26 Feb
 2026 15:56:12 +0000
Received: from DBAPR08MB5687.eurprd08.prod.outlook.com
 ([fe80::7d4a:f17a:4cb0:9793]) by DBAPR08MB5687.eurprd08.prod.outlook.com
 ([fe80::7d4a:f17a:4cb0:9793%4]) with mapi id 15.20.9654.013; Thu, 26 Feb 2026
 15:56:12 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>, "jonathan.cameron@huawei.com"
	<jonathan.cameron@huawei.com>
Subject: [PATCH v5 03/36] KVM: arm64: Return early from
 kvm_finalize_sys_regs() if guest has run
Thread-Topic: [PATCH v5 03/36] KVM: arm64: Return early from
 kvm_finalize_sys_regs() if guest has run
Thread-Index: AQHcpzhu/21qfhNo0Uy9+RGq1/nKBg==
Date: Thu, 26 Feb 2026 15:56:12 +0000
Message-ID: <20260226155515.1164292-4-sascha.bischoff@arm.com>
References: <20260226155515.1164292-1-sascha.bischoff@arm.com>
In-Reply-To: <20260226155515.1164292-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DBAPR08MB5687:EE_|PR3PR08MB5819:EE_|AM4PEPF00027A5F:EE_|DB9PR08MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ddcc789-9f72-4d64-b059-08de754fb659
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: k1zh6PT3MYhLlbXmP4K4L40KmlRkuZLZAjC4KTHpWhXfaT4RkDEFLbFMmpBUw3FOhZc/+gPoi1nQ+QOzoHinoFJV/XAkubL7nI/EyZzPkP2zBm+9l0kR0XHA+agLUEjUfAwoGcbNWoxgkggp2LyY3SbBxM0j+Vw7kT13ERF3STIzwTdbhQAjeMfpZkpEtq0S9x4v/NYTDkEg+CvAgmD36v8HK2WZGzpb2FWqAaryyRDS9xdmQM9F2VjpnsbixPASFC0RhlSCCbUFtd5SrD5+/6FL+vV8d9idB2LuutQCSnvSKOrypY9hfcp5rURlSyZNzMvNyqoervBP86SYpaXloPQS311SLYzCmFm8jOhcWv2Sqf/8MuxhbVOjjhMhOJwmldpth6dj5WESULyD6r4tvC4pjKxP8Sv2IdnISHeHDA8J2ModiJ7o61w8jBHhnCZlr6jVM0SqxGoHO7E/4FgJ6O+s5zThmhNkMQ5TaMpanOv2kS2RAefpUcZJu4z+z0WXh7m7Kse00F+A0W8WcMCrjtRD6hyzxnd9dg3b2SUgibQyEet+P3r4io2lZjz/C70OFMYJl5syo4zoCzJoOPEhDRQZRoC5VDY7TdeDo8DTzUItiSSjMy69FQHs7PsbwF7CJxBvF2TV8duG2Q+T6JMSmz/Cx2WQLpd6QGIBNSBrppwVaX2JU6yLCUnizqN4okdD1+feO6u+3en+rMrsMNn2B2yt/PuAJNE1G7QEqsTAvdr/kYdR5X1/fRcnvYXNFM2i6FzDbY1UqoWwOlMaWfp+JC5j5lwWIXU/XP6VRjTduqg=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5687.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5819
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9cf0b73d-0462-486d-5305-08de754f909d
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|82310400026|1800799024|14060799003|36860700013|376014;
X-Microsoft-Antispam-Message-Info: fUcbqjQs5QObQK96kqdLn1Jmfq8eRSn6s06nl44zwpsp93jxVld2G+fQK8fjO+GASNfoK2BgHyKeJ7zH38JbRC0iBUYrRf+LHDQDg/HPHH+HW5WGp65QXA5twExmM5dLbqapJoFGoUemU/SLnGsejx7LO44HYPH1hrzrpg/lBPXWvhYi8vaAZjRA8v+P+BuIcSzrXSl1nU6V39OimMLJHvz2Tesz0RShujSy6JUOvlm/yJtWWpww2mpKqbAqSBS3LrGGj3XP3IVdcVfx2HhQUeW+e5aCOvq9D+ryTLue9qE1aXN5H4GrDaK6Q4T4ySBa2njovJ/+0Wuurb/1WGOq/07bOOhBjj+pADRQ0nlH9wn6JxaXMBsUMbEdP/9rbhakqOBQc1CUS6SKXljSy3HR3X3XL1rc1C+ionyb/PPv/dtYX0UJ0HMue1AH4hWkHnjp/QbTzoWwVrpP+UP5s2HQ89Uyoi57e9jepZv8wJScTDF8wfZiAwkhWbyBlEkGSAaowwZ5/VBSYb70jYVFP2xT1Q43i2oyoSVcg66kNldZp1Tro43rkeszJFdmP3N0QwpGVaY6vNgo8jfaIe34cXsKr9LoskjWCmfL7HgR3q1entziaEL1KfQSwASrl386NWk3UV0fTP3wZc6PU8BqvnuKnjln4sM+lzPoPQLiS5qux5lCmqtgwnY0FHIrkXAYJr5a/TD+qpuFU26uXEE97gW2Aj3JWTTqLY8nYrINQCwXbxZCEXzDQrC8BBQ3b0Av8snqos0ECfko18fasWIDU5ojON5yO/CJnhiJQtKfzW2ncXeJ6cm1aDx2A5Vn+obGf++HLBi8Y+QKApdbdUF+6VkE2A==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(14060799003)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: g4KDixL+8wKtwrqa6AiZe47JWNomBTbwcKPpSTecD5e16yJFj/tPHQyv5AYBuVi3yPNhKTPUd9k7GsctOQ5wuwWrfQl1hcroAx/cJ2YoGG0ksCNp45s3r5M+3tNfwS83ycuuKFzpjMT4IRHddqPJ8+7/WzgkhSFAzI1MT3KZRCuMiHtl6tj6IGCoeD4Xu+sQ34PqEn/aIlrG8fF6D+pAZzzqDC48sCRNETYUzzLqJ/ILfZJIYRObBZEhAaCHPDr+HHoqNrH0RlO2sSU2mYKyyJvM+3fNz78LZ7S5dbDrbf+mTtOF7a5JRrNaftuZFE7DM3RalIcbQMC4pgv7eKwvZTYaeOgtPMIbuDkkENwwl1r40t+Dl80J2f9dGF/uGwxvv06xYoO8e0mAptlvDCFz/+jbkF1ZSaxF0f034lmyLTIY/bzRoAePPW9+V/QXV8CT
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 15:57:15.4487
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ddcc789-9f72-4d64-b059-08de754fb659
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6346
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_075721_613254_8DE24DE8 
X-CRM114-Status: GOOD (  12.00  )
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

If the guest has already run, we have no business finalizing the
system register state - it is too late. Therefore, check early and
bail if the VM has already run.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/sys_regs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 270f1c927c35b..11e75f2522f95 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5656,11 +5656,14 @@ int kvm_finalize_sys_regs(struct kvm_vcpu *vcpu)
=20
 	guard(mutex)(&kvm->arch.config_lock);
=20
+	if (kvm_vm_has_ran_once(kvm))
+		return 0;
+
 	/*
 	 * This hacks into the ID registers, so only perform it when the
 	 * first vcpu runs, or the kvm_set_vm_id_reg() helper will scream.
 	 */
-	if (!irqchip_in_kernel(kvm) && !kvm_vm_has_ran_once(kvm)) {
+	if (!irqchip_in_kernel(kvm)) {
 		u64 val;
=20
 		val =3D kvm_read_vm_id_reg(kvm, SYS_ID_AA64PFR0_EL1) & ~ID_AA64PFR0_EL1_=
GIC;
--=20
2.34.1

