Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC1FE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+t0XsEUB8iBMvKvGZ/FlN6yox/B3IwP18+oEN5U/lLw=; b=2USQYYytvTuSJAxibUgBQlVNUi
	K7MYDCH61OWLbdUR7L2qqN40zK/FK2BQDC3VUtPwMoac2KLxXvHvlt8NOLdXjAw2xefoUiB27XNi2
	BETjbuQXZeqEMz9C+IhqJjR59p4NHG7T8NFBbSu1dUD3aWpEAeW3BxOKvA3p877JyfwuFQzRIUjZN
	STrJYn/rCSzYhg6CgWgLvF36EdbC+0vo+8EAsGYPAj/nnyDOLn5gmJWBlBZ1taYAKbF81u7ULhlAw
	Fz/9R10Tkmw3TzCIht0/kHpiYljXayg5xbKlPXnLnGbTWnLx3oudsdAR04gekZjDxCoUhtxR/V0Xu
	WmZD4/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEgt-00000001fAF-0dJS;
	Thu, 19 Dec 2024 11:27:39 +0000
Received: from mail-vi1eur02on20629.outbound.protection.outlook.com ([2a01:111:f403:2607::629] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEfl-00000001f4W-2zXU;
	Thu, 19 Dec 2024 11:26:31 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=VxFI7IqHjJqyf2iSXXKV8gHyNJEK1uCl73BgWL/4y8TCbCMphTPw7DRbKqAoGFunv0wpU3eESCevWA2AqZMOW2RhUrFaX54d1I7/GnSRoqWQEPXGjhI+ZpppumynsWFrQt9K9SMgxmhQj16tqbvpt2qC54P6ERgP6aFaoFcwLPp8mQGWloDFpkuHZMLLTny+4Xq48VGupA0U1YSbKkiFx2+PohryIJgLDfubTt8/upVstgb21D2Czg6gmVdfFhNn7AngUmLPvmf/vPTclnC/RK+dEfzdgdkFDS76q6BK1S9fw5X7NVw6H+4clZRfwO3r4y6cUIe2P2OmyarCR+AGgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+t0XsEUB8iBMvKvGZ/FlN6yox/B3IwP18+oEN5U/lLw=;
 b=cfJz/rvEc2rxPm8dzeYcZVW4TwX18yJAxHDv8DWtjdkinKRA0I8TdXd6vySr8zp0ZtFunNDkMh3DIFVXoQUdJ6+aR98+IWu2VwUMcELQ9MElTahgAW50mlKSQbj44fO+zaHm9Un27tJMjQv/vGxeSxGrlsj47sX0R4tyd2pbS9Z1trYBW0eaZt5YEq9BDiUpGhdLvUG8zTxwj70Sfu+LFezVtGWnr232IEtdEGNTAmSGjKSZVqmuyICR3p8K2yt4y5a6Z3v79+L0FgKXlMS+sGXvj0JxoOzyaHDP3rrQXHnMz50BnFA5ylHompghs33AbDu6NEkGKpagB2tHgjBHDA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=0
 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+t0XsEUB8iBMvKvGZ/FlN6yox/B3IwP18+oEN5U/lLw=;
 b=B3CBUpu2lDfIxRUHcXsl4dUgELHopRY0Voyi5PxvbO78YPaw8yQIWEbdO8t5nJXp+ytNZQc2cSKrj+KxXXgQLlniU0LIm92o8T7Ha8eEhEakN00VrHbjBCOwsvkDkoZTcKiPhIXs6rHhevG+ONemu+/s3hnoo0V0X5Rg2InTi+U=
Received: from AM4PR0302CA0004.eurprd03.prod.outlook.com (2603:10a6:205:2::17)
 by PA4PR08MB7595.eurprd08.prod.outlook.com (2603:10a6:102:271::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 11:26:21 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:205:2:cafe::ab) by AM4PR0302CA0004.outlook.office365.com
 (2603:10a6:205:2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 11:26:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Thu, 19 Dec 2024 11:26:21 +0000
Received: ("Tessian outbound b519d6c64997:v528"); Thu, 19 Dec 2024 11:26:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cd0096afaedbe872
X-TessianGatewayMetadata: MDgeBcxovLdUwQjbkxRUdXBpz+0nBiSdhs2/PtnEZwapUOTDcGNR1NzSF+D04frIf4MNQSg7E4MPz0S1fdd0ZwppGoN4gUPf7PLlvObIDRigPrcgEZymvr/zDbMMsN/cC0yBOY246Z/Qjn4h6HFr3y4+wQPf4mB+HTo6M76fcus=
X-CR-MTA-TID: 64aa7808
Received: from L581a8c5d96ac.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F5812DE9-FCEA-4A80-A12A-A6C0E26682BB.1;
	Thu, 19 Dec 2024 11:26:14 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L581a8c5d96ac.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 19 Dec 2024 11:26:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YRMj+mbApEfYRzrX1v+cjIUQJmfwvuFGPcAbrC0QN563bFPjynUWHIopbdff41oJ0vEfjRyBIas78KyIkepsKykk3ysO3YkMMoF6GkJQMD9i4cCfX+MrWEORQJ6cZv4GJMhLqfrGeLYK03j38kO4EIt8WkQfm0EYhxwVk2J1o4wnWGFObKXLRSOTaEQ2UcJh2i8blhbabY5Awr5ffvKFekHVx0Ev4ffKgS2xHCZTiAVkr9BNppHrjRO5/Epr182GU306xNXzw1je27gkqzrr1AJzawJxXQ6C4zJjgBUr6STNV/5uGvUdpLDxTSDJvD5U3dys7HccURYUZaotfnNhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+t0XsEUB8iBMvKvGZ/FlN6yox/B3IwP18+oEN5U/lLw=;
 b=AqAHgUYlBoeW7Uq25m2Wulp1zo9Hsx/I6qBoAfoB4Prd7+l7cCCHG6LdXh/SDsOpBOMHUefj28A4eiqzbKf7NWkzvpPFrmyAzScpxMgtaoHl4lqkQZpddDnfNPQMxSEFQWOwWQ624qFGL9WkftPqI3Mpsqj18parEhtYKMPJDoWSEefk4phmhXAYTpn/Nm2HHSXyc+v3elUA4TI/jiYsL3AKgkWtizZryD2SO+ODw/vdKDEcrWxvH7cjhx7gvraPe+dTynfp9qIfpsaPCPqpW8Iv5Z5vMMdopmOoJDbXA0W1Jla/a4+uh0KvygrMzSVQphsOajJyy6TAoHLwPq72Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 172.205.89.229) smtp.rcpttodomain=sntech.de smtp.mailfrom=arm.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+t0XsEUB8iBMvKvGZ/FlN6yox/B3IwP18+oEN5U/lLw=;
 b=B3CBUpu2lDfIxRUHcXsl4dUgELHopRY0Voyi5PxvbO78YPaw8yQIWEbdO8t5nJXp+ytNZQc2cSKrj+KxXXgQLlniU0LIm92o8T7Ha8eEhEakN00VrHbjBCOwsvkDkoZTcKiPhIXs6rHhevG+ONemu+/s3hnoo0V0X5Rg2InTi+U=
Received: from AM0PR02CA0017.eurprd02.prod.outlook.com (2603:10a6:208:3e::30)
 by AM8PR08MB5747.eurprd08.prod.outlook.com (2603:10a6:20b:1c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 11:26:12 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::82) by AM0PR02CA0017.outlook.office365.com
 (2603:10a6:208:3e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.22 via Frontend Transport; Thu,
 19 Dec 2024 11:26:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 172.205.89.229)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 172.205.89.229 as permitted sender)
 receiver=protection.outlook.com; client-ip=172.205.89.229;
 helo=nebula.arm.com;
Received: from nebula.arm.com (172.205.89.229) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 19 Dec 2024 11:26:12 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX05.Arm.com
 (10.240.25.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 11:26:10 +0000
Received: from AZ-NEU-EX06.Arm.com (10.240.25.134) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 19 Dec
 2024 11:26:09 +0000
Received: from e123574.cambridge.arm.com (10.1.197.68) by mail.arm.com
 (10.240.25.134) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 19 Dec 2024 11:26:09 +0000
From: <anton.kirilov@arm.com>
To: <heiko@sntech.de>
CC: <conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <krzk+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-rockchip@lists.infradead.org>, <robh@kernel.org>, <nd@arm.com>, "Anton
 Kirilov" <anton.kirilov@arm.com>
Subject: [PATCH] arm64: dts: rockchip: Enable the USB 3.0 port on NanoPi R6C/R6S
Date: Thu, 19 Dec 2024 11:25:32 +0000
Message-ID: <20241219112532.482891-1-anton.kirilov@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004B:EE_|AM8PR08MB5747:EE_|AM4PEPF00027A62:EE_|PA4PR08MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: ddefc1b3-76ec-4a2c-5d9e-08dd201ff6c2
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?CsRl1d7h80HvGz5IUZvqklugQAlzZFDV+Me7pqUX+hGInNF4AfPWRV+4y1eI?=
 =?us-ascii?Q?YeKcmXsd/M32OsYX0wan5Hw6yBNe6NuORbMCJd3lx3Nvf10+uhFInl352g1B?=
 =?us-ascii?Q?KVRbEupu+xoum201ALHBp28ipMdx/6Js2B/cbWEJtbQ4K7b+yGpT6n795zLn?=
 =?us-ascii?Q?JxGmWmGEcOxpJMyrNPF24J5Fw4Z1AG+isJ8vPi0zqX+VYr//hRZbm1uSldYG?=
 =?us-ascii?Q?jAP5sGiaZ0GgmTJ7bcPPGz8h4mIXncLJvGb2eA7qQch2VoKqo3sd0dQZyFaf?=
 =?us-ascii?Q?g0PQ33/2Zmk5qkr63Egy54AuxT15o82GdQM4FDhI5UnwwkNJd1ElaWLR7uQr?=
 =?us-ascii?Q?bAqKFDEFVNJRfkv8x681i595beksof96SSp0Dx4SrbcPg4LK9bXMhi1Hfw79?=
 =?us-ascii?Q?wAyn8d7LedD5AA3t10jllzlFHk0jpxgzZUhj/dokkLd52yRmbWxEtsS7A/R1?=
 =?us-ascii?Q?7heufg6uCJ+AeXLLutylJO+XyZ0KjZhJhmvA9XKn4Z1+2O9tM/m97CPmV2EA?=
 =?us-ascii?Q?0EsyZG9ltT0lGrIO1p6zZ6qDEEAL5kmAyM0mlJ5v98jqBpc3EK2y3ELFhsOk?=
 =?us-ascii?Q?bO3l7c6j1kUEKrkdDSKdKOrJreOymsxUxY6v3SFw1TZ4+Hoo7vUZt8Tdu/bQ?=
 =?us-ascii?Q?gW7Zt37SaxTi9EaX1UWtsw6AbP5giwhqRQixdWl/h7kzURqhA+wQbYW43WQ/?=
 =?us-ascii?Q?lLtSgr18W8WvNi8BnbIuYRGdGleaBG8unlkRHQFanh24mFBnf0cJAt9kY632?=
 =?us-ascii?Q?8RSoOPqr6huvimzEq5kk+UBCA7L64ssmmBPFgdlZttdjCVZFbP7Bi950iETy?=
 =?us-ascii?Q?99lmdyUyT7WIMr1uHUKF8/OiWTr2dRTgkX58xnuow9E6LKPj2xx1mZBwxSV/?=
 =?us-ascii?Q?e2fXMJI7Y4vk+zFagp2vutwVvG0UY1pne38QooWt5HrY7XDMbFLC1lX2Y5GA?=
 =?us-ascii?Q?imQ4xrr9VQkEWDdXqqEOGxNQdvlNPK4D2zMg4/3H0S+/1k6aHhkH4rfSeVvR?=
 =?us-ascii?Q?iYOkw9XFRBDhjBGaZPzGHF+EvLAGWhWTNioI1yO7mIqiP0C6czXtExKp0nGf?=
 =?us-ascii?Q?oltyEuZ0mjkw21QLxOSjR05VagE3zM0lhJfab4FRJVCfiQUb3jqCSOYHG8oa?=
 =?us-ascii?Q?5/D4srTJXln7GhInirVmPCatgc3KBBsm6XNHxAr/2edCz0f4SNF9c6o3qtLO?=
 =?us-ascii?Q?5j7qB+3zBqelT2HBT7+518XFUVXgqYiEYz7a9nNopVgv7HDpiKfT2g1nfuR/?=
 =?us-ascii?Q?5sCDsrfaffNTd+5CDrDHOa5+akdy4UYn1u3PIL4LVxT5DGVEOpAgrH3FtMYv?=
 =?us-ascii?Q?pw9JcLYfCp631oVuHyjDLHgCP9UXmdHwPIK+6p+j9gsQpVixATwMPZLyK2QH?=
 =?us-ascii?Q?EogR3S84eVYjVyqNLriuTE/McUTOu0FnfrQAQdAxDItDn+zUtK1FfKIcQTVN?=
 =?us-ascii?Q?4nEOPtv/wvPN3A1hHMXMt3XoTh4KbHrmrOENsXIGFAeLNizAF9g6Al6/qNb0?=
 =?us-ascii?Q?NhTa2lg59GhZlQQ=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:172.205.89.229;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5747
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:208:3e::30];domain=AM0PR02CA0017.eurprd02.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1abb9612-d9b1-402b-fe90-08dd201ff164
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|14060799003|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e/EE9zesCNqh2Kecx0jl+nyAiVwTeEk+tsN9oKmcmQ8EhSN30weJZ9KGDVni?=
 =?us-ascii?Q?9kg+mt8x4f5tMCkALHnPJTltPMcwWNiRPHMAiFyn/VTlYNmjAnCtUrEVNdW2?=
 =?us-ascii?Q?+Qwtrja555+zrQkSs3rxgBgN+umBZ/SLermYrZkHsloy3/gjuQsB5fesmgt3?=
 =?us-ascii?Q?Yywu7RhSyZiYejMFrEtFMLvA6TK4Z9vXS+J4y4vBZm0mxvQWFLIvWJpsoygL?=
 =?us-ascii?Q?7sGbU6r5V1I6qcuvx+J47u3h+/8qXBnM7iurh5edA8vY1oXFaSTjoHn3bmRq?=
 =?us-ascii?Q?aKQ/7BdwM/ZcRK0/hmy5w1q0VmKApyzKZKwwBLMK0gAuW8+fQxogMYPhV0lC?=
 =?us-ascii?Q?GS2s66NwhLALpIvKKmdupJBEAihTZebTW4QykdSdFoq74tJaB8xl3vZEauxl?=
 =?us-ascii?Q?6Sc+1OqTSMRN6bjdfLc5AC3Zlhujoza1kjeeRKsPLim0t/vx0Xi94HIouj34?=
 =?us-ascii?Q?SVTXOLoa55+qKSpTcbff6FxglNAJTmleDRVfvc/yshZ/ffDAKG0pjwWAagxc?=
 =?us-ascii?Q?jSvwxBPH7zZp1YI1zfrSKrtLLnpRkyvVjH6JuSaD5PTIvRhvibyXtDx8EA8f?=
 =?us-ascii?Q?h2iMFtte6MAQfGassC8aB4m0LkbfNywz2ehkYISeX/cKaDweq3Mx8PtSNhsi?=
 =?us-ascii?Q?2jf8optnrUgZPeA6IyFbVg8/JQqPx1vL+QtFGzky5FDGVrzzI+qmUI3xYps6?=
 =?us-ascii?Q?aO24uB8XWQS0stKbP4Pz/GRmyBaZelpKeoZepNjgnNHO5vBj/sHBOXokL6ay?=
 =?us-ascii?Q?bj2gLFKtYP5BQ8Yh+NZhQNvc2v34l3KEuuuDLImpWL0tIP0x1qlNnwYJaHzC?=
 =?us-ascii?Q?q7blVIh+9/hI7Qz4ymBhQ+8Q2KLnYxjx/PDB4IgVksfrhAze8ajL/S6h7baa?=
 =?us-ascii?Q?2ql7jsjbl8HmsSy4gVBIkTQrpsCqb941qYEXx+PBiPiuvZYdEra4kV5wEY7F?=
 =?us-ascii?Q?/QTLF77UoKoH3625tFp88PY9aV3oNVWNvfBgcfi+Wx2X2i4mFzPSzVIGml7n?=
 =?us-ascii?Q?E54gRlckyPYEDS7i1wdxFI5QZuWmyNgLS0a3udIU/NQKnjPIqSfV00GJmWtZ?=
 =?us-ascii?Q?/nN8e0n4mtpfJKi7nl8u/gZPsPq7HaYiksKxTet9nqnrAxFMDD9pDDxJ7zhB?=
 =?us-ascii?Q?HooUSfVMi9yhTyM2MJzDTLDzlxs3hAgzQvgMphWgq7CiPYGRfDJEzXCLebRE?=
 =?us-ascii?Q?IRPF2KTJN1CyvJDs8ZghDngJNJ3L12wu0fBbfmLiGY+lMB7hS6hRrYlBch3m?=
 =?us-ascii?Q?LfTzxDcFWHcpFllYqguheBaW32wCUgfEencOe5KBH/dqyFm3pq+CsXHLrBzC?=
 =?us-ascii?Q?zlQ4d6TP2zNEGDU+eV0mZFU6cc0PstlNnrvl44m2AkMNCFr5Dp5vlohC642v?=
 =?us-ascii?Q?en6Shk4DkHGClG+RX1Az8mpl8RnwkmMptEWIDOQV8gUV1voTDTta3O6iQsM5?=
 =?us-ascii?Q?KCFEP5TXsIlj0QQXAZSsmrXcvhH6pzOIazeUOfroV9KrTJDSRki8iHoSAmWj?=
 =?us-ascii?Q?yoE1iIx1mNfNESI=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 11:26:21.1705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ddefc1b3-76ec-4a2c-5d9e-08dd201ff6c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7595
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_032629_920024_EE67E991 
X-CRM114-Status: UNSURE (   6.69  )
X-CRM114-Notice: Please train this message.
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

From: Anton Kirilov <anton.kirilov@arm.com>

Enable the USB 3.0 port on FriendlyElec NanoPi R6C/R6S boards.

Signed-off-by: Anton Kirilov <anton.kirilov@arm.com>
---
 .../boot/dts/rockchip/rk3588s-nanopi-r6.dtsi   | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
index 76a6e8e517e9..cbf09d0b4add 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi
@@ -774,6 +774,15 @@ &tsadc {
 	status = "okay";
 };
 
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	phy-supply = <&vcc5v0_usb_otg0>;
+	status = "okay";
+};
+
 &u2phy2 {
 	status = "okay";
 };
@@ -796,6 +805,15 @@ &usb_host0_ohci {
 	status = "okay";
 };
 
+&usb_host0_xhci {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbdp_phy0 {
+	status = "okay";
+};
+
 &vop {
 	status = "okay";
 };
-- 
2.43.0


