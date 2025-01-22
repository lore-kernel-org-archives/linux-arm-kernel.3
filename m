Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CF0C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 11:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M66snbmYrKqt/mbHszvaMECVHNs6H3jl0JCiF0yhrSs=; b=eZ5QubQiE4Gm39M2oxTzVO2Jpr
	Hdj5AzSpGYJmBs3XAoLDe72Dfc/7/gjuww2srIcRAKsdQLT3ePyHRZbJzZthnl/Wx41sKpJBRZmbL
	F0sEVmdHy8ERL7tp4mDWxOaLHI2ZeqOZ/uRb50B0B+jCgDJVbogLKwdhOc+LweMliGXE6GeB9DuQE
	ki8x7CKMZHySw9e+z56+GDT3Hsqm6ewgiwClrac/95iP+xIfzdmUwl7WQjZ/aqbx6gt1y5JG7wEUM
	Li3wjKICyVe6m2FpoLjbsOqmQrwmz5wUOBhBfrk2NTiS8/om0Zn14DW1edPLpbTLIhsmRf0g4aj8j
	5MFeMwjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taZCy-0000000A5Ki-1QLr;
	Wed, 22 Jan 2025 11:47:44 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taZBd-0000000A5CL-39PI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 11:46:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43621d2dd4cso51225e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 03:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737546380; x=1738151180; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M66snbmYrKqt/mbHszvaMECVHNs6H3jl0JCiF0yhrSs=;
        b=HR5iAWmD/TLFLgqbfwZDYUvmeifvNsOv2LVxliL9smwV8T604jT2j+2ZHIMjLtjEts
         DAZyDJRbUXiyfv/gQEB+kI7+4jZ3gLhmKthbvoDDmVVmj2kSsMCRWzjS6moT0ea7m4A8
         6cz/hMjELr9/wJdrqJKjR2dqlyXb6m3czld6TEzyGNYNtI5nyeLqcxv7W3n1FtwaGGBs
         fL+MWCaVfKZFJIW0XL3criL2S2Nm+csdE6G+Ogyu/ewmPTxhCMcaHoir0BBj3b5ltyYf
         9diwdkobZC6M8+xOZJZ8qyROIr7rRpdZYiMF5ilpYCNB0qCnDuTz0khES3927+wr0bRq
         UDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737546380; x=1738151180;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M66snbmYrKqt/mbHszvaMECVHNs6H3jl0JCiF0yhrSs=;
        b=WgsAasAJbnQ3+rMTrVICablQDdZdBtraZhlIYKJWfcgd2zOwtLJWICZq/3rhvEnLfo
         0AJFbVWqfwqCjsXkZzKBJUKbVFO2+qUsrwSCm6Qzv3WMeHm6Gd9LGWc+VID5ViYBPfmk
         Dzg+pXH2NYgQQ5RjoElP+WMineHkd7quednQ3bHQUW2Cvcf024ja7ewYJqg1yziLtcNN
         Okc+QW6bT4xxV04LWcO5SkpIBDUBFomfeMPG/Jgu1U2sx2aycH7X6K+IGanZLc6f5wfH
         kF48fS2gr+hRFN6xO3naIZb++wXbz4vPUhycR1bEU6Kd9zukLy5qLX0Kee4u5tuTVSBf
         B4dA==
X-Forwarded-Encrypted: i=1; AJvYcCWs3QiXGdwD1zZyE+32Ty7TbB3HyGsfVPVL+jtQUykNoIthZwtfyWc9HXvpTiFJrADhuA3Ru/4Y/vZCYeMkzTYo@lists.infradead.org
X-Gm-Message-State: AOJu0YzcmLY2HQqFQDHJ9fD9y9I9DvBuMOQna1MmIaLncNuz3r2uvqBl
	DeoTGa34BwzQQ3aYPHGDlpWh5qUoPr29MP1a65/DK1EBZymkyds1CSl96AK1Ng==
X-Gm-Gg: ASbGncs/egP7g8oSxCuWmsU8J8qrwVbIsYm23Ks4QI/CdvJdxq/hgiSFMS3l4s+DPml
	DH15V8wsMBGvU56pf7jOQOYawImXx1bus+AuuAI0ckqKJKUme0PHJZv6LoWaRAcJDCRwWIG+Imj
	dbegcBBZVaSewkD8gnG4oGJLmcTQksUM9d9QTJDWnnzaPX5SizW0xtC0v7JWQ0g31hqOBWUzrSt
	6P7w6wdi2nFqDP/poD0gJXJ+pF2C6lRt51L7ms8pYRUiADcrSHOKfrLi5utAPL+9kfSugdgiitQ
	cpb168y3lE24B4VUxdXOYGQ6avNNDQ==
X-Google-Smtp-Source: AGHT+IFls5TpL47C7K0O0oaibl6d2ILOLB2S6EMRWR6zhH8HrTL9uwlX0dZcT7Ee9IXAWCDbxNzW+g==
X-Received: by 2002:a05:600c:1f91:b0:434:9d0b:bd7c with SMTP id 5b1f17b1804b1-438b2da67dcmr845945e9.3.1737546379863;
        Wed, 22 Jan 2025 03:46:19 -0800 (PST)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31c6fbasm21159875e9.33.2025.01.22.03.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 03:46:19 -0800 (PST)
Date: Wed, 22 Jan 2025 11:46:14 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: iommu@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org,
	robin.murphy@arm.com, jean-philippe@linaro.org, nicolinc@nvidia.com,
	vdonnefort@google.com, qperret@google.com, tabba@google.com,
	danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 00/58] KVM: Arm SMMUv3 driver for pKVM
Message-ID: <Z5DahnNdoShXesib@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212194119.GA4679@ziepe.ca>
 <Z1yNWI9lBNIZg6Le@google.com>
 <20250102201614.GA26854@ziepe.ca>
 <Z35rEeSVwfZVA9IF@google.com>
 <20250116191952.GD674319@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250116191952.GD674319@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_034621_812260_5EB9725B 
X-CRM114-Status: GOOD (  21.72  )
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

On Thu, Jan 16, 2025 at 03:19:52PM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 08, 2025 at 12:09:53PM +0000, Mostafa Saleh wrote:
> 
> > I am open to gradually upstream this as you mentioned where as a first
> > step pKVM would establish DMA isolation without translation for host,
> > that should be enough to have functional pKVM and run protected workloads.
> 
> Personally I hate these giant patch series, you should strip it down
> to small meaningful steps and try to stay below 20 per series.
> 
> I think getting pkvm to own the SMMU HW is a great first step that
> everything else can build on

I plan to do that for v3, I think that also removes the out-of-tree
dependencies, so the code applies directly on upstream.
Thanks for the feedback!

> 
> > But although that might be usable on some systems, I don’t think that’s
> > practical in the long term as it limits the amount of HW that can run pKVM.
> 
> I suspect you will end up doing everything. Old HW needs paravirt, new
> HW will want nesting and its performance. Users other than mobile will
> come. If we were to use pKVM on server workloads we need nesting for
> performance.

Yes, I guess that would be the case, as I mentioned in another reply
it would be interesting to get the order of magnitude both, which I am
looking into, I hope it'd help with which direction we should
prioritize upstream.

Thanks,
Mostafa

> 
> Jason

