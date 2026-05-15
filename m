Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB9DCD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 17:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9ew+pYP4bXUyEVQiFKSYkoEqWdE49A8q03yhewBg3U=; b=35b9cR9UHCoqDDiYUxw4ZBnhcj
	vj5LlvgOaKlChDIsZcSXpE3MJ/9D+EcwQGDmJPvFkq61hwr9VtOVbCFq10aTWZYjGOBXHE0IrEAvd
	VOxJkRz0fq6WhVtgCcAIEpdq31uXYEiytyzNWMb8cOlH+YwGyXoSW0OCHIo5wxgKoVOJMVt+pDyC2
	O+bxe51V8zwI59FmnZ7g7+Bj0QMyFDyn/0SJJBHBmI7fdlFy+TOmiYAQWmSdRIlz1FbtRHBhvTSaS
	A351uwVFeM7ko0CbJ3gKIyyefYSlOhWzIU12aIo94lSmHQh/aW0wvrTlKwIYy2XyNeuqsP5n8/M5d
	apWsKFGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwbK-000000091NM-1Q7c;
	Fri, 15 May 2026 17:45:30 +0000
Received: from mail-southcentralusazon11011061.outbound.protection.outlook.com ([40.93.194.61] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwbH-000000091MT-3dwj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 17:45:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpkqZuM4yEdIPfpkqaVQTG6tT27TDPaIa9N6GXR0y9ePlmjnxxInnXUgulpygDeKEXLL0o9ud4wuw0B78d0ExUcsFe+g509bxRr1PGXIPBjw/Yh4FDhP8k4gn5+df6ao6CspefsQ+m83SJ6QrvekRjnlo1egNKmc4Ldr/R+vCjvmama4kVVuAPHXVbEEW+thvhuNmfndAlEdl1diL1A/21gHEfdtk9ILoBrCVXFnw1uwXjlkSz1o3fEw0aj+cs0jE1G4mQQCAKSlafBsbVjigbsidwouBttGsNyLuD43gudN8L223jRS5xxBH7qG3xOkceyKWozp+amIh5ZAZaXoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y9ew+pYP4bXUyEVQiFKSYkoEqWdE49A8q03yhewBg3U=;
 b=Du/IJgb5NMnjtErJo0k2ud0ztjHjhX47e1sxKtUTRpv4JNknnrrkmm687PUJFSyTxANwVpz401cORKraGwzQy8/00sftCXro1lSz3HFFyKpR2ZizVGpxcYR+iRAWoskGYd83u1D6ylLlkyHJ4ekb3DKY9CmdZg2VQtrixzn6r1rR9ZKkswbHtgBxa8QE3jV+ZuXsJdfrZJWGSed6IiEesAdCfN0G1M614eMBtmpDNHSvanx8lwRhpldDPZ0q4jPdVIjk4DZlqvlYeON8yOYwYTEuasqYiXEqQwMpt0Cp7KVh8AdduyZl1vgMsOi5N7kffr4zxJ9MaWUnAT4cBojqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9ew+pYP4bXUyEVQiFKSYkoEqWdE49A8q03yhewBg3U=;
 b=cPJ5tjpwx932Imx4oe6pWMkSBlHE+bODNLSUDTIk2lT5xerHjN/CNTR3zOdDQZfYqp1U4t7/s5EkHc17tAkc0qLCXt8TXN9umyYr7fNsCRDpAWlmylFNUyv1goyQbviKB32hcwD6JzDUb/ZoeDnopUHTi9t+gqU6t8pXyRN648YotmpQzjHQYouB2poXz1kv4dY3H67xmW0DdyhjPfD7p+s13PsBs8xc+rd0zMgfx6thFfYYp6Qm+89eb7/qqcWop9cO4pTznFFLY9ogcpHJ8exfra8f2Vki9Fz7clFYm0L8HsRxqc1xebGfrFnan90kjNjGRSI6G2dsFnJQ33v0bQ==
Received: from BL1PR13CA0320.namprd13.prod.outlook.com (2603:10b6:208:2c1::25)
 by SA1PR12MB7318.namprd12.prod.outlook.com (2603:10b6:806:2b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Fri, 15 May
 2026 17:45:13 +0000
Received: from MN1PEPF0000ECD5.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::a9) by BL1PR13CA0320.outlook.office365.com
 (2603:10b6:208:2c1::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.19 via Frontend Transport; Fri, 15
 May 2026 17:45:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000ECD5.mail.protection.outlook.com (10.167.242.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 17:45:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 15 May
 2026 10:44:53 -0700
Received: from localhost.localdomain (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 15 May
 2026 10:44:51 -0700
From: Jamie Nguyen <jamien@nvidia.com>
To: <sudeep.holla@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jamien@nvidia.com>
Subject: [PATCH v2] firmware: arm_ffa: honor descriptor size in PARTITION_INFO_GET_REGS
Date: Fri, 15 May 2026 10:44:32 -0700
Message-ID: <20260515174432.13419-1-jamien@nvidia.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20260515-quixotic-active-dragon-2ee2c6@sudeepholla>
References: <20260515-quixotic-active-dragon-2ee2c6@sudeepholla>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD5:EE_|SA1PR12MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: c956484c-4420-43a3-ecb3-08deb2a9b771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: dnBLFJ68qA+V8prLLfDMO0GTxmIp7AyZCfc5hV+g5ITLRMK3m2ntjy6U4hW1oejkHFKByuivvuazkMacb/we5aW0Ldt/5fc5z5gFTiZTHgE47SPvryy7/SIpa97pn6fCtIS5Q8yIqRLsyV5WgA4f1IIhz/o14RwnTZMiTnmmipEGo00VbQZHxv3iInE8Qn6KKeyQSB3WP4XBwmF+Dgr3vVVB+mIjIDmlKRgYsdXgVbRpaUb4ojnCZpBy6NDbc5NSH16KExkYLw3scl0BOWw+9SUf8JREmJwDEKZGujXHgh+YfZymXvg2PyigEtHvK8zF//3xMXJjyPbZyRcuQM8INBe9aaAZqHtuJHm/v8KN1A/1G7IgoDU44HljHsYdy//i5vAvggzf2zOdn7h0Z784mDUZIXhNjUl+h8IbY+iwT20pnWPTqSaGhs4g0xFxHnkKiMdcNXmXXj+4i6wn3JJmdUW2MNgOBoVnLzlE2hO9aOvUlwOK1/dMSUTvAsv+G2YkEnxE3HLQlAzJp+AjT/Lf3t6j/k05xNuqnPG8/nIzVYfHJygfspVAVoYNBR3jp+GgcgVrTVkSLGBOS9Nk0/7sXirWx69z4r6nzvP4NncloalBMN1Uc+fvg4VclGZp1R6y7YJJZoSFMQ3dY7XTDoq5hid430sxplRd/E0oDIcEmsVMRdzBc3XDAG/t6GwVsUsq/DLcuEd1/0E4zT87CoSemt4QhA7Skcf9ipePJA+WDhk=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xCE9rzHQ6HjFHs68kYZKDWsncKEdWwv9t/M+gYbM+lHlr62+R52Ud9s2xHxnBjN4UHL5eqSy9RLNBJD7M7Gi03VAzpAASvbtvavG0lN5+69tJIMgdP991RdufL1TW1drkzlC/Az5X/mSVRjZgQSf68P33S2pzI3tUzkTKKJ/98lWsf13kfvhJs4rzFyh+ABwJyXR+5bKgoOt5W8pRYSTBIbEmP5enE9ZRw5BsMS+eHktg3LunchX9ryQ8bfH1Gz9/wZLbpzFHBKr5wwzqGJsZOVMIv25/BEnhvwYIH8EawRuZeKRppq4w7a0syo0oYPYT5ioZbvsGjG3oqf8QZ8wX25n7JcurQgwtwKU5CjITCduL0x7H5RsiGJICBKOpY8hQi8j55MYIKUqgvUUvAfgKoPxXb8cD/cg+AcfN6t6Z5MIPIh4CNXXeGYutrq/171v
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 17:45:12.8175
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c956484c-4420-43a3-ecb3-08deb2a9b771
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7318
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_104527_913243_E625C240 
X-CRM114-Status: GOOD (  15.45  )
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

__ffa_partition_info_get_regs() walks the response with a hardcoded
24-byte stride (regs += 3) even though the SPMC tells us the actual
per-descriptor size via PARTITION_INFO_SZ in x2[63:48]. The size is
read into buf_sz and then thrown away.

That works while every SPMC returns the FF-A v1.1 layout, but it falls
apart against a v1.3 SPMC returning the 48-byte descriptor. The loop
strides over half a descriptor at a time and ends up parsing every
other entry from a slice of two adjacent ones.

The FF-A spec (v1.2, section 18.5) says that the producer should
report the descriptor size, and the consumer is supposed to stride by
that size and ignore any trailing fields it doesn't understand. The
non-REGS path (__ffa_partition_info_get) does this already, and the
REGS path should match.

Use buf_sz for the stride, and bail out with -EINVAL if the SPMC
reports something we can't safely walk.

Fixes: ba85c644ac8d ("firmware: arm_ffa: Add support for FFA_PARTITION_INFO_GET_REGS")
Signed-off-by: Jamie Nguyen <jamien@nvidia.com>
---
Changes in v2:
- Rebase onto linux-next; reuse the
  FFA_PART_INFO_GET_REGS_{REGS_PER_DESC,MAX_DESC} macros it added instead of
  introducing new ones.
- Return -EINVAL instead of -EPROTO to match surrounding checks.
- Update Fixes: tag to the commit that introduced the hardcoded stride.
---
 drivers/firmware/arm_ffa/driver.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index b9f17fda7243..38ae4476e864 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -374,9 +374,23 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 			return -EINVAL;
 
 		tag = UUID_INFO_TAG(partition_info.a2);
+
+		/*
+		 * Per FF-A v1.2 section 18.5 the SPMC reports the per-
+		 * descriptor size and consumers must stride by that size,
+		 * reading only the fields they understand and ignoring any
+		 * trailing ones. Reject sizes that cannot hold the v1.1
+		 * fields parsed below, are not u64-aligned, or whose total
+		 * payload would walk past the x3..x17 window (e.g. a v1.3
+		 * 48-byte descriptor with nr_desc > 2).
+		 */
 		buf_sz = PARTITION_INFO_SZ(partition_info.a2);
-		if (buf_sz > sizeof(*buffer))
-			buf_sz = sizeof(*buffer);
+		if (buf_sz < FFA_PART_INFO_GET_REGS_REGS_PER_DESC * sizeof(u64) ||
+		    buf_sz % sizeof(u64) ||
+		    nr_desc * (buf_sz / sizeof(u64)) >
+		    FFA_PART_INFO_GET_REGS_MAX_DESC *
+		    FFA_PART_INFO_GET_REGS_REGS_PER_DESC)
+			return -EINVAL;
 
 		regs = (void *)&partition_info.a3;
 		for (idx = 0; idx < nr_desc; idx++, buf++) {
@@ -395,7 +409,7 @@ __ffa_partition_info_get_regs(u32 uuid0, u32 uuid1, u32 uuid2, u32 uuid3,
 			buf->exec_ctxt = PART_INFO_EXEC_CXT(val);
 			buf->properties = PART_INFO_PROPERTIES(val);
 			uuid_copy(&buf->uuid, &uuid_regs.uuid);
-			regs += 3;
+			regs += buf_sz / sizeof(u64);
 		}
 		start_idx = cur_idx + 1;
 

base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
-- 
2.34.1


