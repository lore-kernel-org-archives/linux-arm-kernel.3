Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF812C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xW9VIcCVrAqo9gPL8RFDiUmS/zAaa2ylwWwxXNSTokc=; b=Lu1NSzTwsCIu+pZGrs2ux5G2bG
	sAIgcwwfMd9IATEvG5jgjZ0rQElqqXUaAzSPX+nWTfuqAyY6CpFt4jH6mzajJbA6eC9bH4W80VMKd
	hBmrOBieHM0Ia0DwwfcH+X7fp7fCdH1zNqxPJ8pa6EyMK5fE5cLmJqvuo2TCvCokFxTZQSYOZT8wy
	c2zdZNTBr8A0Fry3Fu1ZW7R7D2erfzbdHPxIr3LgjwyXqBhtKyjMGJ3Qu4Zwi8FdnqpdhGqJ0dWoA
	W9/uPu5hOti0NfQ5Hu6NW/D7HsNrrXzzmYH+WdlqSEnKqC5O9+LtqgqyDzmrdy5+i/jVlWiviJYR4
	rBHcIbMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfgTp-00000007X8b-1Dbp;
	Fri, 03 Jul 2026 16:11:05 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfgTm-00000007X7t-37TJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 16:11:04 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aoRZk9Nb0Mz9lTpXLZOz99ku+wzzX1rTtUctQrbkWihcCeyLcWkFaoD/xoUjJBWiFi7fbi5/Ge4xnYASpI+zYvVg4rn7nhp2l/1c2lp8Wzm+mxbLoYNjVnwAixA1ugKp3eiLINDSOjMYzuL289sNncoHQ9KLbr8gIHgGwG5k2T5mavpEgk2Gozr1FdD76NQABVEXdrd0Tim8abbXOc/EheTGX1lsvhY/o+SvFbLdZjwlIWGDAnkWznZy54tkd3V3XkSd1ehJawOZBnuR8MYK55RHEHjn6gsjgPBIUCNMaDirh1jRy+24O+h39k8a9NK9gcJVnCCI4jGI/Gti+hyM4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xW9VIcCVrAqo9gPL8RFDiUmS/zAaa2ylwWwxXNSTokc=;
 b=ejTAAFjzU+xS2DQOj3VCRgWpszzmbDg3jl+H46DMet/O86bXJiPm1QaNtKQ2A2KWmZqtgNpgRe5gX0dcQanU6pvVhDW3f8wViuwAiIXsH3ZAUxSjIB2m3uEyjgOxORRAl4diX2ANOvpRrDU7MaXB6vWalJ72RXmb4phgR1l6wm0O1XbQJTVXVzjnRx3Gee0hmz41w7zHbY+5VhoyLAJPhMOR6PeJjNhGmRn8SWEAc4PbD7OCNjUlTRu6ZFvSve7ojcuLaeOz1bsQO+jAW6miLKHQhn2alLRGJsnL/so8YrMiU76QJve/UcF1uPGVYz8aYmCb5N+tJNbdJHlcHFlIEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xW9VIcCVrAqo9gPL8RFDiUmS/zAaa2ylwWwxXNSTokc=;
 b=d97Yo5521n/Pn6M2DyqZtzjTzAHD8jHPr3X5bLVEf56ubzayX8yKoNFRsqZ9/SQNOimmtX6cRChhThTN5XhZx56X9X+YpJpnMihZusXplmrZsK8J8T77mbQRCTjTrGhnTh1WJdo0rMYA2StwujyJiZ9fY0ZDx6dAECnRpET6aVo=
Received: from AS4P195CA0004.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::19)
 by AS4PR08MB7710.eurprd08.prod.outlook.com (2603:10a6:20b:511::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 16:10:57 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::1e) by AS4P195CA0004.outlook.office365.com
 (2603:10a6:20b:5e2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.11 via Frontend Transport; Fri, 3
 Jul 2026 16:10:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 3 Jul 2026 16:10:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/jmRNu3ssRCzqceV2XecXgyXV0tGJtUtdg52tpuVHgljEOSfkHiFBCWtspbLOFgIA7fGEx5yC3lE1zs5W6OdXGJR2F1ONQqhLxe4eCrOltvuuvg+IPvVn+CsqRYJJvsmjC8C8OiEligl4T20ICWhoRKQ7twmd1wYtXXkPs0ewibJpzBgFnyfbLR3FLnZd3mBOGC/bjIFeIaQISkYXezGAN2OLQTUJy4VH5KcVcivnqbQW7cudj1IVP2kWfevkatWvJE1V1WZdqlCw0Ur6HFXo/Olfecu78uBCZdMjLK5h0BbC6xJg7q+kSd46PxIE8lL6XGUE3dP4USqlu55X5Trw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xW9VIcCVrAqo9gPL8RFDiUmS/zAaa2ylwWwxXNSTokc=;
 b=VFhqBbqP6TOvWL3qh+uYgI7c+hNsiqnHp3Ygk4A2yKMaAqZrx2d2C83wSlxBwlC3ZsuFupJ4xkwV3gGRF3o38LdwLwtYyzS/C3zpKpzqtqeYX7NW7GvgIRNf0rOHAVpvg2hzMNPPCndY06hLNFxi7rQcLtugUCGoksmPgspD5XbjO1H7N/d3UQXM4UThFQW8syG63K2dBYlN3xoOhdEy/YSrs7ObmSL/ibTzT0SMzyGJA8Qgh/1jP6SPmmlJIY9GkbX9EWYShNqVay1hD/xRgQqxljmsMR3plQhEDb45a4P2/5+Ud+Y5ZzmjLWdiKGnfcmPIgH1nHNTd345ZxIE7bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xW9VIcCVrAqo9gPL8RFDiUmS/zAaa2ylwWwxXNSTokc=;
 b=d97Yo5521n/Pn6M2DyqZtzjTzAHD8jHPr3X5bLVEf56ubzayX8yKoNFRsqZ9/SQNOimmtX6cRChhThTN5XhZx56X9X+YpJpnMihZusXplmrZsK8J8T77mbQRCTjTrGhnTh1WJdo0rMYA2StwujyJiZ9fY0ZDx6dAECnRpET6aVo=
Received: from DU2PR08MB7310.eurprd08.prod.outlook.com (2603:10a6:10:2e5::5)
 by PAWPR08MB8840.eurprd08.prod.outlook.com (2603:10a6:102:339::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 16:09:53 +0000
Received: from DU2PR08MB7310.eurprd08.prod.outlook.com
 ([fe80::e007:b494:8a24:1fc0]) by DU2PR08MB7310.eurprd08.prod.outlook.com
 ([fe80::e007:b494:8a24:1fc0%4]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 16:09:53 +0000
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
Subject: [PATCH v3 38/40] Documentation: KVM: Add
 KVM_DEV_ARM_VGIC_GRP_IRS_REGS to VGICv5 docs
Thread-Topic: [PATCH v3 38/40] Documentation: KVM: Add
 KVM_DEV_ARM_VGIC_GRP_IRS_REGS to VGICv5 docs
Thread-Index: AQHdCwZi3HeNsrhRrU+q0Er854iNQA==
Date: Fri, 3 Jul 2026 16:09:53 +0000
Message-ID: <20260703154811.3355680-39-sascha.bischoff@arm.com>
References: <20260703154811.3355680-1-sascha.bischoff@arm.com>
In-Reply-To: <20260703154811.3355680-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: DU2PR08MB7310:EE_|PAWPR08MB8840:EE_|AM3PEPF0000A79B:EE_|AS4PR08MB7710:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac4b4d9-cb73-45a3-3520-08ded91daab0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info-Original: +40UO5/GAfj552s7rI5fYDXpgolySK7FcEx/r02xMNjsz4Rdo5B44JFCxVuvJZXkMCBvKTdLwU8Cw3J0+hom5GRZxrufRqypMYEaZnpzNtBUmKLbNxQ+m9AP+2uHIF4Fwjr//73ZCRJgoxqq7a8gbufgcteZsM1pvn4YJjl8aIFhwcPqx7UWjpLa0kzTUnJhY9yBsm9xRu+FdobgEW1ycxrciWixk9+CAadPZXJxUh3PUrVGWpiKG1Iwq/2XZRfVQx8hbAuqwlyGYTZtCkIa/18x5+TW4sljSBG06HPl9p8sYP2BudxpBl2Xj1RI44/BIhz2BRnYo6wHqCQoHS45xk/qe51YMN0rB2F/qO7KQY2Sn0FObnaMmamOPL3H4VWT+e2bv0Q/H0J1Rmpcacif2oKQZ+HYWe4Xol5dUnAjLZFAM272BKbYD511Bx5Jeny1cm40t5dlbNwPr2fxit5Ln3JgoQ33dcVZLdYTw++j+QjNck+LsXxJOEgEOb5vt+STVUYysSMHxvEPuSaf8m5kcRGAtOmjsByFLpSa3eSBGn6WxK0WnrrFp2+K1aaNBA9ZQai3xEh/ceqEuLXzi1nMyhZL6XpxvrQEpN6S0lsuQ6m3i/FYkutyToy5ytB9lAyf11ShRRSpQeCCO1BhxWQ6BLq/yr93kW1b9+oeY6ZfkvEQFHqsItOoWPnyCL6LAs1YpCfG/YFcsvyZmBuvmrQJanSKYJaaGbf0W+OTGLmbG1Q=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7310.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: D8E0fqt5oOMNXaK8fWApr8a528G7bkRufe7MQ0/WbqOUzmx/zmV00jJWUkAd18ek8Q16jKtywOdiyjfFyhylsy/Dcltz3ONSmzRgdhFq/AlrD/DE23+NUwIYDzz6tKYya2ppQ89bKP+ym4y7u1sNolrxsbsZGhN1/1N1CzVLGNBV5AQH1E5ImOsa6/Mwj72h9SN4swRfTfU3oPCSfgZQt5aHgTUMmBlkt2sezlIYzJKzzObZVawaqiMHOEGXUZYd7+3dQI7S7o9MnYXcNMGMYgwOwI80/rzoVO9m4xPWBg05Gf7i4vHafD55ZEqSZs23iUt66KOKkn/Bl/4+OZ41lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB8840
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 33972f56-cd0f-47db-6ba9-08ded91d84a4
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|35042699022|376014|14060799003|1800799024|82310400026|23010399003|11063799006|18002099003|22082099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: vMDI6OmfqBNEsHQrxK1EgHJT4pNrAgpy3jF32WB9wuGEpvzqSCWylqruFAPUPGFMq6Nz0P9f1uTSBrbmwncKJn3wvL0FY2ftFFXJbY5h1Dp5QTQycM1f/hutcnu14MIYl+7Omur8lSqBWuFGlImTYWwkfHgWwsduIxkdqsXEqk23fWyUGcp5BJTs93m7rk+OYSuUJOkvo5Zxg4PB91tlwmoRjHRhdMOAvP+5kOV0x0aivkSrKLIEBAC1MHTilIkI7XwsBnFvrsQayq3aXk26Iaw2AvItGcXWPmj2yKCHNg46o+1dooVLEIk7YbuVqOAtdHEOzwEtyGePDqF1w4pVMoNQ5jF9WlWpszktEtCDcBgjdaGnBEtzKssIqZLxwrPSneG+KX13/ZvPukmxsUrxLF4pLMOMGchAR0FCsnD8DcJmLU7cglAKBS2CTCOSZIQYkrdFZ5uFnN9qTSsZ8HIkIZIK2ylw9WYzrJyfC5JdlRN14zGH6gUivPhTPxHgzmmEqVFiwl1D0kVpCjaAgkHBmX20iuEEOMpqdH6bFi5nz6z+byugonufVLGA1aoHS3P4H7EK7Dk5ynapcr3xtdKUulVJSTEa088WDkEd0jMvpOjTXWL/uJWf/jJgTP+ltm7rHYvfRtqH5xQUY+PapIPeD32gH7FAVhO4dV/wpqGWK2ylEiepjvHPqCfj0vwRbJOuzZZcAXNw/wtBAQU6g2ZmhQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(35042699022)(376014)(14060799003)(1800799024)(82310400026)(23010399003)(11063799006)(18002099003)(22082099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CSGIvlN4aHyzjWY7xdyy6YBhlhcfYUgK6DhkCuSZL/OQgkQ1dPKyeZnGNso43U6k96UlOUrmhcoCYTRj58L+2XrMdCwbyMuVKCbn6wiaI7gYQvO9wt/oSTO0gLgJqSZclpDI/Zbdsmz6dpU4+Kyj3K1UiSHy1jGYgFIFbMXwofWrIsrtrR+X0wQaM8ZUP0ZrysKzEpNpDtOEvSkBEnrgLy4idkanS+beWkMW1K7V2opI3G+mP2e01oj/thb6wyeBkp/Ly+PrXMXOQoOok0aaxhsI6ncyq/RBXiCrAtmBo5Iuey1Ej1oaNbVOElcqI3LQWxVEdw0KCu6ndMOoaPx59cY+2PZgHIvlswNvsV2//YFAkZbyNCtL874xix9YLdsw3oIhhT9z3JRUS54OjIsuXN9JPcq1dY1DZovdpLX8XjaM/VKJ98pGdzAq0B+uMde4
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 16:10:57.3208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac4b4d9-cb73-45a3-3520-08ded91daab0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7710
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_091102_937584_08CD4B59 
X-CRM114-Status: GOOD (  11.58  )
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

Document the KVM_DEV_ARM_VGIC_GRP_IRS_REGS attribute group used to
read and write the virtual IRS's MMIO register state. This provides a
GICv5-specific interface for state that is conceptually similar to the
VGICv3 ITS register interface, but uses IRS terminology instead of ITS.

Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
---
 .../virt/kvm/devices/arm-vgic-v5.rst          | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/virt/kvm/devices/arm-vgic-v5.rst b/Documentation=
/virt/kvm/devices/arm-vgic-v5.rst
index e2045b09f27d0..217a1ecfbdc5f 100644
--- a/Documentation/virt/kvm/devices/arm-vgic-v5.rst
+++ b/Documentation/virt/kvm/devices/arm-vgic-v5.rst
@@ -141,3 +141,39 @@ Groups:
     ICC_CR0_EL1
     ICC_PCR_EL1
     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
+
+  KVM_DEV_ARM_VGIC_GRP_IRS_REGS
+    Attributes:
+      The attr field of kvm_device_attr encodes the offset of the IRS regi=
ster,
+      relative to the IRS CONFIG_FRAME base address. This is the address t=
hat
+      was provided via KVM_VGIC_V5_ADDR_TYPE_IRS when creating VGICv5 in t=
he
+      first place.
+
+      kvm_device_attr.addr points to a __u64 value whatever the width
+      of the addressed register (32/64 bits). 64 bit registers can only
+      be accessed with full length.
+
+      Writes to read-only registers are ignored by the kernel except for:
+
+      - IRS_IDR0 - IRS_IDR2 and IRS_IDR5 - IRS_IDR7: These are sanity chec=
ked to
+        ensure that they match a sane config.
+      - IRS_IDR3 and IRS_IDR4: These are RAZ/WI as nested virtualization i=
s not
+        supported.
+
+      For registers without dedicated userspace accessors, getting or sett=
ing a
+      register uses the same emulated MMIO handlers as guest reads/writes.
+      Dedicated userspace accessors may instead save or restore migration =
state
+      without triggering guest-visible side effects. For example, restorin=
g
+      IRS_IST_BASER only restores the emulated register state; any host LP=
I IST
+      allocation based on the restored IRS_IST_CFGR and IRS_IST_BASER stat=
e
+      happens when KVM_DEV_ARM_VGIC_GRP_IST is restored.
+
+  Errors:
+
+    =3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+    -ENXIO   Offset does not correspond to any supported register
+    -EFAULT  Invalid user pointer for attr->addr
+    -EINVAL  Offset is not 32-bit aligned for 32-bit MMIO registers, or no=
t
+             64-bit aligned for 64-bit registers
+    -EBUSY   VGIC is not initialized, or one or more VCPUs are running
+    =3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--=20
2.34.1

