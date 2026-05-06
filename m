Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5991BCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Dkej6wtccQ1DjSXP9fDT7lA6bX4LVPBs9l3EoIytDc=; b=zg+P+f9ZBwcoLe7uG730kBKoG9
	srKYZP55+kh+MJkK1uVbRbp2OdwDhli0Stu21liZAbxV8aQGBwv4/A0M0QQTJkp7HoZqhEjADzodh
	rxvhssLlqptiXZ0t7QWBXt4+aKIIsNlCv+dDQBE50WhPPNel+1iIt7fIc+nnDO7jWLEk5dnhoHsaF
	9BqqfGUUtPesSbBIvEK1ke4G1bY+By5sOza79NIX8uUrJ7vq5PC8r8Nw9FL/WcV5GGPL4GHoR/BCU
	UPpTPpdCrQUnlLmtyWhh3++CRDhhctOVdvFIeS/zuaTdGHbFIPtAc0LCrLZ28PPDl36thE4m27gJJ
	gEG81agw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYiB-00000000NG0-2uNL;
	Wed, 06 May 2026 09:38:35 +0000
Received: from mail-westeuropeazon11013050.outbound.protection.outlook.com ([52.101.72.50] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYiB-00000000NEp-0K2x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:38:35 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dhWRW+Ki55xOZUyJ5H8YGk6tGJxJQ8+O1yiiGcIOp6xu0izvjwwPp+YhOR5Bs9v5HTRPBOGE6BFCDs2bdPda4ZBsYVFoxp8xWSFdCu5mmIu6OB2m16hHPv4tO6nuRZn5wjhW10BDEcbSjKiXfmojDuPZrtlL20byfcd+OBUEl0CU+kiu5c5lRPgXb+Yi6QxcAT5TvqDiv94yTt1oVf8k73CnsXhogfAPgi8mz7s6saj3t8tjt65odqCRG7WSRGi9QADyhw/Oil+9yJooTTZdYEjmgMzbFshTTo39TJtb442CEBXgJAejN5gwC1AwqtPE4My0Mk+5yKRtL1BhaIqqNw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Dkej6wtccQ1DjSXP9fDT7lA6bX4LVPBs9l3EoIytDc=;
 b=JldCT+tBXGFCaRhCgmA7WqNqn/vAQlf0q9MtbPa9Uyv/Gu1sypeyxQyomkcm5vwe1feLIEpSPF01P383MRU2+VTIwAwUMMU12z4q+tudRXpPNYbbnLuWSF9qXF/ki9S5w9mUd9r0BJ/csn7Xd6J6UQkG70X0wQUm+HHeMkVKFaijo5qWusSnQ57mEfpfMRUykpjLRcJTXL10er4sjS2V+NZvdVdFbi5jKxtIqImIjz0l2k37V6mzZyES/MfuE/wLWoAgYmEtWE50ISLLTBQzlnTVZ81gZQXLCoZ7+yJ+8pPbb9g4Qk37kvaafZKolwyWQxinuqsfB8Xrmr9m9LQtng==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Dkej6wtccQ1DjSXP9fDT7lA6bX4LVPBs9l3EoIytDc=;
 b=mRqQeIRYfhHac0Tdcz1cCVY2IvTOF7bfGMstgAqb9TtqamVakni7OHF/K9aFYheW2YzQhJ3vTtiy0qV1fbgJfQlev6dLNPOwfkBcVzyx4QnPZRr1D36YrFWL6miUadI7xcaPJSpQxsmAZ1CKV1KcqvuE5FUn4RE7HllM4Nt265M=
Received: from CWLP265CA0505.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18b::14)
 by GVXPR08MB10616.eurprd08.prod.outlook.com (2603:10a6:150:15c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 09:38:25 +0000
Received: from AMS0EPF000001B3.eurprd05.prod.outlook.com
 (2603:10a6:400:18b:cafe::29) by CWLP265CA0505.outlook.office365.com
 (2603:10a6:400:18b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 09:38:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001B3.mail.protection.outlook.com (10.167.16.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Wed, 6 May 2026 09:38:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MDSVWQVG3UChwXTi/JCSUw9HorQFrCrA2mDhmU3f5ZNraI2xA0oRLWrWis7dnhxXJIAqUV3soUHNiESbDF6WyGosasLGFF5yw0bRKbsyBycy3M9SYQOHuU4iLNO3LgwoK4voTPhBM11/1LMRtXyRWh9LhIp1qwSytJuowj6Yqt2iBXGtfzFLszzJdmXG++7LCuFLsSQKAWFahckAWLO/yY7lssC47nHT2XBiZiOv6030m1FKijShjw+JiIaNbbG4R93OubS9Q3E3g+xg6zRV266TTMGrKGEKEg0CFGQpars5S5PTKjgINimYhdZptVpY7/Bf74eIJ+TRWaEaDdlagg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Dkej6wtccQ1DjSXP9fDT7lA6bX4LVPBs9l3EoIytDc=;
 b=UzWMJ8HusVxBCjEbiJfZ5nLpnReHnztgECaJjdE0hEJ9DzAKr2pSS2tYCj+C7cqunD7d+UvHiGW/4HjGn813fnCWxsuYLaI+E3+4QPNGC6m91khA9uFJXeEkU5rka4RKWCAF4YYgQytuET4j+7bGPD68kikfe0tEPez0ESXxOP8Gfu7SkHfXyc/g0Z1mrULhfulwuB/rFnyq/wg1rciY7FUrLMzGCMux3JCOUwQAR6VQ3wKrkV0Ry5Ei6vHOmJ3KpqnqTIZodBWMpQeTBm7NOMAPXjuzLbkPgMdBheEnFd9V+kn/wFi7h+wTJGRDSeMOH1ekPLNap0HB7FLglLPaxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Dkej6wtccQ1DjSXP9fDT7lA6bX4LVPBs9l3EoIytDc=;
 b=mRqQeIRYfhHac0Tdcz1cCVY2IvTOF7bfGMstgAqb9TtqamVakni7OHF/K9aFYheW2YzQhJ3vTtiy0qV1fbgJfQlev6dLNPOwfkBcVzyx4QnPZRr1D36YrFWL6miUadI7xcaPJSpQxsmAZ1CKV1KcqvuE5FUn4RE7HllM4Nt265M=
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com (2603:10a6:20b:47::18)
 by DB9PR08MB6425.eurprd08.prod.outlook.com (2603:10a6:10:261::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 09:37:23 +0000
Received: from AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7]) by AM6PR08MB3399.eurprd08.prod.outlook.com
 ([fe80::59cd:4b6:fceb:3de7%5]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 09:37:23 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: nd <nd@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
	<maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v2 2/3] irqchip/gic-v5: Support range allocation for LPIs
Thread-Topic: [PATCH v2 2/3] irqchip/gic-v5: Support range allocation for LPIs
Thread-Index: AQHc3TvxwdWNmkxOfEKi/TLt5Y+hYQ==
Date: Wed, 6 May 2026 09:37:23 +0000
Message-ID: <20260506093634.382062-3-sascha.bischoff@arm.com>
References: <20260506093634.382062-1-sascha.bischoff@arm.com>
In-Reply-To: <20260506093634.382062-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AM6PR08MB3399:EE_|DB9PR08MB6425:EE_|AMS0EPF000001B3:EE_|GVXPR08MB10616:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a79987d-3de0-4a07-3aa3-08deab5338b3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original: S/mILIqHZG031Uwbx7977hZfpJ70vBRR3YTWmBJilHJlkx0L/lbzo8Tn0xvGRZu1bdyVQHcO909I6+ITmsQeHbgunZVkVkMB/zQi1VFAT+aI0ZFYtOmETrJ5laivNjdArccmjGRjU/qMTAJ8B1c/1UiDx+1HG+SPv/yK7DonuDvbPAc9a5EAg/u1iXUeUi7RHl+Ce2LIu/eZMQIB54vCAu42JcFAqfDkf0JP7hJuGJ9uv/TtG+i+qa14ElZpdy50FNbU7Rl++ijL/Qn+ZKZK4BEgzzxpil/m7Vr+I8tS1Q33WlrLxRjjVcLscFSKt2bsoqMEJavX3XTg6kuFqCsKZ3Dul5TPqp+fcueICtQ59UiRM9G2o8/PVbv0y1N6Kj6/1ipY0sfUKOeI85wam//a3vY+dPKM8GIqoSqAOaiFUs2p0CnoAYAcU9lfJw0cBIVA4VX3iSvVoHqlKee71h+hwxwNTk2Vu5VbUfoxxb1KTWjGQOMXwpWM+y9YlVnvXC41v8tl0UJ17MAj7hSTL6/dxC46+3l3/99Omfn5O3zS4JvkcYy4FZKXqFTzTwYC6Eq6q8PtoV2cXlgRlDzJqJXQGnwNuuPYqw0rGq/cJq1uUBTxa2BK4KZi1hm/nPMdUrGk0yQeHGvoR/0Wf5RW+E9+doji5p0GU345Oz4od+/Quvd+RZ5tSe7B3P3KjU8scLtoSqHxvFtSmSH+ZLHWEnRYF4Dz8cDzhTG2fePbwJqpGoiEZFqf5RBtEH59wl/nJUZC
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3399.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: mXJmO4CX9IkYDOQ759zy9oRg78gAksQaNBVbv5xHQSLeuTNU/4E8rUSmAHSR771AyeCEpPw8OKAWvAlIqoEHv97RDhzTLXajRvZ9N47oR8pjRusWnaO78+kF0KbLdR8n+MjxXBem0Ajrsz3hC9KqQepbEWfX7pzI10LyGGXNyRdUZ3OxFD2fpi9bw9Gko6URmTTAj7Nm9xcvPWJPaJmuT7hTxlS2BVOFAxBKTsCWnlFeXgXo17HoA+YaUHEZ9s7RB2nYTM2hylNnx/4R82hRBBlvOhetFX5qxwDYz9sRc6eWjBG7w4DR+WC1HLtIgg7Hfw0uPIrsxTiSzqRZcXLN7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6425
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4cdb0867-0608-4469-8440-08deab531393
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|35042699022|36860700016|82310400026|376014|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: aR9jlB/TxppJW27ALOQQjrMfFgeoSd6/XNrt0rHG0vZ7e5HHY17f3q+jtEZFQP1GQ7PNFGrZ8LlF4Fjva/ucoOwDR0lFeKQlulP+xS1KlriXAJtyCGvXYu72uQvt1E0zc/7mWwlvsph5LqG7NZkN4Rz7+puM+pKgnqRCmT9OO4hFasDE8aGp2awMrU0EithQhSI4aOjXjIq+GyCNMsq3z1DCwWN0SBnY6IiidFNsTJmtWxzCrJAsVXH3AUPNrntckvUF0b10kO1WtO42ju/k72YeDcWgAQ2rY8YqtxyhoqT1HZiPMDyUHF7bopSXMkq/RsQuIRXFVFgiE/PsaLONroLYOOJgOf1QsND6iC2bZA57f6U9VoEj6Bz/wClP/xbscIh2PMAelJ+1hrMU7yLBko0v1lw5yS/zOg7HLj49gRVNPgrHD3kmuiRq69YJ6ZHAHZJr0LR1J1I9K+3wv1g+4NFbSZ2lO6T8loZ6C5BR1tgWvDREU4wRuM5XHqmwEGS9CIhQ1Ayq9nfTIZ9US543EEE7E74OO+jjV2gmPOyOlRQfqIDggLYWlSJrAGpZ4p79xNa8J93j/dBos2PdyZuLbMZqNXW9T4HiM2NiQYbRqTGN74AQyevWuMK9iBjhwWFaIXvwhLFUqCSSAnkxyRQd/HrTDJVB48yGnQ0MVAV/bZS/2HOsLHGktDIv51qHAktnT6EW9YrwJ2S0/e3EGqZC+1OOTwZ7LDarUDs0lgc243c=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eQAbkxuTyFyarUNjYvgrpyEY8HcgHwbelQAWhrOYI8NqLLmk4ctcqPbzOBdAvGG1TOyUyNMC/V5ixGCiOt4OS3hUqOSFwJ8iK3T3eRvx4orKDZXH092ECaYKDngY+1UDVfL6j/6i8zzIvJvhdMyB2UvSLKRSWl/kOlFVnFxsNi+EJvTkDVW5K3INtCqY3e6ovEDwqo3rnmbjizTHjqVzbzCK4SsSRyk7W2vrSXETJDk9IQew8EPMAbIO9BwNVUaa7q6QGiS36QeZbCVug16PbAQYxAm1xemFjuc1QBXOnD4IlPO0IRLFuYtKkOyxDZ3QnAP5XxhRKybuhBKB8UsCzzLKKlW9XX0lLWLvLO88gLRoH1R5eftr0SWRaEaY8f4e4EJdh8UwtXckCNTyL8TJnRYFdxBur4QhxrSVp4GH0hw94lQTGV0Sf1cwLfossFwq
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 09:38:25.4132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a79987d-3de0-4a07-3aa3-08deab5338b3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10616
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_023835_267830_20D400E0 
X-CRM114-Status: GOOD (  18.84  )
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

The GICv5 LPI domain now owns LPI allocation and teardown internally,
but its irq_domain callbacks still reject requests where nr_irqs is
greater than one. This forces child domains to allocate and free LPIs
one at a time even when the interrupt core requests a contiguous
range.

Handle multi-interrupt allocation and teardown in the LPI domain by
iterating over the requested range and unwinding any partially
allocated state on failure.

Allocate the parent LPIs for the IPI domain with a single range
request as well. The previous per-IPI parent allocation loop returned
immediately on failure and leaked any parent IRQs allocated by earlier
iterations.

Fixes: 0f0101325876 ("irqchip/gic-v5: Add GICv5 LPI/IPI support")
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
---
 drivers/irqchip/irq-gic-v5.c | 77 ++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 35 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
index 15a2a04398d25..c1af07083ceff 100644
--- a/drivers/irqchip/irq-gic-v5.c
+++ b/drivers/irqchip/irq-gic-v5.c
@@ -801,15 +801,14 @@ static void gicv5_irq_lpi_domain_free(struct irq_doma=
in *domain, unsigned int vi
 {
 	struct irq_data *d;
=20
-	if (WARN_ON_ONCE(nr_irqs !=3D 1))
-		return;
-
-	d =3D irq_domain_get_irq_data(domain, virq);
+	for (unsigned int i =3D 0; i < nr_irqs; i++, virq++) {
+		d =3D irq_domain_get_irq_data(domain, virq);
=20
-	release_lpi(d->hwirq);
+		release_lpi(d->hwirq);
=20
-	irq_set_handler(virq, NULL);
-	irq_domain_reset_irq_data(d);
+		irq_set_handler(virq, NULL);
+		irq_domain_reset_irq_data(d);
+	}
 }
=20
 static int gicv5_irq_lpi_domain_alloc(struct irq_domain *domain, unsigned =
int virq,
@@ -817,32 +816,39 @@ static int gicv5_irq_lpi_domain_alloc(struct irq_doma=
in *domain, unsigned int vi
 {
 	irq_hw_number_t hwirq;
 	struct irq_data *irqd;
+	unsigned int i;
 	int ret;
=20
-	if (WARN_ON_ONCE(nr_irqs !=3D 1))
-		return -EINVAL;
-
-	ret =3D alloc_lpi();
-	if (ret < 0)
-		return ret;
-	hwirq =3D ret;
+	for (i =3D 0; i < nr_irqs; i++) {
+		ret =3D alloc_lpi();
+		if (ret < 0)
+			goto out_free_lpis;
+		hwirq =3D ret;
+
+		ret =3D gicv5_irs_iste_alloc(hwirq);
+		if (ret < 0) {
+			/* Undo partial state first, then clean up the rest */
+			release_lpi(hwirq);
+			goto out_free_lpis;
+		}
=20
-	irqd =3D irq_domain_get_irq_data(domain, virq);
+		irqd =3D irq_domain_get_irq_data(domain, virq + i);
=20
-	irq_domain_set_info(domain, virq, hwirq, &gicv5_lpi_irq_chip, NULL,
-			    handle_fasteoi_irq, NULL, NULL);
-	irqd_set_single_target(irqd);
+		irq_domain_set_info(domain, virq + i, hwirq, &gicv5_lpi_irq_chip,
+				    NULL, handle_fasteoi_irq, NULL, NULL);
+		irqd_set_single_target(irqd);
=20
-	ret =3D gicv5_irs_iste_alloc(hwirq);
-	if (ret < 0) {
-		release_lpi(hwirq);
-		return ret;
+		gicv5_hwirq_init(hwirq, GICV5_IRQ_PRI_MI, GICV5_HWIRQ_TYPE_LPI);
+		gicv5_lpi_config_reset(irqd);
 	}
=20
-	gicv5_hwirq_init(hwirq, GICV5_IRQ_PRI_MI, GICV5_HWIRQ_TYPE_LPI);
-	gicv5_lpi_config_reset(irqd);
-
 	return 0;
+
+out_free_lpis:
+	if (i)
+		gicv5_irq_lpi_domain_free(domain, virq, i);
+
+	return ret;
 }
=20
 static const struct irq_domain_ops gicv5_irq_lpi_domain_ops =3D {
@@ -868,21 +874,21 @@ static int gicv5_irq_ipi_domain_alloc(struct irq_doma=
in *domain, unsigned int vi
 				      unsigned int nr_irqs, void *arg)
 {
 	struct irq_data *irqd;
-	int ret, i;
+	int ret;
=20
-	for (i =3D 0; i < nr_irqs; i++) {
-		ret =3D irq_domain_alloc_irqs_parent(domain, virq + i, 1, NULL);
-		if (ret)
-			return ret;
+	ret =3D irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg);
+	if (ret)
+		return ret;
=20
-		irqd =3D irq_domain_get_irq_data(domain, virq + i);
+	for (unsigned int i =3D 0; i < nr_irqs; i++, virq++) {
+		irqd =3D irq_domain_get_irq_data(domain, virq);
=20
-		irq_domain_set_hwirq_and_chip(domain, virq + i, i,
-				&gicv5_ipi_irq_chip, NULL);
+		irq_domain_set_hwirq_and_chip(domain, virq, i,
+					      &gicv5_ipi_irq_chip, NULL);
=20
 		irqd_set_single_target(irqd);
=20
-		irq_set_handler(virq + i, handle_percpu_irq);
+		irq_set_handler(virq, handle_percpu_irq);
 	}
=20
 	return 0;
@@ -902,8 +908,9 @@ static void gicv5_irq_ipi_domain_free(struct irq_domain=
 *domain, unsigned int vi
=20
 		irq_set_handler(virq + i, NULL);
 		irq_domain_reset_irq_data(d);
-		irq_domain_free_irqs_parent(domain, virq + i, 1);
 	}
+
+	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
 }
=20
 static const struct irq_domain_ops gicv5_irq_ipi_domain_ops =3D {
--=20
2.34.1

