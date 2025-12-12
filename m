Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B7DD59D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 16:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/MUKGMtq/AZXEzw4+AUVbVepsRjCX4PBUc6yHK/8Wg=; b=mNKVj2PIrGM8wviwj5pt0Tndaw
	tF9Q+4nzc4225ge5tScUsxqZHd/d5u4Xx2+R/ZiJkKmDdzhxEyqMWWzTVyV7UZSwiRpwplgoyXJfW
	ZfhXNyk4IsQR+X1tyxMgYG0sin32eVncEWH69xkzBdPY8X2LYnnbG6fUtsB/jUqAxWvxbe9YVxQax
	PNfKggXphkfq33oqgg018NMy2zkAo9eBs4pzmOP0imMFzRxJOwyEQT+jf3h6rnQ3zyDv8LY0B+BaW
	ZGANIyRxqg0YUeHQNRRmFrhTyy8sEthKHDzPRT/Zz53cys1srfjT+3hRLl3OrSEiqwr61le4/EFu2
	8R5GtZcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5fw-00000000nsg-2dpK;
	Fri, 12 Dec 2025 16:07:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU5fp-00000000nrH-3Vgj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 16:07:22 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4779e2ac121so168575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 08:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765555636; x=1766160436; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j/MUKGMtq/AZXEzw4+AUVbVepsRjCX4PBUc6yHK/8Wg=;
        b=eYTy1SFMylsD87naeynbTM9jGZf9JhXJ8G5wkYm4+ZxFVmdYwTdQGRcckLHntliWgh
         k/C0wlA2a9VNwp98xCVMxV8oLjnmoKLiJhTm/I1KoBQzGVHOSUV3RrPu8vCOzh580mS6
         qcx258AkYbd2cLq26l/+3GKWHxEAREHwin46TXINpZJWfZTaM1Mzf0FfeO0Hh5WnhEKU
         Ll26EEBZmGBRxob+Dik6CGWne5tjJWawZcfgzZdEKow0bwOEmxNygZ/4XbOjb27Le9oA
         /w5m+lS9eDXUwIldabMHGmGaFfO01HcKMhJq5jx7MXgcXJf6WU9BlquzbD3PfV6CoECW
         OXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765555636; x=1766160436;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/MUKGMtq/AZXEzw4+AUVbVepsRjCX4PBUc6yHK/8Wg=;
        b=BU3PZijf3mWDv+NTwbBPAUPdbqgoLDAWJi4UzKeU+DroyLQXsboIU2zzavEk81o/Lg
         f+LERhCNX5I/UN0BtTDoVni7nZd0scBnZMzlFIEwwhzs6maAVL06FX2rbRWd9hRaTSI9
         dd+AaMaQg9FEncEFzNxlCRwUCaAqIlorVp6aDDlHi3npBJTlOIdpds9TObPREzRJL1bE
         f7odV5M4qfVZzHdv5GBJHQmnRjG1DVFNpFpWHAt49s+17iQ25XrcAjVUisJ3reH8OkSA
         OWOc+xVk5nr0jh6nKF8i+EeSiGrAWUSrCcCxnGyYawf6gPVC7wxj5jKBA2kLLfrnPDjp
         u3xQ==
X-Gm-Message-State: AOJu0YzggQAOf4OFPIAA2zy8+aTs/ZxL8xQlMkIkhPflhV5qrbFJ4qbn
	SveFIf9OksnmYYj6ITOF+llfgbWFt57RMTHDxDAXPQTsCEjiBBKGRNw2yJWZ/hklTQ==
X-Gm-Gg: AY/fxX52N0Wp6b7pubzxJeOi+e7OClMou+fxCuebmlYJ8je5av60xoHWmW1Kx0TVCge
	1OhZqwoyGQAYHmAYSNpAV7QfkzhZ6c4JFrY8VVeyq/ERCrPLuAW65Gw+NaZzbGShhq5lxwGjyB6
	PfYi4vMP//EVcM2v0nWaMdFHBYdXIIm7elo7vPjEnpHdhflOA7jfD3TS7naIuBc5rv138e3Ag1g
	BNSBFeSm3lezjoPzZyERtkphjzYcGbqDOm+2IWYmvK7ABahKf6LI7XXUrL56CTVOD4UDGk3PaI2
	2qReBbRBGAa7W4B1O99XW5uwSYHLWH0CX0RZu023yPF8xmOGaboO9Q3YVrD2a4o50JcmBa7MdvU
	9YnWxTpzFY4Fs74nLUEOOJGbbshIhsys3qi+KCUG4Hv8o0SwjMwn73ykJweSRx77+mCH6wKFgbm
	t5HPOTeuHl4Wp+J9im1ruEurjJQbuZZUr1g11eewqNycRqz8q7iw==
X-Google-Smtp-Source: AGHT+IEIDx819rvyhX5iStRqL6toam/KgB5ggWiYCL8nDHKAqrNj8ytrnyVKvwTwKQ6ON9JUhN4seg==
X-Received: by 2002:a05:600c:4a19:b0:477:b358:c0cc with SMTP id 5b1f17b1804b1-47a8981f631mr1202285e9.17.1765555635793;
        Fri, 12 Dec 2025 08:07:15 -0800 (PST)
Received: from google.com (54.140.140.34.bc.googleusercontent.com. [34.140.140.54])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fb68866f3sm3708879f8f.36.2025.12.12.08.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 08:07:15 -0800 (PST)
Date: Fri, 12 Dec 2025 16:07:11 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 17/27] iommu/arm-smmu-v3-kvm: Probe SMMU HW
Message-ID: <aTw9r9syCwJH7hgz@google.com>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-18-smostafa@google.com>
 <20251128170748.GE812105@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251128170748.GE812105@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_080720_244672_B10A2F96 
X-CRM114-Status: GOOD (  24.42  )
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

On Fri, Nov 28, 2025 at 01:07:48PM -0400, Jason Gunthorpe wrote:
> On Mon, Nov 17, 2025 at 06:48:04PM +0000, Mostafa Saleh wrote:
> 
> > +/*
> > + * Mini-probe and validation for the hypervisor.
> > + */
> > +static int smmu_probe(struct hyp_arm_smmu_v3_device *smmu)
> > +{
> > +	u32 reg;
> > +
> > +	/* IDR0 */
> > +	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR0);
> > +	smmu->features = smmu_idr0_features(reg);
> > +
> > +	/*
> > +	 * Some MMU600 and MMU700 have errata that prevent them from using nesting,
> > +	 * not sure how can we identify those, so it's recommended not to enable this
> > +	 * drivers on such systems.
> > +	 * And preventing any of those will be too restrictive
> > +	 */
> 
> This driver is doing nesting though ??
> 
> Shouldn't you detect those IPs and not support a S1 at all so there is
> no nesting? Identity only?

I can see that the errarta are fixed in r1p1, and from the MMU-700 TRM,
we can extract this information from IIDR[1], I guess we can allow
nesting for all SMMUs except the one affected. Actually we can do that
at the moment from the main driver too, I can prepare a patch for that.

However nesting is still mandatroy, the fallback path for the KVM driver
if nesting is not supported (just S2 for example) is to fail and let the
upstream driver probe the platform devices with KVM out of the picture.

The main reason for this is that the KVM driver relies on CFGI to know
which SIDs to configure, for s2 only cases there won’t be trap and emulate
as the hypervisor would be take control of all the SMMUs (as v3 of this
series which requires HVCs)

It might be useful to support only S2 SMMUs, but I’d like to keep this
series simple and then we can build on top of it.

[1] https://developer.arm.com/documentation/101542/0001/Functional-description/Constraints-and-limitations-of-use/SMMUv3-implementation

Thanks,
Mostafa

> 
> Jason

