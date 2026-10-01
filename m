Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02574CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0pkPKiJN12I1LE/+e+N6FJ1mkuEvlRRqBWAp2O2soA=; b=Q4K3ESGzjy5kSKwtu9Kvxu6wv/
	zxb95VN4vO8o1N8FbEjkxq7bV+EJTTseWKt2kMQD83xC0RmqROYSjkFN9lIuiwdpqtIVn35Q0OJ9/
	y8NsTktZIWz8RONHmGv3hagee43yzfqrKEKGS0UO32qEr9X7q5mLcnR0YM5EOeszZopyO36InfzlL
	ppjDJnDJ1gLglCYOb6vklpNr17YpySt85HqGhnAnZQAH15AH6cumlx9QE0dJF9K/ZtnFKS3sOC+fi
	DrYvSLrt3oYmbOn+fXbJ7t7Awb4dGVTlYXb6uiNktMxaSmzfaefIRsMMwxVjJDrvatfvFtZ0nSYQO
	rvFt7SgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEdS-00000008b3A-31yN;
	Thu, 01 Oct 2026 11:07:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEdP-00000008b1y-3wZU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:07:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1F9A143D;
	Thu,  1 Oct 2026 04:07:27 -0700 (PDT)
Received: from e142392.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A10E3F86F;
	Thu,  1 Oct 2026 04:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790852851; bh=P874H+3XkUEaweVPu/iQHLVGgjAmR/t8sk5vWLaLPcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hDS5rr6xo5dWjVucyKuR1kbNKuS3sPmvO2ii+vs3ySrPoVo4AoZ1xJbPsPEKS1njQ
	 to2XyMiWh6B6drsjVX3CNZG13/+EIOwQ9s0ei5+QvcXUtZKoWjOd2MBQuuGwNn65Ye
	 NTZI1xAxXYGbyoaKd2EefCzxGRV41/1xCQO/wdL4=
From: =?UTF-8?q?Kristina=20Mart=C5=A1enko?= <kristina.martsenko@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-efi@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: [RFC 01/12] arm64: sysreg: Add definitions for FEAT_TLBID
Date: Thu,  1 Oct 2026 12:06:44 +0100
Message-ID: <20261001110655.461473-2-kristina.martsenko@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001110655.461473-1-kristina.martsenko@arm.com>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_040732_078294_DCB20155 
X-CRM114-Status: UNSURE (   8.89  )
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

Describe new system registers and fields added by FEAT_TLBID, so that
later patches can use them. This is based on the latest system register
specifications (version 2026-09, see Link).

The size and number of fields in VTLBID* registers is determined by
information in other registers at runtime, so can't be described
statically here.

Link: https://support.arm.com/architectures/a-profile-architecture#Downloads
Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
---
 arch/arm64/tools/sysreg | 53 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index e2d37ee221b8..b134418ff3aa 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4331,7 +4331,9 @@ Field	0	nPMECR_EL1
 EndSysreg
 
 Sysreg	HFGRTR2_EL2	3	4	3	1	2
-Res0	63:15
+Res0	63:31
+Field	30	nTLBIDIDR_EL1
+Res0	29:15
 Field	14	nACTLRALIAS_EL1
 Field	13	nACTLRMASK_EL1
 Field	12	nTCR2ALIAS_EL1
@@ -4551,14 +4553,16 @@ Fields	ZCR_ELx
 EndSysreg
 
 Sysreg	HCRX_EL2	3	4	1	2	2
-Res0	63:35
+Res0	63:37
+Field	36	FNB
+Field	35	VTLBIDOSEn
 Field	34	NVnTTLBOS
 Field	33	NVnTTLBIS
 Field	32	NVnTTLB
 Res0	31:28
 Field	27	NVTGE
 Field	26	SRMASKEn
-Res0	25
+Field	25	VTLBIDEn
 Field	24	PACMEn
 Field	23	EnFPM
 Field	22	GCSEn
@@ -4708,6 +4712,38 @@ Res0	25:19
 Field	18:0	INDEX
 EndSysreg
 
+Sysreg	VTLBID0_EL2	3	4	2	8	0
+Field	63:0	TD
+EndSysreg
+
+Sysreg	VTLBID1_EL2	3	4	2	8	1
+Field	63:0	TD
+EndSysreg
+
+Sysreg	VTLBID2_EL2	3	4	2	8	2
+Field	63:0	TD
+EndSysreg
+
+Sysreg	VTLBID3_EL2	3	4	2	8	3
+Field	63:0	TD
+EndSysreg
+
+Sysreg	VTLBIDOS0_EL2	3	4	2	9	0
+Field	63:0	TD
+EndSysreg
+
+Sysreg	VTLBIDOS1_EL2	3	4	2	9	1
+Field	63:0	TD
+EndSysreg
+
+Sysreg	VTLBIDOS2_EL2	3	4	2	9	2
+Field	63:0	TD
+EndSysreg
+
+Sysreg	VTLBIDOS3_EL2	3	4	2	9	3
+Field	63:0	TD
+EndSysreg
+
 Sysreg	DACR32_EL2	3	4	3	0	0
 Res0	63:32
 Field	31:30	D15
@@ -5755,6 +5791,17 @@ Res0	16
 Field	15:0	PARTID_MAX
 EndSysreg
 
+Sysreg	TLBIDIDR_EL1	3	0	10	4	6
+Res0	63:45
+Field	44:40	NVOS
+Res0	39:37
+Field	36:32	NOS
+Res0	31:13
+Field	12:8	NVIS
+Res0	7:5
+Field	4:0	NIS
+EndSysreg
+
 Sysreg	LORID_EL1	3	0	10	4	7
 Res0	63:24
 Field	23:16	LD
-- 
2.43.0


