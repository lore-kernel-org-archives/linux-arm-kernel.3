Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9E0CD37B1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SivBKmXQGeyKMKqtVD0tUaNbbrUnbcKSjOJKkNX+ssQ=; b=f2R//JIP2V01gaAHfnlShX5h7f
	0H9PjRaG5XlHL2uIW01NWoz+Jn6ofI0udlV92In0N6LlPdooqjRriv7QApsAPSM/TjvP2lwnX9WDg
	a58/BDl8yuyhO0hPE53xDON4WEgIAZuuyWoVPISmBS95eefkWIm+VP7bW/sYoQhlEa/xgFokipaV8
	YTz91FVLFBISi5WJVu9DHijvpNWvz9fbNXru9w24ebat4hDpvzyaG1JI9kpFTwyhY7pHKY6aCGRR8
	6P+9RA+lmYPtX1RfeivZGpjh3E/xk6yWud+Nog0p6UjLnW8mFTwbHxjx8Hu8f2GGRdVPjMZtbWdly
	N0RYhJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPPd-00000007Cb5-29Rp;
	Fri, 08 May 2026 17:54:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLPPb-00000007CZw-3Mrr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:54:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4265E60052;
	Fri,  8 May 2026 17:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A06C2BCF5;
	Fri,  8 May 2026 17:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778262895;
	bh=/aEr/2bl24rcHpe9c/rW9BGCQVs8Vg6IaLcMsIwTuCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ndN56qyUqTs+ESpRsl3NSQPAcyFXCT94hgHpwL7EIhSbzah5StjeDU8Ll58UtHaBP
	 ma3w2CiGVaFY0Q0zKvvBJCDgbzTAzR8pHAHQWMMGkYqIGUUnGRE7nYiTN13E+E8BaP
	 u4hRvuTDUSHLbemPqVGlGqYYOXCZBHCVDkhsuy5VCoBk1L++sbHclUXnuW8KC3zSfU
	 QT8rSe/GCfm7+M6yX+QckmUCENMJCQffoPQi6xJdxO16CaKfKJKXpdQsOLWGbuC50y
	 EuUxL3jKhuEzg4Mb0O5ZXJqUpzyYR4zRbO4cZF2CaAVKCYOY7AaGIjho7zehSkoHR7
	 IkRIV3aVGllSg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 08 May 2026 18:54:18 +0100
Subject: [PATCH 4/4] firmware: arm_ffa: Defer probe until pKVM is
 initialized
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-b4-ffa_plat_dev-v1-4-c5a30f8cf7b8@kernel.org>
References: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
In-Reply-To: <20260508-b4-ffa_plat_dev-v1-0-c5a30f8cf7b8@kernel.org>
To: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.15.2
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

When protected KVM is enabled, the kernel includes a pKVM FF-A proxy
that sits in front of the normal FF-A driver. The proxy has to perform
its own FF-A version negotiation and setup first, so that it can mediate
subsequent FF-A traffic correctly.

Defer FF-A core probing until pKVM has completed initialization. This
keeps the normal driver from negotiating the FF-A version or performing
other transport setup before the pKVM proxy is ready, and lets the
driver model retry probing once the protected KVM state required by the
FF-A transport is available.

Suggested-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/driver.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index e9d7dc71c06d..1fba064c2aba 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -43,6 +43,8 @@
 #include <linux/uuid.h>
 #include <linux/xarray.h>
 
+#include <asm/virt.h>
+
 #include "common.h"
 
 #define FFA_DRIVER_VERSION	FFA_VERSION_1_2
@@ -2039,6 +2041,10 @@ static int ffa_probe(struct platform_device *pdev)
 	u32 buf_sz;
 	size_t rxtx_bufsz = SZ_4K;
 
+	if (IS_BUILTIN(CONFIG_ARM_FFA_TRANSPORT) &&
+	    is_protected_kvm_enabled() && !is_pkvm_initialized())
+		return -EPROBE_DEFER;
+
 	ret = ffa_transport_init(&invoke_ffa_fn);
 	if (ret)
 		return ret;

-- 
2.43.0


