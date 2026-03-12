Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E83FED2F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6m3iVjAJ3GnbX16/A8yr0Uv8IZ6KsZjKuUcZqEbIVJA=; b=osxdG4RspToC4RWUKaNG3F1q50
	Js5Wp23aWlHKPKymv9eaNaAhDSSP/32rXBrDl38OiuemGm0n4KoJ1VF3d+ouqtxsaFDyW3fMktaHm
	ZzBJcqaLY9EdTdA21mpEsP5JGvdU2/oysj/Dwt+BctbT+1UXMlnP160fIB54uuvTA4di85yL/wH1a
	ZmFbZhxWzh6TgnAvKlIe07I78v6BOO9d1Wm26Ek0XgrZKYfUqXmhOrYmzOrcq8I1yxeD7DIYQaLvb
	p9A8ArL2usxXL27DZjh0mZ9QRMebCelmSbtHf5oUdMgI16u0rsYBbeG0Mx0SF1d68LBCciT1DtKNJ
	Sab8wcRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bpD-0000000DfYl-2vTq;
	Thu, 12 Mar 2026 08:55:23 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bpA-0000000DfXn-3OLg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:55:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so6798545e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 01:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773305719; x=1773910519; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6m3iVjAJ3GnbX16/A8yr0Uv8IZ6KsZjKuUcZqEbIVJA=;
        b=Sb/eZap21jrg6FHEcy602lJ2VhXtllFeJkz24xx2fn0OvQgi3yrFQZ8fHGHfgqd9x2
         YzqVzb8Vnxl5XY5cw4oSAITY0c2K2E2mO+IFy8J74Nl9FHH6IEgLoKeJi1v8GAo2GQq6
         r1kUeNITwPkAmoMXfUwNxzQSzx9SZXwU6OfWFCEIlmOMPHoZBEF/k2PNFyXgsEFaAlYj
         Yfadrjdm6nIZVdwd5Y23+RyBT8YxzP7vPVgxEZD0RRsEkH/5cU5BoQBMWqlLNB31d6ou
         dwG0GVzW0GB5ThcbKt5RQWTe0CfARlgOOSnQR6QmolfjZrwF+JNuOEUiEu81pf1GyG1+
         c44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773305719; x=1773910519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6m3iVjAJ3GnbX16/A8yr0Uv8IZ6KsZjKuUcZqEbIVJA=;
        b=ubuTGOXXTI9/VQna4lCK5G3vURVzyGkeiS7GOgS40ofRzQ+RyCLpJksx8oUHTVWR6o
         TQeIBlr2xg8gdtKSo6EdPysVZjhuSvuuW2I75exNtjbTU83b/WkNrua7/foNa62+RYNp
         FUvuO68BnkKppGX6L3SfmwegJfixbEP0rAF9aZJZsFY+mjZj4OLXb+eSXCFr7ps3yFr1
         IqggSWMASKqQxmVQgpAJY8/2yaJgd8NzbXmzvNQuCq7X41zEP1A2H3v/6moFfkFkpQk5
         i8YfzmpGDNpwacunsTZ7o1CaTUrmFVGf2fH/9pOuB88utjtGBEBnP38AdXZJ44l3RNY4
         2M5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGlurjQfewpKmW4wU+OEQKRdTw0EID+cxGyjkEcjhDjfZefo6h7Vp30+O2ZnThzn2pe7xB6jTIMeb3ZqMa08qy@lists.infradead.org
X-Gm-Message-State: AOJu0YwjwBeo+Gbx2uP/D66wd51nx7dmdF1Lhqj9dYjTk4a+my3ptluY
	AHyVYpvlQZmNfm/XYqI+wIt3AzLT+6DoBVUH0cnP8u2P4Ma8s5Jm2tVMi71JfI2d5A==
X-Gm-Gg: ATEYQzwr6RQ2avAbtgZNf4iulaPReXVbsi9QyH4spSmDIuF20m87kDVFbUwp0v/2Lmc
	rrUJdkiqIF7LOOLEk+5uC3FPQvIYKDj/Ao1S6hkP77Ax/79REEC/6pWQn99kfKx1n+85SPoyLlq
	4KCNOTsV+35c9wAr3vYTEYH1F7Eu5UhwQPAvdEzQoYygWUEo2NOE6K9jwQ0x49invpJ5qcEmJNu
	0Bnqi3I1643+XUukYIrjLOZk4J0Axzued09EepCk3txtoACAg42ZeoK2Wjh4BPLqbLSLs3YvKpB
	5sOfe2MKZf2JaiGHdxGXpjfQt821Bb7mtmxPGbGqKcAajp/kxy+k9UX9rRXQQzAwJsCKfNZM6Kz
	e66nDeT6bypp/S94HI169X4i5VFGJlFssgXg5y+H5bU0ZCP3tq4JFjD9OiqvpaNR4lY7LQmibTP
	4U5hdDcUYV1R2gxPq09yuvgta/TVLmgOD1D6qPSvOziBFMl/8Ykb7Gthsp56x0d76/m0s=
X-Received: by 2002:a05:600c:4455:b0:485:3e6c:aa84 with SMTP id 5b1f17b1804b1-4854b13b3cbmr83483945e9.33.1773305718060;
        Thu, 12 Mar 2026 01:55:18 -0700 (PDT)
Received: from google.com (198.115.140.34.bc.googleusercontent.com. [34.140.115.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b47145dsm110869815e9.0.2026.03.12.01.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:55:17 -0700 (PDT)
Date: Thu, 12 Mar 2026 08:55:14 +0000
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
Message-ID: <abJ_cm_yM3Q-99GL@google.com>
References: <20260309162516.2623589-1-vdonnefort@google.com>
 <20260309162516.2623589-19-vdonnefort@google.com>
 <20260311221816.GA316631@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311221816.GA316631@ax162>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_015521_463954_634EBF48 
X-CRM114-Status: GOOD (  30.05  )
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

On Wed, Mar 11, 2026 at 03:18:16PM -0700, Nathan Chancellor wrote:
> Hi Vincent,
> 
> On Mon, Mar 09, 2026 at 04:25:04PM +0000, Vincent Donnefort wrote:
> > The simple_ring_buffer implementation must remain simple enough to be
> > used by the pKVM hypervisor. Prevent the object build if unresolved
> > symbols are found.
> > 
> > Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> > index d106beca8d7f..3182e1bc1cf7 100644
> > --- a/kernel/trace/Makefile
> > +++ b/kernel/trace/Makefile
> > @@ -132,4 +132,20 @@ obj-$(CONFIG_TRACE_REMOTE) += trace_remote.o
> >  obj-$(CONFIG_SIMPLE_RING_BUFFER) += simple_ring_buffer.o
> >  obj-$(CONFIG_TRACE_REMOTE_TEST) += remote_test.o
> >  
> > +#
> > +# simple_ring_buffer is used by the pKVM hypervisor which does not have access
> > +# to all kernel symbols. Fail the build if forbidden symbols are found.
> > +#
> > +UNDEFINED_ALLOWLIST := memset alt_cb_patch_nops __x86 __ubsan __asan __kasan __gcov __aeabi_unwind
> > +UNDEFINED_ALLOWLIST += __stack_chk_fail stackleak_track_stack __ref_stack __sanitizer
> > +UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
> > +
> > +quiet_cmd_check_undefined = NM      $<
> > +      cmd_check_undefined = test -z "`$(NM) -u $< | grep -v $(UNDEFINED_ALLOWLIST)`"
> 
> This check triggers when building allmodconfig targeting arm, arm64,
> powerpc, and x86_64 (at least, I did not test more at the moment) with
> clang. If this is a hard failure, this really needs to print something
> out to the developer/user to help them debug off the bat, versus having
> to manually dig the $(NM) command out from the .cmd file or V=1. I came
> up with
> 
> diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> index 3182e1bc1cf7..c725b06876bc 100644
> --- a/kernel/trace/Makefile
> +++ b/kernel/trace/Makefile
> @@ -141,7 +141,13 @@ UNDEFINED_ALLOWLIST += __stack_chk_fail stackleak_track_stack __ref_stack __sani
>  UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
>  
>  quiet_cmd_check_undefined = NM      $<
> -      cmd_check_undefined = test -z "`$(NM) -u $< | grep -v $(UNDEFINED_ALLOWLIST)`"
> +      cmd_check_undefined = \
> +          undefsyms=$$($(NM) -u $< | grep -v $(UNDEFINED_ALLOWLIST) || true); \
> +          if [ -n "$$undefsyms" ]; then \
> +              echo "Unexpected symbols in $<:" >&2; \
> +              echo "$$undefsyms" >&2; \
> +              false; \
> +          fi
>  
>  $(obj)/%.o.checked: $(obj)/%.o FORCE
>  	$(call if_changed,check_undefined)
> --
> 
> which prints
> 
>   Unexpected symbols in kernel/trace/simple_ring_buffer.o:
>                    U llvm_gcda_emit_arcs
>                    U llvm_gcda_emit_function
>                    U llvm_gcda_end_file
>                    U llvm_gcda_start_file
>                    U llvm_gcda_summary_info
>                    U llvm_gcov_init
> 
> for arm64, which makes sense since these are LLVM specific GCOV symbols,
> so they should probably get the same treatment as the other ones:
> 
> diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> index c725b06876bc..d464e3aa5bdd 100644
> --- a/kernel/trace/Makefile
> +++ b/kernel/trace/Makefile
> @@ -136,8 +136,8 @@ obj-$(CONFIG_TRACE_REMOTE_TEST) += remote_test.o
>  # simple_ring_buffer is used by the pKVM hypervisor which does not have access
>  # to all kernel symbols. Fail the build if forbidden symbols are found.
>  #
> -UNDEFINED_ALLOWLIST := memset alt_cb_patch_nops __x86 __ubsan __asan __kasan __gcov __aeabi_unwind
> -UNDEFINED_ALLOWLIST += __stack_chk_fail stackleak_track_stack __ref_stack __sanitizer
> +UNDEFINED_ALLOWLIST := memset alt_cb_patch_nops __x86 __ubsan __asan __kasan __gcov llvm_gcda llvm_gcov
> +UNDEFINED_ALLOWLIST += __aeabi_unwind __stack_chk_fail stackleak_track_stack __ref_stack __sanitizer
>  UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
>  
>  quiet_cmd_check_undefined = NM      $<
> --
> 
> For x86_64, I see
> 
>   Unexpected symbols in kernel/trace/simple_ring_buffer.o:
>                    U __clear_pages_unrolled
>                    U __memmove
>                    U copy_page
> 
> which comes from the use of KCFI_ADDRESSABLE(), since allmodconfig has
> CONFIG_CFI=y.
> 
> For powerpc (with both clang and GCC), I see
> 
>   Unexpected symbols in kernel/trace/simple_ring_buffer.o:
>                    U .TOC.
> 
> For arm (with both clang and GCC), I see
> 
>   Unexpected symbols in kernel/trace/simple_ring_buffer.o:
>            U __stack_chk_guard
>            U warn_slowpath_fmt
> 
> Presumably adding all of those should be fine as well?
> 
> diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> index d464e3aa5bdd..4f120cb8c79c 100644
> --- a/kernel/trace/Makefile
> +++ b/kernel/trace/Makefile
> @@ -137,7 +137,8 @@ obj-$(CONFIG_TRACE_REMOTE_TEST) += remote_test.o
>  # to all kernel symbols. Fail the build if forbidden symbols are found.
>  #
>  UNDEFINED_ALLOWLIST := memset alt_cb_patch_nops __x86 __ubsan __asan __kasan __gcov llvm_gcda llvm_gcov
> -UNDEFINED_ALLOWLIST += __aeabi_unwind __stack_chk_fail stackleak_track_stack __ref_stack __sanitizer
> +UNDEFINED_ALLOWLIST += __aeabi_unwind __stack_chk_fail __stack_chk_guard stackleak_track_stack __ref_stack __sanitizer
> +UNDEFINED_ALLOWLIST += \.TOC\. __clear_pages_unrolled __memmove copy_page warn_slowpath_fmt
>  UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
>  
>  quiet_cmd_check_undefined = NM      $<
> --
> 
> I don't mind sending a series for these, I just wanted to make sure I
> was reasoning about everything correctly.

Yes this is all fine. If you have something already, please send it. Meanwhile, I'll try
something a bit more durable. 

Thanks,
Vincent

> 
> Cheers,
> Nathan

