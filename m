Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47973CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 01:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkcXxIwae3ZkBqRFobExjF5BmBij71a6Agx7B+x/coo=; b=Pv4ipiXQ+XBQQG4SKRAENnoblC
	xZ1LqCKtzA0LGuKrRdt/FkwoRIO8Yp9rY9X8jklNk0TbFSgf1GrJ5i24vINkEXYBfveBfVSu1TDQP
	BqooLaYvwPlT9vshWVFtoK+TvCuqXc86bn7l/8M1Qs2kUyXvKRohXf6k9BM8jgIzooqefxhUV4e3Y
	U1x8w8vhtnd49dp9hAj1ya1Q3uTU9UY/mIqGpb4fyGxoC5tXdrnIpaAY/pDrWUZQLkqo+wjRjLE1A
	gGz+QOiffidt5qYir+hZCojV+lh2E8Tu27tMWpwFP4tzRS6anADhPPAoYizAap40hLDltAfazJakM
	5jbJNnKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUa8z-0000000E1jK-375H;
	Wed, 03 Jun 2026 01:11:41 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUa8w-0000000E1iu-3Q9A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 01:11:39 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-9155183b42cso23565885a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 18:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780449097; x=1781053897; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OkcXxIwae3ZkBqRFobExjF5BmBij71a6Agx7B+x/coo=;
        b=Xz416tUbBEBAVKsNm5XcmALV77CKxu+Pj5OCfrbo7UCOsyLDkaVg7fFMOX0WQNNuOf
         S6YBQ+itGdvmkPoTXhQTOGERyGc7MjVIck8qmznHig1+ZljHCcVWRXjflRT4OUyo6fSZ
         XSnb8oF+bMWpz/tMett30K+ZFYlezs/2ex+tYIzUJw04oY8NQEcRD1I6dDMR0am/ez7G
         3eY6o1IzayH/Yxe0iM+kkvAzgfVSg2r5157bPLXL+lXEIzNPBo0o2368vrgsgANz4wEl
         vQG1cOlcQ2XdBppcXXCmKSsES/lXqJ8seMRF7mK2x7pAu4IBHGeb2ZOffi9pfel4Lrij
         0boA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780449097; x=1781053897;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkcXxIwae3ZkBqRFobExjF5BmBij71a6Agx7B+x/coo=;
        b=gs6d7N/xndb9FL+LU5SNdh7hbig85R4lIuEa5e9bB6wAbQw1KpG3wqpUd+Slb0aF8Q
         6oqFY8YMhkRzifpOPoaAbJgnviNrSVAZ81yFgFarRbC2AkEmsKs8DSjtysNRwsU5E6q3
         Hgo0l2aQGFnYNOokT3uOSRggtUQIeyNW9xfCYp/RjgMf56rNXqW2vb6sDeRdnNWbaM/n
         gM8pU5SmxRhEkrr/FG8JwzU4ibuz5XJ+KoxkDahAdDnLhAXAnavgBlw1/bL/wrpXC1BP
         sCq1N5lbHPgZuv+Uxg7cp8H/TQd/gg8FPJN20Z6MGrkQU7bhz1gJGIx2+6YUFBINi/M3
         2pdg==
X-Forwarded-Encrypted: i=1; AFNElJ9VAf8/Om7KJpHGagnH0ASXkRCmjEYwqSeFx5JewmaQEHOOJS3yEsIh1RBLuMaDlQtz4MsPFYz4sdyyDlCpFbc+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl6AUoPiTkItXW2bDXan8oS9++wBFQ+EG5BTrRwb7aZAeG4oOU
	iH7uaPQbEMhUFg5G726MufQUZUaZoJYf+pqaXsTzvKOdcQTu+wLm+NcE6Ae+Sf1RsXw=
X-Gm-Gg: Acq92OFNdOS3x9nCr8zsXhAs3YiJauUbYdE3Ub5D3ZBUjH7oCgeBxYkDDn4EUJpWqy5
	xMgs/AVTs+8en55dbE/JsSt00Wad3Dl126IR1jvX39tBu+eXTQlFN3yOYNSwItxs3vWBN7xjqWk
	Xehz0V8PBhUovcirwur6MfpDlqb+2Du40Oidr0EA5MsDX2iZ6Q0iwyKt7XIxihZPcjD2Clh2SkY
	9I9SjN/n9hxbDM+qRkwbPgHrmgyyQvRhs98kJPSirBuL6hIreiQ3P3b+qAXCWi1lhYm3C1mVH1f
	FAv/VbX6043eUekDwoMLmIazRaCvSyc5sXWyeVYNQl4gCKuwBRKUbWfVHyh7xyitwVJifkckY6T
	nI50YHqHa7yEU9dBHrBf76uo0m2By6XkzowdTpFbMhtr+PYTe75Ahq7oIwzOJSSualB+J8DMJhl
	iSE6B8S0+0yPTUppR+KOVn7PpqAwVkDG0xl2a0RnGOu9AEdDSbae/h63lc8U1M7jfrB+pnC7Tyi
	6szNTgOf2lW16hi0zfXcBwJ9ss=
X-Received: by 2002:a05:620a:31a9:b0:911:c5c0:d5f2 with SMTP id af79cd13be357-9158b5cbe4dmr170236985a.1.1780449097421;
        Tue, 02 Jun 2026 18:11:37 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a009fb2sm107640685a.5.2026.06.02.18.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 18:11:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wUa8u-00000004yOx-1sfF;
	Tue, 02 Jun 2026 22:11:36 -0300
Date: Tue, 2 Jun 2026 22:11:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Guanghui Feng <guanghuifeng@linux.alibaba.com>
Cc: adrian.larumbe@collabora.com, airlied@gmail.com, alex@shazbot.org,
	baolu.lu@linux.intel.com, boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org, dwmw2@infradead.org,
	iommu@lists.linux.dev, joro@8bytes.org, kevin.tian@intel.com,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	oliver.yang@linux.alibaba.com, robh@kernel.org,
	robin.murphy@arm.com, shiyu.zsq@linux.alibaba.com,
	steven.price@arm.com, suravee.suthikulpanit@amd.com,
	tzimmermann@suse.de, wei.guo.simon@linux.alibaba.com,
	will@kernel.org, xlpang@linux.alibaba.com,
	alikernel-developer@linux.alibaba.com
Subject: Re: [PATCH v2 05/30] iommu/generic_pt: implement iova_to_phys_length
Message-ID: <20260603011136.GR2487554@ziepe.ca>
References: <20260531093637.3893199-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260602104637.1219810-6-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602104637.1219810-6-guanghuifeng@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_181138_884475_A986B508 
X-CRM114-Status: GOOD (  12.93  )
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

On Tue, Jun 02, 2026 at 06:46:12PM +0800, Guanghui Feng wrote:
> +static __always_inline int __do_iova_to_phys_length(struct pt_range *range,
> +					       void *arg, unsigned int level,
> +					       struct pt_table_p *table,
> +					       pt_level_fn_t descend_fn)
>  {
>  	struct pt_state pts = pt_init(range, level, table);
> -	pt_oaddr_t *res = arg;
> +	struct iova_to_phys_length_data *data = arg;
>  
>  	switch (pt_load_single_entry(&pts)) {
>  	case PT_ENTRY_EMPTY:
> @@ -159,45 +164,53 @@ static __always_inline int __do_iova_to_phys(struct pt_range *range, void *arg,
>  	case PT_ENTRY_TABLE:
>  		return pt_descend(&pts, arg, descend_fn);
>  	case PT_ENTRY_OA:
> -		*res = pt_entry_oa_exact(&pts);
> -		return 0;
> +		break;
>  	}
> -	return -ENOENT;
> +
> +	data->phys = pt_entry_oa_exact(&pts);
> +	data->length = log2_to_int(pt_entry_oa_lg2sz(&pts));

I really do want this to accumulate the contiguous length if we are
changing things like this.

As I said before only iommufd needs to do this, the other drivers
don't have to, but the wrapper should take care to give a consistent
result so we don't have callers open coding another inefficient loop
on top.

vfio and iommufd should call it exactly once and then move on.

Jason

