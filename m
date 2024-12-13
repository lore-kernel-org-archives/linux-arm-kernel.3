Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AB2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 19:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTudxL7akG15arLWgUhGBbqBkCySihKjSTxtiyHKj/M=; b=a4pIvAdYSbJcu1rgWkOUwnk8cw
	CKTbLemVI1CZLuyzg5jPHpTCpu6NFuSlYuWsh8ekrYjd7GKDKj6ysGNGrFXwd6/j9x/2WGV+NM0Jd
	9D/fTSbaDtUXJo8LZh47hukBV13Y7Rr+tpaHdW/UwYptslUqi1G1+dSxvAU7BzC6GgXOPZqp7hdG2
	WM63M/NuHrPkuz4Rk4Bs5irfqenDCzuOcD+h1t5ry+YOSw0S76OeF2ooG5gfkYTeWbYeZH6z7gas4
	fM1cMAQn5KML24U31tnO2kvEHk8ZDgGpDAgatD4F7rEP8GkzxZeG2WAoTxfwdOm6PGlbaj+3ktyQX
	IWpNSZFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBfq-00000004sUD-2rTm;
	Fri, 13 Dec 2024 19:50:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMBel-00000004sHC-2Ro3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 19:49:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43622893c3cso9535e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 11:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734119337; x=1734724137; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wTudxL7akG15arLWgUhGBbqBkCySihKjSTxtiyHKj/M=;
        b=bmYnC9w9dF5/7XKl8otdiZkfiUUvCDhJDv6dRbKfZ+DXYkLXPVXdm88nBHF+54LRu1
         P/nOQVpg5fseMmQE2RD4XKcuIQeOanTUA4WR20sO5WNEVkWp2vkQw9o/nanlkWhilm4L
         hvV7aINm0RKqPSqAT7LGOCiS356MZpgGsZ0d1AIATUzqFeM7EsdNuzPPKFAAP/c4yGJx
         MlZ4RDc/PU9sok4EYSibsNbQbhH2xnnAZkoHenbHpYWUmzmCT0jVrtujNaolkxCqIHjL
         LI9KMuG3uNUNpnxaQQfmEUe09xp4uNazgamwFObbUIOVGIpR0Jjke0UegD5unDQqERE+
         fcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734119337; x=1734724137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wTudxL7akG15arLWgUhGBbqBkCySihKjSTxtiyHKj/M=;
        b=Ao/3fUnMcOJlwxZXe1129sNJsoG6yw58nsk9iqEOAw+Xt+G4bD3XYa3ZCSIJ9FtpsG
         e5kerVba6pArQ+Abc0+5zMJWPALU5GNZyROrftgXl+EmV3q0SdjsBM4DDR9ZJlnWPoJF
         jioL2lsjs4lWYQgYATZJsgr17pyr+DJ8Xfm2SfA+7Y8LMzbvVYMt3YocNzyns4bcMRw5
         kdJ2C/7O/HQj3QYwG5lg0LliCjWNDgg5dpNMLvqP0/TQ0EjKgyPC/Q5oOW8iooFKH9BA
         Eg2zQ1JaM4F/gal0s8ZhSyX0+vNAyYeAykavpFWsFVfw6rzsNGlRfwP1LOVVIJqH5kJh
         C+6w==
X-Forwarded-Encrypted: i=1; AJvYcCWeLcwdhC8gd3FAvviUiF9QUmrbO3nIZSi493tW/SvOKVLiLgU91WiYn4OGggK+kLkGB8yBgE029HajE3SMm0yC@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt2yuCk3GDyhIiErYb2IGlKGP2uoghyatpzw3Lf5BrUVaQYmAT
	oJzrHA4gjZqJ4WUhimFdrAR9g95cy43HAqqXJn/62ccsPpZTlFu8D2/KLGhbVA==
X-Gm-Gg: ASbGncu5JK77E1dnx+kqMJDDC0nxII5NzSQCRsnoLLhU72wKMP8p6fSikpW2vQvrDbk
	VQIpbXmdVsD2aO9PcNMkxaalbjX05smYQGkBm/xvejAbt529bC3IxaerbV+49hn4dbOliN0aqtA
	1KLG2ZFRpi8acGLSKHld34nDYCgpcza4fE+eRMcP6OWETFgGo0UhJZ0eSQ0KvaId+LU6yka+e3K
	AzHTtLIYEFBOlLhzNjoDD4tQyaB+BsHlRdkd6FcIcM2u66dD9Gyh8Ltyr/uqVojnWkr++IFeA3B
	9ZEB4VlQpXFA7YETBIk=
X-Google-Smtp-Source: AGHT+IFh74AH+6TGpxyM/Uf5omXCGX0AECGGvFVa2XBNN6YOFzqhpkphP8YdxRAEn5U+Y5leBLnhfw==
X-Received: by 2002:a05:600c:35c5:b0:428:e6eb:1340 with SMTP id 5b1f17b1804b1-436367928cfmr106175e9.4.1734119337464;
        Fri, 13 Dec 2024 11:48:57 -0800 (PST)
Received: from google.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c806ce56sm342452f8f.111.2024.12.13.11.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 11:48:56 -0800 (PST)
Date: Fri, 13 Dec 2024 19:48:52 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org,
	robin.murphy@arm.com, jean-philippe@linaro.org, nicolinc@nvidia.com,
	vdonnefort@google.com, qperret@google.com, tabba@google.com,
	danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 40/58] KVM: arm64: smmu-v3: Add map/unmap pages
 and iova_to_phys
Message-ID: <Z1yPpEn_MElCRzLG@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212180423.1578358-41-smostafa@google.com>
 <20241212194435.GA5484@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241212194435.GA5484@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_114859_619198_DE8A8FA9 
X-CRM114-Status: GOOD (  21.82  )
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

Hi Jason,

On Thu, Dec 12, 2024 at 03:44:35PM -0400, Jason Gunthorpe wrote:
> On Thu, Dec 12, 2024 at 06:04:04PM +0000, Mostafa Saleh wrote:
> > Add map_pages and iova_to_phys HVC code, which
> > mainly calls the io-pgtable.
> > 
> > For unmap_pages, we rely on IO_PGTABLE_QUIRK_UNMAP_INVAL, where the
> > driver first calls unmap_pages which invalidate all the pages as
> > a typical unmap, issuing all the necessary TLB invalidations.
> > Then, we will start a page table with 2 callbacks:
> > - visit_leaf: for each unmapped leaf, it would decrement the refcount
> >   of the page using __pkvm_host_unuse_dma(), reversing the what IOMMU
> >   core does in map.
> > - visit_post_table: this would free any invalidated tables as they
> >   wouldn't be freed because of the quirk.
> 
> I don't know if the timelines will work out, but the pagetable stuff
> I'm working on will let you write a much more appropriate
> implementation for pkvm's usage than trying to hack it into the
> iopgtable code like this.

I didn’t check your new page table patches yet, but I would say it’s
more likely your patches would land first, because as mentioned in the
cover letter, there are still many dependencies for pKVM before IOMMU
support lands, so I don’t mind converging if possible.

Thanks,
Mostafa

> 
> Even the iommu focused routines I have got now would solve this
> problem because they allways spit out a linked list of all the memory
> to free after map/unmap and never internally free it..

> 
> Jason

