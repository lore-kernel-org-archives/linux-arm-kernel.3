Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB55FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 19:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g87Yc4YJdBAnwCUZKSsKpodpokZkAet25OkUYeeBX+E=; b=0/a6lJj3ve7nO6opTWXguCvpAZ
	2TsJB9CyzaXBWKZTz5Un04AeOptw/Do9Jg737Ly2JWA36eecGp8VyUWss07bRuwHZl7tCisbQNm/O
	41DaR1NsxmQWmIZ2DeKNdh0A9EQ5caAB4cvq0tXvaq4H+4vZYewHF3jXsLS9eYoK2pxrcpvRnGZH6
	Twiv8S7nvvua5ts9wHY3rM6Jg0mgjj5o/bqGAKQM2AqqxhfMvrvMUHk707yacr3q9uscu7snvONdg
	/IqWpxBaqktmlS+5VwT/GZIYXnZGlacucqZYSqktmSaXjGzpROC3jKE2IR2t7YiY8BO9nlTwbvdbI
	XxReWXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAr0-0000000F8gw-0gAz;
	Fri, 14 Mar 2025 19:37:58 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAij-0000000F74q-2rIH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 19:29:27 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2C4F82033457;
	Fri, 14 Mar 2025 12:29:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2C4F82033457
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741980564;
	bh=g87Yc4YJdBAnwCUZKSsKpodpokZkAet25OkUYeeBX+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hF2Rs62InylvP8rtjh/0ZN2Za3ug4zYjoggrSRhQ76on39C8v5TNVqXoUJ58hRCcZ
	 m4nJ6WeuWWtgOoJC2CSCny1S9+FM7nkWUCqBX0E4AMuZhMIEm4dSiYxEPaBcBTx9OD
	 oXqSqN7esrWKlvwJHqlewqO9GKBVmTFstXQbQnWE=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	mhklinux@outlook.com,
	ltykernel@gmail.com,
	stanislav.kinsburskiy@gmail.com,
	linux-acpi@vger.kernel.org,
	eahariha@linux.microsoft.com,
	jeff.johnson@oss.qualcomm.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	daniel.lezcano@linaro.org,
	joro@8bytes.org,
	robin.murphy@arm.com,
	arnd@arndb.de,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com,
	ssengar@linux.microsoft.com,
	apais@linux.microsoft.com,
	gregkh@linuxfoundation.org,
	vkuznets@redhat.com,
	prapal@linux.microsoft.com,
	anrayabh@linux.microsoft.com,
	rafael@kernel.org,
	lenb@kernel.org,
	corbet@lwn.net
Subject: [PATCH v6 02/10] x86/mshyperv: Add support for extended Hyper-V features
Date: Fri, 14 Mar 2025 12:28:48 -0700
Message-Id: <1741980536-3865-3-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_122925_766278_F42A0996 
X-CRM114-Status: GOOD (  11.85  )
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

From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>

Extend the "ms_hyperv_info" structure to include a new field,
"ext_features", for capturing extended Hyper-V features.
Update the "ms_hyperv_init_platform" function to retrieve these features
using the cpuid instruction and include them in the informational output.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
Reviewed-by: Roman Kisel <romank@linux.microsoft.com>
Reviewed-by: Tianyu Lan <tiala@microsoft.com>
Reviewed-by: Michael Kelley <mhklinux@outlook.com>
---
 arch/x86/kernel/cpu/mshyperv.c | 6 ++++--
 include/asm-generic/mshyperv.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 4f01f424ea5b..fd285b18d6b4 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -434,13 +434,15 @@ static void __init ms_hyperv_init_platform(void)
 	 */
 	ms_hyperv.features = cpuid_eax(HYPERV_CPUID_FEATURES);
 	ms_hyperv.priv_high = cpuid_ebx(HYPERV_CPUID_FEATURES);
+	ms_hyperv.ext_features = cpuid_ecx(HYPERV_CPUID_FEATURES);
 	ms_hyperv.misc_features = cpuid_edx(HYPERV_CPUID_FEATURES);
 	ms_hyperv.hints    = cpuid_eax(HYPERV_CPUID_ENLIGHTMENT_INFO);
 
 	hv_max_functions_eax = cpuid_eax(HYPERV_CPUID_VENDOR_AND_MAX_FUNCTIONS);
 
-	pr_info("Hyper-V: privilege flags low 0x%x, high 0x%x, hints 0x%x, misc 0x%x\n",
-		ms_hyperv.features, ms_hyperv.priv_high, ms_hyperv.hints,
+	pr_info("Hyper-V: privilege flags low %#x, high %#x, ext %#x, hints %#x, misc %#x\n",
+		ms_hyperv.features, ms_hyperv.priv_high,
+		ms_hyperv.ext_features, ms_hyperv.hints,
 		ms_hyperv.misc_features);
 
 	ms_hyperv.max_vp_index = cpuid_eax(HYPERV_CPUID_IMPLEMENT_LIMITS);
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index 250c65236919..c8043efabf5a 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -36,6 +36,7 @@ enum hv_partition_type {
 struct ms_hyperv_info {
 	u32 features;
 	u32 priv_high;
+	u32 ext_features;
 	u32 misc_features;
 	u32 hints;
 	u32 nested_features;
-- 
2.34.1


