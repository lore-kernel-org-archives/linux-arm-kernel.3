Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21873C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 10:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hd6rXiOBPeBRqy+UZln4kdfreIy7HXtQe2f2tk4TaUs=; b=DRW5RhfH86g9851cbAK5DONqpV
	DMXhHb8DhjWU5H5V2dERoNuupwUw8dDBEJsx3M1ZrItlYe9ca0vHwpmPz5n09HkrrZ3JS+Lxss1gz
	0FTtbbADXauk/LSqfnCpI34hSwuQbNStbgeya5Mcp/RriA0OUsp5sh7YYcR9U35PD0evgv15IxS55
	WQELH2/KQZxh1TgBVJta2+nkPjX/9MQpoSIKMlfc9pcjXGj1ivGptZMBvUnFKcI7CBpU8EFVqo7Ih
	m+zzng7dc0JwJkEEgbxYBO06ZXpkTaxd3QGLSZfW0UmRdEZg+cGuZwfPBB8VB4aLfDJXWEJQ2/ZCY
	JlJrPRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWXY-00000004eqN-3dHL;
	Wed, 23 Jul 2025 10:17:36 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWCC-00000004aI6-1JNj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 09:55:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-23649faf69fso52891175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 02:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753264531; x=1753869331; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hd6rXiOBPeBRqy+UZln4kdfreIy7HXtQe2f2tk4TaUs=;
        b=G+QZVxfwX1Qn9APD90GyWw0iyG252lmrhYx08YTmQ2cJzSjFrjMlR6Qk0T487XzypM
         lpLcZvW6bSFiwazqg8qABc7H6LL69SqQ46q7NFCiNCOi4vuNwMm5pobKYLmXl4m47Bej
         21emQMXyHCEvAe+fBGAty2EcU25NVWTWCqgg0ppBMCDJDpmo8YHGGcbrxeDtfqFi6LeQ
         TE3XZhpedvBTNgMsYjIuxmn9ppXRGCe4rDfvYqsX8+KGgrCxaOmMMUkhxAvOo5lcR7e6
         1KTrEs7tc4MySqwlGTsRPA9J9a6T2ZU+rf8A9+gT+jC8UNPW7zp+geZldy3fbyB6yERh
         eMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753264531; x=1753869331;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hd6rXiOBPeBRqy+UZln4kdfreIy7HXtQe2f2tk4TaUs=;
        b=flSazQRc3iewBT91AARvOTj0cwiTbG5tIHUbDvCF7ZYkHsOcSQVHPaueJPUdRg2pkW
         B2c1uAKBllZqq7MNQ+lCgfrw5d1tSGJ5AYPfa4CWYdSad13lRkOvdQPXNmkHVR+G6gpr
         vZasNp6QI1fM95Ms1kTG/ZHeix6Y0vNIjRymWDbsQj6Fvww7BOYOdL7z6E5I8ACOQsh7
         62Hqw7jDVtgctQ3vRsZwpbpg3rYQfY8xaoKZI1EzgTFkSlz9DM0qkFs9pulKAqrMFgvw
         t/VMKUnFYQV86U0hikxOHZnsnG5JBCizluQGTAqLXJHQWQEOEaRoQs/hv23/0J2grw4+
         DAhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPOGszSOm9lfVq5fQbAvZ+o5/LRFtNE2dt2NhruZxZmxsTaY2gHoE1C0EQubjqTF/d1e+GRzAXaAdv9szV6EDb@lists.infradead.org
X-Gm-Message-State: AOJu0YzuWJ0LQS6Gg9dJBRMt8GvlaYL2wsKPY4XHa18p7UbWLXix1QMr
	Yego0kpfFhftbaW5bbmqGOBnKfVa/5wyMcwikAbiUbWDCSE7KVkFVkoC
X-Gm-Gg: ASbGncsG6MMxoLO1+8acr2/Bj/oTI7ZLMC9sEpFc+EUrNS/lEiV1s9OWCFztb+MJfkb
	Ru3U96PyVLnMH4tuQOP1a59Zx9uPW6jz7eu+Po6zadTPyW5WcrgEQT0ivdRf9XNUehZYUVE5qfY
	PEYcEI6esqEgumnVr+NtqO3MXhrHThKeFR+cDs9n4Kd/04jRY431paVdtTIb+mIo2nkpoGveqDt
	dmzLz5yc5S7qciPM4nGmCFqGN339C4jsAXmndjoHtPaIYHezQPyFF3lIM0BoE2E7M6ePkbc+Si0
	zDia1MNxtRAoZkwr/PZt6+SLmjuYgM13UgJdfF2xa0d2EMiPIEvaq7doqRLW2smkF/EV7wuDA8R
	8zu+6E9VQyFN3W7WIFoxGkUmlumXmVQ==
X-Google-Smtp-Source: AGHT+IEy80RkSpEFCjt6dLV8dYRTl7/n58WYY/PKqcH07FaexSQyl0nLPqJIfP2mNhzanEi+2lmnNw==
X-Received: by 2002:a17:903:2412:b0:23d:dcf5:4803 with SMTP id d9443c01a7336-23f981cd401mr38148365ad.38.1753264531191;
        Wed, 23 Jul 2025 02:55:31 -0700 (PDT)
Received: from localhost ([36.110.106.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d239dsm93835205ad.155.2025.07.23.02.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 02:55:30 -0700 (PDT)
Date: Wed, 23 Jul 2025 17:55:26 +0800
From: Weikang Guo <guoweikang.kernel@gmail.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: mm: Ensure phys_to_ttbr on pgdir for
 idmap_cpu_replace_ttbr1
Message-ID: <20250723095526.GA1992810@ubuntu-virtual-machine>
References: <20250722082117.1777570-1-guoweikang.kernel@gmail.com>
 <aH-mlN88NrTzahfM@J2N7QTR9R3>
 <20250723024923.GA1884099@ubuntu-virtual-machine>
 <aICh9Z3dsEQj_79y@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aICh9Z3dsEQj_79y@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_025532_357721_C2FE1C00 
X-CRM114-Status: GOOD (  43.38  )
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

On Wed, Jul 23, 2025 at 09:48:53AM +0100, Mark Rutland wrote:
> On Wed, Jul 23, 2025 at 10:50:55AM +0800, Weikang Guo wrote:
> > On Tue, Jul 22, 2025 at 03:56:20PM +0100, Mark Rutland wrote:
> > > On Tue, Jul 22, 2025 at 04:21:13PM +0800, Weikang Guo wrote:
> > > > Commit 5ffdfaedfa0a ("arm64: mm: Support Common Not Private translations")
> > > > changed the contract of idmap_cpu_replace_ttbr1, requiring that the TTBR
> > > > argument passed in should already be processed by phys_to_ttbr (i.e., in
> > > > TTBR format, not just a raw physical address).
> > > > 
> > > > However, the current map_kernel implementation does not always convert the
> > > > pgdir/ttbr argument via phys_to_ttbr before calling
> > > > idmap_cpu_replace_ttbr1. This can lead to issues on systems with
> > > > CONFIG_ARM64_PA_BITS_52 enabled, as the TTBR would not be properly folded
> > > > per the ARMv8.2+ requirements.
> > > 
> > > For the cases below I don't believe that this is actually a problem.
> > > Since commit:
> > > 
> > >   453dfcee70c5c344 ("arm64: booting: Require placement within 48-bit addressable memory")
> > > 
> > > ... we require that the kernel Image (including any trailing unallocated
> > > bytes accounted for in image_size) are below the 48-bit address limit,
> > > and so there should be no difference between the PA and TTBR format.
> > > 
> > > We could probably test and enforce that in the early boot code somehow,
> > > if we're not doing that already.
> > > 
> > > If we were going to change things to avoid accidents in future, I think
> > > it would be better to enforce this with the type system. e.g. we could
> > > have a ttbr_val type that's distinct from phys_addr_t. Even then, for
> > > the idmap code I think it's better to avoid the phys_to_ttbr() dance,
> > > since that has runtime patching.
> > > 
> > > Mark.
> > >
> > 
> > Thank you for your detailed explanation.
> > 
> > As you mentioned, if we can guarantee that the kernel image is always within
> > the 48-bit PA range,then there is indeed no real difference between the PA
> > and TTBR formats in this context.
> 
> Yep.
> 
> To be clear, I'm saying that there's no functional problem in practice,
> and hence the description in the commit message is more alarming than
> necessary.

Okay, I understand what you mean! and this is clear if the image is always
guaranteed to be within the 48-bit address range, phys_to_ttbr will not change
anything.

> 
> Since the conversion is trivial I'm not against applying the conversion
> consistently, but if we do that I think we should enforce that through
> the type system so that missing conversions will be identified by the
> compiler.

For a function call it should work.

> 
> > In that case, does it mean that the conversion of `reserved_pg_dir`here is
> > also redundant? (There may be other similar cases.)
> 
> Yes, 'reserved_pg_dir' should be part of the kernel Image and hence
> below the 48-bit limit.
> 
> > If we already ensure the kernel is always mapped below 48 bits, it does
> > seem safe to remove `phys_to_ttbr`here as well.
> 
> I assume for both instances of 'here' above you're referring to the
> macro below.

Yes, I meant the `__idmap_cpu_set_reserved_ttbr1` macro.

> 
> > .macro  __idmap_cpu_set_reserved_ttbr1, tmp1, tmp2
> >     adrp    \tmp1, reserved_pg_dir
> >     phys_to_ttbr \tmp2, \tmp1    // This might not be needed either?
> >     offset_ttbr1 \tmp2, \tmp1
> >     msr ttbr1_el1, \tmp2
> >     isb
> >     tlbi    vmalle1
> >     dsb nsh
> >     isb
> > .endm
> 
> Yes, the phys_to_ttbr conversion above isn't strictly necessary today.

Thanks for confirming this!
> 
> Mark.

Mark, finally, would you prefer that we introduce a new type to ensure we
always get a properly converted TTBR, or keep things as they are, or perhaps
explicitly state that we do not support kernel images above the 48-bit range
and remove those unnecessary conversions?

Weikang

