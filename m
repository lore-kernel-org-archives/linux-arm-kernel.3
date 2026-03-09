Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99951FCA19C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 22:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBkcZ4vNzPnscp2wv/tDrm8if6LphvMnNawG/F/pvx8=; b=NcZQoggENxVU5sS4Xf+5SekQqq
	/67HHJ2nBxPVv1ts9duJuszs7DCPAo+UGhBqCb4N31RHKfn0k/jot+0MkMUreFRSB+sXGJYCo4VlT
	LapSQ55muvaHm5jSAusqUL778hmkK1usnDnD9Wk+5jQKnHrUCZzcq754nk7nxdmIUl4bwi6ydgiAr
	FxoLoQiGFUpLrtGCU+BjkOtvB2QCZuUXMlcFzI+v1h/abtyh7ZAwYPWLeuVAv8uiLY6OPqQ7WwF99
	tlz7/LNoGfO1id/SdG2Xdc+8MCzYMZ+ciziGgshNEoMPXoUxjGCEGLNlXIUKL5xxdZJzmkwLMw2vP
	bWEKt0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzj8y-00000008ENS-2DBB;
	Mon, 09 Mar 2026 22:32:08 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzj8w-00000008EMi-3AMy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 22:32:07 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2aea4ebb048so5605ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 15:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773095525; x=1773700325; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IBkcZ4vNzPnscp2wv/tDrm8if6LphvMnNawG/F/pvx8=;
        b=LbK1SMRS3KMe1w41cblbXXzj1mJOjlidFGc5ENz9ZXU9RsNtL4pv9HkCjEJFREuK3v
         N+48LvxKMEtLPsqJc9Kr9H/agCiKcvX/j7l8OFDWHss5tEGNlL4e3JtMgC4jedzdN2qj
         ZFR1+SnWswx/Mf9l3+9BcwM0ZupJIyrIXQ5vapGiEnhRZA0C+pOBYu+Zw6kZQoJrTjcU
         gfBv9UlQp94pwRXngTseYAAqWYoWR6CFSFG2yYLc4mcE+hzuee6d9LQ9GjdT7npS3dLL
         DqWJeq3AOxRCuMZLkZptxD2XZjX6tcPcINDvdwSvPoC7mq+lCPTCQLACNcQcXnfujK/b
         6QVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773095525; x=1773700325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IBkcZ4vNzPnscp2wv/tDrm8if6LphvMnNawG/F/pvx8=;
        b=BW9FH3n6vqitMcfqdaRZ439p6zIusIYYEMmcL/E02a73bsCyuqV2xQq2Me66ISnRNf
         6qOuR5zzmLu+WqwD5xwzVFPzHsK0WKzuVRBluR43z/uHKdYbdQintFf699ledccBk4vq
         sU8kg+zzsfKyQDQHF0e/X+WTUaR3CDqGRcuxfT7chBQZzS4klImszEgvnCrPVgU/nAjN
         q0sqm3eCtSzAMoRGksTPg8N1NVdxWeifOOIBs8EUe45Lifz4ra1zLOcLDhM2weZS+xvY
         pMDQxLze64za1XQ1lfGGFXxmM+j6ba7tWZoxH5l8r/VionLEahKjlL30etht8ufFs2aO
         68og==
X-Forwarded-Encrypted: i=1; AJvYcCVcq0So2U1+kL4VPPiB9JjuYqnny9wicwTaYnrn6lqHPkfbVG2ST/5QeDtmjEjEVlJzVNqZQeRyWhhJU4/Rqgcf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+PbYK+BlAOqEknzQGJPHqzZSvC6f1nknmvG4yrtUCBsSr81sY
	Mwh/uEewK26hTjx2PtiH727ixw5dbYEyPfZREBtuDnvjM41YSpG9LvWjcfTylG4nZw==
X-Gm-Gg: ATEYQzzqETqG00M/k0z0WpJq82DGgJCqPwByZzWKsvnmc4FNx8d0/YwZD5FMbxn0RW4
	R745gpMlyJoGMvM0WGVM7YNH/JZgVx5wyZJGb3J1rAgNBgsZ8pwWx7KJvqUyD9g9oxkUs4FOC6d
	AR/sn5qcz8ZouoVtIy1ecdsmzkVyKsiBjDbKW43fIHrBr9o3eC8hy/bliWkyqCff0uEyTPT4bXn
	HS5qQNW/HpHoefiKbWQzANKwzabWev67PshYQCYkTDgHIBwNXxgTQ6WHJ5vMLpY2W6eNLJnHITL
	lINodafVK5u8lOszVmrDG2HiXUAEINP3E5gpevCFOQha847uUkusbgp5SRknbz7aopUa6/0yfr3
	+CkAq1JwCPZbMbudxhqm+kJby/0Tn2Xnb8ihjkcaromCO6QDxnywWmOYtqEX/4UirtKbndhvf/Q
	r/qwZcDQLXrLU8cZf+p3rfUHDyHpPEpWdykb5DzIOIuMDeYYGLO9Xy+aXP4RYea9aeU8nFalYQG
	yXFcA==
X-Received: by 2002:a17:903:46c7:b0:2a7:5652:50b2 with SMTP id d9443c01a7336-2aea456730emr562725ad.9.1773095524481;
        Mon, 09 Mar 2026 15:32:04 -0700 (PDT)
Received: from google.com (197.23.125.34.bc.googleusercontent.com. [34.125.23.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4867e54sm11494132b3a.35.2026.03.09.15.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:32:02 -0700 (PDT)
Date: Mon, 9 Mar 2026 22:31:56 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	kvmarm <kvmarm@lists.cs.columbia.edu>, kvm@vger.kernel.org,
	Will McVicker <willmcvicker@google.com>
Subject: Re: [PATCH v4 09/17] perf/core: Use static_call to optimize
 perf_guest_info_callbacks
Message-ID: <20260309223156.GA73501@google.com>
References: <20211111020738.2512932-1-seanjc@google.com>
 <20211111020738.2512932-10-seanjc@google.com>
 <YfrQzoIWyv9lNljh@google.com>
 <CABCJKufg=ONNOvF8+BRXfLoTUfeiZZsdd8TnpV-GaNK_o-HuaA@mail.gmail.com>
 <202202061011.A255DE55B@keescook>
 <YgAvhG4wvnslbTqP@hirez.programming.kicks-ass.net>
 <202202061854.B5B11282@keescook>
 <aa8fNT3P54t5W53T@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa8fNT3P54t5W53T@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_153206_839019_7D290D7B 
X-CRM114-Status: GOOD (  23.44  )
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

Hi Carlos,

On Mon, Mar 09, 2026 at 07:27:49PM +0000, Carlos Llamas wrote:
> On Sun, Feb 06, 2022 at 06:55:56PM -0800, Kees Cook wrote:
> > On Sun, Feb 06, 2022 at 09:28:52PM +0100, Peter Zijlstra wrote:
> > > On Sun, Feb 06, 2022 at 10:45:15AM -0800, Kees Cook wrote:
> > > 
> > > > I'm digging through the macros to sort this out, but IIUC, an example of
> > > > the problem is:
> > > > 
> > > 
> > > > so the caller is expecting "unsigned int (*)(void)" but the prototype
> > > > of __static_call_return0 is "long (*)(void)":
> > > > 
> > > > long __static_call_return0(void);
> > > > 
> > > > Could we simply declare a type-matched ret0 trampoline too?
> > > 
> > > That'll work for this case, but the next case the function will have
> > > arguments we'll need even more nonsense...
> > 
> > Shouldn't the typeof() work there too, though? I.e. as long as the
> > return value can hold a "0", it'd work.
> 
> I gave this a shot but then hit a wall with the arguments indeed:
> 
> typedef int (perf_snapshot_branch_stack_t)(struct perf_branch_entry *entries,
> 					   unsigned int cnt);
> [...]
> DEFINE_STATIC_CALL_RET0(perf_snapshot_branch_stack, perf_snapshot_branch_stack_t);
> 
> I can generate a stub with the matching return type using typeof() but
> the arguments have to be fixed e.g. to (void):
> 
> #define DEFINE_STATIC_CALL_RET0(name, _func)				\
> 	static inline typeof(((typeof(_func)*)0)())			\
> 		__static_call_ret0_##name(void) { return 0; }		\
> 	__DEFINE_STATIC_CALL(name, _func, __static_call_ret0_##name)
> 
> I believe this would work for most perf callbacks cases except the one
> above because the arguments would generate a different hash for CFI.

If you need a stub with a matching CFI type for an arbitrary function,
perhaps you can do something like this (arm64, untested):

  #define DEFINE_TYPED_STUB_RET0(name, reffunc)			\
	typeof(reffunc) name;					\
	__ADDRESSABLE(name);					\
	asm(							\
	"	" __ALIGN_STR "				\n"	\
	"	.4byte	__kcfi_typeid_" #name "		\n"	\
	#name ":					\n"	\
	"	bti c					\n"	\
	"	mov x0, xzr				\n"	\
	"	ret					"	\
	)

For the !CONFIG_CFI case, or architectures that implement static calls,
you can probably just point the stub to __static_call_return0:

  #define DEFINE_TYPED_STUB_RET0(name, reffunc) \
	typeof(reffunc) name __asm__("__static_call_return0")

Sami

