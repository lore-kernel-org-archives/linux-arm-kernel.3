Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C822C36008
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 11:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHf91QhT51iYy83lJisFmODA+pFXdAkAB/GuCBpC2zk=; b=vKfVeH68qP7Qpie2/MoxJsXTvl
	bS6UbANxzGXxPe5P68+TJ8zL6DhJnNMT4Ei1dKlMtc+YCspoPUU6IkiUfMWeT61e1spYw7r1axjUD
	3R99sbJUYAK+nd4gCFvzTlXJ5UAllNdEBBnM5+LbuvvmmSKnn8dRbW4V3Ql6Pfadm/T3WpuFMaBGC
	rXnaIr7o0lFl+mPafTPNvck6okPgDyYNsb3phPQo0HXqYMLlLBErsCMv59R0kaNSCYK7BLM8LTaZ4
	JAlMn4parGW4FY+a4sZ9nUmpLVVDLydJHpya6Fl4Fy4ckz1ELntukChuBA5+nKTfGXS/lVWngbouD
	xwV69KcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txPD0-00000008OdA-1at9;
	Wed, 26 Mar 2025 11:46:10 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txP6H-00000008Ngg-1SZF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 11:39:14 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso24393245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 04:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742989151; x=1743593951; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GHf91QhT51iYy83lJisFmODA+pFXdAkAB/GuCBpC2zk=;
        b=sbk0bLAdaRP9sM77T/hO3ZaARWmWJhVnTK/cZaUYgB1+hgu9jGeOCJxuyD9q+q9IEi
         dCdvZ5vw/SkVIGyLPB7ZB1B9X1YLRWcCwM+h19DvEGJtOa5zsTK5jKAKrJaIhmkHhsEL
         iedGdYLL6DsnHu2jzc7rZvtN49y0UrOgfSJWSVdBiXg0MXQBcJGQRDWG1qwSVxWpTkGv
         SV7/blOavQLvVC4/KdcRJw7eDhy4uAOzmF9WMgKSm+5ZZXnsAdcfqK12DskN6moh19Sb
         LJSHE9BtJ+biyI68fclI/BeZDoLjaq0lrtys9TPs7o8YRTeb3Nnx/70lUQPHR5Cs7jOG
         JR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742989151; x=1743593951;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHf91QhT51iYy83lJisFmODA+pFXdAkAB/GuCBpC2zk=;
        b=PvBkigUrY1UHdLi9CQCoWHEA1w0P6O3zQfs4a4OFa452+sRVYPZNH7Dkf7OurWxKOJ
         34Ky30C75HWQGaFtqd7HJeukw9IGMS+y8k0Ojgz6K3lIo5Gw0ZFF3Vz28NX5BU7SXZ+h
         MakxfEycuHbuTT14cTEAznHJ0ZZuxHOkbfZAaAKEEQwdxtuiot/WG6ZyBxshRjHl6toN
         gAAkf5QUVRhrQ66inor9Tph4xcKoh9hwSI1RilHvJ2fJpElaGD9TI/tppat0Iqq5ojyO
         8nPTEbgpNQR2YZyQfv1yoV3HUBkT0L9ap0NO2xU5k/xOWwez3p0B4TBCoH06HKK9pmW6
         aE4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXngxdfypU4BxjalWQNqjXtMP+gPmxXAIhyOdt1UK0l0TSjgbH3EIR+PYjIUXsVnysmCVnoxT9ro5/VPZ3ranqd@lists.infradead.org
X-Gm-Message-State: AOJu0YysZQ7EwQBpBuhmBEa0CJtJBO5otqA4ktkXueppZOwus9XGrzS6
	kIpdi4tvluXnXPWM0CQ2HVFawFjZuRySbs4hy2qCD3Z3Eq3AIaTK0FXjN8z4pHEru94jfiwKUSE
	FaKIw8bl9o2/sn7gCqrcBdMunHA==
X-Google-Smtp-Source: AGHT+IHs0QnGDLw9n/4cRwsa7oyAsEcllQx68V0oWKnfOqB/3TAlLPJ14NKv8m2ojEKJA3YBjubucjAO0uNkMu+4Lz4=
X-Received: from wrck14.prod.google.com ([2002:a5d:524e:0:b0:390:e325:456e])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:6c61:0:b0:390:f902:f973 with SMTP id ffacd0b85a97d-3997f8f5c08mr18860296f8f.8.1742989151526;
 Wed, 26 Mar 2025 04:39:11 -0700 (PDT)
Date: Wed, 26 Mar 2025 11:39:01 +0000
In-Reply-To: <20250326113901.3308804-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20250326113901.3308804-1-sebastianene@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250326113901.3308804-4-sebastianene@google.com>
Subject: [PATCH v4 3/3] KVM: arm64: Release the ownership of the hyp rx buffer
 to Trustzone
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com, qperret@google.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Andrei Homescu <ahomescu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_043913_384136_2BEC2EA0 
X-CRM114-Status: GOOD (  12.45  )
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

Introduce the release FF-A call to notify Trustzone that the hypervisor
has finished copying the data from the buffer shared with Trustzone to
the non-secure partition.

Reported-by: Andrei Homescu <ahomescu@google.com>
Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 6df6131f1107..ac898ea6274a 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -749,6 +749,7 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
 	DECLARE_REG(u32, uuid3, ctxt, 4);
 	DECLARE_REG(u32, flags, ctxt, 5);
 	u32 count, partition_sz, copy_sz;
+	struct arm_smccc_res _res;
 
 	hyp_spin_lock(&host_buffers.lock);
 	if (!host_buffers.rx) {
@@ -765,11 +766,11 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
 
 	count = res->a2;
 	if (!count)
-		goto out_unlock;
+		goto release_rx;
 
 	if (hyp_ffa_version > FFA_VERSION_1_0) {
 		/* Get the number of partitions deployed in the system */
-		if (flags & 0x1)
+		if (flags & PARTITION_INFO_GET_RETURN_COUNT_ONLY)
 			goto out_unlock;
 
 		partition_sz  = res->a3;
@@ -781,10 +782,12 @@ static void do_ffa_part_get(struct arm_smccc_res *res,
 	copy_sz = partition_sz * count;
 	if (copy_sz > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
 		ffa_to_smccc_res(res, FFA_RET_ABORTED);
-		goto out_unlock;
+		goto release_rx;
 	}
 
 	memcpy(host_buffers.rx, hyp_buffers.rx, copy_sz);
+release_rx:
+	ffa_rx_release(&_res);
 out_unlock:
 	hyp_spin_unlock(&host_buffers.lock);
 }
-- 
2.49.0.395.g12beb8f557-goog


