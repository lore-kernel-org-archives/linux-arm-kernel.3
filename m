Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BF6E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGkN0eIRMsbxDqZZzBkMr+wzaFkYCBiUXPyTbRF2MxQ=; b=NWY90uP163JDaEiyeyztvKPwU8
	NasJU6KEEylYRdiR7ZNvk8gHBCPu2WKL19ka4k/i3Vpq6jbEpJ/3zqu0K2TuMbu84sN1OAa+t57Vd
	G74OXnZ2MbAE1gSUqyhJEqJTaQBtiw/ZGvgOkMMPHUubj+GV/QKjEMPKU7rRsQInK/3abK80YE2dk
	5rKpl37eflU62UqBn5MgSH6CIEa3NgMae13W3iXukrfZtJ+Y792C9vWMwUbtn8N0f3+L4JcDQGcbT
	UnZD/TJyVjrmh3WE24cbzn1sEHl2j+RtWPmlgM3mhdF6KUfNmiY6Zq8JYcErMykkBXigjLQXZESlh
	nchRaqxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEcL-00000001eZX-2gC0;
	Thu, 19 Dec 2024 11:22:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEbC-00000001ePa-2WiL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 11:21:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43621d2dd4cso50145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 03:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734607305; x=1735212105; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WGkN0eIRMsbxDqZZzBkMr+wzaFkYCBiUXPyTbRF2MxQ=;
        b=v31QAXzEyzmRzb+bOgPpzXfMIaHGcDJUHxoEPCNYbWeYEREMVCuavc/fKODcDKBI9a
         p6KdlZoWOWygl9n2Kv3XoNvvY3gAn2694UpIbqLbJ9Q9m/SkMMmHGMz8ATcVTg7NRouF
         BLrkVkg+Dp0MmE3i/CePDyFQmERJvs9ranDkJvHtg1KAlivvOdT8Q5hglA0siGJ+yESd
         CfWPsKmYkTPu4LUuff988AIFmBecIqyIhHvgqO2U3Bz6joKeuPAYO7bQ4/17xvlNLsfh
         cASazJiIBfjcgBRGRsj8bEuP05u5PD8v6RbRPCtDxdqtWw7bxQ6W0cXMlRx9WDT3TdyE
         6vzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734607305; x=1735212105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGkN0eIRMsbxDqZZzBkMr+wzaFkYCBiUXPyTbRF2MxQ=;
        b=q26FC2ONq0nWGuWulsNFMbn/8Fuqe1zGuN2oGSqMcrH6krpp4Vp0E0HeZ5rq4bLx4g
         M0vd67AUvc7bRQML+BENqxd8bCzFVzvuA59X5BwYbh5r0TJkFIS61td+j7D2zq8yf5Lf
         JSXOvi+fmKnQZNIGffLtAzVJVXKhtcedk/HqVMgEzCED4QWVfOT595Mi+kh58y1W4KVb
         wlKrLrqWgz+GOZVpbRYh2AIMectW9AgV9um5s4FajLCQMCmf+1D5rmUMLQlW1d60aLI3
         bHVyBuLvm4FvDdpPYRir4fT+c5JhEQYmJteTFzNhvYzJ8Axi+wE8VcxFZ99Z7qSZ1mBr
         hgYg==
X-Forwarded-Encrypted: i=1; AJvYcCWvj+Gr5D5fIhqZnIbyeDXWBAqXmRm6QO+OZRrgE1g7A3c2mxmn1CyoKUlZj3+WknubqXsIADXby0nZ+O98h1SS@lists.infradead.org
X-Gm-Message-State: AOJu0YwALP7xPneUgxNe1C0EEKDXQRuTglKIYm1iGa4lJgB/TQPNgdHb
	lqyCCCT0FYD2pntUOCITQie28r3xxKyz2SY5ty4qVPSTivLDgikTEz9DhmjYLA==
X-Gm-Gg: ASbGncuuE8u0YXZNLr97pAgInv2timC/OtC6JF9a6cnUnBhXI+w+C6A08VMG4+ckQL3
	LjEEFbvGKUEqh+c/xTrUCR0l43batChkSo7mQU1hQWXlo0Rw5wFwJq6H0JVdyboRLg6cWVBxNmU
	/ASeS0yXl+3An8a+H3qtg558gMtLAfsnLIT2uPLfGuHDSDmSWSBr+bMRlnYvxOJzljfuh76y7X2
	f52+AVTnESzU/e+vhIHR7/6ojxCqn6rId6Gtwz4p8/Dijqo7b2JmqGiuL2SpS6TpAF4fj1QJ7hn
	ZDFKxA41z3jDzyNwB8M=
X-Google-Smtp-Source: AGHT+IH3i8v/BrwemmECFyya82qa5WpmpoQwTNEogOS40Upy0/Fstoyzd3BnWRDUcSAESI7APhWcyQ==
X-Received: by 2002:a05:600c:4a01:b0:436:4e4c:7bae with SMTP id 5b1f17b1804b1-4365fca3ba4mr846885e9.1.1734607304693;
        Thu, 19 Dec 2024 03:21:44 -0800 (PST)
Received: from google.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8bb4bcsm1308850f8f.111.2024.12.19.03.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 03:21:44 -0800 (PST)
Date: Thu, 19 Dec 2024 11:21:40 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Quentin Perret <qperret@google.com>
Cc: iommu@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org,
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, vdonnefort@google.com, tabba@google.com,
	danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 11/58] KVM: arm64: pkvm: Add pkvm_udelay()
Message-ID: <Z2QBxPyBsxGNSuzT@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212180423.1578358-12-smostafa@google.com>
 <Z2QADxbdoYi5q9iT@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2QADxbdoYi5q9iT@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_032146_652377_EAB184ED 
X-CRM114-Status: GOOD (  20.28  )
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

On Thu, Dec 19, 2024 at 11:14:23AM +0000, Quentin Perret wrote:
> On Thursday 12 Dec 2024 at 18:03:35 (+0000), Mostafa Saleh wrote:
> > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > 
> > Add a simple delay loop for drivers.
> > 
> > This could use more work. It should be possible to insert a wfe and save
> > power, but I haven't studied whether it is safe to do so with the host
> > in control of the event stream. The SMMU driver will use wfe anyway for
> > frequent waits (provided the implementation can send command queue
> > events).
> 
> Mooh, I'm thoroughly hating that we need this -- pKVM is non preemptible
> so we better not wait for too long.
> 
> I can surely figure it out from the following patches, but could you
> please expand on the use-case?

The driver needs to poll some SMMU MMIO, so it needs to measure time
in terms of udelay to timeout, at the moment its arbitrary set to 100ms.

Thanks,
Mostafa
> 
> On a side note I'm not too worried about the power impact of not having
> a wfe in there, again we better not be spinning for long enough that
> power starts to be noticeable.

