Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596FFC5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 14:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idlTE0WqykxV7+rArRYymwOTK1srgqcOSOKZC0b2F24=; b=2vN5JyN6F0ZQt9g1BbKSn2wN9b
	DH2emG00DfcVZopZXn7QwrhIZiit1f7bib/0pTQVgS/5FLnvLbK/RgyL1yFaWyN5uG5yfYPFLi5Lp
	Ti1hyasJo95MbQjLLDwYci1kqbljyzfdMCqm3+Y9bGxdPJUg5s1ueiKCQIuGRtydbQVtGOOB1pAn1
	OyQUuvDXavDcsmSN84Rg5u6a3Pwrr7VQrr9pnxW3aMtayf5ex2QkxCJRuLySuBAPkLCPe7mi0KEaV
	WPc6U27EO9RiU3lq1h1eT0slZn0dTAhnMdPSNOwjiQjMyMcwS2e18o+mDzvtm8Mgq7k2Tv31it9mS
	Z56xxQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQnM-0000000ByC4-321J;
	Mon, 10 Aug 2026 14:16:06 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQnE-0000000ByBJ-04VZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 14:16:03 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-8f1e274ccb9so8964656d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786371354; x=1786976154; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=idlTE0WqykxV7+rArRYymwOTK1srgqcOSOKZC0b2F24=;
        b=c+VsL/kOg7sDtJyD8CG2uv7HviGw7UF7r+uq2apbQElQGHLGIKIbBCRrXlocv3glxA
         e3n8BDh8SRxDSvBFybwyRkqnp8plCD7QBv2rFiLcbZvWsD+0QlZOiG5E6XLx2ISoqzIy
         dEFlAUtqgmx5/5UmNnFkNRTN0hxlK9nKEpU6kHg7i8Hfw2y7o5L+kYStAnmtnNxCoPFW
         /5CShyDpetFh12WeoIPcbrPuLNqF++HP0KHZXlW2IrIeRgDKviw6hC4kncqZ97ZUTjFi
         Fp5FepsbSIiy7cgbLn+hxgwQlwstpKpFjP86h9u5WjPYCkxv9fOibl1lUczlGgBMmWS9
         bzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371354; x=1786976154;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=idlTE0WqykxV7+rArRYymwOTK1srgqcOSOKZC0b2F24=;
        b=Ia614d1A40QG0vu3qBu4Zp5Jy4VS6abzSmK5Hyb2GtDHtypXIm6miNlBhe9htzcqXB
         p47lHODqKewxRX9xOwi0HBTbjNxYgLUMQl/xHdHkR5E4X3l5gvBddsPBBPDwPbJ5/R58
         mzn3E8S/bMGHZsKDMQMItIw9C+nl16+z3njUS70JK6Dco+OdN7tUCQ4b+xxwA08Juskh
         X+2nVRAFNUKDA3wEsMO8hmMsr4MzC+YqwEXKRhnTna5ZIP6eIe8hzVUyReZhOdG4yVg0
         DVZVizK0LD4uftSIPDWBrwVjxXPsI+6JWsnjt2bKcy74CEvL/qlrv3oFB7oAJIQE2mHH
         aINQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwHQ2jE8cbiujiqUSK/aKwQVMf556flCSY5+s+lScp2RHk/Z63p/7/p+njX4RkvgpWYJgG8wKj+3GrsqEF6eC9@lists.infradead.org
X-Gm-Message-State: AOJu0YyMOMyd67ZmT0+qp81Q40zGIDSoA1vAEzvjQUxzgA2+FbVPQNlr
	BCwTfwwnZJ96NrkZG0i9YFKCcVRUPJrQ5uE6pGi+HoQiKZc2hHA4HGB9hafAG7v2PLQ=
X-Gm-Gg: AR+sD13P5BtL5g6K5VIrVzBaK9yUM0nkrXa4VIh8yKjWdcd+2JzvcXl9uyJfEnOJe2f
	bsYUvhVgZDcuq2sclh9yzcDB+kIjyv8fQKZ0M9E7zBPpW83oZcs5hVouHFbXvyJKAE/o07zF0SB
	v42E6gjog20C2KMISBa/PlSSFXQyJiSQ9oDwzdEHR0NHte4or3h6stCtavYcQhQ/AsOQe7Rk3NK
	37DMrYJz4RYsNuE67jKXpt+fcmVrNkH+6hVRb2nV9JK9EN4+Wh2pPIUu/KX/2w+RuzyhIsLVizn
	uS3+kcwu3eARnjA95VL8KmeDKfFKLxB/vwc8rZwmjDmhsvCwCgQlHDC3aGTonMoDBB4J67KwRoc
	w65Yz676mb+cJBEk0Yxjl2Rvxtu89rAr24A8v5raVSTFIle9xRr04mHpy2HsYVYpgrQ+5gHuck8
	okFaEJriILZbuJMN/FJ4+ivA7cfN+fl3Jn12RTWA==
X-Received: by 2002:a05:6214:21a8:b0:8f1:1081:a950 with SMTP id 6a1803df08f44-90a346a77b5mr228055386d6.22.1786371354367;
        Mon, 10 Aug 2026 07:15:54 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908a92ff8c6sm72821986d6.28.2026.08.10.07.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:15:53 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wtQnB-000000023Ze-0BaD;
	Mon, 10 Aug 2026 11:15:53 -0300
Date: Mon, 10 Aug 2026 11:15:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pranjal Shrivastava <praan@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, willmcvicker@google.com,
	jyescas@google.com
Subject: Re: [PATCH 2/2] iommu/arm-smmu-v3: Override for Inst/Data attribute
Message-ID: <20260810141553.GP200537@ziepe.ca>
References: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
 <20260724-arm-smmu-v3-instcfg-override-v1-2-e7acf4a8a525@linaro.org>
 <amOpSPmc36+YXgCQ@nvidia.com>
 <CADrjBPoOctsStZn84vtCymdKen2R9XcM880=wxXSv1tpQ5+vyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADrjBPoOctsStZn84vtCymdKen2R9XcM880=wxXSv1tpQ5+vyg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_071556_066354_DC55467D 
X-CRM114-Status: GOOD (  13.37  )
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

On Fri, Aug 07, 2026 at 03:37:37PM +0100, Peter Griffin wrote:

> > > @@ -1222,7 +1224,8 @@ void arm_smmu_get_ste_used(const __le64 *ent, __le64 *used_bits)
> > >       if (cfg & BIT(1)) {
> > >               used_bits[1] |=
> > >                       cpu_to_le64(STRTAB_STE_1_S2FWB | STRTAB_STE_1_EATS |
> > > -                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV);
> > > +                                 STRTAB_STE_1_SHCFG | STRTAB_STE_1_MEV |
> > > +                                 STRTAB_STE_1_INSTCFG);
> > >               used_bits[2] |=
> > >                       cpu_to_le64(STRTAB_STE_2_S2VMID | STRTAB_STE_2_VTCR |
> > >                                   STRTAB_STE_2_S2AA64 | STRTAB_STE_2_S2ENDI |
> >
> > This adds for "stage-1" and "stage-2", while missing "bypass"?
> 
> I need to follow up again on this point, but I don't believe currently
> we require the override for Laguna when it's in bypass.

Oh? Why not?

Is the issue the IOPTEs are set to no-exec or something like that?

Jason

