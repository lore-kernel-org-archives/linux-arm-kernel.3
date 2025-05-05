Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F948C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 03:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6yQt167sO8Ok8qapi34yB5gtYTFbbFGYdb4c5srVvo=; b=22tL/ehFC0rIIXyJCfUB9H3ic/
	WdgTL8/njTIpwZcoBepQHwvp757DWC+t9epyLF2UTW8sptM1QRBifavI60QOVqswKe2Q4XN/EoEua
	ALg4Wl1LFwVRWuyOoBGFyo8mcUQR9jC+ZhTbYR1syThetngAtEAJGYb5sjGiyXVyel0SX9FwWCGsw
	0jqQ1gto6qFkEkZFvrilXybl1AYij4cXQyaKEFQ4QKFTMbdnx0oN+qK3tLs0YPscBSsh82w54AZtu
	YCuytSiqP8KlAQhCX8U88Z7wDvgwgO8XB/EKAyIJVp7UQZ/UlAU4dZR8z5S5HDkrZe/f3iXP+qIMK
	uXw2MFdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC8yG-00000009zRD-27to;
	Tue, 06 May 2025 03:27:52 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4tY-00000008xQ3-1YLW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 23:06:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14556A4C35A;
	Mon,  5 May 2025 23:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D19C4CEEE;
	Mon,  5 May 2025 23:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486403;
	bh=ZkZQ/9nwclQTR3scMqCLO0o62FBh8uAOVK6Lf/oEBc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H+oMuNKH5nvY958d2IAIfjHseQ+GuPYXsez0Rcaa/Gnxmgs8vS3bVKuvegmTAcOWu
	 bQ0faIG1gpyn1BjI24p00/Q+iAdzt17PTj77wAU0/2ldbpKLGEWWxWXpaU4KHdiBVQ
	 VwVicKIs4uQs5nkmyGoW0KMbHp042zhVUUUebBnbPpiiusqKrv+VD1c3N9bWEIm/yW
	 E25n2ltmzIng21OYVmR2S59bMHFTdvzr62ymQ7SwR9y4j+vJDjxo+QQMtjGLJ18h0U
	 /UES939eAsUPqFe4+LQUZNeIlRpeLb0pzPLpl8p2hnrU6eCB6ZpH3fe7YGEuv3bjo+
	 /WBKEwBIzCCgA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jinqian Yang <yangjinqian1@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	will@kernel.org,
	mark.rutland@arm.com,
	oliver.upton@linux.dev,
	shameerali.kolothum.thodi@huawei.com,
	dianders@chromium.org,
	maz@kernel.org,
	scott@os.amperecomputing.com,
	quic_tsoni@quicinc.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 010/212] arm64: Add support for HIP09 Spectre-BHB mitigation
Date: Mon,  5 May 2025 19:03:02 -0400
Message-Id: <20250505230624.2692522-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505230624.2692522-1-sashal@kernel.org>
References: <20250505230624.2692522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.136
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_160644_535786_BE926A94 
X-CRM114-Status: GOOD (  10.52  )
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

From: Jinqian Yang <yangjinqian1@huawei.com>

[ Upstream commit e18c09b204e81702ea63b9f1a81ab003b72e3174 ]

The HIP09 processor is vulnerable to the Spectre-BHB (Branch History
Buffer) attack, which can be exploited to leak information through
branch prediction side channels. This commit adds the MIDR of HIP09
to the list for software mitigation.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
Link: https://lore.kernel.org/r/20250325141900.2057314-1-yangjinqian1@huawei.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/include/asm/cputype.h | 2 ++
 arch/arm64/kernel/proton-pack.c  | 1 +
 2 files changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index cdb024dd33f5c..99c73f835731c 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -131,6 +131,7 @@
 #define FUJITSU_CPU_PART_A64FX		0x001
 
 #define HISI_CPU_PART_TSV110		0xD01
+#define HISI_CPU_PART_HIP09			0xD02
 
 #define APPLE_CPU_PART_M1_ICESTORM	0x022
 #define APPLE_CPU_PART_M1_FIRESTORM	0x023
@@ -199,6 +200,7 @@
 #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
 #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
 #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
+#define MIDR_HISI_HIP09 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_HIP09)
 #define MIDR_APPLE_M1_ICESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM)
 #define MIDR_APPLE_M1_FIRESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_FIRESTORM)
 #define MIDR_APPLE_M1_ICESTORM_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM_PRO)
diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 93a00cd42eddb..54b0364a4e2b0 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -913,6 +913,7 @@ static u8 spectre_bhb_loop_affected(void)
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
 		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
 		MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
+		MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
 		{},
 	};
 	static const struct midr_range spectre_bhb_k11_list[] = {
-- 
2.39.5


