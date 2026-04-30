Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08980CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 09:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUr40PlmRY39YGug+XLiTpQBcY0QfG0XM5XIpB5A8lY=; b=X8F6Os1UzjNeciLEotN2Ys+R0q
	s+EHWjjynT33qMfrDOw73MlElDQ7VaaUcmkq2UuMsm7C/R/SOU8wedJGhm3n74Nnq8Dxy6nC+Z8H8
	PS57IJ9rNVKu+c1aMtVq8j/BE6qZiQKxCKrv0GcxvQa1B/T9THJRKJPHAcOIFqK4o9NyPzoCW1+JQ
	gRycJXejo1tQ4OdbcfBzqcgtSRJPLHWiSDWsgsRH8NzxkU+lfUS75Y1QNBSe2NE183ibN8/stBG5x
	iDyGUoFzU0gOT3Iz+IdZYLIzb4bC1tOOIqi851VhL7ZpiQJR2Jf8cBpQUIQGgodySv45VSvgStZ9d
	H2a/FJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIO0X-000000057DV-0OYB;
	Thu, 30 Apr 2026 09:48:33 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIO0T-000000057C8-2Uy7;
	Thu, 30 Apr 2026 09:48:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTx1HoGLJBTvlE9px6bbQK5uSunq+OTGXBSeaRowCuxN6Adw1ilbiaYMo60Ed9hbfGwZZMHymLNFTmkE9SDVYETzcZyMzoof0vSzgFImo9bZLYaB3zVNqODc/5aYkHJAz2SqpeTo2WA4LbJ5z9wwzUJdpDJ298Fnq7wc4zdzgJChAQlulqDGRildPBixakIU3pMz0mcN91ygwwzFnVlMZR+Z6kIO5SBt4raRCgrnHEX2LuApohXgtqPq1Ip1VryJ6XoiCdAQ3L2S2XoJ+td60Gkko4jK+mhWGLLa1yj/NZ7JTfQAusmHcg9YL7OwJAx8fAQzc/PUoufxSIEZwnyc1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUr40PlmRY39YGug+XLiTpQBcY0QfG0XM5XIpB5A8lY=;
 b=qQeITwCjmvVBIp2DZoN44MkZ5MGQCGkTqJtE34ApqTqD1GTJO8N8N402gVznlOIyjdp64m49lUU/Le7ryksHDH/DReR4Kfske//VSh3moMQeFDoA10/vLFQcF+201g32qYEz8EX+deQSYpn01dLPyrDfJ1ENGHurBN4Rp98Anctem8yilqOB9rkAEH6Co7XIRNYU5IrdjSPKjb0RVcufH1ZL6bSAF2t3c5yyXqE03sUxm/rF5RgMIxI5PaeWSq5kWsFp4OlZ3tl8+kUS4niqt2czjwPvfC9g2sqD1FSvr0EUa5bOGNxY8IiHqkWFN4sM0sRjxx/KAOQo5oagq4iNHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUr40PlmRY39YGug+XLiTpQBcY0QfG0XM5XIpB5A8lY=;
 b=wN5QZNjC/TsXKhhoGb3yWPcLgVkQGLATGF56xk/klVYNCBYeyc2hLfr8kYc+GXiuZGAF8MtFeVioeeUfO5frJsffS8efaV7i1ZmnaxEIATTLCtI38WGHfhKwuaQfxrPnPpFhyIjPRbWr+uybLgRpUTniKoHNcjiL41RWAU9fIY0=
Received: from PH8PR07CA0011.namprd07.prod.outlook.com (2603:10b6:510:2cd::19)
 by BY5PR12MB4164.namprd12.prod.outlook.com (2603:10b6:a03:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 09:48:22 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:510:2cd:cafe::18) by PH8PR07CA0011.outlook.office365.com
 (2603:10b6:510:2cd::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 09:48:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 09:48:21 +0000
Received: from BLRKPRNAYAK.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Apr
 2026 04:48:15 -0500
From: K Prateek Nayak <kprateek.nayak@amd.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Peter
 Zijlstra" <peterz@infradead.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>
CC: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	<linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-s390@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, K Prateek Nayak
	<kprateek.nayak@amd.com>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Huth
	<thuth@redhat.com>, Sean Christopherson <seanjc@google.com>
Subject: [PATCH v4 1/8] x86/runtime-const: Introduce runtime_const_mask_32()
Date: Thu, 30 Apr 2026 09:47:23 +0000
Message-ID: <20260430094730.31624-2-kprateek.nayak@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260430094730.31624-1-kprateek.nayak@amd.com>
References: <20260430094730.31624-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|BY5PR12MB4164:EE_
X-MS-Office365-Filtering-Correlation-Id: bb15d2f0-59d5-448e-fdb8-08dea69d9d6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HrI+Qz/UaBQw/cIMYpjOzt9QXh79Pk66Rbmk/Sd2HnnTaf7+8emiyYqhZBEXmeqmmRclHpUFYtojBgJmyoafwAYNCuhhhBSeR5YtAVAZZYc8EE1eR3ViBUx/vld0adY5rdpjLTCPB79+0xAsuZcuHsMb5co4syRf1+YfqBmm+GgFEwCrSKb2DcniJTLzBDH2JxbigXHXRF/C65gO9G7pGZRgcqB7xtZ8pvp5dlbhNmm6M2u5sDL68DGj78W3+MZXRK0soG2yivl8EE9Z1wdadIEo+gtFPKwhpjbj5cmhlb3hm2+cY2cYGz655sQ9i/XMl2B3zqT7ayP2iHPwrV6fUTYxfDDBOIMaY784pZ1DcFf1oibzRwljvcSH1k/B1Lcr7U+7Ax60ydf9vWiZrOeM910MxY5au/ytAb+aVPHZazsXg6q0xWukCEkGEJOYMvH7rBZXAOMVnx9P3v57C9nSRZ7F4mYUFN6ADvYVJZpj/lgCFjNdT6UAi51gdIgj+bpbdm/zXeVkbj1jNFRxbUag+izYHAx1CfoqDLEAYAfJ4G80A6WArN48QA7ymffFJAw0jlSlFjOkJUYRNAj8aMjdsA0HJBXXC1tucdcON7n07zMYOMLpt7+Pu969CVBFWjdqTEO0Yp5BObmAWdq717IrILMdWz1it+FNir3ZDcHBhEGhjANwgsH878/MHNfsMIkv6ixhUpxuQSlcR4deirmwdNoBEBZ5E7Tp5dFWOd+sVIw=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zG1pbYHHtqqPtsI6A0/Ib3m0GKzLF1IKSUloTvflUjZJAT79xytmFQBsseNtLOxfPpVICT0Hkfqc4z3aAJJJOa17jiP/LpEn3SYPC30dYrImo3ctdy0An4tHPPGcaqkT2kro9qU0VCIiTmYlN7l1+/Js2XQxLWiJSHpM3IpDz4mpYUg8IaHfh80WGiM+wegraydX2IP6pr8qrAr/6rLk4MvRMBABhFPY7AKG3eYHndvJ6DFgWkQ1t9ydXmsQtwcFG9JBVyhjbmripLR0/8nQ+IRcXLjhWvr5jUoWhcrJIzQ0WIvl3/JEfnGkJm+IgU3C/EyIhoKHszEq9wneQQEx5Q9wui7fYcFjqKY6SW573qo/JPq+xWX4aG+zjCzXShK331vtOCzTOuTm5hYSWXTsKjR+cgez+Y+SlJeoSW4IBx+deSmzsXlNQobCc87IvUHK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 09:48:21.3886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb15d2f0-59d5-448e-fdb8-08dea69d9d6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_024829_645775_BAD59170 
X-CRM114-Status: GOOD (  10.44  )
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

Futex hash computation requires a mask operation with read-only after
init data that will be converted to a runtime constant in the subsequent
commit.

Introduce runtime_const_mask_32 to further optimize the mask operation
in the futex hash computation hot path.

  [ prateek: Broke off the x86 chunk, commit message. ]

Link: https://patch.msgid.link/20260227161841.GH606826@noisy.programming.kicks-ass.net
Not-yet-signed-off-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
changelog v3..v4:

o No changes.
---
 arch/x86/include/asm/runtime-const.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/x86/include/asm/runtime-const.h b/arch/x86/include/asm/runtime-const.h
index 4cd94fdcb45e2..b13f7036c1c9b 100644
--- a/arch/x86/include/asm/runtime-const.h
+++ b/arch/x86/include/asm/runtime-const.h
@@ -41,6 +41,15 @@
 		:"+r" (__ret));					\
 	__ret; })
 
+#define runtime_const_mask_32(val, sym) ({			\
+	typeof(0u+(val)) __ret = (val);				\
+	asm_inline("and $0x12345678, %k0\n1:\n"				\
+		   ".pushsection runtime_mask_" #sym ",\"a\"\n\t"\
+		   ".long 1b - 4 - .\n"				\
+		   ".popsection"				\
+		   : "+r" (__ret));				\
+	__ret; })
+
 #define runtime_const_init(type, sym) do {		\
 	extern s32 __start_runtime_##type##_##sym[];	\
 	extern s32 __stop_runtime_##type##_##sym[];	\
@@ -65,6 +74,11 @@ static inline void __runtime_fixup_shift(void *where, unsigned long val)
 	*(unsigned char *)where = val;
 }
 
+static inline void __runtime_fixup_mask(void *where, unsigned long val)
+{
+	*(unsigned int *)where = val;
+}
+
 static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
 	unsigned long val, s32 *start, s32 *end)
 {
-- 
2.34.1


