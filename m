Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2051FD116FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q0u7iZOSRB+/DoXWsZu1l6FhJZS9KBdr/uN7Ps8a3zY=; b=NvqnZQYT1YhkEUf9MNF02PkyWM
	ra5pvCksAuMaUstSOSX9NvDYpsBUtGGmRVSscjA+PyvEn/mDSWNZawMMoOZomSm1LutUo98eTGeYu
	A5hJD9KNlvj7xAb7UxP92Cs7TGg2BP4EPjqrwJbBIZfyy5hezHEuG64uD2jZgaNnrZfpPA4fvdKkQ
	HRWulEsq6tV4Lj0pQ7e+upbsSvZScR9OG8/A5G0lKHtB3KPS7TrhqSGYtKzyugr2+juqQtuE9Khe/
	D13JFwjZ92wOKE0uL5GcNs5Pk5X8nvRIKoREeSikiFaNbIc/FYZqAK7h7GvFgBcdkUs1Hzyb8wLiu
	FiLUZ4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMp4-000000058tb-1lsW;
	Tue, 02 Dec 2025 09:37:26 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQMoa-000000058H1-0I2n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:37:04 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-42e2e50cfaeso1460662f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 01:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764668213; x=1765273013; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q0u7iZOSRB+/DoXWsZu1l6FhJZS9KBdr/uN7Ps8a3zY=;
        b=s4OsSsaGglFg72/lPRFa9NOmaMrVOYIeBWzoBEBSMkkJPwp1YuqoOCvg7yQgiyoDuq
         Dn0xRZ4vRv9DBT057n7JCwE93dlyCIxwei/uHrxKGHFNG5cCYM8tp69OrjM3n4kUPdWI
         a/G5mL2Ig9aHWCEpPr7Dm7PW8IoU5FWbCqSQtg8VhhVPwWdYUrn7wsFooEtPf5Io0Jks
         mOS9Bh25mCBFxhYOwp6IME0njnMsl46Tg1UBhNVIjiUw30dPRBdbgFNE/vxhmnDgcyKo
         aPPOkZTAWRDE6kSUeVSB3RZ5R1X7/q+8tSspkeiIw8ONnXn2YHJZIPsn50BNzQnDHRoP
         33tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764668213; x=1765273013;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q0u7iZOSRB+/DoXWsZu1l6FhJZS9KBdr/uN7Ps8a3zY=;
        b=pKg/jZ8de6FmMF09o1v/vnapqv8E7r+WwSTkt4HNLEbBRasMjEZ6FmEHedCUJ+jqv8
         HWFjowPtp62+FukdTVgXI7qoebLPFk9BqS54JcMTcI8XKTA9zauW73aG3FZNICmJpenR
         Iw1xACIkETk3mpqe+U/9E3UZnqxin6XPQJaCztOczZoNKXagoMaIjU4OcmRMVj5A6q3M
         V5Ux8/V9m/fA2zgau+Tm9lbk0TKysclgQy0QZwBQvkXsX94XpIivNBls55/EmgCkWpli
         1bza0MwmzaRJ0cwED/LWerSkWc+nmEwiDIhzGaGWp6H6yWcdSkA/AzNxQnOInWZin+/s
         jAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI2fx0DqMlJpBXgTcnkIrGMKY5wlue1mLdWe9DXGD/letB1vLCqmDxTgsmaWvx65r3WOkM80Pufe1ndH12EwBD@lists.infradead.org
X-Gm-Message-State: AOJu0YyZZXvLXQj+fo60kleAMRBXnb+sp4YIsdN6rDWUqrOkP5w/vYQf
	edmfHcUdwBwB8Cc91peFMwOOYw6mKGxA+QP8pJ/uUhaFaoouDkbuZpK1L56ivzXyxbzY+rqWUgN
	hf+SoCOlQlehbPuyAyIulSw==
X-Google-Smtp-Source: AGHT+IFuFDiK5O/H4DCPpcGsIXjLLUp67EQUdvqZzMXYtR/E9T82F4OhwcYQh3aVnhXs8gEpu7agTyI46dk1Z4AU
X-Received: from wmom17.prod.google.com ([2002:a05:600c:4611:b0:477:40c1:3e61])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fce:b0:477:9aeb:6a8f with SMTP id 5b1f17b1804b1-47904ad9438mr274538365e9.9.1764668212914;
 Tue, 02 Dec 2025 01:36:52 -0800 (PST)
Date: Tue,  2 Dec 2025 09:36:15 +0000
In-Reply-To: <20251202093623.2337860-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20251202093623.2337860-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
Message-ID: <20251202093623.2337860-23-vdonnefort@google.com>
Subject: [PATCH v9 22/30] KVM: arm64: Support unaligned fixmap in the pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	aneesh.kumar@kernel.org, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_013656_209402_13FCACE9 
X-CRM114-Status: UNSURE (   9.42  )
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
address. This allows to use hyp_fixmap_map() seamlessly regardless of
the address alignment. While at it, do the same for hyp_fixblock_map().

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index ae8391baebc3..a6eafd72f87c 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -244,7 +244,7 @@ static void *fixmap_map_slot(struct hyp_fixmap_slot *slot, phys_addr_t phys)
 
 void *hyp_fixmap_map(phys_addr_t phys)
 {
-	return fixmap_map_slot(this_cpu_ptr(&fixmap_slots), phys);
+	return fixmap_map_slot(this_cpu_ptr(&fixmap_slots), phys) + offset_in_page(phys);
 }
 
 static void fixmap_clear_slot(struct hyp_fixmap_slot *slot)
@@ -366,7 +366,7 @@ void *hyp_fixblock_map(phys_addr_t phys, size_t *size)
 #ifdef HAS_FIXBLOCK
 	*size = PMD_SIZE;
 	hyp_spin_lock(&hyp_fixblock_lock);
-	return fixmap_map_slot(&hyp_fixblock_slot, phys);
+	return fixmap_map_slot(&hyp_fixblock_slot, phys) + offset_in_page(phys);
 #else
 	*size = PAGE_SIZE;
 	return hyp_fixmap_map(phys);
-- 
2.52.0.107.ga0afd4fd5b-goog


