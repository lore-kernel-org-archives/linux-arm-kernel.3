Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8626D7237F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 12:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8vx9GwQUjLh0uv6iY/ZSwwZRSPo2xMq3kygdhRNHoE=; b=nCwoEmD7dB0ZRNSlU2DBdAbLX7
	l+Y2zUCqqB218klTid6md6KCaEjd4SwvFKSmQGj5zAeMneOYrtNRS4FkwX6NHNgB4bPlcp7mnd0S3
	nXW/BT/I7OWX+GQSaOIVMOsaHPFdkS10CM2E2KTx1B1rYma18GaOhYJjtOsCZ4DidF7UpRM0TjDfE
	1oK2/fS/AK98T3Pl3YnHHAHFA8di/Z83uJBBIyRY4te09F3ZhDOzcS0ZKVzWw1VsbPOWfSerb8QPe
	Q9ojjczTDXiqwFzAxBk/eck/MapMEHeNDpfThRimVx2+GZ88TQyg6dQ0vUTIA+ZYAzQRFbWUsrawi
	N+cUMttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGA4-00000008tfZ-44iI;
	Fri, 23 Jan 2026 12:21:12 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjGA2-00000008tf4-3IIc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 12:21:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so29427325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769170869; x=1769775669; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u8vx9GwQUjLh0uv6iY/ZSwwZRSPo2xMq3kygdhRNHoE=;
        b=TShTO57ghvP/E/zgWE/yYSFpwg5L4kzipSPvP5wLC+A66KRlI8yDnMJnxfgFXFUzbk
         ti16xdojWQ417CZe4GVa+qPlBU/SJuhtl4uufyRxjGEPyiDPKiVBRNKvFg5a6PU9ByFK
         JYP5uB4/3wB/a7E3HvAcIGfTzYy7hGfIQ35LLEfw1IjIzyz5wAvRQad0o+KtWLsIu6IT
         mfuHHhB19+pUHL1ZewyUkUMV/GJ3oHK0GhwdzOiRHtwIWQuoNFl0xuUxZl5jOR9NO66x
         2415hubHVjib/4yqgnJsB4kAfXsKwL7i640hAlYQQFJHBro5vhOvrL/mli/QBj45pdbZ
         LcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769170869; x=1769775669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8vx9GwQUjLh0uv6iY/ZSwwZRSPo2xMq3kygdhRNHoE=;
        b=vSxC3WFwCdkwKXg8bfEt4vcsacmXmcv+zUP1fmCO6ZH3UUaK/G/QIdVrRIyZl/vZ1Y
         w/ighrsScivjqLuc1MyQtrSQSF+V3oH+KSTF2D7wKJCVAG/v3EmCFHDY6xbtiYVYMGiY
         FR73jDMHHsDDBh0nTzfcPDhe45JMd4Ivzja8gY6vXmQguO/HeTwlUeS/ZJWskLPBxo+6
         fyJCOsugH1PTQgIoSQkuAgTU71DjleVhgEgwn4ZmAFECLtwgzzxGERn6AqssLzCF3Z5i
         nT80TQrRuypBchcy9EdDbSPlnvojc5RagdzP05kjLbZ1qwJFFqq3hHk1szy5aQewsK7M
         eU1g==
X-Forwarded-Encrypted: i=1; AJvYcCWDvHO2LazHcSlIyezY7m9mvI4K+Vc0Cvooz/p+D0mrfFsRX2wqGKnH1Z3w1ZlJZgXWCqZAmWcokiEx0Q/FsWGR@lists.infradead.org
X-Gm-Message-State: AOJu0YzHl+EMbdDpGgwQEybA142oP+iEJLLbNDOcLTaIHLi5Ry7N8yIx
	ILVmoshiEHPvqYE9134B43KQkVIu1aTjO9hvCMHYGKBH2hCJcZ134z5nrpVyhHES8g==
X-Gm-Gg: AZuq6aJgDIWyOfvpxZKXcMxEUoEbzBzNeULQ72t6nONA9PZbYDgENeb6r9KxShmEaHV
	kp/ymtx45k/ej9kO9R/4qGY3reW8rVX8NkUXIUBYn02IQFLCARy5WWB/+/5GOoIcNnzDcLmfeuf
	0KkDziUvJAQKA8EjNWu1hT3EdFEOAVg+EfugZ9W5JzFYL53vV143KdevLMosBJjX7uOeCJqcEIa
	fgj62UOGa26xqz3dgvGyEXiFsmE6kj/wYPgqFDtXuNBKpKIHwyp2x45ufz50o5X8SNj/ev8cJPH
	BvSMq5RszGZnPX0Fx+NxAKjqj+rXcPtkfsiM7ov3bJorF5Kjb/z9SYFc/WkwhqZS2zvyoiKVs6+
	V3Nr0Ji8csGgXKwBf0j1bUNNoXO0r/mApWwv/A3qGbSl99PTNfH3bGx2HW0FB84YYHbWc2tl6UU
	CNlPvfvrMHLj3nIbNv4qgg2zhz3xp5KrSL2i4Du6/ocWPHkhVjLtUx9JJ9MNbu
X-Received: by 2002:a05:600c:3f0f:b0:479:1348:c614 with SMTP id 5b1f17b1804b1-4804c9c09efmr42530825e9.26.1769170868562;
        Fri, 23 Jan 2026 04:21:08 -0800 (PST)
Received: from google.com (44.145.34.34.bc.googleusercontent.com. [34.34.145.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d61f1f8sm22563715e9.5.2026.01.23.04.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 04:21:08 -0800 (PST)
Date: Fri, 23 Jan 2026 12:21:04 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 29/30] KVM: arm64: Add selftest event support to
 nVHE/pKVM hyp
Message-ID: <aXNnsJqqsskXyJu7@google.com>
References: <20251202093623.2337860-1-vdonnefort@google.com>
 <20251202093623.2337860-30-vdonnefort@google.com>
 <868qe9mnx5.wl-maz@kernel.org>
 <aXNmKpHqVw93BegX@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXNmKpHqVw93BegX@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_042110_839862_0C907D84 
X-CRM114-Status: GOOD (  24.21  )
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

On Fri, Jan 23, 2026 at 12:14:34PM +0000, Vincent Donnefort wrote:
> On Wed, Jan 07, 2026 at 03:40:22PM +0000, Marc Zyngier wrote:
> > On Tue, 02 Dec 2025 09:36:22 +0000,
> > Vincent Donnefort <vdonnefort@google.com> wrote:
> > > 
> > > Add a selftest event that can be triggered from a `write_event` tracefs
> > > file. This intends to be used by trace remote selftests.
> > > 
> > > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > > 
> > > diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> > > index 37c015b54ff6..e2de7ad64938 100644
> > > --- a/arch/arm64/include/asm/kvm_asm.h
> > > +++ b/arch/arm64/include/asm/kvm_asm.h
> > > @@ -96,6 +96,7 @@ enum __kvm_host_smccc_func {
> > >  	__KVM_HOST_SMCCC_FUNC___tracing_update_clock,
> > >  	__KVM_HOST_SMCCC_FUNC___tracing_reset,
> > >  	__KVM_HOST_SMCCC_FUNC___tracing_enable_event,
> > > +	__KVM_HOST_SMCCC_FUNC___tracing_write_event,
> > >  };
> > >  
> > >  #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
> > > diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
> > > index 268b3cd7a1b2..c276fd28e0bf 100644
> > > --- a/arch/arm64/include/asm/kvm_hypevents.h
> > > +++ b/arch/arm64/include/asm/kvm_hypevents.h
> > > @@ -42,4 +42,15 @@ HYP_EVENT(hyp_exit,
> > >  	),
> > >  	HE_PRINTK("reason=%s", __hyp_enter_exit_reason_str(__entry->reason))
> > >  );
> > > +
> > > +HYP_EVENT(selftest,
> > > +	HE_PROTO(u64 id),
> > > +	HE_STRUCT(
> > > +		he_field(u64, id)
> > > +	),
> > > +	HE_ASSIGN(
> > > +		__entry->id = id;
> > > +	),
> > > +	RE_PRINTK("id=%llu", __entry->id)
> > 
> > Not strictly related to this patch, but I find that the trace itself
> > lacks context. For example:
> > 
> > [001]	  323.847422: hyp_enter reason=hvc
> > [001]	  323.847423: hyp_exit reason=eret_host
> > [001]	  323.847688: hyp_enter reason=hvc
> > [001]	  323.847688: hyp_exit reason=eret_host
> > [001]	  323.847706: hyp_enter reason=hvc
> > [001]	  323.847707: hyp_exit reason=eret_host
> > [001]	  323.847722: hyp_enter reason=hvc
> > [001]	  323.847723: hyp_exit reason=eret_host
> > 
> > That's all fine as long as I'm dealing with a single guest, or even
> > with a single vcpu. Trying to trace multiple guests, or even multiple
> > vcpus makes the whole thing completely unusable, because I have no
> > idea what I'm looking at.
> > 
> > To make this useful, having some context provided by the host really
> > is required.
> 
> I could add to the event header the VM pid related to the currently loaded vCPU
> (if any). I can access it easily with host_kvm->userspace_pid. WDYS?

Or actually directly kvm_vcpu->pid?

> 
> > 
> > Thanks,
> > 
> > 	M.
> > 
> > -- 
> > Without deviation from the norm, progress is not possible.

