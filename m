Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32DECA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 08:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iAQrbCqZZ4sOxWZdD0ZcXvxkxM3DekbLizKEk5JXiYI=; b=h9Prs7lXWk54NshljxzUL48OCO
	WjHyatUpI6DSykx3sCRvI70Vr1dQbI4Q1WGq79fJ7wKryN9Ka+Kb2ju2tA6CNbWDGtmwNHHKxzygq
	0RHGla2AwsuFk4VhGZVDX1btBL3G3tIMyG9Tuw+HpsrY3WhEri6RgazDdzrXcIoVomartGSPwx80E
	zNPQqDQrG83zwv5K0ZmFD/2BS9Y5o7gWodlwjwsWqR+xbnFVO73fmERKQnUbk+mHHimuDOyo/mycj
	H9jbDfkObpwV0TloJpOAUtoMxicmS1sA+OQjwEo986vQ14ctDj3OdRYAtUBBOgY0o6CKA/FbScpLQ
	Od7ijv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwz8c-00000007vMP-1DLs;
	Fri, 12 Sep 2025 08:28:10 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwz8Y-00000007vAX-3Xh7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 08:28:08 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757665671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iAQrbCqZZ4sOxWZdD0ZcXvxkxM3DekbLizKEk5JXiYI=;
	b=kDlamB2DmhQj2fTmsOmZiyKAroCsKWkXguZcNfTcNVtkG1bOz8NDZcVCf2adk4w6V4LPeR
	j6LjxuUCyJT2gCgG2RXhbV3aBg0/oeSKoo3tl0EB4Srxpgh3mVIWnr/kM8bC2uZsWeHNUj
	gjF97lNGZ34GseD0JoxAiDitli856yE=
From: Itaru Kitayama <itaru.kitayama@linux.dev>
Date: Fri, 12 Sep 2025 17:27:40 +0900
Subject: [PATCH] PMCR_EL0.N is RAZ/WI. At least a build failes in Ubuntu
 22.04 LTS. Remove the set function.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-selftest-fix3-v1-1-256710a5ae5b@linux.dev>
X-B4-Tracking: v=1; b=H4sIAHvZw2gC/x2M0QpAQBAAf+XaZ1usdMevyIPYY0vo9pKSf7d5n
 KmZB5STsELnHkh8icqxG1SFg2kd94VRZmOgkpqyrQiVt5hZM0a5ayQfKTTs2zkQWHMmNv//+uF
 9P1b0CzVfAAAA
X-Change-ID: 20250912-selftest-fix3-27f285e79d82
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_012807_618627_7C2A85F9 
X-CRM114-Status: UNSURE (   8.45  )
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

Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
---
Seen a build failure with old Ubuntu 22.04 LTS, while the latest release
has no build issue, a write to the bit fields is RAZ/WI, remove the
function.
---
 tools/testing/selftests/kvm/arm64/vpmu_counter_access.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index f16b3b27e32ed7ca57481f27d689d47783aa0345..56214a4430be90b3e1d840f2719b22dd44f0b49b 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -45,11 +45,6 @@ static uint64_t get_pmcr_n(uint64_t pmcr)
 	return FIELD_GET(ARMV8_PMU_PMCR_N, pmcr);
 }
 
-static void set_pmcr_n(uint64_t *pmcr, uint64_t pmcr_n)
-{
-	u64p_replace_bits((__u64 *) pmcr, pmcr_n, ARMV8_PMU_PMCR_N);
-}
-
 static uint64_t get_counters_mask(uint64_t n)
 {
 	uint64_t mask = BIT(ARMV8_PMU_CYCLE_IDX);
@@ -490,7 +485,6 @@ static void test_create_vpmu_vm_with_pmcr_n(uint64_t pmcr_n, bool expect_fail)
 	 * Setting a larger value of PMCR.N should not modify the field, and
 	 * return a success.
 	 */
-	set_pmcr_n(&pmcr, pmcr_n);
 	vcpu_set_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0), pmcr);
 	pmcr = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(SYS_PMCR_EL0));
 

---
base-commit: aae5a9834b388860844b294c70c8770dd26e528c
change-id: 20250912-selftest-fix3-27f285e79d82

Best regards,
-- 
Itaru Kitayama <itaru.kitayama@linux.dev>


