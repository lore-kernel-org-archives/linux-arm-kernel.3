Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E93CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 13:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JelQF+PgdiILboeOL52+qm2l/XNW/EjjD3ktKV3cKe4=; b=eq1qj4VwB+FirprKvZL3EpBtVM
	s/eL7yfTydhJV39r/rO+MLWZ5Wybfw89c/aKQBhCrdwBi4Td1kQFo2dxkbUZahJnH9f5ViMtHoWxI
	w45zx1BmY51FnZr0rU9PtscdDXXlcVzgQWbNCIVFl3xnjua8ITU3fShjb13gbnGWOw76I3T3ZTItj
	0q23eEiJ3Vm5QmW2FjAtRBn3w9ShT8uNClighbd+WIV0PkR2oM0kECaXsYkX6Dvlx+CuGsLsw4K/I
	/FF5XepWr5wAPSli9vxqobW2R03RxsB1irliChfibP7BQfmUMtZIHvoinkFJHcFXSXtip0sKGFe//
	o3YBFVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbHul-00000003wtG-12yv;
	Sun, 21 Jun 2026 13:08:43 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbHuh-00000003wss-2VyY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 13:08:41 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-7fe8bc0a01bso32542687b3.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782047318; x=1782652118; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JelQF+PgdiILboeOL52+qm2l/XNW/EjjD3ktKV3cKe4=;
        b=n8EsQYlY6qHLI+CfXezCIfSt7GWPFuSZ8k3+wII9CAj1qxNRT3SibKUcvAjwyyDpPN
         eL+jeslXgsIlsoVrVN6gUUepLxAZ8OchD32ZxjcJB+VTjvU6HDgCw/wzN3zOMF73DZrj
         cjWIFcWoLm/CQlIRvt4HVrcvAot3Yi9jZoVsFhFOh2F0QsNQURNT21uABminN/ov9Ogx
         uIYG6x8aPEXpFh40yvi0YPvEjUW0KQtO1nk9U+pIQlflf0Ub6uIKgElfUe0yQuR86g1o
         EZdMeSHrycqbHjIlFINn3QR+kgyUBZiTHwJuYBorbQa6Hm7RGGWqiF56t4mh5QHdloGq
         JNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782047318; x=1782652118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JelQF+PgdiILboeOL52+qm2l/XNW/EjjD3ktKV3cKe4=;
        b=eoxDSFv3ufIytu/7RKx5xjgtYwyhgXu3DAuxD0adtnipFyvojhol80yQtidm01zorl
         RzXPx6b5PgGFHrF2wWAf2JRpTNPmVDGhGQTwGDa9XJQ4IC0KYZkItAwO1YM8N6Seqg08
         ZvbAOqKplcCyEqZMK+TY2qAewizdm2f/bbj99qi5/kpONrbTtQf7oZOOFaEUUHKzp0XK
         b4mvUONJouXj0vXQRrbcPCRZkj0I7IpIf6BkyBmqtH5O7T+9m7GaqSVl15zxH4n8HDoS
         IQLSgzedTIDPHWMaPOw/cRobkSXOzobCMjNCGiUKqR4qGvoT6PUMitC03G9hmxDGXh99
         oRng==
X-Forwarded-Encrypted: i=1; AHgh+RpZ9VugJhhfJHGdSdL1MoNjILUMig//N+M6HqDr9G2I37jenK80ZP6HtN9Pz2PiClT9EAowUCv5AAa7E+fuxr5k@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ2l49XipJZwh32Bk+OnyrX0lncr1d8+tVyufg++6rcpo+U6zy
	Cf6xpZWJqxb+bTuen1Sz4I0Z7rBVo8LFA3+CaaN/1F/4lc92+245Law/
X-Gm-Gg: AfdE7clsoWfkZIS7bpq6L6yG9Z69l3/ACafqnG9gftAlf9/ZqKJCVowFaxUdio0n99M
	EmPPq6kTtZ+VimcjNVUzd9kpdqrQ9tF8Kdoqe1ZpksBD9a36cQbjF7Gw06dxvA82OR3nwPRYQX9
	y5CvJH7fmKb2UWvl/kpMBhz76Al/sH0Id2kpiYuM79it9v97/IEA+F+g8qc72ZQFCkMjkn2sqUC
	fR2PpNb4TX9j5jBCgwcg/Cjt/7q0VeBgfP1RyI/Pu0fpj7SM+cJePIKsYKHVnhstVWAP2qFMiSS
	vkUvC9BkuAXY9sE+1EqWKapAwBsvC16+e+v+um3F0L6TYsH+GtQ7SkBvwLf0k2R0RyX3t7Gtl9x
	oRAVHKf5tukci+4jPKERGZ8xIk36E0EgM2wTdFuaf/WUFbzvyy5+HrSoIaVMhlW6DN7KqawqMhW
	kGzWPIatDFqY1ZvwQNumYbbnXsdWID60iRf6Y=
X-Received: by 2002:a05:690c:6881:b0:7fd:5297:28da with SMTP id 00721157ae682-80139103c73mr119142517b3.49.1782047317965;
        Sun, 21 Jun 2026 06:08:37 -0700 (PDT)
Received: from localhost (user-24-214-85-55.knology.net. [24.214.85.55])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8025cf693f8sm20544597b3.15.2026.06.21.06.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 06:08:37 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Sun, 21 Jun 2026 09:08:37 -0400
To: Steven Rostedt <rostedt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Yury Norov <yury.norov@gmail.com>, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-rdma@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-nfs@vger.kernel.org, kvm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/2] tracing: Move non-trace_printk prototypes back to
 kernel.h
Message-ID: <ajfiVTlCIVlqW3sh@yury>
References: <20260621093430.264983361@kernel.org>
 <20260621093811.007634476@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621093811.007634476@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_060839_670965_BAFE73AA 
X-CRM114-Status: GOOD (  23.61  )
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

On Sun, Jun 21, 2026 at 05:34:31AM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> In order to remove the include to trace_printk.h from kernel.h the tracing
> control prototypes need to be moved back into kernel.h. That's because

Please don't. Instead, you can split them out to trace_control.h, and
include where needed. I actually have a prototype for it, FYI:

https://github.com/norov/linux/tree/trace_pritk3

> they are used in other common header files like rcu.h. There's no point in
> removing trace_printk.h from kernel.h if it just gets added back to other
> common headers.
> 
> Prototypes are very cheap for the compiler and should not be an issue.

It's not about cost, it's about mess. kernel.h is included everywhere.
Is that API needed everywhere? No, it's needed in literally 10 files.
So, no place in kernel.h.
 
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> ---
>  include/linux/kernel.h       | 18 ++++++++++++++++++
>  include/linux/trace_printk.h | 17 -----------------
>  2 files changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index e5570a16cbb1..c3c68128827c 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -194,4 +194,22 @@ extern enum system_states system_state;
>  # define REBUILD_DUE_TO_DYNAMIC_FTRACE
>  #endif
>  
> +#ifdef CONFIG_TRACING
> +void tracing_on(void);
> +void tracing_off(void);
> +int tracing_is_on(void);
> +void tracing_snapshot(void);
> +void tracing_snapshot_alloc(void);
> +void tracing_start(void);
> +void tracing_stop(void);
> +#else
> +static inline void tracing_start(void) { }
> +static inline void tracing_stop(void) { }
> +static inline void tracing_on(void) { }
> +static inline void tracing_off(void) { }
> +static inline int tracing_is_on(void) { return 0; }
> +static inline void tracing_snapshot(void) { }
> +static inline void tracing_snapshot_alloc(void) { }
> +#endif
> +
>  #endif
> diff --git a/include/linux/trace_printk.h b/include/linux/trace_printk.h
> index 3d54f440dccf..879fed0805fd 100644
> --- a/include/linux/trace_printk.h
> +++ b/include/linux/trace_printk.h
> @@ -35,15 +35,6 @@ enum ftrace_dump_mode {
>  };
>  
>  #ifdef CONFIG_TRACING
> -void tracing_on(void);
> -void tracing_off(void);
> -int tracing_is_on(void);
> -void tracing_snapshot(void);
> -void tracing_snapshot_alloc(void);
> -
> -extern void tracing_start(void);
> -extern void tracing_stop(void);
> -
>  static inline __printf(1, 2)
>  void ____trace_printk_check_format(const char *fmt, ...)
>  {
> @@ -176,16 +167,8 @@ __ftrace_vprintk(unsigned long ip, const char *fmt, va_list ap);
>  
>  extern void ftrace_dump(enum ftrace_dump_mode oops_dump_mode);
>  #else
> -static inline void tracing_start(void) { }
> -static inline void tracing_stop(void) { }
>  static inline void trace_dump_stack(int skip) { }
>  
> -static inline void tracing_on(void) { }
> -static inline void tracing_off(void) { }
> -static inline int tracing_is_on(void) { return 0; }
> -static inline void tracing_snapshot(void) { }
> -static inline void tracing_snapshot_alloc(void) { }
> -
>  static inline __printf(1, 2)
>  int trace_printk(const char *fmt, ...)
>  {
> -- 
> 2.53.0
> 

