Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D63CC02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 16:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9hDFjf5DGvpzHigba5X0fDbl6l6sC1pecUGU0oUOE0=; b=JYDUORmDmsD4UxXnBXQbXwlE8y
	IHVMENI3tO/u18+C5ozcwIY49t6XtmYL7QyIKnh1r0vjgjd72rXep3uBN5JDwcGA3G/UBk9bOtcm1
	MsaYPf98zTGHDWe7viuloIe3D045+v3ZlAk36BrwgaWXmjjFwEBagysq8+52UNLm2TRJ8vzr9tMra
	zAikfVgwVPGgBnjPr3ZwSGpu0weMEYuWmyIF8hB2oC7ctcbpkfEeQTWbki9pcykIvyO1nqs7dqSsR
	EGN5y0OzjyMkoLRqI54Uiz9MTakN+jIWPmu3Cvn7Ip7/lSIRYGKPZB42zz0yZ7xV2dUGLbE2ymzGM
	RSyqdDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tadVs-0000000Aha5-1rL1;
	Wed, 22 Jan 2025 16:23:32 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tadTO-0000000Agu9-1l0v
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 16:20:59 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6dccccd429eso64485806d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1737562857; x=1738167657; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T9hDFjf5DGvpzHigba5X0fDbl6l6sC1pecUGU0oUOE0=;
        b=cme467ob9RgxxUS9SEZX8T9M+m0WvwvFEmYWnzdXvx/EGBXdSH63QHBMt4f1pEeV0F
         ZgSKIWZ4MRMTpnCEx7ZAjOd3ijA2KTYjR2eIhYhxOZ7CNDAOVPams6McG+RzGA9Dj/ef
         LjICU6ux0JRRRv2XwMq+mbBANbbTQ0CUA34AfuJ7ADCcz4hUpQtp9LZ2yiHbvDjeRsEq
         DY0COdjidbTFA/fbE9ugIiGCWPhDcX5zo8mACevhWi1Jk+XDzuFD0znuJA3xx/DHzx4O
         CjkdjbD/huHCgjwdClpV0er8e828RL0c0aP6V/K0Cd1rgWpJTfiiWEQ179gr6iXS+PyK
         UPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737562857; x=1738167657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9hDFjf5DGvpzHigba5X0fDbl6l6sC1pecUGU0oUOE0=;
        b=UTNYofYT49zIuLgHbgAzejLHueriKcArf83IuycU1LJL41oe6wBiJXrm76IDyb4XCK
         wdXOlePBfFWuEUhKhFHse6ktScSguTml7jk/qNyjKxsP3JezxXtiAar29eMwQpprXoKV
         0C60arFoRme7wbvSutECM+LqZxRqA1ipTA+vDPiZSZspvA2si3FcspVrZxomzC1w8LP6
         TZx4XDX97RdjisZ3UYWUHiuMMl89lSeSPIwJS0Z80O3rTSsYuAclACNF3zIpWxSpzYwe
         fVAi3qcJBRm3519KCjjsImMlS1z9cq7/3u0H/MMjaIwkE40Evk0shS30ZdAST9g5Jhfc
         AkFg==
X-Forwarded-Encrypted: i=1; AJvYcCX0pOBryhvdwmIW9f5+nHweDRkDcwpIgOzNkfVA2hE/QgRWBy0OkQJQYB7+kj2NL+AiWeY2S34hZtnc6mJIetYC@lists.infradead.org
X-Gm-Message-State: AOJu0YxnHSXM1EGKrFX27fgcbq4ojTVBsnqKzOiltzYFDHsenSJ3ZJlx
	AhEvGAebd+m1YhTrqqU130U0RFWTchtH3QwkqRLwBTQKntLyYXWimHGGl3+h/yI=
X-Gm-Gg: ASbGnct/Yh9v0rXD7Khu5P1zjHe/NwhhQdzPuz9DsB5nO0Lt9VVmNp5Ptl87ozJTuuv
	caO+LlNu3zdb13+2F6vp11CTHQjZKvXDO6xJAUO3boqO1vQo1i7SXK6+dKCJSc+GJPcKi8FsQCU
	JEDmBpkJc9MswE7Hdad7tKjzYko6PLSvnkHLwWYHICoSsytRlR6HUsW6fdwjG7icGsPThQ6LbBa
	x47dXwVJITa+xSsJ5oTzwSEF6vhUfbGSa9qCdJE78sXh9/Q3gsHCGeefotJ29ioCHIrhsOAY1tF
	337q2eFk2z6KIOzbR4bXazuyNvUlCPr/WDACGYqd8Jc=
X-Google-Smtp-Source: AGHT+IEO4sjsfZ98DUdmFnOpRcKd5hBontzItCkyvXoYAGu8ZhSlBVq4j7OqBMeWhGsiwNzwffbF2Q==
X-Received: by 2002:a0c:bf44:0:b0:6e1:f40c:b558 with SMTP id 6a1803df08f44-6e1f40cb631mr18093296d6.44.1737562856988;
        Wed, 22 Jan 2025 08:20:56 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc23080sm61987686d6.54.2025.01.22.08.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 08:20:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tadTL-00000003qLW-46Wn;
	Wed, 22 Jan 2025 12:20:55 -0400
Date: Wed, 22 Jan 2025 12:20:55 -0400
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
Message-ID: <20250122162055.GV674319@ziepe.ca>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212194119.GA4679@ziepe.ca>
 <Z1yNWI9lBNIZg6Le@google.com>
 <20250102201614.GA26854@ziepe.ca>
 <Z35rEeSVwfZVA9IF@google.com>
 <BN9PR11MB52767756EE35DA2359C351F08C1A2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20250116191455.GC674319@ziepe.ca>
 <BN9PR11MB52766732572A17627D16CBAC8C1B2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Z5DQuNn3GoU1vYPV@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5DQuNn3GoU1vYPV@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_082058_455608_32DDC548 
X-CRM114-Status: GOOD (  13.66  )
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

On Wed, Jan 22, 2025 at 11:04:24AM +0000, Mostafa Saleh wrote:
> AFAIK, the most common use cases would be:
> - Devices using DMA API because it requires a lot of memory to be
>   contiguous in IOVA, which is hard to do with identity

This is not a feature of the DMA API any driver should rely on .. Are
you aware of one that does?

> - Devices with security requirements/constraints to be isolated from the
>   rest of the system, also using DMA API

This is real, but again, in a mobile context does this even exist? It isn't
like there are external PCIe ports that need securing on a phone?

> - VFIO is something we are looking at the moment and have prototyped with
>   pKVM, and it should be supported soon in Android (only for platform
>   devices for now)

Yes, this makes sense

Jason

