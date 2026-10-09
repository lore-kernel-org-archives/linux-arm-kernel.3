Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AAACA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 13:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WsxvmTXnugqlwlP9gNKWseJDOdqZigaqk1q1Hbj0aM=; b=xbYU5WX6XZeCY8MsKc+R91Oumo
	esn6i89e+dIPFgbN8TaijxGvqdf/WciJgs+wtwHLNGmp0EVf/rX6J+QZ76RDb5vnvJtHFjQdpXHLM
	BG3cxa/PZmwrzIUcvRZknT+ukjDfA/TmO/JRHB/sohTd2srRPjzwaDf0zUOawd9Ai7b2iFCgalIiL
	yd+FDn0sEivFW+JJtnmKlhQFPpO8qaGLQWAcKYLqos0LJBp+WFX/JSrtbdGQ6FrL8jCX95w+SRwYk
	TIV54P6wWacgq8ReBEldOH55brVRsVxc9JfYqTbozz2FprzLuX8FWeig4Gf1Abz+aNYzTY9fULWW/
	8GtESfXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAWo-00000006N46-2mhH;
	Fri, 09 Oct 2026 13:20:50 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFAWh-00000006N3T-3juM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 13:20:49 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so35359635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791552042; x=1792156842; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5WsxvmTXnugqlwlP9gNKWseJDOdqZigaqk1q1Hbj0aM=;
        b=XTXp/OX681t4Kae4AIXXLA9OyKshxMYAxMuedRG3IcuazL3eBVKkOD0FprEkZkmtuS
         HK5YQtTA0tmJNGSOPtOWcl07bAWJvEbvE9NWDpQJYGZRBa/O7ngb9bMZXAQ6dQ8wHJfg
         Y7jVyG70DyoS6giOOi4PAoISGeRvIiN0KMKpt9I/1qKL6hB6o5DEKKgrYPfJOUXY4/Fm
         x2DafIEoylc5bKYVSEAd043gxoYHkpSSsNDC1DjRi6DA3rD/6DH93YS+10xNn0KFKViV
         6fbGLIw6F4CRKlbrUL1vo7Dg/gRask/guSDsFGiXJn55cvdLRNOQRnyBUHxd+dgZA5FP
         dXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552042; x=1792156842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5WsxvmTXnugqlwlP9gNKWseJDOdqZigaqk1q1Hbj0aM=;
        b=TRMq+l2QI0jyDaSznNiI+taQiuj1otoObFQ3I27H/YplT6dl6QVbsSeiShJqaDLIwh
         UY6MRCIVBuu25GGuF5eEuBGt4IySa1xkmW5hVwJskoj0P2Mzta6jJ7b32qOeuixQlF7x
         F6VKSCORZKXUTwv0KMlaDsYdUUVXrt79KYfcRGWMn2EJgWAXT91oUx/vbT3z+qNo5zCk
         68pJFhnR4YR4iBiEW0UqKFkIXGytmn1EdHn9ZjGcCyCJ5++mbmv6qk/Bwu3s9J72fD8K
         8xoa6FIhJq+9uQ/faZ2nuSl2rucZ3iFeyC44krCnuYtsAX1sMGOd5RV7/zGwJ2EgJ5c5
         qhgg==
X-Forwarded-Encrypted: i=1; AKwUvBxphXrs77kY+L45Ib/G8ErmQlq6Oh8KDIQocLzDwjfPJJushYIppibBZHHWSoeuLJZpaRGKdwuISMuFru/rUlHv@lists.infradead.org
X-Gm-Message-State: AFuF++nwhPKtuv5pJ2QD9P96A8yDlW28SKmLbkOKiNTef4qnBUbs99z1
	LCDX3mhyjIXTxZRaJOVbj5yKK7gY3kCUKwo3O1B6aGtiOUFJDr/OYJFbBtTIT8UeYQ==
X-Gm-Gg: AYBFou0UQrAUdRdeIMt3t00nVKput54SH/FHCBHzwrb6TLqCSU8MQ2kxgzzH8FBiifR
	s28n83afytS181lX5CtUO3CRYECmTi9JOghMcT0qgXQw2m2LGy+guJHw/rXTCGvZAnczSlEihto
	9wuEPFw8A+5XJfxFWm0+jr1eywPIxNTSaAWRdTy/X420yKswY9jEPLnXpbdE4gowAaD/HA5/JYT
	t8VoylHxyZ0riHAoQjfHLQa0nlh27JjLxTD6BrO+EHHvOsAheZVOZU28JfmZduQxUqn9oFE8NLI
	yKuE7mXAZzEFKLVUoOllBpIMmL9731EnjBP+oDht+NVb7okoFxiVvawoZvzlWeNsJgCQRxF+Q2z
	MtHMIwmMweb2nfDX0vTdDVQ7w0lGr7+CAaV0cB/7ofjIRMM6w+evwEtQOt2HkyblnswkFJOGPLF
	ch1B1Emw3a1lKd/q9/s6ivglsvy2h/HN4Rp0AtpG8+9sHyBRuX1FFsYI8J0gwymvpxj4MfzfPd8
	pRxleEuTMX/w1IRaw8F9wy8p4WLp9DMfNQAx9+AZDQ=
X-Received: by 2002:a05:600c:5391:b0:49e:7a10:1b71 with SMTP id 5b1f17b1804b1-4a18e4a003cmr36287735e9.11.1791552041463;
        Fri, 09 Oct 2026 06:20:41 -0700 (PDT)
Received: from google.com (197.183.140.34.bc.googleusercontent.com. [34.140.183.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be964dfsm58570675e9.7.2026.10.09.06.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:20:39 -0700 (PDT)
Date: Fri, 9 Oct 2026 14:20:25 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com
Subject: Re: [PATCH v1 3/3] KVM: arm64: Add host_hvc hyp event
Message-ID: <asjqGQglerqNrMrG@google.com>
References: <20261009084529.462577-1-vdonnefort@google.com>
 <20261009084529.462577-4-vdonnefort@google.com>
 <CA+EHjTzdEXHxkMtSU3SybNxy+Fece339bsvyc6L6K_iySdRDfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzdEXHxkMtSU3SybNxy+Fece339bsvyc6L6K_iySdRDfA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_062044_509765_88AB8792 
X-CRM114-Status: GOOD (  17.30  )
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

On Fri, Oct 09, 2026 at 01:26:22PM +0100, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Fri, 09 Oct 2026 09:45:29 +0100, Vincent Donnefort
> <vdonnefort@google.com> wrote:
> 
> [...]
> > diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
> 
> [...]
> > +HYP_EVENT(host_hvc,
> > +        HE_PROTO(u8 id, u64 ret),
> > +        HE_STRUCT(
> > +                he_field(u8, id)
> > +                he_field(u64, ret)
> > +        ),
> > +        HE_ASSIGN(
> > +                __entry->id = id;
> > +                __entry->ret = ret;
> > +        ),
> > +        HE_PRINTK("id=%u ret=0x%llx", __entry->id, __entry->ret)
> > +);
> 
> id is the index into host_hcall[], so its value depends on that
> table's order. Could this log the SMCCC function ID instead, as
> guest_hvc does? The alignment issue from patch 2 applies here too: the
> format file puts ret at offset 3 instead of 8.

Ack. I thought this might be easier to get a simpler ID. I even contemplated to
stringify the list before convincing myself this wasn't really the hassle.

> 
> [...]
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> 
> [...]
> > @@ -996,6 +996,8 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
> >          cpu_reg(host_ctxt, 0) = SMCCC_RET_SUCCESS;
> >          hfn(host_ctxt);
> >
> > +        trace_host_hvc(id, cpu_reg(host_ctxt, 1));
> > +
> >          return;
> >  inval:
> >          cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
> 
> Only some of the handlers write a return value to x1. For the others,
> x1 still holds the first argument, e.g. the mmu pointer for
> __kvm_tlb_flush_vmid, so host_hvc's ret field shows that instead.
> Could the field be called x1 rather than ret?

x1 it is. Perhaps I'll rename too for guest_hvc.

> 
> Cheers,
> /fuad

And as always, thanks for reviewing.

-- 
Vincent

