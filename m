Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46638E6F06E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hX5tyyhHqv16hXch1rLN0W0q9yFTn7ruBymiSqraZAY=; b=E79yZt2ibl8KTyD1bQEpz4nfbZ
	ngYBVUGWfEv1VDzGLIo6CsZVV47rcIxDSHUTSU9AnfBt9rUJWe7AavX7YD5+f7jR008hcWaVbpPJK
	H+hqJCbS43G0NI9GoQB5X/fwh4hsiubYw9JMUKrrlNpbdOBcXL9OpxhP5IjnxuNDB5nLM7OWWAAvJ
	fta0yrsfaahIFkHLz5V9ePQ223ImFlepWYrVub8G/1XyZiWwGxnTeYaQ1ganAEDjoJRfKghKvYcq2
	bipx9OaGo9xDJPhMlvXtkeN4g2ZF/2oJyVbOYx0/yLP6i7hgK4D02XCEl1xFRobbYFSX/wEbxPYVB
	56185q5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uQ4-00000007eWa-00wU;
	Fri, 01 Nov 2024 16:22:40 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uKM-00000007dQl-2Ob2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:16:49 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e29205f6063so3740587276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 09:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730477804; x=1731082604; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hX5tyyhHqv16hXch1rLN0W0q9yFTn7ruBymiSqraZAY=;
        b=1AlwMMCJcyfWRpgAZHZHo9vAlJdL377IAdlqkEvg/Onf0aqnxCHisEHHM2G5gKKy2D
         TJG1t9jt98QIX/A9siUgrjwchlCi5NCy4eZKWJOfIrSjxZP4jmFwrhJE5eN3F2ujMIob
         o36lJwrN55Yd2/AwN7TeRKSTcczyHV3w2wJSrt/j96FSqE6ilLTtJvn02xUl4Erf95uM
         ryYs96AB7PrkMz3fTI/6ccm68oHBXAivcUAU/DsWYfymUBzJP6D6Q/32UCLYEBmXJrP8
         KtYD2uM9JsfNbKEbpJcfrvygZ+vROZ+iteVRcv/GKrdS/vIdAo4TiFfh8MS6V3Ys1SWq
         BADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730477804; x=1731082604;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hX5tyyhHqv16hXch1rLN0W0q9yFTn7ruBymiSqraZAY=;
        b=fAqEqPiQzmWCC8Y0Rn+NAiSnsBNjwczycdEBZ3k9fhwyWL+cvk/wWpJ7MTrHY5kgcQ
         G5aQQdo7kgqBgmS3rtDuYUXY95Ch+wKLHKhX5Y8Tgk8wzTw2CiRcQaKmN4mYu0CDdPQm
         SEDeFTiny5lzBmSfhLeGUOb77pthyOIYEvxzI2fUPoD2pyabk8k4co3sN6stzhe+dPTS
         z2qtIqY6EXBtqBMjvEDsnuvZ7Bkc4sdf/3riy9bELIpkrdF3Zviz8waz26cyu6fX5s3j
         WvrUtBx08aCw8JnrqSHkR/sCuSBndVptstvv+2W61bVGTUWiBUfzLV+mwq+5LLFf65Zj
         odTg==
X-Forwarded-Encrypted: i=1; AJvYcCVvU/w81CyQbIwo5aG4Y3zB0NbVqK/mO/gf9d2E8Ev6TOrCpdXhoAQwLuR6cYCngP2iqunLzX/IkdA2ZE3KbDlR@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2XfCE6dz3vY5FwWS25VFBSWhwBLC6R3xnrRd5d1Cy3TeMuROG
	29EloLXd12O0xTFvjp1tTBEDEub8hdB+jVK9G5RS8dVuGkvKQo2kKuoyzVM/1JiIkuwLvDpGB0T
	kJQ==
X-Google-Smtp-Source: AGHT+IFqadUfHcDo1fnNxpX1VCp4eu6teKzEJN9syL1uwq8yv7xcjwbZMF7JDB8DnbLfXveA32Uk5MCvzSo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:b2a5:0:b0:e30:dccd:9aaa with SMTP id
 3f1490d57ef6-e3302686a1fmr4471276.6.1730477804134; Fri, 01 Nov 2024 09:16:44
 -0700 (PDT)
Date: Fri, 1 Nov 2024 09:16:42 -0700
In-Reply-To: <ZyT9rSnLcDWkWoL_@linux.dev>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com> <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk> <ZyTpwwm0s89iU9Pk@google.com>
 <ZyT2CB6zodtbWEI9@linux.dev> <ZyT61FF0-g8gKZfc@google.com> <ZyT9rSnLcDWkWoL_@linux.dev>
Message-ID: <ZyT-6iCNlA1VSAV3@google.com>
Subject: Re: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, linux-next@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_091646_639784_6209FFAC 
X-CRM114-Status: GOOD (  16.21  )
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

On Fri, Nov 01, 2024, Oliver Upton wrote:
> On Fri, Nov 01, 2024 at 08:59:16AM -0700, Sean Christopherson wrote:
> > > Can you instead just push out a topic branch and let the affected
> > > maintainers deal with it? This is the usual way we handle conflicts
> > > between trees...
> > 
> > That'd work too, but as you note below, doing that now throws a wrench in things
> > because essentially all arch maintainers would need merge that topic branch,
> > otherwise linux-next would end up in the same state.
> 
> TBH, I'm quite happy with that. Recent history has not been particularly
> convinincing to me that folks are actually testing arm64, let alone
> compiling for it when applying selftests patches.

FWIW, I did compile all patches on all KVM architectures, including selftests.
But my base obviously didn't include the kvm-arm64 branch :-/

One thing I'll add to my workflow would be to do a local merge (and smoke test)
of linux-next into kvm-x86 next before pushing it out.  This isn't the only snafu
this cycle where such a sanity check would have saved me and others a bit of pain.

https://lore.kernel.org/all/20241101153857.GAZyT2EdLXKs7ZmDFx@fat_crate.local

