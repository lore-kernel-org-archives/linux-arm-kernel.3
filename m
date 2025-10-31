Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82F8CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYJeF3wmuBjGKWXkbVsWKBWFrVKnzhhmbYWuAgQb6eA=; b=TDV6HNZzOip3kEU9npVJaDY0nm
	bGg87UuuuhwR1/XEgo4lTiyu9deDf9iQR5as4PTx7mKIS+xJLwFIfGZB74ZX8H4SACW5gDHd1e9e0
	0Etq41i4m4Cm+BBVtAOUW3st2xJRN0zy1Rt6Pib6pYzruyghK7PtKEtdDGw45rM1FtdnTbBDvbwSw
	/aFnk12mk4UqRld/cEF/p4Oe49SV8zM6ByXIGi5RBlQpg1OaCmbgxqXtN5ptIu/whR9yLHZW955J4
	pXVL7psc7vWwXrJivPTZmzVA8qkW35G8gnITS0HqccnWny3/6bs7sOpBEVz2R6OgTseod992Nvfrd
	AVx+dDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqLh-00000006FrJ-3Bm0;
	Fri, 31 Oct 2025 14:43:29 +0000
Received: from mail-westus2azon11012012.outbound.protection.outlook.com ([52.101.48.12] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqLW-00000006FnG-1RUU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 14:43:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEihO8Ig85W/g5kkL6aMljXun4S2Tag5bD2TB3HnuCEhVdVA4P8oMDeGTQFDqIj0C28hHFQEe9c8rtPJ8q5ve1nj/U3FDSeTKY+3pQ2wRwTqvql5Hou/5A6xngjpTyWoewaS07tAUonpdUBgqvqcqx1jidmQNMwawYDjNdQwqx28kBZPdPipIvOW8uYbzBDZEcC8TyG59cWMPvl6qlPh6mFcvc1dGj8uePWu5Pns0rN7dLpWJWTeoeik1RPPxwq0UwWYlHMIh6AusxiZakMANkMxZDqCu7YT+eniLU2ON46tdDRDPYbhiTxKfS/DSnagAqWT3+7bVB3jHkJzqB+qgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYJeF3wmuBjGKWXkbVsWKBWFrVKnzhhmbYWuAgQb6eA=;
 b=nd59DJv1HQqOkZdUSm/WAEpfVtyUZ/ImokDyEHt1NXyB8AR7ZlyMjl8qJjY6xi9MRRwt9CWGSNwi2Mkx3zpsWBV4An3BkX/PiUm6lMolimZrO6ZUvgCSw0K+dTobG0/g7RRraPhytNXz8LmLvghkcRNIuwh0tC09MaLAx0gfvdsEFtlfamofltdJcLaFKtDzrXlYmwKk52UvPpssTaVaeEcsMogkZ7NQaRNKgPsQ6QrL/Xhhb/xl3sW/sUVoapSNL/gDqq45lD35DslC4QX8uz/LPqz6jbkyiee95WGClHyfzCnWBHXEiDoQtKPvk+bEn/A8Si7t9s/Dx9n/7eV04g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYJeF3wmuBjGKWXkbVsWKBWFrVKnzhhmbYWuAgQb6eA=;
 b=pOZUMJ88Fkvf5cVo5WX9chwp10O2BPSDHrfLEZgQE4eWIXX/kAImnSsxi9zNoezNG/oP4zTOIBvP6ZORbDR+oMANVgtyh5TTM9khxatukDjEMVJO9UxxbXEDBZRGyRlojTTW+B9TdcxbdtF7lHl6ijkjcUyPSZQ7MDwfd+OGX08=
Received: from MN2PR12CA0014.namprd12.prod.outlook.com (2603:10b6:208:a8::27)
 by MN6PR10MB7465.namprd10.prod.outlook.com (2603:10b6:208:47a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 14:43:12 +0000
Received: from BL02EPF00021F6E.namprd02.prod.outlook.com
 (2603:10b6:208:a8:cafe::dc) by MN2PR12CA0014.outlook.office365.com
 (2603:10b6:208:a8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 14:42:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00021F6E.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Fri, 31 Oct 2025 14:43:09 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:43:00 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Oct
 2025 09:42:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 31 Oct 2025 09:42:59 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59VEgf5Z4024498;
	Fri, 31 Oct 2025 09:42:55 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <praneeth@ti.com>, Paresh Bhagat <p-bhagat@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <kristo@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <khasim@ti.com>, <v-singh1@ti.com>,
	<afd@ti.com>, <bb@ti.com>, <s-k6@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62d2-evm: Remove unused ospi0 chip select pins
Date: Fri, 31 Oct 2025 20:10:57 +0530
Message-ID: <176192142799.427883.12507657912485328517.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251029032144.502603-1-p-bhagat@ti.com>
References: <20251029032144.502603-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6E:EE_|MN6PR10MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: bbbd9a83-4aa9-4896-a953-08de188bcfaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0swZk8vUGwxZExTZnc0MHYzRkJWS3QvUDkrTHBJQjZOT0dyS3c5NXJkYnNl?=
 =?utf-8?B?NFJWTnNQclMzcm1zc0RGeG41Q0FlZ0FTRFQyZ1Z4a0pLMXo1OCs1U1lHVXpo?=
 =?utf-8?B?YTY2SlVqaFB3YjZoeEJYZVZmVUFOSFhTSXV2bEFwbTQyVURSYmRQWk1NUE16?=
 =?utf-8?B?L0U2NGtFeEVSZHVkd1l6ZVZQdEQwOVU1VDJZYzVsaGhBbzkzbURDbnAzR1hL?=
 =?utf-8?B?dUkrUTVNMi9oeFVwR2NNSm9pbkNCTkJzSzhNUUNIQzhNcTA5dERkTm1FU203?=
 =?utf-8?B?d0c4RUI2OHhUWHdtU0xqNlFFdVovb2tPbEpyNk1RbHN0dXZKYTMvOVdFNFND?=
 =?utf-8?B?Q0xEemRuOGh0R0lIN1IzOVlpQmV6Yk9tTVpkRFI2QUZ0WmdMd3FHK3J5Q2w3?=
 =?utf-8?B?STI2cGdWaDFGdnpCalExai9xbEpSMFZuQ2g2cWZXNi90VjdndWhEUjFaR3NS?=
 =?utf-8?B?YStqMEpXMDd4TWpjdTRGL0hFVHp1MWlEakxaWVQ0eDUreWI4MFJmQW41Z25r?=
 =?utf-8?B?VEF5UGR5WUtlVGhSSTZLd1p6NlA4ak5FMG9pUlQyYUs5WVUzV0ROSkVnZ0sz?=
 =?utf-8?B?SW5EVkxJQTQrRE9GUDRxVWtZMUlJNk9DQmtGMTJ2UzlaTlkwdGRTMVBsYXpC?=
 =?utf-8?B?R3NDTnExM3A1TDFEbHJDTjZDZWlLOUJqZ3dEVkREMXY3NkR0bGNpeVlkSmRz?=
 =?utf-8?B?Vnp2Q3JkS0NUWFBrTU51cG8wZXlUZ2JTekJkK3BaZ3lTMWxMc0JkZ3FzbG05?=
 =?utf-8?B?NzVZMGV4a3dqRFdRQmsybUI4WmtOQklyeXBmeGpMQllDRHZmRWNaOEViMEdu?=
 =?utf-8?B?cTcwaHpqZmNhcHhxT0MySmtIR21lV3lCN1k2dEw5ZERxb1A4N3djTEZJMlhU?=
 =?utf-8?B?SHZ1K0tXMXM5c1dNbHNsdzBlZ1U3MVZvQ3IwaGhtZSt6ZGNqL1RHdjBDdTc5?=
 =?utf-8?B?ZTBBeE5NQjBvNW1tL0hVc3ljOGZ5SFFzMGk4Q1JrY1N6QTlhSnkwWkhSeVRk?=
 =?utf-8?B?ZDdIWkNQNkNtdXlhZHJOeVYzSFJnZXNERXNNRXcwbkdUaTEyQUpmNk4vK3FC?=
 =?utf-8?B?ZWJDRXNDTnJEaVNWVUE0U0pJb0hZc1pkeXZyWWJwU01TM3gyZ1FveWZEbS9F?=
 =?utf-8?B?N3JBSmpObldWeDc3QnQxL0VjWnRWaC8zdms0cmZwS1lKOVVUYWxkK2YzQkZV?=
 =?utf-8?B?VDF0bGJHakhFbnpMVHpGaVp1WStHdEs5eEsxVG9YcmV2aTVJY20yWEZ1dGUr?=
 =?utf-8?B?QUJ0NnJ6ZlhhV0I0TmxlWnpzTW9jV29PNjlaWWxrMDhEbUN5TWdRY29JbmZv?=
 =?utf-8?B?Zyt4M0luUFhhVUtnalZHYXhUeEFwTEt5Q2ZtNzJYN3pwWmt1eEFQQWdWUXgy?=
 =?utf-8?B?aW5IektSb1N6SEFIMzUxeUFkSlRTdk9ycFh1YVg1azNvL3VabXFERUxVZkhw?=
 =?utf-8?B?c1hWR3grR2R2VkVZTnVudGJXMVc0eWpWZ3JSVTAzeGw0YjlPMGZWQkYyRE5k?=
 =?utf-8?B?R25oMEtPTEYvUlR4ODJMTXFrL3RuckpZM1JuWjdpdkhqMWNCR1ZLbEpNZlhN?=
 =?utf-8?B?eFhyNmZtWDVMcVY3c0FoOTdWZXpFQ1dra2JHRGp2amVnZnBNMGcyK2NoZEhi?=
 =?utf-8?B?Z1dnbUwxcWdHYVhhUTBObStQQnk1Z2VGbXBWK2RGVXdxQVdpaTFMTHA5azB2?=
 =?utf-8?B?QmRtUlVaVXVIYW5lSi92U3czdVh5UzlNZ1BKdHl0bDZmR1J4QUZMYmVESHZD?=
 =?utf-8?B?WkxycDJpQkdyNS9Yc3dtY1h5b2xRZVVyWmc3S0p5UjVYNGR3S3dTdVJhWEQ3?=
 =?utf-8?B?MDNzZ2kzcUx1NlNyeFdKS01xZXlaVUs1RXRRalJHeU43Vm5xdUYydWFiU0M4?=
 =?utf-8?B?K2pTUXFPWTdMMzFEd1djanBveXNwcVdRUlNkV3JHZndzNHk0cnpDZmkyT0pw?=
 =?utf-8?B?U2RQM1cvUE9oL1FzYkh3L2dUTUZCeHlEYlRjQndLR0xTUjd1SEI0SGNJYk41?=
 =?utf-8?B?WGdaMUszZHVnb2hFSmtNMUJaNFczUk1CQlRIYzkvM3VPektmd0JRNDJJU09X?=
 =?utf-8?B?QytsTlp6SEdURWpTUG5iVk5GTnU1ZVIxVDJaa3l3Y3RNMlh1NGJ4Z0pHZXpN?=
 =?utf-8?Q?Ox8w=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:43:09.6067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbd9a83-4aa9-4896-a953-08de188bcfaa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7465
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_074318_401612_D59C7983 
X-CRM114-Status: GOOD (  12.66  )
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

Hi Paresh Bhagat,

On Wed, 29 Oct 2025 08:51:44 +0530, Paresh Bhagat wrote:
> Since only a single flash device is connected to ospi0 retain only the
> OSPI0_CSn0 pin configuration and remove the unused CSn1-CSn3 pins from
> the default pinctrl. This simplifies the ospi0 pin configuration without
> affecting functionality.
> 
> 

I have applied the following to branch ti-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am62d2-evm: Remove unused ospi0 chip select pins
      commit: da84d094ded6e332c88c67218faabfbf8d3d59e5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


