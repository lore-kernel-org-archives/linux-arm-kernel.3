Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB19CF6C08
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=df7REDb65mq75PTRlD31qjVxgAgGX1+69KUNZyHym1g=; b=n2mc/Cf0+rY/badU1NKVrL5olS
	ZzFe0EgZ8+3cHL3Vff6xt4N9s2MfcLg5SpfzTp/U7V5xmGQ12FOlij2s/JGtReCivvPXGPD+lBLbL
	ZSI8IBu4O2HummORjkL7uKFMBlRLxHm6FkoCPwzVZ6NAAbtCQcHdjxOH4e46dg1q8sGzva97vJyI5
	O4lku3mEdc8ca3DHt9Z2swEMf/FkUqLdqrOKScHinfpL377YD+67p1a86GANO8MY3Osbo3ZwMPj//
	NuPWh2u3+7HMmlnOeVtkUdUQzvaTd6C6STV/TUsLWCJPfFdu8jyusYL6hc7lTRk5kjYkvG669fkjl
	LmcKNv6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOot-0000000EObw-1s94;
	Wed, 07 Jan 2026 08:23:07 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdOor-0000000EObI-3lWh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 08:23:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4308d81fdf6so859231f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 00:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767774183; x=1768378983; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=df7REDb65mq75PTRlD31qjVxgAgGX1+69KUNZyHym1g=;
        b=Qxk4dLCBQstEbSprZrULXPL5K9q7OpmxqHdE9IOdv+ETASYcFwzEHNK0nV2J2pyeUH
         2KCyfq5Weq/oeu8M5e7HOzaTbzp2dpjijt12hBanVn9ddGpF6p1gTpMSnYGW1REzqfna
         rmGO9s9jRt2sRkSrDl4geusNsPBb1dNXyhaU1AbtTr7gcZfUv0sT9n0N0yAy5O/SiEwe
         km8WVWcT46uhAbZo7IwgTrr5aI3ILs8ltkGaSakecDhJrH3tJAZNNEKeIM5XNG67Arsm
         raajxk5HYOHcIai1dlDMQ5QRJhpjiX/8rj4tIi3Khh7d3XVVnb9iIzvckubM8/ydju/A
         rTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767774183; x=1768378983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=df7REDb65mq75PTRlD31qjVxgAgGX1+69KUNZyHym1g=;
        b=XWVGoaIFHPIohwGzEHUBEFbG2BEcko9/IHadgtoVsKapcZg2iZHV4scC/YBwCMFXMV
         mfZtVKqO7YfIQYNeVRLvzGQSYrc6RDpjoZujBgdXG1aN/7z3U7VYtnD/2QqKHhtlxTjl
         QVtfPVNu4LTEhiYDz6uyEnewu+MdhUfGjNg3KbuQoPrZD/BvI2nT/crvSckZ5GkSIjks
         10A8LjQ87g1Iv/CvP8c5mAYQauAeT9kV+MjY8duCHesh9bAXTR+STa10hRD4YGG+niL7
         INYvG5Pc/Qf86Cm2yNJs+8Lme6e52cCPoI6xzDo2q6bPOAMLsj+k14RgMCRxqFLFKMNK
         RohA==
X-Forwarded-Encrypted: i=1; AJvYcCXim8htRY+Rsk5DqgvxgoBcdluwW5vaLIq1ABKFsZxl/Krwo3zyi8OSlHxwqBKLtTi35E2QMOJhDoEenkk4kB0W@lists.infradead.org
X-Gm-Message-State: AOJu0YwAJ+fKqdaXH977o3TyjLmCG/oZsx13CYJ1TyslNhPEg5wgdzco
	NbiJ8T9ru1EONsErvLui6MkcAT9M8anSD1W1P5aidaUjlEMDR8yT2jpY
X-Gm-Gg: AY/fxX7sxyGEZWtie2f2KkcJXkjb58AGtFC213XNBm/6aF2o5rWjuTwC0e1NX3WqH2C
	DbeRO2qPzlztXUDFiKqfdDm3Lb4l0fBjnO9LFK75YYBYks5sc59KBbAfQUzG9ddTXuq3lApodoe
	0A2h/gWapt2eMZD+9Do3vDcGuQhdnLswpSbTwBunK4dzc9MTK0XTiRQLLeL/3NlZxK3DyO4ZY69
	44N6yn0laDYsXpm+S4kzyWkrEno+b7+zS+YTIGZDraXW2kGwhCm6QHmwwB/TRuG3QkZxg6+XQbp
	I8JZScP8YrCyYMPCHOhCXDLPkuNFKQGfURRDWzBGmImnz04CHEiv6RVFf7m5R90U1yP//agAIIX
	xXkAQTClwtYCbFFYM2GO3ssasLewx5ItTG57WZywv+9zwgL6VaOWLJ+4iTh0PG7s3x2Lb9UnJfy
	c=
X-Google-Smtp-Source: AGHT+IEsMNPHr9nzJaTOIYJD2qWD9ZSw80mTVgJ/kjHVyTIrFlwwtX/5Na2psG+/SMS1rx4kKZSw8Q==
X-Received: by 2002:a05:6000:290b:b0:432:8651:4071 with SMTP id ffacd0b85a97d-432c3632942mr1904226f8f.18.1767774183031;
        Wed, 07 Jan 2026 00:23:03 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ff319sm8920997f8f.43.2026.01.07.00.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:23:02 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 7 Jan 2026 09:23:01 +0100
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	Yonghong Song <yhs@fb.com>, Song Liu <songliubraving@fb.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mahe Tardy <mahe.tardy@gmail.com>
Subject: Re: [BUG/RFC 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <aV4X5Yx07LomQji4@krava>
References: <20251105125924.365205-1-jolsa@kernel.org>
 <aVfbqYsWdGXu4lh8@willie-the-truck>
 <20260104223415.0a31f423c861c0b651de966b@kernel.org>
 <20260105162220.6ba5129a@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105162220.6ba5129a@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_002305_964840_1DCFCAD2 
X-CRM114-Status: GOOD (  26.34  )
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

On Mon, Jan 05, 2026 at 04:22:20PM -0500, Steven Rostedt wrote:
> On Sun, 4 Jan 2026 22:34:15 +0900
> Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:
> 
> > > This looks a bit grotty to me and presumably other architectures would
> > > need similar treatement. Wouldn't it be cleaner to reuse the existing
> > > API instead? For example, by calling ftrace_regs_set_instruction_pointer()
> > > and ftrace_regs_set_return_value() to update the relevant registers from
> > > the core code?  
> > 
> > I agreed with using the generic APIs. Also, ftrace_partial_regs_fix() is
> > not self-explained. Maybe ftrace_regs_set_by_regs()?
> 
> Or perhaps: ftrace_partial_regs_update() where you call it if you need to
> update the regs.
> 
> /*
>  * ftrace_partial_regs_update - update the original ftrace_regs from regs
>  * @fregs: The ftrace_regs to update from @regs
>  * @regs: The partial regs from ftrace_partial_regs() that was updated
>  *
>  * Some architectures have the partial regs living in the ftrace_regs
>  * structure, whereas other architectures need to make a different copy
>  * of the @regs. If a partial @regs is retrieved by ftrace_partial_regs() and
>  * if the code using @regs updates a field (like the instruction pointer or
>  * stack pointer) it may need to propagate that change to the original @fregs
>  * it retrieved the partial @regs from. Use this function to guarantee that
>  * update happens.
>  */
> static __always_inline void
> ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs) {
> 	struct __arch_ftrace_regs *afregs = arch_ftrace_regs(fregs);
> 
> 	if (afregs->pc != regs->pc) {
> 		afregs->pc = regs->pc;
> 		afregs->regs[0] = regs->regs[0];
> 	}
> }
> 
> -- Steve

lgtm, the full change is below, I'll send new version of the patchset

thanks,
jirka


---
diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
index 1621c84f44b3..177c7bbf3b84 100644
--- a/arch/arm64/include/asm/ftrace.h
+++ b/arch/arm64/include/asm/ftrace.h
@@ -157,6 +157,30 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
 	return regs;
 }
 
+/*
+ * ftrace_partial_regs_update - update the original ftrace_regs from regs
+ * @fregs: The ftrace_regs to update from @regs
+ * @regs: The partial regs from ftrace_partial_regs() that was updated
+ *
+ * Some architectures have the partial regs living in the ftrace_regs
+ * structure, whereas other architectures need to make a different copy
+ * of the @regs. If a partial @regs is retrieved by ftrace_partial_regs() and
+ * if the code using @regs updates a field (like the instruction pointer or
+ * stack pointer) it may need to propagate that change to the original @fregs
+ * it retrieved the partial @regs from. Use this function to guarantee that
+ * update happens.
+ */
+static __always_inline void
+ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs)
+{
+	struct __arch_ftrace_regs *afregs = arch_ftrace_regs(fregs);
+
+	if (afregs->pc != regs->pc) {
+		afregs->pc = regs->pc;
+		afregs->regs[0] = regs->regs[0];
+	}
+}
+
 #define arch_ftrace_fill_perf_regs(fregs, _regs) do {		\
 		(_regs)->pc = arch_ftrace_regs(fregs)->pc;			\
 		(_regs)->regs[29] = arch_ftrace_regs(fregs)->fp;		\
diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
index 770f0dc993cc..ae22559b4099 100644
--- a/include/linux/ftrace.h
+++ b/include/linux/ftrace.h
@@ -213,6 +213,9 @@ ftrace_partial_regs(struct ftrace_regs *fregs, struct pt_regs *regs)
 	return regs;
 }
 
+static __always_inline void
+ftrace_partial_regs_update(struct ftrace_regs *fregs, struct pt_regs *regs) { }
+
 #endif /* !CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS || CONFIG_HAVE_FTRACE_REGS_HAVING_PT_REGS */
 
 #ifdef CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS
diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index 6e076485bf70..3a17f79b20c2 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -2564,6 +2564,7 @@ kprobe_multi_link_prog_run(struct bpf_kprobe_multi_link *link,
 	old_run_ctx = bpf_set_run_ctx(&run_ctx.session_ctx.run_ctx);
 	err = bpf_prog_run(link->link.prog, regs);
 	bpf_reset_run_ctx(old_run_ctx);
+	ftrace_partial_regs_update(fregs, bpf_kprobe_multi_pt_regs_ptr());
 	rcu_read_unlock();
 
  out:
-- 
2.52.0


