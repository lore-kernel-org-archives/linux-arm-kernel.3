Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0873E6F06D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyTpg0lhlDGimy0ZvEFKhDPpfFFUWK/X72leUPUldo0=; b=e51E5ou90WJeS1oD9fzwnIH+g/
	tF/TrrdlAiqSHekikLg1NvgNoYL4mwBxrpCuDL7NZ6HnlIEUATp+d+Lc+QT7/wLFi7v0C6msn08mq
	Tv+R+eDtHe+ppGkNNi2OUW33eWskJByIHxiTNGV//9osRRsLav/gugBAOsMjJxhpGqEqkbCTjrzf4
	DuuALHpgDHFPJ4GIjp5bptQhlc32VqVIofucpj3ANOd+PXrHJY7gUmUVTlXoOfGh8ZuZVmJ8hBJZV
	ug2hxpviuWHN5phAWmwdAVdzjwGlJ9F4eNkbLTQ1yTTXvYzdxE/78DNbVShox19ETPXHNXiCe6bHA
	bcpGD7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uJU-00000007dJR-41pb;
	Fri, 01 Nov 2024 16:15:53 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uFU-00000007cSL-3CLq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 16:11:47 +0000
Date: Fri, 1 Nov 2024 09:11:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730477501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tyTpg0lhlDGimy0ZvEFKhDPpfFFUWK/X72leUPUldo0=;
	b=t+7ZZb8QkkiZMjWQXqf/2w9UWEZZ80XpBkF5UWSotFyMMCpQvxO+Ol6L1m097f5XvORbXi
	K4+CWGnk3tCVvjVR5h+fGMU59MESJ99/eJkLZYySXFlBVyIvx6MCcONQ29QfpCQsZtEPzB
	PjqX2uKrHQb2zbKSykrFjXm9JtGxBbA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Jones <ajones@ventanamicro.com>,
	James Houghton <jthoughton@google.com>,
	David Woodhouse <dwmw@amazon.co.uk>, linux-next@vger.kernel.org
Subject: Re: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
Message-ID: <ZyT9rSnLcDWkWoL_@linux.dev>
References: <20241009154953.1073471-1-seanjc@google.com>
 <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk>
 <ZyTpwwm0s89iU9Pk@google.com>
 <ZyT2CB6zodtbWEI9@linux.dev>
 <ZyT61FF0-g8gKZfc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZyT61FF0-g8gKZfc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_091144_958644_C1D5AF0A 
X-CRM114-Status: GOOD (  19.59  )
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

On Fri, Nov 01, 2024 at 08:59:16AM -0700, Sean Christopherson wrote:
> > Can you instead just push out a topic branch and let the affected
> > maintainers deal with it? This is the usual way we handle conflicts
> > between trees...
> 
> That'd work too, but as you note below, doing that now throws a wrench in things
> because essentially all arch maintainers would need merge that topic branch,
> otherwise linux-next would end up in the same state.

TBH, I'm quite happy with that. Recent history has not been particularly
convinincing to me that folks are actually testing arm64, let alone
compiling for it when applying selftests patches.

Otherwise, the alternative of respinning the global change for every -next
breakage adds a decent amount of toil and gives the wrong impression of how
long our patches have actually been baking in -next.

> > > That would be a good oppurtunity to do the $(ARCH) directory switch[*] too, e.g.
> > > have a "selftests_late" or whatever topic branch.
> > 
> > The right time to do KVM-wide changes (even selftests) is *early* in the
> > development cycle, not last minute. It gives us plenty of time to iron out
> > the wrinkles.
> 
> Yeah, that was the original plan, then the stupid strict aliasing bug happened,
> and I honestly forgot the vcpu_get_reg() changes would need to be consumed by
> other architectures.
> 
> Other than letting me forget about this mess a few weeks earlier, there's no
> good reason to force this into 6.13.  So, I'll drop the series from 6.13, post
> new versions of the this and the $(ARCH) series just before the merge window,
> and then either send a pull request to Paolo for 6.14 as soon as the 6.13 merge
> window closes, or ask/bribe Paolo to apply everything directly.

Sounds good, punting to 6.14 seems reasonable.

-- 
Thanks,
Oliver

