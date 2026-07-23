Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950ADC531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 10:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/eQ6xVtZwAc2g+MA5ARGSiX1QKgpSyLscWz0B+I2Ks=; b=WNzmWkZPhjpl4BLqCBtbjLibO5
	q/rXwAk0H6vWL18KAjt/8VKbpAZht8MngOCKiCpWfo6dSaft9zHa3o8nW0S3rpDF4gTs09+OWswV1
	uErtf93T8DP32VrQ7R7rj1XvfrU6H0urkD7TbUIIxJ3lDW3NMEh+yMU1ZmihUYg+0FAZCnhXM5MJn
	WtjMj04vN0vLW7Ygh0L41lDwNyGGMUuUsAPqmTTfJRoEF7lneJqdFdBvHhQvYLSPRDkrh011V0hjP
	QwuuB2WraLGdONRsyptgG54+YTSKx/FNoTX/ydO8fPyoA1lQLhLpLbr9yB51uk5P0cEurZrkQrGV4
	QvpxRtSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpTl-0000000DoZg-0M4l;
	Thu, 23 Jul 2026 09:12:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmpTi-0000000DoYk-42Pv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 09:12:32 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-495509b08ebso30595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 02:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784797948; x=1785402748; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L/eQ6xVtZwAc2g+MA5ARGSiX1QKgpSyLscWz0B+I2Ks=;
        b=BaJhsRdtHOqO8Yldfm3khSJxTj9WeRV59aGv20FcMH0GpW+4MzNdVMfEWToZzLplAd
         ZoDagvsw4uZfEDN2Og+dVr2AHp4LrgWrR3KlgwEz0Jg6rdvtXgxGd2zjgT4a+LPHlhUG
         nmijjhfbiMrfWRumaMTKPdpTN+yKVxZZOCDrzdUirwr4ioLj28aOFx0vlENaRj0cBDOb
         17pk1luOirzVhoTA2c4cSTdYOjOlBfSu+ECGPijPPRYsF4uX9bKpcKruOCTddJ0W0MIB
         lTUDa/zW+r79qepxu4U0AreOJcybKN7ylWoKMPOu+gY7yGcqz3YN6DjzbWBnmyB/5+TP
         7MPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784797948; x=1785402748;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/eQ6xVtZwAc2g+MA5ARGSiX1QKgpSyLscWz0B+I2Ks=;
        b=Jvq+kjgB4GDHSG6CYh/8fR6Ou5h3jNhG5Dj/4wsM4tBaebX4L8yOEfhR3nyvgUvKRE
         Nme2X8Wx/+BwxZw12iyFQnxreE9ucya1Qz8PVUibDY/g2wDCFtEUYP6wY7Ax59dzC5o3
         qmmBrGUuCNnr7Iwv+2hPvymn8mLp/lj/ZDZnpH0JE5wnr4NOrsvq9A8ZkwafBkRNAMhI
         iBaspzrDSrC01WKjHDBiflpZq3HdSkmDaExLojEszkRmqJb9zoMk4ka9Qxs6S42u2EvK
         ZSj+0qx+OfRzj4JPhUfTDr8dg1UgD/B9B1SJhOWFF7hbL6x7FyBLDt/IA5Yysic5LBX3
         bHKg==
X-Forwarded-Encrypted: i=1; AHgh+RqWR4LQQPoeQX7PVupjsInljSg0AdCFt20dFvtoH7Vk9gVYY8E85mmv2bGIQXkk4Tv7zH4YLFYIp4smmx2RwtfJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7vxs+F9+LnPLhPVYrTiSAzFPTsrFu2EU7fhq3DEpExGMWjVBD
	TGGf2UFzOBpi82kFB7k7qDRJMlHL/QrLcBzBK89t7RWBKtrt1B264pPhT7eTS2EMYQ==
X-Gm-Gg: AR+sD10aPxprT9eL2b8iSsNGkaGNFvZAk6Y/oX9jS0+MtWbOrt8q6Gj3OFbV4Lq9o8P
	OKkH3cI2R20eqMTUYLKteX+H4XPiyrAwyuG9hKkWHYvM+XL02BDoCDxYbAJF0/GruEpHU01soGO
	p4EKXOlxX5HbFjHX4qLHNPB2dfC2UMSYjNeV/45k6KyTC1i46TDKRSX9A9dH7mEViAo5b7IZcHS
	Zx76tSY4RWdkARpsaM0rKqBKsDMy+ZqHPaTCIuGG1bEo5iYOk02NI6kk6u3gV1H0pBkcPb1gRHT
	nOrI1VnLfUvwbrfF4A5sbStZpwuF0Ie/7rkM1soZQf8pOI0wvJbc9SbkimrnCIfoHriOD+I96pM
	eaJ2/OWN/O3e1+WvkuH4Fp3ZaBegCkPVecktsOpKcFSvTzPxWN0zGa9/VID5W08buTJe9UbAzyR
	PrNPXxOZ2P6rMtNuP6hhi8Y2+W/u+FUfryPrG9Xw==
X-Received: by 2002:a7b:cc96:0:b0:493:aca0:32e2 with SMTP id 5b1f17b1804b1-49573865b4dmr866465e9.4.1784797947324;
        Thu, 23 Jul 2026 02:12:27 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm13122369f8f.5.2026.07.23.02.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 02:12:25 -0700 (PDT)
Date: Thu, 23 Jul 2026 09:12:20 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	oupton@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, vdonnefort@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v2] KVM: arm64: Optimize protected mode and FWB
Message-ID: <amHa9P8FwqTqVgs4@google.com>
References: <20260721085646.1660673-1-smostafa@google.com>
 <86y0f4ejr4.wl-maz@kernel.org>
 <al9HqhO6sp3FFbtQ@google.com>
 <CA+EHjTwp6gQDjL5uE+aAJ04yRnPgvABgBaBWe44hyVSMXGQP9w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwp6gQDjL5uE+aAJ04yRnPgvABgBaBWe44hyVSMXGQP9w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_021231_023529_C29244C2 
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

On Wed, Jul 22, 2026 at 12:51:35PM +0100, Fuad Tabba wrote:
> On Tue, 21 Jul 2026 at 11:19, Mostafa Saleh <smostafa@google.com> wrote:
> >
> > On Tue, Jul 21, 2026 at 11:10:07AM +0100, Marc Zyngier wrote:
> > > On Tue, 21 Jul 2026 09:56:45 +0100,
> > > Mostafa Saleh <smostafa@google.com> wrote:
> > > >
> > > > KVM opportunistically enables FWB if supported by the system for guest
> > > > VMs, which allows it to elude cache maintenance for data as they are
> > > > forced to be cacheable from stage-2.
> > > > In that case, __clean_dcache_guest_page() will immediately return.
> > > > However in protected mode, before calling __clean_dcache_guest_page()
> > > > it loops over the range and fix_map/unmap it, issuing TLB
> > > > invalidations, dsb() and isb() unnecessarily.
> > > >
> > > > This can be optimized by returning early if FWB is supported,
> > > > kvm_pgtable_stage2_map() already issues dsb() and tlb invalidation
> > > > functions issue dsb() for the unmap path.
> > > >
> > > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > > Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
> > > > ---
> > > >  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > > index 4e329e39a695..049a09be2bbf 100644
> > > > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > > @@ -261,6 +261,13 @@ static void __apply_guest_page(void *va, size_t size,
> > > >
> > > >  static void clean_dcache_guest_page(void *va, size_t size)
> > > >  {
> > > > +   /*
> > > > +    * Guest stage-2 uses FWB if available, making it safe to elide CMOs.
> > > > +    * In contrast, the host stage-2 never has FWB enabled.
> > >
> > > Beeeeeeep!!! Since a373930ec9406 ("KVM: arm64: Switch pKVM host S2
> > > over to KVM_PGTABLE_S2_AS_S1"), FWB is enabled everywhere when
> > > available.
> > >
> > > Not sure that changes anything, but the comment is factually wrong.
> >
> > Ah, I see it uses KVM_PGTABLE_S2_AS_S1 in that case, that should not
> > change the patch, I will need to update the comment.
> 
> Sorry, this confusing is partially my fault. The original comment in v1
> 
> >  /* See __clean_dcache_guest_page() */
> 
> wasn't very clear to me, since I wasn't sure what I was looking for in
> __clean_dcache_guest_page(). Talking to Mostafa in person, he's
> referring to the comment _inside_ __clean_dcache_guest_page. I think
> the best fix is to rephase as
> 
> +  /* See comment in __clean_dcache_guest_page() */
> 
> This would save duplication and having to repeat the comment.
> 

Makes sense, also thinking about this, I think we should do the
same for invalidate_icache_guest_page() and ARM64_HAS_CACHE_DIC.

I can include that in the same patch.

Thanks,
Mostafa


