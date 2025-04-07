Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629F7C369A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 12:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwtIsgm6+5I9RS46jfYuTDKSYr6X7KPDN7RL+HdOPwk=; b=L4DuaqJXhRAs4LU0KmZZInrSQO
	FGAbCkrxjeeE9GvTv/K43FwbY44k5oIN5mWh8/FruXaUVePGCQzkbnZRb3TFPc8PNR8Z8J4pNHA+w
	ap8+ZR5EPdxm55d/JxmiBbn6VuowkYeJNKA81qav7FAAeyc59WNx6FIMcAnOGqZFx0nrspbuZWLRD
	/rL8GqSgETJtLvr3ahIi5YP0rrYDqLyW7P8Spewx7k+Fgha92gMGnSdB6Op9D8XD3vqKUQ0zA+OO2
	CgHnRvLKRo3lAl/2b4pQ0YkyOwZLdcHyWBTD5QO9GyTtSUixFMM+3Bu14adsHoGMG3EBzbSbvGMbu
	ZZqWpffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lhj-00000000H23-1fYO;
	Mon, 07 Apr 2025 12:35:55 +0000
Received: from mail-vi1eur03on20600.outbound.protection.outlook.com ([2a01:111:f403:260c::600] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lEH-000000009hk-1eDu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 12:05:31 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=DYVNK3FpWRSuSECng2/701IQaruIP4kIKyLuOyPiYVGJvmMEwjW4634uj6nmRMgvW6/tK3UG/WhI3R34V9VGPouPGcvR9xz8zpiy7Q3uJy5QVYoNMUxrf19wPVUMGCZTmiVuK3malx37pT/8nMB4KN8otbMN7TIZJHap6fAQpLegh4xwPnJ4aIdMA5pyh9EwlGVMU4XU8OlAItv9kYlrKAZA5qCUKtd/cZ6AVjshP1E/MQmhH8USlWNl2h2EFyM8ldihZkZfJ+9dIoqZIQ0TpEoWcWbbg+3rceX6o9dDYemAY0gUEeUrHTFOO16ml08hHmS6yQ1ykNX8QERiynO9EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwtIsgm6+5I9RS46jfYuTDKSYr6X7KPDN7RL+HdOPwk=;
 b=Va9yWpnG/qd/PJfqL+HOjOlUza69KLLxcw7amxE72rWQCeVET6IqRHYl3dVhsHEKak9HCUeI+Rb0b9TS3SA2gY2vba8v2pYCyXahI6LNw6/lCVsNhJC06PtY08+b8wc+CtJ6dmzXJPtzAe4pYVZ+MmjhNTKz2avwoWXkZH+k6XiWmFYukt1R7PNGgQ3SrNEI9fpafAJyoUHWgacGCtFy9+TAcwhzYRBwDxh+U9zl+ubDXiSCeVcSF63P4PJwwZ9phDzrNIoCX8ZK6i6P1lIBf4Zop95wSimMOdTnvEW0TYnihGOOzeua0bVDgRAvTaP9b3LGq+WrOxrsdnEvOrwmZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=0 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwtIsgm6+5I9RS46jfYuTDKSYr6X7KPDN7RL+HdOPwk=;
 b=bbpsbSJoofoHJcBg9Gm5SYhCTfcrvc3vyYJsws9zMq9f8XA69/y783Hu359e665eW9fWiQtIPFyTbUK6lnNW9rMTG1uyJJvWZvmGzn+huciKREs5+4Cso7N37cLFDXH7L04ONyG7XU2ZE+qO+3hQhTMAIqBtimP4RoNClj13XII=
Received: from DU7P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::34)
 by DU0PR08MB8422.eurprd08.prod.outlook.com (2603:10a6:10:406::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 12:05:17 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::2d) by DU7P251CA0013.outlook.office365.com
 (2603:10a6:10:551::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 12:05:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.22
 via Frontend Transport; Mon, 7 Apr 2025 12:05:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9XY1B+V7JiJ0eFHZ4otMDxw58ds3nNXgfIghJktnMbN1wkRlnhB966krXNCZQxLUIUe8ARvO3vU0WkGzUCoyXKQ3gB/dD+9OjOGDHjGyCCDjinH0tNQtQjUmQA+sy8mbWylsDJIF+9YR7+06LxL5+p+ZUXoy7lC0G8QYVEhf7ObuYWssHoKtAtZs0bntMahGbF3p7a0r79sI4UyViooN8u5bU3+bmhYfIEBz5oCdsQ02Hm4dNcpLU7aSDfFFXpuQV5NmpHjyNwz521YDk9A+ZTSeDJDNSlkpoY1IvG1k0FsjDbeVId7cKU+kV64pAdOq/u5fTn4K2HGYhHhp/lexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwtIsgm6+5I9RS46jfYuTDKSYr6X7KPDN7RL+HdOPwk=;
 b=yoFob91cegmYVqBf7WLHg1UmeGzmaQT2sR9apGIEUpCz09aZhO+09hmf+MRXLgHDLXvVXYJJAOgazAddMyrnd3pS0jLii7gKFtviW40k41cJ6F9jSllRdfIPXM3owKf5e8f71Folir6Pt4MbEY+QEApdESMGZyOYVZXwyuD1ARQwfsmsxqs3jjHJ+d2dPacZN61YhwNzqG6ZeahWZ4/AmoFKxKMy/lurvhJmhjietfcZNH+AJMmucPA6xv08yY3stun1RY43oRBxX0KNnHWL1++l2dE+bjruN+bLs7IkhOQlnAmvOPE4qaq+kUfYU2uOtkSQjlH7Ds22LkXrp8Gb5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=armh.onmicrosoft.com smtp.mailfrom=arm.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwtIsgm6+5I9RS46jfYuTDKSYr6X7KPDN7RL+HdOPwk=;
 b=bbpsbSJoofoHJcBg9Gm5SYhCTfcrvc3vyYJsws9zMq9f8XA69/y783Hu359e665eW9fWiQtIPFyTbUK6lnNW9rMTG1uyJJvWZvmGzn+huciKREs5+4Cso7N37cLFDXH7L04ONyG7XU2ZE+qO+3hQhTMAIqBtimP4RoNClj13XII=
Received: from AS4P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::18)
 by AS2PR08MB10323.eurprd08.prod.outlook.com (2603:10a6:20b:5fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 12:04:43 +0000
Received: from AM4PEPF00027A6B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::3f) by AS4P195CA0012.outlook.office365.com
 (2603:10a6:20b:5e2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 12:04:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 AM4PEPF00027A6B.mail.protection.outlook.com (10.167.16.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 12:04:43 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX06.Arm.com
 (10.240.25.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 12:04:27 +0000
Received: from AZ-NEU-EX06.Arm.com (10.240.25.134) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 12:04:26 +0000
Received: from arm.com (10.1.35.30) by mail.arm.com (10.240.25.134) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Mon, 7 Apr 2025 12:04:25 +0000
Date: Mon, 7 Apr 2025 13:04:24 +0100
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <broonie@kernel.org>,
	<anshuman.khandual@arm.com>, <joey.gouly@arm.com>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <frederic@kernel.org>,
	<shameerali.kolothum.thodi@huawei.com>, <james.morse@arm.com>,
	<mark.rutland@arm.com>, <huangxiaojia2@huawei.com>,
	<akpm@linux-foundation.org>, <surenb@google.com>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <nd@arm.com>
Subject: Re: [PATCH v2 1/3] arm64: add FEAT_MTE_TAGGED_FAR feature
Message-ID: <Z_O_SHiQwr-ZWw52@arm.com>
References: <20250403172758.67106-1-yeoreum.yun@arm.com>
 <20250403172758.67106-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250403172758.67106-2-yeoreum.yun@arm.com>
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A6B:EE_|AS2PR08MB10323:EE_|DB1PEPF00050A00:EE_|DU0PR08MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a6a776-686e-460a-e848-08dd75cc765c
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Gc2KgcFImpM6FQd5MWvAl4Q0eHe+ygc9jMDeFMOyy/uNuPVL76DF1NG5eX66?=
 =?us-ascii?Q?nXksgTacgp1FIXvn3P3Z3wx14GBrE9MIBz+SljJEsg8Z7Vqz5p5F0n+AzuN8?=
 =?us-ascii?Q?WNR+IpU0FekhlhmbidLIU3vTGwedNTaw0BwuObmXI03Pl+5BRy1phf5ZFLLQ?=
 =?us-ascii?Q?jg/MTZVQhECKEA5NN2aNezRUMFouT7A9mA7eKs34jvULn7MyLcoDWNc1sB7C?=
 =?us-ascii?Q?LrLXywz/524E7OuCd9HXAWFAsQr6HLxcTDB1POQmwYOxWLEG7N2ErvikIMbE?=
 =?us-ascii?Q?kEP+IdmCQlL4VZTHNXCmgU3bYff30KwDmBSO8By7ORy+hZFgW0POESNPYGuI?=
 =?us-ascii?Q?xHsUY75RJceKXTu+JkOn9G0ZRnUoQ7Kku2PZO0Q/mYXmaj3kZDwzlAByrV8d?=
 =?us-ascii?Q?DkTrTzT5yCPYdvkn4W/l4KEdiwZsd0Tln25Y2wTvI17SqrntBSyd9bzmMsGR?=
 =?us-ascii?Q?8PvYJ1rJvEWISktPxYFI9ZqwSv+bMGPGGGTm2zrZ04Tag22IBNrZHO9L39rl?=
 =?us-ascii?Q?xjJuyQE94rWiINYzrvETbJFFajhiTAn4cBrcRx2p2ioez01MxF9pc237424a?=
 =?us-ascii?Q?AftAoIcxFukMGxrXRzsINRxIzyhm+QCPDSWHOs/j/0vGxIVC5HxtrFbmsH2B?=
 =?us-ascii?Q?eshhV+ucGZ/bs2Z2cLKUVXxb8iqry2L2vAcVeQW6BTEWA9oNXxjZRMLWNpAP?=
 =?us-ascii?Q?24LGQfSEJ/0k0RtHKmldjIyBUrrSjbIsAmkPsyi49edDZG3Szm5MqKFOCUYM?=
 =?us-ascii?Q?rBuWAYESjZIStsf22EjUV+G9ZBqGmQwvZERP+x7QPbu0EU4uhzmzHsk3s194?=
 =?us-ascii?Q?eT3vbolUJtMvg9Y8SWcKhCzUkDLI4TeAJX/IQrD/BiQsKxozbefBmKtw0CZd?=
 =?us-ascii?Q?Ozh0URNJw69PNr4GgVf1Dlow9bpn7tS0L2jo61LAT8MbrLwE4Yyv2EbF8qin?=
 =?us-ascii?Q?KktqjJIWVWlNTCH96mhOG3+mceFAfWMHJ65zpBVn13rrzQ1u424VioB8KFRK?=
 =?us-ascii?Q?dzbHjWA2JCfUAQ1Cy+cSsQcbH8VdwQxjpskRYdyoh4g+sI4p4nJhGEe5zpw7?=
 =?us-ascii?Q?jy6snE6EMKTGFM0L18TcvAaDNceeZ+HeuKPpT3Exd5kPyb5r9qm1kbH27svX?=
 =?us-ascii?Q?6YKTuea++YLu4ke6n1gDbZRNsiNFQ54+nebpB56iiuPk+zOZhPNzzeKNaQY5?=
 =?us-ascii?Q?4PmpyPjLPK7bQpCVtpuOXUpOkeNOkEyxXmVwhvPBQzCcV2SogvfdD9SdIG+x?=
 =?us-ascii?Q?fkr4GKjxMvi3atrFBNCNBb1tky5RpZ1PEFEkG0dT6E/cstOUEbpMC2anwPS6?=
 =?us-ascii?Q?XNTK2O5Wz/icfryRl68jsx0o8WW8tqK+hFLm6u0EiB8ANhXiP5ELQ2eGnoRo?=
 =?us-ascii?Q?nz41jP9GzxwddJqfJsJ3HCrg2ExpjJYZ8jHAO9iFAiwgqgYy5qYAYlvbQRkE?=
 =?us-ascii?Q?yGme/AXJNg8XbENjxxn8Ncxe6GSYyHFZTANPQw/xJ11RVE4HjvDT9rjTXIsJ?=
 =?us-ascii?Q?sXPjRqJ2wHeZTFt+W3/d1Y0h3Y0maBmoFiXK?=
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10323
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6f591231-56f5-4599-8b94-08dd75cc61fb
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|14060799003|82310400026|376014|36860700013|7416014|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iD39ztm72as0JECLEfS3Ar86ASqis9kUAna9AWmsihM6BV7LTmClvwy77p9v?=
 =?us-ascii?Q?LF7+IMiGWBGoW0tatrI6u3jQteQAhAJfc1r+B+ltIjhp/T22qnb5frjMTlfp?=
 =?us-ascii?Q?0MycsbbevF1ixNRaWBKybBkc8Mplx2CWeYJR1MJDvRvTm9j1QPLflVS1AFGF?=
 =?us-ascii?Q?GvC7wh3haG3C28/wm+NeziaH2pghuzWTgKuoh3eCtysQ7MFe0XgaPofM2uHP?=
 =?us-ascii?Q?2mMp558pLVpUmM9EuUM5AMGUSjz2CUwfkmE3pBG9DrcEePQsCCNQL50de2IK?=
 =?us-ascii?Q?boh2ADq5Svl7r/e2spQ9HNxEB2QUrQ7ACouFt9jNy2DrneBDD4Mk1zlNvnWF?=
 =?us-ascii?Q?7FKwztw7B5aU76BIvSBtHkChk1iE1uxqcwagicR1zatQsFMZr3a64M6zyHnF?=
 =?us-ascii?Q?oMOGexXgECHBAH8BLY9bmUHZ1zWDdEf3D0OpXJ3dE6mWAk5gFTBkSx0X+AXN?=
 =?us-ascii?Q?m45vyGl4fJT8h2ajY11OlFk7iSdVT2tRmTsCIkMFIncMtIqwd7R13mnIAsmg?=
 =?us-ascii?Q?Z0+yuA8oMlHtmA1VVPQtfeBqtNQw99T8pZ/UeYOf3cSrQkdqrkoA8je23C08?=
 =?us-ascii?Q?ypEZP9pbHrYyel82X6bE3+I5WMmsQE0vIndiFX9g2MUouGiq0jwW5uRmL2PE?=
 =?us-ascii?Q?J4pBkMVwcRsx4aZ+NqgNhCknkBUhyeY3Mh3OZgm/go8NcmmDHU93h78j+o1X?=
 =?us-ascii?Q?G3CEW2UW5pkBMAKOpUI0f06hvywa9gyQCkm/O6cXv62HD37xeXVGYcD9OPLj?=
 =?us-ascii?Q?LSNH904FAzyBz5OVxeKAwRnQEj7DBp9kfrLQle0XJW7eUb8nMffp6eyfS7vu?=
 =?us-ascii?Q?M4E7hnzgAF7zRPKN4FTfoY+mjI/n3GtlaUfoz4/JgzAJ9dNo6FVcfZGwRkQ5?=
 =?us-ascii?Q?/OGvmcMGT0obyJf14njIy5c1xNtlUVzQkRGPqofzSK+FNu6cAb9yKHnqtNrU?=
 =?us-ascii?Q?gPoaWFF64zscPNDJgN2e9mGdFMI7mrc4s5WMG67W8hGygeg+FT9RpL7/8j4H?=
 =?us-ascii?Q?/ZX3mbehYNeU0f5g9lvJcW/mvg/sBYRFLx/neDv6OqMkEduwo1UlEF2IY6Kt?=
 =?us-ascii?Q?JlEagHu4jpTqIABq3/jhWXdIwUaI06guWYkxrkwg+A4MsgWqEzodNpGxqgxD?=
 =?us-ascii?Q?rozYFDaW3s0BlFJpaPB3w43pY4MLDj3kPH4726xoAaFttnoBpibTfZY7GcB4?=
 =?us-ascii?Q?Hxpyg98GkMw5hpZ4G9qsmRoLSqmWEguBxnRqtld7JRMrsqwy8vwAJsqlZhf8?=
 =?us-ascii?Q?GuIr0xWyHYxSlKaAg2NkLZ9JOf99OAB8UXQK6VWxFn88LSo+JB2QYhy7lSdU?=
 =?us-ascii?Q?EIYVrfEThOj4gq8SdSdknwDFJyy5Gdm/TKb3gUheEJ2OcBt7NKtdvQjsbk9R?=
 =?us-ascii?Q?4u5nV4KQvQpgPSpO0/qe5N9RP3K74j3Rs/ELjs6YMjdLSeT7kmtEQry5ZHLi?=
 =?us-ascii?Q?is8bCFjWHqupGeUf1NKvA3CPz9zv+1JuSAopHdJGO7c+MidHhw3L5zds6+dG?=
 =?us-ascii?Q?rqDtIWDGXW41iPEU0R+OW3+tXtSmOFISch7L?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(376014)(36860700013)(7416014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 12:05:17.4963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a6a776-686e-460a-e848-08dd75cc765c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_050529_577885_6DCED623 
X-CRM114-Status: GOOD (  10.11  )
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

On Thu, Apr 03, 2025 at 06:27:56PM +0100, Yeoreum Yun wrote:
> Add FEAT_MTE_TAGGED_FAR cpucap which makes FAR_ELx report
> all non-address bits on a synchronous MTE tag check fault since Armv8.9
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  ...
>  arch/arm64/include/asm/hwcap.h               |  1 +
>  ...
> 
> diff --git a/arch/arm64/include/uapi/asm/hwcap.h b/arch/arm64/include/uapi/asm/hwcap.h
> index 705a7afa8e58..7d22527a7975 100644
> --- a/arch/arm64/include/uapi/asm/hwcap.h
> +++ b/arch/arm64/include/uapi/asm/hwcap.h
> @@ -143,5 +143,6 @@
>  /*
>   * HWCAP3 flags - for AT_HWCAP3
>   */
> +#define HWCAP3_MTE_FAR		(1UL << 0)

Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>


