Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20091CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OM/Z/Db4w2vZA4wn/pSiwNdowgqblpIpBYy9aTQN5jU=; b=epfy0ib/HMOvqdNzyUY1t4Wz6j
	1oYWY9R+WkPq5a4AEnE4mBMf31X0HvS+FTFlP03woYpSkHV3FvY6Gopd+fOCqw33gODvjN/QpWN2W
	KCKVBZDaErV6OaHfgp6+wyqBosKdMATfdHo71hXlVO7CV/8THST6loE+A3qs1cI7MiFiX6cOXU2Ip
	xwWmtK2+8DosF2oQL907dZiJTBr+OtTs9LPo33n9XybLe9wOQ1QWkllwL15Lss2VLqrHcoUD/vII/
	1i9sPkofDAQ5na6weZQF53SZDrDrAwylQ9so80M4c8uPckxVJBMbU+WrFBTEMI4MnCG7e1UDGlBB4
	7dqnafzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7DLP-00000008aI9-07Af;
	Fri, 10 Oct 2025 13:39:39 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7DLL-00000008aHg-3dHH;
	Fri, 10 Oct 2025 13:39:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MopOl4Zm5EAmSH2Y95YlF13RjLFncPFtRj380UBUPIBqeCBL0PPV168Sakciy4JZzL4emONOoyC6aStUgvTL5I5SzimxpRvuhG1ABt50ZXeDaR8l25sD2VwJPDVhhPOoLUyUrjVDeJ4N9rsKc1pLkm1pOD0pAHjRzyP229y3yk/1LgUgC4mxOSibpES/E4DwKSny5zBJlIiooCfVaSWvM6zPWtqb0Mhko2BcJUzgYefMTpu+vvHCuK71zC5DjATftdJ2R5Dfo4AKsZIiXHW63u2C6O5G3AX5krUIF2PMETuO94IowyCiS01cp7vEt61Y3raPvSLoivCHISXoBj2SFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM/Z/Db4w2vZA4wn/pSiwNdowgqblpIpBYy9aTQN5jU=;
 b=A85AUyo3B1faar7EFBTpjZ9fzO7acXEqVggSNfJm/GX9DgXX15Ac9qDIU700u2tbjMXBiQcUV6D9aC2HLXfW4b7oANQMdcbu6mRfsMnhjJbPDgN2czvUMPJ/65oZJAH/pnEjt+mjaWXe+Y5EoK9lA9guKXJqPR3Da2EevQJKl7AvvJLppNILaRF9b9oH3fPFPTnSR5WLj2ZDGE5rpSc4QcZRe759dekhofk5Bsc31wnz+u9jt+ISwMmASEcz9maH2OWe06AokxE1upbFINyHyQm6tgS6mw6TAK0ityJrRtr9Mkumts4CPuJ84Z8iIzPxyATDHNO8bsbw1r5Qobbx/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OM/Z/Db4w2vZA4wn/pSiwNdowgqblpIpBYy9aTQN5jU=;
 b=SepOnIEeM+0M1HH6p3v6xyrDN60mEnyGtLOXfjSwsQV99/sES/M1G7xlMiYLeZ3gXreavAkPzeb4Pr2QRNZvv6AI+r47sxwzopsnQ4y+ByqrCSi0OZo4ToI1DKANk3Z7IBG2jmyMrhzocfQs26rpPMesx/hSxMN8ebIluv8U0z0=
Received: from DB7PR05CA0023.eurprd05.prod.outlook.com (2603:10a6:10:36::36)
 by GVXPR02MB11133.eurprd02.prod.outlook.com (2603:10a6:150:1f7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 13:39:22 +0000
Received: from DU6PEPF0000B61C.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::c9) by DB7PR05CA0023.outlook.office365.com
 (2603:10a6:10:36::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.10 via Frontend Transport; Fri,
 10 Oct 2025 13:39:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B61C.mail.protection.outlook.com (10.167.8.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9203.9 via Frontend Transport; Fri, 10 Oct 2025 13:39:22 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Fri, 10 Oct
 2025 15:39:21 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
CC: <kernel@axis.com>, <linux-phy@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] phy: exynos5-usbdrd: Remove error print for
 devm_add_action_or_reset()
In-Reply-To: <pnd34a6m7tc.a.out@axis.com> (Waqar Hameed's message of "Tue, 5
	Aug 2025 11:33:35 +0200")
References: <pnd34a6m7tc.a.out@axis.com>
User-Agent: a.out
Date: Fri, 10 Oct 2025 15:39:21 +0200
Message-ID: <pnd7bx2j2pi.a.out@axis.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.4.0.13]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61C:EE_|GVXPR02MB11133:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a48c1fa-e92d-42fb-ad9a-08de08026bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5g/58upOCZQxAZSgXlg4IcdSa3eTbnjf8fgeUgLBKOy1KT5qfL/uVYa8Ab7d?=
 =?us-ascii?Q?J9fAq/7QphZC/SKToJxkeIFG90LR2x4BaxyH1CxCDzJKtlMAmiVmgS15+Vat?=
 =?us-ascii?Q?s6c93uSesDngDYfdr5wIR/PY2Ji3V3cRZMu8eEK5c0WLBa/ma4sWaiftLAa7?=
 =?us-ascii?Q?7JvMZavkpddq5H5M5KxNBt86Lbw6eoffTRWoYT05Gho4PtZBJN7zBEJbJ3R3?=
 =?us-ascii?Q?VvK2Zuc/ideVdQTkf+5SrlM+SEabbc8lE5iRzBX4I0wRxLm+/SnKAj1jD9Mc?=
 =?us-ascii?Q?+L0meOZq+jKAe5cIkvm1z2ryPMWYcldDQM8VID5F+Kr3HVuaUez9Rzgiqpjc?=
 =?us-ascii?Q?uFqnCLxsEDDZ9ZTONUiu1Sct25oNZvWQCLsMhAnraYQRDDgGrDlulpZT0y9O?=
 =?us-ascii?Q?GqV25DGa9zozLjRmvyDvnOHSY1bTHcsrGHpP7UTpH0BSiJNPy1/UJD2ZW0Pa?=
 =?us-ascii?Q?gBrsuuConI2Li6BOtdE35iQPVhjqnRk6AEy82ncvG4YWnfryb7XtIiIezEmn?=
 =?us-ascii?Q?BGNrBnoZJY9ndqMgJs0JshGsjJpg2rExetshR5OA2pNHvT19RH0vZM7Rd1ys?=
 =?us-ascii?Q?9i6OcCDDw0M9mbbx8/UW8GSfTNC19JSAkAn4OLpzxOV5tD47lFWFZ2cGkf3f?=
 =?us-ascii?Q?+a6AqDpxteW0QkRqpNZWzz0tCkrhXRx44bwazawoq+5mDTICtCv1TvAXrQ2I?=
 =?us-ascii?Q?n3eZvU+Q2OlK3uk5eiKmf3YInkYQrUe4970veX/PvtgXoMY0Yg+HRyTfDtNM?=
 =?us-ascii?Q?EYoe32JhDc4Y26mmwfF5cGsRJjVgOcCHxcIQf9cSFaW12W6sAgMZQWmbxSZF?=
 =?us-ascii?Q?IaDaUxybLqsq84196aK32I3hdnIeMlugEJLE+Elo/CKrdxNX/0rWnmBj5hum?=
 =?us-ascii?Q?3/2kSrIR/xknWZQsX7gOvkQoYQUYR+TMkpL+ZLgIYa9+IxCBAtYfqKYkZTCl?=
 =?us-ascii?Q?fau3z0X3LzUWQx6ngQgiNqhQVXnm3M92bvYQnRdrHIY/gR4TMfZIBFddoleZ?=
 =?us-ascii?Q?py0MkVbHAM4nNVndbB/+snfZI3uXeLeK5dexiRA7BGaB9XUCnVJMlUT4q0NS?=
 =?us-ascii?Q?5Ev92sOghmYTx/8CAN0BFVlGtvwi9f6nExiTH+VvonE+HMctvBJpQAwItmuX?=
 =?us-ascii?Q?pLU5rMaVA6hVjefaSXhp3rek8lXs11xPX7Q9H7xMWlwesYnqRGvBou7I9PzA?=
 =?us-ascii?Q?2JHpmlo4NqB0WUi/tQeNCNnhRV2upQPZZ1/F9dhPWZzpgIvfrzABv2ZeT8TX?=
 =?us-ascii?Q?VtRdznXcRUcIrTnjL6AeW5v9Z31Dgeaw367OVbSn+hlZK3YEYuc2c6roqdNi?=
 =?us-ascii?Q?XeBr8u2t9qH/sIdc8q3yqwoXN9U62nJmnaxNwGDF72/ZNNtyi5C8QCZ8OB4o?=
 =?us-ascii?Q?2rYsdQLnM9Yb2ROwGrbtar8wWqjBgXZHb5sMQkhfLL5fV+0ZD5tDBx2yjhlZ?=
 =?us-ascii?Q?gN89ABq0PVfJEBUUKQo2+bL+3htDC/Jjo3uizp0HAzDhDBjeCDXGfxnV+tRW?=
 =?us-ascii?Q?01gr1VZ/IDKqgyU6cvqYinSNw6zC+DdZV6QKdnb6nHlEmoL1TV6WslO/TV3c?=
 =?us-ascii?Q?KzyLR6ZSDur4r/tVTIs=3D?=
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 13:39:22.6440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a48c1fa-e92d-42fb-ad9a-08de08026bee
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR02MB11133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_063935_903647_6D707511 
X-CRM114-Status: UNSURE (   8.75  )
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

On Tue, Aug 05, 2025 at 11:33 +0200 Waqar Hameed <waqar.hameed@axis.com> wrote:

> When `devm_add_action_or_reset()` fails, it is due to a failed memory
> allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
> anything when error is `-ENOMEM`. Therefore, remove the useless call to
> `dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
> return the value instead.

Friendly ping incoming!

