Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E97CF65DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHa7j/CKtQd71sr9sGVN3KtiKJalnxGKPFOliEGiPCE=; b=17JFpKE74Mo2DxmItfMWgqGMsj
	wTkurzTI7Rm36Ye1UP1AZsNJqq9Ymqpz2vRRZxAPBZjJpXl0XkqkoKMqrXJ2YGEjuvYxStlZ0U4jt
	D9RCWF7Nmnr8Pamhaachl1aLfnHkzlYFc/NkBk9+LrubkhMrPnpAyJmgYK2cPVG5cETjzb4tj87gm
	tpMDw1mOJD4D/aa6jaxxyJAARMdtVH6aV6jlZwgOIidmFE9mMy3xwIccO4zy9pwePV8K8Kz+uATca
	kl22lFRgH0Fy5tpDRq3fV4h96aLzJaCWEU73wRP/3gyXMtTXb6habZKlQn+Dl35M0bY6YjwO6Rkww
	5H4NJNuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5z-0000000CKFc-11s0;
	Mon, 26 Jan 2026 10:45:23 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkK5Q-0000000CJZt-38fE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:44:51 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-47ee868f5adso45987715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769424286; x=1770029086; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JHa7j/CKtQd71sr9sGVN3KtiKJalnxGKPFOliEGiPCE=;
        b=SzkVhL1yl/b8p6E6IygDHDUHL/xnBiJ/1DJO4XSPkORDDNp5VynAsXCHebnaB+7Csz
         0wpmtI8Q1ksoAXasdCOLz9up3FZgkGAIe1m+JlwDCZMVgZItRrLY+VQvUa5yOWNiyT3a
         wknB1shgvFZPppqco37OQ+X+eK0+tj98yz5YCj0n7SOPMtPoYu2G6DnmGpEPka6UR2vT
         D2vhguRUWGVdss/XgRhIPL9LaHw+d8RKy9yEVRT0y8GGLJYdYalO62Dp9JDEO9P+Ru8Q
         TU88EUeyj1eH7yPDuEs4m1wU7vJL4vtXln9SlzyXGXuR8AmPp0y0kBuEz7V5H0V3kFKd
         fF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769424286; x=1770029086;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JHa7j/CKtQd71sr9sGVN3KtiKJalnxGKPFOliEGiPCE=;
        b=l+Uq0dHbDRtV7YDxxmgNyfoGX8CS1J4tFGAACZ1k68z2bjqqyYuxyhjf6ZmfbZe6tI
         bshKbaC0SbjgI0IpI/bY3Er0cbUhSXzZH3B2abiFpdZRdZwsaZ9yZRJPjmztaSViFnjp
         dWgQl6ugCJb9hoRScFXAozAa+Wj8FLArFSy+tw83WJj6MntL/czVbFdvx7rqsJ4sn5y5
         UtxVhdyeOOsbBiouo1C1KZR65OOvBwtzoKFFLhc6U+I/q9t/Jd8wpeyPq7YycMD+q7Cv
         jjM/a1iZWlXIYzhP/uMWS8m87WsGGhR2dg49lftFAA/EWmxRNkklWRF2coZwtM8KE3E/
         sDWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW46KHTftaTJJ2IsnXvIOaSQRANIhDr+9Qt1xUYjJz+4A+FJIIgaf+EITHGgAoLy7vV20vI3pFr6eUY2MfeD8xP@lists.infradead.org
X-Gm-Message-State: AOJu0YwFMZDF62v3su+AtU2XR1EHiowmHxaE3nB53G+PxTY4874zA1t0
	E7e1VXd4/WPCk8z97IrRRrMZARh2w0UpWUFQap+hCV2bpCtvUu7PummoktSi8RDO1fwVH6AGP0I
	d7ozSN3pYuUXzj9OZEMe5Kw==
X-Received: from wmpx5.prod.google.com ([2002:a05:600c:1885:b0:480:4a03:7b7f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8a1a:20b0:480:4a4f:c36f with SMTP id 5b1f17b1804b1-4805e6f7fddmr42640155e9.21.1769424286085;
 Mon, 26 Jan 2026 02:44:46 -0800 (PST)
Date: Mon, 26 Jan 2026 10:44:11 +0000
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126104419.1649811-23-vdonnefort@google.com>
Subject: [PATCH v10 22/30] KVM: arm64: Support unaligned fixmap in the pKVM hyp
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
X-CRM114-CacheID: sfid-20260126_024448_866252_52B11DCA 
X-CRM114-Status: UNSURE (   9.51  )
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
2.52.0.457.g6b5491de43-goog


