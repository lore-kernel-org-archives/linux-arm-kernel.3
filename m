Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADAAC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 11:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBBD/Qx2168rADX0pEGbPpmi2yUYpZf1u3sdvoFcLEQ=; b=D24gdww5YxDw1fDiEm4JyqULUO
	x22bboX7dfebvzrKVdyoJDtuJYMIVPXu5uqUBh1keZnQek3LsXMMsT5+1UALGFqnbMb19XHOE3Xc8
	jCuUynmHiR7MU9FvG24nkRNFrecZ3K+VGy5aI8xsiA7/b+V5Ej0ejJM/7cFF7TQ3oRm68NjBJjo5u
	txTBbhibG+tUlqNebTZrbMwfy0vrrkmYFrSbOBw/ZH6+ib/fNFmxIU7siRiCJZ9tq9VBMgkZMFa5g
	L/o4MV+KVXNBnbhl9ZtgiCagdZeEcZgWPacCfvni9d/46GZv/3gG8Kc267bE+dgql/UsZDCFiJJOO
	RDLw3Hlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDZD-0000000GBxQ-3Y9P;
	Fri, 24 Jul 2026 10:55:47 +0000
Received: from mail-francesouthazon11011019.outbound.protection.outlook.com ([40.107.130.19] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDZB-0000000GBvq-2fdq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 10:55:46 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=taVt2QGUfvWkLjxnJYgOa7aedPlCCEz6wu/cfdd0VrfQERLd9p9+Oc9jdbD8ARgB3Rr8p0gafMYvT2QXahRnfy+QTiO+CZt9IRP1gxuvS1/QGQHvKdFDRk48NW7KgVwpzb0+fqaE14p6raV3WkLhVECp0jE3qjaBoe+IBjkjF+ZiRuQVJ0hFZOx6jAsRW+hu/kvEh4Gow7MLVvkzb+D8RaUF9Fi+HOJssaJy4BQKTJ5CPyvd7HM7CJPZzsvV1P4kgzwTTx9DzHvvnMCD1ZxeJJ5yMn+wQvdCZseAVRsT22BJSahGcNwDkXWrG2u+FDtTjqqZcTzlclI7NAbsLyDaqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBBD/Qx2168rADX0pEGbPpmi2yUYpZf1u3sdvoFcLEQ=;
 b=Pe0O4YHtnR4U4+ILWBwGmoJ+3nOFWno4+I2K6jomLx1+JGxzrUIhFhpc2RnXhhhW4qI6BxXeDWi1uL/3JwGCR5KKRRsRhq+6OGHJzryGdN3KH2ImgmrWX+dsJEE7Bj5MD8Qz/zZ1lBw9YSmGX2uv5T2l0gCUyUMWXO+/mWWE2cTyn1YkNg9xR1R6jJRDsKO7SRuWS5H1nU4UM2hXhb/YRyfRmT4m/zuwj/WJ0aVtap/RwTFJB00i3/eZXBP3ftNA24zQlkyUjnNSdRt7L+pxR8MBxCsQsN+DJV5C+VSflcu395CBL8C83fd4qy2U3KsfLvYgjEmqM2wm0OmGyWLLUQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBBD/Qx2168rADX0pEGbPpmi2yUYpZf1u3sdvoFcLEQ=;
 b=DD+OsvRuiSzGT4gEWRotj3+/jx7DxjcdAxEjn29ElYQMElkeZpLFzx8TtHNxjoTCvGmsfO/zgauN5RnspYNPOOSxn7kTrKM9r57zanQyuIF6xopJAQdLTNsBJp2KiKiRiFGjtgyM/cZ8oSXeqpdnnYUi2mX7HvxMsgxiagYeitI=
Received: from DU7P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::30)
 by AS4PR08MB8166.eurprd08.prod.outlook.com (2603:10a6:20b:58d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:55:38 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::14) by DU7P189CA0020.outlook.office365.com
 (2603:10a6:10:552::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 10:55:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via
 Frontend Transport; Fri, 24 Jul 2026 10:55:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ummle4CNqGWcTCpZAnWm7/ozQUxB21gLCrlCsrTLJlq4LP1iWsQVLG30KKL+95UVJJumc+VTFbWs+PClKVw2Bx1zYYzjex9R3rSGVupMEnIM+Ixxbsv84yGjM8KiFApPv0mGeKKHnnZrgcYSUAN2NcFdZuYkliV6KK8k+OvagpmRkMz2DedFueev5+2Qw+Pt4Do1xcr3+DYI8/+76JOOVrnl4/H9tA8ZFgAIdSGSgA95wXJuKJThS+PwcPMGKrFDJexHHCMAfsXwfru/3DNTcJMd9/dMxL+eiabM7PguHemdR+uAyw3iyM5yUGIWwSdsAoJbrB9btnEEPsWDVDnxdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBBD/Qx2168rADX0pEGbPpmi2yUYpZf1u3sdvoFcLEQ=;
 b=RXpaCkAMInjb8q1lENz3gIY07sIlkWxuoFq6Yv4XSgvPI70x9GqpNd+X9E0amNm1/Cbd3m9bAJ3PKkjiyMxUt3gtWvmEJlCMwlml0EzntUoyb1lTIZ78IQpTciHe0SeZwcUPR6+FxWnKv0ZuXdqEbFTVM3Nqt260T99klEz1lo49HFc9AYZaunKuAVrZ9UF9BIYULsj0G0gRPO23G4j/kDVeWaytfLvm5eoxAVj67+VkuqfXFm+edN3hH4FgyyIJCPkkINTUjvphXx1EKOVaY1G8I59C757W5U6WupbHuyS6PRmd6caSOaXvAIIW+nHOTjasLbdMjUEvd6TUmV6LFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBBD/Qx2168rADX0pEGbPpmi2yUYpZf1u3sdvoFcLEQ=;
 b=DD+OsvRuiSzGT4gEWRotj3+/jx7DxjcdAxEjn29ElYQMElkeZpLFzx8TtHNxjoTCvGmsfO/zgauN5RnspYNPOOSxn7kTrKM9r57zanQyuIF6xopJAQdLTNsBJp2KiKiRiFGjtgyM/cZ8oSXeqpdnnYUi2mX7HvxMsgxiagYeitI=
Received: from DU0PR08MB8421.eurprd08.prod.outlook.com (2603:10a6:10:407::19)
 by DB9PR08MB7769.eurprd08.prod.outlook.com (2603:10a6:10:395::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:54:35 +0000
Received: from DU0PR08MB8421.eurprd08.prod.outlook.com
 ([fe80::2158:1cab:1d88:ba2e]) by DU0PR08MB8421.eurprd08.prod.outlook.com
 ([fe80::2158:1cab:1d88:ba2e%5]) with mapi id 15.21.0245.009; Fri, 24 Jul 2026
 10:54:35 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>, "fuad.tabba@linux.dev"
	<fuad.tabba@linux.dev>
Subject: [PATCH v4 24/48] KVM: arm64: selftests: Update vGICv5 selftest to set
 IRS address
Thread-Topic: [PATCH v4 24/48] KVM: arm64: selftests: Update vGICv5 selftest
 to set IRS address
Thread-Index: AQHdG1rQP7WNSn8dQUOcGl58MwGmrw==
Date: Fri, 24 Jul 2026 10:54:35 +0000
Message-ID: <20260724104819.1296803-25-sascha.bischoff@arm.com>
References: <20260724104819.1296803-1-sascha.bischoff@arm.com>
In-Reply-To: <20260724104819.1296803-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DU0PR08MB8421:EE_|DB9PR08MB7769:EE_|DU6PEPF0000A7E4:EE_|AS4PR08MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: b39c87b4-9355-4805-3056-08dee97218ed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|38070700021|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original: 65qriaOeFSCboc9xqGktNBQSvzreiLGkMpAlRU1xWusASqI7y7mYY3Fw+6Tg6SHPjN19TFYCGigKoI/SCskTuJbBLpNasSgjggroCJIWRAR8ntapLl4UuP9eyUfldJOGBYF5EgEkdQvc/cj57g/AGXzJLPYpAuVjbaqdi3ccUmGgB6LrprwJj+VBzgYEdTWcxg20hxFOF4TNrZG7HheUilUVKfr/sUfx4bQb+Zu9hVB5C6Nh/9QUMuIY3Kh20ixzHLTCjiXIzMh/LfEekvRBlPHYtdGGNReMHAyNFzQXF7i8vEOX+IXkW/uLY3NJAW++Sg5bRFkSUBl4SzSthTF+aAeH/ojCoBNn89VxBXja5TrQWVrINdaUt5q3BL/ELn5xqegccPVvw/q9OZyCCTV0FjZmLU7KemBbtVz1Hi4W/Bx4cJE87Z6Y0TJT474OT7KYDtREaNYBfYGZoyUq+US13C75iOnwU3OkGbnixtcjsmWKhBlYaxjo0bUFASS3oRr1aapS+nZGXXlOAffLAiioWpZO9AAfm/c69a4JUL4IvnRdlNExZrTZ2WK55zyClm5VyDdnbJCnieHdrNTEkhP0OBjGZAff5yejuCXdGeIWvEhWMHB9BT1G4x4ZV6zGC3U+u5PCgOBUkMeV3037LnnwzNUCFUuLMg0eKSYhpP5a9pfiRsQOovzGSgdv5rPFamNfuQrNLd5/iyAiAUgv9ovA3T9qNlSkMIQr+n9HgLr/TeI=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB8421.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gDPXlE7w9AEpwHP/7Xu/p8pbYaJHPgR1ypUaLpQG78qTd+fpt8+JiTmStGu7zWVfk8/XVu59aOPujjci+F1B6RXNZia8lGLPPiMfb24gbtIfdIrKfdovTT6MRN0ZCuw9WoxUo3BIINUMmZtpq0QYu019zHTNLLOwAHdX/FAdAKCeME8Osu4ZjZ9qEmjF/z7SVsFc1u0NxorNIUR1klJJVeqKNYP8xmA9wSRy7v2EbdEIieVlFPyK4Ik/ltKZTrOiUZInaxGV9xUr8g04DU9xE6qilpOnnTkUcKP31sxa9WJuaGzDsRedI1Q4p5D0Ues3e+tunq0b79XPEGZm6SQrIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7769
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 94410fc5-cf2d-4a09-f805-08dee971f345
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|14060799003|376014|23010399003|82310400026|1800799024|36860700016|6133799003|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: w81ueSmulJ50i/cabYBGdTW3GLgauJqf5VCca28a73wVKT/xU+2rj/dQCwmMJ5BmMWyE1CCY8bD9tz/18cg3l/rt7LSWmW86la48IJ0CPQuv/43Rm4vDeFOEjJGrcxu/mrU7wLuMC7uU+t6pj0rFC7gLmhU1yXPQU2Baq+/5SPmqtCO9UPhRibCkQk6XSmGmUoFTLbBGtFAR6Vg8VURFtwfosVUrRGWgck5xHPoOCfwsRqeQViaRiovJil58qM9RNAvQAh38DF8jWByV83P0hAx/Z4Xn80Ff11CVoF1RoHrErG6qqd1ERfb7X4or4sfzk3gl92ydF0wwL0GSDWikAg4FJ1kRdq+zYkavyJiAtTsmERbaTLd7gQTKwLEiz7+v47TBNpvvyUAkbNZ101V/Or/1kZeVWrsDopwp6OLIgwvRJArZdc+RYKdI42t7fnFjE3geB5HW851bVpVtjvVLZmBg7GIt5TWxLyPYQzs4CRX0CUGeEQYmAau4QnCvq067jt3ahKI86MwOmoV25H9FwHHNAbmnZkmj9LIsRISDPtHSI6Uwdj5gigiwtfTMoNK4EijUAZyy8RQXaOsG2iumNVCXuCrXtMJUcTSp/3tstsGm0nnc6PowXXoOVxL0M2xYxI6CYOM4aBVTeL4AXBpc8DMlRjcnL87rlseHCxQBxOJO4KvG16LEiX5aJN9sqM14w81a0q4NAc1NUTwg6w66AA==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7EkHy83jcE6LhyFjrpGnUZieeWbHi94sWkqVuwtIUQsDQ9azoyIrXTnIZsQcSMRv28j79yor2X2ga5ekKVhVdcT1MJyvo6IEDcXU244eiGgPRUEeFWLjXNFHGGOVZsyXtbSqaEp+UVQQWUgsUNSqc9/ID9ImzOLdLiChVnHlei4dVT0CzE0nMBF903Ocu5cK688/75LKDgs9hqSaOOX0TIS3pnLvwurKpNyRmIkUhfIslFRUTln00tXajTs4W9yfcyHeAIz9/BTwewolWqi2itKlw71nkQcgQK47u2xeKkOQFV6LhkUKjIRwSQWtr8sYDoGmy1u0SP332q+EeqWqy27NA2+estrx9MHMJU0GnCg6YvPcHXcjaieydRZh0Hnhiw9SQ6M6Oud2g0tw6IQVKkCE6r9UMWo3SirLukipsAicdDQ6aTXqgxrdvSITnUT5
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:55:38.5951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b39c87b4-9355-4805-3056-08dee97218ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_035545_682214_E38CB183 
X-CRM114-Status: GOOD (  13.19  )
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

This selftest was added before the GICv5 IRS was supported in
KVM. Therefore, there was no address to set, and the specific UAPI
didn't even exist.

Now that the IRS is supported, and setting its address is mandatory
before VGIC resources are mapped, set the emulated IRS GPA before
initialising the VGIC. Running a GICv5 VM will fail if userspace has
not provided the IRS address before the first vCPU run.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 tools/testing/selftests/kvm/arm64/vgic_v5.c        | 6 ++++++
 tools/testing/selftests/kvm/include/arm64/gic_v5.h | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_v5.c b/tools/testing/se=
lftests/kvm/arm64/vgic_v5.c
index 96cfd6bb32f6f..19039a8940568 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_v5.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_v5.c
@@ -100,6 +100,7 @@ static void test_vgic_v5_ppis(u32 gic_dev_type)
 	struct ucall uc;
 	u64 user_ppis[2];
 	struct vm_gic v;
+	uint64_t attr;
 	int ret, i;
=20
 	v.gic_dev_type =3D gic_dev_type;
@@ -116,6 +117,11 @@ static void test_vgic_v5_ppis(u32 gic_dev_type)
 	for (i =3D 0; i < NR_VCPUS; i++)
 		vcpu_init_descriptor_tables(vcpus[i]);
=20
+	/* Set the address of the IRS before initialising the GIC */
+	attr =3D GICV5_IRS_CONFIG_BASE_GPA;
+	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
+			    KVM_VGIC_V5_ADDR_TYPE_IRS, &attr);
+
 	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
 			    KVM_DEV_ARM_VGIC_CTRL_INIT, NULL);
=20
diff --git a/tools/testing/selftests/kvm/include/arm64/gic_v5.h b/tools/tes=
ting/selftests/kvm/include/arm64/gic_v5.h
index eb523d9277cf1..c388df8f2a2b4 100644
--- a/tools/testing/selftests/kvm/include/arm64/gic_v5.h
+++ b/tools/testing/selftests/kvm/include/arm64/gic_v5.h
@@ -10,6 +10,9 @@
=20
 #include "processor.h"
=20
+/* GIC component base address is guest PA space */
+#define GICV5_IRS_CONFIG_BASE_GPA	0x8000000ULL
+
 /*
  * Definitions for GICv5 instructions for the Current Domain
  */
--=20
2.34.1

