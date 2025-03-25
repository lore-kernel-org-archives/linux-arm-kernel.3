Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4584AC35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 15:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IshwmIwF07+l4Q/ODrJJHd8a6G1zJziP0QCKvZ5VUzE=; b=CgrBnBntLHX2FnJlQL4JWwk+dy
	nE0G65y1fQ9pYZneprQD29xKve3Kos0gnqo2h0wusqKV5rMih5Jrsz79d9Oxkcz4a9fU+Qt18J6pB
	W1+Fvbdy24tAE8MWqccb4jKp0ly4rB2j6aUMOr2gbkuaUwEz34rrCZjJk5x5IcHeajadMEgSCg5+u
	R571uPOJQhZEWx/2ek4TZ+7ejYrmiyEYRCA77MnXmNIx44l/+ag/gfq5V0Gs9B+bKmMEuB0+hEysi
	Ts/26ZEhfaCJ6vSFvt7oGwS+ns7nIC36/yWSdyUF6SZ3PmJPY3scchvJfkO6A0bqbQ1sZP3W17jig
	aRClqf1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx67v-00000006K92-1Qlz;
	Tue, 25 Mar 2025 15:23:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx57r-00000006BHL-0RIq
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 14:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=IshwmIwF07+l4Q/ODrJJHd8a6G1zJziP0QCKvZ5VUzE=; b=fhMcJ/Y1bSMlRDrlV1kVQfQtVp
	YQIlPNjlD01HohUi9DGhwv2RgCaUJimtWKjb94qUCpjl1G/f5erd9qfJnS3HKvD5ouSL+m0cuHyaX
	0FKLGEgtdtpZZZ/5AFksoHhtUhXUfEl8CZnFFIoeZn6gBhG1zkLt84QQJCXziyTIT2jW8qJ6Ij5UH
	1UJTkhNHsEE3f3sqG/PBHapJ+jyw83/HgrGcfbjx5mmpn/bo+xd8Jz+1jdXxfkvKz41wMRbGcuk54
	osqbaJfN+CnkCVKxGmYYXj40taXnYVmZAuhQOXHhaD9eaATmuL44k1vJ+EwgRKbAlWU/R2NpdDRby
	Nw17+ydw==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx57n-00000005VF3-1eck
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 14:19:29 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4ZMX3m4lHjz1jBLl;
	Tue, 25 Mar 2025 22:14:28 +0800 (CST)
Received: from kwepemg100001.china.huawei.com (unknown [7.202.181.18])
	by mail.maildlp.com (Postfix) with ESMTPS id C7E2F1800B1;
	Tue, 25 Mar 2025 22:19:06 +0800 (CST)
Received: from huawei.com (10.50.165.33) by kwepemg100001.china.huawei.com
 (7.202.181.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 25 Mar
 2025 22:19:06 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oliver.upton@linux.dev>, <maz@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangzhou1@hisilicon.com>, <shameerali.kolothum.thodi@huawei.com>,
	<liuyonglong@huawei.com>, <jiangkunkun@huawei.com>,
	<yangjinqian1@huawei.comm>, <xueshan2@huawei.com>, Jinqian Yang
	<yangjinqian1@huawei.com>
Subject: [PATCH] arm64: Add support for HIP09 Spectre-BHB mitigation
Date: Tue, 25 Mar 2025 22:19:00 +0800
Message-ID: <20250325141900.2057314-1-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemg100001.china.huawei.com (7.202.181.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_141927_982952_355D3D15 
X-CRM114-Status: GOOD (  10.15  )
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

The HIP09 processor is vulnerable to the Spectre-BHB (Branch History
Buffer) attack, which can be exploited to leak information through
branch prediction side channels. This commit adds the MIDR of HIP09
to the list for software mitigation.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 arch/arm64/kernel/proton-pack.c  | 1 +
 2 files changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 6f3f4142e214..363a9cbe780e 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -130,6 +130,7 @@
 #define FUJITSU_CPU_PART_A64FX		0x001
 
 #define HISI_CPU_PART_TSV110		0xD01
+#define HISI_CPU_PART_HIP09			0xD02
 
 #define APPLE_CPU_PART_M1_ICESTORM	0x022
 #define APPLE_CPU_PART_M1_FIRESTORM	0x023
@@ -204,6 +205,7 @@
 #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
 #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
 #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
+#define MIDR_HISI_HIP09 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP09)
 #define MIDR_APPLE_M1_ICESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM)
 #define MIDR_APPLE_M1_FIRESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_FIRESTORM)
 #define MIDR_APPLE_M1_ICESTORM_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM_PRO)
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index da53722f95d4..98bb7251a184 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -866,6 +866,7 @@ u8 spectre_bhb_loop_affected(int scope)
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_A76),
 			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
 			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
+			MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
 			{},
 		};
 		static const struct midr_range spectre_bhb_k11_list[] = {
-- 
2.33.0


