Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C57C44502
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoiK/RNeZLIkLzyKO8ly8OA0RZ+EXunPBVOADEEok6o=; b=yOSKsNZDZIKcpQHRbNqtl7jiR1
	Z3YqXWvZVsd9lOOMtstJUPg/C2/g72XfQXTxHGCIxxQvJD+kll/H9gdZLru5kc/vlQ/qiDb+RTmIq
	aZNPB6Tf1Un4hLerlAoLKd3VtE8tz10tD/LmowdTd24hBOKrwplqf9l7NghJA4uXfwo/O8dFE/XQA
	hlVlLlbefYD6SPZ5Kpys2PM0XeDABbL0wB/4Wr/5tznhxEWteBfY7PjPssuVDxiz3e2RPKgrihmZb
	MX9GimWWJF9thXYl6esXK0ZQNnlF3ON+HrzA84Wj11juVO+oaIiuJgGm6Gsfi//SQ1DP/zbUIrOt8
	byRRe/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsb-00000004uPe-0QQg;
	Thu, 02 Jul 2026 16:03:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsV-00000004uEh-1Nkb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C1B240291;
	Thu,  2 Jul 2026 16:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AD21F000E9;
	Thu,  2 Jul 2026 16:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008182;
	bh=xoiK/RNeZLIkLzyKO8ly8OA0RZ+EXunPBVOADEEok6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ooq2MoRvgWiEFq98enjtf/N6G9pI1Hp2DU6M7nlLExo9easAVqes1G8cQtPfJYgrg
	 ek7vk4EyZxyJxh7B1bjLIUpBcaKFjlTXqGmMlZ6Hfl6p0fLdMhRqfdMcTHVlLBqYNj
	 gepRgy/yGGVJc6PbLdBfLLkILfIlbA2a5VL5du1KLJBUUzVY9bs/EIKiVgZmjy6wL8
	 SkvclwxYjIvuGOH/gY2JOTc8Z2VHH1owQCRZk0Q12y3lWmr5W1lBzgF8Lb4GYeAmwC
	 00PuJrSU34nAxZsEt/dqKDlZhrPgfUijHuIq51YtpDaBsEklKa1u+8jVBYjHbTFJ0i
	 9oXnmP9HwCwfg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsT-00000000ojd-0ejd;
	Thu, 02 Jul 2026 16:03:01 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 15/28] arm64: Add ARM64_HAS_NV3 capability
Date: Thu,  2 Jul 2026 17:02:35 +0100
Message-ID: <20260702160248.1377250-16-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702160248.1377250-1-maz@kernel.org>
References: <20260702160248.1377250-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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


