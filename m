Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6262ECA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5aJhDXgEDSV7qScb/Rc6CoH0I6fM9qFOzvBEEtPC6+I=; b=rlmqlpmsZ0b/2E47iZgxHr1MZt
	XmMxog3Q9WIlViZ8syJKgykg1AFJZ7PpMDPjXkgduQHRvKeF9Mly0Vwa65HnM57QAa1oTkSlPoFlk
	as9wnx8Jd8797Vc0D/0mPX16N7pGQ/l2r+tOept6R9v6Ycusa+qmFLTAhTXueFKufdWNmrIks4Z2c
	Xohr5+GX9U3AGelgUf+ojr9TWsMnRKhS8pz24prlrwiQ7xuV/lA69uMJ3yRw9j4lAPLciFFQYeYh3
	tAE9bD1qBEEIKKKKOOWq4h2kap97Wg2UZk/KgmF8fkjjCzc1GYtjTbVDm77xvDj3mM1j/5cQ4kBhK
	sacZWdgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmr-00000009Nfo-2nPc;
	Thu, 01 Oct 2026 14:29:29 +0000
Received: from mail-wr1-f71.google.com ([209.85.221.71])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHmj-00000009NS0-3pgp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:29:26 +0000
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f6e8b5996so6031769f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790864959; x=1791469759; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5aJhDXgEDSV7qScb/Rc6CoH0I6fM9qFOzvBEEtPC6+I=;
        b=Cnwh093WAvKOCGJjPHXbTXBtj8LYeAjOduYAwwr+VSYKSpXw5sPHIKXhj/WzCroLsy
         AxNtUxV5rq+2xQtqMCmCJm8/7+R1aziE2y9+kifGYRt9zusE1Cxa3iI7vgjiMAVKOqib
         jrJqVgorLLvbtCWEydr2PnM8+2y6MIFSq2+TO0V+g5WP//aPPVZRyS3jtHViHAu+GOKI
         I/Sw/juHZcieq0/FYq/XepVCFFKdhurLFwzfsDak3+sP5Yjgo2cM9NRvSJ77eFpVmYXp
         Pw1Q4t4hBy0Z/yPQKylC/sfjBIxSjrOSZrNV/HnbjTo3RI8UZZ6822hVtUZqL7XY5Jfm
         RJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790864959; x=1791469759;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5aJhDXgEDSV7qScb/Rc6CoH0I6fM9qFOzvBEEtPC6+I=;
        b=IK9tDXmXRzR8LhP/ILo8NqM9G4rzL7M07bnmnllxQQUSLAGTNkD6onNqJbdc+qok44
         EOcbdDI+IZ749/mAHKYgXpqy+179x0/+Awn84M+P8KUprgaqiTVzP4RUAohCP3PIY9bq
         7ld16VynZ9xxPSZb8l24V+Hwk7mFyUEcWIJvb7WCcYBzChLhbe5P4WtG9JipY7RzlIaB
         ulLGoKlT2HrcOuNN89oucrF1msUULQ0DBcJMqTSI4tar+2GJF28EicXtqBdhZbDsq/g/
         dM73GS8AiSo5ZMRmsLpA2R41Uc3Frzm6YmerH8DYh6KqtaXR6iST0sPP01teUFB+vDv9
         e3ow==
X-Forwarded-Encrypted: i=1; AKwUvBxmg9y3Th3+5yh9xbdHCZ30Dx06/H+d5DGPXBGXrsu6F3ffhY+8G4fGW5MuAV6qRKQJ4VBpQXIT1Ou7m41xsR4f@lists.infradead.org
X-Gm-Message-State: AFq9FYKzRKdbQ7ooK9nEK7CtEW0GzxeDNEGZXYKsjuQs3I8IN3Pg6zX9
	oY/t+FMwnMq1PcUOiX8+xWfrWqbpIX4547Y2mKsl1B+KfhZW83WRx89BM9c4EQzZb7ZlWeRx+D1
	52h4V0N0FBQBr3sMP3k6gHQ==
X-Received: from wrbfp4.prod.google.com ([2002:a05:6000:2784:b0:485:82f9:4ab3])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2f85:b0:48b:1175:e76e with SMTP id ffacd0b85a97d-48b1175e88bmr972912f8f.30.1790864958096;
 Thu, 01 Oct 2026 07:29:18 -0700 (PDT)
Date: Thu,  1 Oct 2026 15:28:48 +0100
In-Reply-To: <20261001142849.3367614-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261001142849.3367614-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001142849.3367614-18-vdonnefort@google.com>
Subject: [PATCH v6 17/18] KVM: arm64: Reject hyp trace descriptors with fewer
 than 3 pages
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_072922_003709_F5EF1E96 
X-CRM114-Status: GOOD (  11.95  )
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
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/trace.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/trace.c b/arch/arm64/kvm/hyp/nvhe/trace.c
index e9e584694506..7acb81ae0e6a 100644
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
2.56.0.rc1.315.gc6ed9934b7-goog


