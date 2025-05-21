Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441FFC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 12:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mT8By12179daVSqWK2hMkVVh9hr6dmc7nTaRRdzemjw=; b=XL/7WPvRONXqQ1XjzrX+kpqTQH
	QXv8g5VgBY6hvOps4qU+8VrfH4CeLrZZ7Id25Sa7rJHfnZv9taCsbpu1nZszcuZgRZF24vtYZTiOG
	XSuxm2gzEeQNslFbUo0uLH9fvG88eLwVILd/HP46cIfO3peV9rZdwKREG/oXliI7CK4gUBX8xaDCe
	8vdOPGnTDNnRn9VEKEkEKu5+ZBGKljQ2ytxZRx2X0tGDwhiuuZqZY038PeV3BGNEUGQOJrAGL85UZ
	zAyI59QVM6grzw9cpPL+2X2Guz+NZLXcVtA0myZ9OF8h7BFYNzrBUGnYTKF8lMjkXQWeYxzhQP4c5
	h0SkH7sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHiyd-0000000FqTq-0Inb;
	Wed, 21 May 2025 12:55:19 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHiuZ-0000000Fpb9-1L75
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 12:51:08 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3a362939f61so2570303f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 05:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747831865; x=1748436665; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mT8By12179daVSqWK2hMkVVh9hr6dmc7nTaRRdzemjw=;
        b=gYWwkZGnZXdIRqn0ObEzNeWy3SR6/pITwbN3Jt3L3hqoM+AvEAX4gkFSr87BNV3VXG
         qetY2JM0WLngyPZ2xjFSBoh1j57cs0PeSlctG/o2aYGKCnWSuUugjzzhdSV5TqH6GClB
         S5al+yVKjVuMiCbiecm+nCnKc4WZI1DonElcRfNUOaqlW19trfA/p4Wll5JYx0L5Lm/7
         KdGCBTfIvYdppMQmxe5/F25oHmfKJ8uWzqiZBhHDze05CJuZeXwLe2WyRL4tSWGvIvq1
         RhB+iHTBpZLCvE7qupZ9EL1p5lCaP3FzWFL8KWew3u92L8QiJ8qG5WnDNLWSctd92hw0
         Pcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831865; x=1748436665;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mT8By12179daVSqWK2hMkVVh9hr6dmc7nTaRRdzemjw=;
        b=cW4r4rXL9Anfv0BZdocKe5SCDn1bUfOOhl/SSGk9gdPcV819s33uYPaP2gUsqwZxwn
         Nwelp6wa825wXc/L7KoCXTmhZ9ki838xU/teXAZsxRqNRKr08SNmfcxqAP8ukSUqoeHR
         7uSWomWwnlIu1mbGpr/OMrSmzm8rpLSJPYD1m5VKqQVuKYeEhGYjAnwqEh8dQhCVlKb8
         6AoQde0JkVTN8Ak86Lz5/WrjEtCyGLlgK9iL4CvoQ8tnc+luEr5+Hr29/vixLlUXvZR3
         oTj/xZVZcnQEpeW2OiHfKI+zl5jX2WNf+TyFiudSq3eaN6A4dtS14UsBxSgM/3dPj7+0
         DwSw==
X-Forwarded-Encrypted: i=1; AJvYcCWqKh/o+WoJJlqot6VNRQ698oBnYyIJSGmu1/mvQKYC7eMyghVScc944mgha2t4TYuP6kZ53/fnYzZO1RWDcTN5@lists.infradead.org
X-Gm-Message-State: AOJu0YyGRBHmzsuevittlrKb1Mf3pd6Sbmd+Yd3HdmROO77ZvoNoeP0V
	EedbCS6U2m8qAXz61C6y1LrEteD0JoK2/4wr1enRzSRgqMN1LNeqTYVNXtWb8s5ZMF08UvIE1C1
	Rzgz80bnACAYdFyVE+3uCVw==
X-Google-Smtp-Source: AGHT+IFxvQXC5e2XyrcGIorm9ck7St5THzNwlwqWNw3VZYKE1iTJWfhId/APZ3vzvHKNI9cTFqGba3uEmZNIfYCd
X-Received: from wmbjg9.prod.google.com ([2002:a05:600c:a009:b0:43d:b30:d2df])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2384:b0:3a1:f684:39a7 with SMTP id ffacd0b85a97d-3a35fde361amr16068713f8f.0.1747831865060;
 Wed, 21 May 2025 05:51:05 -0700 (PDT)
Date: Wed, 21 May 2025 13:48:25 +0100
In-Reply-To: <20250521124834.1070650-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250521124834.1070650-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250521124834.1070650-2-vdonnefort@google.com>
Subject: [PATCH v6 01/10] KVM: arm64: Handle huge mappings for np-guest CMOs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_055107_356953_863374B7 
X-CRM114-Status: UNSURE (   9.47  )
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
index d1488d4e5141..c18d4f691d2b 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -219,14 +219,32 @@ static void guest_s2_put_page(void *addr)
 
 static void clean_dcache_guest_page(void *va, size_t size)
 {
-	__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
-	hyp_fixmap_unmap();
+	size += va - PTR_ALIGN_DOWN(va, PAGE_SIZE);
+	va = PTR_ALIGN_DOWN(va, PAGE_SIZE);
+	size = PAGE_ALIGN(size);
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
+	size += va - PTR_ALIGN_DOWN(va, PAGE_SIZE);
+	va = PTR_ALIGN_DOWN(va, PAGE_SIZE);
+	size = PAGE_ALIGN(size);
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
2.49.0.1112.g889b7c5bd8-goog


