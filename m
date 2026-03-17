Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E195FD8746
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrRVgNPMIHtrxp57HDWMzibE3wZd0ORefuPYU1io+iQ=; b=3N85jE6XSNhXGRNTkzMZ3etcJl
	XxwgoYA0aqoDitWIqqrcdh6qPk3EeD3z9676NmHf/EtiW/INWqM167asECJ5QKGNWRVMy+g1byu+c
	dh/bQSbQMq6+wLHhdkGXxfeW/0EAActeHlXOAgORMctBGqvyqpyiNbSoazriCwwJnDn7LhAhzByV+
	NyUnY+MoTN2FLQMnBLkaRO5YXSeiFILSoNSr/ck9aN6HG8a4V2Ts6shFaRrm8mcm0iQw9JXA/rZVK
	cDquGDVEBMlGrRFx1YTBbz2yptybtaECBFiAGCDB+h84nMUIapnijlfZfFPRCrBev3adRs7qtkfa8
	FwHfPs/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Srw-00000006C2U-2R2t;
	Tue, 17 Mar 2026 11:45:52 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Sru-00000006C0n-2NIK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:45:51 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=u73ATZ7Bx6F6HqRyz7rjew2v2tFGXxjUuVKkTfDNIrIA7OjXvfIGdwi8+IWvAIv4oUdsAyAuIe4CCbiF78DL7Esowkv0GAItfQj+zN5ovHaq2RfDVjB0g+pYRcmRB5LIKgdMFE1zr7eklZl2KXwq9ZRa6uz/yoZ4RvsUOvWYVkAoFXfYwYSGXqbSv9qHuu1GnHMd5TQHDNx1/eViFowkcv1P0Dg2R+YT5v5MtsqF1sITt2Z1jO4HDAW73gqjZUgpCntGS9JYJadZSnntvX2oPhiNBEH0LyRG6SvUXi2756Zx6/4iRcUbYpAobvooCQ6WN1e9pkCTt05vq9ZVDlVf6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrRVgNPMIHtrxp57HDWMzibE3wZd0ORefuPYU1io+iQ=;
 b=VmVOwtj1ZVsdnAnKYiRSmoVpCNgo8JAUOISi1w/cAIE0XPjzrcMIzOctKPvYwUwxWsSlDG3UUGNBTYCgDYJpxFyfbjHzMUCuv2tiGYm8ey+xcIfXDSzZX2hDpZ7cPvIO5VuME8PLCj3A73oF9dtAm+jl2oqlEnuKAg+kmck4/8RpzfRGBfHb/Abqq7BPmCBDCjY1rkCkJbOgOf2vDUMaRQdh6zENknF7vWzPb8mqV1PM4F7dwUYn1TuPlDabTRH01om4i/a9FHGWJscH3LfxgW0v79A5FIZr6mLRkuREt6WDn7BzTwqdqbdPNrp3VaxWcC4s6G+3F6WOmEDyKJ1nwA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrRVgNPMIHtrxp57HDWMzibE3wZd0ORefuPYU1io+iQ=;
 b=DgriIZBZk1Rsx1EZG6PC+LfOaZoKcREGyo4TA2jQt+x0i21oG5icJvdujnaIVFiqXQCFrnAf/+AqI7EbAytsUJbZd22pm8bJNk5KY0QC0t88wo9rlVWTVR4abOp2vOv/VVHOjDdgLfeC7x2wYD7I3Pct1induoG9gF3IJtUucbE=
Received: from AS8PR04CA0175.eurprd04.prod.outlook.com (2603:10a6:20b:331::30)
 by DB9PR08MB7651.eurprd08.prod.outlook.com (2603:10a6:10:30e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 11:45:42 +0000
Received: from AM4PEPF00027A6A.eurprd04.prod.outlook.com
 (2603:10a6:20b:331:cafe::7a) by AS8PR04CA0175.outlook.office365.com
 (2603:10a6:20b:331::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Tue,
 17 Mar 2026 11:45:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A6A.mail.protection.outlook.com (10.167.16.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Tue, 17 Mar 2026 11:45:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VO+RRIyr/T5hJjnfK/fLHw5b8V26yfhbnpwhJe28af4fB3luzzlp50M056mI+Cndj42ffy1r7OyxxlpnMkfUwe+jT8E+OqmxwKmXW/RBwIjmtVryeosfPDK551ASC3gKjO3l5GRwE1ixW9W/CXpvscyttZ77rq5/cdfvpKQlZLNsx10fUppNB64bHZKQKDptgUnfeXYD8/e0QOdnHUGuCeUus0Qd8dEX0YSAwqGA5VOTT/bcnTBpQp+P8JyBVah2+Zc3FH1+huq0ZzN0IBRas6bweAilXZAY5LtnRkghEDsx2MBErRWZu5cjPXluUrycoJ2v4xMsRQvTdUtXKuireQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FrRVgNPMIHtrxp57HDWMzibE3wZd0ORefuPYU1io+iQ=;
 b=Usky4J6LYXn6CDBZd7hwyhBtSJaPl5zBzuLhNwsPTAuOh44QUnJTkU1KFNsuNbOkE1No5kB2GkRSvy98iTKxPc44uGOe5SwblIyec8HPTcKkoQ3lvtTeBPZ54qX80FqGz/R3HsaKPvC7ey6e86BtTmtan20bdPv87YCSwLIF7iI1Tl43jB2Je5a+j3REhDcSKMAxfc9J5ONH7peDTEzNO1FQH3hVuU0BErEHLOuRqDtoVHkNofFMvugr7UCfCTP4p3GrVfSx1zufkhg2xI/wmhBw1TXIDbukY5ElHJzzyYFio+lgmpfYOVb7M6AuR/9ulymynq5kvK9qnVsXNVgWAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FrRVgNPMIHtrxp57HDWMzibE3wZd0ORefuPYU1io+iQ=;
 b=DgriIZBZk1Rsx1EZG6PC+LfOaZoKcREGyo4TA2jQt+x0i21oG5icJvdujnaIVFiqXQCFrnAf/+AqI7EbAytsUJbZd22pm8bJNk5KY0QC0t88wo9rlVWTVR4abOp2vOv/VVHOjDdgLfeC7x2wYD7I3Pct1induoG9gF3IJtUucbE=
Received: from AS4PR08MB8241.eurprd08.prod.outlook.com (2603:10a6:20b:504::10)
 by PA6PR08MB10417.eurprd08.prod.outlook.com (2603:10a6:102:3cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 11:44:39 +0000
Received: from AS4PR08MB8241.eurprd08.prod.outlook.com
 ([fe80::dde1:493a:db27:de27]) by AS4PR08MB8241.eurprd08.prod.outlook.com
 ([fe80::dde1:493a:db27:de27%6]) with mapi id 15.20.9700.022; Tue, 17 Mar 2026
 11:44:39 +0000
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
Subject: [PATCH v6 18/39] KVM: arm64: gic: Introduce queue_irq_unlock to
 irq_ops
Thread-Topic: [PATCH v6 18/39] KVM: arm64: gic: Introduce queue_irq_unlock to
 irq_ops
Thread-Index: AQHctgNw8plT8xX6ekCsNH87/ySp2A==
Date: Tue, 17 Mar 2026 11:44:39 +0000
Message-ID: <20260317113949.2548118-19-sascha.bischoff@arm.com>
References: <20260317113949.2548118-1-sascha.bischoff@arm.com>
In-Reply-To: <20260317113949.2548118-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS4PR08MB8241:EE_|PA6PR08MB10417:EE_|AM4PEPF00027A6A:EE_|DB9PR08MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d21ce72-070e-4a2d-c89a-08de841ab7ff
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003|38070700021;
X-Microsoft-Antispam-Message-Info-Original: V8SDjJg2lVrAWrn6bt01wT5cukgTZIJi9RW9LWu84obCKhCwBQXz5Iq0+IuCBoI/klPATCeMzypcjprMHhhLhXE3t8YDi8sgEOcslBrYS751mSEsqduZE7xn2dn0f/TCnNmogKX8I/dEruRU4d6q/aJWpw/k8smTk9MJLIKIzuvIyJim50EgoQqTGA7Bp0iFiYPov2AvnGYyoJ/ybBTifTYOc6bBwnJRvRgvnozZnJXznJkTGbapUbg28RCVX9tyl+bY6cUZgvjIiLyVuLztX758FGPkdNwxifgpGoTEKA22HdW6XaLCVH5Ce4902aSUwxKtuMOzEk4lYI3J0Vk0bnaQ+q2uVDbEAm164Tx6AkK6PyDpLOr0k6jEjkPSg/Osvmkl19xaYdRogWjDAyTJfrn34Nqq0YbI9V6EOnSBQHQxvqX+o8YrYx2YoP36fWKXzd2M2nxJXCxb36+itttLR6vdkozeZvDKi4BNC0kbqbDItsBnJ0nI8I5nTetEMLIyMQpvrP3PjL2qNwuTFeFVmPe8Ia5nep5mmd59opMoGIOZ5OiellISdfs16HegB+YDfBngPNgG1CbHcVkqEqd40MjiwPoZSFZHzFGaMYJBYjALPuQIprmzfrJO/hanP5W8V+4JgEEMwtuZ2XNnHgePkUE77vhuR71tf/mPE304fVbSjCrFB+wqdyUfmV6W1Gg3THltcVIAGb8mHDGNcqS1ZWHXtQ3ikOVvkt2N0vqYRqx86A3+zD66sOfLViNf1+JxtfQG8U6BA0qRfOtiO7pBsf1dajF4zqzVQP/SBvNuyxU=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB8241.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SLGtc+K0ebAC/S1M8yqqRMvUM+NFA+BYXRslSEcYSGKGNGkx5anYGDTfCpID/nMXns+ZFD0pFoR3Ampg1y/r4uXjGHKU/lE+hlGWpHXf5tBtDjjcK+lrL/lo/uWAnNR6KQn4ojaeynjK22eGaHgDXojXn4luQE+/GHcHi82Jq0YQT3pSWVJ+qFEDhyzFEIlnsjLTKKRX/QVvbj/Fr+98ORQba9FxV0rSOKLQEYyuZhHSHyJ/bszikRo34285K28OKEKlax+Ox9yHkSZYJjGmUoLGpPMcAttSmwhV2BcFP5BNUxd2kOLJjv1nrp+bPpx3/712MpUKpDUuaI2t7AmFhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10417
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d917ea6d-e073-4c7a-0f9c-08de841a92b0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|14060799003|35042699022|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: dGBDkQ31MOdLrAoLnCdKQrAEuAgXueV7clfUc3885ciRwdJyVyN2AFSflOplL/okDRwVl5afMqdfpPX2Txic8GzO1qZeUfJ4jgpju+mEZOoCtLPyYipDoKqmD4V8M3uIrQNGV6dOSLGGzwP+0BlOB22qwpt+89KbHSF6pomYglKSxyCntCGqPZHjX5uNB0J8rwAgzPStJR1SApJDtHB/mFICoqRLbnSJjAuJnE5Pq+wV4ocFQJvQ5DQSadULa7MV2QMK/FdGnSLRw+F0PJorTsapj8wiDkFLFunsTQiNTl0i9/hP+hmwa3F0d2rFkHswxbXHGAGI8kgI4J39v3F+0dKALCkDURrd24x10twFUsyoT2+5pu2PDXa3p0zG/xsAUF9IzcdNXCDMoEds7epNB3yNG+yOO4K5+er8l98XqGQ4YQa9YMKyJUEq/mPA/dDh1A2597j71hTu4ki4nhfDAkGhEzgwqRAvcmawfGTzAGWe16y3Vwk2/UsUbI67lXGzZlm/5fR23Vw7+FonYJsIIEyxx0USfDVajAu1OcN4lpj4kGuNDcVus04oZesXA0VdEYQkBc5FI8wTUobwKL4BPA0ySJLAs3IPo54HbmEJb5vZK3BhpPD08hLR7jxL124txC2Zjlxcp6+GdO0h+4tnu3mkFNfXYXWKJt3BtCIaIhZGifzOWKjMMORU0wltrggJk13b3Y/CAM0VFezEftbBaQ+gGUpD9Mrj3cDEho5vpBcwVmGtvJpe0YHi/hoPrNOqiAytqe18daZ2C9MNcZupeQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(14060799003)(35042699022)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /TZsVtoUCNzoe0y9oaEvqj2porEAEmlisdKlL5lwvJjh4vGa3LdtOBIFjRV2CUi2ewD87NvCdQ8ubq9CwnvTAMhGoiRQUtMub3KC0kUvLLKee+8wcIDAOQ2oPJGEeaT5gncCODDjHsiL9qQyHjZ9Vmgf2rKoVwqMFCvknR0/y2/PHXabeLXhByt8YbDYtK31aDz20sE2WdSLFkSXACrMh6SXm8rZ0bchgkIy1P//r5uhkeexGCnnOZlc4HQPhRYwe53eqUxeqhknAT4pEqhq6KbcEi9QSv8LS/fiUd/hn2+lZ9y5pBERmn2lUSAXnuqO/5AAezzUHRkLSJcITB59ZD4zIlXvwwTIwkYHAzcB2cdMeVB0xUzxJA7ejGAdpEIVbz1wqf3UAqwm8W3C0bhhEiZOaOuxQh5nJ1pB0SJ99Oc7PLABeBb2Fnzv2E7tSxVO
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 11:45:42.3212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d21ce72-070e-4a2d-c89a-08de841ab7ff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_044550_612429_72719792 
X-CRM114-Status: GOOD (  16.40  )
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

There are times when the default behaviour of vgic_queue_irq_unlock()
is undesirable. This is because some GICs, such a GICv5 which is the
main driver for this change, handle the majority of the interrupt
lifecycle in hardware. In this case, there is no need for a per-VCPU
AP list as the interrupt can be made pending directly. This is done
either via the ICH_PPI_x_EL2 registers for PPIs, or with the VDPEND
system instruction for SPIs and LPIs.

The vgic_queue_irq_unlock() function is made overridable using a new
function pointer in struct irq_ops. vgic_queue_irq_unlock() is
overridden if the function pointer is non-null.

This new irq_op is unused in this change - it is purely providing the
infrastructure itself. The subsequent PPI injection changes provide a
demonstration of the usage of the queue_irq_unlock irq_op.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 arch/arm64/kvm/vgic/vgic.c | 3 +++
 include/kvm/arm_vgic.h     | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 6df03d0d55078..f3677535200ff 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -404,6 +404,9 @@ bool vgic_queue_irq_unlock(struct kvm *kvm, struct vgic=
_irq *irq,
=20
 	lockdep_assert_held(&irq->irq_lock);
=20
+	if (irq->ops && irq->ops->queue_irq_unlock)
+		return irq->ops->queue_irq_unlock(kvm, irq, flags);
+
 retry:
 	vcpu =3D vgic_target_oracle(irq);
 	if (irq->vcpu || !vcpu) {
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index fdad0263499ba..e9797c5dbbf0c 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -189,6 +189,8 @@ enum vgic_irq_config {
 	VGIC_CONFIG_LEVEL
 };
=20
+struct vgic_irq;
+
 /*
  * Per-irq ops overriding some common behavious.
  *
@@ -207,6 +209,12 @@ struct irq_ops {
 	 * peaking into the physical GIC.
 	 */
 	bool (*get_input_level)(int vintid);
+
+	/*
+	 * Function pointer to override the queuing of an IRQ.
+	 */
+	bool (*queue_irq_unlock)(struct kvm *kvm, struct vgic_irq *irq,
+				unsigned long flags) __releases(&irq->irq_lock);
 };
=20
 struct vgic_irq {
--=20
2.34.1

