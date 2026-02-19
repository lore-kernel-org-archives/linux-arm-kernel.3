Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D18E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 15:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F2gZpXDniUcFidBjYaLwAM4ahhSMDy4xfU2xFo+BZpQ=; b=ZwwBmUDqm0aaci3tp4721s1a1X
	LIQ4kY2fJOa31n2ohhQ/vmFaLEBlvSWEc0+S7sSFjMbEINeatj07Q8wAHqAS4eiMcgux8yYYvwBpN
	I19TiyZpC4Z8Ke+BH1N9OvFzHHYB7p0ZC6gxG6z2fMljVKWBhLVt19Qq8lL0xWYXOiml9NBJQYEvK
	8nmpISWsvtnw7MkE1pSs67KWD3bh7dQu3dWTeKtjV4YPZGvsHr8qQ6UjaFRvRwXC1z+EACrPIiIJw
	RntfotUrvokVzFMwWqZvp0PSmb83IdOBoOLARbGA99HSI7EsxwugLslY29WGgX9HunFbes+znKhNM
	iQEXv52g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5Zh-0000000BVcU-2EJT;
	Thu, 19 Feb 2026 15:04:17 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt5ZI-0000000BV67-1b84
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 15:03:59 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-b885979bfa9so96163366b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 07:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771513429; x=1772118229; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F2gZpXDniUcFidBjYaLwAM4ahhSMDy4xfU2xFo+BZpQ=;
        b=c3eT8vyDdqbPNNSPTx8jDmcszX8D8cdOG/pKnLZTKIpMqhd0hzPEYGhyy5ukvPYyqJ
         X82kFXXaZyGngjN8B3q3bl8UeTzI6pww0u7VrwI0tPixuugECxsgwaxXYWIUlv2k5p5h
         l1PZC7XhHPoCoERUW8mkeoOdtOgcWY3vy5+KopNAZUl3qC3ugCGW8LcS5jYRFXPz6ln9
         WuGtuLlt5b4jpW5JmPW+qcjEF8s5/hhwKaWPrldsy6H2fDk8Yzm3ZKrEG8eeMMNxxqEa
         K2J4J9cEfD8C1ULO/kg8/RIZ5Pzhjrm0sVl3RmA27pPk58JbMYhE4UBy1It4rZksiBbf
         0aeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771513429; x=1772118229;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2gZpXDniUcFidBjYaLwAM4ahhSMDy4xfU2xFo+BZpQ=;
        b=XlZFhUYlrZjx3kmEjp43uNvql1QZOigXjHwshspHxw7x6c/iUDz0DV1KCb27+dOMYp
         tijc/Qy4zaXscuSg6mL1o0fNs5tjsfVKxzJF2TFSYIDQOtYb8g5r0DZYGG62muHpZ/qV
         G1J8Fj8ZYfQaioyoojBHw6ruUJ7+9oqvPZIgVja6H/RGzRtnpQb5h4eDJW9H8QHnEwUe
         hyHiYm1eXwqP7nqsXVq95jglCWJuCHAaFp3Zwvb1/HLAiKG7GGMjH/lnobc0UxPTChlm
         CrUX2Ft2Msg/65D6sdKvNT4zRvo27kggD3fNGH08dJxg7F73m3wUWIOFpYE9BYJW0iDu
         IdgA==
X-Forwarded-Encrypted: i=1; AJvYcCVpKKlWaPX0dLjUpqXAAjIxGrCMAh0D/+A7IjnCjt83x0WAtJEtpzWky72sLXkMJFlOXgdIspfBXnbM0RhbII1L@lists.infradead.org
X-Gm-Message-State: AOJu0YzPrIpUvYmnSgpbZtfzpukVbIDyCZRmC5rj9Gei6yoOJM05v1+G
	ELL3zaIvVH4Gq/1aLyGnZ7gnwQSRxpTSGRmq/qfQth6Oh7Uy/wOMh5mUw20EAWBaZWmAr9nkKDk
	gcllsk1gvcqoHjkHyp5welQ==
X-Received: from ejcfr47.prod.google.com ([2002:a17:906:892f:b0:b7a:21aa:8969])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:86aa:b0:b8d:e10d:6f96 with SMTP id a640c23a62f3a-b903dc94b3bmr358008266b.32.1771513428793;
 Thu, 19 Feb 2026 07:03:48 -0800 (PST)
Date: Thu, 19 Feb 2026 15:02:59 +0000
In-Reply-To: <20260219150307.14538-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260219150307.14538-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
Message-ID: <20260219150307.14538-23-vdonnefort@google.com>
Subject: [PATCH v12 22/30] KVM: arm64: Support unaligned fixmap in the pKVM hyp
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
X-CRM114-CacheID: sfid-20260219_070352_541668_C395C406 
X-CRM114-Status: UNSURE (   9.44  )
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
2.53.0.335.g19a08e0c02-goog


