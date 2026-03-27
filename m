Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6FB10BA422
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 04:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nj+PjeB8VWnR7P3nGc11XtE4PdEr+v3PJz6DBPGoaKQ=; b=bCtavOBXAGW4rcdYQT9sCjMo6z
	psH6LuHoQ8YxELztqM5nfIzn/oFagXOq1SKrBpODwvUgXi0CEfQvommOL/XZtMpIwTuKikxmtxw1n
	8SUJWjbqa8PioGr+v5CqiF0Y2pzaf5aYRzHIl+eU8LBcsy1TeMUDDsVFBIzJ7+5TnF/7Yd67lPl/C
	c6+cB8Jn34yupZXdAe38XlYYXjPwfOVaxvp+LE3f5W4WaWXLt8+88zO7JWhlR1sbFk1GF5kVyelWw
	C4r7MJrIn2BwveIoR0tH21MiwQllBsVFOpuKBRTkJ3eNoSxQakr3b2uUyCJLC7SqXw1W3AYKREkso
	wacfA1cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5z8D-00000006fvo-1vmk;
	Fri, 27 Mar 2026 04:49:13 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5z8B-00000006fvL-3WJe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 04:49:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoA/6+e732u9Joo9omr5oeQrb4Sy1Dw4ImWFVijbYVerFtv7mFiGjt59uS4EVMGz1iGJHW05+5qTr9hYR78oc/iw9xP0MadT1TLmhwnxgm8SytZpNgWydk5mNUNagG8Yzh30aGhAxJ8MMNEigyDOZOf8ATlk7aa2zXqJOs1x0hz5Cl1xid143B8/fALC3XOVK3k7CT6up8B3QhWmPayEPGwj3iZRIXiVSVJFLVZLHSM5v4y0aiAsNwjrEEcOKsFeD5Dtn4xmz+sa0GCyWeegBCZU3SyBUaVrhP55o8Hu3Mup7k32LejWXLrtrjGA2rX18ehSgF2Qu1f85lxc/v8SjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nj+PjeB8VWnR7P3nGc11XtE4PdEr+v3PJz6DBPGoaKQ=;
 b=LRgeTZEy1+vvcdziUxatkio/549efe9/lBsFOtBtuXEaf/9D+NqfaAo/FM29aHYblKVxFWl12ekXtQA2pJDh88I9RnQm9groBYUvkPXuOSsDlh7wXGtc1yrAOdzPXiw9ftDYh7Ilz9uNRvjB8f2PraJO7DMN4EZazIRCZwumCBCSObzJqvFPluQxVWCNXATMDtIaNaceOIdcgJldv4AbXbV9lZmClJrSL+y/BlmpJ2YqwSf3WWYWvtINUB6uGi519FgNpLgr3BSgF3EE3A+tubYt4nXDi35QkJdruNu8Lg3QY+4lwPGhsxVDp83BMECRXOQLBhlSgVtjIoESJol/sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nj+PjeB8VWnR7P3nGc11XtE4PdEr+v3PJz6DBPGoaKQ=;
 b=HnVsKzrxyn8O/8Oa4FpvTbw34lpPOv2OTgDIkPO8McijF3RNHwRYXYLzHRLofn90fkg2FeuPfgVRe/gHYdQLfetoBoJXKI4OUTKxIZtbCtGPi5KkgvROhXb3JeD5+WRxF7D3o9NXtp2ShNWBzSKa3+EaYYD4wCqb1iuBUAC5/bg=
Received: from SJ0P220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::6)
 by DS0PR10MB7019.namprd10.prod.outlook.com (2603:10b6:8:14c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 04:49:05 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::24) by SJ0P220CA0030.outlook.office365.com
 (2603:10b6:a03:41b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Fri,
 27 Mar 2026 04:49:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 04:49:05 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:49:01 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:49:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 23:49:01 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62R4mxXA3357449;
	Thu, 26 Mar 2026 23:49:00 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Dominik Haller <d.haller@phytec.de>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>
In-Reply-To: <20260320212349.420951-1-d.haller@phytec.de>
References: <20260320212349.420951-1-d.haller@phytec.de>
Subject: Re: (subset) [PATCH v4 0/5] k3-am68-phyboard-izar dsi support
Message-ID: <177458693758.423823.12695860087291022288.b4-ty@b4>
Date: Fri, 27 Mar 2026 10:18:57 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1507; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=yWagk4BSwVhrwh8xoVlLmwW7gjimNcQK4t+gQdPlBVc=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhsxjPNYx7+c4Pa9hs5l/9uqMWO7jSnvmCDndWpzPveCh2
 AWb7/FbO0pZGMQ4GGTFFFkC2HbNskqxeBxRkbgVZg4rE8gQBi5OAZhIKwvDP7VHqzbzza/5WZIh
 1iEQqMb1u8zLdrFYkjwLj/n9T0k+towMu7znnA1dZO24cev0ktY7POXsOkol3s2BRg1LjFVzT5l
 zAQA=
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|DS0PR10MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 111de957-5fd7-4200-2809-08de8bbc2cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +YkWgUqhaQwyZbGOSQmccYGB70+S0ItBd/p0vsSDCTAcSmwMDEl6X3SY0w/kGhNF2aq767fi/ZDxJHtsG3xlK1VdKHCnrCCi/2yKmFrPKsIF49WlKtqanIDEfVn4mFR8kRtLUfGA0uZ2AjAnHvAASr7/pHvY5dlAUM5e/eWaGlHf+eYKcBRSRiCCMHC+wnwABn+U5vgfkokvrEe7Fr7q69QySGjYSh48khD6vg43z299kdDXcOBFf80Ki6X/8CJK19bSSa0Wbh2KFMmN1bvbS2p/k8Dl5J28WbhTPovRUVjr64iV1+GOLNPWJ98K2Yk+3/1DEMFD//Aidgrrc5XTHiIxZ6C23jLL6qyHF+79JJl84/pGdApEHVnkNr8k3wukZIDyHrk2G5XA8KdkitAaVVV8nmbKgArU0XLl7fubd6VDAUgMdff6z1aFiTaYamO44UxUKtb/+BEFs596iTJXy0eyeWd8jUC6MDS6AG78616AG8ZRsT1dpeHapHtREY8RikgE3fRr03kbdMpeVUYeUgSVT+59Fopz6/6h+BXHsX9dWONkl2yygdtJNcSHen3ZT2ds3P7TG7tdLW7X61AkWccO0FeTHDbOOI6il8iHDyNl0gAs9Jzmn/5UVYYj8sIGetGhQh1QomP0riNsC/RSAfDWD52q6YXGmDp6i+/LJPVrsWhVftUFN+pXnwJHKhN0+TSC6jbNLej/uZOivKA/eWQKh4YRTEe3MH+LhKeOLCN8Y47QnZqnzGMj+pVlcDiTZ4Tup5y3F2xBmD3jFFgsag==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oZIRS8DURIBiguZ+oKPYf0BRQFg6JVFB9Otvd7aQyvlM+rUgOCTnOXZUl/jtuUibsoGAoJCYVYzPKotfYwI3fZy9DFiHY3GyxJtV190TU5SW3vvswuFwpOFn5JKntDEBQYyFN+0JfGCvVdEGixtLLvr7kA0yJMWKwl89xOqlIIc3KDISLiQolZ3S7lIOjTJL8skyn75LmnS2ogY2MLJXWd9pkLpvFRx+B5RBCVNrrW0WJOXG09Y5q52k/epvVnjSXypHKhPQRZT4b2Vm9WDIHgAsRv/x+KHfMtSB7OHgWaL8xDeKGmmktpmUAnes5ptGzjlDu5uf0a6b59HYWCDTOfUw/EhO4Dr0xOpcYlFercsx9z6AfgFtZd3zflzkhuDeM5K9DhVDWdXJYaAe4TUJb3sE8169kRroced5R9V8ErTjgFKJik3uv13y9V3bClUZ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 04:49:05.4352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 111de957-5fd7-4200-2809-08de8bbc2cd8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_214911_885135_639BDE08 
X-CRM114-Status: GOOD (  12.77  )
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

Hi Dominik Haller,

On Fri, 20 Mar 2026 14:23:41 -0700, Dominik Haller wrote:
> k3-am68-phyboard-izar dsi support
> 
> This series adds support for the two dsi based display interfaces of the
> phyboard-izar with the phycore-am68x/tda4x som.
> 
> dsi0 gets converted to lvds on the som using a SN65DSI83 bridge in the
> default configuration. The phyboard-izar kit comes with a 10.1" lvds
> display with usb touch as addon.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/5] arm64: dts: ti: k3-am68-phyboard-izar: Assign dss clocks
      commit: cda1fef2ec679bfb74580273cb7dd7a1cecd77f7

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



