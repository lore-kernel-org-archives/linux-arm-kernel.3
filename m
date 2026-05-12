Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BA3CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 15:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vWXMLSbqiyEkH0k1UKJeayzUqXsbhd23PKmYFrT067Y=; b=prhkDcY8VyQfYTrsOSkDBZYQ/K
	JF5fQaQ92Ctx5HTbs+tE6M/Pj8kUcUjXfBcOUhjh+/7zHvKfQCcLjk/ZujxJ/lW7tkTQWrx98Dwt4
	q35sgp8YF05SrB1v2UDhq4Qs9e8LcDJfNBsMtRlUnf67JUi+LIckE8F0XyjwS03kQ4Kihs7OUJ+kl
	js/IK1Y3uMfM/OsWcLAcLuhzxKcwTU4KO+QGl3AL1IHuWwSJWqfegqczM/FfUT1Jl75R79o9fEK49
	WQui7tpx/4KGELkxZ6/CLdN7TAHJtgSX/rxXakm7xeUX7xsFCsSOK6kAWjSh0x77VuhP3IiuM/3Bd
	RzgDvLUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMolm-0000000HATn-13zQ;
	Tue, 12 May 2026 15:11:38 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMolk-0000000HAT3-1le6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 15:11:37 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-900fa9f178dso612412385a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 08:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778598695; x=1779203495; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vWXMLSbqiyEkH0k1UKJeayzUqXsbhd23PKmYFrT067Y=;
        b=C37sB+VeIB3VyPPEiNvOq8h5ILLgh5chV0B2SosggNF1t2U8XcpzbzIW74ZFscixmN
         t03kPxD4UjrHZ6iuHYddQ21nMolDQcbTrcSvWBLH7LYhGvFuK0XBCmsEbp8rjfC5BFkn
         atQI+L8kRHvH4wBepz/Nii39mpMzLEyYSctNsBJYrft05V5RscE9jEbVEiUgVoO5/SwK
         aYpfFQLTTGkHDpDJB/ni2aHWltSkQieEhq/ozQqfZf0eKx64SaqyZRCxkMxtxR2smZAE
         a5LCpwH4SKLsdv10EUSmSQesBcKv0OsOR8jIoWsmlqppNsZHiYuKGlps57BFQT6ivQI8
         EiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778598695; x=1779203495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWXMLSbqiyEkH0k1UKJeayzUqXsbhd23PKmYFrT067Y=;
        b=DEjoyIEbS98Xfr8L49BNLtRTXKp0um77dpvJoqA7WjeriOupZrV6OC4Iwyqmn3RivR
         BVuJt1taylNZ9Sw/H6qHfI53l+MIcc08YpEWZPYiF+G9wQQLLBmTgWXs/0RjfWpSWwuW
         /UOiRzzavB6UbBPinsW/pBPj4O1U/lDM66rA1rCauKyW67yH4fdc27dOrfFUY5WmTsT/
         x0D7eh/tHXDNu+wzgweN9y5ZbAyxmzOR7g2X/mjjCq6IigcU/6XdXOSf786By2yWYoz2
         E/TxWblvy26ujS+XLO3t9AlFB6yKNZU9EgKv8aVd1Cl4jth5ld3u5kuukZhsBFK1SdOD
         v9+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Vu/80Py/9XPFSf53keMkXYBxM3j0d3FJXp7iWYetrKLVeCJr/Yf71P+T770tc75bJWWiQ7HIMDgTPJdam+n/B@lists.infradead.org
X-Gm-Message-State: AOJu0Yxycn2Z1RpyGZu1ESvkZLaoV4rEgoQ/V+J0SHR8iryhG3zLRfed
	Q7I909Mw7v0mo23blCf8liEQwj8Y55wI7+/6FhRnzSCPG2AoQeoh/xXVbWJLXQWuoSs=
X-Gm-Gg: Acq92OG8HHg5xHuQvGphBjLmQpDKsAORkxFdaMGdI6lUINnG/ny5WxZdVOZQYIEul0g
	ORgAYLnCseCZNWpRLK6CPJt+xteC9UW7ALhzPCsLImntRqR3B9UM+c1ppBowMwy/jiLOluWwoJH
	NtAqQ4gY5epjo1SQBKewkeTb1LTSyNi0EFANk8eYbSev9QFpB6dRuqVV8wPHx5rM8HDBCDeGbFP
	t+VrPjmy9PdR5WOZH0l10edjBfJY3ZaB0R1f1k8dLLqZXx3GfugNv0e3Q85+cVcIEvehzp5+yg5
	QzUjhRPL0Zmc9viyj2bj5M1DLf9N85lF/y6XEGl4XebluXMUEG4QrEf78C8rS+jpjQOKZeY0RAA
	4dXtkA64PZp4KdMfpoUFhs04mkwi+55sADaZ8+PdHQ7X3bIjYopgJ65ah3lnQcMhWx7ClSR9cUg
	xb4bawDdE7RfimO3aDsuyXjzNj1LRBMXxUa2I/KVH6j8BNYSFP4KTR6FVhCbHobNaLiR/VDRFcM
	QUS3tMiFI6WHYjT
X-Received: by 2002:a05:620a:c45:b0:8d6:39c0:e6a0 with SMTP id af79cd13be357-90910ffe81cmr2184465385a.54.1778598694733;
        Tue, 12 May 2026 08:11:34 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b918cffesm1444739385a.14.2026.05.12.08.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 08:11:34 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wMolh-00000000ATo-2WZI;
	Tue, 12 May 2026 12:11:33 -0300
Date: Tue, 12 May 2026 12:11:33 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Joonwon Kang <joonwonkang@google.com>
Cc: robin.murphy@arm.com, Alexander.Grest@microsoft.com, amhetre@nvidia.com,
	baolu.lu@linux.intel.com, easwar.hariharan@linux.microsoft.com,
	iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com,
	joro@8bytes.org, jpb@kernel.org, kees@kernel.org,
	kevin.tian@intel.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, nicolinc@nvidia.com, praan@google.com,
	smostafa@google.com, will@kernel.org
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
Message-ID: <20260512151133.GD7702@ziepe.ca>
References: <b95b42c6-4d10-4701-88e2-9991f3773e6a@arm.com>
 <20260512145138.3414002-1-joonwonkang@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512145138.3414002-1-joonwonkang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_081136_461953_0B3E171D 
X-CRM114-Status: GOOD (  10.94  )
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

On Tue, May 12, 2026 at 02:51:38PM +0000, Joonwon Kang wrote:

> Appreciate all your clarifications here. So, my understanding is that if
> our system does not support ST64BV and ST64BV0 or if our device does not
> distinguish between the posted write and the non-posted write regarding
> PASID, then we can lift the use of the global PASID space. Can I say this?

You should do what Robin said - just have your driver use a per-device
PASID that it allocates and never use the global pasid allocator.

To do this lightly re-organize the SVA code so the driver can supply
its own PASID, and in this mode we wouldn't activate the ENQCMD
features in the mm.

Jason

