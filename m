Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04E91C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 06:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rm0OfZ7AaG27+skvHa9GB/aO3szvxFuyhu1AGBEZrgc=; b=m7QTD4PlURy9d1ZAkOnBm88lfA
	f5OIXGZ9Nezzl6DSdquq9SQ9NtjQruUQhmwxaAqvOfwocMzMq/xEa6voe3S/jInLkii4KJ/4FsZFJ
	hiqHNskx3ezlMIMpkLlDEHipl1SzWD3eBXB5d0Otytj+JOR0MfLsqI1Uu+vUsSSrBcefUz4KWeNJf
	DculGM3Gcr7+JNYFK/6xSNqVObOpmkYCWaN1R60ZzpzYRrmSwTLAbVjMXLneJ9yLdWtgxrxu8dj1J
	zAl34QIITh7KyDqO7BODs+NZooKhZeQyHOHevN3oWJMm3oHDhalUxGP6wpzNE9JJEd2xIDcgvC/dF
	n/3gMbPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUfem-0000000AgX5-0Cha;
	Thu, 26 Jun 2025 06:00:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUfZa-0000000Afv2-1zO5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 05:55:00 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-23636167afeso6592565ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 22:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1750917295; x=1751522095; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rm0OfZ7AaG27+skvHa9GB/aO3szvxFuyhu1AGBEZrgc=;
        b=Zx9w2ZOW5DS8KaX+dymppI8Rl7BjeT8B0s/eblnmKi+GFqMepwcIKu0WREhkOsIh7P
         3WHK9nUhTOQaa7bTvBQ0ZHHnepT+3pqWuseZov37Ov175HHoWICjpG4jwbuiIgNRdxMx
         KQGC2p8zAWj+wOc4aI2P2BpDYArln7S1CYModoHlB3gDhaetsQkOlFKqWGzitoMuxs68
         tum95GHKF+64JzpxtTGjDawKFkFcHsgKMXg+Lhs72CmPEx5wOOKfG7hH+DnIlYJHgVl5
         Cfxxz7QrBUXnQ7q+0WveiKiUHgL7PHd4o+SAa/WJEF1qPVcj3A2xbrsxWI6+yDzgfPNP
         K7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750917295; x=1751522095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rm0OfZ7AaG27+skvHa9GB/aO3szvxFuyhu1AGBEZrgc=;
        b=tzcyEsxTejySbVAbvcUCnsIU8RFe7yvkJX3yIv41RDcmxLpNXxKbzBVVGfv+PxUMow
         ujqM9BMDGhadljgDJk38D3mm4vcySIFXyZ9rpuXMk5vRqcbJULm2xVWATPB2/w/OMExL
         pK/aCaHz7yljbPx6be0rhN1RC6ssaEjfSptZoK8ienmXC/U4lVXzT3chfdUhA/xH+sAz
         05e6vcTJNxscYE+kNKDpJrD/V1ktr3tcyj8k/ziw+Yi5wHfZqjQh3vTzrHelzW0EBI7n
         D9FQlk54KcehdKZKGggUYNpOMxATIKmpJRMpFHBn7eNr4gtkILW6LcS/15ZKWQ037MSE
         v+tQ==
X-Gm-Message-State: AOJu0YwvHEnkz+YdUN8XaNYKtc7i2xF/x3SxtPRljm1BZ0H0KAFi2Z0f
	LRJeKh8CY2QDizkOsMZocJe72V9cLjknJQHYojjS1NYLOe/1s7g477B+KBPV9oLLeUdWiY1mpDD
	Itf9rpPrqDWhjbO8fMisGCR++ieqz3AfEsqBZjoJOvwt0w3/AU9m64L+QW8dYkYFKyIqWiA==
X-Gm-Gg: ASbGnctDgM1KssRduxy9dBR7t+sxYSyXmFDxHpqYC5Kf0RCKEYGLzcqeTho406EZAkm
	edbpexCJtbsZEoa+JJpwLHLDHRkn1/IGyg3F9jwlyYwBvOIsCqg54zW1GxQAW2on85TKzNeK1YB
	iV+fzacjPR+zeiUZDieWv4gX+GEdpJcRi+4LSD/LfSyCPNjmmBlOX9X5iA3D926A3Ss2H71svKV
	t7TcpnjynpH9XXEdP2d7YuN63BtE1fZtZ+ibLoCVWnvRCR3raSPweezAVC7X9sPxxEPzGc11ion
	iidoi4sGRMxx8SmNE7prHJV7puVeaw4asmu//e7pBQ9Hi61Sm1Qj2eAiHjK1OimbF/iRulBruYS
	QDKNwSYPTk/xfSpTJ42QX2xQC
X-Google-Smtp-Source: AGHT+IErD6u0GnnyBjjoDbBvoZW5tms9xrqBq7DEY79r1vA3q8cM8NFq9ggAKD/BsmxJillbjalycg==
X-Received: by 2002:a17:903:41c1:b0:234:c8ec:51b5 with SMTP id d9443c01a7336-2382409b0eemr108270405ad.53.1750917294720;
        Wed, 25 Jun 2025 22:54:54 -0700 (PDT)
Received: from zenbook (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d87182c8sm152907285ad.232.2025.06.25.22.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 22:54:54 -0700 (PDT)
Date: Thu, 26 Jun 2025 13:57:17 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Jintack Lim <jintack@cs.columbia.edu>, 
	Christoffer Dall <christoffer.dall@arm.com>
Subject: Re: [PATCH] KVM: arm64: nv: Fix MI line level calculation in
 vgic_v3_nested_update_mi()
Message-ID: <w6yfzeynleghp7sxwscbrq6ko4244c5iphtqw6e4ar5dndqs3m@37jouplavkpw>
References: <20250625084709.3968844-1-r09922117@csie.ntu.edu.tw>
 <864iw3db3h.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864iw3db3h.wl-maz@kernel.org>
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_225458_788373_29232B47 
X-CRM114-Status: GOOD (  27.91  )
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

On Wed, Jun 25, 2025 at 05:45:06PM +0100, Marc Zyngier wrote:
> On Wed, 25 Jun 2025 09:47:09 +0100,
> Wei-Lin Chang <r09922117@csie.ntu.edu.tw> wrote:
> > 
> > The state of the vcpu's MI line should be asserted when its
> > ICH_HCR_EL2.En is set and ICH_MISR_EL2 is non-zero. Using bitwise AND
> > (&=) directly for this calculation will not give us the correct result
> > when the LSB of the vcpu's ICH_MISR_EL2 isn't set. Correct this by first
> > adjusting the return value of vgic_v3_get_misr() into 1 if it is
> > non-zero.
> > 
> > Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
> > ---
> >  arch/arm64/kvm/vgic/vgic-v3-nested.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > index 4f6954c30674..ebffad632fd2 100644
> > --- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > +++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> > @@ -400,7 +400,7 @@ void vgic_v3_nested_update_mi(struct kvm_vcpu *vcpu)
> >  
> >  	level  = __vcpu_sys_reg(vcpu, ICH_HCR_EL2) & ICH_HCR_EL2_En;
> >  	if (level)
> > -		level &= vgic_v3_get_misr(vcpu);
> > +		level &= !!vgic_v3_get_misr(vcpu);
> >  	kvm_vgic_inject_irq(vcpu->kvm, vcpu,
> >  			    vcpu->kvm->arch.vgic.mi_intid, level, vcpu);
> >  }
> 
> Very well spotted, once more. Where were you when I posted all these
> patches? ;-)

Thanks ;)

> 
> We could make it even clearer with this:
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> index a50fb7e6841f7..679aafe77de2e 100644
> --- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
> +++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> @@ -401,9 +401,7 @@ void vgic_v3_nested_update_mi(struct kvm_vcpu *vcpu)
>  {
>  	bool level;
>  
> -	level  = __vcpu_sys_reg(vcpu, ICH_HCR_EL2) & ICH_HCR_EL2_En;
> -	if (level)
> -		level &= vgic_v3_get_misr(vcpu);
> +	level = (__vcpu_sys_reg(vcpu, ICH_HCR_EL2) & ICH_HCR_EL2_En) && vgic_v3_get_misr(vcpu);
>  	kvm_vgic_inject_irq(vcpu->kvm, vcpu,
>  			    vcpu->kvm->arch.vgic.mi_intid, level, vcpu);
>  }
> 
> If you're OK with it, I'll use this, keeping your authorship of
> course.

Yes this is more straightforward, with this the commit message should be
rephrased too. I'm ok with keeping my authorship but really feel free to
adjust if you think some other credit is more appropriate.
I'm just glad that I'm able to help a little :)

Thanks,
Wei-Lin Chang

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

