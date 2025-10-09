Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FEFCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 22:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyn4fVoh4cjthxckvqweX9TO6N78roW7lipNMYAXPf4=; b=iUCEKQe6qTYP3zLwBYAQ5VKLqn
	EqHLzJLK5GJRHi1qgkvQu+H4qZOWP8vKnGYY66WZATT+YcN9E1f5rW3HQTQO42uFWdmfZ8qIlbV1G
	QjUhRGY8O814zchRFgE5niYPN6OGSqKu0k5BkZwxVt7hDyTxCr5Zopc/nJd89jGbkqAfquW+3OnTC
	shCHwD4ot1vgwpIZrcC0da3pYhwgyoK+pLeM+/EtMF5mep+TFGkm1v1m/vddnp1OW5cNNhqUnzZRt
	/eUQrM8tGXGpKDvI8kcVfaBSRfhmuWmLMXm6/wAga/E6GVDsLFyGfK0V2bW2DzVZ7QY3Dx0wmtNnx
	+THG7Rdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6zAP-00000007FHv-3pEH;
	Thu, 09 Oct 2025 22:31:21 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6zAM-00000007FHI-0wQP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 22:31:20 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33274f8ff7cso3974505a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 15:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760049076; x=1760653876; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oyn4fVoh4cjthxckvqweX9TO6N78roW7lipNMYAXPf4=;
        b=LqnuZoFbrXcbAyLVjeyRnVNqy/CIcq+FiTGSTUDd9RNO2G1HjyaUba0NXaVWuIJqRG
         jhPp+ZN0oO+ZcNNvZ61leT7qyU7jWbA7jz1l1JLTgvIUlvGeKfZkshGTyGM2mQV0hjep
         krmJF385HS06TKvX7Dcy9mU9VsMQjtcZLjcp6EvmKUE/cQha0IpRKPaiz4bhAivZsOAy
         o/Bu0J07z70VQBb92GaVyntKM6Qlox98Y7o6SfpBCTWFGH+s3kGKV6RbwLziFhrJlkVw
         QMtg2FMN1B7glJ3GdUhmaVAj7wVCm3/qBhOxoy49vIiGwoJvNjdBtg9/EQbfN0qb/pN/
         r1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760049076; x=1760653876;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oyn4fVoh4cjthxckvqweX9TO6N78roW7lipNMYAXPf4=;
        b=Qlv644m9RvRN+f7XQnIMiCHaOsiet5PAmfXf04DwPdBvDXT9M5NaX9QhtRv5nt7ET3
         GyQTLPCnjJSpODgT6w1zSG7xtQk7WnATiKoqukt1VGWZpWxLVQ2SJ3i8j3SGWfOqEnwg
         lu02Ooy1fBUKJIs7xXM8WAPfNK9L/JZo/LvYGD0Labqk6H2UNYx4D1aNhpa7UhtCi4AA
         /FSDBQNHl7HEhl2x3AuQNJX/IzphUa3kNqreMcknLodoBrmoBqmmPqSlZS4dAKkxOPqv
         R5YrnAKbG3Ovj8p4tWJT95P5154cMBaTj4pMUUYqcwo6hY4thbrcuy+l4J5VkmH2P2PU
         DQIw==
X-Gm-Message-State: AOJu0YyC7PwQUortT44rWbL0jvP+ghmYZYcFslMYxnJmMACmzlsq7dWd
	gyeFQSm+tQIMuSp/R/g1DN9DSRhanlZTBgktf5cwhfwBLcNj0yjtd1MS16psE521jK/+FHr5xRC
	yLlXN1buL4PofFilT5AsPDx3ppg==
X-Google-Smtp-Source: AGHT+IEmelRZ9ZJu08/OiMaUmje11/Gsz4SbXx5oLReryhBGhZaItJQt2LKWHVGmxTYaiV6rsN3g3rToagNXnHp9Yg==
X-Received: from pjboa10.prod.google.com ([2002:a17:90b:1bca:b0:330:7dd8:2dc2])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:268c:b0:330:6d5e:f17b with SMTP id 98e67ed59e1d1-33b513b3e20mr11757701a91.21.1760049076512;
 Thu, 09 Oct 2025 15:31:16 -0700 (PDT)
Date: Thu, 09 Oct 2025 15:31:15 -0700
In-Reply-To: <20251007221420.344669-8-seanjc@google.com>
Mime-Version: 1.0
References: <20251007221420.344669-1-seanjc@google.com> <20251007221420.344669-8-seanjc@google.com>
Message-ID: <diqzikgnhfm4.fsf@google.com>
Subject: Re: [PATCH v12 07/12] KVM: selftests: Report stacktraces SIGBUS,
 SIGSEGV, SIGILL, and SIGFPE by default
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, Shivank Garg <shivankg@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_153118_264851_4CDF1863 
X-CRM114-Status: GOOD (  23.32  )
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

Sean Christopherson <seanjc@google.com> writes:

> Register handlers for signals for all selftests that are likely happen due
> to test (or kernel) bugs, and explicitly fail tests on unexpected signals
> so that users get a stack trace, i.e. don't have to go spelunking to do
> basic triage.
>
> Register the handlers as early as possible, to catch as many unexpected
> signals as possible, and also so that the common code doesn't clobber a
> handler that's installed by test (or arch) code.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

I tested this with

diff --git i/tools/testing/selftests/kvm/guest_memfd_test.c w/tools/testing/selftests/kvm/guest_memfd_test.c
index 618c937f3c90f..f6de2a678bf99 100644
--- i/tools/testing/selftests/kvm/guest_memfd_test.c
+++ w/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -182,6 +182,8 @@ static void test_fault_sigbus(int fd, size_t accessible_size, size_t map_size)
        TEST_EXPECT_SIGBUS(memset(mem, val, map_size));
        TEST_EXPECT_SIGBUS((void)READ_ONCE(mem[accessible_size]));
 
+       mem[accessible_size] = 0xdd;
+
        for (i = 0; i < accessible_size; i++)
                TEST_ASSERT_EQ(READ_ONCE(mem[i]), val);

And got

==== Test Assertion Failure ====
  lib/kvm_util.c:2299: false
  pid=388 tid=388 errno=29 - Illegal seek
     1  0x000000000040a253: report_unexpected_signal at kvm_util.c:2299
     2  0x000000000042615f: sigaction at ??:?
     3  0x000000000040283f: test_fault_sigbus at guest_memfd_test.c:183 (discriminator 4)
     4  0x0000000000402c1c: test_fault_private at guest_memfd_test.c:200
     5   (inlined by) __test_guest_memfd at guest_memfd_test.c:376
     6  0x0000000000401e15: test_guest_memfd at guest_memfd_test.c:401
     7   (inlined by) main at guest_memfd_test.c:491
     8  0x000000000041ea03: __libc_start_call_main at libc-start.o:?
     9  0x0000000000420bac: __libc_start_main_impl at ??:?
    10  0x0000000000401fe0: _start at ??:?
  Unexpected SIGBUS (7)

I expected the line number to be 185 but the report says 183. Not sure
if this is a compiler issue or something caused by macros, or if it's
because of signals mess with the tracking of instruction execution.

Either way, this is a very useful test feature, thanks!

Tested-by: Ackerley Tng <ackerleytng@google.com>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>

> ---
>  tools/testing/selftests/kvm/lib/kvm_util.c | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index 8b60b767224b..0c3a6a40d1a9 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -2290,11 +2290,35 @@ __weak void kvm_selftest_arch_init(void)
>  {
>  }
>
> +static void report_unexpected_signal(int signum)
> +{
> +#define KVM_CASE_SIGNUM(sig)					\
> +	case sig: TEST_FAIL("Unexpected " #sig " (%d)\n", signum)
> +
> +	switch (signum) {
> +	KVM_CASE_SIGNUM(SIGBUS);
> +	KVM_CASE_SIGNUM(SIGSEGV);
> +	KVM_CASE_SIGNUM(SIGILL);
> +	KVM_CASE_SIGNUM(SIGFPE);
> +	default:
> +		TEST_FAIL("Unexpected signal %d\n", signum);
> +	}
> +}
> +
>  void __attribute((constructor)) kvm_selftest_init(void)
>  {
> +	struct sigaction sig_sa = {
> +		.sa_handler = report_unexpected_signal,
> +	};
> +
>  	/* Tell stdout not to buffer its content. */
>  	setbuf(stdout, NULL);
>
> +	sigaction(SIGBUS, &sig_sa, NULL);
> +	sigaction(SIGSEGV, &sig_sa, NULL);
> +	sigaction(SIGILL, &sig_sa, NULL);
> +	sigaction(SIGFPE, &sig_sa, NULL);
> +
>  	guest_random_seed = last_guest_seed = random();
>  	pr_info("Random seed: 0x%x\n", guest_random_seed);
>
> --
> 2.51.0.710.ga91ca5db03-goog

