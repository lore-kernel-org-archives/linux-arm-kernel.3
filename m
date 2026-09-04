Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569FFC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yMSXBT4fyaK5m2Zt7RbIJ6CQqFEbYpu2QSvVhc/EoQ=; b=fEPrjgi7hciH1saIYhEKHGrG5N
	9ZbamDsmRSOjledP5NeM+WDeLPMtlOazBiuUzGYsBT36DG051RYm1rgOFqdKAooOXuJ6uEfz77wrQ
	jI6knaqcK6chKPOHxBDHJfEWAhCqlLfYeHtRbhR/1o3KjJtESjeK6H7uu0aoB/avPA0KfQRzYVBKo
	S0wSDf+0OOvoCpLtix+rsv8wcgR8+K5FKRr9zPwUjXfN4ybxhsUOPG3VTjXeHn/fc3lMMbmn18Bns
	qRBtu+VgZzORA6uVReqTaxkB9IRTKYqeSxtKSUAJn+OwSkgUg8ym+dUHJz3y+O9H/e9vmaLhiHWkJ
	NJHs1UJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WLS-00000002eV4-2TRX;
	Fri, 04 Sep 2026 16:00:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKw-00000002e10-0wdq
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 04 Sep 2026 16:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2yMSXBT4fyaK5m2Zt7RbIJ6CQqFEbYpu2QSvVhc/EoQ=; b=UdfBI+V1wans9OxhtLD1fFLcES
	5GuCk9VAPoym5bNnU6trEUfFyBFqYGgVSJ489dpzZSagum8spQviNxR9jukRZ9X0FSRG7JISivT1a
	Zo6DcTozjfSf65N2u0k63zmCYiJzeAnVBSbZsdhtgF27gx7L/sD4eo1xL455+gzTHX8DLlTqr4f0p
	Ar7UAKgdqvgFUmJhK8We/y2NW3jE10WJCgclPnKU3cTqQ+qqGnuOD8L5z8TxF3bWrqYs2uppWm9jM
	69hTYulGx6FjAB6V+7DCTJ/wto5qc6Ji0BsbM4O4r2XdFvbR83UCP/1u3gB9I3mkvLDCipCFKCESp
	vxrXcWuA==;
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2WKr-0000000EG1n-1iSe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:00:17 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 684FtnWY4122603;
	Fri, 4 Sep 2026 10:59:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2yMSXBT4fyaK5m2Zt7RbIJ6CQqFEbYpu2QSvVhc/E
	oQ=; b=fcPaQ+OzAaLVXAwZhEhvfY+tuqfWYtQOiR2M+i8Ml9EEv2tZY4jpq920L
	xpmpgH/3YugTDkRIHOAs5QcVnXujBizz12GmyuBO5dnWh96f8cawb40fsQMG0RtZ
	X1YdYsXM7SDl71dn8/nwByGbGUX/m61DbPiq0KIImC83bbmt6nQEldIYHSlAsti2
	5FRibqHD/z+VmxI2ITHueOk0cilUubXkRGRuLHc+sCEedjYVjahvyKZDM9BEmThx
	uuQ/s4KmJw0Y8q/dn+/nureRFLY3pklj5RoJijEae8n+bEi2FgRWqBEBtF/SWVpO
	ZOhhOPijqZ+yvF42NS75JO36r2OqA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010007.outbound.protection.outlook.com [52.101.201.7])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gg02srj8s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 10:59:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=To5OIKSbkrYfSGxHNDllIVjtFZiMW6uEimui3fLKW22GNeFdSTevpA5e8vbiox1Y3zwIIKEATsdLJb/T45D8bUWhvJ2gZI95d3xZju4jSnw+TvBHCcX8TJfHJ9I7SKK6KIKDhUCHZVh4Yqxi9crP4KjGTOIaW5lk7wKyvpxKtliw/kiGAjIkF6Ss4Ufjf2oQdk+jH1Yxe1th1owPWaMxvFDRMewgoZxXcZXL8m56hBsinCQZEcDaJG3B/7jLC0ozXHXpIIQ09CblaVfRnAVV5/A5YfyUStEhHtBiiKcRRQft3gUMbuKDfHxLEkDYLNytVzLrtitUPQLn2fj5CjDuUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yMSXBT4fyaK5m2Zt7RbIJ6CQqFEbYpu2QSvVhc/EoQ=;
 b=L86JKTHGJD7ZV5/Ebjz4Eyzd4aLFtWRQeAe9AvxH/FajZ/RWxFCCmPyHMlQYkilHH1mim7MHqz193669ZpOZ0aI7UtL8TD5CahvMAT4iMc7dO20uv8mjCA1DxaQas9ACBLKwddxaeZCm/gEcejO/gasmZ/gc1xjPP1EDWBM9FhzoJyCjZYGBtOXXvDUpCYuxxKynlrgTLR+hjKCT49xEHUyWfFs7gP1Y4Ba3vRczme2rIOBdKXda9X69Zo1K8ZWllyX5c7YI0Ckngz14by3b2GP8mOR3ZOxDrl52yIpaFjVSgk6XVZUSCckrsnoDL9XyMXEGj/DsfU5/ggX61WApOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yMSXBT4fyaK5m2Zt7RbIJ6CQqFEbYpu2QSvVhc/EoQ=;
 b=Ya5AzZsLjcBWP1r4jByqYxF2SVcfBXvhslNBkA7e8yVI97WBbfN6SlLsvVp4oXw7MRqoStBolIDxA0s08E0wkzQgfxMCR/Wm5Th56wNf6HjW5dh0ptSynsYryoZ9b8upfBNDRSsZfoC/bfJ+Ans7yCKvwYCWWnK685MOcgKgbxE=
Received: from BY3PR10CA0030.namprd10.prod.outlook.com (2603:10b6:a03:255::35)
 by IA4PR10MB8351.namprd10.prod.outlook.com (2603:10b6:208:56d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 15:59:53 +0000
Received: from SJ1PEPF000037B7.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::7) by BY3PR10CA0030.outlook.office365.com
 (2603:10b6:a03:255::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 15:59:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000037B7.mail.protection.outlook.com (10.167.244.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 15:59:51 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 10:59:14 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 10:59:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 10:59:14 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684FxEoW3779591;
	Fri, 4 Sep 2026 10:59:14 -0500
From: Nishanth Menon <nm@ti.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bartosz
 Golaszewski" <brgl@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Bhargav Joshi <j.bhargav.u@gmail.com>
CC: Nishanth Menon <nm@ti.com>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <goledhruva@gmail.com>,
        <m-chawdhry@ti.com>, <daniel.baluta@gmail.com>, <simona.toaca@nxp.com>
Subject: Re: (subset) [PATCH v4 0/2] spi: davinci: Convert bindings to DT schema and clean up DTS
Date: Fri, 4 Sep 2026 10:59:12 -0500
Message-ID: <178853746365.2995378.12896555385764418793.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260901-ti-davinci-spi-v4-0-92e9c0b2e1d4@gmail.com>
References: <20260901-ti-davinci-spi-v4-0-92e9c0b2e1d4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B7:EE_|IA4PR10MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 350f5438-59b8-417d-773f-08df0a9d8e1a
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|23010399003|56012099006|3023799007|10067099003|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: QQ/m/NYR/ap5AWR95HuDjPRPgd8reyHTaEiAX4f3sdPAg2PL0bf41mybMEZ8drC4TmuTFlNnzLTVMWwFCCCf6NCbTGR3Lnp9N000CyY21dXloizhYtdV0NP/9Ek3zhMp7j8YFWnmGPd115Ma1qFArpL7sF6MbMyrFG11pnelM8VhyYxwvlRc35V80DHf8mcHVMaqZCoaeDYuwWXmVqrwCPNRJNbTodA9OGH0XYuiXB2ZzvKuTrUBIzfzKFw0uETvxy9vsba+JmSnOJXninKoSIcP0waxu9i6pRgVp4o4sCQfQ6aOhI4uAUj5QJRX52Xp2WYQzFtlW+XKoTpgNVAP8rlRsTqpAJ7d5pCfoS2+tx0c44u7xBi3tCz+wcaTCi6dW/cZFL2oZIVYsSFlFrhFiczW+PFccViUlfbcFGFE1lMFf0wKx3m9rooZHUQ7vk1d50kVolZm9p7Y0T45xZzOaruu2Zy6vDsqCprkqq6b6k9TATReKV7p2kcfFsy8ZTcjSsJNoz8tPFFOTErYH+Dz7rgyIQ5yzFQlswGy9Gv9YVtzvv09jzfsUyNxdbUudBHBy0fonSlK+n+wvqFS8DYXR+fC9pJ0aDeDKrbfBPEV75YbMaJ+rDjiN3UW2e1aTbiguo3UsU1QaXfc7XGGcbhDqB3qADzRx8QFbKEIV/NZn1YfXsKrYP1rV/vYiQkPrGtgLMHaH2IJbxyyqo5zXU2RUg==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(23010399003)(56012099006)(3023799007)(10067099003)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MEDNUN0llgAeJUXHAvKL9F2bOUiH5yuIyr+SnUEGSu17XAQOubLGQQmBnX8+4LFS187SLIte1RgV7DZhZgpMuI2u+SiLDAoKIW0FqpkvO0KTC1LdBBTJUaZeA+zQ66IKANCqnZgLqa0POempRTHwHqUJGXnnsk5imPXiNnGvyzUxDkgLD2mdcyyLXqHBOKL0p27sDQBx4IwPzbAbM4MDgbQGMkZj5m+ZUfs/jl7HfNMKrtKDtx1DqvLY2H5YlwfFuMfqTI5AOALwxPQNNvWQCUSBGG2QGjDcNI1OzQ8mPadJjogZr3oePP/MEYuNJvDR/p3PxVpZzDjchPVHgv4JJSMPcD/hWHfB3uP9JmHsUfBd00Z1coRJ8DLDTgVP6OVKuQ5Ene8D4GW25BalqX+6T6Z2UE93y+bfdRGutkl/6l1hReKGsp5uFkWqsOakvm0W
X-Exchange-RoutingPolicyChecked: ddR4ld7aBujUBj79dpA88pgyDY3+fb6Wix6QiwjcGRZ3JkWFqdOv/MsusjSD1kJaOf18rrTUQGq+FULxU8NpkookqeQqQ7ylkl+pXzkBK8xdiobTd7DVwYO6drF2n9rMMYjjYOa2PuSguVX5WQKoSSEXbge7v7by1Gwf0aYykuMfgg060QyVewBcyb1FY4+TkidY1TSjYkK5SBKNnsrkwcIasRd6XkGNE7FMW1XMsIhdXdklwVMAX7e+HuEWp1vu76QWjkLqX6r8n3OdaXLYoK9Wm3JGMpPoiQXRuTy2aYapPP2EEOwg1aIjaPb4N5U5yrMmvCeJ8YJ5oRPOl9GK/A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 15:59:51.8775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 350f5438-59b8-417d-773f-08df0a9d8e1a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037B7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8351
X-Proofpoint-GUID: y09UBYT16VUlcD46jKkSCf0b9QFW_8zQ
X-Authority-Analysis: v=2.4 cv=GZMnWwXL c=1 sm=1 tr=0 ts=6a9aeafd cx=c_pps
 a=ufjbz8VI8KEHvjFw3VA2nw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0NCBTYWx0ZWRfXyo12RXITL/ro
 qKIbmUEukqg44wfXn6lGgAbqlczK2FmA46mamJ301AppuoOd3Ascsrv9feq3D/2rmQY47x98LNP
 2FUa8O1pcBybp9AOj5J8gqWY6mEC/04=
X-Proofpoint-ORIG-GUID: y09UBYT16VUlcD46jKkSCf0b9QFW_8zQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0NCBTYWx0ZWRfX/q5hWq5FOwWj
 zvwwgqdAVEEEuwwsYc0jm42ReIK0jGjWOQmI2ZW4bA0l3JlUZgaIz0ALH2XOg/Sdiw2ZuWT8GLC
 BXDKQLMWXI1OylRLGY+okj/59hy8T8NaG34S3aDiRUAGeR5d++KUDR3s039ocgHs7otpPVnAgqN
 6USeXy2FZT4DnHVrzgMBSr4jWVrSg61xPEYy1qx6EMPIvFlApqeWpN+XukaPLVXHael00GvxEHG
 KSG6FOkh5uEyc5Uk5kTqYe1PDF1E7tT7UIM83VqexZ7vnwqqhKIpPS9SEdcS4VA6+QQ0hloSUUe
 NEnRAlX1y3YxhXZQbDfZhsLeTrKth0GZjwBvDZlHloZIAKCNe2Z09nWjtBKDxBRAAfw68cLvI3P
 Gj1uWsDHYTD/k4JZQ67HP9S/oKBzMtYhe5+BijibOi7WCRofCeOOagBkkb91ZaZs2XxlUGZ4e7+
 cetJ695br+o18qSr9mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_170013_794408_8E3A40A9 
X-CRM114-Status: GOOD (  16.97  )
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

Hi Bhargav Joshi,

On Tue, 01 Sep 2026 05:02:09 +0530, Bhargav Joshi wrote:
> This series converts the TI DaVinci/Keystone SPI controller device tree
> bindings from the legacy text format to DT schema.
> 
> - Patch 1 renames property ti,davinci-spi-num-cs from keystone-k2l.dtsi,
>   as the driver uses the standard num-cs property.
> - Patch 2 Converts ti,davinci-spi from text to DT schema.
> 
> [...]

Please note: Bindings need to go through appropriate maintainers.

I have applied the following to branch ti-keystone-dts-next on [1].
Thank you!

[1/2] ARM: dts: ti: keystone-k2l: Rename ti,davinci-spi-num-cs to num-cs
      commit: de150c5080a715eee8f65070c41b081fbc140023

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


