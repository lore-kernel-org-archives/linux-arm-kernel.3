Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58EF6C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 17:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFurqnYI+L7RUrkwAcAgkoscsXJUHEF+OS7OBiZvdjs=; b=f3yLE9+YpQjN/y26Hb5Ca7rvbw
	4hpqVpRr4ndQ34ozi0SLquJAe6mG2eyU31xroDflVVNqLtbiWjVl4BdITAGS/1fJROr5FZVAeV7a2
	hiCyK4FKyoWqazyFp2zUynUpqXFg/8cni1/J+NWXBF2NK2oRYKN0zchs35Okxi0+NC3BdE7CZKKnp
	KmEu5n2TsADVqZ7gCqF2aVtABtZUZew1t2aIwU1JcVK2ERMjx+m4mQsmXOnzu3sQhF3pAHZjaom39
	8Dr7YIee+Eu/1du8U3Tbp7lEWnohcnSExGKBkn54GM9ylvwVi4YkiY4qUCELLk9n57BPib0gMpg+f
	7f8vt5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSfDJ-0000000GCRA-0Fz3;
	Fri, 20 Jun 2025 17:07:41 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSehs-0000000G96r-3l0f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 16:35:14 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4a58ba6c945so34771211cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 09:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750437311; x=1751042111; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hFurqnYI+L7RUrkwAcAgkoscsXJUHEF+OS7OBiZvdjs=;
        b=IRnTr6oVb/I8aj8jQUfaqanV37N/aQwOHD2BOyJ3TBywmR/C/BrsrJCY7jiynTJW/F
         g1AM8bPHLrtmgF3UqRydfF+/As2C7uTLUEu5wzQ3M2G+GQHO9ORvvzw/4DoxLlj4X0Kp
         yQf5xIWfPbTJc/dBcCwUThD4JQDDgWHc6WuuT7bLo0DmwSUaoc1atDIcoX6TMlowHxDU
         +XJ5K745d9eGx+JgfWTmcUweCbHCCCzsWkZtpIXaV+kzANe4+1xImcJCSpMMyCSJPcir
         Yp2mWvvZNeRygGvtD5YAX5exaqZteUYF05AiI/9y3mvnNrYigYcqZiHzjBtnClysqw2T
         ORPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750437311; x=1751042111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hFurqnYI+L7RUrkwAcAgkoscsXJUHEF+OS7OBiZvdjs=;
        b=CLyWHtD5wJqg3REslTpenvKCi34pvRuTQLOosn+lZ+0ytOFwxVJL+ylU65mSUlqiRj
         t/eVjY0ER96tEFgu+ZPuqhsDRsXvsP3tDfguaSeT/g3C+UVEZuSZ+3CmoOEOfWeqbEt4
         tn1Op64KzPyUcKIEBdxSw0CV0lyd9qo7OKYzwPzYBgF3+i6Vhp8qXPGZIF1wT8Yt18K3
         9SZnkpl1XMpaMlLaDvrOAQGlJKzp8uGK+H1jILs2it6DUThPNZhYRTvAM1LSA/DH4f3Q
         u1dTi4CRHP67m2rbTzoejmXI1erixUYV73Bmh6NsuKEpFjIlvAbY/DPX8QmwgDIN5gJG
         CN/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSlEegESyggkOQvbAWHEHLJ6m2xJueAkS2s2CwHgE2+kOOMfFQb3DhBz/VekQW4aWReSLTVe9GkYzgDZsg3+CA@lists.infradead.org
X-Gm-Message-State: AOJu0YyjcmTWNKRL3yu51QTxpWxggId3X1Jw1jVw1eO/rxIHedUtiohH
	exHqNLFmQNBVm1iCcViKRjmQbPf8+BUl/9/lXQU5QeG9J4n/4nCi0jeyuIXgeRV2cJoU5S6uiJF
	LQ8WI
X-Gm-Gg: ASbGnctqEWQfail7zWic8d3lzzOmoIpXXZdYp2yWn0r70iXLMQljspJMDmNY5cVi9GL
	56jXvnQos1o9cVuTYJW4rJRKB11xsQWqf8L/UDSaI8LGX5Vs9FtJg6Wa5yiW1+ycGInMaUqKnYc
	/oNhqwG91oTWjTUrQejQk6kUkx88aBagilyFO4yugyXnqVLGrNOB0FOYr2HkK4m2BTdiz5RF7Ys
	AEYVUjlfXm8HJW9VH827srwB9GuRe3nusYLaM6A0LPHa3YnqwS1ab3k9tDh7XACsENS/541krqF
	+CcQpsAN0sRa27D2sw02KkSNjg7H2LKyj1shzR4IeO+YFg1k/FiXBreNhGc5aPJbis6QduQ3PKN
	3a9bVIlJN4somlrOUx+nq+nDPrUTZzMwrhE+QRw==
X-Google-Smtp-Source: AGHT+IFA6k631lKxrYTYm+6L/JASXk2MoP+urHg89b8SmimDGgONLFl8B84S2EQnZ661ul3HBMs1NQ==
X-Received: by 2002:a05:622a:1307:b0:4a7:2357:dc81 with SMTP id d75a77b69052e-4a77a23abbfmr54566761cf.3.1750437311156;
        Fri, 20 Jun 2025 09:35:11 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d9dbfesm10698501cf.36.2025.06.20.09.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 09:35:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uSehp-00000000Es0-48hW;
	Fri, 20 Jun 2025 13:35:09 -0300
Date: Fri, 20 Jun 2025 13:35:09 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v3 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250620163509.GB39770@ziepe.ca>
References: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
 <20250619131232.69208-4-benjamin.gaignard@collabora.com>
 <20250619134752.GB1643390@ziepe.ca>
 <073ffe14-d631-4a4f-8668-ddeb7d611448@collabora.com>
 <20250619165928.GA10257@ziepe.ca>
 <e034a111-93eb-42e8-a533-46553b4f5588@collabora.com>
 <20250620120509.GA39770@ziepe.ca>
 <d9a1b9ab-b6ab-4364-a1b7-df4debc21bc1@collabora.com>
 <3337df6c-f800-4610-8689-fbd4b4a5d07a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3337df6c-f800-4610-8689-fbd4b4a5d07a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_093513_086679_26C20829 
X-CRM114-Status: GOOD (  26.00  )
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

On Fri, Jun 20, 2025 at 04:42:02PM +0200, Benjamin Gaignard wrote:
> 
> Le 20/06/2025 à 15:52, Benjamin Gaignard a écrit :
> > 
> > Le 20/06/2025 à 14:05, Jason Gunthorpe a écrit :
> > > On Fri, Jun 20, 2025 at 10:57:49AM +0200, Benjamin Gaignard wrote:
> > > > Le 19/06/2025 à 18:59, Jason Gunthorpe a écrit :
> > > > > On Thu, Jun 19, 2025 at 06:27:52PM +0200, Benjamin Gaignard wrote:
> > > > > > Le 19/06/2025 à 15:47, Jason Gunthorpe a écrit :
> > > > > > > Ugh. This ignores the gfp flags that are passed into map because you
> > > > > > > have to force atomic due to the spinlock that shouldn't be there :(
> > > > > > > This means it does not set GFP_KERNEL_ACCOUNT when
> > > > > > > required. It would
> > > > > > > be better to continue to use the passed in GFP flags
> > > > > > > but override them
> > > > > > > to atomic mode.
> > > > > > I will add a gfp_t parameter and use it like that:
> > > > > > page_table = iommu_alloc_pages_sz(gfp | GFP_ATOMIC |
> > > > > > GFP_DMA32, SPAGE_SIZE);
> > > > > This will or together GFP_ATOMIC and GFP_KERNEL, I don't think that
> > > > > works..
> > > > I have test it, I don't see conflicts or errors. What worries you ?
> > > Just looking at the bitmaps I'm not sure? Did you run with lockdep?
> > 
> > Yes and it complains about that.
> > I see that sun50i driver have more less the same struct than my driver
> > but doesn't use lock. I will try see if I can remove the lock.
> 
> I have replace the two spinlock by a mutex in vsi_iommu structure.
> It seems it works well and lockdep doesn't complain anymore.

You cannot use a sleeping lock within the map/unmap
functions. Removing the lock is hard for your case because you have
the cache flushing problem.

Maybe mask GFP_KERNEL off and then or back in GFP_ATOMIC.

Jason

