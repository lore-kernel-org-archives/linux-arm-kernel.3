Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F4BC61DC6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 23:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pKguOeL4XpEhj7eOn7cPoRPiZ6Kih53q6MwTo24ARI=; b=2yVTd39adLgA1PTLmQFmZ4MM8H
	nNfSe3YymZE7N7pwM/ltQMZatGQ5e/zCMHn1V3u9PZYD9sAEVquEO1zt/ujHc2SVKmjWpb9SEhM5y
	12Sh/+HqWj5yXbBE5U73gxuZE9Er1tb6q4GUb+wx7HXo0AE2nvmAYFZPS9SoqZMPc4AwmAF43WWbj
	hqlWv4SXihX1tIzdSowfM1M6DOWb4nEprX4jd3hVjPvajyBpYmBjagf+cIUkJToWrz16otkV1o3oU
	8O5/zVPJ31S1UTkw/cdw43QMYJybHy2J7Pw3lyLcBYzaKZCojXpeoE3+6K1zSfPRA99EetBwQfclI
	fOsztvjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZN-00000004uD2-018U;
	Thu, 27 Aug 2026 23:31:41 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZ4-00000004u5t-0Sav
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 23:31:23 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso481623a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787873480; x=1788478280; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4pKguOeL4XpEhj7eOn7cPoRPiZ6Kih53q6MwTo24ARI=;
        b=kCZlLiQMvCtZ93FxYd6qhZGivo1ZaL1yUKR8dcxuM9WHmdE/SrJ+DmO5okma2cDgzI
         EHFT5JhfwRmB+ZIlNMlW9RNW4+Nh6lf3/CcmMzJ6Z6DDU5ZdWa3fLpAqHDmor242wWBo
         SovWq6VsTW2CYIMmnF5a64vvS5yX0mx3OwEnMNyca6EPKxT05hwLNNIIvg95X8OS5dF3
         gf8py995kTWhSGARPBiiC2BTj732+uvkBdKdWgpVA9ikZZLODqcmKRleFlk3ulmIK6Dh
         k41fd47P05sxZg+wmpyqVk1q60THAj2nzrt3V+JQwdqFjTBTfCsfyvMXddEboCkyezv6
         KJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873480; x=1788478280;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pKguOeL4XpEhj7eOn7cPoRPiZ6Kih53q6MwTo24ARI=;
        b=PdrmVhHyMQqW8WyMWRklcWXD8ZzrGfIqzF58Q/cjY1uir4NxKQHi9ExNPy/ZGa5tfr
         H+sE2BIGN4+TERyEzD9+5ZB3rJnJx0O0h34DQi1B0CjwV8CFyF5wGgth3EJDtNK+xWii
         G1cP3s3eTu2rMYmGXrY8PO+ZC/clcZg6BTTQ8UGWKPltxWHXtUayMWQHEKnJcnYsPnnE
         NxaeUti+WKDLU6utGY3EnmY3j5jnc+SyxZmy7J2vMLRNLWT87CEhz1B3GQ1Z7j3iek44
         uW1345zVKRbaQ1BmxvSh256LcKg99pmN3QWl2f2z34vcvHPQt/SKhx1TaROAfjT/RfP6
         H+yA==
X-Forwarded-Encrypted: i=1; AHgh+RofpYz87jac07BA4ehsySxl1U3IVm0eIRrJOoyZSW5YTJVkjoD9eEA8piSWDB/W7qyEumXoG3oAxj3huCoauycF@lists.infradead.org
X-Gm-Message-State: AFuF++kci+zQqrIqugrd/F/i3rCsCLrZgtIvfljFSKCkXQVumIUYAVIl
	LoO8t/a8GdYy774cWS3bWDajD6otHDgOvUYA90A2L9owmEhqYl7Ti/2hzBRQrM6DGUiQEVXNxkX
	qFJzWriL6Vw0xHA==
X-Received: from dlbtp4.prod.google.com ([2002:a05:7022:3b84:b0:141:4abc:f12d])
 (user=stevensd job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:1a8e:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-396d0fe45damr5091530a91.11.1787873480154;
 Thu, 27 Aug 2026 16:31:20 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:29:40 -0700
In-Reply-To: <20260827232948.2520558-1-stevensd@google.com>
Mime-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827232948.2520558-3-stevensd@google.com>
Subject: [RFC 02/10] mm/vmalloc: Skip vmallocinfo NUMA stats for VM_SPARSE
From: David Stevens <stevensd@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, 
	David Stevens <stevensd@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_163122_151757_F7CAD2A6 
X-CRM114-Status: GOOD (  11.67  )
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

Bail from show_numa_info() in vmalloc_info_show() for areas with
VM_SPARSE set. This lets clients that allocate VM_SPARSE areas directly
use vm_struct's nr_pages and pages fields.

Signed-off-by: David Stevens <stevensd@google.com>
---
 mm/vmalloc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index f4fa227a8d7f..d39897300f29 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5294,6 +5294,9 @@ static void show_numa_info(struct seq_file *m, struct vm_struct *v,
 	if (!counters)
 		return;
 
+	if (v->flags & VM_SPARSE)
+		return;
+
 	memset(counters, 0, nr_node_ids * sizeof(unsigned int));
 
 	for (nr = 0; nr < v->nr_pages; nr += step)
-- 
2.55.0.897.gb25b4bd76c-goog


