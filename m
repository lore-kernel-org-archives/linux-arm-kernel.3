Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C04CCC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 23:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdPAe0pP9QMjExtffSosvKieXECF/E8lF8sABw0TiKU=; b=TYUVHCHQ08kIXb5/LYHRnuIIUG
	aacV0DwAJCM3jv2UzAqghUHKHiwjHJhMI3wFVOGMYvS8MQ0Ly4fukX344k6ACPmRtjphZOVf3fm+R
	JY67DeX7PIBwtxnfYVX2l3JuB1/lLkzX7Ya6Z4vknDduh7ODAt81lrtNCQ6MIdKG12oPAOgWPdn7F
	r5LT0GU+WfU6kVU/u1RtCHOUUAa6uqrVaZBpUfUs44xagVQg28sCTzsSYtpRZtTcoZMLTJ/r1/hh+
	vH1fybELgR/ipETgeTQ9rdEe6pJXwsGOYk9J4J32Qn+lQlVwnySrEFMUVuEAa9TLtypYwR2cJVITE
	4RpbD/Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQcW-00000005ftz-07MO;
	Wed, 26 Feb 2025 23:15:16 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnQWS-00000005evT-34aw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 23:09:03 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id B0CEC210EAC5;
	Wed, 26 Feb 2025 15:08:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B0CEC210EAC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740611338;
	bh=mdPAe0pP9QMjExtffSosvKieXECF/E8lF8sABw0TiKU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=prsKrfTW7xMSKGkMq0JEyI47ylrRB0iXXkgVITEgofJU7UnQ4YKUX7ub9f77xioyB
	 3CyOtt1dTxF8lopX4jxKWJPhRG80QRZubcdPlfHbqSyleEOfyNiuhKnHOUhveoVIs/
	 zbBcH0pyBGhjpGrYrY/QXGuLG1uvz1AQYa6Pi8Y4=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-acpi@vger.kernel.org
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	mhklinux@outlook.com,
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
	Tianyu.Lan@microsoft.com,
	stanislav.kinsburskiy@gmail.com,
	gregkh@linuxfoundation.org,
	vkuznets@redhat.com,
	prapal@linux.microsoft.com,
	muislam@microsoft.com,
	anrayabh@linux.microsoft.com,
	rafael@kernel.org,
	lenb@kernel.org,
	corbet@lwn.net
Subject: [PATCH v5 02/10] x86/mshyperv: Add support for extended Hyper-V features
Date: Wed, 26 Feb 2025 15:07:56 -0800
Message-Id: <1740611284-27506-3-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_150900_824729_8DAA242B 
X-CRM114-Status: GOOD (  11.76  )
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
---
 arch/x86/kernel/cpu/mshyperv.c | 6 ++++--
 include/asm-generic/mshyperv.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 4f01f424ea5b..2c29dfd6de19 100644
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
+	pr_info("Hyper-V: privilege flags low 0x%x, high 0x%x, ext 0x%x, hints 0x%x, misc 0x%x\n",
+		ms_hyperv.features, ms_hyperv.priv_high,
+		ms_hyperv.ext_features, ms_hyperv.hints,
 		ms_hyperv.misc_features);
 
 	ms_hyperv.max_vp_index = cpuid_eax(HYPERV_CPUID_IMPLEMENT_LIMITS);
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index dc4729dba9ef..c020d5d0ec2a 100644
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


