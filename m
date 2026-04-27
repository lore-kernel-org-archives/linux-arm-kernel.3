Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49E0FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 11:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFQ7YWSxQTi8WSuVhErZPiSuizAww+UyP5IWNi9MsWE=; b=DQOkJDIwTZ8tk2HVC+184kARTj
	Q4XWPP+Ez63W6NMAgLhgzgPAK6Ize60vA553g0iQj6C162FaqK7MT+tpunU/DJrOPzH27qvejk57E
	O8NRq6DlZyv+hpd0PXpjsWiwoeohjU7BAPGCm2qxIYSfAqFsiPTJDZoDJg/x6RUbc4KN+ogouWREk
	ZgNGY4dhynD6l/MfjZA3scQOd9yzZjajN61/pYONKh573FF4NGZuWEuMUEsEaEDA48DFQqF+Y3tiS
	LxCKSXeFIDPRj0o5iqUTIrXC25UsV/tOv5CSCRzT17xkcuXCToMBGYa6E7ypZ8OFTR6pYmPY9FbOq
	EYaBodXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKGQ-0000000GoPg-1Cgr;
	Mon, 27 Apr 2026 11:36:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKGM-0000000GoOz-31C5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 11:36:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4891ca4ce02so890475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 04:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777289789; x=1777894589; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KFQ7YWSxQTi8WSuVhErZPiSuizAww+UyP5IWNi9MsWE=;
        b=Wxrokl3uMLbJHRjsRzjEZrmz4EfQszTCZIgqmZrUe5kxmITSE7QMNfh8Oy+kFTqkej
         1ku6Dm9OhTSFfvO12xNaKqPWYM6hLBH1wxYZ5iYYmPQu7X3BOkPDFF6GgWmLwYqpIxbe
         TdGiul6t7WC16OhQWOs8RiBAnLbFWggeY+MY94XMJalXgGxDFhIrBvBlEHpuNrPSKg7T
         8CQa9zl1EhcPGHzhfaUxgelroN/GfSbDHAX04R6/jgTJsO5+QDC2XiXkrl7yUQkko6Bv
         APO9eZM2IL4inM7oTxu8hRgyhw2q4KcFawf7Qz4CCwZHivMo0Moo/fzDZYTrWzNaeaFo
         wtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777289789; x=1777894589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KFQ7YWSxQTi8WSuVhErZPiSuizAww+UyP5IWNi9MsWE=;
        b=A9AdooulsOHuxaLxqjknMODHM+webkillJ9iixyzW8xwArWAr9Feq4y+USxXZajxR9
         FavVGtyEQQMVsxwPPSBSkFPtp+E2uiHAMvYb26ZYGDw0fwvIZFGoZC29jY9sxn/BsHxe
         aXvkRud+nUwZzT7QIee0hJzm3p72/rB3Zyk4I41qU95ehX6iWgkyVI4C0mPuRir5rwOg
         pLzLrFIovhZS18xbHw6UrJzZPU06oRySGiV4NQ2DOJ6/y63JC4Y56Y/A5udCqLJHLCLo
         HiffwwIoe0ZKKEXgzTt0A2sZAXDjZlE/Wn5gkzzQnaYxBfcnZXB1iXOb5z/8nlEqyCCF
         t53w==
X-Forwarded-Encrypted: i=1; AFNElJ9CKgNO3VF9XF5N/efmktV7YuhFXuw2K5mOG/KHbJKWOeqluIEcz7Wl0KAz7dNLDMc5d1nOyZ7lbcgnzDXx0XJ8@lists.infradead.org
X-Gm-Message-State: AOJu0YyEmzVJdknuSl7omSd2iungmxHKgaSaLtOnoyZm07TqTbSoeQMi
	8IZcy211eSaXyNRssMM1pSCAmwL4gVYzJEwhmexsreJDCKWEcOJmXxpjUx2dXMrlxg==
X-Gm-Gg: AeBDieutz1UbMTPbaYwQbmmREAbyxNHSSECKy5jBKrVeXsTxZO8Qa17VRrW/WUyuqUY
	XuESWMbrxZtx4BpFuITFdRkiult0jIFhFqVvElCFc9lsiYsaJLhZ6RRfH0EMaO2ZruJAVKlhtYh
	zhu7r9nbPujfW5rBYCLGiUrI64E3lvgLorPeCCePA4WoHqc54hyLtIVJDEt2RDg+fEO9ktJr1OF
	Zelt+VBfZbVdQCLcLeukBLV638rRWO0SpHdLIWYEhpnBmsI+VntUXDjPM20CAT8xYM9pQxW5G+D
	GflIuMpccnasdTnsMKtntE0k5CRQXX/aOwMiNmtdaAmrzpNjmgCTJ2MY1aqPaP49ySYvEbyGInJ
	czshgjbkH4XW2Rawk2TeJ0+3J/1EPqMu3mOB6JpRNF6gluWG+aYPZKw1qeqXvvX67QkVU27pq/g
	NyXwG+Kw8FGj0xCkNspWx1CdV4O5t0RQxhsMHV7noJrIXgPu5uQf9l2b+IbD5zOSsfAt2YBQ9w7
	b8u25OtwMetY5SaYt8=
X-Received: by 2002:a05:600c:35c7:b0:48a:5aa3:ac1e with SMTP id 5b1f17b1804b1-48a5aa3ade2mr8143875e9.3.1777289788273;
        Mon, 27 Apr 2026 04:36:28 -0700 (PDT)
Received: from google.com (117.15.199.104.bc.googleusercontent.com. [104.199.15.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a575ad67asm400794425e9.2.2026.04.27.04.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 04:36:27 -0700 (PDT)
Date: Mon, 27 Apr 2026 11:36:23 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, oupton@kernel.org, will@kernel.org,
	ayrton@google.com, catalin.marinas@arm.com, joey.gouly@arm.com,
	korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Validate the FF-A memory access descriptor
 placement
Message-ID: <ae9KN9nkOgDYJcGP@google.com>
References: <20260422102540.1433704-1-sebastianene@google.com>
 <86bjfb18v1.wl-maz@kernel.org>
 <aejOu98q1lEZoFfW@google.com>
 <20260422-jolly-curassow-of-amplitude-25fbaf@sudeepholla>
 <aenjvY5VJxFye52e@google.com>
 <20260423-just-mega-starfish-22309c@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-just-mega-starfish-22309c@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_043630_951466_7FEFDB82 
X-CRM114-Status: GOOD (  50.89  )
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

On Thu, Apr 23, 2026 at 10:55:34AM +0100, Sudeep Holla wrote:
> On Thu, Apr 23, 2026 at 09:17:49AM +0000, Sebastian Ene wrote:
> > On Wed, Apr 22, 2026 at 08:29:06PM +0100, Sudeep Holla wrote:
> 
> [...]
> 
> > Hello Sudeep,
> > 
> > > That's just the current choice in the driver and can be changed in the future.
> > > 
> > > > and makes use of the same assumption in: ffa_mem_desc_offset().
> > > > https://elixir.bootlin.com/linux/v7.0/source/include/linux/arm_ffa.h#L448
> > > 
> > > Again this is just in the transmit path of the message the driver is
> > > constructing and hence it is a simple choice rather than wrong assumption.
> > >
> > > > The later one seems wrong IMO. because we should compute the offset
> > > > based on the value stored in ep_mem_offset and not adding it up with
> > > > sizeof(struct ffa_mem_region).
> > > > 
> > > 
> > > Sorry what am I missing as the driver is building these descriptors to
> > > send it across to SPMC, we are populating the field and it will be 0
> > > before it is initialised
> > 
> > Right, what I meant is having something like this since this function is not limited
> > to the driver scope and using it from other components would imply relying on the
> > assumption: 'ep_mem_offset == sizeof(struct ffa_mem_region)'. We will also have to validate
> > that the `ep_mem_offset` doesn't point outside of the mailbox designated buffer.
> > 
> 
> Sure, we can extend the function itself or add addition helper to get the
> functionality you are looking for the validation.
> 

Thanks, would it be ok to BUG_ON if the offset is out of range here ?
(we would probably have to pass the size of the buf as well in this
function)

> > ---
> > diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
> > index 81e603839c4a..62d67dae8b70 100644
> > --- a/include/linux/arm_ffa.h
> > +++ b/include/linux/arm_ffa.h
> > @@ -445,7 +445,7 @@ ffa_mem_desc_offset(struct ffa_mem_region *buf, int count, u32 ffa_version)
> >         if (!FFA_MEM_REGION_HAS_EP_MEM_OFFSET(ffa_version))
> >                 offset += offsetof(struct ffa_mem_region, ep_mem_offset);
> >         else
> > -               offset += sizeof(struct ffa_mem_region);
> > +               offset += buf->ep_mem_offset;
> >
> >         return offset;
> >  }
> > ---
> > 
> > And then move `ffa_mem_region_additional_setup` to be called earlier before `ffa_mem_desc_offset`:
> > (so that it can setup the value for ep_mem_offset)
> > 
> > ---
> > diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
> > index f2f94d4d533e..66de59c88aff 100644
> > --- a/drivers/firmware/arm_ffa/driver.c
> > +++ b/drivers/firmware/arm_ffa/driver.c
> > @@ -691,6 +691,8 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
> >         mem_region->flags = args->flags;
> >         mem_region->sender_id = drv_info->vm_id;
> >         mem_region->attributes = ffa_memory_attributes_get(func_id);
> > +
> > +       ffa_mem_region_additional_setup(drv_info->version, mem_region);
> 
> Ah this could do the trick. I need to check if all the usages are covered
> though.
>

I looked a bit at the call paths and I think we can use it like this.
Please let me know if you found it differently. I would like to re-spin
another version of this patch.


> >         composite_offset = ffa_mem_desc_offset(buffer, args->nattrs,
> >                                                drv_info->version);
> >  
> > @@ -708,7 +710,6 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
> >         }
> >         mem_region->handle = 0;
> >         mem_region->ep_count = args->nattrs;
> > -       ffa_mem_region_additional_setup(drv_info->version, mem_region);
> > ---
> > 
> > > 
> > > > Maybe this should be the fix instead and not the one in pKVM ? What do
> > > > you think ?
> > > > 
> > > 
> > > Can you share the diff you have in mind to understand your concern better
> > > or are you referring to this patch itself.
> > 
> > Sure, please let me know if you think this is wrong. I might have misunderstood it. 
> > 
> 
> Nope, the patch helped to understand it quicker. Thanks for that.
> 
> > > 
> > > > The current implementation in pKVM makes use of the
> > > > ffa_mem_desc_offset() to validate the first EMAD. If a compromised host
> > > > places an EMAD at a different offset than sizeof(struct ffa_mem_region),
> > > > then pKVM will not validate that EMAD.
> > > >
> > > 
> > > Calling the host as compromised if it chooses a different offset seems bit
> > > of extreme here. I am no sure if I am missing to understand something here.
> > > 
> > 
> > Sorry for not explaining it, in pKVM model we don't trust the host kernel so
> > we can assume that everything that doesn't pass the hypervisor validation(in
> > this case the ff-a memory transaction) can be a potential attack that wants
> > to compromise EL2.
> > 
> 
> I am aware of the principle in general, but this example with different offset
> can't be assumed as comprised host if the offset + size is well within the
> Tx buffer size boundaries. That should be the way for you to cross check for
> any compromise IHMO.
>

I agree, it cannot be assumed as a compromised host it can be perferctly
normal with another driver that places it at a different offset; that's
why I suggested patching ffa_mem_desc_offset instead and doing the
ep_mem_offset validation there.

> -- 
> Regards,
> Sudeep

Thanks,
Sebastian

