Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08240D7496D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 09:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wW6xT6zKa/DbjWLXugE2SCCRWvLGUmWxnxjoprlKdVA=; b=36Da5szW+D1H/ohUUGYKLss8l9
	TVTXlj9Ge7C/8UnhYD+WdncegZ5aVt7UeAAjDpgT8FhNstlRH27dM98hEvmzNNqYhIckkJLjXc9pP
	1MosH2x1GDE/2cxZZ5ELswwTcoMHpIILPrSwp0K1tUe115EzIO5PnhsSdUVwxgvRqaY6WaSJb7Ruk
	WSkN8GQDH9vBr+PGSxWMKs8jmFOs5adVDnbCmFP6nJZvYRCLhgES0ZbbyJya2TIWS3grbnMiHBiLJ
	gdb6dd7/4GrGQzxaGSVLARa0/IbSRHg7/jKkDWaWvpxis48pFsZ8/T3RmLWh5WLXY54AJICGtYSW1
	l2J/E5sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWlt-00000009wjB-47Qx;
	Fri, 19 Dec 2025 09:27:37 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWWls-00000009wil-1cWb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 09:27:37 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42e2e77f519so1105854f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 01:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766136454; x=1766741254; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wW6xT6zKa/DbjWLXugE2SCCRWvLGUmWxnxjoprlKdVA=;
        b=Rt1aSh0/GIo+cGqZP1u+UErBfH+JmP3nwfatZcmmZnTim/85AJnlhDOzFf3cmw//Cp
         7NUyX8x3btdK4jsmpPGn7w/12x38n3CoBR12YrTZ5s7tepCD4o5BD0jKAXGUFSuIWjl5
         WK1IHFyM4aegr/VXukxbzLxjcbSu4c8r49d9BnQD0uFHso/wjD9bamOpwOBby52D0HVd
         cjV2ivqQxK/43emw3bxeco9oKK6dNCRp/hWLV2ms96R4QF1N5aWZXyfH2Bt7tELyGbnX
         4PHktnQv4m4N8L4OHPR8yernqnE07Tb9RSpovmP5dF+9LjAHZIaEKEgr/CgB5YJb+0fe
         aIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766136454; x=1766741254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wW6xT6zKa/DbjWLXugE2SCCRWvLGUmWxnxjoprlKdVA=;
        b=muZUzi5CfqvwypeilCeF3w0HvODJ5E5IdXnl3kbHvLbgSFBnX2OnmPLWXRZyTYrVUR
         sa5idxpcP3FDYsSrZ1q9uCBlE3X/GJiOsnmvcw+1lMtPYRn4M/5gkNYXTYvVbCIHo3Bj
         WVN+F70KmbOKG7SH7BnENrA90w74C8tPuVXNJ8bW7ZUWXxnrhuEs7oLnHORZqycZxmGh
         S/1ArcCNEPYPzTkX+l2m6TB6qEOxs83I1ac0RFIxFeo7b7w3UuJVIh7E3klyHicE6Mgn
         AmgfiybylzgPVptEXlftbuZZ0o08f7FOmXA5fzPk2ufdR1TIIEIdeaw0+HQFRtxlUtEV
         S46w==
X-Forwarded-Encrypted: i=1; AJvYcCU2toSyGCk8GB9Ht5nFlJmuoipQhZRpYO9pwxaYxco6LhSkbeoYDvrc1EeEUoeguZwopZWE0kkI08x0gg1hkt0K@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3SZ0/Ik1Yzd2o8QoLxR1p0MYdIJxYKs09f+TukuMnOXtvdd3R
	8ahfwRAcnRjC+Nd5Ej/h2ElKLfnLyYFg0m4sbGdgFoJBXPiNo56CV1Aq
X-Gm-Gg: AY/fxX5XZDtpwAUpz0AVdfE0HPgt3PE17bFjMo5HzMU3ybdvNa2upgd9T1lJcH5tfaT
	bThba74NRHfUGqCQgtQHfjYMWT4k+sK8Ne6XpYrAtwmXhW0OE4jm/LqtscoLh7i7z1kw0QMMdls
	LJSMbJ/YC1oY8gdT0TMd03YysDcG3z1mhYOv0xESBkoxfDKnnOqfEV1IX4sOugXJToXe/8PlWDR
	dGCi/2fpmlzA9ew5HjlT67llXeeXeO4dACMuwxPDL57i0euimN1ebOXBF7zZezeLwt6Zme4WuhY
	3ikqAjM9wm7mGAKXIUnxL24TcdofH8pECw+ZLu1RmXlE5Yo6yxcf5Y3ffiFH4vil9p/rdMJvayv
	uFBYXcMkIJ+9ZB0YR/NRCh1SRMXoviaqUgDLgrUlb6kMwaqqJtcLqHoZ/700C
X-Google-Smtp-Source: AGHT+IGZerDxPd0b4gdsyGcPyDLXRMjKat7AKujtmwuJrtu/onCDnzbnfiuN8UDjCgD2FYBSHSQDtg==
X-Received: by 2002:a05:6000:24c9:b0:430:fc0f:8fb3 with SMTP id ffacd0b85a97d-4324e506148mr2457124f8f.38.1766136453761;
        Fri, 19 Dec 2025 01:27:33 -0800 (PST)
Received: from krava ([2a02:8308:a00c:e200::b44f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa08d9sm4154643f8f.30.2025.12.19.01.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 01:27:33 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Fri, 19 Dec 2025 10:27:31 +0100
To: Steven Rostedt <rostedt@kernel.org>
Cc: Florent Revest <revest@google.com>, Mark Rutland <mark.rutland@arm.com>,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Menglong Dong <menglong8.dong@gmail.com>,
	Song Liu <song@kernel.org>
Subject: Re: [PATCHv5 bpf-next 3/9] ftrace: Export some of hash related
 functions
Message-ID: <aUUag8LVUy2CTNpS@krava>
References: <20251215211402.353056-1-jolsa@kernel.org>
 <20251215211402.353056-4-jolsa@kernel.org>
 <20251217200712.606a9a7a@robin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217200712.606a9a7a@robin>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_012736_476722_E2CDF844 
X-CRM114-Status: GOOD (  16.07  )
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

On Wed, Dec 17, 2025 at 08:07:12PM -0500, Steven Rostedt wrote:
> On Mon, 15 Dec 2025 22:13:56 +0100
> Jiri Olsa <jolsa@kernel.org> wrote:
> 
> > index 505b7d3f5641..c0a72fcae1f6 100644
> > --- a/include/linux/ftrace.h
> > +++ b/include/linux/ftrace.h
> > @@ -82,6 +82,7 @@ static inline void early_trace_init(void) { }
> >  
> >  struct module;
> >  struct ftrace_hash;
> > +struct ftrace_func_entry;
> >  
> >  #if defined(CONFIG_FUNCTION_TRACER) && defined(CONFIG_MODULES) && \
> >  	defined(CONFIG_DYNAMIC_FTRACE)
> > @@ -405,6 +406,14 @@ enum ftrace_ops_cmd {
> >  typedef int (*ftrace_ops_func_t)(struct ftrace_ops *op, enum ftrace_ops_cmd cmd);
> >  
> >  #ifdef CONFIG_DYNAMIC_FTRACE
> > +
> > +#define FTRACE_HASH_DEFAULT_BITS 10
> > +
> > +struct ftrace_hash *alloc_ftrace_hash(int size_bits);
> > +void free_ftrace_hash(struct ftrace_hash *hash);
> > +struct ftrace_func_entry *add_hash_entry_direct(struct ftrace_hash *hash,
> 
> As this is no longer static and is exported to other users within the
> kernel, it should be renamed to: add_ftrace_hash_entry_direct()
> to keep the namespace unique.

ok, will change

jirka

> 
> -- Steve
> 
> > +						unsigned long ip, unsigned long direct);
> > +
> >  /* The hash used to know what functions callbacks trace */
> >  struct ftrace_ops_hash {
> >  	struct ftrace_hash __rcu	*notrace_hash;

