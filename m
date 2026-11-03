Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E874B606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bsyIDKWT;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=lEn4x3wU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YlfGwSVbL75ay+8vBxjrzjmT6cftmNmJQksKTUgPef8=; b=bsyIDKWTXA7bAtuumjV3fStv00
	4MpNV9mlz01QpSvWMc3waS9LgD6zt3F3aLcNpo6ORyP9jvszDkaFneCijgp+Bu74aHPELBxPkoil+
	op8rv3h3j01WfukadjdqTfMQpRJ2zO2olP+USBZpCp6+Kq3xZtIV5Hw3/xuLlR5TmWx8+RmAUcjb1
	deXjBPri2g/Y4mLHOzBTa8KvAjOL86WDQwRs8SpKn+xOazpbH5tbFBEXhZCQAUt64l0tdWcg+tcZ0
	S5nvafLxFNFuvgovv9acbRpXRoH5RGaRrYigLU5kd2ST95IcO0GzMGGXZhFMB4k7Zgo5GkpLfT6jR
	YQZdh7vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLna-00000003flj-1ifO;
	Tue, 03 Nov 2026 21:12:06 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLnX-00000003flR-493n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:12:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ebZ5z5MsNbGkEHsldOIxpFZoe+vNQzfXBUaKxD6IaQtsp21n8GnKUt8m5CUxwM60uwjzehCi/TlPjfOnyEJKc837lfkg97A3R5f0pJ8mWucopEO7/E492Q0712nKD9XC5jHsNT0AoicwBU23Tc/TEGpuNszCwplso3zF7rjFOioE4V6m+DNhFHQwoyYCW7eE44YU68is6Gr6o7EeDrpILgbRfvumbtYB16LK/clEF2xVZrGhx9khDFZcXm0cmPc5CvZz1pvjsTA1d4IqTIMxWKee15EINOeNq27MFMfVa77+9gihrVYPKUqG2gTHmb0UNym84L+6xy3f4kVmf7Mtaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlfGwSVbL75ay+8vBxjrzjmT6cftmNmJQksKTUgPef8=;
 b=USJop7FHomBEul1Qo+N8NJk3jSdm2e6IM6d6fav0SSSi5ThzW4LlWD0xH1P7BNYz7pW3lP+Qjf/WCKu8jJ2QIKfPwp6z928Xizfm7nzS4u1+8I82mtuBxo3aSR77floeE9rYbM3vEyYco/HhZcsTIffnaX0Mr00B9HpuvwZ2FvHp2JXHGyQ2tYn2yZ3kLIS9bAX49zWCV+4BHAKgw+kydL7oLs5iYSvTdVBegXaVy2NMkmrZXfo4M7nFL6ar7bYIZ7PAMnfxdQRCXAW2y9NF+TEAPsa2fv+MSLaHVibPvm77NHS+J/MRla4uAWeBbn2ZnJHwyDOuUwvkNhEkhmDqcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlfGwSVbL75ay+8vBxjrzjmT6cftmNmJQksKTUgPef8=;
 b=lEn4x3wUmToQXZxBNqHuYjmKp1XnxkTYJHqzzZVuLdUHcdv+W1KfQlcvI3UrRB7Z5FWTrHq7Cuy95bva1ZG7fKZ3LH65ct71LUT234Sdmkn5w86mJUj/6gPHsE7xxMS1vZ5TP4SB9UAE4NZB6PaEmRXgTh9tpRqURxs5/8/ydaWsQw+iw3/01U0JmTSkJQJs5doAqlEnhMUkCfyqn47r1a5AaQd+Ot+VHST2Ur4lEXiDAAFy4NzloXvILtv37fHe5qqCixmNXlndNP0II41mn9vS/7QAnvzBzKknvN6e8o2SvDfRvI/EFOUxVGdswLXPE9r+QwYfSOMSAeHRg++jCw==
Received: from PH8P221CA0046.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::21)
 by PH7PR12MB7233.namprd12.prod.outlook.com (2603:10b6:510:204::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 21:11:53 +0000
Received: from PH3PEPF00059618.namprd05.prod.outlook.com
 (2603:10b6:510:346:cafe::76) by PH8P221CA0046.outlook.office365.com
 (2603:10b6:510:346::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 21:11:53 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.118.232) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 PH3PEPF00059618.mail.protection.outlook.com (10.167.243.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 21:11:53 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 3 Nov
 2026 13:11:36 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 13:11:36 -0800
Received: from dgx-1v-42.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56 via Frontend
 Transport; Tue, 3 Nov 2026 13:11:36 -0800
From: Jamie Nguyen <jamien@nvidia.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
CC: Jamie Nguyen <jamien@nvidia.com>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dat Mach
	<dmach@nvidia.com>
Subject: Re: [PATCH 2/2] ACPI: FFH: Support FF-A direct request 2 calls
Date: Tue, 3 Nov 2026 13:11:36 -0800
Message-ID: <20261103211136.4122648-1-jamien@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103173907.1996118-3-sudeep.holla@kernel.org>
References: <20261103173907.1996118-1-sudeep.holla@kernel.org> <20261103173907.1996118-3-sudeep.holla@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF00059618:EE_|PH7PR12MB7233:EE_
X-MS-Office365-Filtering-Correlation-Id: e276aac9-0e49-4cb0-32d2-08df39ef15f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|18002099003|22082099003|10067099003|56012099006|261102123227099003|261009223027099003|261021133027099003|261022113327099003|261022105027099003|261021123027099003|261022115727099003|261021135927099003|261028144727099003|261021121427099003|261021130227099003|261022075727099003|11063799006|4143699003|261026130827099003|261026121527099003|261026135527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: xX1yKmHyW0qv6Q4VsbGohNE83G0vkhPrx9tLNnc8dXQqSB8NAGsXkIDghv6yo4Pzu1E8iNM/PByq/AdjyKq7wBaee6UcxUwgVU0iivp5FU4jtbUzmgR2MhpDAhuGy5VrJ3xUCfhP6FkC2/CFFouomGeAxvjNJXrnIdtg0HyeDREzJONZOZNULXEMXgm7v2x0/uV6nli/ibJUtBfo8s+KkPbD8gAChTfs+Tl3OLpuKe+DbHISyxPkY1vr5kUwhalHWdX2ZwdP/bXYPKyYGvjwVe71KbDEBcceRnIdcJcErsgn+xEwibDdvc3FiRusLVa40QfCNOe1O9wMc2NnIMHb9z9WVRDPueyVVOGagux4kBKWhZSapfSv++kmZnrNFxnH0/Wmkj4l20WnCLhtvZC1tkZtdEe+AcpAIni1ECTr5DwqM7FQCjtUg48W2KENztG2nNBZmrM4IsdPUvBCq/S/JKeXo7wTsJV1mMoZR9CXa2k36OQNQ2SCOT1dd7AAbqcpG8JfU0AhpT/fIaq3zNMdDl8t2zebymC+5IBLvgg/XgAaOtZVSw8OIXAJ8PemWK6C1OO8T8reIWrGNG7xWXk3ZKzkP5/Rigz9Y0dLl+ar8/jl/dljY0ht3NOkZ1A80xgd8h+GuAzB3xZPDap9Hzv1DNLJGrbaKyN7zwDldRizD1fnBe43WAWWllzdgHXEsTphWcy4qp8QFTqEGDmrqEza+g==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(261102123227099003)(261009223027099003)(261021133027099003)(261022113327099003)(261022105027099003)(261021123027099003)(261022115727099003)(261021135927099003)(261028144727099003)(261021121427099003)(261021130227099003)(261022075727099003)(11063799006)(4143699003)(261026130827099003)(261026121527099003)(261026135527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0kjiUbkg00o/YDqpjzg211BdfEIAuU4aecjcTyugKow/PCKqK1pKU14mIatXQvZ2RAQ3KaF055w+tekVx8SkmlFbM6ZpBcxHX0fU6CeRW+SZ4+dAbSHs3Ty+HmSnoDi1OcsAp+4bOF5sqHJT3PTUrHictwgDmSpXP/ulPTAm6X+14DMP9LH0rW90MnrKxm2/3WTZdO1Pu5igB+JGvNUqjoTyMgGMNj1PJir/Cg7C2F7RiES7vnKyKbqFMIDlGtOcovsky/HQoybsSPYtB/XKTK53LMn1DgKeFYshgM/NSkPpQnUIgSS8pzxuMldetWeEO3yBV3cR13xaiHAdEtIKAIdRa5LJJ2onJKQDgFgZFl+LHr9q5ZRXHJXPhTdRa6DHo54jSz3HY3/Qm84HqfurU7vZ52JyLdsF9pzXHm9DX6Z6tZLRYM0TfC6X3ALKNSFi
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 21:11:53.7088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e276aac9-0e49-4cb0-32d2-08df39ef15f2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: PH3PEPF00059618.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7233
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_131204_058754_9152BFD7 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 05:39:07PM +0000, Sudeep Holla wrote:
[...]
> +	if (!acpi_ffh_ffa_version_negotiated) {
> +		args.a0 = FFA_VERSION;
> +		args.a1 = FFA_VERSION_1_2;

Same question as on the earlier thread: how does this work if the
transport driver has already negotiated a version?

[...]
> +	ret = acpi_ffh_ffa_features(ffh_ctxt, FFA_PARTITION_INFO_GET_REGS);
> +	if (ret)
> +		goto out;

I think REGS is only needed when X1 is zero, and if I understand
correctly it's optional at the Non-secure physical instance. Would it
make sense to check it in the lookup path instead, so an explicit
receiver ID still works without it?

[...]
> +	memcpy(&args.a4, &buf[4], len - 4 * sizeof(u64));

I believe this would trip FORTIFY_SOURCE's field-spanning write check.
So I suggest:

	memcpy((void *)&args + offsetof(struct arm_smccc_1_2_regs, a4),
	       &buf[4], len - 4 * sizeof(u64));

