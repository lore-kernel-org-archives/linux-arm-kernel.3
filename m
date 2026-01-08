Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6745CF6A8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 09:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibNZDSomea2Kq8JU1LII4jRZLAkzC6KvW4qElfknzVM=; b=DdqCl2ci42fy23UT4N/p+Sa6b4
	3yX77twab5BzbI0kFu27y/Jvm40WPqhrzygbGqATueB0m00/MEgDxws20WSOhdqOZLkUqG8U0suRn
	+KUPf5JnEB2Qlsa8CaJLiV5I1XblnjKpPlaa3Tti0ovJ3GGX3EYW8wwYDkVouLMCbhSOk3knt3Bne
	nJxpMJsJ4wg4pVQM5PYsm6rZWOPX0HhSU0FmFf0NOiXINjy9078wdBjI7nNYRUZLsvdsa7gEgkuRz
	foWnCSHStoPUDdv6Vm4lascbOhuUzKD6eSR9jGx6f6rcQWCZhk3ZuBwNg3OBSeQTVU3lpZRMN61s8
	VABZLR1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmC0-0000000GQRt-2DKj;
	Thu, 08 Jan 2026 09:20:33 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmBq-0000000GQQ2-2pgC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 09:20:23 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-431048c4068so997737f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 01:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767864019; x=1768468819; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibNZDSomea2Kq8JU1LII4jRZLAkzC6KvW4qElfknzVM=;
        b=Eh6YaFItAipd+TtxXA+WBX9GbpWNTOe4lAabCG1bbukhfzob6Ni9AdeGYlTF8M3hUf
         PiBqrc3ePNujEZBIk6xPN+Ji+kX+WQYeEMEeFcZAQ1+lwg0kUfe6AEFQ5pXxKcME+OPs
         EUOkZxiiUJvbbYemC32oif6hMv7eKMou3cNAbZHJtOSVbq+pU0Ii+4TC+wPkLlCyvxyC
         /h6E4OqVGusShlrWk0FWFrfY7ALqcMM4EyP/RqKpz48cjswb1GjuR5TAGoHT/uz0w5oQ
         DX+pu3afx514XuOmfu73q9KV/Jm+x7kVW1q4riGQr6d1pmUp0a8tCxgRj7SkmJ/RBgII
         XZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864019; x=1768468819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibNZDSomea2Kq8JU1LII4jRZLAkzC6KvW4qElfknzVM=;
        b=Rrr0DSgHhutxv44gyTeEY6hX/ugygEdKaSobYXt5S6r4L2vbgZ8aGzEzZdiQZPjDwc
         vFsX8JUdxOD9BbSn3JXII+mQGbdyNDaKE12wVJeo2ZnRI2aVD2L+op5JC5uVeTgGxRcJ
         pEAoMJb9nexVz3T2ifQ5PSbp1++4EuuQ0hIU34GrTREauhSQY49mbHqbBrzZpWle8vT3
         WN1L5RiERgddh4Xtxw7K5WwnaJNYj6xXP0G0ZjldjALfo2v+YScO7BAhUrfJMxiRRxds
         55nkkXOk8Ps50AqTbwVIPXmm3Mk5/mf6To+0nAqpTa2E4DfYx6xAXx8osmiKgq4vHx2e
         LbEA==
X-Forwarded-Encrypted: i=1; AJvYcCVK+grr/ld3y95qH/Bmo6R2AnG8kaWDvPfFG84yJ0SI7DDFxVqJI6yO4aBggDAKsprokaSwW/uMrWTaOIsmbiWc@lists.infradead.org
X-Gm-Message-State: AOJu0YwL0R64uF6SMsKOuNSS6v0tyA1/MAbsjE+H1n9V4jlclbbl7Djl
	uJLdZeLMQAVoAZMyK+j+GsQF8t++5sAJ9N8OB29x6zNWNqKd1zKw6TFc
X-Gm-Gg: AY/fxX6dV9Zo3+MD8wgI8oHWu0i1LfrVGhgqXMl1iAYbkb3A1QwM+q7grEGsvBdL3Pg
	BNlj7X1eFP1s5f2FAPd3WDUV7/nkqRtq0a9DdgFxMrMJq46aI7GP0nxKOqJYY3xHZbZuBr8nUE8
	592WzJbDDWLKiw/E2PfvAardc0dE/RWRrsPIAebC7BUeiVNsoK1e5hbWtiyiGb6OsKu2egMkgVY
	zMwHNdLNoBdtVI1CCGJKI/7UXBRaOnJCyBHbK722FFynxyhh1JOdgV/woZAA7sPAlNTxtnbEKMg
	AP8aCi2V6cuDBw5Sy1jdcl+c0AGjcv4DBkIA0SYfKy62Q04RT8Sn1PE4YLE3uk0W+CBsbl2svte
	ab+zIAuZNE47taBepcMPdz/59WHhnxfyiM23oGjJGR2mZpj3pwcS1MnKqnsNIPZU01gDsiZL+zi
	CMe+ZOqSm0sg==
X-Google-Smtp-Source: AGHT+IEeTGSbCnce2NYPoDErH8a4YSRN2uHCz3Hrwe8riLU2jJcFM/suSjmul2LgFsXBuT7yKXIMaQ==
X-Received: by 2002:a05:6000:430e:b0:432:b953:b02b with SMTP id ffacd0b85a97d-432bcfd3d7cmr12200245f8f.16.1767864018804;
        Thu, 08 Jan 2026 01:20:18 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e180csm14982921f8f.10.2026.01.08.01.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 01:20:18 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 8 Jan 2026 10:20:16 +0100
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Will Deacon <will@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Mahe Tardy <mahe.tardy@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>, bpf@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org,
	Yonghong Song <yhs@fb.com>, Song Liu <songliubraving@fb.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH bpf-next 1/2] arm64/ftrace,bpf: Fix partial regs after
 bpf_prog_run
Message-ID: <aV920FGl9-1A1jW7@krava>
References: <20260107093256.54616-1-jolsa@kernel.org>
 <aV5qpZwxgVRu2Q8w@willie-the-truck>
 <20260107110814.1dfc9ec0@gandalf.local.home>
 <aV6PZKx9g_hCz4ZW@willie-the-truck>
 <20260107121432.73fccf84@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107121432.73fccf84@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_012022_732579_40F98546 
X-CRM114-Status: GOOD (  18.46  )
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

On Wed, Jan 07, 2026 at 12:14:32PM -0500, Steven Rostedt wrote:
> On Wed, 7 Jan 2026 16:52:52 +0000
> Will Deacon <will@kernel.org> wrote:
> 
> > diff --git a/include/linux/ftrace_regs.h b/include/linux/ftrace_regs.h
> > index 15627ceea9bc..3ebd8cdac7c6 100644
> > --- a/include/linux/ftrace_regs.h
> > +++ b/include/linux/ftrace_regs.h
> > @@ -33,6 +33,15 @@ struct ftrace_regs;
> >  #define ftrace_regs_get_frame_pointer(fregs) \
> >         frame_pointer(&arch_ftrace_regs(fregs)->regs)
> >  
> > +#else
> > +
> > +static __always_inline void
> > +ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs)
> > +{
> > +       ftrace_regs_set_instruction_pointer(fregs, instruction_pointer(regs));
> > +       ftrace_regs_set_return_value(fregs, regs_return_value(regs));
> > +}
> > +
> >  #endif /* HAVE_ARCH_FTRACE_REGS */
> >  
> >  /* This can be overridden by the architectures */
> 
> Hmm, maybe that would work. Of course you forgot to add the helper for the
> !HAVE_ARCH_FTRACE_REGS case ;-)

seems to work, will send new version with that

thanks,
jirka


---
diff --git a/include/linux/ftrace_regs.h b/include/linux/ftrace_regs.h
index 15627ceea9bc..4b053eb4c9d5 100644
--- a/include/linux/ftrace_regs.h
+++ b/include/linux/ftrace_regs.h
@@ -33,6 +33,18 @@ struct ftrace_regs;
 #define ftrace_regs_get_frame_pointer(fregs) \
 	frame_pointer(&arch_ftrace_regs(fregs)->regs)
 
+static __always_inline void
+ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs) { }
+
+#else
+
+static __always_inline void
+ftrace_partial_regs_update(const struct ftrace_regs *fregs, struct pt_regs *regs)
+{
+	ftrace_regs_set_instruction_pointer(fregs, instruction_pointer(regs));
+	ftrace_regs_set_return_value(fregs, regs_return_value(regs));
+}
+
 #endif /* HAVE_ARCH_FTRACE_REGS */
 
 /* This can be overridden by the architectures */
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

