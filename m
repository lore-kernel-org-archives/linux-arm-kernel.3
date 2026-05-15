Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38172CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 23:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jUKJi5Y22AXfRJ2QMuXqI6SMCVq8sgVEt+NQLm6AGM=; b=M7caRzzUL6vidQdeG6DQDwA+yv
	M1QVrO/D2Ol0FG1rRgeC+6ZlcwoNIMm9O1XuC3tHEYCnPePTjIpQC8djwbEqkO/CiXZaMppYLm8IL
	Aqe0feVIiG+Z8hjSCShorGP4qYryclPcc/pUW60HRcawX4+pDvIXwXZBpec/gkGQcIHFD0eG30mSn
	EbBrC+MYvAOYIs+qNlme0JqfAP33NoN/UNkrS62LImx4XBe9Myp6j4WVcpqaCB7io3XIKNOEvBRSI
	kII+Au5t52aoBvMNQbgnnYuc3KMk5ZU+DZ5o+W+dI3SEnPyyge0NCLA55EFRXuTF1qC/LDNsek97N
	Yc+iZGag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO1nJ-00000009huX-0eik;
	Fri, 15 May 2026 23:18:13 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO1nH-00000009hu0-1pZY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 23:18:12 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8b821f39a12so5026756d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 16:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778887090; x=1779491890; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8jUKJi5Y22AXfRJ2QMuXqI6SMCVq8sgVEt+NQLm6AGM=;
        b=TipC6BfGWVLhz/7UZtoNoUGrv7Zl2xarb1VtO6oKyjY0FMKgrb6mOk0HvlUctdhT+H
         BqAMeQD+N5iNr/cX1KXSg0mW6LsbZ4qEjAdOv7rOJJtXvaEcDTtTakODSAIVYYdcf01M
         tsN+2sUJQo0dvafgPJQSmWzjrI2rLdpxT7swu3xIsv80mw7nCRnjQ5V7MorqWK9AokFl
         mrfYpH4SAAT5NS6iyTaYbsYBH/XGI+Yl6hiIPw8LljNZss/cqYgYkrzQkFvS12PhYjtV
         uMZOBVrzFWHhjsBa3MFDirt/JncqSQrWoVSakJa/DxJcf5rE5gBCur8bdwnNbx/0gPvM
         WsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778887090; x=1779491890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jUKJi5Y22AXfRJ2QMuXqI6SMCVq8sgVEt+NQLm6AGM=;
        b=jrUlSmkwAXO7MakuXAfJX7aus1TblYU5bx72C7enHpwod90pwAtWpvoIRbMzpzMTVS
         FYo9RWKGYE9wbKore+M6pUK/wg0HT+lMnl+E2hqg4ujQ1u0dOibnErdpFXzOzdmPoPWq
         kNcRb05EasiWxMG3Nf4ziOI2Q1VDn/LfVSrjUdMXphKYNZzp/lj7f4ADA7PAg5mQ7ZL0
         d/rNaTNdBYgP7UDzpy0fGrfswryf3xLX/uKm4ML1nZdqRxbWG1RZ0ghr3Oma1kBRD0Sh
         N4PMnxK3Qo+Em+/Z9xsmHzwOp1n2BeYRcJUR0D2Wg4DFnf5eCcZI6MEloOJYhtc9yov2
         bklA==
X-Forwarded-Encrypted: i=1; AFNElJ+MgLDF56UKQKjAQG9luyFEacxgZiiC8Y6CUhO9V9eYtuMNd7lH+12iUo8Fw/aAWgoz6H5SokmCIS5EyFse24KD@lists.infradead.org
X-Gm-Message-State: AOJu0YwSV6rUHyReAGLJ9geABMYn9ZISVlA0WL2VxEvJmqtcQzEB4+bw
	rzciyj3Oo2mI23nCkLpSU9whohfEj283pXbzfI7N5FniTKeUXd8Yo8YaiKgbI4picGQ=
X-Gm-Gg: Acq92OEp49FcA6/kiI72yPxsQPVf6f+TREhgLmQ09tfEKJhxpdf/aCyKRHsrPzQmrl8
	qfHQ1z4tq142ZEPtnMaa9/odCK4D/jwUlCkpUT6pMl4RUduImPtqrbZ6ovwOsSmCWaAuAqvHLe5
	DLUZkzW5Wb0nHBiYKhNBBgNIfp5dFyOpIsKLYoJwHnj0TEeLcKDiU5V9kafKSKOiURclG+JRlvy
	imWBBAJuFpmSvUU5Bo3MZINnWyjH3Nd3X90UOj9FTkATUbd6TwED8bBQb7yX9gK8GSmhaDUAD7r
	wDj8THPQLhJddmj0SpZymlbBrsM9195aOt3TG1FohUkN+WUub7YF+KPPxPD3TWWJwOEL91lVTsJ
	UDqBt5vbTwSkY0TESQ0+CegM2ke94abScspHD9HORyfdu46TK3tCx2H5ycUdlRzbGOmXZ8qqSkB
	hEWHwMHZ9BsAMJ4o+R/rj4kHmfgFonW2VKxNY5lJl7l0E0UR7uNCyUWGLgciGEkhCKloMGTpTnG
	MZSXg==
X-Received: by 2002:a05:6214:ac2:b0:89c:4b7a:6a6c with SMTP id 6a1803df08f44-8ca0f6d5599mr106885406d6.46.1778887089958;
        Fri, 15 May 2026 16:18:09 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90b2db7fbsm66749856d6.28.2026.05.15.16.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 16:18:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wO1nF-00000008IBY-019X;
	Fri, 15 May 2026 20:18:09 -0300
Date: Fri, 15 May 2026 20:18:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Joonwon Kang <joonwonkang@google.com>
Cc: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org, jpb@kernel.org,
	Alexander.Grest@microsoft.com, amhetre@nvidia.com,
	baolu.lu@linux.intel.com, easwar.hariharan@linux.microsoft.com,
	jacob.jun.pan@linux.intel.com, kees@kernel.org,
	kevin.tian@intel.com, nicolinc@nvidia.com, praan@google.com,
	smostafa@google.com, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, peterz@infradead.org, sohil.mehta@intel.com,
	kas@kernel.org, alexander.shishkin@linux.intel.com,
	ryasuoka@redhat.com, xin@zytor.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu: Allow device driver to use its own PASID space
 for SVA
Message-ID: <20260515231808.GQ7702@ziepe.ca>
References: <20260515094605.3195841-1-joonwonkang@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515094605.3195841-1-joonwonkang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_161811_485777_3B2E9C37 
X-CRM114-Status: GOOD (  14.39  )
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

On Fri, May 15, 2026 at 09:46:05AM +0000, Joonwon Kang wrote:
> diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
> index 0ca3912ecb7f..61e2e52105e5 100644
> --- a/arch/x86/kernel/traps.c
> +++ b/arch/x86/kernel/traps.c
> @@ -864,6 +864,8 @@ static bool try_fixup_enqcmd_gp(void)
>  		return false;
>  
>  	pasid = mm_get_enqcmd_pasid(current->mm);
> +	if (pasid == IOMMU_PASID_INVALID)
> +		return false;

If you do this then probably you should get rid of mm_valid_pasid(),
mm_get_enqcmd_pasid() already has the NULL check so the two functions
are kind of pointless.

You also missed the other place calling mm_valid_pasid() that should
really be sensitive to this as well:

static int prctl_enable_tagged_addr(struct mm_struct *mm, unsigned long nr_bits)
{
[..]
        if (mm_valid_pasid(mm) &&
            !test_bit(MM_CONTEXT_FORCE_TAGGED_SVA, &mm->context.flags))
                return -EINVAL;

Make that removal a prep patch

I didn't try to check the rest closely but the approach looked sane to
me

Jason

