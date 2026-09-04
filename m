Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00601C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eLQGxL2N3KP158+wLhb5lq11CMqWC1nwCK+l7fRn6A=; b=0c1BxC8AqdjyGqHRcDubyM+wL/
	Bs0GlrCk2PZ6cZJppwJTAghSyDVtwB9gCR9oGsdHKtnca1Oi9QAZ1P4GCdR/UgNzYvVAzhG8gmCgG
	SEA1H9L/UzuuC9gb2+RRO+nw7I2Z/15RWj6KJEmPaV0sPSvyjRyHUY4VJNOkiBJCQFQ5DPNjwNrh4
	WeVIz7O9ACkW5Sc33lYA0q85wC34oXT2epGaf6OA3QoEofg6SruMYa31GnusKvchJjz/OUOaNwFAy
	eRPUxM/yHXiWoRN4WGEZr2BjhKfPacMNKPpIzbrzAmMRXnJEIbX8eZ/EFWnby8Cg1q1fBr0ucjaqt
	4mOdFa/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SKd-00000001tDE-3dED;
	Fri, 04 Sep 2026 11:43:43 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2SKa-00000001tBK-48EJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:43:42 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=zN4fiaPFBFZnr2Zej5Yipr7VyM+oJcOu+7Qoo4h7USPH/avoZoqs0tNMU/NEkOWEVKiyJdcyj92tv+Ollv9h5LEEkUvS8Zd4rY5Uuw6V5Z8I4EtgZBCuPcm0EszLw5B3C/4WPoI4TPT65+j6RrsWAsGhIc5K7aMTchn5LQldOXrYEmz+zAQ/xQ8XZg6dVGHa8NibcB6rUuYhT3OZ//iww/aha/DydnsMXy0oJ8XJw5KIBvckj1vdw7pYDt/wzQLkErk/mT+ydMZ8Ownw/osfNy30kQXuwvHfsiKpZa89T5fUrRrBZSTYaSyaRk+SAWGbnCug+OVj5xXvaj0ZwQu5XQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eLQGxL2N3KP158+wLhb5lq11CMqWC1nwCK+l7fRn6A=;
 b=pV3/vL/1QcW9iXTDrtCxOpMGS85f2eQvuJ+ER+ap9JzMrJ2xmGuBH+dHo4tsfOn+9Z7oUuOWnYq30Z8SpKkuQ4IJkIPbozmKptk36Xl8m3wGxxYqxD8PVxk17nkn/ddeRl61pYn6fYpgSad/SAomi3yGkNdaiHQFmkb1pWKre93LrAx4M1ZFtkjFHgx6nEEoQYLrqKX588Lm7aQGbr5EDY3eV8GlL2xDRQrGbuMz4aIGx9cIwOMlUZBF4F+ykuI/n7/viLQlGUg2p5DKlDY3yUeiL5u/vfFpCjxVVTdmiouSBjoT0f8xNsBV6I5XfABIHHRpc3vWlYW859TvHAsGog==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8eLQGxL2N3KP158+wLhb5lq11CMqWC1nwCK+l7fRn6A=;
 b=XBY4PsmSoDPAI+i+DIY5s9StwWk8HYXjF9FxHnVyXwlmqHIpDysDuhqpUViFh5xjmgL0g0AlgbRPe2YZEekO4M6YZl5v1RGlldQDEZFa+CANO+vrE3RDQg6M2tCvDd4eHZBZae1pbSPIMX54+C8eqqJQg1jxuUJN0XMBtDZsh08=
Received: from AS4P192CA0054.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::14)
 by AS8PR08MB5943.eurprd08.prod.outlook.com (2603:10a6:20b:23e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 11:43:31 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::60) by AS4P192CA0054.outlook.office365.com
 (2603:10a6:20b:658::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 11:43:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 11:43:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFD46wU6wMSMFvn6MrdYKsJoZW25T4EKYr3Oi5gi9ErDX5wVfIOlz3yNKdd5+FKHMuEzYE+iQ1eJNaqy2SmJD/9OOtxdyDypk7/AnUVsp3uDG1i8xB/Zj0Waun9sSWTLw6IWMNd/XtchZ7aj1iaBt9rtCnr0bKk+dn0e2g3yC+12bkFdFEzPwdvQkwPobVCC1EcetD2/qlAi7ege2kZm2BFZEB2ZqSqCYEwXoFg8gScjhwytc9Q0d5ZrkVZ9xc+sXGyes3ByEj835XEs+yaiU02XTxCIhgRgZsaGSg9Q4o+CkWpEzlIBKoQYER4OI/MmERldnaO+k9q2LlqMlGtWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eLQGxL2N3KP158+wLhb5lq11CMqWC1nwCK+l7fRn6A=;
 b=FFOiDKUuHePfiEOsUmsnK0lywAmSo2BNe0lTqtZKc7wF399rdoeEbo++UndTiDsCptTtyZ0m5KYn7/ko7eS3MWKfp/EQbOx5Cli/ozpsgKaszZFP5eHMyLIP/mLvOmWotNSfacAn6Y6Hr2cTCksjnXKmRWU3TLxKLGpaeUrpe6Fchn2RVliBSlyGGM8hupPKx+f49XE6oQ3bTq3WS0ODpYQg/5NAGkTFgZDCAXlRv2TxjM7BSq1X70nni/Thx8aNv0oJzMSy9G47v8OQquByaCo+y1LpGO81kuGubB45wWEPKosG9zkk4uC10wM/DBlpLJRbSRTwAoM2Tkqlv/ujqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8eLQGxL2N3KP158+wLhb5lq11CMqWC1nwCK+l7fRn6A=;
 b=XBY4PsmSoDPAI+i+DIY5s9StwWk8HYXjF9FxHnVyXwlmqHIpDysDuhqpUViFh5xjmgL0g0AlgbRPe2YZEekO4M6YZl5v1RGlldQDEZFa+CANO+vrE3RDQg6M2tCvDd4eHZBZae1pbSPIMX54+C8eqqJQg1jxuUJN0XMBtDZsh08=
Received: from PR2PR08MB4889.eurprd08.prod.outlook.com (2603:10a6:101:1d::23)
 by PAWPR08MB10898.eurprd08.prod.outlook.com (2603:10a6:102:46f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 11:42:54 +0000
Received: from PR2PR08MB4889.eurprd08.prod.outlook.com
 ([fe80::8bda:5986:a1f1:cb7e]) by PR2PR08MB4889.eurprd08.prod.outlook.com
 ([fe80::8bda:5986:a1f1:cb7e%4]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 11:42:54 +0000
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
Subject: [PATCH v6 17/49] KVM: arm64: gic-v5: Introduce struct vgic_v5_irs and
 IRS base address
Thread-Topic: [PATCH v6 17/49] KVM: arm64: gic-v5: Introduce struct
 vgic_v5_irs and IRS base address
Thread-Index: AQHdPGKGkp19URwT6kOnA77L39rizA==
Date: Fri, 4 Sep 2026 11:42:54 +0000
Message-ID: <20260904113404.4051341-18-sascha.bischoff@arm.com>
References: <20260904113404.4051341-1-sascha.bischoff@arm.com>
In-Reply-To: <20260904113404.4051341-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: PR2PR08MB4889:EE_|PAWPR08MB10898:EE_|AMS1EPF0000004D:EE_|AS8PR08MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: b0da76e0-a7b8-4849-763c-08df0a79be60
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|38070700021|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original: ERf5yUJSk2T873Z2qIS49X4D33LBkjbzRUPFZwUW/3f19qHVkTsuf6V+CvJcmF+dFGaKLfJBwiaMR14aTZDXTXRvjD0D3ddhyEVIUqz0aubxWifouI1t8+WE9LJqV/YRhqwDeU3KO/jEjh1O1XQcAVPkkV+qZGjSHYVApKoyefCGofiKAH+UR6c5dNElbUlhNGBa29V2ijZDM7N9W424uoDtXtWH4eveDxlPy+iXP1lZ+rfdv04BPrbmUI0gj5GJW7M+IJMAObDzbGpLycvDJ9jncYnYp/rwSuES6gGbBynD0u8ArOqw0aeIMXnJzWSTT/NXFiLeP0ZbEl1g8rokePgUgaL0AVt1eOCo1Ylf4a46TMtPXcVJzUV+LJxnupRQfkZQ36rULR9GdhtFlCV3PjqKc9JOVJKCC/dc9UhIWGUKx6nR2IUNCqVod/9nB9Cr8nf8ukde04ZUhqbat5S7lxeQhlxK8wHtHB8/UECm5bRBvSxHec8qX7SfiO9GlKaWcrtizz1F3FNi3CxNujCsunbaadIGDTtxIQBTw1E+66WyUP5T5IM8LxeVu80boWEGNyomVDso6wVR0rwXBhgqz+WxezJAt7CeXmMjbhGeZwk/cnXwYxFE/mqVekufzuQhW7jIT/PrA8TnU4psZ2w3rhzCpRfLans0KrffdcnBuZ2lYEpToJO8T6rmrGghtCqUMl6dPi5Hl/PO6W0JK6qG6Ve6LkPx/A08/YoToz+R14s=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR2PR08MB4889.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(38070700021)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 4skvrc9mJQcxOgeaVJXpHYZs79L1zMzsEIDi8xg4Gje2ehiy8gc7aHtP0x0vAdivLMM+mRwVF5k/n7QYatNy7WyUzrfbJVSyW+Yow+gVmbD+FzBbNELLN5BLaF2cHs+55VCplYDUacgoxmh4esAJvEV7RAHlDWPfgUbP/1sfd2UB0KLL2yDFcKy0hzbQxO+i23p2AO3opKHD7kT6cAckjm6O2Q5R5O4mymFaiU66wALXBddwRW/eBx9GjA7PsEbqWr8vnJnRtimrGPjs1rgkVZaC8QYGEY8SI4GFkhhRe7xj9ld05NfNlG+2F0Swx/9WSik1L4HcThcf2NaeTqe56A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10898
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b38a9a32-45d7-4010-3326-08df0a79a8b4
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|35042699022|36860700016|14060799003|376014|1800799024|10067099003|56012099006|11063799006|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: DM/bvGGcSGVPlQrK2crkjzIDb0GwN9ZYxdTv9UoJJmS0J/stTyczoOuDxWZXo0eeD2U/6U6pJwE9lYWtcNz+yozYkrWWdJ5S6SYGxGqJbW5y73o+qqwKh0jhb7rJY0vbnnXcUfmKoi2CUyEQE2iq19RXcoi3wGDDivNQICPSAUnXpRt3SRyvtuNKjyPS2Z4W9zOv2Hz0NNCJRcEYREID7yvmS4132o7aVfnVP13YMQ2SiXB5ZlNgv5A1Yan1jfDio3QNfx9VyolzQ84yemdZz1YWF477Ou4dvYztKaXoSQTB/fdyGZtClfhoNRgB5O/w96ruGbKyjSveJ8gme0pi+l2VOl3SoDhPzEPczvd6cjWTH6NeU/FqN8AJTwikkWUEuKPlmy7+eprh53FHoC+lmuiuj/PhleeicSxdjfkONFfEhCvcc+yPCCDz1zbsYyM9UmDNFjnvjBZDbqFu9oorA31FxBrrJhSzVAIWoiOdqo8ts0qsW4ngAMW3S+gYxwpf/IClHg9nZaZo4XXaWlgGHOHDOss5azygO/rkELK5NQwNYRoqMlCNyTTkPTHiOHnxVtYuAo7ktfe2jEa9StAB57OflOaeTA0fPKobJ415jBY9dapwW0gXSPDsAU8LdndGrl1FbFztZotbvtem2veGjEVLc/CGqIqg8zrV+oDVxys=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(35042699022)(36860700016)(14060799003)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: h5Z/clmT6hXXbSTjhMVlWO/yXMM9F/f88TgxQ9hKS24JXHkhVxH5BzYiiThSphaaRdIDDNMbLwe68Mids8ELtjiihE9iv/c7OXMxI5jyQdOqDvC5byXMHo++M1CW1+n2JdBfELe1lpEX0HWf9ek8U0umoAN0aKcbqHxuHDzi92L0CiZ5j5f8SG4kSXhMqloEPPz5vcF/U8myUSFOkaBFnxcp2qFlIW2Txcc9lIgG55qFh4f2LyQITGS0YxjuoyO+Qv604n97axrhkOGxAKmqCk3fZ/NZXcYQkymFlcqccxdysrtL8GcaHIyfdHYmAnsnf16n3hM2fwGGorztQgdqSEoR/4erbvSLHvjbcj+ykwfzZeLOmFRM4MGyCLV9492HTLGLHXMZgMfwAosVYXhePVdiG2Ko+/MXu9LgO9A9Oc/Vt0SE1pqNOSd5QnsqU4+K
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 11:43:31.0273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0da76e0-a7b8-4849-763c-08df0a79be60
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5943
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_044341_640717_F633A03F 
X-CRM114-Status: GOOD (  14.67  )
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

In order to properly emulate the operation of the IRS from KVM, we
require storage for the MMIO register state. This change introduces
struct vgic_v5_irs, and adds a pointer to it to the struct vgic_dist.

This new data structure contains the storage for IRS MMIO state that
is required for emulating the MMIO interface in KVM. This provides
persistent storage, and a way to track data across MMIO writes, e.g.,
selecting an SPI and updating the configuration of it is two MMIO
writes.

Note that only a pointer to the data structure is added to struct
vgic_dist as this new structure is very large, and hence it makes
sense to dynamically allocate it and just provide a pointer to
retrieve it in struct vgic_dist.

In addition to adding a structure to store the MMIO state for the IRS,
we add the base address in GPA space to struct vgic_v5_irs.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 include/kvm/arm_vgic.h | 86 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/include/kvm/arm_vgic.h b/include/kvm/arm_vgic.h
index aadd47c959b98..b62ae14c6a06c 100644
--- a/include/kvm/arm_vgic.h
+++ b/include/kvm/arm_vgic.h
@@ -398,6 +398,87 @@ struct vgic_v5_vm {
 	bool			vmte_allocated;
 };
=20
+/*** GICv5 ***/
+struct vgic_v5_irs {
+	/* base addresses in guest physical address space: */
+	gpa_t vgic_v5_irs_base;
+
+	struct vgic_io_device iodev;
+	struct kvm_device *dev;
+
+	/* IRS state - used for registers etc */
+	struct {
+		u8 domain;
+		u8 pa_range;
+		bool virt;
+		bool setlpi;
+		bool mec;
+		bool mpam;
+		bool swe;
+		u16 irs_id;
+	} idr0;
+
+	struct {
+		/* PE_CNT is populated from online_vcpus at runtime */
+		u8 priority_bits;
+	} idr1;
+
+	struct {
+		u8 id_bits;
+		u8 min_lpi_id_bits;
+		bool ist_levels;
+		u8 ist_l2sz;
+		bool istmd;
+		u8 istmd_sz;
+	} idr2;
+
+	struct {
+		u32 spi_range;
+	} idr5;
+
+	struct {
+		u32 spi_irs_range;
+	} idr6;
+
+	struct {
+		u32 spi_base;
+	} idr7;
+
+	struct {
+		u8 sh;
+		u8 oc;
+		u8 ic;
+		bool ist_ra;
+		bool ist_wa;
+		bool vmt_ra;
+		bool vpet_ra;
+		bool vmd_ra;
+		bool vmd_wa;
+		bool vped_ra;
+		bool vped_wa;
+	} cr1;
+
+	struct {
+		u32 id;
+	} spi_selr;
+
+	struct {
+		u32 iaffid;
+	} pe_selr;
+
+	struct {
+		u8 lpi_id_bits;
+		u8 l2sz;
+		u8 istsz;
+		bool structure;
+	} ist_cfgr;
+
+	struct {
+		bool valid;
+		u64 addr;
+	} ist_baser;
+};
+
 struct vgic_dist {
 	bool			in_kernel;
 	bool			ready;
@@ -475,6 +556,11 @@ struct vgic_dist {
 	 * GICv5 per-VM data.
 	 */
 	struct vgic_v5_vm	gicv5_vm;
+
+	/*
+	 * GICv5 IRS data. Dynamically allocated due to the size.
+	 */
+	struct vgic_v5_irs	*vgic_v5_irs_data;
 };
=20
 struct vgic_v2_cpu_if {
--=20
2.34.1

