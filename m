Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B13CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vp5iopfAmcsOX6ZIRTEf038gXmebvITcztxNgxO/nOk=; b=H4CmleeQ93KdumMv73lDAjgdop
	PIJPe/9vYz0IcmKv9T1GkiX+dj31sp24SkFR6ojk9++5cKH0F38oWsSUGguWn1z/K/AyvA17iiY1P
	v3HTzszZsrVCC452t0Xw55QVf2ktPfweJGloJlRFm8WXvp+59+gF8TXY6i/t2wyIZYguiUUAM6g4D
	o16QTI4bO40+juIvk1CD29pOxxY6uGrppqrhmrSs5wJXguI0aI6r7VHxEa8HZedbOIfI1B26GIfQ3
	s7FY1NCkIXSZsTmTvgWK4Qi6x9FGFj9mnBMTvfAqNGV9YgEPNy7LmluP5SDbaojcyuxdW53d5qBzR
	GjqRwHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIwX-0000000Gwwq-3yTy;
	Tue, 05 May 2026 16:48:21 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIwV-0000000GwwF-1V2D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 16:48:20 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-50e61648f10so8311cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 09:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777999698; x=1778604498; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vp5iopfAmcsOX6ZIRTEf038gXmebvITcztxNgxO/nOk=;
        b=lahoAkiQgXG7b3Bf09JINxwZzwSdfh/Oe1xN1wQAb7/ZT/Gb+JDOEUTTGwBKfbFhTu
         NPjJgJ4lr7pltaPAECQV8IogoCBUya2d4rq8cJeyOnF8Qh8S+47Qv71xaolkEIPwXM2M
         6wXqQ4wgGOICgO9xVMLaxEs9APm2zLz/7EccKN0XndJq0ZkHE8JI+AosOWKQAl7ZRBhT
         3uG6aZn5U2F/0U0tKske9AjS2AnpB/FrMY0AMxkZDa7KAbOg1uJxrmKGv5F5L/ypNVQq
         2BHTd0RUX5PbHV3jNZhm4rsxIABoD39jvV1hR60rHBdKE8gmvjWe1YN8+nAazs2Nuhz6
         xX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777999698; x=1778604498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp5iopfAmcsOX6ZIRTEf038gXmebvITcztxNgxO/nOk=;
        b=bDbEPzzPbd/oeHFzJdvnd0adMrJZ83wwb2a7mULLmwepLUHEqfM/YFWU1K/BVUhW/L
         TzGV6xfspbrSYS1O4cnWQf9fQcF4MP9eqL73+SggzEZNQ2S6B1rbgJf31q/WhzYv29ob
         JLQwNsp2DvRJeDqW2wN64eUKg118vy3OOu2nDXsn3NV+dZkR4gtUZ4W37A1iJf5b4H8u
         PvPK0f8dfSJj0MR9wE2G8PI40rvf4PgDrBhmcBx8l8b+ElZd3DRjlOd2BJeUY/lUqy3B
         pMgB5sFv8tlVvRQVErkaLXOJU+wZrHRYGn+1syOp6CSQ9Yk49zstpoZde8ONeFfH05e/
         Oeyw==
X-Gm-Message-State: AOJu0YxBnIExIFaMyjp2nkC+jekfxTmoHNaBg5ZUIjCDhaRCiu7QemRl
	qKM6OHEHoLgipZMfbqIDe4wcC+6wVYhv9ev1lmvlrdKAmZEizaLkJOlI4Ua/rHh23g==
X-Gm-Gg: AeBDiesq1CgOLq0Ke6u7CJo51FQifh2fZbs4LXVFO/sCc3be5yv4AxEmX4kl5t0jUer
	1p+6v8RR3DE2YM9XUASnlH9yb+AU3gmzrpX4Q9NjmgKD6nEpk+2TyCHlys5hpBXiHdTBiyu3gpO
	9xAeU7tKL9G2imXiDG4Pf7uJBy7FNC6UtuqzA93ogtfMnQ7hjojAnVkhDg/vjEH1R5cZtcBnG8K
	HT7xQqBNTG4FTFVLPFqOM0OviuHSL8i+ZLuEfKD4HqnB278/7vGOHeHpOAG3pkg1yO7iz8bziQj
	fAZXudfcN+jOjAvJgGnOPF09qwVsGId4wioKyxDzSbfOnbHnFeg6wnzGOf4p+rkAecjLG7VU/s1
	fPrPj83DBQ4e49z57c5GjFpFNScD+H29Uj2KGW0ehEe1BKjKOcIt7xawA0lwnfWf99Kn0Fi1dLa
	X0fJlVzk0XodFXrazXTBcZT/vuUD41BBRAllknnlr52wqRpDEMtr/wCkYU+LsC97W0moBPAFsc9
	N7Qyg==
X-Received: by 2002:a05:622a:8310:b0:509:15b6:f6a0 with SMTP id d75a77b69052e-51305908cf9mr15393051cf.6.1777999697103;
        Tue, 05 May 2026 09:48:17 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc29c6fa7asm1340531885a.20.2026.05.05.09.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:48:16 -0700 (PDT)
Date: Tue, 5 May 2026 16:48:08 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 05/25] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <afofSPQbepd_fpom@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-6-smostafa@google.com>
 <20260501124716.GD6912@ziepe.ca>
 <afiODW2sVMeOj3Ag@google.com>
 <afoagb/wVBJD1IX+@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afoagb/wVBJD1IX+@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_094819_404082_60C16C07 
X-CRM114-Status: GOOD (  29.23  )
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

On Tue, May 05, 2026 at 01:27:45PM -0300, Jason Gunthorpe wrote:
> On Mon, May 04, 2026 at 12:16:13PM +0000, Mostafa Saleh wrote:
> > On Fri, May 01, 2026 at 09:47:16AM -0300, Jason Gunthorpe wrote:
> > > On Fri, May 01, 2026 at 11:19:07AM +0000, Mostafa Saleh wrote:
> > > > Move parsing of IDRs to functions so that it can be re-used
> > > > +unsigned long smmu_idr5_to_pgsize(u32 reg)
> > > > +{
> > > > +	unsigned long pgsize_bitmap = 0;
> > > > +
> > > > +	if (reg & IDR5_GRAN64K)
> > > > +		pgsize_bitmap |= SZ_64K | SZ_512M;
> > > > +	if (reg & IDR5_GRAN16K)
> > > > +		pgsize_bitmap |= SZ_16K | SZ_32M;
> > > > +	if (reg & IDR5_GRAN4K)
> > > > +		pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
> > > > +	return pgsize_bitmap;
> > > > +}
> > > 
> > > I think this should include:
> > > 
> > > > +	smmu->oas = smmu_idr5_to_oas(reg);
> > > > +	if (smmu->oas == 52)
> > > >  		smmu->pgsize_bitmap |= 1ULL << 42; /* 4TB */
> > > > -		break;
> > > 
> > > ie it should return the supported page sizes by inspecting all the
> > > idrs and don't leave this tricky bit to be open coded..
> > 
> > This way was easier as each function only returns one thing, otherwise
> > we have to pass stuff by address as we can’t pass the smmu struct as it
> > is not shared between the drivers.
> > But no strong opinion, I can change that.
> 
> Could you share the struct? With multi-compilation you do get two
> structs with the same name and different layout, it is OK?
> 
> That would give a cleaner setup too because you can just shove all
> this into a function and have it setup the same struct which is more a
> copy and paste than break up into little functions?

Yes, that’s possible, but I didn't want to contaminate the main struct,
also we can’t compile the main one for KVM because of things such as
“struct device, struct mutex...”
May we can do:
- struct arm_smmu_device_common: Basic stuff (ioaddress, features,
  oas...)
- arm_smmu_device: For the main driver which inherits arm_smmu_device_common
- arm_smmu_nested_device for KVM which also inherits arm_smmu_device_common


What do you think?

Thanks,
Mostafa
> 
> Jason

