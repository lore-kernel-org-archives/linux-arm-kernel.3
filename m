Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A8ED59F53
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 17:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5t+pTmBPHbo0E/uwfzEy52VjrmqfqWmgZSSzb34Bz4w=; b=wM1CwBqr8ANfOwh3N4tQRxX0EH
	v2BncTX8/wR/7y50MYVIEnXYYTqA5/wsnAZgkcLqF2hCRqBr9eVrrREYOr4/AmC+01rPZDd17/Fk+
	bZkJXPqqAgUCH6wcqbfo0tt73bter1t5N0U0KUzrHGGtS2FrteJOppLQHR/fEwN3MJBVkPuhkXbkp
	qLf90zruGiWbaq+ii4bzR7OminDfkXCDvg+HusKsIVuLlli95Fhb87g03xIjPEQZ0xje0iHJzCYmo
	AFUazn7V+PhGYFN15HZ5b0R9bHajsZabguIh/ThJ/xLCYLL1GLxy1yl1NiZsl+MSfWuYrqMtbGS16
	ZfgXi+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jWE-000000048vA-0jfb;
	Wed, 06 Nov 2024 17:08:34 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jUR-000000048Qo-0fUO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 17:06:44 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e30ba241e7eso12316740276.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 09:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730912801; x=1731517601; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5t+pTmBPHbo0E/uwfzEy52VjrmqfqWmgZSSzb34Bz4w=;
        b=QHxeHmkxMiy1T0jcH5ImNzxFyPNlLz3HNGVoYC++5wNEsHb8eL59H6UXrEkVzhMY4n
         jELEhcV7nVslSHpxPmR79Ycc6ot2rDqefhXP5XWt0u7fA1D3DjJV3R4YWbPHdANwnbfv
         eWbDX0rRt0vKEWuomyxpypheXj8VaSZvWQhE6Gw25IrwnlMZ/2khSVzRfpxLBP/Qr5y9
         Cy8NZdw3JGUIjArA/nPKHAchMiwpNzm+koiSWeXkGltZXCcgxWLUABXuwZyqGeeyKuAO
         UKEUZ1Fr0/9ALtygPVlBa9ejBmBpieHos8TRKkHLTjVHWyu0gvJQII3lPnwq+wF1b3KT
         WvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730912801; x=1731517601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5t+pTmBPHbo0E/uwfzEy52VjrmqfqWmgZSSzb34Bz4w=;
        b=WOnppD45r9+hDwW1dEkuDmWJK+GVBLGRO3uE/rFgXibzI0dZ+t4FwkCmU4m2rEwjYm
         MEFhN+r0RoKc+sdfOLt2Xrh9D6gc0qYTfRoHqBuzWcAaYfczvAp89ECizaORbze6S6Ct
         0ZvcTbUd/H/kIIZ65rx5zcFb2p8xeqDmwIwAuERvfsTQlvdnAtymZ9AqATP5M6BzL7sQ
         7eASZO9xi4D9X4t90hT706hmRhJEAcYe/9CnZe4/mxxeSxmaL/jbfvfPtxXA+Y2FgY2j
         UA0ZIHv5JtXfROc/ZFW0sc9Az5E0Ev2UuJQtSAn6FVIPoGEOHbua2it4FJVnzNx84uzg
         cMDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvR6fKnbZDae3oMUxUxgJV3WeIW69F0ghjAejkGUHamssHqQLN1oV9ad60oep1k0l05s0BodO1NpOBud9utRk+@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy/+y9Q/iApZtyQxsyFv+pIrDUOjhO46XQwgsboWoMRgrq/ekx
	uxlxsmFLNkTyTItuVCC6PLcBXFZuxSBFRSdXDT1qgR3p4kYyuIcztKCchlb32boOxgLK+M7NTdG
	qdw==
X-Google-Smtp-Source: AGHT+IGtFenR1QTBctdMYFKBTYZG/ZO0INYKhWuvVmpVVCJ3u0Ldd1ciEKyXxUgTterH6MxTNnFNUgE23Nc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:abe9:0:b0:e30:b98d:a33d with SMTP id
 3f1490d57ef6-e30b98da4f0mr50282276.5.1730912800993; Wed, 06 Nov 2024 09:06:40
 -0800 (PST)
Date: Wed, 6 Nov 2024 09:06:39 -0800
In-Reply-To: <CAHVum0fWJW7V5ijtPcXQAtPSdoQSKjzYwMJ-XCRH2_sKs=Kg7g@mail.gmail.com>
Mime-Version: 1.0
References: <20240821223012.3757828-1-vipinsh@google.com> <CAHVum0eSxCTAme8=oV9a=cVaJ9Jzu3-W-3vgbubVZ2qAWVjfJA@mail.gmail.com>
 <CAHVum0fWJW7V5ijtPcXQAtPSdoQSKjzYwMJ-XCRH2_sKs=Kg7g@mail.gmail.com>
Message-ID: <ZyuiH_CVQqJUoSB-@google.com>
Subject: Re: [RFC PATCH 0/1] KVM selftests runner for running more than just default
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Anup Patel <anup@brainfault.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_090643_230590_2DD84636 
X-CRM114-Status: GOOD (  38.43  )
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

On Fri, Nov 01, 2024, Vipin Sharma wrote:
> Had an offline discussion with Sean, providing a summary on what we
> discussed (Sean, correct me if something is not aligned from our
> discussion):
> 
> We need to have a roadmap for the runner in terms of features we support.
> 
> Phase 1: Having a basic selftest runner is useful which can:
> 
> - Run tests parallely

Maybe with a (very conversative) per test timeout?  Selftests generally don't have
the same problems as KVM-Unit-Tests (KUT), as selftests are a little better at
guarding against waiting indefinitely, i.e. I don't think we need a configurable
timeout.  But a 120 second timeout or so would be helpful.

E.g. I recently was testing a patch (of mine) that had a "minor" bug where it
caused KVM to do a remote TLB flush on *every* SPTE update in the shadow MMU,
which manifested as hilariously long runtimes for max_guest_memory_test.  I was
_this_ close to not catching the bug (which would have been quite embarrasing),
because my hack-a-scripts don't use timeouts (I only noticed because a completely
unrelated bug was causing failures).

> - Provide a summary of what passed and failed, or only in case of failure.

I think a summary is always warranted.  And for failures, it would be helpful to
spit out _what_ test failed, versus the annoying KUT runner's behavior of stating
only the number of passes/failures, which forces the user to go spelunking just
to find out what (sub)test failed.

I also think the runner should have a "heartbeat" mechanism, i.e. something that
communicates to the user that forward progress is being made.  And IMO, that
mechanism should also spit out skips and failures (this could be optional though).
One of the flaws with the KUT runner is that it's either super noisy and super
quiet.

E.g. my mess of bash outputs this when running selftests in parallel (trimmed for
brevity):

        Running selftests with npt_disabled
        Waiting for 'access_tracking_perf_test', PID '92317'
        Waiting for 'amx_test', PID '92318'
        SKIPPED amx_test
        Waiting for 'apic_bus_clock_test', PID '92319'
        Waiting for 'coalesced_io_test', PID '92321'
        Waiting for 'cpuid_test', PID '92324'
        
        ...
        
        Waiting for 'hyperv_svm_test', PID '92552'
        SKIPPED hyperv_svm_test
        Waiting for 'hyperv_tlb_flush', PID '92563'
        FAILED hyperv_tlb_flush : ret ='254'
        Random seed: 0x6b8b4567
        ==== Test Assertion Failure ====
          x86_64/hyperv_tlb_flush.c:117: val == expected
          pid=92731 tid=93548 errno=4 - Interrupted system call
             1	0x0000000000411566: assert_on_unhandled_exception at processor.c:627
             2	0x000000000040889a: _vcpu_run at kvm_util.c:1649
             3	 (inlined by) vcpu_run at kvm_util.c:1660
             4	0x00000000004041a1: vcpu_thread at hyperv_tlb_flush.c:548
             5	0x000000000043a305: start_thread at pthread_create.o:?
             6	0x000000000045f857: __clone3 at ??:?
          val == expected
        Waiting for 'kvm_binary_stats_test', PID '92579'
        
        ...
        
        SKIPPED vmx_preemption_timer_test
        Waiting for 'vmx_set_nested_state_test', PID '93316'
        SKIPPED vmx_set_nested_state_test
        Waiting for 'vmx_tsc_adjust_test', PID '93329'
        SKIPPED vmx_tsc_adjust_test
        Waiting for 'xapic_ipi_test', PID '93350'
        Waiting for 'xapic_state_test', PID '93360'
        Waiting for 'xcr0_cpuid_test', PID '93374'
        Waiting for 'xen_shinfo_test', PID '93391'
        Waiting for 'xen_vmcall_test', PID '93405'
        Waiting for 'xss_msr_test', PID '93420'

It's far from perfect, e.g. just waits in alphabetical order, but it gives me
easy to read feedback, and signal that tests are indeed running and completing.
        
> - Dump output which can be easily accessed and parsed.

And persist the output/logs somewhere, e.g. so that the user can triage failures
after the fact.

> - Allow to run with different command line parameters.

Command line parameters for tests?  If so, I would put this in phase 3.  I.e. make
the goal of Phase 1 purely about running tests in parallel.

> Current patch does more than this and can be simplified.
> 
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

One of my complaints with our internal infrastructure is that the testcases
themselves can dictate environment settings.  There are certainly benefits to
that approach, but it really only makes sense at scale where there are many
machines available, i.e. where the runner can achieve parallelism by running
tests on multiple machines, and where the complexity of managing the environment
on a per-test basis is worth the payout.

For the upstream runner, I want to cater to developers, i.e. to people that are
running tests on one or two machines.  And I want the runner to rip through tests
as fast as possible, i.e. I don't want tests to get serialized because each one
insists on being a special snowflake and doesn't play nice with other children.
Organizations that the have a fleet of systems can pony up the resources to develop
their own support (on top?).

Selftests can and do check for module params, and should and do use TEST_REQUIRE()
to skip when a module param isn't set as needed.  Extending that to arbitrary
sysfs knobs should be trivial.  I.e. if we get _failures_ because of an incompatible
environment, then it's a test bug.

> Phase 3: Provide collection of interesting configurations
> 
> Specific individual constructs can be combined in a meaningful way to
> provide interesting configurations to run on a platform. For example,
> user doesn't need to specify each individual configuration instead,
> some prebuilt configurations can be exposed like
> --stress_test_shadow_mmu, --test_basic_nested

IMO, this shouldn't be baked into the runner, i.e. should not surface as dedicated
command line options.  Users shouldn't need to modify the runner just to bring
their own configuration.  I also think configurations should be discoverable,
e.g. not hardcoded like KUT's unittest.cfg.  A very real problem with KUT's
approach is that testing different combinations is frustratingly difficult,
because running a testcase with different configuration requires modifying a file
that is tracked by git.

There are underlying issues with KUT that essentially necessitate that approach,
e.g. x86 has several testcases that fail if run without the exact right config.
But that's just another reason to NOT follow KUT's pattern, e.g. to force us to
write robust tests.

E.g. instead of per-config command line options, let the user specify a file,
and/or a directory (using a well known filename pattern to detect configs).

> Tests need to handle the environment in which they are running
> gracefully, which many tests already do but not exhaustively. If some
> setting is not provided or set up properly for their execution then
> they should fail/skip accordingly.

This belongs in phase 2.

> Runner will not be responsible to precheck things on tests behalf.
> 
> 
> Next steps:
> 1. Consensus on above phases and features.
> 2. Start development.
> 
> Thanks,
> Vipin

