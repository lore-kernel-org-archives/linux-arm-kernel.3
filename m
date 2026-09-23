Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7F5C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdEIBnHA/8T+E7XayOUCjgaZYlTP8ZfuwSF0Dftqz2M=; b=OzZipJl6NKzsZziCRMxC/j4ZEA
	sgcpz8EeN5soAmqd+OMp9kQ9m6xtML8ofW35zsdAL1TSJ/LVIg0O38i2sshr77cDQfQx6gs+asi3G
	CWrPPGYRoE/yQVkJi+Z/w6EztV1r2to9jfHzsbD2F+bRSSzw3yIZKmdjxjaKIzSltgiFeE1Vzl4u3
	dtVFYAYckWpLJE/D3oNZ+znGnCewsqqJcp+C/cADxqajVhZrlIk8Yyu3C7yPfd/nAGq0xYzcQzQpP
	Y48Ae5OJ3TL7yRl75wtR8CGhAT4gYn0SUuEnbzuTI6dSa7VDcHjP04nlThqXWlYZh9SvBlvdkxwIX
	c422PUYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jyv-00000007rSy-0zS9;
	Wed, 23 Sep 2026 10:13:41 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Jyr-00000007rSE-45lq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:13:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49e6425f96eso35835e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 03:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790158416; x=1790763216; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vdEIBnHA/8T+E7XayOUCjgaZYlTP8ZfuwSF0Dftqz2M=;
        b=iea6o4c9EqwUmVtEIpFQYFrC7Xle9QfNg0yXE9MtJ/AYMPwzN9/MHewSlF3ouYTYoK
         AICcaODHGY6IbT5OijK0DFpyEJgPn1WikGk3IzMz48PBdzrljV+WyDNCw0OnhTN1NNW5
         Y/dExf/Pjlccx/3Ylw2ozVJMXOUE0JRDi5PLZruZ2HGvjUVsFDkc65bBpjQbHuQEkwLZ
         cVf9bpFdJ3xNkLyOk3KHMUmSro5ZvOnLucpt4BKa2fy1+WC+Drt83CHm1u/ZzDYUmzoT
         QgdMrYuh1qRTYMjwI2Av0P9q3GwU/HAFCmh66ZS1dbE2TOmQEx6Qyn6kjqyCuJq3l8eP
         saQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158416; x=1790763216;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdEIBnHA/8T+E7XayOUCjgaZYlTP8ZfuwSF0Dftqz2M=;
        b=v/TcHMLvOStCA5Zax5JMBNySAmOaemQAVyVt+Pe8eLvwFE4DKyy6nmaj16ZECHRpSO
         VlP0cIzYOgz+7z7xcXFY/4hBz9prVUl8rVzpHPT1hr2rlcZk62+20W3q43hjA5Pa5u5r
         awgkzZtvWbogmC1hLY4eO+OgV6pkbjXraEmLLRC0i0HMNcDjuqzfRljHNhIO279ul6ot
         167np5c5ncayKqmXuffFXBGcVG+l0S3jG1hwOeREySYB2+UYj4bNU2e9ax446QtP3M+9
         J5FvQa1m3xXoovNs4HNxeeO5B+pSDm55ghEGxhzLIPmnf1ta7vEvD2zUzS5UAQIboVyt
         a4/w==
X-Forwarded-Encrypted: i=1; AKwUvByhENwhxbjFBKPXNIbcpBPdP8nKo5+UZavk8iI93/pH3JqNsYzfNxoYOeNW68XNZTc5a+b57qgKuii2IoW7o1lp@lists.infradead.org
X-Gm-Message-State: AFuF++lG+eHXey9PwaRfcg6ue5/84ugVcMBQiY+BpFywAcASWHN8aLnH
	s5c7U6J4a0yG4dMPHnCcK/6pSrXmiWUtKrrvmxEAc9o2Hq50Tv4A8iTOVF78YxeaUw==
X-Gm-Gg: AYBFou2UAjGMIAeCxeteqf1h2UD9XzxZzUCalJA5tvZQQ4/2lQAgsP5Wuv3cDwsUZ7f
	GKXcsS2TnbbM5PfmwwHeMFJYT18AlRJYa/QknyKa/e1nFwXoOce8zMKfo88oD14pbgclNUVdiHv
	vCP1262RB06XxBluVMvjwDb6ru0NSJRQ382KZaTcau28p0XIhrOMRgaTFrr+oaf/8mNry1gcZr4
	fVzX19055t8Pk+AIWJIIl9vuhlp4EJQllTovFZrTRMvy/8K5N3eMTLWTOfcm4H2kdsuLQ6fu9io
	lCu0Z1qTqIX6J8kloCPkGT02+azmxKYyr6anZA4BFRZ+84VujtHtl3sB9WDXR5q/n29wa6InVGM
	6laArAfOLiPIBZmhXTIm11womul69IrktJQVqgH0HlzsdPmhNWoEGOSgTV/6Tc5rFGFtsvgTl1b
	hCC1hyecw/NqdEUo17DZ+X4Q/XfZCME9G2/HUICWfkdbCM+r0fZE/fhHOGxnNLaLEWghrrHo9ud
	ldvSpo0gY4UjI0eGhaxJhvRH6HxAnxCEFP4v2kdgA==
X-Received: by 2002:a05:600d:8653:20b0:49f:e0f7:257e with SMTP id 5b1f17b1804b1-49fe0f725e4mr416395e9.6.1790158415606;
        Wed, 23 Sep 2026 03:13:35 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868486408sm5194076f8f.9.2026.09.23.03.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:13:34 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:13:31 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com, vdonnefort@google.com,
	sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v8 04/25] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <arOmSxqRxhd717Xy@google.com>
References: <20260922131259.2975334-1-smostafa@google.com>
 <20260922131259.2975334-5-smostafa@google.com>
 <arLa0E3xq5dGuPpd@nvidia.com>
 <20260922214818.GA2545495@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922214818.GA2545495@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_031338_035914_85423BF2 
X-CRM114-Status: GOOD (  21.48  )
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

On Tue, Sep 22, 2026 at 06:48:18PM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 22, 2026 at 12:45:20PM -0700, Nicolin Chen wrote:
> 
> > Also, Jason's suggestion in v7 was hyp_arm_smmu_v3_device, which
> > looks nicer than ARM_SMMU_OBJ...
> 
> I guess the point is to emphasis the substition technique, I don't
> mind.
> 
> > > +	if (coherent && !disable_msipolling &&
> > > +	    smmu->features & ARM_SMMU_FEAT_MSI)
> > > +		smmu->options |= ARM_SMMU_OPT_MSIPOLL;
> > 
> > Will pKVM ever use MSIPOLL?
> 
> Not sure I understood the approach in this patch, why was anything
> left behind? I imagined everything would be moved?
> 
> Maybe a few more remarks in the commit message?

As replied to Nicolin, because it is a module param, I am ok with
adding this in the commit message, or passing disable_msipolling
as a function arg and moving the logic.

> 
> > > +	if (smmu->features & ARM_SMMU_FEAT_HYP &&
> > > +	    cpus_have_cap(ARM64_HAS_VIRT_HOST_EXTN))
> > > +		smmu->features |= ARM_SMMU_FEAT_E2H;
> > 
> > Why is ARM64_HAS_VIRT_HOST_EXTN left behind?
> 
> +1
> 
> And the TT_LE/BE and S1/S2 checks, and ...
> 
> If kvm doesn't want to dev_err log that's fine, we should able to
> #define that away too shouldn't we? And maybe it does want to log?

The hypervisor can not print to the kernel console, so dev_err()
will not compile, I'd rather keep that outside and let the caller
decide what is a probe failure and print it's own message that keeping
the code and stubbing dev_err().

Thanks,
Mostafa

> 
> This seems pretty close otherwise
> 
> Jason

