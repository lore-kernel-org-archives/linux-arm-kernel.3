Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8F7C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/kPz5ajPeR8UdBb+Kn3rMnPwkhqf5YXoddQSOq9Wck=; b=waMqRWO1jzu0U4ykPDyy4Ecmki
	CHmk+UO0N89FsN/cyp5WIL14RUpMYR4hY6bnl1p6m6994ZOqdwAhWHuUrUmcUIE+/22fpzslsFReK
	gww38zGBy+MGEKe9xOKk6xf1APAdG1yhxaFUssocX52iOdKntiyZLexCMM5WO2Ref6CMyUiQakkFk
	6dWJ7ow5lzvC7+HoVgJnm/nio2CcRXhccKSMQifCviidVRGGfY56jwkaOfhtRQLcrucnV9F12xXJ3
	kvHlUVITdr/SDxxlnD+Kzqshg96BrfHNx2Y5q1kCfJ6Tru89R1N6Txsm5NG/ieBsHeo2Nr1Hc7ifg
	oWaach6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloFG-00000006rWg-0rTo;
	Mon, 20 Jul 2026 13:41:22 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloFC-00000006rVU-2LAW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:41:20 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c1670dad7a8so1017175766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 06:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784554877; x=1785159677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y/kPz5ajPeR8UdBb+Kn3rMnPwkhqf5YXoddQSOq9Wck=;
        b=pdhFCWvlP66WToa29NzDSJopJOkvmz/ok0R/3K+Z2cZby3mH773IJaz8Tbp8lPWi30
         lXWAmaDIGTH7ZLh9+FdiGvDzGGo6wGTja8mo83nT0+jY+dG1kFeLckveFoZ8sJPaUy+M
         54W4YLWcpY2f15QpHKfSL0a2FXtK2/iZ6juBkA8Z0EdCgGLJpMXQNibKGh5Mhn2+iUf8
         ghmcbhR2f68xUIoF3kpHXlBcUGz0w41a3XdkivdhYtv3dXwVekdgL0C+HSf2CIfB4Plq
         KVgonJsJbu7HXpX4ZUKXsVwXywx1ZI++b0b7bZt/OOJN/YzJ5IOv/J8IDZTKQFOdDVC9
         7Z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784554877; x=1785159677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y/kPz5ajPeR8UdBb+Kn3rMnPwkhqf5YXoddQSOq9Wck=;
        b=PKwrwqJjf+jrXjI7sbsn4qQIWp1ySACSNLTvrHPTwm/55mwwxWfLiUSwvYHkGSXfWJ
         pfkiPgFtZ0hQbhP/3gZumtUZ6noqnPRUOUjviiVXsEOpASZRjIcY1n/FYemlHou78hXA
         WGwtJ+sVuaDxrb6/xqStfkxTkj4VjJv6iEaERc/+vXRE/5RdN8Y1t5vp59+PwLSWB9Mf
         YW19GTjw/7t0GdftBCYgv9HRpowSPw8fVRAv2LsFOgESghxwSEV2VKmkMZxe6+vDyXZc
         XmMtUCncGDbd/MCwgvQT4EsaCK5e1t96y9wy3gCDmGJ2x/ih7OonXxZx9FYXKhp4HRcn
         Avdw==
X-Forwarded-Encrypted: i=1; AHgh+RoRDKLuu3tPQX5vVWvyi48r55Z8ldT9k+TXQ//hTjCNaClPjQ6s4awCT7+CvPFXCkFL/zJdmwjF4HaydDKo0gGo@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuoq2nyrjnfPhdcJrQvDGu1NKinIIYldn/3cqg983K6KPc0RBo
	yVZest8ARin67dVYdsGrg0+32vYow15lzmiHzDc29Zx2kRbkIxS3gcGUeFeE0g+hTw==
X-Gm-Gg: AfdE7ckMZ9V1kLGYfHwxJ0Lu2xtixDf3WeKoHEVM3Jf3PPSMCRhPX7Q8Y7vCZaXOqCa
	COUAbVCeal0h4omOvrQbEH0xLC//JQGu57ANG8kgTYqiVgwMR5FFzYwqc7G9UBpkYUT7suQ6N3o
	Hl+VLlQ8d4lfXdZC7obYOxIE8h8A7D3nNbfKhRqi1d3ZD9yh0SE+uMR5o9hu06tjAAADTyYm1zK
	KoeiXd3sRPV2ZSx0OwX1GMbKr/RmkuN8jAVvO0vnyNXtyLQ72cWNg7ovAowt6nXiVe+IeLUrmAe
	qbdErrzMsHQwn8F3xADpQGs4EwD/6Z4dOsMNv/FuYrbQA7KAlSJqHCP3m4GLdXsrBkQTZKWT6Rx
	xk+wWzBqDTB6NQDqHq8TOkdS+XU7THzFaOSIG6TxE1hdT5wZ3QlgzOFgDRiN0VeXUU4XJcnWsy1
	sebtI/WPPUnMyLLUQPIP+m5Tl+mKId9UvSwdz1Zm7DBhfTqcwzyjo=
X-Received: by 2002:a17:906:7953:b0:c16:9d11:8f51 with SMTP id a640c23a62f3a-c16b48c8020mr590472366b.46.1784554876054;
        Mon, 20 Jul 2026 06:41:16 -0700 (PDT)
Received: from google.com (137.69.77.34.bc.googleusercontent.com. [34.77.69.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17361fc972sm465211766b.54.2026.07.20.06.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 06:41:15 -0700 (PDT)
Date: Mon, 20 Jul 2026 14:41:11 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kernel-team@android.com, qperret@google.com
Subject: Re: [PATCH v2 14/18] KVM: arm64: Use noclear for PGD in
 __pkvm_init_vm error path
Message-ID: <al4ldxSPH2MJKJcD@google.com>
References: <20260706175415.2604046-1-vdonnefort@google.com>
 <20260706175415.2604046-15-vdonnefort@google.com>
 <CA+EHjTyFavaVQ=bmo=1s9LgDVQftdsCELUudSza1ARZCJo+dqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyFavaVQ=bmo=1s9LgDVQftdsCELUudSza1ARZCJo+dqw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_064118_610015_86AE1AE7 
X-CRM114-Status: GOOD (  26.32  )
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

On Wed, Jul 15, 2026 at 01:09:12PM +0100, Fuad Tabba wrote:
> On Mon, 6 Jul 2026 at 18:54, Vincent Donnefort <vdonnefort@google.com> wrote:
> >
> > In the error path of __pkvm_init_vm(), use unmap_donated_memory_noclear()
> > instead of the clearing variant to release the donated stage-2 PGD back
> > to the host.
> >
> > This intends to eliminate the clearing variant of
> > unmap_donated_memory(), as zeroing the PGD memory before returning it to
> > the host is unnecessary in this failure path.
> >
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index d9ab58226889..0c82f1ddb93d 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -861,7 +861,7 @@ int __pkvm_init_vm(struct kvm *host_kvm, unsigned long vm_hva,
> >         kvm_guest_destroy_stage2(hyp_vm);
> >  err_remove_mappings:
> >         unmap_donated_memory(hyp_vm, vm_size);
> > -       unmap_donated_memory(pgd, pgd_size);
> > +       unmap_donated_memory_noclear(pgd, pgd_size);
> 
> 
> We spoke about this in person before you sent the series and I thought
> it was ok. Sashiko's review made me doubt at first, since the freed
> blocks carry EL2 list_head pointers that the noclear variant hands
> back to the host.
> 
> You mentioned that the mapping isn't secret (later when we discussed
> Sashiko's review in person), and I checked: kvm_compute_layout() runs
> at EL1 on the host and rolls the tag itself. The host already knows
> the PA of every page it donated, so it can compute those VAs anyway.
> So I don't think this is a real leak.
> 
> However, this relies on the pool and hyp_vm both being donated
> linear-map memory here. Once hyp_vm moves to hyp_alloc() in the
> private range, the free_area anchor becomes a private-range VA, and I
> haven't checked whether that's host-derivable.
> 
> Given it's the init error path and not hot, clearing costs basically
> nothing, so I'd lean towards just keeping unmap_donated_memory()
> rather than reasoning about derivability.
> 
> What do you think?

Happy to not take any risk and to drop it. It was just an attempt to simplify
the code anyway.

> 
> 
> 
> /fuad
> 
> >  err_unpin_kvm:
> >         hyp_unpin_shared_mem(host_kvm, host_kvm + 1);
> >         return ret;
> > --
> > 2.55.0.rc2.803.g1fd1e6609c-goog
> >

