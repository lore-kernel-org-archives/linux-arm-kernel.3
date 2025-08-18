Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B814DCA0EE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 17:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vj+qz5uWtdxe1t/4yn/fG3Kx2sOHLsT2H8fxH0m0kcM=; b=MN9ARKsu9Vy4gYluyrpds+cwzA
	ohbuz/kWaMN43T975qG0qsBZS85GDWMK1Ig4d1sVd56HfgYag4Dp/jq+0+a0pR5Maf1sqj+1vqMRb
	GU+SY+woznJFfOjCuTMtvPUDyHJHxZvx412hvN1krEZ/986TGLitJWj4zlqXZGU8iafY1PMyDAsop
	WH0M0mBkOFXsaCR4QQkW0UztSOwjhvVmjCYCzQoOLN47nF/bRZq7AgLTSeAfFN00RmeK3FTNGJXNO
	BxXuSvQ1vAxZcIm6zC4vHBaaD8IrWd0KC3SfWh8PIhyuFSu7skp1C5d1gkxMk2Jbxw+yKjE6uHwvU
	kOsSYwiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3jA-00000008BZk-40Rr;
	Mon, 18 Aug 2025 17:33:00 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo2Ab-00000007xmr-49ZE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 15:53:15 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-70a9f56b1f2so26119886d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1755532392; x=1756137192; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj+qz5uWtdxe1t/4yn/fG3Kx2sOHLsT2H8fxH0m0kcM=;
        b=Nnk+oac/fRjNuigierfv2urBcIA3h2RFLFja+8Wn4v+7GeSBO4mzzdudwnNicaMMVu
         /Rm8qpl2zOVEqrspPl2eJHCVz3MMI/TBYRmz3CxfbUCoKW8po2tYleq/XL1jWEwkpd2/
         tXRx70pv4x2VOFalfK9JbI53RO2W9EpdjSE8T52DWzBjcfOYBGOR/l7POmIm5lK9WhF1
         qVdepA9HCcx+V/GZtq1fF52IApjZVK7K5ViWptcQ7+E3jo8Ffxq//md63IAAfr+TB0hq
         KIsCeeC45IuKIXo+Iul262V9fyVvXkejsTHPB0WZJuzPE+9Q/MNAgNdN080mhf0FCMcO
         uGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755532392; x=1756137192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vj+qz5uWtdxe1t/4yn/fG3Kx2sOHLsT2H8fxH0m0kcM=;
        b=S5tsNGgYhUkPGrUdGC2LM6hc+afSMk73D089owC4xHN+iuvY6b/IVjF6qUU1MNGhxG
         XEth89OfENuHOrC/BGLU098CCFuASBht5VwggJ/B4Lg5/L4yHUzousXAwmodMz1M9l4i
         KD2AgxZjV+HYD2U+fWEMUad5TfqOF5ScmhrV3DbbjRownerrglQwMP5Vn9d9065BZ6Oy
         t5MtiGTQ1+yhdzprT6XZqdwe97F6fA969JzcxzPgm607rhQ7HMMJYgg60ugC7EOJHHP1
         Xni2s9hGSfktf8jcj8vayQIEF+fPCTK03O23jgTSMdXOYsR0Qo4cdO4t+fCzstW9gJjY
         HKDA==
X-Forwarded-Encrypted: i=1; AJvYcCXzQP6ZCkVL5gBMqmBTEMN/ZZZUNvZxX/eN7D4jK/c0wnMIVAtnOu3GdvEqzzuDpVkUAcVe/2u63sd5HKfx4icR@lists.infradead.org
X-Gm-Message-State: AOJu0YyeFW546LN4gnpxzo447CakP1v5HbLunSWKAthafn8Yi2gu2b4q
	5vFVxc+4J4/0Es+ODWFQNn5EBS7NjDlDu/gDBT6dDD9dEeIqml5W7yTtWWCeRCtmkiM=
X-Gm-Gg: ASbGncu8Gqyxpbcs4dDie9nk06od6rMRH5loj/A/lBw3mUak317G84kKNcvL5ToSHsL
	P6MfK+4ZYQ2R0BEox0vwakpomWKLwGbm+1QDMEO9RPvSTWhXEymZgeUh/VVvwmFRZ2+gsNbtCY0
	qamsKONiQKbQduh8PPI3csvgd8RVRM8AwamSs7ngKKu/8un41PPMEqCsa/H9ZPqxO0QNp8c3Dii
	IAM7QXfQY+XKhMu6H2Ggw/nc+PoZPW56iSUL8/dHMdXa65jSw+QgJgGZzLAZeiqdWauMYmXOwAW
	gUlqLm7/4VgLd0DxdpdSl3Pdd75/16dFhYbA3CVB8eT+E/2KRb+n9IFEr92VEb5P5VTaH0Xv
X-Google-Smtp-Source: AGHT+IHy5xjjBQNaLhq2Kl2pjcBSM8TtgEpdzaR3B4TcAc3XiKHcP9uaHgX//cMvSIYk535Uc7uNQQ==
X-Received: by 2002:a05:6214:20ad:b0:709:e519:fbfb with SMTP id 6a1803df08f44-70ba7b5df3cmr141480306d6.22.1755532392375;
        Mon, 18 Aug 2025 08:53:12 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba90bcf7esm54232646d6.31.2025.08.18.08.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 08:53:11 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uo2AY-00000004OfV-46ks;
	Mon, 18 Aug 2025 12:53:10 -0300
Date: Mon, 18 Aug 2025 12:53:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	will@kernel.org, jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com,
	bboscaccy@linux.microsoft.com, robh@kernel.org,
	saravanak@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	lizhi.hou@amd.com, clement.leger@bootlin.com
Subject: Re: [PATCH v3 2/3] iommu/of: fix device tree configuration for PCI
 devices
Message-ID: <20250818155310.GG599331@ziepe.ca>
References: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
 <20250806215539.1240561-3-shyamsaini@linux.microsoft.com>
 <20250808121515.GE377696@ziepe.ca>
 <20250814233018.GA31418@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250815003958.GE599331@ziepe.ca>
 <20250815023236.GA30997@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250815023236.GA30997@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_085314_030512_EC414B4E 
X-CRM114-Status: GOOD (  18.89  )
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

On Thu, Aug 14, 2025 at 07:32:36PM -0700, Shyam Saini wrote:
> On Thu, Aug 14, 2025 at 09:39:58PM -0300, Jason Gunthorpe wrote:
> > On Thu, Aug 14, 2025 at 04:30:18PM -0700, Shyam Saini wrote:
> > > or were you referring to [2]?
> > > 
> > > In that case, the PCI child node data needs to be parsed, which is
> > > currently handled individually by each host controller driver.
> > 
> > Yes, this looks like it may be what I was thinking of, the pci@1,0
> > specifes the BDF effectively
> 
> In that case, we'll need to parse the child DTS nodes properly
> within of_iommu_get_resv_regions(). I'll include this in v4.

Kinda surprised this isn't happening already? It would be good to
refer to the original specs and describe how whatetever you propose is
aligned there.

> > Presumably this is a fixed issue of the platform. You never did
> > explain how your system has such werdio behavior, or how something
> > like iommu=pt can function on it...
> Yes, this issue is platform-specific. On this platform, the default MSI IOVA
> range overlaps with an address region that is reserved for another purpose,
> Other than that we haven't observed any obvious issues for DMA operations

Usually DRAM is at the default MSI IOVA address, so if you run
iommu=pt then presumably your DRAM map has a nice hole in it.. But
maybe the memory map told the OS about that.

Jason

