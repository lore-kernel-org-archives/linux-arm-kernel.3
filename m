Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341F4CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GCpEK+1e4PN546tNNVMgEraFuXI3jgId2T+tlphvHrE=; b=06zFqQxNk6/O4Gwt7Yc94NOhnI
	Kn8Q2NHu32bU5MfMdU6YvWnkdWGz/DDY4tAiOR8xHBHLx0bOCgNyJqY7I8mRrT2yTXW8KWQIzfrPz
	PqtT2AQYPu0ACbw7vgN8o2CAOAYkvIcrEekdlgyvxeZRMfr8r/1yTCD3Uye9lIpu+R/ZWvB6pVjj+
	xqQ7472b1SMrMSgUNpuonWRwd+s+kQ/ofyLj+82M2hlhkSr9Ed4O+dGy5ZPLAoamjOKeBq7KP0p2p
	ksMTEC49kq951uBl+WBEbPg86nQe+KrUEPHE2Uo/V4zb04X43KXClBGZrN2TrQXlhxPXvSX4stpOr
	KNDTRxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYzc-00000000Q1q-2Z2M;
	Wed, 06 May 2026 09:56:36 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYzb-00000000Q1D-1o4f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:56:35 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so1630172f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 02:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778061393; x=1778666193; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GCpEK+1e4PN546tNNVMgEraFuXI3jgId2T+tlphvHrE=;
        b=cDf7YXs1yM4VFxZ/sU5jKDjz14pobkYyxXGk0xn3L1WGHhDa+TjbaEF4Z4ZtHVNygG
         FxJKJ098yl7WW8EwSxGKszWFp/LhPeHWZWPFDC3JyB+rNQ3PIDNL9S/F1GKpZwiXaQUC
         VCele8jjXCCtoJEvf9oaWpCVc4qzobt3I+lmt9KhttifzKLtLDfn+ibMsaTu2Hs4jQD1
         qK230wCOwoImRwMCYOsjT8bizRrJGGHL63q4gD2qAvs+BGiF6+SUux4fyXHRlLO7Tf+K
         +wTUqJz3rXOauPP62fdYEGRkvzozwLrEUoGvP6wX0bniEXGqmmBR+r2/I9px75EVgdQg
         dYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778061393; x=1778666193;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GCpEK+1e4PN546tNNVMgEraFuXI3jgId2T+tlphvHrE=;
        b=d+W2zhnN5DAf8bj3lO+V3Qm81naHVyn3seGy27JnG6yeIJr3mJqbb5IqZ+F3o9kspP
         s0rt7fJWYru3R6R7pWsyK1QSgRbZqXGQUeQ/P5qxhViKypjU2ZvtIJ4jOtkAZRVFjBhZ
         W4jRD6siUjzj6XRxQVh0pWH4t4itq4IvZCF8Ibou65S4BPgmyTWZ/i0bAfiVs5oeCBVK
         wGZEMx9dyh6Jh9F11XL1csUk+1Pba7Vbnv8yhRMjMrS27/fEuu1mVphZ8hZ8xl3R64h2
         tbZl5CIZ+508iVWXDYFvxAtNiS9l+EQQoVLNj4OTACp/iYH/kQ+trMRp0UqefW/E6Q7D
         /feQ==
X-Gm-Message-State: AOJu0YzHf7dpK0CdvRzeQCqP/OY3lKnYae3QCWrSI7qJAKI2dgTRfhEQ
	Yy92dqoZpQMLmQ2Qxs7RlKEFEzt8nJhihhD/LvVr5fSVLp3p2dz8mHzdv7DExxfQAIc=
X-Gm-Gg: AeBDietIRucTstMEUKFqLHgWTnoxTKm7IGMLtrsFuU47qO6y0CWSuHnpfidMBQ2KVmW
	HlMIL/7xXlGOBM/YuSIPx7nyqlBbb7+daRSzTLGHzVZZxwFhZ69FSmYH0To2svt5bGJC9c0b61S
	Q836CfWO2XVvMze5RcYHJKPhTgRijUVBRRXXT9R/qkwI8BySO/sCLTdQjVyQc8jJs/IostsxEjE
	o+3WxRsdbO0AnTMv1izmgxNvh9omErCHwqLHwOXJnPl+WAh54Df7c2kUhFH/q173JdwxJ1N420d
	6HrCTMF3dZLJs1TVTIRyA9wxmOy3v8nupi7YFK68rjKd1TS78LFUl/vZK8k89B3N9WIHhLfZyKw
	7r85RRpcSmTpKr1MwzfrbhcwVCpUMytN/KXPXn1Tm45cnsEHxaPTnw4Bk6jG6+zaGUHTZlJU8yf
	CeolY7TyI=
X-Received: by 2002:a05:6000:2088:b0:43d:75ec:26e7 with SMTP id ffacd0b85a97d-4515d5c6c7bmr4597539f8f.33.1778061393031;
        Wed, 06 May 2026 02:56:33 -0700 (PDT)
Received: from ziepe.ca ([213.147.98.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960811sm11821992f8f.27.2026.05.06.02.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 02:56:32 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1wKYzX-0001qR-KO;
	Wed, 06 May 2026 06:56:31 -0300
Date: Wed, 6 May 2026 06:56:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 05/25] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <afsQTwO3eW+Ks2fe@ziepe.ca>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-6-smostafa@google.com>
 <20260501124716.GD6912@ziepe.ca>
 <afiODW2sVMeOj3Ag@google.com>
 <afoagb/wVBJD1IX+@ziepe.ca>
 <afofSPQbepd_fpom@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afofSPQbepd_fpom@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_025635_486199_5E0CC6F7 
X-CRM114-Status: GOOD (  33.58  )
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

On Tue, May 05, 2026 at 04:48:08PM +0000, Mostafa Saleh wrote:
> On Tue, May 05, 2026 at 01:27:45PM -0300, Jason Gunthorpe wrote:
> > On Mon, May 04, 2026 at 12:16:13PM +0000, Mostafa Saleh wrote:
> > > On Fri, May 01, 2026 at 09:47:16AM -0300, Jason Gunthorpe wrote:
> > > > On Fri, May 01, 2026 at 11:19:07AM +0000, Mostafa Saleh wrote:
> > > > > Move parsing of IDRs to functions so that it can be re-used
> > > > > +unsigned long smmu_idr5_to_pgsize(u32 reg)
> > > > > +{
> > > > > +	unsigned long pgsize_bitmap = 0;
> > > > > +
> > > > > +	if (reg & IDR5_GRAN64K)
> > > > > +		pgsize_bitmap |= SZ_64K | SZ_512M;
> > > > > +	if (reg & IDR5_GRAN16K)
> > > > > +		pgsize_bitmap |= SZ_16K | SZ_32M;
> > > > > +	if (reg & IDR5_GRAN4K)
> > > > > +		pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
> > > > > +	return pgsize_bitmap;
> > > > > +}
> > > > 
> > > > I think this should include:
> > > > 
> > > > > +	smmu->oas = smmu_idr5_to_oas(reg);
> > > > > +	if (smmu->oas == 52)
> > > > >  		smmu->pgsize_bitmap |= 1ULL << 42; /* 4TB */
> > > > > -		break;
> > > > 
> > > > ie it should return the supported page sizes by inspecting all the
> > > > idrs and don't leave this tricky bit to be open coded..
> > > 
> > > This way was easier as each function only returns one thing, otherwise
> > > we have to pass stuff by address as we can’t pass the smmu struct as it
> > > is not shared between the drivers.
> > > But no strong opinion, I can change that.
> > 
> > Could you share the struct? With multi-compilation you do get two
> > structs with the same name and different layout, it is OK?
> > 
> > That would give a cleaner setup too because you can just shove all
> > this into a function and have it setup the same struct which is more a
> > copy and paste than break up into little functions?
> 
> Yes, that’s possible, but I didn't want to contaminate the main struct,
> also we can’t compile the main one for KVM because of things such as
> “struct device, struct mutex...”
> May we can do:
> - struct arm_smmu_device_common: Basic stuff (ioaddress, features,
>   oas...)
> - arm_smmu_device: For the main driver which inherits arm_smmu_device_common
> - arm_smmu_nested_device for KVM which also inherits arm_smmu_device_common

Less keen on this, it would need more usages to justify it
 
> What do you think?

I was thinking more like

#define arm_smmu arm_pkvm_smmu

Before the pkvm compile of the shared code. 

How does pkvm compilation work anyhow? Is it all rolled into a unique
link, or do you have to worry about symbol conflicts with the main
kernel?

Jason

