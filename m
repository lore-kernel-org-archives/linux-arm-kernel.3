Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DD5CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 17:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ib4XRsG2e4tlDimBfCEgugHOngPORoyq0KGAVzHdcZE=; b=QIWvHYiykna0215OXuz5m/qzom
	iRlIuPwWkLR9Zv+Ig+lO++eSDzh6i6fZ6ywc/dOzstJ6jzLYsTHlyXEqvvsZkBrv0m61DL3PXnLDG
	RjxgUWtwQFdtGUKv6va17zyLv/r0kYsaT4veg6BuFzsrywItZcF12oFkez2S1e79MtXCAaptUcCY7
	JC9oZEdYj64t5AfY6CTxAV56cS8Yx3QPH02z3Z2/YcEp7WWfQjVMIL0wMArOfDn6ama/PFU8smJJf
	OLn0Oyq+5NU3CX1aul8z4Pe7kx9QYHO27PL88Tr8zRNNI7GF9/gNbD1g63CUbJ0hZ6vWf5q9dzbwZ
	i3VYc7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLlC1-00000009JoE-0lb0;
	Sat, 09 May 2026 17:10:21 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLlBy-00000009Jne-1eP0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 17:10:19 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-8eab809593cso325068785a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778346617; x=1778951417; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ib4XRsG2e4tlDimBfCEgugHOngPORoyq0KGAVzHdcZE=;
        b=KDvGXJSeGzp/FNYpdne0CBmLUfpZA0TPx/CFF7YTU9rNvvmynUoYBSn55W9xDzGbe1
         CuxZzfR+qoECgsw7I6+oJV7Rjc2bQfNptdu/YEa00gqZQaOfoyr0UZy1OdWdsHzNW79i
         2S5uMv/AcleI1+PrpfuTzj+aIua45s+KiYMASq8+fow3KwoIlYDH6RpCmYA8ptqkyiOm
         gHRKAIsMMkOK+o9djev9sebbE3vY+BH8Dk6KSlparroxgDwdturPPEPR1zBnhyrFKJPm
         Ydu2jROFH5QE7pNmoobdyZDVN+kYBI/zYBKyIhlVwr0O1W/EbKUCfVg7Bo4D65F8aLzZ
         Ramw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778346617; x=1778951417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ib4XRsG2e4tlDimBfCEgugHOngPORoyq0KGAVzHdcZE=;
        b=hbcBJqbzmO1LzRC3nbbxcKaXRie8XwYnKlDQjnDVViDYpdALpwte1oxWpXk1wY9OLk
         rAqZzuM41ZF9iBbCXIMvuM1Pwdy/Q0C19hZKcpnBmrm7+QAjwQXObIaxuwdY2SlV5JY2
         +/StlxHkhoGRKogkR+QHk99ZA9iL7PHCqjKfuL9N2z8/sCbWhNaU+iZvCsoIu2FKFIYT
         d5qclGc54MPjoO//xLTirVaJXGeaTGt6z/a8ueYeojbBYtjgL4XStq1VlM1S2MIA8iRF
         b3r1WpkrWgug7jLMI3lstiZdFfrYmIw5Wed6hDhp1q/36IcSX+6bxEqcXvylpwbWHLUQ
         Cw+A==
X-Forwarded-Encrypted: i=1; AFNElJ/YNwCHIEhNmbEmqTJBgMX7IY0wJG5Fk2EBiL5007sZVZKDch30Sw3bRf37nYYXxuIEMZp1mL5zXgyT9rTLDD3q@lists.infradead.org
X-Gm-Message-State: AOJu0YykKb72ypxjVHQ3l7tBTDCD0ifReDfg7onBydLt4NPg1skW+qwb
	zfI/K4YbfH2AZ6kTEC3Qb9yiRPeFubCLkPbPHjHyvNH50xJM11CQt1q3eB7gQso7PhQ=
X-Gm-Gg: Acq92OETloPgedXpTNjp1cnOjNev5VWxeh1eTw3rYFK2oQ6bhq1+IGSJBS4zn2nXagm
	lbePalqzY+Yq82LwAMbAfiZXFjSbavyniq0Aqh1vGcSHk/7iU6p/Ppsi00hwhWe0gNPDVzghhqy
	V2QRUDyhMWOssAOnoRcPxH2YVYvMoPbTGwFJJBBEnjcS9oCc+23clL6U+G3zfXy6tavI8NEsIZE
	x7Kzq8wP5XkWSrOdTqbgOANgGAyaXLdUfGGuZbp2QldgmOlM9GHZrbjzoWLAlqs+MEXJbk6vBKJ
	HJJDlaCk1RUaSerxA4Frl5YizQiU1zJ1Zr7GJHEZs77TG4sXv4y8fub7BbDg2eH/rAU9RS1S4U3
	PCSrXrSIYCuvupROkjDuOHCRzyrsS/M8xCGIvtgncUqEVyocDG9gkyT0BKUKfCvHgnPozQ9N5TR
	JWcnXj3iFohWR63RMCADpXPJZTyVkiP2aggMNxIA4gQyYPv0lZDfcKZjU4ztrq4GTbVH0c3iQg0
	J9WGg==
X-Received: by 2002:a05:620a:44cf:b0:8ee:cbf0:8311 with SMTP id af79cd13be357-9091072fa59mr433663085a.54.1778346616735;
        Sat, 09 May 2026 10:10:16 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm552694685a.19.2026.05.09.10.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 10:10:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wLlBt-00000001qju-3hnc;
	Sat, 09 May 2026 14:10:13 -0300
Date: Sat, 9 May 2026 14:10:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Joonwon Kang <joonwonkang@google.com>
Cc: Alexander.Grest@microsoft.com, amhetre@nvidia.com,
	baolu.lu@linux.intel.com, iommu@lists.linux.dev, joro@8bytes.org,
	jpb@kernel.org, kees@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	nicolinc@nvidia.com, praan@google.com, robin.murphy@arm.com,
	smostafa@google.com, will@kernel.org, jacob.jun.pan@linux.intel.com,
	easwar.hariharan@linux.microsoft.com, kevin.tian@intel.com
Subject: Re: [PATCH RFC] iommu: Enable per-device SSID space for SVA
Message-ID: <20260509171013.GF9285@ziepe.ca>
References: <20260424133953.GY3611611@ziepe.ca>
 <20260507095851.3220765-1-joonwonkang@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507095851.3220765-1-joonwonkang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_101018_478085_09369590 
X-CRM114-Status: GOOD (  19.36  )
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

On Thu, May 07, 2026 at 09:58:51AM +0000, Joonwon Kang wrote:

> By "similar instruction" on ARM, I guess you mean ST64BV0, which fetches
> the bottom 32 bits data from ACCDATA_EL1. Please let me know if you meant
> others as it will matter. If ST64BV0 is supported on ARM, however, it
> would mean that ST64B and ST64BV are also supported already according to
> the ID_AA64ISAR1_EL1's LS64 field. The latter 2 instructions are just to
> atomically store whatever user wants to a memory location without
> referring to ACCDATA_EL1 and all the 3 instructions can be run at EL0. So,
> the userspace driver would have enough capability to designate arbitrary
> PASID as it wants via the latter 2 instructions when communicating with
> multiple devices.

IDK exactly what ARM did. IIRC on Intel ENQCMD forms a special
non-posted write TLP and the device can tell the TLP came from ENQCMD
and so it trusts the encoded PASID. ARM has to have done the same
thing - allowing anyone to forge the PASID by using a different
instruction misses the point of the Intel design.

Honestly, I'm not sure why they even implemented it. SMMUv3 can't do
the translation scheme required to use ENQCMD from a VM anyhow, so it
is pretty useless.

> We have multiple processes and a single device, those processes want to
> do SVA with the same device, and only one process will do SVA with the
> device at a time. Though, the problem occurs even when irrelevant
> processes allocate the PASIDs from the global PASID space for their own
> irrelevant purposes.

The only way to allocate a PASID from the global PASID space is to
establish another SVA, so you have multiple devices doing SVA?

Jason

