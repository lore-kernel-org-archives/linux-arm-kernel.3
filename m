Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2738BCD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 17:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aXTVKb/2WU7jKg8xUh4R5z6ws8fziXO1fuL1081Mb7M=; b=ej06EE9Sjy/B6G9Wmv+83djNsq
	CmHg7AezSkkmYRQj/aPpdzzoRrXrLbSXMoG46Dm/I3RtVnhHbgvLPNX/vDCLrJlOf91DPtNLqiGuZ
	uVsDIrXdGY2G0rao8GGTDN4L5MkrB+g/VoYlhV5AtVmhOV7rMFhPELJRrU10eF7o1MTUvlEXJhKSM
	5ljmi5x7B4esRQU6QGLNBiTJQ9jcy1mwj08S07TQ7VTjWlhKAeQjrieJJz552axU/z3nLT583HJJy
	EClmxlODVNnFMo5u3YlPal8cOIS83oj2+30goKcUlfo6HepfE9ccVrZ6TO7gEeTRI1RbYC1zWkOkZ
	2idIXZmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP29A-0000000GRVv-0vjX;
	Mon, 18 May 2026 17:52:56 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP297-0000000GRVG-2kfC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 17:52:54 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-8b821f39a12so29754556d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 10:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779126771; x=1779731571; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aXTVKb/2WU7jKg8xUh4R5z6ws8fziXO1fuL1081Mb7M=;
        b=C0+bmNORosPLGbqiDVMB936jhhMzGP5YmEvHVdQnR2D3oa43AF+Ive8lAhhcuDaVbw
         cto6l/x6IoZX9K40KIKCYH6yfrCwvvQjCt+EvLf6jyAlGAHqfSXGt3M3L/3jeFa1R1pW
         0ZRmU8v85OW0DgxJnRRv6kxxTzpExrLWQ3FyXYO2uAC9RPxrkot89dT/oth9hXYRQ5X8
         /VYpiaGLLk6IIhy2C9JgVFp53Qcz378GweXx2RaUAkqZpRKxPrIkO0srcRWGaZI2GIKX
         HuJMwWb7XCI/wfvSXEO8MoEaird7w7bQHWzJq5Ftdzfd9gVeZVfYXdXtOYtMue1OIqCp
         WPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779126771; x=1779731571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aXTVKb/2WU7jKg8xUh4R5z6ws8fziXO1fuL1081Mb7M=;
        b=Iybe6Tl1LF6cjMIZRMMTJZsuA6sP//fDaWFeZqjBapckdHp0cbHQgBCnpj2+A76PS3
         /Z5Zruvmt25qsXOgxyMzIO/w+BZnxoVkrFGXB9vlsRd6ovctPVmfo3b8vAHUJ/S1E5oI
         QVCLLIgZS2kTzAu3pf1DEE3SlFks+wt3jR/+a9lg9ovfEiSvdrUifuWnGIKrNB/oGbCc
         NJ2r7U+sE5AJeGAuYIxl7J9DcWOtOOzP4EvGmwlYWkjTDfeGcPmaKU6h7pws27BQe38Z
         GsCUsJCtsbwi9AeFr4x8l3RCDp1V+KIslpcWU7QOnKSoenYiyj15rLI73ltgNVuWDR4e
         mx/g==
X-Forwarded-Encrypted: i=1; AFNElJ9UA7d23DexLMFqpppya5Gcw2G6hmbi4K3GNKS6dFJJ9+0bbAdnTVRxstNFcuVaUCUJtjPxhje7nylgst/X4OeZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxCs9BnKGb3igbfflwB8SmChOCstdxFAhQfLjvMttDZIwjDkS1I
	bh9UUPkIetGtEOra4X02gZ/DgL9dTUMp87BwKjIKimiSr/EVXaQgjh4vyPtBZYjDczo=
X-Gm-Gg: Acq92OGxk3SshWat3EfBNn1CHd+mblo7Mr3YFnUP0sn+6TWLSVPsrK8MDTrc/YwPPqO
	69um2ydr6CbaKLNslVimJhtf3oND1LtdDb+TIvaJRfQWkv0uOKQ7J9TRZAgU+6ndkoNxKlTyVot
	mAYITNabcagV8QoD0OvitJ2cF0nFkncpYdfVtTuJQ3Ewsq7oEUALwsP+fv+YOpQ7Huhj0TSmO0U
	+aCf/02W42WNO8YgptGdnC6YBIFQsxCJS7fn+pp20Fb4X9SXzYCpdfecrvD3Q+VBG4Qjc6UByrb
	CrkOFa9+lJSR1lDsHM5XyTMYfn1Gyfvd1oIrCqu89L0DqCy8zW6jCmae+S8hVlt1Dy6iy59jwYk
	zGOhPGRaA35NZAA2MAc/0IUdoIgaE2fcZ7kYSaO8oLd/MVHdoxYBDiBmMtdZgAZFBGUjCnRABK5
	beg7JeSOFE/TDskVW7oHkLENTHKQTZF4D9vQjrfHLhuIdmL8h8kqxRZLa6wtFYWPU3L13O1C5nu
	4zkfg==
X-Received: by 2002:a0c:f109:0:b0:89c:cf63:438e with SMTP id 6a1803df08f44-8ca0f5f236bmr214082166d6.14.1779126771326;
        Mon, 18 May 2026 10:52:51 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca36086a61sm63262406d6.4.2026.05.18.10.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:52:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wP293-0000000DUnE-2ZCv;
	Mon, 18 May 2026 14:52:49 -0300
Date: Mon, 18 May 2026 14:52:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Joonwon Kang <joonwonkang@google.com>
Cc: kirill.shutemov@linux.intel.com, Alexander.Grest@microsoft.com,
	alexander.shishkin@linux.intel.com, amhetre@nvidia.com,
	baolu.lu@linux.intel.com, bp@alien8.de, dave.hansen@linux.intel.com,
	easwar.hariharan@linux.microsoft.com, hpa@zytor.com,
	iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com,
	joro@8bytes.org, jpb@kernel.org, kas@kernel.org, kees@kernel.org,
	kevin.tian@intel.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, mingo@redhat.com, nicolinc@nvidia.com,
	peterz@infradead.org, praan@google.com, robin.murphy@arm.com,
	ryasuoka@redhat.com, smostafa@google.com, sohil.mehta@intel.com,
	tglx@kernel.org, will@kernel.org, x86@kernel.org, xin@zytor.com
Subject: Re: [PATCH] iommu: Allow device driver to use its own PASID space
 for SVA
Message-ID: <20260518175249.GS7702@ziepe.ca>
References: <20260515231808.GQ7702@ziepe.ca>
 <20260518090654.730478-1-joonwonkang@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518090654.730478-1-joonwonkang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_105253_770151_09D45073 
X-CRM114-Status: GOOD (  25.54  )
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

On Mon, May 18, 2026 at 09:06:54AM +0000, Joonwon Kang wrote:
> > On Fri, May 15, 2026 at 09:46:05AM +0000, Joonwon Kang wrote:
> > > diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
> > > index 0ca3912ecb7f..61e2e52105e5 100644
> > > --- a/arch/x86/kernel/traps.c
> > > +++ b/arch/x86/kernel/traps.c
> > > @@ -864,6 +864,8 @@ static bool try_fixup_enqcmd_gp(void)
> > >  		return false;
> > >  
> > >  	pasid = mm_get_enqcmd_pasid(current->mm);
> > > +	if (pasid == IOMMU_PASID_INVALID)
> > > +		return false;
> > 
> > If you do this then probably you should get rid of mm_valid_pasid(),
> > mm_get_enqcmd_pasid() already has the NULL check so the two functions
> > are kind of pointless.
> > 
> > You also missed the other place calling mm_valid_pasid() that should
> > really be sensitive to this as well:
> > 
> > static int prctl_enable_tagged_addr(struct mm_struct *mm, unsigned long nr_bits)
> > {
> > [..]
> >         if (mm_valid_pasid(mm) &&
> >             !test_bit(MM_CONTEXT_FORCE_TAGGED_SVA, &mm->context.flags))
> >                 return -EINVAL;
> > 
> > Make that removal a prep patch
> > 
> 
> Thanks for pointing this out. I think mm_valid_pasid() is to check if SVA
> is currently in action while mm_get_enqcmd_pasid() is to get the PASID for
> "ENQCMD instruction execution".

> Since it is now possible with this patch to activate SVA without involving
> EL0(for ENQCMD-like instructions),

I see, this thing about which is about LAM should remain, yes

But all the "EL0" machinery about trapping and enabling ENQCMD should
be moved over to mm_get_enqcmd_pasid() and never call mm_valid_pasid()

Jason

