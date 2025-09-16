Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26548CAC59B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naxnlF8RW3uPyYwaOywJDf3OceUlrkorGyjKAmqFqDQ=; b=1Y+xxAx198vB3J41vyCWezyCb4
	6vyNUjjlZ49D8nyHXDD8Nc0Y73iRZ1e+zi4LdVd8JPJJN+Gz+5hDNe8dH5vD1CDHL15OR0XPiRgYR
	F91PTf7mmw93gJULlgW0PkvB/YHZMoKFWvM0DiybEfRHPeYfdynFwtwe9rCZscltuyIbog3YioDW2
	Rut1TngBk3J5C/D9YeqfqwLecMZYdme+xVEUCu+uXUZkxQyFr2v7gka5Dl2T2qIDbgECKlaZbZ+BY
	dgiW2vyzkwqqkFCELdxc/7XbMDEkurzAwG1TJlXskneOjWmwGlrtPVoJMOVL3riiVqw4GCU1klRUz
	AnNNpO2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWMs-000000082q5-1xYt;
	Tue, 16 Sep 2025 14:09:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyWMq-000000082oo-1UdS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 14:09:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45f2f894632so55265e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 07:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758031751; x=1758636551; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=naxnlF8RW3uPyYwaOywJDf3OceUlrkorGyjKAmqFqDQ=;
        b=S5NbGNlfYhH4RcwX7CeD2kWVJdc+nx2758iTkl5r97INz0IF5Cv2utHtMx0cI+Go/H
         iq795uLBYtfUGP0wLe75XXicJa5fQjPJcmPimBjPhZiOCGjHT7isgbbzGqyQKtMup3vE
         bWnzkQN4habq+jQTy5nlid7JtOSEtQYfGjKn7pQEr+HQqZoulGjYvToS4Y+/IBeYMKrH
         /1uAcFZyBi0ozOaeZphyPjK0bljj5npU+21qqx2cp8Lnt9RqprdYfyogsyxDnbJncYq9
         mvF7Woz7zIYLWIEDSyaUUyfe4UYaCbfwffgPZl25MtZ1SvqcPiMPkqVPdyjtDFEd3APH
         0s7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758031751; x=1758636551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naxnlF8RW3uPyYwaOywJDf3OceUlrkorGyjKAmqFqDQ=;
        b=KJ5FFF+2ERZ0hpI0GWgR+UkbCD0WUXs+1cq9qmWZ5J3TIQDLzMbSUFSeTXiqbxrJdf
         ySIYPZoM9Pe44xEtV5xBtNvyVVHU1rHWb5r0uxHulLBeDau7nOVqTuELIiwiW2KE0Kpw
         PKkZt5gWyfoiVYFUZDSvBuwaUxJVR0wPA881x/fAtT1zatZGEj8m4JF9T5C5GsfS9zts
         832YzOwZMKa9yvnFadtw+Mgm+t2eTJASqg9yLiCtUKvIWEUTz0aTywd5dnPl71mSrBzm
         AuZYLpPKEwMyLC5YreiaLa8Uah97aUOCy8mmKLttj/gheBC2yUsey2LHFXeCOFRU3m+l
         MJ+w==
X-Forwarded-Encrypted: i=1; AJvYcCV+aYRJAttfbdiQbHJ1pSvxCXY3J9fYgtHXJFrU5wmGp+Ie212iUg1yW+U418e1+08H68y8RteTzWUUbAc4UAfW@lists.infradead.org
X-Gm-Message-State: AOJu0YwdJBXHJgtQLcOkC7TEVURsFktfKOuBAB85ST3rf8n3aVYRgtM4
	tnmu5oKIJgz46uT/O0cqys99efiMWklQWGaxrpi6QHh3KM/zCKKiUIV+h0KqFaQTfQ==
X-Gm-Gg: ASbGncvDYxgAg2xombTBB8bx7DoVVLf8i0h0YNILoTI/rD8BKS3yRgbpafNTjRrxX3P
	E7eDhvbR7GewizPijl8BZarsOzY5pv/qCvnFQgrzVb00lHFdsUjSbJqkfOwV27dzqQyBDCEgb0X
	wU4OoNL/R8DO6ImAOnoo3LO/Xsa1N9p+rdJHuel58fNFh5piY95svqwV2u94vy1KX3jjYymZVDa
	9WUblcD0cCooYDjHS+wiurBRiXlTLNC/kd6Z4Yh1fk5I8G6J1QwERnZMLPyQt+0G+b3NlZF+FoE
	5jcxXoNGQ3BQbnoubzBb6fiPASNF8+X/furcoBiueLWPbcHoImPsCrttXILEtw/+kBn0zaesvYo
	hvZ1uE46zzvUISINkgD25G7tdYnzkC6Ko+pHBF0SHuPINOKUnlJwKBzGcsfWTQv+q38QeCg==
X-Google-Smtp-Source: AGHT+IHiAMHPDFkAjiAxoWmA+0eW1WUNEbjO+yxVuqDckIGe39OhDb7FDlwQGK8b0ego1xO8BRYMfQ==
X-Received: by 2002:a05:600c:4689:b0:43d:409c:6142 with SMTP id 5b1f17b1804b1-45f320079e2mr1928645e9.0.1758031750409;
        Tue, 16 Sep 2025 07:09:10 -0700 (PDT)
Received: from google.com (157.24.148.146.bc.googleusercontent.com. [146.148.24.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32083729sm19395835e9.0.2025.09.16.07.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:09:09 -0700 (PDT)
Date: Tue, 16 Sep 2025 14:09:06 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 04/28] iommu/io-pgtable-arm: Move selftests to a
 separate file
Message-ID: <aMlvglecB0ZA2fmd@google.com>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-5-smostafa@google.com>
 <20250915164517.GL882933@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915164517.GL882933@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_070912_403033_A1E1A409 
X-CRM114-Status: GOOD (  21.93  )
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

On Mon, Sep 15, 2025 at 01:45:17PM -0300, Jason Gunthorpe wrote:
> On Tue, Aug 19, 2025 at 09:51:32PM +0000, Mostafa Saleh wrote:
> > Soon, io-pgtable-arm.c will be compiled as part of the KVM/arm64
> > in the hypervisor object, which doesn't have many of the kernel APIs,
> > as faux devices, printk...
> > 
> > We would need to factor this things outside of this file, this patch
> > moves the selftests outside, which remove many of the kernel
> > dependencies, which also is not needed by the hypervisor.
> > Create io-pgtable-arm-kernel.c for that, and in the next patch
> > the rest of the code is factored out.
> 
> Please send this as a stand alone patch, it looks like a good idea.
> 
> Also please add the boiler plate to wrap the selftest into a kunit and
> use the usual kunit machinery. We alredy have an kunit for
> smmuv3, it can just add another file to that.

Makes sense, I will do that (hopefully before the weekend)

Thanks,
Mostafa

> 
> Jason

