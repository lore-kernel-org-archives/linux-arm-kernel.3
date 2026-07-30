Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48C1C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDe8YvYJlu1JYh0yp9syTuhzrxaVjIvimEEjOf5rRHI=; b=mE5VfLD4yVubrKh7gXo9opFKdk
	K+x3xfwSC+ezRuf0tb0HhmDTXzoEk5uxswL/gYn7P55CgWe0rwx8nUfk9aOwJJTqc/3raQ0D/o77J
	IY2uZWW1aSy8vmH1ZZT/u2y1LbPfSqRgkNmr88S4iGD0pc5BtmxF+ZQYJJ9kdXuI7lYEMcZ4IGIn+
	Wftwg4i2S+mEqqPcGeYDsmQB0cjD99AhKzx8ir+PUFCDp3LhTtXNg8aE/pcReCs49O0b0llpoYXJQ
	QuPliQutP4UNlOx2GEXo+VtiT6q0hTlpwS7/mFmyNqRtYsrsGxKzwBPqCcYlpSE7byKJg+A4vpM7Q
	C2TlAgYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKvY-00000009gem-0nu0;
	Thu, 30 Jul 2026 07:11:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKuq-00000009gKq-0PGS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:10:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D62FF41A86;
	Thu, 30 Jul 2026 07:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC48A1F00ADB;
	Thu, 30 Jul 2026 07:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395451;
	bh=QDe8YvYJlu1JYh0yp9syTuhzrxaVjIvimEEjOf5rRHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oo7Ls81E2VZ5IXdXmm0UMEQLx+VGMT8bfl2tOYvgogY8OGoM6GBYiWNqPC1ttohlt
	 uZk1/8qGdj/VtLxiO8JMF+DouT+cdS8OZC/Gvj3d9g3MCfnKDzkscrn7E59IolAKk3
	 ttPY+h6KMOhfg+gAZ8Is7vX3nrJs51xlyxwlv/IQKB+DPniCW+4gdJQ4l6NBpyvGfj
	 JqWHcsQig2qrpkbbzhxTKKcCzuNTLXv7uGX1kBCcC31E5tVHfbnDfngMbVbyOHS4lb
	 QeVvcuP7ScAd5sfTQOvD0z4Cl40hA2Ve5WIpuH3ZnnWWX/d0aZxE6H+XoYieZXpcTr
	 OOYA2sJxPw8QA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wpKuo-0000000AOpW-0Igh;
	Thu, 30 Jul 2026 07:10:50 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>
Subject: [PATCH v4 08/29] arm64: Add ARM64_HAS_NV2P1 capability
Date: Thu, 30 Jul 2026 08:10:01 +0100
Message-ID: <20260730071022.296811-9-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730071022.296811-1-maz@kernel.org>
References: <20260730071022.296811-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, yaoyuan@linux.alibaba.com, weilin.chang@arm.com, vladimir.murzin@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

As we're about to deal with FEAT_NV2P1, add a new capability that
will be used to key any support for it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/cpucaps | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 9b85a84f6fd49..242dc211d8efa 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -51,6 +51,7 @@ HAS_LS64_V
 HAS_LSUI
 HAS_MOPS
 HAS_NESTED_VIRT
+HAS_NV2P1
 HAS_BBML2_NOABORT
 HAS_PAN
 HAS_PMUV3
-- 
2.47.3


