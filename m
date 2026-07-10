Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FFAC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmF3lcAHkLWWFtDMYlM3Z+U5SlAtuG3HZzps1Mb+VH4=; b=hXuKgFjlrFhjlcUyZWAbUyqgua
	fwkszMPK7l+3atpyuUWlV503XqlWeFjNjQUqJLuQu8UU8LIZVeQhNY93JK7dgsg9bWUl5jY+YQZao
	dDV3r1CPCByjiyAOaGMU9fxFFpLehlPAf0s+nk0e4uIu6pYWGdqi+UfCnOUK2EYm5XtbGBBRnMw4B
	9lpZw3sBpn0Uu+ZfwlynKPGW1Qr67VmEax/fDO605UEy6YBAQGIg9GZoRmph7eve+d42YPtnmeaSS
	A6ORx/z5mZ/CshyFF7Bv4BCXnbPpZfmItpHW64JyJbdiK7UGk7r+WSwzspKkNpnkG633n7Y8psvh+
	euhE4LDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9ia-00000004r0P-1Xyf;
	Fri, 10 Jul 2026 11:48:32 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9iU-00000004qyG-3MlE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:48:27 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-c15c32294e1so90683166b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 04:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783684104; x=1784288904; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmF3lcAHkLWWFtDMYlM3Z+U5SlAtuG3HZzps1Mb+VH4=;
        b=IF9CNLW6ELv58NHriyyDLKAij4vLtdhLtYVkN/rlM8FgLQNI0ue3Fkge7vstFiayEF
         BQed5EK8hwgu2RRzLRpLCyb5XOK5ZDHrba/c0KsxOz9CD67xrTsvlmoxbYYxtXIwl1xO
         FUNNSJ4OVqZhPqs/LzA/8cxETcXUGiP1v9kyi6XvO9MUISHy71SxT/mRWaxqkhvAuckQ
         jMeabS/+2ykIRseByBR3jMMzBMyVd4zDvBVr2GUHLGa5RKr1OgVasYiFnHNdWCgH2/CN
         DeEmf6DBsShBYVaOgkCJ7KoSJO3nsEivZ5YF2ds7IRAEBSlHhw957pKvNbwuCot+K9yA
         5MLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783684104; x=1784288904;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HmF3lcAHkLWWFtDMYlM3Z+U5SlAtuG3HZzps1Mb+VH4=;
        b=AZfMGTAP7XouqL+33vmZNWWUmIaHRVpP3wv9F1Yf/5HlLqiJiM+bbswsD/ZlAP2wiX
         IEhWXGnE4OQQzJU+6o1lZwyb2oczEE9ndqasVCJ5VrrIoeHs6Qml+5MWanS0UJ51BSAD
         0bQYE1GrBWLQs4PSelZsVMpfNwW8Xg7RbHqgd5dOYri4AbOaz3AooJM1+3sMU5BJPLLy
         tXqXEIFqxvzzHrDItQKAEncMTPhbRAIXcl0xBM8I7n0KsOwFT1Y7aFZBMIMrZvMmC1NO
         WsMCXRXTbp6YAbnlzq8oEYMu21KMRvNQuu8NpluVCs+dPW7K7dPHSz0ukC4sKjzSvgoa
         Ving==
X-Forwarded-Encrypted: i=1; AHgh+RrBv6+hKWh4BocjqmbUveY1c+GRNqebSdJOAPlsg8ePZhw+rB+ql7FYCmyy2Vh3ISodYL1hU2v64IqITJ+Fs39p@lists.infradead.org
X-Gm-Message-State: AOJu0Yyow2ZzIoFUkNOU+e73NN2UVP6q7SSDAcMPZmsKsgdGWIoQ0Nz1
	W7BbBCUBWqLSYhZnZ9TuLSXXCQcCTStnsFOplPvxWzD2F9jpUIHxuQj+HHGvX9v+lxVjgWCyKlG
	P9FtbJy86+5JKgfWtlzJm+w==
X-Received: from ejeck4-n2.prod.google.com ([2002:a17:907:e1c4:20b0:c12:e3a1:5d4d])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:2b58:b0:c12:5e3d:4023 with SMTP id a640c23a62f3a-c15ce014b0amr372554666b.10.1783684103855;
 Fri, 10 Jul 2026 04:48:23 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:48:19 +0100
In-Reply-To: <20260710114819.2689386-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260710114819.2689386-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260710114819.2689386-3-vdonnefort@google.com>
Subject: [PATCH v2 2/2] KVM: arm64: Fix hyp_trace_desc allocation size in hyp_trace_load()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_044826_855165_438A6773 
X-CRM114-Status: GOOD (  10.91  )
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

The footprint calculated for struct hyp_trace_desc sizes only
trace_buffer_desc and do not take into account the other fields. It
worked so far thanks to the follow-up PAGE_ALIGN().

Fix the descriptor size and while at it, enforce an overflow check after
PAGE_ALIGN().

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 3aed038aac8d ("KVM: arm64: Add trace remote for the nVHE/pKVM hyp")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index a7237aca6898..22437c5e1e7b 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -235,18 +235,22 @@ static int hyp_trace_buffer_share_hyp(struct hyp_trace_buffer *trace_buffer)
 static struct trace_buffer_desc *hyp_trace_load(unsigned long size, void *priv)
 {
 	struct hyp_trace_buffer *trace_buffer = priv;
+	size_t desc_size, tb_desc_size;
 	struct hyp_trace_desc *desc;
-	size_t desc_size;
 	int ret;
 
 	if (WARN_ON(trace_buffer->desc))
 		return ERR_PTR(-EINVAL);
 
-	desc_size = trace_buffer_desc_size(size, num_possible_cpus());
+	tb_desc_size = trace_buffer_desc_size(size, num_possible_cpus());
+	desc_size = size_add(tb_desc_size, offsetof(struct hyp_trace_desc, trace_buffer_desc));
 	if (desc_size == SIZE_MAX)
 		return ERR_PTR(-E2BIG);
 
 	desc_size = PAGE_ALIGN(desc_size);
+	if (!desc_size)
+		return ERR_PTR(-E2BIG);
+
 	desc = (struct hyp_trace_desc *)alloc_pages_exact(desc_size, GFP_KERNEL);
 	if (!desc)
 		return ERR_PTR(-ENOMEM);
@@ -262,7 +266,7 @@ static struct trace_buffer_desc *hyp_trace_load(unsigned long size, void *priv)
 	if (ret)
 		goto err_free_desc;
 
-	ret = trace_remote_alloc_buffer(&desc->trace_buffer_desc, desc_size, size,
+	ret = trace_remote_alloc_buffer(&desc->trace_buffer_desc, tb_desc_size, size,
 					cpu_possible_mask);
 	if (ret)
 		goto err_free_backing;
-- 
2.55.0.795.g602f6c329a-goog


