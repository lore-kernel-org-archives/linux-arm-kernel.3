Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF553D1D489
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 20:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHDeNFz490Nrky17RXCNoP5KLrJVy9PVF3wfzv9VqJU=; b=h485EMQlShomgGpCocCJG8S8c6
	rMcgq+eNmQtWf3o+o9EcRfgpZhOF43sCmNEoFAXKDJ+AMvHyL822PjPW9BkRYFHWA/xo1V75xbi4t
	GspbPI31zo2gbhGjsLoiZQHRmcqKIMN3Yzkz12IAR6Xi3CCKUCkZNABgpiIyHo637R5E2nmcCMPGm
	AiYfBatHltfOGU6dZRi68rMxCStQuMb0gwSHOC43LiLEUpIJI2Aoq1n/w5YJUKSHxZAvslqafzXIT
	iKX2oWz4/k2X53bcENR7SQZGT8g3Yvcl4syPDTIfJ/T7MwmNl0ChkKzeewX+QY+0K26Agi5Vss45M
	wHFsfuoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwF2-00000000nMS-2oGo;
	Thu, 08 Jan 2026 20:04:20 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwF0-00000000nL5-0sxZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 20:04:19 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c337cde7e40so2269453a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 12:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767902653; x=1768507453; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RHDeNFz490Nrky17RXCNoP5KLrJVy9PVF3wfzv9VqJU=;
        b=iBDG/uYQC+MQeYboQZ3khGlDV+gPY2K1d36BnvNoSX1aM5jQayG2+i3TVC6A89jMgA
         g6xlzz6s/PE62wgby+pQhTz+xo02EvMybydibP9KRIi5ZpwH9ZlIR5fsPDiFe9N4228z
         6Y8Xbhr+IaxRrf82xb/kk9EiGZIg76Qo9x9Q5+OtaYIdjg2HV0WwSExIgoAkOno96BgF
         Gk8N/1AGcLgFC1rp6jWGSdhZZOvYiKFomGeRWjTLk94z2lOnDvRNdry0YpzDzHddVj/+
         D3VRW6+ltO+OopkmNN58Sb1Z9eoVa7Dgm0SQ+lP2uzR4CftL6ggCCz+91xO8txpP5CJc
         xFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767902653; x=1768507453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHDeNFz490Nrky17RXCNoP5KLrJVy9PVF3wfzv9VqJU=;
        b=RdxShUkX+vLgiihNoNvKUUfyQzti+uGCWwbG/lG+GU6zxXSRAAXfCdMQJ0HMbaBqKT
         gcPj61Zbz0CQ6eamz9Dd3W+6V6QE2XnS5fkHeOJ1oRdp83hstStVGw9cUTcQu4+31k4m
         vkMFbsmDofvnyhz1hsPLpu9GkC1qsErPdlFn8CbhA8ubsTB+xiO9xpz6X5LxRahz072U
         jvmrrdVNQ5UjLj1DhuqjJ+iktJcRZNX4cGC4zOkY9Bmp5gUgzle6A+tlitOJzW1WWxph
         Um4VG4era1l4tOg9mcMPJpdLyqHVp/legxdTr/momXLCaTaoU7vFW8JdWqAs1c+uo7K0
         0dag==
X-Forwarded-Encrypted: i=1; AJvYcCWpSgkKCFp0DiQD0cjTTp5UJQKSk0DBxlKLziNAKZuJ48Rb7YCGKaVit6ywUo6NOFK8bTjtIKmn38bLCjACGUJ6@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh1MURke3dgMF1dLydxgzplHNyKurGm4IYlcZVlxOKLLjdNcR/
	k5UnRcBwkP75HVD+s9IzGdfi0Qc0ulfaQhD+eMHrCqAaVGNDhbV0bkLJ8jqYwGejEJhMVdzQKFA
	VA1y/jg==
X-Google-Smtp-Source: AGHT+IFhKs48GN0WkSDiAO4qPNHLVPhcEoNB+pDwryoeKjyNGQcxURXgfxIrWzkPwVlbxpHNfeozbbrhcz8=
X-Received: from plhi7.prod.google.com ([2002:a17:903:2ec7:b0:29f:68b:3548])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3947:b0:344:97a7:8c6a
 with SMTP id adf61e73a8af0-3898f9cc49cmr7749765637.51.1767902652739; Thu, 08
 Jan 2026 12:04:12 -0800 (PST)
Date: Thu, 8 Jan 2026 12:04:11 -0800
In-Reply-To: <04c70698-e523-43ae-9092-f360c848d797@linux.intel.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com> <20251206001720.468579-40-seanjc@google.com>
 <04c70698-e523-43ae-9092-f360c848d797@linux.intel.com>
Message-ID: <aWANuxukqWmo36N0@google.com>
Subject: Re: [PATCH v6 39/44] KVM: VMX: Bug the VM if either MSR auto-load
 list is full
From: Sean Christopherson <seanjc@google.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Xudong Hao <xudong.hao@intel.com>, 
	Sandipan Das <sandipan.das@amd.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_120418_781574_3636E57C 
X-CRM114-Status: GOOD (  15.14  )
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

On Mon, Dec 08, 2025, Dapeng Mi wrote:
> On 12/6/2025 8:17 AM, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > index 38491962b2c1..2c50ebf4ff1b 100644
> > --- a/arch/x86/kvm/vmx/vmx.c
> > +++ b/arch/x86/kvm/vmx/vmx.c
> > @@ -1098,6 +1098,7 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
> >  {
> >  	int i, j = 0;
> >  	struct msr_autoload *m = &vmx->msr_autoload;
> > +	struct kvm *kvm = vmx->vcpu.kvm;
> >  
> >  	switch (msr) {
> >  	case MSR_EFER:
> > @@ -1134,12 +1135,10 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
> >  	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
> >  	j = vmx_find_loadstore_msr_slot(&m->host, msr);
> >  
> > -	if ((i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS) ||
> > -	    (j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS)) {
> > -		printk_once(KERN_WARNING "Not enough msr switch entries. "
> > -				"Can't add msr %x\n", msr);
> > +	if (KVM_BUG_ON(i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm) ||
> > +	    KVM_BUG_ON(j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
> 
> nit: Remove one extra space before "m->host.nr".

Oh, that's intentional, so that the rest of the line is aligned with the "guest"
line above.

