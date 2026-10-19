Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDADDCCF2D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 02:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5XrVa/WZsdWl0kXEO4Tad1CAMv5WguTwZ9fsvVxcDg=; b=2GnKN7KWl3u+fzHNFl5GdJ3RYL
	3qpHi5Iwt3wKuzwydpVF8QmLLAPSr6LOZjB7NB94ZLjdDXYnZKMeP4IldRjtWrEDlFq9qcXKc68LZ
	FOWcHf3itThSpi2NwSLTEO6l2QfiLSdIIXzikWPloHYiWhVQ1ZkV+uUXckU8ulKmNN7QbbP+TcBK8
	+7FuTZ0soHfOnTXS6QdQ6hV6N9FcWxWRnG0W0tVYdI4CbStiBAx70FduYaHI51tU8j9qMifMZp4Lc
	fudsqmX/ehspJJ6fXvqBYJzYLyJQcDt7UyirzUgIVAaaReLx2nUZ2PYK0vMK3hifvkphybLrrmEI4
	uDUbvPeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcpI-00000006RHI-1jOt;
	Mon, 19 Oct 2026 02:10:12 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIcpF-00000006RGZ-3rd0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 02:10:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STwad6xmc2+rE7kFv1vTU3iZuoP9Rc7nJ4Q25fUMUx6EButYSsg57LOSEnwY6v0f+hS8BWDOTDcUhw6kRTIKqG6ieEendDJSEcmvGHRFBLYohc45z5FJmon1xP/kStTbsajeSKM+OrD0nDCn6/KONE4zVhOtelBSwBnKqpC1xvTJ/80tDtBENH7FRrKXRh0iYYHroVF7TvmZsrHPUgKmrxFBe0TrirLMQ3Ay42+EFsxZKODx5TBUI7U9IEy7c4nIwv7zvbd5UdJWRwvmpuI5evUcr974bQzjM5oVbS2NVjG1yOb6zih//Rg3aOTlvI3VCQ7b/FvDU5kO/QI+s23ZbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5XrVa/WZsdWl0kXEO4Tad1CAMv5WguTwZ9fsvVxcDg=;
 b=S27BAJm8BjYvRnbjVlmZmL5gUSnScQFcT1v/LJ7MuHXVWbooT673GNdAa54K5VtaAtmEqgzo+lskmf89tHHu9jLg28SvV3jBJw/ktjTt7BqRsLoSt3LLB+thp51xIegbxaEfhdX0hcQytN7bfCyzLB6MQP2hosfh16xHIFx6++JdwQHc2PqK4dLNgcFFJWCGUZ9X5u1ZISkECRKzhFkSGx0a1lClTnMDJQsZjpbQwVD95p8hgQxyaRhYGVD581wlT1Coq6wY03uy48Oi7ySbNZWhMyk+d/8qVxNXL2gWnJfC2L5UhYAXK9vbfid4JLA8VfB5zA+sclfdftMtyefzzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::9) by TY0PR06MB5152.apcprd06.prod.outlook.com
 (2603:1096:400:1b3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 02:09:53 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:4:296:cafe::1b) by SI3PR01CA0002.outlook.office365.com
 (2603:1096:4:296::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 02:09:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 02:09:51 +0000
Received: from JohnnyFan (unknown [172.21.64.24])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id A468942C6447;
	Mon, 19 Oct 2026 10:09:50 +0800 (CST)
Date: Mon, 19 Oct 2026 10:09:44 +0800
From: Johnny Fan <johnny.fan@cixtech.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	james.clark@linaro.org, jeremy.linton@arm.com,
	cix-kernel-upstream@cixtech.com, bob.zhang@cixtech.com,
	jie.fu@cixtech.com, Fugang Duan <fugang.duan@cixtech.com>
Subject: Re: [PATCH] perf: arm_spe: Support heterogeneous ACPI systems
Message-ID: <atV7wDlfmd7sermb@JohnnyFan>
References: <20261015062908.3565761-1-johnny.fan@cixtech.com>
 <86mrsf1bnv.wl-maz@kernel.org>
 <20261015141926.GC26205@e132581.arm.com>
 <atGY5+kzQggCZboX@JohnnyFan>
 <20261016100538.GE26205@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016100538.GE26205@e132581.arm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|TY0PR06MB5152:EE_
X-MS-Office365-Filtering-Correlation-Id: 9977b793-9b7d-4c74-32e2-08df2d860f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|4143699003|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kQG3gfFEU426pHuLafVGhyY5UXAgKKpecZdXLoQvhCDUTLKtaXIqakwTWfleAoKGp25uOiU9QjkGDpJ0BCAhHblMUWppT2Sq4vhD81flUt6bgykWP4+GaJ3ti9As8ypj9c3RkTUV77DihYuDVzGmHmgIDCijGCOgPQeXiFFAY7zlR6dmMSeJiEhyj5PYtmonsMRW7rfI+dhSxSLLCcCQ29ChwXa7UjkzMwxhP2oiYMDMU76M9LDf6pWTEg2/4PzH97aowKBUt0Sc4OkLDKfRJnowHprAeHo3MRNqdByW4IidKLVfNbwhegoLi5CrreMUr0Q50qm23drA017Fh8tWXwUTZR9KvuH2JlzmVhmGR8yitgzCfTrzwDyZDj1Cew90aVWlFschImYvXwDUokSrwNm6MjBKjowaUHEHHf2zsIw8MI2xITM+1VgOq7gVXBSThRUkSYRdM5eP5bkqyZHgqjabjNA9oyxq5iwzS9dZJfXY4+bx/QppsDnETMRqt0xlPaKAhSTuHdCD/cn94K1nq+0/RI969jYWdvxnuBBiXhxkZ7FXQ4NiYbk1TINYNWceHDKXQirD4q6qoYG2tum5CNS3kfkFqwYtHvWUI8oyopKmJlduYM9ptA50SCjHIS4TagjFtSvSx61B6P7G2WMJuUYgy3MWldOLo91AoB9AyME8F/wHTKz56dj8DYXNFJhQiYx4DNm6jgrYhjhEqTXZAw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hH6nUkKBULCYGS0X4T+TKo8i1f5HbQB4y+mSspeBAh3h1nOKziKiz5r2evkI43WCisnP9sIjI7wJrpiQvhzsLfYuFVU5MWoXqjFbLbwGOg/adWvw6JzjE6T8NOuYvCxepwO+i8y/65rOWf2yap6Qg6OO/gtX130hUS4pKcto5Gpk6zOj4zwC2Imm9ape4p65mCqEB3hWIQjgrN6X+2n1+gFI7abnodOdBr29oeQO/FdIUnksvOVa9m7lZ45QRuiAc2RL3/SnmRTeNvXPRRPG3MQm2LPdzGe1u/HNczvTocXucCe498KWve57sgI7BXwKSzz3X0fcd+zizNR6OwT38WNS+nCctSX32Q3idN5mqIt4EW7RxP2l9+9rDKX9mSJ3Ni0tVXmR80PCVDzzVLorKVHhmGNL4+rJTqidH6/Qt3AyZnIEyfn5zcloyUOKzXsc
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 02:09:51.6647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9977b793-9b7d-4c74-32e2-08df2d860f84
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_191009_962845_AB2CCB10 
X-CRM114-Status: UNSURE (   8.65  )
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

On Fri, Oct 16, 2026 at 11:05:38AM +0100, Leo Yan wrote:
> SPE driver supports heterogeneous systems. If firmware creates proper
> devices based on CPU topology, the driver can probe multiple instances.
> 
> So "registration is limited to homogeneous systems" is not quite right.

You are right, I meant the ACPI registration path in arm_pmu_acpi.c. It
registers a single static SPE device, and only if every possible CPU
agrees on both the implementation tag (hetid) and the SPE interrupt
number -- a CPU that does not implement SPE reports 0, which breaks that
agreement, so a heterogeneous machine gets no SPE device at all (the
boot still succeeds; SPE is just absent). As Jeremy pointed out, the fix
is to group the CPUs by (hetid, GSIV) and create one device per group,
like DT does with PPI partitions. The driver already handles multiple
instances; how each one gets its supported_cpus is the plumbing question
I asked Marc about.


Thanks,

Johnny

