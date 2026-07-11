Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C098C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 18:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2V2KLSDgcSUiK4L4iVVgXmIB4UUi2eZBF2ABdPzmDAE=; b=3mobQ5+x9yuJHzsh6JGc0FJFJl
	LuYm6x8MtxfRYH7gR/f6zo2wpbxWEQbDgWAuQ3Te0Va+FNE3vtsqCbfp9+20HxjpwYsv/y3j1AtWE
	IrjqP2rc1hUdCMe7dKGBQrThHZZK4s1OfFBjEg9tq4QjaTGmygQN+q+x4TR95D4jRjN/dwtilZnKf
	8eyShAq858qgM5h22xSmY9yOTh98ZjLDULy8PF+PaY7Q0s2mH5Hn5DDuKUjUXTDYx3V2zXyU3kTMY
	or8ssdL0cJF1tS+iNWwhhcGyzov3qYdE9gPC01XdPwD7/2lIsrXl7uCVXb8rCVsGjEzGmQVHhZWSo
	UWDRCtow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiber-00000006jWj-0WFv;
	Sat, 11 Jul 2026 17:38:33 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wibeo-00000006jWK-30Gy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 17:38:31 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-51c15a5b265so166961cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 10:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783791508; cv=none;
        d=google.com; s=arc-20260327;
        b=FLmpHwaLTZ1cE7B02PM6b9GC/rwH9QnWISU27I8NUgd6bt1Did2tHBVm0I9KtrWKAU
         yDC/ywqZ74tmgptIq32hQG8D6yWc7f01Crjbv36Gsk/j69NwEspGdk6lwg9GCPJ0fr7Z
         fjzgWfUIKUQUzmiWQheuDSPZWlssnjaFhahNh3ezYsKxL+7gCMpNbWke/Bl+zdRkaRcx
         IKw5amCTuAsVdiDZ9iLAlpWqyeGsLOe/zlhkRoyeSowVesYt6lZrQCR1TsSXuBP3wOsw
         cDQHPkIzrWkYIzl+KZlwZFiaf5BO27qyWCMv+MJ9wnosKGvGNTzAJD8Csx+d5gwZlFgg
         qSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2V2KLSDgcSUiK4L4iVVgXmIB4UUi2eZBF2ABdPzmDAE=;
        fh=X7Otgo6DWCqXLSluDAuh7QNvyPNDCsQDO8jN87otSJ4=;
        b=ZB8nAX417DygJu8O/pMerAGQoCuD5ZJlzIX1NGjTopLq4dTdtPr7pQaKm0ZCZZB2ew
         tE7a1HulhsxcWf3eUIh2vqBGXJORu/bX2NyhFNVa+SU3x/OrKEusfI/rV9T8wjzxDxH5
         wrlGZ7vkuXaVj3BdI78a2FCSVVBpKswV6UyUlNJx6FvTfCRy0NoHXQX3IMPLwUJJLkYX
         1Ysalw55tP3VBM6Pru/D8tDsatIvD7jOXKx+Dodi8Wil+BqgjDFj0MwsjGhogusNX+XN
         RH4f6eqw5J2ReKue8CYQNFLnkFP5XgrSu/AcRgzXBK6lBb1dIWs4iRDj1r5z/tN+Oga5
         L7DQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783791508; x=1784396308; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2V2KLSDgcSUiK4L4iVVgXmIB4UUi2eZBF2ABdPzmDAE=;
        b=iN2jMNM1q92FBHnLivyy4iN+04P6Ms7AKybusCuvV8DRROnPUrFXFrD6sgojUqfeUT
         eSymS6LBR0WdxAgUB6ceIdWmasHe8O1s57E7CyMPaViPW4hGhBBtR1TiGv+67/QE/jB3
         pOMWPEFUy8rFpejMKI/PYAaX80dKf41M/jRceRlOOSwP1sFb1UYDt2yvgGqPEqtVa7wF
         5u66w70SGLazlO4rcNNl2OXqkezAr9v8UPmVw/+7uGcwlgEzr1QDj1WBHZxFxjoNvFI/
         Ogwzw8/m/k1ndj4I0DikHtVjHe14xNzQ5EjtOz/LjvVbbXduMIwjTauyy0jZMQT7pJpm
         aK/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783791508; x=1784396308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2V2KLSDgcSUiK4L4iVVgXmIB4UUi2eZBF2ABdPzmDAE=;
        b=PI4wUbTLRcw3shDdIK7TSsKuOq7+jybRRIQwNRViMwD9Bsgw/Qz6SyxV+MVYZLGHT3
         kgA3hfkdjYMDmwAQxU5pOkwLayceWCeq4G79OIPIrvz2PpiBBaVNLlwq8xmalgfpt63s
         y7tYWGrfQc6bAKirJMfz479n8iXPomdiGuVRPB1bn8nHmLB4iOexpYYlPVMlk19wh8od
         RjKszDLCeKbwfe5QB9xuNfVsVejTsNyeEUGh/+Xwf/hbA2x26FqOW3WqoIZp0x5J0c0Y
         nybrgTwN0xxLnTReHtHnd7KYr96gDSzZwX9ltupOCPRwIgl8ClKyiVtrlULenABx9hey
         ySrQ==
X-Forwarded-Encrypted: i=1; AHgh+RrF1FIxTz2AnBzGu79yrjhqgho3IUeWXus5fIjqLX4Pip/m+rkyCdC1zky1uO685jVZ+IszizDZo0c5cDfoCLOc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfu+OVIgnU0pMfLzFZsLoutxzhYsp8d23JWcTb/XxiBP7eYC+m
	DzUEw7CnRwnLgXNKTlgr6jGPlo7/+OevKk8LlFcZgyPpMlhfgaEByIOpZK6qDTv8tCgdXAfCjqo
	lcNX6BkqgQxrGpXZANRc21mmx7+r0ti+XLcQgf+aH
X-Gm-Gg: AfdE7ckiNW9oawCHuek0BvdkTOMy1dGIvfrH8KAseCAB0ETdZ/g2zzthKTi9SnsDNVZ
	ItY0nyfxC0qG22S8XL2+MGJwd+iT8gK2Z5Ut2pEmizD+/bwzW6XxYPeSNW3Gm23kPTuX/g+jT0h
	GKglqdSwaAe6O/WmFjqgG52YchOcWhfWcDq2C091aD2W0J2rA3zDSwHI+UrBIykNgVTu1+NJ/Iq
	VkgB4wSS0D0vT5wdEkjgua5NUv6ms4Hv9UzWuVDnFxoHeNMGbk17sBMEwAO9NnhBb8BEw==
X-Received: by 2002:a05:622a:4d95:b0:50e:5eba:cadd with SMTP id
 d75a77b69052e-51cbe261e39mr7732501cf.2.1783791507671; Sat, 11 Jul 2026
 10:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <0-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com>
 <2-v2-43074a57a53a+fb95-smmu_tlbi_jgg@nvidia.com> <akzh9qFEfi2umwDW@google.com>
 <20260707180811.GB226829@nvidia.com>
In-Reply-To: <20260707180811.GB226829@nvidia.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Sat, 11 Jul 2026 10:38:15 -0700
X-Gm-Features: AVVi8CddI1hmY54sulNqNSmEvvFCdyTS1hLAJol6XLoIv6n6A3IeHHUQP2j41GM
Message-ID: <CAE2F3rDoBK8MeGJb=ZDRyjSYdjZac7R8-KiZf5WJnvUPfxbgbQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] iommu/arm-smmu-v3: Move pgsize out of arm_smmu_inv
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Jean-Philippe Brucker <jpb@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
	David Matlack <dmatlack@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev, 
	Pranjal Shrivastava <praan@google.com>, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_103830_794732_4F8D3ECD 
X-CRM114-Status: GOOD (  10.97  )
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

On Tue, Jul 7, 2026 at 11:08=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Tue, Jul 07, 2026 at 11:24:38AM +0000, Mostafa Saleh wrote:
>
> > The smmu_domain is only used for the tgsz_lg2, can=E2=80=99t we add tha=
t
> > directly instead? Decoupling the invalidation form the domain would
> > make it easier for KVM to re-use the code.
>
> Sure, done

I downloaded a newer version from your jgunthorpe repository, and
found that arm_smmu_tlbi and arm_smmu_domain are using the data types
unsigned int and u8 for tgsz_lg2, respectively. Can we align on a
single data type?

