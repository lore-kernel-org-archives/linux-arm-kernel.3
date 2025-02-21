Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD121C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 14:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6JfY0tl97s6ZvTlsmZ36UEd9c1rEvIXHhyNOk4cqeY=; b=eioiUNYAfJ5AoxHjst2COi+o7D
	UetV7CHxkwXsnhOp5L0fXS8Ccqrnn4VAGzSP27cqPwYQnb43YzZuFiBjGGeWCup6i3sL3+TwOykeV
	1hTOKYzxJ6JVBXacVlRjThBqWsTtGxv11Det4RHx5bZFTA2jyXKYy6uYuAeuvzsQBLLh6ePgbOgDg
	jLjRvuOp+W6YK603JDw6MU9N5a2hmEhTom4tHnCp+hRPTKqqs9TdsrwY2OgKzZPNvEPHvBPfyeNSp
	kL3atPUJJW8EddVrG9nxyzGzGgcVQy47jDtV0j4HcthHyaKz0DeBcOEOrBa7bxm9o8LtjmVpyjmDx
	2YQT18hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTvp-00000005oEp-1olk;
	Fri, 21 Feb 2025 14:23:09 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlTin-00000005lJE-2MQz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 14:09:42 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YzsPw6zzCz6L72m;
	Fri, 21 Feb 2025 22:07:00 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1E899140C72;
	Fri, 21 Feb 2025 22:09:40 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Feb 2025 15:09:32 +0100
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <kvmarm@lists.linux.dev>, <maz@kernel.org>, <oliver.upton@linux.dev>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<cohuck@redhat.com>, <eric.auger@redhat.com>, <sebott@redhat.com>,
	<yuzenghui@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
	<jonathan.cameron@huawei.com>, <anthony.jebson@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>
Subject: [PATCH v8 4/6] =?UTF-8?q?arm64:=20Make=20=C2=A0=5Fmidr=5Fin=5Fran?= =?UTF-8?q?ge=5Flist()=20an=20exported=20function?=
Date: Fri, 21 Feb 2025 14:02:27 +0000
Message-ID: <20250221140229.12588-5-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250221140229.12588-1-shameerali.kolothum.thodi@huawei.com>
References: <20250221140229.12588-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_060941_881612_DF968DA1 
X-CRM114-Status: UNSURE (   8.37  )
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

Subsequent patch will add target implementation CPU support and that
will require _midr_in_range_list() to access new data. To avoid
exporting the data make _midr_in_range_list() a normal function and
export it.

No functional changes intended.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 arch/arm64/include/asm/cputype.h | 15 +--------------
 arch/arm64/kernel/cpu_errata.c   | 15 +++++++++++++++
 arch/arm64/kernel/image-vars.h   |  1 +
 3 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 2a76f0e30006..ccb4a155d118 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -276,20 +276,7 @@ static inline bool midr_is_cpu_model_range(u32 midr, u32 model, u32 rv_min,
 	return _model == model && rv >= rv_min && rv <= rv_max;
 }
 
-static inline bool is_midr_in_range(struct midr_range const *range)
-{
-	return midr_is_cpu_model_range(read_cpuid_id(), range->model,
-				       range->rv_min, range->rv_max);
-}
-
-static inline bool
-is_midr_in_range_list(struct midr_range const *ranges)
-{
-	while (ranges->model)
-		if (is_midr_in_range(ranges++))
-			return true;
-	return false;
-}
+bool is_midr_in_range_list(struct midr_range const *ranges);
 
 static inline u64 __attribute_const__ read_cpuid_mpidr(void)
 {
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 99b55893fc4e..1f51cf6378c5 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -14,6 +14,21 @@
 #include <asm/kvm_asm.h>
 #include <asm/smp_plat.h>
 
+static inline bool is_midr_in_range(struct midr_range const *range)
+{
+	return midr_is_cpu_model_range(read_cpuid_id(), range->model,
+				       range->rv_min, range->rv_max);
+}
+
+bool is_midr_in_range_list(struct midr_range const *ranges)
+{
+	while (ranges->model)
+		if (is_midr_in_range(ranges++))
+			return true;
+	return false;
+}
+EXPORT_SYMBOL_GPL(is_midr_in_range_list);
+
 static bool __maybe_unused
 __is_affected_midr_range(const struct arm64_cpu_capabilities *entry,
 			 u32 midr, u32 revidr)
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index ef3a69cc398e..de3d081e5a57 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -49,6 +49,7 @@ PROVIDE(__pi_arm64_sw_feature_override	= arm64_sw_feature_override);
 PROVIDE(__pi_arm64_use_ng_mappings	= arm64_use_ng_mappings);
 #ifdef CONFIG_CAVIUM_ERRATUM_27456
 PROVIDE(__pi_cavium_erratum_27456_cpus	= cavium_erratum_27456_cpus);
+PROVIDE(__pi_is_midr_in_range_list	= is_midr_in_range_list);
 #endif
 PROVIDE(__pi__ctype			= _ctype);
 PROVIDE(__pi_memstart_offset_seed	= memstart_offset_seed);
-- 
2.47.0


