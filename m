Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D572C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4TIb8/cGcT5YOO6jpwMUaKc5ramXtbgTdB6E61EUK4=; b=FvH0I2++l4rlSZVGIcxztDWZan
	SeDl2n1U088IB0Lpalethwkrx+pxIuv3bINxhMoOcWTBStkKTR9DqCZLMvO9Ec//0S5GC6g35HOFf
	2Hpw3Ga4MKCOnhncQeYoSXbAVbqNUrBMjzSF9GLDcSRoNPLadF/6PrbhaNXq96HDF0nGGxD+OCeJ6
	pMaJGGUYrn0q1RzUJuLuLDa38ZkkbPzRKSvFa3KSG1MIKBdWbrvAOhgt35+3Ho0kJUfunJCweHkM3
	FeBkAwISB33dSRf/xEf1ASyOt1aL+zg4/NKIZqy1SidZSYG9dWI9hYH4h3sxujxhzzFDwt+UNpfLQ
	fl0+9gGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fzh-0000000BoSg-2ZXQ;
	Wed, 23 Apr 2025 19:42:53 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fxh-0000000Bnm1-024r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 19:40:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-223fb0f619dso2428305ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 12:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745437248; x=1746042048; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F4TIb8/cGcT5YOO6jpwMUaKc5ramXtbgTdB6E61EUK4=;
        b=US6L2fv2hisvw+SdkvPF8P0uy3Y8PO05ml/VbULuhwRL3Uhty7XNqMSs51UXSkURlq
         fJPV+ZY2O6AkJcwCjupUXCBLHs8wHroBojJYor+vkRAPmPd5s2JV+8NaWNtf70yeNqG8
         BgN2zcp1Bx2JFKH0TtUHll8tbQyTo/aWq4SKjlX+6cInMhiLmuSiTzG+nyauyqLUVEuu
         7vkzTV7/fkU8LC0lQMnVrBe4Z0FfiyvLlTgNTnTnSwpUM/YKOBm6PfUCQAXUhwv+TTrb
         wc1msVupMVRchaDSONC20f4Y2fYJl5GPLFdRqyR+wQ9fyMiuIXdQljHw1eAyAF6ZZdJG
         Um2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745437248; x=1746042048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F4TIb8/cGcT5YOO6jpwMUaKc5ramXtbgTdB6E61EUK4=;
        b=TFXstkpZLr6zIkKUnP6dentChZKt3wgfLTyq3kM4kyTKIIFWiOUCHKQkhVtR8snmzA
         /9CbOfVSStCKYeA47FijG7Lyhfnq/GnQuWFw01+Gj0Io6bzBoSi0LQ6XGkHnLyHPgDNA
         efsLD5hjnZtif5aSIeMnbxpyNqk4OL/qrjI1AhC7Q9yyz4ZdKTTZzdg8Sog1TSjrd+L/
         EqE2N0VpOwMlPZlFXKgl1xbiXrA6KURDfxr6AkJOkC1S2zdX7VpGr9K5MMfBR/e7Jm5t
         shRuFzEl83QFEVLWGCboU0QhAQXp/gyuKikNtAWxQ73Dgi0Ijf94Jmt75zqnA8dKvXGe
         GKHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMrahOb+H5yRjGdzjwgAqTs4Sef3OuiIJW3LX7jlEFDw3xmoNpetcWOpu3xi8mcaAjk8yGKBWRSwuH3Mnpmgee@lists.infradead.org
X-Gm-Message-State: AOJu0YyS0MIEqcAEpQx91+e4lqFl12WsqlOEr4jG73rthwqjEr07gaTI
	aMzcPAPDZun0jxNxcmn6IVtfguxUnG0r+dbuArfO0HzqjUqtPs6T
X-Gm-Gg: ASbGncu8+rftAfKUlSOPYq/UB83ViTceMSi1jqILFTC1yIOWkXSKB+LseLCYEHDU/G6
	XZEar/+T5c9i8mg5yIJ7i6rnN+OiIgAaYsDCGNFiDiolf1bBEbf3bWENiHuzJwgAF7N2sJRfvmq
	hJcEwHCpxj/L+iPcj9NP7y1sQZTUPYWsOMbB582gNoHofwJrzsoBVJFtsm8CRSEPf0YeOHDEbT+
	bO0tRpWTlwek35p1M8DCAFzPABElgOlgT3CimX8BCw253qs7viOKNOM3c4oEuO2pvXUM6M/lJ8Q
	mxIBG6dIyXdCFa3b1o1yCyDP6yenwJ53Wbas1XKV
X-Google-Smtp-Source: AGHT+IGJTj4t3YyBeTpu99dqNzdz4h1Gumsi9bbZoo/nwDcyxygthxC2epv2+Ql+pGJESwDyMuUhMw==
X-Received: by 2002:a17:902:d492:b0:224:1af1:87f4 with SMTP id d9443c01a7336-22db1aa28a4mr9176975ad.22.1745437248148;
        Wed, 23 Apr 2025 12:40:48 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fe0976sm108905785ad.245.2025.04.23.12.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 12:40:47 -0700 (PDT)
Date: Wed, 23 Apr 2025 15:40:45 -0400
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
Message-ID: <aAlCPZQtFjr4F-re@yury>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <20250417-field_modify-v3-4-6f7992aafcb7@quicinc.com>
 <86r01rjald.wl-maz@kernel.org>
 <aAJsaNdznnz-1qap@yury>
 <aAkn8lvzoa1grdkt@shell.armlinux.org.uk>
 <aAkw-tFctkk3xyS8@yury>
 <aAk7VqNOLujcyZS0@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAk7VqNOLujcyZS0@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_124049_057021_3CE5F38D 
X-CRM114-Status: GOOD (  43.94  )
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

On Wed, Apr 23, 2025 at 08:11:18PM +0100, Russell King (Oracle) wrote:
> On Wed, Apr 23, 2025 at 02:27:06PM -0400, Yury Norov wrote:
> > On Wed, Apr 23, 2025 at 06:48:34PM +0100, Russell King (Oracle) wrote:
> > > On Fri, Apr 18, 2025 at 11:14:48AM -0400, Yury Norov wrote:
> > > > On Thu, Apr 17, 2025 at 12:23:10PM +0100, Marc Zyngier wrote:
> > > > > On Thu, 17 Apr 2025 11:47:11 +0100,
> > > > > Luo Jie <quic_luoj@quicinc.com> wrote:
> > > > > > 
> > > > > > Replaced below code with the wrapper FIELD_MODIFY(MASK, &reg, val)
> > > > > > - reg &= ~MASK;
> > > > > > - reg |= FIELD_PREP(MASK, val);
> > > > > > The semantic patch that makes this change is available
> > > > > > in scripts/coccinelle/misc/field_modify.cocci.
> > > > > > 
> > > > > > More information about semantic patching is available at
> > > > > > https://coccinelle.gitlabpages.inria.fr/website
> > > > > > 
> > > > > > Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> > > > > > ---
> > > > > >  arch/arm64/kvm/hyp/include/nvhe/memory.h | 3 +--
> > > > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > > > > index 34233d586060..b2af748964d0 100644
> > > > > > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > > > > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > > > > @@ -30,8 +30,7 @@ enum pkvm_page_state {
> > > > > >  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
> > > > > >  						 enum pkvm_page_state state)
> > > > > >  {
> > > > > > -	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> > > > > > -	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> > > > > > +	FIELD_MODIFY(PKVM_PAGE_STATE_PROT_MASK, &prot, state);
> > > > > >  	return prot;
> > > > > >  }
> > > > > 
> > > > > Following up on my suggestion to *not* add anything new, this patch
> > > > > could be written as:
> > > > > 
> > > > > diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > > > index 34233d5860607..08cb6ba0e0716 100644
> > > > > --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > > > +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> > > > > @@ -30,9 +30,8 @@ enum pkvm_page_state {
> > > > >  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
> > > > >  						 enum pkvm_page_state state)
> > > > >  {
> > > > > -	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
> > > > > -	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
> > > > > -	return prot;
> > > > > +	u64 p = prot;
> > > > > +	return u64_replace_bits(p, state, PKVM_PAGE_STATE_PROT_MASK);
> > > > >  }
> > > > 
> > > > This is a great example where u64_replace_bit() should NOT be used. 
> > > 
> > > Why not? Explain it. Don't leave people in the dark, because right
> > > now it looks like it's purely a religous fanaticism about what
> > > should and should not be used. Where's the technical reasoning?
> > 
> > Because enum is an integer, i.e. 32-bit type.
> 
> This statement is false, in this case.
> 
> The kernel currently uses -std=gnu11, and GNU tends to be more relaxed
> about things, and while the C standard may say that enums are ints,
> that isn't the case - gcc appears to follow C++ and allow enums that
> are wider than ints.
> 
> $ aarch64-linux-gnu-gcc -S -o - -std=gnu99 -x c -
> enum foo {
> A = 1L << 0,
> B = 1L << 53,
> };
> int main()
> { return sizeof(enum foo); }
> 
> Gives the following code:
> 
> main:
> .LFB0:
>         .cfi_startproc
>         mov     w0, 8
>         ret
>         .cfi_endproc
> 
> meaning that sizeof(enum foo) is 8 or 64-bit.
> 
> If B were 1L << 31, then sizeof(enum foo) is 4.
> 
> > Now, the snippet above
> > typecasts it to 64-bit fixed size type, passes to 64-bit fixed-type
> > function, and the returned value is typecasted back to 32-bit int.
> 
> In this case, the enum is defined using:
> 
>         KVM_PGTABLE_PROT_X                      = BIT(0),
>         KVM_PGTABLE_PROT_W                      = BIT(1),
>         KVM_PGTABLE_PROT_R                      = BIT(2),
> 
>         KVM_PGTABLE_PROT_DEVICE                 = BIT(3),
>         KVM_PGTABLE_PROT_NORMAL_NC              = BIT(4),
> 
>         KVM_PGTABLE_PROT_SW0                    = BIT(55),
>         KVM_PGTABLE_PROT_SW1                    = BIT(56),
>         KVM_PGTABLE_PROT_SW2                    = BIT(57),
>         KVM_PGTABLE_PROT_SW3                    = BIT(58),
> 
> As it contains bits beyond bit 31, and we use -std=gnu11 when building
> the kernel, this enum is represented using a 64-bit integer type. So,
> the casting to a u64 is not increasing the size of the enum, and the
> return value is not getting truncated down to 32-bits.
> 
> > Doesn't sound the most efficient solution, right? On 32-bit arch it
> > may double the function size, I guess.
> 
> Given that there's no inefficiency here, and that this is arm64 code
> which is a 64-bit arch, both those points you mention seem to be
> incorrect or not relevant.
> 
> > But the most important is that if we adopt this practice and spread it
> > around, it will be really easy to overflow the 32-bit storage. The
> > compiler will keep silence about that.
> 
> Given that in Marc's suggestion, "prot" is a 64-bit value, it's being
> assigned to a u64, which is then being operated on by the u64 variant
> of _replace_bits(), which returns the u64 result, which then gets
> returned as a 64-bit enum, there is no issue here as far as I can see.

Ah, OK. You're right. On the other hand, enum is a bad specifier here,
because this thing is not an enumeration. It's clearly a bit structure
that reflects attributes in the page table record.

This enum confused me (and probably others), and could better be an
u64. And because this is really the 64-bit storage that tightly coupled
to MMU layout, it should be a fixed-type, and should be handled with
u64_xx_bits() functions.

If it was a true enumeration, something like dma_data_direction or
ucount_type, or if it was a true native type like long, using this
u64_xx_bits() is not optimal.

