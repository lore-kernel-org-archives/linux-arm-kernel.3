Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28380C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 23:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63v8voqDYPPccdvhHdT2gYF/erUoDbYrARzDm1If6YE=; b=2raKHLP6WHk4yC4yKARE2LTz3H
	l4x2/P3Ma2gPruHaZL37rGluP4XBk2E+iunFLoWQPeAvNhSR2falPtjw3kktckW/xC7FS8L2XaEkV
	5BaxLlN4ni6kxiejes2L3zegTs45jhzy9AsrDUmTHsCwLyCxXK1GRlZyqeumB+KjWlnA2olOpjRxU
	0AFgRbFZkjIMmyIzAJ928j09kPkLmqY9xRVIFXuQRdArvk6sz8rAntnxQva1CQNorIzy7ah5xyh/a
	57QFz9rGv5XaPu5s1x1isZFkdG9xtYqHpDSSw1nghh2MLJgggvAid937PAuKEoiHsnBBPfQ72Za4Q
	kOmYItFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZm-00000004uPe-2LTw;
	Thu, 27 Aug 2026 23:32:06 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzjZM-00000004u90-0I0O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 23:31:41 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2cfe48ca1efso3886125ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787873494; x=1788478294; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63v8voqDYPPccdvhHdT2gYF/erUoDbYrARzDm1If6YE=;
        b=aqxwj6iQ+cV9pqok6iBceEob4jT5tQrcLgZgrfjWKc+90JOqdfBpuSXPRMXZL7vUHl
         3IlIa2T+mbzNTVomYeIhu9ipXXZWsCmVL9cnY1rf7hC02zCyQ/naAecZYar8EDFfH/Jb
         plWJ1m598HRyX7FJSHoiWmYGntSo+IQxlumWWPspW+NLxFXImgztte877wMUjsCChDXR
         29RD3i98/6loh93oSTOsii4WfYSiK6rn8nNwJbJn5/PQXJCHudPKpeQCgbZYcwoq+6Fw
         rbMUpSORVSb0VLsEgL8YGNSh7WpI5I84g0Lbo7MgxDK258twshBvqq4s3XYHfQiSWDtY
         0fsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873494; x=1788478294;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=63v8voqDYPPccdvhHdT2gYF/erUoDbYrARzDm1If6YE=;
        b=SWSbLtkXsQIuhpbxN6RrmHS8u2SxSG3rnjIAaESeAxdocNi05fGOnkXPYzPaI8yaXy
         2fY21xcG8PFfzx9C+r55fw4APMVdzDvdmIL0C5VCXDn2BoeRvIPaixTlSyryGp9ibe1c
         QQDgsNHGIoPPmuNUtiO0LiLU8gq7VqncZ+XYQcgdsXgqAQQPZgT4qFikcVOwIypvvd2S
         Y77eKPDuhCFN1+nfiKZr7bl8OOWyJfb+E+LtgRiq8tUv0bPxytgdpgSzQD2xZ6YgZ1tq
         u/NiPki0vO2lC05MHBHiO4yHurV5bPqWFtoA/h0IyISKfcj1wrw0UQFOzxMjcTCg5WZH
         pAIg==
X-Forwarded-Encrypted: i=1; AHgh+RoMT/+8w/8+MY7arZpZ/lY9WRzwOf9STS/fFJvHfEpa8HecneI4JxfgrPrWQxKh9bIFYiZYOeEMKBJ/WKjBgxKr@lists.infradead.org
X-Gm-Message-State: AFuF++muvJLqodFWo2WGwQ0ip8GPzMqDTWCIOjoTDqH5YH9mNd92C0qM
	iEcSYaWVKUnLZTa5iclzNq4j4+1er34RGk4cXyD//D1t9CaoQtlBNqdlxLTx1BE663a7zBbSE47
	XuoilpMM6bFTpLg==
X-Received: from dybpd7.prod.google.com ([2002:a05:7301:4547:b0:327:dce2:b13c])
 (user=stevensd job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1850:b0:2d5:e3ce:3988 with SMTP id d9443c01a7336-2d74dddceebmr49959775ad.11.1787873494176;
 Thu, 27 Aug 2026 16:31:34 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:29:47 -0700
In-Reply-To: <20260827232948.2520558-1-stevensd@google.com>
Mime-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827232948.2520558-10-stevensd@google.com>
Subject: [RFC 09/10] x86: Enable reclaimable stacks
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
X-CRM114-CacheID: sfid-20260827_163140_194352_B2B73EAB 
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
 arch/x86/Kconfig                 | 1 +
 arch/x86/include/asm/processor.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index bdad90f210e4..652d5a9c0830 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -211,6 +211,7 @@ config X86
 	select HAVE_ARCH_USERFAULTFD_WP         if X86_64 && USERFAULTFD
 	select HAVE_ARCH_USERFAULTFD_MINOR	if X86_64 && USERFAULTFD
 	select HAVE_ARCH_VMAP_STACK		if X86_64
+	select HAVE_ARCH_RECLAIMABLE_STACK	if X86_64
 	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
 	select HAVE_ARCH_WITHIN_STACK_FRAMES
 	select HAVE_ASM_MODVERSIONS
diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 87b1d4c0727e..207e7adced64 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -690,6 +690,11 @@ extern void start_thread(struct pt_regs *regs, unsigned long new_ip,
 #define GET_TSC_CTL(adr)	get_tsc_mode((adr))
 #define SET_TSC_CTL(val)	set_tsc_mode((val))
 
+static inline unsigned long top_of_blocked_task_stack(struct thread_struct *thread)
+{
+	return thread->sp;
+}
+
 extern int get_tsc_mode(unsigned long adr);
 extern int set_tsc_mode(unsigned int val);
 
-- 
2.55.0.897.gb25b4bd76c-goog


