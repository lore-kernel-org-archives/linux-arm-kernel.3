Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD24CE8E67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Erp1+OVg6Zvh2QGB7pP0w1YYkfDo5lKRK3PPeKeDOv4=; b=Dbz1karY1Y2ucr4RwfXoFumacL
	6tlpd0X9Yarhu66D8B8jIDtnPD/cd+rxPyrKCS5ZoKqdw6d4NZttUzYS5/FkIjQrEU/I+cPDUmkHi
	xvL5+dH2JTo3+H8y9PbUXfTEvKTn9QYwW74hyKXf7zsqipBghv5OFOZ78ufnJHe/EAzdsOCngj5Ng
	iI7nk9ke/R0761HDu0xFrahnuLxE7y8MPyG0eKSr9iG+T/8W87CpAYZfX+5TjW25iOOh/78WFZ8hX
	0AaJAoOBLX7jXimnOQ8M28zBkBcifFL9OenlO181/DV3myV+zpBXn7XYxmn46V7ySUwLcuYOj4b+t
	O3OwSaRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3wNt-00000000Fv6-46jq;
	Thu, 24 Oct 2024 11:52:09 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3w4u-00000000DZq-3sva
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 11:32:34 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4315ee633dcso112665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 04:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729769550; x=1730374350; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Erp1+OVg6Zvh2QGB7pP0w1YYkfDo5lKRK3PPeKeDOv4=;
        b=Ca5LU/6fI6urOvTU0PsQQOaKaa9DcRqCQcY6YLngHZsuZ2vAKLVuItf9f8jSIdMaEf
         MnINVk+px/X6a3paBeYZr/1+ufQ+1mq3kgBgQ3lYPg8yb7ORlZELZOA+kNCwf6NuUPNn
         ELxoNhGYkbK6xgAx3SBXFtYN14jNsy+VOYkEJc80UeQw/PyxbdtOtbFfXhjRsvjUET4t
         b8dMesGHdWyVuMY9d7fIxb00iVO9X6uJtvjWOLZfpIcww4jpdZ86zlFA2CFkhnjqLkR0
         9nu5EhPszyNCdiOIo/kUptMZLeALgqkzdYm71LESxXZCuiCzPIOt/5QWFAvpIw7ATfVh
         bYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729769550; x=1730374350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Erp1+OVg6Zvh2QGB7pP0w1YYkfDo5lKRK3PPeKeDOv4=;
        b=IjPD+UHj7gKc7cE6avr9SdPqVo7KwXtr5XmPgCCnGOSVCx/wr4lml8ABQufBqMrWsy
         nozGwOgaKGI4bBHNAvnXcP3KiERJgxrVjlh0R827qA/RpfY/rQNSAfLV7qedsu0799W/
         MC8TmTR8OVy0WwGDYdR4dj++PY9WFazMAgvSfjrDzUiXeJfpeYYk1S7wEdbQjJuDLXfb
         Ib0xYNL71TXbRFfvvlg04rFuAi7cet9U4FrmisXtNTZFgmdy2UXZW2f7jqNLyEE6XXF2
         DVt9aSXt+MsrGDBBJ3vd8AT3Q6HQzPJXZz/WpMOIwawerWbr0HVxCJKAtguWbdKAzKKe
         ZRzA==
X-Forwarded-Encrypted: i=1; AJvYcCURiO504M5PljVpDFJxxEv2eIFnY6r+8OaN8zBWgWRVx+0WVjyB2UQZp28qFY/lvHbTkoPTzKcE59oHPuvzNPmX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+z24KlP9Uyt5kIt6gVZ26RjwrIJ8vPGwi4igOJkLp/ZwoKKzf
	9SbBK2PtNcUHXKDi0hor1zefc2MSG7xxCApxcnhTLqduF6byZiLIk5LX+fttsg==
X-Google-Smtp-Source: AGHT+IE07p1wY1vvq/4/9vbPY3LEzz4J2xejwqtPU6uKF3gb39IMRgXzep0l9PGpoNZbYvF5Fehu7g==
X-Received: by 2002:a05:600c:1f14:b0:426:6edd:61a7 with SMTP id 5b1f17b1804b1-4318aff2d08mr3020455e9.7.1729769550185;
        Thu, 24 Oct 2024 04:32:30 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b5706c3sm14524155e9.34.2024.10.24.04.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 04:32:29 -0700 (PDT)
Date: Thu, 24 Oct 2024 11:32:25 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, corbet@lwn.net,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] Documentation: Update the behaviour of "kvm-arm.mode"
Message-ID: <ZxowSYHQeOq7W_JT@google.com>
References: <20241023171244.4031151-1-smostafa@google.com>
 <86v7xh3km6.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86v7xh3km6.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_043233_018546_C9CB4473 
X-CRM114-Status: GOOD (  30.42  )
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

On Thu, Oct 24, 2024 at 10:39:45AM +0100, Marc Zyngier wrote:
> Hi Mostafa,
> 
> On Wed, 23 Oct 2024 18:12:43 +0100,
> Mostafa Saleh <smostafa@google.com> wrote:
> > 
> > Commit 5053c3f0519c ("KVM: arm64: Use hVHE in pKVM by default on CPUs with
> > VHE support") modified the behaviour of "kvm-arm.mode=protected" without
> > the updating the kernel parameters doc.
> > 
> > Update it to match the current implementation.
> > 
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > 
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index bb48ae24ae69..59a0dd7e2de6 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -2723,8 +2723,12 @@
> >  			nvhe: Standard nVHE-based mode, without support for
> >  			      protected guests.
> >  
> > -			protected: nVHE-based mode with support for guests whose
> > +			protected: hVHE-based mode with support for guests whose
> >  				   state is kept private from the host.
> > +				   In case hVHE is not supported in hardware, it will
> 
> nit: it is VHE that is supported or not, hVHE is only a SW concept.
> 
> > +				   boot with protected nVHE.
> > +				   nVHE protected mode can still be forced on VHE systems
> > +				   using "kvm_arm.mode=protected arm64_sw.hvhe=0 id_aa64mmfr1.vh=0"
> 
> This opens another question: none of the arm_sw.*, nor any of the
> id_aa64* parameters are described (basically, anything that's in
> arch/arm64/kernel/pi/id_override.c). What should we do about these?

Yes, I mainly added this, to make it easier if someone wants to boot to
protected nVHE so they don't have to go through the code, but I can
remove it if it's confusing.

> 
> 
> 
> >
> >  			nested: VHE-based mode with support for nested
> >  				virtualization. Requires at least ARMv8.3
> 
> Huh, another nit to fix. We only support nested with ARMv8.4 (with
> FEAT_NV2), as the ARMv8.3 version (the original FEAT_NV) is too ugly
> for words.
> 
> Mind addressing this?

Sure, I will update it in v2.

Thanks,
Mostafa
> 
> Thanks!
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

