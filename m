Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADCBCAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KMOMO3XHmFOxVaDXop6w1+ZPJDKNJK8AZpmO1KEadE=; b=YLXkWdY1QsdFGjVRicDEqkoP2Y
	Kwqxtkq/s0WBA64kHxXZFlokM3O8qfZ7X2ozlpzXarmiNHIGuXD8nYnd3gX+cXP7PHxyz6tuShv6I
	Gj4kCmOdBEkIfWLNDgDwcqnHQGLrtiAuuimJxGK+QojRA4/hVM8CWjPaY61m5q8/qX++u6UwIGhhU
	DNhjp16XUGRgofyEBmUK9TtgwX9KQZjG6ZNlAT4yW/6I+Mum0i6uUVXkl7eVn6rnDRE1iwuXvBbrd
	1i2vEYvXaF6PoZ23w7IukpQKs/6be6G7cR6wFXfkYL26LDdXTrg4comPeMP1qoAsDrUBdQa+jxG/o
	brwZFh0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWIA-000000081kl-2uMZ;
	Tue, 16 Sep 2025 14:04:22 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWI8-000000081kF-1OFz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:04:21 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45f2f894632so54685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 07:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758031458; x=1758636258; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2KMOMO3XHmFOxVaDXop6w1+ZPJDKNJK8AZpmO1KEadE=;
        b=idvVQ5n3cAKB2JAec5SuEAJjM5RnBAHCJrFDAu8q3e72AKNs+TqbJhwogaTxwcZGcX
         Zgh0n58h8Us7uiTm/1ausjXC+JzZMZbIDHk67NZqKQZ3ZB8QPy5e1C3PmcUjqlZPr0/g
         Rj4vvVqB0dX4PGt4+VyW9WXy6QhycZ9aPxa0QDK8ZZiW61IXEceMx7UArW9kBg3124I0
         BrNG2CQgYrrrfOjJ/NrmWfPTTUMHQkgbvDkY8jMWt4qIKkMk3OpTPNMtIhy3ubs76USC
         lqaVRGmrexMtaItQpLdYwzAEdaB6pIfoKmDmV7V6wqRTs+z4Zz+rIrY3p5rVGmzqhAtf
         rY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758031458; x=1758636258;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KMOMO3XHmFOxVaDXop6w1+ZPJDKNJK8AZpmO1KEadE=;
        b=q+x8X4H/C2QLdKBKKhHxjPo1MlXW0z+cjjJPUuYZoV617F/B1T3xBZQEidrOS4HOWP
         HPEkPErnMP2Pn2OgJTDUa5pkmwAVpYplJcpPGAup291I072CSLzhQZKnv0MsgkZnidnn
         4fnpxNjoHuOR6IIVo/eCZ2EIv4QgoPVtEKyoDIygFkjHE+v7HHw/s+zNXPicUDhysr3L
         xASqrW1bzO3CbA058F8VPcajsGTw3S7e6sqCLR5pjW7jqNml3HkzAjrcL1WDvCSjRC8q
         VTywO05rmhYJgpAqW7cqiVGWjgfndBSDYIetUD8OBPtaEI/Z1ATeROzIV4oXUHayuikv
         OEDA==
X-Forwarded-Encrypted: i=1; AJvYcCWVnBwLh4B0MjIVt6zLkvqVVJfRZAHcDu6Jk/2X20xbxiMgs6gknEGWb4jqvfvsk8xoHG1P0M/H6mIik0LV1Xt5@lists.infradead.org
X-Gm-Message-State: AOJu0YwP/IYsGpiN5TsXz0hsH9UfInQezwRy1U3JTceU15MRIcmJmFxB
	mVQM6Bd10QYhD9hE5xW8uGg1atPNcOgm2oFQ6BWld0qebZQk9mwzwULboFgIjAWUsA==
X-Gm-Gg: ASbGncuW42hknD08YCvXKwcfg8Xs8tRc/Pgum/0/jAUGeXJHJlQ60qQ9T/mn94ZZOy2
	/k5d4pqLYgxVi3/z5BcLa4Nn2ZXUuMGnbBqZtKHHKVL3fHYqwjrHsxXwhopxvHl7uw5acogh7jN
	EZzWmrVZTAK/6O9xA7wsqJoxIrjHeMy1baTCAIE/QynQEVW0OfIcjgtrg7WlBo42dfhOug/Rl9S
	vK2b7ZBlnna1fNwf9dBh+sxJiLgD2ZrG/Tj4sP2Rh6fhr3potSMjcaK2TizfI5j+MRfJpXDEYIc
	xaOSkm/jVNUgtb386lx6FlWg2qiLoEI0ZQbWnUuKE7Z5Cw5LO94Ud0nTYTbmvt4G/CocMekklJh
	/2W/3/Hxx+MUbKrICLTrB8GbingIOpkDaK3xY7MciVO4rm4ba9wuk7hdNMhPw+kNLeoiXYA==
X-Google-Smtp-Source: AGHT+IHnm9FwdHAPOXF/eEjid/iWJ/+0RKN/ZPnistvH7jALBPjgIBevgkp2XifrX2DSJ35JmAkJcQ==
X-Received: by 2002:a05:600c:a10d:b0:45f:2940:d194 with SMTP id 5b1f17b1804b1-4601d6b4da8mr561855e9.2.1758031458150;
        Tue, 16 Sep 2025 07:04:18 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e0372aea2sm233815705e9.7.2025.09.16.07.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:04:17 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:04:13 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 03/28] KVM: arm64: pkvm: Add pkvm_time_get()
Message-ID: <aMluXZfrvg_-fhMN@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-4-smostafa@google.com>
 <aMA2ugNakqrA1Pg0@willie-the-truck>
 <86frcvd3hb.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86frcvd3hb.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_070420_387540_72CB76F8 
X-CRM114-Status: GOOD (  30.99  )
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

On Tue, Sep 09, 2025 at 04:56:16PM +0100, Marc Zyngier wrote:
> On Tue, 09 Sep 2025 15:16:26 +0100,
> Will Deacon <will@kernel.org> wrote:
> > 
> > On Tue, Aug 19, 2025 at 09:51:31PM +0000, Mostafa Saleh wrote:
> > > Add a function to return time in us.
> > > 
> > > This can be used from IOMMU drivers while waiting for conditions as
> > > for SMMUv3 TLB invalidation waiting for sync.
> > > 
> > > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > ---
> > >  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  2 ++
> > >  arch/arm64/kvm/hyp/nvhe/setup.c        |  4 ++++
> > >  arch/arm64/kvm/hyp/nvhe/timer-sr.c     | 33 ++++++++++++++++++++++++++
> > >  3 files changed, 39 insertions(+)
> 
> [...]
> 
> > > +#define SEC_TO_US 1000000
> > > +
> > > +int pkvm_timer_init(void)
> > > +{
> > > +	timer_freq = read_sysreg(cntfrq_el0);
> > > +	/*
> > > +	 * TODO: The highest privileged level is supposed to initialize this
> > > +	 * register. But on some systems (which?), this information is only
> > > +	 * contained in the device-tree, so we'll need to find it out some other
> > > +	 * way.
> > > +	 */
> > > +	if (!timer_freq || timer_freq < SEC_TO_US)
> > > +		return -ENODEV;
> > > +	return 0;
> > > +}
> > 
> > Right, I think the frequency should be provided by the host once the arch
> > timer driver has probed successfully. Relying on CNTFRQ isn't viable imo.
> 
> We can always patch the value in, à la kimage_voffset. But it really
> begs the question: who is their right mind doesn't set CNTFRQ_EL0 to
> something sensible? Why should we care about supporting such
> contraption?
> 
> I'd be happy to simply disable KVM when CNTFRQ_EL0 is misprogrammed,
> or that the device tree provides a clock frequency. Because there is
> no good way to support a guest in that case.
> 

I can make "arch_timer_rate" available to the hypervisor, but I'd rather
just to fail in that case as Marc suggested to avoid complexity (and due
to the lack HW on my end to test this) even if we check this only for
protected mode.

Thanks,
Mostafa

> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

