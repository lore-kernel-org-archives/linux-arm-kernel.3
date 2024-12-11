Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9638E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 18:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMMJJTgBNr0rnMkGW5h5V5BgRlsO/R1XwPfjwEl0+fk=; b=gO7Rl34s4M47Bbq+5OPz2Zo1kD
	U1+sMH+T7H2J6Scj6UfCL6vUtYoifv8RRQTiSMwxFvljvxLNgs+k0r1mwZZGW5fSTegxIzo0yfZ6U
	VmDex+BCfINDmwvzmoxj+ZjJd4Yzi0h2ExN4e9VTdyvhS0baf7dLzu8UxnqTSp4mZ4tdiATjL/hZi
	sOu2SD0DmA1/yOVX4imlI4VtLzIejx4eHIIjDxT1yiGOeD3IkmLo9ZR4WT7iGuQTvs+CQBViKvrbN
	Y1b6o5nBalCMpHvKFd00GO3GLFkcARiakxTOPtMPJu09wUaUD/AZdVXnSy7n227ftqlcFdjvX/FVF
	Srk9k9hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLRsN-0000000FnPC-30HF;
	Wed, 11 Dec 2024 18:55:59 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLRoH-0000000Flyk-2S0I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 18:51:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 85A64A4083C;
	Wed, 11 Dec 2024 18:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B54C4CED2;
	Wed, 11 Dec 2024 18:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733943104;
	bh=Q8NU/o+9jYTC9l0pFFRpT4IbDpPxD0RNgZFIK8z6V8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qqWAQq30T4UVCiDAWf7YvHrQJ9frLO9a1Fg87J/j1D8k6KH+CXAF6wn05RkBhRcMY
	 jDXmFAHaYm7IaKvCkZN6/zf4kB+ZHiy/QTYLyvrbdD4bWleTanXz3KSWOPbtQkP3cG
	 Vo0yb8rps2+f3hzpw/AxHH0Cim2TlW5XUukTxyQLrEz3hKSmBzlKn7M7NeKi1PG8Xv
	 SlrDSG6Wfc8zkhi0JbcuIaUhpZwBwXVuBT+G6A/3u22l+dGqQvRmihTARpXpLB+9Ux
	 0HmXE0conMktH1IWPaD9nisuYWmi8ANJ65TdAl+eYNcSa3B53nRCP4BMQ1T0+MbEVN
	 casIJpH8VjLgw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Qinxin Xia <xiaqinxin@huawei.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	will@kernel.org,
	corbet@lwn.net,
	lpieralisi@kernel.org,
	sudeep.holla@arm.com,
	rafael@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 30/36] ACPI/IORT: Add PMCG platform information for HiSilicon HIP09A
Date: Wed, 11 Dec 2024 13:49:46 -0500
Message-ID: <20241211185028.3841047-30-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211185028.3841047-1-sashal@kernel.org>
References: <20241211185028.3841047-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.4
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_105145_755841_1FE7677B 
X-CRM114-Status: GOOD (  10.94  )
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

From: Qinxin Xia <xiaqinxin@huawei.com>

[ Upstream commit c2b46ae022704a2d845e59461fa24431ad627022 ]

HiSilicon HIP09A platforms using the same SMMU PMCG with HIP09
and thus suffers the same erratum. List them in the PMCG platform
information list without introducing a new SMMU PMCG Model.

Update the silicon-errata.rst as well.

Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>
Acked-by: Hanjun Guo <guohanjun@huawei.com>
Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
Link: https://lore.kernel.org/r/20241205013331.1484017-1-xiaqinxin@huawei.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/arch/arm64/silicon-errata.rst | 5 +++--
 drivers/acpi/arm64/iort.c                   | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 65bfab1b18614..a678ea0ae4a00 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -255,8 +255,9 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Hisilicon      | Hip08 SMMU PMCG | #162001800      | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
-| Hisilicon      | Hip{08,09,10,10C| #162001900      | N/A                         |
-|                | ,11} SMMU PMCG  |                 |                             |
+| Hisilicon      | Hip{08,09,09A,10| #162001900      | N/A                         |
+|                | ,10C,11}        |                 |                             |
+|                | SMMU PMCG       |                 |                             |
 +----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo/Falkor v1  | E1003           | QCOM_FALKOR_ERRATUM_1003    |
diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 4c745a26226b2..bf3be532e0895 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -1703,6 +1703,8 @@ static struct acpi_platform_list pmcg_plat_info[] __initdata = {
 	/* HiSilicon Hip09 Platform */
 	{"HISI  ", "HIP09   ", 0, ACPI_SIG_IORT, greater_than_or_equal,
 	 "Erratum #162001900", IORT_SMMU_V3_PMCG_HISI_HIP09},
+	{"HISI  ", "HIP09A  ", 0, ACPI_SIG_IORT, greater_than_or_equal,
+	 "Erratum #162001900", IORT_SMMU_V3_PMCG_HISI_HIP09},
 	/* HiSilicon Hip10/11 Platform uses the same SMMU IP with Hip09 */
 	{"HISI  ", "HIP10   ", 0, ACPI_SIG_IORT, greater_than_or_equal,
 	 "Erratum #162001900", IORT_SMMU_V3_PMCG_HISI_HIP09},
-- 
2.43.0


