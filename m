Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D28CA5FAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QD12wy70TSq/tTZOlQTiNE7N6Wmf5bjie5E1X0Lng3g=; b=eP2P7Yur9jsl3NlvEfWK6prJXk
	5YKicBqW4F7RqCZIZdj6UR9cKwwnVdyzf3ryZzeC8jzqtTn6BlvZDbZThaSW1kRnZhVJiu9dFooDk
	0EgGfzPWTAB3zZdLya5bvDBpsEBg5IegsG390OLUnHFCfyr9ftUyGoC5f3hJUm+0Gab2rURtBMzih
	1h13bZInCIIJdYgA3p/sdZs6znsK0ZBdJSHrlalDnm2OgGDJNZN6t98SEgvEali8pfjepsugbEjW3
	tB0mgtmUxGr8h5I1nXfOFo/PXSqezPNcNsZHQHkvxOPfLKnaq3z+WMbx8yK/eyX8ij6Au98SZEx1B
	si10lIXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVDo-00000003H4n-0wVv;
	Tue, 29 Sep 2026 10:38:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVDI-00000003GoS-2xhW
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QD12wy70TSq/tTZOlQTiNE7N6Wmf5bjie5E1X0Lng3g=; b=M2BBqWqz2N85oR7v/6BNzExRQp
	1on4u/2eUDc6zIz+eh+dP5AvvTjtjO66QhkxyqhiNam79e76eu13ltB7huAty375bztOqEfxvwT0h
	G88gFCEO8nWYXpxjoF/wbmJ7p9MgX7hlL8KTuExKENGKFVihbHr3nBEVEiL1ZsLcnx3YjqdUlBc8z
	MHaUNsk8Om7MhdyMUj8c2S/xpf10rLONFgBoBgMABxGKSunl3p+WIqkn76YtytNzioevvwnlzrG7m
	kMX9x9TeD3b4H1FmpUnLRoE3e6xxKNjmtOJ8HJ3v0walImdfSHZttURjlgmvmiuDJHYX5MzS2iGOX
	+8I5ANbw==;
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBVD2-00000002VFy-2EXH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:37:28 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=QD12wy70TSq/tTZOlQTiNE7N6Wmf5bjie5E1X0Lng3g=;
	b=HvLJpW9Cosxcsx/1j+ZjQo0fHaeFOExk2G1PwxmWEeqad9RWHDo8pB3EejDa9fDLm2fWh9WMD
	dAH7tCRk/A4zNr96l+JQ6aSChhQryazK01Pojqvj6zpepgs8ATJUlTgZCfPWD395gWS1YG5meow
	HrO/qz73uwssvQQgW+36Qh0=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hvDpq1cL3z1cyS4;
	Tue, 29 Sep 2026 18:25:55 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 4CA904048B;
	Tue, 29 Sep 2026 18:37:01 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr100010.china.huawei.com
 (7.202.195.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 18:37:00 +0800
From: Tian Zheng <zhengtian10@huawei.com>
To: <maz@kernel.org>, <oupton@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <corbet@lwn.net>, <pbonzini@redhat.com>,
	<zhengtian10@huawei.com>, <leo.bras@arm.com>
CC: <yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>,
	<yangjinqian1@huawei.com>, <caijian11@h-partners.com>,
	<liuyonglong@huawei.com>, <tangchengchang@huawei.com>,
	<yezhenyu2@huawei.com>, <yubihong@huawei.com>, <linuxarm@huawei.com>,
	<joey.gouly@arm.com>, <kvmarm@lists.linux.dev>, <kvm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<seiden@linux.ibm.com>, <suzuki.poulose@arm.com>, <fuad.tabba@linux.dev>,
	<mark.rutland@arm.com>, <seanjc@google.com>, <rdunlap@infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<skhan@linuxfoundation.org>
Subject: [PATCH v5 06/15] KVM: arm64: Add support for FEAT_HDBSS
Date: Tue, 29 Sep 2026 18:36:46 +0800
Message-ID: <20260929103655.85107-7-zhengtian10@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260929103655.85107-1-zhengtian10@huawei.com>
References: <20260929103655.85107-1-zhengtian10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_113717_254187_71F2A5E5 
X-CRM114-Status: GOOD (  13.58  )
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

Armv9.5 introduces the Hardware dirty state tracking structure
(HDBSS), indicated by ID_AA64MMFR1_EL1.HAFDBS == 0b0100.

Add CPU capability detection for HDBSS. The capability is restricted
to VHE systems, as the buffer registers HDBSSBR_EL2 and HDBSSPROD_EL2
are EL2-only and are programmed directly from host context. A
system_supports_hdbss() helper is provided for the rest of the series.

Suggested-by: Zhou Wang <wangzhou1@hisilicon.com>
Co-developed-by: Eillon <yezhenyu2@huawei.com>
Signed-off-by: Eillon <yezhenyu2@huawei.com>
Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
---
 arch/arm64/include/asm/cpufeature.h |  5 +++++
 arch/arm64/kernel/cpufeature.c      | 12 ++++++++++++
 arch/arm64/tools/cpucaps            |  1 +
 3 files changed, 18 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 4f04ad82ea34..0592e6f6b4d7 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -856,6 +856,11 @@ static inline bool system_supports_haft(void)
 	return cpus_have_final_cap(ARM64_HAFT);
 }

+static inline bool system_supports_hdbss(void)
+{
+	return cpus_have_final_cap(ARM64_HAS_HDBSS);
+}
+
 static __always_inline bool system_supports_mpam(void)
 {
 	return alternative_has_cap_unlikely(ARM64_MPAM);
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 32102c3912fa..12fa37328dd2 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2158,6 +2158,11 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
 	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
 }

+static bool has_vhe_hdbss(const struct arm64_cpu_capabilities *entry, int scope)
+{
+	return is_kernel_in_hyp_mode() && has_cpuid_feature(entry, scope);
+}
+
 bool cpu_supports_bbml3(void)
 {
 	/* CPUs that support BBML3 but dont advertise through ID_AA64MMFR2_EL1 */
@@ -2816,6 +2821,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, HAFT)
 	},
 #endif
+	{
+		.desc = "Hardware dirty state tracking structure (HDBSS)",
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.capability = ARM64_HAS_HDBSS,
+		.matches = has_vhe_hdbss,
+		ARM64_CPUID_FIELDS(ID_AA64MMFR1_EL1, HAFDBS, HDBSS)
+	},
 	{
 		.desc = "CRC32 instructions",
 		.capability = ARM64_HAS_CRC32,
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 2775ba3359cf..8acb3db980c9 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -71,6 +71,7 @@ HAS_VA52
 HAS_VIRT_HOST_EXTN
 HAS_WFXT
 HAS_XNX
+HAS_HDBSS
 HAFT
 HW_DBM
 KVM_HVHE
--
2.43.0


