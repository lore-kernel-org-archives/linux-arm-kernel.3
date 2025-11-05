Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEB5CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 17:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkO/YIgxaPM/wEK82kFqjfst+ouG4RuvuAOrJV+EoBw=; b=p57YPPMMvII7g93V8f0Is3Akbb
	I92O1ecCyxbRvCjc2IBpt19c9J4H2C0ZLga+MpBDLB75t+0RvxZ3vSOzNl9mHCX7SR8CZ5pwjtmaU
	LQ7Ya4b0xEnzAmr2RvGJ8MGYtfD7+Dv3AA2HptB5aORWp77jwrtLXMHq9kyT45ekr+LrbOFBso0Jb
	w1OsjuKYcH+WQfV6SpjK9yQIZGrW7NFUhtHR2v4j/UQu/teORN0eYEpd6hSCBU9SDiRDC62KmR+yq
	zCPXiUJLKZEuIoM6zgQrJ2oxwsZGaGUI27oBKjZs0m6Pc/uAV4ckHOtXubp1rNOSSbAtHFfPDsOXe
	a1yO7E6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGh3O-0000000E8i3-1Ct5;
	Wed, 05 Nov 2025 17:12:14 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGh3L-0000000E8hd-2dxL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 17:12:12 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-8b144ec3aa8so3704085a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 09:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1762362730; x=1762967530; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wkO/YIgxaPM/wEK82kFqjfst+ouG4RuvuAOrJV+EoBw=;
        b=O/ix7KegO6emTsMSWFVVjxf9TaAtfvq7DyeONK5KnlLDNIJ2I/bUISWTWYF0s8XWO6
         AOYyloRjO2zZqkXGNlpSabTDpwVIjRDIjVd2XJXqIdgFYM6QBFG7gLRjb3zcSQyYQgUg
         N6RREmM9DLtfE46yjCjTIERspb2zIkMTZxBAnHzXAcxAClQOxKyAh8UT/eAj0IF643IJ
         FM+Y5evnG+W7u1AukYKpcmSFlvDhB5SF624lefavWdxnIbLkOs321Js80GpjIzRb6dJF
         Tk7B3o2/MGDmuKD4nkR02pTztpE9pyDGAFzbONJBTTHb3Um6qt2sCQXd3CA0VeU/gUMd
         Rl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762362730; x=1762967530;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wkO/YIgxaPM/wEK82kFqjfst+ouG4RuvuAOrJV+EoBw=;
        b=UOBLBDQdHctzUGFORYAwIdgjAzyI7ygqT4uD6aT60hN8LFRuPRJkZrN6X3GEF7Y54l
         zQcYXm7IDHFOuF3h1cxPbs2VWLwegi0k3YIbD5KtMGK87qis6Bor7c2L/DS/8txMq8qv
         ckuFyf69wCr+eLsS5DoGLR5CqWmde+cmqR5HcfuR541vAg8Qnz1k9Ti/UezNInLv80g1
         SFCIVd7PGgNOfSXlvPX9Q1d2P7E1T3jmGMXANlAmjBR/Oj3kq4s680MKQG/4wUweo3uA
         txa1WAC/Ep1rLXbkPMtE/rGIZotFfgzOFcB4pfZN8E1tjeoWeneB4kuVmoZ3MyvjT18t
         hb3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvO8eoFpQTm2ZGhbTFmihLQKtHK3eOpPmUeihbJWKqmxIBxJRtVIbCame7161vks7m2cOPANRPKt3padjfap0U@lists.infradead.org
X-Gm-Message-State: AOJu0YwX0CrFoU4vhv1scmTYK8n22TxELneKmzv1CLgGxDS5tqh7PsUt
	F8ew7c7vI45knPmTD/31Gjb5qDa33/2Y+iv2jeHNeSx/+Kf0pNlaLjpSWqTEzR1iWso=
X-Gm-Gg: ASbGnctFZGPCirO02wCxw/qN2he3rX55z9js94+0qG+zYo01WXLgo63eSlVYrR6tD+c
	WCw9tJNIUoN0tbv+sPOrqStEX5N4ZaPLHfeHZQ7zdEIOqkdMdiYfBY2T6MWQBszwchg9GvF05tu
	YLf1BROoUOUbYyV+drvV/ap3its5hunhvnD22eg3JC7utuKv0tgW7fkJYFwNj6LeBMmObbg36HH
	iEURMUJQw+R/SNyR6A9QFwvatUV3qAferF+YwkPhtK8BlbkGNEjEoGwYlTGUs0wha6M8+fjgh+q
	A9WWnab0a9KnCkD9z0ARIng/DwOQdCvEoKCmVmSX1RUY8RIHLmQbaRZIanWC3FuM+hQ0qg1Zpxu
	AoswML3a6i9UhnV4+iqlpiLoZEdU5dNoJ0RzlDc7rfvMsMmWgHQFYTZlgVNjYOfC61C/3nUiuLM
	QZQZ85yjtfMgS/xY/O576t0CgFN98CmqexJT/NWtMj7Z5baA==
X-Google-Smtp-Source: AGHT+IE+H5A+GWBd94mKAScAzkbN/plh8wCL54OtyUq33k2cpyVKMqW/YnW1kIG+WLt6H619/vMFBw==
X-Received: by 2002:ac8:7e93:0:b0:4ed:2140:7a96 with SMTP id d75a77b69052e-4ed7262fff1mr49444101cf.58.1762362729905;
        Wed, 05 Nov 2025 09:12:09 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ed5fabbbc9sm40585631cf.6.2025.11.05.09.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 09:12:09 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vGh3I-00000007Bqn-3NXB;
	Wed, 05 Nov 2025 13:12:08 -0400
Date: Wed, 5 Nov 2025 13:12:08 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 15/28] iommu/arm-smmu-v3: Load the driver later in KVM
 mode
Message-ID: <20251105171208.GN1204670@ziepe.ca>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-16-smostafa@google.com>
 <aMQmA9cLaeYWG5_C@willie-the-truck>
 <aNKwROPzDCWgJBGQ@google.com>
 <20250923173806.GF2547959@ziepe.ca>
 <aNppE9A3PDiDg_1W@google.com>
 <20251002151308.GG3195829@ziepe.ca>
 <aQt9-kTCe8TpuyVq@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQt9-kTCe8TpuyVq@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_091211_704290_8A8CA7C3 
X-CRM114-Status: GOOD (  19.71  )
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

On Wed, Nov 05, 2025 at 04:40:26PM +0000, Mostafa Saleh wrote:
> However, that didn’t work because, as from Linux perspective the
> nested driver was bound to all the SMMUs which means that any
> device that is connected to an SMMUv3 has its dependencies met, which
> caused those drivers to start probing without IOMMU ops.

??

What code is doing this?

If a struct device gets a fwspec attached to it then it should not
permit any driver to probe until iommu_init_device() has
succeeded. This broadly needs to work to support iommu drivers as
modules that are loaded by the initrd.

So the general principal of causing devices to not progress should
already be there and work, if it doesn't then maybe it needs some
fixing.

I expect iommu_init_device() to fail on devices up until the actual
iommu driver is loaded. iommu_fwspec_ops() should fail because
iommu_from_fwnode() will not find fwnode in the iommu_device_list
until the iommu subsystem driver is bound, the kvm driver cannot
supply this.

So where do things go wrong for you?

> It seems device links are not the write tool to use.

Yes
 
> So far, the requirements we need to satisfy are:
> 1- No driver should bind to the SMMUs before KVM initialises.

Using the above I'd expect a sequence where the KVM SMMU driver loads
first, it does it's bit, then once KVM is happy it creates the actual
SMMU driver which registers in iommu_device_list and triggers driver
binding.

This is basically an identical sequence to loading an iommu driver
from the initrd - just the trigger for the delayed load is the kvm
creating the device, not udev runnign.

> 2- Check if KVM is initialised from the SMMUv3 driver,
>    if not -EPROBE_DEFER (as Will suggested), that will guarded by the
>    KVM driver macro and cmdline to enable protected mode.

SMMUv3 driver shouldn't even be bound until KVM is ready and it is an
actual working driver? Do this by not creating the struct device until
it is ready.

Also Greg will not like if you use platform devices here, use an aux
device..

Jason

