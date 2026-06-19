Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6613DCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 11:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y1MHA3WSG+EmdxC49RdeJjFk6tA5YD/wWphvr816RWw=; b=1EmQBTOcVJrrOllOE2lPxagXTm
	BFiaMamnmv/h4upVyOzc/vCvJeodndf19XOVaCFSLOOAdN9HYrL3XHduk80vHnD7otIcsNePUkjAV
	610eK2KqmoNDUeg20jMsQnznHPctcgiVo4iAQwF3S0vETyh0s+uOgiPD41RgrcUAMMi+6jB/HNXO8
	C8HJewjX7GpEIz2ojUoCX5MfrahY7XC3ipPstmxRUIM9aOwMi4HJSczj++9Mmqd5hIcLoQhFhMWcd
	ffTkbcLvFh6vxDVMmgshKqcsUnUNQn3B6/g6RZI+M1H/yj75pPOpUaipIKZ89eLa+x3UvdxIzji2g
	2b1tgAWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waXrn-00000002MIO-49Hn;
	Fri, 19 Jun 2026 11:58:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waXrl-00000002MHp-0rbH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 11:58:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781870311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y1MHA3WSG+EmdxC49RdeJjFk6tA5YD/wWphvr816RWw=;
	b=FiBOPomYdJggDWf+Ex3mNHCuukDZ/aAE9wKkYaybniNV6x7aiMPCm6sychiS6Iln9Gi4qZ
	RJ6MvTZCmspRLv2fN/EzKA7gqkUddJ5TutZ+8kiUkx7gi1H3Y+K84s5w8v1odtPAYFzomv
	qXDIsIiz23K28oNL7X2ZqaUrnGQ0ufc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-168--00ZuXx9Mj-Np4TZTpkL1g-1; Fri,
 19 Jun 2026 07:56:57 -0400
X-MC-Unique: -00ZuXx9Mj-Np4TZTpkL1g-1
X-Mimecast-MFC-AGG-ID: -00ZuXx9Mj-Np4TZTpkL1g_1781870216
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D5DD51977520;
	Fri, 19 Jun 2026 11:56:55 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CBC5E18005B6;
	Fri, 19 Jun 2026 11:56:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: tegra: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Fri, 19 Jun 2026 13:56:51 +0200
Message-ID: <20260619115651.167376-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: y1e1vFXgjnGA4iMTFS0kHOAfeOwJeK7ttFj-eeLzqvU_1781870216
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_045833_323969_109615B9 
X-CRM114-Status: GOOD (  15.72  )
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

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

This is a completely mechanical patch (done with a simple "sed -i"
statement).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Added changes to files in include/soc/tegra/

 arch/arm/mach-tegra/reset.h  | 2 +-
 arch/arm/mach-tegra/sleep.h  | 2 +-
 include/soc/tegra/flowctrl.h | 4 ++--
 include/soc/tegra/fuse.h     | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-tegra/reset.h b/arch/arm/mach-tegra/reset.h
index 51265592cb1ae..92a89713d5e57 100644
--- a/arch/arm/mach-tegra/reset.h
+++ b/arch/arm/mach-tegra/reset.h
@@ -21,7 +21,7 @@
 
 #define RESET_DATA(x)	((TEGRA_RESET_##x)*4)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include "irammap.h"
 
diff --git a/arch/arm/mach-tegra/sleep.h b/arch/arm/mach-tegra/sleep.h
index 4718a3cb45a16..e332d261c1dbd 100644
--- a/arch/arm/mach-tegra/sleep.h
+++ b/arch/arm/mach-tegra/sleep.h
@@ -38,7 +38,7 @@
 #define TEGRA_FLUSH_CACHE_LOUIS	0
 #define TEGRA_FLUSH_CACHE_ALL	1
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 /* waits until the microsecond counter (base) is > rn */
 .macro wait_until, rn, base, tmp
 	add	\rn, \rn, #1
diff --git a/include/soc/tegra/flowctrl.h b/include/soc/tegra/flowctrl.h
index 1aacc5c7a9dba..2a60bd4934c32 100644
--- a/include/soc/tegra/flowctrl.h
+++ b/include/soc/tegra/flowctrl.h
@@ -39,7 +39,7 @@
 #define TEGRA30_FLOW_CTRL_CSR_WFE_BITMAP	(0xF << 4)
 #define TEGRA30_FLOW_CTRL_CSR_WFI_BITMAP	(0xF << 8)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 #ifdef CONFIG_SOC_TEGRA_FLOWCTRL
 u32 flowctrl_read_cpu_csr(unsigned int cpuid);
 void flowctrl_write_cpu_csr(unsigned int cpuid, u32 value);
@@ -67,5 +67,5 @@ static inline void flowctrl_cpu_suspend_exit(unsigned int cpuid)
 {
 }
 #endif /* CONFIG_SOC_TEGRA_FLOWCTRL */
-#endif /* __ASSEMBLY */
+#endif /* __ASSEMBLER__ */
 #endif /* __SOC_TEGRA_FLOWCTRL_H__ */
diff --git a/include/soc/tegra/fuse.h b/include/soc/tegra/fuse.h
index 8f421b9f7585c..c4f7a1b97c547 100644
--- a/include/soc/tegra/fuse.h
+++ b/include/soc/tegra/fuse.h
@@ -24,7 +24,7 @@
 #define TEGRA30_FUSE_SATA_CALIB	0x124
 #define TEGRA_FUSE_USB_CALIB_EXT_0 0x250
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 enum tegra_revision {
 	TEGRA_REVISION_UNKNOWN = 0,
@@ -122,6 +122,6 @@ static inline int tegra194_miscreg_mask_serror(void)
 
 struct device *tegra_soc_device_register(void);
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 
 #endif /* __SOC_TEGRA_FUSE_H__ */
-- 
2.54.0


