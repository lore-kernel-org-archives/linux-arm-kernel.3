Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F259DD58B21
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 05:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yjh/keoUIjr0567Q1/PvQ2pqHVXECc7ZdVYKuZ+LU+4=; b=RX6oEq0T8/2Avw6h61s1RBXBkc
	c3N0lXwBwJbly9nljTGB01D9eytci2rIQPcDMDTQ315vQQ4+HISep76kxdKchTYxwCTDVWuF5HmWa
	G1GQg29zLCWgz6zIeWLtq23zJ+ruVjaFiVrs6ygMcdWrCN6FYHpCcnMZjfTWm+2qkGIi4kcXMPBTT
	eac+A3gjckGq8lSNLgZWwTj0LO9pIM0mduvJF5/qpVq+qv29i0RQP0MyEnI8VDcAQTPuFRkIvKBR5
	Gegpkdhi3ngieirKNTUz3Fin1rDVBESFBRN7Ixpu1bqSiwFN2TgAUJhp8wrDk8TVo9GcG5rhG+URA
	gsEonxrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20T9-00000003LDL-2JbO;
	Mon, 16 Mar 2026 05:26:23 +0000
Received: from mail-westusazon11010008.outbound.protection.outlook.com ([52.101.85.8] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w20T5-00000003L9m-2gSt;
	Mon, 16 Mar 2026 05:26:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0S2sUCRCNgR+iDDh8duOaKEUrNViLrrU3OspdG/7QMny+CP2c1h8k5bl3Mb5R2mMzqRJPprOaYyj7LlOBc6WyQO+wpF4K109M+8C+Eju2JWYJN1sSes5ER/esMfJnQpa7/KRu2KVrb+9bwWdWcw3nF4roXSSRsn+z6eSDCMcydAv1x/8gO+Sv3wO9q3efNQ90ALq+tvYvSL7bN6KUhLoJOEjAizRTJbeHU7oROhDSc/gEaUG43XY+hG2gfsHgoX8Hxjn9vewNexcrQ72RGzxhQSOB5GVfozW3bC9oZV7qJeeOuD+a7nVInjHc2A7MycZiZMH/In0UIS5Frt+zOvjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjh/keoUIjr0567Q1/PvQ2pqHVXECc7ZdVYKuZ+LU+4=;
 b=lMC+1SD50R9jaOTxv2JIaIYLuRo10ndq5R9MS2sj7REMayHgSNrdhWXov8EFXFf+z9a6NREsYO18Zm80sEFKUW2Mm+tynoegGt4jh/N5/heh2swsgD8w2VVNPPQQPeyCrjADQiE1ssGKyTIkfqTCxZTqNCnagTopmzaVa2CD5yiu3qM061hS2yyGT9vxv8oqCObsTVYN7pgQGokfim6i4I1AQOHxhi9faXN2wGBsbTa30WhiNamale+R12i3oVbiScWS1RQE1SwdFfWKlWCngyU8++/ndrYayMwjSnVniHNJhh8EjsyO5BU1L2bWhzwnWFTfZXtcw3fbDrf7TcLedg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjh/keoUIjr0567Q1/PvQ2pqHVXECc7ZdVYKuZ+LU+4=;
 b=XU8SI5cbc26zQmCFJtmROjcAxst8/iUSLNLblBZzm5k5ytPGXjANZG1qPRmUpXm0tMCjE34o5vrZWBYc9wE3aInZ/SYfi6zaYI12d2IJJLO7L/CTCXyG26YjCMHJLxw+rvnQp/uzaeDxDh6qbmZp4h86YTZr16U7rbC3C0bVW48=
Received: from DSZP220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:5:280::15) by
 BN7PPF7B4E3DFF8.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Mon, 16 Mar
 2026 05:26:14 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:280:cafe::d1) by DSZP220CA0001.outlook.office365.com
 (2603:10b6:5:280::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 05:26:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 05:26:13 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Mar
 2026 00:26:09 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Arnd Bergmann <arnd@arndb.de>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, K Prateek Nayak <kprateek.nayak@amd.com>
Subject: [RFC PATCH v2 6/7] asm-generic/runtime-const: Add dummy runtime_const_mask_32()
Date: Mon, 16 Mar 2026 05:24:00 +0000
Message-ID: <20260316052401.18910-7-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260316052401.18910-1-kprateek.nayak@amd.com>
References: <20260316052401.18910-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|BN7PPF7B4E3DFF8:EE_
X-MS-Office365-Filtering-Correlation-Id: 055ff733-061e-43dc-87f6-08de831c8a46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dlLsy3EfZmYgxd3A5ysPKPB6kpfpDkSKuKcbF1qyyYXkUo8Y7euhsBIScIm7tJ7GllO0Adk55tJQRH+Ym1k9NwdNHjvGz+e9Nd2vgXPTZ4/ZHQR6sD1/MspKw13dHw7E5lSu2CC3cpjzMAxw0xZi/BTSlHquksKOg9Gn45D6gVzXKT/KavAQ3GUBH8BotHFTM+07dEcJT/3oQiagS0uxolC7OdmEiVshY8hkaotkCOJAQ6oZk2yajhkZPtG5Kkakid1fqvImB/fno4x27G0746B2TFvcqfAL1+oJWkioP3h2HShoqv75ecvUaP0db0BbAnFWRfDzjo7xgeiDq1HFn1SHJvXUJV4J45F8Zi6czPLnMKmIltTs1AFX1S6gOdR8Iojsm+cbaM6JZWA4xURbL5SIMZEWMqVtW5Rx5dEGQQEbgxjW4dXfP/SCtVwaAzw88yUMpo2Py1LIP4X8mVDJqFYfycmTgpJTCp1ihkplIIRnZ4w+8veb/14RcyuxFJ38k+D5ULOAWekrLUvNCSKPFLLqh+gGoimWb2kwmYECjEKGbrQUbN345XrW6KfWDF/T/J8O3vRuBvSLcAwAS0Po0loJ955H/dSryREln/C/1g5slT4IlUazDmv9oYwLE0zUDmwdxrGpa6RAG+wBuv19FB7FDIIhHXEVdqgfDfPpzJJffNfph+qyQ2uBYHPyjSq6aackTpoI4SIRK8eQEYcx17MHZi09tokdQ7UB2fxbo7k=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(13003099007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zpXiLPCRms0/32x6ItmrB8tkAMRblQWSCkdfULfgVYVBCab9Rq7WKD8mJ4dnvDjWjzYrxamgZXmUXPWe9xHeyl2WzvaJEZK7YXINzMpVdR7S8B1VP1RGoCGDa/IyYlZ4drUWhco1LKBoxqj52LLY1ExfdtQ/uKRRXtyZ4cjPYMRgcSXnrBi8rJoZ8NeaecCR11+YWo4vqkzb90JheKMpg2bcL5jPtUFDTE66i2aMqQAL5/fWxaYX9u3JaCv9EPyUDs2wZiBm+/X6twGSdj13knETY4I563sBppd/SkjlwCoEt2qooxRgRfqJacEQOqpuDSBeKJx/DBR/4rF+NfwW3/HK+Yvx3FVFSmXghWHPidwAA5dCevv/PpdmPAUzOou4Pp96rX6XCg5/Z9+1qzlha9TJmG2/nVi/rYI++PNn2PFlosuiKOOmNykA/k1GdCiD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 05:26:13.4658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 055ff733-061e-43dc-87f6-08de831c8a46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF7B4E3DFF8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_222619_695913_28075788 
X-CRM114-Status: UNSURE (   9.80  )
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

From: Peter Zijlstra <peterz@infradead.org>

Add a dummy runtime_const_mask_32() for all the architectures that do
not support runtime-const.

Link: https://patch.msgid.link/20260227161841.GH606826@noisy.programming.kicks-ass.net
Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 include/asm-generic/runtime-const.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/asm-generic/runtime-const.h b/include/asm-generic/runtime-const.h
index 670499459514..03e6e3e02401 100644
--- a/include/asm-generic/runtime-const.h
+++ b/include/asm-generic/runtime-const.h
@@ -10,6 +10,7 @@
  */
 #define runtime_const_ptr(sym) (sym)
 #define runtime_const_shift_right_32(val, sym) ((u32)(val)>>(sym))
+#define runtime_const_mask_32(val, sym) ((u32)(val)&(sym))
 #define runtime_const_init(type,sym) do { } while (0)
 
 #endif
-- 
2.43.0


