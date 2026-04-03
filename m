Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39C9E88D73
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 23:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdgYiNCpCVITKt4WdfY63SIPUYiDMIfHM1afvBz0ai8=; b=g8MwBNMkIQX1RpqGYHTDO46M0T
	M/n+gYOd8aVRsmFnhyjdWBPakNXg58xgqfQ9KynaVcDUWuwQyc3AW4mSePF8W/VjWYN0V445HjYJ1
	R1QbxXnARnB94P8vkRN49pISslWNyE+pnPq2E58URuqxM8HfQ/3Hfd7t86BB4/1g0dgQmh+7FmaZt
	SFSGJIR0oQgo+TlM/NDwJeMrLzQPC0mSvZX3iCp5UL/gojYTIUVbDhVlaDNHlHc70/ywWv/tcitZ4
	wlWkJAwPPc9nnQGnyQAy00ZsqntlMks2iwUvVK5yzYRcYqJ32sl1JXWak+PNe2YMKTupFkl804/Ke
	HS9GqDtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ngZ-00000002iS5-04wF;
	Fri, 03 Apr 2026 23:12:19 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ngW-00000002iRF-3TPf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 23:12:17 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82ce1c395ccso3632167b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 16:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775257935; x=1775862735; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qdgYiNCpCVITKt4WdfY63SIPUYiDMIfHM1afvBz0ai8=;
        b=Q43SF2jTYFnmbALfIiw1+Tl/g5ggoL8TyGgqYV5w/muG/y3GzsY7lhMYSYddCnOsAA
         0fFHlTMJ7Sj2622mcM7D3S8mv4p0aT3cX1pmBjbTvG7WKf0v1342oqbL/P6XFJ3dnCMu
         l/UnZSdzT+YVlYLazICJKfI1bJX1TUk9+rSlgKXuPzqhF8301PSV0442ynQZQZnyCBcD
         HRrlPPUYccNSIwRUpHO6JWusBTUVCdlD0zCwjLXQcaz20P0K7PfjHcqY1jx+iXJwi+qF
         go+j1zcjIqCYPo1KA8HlbSpOijMZDyWQ5OJAdErqBkDUV198zMkzlkRbZmqjuhdyYF71
         IU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775257935; x=1775862735;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdgYiNCpCVITKt4WdfY63SIPUYiDMIfHM1afvBz0ai8=;
        b=esxJBEG2mEuxOmyruI9c4Olw2NYYjqmkgOWpdaWYqY5ntBiCp+qcSmAZSFX4cUUb6+
         GYeF65v3Ta0/42bf01VzNVCvaCWajBBdFqCKWuutDvzwc5J+YZSpT2Ef+1JtoriocHaP
         7nfDqd1T+BYFsH2fFM6T4PkjwY3PwbT0uMqDzGmixwuoec7Jmj5ZAQbaL+8Oih8tYtsE
         iKk/CIJ8xHHmfBNDqkuY6g67W1czUXxhCP1y0UJSYPvXhFL8PPriWZeOqXxdldiXTNuT
         FkgdNospYrGIDrs1IPzJ7eYfpu5aa+dEXT+MWrC5jd17dZsq+luegLqToN30XGlMlLQj
         m3Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXF9GAzMUT1Yzvj0tQ2NlRlBqs+mMloJvTCJO09CKuMosuL8/qHbr60v3yxo4B8j2qBNOlI90oBzveCwKUApIZk@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgn9tEdkWaOIJyHpeH/7C1naKI5Q3k2nqimAOjJq+eMObwBULn
	DdmC4B3OxC5ZirU6DB0nvY9IM8LUldU13GUkgaYMkhttN0Dq97RtwgLSfjGAoyehxOT9uSr6ghK
	o46h3Mg==
X-Received: from pfmu23.prod.google.com ([2002:aa7:8397:0:b0:829:7ce4:7fcc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:ac82:b0:82c:daa4:ce2b
 with SMTP id d2e1a72fcca58-82d0dbcfa01mr4616677b3a.49.1775257934902; Fri, 03
 Apr 2026 16:12:14 -0700 (PDT)
Date: Fri, 3 Apr 2026 16:12:13 -0700
In-Reply-To: <66e78b59-f96c-4277-b7d7-473b68ed413f@linux.alibaba.com>
Mime-Version: 1.0
References: <cover.1773890510.git.baolin.wang@linux.alibaba.com>
 <545847c132da5d957cfc74ab19e849b16127aa8f.1773890510.git.baolin.wang@linux.alibaba.com>
 <67c670e2-c98f-490b-bbb9-2960f8175b5a@lucifer.local> <66e78b59-f96c-4277-b7d7-473b68ed413f@linux.alibaba.com>
Message-ID: <adBJTXeE6G2vQNKX@google.com>
Subject: Re: [PATCH 6/6] mm: change to return bool for the MMU notifier's
 young flag check
From: Sean Christopherson <seanjc@google.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, akpm@linux-foundation.org, david@kernel.org, 
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, open <linux-mm@kvack.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_161216_867357_CFEDBA19 
X-CRM114-Status: GOOD (  10.05  )
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

On Fri, Mar 20, 2026, Baolin Wang wrote:
> > > -static __always_inline int kvm_age_hva_range(struct mmu_notifier *mn,
> > > -						unsigned long start,
> > > -						unsigned long end,
> > > -						gfn_handler_t handler,
> > > -						bool flush_on_ret)
> > > +static __always_inline bool kvm_age_hva_range(struct mmu_notifier *mn,
> > > +					      unsigned long start,
> > > +					      unsigned long end,
> > > +					      gfn_handler_t handler,
> > > +					      bool flush_on_ret)
> > 
> > Can we please fix this terrrible indentation while we're here :)?
> > 
> > static __always_inline bool kvm_age_hva_range(struct mmu_notifier *mn,
> > 		unsigned long start, unsigned long end, gfn_handler_t handler,
> > 		bool flush_on_ret)
> > 
> > Would be nicer, thanks!

No, please keep this as-is.  KVM's preferred style is exactly this (and I personally
find mm's style much harder to parse).

