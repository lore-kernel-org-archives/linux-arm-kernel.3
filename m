Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEBFCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 18:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1J/+HWoid0BEbW+tXsuIRks6EMfRCMcY0XqrXIbQ7CY=; b=Y5SXRLvzkbBqKtp4+k0u0L7NqZ
	mebz4WjIrkQVE4/RTbFb6ibrcIFrGhp/Ixw9X5q6q4a8/+UIZg+a/8pGJXVDKTGmCfKQEB41LlK5j
	tAZihcQS6i4UNngcuQYSALz2H/Bcc5QIl9z2TcOk2rIb+lq8R5F1ULzSj+pwCHSrnHUPn9P0wXPw0
	dne44r8WaDsjdVumkMKnZpJ9LhwnxwceIT/qNylsxs+9N/Kbbf73bmx+S5wq5wvNT1mLBrl7ruuIf
	MFqlNZ9hTXsK7C5/pIje9RsEP1lNVp+r/7YEgA/V0icfTsMgc2xbHnV0+LV4j57S5bGBSEe0khevm
	h2yTLjLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSfG8-00000006ASV-30vy;
	Thu, 28 May 2026 18:15:08 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSfG6-00000006ARs-0tE1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 18:15:07 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ba3b9bcf69so115ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 11:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779992105; x=1780596905; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1J/+HWoid0BEbW+tXsuIRks6EMfRCMcY0XqrXIbQ7CY=;
        b=tQeoLYZz8/33hn0fUWZeF85u0Fah9dANuszoVYF4TDY8WYBPaaFl176JKBaZ0P0HCo
         J29sNZjFwXGHz05IOqol8w+FY0bIlzl/g6UwCqSlTpiDCWLobjnb+UJ+yeE8rFJuonhu
         SxxxvwxVcHQ7k2wPtdlbb+Ewse7EYD/opLYzeUsZc2w7NuO3prVI/ao8UiJ+bSN+/bFt
         Z1x+y4TseLRNa0FXAOrhz5t0rk6M+xeAFwbUvxc898pak5jt1UfWfty9xyRq7e80mwbO
         ZXPwyh1UaEatiuIHkzzq4oYuY1m3tN/Q2ue7PxVhggx/9+gtgxi+4I16qeM9X2FtvXjG
         zROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779992105; x=1780596905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1J/+HWoid0BEbW+tXsuIRks6EMfRCMcY0XqrXIbQ7CY=;
        b=jNaPWr+r6SqF9vyt1eGCtO/V/HlyE/m1E2VlvcIS1sgRIXO3LQEMG6gC66EQ5Ma9a9
         7hdi1fasbYIlx99FWYajs+01fC9ihkLx/LM5MJf4AuoNVcvxRRks5A3G230sj6lFkdM6
         BTjkUZKlnNuf6eI8gtAjqKvbLwV+c40HRd3jHhILUYuBF5uM9Yoq+HTmxLePvjXu6ZFQ
         T7TuszMrP6NRYKYsXN+iwdjVbf+xonYsXPpCE8A/xXpMhbC4ngqrVeiNYAxIBs3YSwid
         i5jd2znKvXrxDF14vQy+sug/pyJGVNzdkYDFDXGpxutPLslOdvlTfNdqOtEPs7XSXfoz
         NGuw==
X-Forwarded-Encrypted: i=1; AFNElJ/3xjZplRfMKVDVZOqO5SofXWdLDt4HjY7hir2INodMMZQPiZAGpNGAfOKJqHgIG35R08nGMcwWkCnMrdYpxYuc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxn0VHpFdEGrxs3XGlMr/j9QowPdENHOWUHIwmSTObFtWMqSi9G
	VRdm/p+dG6YrlDJAQS1TUp9L3o+ZsF0PUIRSVQV95yhCfYL4tbAhDOGKx4bYemmBcw==
X-Gm-Gg: Acq92OHBx0MgqAkSi27mEbtkpoi7QwB0E9nXC1wtYwyLQZVy2Sgt+dGjdp7TjyVQOKp
	5hFt7Vxn1HHm+LKZCNMmmxHDJgNiAyqHv8iFznyVjGgO/v9qyn82Gbi10Ki1Zp3zJmfKNBxO3ab
	HG6sW3K8naYDWAagebp2oktio6Rqp9YLtE/Jg8a855QxkBc5vW6bVsTisQyIR8CT94aGKvy4820
	YeQCv9cr3m3y4iN+8wO4zsP4ALeB0vCHoeZXnb8K+q9kCDGJYSwgpMYvYSPi9eJOslNL8fxPItT
	lXWp8pdEH3jcNF08AhrrMUq7JKEeNgE9qDl/sfa9kLyzdCvH+4Z/IqN+QIx2vXHchfnWOUVFg/R
	ybRm/naNgXv6OPezd/kwO0yCx7blCCshHoFCAxA6kF7Lh79sxSXTbrKfVB+spyEYXt1P4MiBUJd
	k/y/dydq5/7kYgK9ftAu4I456j7yMFnF4xaNORmiPpQJqIiaycDG/Vf+Xe3WgSUwZwH/Ps
X-Received: by 2002:a17:902:da8d:b0:2bd:3bfd:74f1 with SMTP id d9443c01a7336-2bf1e2f6227mr112265ad.2.1779992104891;
        Thu, 28 May 2026 11:15:04 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b908f8f80sm2156136a91.5.2026.05.28.11.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:15:04 -0700 (PDT)
Date: Thu, 28 May 2026 18:14:57 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, bhelgaas@google.com,
	baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, dan.j.williams@intel.com,
	jonathan.cameron@huawei.com, vsethi@nvidia.com,
	linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
Subject: Re: [PATCH v6 3/3] iommu/arm-smmu-v3: Allow ATS to be always on
Message-ID: <ahiGIUDG2uvA6usM@google.com>
References: <cover.1779392420.git.nicolinc@nvidia.com>
 <18bb6f421b3be891caa8f1fb50f3a4d56b52d5be.1779392420.git.nicolinc@nvidia.com>
 <ahheOF8L0aGMttcI@google.com>
 <20260528152930.GA3195266@nvidia.com>
 <ahhuFw3ZJpy48xkH@google.com>
 <20260528180018.GB3195266@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528180018.GB3195266@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_111506_264778_FCCDF0C3 
X-CRM114-Status: GOOD (  18.59  )
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

On Thu, May 28, 2026 at 03:00:18PM -0300, Jason Gunthorpe wrote:
> On Thu, May 28, 2026 at 04:32:23PM +0000, Pranjal Shrivastava wrote:
> > On Thu, May 28, 2026 at 12:29:30PM -0300, Jason Gunthorpe wrote:
> > > On Thu, May 28, 2026 at 03:24:40PM +0000, Pranjal Shrivastava wrote:
> > > 
> > > > > +	master->ats_always_on = true;
> > > > > +
> > > > > +	return arm_smmu_alloc_cd_tables(master);
> > > > 
> > > > Nit: I'm not sure if I'm getting this right, are we saying we *need* to
> > > > allocate CDs for CXL.cache cases in the probe itself because STE.EATS
> > > > requires Config=Translate with S1DSS in bypass?
> > > 
> > > Yeah, basically.
> > > 
> > > Effectively the ARM rules for enabling ATS and Bypass together require
> > > a valid CD table pointer.
> > 
> > Ack. But do we expect transactions before attach_dev? What'd happen if
> > we don't allocate CDs here?
> 
> It can be done at any point before a non-abort STE is formed.
> 
> The core code pretty much does this immediately after probe so there
> isn't much point in moving it later.
> 

Right.. that's what I'm not understanding clearly, if the STE is Abort
anyway during probe, why are we breaking the alloc-at-attach convention? 
Usually, we allocate CD tables in the first attach_dev call. Why does
that not work here?

[Disclaimer: Not a pushback, just trying to understand the requirement]

Praan

