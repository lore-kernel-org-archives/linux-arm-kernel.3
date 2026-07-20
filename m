Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6069CC44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R+jjhaJjXcsYRBacKhSmXAhe30xPnh0ihtxUkuvM67s=; b=CR/W8uGVUKKSPmO0SQFFjojPpK
	Lln9+tYElqcBTIOOsXoKiHBKC6Jr5FPj11tk80A3LY7OHkjetKrwJ9Z0cdqkeVvVvBL9o8ZscIhEh
	3kJ2yYUMKH9cehYkzkY/ZrbUBm/pBWNZY3hG7iHDFCISfxiKAdBTiXuF2nCLzWjvMnuh0Nr77zYte
	bFrPQYFTxrXFKmePXOd5uj524LyEOpBw8suuIHImtJ2nn66tW0Xd+U5ysC4viaKWfQsb3PTp4wuzC
	DkLCQJdJcxsTa/WjSZ6y7Sl07QLHx75FqwYdqfw9PUbNd2anRDbFjIXEf/RM/Ee5dteaK4eNzt5wJ
	KLNUIUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrbP-00000007VgP-05Lj;
	Mon, 20 Jul 2026 17:16:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrah-00000007V3a-3uFp
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Jul 2026 17:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=R+jjhaJjXcsYRBacKhSmXAhe30xPnh0ihtxUkuvM67s=; b=mANpSgfRYzG8o6kIqMdqih9tUY
	S3RKFNWtvsfoDSmytCXeniXjMS5ki0I7Gg+vtbVCYik0bMNQToGll0r5Uj/bc+AKfx0kUxF22ZYzb
	66S1isa962bTbI/Y4qEJwnWVSgKq6EQY3vMnXsA8Qq4sg+RgI2Yg+c/WlnfdFisvY80/DC3Qbs6lT
	ut55h7Ziu9EapKZ7JxKR/thEEi7fiWcSEzSeGFYw5jRr0ty+A6tPIxE1d43IPEOpIhJvffPh5vJBI
	BwdPq2rDv8/2u+e4zTLiUiG7L0mTEpUkW3+wbFzBWOO0+etFz7tz/oaR8yUxcj2DAyDUXbt96/Br4
	Cintjdvg==;
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlraf-0000000Gpj1-0vZY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:15:42 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-698c181a258so12658140a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 10:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784567739; x=1785172539; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+jjhaJjXcsYRBacKhSmXAhe30xPnh0ihtxUkuvM67s=;
        b=Kej4yS5TTbg/feOGB+jm7cM3B0ea+JdIcdOtR4006bSlPNjSWNC3fw8Y2MvhOL5Mx5
         eOqc8n92IqLrpFh4denxRo3ZMtTmMr1ROK9btKcU1dB2p8DmS9TbMMFVXEYrEZbURTxV
         pfERUPn27AKdme5AjKzUIyDSOcPwtxUNCXv3ix4f4jwhjyAE9zuqIQFiLpL1uK2yNOEz
         FmMAZ/FLoWeXAEPi8bg//uuL6g+IPB4juCN7OcB5FIAZoWDBGLX4RYNArfi3AqxsDQXq
         66NZQ6356PCpPgxSoKFLjkEoI04SCAtwwbRMPEAi1qTO0Faf5JwBZ/aKS+BP2+LLYhYq
         Ivww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784567739; x=1785172539;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R+jjhaJjXcsYRBacKhSmXAhe30xPnh0ihtxUkuvM67s=;
        b=Op6tk0d7Lye1jWO5khad16z6pE4u+Q1kgdAXEUwWtUDAavwVfR30+EJRZtc5+2otPw
         Yz+hjMxGq6B45ElsciI7BY3onUtGonIqHhYVHKuZwt0MwDw1kgKi9YBxPtscrSRSScnm
         18ATTfr8UY0VbaAsssQYM5gWdpGY2+/LPHh7z1CPJtKN9LTQOT5f74gQHmf8pIx3rD3v
         U0bb/0USPPaAduxyzHVWFo4E6at1+dbm1Mz6xwTwGHaB+KJh5bfyOo/SBYNFbVS9Itj8
         iDPMAF5OMyssx/OPtdyROH7FHr+KNt2yeVzgQfGKJsEc41Rq/opTeZZwBdBz/QN4PPpd
         cBgQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvXF1dyO4S55l6blSo3wltzTDgTluxmpXmxAaOzLnUiYewSs04iCL/OHGvxfQ/J3snacz1VgvHzAzcoSNaN94r@lists.infradead.org
X-Gm-Message-State: AOJu0YyOUZeJBTXfhRGPT91C7xHSDSPsIrlQ7dRfFFAX1ehZ1b931OqL
	Vky+97ipLFeTuXplpcxTqjlknd09zLCYe9v3oAIUr1ywaCWRXCqBZnWhA5A35pGGfcv2sW35kO9
	ropDjWp/u/6Hrb5QXdopB+Q==
X-Received: from edev5-n2.prod.google.com ([2002:a05:6402:a2c5:20b0:695:d237:207c])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:44da:b0:69c:72e2:5b5 with SMTP id 4fb4d7f45d1cf-69e652dd617mr4750868a12.19.1784567738554;
 Mon, 20 Jul 2026 10:15:38 -0700 (PDT)
Date: Mon, 20 Jul 2026 18:15:12 +0100
In-Reply-To: <20260720171513.1415357-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260720171513.1415357-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260720171513.1415357-17-vdonnefort@google.com>
Subject: [PATCH v3 16/17] KVM: arm64: Reject hyp trace descriptors with fewer
 than 3 pages
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, tabba@google.com, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_181541_347024_9892D745 
X-CRM114-Status: UNSURE (   9.41  )
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

A trace descriptor with 0 nr_page_va allocates a 0-size bpages
backing region, which makes the ring buffer appear unloaded. Reject
descriptors with nr_page_va < 3 in hyp_trace_desc_is_valid() as this is
in any case the lower-limit for simple_ring_buffer.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index 6e716295247a..96afa3d6de2f 100644
--- a/arch/arm64/kvm/hyp/nvhe/trace.c
+++ b/arch/arm64/kvm/hyp/nvhe/trace.c
@@ -189,6 +189,10 @@ static bool hyp_trace_desc_is_valid(struct hyp_trace_desc *desc, size_t desc_siz
 		if ((void *)rb_desc + struct_size(rb_desc, page_va, 0) > desc_end)
 			return false;
 
+		/* simple_ring_buffer_init_mm() expects at least 3 pages */
+		if (rb_desc->nr_page_va < 3)
+			return false;
+
 		/* Overflow desc? */
 		if ((void *)rb_desc + struct_size(rb_desc, page_va, rb_desc->nr_page_va) > desc_end)
 			return false;
-- 
2.55.0.229.g6434b31f56-goog


