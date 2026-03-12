Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07411067027
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 14:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=viC1gPLlOGctSWu83HWjGEsXF70NJAe1D+sqpq58byY=; b=KuUW19wYjLxhQElb1al985wW+1
	m0xVXrQaRhepv2q+1PCs5eaJ34TAZGn30a9tcTv2iH6cra6r1PaC/QOxR8nakgn1WukSy/TVGbhY0
	lNCEE6nQasTNeUxeWBzstbw2/gj87P2x8etCGO6rO3qT2SLRzZpG9pDz7MaPJLwf6FlPvkpZG0AfC
	tllcThF2oZwFSiiAGDIWyFQN5DfW3yMw1FqNMNUXRHZc1US6EXVDcSkSMYs/huJ6Ye69UMxPGe1WJ
	TaA23P0Pyi3T6nl7ecZGg9H//dWlK60asCzj5OdRtDZnT1S+ZBoMztt2HBTEItCW0Tb39DB5r0kbN
	gNZChrDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ghg-0000000EB07-1VDu;
	Thu, 12 Mar 2026 14:07:56 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ghd-0000000EAzk-0mP8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 14:07:55 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-439ce3605ecso871451f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 07:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773324471; x=1773929271; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=viC1gPLlOGctSWu83HWjGEsXF70NJAe1D+sqpq58byY=;
        b=a8rrlhoUjbDfEXMNWQMauAG4ACkAQrf8zES0mbtomGV1mCvwaYNHlP789g79KuM3TR
         k0GIGRqzF8r5isfw66EUoRXXxcFSTe4yXjcfRqz7qKavXyeUJE9f4JYMw+TcD+8vz46H
         Ov+kna/IvmisBeRs6BHqhtIHYBK6Zxvg3G9EmgjCRfMjkAX+laTBRDztzbkoBpSoph+3
         tJqYjQKUzPmKuobQobW4d0L+17p8D+w5SvNA3WZXbtc2Y75SNEfwiADFAVDqeyljuO07
         ePokxn6jA9oX0UWJqXePIFkKtPQnpYb2JefK4Iy/OaQ5cb9LizI4pQ/yWrHZOb+ZMZQJ
         NYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773324471; x=1773929271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=viC1gPLlOGctSWu83HWjGEsXF70NJAe1D+sqpq58byY=;
        b=t04owBUa5L7b0oNqwlv+GPOCZCSP5lps9XqmEA8Zq2YVl0B8wBzDizI1SwzABpWuoc
         QEF5MILFgw6FeZi6KOxhw7bTrfgrnNvxDr0MlO+99iLbrcSXfGJR1WqgGu2pq/umWEBm
         28/Dsjs6ZQL07xDYXGBglASG5jpy5CCpsqnU7S+/U6S4djEiXWnykpZzXC0ZDoYDEq+y
         rKumhQLpDNOBUB3+c0XsmtDmLki8clFPwWZSGzgtQDWlV3qwq3QhqQ15shBjGFhSou0K
         tx9/qZbGw8Bu+gXAynDnV0TBD++FsvjjFuJZZr9GvgW2MOeQlDrnFNhuhfJb750SumHr
         kqFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGZIRVwa7VR2LndUpLXLcoMMFRzW5TprAa7Z6Cj2WsijCKcteFdRT+cq/sQxrI3rK+phPVNErTVyBRH42+hVRD@lists.infradead.org
X-Gm-Message-State: AOJu0YxOwdKszNgmg95/2DPVxXP057G48XnF7xrJAEMIj4zK+7XiImJx
	dDB9I+K/ftJMi2IvfusMq1x2kKNQE58cwHpXG8I90R4sdK1qUA4f7BbMbnDAW0fyMQ==
X-Gm-Gg: ATEYQzz+AQfaHFWAFu+2KOdKL4vE+fCaJSNBgPk0DCtPh0ICHleuwbcwRxoIHxKUJHP
	mdn4z/jKRmXDZlICT1YHdKZSgAeuTI+48mEJ0s0bF7qc1fFHJABxFrLcFIVHACZiGCUktRrhp5Q
	FUV5MNp1CofHFyfzEc7sXFuraJZycDqcNph1N7N3dBVyyYPpO4sgXlKn+GFlSVPphg85OXjuZeK
	0Bp4gfPoY/by/X1iJ7Sq2vmfz50tO/92n+8oWlDyyBD0oGexJSudKmY48XGxGx4UFnrpBLUIHHW
	A8ZAePUlwiAPRXyxvCYtiRR/tq0U2834lRWmQQnSDtL++sunPaw7rInTxlISVN3QTLKCiwWhZof
	OL0A9XM6OQq+dYk3P8SJWoepWvj1rGo0+bzZX/PYt4ehFl1j+/HLEcv2DIlQg0TqzdaSjiKIYxD
	zgqq2QgUHPxzjORbs1cnHmfVgD/Dl1NNOqONmUpp3nK/mMxJqJ3DnmPCoICY1ZozZLaX4YW1QFE
	RpUDA==
X-Received: by 2002:a05:6000:2012:b0:439:cb20:f30c with SMTP id ffacd0b85a97d-439f81c77c9mr13119179f8f.23.1773324470601;
        Thu, 12 Mar 2026 07:07:50 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a76e5sm8108613f8f.12.2026.03.12.07.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 07:07:50 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:07:46 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	jstultz@google.com, qperret@google.com, will@kernel.org,
	aneesh.kumar@kernel.org, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v14 18/30] tracing: Check for undefined symbols in
 simple_ring_buffer
Message-ID: <abLIslqIcVscZRFg@google.com>
References: <20260309162516.2623589-1-vdonnefort@google.com>
 <20260309162516.2623589-19-vdonnefort@google.com>
 <20260311221816.GA316631@ax162>
 <abJ_cm_yM3Q-99GL@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abJ_cm_yM3Q-99GL@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_070754_455416_910F6D58 
X-CRM114-Status: GOOD (  34.43  )
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

On Thu, Mar 12, 2026 at 08:55:14AM +0000, Vincent Donnefort wrote:
> On Wed, Mar 11, 2026 at 03:18:16PM -0700, Nathan Chancellor wrote:
> > Hi Vincent,
> > 
> > On Mon, Mar 09, 2026 at 04:25:04PM +0000, Vincent Donnefort wrote:
> > > The simple_ring_buffer implementation must remain simple enough to be
> > > used by the pKVM hypervisor. Prevent the object build if unresolved
> > > symbols are found.
> > > 
> > > Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > > 
> > > diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> > > index d106beca8d7f..3182e1bc1cf7 100644
> > > --- a/kernel/trace/Makefile
> > > +++ b/kernel/trace/Makefile
> > > @@ -132,4 +132,20 @@ obj-$(CONFIG_TRACE_REMOTE) += trace_remote.o
> > >  obj-$(CONFIG_SIMPLE_RING_BUFFER) += simple_ring_buffer.o
> > >  obj-$(CONFIG_TRACE_REMOTE_TEST) += remote_test.o
> > >  
> > > +#
> > > +# simple_ring_buffer is used by the pKVM hypervisor which does not have access
> > > +# to all kernel symbols. Fail the build if forbidden symbols are found.
> > > +#
> > > +UNDEFINED_ALLOWLIST := memset alt_cb_patch_nops __x86 __ubsan __asan __kasan __gcov __aeabi_unwind
> > > +UNDEFINED_ALLOWLIST += __stack_chk_fail stackleak_track_stack __ref_stack __sanitizer
> > > +UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
> > > +
> > > +quiet_cmd_check_undefined = NM      $<
> > > +      cmd_check_undefined = test -z "`$(NM) -u $< | grep -v $(UNDEFINED_ALLOWLIST)`"
> > 
> > This check triggers when building allmodconfig targeting arm, arm64,
> > powerpc, and x86_64 (at least, I did not test more at the moment) with
> > clang. If this is a hard failure, this really needs to print something
> > out to the developer/user to help them debug off the bat, versus having
> > to manually dig the $(NM) command out from the .cmd file or V=1. I came
> > up with
> > 
> > diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> > index 3182e1bc1cf7..c725b06876bc 100644
> > --- a/kernel/trace/Makefile
> > +++ b/kernel/trace/Makefile
> > @@ -141,7 +141,13 @@ UNDEFINED_ALLOWLIST += __stack_chk_fail stackleak_track_stack __ref_stack __sani
> >  UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
> >  
> >  quiet_cmd_check_undefined = NM      $<
> > -      cmd_check_undefined = test -z "`$(NM) -u $< | grep -v $(UNDEFINED_ALLOWLIST)`"
> > +      cmd_check_undefined = \
> > +          undefsyms=$$($(NM) -u $< | grep -v $(UNDEFINED_ALLOWLIST) || true); \
> > +          if [ -n "$$undefsyms" ]; then \
> > +              echo "Unexpected symbols in $<:" >&2; \
> > +              echo "$$undefsyms" >&2; \
> > +              false; \
> > +          fi
> >  
> >  $(obj)/%.o.checked: $(obj)/%.o FORCE
> >  	$(call if_changed,check_undefined)
> > --
> > 
> > which prints
> > 
> >   Unexpected symbols in kernel/trace/simple_ring_buffer.o:
> >                    U llvm_gcda_emit_arcs
> >                    U llvm_gcda_emit_function
> >                    U llvm_gcda_end_file
> >                    U llvm_gcda_start_file
> >                    U llvm_gcda_summary_info
> >                    U llvm_gcov_init
> > 
> > for arm64, which makes sense since these are LLVM specific GCOV symbols,
> > so they should probably get the same treatment as the other ones:
> > 
> > diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> > index c725b06876bc..d464e3aa5bdd 100644
> > --- a/kernel/trace/Makefile
> > +++ b/kernel/trace/Makefile
> > @@ -136,8 +136,8 @@ obj-$(CONFIG_TRACE_REMOTE_TEST) += remote_test.o
> >  # simple_ring_buffer is used by the pKVM hypervisor which does not have access
> >  # to all kernel symbols. Fail the build if forbidden symbols are found.
> >  #
> > -UNDEFINED_ALLOWLIST := memset alt_cb_patch_nops __x86 __ubsan __asan __kasan __gcov __aeabi_unwind
> > -UNDEFINED_ALLOWLIST += __stack_chk_fail stackleak_track_stack __ref_stack __sanitizer
> > +UNDEFINED_ALLOWLIST := memset alt_cb_patch_nops __x86 __ubsan __asan __kasan __gcov llvm_gcda llvm_gcov
> > +UNDEFINED_ALLOWLIST += __aeabi_unwind __stack_chk_fail stackleak_track_stack __ref_stack __sanitizer
> >  UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
> >  
> >  quiet_cmd_check_undefined = NM      $<
> > --
> > 
> > For x86_64, I see
> > 
> >   Unexpected symbols in kernel/trace/simple_ring_buffer.o:
> >                    U __clear_pages_unrolled
> >                    U __memmove
> >                    U copy_page
> > 
> > which comes from the use of KCFI_ADDRESSABLE(), since allmodconfig has
> > CONFIG_CFI=y.
> > 
> > For powerpc (with both clang and GCC), I see
> > 
> >   Unexpected symbols in kernel/trace/simple_ring_buffer.o:
> >                    U .TOC.
> > 
> > For arm (with both clang and GCC), I see
> > 
> >   Unexpected symbols in kernel/trace/simple_ring_buffer.o:
> >            U __stack_chk_guard
> >            U warn_slowpath_fmt
> > 
> > Presumably adding all of those should be fine as well?
> > 
> > diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> > index d464e3aa5bdd..4f120cb8c79c 100644
> > --- a/kernel/trace/Makefile
> > +++ b/kernel/trace/Makefile
> > @@ -137,7 +137,8 @@ obj-$(CONFIG_TRACE_REMOTE_TEST) += remote_test.o
> >  # to all kernel symbols. Fail the build if forbidden symbols are found.
> >  #
> >  UNDEFINED_ALLOWLIST := memset alt_cb_patch_nops __x86 __ubsan __asan __kasan __gcov llvm_gcda llvm_gcov
> > -UNDEFINED_ALLOWLIST += __aeabi_unwind __stack_chk_fail stackleak_track_stack __ref_stack __sanitizer
> > +UNDEFINED_ALLOWLIST += __aeabi_unwind __stack_chk_fail __stack_chk_guard stackleak_track_stack __ref_stack __sanitizer
> > +UNDEFINED_ALLOWLIST += \.TOC\. __clear_pages_unrolled __memmove copy_page warn_slowpath_fmt
> >  UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
> >  
> >  quiet_cmd_check_undefined = NM      $<
> > --
> > 
> > I don't mind sending a series for these, I just wanted to make sure I
> > was reasoning about everything correctly.
> 
> Yes this is all fine. If you have something already, please send it. Meanwhile, I'll try
> something a bit more durable. 
> 
> Thanks,
> Vincent

In the end to unblock linux-next I have already sent an updated list of symbols.
However feel free to send the logging bit, that is surely useful.

> 
> > 
> > Cheers,
> > Nathan

