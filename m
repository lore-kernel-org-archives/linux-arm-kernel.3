Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7808D3EE86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xc7P1ZqCIqhOqsfObuTAJJMsngRk68bcs7Z96rmfEi8=; b=mu4LWn/gtTHimAJFmMMQ9qO2ng
	2tE7MCJhBNL+lVdcfIrWTTgtAcUK7WZ5OuIscywtI9yj0po4nB4GqpbJOtbvX80cWThyrRbQ+SPIJ
	+NLE8mpNn3y64WQjZIUWVYlOeN40Rk43o9P/iM1dONUXhPAVk4wNzocHDoAku1/s5QjHiAegPqFO2
	9iYmEGwq1dZygHc4xPsjbe5G+1oK7f3VfdDcCqEl6A9Tu06d9yDUpIr4fI1gVYcw8GSDn8hK+nc3Q
	2eqaC36X7ipqPYgAkYeMCWVOSgjsgV+6T34sABL5QnyFQPLtPQ1kWBknRRwzWu/GRGMU/tsy1hBgc
	CPKhnx5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwrj-00000007MIi-31ay;
	Thu, 22 Jan 2026 15:44:59 +0000
Received: from mail-centralusazon11010067.outbound.protection.outlook.com ([52.101.61.67] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwrf-00000007MIH-16wI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 15:44:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7NZRVQQtMGoFKr24g2L7NvZ970mFYm5lgHatJBqHECK5jpn91z/R4DQd1bLgZQnz+qdH3hPtIK+rprdb2aykdMKfV/ezW2BAXXGuts9IAz/Xo2kx3CUIWPKCMjmjeuvCsgXEeZnqJTLdSEQGYCcHWObnRyqBouvQDwKaXP/LKWgmxqKrSd4j1G/VivtRwiCangCP7/cQRwj7P+jBBusXrxbf+hfMxiBZznIb97zIMN7GN+zkMsvhXPi6rBfgItT1O72td5qu881ukSLCljRIoswzZjU/9MErBobLx52NDM0P2g2VZVkn6WZaHx3eG9Gn/iAzPo6sdrnw0lXr/t+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xc7P1ZqCIqhOqsfObuTAJJMsngRk68bcs7Z96rmfEi8=;
 b=r48h0sv4b1gUE2pUFlb2wpNkDV2x4k6PgKFlj1C7zUZa6gHvCLRJhcgLxZR2ITXATDOpVtP69PDQTJAmtxPtO+bOHCZoYrdw2ZKDQQF+grOdkaPYykL/+WqKfJ0p24xAVzGHViQuWTx4zOT1dlvKoW+Y8DHQH6clP8misN25Lue7dYnOIrmzepc+Vp+SlTQldmVmMyN9Q2P81ElwWP1HRjbXCHG/QI5/ogr2j4VPlnwd9GQMvD0NAF+5vlFwlpLMGu+VH0qHa0uA9qN1NpyVUXgQex606KBrSVixGwwMpqNS5ddl58mZaUEGvAMaiMHoAOl6bhuF3dDnOgiJl8BUgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xc7P1ZqCIqhOqsfObuTAJJMsngRk68bcs7Z96rmfEi8=;
 b=aYtn3g1E3E+bz8r1Mzq+Esq24L1AL6wcG5RA971lVnrUyOBOkX2cr6j957Vk4/jgfdjnEveMyfAr9ADCHUqz2lG8XmH/C8iwgPEU8puJpKEcBed1Fk2LI7NKiF/kMbzbvTXBfKm45jjm10TNTuPkLOReJtHClxRhWPwRMJBaoD4=
Received: from MN0P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::29)
 by DS0PR10MB7407.namprd10.prod.outlook.com (2603:10b6:8:15c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 15:44:49 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::c2) by MN0P221CA0018.outlook.office365.com
 (2603:10b6:208:52a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 15:44:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 15:44:49 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 09:44:48 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 09:44:48 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 09:44:48 -0600
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MFilTU784422;
	Thu, 22 Jan 2026 09:44:48 -0600
Date: Thu, 22 Jan 2026 21:14:47 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>, "Bryan
 Brattlof" <bb@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62l: support cpufreq
Message-ID: <20260122154447.7r53x5f4nel3znmh@lcpd911>
References: <20260122-am62l-dt-cpufreq-v1-1-fabcc15e25fa@ti.com>
 <dys7x6zsaofct4ozb4unbojc22devxiz5qebdb7m3b7kxx6nmb@j5iaqv7yuptn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <dys7x6zsaofct4ozb4unbojc22devxiz5qebdb7m3b7kxx6nmb@j5iaqv7yuptn>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|DS0PR10MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: 147fe150-c7fc-4fa4-5821-08de59cd2d31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YxWbP3CG2t5YPHbYw3JNsRGo1TuI91iks12SKxsx5rvB1Ih4RcaNo2frfRjU?=
 =?us-ascii?Q?UdyXsCI7/8CGuAa4m+liiVQ3iGwhvNHeq7DY+MUTd12sZdv+0dCQX2yAjk7i?=
 =?us-ascii?Q?xlYnWYObKEqze8kKBRfBdCiaeYSRYNjwFliNfBBB0ZIZ4zYK35VEsTBPSz2Y?=
 =?us-ascii?Q?ngoPug5WCF/VyXhuLUadNe3c6r8Sp7Hz0KVEz5I4hIhQ+HhBiItXAvhYisKj?=
 =?us-ascii?Q?9jC9afOt7L5ZBkwRgZl8mB4uWKxXijfmd0vDASvVm3ZuP5D2BVA/eBdFDDfu?=
 =?us-ascii?Q?JlbYsSKYgIZFaVx2DXcn+K9+Gh9HAWEjYtWTAy1RsvknqPqvBVKPqjLG5AzS?=
 =?us-ascii?Q?bVQI8mcNT0p7+eIpHf2/SRjn05h2uhiOV1xqtoIE1R7YSpmH8dKEulSWEMKu?=
 =?us-ascii?Q?aVYMyF1uA2rpJlLNrfyRYNtKzA5DFAalBQD/Uq+d0I2C6XGT/U16nN04tCum?=
 =?us-ascii?Q?ss3Wfyg+QqFSYAMpwImsf7Jm8ZI+/ehQ8TJG4ogmFRawEQLDKzsyg1VYxiU5?=
 =?us-ascii?Q?p2xn6OZgZ+7O/D4f8COSGL2DfK7yEBd5iveT+m0viPlcbRGL+vfdM2n3e4+9?=
 =?us-ascii?Q?oBoldwpoyugowwMW0Ee+EJeS+9FOkiMUWXtWCSWuPy7wDqS7zaqafChSLQfq?=
 =?us-ascii?Q?XPNNjcaueo7B2qiRkQ3IgnJaCZ0KM4a1+PfJe7qiLbPelwy7RnxUdHGY3wEd?=
 =?us-ascii?Q?HHRvcKDonZVkksvYvchh9a7LjhgRwhO66IOkgnEcDzmK1rRmqrsdSxmYp8kF?=
 =?us-ascii?Q?gwL1Q4J0wRZPWuwKbVRbU7x/VH0Io+q0+fHshyxjlugFHf2wligNG4Djs+jU?=
 =?us-ascii?Q?1BJrh4HXLIJM/tVswxqOlxxSaUXZVgGhdPi1qZH3n8JWn20E/DunDiFjxQKf?=
 =?us-ascii?Q?shlsFy5Ex4mh3hftDq5IF7a2YbCBG/ct7sV9YelV2RF1uumJqB+nMMkSCWkb?=
 =?us-ascii?Q?502buotVYpqB5Gw4tG8vNq0+n+mZttSKAK1K30U5Z+HywSdHURHajY4LzbxF?=
 =?us-ascii?Q?3mgKR8VKQMc6/W4dGMMNl88gQTU9GI53oU6IAkggl3m+BZpH+gOkW9bdh6HG?=
 =?us-ascii?Q?9KVyCH/ubQsadV+OR/EXhJ9oOV9hWeNpiSCqp3K7WJiPDr+YWpbWYMUa0d6g?=
 =?us-ascii?Q?U6X4Ulg9W9/c0995kgodkfImHL9SwoGoODOvXm1AQG+Sm3Kzs0DGnAAGkg85?=
 =?us-ascii?Q?VSQcv8mSYDOPV9eQRQBTHFcPghTfjjfT9d9iRaQCxvK9rVIPqa77SVwm3sUA?=
 =?us-ascii?Q?rS1YbqKiuFTv+dbqgrL1IYbpRjjjd2/W/0YnzgL7B6psmw4U4wl+SJ5YJvm8?=
 =?us-ascii?Q?YWa0GshDvNRndbAiiYxXtLkPdEWIe40ywYjGsRQdplUUfyEIJEnSdEeI2ZSj?=
 =?us-ascii?Q?2JaqaPLfvupwdXWZN2tfF4/cAG1Vau9uKLyXKsDW1NX8jlLPVmKKjlNFv7MY?=
 =?us-ascii?Q?iimczhQ/gQbZjykQfAVQ9vobYereEeUTiWmwKivLngTGdZ8IMLBVOKdmld/N?=
 =?us-ascii?Q?qAvsriiB0SMGP2q6lU5+6JMm+wDLFEHjnrp3ua3KEmJC4ltaaXPmOCgHY4wl?=
 =?us-ascii?Q?eaVIH0bvmduN/ZQ0q1hGdQ/hdM6rqhBOKhtn9SUF+Rhus3xBYNLCGtzT0Esl?=
 =?us-ascii?Q?IxRYg1/dX8C6an0sDocgFe8EWJIYZr5ThXMEKcxPZikyK2WAB7XPCY6tjDRJ?=
 =?us-ascii?Q?dMaapg=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 15:44:49.3426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 147fe150-c7fc-4fa4-5821-08de59cd2d31
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_074455_672657_2E73EDE8 
X-CRM114-Status: GOOD (  15.78  )
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

On Jan 22, 2026 at 16:56:21 +0530, Viresh Kumar wrote:
> On 22-01-26, 16:19, Dhruva Gole wrote:
> > Enable CPUFreq support for AM62L SoC by adding the relevant OPP efuse table
> > syscon to k3-am62l-wakeup.dtsi for speed grade detection.
> > 
> > Add the operating-points-v2 table with CPU frequency steps from 200MHz to
> > 1.25GHz to k3-am62l3.dtsi
> > 
> > Configure CPU clocks to reference the SCMI clock controller for frequency
> > scaling
> > 
> > This enables proper CPU frequency scaling capabilities for the AM62L SoC
> > using the ARM SCMI protocol to interact with the power management firmware.
> > 
> > Signed-off-by: Dhruva Gole <d-gole@ti.com>
> > ---
> > The driver changes were merged previously [0], and so the DT patch
> > is now being posted seperately. 
> 
> This should still be marked V4 with all previous version history.
> (Don't resend just for that now).

Okay next revision will mark as v5, and add this link for v4 changelog.

> 
> -- 
> viresh

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

