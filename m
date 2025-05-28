Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F83C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 00:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fr8j2ABRcVMveLyV9vmAho6qlH2nVGxwxz0sFNAeQYk=; b=s8mKOTWkIjWD6NTGS2OLggjZh8
	OSBMgIqV3DOR3t67H6k8X61rUiLoW/ZpN3kO05yTHW9M/MktZ16m8qqL1x5hDab7yvXXsV1xXGYjK
	bca4yQWTFl4KhKnUScuQ3fFgnxBcjfRbD+GgXYuoR6NM2LNA3QAGbCelyrGKYCEhaQoH8iv6CY4SL
	brhYTRzPbqOoJmP66NazaSxVq8gnjAMuu0H/UQPi+R0D6m+Y7IiJhL8nZFyPS3TxURQnBhdR2hFxa
	6ESDi+gOdF60Z+XDLn5RnHgWGRrQWAEMvE+Jr43YUFg2ZH5/vLBgkO+qL+xsrbsgQrLcNRM1RU2J0
	LA+g+63w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK4Jd-0000000BoIf-2WVH;
	Wed, 28 May 2025 00:06:41 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK4HU-0000000Bo46-11uo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 00:04:29 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6faa19e0661so34839286d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 17:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748390666; x=1748995466; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fr8j2ABRcVMveLyV9vmAho6qlH2nVGxwxz0sFNAeQYk=;
        b=OP0fnQcTYIXskzvGRUZbUM1cx6UVN8iOVcnAfRwh7LpGth15N+JIBFxknxonJghWK6
         tdr6mlIo3Rh5QGlG2gh8sAQC4+KQGAFrSaUIAWGmz454efi0LmJplB1Qz9nOHuLaR1ju
         YIlw1xZh3v7A+2JDbOdjZxFHSCTWVB0i9+wrdDYwoi73IyOx7Xr4M/eYwz+FNMErgXfE
         ybIW1Yic9wRvEI0lW1zShjW/a9RzvZlE0R+iLQUThdo6RYNBaeZyTMz6UmmFGSQ8Tebd
         v5X+CBSYu/Zq11JQRVd41ZJwN5I9oBX1RN4ImcORNz7MkV4eQ8UdiFo+zwvo9cGxsxLg
         nqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748390666; x=1748995466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fr8j2ABRcVMveLyV9vmAho6qlH2nVGxwxz0sFNAeQYk=;
        b=jd7dqtYTD5PWkckKcUwRDkfecicbfdvZl433QKomnyz+shZRqbP5/8vgSz2qnk/LhE
         FzoCTqwdDQTuJyB7lKJiy51tJNgGDWO07QSvjk8mXxG1BX2+odU380i5zIVJoPq+KagA
         XYo5fKF8i9Ehy5Rw0H9yha0ktY4Fw96dFFx6GCbHUhMQ47rxIlcK4LEKMHpQMVNOzdZZ
         Y+zPsGTPoxLCtMyP3sQOWsO7TFvYB3xbKxqIeU0PZqImCAYhJP6d+ziJzHJM0yEA0HZA
         t6uUNn17jozQvpN4Uytb3TBE8rFySWrokIkR/xLKSo6NjC6MtYEF1v02zlLuNQd128bG
         tKfg==
X-Forwarded-Encrypted: i=1; AJvYcCXZbXQpxd/52L+RuKSrVQydKemkTmcOmQVXbZACrHxQ+CzKmkJdysraEgM6jEvL7hhjTwz8G1LABM9YNtki3Qxb@lists.infradead.org
X-Gm-Message-State: AOJu0YwJaH/C5nhDHFnWlRG4SzIV1cAfUhBqgblG2DujC9wrpQYimKzH
	Wob/IjT6PwkHRZ6R/GyB8NVHwFbhHoSS2z+PHbcDLTcXxlkEWZUIhNk5spgdL8dp3BA=
X-Gm-Gg: ASbGncu24JtPg5TDedwgU1cH/JHAAVbS0yeNPpgTy8dFnlE4j5T6Vr4IOxZaILBzFPp
	1M1nOouVqxzMM9JL5fs+K2sBxBrLMc3EtALqdXn/PDWfxeX9jiXa5yWguQJ939l52mEmhRGUqpD
	D56+1xcVNRwNtbsRCrGVc95Lg85rOmEoD91C4MSGVHkNcCXHq2kWD/7BELXLq4vBDY/11rBk3o+
	LSUZIRklZNF92CT1Pitbre4+gdjgm5leuf13lVGk+Z1iV+kgk7a96+4jJn0Gao5qboYXPNL0BZH
	bJbGQ53D1wn+wcYQdyoHOPqvqFl3ZAMkjetrezJcqy2d9Xjfax+fpvX5M3QrfwpyqD6oFLHtf0z
	4lgYNpIXcfPU+wXzgC8QqbqH3XI4=
X-Google-Smtp-Source: AGHT+IErBe5nbyKYqWU9JIckHMVhK4xaI7/PP/tH903bB+DJeuC8MK2VCogNXSDRYdW98d3MojQWPw==
X-Received: by 2002:a05:6214:2b0d:b0:6f8:8fdf:f460 with SMTP id 6a1803df08f44-6fa9cfea4fbmr223186366d6.9.1748390666533;
        Tue, 27 May 2025 17:04:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac0bb9799sm12096d6.83.2025.05.27.17.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 17:04:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uK4HR-00000000fET-1oRi;
	Tue, 27 May 2025 21:04:25 -0300
Date: Tue, 27 May 2025 21:04:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: Jacob Pan <jacob.pan@linux.microsoft.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, will@kernel.org,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com
Subject: Re: [PATCH v2 0/3] arm-smmu: select suitable IOVA
Message-ID: <20250528000425.GC146260@ziepe.ca>
References: <20250410225030.2528385-1-shyamsaini@linux.microsoft.com>
 <20250410230008.GA6905@ziepe.ca>
 <67fff12d.650a0220.208c7c.d69dSMTPIN_ADDED_BROKEN@mx.google.com>
 <20250416181759.GF493866@ziepe.ca>
 <20250520224224.GA16365@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250525190703.GD12328@ziepe.ca>
 <20250527205428.GA14019@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527205428.GA14019@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_170428_285381_75E0C816 
X-CRM114-Status: GOOD (  28.06  )
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

On Tue, May 27, 2025 at 01:54:28PM -0700, Shyam Saini wrote:
> > The above is the only place that creates a IOMMU_RESV_SW_MSI so it is
> > definately called and used, right? If not where does your
> > IOMMU_RESV_SW_MSI come from?
> 
> code tracing and printks in that code path suggests iommu_dma_get_resv_regions()
> called by vfio-pci driver, 

Yes, I know it is, that is how it setups the SW_MSI.

> > As above, I've asked a few times now if your resv_regions() is
> > correct, meaning there is a reserved range covering the address space
> > that doesn't have working translation. That means
> > iommu_get_resv_regions() returns such a range.
> 
> sorry about missing that, i see msi iova being reserved:
> 
> cat /sys/kernel/iommu_groups/*/reserved_regions
> 0x0000000008000000 0x00000000080fffff msi
> 0x0000000008000000 0x00000000080fffff msi
> 0x0000000008000000 0x00000000080fffff msi
> 0x0000000008000000 0x00000000080fffff msi
> [output trimmed]

But this does not seem correct, you should have a "reserved" region
covering 0x8000000 as well because you say your platform cannot do DMA
to 0x8000000 and this is why you are doing all this.

All IOVA that the platform cannot DMA from should be reported in the
reserved_regions file as "reserved". You must make your platform
achieve this.

> Yes, i tried that,
> 
> This is how my dts node looked like
> reserved-memory {
>                faulty_iova: resv_faulty {
>                        iommu-addresses = <&pcieX 0x8000000 0x100000>;
>                };
>                ..
>                ..
> }
> 
> &pcieX {
>     memory-region = <&faulty_iova>;
> };
> 
> I see it working for the devices which are calling
> iommu_get_resv_regions(), eg if I specify faulty_iova for dma
> controller dts node then i see an additional entry in the related
> group

Exactly, it has to flow from the DT into the reserved_regions, that is
essential.

So what is the problem if you have figured out how to fix up
/sys/kernel/iommu_groups/Y/reserved_regions?

If you found some cases where you can't get /sys/../reserved_regions
to report the right things from the DT then that needs to be addressed
first before you think about fixing SW_MSI.

I very vaguely recall we have some gaps on OF where the DMA-API code
is understanding parts of the DT that don't get mapped into
reserved_regions and nobody has cared to fix it because it only
effects VFIO. You may have landed in the seat that has to fix it :)

But I still don't have a clear sense of what your actual problem is as
you are show DT that seems reasonable and saying that
/sys/../reserved_regions is working..

Jason


