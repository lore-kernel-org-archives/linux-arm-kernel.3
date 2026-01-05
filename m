Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027E5C79FAF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 18:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffKzN1sLhhBqUNkiha1w3dy/564YXw9eASHrYEoDuBI=; b=NADgba9UyDCWmBeG75UTjWx+rj
	Ygb7wwHkWeaYCRRQwOlkTq3t+KGn1QhEo04auQHopz/CzvROK//zLagNzKoiVbwWmKzQVM0gAV1Dj
	5snwnHFjnueIsyzFSaVCSBtuaACH9NnQMLk0XIyIt3OhjmVzTV6Gl/Av1BJCdmFaHoMXiqnp0YB3Z
	DbxP2Czf5DBNgw8PWMcker2CLcwxrAQOXZ8trPFawLFtUrqVtXPPI03HjAJqMMRA/ZNO4fhu6N6UX
	+k+oRDRkrw1eDa78CrFmW4/vVqBXEmmTgQSXTqTCv8ghw2seEYDaZEdXoXvuX/8evHML2dsc/E7NV
	cNoVkq0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcpin-0000000BwQF-2fkh;
	Mon, 05 Jan 2026 18:54:29 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcpik-0000000BwPl-2IxT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 18:54:28 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4f822b2df7aso2195091cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 10:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1767639265; x=1768244065; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ffKzN1sLhhBqUNkiha1w3dy/564YXw9eASHrYEoDuBI=;
        b=ljkSTfwK3iJccrpaES1SlqiUspI7Aa34zTNSl8B4RxhV11E2w40ZwB9PAycQ1RvvDw
         J8PjI9x7BGbRWAksChPqpElF9iTD9HWy/EaHizNmCNOf73nugy7VcORtDpbUscBCJr3e
         EE3XAsXVhEJw/uF4GdmQ1mWlaregwNTu2N5GMt9SWM4zxGJFP0LDfhpwIJzSuG/tiaUB
         UnmZtIDHJ7/oXkkMwoBp/r/ug6H+bwy7Y25lQXAhxnPV8TYTQAyxk3gP4+9+vMNzL2Gb
         FL91pHWC5fYXRBAKZ362bSP2RxIsltOq47EOSntMl4Xu7R6yrq51E7cSDEr/rXTdCKos
         TNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767639265; x=1768244065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffKzN1sLhhBqUNkiha1w3dy/564YXw9eASHrYEoDuBI=;
        b=Ex6aUvapDc119Bo3qcsO0zRC8RDJd+x8ENVoGYf23d5nUDhYrI2XKvuKFNxlSqU7aj
         cghl2JQ+8qUVF7jPtqtcljySR6/s8LTi/6lXYDn//mfJhONuxZTsYI4O5cZIazwZwpOr
         692sigJHArPdyVvmJBMlAwAvhaJePnfCZauOuEg6ZD7cVMHw2BmotPsqW6XE4CqF0YXO
         sKMUEYktlG8AKtqYovVlbxCAYyFS3TPT90KFstf8EEXsOCYaPHtvUnzgPyWW+PL+oKoV
         XGCtrWJMSTpdbHGL4Vq1BcP0ZdHLr/52UpR2kUvu0evIfbCSoj6eRR4owy9MUkunY59/
         OFvw==
X-Forwarded-Encrypted: i=1; AJvYcCXAn98GWR2S37CKYEeg7oWX8JCZ44FaZ/UdcgSzh8GTB+VmiRsC7/4fIFiNW0CiFAYKR8H3h3H8CF9Sh/crr88I@lists.infradead.org
X-Gm-Message-State: AOJu0YzTNvO3xWFFtYfTCQMwiNB5OIdHXgLzS+4z6OIeNaq8gR7JOYAt
	J8IB2/zWA1GHCsobfqqdRQFoGCmM+IxbWQlXyazX6dHary0PTvOgjZS/iF6orqbSB/Y=
X-Gm-Gg: AY/fxX7TiSyCdpPknNuZaBwLndSo/lyL9Y0Dvrr6dsScixAKrgOKBXMnsTbj08mRcGY
	QzRFNStDHSVM+joCHGtab8a4AxaMm1uLeARLoX2x729kOiv6QeroH10aytj7nHuAQmG8GNNq4lv
	M1pNBA940S93R+6vZXODROkrzLOKFmIf0x9qj38/8D3OY3zsaPiMFSrjfFjfajg90Jk2ysweQO8
	BKAFMJN0L0xD+SM0jB2cT7/dWkoUqv10GR7ctzErROduzn3/zRGJPikq8irsL1+1B6w3DS6B0Zx
	srmiWdnTNROL03jSfx3OqH2jaVyTgo/VLFHDnU2chjLh+TICfxUotniacqBda9+1sJxojbl8T5x
	zTamxYehHfvKkPvQIFBj+4YC17dr+RQ8Oe3a06umPt0zAUBuIx2mgVK7HiLKBwRyzHEwm0YAZmF
	7RKG5YWRIMP3+D3HF7U+rSCgbh9LUd8nmY4U7+cKHkxnSJdNhlEXwRdN4pXB1HOztydwI=
X-Google-Smtp-Source: AGHT+IFPnEh+/aHLidYNOpkwlSqg6n9Ja4S07lmjAzoYGYdPvIKU/oQn/q1c0tGHGXl/b++dfA2K6Q==
X-Received: by 2002:a05:622a:303:b0:4ed:af59:9df0 with SMTP id d75a77b69052e-4ffa77f5e8fmr6419151cf.40.1767639265008;
        Mon, 05 Jan 2026 10:54:25 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa71fc4bdsm3676911cf.31.2026.01.05.10.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 10:54:24 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vcpih-00000001C7Y-21aN;
	Mon, 05 Jan 2026 14:54:23 -0400
Date: Mon, 5 Jan 2026 14:54:23 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Dawei Li <dawei.li@linux.dev>, will@kernel.org, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, set_pte_at@outlook.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Maintain valid access attributes for
 non-coherent SMMU
Message-ID: <20260105185423.GI125261@ziepe.ca>
References: <20251229002354.162872-1-dawei.li@linux.dev>
 <c25309d1-0424-495e-82af-d025b3e6d8c8@arm.com>
 <20260105145321.GD125261@ziepe.ca>
 <f253d6aa-1dc2-4b1a-85df-f43b06719c04@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f253d6aa-1dc2-4b1a-85df-f43b06719c04@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_105426_703320_3AF8794F 
X-CRM114-Status: GOOD (  22.09  )
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

On Mon, Jan 05, 2026 at 04:02:34PM +0000, Robin Murphy wrote:

> > It is reasonable that Linux will set the attributes properly based on
> > what it is doing. Setting the wrong attributes and expecting the HW to
> > ignore them seems like a hacky direction.
> 
> Oh, I'm not saying that we *shouldn't* set our attributes more exactly -
> this would still be needed for doing things the "right" way too - I just
> want to be very clear on the reasons why. 

At least I know of HW where the SMMU fetches covered by COHACC:

 * Translation table walks.
 * Fetches of L1STD, STE, L1CD and CD.
 * Command queue, Event queue and PRI queue access.
 * GERROR, CMD_SYNC, Event queue and PRI queue MSIs, if supported.

Have a mixture of coherency support. The SOC has multiple fabrics, one
non-coherent one specifically for isochronous traffic.  In HW some
SMMU sub-units (like the table walk) been wired to the isochronous
fabric, while others are using the normal coherent fabric.

So when it comes to this statement:

 If either the SMMU or system cannot *fully* support IO-coherent
 access to SMMU structures/queues/translations, this reads as 0.

The HW is "partially" IO-coherent, so COHACC is 0.

It has been lucky that so far the incorrect attributes haven't caused a
problem, but the next spin of this HW may have issue here. I'd like to
see it fixed.

> bug per se, and although it's indeed not 100% robust, the cases where it
> doesn't hold are more often than not for the wrong reason. Therefore I would
> say doing this purely for the sake of working around bad firmware - and
> especially errata - is just as hacky if not more so.

Yeah, maybe, I am also curious what is motivating Dawei to do this work..

> the DMA API aspect I mean is that in
> general we need some sort of DMA_ATTR_NO_SNOOP when mapping/allocating such
> isochronous buffers/pagetables etc., to make the DMA layer still do the
> cache maintenance/non-cacheable remaps despite dev_is_dma_coherent() being
> true.

I have a feeling this missing support underlies some of the reasons
why FW might lie and set COHACC=0 as it resolves "how does the GPU
driver cache flush things" with no effort..

Jason

