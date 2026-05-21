Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BF9CD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bI4WpBRjlid2+/WXIKxiW5XZsp3GH+F1NkxeLmro1lk=; b=tOMuwww6k/1ozcsotEvBSFPmhS
	kH16ZIpb1FacbOjKUCXSjspKbyvUcig0LR5l8DLxlmRiW2aqnba6IlJ7eV0rtk0a+nrpdQooVPnMr
	vmGIsKdi3bhYEy1Kc/HL23h4oTYwc5qPGEdF9am1ld97c1Gcz81rk1bqrva1eATR7YCVGk1USN/Qo
	Gn2tu6stpssoALbiB5ENMNqiln9rS5OhCjpKYJW/jcd5+zAH7foHmIqxcbfTJQeqppoy/auWkMEgN
	6JntW/uxCKhVTpTD+vDSHKhyRtWgjzNxcoe1LvmwG+nezsWHgeNBze2GU7AAAHk2rJzHoJfJeTv6F
	luWM+rgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2nJ-00000007lHB-01ru;
	Thu, 21 May 2026 12:46:33 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2nE-00000007lEV-3PZR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:46:30 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48fe6894f3fso36018295e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 05:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779367587; x=1779972387; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bI4WpBRjlid2+/WXIKxiW5XZsp3GH+F1NkxeLmro1lk=;
        b=VSMajguJwE6R6CacgR/hnqTmNeboEV1fwEAec/6AVCop1y/z80KQoQ6aG4V6w348LQ
         DKHdg3V/7AL6MiXx2K32Bjex8XF4IZxldZ0TIaaBqgfT03sg1jYe706KbolvU1tbdvjk
         LSsK4XV9XN5Wtok61/CeL359jx7jCRmAjite/TCLkn0t2vY0djeILf9eSc+0gGMCBY/c
         fBRjHjU66kyJiWscenFZaO62eYSq5HbXatFR8rLgYFhux12igZ90vKof4u0ZGERXziFb
         d8QFRZwfetzwHRfHG3kYIo2/f7XIG+sZbyUKJ6DZ+suZRcs7JAeEdKMOMFX4mE03aOK3
         uFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779367587; x=1779972387;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bI4WpBRjlid2+/WXIKxiW5XZsp3GH+F1NkxeLmro1lk=;
        b=HY/kOMmN7F7mdlsLs8DI8VzoWM8RJ51UYx/zqIuUNgfKn7v48V0LcO/1LbGvGSZqXx
         EGOdc+OUCh9E3eCJxkr4jbA3EL4j6A0PB+46paM8atPkLbIAm3TpU7GPJ1YmQyrKdWuC
         Z3BWhZTeFxXIKolsfJba7/OSL6XBzzw7EDLdXNRPT7uk+bvPi3SM5+R5gYz/wq7mdv2K
         HPF8oKfAKIVf/r7K30Mt8dHMmC/DphD/xsBAjwdbkRkyqDS/UxHWsWq73mkb26ji2Cko
         d+hC53aXPN4bxjz8rJhenlIIrSSUERoRks7usiX6bqe7J0u1G5e7Qp3jZe9c1NRR1X9K
         8ISA==
X-Gm-Message-State: AOJu0YwtOn3sPsFB7N9yHzkM83cdD7ePNDvwEJJxEah2KjIbbl41owRI
	6C/UgdnhvkjatpH7TnEUPNUXjqpH4zHOKrZ8WHOC2G914RnKTCQf5xTUyUymUJokvNHX2iL66Mp
	fnijuRMFX0FRv4rjd+Kn/Pw==
X-Received: from wmqo22.prod.google.com ([2002:a05:600c:4fd6:b0:48e:5bb9:e1a4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3545:b0:48a:54a6:b29f with SMTP id 5b1f17b1804b1-490360a87admr35403785e9.17.1779367586712;
 Thu, 21 May 2026 05:46:26 -0700 (PDT)
Date: Thu, 21 May 2026 13:46:13 +0100
In-Reply-To: <20260521124613.911067-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260521124613.911067-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521124613.911067-4-vdonnefort@google.com>
Subject: [PATCH v2 3/3] KVM: arm64: Fix memory leak in hyp_trace_unload()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, Vincent Donnefort <vdonnefort@google.com>, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_054628_858180_7DE4E004 
X-CRM114-Status: UNSURE (   9.10  )
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

During trace remote loading, hyp_trace_load() allocates the descriptor
pages but fails to store the allocated size in trace_buffer->desc_size.
As a result, when unloading the trace buffer, hyp_trace_unload() calls
free_pages_exact() with a size of 0 which fails to free the memory.

Fix this by updating the descriptor size in trace_buffer->desc_size.

Fixes: 3aed038aac8d ("KVM: arm64: Add trace remote for the nVHE/pKVM hyp")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 8595f9bdb3dc..c4b3ee552131 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -249,6 +249,7 @@ static struct trace_buffer_desc *hyp_trace_load(unsigned long size, void *priv)
 		goto err_free_desc;
 
 	trace_buffer->desc = desc;
+	trace_buffer->desc_size = desc_size;
 
 	ret = hyp_trace_buffer_alloc_bpages_backing(trace_buffer, size);
 	if (ret)
@@ -298,6 +299,7 @@ static void hyp_trace_unload(struct trace_buffer_desc *desc, void *priv)
 	hyp_trace_buffer_free_bpages_backing(trace_buffer);
 	free_pages_exact(trace_buffer->desc, trace_buffer->desc_size);
 	trace_buffer->desc = NULL;
+	trace_buffer->desc_size = 0;
 }
 
 static int hyp_trace_enable_tracing(bool enable, void *priv)
-- 
2.54.0.746.g67dd491aae-goog


