Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D0BCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 10:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOcR2ywmAIsHfMOA6/DbnreILk4QaSYQyzKUA6hoOMk=; b=ZnbvSInpyLoErMFvn0pfO++fk9
	pLE+gxCI4Ftt29eNxjkdsoctSw79inYScByvybdWIf3M9nd54T50Gp3Q5OprQG6NF0SboFkQvWc1Z
	svNhJtSpUwaajjwmVHOFkhyTK+8VCsZZEQ02wlcqO6ACog5kKZYl3kq14EFKP5B0RHk5fMZUoXcnm
	vY6yQS8JN0e5/FB7wljkbMgKbuKTvdgq3yJ/u99wwweYvesrAspihZkuv82cqOc9WoQtTRP6UhgTG
	3VoQZE/2JJM7aCE6M+gkTkHNkVECmtODrNADOganrE6alCOybK/h4c314w5U9nSz4JrdrzZalykcd
	KnreUw4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0fN-00000007TQy-2J5L;
	Thu, 21 May 2026 10:30:13 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0fL-00000007TQ4-0RXh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 10:30:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so4695e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 03:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779359408; x=1779964208; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOcR2ywmAIsHfMOA6/DbnreILk4QaSYQyzKUA6hoOMk=;
        b=uOiZgCYFT8+cCutnzW46Pa95UWQtu2XjNiuWmEF0nv5BfeuUaBdamFt0XooYORQWqw
         ANmG5ExmZuz99sVxxQU0dczh4kXNJ4YY6iEoTPPnjq4kuSuSel08HSVRd+2jsWR+2vsa
         aPvyrOuTXCGSk9ECfPKI47qYjNQBIveTLXA//bj/E+YMuJ7/1q4EJmA20azGkno9ibqQ
         GpTRfLU+Z9GbFalcEl15Jvjs2hXAHoSXKI2TWvOODAFwXONy5HjvHyD4tuHFvg14a+1e
         iMgSvhXATsWIGFaDyCv9rg85cohtFb1cS5iwDcm4+V1ezRGBOtVTvyGYT96gvvgMhf7Z
         qjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779359408; x=1779964208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOcR2ywmAIsHfMOA6/DbnreILk4QaSYQyzKUA6hoOMk=;
        b=oOkD6ozQfLTsns5+APT6JlTi2UmCm9DHyf0WmcpN+jla9bqyjPCXXLcoPhzLn6rkvB
         S9eFqebJAAX3qZCq8SKHdfJ6qEdrjFcz3dvjIGYWx8SX9QjbFDbOblFJPxwi4IIOOV4l
         0i5lxeO7kAkk5gMiJ/5XsPkHyyV96qECQe9gMypkp6mP6Jt/E6+P+op79aXh2nO7t5Gb
         +UJjwvhz2WV8QyJ0Er4LgAZWSSA3LPSsz18mc4tEA+DrlF9keZs8b3yH8ZgbrvhqcBll
         janr7PM33Bj1HS6fUjKf6BkSoHlCMdHLYFf4sIsPkIqi8ZMuzx3JA5zKFyBphKSz0PNM
         Cn3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/wMUYk9izBB6Dah3VkEYMw0mHk2fgBTtONDS6Vn30CSP4Va80SS18Aup0QtZesOpcXfmJSZLTrpCR69oM2VhfB@lists.infradead.org
X-Gm-Message-State: AOJu0YyPGMaHr+ecxEBj/KQgaCCSX6eAhJKk7fVm7bLasZ054HU5CSES
	cRZYq+x/nDGWOR/cdGZr7rwVie5G8h6z/KVK22tOFDWDbj1asCVX+qn0U5Pns4g2HA==
X-Gm-Gg: Acq92OFFDSqh1GoGUUl6mo25r+QsuRc3ctR28OnvKN26OAxVjqpYG7EeaplsHz2tceL
	i2Neoieu1ibglX0Kx9RxBir1e2hh7wYgVpOdo2ZxD4R6hmFx4Y6kIXcJdfhsKBQiMydPcBnMvIa
	YjMWSJ4TBM1UIWeZecI3Xq5vGlpd0FwOOBYAqF1ZzYHRnJtO0dfF+iSXA2xF+82q8FKoNHsbWwT
	cf6GPhO1aUQ5l4pZ1W0o19DSl+ZWF69TTOzlB08PwnOeMUKb4igchabtYh8X39iMLSjJRGfUp00
	ZhHuPUVk2TwzSWDLrVc9Q8Vmm5bYJv7l8k5c4Sr31RKKbiDidNpp3pcamw4cOAqXJo0F/haEsEE
	UxsemlQmarsJw7XVeq7xAdUVqJcUYhGO7OMr6DcbI3ka15Zd/CoB7uzdu7y/DoYUCDJNib9/rqL
	M7lqsXcUGerVNh5+aPREAPlPDUy8hhmfevPZ5H4rGg3o5fcuke1BncfAGXxdeHNE4vK06ToM/HT
	HQ=
X-Received: by 2002:a05:600c:1551:b0:489:1f6a:4ac0 with SMTP id 5b1f17b1804b1-49035c64bccmr990775e9.0.1779359407929;
        Thu, 21 May 2026 03:30:07 -0700 (PDT)
Received: from google.com (136.41.155.104.bc.googleusercontent.com. [104.155.41.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7cf23bsm1764718f8f.5.2026.05.21.03.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 03:30:07 -0700 (PDT)
Date: Thu, 21 May 2026 10:30:03 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	catalin.marinas@arm.com, jens.wiklander@linaro.org,
	sumit.garg@kernel.org, sebastianene@google.com,
	vdonnefort@google.com, sudeep.holla@kernel.org
Subject: Re: [PATCH v4 4/5] KVM: arm64: Fix bounds checking in
 do_ffa_mem_reclaim()
Message-ID: <ag7eq3bfBOxfaZ59@google.com>
References: <20260520204948.2440882-1-smostafa@google.com>
 <20260520204948.2440882-5-smostafa@google.com>
 <86ldddw4ht.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ldddw4ht.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_033011_168391_660B01A3 
X-CRM114-Status: GOOD (  28.32  )
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

Hi Marc,

On Thu, May 21, 2026 at 09:28:46AM +0100, Marc Zyngier wrote:
> On Wed, 20 May 2026 21:49:47 +0100,
> Mostafa Saleh <smostafa@google.com> wrote:
> > 
> > Sashiko (locally) reports out of bound write possiblity if SPMD
> > returns an invalid data.
> > 
> > While SPMD is considered trusted, pKVM does some basic checks,
> > for offset to be less than or equal len.
> > 
> > However, that is incorrect as even if the offset is smaller than
> > len pKVM can still access out of bound memory in the next
> > ffa_host_unshare_ranges().
> > 
> > Split this check into 2:
> > 1- Check that the fixed portion of the descriptor fits.
> > 2- After getting reg, check the variable array size addr_range_cnt
> >    fits.
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 1af722771178..e6aa2bfa63b1 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -607,7 +607,7 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
> >  	 * check that we end up with something that doesn't look _completely_
> >  	 * bogus.
> >  	 */
> > -	if (WARN_ON(offset > len ||
> > +	if (WARN_ON(offset + CONSTITUENTS_OFFSET(0) > len ||
> >  		    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)) {
> 
> Do you really want to keep this a WARN_ON(), given that this results
> in a panic in most pKVM configurations?

Which kind of configuration will that check fail on?
Does that mean at the moment pKVM does out-of-bound access for
the header?

Thanks,
Mostafa

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

