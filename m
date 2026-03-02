Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9305CE9B37F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4auZDPTIAvSL9FvIM+fXpJsEfCIQ+a6RoTpHbV9m+E=; b=zLeN8TLhVpHypyAiChFLJ8lpQm
	Owm+KIVw/Mf/uBA8SblJ+Oe4QpQkCYZs1ZR2Cx/3nzyU1qQ0s19zj7409MnIML+ONg4IUQxb+C3hm
	niXUe9JIUE7qxfuKXRuEE4YzQkkFBvH46ZnHt7KX5rFoSiqfQ+gPEN5rqOZngV4iCdNZdVJVW8X4J
	s/CHltzGj9hPmHjYimYJXAHy6mKbLKyKkt3pDn5AaHxStAlqDEtzv31z2eio1UN2PehHcjx7BYzOS
	WzmzwNe53b8bI0HtGW2/i7nZ0uJvOW94fQTfAH79l4rmNXDjKaD7YtF6jEevTLV4DufmFHAt3+cwr
	NGL6ozew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3SE-0000000D8NS-1b4d;
	Mon, 02 Mar 2026 13:36:58 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx3SC-0000000D8M0-28Vq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:36:57 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lx6LKSy0Kjwco8DSijcGnpxee7fquQ+e0Jx0lAyTejXn5TW0pfjEgEEv1GgvdKc8anyeofpC/AS/cdo966YcNRC5C+RaY+03CVcGGXiIIVkWT3aAj37AOTsZukPeKWCpVWpRgzj1/RJCT7wPaBzKJskzX4A8VQYEK6G/mgsA/dMr3DsTBwzy7ld/ndP/NgonyGXDGFDmuqEqsJLyhgNyyIfdvFhLCld+TVdOfCS4HHv8FeNVUW6VMSnCRGqD/2P09rC3k43Pf8qnn5brBiEdIKB+iVxNzUkaoh5LLaCkepFHaQeCsFXAixNkongBtrqI572GW5gNy5OJ2VxY/8p6ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4auZDPTIAvSL9FvIM+fXpJsEfCIQ+a6RoTpHbV9m+E=;
 b=GIpQG7LbN9Zfw9gbvzUYjX9OnfU2aCylibSJUSGHuaorjx2v8vPu9AyWqgQQ6PuG4H4BE/67Bj18UzOIXS8H3WELSWkzyddtNL2c3tqeg5/XHm7qPVnvXrSMPt4i866+35NvmuG3L6vtcYaVZQWXuoUvVd8o+weKOrDMfE1mntfW+iDUcA3oV/r3PCp17DtDqz7mDtiGHUOtWyPr5YFkViCRr6WsiSeu6TDKgo1M5qdTcA8avlbDfRq+54y0bWSjL4LEpoTRWflhu7pkW4wVtzBHKw22l4mZHbrFZTNrAvpAYK3EBTjVhmHsoLvDosqqe5/tu8jq3LbMuz1InRU7zQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4auZDPTIAvSL9FvIM+fXpJsEfCIQ+a6RoTpHbV9m+E=;
 b=mtbdGleeSh2YciN2zZN+rhAwX76tfgqLQ45WLM3Xr8+HCoq8PvcPI+vgvGScpSR+ObeM/vVyWahyDwtebFS6cIqTx4swVaugXUsaqTG2hS/q6rd77YakvgZAV+WdKsizCmtgCdsI/n4OWvOgrbGllxM3iPjHSv1JErTI+eJqA1Q=
Received: from DU2PR04CA0229.eurprd04.prod.outlook.com (2603:10a6:10:2b1::24)
 by PAVPR08MB9210.eurprd08.prod.outlook.com (2603:10a6:102:309::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 13:36:47 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::9e) by DU2PR04CA0229.outlook.office365.com
 (2603:10a6:10:2b1::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.19 via Frontend Transport; Mon,
 2 Mar 2026 13:36:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.16
 via Frontend Transport; Mon, 2 Mar 2026 13:36:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PVz+PBH9/KRa17cOZluOI79g79basn7pclSaDV7NR6gTRaBDyw/tFPAjT/pMkP4fUYIEF/9cU7V5j5tofPim6f3FP3ep9h2DnvyuBTd7tDgBm5uFFRtgYqoKMigCRO5FizhX98Olltq3Nvpxip1yBM3f/3h/g/AzLP4JMJ0RvcFlRtCpHkm5dbg5l7PRMmXfVJ03lnjgeERbrGr8kqaja8pR/nLYcNsKAS5IaDTlhZneKj2v3DQOjotCeZgDbuKlRVVMK5Im6IdHodQ9t5X6Sgwa+PrRe++Y0fwjhg2Qw9mg+IJspJZBYhlH20k51cNN3hYwwrYhbvsPAO/pMi5iVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4auZDPTIAvSL9FvIM+fXpJsEfCIQ+a6RoTpHbV9m+E=;
 b=JTmx6pjgK2sUdd2/psEFt49F/HQuLpurcOWZsdm3litAG64eoQOtZJryNk1DhGu9u0lYDtFubnarkn/mOMtCoU81d2t796gx60bxIuBPvImXMbQNNoB9TGirzV51+4kvOYB8T/Nv4DUrGs4ZWvp4oN/8MItTVzXd+LhTP+538nXnLI+fr4LT5337IJJ+CJafYj6RrwFRMdre9wMRJUfOUtn9hvCIhFdeoTlrFoZShrT/ftT0BGoeLpjuD2b0Le1yGaianYFwMGSna5dB1iePFdLoQ+XoFKP/To4EN0he529mWceN5BKowOns7V8L6vaB3CoFO6FJhZZCTg5pvebB3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4auZDPTIAvSL9FvIM+fXpJsEfCIQ+a6RoTpHbV9m+E=;
 b=mtbdGleeSh2YciN2zZN+rhAwX76tfgqLQ45WLM3Xr8+HCoq8PvcPI+vgvGScpSR+ObeM/vVyWahyDwtebFS6cIqTx4swVaugXUsaqTG2hS/q6rd77YakvgZAV+WdKsizCmtgCdsI/n4OWvOgrbGllxM3iPjHSv1JErTI+eJqA1Q=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB11754.eurprd08.prod.outlook.com (2603:10a6:20b:743::9)
 by GVXPR08MB10728.eurprd08.prod.outlook.com (2603:10a6:150:15b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 13:35:42 +0000
Received: from AM0PR08MB11754.eurprd08.prod.outlook.com
 ([fe80::3427:f97c:862d:1850]) by AM0PR08MB11754.eurprd08.prod.outlook.com
 ([fe80::3427:f97c:862d:1850%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 13:35:42 +0000
Message-ID: <ac9168a3-73b5-4277-8b9c-122ff2b06ee9@arm.com>
Date: Mon, 2 Mar 2026 13:35:41 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] arm64: Add logic to fully remove features from
 sanitised id registers
To: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev
Cc: Fuad Tabba <tabba@google.com>, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Joey Gouly <joey.gouly@arm.com>,
 Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
References: <20260302115653.1517326-1-maz@kernel.org>
 <20260302115653.1517326-4-maz@kernel.org>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260302115653.1517326-4-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0066.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2de::11) To AM0PR08MB11754.eurprd08.prod.outlook.com
 (2603:10a6:20b:743::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB11754:EE_|GVXPR08MB10728:EE_|DB3PEPF0000885E:EE_|PAVPR08MB9210:EE_
X-MS-Office365-Filtering-Correlation-Id: a928d94e-d668-4e41-29ae-08de7860bfc1
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info-Original: UBAiRkUXQ8IayZWAgr8kAFv8cGacxLQo89XJ6ylm93bKRVDiAXwlKwn342x9Cb8PoQeDpv9koYnUAyOt6BA6alyZHQ6JRdYKkQT7tZp8XKTQu85nK9jxSgRQpc4NmZGvCoKC3ahTNhNhVfkHjAlh6sUzDvKTkGwnjdAoqBOmm0A8HZbZuWv/3w9sbeZTkETTJYe8FBwt2E6z3GB3IFdK4IFQjROdzGMj0cPWeUQep2tNkDK5n7p2O0PjrRCPIzRXC81VPzDsNRms0zFAY9P/d0mHUUT4oNifBiK4p+jEFr1DQ5wX1dgz3F5hTRKvQeYgjsV/DdgHqyiilZ9EG2hDhRMmw3xzj/1wiTBg+HcqIlMSgXSQAYVq6N2ldOeq6vL5YuPGNc7HagPu1ZiUf1urNy3cwhm0Vj4wiYJhz/gvzmvhge3DQ4FmkrMf46KxPE7QbknfOjuptbznyVnKH9j7aajAvT95Zsvp51tspUlPPfExQ3YlwPAwlJG8vPBi0g9PE4khBA0ghZnZraRuGyCGvBwYO+w1MKi1UamDoJ3g+ILnJgWEy14fcz4WNXxRrLP5xX8D011oCVwqKn3d9gxhJ0jNAKVYNcmsD+ilGvuhswhbc3NO6Gngh0ToAOzoNrZRCfJUNIOiDdh8CptYkx9qvkfybx+1666hKJWB14Hclh7v7L/JBOhDVkPjIRZGgPLkfeEJhXdYp8/jgr5AU+b11eBdOHf2ffpmNePhN5EDttM=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB11754.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10728
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8cfdd88f-687b-40e8-a537-08de786099a7
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|35042699022|36860700013|376014|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: iayf3nLGC53RSokP+sOlq9093808c+Nq7YQzl075JXjOKUkqZxt0e9IeCT69+U5wC+qYB9Cvdy6hLVFnGvYdiWCyjpc3jMdtxRE8TtB1j0hd7FDQMFMSo6Rlg+pipbnX/RYEMza2YOFYzrv3EJ8b/h4tlaOexjbh3joxjMd1nXrDpoldpBVzDQPmOA2R5TEwOe97kPp5m1KsrMGOfUvHxY0tSrnjmyR2cihHofpLoNZ0zfHxuL0RM4Bbj8sMsj+mmxQ0ZyKNM6/wfcQoHeG6h5i7CCoP+/WHqt2/B+tBe+L7BfFo0sCLu5oo73gFTrLU+VuUVK5zMixn+UdeJ6hZIMOeDgedPxKpTreAKjjZ9sZTtuRS+ijhsXy4CnlbrNHa9lqMhLg6R6/IIKp/vhsI/A3Cj7nxk8PWy6wuK7+OBniZqrfGzmqHYC2BFessbLzYDU7L/rXjMYHsDEqGokkreljyvF01KrVpW8ahuq6G24h82OY4AjSKV0lbXSJoV0uFdeyDkZbgJgNZpHWEVtUoGH9STN53JWrGpKfBCtbF5Ssz3EHVyX+niYiujbncauFPhLc1NSMLKUrGYbKCINzrV8JonbDuJAMpsVrUHz3SE1DBX+Upzegpj691AElH7GtMaTboNkYeoW+Lu9yf2AJvMsMusTfV4CQMA8WRybUxEbEPjmyGmp2vsMIVXc7sXkPhIRV3Yw3g5y/GGTYTQCg3b7m2XV+wknjC7w9Li52KKru9MitNyhsJqLE9VenPgJYJxowBI+/u5opfSE+UkRdiiaRFUzzI278eXY7Hp+U4u+Ln+Ac2NUE2eCIMhJ3xnPI4l6yw43kwVELMHfffKp0CsQ==
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(35042699022)(36860700013)(376014)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mc6z/ohXHic0mJN2XvbG3QgbiL2PAoRT9YiFo8VGC1X3iAqDwgHLWgbJZGvbxGOFMxfJPY9dr9sB2Nkq/Ru+k5ozn/46pOm05WlXVhMm6g8ZQHeOUIs5TZbm5HoMYqC0gPH01VJLg2BzufqT7DCBZ1HvbfdKkcPBca76EPeAtY+R+M7IzHEuqvNBq90XGy8FthtTVZqNqJhgqDPyjYDMsRfuk8ww95SZQPhYHDQBdYWmWKArJTk1OgtGZb+30ttQWVDelpV6g1dvHoHPRSE+CPbyLDWg/hnih7uqLJacybtngYbkk1Vp6yiQgfwyVzyhKnoPPMd1if/4N94K9zNV9DPEpHXhAZ76waiprzCZiASHH1LGW5hO89ez6eshNhHYEwanogqqqSuSrZ7gXpKdVUcCF7GYk/pswW8IGyLAsTaGtVVZ3N5twwptg7JceRk9
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 13:36:46.1505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a928d94e-d668-4e41-29ae-08de7860bfc1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_053656_694576_97631837 
X-CRM114-Status: GOOD (  30.61  )
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

On 02/03/2026 11:56, Marc Zyngier wrote:
> We currently make support for some features such as Pointer Auth,
> SVE or S1POE a compile time decision.
> 
> However, while we hide that feature from userspace when such support
> is disabled, we still leave the value provided by the HW visible to
> the rest of the kernel, including KVM.
> 
> This has the potential to result in ugly state leakage, as half of
> the kernel knows about the feature, and the other doesn't.
> 
> Short of completely banning such compilation options and restore
> universal knowledge, introduce the possibility to fully remove such
> knowledge from the sanitised id registers.
> 
> This has more or less the same effect as the idreg override that
> a user can pass on the command-line, only defined at build-time.
> 
> For that purpose, we provide a new macro (FTR_CONFIG()) that defines
> the behaviour of a feature, both when enabled and disabled.
> 
> At this stage, nothing is making use of this anti-feature.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>   arch/arm64/include/asm/cpufeature.h | 17 +++++++++------
>   arch/arm64/kernel/cpufeature.c      | 32 ++++++++++++++++++++++-------
>   2 files changed, 36 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 4de51f8d92cba..e853a0ac7db38 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -53,17 +53,22 @@ enum ftr_type {
>   #define FTR_SIGNED	true	/* Value should be treated as signed */
>   #define FTR_UNSIGNED	false	/* Value should be treated as unsigned */
>   
> -#define FTR_VISIBLE	true	/* Feature visible to the user space */
> -#define FTR_HIDDEN	false	/* Feature is hidden from the user */
> +enum ftr_visibility {
> +	FTR_HIDDEN,		/* Feature hidden from the user */
> +	FTR_ALL_HIDDEN,		/* Feature hidden from kernel, user and KVM */
> +	FTR_VISIBLE,		/* Feature visible to all observers */
> +};
> +
> +#define FTR_CONFIG(c, e, d)				\
> +	(IS_ENABLED(c) ? FTR_ ## e : FTR_ ## d)
>   
> -#define FTR_VISIBLE_IF_IS_ENABLED(config)		\
> -	(IS_ENABLED(config) ? FTR_VISIBLE : FTR_HIDDEN)
> +#define FTR_VISIBLE_IF_IS_ENABLED(c)	FTR_CONFIG(c, VISIBLE, HIDDEN)
>   
>   struct arm64_ftr_bits {
>   	bool		sign;	/* Value is signed ? */
> -	bool		visible;
> +	enum ftr_visibility visibility:8;
>   	bool		strict;	/* CPU Sanity check: strict matching required ? */
> -	enum ftr_type	type;
> +	enum ftr_type	type:8;
>   	u8		shift;
>   	u8		width;
>   	s64		safe_val; /* safe value for FTR_EXACT features */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 102c5bac4d502..965dd2acf0640 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -192,7 +192,7 @@ void dump_cpu_features(void)
>   #define __ARM64_FTR_BITS(SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
>   	{						\
>   		.sign = SIGNED,				\
> -		.visible = VISIBLE,			\
> +		.visibility = VISIBLE,			\
>   		.strict = STRICT,			\
>   		.type = TYPE,				\
>   		.shift = SHIFT,				\
> @@ -1063,16 +1063,33 @@ static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
>   				ftrp->shift);
>   		}
>   
> -		val = arm64_ftr_set_value(ftrp, val, ftr_new);
> -
>   		valid_mask |= ftr_mask;
>   		if (!ftrp->strict)
>   			strict_mask &= ~ftr_mask;
> -		if (ftrp->visible)
> +
> +		switch (ftrp->visibility) {
> +		case FTR_VISIBLE:
> +			val = arm64_ftr_set_value(ftrp, val, ftr_new);
>   			user_mask |= ftr_mask;
> -		else
> +			break;
> +		case FTR_ALL_HIDDEN:
> +			/*
> +			 * ALL_HIDDEN and HIGHER_SAFE are incompatible.
> +			 * Only hide from userspace, and log the oddity.
> +			 */
> +			if (WARN_ON(ftrp->type == FTR_HIGHER_SAFE))
> +				val = arm64_ftr_set_value(ftrp, val, ftr_new);
> +			else
> +				val = arm64_ftr_set_safe_value(ftrp, val);
>   			reg->user_val = arm64_ftr_set_safe_value(ftrp,
>   								 reg->user_val);
> +			break;
> +		case FTR_HIDDEN:
> +			val = arm64_ftr_set_value(ftrp, val, ftr_new);
> +			reg->user_val = arm64_ftr_set_safe_value(ftrp,
> +								 reg->user_val);
> +			break;
> +		}
>   	}
>   
>   	val &= valid_mask;
> @@ -1230,9 +1247,10 @@ static void update_cpu_ftr_reg(struct arm64_ftr_reg *reg, u64 new)
>   
>   		/*
>   		 * Don't alter the initial value that has been forced
> -		 * by an override.
> +		 * by an override or a disabled feature.
>   		 */
> -		if ((reg->override->mask & arm64_ftr_mask(ftrp)) == arm64_ftr_mask(ftrp))
> +		if (ftrp->visibility == FTR_ALL_HIDDEN ||
> +		    (reg->override->mask & arm64_ftr_mask(ftrp)) == arm64_ftr_mask(ftrp))
>   			continue;
>   
>   		if (ftr_cur == ftr_new)


Looks good to me.

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


