Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EF9C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 15:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wNH0ejjUe8Lj8uB8nKw5WFsHsij9Aanrkc89iq3IGY=; b=0t26gIhq4GX0JfwV0481PcRY+y
	nPM5ZdfJbH4URDng2jstsFBMc+rXWOlDj0oNcs/4GAxWum/T28SX/cXIlfRdUajqNy0ZVqklCO0TD
	i037i2I2iJ2A2tF0cKr6cHF2ypJcyXUlbTTFpQuoQM3sCMkfa4ZGZ5MhuVPgequ0CR0P7bSBHIE3P
	7L0+fCUiFyGbEGuxAHp0z4d2ynCgPEfcB0bzc6Xs09w/m3otPXQZeqTWcKowO3HWqekC9sdO1m6yD
	kCppVzdPZuylHLQw01TgnPimrrkjKB+hu/0z5NWyFmarYBYz2BjAZmVc7jHntQDsh1mI6tbItGWcZ
	DOliq19Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixCR-0000000ApnR-490T;
	Mon, 04 Aug 2025 15:34:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwNd-0000000AhJl-2SxH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 14:41:38 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-459d5ab32d1so73065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 07:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754318495; x=1754923295; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7wNH0ejjUe8Lj8uB8nKw5WFsHsij9Aanrkc89iq3IGY=;
        b=RUB44LWIlEVUDiI/80219tHuXves0TSohrkH89dDJJ0cfDA8izuOro07DUh5k6AInc
         ZtNJRQ+koq1tNPDrawlW9Mpbt0eszccoI3KB15c1IC/HQZcwMiruw4ypd+WewMslzeT4
         gGUQ4SlxQ3xDFZShhu86QqGbieLBPMguzxa8pDihFMOwx+KyP2JUBzPZhCMezbybozIJ
         ip0wlpzHt6omwR/4LxLwfHstIlVSYVv4X1F8BunG1SgQvRgYF5co06/1t7TKqT/p25FB
         hLx2rjxA/+1YiP3EaoG9vEf4ggFHY9C8zPaque2qhm5BL3WOjkvrf9+5NvZ3it7InXZq
         EXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754318495; x=1754923295;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7wNH0ejjUe8Lj8uB8nKw5WFsHsij9Aanrkc89iq3IGY=;
        b=bet0Z/H/bJ5ZQWfWLI9EGjcyK0W9QW4zB4R7EpFryasRSMH9Sicxy4/JVruFQMHfUN
         g+35Ju0yszu040UTjBbXl7T3k5umcJUa9Abt4J0NdfRZwt/jrU88OiroHLaq+ZAzK7Kp
         iufuQYRePnAaiqmP/PKD/c+YMo7tVvPyQi7qk98qBvenrk6iY7Nz7m1Aacxh5e4CppQZ
         Houd/AHuN4JFrE/T1BHuvf1wGvQT0ZPegYF3N4oqk2cqO8WJBRvip6CuO+GUc5aq63GD
         7Lsbx5vdA8zEGsSOJ6SmJunR/NWdOLO59vmMlKXT7+kxutnhTFpssppYYtiUv56NyPnt
         9sFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPXo7sfCc3TXJOCAA0qwkmtzcds8rZ58ZRDWJughAC40W1mvTyO5E3bPzv5foHjKF9Brl/B7ipjt9VU5+tbZcm@lists.infradead.org
X-Gm-Message-State: AOJu0YxyC2zl/21qn/lkrBgqP6g32q7NOR+TT4V1eWn9W0Fywzq6VwKk
	F+m0HYdGZRBaYtligrrUDSTUYTdgnfyJxYbDvIm9kuwRdxW+3pMOTDy3+5tJr+laLw==
X-Gm-Gg: ASbGncsOP9aad5/A2bFtAy4PFIR6Czwxnvfsibu3onBYWGDX7yp171L55zWijJWZdm2
	nl/D5w3XbvH59fZBrEYsqeY05bSY28N0rDkDigpKBN/F4Q2UN6QUXZLR1S6XX+H//1cyqgPkKZU
	P1tF8Z/PxCCOr7e5ZrmWkueYeHhkRod1EfF8186G4OKCr1zitYBczJ7pPVrYEp4WJ9GRh0crxId
	U5g8PMmOvss841dqb/mwsXTABE1rCLMhyTxxpkvh0w1/KLE/2ySZKhxpQD8lJtvX/gs/dbGFBjL
	VmotzbtfEbWyfPUqjErY0969hbkVd4GQSCrlGnheYacrfun237MsPacLmB3USwuWgJJb4lNUWkF
	FOv4hR+aisutffIZxW61d72EMC0K8ccvO5pBJQoraGgsNiolzaCaHJB3O1bOMD7rO9Q==
X-Google-Smtp-Source: AGHT+IGJiKUaLoknW9Epd8+LfOGYhki9ay4O/9N7wqTlXSABK7cHrsudr7MdE3msBmIPHpRZjQ9T/Q==
X-Received: by 2002:a05:600c:4928:b0:453:6133:2e96 with SMTP id 5b1f17b1804b1-458b6c0e62cmr3626715e9.0.1754318495186;
        Mon, 04 Aug 2025 07:41:35 -0700 (PDT)
Received: from google.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459ded356b9sm19744015e9.12.2025.08.04.07.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 07:41:34 -0700 (PDT)
Date: Mon, 4 Aug 2025 14:41:31 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v3 29/29] iommu/arm-smmu-v3-kvm: Add IOMMU ops
Message-ID: <aJDGm02ihZyrBalY@google.com>
References: <20250728175316.3706196-1-smostafa@google.com>
 <20250728175316.3706196-30-smostafa@google.com>
 <20250730144253.GM26511@ziepe.ca>
 <aIo1ImP7R7VhRpVE@google.com>
 <20250730164752.GO26511@ziepe.ca>
 <aIt67bOzp6XS_yO-@google.com>
 <20250731165757.GZ26511@ziepe.ca>
 <aIurlx5QzEtjpFLd@google.com>
 <20250801185930.GH26511@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250801185930.GH26511@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_074137_632753_80E37550 
X-CRM114-Status: GOOD (  49.59  )
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

On Fri, Aug 01, 2025 at 03:59:30PM -0300, Jason Gunthorpe wrote:
> On Thu, Jul 31, 2025 at 05:44:55PM +0000, Mostafa Saleh wrote:
> > > > They are not random, as part of this series the SMMUv3 driver is split
> > > > where some of the code goes to “arm-smmu-v3-common.c” which is used by
> > > > both drivers, this reduces a lot of duplication.
> > > 
> > > I find it very confusing.
> > > 
> > > It made sense to factor some of the code out so that pKVM can have
> > > it's own smmv3 HW driver, sure.
> > > 
> > > But I don't understand why a paravirtualized iommu driver for pKVM has
> > > any relation to smmuv3. Shouldn't it just be calling some hypercalls
> > > to set IDENTITY/BLOCKING?
> > 
> > Well it’s not really “paravirtualized” as virtio-iommu, this is an SMMUv3
> > driver (it uses the same binding a the smmu-v3)
> 
> > It re-use the same probe code, fw/hw parsing and so on (inside the kernel),
> > also re-use the same structs to make that possible. 
> 
> I think this is not quite true, I think you have some part of the smmu driver
> bootstrap the pkvm protected driver.
> 
> But then the pkvm takes over all the registers and the command queue.
> 
> Are you saying the event queue is left behind for the kernel? How does
> that work if it doesn't have access to the registers?

The evtq itself will be owned by the kernel, However, MMIO access would be
trapped and emulated, here the PoC for part-2 of this series (as mentioned in
the cover letter) This is very close to how nesting will work.
https://android-kvm.googlesource.com/linux/+/refs/heads/for-upstream/pkvm-smmu-v3-part-2/drivers/iommu/arm/arm-smmu-v3/pkvm/arm-smmu-v3.c#744


> 
> So what is left of the actual *iommu subsystem* driver is just some
> pkvm hypercalls?

Yes at the moment there are only 2 hypercalls and one hypervisor callback
to shadow the page table, when we go to nesting, the hypercalls will be
removed and there will be only data abort callback for MMIO emulation.

> 
> It seems more sensible to me to have a pkvm HW driver for SMMUv3 that
> is split between pkvm and kernel, that operates the HW - but is NOT an
> iommu subsystem driver
> 
> Then an iommu subsystem driver that does the hypercalls, that is NOT
> connected to SMMUv3 at all.
> 
> In other words you have two cleanly seperate concerns here, an "pkvm
> iommu subsystem" that lets pkvm control iommu HW - and the current
> "iommu subsystem" that lets the kernel control iommu HW. The same
> driver should not register to both.
> 

I am not sure how that would work exactly, for example how would probe_device
work, xlate... in a generic way? same for other ops. We can make some of these
functions (hypercalls wrappers) in a separate file. Also I am not sure how that
looks from the kernel perspective (do we have 2 struct devices per SMMU?)

But, tbh, i’d prefer to drop iommu_ops at all, check my answer below.

> > As mentioned in the cover letter, we can also still build nesting on top of
> > this driver, and I plan to post an RFC for that, once this one is sorted.
> 
> I would expect nesting to present an actual paravirtualized SMMUv3
> though, with a proper normal SMMUv3 IOMMU subystem driver. This is how
> ARM architecture is built to work, why mess it up?
> 
> So my advice above seems cleaner, you have the pkvm iommu HW driver
> that turns around and presents a completely normal SMMUv3 HW API which
> is bound by the ordinately SMMUv3 iommu subsystem driver.
> 

I think we are on the same page about how that will look at the end.
For nesting there will be a pKVM driver (as mentioned in the cover letter)
to probe register the SMMUs, then it will unbind itself to let the current
(ARM_SMMU_V3) driver probe the SMMUs and it can run unmodified. Which
will be full transparent.

Then the hypervisor driver will use trap and emulate to handle SMMU access
to the MMIO, providing an architecturally accurate SMMUv3 emualation, and
it will not register iommu_ops.
Nor will it use any hypercalls, as the main reason I added those is to tell
the hypervisor what SIDs are used in identity while others remain blocked, as
enabling all the SID space doesn’t only require a lot of memory but also
doesn't feel secure.
With nesting, we don’t need those, as the hypervisor will trap CFGI and will
know what SID to shadow.

However, based on the feedback on my v2 series, it was better to split pKVM
support, so the initial series only establishes DMA isolation. Then when we
can enable full translating domains (either nesting or pv which is another
discussion)

So, I will happily drop the hypercalls and the iommu_ops from this series,
if there is a better way to enlighten the hypervisor about the SIDs to be
in identity.

Otherwise I can’t see any other way to move forward other than going back to
posting large serieses.

Thanks,
Mostafa


> Jason

