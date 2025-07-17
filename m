Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C97BC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 09:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUxlGTEhktdMjrZq3s54Ini3nyIX/Afl+r/xfUIbGTs=; b=bG1HeKXBBpVqYSlLawDRky+5p8
	Smyf/BVjooaQ75c3lGdWpvIMr/AQiSjIao8R4YuKrko1TLYXMZvrVK1yqxsisfgF1abV/7m38H5HV
	J1FcUvceFr4PMvQAsXZlYDFn69kQR7vECUwrNl3XuOVH+x3ObTI0wer5LHJDGDouleS5+XoVIk4bG
	PjsJaOyfv1QqrPOAXOZgofkRV3L+57g9pP3tAW01OdtOsRx+dKAhl4Q1C0cFMkjTmQM+y7e9l1vuG
	TM5gHdoGFtDYcvsckDdY2bvB5wLNQAPGqcjWcmngF+W1o03GZaFVNc7N43WmdvGCYGQFJqXkCGQ3R
	dUFHF+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKua-00000009jFo-48Oh;
	Thu, 17 Jul 2025 09:28:21 +0000
Received: from mail-dm6nam10on20629.outbound.protection.outlook.com ([2a01:111:f403:2413::629] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucKSZ-00000009ell-3t4R
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 08:59:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4dQrfb7PvRfybnO+hguQlJOsw1wdOLWRIGCNHuF4zdf/OkA8FWXCzMrGzocphGyXuYtuNBhNjAzP4XJ2ED5kE1ZrMy5+jYKTdvorJneMGc4hGI9iJgkJpYpbO4etS8TIP0fCxAhke0JsrVuyGiY9gP1vxGgZlXxHw7UQ+R/RP/xL0lVscT/yhkI9LnjQObZMMTxVBc0qZfho/eqziQIAXXm9VV6W+G99ajQzzgBapkYHBbqsp/CEDInmZzq96NN0FczV5RZv9KjhOc43zULVa8dfhw6NBGPpxMjZR3GjhZOdAtpBM88fkAELpq8mwOhSsCI0Jx6TxTABY7yjRMmuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUxlGTEhktdMjrZq3s54Ini3nyIX/Afl+r/xfUIbGTs=;
 b=hfMXEywgVdUdpcQw56TwRf00x38lipT5SI89Tjr9q26ftwj69RTo/kgf5tJ+XsiqxxacVCRw+Vlwe1fLyPM/O3fgBGPk6JOL6AhGjt+wW0i0uoQWRjSMH8rVVnXN0QaZWosDFATdSMzI83rWPhDUAcW65oeXqPKdd8lmzFqSEwQ8Uil2WAdmGzEIP81Dk0iuYYfrtTOU3evGIssw9jAQIEex8ZFeo5U5i0Qw9mMWnGO1uM1n4nk851oHA0fYYSEgaR6PTjO83S04CTJqpnaDfHDet4VJGnH62Yazy+0BgYyYIq61BMEfuqnPC/12cp+2p5gxNLvLABKW9BA7KnxyHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lunn.ch smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUxlGTEhktdMjrZq3s54Ini3nyIX/Afl+r/xfUIbGTs=;
 b=UsZBNxZnVmLUHdCVTCKbSpz0AHPVdxwD+Pb7I7XDAmtfzxisQykP3+e3goZvNDcCHxI/K0sRr2lPISx850qKaoWyTEToHb6cyv4xfl25ii7SJSs8L3VrkSTA5pRXOQDx282nFZXdLCfAzI0qRcTH5BjwfTLl9TvIZSRZ2QHkkRR1Zzd01FnXFjqhvncm899Yd1a+wcsZ/J4mbWtTLYBXB1KncebVWHIngRAaD8rTIXuXtWDAGD/JDB72+jJOD2Pi99fCHXB4m4o0rrGmfTFMEk2m4lfnklFT4vMiNk8LCWXxf/ZrJJGbbnfP1OMO6CPvS7XhQuyPJELZ56lRqHoTXA==
Received: from BY3PR05CA0030.namprd05.prod.outlook.com (2603:10b6:a03:254::35)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Thu, 17 Jul
 2025 08:59:18 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::df) by BY3PR05CA0030.outlook.office365.com
 (2603:10b6:a03:254::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.15 via Frontend Transport; Thu,
 17 Jul 2025 08:59:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Thu, 17 Jul 2025 08:59:17 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Jul
 2025 01:58:59 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 17 Jul
 2025 01:58:58 -0700
Received: from willie-obmc-builder.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 17 Jul 2025 01:58:57 -0700
From: Willie Thai <wthai@nvidia.com>
To: <andrew@lunn.ch>
CC: <andrew@codeconstruct.com.au>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <dkodihalli@nvidia.com>, <etanous@nvidia.com>,
	<joel@jms.id.au>, <krzk+dt@kernel.org>, <leohu@nvidia.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<robh@kernel.org>, <wthai@nvidia.com>
Subject: [PATCH v2 4/4] ARM: dts: aspeed: nvidia: gb200nvl: Enable MAC0 for BMC network
Date: Thu, 17 Jul 2025 08:58:57 +0000
Message-ID: <20250717085857.2707150-1-wthai@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <17cd5195-29d7-44db-8f3c-474dc5c3486b@lunn.ch>
References: <17cd5195-29d7-44db-8f3c-474dc5c3486b@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|CY8PR12MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: 93355786-b95b-4fd7-acfb-08ddc510360c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fCCx3zm6wVZjZPl+DNhE4d4YT33/8JxOC8/mvFogU27RnHHKCg/tHpO50fcn?=
 =?us-ascii?Q?Z2Aq8NNV3kWxdPMHOQdISmKIdplDxWbUaV6GFEHSq5JKVSVWdlvI3WIm8Iza?=
 =?us-ascii?Q?ZDeacHep6AuB28xI6BvWlen5emEcf4t4iGOfWMj98RelnI7u6YM2Y+tB/5Gp?=
 =?us-ascii?Q?cbsF0/656fWGhnQl6mqtayggcQc3xc8JSkAhB8HcpCWadbpMckkdfm5DXtNJ?=
 =?us-ascii?Q?eSlLu64+HEomY+IY3O2BQLvftWCosRuEkBYel9loov4C9vI5VApx3utudPQ/?=
 =?us-ascii?Q?TBQad9XYpjio5g86x0XH65oC6tVyKaxvEWzLH11rcq5rupCU7ZDOZ4+1rPtX?=
 =?us-ascii?Q?c090yOMl27LOv+WgywN3rhWadHvkA3n9O7Rw5L8DxwZUIUPvU5wjULpXByXZ?=
 =?us-ascii?Q?RPXyXyz5L/ZlHLjwWXwRrjsVNUHU7IjUbWRNr0j/GWg5XrhFpz0pnB6cUAps?=
 =?us-ascii?Q?oI4XDdScQ7wo6Ak8xbw7gosqxWIaroA73tEElM3GcpKB9Rj+4ekZoMmE7io7?=
 =?us-ascii?Q?CPrBo93LMyonoriTCuxVg5KjeLAqAxsYzYu+5b5XvWC2Z9333RHMOe0doCWv?=
 =?us-ascii?Q?P9Z/DUR5NW+yE5PfHj2FpkwR7x6NQAHir9FB+ZLk25cA99JaTO1YF443ZlLz?=
 =?us-ascii?Q?WTTG98Z8r6O70cICcj8GalubE7zKhBXYZf2s/DyIVbirw11blFTslY7oSvjJ?=
 =?us-ascii?Q?NoOTFcD9BuX1FmpdkJDSO7yveMqaL+/Uw7y0/XHluDtG2F7xNuOJu93FEFVE?=
 =?us-ascii?Q?q+Nahpkf9JVI/LumQf9pKEmM9F5bIzOHaZDHMGaSS+pmn5QPeWdM9wpqS8dU?=
 =?us-ascii?Q?rkfe0FFt7fTjP5QSMnX7/odZhQkHlyfMf3WYutHLWPkAb13Oavub73OZnZ/W?=
 =?us-ascii?Q?n8p7rqY7GpHFaY2nJs9a8QOf12W/DCQxEBtl0ycjn7ZeCCP9FqS42qjImGNz?=
 =?us-ascii?Q?aMcLo+BxpmYKppB/oyXGG8IvXpTkyVjV39j8P6siYi1e5cNfnP9Stk2Tn6KQ?=
 =?us-ascii?Q?iVtm4sQHogRnEr5WIOtkfpQ4svQGInzc3W+xhu3C87QvSqCxTrTcRNJxtIP3?=
 =?us-ascii?Q?i34HusaJXDlKLj415dNFAfN7rTy48naELKKsGl8VH2AL2FWULZk3PNEQQoMZ?=
 =?us-ascii?Q?DVVvUxDba1KTQblX2hkuNKGUB6Wp9dQ+lS3TdMai8elZ88Lfltftpw/xf4ie?=
 =?us-ascii?Q?SnAILhYIf5CqpxM3WRs6HVZpR9kNghy9tp6pr2FfLx1UieRBSoCeC2DmpkcW?=
 =?us-ascii?Q?aJF9gXboCjG6ECbLgES1Wa6wvGqtgW/cbBUdjoVOqwEXkIKhcFvsFbnnpMWy?=
 =?us-ascii?Q?KaE3bFmQ+pJ1kYd5jnUyXjKOQF9WLLs0PyG3Kq2pNF2KY89/ve9PDCTAviWC?=
 =?us-ascii?Q?U8Wmrd4dN5AG16ehonKfxVlJ25zd7VxZfFCRpBY1QdnWhWoqyE5WVMBNh6vQ?=
 =?us-ascii?Q?K19mfRV1BFIMUqR5VqrKVn9TnnJW2GsjuMorVwqw2jLk0nmFx51NQHXg5AsK?=
 =?us-ascii?Q?iJbXfvLib29pginCf5EuF/gQKFYiMHsYo7ae?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 08:59:17.2587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93355786-b95b-4fd7-acfb-08ddc510360c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_015923_968192_071D853B 
X-CRM114-Status: UNSURE (   6.13  )
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

>> +&mac0 {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	phy-mode = "rgmii-id";
>> +	max-speed = <1000>;

> The MAC is using rgmii. How can it do more than 1G?

>	Andrew

Thanks Andrew for quick reply !
Will fix this in the next version by removing it, because this MAC can negotiate with PHY.

