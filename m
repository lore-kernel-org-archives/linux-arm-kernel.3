Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DB6C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 19:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxc3AA271rP0clF1WTv1WRpUSSHlH6QI7su8jxLA6Qg=; b=OdelzDHcyHu2+o6Za8RBCOoPz/
	oV5cboWklGEmD0ZiYBBw7iCa5InV+FS45BZY89aaMRVKrToqrdJFVI662KDd2L5v9Zu/X5RUIpAO6
	PvvgRVHsTj+PRE1YzG2gvwy5PUyO6cyTBNLtatSEO19J5pbI34azDWxQpO55PBDh+KLmZoNYkWbTb
	qR0DxnAvsewlvGvmO50vZ39bkxmhHnclrQWwWzH2e0Sno/4RQWc+uonlxIn0ACmIzsKaoqX9/pixO
	tWv2DGXRcVfbjtO1r1sXiqKNkEzolNeRlJijUMLLKrhHrQtcGzB1M6OChxUo45XpV5ZK0pNYgTBeB
	dcr0I0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC1C7-00000008N9y-26y6;
	Mon, 05 May 2025 19:09:39 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC18M-00000008Ms7-3mc4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 19:05:48 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22e1eafa891so29885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 12:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746471945; x=1747076745; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nxc3AA271rP0clF1WTv1WRpUSSHlH6QI7su8jxLA6Qg=;
        b=3HTKwAjCQdVRduS9OJ9EHwGevlNll1aouVH2RA5nH/Y+xaFKEqCqOT7QdXrBRvmFNI
         VRe0+2aONo0GeHpx1QcDcfp8vr7qe46iDJXDALZ2CVi8o65vXtRjGCrK7lKhfqW6hDPo
         7Zrm42sn3dB8eI2vp44PAnrvGkEr72RGfRR9cFO9gc5o/y1fNS+/ssYpalYsBK/yA0K8
         Nx/FvdAAKDtB7YEiUz+I1waYrZUYQNRmKjVeRiQfSojxc03n+D61BeWsuFduI0/klYbp
         JoUla3K0iCfwesZmVBMZ4Vko4NbM2NZutOx3s2HyzI2rNArr3wHr7YcEew8GktZ+guv8
         m0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746471945; x=1747076745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxc3AA271rP0clF1WTv1WRpUSSHlH6QI7su8jxLA6Qg=;
        b=aVX2olgUUCRHB1ItE0ef5BpBKsxcd+1kuyxISlRq9Oz0QtGktIDYSHTZjva1Nimlv8
         Oac3MS8/coWoteVuzq+HSxRjjxGD5xqRgDOOHYqEt6MEHKegDbMA4LG8w2Vj5AUXi3xs
         FIkWeSWvavB++XQjMPf1b6I56EZQUF7prcoFvTtCLJBwfExbfZQVkKsqTf+lQ4bS0Dla
         bLC/NOW9I465KnGJ6V1VpYa6jrAArFy2QKk+w1OSYgwRh2Fh9defLan9FjyL+Ualb243
         hinfa3FFg2W87L/UU3vtDCbFi2/KLXM3Y85K/igifISFan1pApvdqDXGdHJQ2COrP0Uz
         us8g==
X-Forwarded-Encrypted: i=1; AJvYcCXORaROZQ6gXXvHCgpBsMOX1aT36YHmvyaZNzKb8pO6nJ1DLKj833d1oOVOr5Tf4j9TCcYmwxxuGRj1JlChttSP@lists.infradead.org
X-Gm-Message-State: AOJu0YwUT3jdISVnEbgMxzA2dz49ayVIEWpxcSgSfnIQqEv8JXa5utrr
	IDU1xCaUlfdvWQUDlpWm7XAdw3VaHHjYxhc4kqlJ8zd5ihJLTHRJYhVwsRFMww==
X-Gm-Gg: ASbGncvuMKBHcT+4dNCkgh3xCdHwred7EA400SO6KO1ZhII0f/ASxLe8+kUb1JbENdy
	imDb9UAzfvq6bUtrcHFBUOfn43eSKJKXe6JJc+QjVrMxsSGJeSBi5GdjfYMJDY0/i1O4pZD5kiy
	kPvfjopgVgJZn414tg8WBejNMF0mPX73UM5PaZ1+lw9FzBsCpEJB+NaFiz7xBzBxI+dZofC4frn
	pcoQr69oag3zpTx1ZH5VtSaoWFsnou9uYIKqdBwo8qfG0AdUvZ+qtqB+mJ/glFNAyN4EiID0Rlx
	keKPcKy054JxDwERzywfBWZZrnzx25qWz/OTHEiWRpIPW/dxylTXbHTIY4NesZI1JrHSq6eEJmo
	=
X-Google-Smtp-Source: AGHT+IFASicqsLQoC4gNxHelYC0aG3lNabvqq0UOOhgv1HOFYapFQUFpIvWUjmSTv3Puo5pNrUg8AQ==
X-Received: by 2002:a17:903:46cd:b0:223:37ec:63be with SMTP id d9443c01a7336-22e34dee32bmr461265ad.4.1746471945198;
        Mon, 05 May 2025 12:05:45 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522fa16sm58920035ad.239.2025.05.05.12.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 12:05:44 -0700 (PDT)
Date: Mon, 5 May 2025 12:05:38 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	pbonzini@redhat.com, anup@brainfault.org, borntraeger@linux.ibm.com,
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, maz@kernel.org,
	oliver.upton@linux.dev
Subject: Re: [PATCH 1/2] KVM: selftests: Add default testfiles for KVM
 selftests runner
Message-ID: <20250505190538.GA1168139.vipinsh@google.com>
References: <20250222005943.3348627-1-vipinsh@google.com>
 <20250222005943.3348627-2-vipinsh@google.com>
 <aBJXabTuiJyRZb-O@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBJXabTuiJyRZb-O@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_120546_945045_C2346D29 
X-CRM114-Status: GOOD (  30.65  )
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

On 2025-04-30 10:01:29, Sean Christopherson wrote:
> On Fri, Feb 21, 2025, Vipin Sharma wrote:
> We definitely auto-generate the default testcases.  Relying on the user to remember
> to add a testcase, and on the maintainer to remember to check for that, isn't a
> winning strategy.

Good idea, this will help in at least automatically run the default tests.
Also, if tests are in the selftest kvm source directory then it will
give an hint to developer/maintainer that they missed writing a default
test file for a newly introduced test when they run git status.

> 
> But, I do think we should commit the default.test files to the repository.  If
> they're ephemeral, then several problems arise:
> 
>  1. For out-of-tree builds, the default.test files should arguably be placed in
>     the OUTPUT directory.  But if/when we add curated testcases/, then we'll either
>     end up with multiple testcases/ directories (source and output), or we'll have
>     to copy testcases/ from the source to the output on a normal build, which is
>     rather gross.  Or we'd need e.g. "make testcases", which is also gross, e.g.
>     I don't want to have to run yet more commands just to execute tests.
> 
>  2. Generating default.test could overwrite a user-defined file.  That's firmly
>     a user error, but at least if they default.test files are commited, the user
>     will get a hint or three that they're doing things wrong.
> 
>  3. If the files aren't committed, then they probably should removed on "clean",
>     which isn't the end of the world since they're trivially easy to generate,
>     but it's kinda funky. 
> 
> So, what if we add this to auto-generate the files?  It's obviously wasteful since
> the files will exist 99.9999999% of the time, but the overhead is completely
> negligible.  The only concern I have is if this will do the wrong thing for some
> build environments, i.e. shove the files in the wrong location.

We can get the current path of the Makefile.kvm by writing this at the top
of the Makefile.kvm:
	MAKEFILE_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

Then MAKEFILE_DIR will have the source directory of Makfile.kvm and
testcase will be in the same directory.

With this we can modify the below foreach you wrote by prefixing
MAKEFILE_DIR to "testcases".

Does this alleviate concern regaring build environment?

> 
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index f62b0a5aba35..d94bb8330ad1 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -198,6 +198,13 @@ TEST_GEN_PROGS += $(TEST_GEN_PROGS_$(ARCH))
>  TEST_GEN_PROGS_EXTENDED += $(TEST_GEN_PROGS_EXTENDED_$(ARCH))
>  LIBKVM += $(LIBKVM_$(ARCH))
>  
> +$(foreach tc, $(TEST_PROGS), $(shell mkdir -p testcases/$(patsubst %.sh,%,$(tc))))
> +$(foreach tc, $(TEST_GEN_PROGS), $(shell mkdir -p testcases/$(tc)))
> +$(foreach tc, $(TEST_PROGS), \
> +  $(shell echo $(tc) > $(patsubst %.sh,testcases/%/default.test,$(tc))))
> +$(foreach tc, $(TEST_GEN_PROGS), \
> +  $(shell echo $(tc) > $(patsubst %,testcases/%/default.test,$(tc))))
> +

This looks good.

> > diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
> > index 1d41a046a7bf..550b7c2b4a0c 100644
> > --- a/tools/testing/selftests/kvm/.gitignore
> > +++ b/tools/testing/selftests/kvm/.gitignore
> > @@ -9,4 +9,5 @@
> >  !config
> >  !settings
> >  !Makefile
> > -!Makefile.kvm
> > \ No newline at end of file
> > +!Makefile.kvm
> > +!*.test
> 
> Let's keep the extension wildcards sorted alphabetically, i.e.:
> 
> # SPDX-License-Identifier: GPL-2.0-only
> *
> !/**/
> !*.c
> !*.h
> !*.py
> !*.S
> !*.sh
> !*.test
> !.gitignore
> !config
> !settings
> !Makefile
> !Makefile.kvm
> 

Okay.

> > diff --git a/tools/testing/selftests/kvm/testcases/aarch64/aarch32_id_regs/default.test b/tools/testing/selftests/kvm/testcases/aarch64/aarch32_id_regs/default.test
> > new file mode 100644
> > index 000000000000..5db8723f554f
> > --- /dev/null
> > +++ b/tools/testing/selftests/kvm/testcases/aarch64/aarch32_id_regs/default.test
> > @@ -0,0 +1 @@
> > +./aarch64/aarch32_id_regs
> 
> I don't see any reason to make the paths directly consumable with a leading "./".
> Spoiler alert from the next patch: the location of the test executables needs to
> explicitly resolved by the test runner.

I will remove this.

