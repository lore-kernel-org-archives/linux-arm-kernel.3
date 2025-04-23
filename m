Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2C4C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3g25cudfdER1fultAc6guoG7d90Bj2J+6OCH21hX/70=; b=2TOg3Ig55yITCyCflmhC4Trqbl
	OmMon+3JcZIaKttITDf/dTxDPNj935XotMLbOQspYVauelB/Uy/ycRZKTULiQDNpqEoIDztjgyMhd
	SbJEcHdf8Df6rP3fwEIrYHZ6GyUgd/Atlnic3vtbfqnF4RoRmA13Nx4C3J/Dtb3ctzRGzbuFOAhjQ
	FTu15IXTrNzxMTT7gd10FOtM2HXevIvHiOzxEqW4vDS5wnDo74wMsi+EBZkR0HUSHU3K2x9ylzZ+Y
	MS+l+ReAc5VRgxOPHtbQOGDHZC53S9lMRUZKkIYvriHz73gGzixyGDBYgM73ykaXlF0xHAhH4P1JB
	Lpr1hQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fCk-0000000BeuH-3Ee8;
	Wed, 23 Apr 2025 18:52:18 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7eoP-0000000BZFq-3zYF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 18:27:11 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so1194079b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 11:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745432829; x=1746037629; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3g25cudfdER1fultAc6guoG7d90Bj2J+6OCH21hX/70=;
        b=m8Tc2tsOHnmtDHt+O+L8snn5hi7uaGjI3uOKecXo7Wd2djFpM2cL/00nBP4zYAkK1r
         QmmoYVjH+lJwitcptxLauy74Piv3vXmC/jdIBQbHsqCZUAHs9//lovfUnwUnKEMBwdQ/
         0csi1ecDYnPNuIp9deS7yoWiSbBGH10rrXXmA1Yf4ZsUHgyrQ3PlbriLcD8hqfhGr0AO
         og5WQjDcRGHgDWGqLvNVYVSSAF8mzX2AwkljU/41u4K0togUFoFdZH5NFk6axELFZbMz
         ghmqLeWEnQDCIaWXXQ2j3deen52pM0NmxMY0qSwVXMhmCZ30meC3IqKIr0q+jCGCnJvg
         M/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745432829; x=1746037629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3g25cudfdER1fultAc6guoG7d90Bj2J+6OCH21hX/70=;
        b=R6g6JfCD7LaRNP4DZR7N7vxS8YZpQ++qQkofzZ3xMOZ/V8XIvSNHTj+h9RvuWTufsK
         zLOnw/JiC7FxHKCVNucfCdJeGXmMyF4ZPRUft+ctvR2gpYUH7BhSZ9A8ZFLGng5T5FcK
         fkaKApSweCjdEiv+2N6Q/6+i9nLUOlIipOG9XKY0Ee2Nr86huTJAN7te+fsyvJmJj5d9
         WR2WlEZQ6yCRVQtWZ4VtVhres8k2TBkZBCA4nUinjX2sXOjXAWHKZ9tjEwwhkd7y4rDT
         VNz083oqFPnVDe8am5z3o1qb9cZ+dowiU/xL3ViBRPFuJP5S7Ch61UJ+A2gai8vlNN4i
         vhFg==
X-Forwarded-Encrypted: i=1; AJvYcCXOsN6UdFj/NL6ljsXlBC+LGbJLHlCH377zKvqo3Y53AGPLKCxgGSNCKRF2+IwNnF845MrisVdDKQwUjoH3qXFI@lists.infradead.org
X-Gm-Message-State: AOJu0Yz27Iwx6zZIbRZeuA5+JhNkIJVtgDey92wS7vFhkr7eLBaoSeqN
	rJL9N6Zt2N8ZrUdkAN9z/gxrMVtnNnkm23iTXE0hXSSI0+eX1gk+
X-Gm-Gg: ASbGncsmjOJXkYa8YWKMMqYMQppV4SNux8K7gP89A7rr3mBq4muYEPMQ6RTXM5nDPLu
	GbJhjpM6abBxuQHieozopcwdYAMHWojMhXtqpe3v9XUj0IUuc3aMcTRDZPpUb2ELVC8lUo7xFNQ
	SWKWY39ED1Yy2hhJsOVS9/KdBPmiX2rgqEYWTt3sGAUbuxZ89DNo89aQzlx1TtcHAEvp6gPSaO0
	RvnJuyipmNQVwHxRqDVNwsl+NrKOgRWBqFmMmxCiWSurdHFACygTlP2RCYmVZs3RfbnhbSVLhru
	/5ybH02+wYiiXdXsL7G3BCTAu+W31WpfhA6Fuf26gMCVK/gfLFA=
X-Google-Smtp-Source: AGHT+IGHyaRCja82Jp63ca6tDfY0vscU4gtWT0BCYYEH2SbVC6BGq3lUVFXS6KtlFAXf+XFDnn7bog==
X-Received: by 2002:a05:6a21:9105:b0:1f0:e2d0:fb65 with SMTP id adf61e73a8af0-20442d54a7fmr200581637.2.1745432828582;
        Wed, 23 Apr 2025 11:27:08 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa5d084sm11268524b3a.103.2025.04.23.11.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 11:27:07 -0700 (PDT)
Date: Wed, 23 Apr 2025 14:27:06 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Marc Zyngier <maz@kernel.org>, Luo Jie <quic_luoj@quicinc.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, andrew@lunn.ch, quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com
Subject: Re: [PATCH v3 4/6] arm64: nvhe: Convert the opencoded field modify
Message-ID: <aAkw-tFctkk3xyS8@yury>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <20250417-field_modify-v3-4-6f7992aafcb7@quicinc.com>
 <86r01rjald.wl-maz@kernel.org>
 <aAJsaNdznnz-1qap@yury>
 <aAkn8lvzoa1grdkt@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkn8lvzoa1grdkt@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_112709_998877_E7AD40B5 
X-CRM114-Status: GOOD (  26.46  )
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

On Wed, Apr 23, 2025 at 06:48:34PM +0100, Russell King (Oracle) wrote:
> On Fri, Apr 18, 2025 at 11:14:48AM -0400, Yury Norov wrote:
> > On Thu, Apr 17, 2025 at 12:23:10PM +0100, Marc Zyngier wrote:
> > > On Thu, 17 Apr 2025 11:47:11 +0100,
> > > Luo Jie <quic_luoj@quicinc.com> wrote:
> > > > 
> > > > Replaced below code with the wrapper FIELD_MODIFY(MASK, &reg, val)
> > > > - reg &= ~MASK;
> > > > - reg |= FIELD_PREP(MASK, val);
> > > > The semantic patch that makes this change is available
> > > > in scripts/coccinelle/misc/field_modify.cocci.
> > > > 
> > > > More information about semantic patching is available at
> > > > https://coccinelle.gitlabpages.inria.fr/website
> > > > 
> > > > Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> > > > ---
> > > >  arch/arm64/kvm/hyp/include/nvhe/memory.h | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > 
> > > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > > index 34233d586060..b2af748964d0 100644
> > > > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > > @@ -30,8 +30,7 @@ enum pkvm_page_state {
> > > >  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
> > > >  						 enum pkvm_page_state state)
> > > >  {
> > > > -	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> > > > -	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> > > > +	FIELD_MODIFY(PKVM_PAGE_STATE_PROT_MASK, &prot, state);
> > > >  	return prot;
> > > >  }
> > > 
> > > Following up on my suggestion to *not* add anything new, this patch
> > > could be written as:
> > > 
> > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > index 34233d5860607..08cb6ba0e0716 100644
> > > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > @@ -30,9 +30,8 @@ enum pkvm_page_state {
> > >  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
> > >  						 enum pkvm_page_state state)
> > >  {
> > > -	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> > > -	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> > > -	return prot;
> > > +	u64 p = prot;
> > > +	return u64_replace_bits(p, state, PKVM_PAGE_STATE_PROT_MASK);
> > >  }
> > 
> > This is a great example where u64_replace_bit() should NOT be used. 
> 
> Why not? Explain it. Don't leave people in the dark, because right
> now it looks like it's purely a religous fanaticism about what
> should and should not be used. Where's the technical reasoning?

Because enum is an integer, i.e. 32-bit type. Now, the snippet above
typecasts it to 64-bit fixed size type, passes to 64-bit fixed-type
function, and the returned value is typecasted back to 32-bit int.

Doesn't sound the most efficient solution, right? On 32-bit arch it
may double the function size, I guess.

But the most important is that if we adopt this practice and spread it
around, it will be really easy to overflow the 32-bit storage. The
compiler will keep silence about that.

Fixed types are very useful in their specific areas - cross-ABI data
transfer, etc. But mixing them with native types like int may hurt
badly. 

Hope that helps.

Thanks,
Yury

