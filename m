Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2150AD59D71
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 16:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frjawGCw0cne3ietsxce3al/KlU0ywLGbRoWqjDTmUo=; b=WpE88n4dZGEsUWS+S4qmCkJOTd
	GljJa21b9RGwz8d/9Re1WiNAqDxtwvuTsO+dOSBphulkRh/dXZ3xUCWiWv43xs3jjjMiQXwJIXio7
	eWdOFpLsvGlD9kaEvIG4elT+zp09qUvrA9a7PYGOZrFqwQ0JXUFXnD5qB0SP0FAKkAcSXwzGJj4pq
	74CM42+m+aZ+54pyEAZJOwwpDOBzFQ3HNSGYp6E+PMMIukLpqJihUjvLINNY0ajQlP7EdP91D94re
	SUKXenKJBkHm6OpAs6wHUt88LcfjYXLOo8zAac4QKJLcWdXQJRAdZzRJVO2wf2XCNImZa+ZF3N0YS
	+FITI+IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5nz-00000000owV-41hT;
	Fri, 12 Dec 2025 16:15:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5nv-00000000ow5-1uzw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 16:15:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-477a1c8cc47so171505e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 08:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765556138; x=1766160938; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=frjawGCw0cne3ietsxce3al/KlU0ywLGbRoWqjDTmUo=;
        b=IEz3BMGUB8nM2D9sLlL/jL4Sk6b0k8Wm0eNSzJz7zwga4xADqpFVYJko2WVOacwfY4
         GPS1f5lOPelXXYw0kZdAGLdT1qwFr//ETqYfy/I0SEx/jpwkIo9NtAq+C/3nYCF7YPA/
         ipJ1lNnccEUgYI9r+jZZmVrG7KrqGothJEluEGUt42rLYvr5JtGF13tXqiH31pSF/sMu
         P9WSWZ9vh3IWn+QKzKnG3qhFQvWd7iBFMx6UfoXyvSKsZWPDVn/BgNvzZ7tg/9bdQopS
         w5Rik2pQ+vytRuMc6bjqbvaTnYD3ShRsmsr2sDj6CBlusnw83LleOGBJ/FuxRziUX1CC
         GQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765556138; x=1766160938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frjawGCw0cne3ietsxce3al/KlU0ywLGbRoWqjDTmUo=;
        b=HscP7LO/VavOeF9XpWb4E+hcsiurWviGNQza90eMvuZdZN9ZUSceO0YzeIdE6D1P13
         xpytbHuO+SDoCPct7PuodCaUKTg4igJOHqapEquJeXx1PATLEnrhOWn499jUXd/3hbfB
         nR1YKh1uKNCbPPwjOoUf1WnJvDY4zCECfjwswlR0/6qdyF3lXPeWskmdjEX0ieCCM8ME
         8/Dz1Pi85XMEjcPx8hWLLHXYDIhyaxMyuPuKPrXyxJeySztLGnjtm7q528bQ345ldPh4
         su71XETgcmHj8wH1Gb/iT4q96jYlKxr/UJ6Mb5ecERQzTVmAdX3ytO5BpjQmSZuK3/5n
         9Lgg==
X-Gm-Message-State: AOJu0YyxWjmMLLVHAXTO6cMjeWQVUzKoAWCdADPE+N29F9HGQ5cKtrqs
	GyGa52oeyesVot9eHrjnK0R/7iwXmzgjvdmWWICX8mNc0XZfk1dKDekCPruYho7vWTuyTOIO4Ea
	i/1+KfA==
X-Gm-Gg: AY/fxX4zKOF6ePTm2HQvd8o69jJHLhmYacGUgZJSGFYkOXyPlZleSR522bo8tN21+5q
	EB3/8CzeFRiDNp+olXHcXMSzYoxiKTFOvkf6UIbG15C2d/rqZcsvOaEg8LX6y5uI11R0rUBE65S
	aN6HYBdtfjv6aFx7rK3GVNkpLxTMz4e0YsPySfj57ooLq+mZZgnnwNpWWDP9+vzCoVd2QxsXhyL
	Yl8DLRfTdxlUAihsqNk+x6XTsGCikb4yW+MI/1oCxAorG0ZdiBCaIlnCxxx2GMW4UHeAC2v/ic8
	+8s+xVWatgZG8SFWvAQMryPiPCAcbcOBhEB+M795170veosaYpFHmg8kpRXAgX5bBKO5c7LmtFr
	+elxV1zZZXKMvDxQTo0KeUFI57SsAOKLp7H38vtiH0RKXlA+m97nvZR5rZ3mM4o5FtRQLNTyiAy
	8wNg32J0zOCRIPBw31lq3aX8R1DjefP3xH1G+ncQx4iY9B2DH1ow==
X-Google-Smtp-Source: AGHT+IFLv4OTi7EK70u2qvgXNHw6cjKhs3ugO63ipp+5tWwT+3KODquOARuyX6zUO1as6i35ut2QZg==
X-Received: by 2002:a05:600c:4a2a:b0:477:95a8:3805 with SMTP id 5b1f17b1804b1-47a8982139emr984895e9.15.1765556137476;
        Fri, 12 Dec 2025 08:15:37 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f3352a0sm14417635e9.0.2025.12.12.08.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 08:15:36 -0800 (PST)
Date: Fri, 12 Dec 2025 16:15:33 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 27/27] iommu/arm-smmu-v3-kvm: Enable nesting
Message-ID: <aTw_pZ7ZyhwFW7-3@google.com>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-28-smostafa@google.com>
 <20251128171252.GF812105@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128171252.GF812105@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_081539_514905_BDA3DE33 
X-CRM114-Status: GOOD (  25.48  )
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

On Fri, Nov 28, 2025 at 01:12:52PM -0400, Jason Gunthorpe wrote:
> On Mon, Nov 17, 2025 at 06:48:14PM +0000, Mostafa Saleh wrote:
> > @@ -441,8 +490,32 @@ static void smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
> >  		hyp_ste_ptr = smmu_get_ste_ptr(smmu, sid, hyp_ste_base);
> >  	}
> >  
> > -	smmu_copy_from_host(smmu, hyp_ste_ptr->data, host_ste_ptr->data,
> > +	smmu_copy_from_host(smmu, target.data, host_ste_ptr->data,
> >  			    STRTAB_STE_DWORDS << 3);
> > +	/*
> > +	 * Typically, STE update is done as the following
> > +	 * 1- Write last 7 dwords, while STE is invalid
> > +	 * 2- CFGI
> > +	 * 3- Write first dword, making STE valid
> > +	 * 4- CFGI
> > +	 * As the SMMU MUST at least load 64 bits atomically
> > +	 * that gurantees that there is no race between writing
> > +	 * the STE and the CFGI where the SMMU observes parts
> > +	 * of the STE.
> > +	 * In the shadow we update the STE to enable nested translation,
> > +	 * which requires updating first 4 dwords.
> > +	 * That is only done if the STE is valid and not in abort.
> > +	 * Which means it happens at step 4)
> > +	 * So we need to also write the last 7 dwords and send CFGI
> > +	 * before writing the first dword.
> > +	 * There is no need for last CFGI as it's done next.
> > +	 */
> 
> This really should share the main driver logic to do STE writes in the
> right order and try to avoid making it non-valid if not necessary.
> 
> This will not properly support all the real-world kernel flows around
> PASID with such a simplistic implementation.
> 
>

I see, would it be OK to keep it as this simple now and add this later,
as this is still early support? as I want to keep this series minimal.

I plan to have another seires with some improvements and optimizations,
mostly about page tables (using block mappings) and I can include such
optimization, specially that the new hitless STE stuff is relatively
recent in the main driver.

Thanks,
Mostafa

> Json

