Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C96D1D494
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 20:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncr9wQixKp0DuZvt8wQRxeDUwFvl6Ym9a7uU4tCK5vA=; b=RVUGH+GMMeSlR+lZVuhTyi0GRP
	hfPd5/3U39P8zWBqICIxyI9Rfv5dHjbGi8HW3z2YZ7JD6e/iQG+EQIjJezHSBbvbh41Hr1AB/1i9j
	CuL6jcNrWdxaWeSqPP+iPLkm/PppGnxSfC5S1w9AyYp3p4IZShVTA5RgM6qVLyxuXG0PvdqCakRvA
	JXIiAdUx7e/LFk+sEPXIBtHeRM1dYoItPMx1o60HnIyw9qaTQ3tocPJeFsKow2+YAz4khfV++Fvva
	MygcqXJJRlBlvWb9tVVUNAwBL3O5rQ/vhr0yyF/9a+B8yZPfRWYy16M5Zbs8CpQ7F6HOCcnt+Yex2
	ypKewFdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwd9-00000000pZV-0boV;
	Thu, 08 Jan 2026 20:29:15 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwd6-00000000pYV-3Ols
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 20:29:13 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34c21341f56so7549111a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 12:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767904151; x=1768508951; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ncr9wQixKp0DuZvt8wQRxeDUwFvl6Ym9a7uU4tCK5vA=;
        b=Ej+vC5yU7yywOXnKItyW3jPZYoTWAJ4F4cbEMn1Ag3mlW5ZQQ1faJ4du/uISaWLnvo
         +sr8zBeNgJ+YDTEEOTH5pdRLrLusgUa3T3JRrC1fLwQnzDkjszh+AeIXTAm1B8gzH82f
         fLQfMxC24eI8hOTs8MTyYNis9WEvtvETR/cYAseURPuijN9EedjC01ilEutJf6d44NiA
         oyXMdxOfDiTfC6ccxZ0wNxKWGTAHZR0IpuoF3cRBPZhyMc+MYajA8g0CW68fl3CbFe3l
         1L38bq34Xp2So8L3nygdATb39VpglY2RP2DqO7JyLBtQv/b5YCG1SvjbDg1ui+xhbI+9
         Ntfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767904151; x=1768508951;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ncr9wQixKp0DuZvt8wQRxeDUwFvl6Ym9a7uU4tCK5vA=;
        b=SOg2K/dIe1qn43UiKB0j7lcrfI21sU6/l/oI8gzH17jGwIHz/hlIJLxzZAYmxMuI5x
         AWizEzCt+lmAnWzJxv7ahjKugdUDuoYv4qHSpR6OYxIoJILPC0cAu9WdAxtUvnEotjN1
         QQ4yOX67wn+5Z+zUZDDLImViBftMG/KHuJao0GCvrTaMmVU5BjbiBr/FPNALHRXj4GYC
         5T4G6gWxGReLMINTpXoJAbyv6MPOSoxeY3SXTgmh5IdVT2D3E2On5Zw48pSs/0vJggK1
         q6uqVCJogqAMx96uWGbZbjJS0kuJwWfPhXQXrTMcyheZcqeXVd70r8a0OqZv+opJ+fmd
         KpWg==
X-Forwarded-Encrypted: i=1; AJvYcCXXbF74cQHw9wkzeqjswGmKQWakpgJhTEvz/qryKNBXnQQzTyFDCby2t8e+GfOFO82beXLidHzr2lUHxwNYQ7uv@lists.infradead.org
X-Gm-Message-State: AOJu0YxEwVtjHHidaSgAkh5H4HKvK/Tk0pJN3mvcqLhncyH9EHFoKnLZ
	UAZ85PsFPwqqxVpHBd5NN2o7YIaZQgzynDknWw8vG6pPQe0GEQmzs00bTsPOiksG7sIh7EZK3Mx
	0P7CJMg==
X-Google-Smtp-Source: AGHT+IESJ6DBGvd9XcEdp+Peyz/5rANQAvVoqUp8W0UHChsh0K8dNusc9fRWmWPXBczuvgljaqvYKeQ4Bc0=
X-Received: from pjop14.prod.google.com ([2002:a17:90a:930e:b0:33b:52d6:e13e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2647:b0:340:dd2c:a3f5
 with SMTP id 98e67ed59e1d1-34f68c30870mr6773023a91.3.1767904151387; Thu, 08
 Jan 2026 12:29:11 -0800 (PST)
Date: Thu, 8 Jan 2026 12:29:09 -0800
In-Reply-To: <3xrew6ag7pefka7wava4z7ht54e6xlpwbywcm2ivsgnkdbahe4@yqzsaxnhedj7>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com> <20251230230150.4150236-22-seanjc@google.com>
 <t7dcszq3quhqprdcqz7keykxbmqf62pdelqrkeilpbmsrnuji5@a3lplybmlbwf>
 <aV_cLAlz4v1VOkDt@google.com> <gzyjze3wszmrwxdwnudij6nfqdxzihm37uappfqxorfjy5vatf@hffzaobbm3g7>
 <aV_3-lhnZ-MoKnjv@google.com> <3xrew6ag7pefka7wava4z7ht54e6xlpwbywcm2ivsgnkdbahe4@yqzsaxnhedj7>
Message-ID: <aWATlfisv8ZVZi0c@google.com>
Subject: Re: [PATCH v4 21/21] KVM: selftests: Test READ=>WRITE dirty logging
 behavior for shadow MMU
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_122912_869571_61862942 
X-CRM114-Status: GOOD (  21.29  )
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

On Thu, Jan 08, 2026, Yosry Ahmed wrote:
> On Thu, Jan 08, 2026 at 10:31:22AM -0800, Sean Christopherson wrote:
> > On Thu, Jan 08, 2026, Yosry Ahmed wrote:
> > > >  	/*
> > > > -	 * Add an identity map for GVA range [0xc0000000, 0xc0002000).  This
> > > > +	 * Add an identity map for GVA range [0xc0000000, 0xc0004000).  This
> > > >  	 * affects both L1 and L2.  However...
> > > >  	 */
> > > > -	virt_map(vm, GUEST_TEST_MEM, GUEST_TEST_MEM, TEST_MEM_PAGES);
> > > > +	virt_map(vm, TEST_MEM_BASE, TEST_MEM_BASE, TEST_MEM_PAGES);
> > > >  
> > > >  	/*
> > > > -	 * ... pages in the L2 GPA range [0xc0001000, 0xc0003000) will map to
> > > > -	 * 0xc0000000.
> > > > +	 * ... pages in the L2 GPA ranges [0xc0001000, 0xc0002000) and
> > > > +	 * [0xc0003000, 0xc0004000) will map to 0xc0000000 and 0xc0001000
> > > > +	 * respectively.
> > > 
> > > Are these ranges correct? I thought L2 GPA range [0xc0002000,
> > > 0xc0004000) will map to [0xc0000000, 0xc0002000).
> > 
> > Gah, no.  I looked at the comments after changing things around, but my eyes had
> > glazed over by that point.
> > 
> > > Also, perhaps it's better to express those in terms of the macros?
> > > 
> > > L2 GPA range [TEST_MEM_ALIAS_BASE, TEST_MEM_ALIAS_BASE + 2*PAGE_SIZE)
> > > will map to [TEST_MEM_BASE, TEST_MEM_BASE + 2*PAGE_SIZE)?
> > 
> > Hmm, no, at some point we need to concretely state the addresses, so that people
> > debugging this know what to expect, i.e. don't have to manually compute the
> > addresses from the macros in order to debug.
> 
> I was trying to avoid a situation where the comment gets out of sync
> with the macros in a way that gets confusing. Maybe reference both if
> it's not too verbose?
> 
> 	/*
> 	 * ... pages in the L2 GPA range [0xc0002000, 0xc0004000) at
> 	 * TEST_MEM_ALIAS_BASE will map to [[0xc0000000, 0xc0002000) at
> 	 * TEST_MEM_BASE.
> 	 */

Heh, your solution to a mitigate a comment getting out of sync is to add more
things to the comment that can get out of sync :-D

Unless you feel very strongly about having the names of the macros in the comments,
I'd prefer to keep just the raw addresses.

