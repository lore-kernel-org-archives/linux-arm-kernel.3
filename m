Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCFECCF2F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlGALvbEagLrvL43Ae87o/5LHQ2nk9c3dvJHPo9cbOQ=; b=fRDdwOpSqDX/vS6oyKhMlmpkJf
	3Ui7EYKgoIapU5KbpHaOpVWnGciGJi7nsSAeNbmL656jHISStEDk5co2F2nQLy1aQU94WRxGpGDPG
	n0ufc/BSF+VeYK9q00pg8Vbht3KqBGx1zS46q8wtEzbp2BaBzytAtQyB5GuPCaz2c6kHPPOACm7UV
	Qu8V+wHBwCmeOTQmRs2bfrr6Ocgt+W2D7qi4FCY91pLixYqD66mX6knLEvx1vEQDxmbss8LTSmclC
	p7yQPC5x3c/qhaToOtXcELMQgLCc+b7OUKE1yUnZAhfUueS5dxobDSRhaC7BXMbiq+MqCrdE8AKrn
	c6Zy396w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoev-00000002345-05RQ;
	Mon, 19 Jan 2026 12:47:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoep-0000000231t-32s2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:47:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 712EE437A7;
	Mon, 19 Jan 2026 12:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3689C116C6;
	Mon, 19 Jan 2026 12:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826819;
	bh=NSDE7w18H5H9oBwx/Q8/XjnJ3tAfUQrVudZ00DELzrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L1eeo/z2YGNrjz+jOS7LISbuNYMpx6J2DtZMfAv+Y12I0ilU6jGG7DB01ZwmVPuNv
	 eFIxGIUgkbbBJBO2Wzhfuv8PyfMmdhpItjNNbvpQkpS8o8LlZe13WIIPZfgd5T9MWK
	 Uk3XD+mH8fpyofi1FfgDZg5pmKWa/YuO+31FzBvT4norS/sl0T47AJUpG840n1p6pi
	 9DNrKymNGY//19Ht3vw/SpZe88mXz+nRvvKi9ns0f3vR06NxOcGWPlDJ8A+fyHocAy
	 7K0lcklJIJbL1KUtb7ubeC77+kWrPHoEkblLCWmZZK8SL6jZqHtFMpzlYHybg/8eNh
	 EUZYdm+AkG8ng==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 02/35] KVM: arm64: Don't leak stage-2 page-table if VM fails to init under pKVM
Date: Mon, 19 Jan 2026 12:45:55 +0000
Message-ID: <20260119124629.2563-3-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119124629.2563-1-will@kernel.org>
References: <20260119124629.2563-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_044659_947977_D0F8B238 
X-CRM114-Status: UNSURE (   9.95  )
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

If pkvm_init_host_vm() fails, we should free the stage-2 page-table
previously allocated by kvm_init_stage2_mmu().

Cc: Fuad Tabba <tabba@google.com>
Fixes: 07aeb70707b1 ("KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()")
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/arm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 4f80da0c0d1d..6a218739621d 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -190,7 +190,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 		 */
 		ret = pkvm_init_host_vm(kvm);
 		if (ret)
-			goto err_free_cpumask;
+			goto err_uninit_mmu;
 	}
 
 	kvm_vgic_early_init(kvm);
@@ -206,6 +206,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	return 0;
 
+err_uninit_mmu:
+	kvm_uninit_stage2_mmu(kvm);
 err_free_cpumask:
 	free_cpumask_var(kvm->arch.supported_cpus);
 err_unshare_kvm:
-- 
2.52.0.457.g6b5491de43-goog


