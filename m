Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3F0C55166
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 07:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoiK/RNeZLIkLzyKO8ly8OA0RZ+EXunPBVOADEEok6o=; b=Iz3lI9Y7FmF6wPBUNsKShcoxk/
	zhpxQKWOIJnxoTBHnksKKY6Mfeljh9XkDnYqDTS8mvHE9t/qNLyLJpckbHXceKnTSKyqtDok7+lDJ
	Drczja0DHGzwwXqCpGeaxu/8ew8vc2s/R3A/2SVosfh8rp6NBhBA7UpLGt14kGdYzlnasLb2GXlhV
	lIOnz/Q/9SMmXixFBIdp8y07c+uoR6e/BUOB18lCMUizl+CvjJl+9F+21GlBElYPYwYSO9tampslg
	KitUbnTqI/PZdxMZgape9/o44UvJhbD2odvzd0OIeK/khY9RuhvhY/6AjD1V9YyLN46SK0lPFPBi5
	XJhVN4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKvZ-00000009ghp-2oqz;
	Thu, 30 Jul 2026 07:11:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpKur-00000009gN2-31au
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 07:10:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7274743F87;
	Thu, 30 Jul 2026 07:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529381F01563;
	Thu, 30 Jul 2026 07:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395453;
	bh=xoiK/RNeZLIkLzyKO8ly8OA0RZ+EXunPBVOADEEok6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n4V4bVAh6mS4qkI/+7dmo7LyHb+juTfPiSvUYwNyBc6I10tT7DAq7hGvwYlMbvwmf
	 IlWHefKhLzJ3wWGJ8+lXbkRcWtg0ETp/U8d7ikQypfjCFtIpOX+daZyS3PgxqIS4uc
	 k2UCN1wf7GaQXd6lovqP2y5aH/4q3BNAD5McPWhH7D+bEFuGWP3FiC0Cfy93Uoqbn/
	 JaR0Xt4O2UEwwluhD/+3J4fmr1h6BBBdXISKjsKxE8c4CtFmBbjK5olnAv0gm/bWvu
	 vtLFwIOEfFCeQAz5S1B0RqPik8PEI+bI28utrPK/uR9fjse0WL5D7EjH0frxWFIEHa
	 SI3mdDGAtTvSA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wpKup-0000000AOpW-2m7a;
	Thu, 30 Jul 2026 07:10:51 +0000
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
Subject: [PATCH v4 15/29] arm64: Add ARM64_HAS_NV3 capability
Date: Thu, 30 Jul 2026 08:10:08 +0100
Message-ID: <20260730071022.296811-16-maz@kernel.org>
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

As a bunch of KVM code is going to depend on FEAT_NV3 being detected
on the host, add a new capability that will describe it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/cpucaps | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 242dc211d8efa..7e0414509e89a 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -52,6 +52,7 @@ HAS_LSUI
 HAS_MOPS
 HAS_NESTED_VIRT
 HAS_NV2P1
+HAS_NV3
 HAS_BBML2_NOABORT
 HAS_PAN
 HAS_PMUV3
-- 
2.47.3


