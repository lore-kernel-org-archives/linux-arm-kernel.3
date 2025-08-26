Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85027CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHGyXOKrjm5oz81TLpvSpWDaUb0vSgaahBghiDLKLpk=; b=vftoIpKJHm7glMPf6an4GsXd39
	TG7W3emy15FriNg1Ra3lsfzFYK3vbeSA5Lht5pDno9pku+dxtFTk6+ktqw+8DHZwnCIIsop5aa7tH
	ZUP/swXoZBpL4VCLOk50BlwhBQPUlCpMT1Wt1zlNlIPSqorR78ld5d1XUHobmcucdqppYN4ZxMWB6
	hu7CYcW+a+yE5LOr5OFJsk9Aij7DnLxpTJbGRUWmHOAHYSh1RE/VwZjq8so6j3KXKIIVUHqkM+kx0
	QQM8fhw0ImlKWztjGX1AXwBoZkAduwknXkQKqWdFe/6TzRINpzyCp0LdayfcAzYiamDjyCVj/MjFp
	kCDec5HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquaQ-0000000CFXM-1aj4;
	Tue, 26 Aug 2025 14:23:46 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqu66-0000000C9a1-2Wew
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 13:52:28 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-24639fbdd87so31050435ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 06:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1756216346; x=1756821146; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lHGyXOKrjm5oz81TLpvSpWDaUb0vSgaahBghiDLKLpk=;
        b=SogrB0nrjcDxu7NuH+FLqk2Tn8MzkJNUIyKp1Ibl6B9Lk+ugjX/ffKV8VrrfkWOCjL
         3TRYVV7whJo7o/1bX9jXXl2uVwfe1Ae3cVgS2mAs+xr7XRYL5fYYoqn6RoBeiGuFSQXG
         dSJdFccK9rWonyZdQSYgfkR2h/jnubPU2gsOZv8apcz4V7RKf9nLaJprvLrKLg4odjLb
         zmw8ncwaDizgqjZL2TVmcUjiiq13Uf/Le2W1t7k/73Qn0lXsW6A7FeebuDgOGI5Y18vu
         4LNeAIEyz6avyXAM+1B77zUr7P7/ac9feEbvuoclVg2AqZqR9zzg71wNgjU/57EAw+oY
         Y03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756216346; x=1756821146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHGyXOKrjm5oz81TLpvSpWDaUb0vSgaahBghiDLKLpk=;
        b=tLAfWMUJSAaUeT94h2xbtFb085/0Xz5hwHiohcGIZllmOl6fcNCBn1/BV3r6+Oz4vH
         EDdVttm1OFpQJ7v0EcX0pnNlboK3EjKQ/o7XNClotfgPIEDSWctbHRd3I1kuF1OaxuHw
         pSHuMwWOJH5RCH8eyam7D048cr47OMJorWGtYBZ3V0PKoIU6bQOVrNh7F6gjpS+rSYkR
         9zsaWPTXUuEyy6zJXuM49oQt2ORbYSKxh1FNm4KFvKZiulaUWZiJzlvOikosIEhBCyWI
         PqKA4zYt1ZNbQXY0b0rCI/vgXLYDA/G+gBBvDhSXZCHShCQSgp0mTpXQ2K12yEYZsKPp
         wXGg==
X-Gm-Message-State: AOJu0YySouRRd2xQpdmx2aujn+mTskPB1qB9vuwi/1l/hlLQsoPmaHWg
	Wd3r3Wku8nKdyMwmkhNiWsqWkHAkmU2WP51mwGZ2YHNrbN3ufSclVqDcyNBFlwH+UAJDdzgbbWe
	j1ZIIChcOSZVKVJFDjVDMZUXRVzXUohke60FnH9gnz4IcOm8BWjt9OxtNon6xDD36kTpQ+g==
X-Gm-Gg: ASbGncv6WsF/8Z7oPaH9CsyZEquUl3x51psRIDd7/3O3MTi32xgpC2lk7lbaBQN00z2
	LJa5MU38EV86z5ZGAd8oG/+1orCzJwY2iCEaHIy6pifPozetvyJQrgSzNWfthbRSa0ygGJMrEsj
	WEovOjHNSmOLFhvC5Zqyr4RQBZzkWQcbnr0CcDyrOPxWEsT3X+trqmUZKxsINrD8Jp5iEMmFbdv
	8K0GTSkCYS9KtdEFatN6wUlMFKEuhcvjVrLpSRryMYCqBbXROBumvpr0BGRMWGtcxzEX+0ckU54
	xzWJCMNb4r8jeST1P7aoBSwtZDYzOFKANUCVVLvKMq4AY2CvdDJx+8ioEqSjPIQA8W6SPcEZBJR
	dk/pW/XZkTuhboRF+AHGeYK66lsd+ebYao86xRCRFc1RSEasuSlMw0Nd0d9MvFdhMaJeX
X-Google-Smtp-Source: AGHT+IGxhWDFYVYxqq2b3637yU3GvKWhKRYnWWKXaAejHtAF5wXzw4/2DHVTT2A4Zo0gjU/UoaN6ZA==
X-Received: by 2002:a17:903:238a:b0:245:f860:80b1 with SMTP id d9443c01a7336-248753a264dmr23720075ad.11.1756216345708;
        Tue, 26 Aug 2025 06:52:25 -0700 (PDT)
Received: from zenbook (1-162-83-231.dynamic-ip.hinet.net. [1.162.83.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24668889dbbsm96756765ad.132.2025.08.26.06.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:52:25 -0700 (PDT)
Date: Tue, 26 Aug 2025 21:55:11 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] KVM: arm64: nv: Allow shadow stage 2 read fault
Message-ID: <l4ge3jp2leuzxkpn7nowptl7hjzeiq6amqowibycdhuahgafnw@o3dcvj7njix5>
References: <20250822031853.2007437-1-r09922117@csie.ntu.edu.tw>
 <aKg3l23hheuQ1dJH@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKg3l23hheuQ1dJH@linux.dev>
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_065226_639696_1F07298E 
X-CRM114-Status: GOOD (  29.23  )
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

Hi Oliver,

On Fri, Aug 22, 2025 at 02:25:43AM -0700, Oliver Upton wrote:
> Hi Wei-Lin,
> 
> You've been finding some good stuff with nested, thank you :)
> 
> On Fri, Aug 22, 2025 at 11:18:53AM +0800, Wei-Lin Chang wrote:
> > I am able to trigger this error with a modified L1 KVM, but I do realize
> > this requires L1 to be very strange (or even just wrong) so I understand
> > if we don't want to handle this kind of edge case. On the other hand,
> > could there also be other ways to trigger this that I have not thought
> > of?
> 
> The architecture is pretty unambiguous here that the stage-2 can
> represent a translation w/o read permission.
> 
> > Another thing is that this change lets L1 get away with not flushing the
> > TLB, but TLBs are ephemeral so it's fine in this aspect, however I'm not
> > sure if there are other considerations.
> 
> FEAT_ETS3 is an interesting one since it provides software with ordering
> expectations around MMU faults (including permission faults) and updates
> to the translation tables. For KVM's shadow stage-2 to comply we need to
> re-walk the guest's stage-2 before injecting the fault at L1.

Thanks for telling me this, I haven't noticed ETS before, let me learn
about it.

> 
> > ---
> >  arch/arm64/kvm/mmu.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> > index 1c78864767c5c..41017ca579b19 100644
> > --- a/arch/arm64/kvm/mmu.c
> > +++ b/arch/arm64/kvm/mmu.c
> > @@ -1508,8 +1508,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
> >  	exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
> >  	VM_BUG_ON(write_fault && exec_fault);
> >  
> > -	if (fault_is_perm && !write_fault && !exec_fault) {
> > -		kvm_err("Unexpected L2 read permission error\n");
> > +	if (fault_is_perm && !write_fault && !exec_fault && !nested) {
> > +		kvm_err("Unexpected S2 read permission error\n");
> >  		return -EFAULT;
> >  	}
> 
> Hmm... I'm also willing to just delete this check altogether. The
> likelihood of KVM creating a stage-2 PTE w/o read permission is rather
> low.

Agreed, and this is in agreement with Marc, let me drop this in the next
version.

Thanks,
Wei-Lin Chang

> 
> Thanks,
> Oliver

