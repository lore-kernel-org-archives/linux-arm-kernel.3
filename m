Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 548A3CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwzt5hp60I9xGcEL67DVrhF5ur9a/Ie7/jOy3595NAw=; b=RJqA7cskJ0l0kSBvjXAiot3Aiy
	o782iuHKnqY2aDUmHpZf1J0J39NY6GtPBl2EsXOwaN1LHDTM90B0B8h5NJVwlaitSear7V7cLQrot
	/lRMRrt0kWtmBw2g53Iu2mVNIfUL2nXZlsQ69ZbyYDkyOkg7/1SwGOlzCLu/iqYQhvPTpQNC1Jae9
	ixnZhbz3eTuv7DKoYY7o5yHunYHDzNJdoCOfIsgwfXKcn0Xc6z5gbrP0qOjBZig4bKfhvyTyZZGkr
	vuZ31Ir0itkV3EaVAbU3ocphgC1OUkGG5JuE3wxiuaa0DZYtwlyq3yg5BngkPXBJBvECY25jnQxq3
	ua3OzfRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrkz-0000000BLsk-0Vbm;
	Tue, 12 Aug 2025 16:21:49 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulnqG-0000000AeoV-0lDa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 12:11:01 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7e278d8345aso524628585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 05:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1755000659; x=1755605459; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zwzt5hp60I9xGcEL67DVrhF5ur9a/Ie7/jOy3595NAw=;
        b=S7r1sDIqhB6qCZOJZQxcf/W9nksgjcBakXSU8QBEpHQZHDZq/D2kHRJOyZ3kUzKo/J
         4pqLPfNJwBiAH652t4183pKs8QnP9yn55a8lDVqfMNT016/6iGIyWkYH4zoonc1mbipc
         38hE0gs4wnAD5eq4j1Ud2gRVFtIle4NK5XW2NE0Iz0/KkWXWtDoj43sWp4SS7QAMwW2d
         sfrqX+Mqs68pMaCLO4YZ0G8Dr5+ZxNXC5NyZLwLIya0/AoK1jLxwvmUIVis5xzxYKYik
         GQ/6m9xS+Kzmn0J5iCgGpIQdHJhyVSaZre3FKuhiEKzF+Wr+lN5E2z1uJEW3R1YF1Ds6
         P+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755000659; x=1755605459;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zwzt5hp60I9xGcEL67DVrhF5ur9a/Ie7/jOy3595NAw=;
        b=LRn2utUlJ91zHYfkXhWYsmunv8nI9uNbk/Maew2tz3kyaSke9xCUWZ7b+gkQwMqU8y
         pCs1v5AxkrwFWxAdqO6PP4jChckDt1kC/W3nLcolocJgnlpczP4ADXOI7zxDttMVEER5
         V7pWIrKHRQADi8my82t77idblHHrLxjrbTnV5qBkFVVdZpJefddmBODLv399v1uM6Qta
         q1q6QCV2t59Uc2GtdR5NfJiSHGVE8NDGRWwOklwCH2gMrhvfyQjp2p6qXT/aJ8mfL1sX
         FVhsuEPIkGcPeZutcpGRh9RNGyq4nWJQS5SxZ5p7HV7api07h0ypMcVuWK/Xs/KCcA0w
         8yvg==
X-Forwarded-Encrypted: i=1; AJvYcCX5Op+WlqW0MN15ZuUKYqDQqPwyf0cP/94ORDQKHkRv/z7kF+D1tdtoHX80U72111R7H1p3gbVUBul9eJoFFiyL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1+Iv+P61LBmHmVCxcom49beL5PbtswOj9NroAnOm+48qiJz4R
	hzZkrZStdNPmvxv3Hk3HS4IlcgwQHGSF+pL0GSdk3L51vFJnP+8VxT3RjOKQ3S8qskU=
X-Gm-Gg: ASbGncsyKu4hUb3Gw9tTP+TL9AckzMbv2dClvsENDLkNfGFFfSuJ1Pbdx0hX+rLLYk0
	tFhroGJAzzzaQUuFvGl/n68pGR5on+otoIIOA+VSTmWJDd1dzEtzwofIykt25vHbTOuZRhTHQiB
	KCesUqg8JKlTv8Yj4knzCVyz3G0UIXuBhHSjAhcY+Kxs7pjKs+Hkq+xtngPeQsu8amWZN1IEyQz
	3IYxrbCnvl+ruizxwE3/Pq5vF26p2N7gX+WmQlPZkv5glb+BO804weYProZVYIp7V2ssgmTVLh+
	O3MSzOJgzs8JXshDBQDTRV0ZCFxY4JioE8mdqhKRPuHBnCNjs1NEw8XrYMztv7Jnp0CaAChUOLM
	RUN/jdEyVqIU3UJyOJG7M+GLfbBmZv2GNowKz9dq3GeVU1ExkL64cbrKvxL4Goi6199pH
X-Google-Smtp-Source: AGHT+IHpaffqwwD2Z9E3cXc4Gk+qNtr0gNf1UVekaIiTZnryNrm4aWl3gQcM0mkfqjTsmCyn653LSw==
X-Received: by 2002:a05:620a:831b:b0:7e3:4740:3d3a with SMTP id af79cd13be357-7e8588d7a35mr401586685a.55.1755000658513;
        Tue, 12 Aug 2025 05:10:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f72f75asm1760951185a.59.2025.08.12.05.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 05:10:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ulnqC-00000002c1d-3Hty;
	Tue, 12 Aug 2025 09:10:56 -0300
Date: Tue, 12 Aug 2025 09:10:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v3 29/29] iommu/arm-smmu-v3-kvm: Add IOMMU ops
Message-ID: <20250812121056.GB599331@ziepe.ca>
References: <20250730164752.GO26511@ziepe.ca>
 <aIt67bOzp6XS_yO-@google.com>
 <20250731165757.GZ26511@ziepe.ca>
 <aIurlx5QzEtjpFLd@google.com>
 <20250801185930.GH26511@ziepe.ca>
 <aJDGm02ihZyrBalY@google.com>
 <20250805175753.GY26511@ziepe.ca>
 <aJNiW48DdXIAFz8r@google.com>
 <20250811185523.GG377696@ziepe.ca>
 <aJsXkidmcSl3jUJP@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aJsXkidmcSl3jUJP@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_051100_376446_BFAC2C26 
X-CRM114-Status: GOOD (  27.07  )
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

On Tue, Aug 12, 2025 at 10:29:38AM +0000, Mostafa Saleh wrote:
> On Mon, Aug 11, 2025 at 03:55:23PM -0300, Jason Gunthorpe wrote:
> > On Wed, Aug 06, 2025 at 02:10:35PM +0000, Mostafa Saleh wrote:
> > > I am not sure I understand, the SMMU driver will register its IOMMU
> > > ops to probe the devices
> > 
> > You couldn't do this. But why do you need the iommu subsystem to help
> > you do probing for the pKVM driver? Today SMMU starts all devices in
> > ABORT mode except for some it scans manually from the fw tables.
> > 
> > They switch to identity when the iommu subsystem attaches devices, you
> > can continue to do that by having the paravirt driver tell pkvm when
> > it attaches.
> > 
> > What is wrong with this approach?
> > 
> 
> My confusion is that in this proposal we have 2 drivers:
> - arm-smmu-v3-kvm: Register arm_smmu_ops? binds to the SMMUs

No, I don't mean two iommu subsystem drivers. You have only the
pkvm-iommu driver. Whatever you bind to the arm-smmu does not register
with the iommu subsystem.

> I am almost done with v4, which relies on a single driver, I don’t think
> it’s that complicated, it adds a few impl_ops + some few re-works.
> 
> I think that is much simpler than having 3 drivers.
> Also better for the current SMMUv3 driver maintainability to have the KVM driver
> as mode, where all the KVM logic is implemented in a new file which relies on few
> ops, similar to “tegra241-cmdqv.c”

I don't understand how you can do this, it is fundamentally not an
iommu subsystem driver if pkvm is in control of the HW.

And I still strongly do not want to see a para virt iommu driver hidden
inside the smmu driver. It should be its own thing.

The tegra ops were for customizing the iommu subsystem behavior of the
arm iommu driver, not to turn it into a wrapper for a different
paravirt driver!!

Jason

