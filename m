Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94412C87FCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 01:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XK/gYnhz8WxypxaXzlzjFNaBe5jgICo9avyYr9Xjlc8=; b=kRq51hoYMEtV8/H7aqvgXbIkVR
	gnMIJB0jDaKaMBNKNMCLZ4BKuh3YkgsdysNuESqK5/591W9Fa27n4NRlhJGiRsVPNJIR0Zjzxq0Tt
	mEH343cS6Vu4SsXjntpoN98D3Z9ILhQq0HXph/DGMc5fVFx+MhC2ReMmrKz1wts0mEVIVthhAdOk2
	KQPquOi9czZx7fjv+Hwk+QxP2DKm/kI4qcZqLbZ2t+lNXKeOxLARop0/ACAL0hF7ayme3l70lSpAf
	nuFy8iwM5XMN0x64Iy9afDREbMuEP1HpOiupQSc5sqfDiCd4f+yH7hRpgxGvGOt2Pju49n1h73CFR
	BPcFnEwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf78v-00000008orP-3Ym6;
	Fri, 25 Jul 2025 01:22:37 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf76P-00000008oTv-1QNv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 01:20:02 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-87653e3adc6so60906739f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 18:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753406400; x=1754011200; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XK/gYnhz8WxypxaXzlzjFNaBe5jgICo9avyYr9Xjlc8=;
        b=Zu9J1cZP4eqKwDBew40FQwoPL0G/gIUHYSaThh2m1yH7vytA6oQi1y+7HFGcqnWvz/
         4EeUNX2bwZM3KYS87+FF9CsvqpRl0Yr27rHm68XI/yqQwCnZtzSgl6Zck0GbA7sOZmGP
         Ty6oqfs1K6m07Xdl89j61AWwnQnDEb12ZUP0XXQiVKwZ6X8wm7cB6Bt7IjzeuMLPPZvM
         5bIPJRBz/bROuTsZNMk01qYTTzvi0DSJkR83ESbMG6+xWOVEmmAvL/zOXz7epZImvquf
         li/6oQFgciCm49TBU8XhPHLPru+iV8tO6E+EDtHM1gh+BaPl8sDxDLYIOYWAJwOCUjNx
         STRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753406400; x=1754011200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XK/gYnhz8WxypxaXzlzjFNaBe5jgICo9avyYr9Xjlc8=;
        b=BZJQ9HfxYT0d9Z/sBL13SKpDZRFPpsfZ5DzoizNDnMkxejsSEeuIzW8cNKoTPoL+b7
         8pCC1Mn561W7uhexZsvgDoXrnV6qFZ3U0+kx5yh9mp+w22KgILeJmmPCr4BHANXX5+uy
         NxVPoz5IZ5HqAo/G2ig+NvHMCheoRRVrHklPP4kWgDdQEBOuM3gqrIoKvovhHfFIGlj/
         67T1bTTfpHZrk7FEs3cOasqIeO7zeMiI+qafkwRgpnN5TWT2o/YvbHucnFdrxhIExN/j
         AJn0TBpbKep3VcdLjyUd5C6SEP+NsgsFB+78lG0vUbRDOgjFZhCUKHO8WayBgph0oE3h
         yG9Q==
X-Gm-Message-State: AOJu0Yy/DtbSlz4r3S+96eadaNfANtHF3+wVSuB1L97/FDpmTXGkfg3i
	dKrWE3wePQkaaowM/cHwlHTWLsCk6uDcHoqCBkDxGoNwVLj4/mEYc/bjdT+coAe42g==
X-Gm-Gg: ASbGnctTa/jiiDB6KQ+jK/KgnXhcOECtLaJhqjih/Te47yleBBUr2W0VTeiDMLt2khk
	z3FsrTQDVr4daWvtpyNG9SUDO02NNROhNsz+apy1EjaqiGKEZc3yzBGVAtDcFiuCSlr4QgL47ue
	AIqCY9bvoB0OeU6tn7HCsdU9UG0IpSaK6TzvJUAnSuhUcSB/KnSiJ4wRvKuoQVyX/NiUKaRpN0k
	Eg98iFUBzOtHLtK9CEphlE18colmHiBbGvYjUUDSuim2ITwiq1ZSX/uX6S1NFM5fruX92Dk/ytj
	CePM4crTW3/CHS75YLNLG806w9m1I1MJG4Lc5F4gZwTtf1+mhwmSZxw1j+sItSyBw2Ayh883rVF
	TYd9xb50uoXWMrCkRTLT0Fs+NL0bDhQ8MpsQC+7OrzHpeRnVDzvwKYLEy+91avRYhXKc=
X-Google-Smtp-Source: AGHT+IEmFccKRhDDkZ+Zb03HqYIMkjVZNy7vREse+9ncUz0sanXGTB21Co/1U2q+QuC2Ff0zX/sN0g==
X-Received: by 2002:a05:6602:2cd5:b0:873:de29:612f with SMTP id ca18e2360f4ac-87c64f89e6cmr1623090439f.3.1753406399396;
        Thu, 24 Jul 2025 18:19:59 -0700 (PDT)
Received: from google.com (39.173.198.104.bc.googleusercontent.com. [104.198.173.39])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-87e201992fasm28737439f.28.2025.07.24.18.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 18:19:58 -0700 (PDT)
Date: Thu, 24 Jul 2025 18:19:53 -0700
From: Justin Stitt <justinstitt@google.com>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org
Subject: Re: [PATCH 6.1.y] KVM: arm64: silence -Wuninitialized-const-pointer
 warning
Message-ID: <xcwmzitmc5igc3eplgr2uwviitdfmtdknth4a5zpaldamw7png@o22wb4ze3czd>
References: <20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_182001_387955_D254B888 
X-CRM114-Status: GOOD (  19.55  )
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

On Thu, Jul 24, 2025 at 06:15:28PM -0700, Justin Stitt wrote:
> A new warning in Clang 22 [1] complains that @clidr passed to
> get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> doesn't really care since it casts away the const-ness anyways.
> 
> Silence the warning by initializing the struct.

For posterity's sake, here's the warning message which I meant to
include in the patch:

../arch/arm64/kvm/sys_regs.c:2978:23: warning: variable 'clidr' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
 2978 |         get_clidr_el1(NULL, &clidr); /* Ugly... */

> 
> This patch won't apply to anything past v6.1 as this code section was
> reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache configuration").
> 
> Cc: stable@vger.kernel.org
> Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
> Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  arch/arm64/kvm/sys_regs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index f4a7c5abcbca..d7ebd7387221 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2948,7 +2948,7 @@ int kvm_sys_reg_table_init(void)
>  {
>  	bool valid = true;
>  	unsigned int i;
> -	struct sys_reg_desc clidr;
> +	struct sys_reg_desc clidr = {0};
>  
>  	/* Make sure tables are unique and in order. */
>  	valid &= check_sysreg_table(sys_reg_descs, ARRAY_SIZE(sys_reg_descs), false);
> 
> ---
> base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
> change-id: 20250724-b4-clidr-unint-const-ptr-7edb960bc3bd
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 

