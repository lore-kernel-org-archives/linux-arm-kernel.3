Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB2BC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqgfejYSVwSnwDj4+nn08kyPi4IgtneNSDWgXEMZ2iw=; b=wNAAxErVBi4UrAfG2+eS7QpHtH
	IK8cfXN3a2fNV4mqJnCiUDqn+gUpM/6lmkIeC4tgTpok5KRiujYhNpqD0UxT4cTziwI9y/6a3S8MA
	ugzcV7bJNOhqucObemxHxnABveA+8GrwjY8OvmALFYtHv1Ky52JNo5pfMn4KaFOCkkmrR6v+rMxeo
	9ZgWN19wtkzpA1NBnI9WRQ4jTDLPxd10h+WDkonu2h3VadDbhrcqQWVxFTivgzlQkaf82f+DGEesL
	IC+lviePJ2qTTi8bE2gstFY3wY3W2buENHxuopHwOTEBfrvH39K3L5PmJKF3EVWK6ptMH0xLBJEDa
	u77LBWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W20-00000006P0g-26EE;
	Mon, 07 Sep 2026 09:52:52 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W1x-00000006Ozl-3ZMM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 09:52:51 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-482dd6ee390so3813102f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 02:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788774768; x=1789379568; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kqgfejYSVwSnwDj4+nn08kyPi4IgtneNSDWgXEMZ2iw=;
        b=bAxHUSn66io4M7oqR18o+XAypw7Bet2Gr32lnNihSXZMFihuEUOcvf+3tQNgFBdgIy
         zvqYveYAs4FgklwqJzN8TtJmWOI5ue4JWoC3NtG7K4+tgFKyNAjkShhC1+wrzED6b2xv
         fSX1IcwXIaeMDEbqoRXcgYnkipGU8yNZSsGRBMb7Iydj+d7saQmvk0nvKpW+EkBAbtiN
         wS+qLKdDaJ9pFzvt+FL41CxuNZF78NWQIfPyQw0DObQ4UgwdxdVmO6/4bnPbOK1qmxEw
         DAWO9fdkBU28XqJEek61md2OUP5GbAA2lR6kXr1YEoLLPBgY7805w7bdr3WY//3rvC8J
         5qPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774768; x=1789379568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqgfejYSVwSnwDj4+nn08kyPi4IgtneNSDWgXEMZ2iw=;
        b=JKEWKhylKgDMsBdiPj3msduM4rP8SSU+J+46fR2PxPmlyV5O/X+AkjsNwZ58YzUBDy
         0sHu+H2g61U6A5DBFoP08sZCzDTI8tAZ5rc0wQGJroehU2w8M6289mW44SpxyBrnwEgf
         qF8RVEzVQdpHdr1+ckGjEXJTBkhLBV9sL+LF9/5GcQqIzU8DSY/UAkfFUlimOI0ruZLE
         b7+TjqFQhyTv+uR37OiiwDdC3PIThNeRGchnCv40+YOQ4R/fdx6zeZPAB+YITtG7/Z7X
         enRNkyH5WErON23tTO3V7o8hvXv4fSSr4xiLM7V/LY4Y1DfflggmibZOmGogciFxDKpo
         9PyQ==
X-Forwarded-Encrypted: i=1; AKwUvByIFkS8Ldy5J6d2fRAMR1WxYFUE19r68UxCAHUo0yZ3Tjjew8NV9ENDqRdlTrYdYdjsaj6ivxNmiNrbQQx+bbxr@lists.infradead.org
X-Gm-Message-State: AFuF++mMgiqSlLbdFG3rgnklmQBA7ntKxjtwJuKktdTQK1u2rZslWn/A
	q9Pi1Drdg4EEhH6khDEK36q1uLLugwJYwumNbXUERmCaCHUWAAcX8R/gtPFRWM+C0g==
X-Gm-Gg: AYBFou3uWvahFPMJTEnNpQNHjnfgMV0JD50jL2OAwuAUcKj0K+l5Dw0wsIk2zvVvVZB
	AN884dVlt1TRdB6uYTyg6Bs6/hMx/Gq7996hZvc48TPPPCsMaGP0FY63xABTbt1NEmzv7ufmryN
	T/4b3kwcus5JSwLa3C4YUIzzhdLdpMSqud6V1klEbE2RNGa60QZDSTQOW4nOyPKDkVLdSg/kxkp
	l/+Zr5Tx9dBPcl2Q7XGUE+h8zOJCYni2eJ1cK95Sm+q4Css3lyr3756zsq5kwrWuXIqSo0jLfPW
	QHf03bVlPwMNR8hPHCGn8ABUjjqIz3e8Qwm0YoGJ6Q1z6YsUBXt7/2kXSW+GRvxciUrwUhU9X9K
	sxkLXXHTWTnCq72y+cekPFgtpkMeHLpGgk3qZaKOgdWgVGmuQsbSC/BB9U4Gx5QUIgVL/qAwAkb
	U5QZ0NDSvPrOST9Dj1NHe6kZKbUYdXvMCsYYhUyqll9IIT9Z/uopsUXS2URrUVB66oz2ToMLjkd
	spxWxC2mDjxAID7UrcXbedbZBVRx24w
X-Received: by 2002:a05:6000:4b1d:b0:485:8c16:a32a with SMTP id ffacd0b85a97d-4858c16a5a7mr19950748f8f.31.1788774767486;
        Mon, 07 Sep 2026 02:52:47 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bf3f0sm30012615f8f.33.2026.09.07.02.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:52:46 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:52:43 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 03/10] set_memory.h: Introduce
 can_set_direct_map_range()
Message-ID: <ap6Ja02S5IDqWRHC@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-4-vdonnefort@google.com>
 <ap3BVr5hHwA499gu@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap3BVr5hHwA499gu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_025249_904810_4F9E853C 
X-CRM114-Status: GOOD (  22.10  )
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

On Sun, Sep 06, 2026 at 10:39:02PM +0300, Mike Rapoport wrote:
> On Wed, Sep 02, 2026 at 11:47:05AM +0100, Vincent Donnefort wrote:
> > While can_set_direct_map() tells whether the direct map can be modified
> > globally, can_set_direct_map_range() checks if a specific range can be
> > modified. e.g. if mapped at PTE-level.
> 
> set_direct_map are going to have number of pages parameter soon:
> 
> https://lore.kernel.org/all/20260903-execmem-set-vm-perms-v0-2-v3-1-949b64a9f755@kernel.org
> 
> so this check can be a part of arm64::set_direct_map

ack.

> 
> I wouldn't expose can_set_direct_map_range() as a public API and rely on
> the callers to "Do The Right Thing".

ack.

Thanks for having a look at the series.

-- 
Vincent


>   
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> > index 3030d9245f5a..88175c3fa751 100644
> > --- a/include/linux/set_memory.h
> > +++ b/include/linux/set_memory.h
> > @@ -44,6 +44,12 @@ static inline bool kernel_page_present(struct page *page)
> >  {
> >  	return true;
> >  }
> > +
> > +static inline bool can_set_direct_map_range(struct page *page,
> > +					    unsigned long nr_pages)
> > +{
> > +	return false;
> > +}
> >  #else /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> >  /*
> >   * Some architectures, e.g. ARM64 can disable direct map modifications at
> > @@ -56,6 +62,14 @@ static inline bool can_set_direct_map(void)
> >  }
> >  #define can_set_direct_map can_set_direct_map
> >  #endif
> > +
> > +#ifndef can_set_direct_map_range
> > +static inline bool can_set_direct_map_range(struct page *page, unsigned long nr_pages)
> > +{
> > +	return can_set_direct_map();
> > +}
> > +#define can_set_direct_map_range can_set_direct_map_range
> > +#endif
> >  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> >  
> >  #ifdef CONFIG_X86_64
> > -- 
> > 2.55.0.970.g62bdec98f9-goog
> > 
> 
> -- 
> Sincerely yours,
> Mike.

