Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382C4C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boWUnC75AglyvSxymfq6WOxHhiCHfMqe3a7p6Cadurk=; b=UqQyH6WqN9JlWR8KsAyzf1AV/K
	nDslbHzJd0QOk1Y3A7WVVmFDSbN0eyZri20bR150VoxSNj0BYPMcM6+jGsoXxt9ks2z2ko3l+oOpd
	p3u8fMps0BT+KGrCSMKj1iEu88e7e8mokC4pqUxphPEHHbSTezaHA22JlgNtGDDehXNVu7EDUYsSa
	l2Lz8XL1kkYSoX+Zo+/dv3aNoerBvi++6uRmfOpqojH7cW5CEDsfkj2slRrtl6eAcxXFQ0mzRMs7C
	xueWCRmmpfLFINrIIgIlalT9nP/eM7c8O6LMvsubIB8vqrxYytzVqLsGB1TTbieXV1Ek8RTtO80zO
	dlhUGjrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYHP-0000000Dn66-0fUx;
	Mon, 24 Feb 2025 13:13:51 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmXMx-0000000DeJZ-3gB2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 12:15:33 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4394b2c19ccso33627225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 04:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740399330; x=1741004130; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=boWUnC75AglyvSxymfq6WOxHhiCHfMqe3a7p6Cadurk=;
        b=w6J7MxyWcr8CgfF4ooxdJCZyecJs6xqvIKjhTNcb4cIzKY2akUZPU8JuK6z5vVN9RX
         s7LH5RE5VdCWBbPU20I/vfMvbF4d+Iidk2NT3ohhB5tZMNyHuFJVbTBdAJwmvTR7SeNd
         XeYTMb5UP8SdbuFRxyUEqDLshW4RQ7zlWWnyoZFklvRGKBi0K4w981Ydq1NTdqpjbtb4
         /bh+x7BLB5uxmLRKcqIDRfpNcR1pgqIFCknkzVxXNG9jPRKC53Px8OjS2zUoTllQYca4
         /GYn5YkOKVtHa3sf5Hl7hkJWzHHU9w6Qg83AtRHHO5ctrI3SfUS/dY2kR7MYklfRMxL0
         mejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740399330; x=1741004130;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=boWUnC75AglyvSxymfq6WOxHhiCHfMqe3a7p6Cadurk=;
        b=cxdC6aPqgIxlEjSn4NF8JIYpnrlG+9zjYbuVLowh3HeAAE70H5+Q9C3qIJ2N9c8TqP
         Q1T1fgOWysr0n+HOJRFhfRsMBmiXyjgzhvWcUGZdCRy+p3ETpmiujdIOh0s9enNd4/pd
         9oHpU5XUT3xRjsD0wG7cER4gpdo5fo5Ft/GW/AbaNLweTR9g7bl8dx9vLNqduUH6NdUW
         FXHbGMCqsUZYNkMv5FI4TeEFFhYKjxd93tg7jDVVYo7zLr9fN1VF+6Bo3lsLFhwW/Wtm
         OIrGF/iecTBhWuglgYZZPYeHQBF9zui536jMr3cB0H8wzgfp2x71dptzwXXkP1HgFWP3
         5UfA==
X-Forwarded-Encrypted: i=1; AJvYcCWyn6ecJtdMJ5pcG6LL+LcAYfWPz+pZ5HMXiEjMBgiGYaPY7PhnJMA+MyMq+6DfJFR1gcwm+7hcwFyU56GQxDxY@lists.infradead.org
X-Gm-Message-State: AOJu0YwpmqwSLecYOobC1VOGv1Ln4fWchcvUCbmCH2O/o/XJt70RkFSe
	A086dfZQhFB90OSfvjN4pfYxRbokyWHBZHhDabkUgmPZN4n9Ct+4+DZoRPOoC6DkTOoRn3AQYky
	BM35U0pchLGTEfOHEPg==
X-Google-Smtp-Source: AGHT+IEZCk3oy+HQSHrsEDAqwXlupd0xHmeS8IuL0N9dhMMAdmGlo9OyR+iiK51V+OKl7+wJfLEr+VwrJuInfXQr
X-Received: from wmbjg14.prod.google.com ([2002:a05:600c:a00e:b0:439:4366:35c2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f88:b0:439:96aa:e502 with SMTP id 5b1f17b1804b1-439ae1e6a2fmr119293615e9.12.1740399330189;
 Mon, 24 Feb 2025 04:15:30 -0800 (PST)
Date: Mon, 24 Feb 2025 12:13:45 +0000
In-Reply-To: <20250224121353.98697-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250224121353.98697-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250224121353.98697-4-vdonnefort@google.com>
Subject: [PATCH 03/11] KVM: arm64: Support unaligned fixmap in the nVHE hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_041531_911231_11337C3E 
X-CRM114-Status: UNSURE (   7.14  )
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

Return the fixmap VA with the page offset, instead of the page base
address.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index f41c7440b34b..720cc3b36596 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -240,7 +240,7 @@ void *hyp_fixmap_map(phys_addr_t phys)
 	WRITE_ONCE(*ptep, pte);
 	dsb(ishst);
 
-	return (void *)slot->addr;
+	return (void *)slot->addr + offset_in_page(phys);
 }
 
 static void fixmap_clear_slot(struct hyp_fixmap_slot *slot)
-- 
2.48.1.601.g30ceb7b040-goog


