Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B22C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehoJ+mfr8kJorxUxvDBirt/C95AcbTFpySKnWqn9GGE=; b=b9dNgKQVBQ9KUF2VNq0y+XZSEP
	TwPUp3NfUPy0iPs0vrNRdxh9mVb1PxyMWugTW+fFzSliw6srOr0WvzRIB0FbVXFwYaqSEIEMcx72L
	tgVAm7xF04499IDEhipYWB/SQQWD323Mfs7crf2VwfVzJyxAaDPtex94AIl+nQ84z1PZC9LxJcQdT
	tS8/VAh6pWXvpXgn3sEQ7rYOvEm5v6lKU7eFvEUSFQv0qWIb0FlHnqgKPKPCOFwMcfm3WdA0nukRR
	XlVn/akYLnL0FfmGqBAlBn/nV3yCCfkwYSCvfYI+tv9AFOZV9rfiDDgqQ5sBpNPy/iaBfU1FpGnW4
	x50S53gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lIy-0000000BNQ2-0DAr;
	Thu, 24 Sep 2026 15:24:12 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lIv-0000000BNPX-1Mgn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 15:24:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGRO5Y4fuUL8+QsjVnYKKDCfTd+2hykEGEozhHgdBRXevWA276N4mFJPDOHBWAayETBz3B3737u5WZFaWu5pVkkaC1ADr5J64LmsI02PIzZ9Ht1+1Mywhsc5XcETzYU60KASz3TCKVK+Goih3+UnFKCftFHpTdAfupzwpdBktF37yIoxYPf0JMevHfM6vKHcoJhzI5Kk/JlocjxQItIgXN45grMvNkUkQ7DgSm1PToCl9/wTs/gzNIbJtCM3WqeKtF5L6e6+WyQ2lpLyglN7SRIxGicOEzHTPOLdsF2FDLgtqj0Yt5GhP2KplfSTLwu6H9qZkYUvZ7GR56REIJncTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehoJ+mfr8kJorxUxvDBirt/C95AcbTFpySKnWqn9GGE=;
 b=XkZ5WrhEnKodXYIIr+XIb1KXsVfHCkWrOI5ilc2dZdD/6Y5odsZo+LUh9f1mdAqE4vMcBN85+hOxXAeDfNV6WtS0uJCDy1tyqIE2+hDvx3GWhO3eqEgfXy3cYFl49+p4IFHJtuw0Wkk8N4ua8kVwqcUp0SjuA3UjZ4CBJgb+jZw+hSJvsfiy4m7j6ihKfky2/cPKU8Hiuik02DSrCs/3Hx8gQHglJ7yFor16d/AOUnRqybRb+1fNcxsBQltaPXukLczO+rlFB+p31g9Eu564dzRUvfKV0+girUT+JUBHjsyfHcjLS5Leu6jt3DZUAKJI/AEmykU8W1xuwRFApI/JYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehoJ+mfr8kJorxUxvDBirt/C95AcbTFpySKnWqn9GGE=;
 b=ZXVTFxXqK3wGxEfKVJooQy13o0mT1iVF5G06x+gUe67o19yCH8pf8F0x2Llxd3ybTlI/ENFqcNuS/DUCUYVH6IbdTaY0KclvQV9klKGuY4kvHqoWhFUYxfpoPFznZ5QtQC9NSr4bFezt9MjpqtPOEyp3wIdGwhKs0741ZeL37s4GZwAGOInW+oDkPnZ/+l28iH8FoRQ+jkDZYRWz+N4wiyw686khRoBGwPasFpsTbxa7WrvjaKWbOGCd3KmAAQkfd+FAlTQSPtFRara+NJf6qJjM8JCqqXgdSmMO/QsPbfE1+IR4ekK8Wvb8/Oc11Nz9CGloIFvzdjq5h8VQ6zolYQ==
Received: from PH8P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::27)
 by PH7PR12MB6537.namprd12.prod.outlook.com (2603:10b6:510:1f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Thu, 24 Sep
 2026 15:23:43 +0000
Received: from SJ1PEPF00001CDE.namprd05.prod.outlook.com
 (2603:10b6:510:2d8:cafe::76) by PH8P221CA0002.outlook.office365.com
 (2603:10b6:510:2d8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 15:23:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CDE.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 15:23:43 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 08:23:22 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 24 Sep
 2026 08:23:21 -0700
Received: from dgx-1v-42.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49 via Frontend
 Transport; Thu, 24 Sep 2026 08:23:21 -0700
From: Jamie Nguyen <jamien@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
CC: Jamie Nguyen <jamien@nvidia.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Dat Mach
	<dmach@nvidia.com>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] ACPI: arm64: FFH Operation Region support for FF-A (offset 2)
Date: Thu, 24 Sep 2026 08:23:21 -0700
Message-ID: <20260924152321.3864148-1-jamien@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924-tall-oryx-of-attraction-23ada5@sudeepholla>
References: <20260901192906.133670-1-jamien@nvidia.com> <20260922-purring-fennec-of-exercise-bbce5e@sudeepholla> <20260922155211.676134-1-jamien@nvidia.com> <20260922-exuberant-earwig-of-opportunity-4fecff@sudeepholla> <20260923124050.3270801-1-jamien@nvidia.com> <20260923-lurking-pony-of-fascination-ac6c49@sudeepholla> <20260923173240.3710620-1-jamien@nvidia.com> <20260924-tall-oryx-of-attraction-23ada5@sudeepholla>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDE:EE_|PH7PR12MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: 4203a373-c07f-45fb-1f4a-08df1a4fd1f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|7416014|10067099003|11063799006|18002099003|4143699003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info: 6HZJj13oc3sg5lmfmy/LjDEUn4cPy26eba8N5didOruxAkKEUyCP/WBEQz+xy4izz+6LJitK+/qrN2eMLudCtMg9sIT2y79t2bHRERduZja19rXGQaMsZpfpYPJEMh0+/IRbG+hPTZOaAEo/m2H5oRaADNDEgGovvrkR1EM+JWjPYYtgVgKqv+QRTZAwWId2b4s0dfeigvsJt4EzUOwnZvWzwqQWyvgIPlDsSNjO4eJeMWdflW/BJm1dIxNL895BIlZ/j19N7LNl6H6yzi1ariZkRSRRoI6yd+aU3cedq6HOJcYHS1d7/tzm6n6CWvUGOeMZ3e9y/VMn0n3tgjQssr8N8SzeXvuE4NV/xQLQC0T1Pnw0eRU0LL8Feeqk+hgHueWKD8hZZ75z/5Fd2un6kHWgSKkiwoxSFe9EAVys/pIiYYUv8+cTk/ssAURpuWxnD429oVkABtjpo0IHUz/RKrULUACb3g+4H8WmeexUGSUvCVhvzS8G9qdfzlLlZVnaSN06UEPu7VmL0RMzs6LmV83RsJ9P63LvzUibQek5Ifky+fEtvHNF31HM9ghRQYms3G3qoUPRsecQKgzxdm8Z8UZuJDy3TPySLB99SjJihRJr3KoBM5v0kFLWHjEYcfohiuwVXRX183IjaHFPgeSgIy2kUjd+9U3cNWohXX82jn7OozAHp/nzQ10ahfxLJETbR1FHFJOelavXO0ncRO6jKQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(7416014)(10067099003)(11063799006)(18002099003)(4143699003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Xt83RhRB4oPbCZBjhUZ29LnrvW+gfMVitzjJZd/aE/7LBolUS6TMJorzHslv60zkx/+XkW/IDHIEg8PIMWRTwNY8fHo+X5Ar3TME4hlGTh8V0B7BNEYe/KFd6Jbi1F6lQAPRvVN7U1bJ1XuksFGb4hUA7r0RP6zKeV1dJPBMPCXcQ/hfLaGz8xt0+3V8Buw7y/QrW1bCtEIWIfjix1aOG8ITRlSAvWLe0TBgVxHiWDlUGh4XXseIHy85+YyTC5ONpfKKOwQvT9iqZC1b7TOXDT2pfUBW3ho9UB40qJniWswIfHu2bJIZdvcHxig+uCaWqYEOKB0J5kOCgtzSN7GWIavOnNnmQFJz7SemBIMO5ki59qlRa6AX9fi2iXKBiWsCRg0VBN4zXPNLttq2cg+Q3fZWHCwl5XhYLD9oqZtO35gZqCxklL9M1N1Eucjqkdzg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 15:23:43.5806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4203a373-c07f-45fb-1f4a-08df1a4fd1f4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_082409_395697_2F71086E 
X-CRM114-Status: UNSURE (   7.79  )
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

On Thu, Sep 24, 2026 at 10:39:24AM +0100, Sudeep Holla wrote:
> Which version of FF-A is being deployed on your platforms?

We have platforms with FF-A firmware versions 1.1, 1.2 and 1.3. The
platform I have been using to test offset 2 reports FF-A 1.3.

