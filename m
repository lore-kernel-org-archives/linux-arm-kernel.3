Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F87BC36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MzFQfhx5F8dx0RL9AvvQYwg76iw5NXa4lMy+vsdeqMg=; b=JcQ1yANaApQIxK4vt9ArcT4c+D
	cWDluYYer3XvFZuC6qL/ghTqSqDlhHqC0Dz25+sOII9mpQc4i5fiZtdFCM0w/EUtwPcdyMq0auWZi
	VeJmb3teKKTomr82Pqe39pvLOyf4xiVuOFqVNrtxaLY7z4qz7FVUAgJN6fywMezWqYf8EIPtHnbP9
	jPZMv1tBtd2aGU1lzq5DzRkYwX6Dt9QK4SsCXQ2eSMtXBI8evCaMGYdqp+4+1hlViOLblhHPJY/Jn
	UvLfPM0Qlsjm1nnz4Swq9o2tq8KVrT2ECuuGWa7V141wW882hI+JjN/TIp3vFV/AWV92vJ3SAzKBx
	SGX0Z6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdVu-0000000F95Y-180p;
	Fri, 21 Mar 2025 14:38:22 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvdQf-0000000F7hp-2SBZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 14:32:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso13539325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 07:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567575; x=1743172375; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MzFQfhx5F8dx0RL9AvvQYwg76iw5NXa4lMy+vsdeqMg=;
        b=m4ZR+0yD1Zgjvy5CiMMmk6KWKOBeFcQH7lfvu6HZVy0ZX9KXBbyFR/LyxHg+eXdCoo
         icMrjrEjxlVeoL3ttjc/9B2a01E+61ON0d7/I6NrPF66s2vViV0l7CT5wfPPgibk7fUB
         Qhff4OR1/YPV+ETeQUuvri2VJ+q0+oghaotL3gjCs9bT4qHvTVWbLPOjOnSW/GW/fJfU
         lZBTzYKiUO0MjYzWiZgMGGZtf4/PsrWpHtAHR+PbvCYf2Or+q3G1V5Lq7NtysVsu/nuT
         BT/mr9Ao6jU5/3XkpS1PcNH0v4Nfs8iDLc+kATBGyK+VZOuZZfyieqmoBX1yifCPxtmz
         twXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567575; x=1743172375;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzFQfhx5F8dx0RL9AvvQYwg76iw5NXa4lMy+vsdeqMg=;
        b=LBYGzfI3AUmc/B4ZrArQRB9rAl4Mi09VNCyEwirBAEiB77+BxMv7K6eBKOcTzzmLqZ
         3dicUBJ+v61JFgeV2LETZCRBf8xlhbPbNt1VeDTtD5bXDIcrUyoAKSMDAzpmJYxSR020
         W02c6RcU0lMzwfOQ9/0WsST72pXgbk+vdP4VgZKGH59yCwSuEDty4rRDEURsnfnrzij+
         8QiOLrb9lmglctU+R60FvotYlxIQWVS/pYXRVI4kBtRaOt72cF6elj0TAIZrNvmiGYHV
         v1ysGCLhp4sJaEW4dYYqC/qSm5BMmsAvEVXjaRIp8jywR8R2D8Ln7wdY2lnL6XMMIYAp
         gDKw==
X-Forwarded-Encrypted: i=1; AJvYcCUvgo8YF7SY+Aig0JV0qWFe1emk007JbUw2M2ip6PKlzPv9DK1GHEi7NJ6ZNDTPrSBA7ZtuZ2h8GQrX7QLT3NrL@lists.infradead.org
X-Gm-Message-State: AOJu0YyQXyKBOtAnKNpIDhlJ+q6LC5+T998YBZrqV2H47uyHn1d0i3r7
	6nfjcdxHX47brIYdoYwS69uV7jWMjCKdOm3HWl+5nCGzJh/m+UpLBk0iQq6BBdY=
X-Gm-Gg: ASbGncuaY0kSHf2y5RpmrUZVUJgj8rYot8jsZJPPIHFvsDEZQR0FCFU85ZLzA2Z1eHu
	i8dAeGILDg3VJ9P05CG2XGL3WoF7cHW9DoEqiw9FBp4wQ0Rb//euj1XDmyTEPRba6nDURedZ9TF
	su1joSgRKztfZZAECNYL8q1keWoLYXpiUJ70iR3lxNK+M6yXVH626gMl08qieVLQFSLbhSJnka2
	GI91WBblMX6xUoS1JKk1Wuqv2QFiHUMk4nES82Zk5bHDtwIKpdrl8iPl4JETJnnFC6hfa1vpdu8
	Ho9zTa2KurT0zzLL9bViJdjttLl6Xmdn56KfvHshFRd3LF1UuQ==
X-Google-Smtp-Source: AGHT+IFdHgCx4C5nFq7a41Rl1TdfpLB7mC6eqzVe1FxFvJX3eQdkfF3U3LPtyEx8bVlfn1VSsrBleA==
X-Received: by 2002:a05:600c:1c02:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-43d52a08ed8mr22225315e9.11.1742567575525;
        Fri, 21 Mar 2025 07:32:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d4fd27980sm28845345e9.21.2025.03.21.07.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:32:55 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:32:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Koller <ricarkol@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Andrew Jones <drjones@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] KVM: selftests: Fix a couple "prio" signedness bugs
Message-ID: <ca579322-dc9d-4300-bd74-7e9240e930c7@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_073257_629180_DB4C3309 
X-CRM114-Status: GOOD (  11.07  )
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

There is an assert which relies on "prio" to be signed.

	GUEST_ASSERT(prio >= 0);

Change the type from uint32_t to int.

Fixes: 728fcc46d2c2 ("KVM: selftests: aarch64: Add test for restoring active IRQs")
Fixes: 0ad3ff4a6adc ("KVM: selftests: aarch64: Add preemption tests in vgic_irq")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index f4ac28d53747..e89c0fc5eef3 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -294,7 +294,8 @@ static void guest_restore_active(struct test_args *args,
 		uint32_t first_intid, uint32_t num,
 		kvm_inject_cmd cmd)
 {
-	uint32_t prio, intid, ap1r;
+	uint32_t intid, ap1r;
+	int prio;
 	int i;
 
 	/*
@@ -362,7 +363,8 @@ static void test_inject_preemption(struct test_args *args,
 		uint32_t first_intid, int num,
 		kvm_inject_cmd cmd)
 {
-	uint32_t intid, prio, step = KVM_PRIO_STEPS;
+	uint32_t intid, step = KVM_PRIO_STEPS;
+	int prio;
 	int i;
 
 	/* Set the priorities of the first (KVM_NUM_PRIOS - 1) IRQs
-- 
2.47.2


