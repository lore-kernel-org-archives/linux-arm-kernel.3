Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E42CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwd2hym8tNSAdXkGE4hZ3iw7DYGozn+untN0aXZ6tZA=; b=Er1Q196j/hlRxzMIB7wSfgtCSO
	GCXpTt74ac7vMP/H2mWxmbqyW/GZD/nFLRNbSWAhG+TBXs47y4FOt4hCy9mP0zIRf3uVMTJDPPxxo
	0xq8dECZduj8GqYMnYPNAOq2Q+CoNvnQK8aWXeeYb9r8KMlRzvbD3gKQZJ5gpz6IXZGkjeIbg+XRj
	/saTGThDPvhTDgoxhuahYwlkr8gWY8ErUBTABTNdOzYqjzdAF+h5JgrbDeZkGmqL0o5EqJ3pBPbut
	RXJGh3Do8oHkoY3VP4t7o2FQSpndTDywpUX76Es9vdIaK6BUNocJO83cDH3UzhCUk8N6VYiPmL/uE
	c8yfAAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuZI-0000000CxBy-0Alp;
	Wed, 17 Sep 2025 15:59:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuZG-0000000CxAu-1o97
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 17 Sep 2025 15:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bwd2hym8tNSAdXkGE4hZ3iw7DYGozn+untN0aXZ6tZA=; b=H5wtAyQJm/q7UCmz1fUEij6mnk
	xs+MHfAFfR0t+dwU9G1y0S+ncGi/OaH3W51bKQjNXZPOFQxpNZXLzoXCzsdDnqUe9WSNXTFMiZQ+9
	RHOB0FHD7dbFivvRcMWq0WXbyTIYCBwIQiwVN2/GlZCboUdli0+temSxEHG0YxF3BtDLr8B1W6TsF
	teZpx/EdG2HpuQB8PQHYtYa35JKzNAAVIXKF2GCkKO0J9aO1DWDTmau46qa/50YucoJsYnmqEIoxM
	r8KfGdKeq+pvpq2FueQ8Rq5VS88XX0GJ2ITB0Y8c4tc48FmeDhL0QrNbfRMadSflOfGXfkGiCEo/a
	vxk9htvA==;
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuZD-00000007Sld-1J7T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:59:37 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6234b298d84so6597eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 08:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758124773; x=1758729573; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bwd2hym8tNSAdXkGE4hZ3iw7DYGozn+untN0aXZ6tZA=;
        b=bQPCKX6tTyYrTVwcgVBWs4GD0qy1o12IeMveHzBdHxMHuZk5Ti0RusBHwhcNBln31I
         wrhsvhbSDKfMTIFNfANJKJVD7og0vpdJKRP+QCyDzMBVruxAnaic5PHq9H40AVNb1MSz
         +J+b5v756w+sawjLi5818Q/6LnEiCYZA8JknLhZfVUBxJkPy46IjoRpW/o+syMvnW1Pv
         JKgw0xziawk1xOO16tFTZVLN3dta1qgPbqia/Q3wtxMLCHwx5nUFvILUOdyJTZvDlACq
         qE5ieTltIBdVvUXEpfeZM0hXxxfNy1aLzVLIXLpbwz+Uk/VMN1uCN51KVNRMVuG68skl
         af7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758124773; x=1758729573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwd2hym8tNSAdXkGE4hZ3iw7DYGozn+untN0aXZ6tZA=;
        b=sGP+hV5X/wUf2sSIQKSb+fzt8z4bkqc1WY1GHgnVD8lUVAfXEcRJCqXJe1YHeqQmEz
         U/un5pbOY3K9dvOO0Emw2ukXKvO/vaYTwbbNs2TGEtURZ3IlX6fT4oU9nOkTz+Zq6yQS
         DvYA4yq+IgaRlQNGgTCKNMDp5Yp6i+VVBLDqMN0pyC7PyrUTZMnvCnMZ23QoWpIBrLnx
         r0499lkiD7A4cAsywyklSr+fhPsQClCXDI55oGIeDsi0lM0CwuNEfjVThzaL4q1pkwYE
         dok8Foa5UDN76CTBG4zOB1Hyjr1PLX11a2cGbpvby2JHC9U7LQhEtmSNpKa8iP9uWT8r
         rNkA==
X-Forwarded-Encrypted: i=1; AJvYcCVeTVVyloBwxP04K1zlDp0vm3f403Paz05gQfay7v0m2BH8vFOFSE/kyjri2yBV7BQkE9vXtZBeFz1czKDkdBEw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5OgS5JxMYrV6k5zu21ypLULdtQgsMDZZ1wzEssVMfOH8R2j2E
	Vt7gX5UwqWAC/QcppVw0Pu4uOGTMq2sTJcb82l/MV9EiinYTXjnMQKl8g2HsgBEI7ZU=
X-Gm-Gg: ASbGnctRrtdWavUIqHDFhNFnDBDVRtmHEPpGc30i3ePHmx0b7PfPb81vYLpTu9DxiYH
	bFdEU76dQ1aceI4tvN45VEfy1T6b+L2a57FKWV1Mu6YHpFRrNb9apAH6omJIARH125aEZgdlyUy
	UEVCq+a4RynL9nRjsFEY32cYWcNp7toMWy4iMimT/h+U3NsjQ3DB22fSjePd1PcHd9CTxmEJPtz
	rcgshpqHNDscRbP3qgs1UkbZVUsba0s/KggnGenDJoVFNFF+9ryHojsMgd20M5o3gkjBzLPCpwy
	mpGuABUxPavoM8VhD+TMhqOwae8OeUwElqGxGsEnR4v+oU+wXMnFg9AabtbBdZrgH2pm8REu
X-Google-Smtp-Source: AGHT+IFPi2deeD5xpECHK4kizIqpzvjT3NpSt1j+SxaGfjDrfDGe9/bYIqtD0y9cjE6AL0d46S51pw==
X-Received: by 2002:a05:6808:4f4b:b0:43b:2829:e642 with SMTP id 5614622812f47-43d50c63332mr1037591b6e.24.1758124772981;
        Wed, 17 Sep 2025 08:59:32 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b828d6909sm4320090b6e.7.2025.09.17.08.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 08:59:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uyuZ9-00000008UmV-28J5;
	Wed, 17 Sep 2025 12:59:31 -0300
Date: Wed, 17 Sep 2025 12:59:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 22/28] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <20250917155931.GI1326709@ziepe.ca>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-23-smostafa@google.com>
 <aMQroI4NDu74PDGT@willie-the-truck>
 <20250915163858.GK882933@ziepe.ca>
 <aMl_5j8G3IGulAC6@google.com>
 <20250917123601.GA1326709@ziepe.ca>
 <aMrNTny9jgZJd_Ef@willie-the-truck>
 <20250917151612.GH1326709@ziepe.ca>
 <aMrS71vQ_MaVonzi@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMrS71vQ_MaVonzi@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_165935_475986_536EA741 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

On Wed, Sep 17, 2025 at 04:25:35PM +0100, Will Deacon wrote:

> Ah right, so the driver would unnecessarily issue CMOs for the structures
> that are just shared with the hypervisor. At least it's _functional_ that
> way, but I'm sure people will complain!

Yes, functional, why would anyone complain? STE and CD manipulation is
not fast path for anything?

Jason

