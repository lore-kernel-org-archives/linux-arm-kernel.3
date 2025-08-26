Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57F6CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 00:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U4ctZNwYJMz9+Hk7ge9l8ZiYDw45Y30bqY3Iaj5/gqE=; b=s5jjnp/5WTmdu2Kg3bwpTHnxnR
	k9zm5VDwy4juddq5oIb62XnTo/xv1zSM8yKgB5Wt8A/6CchGxDUNYkEgCuC2jyunxHVpdTzQOO/qf
	qrqdsRI7LlDFwBYER6TCfCy8MxQaVvPlgIujcJ1aV7BaNOgEnXoUPpdTNxFrup8cMLgOtS3pAEntQ
	fAIU3M/JjPjuWy+3SsTduMhwcj9ABR3zpV2GSLcuNRumjrfZNze6/vF0l4D8yAGVc5hvgG0164Fm+
	P/gDjelxIC1TEiq71gBMycIFcHHD5fkc/vfJp3LoSMXCDMK2qhy6M6Q0ENC1JHyZ9XPtytVTi6X4O
	FZ8r9wvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqhZf-0000000AClK-2QYz;
	Tue, 26 Aug 2025 00:30:07 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqhWx-0000000ACUz-3kSr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 00:27:20 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-76e2eb6d2baso9585413b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 17:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756168038; x=1756772838; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U4ctZNwYJMz9+Hk7ge9l8ZiYDw45Y30bqY3Iaj5/gqE=;
        b=2zg5qTi86OMXtxUePXkzOJeDylIRi+CibX6YG/2IEujUFFX03j64NtX18W34AqrvDR
         OX7q2+vEpAsQKSw4xNZnZHCuJ+B478d5L+tCdcxBumYjkrJQvDMiuW7PnaxQhCUP7boI
         ZrPnnvQyqO1NjSO5mXwpFU9U75GIyA00fDGe/jHBM7oBNCPQyTNsbBlF6tI6+rFSqL8N
         lOQr3H5QlNC9GL+n/MT+62VBIJ9njWfn4NMofZImwUMdZ/B0+SMict7n7T4yAo6F2iAr
         QUsOm6tugl+CO7IdIzdC69oKS++NEpTzr8Bmo3jPzzLbow4qy2I9FSuUQJka9s0kEgis
         KgiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756168038; x=1756772838;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4ctZNwYJMz9+Hk7ge9l8ZiYDw45Y30bqY3Iaj5/gqE=;
        b=vnS0QTp0ZIUdnnqez7SHvJXRqm9/4auhngFoZmf3QLyNufLsZ+0Pd1BxYrj1JVTaVl
         H2PAlT2VYmxxuYuYDMmSsyi63IqNw6C7kDRlHJLcalhVBw3T1FQ1wsqIlCoI1xeqbg7E
         URG6xI0WWnlvRe1Sn7mrnYwexKfzB5dVgAP+XWjf6MyR1/cQ30d7pgFXSrixEuk5nkjO
         7cTJ+dfrrJmu1IZvAGpP/TTFPIOZruBs0E5/vldmT1mWnA0Mdcm3f45q4R3T96ykSiQK
         MP6dJn+/wtRcCa0mlzLp3GUoOlG/xwEqLdM7d4LmnzQksRc/hmWKDrF0ZbZXkzfTi2IF
         pwjw==
X-Forwarded-Encrypted: i=1; AJvYcCUjeSwHzTHvlPu5Uoc3L+ziBA7KRgH1hTBQ4riJG4yTWZUzLLPmDJYzXQ4OCQSqxGb/J65jJSS45//2RRVZEa2X@lists.infradead.org
X-Gm-Message-State: AOJu0YySq5CAEOBd9BA4dPeN4h8LPtnmLln1731A8DTcA/I6TtWnlFlY
	YBFMTUt0wgugtVRbyvHiHyyuGFw10sqGFLs6aS9YondkK0LVyFu9rOYGtbDTk1ZeEEZZHL88nEE
	KfePJtQ==
X-Google-Smtp-Source: AGHT+IFw5Mjf6HTcAUWU+u7CL/B6QAA0945o29LTS2VrhL4i1mL+9cXlmfjB4AEyc0iYoyyJlQoJr1vqexM=
X-Received: from pjbsp15.prod.google.com ([2002:a17:90b:52cf:b0:30a:7da4:f075])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a105:b0:230:8b26:9d47
 with SMTP id adf61e73a8af0-24340ab318emr21164734637.10.1756168038330; Mon, 25
 Aug 2025 17:27:18 -0700 (PDT)
Date: Mon, 25 Aug 2025 17:27:16 -0700
In-Reply-To: <3188ca61-2591-4576-9777-1671689b7235@linux.microsoft.com>
Mime-Version: 1.0
References: <20250825200622.3759571-1-seanjc@google.com> <3188ca61-2591-4576-9777-1671689b7235@linux.microsoft.com>
Message-ID: <aKz_ZMvvF0e9nwSn@google.com>
Subject: Re: [PATCH 0/5] Drivers: hv: Fix NEED_RESCHED_LAZY and use common APIs
From: Sean Christopherson <seanjc@google.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Peter Zijlstra <peterz@infradead.org>, 
	Andy Lutomirski <luto@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-hyperv@vger.kernel.org, 
	rcu@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_172719_926784_369442A7 
X-CRM114-Status: GOOD (  22.92  )
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

On Mon, Aug 25, 2025, Nuno Das Neves wrote:
> On 8/25/2025 1:06 PM, Sean Christopherson wrote:
> > Fix a bug where MSHV root partitions don't honor NEED_RESCHED_LAZY, and then
> > deduplicate the TIF related MSHV code by turning the "kvm" entry APIs into
> > more generic "virt" APIs (which ideally would have been done when MSHV root
> > support was added).
> > 
> > Assuming all is well, maybe this could go through the tip tree?
> > 
> > The Hyper-V stuff and non-x86 architectures are compile-tested only.
> > 
> 
> Thanks Sean, I can test the root partition changes.
> 
> A similar change will be needed in mshv_vtl_main.c since it also calls
> mshv_do_pre_guest_mode_work() (hence the "common" in mshv_common.c).

Oof, more dependencies.  I suppose the easiest thing would be to send a series
against

  git://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git queue

and then route everything through there?

Alternatively, frontload the MSHV fixes (which I'll do regardless) and take those
through hyperv and the rest through the tip tree?  That seems like an absurd
amount of juggling though, especially if we want to get the cleanups into 6.18.
And if none of these lands, it's MSHV that'll suffer the most, so betting it all
on the hyperv tree doesn't seem terrible.

> Also, is it possible to make all the mshv driver changes in a single patch?

It's certainly possible, but I'd prefer not do to that.

> It seems like it would be cleaner than refactoring it in patches 1 & 2 and
> then deleting all the refactored code in patch 5.

Only if you don't care about backporting fixes, bisection, or maintaining code.

E.g. if checking NEED_RESCHED_LAZY somehow causes issues, it would be really nice
for that to bisect to exactly that patch, not a patch that also switches to a
completely different set of APIs.

And if someone is wants the fixes in a pre-6.18 kernel, they don't need to
backport all of the KVM and entry code changes just to get the fix.

As for the maintenance headache, see above.

