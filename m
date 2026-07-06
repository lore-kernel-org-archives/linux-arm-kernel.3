Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E4CC44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQiMVMx4zM7AUICQBs4M4uVBI5SQsJSaNu2y2QlLlKE=; b=OC4uuINepQvKFh/fgyxZ/qXI0T
	+5I/88B5tbpBNVfN/cPcAsXJbntbL2cITOfOO3/wakTs/fTjQRsRLTft4iXcWlghRAR5/6kYT2C0x
	Y/7JxTZWHP1kL4ddqxbQL/0zqJwiB7e2BptDueZaXztFPLdM9fTQ3kebt7vPcEyyIJAo1GHZwUDAa
	6cZepCfOyB6iwNYRUPFjdex1A9Acn6vDLKmEOXPcgnQaVbIIMLQYAELJyVjISt40x+Y/SIa0E6X5I
	t2v7Y/ZwjAH9NM7HsnCWb5AKZWiwBv34oYg7aiZMUFpt6g78v+ULYdYWRw0fsVDhf5LnVWYVBBY1v
	GydR9U+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWm-0000000DFn2-0b5U;
	Mon, 06 Jul 2026 17:54:44 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWg-0000000DFdv-2ajs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:54:39 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-69848ba0656so3035713a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360475; x=1783965275; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQiMVMx4zM7AUICQBs4M4uVBI5SQsJSaNu2y2QlLlKE=;
        b=DU9D17zdUAF/h0Py+jwoRUKV3i3YM13+ULDa8R3eMH27ERnjup2DjN/nxX/q3vpcuy
         KOkWp3xT5TBme1GNxYvH51H6KhjIlcmq5Gz4EUuqRcIXzuaZaIWViOeAZ9Xe4yj7Yzdi
         81zm3Y5Z2Dd8/LBQqJme3XHFot6fglf9R/ckVzpCB559nUdyAXOWYcXxuVr49Xo/b5CS
         lrYbWWplO05h/vvyvZ7Y6Vx8WHrSLksr2dbglLIYW+N+IvaRYNZhVWoGj2uKeyCBoHze
         gtum4G78yV1C+yFVhHXDmSZwSAkfBTtUSjc5HqLa+cwxRaAVoajd0HfY7zOR/g8Jpagk
         g2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360475; x=1783965275;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TQiMVMx4zM7AUICQBs4M4uVBI5SQsJSaNu2y2QlLlKE=;
        b=DCXApgFALu0VCYogoGxziar62A1u+jrpDkmmM1EgJzLYOgoKuulnwxszgRbcdfBQxJ
         46zDnAWmBIJrm9JWug6PtFjwI2gaXN98Dlpq6ammZZ12RcfcYEYR9Om8FUZO1XdVvPcl
         jRZnUzuVTAZIeZzWnxR/cFagW8GtHzeIqOBwmvYwnDLFafI5xEDvHIOsc5ysw/B5wmUt
         UHD/4K/2pYUeKkmIhu3y+UnZgH43/udznTZy3Mi/kjGqHuPxuL3emKdkLhjRyfG8WTRC
         AgY5qEG/y4iCidAMwfnLDCc3esPQ10DoqGPylc3oZie1bbafDLacl57WQlgcKPsR7SQP
         qxIg==
X-Gm-Message-State: AOJu0YxuGuus6HXeLwZ+xpbxk5ZvGu/FRwxhauWfTx4yjx5GgndbRvtH
	3tBaMbLQjqKrwhKBs/7s9HFoGmM2tgeNY/7Z6QHEhKXPuHDerefYFCI1T+EiWVF6pUwKVvLFh5X
	8nY24ztmuoY6xe8CptJSCNg==
X-Received: from edrl12.prod.google.com ([2002:aa7:c3cc:0:b0:698:c100:5437])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:516f:b0:69a:6f1:d2f5 with SMTP id 4fb4d7f45d1cf-69a85c49758mr744077a12.40.1783360474512;
 Mon, 06 Jul 2026 10:54:34 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:54:08 +0100
In-Reply-To: <20260706175415.2604046-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175415.2604046-12-vdonnefort@google.com>
Subject: [PATCH v2 11/18] KVM: arm64: Add a shrinker for pKVM
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_105438_730673_454179A0 
X-CRM114-Status: GOOD (  11.58  )
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

Integrate the pKVM memory reclaim interface with the host's memory
management subsystem.

This allows the host to automatically recover unused memory fom the
hypervisor's heap allocator when the host is under memory pressure.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 50adfff75be8..3dc2b9d2c322 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -122,6 +122,8 @@ static bool vgic_present, kvm_arm_initialised;
 
 static DEFINE_PER_CPU(unsigned char, kvm_hyp_initialized);
 
+static struct shrinker *pkvm_shrinker;
+
 bool is_kvm_arm_initialised(void)
 {
 	return kvm_arm_initialised;
@@ -2526,8 +2528,8 @@ static void __init teardown_hyp_mode(void)
 		}
 
 		free_pages(kvm_nvhe_sym(kvm_arm_hyp_percpu_base)[cpu], nvhe_percpu_order());
-
 	}
+	shrinker_free(pkvm_shrinker);
 }
 
 static int __init do_pkvm_init(u32 hyp_va_bits)
@@ -2713,6 +2715,18 @@ static void pkvm_hyp_init_ptrauth(void)
 	}
 }
 
+static unsigned long
+pkvm_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
+{
+	return pkvm_hyp_reclaimable(PKVM_TOPUP_HYP_ALLOC) ?: SHRINK_EMPTY;
+}
+
+static unsigned long
+pkvm_shrinker_scan(struct shrinker *shrink, struct shrink_control *sc)
+{
+	return pkvm_hyp_reclaim(PKVM_TOPUP_HYP_ALLOC, sc->nr_to_scan);
+}
+
 /* Inits Hyp-mode on all online CPUs */
 static int __init init_hyp_mode(void)
 {
@@ -2883,6 +2897,16 @@ static int __init init_hyp_mode(void)
 			kvm_err("Failed to init hyp memory protection\n");
 			goto out_err;
 		}
+
+		pkvm_shrinker = shrinker_alloc(0, "pkvm");
+		if (pkvm_shrinker) {
+			pkvm_shrinker->count_objects = pkvm_shrinker_count;
+			pkvm_shrinker->scan_objects = pkvm_shrinker_scan;
+			shrinker_register(pkvm_shrinker);
+		} else {
+			kvm_err("Failed to register shrinker for pKVM\n");
+		}
+
 	}
 
 	return 0;
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


