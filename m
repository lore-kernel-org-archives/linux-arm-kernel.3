Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA72C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 20:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yHFeM/dPfGA4sFtsC9fMsOxlubs1dV+bQ3yag0vQkBw=; b=1S6FnTsmZXZZpQH/IiOESHnR7u
	zd/vrOvYESrsSnA6HFYcSJxtkzYTGEDUkAhrvMHnzB7TmLvHxI2+mgt748Y5f8XwCVgTimA+lLuon
	QtsAyZD+WBaTyP1aXfcwcT+yrr4VC83/cSFZMYPgysK5BQDdKhh8PFqOCaKeuA9yTZ+d+qUoD29XH
	TZdeHR5jcbqeCAh61VzEFON9Jq1M+ZieAe29t+tNgRk/jI5hfX2dTKEF9EWApZjf74nyzq9qarKO0
	9Q60pVcysWSYfYju2IyEut9ezyvS+WldndLtlW49ofWst/su4IKP1b9Pvq8/8G8bdZNGO99MsN71q
	PqmiPr8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlBNz-00000004VRq-3nsx;
	Sat, 18 Jul 2026 20:11:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlBNw-00000004VPw-103z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 20:11:46 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493be0fbcc5so109645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 13:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784405502; x=1785010302; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yHFeM/dPfGA4sFtsC9fMsOxlubs1dV+bQ3yag0vQkBw=;
        b=JT1KuenMlkscmP3vGsuiXfnwBZSckQPeVdQBkV7FCH8SYo1qNeeH0DlWzcMbKUZU9B
         yC1stjs2Bl//fwJqDKP/OkH2iathvbVScwZwKcA/mI0F5aQM4f39gnnnsFT7gPC9WZvv
         Z7KGvnFFdopP2kpH/hHBBrW+/4bp6DKfAEMBFAOf3qVbuMngDvScB1QXrAr2n7Vh9jD2
         43pML6cW3Q3wf0fUB2m1RElcxoSssr0156Nx3dBDWTk7+mhb8dxl3j8mKPE++MqISvPj
         4e+NoWjigb3izaXgp8mD9IqhODW0IdY22tutBJmorxX5V+0FJrvpMhNh4kEKIWga4N2V
         G1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784405502; x=1785010302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yHFeM/dPfGA4sFtsC9fMsOxlubs1dV+bQ3yag0vQkBw=;
        b=n7Ggg6rFt9kS7RsV5I689V3ONxAlI+IvV7k9hMrJJZyhkz3Xc29XPZG3pX0Yqfn/hH
         Ad5DUGjClp359hcMA5w6P/agAaNP04t7/YMazDGAkISTHnmTKGWMyw4EM/VAhFvMinAh
         yJjWf5tVVGZPU8n3NjXM981nsokS4HSIHfC8+IESWEfkVUSWhSIXQqCH+yiOU3DfKpwe
         njZ0IcTRONNbZJ73HqzjBspOh+58F2qXubJqLEjK+IAr/ujT/drsp0Dna6SVGAFOf/JU
         V7LSWN4x3pAGnzjU5FL+aN9joysRFHQv7djEHc8iNsiHyxb3XhKm4drhg2ihs1ZTG8pm
         6fOg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4ODUFP59pFVP8e5n1unphZd7YPCOnuY5Hn/JRN59au4FcHxSIojZieCUFIjdrSUUicf0V19PUq+83Mh1Dbhy5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa7T+fcohu0NBu9hV9z4bhtWo8GaWtlsRj7FvNZS9uf9gg3m5K
	+XWkJpgv/89hSVlCsQbOXCxXGBebNdrYMYKtCWdmSEK5urIz+9o9gK4V0mR4uq98xA==
X-Gm-Gg: AfdE7ck5SZ98p2Q8UTjRAyIHIC+F8R019iRD0zuMK+BaFYRXaDgsiiMIW2QakFFxANw
	Vaq4BMhih0wk586zQNlxxFewK/hB47TmOjP+a+8MfwuaC45U7kk73so7cE9bLnWr9+pJ72hYGXK
	lL7lJlRphEb+FYYXFymIVF/JrxkOqdbqDqHotk8n+Nq+5l26YWI7krTZaxiCz6cEm588xIfoLmy
	XDH2ffRV6TfdpSesRSKCm7n8g+EMYx43hJIrKnTvi8YkqGpVDYSJoLqf2hcXlXZZq2c9DljJKOe
	ZiGtnFXghlYH88y70hFW7ptLCjd71i95+HQoJ7txEyZLtN9rO94D4R7dozWcE83ya0Iltwj0NwL
	YdFWpATHpT8igKgbygBji4e3HgSnZI/rtAfTejMUEuI0dfu6//1ZOnIKianFNdO7owcQWVdzZbu
	SWzXIoXvrZQX/jrZ4rVxcK8TSRePL31rMP1GhDUQ==
X-Received: by 2002:a05:600c:3f0b:b0:48a:623c:8859 with SMTP id 5b1f17b1804b1-49550691e94mr1258705e9.7.1784405501768;
        Sat, 18 Jul 2026 13:11:41 -0700 (PDT)
Received: from google.com (220.60.76.34.bc.googleusercontent.com. [34.76.60.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49558cb8433sm3398395e9.2.2026.07.18.13.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 13:11:40 -0700 (PDT)
Date: Sat, 18 Jul 2026 20:11:35 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Will Deacon <will@kernel.org>,
	Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Add support for contiguous hint bit
Message-ID: <alvd9zPeXQVQ7l2l@google.com>
References: <20260618-iommu_contig_hint-v1-1-4502a59e6388@oss.qualcomm.com>
 <20260703161228.GA1948451@nvidia.com>
 <b7224dff-7e51-49cb-8421-14d090492dfc@oss.qualcomm.com>
 <20260715113913.GA3775915@nvidia.com>
 <ald3CuddY6I7gml1@willie-the-truck>
 <20260715122830.GB3775915@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715122830.GB3775915@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_131144_319356_AD60A5CA 
X-CRM114-Status: GOOD (  36.62  )
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

On Wed, Jul 15, 2026 at 09:28:30AM -0300, Jason Gunthorpe wrote:
> On Wed, Jul 15, 2026 at 01:03:22PM +0100, Will Deacon wrote:
> 
> > From what I can tell, the fiddly parts for iommupt will be:
> > 
> >   1. Hardware bugs / quirks. Some of the simpler ones could probably be
> >      handled but for the more invasive stuff like the Mali format
> >      format, io-pgtable will probably need to hang around. Perhaps
> >      it becomes io-pgtable-mali.c?
> 
> I briefly looked at Mali a while back and it didn't seem so bad, but
> that was for a GPU driver not the iommu so a bit different
> issue. Exactly what the GPU drivers should be doing is less clear to
> me, they don't really fit well with the iommu focused interface (eg
> the memory preload issues/etc).
> 
> >   2. The pKVM work from Mostafa. We'll probably end up with something
> >      separate at EL2 for this (ideally, just reusing the CPU page-table
> >      code when it learns about BBML3).
> 
> Yeah, I'm not sure here, it isn't great that is adding another user
> and open coding some of the logic (eg smmu_pgsize_idmap). It would be
> much better if it could just use all the existing flow more directly
> somehow.

I was under the impression that io-pgtable-arm will remain the same,
but if it is going to be removed (or at least the LPAE format) I need
to figure out an alternative for pKVM:
- Compile iommupt for the hypervisor (similar to what we do with
  io-pgtable-arm in the SMMUv3 pKVM series which compiles in both)
  I am not sure how easy is that for iommupt, I have the SMMUv3
  iommupt series on my review list, I will check that.
- Support the hypervisor page table in the IOMMU, that requires some
  extra support changes, I recently posted BBM support, but there is
  more as avoiding lazy mapping when unmapping, TLB hooks...).
  There is another problem with that for android, as we still need
  stage-1 as some SMMUs only support single stage (used with pv)
- Write a small IO page table implementation just for the hypervisor,
  that's not ideal as it would benefit also from features as CONTPTE.

I will look more into this, solution 1) seems the best case if
practical, otherwise, 2) might be reasonable for upstream.

Thanks,
Mostafa

> 
> >   3. Non-coherent walkers, although I think this might actually be fine
> >      because x86 needs it anyway?
> 
> This is done already, the smmuv3 conversion I've posted supports it.
> 
> > So, for now, I wouldn't require new drivers to use iommupt but I'm
> 
> The recently posted broadcom driver used iommupt and I thought it
> turned out very clean, it actually seems like less work to do it this
> way than try to write your own page table like that rockchip driver
> did which required several review rounds.
> 
> Jason

