Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29619C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 13:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlPMfwZ+C0CQX8CZbIzbwgggxxliwvbZU+YOWu/UjqQ=; b=0PcCJW/kycrsW8VTRaVxU3l8vI
	c08a0qDWzWhenBsf+JrP6ICAtxC692aDhGWz71yVJy13Io/B79mA+PXyPZskWaUox+6WFOSKjNKam
	a+yP2l5IwkO5c0IyVzUy0zExwmUMgYzloJd2OCoEF6Km16yTwJqlRjCDFBGM5qzFZNwwtL0gC2xTh
	ax/vgFRHeHOhCWo39M9v+bB5LN3dHrpIrIyRo44FIh0kc4WM3rBhq9fYG42V6vSdT5V6xAnZinW2h
	Wp1O5NJrt2a0CtIaAwZgCuQ2M4I0laVpPdBJrqTvv9AENYddPAz7P3DXn4N+yBC0b2V4BT5DWUM83
	dpeIchPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td8UL-0000000734K-1bSn;
	Wed, 29 Jan 2025 13:52:17 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td8T1-000000072yj-45ZF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 13:50:57 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso65974506d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 05:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738158654; x=1738763454; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vlPMfwZ+C0CQX8CZbIzbwgggxxliwvbZU+YOWu/UjqQ=;
        b=lD/TQSBuWEOsO/ExIY1DRSr1LMzNK0S4rdRt1Qq4swRwQ1Qbpa9zis9pUwucySdzdF
         dOy/VnI8h+v4le5rc7A1PS/I/mNVFZKvc0UZBKmYOrQq0yOdJuDLFQ2N66bu5Q9vJj1j
         iuxl8d597g0HrEz+AaNV796S8i9lLwnHF41kX4NRgYY626cHGF9cVeh2zI102ymKyR0m
         yiZ/sguGLxEcazKN7kom4poIBGhHaVkcREZEfdQVAu8qONOBBePWuKtVpt5k8el1bVMl
         9Alfkug6QQB9Y/4YcpGJ3ll06Eyy4l8WQqzq0suPQaw2PnLbWqdhvhb/BJX0P7PY/hup
         Mg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738158654; x=1738763454;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vlPMfwZ+C0CQX8CZbIzbwgggxxliwvbZU+YOWu/UjqQ=;
        b=eUxmkcobmJCjtw3G7CxIo9YSRPt16qLqxRKRpaRSpHCpyOFilWX16nq+uTnwjwJhOw
         spB6yVKjwQ52giojZvfWpVnQs2p39bp2k5a/HAqCgjwehQq0m291iKgju3yYCJ+CSMUc
         rJ8m9mGqDA19EHwT816HClgriEyEgRwl9AOgFWHX4kveFiN+g15zuf0swwtZk4wLDPe+
         o/swCOheJyLeNmSVD6sQJvcpNWyMi6mMHbGXjWM+UkyQCwBPpDAuzt45+ZKUrdaamDZy
         WeKR4caFutbAgBuLDGuXcJKaQyewYCE5PcgMuV/rlBv9w1XlNbqV0qiChITIA2RudBAG
         oeYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMXEQc3t9RppDkik3aEjKE5DjijWgsJr7ddqszCu2r+pOELTOSrQgQrg1rTb416J2kMdy54LsJSvAitT0NByj7@lists.infradead.org
X-Gm-Message-State: AOJu0Yya0XCDK3c2v0z8dW5CYwM/MLyIXtP57cuyga5vunAsQW+bpcS4
	SZ8MpTf/Ft9v9hvBVNeVeSdcKLX6iABq4GTf/8mMT2Pu5aV29a34W855Dt74a/o=
X-Gm-Gg: ASbGncukqG+k9vWN1KPrTO8ufUayk/6dMF5SDnhCPWRKpg0OHZxenz62sVxs4MJeOw/
	EG3oeUV9da5FyDqaSp3QXA8e3OpAOf1+4MwJabuubMkYrc1KygLSVAVM+EkgXjkiWRJaQavLlp/
	yUCbhb2aShI+f8QwYKbsLYatJw/oz9msXPchtKLpX/wqgOkmQ91HGLAIVzv07mtdXMlpOUAOwYU
	JAYZOJOyp4DXUYM/UAdeLvE7dD3iMhoD4OTec4nK29BbGRJ9JynQV46cJp975mcWpe9sljTosIb
	Kh9a9JRH6sdWs4GO/I7vWgNWfhm7ZzFkgr47/+JNnuzuu+0AQpusizw3M4IE4zvi
X-Google-Smtp-Source: AGHT+IHlGOABfGzgCS+9RYYlIPNHGozwdrTB/aVN3u/ZTODdcBYH+YEI+HYYcAFunhC+uzQZ0l632A==
X-Received: by 2002:a05:6214:252c:b0:6e0:86ab:4b46 with SMTP id 6a1803df08f44-6e243c63cb9mr63742866d6.31.1738158654377;
        Wed, 29 Jan 2025 05:50:54 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2058c236csm55482536d6.104.2025.01.29.05.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 05:50:53 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1td8Sz-00000009Bm2-1Dp2;
	Wed, 29 Jan 2025 09:50:53 -0400
Date: Wed, 29 Jan 2025 09:50:53 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"robdclark@gmail.com" <robdclark@gmail.com>,
	"joro@8bytes.org" <joro@8bytes.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"nicolinc@nvidia.com" <nicolinc@nvidia.com>,
	"vdonnefort@google.com" <vdonnefort@google.com>,
	"qperret@google.com" <qperret@google.com>,
	"tabba@google.com" <tabba@google.com>,
	"danielmentz@google.com" <danielmentz@google.com>,
	"tzukui@google.com" <tzukui@google.com>
Subject: Re: [RFC PATCH v2 00/58] KVM: Arm SMMUv3 driver for pKVM
Message-ID: <20250129135053.GB2120662@ziepe.ca>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212194119.GA4679@ziepe.ca>
 <Z1yNWI9lBNIZg6Le@google.com>
 <20250102201614.GA26854@ziepe.ca>
 <Z35rEeSVwfZVA9IF@google.com>
 <BN9PR11MB52760686ABB3145E44BAD95A8C1A2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Z5DWag7ZKCPl1Eje@google.com>
 <BN9PR11MB5276B783D518DB354BF58A3C8CE02@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Z5odLXPZPAwu4oqe@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5odLXPZPAwu4oqe@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_055056_012053_F62DD922 
X-CRM114-Status: GOOD (  11.57  )
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

On Wed, Jan 29, 2025 at 12:21:01PM +0000, Mostafa Saleh wrote:
> levels) and can’t be separated from the kernel as that defeats the
> point of KVM, that means that all hypercalls have to be stable ABI,
> same for the shared data, shared structs, types...

Sorry, just trying to understand this sentance, today pkvm has no
stable ABI right? That is the whole point of building it into the
kernel?

Things like the CC world are creating stable ABIs for their pkvm like
environments because they are not built into the kernel? And thus they
take the pain of that?

Jason

