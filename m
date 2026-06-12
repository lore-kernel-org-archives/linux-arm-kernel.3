Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4B4CD4F2C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yy+2xQMR5McOLxiiEQRjJGzs375KERWHEJ+Tzp4rPHk=; b=HXZljJC84FMdk6x0odtH2ab4gM
	rFb2bugFBIX635vItQpjlJpWb4NwUC2uMQuFZzVN527qwGYF80eZdsnBxJf+ezA1tqDW1OhbvH2u1
	se1pHQ2HNu4CSFB5Ag3G+LhqgY1wto5qFw2xovoHXygkpAxx/neb39UzI5y4puNA/M58iJy+KYoyC
	X+BzxWGuCoSDbN6yGAMPYO7cpLclzwna82+dVhjnvuH0bqTF06+beeRCO4SZz6p4g59xFZN8ZpwX9
	FYe08l8Lc7XhaciaEi677vXkOjEIWtLmPxlALCXWiRay5NxHoYM8NgCEzVFoT2YOuRbCIdBIl5Skx
	Ya8js1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxUw-0000000AbdO-0q6q;
	Fri, 12 Jun 2026 08:44:18 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXxUq-0000000AbaJ-3M2a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 08:44:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490b23c828aso34935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781253851; x=1781858651; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yy+2xQMR5McOLxiiEQRjJGzs375KERWHEJ+Tzp4rPHk=;
        b=MDKvq6q6Y0dC43mBobJ/IWXO5ZuBrZlPczrDLTVpNT717I+FnjXGnKWtAX6mBTTPk6
         V5W6lqdebOtTrg0j1byPKg5Ki2Hy8HqwgyeuEVIUbZBHoPDVMPYSGTAWXrvKBre4vBRD
         ipwJ/jGikoPS8gXph8XM+Fjn0zSXl/+OWQw6raRD3p0WX6dmUeWsG/GhhqTTD/jniDvD
         3vB8ArclsPOGRKhSz3sBqW4OGqSY1r4J2YptunA0B22S3T2DsumoJjIgGfiGqaCwwT58
         xTfAt/e3Y6reXJs4Xkl9s2cmXa4KT3w2Z9zdw7Tq5B1A/5zNcYF3D5gLLmkCXfKAJ0oE
         xoAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781253851; x=1781858651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yy+2xQMR5McOLxiiEQRjJGzs375KERWHEJ+Tzp4rPHk=;
        b=lRs1qmGAKFIeLEX6bkEgU6VU2egiyQu7ENJgwpG18SEsDNp0NQiy7LRHPRaRi2Pj9L
         Ki6uqTOoitb36c/LhKBceBUYxEN04NEFQ9DxHw6cgyVy8u++VCzlNSR8nVycBzAHB3oW
         qRkgUhKeP9/V0GGEGv6NCBFRrudD4mahlgvlGcaInkPHMVRrJKPd9D/wd0rK+TkWNIMJ
         ZR7+zG15kTDvjCL51zbc03GVJs/Mifdi+NAS9CooNJFd9PSMuWvKK7UEpRjK6XBVewqV
         wXs90H8YJVxBpzAWiQS035BCJq9eZe8SKaAEum1HtSfSPScqBm0BzVmTN2Orqh8CYqKR
         ttCQ==
X-Gm-Message-State: AOJu0YwpipWU9IEoWW3/Vtuon0xkspA/nYWn+hKcdXuRF8vzxMAskDUy
	y2PZmPkFFhsNv8MnCjmcZGe/fInRLo5pMlT+Detyza3HU1bOM7p+We4fGm5pmZT94A==
X-Gm-Gg: Acq92OEipRJZXFbILE/Q5wgdv+iVzPhhsbxIi6/h7KJ1vf1AkvUGcEZbUmDrnd5xKVu
	hZ8TII2XCE7vQ6i5iYvth8KB/trjFpnWC7l0jfQWhhYRC7HBcIrveNVkdJXFuCDM/yiUknleNsw
	gVnXm8cAvwtDSfWtLyJ10PyfDD3V4U72zBo6GLhw5mldxI/EFlCGNpBauPldJqevUEHGYaRQorN
	NSc3z3oWWZ4m2ovWDDrHIsA8mIRJ9pEDSfGNgacEmTHLChMJi3n35wu5vii6RZbovUxYBf4DSwq
	NugELl2l2vVvY546qiooMIPUeCLGYpfJ/YKaGgIKe+vm2VjxmhEo49L2GeA6v6ZhM4A6v68xqjd
	4u6WouTRMqZaHAoUe0J4D/ujDkmepObaAw7gpMpiE5ZRE2A5brlBzMdtqknMbA1s64RDFZMzZPZ
	NYTSMXgZYKGj+wzFu0zKhJLPtC6gouhCg4MJfAq8oDQb9FKnsh4guQYqXax/+RkA==
X-Received: by 2002:a05:600c:2297:b0:48a:5618:b4d4 with SMTP id 5b1f17b1804b1-490eabcf574mr489365e9.1.1781253850528;
        Fri, 12 Jun 2026 01:44:10 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2d09a85sm126214275e9.14.2026.06.12.01.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 01:44:09 -0700 (PDT)
Date: Fri, 12 Jun 2026 08:44:06 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org,
	rppt@kernel.org, maz@kernel.org
Subject: Re: [PATCH 3/3] arm64/coco: Add pKVM as a CC platform
Message-ID: <aivG1rEi3y4GN8kX@google.com>
References: <20260603110522.3331819-1-smostafa@google.com>
 <20260603110522.3331819-4-smostafa@google.com>
 <yq5a1pemsmuj.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5a1pemsmuj.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_014412_861927_6C03E436 
X-CRM114-Status: GOOD (  24.41  )
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

On Thu, Jun 04, 2026 at 02:29:00PM +0530, Aneesh Kumar K.V wrote:
> Mostafa Saleh <smostafa@google.com> writes:
> 
> > pKVM does support memory encryption, expose that to the rest of
> > the kernel through cc_platform_has()
> >
> > At the moment, all devices inside the guest are emulated which
> > requires its memory to be shared back to the host (decrypted), so
> > set force_dma_unencrypted() to always return true.
> >
> > Although, typically pKVM guests rely on restricted-dma-pools to
> > bounce traffic, with this change, it is possible to solely rely on
> > the default SWIOTLB for that (assuming the appropriate size is set
> > from the command line)
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> > This change is critical for the ongoing refactoring of the DMA-API[1]
> > that will break protected guests under pKVM with this patch. That is
> > due to this rework will make the state of the SWIOTLB and restricted
> > dma pools depends on the value returned by cc_platform_has()
> >
> > [1] https://lore.kernel.org/all/20260522042815.370873-1-aneesh.kumar@kernel.org/
> > ---
> >  arch/arm64/include/asm/hypervisor.h           | 13 +++++++++++++
> >  arch/arm64/include/asm/mem_encrypt.h          |  3 ++-
> >  arch/arm64/kernel/rsi.c                       | 12 ------------
> >  arch/arm64/mm/init.c                          | 15 ++++++++++++++-
> >  drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c |  3 +++
> >  5 files changed, 32 insertions(+), 14 deletions(-)
> >
> > index d66291def0f4..26fe9c3f22e3 100644
[...]
> > --- a/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> > +++ b/drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c
> > @@ -17,6 +17,7 @@
> >  #include <asm/hypervisor.h>
> >  
> >  static size_t pkvm_granule;
> > +DEFINE_STATIC_KEY_FALSE_RO(pkvm_guest);
> >
> 
> Do we need EXPORT_SYMBOL on this? 

I was not sure about that, all users of this are in tree, I saw RME
code have the EXPORT but did not know why?

Thanks,
Mostafa

> 
> 
> -aneesh

