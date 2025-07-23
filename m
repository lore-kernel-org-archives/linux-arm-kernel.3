Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1386C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 19:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgyxBCBooV+1URrR0k+S4ytxsHSs18Tgj8DW+tHKzAo=; b=ymRNCw5xXe8Jb/Iv1uK8cgLd2c
	La763qYY3Wlohr7yq/zxiUBxbpy3ZYQHsoNjF9D19XUAyhQrPJ7rMH0mwtuAeDa+qMPKHzoysNkYo
	eIqaKxcYxC82jXFhDJmQUzsxMrd9WLhhE2a7SmV/Cz2+ZIIDWRBGHuO+7V3b3Pm828xTutkvUgUEK
	8BD3t4aLi/0sVtesWR0XcQHh+y9B8Oa1vKRaRuDw8h28ei0NDE2tEU5VkmGkwQkNo1mL646Pw1rn7
	a98wvajrNv/8kxQc+BIxLLZYtqutmzXsGUALq5tDcCCYQ5Okikc5tBm98LYrPKNUOqGt8VK7406SR
	YMCFh1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueei3-00000005n67-2vju;
	Wed, 23 Jul 2025 19:00:59 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueefa-00000005mkZ-2VgJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 18:58:27 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-235e389599fso38425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 11:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753297106; x=1753901906; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tgyxBCBooV+1URrR0k+S4ytxsHSs18Tgj8DW+tHKzAo=;
        b=HLwbUy3Y/J9zgnjZdE1dDnkw0jN0iUNEznlGBRhTAzK9J/zro5fSUwUTnFOLn8DO3U
         jX3s40Gub4XgAUEkKM8YuhYoK4Akx9boPsErlaY4jF0VAlRwsiYHrhjhrwB9gfcpn5ZQ
         StOVuVYKsWOfQwdJE6/VuElCEL/9l0ga7MIZw+5F+MtXxiiI9KUjlJy9kLgeR8ZB7jqJ
         vw6CAyWl+ZbGtAX2YdvW/AVq8dbNqE3XLskolL2093ITrvTRVOOXE5NcFJjAMvu8bOTv
         k5aeM6vf97qAT7pu2x9MLp5WaF+wr+e7xLbUanSr40DV8HmgdJoSNDvMAJWTh1gW4J2f
         wYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753297106; x=1753901906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgyxBCBooV+1URrR0k+S4ytxsHSs18Tgj8DW+tHKzAo=;
        b=f8+pOZpw1rg/eJ3UIYfXjhGXiFk/pPrLUORZ3282GgRNOaXYdrtnGWh+aogkd7uH0M
         /e/nEWoyzGs2ocT7rHfQqOZlGMZKkdIaoFcx0nrerIY5Kobvdtr5675O3fe0s56rx2Pw
         x7YAkZJK8C9RsqZLZXMyrJ/UMnVOFLMVacvf5H+MjG0wy/eTjcTtv0XDnsD1YeTE1ZQh
         8HDCroafnS/ptPEIpDr+JMW4WnPMH9qthHUe2HD3PyQDUYSk/Dr9YczogdAogyin9dHk
         um6TgiCk1wb1X/9SGlfmjW2sRkbOo8F/B6NLQ7ucZ5+MzB00uTDgFkckF60ZzvdWZpJM
         KC7w==
X-Forwarded-Encrypted: i=1; AJvYcCVehpEIIFJv57UPCiwuI7Vmf8baqqWJGWhO6XtIxwIA8Lu3U63m0sPh6nWC/2RFY4+D58U+fVIpPiKAMJ4JCrEU@lists.infradead.org
X-Gm-Message-State: AOJu0YzIPBr025j4+hirhqPZ09ZSCHmr0FjeKZ6IqjUuHH1bhQftNKgO
	MwbLGFGm6RrLgxmmPiowLHNJFvDXhfUYfa73U42SOlSEW+m/rrJtnCSS7Vmsv3AMCQ==
X-Gm-Gg: ASbGncu2ORsebdXNV0ovbOvQbGh0dGE9uwYXwcnLE1GOpSom3NWn01DMurZ6nFYEOjY
	eOxIjrcfD3DVxshkShAuQArSbrJ2wfNPL4ZurNDQfk1aiSx6ooPrLCoOav3nsiUAq4vaS4A4Mwg
	h3WN7avn0pBUMboB1h8eTQ0nKOBqrBF4PXMdW4bFT/M1kO1F1jzWFv4y4g33WuNfyU1jGmc1yLV
	5X+YjNDiUoDBWfoqPyloptej20LQv1Dzwjd640oKNRmpfAZtUqa6cQZEKepyTcMxhUD9Eyi5T+R
	2Kio2lFoXvmcZybd58eucpWCM0Iqs5LrkGXmfw28o+N2JyN9r4D0TW9Gbf6NYxqUiZSbNjy37fm
	sluoMF1H4CUrVA+edXFNudQ1O40UDX3uqW/qM2qS9B7qdJBcFgtLXJL7l
X-Google-Smtp-Source: AGHT+IHUkgfjZ7uajnt2ygxd4BiWFzqlf8/UuEEurXoZ/+uZ0jw37E8kKbO1K9MhbyfBxy1R4DSPBQ==
X-Received: by 2002:a17:903:124f:b0:22e:1858:fc25 with SMTP id d9443c01a7336-23fa2ef97efmr184175ad.9.1753297105524;
        Wed, 23 Jul 2025 11:58:25 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbd66eecsm10238885b3a.142.2025.07.23.11.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 11:58:25 -0700 (PDT)
Date: Wed, 23 Jul 2025 18:58:20 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, will@kernel.org, joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIEwzM7mKUI8-h9U@google.com>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
 <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_115826_637289_C94C0E19 
X-CRM114-Status: GOOD (  27.17  )
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

On Wed, Jul 23, 2025 at 11:05:26AM -0700, Nicolin Chen wrote:
> On Wed, Jul 23, 2025 at 01:37:53PM +0000, Pranjal Shrivastava wrote:
> > On Mon, Jul 21, 2025 at 01:04:44PM -0700, Nicolin Chen wrote:
> > > @@ -1273,6 +1279,10 @@ tegra241_cmdqv_init_vintf_user(struct arm_vsmmu *vsmmu,
> > >  	phys_addr_t page0_base;
> > >  	int ret;
> > >  
> > > +	/* Unsupported type was rejected in tegra241_cmdqv_get_vintf_size() */
> > > +	if (WARN_ON(vsmmu->core.type != IOMMU_VIOMMU_TYPE_TEGRA241_CMDQV))
> > > +		return -EOPNOTSUPP;
> > > +
> > 
> > Nit: I don't think we'd expect a call to this if the vintf_size returned
> > 0? I see that in iommufd_viommu_alloc_ioctl, we already have a check:
> 
> It's added in the previous patch where I explained that this is
> to detect data corruption. When something like that happens, it
> would be often illogical.
> 

Right.. I got mis-led by the comment, my point is that if an
"unsupported type" was rejected in _get_vintf_size, we wouldn't be here
calling viommu_init since we error out based on the check in
iommufd_viommu_alloc_ioctl.. but yes, if there was some data corruption
that changed the viommu type between these calls, I guess it makes sense
to check and error out here.

> > And call ops->viommu_init only when the above isn't met. Thus,
> > if we still end up calling ops->viommu_init, shouldn't we BUG_ON() it?
> > I'd rather have the core code handle such things (since the driver is
> > simply implementing the ops) and BUG_ON() something that's terribly
> > wrong..
> 
> BUG_ON is discouraged following the coding style:
> https://docs.kernel.org/process/coding-style.html#use-warn-rather-than-bug
> 

Noted. Thanks.

> > I can't see any ops->viommu_init being called elsewhere atm, let me
> > know if there's a different path that I missed..
> 
> I see it as a precaution that should never get triggered. But in
> case that it happens, I don't want it to proceed further wasting
> precious HW resource given that this function allocates a VINTF.
> 

Agreed.

> Nicolin

Praan

