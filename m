Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25AECD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 12:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lELg4tysIZjC4IAy9jg6iqJ6L2+JsLGKduxlfu78HE=; b=O2XmChgXSTSX4GMoZG60iNWOYn
	y6E0QR3wwjp2QfuoWG5wFxaXwSruwn9kAswYTv1xEtGUA23YgWEqLzGPdVcKfZBtvSAocbFR4DQzn
	VcDyPG+zy3Zm9kOTCfCpFPY0pTnuvGcnrXsJMcjw1DJta+7Z3G8ekyTRT+SNuSsXLm+vFu1U1vx1f
	aJXWX6+KtYZI+Ku5R2XY7uJYijzpJpjTZzJxySqqFKt8FqPDX0OtkOhWUMzvRnX7Y8veWrfEHRu07
	feu9KjYW6DgegTjDIEVFbZb7H/aCmpe0SyoddPBwJj6ebVDEIooAqIAAWV7wbaSfse2cAxKnCeO/6
	B6UBUqRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmPN-0000000Ggzh-0hRV;
	Tue, 12 May 2026 12:40:21 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmPL-0000000GgzD-1MFf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 12:40:20 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8f15e900586so279938185a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 05:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778589618; x=1779194418; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4lELg4tysIZjC4IAy9jg6iqJ6L2+JsLGKduxlfu78HE=;
        b=E2Fxt+Afn9gwkCoaL2feMxxHinsk+wDFHBi8+oacxIrRvbmqdoHHuL0VbEEl5syLb3
         W87nRWUVTSFxWJVpNHSxxS9UAuUzPZakQMqP3t+94RiuK0iTG+6IlCIDyA7X9EaIPkNY
         9yqhQdaUfP+QQhDf1myl8FiDveJ8maohhCh4u0/EEUHG1fawt4SDT0PfT0w6e0fAqWpv
         OvDr8aos0rwbskAfyhC4lPi6fGyCyS7t2ExJMzN102x/w5lu8aUDC9/V0l3GDY1IJVfX
         E5DIhbjlZCFUwy7Gs0NzxjA9ylddSjGqGmiwekYsLpgkdZih6OH+24f/R+EyaCRneWAD
         wvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778589618; x=1779194418;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lELg4tysIZjC4IAy9jg6iqJ6L2+JsLGKduxlfu78HE=;
        b=HSrcojcLZMTH+EGeI26EBxABOLq4CkK4NnGdgqcVFUFtV2xy/38wic68/GbWXogTPF
         jtynVmG4UYpLE9HoW1vUhgIOa77MD/Ym4OxX1AO3NcSJWNyMTZgYkPM63dSoAo22VgUG
         Q6PL7mvzRBynhj/wEMvJuXbGlDEq+XGUiVD8WPS9Gsls1hLfUrCQ2os6iUGwcKu+SfjM
         caitTuzYWi1RD7Us1kxGfZFtR6QtAFo7ohmz2BCmiMB3uYGak3wOlrWkfnPrEQXBOt3g
         IwzUyrbx11GPLcWjOTQb/GlCoAtuyCVJgVfgfPZAuQEr8/VTu8VV0Ywn3zGuZ+2Lg7YS
         5yrw==
X-Forwarded-Encrypted: i=1; AFNElJ/ERdG3QeE2nJxPNE5REh01/qn6rp0SSrVRMs3iC5RHro7DlNDusRkFBc/Lskl4TZRCqskIhquZLjiKGazg93lK@lists.infradead.org
X-Gm-Message-State: AOJu0YwdrvA3rPIHBq6Q1yEavFM3mQWwOf+3flx+BCPeEAfYf+dw7F+D
	GJLjdtiktBntu4VktMrhX6gG6nVgXvED5beNyvzzSXLZsqz4/syIZEOglBoNL83EJqs=
X-Gm-Gg: Acq92OHavSRjndsICBwmvvSc2//bwS2swnixskombbsnV1C++KakjSpm9luzM0wgkFZ
	y9kuexz3TAuyyDzEVSwhvQ/8H20kBFOXEdqMv/mhO4EFFtDztwKeNI1IoxdB+7Hq9WrmD/O7LTe
	LTzGSMe/afMcpvOB2C/G4IXOkKxcQQHGau5B9OGmy3q2q/40dzX59VLFfE+FN5g5u2dIZHIC9Lh
	jDc5+PBMa9JzvA47MunLnwGhdT/t9N9tW7lqp8D2ywC7IYtiLKFTUh/rPGnf4kdKJY8Q4zMo+NS
	2cRl++rRjhQJvv3QiXvEY4YR7ttGo/jaSmLWcEjQ8QqkW2zFniu+Ee+MZWRAqH57VZQRLYZ6ifi
	5eLNJRKe5mt2AA66gXqqEeijeOr20I9MLO0ordqn5IwBokoWAFBc81RtUsWt+KDltQ4X4gS89Lo
	+LRFVPFIBXFxDklxul941jzAzWQS/l3vg7HfVP2Br4BLK8G791CpXO/ei3vE6BodQ3b3zH7y3FF
	HJ0aQ==
X-Received: by 2002:a05:620a:2887:b0:8eb:2aae:ef9c with SMTP id af79cd13be357-904d4f4b25amr4301047185a.27.1778589617549;
        Tue, 12 May 2026 05:40:17 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b87bd588sm1464542685a.29.2026.05.12.05.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:40:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wMmPH-00000005Aky-3Kl2;
	Tue, 12 May 2026 09:40:15 -0300
Date: Tue, 12 May 2026 09:40:15 -0300
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
Message-ID: <20260512124015.GU9285@ziepe.ca>
References: <20260511132128.GM9285@ziepe.ca>
 <20260512095714.2518097-1-joonwonkang@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512095714.2518097-1-joonwonkang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_054019_373012_6E9651F3 
X-CRM114-Status: GOOD (  21.47  )
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

On Tue, May 12, 2026 at 09:57:14AM +0000, Joonwon Kang wrote:
> > There is a bit more going on though, I think that is what Joonwon is
> > mentioning by asking about ST64B and ST64BV. I *think* the answer is:
> > 
> > - ST64B uses a posted write
> > - ST64BV can be restricted so EL0 cannot execute it, it uses a
> >   non-posted write (AI tells me via EnASR)
> > - ST64BV0 can be used by EL0, always uses a non-posted write, and always
> >   uses ACCDATA_EL1
> > 
> > Which is similar to Intel.
> 
> Ah, I missed that ST64BV is currently being trapped to EL1 while ST64B is
> not [1]. However, I am not sure if the trap is to disallow EL0 to use it.
> Can it be instead to pass the response value of the non-posted write to
> EL0 while using the EL0-given PASID as-is? If so, I believe EL0 still can
> specify arbitrary PASID as it wants via ST64BV.

I think if an OS implements things this way it is would security
broken as far as ENQCMD compatible HW goes.

> Since I guess ST64B* instructions are to serve generic purposes not only
> for communication with accelerators with SIOV but also with any memory
> location or device without SIOV, I am not sure if it is always okay to
> make those instructions work the way Jason mentioned.

The end point has to use the posted vs non-posted write distinction
for security.

> > The device only processes the PASID from a non-posted write,
> 
> Regarding ST64B, are the ARM devices behind ARM SMMU v3 supposed to work
> this way too? If not, EL0 can specify arbitrary PASID via ST64B with the
> kernel today [1].

If you want ENQCMD compatible semantics then yes you have to do all of
these things, it is part of the security design.

Jason

