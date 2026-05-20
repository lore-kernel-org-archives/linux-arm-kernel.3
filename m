Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5143CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2UP4oEFhHFvYNaDQ1RBxMdab/kp2FfRq8HctTWxTnI=; b=x3+0dIDPkeNA/hc5pzTDWeC1qZ
	n4g9Mt1se9jCDq+IyRR16ufr3d7mJ3j/6eprggv31V8fKEVXTscSinKN0K8vB8CBy3RGEgN+Df4gf
	yY4b9VYk3exup7mB64Kf/29y0U0bGYCSNSk88zdc168JmdI0Thq2vsWDRRBAm2uwofrMOyReo4ZFe
	BIxHgajcd30E19PVhTqQD99xk8bLlBaqD6/XI1IqnUz0eF1xxOiCwrXQT7cd7WcsO3mYhHYViv8eK
	JoMfRJWtbgpVfNc2Wlm7tkYBjCbpAuruS9RPAjJTQFQ4PNH+irtiajOQQEDgo/XC2igXxYRJ1t0ch
	Z1rhne0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6T-000000047ad-2cl9;
	Wed, 20 May 2026 09:20:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6J-000000047JG-0M5m
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=m2UP4oEFhHFvYNaDQ1RBxMdab/kp2FfRq8HctTWxTnI=; b=ILzxWx+JDREjHHIV+R5qRn/l8c
	HZBzE1NfIMLiv8bOmoQ0X0KygvfJ0Wbu2jvdEqUEZnit6sdxUo8BqjOrF50ukBdKsNz7DddWq/HEm
	wmk9mrJd6u+RDBIULhWs7SZVA+NP+BuzSJuNkd/qZt1j7ZsZWJ8ymD9d6QJvbLQ95B03BaNqMv+HP
	0h8A79ZYlojFZOx6eFadFB4kZtuiMV6EDIbFvp4eB0tide+7UQiURBdYVcMvwknuAWDoKD5SHQI/a
	C36xoN1wM0pRa4J/q2l/Tvt8clZGaKTtBX53QQWo9tf8Tjo5j91AfHjK1tQlOXjP03m7CILmmYbza
	8tqwVgFQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6F-00000006xOd-2EPn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C5222445D4;
	Wed, 20 May 2026 09:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70261F0089A;
	Wed, 20 May 2026 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268814;
	bh=m2UP4oEFhHFvYNaDQ1RBxMdab/kp2FfRq8HctTWxTnI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wkg4zVqILB+Pkp2Zhk+T+wByBZtsYuRPm44HzAq5pO02+XqHuzJY0VmVBKdPbXX9e
	 IU0WRqDomb6/bCTSkhQ3zF8FNY2sAeWS7BpS1Su/PaFpSy3qoh7K3J/ICJODQASluH
	 QjI4iN6nd+CoB5A7JJWGpFVE9QMRjO81zXbAxLPDN4zMepDgApNKAtsUBe2PUIt6We
	 Zw6A4P9tnKcjCHLUmYvj5S/bkSbMdJfD7JtySASTzzSC2dmqc716BPIKaJbWK2dNbC
	 xkbaEESY0yObA4VrBaGMDVFNL85dU8wbq5mlJAz4WWtFi0LlWor1tA4X60wTpZeHLR
	 R42TD3eUWf4mA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPd64-00000004IaV-3uY6;
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
Subject: [PATCH v2 13/18] KVM: arm64: selftests: Cleanup unused vars in GICv5 PPI selftest
Date: Wed, 20 May 2026 10:19:44 +0100
Message-ID: <20260520091949.542365-14-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260520_102023_788611_E4E20024 
X-CRM114-Status: GOOD (  10.92  )
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

Clean up a set of unused variables around the size of the guest's PA
space as they are completely irrelevant for GICv5 when only
considering PPIs.

Fixes: 0a9f38bf612b ("KVM: arm64: selftests: Introduce a minimal GICv5 PPI selftest")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_v5.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_v5.c b/tools/testing/selftests/kvm/arm64/vgic_v5.c
index d785b660d8476..a8707120de0d8 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_v5.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_v5.c
@@ -20,8 +20,6 @@ struct vm_gic {
 	u32 gic_dev_type;
 };
 
-static u64 max_phys_size;
-
 #define GUEST_CMD_IRQ_CDIA	10
 #define GUEST_CMD_IRQ_DIEOI	11
 #define GUEST_CMD_IS_AWAKE	12
@@ -208,13 +206,9 @@ void run_tests(u32 gic_dev_type)
 int main(int ac, char **av)
 {
 	int ret;
-	int pa_bits;
 
 	test_disable_default_vgic();
 
-	pa_bits = vm_guest_mode_params[VM_MODE_DEFAULT].pa_bits;
-	max_phys_size = 1ULL << pa_bits;
-
 	ret = test_kvm_device(KVM_DEV_TYPE_ARM_VGIC_V5);
 	if (ret) {
 		pr_info("No GICv5 support; Not running GIC_v5 tests.\n");
-- 
2.47.3


