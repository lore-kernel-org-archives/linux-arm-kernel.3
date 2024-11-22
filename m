Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C69E6ADCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 22:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5kr5xL10rVafwH2QwXNIB2NX51MpVtbUlFWYreKeG40=; b=KfogEawoOrMrab9HDBMLLNkoAs
	Rnkr2HE4hY0vIvgh6LUAAgeX7auhPR4ZWxrjWmOpx1L3uN8JwWxOSMwqkK+CDNEStfH8UuryM207+
	syIgwt/8NR99HV44Q8JIetJnUBgY+/8TtFQLDwIe6e4fFBfE9F4hF8Qb3LV7nRbsbre3VOAw324ls
	PgNmXJsKMggZlMWiacoG98s0Mnk5pv50ddoI/TTyNZrLaT8Uh/5qXXoq/KeRm23UEj+hcBAojN9SS
	A3q6RUzULr/DLMkVUTSYCxI0udzVmu6GeMMLJnpXdjpzPqIfeHglRp7EbRuL5bFTrCD+WLfbNphBD
	Mr+frESw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEcIo-00000003Qkw-3oRa;
	Fri, 22 Nov 2024 22:39:02 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEcHr-00000003Qdl-0yev
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 22:38:04 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21238b669c5so13915ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 14:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732315081; x=1732919881; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5kr5xL10rVafwH2QwXNIB2NX51MpVtbUlFWYreKeG40=;
        b=pWRkirH5mR+eCPkY0hgQfA7cCI92EabppbfGAHzJbO0XrzaZT4g/cxlulAfJ1LLtXf
         52XUb8+kJtttNu9FXzaFU6YePlWgBwKfa2lKVWoFeYVLRF6v4Vls8xMz37MXy+RdMOAZ
         hVgbQgbE6OUotz5KOeYipnCdvEL8PooKlt/q1WMmv8toEaJipXwKEBx5VFt3gVr4sQto
         9DuoGNS72Tft/f0ZOMEVSdx7Vfa9y78tVzfAgugz/jygVWm8lJgSLHlLuNFtm6oqXRuV
         v8O+oI4PJsfpuo9ZY1ziuDNn+f4ARsMEwRgYwGooGnQ0Wt7QlANYYHF9HI4cBPncvFDZ
         bUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732315081; x=1732919881;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5kr5xL10rVafwH2QwXNIB2NX51MpVtbUlFWYreKeG40=;
        b=f3tzSsufi4Huf9nFRXli1w8c7qFOzpEQPX7C2/8YD6BMG5JLPb/mdR9PAwEOmEFAcU
         Xx0HrGbkHJga7/TJtDvIN5VEBT9/AVwv7NoPX/v51lEwhUE19E/g4S6MK4Ba9v7go/87
         qt2vpCQ8YMQTd0o+EdegzATfKhVB2WyvFdrxGFPqluPKb5SVd2O3g1o5tpvvVa6R9mVY
         E3njlrWVMZHZrXKBRksl5CP8MY6qlnWQ2ilhZTkoc+fXHe9I60nweRuHx9769pCJhGgd
         fY/hqvLrf+WWpvRWBbXrzmR2HKbYCr0i0TqZPOUjBFzEcGswrdUk2EM4+bkQSHuWoPNQ
         7BdA==
X-Forwarded-Encrypted: i=1; AJvYcCWmtmpequLYkkGgicLEJ6Jbo/+79SGj4H18pFhls9QcOiGBoudiDyx6zjZ8+kPE/mfTIi4xyA649qFMBHLa6FYZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7XP4ze2IXGPyhARfPBtMlX5MHn2Q2pxNCpKXP3B7usEm0DP9J
	rleDUEszLGVWdRUGvVNXukO4niWxg92FxOZTFkco7TtVbTOfu9+lawvHw6Ag7w==
X-Gm-Gg: ASbGncu7IEowWOp66ztCNVwFctCy0Pvs4wUDgi4XjTy4piovuTzPmTMu6OiHETef3g4
	mDqeP5fM9RfNYGIB2i4pnUHjvAyWFIlKN8RJq1YtCVZTqZP72zpIAxzxiddl2Gx35Qny6EuKsya
	KgDAJTEO9I9WuNTr9Dvg657TkQN7C4VUSMIiuzgQBEs3Yk01sne1ypxT8PAGJaXGXVHtydpBpCr
	l+k/V4KPTxoBYlPnI8aCNYGD3qM/f5Z7Rn3bKrf/Jimx0MV/p60myGYBn52cnK7aEnuGZaeuoA9
	YybuYefr
X-Google-Smtp-Source: AGHT+IH7FcOLwqCX5Pk18qMpoAhw/6OPuccEjBkX6SjRRnRTGj+6abQWL8biM94lLtA5xkrz6/Cx9w==
X-Received: by 2002:a17:902:d550:b0:20c:5cb1:de07 with SMTP id d9443c01a7336-2149e0a53c8mr239615ad.11.1732315081192;
        Fri, 22 Nov 2024 14:38:01 -0800 (PST)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcbfc0960sm1890512a12.11.2024.11.22.14.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 14:38:00 -0800 (PST)
Date: Fri, 22 Nov 2024 14:37:56 -0800
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
Message-ID: <20241122223756.GA2112434.vipinsh@google.com>
References: <20240821223012.3757828-1-vipinsh@google.com>
 <CAHVum0eSxCTAme8=oV9a=cVaJ9Jzu3-W-3vgbubVZ2qAWVjfJA@mail.gmail.com>
 <CAHVum0fWJW7V5ijtPcXQAtPSdoQSKjzYwMJ-XCRH2_sKs=Kg7g@mail.gmail.com>
 <ZyuiH_CVQqJUoSB-@google.com>
 <20241108-eaacad12f1eef31481cf0c6c@orel>
 <ZzY2iAqNfeiiIGys@google.com>
 <20241115211523.GB599524.vipinsh@google.com>
 <Zz5-3A36cckhYu9K@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zz5-3A36cckhYu9K@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_143803_276740_F5FA194E 
X-CRM114-Status: GOOD (  56.35  )
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

On 2024-11-20 16:29:16, Sean Christopherson wrote:
> On Fri, Nov 15, 2024, Vipin Sharma wrote:
> > On 2024-11-14 09:42:32, Sean Christopherson wrote:
> > > On Fri, Nov 08, 2024, Andrew Jones wrote:
> > > > On Wed, Nov 06, 2024 at 09:06:39AM -0800, Sean Christopherson wrote:
> > > > > On Fri, Nov 01, 2024, Vipin Sharma wrote:
> As discussed off-list, I think having one testcase per file is the way to go.
> 
>   - Very discoverable (literally files)
>   - The user (or a shell script) can use regexes, globbing, etc., to select which
>     tests to run
>   - Creating "suites" is similarly easy, e.g. by having a list of files/testscase,
>     or maybe by directory layout
> 
> Keeping track of testcases (and their content), e.g. to avoid duplicates, might
> be an issue, but I think we can mitigate that by establishing and following
> guidelines for naming, e.g. so that the name of a testcase gives the user a
> decent idea of what it does.
> 
> > > > Could also use an environment variable to specify a file which contains
> > > > a config in a test-specific format if parsing environment variables is
> > > > insufficient or awkward for configuring a test.
> > > 
> > > There's no reason to use a environment variable for this.  If we want to support
> > > "advanced" setup via a test configuration, then that can simply go in configuration
> > > file that's passed to the runner.
> > 
> > Can you guys specify What does this test configuration file/directory
> > will look like? Also, is it gonna be a one file for one test? This might
> > become ugly soon.
> 
> As above, I like the idea of one file per testcase.  I'm not anticipating thousands
> of tests.  Regardless of how we organize things, mentally keeping track of that
> many tests would be extremely difficult.  E.g. testcases would likely bitrot and/or
> we'd end up with a lot of overlap.  And if we do get anywhere near that number of
> testcases, they'll need to be organzied in some way.
> 
> One idea would be create a directory per KVM selftest, and then put testcases for
> that test in said directory.  We could even do something clever like fail the
> build if a test doesn't have a corresponding directory (and a default testcase?).
> 
> E.g. tools/testing/selftests/kvm/testcases, with sub-directories following the
> tests themsleves and separated by architecture as appropriate.
> 
> That us decent organization.  If each test has a testcase directory, it's easy to
> get a list of testcases.  At that point, the name of the testcase can be used to
> organize and describe, e.g. by tying the name to the (most interesting) parameters.

Sounds good. Extending your example for testcases given below this what
I am imagining ordering will be:

testcases/
├── aarch64
│   └── arch_timer
│       └── default
├── memslot_modification_stress_test
│   ├── 128gib.allvcpus.partitioned_memory_access
│   ├── default
│   └── x86_64
│       └── disable_slot_zap_quirk
├── riscv
│   └── arch_timer
│       └── default
├── s390x
├── steal_time
│   └── default
└── x86_64
    ├── amx_test
    │   └── default
    └── private_mem_conversions_test
        ├── 2vcpu.2memslots
        └── default

1. Testcases will follow directory structure of the test source files.
2. "default" will have just path of the test relative to
   tools/testing/selftests/kvm directory and no arguments provided in it.
3. Extra tests can be provided as separate files with meaningful names.
4. Some tests (memslot_modification_stress_test) have arch specific
   options. Those testcases will be under arch specific directory of
   that specific testcase directory.
5. Runner will be provided with a directory path and it will run all
   files in that and their subdirectories recursively.
6. Runner will also filter out testcases based on filepath. For example
   if running on ARM platform it will ignore all filepaths which have
   x86_64, s390, and riscv in their path anywhere.
7. If user wants to save output of runner, then output dump will follow
   the same directory structure.

> 
> Hmm, and for collections of multiple testscases, what if we added a separate
> "testsuites" directory, with different syntax?  E.g. one file per testuite, which
> is basically a list of testcases.  Maybe with some magic to allow testsuites to
> "include" arch specific info?
> 
> E.g. something like this
> 
> $ tree test*
> testcases
> └── max_guest_memory_test
>     └── 128gib.allvcpus.test
> testsuites
> └── mmu.suite
> 
> 3 directories, 2 files
> $ cat testsuites/mmu.suite 
> $ARCH/mmu.suite
> max_guest_memory_test/128gib.allvcpus.test

This can be one option. For now lets table testsuites discussion. We will
revisit if after Phase1 is completed.

> 
> > This brings the question on how to handle the test execution when we are using
> > different command line parameters for individual tests which need some
> > specific environmnet?
> > 
> > Some parameters will need a very specific module or sysfs setting which
> > might conflict with other tests. This is why I had "test_suite" in my
> > json, which can provide some module, sysfs, or other host settings. But
> > this also added cost of duplicating tests for each/few suites.
> 
> IMO, this should be handled by user, or their CI environment, not by the upstream
> runner.  Reconfiguring module params or sysfs knobs is inherently environment
> specific.  E.g. not all KVM module params are writable post-load, and so changing
> a param might require stopping all VMs on the system, or even a full kernel reboot
> if KVM is built-in.  There may also be knobs that require root access, that are
> dependent on hardware and/or kernel config, etc.
> 
> I really don't want to build all that into the upstream test runner, certainly not
> in the first few phases.  I 100% think the runner should be constructed in such a
> way that people/organizations/CI pipeines can build infrastructure on top, I just
> don't think it's a big need or a good fit for upstream.

For phase 2 discussion, you responded:
	> Phase 2: Environment setup via runner
	>
	> Current patch, allows to write "setup" commands at test suite and test
	> level in the json config file to setup the environment needed by a
	> test to run. This might not be ideal as some settings are exposed
	> differently on different platforms.
	>
	> For example,
	> To enable TDP:
	> - Intel needs npt=Y
	> - AMD needs ept=Y
	> - ARM always on.
	>
	> To enable APIC virtualization
	> - Intel needs enable_apicv=Y
	> - AMD needs avic=Y
	>
	> To enable/disable nested, they both have the same file name "nested"
	> in their module params directory which should be changed.
	>
	> These kinds of settings become more verbose and unnecessary on other
	> platforms. Instead, runners should have some programming constructs
	> (API, command line options, default) to enable these options in a
	> generic way. For example, enable/disable nested can be exposed as a
	> command line --enable_nested, then based on the platform, runner can
	> update corresponding module param or ignore.
	>
	> This will easily extend to providing sane configuration on the
	> corresponding platforms without lots of hardcoding in JSON. These
	> individual constructs will provide a generic view/option to run a KVM
	> feature, and under the hood will do things differently based on the
	> platform it is running on like arm, x86-intel, x86-amd, s390, etc.

	My main input on this front is that the runner needs to configure module params
	(and other environment settings) _on behalf of the user_, i.e. in response to a
	command line option (to the runner), not in response to per-test configurations.

Should we still write code in runner for setting parameters which are
writable/modifiable or just leave it? Our current plan is to provide
some command line options to set those things but it is true that we
might not be able to set everything via runner.

