Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD906CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 10:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VM97xwYT1dB0ZgvNb7fOqgAZXGtuRGu0qA+yv/6pRZc=; b=j7k5WnramkdGrMM36BYoE/roPV
	QIP6MZZRnC/sLneF1y3zNtxia6lHj/bM7uc/QDgrnzJJ8f0Gw1s0Q2NMLd4/sIl+qr/37QJCB3Un5
	D9vcuKqxi+veDtfZtg1yCFNILaouVkaOyMKGrlMc/7rwsN4zGgVPwPnV9Iv/jngi2NmUqw7/KD4wi
	9v6bwW8OI2owjGIHHzS/5cEYNrZhtDqt+wkoY0IR0hsSzID0WdRiFLH5LivDDItr0Od4XBw3qAiBI
	JrpADO9IuIASKm08blrPoV0KHk1Si6E/VjP1Uoospj54Vtdqt1TCzHfdF2iFkdtQkHEy6Gw6xxfeW
	na7foZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElaN-00000004AXo-1Dcy;
	Thu, 08 Oct 2026 10:42:51 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElaL-00000004AVn-11M8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 10:42:50 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a17741243eso20958205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 03:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791456167; x=1792060967; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VM97xwYT1dB0ZgvNb7fOqgAZXGtuRGu0qA+yv/6pRZc=;
        b=DijHv2TdYlbwbXeqzGtNHFZLa9yDKVRT1HRhblvZWb74QsOYwojEvn+bUFfPcZddft
         IjOOJS0Mooo7+nk9u4BK424I7//S2g88un7Q6SVdPJ8r1SsI2Z/vhWTTAJrQ4WhFbpVg
         OnEG4+lWrej/PSY7GP9VL585UXirkfGhz5umen151tcqra1LbSjrzWFFADrSaxymKhtS
         agus7aFCv7EDLPIbgpcd6ZwJSdCgeMcmfcJEoo3LPXe7X3mk7xSrNGi4lmfJp/PTs/aw
         WEIDuh+bS1laUb7yWVgeU2t4jFvt+sYogSYlk9hFTzZEo2t1rBbKc8KoawpHUJUPjgZ+
         NQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456167; x=1792060967;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VM97xwYT1dB0ZgvNb7fOqgAZXGtuRGu0qA+yv/6pRZc=;
        b=WLlB8DtR3j+HgvYu6m7+tyvCGj1pKYTHpfaHJEygZY5fNljecYr7Vma1rTAg+chxwg
         6MDlAjYa7yveoScZrt4r+jaEYPpc3E/oyE4l+mzIzZe1t6B5ky0qLHwg+a9/ADm38yH9
         TGfCjj3+/deTsLWwX6z/b4rp591O7eC+HhqZH18HOgcbh9W8Esu1UNoKXmWnUiSKQc3m
         SnaoCdzdZtTVWKETpBRZDM5i+pgTn+nz5ng1vo+TP0v1ittT7i7uNwGSfgWQZgKKD+A/
         +4nyonjZSoJHDKBxY7ipl8L1UwEYQXXC+mHkUP6pnEmUwvx2JavAwwlg3g6kLR34TivL
         BXXw==
X-Forwarded-Encrypted: i=1; AKwUvBw8lyajjh7RMdHPgKO8ldvDT8tC1mWYSW23SbLqErk5IG9m0/1P1Jy3gYltOtFSGAFwiXh8LnktUmQFJL3fUAhE@lists.infradead.org
X-Gm-Message-State: AFuF++kRP2etYO+7LYwWlCnlZQHBW3pWMtG4oQ2aHH7d15feN81lgxb6
	m2Rg5s9OqXEWjyfVSuhq9Btnn0yXu5exZ91jyUnMwDO6SsAgHth3JPjBFUlY/xLH5nsmsBHgUGm
	R1IyXfaPydtTZ5Cg0EZG8yg==
X-Received: from wmpd9.prod.google.com ([2002:a05:600c:4c09:b0:4a0:13a7:83c6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:64c6:b0:49f:cbf1:e765 with SMTP id 5b1f17b1804b1-4a18008688cmr90980165e9.0.1791456167102;
 Thu, 08 Oct 2026 03:42:47 -0700 (PDT)
Date: Thu,  8 Oct 2026 11:42:12 +0100
In-Reply-To: <20261008104212.3134550-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261008104212.3134550-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Message-ID: <20261008104212.3134550-3-vdonnefort@google.com>
Subject: [PATCH v1 2/2] KVM: arm64: Fix bpages backing allocation size in hyp_trace
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_034249_302546_DCD8EC76 
X-CRM114-Status: GOOD (  13.35  )
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

hyp_trace_buffer_alloc_bpages_backing() computes nr_bpages as
(PAGE_ALIGN(size) / PAGE_SIZE) + 1, whereas trace_remote_alloc_buffer()
takes into account the buffer page header.

Align the bpages backing allocation by using
__calc_nr_pages_ring_buffer_desc(). There's no need to validate
nr_bpages again, it has been before with trace_buffer_desc_size().

Fixes: 3aed038aac8d ("KVM: arm64: Add trace remote for the nVHE/pKVM hyp")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp_trace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 26fc13c16458..b9404496f977 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -146,8 +146,8 @@ static void __unshare_page(unsigned long va)
 
 static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_buffer, size_t size)
 {
+	unsigned long nr_bpages;
 	size_t backing_size;
-	int nr_bpages;
 	void *start;
 	int ret;
 
@@ -157,7 +157,7 @@ static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_
 		return 0;
 	}
 
-	nr_bpages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
+	nr_bpages = __calc_nr_pages_ring_buffer_desc(size);
 	backing_size = PAGE_ALIGN(sizeof(struct simple_buffer_page) * nr_bpages *
 				  num_possible_cpus());
 
-- 
2.56.0.360.g66cac248cb-goog


