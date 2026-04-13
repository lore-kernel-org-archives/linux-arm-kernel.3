Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72599F34C5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlPYNsdaBlhBeJqi/YR/O6WACgQW5H93pPEFOHwTnMk=; b=O8EQ4mVefu9CpdkdSin9QCZd1Y
	fJ3r0eOzkwEEW0JIe/J4nMSik4gIQ8IzJsRHN1TSjG5sRIqBNTD99ZY6iJXFkyIejQSxtAT6ANepP
	E+m9q2uZYIBo9jsDSgZLfvvnihnaW4APfiL0Eyo8N6pTTs4u4uzbmqHH8KZy0QnoYeVkHHAJwvmsK
	Trlcr8iqcifUrckpYhpslg+z8NpHVzaSuFutexXkk3sk+h1FdSxfoXDxWLff+faza5WTGOIM9VQRX
	XwlyLBfDaG9ZESBBj3slMjiFPGJjS6uhBqk4XfOJH+dqBQe5jre4xNiI/cF7HPA3ANDpfBoSqgBbI
	fpLGP7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJ9y-0000000FxUG-49P4;
	Mon, 13 Apr 2026 15:25:10 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJ9w-0000000FxTZ-34Y2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 15:25:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/EZ8Oz6wK5TSZcI8yAXmoX7q0PqqCkBxHjzO9BVaL0m262aFbtwX7U/yBcmuPzv2u+uFcbHQ5YDDIBayVpyxkK4X+xWM4m1+uuKz4aNknUVuX2CbVP8ycRd/nXXeXTDD7UGFlw3lP6bNqNNy13uXhie4VyWC9GYK9Hju+qE0udSBvUwE5YPLiQwHhxnyhtpokcgg5bO9vx9oLE0SU92lgkJ0EDZdjs7Aeu+hWSOvi1txEDrOF0VCPs3CEdJ3CQrwK1XJ46xt8C5l1z7Xs9svbDhQR2H6aGLtCwHbtS0EjekPlHomirxzmCzssmvY9Sbw/9nhXnKUPAnjveXCzlBnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GlPYNsdaBlhBeJqi/YR/O6WACgQW5H93pPEFOHwTnMk=;
 b=X6Tovp7RBNmgElJF+1h2bbjzoiLhvGprIBC0sowr1k/yiHlBdeIERLgQbMQgSQCNwgGXi46D01DMjLmUEV1naeJBbE+FDgHDOcLEDomZaE+kq2aKKPf5mUlmvxiuIkpjAWkGyx+7AHUheiC8UTC/FX4w4XVM+AJSGVGhyyJGYvwVzRMGYPkvxj8CViuifogl9iiD/qEqoQyvsgEJr1sWgAOpAu/BnlkDC0YWHtgkA1s49tj05nYGdHnv2HEozhN4rFZjc8J1QwCGJLPNxU5pty6/obxN9H6GSNuOqHVzhY5Q5RqXUO0yr6QR3A9LEZu/XBloiQkQvzxi+4EJxI6NyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlPYNsdaBlhBeJqi/YR/O6WACgQW5H93pPEFOHwTnMk=;
 b=bZm1uTHhxHNoHNKI4FfskgNeh2vdAfFptr8BTGaIN6o3nPROG6qArFtV9Y7hEhd2flvnRSthyDsKEb7obOmV5CpevevhSgUeBT4z8QdQVDERCBd3AbTHN4KjFHOekaWI6Uu0PMzlwz798bpt4FafajdLAm3maRRl0GmT7b8nMbmchAaRGpMIjBmPsvBFBs7rJw9n2u3n1oIwDhQjwTiumVUvE9olIAaiVrL4pMLB4VtskCTxtWp2Q9/3BSNsNobSlUY4/VMhrvf5/ZNCZLJYQ707JXUfgMuIj3B+T1vCWykXhiaslkNdKIMnimN3WjnKZ10DtncNo/TlbjS+Uvuq9w==
Received: from BL1PR13CA0109.namprd13.prod.outlook.com (2603:10b6:208:2b9::24)
 by SJ4PPF73FF93365.namprd22.prod.outlook.com (2603:10b6:a0f:fc02::fac) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 13 Apr
 2026 15:25:02 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::32) by BL1PR13CA0109.outlook.office365.com
 (2603:10b6:208:2b9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 15:25:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 13 Apr 2026 15:25:02 +0000
Received: from zoo11.fihel.lab.ge-healthcare.net (zoo11.fihel.lab.ge-healthcare.net [10.168.174.93])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id B2E30131E4;
	Mon, 13 Apr 2026 18:24:59 +0300 (EEST)
Date: Mon, 13 Apr 2026 18:24:59 +0300
From: Brian Ruley <brian.ruley@gehealthcare.com>
To: Will Deacon <will@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Steve Capper <steve.capper@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com
Subject: Re: [PATCH] mm/arm: pgtable: remove young bit check for
 pte_valid_user
Message-ID: <ad0Ky09tLcFx7JCa@zoo11.fihel.lab.ge-healthcare.net>
References: <20260409125446.981747-1-brian.ruley@gehealthcare.com>
 <adewJetUv6wMiz9o@willie-the-truck>
 <adfDEMK8EbIjPu3J@zoo11.fihel.lab.ge-healthcare.net>
 <adfNN33QIOP3VfDm@shell.armlinux.org.uk>
 <adjYlUk8_JjPivNi@zoo11.fihel.lab.ge-healthcare.net>
 <adzMOdySgMIePcue@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <adzMOdySgMIePcue@willie-the-truck>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|SJ4PPF73FF93365:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c010c97-1b2e-4eca-77fc-08de9970d4fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: Fk9+l6Hyy6IXT+xgYV2zAJZ6si+di0fGPOpnFl+4gbk4lifpHzjc2Tn5ENKa6XSJ3TA/pfIMF9Pl0LdBuox+zKCzCgUAp0utiKMiChT5+gwHBcRyVwUKdPYzoLZDTrjfy3au4LCpWRwui+8Px+Vh3ynodNGMAkBIbhmgdvPi3xouLKMWKueRe3xrL0hPybOypTtwRxZIvLF8JzXLJDrRRWzsUMl+VxoRWRvptdpxV/OV4M7S5eAWX2reUsuyG4fS3LWTCdYtenD5+2UC491LZ1YNwpAEbavJx7NZFyv83Pw3a/wu9Aeq2R8M2hMjQCPnK/FOKc1+BKf0X0W0w+M1tGfOxvvjU0TrFwUDODZUn94H188TGKleP6l08Rk2lgFGuwTTpyr6G8s+gY39bFQ0BlqPVclVyf7OhxRhFynGOVb9L9LDxblOX1u9Wvm/mRvXN/K7hw3wFkir7I7xXQ+ltdKjwk7TgfZkGW+gLkm/gtSE6t3KJsfA53I/BbEweEZSkr4LJA+nonvBKEPtF53Zqvkx29QeF4ec8TJHRqFY9v2TAyefNWIP0RVhO/RfJvWfSK1m+sVy3HGJOHIjwiWtNplcgCOD+z7Sc7AcmMgUgLe0o+hHvWj/jvYXxu4JulYqHirz/NoolVWZZvxZ5EJB/g6JFOgfHF+t4YWxjJ8UdBQ0CqfimFrVq5yvVw/2jS45B3d4D5kGWdaAC7nqvaRO02csbw87YUtQXETZ+vCR87I506G9SCLlG+SHLcC1W7oZDhGWxW8qBK762OTH5hCLhA==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zlEKvN/1yPUEDNU3D6FvVwbfyMAH8U6RMXVBlFovkGs116gO1kYejfyCNSqrTIm1BxKPmU4lYHo+a3cDl64FZeBwBZQ/RhVAr8Emxb2VYqaOmGrilohJAOGJ4ap5vfdKC2AjKgROFMLakZCjPSy601BWNUODK8l/7ensLp49l30/i/hLVN3WGDVXCeLJQIJf7BmwWXh/1sd60tPezX1R/+DtmUmvacprhr9+iVNkPejTys/leH/Q8ffKktb54Fve6F8hVR24aM9Gv2k3WF5UUKXTUkZ+NZhUfdWU460P5DamSufz/9jRwDC+NSo3Z+3PiWJjpGDG0XFf9hDlfjTDzKkOcARD8+tO8SDXPc4GluAIE6tPH/M7+pfmRlHe2dvb08+eZyfhEDiV5szCp9Znq+aTaFU/kd0D7jpryQ6GxCcr8RZlKdx1K1/94FxdKVzi
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 15:25:02.0147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c010c97-1b2e-4eca-77fc-08de9970d4fc
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF73FF93365
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_082508_808699_19BF674C 
X-CRM114-Status: UNSURE (   7.93  )
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

On Apr 13, Will Deacon wrote:
> 
> Brian, can you try something like 588a513d3425?
> 
> Will
> 
> [1] https://lore.kernel.org/all/YJGHApOCXl811VK3@arm.com/

Applied the fix and so far so good. We're going to run `stress-ng'
tests overnight to be sure. In the meanwhile, I'll see if I can add
some instrumentation to verify this is the bug we're seeing.

BR,
Brian

