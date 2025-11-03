Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB53CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 20:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=sFISxKcpVtRMW9qViBSzBSHtJYoRCisVbA2/agw09uM=; b=nfRBje36bk52DtC+1o2KcsXCHj
	mKg+perFt8KC/EKTCJmND7jUeM65xFrNZBpkd8NN1df1IGqAyy7Cxtg2Tt/irrODhANyMmRNh4/zU
	dHBnfl7f0kkXR403lnXd7p/ih6wVu2edUtZnfnj/w5m4F5kXv9nnv2N6Ptj1A5L2o5UlCsRXhbuvw
	Oq6QnXVVXL/0efjQNcujB/y3mjYYeUlFP9V0SRof280ZjQdwb2C6ChZdMnjTGEWTi30KJllYlm5mw
	1kENBNPUaeBwGcSdLkg8qwclQs82Yx1dkbr0W5gg73YkBPILXT2Fd0HXGVwXM5rHlHZ+X2Ewniz9h
	fRdEUEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG0us-0000000AaVq-3JTv;
	Mon, 03 Nov 2025 20:12:38 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG0uq-0000000AaVP-2FJ5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 20:12:38 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b5a631b9c82so2974599a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 12:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1762200755; x=1762805555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFISxKcpVtRMW9qViBSzBSHtJYoRCisVbA2/agw09uM=;
        b=F5sgR1bFBYv/aUtmmqEvKFI9gf0Na2GcFrtklBrt7iu8KfmWnj6LEVTL8TR4ayXOmW
         bIQQQ7h1d4h9hXJ75yeHumMzrKPuk9qIZ0fkOjbikGAKEBaIZpSzQsY6WwnH40iIPveW
         xSwHCTmw3iWqP6BDZmKb8q1zMUObwf/Q/AR+1mdQ+ovH4A8Pi80EwpC1OT7ydMTXpZw3
         YFkOQ7WO7jANrTQbXwQfftg+0wt7h0I8ailFMojygp6AnmouXmi9aSq0kPw5C2HdK8sT
         WdBWHslnfDVrAq1gZQHdf85R4qWUOXwVq0z9goDStyb2OXir0F6i/x2aqZhO65tdScsE
         F0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762200755; x=1762805555;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFISxKcpVtRMW9qViBSzBSHtJYoRCisVbA2/agw09uM=;
        b=B1azSTQx/kPSs83+qR+vB/bSt9zLfqw84H4GYfJf+Ila81tbefIdtijUpKvuIKsmbj
         x+t3YXyEBxNssUK231jW9weEuB2yljdM3ful5c1dW4dsDOnONajVENfAOrPZ8ABt97Vg
         NQ/OerheQfvW9vW6MUEdUEGCJOnnCv+DMMqRR3flWiVZc53BfnDgccTs3NG/sqit7oDY
         xAcGQFWT47GEG0wZ5/INzhlVMf2Zl9mA19bHPSiWfNAPlo2fqSNh8SVfB5skL6C9J4Jz
         8MfbxLheLHJL+zF/tXLXYsSmKBUW56bVIeDu9WL06YrWdl08KoD8y9L3q55mB0b4NQI4
         zS/A==
X-Forwarded-Encrypted: i=1; AJvYcCXihVwAAqGuF2a0EacWNQGWOQfBjMK4WxidQYerJ+au3ZfFo0mZt4NSuPbBV0I8nGCsT9nKh94TKKsKFj96BRpS@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb3Q88xx8+6EQbKeZXBSgaqO1dEYok9LCJJNqxKPfaJMaSlCKQ
	qElZBCUfl/ZH5ui8c2A7fL5WVuowZEprRpD1Rntcdx3h1Y/7wT7EYNlkjAvfLp8EshU=
X-Gm-Gg: ASbGncvlxNByC3lANjJAJu53xywQqW5qgPUHp3GfIS2XQ+ill8oeYTJjr/tFPWJX8tw
	S0M1ypiGX2DNXX1NpqHmdd9qWEWpB6sBhN83uSX6LIPIkm2y3Vcimmj8gTZvaXakgcE0IFc4zbg
	vLoX1BXkJ2rEQeW/+VjmU+MynBe7xyI0kRG8Z/aAvT5F/rQzjN+T8Cy202igczoYMD82HmPK6Ru
	zf/kj7GfwDQ/zJAkvW0kOKH721kC63j4IlGshRhKJcgv+P8K3tq+VgVQLxxfoZ0I8TJL81807NT
	HBXzmkzF+dMpTCse5ukjSAUFkTRiR6p6PutlQi7KqQBI/Fi3dY/RZqaaCbz78qSl34rMlstCLmv
	TDXvI1aVB6N99M35t+Ad7aHxdeWFvjf2nSQ3dqDr5wrcTBsop/QomA/NUmrIoJLo0/5qGvmwzvN
	PcGUADn/2tfpWSC/jzeb/ZgVYmZAtf
X-Google-Smtp-Source: AGHT+IE4MP1pGlWYwqtJ9xrsRX8t2xur3n+Uk0TXpYe3poYigeUNjIO8w2p3vJkvxGanZh15ZZCuLw==
X-Received: by 2002:a17:903:120a:b0:295:195:23b6 with SMTP id d9443c01a7336-2951a52a6f5mr176076975ad.55.1762200754689;
        Mon, 03 Nov 2025 12:12:34 -0800 (PST)
Received: from localhost ([2620:10d:c090:500::5:449])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34159a06dd4sm1968212a91.15.2025.11.03.12.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:12:34 -0800 (PST)
Date: Mon, 03 Nov 2025 12:12:34 -0800 (PST)
X-Google-Original-Date: Mon, 03 Nov 2025 12:12:11 PST (-0800)
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
In-Reply-To: <aQXtqoUEtDr-xUeS@arm.com>
CC: paulmck@kernel.org, Will Deacon <will@kernel.org>,
  Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, w@1wt.eu, yangyicong@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Message-ID: <mhng-A59C956F-FF23-4DC9-A797-3DC0F2323CEF@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_121236_689045_BDCF888D 
X-CRM114-Status: GOOD (  29.50  )
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

On Sat, 01 Nov 2025 04:23:22 PDT (-0700), Catalin Marinas wrote:
> On Fri, Oct 31, 2025 at 08:25:07PM -0700, Paul E. McKenney wrote:
>> On Fri, Oct 31, 2025 at 04:38:57PM -0700, Paul E. McKenney wrote:
>> > On Fri, Oct 31, 2025 at 10:43:35PM +0000, Catalin Marinas wrote:
>> > > I just realised that patch doesn't touch percpu.h at all. So what about
>> > > something like (untested):
>> > >
>> > > -----------------8<------------------------
>> > > diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
>> > > index 9abcc8ef3087..e381034324e1 100644
>> > > --- a/arch/arm64/include/asm/percpu.h
>> > > +++ b/arch/arm64/include/asm/percpu.h
>> > > @@ -70,6 +70,7 @@ __percpu_##name##_case_##sz(void *ptr, unsigned long val)		\
>> > >  	unsigned int loop;						\
>> > >  	u##sz tmp;							\
>> > >  									\
>> > > +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
>> > >  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
>> > >  	/* LL/SC */							\
>> > >  	"1:	ldxr" #sfx "\t%" #w "[tmp], %[ptr]\n"			\
>> > > @@ -91,6 +92,7 @@ __percpu_##name##_return_case_##sz(void *ptr, unsigned long val)	\
>> > >  	unsigned int loop;						\
>> > >  	u##sz ret;							\
>> > >  									\
>> > > +	asm volatile("prfm pstl1strm, %a0\n" : : "p" (ptr));
>> > >  	asm volatile (ARM64_LSE_ATOMIC_INSN(				\
>> > >  	/* LL/SC */							\
>> > >  	"1:	ldxr" #sfx "\t%" #w "[ret], %[ptr]\n"			\
>> > > -----------------8<------------------------
>> >
>> > I will give this a shot, thank you!
>>
>> Jackpot!!!
>>
>> This reduces the overhead to 8.427, which is significantly better than
>> the non-LSE value of 9.853.  Still room for improvement, but much
>> better than the 100ns values.
>>
>> I presume that you will send this up the normal path, but in the meantime,
>> I will pull this in for further local testing, and thank you!
>
> I think for this specific case it may work, for the futex as well but
> not generally. The Neoverse-V2 TRM lists some controls in the
> IMP_CPUECTLR_EL1, bits 29 to 33:
>
> https://developer.arm.com/documentation/102375/0002
>
> These can be configured depending on the system configuration but they
> are too big knobs to cover all use-cases within an OS. This register is
> typically configured by firmware, we don't touch it in Linux.

Mostly for Paul:

I have patch to let you do this from Linux, and I have some 
firmware for some of these internal systems that lets you set most of 
these magic bits.  I've noticed some unexpected behavior around prefetch 
distance on an internal workload, but haven't gotten much farther there.  
There's also some other bits that to wacky things...

Just FYI: Marc described trying to set these dynamically as trying to 
swallow a running chainsaw, but LMK if you're feeling risky and I can 
try and get you a copy of my setup.  They seem to work fine for me ;)

> I'll dig some more but we may have to do tricks like prefetch if we
> can't find a hardware configuration that satisfies all cases.

