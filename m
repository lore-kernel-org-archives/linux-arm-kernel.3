Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEAFCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoUre0ZHh111UbHEIDXHq8nedRN8EZ+gBdSl0fms4oE=; b=IsUG5lQ1QeCsI5b6knGEEcXcer
	sVSPUJHrPHd3FQIui296l+RzvWlKSQun6Wg4sRvk3qHl8ZZ+1UY9Bq/075Fge4TDmzZgfkfkFu8RI
	05gJfGjk0Z9EoTC12Z0Up0meMLOoGr57NHpmKLMBZwXfYfABqZX7nZSXiWu7m5vjtxBCe0+0ewdpz
	3vFgA47a0boVtdHYYqrm/AjAl0A/gOQWiesp3MJey3RUQ9Q7IK5vBcb/T1KFLCVve0EFjRpKFdYuB
	9GM2BbmE9ra6QZrNB5qJ1wHD70m/KgntHvuqEYT+iEo9jyTXAISeXzgTk2yRWh7TE02XvHf2iApjf
	IsOpSY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLZw-00000001rXn-1e3X;
	Tue, 19 May 2026 14:37:52 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLZu-00000001rXC-1c9o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:37:51 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-50faf8ed9c5so18442271cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779201469; x=1779806269; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xoUre0ZHh111UbHEIDXHq8nedRN8EZ+gBdSl0fms4oE=;
        b=fEhpVl8ZD2+i1CVdHHJ/J6zbVU8LHnlPHbMhlMa9G9jQZHVUXvJEmSZXK605k3euge
         L9WwHT6gPRAq0G+trknSu56xnur12Gzd6eRiThmg+vtXrnhDObuWuLVChLThY6FQRxYv
         tkvPScGaynuZhzwIuneeEcaQFzLQuhEmneUwN/wLE7xro4BdOswq/OXJElItQW1My8rh
         KbKUuuc61dGXCi6/3s+k1sLEm7IrU7LaXjNcU/2kKGvnJ+wHolbXXkXJmhwxXidmEy5h
         gz0wsCgfUlOSeZCg3wlaaVZ7opmHhS4oMh4bn0hYQnY0uBOYRuYPL1HV/9DHUCerpO72
         hgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779201469; x=1779806269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoUre0ZHh111UbHEIDXHq8nedRN8EZ+gBdSl0fms4oE=;
        b=DE8jFoCfsak0ekm/MC8MBalTMUf4emL5X1uEE/ZKDrytiABst9U7ZsIqxaJIgcMw/x
         RWKDIgJSjWbPocj2Aejou9xQofitLh2cdZAE/Uaehv5FMjCqGV14a5XC6c+bimCm4EHx
         uy/+Awqhg9rWIDzPICaoWPjS3heEGLcQ8z+XFk9Lq8NnFyWASf7v/4wjoQHlFh1hspdL
         AAUgMKjuEdWr7xB2jv8FE6N0dr9tz1CHZDqMbIz7DLK4vShv8pH+p7aog6+1Mi0tO5hz
         1YGVwYBWEA6Pw3V8OAy7UfMLWXmrA8FXnC7lS3GiYlMlG8OxvYkzym+TFTjdp8SkM029
         5DvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vy3VczFYuL8e7+CygXMUirEsiU/LlKE3TiqSzFFdPTcagP0bqBehMbvq2RreTL0QUA7YphoAtHiXQOSHdO8bz@lists.infradead.org
X-Gm-Message-State: AOJu0YxepuEFoYDbKqcYNKqKhdqNdpCV3qUpzZd+rXAogJzX8S12BOtU
	GTkcqdv4xEon6y542gewiR/FULDLFUTUPpf+qkmFRvW6tgzR6ZgF/14LgJiSjeE05Qw=
X-Gm-Gg: Acq92OFZkf33a5gpHUcqdweCE4zx54V3jOfh9etKXd1H9AvoP+Vkmj/nZw/osdd90zU
	32mfjJ7kHy4gs7+HaIvVefaA5BM3k6Mb+L2hYxPkMsoJPjToj73LzynMdN3LbjNSh9Rdko/FGpH
	q/ULZZHIVVsUesIhILs7AHyBpg0WpVoSOsbWfv2t+1OMk+J0utyrjpoScTtp71+Gt3LcGrnyqZK
	AO/vUwpnFN4YyFVzYovvPsQ8izfsidlHkyCOw/ZhVTR/jtqj8cqRH/SXbPkMoj/0d6QZ+QFmOEl
	Nse6YzJCJQa0bVJAbDZQPukABhIlUtVmooiSQZQ5DGmFtSmSDXxmvZd77C81uUGzXcW3k+PXR5/
	Z12LsgPNd4ksUkSyhJEM7xBzZRzp0rar+WsDEeOxNVzYyFjCNSgNA8URkZTza6LnT0/mJpWzRTY
	9orqqIbBNwwUqHILukHQEa2h2SG4eRNsZlxkTLMYOEyWP3hKF2AG8hg52ckTWdV1mRO9dWqGh1W
	ovHSbl4WpZ4Q2Wt
X-Received: by 2002:ac8:584d:0:b0:50f:c26d:f31f with SMTP id d75a77b69052e-5165a046334mr283700431cf.19.1779201468969;
        Tue, 19 May 2026 07:37:48 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456b6856sm165713481cf.7.2026.05.19.07.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:37:48 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPLZr-0000000F80e-38LO;
	Tue, 19 May 2026 11:37:47 -0300
Date: Tue, 19 May 2026 11:37:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <20260519143747.GE7702@ziepe.ca>
References: <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <20260519132911.GA7702@ziepe.ca>
 <agxolksC_1nfO34X@google.com>
 <yq5ah5o3sdn3.fsf@kernel.org>
 <agxt7SFGT7OLMIah@google.com>
 <yq5aecj7sctv.fsf@kernel.org>
 <agxzanDBmIP54hUz@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agxzanDBmIP54hUz@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_073750_450703_806A9678 
X-CRM114-Status: GOOD (  10.35  )
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

On Tue, May 19, 2026 at 02:27:54PM +0000, Mostafa Saleh wrote:
> However, as I mentioned to Jason, I think with some tweaks to
> force_dma_unencrypted() we can make it work under pKVM for aligned
> memory which eliminates some of the bouncing.
> I am currently investigating that.

force_dma_unencrypted() literally means that memory passed into the
DMA API *without* DMA_ATTR_CC_SHARED cannot be DMA'd from.

It should not mean anything else. The DMA API should never decrypt
passed in memory. You always have to bounce.

Jason

