Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB85F9935C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzw3UnIwHGir8Kj1NlO4m24J9zaCTTh7cxmm2qnVabM=; b=1+XdBb5QtQ/2x32xXScVA4J0+o
	Dy6kYTcj13FQ8/vtL0kQ2n3yRLeu/c7IRbcVjSmigLCm91jSj/Fa9Ny00WXKOUuIKjaREDVYA86Tc
	gnlYg35xeV5a/wsZQ+trQRQkCr/8LAwFVuMoN0ZBryySJJRyCAoB8VUi3Wp/PDpkowzbcoAyIFFme
	3rr9BPFjAkXn7QhcIvXSdaQnKlo1RzDyPwBUuJeb1ZET/Oty6Nt0MQcwHTEHRQTZRhKyZQb8hTXLO
	4jovaSmeczN4yiz4qFABnSCI8ULpgOIfw1C/BoYg58VvJwu35ww/UysOAzpfbQoVezmPU7zQDGU0c
	5sRfpJXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqC6-0000000BKDW-3Feh;
	Thu, 23 Apr 2026 09:17:58 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqC4-0000000BKBM-1pvZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 09:17:57 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-671f1a0d0c5so54210a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 02:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776935874; x=1777540674; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jzw3UnIwHGir8Kj1NlO4m24J9zaCTTh7cxmm2qnVabM=;
        b=UJO0JeeMet+ovFaK2r6a620yUEYrLJkJiaNZvYqDJK6KopCnqu1s7tirBtTreK/XSS
         L8JCdojnmET90X2WEQ2ob/xaMmIsqh9k5upzE2k/SGZLFhAqoQ31p0e4RRJvbjVTVfPJ
         WpsZYJbsgr2D33QVamRLK9KWk6gRtvcRRNBRZu29+iNjMbPKEo6MQFbfow8YtmL6guus
         iJHpqNyYkDXi3P3ojBLoqDrZwt2AMCoD44EaroSBhe9mv3GLuobwhuhTGiVC+fWTPAlC
         aFfahP8t6IcA2tQDpAhAJIFNSR9E26fpzn4EJ7nk70WSgJ2MLQ+4oRKzHGSK2W/BtjXh
         psPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776935874; x=1777540674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzw3UnIwHGir8Kj1NlO4m24J9zaCTTh7cxmm2qnVabM=;
        b=E934Wn8d9f3gmFF8tVsNUtyDtaAfqQ+udHmxz4Nnhape3jp86nMLb3us5YXWW2MOyQ
         dWHiWe58FXIZhXmj/rjUusAd9TzkpXHbATW4YmH6sAGaMaqlbvGVG1/TfWvXUiWLM7ot
         gVoTPssHokcSPE6HhO0qNxyPou/x0gjkmlIa1DVnfBomH/QShIM4skdYa0OUABU/QBj0
         pJf1Z1QLYp6TGa2tBrFZ3D//fDXAjHL2nm9Im4TFtIxS1GkbmUpBGTp57khUYqBvKKhs
         paV8gtAYZWY0JV1CcFDfiiCpRHsk2nYE4KLejXVl7Oc39EPqr8mmjtQ6+8yrIEBgZUsg
         Gkzw==
X-Forwarded-Encrypted: i=1; AFNElJ+kJ/mGThJpgUhukVCzNU8ZO2yRc8rjzl/bc5dLrsxKENqNHFOtLi4HP6bEPZLpaR7u89WhQe2Scct+20qU7c7G@lists.infradead.org
X-Gm-Message-State: AOJu0Yys1Gfz01ZO45c0trcuPKM8t50JJVe6e3P0JJkkfOOAiwfvQVIF
	pqnVqEfPb6UKcg3QdnsD8RrgavmOhrhRrLiZlbRMR8EKrD+MPH7UvGVm9qbHuri+sg==
X-Gm-Gg: AeBDievqt2ITvgGVJ2awlPmvspFrsmhYLAGRAjFeebZvPbNVXnYekPPHuPobrRxIIBx
	l3sEWPvgbqM1Mem8OGa39s+G56Tm0b6EvLkF1QpTyES+UsuFzxfqlA/9D/h37mZ8EFxECzM76sE
	95+AGlJHFhN9+7z2NYTTXdRdeARgcdbdL62Ty66knEyJxYT6GLCvqWyQQPGsiYJAK41qeZkdXDY
	70HPAdfR/GtifiYxhkb6yTAnBJ54Od4FqxkL7hPIuZKVC9Tz3hYV8ZTeF/RAMIgZndpM5OENUFz
	hQDRD1dTF4gG6mePM2lVF7kvR+/gwsqxTzz44s5xABu57lxinA9LzKkhkbrbbKjpBERlwiuK77N
	1VntCBom4ANthgZR+LsJrWzG64VNX9z3prOCwbIP7LcF7KyXpS2lPbM41/LGXith/idf5KrgNgW
	YgCUQLY4TtRPcgQVdIXQWBfD0kTtuSciSLj6siMp9hLBzdi2cW1ilZpfZyPB8ildp4NhNJ1WqNd
	zWg86nsjTAvPe2Eed4=
X-Received: by 2002:a05:6402:3085:b0:671:dad9:8caf with SMTP id 4fb4d7f45d1cf-6744ed5f907mr227247a12.5.1776935873820;
        Thu, 23 Apr 2026 02:17:53 -0700 (PDT)
Received: from google.com (117.15.199.104.bc.googleusercontent.com. [104.199.15.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e49sm655436766b.10.2026.04.23.02.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 02:17:53 -0700 (PDT)
Date: Thu, 23 Apr 2026 09:17:49 +0000
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
Message-ID: <aenjvY5VJxFye52e@google.com>
References: <20260422102540.1433704-1-sebastianene@google.com>
 <86bjfb18v1.wl-maz@kernel.org>
 <aejOu98q1lEZoFfW@google.com>
 <20260422-jolly-curassow-of-amplitude-25fbaf@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-jolly-curassow-of-amplitude-25fbaf@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_021756_508913_13E96D23 
X-CRM114-Status: GOOD (  45.92  )
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

On Wed, Apr 22, 2026 at 08:29:06PM +0100, Sudeep Holla wrote:
> On Wed, Apr 22, 2026 at 01:35:55PM +0000, Sebastian Ene wrote:
> > On Wed, Apr 22, 2026 at 01:24:02PM +0100, Marc Zyngier wrote:
> > > On Wed, 22 Apr 2026 11:25:40 +0100,
> > > Sebastian Ene <sebastianene@google.com> wrote:
> > > > 
> > > > Prevent the pKVM hypervisor from making assumptions that the
> > > > endpoint memory access descriptor (EMAD) comes right after the
> > > > FF-A memory region header and enforce a strict placement for it
> > > > when validating an FF-A memory lend/share transaction.
> > 
> > Hello Marc,
> > 
> > > 
> > > As I read this, you want to remove a bad assumption...
> > > 
> > > > 
> > > > Prior to FF-A version 1.1 the header of the memory region
> > > > didn't contain an offset to the endpoint memory access descriptor.
> > > > The layout of a memory transaction looks like this:
> > > > 
> > > >   Field name				| Offset
> > > > 					 -- 0
> > > > [ Header (ffa_mem_region)               |__ ep_mem_offset
> > > >   EMAD 1 (ffa_mem_region_attributes)	|
> > > > ]
> > > > 
> > > > Reject the host from specifying a memory access descriptor offset
> > > > that is different than the size of the memory region header.
> > > 
> > > And yet you decide that you want to enforce this assumption. I don't
> > > understand how you arrive to this conclusion.
> > > 
> > > Looking at the spec, it appears that the offset is *designed* to allow
> > > a gap between the header and the EMAD. Refusing to handle a it seems to be a
> > > violation of the spec.
> > > 
> > > What am I missing?
> > 
> > While the spec allows the gap to be variable (since version 1.1), the
> > arm ff-a driver places it at a fixed position in:
> > ffa_mem_region_additional_setup() 
> > https://elixir.bootlin.com/linux/v7.0/source/drivers/firmware/arm_ffa/driver.c#L671
> > 
> 

Hello Sudeep,

> That's just the current choice in the driver and can be changed in the future.
> 
> > and makes use of the same assumption in: ffa_mem_desc_offset().
> > https://elixir.bootlin.com/linux/v7.0/source/include/linux/arm_ffa.h#L448
> 
> Again this is just in the transmit path of the message the driver is
> constructing and hence it is a simple choice rather than wrong assumption.
>
> > The later one seems wrong IMO. because we should compute the offset
> > based on the value stored in ep_mem_offset and not adding it up with
> > sizeof(struct ffa_mem_region).
> > 
> 
> Sorry what am I missing as the driver is building these descriptors to
> send it across to SPMC, we are populating the field and it will be 0
> before it is initialised

Right, what I meant is having something like this since this function is not limited
to the driver scope and using it from other components would imply relying on the
assumption: 'ep_mem_offset == sizeof(struct ffa_mem_region)'. We will also have to validate
that the `ep_mem_offset` doesn't point outside of the mailbox designated buffer.

---
diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 81e603839c4a..62d67dae8b70 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -445,7 +445,7 @@ ffa_mem_desc_offset(struct ffa_mem_region *buf, int count, u32 ffa_version)
        if (!FFA_MEM_REGION_HAS_EP_MEM_OFFSET(ffa_version))
                offset += offsetof(struct ffa_mem_region, ep_mem_offset);
        else
-               offset += sizeof(struct ffa_mem_region);
+               offset += buf->ep_mem_offset;
 
        return offset;
 }
---

And then move `ffa_mem_region_additional_setup` to be called earlier before `ffa_mem_desc_offset`:
(so that it can setup the value for ep_mem_offset)

---
diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index f2f94d4d533e..66de59c88aff 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -691,6 +691,8 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
        mem_region->flags = args->flags;
        mem_region->sender_id = drv_info->vm_id;
        mem_region->attributes = ffa_memory_attributes_get(func_id);
+
+       ffa_mem_region_additional_setup(drv_info->version, mem_region);
        composite_offset = ffa_mem_desc_offset(buffer, args->nattrs,
                                               drv_info->version);
 
@@ -708,7 +710,6 @@ ffa_setup_and_transmit(u32 func_id, void *buffer, u32 max_fragsize,
        }
        mem_region->handle = 0;
        mem_region->ep_count = args->nattrs;
-       ffa_mem_region_additional_setup(drv_info->version, mem_region);
---

> 
> > Maybe this should be the fix instead and not the one in pKVM ? What do
> > you think ?
> > 
> 
> Can you share the diff you have in mind to understand your concern better
> or are you referring to this patch itself.

Sure, please let me know if you think this is wrong. I might have misunderstood it. 

> 
> > The current implementation in pKVM makes use of the
> > ffa_mem_desc_offset() to validate the first EMAD. If a compromised host
> > places an EMAD at a different offset than sizeof(struct ffa_mem_region),
> > then pKVM will not validate that EMAD.
> >
> 
> Calling the host as compromised if it chooses a different offset seems bit
> of extreme here. I am no sure if I am missing to understand something here.
> 

Sorry for not explaining it, in pKVM model we don't trust the host kernel so we can assume that
everything that doesn't pass the hypervisor validation(in this case the ff-a memory transaction)
can be a potential attack that wants to compromise EL2.

> -- 
> Regards,
> Sudeep

Thanks,
Sebastian

