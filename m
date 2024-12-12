Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2C5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 18:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvcwClhLv6xGoczW4PJAIpjHHqg4M8M55H3dQR9JizI=; b=dATq5lzyZ2WlrgmSBLj1J6VHgH
	DekEfXIKr1pv0Edxdj7E/DupE9YomzHidYr38l0ee7gwQMLha90/f2nQLfj6HGT8ueceLKud6VCph
	k5eecdhx3eM+v17tB+JJjlWz7oLOvRJX9u23uS5IMHwwajqNVjGwLHiB4usN/uZPqYtUjqj9VJ4B9
	u+HIfbD3sF1Ld5pNmJMN0V0u7oGOWof1HYd0Fl8Qq+mL0TxgtAtH7+ica5e+s7Rfv+4f26vOqOSP/
	fYl9+ygQ22AtnpY9ALY4TsgJ6pD7oyc2P6ipQ4z3xbO1D31N7VMl3rA20ma+lGtdTf4peYNNlK8Zs
	dizv2I2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnl2-00000001Ner-3lp3;
	Thu, 12 Dec 2024 18:17:52 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnYj-00000001JcD-02Cz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 18:05:10 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-385dcae001fso443713f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Dec 2024 10:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734026707; x=1734631507; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kvcwClhLv6xGoczW4PJAIpjHHqg4M8M55H3dQR9JizI=;
        b=Ci3NKIwAG5mjh6Yd5ozwz66RjqdngjB3LHS85NULQCYhVcBGOOqEC6INvS6TRvfxXC
         XDq04QUdapb69g8e3HHF2y8//zFUBcaJ3BNlRAtmEhi4FCdp8eF8kIqBF519kMqzz+h8
         thVW7Tro19pN1Y857ALXrJMkILgNEo4bq+rwHPQ5Ef8HopoZ24N3o5pfuZRFLhJk7KRh
         eZBjhhIy17tUKsM5X1219ciRzxXyC4Irga5/slpOZ3Lq5VingAlmVglqIdEhp5s3gBlA
         0Wj5siHleCQjxddb+sho6pon4eROGz7R7G1SWLJJiTj8p/8XTpq2dN42zCKaRxx1Bwc4
         JZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734026707; x=1734631507;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvcwClhLv6xGoczW4PJAIpjHHqg4M8M55H3dQR9JizI=;
        b=vKtR+TGHhhMsuGEs21F64fnvKrTjNz9/J7mGDgNxFp+cy1IOzWCNkMRQwgd20BIOIL
         JWO7b8waDpoPCg93ZKA13F4vJ1s461zS6VvnU6yNIt2pzVHEtllv7cVRn4TEfNtuusMU
         kymNo955GleWtPVhU/TgQpd9iSw95oG154WFut5RKGOlpYmuvwp0GKQHxux9IiEAomHB
         NqdTf7z5S/3nvrW+GKbWB7/sBX2Dj2CbSUgr67FpHaaMiSTiixHEWDEeap980vKeBCAX
         8wtWcvECllC9AkX+RGIsSDVoD9ZRrsnXE9u5iry6+xwFM1Eepj9iSD05tuqw2NGrQ/r2
         XBPg==
X-Forwarded-Encrypted: i=1; AJvYcCX6ceiaKkWB7dg7xAQVn5FeBxOytMiP40abkP90SXXqe9lWNcCqjP2gVTQoEznTEY5qTUZDWIQUupTiSGZqEJLV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvyvw1YCzxKuru6BbApq8GT7UMMaWvHnY2yxJ7BdCaHOyp5ZoD
	TJVUds+2/t0iIvZpXxFlKnmHJ5lxh+vuCIueeYMCDL/h5bBkDV5fsK6WjN9OpQcsWjjxMV07ir4
	+v/+WcGIO6Q==
X-Google-Smtp-Source: AGHT+IE10scUEuEcCRD+5w6H2L6RFmN8j1xObFtBxLC8p2WLtJlxovv9B58XfdIQzXv891vozkqFrRDj+yh8bw==
X-Received: from wrvj17.prod.google.com ([2002:a05:6000:1bd1:b0:386:3835:9fda])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:280d:b0:385:ec89:2f07 with SMTP id ffacd0b85a97d-3864cea56c5mr4112209f8f.32.1734026707185;
 Thu, 12 Dec 2024 10:05:07 -0800 (PST)
Date: Thu, 12 Dec 2024 18:03:35 +0000
In-Reply-To: <20241212180423.1578358-1-smostafa@google.com>
Mime-Version: 1.0
References: <20241212180423.1578358-1-smostafa@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241212180423.1578358-12-smostafa@google.com>
Subject: [RFC PATCH v2 11/58] KVM: arm64: pkvm: Add pkvm_udelay()
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca, 
	nicolinc@nvidia.com, vdonnefort@google.com, qperret@google.com, 
	tabba@google.com, danielmentz@google.com, tzukui@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_100509_046625_4FCEB0C4 
X-CRM114-Status: GOOD (  16.29  )
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Add a simple delay loop for drivers.

This could use more work. It should be possible to insert a wfe and save
power, but I haven't studied whether it is safe to do so with the host
in control of the event stream. The SMMU driver will use wfe anyway for
frequent waits (provided the implementation can send command queue
events).

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  3 ++
 arch/arm64/kvm/hyp/nvhe/setup.c        |  4 +++
 arch/arm64/kvm/hyp/nvhe/timer-sr.c     | 42 ++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index 3b515ce4c433..8a5554615e40 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -143,4 +143,7 @@ int pkvm_load_pvmfw_pages(struct pkvm_hyp_vm *vm, u64 ipa, phys_addr_t phys,
 			  u64 size);
 void pkvm_poison_pvmfw_pages(void);
 
+int pkvm_timer_init(void);
+void pkvm_udelay(unsigned long usecs);
+
 #endif /* __ARM64_KVM_NVHE_PKVM_H__ */
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 46dd68161979..9d09f5f471b9 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -356,6 +356,10 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
+	ret = pkvm_timer_init();
+	if (ret)
+		goto out;
+
 	ret = fix_host_ownership();
 	if (ret)
 		goto out;
diff --git a/arch/arm64/kvm/hyp/nvhe/timer-sr.c b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
index 3aaab20ae5b4..732beb5fe24b 100644
--- a/arch/arm64/kvm/hyp/nvhe/timer-sr.c
+++ b/arch/arm64/kvm/hyp/nvhe/timer-sr.c
@@ -11,6 +11,10 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
+#include <nvhe/pkvm.h>
+
+static u32 timer_freq;
+
 void __kvm_timer_set_cntvoff(u64 cntvoff)
 {
 	write_sysreg(cntvoff, cntvoff_el2);
@@ -60,3 +64,41 @@ void __timer_enable_traps(struct kvm_vcpu *vcpu)
 
 	sysreg_clear_set(cnthctl_el2, clr, set);
 }
+
+static u64 pkvm_ticks_get(void)
+{
+	return __arch_counter_get_cntvct();
+}
+
+#define SEC_TO_US 1000000
+
+int pkvm_timer_init(void)
+{
+	timer_freq = read_sysreg(cntfrq_el0);
+	/*
+	 * TODO: The highest privileged level is supposed to initialize this
+	 * register. But on some systems (which?), this information is only
+	 * contained in the device-tree, so we'll need to find it out some other
+	 * way.
+	 */
+	if (!timer_freq || timer_freq < SEC_TO_US)
+		return -ENODEV;
+	return 0;
+}
+
+#define pkvm_time_us_to_ticks(us) ((u64)(us) * timer_freq / SEC_TO_US)
+
+void pkvm_udelay(unsigned long usecs)
+{
+	u64 ticks = pkvm_time_us_to_ticks(usecs);
+	u64 start = pkvm_ticks_get();
+
+	while (true) {
+		u64 cur = pkvm_ticks_get();
+
+		if ((cur - start) >= ticks || cur < start)
+			break;
+		/* TODO wfe */
+		cpu_relax();
+	}
+}
-- 
2.47.0.338.g60cca15819-goog


