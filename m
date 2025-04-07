Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929FAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eamk+m6hItJvvYURRtivMfLvxKXUv+N3LqKXR7/o518=; b=DCpfXWskrtt+9YXQAAHKhUro5P
	3vIyF5lf1DcjePthsX6elwtEHrRLrpwlgfDsFbRACt8IqnYGZEkt89jR1K+KA23jn+0mVMsL/kVJF
	3IbRJAv09rdnPAxw+vqNwG3YnQ676VrrRBruEc8qQXbd3pXT3rEHOl4uS36A39tPvO08tzP3QO2Av
	sQPPquO0buSnbOaa03T0ZU1B3mWPFMMHas6rT9Hx4WyR/jUD9rc+rCxjfeWr/PAsNAsQlV9jhrZiu
	aZHQj7U1fRm5C6YNd8dR9gm5F8k5ZxCy/0HdiWX992tc2svxwWtWmb1SAjSJWA9hP9w0VQp7dNBTz
	X/vLZFjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1izv-0000000HEWt-0u0D;
	Mon, 07 Apr 2025 09:42:31 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hpO-0000000GzwS-1o45
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 08:27:35 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so34181725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 01:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744014453; x=1744619253; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eamk+m6hItJvvYURRtivMfLvxKXUv+N3LqKXR7/o518=;
        b=GSF5ShTkcXaRipiuRTNCP4L4fNtL3pABwdR67Qskj9f+vlgt9hUTqpuluugVYIRmuF
         0G1qJqzjs5Dll8W2BCF3HNeTG/+k1u8OGOpCtztd1l4INfVvOpB/FijiRFhVz6Q+WiHI
         zuOWgDJBX0wDiuOAtuQG4UlQQnGCop55+6S3I9peOy2VbEPcy2TH8QipEFvRsmD+U9xT
         anzYf20MXAClNHBhKW18J/x3551B1D7tmLGbs9xe4XVwZj0fIwq/dmCDxJKU6ELXrBFF
         BaNrNEgxZpNdZngyV3CNFa7L16nQCHcYP5C/I3J9spZYMWp47Kfde1RtbfPTnqla/Ylt
         9DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744014453; x=1744619253;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eamk+m6hItJvvYURRtivMfLvxKXUv+N3LqKXR7/o518=;
        b=HiT6t4hd2Qes8Tcme5ZqwHm+x38MjIWlXPWtdYlWRCDLd+W+qDejBJ8lJ9h/xp5JBv
         PpP9myINRUJF7mrzsOzUtZJDoAouimPXbVVoFyZG7QQYDkues6C7/jq5OUWdYa1Y61Vn
         YRDMt/g7dZuNqTFWJjWIrb+Cn8XsU8Jn+J6XqPg0C7LMvjbFVMBLGzk1GHgIAJNwKLFu
         mOCb5dLO6C+6DcXdRzR0e7JScT/Sn+IxSOxpH/kP1zTkZpfcai3OvQFt8eogGASm4ALf
         F7FoGl/zPpSjhRHMr0x1IqWF4OOgHw/dseIdFXTU56JS0JWUVIf2tGJZhLhOdL5KU/jF
         XWKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4fwY4oS7p4mcibQTGrwrN7on5f121a5pVobfJgv5cev30qB0C9I35xVrMw4esxR6Xk+2zs52nXsPcTA3Toufg@lists.infradead.org
X-Gm-Message-State: AOJu0Yz11BknzUWnS0eBVgmvBaxlOb1rr/hTbEbMdipqIQfJ1DfF7P+C
	KHiZL3zt+DHTT3/6gCb9nH2+Nc82kgcabs5guB9dODsruLxsGqwEjZRmrkEge4ziqS2+ivY3hQi
	ume57BYP9OdvcEf7EfQ==
X-Google-Smtp-Source: AGHT+IHEfDdtZEMKCFIiHPdGqbLmomiVEbcScZiVB7Z9bOtLoQQDsPDC5tGrnKssCX7IQ10njG1t/CVa1RWO127b
X-Received: from wmbep23.prod.google.com ([2002:a05:600c:8417:b0:43c:f6c0:3375])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46d0:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-43ed0c6ba07mr107917445e9.16.1744014452806;
 Mon, 07 Apr 2025 01:27:32 -0700 (PDT)
Date: Mon,  7 Apr 2025 09:26:58 +0100
In-Reply-To: <20250407082706.1239603-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250407082706.1239603-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407082706.1239603-2-vdonnefort@google.com>
Subject: [PATCH v3 1/9] KVM: arm64: Handle huge mappings for np-guest CMOs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_012734_468955_03A991E2 
X-CRM114-Status: UNSURE (   9.78  )
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

clean_dcache_guest_page() and invalidate_icache_guest_page() accept a
size as an argument. But they also rely on fixmap, which can only map a
single PAGE_SIZE page.

With the upcoming stage-2 huge mappings for pKVM np-guests, those
callbacks will get size > PAGE_SIZE. Loop the CMOs on a PAGE_SIZE basis
until the whole range is done.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index f34f11c720d7..6a90e7687f1f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -219,14 +219,28 @@ static void guest_s2_put_page(void *addr)
 
 static void clean_dcache_guest_page(void *va, size_t size)
 {
-	__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
-	hyp_fixmap_unmap();
+	WARN_ON(!PAGE_ALIGNED(size));
+
+	while (size) {
+		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
+					  PAGE_SIZE);
+		hyp_fixmap_unmap();
+		va += PAGE_SIZE;
+		size -= PAGE_SIZE;
+	}
 }
 
 static void invalidate_icache_guest_page(void *va, size_t size)
 {
-	__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
-	hyp_fixmap_unmap();
+	WARN_ON(!PAGE_ALIGNED(size));
+
+	while (size) {
+		__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
+					       PAGE_SIZE);
+		hyp_fixmap_unmap();
+		va += PAGE_SIZE;
+		size -= PAGE_SIZE;
+	}
 }
 
 int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
-- 
2.49.0.504.g3bcea36a83-goog


