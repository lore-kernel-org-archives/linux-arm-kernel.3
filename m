Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4737CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2r/L8/q4C9e2I164NDxUGdYhK/0nvlG6dMGzaNBqVg=; b=pa3l8GJoHqW0Sh1aOxO6Js7gnP
	n5mZewDd5AIBH9X4DWQnEh9nlw3g5UJW46HwuuC7hBTxeNtbc5jSGyPvJ19bZFlxQwylCKsWO+u7B
	EuA76He2yogssFcepsHZVtS3egahNVdJ0WGCGaJZ2huuDA9zMF84dgPiL6DLKSYNc7/P32KIQS/oU
	HlCsn4Xoelac09RdbjhhjYgv7UTJnA9mYbJNCnYYXiPMJeyNisVZZhO1Ol9aq40qJIEmQL9bCpBoe
	m3aoj4qtwErD4WjVsDPgxubTF5FnZ+I3/4P0jxJyJM2mG0xzWeIU5OkA4+Cmf637fBa+8qP9YqN6q
	1Hd56n0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8co2-0000000G0G3-1i91;
	Tue, 14 Oct 2025 11:03:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8cnz-0000000G0Di-1Njv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760439777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s2r/L8/q4C9e2I164NDxUGdYhK/0nvlG6dMGzaNBqVg=;
	b=e83mDdrqUjDTuwZOBUhrBr3TEQ/TkIV8qTEniGUfnpBREMz0qkkI/uMbWOP4Dgm+hIdaNX
	3moPEZQkkSVDIOsXJulDC95g9GeF0uOMCE/NtlX2T1xrFCJhz6UsRK8B9MFTOQy6Nw9qvD
	X4lXGxiqvUIynZmtSwM0Hy9XFEWA4EI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-R64Bnk9XNAq9GgeYn1KsYQ-1; Tue, 14 Oct 2025 07:02:55 -0400
X-MC-Unique: R64Bnk9XNAq9GgeYn1KsYQ-1
X-Mimecast-MFC-AGG-ID: R64Bnk9XNAq9GgeYn1KsYQ_1760439775
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e47d14dceso29786905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 04:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760439774; x=1761044574;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s2r/L8/q4C9e2I164NDxUGdYhK/0nvlG6dMGzaNBqVg=;
        b=OO3FjHWf+Mk5UDOeoFn4rt4fpcJEOHZYj448Pl/Zsczp69uooq5ie9hf7VQoSJ0DqZ
         VDPwXHDwJD6/vWYbXAgfWewvFIKfplcvn2CE2TzCEp8RkAMlZ2uamLyIswjZUNDopZwT
         0+3eSgy+dCAbjdBLAUPAPoHXxmDmrSWVdQbWamp3K34+OdMXxpnCUAqXvvT3PyFx9UKJ
         gqUoMPnFcU6BRqLdmekxjZ5UfGCzkEfLswV/n6GsfrXOMLFEhxaDQwIzQe42FiHfFQky
         cRxN2KNkgwHwZvKSUv5/lXCgwHu3Cb6c9gRkSLb16FUQnsGkFTMU2AoWYV1btJQnGoxm
         iveQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+NcXf81zT4xg6aRPUcTfO/bcaCZdG1RYWlDJGESjRXEBDckJXbfzQrynxdWT2ukO/SNJTfa6oLyYYw/F8YQM0@lists.infradead.org
X-Gm-Message-State: AOJu0YyIBMYHasFgbk/Vdx38ceihP9ABYyavTutsEICmTAa+lE1t+O0k
	g12eJyNHU61VraokAlD77GQuDhYVyI7BpszZSAXGoMtVy1+ujzc9+1O2LjEj4Jqp8ymvHTALsXA
	B+D/srNE1df86IfgqPEDZcfJmPfFz8uc7SlMEYr1Nctz3SI2ujTef9hvevQxpmqABwuYFVmroju
	yA
X-Gm-Gg: ASbGnct5zbQwJ0w/wGzun3FYyRzAd1nSWY5rae4tItYv6gkbIWO3EbAK5SjJvxWlm55
	4PbU7NFrxBHu4CTU4e7GNJyUIJLblmmqKHLYxm3Sld+8QNe3i6+HyQXUxtfwBf83PC5tzMIgHC0
	xw42vhH7DeEyTpeMEPtITJ6HzskH5yJYMx3t3ONqiZgPph+Uqn1KnYQ0NaT5ImjWRa/wqkeTGpC
	DlWkRj9KiNzLKcMJbkG3l9JW41zvHZ+Fxo3X8RR7UU8P3qt/zibjwR/8fYOAACyqmKB2KpobdYD
	dkwLnN393bNQLPK6XOHCgmZvQ1iKISFMCKXJG8RZhzXgoFiUU34H4vSiQxfezPe3ivqgapVRHLh
	h+LqtIyOB75CagoGYPzYywtRWgg==
X-Received: by 2002:a05:600c:4752:b0:46e:3dad:31ea with SMTP id 5b1f17b1804b1-46fa9af8fb0mr181929145e9.17.1760439774545;
        Tue, 14 Oct 2025 04:02:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCodl08uTX0ubswP5nTiGxebtIpD1Qw4JnrqS3e+W7M5qhx4w6eQs0AuIjitoXX5t0l6/vwQ==
X-Received: by 2002:a05:600c:4752:b0:46e:3dad:31ea with SMTP id 5b1f17b1804b1-46fa9af8fb0mr181928825e9.17.1760439774097;
        Tue, 14 Oct 2025 04:02:54 -0700 (PDT)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426f2f72e18sm1737515f8f.0.2025.10.14.04.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:02:52 -0700 (PDT)
From: Valentin Schneider <vschneid@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Josh
 Poimboeuf <jpoimboe@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker
 <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Jason
 Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 "David S. Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 19/29] KVM: VMX: Mark vmx_l1d_should flush and
 vmx_l1d_flush_cond keys as allowed in .noinstr
In-Reply-To: <aO2S3oZwOW_UgAci@google.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-20-vschneid@redhat.com>
 <aO2S3oZwOW_UgAci@google.com>
Date: Tue, 14 Oct 2025 13:02:50 +0200
Message-ID: <xhsmhwm4xpwyt.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rqB8jNDsWXPRdmDNsRQuRgW1qHDyxYLtVfnNsgDQHyM_1760439775
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_040259_435371_026B9570 
X-CRM114-Status: GOOD (  15.73  )
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

On 13/10/25 17:01, Sean Christopherson wrote:
> On Fri, Oct 10, 2025, Valentin Schneider wrote:
>> Later commits will cause objtool to warn about static keys being used in
>> .noinstr sections in order to safely defer instruction patching IPIs
>> targeted at NOHZ_FULL CPUs.
>>
>> These keys are used in .noinstr code, and can be modified at runtime
>> (/proc/kernel/vmx* write). However it is not expected that they will be
>> flipped during latency-sensitive operations, and thus shouldn't be a source
>> of interference wrt the text patching IPI.
>>
>> Mark it to let objtool know not to warn about it.
>
> Can you elaborate in the changelog on what will happen if the key is toggle?
> IIUC, smp_text_poke_batch_finish() will force IPIs if noinstr code is being
> patched.

Right!

> Even just a small footnote like this:
>
>   Note, smp_text_poke_batch_finish() never defers IPIs if noinstr code is
>   being patched, i.e. this is purely about silencing objtool warnings.
>
> to make it clear that there's no bug/race being introduced.

Good point. How about:

"""
Later commits will cause objtool to warn about static keys being used in
.noinstr sections in order to safely defer instruction patching IPIs
targeted at NOHZ_FULL CPUs.

The VMX keys are used in .noinstr code, and can be modified at runtime
(/proc/kernel/vmx* write). However it is not expected that they will be
flipped during latency-sensitive operations, and thus shouldn't be a source
of interference for NOHZ_FULL CPUs wrt the text patching IPI.

Note, smp_text_poke_batch_finish() never defers IPIs if noinstr code is
being patched, i.e. this is purely to tell objtool we're okay with updates
to that key causing IPIs and to silence the associated objtool warning.
"""


