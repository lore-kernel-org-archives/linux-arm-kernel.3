Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187EBC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W0Zj6kQS2ltsRWgAlubGupESY01CYbugFN5c9W4UIJU=; b=L3hxQw2qa9xhOMJZ920rOqx6Qt
	NKqYm8UXUr+l5v/dF2NTzgTFH3in3RxnuDAgSUlcSPlxXya4PCYt6lu7KvHfUmreaAn99oU9/QI0S
	xnT+U8N2XSA7jT0ShTOatb4TlKe3p9BudO1WCKrnCz45uWRrEgWJR3RCYXxy8lHT36l0lmNqsWec1
	ksK6kMwOcMJQK0K8Z5OwIXltWkg2NDjv32TXSGNfFxSelKK1CuIt/P5x/odr5cPLB5HttCtJddBCN
	ZfDn8L0D215nyw2oTzGS/dDmHxh1f5/1hArhV0jxxYUGebF43KzFI5EJthwhmzqvbZl7jQHNvMfqc
	tRxbXODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrbO-00000007Vfa-2Rzw;
	Mon, 20 Jul 2026 17:16:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrah-00000007V2J-0OTi
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Jul 2026 17:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=W0Zj6kQS2ltsRWgAlubGupESY01CYbugFN5c9W4UIJU=; b=AecKx2W6SLlX3v2D45Ke3+5f4K
	3rDsEBTKxgPJQPu+h2yzv26+CX8l5rXcVNbP+I4tobk+urKtUXwEMfk9J0nLcxvTHITFGoqv9F9QU
	tk+toQEDkZwgIA57W+xOC3z5RbGyg4bkd4GBDis2sroaHHoFnocM2OHBEsZC6bmBoESQRAJnd5hCc
	YZdszGpK/Nvp8wEu3bpzRYDQtQOkHZIL97yXvaph8G036YC6E+5GUfq76q7AMY9vqUHNN1bELxYbz
	kG67DHOQlNS6qrBrqTlcLKdDRVZJNXjlLv6QOmGLfkvjXtw64wMBnIPy+A8iqbvRpdMMamTwNq0bE
	zDH+b2Rg==;
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlrad-0000000Gpil-3JZ7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:15:42 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49244130073so104171705e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 10:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784567737; x=1785172537; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0Zj6kQS2ltsRWgAlubGupESY01CYbugFN5c9W4UIJU=;
        b=FN8+g02TxQ7E77Fl2WAo60q1RjIjOGc4VCtbfN+QojqcXm5U11K/gDlD9EAGgFgElI
         CxBzcFlVWaviRHopJRAPmEsvqLSM2jJodSTRZBlTM4LT3AYrrx2ryQBqYx0nlPQwT4Pb
         xZuviCqQTDKpuSXqcX+myCejeZ7eJkSNO4CWcJA34cjw/1VvJZUuiTlbTY6o/mU7j7Mi
         d4+kkh+8/TbMCmBZ4VlcHehU8rFMW+GoT1cjSvRQDA6Uxwpc9jO0NheQFpDO6Kkh4+Tm
         tCNc650Ojlh5/r/W/cy2TLpiAkm9ozzyIMUcHyF63nu7TFuwDTzJ1+4F5g0dk7tZXGrr
         QI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567737; x=1785172537;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0Zj6kQS2ltsRWgAlubGupESY01CYbugFN5c9W4UIJU=;
        b=OocdNYIsge+tz9puOmC1G/fAooWdNZ6NLtYoLbIQY0wyqUgePXxd9JSVAaatIe1f8K
         YAULRkjux4IJIwlicqdrh++fFdbKMskyXkzmny4uRQ5MoP50eJW+THOBb4d9RhCZ/P4s
         F5nk2GxxDKzGbTwvnsw4ubdmdj1fF1vwuHIIEIHNtLhMu1zwkoEcuU8/f1RQM40AyaQS
         s0h3QKS8q3seQhh2JrfDDB1hms0walFUPWxMsbjk5Hc/f77sHKzTybPhZlG0ARejvRxg
         PVcEjaNBWYUKpYVL4CA7yoniIbvnfommaklqZyDW/A7eiCzAC9QTqQRrWB6YxwMQ1JsI
         ygdg==
X-Forwarded-Encrypted: i=1; AHgh+RpY9WtwhaHcZX47Hp7Ic4o/K0/s0AOm0IGCV+XHUYSDorq53qRSGZH0dk+lrWQoVf56z3eSnME1Gx0dJIBeYGAT@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8E05gLHDZXUUzSNMaZopZoNod+2xS3BDTwqsWTgFxQwfY9WXE
	uh7iBbClAWNfBksi7wcvI40nnB+/b1JdMx96PbsaOwh44p2Ham5oHNa4WAgDrpgQ5jw7I/9sDdt
	XnUNBLHt4f5VQ8te3M40z1A==
X-Received: from wmpg41.prod.google.com ([2002:a05:600c:4ca9:b0:495:46dc:fbb2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f96:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-4954a3d0ac1mr173593145e9.2.1784567737244;
 Mon, 20 Jul 2026 10:15:37 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:15:11 +0100
In-Reply-To: <20260720171513.1415357-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720171513.1415357-16-vdonnefort@google.com>
Subject: [PATCH v3 15/17] KVM: arm64: Reject hyp trace descriptors with fewer
 CPUs than hyp_nr_cpus
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <fuad.tabba@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_181539_891334_B45E5137 
X-CRM114-Status: UNSURE (   8.06  )
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

While a trace descriptor with fewer CPUs than hyp_nr_cpus currently
causes no functional issue, such a configuration is invalid and would
cause the hypervisor to skip ring buffer initialization when allocating
backing pages in EL2.

Enforce nr_cpus == hyp_nr_cpus during trace descriptor validation to
guarantee that every possible CPU has a valid ring buffer descriptor.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index e7e150ab265f..6e716295247a 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -181,6 +181,9 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
 	desc_end = (void *)desc + desc_size;
 	nr_bpages = desc->bpages_backing_size / sizeof(struct simple_buffer_page);
 
+	if (desc->trace_buffer_desc.nr_cpus != hyp_nr_cpus)
+		return false;
+
 	for_each_ring_buffer_desc(rb_desc, cpu, &desc->trace_buffer_desc) {
 		/* Can we read nr_page_va? */
 		if ((void *)rb_desc + struct_size(rb_desc, page_va, 0) > desc_end)
-- 
2.55.0.229.g6434b31f56-goog


