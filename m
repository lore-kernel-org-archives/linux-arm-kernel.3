Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45293CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Aaw5mD9iL8recbssNlmMEcgLUSzQXou6BmaYITDAlA=; b=sbd0RhQFpJEYiu4ru2ubQyWAio
	f9g8dNAMCXfpoVU5i/hWNNF8NwMYdab8noehnj5xr8+oNgP7XikPCQs7qzE6c+0JpMziGzg7GplM6
	XMMfaJYeezR+n3TaKqpot+uRl/tb54VowWtiM/xSojKTfNDYDK1nogI7IEmySm8eNfInISZw4e4Gs
	Wz0JBZ/lVlMbtPn7CS28beBLNOWpDC6Po2WAjPa59fKFIyH/5EuWgF+5v78O2y49vuFwJeSfte3ir
	ZWzuDMVLM26jRCUojeSlFscYqy3a6mQaMRsmA8zdjx/8VOUeyg84Sj5RkbdmbvxqnJPvyT+fnuXFB
	VfjjD31A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd7Q-000000048oa-0fTT;
	Wed, 20 May 2026 09:21:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6Y-000000047iN-1mPj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+Aaw5mD9iL8recbssNlmMEcgLUSzQXou6BmaYITDAlA=; b=jXcIz6c/qfhPTdGUdHv8DoVNcu
	IMgoFfgsoJ08+GkAFmwpCkkL0MlKtZIoR9CsXhiCwdn2u0PJccgI8O7+G1ZdfBVCB829hq2l+q7hF
	TKVSZehE7axIoG8Eybh9zxXMwKx77me5sOGtrrYVr8NQgCl5oyUlxdIaYU/5Xy5CnUq28fi3p7Cnn
	mBAVdxqv/t/Qs1zUiVmxrksYz0q1wJY3BR+M1DxGFFRsR/ZPY28zSyaQmkjWIDg4wMUXJeIem/6JX
	pVNUrMeEQV4VD1q2OSrcBTLQzLz7Nf5cNF+FGS28Mh3efEDrrs7/13QTqGKzMK/mcv2564rMn1+4j
	jvfDrnQQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6E-0000000GKXD-0E0k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8000744570;
	Wed, 20 May 2026 09:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 659011F00894;
	Wed, 20 May 2026 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268814;
	bh=+Aaw5mD9iL8recbssNlmMEcgLUSzQXou6BmaYITDAlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DD+e1+L6qpqNXQcVgtena1YUtrPaRkpEyjE4dnQ9oBdZDR6f+31IHX4s33+VJyyeB
	 +M4R6tbXJpr3ceaRagBfocQqO8ajN1FhdWuCHwdVyiKISCsmwAszkRctDbQzWOoMjH
	 COzCtkVhAKODsI9WPZVw7GK0BpjRDbJjj/GcjWdwKuKBjIiJNMzO1SHCKWhsmL6o8l
	 252fm8Lzm96sYfFkHFDZKprdaEAk2xXlY4gL29QwyG1YFo0D9kXiHpIUu6VIKxjXL+
	 KC2uE9NrcSd9kX3BoTHsGe0d91AipP7rCz/G6u+X9iUmMqXYKfFMShbJA1iQxYZS5t
	 qufKOX5rgvi2Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPd64-00000004IaV-31KH;
	Wed, 20 May 2026 09:20:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v2 12/18] KVM: arm64: selftests: Add missing GIC CDEN to no-vgic-v5 selftest
Date: Wed, 20 May 2026 10:19:43 +0100
Message-ID: <20260520091949.542365-13-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520091949.542365-1-maz@kernel.org>
References: <20260520091949.542365-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_102036_967217_8FC6516A 
X-CRM114-Status: GOOD (  10.30  )
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

From: Sascha Bischoff <sascha.bischoff@arm.com>

The selftest mistakenly omitted the GIC CDEN instruction from the
testing. Add it in.

Fixes: ce29261ec648 ("KVM: arm64: selftests: Add no-vgic-v5 selftest")
Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/no-vgic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/arm64/no-vgic.c b/tools/testing/selftests/kvm/arm64/no-vgic.c
index 25b2e3222f685..ab57902ce4293 100644
--- a/tools/testing/selftests/kvm/arm64/no-vgic.c
+++ b/tools/testing/selftests/kvm/arm64/no-vgic.c
@@ -159,6 +159,7 @@ static void guest_code_gicv5(void)
 	check_gicv5_gic_op(CDAFF);
 	check_gicv5_gic_op(CDDI);
 	check_gicv5_gic_op(CDDIS);
+	check_gicv5_gic_op(CDEN);
 	check_gicv5_gic_op(CDEOI);
 	check_gicv5_gic_op(CDHM);
 	check_gicv5_gic_op(CDPEND);
-- 
2.47.3


