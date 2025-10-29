Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0F1CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51XkTbr+6yxRjDoZdk3XOJ3OIVOjmWe3fG1xSTac55Y=; b=ytxx0saMNJGByIR+duV4FWeblB
	y/XFMoTNhxROdoHUsm493pwesRHexIpPZF+jzOCq3p7ffqJR4MAl5hrvE9s+LuRFEYOClWNOtFnGb
	2M8ynrUk/j2IFoZnVrhjsG4+B1CDZnWCXoeFfuB4uNz+tRRQRm0S/Hjf+++bLx1ZzD7NAeF8u6Mbp
	lp+bjb4p6QR4wNgvZKhpD6PflCZzCGosLajdie+Iy7dy8/0g0BdKxefiCNSS28DBFxkhA++X3vZtQ
	GPq8s6EgchT6ruPt+OEW9K06IToLVTh4VdXHsqDEyTAVbzx4L17zV+hhpoiZVOwcTt49nL+cBF/zk
	13M+xXfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Oy-00000000l5Q-1Bxj;
	Wed, 29 Oct 2025 10:27:36 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3Ov-00000000l3l-4BpQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 10:27:35 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-470ff2f6e56so55585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 03:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761733651; x=1762338451; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=51XkTbr+6yxRjDoZdk3XOJ3OIVOjmWe3fG1xSTac55Y=;
        b=z/uZYMgDeW+wLzwV4h915mZnEem/00oftXwrk+b3torFUPWRkcG5c6Z3HehdiEvh3I
         C3oxRQGJ7SKeRRTDDZ5ZYZPr3mZDuLPkf3U1THDB3uYY7gn3tOC2GPzJbFAMREIwTxBP
         8wYbOkFxvBIuft/SedgI2pOVurQnahYln/izzKU23dLhpAQc4qcBOqNFQKBFZ6I3UbyI
         S0/x6xF70R57M25VMUggA0sQ0IMZ49gozr2TK3587CvbwAe3l3e6rIHVLsqbKTnCmtT+
         WtukWwVePWdqKMGT5DR3tOKTqSstuxCIxRoG/07QGRLuMZmRi0rqmHkJsQnegHndGQd9
         OwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761733651; x=1762338451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51XkTbr+6yxRjDoZdk3XOJ3OIVOjmWe3fG1xSTac55Y=;
        b=gO/KE1+i1BFrj3J0XQUjvIIwbTRDhNECtYA86tE004Ja3kmr4IpqJEGvuCLxScn4XI
         54FXJGAzn1FqWv5sQ+BCC+Z/elfHoP1d/Nbz/t4uErC/dbBnb9oNEcXOu57HGocjpBUV
         /yB50tQ9c2XtYe8qU2P3tN6WbjpVsk5ljxKjuVW93Zy+a8jXnR1vjMIyKueF1i4+N0n1
         4ohFnbj7aH72x3R/Ez2C1xvqM2h6Sfc/ptC1MPt1GD2zDNu1o/14b+8+APBojlOsVqx7
         /RB/1taDsWP6jbWFqTqKwzjnLqZBC154MMSlG6s+3/3PpElN/0I6UEz5bgrPC8MwkXdQ
         LYFQ==
X-Forwarded-Encrypted: i=1; AJvYcCULWQppBTrUqUIRoj2agPTGRq4i0cta42w8MbsLlOJSp4wlZO4YXUb0yipzNLXxCYqcMFP1w1FTSrdSaTGV+t4i@lists.infradead.org
X-Gm-Message-State: AOJu0YyouogclYtBQBGSjQy+9dkyv5rU9oLECqzU791wTLIFJd59DS6U
	KiNSkt8vm9CwKaShgmQARHwwAAJrPw6kthd1s4Kq33+/IW3kJLJHc4XWhAebvPAGzA==
X-Gm-Gg: ASbGncsRZun2CKRMWE2leNkUJCqtKwFYDxKQsz91jk/j/MCT2DSKKzhUJCFEvgf/6il
	eK4kI6fvpBQqy3X9k5WHJjl6lCSDoG1hJ6obhSyWFV3ZPgdqM4LiCWJXfWHsE+QSQHGjlSHlivM
	HdOm9Aik1SiaTjkBWNPuHdcG3VbPcYXvGYMRcuMGejr0Ocj30oK+lUsOwhZV35rrSI/nHVB+oIO
	4nWFJSNma4Uv+1AnY9RI96pbNsiBR6aTmi6FuzgHfsDZ9z4xiFnmX68g2M8yM7ZBCMSw71rWgjW
	H52SWc+T4ZjjdcL2tVYOQ+nsQqAJf1/nscRzsyaMRRURFE5GiRXR6Lvr7BxOI8ZvE4fW6V0njT1
	wkDdVMuJ9x7ojL5nmtypG9u4oBUHFFVQ4MA/UWMCzyKCZ4gK13HhvbDXpqohgDZ/lNyX7c9zUse
	JhuF3m9cQ3hYZLH0d+vWPVmQd/wXKPyrMrw6sMTTobZ4N0cmP1WqtYben4aw==
X-Google-Smtp-Source: AGHT+IFpaQKCalYnjuLKmUHFSWvCchMH8++STvYUFO8XIcwGgMjADJ7NW+YIN5UXP+K6GoePivht9A==
X-Received: by 2002:a05:600c:245:b0:45f:2e6d:c9ee with SMTP id 5b1f17b1804b1-47721016cc6mr823485e9.6.1761733651168;
        Wed, 29 Oct 2025 03:27:31 -0700 (PDT)
Received: from google.com (177.112.205.35.bc.googleusercontent.com. [35.205.112.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7a94sm30414651f8f.5.2025.10.29.03.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 03:27:30 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:27:27 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org,
	catalin.marinas@arm.com, suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, joey.gouly@arm.com, ayrton@google.com,
	yuzenghui@huawei.com, qperret@google.com, kernel-team@android.com
Subject: Re: [PATCH] KVM: arm64: Check the untrusted offset in FF-A memory
 share
Message-ID: <aQHsD0MnZYSTDOf8@google.com>
References: <20251017075710.2605118-1-sebastianene@google.com>
 <aPj2hTXbGUseUqhE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPj2hTXbGUseUqhE@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_032734_063877_08AA6F67 
X-CRM114-Status: GOOD (  31.32  )
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

On Wed, Oct 22, 2025 at 04:21:41PM +0100, Vincent Donnefort wrote:
> On Fri, Oct 17, 2025 at 07:57:10AM +0000, Sebastian Ene wrote:
> > Verify the offset to prevent OOB access in the hypervisor
> 
> I believe that would be just a read, so probably it would be difficult to use
> this to compromise anything, except crashing the system?

The simplest way is to crash the system but a more advanced one might
lead to a confused deputy attack:

1. Use the original bug to trigger the overflow of the offset variable
which bypasses this check:
https://elixir.bootlin.com/linux/v6.18-rc2/source/arch/arm64/kvm/hyp/nvhe/ffa.c#L519

2. Use the host_share_hyp from the host to create a mapping in the hyp
address space so that : reg from reg = (void *)buf + offset; points to
memory mapped in the hyp address space & controlled from the host.

3. Make the __ffa_host_share_ranges fail (since we control the content of
the reg) to trigger the recovery mechanism for __ffa_host_unshare_ranges
(https://elixir.bootlin.com/linux/v6.18-rc2/source/arch/arm64/kvm/hyp/nvhe/ffa.c#L392)
and replace the content of the reg with pages that we want to remove the
host stage-2 FF-A annotation from.

With step(3) we can remove the host stage-2 FF-A annotation from pages
without having to invoke the FF-A reclaim mechanism. This allows a
confused deputy attack because the pages can be given to another entity
after the annotation is removed (eg. given to a protected VM).

> 
> > FF-A buffer in case an untrusted large enough value
> > [U32_MAX - sizeof(struct ffa_composite_mem_region) + 1, U32_MAX]
> > is set from the host kernel.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 4e16f9b96f63..58b7d0c477d7 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -479,7 +479,7 @@ static void __do_ffa_mem_xfer(const u64 func_id,
> >  	struct ffa_mem_region_attributes *ep_mem_access;
> >  	struct ffa_composite_mem_region *reg;
> >  	struct ffa_mem_region *buf;
> > -	u32 offset, nr_ranges;
> > +	u32 offset, nr_ranges, checked_offset;
> >  	int ret = 0;
> >  
> >  	if (addr_mbz || npages_mbz || fraglen > len ||
> > @@ -516,7 +516,12 @@ static void __do_ffa_mem_xfer(const u64 func_id,
> >  		goto out_unlock;
> >  	}
> >  
> > -	if (fraglen < offset + sizeof(struct ffa_composite_mem_region)) {
> > +	if (check_add_overflow(offset, sizeof(struct ffa_composite_mem_region), &checked_offset)) {
> > +		ret = FFA_RET_INVALID_PARAMETERS;
> > +		goto out_unlock;
> > +	}
> > +
> > +	if (fraglen < checked_offset) {
> >  		ret = FFA_RET_INVALID_PARAMETERS;
> >  		goto out_unlock;
> >  
> 
> Perhaps this could be easier to reason about by moving this check with the nr_ranges?

I found it a bit more clear to use the helper on the offset variable, I
would like to keep it in this way if you are ok with this.


> 
>         reg = (void *)buf + offset;
>         if ((void *)reg->constituents > (void *)buf + fraglen) {
>                 ret = FFA_RET_INVALID_PARAMETERS;
>                 goto out_unlock;
>         }
>  
>         nr_ranges = ((void *)buf + fraglen) - (void *)reg->constituents;
>         if (nr_ranges % sizeof(reg->constituents[0])) {
>                 ret = FFA_RET_INVALID_PARAMETERS;
> 

Thanks,
Sebastian

> }
> > -- 
> > 2.51.0.858.gf9c4a03a3a-goog
> > 

