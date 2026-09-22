Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E975EC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7DrDy5k1cF63oZDGZmuZpMhR9CRSHaszqjBOE8wOFU=; b=JiUjjUKXNHj2OOuPKHCUW7CRIl
	ucAKQrlOQBYCY+lEMd8no+B5gguvxWNVjsswY/u5L9DUeXQmmJkCE+8TAVU/g2+Cd+GjyGaiabEW4
	GTEKTpIKU6xIPwHhUqk5IqFRNMxgA0aDoxHVD6DzJskCdHfPjtiFFTVE3sSh3iiHIx2Urq9w/xkdL
	w085VW9i/v6m11mqolN/qh6YXSWO2YPAiUjSoV5CAoybuv81vUyc+HCJucesTEqB8oT10bkvWEBpZ
	353zJdfj1gqxRTHfmWh8LytQ2lEgTX63e8UNcxPVoi1w9c7CNVFpY72qjtic3pJkm+2C0f9FRwKsz
	YwgbYyYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w7D-00000004jXf-2Kw0;
	Tue, 22 Sep 2026 08:44:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w70-00000004jHG-3ICG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=S7DrDy5k1cF63oZDGZmuZpMhR9CRSHaszqjBOE8wOFU=; b=P16suBol6PRDUXKkHWWtzA0CKY
	/Ln1sOgnfC2jQS51VafirdnudbH70kp8gK6XkH5vfN6VlQUMcEyQJ0IXZHCGoumx58mhGC5FYSHUd
	pJ8WDf9+n7uVqaQZ5a4IPFA9GAbKIfks9yjHhsj6DyQDjP1LswJIpkajaWMLkUHzegH/V8T0lTO5Z
	qPaW3BayuIgoItBmoEM3CSQb4xNDVoApkGKgSnHw9tvLRXfLRHb5mXk9FNCnk2Az8AQc1fHOCMcV4
	5wwePtOGDQ7gdbJQ4ZW1eaXs2JQaMDOCl9vK8mrYk+w4tJhVlgSBTtF8+F22q2j9/qzWrApWmJ7Nr
	6IVVKAEA==;
Received: from mail-pj2-x00.google.com ([2607:f8b0:4864:39::])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8w6x-0000000DHiD-3MVg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:44:25 +0000
Received: by mail-pj2-x00.google.com with SMTP id 98e67ed59e1d1-39b2ad83680so1597886a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066662; x=1790671462; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7DrDy5k1cF63oZDGZmuZpMhR9CRSHaszqjBOE8wOFU=;
        b=D2HAiUEUzd7tnzW2uBKe/LKJhmb4Qo/nFe/1xPm61RVkjLKytrePPzCUZoMLEriVlL
         IRApJKLTuBYQoXSanaEJF49RkF8BIGpnoItP+QoewwuZYiLWRQJ4+UYfhMLOkbWquwhd
         VH298OY+RDYPNnXpNAxbBVXlWXmJSE+86z1QuwNGid4OkdYu2tqVINwk/3g8TjSMose4
         kFaIFYxXoFuxq9DOmYxb8GesBGE/Lbc3ujufAQ8ng6YjCJXzFP4HSpSp0xaJ5yuK5lqd
         OHjLu+ArgEsizFkt8OVnsHMMfqyCZLPFVQJOmWrcsLeXYxyPwutB0ThdVyBJRD0LpB9h
         Mrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066662; x=1790671462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7DrDy5k1cF63oZDGZmuZpMhR9CRSHaszqjBOE8wOFU=;
        b=EL2kI+cATkMhhG/VtT0jl8+K1o0PS75pID+6oGXcgBAZASaYr/WjAzUxcTzMTXlsZf
         fae7iEdnOxRRXXuwt+n+0SjtIucbq2Eqp34S0KXnIpOPadPAPudHsLqZ8kb2op6lqx1F
         HDIwb/8qRMWFn9njejcDWQLGN0ltz+edIzbBfS14h1u6SJHlphlXTbQe2xDbbRvG4E5O
         zr328MuAndiZs3gvaFBhR7N+kbqgEc0hx4Lq2uo7+zI+H3pgSBJKGS88a5B4drg8asmb
         GOSVP3NuCJE+8SGYFgLPaIfl6r/dLk5rVlOrcYwkfa/0qQVP9LQrihc4oKHpArADnEbK
         p2/w==
X-Forwarded-Encrypted: i=1; AKwUvBxMjtNSLClNEZss9BjuLEMRrpf5wpGItzuVNX+iAabu0z3qDP8yeHyCJY6YuITIHqvFjmLZYcRnbkzGiq7vfEOg@lists.infradead.org
X-Gm-Message-State: AFuF++kxCRm6LDJ2JNWXkwM6GXBtZhLrhAQhoHXC19wq6LE/1QtdNnJO
	J5ahn6mPo7jI8MSLuwl/fKMJp2JVeUOT2OUOytDtuSQJR+wLLCb11Ql0
X-Gm-Gg: AYBFou2kFMdgk5BZGTiCt60qdhat8XeVDhfmmGaahcAWKWRkGZ4Wpt0+xW8Elwp6ACR
	iPzG3zVsabOX52gan08+rkaQ9PqENTN9rYidXAJ2FhF9+dIlR6+akU3NDjYNinq33Lcuqk7R71T
	CHTHE6jySRvZBpqxtFssVOWjZ8m6rJHRXl1ydweBIax5MLJo4mX9brzrUqZ/YYc2eepugik4UrP
	g2n58QENcy5qzG8npevjx8powMs/xAnxSPPZljAUiR9/Rc6hNXaM9jlLaoVYN3tkxwG9kiFgl6J
	L5p/ttPgdUh2/XCYCkQHUEnHHyuP7rGZxvDwMn2/QupmKgYCKFEQwNqkZ3MHR25DJrvigiurR9m
	FUBe8/Z2HAa8+sHkUgnWFwzo8da4b/A6mEDLh++7q5UYqjEn2GBwRf9bKvClEl9mC6SBXRpbYaJ
	C/0Ke6P5GV3E12sqLmPUT9QSdUaEBKhwWYZwfFN/3C+SJSjx9cY6REEVJUbFgst1iPuSmOV+4AL
	Rhjxj/DyaI=
X-Received: by 2002:a17:90b:2ccb:b0:39e:6a81:c921 with SMTP id 98e67ed59e1d1-3a0731e1df7mr452432a91.20.1790066661956;
        Tue, 22 Sep 2026 01:44:21 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:44:21 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v7 6/9] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Tue, 22 Sep 2026 16:42:53 +0800
Message-ID: <20260922084256.1515554-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_094423_944015_5EB45944 
X-CRM114-Status: GOOD (  14.21  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem to decide whether a
reserved area should be included in the kdump vmcore. Non-dumpable
regions are later marked MEMBLOCK_NODUMP;the filtering itself happens
in memblock, keeping the arch kdump code independent of the DT API.

Most reserved regions are owned by devices and do not contain data
useful for kernel crash analysis, so dumpable default to false.
Reusable CMA regions are different: their pages are handed back to the
buddy allocator and may contain key data for crash analysis, so set
dumpable to true in rmem_cma_setup().

The dumpable flag is also used to check /memreserve/ entries for overlap
with other dumpable regions.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index 49da515859f2..99c0f3ccc297 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 90937dc7c627..d7bfc38ac762 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -567,6 +567,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0


