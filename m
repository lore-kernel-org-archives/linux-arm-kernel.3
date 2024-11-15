Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EA5D68BD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 20:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOebRQETbZvWS73rKNCR7PLpNcmPn5Rr3U0j+a9cUYI=; b=pOcGDWlu63vlMty+NeSA0xGTFI
	P2A59otp+4HUEg+Og8VriQMk2E1nP+QFrJLFfxUOGV3WkIERDg8MnKEXF92wVXW+O2f8Z8OBdUAZP
	/ymYYWcN/vihqKrp6zFKiw4KiJgUJdNL2Vhv/sHS854qYT5zRsJ7P0aY/IjRnSqrSctQFFn5CjDHs
	GMO6xF2fwOB0VFzfapU4xT9lq5iIxP2n1MyktG93/FrmqH8VwdcWlc+mG513/iPoAbUlKFEHmcQAh
	qZxsc2BexVMXgsrwAinh7wXdlsl/o4E+fPrTTcEXI40vNSfXI+ZZIDkxCqA6mcxU6cMNTx1BnIRjk
	ydXBZyGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2n6-000000040pu-2ONF;
	Fri, 15 Nov 2024 20:19:40 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC2mA-000000040br-0YdQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 20:18:43 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-211eb2be4a8so23195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 12:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731701920; x=1732306720; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vOebRQETbZvWS73rKNCR7PLpNcmPn5Rr3U0j+a9cUYI=;
        b=XPA1QzDQlH6wTt5H4n9cfhXgd3pbfRpooCYy7VZq3jfQZseN1y9thOC8KsUmmB9uAO
         H8V9AB6q0bE2rSzBrrtyLZ3JXldRwOYw+q0d5OieT74HRaCp+WLPEd9v3pY+qW+deTnV
         PqcyPaATUCimOrZAfczZQmrAt86+IM+T1oZCQmqRp9FTnKpIgDid1lrTQ7Tv9QcsXS+2
         YwheqFJKlte/rspz2nbGya3PC7KKZIoTOzmGPmJxQTmph7c1KNMB+ZytJMJMhhEV0/G1
         9uLkMgrxeCK+2SF2BM0FbDmUNr2qS8kixEJXaTf1SVQn0uEcAtXFFNsC4HwX1svR8DPK
         KuWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731701920; x=1732306720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOebRQETbZvWS73rKNCR7PLpNcmPn5Rr3U0j+a9cUYI=;
        b=Py69AzicIn9Qx/5pPvRLMpsMxlbwH26ZP9/6ioWN15F1nZg02NpomLRPF7mKk0NOaN
         UC2l1CCYJNIazbwiJklVCKNx4hWzdjANdHLXOgjuHKFiT/lky0SVmHrfm/ymS2XgRpeK
         iLsYP7rlmZGe1UPfDmbs173J6RWrCYtnoax7yW7TPovGGkHHhHiPryd5XR96yJ4jSmqZ
         0oKIxw6ZcOnpcD4wlHq+QLgQSs/y6hcBrJ/Y7D+wVjHYcMCtNmF8WdMpLEODaO05r1UV
         xnOUYeW7Z8F4hJomQqZ2Jbuo6PbuaRcQkHXeUStqslNnlfgKqgfRa7zEgAdIDXrtNBE9
         D3HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZtXxDgBPgqmRWtSCkvp1suGAIrmjdJ4WbIaK9rSHaBJwbo71SAwhkRnAIttJ5ixg34Rp+zHpqsC4Ri85rU2ul@lists.infradead.org
X-Gm-Message-State: AOJu0YynWRXp0uxU/3X9k4K7Fk/A40DY885J618yFKoGJTcBwSpcBN2+
	arM5bb2CfqUyynZkeT2P5efsQWgR7YsCwf2K0qujdjPfW0RvOJjpiuRQyniYqA==
X-Gm-Gg: ASbGncsDqe8sZwK8NgOQ+Va+tKHYglaqpQ63zC3jAkHlb25cdD/XVGfvXL9mtKXxxtx
	W/ShCNHK5ZHZmriesJCuLLuG1d4a607WFO0nT61kzYt+HODTNRjX9CRbdehgjM7UTq44meFi7Q4
	OLUfkuFueIH3AOEC7MKUXT6NGY8c8zkAeWMMQZbwQ1D/rhaFWXLvqMsxx+eNP7KvAkCXV6JEX5Z
	Zap+JK0HCvRPgTaH3kwWq9/WtTjPHz91VdVcfvg2DOlm22wwJiPOe0DnFHNkGg5hcV+OIbw1RoF
	FTZs1nyK
X-Google-Smtp-Source: AGHT+IF9YmYViYu4bbu+rcQFvrqm2Ir1zaH/4DN+NJJV5bwFNTi7N4AI+TENAbybYY+gwUtHULYlMQ==
X-Received: by 2002:a17:902:ea05:b0:205:753e:b49d with SMTP id d9443c01a7336-211ecbe9b05mr288535ad.0.1731701919907;
        Fri, 15 Nov 2024 12:18:39 -0800 (PST)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0dc2bfbsm16436765ad.50.2024.11.15.12.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 12:18:38 -0800 (PST)
Date: Fri, 15 Nov 2024 12:18:35 -0800
From: Vipin Sharma <vipinsh@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anup Patel <anup@brainfault.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] KVM selftests runner for running more than just
 default
Message-ID: <20241115201835.GA599524.vipinsh@google.com>
References: <20240821223012.3757828-1-vipinsh@google.com>
 <CAHVum0eSxCTAme8=oV9a=cVaJ9Jzu3-W-3vgbubVZ2qAWVjfJA@mail.gmail.com>
 <CAHVum0fWJW7V5ijtPcXQAtPSdoQSKjzYwMJ-XCRH2_sKs=Kg7g@mail.gmail.com>
 <ZyuiH_CVQqJUoSB-@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyuiH_CVQqJUoSB-@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_121842_169494_EC65C081 
X-CRM114-Status: GOOD (  56.23  )
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

On 2024-11-06 09:06:39, Sean Christopherson wrote:
> On Fri, Nov 01, 2024, Vipin Sharma wrote:
> > 
> > We need to have a roadmap for the runner in terms of features we support.
> > 
> > Phase 1: Having a basic selftest runner is useful which can:
> > 
> > - Run tests parallely
> 
> Maybe with a (very conversative) per test timeout?  Selftests generally don't have
> the same problems as KVM-Unit-Tests (KUT), as selftests are a little better at
> guarding against waiting indefinitely, i.e. I don't think we need a configurable
> timeout.  But a 120 second timeout or so would be helpful.
> 
> E.g. I recently was testing a patch (of mine) that had a "minor" bug where it
> caused KVM to do a remote TLB flush on *every* SPTE update in the shadow MMU,
> which manifested as hilariously long runtimes for max_guest_memory_test.  I was
> _this_ close to not catching the bug (which would have been quite embarrasing),
> because my hack-a-scripts don't use timeouts (I only noticed because a completely
> unrelated bug was causing failures).

RFC code has the feature to specify timeout for each test. I will change
it so that a default value of 120 second is applied to all and remove the need
to write timeout for each individual test in json. It will be simple to
add a command line option to override this value.

> 
> > - Provide a summary of what passed and failed, or only in case of failure.
> 
> I think a summary is always warranted.  And for failures, it would be helpful to
> spit out _what_ test failed, versus the annoying KUT runner's behavior of stating
> only the number of passes/failures, which forces the user to go spelunking just
> to find out what (sub)test failed.

Default will be to print all test statuses, one line per test. This is
what RFC code does.

For summary, I can add one line at the end which shows count of passed,
skipped, and failed tests.

Having an option to only print failed/skipped test will provide easy
way to identify them. When we print each test status then user has to
scroll up the terminal read each status to identify what failed. But with an
option to override default behavior and print only skipped, failed, or
both. This doesn't have to be in phase 1, but I think its useful and we
should add in future version.

> 
> I also think the runner should have a "heartbeat" mechanism, i.e. something that
> communicates to the user that forward progress is being made.  And IMO, that
> mechanism should also spit out skips and failures (this could be optional though).
> One of the flaws with the KUT runner is that it's either super noisy and super
> quiet.

A true heartbeat feature would be something like runner is sending and
receiving messages from individual selftests. That is gonna be difficult
and not worth the complexity.

To show forward progress, each test's pass/fail status can be printed
immediately (RFC runner does this). As we are planning to have a
default timeout then there will always be a forward progress.

RFC runner has output like this:

2024-11-15 09:53:52,124 | 638866 |     INFO | SKIPPED: dirty_log_perf_tests/dirty_log_perf_test_max_vcpu_no_manual_protect
2024-11-15 09:53:52,124 | 638866 |     INFO | SKIPPED: dirty_log_perf_tests/dirty_log_perf_test_max_vcpu_manual_protect
2024-11-15 09:53:52,124 | 638866 |     INFO | SKIPPED: dirty_log_perf_tests/dirty_log_perf_test_max_vcpu_manual_protect_random_access
2024-11-15 09:53:52,124 | 638866 |     INFO | SETUP_FAILED: dirty_log_perf_tests/dirty_log_perf_test_max_10_vcpu_hugetlb
2024-11-15 09:53:52,171 | 638866 |     INFO | SKIPPED: x86_sanity_tests/vmx_msrs_test
2024-11-15 09:53:52,171 | 638866 |     INFO | SKIPPED: x86_sanity_tests/private_mem_conversions_test
2024-11-15 09:53:52,171 | 638866 |     INFO | SKIPPED: x86_sanity_tests/apic_bus_clock_test
2024-11-15 09:53:52,171 | 638866 |     INFO | SETUP_FAILED: x86_sanity_tests/dirty_log_page_splitting_test

> 
> E.g. my mess of bash outputs this when running selftests in parallel (trimmed for
> brevity):
> 
>         Running selftests with npt_disabled
>         Waiting for 'access_tracking_perf_test', PID '92317'
>         Waiting for 'amx_test', PID '92318'
>         SKIPPED amx_test
>         Waiting for 'apic_bus_clock_test', PID '92319'
>         Waiting for 'coalesced_io_test', PID '92321'
>         Waiting for 'cpuid_test', PID '92324'
>         
>         ...
>         
>         Waiting for 'hyperv_svm_test', PID '92552'
>         SKIPPED hyperv_svm_test
>         Waiting for 'hyperv_tlb_flush', PID '92563'
>         FAILED hyperv_tlb_flush : ret ='254'
>         Random seed: 0x6b8b4567
>         ==== Test Assertion Failure ====
>           x86_64/hyperv_tlb_flush.c:117: val == expected
>           pid=92731 tid=93548 errno=4 - Interrupted system call
>              1	0x0000000000411566: assert_on_unhandled_exception at processor.c:627
>              2	0x000000000040889a: _vcpu_run at kvm_util.c:1649
>              3	 (inlined by) vcpu_run at kvm_util.c:1660
>              4	0x00000000004041a1: vcpu_thread at hyperv_tlb_flush.c:548
>              5	0x000000000043a305: start_thread at pthread_create.o:?
>              6	0x000000000045f857: __clone3 at ??:?
>           val == expected

This is interesting, i.e. printing error message inline for the failed tests.
I can add this feature.

>         Waiting for 'kvm_binary_stats_test', PID '92579'
>         
>         ...
>         
>         SKIPPED vmx_preemption_timer_test
>         Waiting for 'vmx_set_nested_state_test', PID '93316'
>         SKIPPED vmx_set_nested_state_test
>         Waiting for 'vmx_tsc_adjust_test', PID '93329'
>         SKIPPED vmx_tsc_adjust_test
>         Waiting for 'xapic_ipi_test', PID '93350'
>         Waiting for 'xapic_state_test', PID '93360'
>         Waiting for 'xcr0_cpuid_test', PID '93374'
>         Waiting for 'xen_shinfo_test', PID '93391'
>         Waiting for 'xen_vmcall_test', PID '93405'
>         Waiting for 'xss_msr_test', PID '93420'
> 
> It's far from perfect, e.g. just waits in alphabetical order, but it gives me
> easy to read feedback, and signal that tests are indeed running and completing.
>         
> > - Dump output which can be easily accessed and parsed.
> 
> And persist the output/logs somewhere, e.g. so that the user can triage failures
> after the fact.
> 

RFC runner does this but not by default. Its provide an option to pass
a path to dump output in hierarchical folder structure.

Do you think this should be enabled by default? I prefer not, because
then it becomes a cleaning chore to delete the directories later.

> > - Allow to run with different command line parameters.
> 
> Command line parameters for tests?  If so, I would put this in phase 3.  I.e. make
> the goal of Phase 1 purely about running tests in parallel.

Okay. Only default execution in phase 1.

> 
> > Current patch does more than this and can be simplified.
> > 
> > Phase 2: Environment setup via runner
> > 
> > Current patch, allows to write "setup" commands at test suite and test
> > level in the json config file to setup the environment needed by a
> > test to run. This might not be ideal as some settings are exposed
> > differently on different platforms.
> > 
> > For example,
> > To enable TDP:
> > - Intel needs npt=Y
> > - AMD needs ept=Y
> > - ARM always on.
> > 
> > To enable APIC virtualization
> > - Intel needs enable_apicv=Y
> > - AMD needs avic=Y
> > 
> > To enable/disable nested, they both have the same file name "nested"
> > in their module params directory which should be changed.
> > 
> > These kinds of settings become more verbose and unnecessary on other
> > platforms. Instead, runners should have some programming constructs
> > (API, command line options, default) to enable these options in a
> > generic way. For example, enable/disable nested can be exposed as a
> > command line --enable_nested, then based on the platform, runner can
> > update corresponding module param or ignore.
> > 
> > This will easily extend to providing sane configuration on the
> > corresponding platforms without lots of hardcoding in JSON. These
> > individual constructs will provide a generic view/option to run a KVM
> > feature, and under the hood will do things differently based on the
> > platform it is running on like arm, x86-intel, x86-amd, s390, etc.
> 
> My main input on this front is that the runner needs to configure module params
> (and other environment settings) _on behalf of the user_, i.e. in response to a
> command line option (to the runner), not in response to per-test configurations.
> 
> One of my complaints with our internal infrastructure is that the testcases
> themselves can dictate environment settings.  There are certainly benefits to
> that approach, but it really only makes sense at scale where there are many
> machines available, i.e. where the runner can achieve parallelism by running
> tests on multiple machines, and where the complexity of managing the environment
> on a per-test basis is worth the payout.
> 
> For the upstream runner, I want to cater to developers, i.e. to people that are
> running tests on one or two machines.  And I want the runner to rip through tests
> as fast as possible, i.e. I don't want tests to get serialized because each one
> insists on being a special snowflake and doesn't play nice with other children.
> Organizations that the have a fleet of systems can pony up the resources to develop
> their own support (on top?).
> 
> Selftests can and do check for module params, and should and do use TEST_REQUIRE()
> to skip when a module param isn't set as needed.  Extending that to arbitrary
> sysfs knobs should be trivial.  I.e. if we get _failures_ because of an incompatible
> environment, then it's a test bug.

I agree, RFC runner approach is not great in this regards, it is very
verbose and hinders parallel execution.

Just for the record, not all options can be generic, there might be some
arch specific command line options. We should first strive to have
generic options or name them in a way they can be applied to other arch
when (if ever) they add a support. I don't have good playbook for this,
I think this will be handled case by case.

