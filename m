Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42460C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 23:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THehtAVXPzXeOISNI+hN8Wh32bn5y3s9ZVH/HPQs5Ig=; b=oSc1u5SP91bMybhK8gHMWRilrd
	TNdnAGVrNtkanMcNbN8JxuDGe20fI/Ptsa8mDrOVtoNu0cG/uCQII0k8AGNl+gaJZsYUP6ky/h+YE
	xF4THGnTIi46GssMXFasWawAfad8pIta7aq/SzE/jywmJVUmE66PJkKNcQDZPqj6d+DWwhLio1zDh
	WYheMoTVHLnepYjhHWDWhLOJXSPvS3roPzJCbj/4KDVbJSh1UUr0KJhKq2/aUZ/G3VgR8T/e2KoA+
	iHYzTSRRudaUzmv65xSJKQL/1tg1xM1ssauntVnPppNz7cv3asHDUgXV3YSgt025xYZ2JcW6TJp5y
	DjtOCyoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZm-00000004uPv-2ui0;
	Thu, 27 Aug 2026 23:32:06 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZM-00000004u96-3EvJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 23:31:42 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so917785a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787873496; x=1788478296; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THehtAVXPzXeOISNI+hN8Wh32bn5y3s9ZVH/HPQs5Ig=;
        b=bdp7lu/r8iD82FLqkH1YpZ3C1OCzEgHydiHreoqlkiDa6guJ4a/DxA5kO27Un7oMNz
         x0070TcHPNeX1tP9gupI7m3vxp93DNW2kBnyra1sczz9HXVPjlVxL6t6pVnqkiNvNP6s
         QOLla3+lmImnoW4FdRJRAa+lu8VNaC55nUzHxikgR0QAWAFWRYo/haKVxmWSrW5sEQog
         FVbDlqqKQBGTD6ChIiz9ajDzukDgQpXrArdLHDVy7kp1/6nwh2YDvlxta1denopfHmTf
         fbn0iFHlOfLhYdLOfkex/o4ffhuf7nFID4Gu4keCzjor8c5CfG0kgyVX+1uCA50B/+Pl
         FT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873496; x=1788478296;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THehtAVXPzXeOISNI+hN8Wh32bn5y3s9ZVH/HPQs5Ig=;
        b=ewQXvIqbY2WqKUVYH+mj0wX6EciFTvUaUCxQn5OQ63/CFjvtR7ZLAG8IkuF8++wa5A
         xQ5apW5KrTASH/37aNpErfd4yXYu2cFpGlB83loRmAhDMHAw7cc/k8d1Yhv78amD6oIW
         9/Kx14Cr9fvnF54A9vldT1kSHmy77pfsTbd7g606MKJoylkcSFQPmCfVJIsyyWPTpTrL
         GIhEGCqDNZtvE8tOn5ZnNz724cE1RC1bIayw0f0Mop65MHKTQ3uN0YT+TgfnqY5ZOkpX
         oyuPy0dxbp9XrQ6iYUI/W8gLbSpnBHnZepyrzfOd6duMTTvGYPw/0T7istA+L+Vqxh3s
         o9mw==
X-Forwarded-Encrypted: i=1; AHgh+Rpt0octeTzaf/Uh1Pa+Qlj8sYcTQb/To4xbme275AeK3waCx7a/EBa3LM6sovxJuuMm0E/K7ihhvx4Xzo3j3W2/@lists.infradead.org
X-Gm-Message-State: AFuF++nrYfaWR0xM7Xpw540xFFCgyhDxSq5sk6FENFgGYQ66gUnt4nb9
	WnH0tde1+HtgNGo+jrR9Mbs0hc76vSpXIKaytnM7M2RVEWr95Ar68AU9LVdM257kZq9STnv0S0i
	vwBO2ALhmOo633g==
X-Received: from dlbsj13.prod.google.com ([2002:a05:7022:f90d:b0:139:d9c7:3cf4])
 (user=stevensd job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2c88:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-396d0f52a0amr5303479a91.8.1787873495813;
 Thu, 27 Aug 2026 16:31:35 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:29:48 -0700
In-Reply-To: <20260827232948.2520558-1-stevensd@google.com>
Mime-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827232948.2520558-11-stevensd@google.com>
Subject: [RFC 10/10] arm64: Enable reclaimable stacks
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
X-CRM114-CacheID: sfid-20260827_163140_842431_90543B79 
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

Implement top_of_blocked_task_stack() to get the stack pointer out of
a thread_struct and enable HAVE_ARCH_RECLAIMABLE_STACK.

Signed-off-by: David Stevens <stevensd@google.com>
---
 arch/arm64/Kconfig                 | 1 +
 arch/arm64/include/asm/processor.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919..262a4fddce19 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -173,6 +173,7 @@ config ARM64
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select HAVE_ARCH_VMAP_STACK
+	select HAVE_ARCH_RECLAIMABLE_STACK
 	select HAVE_ARM_SMCCC
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_EBPF_JIT
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index c2a627f39314..f5a550835c94 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -204,6 +204,11 @@ struct thread_struct {
 #endif
 };
 
+static inline unsigned long top_of_blocked_task_stack(struct thread_struct *thread)
+{
+	return thread->cpu_context.sp;
+}
+
 static inline unsigned int thread_get_vl(struct thread_struct *thread,
 					 enum vec_type type)
 {
-- 
2.55.0.897.gb25b4bd76c-goog


