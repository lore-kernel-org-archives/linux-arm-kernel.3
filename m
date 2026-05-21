Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9711CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6JGLvD9UQ4moaQWuc3E9Lr4qsKrEi84oCm6RUyH27g=; b=EGz3ga6Fu7BpSIiYggdLviud8S
	R97t2bO5+Othddj60SO7LcjH1AhnNM4LfvvmGdtsVM38C8wWkVAoGwjxCv/mXV4eEy+Yzicms44Vg
	TI6wbtCImgzA8Rtpyz/TBmqEtraXLl14dhDz/sUOjPpL+/2u820IO4fw/Jb/sHHsId6GSCNZo5EIA
	06Ung/vCEpEhvZxKh5KBSGwVtOU7EpLoplmtc5b4Nf6I9S4GMWVBE61X0dnL6BHphNkhivI9AxQn6
	u/LNlR0LITPIRAnkgvYNHs7bveUsLoQ8USNQgf/Mzmg/3p6620GpynbL1v9wcoVV7ZMVMszmkfAOg
	+MaoDBeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4pC-00000008BOO-1m4G;
	Thu, 21 May 2026 14:56:38 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4p9-00000008BNC-3pep
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:56:37 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=IvZgWP2X/aU5YCozLuLkQ/HGRpx8ly1Sv99N7dEY2XCIVlNIqTI+WzoWwuSso/zxyJcqSUiHMVkYkcZIcIBBQ20goz/qmMkIAVNAYiTtYNULE+9xxNw+4oOB8+mOdyRfiugwdqTW7BrLNsoQ3YbvZxnW9bJjMRVxCEsBFySm8hh8w7Kudydrw+7rHHkJ783hKN/usyzf5mxvGivFWNAxtvoN8aVbUL2hlM4BoyJB6y5BvNBQ3gBmNEoIHQdATmwvqVbm0Kba2DOZXIEj5gC6J2edrcd+G1a5LClmovimnDJtocbnirIIK9eUsB9a+1RpU0wB89fnK4wjoU0/FTSrcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6JGLvD9UQ4moaQWuc3E9Lr4qsKrEi84oCm6RUyH27g=;
 b=LMBcl7LgDVifOkj1P6bKwoQUP8iR0TCdArds3wyRqCx7K4NJubp7GW18kBNCyBaSvS5EVts2Gt11hzFddYsfEa4V+q4O6XB/jmfnnfbaicE/xbXkS67cXaZq1z0RoTXukPkggYGQ7vYHMfc39ThWdJl5/v7cGn+3VT9qLgIG7DWEzoIKH9VYhNCY5hZ4Y8HmQrv7gluAOKIC1+STcJuIQ0+Fbml5ayKQWxKmi6qpKUmylCnOCXyPj+/xWcQ1gdzZY2cDzEoMC0NKYPZvyHJRrJOpEKO69KiFtiVnCd8bbT1Roi3jivWl4wTW5QIawMol+dvxEZmMvLK+n2dpwpHynA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=fail (48)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6JGLvD9UQ4moaQWuc3E9Lr4qsKrEi84oCm6RUyH27g=;
 b=SR2dn/lfVfosKDFyXfQJXeHqPX1q/ChcXKHf7eBCWE3JXiuwF2ABfkiNWNTXJ/v9Yxc8evxvXrjjfhbfnahkpzuEj6gO33QsXMTo6bn3lvg3sPQO8/2dIP2CACP/F3tXXa268Ul96HrMDhfIWWYjIcvKAtapobhQyMbKyQ6W4D4=
Received: from CWLP265CA0520.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18c::23)
 by FRZPR08MB11098.eurprd08.prod.outlook.com (2603:10a6:d10:13e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 14:56:22 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:400:18c:cafe::6e) by CWLP265CA0520.outlook.office365.com
 (2603:10a6:400:18c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 14:56:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.0 via
 Frontend Transport; Thu, 21 May 2026 14:56:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4pJZhyc8g/By4bSXNKibOZgacBP/2unapukY2mcnagndKy8a0Eu1EWfynhObT06+kHMPa1gUddckCskRV+mKEPTAV/G+S3aJTnI60nce9xwszdpaPdHmFvbQ+80mkVrQ7F6CeJbpMZ/JrNDfOLqsZqycFpeYMLDjJBxgeaCTHBRvhATDRTFyztTAiqfSFrxTc1y5e+dNmtkjL/A8cZILbbv48cFYuNqv1hZaI5cCpXx8u6SKwBFhO+Q5nrdf3Ou8Rg+FSTThYJNcat6HWnSDPkgdL4uKfXc69doTg5QsL0+bd83l/GLD6VaN4dUTfXn99vFA0kzKuxnlrak0CftHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D6JGLvD9UQ4moaQWuc3E9Lr4qsKrEi84oCm6RUyH27g=;
 b=dkr878vkC8Gtl80r+1sr7468J5i6ax5oqk9+05PYre4UiJ/n8DqnXJHEhzEVKljJgOHNDQD3VlydByzvekKDpawKRiXd8JaBvhmBT2yoPEeBhyV+dMVMBtpVUs/TgMd2mGR78CDeXrzjDJ4QTvjl7VbTQQ/bpqnCA8vPSj8ofVq78L5fw4lJ9xv8v/zPwZBGIM0WcDPFMzRA27zXCTZWuggSpQ1qonc23WyYV0UAUfW/y/W+m9OqpO0cJ0+nZ9Pnvk5gH5FaQlFhKv2iTKXzt1z1JhsND2X7EfBMzrg9Ji8r8oAEPk23aR3WOzY0c05AuyTCHRUFhgyiHm/5/w9Gvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D6JGLvD9UQ4moaQWuc3E9Lr4qsKrEi84oCm6RUyH27g=;
 b=SR2dn/lfVfosKDFyXfQJXeHqPX1q/ChcXKHf7eBCWE3JXiuwF2ABfkiNWNTXJ/v9Yxc8evxvXrjjfhbfnahkpzuEj6gO33QsXMTo6bn3lvg3sPQO8/2dIP2CACP/F3tXXa268Ul96HrMDhfIWWYjIcvKAtapobhQyMbKyQ6W4D4=
Received: from GV1PR08MB7315.eurprd08.prod.outlook.com (2603:10a6:150:1e::15)
 by DB9PR08MB11461.eurprd08.prod.outlook.com (2603:10a6:10:608::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 14:55:19 +0000
Received: from GV1PR08MB7315.eurprd08.prod.outlook.com
 ([fe80::c249:1aed:a4c2:4193]) by GV1PR08MB7315.eurprd08.prod.outlook.com
 ([fe80::c249:1aed:a4c2:4193%3]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 14:55:18 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: [PATCH v2 18/39] KVM: arm64: gic-v5: Add IRS IODEV support to MMIO
 handlers
Thread-Topic: [PATCH v2 18/39] KVM: arm64: gic-v5: Add IRS IODEV support to
 MMIO handlers
Thread-Index: AQHc6THX5fLBl+uPPECrM/tbMbFwXA==
Date: Thu, 21 May 2026 14:55:18 +0000
Message-ID: <20260521144846.1899475-19-sascha.bischoff@arm.com>
References: <20260521144846.1899475-1-sascha.bischoff@arm.com>
In-Reply-To: <20260521144846.1899475-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: GV1PR08MB7315:EE_|DB9PR08MB11461:EE_|AM4PEPF00025F98:EE_|FRZPR08MB11098:EE_
X-MS-Office365-Filtering-Correlation-Id: 24839864-ce48-45b9-81e4-08deb7491f52
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original: agEA3Ohfnn77yZ+J9LmQKItz2y3O2YEPWWK/qC+OcMDKuNCeoUYjd66nb1EUk98J/esuiKcqS7iL6WVKeT8PPqsFoLlySkxiXdf9V2ErV/VkmBnX+I8Luwo69nGnJF1gZrscsahjkc/I1n24ofAhXZsvF/gRZn7RRimSZu4DPW2Yn0+Oc5T4/4tBPHoexiYbGBuWHm19aylFemflk0CkdLOBQuc32yNZLUVnBIZXw+NGVYcP2pJZEzM8tZiDk72fecp/VBpsnaz22iJFkamdksh3rT1jMT8vuzWKKhnw2qFfZ2asVgHuiI4os+P5HoL3xGk2h7/OEjwVceDTo0GCTChIZNPtUWT1y4xkKPYREXdk6Rg65ckvFH7u3PuW/SoD4vkOk022RB9kAT8tH5i5VdAvCJHzqnF6ixexsH4Oh0NQlsVJ2Fz1+t0jTGAHIwvuhus8u5FVBAhlh0dTAU2f4ey1G892RQ2+j7fv/zmXdoZHF5ULemog3d4HAO4wEENI2vAg3BcCzTf5uemFHZ18R0kGIlC3kQt/5sxeaPApyDs2d2RRDVgYwYAdcK5q/2FWHsvutW9d/bi40h8SlffK+MtMVfkTv5UXhJlWoToz0CU7xa3ZTBornUcQNrQhJWV76hs1u51/T5pBBfy+xLmpairGLFHUrwaB2wcPagZe0XYxT1vIjuz8XaAlNXbhKh5HONcsqRzKmOllvZBISihDzSJQYMCrHSP3yUQ9UeQJjeIXQa3KPXDTUrfoCxqGzoRG
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB7315.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eET+9SCTBUGaN16JNZUwCXnzC3cH1SQXRWZHeBmi8G+Rt6YWfF7XP0fehBZjSBVtpXXnTxMw+2nWC26JW5JrcG0JO2A20r+h3LLdRROG4EduYwiTq6MdEx1KYSQv2+Sl8hRUGDg59rdvzTlJUvLj88TZ94EL8cEVTZEbxZQJxtEj1G+z6mNuhZNL8oL1AO8Yrc4NnBLyEqb9lu2kz7KEkKkLuP9s/nQZkYLdHM/c5vFiRLoMHAdImqI6kSKFPQTzpmdLUOLwynujS/MNXuJnOsImNP12ukmT6N+fu//Wp3ouuvC6yuNSxavTBtLIXvnxG1zrmOu3T1y1o92cZ4u4UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11461
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2f6a2b55-b0de-4684-e5ea-08deb748f9b5
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|36860700016|1800799024|376014|82310400026|35042699022|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info: ARTj7BDtTvVWMMjG2QSL4Oge6yM35pBF7ExPAOnxUYjfZG8vmPegkbdcLlShGtXxmtaKwSNi3RU+hNAX9pToqOugSSjxcOuConPx1/0owUh4zQClwVtlcVMTMkCADAjRTPFDAryGEZ5THO2LZ/QXNb7O8KDQvRftzfyu4VJfEXxcShqDsdrAmN0Z1w6s5TO27npk91PlO1hWbJehjhSr5RzJLVmQ4odh6pQfyceYnNKWoM/tR7EI72dFRIn1mjlYPoo1MFAIDpboca+fG+Lre6He3yRz1OvSWsMGzfMBK5JjQ7Qdq494hNz3Sopp/I9hFrXiYO2HIvVYSwiViGA4EGh8akjWJbHLbEXCV/gUxvOVUlWT6dZcUpuSaO0dJtNsy3rfAZicUf3heDCiJE7Vcjk4edX8afeBDLe/OJcquPiCnMPexUqkipjrGtrgUFpjEo0qrZotdiWXQycJaTbCWa6vbeFFaygscVzROMFfwpKJQKGJxGEnhq4M+A2m0IWKviS8vV9k1IN6DoCghp+XgW1Cav8vIM04r/pewlP4qysHNP5PYwtYetVolUUtKT3aH3jH/dGYU6SBL1iM+vEZz0ygivVrEdQO9st8YxKvolEt8Oc14cCjFs7qaFtYOuPuEHEvAmciYPKkZlwL6uqbu/INZqwLUUrD3vwxVUi0PAnQKrajwFK7RasxYjrkUwBfgYdQ2Poa3KEPYjDYVf3gTQ8ZDTj252rcWEh+zSpALkA=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(1800799024)(376014)(82310400026)(35042699022)(18002099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zWYyZB55ss/nVCAsFi8f9fYHQX8+NHp4OnJ6MZpM2Kdj+7fR6FEOt3G3J4BqgyX3FEiq+JxMC3sjq96sBA7xKxOGMek09yo4WWaB/rPq0meC2UIVxAcrFf716bHZv/dDvAyYIhc6r+4ongtugeHG2BfSazX+DKQRDEYG/71IVAh6dyECTHQg3SOaB4lvMEoBveIzCm6VFN0tVaSaQO1o0uKMC5/P2D5bmomw77wA+0k2S8HSXpiyCpVLor7BNouJaLyS8OnNE/bQRQyVnLJ+WWUzdPftfZCoI7V5oe43Tipvsugy6OFgyhOBZ0kxBIH1ImPpzQEGjoJL1NtwjAkEY78g5dN/cw6u4OYK955gIomgszHpKZpoF2TZOMggWcX2o3bxdOd9CAS45pJ6gNM6O1QyjqBGM2XL47DCvKzmsw2+mLPTcJdBcwi45x3fVQYc
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 14:56:21.8291
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24839864-ce48-45b9-81e4-08deb7491f52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_075635_956982_ADBA0A4B 
X-CRM114-Status: GOOD (  14.56  )
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

In order to support proper VMs (that support more than just PPIs) for
GICv5, it is important to emulate the GICv5 IRS too. The IRS includes
an MMIO interface which is used to interact with and configure the
IRS.

As part of providing the emulated IRS MMIO interface in KVM, extend
enum iodev_type to include a GICv5 IRS device, and extend the MMIO
code to handle reads and writes to that type of IO device. This will
allow the creation of a GICv5 IRS IO Device in KVM.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 arch/arm64/kvm/vgic/vgic-mmio.c | 6 ++++++
 arch/arm64/kvm/vgic/vgic-mmio.h | 2 ++
 include/kvm/arm_vgic.h          | 3 ++-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmi=
o.c
index 74d76dec97304..fddb9da0403d5 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -1065,6 +1065,9 @@ static int dispatch_mmio_read(struct kvm_vcpu *vcpu, =
struct kvm_io_device *dev,
 	case IODEV_ITS:
 		data =3D region->its_read(vcpu->kvm, iodev->its, addr, len);
 		break;
+	case IODEV_GICV5_IRS:
+		data =3D region->read(vcpu, addr, len);
+		break;
 	}
=20
 	vgic_data_host_to_mmio_bus(val, len, data);
@@ -1095,6 +1098,9 @@ static int dispatch_mmio_write(struct kvm_vcpu *vcpu,=
 struct kvm_io_device *dev,
 	case IODEV_ITS:
 		region->its_write(vcpu->kvm, iodev->its, addr, len, data);
 		break;
+	case IODEV_GICV5_IRS:
+		region->write(vcpu, addr, len, data);
+		break;
 	}
=20
 	return 0;
diff --git a/arch/arm64/kvm/vgic/vgic-mmio.h b/arch/arm64/kvm/vgic/vgic-mmi=
o.h
index 50dc80220b0f3..38ed730d68ac3 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.h
+++ b/arch/arm64/kvm/vgic/vgic-mmio.h
@@ -217,6 +217,8 @@ unsigned int vgic_v2_init_cpuif_iodev(struct vgic_io_de=
vice *dev);
=20
 unsigned int vgic_v3_init_dist_iodev(struct vgic_io_device *dev);
=20
+unsigned int vgic_v5_init_irs_iodev(struct vgic_io_device *dev);
+
 u64 vgic_sanitise_outer_cacheability(u64 reg);
 u64 vgic_sanitise_inner_cacheability(u64 reg);
 u64 vgic_sanitise_shareability(u64 reg);
diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index 25368c5cda5df..4d930a2651213 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -323,7 +323,8 @@ enum iodev_type {
 	IODEV_CPUIF,
 	IODEV_DIST,
 	IODEV_REDIST,
-	IODEV_ITS
+	IODEV_ITS,
+	IODEV_GICV5_IRS
 };
=20
 struct vgic_io_device {
--=20
2.34.1

