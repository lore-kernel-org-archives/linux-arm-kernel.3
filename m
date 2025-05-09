Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7745C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 14:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IP6ztp/+QPDQJCJndD5+6IALkAYC7lh/LyjGCv4sMT4=; b=Lv+UyxRoJqW53B3bhu7dkHCm1O
	1o1OCpik4FWDHeFqaSvXDb17SXwNlPt5CJ7F3czfpOjzG/X7UhB9t2gOUoy543kZ8VBob8ZxJFi6m
	I3+xe0koT3pbdwztwi7OiYQIatmUkk7UHO7Qd7oMfLPgJ7i0Z0Zw/nQ3TPWz3DUH2yqfSlY8aCNAR
	IDUAdyxfYZtW/buk4AZXIrGjbJ8IhgVxSg5+OVXLH3qfrN7rIVFHkEne77+frjpvZkaEKH35DF+r6
	49aSmg31R9aK3IgtJx4Qt01ui4AfXTfuPvp/4Ef+4HW/wHCB3YHDCP67YtSx1LZ3+9e3STFBOg7tH
	D6AOqzZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOhf-00000003wY8-3oVk;
	Fri, 09 May 2025 14:27:55 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNbH-00000003iyl-0O8i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:17:16 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so14843435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 06:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796633; x=1747401433; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IP6ztp/+QPDQJCJndD5+6IALkAYC7lh/LyjGCv4sMT4=;
        b=mUpUl4lv5YBJNBGlAL5emdwjwEwuRFDPNPSFO83pJrNdWEtXYRizIXLwY0ZbH67Q33
         sib0yz2yS461zhIONLh4/bpi7C9/JnXSCAkSYQgrGQSLHUGA2b47KKfT6G9J2yYUgzu4
         xeixh3+7rOjpahrR+cZIVwZffkX6tNrIqrxZOHLanXgP1UU3uN7rWFR9N8/P4ieCFa3N
         NQTeTksMxRtHD69xzCUgMFmEGzmuerXt+Y++6DxNxYE1L5z+6yDw9c27BoxAixk+ERZN
         pbD9GqlzWAgm9ZEt+zGNyERMTkP5TsLHdN2QKJgVj5i/dVOVdujobgNwGyOnhQ2MExbh
         Zmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796633; x=1747401433;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IP6ztp/+QPDQJCJndD5+6IALkAYC7lh/LyjGCv4sMT4=;
        b=Oi56NCKidZEOGxwVSE12F+W/8BBjOGCk1XffQBEN5ZrG79RZbkpL72QXFH0bXFI4tc
         lmOVF/ZgX/srR6c7a2TspacgGmcM3LO9jqM1pfYgiEDDYWQTtAq4sqejvU6z0WToPn3A
         k98xYYWMp0QM1hIiYEKGkjHJWjHGsx6gJYw/uuLMUK/qCajIkgidyQgn990lNk2OcHXx
         7Oo71qK1R4E7KweARCHVKnIeaoiDfJOG4q91kNQFQ05OvMC9AmrBeCTNCdJqyOIFKQaV
         s8d+MRVgehRpdl97hApzaVMzGQziUcZOuf/ulhttIyox9AEImfGjA5tFOPAiBetUu5tc
         1/QA==
X-Forwarded-Encrypted: i=1; AJvYcCVt10MpyqwpMKprcNbGHqrUXmexy9JOCVF8iNLRF5r0FWA2vcqBMpNJWaMYyzBiSr5ndfXbESbR3dMaOSswl78y@lists.infradead.org
X-Gm-Message-State: AOJu0YzuF7pAZmKutx+Yvp8VTF6bRD8Os09YebIDqyhjo7VmmXg/v+ew
	Akm/ggFdCjvqgoNKJQ3N/dIx4RG4I05uOERKECSPfdT8XTEAoLIwbkrDhgQsUwSAzGpFO5CorLw
	3Kv3/643Uqm4Ikes/aA==
X-Google-Smtp-Source: AGHT+IHLhslOxv//qelYYDwLSjir28eVrMuxSKOMq29v/O516ODc7zyiSCdmfJB48+QjIQHo3PdA4xoToUMrdg/4
X-Received: from wmbep11.prod.google.com ([2002:a05:600c:840b:b0:441:b3f0:c46])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e02:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-442d6db8d1bmr24441515e9.20.1746796633145;
 Fri, 09 May 2025 06:17:13 -0700 (PDT)
Date: Fri,  9 May 2025 14:16:57 +0100
In-Reply-To: <20250509131706.2336138-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250509131706.2336138-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-2-vdonnefort@google.com>
Subject: [PATCH v4 01/10] KVM: arm64: Handle huge mappings for np-guest CMOs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_061715_128515_9F1BE035 
X-CRM114-Status: UNSURE (   9.49  )
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
index 31173c694695..23544928a637 100644
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
2.49.0.1015.ga840276032-goog


