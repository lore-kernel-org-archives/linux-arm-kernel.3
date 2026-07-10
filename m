Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E1BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pO49h6zt1CtwH6yZzZiqbOv4e+R2v5hOGdBf1CKP83k=; b=F9o3tI7boSns6K/+Bn54cLAoPF
	BDcMPPqoPvlL2hDAcaKqNazE1gQ0TiBxO1WFAqzUfNf3P1e8CBUe62dgCeQjjxn0tknsI6vNTI/9+
	QovGQbBFBvqNe8ezFTc9YEP7CfH4Zl6SWYfODgM0XsR5JVfkBtakg4aqs5V1IGwVxNKh8AjPSv3zO
	YECEnk2TIDOtGFI5ycGm8dy5u64FcygrWQerikxCW39PrqZggY94Wr5wY2rUCCfELzIE5enhdTTJd
	MgoVHozj0oRqMy9KxacSZO+8VNpW5E87L11COy18AUPtV9EMepi58ns2ZVUumvGgX3UH8HlMEBV32
	d5tLr6/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9ia-00000004r0B-0x8r;
	Fri, 10 Jul 2026 11:48:32 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9iT-00000004qxu-1nmC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:48:27 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-c15f0aea084so74116866b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 04:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783684103; x=1784288903; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pO49h6zt1CtwH6yZzZiqbOv4e+R2v5hOGdBf1CKP83k=;
        b=qAbAuDjZiXvRSMy+nCPd2KIK/B8iy+s3EelZt3uyfUq7L9HXkiSp83DOTrUsiRuQvW
         sHB/MTKK+UXPb+5d0ain+U0nv8RQu0ijgFOyJ8IW8fgXUWDGc8/s39xF52hkbpZG2Jq0
         xIOOdc63oK8CF+NfR3bWBjVeLxDlGFkCxzqyxS77OsaPhbsshihqL8J3y6DgrppScWr3
         sZ+bWKOZoIs9vPDdAOQXBDW4Wkbbfnes/j5v1+raNbWN85OrdZOByoH/d38TktZRrJtw
         JAQS4901AEvsQNazgtOx4QjEegDOALm84lYer0p46oVN6KtDWt1LN90zv8xk07JPeAsv
         ZyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783684103; x=1784288903;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pO49h6zt1CtwH6yZzZiqbOv4e+R2v5hOGdBf1CKP83k=;
        b=Ws2ro4tfMjVHDkFQ/633wSGsf15PVMqSaIIxKRnpvSEx9dxxIA68UIC43zoBeBNJfA
         oFEALTtU9+NccUhN1236bkucJEPbD9EGBpLJmHXHrd3KMLCbmwda2pzYIiSlJonxw0Uw
         rp9JzmxxDf5+Wq6uVJwsuXZdg9/1bIbNP1k+lit8PLQlsHHlRz5anFRY1gTd/RGikL20
         j4NJDfSO1Q8R6nDteoG4HlYvJinrAScq/blQt/zIPezP07i+q6lkg1Z0MZDbhv/VcDnx
         wmbKqtc8lstLUANV5RturvIlHcaXOvZb+RVPeXOff4jp5PpWsu8H8soxvgf/guTZrvoH
         raTw==
X-Forwarded-Encrypted: i=1; AHgh+RrsiOipXgp4T0QXCoEgARskV/W1JFukX2glmHN6XdmCdTX9QAUuSczQ93z/fxsghcd1G5Dp7aXE3XhOwJ2OLj+v@lists.infradead.org
X-Gm-Message-State: AOJu0YxXKiaWpq9pYxDwWw0uSmjFKykX6ev9Lrt4+dRee07P0uhkwopU
	8pVrK97lUgjJDmtERs/HgOn25QWJg/h5gG5ukEjDY1rNUie2yAa/NdfY2rW4FgFWLfh6BdWyJ/w
	Q2Y3yqvZccxw3RJfIhUeTkw==
X-Received: from edwl20.prod.google.com ([2002:a05:6402:1254:b0:69a:a01c:ff1e])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:146a:b0:698:5f35:a8e0 with SMTP id 4fb4d7f45d1cf-69ab445385emr4571488a12.6.1783684102743;
 Fri, 10 Jul 2026 04:48:22 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:48:18 +0100
In-Reply-To: <20260710114819.2689386-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260710114819.2689386-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260710114819.2689386-2-vdonnefort@google.com>
Subject: [PATCH v2 1/2] KVM: arm64: Fix potential leak in hyp_trace_buffer_alloc_bpages_backing
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, Sashiko <sashiko-bot@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_044825_473853_C6B1FA9F 
X-CRM114-Status: UNSURE (   9.29  )
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

In the very unlikely event of a failure in __map_hyp, the allocated
backing pages are leaked in hyp_trace_buffer_alloc_bpages_backing(). Fix
this by freeing the pages on error.

Fixes: 3aed038aac8d ("KVM: arm64: Add trace remote for the nVHE/pKVM hyp")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 2411b4c32932..a7237aca6898 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -160,6 +160,7 @@ static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_
 	int nr_bpages = (PAGE_ALIGN(size) / PAGE_SIZE) + 1;
 	size_t backing_size;
 	void *start;
+	int ret;
 
 	backing_size = PAGE_ALIGN(sizeof(struct simple_buffer_page) * nr_bpages *
 				  num_possible_cpus());
@@ -168,10 +169,16 @@ static int hyp_trace_buffer_alloc_bpages_backing(struct hyp_trace_buffer *trace_
 	if (!start)
 		return -ENOMEM;
 
+	ret = __map_hyp(start, backing_size);
+	if (ret) {
+		free_pages_exact(start, backing_size);
+		return ret;
+	}
+
 	trace_buffer->desc->bpages_backing_start = (unsigned long)start;
 	trace_buffer->desc->bpages_backing_size = backing_size;
 
-	return __map_hyp(start, backing_size);
+	return ret;
 }
 
 static void hyp_trace_buffer_free_bpages_backing(struct hyp_trace_buffer *trace_buffer)
-- 
2.55.0.795.g602f6c329a-goog


