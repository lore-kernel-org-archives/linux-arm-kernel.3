Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B121D68BD7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 21:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nM0MnCaJJLmdERpqY9PV6u9+AmwEyhjWFW3qkZDsAPA=; b=s+j4AWtSEN1+mI0PKplD3JcmAh
	KDyoCO7pwOD/CRAPF/mXytBn75oNx9cMaRnt2qt7LAZw2kC34g2pR0qsx/8l+dyqJ1ykPkHlQKez1
	G/wbW3/5EkP2lVtodthtVuEirOTtpW0gUFDaz71MQTuo2aALMl70Ah3UYC8dypbybBhAvyUcwD/MX
	tJfsjfj+q0Yh47odyd6eJN6v7EPzQeLyJc5OjzSXwGCauuTd0RkC9ckTpf18fVl0vvORY7BY2TjRg
	NPRnEQmaQ4mOUXeBm9pJPMO3PaN7b4lqkG+vafyY3ENQ9cwQOzTp9o0SlPENTg6LmJHniD2FzWivT
	as+SOtyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC3gQ-000000049SS-3C29;
	Fri, 15 Nov 2024 21:16:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC3f6-000000049By-3i0M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 21:15:30 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20ca03687fdso34615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 13:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731705328; x=1732310128; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nM0MnCaJJLmdERpqY9PV6u9+AmwEyhjWFW3qkZDsAPA=;
        b=uu9GpErx7OIfP4kNTzs70pyiDxNQ68HjmpMUiC6uWKKAe0p4SvdpibBLcHLOUUYKTH
         czp+jZaPUNcSYRhMoNUMaqBueN7W92SN/ytENh9IpBh6yLK/yoXAJgRrtQhdAI+JxU3x
         hVFyuEEiK80VTVsnfBvVBGsoZSIUzgW/Kz1Dg+tmKrMeUU9R8PDVE/LFxW/IxWnIDw7Y
         Lk1UXOvstt15PX22Aglp7+uVRCgH+I0jwE9iTMbe94/gmONYzcHptPLb62LJMM72MKJV
         iC7UOt8YHQRs01dPtrkdp63EwxvQA1xTDDLbI24txt31hM5gz/V+bxk9sMXLd/dSuYsf
         ZxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731705328; x=1732310128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nM0MnCaJJLmdERpqY9PV6u9+AmwEyhjWFW3qkZDsAPA=;
        b=DPuSVXcDqLkJcFZYavZ7+l18j2KlE8KS6wfHW3j/LBE63ewLxP2+Nt2zENdDylFkG8
         kWQE5OXX12Z+VRphhCuVzFI6qfa2jhpipILCzj3ecGMdf/owJBICCUN4LeoLHqhobmoa
         3JjLGoXG+J9KuxLYAYklITWjq4OhKhc7g9ZrUeOvJAQ3OXGQrGOtfZbDw3NokLHjBhUA
         zEO7yb0GMoS6AnZMkv1iZlR0+taNkKfTXgDTh3Wg8Erv3XXgJivzG4m8xqn0VcA1n7/N
         tBVOeq8yiI7xqStEqYAEObAL4bxzjJyrNNSK7SRNtrxLkJZHOZb5YfMs8S43qIQITt66
         8tmA==
X-Forwarded-Encrypted: i=1; AJvYcCWj8/RNr+Effx3NqHfzl4+EBelz/m9aWGy2MIBLxRe4G4GCHGUw92bF/vhDq3vBi612h7qXev0q24v1GLrkeBl2@lists.infradead.org
X-Gm-Message-State: AOJu0YyTTFfJUmkfWaWSblGilqS09ZLzIvldbfPGTQFPwENhnDCgJKv0
	oIoP7EGowt0NopPbjpU3UV6zte0YbDn2BQSKUZdnEKjb/F21bVJv879YkEMyIg==
X-Gm-Gg: ASbGncujcM1Cp3oSJepUbboIxc57l6x1sMZWSmROnhQ7mYo6ET7PeUxvnkDP/FfOGhQ
	RUpJf7TntO+/SJXo5BBabqpPFdyEzg0EPElOj9tah5Qm7kkFjLuaL3zKHRQiTtSv2G+/bxBTS8D
	iV9lCvXjWXheo5e8fp/EDesEC4ocyQAWErJp1YHf88V3KCAHGJXfnJJwIPSkLM7R41Qjqmb1/fZ
	p9+HJ37B8s4DDCSp1RcWb/8DqnsjE4ip3ScN/Foa4FAx8VrFQsT04l/iwVK1BidymyDxgIKPUX3
	aMn7Pqyi
X-Google-Smtp-Source: AGHT+IG54m6rEFmImb5DSUuRdJgzvPLf5+rPUGSAVLO9hy0QHwDB3d2opaLJ5cQwhz6bZyjkGDS1Kw==
X-Received: by 2002:a17:902:f68d:b0:206:a87c:2873 with SMTP id d9443c01a7336-211ee1f5f05mr310055ad.5.1731705327532;
        Fri, 15 Nov 2024 13:15:27 -0800 (PST)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1c2deb3sm1746337a12.23.2024.11.15.13.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 13:15:26 -0800 (PST)
Date: Fri, 15 Nov 2024 13:15:23 -0800
From: Vipin Sharma <vipinsh@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anup Patel <anup@brainfault.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] KVM selftests runner for running more than just
 default
Message-ID: <20241115211523.GB599524.vipinsh@google.com>
References: <20240821223012.3757828-1-vipinsh@google.com>
 <CAHVum0eSxCTAme8=oV9a=cVaJ9Jzu3-W-3vgbubVZ2qAWVjfJA@mail.gmail.com>
 <CAHVum0fWJW7V5ijtPcXQAtPSdoQSKjzYwMJ-XCRH2_sKs=Kg7g@mail.gmail.com>
 <ZyuiH_CVQqJUoSB-@google.com>
 <20241108-eaacad12f1eef31481cf0c6c@orel>
 <ZzY2iAqNfeiiIGys@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzY2iAqNfeiiIGys@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_131528_944422_6FB9CC19 
X-CRM114-Status: GOOD (  48.29  )
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

On 2024-11-14 09:42:32, Sean Christopherson wrote:
> On Fri, Nov 08, 2024, Andrew Jones wrote:
> > On Wed, Nov 06, 2024 at 09:06:39AM -0800, Sean Christopherson wrote:
> > > On Fri, Nov 01, 2024, Vipin Sharma wrote:
> > > > Phase 3: Provide collection of interesting configurations
> > > > 
> > > > Specific individual constructs can be combined in a meaningful way to
> > > > provide interesting configurations to run on a platform. For example,
> > > > user doesn't need to specify each individual configuration instead,
> > > > some prebuilt configurations can be exposed like
> > > > --stress_test_shadow_mmu, --test_basic_nested
> > > 
> > > IMO, this shouldn't be baked into the runner, i.e. should not surface as dedicated
> > > command line options.  Users shouldn't need to modify the runner just to bring
> > > their own configuration.  I also think configurations should be discoverable,
> > > e.g. not hardcoded like KUT's unittest.cfg.  A very real problem with KUT's
> > > approach is that testing different combinations is frustratingly difficult,
> > > because running a testcase with different configuration requires modifying a file
> > > that is tracked by git.

I was thinking of folks who send upstream patches, they might not have
interesting configurations to run to test. If we don't provide an option
then they might not be able to test different scenarios.

I do agree command line option might not be a great choice here, we
should keep them granular.

What if there is a shell script which has some runner commands with
different combinations? There should be a default configuration provided
to ease testing of patches for folks who might not be aware of the
configurations which maintainers generally use.

End goal is to provide good confidence to the patch submitter that they have
done good testing.

> > 
> > We have support in KUT for environment variables (which are stored in an
> > initrd). The feature hasn't been used too much, but x86 applies it to
> > configuration parameters needed to execute tests from grub, arm uses it
> > for an errata framework allowing tests to run on kernels which may not
> > include fixes to host-crashing bugs, and riscv is using them quite a bit
> > for providing test parameters and test expected results in order to allow
> > SBI tests to be run on a variety of SBI implementations. The environment
> > variables are provided in a text file which is not tracked by git. kvm
> > selftests can obviously also use environment variables by simply sourcing
> > them first in wrapper scripts for the tests.
> 
> Oh hell no! :-)
> 
> For reproducibility, transparency, determinism, environment variables are pure
> evil.  I don't want to discover that I wasn't actually testing what I thought I
> was testing because I forgot to set/purge an environment variable.  Ditto for
> trying to reproduce a failure reported by someone.
> 
> KUT's usage to adjust to the *system* environment is somewhat understandable
> But for KVM selftests, there should be absolutely zero reason to need to fall
> back to environment variables.  Unlike KUT, which can run in a fairly large variety
> of environments, e.g. bare metal vs. virtual, different VMMs, different firmware,
> etc., KVM selftests effectively support exactly one environment.
> 
> And unlike KUT, KVM selftests are tightly coupled to the kernel.  Yes, it's very
> possible to run selftests against different kernels, but I don't think we should
> go out of our way to support such usage.  And if an environment needs to skip a
> test, it should be super easy to do so if we decouple the test configuration
> inputs from the test runner.

Also, keeping things out of tree won't help other developers much. I want
majority of that configurations which maintainers/regular contributors
maintain locally to be upstreamed and consolidated.

> 
> > > There are underlying issues with KUT that essentially necessitate that approach,
> > > e.g. x86 has several testcases that fail if run without the exact right config.
> > > But that's just another reason to NOT follow KUT's pattern, e.g. to force us to
> > > write robust tests.
> > > 
> > > E.g. instead of per-config command line options, let the user specify a file,
> > > and/or a directory (using a well known filename pattern to detect configs).
> > 
> > Could also use an environment variable to specify a file which contains
> > a config in a test-specific format if parsing environment variables is
> > insufficient or awkward for configuring a test.
> 
> There's no reason to use a environment variable for this.  If we want to support
> "advanced" setup via a test configuration, then that can simply go in configuration
> file that's passed to the runner.

Can you guys specify What does this test configuration file/directory
will look like? Also, is it gonna be a one file for one test? This might
become ugly soon.

This brings the question on how to handle the test execution when we are using
different command line parameters for individual tests which need some
specific environmnet?

Some parameters will need a very specific module or sysfs setting which
might conflict with other tests. This is why I had "test_suite" in my
json, which can provide some module, sysfs, or other host settings. But
this also added cost of duplicating tests for each/few suites.

I guess the shell script I talked about few paragraphs above, can have
some specific runner invocations which will set specific requirements of
the test and execute that specific test (RFC runner has the capabilty to execute
specific test).

Open to suggestions on a better approach.


