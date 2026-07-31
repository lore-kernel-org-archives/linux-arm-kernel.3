Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5896CC55177
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sXhCxcibbJ3/EZ2ScJyrxsR4ZxuB2GfnnCFHZbPKV8=; b=OVe5zCkdie8qdGjmTsAwXgykQs
	OvqAhpD2NbjARCWDF4ICXzUBEVwRIJsKBGRpY9wxrh7HTaGP45L1unDA2F86SUyoySajU3BQuU1pG
	xwQXlnae2S1frKGTd/XlDzmJrHldmx5iNeACC69ocL7qrUH4141m+wC/85mgWxUoSQqqKwx9mMcKk
	9PfiMqn2ZxPdTUGAC6HnRXQ4vKxxUl9Wj0cUcbZYzJL/y3zLGhdKz7M+8dCYXX5Fe2KsOY3R2qWCW
	dRskIkuWPhEX+Bgqp5PCc88u2xJHIPWvTutECBMEYaMKVMdoaxLc3cVZiMZyyPzyhPi5+6XstZ1NC
	+C72Dx5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLa-0000000CjkW-2Sry;
	Fri, 31 Jul 2026 14:36:26 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoLP-0000000CjZA-3b6t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:36:20 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-69e97ea7b5bso1403271a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785508571; x=1786113371; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6sXhCxcibbJ3/EZ2ScJyrxsR4ZxuB2GfnnCFHZbPKV8=;
        b=rPnVWmzN+0FMXRlNRAFMHV4aEIM/0h8ot4xNhtpnvKI5DTNdTht96zM5Og3LgURM6c
         LCc8H91GUL9ONsKrSq3YPbY40E+YNlnabTy8h+OsZoEIs+aNqdwcPLbzavSao06YVLgW
         cex/GlFX8dSuF+K+7x60r/bWm6zdqIRFWJTt9UEgx7SozeWSPqkefwmRHIfRrif5SQ/3
         81GAtehYhCS5PwHH3a22Ekgv6DwNAyddC2OZrt0k37u5NzOVJX32+ygmYQxBhNG8P97L
         0g6bUJ5Q21WjA5wPbkfIUgmaByoRqFBPNWDDOK3jJofA/5MA7ywywWNJruHk1WcPWVTc
         QBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508571; x=1786113371;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6sXhCxcibbJ3/EZ2ScJyrxsR4ZxuB2GfnnCFHZbPKV8=;
        b=hBMEVQTF4rV7K4Kg7sL1K37cEX3gbwI9WdDioNNf+Wi1oYCN3eRlGv6RhNx/GQ/EqA
         bZAKRXE8P/2R3fABTReNjwjerWYrEu2pfh5irLeqkA83JJoYkIOR7QOTC5jt0M/tfxPX
         WuJxPWeptYWFBlV63DYPy3xvLN3YgHsMQ5PDx/jKS9GP9u/YkFU2Zu/EXAbSEr1ks9a+
         nwRvsHLFsAsa09g2qyLS9WOySJGMyYw3Tsf2IL4J1aJGnBx50UgD9rAcLzd8jJ7SM0uD
         mIFNcwkDo5R1jQ7cx8mW177GmwTuidDrdvzZTIYYo+j9Rc6PQtrxrsY9feG3SwJtZNqC
         plPA==
X-Forwarded-Encrypted: i=1; AHgh+RpqSmWlrvir6CWaAFeMSj0feqriEMVwAPAf6NyC0GGUesXx4V8HI8tFan3s1TVkvINsIIHwgRWUC33hw57Ns/X7@lists.infradead.org
X-Gm-Message-State: AOJu0YxQyOA3kTrtUvsMyj2fGijNURZHsnYC+fDl746Kgb92825nD/3C
	TsiVGgM3Mit+dWcj6e8xwCIh6UNY9Sls48y1YsfzAJ6U9JePBv6Rof8TBsb0xNHe7hbjo6z5YNT
	0S8kib5j71QL85eypy3J5kQ==
X-Received: from wmej10.prod.google.com ([2002:a05:600c:42ca:b0:495:66f2:4250])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:2747:b0:69e:98e9:b0b9 with SMTP id 4fb4d7f45d1cf-6a098d092d4mr1378124a12.25.1785508571290;
 Fri, 31 Jul 2026 07:36:11 -0700 (PDT)
Date: Fri, 31 Jul 2026 15:35:39 +0100
In-Reply-To: <20260731143541.956291-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260731143541.956291-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731143541.956291-16-vdonnefort@google.com>
Subject: [PATCH v4 15/17] KVM: arm64: Reject hyp trace descriptors with fewer
 CPUs than hyp_nr_cpus
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073615_971173_35C610AE 
X-CRM114-Status: UNSURE (   8.14  )
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

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

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
2.55.0.508.g3f0d502094-goog


