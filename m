Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77919C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JqI9TbPHCy3il1UNWg2awM1y5je68lG4yjIK0wb1VU=; b=GP1IBYrkxxwWZ1JNKpWmnIGp1D
	cW5xh9UCiCuXpH9CVxcG15QLprwTmYsC074RTKTpj4czWq9UTagwuxOH7K+OJRg7vQ2gkNsk93vyN
	03EV3+R3SqSFL1bv2XuNoL+bpRyTcwogw9TYWF373VC2LUWRXGAYBKqXD/TLl+N7B++j4kkB1SfrV
	Jop+lJIdPyqITwBTDVNeV8cnYPjGsbjpBK6KDUuwdpDcvvRLWT3fQrfj9/TPZERKdYS8F3wvtxWrL
	1WX6lZzUdVpEiTT9+f9DUVI17HN5Hqh+8L+bS5pGzwjgL7StJtK+wZ1h9bkYapKtASdjRH260d2lc
	OVvvinPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAsd-0000000F8pu-3NrB;
	Fri, 14 Mar 2025 19:39:39 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttAik-0000000F75c-3u9m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 19:29:28 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id B3883203345E;
	Fri, 14 Mar 2025 12:29:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B3883203345E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741980564;
	bh=/JqI9TbPHCy3il1UNWg2awM1y5je68lG4yjIK0wb1VU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aLaEpu1KaR49m6Bi5ihb4qI3/4BH/nmolTozffk/qhMB4YggqJXDq2mMENSi5ZF9S
	 qqJYF+R4RPki6TRa0UXlbXPgKgThH7nNS+wWpsQ2OSB9z2pURh5fGl+oNqiwf3OKJB
	 rJy7L2KNYG1zCrRFLhzQbvaN5HkFWVsGjPou/Nck=
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
Subject: [PATCH v6 06/10] Drivers: hv: Export some functions for use by root partition module
Date: Fri, 14 Mar 2025 12:28:52 -0700
Message-Id: <1741980536-3865-7-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
References: <1741980536-3865-1-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_122927_015767_4AC72555 
X-CRM114-Status: UNSURE (   9.09  )
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

hv_get_hypervisor_version(), hv_call_deposit_pages(), and
hv_call_create_vp(), are all needed in-module with CONFIG_MSHV_ROOT=m.

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Reviewed-by: Stanislav Kinsburskii <skinsburskii@microsoft.linux.com>
Reviewed-by: Roman Kisel <romank@linux.microsoft.com>
Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
Reviewed-by: Tianyu Lan <tiala@microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c   | 1 +
 arch/x86/kernel/cpu/mshyperv.c | 1 +
 drivers/hv/hv_proc.c           | 3 ++-
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index 2265ea5ce5ad..4e27cc29c79e 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -26,6 +26,7 @@ int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(hv_get_hypervisor_version);
 
 static int __init hyperv_init(void)
 {
diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index fd285b18d6b4..fcd0e066d9bd 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -420,6 +420,7 @@ int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(hv_get_hypervisor_version);
 
 static void __init ms_hyperv_init_platform(void)
 {
diff --git a/drivers/hv/hv_proc.c b/drivers/hv/hv_proc.c
index 605999f10e17..7d7ecb6f6137 100644
--- a/drivers/hv/hv_proc.c
+++ b/drivers/hv/hv_proc.c
@@ -107,6 +107,7 @@ int hv_call_deposit_pages(int node, u64 partition_id, u32 num_pages)
 	kfree(counts);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(hv_call_deposit_pages);
 
 int hv_call_add_logical_proc(int node, u32 lp_index, u32 apic_id)
 {
@@ -191,4 +192,4 @@ int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u32 flags)
 
 	return ret;
 }
-
+EXPORT_SYMBOL_GPL(hv_call_create_vp);
-- 
2.34.1


