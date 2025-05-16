Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9159C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 17:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PUV/bkg4QUBVAIj3GMyPK/efOdWpKA1GWmXkehoUR4=; b=3kOlYAbp0k3/GFLbAoQodyCv+3
	aSHrB5s2fD388O0sqmXjXlittCYI2V6PGSpoU7hTlXjhlbbhnBTI1wl8bTJkWd7o3rHlrFGrBpvOA
	EeoIA7u4X+0c9360fgCt9RtTEZac7xvSfSpqBBr51GnIsYmWqouX1riiKZfc+3lV4MVPdr5fnoqAx
	Zm2b2Y8v8eup2mHvo1atQ7arjHICmfzdk6uyewOvblbGwoSgw0ROEbCaCEK1z1VE2KHSJK3+GVJDY
	qbIzFsAY7HE8YOGcj/957Fid9WvGDDUH3FWecK9NCWzm8VbJMFBodOj8gerKaXIJfrtDr3Dbs3Ccb
	m6auhZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzHZ-00000004EWd-0ctE;
	Fri, 16 May 2025 17:55:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFzFW-00000004EFm-3lly
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 17:53:36 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43cfe574976so15926295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 10:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747418012; x=1748022812; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2PUV/bkg4QUBVAIj3GMyPK/efOdWpKA1GWmXkehoUR4=;
        b=U46Ttn61hL1vzm1RebGteYBniC9ewrkVo62MZqTGNsmAvCwm9/c+Wl4hXgqNWTpxCm
         1doqj5jzN6TW1kNerOm7rQgW1g5MhsqWujhLo4StAcQcT/gvZ4cmcJ1Agsvb6euJyb+d
         LD4lfR0xwt6Hb47TKIFvooq+yqtl4VTsrDtKQGmsJwZpnhGEHcdiW29NE5/9wvgpf4M6
         19pAmr8+ENBNHE5+HWWTUifGRBSfijp9v3PpEC33I6Jv3N8kAiOCjX5VwcncCuBZ8vh/
         cWi0riI5XZW4BN/z9omEhtVmvD1uPlAf6PavPYIZzO0zJ4jWO1ds6tglRajl8Kr6BDVO
         TObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747418012; x=1748022812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PUV/bkg4QUBVAIj3GMyPK/efOdWpKA1GWmXkehoUR4=;
        b=eqzCU0mzFrBqAXQw5ekucL852ZdWg7+nAweFgKXmBfEivg0Q0UWpWf1wg8eEdQmjHv
         93RTtb/D6+qNN2HMbFLocNIIDGkUypRM32M89BPoBkJW1W5+ugySpXKIn+LeCMiXsf7h
         wtVEW3FbW7sK/GgFH2AI5tIgM6UXcq202nQn6e/5zEA7jLQ5io3BEWfxXM8NMsTzJb/R
         K2zEGd1BD9FXkV6b1CkhYXrlQluzMxT+8PPVr8/ZFrfKftpTC7ZWeEQCHIc98Wd4B6Gq
         7K39L+RlGs/NIigGQlyVAxbDUibKr6qKI3lqgy2SrHejsy5YTXkpZgPVWk3RHK+xxmJp
         x7LA==
X-Forwarded-Encrypted: i=1; AJvYcCVbmXXosKtLNJNoNQVMpDRxsfKj6qDiCHp/1qGC7oTIFkVGb42ipDxIrbn6HHjWd5TCqLCVPAREF6B7rApHQLwG@lists.infradead.org
X-Gm-Message-State: AOJu0Yxcwlfl1r8GZZshxdLoIJc9EsUX+2fwlgxXvIKMtho5dC/7B6rF
	YEe7JVJh7dnk9F7Fg7PL4tsWdIv6zWwok+OiABV2CdMw10MCjpfuuQkoZQrIV0eepw==
X-Gm-Gg: ASbGnctjL2oMnhM1+b7huyA3VBJOlZ3gvbrW3xWRAj4UlUn+CZ1jvZ5HKthveZ0rZI9
	G0qy0zQb9fUpWvmjUKwRtYp/KAey3HUuh/qb6GBD2VoZRzrGhJwvQXjfJM6ZHDO/+xbbnt6SbUS
	syf3MTLKEAimPrBf8RKz/ktbEbATFIbDRX9qzc5po8JubG90QQ2586YKJpR79m50yTaOsvIND/+
	5AzQYrv7Wbn1WngQ4qPpW5P9XKH0ytODZPoLiyLf30xtsyIXA9EeArpq5Ljo4iJMDW4qkqxzj1n
	QTTK7YudZ5QS9AhEtxK3L+Qtz0cM1oQctE6+FXkp9qgdjwiFZyZH3TcRHGZKTh4BCetGj4SwARn
	nWgbKjSylTNaHkjrfXH7PHzNrRKI=
X-Google-Smtp-Source: AGHT+IEv0Zz+YAfIIihBgvDHDhxHsSF6QrQSMcho8CQZS8XKX5FCrwPQKgycTnORAz6U0zTZnRbJsw==
X-Received: by 2002:a05:600c:1e09:b0:43c:f616:f08 with SMTP id 5b1f17b1804b1-442fd624854mr45671515e9.8.1747418012214;
        Fri, 16 May 2025 10:53:32 -0700 (PDT)
Received: from google.com (218.131.22.34.bc.googleusercontent.com. [34.22.131.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd50b9b2sm42329115e9.12.2025.05.16.10.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 10:53:31 -0700 (PDT)
Date: Fri, 16 May 2025 18:53:27 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	qperret@google.com, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v4 01/10] KVM: arm64: Handle huge mappings for np-guest
 CMOs
Message-ID: <aCd7l455qd4NmOeb@google.com>
References: <20250509131706.2336138-1-vdonnefort@google.com>
 <20250509131706.2336138-2-vdonnefort@google.com>
 <86bjrsg3az.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjrsg3az.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_105334_934309_FA6F127B 
X-CRM114-Status: GOOD (  22.15  )
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

Hi,

Thanks for having a look at the series.

On Fri, May 16, 2025 at 01:15:00PM +0100, Marc Zyngier wrote:
> On Fri, 09 May 2025 14:16:57 +0100,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > clean_dcache_guest_page() and invalidate_icache_guest_page() accept a
> > size as an argument. But they also rely on fixmap, which can only map a
> > single PAGE_SIZE page.
> > 
> > With the upcoming stage-2 huge mappings for pKVM np-guests, those
> > callbacks will get size > PAGE_SIZE. Loop the CMOs on a PAGE_SIZE basis
> > until the whole range is done.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index 31173c694695..23544928a637 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > @@ -219,14 +219,28 @@ static void guest_s2_put_page(void *addr)
> >  
> >  static void clean_dcache_guest_page(void *va, size_t size)
> >  {
> > -	__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
> > -	hyp_fixmap_unmap();
> > +	WARN_ON(!PAGE_ALIGNED(size));
> 
> What if "va" isn't aligned?

So the only callers are either for PAGE_SIZE or PMD_SIZE with the right
alignment addr alignment.

But happy to make this more future-proof, after all an ALIGN() is quite cheap.

> 
> > +
> > +	while (size) {
> > +		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
> > +					  PAGE_SIZE);
> > +		hyp_fixmap_unmap();
> > +		va += PAGE_SIZE;
> > +		size -= PAGE_SIZE;
> > +	}
> 
> I know pKVM dies on WARN, but this code "looks" unsafe. Can you align
> va and size to be on page boundaries, so that we are 100% sure the
> loop terminates?
> 
> >  }
> >  
> >  static void invalidate_icache_guest_page(void *va, size_t size)
> >  {
> > -	__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
> > -	hyp_fixmap_unmap();
> > +	WARN_ON(!PAGE_ALIGNED(size));
> > +
> > +	while (size) {
> > +		__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
> > +					       PAGE_SIZE);
> > +		hyp_fixmap_unmap();
> > +		va += PAGE_SIZE;
> > +		size -= PAGE_SIZE;
> > +	}
> 
> Same here.
> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

