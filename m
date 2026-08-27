Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53831C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 23:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brDKxupp32vlfYsuON/JY3iAK7z2zOrfUeaeP3zp25g=; b=dgvvhOKRiTFDppDwuUu8pRRyLD
	/fulkwcj2eVF6s+cBQIGPLy5Bvhvv/aaKhdTIVfJmRsDccwIC/Ci1dVi2/6uJ1g1+k5sFX+CxeIgM
	E8UDX/XzG2Q+SOJw0Q5jdONXrFtywa2UsgmQoNwPzkVFNHfGvJ9XBL62mzHsSBnz9+lW2kFb2ASf+
	LDMLcSMJF7J1YbSwAmt3tEhX00EXd9T2bh1gSqRwy1GVCalXPF5ZXoW+mXuOrOWBvhilX/HMBDkgs
	WhZvSS0R8G1JnBUwG0y+e+ZeGtIN9GjOD9ZlNUPdzBTxQ5rqBM7pUr9ZGY78j0vVjQhrlAP/3kbr+
	lYvj0GYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZM-00000004uCT-3Qm5;
	Thu, 27 Aug 2026 23:31:40 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZ3-00000004u5d-2bYk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 23:31:22 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2ccb687f82eso3259595ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787873478; x=1788478278; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brDKxupp32vlfYsuON/JY3iAK7z2zOrfUeaeP3zp25g=;
        b=oz6CSV+r+nSq9HzPde1Md+EV+aoIb+uZf3pLiQteD/mH1hGHnd7YPAoeWCrGbqJOOY
         Ug2zBRw9nlYohOObrTwmvhE48f4G+RMfC9Qob8RYbD2Op/FLK7TJHMzFyM5YLPKgZ3tV
         9RpFxdypY3avA0Wn1AQzTz6BqtUDOmHPYMshcH3uuzbPvejpLVF26U3qnw+uS42kYyfc
         mgUoUvnmH1EIFz9/SplW+gplV0+5Fe3zoSJqbYSebMOgY6QatiE+g5b/IIit8A4wzSGv
         iMOIO7DyV6O4towS0xm9vV3gASrf/DwQYOVCCGJ6o2++1fEXYCPq3NmRB0yTm58abbup
         xKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873478; x=1788478278;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brDKxupp32vlfYsuON/JY3iAK7z2zOrfUeaeP3zp25g=;
        b=iVSagZvUpmCKCaK5fM5jlEVQNxC0SJkkp3xUByD11ainnz66pRO68dhBd/nbSR53ZN
         3nyVu/f7EY1LNgATSVEfjpAzei2aERvtKWkiZLRwP46Ly+iQ3VdUAUjN0HpVf3xEssSO
         mMiX6Iu1xUR9NKfB+limb3oAneygyti4KOs7+6OnvlMGdTt3RsSa5kZbQduWvrNF2ux4
         9coM20UUQNS7YNzKvmZjZaSQpKR+fyU+JxPCwSmp58rPQKe6D4MZj3tgjJx0cLfeBHt7
         s/TVJoz50jy5LLP6r7FWo8SDwd5XfQBwepr47SURq5zR64itFsrG4DzB07bn6CMQmeIn
         52QQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro89g1Nz5m9QpQEhd45KBfx+967xxZMFSET7sjQF7aAWZguQwxzDq+xB8XLqr8EQfNfHR971ARG12kh6kK5jxZ/@lists.infradead.org
X-Gm-Message-State: AFuF++mCz4i0EVVg92X1whgQdGQdNNHhlzix5EcYgKN07mAWeC9Az/RH
	70Zb/fqfTNOTOHlRVLpOUtnDVqNIuE4Elfu+W7mAyoLpVkr0tjfIBqvdm5JXB961tSb3chWU0cV
	2dhzhGABx/ZpiCA==
X-Received: from dybeb10.prod.google.com ([2002:a05:7300:a2ca:b0:328:4d52:8cd0])
 (user=stevensd job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:458b:b0:2d6:f3f0:3e7a with SMTP id d9443c01a7336-2d74dc2ade3mr36333205ad.3.1787873478170;
 Thu, 27 Aug 2026 16:31:18 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:29:39 -0700
In-Reply-To: <20260827232948.2520558-1-stevensd@google.com>
Mime-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827232948.2520558-2-stevensd@google.com>
Subject: [RFC 01/10] Add !MEMCG memcg_list_lru_alloc implementation
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
X-CRM114-CacheID: sfid-20260827_163121_855315_4BFDC291 
X-CRM114-Status: GOOD (  12.36  )
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

Add a stub implementation of memcg_list_lru_alloc() when CONFIG_MEMCG
isn't enabled.

Signed-off-by: David Stevens <stevensd@google.com>
---
 include/linux/list_lru.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/list_lru.h b/include/linux/list_lru.h
index a450fffe1550..40eaeaa3424c 100644
--- a/include/linux/list_lru.h
+++ b/include/linux/list_lru.h
@@ -79,10 +79,10 @@ static inline int list_lru_init_memcg_key(struct list_lru *lru, struct shrinker
 	return list_lru_init_memcg(lru, shrinker);
 }
 
+#ifdef CONFIG_MEMCG
 int memcg_list_lru_alloc(struct mem_cgroup *memcg, struct list_lru *lru,
 			 gfp_t gfp);
 
-#ifdef CONFIG_MEMCG
 /**
  * folio_memcg_list_lru_alloc - allocate list_lru heads for shrinkable folio
  * @folio: the newly allocated & charged folio
@@ -106,6 +106,11 @@ static inline int folio_memcg_list_lru_alloc(struct folio *folio,
 {
 	return 0;
 }
+
+static inline int memcg_list_lru_alloc(struct mem_cgroup *memcg, struct list_lru *lru, gfp_t gfp)
+{
+	return 0;
+}
 #endif
 
 void memcg_reparent_list_lrus(struct mem_cgroup *memcg, struct mem_cgroup *parent);
-- 
2.55.0.897.gb25b4bd76c-goog


